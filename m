Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51572FE8E7
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfKOX5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:12 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:51269 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727431AbfKOX5L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:11 -0500
X-Halon-ID: a19a300c-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a19a300c-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:08 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/6] rcar-vin: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
Date:   Sat, 16 Nov 2019 00:55:55 +0100
Message-Id: <20191115235559.806041-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191115235559.806041-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver only has a single input, use the default handler.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9e2e63ffcc47acad..6c6465e61657b390 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -489,19 +489,6 @@ static int rvin_enum_input(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_g_input(struct file *file, void *priv, unsigned int *i)
-{
-	*i = 0;
-	return 0;
-}
-
-static int rvin_s_input(struct file *file, void *priv, unsigned int i)
-{
-	if (i > 0)
-		return -EINVAL;
-	return 0;
-}
-
 static int rvin_querystd(struct file *file, void *priv, v4l2_std_id *a)
 {
 	struct rvin_dev *vin = video_drvdata(file);
@@ -667,8 +654,6 @@ static const struct v4l2_ioctl_ops rvin_ioctl_ops = {
 	.vidioc_g_pixelaspect		= rvin_g_pixelaspect,
 
 	.vidioc_enum_input		= rvin_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
 
 	.vidioc_dv_timings_cap		= rvin_dv_timings_cap,
 	.vidioc_enum_dv_timings		= rvin_enum_dv_timings,
@@ -771,8 +756,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
 	.vidioc_enum_input		= rvin_mc_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
 
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
-- 
2.24.0

