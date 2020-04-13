Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690C71A6D44
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 22:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388379AbgDMU0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 16:26:17 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:21119 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388362AbgDMU0L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 16:26:11 -0400
X-Halon-ID: fb810091-7dc4-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id fb810091-7dc4-11ea-aeed-005056917f90;
        Mon, 13 Apr 2020 22:25:58 +0200 (CEST)
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
Subject: [PATCH v7 6/6] vimc: Make use of V4L2_CAP_IO_MC
Date:   Mon, 13 Apr 2020 22:23:51 +0200
Message-Id: <20200413202351.1359754-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200413202351.1359754-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
index 747ea9cc1bd7cb12..dbc827fd1b9baebb 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -149,7 +149,12 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
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
@@ -450,7 +455,8 @@ struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
 	/* Initialize the video_device struct */
 	vdev = &vcap->vdev;
-	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
+			  | V4L2_CAP_IO_MC;
 	vdev->entity.ops = &vimc_cap_mops;
 	vdev->release = video_device_release_empty;
 	vdev->fops = &vimc_cap_fops;
-- 
2.26.0

