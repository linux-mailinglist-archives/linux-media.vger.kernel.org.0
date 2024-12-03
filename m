Return-Path: <linux-media+bounces-22502-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 866089E1448
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 08:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46438285B77
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 07:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B49018BC1D;
	Tue,  3 Dec 2024 07:32:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053BD7E591;
	Tue,  3 Dec 2024 07:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211160; cv=none; b=Vutldxihgg2aYJ4uEnxCtUg0d+TuZDIiSkYQsKM/LoV1KEO46LDhIO+uftz8S03P3z833rjakxuGskMnKXNNBVsqpWO56KjYbOgETghSJZc59jJuEXiEZ6IubpQLW/H+FMUte/ryiyVbekTe4t0Vk65NScX3fH3NRYS5gmyoHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211160; c=relaxed/simple;
	bh=+Xl3lu+VXqqmJBdNllhibQiFsvDx9x822+cm3lXnKpA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eSwMnsltnL6zIXNcmWkAy/z9GjWzFuE0kzkwmwKKJaIclBmDIA/LumNhmyIoZnqMCP2Wn1TRygSvbG0c4DP/XMJlqljRGjCZ8H9LUzxRjYNL0Xoc0dYYSN0DpcSrF2glSR0r++vaCRz+aI4ujuN24u8cmCDM1iLpzqXp45dDB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:9667.1260465660
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id EF84A102915;
	Tue,  3 Dec 2024 15:27:44 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id 4830e516074d44918743ff5d3f586373 for mchehab@kernel.org;
	Tue, 03 Dec 2024 15:27:44 CST
X-Transaction-ID: 4830e516074d44918743ff5d3f586373
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
From: Song Chen <chensong_2000@189.cn>
To: mchehab@kernel.org,
	arnd@arndb.de,
	hverkuil-cisco@xs4all.nl
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Song Chen <chensong_2000@189.cn>
Subject: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
Date: Tue,  3 Dec 2024 15:27:42 +0800
Message-Id: <20241203072742.191787-1-chensong_2000@189.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIO subsystem is moving toward a descriptor-based approach
from global GPIO numberspace, but some of legacy GPIO APIs
callings still remain in sta2x11.

This patch mainly replaces gpio_request with gpiod_get_index
and removes including gpio.h.

Signed-off-by: Song Chen <chensong_2000@189.cn>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 84 ++++++++++++-------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 364ce9e57018..03ad75899e09 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -19,7 +19,6 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <media/v4l2-common.h>
@@ -139,6 +138,8 @@ struct sta2x11_vip {
 
 	void __iomem *iomem;	/* I/O Memory */
 	struct vip_config *config;
+	struct gpio_desc  *gpiod_pwr;
+	struct gpio_desc  *gpiod_reset;
 };
 
 static const unsigned int registers_to_save[AUX_COUNT] = {
@@ -888,18 +889,16 @@ static int sta2x11_vip_init_controls(struct sta2x11_vip *vip)
  * @name: GPIO pin name
  *
  */
-static int vip_gpio_reserve(struct device *dev, int pin, int dir,
-			    const char *name)
+static int vip_gpio_reserve(struct device *dev, struct gpio_desc **pgpiod,
+			int pin, int dir, const char *name)
 {
-	struct gpio_desc *desc = gpio_to_desc(pin);
+	struct gpio_desc *desc;
 	int ret = -ENODEV;
 
-	if (!gpio_is_valid(pin))
-		return ret;
-
-	ret = gpio_request(pin, name);
-	if (ret) {
+	desc = gpiod_get_index(dev, name, pin, GPIOD_ASIS);
+	if (IS_ERR(desc)) {
 		dev_err(dev, "Failed to allocate pin %d (%s)\n", pin, name);
+		ret = PTR_ERR(desc);
 		return ret;
 	}
 
@@ -907,18 +906,21 @@ static int vip_gpio_reserve(struct device *dev, int pin, int dir,
 	if (ret) {
 		dev_err(dev, "Failed to set direction for pin %d (%s)\n",
 			pin, name);
-		gpio_free(pin);
-		return ret;
+		goto err;
 	}
 
 	ret = gpiod_export(desc, false);
 	if (ret) {
 		dev_err(dev, "Failed to export pin %d (%s)\n", pin, name);
-		gpio_free(pin);
-		return ret;
+		goto err;
 	}
 
+	*pgpiod = desc;
 	return 0;
+
+err:
+	gpiod_put(desc);
+	return ret;
 }
 
 /**
@@ -928,15 +930,12 @@ static int vip_gpio_reserve(struct device *dev, int pin, int dir,
  * @name: GPIO pin name
  *
  */
-static void vip_gpio_release(struct device *dev, int pin, const char *name)
+static void vip_gpio_release(struct device *dev, struct gpio_desc *desc,
+			int pin, const char *name)
 {
-	if (gpio_is_valid(pin)) {
-		struct gpio_desc *desc = gpio_to_desc(pin);
-
-		dev_dbg(dev, "releasing pin %d (%s)\n",	pin, name);
-		gpiod_unexport(desc);
-		gpio_free(pin);
-	}
+	dev_dbg(dev, "releasing pin %d (%s)\n",	pin, name);
+	gpiod_unexport(desc);
+	gpiod_put(desc);
 }
 
 /**
@@ -964,6 +963,7 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 	int ret;
 	struct sta2x11_vip *vip;
 	struct vip_config *config;
+	struct gpio_desc  *gpiod_pwr, *gpiod_reset;
 
 	/* Check if hardware support 26-bit DMA */
 	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(26))) {
@@ -984,30 +984,27 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 	}
 
 	/* Power configuration */
-	ret = vip_gpio_reserve(&pdev->dev, config->pwr_pin, 0,
+	ret = vip_gpio_reserve(&pdev->dev, &gpiod_pwr, config->pwr_pin, 0,
 			       config->pwr_name);
 	if (ret)
 		goto disable;
 
-	ret = vip_gpio_reserve(&pdev->dev, config->reset_pin, 0,
+	ret = vip_gpio_reserve(&pdev->dev, &gpiod_reset, config->reset_pin, 0,
 			       config->reset_name);
-	if (ret) {
-		vip_gpio_release(&pdev->dev, config->pwr_pin,
-				 config->pwr_name);
-		goto disable;
-	}
+	if (ret)
+		goto release_gpio_pwr;
 
-	if (gpio_is_valid(config->pwr_pin)) {
-		/* Datasheet says 5ms between PWR and RST */
-		usleep_range(5000, 25000);
-		gpio_direction_output(config->pwr_pin, 1);
-	}
+	/* Datasheet says 5ms between PWR and RST */
+	usleep_range(5000, 25000);
+	ret = gpiod_direction_output(gpiod_pwr, 1);
+	if (ret)
+		goto release_gpios;
+
+	usleep_range(5000, 25000);
+	ret = gpiod_direction_output(gpiod_reset, 1);
+	if (ret)
+		goto release_gpios;
 
-	if (gpio_is_valid(config->reset_pin)) {
-		/* Datasheet says 5ms between PWR and RST */
-		usleep_range(5000, 25000);
-		gpio_direction_output(config->reset_pin, 1);
-	}
 	usleep_range(5000, 25000);
 
 	/* Allocate a new VIP instance */
@@ -1020,6 +1017,8 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 	vip->std = V4L2_STD_PAL;
 	vip->format = formats_50[0];
 	vip->config = config;
+	vip->gpiod_reset = gpiod_reset;
+	vip->gpiod_pwr = gpiod_pwr;
 	mutex_init(&vip->v4l_lock);
 
 	ret = sta2x11_vip_init_controls(vip);
@@ -1113,8 +1112,9 @@ static int sta2x11_vip_init_one(struct pci_dev *pdev,
 free_mem:
 	kfree(vip);
 release_gpios:
-	vip_gpio_release(&pdev->dev, config->reset_pin, config->reset_name);
-	vip_gpio_release(&pdev->dev, config->pwr_pin, config->pwr_name);
+	vip_gpio_release(&pdev->dev, gpiod_reset, config->reset_pin, config->reset_name);
+release_gpio_pwr:
+	vip_gpio_release(&pdev->dev, gpiod_pwr, config->pwr_pin, config->pwr_name);
 disable:
 	/*
 	 * do not call pci_disable_device on sta2x11 because it break all
@@ -1152,9 +1152,9 @@ static void sta2x11_vip_remove_one(struct pci_dev *pdev)
 
 	v4l2_device_unregister(&vip->v4l2_dev);
 
-	vip_gpio_release(&pdev->dev, vip->config->pwr_pin,
+	vip_gpio_release(&pdev->dev, vip->gpiod_pwr, vip->config->pwr_pin,
 			 vip->config->pwr_name);
-	vip_gpio_release(&pdev->dev, vip->config->reset_pin,
+	vip_gpio_release(&pdev->dev, vip->gpiod_reset, vip->config->reset_pin,
 			 vip->config->reset_name);
 
 	kfree(vip);
-- 
2.25.1


