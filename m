Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C402C6EE9A
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2019 11:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfGTJ0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Jul 2019 05:26:05 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:60743 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727278AbfGTJ0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Jul 2019 05:26:05 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id olcthMrn90SBqolcwhlyTm; Sat, 20 Jul 2019 11:26:03 +0200
Subject: [PATCHv2 2/6] cros-ec-cec: use cec_notifier_cec_adap_(un)register
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
 <20190715103054.84849-3-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1e81562d-ab46-1f97-2c2f-c36a1affc769@xs4all.nl>
Date:   Sat, 20 Jul 2019 11:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190715103054.84849-3-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK3JbUgyK2fCvgtOcU1B+bSnTgGCnyfVhrU9/0nHMUCh/13O9/r4XSst00F1O5YyTOFculr54gXOk3aUptUpv493YU6XzzWNU+zo2FYNaGCIpirrhHUl
 b3euJ7cZ+8vCAf7fCPp4q+rdIwRppLpU6Rhe6jxHFC3tBGb0ty8Zm9/Kzf1/A/ZYB6YQbznFOpeUfxAR3wGyV/C4QJSsmpm6m4QrpV5XUN97z8V6gAnGF2QN
 YShKh9xjg+ZJjMvuf/R7bA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use cec_notifier_cec_adap_(un)register instead of
cec_notifier_get_conn, cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Neil Armstrong <narmstrong@baylibre.com>
---
The static inline cros_ec_cec_find_hdmi_dev() was missing an argument.
This fixes a kbuild test robot compile error.
---
 .../media/platform/cros-ec-cec/cros-ec-cec.c  | 69 +++++++++++--------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 068df9888dbf..76ab83f55cc0 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -206,10 +206,10 @@ static SIMPLE_DEV_PM_OPS(cros_ec_cec_pm_ops,
  */

 struct cec_dmi_match {
-	char *sys_vendor;
-	char *product_name;
-	char *devname;
-	char *conn;
+	const char *sys_vendor;
+	const char *product_name;
+	const char *devname;
+	const char *conn;
 };

 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -217,8 +217,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Fizz", "0000:00:02.0", "Port B" },
 };

-static int cros_ec_cec_get_notifier(struct device *dev,
-				    struct cec_notifier **notify)
+static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
+						const char **conn)
 {
 	int i;

@@ -233,26 +233,25 @@ static int cros_ec_cec_get_notifier(struct device *dev,
 			d = bus_find_device_by_name(&pci_bus_type, NULL,
 						    m->devname);
 			if (!d)
-				return -EPROBE_DEFER;
-
-			*notify = cec_notifier_get_conn(d, m->conn);
+				return ERR_PTR(-EPROBE_DEFER);
 			put_device(d);
-			return 0;
+			*conn = m->conn;
+			return d;
 		}
 	}

 	/* Hardware support must be added in the cec_dmi_match_table */
 	dev_warn(dev, "CEC notifier not configured for this hardware\n");

-	return -ENODEV;
+	return ERR_PTR(-ENODEV);
 }

 #else

-static int cros_ec_cec_get_notifier(struct device *dev,
-				    struct cec_notifier **notify)
+static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
+						const char **conn)
 {
-	return -ENODEV;
+	return ERR_PTR(-ENODEV);
 }

 #endif
@@ -262,8 +261,14 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pdev->dev.parent);
 	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
 	struct cros_ec_cec *cros_ec_cec;
+	struct device *hdmi_dev;
+	const char *conn = NULL;
 	int ret;

+	hdmi_dev = cros_ec_cec_find_hdmi_dev(&pdev->dev, &conn);
+	if (IS_ERR(hdmi_dev))
+		return PTR_ERR(hdmi_dev);
+
 	cros_ec_cec = devm_kzalloc(&pdev->dev, sizeof(*cros_ec_cec),
 				   GFP_KERNEL);
 	if (!cros_ec_cec)
@@ -272,10 +277,6 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;

-	ret = cros_ec_cec_get_notifier(&pdev->dev, &cros_ec_cec->notify);
-	if (ret)
-		return ret;
-
 	ret = device_init_wakeup(&pdev->dev, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to initialize wakeup\n");
@@ -283,29 +284,39 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	}

 	cros_ec_cec->adap = cec_allocate_adapter(&cros_ec_cec_ops, cros_ec_cec,
-						 DRV_NAME, CEC_CAP_DEFAULTS, 1);
+						 DRV_NAME,
+						 CEC_CAP_DEFAULTS |
+						 CEC_CAP_CONNECTOR_INFO, 1);
 	if (IS_ERR(cros_ec_cec->adap))
 		return PTR_ERR(cros_ec_cec->adap);

+	cros_ec_cec->notify = cec_notifier_cec_adap_register(hdmi_dev, conn,
+							     cros_ec_cec->adap);
+	if (!cros_ec_cec->notify) {
+		ret = -ENOMEM;
+		goto out_probe_adapter;
+	}
+
 	/* Get CEC events from the EC. */
 	cros_ec_cec->notifier.notifier_call = cros_ec_cec_event;
 	ret = blocking_notifier_chain_register(&cros_ec->event_notifier,
 					       &cros_ec_cec->notifier);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register notifier\n");
-		cec_delete_adapter(cros_ec_cec->adap);
-		return ret;
+		goto out_probe_notify;
 	}

 	ret = cec_register_adapter(cros_ec_cec->adap, &pdev->dev);
-	if (ret < 0) {
-		cec_delete_adapter(cros_ec_cec->adap);
-		return ret;
-	}
-
-	cec_register_cec_notifier(cros_ec_cec->adap, cros_ec_cec->notify);
+	if (ret < 0)
+		goto out_probe_notify;

 	return 0;
+
+out_probe_notify:
+	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
+out_probe_adapter:
+	cec_delete_adapter(cros_ec_cec->adap);
+	return ret;
 }

 static int cros_ec_cec_remove(struct platform_device *pdev)
@@ -323,11 +334,9 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
 		return ret;
 	}

+	cec_notifier_cec_adap_unregister(cros_ec_cec->notify);
 	cec_unregister_adapter(cros_ec_cec->adap);

-	if (cros_ec_cec->notify)
-		cec_notifier_put(cros_ec_cec->notify);
-
 	return 0;
 }

-- 
2.20.1


