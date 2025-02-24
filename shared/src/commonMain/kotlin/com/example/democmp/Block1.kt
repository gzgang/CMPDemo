package com.example.democmp

import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.sizeIn
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.Card
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.clipToBounds
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import democmp.shared.generated.resources.Res
import democmp.shared.generated.resources.v_changjinghu
import org.jetbrains.compose.resources.painterResource

@Composable
fun CardDemoSimple() {
    Row(modifier = Modifier.fillMaxWidth().padding(horizontal = 10.dp, vertical = 0.dp), horizontalArrangement = Arrangement.spacedBy(10.dp)) {
        BlockView1(Modifier.weight(1f).wrapContentHeight())

        BlockView1(Modifier.weight(1f).wrapContentHeight())
    }
}

@Composable
fun CardDemo() {
    LazyRow(
        modifier = Modifier.fillMaxWidth().wrapContentHeight().padding(start = 10.dp, end = 10.dp),
        horizontalArrangement = Arrangement.spacedBy(10.dp)
    ) {

        items(20, key = { index -> "$index" }, contentType = { index -> 100 }) {

            BlockView1(Modifier.width(160.dp).wrapContentHeight())
        }
    }
}


@Composable
fun BlockView1(modifier: Modifier) {
    val clickCount = remember {
        mutableStateOf(0)
    }

    val showDialog = remember {
        mutableStateOf(false)
    }

    if (showDialog.value) {
        showDialogImpl() {
            showDialog.value = false
        }
    }

    Column(
        modifier = modifier.fillMaxWidth()
            .clickable(enabled = true, interactionSource = null, indication = null,
                onClick = {
                    println("click block")
                    showDialog.value = true
                    clickCount.value ++
                })
    ) {
        Image(
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(0.75f)
                .clip(RoundedCornerShape(12.dp))
                .clipToBounds(),
            painter = painterResource(Res.drawable.v_changjinghu),
            contentScale = ContentScale.Crop,
            contentDescription = "poster",
        )

        Text(
            "长津湖 Compose ${clickCount.value}",
            modifier = Modifier.padding(start = 2.dp, top = 4.dp, bottom = 4.dp, end = 2.dp),
            fontSize = 16.sp,
            color = Color.Black
        )
    }
}

@Composable
private fun showDialogImpl(onDismiss: () -> Unit) {
    val contentScrollState = rememberScrollState()

    Dialog(onDismissRequest = {
        onDismiss()
    }, content = {
        Card(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(16.dp),
            backgroundColor = Color.White
        ) {
            Column(modifier = Modifier.fillMaxWidth()) {
                Box(
                    modifier = Modifier.fillMaxWidth().height(45.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text("提示", fontSize = 21.sp, fontWeight = FontWeight.Bold)
                }

                Spacer(
                    modifier = Modifier.fillMaxWidth().height(0.5.dp)
                        .background(color = Color(0x1A000000))
                )

                Column(
                    modifier = Modifier.fillMaxWidth().padding(horizontal = 8.dp, vertical = 4.dp)
                        .sizeIn(minHeight = 120.dp, maxHeight = 240.dp)
                        .verticalScroll(contentScrollState)
                ) {

                    Text("这是一个Compose弹窗")
                }

                Spacer(
                    modifier = Modifier.fillMaxWidth().height(0.5.dp)
                        .background(color = Color(0x1A000000))
                )

                Row {
                    Box(
                        modifier = Modifier.fillMaxWidth().height(45.dp).clickable(
                            interactionSource = null,
                            indication = null,
                            enabled = true,
                            onClick = {
                                onDismiss()
                            }),
                        contentAlignment = Alignment.Center
                    ) {
                        Text("取消", fontSize = 19.sp, fontWeight = FontWeight.Bold)
                    }
                }
            }
        }
    })
}