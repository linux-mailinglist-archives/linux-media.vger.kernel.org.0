Return-Path: <linux-media+bounces-43911-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EE5BC39B9
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AAA31891B50
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095C22F361A;
	Wed,  8 Oct 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC63w0IV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A311C2F261C
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908684; cv=none; b=e1uzme8+urOPGnMHANXraaEHdJF7j0kpflvYJwl8+r3hlXWTlr9r2J+OwDPXPNhpD/n14WmsgYg5qvYYvTHfpoC5hSn3yGqV+KF5B2dDucGiiEAVNyINUauvT6E2Q5DAqBSj0L7c/663VyfRYPJlYHzlImTl40xS0eM27lO4PgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908684; c=relaxed/simple;
	bh=7dAHRT2r7ftPVN1rS5b3fLL9XXBwlAPnHlEMfM9TlgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tYtrkiB8HXNyB7geBrelOnCZ7hnUSD74VOS1+HxI5gVrV3940VlHmHEK/I/3IxQ22VmP8bABneCeHaf703220rbxZvF10C14p8JYSHls2KnlzPSfmrg2tqLQmOqrpfbG6HuSJRksW6U6x/JG/+TwdyfpuexlEExg41g2bu2pG1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC63w0IV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57edfeaa05aso8453318e87.0
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908679; x=1760513479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=HC63w0IVEJO2+Ai2+MASIXbe41FALbGsbXtwYzpJUnPkTN/8g2eo2XBI6cAuDZrSNL
         y0txA+GPYvQ7IOmHGFicDeHhJEYZHAhWsIpplNM4iwbSI1nYd+UShSk1H9WO2cP4xcAF
         XI0I6HcCsBa0ekR1JA3lYg8xBfqAtO5wPZJABB89b9NMwnHixRgsDoJlhuz1VSDPnDWZ
         O5PgD7h0jWjNsDfo0j6AlorU38qVcOovkdXKPgF3ZJx8Ys8TfybM4lOfBYQ+cmlTcf1n
         tUWXbB/+yVoB8NAis0s74TCL2ASxBorVzbmRgQlW/PfQU4uHZr1UlP1RH4ogxMNxd63f
         b0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908679; x=1760513479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/43znEe061f/mLeX5mGh0JaDqN09K9lxSSjlK2dh/Q=;
        b=pvJSz9XHoY8NIg+mROK4LlkoLbpXl/fpW71CUOLQkVvh1TwEJ9ktn4HwDm0k5f/zw/
         1EiisRPpJOqD6t2FetHYF1YmjoR7dsp80VQ85qBwv6jbLL+8OcUrrHHGxhxea+8XAUZH
         3sebsrsHvv2utRxeOsOHXJE7pQ6kCGAShheRRn4QklAzZTTl1jMM6dfV0n1Id7ldPGlb
         yout9qtAaD2sUGNrj7srStXRKd7NRWHFVMfQggZ1zt7qwPPJe4ElR3h5g2yoOgt59yMF
         rZCd2uTw25rC0p+cZh4Mbo80zj4aACxILQjg9nxhEP+hATvdDk0WzEdEcgla0OBF6msh
         KhVg==
X-Forwarded-Encrypted: i=1; AJvYcCVbSeJhWwvqcZDImFgniZQtGiYFDXtdZp72H6YcF7I6YD0mTTmLG9+Vcb2aL5hosI/BzW8ak1bgMAZmew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1rykFQPcdeEnJPz8NlnKYuheBZwEhd7NhhHA2NQdjSdhPtVTb
	3ONGumGVMccuBGFKXombKw8frOsNxmpb4cWw46kxHrHmfPi/M8Z8BmF5
X-Gm-Gg: ASbGnctnRqIJDNACnECZMqWH+16Ros3ryGN8tJuJYPSOoM6x8B1Es08lq0r7QfGmtgI
	xNgSzrQNWWRKNNydvGnzBXRXZAAlGtP0fq1NqLAFGkOK4Llm+PQ4fJt9b9nehin7ho7dBChsCE+
	9UeOFvGIFpTB+7rsXISdfyOnk2cyjl95yiNJrUyvwuEPxlrXqdZRAoddeWBwfOBkCOLvtqwu9Xt
	+b81NehREaj/hg+m0eOresP+OrhLVOPs97E2FTDNZ/WNMLYRQcICLyfujivQ8wlzR6+ReCl/mfP
	41HUMXaP2UlTYAuz6fuqhypzeTN3614voA0SjAUS7QBa8MlsCH/tatopHAwwo+3ogSI/1PW/gIr
	R501iyoCH2EvpSgxXm5rljIrcD8K8Avbu5t3flA==
X-Google-Smtp-Source: AGHT+IH6yVzn596rSyB3yJ9XBLWXz7u+miIMTSdihRGfwsNDTc+rfVY8kk2V15qCy1XHoAjhkBFITg==
X-Received: by 2002:a05:6512:3daa:b0:585:c51e:e99d with SMTP id 2adb3069b0e04-5906d896bc4mr657722e87.3.1759908678413;
        Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:18 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
Subject: [PATCH v4 03/24] dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
Date: Wed,  8 Oct 2025 10:30:25 +0300
Message-ID: <20251008073046.23231-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
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


