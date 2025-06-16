Return-Path: <linux-media+bounces-34857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16AEADA929
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16683A7703
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1126E202980;
	Mon, 16 Jun 2025 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lI6DAoFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50541F4703
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058345; cv=none; b=PUSFZArPObdbDRSAc+9cqaoppTcz0Kr0Hq9MWFxHTIzdr5m6r1FSyBxZTtikRZ2TtdtKaHvZfDwsrQ11Z5A6Q1e7Bk3eiHtu4dannFqg9duEdrhnLfJbWyw3pRi35ApjN8DpUP1oiz7IosJ+aRQ/JejzibfVM/JA3YciX5C7mSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058345; c=relaxed/simple;
	bh=i4HUX8ifaxrfpP6Wtp01EbUr03JCgVc5lw8n3/X/fHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HW5ZeLLB83A06qKDada1ofhSUiok2wc7jS5l9H6SMgEqFsrKEvxI5XMqumzKvXomG/2fno7+wVWkDUQyZfNzTPZ3EyNHDjP73x2c/4W8rwiiCQ/lESttoeP70MbazrTLjt6x3AFZa7LTW1ulkbnIsLeXpIlpEqN3ugYmKGMLTxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lI6DAoFS; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a51481a598so2396409f8f.3
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 00:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058342; x=1750663142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xq7xfBYrivDdeg+8ZFQsb9LtSkPdVzHMYNYxsllkpTQ=;
        b=lI6DAoFSCwEkV3XVYgkKECKIGHWbqLkSptW4rW7WSgY5qRikCyrL32UYn7ZKafAaD8
         ZsjntKOX8U6+I7cw3B0Vivav29Qsrv0yIOkv2/jK2vj/c5Y2u7K2IbxibWmUcJlDnExt
         3vfn9XA96g0QxZ3iXqeetoXISzcsRl1ugwiq26d7CZd43Nz4jK8xP4hvyyOqh0R2qZEV
         HOa7r7VlEzdAcLmn2cELHU3DU/ztCEg5GNhhiifoqfKpYEqR4XsvFYr3pazcQq3O4uCZ
         hVAJ2/T9GP3/ElPptWUFKp4g7IUk+5jDkCRRFFJH46q+YRbdY9AJse7Eyk+YhjeWKMie
         zP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058342; x=1750663142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xq7xfBYrivDdeg+8ZFQsb9LtSkPdVzHMYNYxsllkpTQ=;
        b=sIELVrMNoE7wnSsDito609zrXJgOejncVtJ6WtIu04VJVXIEBA6sTnVai/pEMUu6Dm
         efMgvJWbuCXFJx3bSgx7HV35TsDik0KcKDN9O8EwsGfoI6MnI+Gy4qVfDpnzKVVQW0i1
         hI+NN+VprtkbI0cpSUJBz/atvomxAlV6HT+XGzdCmHFdBOKso0BueRjv9yvvzpDeCg/C
         /EHieekRpPgb8ZJ0NNlGXcsMnDf6ImtEQaHpFoQ9Al1FQ08nogF6IrFJjhRBX8v/JvSP
         LPoh12J7QopMUyLb2O1eZvmBEhgy3SjV4bqRvVnpsyGtjkwBmXXJ2gPX/LpkQuA1tCqf
         O1hw==
X-Gm-Message-State: AOJu0YxG51/0KqRDfuL4PUApm/qtmT4y5vv5EPd8Dw+leBYBEhOwa3Ih
	GbUuaLzk+TWbWVelphkkIkb4ZMKVH0J8btSMKg2yxwf+Ew+/7i5wY9Mj+5tchlujrr8=
X-Gm-Gg: ASbGncu7bdtIgZbI8oUtmdWH9Qhr2yUcznXJluy5cILz+wKq2S8gF3+2/XkDjPf0vtg
	JRi42RFpxqeqj39an+4mV10VeaU0SHLdHysC5YO2YNokvl506IxwnmkFj9pUDslnTLhYxqhBaiq
	8gj0cMKI8VTHp54fApxfkWZvS/O81jw1s6dFUwVYW7/InPrmBDFXarnn2xgTH9GfafqwTnCetXh
	Z58Hch2UB8x9Ldu6AGbakoIKw0bB3Bm4AISVFSUqNDIwF39kvATel0uqh/1xJtT/Dc+quFfGhXE
	JNPtuQA62QmxjfsuKyUVSxlDve8/dODvQ+TFsMcEeUmIghYybJj8Pb+T
X-Google-Smtp-Source: AGHT+IGqRQFtwLQB2XoRi5EOneCYIsZXe+77XlPZZC7TAn7DBrw2xMQ1XvuYegfIi9R1ySJiXAmKpg==
X-Received: by 2002:a05:6000:290c:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3a572367993mr5930123f8f.11.1750058341928;
        Mon, 16 Jun 2025 00:19:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:19:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 09:18:52 +0200
Subject: [PATCH v2 3/7] media: solo6x10: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-gpiochip-set-rv-media-v2-3-6825114f18b0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=x0xLHApMRQLh5h/Yrn6OODER6U8QbupzF1WTnrs22BE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VgnkyfY9zXwUwAbF3pDGBMJaaSofXadbbUu
 oURaRqaoYiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FYAAKCRARpy6gFHHX
 cgNZEACfPdzwFh2olDjXYlCjJ4Sr3vGyHbfYbeSG5KnAngNEJzuwjX/R3eFGn2wmsj3A9G7fpTc
 k098NBx1cBk+qV95tArmvsGnNTVbZYI06Ug6fsC0u5JdDzMTCV9qMhkRnEHQ6HF/Njn4Tbyf7oc
 lYBbQh1zRPHrp7zwafBO/eYQsiNymFErIsYGlbZYgqFBOVqkroc8SrWR4EP97q1XDLZ82+28iMQ
 YTcM+AGVcqTDwaAItFQP4Li+A/2o80vhh5xGX9P9lG/iK+cIL9VvtLbSNkZ9b8+5jp3jhw4T+18
 MULYURcxjfSAwZDgcyLeJKzG1b9BL98+6YtxkKMZjPLfwQMX9phMRMPANX6LF3VDP7M5GSWAnMv
 Trk568ROBMSljKU7XjzFrivOYLtn+oM5HqSc9jf8uHfbe5KTLl8odnVgQ6qniJlttsoTxk0f3Tq
 uS9jRORJBa4YyVhT5sopoTsrAxPlZafLCHtv9zD/O6GjIHk5AK9uq6ZRHKR8/qiJf9eYXdzHyp2
 949IQEE71+rInMxcYWjjiZjDl2PnQ/v+KWOSms6Be890tRXeyV5bL9MFgqPYN6VsDkllD5LUouX
 lEhaWJ8HIuEeaUzC4REk124DK/wNRtA9YPmkExi5ohmfvqKV3i5gAifkzF1dTOb1M1ChpDVrBC1
 U1VIpWct/4X0IKA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/pci/solo6x10/solo6x10-gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index f51f865c69bd7b04fac7a1f951c734965d8fc993..b16a8453a62afd5a420b03bfb1967d18e1cb1167 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -127,8 +127,8 @@ static int solo_gpiochip_get(struct gpio_chip *chip,
 	return 1 & (ret >> (offset + 8));
 }
 
-static void solo_gpiochip_set(struct gpio_chip *chip,
-						unsigned int offset, int value)
+static int solo_gpiochip_set(struct gpio_chip *chip,
+			     unsigned int offset, int value)
 {
 	struct solo_dev *solo_dev = gpiochip_get_data(chip);
 
@@ -136,6 +136,8 @@ static void solo_gpiochip_set(struct gpio_chip *chip,
 		solo_gpio_set(solo_dev, 1 << (offset + 8));
 	else
 		solo_gpio_clear(solo_dev, 1 << (offset + 8));
+
+	return 0;
 }
 #endif
 
@@ -156,7 +158,7 @@ int solo_gpio_init(struct solo_dev *solo_dev)
 
 	solo_dev->gpio_dev.get_direction = solo_gpiochip_get_direction;
 	solo_dev->gpio_dev.get = solo_gpiochip_get;
-	solo_dev->gpio_dev.set = solo_gpiochip_set;
+	solo_dev->gpio_dev.set_rv = solo_gpiochip_set;
 
 	ret = gpiochip_add_data(&solo_dev->gpio_dev, solo_dev);
 

-- 
2.48.1


