Return-Path: <linux-media+bounces-36275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8FAEDA91
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43D503A7DF4
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22AB25BF1C;
	Mon, 30 Jun 2025 11:14:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70425B687
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282045; cv=none; b=qjqPbtbsH3baXC8uFd9MdKjODnkPFaa++87dSxEXAOf1yqcK4kbporLoHLjwgVxQi9bjX8AK9upMnA6U6DPZds9ul3DXxQp0zAQhxOct/jbSF0VqIN1WIpQc54wRJCWuo4GH0ESr7s7w/eFgRGONZYSzroKetizUwxbthjjQmuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282045; c=relaxed/simple;
	bh=EILKW+tKvdnHm4Wly/lh0yvLRS1rCkKfnSGN6Gds6CY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZXesWnAlgalgRI3qrP4KrOCsdD7FusOMgeUTeUDTzaRrJcTgvPvMQAdcXfTcOi7RMbFcWuKUfrxasDRqM1Vyd20c5TXI8kzwsUcK6Hyvn3MctJ30AiJUNVkb4qSTosZ8B3rI39xR6r6M3LV39HuJCGN+nDXHtlFCiBP+OyZZm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3490DC4CEE3;
	Mon, 30 Jun 2025 11:14:04 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 4/5] media: cec: cec-gpio: rename functions
Date: Mon, 30 Jun 2025 13:08:49 +0200
Message-ID: <334e4093bcf1684a123b753504e098287610e724.1751281730.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751281730.git.hverkuil@xs4all.nl>
References: <cover.1751281730.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that the interrupt function names clearly state for which
gpio they are (cec/hpd/5v). No functional changes.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/cec/platform/cec-gpio/cec-gpio.c    | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index 50cdc557c943..fd5d810d55a6 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -61,15 +61,15 @@ static void cec_gpio_low(struct cec_adapter *adap)
 	gpiod_set_value(cec->cec_gpio, 0);
 }
 
-static irqreturn_t cec_hpd_gpio_irq_handler_thread(int irq, void *priv)
+static irqreturn_t cec_gpio_5v_irq_handler_thread(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
 
-	cec_queue_pin_hpd_event(cec->adap, cec->hpd_is_high, cec->hpd_ts);
+	cec_queue_pin_5v_event(cec->adap, cec->v5_is_high, cec->v5_ts);
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t cec_5v_gpio_irq_handler(int irq, void *priv)
+static irqreturn_t cec_gpio_5v_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
 	int val = gpiod_get_value(cec->v5_gpio);
@@ -82,15 +82,15 @@ static irqreturn_t cec_5v_gpio_irq_handler(int irq, void *priv)
 	return IRQ_WAKE_THREAD;
 }
 
-static irqreturn_t cec_5v_gpio_irq_handler_thread(int irq, void *priv)
+static irqreturn_t cec_gpio_hpd_irq_handler_thread(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
 
-	cec_queue_pin_5v_event(cec->adap, cec->v5_is_high, cec->v5_ts);
+	cec_queue_pin_hpd_event(cec->adap, cec->hpd_is_high, cec->hpd_ts);
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t cec_hpd_gpio_irq_handler(int irq, void *priv)
+static irqreturn_t cec_gpio_hpd_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
 	int val = gpiod_get_value(cec->hpd_gpio);
@@ -103,7 +103,7 @@ static irqreturn_t cec_hpd_gpio_irq_handler(int irq, void *priv)
 	return IRQ_WAKE_THREAD;
 }
 
-static irqreturn_t cec_gpio_irq_handler(int irq, void *priv)
+static irqreturn_t cec_gpio_cec_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
 	int val = gpiod_get_value(cec->cec_gpio);
@@ -113,7 +113,7 @@ static irqreturn_t cec_gpio_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
-static bool cec_gpio_enable_irq(struct cec_adapter *adap)
+static bool cec_gpio_cec_enable_irq(struct cec_adapter *adap)
 {
 	struct cec_gpio *cec = cec_get_drvdata(adap);
 
@@ -121,7 +121,7 @@ static bool cec_gpio_enable_irq(struct cec_adapter *adap)
 	return true;
 }
 
-static void cec_gpio_disable_irq(struct cec_adapter *adap)
+static void cec_gpio_cec_disable_irq(struct cec_adapter *adap)
 {
 	struct cec_gpio *cec = cec_get_drvdata(adap);
 
@@ -164,8 +164,8 @@ static const struct cec_pin_ops cec_gpio_pin_ops = {
 	.read = cec_gpio_read,
 	.low = cec_gpio_low,
 	.high = cec_gpio_high,
-	.enable_irq = cec_gpio_enable_irq,
-	.disable_irq = cec_gpio_disable_irq,
+	.enable_irq = cec_gpio_cec_enable_irq,
+	.disable_irq = cec_gpio_cec_disable_irq,
 	.status = cec_gpio_status,
 	.read_hpd = cec_gpio_read_hpd,
 	.read_5v = cec_gpio_read_5v,
@@ -209,7 +209,7 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(cec->adap))
 		return PTR_ERR(cec->adap);
 
-	ret = devm_request_irq(dev, cec->cec_irq, cec_gpio_irq_handler,
+	ret = devm_request_irq(dev, cec->cec_irq, cec_gpio_cec_irq_handler,
 			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
 			       cec->adap->name, cec);
 	if (ret)
@@ -218,8 +218,8 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	if (cec->hpd_gpio) {
 		cec->hpd_irq = gpiod_to_irq(cec->hpd_gpio);
 		ret = devm_request_threaded_irq(dev, cec->hpd_irq,
-			cec_hpd_gpio_irq_handler,
-			cec_hpd_gpio_irq_handler_thread,
+			cec_gpio_hpd_irq_handler,
+			cec_gpio_hpd_irq_handler_thread,
 			IRQF_ONESHOT |
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
 			"hpd-gpio", cec);
@@ -230,8 +230,8 @@ static int cec_gpio_probe(struct platform_device *pdev)
 	if (cec->v5_gpio) {
 		cec->v5_irq = gpiod_to_irq(cec->v5_gpio);
 		ret = devm_request_threaded_irq(dev, cec->v5_irq,
-			cec_5v_gpio_irq_handler,
-			cec_5v_gpio_irq_handler_thread,
+			cec_gpio_5v_irq_handler,
+			cec_gpio_5v_irq_handler_thread,
 			IRQF_ONESHOT |
 			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
 			"v5-gpio", cec);
-- 
2.47.2


