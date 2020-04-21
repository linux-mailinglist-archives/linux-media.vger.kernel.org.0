Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1531B28C2
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 15:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgDUN6X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 09:58:23 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:37931 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbgDUN56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 09:57:58 -0400
X-Halon-ID: 141dbeed-83d8-11ea-aeed-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2392.dip0.t-ipconnect.de [79.202.35.146])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 141dbeed-83d8-11ea-aeed-005056917f90;
        Tue, 21 Apr 2020 15:57:46 +0200 (CEST)
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
Subject: [PATCH v8 6/6] vimc: Make use of V4L2_CAP_IO_MC
Date:   Tue, 21 Apr 2020 15:57:43 +0200
Message-Id: <20200421135743.1381930-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200421135743.1381930-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v7:
- Add check that index is not greater then 0 in
  vimc_cap_enum_fmt_vid_cap().

* Changes since v5:
- Wrap line longer than 80 characters
- Implement mbus_code filtering for format enumeration
---
 drivers/media/test-drivers/vimc/vimc-capture.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 20c2f5e281bc44ed..c63496b17b9a5370 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -149,7 +149,16 @@ static int vimc_cap_s_fmt_vid_cap(struct file *file, void *priv,
 static int vimc_cap_enum_fmt_vid_cap(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
-	const struct vimc_pix_map *vpix = vimc_pix_map_by_index(f->index);
+	const struct vimc_pix_map *vpix;
+
+	if (f->mbus_code) {
+		if (f->index > 0)
+			return -EINVAL;
+
+		vpix = vimc_pix_map_by_code(f->mbus_code);
+	} else {
+		vpix = vimc_pix_map_by_index(f->index);
+	}
 
 	if (!vpix)
 		return -EINVAL;
@@ -450,7 +459,8 @@ static struct vimc_ent_device *vimc_cap_add(struct vimc_device *vimc,
 
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

