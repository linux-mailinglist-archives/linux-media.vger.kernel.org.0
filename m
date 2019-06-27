Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4B257C35
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 08:31:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfF0Gbh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 02:31:37 -0400
Received: from mail-ua1-f74.google.com ([209.85.222.74]:56045 "EHLO
        mail-ua1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfF0Gbh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 02:31:37 -0400
Received: by mail-ua1-f74.google.com with SMTP id 64so218956uam.22
        for <linux-media@vger.kernel.org>; Wed, 26 Jun 2019 23:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=jyZnunSMPx1zmQdmYmhj6V0898AophubOZGZljdXBPs=;
        b=S0UJxPVgTEIYz6aMKTRI9Ki88qB2iWgHDZldiQkHmeVz9RY6ie2xxN6Y2YeiW6VllU
         mEZidV+oax49kppfXZDctcbC5TxnEfSu82oXAr6JMB4AdXsYJgxzd5g7lp8RP5a7keD0
         GOUNe9y4hVz/6157LNc36ci3tK7yM46LYvtTmmY4bA2qnYC4rMD0f8okEf9g8kLj1kOy
         WVGNH+15ed3q2KK7uzdL1U4QfNstIdO0QQFkMJtOzPAjaEnosN7e6q0SMlNX69lN7Ulc
         xqZ+o9XU0IGmDuK7AZDXLQw/4KovFtLhGhaD673hGEFsMWrlrnS6xCw7sLb1MjyDKtdT
         FhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=jyZnunSMPx1zmQdmYmhj6V0898AophubOZGZljdXBPs=;
        b=ZEBVsXKvzJfLk4BiF/yA6361Hwo7QnK9dNkoSOLgTxbFKsYcTbOiKfSbGyDzxOel0L
         MSjsIH/ocLvPWP90dUGUmyvs0tpDaGO8uOh0VHqKKDkHQvpHLGU1R9S0LZl/lkkzugwd
         UAvUo9w6653OQ9ak6WQ+9rrWasfJdF30feyYZWjgra3Tot0TgQVESEBbHBHsQ8Y+RBkU
         M+CDhrLeAeq1vSDQJQYXPueYnmc37wctTAno6iVfmeKjlVlHLdsCnVfFpbahIUIdGDc6
         zAkn+MXEgtZvhvIIktFF5QyAnPllz/sa7lazLR+JST4/J06stSLnG5RofFS/wFPGy6nv
         G3iQ==
X-Gm-Message-State: APjAAAW2iqEOQmsYycOwB6qJsQnOcA3DNvn0MlNn/NS5OD0kGxGyZSW7
        tnqJU4f003ep/Syw5ijZRqiuhYTH4cqnVvqRe/YC7dGw2J5cVQaR2SRS4R5i5ifmClh4IBbfbYa
        l0m7B2r2qeuuuk3gn8vVPSjt8TOxVdhEFxTir7wyb3UnJfmsR/VHmRQA9g830TNRd9B0w
X-Google-Smtp-Source: APXvYqx2d1D8Ys/ZBgdijXrPMjZV8ASRB4/UbCmO1RiFdFdsPWrusECOwciKrc5vy7X7DBeCo3NfhaGSOoE=
X-Received: by 2002:a1f:3244:: with SMTP id y65mr679329vky.77.1561617096080;
 Wed, 26 Jun 2019 23:31:36 -0700 (PDT)
Date:   Thu, 27 Jun 2019 08:31:16 +0200
Message-Id: <20190627063116.89685-1-darekm@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
Subject: [PATCH] platform:media:cros-ec-cec: adapt to new notifier API
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, narmstrong@baylibre.com,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update ChromeOS CEC EC driver to the new notifier API.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
---
 .../media/platform/cros-ec-cec/cros-ec-cec.c  | 70 ++++++++++++-------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 068df9888dbf0..d74795836e5c8 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -217,8 +217,9 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 };
 
-static int cros_ec_cec_get_notifier(struct device *dev,
-				    struct cec_notifier **notify)
+static int cros_ec_cec_get_hdmi_dev(struct device *dev,
+				    struct device **hdmi_dev,
+				    const char **conn_name)
 {
 	int i;
 
@@ -227,16 +228,13 @@ static int cros_ec_cec_get_notifier(struct device *dev,
 
 		if (dmi_match(DMI_SYS_VENDOR, m->sys_vendor) &&
 		    dmi_match(DMI_PRODUCT_NAME, m->product_name)) {
-			struct device *d;
-
 			/* Find the device, bail out if not yet registered */
-			d = bus_find_device_by_name(&pci_bus_type, NULL,
-						    m->devname);
-			if (!d)
+			*hdmi_dev = bus_find_device_by_name(&pci_bus_type, NULL,
+							    m->devname);
+			if (*hdmi_dev == NULL)
 				return -EPROBE_DEFER;
 
-			*notify = cec_notifier_get_conn(d, m->conn);
-			put_device(d);
+			*conn_name = m->conn;
 			return 0;
 		}
 	}
@@ -249,8 +247,9 @@ static int cros_ec_cec_get_notifier(struct device *dev,
 
 #else
 
-static int cros_ec_cec_get_notifier(struct device *dev,
-				    struct cec_notifier **notify)
+static int cros_ec_cec_get_hdmi_dev(struct device *dev,
+				    struct cec_notifier **hdmi_dev,
+				    const char **conn_name)
 {
 	return -ENODEV;
 }
@@ -262,6 +261,8 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_cec *cros_ec_cec;
+	struct device *hdmi_dev;
+	const char *conn_name;
 	int ret;
 
 	cros_ec_cec = devm_kzalloc(&pdev->dev, sizeof(*cros_ec_cec),
@@ -272,20 +273,33 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;
 
-	ret = cros_ec_cec_get_notifier(&pdev->dev, &cros_ec_cec->notify);
+	ret = cros_ec_cec_get_hdmi_dev(&pdev->dev, &hdmi_dev, &conn_name);
 	if (ret)
 		return ret;
 
 	ret = device_init_wakeup(&pdev->dev, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to initialize wakeup\n");
-		return ret;
+		goto err_put_hdmi_dev;
 	}
 
 	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
-						 DRV_NAME, CEC_CAP_DEFAULTS, 1);
-	if (IS_ERR(cros_ec_cec->adap))
-		return PTR_ERR(cros_ec_cec->adap);
+						 DRV_NAME,
+						 CEC_CAP_DEFAULTS |
+						 CEC_CAP_CONNECTOR_INFO, 1);
+	if (IS_ERR(cros_ec_cec->adap)) {
+		ret = PTR_ERR(cros_ec_cec->adap);
+		goto err_put_hdmi_dev;
+	}
+
+	cros_ec_cec->notify =
+	    cec_notifier_cec_adap_register(hdmi_dev, conn_name,
+					   cros_ec_cec->adap);
+	if (!cros_ec_cec->notify) {
+		ret = -ENOMEM;
+		goto err_adap_del;
+	}
+
 
 	/* Get CEC events from the EC. */
 	cros_ec_cec->notifier.notifier_call = cros_ec_cec_event;
@@ -293,19 +307,25 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 					       &cros_ec_cec->notifier);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register notifier\n");
-		cec_delete_adapter(cros_ec_cec->adap);
-		return ret;
+		goto err_notifier_adap_unreg;
 	}
 
 	ret = cec_register_adapter(cros_ec_cec->adap, &pdev->dev);
-	if (ret < 0) {
-		cec_delete_adapter(cros_ec_cec->adap);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_notifier_adap_unreg;
 
-	cec_register_cec_notifier(cros_ec_cec->adap, cros_ec_cec->notify);
+	put_device(hdmi_dev);
 
 	return 0;
+
+err_notifier_adap_unreg:
+	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
+err_adap_del:
+	cec_delete_adapter(cros_ec_cec->adap);
+err_put_hdmi_dev:
+	put_device(hdmi_dev);
+
+	return ret;
 }
 
 static int cros_ec_cec_remove(struct platform_device *pdev)
@@ -324,9 +344,7 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
 	}
 
 	cec_unregister_adapter(cros_ec_cec->adap);
-
-	if (cros_ec_cec->notify)
-		cec_notifier_put(cros_ec_cec->notify);
+	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
 
 	return 0;
 }
-- 
2.18.1

