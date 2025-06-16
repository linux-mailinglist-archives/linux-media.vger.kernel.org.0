Return-Path: <linux-media+bounces-34854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9DADA927
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 09:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4853B1888326
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 07:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A8E1F8BD6;
	Mon, 16 Jun 2025 07:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="grJ5BikW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDF7191F7E
	for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 07:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058343; cv=none; b=WzUe9DMnpUim4ysXwPpfokVPb4ocLKwGDAgGumRXmbuL8r99zmWePsXmMNVhUMbKoyk4w4JGokwL47J7B29OlQlFvA+Q1eyAhofVxEU34VgeOK3ZG+4lzklDsC0YIPgw+ySd+HG8I+n5oY4DQfdmLsL7yxFzy5u3G6qEZuIT/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058343; c=relaxed/simple;
	bh=HE2yDPpjhLMdIuUzYT5Al/VF9tEV4q9UEK+pZGZNjk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gG4mgrArSiW1eIe3WF7XXD5I54XEZl4zHyla3Kvlu8R0gkbPM/TqTw5ZGTKuW/48Ri47UMaLaSrJHTgmNdz09/QEY0se7O4ZYyjVsNNW01Aq1ORClv0REB15AYIHOuT59h2YSwrfqPndZVOic7m16vp9WysZyNnhtJJBR9lDVsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=grJ5BikW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso2758324f8f.2
        for <linux-media@vger.kernel.org>; Mon, 16 Jun 2025 00:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750058339; x=1750663139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aNtuHHj5xDKKSflVQQ7WTHBmkcblGpN9YQGaPztGe4=;
        b=grJ5BikWQrDtTqFoAV4/eVfSuUgYAGRuxcFzPr9XXOY0UtPtpZ2p80kv/sddejebMD
         qWMAtN4HvsF0jpSosfZq/F7GJyJCDekA0N798veEnPkH+Otz3P4sNHOhhdiyY/sqf3Hu
         LLph8fQ5415zvY9uz8LpGO3Yfykj6503rotiS3mjy6bAacD4xsqPVwT0cdDszFXgiFjh
         mCiCm2LM6JkqSig1CKr5an5ja0PQUzGmtY/kDJ4PZ+OwXAZ2NivEJkaqE6yiO0/lXu3E
         4dsocu7Rd+dHvN1jOAXuRPPdv0szZ3Lu9h6Nz0l21YrPj3bKUJ0zb/qlEySg0Lz0JIoX
         OUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058339; x=1750663139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aNtuHHj5xDKKSflVQQ7WTHBmkcblGpN9YQGaPztGe4=;
        b=BMqRA/lRHZGLW1qASZCXTjV5txmwZ9ce6/F88fInK0GRciByQvNHqungnhJYFOQZLA
         1NkJIbQEstPbVumFQAvT2raBggQm7nMGmqiwXPNT+F4wHdL+HEiBBtKxmQrjtsWzNSsB
         M7grfBdTPDGPPBkW1DQwWRyVA0hZd/F7+T8xUc0vX7N8I/OE7BuPluFoHVTM8Sk47ld3
         kDDOqE/P/wR8ZGOPLGO3hQ9+sw5df0wL06GmzGYSqHN7pRQqiEX0RmYEoUDWhpbDMetP
         gfaJY4jLvkq93AwxHLaG1AY3kdG9zifKxTc0BzcSlKFod0bC+Ba9l9kCOn/nEVlHw4BA
         dInw==
X-Gm-Message-State: AOJu0YyeFZVhrO/if18elhj3vS2Cc225eNYO4mCEXD8ie5YW8Fde/Rc1
	YtoDpZ0TxaTWg8i56Doo4t5p0IGJ8Ip6/156zuMNoglnhCvYJ21vwfwweugICfN8/yo=
X-Gm-Gg: ASbGnctVaVDfjJPNptw/7brgGlPwLCr4RL4XDvqCltI2Zr1K6rdH9bbf4YVOkM1qUvJ
	FDWcWdzWzXcxoBzl5uCbHuw+DPZkhJkPJanynrSzCqw6F8XzXVxYz/YLLecNy8+Sdrv1rwnAepy
	AQdTEa29xwe0zHATU41jPhK6W+bMgUpOOLfEl0ALdWntrh7Lg6ohllxLZItUU6SibsIW4K5KRl7
	c2tWHKF87004e+kjzWeqkcA2ioiSWCkurReeZTIuQNGovU6Ri7AH/HQ6MU0ScXbBMYIztINIxVB
	bvT9noppWCz0qQkXOuyHONhwonQ4hM42Pi35P7AwboQaLMuhdbMBjImIdDCSNJeC2Q8=
X-Google-Smtp-Source: AGHT+IGtpUUnj7YnDU7o7F3nF9/M6BSHYo63hHmuhdrpFm+2zQInQCcdBEyDfjW75lNqP8h2j9vdaw==
X-Received: by 2002:a05:6000:1448:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a572367adamr6515482f8f.3.1750058338527;
        Mon, 16 Jun 2025 00:18:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a800d9sm10104675f8f.45.2025.06.16.00.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:18:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/7] media: use new GPIO line value setter callbacks
Date: Mon, 16 Jun 2025 09:18:49 +0200
Message-Id: <20250616-gpiochip-set-rv-media-v2-0-6825114f18b0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnFT2gC/3WNQQqDMBBFryKz7pRJJGK76j2KixBHHWiNTCS0i
 Hdvatddvgf//Q0Sq3CCa7WBcpYkcS5gTxWEyc8jo/SFwZJ15KzFcZEYJlkw8Yqa8cm9eOTakHc
 X09bNAGW7KA/yOrr3rvAkaY36Pm6y+dpfsTH0p5gNEgZqW6LGG2fD7SGz13iOOkK37/sHaCA1F
 rsAAAA=
X-Change-ID: 20250522-gpiochip-set-rv-media-e310a591836f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1846;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HE2yDPpjhLMdIuUzYT5Al/VF9tEV4q9UEK+pZGZNjk0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoT8VccvYR6oUWN01DJsbC9WrGw2K6hGjxXm7cA
 i8uNK7Rp9uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaE/FXAAKCRARpy6gFHHX
 cms7EAC1n/3WpKm6U5EWXV1B9fQK9xyewvbWQktTIxXwHSXuiiLNhE71HRls0j7nWBgRe0KLN4L
 yd5OQSoiGLLhMmOrq8Sf1osG8vbmnY/aURghmLMEPnkjA6gaWUOj3DqE1PGEzE6A1J3X7XyhWyK
 9XZ4/UhdUDh5XX5WP1XWGtS4Dr4iG0nlMhwoATHlH9Y63wac8Qplq84K/VJprYu2qqkcWSWi5gJ
 wCbOWSrMpjvOTnDqr9oaUAngjttUJ1JJ/vihTRO+MroXW6967XIXpiPLj58wqDo15UMHLNCm1fS
 sAs3HBhIj/QST51siwpJqhjBQ0WWqk+201h4Dqbrx017IaSski5FE/wwL5sfnBI9zZNGIxbCP20
 dDiQ0QCcy3AK+NMVKTWga3twhZ7CMJVo5MYHYQxwkjc1vpZqYtqpyNa50bMupXbpaX5AOOMjRCx
 lc9+1DUYAyYDqmoAC+9zALDXIuqxoRTE/CyQKnwx/QsZYzRH1mkRttjorFfjbOObPWkj/9WDzYU
 FaYuvJjb76H4B76C5aORe3sNGIoJN9WvcbCNQBFnnjm8JtfgkkJ2wfjF8SXfjFq+MG+aYCzE1Hb
 nIvCG1x4EEjTJo7lJrQPOgeMfvFNvTPrQY48BMJhAYTtu/4epP2a87ClExPqW+s5cKXk6hxO/TE
 SWacIc2Rt+RCRHw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/media/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- Media CI complained about an unaligned line break in patch 3 in a line
  this series didn't modify. I changed this in v2 to push this series
  forward.
- Link to v1: https://lore.kernel.org/r/20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org

---
Bartosz Golaszewski (7):
      media: dvb-frontends/cxd2820r: use new GPIO line value setter callbacks
      media: solo6x10: remove unneeded GPIO direction setters
      media: solo6x10: use new GPIO line value setter callbacks
      media: i2c: ds90ub953: use new GPIO line value setter callbacks
      media: i2c: ds90ub913: use new GPIO line value setter callbacks
      media: i2c: max96717: use new GPIO line value setter callbacks
      media: i2c: max9286: use new GPIO line value setter callbacks

 drivers/media/dvb-frontends/cxd2820r_core.c |  6 +++---
 drivers/media/i2c/ds90ub913.c               |  6 +++---
 drivers/media/i2c/ds90ub953.c               | 11 +++++------
 drivers/media/i2c/max9286.c                 |  8 ++++----
 drivers/media/i2c/max96717.c                | 10 +++++-----
 drivers/media/pci/solo6x10/solo6x10-gpio.c  | 22 +++++-----------------
 6 files changed, 25 insertions(+), 38 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250522-gpiochip-set-rv-media-e310a591836f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


