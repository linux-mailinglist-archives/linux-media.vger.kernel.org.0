Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8D093C25E4
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 16:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhGIO3O (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 10:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhGIO3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jul 2021 10:29:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D70C0613E5
        for <linux-media@vger.kernel.org>; Fri,  9 Jul 2021 07:26:31 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v5so12419906wrt.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jul 2021 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=REDzv9+6s/N+X5U5gFn/O0gbvXr5/Mxy0tkymEivpfM=;
        b=J8xPdC7LNcVfyQebl8RoVRlVv8lBRl9wsbT0WT0MibpfwU4KCFRfMB+rBJuox3qZ+w
         d9cklezxxRTB0yFO8U/hbGpdjA7T4OhN4a2dGZhtEvBjRT7Kww77cG4HVNxzkw/mKP2i
         TOCKOuVCLCmawep3pBglQFTth9rXthEL2Y5MFdRcmI4UXB/EOKaou/ZGX71NN2eSfuwc
         1j57zpW1cnnWizohwBF9UVmy5CcpjVrr0VkiIivqxDZhUVyO0DQPdVkjsVHpDpfU9XZb
         D0FWOFkA8DANcRNQmHVV8OjRgWM7q3382DQLpFxp8Yd2JxErvrF5XRhGSUm0ln7VKTwr
         6RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=REDzv9+6s/N+X5U5gFn/O0gbvXr5/Mxy0tkymEivpfM=;
        b=aBhjz0qhqgwMoHrT+bAnw2Il8V+OwyKoNUmNbDFU4dR5b0N9IT/JZnl7s5p3v/hRYH
         UvFShxIp/R0Vv4wF9Ca8NzSzid8KSjSsfTfNjIKYFeemIEdzUTWHirmnpDyeQSkXEIzQ
         FH45Mec5xuy3s0/9Zal2RDBEdzktxKNGi/kULw5A2HDd8XwsUkscMQ83g8F/3B8cXR/S
         9+Yzew4kFFb9lKGY6stgaiE+PDpjgY0ArpMdNHKvrlrYRtwNAXR8ChTsdklhK/GIklmq
         Hh/TY68Iu1C55jbkHWEx/K7iOvRdnVr+Gp76N425VD3TV8VkZLhIoeN0qVYLNJOonkGm
         neSg==
X-Gm-Message-State: AOAM532srNb682HrUG8Fnh0/5rF+k4tKBeitF4K/ivqQm8q3x51hU74s
        KlXTpCDaI2rkX567FgrXYM5DNA==
X-Google-Smtp-Source: ABdhPJzhiqwYFKTzIvTfyAQDaCoU6v/bYZ7b3ymddCIRsPCtD/0ElCBXcGC+/ASQxujm+vflsroK8A==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr2983931wro.311.1625840789638;
        Fri, 09 Jul 2021 07:26:29 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id f82sm11034245wmf.25.2021.07.09.07.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:26:29 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 02/11] rcar-vin: Fix error paths for rvin_mc_init()
Date:   Fri,  9 Jul 2021 16:25:51 +0200
Message-Id: <20210709142600.651718-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The error paths of rvin_mc_init() do not clean up properly, fix this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 6ea561fcd7a394fa..bea3880752169344 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -946,17 +946,23 @@ static int rvin_mc_init(struct rvin_dev *vin)
 	if (ret)
 		return ret;
 
+	ret = rvin_create_controls(vin, NULL);
+	if (ret < 0)
+		return ret;
+
 	ret = rvin_group_get(vin);
 	if (ret)
-		return ret;
+		goto err_controls;
 
 	ret = rvin_mc_parse_of_graph(vin);
 	if (ret)
-		rvin_group_put(vin);
+		goto err_group;
 
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
+	return 0;
+err_group:
+	rvin_group_put(vin);
+err_controls:
+	rvin_free_controls(vin);
 
 	return ret;
 }
-- 
2.32.0

