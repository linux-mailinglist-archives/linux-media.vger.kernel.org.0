Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3CC22B060
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 15:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729115AbgGWNV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 09:21:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48546 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729139AbgGWNVZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 09:21:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E1F4A298A42
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 10/10] media: staging: rkisp1: fix configuration for GREY pixelformat
Date:   Thu, 23 Jul 2020 15:20:14 +0200
Message-Id: <20200723132014.4597-11-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch changes the device configuration to support capture
of V4L2_PIX_FMT_GREY video. The 'write_format' field of the format
description should be planar.
Also the array 'pixm->plane_fmt' that describes the planes should
be memset to 0 before filling it since the the cb, cr planes should
be 0.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index a5e2521577dd..b6f9335c16e9 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -116,7 +116,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* yuv420 */
@@ -240,7 +240,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 	{
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
@@ -1050,6 +1050,7 @@ rkisp1_fill_pixfmt(struct v4l2_pix_format_mplane *pixm,
 	unsigned int i;
 	u32 stride;
 
+	memset(pixm->plane_fmt, 0, sizeof(pixm->plane_fmt));
 	info = v4l2_format_info(pixm->pixelformat);
 	pixm->num_planes = info->mem_planes;
 	stride = info->bpp[0] * pixm->width;
-- 
2.17.1

