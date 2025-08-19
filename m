Return-Path: <linux-media+bounces-40270-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 990A0B2C351
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B96541BA489D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071CF33CE94;
	Tue, 19 Aug 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5r4WLdK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1433CE99;
	Tue, 19 Aug 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605828; cv=none; b=gVrBPRRppP2TyFNkpGRiPTMAIHn3S8yI8W7jAvj6y0L4egJQfJ1Mv+Aa9RWNvxxhhfYbzJuWCuoGgk/PcMN9aNPCJwDV/sYLA0eTRX5G1HoKSuy8xEFVN7g7HnF1zBtKFegUqeyvxLBtVpq1fStAReGjmpaALSccY/oxRyDssi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605828; c=relaxed/simple;
	bh=ft/dLkIS/1WUaPOdmoRieYoqNnk73c+JMHBuBcnRkAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWIvg6nftOg5I92D+JKChIjRshJEnQaK4MWF0ypdjnWsjl/VZ3t0+cu0+HMNTFl41FzEzdb5Uq6sDFlXfLwhTdWIiL+PCGDjKbT2mjMcTarDQhBLim3v60raeMxVLzuAcVkVp56s3gyxRmY2KBV1qSE0ak2NuWF/2hY41uNy6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5r4WLdK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb78c77ebso843774966b.1;
        Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605825; x=1756210625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
        b=W5r4WLdKcPyJ/Em8ceO5a1DC0AwKB5SZ0wd7riKd21PPwKAgQPHMZSGjiBnfDkdaHY
         vQvzuzJYQrhto45Wh8tNGVLIo4Gn9OioRIZ/5+D6nlKaTbnlsITzMaAQ/4SFZwrQUnel
         qcZDATZA02Z5HCvySTCWsmg15yna/NEFYqky8W6ybPIoY66L0Pvftzh+RdkgKBHSC+kY
         Ki78QI3YQgNaRfpx/JndMyK4Htl5EkvXyf7fPUrb9lfO9aBTSQQyOUP+vY86v4rgHTtc
         qYDIUsn8fVAqGhSns4IIKV4R03OxKr9gMnpfukMn1aKpb1x0c2B3kqGYR9ESoKBdl8kC
         +dwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605825; x=1756210625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
        b=c+9yD3bcMONPqDZMYmUUdul6if+gN90WYAleiguxaVjqyR0Qoka7tAwRFOxJIYrDdO
         bMQmQQvg3KTVwP7Z81by6rHOOMTCLrljBlOqEGp7lDZUqhRVe1zJgqwSeYe6W0BG5oBU
         Sz9H7rf1AVtYCW04mpdzONpnVE5YrO27JI6HQBfcp9abIleJJWIrMQrRpmj+Ew+nQwWJ
         HouOaFWGUewVJAwObGQhZeJbd3hM8pQhBY6xLqywyRhO14vUkymB4QUe9+M9D4l+AWle
         SooA+0gu3O5eUIhC+2OdW1/CNtpgRp5oBKzqDoCUY09NzOJe/otRg2KLEp9LAG7m3msc
         8nTw==
X-Forwarded-Encrypted: i=1; AJvYcCU+tZX3x9H/HNg7gN5JdrTo/u8OR/z4yQLXp93JG+K5+ySCAgCBd1h/upxIKLF+HU28huAUsCzaZtCaP82E@vger.kernel.org, AJvYcCUmaUD2i98buellC5q3O3Uoe1+wy+bIREGSsMc2fv0IUZXwPp0dm+/5Dz8eWj8xLu+mgaylo+8PhZv5@vger.kernel.org, AJvYcCVFragBH9druhniQjITBNLvZyjRmQN1XSdC3p/G7aAaiVqOGKyMurEXPxewNMyNYUawaj32RhZKtfIB@vger.kernel.org, AJvYcCVdNeAasfVHu5tQXFXmM312rHtz/ptcmX/AYsBx8rjk18k6YQKDMPLv6zda0O3S4nINKPvUPfMP1IupXBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmfe0AGOYmnoxCMZV3PDrA6v8xL5rTJM9nGdjsYgodefnJBQhd
	JEFdUuHuzpHNugnx01SN/NBJe1uq2WtLFN/ETwpSsW7NcES05qUDn3jQ0MxcMQ==
X-Gm-Gg: ASbGncvDsvYn6MMc/SbwIjXIMAIz2qRsTRbyaI63rn/LLqIfAoa7pyqVpif8IEEEgb5
	JfcIXj9fR8tg2TjL+LLRSkphB/+qlfRwmpTObsyLthn6VEjRDK6tonaTgwie3LwwvorGTgGEcLH
	ikTp0PHVURXYf3J/QnWIp/tThNnd5woXCT6fROB42ilP/t+CDGBZO8sGeAeQSzGkUbh50xfcsQ8
	CeHb1JPkllDCnZaljR0XjX6Finarq3w9+WRqDDAyUlbU+BP0Y6JpLv8N0zcLEly4OpJpDNTqsq5
	c3VmQO24V2ReZIasIywSrHb19iblk8XLB7lsUXd0E+sJslAvyhTQg8Vk10Uios10Mm4N3WtrYNp
	hydcDKMhaO7uMEg==
X-Google-Smtp-Source: AGHT+IEVo/Sm60jtHnDPZrIJ1ilYsVW3g5Tb0BNqa7Jgnw9wyoMrN/mFE25imQZIxkI+sm+CModZVQ==
X-Received: by 2002:a17:907:97ca:b0:af9:5a60:3319 with SMTP id a640c23a62f3a-afddcb8f929mr222020966b.19.1755605824830;
        Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
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
Subject: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW revision
Date: Tue, 19 Aug 2025 15:16:25 +0300
Message-ID: <20250819121631.84280-14-clamor95@gmail.com>
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

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 735611c3c47d..71dcb982c97b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -587,6 +587,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1


