Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98E743798F
	for <lists+linux-media@lfdr.de>; Fri, 22 Oct 2021 17:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233324AbhJVPGm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Oct 2021 11:06:42 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbhJVPGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Oct 2021 11:06:38 -0400
Received: from guri.fritz.box (unknown [IPv6:2a02:810a:880:f54:50fa:5c7d:20f4:e8d3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 51CDB1F412A8;
        Fri, 22 Oct 2021 16:04:18 +0100 (BST)
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
Subject: [PATCH 1/3] media: mtk-vcodec: enc: add vp8 profile ctrl
Date:   Fri, 22 Oct 2021 17:04:08 +0200
Message-Id: <20211022150410.29335-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
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

