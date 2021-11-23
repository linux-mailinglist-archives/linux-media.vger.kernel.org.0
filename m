Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F6145A634
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 16:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238266AbhKWPIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 10:08:24 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:48085 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236311AbhKWPIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 10:08:23 -0500
X-Greylist: delayed 337 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Nov 2021 10:08:22 EST
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9CCF13C04C0;
        Tue, 23 Nov 2021 15:59:35 +0100 (CET)
Received: from vmlxhi-121.localdomain (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 23 Nov
 2021 15:59:35 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
Subject: [PATCH] media: v4l: vsp1: fix and generalize offset calculation for plane cropping
Date:   Tue, 23 Nov 2021 15:59:26 +0100
Message-ID: <1637679566-76975-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.132]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vertical subsampling factor is currently not considered in the offset
calculation for plane cropping done in rpf_configure_partition. This causes
a distortion (shift of the color plane) when formats with the vsub factor
larger than 1 are used (e.g. NV12, see vsp1_video_formats in vsp1_pipe.c).
This commit considers vsub factor for all planes except plane 0
(luminance). Also this commit generalizes calculation of the offset, so
the formula is same for all of the planes.

Fixes: e5ad37b64de9 ("[media] v4l: vsp1: Add cropping support")
Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/media/platform/vsp1/vsp1_rpf.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_rpf.c b/drivers/media/platform/vsp1/vsp1_rpf.c
index 85587c1..ea5503d 100644
--- a/drivers/media/platform/vsp1/vsp1_rpf.c
+++ b/drivers/media/platform/vsp1/vsp1_rpf.c
@@ -249,6 +249,7 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 	const struct vsp1_format_info *fmtinfo = rpf->fmtinfo;
 	const struct v4l2_pix_format_mplane *format = &rpf->format;
 	struct v4l2_rect crop;
+	unsigned int i;
 
 	/*
 	 * Source size and crop offsets.
@@ -287,17 +288,13 @@ static void rpf_configure_partition(struct vsp1_entity *entity,
 		       (crop.width << VI6_RPF_SRC_ESIZE_EHSIZE_SHIFT) |
 		       (crop.height << VI6_RPF_SRC_ESIZE_EVSIZE_SHIFT));
 
-	mem.addr[0] += crop.top * format->plane_fmt[0].bytesperline
-		     + crop.left * fmtinfo->bpp[0] / 8;
-
-	if (format->num_planes > 1) {
+	for (i = 0; i < format->num_planes; ++i) {
 		unsigned int offset;
 
-		offset = crop.top * format->plane_fmt[1].bytesperline
-		       + crop.left / fmtinfo->hsub
-		       * fmtinfo->bpp[1] / 8;
-		mem.addr[1] += offset;
-		mem.addr[2] += offset;
+		offset = crop.top * format->plane_fmt[i].bytesperline / (i ? fmtinfo->vsub : 1)
+		       + crop.left / (i ? fmtinfo->hsub : 1)
+		       * fmtinfo->bpp[i] / 8;
+		mem.addr[i] += offset;
 	}
 
 	/*
-- 
2.7.4

