Return-Path: <linux-media+bounces-34429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE7FAD36F3
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68D073B9509
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06D92980D4;
	Tue, 10 Jun 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tEHi3Bh+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2ED29CB3F
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558971; cv=none; b=S67N2+xQP+sEvHfVZTJmRNwCPz4FCF9t5iNvseFpeVminBopyW0ghJQ++FYCw1j2ApmLh8JwvFpkNy8vRb71UZ2pZTa+cJHyth9tE9TBZW0kxWpFIFoKexBUOO1WsvRHs0vyR2VctpjYuAfASWiWMH82Qm/wHfLVgTUqsVFIgrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558971; c=relaxed/simple;
	bh=kgpyXSnZmCFwqfmomq7FGHn3gBVV4OHMPubpvkjXFrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9e2lTz6qyKUX648XzHTIZBM78K9dZ+VEC0iIyTBaaYYALfEkM5RkcEmEPbfZdfBJC+9K4Ji/0KCB0oNJM9Qhz0Itv+01gdGO/kjthbf4UENnFaLYVRnsNUO8WCOYPxh8GzTCLKWQNBB6mPGbmDqqSX/wWGhsRkXRsFG40kBdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tEHi3Bh+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso19917375e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558968; x=1750163768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=tEHi3Bh+XruBKEKnMg3YGLzi97cXmiX0nLxkjNZCLaNfsbDWwJ5B9Hux2QHaEaN1Jn
         VCusLoE91wgtXtyZitmTaC8QM+0Yqtd9ghIONGqjRZuwKimjEH3E/4VyqEB+NKy3969G
         rzz0MgnbHdz3oY/Z2tOKfXJzAGgC5ufI2gPURdFRKKLkZZdwoirCxfq0ddJsuEtU8d8a
         LledrMs5VrMEVN1zZe2G826s/+/+MH+7TcWiOI/4rOjYhjwr4hTbRhXcEj+WcSH0NnUC
         U2m41Qk0tfIOYzYAMa1/GGG/Fr8ZBpvlA0V5/0PbNKdDmaLWR8PccCtOZy3DaIJYR/Mm
         KC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558968; x=1750163768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmUjxGb9YXlrFmgTBSGtVdHlWeBBc2YrESubaUeQXrg=;
        b=q3zCJAxGJJoJ0BDDdrTOOIzX+k2jk9wcwRmvhKcTTVadtM7EcpHyyvK/01McrbOtI7
         J25awiKFR3tAof1jYbW0FC9fcvbTRWDOGdPmhuC8uvH8yCyj0yBlygl3WGP7p6KfrzDm
         FXYDhKNN5TfIWfpovIentERf45AV1XO5BK25u6GlHL84RU5xoxsK46zadqMoHEHceM4C
         RSonk47x4R2c9v7wl7UedOZ2dUEq9ef5gpN0ceyQXUlrX8rkc68lcPrmOYvvsGn+z3Fd
         Bg5JLkIdAtmct40URuv+zh5Vi0Rf46r3O2QGYwkkX9pgBM8mOShjIv7G7bh7q3HyM7CG
         aqsw==
X-Gm-Message-State: AOJu0YzU1t2I1q4ZNhbyAVYdiTumO1Qzi4u/dK9otZT50Wr9juNHoYWU
	RAU9dBJ8MnSXWXJJUkZQPAYqeyaocY1wC9ETdxFxa0lvl1xurzYGmLV0VkTOdUCOVRTlX7nJFLt
	YnuTX
X-Gm-Gg: ASbGncsResPiFq724JRaJV9uJjulaJB8gEAyADM2YKgPoCzmSZwwWNlQXBXglXsKA/p
	iXFfo6L/cbVnzXhbDi1PFGE2Zk8M7EiV4ty/VP955lmhuaT3DQ95qgvPYxaRJysI5BVt6NyeMx2
	a3rIrdOWjKHI+qRTAcTfEH4mCGkIYWeebITM8l+pEN3jIZkMc95V+VHtTKHWsqmTCyaZ+mkPQw2
	5BHXr17FTeUN5gXwjCJwhgTi4zsl689YSAHz8baEju2bqQw53lSK1hBAoo5J4aEgJYo/UOw3wOL
	/9lLKhGerN0WmDfK3nL90AaJ91MDCeZN7LOKzyGKuz+KX78T4wnFWg==
X-Google-Smtp-Source: AGHT+IHhf0yhbVAU53CCnx70BotxQgp+L6cndixtYZtb017L0GDbKhx9QFoSw4ecB4gLAszon3Fb8g==
X-Received: by 2002:a05:600c:458a:b0:450:cabd:b4a9 with SMTP id 5b1f17b1804b1-452014ea1ebmr148815685e9.29.1749558967893;
        Tue, 10 Jun 2025 05:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:36:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:39 +0200
Subject: [PATCH 5/7] media: i2c: ds90ub913: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-5-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uirTvdGFKLj1HJ829gQF9CK8Tn6xJqSzhqLKMW/nEqE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCad2woSfO3sebexW9Mt3ViNPTAVSqTNciWIU
 a1fvZKssH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 cisHD/485qXHf0m8whtLOAatdU72Wh0xmX1LQCoEJ8lYqmSn1CNAuUbRDS5Xt++ChKIdlUgHAUp
 dha8+20jLZQG8Vt+PtimqLHAcQ0C1ysgeJAZ87FRyk8gZkZqQqtM22spmbSP5rEi3FKriglwT3k
 dd124M1zjStOeTz+SIKmrlTOvss4mJfsmwa5TU0LUB4HMfIwHhH5mhmK8EDC2Jr13o/WP/xsOxk
 v/yQPNoNaPRUA2UQRTFykbqozRLnsLlGznz4myOFJIZGXHUgg63M9vMYsi9WOlYQl+n16Kva3yS
 vaEu0TYIMPwAQzSKUvflz6sjYTY/oWEEigaDnvmBcSIs9jnplkLNiB9YajFBnSnbACEm9BKes4l
 6+wTXfBdD0VmbT6xIs8CTAXREwxDxSCbrv2PSVphbOMtF8LNH5AUCeZ86VaBIi0XFX+EozYEotG
 qCjcjoQkCKjX35KEy8LfeAspwkl+xHA5TmnLW/20UKv+QsWqiwIOa7ggoWaAQ7XxI9X0zZaFR4w
 9N6U1gejgLfC1a0E9M30P5uL7Vmc16fsnE5V1IFHUfO2218tUcbaAvfghe2jmmwNBlGTFivrVp4
 CDjsXHmTXpKm8zVrkf/ix3PYkogl3gAugAmVL9JKgI+IdlW9UmuLx6Fh/+yggvWpQ0A+ovEBeV5
 5FcU4DP9GWAOfpg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub913.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 6d3f8617ef136c6f47871f5886193fe934c6f3b7..c34ffeae5f5080875463b6b6d45acbd9e107d461 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -203,9 +203,9 @@ static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 						   0));
 }
 
-static void ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub913_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
-	ub913_gpio_direction_out(gc, offset, value);
+	return ub913_gpio_direction_out(gc, offset, value);
 }
 
 static int ub913_gpio_of_xlate(struct gpio_chip *gc,
@@ -235,7 +235,7 @@ static int ub913_gpiochip_probe(struct ub913_data *priv)
 	gc->ngpio = UB913_NUM_GPIOS;
 	gc->get_direction = ub913_gpio_get_direction;
 	gc->direction_output = ub913_gpio_direction_out;
-	gc->set = ub913_gpio_set;
+	gc->set_rv = ub913_gpio_set;
 	gc->of_xlate = ub913_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1


