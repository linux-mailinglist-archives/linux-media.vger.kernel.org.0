Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839D121611A
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 23:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbgGFVyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 17:54:37 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:19208 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGFVyg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 17:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=from:subject:in-reply-to:references:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=cwF57Yd3nZtjPAkGbWz1sj11wL8vtzFB8jLVo6QFcIM=;
        b=ZnsptEwt5pk9pQUUQHZnrPCxrlJvV+eFjTyh1ZD2Km2EfnA6etRAM9ci095i2iX274kw
        JqmldnNPnoJ7rpPoqky+64n47oh5tPjVWsaAyp9ldu7XMImg0Nslxaz/zTHbmGZQ+OrOel
        Yiwo0ePnEgtTrKU3udyk36z/3+Y5yRq6M=
Received: by filterdrecv-p3iad2-5b55dcd864-n86tl with SMTP id filterdrecv-p3iad2-5b55dcd864-n86tl-21-5F039D9A-2C
        2020-07-06 21:54:34.700927518 +0000 UTC m=+881118.466369360
Received: from bionic.localdomain (unknown)
        by ismtpd0008p1lon1.sendgrid.net (SG) with ESMTP
        id b1_Boy5iS3SQY-lAi3uGrA
        Mon, 06 Jul 2020 21:54:34.331 +0000 (UTC)
From:   Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 03/12] media: rkvdec: h264: Validate and use pic width and
 height in mbs
Date:   Mon, 06 Jul 2020 21:54:34 +0000 (UTC)
Message-Id: <20200706215430.22859-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200706215430.22859-1-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
 <20200706215430.22859-1-jonas@kwiboo.se>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h9qXHT5HF1Lnoqt7i?=
 =?us-ascii?Q?s33+HITW1dRwIOmFbYeLljfuRRo1rVg5ZzV=2Ft65?=
 =?us-ascii?Q?2lKedAkyvqU9lOpy+i46k2Wq6oCefRoj=2FmUHcLg?=
 =?us-ascii?Q?rZqUsRKRbfIcDaQvUHsBWlegHjsEeSw8PHRs1CB?=
 =?us-ascii?Q?oV7qZSG4fu=2FqnZ1I+d4Aeu5VPCbrmj6WWwfHt+h?=
 =?us-ascii?Q?BX5bwgftZe+PU4JTr2VBw=3D=3D?=
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jonas Karlman <jonas@kwiboo.se>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The width and height in mbs is currently configured based on OUTPUT buffer
resolution, this works for frame pictures but can cause issues for field
pictures.

When frame_mbs_only_flag is 0 the height in mbs should be height of
the field instead of height of frame.

Validate pic_width_in_mbs_minus1 and pic_height_in_map_units_minus1
against OUTPUT buffer resolution and use these values to configure HW.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- Validate against coded_fmt instead of decoded_fmt
- Validation moved to rkvdec_try_ctrl
---
 drivers/staging/media/rkvdec/rkvdec-h264.c |  4 ++--
 drivers/staging/media/rkvdec/rkvdec.c      | 10 ++++++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
index f0cfed84d60d..3498e9eec3d8 100644
--- a/drivers/staging/media/rkvdec/rkvdec-h264.c
+++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
@@ -672,8 +672,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 		  LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_DELTA_PIC_ORDER_ALWAYS_ZERO),
 		  DELTA_PIC_ORDER_ALWAYS_ZERO_FLAG);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.width, 16), PIC_WIDTH_IN_MBS);
-	WRITE_PPS(DIV_ROUND_UP(ctx->coded_fmt.fmt.pix_mp.height, 16), PIC_HEIGHT_IN_MBS);
+	WRITE_PPS(sps->pic_width_in_mbs_minus1 + 1, PIC_WIDTH_IN_MBS);
+	WRITE_PPS(sps->pic_height_in_map_units_minus1 + 1, PIC_HEIGHT_IN_MBS);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY),
 		  FRAME_MBS_ONLY_FLAG);
 	WRITE_PPS(!!(sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD),
diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index 4ab8f7e0566b..7a9f78bc0a55 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -29,8 +29,11 @@
 
 static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 {
+	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
+
 	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS) {
 		const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p;
+		unsigned int width, height;
 		/*
 		 * TODO: The hardware supports 10-bit and 4:2:2 profiles,
 		 * but it's currently broken in the driver.
@@ -45,6 +48,13 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (sps->bit_depth_luma_minus8 != 0)
 			/* Only 8-bit is supported */
 			return -EINVAL;
+
+		width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
+		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+		if (width > ctx->coded_fmt.fmt.pix_mp.width ||
+		    height > ctx->coded_fmt.fmt.pix_mp.height)
+			return -EINVAL;
 	}
 	return 0;
 }
-- 
2.17.1

