Return-Path: <linux-media+bounces-42194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E196B514FF
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 13:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5F703BE564
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8877131D759;
	Wed, 10 Sep 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="NAu7yzE0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D89331691F;
	Wed, 10 Sep 2025 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502490; cv=none; b=rJud3qfWhpSPpyoZCApW09T4okbpIDf0XFSzZs0NpcU0IYQoGFty2gWEn3D5d2O9kcCzlgM+mFc+mdr1qJhNSd4jQ6+V6DPstqMSDX9RD/KP23aKc6VEFWqZmn0CfmuRPGPcplBwRx6xcrr+booSYmhim67qwB02zctsrq6d7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502490; c=relaxed/simple;
	bh=Gcb5IZdx91tE9heqd3TCL/vKpfvSJeT7p8ruz7OBMGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSrg9jXw1yvKeat1TPXvN/TNQYEbb6M67Wc/EZB9qRooLu2LPtMrL2KROe9dww0hgr78Ke6tzl0C3o/6fz+uTfsYWsovgTg44w7lIG+oTUsuEJ7HV7JZle8cHu20bxiq8CaDet2VAlg1nXAH6L1Cpx+Z1t2h6bg4b8G2HAKcHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=NAu7yzE0; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757502480; x=1757761680;
	bh=amlesrrCjtNi/rMOXRLaP/ew+FLiQjpAjiXhBIB6iFo=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NAu7yzE0qEFgttE/tOPxb33KrDSwPE7s2lNMi70rHjkj4gRw2BkR3RZ40SHXgPDBG
	 x4GtzVHZ07QEMRJdpV7aY5fuRsS0b5bpEh7QffUSTK0PtSXr+ukCwYQJl+hY39wUgy
	 NwDe9kUNNTppRfZ0G8PrPIpHp740XZJETWxqu3JfJMIEJR5HjDMhL3P+736clX+AD8
	 X3eXOsBfWZp/4K4hy1IwLiXAPGYn610SxqLcD19U0els4KYRQt0gYrxvD0gCtgsHb+
	 1Mjyoz8RLabGSGkzNgrExDXJkiu1Qv423GssxwmEiZpuBNkL1nP8iihwhWcPk8MsM8
	 VNxnbWdG3sLwg==
X-Pm-Submission-Id: 4cMHwZ0W8cz2ScCs
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 13:07:39 +0200
Subject: [PATCH v4 3/4] leds: led-class: Add devicetree support to
 led_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v4-3-1fc320488233@vinarskis.com>
References: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
In-Reply-To: <20250910-leds-v4-0-1fc320488233@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 threeway@gmail.com, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=YlfJ62d/o3pOGGQtdA6W03es+ClzT+tk2OK+jve8yPw=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHY1hayi7XO90LfPMtO1JQKeRkRZZ68N7zkUXFpx6ZG
 z189Kqgo5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAExknzHDP4O270Kd+2JfiC4S
 ne3JIFy9peuOTZPVEie/VQ2pzNXnshgZeu9FVzzbwfY1tCqjo2Zmo8lDH8b81WtEuL76aP2a/LO
 DBQA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

From: Hans de Goede <hansg@kernel.org>

Add 'name' argument to of_led_get() such that it can lookup LEDs in
devicetree by either name or index.

And use this modified function to add devicetree support to the generic
(non devicetree specific) [devm_]led_get() function.

This uses the standard devicetree pattern of adding a -names string array
to map names to the indexes for an array of resources.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Lee Jones <lee@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 drivers/leds/led-class.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 15633fbf3c166aa4f521774d245f6399a642bced..f3faf37f9a08ac762ed87b91cb3cab5faa8eacb0 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -252,15 +252,23 @@ static const struct class leds_class = {
  * of_led_get() - request a LED device via the LED framework
  * @np: device node to get the LED device from
  * @index: the index of the LED
+ * @name: the name of the LED used to map it to its function, if present
  *
  * Returns the LED device parsed from the phandle specified in the "leds"
  * property of a device tree node or a negative error-code on failure.
  */
-static struct led_classdev *of_led_get(struct device_node *np, int index)
+static struct led_classdev *of_led_get(struct device_node *np, int index,
+				       const char *name)
 {
 	struct device *led_dev;
 	struct device_node *led_node;
 
+	/*
+	 * For named LEDs, first look up the name in the "led-names" property.
+	 * If it cannot be found, then of_parse_phandle() will propagate the error.
+	 */
+	if (name)
+		index = of_property_match_string(np, "led-names", name);
 	led_node = of_parse_phandle(np, "leds", index);
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
@@ -324,7 +332,7 @@ struct led_classdev *__must_check devm_of_led_get(struct device *dev,
 	if (!dev)
 		return ERR_PTR(-EINVAL);
 
-	led = of_led_get(dev->of_node, index);
+	led = of_led_get(dev->of_node, index, NULL);
 	if (IS_ERR(led))
 		return led;
 
@@ -342,9 +350,14 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
 struct led_classdev *led_get(struct device *dev, char *con_id)
 {
 	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
 	const char *provider = NULL;
 	struct device *led_dev;
 
+	led_cdev = of_led_get(dev->of_node, -1, con_id);
+	if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+		return led_cdev;
+
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->dev_id, dev_name(dev)) &&

-- 
2.48.1


