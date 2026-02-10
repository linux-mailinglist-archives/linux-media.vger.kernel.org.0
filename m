Return-Path: <linux-media+bounces-52479-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Fnj/G6ORimk1MAAAu9opvQ
	(envelope-from <linux-media+bounces-52479-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:02:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0263C116200
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 03:02:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE197302BE8A
	for <lists+linux-media@lfdr.de>; Tue, 10 Feb 2026 02:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D685B1F4CA9;
	Tue, 10 Feb 2026 02:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2WvFHDE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B179285072
	for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 02:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688899; cv=none; b=naF2Rzgg+bta+sjbyyUgCDW0oUWyrHiZpXDQ6UbbagKQgEQedaFRWMnoy74FJj9C5XYXpiou1B6OBI8Uuw6C74nQMU4IkPINmmFBwqjYB07nMmSzflPgIjCtMyygjKKjIWxR+9VdCdGCgnxNHQRx8LRtqIkXOfzdlxSDSj1RNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688899; c=relaxed/simple;
	bh=pVDlvVS5Bi6Vg+pGcrdIxRvJe/OF7V/L/8y6hmVgEX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNNOKQDyj5rVgtoRlYO+nXZlkdN24HnWAXU81ZFaZek3ZIhlDFmUk/FdN98mj2n8gU5rqTu4LbABmA0l75O9chGQsMbax8X/7H5iQt53nUxmT4m+INZNAvAWBnOOy5DyPkMMqqu79dLP/0eA5PSrb8j27Ad3053sLiJoQIQrZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2WvFHDE; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c5265d06c3so677886585a.1
        for <linux-media@vger.kernel.org>; Mon, 09 Feb 2026 18:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770688897; x=1771293697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=A2WvFHDEg3DQ3fAEnhMSWyNRIEjWPfNo4+F/PLHy9Ccb0D5Pg0MHkd3FJbmydcQ0+g
         X0fWczuctRN+go4bpJzWDd3XiW2oF6erpSk3Ly82U4Nzv6RBhRKyU+YlK4V3T4QKRPUC
         XHjhiSTRUwEcG++ewa5amWbN9TT+y6qzZPDkD42vfNsWbm3EpKr/fdHdUeL4GETeyDYT
         hwpIF9m3bHsfNcUvelKywCgyVPGH6Bven+BIGGNStI0Ep2iA1WMVTJ0MqAUvr3OhOJNU
         uRVGBKxu/STyzYdDZnKijzXqCtJITEy16W4pWiht/NFDTbKBNgbzpYu6aDAOY32LFQy3
         ZF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770688897; x=1771293697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lbk1GUedD4ye8Cnd2HrixlkkqkX5OW0vDgVQlNzH9xs=;
        b=T0SbUbZjVjqJzlsWsqI1WO9youYOWibs2Pbb0QJERIbeYPQVqjgrq6GwF9zjuB0LIf
         LkXHCFROu+AnbKJxZUD3h6fkvu4GjJU8P7byhVbzEND8HindFnVb+ZcwqbT+Mf7kY+l/
         eMZ+2EQfpsXo6GaJuTh8Npmv/za9Xvq/RdrrLOK4CbHHY7V0p9I1iLXx2xvZur9Uh3DG
         AZZhyQNQnSuhp1TU4OxbYnLmNfRjG7FNibFa+8VK+OGGCsPaTD6n76+6IPDvMAK9YgS6
         a9FSvFFLtiiV77IfSfOtNiLXihWSr31NW5sG0NIILMC8a8Y/e5lRXTnExGb+UBkJGu+K
         aXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWblx/2ahRxM/kGBfq3NQb+4Ip+RwGqnXHtM71m/w6iK8ZZMOr5EVNcvocUfj5RzNaHHxl9udSKhsNqgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjwOh8RMeVGQUPUC+Wpo9yfVN9pqwNZm3vlpO+orEtM2GDDfSL
	hkZIbzKN48GqjAgOVctweKFFMKhz9FLO5Q2PAorU3rUMpUs1m8kD5G6B
X-Gm-Gg: AZuq6aIChMBNEduLEZtm3VbB8MNSNDCG+WC/z+EBFETysvVTb2ZEZM5gxN+Nz4YPVsD
	F8GLRdWldfPkbMG7U4JkjfRFNAtKglf/7NI9QNwFd8gknl2MxhjKb2HoWoVo4N8mCOHyuJsLoNj
	71Y77i9l+vP21BMSN881iWkhyOEaLT2HT2RB97Hb3sVUNX5lKE3SZgCDTQnci5BPaBxMNjLLIPp
	HB6k7G5G/AdRkJ4Ni1i+bGau3vguWqMCCzL5KyL3RKguzfj0pcB9d2GEt9/u0B8b0gWcqnA5czM
	dZpwwBhHf9h2q5whAF4rdl8VXgcnk+OBc/e6KaaROdZFuQHq2TUb1KGsbv9A9XjfscXxf7O6EGT
	CHte/p7DpEe4t4iFJUCt+RaZKi9dhBTcjGJdmFMHGf308ofprUgjJ4Oias96dKbsitUaBSXygVS
	w/J0hXO1MoXfaytBtiQDI7zfYcLMcsqDJRYdAcLeEdeUbpIsHVY8z1o4/+/ZQoIhX0YB/IMH2v7
	wZDOUe3xzC2B6BXxVy8lD21JA==
X-Received: by 2002:a05:620a:1a07:b0:8c6:ed0a:3fea with SMTP id af79cd13be357-8cb1ef2cb46mr89320285a.25.1770688896962;
        Mon, 09 Feb 2026 18:01:36 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a15b25sm917375185a.26.2026.02.09.18.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:36 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 3/7] media: i2c: imx355: Support devicetree and power management
Date: Mon,  9 Feb 2026 21:02:02 -0500
Message-ID: <20260210020207.10246-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52479-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0263C116200
X-Rspamd-Action: no action

A device tree compatible makes it possible for this driver to be used on
Open Firmware devices. Initialization of power-managed resources such as
the reset GPIO and voltage regulators can be specified in the device
tree and handled by the driver. Add support for this so the Pixel 3a can
use the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/media/i2c/imx355.c | 111 ++++++++++++++++++++++++++++++++++---
 1 file changed, 103 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 776107efe386..9ca87488c933 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -3,9 +3,13 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
 
 #include <media/v4l2-ctrls.h>
@@ -125,6 +129,15 @@ struct imx355 {
 	 * Protect access to sensor v4l2 controls.
 	 */
 	struct mutex mutex;
+
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data *supplies;
+};
+
+static const struct regulator_bulk_data imx355_supplies[] = {
+	{ .supply = "avdd" },
+	{ .supply = "dvdd" },
+	{ .supply = "dovdd" },
 };
 
 static const struct imx355_reg imx355_global_regs[] = {
@@ -1515,6 +1528,52 @@ static const struct v4l2_subdev_internal_ops imx355_internal_ops = {
 	.open = imx355_open,
 };
 
+static int imx355_power_off(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+
+	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(imx355_supplies), imx355->supplies);
+	clk_disable_unprepare(imx355->clk);
+
+	return 0;
+}
+
+static int imx355_power_on(struct device *dev)
+{
+	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct imx355 *imx355 = to_imx355(sd);
+	int ret;
+
+	ret = clk_prepare_enable(imx355->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clocks");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
+				    imx355->supplies);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to enable regulators");
+		goto error_disable_clocks;
+	}
+
+	usleep_range(1000, 2000);
+	gpiod_set_value_cansleep(imx355->reset_gpio, 0);
+	usleep_range(10000, 11000);
+
+	return 0;
+
+error_disable_clocks:
+	clk_disable_unprepare(imx355->clk);
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(imx355_pm_ops, imx355_power_off,
+				 imx355_power_on, NULL);
+
 /* Initialize control handlers */
 static int imx355_init_controls(struct imx355 *imx355)
 {
@@ -1689,16 +1748,26 @@ static int imx355_probe(struct i2c_client *client)
 				     "external clock %lu is not supported\n",
 				     freq);
 
-	/* Initialize subdev */
-	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
-
-	/* Check module identity */
-	ret = imx355_identify_module(imx355);
+	ret = devm_regulator_bulk_get_const(imx355->dev,
+					    ARRAY_SIZE(imx355_supplies),
+					    imx355_supplies,
+					    &imx355->supplies);
 	if (ret) {
-		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		dev_err_probe(imx355->dev, ret, "could not get regulators");
 		goto error_probe;
 	}
 
+	imx355->reset_gpio = devm_gpiod_get_optional(imx355->dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(imx355->reset_gpio)) {
+		ret = dev_err_probe(imx355->dev, PTR_ERR(imx355->reset_gpio),
+				    "failed to get gpios");
+		goto error_probe;
+	}
+
+	/* Initialize subdev */
+	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
+
 	imx355->hwcfg = imx355_get_hwcfg(imx355->dev);
 	if (!imx355->hwcfg) {
 		dev_err(imx355->dev, "failed to get hwcfg");
@@ -1706,13 +1775,24 @@ static int imx355_probe(struct i2c_client *client)
 		goto error_probe;
 	}
 
+	ret = imx355_power_on(imx355->dev);
+	if (ret)
+		goto error_probe;
+
+	/* Check module identity */
+	ret = imx355_identify_module(imx355);
+	if (ret) {
+		dev_err(imx355->dev, "failed to find sensor: %d", ret);
+		goto error_power_off;
+	}
+
 	/* Set default mode to max resolution */
 	imx355->cur_mode = &supported_modes[0];
 
 	ret = imx355_init_controls(imx355);
 	if (ret) {
 		dev_err(imx355->dev, "failed to init controls: %d", ret);
-		goto error_probe;
+		goto error_power_off;
 	}
 
 	/* Initialize subdev */
@@ -1752,6 +1832,9 @@ static int imx355_probe(struct i2c_client *client)
 error_handler_free:
 	v4l2_ctrl_handler_free(imx355->sd.ctrl_handler);
 
+error_power_off:
+	imx355_power_off(imx355->dev);
+
 error_probe:
 	mutex_destroy(&imx355->mutex);
 
@@ -1768,7 +1851,11 @@ static void imx355_remove(struct i2c_client *client)
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
 	pm_runtime_disable(imx355->dev);
-	pm_runtime_set_suspended(imx355->dev);
+
+	if (!pm_runtime_status_suspended(imx355->dev)) {
+		imx355_power_off(imx355->dev);
+		pm_runtime_set_suspended(imx355->dev);
+	}
 
 	mutex_destroy(&imx355->mutex);
 }
@@ -1779,10 +1866,18 @@ static const struct acpi_device_id imx355_acpi_ids[] __maybe_unused = {
 };
 MODULE_DEVICE_TABLE(acpi, imx355_acpi_ids);
 
+static const struct of_device_id imx355_match_table[] = {
+	{ .compatible = "sony,imx355", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, imx355_match_table);
+
 static struct i2c_driver imx355_i2c_driver = {
 	.driver = {
 		.name = "imx355",
 		.acpi_match_table = ACPI_PTR(imx355_acpi_ids),
+		.of_match_table = imx355_match_table,
+		.pm = &imx355_pm_ops,
 	},
 	.probe = imx355_probe,
 	.remove = imx355_remove,
-- 
2.53.0


