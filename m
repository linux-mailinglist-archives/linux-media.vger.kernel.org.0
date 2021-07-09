Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D00203C25E7
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbhGIO3Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDFCBC0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id h18-20020a05600c3512b029020e4ceb9588so9226044wmq.5
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q8tLGmbtD8dcQF7Lbb7CsEUxkdcCJ//m4r+jDB2kbeI=;
        b=ZmqJJI5VlsDzkfT7eOVXXMQuHVyKcyLz6JWbOf7RZ6DQOoyOkhS8DInDTIy4nVIDxv
         rIt1IEmvmjdm0p6SthuqXQBA2iJLxr+hMoDFwiF9PhKx9nKsUVSSlHPj5IwcLixVhIh3
         isNORqJHoFVIfONGvh0RxaG0y+XIMO9pm20V+FuePu9LJ/8Zn+n3rhc+nK5pFt24t+oc
         Ovt80WK9J5ZcOkTJxoVn92IL2/HVyCXjxUvbcyBKwbZLNfeD77fRvlE0bzZS41eaR5sZ
         rP+g1N6mUC1BS7zhJJ6nPFvI7mKL0T9crW0b0h0TxSlQ7m6CpIlfqbbUbQf/nucavkbR
         OtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q8tLGmbtD8dcQF7Lbb7CsEUxkdcCJ//m4r+jDB2kbeI=;
        b=XAmLGLrl3vNPWHtUARMaaIt3xmIyssIrc3xDz+UA4yvUJWRwJg2zCFhtk5qKUvilhq
         bOfye8QE72xYZULdjwA/pZOIJugWJ1SNDdvsyLl/o7kQyOjv/nhBfO8AQMDorKyhBon8
         ArktD3JHT/uEG7bgekPTgayozxveQUxytN7ueIeIi3kBv5ENvzUESkHr0MsWogRGArVG
         h9a4VAV07q8O4sbN3fjcbJm+/A3oWGZPQrGYAkqNE6qKGlxnOtoZrCI6PZTXFF0La95a
         Yn2Mpi9VcGaU0rR1YyZyVikMVsw+0VhAUBq3HcOrdjd8pGuzwiQQyfAXvPqospqszG7B
         0MuQ==
X-Gm-Message-State: AOAM533uUIVDZWGZWjDoOo9doGpag8xTW4yjb94kb34VUktRaAw3VW1m
        vOkv0sdBc67XnLc8lYbfkGN4IA==
X-Google-Smtp-Source: ABdhPJxftStkY1U3DQluygaNDfXwC5/sNnndENd7dSl1c4yz8HGfYw5tjewZ7pRg7Tfqd5rJXG1SuA==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr39999856wmc.163.1625840791439;
        Fri, 09 Jul 2021 07:26:31 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:31 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 04/11] rcar-vin: Improve reuse of parallel notifier
Date:   Fri,  9 Jul 2021 16:25:53 +0200
Message-Id: <20210709142600.651718-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation for adding a new media graph layout move the code reuse
of the parallel notifier setup from probe directly to the current media
graph initialization function. This is needed as there will be no
parallel interface in the new graph layout.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Make sure the parallel port is cleaned up in for the MC code paths.
  Thanks Jacopo for spotting this!
---
 drivers/media/platform/rcar-vin/rcar-core.c | 49 ++++++++++-----------
 1 file changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 2957fa10252fd1e0..674766be1ad590a7 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -702,9 +702,8 @@ static int rvin_parallel_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
-	/* If using mc, it's fine not to have any input registered. */
 	if (!vin->parallel.asd)
-		return vin->info->use_mc ? 0 : -ENODEV;
+		return -ENODEV;
 
 	vin_dbg(vin, "Found parallel subdevice %pOF\n",
 		to_of_node(vin->parallel.asd->match.fwnode));
@@ -955,11 +954,10 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
-	if (!vin->info->use_mc)
-		return;
-
+	rvin_parallel_cleanup(vin);
 	rvin_group_notifier_cleanup(vin);
 	rvin_group_put(vin);
+	rvin_free_controls(vin);
 }
 
 static int rvin_csi2_init(struct rvin_dev *vin)
@@ -979,11 +977,18 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	ret = rvin_mc_parse_of_graph(vin);
-	if (ret)
+	/* It's OK to not have a parallel subdevice. */
+	ret = rvin_parallel_init(vin);
+	if (ret && ret != -ENODEV)
 		goto err_group;
 
+	ret = rvin_mc_parse_of_graph(vin);
+	if (ret)
+		goto err_parallel;
+
 	return 0;
+err_parallel:
+	rvin_parallel_cleanup(vin);
 err_group:
 	rvin_group_put(vin);
 err_controls:
@@ -1473,27 +1478,20 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
-	if (vin->info->use_mc) {
+	if (vin->info->use_mc)
 		ret = rvin_csi2_init(vin);
-		if (ret)
-			goto error_dma_unregister;
-	}
+	else
+		ret = rvin_parallel_init(vin);
 
-	ret = rvin_parallel_init(vin);
-	if (ret)
-		goto error_group_unregister;
+	if (ret) {
+		rvin_dma_unregister(vin);
+		return ret;
+	}
 
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-error_group_unregister:
-	rvin_free_controls(vin);
-	rvin_csi2_cleanup(vin);
-error_dma_unregister:
-	rvin_dma_unregister(vin);
-
-	return ret;
 }
 
 static int rcar_vin_remove(struct platform_device *pdev)
@@ -1504,11 +1502,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	rvin_parallel_cleanup(vin);
-
-	rvin_csi2_cleanup(vin);
-
-	rvin_free_controls(vin);
+	if (vin->info->use_mc)
+		rvin_csi2_cleanup(vin);
+	else
+		rvin_parallel_cleanup(vin);
 
 	rvin_dma_unregister(vin);
 
-- 
2.32.0

