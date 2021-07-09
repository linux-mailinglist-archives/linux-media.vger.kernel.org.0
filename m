Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E346F3C25EA
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhGIO3T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:18 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA23C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:35 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso9212925wmh.4
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lVYndLyj3uerm193pKMzGgivY6yXF4tA+XFaFHPGQK4=;
        b=RpcKkLquo8tfZs7GMzXITV7Cld04/VHjdnYx3IzO0sGX5kCMnnMebKF3oO30dj0Ioz
         +EMw3Jau27QO7ALn5k2oQkuEFozBvcG2Kw5oHUpNlF/i1tjZR+ieWXNLo4/fb2FdSNUV
         nzfWWCN9nar96qgQGeuO7aoaXCT5S2uNtHltziD5Om9UcptN5q/l7gYOeNEPxj7nZd1p
         fTJ67GblNmnh4aI14Ol5YMOXEX42aB5IzJs/5MV9YRMd9/J7r6dfYh9jiSK0kZIZnML/
         evTtix8xQaKtbfRAA4VgFlnJG4tyP47J0zHlA1RkQFstxfhVye7v/NHRGTyEhSDxfglO
         AGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lVYndLyj3uerm193pKMzGgivY6yXF4tA+XFaFHPGQK4=;
        b=SxC4yLAyRurU08d1LbD9SWLBE+hqePcgX552Wjr4zOSLmlPOtXeRk2IzJOYnzTaVFr
         yto+y43NwnR9Eb2CUB9QHgW7Iut4USH8FRhVmSDgQId/tLYtzsfQY0wNyXGXDVUwIOGY
         AWvaEtFDkAOphHEhuIEEqEsbFrg3bMYsFr9MUy8Fq5R+cTYMWyoUHxpOrHH9GQlRvYqB
         6jT/tP5dHQdi73nunB/1AJKdojeZoBwT9tBmD7D6/YzYB/Qf1MFAPw6GkcEUz+hKtL6h
         IBMcLX4G2l7Vaxp1mdlFmZH2Gd80fZQ0LLAIlhnlpn1LaupNY1zMhIKkQMP+Tjf9ibFq
         u/dQ==
X-Gm-Message-State: AOAM5333I+sJgI7O64zt4mWQ2NJpzIFRb+kHmRWrKqNRHUJdM7yRME07
        P9BX01uot84Re2z1Is9xPx5xqBSXJT7JSJOs
X-Google-Smtp-Source: ABdhPJwrePiBzsjJ4n4b0zF0BE+ZyHNQAlXZ+xnSEl/U7Xc4dxcbHToxNmsbaoD5Jm3OdH7/pUfpDA==
X-Received: by 2002:a1c:1bd0:: with SMTP id b199mr22793507wmb.108.1625840793709;
        Fri, 09 Jul 2021 07:26:33 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:33 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 07/11] rcar-vin: Extend group notifier DT parser to work with any port
Date:   Fri,  9 Jul 2021 16:25:56 +0200
Message-Id: <20210709142600.651718-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The R-Car VIN group notifier will be extend to support a new group of
subdevices, the R-Car ISP channel selector in addition to the existing
R-Car CSI-2 receiver subdevices.

The existing DT parsing code can be reused if the port and max number of
endpoints are provided as parameters instead of being hard-coded. While
at it align the group notifier parser function names with the rest of
the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 3585985e822560ea..ae2a145b04f681f8 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -506,7 +506,8 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
 	.complete = rvin_group_notify_complete,
 };
 
-static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
+static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
+			       unsigned int id)
 {
 	struct fwnode_handle *ep, *fwnode;
 	struct v4l2_fwnode_endpoint vep = {
@@ -515,7 +516,7 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 	struct v4l2_async_subdev *asd;
 	int ret;
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
 	if (!ep)
 		return 0;
 
@@ -563,7 +564,8 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 	mutex_unlock(&vin->group->lock);
 }
 
-static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
+static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
+				    unsigned int max_id)
 {
 	unsigned int count = 0, vin_mask = 0;
 	unsigned int i, id;
@@ -589,19 +591,18 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 	v4l2_async_notifier_init(&vin->group->notifier);
 
 	/*
-	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
-	 * overlap but the parser function can handle it, so each subdevice
-	 * will only be registered once with the group notifier.
+	 * Some subdevices may overlap but the parser function can handle it and
+	 * each subdevice will only be registered once with the group notifier.
 	 */
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		if (!(vin_mask & BIT(i)))
 			continue;
 
-		for (id = 0; id < RVIN_CSI_MAX; id++) {
+		for (id = 0; id < max_id; id++) {
 			if (vin->group->remotes[id].asd)
 				continue;
 
-			ret = rvin_mc_parse_of(vin->group->vin[i], id);
+			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
 			if (ret)
 				return ret;
 		}
@@ -982,7 +983,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret && ret != -ENODEV)
 		goto err_group;
 
-	ret = rvin_mc_parse_of_graph(vin);
+	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
 		goto err_parallel;
 
-- 
2.32.0

