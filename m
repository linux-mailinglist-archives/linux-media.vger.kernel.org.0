Return-Path: <linux-media+bounces-41943-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F920B48144
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 01:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC81817D533
	for <lists+linux-media@lfdr.de>; Sun,  7 Sep 2025 23:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F0923E356;
	Sun,  7 Sep 2025 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="fFcoMM0X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919F235C1E
	for <linux-media@vger.kernel.org>; Sun,  7 Sep 2025 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757287110; cv=none; b=gSu2TtlNwzyKxE+JAanSeQ/kKScHzf1nisI+6tyW4nUpFY3vaPTjct1qsuSnZ9ixnjmCaGRU4thdbeTwEMhgWZFJ1JG9wZ8cDJh3Av67jbiuU2RITgHNseq8wETsEZn7J/3478Cpw+uc7MATEj7F4qCxTIHkVe7hwee9jH6RSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757287110; c=relaxed/simple;
	bh=Gcb5IZdx91tE9heqd3TCL/vKpfvSJeT7p8ruz7OBMGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIMmzQTit4qnRccNjhyA9RDFkvnwsj3l7Qo61+F4jmbZ1TlnXs97xbP3tFxeMvy3o/C8j0u6DuJQ53h5901q/DtmgYRPZsrjgWt8Em84kE2brDJN7/n8yrZAyJGsNE9pJK/n4BLKPU0ZJpVf4e83/WdAHSzxyQrCkqObr5kIYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=fFcoMM0X; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757287101; x=1757546301;
	bh=amlesrrCjtNi/rMOXRLaP/ew+FLiQjpAjiXhBIB6iFo=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=fFcoMM0XKPtJJ46dEL/+YEsq0X/FnE7vPNGCFnQA+gM7JYF94hM0lcPgp2ERFnJQ0
	 E/9idkFSQuKDDcJMHwpQoHTibsncrDwJ8tHhjhofwC1XH5OoOKV3CBE/OOzgXJKKBR
	 kMZfQLFJtSdNi7x/QXtuuhZiybJZL/y3fye0+q4lppns6ZbEsblpJcenyS9p3wTDfY
	 gpQbJ/MuTYGNAZ73xQu5rZbodIqcYnvL6otH5MMnb4g86ZijzdJ2njWMx6aO1ZYyyJ
	 MGjrkT6xIsIMrw9/9lh2u0Qsd6PPT0SxLW8K6soQdEbw+h5S9YbdoP8ch0DHZs/h3j
	 yHuRS1zU6fZSQ==
X-Pm-Submission-Id: 4cKmGg4JL6z1DF4M
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 08 Sep 2025 01:18:05 +0200
Subject: [PATCH v3 3/4] leds: led-class: Add devicetree support to
 led_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-leds-v3-3-5944dc400668@vinarskis.com>
References: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
In-Reply-To: <20250908-leds-v3-0-5944dc400668@vinarskis.com>
To: Hans de Goede <hansg@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jean-Jacques Hiblot <jjhiblot@traphandler.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2813; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=YlfJ62d/o3pOGGQtdA6W03es+ClzT+tk2OK+jve8yPw=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBn7hLaxxj/h7Fn/7odZW9xhI8+HdRu8xKdF8jMa5Vof3
 6hvv/FvRykLgxgXg6yYIkv3n69pXYvmrmW4rvENZg4rE8gQBi5OAZjI9X5GhuMFoQvLD7EfyJwt
 0t2xJK91cm5q0ouvvHcen0xN+jNT0pCRYc+qa44PjGVfPWZ7+uyDr4brTRHuh30nTRr3/nyoM+d
 1CB8A
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


