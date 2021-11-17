Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEAA4546DA
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 14:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235235AbhKQNJt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 08:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbhKQNJt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 08:09:49 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AA3C061570;
        Wed, 17 Nov 2021 05:06:50 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 213261F45CAA
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637154409; bh=fkjDwUt5aIF7ZYKWMjK2FWkQxgVnsFK/2/jn4p1kTCk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LBNxrvJdnwH4QXxfJdLoxQ/IcqSV42d7mSOuNYJKvbj0Tc/Q5YMiW2KHRED3o6+p1
         eMf/S38jHUfZnOj8NTpujOd+X2q81+HVjQpelIl3SBHaxNS8ypsSTJY+77zL/0AKOj
         G3ptQarhF+gCfxpBwPOb49PnW6tkqM8FEmcVNA+vcFQyc5Z661dwoC1X7DqjGaCVvo
         EAlPKke3eS1DGoOQXEImHwue8pmP0qr7NBaOiQCveeEridyEDrmorEGeteLKFE6jCT
         njjGfmS7tJ+Bg+wVU9jYBDghatyV7D+NOi1k4yzgZif2/qOCTcF1lulSnoRzt2DmLg
         +i3BoHwF93Isw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, acourbot@chromium.org,
        andrew-ct.chen@mediatek.com, courbot@chromium.org,
        dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
        hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
        mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
        tiffany.lin@mediatek.com
Subject: [PATCH v2 1/7] media: mtk-vcodec: enc: add vp8 profile ctrl
Date:   Wed, 17 Nov 2021 15:06:29 +0200
Message-Id: <20211117130635.11633-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order for the encoder to work with gstreamer
it needs to have the V4L2_CID_MPEG_VIDEO_VP8_PROFILE
ctrl. This patch adds that ctrl with only profile 0
supported.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8998244ea671..87a5114bf680 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -103,6 +103,13 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl *ctrl)
 		p->gop_size = ctrl->val;
 		ctx->param_change |= MTK_ENCODE_PARAM_GOP_SIZE;
 		break;
+	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
+		/*
+		 * FIXME - what vp8 profiles are actually supported?
+		 * The ctrl is added (with only profile 0 supported) for now.
+		 */
+		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_VP8_PROFILE val = %d", ctrl->val);
+		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME");
 		p->force_intra = 1;
@@ -1394,6 +1401,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_H264_LEVEL,
 			       h264_max_level,
 			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
+	v4l2_ctrl_new_std_menu(handler, ops, V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
+			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0, V4L2_MPEG_VIDEO_VP8_PROFILE_0);
+
 
 	if (handler->error) {
 		mtk_v4l2_err("Init control handler fail %d",
-- 
2.17.1

