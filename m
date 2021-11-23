Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5AAD4598DB
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 01:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhKWAEN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 19:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232867AbhKWADt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 19:03:49 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBD9C0613E1
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:40 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so640648wme.0
        for <linux-media@vger.kernel.org>; Mon, 22 Nov 2021 16:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nmycPypIJ0tQoO6fOl5oVytxmaegv4XnGAjK0yMO+p0=;
        b=SV0nCM6oVVOmXRjSvIvFfpafcNz4W7cSMvE4zhsTI5TmGUl/vZ3WoNwBcvNm3Ea42i
         bstZCxGFsBSvu2s08w3zlsPhaHlOOp1qw1T8XyeTQzNkSn16mWHGYceqHpM+WsJf4v4w
         Fqzr+3uMZZjiZ6Mx0LQv4RPzVhKA4JGjwoxKpJaDFYdj0KyUmnNjTs3qey3MIiUb5Phd
         d4KEJxs3vLDNxSSrgp7dsDWbwa4x+WmV7T+GNhVDNyJpxDbWw3ue7VNnMmgtueTNrqKy
         tnBf54euEK2OVHm037T37h8p9xeylKjjpvHqZxLCa05vYZ+7JbjnqNKN2cWHwE6PvyI3
         N8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nmycPypIJ0tQoO6fOl5oVytxmaegv4XnGAjK0yMO+p0=;
        b=Z+/tGCEXBt5jLFSSjlu8F8+sDVdM4hqH9b2c9sM8F1Hab+dnFy0A4YI+EWJ0MiGb2H
         Uw+cSSlQZ9O7JQ9GPHYSwtYZqungs/AnV/P4/kibpPhLY+3VgZPKOyS2EFw23Y7APPKu
         t+t+rzdDK0u06H34vN5NXkSC6ujNDuB8QXFqmp/V+AW+HVwP12e2gL8uur3s5nKFkERy
         dRq1HJthDPDg5oNRr/IiA3J/4OpEKwaoQIHFYwyBCpLvV46/NXxV8PdwFWO7xhdknkW1
         h4TmqOLokKNeKNeyEWw9ls6+Rc8ovpt+Y/MmoBEhpfNj1pDYNp+9ovnqtEDVFqp5Dxrs
         +VaA==
X-Gm-Message-State: AOAM5320pQMAVEs+BR7ohtw2K70UsmyRF4l4CjtdXO/NY5wQgc3fsti+
        KvFxYy+vIAEjjY1z2vDAOLbW8oWMuK8=
X-Google-Smtp-Source: ABdhPJxPuOWcToVlO2dKUIQhkGpMchzoAsnNFg/FL137ckpd4JwSRUliAzNqpNYpjHAuv43F/P6fhA==
X-Received: by 2002:a05:600c:1e8d:: with SMTP id be13mr34779858wmb.79.1637625638733;
        Mon, 22 Nov 2021 16:00:38 -0800 (PST)
Received: from localhost.localdomain (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id s13sm23650782wmc.47.2021.11.22.16.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:00:38 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org, paul.kocialkowski@bootlin.com
Cc:     sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        laurent.pinchart@ideasonboard.com, yong.zhi@intel.com,
        bingbu.cao@intel.com, jeanmichel.hautbois@ideasonboard.com,
        kieran.bingham@ideasonboard.com, hdegoede@redhat.com
Subject: [PATCH v5 15/17] media: i2c: Use dev_err_probe() in ov8865
Date:   Tue, 23 Nov 2021 00:00:15 +0000
Message-Id: <20211123000017.43187-16-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123000017.43187-1-djrscally@gmail.com>
References: <20211123000017.43187-1-djrscally@gmail.com>
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
Changes in v5: 

	- None

 drivers/media/i2c/ov8865.c | 46 +++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 1cc9f78bb97a..1aa577dba0a3 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2957,6 +2957,26 @@ static int ov8865_probe(struct i2c_client *client)
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
@@ -2987,32 +3007,6 @@ static int ov8865_probe(struct i2c_client *client)
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

