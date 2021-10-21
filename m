Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB80B436CF3
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbhJUVq3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbhJUVq0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:46:26 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6986CC061220
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p21so961593wmq.1
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W6hpRDl94S/Eeu0a3abgL9PES9y85INw0M97kjxmgOQ=;
        b=Ih/Jcq+oOxg2Kc7BYSo87rAgWBvl4tnjkQp60ggKpyZcm+chc/h83C6yY2ilTRiEly
         mP518M8x8oG5H78DIKDfnL6N9vBhs42YVO30TqyVL8W7pgCBYWwLV+vMP6macJmIvUc2
         mCqxM2q8sec2A1H41v7Q+WfJeAEoHPNOy/qQkD1kYKKblUVE62wG4IG8rYbWHtX2sgoJ
         syDohBYrMIy612tYz36mlYKzku3InNUak3AXoml/GTIYuoD9hoo8VH1M1vE/qMd9i12y
         7pBUXMxWn6YKLjBFnOknfM5T3qtrHIlmHLOj4GGGVYLViOgR7+zWdf884vegDZUjcIIX
         uFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W6hpRDl94S/Eeu0a3abgL9PES9y85INw0M97kjxmgOQ=;
        b=ytiGT+7iRKdu9AtMKkZzTviO40+DuqYwlKkx/aqvpbqRzZup24Hc8tx6uC73UCuznV
         UTMtXoVPojA8yvsdDl0yavWUch9MLxpn+nW8YpS7GdiGpgAR9MFpBqqpJgCLjgPR2g4w
         vF3OsovaoJF5KRnWNM1Tk3gQDGHeDtHV0ImWPJWDFsOFHlQ6cB2J8f3Jy48PUb372DAO
         Py6zJ4pXIdns1g7DF67dUOsJiphqy0AvTkEHN10zkzA5mNNfMhhoqsMFDeLRDDQaP/0G
         zDsmzVMYcfy1Zgo2SI0yxbEPM4H6theHk2cBC5dZ/oXDqWalhAsDISuynCv8lKNKv2t/
         W2Ag==
X-Gm-Message-State: AOAM533e3+J6deHg3/hKBTQ4BI4hc+DAS5kqvrnD8p8k+TN1evnOGnfM
        NiLanVUrKh1DjzaNAw3bFFZkHibwFjg=
X-Google-Smtp-Source: ABdhPJxKxUeisc4f4VMKftmhh4FGBPjPd/LPlsam1YowFPl5sYnRU5PYzYrDDDT+gh0Pcr0UXvu12A==
X-Received: by 2002:a05:600c:3b88:: with SMTP id n8mr9222297wms.93.1634852648059;
        Thu, 21 Oct 2021 14:44:08 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id r205sm6378507wma.3.2021.10.21.14.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 14:44:07 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dan Scally <djrscally@gmail.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        hdegoede@redhat.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: [PATCH v3 14/16] media: i2c: Use dev_err_probe() in ov8865
Date:   Thu, 21 Oct 2021 22:43:29 +0100
Message-Id: <20211021214331.1188787-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021214331.1188787-1-djrscally@gmail.com>
References: <20211021214331.1188787-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a chance that regulator_get() returns -EPROBE_DEFER, in which
case printing an error message is undesirable. To avoid spurious messages
in dmesg in the event that -EPROBE_DEFER is returned, use dev_err_probe()
on error paths for regulator_get().

Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes in v3:

	- None

 drivers/media/i2c/ov8865.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 572b9818e950..685539744041 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2955,6 +2955,26 @@ static int ov8865_probe(struct i2c_client *client)
 	sensor->dev = dev;
 	sensor->i2c_client = client;
 
+	/* Regulators */
+
+	/* DVDD: digital core */
+	sensor->dvdd = devm_regulator_get(dev, "dvdd");
+	if (IS_ERR(sensor->dvdd))
+		return dev_err_probe(dev, PTR_ERR(sensor->dvdd),
+				     "cannot get DVDD regulator\n");
+
+	/* DOVDD: digital I/O */
+	sensor->dovdd = devm_regulator_get(dev, "dovdd");
+	if (IS_ERR(sensor->dovdd))
+		return dev_err_probe(dev, PTR_ERR(sensor->dovdd),
+				     "cannot get DOVDD regulator\n");
+
+	/* AVDD: analog */
+	sensor->avdd = devm_regulator_get(dev, "avdd");
+	if (IS_ERR(sensor->avdd))
+		return dev_err_probe(dev, PTR_ERR(sensor->avdd),
+				     "cannot get AVDD (analog) regulator\n");
+
 	/* Graph Endpoint */
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
@@ -2985,32 +3005,6 @@ static int ov8865_probe(struct i2c_client *client)
 		goto error_endpoint;
 	}
 
-	/* Regulators */
-
-	/* DVDD: digital core */
-	sensor->dvdd = devm_regulator_get(dev, "dvdd");
-	if (IS_ERR(sensor->dvdd)) {
-		dev_err(dev, "cannot get DVDD (digital core) regulator\n");
-		ret = PTR_ERR(sensor->dvdd);
-		goto error_endpoint;
-	}
-
-	/* DOVDD: digital I/O */
-	sensor->dovdd = devm_regulator_get(dev, "dovdd");
-	if (IS_ERR(sensor->dovdd)) {
-		dev_err(dev, "cannot get DOVDD (digital I/O) regulator\n");
-		ret = PTR_ERR(sensor->dovdd);
-		goto error_endpoint;
-	}
-
-	/* AVDD: analog */
-	sensor->avdd = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(sensor->avdd)) {
-		dev_err(dev, "cannot get AVDD (analog) regulator\n");
-		ret = PTR_ERR(sensor->avdd);
-		goto error_endpoint;
-	}
-
 	/* External Clock */
 
 	sensor->extclk = devm_clk_get(dev, "tps68470-clk");
-- 
2.25.1

