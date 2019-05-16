Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0917C1FD60
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfEPBq2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:28 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:58985 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726926AbfEPBPE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 21:15:04 -0400
X-Halon-ID: 05dc61c1-7778-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 05dc61c1-7778-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:14:59 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 1/8] rcar-vin: Do not call pm_runtime_{resume,suspend}()
Date:   Thu, 16 May 2019 03:14:10 +0200
Message-Id: <20190516011417.10590-2-niklas.soderlund+renesas@ragnatech.se>
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

