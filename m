Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1E61388BD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 00:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387478AbgALXZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Jan 2020 18:25:25 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:3478 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387475AbgALXZZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Jan 2020 18:25:25 -0500
X-Halon-ID: ce4ffd7b-3592-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ce4ffd7b-3592-11ea-a00b-005056917a89;
        Mon, 13 Jan 2020 00:25:23 +0100 (CET)
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
Subject: [PATCH v3 4/5] rcar-vin: Make use of V4L2_CAP_IO_MC
Date:   Mon, 13 Jan 2020 00:24:57 +0100
Message-Id: <20200112232458.2844506-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200112232458.2844506-1-niklas.soderlund+renesas@ragnatech.se>
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
2.24.1

