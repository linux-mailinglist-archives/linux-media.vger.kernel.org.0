Return-Path: <linux-media+bounces-43177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63268BA032F
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 17:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 492307A25DD
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 15:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6082E5430;
	Thu, 25 Sep 2025 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDr6X9VL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F592E5412
	for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813439; cv=none; b=R3d+qwAmQLii834E9gju2ao9ava+RrfaSGvHTyjVSNscxAbPe4aSeIBRlFJLEAtVc70wrVevoYqpJp1vinSY5w9IKeWEFWNC6zOIzPHoF0E5uzT65JVS7U54YWRctHZch0GsVaiKRoXDn8vVrDxWUmTN2SlpYBP6OOJGnae5+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813439; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtcBZbD1ZUzM00OkhlS2DTHf4TuMGIbO5QZA98YCrsUwpECRLtvtCbwwmvccz/Hn/CpaH+wejIyvsnhqN+YoV973jQ5v4crEyrcoAvLPEbXMbqVpDX+Xg63m8YbcMqioUjSGMYdLGXeg1vzhtrBvHWb0sfhVSkk9iOkbJL5UdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDr6X9VL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-581b92e680bso2208798e87.0
        for <linux-media@vger.kernel.org>; Thu, 25 Sep 2025 08:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813435; x=1759418235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=CDr6X9VLqVd9Jf1udIg4rExPYE5xvc0Vw60gh4orvF/97AxXNsjBStbn5bwQPngaVm
         BhBaoPjy/AWaTa2e64Tf+QS5r+1sfACLDfceDQulrtNO50nTIzKesqQhCx7ZsaYKXjsQ
         pWmRSjoChJfHRSJXdnFsEKO/74zqtprgqZZm88N8ffPD/pLSVtjRnynu/pIUM886okyT
         jV9f7BjqSirNNbkKHGMrEIXwXhEX0WA7vrULIi2EsnT0+YpUuDcOL2iT87t8tn8LITOG
         VAp48VCRxJD3NFWQFQnbNMfuQ/h4JiNT7jI6TX+UlBnZw0gD/mJ++qCWalSIy5bh5iI6
         S9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813435; x=1759418235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=PUbACJow6sNlbTUIfwt2Qobw7a4a1wRkDDsps8c1W/cjSWPX3Hi4yZHojUBbHqt6Tl
         BNYH2cSf8SbJTvSEshQWaQNyW4E79a6f1pEnmmJF0jEwQGZS6sHGlWJHa4DBnPTrlBpm
         tp6sCxaJzxGjVZXVxbEKcwYmiIIEim18dfsPaYY+OVP/h2/hDeeTsAaCbCb17gG7/Xj2
         kLqn4xiJgZ+azV4kTsmSEKPr7FsL0ztlC9QDJppgjtamAmsuGIaAQ9ZdPMoDiwMy3Krv
         3uysBsr3++8O+eR0Q26WlT1zhwZm4TL+G88t45qLFzJv5afM8wVfMPsDQoqWGom/4fx1
         XO5g==
X-Forwarded-Encrypted: i=1; AJvYcCWupJ7Zo+/NLAcsDRB8GXcIiDjXVJO/DQJdZIeIdYw4ZF+nrylTx5/KcJcqzDey5YveiEVC/KOQPE8xoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL4qLm+zkOJLtcXdJDPD8JXcHIo0ExKU0l1aGq5XlbA5FdrR+W
	5PuYKQ+WB7kAGeTeT4O1yIAseNFWuuzB1uJTnakq4+h+dAY9at5YbtAU
X-Gm-Gg: ASbGncsLpDyLCSBM7z2RLKAtJUH3lcmhYeJXNgoH+8m5yJTzXt0bhhHWyDieH+yVGJE
	hYlqk1OGmcy2YrL9UQjLwv9RtCkj9saFVJ/BDKpOvCFIKzlHap80XSp7mjZMnIoqoi+tYI9/LDY
	WQaO7lo5jZx208ZTb+mQvUQu8QZGMlc2rcmQbkTZDqgZYabMmh9uC2/mzfifSGE7cxVOWT85boJ
	kSZCmEeFiq3RijEMMk608c+n5TkebBZjEzV53kGzx1+Ay5YQZb/bQQ57C9J90Cdv3DPkPI5Xpmm
	znqdZaaSTA1BLT1nYXW+5b7jwDYOz1cQd01cGIE8HoKQeDyy25a5PZ2jO5mFm9fMuGe9WIig3Zc
	0cv2WTQ0nYfWh2ZiVensl3Q71
X-Google-Smtp-Source: AGHT+IEZhoVTWc3JU2yVQQC2NvFxzQUmxQf+nrYtPw/ltnEPLZ7YBlNqTjchqSYHU9qwgFPB+3ThRA==
X-Received: by 2002:a05:6512:10d4:b0:57e:2f8e:5f0c with SMTP id 2adb3069b0e04-58306406032mr1045775e87.15.1758813434918;
        Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 02/22] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Thu, 25 Sep 2025 18:16:28 +0300
Message-ID: <20250925151648.79510-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA30_CLK_CLK_MAX into
clk-tegra30 source.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/tegra/clk-tegra30.c         | 1 +
 include/dt-bindings/clock/tegra30-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca367184e185..ca738bc64615 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -53,6 +53,7 @@
 #define SYSTEM_CLK_RATE 0x030
 
 #define TEGRA30_CLK_PERIPH_BANKS	5
+#define TEGRA30_CLK_CLK_MAX		311
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC 0x8c
diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindings/clock/tegra30-car.h
index f193663e6f28..763b81f80908 100644
--- a/include/dt-bindings/clock/tegra30-car.h
+++ b/include/dt-bindings/clock/tegra30-car.h
@@ -271,6 +271,7 @@
 #define TEGRA30_CLK_AUDIO3_MUX 306
 #define TEGRA30_CLK_AUDIO4_MUX 307
 #define TEGRA30_CLK_SPDIF_MUX 308
-#define TEGRA30_CLK_CLK_MAX 309
+#define TEGRA30_CLK_CSIA_PAD 309
+#define TEGRA30_CLK_CSIB_PAD 310
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
-- 
2.48.1


