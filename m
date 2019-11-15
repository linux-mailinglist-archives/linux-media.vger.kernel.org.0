Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4D6FFE8E8
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2019 00:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbfKOX5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Nov 2019 18:57:13 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:51295 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727406AbfKOX5M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Nov 2019 18:57:12 -0500
X-Halon-ID: a23dc60c-0803-11ea-a0b9-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a23dc60c-0803-11ea-a0b9-005056917f90;
        Sat, 16 Nov 2019 00:57:09 +0100 (CET)
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
Subject: [PATCH v2 3/6] staging/intel-ipu3: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
Date:   Sat, 16 Nov 2019 00:55:56 +0100
Message-Id: <20191115235559.806041-4-niklas.soderlund+renesas@ragnatech.se>
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

The driver only has a single input and output, use the default handler.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 30 --------------------------
 1 file changed, 30 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 3c7ad1eed4343a2a..5f8ad5996aa37db4 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -856,18 +856,6 @@ static int imgu_vidioc_enum_input(struct file *file, void *fh,
 	return 0;
 }
 
-static int imgu_vidioc_g_input(struct file *file, void *fh, unsigned int *input)
-{
-	*input = 0;
-
-	return 0;
-}
-
-static int imgu_vidioc_s_input(struct file *file, void *fh, unsigned int input)
-{
-	return input == 0 ? 0 : -EINVAL;
-}
-
 static int imgu_vidioc_enum_output(struct file *file, void *fh,
 				   struct v4l2_output *output)
 {
@@ -879,20 +867,6 @@ static int imgu_vidioc_enum_output(struct file *file, void *fh,
 	return 0;
 }
 
-static int imgu_vidioc_g_output(struct file *file, void *fh,
-				unsigned int *output)
-{
-	*output = 0;
-
-	return 0;
-}
-
-static int imgu_vidioc_s_output(struct file *file, void *fh,
-				unsigned int output)
-{
-	return output == 0 ? 0 : -EINVAL;
-}
-
 /******************** function pointers ********************/
 
 static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
@@ -966,12 +940,8 @@ static const struct v4l2_ioctl_ops imgu_v4l2_ioctl_ops = {
 	.vidioc_try_fmt_vid_out_mplane = imgu_vidioc_try_fmt,
 
 	.vidioc_enum_output = imgu_vidioc_enum_output,
-	.vidioc_g_output = imgu_vidioc_g_output,
-	.vidioc_s_output = imgu_vidioc_s_output,
 
 	.vidioc_enum_input = imgu_vidioc_enum_input,
-	.vidioc_g_input = imgu_vidioc_g_input,
-	.vidioc_s_input = imgu_vidioc_s_input,
 
 	/* buffer queue management */
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
-- 
2.24.0

