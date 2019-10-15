Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C617ED78C3
	for <lists+linux-media@lfdr.de>; Tue, 15 Oct 2019 16:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732816AbfJOOhE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Oct 2019 10:37:04 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:2973 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732751AbfJOOhB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Oct 2019 10:37:01 -0400
X-Halon-ID: 0e5e58b1-ef59-11e9-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 0e5e58b1-ef59-11e9-837a-0050569116f7;
        Tue, 15 Oct 2019 16:35:39 +0200 (CEST)
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
Subject: [PATCH 2/3] rcar-vin: Make use of V4L2_CAP_IO_MC
Date:   Tue, 15 Oct 2019 16:35:51 +0200
Message-Id: <20191015143552.317669-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
References: <20191015143552.317669-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
enum, get and set input callbacks for the media controller enabled mode
of the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9a9b89c0dc0b3be4..dfcf60d7523e3f4f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -714,18 +714,6 @@ static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int rvin_mc_enum_input(struct file *file, void *priv,
-			      struct v4l2_input *i)
-{
-	if (i->index != 0)
-		return -EINVAL;
-
-	i->type = V4L2_INPUT_TYPE_CAMERA;
-	strscpy(i->name, "Camera", sizeof(i->name));
-
-	return 0;
-}
-
 static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_querycap		= rvin_querycap,
 	.vidioc_try_fmt_vid_cap		= rvin_mc_try_fmt_vid_cap,
@@ -733,10 +721,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
-	.vidioc_enum_input		= rvin_mc_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
-
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
@@ -908,6 +892,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
 	if (vin->info->use_mc) {
+		vdev->device_caps |= V4L2_CAP_IO_MC;
 		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 	} else {
 		vdev->ioctl_ops = &rvin_ioctl_ops;
-- 
2.23.0

