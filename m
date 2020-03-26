Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A66A619488A
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 21:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgCZUQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 16:16:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52850 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727879AbgCZUQe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 16:16:34 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:113f:ad1c:b024:988e:8796:31a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 187DE297A76;
        Thu, 26 Mar 2020 20:16:33 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 4/4] media: staging: rkisp1: cap: remove unsupported formats
Date:   Thu, 26 Mar 2020 21:16:10 +0100
Message-Id: <20200326201610.31762-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326201610.31762-1-dafna.hirschfeld@collabora.com>
References: <20200326201610.31762-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For Ycbcr packed formats only YUYV can be supported by
the driver. This patch removes the other formats.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 2d274e8f565b..076335193f40 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -98,15 +98,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.fmt_type = RKISP1_FMT_YUV,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
-	}, {
-		.fourcc = V4L2_PIX_FMT_YVYU,
-		.fmt_type = RKISP1_FMT_YUV,
-		.uv_swap = 1,
-		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
-	}, {
-		.fourcc = V4L2_PIX_FMT_VYUY,
-		.fmt_type = RKISP1_FMT_YUV,
-		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.fmt_type = RKISP1_FMT_YUV,
@@ -234,18 +225,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
-	}, {
-		.fourcc = V4L2_PIX_FMT_YVYU,
-		.fmt_type = RKISP1_FMT_YUV,
-		.uv_swap = 1,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
-	}, {
-		.fourcc = V4L2_PIX_FMT_VYUY,
-		.fmt_type = RKISP1_FMT_YUV,
-		.uv_swap = 1,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.fmt_type = RKISP1_FMT_YUV,
-- 
2.17.1

