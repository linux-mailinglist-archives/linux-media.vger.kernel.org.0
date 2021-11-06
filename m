Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6669B446DC6
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 13:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234112AbhKFMIW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 08:08:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233469AbhKFMIV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 08:08:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2D3A60F9E;
        Sat,  6 Nov 2021 12:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636200340;
        bh=yZQNp8KUwzUd5M4xpK/LPy9znCmhPinGjqBMI19F35s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TgR/H7oH3UJg7vDh3P1nYjzTEshhKg79H4i8FoRp2FU1BxzzODH7t9RhWdBvgC3Er
         6EmEWTQMWCSsu8Guxk5nz0piNEup073PIOv6Hw/W5zaKQ72C1iUQwUqwl1ZrhtY8z6
         rUBsDtv+RqUASrSFHwTO5cQN6FWv69VM1YJoWEoPruoyk3cUOcjhu6Z8jIv6ozctPC
         37PqLi8y/GCsOByMzQR+06TlUU/syHHNBO6/+PcRdKxb+poP3a53WnPZvyJQmT5bWr
         zBhqKEE+56lycDkG9w91CgD53WGfjFmM6GxZz8o+Y8h8RpU1PK/CGduP+IeNa04KGH
         lnuO6Zv2RuoGg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mjKS2-0006p1-4A; Sat, 06 Nov 2021 12:05:38 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Maennich <maennich@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: atomisp: register first the preview devnode
Date:   Sat,  6 Nov 2021 12:05:37 +0000
Message-Id: <0e415a67e548d725ba62c25269cc862be2315548.1636200095.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636200095.git.mchehab+huawei@kernel.org>
References: <cover.1636200095.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp currenyl registers 5 pairs of devices each one
for one different run_mode, plus one for "ACC". The only
one that behaves like a normal V4L2 device is the preview
one. The others are doing weird things, and perhaps are
using some proprietary extensions to the API.

Change the device order to start with the preview one,
e. g:

	/dev/video0: ATOMISP ISP PREVIEW output
	/dev/video1: ATOMISP ISP CAPTURE output
	/dev/video2: ATOMISP ISP VIEWFINDER output
	/dev/video3: ATOMISP ISP VIDEO output
	/dev/video4: ATOMISP ACC

This way, a normal V4L2 application will get the right
device, as the first one will be the one they should use.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/2] at: https://lore.kernel.org/all/cover.1636200095.git.mchehab+huawei@kernel.org/

 .../staging/media/atomisp/pci/atomisp_subdev.c   | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index ffaf11e0b0ad..a3f3c42f9db7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1356,6 +1356,14 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 	if (ret < 0)
 		goto error;
 
+	asd->video_out_preview.vdev.v4l2_dev = vdev;
+	asd->video_out_preview.vdev.device_caps = device_caps |
+						  V4L2_CAP_VIDEO_OUTPUT;
+	ret = video_register_device(&asd->video_out_preview.vdev,
+				    VFL_TYPE_VIDEO, -1);
+	if (ret < 0)
+		goto error;
+
 	asd->video_out_capture.vdev.v4l2_dev = vdev;
 	asd->video_out_capture.vdev.device_caps = device_caps |
 						  V4L2_CAP_VIDEO_OUTPUT;
@@ -1371,13 +1379,7 @@ int atomisp_subdev_register_entities(struct atomisp_sub_device *asd,
 				    VFL_TYPE_VIDEO, -1);
 	if (ret < 0)
 		goto error;
-	asd->video_out_preview.vdev.v4l2_dev = vdev;
-	asd->video_out_preview.vdev.device_caps = device_caps |
-						  V4L2_CAP_VIDEO_OUTPUT;
-	ret = video_register_device(&asd->video_out_preview.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
+
 	asd->video_out_video_capture.vdev.v4l2_dev = vdev;
 	asd->video_out_video_capture.vdev.device_caps = device_caps |
 							V4L2_CAP_VIDEO_OUTPUT;
-- 
2.33.1

