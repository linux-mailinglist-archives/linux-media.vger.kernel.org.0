Return-Path: <linux-media+bounces-34427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8726FAD36E7
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B46293B0109
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5B329C33C;
	Tue, 10 Jun 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zOLyH1Ta"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFF3296179
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558961; cv=none; b=B93/tieZdhipNZNUJJwquY3hnT3SItOP0nd/Bo7hQwAGF4Zu5NYZNQpaJn+0tmFhcwLuZn2E5u3vqXyi8auAZdS2FEBSnUs/LdMPCd+uMt1M++TRbpy+xo2+qz2J4kHKyBnvFTWxJSeJsx1lKQqG711xzGuY3YoHRUZNfC5mx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558961; c=relaxed/simple;
	bh=/mdAoFgifrGqKEEyhtg6uTaMhvs2r5wvt9hHVXqUsuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEdxTkGJthKvpqZEATLetJIOF2GkmBHnNK3pgR+YRb1TnkpE2nAlD3LnDpYUqbC8OTcsQKtQ9bj1bQShVYaP/V6bQNU9Rp4WKJMaBp3ZeRbZzKye5ZLNHxJpmZQfOQDKHCidnDLfrX2YaGj5o7V9XGmOFvpTz2N/i+ZLxM7sGXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zOLyH1Ta; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so42875595e9.1
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558958; x=1750163758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiLT6wBQ650bzMQiyRtp5HseVhCkXjDZMFQECvgUq8g=;
        b=zOLyH1TagnK0tAeBjC28pcb2Cfx85s+gKA8rAR9e2vj3mnCkDuF5Dc09jHrqHqYlYV
         L9U7tlC2iI6Z5xNZsrvvJt7vReUac3gWPDxQMqW5UMOgtlZLKOkdDcVhGek+xIPpBPgz
         FI/Z7UKob/nmjIi4hAhiqUG3SFQ6+QoiLbk+3Uzlc2jxe0GBZF3tTW9TleyQYqdbTQP+
         fee4o7rTpRjMPGyaJQs1mBZdtQDPD8qmY4QFhghhjZescWocnUhgN0K7UbwdV6IHhvEp
         fBRXdQOefBWKbpf0zvCJV8gavWbJdOTMjqlyDqdbZhxkjKZ3jXpevarj9RUVSz963gpg
         AUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558958; x=1750163758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiLT6wBQ650bzMQiyRtp5HseVhCkXjDZMFQECvgUq8g=;
        b=osA493NhYvgF6jutzgqC+//2rxeefH41A71Vq1GCIQW2iG0mgUsa7nG2DOszFMh8yv
         ReC+yxPMx7RZOS75KnE0DadJDmBBymmSIW22BAeH+wV+fLFocsGYQjCVuG+PdiBmkqoE
         4tcr/Fp2i/8qn9UMxz+5bSz/rtK74sAqv7l7lw71WjZwf1Mk+B6NCdeCOytsbR0dM0TM
         NME7fdHm25JAnTzHRW/7Rl2qJVkfaSJWgNolK8WDUGE3jTR1EAv6LFasOXCnuNSnHAJt
         GsrsoQiBjczDIliE6RmW1YTtCT2UBX3/AQiHOYpbaje6h7QmWxnheeajstt0kirqfXZA
         LIlQ==
X-Gm-Message-State: AOJu0Yxn7uffBGskLZ5GLuXDQHvN+hbK7lgW30FWy3RmeJRjy7teMu4k
	F/bX5PDUiMTRRENdOOnObdnvpO/Ni5qr5YPUdw5mkbOEWu5t79A7A2hAH8D+tklOYWI=
X-Gm-Gg: ASbGncs1WcC/8R5Ybsy8Iw8xArb3V/uoaBMn6vPBtUDoeEhjr+gYs3LIYTUNj2xyiQt
	3JDdDwGBU6k+hsKPkIwZSzKWFEF2GPdS15pyftwgaDMp3tzv8J4qIo9d3H2T+P3vjZij06RPP9C
	K32fKmDv003qnbXdE0va5w64aaiO7dwB65kQCrfY8bR7+qQNblfQWegSOrnK0xjsMMmo0eOTmYh
	cRWaXonUNXYrr91be1CbzNJlQ0sSLy89sASO7hvrr0nnGEWKZX07uA6TSoW3k5wNv4X1891JZek
	StNFB6t2atmc/GRL8kCp7gYAXTq8rlojOI79q4daDrkIKav6kQJVTg==
X-Google-Smtp-Source: AGHT+IGoSNhkQQUc8dbsTa39caQaeUFBSNvNDoCuunqJlyIF33dJ65pZKYd2lzs7WVwwtjBnsP8EQg==
X-Received: by 2002:a05:600c:3e84:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-45201417068mr156513005e9.2.1749558958214;
        Tue, 10 Jun 2025 05:35:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:37 +0200
Subject: [PATCH 3/7] media: solo6x10: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-3-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qJ7nbVmG9TqqpeyD/Rk6MzccGsAO1RnTiYTVKl04x9Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCadGfT6tsJ0ampv05o4yVZMWeuF4Ht0vCt63
 rpDqVdK4xeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 cm7HEAClpF8c85JeHHwpmEkbX5J3SM/K2hWTckAq1+2pOb/D9rN51WXNL1GKmXda95xWFPb8Ql3
 3+UUGeQtMNFK6RdR+WMUXk8CDLa3yN+KMN+5RoMWGWF7bnYPlMPLhYB0Bow7lRYutbV1Fzf1SUv
 3iZvdWfpvs0cGtnhXKHQvJK9llrV5Xmn/YWCIc+QsNmdUlTKqxUu5JvYQWfMnw2dSEtEKJTpOzU
 5Op3oYSWaq65qPgQTZOBLihzyOtCKXSs9GeADVPP7R6UUs5Sb7OmUlc0BiarhRLlo9jl+fYBiOV
 Y2ZmYfDQeVi+p0841IXc+Axd/br77FQnejUoHaWrvpEzaMqBDPxBhqX2duseMecdGVJtYASCxri
 Rr0YVJbspRHeFtowKjsDgIg+O33oy0H4vRFctv7vE03/Zft4TqGxLXnX1+Buv9CNUcF9J0yAuCm
 nNkR7+c7woz7qROajOfNUiEzDf0gUx78ppqlLW+PgrrgKXm2tZXl6Cy3KiCOWQvUEJUeNO3Ys5H
 HJonmu6f4AgtAmChADna/c4xiv4Fx6dFViujt+AjnSGvvo2fpb9DW5dxLr7RwXVJBMWTXyXAJ4C
 +jpNUnEMLcQQVQtXG381jI0YK660I5nVc3avYSFhkIug8fzD28aipWehAp2I/V7GhJzb4nEGkpp
 7Cp8vv1dnL/8mCA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/pci/solo6x10/solo6x10-gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index f51f865c69bd7b04fac7a1f951c734965d8fc993..6948f246a29ca92f12e3320d9c130d9bda7eef6a 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -127,7 +127,7 @@ static int solo_gpiochip_get(struct gpio_chip *chip,
 	return 1 & (ret >> (offset + 8));
 }
 
-static void solo_gpiochip_set(struct gpio_chip *chip,
+static int solo_gpiochip_set(struct gpio_chip *chip,
 						unsigned int offset, int value)
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


