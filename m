Return-Path: <linux-media+bounces-54983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLTIEZkIr2loMAIAu9opvQ
	(envelope-from <linux-media+bounces-54983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:51:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C4323DF5C
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 18:51:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D9A310C94A
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 17:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4679B2D8384;
	Mon,  9 Mar 2026 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="cVdyhOJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC432749E0;
	Mon,  9 Mar 2026 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773078395; cv=none; b=b6PKsECcKIzX1XW3+hSYP139V0iHDAqsDb9WkGm0unfiDLYet+k0vsu44AX+1cevNUmCTFxdW+LrveDJvLKRC5zP6s7RLBPxEmEwfhkoNNaUbQiFENaUa+fh6tYJCCB2++MsMZr8rwcgyp6Z1c0dRL/iEH95m0kf7PYwIyo/axM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773078395; c=relaxed/simple;
	bh=fN6VySsURCQWMVtjg8/dz48NZHv3BhQj06urpFQP4Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yo4qeGfPnt6Jc7ZKcYrCvIq1ZaLoabAjPgKxftrcGvYouPz0W9c4yWyGcy/ZShykrTgfSP4rQ9+jAQYrW5XD0EO5anYHi/EsKAwTld4SrT41VZWXPpTHWR+6AubEcRlDbeJwmHdaXIMx9pn3/5GZd6cQNtYSjhA9eKin2A6jeoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=cVdyhOJ2; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WlrlJbkbc6GmZ5841B7RnZB+zG8zrXt9wpDIkZ/6yWU=; b=cVdyhOJ2z9q7N8MfHhJJDbHq02
	5/i3pVU6zbmS3JLo1Q0mzilHpWEzpps9trlvVVGWnz8hG9nAGzsB5k3y25ZLCOMCJ+e9fYYEJD1Pa
	XSnQLUh4FUBDX9izkzIY75O9hY9N7JRGSTLBZwzk8q7Ctu5q1FzaYlAXdo8iJ9RoCb/4=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:56968 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vze4U-00Dxnt-1e; Mon, 09 Mar 2026 18:07:10 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Mon, 09 Mar 2026 18:07:10 +0100
Subject: [PATCH v2 8/9] media: i2c: ov08d10: add support for reset and
 power management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-ov08d10-v2-8-81f8b5d99984@emfend.at>
References: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
In-Reply-To: <20260309-ov08d10-v2-0-81f8b5d99984@emfend.at>
To: Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: -1.0
X-Spam-Bar: -
X-Spam-Report: Spam detection software, running on the system "lx20.hoststar.hosting",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  The OV08D10 can be used also on embedded designs using device
    tree so allow the sensor to bind to a device tree node. Signed-off-by: Matthias
    Fend <matthias.fend@emfend.at> --- drivers/media/i2c/ov08d10.c | 7 +++++++
    1 file changed, 7 insertions(+) 
 
 Content analysis details:   (-1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
  0.0 TVD_RCVD_IP            Message was received from an IP address
  0.0 KAM_DMARC_STATUS       Test Rule for DKIM or SPF Failure with Strict
                             Alignment (older systems)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
X-Rspamd-Queue-Id: E4C4323DF5C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54983-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,emfend.at:mid,emfend.at:email]
X-Rspamd-Action: no action

Add support for the required power supplies as well as the control of an
optional sensor reset.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 93 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index ce0fa30a86129302b5dda0b8796e44054fd77c88..19035991e8bb164d4fca5d87ee4551191974e8bb 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -513,9 +514,17 @@ static const char * const ov08d10_test_pattern_menu[] = {
 	"Standard Color Bar",
 };
 
+static const char *const ov08d10_supply_names[] = {
+	"dovdd",	/* Digital I/O power */
+	"avdd",		/* Analog power */
+	"dvdd",		/* Digital core power */
+};
+
 struct ov08d10 {
 	struct device *dev;
 	struct clk *clk;
+	struct reset_control *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(ov08d10_supply_names)];
 
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -1265,6 +1274,56 @@ static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
 	.open = ov08d10_open,
 };
 
+static int ov08d10_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov08d10 *ov08d10 = to_ov08d10(sd);
+
+	reset_control_assert(ov08d10->reset);
+
+	regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
+			       ov08d10->supplies);
+
+	clk_disable_unprepare(ov08d10->clk);
+
+	return 0;
+}
+
+static int ov08d10_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct ov08d10 *ov08d10 = to_ov08d10(sd);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ov08d10->supplies),
+				    ov08d10->supplies);
+	if (ret < 0) {
+		dev_err(dev, "failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(ov08d10->clk);
+	if (ret < 0) {
+		regulator_bulk_disable(ARRAY_SIZE(ov08d10->supplies),
+				       ov08d10->supplies);
+
+		dev_err(dev, "failed to enable imaging clock: %d\n", ret);
+		return ret;
+	}
+
+	if (ov08d10->reset) {
+		/* Delay from DVDD stable to sensor XSHUTDN pull up: 5ms */
+		fsleep(5 * USEC_PER_MSEC);
+
+		reset_control_deassert(ov08d10->reset);
+
+		/* Delay from XSHUTDN pull up to SCCB start: 8ms */
+		fsleep(8 * USEC_PER_MSEC);
+	}
+
+	return 0;
+}
+
 static int ov08d10_identify_module(struct ov08d10 *ov08d10)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(&ov08d10->sd);
@@ -1371,6 +1430,10 @@ static void ov08d10_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov08d10->dev);
+	if (!pm_runtime_status_suspended(ov08d10->dev)) {
+		ov08d10_power_off(ov08d10->dev);
+		pm_runtime_set_suspended(ov08d10->dev);
+	}
 	mutex_destroy(&ov08d10->mutex);
 }
 
@@ -1378,6 +1441,7 @@ static int ov08d10_probe(struct i2c_client *client)
 {
 	struct ov08d10 *ov08d10;
 	unsigned long freq;
+	unsigned int i;
 	int ret;
 
 	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
@@ -1403,12 +1467,32 @@ static int ov08d10_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ov08d10->reset = devm_reset_control_get_optional_exclusive(ov08d10->dev, NULL);
+	if (IS_ERR(ov08d10->reset))
+		return dev_err_probe(ov08d10->dev, PTR_ERR(ov08d10->reset),
+				     "failed to get reset\n");
+	reset_control_assert(ov08d10->reset);
+
+	for (i = 0; i < ARRAY_SIZE(ov08d10_supply_names); i++)
+		ov08d10->supplies[i].supply = ov08d10_supply_names[i];
+
+	ret = devm_regulator_bulk_get(ov08d10->dev,
+				      ARRAY_SIZE(ov08d10->supplies),
+				      ov08d10->supplies);
+	if (ret)
+		return dev_err_probe(ov08d10->dev, ret,
+				     "failed to get regulators\n");
+
 	v4l2_i2c_subdev_init(&ov08d10->sd, client, &ov08d10_subdev_ops);
 
+	ret = ov08d10_power_on(ov08d10->dev);
+	if (ret)
+		return dev_err_probe(ov08d10->dev, ret, "failed to power on\n");
+
 	ret = ov08d10_identify_module(ov08d10);
 	if (ret) {
 		dev_err(ov08d10->dev, "failed to find sensor: %d\n", ret);
-		return ret;
+		goto probe_error_power_off;
 	}
 
 	mutex_init(&ov08d10->mutex);
@@ -1452,9 +1536,15 @@ static int ov08d10_probe(struct i2c_client *client)
 	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
 	mutex_destroy(&ov08d10->mutex);
 
+probe_error_power_off:
+	ov08d10_power_off(ov08d10->dev);
+
 	return ret;
 }
 
+static DEFINE_RUNTIME_DEV_PM_OPS(ov08d10_pm_ops,
+				 ov08d10_power_off, ov08d10_power_on, NULL);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id ov08d10_acpi_ids[] = {
 	{ "OVTI08D1" },
@@ -1473,6 +1563,7 @@ MODULE_DEVICE_TABLE(of, ov08d10_of_match);
 static struct i2c_driver ov08d10_i2c_driver = {
 	.driver = {
 		.name = "ov08d10",
+		.pm = pm_ptr(&ov08d10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
 		.of_match_table = ov08d10_of_match,
 	},

-- 
2.34.1


