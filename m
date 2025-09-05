Return-Path: <linux-media+bounces-41809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2367DB450A4
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 10:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC6B95A424F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F8C2FC894;
	Fri,  5 Sep 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="JOQD/D9E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C625B1D2;
	Fri,  5 Sep 2025 08:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059215; cv=none; b=NnXzXMn36ugGLOyWW58VbSCx7HHw8AfQYtdjSiaEU9xPxplIB3PbPamsxUVdU3i0TBbQw/c9/d+sbJH7Pc5C+KnratGjXtv539eExLqHyHejHxs4dDwyQB2/awLNHMa2NO8fAo/0AQik0tqxzuF47+o3cOlI2z1hFmgMdvzNd+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059215; c=relaxed/simple;
	bh=yMCxA1YBoWSwXEzfIBx2mS17OtHXmCeiYqirRRvAdG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YHqi7vt4o6dnPY88fGw7te0Bun9Wg8z3oD+CxQagSGio4i0PKpKmnO30CXw5gPP526/eMibBAL/OEl3sbEmgWZVcOfUnrh7c+ZbKP9v+oZW6WS0MeHDVPtOvbLnUNkvXRyPXwsg448aVbfmJxKT59/XKG3sEoGu1zgNHRXPGNPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=JOQD/D9E; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1757059210; x=1757318410;
	bh=TKLUfGH8uv3WLk2SOPxFiRNjJURmOMHDoaZeUzdLiOs=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JOQD/D9Et30KnY8JwuEIwpaQHwFLtBFnWWCN6ak9KOYk2pjw4OyrVEsZXHm0WhXxo
	 IxCB8k28ZVSTNkDiFFlmMt+wIkk6i306RgMQnuvXYYVMxi1vXovM3T8uPxkmR0/CTN
	 6uaDjJPr5kvs7DR+k+Wl9qJj3yN3/PRk3e7phsrjk198586Ye9Sj4h1FOGcYCCS7Up
	 mJSCCIHtCVHG4sw3XaeYO9paRD0DIATQaIct4eruYaz6BQXoMzctwj+zxAoYfxZb5H
	 w/p+QVzhb5IcWV+AiLzFyRYS+C2l69McwbCbP96wya76u1SN0AInvi55ThTyXWYdXP
	 ls/jvkJCI6L6Q==
X-Pm-Submission-Id: 4cJ8080fKzz2ScWY
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Fri, 05 Sep 2025 09:59:31 +0200
Subject: [PATCH v2 3/4] leds: led-class: Add devicetree support to
 led_get()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-leds-v2-3-ed8f66f56da8@vinarskis.com>
References: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
In-Reply-To: <20250905-leds-v2-0-ed8f66f56da8@vinarskis.com>
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
 linux-arm-msm@vger.kernel.org, Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2846; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=q4BZRBIPBJ3imnNcJBChAehI+qOXxd1Xc7eYB34jKo0=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBm7ZtS/ku/L05jXe15Y9c+f/171HP/OSgiKxjL0x6tr6
 1WtXf6+o5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAExk5XSGf5pWrnd+TLlbUfbR
 Xu1MdIj46oXztyadC5wyrf37SefTigsZGa4Jq80+MeVfUP4j349Cq2qnWfve+OAqtmpjZ8B240c
 XKlkA
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
 drivers/leds/led-class.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 15633fbf3c166aa4f521774d245f6399a642bced..982eb4c1aac998e85b104d7cba26e786ca62056f 100644
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
 
@@ -342,9 +350,16 @@ EXPORT_SYMBOL_GPL(devm_of_led_get);
 struct led_classdev *led_get(struct device *dev, char *con_id)
 {
 	struct led_lookup_data *lookup;
+	struct led_classdev *led_cdev;
 	const char *provider = NULL;
 	struct device *led_dev;
 
+	if (dev->of_node) {
+		led_cdev = of_led_get(dev->of_node, -1, con_id);
+		if (!IS_ERR(led_cdev) || PTR_ERR(led_cdev) != -ENOENT)
+			return led_cdev;
+	}
+
 	mutex_lock(&leds_lookup_lock);
 	list_for_each_entry(lookup, &leds_lookup_list, list) {
 		if (!strcmp(lookup->dev_id, dev_name(dev)) &&

-- 
2.48.1


