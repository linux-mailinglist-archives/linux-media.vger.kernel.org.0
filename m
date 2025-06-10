Return-Path: <linux-media+bounces-34428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB6AD36D3
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 14:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17620179580
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB93A29C35E;
	Tue, 10 Jun 2025 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LrG5vHga"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93906296179
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558964; cv=none; b=Qvo96yHomAmNVhOtso9lr5CIV4sbkwG2u6lzmi2KhYmFTAgmeEz/6Rf8jLeaJj/gz1hxMqPI77R0FMJkitzWzcyS0kUEAUAt/VXk0w9N7Rp126mHV4tLnBROsKqM77LH5Ic734iDhm4Gwvd+mEuxUcCfFYiveFcMScAEHMvumrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558964; c=relaxed/simple;
	bh=DmSMep/ln8oFNFSCxh+5YdfNVCHUYDbu+lN2rz8R7HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6JH8sSh7YJen5IoN8+VizR+K7CFdggv4mG0LT1BqR93uTtlB4IWsaYbKomxAEwilDZmCl232fshF9Bz6i6KIHB5M/sTHAEVUFI5PLqOwg8Wj2rxovs4ooZKB4OpGdIYL0/1bl7AU3S/2V6w32KbKGeiXwO4EgOSXXLucUGPkJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LrG5vHga; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4531e146a24so4756975e9.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558961; x=1750163761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=LrG5vHgagdYLiNpLHWDrNdxpMHcGqn+TXoLiN9hFlZ5fJjKJR4c2VrE6VFGtAcqUrQ
         X/16GCxlOG++do5ZfzMeA2peYh90heHv5pC+W1CGnx0Ctvimf7Mkf/THA+NXijvDtsiu
         l1mOgPNtpazRwDjE5lIYL9evdUVc8A+VN6IDnkHf12f6voKjZq1cjSTNiI7gMFaXb7AL
         vqLg7mq1Lgz4C/kLzQqy58NB6AYls3nCUusgwDxyBdB/ImiJ1IBTci+Ba7K3Y65JrFdo
         azzTGoGH4x8yH8E/Eq6JMFhYbE3RMt0Pvhl+iROAn8rjbI+BArp0cggX0IQIJ5/lscv9
         ypqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558961; x=1750163761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=dal/AeqF47Kql3CaZGJwG/yrShKwx84Chil+g/Dz7DXJIq8tbX0ISG1H6ijLja5hnj
         7R71x1uBHC3dpSuk1Xdg98BVaE0CQv6aZ5pihCpSPupFqIbbZA1CnntHKOGT1RvGgG36
         4iA8U3zbfrzfpQRy5I21OllKViBTfAqZWJa2EbFsbsJk06HH0dG37SpjGvWrnvbqLd9M
         MOzrnOIHg1dCsDYOXB9cFB6XoUQ/pN445V3MEoGjTnc9ahX69W34XvfcMHlcHcDZVNf/
         y4/1x2FWuwckv1B8cCLBQspCZz5p5i0soCYhVeF8H2uBWAoi2fGHHjlOtoLHuw8HFff3
         MEgg==
X-Gm-Message-State: AOJu0Yz5UBMwnbqZSDZnTPo4G0NADg7g/hglmBZ8GNXClayY5PoEGumy
	Dp5ILDpi6u4FhQU5A5Q9305tRM8EufgRDNgCPWb3D/p5L4l5y07EA8NAATfxGhIbxzA=
X-Gm-Gg: ASbGnctOutjrdFHhAG/yIjRWTLfNXYVN0zNs4c6hCqzkyBj0TvhgGKMIWgNXuwEWGo2
	C2qHDvorop29QiOF+jvI5amC2BNFb6vVRMhQGaa5GU2CfjejSaJNddT4wvF6VgmTw3Hpgn7irDt
	LC+q9c+xaqLGTmJIUFw1IBNYah/K9mrrryQfeYNK7Ohy1RJ5rpHV+YzfWOtzamD8DMCZNGjX6OI
	LzV4ZPdF3wclTBo6xZnCBxRVqW38C0bG9l8yMjy2+KTQnU0gCVjn8x7LrXlUgY9TLHydKZzsu1T
	t++b2zZGlpedQbz3iaPRmlveiCwNjxpjDRjXe48XonDN0/L2DuYj4EGtH0lKQdVY
X-Google-Smtp-Source: AGHT+IHfPMYdbRyv2lDo4Df7tZa8JhMWmqJ5xTNyY8GATqJ5hfSOIDKoiZq2XLjT+/o6Y7BqLz6SBw==
X-Received: by 2002:a05:600c:64c6:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4531de0093emr23790175e9.11.1749558960814;
        Tue, 10 Jun 2025 05:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:38 +0200
Subject: [PATCH 4/7] media: i2c: ds90ub953: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-4-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6W1fcEZimkIBP6TJfRKXLMogRIa4qaWvK8I7PtSZn7U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCadgZNCGVFxZVVgaNpXwu+Mm+iPf/1j9OnjS
 h6B2gUmkKuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 ctu+EACFkCbwSoa4iv+9cVxVDtv4cv2EitIDVYBEwHyML8ePPxpTHLWdYCwMUNCYk+QXViqfZ5E
 GSi5XJ1K3P7JnOU4+RjKupliJekYJkcj9T96GcDKPgh2C39AkFUnGUDGyLdGDqYoT6c5Fsb/U2S
 0BIsPkWJZGZbJIul0RbAAMO/SnMfXNLHUhMpfEWUMDsD5Md2QO4flxYBCDPLTh8MaibGSa1xnEO
 tfTSTEPTj2psuOYw3Mp/hgg4cqi2+qygmQBYCIqMErri6FrJluhbL1hSHVf3+ZdtypLKj4CJKF0
 GRYFoAFKlt55vzDzxj2qebHPmCwr0J1RZTK31OOanB6psbaR7seEsNAdQeSIv6153VwYXPIDrny
 V6bhda2T0gEviWbCfZ1DEJbvMORv4wc3bm/Md3/eDQOxeJnyxn0CVMIuXfIpUV8CH+NpXHuTAXY
 +eTvOs8LnnLkAc5c5bZJN+N1zSGl9SOttchRalCO4JUPknR2ZUef3RRVHVV9UqaV7xs9CvGx59z
 RYkH8tiMuXikYvRlsHQibPLAk52NL933ARk92kdgqGtrgRiOj/bgzQe2TZ+Ttmmcapp2n7RZu7h
 NQmmvLreQXMGbiHSuSPC5bVNg6tv7S/Ff5v7WHsymifG7mFjbOFFqT+XnzdjSJIZTwwVQMF2z5B
 uFM17C8ZjdeYJLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub953.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 59bd92388845eedf64587289c7f7424ee570524a..242dbf6d48f3905c8908bbb06ede84e068e2f267 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -317,14 +317,13 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
 }
 
-static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
 
-	regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-			   UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-			   value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-				   0);
+	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				  value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
 }
 
 static int ub953_gpio_of_xlate(struct gpio_chip *gc,
@@ -362,7 +361,7 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->direction_input = ub953_gpio_direction_in;
 	gc->direction_output = ub953_gpio_direction_out;
 	gc->get = ub953_gpio_get;
-	gc->set = ub953_gpio_set;
+	gc->set_rv = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1


