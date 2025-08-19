Return-Path: <linux-media+bounces-40257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B53B2B2C2F7
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE37684518
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C8C33CE8E;
	Tue, 19 Aug 2025 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qjf0nomx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFB322A3D;
	Tue, 19 Aug 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605805; cv=none; b=dgmK4MhUfsmjxropUljxiHWJtEjamHkzWEHqjlGU3GqLp/8x/tOSKZEdLw1t0Jzh4GJj8SlOLCN3Am4wJtQn5CcUNeRWwUASFUhyTY9rl0AJNvzhrLOtqY//hXQFTSdE5MvHeB82eLq2h75OCHc0cgGbcEXnI2CyaO8ji5GKUn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605805; c=relaxed/simple;
	bh=SJJL1hsjRl5/WRv/ON5a7qMwezRcNYQJsaRc0g+WDXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b3P98A2twj0/tI4VMWmM9r0cBqrbVmrtMku4rDKREpN2y+zBWBcYa+oCDOL6vNmLVvX55XtJ+MjiGecc8NuzJ0kUvYNE/GFBRnFvBIX5BvmiR1pISYBSpav4ZRAR7WKCgcTA3PGpvP1vuIEvQnbAASDWLJdkaJudCBqsTj4wmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qjf0nomx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb72d5409so816249766b.0;
        Tue, 19 Aug 2025 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605802; x=1756210602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
        b=Qjf0nomxNQw7e8EYKfZ4L9ypFjy7qyZuIpKfXr6Ld5Wu7di8xDMXqpq81TOmpZebY+
         izUFJ8dZ7tHLezd6R+9exU/b5v4S0i65IzNrdxKEokIjlcs+yC+sg9cmKKrW+2w3U5rG
         moHvbZLtF0gI8CdNoNG087Pn0jtEM1VeHzxpabONhWh3yxeBX7G4B5ZnjAChFWncwcdC
         eEbYc49RamFxDJA2TXlczAvoq6flndVxQkegS3Y83UhT+I4pz7JHIPuUyyBDnpK2ix3L
         TYZ9iz5llJYcJcrNBgbylFNMal9yonPeSgdAHRXyz05WRmeFfoQSMfCvl789lR9Vvzr4
         aAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605802; x=1756210602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTZBF2cKOGdV37BgNxVIad8RxVSZEEHpIkQVHokH8Wo=;
        b=j/maWSKhUvgVSTkd9mwjsM8W1glQnI16CO2uT1lpR5yb/0scCtjdxNk2Ke8tAvER/d
         B1x4DfC8mqvOGaMDVsf1Vuvn/D4ghrr9InrAZ7MooVSruZ8YCvEAAnwRGMd9hxjxrzZY
         uIxoMzR18ol2mCEwk9e4XaR9w5HLymDaB87ZR6zYlpLxnCm/c9kuDLy/rHsWdDLhX+oD
         cqtjOxVNrcEQ/SUQFmi0phD0Z4JRcPj2kClQ/M/6gI2hSVvc7CZ/c7m5ooUU401TPf1u
         tPhDntRASMJZwJtqszBa/t4P7DNdwLIQq04W+wkpN2Nf/z7/ibU4BEnVM1KX2n+/GMmE
         ScPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0R9h2eGIUANHrXrxsFyXZl9XAMDrnqPxwq7bqXkkk/NotXNOxbG0HSaqRKW5Lnm/2eg/FyTpvq9Um@vger.kernel.org, AJvYcCWOQSIYznIgujUGoPoypccf1tkzd+Feqz6xDKQhDvODpla9tFHWyGKEjRVFoLruyL2V7NGew7tnre1M8G4=@vger.kernel.org, AJvYcCXDMD+fJ/BE8SwNdB/hHxvGrm9ApKZyWE39cKQ6VvKqZ/kOM7A5E4tNRPAorKvXShI4157DNoEvkbZrULX0@vger.kernel.org, AJvYcCXkzVQWR2mo216tbo6vYaFmj5OWyYiNnDLs74FOHeze/Tjayo7ZnOG8CvwQwDUrWjyecxSPFiwI5ABY@vger.kernel.org
X-Gm-Message-State: AOJu0YzQDRE5DQiW2yTMTju0GpzLRZOgMcnQf298j/9et0jK6xEzbiSl
	FacElcwXAPmh+PUF7kfNTHwz21TVXIc96tdAZhZ9DntlcswBacVg/bVF
X-Gm-Gg: ASbGncu4TOFj1ZZTTsuFwXus1HwQGSf60WLglwaGmef7hAE1W2UO9RnbRwvENr7QH73
	9NnkLOW/js7DzQcU05nFRLY4pTXFtJNie7pGZiVli149JPjApZUwUvnESeUrvaRCFD/jbCmDtLR
	DSH+PM07oIYpPz6OmIeb1SzgL5b8cS3lTY1HBGsYp1go0EyvSNuYcJjuhWAh/YO/sKrvD8Fzn0j
	Anht9pFwD58np7nMH+uWcoEIVaVJIxu8IIV3rpQ+U6fA4wZdXqfzIAtomWAd23y+1fOu9I3jL9g
	3IwpIUcGOOFwCnbsluTlQj1dOHzx5H0ZH/qbeJlVOu74urmxmhAG5jUiaobk3W7yHBuQ7Q5ZGdu
	ef1f0fUrWxqGSdw==
X-Google-Smtp-Source: AGHT+IFOn/TJHFwwAXjt/aa4+DjS3IYy277UAXO/A/XxXv0w3obUkySSlcaEnmlY0FxNsalKHy8ajQ==
X-Received: by 2002:a17:907:971d:b0:af9:44fe:dea1 with SMTP id a640c23a62f3a-afddccd40afmr224499366b.23.1755605801830;
        Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:41 -0700 (PDT)
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
Subject: [PATCH v1 00/19] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Tue, 19 Aug 2025 15:16:12 +0300
Message-ID: <20250819121631.84280-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
with a set of changes required for that.

Svyatoslav Ryhel (19):
  clk: tegra: init CSUS clock for Tegra20 and Tegra30
  dt-bindings: clock: tegra20: Add IDs for CSI PAD clocks
  clk: tegra30: add CSI PAD clock gates
  dt-bindings: display: tegra: document Tegra30 VIP
  staging: media: tegra-video: expand VI and VIP support to Tegra30
  staging: media: tegra-video: csi: move CSI helpers to header
  staging: media: tegra-video: csi: parametrize MIPI calibration device
    presence
  staging: media: tegra-video: vi: adjust get_selection op check
  staging: media: tegra-video: vi: add flip controls only if no source
    controls are provided
  staging: media: tegra-video: tegra20: set correct maximum width and
    height
  staging: media: tegra-video: tegra20: add support for second output of
    VI
  staging: media: tegra-video: tegra20: simplify format align
    calculations
  staging: media: tegra-video: tegra20: set VI HW revision
  staging: media: tegra-video: tegra20: increase maximum VI clock
    frequency
  staging: media: tegra-video: tegra20: expand format support with
    RAW8/10 and YUV422 1X16
  staging: media: tegra-video: tegra20: adjust luma buffer stride
  dt-bindings: display: tegra: document Tegra20 and Tegra30 CSI
  ARM: tegra: add CSI binding for Tegra20 and Tegra30
  staging: media: tegra-video: add CSI support for Tegra20 and Tegra30

 .../display/tegra/nvidia,tegra20-vip.yaml     |   1 +
 .../display/tegra/nvidia,tegra210-csi.yaml    |  78 +-
 arch/arm/boot/dts/nvidia/tegra20.dtsi         |  17 +-
 arch/arm/boot/dts/nvidia/tegra30.dtsi         |  19 +-
 drivers/clk/tegra/clk-tegra20.c               |   1 +
 drivers/clk/tegra/clk-tegra30.c               |  16 +-
 drivers/staging/media/tegra-video/Makefile    |   1 +
 drivers/staging/media/tegra-video/csi.c       |  35 +-
 drivers/staging/media/tegra-video/csi.h       |  11 +
 drivers/staging/media/tegra-video/tegra20.c   | 771 +++++++++++++++---
 drivers/staging/media/tegra-video/tegra210.c  |   1 +
 drivers/staging/media/tegra-video/vi.c        |  20 +-
 drivers/staging/media/tegra-video/vi.h        |   4 +-
 drivers/staging/media/tegra-video/video.c     |   6 +
 drivers/staging/media/tegra-video/vip.c       |   5 +-
 include/dt-bindings/clock/tegra30-car.h       |   4 +-
 16 files changed, 842 insertions(+), 148 deletions(-)

-- 
2.48.1


