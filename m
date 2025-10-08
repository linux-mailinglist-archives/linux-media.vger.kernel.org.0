Return-Path: <linux-media+bounces-43912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA408BC398F
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C39074F3247
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610492F3C0E;
	Wed,  8 Oct 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCDNthrh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A78A2F3610
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908684; cv=none; b=AY9C2of2fNLcVyeberhFPWc8pXWz0ueQudpQuBy+vt7+aaXOiDs/YruT63mMUfHbA7BmupWVXZeAliGeQtfligF+YH4cDGnbw8ZQQiubFAWic/d/mzfgv7nMGSzj9PwWtT92qsk/xUD0C14JnCSnoU6gLTbhXrgj1StwRRkcuME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908684; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRGlqAdptgoWOBMKE9IbtuFdH6EP4Kha87JwzTsRCp8JK6927AnlGkxqUz+I1nBPkohNly0KcxUNnpzPreBtruHAoi4rrZDrLxgwG4opJPDBnz+925ylbM+tsxwA2/VanP3XTx0CN0eWuMqQhzfrXsYRbhAOh/BsmMuBNyJiduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCDNthrh; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59070c9111eso574968e87.3
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908680; x=1760513480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=RCDNthrhFlXsgMk3134FDx+iXKCyoN39hMjleI/5NaT/y5e6Q3+updLPXeIT4sTUl/
         R/Khj7zzgBcYVUCe1WMlu2jJATQC7KAyUhF7g7e4tR7T3kCuwaf70+Zd8bl3Hu38z0ih
         l+5xoL5IFenfk8m6w3I1KY6E7vF2I7DcV37xxdLFVz7SoJln68cWNma79tO01bVTqaNC
         rYx9Xvty8XIN/Rp2rdhfg7lhKErWeS+wZHpTmJpJqw2YlMUHwdVrysTQj1uhoWjh2PKg
         drXCowy9avKra/UyzvjHNy+EvCQgRe5TfMgY64Uilzz9TBGWVPIjJz1I2WlRJL41+frF
         Qwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908680; x=1760513480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=XMf5DzgWw+bzuqwn+mS4r7EoA6O3H6bugD9RGR2cllSKhI4wkyWuz21iR/tKI4IqqI
         CBRV2FWQfNwpOLA+jIJOIPSFJKS/2qzGmNH4MdLiJmpaI+KAbKNcR4CR3eTaz3lJXsTb
         JDLbZgbdgHjvXXdMMBLv+h/Qc/sJLlyZyNd4j0R5sQLdJvkvzkIYK23V+Oiuhador7iN
         5vjPCTQft4MLSagn1gBuQVd7tdSYGcWI7ezr9MuBecthTpjeIiVN5MyDY5xm572QyCee
         U3RxSzDEQluWcLmql5KvxOhqaej1vcxrjKyMerr42TrDLkwR5Dighzsuv8cohSotM+RP
         Oi+A==
X-Forwarded-Encrypted: i=1; AJvYcCXVIWOrkyXrJ5h+z6oarR81twVBHWVHmyuIpkbTKdo7gQXTA2hTw4o4w6ZZMURBI5bhpm/2lFNd5VyiZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bDDg2zdS907xILSmjLhkdZ21vww6GlXRrimQ4A/pIY+HBQu2
	nonf5jaNRA4EVLwvAmVTDizUcNZnT2MzdDxRhbPKos8os/+6WQpUX3c+
X-Gm-Gg: ASbGnct85dImz//A+eODge9ydGp0hyGGT3pBcH4PewoSMYQXgrxAp6S4uYZG1SVDTTR
	4+Jy5iysoyahKSRc30bP1aHuNRRzWNh5GY4uFvO0/iNOP7V9DA5AdE3WyIWSW0Xuo4FZ9KKQ6Zl
	iuFSne2g/sjS2QqPU2mkqe82L2dQhGaLjYKKimWZ606fNEzOKk32hmBkMjWm3NH6ALVD+LduZrn
	MT3xztrndpCmzDO+Z2ZoDNM8Uz4rOjAX5YYQ5psa1vmBbSiluUwDHp6OAuzGU9lJMrfOBbmehYP
	TVH3MXiTFyaZmJoY17mTQ5aJZGgwiR8PyWnzotT71zuu2e6FKaNb3cDnps1/5JzT3EG8J+Utxty
	pQUJUlwtCGL8BhYnww9ZSaxlE02UH+hZPM0OiemEh1J2IeXYo
X-Google-Smtp-Source: AGHT+IEZP4fCBr+12IlYOXrH9a+CoFe5hewGhtwyyj6VYBFCCNVd4VpYfDkKVBWv8lYOk7dl7gjLUg==
X-Received: by 2002:a05:6512:2312:b0:590:6598:4edf with SMTP id 2adb3069b0e04-5906d9e92camr655190e87.47.1759908680085;
        Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:19 -0700 (PDT)
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
Subject: [PATCH v4 04/24] clk: tegra30: add CSI pad clock gates
Date: Wed,  8 Oct 2025 10:30:26 +0300
Message-ID: <20251008073046.23231-5-clamor95@gmail.com>
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

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add a plld2 spinlock, like one plld
uses, to prevent simultaneous access since both the PLLDx and CSIx_PAD
clocks use the same registers

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1


