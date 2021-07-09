Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 879C73C25E6
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbhGIO3P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3P (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:15 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDECC0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:32 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id l7so11471418wrv.7
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9yjwjBH71B1Tr99bztBPhfwTmYUTMG61RRb8LVVQw1M=;
        b=0SQTmUjerKyjVuxk3QxAnuwkWyCnjSWCiIzlZ6Je/Z/ZGiUbVrQGlTj7TGBLe941I5
         GuLGHBIvKoS5jFwnh0Qt0ObM+aTRgXbQYugm1jD40pizb5exgsDn9fEVtc58qjyyr8RZ
         0mqQITEF0MXCp5JoQrtmpZhprJtYElBJoWIP34/YwWcnoW4UB/TkExJ9BrEHGSIrqcnF
         9lEpT9i56OaelJeDngcoaThjd2T0PwsWsnC5EEwGweqjaq4uokfymIH53XSfKZ7Gr+dJ
         qb5QkVOvO89dU5uk9HYsgizQr3QwpIGaLae7UnMlMDcB2BuhsncbR3RPNgOOYuyyDTnt
         FYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9yjwjBH71B1Tr99bztBPhfwTmYUTMG61RRb8LVVQw1M=;
        b=ErdQXxVQ0zDyF4yeQnTqoviP1sV7yZXmRB2h4POWyjmKDlxFvGGZ59SMajcM2scLBW
         kD82SYNU1NRqka7JHq3ZsxsQcsTFzi27vzEbQGrye5bN3LGBdFD/xH873fw7K6ItTb09
         91j7o6vFzHRsvvCSp2dj90rw+pOlg/t7pPY0ukY4iBFO8XGwDlFzfu4IIxfcYauCkf+H
         Vb+Y88qxXgpdzvwUynmDjKI/w0pNvmJLse17aNs0ZHC2RcwnP6aILpPR+hg1DBRkeabl
         00Y/EIvwNl3rRP4fJMhdgtv0JoUmh+0Iyu1X1w15rHwNOUY8ALvcd9q0J5ktmGoz0Kni
         qYBg==
X-Gm-Message-State: AOAM531wAXzFzPaNhf6nLseOlIR4PIoC5sQxNFpGhbLeejbkXl/Dqw2E
        EdpcdXTD5V//3EsDgAvx0O2dMnCczcY5w/XB
X-Google-Smtp-Source: ABdhPJxZORdOWEsDLv/rJ7UYLj8sVmeqmWMeQbEHhJWi0qQkoXDt7WC70HaG+5WtJsVVLoMFomCqhA==
X-Received: by 2002:a5d:680c:: with SMTP id w12mr5237812wru.139.1625840790725;
        Fri, 09 Jul 2021 07:26:30 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:30 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 03/11] rcar-vin: Improve async notifier cleanup paths
Date:   Fri,  9 Jul 2021 16:25:52 +0200
Message-Id: <20210709142600.651718-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The cleanup code for the async notifiers can be refactored to own
functions to reduce code duplication and improve readability. While at
it rename the CSI-2 initialization function _csi2_ instead of _mc_ to
match.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 51 ++++++++++++---------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index bea3880752169344..2957fa10252fd1e0 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -383,6 +383,16 @@ static void rvin_group_put(struct rvin_dev *vin)
 	kref_put(&group->refcount, rvin_group_release);
 }
 
+static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
+{
+	mutex_lock(&vin->group->lock);
+	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
+		v4l2_async_notifier_unregister(&vin->group->notifier);
+		v4l2_async_notifier_cleanup(&vin->group->notifier);
+	}
+	mutex_unlock(&vin->group->lock);
+}
+
 /* -----------------------------------------------------------------------------
  * Controls
  */
@@ -676,6 +686,12 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	return ret;
 }
 
+static void rvin_parallel_cleanup(struct rvin_dev *vin)
+{
+	v4l2_async_notifier_unregister(&vin->notifier);
+	v4l2_async_notifier_cleanup(&vin->notifier);
+}
+
 static int rvin_parallel_init(struct rvin_dev *vin)
 {
 	int ret;
@@ -937,7 +953,16 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 	return 0;
 }
 
-static int rvin_mc_init(struct rvin_dev *vin)
+static void rvin_csi2_cleanup(struct rvin_dev *vin)
+{
+	if (!vin->info->use_mc)
+		return;
+
+	rvin_group_notifier_cleanup(vin);
+	rvin_group_put(vin);
+}
+
+static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
@@ -1449,7 +1474,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, vin);
 
 	if (vin->info->use_mc) {
-		ret = rvin_mc_init(vin);
+		ret = rvin_csi2_init(vin);
 		if (ret)
 			goto error_dma_unregister;
 	}
@@ -1462,20 +1487,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-
 error_group_unregister:
 	rvin_free_controls(vin);
-
-	if (vin->info->use_mc) {
-		mutex_lock(&vin->group->lock);
-		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
-			v4l2_async_notifier_unregister(&vin->group->notifier);
-			v4l2_async_notifier_cleanup(&vin->group->notifier);
-		}
-		mutex_unlock(&vin->group->lock);
-		rvin_group_put(vin);
-	}
-
+	rvin_csi2_cleanup(vin);
 error_dma_unregister:
 	rvin_dma_unregister(vin);
 
@@ -1490,14 +1504,9 @@ static int rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	v4l2_async_notifier_unregister(&vin->notifier);
-	v4l2_async_notifier_cleanup(&vin->notifier);
+	rvin_parallel_cleanup(vin);
 
-	if (vin->info->use_mc) {
-		v4l2_async_notifier_unregister(&vin->group->notifier);
-		v4l2_async_notifier_cleanup(&vin->group->notifier);
-		rvin_group_put(vin);
-	}
+	rvin_csi2_cleanup(vin);
 
 	rvin_free_controls(vin);
 
-- 
2.32.0

