Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0765547AD
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355077AbiFVIhQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 04:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355060AbiFVIgt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 04:36:49 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B7A3968A
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 01:36:33 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id s37so15439611pfg.11
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZI6IRKv/1M7BXbHSPMa00nJwbsV4QFvX5o92GLiXk1o=;
        b=N+NpuL77EOcrKXgBZ45XDlbj5I3yM0UFqtJxGaahAZ8Wx89F01SaD+G1GOkutIyhx+
         l20Efp85t9j7TDjqlpW+sOsgV2b3xUZCVj56vs7+42OOLH9eDVs2t3T3R2HbIHgzsj7q
         33mVuc1nmUQEi+4kStQ1l+TzzXkDmmm9jzn3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZI6IRKv/1M7BXbHSPMa00nJwbsV4QFvX5o92GLiXk1o=;
        b=lg1lY7wXKcgnsy0YSpvbxuTJVI3ncSlTw0JpTbeyLHY327U/E3hxPYEWm8RgXM7Dmw
         ycWmmHjFd8NUgpRKiGMTHKSIYNwRnKtsDPjLIZsLZc+/dBFiLY9PynW1vXqErzWkxOfE
         AckSfbTJH3QZl5iEpiP6DzKHuV8d1P0abw4sQPtiWbqOjxXlgr2PcjWsj0aRnDT5OrXD
         OOroxS0ReGS+WQaLAw9p9CENWa6TdD4a9tVKTZFHEc8fHiAiknuZRxPaHYyPhgpSqM5L
         +Y8sjZqXqyltCBQN/4BADcC8wENVkgwT1gp1jTK9/gSxL+MV+9bJOJ+ZAsn5SAKYSFIp
         L4uQ==
X-Gm-Message-State: AJIora9iuAAMrlO8lTAlZ4pf7be88AkyTjAjD2C/3IWh6PXhVz0nTNkR
        my0LyVZ6uxaYJ3g1uXy5FPq/hl4WyzE+DA==
X-Google-Smtp-Source: AGRyM1vTnzCwyi5ofRR4dIu8Nmfc+FqdipnpPgjS05miF0S5KhzeomRRUQhcE/ypY3ePjLG+UCDvaw==
X-Received: by 2002:a63:6b82:0:b0:3fd:1865:a783 with SMTP id g124-20020a636b82000000b003fd1865a783mr1947523pgc.500.1655886992409;
        Wed, 22 Jun 2022 01:36:32 -0700 (PDT)
Received: from hiroh2.tok.corp.google.com ([2401:fa00:8f:203:292c:e4df:1d1b:cc8e])
        by smtp.gmail.com with ESMTPSA id i19-20020aa78b53000000b00525167c5ab5sm7619234pfd.81.2022.06.22.01.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 01:36:31 -0700 (PDT)
From:   Hirokazu Honda <hiroh@chromium.org>
To:     linux-media@vger.kernel.org
Cc:     Irui.Wang@mediatek.com, stevecho@chromium.org,
        Hirokazu Honda <hiroh@chromium.org>
Subject: [PATCH] media: mediatek: vcodec: Report supported bitrate modes
Date:   Wed, 22 Jun 2022 17:36:24 +0900
Message-Id: <20220622083624.3204916-1-hiroh@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media driver supports constant bitrate mode only.
The supported rate control mode is reported through querymenu() and
s_ctrl() fails if non constant bitrate mode (e.g. VBR) is requested.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_enc.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index c21367038c34..98d451ce2545 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -50,6 +50,14 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	switch (ctrl->id) {
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE_MODE val= %d",
+			       ctrl->val);
+		if (ctrl->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
+			mtk_v4l2_err("Unsupported bitrate mode =%d", ctrl->val);
+			ret = -EINVAL;
+		}
+		break;
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val = %d",
 			       ctrl->val);
@@ -1373,6 +1381,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
 			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
+			       0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
 
 
 	if (handler->error) {
-- 
2.37.0.rc0.104.g0611611a94-goog

