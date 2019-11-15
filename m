Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDC7FE8EE
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfKOX5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:18 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:51337 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727436AbfKOX5R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:17 -0500
X-Halon-ID: a4fd2244-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a4fd2244-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:14 +0100 (CET)
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
Subject: [PATCH v2 5/6] rcar-vin: Make use of V4L2_CAP_IO_MC
Date:   Sat, 16 Nov 2019 00:55:58 +0100
Message-Id: <20191115235559.806041-6-niklas.soderlund+renesas@ragnatech.se>
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

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
enum input callbacks for the media controller enabled mode of the
driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 6c6465e61657b390..83f757123ef8f468 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -736,18 +736,6 @@ static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
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
@@ -755,8 +743,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
-	.vidioc_enum_input		= rvin_mc_enum_input,
-
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
@@ -928,6 +914,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
 	if (vin->info->use_mc) {
+		vdev->device_caps |= V4L2_CAP_IO_MC;
 		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 	} else {
 		vdev->ioctl_ops = &rvin_ioctl_ops;
-- 
2.24.0

