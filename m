Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D6B4411A1
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 01:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhKAAOM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 Oct 2021 20:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhKAAOM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 Oct 2021 20:14:12 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A08DC061714
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:40 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso6757998wmc.2
        for <linux-media@vger.kernel.org>; Sun, 31 Oct 2021 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=803UQJ142AWpcyjy/zsRr+1MK6Z6851rVoDTYMduLxY=;
        b=CDJwZnkGfiDubUh6fx1xlyV3IZQYTGhg1i+ebim2CS+F1drLZ4f6rjOyfV+Vnpm0Py
         CkZlK6upPUfUK4e//SGZ9m58NCicLnAA7UbSluTbBc9Oehc15knxXV9VdQWpcz80youe
         dg+7oevwQwy1gIyqzSeDvLZ4V7/POlj7SvOZa6kUcn+LA1RxzFOHxtpdVso5KSrIwRZY
         4YEIj3P3bXC8LoV238BpNskCUli+9IR9yEdC1Atg1XcEK+5lHG2YvN3dj+fPYsgJaFj+
         ZdgVxkow4LDvOvxWQL/qV1LKXA+4v6Rm0lWgwnGZ2lF/d5dDHuSTE5G4qDvFYXJy4AFu
         5jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=803UQJ142AWpcyjy/zsRr+1MK6Z6851rVoDTYMduLxY=;
        b=MPrhU5feAJH9XnDEVC9zJ4kJlaBZTRB75qBOdaEquEUrTkii3VWaSmc841rNvPt5g3
         ci0/rHij+0rt+RBSaM8LEFGg79mg5Qrhr3N6eaCIEzSQ06m+PWM5szzaZiCPJUMQtazv
         MUim69zhwVmb8Kws8qmqbYLVFLc6CTLtyvhdn89NDdV7doanhPWk6LKWyr5lm7UoLY/R
         xrKmulFy99CzmYLRTeHHPvGY0bD34IP5AfZy9tkEqdtS3eAv4rXJWfARDGIaTHwU+bdj
         iLVdy5P5/i3gStMFtxVFP4YInyZKkvWMOyKpkc1898mCYt1aC019//Dg0k5Hbc095lO3
         N80A==
X-Gm-Message-State: AOAM5309mhn5ZQQNAgZnXn4h6b3/SHhlX2fOkx7PHBijlclnh61ECjad
        H0MIgKJ0nGEoL7bVkyzmwJQ=
X-Google-Smtp-Source: ABdhPJx1Bk9jWV68oGJoC3iLsEOlPXwL5lkO8BD56dWjTSmBix7WtiTl7OVKK9NonD+eMV4FVQVo/Q==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr3169438wmj.30.1635725498657;
        Sun, 31 Oct 2021 17:11:38 -0700 (PDT)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id k6sm12557678wri.83.2021.10.31.17.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 17:11:37 -0700 (PDT)
From:   Daniel Scally <djrscally@gmail.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Cc:     Yong Zhi <yong.zhi@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v4 14/16] media: i2c: Use dev_err_probe() in ov8865
Date:   Mon,  1 Nov 2021 00:11:17 +0000
Message-Id: <20211101001119.46056-15-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101001119.46056-1-djrscally@gmail.com>
References: <20211101001119.46056-1-djrscally@gmail.com>
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
 drivers/media/i2c/ov8865.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 18b5f1e8e9a7..ab225fb616b9 100644
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
 
 	sensor->extclk = devm_clk_get(dev, NULL);
-- 
2.25.1

