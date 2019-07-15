Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ABA068714
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2019 12:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfGOKa7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jul 2019 06:30:59 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:46939 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729736AbfGOKa6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jul 2019 06:30:58 -0400
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:3de9:fbf:e548:c8fc])
        by smtp-cloud7.xs4all.net with ESMTPA
        id myFyhc6VO0SBqmyG0hRPKd; Mon, 15 Jul 2019 12:30:56 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ettore Chimenti <ek5.chimenti@gmail.com>
Subject: [PATCH 3/6] seco-cec: use cec_notifier_cec_adap_(un)register
Date:   Mon, 15 Jul 2019 12:30:51 +0200
Message-Id: <20190715103054.84849-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
References: <20190715103054.84849-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfCTcJt3rxHkjQpagPVH5KJO+2Zhdc6fLS2Qk5ffpGryCY7yPTlItemOGsDeAuXkVkWmxibR4L0JYi/hnl6iFc0+tzI4soVE59rJTIM+E1ZbhNmIWagWh
 uzvRkU0CIL2Gmhz5BgyDa6uY1MPxn1jeqiLWJ59rbYeMuIkcDbcmdoiAqNiBBn8tqBrbYn/O5uYp6gfLV8blEcjill/Jefyb69ntaqW+54fLhFBrI2NScsdy
 xqyaYHkETC4rFrkFKXhBVzbB3Z0Te+fWl+6cDYIWcyBskUzE6dNyZKUOssA4Ei4m3nfEFiI5uxMIdQ9lJEA9knUtG56npBp3GhNzllC+0AOEiwnstB3Pup+2
 Jk4J9VtH
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use cec_notifier_cec_adap_(un)register instead of
cec_notifier_get_conn, cec_notifier_put and cec_register_cec_notifier.

Also enable the CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Ettore Chimenti <ek5.chimenti@gmail.com>
---
 drivers/media/platform/seco-cec/seco-cec.c | 55 ++++++++++++----------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/seco-cec/seco-cec.c b/drivers/media/platform/seco-cec/seco-cec.c
index 1d0133f01e00..9cd60fe1867c 100644
--- a/drivers/media/platform/seco-cec/seco-cec.c
+++ b/drivers/media/platform/seco-cec/seco-cec.c
@@ -507,10 +507,10 @@ static irqreturn_t secocec_irq_handler(int irq, void *priv)
 }
 
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
 
 static const struct cec_dmi_match secocec_dmi_match_table[] = {
@@ -518,7 +518,8 @@ static const struct cec_dmi_match secocec_dmi_match_table[] = {
 	{ "SECO", "UDOO x86", "0000:00:02.0", "Port B" },
 };
 
-static int secocec_cec_get_notifier(struct cec_notifier **notify)
+static struct device *secocec_cec_find_hdmi_dev(struct device *dev,
+						const char **conn)
 {
 	int i;
 
@@ -533,16 +534,15 @@ static int secocec_cec_get_notifier(struct cec_notifier **notify)
 			d = bus_find_device_by_name(&pci_bus_type, NULL,
 						    m->devname);
 			if (!d)
-				return -EPROBE_DEFER;
+				return ERR_PTR(-EPROBE_DEFER);
 
-			*notify = cec_notifier_get_conn(d, m->conn);
 			put_device(d);
-
-			return 0;
+			*conn = m->conn;
+			return d;
 		}
 	}
 
-	return -EINVAL;
+	return ERR_PTR(-EINVAL);
 }
 
 static int secocec_acpi_probe(struct secocec_data *sdev)
@@ -573,9 +573,15 @@ static int secocec_probe(struct platform_device *pdev)
 {
 	struct secocec_data *secocec;
 	struct device *dev = &pdev->dev;
+	struct device *hdmi_dev;
+	const char *conn = NULL;
 	int ret;
 	u16 val;
 
+	hdmi_dev = secocec_cec_find_hdmi_dev(&pdev->dev, &conn);
+	if (IS_ERR(hdmi_dev))
+		return PTR_ERR(hdmi_dev);
+
 	secocec = devm_kzalloc(dev, sizeof(*secocec), GFP_KERNEL);
 	if (!secocec)
 		return -ENOMEM;
@@ -617,12 +623,6 @@ static int secocec_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = secocec_cec_get_notifier(&secocec->notifier);
-	if (ret) {
-		dev_err(dev, "no CEC notifier available\n");
-		goto err;
-	}
-
 	ret = devm_request_threaded_irq(dev,
 					secocec->irq,
 					NULL,
@@ -640,7 +640,8 @@ static int secocec_probe(struct platform_device *pdev)
 	secocec->cec_adap = cec_allocate_adapter(&secocec_cec_adap_ops,
 						 secocec,
 						 dev_name(dev),
-						 CEC_CAP_DEFAULTS,
+						 CEC_CAP_DEFAULTS |
+						 CEC_CAP_CONNECTOR_INFO,
 						 SECOCEC_MAX_ADDRS);
 
 	if (IS_ERR(secocec->cec_adap)) {
@@ -648,16 +649,20 @@ static int secocec_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	ret = cec_register_adapter(secocec->cec_adap, dev);
-	if (ret)
+	secocec->notifier = cec_notifier_cec_adap_register(hdmi_dev, conn,
+							   secocec->cec_adap);
+	if (!secocec->notifier) {
+		ret = -ENOMEM;
 		goto err_delete_adapter;
+	}
 
-	if (secocec->notifier)
-		cec_register_cec_notifier(secocec->cec_adap, secocec->notifier);
+	ret = cec_register_adapter(secocec->cec_adap, dev);
+	if (ret)
+		goto err_notifier;
 
 	ret = secocec_ir_probe(secocec);
 	if (ret)
-		goto err_delete_adapter;
+		goto err_notifier;
 
 	platform_set_drvdata(pdev, secocec);
 
@@ -665,6 +670,8 @@ static int secocec_probe(struct platform_device *pdev)
 
 	return ret;
 
+err_notifier:
+	cec_notifier_cec_adap_unregister(secocec->notifier);
 err_delete_adapter:
 	cec_delete_adapter(secocec->cec_adap);
 err:
@@ -685,11 +692,9 @@ static int secocec_remove(struct platform_device *pdev)
 
 		dev_dbg(&pdev->dev, "IR disabled");
 	}
+	cec_notifier_cec_adap_unregister(secocec->notifier);
 	cec_unregister_adapter(secocec->cec_adap);
 
-	if (secocec->notifier)
-		cec_notifier_put(secocec->notifier);
-
 	release_region(BRA_SMB_BASE_ADDR, 7);
 
 	dev_dbg(&pdev->dev, "CEC device removed");
-- 
2.20.1

