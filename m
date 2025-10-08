Return-Path: <linux-media+bounces-43909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ADCBC393C
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41CC71892C42
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8C12F2612;
	Wed,  8 Oct 2025 07:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjEkU1lj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85C2BFC8F
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908679; cv=none; b=NaSzznrJ2EfzUtjB3c8+9g1jaFTiXOzMvZrkK7/GI86jBrQRV4QfMcN9J1bfVFn+Xu6/D5zwS5vINxbQHW7YOtjGFoTqYcrqbawbrQBBi1ewIvZ2Y5mQVL2Lx+WFJIZLSoiKSF2veHhwliBPceJ2lF2+bu9+22KCIVHqJB+uic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908679; c=relaxed/simple;
	bh=Xtlv0T4/g1zHgGtcSEMBQYBsYKA6gFss+0qpYkk7s1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkM5mob5M2Pfo37JbZ7D8lytOAGBlL1mgw6sjNea8hqXZXGdFNkaw6/Gaw4ppXzQqKLJ1TQEf5SpbzVbwpHbO+TUJADmHl3rxzjYFqc01v3l1IiF8hTsbK9AmN1FDYTm2rINIz7ElgRfn+tReA2s+4AJTb7FeK9zwwZGcnl5KwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjEkU1lj; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-586883eb9fbso2494571e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908675; x=1760513475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=mjEkU1ljzoPAd5xRdZag34mPgwvF8Q2NtMAG1qV19a5hFAf+YiZwvyXi7jRJoXLzxh
         bEzzsGAimhBESYTA7IITen3/4HTmceQKC06Xo29PgHlGGtrlhJBlg++DctAGKo+MyNHz
         EjJLyMOsJYMu1ZkbXHOCGGCfdUy2/4biGo/dQ8Dy9vQoYDr4ejQi2Qbc/QyCrj/ClpHF
         i2te2dx53EtOkHm/CvFDrM9UiphHML5SZ7Osxpyuzg2fUjhiKUcAufoT6ay3/vQ55CG3
         wp8XMry8EGMvtJbScit47AuRA2Rj1elgN6mp8AGk3rmKZR4MA4fNlLF3AA//1twyJ3bQ
         R4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908675; x=1760513475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuOpi1X4QZYIfmoXv6VRwrkZ+36+Rr3x/0SmX/s0qO4=;
        b=XlKja8iSLGG7Yd3LjBnP7LpbpFF2rvxVRRHB3tsxp37rYjVrg4Y+CgnwoYTSNtv/2l
         NU4VwcyGaCgi3JYvx4xJzyWTzP4zJYvhtObJHXSWe913XS259P3kaBceInD9sYP776mh
         o0+6e/lbXEOuO2vtuLpioE7dRcTT3hhVEmgFgSnXos0nNFEJ7Li/vZkuM/or9lz0n9Ak
         gXPIH3tjueMR4c4rE+0UP9Y1+xvHtEAEqr86xGf/hJuQO+NyJ7ndQ4qKs8gjXMbBUMnQ
         EqwTSUKsWjNtz5CbU4IDO5OdcCBdPD/wklGCESx5BME07cgfysCLDwSGa6jMcgRpRpMb
         1aGg==
X-Forwarded-Encrypted: i=1; AJvYcCWbRb85jS1mZ5HbmyQRuvHzUjqayJDVx7I2fe4Nh1Z6qDx7aF0bCl001AZFshAAcxYc3jxwuMRFQiZLMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21cdiL2OMFQ00BoxQDyQAdb/a1dDsyh4betWPdb9x4IadP4Ic
	FKq4bqbnyejhpTGVQOmO5OgfAEECbIl83veDHydUyp1ax/wuFGCjPT0G
X-Gm-Gg: ASbGnctozhun10F4/ds/REs53FZfMwJRVS/0z7hl4vf0Fnt1qESCADYpAJvEIQmp2i5
	73RgzJ6JNWeuvIBrZO66bqPI2WUKuvAuk/Odiq0gIslmqOF4BR7krJ2z1u7x+mfgfQhfjKRyZka
	orBTIcoluRTY1J51Sv0iHnPPeik5KSK5xi6UU9eSh3uspOrByoeIORpECeuqA5tLYOQMlheGKTa
	kC0wmw9qWu7ECg37R+cqsFaP/rlEzTOlpdGWrYq0SLLc4AscQ4WmxuFkfx524BME1lgAocpmXDh
	q6dZR2+uJZwWcBzo/FC/uPyC3dnmXndUSAd3AS57oVwYdl47vqS3IF5XzGc0ruecl1gdVdZcqUn
	/W8CFelFcEAe+tyQjwf/BcMbMoiZLpJgX7fmFyQ==
X-Google-Smtp-Source: AGHT+IH4w5wUowLiJI7hgdEtUtkCn/YDDLljjRvew5jTKIWe64MrO+dc17yhYkOKlcC57NaNakIcLQ==
X-Received: by 2002:a05:6512:4028:b0:57d:b8a1:832b with SMTP id 2adb3069b0e04-5906d89edbdmr712455e87.24.1759908675110;
        Wed, 08 Oct 2025 00:31:15 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:14 -0700 (PDT)
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
Subject: [PATCH v4 01/24] pinctrl: tegra20: register csus_mux clock
Date: Wed,  8 Oct 2025 10:30:23 +0300
Message-ID: <20251008073046.23231-2-clamor95@gmail.com>
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

Add csus_mux for further use as the csus clock parent, similar to how the
cdev1 and cdev2 muxes are utilized. Additionally, constify the cdev parent
name lists to resolve checkpatch warnings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra20.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 737fc2000f66..1a1758fd7def 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -2222,14 +2222,18 @@ static const struct tegra_pinctrl_soc_data tegra20_pinctrl = {
 	.drvtype_in_mux = false,
 };
 
-static const char *cdev1_parents[] = {
+static const char * const cdev1_parents[] = {
 	"dev1_osc_div", "pll_a_out0", "pll_m_out1", "audio",
 };
 
-static const char *cdev2_parents[] = {
+static const char * const cdev2_parents[] = {
 	"dev2_osc_div", "hclk", "pclk", "pll_p_out4",
 };
 
+static const char * const csus_parents[] = {
+	"pll_c_out1", "pll_p_out2", "pll_p_out3", "vi_sensor",
+};
+
 static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 {
 	struct tegra_pmx *pmx = platform_get_drvdata(pdev);
@@ -2239,6 +2243,9 @@ static void tegra20_pinctrl_register_clock_muxes(struct platform_device *pdev)
 
 	clk_register_mux(NULL, "cdev2_mux", cdev2_parents, 4, 0,
 			 pmx->regs[1] + 0x8, 4, 2, CLK_MUX_READ_ONLY, NULL);
+
+	clk_register_mux(NULL, "csus_mux", csus_parents, 4, 0,
+			 pmx->regs[1] + 0x8, 6, 2, CLK_MUX_READ_ONLY, NULL);
 }
 
 static int tegra20_pinctrl_probe(struct platform_device *pdev)
-- 
2.48.1


