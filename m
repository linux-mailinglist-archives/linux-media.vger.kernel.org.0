Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC6F11559C
	for <lists+linux-media@lfdr.de>; Fri,  6 Dec 2019 17:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfLFQkV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Dec 2019 11:40:21 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:10269 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726261AbfLFQkV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Dec 2019 11:40:21 -0500
X-Halon-ID: 055a7003-1847-11ea-8e92-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 055a7003-1847-11ea-8e92-005056917f90;
        Fri, 06 Dec 2019 17:40:14 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 1/2] rcar-vin: Handle special pixel formats in a switch
Date:   Fri,  6 Dec 2019 17:39:31 +0100
Message-Id: <20191206163932.3295865-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Before extending the special pixel format handling turn the multiple if
statements into a switch.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 9e2e63ffcc47acad..7f6c40f1f264515d 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -73,11 +73,18 @@ const struct rvin_video_format *rvin_format_from_pixel(struct rvin_dev *vin,
 {
 	int i;
 
-	if (vin->info->model == RCAR_M1 && pixelformat == V4L2_PIX_FMT_XBGR32)
-		return NULL;
-
-	if (pixelformat == V4L2_PIX_FMT_NV12 && !vin->info->nv12)
-		return NULL;
+	switch (pixelformat) {
+	case V4L2_PIX_FMT_XBGR32:
+		if (vin->info->model == RCAR_M1)
+			return NULL;
+		break;
+	case V4L2_PIX_FMT_NV12:
+		if (!vin->info->nv12)
+			return NULL;
+		break;
+	default:
+		break;
+	}
 
 	for (i = 0; i < ARRAY_SIZE(rvin_formats); i++)
 		if (rvin_formats[i].fourcc == pixelformat)
-- 
2.24.0

