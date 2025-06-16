Return-Path: <linux-media+bounces-34861-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33AADA937
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4863B3015
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B8B214A9E;
	Mon, 16 Jun 2025 07:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gXoeTg0Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4659A20FABC
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058351; cv=none; b=pjNGIWziGFiTERWnIudlQ+kUxUGFs+OMi6ZYs9MoNNMce+RAn6qR1Ro7b5IXEurVBFqW0RigigVqAL6khJHCzciYHulJnBDBSejspPd7B/L36Ax/mN0l2B8uSzni07B3v0G6sZ3myJOWCmN2WtDdG6qaRl+k75oQaNRcAMPxQV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058351; c=relaxed/simple;
	bh=j8Ee5zNRTgD6Im7szjj0YX+ao0qiLzGNAn/JhbhBZbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4rA4APqvlfhp4PZsqEidgL+QZzibk2ncTX3Qsnq8naM56iEvmRgw4sztQVhz/wNh42fN6MeoTt1EQZNpqtKLk+rcvdXWOWB03TnDEqPPC7ALbcArJW3/X+ygJYBPzTiw8VqLuj2eZ5isqOzhhL6S6wNro4LRNofAErPC7a48B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gXoeTg0Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4083757f8f.1
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058347; x=1750663147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=gXoeTg0Y5C9rdoZWfCWb9MuIUjRfku9nMHTYSdaU6XjOHUmHSg3z1K8QMSbp6eDNfF
         dSki9ZkjiRa0/URNwI4W5y4LAc5joZZQx7jMqU5h0x0FUluoVCbEm2aSCb6L6JOE6H4u
         VytZ5BovMZi3DyaFBW6aCd3OmR3kqxbWGdRrMbzQwPMmXCbmh6Bfgdv8ATFiiWr4jPix
         Ecx5KQ0sHBuEU8g44AOGwvyUT/vEyJPOEQFuhK1/R4XrnUkEWwzv7/fV9fnTKrK3pfVq
         2h+cux2g9vRNhngrb4/z27JhVwkar/JgKa82pjmBk/6hgAOY3ErbbHKFRcpC7yYS8+df
         1lfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058347; x=1750663147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnEiJ0DPVJeTNWgLtlb3XDcjvamvu9NbT3oHT6+NmYs=;
        b=pSV0bAgKvXS8cgN8BCZ3Csd7fvveeD2a6dzLWC6TDBgUsMkU8KeI7K3ubstvsL/ou2
         FuYcHujC+hhuX494WJtk9jvMdZmpl/eQHhBsNhDdTJrCDeLpqYksfUIwpecQcAfaizEG
         AxV/cqS/H3H+eFsX2KAfC29psT1Ve3j42VJS6hHvlVTTByuZDZixy/QqQXeq85Sn7oFd
         YZk18sZ8Adn7n7MdHiSxXp9/bXsU5RsHFAvwDNhuf9I3MJErNeQfF/g3wuDGOg8VNXRW
         XF0q6K+jDu9B51Q+8V1wEanr5pD+/dWaDfdozo2J+ygSPViAPwrBT3J3sbpMzt8PPMll
         l7Ew==
X-Gm-Message-State: AOJu0YxlJycvMBsFXpF8OCL5sIcZTtMQv4nDrYGhlcIXEdxSy2fMJ8Wn
	kFDiM4DwCmq+z3wy3WEr5Q/H0gZ0D0P3y3058/Q8oFjsxnDi7y7Ygv/+3ktMJJlGdeY=
X-Gm-Gg: ASbGncs9SulqdlvYunNblyMsJgGCDO3Nl15QHFSiukxdWD7alXnv3ugAAM1ZpNlZLYs
	V57ioCgyJfne+RCcmZ4rPEM7p6+4Tska6CMe4zrgbG49hwVeFBlI103YAHmbZKzHgfXJqVSkMJm
	sP/5sfu16h5FiTJ8ggHd7UafxrXKnlMX1SKlDizobLtPp2Hvx8eFXgMEHSBuuNEFjCQRLQ/vrjJ
	s+doESGb5+9exQ0YpuStIgVcPK+TaH5WClbKEmEUoFMwzSO4Zx5MZUfeNPJZvMIpcqXWEajOPJH
	k3ndR2amnTjpOvkoKkGaEUuA4zQtn+CFIvZzrx8dNRzkWq2ALPV9eqKT
X-Google-Smtp-Source: AGHT+IF+qO7rWbAY/SNylys3RMK9GUs1aiqLgKMYCwlF9r3dPIWRev8VFgPCt2yqZehByEZR5PrtlA==
X-Received: by 2002:a05:6000:430e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a572e56dc1mr6643153f8f.55.1750058346514;
        Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:56 +0200
Subject: [PATCH v2 7/7] media: i2c: max9286: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-7-6825114f18b0@linaro.org>
References: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
In-Reply-To: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HgIaQmZBN+2BMb6XtS/4r6T+Stu0X4lPC1c0+Nqlo58=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VhkafOCJzunwHbvzisJ4lCYekKB0yX6Z1BU
 lA0/7SwGLeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYQAKCRARpy6gFHHX
 ct50D/0R/5NlZeCsQ88EZ/XCDrW343VojK/G9nbfS4hJar5K6EYRhVcDHsK+tMtcwIOj+0f1ozw
 OjUPWbhs742QvGSlKtHOqOmq0AUJwSteNm3ejtzQa9EYOfB2dfGfxmuV40c36KwLbWsDvqQAiBe
 yy+ikCLRngH3/7nCo59Lo5rKfr+O8tb4jhbIY2p3R8UPlZEGn5mmyC6Nre6P4qcYRymZ1InB+YS
 8pTjnbsKf4znlbuzFq3DCWdw3kkLja6z/U+BK8h5N1wtkoYA26csJVzcxeFCSGTvGX1JbbOa1/E
 IbzmubKPKPUAiwp5T8yUhuCweat4prnW3G6L53LZ6An5q9WhvnYR/EFOb5IEyxlMLT+mCT6Go+S
 99sue8AZtPQ6RZc0UUKhuYM8EvHy0Sr9FylULPazl+k1DxGjqp6udkaAQcJ3fhdtHO5b4bmA1jB
 X/NVEzdIFrJh8ql+dxLTcROLtdTLpFBf+ErT2WrLXXRttzaGq7fx9ycItE1Ub8uh/kkEaOECwNA
 SvDORHEtVtlOjehTqC+sd29sNRNVxhLYEA15W0tcZYH5p+cOJt6NVH96vtEMgtZzbnDuLZ4w+oT
 N8HktFnOdHwD56w/WQ4v+yNbF/AYhECgLsA95l2vZ68K2cNVR8yaGTfzSUZ8b4GL4h+HysK/HlX
 QKE2oo1JlgG9XGA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/max9286.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 9fc4e130a273f8547d7e7ec194cade5b5e9c8df2..1d0b5f56f989874e46f87db4a49d935049e6e7ce 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1193,12 +1193,12 @@ static int max9286_gpio_set(struct max9286_priv *priv, unsigned int offset,
 			     MAX9286_0X0F_RESERVED | priv->gpio_state);
 }
 
-static void max9286_gpiochip_set(struct gpio_chip *chip,
-				 unsigned int offset, int value)
+static int max9286_gpiochip_set(struct gpio_chip *chip,
+				unsigned int offset, int value)
 {
 	struct max9286_priv *priv = gpiochip_get_data(chip);
 
-	max9286_gpio_set(priv, offset, value);
+	return max9286_gpio_set(priv, offset, value);
 }
 
 static int max9286_gpiochip_get(struct gpio_chip *chip, unsigned int offset)
@@ -1220,7 +1220,7 @@ static int max9286_register_gpio(struct max9286_priv *priv)
 	gpio->owner = THIS_MODULE;
 	gpio->ngpio = 2;
 	gpio->base = -1;
-	gpio->set = max9286_gpiochip_set;
+	gpio->set_rv = max9286_gpiochip_set;
 	gpio->get = max9286_gpiochip_get;
 	gpio->can_sleep = true;
 

-- 
2.48.1


