Return-Path: <linux-media+bounces-40267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1522B2C339
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ABDC1885C46
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A480F345747;
	Tue, 19 Aug 2025 12:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LC5ulOTf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818DA343D89;
	Tue, 19 Aug 2025 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605823; cv=none; b=eLCeU0bVnHFStZPHHJU7IFbK1MMnZpQHh8ehMYITVPAarMRjaMnpg8bmz1fhZC4pesLhwDAlpPcc4Igf2NJHjnppBHu+z+XgsOLbvVwv2A6ZEwuKLW0EhAhP4gkaJDIYr94JQbRSj4sHyJHTBK84INcWNLLkWiuVFp+35+c+dPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605823; c=relaxed/simple;
	bh=awI4rQeiGqwOySE7Nuham5GhR2ALw2iQDjgmBhFD8lI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YCYLhA87vCQA0C2aEMo2UA64nut7kfNYtuq8sJb2JE7+7soqRmdlWZ+XuFKbtopps6Myqmsfhh5Rs3q2b1S34tDYx8sXzS5AVNR5xlD7PxcaSVCTJJXJza45X/gM6aUyKZsAmokLED+BkZOWEhqwF5blCY1y9UFE40vkPMPWt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LC5ulOTf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb6856dfbso873393866b.1;
        Tue, 19 Aug 2025 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605820; x=1756210620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
        b=LC5ulOTfZUr93XTBJLz8t8p/0glLZG9WxVck5SoOdClvC1lSXiY7s4gra4lhZBrDlS
         F8mBdNFaeX6Q6oDMWHLqOBJXpTr5N5oDa5xzg6HUnYBF9f7ATgSNEalHLzgdVGfokPC6
         /4/ASGNiYgeHNkEZuU/YPnjNPfq/EEmeTrt8SN/UGXxoNnxg4k8W3Q4BsnE2SrNy5Jr3
         Vx9adTvXG1ZP0hcMSfg5sghqPNxP/LJX0ATKonHMMbsn5SAatWkcTzNB/IZwgxK2D3X8
         cEh3KzQjUnqXkF51A4Bn/DxePajQAeT9eerlJpoRxmgnliFBIId6B79KGESKBLv5x5qM
         z3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605820; x=1756210620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Tsn7/PVaqosvLaCs7iLw7AqoWFV1xRnJguVR9ccfWw=;
        b=pX07e59Ou572RKM4xlW19Ad6pUjdWIRKhpiQxr6zfYEegHLhZ+znVGpwLlq/5M+VM4
         GrlHbQ1TXMBvIpLiiblPGAzBf0fFQV/gqQ3cxQe4VzKEpgzsDm2fZm/ZmyEACY7qoPA0
         7FQ6iBhFapltALQKX3Em2jyPcLEmP5NZR3RonvCXkI9Yp2rOzE+N0wF39qPqzJMfwzNh
         oTMimHbacdmfh6BgbfPKAfZh0mN6fkRveUQzIYmjc2dpdq1x+aTjPGiQZBqbtkdSDLa6
         stj6i7ZJ95BQxSb9shnRqk8AeagkzdOKMyB9/yVELEPN/K//ri0tH2fEhJhyOPqJZ0S6
         zZeA==
X-Forwarded-Encrypted: i=1; AJvYcCVy4Qbe/8iojYqOPHWgaFAM8m8T+4wDRUCLv+ZlgDZQiak1C14mtyioBKX9/l2uV31yHXx84wy/F2rQlQPh@vger.kernel.org, AJvYcCW17uslN/HesyJIuY8LW5pY9gGFK5ynHtXzgqcsVKZpkX9rFU2giE/bAI7PPmh/CUD+ibv9aR4LFcOn@vger.kernel.org, AJvYcCX/IIfT2g1ZfbmFCY+kKtsrYdF4GKD2zxJOX7vA/Ehp0pnNWeovm+gDLElhUISD3jfSoqPa3IXO0ujPKlU=@vger.kernel.org, AJvYcCXT1narFoXMe/JJ7w6ePif4V1Hk9CRPp4GPlT6wSyGeHbZ4fk0iOQfYRaDk+L5YPDf5LwdMoxgJftwM@vger.kernel.org
X-Gm-Message-State: AOJu0YzzrdmVHjM1pQ1rMY+qRxHGplxeasuHchNKrE2zSGdi2BFKqCyN
	KRTntuX+h2rtf8eeJGBzv3qqC3MAKsMm4Wdtvus5eJ5JmuhnMVrAuBn9
X-Gm-Gg: ASbGnctGuPHUG/RrA3vHIs6XVoTvP/m/e8TdiA2zylpoWJU/69tWMaYPurQM9SpkuPU
	2FtBNj37il9f97fcNX3vJaW1K48Yo9e3JaqM541V6r/aSqGtBiLhryRFcuOT5hk3nBxC+3r9IgP
	aKTSAselv0yjUuC/IERpp7z2TaqY823n+xVd6O78b3lDRiAgg7hStXU2ozxzd89Oyyokxn6CITe
	THSKApi+9iN4zzkLRZ3GO+l9rRW3DCVEIJvhAMp8oK56evUjfWY3K0rEqp54GjhdMo13PRHVf08
	Kg6ER5t08h56j4aEu8arICKJc/tK9Q3QHX5SXqWOoavrir7hxRN3L+lzo050YIfDQ5v6U90Y4/B
	7LblD74B7llgNZw==
X-Google-Smtp-Source: AGHT+IFR03wUf/s5dpcY5Njkk1gUJvemYOHmy3eI5N7Qv20olVtXIdCUE2WYMpm0yBZGx4Vnde7sxQ==
X-Received: by 2002:a17:907:268b:b0:ae3:5185:5416 with SMTP id a640c23a62f3a-afddf091d30mr244037666b.13.1755605819462;
        Tue, 19 Aug 2025 05:16:59 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:58 -0700 (PDT)
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
Subject: [PATCH v1 10/19] staging: media: tegra-video: tegra20: set correct maximum width and height
Date: Tue, 19 Aug 2025 15:16:22 +0300
Message-ID: <20250819121631.84280-11-clamor95@gmail.com>
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

Maximum width and height for Tegra20 and Tegra30 is determined by
respective register field, rounded down to factor of 2, which is 8191U
rounded down to 8190U.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..3e2d746638b6 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -23,11 +23,10 @@
 
 #define TEGRA_VI_SYNCPT_WAIT_TIMEOUT			msecs_to_jiffies(200)
 
-/* This are just good-sense numbers. The actual min/max is not documented. */
 #define TEGRA20_MIN_WIDTH	32U
+#define TEGRA20_MAX_WIDTH	8190U
 #define TEGRA20_MIN_HEIGHT	32U
-#define TEGRA20_MAX_WIDTH	2048U
-#define TEGRA20_MAX_HEIGHT	2048U
+#define TEGRA20_MAX_HEIGHT	8190U
 
 /* --------------------------------------------------------------------------
  * Registers
-- 
2.48.1


