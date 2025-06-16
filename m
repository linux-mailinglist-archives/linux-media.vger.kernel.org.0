Return-Path: <linux-media+bounces-34860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65425ADA931
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0768016FC31
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EADC2116F6;
	Mon, 16 Jun 2025 07:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cpqON9or"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171B4207A18
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058348; cv=none; b=eWtytOO9yDlRG6D2rICfpU8PWve6M91Wya40/aj/D6ithdlxP+0nAebviz7qM3pa2GOhrvihZv6Lnwid5lnrd9aTE6QhtKVUBClWHVQDpFIvrMbJiCxCJs+zFJG57jINnwQCcJMirI2ojwj+jrcuFi5+Kwz5P3GkGhv2CDi0XhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058348; c=relaxed/simple;
	bh=6dDruxI0CMaIvewahEW6x/eO1kPM4lNc6aCD8Neqv4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwkPof7Kwtn8gy+4+mlv61L6tqM75XXlav0ZAotMO+xCpSY6b4nPzk6pH87jJZZuDzvMDnuBDBeNq6C+2bGMHg68pyFDCIC5pA/1QwsTpEoLMoaO4gbm86UcnVnMPnJhogLsgwYyK93DO8KwNFqMufO5BqvMQqZaJfu8XwnDkC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cpqON9or; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2881303f8f.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058345; x=1750663145; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJ+dN5ujs/yPK5NxfTplkwW8W001YBt6mCY985Z4SkY=;
        b=cpqON9orsy1V7TXZWfB9VM+fC4/y9ErgakL835d4AJdapWtGCCs95RoAi2SWhKuOlH
         WL361/+4RfMTj97tNmXqXmjDB8LdzsNUOgFgYatW5HLQRIqYWDsc6KvEVxGHCDOxqwP9
         mWEIroOK/Xl9tkLiwP0w6wURX4weAeq21hSYKraNHSfNNs6f/afyHOmcbH21SNjw6Dej
         7irlR1nGilHV/0uuOgTzou9CQXSJPw2bMoeIZn/gOSLlbHiOmbMvuCZtp7JhKOqDPy6T
         Qov7hPFhganlti6AWG+OI4+gr+jGPIwANLTXOJIgQeCCno4g58ph7gpF8uKQXwhmCi64
         gT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058345; x=1750663145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ+dN5ujs/yPK5NxfTplkwW8W001YBt6mCY985Z4SkY=;
        b=Cc4C9tmTh/rOspuGVxb+UAKFE6iehLntg9ynGYD32LYu+/D6fZt2EfDHRK+VDI2jhh
         cgCkozIRcL5CLuD0PcOVBKA4ZiqIRgXlFSC8EVcA/YYF9rz3Vz5n3MaWEjqxy38y8bfO
         DRIvgwnaQzL+XZGY2OKHD4rMmeGNN9pZXVEbb4BVV9eK28ZlJbDPerszNjTsNKSePxNu
         D0eM1TzC+Icw5g+wl0JPIt5wLm8SblhhqGPsr14q2OMvpDnjyYGsqloNP5dNJqZqU0ki
         p35ytEdA5cLGm7F1olY84PQV6oR9Suqh/8pQiWTaqCq0jpHs/NmLZFKJvDeLiJ4b5qhP
         Gzow==
X-Gm-Message-State: AOJu0YxPiFFScTQErgUAU1/ShCAWiLNKfbMMRFPbvzYcAzDZowob3CEl
	4Y8LpXEDxpDCHsT2+DoQzLNYfEDw72tsTNpfPgpvvNx0db3OsgAmcJvcJfnMO2zlVRw=
X-Gm-Gg: ASbGncsrrQWgpzR28bqNMBAj5xSbTeIcOxFSZ8uUmTeLgFF3NpZnLs9H7UHadOg2Gy2
	7XKyJ+38lITk8ja3fFXRXH9CnLIYku/EBEH7jrau+fsPPb+pR3S/DjqA2lcJSVafi/RjIlENKsS
	O2OmgTpUA7KpZ6G+/LURbw+PoqKRvvasMdkOsSo/xfF37Ln0BUtOb2it9q8iztGI+YvgCqAtI7s
	ufvsNKQ6w956atUxnxS6626poBs2Kp4nNlDByojefTrRxjwiLSTXaxiM6oKabrazKfgTCyv+qZL
	2II4aJwLG0h9ES9nVUkFV8d6f+m7BsIdEnHgUHzEE4R474xnQOiliz2s
X-Google-Smtp-Source: AGHT+IGrvqPwXuwW7Wt8iGrYHJ6Hx17pNZJ3uy+D3GSxiqlpgwmfGGMQoCEKU/W3wO8g8xPiu4rprw==
X-Received: by 2002:a05:6000:708:b0:3a5:5278:e635 with SMTP id ffacd0b85a97d-3a572367577mr6082606f8f.3.1750058345506;
        Mon, 16 Jun 2025 00:19:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:55 +0200
Subject: [PATCH v2 6/7] media: i2c: max96717: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-6-6825114f18b0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zxXtt6XCScDkqWqDmMavuunKoHjUaJSqDc/9xdViskQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VhTa121fKKIQpI3rhzYMXqmMCXKdk/BpqNU
 VpWOl21xzqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYQAKCRARpy6gFHHX
 cpKFEACfu8pKMvDD3IZCkpB5j/m+8PK17IIyGDaDrRdKdrdD16nX5b39juWTiB+k5uWZqdl+KK0
 3IPT3FKP277tEWQTDZW8UqoaF+PO3/ZW5wnyDz529kBGDNeRJ451ZCpf5nkbmwSpUBvsY50RLlB
 1WEdOu7DTjOOKEnTZT//6uF1F3yM+nsbTOb1Q0Xvu7gqszAjX5+4OSaYDIDRBa5TVY3t+qxrqYs
 gk5tjhOhNIhtO6KPfrWzboj+5csmAw0YUTVGVgWPf4nzgS9IDOEc+0Czs0YUTBaF+gi01GSvRZq
 uB8uQKHt1W2RWCXUWtUCQwEvtoZ3GYEMwNVdDJurGSQQFhbhzFxtvx57uUxMlKVSDJpUpwSX7O5
 0/NBl2X6jqqaJlMpSH/DXeyGVbpSx9/FQLy/rXZvcQAvCOWAhbPdtZuxEgP/6MCAg/Z5SOYg8Uv
 i3Uqhadm1KC8+ndzvXI2RtdDLx2uHxfKdQrDkNBdc6crJwo90a2neDVf+aiDpr7ohb3JuqxTMOs
 evXG1VhhI3/qYvW72lkLfX6ZioJdR5b1BOivMCDLoc24ObdLKUG2PKfkNYXGbbeQhdKlWzqiAh1
 SYHtq1Z5rrHvuWm50cSdguYZV5kCBJ6h/vimvMx8aO0qvJiu6iYJC6cGOj76S9BqBGSY0TjbQWm
 WKBO+5OY+aBNV8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/max96717.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 3746729366aca3af8aef3a807e2f91a8f142ce59..a503a55fe8afa9bdda8fc9b1c2b0e7ebd02afe1c 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -297,13 +297,13 @@ static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
 		return !!(val & MAX96717_GPIO_OUT);
 }
 
-static void max96717_gpiochip_set(struct gpio_chip *gpiochip,
-				  unsigned int offset, int value)
+static int max96717_gpiochip_set(struct gpio_chip *gpiochip,
+				 unsigned int offset, int value)
 {
 	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
 
-	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
-			MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL);
+	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
+			       MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL);
 }
 
 static int max96717_gpio_get_direction(struct gpio_chip *gpiochip,
@@ -355,7 +355,7 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
 	gc->get_direction = max96717_gpio_get_direction;
 	gc->direction_input = max96717_gpio_direction_in;
 	gc->direction_output = max96717_gpio_direction_out;
-	gc->set = max96717_gpiochip_set;
+	gc->set_rv = max96717_gpiochip_set;
 	gc->get = max96717_gpiochip_get;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1


