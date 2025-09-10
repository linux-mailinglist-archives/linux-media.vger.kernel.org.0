Return-Path: <linux-media+bounces-42204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15452B5166A
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 14:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 347D87B438C
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 12:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83BEC31A55A;
	Wed, 10 Sep 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="YOQTzDwf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA01288CB5
	for <linux-media@vger.kernel.org>; Wed, 10 Sep 2025 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505695; cv=none; b=j1Y7HU50VSTFm5DG/AJ2JDjY0sEx4u77o7jlE8KRBF7TewajIw3Lz2Pxmv0kL0y2zpS/GwuI32tJQI7NW5KAoK12zHbvikQi3lu1vcysuRMH8ZU+dyq/A/dm6DStbdm6HyDDlT0q0A1KepjR0+MrPpyc3GBwwgocW/lNdORAlTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505695; c=relaxed/simple;
	bh=Gcb5IZdx91tE9heqd3TCL/vKpfvSJeT7p8ruz7OBMGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dElOUzV1VsdPy9tRxJFn70DPdtEFQzGqPoUuSMka2Ohg9LfWjLXyBlczLTWK6pWqtCmtKAhCSGH5yM98x5gI6TJFHa64hV/9CXPxzRahOh0WKYSwbUN8ezbovMwPJWCyE4/xxkGvN4ZUM7Kkv450YBJd0ENu5funxsHO7e0EmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=YOQTzDwf; arc=none smtp.client-ip=185.70.43.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757505690; x=1757764890;
	bh=amlesrrCjtNi/rMOXRLaP/ew+FLiQjpAjiXhBIB6iFo=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YOQTzDwfVpD/gqjhjBmhI/Xf37NlZC9uEXyALze5c/VZkehDZLDcHyMkdzdXr0FP4
	 qSmKBs9DV0XeShRuTfy/zSgYFYt/ns4U9naG3ANyJlEV1dXGHRFN+BYbDEI4ybWXq5
	 3C+juG/M6V0+DsFjWAr7hyuEogymBiTle+SQCrEkTjTsMAbzTbzmuYHnXzVr7YmXWi
	 ZpTSykU5FPRzfZrSiTA7hVdrPoOsa58/Fu3jzDF5XKxpTiLGwsP+5yAMqYQz2CrW9R
	 KbdZlJM6LjuAw3zoYl/E2z6lgr2r7S8LxHREFiq/ZvNHvnvg6XbrDLpdySrgG5tbmg
	 LYf8MZUv2wNuQ==
X-Pm-Submission-Id: 4cMK6H4k7Vz2ScCy
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 10 Sep 2025 14:01:10 +0200
Subject: [PATCH v5 3/4] leds: led-class: Add devicetree support to
 led_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-leds-v5-3-bb90a0f897d5@vinarskis.com>
References: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
In-Reply-To: <20250910-leds-v5-0-bb90a0f897d5@vinarskis.com>
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
 Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=YlfJ62d/o3pOGGQtdA6W03es+ClzT+tk2OK+jve8yPw=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBkHMya88djY7L3Se+PD7UJznNYpNX44ZlU9v/a6WJF8k
 8D5oNM/OkpZGMS4GGTFFFm6/3xN61o0dy3DdY1vMHNYmUCGMHBxCsBEQpwY/ko3tBfrmlj5W0eV
 vuo83uPwUGvSRMHshgf5E4/pcYaU7WNk+NgssO13nfQBl1fCIZ85X/7edIlZZ3tCzKu3rCev1Lh
 HsQIA
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


