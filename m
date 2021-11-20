Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3889457D36
	for <lists+linux-media@lfdr.de>; Sat, 20 Nov 2021 12:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhKTLGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Nov 2021 06:06:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50654 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230511AbhKTLGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Nov 2021 06:06:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 6933B1F471F8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637406188; bh=/yaxNi5WXKqxtgoG4SFS3TtBYRjfUBUMEnu1sWiUToY=;
        h=From:To:Cc:Subject:Date:From;
        b=RptTA3Yg2U1kFoIPcXJXOnyf7ffKl87xyHsvICb8CzTGV2s0a1NX2rST24kxx5OTu
         4ZVBIfE8I5gdUMjToaJbYAQQXYbVmmrilKxL7MRY3sxeBbBvaQPErgksTPgxCSnjcS
         3mruk00O9w3gWDuWZz7WiiDuVi/SkePwWKQ56PrEYoMm2/cjq8Jobj+7pto/ymRCFy
         L8Hr0tUbxZLDSkJatooZ8ASzkbeLOInhYdbObcksfdBdgDa4GROXbysTx1OjAepxLm
         OzgvXmrgt09c1oVTw31oTxL9OCAKHgDVC2T5LWGvhgN3XNcdDRmJxeNorq1KTr0cPy
         LPPuOCLFbG1cw==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH] media: rkisp1: remove support for V4L2_PIX_FMT_GREY
Date:   Sat, 20 Nov 2021 13:02:57 +0200
Message-Id: <20211120110257.22775-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When trying to stream on both mainpatch and selfpatch
with grey format, I get an iommu page fault.
The fault is on the address at the end of the buffer,
so it seems that the device is somehow wrongly
configured and thinks there is another plane.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../platform/rockchip/rkisp1/rkisp1-capture.c     | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
index 768987d5f2dd..7f78f361dd5e 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
@@ -116,13 +116,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
-	/* yuv400 */
-	{
-		.fourcc = V4L2_PIX_FMT_GREY,
-		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	},
 	/* yuv420 */
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
@@ -244,14 +237,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
-	/* yuv400 */
-	{
-		.fourcc = V4L2_PIX_FMT_GREY,
-		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	},
 	/* rgb */
 	{
 		.fourcc = V4L2_PIX_FMT_XBGR32,
-- 
2.17.1

