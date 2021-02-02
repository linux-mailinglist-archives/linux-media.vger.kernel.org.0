Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48B1030C278
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhBBOvA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Feb 2021 09:51:00 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48815 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234831AbhBBOu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Feb 2021 09:50:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6wzel32bSefbk6wzilkQkK; Tue, 02 Feb 2021 15:49:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612277370; bh=7fv3oSjetGMiecAfJ8yFAEP1Zr8uuFlogaKHZOSilug=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=QFNkZgkGV+RMkj2IxfH4nMXaf22kJdEE3toYQ14cq7j3tMEX/x0UpB9XyUB+5S7UR
         oEelsO/KlDiCBGWV8mp/OtFKO3jUD25ltX15vow6ofe59m0khXss5u4ghLKP33Hziv
         /DXPJXw6BKiocEwqNd6nRvWIjbFh1BMA/oRrE8xE0u45EGhS1BTiHKaokilP7CKbpb
         n9d/rwGgdjWLBlq5EhE93wmkSgGJ8wmQyu9Z6Nt4xc0coBQtt5rSOvk4G98vExc13d
         xvOILWQsy/VRGeGUBwgfPpIyog/nwygoYBVebf00NWdGDTZeqCbCEN8dYunTMTJYHE
         2TzFdbC+eKmLQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 1/4] vim2m: intialize the media device earlier
Date:   Tue,  2 Feb 2021 15:49:23 +0100
Message-Id: <20210202144926.620104-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
References: <20210202144926.620104-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfO6uUqsrEFiRjNa9Fmoiux1SKkZGu29xct5yio4NBYpPxUio4i0ClHkEH02a0rxTf92NXZD4hF2cH/ag9FdD1gze7AtjVHLHAB3yg+lHDjYGKwwPGDrT
 G5p2XsTB3uYWbWk/WErBqoHJ6NF6Y5mxseZbJFg6kxOa/fxEPTiNWq6ahu3ujHYhehOSn2LxXwXk2ZbA75L9xKpKApdTHeq0l5lLbxV6uV5fv7frSNzKDyKJ
 gYxcYYObeIBrOe9/csgblz7hyWglNKCJAYGykC+U5YhRBi1uqnIZkdP62Fym9hI2CJYhNEwwoZWoCG0wT+chG5XpHV2OcDFRScXYzBJ7ypc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before the video device node is registered, the v4l2_dev.mdev
pointer must be set in order to correctly associate the video
device with the media device. Move the initialization of the
media device up.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vim2m.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vim2m.c b/drivers/media/test-drivers/vim2m.c
index 331a9053a0ed..a24624353f9e 100644
--- a/drivers/media/test-drivers/vim2m.c
+++ b/drivers/media/test-drivers/vim2m.c
@@ -1339,12 +1339,6 @@ static int vim2m_probe(struct platform_device *pdev)
 		goto error_dev;
 	}
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
-	if (ret) {
-		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto error_m2m;
-	}
-
 #ifdef CONFIG_MEDIA_CONTROLLER
 	dev->mdev.dev = &pdev->dev;
 	strscpy(dev->mdev.model, "vim2m", sizeof(dev->mdev.model));
@@ -1353,7 +1347,15 @@ static int vim2m_probe(struct platform_device *pdev)
 	media_device_init(&dev->mdev);
 	dev->mdev.ops = &m2m_media_ops;
 	dev->v4l2_dev.mdev = &dev->mdev;
+#endif
 
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
+		goto error_m2m;
+	}
+
+#ifdef CONFIG_MEDIA_CONTROLLER
 	ret = v4l2_m2m_register_media_controller(dev->m2m_dev, vfd,
 						 MEDIA_ENT_F_PROC_VIDEO_SCALER);
 	if (ret) {
-- 
2.29.2

