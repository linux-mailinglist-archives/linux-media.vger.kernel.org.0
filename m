Return-Path: <linux-media+bounces-40258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DFCB2C305
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9CD91B613F8
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81DD8338F5B;
	Tue, 19 Aug 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN1vxb1Y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19C33A02B;
	Tue, 19 Aug 2025 12:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605806; cv=none; b=LiuMA7sk7iqGfAG2TlId5Z0EORSA+XYCU3wE6to9h8RIMASM1Un52XhQa1rntG7UNlfby+RNxxyfqyvUNl9mpEcXHv+dKhcNqRpORlTIS66iHDd5a5vwgkFSDZiuzJw4jibO+2GwVUYJzk8ELwNOldVd8Qma5CLuZAzb/k+yUyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605806; c=relaxed/simple;
	bh=jCks2FO351KgLe/fBb6hVWkS78U7RfPD0J2SavjybMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNYQPDAiDw0BOVzSbnQF4gBa6BCy0WSwMhsq3/vO8RmllBTekLs5OKZDxp5CLFprsPxpaQ+Sc3H59cYZlPC+7Pby6mGfmmzNg5gI3VoNpVCntGQVYKjKWA7klO9k488UBCZK7Vclct16dCQfb5nH7Z1xCOyHSFIcerKrAXvCtyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN1vxb1Y; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7a3a085so804166666b.2;
        Tue, 19 Aug 2025 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605803; x=1756210603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
        b=jN1vxb1Y5jbg+FFdGtGMlRRNiQH8hjKD0FOEo1oDFaNpfIWJfHDcHosP4jkxLuQ8x6
         fVvTXIdPW/bq0LbVzPQH5aGxjrkd3qb3rX1LqRcrxfnWs6w7H3C9oBQvF9eEVMl8pFZe
         gUdBodr6aKjQ29sK5ZF/9iHCCMjKlQuFWXDsQX3h5RphvRTV6RlijtJNIQJWGGbonMul
         ltpRUxkKziAT034xQPukURcR6Idf/TnE9rpp3Zfdu/UAQSgzxjF3xcDsHZL8HiUJukJ5
         PeszNJPHtxcjjN1Y4yZbExxMeKiQPra4il96mnMYDwPXMJRfqBv/mV8cHywYQKsZKD0a
         WQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605803; x=1756210603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/oKOTJz58St1gTwh/bBKNgiqYHP+xMc0H1/D5ORgpY=;
        b=v3GlUQn/QKc7/dHmuNH49iw1XEfcI/VeqDimC02NMHkbbp46pciiiQAulwIwxutLqz
         sFMYYEJHxmhwISiINDBCq7yYAOXa3FzLqIeNJKf1JtpgITqbvER/cvz5Ne7S/ed8KDx9
         IAK2PSuM2qiNwXrq9s3I8PlRoGDRiargV3B93BWfwIBJgFejrATd6MBYKqE6jkdyk1+a
         H/M7jRP0QvugGeva6RgJRXyvxU4ZIWPbmoQxE4HTcIaOCiH9TMAqQVY6DFf4bohxd0A+
         PtkxlhdIJLUJt9npnX2gL+jY6fGRfNgE9qBg/k8ccqlqnORj+7X3vD7Zz8SIz7wXcZwz
         41+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUviJm8+XVva/k7HFL9XrvJSVAv49xTzDPR5gWvhQ+kbOMy8wqZSYCCOPIAPCa55rIwGEHGRtoGorZugsVY@vger.kernel.org, AJvYcCV0SCfidGx4VW8njSeiPzSoDWXOf8ErE5lVjfPq57BXOB9zi+yIQKzkxGoomoSiJp3GtMB1gFlr/KPD@vger.kernel.org, AJvYcCVC4YIxt7bBtY0aSDSi3L7U5kns3YayX7hpy7R/bXjvsLZG/VuiEht6Oe1QQ9HgeU5JZJv3yErhHBXY@vger.kernel.org, AJvYcCWMGo0UkdIer5bm9Ah2WYf6aDf2UpYy4H8t/lBLHrgf5asgl2zlqkmPuxxbJvHUD//uACsJUaLvoZjaDvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdMHvcDPGv8xmhmw8IY3Rq184pnClLCkgxZlKX3qY1sgwPYs5i
	y2esaHopZt+Ohf+5HbJdT5iwh5BN46kN1dqB7X50riHe7Jl+I85bDDmN6LOieQ==
X-Gm-Gg: ASbGncuo/xTvI7tcVoHb/R0okdoGJH4abqZuciPVdSUC8VSQhB9SyemjgUGOs8DNdE4
	KS5FwvCT+3+WjTxMY1EhppqnaKodXjj+LrLXp/eXhqy0pFl4Qwe1aQ1oVeYa+gSLqyiI/UdlBOv
	dBz9bzAifYGfFXr5EdUTsyv4p6DZfTuNFGWAA7HiT+Uwjm7qTHDmByuXySXtVHQZmrqjgvQ1N9W
	2fbqBMIluoxBuDNyq5GBElTY+zPGjgr1wjHmd9dONhA7to1ce93Xy5JviXQZ4SOygwTDCb0SWI4
	/eTI/TPk8omPbZF9AF1p3L5vt7coAB47pcK93bKrEB/IllMm0ZnV1t7Ylf9FFDmpl403bF39bkQ
	rey9UiBe93WjSig==
X-Google-Smtp-Source: AGHT+IH6gI4Wt9MTamNQRuZI3BgyK+3myche9xoYOBrZQHy1Q90e/zgSuCy2a+6/nFauZvLKfIttEw==
X-Received: by 2002:a17:907:6d27:b0:af9:71fc:726 with SMTP id a640c23a62f3a-afddcbad953mr235796566b.17.1755605803433;
        Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:13 +0300
Message-ID: <20250819121631.84280-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CSUS clock is required to be enabled on camera device configuration or
else camera module refuses to initiate properly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 1 +
 drivers/clk/tegra/clk-tegra30.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 551ef0cf0c9a..42f8150c6110 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
 	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
 };
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..70e85e2949e0 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] = {
 	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
 	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
+	{ TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
 	/* must be the last entry */
 	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
 };
-- 
2.48.1


