Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B383F2282
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 00:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbfKFXYh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 18:24:37 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:29232 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727813AbfKFXYh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 18:24:37 -0500
X-Halon-ID: 3eb7aa42-00ec-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 3eb7aa42-00ec-11ea-837a-0050569116f7;
        Thu, 07 Nov 2019 00:22:11 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Limit NV12 availability to supported VIN channels only
Date:   Thu,  7 Nov 2019 00:23:04 +0100
Message-Id: <20191106232304.2332121-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When adding support for NV12 it was overlooked that the pixel format is
only supported on some VIN channels. Fix this by adding a check to only
accept NV12 on the supported channels (0, 1, 4, 5, 8, 9, 12 and 13).

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9e2e63ffcc47acad..62d308a4ddaee82e 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -76,7 +76,12 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
 		return NULL;
 
-	if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
+	/*
+	 * If NV12 is supported it's only supported on some channels (0, 1, 4,
+	 * 5, 8, 9, 12 and 13).
+	 */
+	if (pixelformat == V4L2_PIX_FMT_NV12 &&
+	    (!vin->info->nv12 || BIT(vin->id) & 0xcccc))
 		return NULL;
 
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
-- 
2.23.0

