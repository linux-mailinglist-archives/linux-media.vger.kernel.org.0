Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1963F18A9FF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 01:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgCSArS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 20:47:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47832 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgCSArS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 20:47:18 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18432D06;
        Thu, 19 Mar 2020 01:47:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584578834;
        bh=06ZhRwdfDTzjkna8qH6E4M0yAR/n+LrxpXhfUMJ61yU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LrpwXq8cTw5b2KyOlKuyiUZtNNiPIgOkDPyYD/7bA1L5AaNFLAnnCorROXn4Pv5BH
         wa13DmmdGEbplcE/Ll4klD2y67hJ0Kf29uq5jTaR/J9UvmqiVUgGyC8tlw0opqs+BB
         1kwh/kcTGjngM8C8B4mprtOgHB/JcfApHAn7MEpM=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 5/5] vimc: Make use of V4L2_CAP_IO_MC
Date:   Thu, 19 Mar 2020 02:47:01 +0200
Message-Id: <20200319004701.30416-6-laurent.pinchart@ideasonboard.com>
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

Set the V4L2_CAP_IO_MC capability flag to report this vimc
inputs/outputs are controlled by the media graph.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Changes since v5:

- Wrap line longer than 80 characters
- Implement mbus_code filtering for format enumeration
---
 drivers/media/platform/vimc/vimc-capture.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 76c015898cfd..86b3580a746f 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -146,7 +146,12 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
 static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
+	const struct vimc_pix_map *vpix;
+
+	if (f->mbus_code)
+		vpix = vimc_pix_map_by_code(f->mbus_code);
+	else
+		vpix = vimc_pix_map_by_index(f->index);
 
 	if (!vpix)
 		return -EINVAL;
@@ -447,7 +452,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+			  | V4L2_CAP_IO_MC;
 	vdev->entity.ops = &vimc_cap_mops;
 	vdev->release = vimc_cap_release;
 	vdev->fops = &vimc_cap_fops;
-- 
Regards,

Laurent Pinchart

