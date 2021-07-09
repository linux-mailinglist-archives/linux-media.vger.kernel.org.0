Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804E93C25EC
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhGIO3U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231622AbhGIO3U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:20 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F99C0613DD
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id a13so12380294wrf.10
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o3ARZ5jYf4Y0DK+OPEN0Z43tHwPeSGkBmoR8V6zbSvI=;
        b=WlyTeex+NmsJCRJGjrq6CRCZHNX5BgCBgvDNiK0rHimBcqXC9zxtS55HhaCNOrDRUj
         KYI1oL+lISZhvh/auXy4QUkrlbe12mbi9ug5abnuf5IiT2YzbcN2AAgsiDtACY5iCJL3
         zlxx6zCdphaEltvsnsq/LCly1vgS76a2FqS2kWa4qFiKRKhMFktXChXGQeCgqwzVcdNy
         T9aN3W4QY4wvXSV9rkxLaBNUC773BLtiv4eg913Wx99aWSl2FN05D6vn6kCrBaKil61a
         QH9Jq04i1HDBaD+beEuIt40k0IbdbBTkCSqQuTvXEjUgobKN1l20AAr/455v9v7paLrp
         GCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o3ARZ5jYf4Y0DK+OPEN0Z43tHwPeSGkBmoR8V6zbSvI=;
        b=NPU8W/NMasBZY/Mi4AeXzP/rrsSx/jhvBNn1gF8hOTZXCKVrNNoz/Qpwr/3zIzNfpA
         1/9+6UQMHH/T1LMfe2XDzj7f/BeQK5xGNooJUO0Gn0KrTaMYV4NcJsE363e1xJejuIfk
         hxvLX5o5O9sx0893k07ag42wz9M37pDyly5Eud9Xtnl8VjJOHQcyPCgZX6dQgmNCVp8R
         qNaeFAV2WshMRdTSalQYfncIacPKB9Q0zSHHmWZQD7V5oSBJTOBpGH9Bcc7WD/NjEzQ7
         lSZSTluxfKutzpPNnKRIyCfwIT8cyGkAEZz8CT9wmAzuls3C0FX826VzkUXLjHnfywYZ
         gB5w==
X-Gm-Message-State: AOAM530ij5B68eAY9nAmKfOKo6JLy+7bbFOo600zW4rdwSIKFoMhxj+r
        AGgg2SF6fPAIfQnPZjrGrnw7vQ==
X-Google-Smtp-Source: ABdhPJzkkhoyLvXeFtYXzO/By6lcD8gLRxggWto1TPhrIt/+KmWKX+EIC9i57MNWdUJGVkrBeNJOWA==
X-Received: by 2002:adf:e5c9:: with SMTP id a9mr39851345wrn.376.1625840795215;
        Fri, 09 Jul 2021 07:26:35 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:34 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 09/11] rcar-vin: Specify media device ops at group creation time
Date:   Fri,  9 Jul 2021 16:25:58 +0200
Message-Id: <20210709142600.651718-10-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The media device operations structure will be different depending on
what media graph layout is used. Instead of hard-coding the R-Car CSI-2
layout allow the operations to be passed as an argument.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index d04c222702ba03d1..8c27d9d5ca7e42b5 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -248,7 +248,8 @@ static void rvin_group_cleanup(struct rvin_group *group)
 }
 
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   int (*link_setup)(struct rvin_dev *))
+			   int (*link_setup)(struct rvin_dev *),
+			   const struct media_device_ops *ops)
 {
 	struct media_device *mdev = &group->mdev;
 	const struct of_device_id *match;
@@ -267,7 +268,7 @@ static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
 	group->link_setup = link_setup;
 
 	mdev->dev = vin->dev;
-	mdev->ops = &rvin_media_ops;
+	mdev->ops = ops;
 
 	match = of_match_node(vin->dev->driver->of_match_table,
 			      vin->dev->of_node);
@@ -299,7 +300,8 @@ static void rvin_group_release(struct kref *kref)
 }
 
 static int rvin_group_get(struct rvin_dev *vin,
-			  int (*link_setup)(struct rvin_dev *))
+			  int (*link_setup)(struct rvin_dev *),
+			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
 	u32 id;
@@ -331,7 +333,7 @@ static int rvin_group_get(struct rvin_dev *vin,
 			goto err_group;
 		}
 
-		ret = rvin_group_init(group, vin, link_setup);
+		ret = rvin_group_init(group, vin, link_setup, ops);
 		if (ret) {
 			kfree(group);
 			vin_err(vin, "Failed to initialize group\n");
@@ -985,7 +987,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret < 0)
 		return ret;
 
-	ret = rvin_group_get(vin, rvin_csi2_setup_links);
+	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_media_ops);
 	if (ret)
 		goto err_controls;
 
-- 
2.32.0

