Return-Path: <linux-media+bounces-41888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D62B46F61
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7551B273A3
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F0B2F60B5;
	Sat,  6 Sep 2025 13:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccQu1vD2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D74C2F2910;
	Sat,  6 Sep 2025 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166849; cv=none; b=T1rH3B1AaKWsAcBHuNgkuo4Vog6e5MuNGXqmBPj195Y+unF3vTvLAnz3A+MM9Yi288nrE9+lYk0nnRpdM+UsM5d7QSPPOvjOhhqmbW1l/g0DwNTcXkhQNwVsHVuzrApCBG2O2VO2wkX3M5hbIBJjNQETPDC0V41UeHVmoGLqIMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166849; c=relaxed/simple;
	bh=DTVJGgUVK8J/aDUZywIXHZ83XRXlyCGjDKvYC741knE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkVsv4m+aNw7trhrJ2AhbUVU2zyws7XRovYvUqAyi+/O1xtsd4+Sx4ydFkUDeIn6X8zHdPQHv6zHBQaa5FD+OxacBeKdVUGFz3iVD0lN0Tkg/1DVphTdaprDzGn4R6l5zUtWfRd4k+gTX009eUfqtFMf4smVyzLdim5/Q7f8p1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccQu1vD2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso3350023e87.3;
        Sat, 06 Sep 2025 06:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166845; x=1757771645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
        b=ccQu1vD2q2nB4LG3YL4Pj5uuioWHq+tQgtNW7/hRyJ+u3dF+mzFmPOtTG/vuACTfO5
         LytpJk7jB9M7R0HtgZ6pvrg+PtVBg5Ugk7ivi7n9asR7AYKFby+PVI2XlhQaioJJb8EB
         mJqadAhXMoNntWYtdEcoOwYVZViqsFkdcwvyrKVXt0PFbAXjL+x1ryyo/EzCxtLV7Yy/
         kPtk24mgQdaOsnwFtPCKGEuaAWRQUhnyfIrVaLNisJ9NCH1g2M3RicTAhaCiFcT3qnpD
         gXOgl+y4Q6LOW+f7f40l0s29rrMOaW7RuiAtgV9g2ODmaCpqZ26UUpvYy9irhky0D8QN
         1Ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166845; x=1757771645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wmFPnjEOhtHe75Vr1hkySKhaOYSvurifERbXhZkjEA=;
        b=IDYnvK882ZlK1OX2E8b/JmzVP3jWKAa4rnvuTnG/7rpgpAXSmdxXABBRG4qi+6+8yK
         MtnOcwyUeyUUxWOFd8JOp2UYpNpOGqbPcWPdR5wUt64t0ua2gLPo3Pkbsw+tUwxmzLQR
         34BnzyDc68WbyeSnsi+5z4C9XD4e1vBtUNB3E7N1fxgzgtFTXr92R4V2eupjxDLrxZM+
         Z2+V0WueE0dtKK/IC5rhejYilnq6t3GalxwhNh38ouaUoYaNgK/JyxetYLMuArlh5oMc
         WNvumDzfCAbY/n+yS5pjAMAt7yklPZfKiJLLQzs5auqGDnC28kydG5LygmbVjtag5j/4
         9saA==
X-Forwarded-Encrypted: i=1; AJvYcCUWMBbk8k5cNSvbwtvD495IFKDDr1hNl1nMMigDjCqNbOD5QT/J36Q3o+KPJbNRlozmMNhrc7sjOpsNnjg=@vger.kernel.org, AJvYcCVt2J4bEQYFE8JwrZs2DTql7E9TyUkfR6NryiWhDzlpAJ7NeddGVP7sXyAqY1v8pp+XO2QRF7KyD5Fa@vger.kernel.org, AJvYcCWOD6AMpKNZ+3TUQ4OZClHDrbXnzEonca1Kpu06k3Xyfq/pXheBpdthnpXmTV7FPxs71EhruBH+BiuaBFc0@vger.kernel.org, AJvYcCX2F9muMieXKooJlD7Il1gEQ/NJy+vXxpWNlBmZuXdgTEY5ojOL96BqicqVQPT+5u1G6fhQH21LTtRSiP4=@vger.kernel.org, AJvYcCXQ7axdtUqzq5xUI8zFn0fjodRrzTs0n8cR15x6qdf5UNuo3351fhyVUWW00ot1w9w0C2BUXw6avr4M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4h2pSIVQ03B1HmVyK7Ov8Tsiab2cDChR3abwyKNzu4UjsedgS
	evi057EUj7LwH2PJV1oLO32QxfazWY4vgNqNspPH5j/XM/yXFwEnHslh
X-Gm-Gg: ASbGncsyUo0/j6IpGGn///Wdw7SUwXsf0ggPI1KHz+vDEflh4+iefzu3E4oatiQ1iDO
	6/CXBIY0/CMDdKjcbNhJ2hTd73e+OQcAlmOc4SIIJGEzxyEJXtDfuQ7P95hbU7IYtXdCdkz7ueg
	p5ZQLSJYse+VzDMGIRAZnNiwps6+csf8w4obPlbxGp77XmlL76YvKLCZzdMBWNy/XMunK73u4QF
	7T19bKPo7uMpC97Wti7TDn/LDa4uYJ+2Tl7faWln9AJ2KhhDu3v0XlqqU8uH9fPhWdLf1c/4oc2
	Nrplu8sRpHpiS2NhviEeet7TPiV1/J6Y0lL8qhwRZiH7thZ/JXTCzvRz+iEdftA0mIeUNLGLY/o
	mojxU2Zva5imJWK6hd7Zv0PRl
X-Google-Smtp-Source: AGHT+IF1oIuD7hAEOhucs7ujWwrMDLFuXJtRrwVwRJHgHcWW0EsIpJZ1uQrHmNQzYSIeaL4YgL0RTA==
X-Received: by 2002:ac2:5687:0:b0:55f:4ac2:a5a8 with SMTP id 2adb3069b0e04-5625fbf0b05mr589085e87.13.1757166845287;
        Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 02/23] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Sat,  6 Sep 2025 16:53:23 +0300
Message-ID: <20250906135345.241229-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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


