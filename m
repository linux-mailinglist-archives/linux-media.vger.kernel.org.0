Return-Path: <linux-media+bounces-36276-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F787AEDA92
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 390A11898D53
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB87525C6EC;
	Mon, 30 Jun 2025 11:14:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758112580E7
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282046; cv=none; b=qMh6jPiCAYsq+nrJQ4pGjlyl5AkyqCRZ08g5MSGIMa2rrDkCcVlrM06mjlquvp6GCwB8ZgwZ2YszQjDLZZ9wA9MXOhL72JZAyWtAzDNXWIDQnUuRoYD/fK+PZfzKtNpC4Z+EHQ1QA0hQpR2qKBkCKwGLrbJkIScfI0XnOnLI+fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282046; c=relaxed/simple;
	bh=GejUCUhYWx03b71qR0kPTh1uESMTUdHP/x7UIWghJ4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmagXpJHQ89e2iUQpw8KNwmPaiimT9Rwq2SlsTn78sRw03IE+LVnrtV0qPOqW6Mlfi5//d2RhVTEquVuIS5UEAYY7DrdLRlnbPxB5EqLj0FQNK4uCTP+KKcdpCL/SZk/srcsA4I+AH7D9KTX4c4o/0zVBmeH8p0lB2BdB6n+3O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5827BC4CEEB;
	Mon, 30 Jun 2025 11:14:05 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 5/5] media: cec: cec-gpio: reading hpd/5v is allowed to sleep
Date: Mon, 30 Jun 2025 13:08:50 +0200
Message-ID: <d5cf23f38d0aa2e10d768ffd8eaaea2e6bc055ac.1751281730.git.hverkuil@xs4all.nl>
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

Reading the hpd or 5v gpios is something that can sleep, so rework
the code to allow this.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/cec/platform/cec-gpio/cec-gpio.c    | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/cec/platform/cec-gpio/cec-gpio.c b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
index fd5d810d55a6..3c27789d8657 100644
--- a/drivers/media/cec/platform/cec-gpio/cec-gpio.c
+++ b/drivers/media/cec/platform/cec-gpio/cec-gpio.c
@@ -64,7 +64,13 @@ static void cec_gpio_low(struct cec_adapter *adap)
 static irqreturn_t cec_gpio_5v_irq_handler_thread(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
+	int val = gpiod_get_value_cansleep(cec->v5_gpio);
+	bool is_high = val > 0;
 
+	if (val < 0 || is_high == cec->v5_is_high)
+		return IRQ_HANDLED;
+
+	cec->v5_is_high = is_high;
 	cec_queue_pin_5v_event(cec->adap, cec->v5_is_high, cec->v5_ts);
 	return IRQ_HANDLED;
 }
@@ -72,20 +78,21 @@ static irqreturn_t cec_gpio_5v_irq_handler_thread(int irq, void *priv)
 static irqreturn_t cec_gpio_5v_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
-	int val = gpiod_get_value(cec->v5_gpio);
-	bool is_high = val > 0;
 
-	if (val < 0 || is_high == cec->v5_is_high)
-		return IRQ_HANDLED;
 	cec->v5_ts = ktime_get();
-	cec->v5_is_high = is_high;
 	return IRQ_WAKE_THREAD;
 }
 
 static irqreturn_t cec_gpio_hpd_irq_handler_thread(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
+	int val = gpiod_get_value_cansleep(cec->hpd_gpio);
+	bool is_high = val > 0;
 
+	if (val < 0 || is_high == cec->hpd_is_high)
+		return IRQ_HANDLED;
+
+	cec->hpd_is_high = is_high;
 	cec_queue_pin_hpd_event(cec->adap, cec->hpd_is_high, cec->hpd_ts);
 	return IRQ_HANDLED;
 }
@@ -93,13 +100,8 @@ static irqreturn_t cec_gpio_hpd_irq_handler_thread(int irq, void *priv)
 static irqreturn_t cec_gpio_hpd_irq_handler(int irq, void *priv)
 {
 	struct cec_gpio *cec = priv;
-	int val = gpiod_get_value(cec->hpd_gpio);
-	bool is_high = val > 0;
 
-	if (val < 0 || is_high == cec->hpd_is_high)
-		return IRQ_HANDLED;
 	cec->hpd_ts = ktime_get();
-	cec->hpd_is_high = is_high;
 	return IRQ_WAKE_THREAD;
 }
 
@@ -148,7 +150,7 @@ static int cec_gpio_read_hpd(struct cec_adapter *adap)
 
 	if (!cec->hpd_gpio)
 		return -ENOTTY;
-	return gpiod_get_value(cec->hpd_gpio);
+	return gpiod_get_value_cansleep(cec->hpd_gpio);
 }
 
 static int cec_gpio_read_5v(struct cec_adapter *adap)
@@ -157,7 +159,7 @@ static int cec_gpio_read_5v(struct cec_adapter *adap)
 
 	if (!cec->v5_gpio)
 		return -ENOTTY;
-	return gpiod_get_value(cec->v5_gpio);
+	return gpiod_get_value_cansleep(cec->v5_gpio);
 }
 
 static const struct cec_pin_ops cec_gpio_pin_ops = {
-- 
2.47.2


