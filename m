Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50431447B3
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbfFMRBV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:21 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:32270 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729722AbfFLXqT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:19 -0400
X-Halon-ID: 3f986b21-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 3f986b21-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:08 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 1/8] rcar-vin: Do not call pm_runtime_{resume,suspend}()
Date:   Thu, 13 Jun 2019 01:45:40 +0200
Message-Id: <20190612234547.14486-2-niklas.soderlund+renesas@ragnatech.se>
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

The driver does not implement runtime resume and suspend function so
there is little point in trying to call them. This is a leftover from
the drivers soc_camera beginnings.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 7cbdcbf9b090c638..b821ea01786eb1ff 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -798,9 +798,6 @@ static int rvin_initialize_device(struct file *file)
 		return ret;
 
 	pm_runtime_enable(&vin->vdev.dev);
-	ret = pm_runtime_resume(&vin->vdev.dev);
-	if (ret < 0 && ret != -ENOSYS)
-		goto eresume;
 
 	/*
 	 * Try to configure with default parameters. Notice: this is the
@@ -817,7 +814,6 @@ static int rvin_initialize_device(struct file *file)
 	return 0;
 esfmt:
 	pm_runtime_disable(&vin->vdev.dev);
-eresume:
 	rvin_power_off(vin);
 
 	return ret;
@@ -868,7 +864,6 @@ static int rvin_release(struct file *file)
 	 * Then de-initialize hw module.
 	 */
 	if (fh_singular) {
-		pm_runtime_suspend(&vin->vdev.dev);
 		pm_runtime_disable(&vin->vdev.dev);
 		rvin_power_off(vin);
 	}
-- 
2.21.0

