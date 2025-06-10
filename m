Return-Path: <linux-media+bounces-34425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA6AD36D4
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE161885693
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EABD829B8C5;
	Tue, 10 Jun 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q/vSNbtD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173829B79D
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558955; cv=none; b=UTtlIQARleezOhbDy+jiCjSx6gKqtrtAzAOw09DddMJAA7dq+ZXX0hKUkA4n/Pnw6z0ejGXj4UOXlc06U/5Siy5kuHIXJeEsEYN53XGnj20WQthyoZeuTBkLyXf3EehgMJ+nialAUHczvd/T5lW0MIanQ6j3YxWetHiV0INFqKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558955; c=relaxed/simple;
	bh=b/qgu6/medib2vu4jNB/RyGMXO6WslAvUTV0AIziuY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxpyf0mbp7Gc4yyzrc/H3S3f+Xc+tqFl2BRgsl2Sglq3cn2Ux16SYELZEEVwHnl9groe9nt+AqgQCElCwD9o/ag6hFjR/5baLChu5zGsbBii/HlO+XehATt7eo9xihEy85p1k0B9IF9IgDXwVtZGJeqtriJkm1uCwtDBNWO0cL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q/vSNbtD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso1454033f8f.2
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558951; x=1750163751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTP8xNB64zIn9DIEvp87doAXF5a/sVMPLzzHk43KYWg=;
        b=q/vSNbtDoMtnidndBvJ9EcvBrPD7JPIiP0R/+Qm+KvfBqcaO45IFoTCIdTSlV2vixk
         POHDZaxGLHawhrHBs/hGgMotZSBOaoMn9aXF8zvbhlR8ZHKHy82q2tjObecRMrX/A4/8
         2tUOflXv0E7wHJI1RBZLhPVCIhf06guJCw99K7ZrTkmz6vkmUmgKi4qSRgcm9hO/lVIG
         BQVKamX8qNtB+GR5aM4gI01lsJWybw5XGusagV9BjjxkmiOJgRJYZPkvgBSD6/82Niz1
         IDAN1eDSh4/enckCiUP8ND2UpvJ0ncmLhMRsyxR3Ubu6tg9nADc1QyBnk5ZYNedXtS7W
         c/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558951; x=1750163751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTP8xNB64zIn9DIEvp87doAXF5a/sVMPLzzHk43KYWg=;
        b=ESKjaOLC0bUHBBPSVOLQh6V80vVC/xO7Ae5AjTDyPOBhzunBB6di5kFOWBXGhED1Ve
         c3SW/n3TX2yYXNc6UAL88sKmdgkNXsAIaClJplOYpWz8y/IH1NcuqD6ZGgC2y1yS7CKE
         5r8lqEO1cc3tpXz0anD9j/e9fMVYXGwCkaksNRyrNAZdu6eNo78tpi/SaSIZPZdQCO5h
         NNTVieCNymPYld40EmAhA1JtNPA/NHoCyRJjBCJqY9oihTzEPUqNKUS6eHgAhIPjgtaZ
         qaB3OCwyk0p4LBsmP6sP8+eA+eOd8PPJMLJZxGNoSX6K16amVEqtUqsa+0JgDew5VYmr
         lItA==
X-Gm-Message-State: AOJu0Yyp2lbwLc0C0w9IL1F08XoGL0Xrjg7iHMezbwYYJaxwtWiUS4D7
	/JfFNeuT+D6gdM/WdVZc4XYi3aSay1uLSWIFet2RKFAogz3KpqBNwP5SjCKIFYShtvk=
X-Gm-Gg: ASbGncubbaW9kRp5r1Sa/T3RJEDFJ23HV/qgl9fnqiASma/EGPZBDpQEA+YSMTdurcA
	7MEfZovlGgJKv10JA2oxIBI4hguG07fyXpJ2rocuq4o6UIp82Bbsj4gO+G2VVJKmwSlVuu6d1Sc
	JtgTb0x6elg7OlFn7sn1E/i8cvDICiwi/uv+V+ZqbvdVNlo3wYjYwat+Cfd9058K/WZSgJQ+HWm
	KjXQ082kAIzEFVzpfEdPRVwIHX8E7GmUuddtlvanwMO9p1KNKerHsrZp8Go0zzvBT8u7WQRsUH/
	4oHBgSfHlDaNbC+kdJ+e848KPPJdZ71EM+1U/p9QMKgJindC4glhxA==
X-Google-Smtp-Source: AGHT+IF4fMlBmPwe1cVJuSXY6WUkMp0q4kctxB4GQTZMFXpPE8OUFwtZ+6mpAu1TMgIrNn8JwGBmkQ==
X-Received: by 2002:a05:6000:2305:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3a53188a524mr14037191f8f.11.1749558951215;
        Tue, 10 Jun 2025 05:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:35 +0200
Subject: [PATCH 1/7] media: dvb-frontends/cxd2820r: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-1-c088006a152c@linaro.org>
References: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=N9OvQ6idGerlmLwTIQS5N5xpWnMU9Eqb+M235W9W9/w=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCadiry5Z7JL5xwZjSPC11k6EgWL2TOKgkhdY
 j0swRBUDq+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 ck8BEACxqkDlf8kbHZuhC8igQTVWc3VFpeTklJvF/zMHrXyDjVj/KGl93oIuIXc65lu1wF+rDTQ
 8FylS3owNdW5LV0g06lDUd82gYVO17rc10SJ/dSHyuvxqxTAjz8cHw39FXqp2Hp5VIp9hlAqEuG
 YaCmOZ67iRC6o6SPm2VKjcBO9exulpA2Hf67ta56lPOISfp4yHNMoV3f2Vuvw5p456WC7ZWwJjS
 elJ4UkA4znmUFh+6EpUyaWLGfYo2GnJiIKlDV945J9gob5zIBH+Wd/LbV4koZAppfAnkBEL29S8
 bLhYQzLjeuWdBD9k5xd62JZMcqQAL218ThOnr8KUSWKVycedhzijTuIfqQ7Xw1RHv6v4F7TuWIr
 9QbbYsHlzm/wXHF3wgBoo6FjSZouLWF0Twr9SUHvE9+i74vkH4HfDxYRMqEF/2gBnkJXSGmuaFh
 DcmcPcApcQjpqSONIeMAYfeLXJBQc7pax5fyAVwRL7qtl9878G2Z9FdunTE19X+oYedMtquOwoG
 Ui2PlfLV7zO4+JS6nFz9IbwsbO7LDdY4ThbI6I58ZfoIxR399m75EZq5UioRMq1AM7psC1jGT4H
 oRU2Y1ekbOWIfhaxy6etGPahcmVYSnphAlRbHfsZg6aNO6yXjFtxSTGChyKSc6pz5SrcBH/53YS
 kY5tL6sgOSlGs1Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/dvb-frontends/cxd2820r_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index c3d8ced6c3baa6608e17cc4797dbeddc5a5ed510..a31a8a6a494652e6aae874c399fc70df3f9ee172 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -433,7 +433,7 @@ static int cxd2820r_gpio_direction_output(struct gpio_chip *chip, unsigned nr,
 	return cxd2820r_gpio(&priv->fe, gpio);
 }
 
-static void cxd2820r_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
+static int cxd2820r_gpio_set(struct gpio_chip *chip, unsigned int nr, int val)
 {
 	struct cxd2820r_priv *priv = gpiochip_get_data(chip);
 	struct i2c_client *client = priv->client[0];
@@ -446,7 +446,7 @@ static void cxd2820r_gpio_set(struct gpio_chip *chip, unsigned nr, int val)
 
 	(void) cxd2820r_gpio(&priv->fe, gpio);
 
-	return;
+	return 0;
 }
 
 static int cxd2820r_gpio_get(struct gpio_chip *chip, unsigned nr)
@@ -651,7 +651,7 @@ static int cxd2820r_probe(struct i2c_client *client)
 		priv->gpio_chip.parent = &client->dev;
 		priv->gpio_chip.owner = THIS_MODULE;
 		priv->gpio_chip.direction_output = cxd2820r_gpio_direction_output;
-		priv->gpio_chip.set = cxd2820r_gpio_set;
+		priv->gpio_chip.set_rv = cxd2820r_gpio_set;
 		priv->gpio_chip.get = cxd2820r_gpio_get;
 		priv->gpio_chip.base = -1; /* Dynamic allocation */
 		priv->gpio_chip.ngpio = GPIO_COUNT;

-- 
2.48.1


