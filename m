Return-Path: <linux-media+bounces-53448-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNjkFIoSoGlAfgQAu9opvQ
	(envelope-from <linux-media+bounces-53448-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:29:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFE1A364B
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0219313BB19
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843E73A0B28;
	Thu, 26 Feb 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="CqTFEHnn"
X-Original-To: linux-media@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CC63A0B2E;
	Thu, 26 Feb 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772097837; cv=none; b=pfxObAgn+NEKOmYwP6uMaPJJg+DCKsD8JK5nDmDh6Nu4Zp8CgF3ym0fR3VO8CW6IXwLwS14z9ERSREaNo7YzpQLLptF06PhmbaDOHLsmxGR/LiVTKmIHfW5eUEXT+rPbM29UcedH5U4goX64GM70LfZZTzHsGawH6gg0jnd4U6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772097837; c=relaxed/simple;
	bh=U/2m1YDq6SRth7XLtHQLa3G9VcFA0fCWGrEtNsomfRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2DjRuIqRE2DEMbwU7W6fXWdm6DyjVcDY8lhSCAk6Qvj8gjCKp0WpFcMcGhs7wLskG7NiJqQtB8k3576BAVazqgD2Zsr9IB7ZO0q8yeTiOYSsEYrR+I1wwF1qG1QYqLF9i48b4bx+cj1/ZOeHUFpUII309lsPqhROZ79zzCiuLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=CqTFEHnn; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0/3nYAUP0EJ2VBJ1eT0k6zWYlUtrAsenO1czavD3b5U=; b=CqTFEHnnEl/lxudD151t9G+US2
	xUrkaC2PsGW2d2l5Uh2vLLSxz3qOSl+oR9eNNTerqBvq26ixQPWIBJ03Vn4+tL4sO02z5ZXarRQpw
	oylm02oDPxcAX87q20BJmlwd9u/KL6WWQHS7a7x6Zxvxp0qFPDfuq7Ksqx/+EIDewaJE=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:64689 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1vvXAu-0018Zt-7Z; Thu, 26 Feb 2026 09:56:48 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Date: Thu, 26 Feb 2026 09:56:03 +0100
Subject: [PATCH 3/8] media: i2c: ov08d10: add support for reset and power
 management
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-ov08d10-v1-3-c3a916368123@emfend.at>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
In-Reply-To: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
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
  0.0 Local_hs_NotToHoststar Recipient is NOT hoststar.(ch|at|com)
  0.0 Local_hs_NotFromHoststar Sender is NOT hoststar.(ch|at|com)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[emfend.at:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53448-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[emfend.at];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	FROM_NEQ_ENVFROM(0.00)[matthias.fend@emfend.at,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[emfend.at:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,emfend.at:mid,emfend.at:email]
X-Rspamd-Queue-Id: DFCFE1A364B
X-Rspamd-Action: no action

Add support for the required power supplies as well as the control of an
optional sensor reset.

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
 drivers/media/i2c/ov08d10.c | 104 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 97 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index cfe18dcde174ddc1f198cb2aaa6b4a3b34045508..4dba264488b3e1950016deb3fa34732871cc34fc 100644
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
@@ -514,9 +515,17 @@ static const char * const ov08d10_test_pattern_menu[] = {
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
@@ -1266,6 +1275,56 @@ static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
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
@@ -1372,6 +1431,10 @@ static void ov08d10_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov08d10->dev);
+	if (!pm_runtime_status_suspended(ov08d10->dev)) {
+		ov08d10_power_off(ov08d10->dev);
+		pm_runtime_set_suspended(ov08d10->dev);
+	}
 	mutex_destroy(&ov08d10->mutex);
 }
 
@@ -1379,6 +1442,7 @@ static int ov08d10_probe(struct i2c_client *client)
 {
 	struct ov08d10 *ov08d10;
 	unsigned long freq;
+	unsigned int i;
 	int ret;
 
 	ov08d10 = devm_kzalloc(&client->dev, sizeof(*ov08d10), GFP_KERNEL);
@@ -1404,12 +1468,32 @@ static int ov08d10_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ov08d10->reset = devm_reset_control_get_optional(ov08d10->dev, NULL);
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
 		dev_err(ov08d10->dev, "failed to find sensor: %d", ret);
-		return ret;
+		goto probe_error_power_off;
 	}
 
 	mutex_init(&ov08d10->mutex);
@@ -1430,6 +1514,9 @@ static int ov08d10_probe(struct i2c_client *client)
 		goto probe_error_v4l2_ctrl_handler_free;
 	}
 
+	pm_runtime_set_active(ov08d10->dev);
+	pm_runtime_enable(ov08d10->dev);
+
 	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
 	if (ret < 0) {
 		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d",
@@ -1437,26 +1524,28 @@ static int ov08d10_probe(struct i2c_client *client)
 		goto probe_error_media_entity_cleanup;
 	}
 
-	/*
-	 * Device is already turned on by i2c-core with ACPI domain PM.
-	 * Enable runtime PM and turn off the device.
-	 */
-	pm_runtime_set_active(ov08d10->dev);
-	pm_runtime_enable(ov08d10->dev);
 	pm_runtime_idle(ov08d10->dev);
 
 	return 0;
 
 probe_error_media_entity_cleanup:
+	pm_runtime_disable(ov08d10->dev);
+	pm_runtime_set_suspended(ov08d10->dev);
 	media_entity_cleanup(&ov08d10->sd.entity);
 
 probe_error_v4l2_ctrl_handler_free:
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
@@ -1475,6 +1564,7 @@ MODULE_DEVICE_TABLE(of, ov08d10_of_match);
 static struct i2c_driver ov08d10_i2c_driver = {
 	.driver = {
 		.name = "ov08d10",
+		.pm = pm_ptr(&ov08d10_pm_ops),
 		.acpi_match_table = ACPI_PTR(ov08d10_acpi_ids),
 		.of_match_table = ov08d10_of_match,
 	},

-- 
2.34.1


