Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C57925B0C9
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbgIBQK5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:53932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728264AbgIBQKw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:52 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6EAA21534;
        Wed,  2 Sep 2020 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=0QtwpM2+k4SGeByY3Ftq2AvC2KycTDYtoRM0Sll0Zyo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O1UuCkxMnSHGR3+e2CxTm1Bscn95rjUO2I/9ujqY8rlD4cy8QWC73JtWyRo8b+V38
         3vzz9lSPfHDk17cPuPCv7lHJPqy3kFlXOmXNfeFSp0xYEYrV4OxYzPy6N5tpTgGM7a
         xidpW4EfMziDy0I08qcUd2U6eYtBX/wz/2Pku9p0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLP-000tAB-V6; Wed, 02 Sep 2020 18:10:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/38] media: vivid: place dt timings init code on a separate function
Date:   Wed,  2 Sep 2020 18:10:15 +0200
Message-Id: <b41823d40e3b862714ee4c4591649b5a89a5649a.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Move those out of the big vivid_create_instance() function.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index e3ffc2566623..3340b61e68c0 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -1177,6 +1177,48 @@ static void vivid_disable_unused_ioctls(struct vivid_dev *dev,
 	v4l2_disable_ioctl(&dev->touch_cap_dev, VIDIOC_ENUM_FRAMEINTERVALS);
 }
 
+static int vivid_init_dv_timings(struct vivid_dev *dev)
+{
+	int i;
+
+	while (v4l2_dv_timings_presets[dev->query_dv_timings_size].bt.width)
+		dev->query_dv_timings_size++;
+
+	/*
+	 * Create a char pointer array that points to the names of all the
+	 * preset timings
+	 */
+	dev->query_dv_timings_qmenu = kmalloc_array(dev->query_dv_timings_size,
+						    sizeof(char *), GFP_KERNEL);
+	/*
+	 * Create a string array containing the names of all the preset
+	 * timings. Each name is max 31 chars long (+ terminating 0).
+	 */
+	dev->query_dv_timings_qmenu_strings =
+		kmalloc_array(dev->query_dv_timings_size, 32, GFP_KERNEL);
+
+	if (!dev->query_dv_timings_qmenu ||
+	    !dev->query_dv_timings_qmenu_strings)
+		return -ENOMEM;
+
+	for (i = 0; i < dev->query_dv_timings_size; i++) {
+		const struct v4l2_bt_timings *bt = &v4l2_dv_timings_presets[i].bt;
+		char *p = dev->query_dv_timings_qmenu_strings + i * 32;
+		u32 htot, vtot;
+
+		dev->query_dv_timings_qmenu[i] = p;
+
+		htot = V4L2_DV_BT_FRAME_WIDTH(bt);
+		vtot = V4L2_DV_BT_FRAME_HEIGHT(bt);
+		snprintf(p, 32, "%ux%u%s%u",
+			bt->width, bt->height, bt->interlaced ? "i" : "p",
+			(u32)bt->pixelclock / (htot * vtot));
+	}
+
+	return 0;
+}
+
+
 static int vivid_create_instance(struct platform_device *pdev, int inst)
 {
 	static const struct v4l2_dv_timings def_dv_timings =
@@ -1254,40 +1296,10 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
 	if (!dev->edid)
 		goto free_dev;
 
-	while (v4l2_dv_timings_presets[dev->query_dv_timings_size].bt.width)
-		dev->query_dv_timings_size++;
-
-	/*
-	 * Create a char pointer array that points to the names of all the
-	 * preset timings
-	 */
-	dev->query_dv_timings_qmenu = kmalloc_array(dev->query_dv_timings_size,
-						    sizeof(char *), GFP_KERNEL);
-	/*
-	 * Create a string array containing the names of all the preset
-	 * timings. Each name is max 31 chars long (+ terminating 0).
-	 */
-	dev->query_dv_timings_qmenu_strings =
-		kmalloc_array(dev->query_dv_timings_size, 32, GFP_KERNEL);
-
-	if (!dev->query_dv_timings_qmenu ||
-	    !dev->query_dv_timings_qmenu_strings)
+	ret = vivid_init_dv_timings(dev);
+	if (ret < 0)
 		goto free_dev;
 
-	for (i = 0; i < dev->query_dv_timings_size; i++) {
-		const struct v4l2_bt_timings *bt = &v4l2_dv_timings_presets[i].bt;
-		char *p = dev->query_dv_timings_qmenu_strings + i * 32;
-		u32 htot, vtot;
-
-		dev->query_dv_timings_qmenu[i] = p;
-
-		htot = V4L2_DV_BT_FRAME_WIDTH(bt);
-		vtot = V4L2_DV_BT_FRAME_HEIGHT(bt);
-		snprintf(p, 32, "%ux%u%s%u",
-			bt->width, bt->height, bt->interlaced ? "i" : "p",
-			(u32)bt->pixelclock / (htot * vtot));
-	}
-
 	vivid_disable_unused_ioctls(dev, has_tuner, has_modulator,
 				    in_type_counter, out_type_counter);
 
-- 
2.26.2

