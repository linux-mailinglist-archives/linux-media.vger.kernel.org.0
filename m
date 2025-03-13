Return-Path: <linux-media+bounces-28164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06AA5FFC4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 19:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EED3B13C7
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 18:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E7F1F03D1;
	Thu, 13 Mar 2025 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBC3qf9F"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D831DB54C
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 18:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891438; cv=none; b=Pk7sl8MM1uHV4hQuoByTTM0bTkXQx5Fe7fwmKOZS3Qgvl8/PwJriY+MpFZJZFl1W17Ju67pAOulJgjmHeRQ9M8jc9VEIntNNJbrYNTXIqadaGECmq3dbgPhBsAtwndvmW9A116cB4tUju7pELnnGt01gyIz2B/RctTWgEWjHPxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891438; c=relaxed/simple;
	bh=8XiRRiNygpEzXFkkRpMgTh2t6F/SwQN/JzhoYD2aYho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Df2b7jZOtEQyuAuu1XVyfys2FLeM+yvx2NuLQL/RL78Xdx0GHccI4wIJLmG/dRD5VtqHFR9AQwcMp8cjCm0jbMChCnDQxCFK6ekbT/WtKLk2wM1BWcg11/zMBhSc+vxdFEYHjd9QlfB+GqeiWuPqHn+/B5o4uPP8E0Wr1rkMM4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBC3qf9F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUQq2u6HJXDhjKFKEjw5GKkTc2CdO8qyh1g3cVuHUQ4=;
	b=BBC3qf9FyKxuZxIuwCI3jw3aH5u+YGcs2iZuf2y23opFnXO3t9Tst5QVA7QIV0P4PYVIRi
	fYiaToPa4zafQrOibQ/XUxiy53hJu3xS9JPUgslM+REYXPEbr+tvXvUEKvNEdsjNhOPkID
	YWYmdhsVOYTwWKeCQn9P84lLwO12Hd8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-sflWXWG3MLmqxAAjDeNUKA-1; Thu,
 13 Mar 2025 14:43:52 -0400
X-MC-Unique: sflWXWG3MLmqxAAjDeNUKA-1
X-Mimecast-MFC-AGG-ID: sflWXWG3MLmqxAAjDeNUKA_1741891430
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDC0E180AF52;
	Thu, 13 Mar 2025 18:43:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.45.224.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E66B2300376F;
	Thu, 13 Mar 2025 18:43:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Ingvar Hagelund <ingvar@redpill-linpro.com>,
	Joachim Reichel <joachim.reichel@posteo.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hao Yao <hao.yao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH v8 09/14] media: ov02c10: Drop handshake pin support
Date: Thu, 13 Mar 2025 19:43:09 +0100
Message-ID: <20250313184314.91410-10-hdegoede@redhat.com>
In-Reply-To: <20250313184314.91410-1-hdegoede@redhat.com>
References: <20250313184314.91410-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The handshake GPIO is not a sensor GPIO but is related to the special
Lattice MIPI aggregator chip found on some Intel IPU6/IPU7 laptops.

Since this is not a sensor GPIO it should not be handled by the sensor
driver. See here for the alternative plan to handle this:

https://lore.kernel.org/linux-media/4b87a956-a767-48dc-b98b-f80d9a44adc8@redhat.com/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/media/i2c/ov02c10.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index e1013d1da459..38918b1b6a95 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -382,7 +382,6 @@ struct ov02c10 {
 	struct clk *img_clk;
 	struct regulator *avdd;
 	struct gpio_desc *reset;
-	struct gpio_desc *handshake;
 
 	/* Current mode */
 	const struct ov02c10_mode *cur_mode;
@@ -650,12 +649,6 @@ static int ov02c10_get_pm_resources(struct device *dev)
 		return dev_err_probe(dev, PTR_ERR(ov02c10->reset),
 				     "failed to get reset gpio\n");
 
-	ov02c10->handshake = devm_gpiod_get_optional(dev, "handshake",
-						     GPIOD_OUT_LOW);
-	if (IS_ERR(ov02c10->handshake))
-		return dev_err_probe(dev, PTR_ERR(ov02c10->handshake),
-				     "failed to get handshake gpio\n");
-
 	ov02c10->img_clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(ov02c10->img_clk))
 		return dev_err_probe(dev, PTR_ERR(ov02c10->img_clk),
@@ -680,7 +673,6 @@ static int ov02c10_power_off(struct device *dev)
 	int ret = 0;
 
 	gpiod_set_value_cansleep(ov02c10->reset, 1);
-	gpiod_set_value_cansleep(ov02c10->handshake, 0);
 
 	if (ov02c10->avdd)
 		ret = regulator_disable(ov02c10->avdd);
@@ -710,16 +702,11 @@ static int ov02c10_power_on(struct device *dev)
 			return ret;
 		}
 	}
-	gpiod_set_value_cansleep(ov02c10->handshake, 1);
+
 	gpiod_set_value_cansleep(ov02c10->reset, 0);
+	usleep_range(1500, 1800);
 
-	/* Lattice MIPI aggregator with some version FW needs longer delay
-	 * after handshake triggered. We set 25ms as a safe value and wait
-	 * for a stable version FW.
-	 */
-	msleep_interruptible(25);
-
-	return ret;
+	return 0;
 }
 
 static int __maybe_unused ov02c10_suspend(struct device *dev)
-- 
2.48.1


