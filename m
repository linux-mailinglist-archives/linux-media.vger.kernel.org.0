Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD2871FCF6
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfEPBq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:28 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:27511 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726935AbfEPBPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 21:15:05 -0400
X-Halon-ID: 074218d5-7778-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 074218d5-7778-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:15:01 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 2/8] rcar-vin: Remove unneeded calls to pm_runtime_{enable,disable}
Date:   Thu, 16 May 2019 03:14:11 +0200
Message-Id: <20190516011417.10590-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Runtime PM is already enabled unconditionally when the driver is probed
and disabled when it's removed. There is no point in doing it again for
Gen2 when opening and closing the video device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index b821ea01786eb1ff..0841f1a0bfd7ba3a 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -797,8 +797,6 @@ static int rvin_initialize_device(struct file *file)
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_enable(&vin->vdev.dev);
-
 	/*
 	 * Try to configure with default parameters. Notice: this is the
 	 * very first open, so, we cannot race against other calls,
@@ -813,7 +811,6 @@ static int rvin_initialize_device(struct file *file)
 
 	return 0;
 esfmt:
-	pm_runtime_disable(&vin->vdev.dev);
 	rvin_power_off(vin);
 
 	return ret;
@@ -863,10 +860,8 @@ static int rvin_release(struct file *file)
 	 * If this was the last open file.
 	 * Then de-initialize hw module.
 	 */
-	if (fh_singular) {
-		pm_runtime_disable(&vin->vdev.dev);
+	if (fh_singular)
 		rvin_power_off(vin);
-	}
 
 	mutex_unlock(&vin->lock);
 
-- 
2.21.0

