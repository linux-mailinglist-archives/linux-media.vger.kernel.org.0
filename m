Return-Path: <linux-media+bounces-67223-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DrvrJ3SCUGpy0QIAu9opvQ
	(envelope-from <linux-media+bounces-67223-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 07:26:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F8573754C
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 07:26:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pjln7nLG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67223-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67223-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 411A1300DDC0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 05:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7EA379C38;
	Fri, 10 Jul 2026 05:25:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432C3793C3
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 05:25:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783661130; cv=none; b=iXAihQxIh62jV+04iwXz6CRI6Nw/9FeEWEAQUe7oddzaYk3eGQ6XQu7/PhEid205leiI3HoYD6tdswn28bHiyJ0X1sRJ9wu4LPs4i9I9dolOXsOC9XZbet61AipKqwcaN+5uYDJY4KWcbjRdHQZUDVmPPeOZTZ3ugOiYGSTizA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783661130; c=relaxed/simple;
	bh=6BFg6sPI3okgrHxzhlSMRgyX9vuNYoJ8TgSTZlqHBhE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=alpURl0sIF4ib7KVMfnnc8NDZ5qyWDQbV2vY9ULlbEYzWrt4RKOJ4NJNVjTa1IaIs4tdwHDKlKSe4kXRUPFhrvUwKyQxqaS0LKiFka0Ufi6L2OYZLCzxqoeT5RRAkAppTf3sqN0qUa3gPDKl3SAvBXsWcFdNxFcYDd49NsN+IAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjln7nLG; arc=none smtp.client-ip=209.85.215.179
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso379817a12.2
        for <linux-media@vger.kernel.org>; Thu, 09 Jul 2026 22:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783661129; x=1784265929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+yyDbnS7MzY461JKpKTsvuYdfC2If2+XrHZ9AJhM98=;
        b=pjln7nLG9f8Qp3cyZaZwOVs5XXjh5PjuUIBZkuek+HaT8ImPJsdKiEuwk9eYlTAjw0
         0wxJYN2ObM7HI8mU/j9iAeakpiX3V4TmYgOQViY+F4Yt6jzQy/qpUWzIjyxhWwv91hjv
         B9A133c7uqpZiw/dNeYi0C5sjOcH+H6EDXPSF5wXN48QPQ0BUsKjvPAF+C0vZ+k6OuG/
         J2I23gdHv5y+Y6hXrh/y80eNF+zYpA//0bzxzD6BrYHcJRIuXXV7aTTzZYx3pbPjxLrh
         JhU913Ls8NoUcfcuqe8fH40815tEcZd0oX980B7wlLU82e/ZK1hwn4xKVuWtudAMwWoW
         t5AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783661129; x=1784265929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+yyDbnS7MzY461JKpKTsvuYdfC2If2+XrHZ9AJhM98=;
        b=W0M80ozypv6gLB1YtaMoDw9BJQ5lHL0uYhALHbFu8sV0DpnrwflYWcocR57nnMCPjl
         oJG3gJaeWWSUbF295cSS63KwxRNQOUiFS2f+/sKGj2QfczncF4Y/Lf0TpX2LxJsvTsMz
         S1hmN/OLIIgL0IQnXep1HharO5fgKBLj22t8TCAxkCjGAdnhWCvoe7P9+peLFgL8x7W+
         wnrkcnTgsH3RkjlAnapydU5jAD9sEgJAA+2pDlagpJ0lf/UHxNLJ2gT7yWRmF78EK2DO
         kSCo/txZABR45UmCXJek3UrE1qjgyx1u8WuiYb6/XxNP8R3c3z44TZWxKaVhArbMK/8z
         wkMg==
X-Gm-Message-State: AOJu0YwKc7kwRyl2VOi0dOFNFrB0qzV93NUQVlzKV0Z0lKxxGN/Lgnex
	dp5Q1PITrZoGIuekhqfpQfsRbUqpBpy8by5cr24GAi+0bn+lNMO8NoOZRRgicQ==
X-Gm-Gg: AfdE7cmLtla0NTXhtkj/hCARjWUh0eCEZgPgcv1+Ghy7sNQwJM7sP6frGLgbYdwaURx
	f31U6zs8NrvUjftRLTI+1dU/ZbM0y7Iep9fWBoHG82TdgC+ZuUOBI2bIiFZ4cBH4MeI6tSnF/oo
	NFD6C4zwXBj9Ir+W1FAQU0wlVjZpnwG0+2t+jfaToNnmd75hjIEiSWtlxtbKtpgzwnYpIQfmt3G
	9gRqs1ZKxEGa5FQ7x5liH1xo8XKdUZ3t31UNrEsBhHfogX9W5gFXKosDDjkUaIT6SjU3FW+DaxR
	QyxryB9P8V+uihaIwgtb+W/Ih+PZ/roDOFD/0uRM1Yzu/i26gbafoC8jIQtgRDAyOBkxerqn+70
	uuNN2fxkaA+yZQqWnAQZlx91gNwI7xoU8Czw9/KG0ArBhgP/48SrTRQzR3jvBJkUkwexLA9I5v8
	ZLRtcPX6egrxBj5fOM+rKjsrrHfX/KNXfe/fXnAnF+
X-Received: by 2002:a05:6a21:329e:b0:3bf:d1f9:b1df with SMTP id adf61e73a8af0-3c0bcc241abmr12412257637.54.1783661128588;
        Thu, 09 Jul 2026 22:25:28 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm947768c88.6.2026.07.09.22.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:25:28 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: gc0310: Use devm_v4l2_sensor_clk_get()
Date: Fri, 10 Jul 2026 10:55:23 +0530
Message-Id: <20260710052523.1580208-1-sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67223-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sanjayembeddedse@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1F8573754C

Several camera sensor drivers access the "clock-frequency" property
directly to retrieve the external clock rate or handle the external
clock manually in the driver. While this is valid on a subset of ACPI
platforms, implementing this logic directly in drivers is deprecated
and can lead to inconsistent behaviour across drivers.

This driver supports ACPI platforms only. It currently retrieves the
external clock rate from the "clock-frequency" property and fails
probing if the rate does not match the expected value, which is the
correct policy for ACPI platforms.

Switch to using the devm_v4l2_sensor_clk_get() helper to standardise
clock handling. This preserves the existing behaviour on ACPI
platforms that specify a clock-frequency property without providing
a clock. On platforms that provide a clock, the helper will program
the clock to the rate specified by clock-frequency, which is also
consistent with the driver's expectations.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>

---
Changes in v2:
- With input from Hans de drop first 2 changes and rebase 3rd change
  along with reviewed tag on top of mainline tree and v7.2-rc2 commit tag.
- Link to v1: https://lore.kernel.org/20260401181657.654055-1-sanjayembedded@gmail.com
---
 drivers/media/i2c/gc0310.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/gc0310.c b/drivers/media/i2c/gc0310.c
index 7af4d66f42a0..754e82ad50ae 100644
--- a/drivers/media/i2c/gc0310.c
+++ b/drivers/media/i2c/gc0310.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2023-2025 Hans de Goede <hansg@kernel.org>
  */
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
@@ -84,6 +85,8 @@
 #define to_gc0310_sensor(x) container_of(x, struct gc0310_device, sd)
 
 struct gc0310_device {
+	struct clk *clk;
+
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 
@@ -635,7 +638,6 @@ static int gc0310_check_hwcfg(struct device *dev)
 	};
 	struct fwnode_handle *ep_fwnode;
 	unsigned long link_freq_bitmap;
-	u32 mclk;
 	int ret;
 
 	/*
@@ -647,21 +649,6 @@ static int gc0310_check_hwcfg(struct device *dev)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "waiting for fwnode graph endpoint\n");
 
-	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
-				       &mclk);
-	if (ret) {
-		fwnode_handle_put(ep_fwnode);
-		return dev_err_probe(dev, ret,
-				     "reading clock-frequency property\n");
-	}
-
-	if (mclk != GC0310_MCLK_FREQ) {
-		fwnode_handle_put(ep_fwnode);
-		return dev_err_probe(dev, -EINVAL,
-				     "external clock %u is not supported\n",
-				     mclk);
-	}
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep_fwnode, &bus_cfg);
 	fwnode_handle_put(ep_fwnode);
 	if (ret)
@@ -685,6 +672,7 @@ static int gc0310_check_hwcfg(struct device *dev)
 static int gc0310_probe(struct i2c_client *client)
 {
 	struct gc0310_device *sensor;
+	unsigned long freq;
 	int ret;
 
 	ret = gc0310_check_hwcfg(&client->dev);
@@ -695,6 +683,16 @@ static int gc0310_probe(struct i2c_client *client)
 	if (!sensor)
 		return -ENOMEM;
 
+	sensor->clk = devm_v4l2_sensor_clk_get(&client->dev, NULL);
+	if (IS_ERR(sensor->clk))
+		return dev_err_probe(&client->dev, PTR_ERR(sensor->clk),
+				     "failed to get clock\n");
+
+	freq = clk_get_rate(sensor->clk);
+	if (freq != GC0310_MCLK_FREQ)
+		return dev_err_probe(&client->dev, -EINVAL,
+				     "external clock %lu is not supported\n", freq);
+
 	sensor->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(sensor->reset)) {
 		return dev_err_probe(&client->dev, PTR_ERR(sensor->reset),
-- 
--


