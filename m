Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC0F18A9FB
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 01:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgCSArR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 20:47:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47832 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSArQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 20:47:16 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C90A3AC0;
        Thu, 19 Mar 2020 01:47:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584578833;
        bh=t//QKgx8j40kBlNhFhrOancZrZPaOlqCCuR4YW+nm/4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fh/RzErHpj+l+hS6RXV7OIUA+N7xLjjmNMDCSO3bxea+0HV6KFXLfJjj9gR3DK8N5
         gXA3LY0XfG9sntpLpr8bGlo9sd9U4DCYUJT0roNr6VOYgHUZMKeukujKUouBQngfIN
         w45hoklES0ZlGPeESuAauaID2NYrn+imXW2+E5pU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 3/5] rcar-vin: Make use of V4L2_CAP_IO_MC
Date:   Thu, 19 Mar 2020 02:46:59 +0200
Message-Id: <20200319004701.30416-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
References: <20200319004701.30416-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
vidioc_enum_input, vidioc_g_input and vidioc_s_input callbacks for the
media controller enabled part of the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5ff565e76bca..f062251250fb 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -751,18 +751,6 @@ static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
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
@@ -770,10 +758,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
 	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
 	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
 
-	.vidioc_enum_input		= rvin_mc_enum_input,
-	.vidioc_g_input			= rvin_g_input,
-	.vidioc_s_input			= rvin_s_input,
-
 	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
 	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
 	.vidioc_querybuf		= vb2_ioctl_querybuf,
@@ -945,6 +929,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
 	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
 
 	if (vin->info->use_mc) {
+		vdev->device_caps |= V4L2_CAP_IO_MC;
 		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
 	} else {
 		vdev->ioctl_ops = &rvin_ioctl_ops;
-- 
Regards,

Laurent Pinchart

