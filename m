Return-Path: <linux-media+bounces-19508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C799B7B9
	for <lists+linux-media@lfdr.de>; Sun, 13 Oct 2024 01:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86B82B21BC9
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 23:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB3319B3ED;
	Sat, 12 Oct 2024 23:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="EKn7ukIg"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8274379B8E;
	Sat, 12 Oct 2024 23:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728776382; cv=none; b=p/6o2JZ80ZCMKb/ssUSoLzLZAsEqtI6T4J9u9M5+S7OIdrVbPeMj+bYLgtTMvu19EBkqBWsXXc4gaCo1kkyh6GPo+hgIJ7hhsHR3COK1Uk8NfmVKaM+FOlXUuoX3/Mo4l3M/bqyjyZm4w8oLY1OUocotcoHS0B4zO9tDnhi6RPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728776382; c=relaxed/simple;
	bh=Lvp4XMKZT0Msx2BP1OlrTELat4dxL8jOxWfHODmrYl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rNlZLBJFXdqYCu/ugCvRqm0DVeMmrv5R6kzpyH7NyZDpqxVfQ91xOft+MAcBm8xtFwbXILHwqCPwcCJ6g58hU9Ahaj5m9q+KKWV64B4jRsKJn4b3sXowvEbz/JhUDubgm7VSckxKpdYBGwPlpsySjA3XdUAUxRenqHM9P7seDuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=EKn7ukIg; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=FDFta6+gVmW4sA29UM+ntCLuPQfG8JMBoQof2jWBlcU=; b=EKn7ukIgrSmX2Ow6
	4j88Be5HMFt9CgqgCO9XSLoDGVdVyIdKjtHs5Y3sk437OotpW1adZhT31Q6awc8YGEFjso7qJPpsY
	uAjkbGGn1HwwclMO8Q64A16s59o+vZIK7nrcGwJ5yYTVS8Wu1M6vRuifH+MCr1S8L5euEDhRpHpnN
	/0JH9Sel4QPXHHxaXvEJHW1QKjLcD+CDKoEDRZm07OHWjYMd3OIzOQXcyojISlDR3W8kcWblzcX29
	L75lthEFZvl90hUFb7HwY82gvNP2vVc1nFPzZV7J1HAEhnG4elVA1HS5wec6epmIuipK6GkiWOlrU
	P7Bnr0zGwG8T0HBd6g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1szlht-00AjOB-0p;
	Sat, 12 Oct 2024 23:39:33 +0000
From: linux@treblig.org
To: awalls@md.metrocast.net,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2] media: cx18: Remove unused cx18_reset_ir_gpio
Date: Sun, 13 Oct 2024 00:39:32 +0100
Message-ID: <20241012233932.255211-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

cx18_reset_ir_gpio() has been unused in tree since 2009
commit eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected
functions to act as v4l2_subdevices")

It has a comment saying it's exported for use by 'lirc_pvr150' but I don't
see any sign of it in the lirc git, and I see it removed support
for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
 drivers/media/pci/cx18/cx18-gpio.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-gpio.c b/drivers/media/pci/cx18/cx18-gpio.c
index c85eb8d25837..485a6cbeb15a 100644
--- a/drivers/media/pci/cx18/cx18-gpio.c
+++ b/drivers/media/pci/cx18/cx18-gpio.c
@@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
 	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
 }
 
-void cx18_reset_ir_gpio(void *data)
-{
-	struct cx18 *cx = to_cx18(data);
-
-	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
-		return;
-
-	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
-
-	v4l2_subdev_call(&cx->sd_resetctrl,
-			 core, reset, CX18_GPIO_RESET_Z8F0811);
-}
-EXPORT_SYMBOL(cx18_reset_ir_gpio);
-/* This symbol is exported for use by lirc_pvr150 for the IR-blaster */
-
 /* Xceive tuner reset function */
 int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value)
 {
diff --git a/drivers/media/pci/cx18/cx18-gpio.h b/drivers/media/pci/cx18/cx18-gpio.h
index 0fa4c7ad2286..8d5797dea7f5 100644
--- a/drivers/media/pci/cx18/cx18-gpio.h
+++ b/drivers/media/pci/cx18/cx18-gpio.h
@@ -17,5 +17,4 @@ enum cx18_gpio_reset_type {
 	CX18_GPIO_RESET_XC2028  = 2,
 };
 
-void cx18_reset_ir_gpio(void *data);
 int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int value);
-- 
2.47.0


