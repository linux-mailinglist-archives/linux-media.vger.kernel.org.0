Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A50220B330
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 16:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbgFZOFU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 10:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729011AbgFZOFD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 10:05:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 183E220E65;
        Fri, 26 Jun 2020 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593180302;
        bh=7/2GiHT+xOcz6nhxikdh6BpA4sfdaRgRyRNN5TGFLZc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FmVL8y6fRZEWk7y+1aXncux9dQiXVRIRKAcqLl/l+UsI7mAFsWZKyJz9Ek9f/CygP
         UcJyVm/mBa2U72SezttADzerhtJHxU5WF9D06N+QCLH3cnVz3wvqSlKd3fsZWcJUUL
         ezD/mFyD1+uKhB0zZwW1rJzHgbm/Fha/RmH0JXiU=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jooyS-00HKwP-6Y; Fri, 26 Jun 2020 16:05:00 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: atomisp: split add from find subdev
Date:   Fri, 26 Jun 2020 16:04:58 +0200
Message-Id: <c4953a78554a2443373189dcda2e63aef489fbc2.1593180146.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593180146.git.mchehab+huawei@kernel.org>
References: <cover.1593180146.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's only one place where a subdev can be added: when the
sensor driver registers it. Trying to do it elsewhere will
cause problems, as the detection code needs to access the
I2C bus in order to probe some things.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 31ec21a3ba84..3136759bf96f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -202,6 +202,8 @@ int atomisp_register_i2c_module(struct v4l2_subdev *subdev,
 	 * gmin_subdev struct is already initialized for us.
 	 */
 	gs = find_gmin_subdev(subdev);
+	if (!gs)
+		return -ENODEV;
 
 	pdata.subdevs[i].type = type;
 	pdata.subdevs[i].port = gs->csi_port;
@@ -726,7 +728,7 @@ static struct gmin_subdev *find_gmin_subdev(struct v4l2_subdev *subdev)
 	for (i = 0; i < MAX_SUBDEVS; i++)
 		if (gmin_subdevs[i].subdev == subdev)
 			return &gmin_subdevs[i];
-	return gmin_subdev_add(subdev);
+	return NULL;
 }
 
 static int axp_regulator_set(struct device *dev, struct gmin_subdev *gs,
@@ -1077,7 +1079,7 @@ struct camera_sensor_platform_data *gmin_camera_platform_data(
     enum atomisp_input_format csi_format,
     enum atomisp_bayer_order csi_bayer)
 {
-	struct gmin_subdev *gs = find_gmin_subdev(subdev);
+	struct gmin_subdev *gs = gmin_subdev_add(subdev);
 
 	gs->csi_fmt = csi_format;
 	gs->csi_bayer = csi_bayer;
-- 
2.26.2

