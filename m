Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF999447AD
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729932AbfFMRBS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:18 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:42965 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbfFLXqU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:20 -0400
X-Halon-ID: 40f51fdc-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 40f51fdc-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:10 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 4/8] rcar-vin: Do not sync subdevice format when opening the video device
Date:   Thu, 13 Jun 2019 01:45:43 +0200
Message-Id: <20190612234547.14486-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The format is already synced when the subdevice is bound, there is no
need to do do it every time the video device is opened.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 ---------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index f67cef97b89a3bd4..71651c5a69483367 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -782,38 +782,13 @@ static int rvin_initialize_device(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	struct v4l2_format f = {
-		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
-		.fmt.pix = {
-			.width		= vin->format.width,
-			.height		= vin->format.height,
-			.field		= vin->format.field,
-			.colorspace	= vin->format.colorspace,
-			.pixelformat	= vin->format.pixelformat,
-		},
-	};
-
 	ret = rvin_power_on(vin);
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Try to configure with default parameters. Notice: this is the
-	 * very first open, so, we cannot race against other calls,
-	 * apart from someone else calling open() simultaneously, but
-	 * .host_lock is protecting us against it.
-	 */
-	ret = rvin_s_fmt_vid_cap(file, NULL, &f);
-	if (ret < 0)
-		goto esfmt;
-
 	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
 
 	return 0;
-esfmt:
-	rvin_power_off(vin);
-
-	return ret;
 }
 
 static int rvin_open(struct file *file)
-- 
2.21.0

