Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0B568713
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729757AbfGOKa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:30:59 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:49891 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729695AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyG0hRPKR; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/6] cros-ec-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:50 +0200
Message-Id: <20190715103054.84849-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6gfLV8blEcjill/Jefyb69ntaqW+54fLhFBrI2NScsdy
 xqyaYHkETC4rFrkFKXhBVzbB3Z0Te+fWl+6cDYIWcyBskUzE6dNyZKUOssA4Ei4mpOZOnGydrXawqXLayWAqbx8HrNbTWB3OSrsVuvSeHhAYzJT7GYE9jXvU
 JYe6anIL
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
 .../media/platform/cros-ec-cec/cros-ec-cec.c  | 68 +++++++++++--------
 1 file changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 068df9888dbf..05463e4d76c2 100644
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
 
@@ -233,26 +233,24 @@ static int cros_ec_cec_get_notifier(struct device *dev,
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
+static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev)
 {
-	return -ENODEV;
+	return ERR_PTR(-ENODEV);
 }
 
 #endif
@@ -262,8 +260,14 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
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
@@ -272,10 +276,6 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cros_ec_cec);
 	cros_ec_cec->cros_ec = cros_ec;
 
-	ret = cros_ec_cec_get_notifier(&pdev->dev, &cros_ec_cec->notify);
-	if (ret)
-		return ret;
-
 	ret = device_init_wakeup(&pdev->dev, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to initialize wakeup\n");
@@ -283,29 +283,39 @@ static int cros_ec_cec_probe(struct platform_device *pdev)
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
@@ -323,11 +333,9 @@ static int cros_ec_cec_remove(struct platform_device *pdev)
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

