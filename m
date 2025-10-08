Return-Path: <linux-media+bounces-43926-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 815D8BC3A82
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 09:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A673AC620
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 07:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3882FB99B;
	Wed,  8 Oct 2025 07:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgtUMGtJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A302FABE7
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 07:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908709; cv=none; b=MgNu/fXgglivkEXqg6uqKk0rIOGfWCsV4l4FoioUWwfxXo/WIB/3dxPIQ4hHRNavYIsOHhgb8y0VGZkrLKJU55sngYkXP37BPt5X4LqNz5pt/CT9e+VqQDXODzIIWSCU45++No9I4F7znsw4JhvHEspZ1cmy92i7Dex7KOZ14H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908709; c=relaxed/simple;
	bh=vH0xJgN2W2szoe//wNhYvtT1BAPozP86dafTWttSucw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lgwn8WbpYvUmg1AA9KqPSvYUhZ7ibXL1YnmVdWUD6Kd7edmG/OjsYdngix2n+O1JT4ePJBYHQ2e5/0luMrAPNIxmOz/bUnKbqYFseKL6X4CpOBKgJDRN/K50GbTdBmAMJJ+ngV4e50+X9gRcWS/BTMEX4XseLEDEGAE5R5ucSK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgtUMGtJ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59052926cf9so3163499e87.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908704; x=1760513504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=UgtUMGtJ9B+N2O21Y+jSRt+4OgEV8GiFvrxDyzmZEuw6exygeDYLw5T3LyQw7gVpHf
         Q2MROoD51mYc1G0B68OaIOiA6D7ZQg29QcjrYNmvyOC7H91Xzvty21xo9j4uCTZ8Dj56
         fLMLU+jbyv2lF2+peTG/WrMVHu0of1445VynhOocEtMg92hnVLHLB5FdiJ8KQvj5vUDJ
         jtPo5ecGjORLxGDrE3sLG1R6C0VGpaxPZ9sqVHVXdK0ccnAy9tBScmss6rmDvVYl+JPA
         UZtm6CqB9up8ndiDNe/2a0+64XQ2D3apB6DHFyE5tRcIAV+/8gYopKCaiPCdUhAiw5/P
         Hbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908704; x=1760513504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqyge5iPysoNexKPCog6vdhewd7fraGc+GRNda+uus=;
        b=J2kI/CFXtKlqEB654n+SbROjSyFdsfAWP74sa6kHh9SXEgg2ZeZBd71Ly9RZoqmYF4
         27fQ6Hqmi5gCYA+6R1Kt9iVuQIKC7MAgbBjmx/ApSBYTuljGfAR0uvAh5seOCCELlzQ9
         0GELGoKSV7N0hKfVBgzjp9OkiWexvaUl5n+z30/BsHuQ2CZeOnUZzst6BEZhfiRTbiiK
         xnmUGOwWrS7k7hg/AZIGxJ5YWfv/RCd1CQ3CPA1Y20hd2HU1a+oiMrAJzWe2XMRyvp/V
         70GxeQXwgZjOguOmyTBo4At65LQ9TVKj69wX1/Ta1CtJlXTHNwxEEv5GyuqkhtYy1CTg
         Gqqw==
X-Forwarded-Encrypted: i=1; AJvYcCV8Kmd8vn4LHbbySa0vQYtANOqj4YtgYhhVhL7AjdLU5knf5yG6QN/Yje0m1Yk0F8S1edes4baAdOj8AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFsP3hIAJTFheqQB8Vle/w5MNjJ4NXFnhz1VUGsQfQEKBGVtzz
	FTAqs7sGzhYUa/2otUe3+kiIW1OmpeXHLbtd1eu4kgXb5RgPJmybB8QC
X-Gm-Gg: ASbGncsh5TIaW041OO86rZ2i7jmXz0/cTSmHFbJ9HJXk/PWhzxhxrpjnllxp0ZvPeSZ
	+12UMyfmUk87ast7CWBqvRJiBWxl6WxKioeVWC0Ugl03tENsTRaFbIwdlZaFDkeDZZozTPM0vPy
	nE4Mv0XNHS3vzQvBzYFAZbsMlzyYe1PyWhdoLB6ALusRZrQXz9/2pLLFWFPy9mdIdllNSmuQPhE
	BoXVrXVPDv6B5OQofpHunAz6H1wPclQDioAWzsHMwVyECqP89henqQCslr2yiOzwAKpnx2pGJoj
	3G1LnzNdb/9NuOhZfvG0RLror27TM5jKizwIp10tg2aa1OyASxVtBvWVawI+p3LxHVeRUQUyZ/w
	YC4kxBXGw4VKOOgfQcMHPTgf3S6eWF5Y0hAnnPw==
X-Google-Smtp-Source: AGHT+IHW/s8/FSLeLjY2E3RMDJLZGpJL6irCGCDXRSSnmLe1/pIzWAPaX9pmCT2OHt3ka3/mSzeg5w==
X-Received: by 2002:a05:6512:2399:b0:567:68ad:428e with SMTP id 2adb3069b0e04-5906d888441mr673178e87.0.1759908703855;
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:43 -0700 (PDT)
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
Subject: [PATCH v4 18/24] staging: media: tegra-video: tegra20: set VI HW revision
Date: Wed,  8 Oct 2025 10:30:40 +0300
Message-ID: <20251008073046.23231-19-clamor95@gmail.com>
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

According to TRM Tegra20, Tegra30 and Tegra114 have VI revision 1,
Tegra124 has revision 2 and Tegra210 has revision 3. Set correct revision
in tegra20_vi_soc like tegra210 does.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index ffaaa2bb8269..93105ed57ca7 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -596,6 +596,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


