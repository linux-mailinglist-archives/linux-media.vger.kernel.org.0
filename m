Return-Path: <linux-media+bounces-40264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2898B2C33D
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 14:21:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9E7727099
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E073431F6;
	Tue, 19 Aug 2025 12:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8wSnYyH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00864342C9B;
	Tue, 19 Aug 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605817; cv=none; b=nAVaqq87E4ar0SOqYr0TJ3Lz06QHIAfBK3ihTnIrjrPOMGqape414CNJ7PIzRQaYpnmKMVV2JYskNlMJB2ylwQRxK8dmrqi4YvQRny+/CIyvuZgDhZ9963OJdcsFq3FxBRy5ZEOt2oF6O+QVptP9ECG8LJvS1DzYEagW8uTj4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605817; c=relaxed/simple;
	bh=pkf0aRlSU2bh9TSov8FMjnf/h7aem5KbMyfOa0trfco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7dwqY5mROH3QaxVlQ9RaLGpghuT6TcR4SvhURFslezdVcNgW66nvpjPLcpA+UJb6VJ1aGku4rTzltttjzC29jCxkRcGscVD6Cw2k/s/WGut2rYW+P+zTY1Chb/qGC5nca5y0d6LbjnYF9z1kgPoLDGCoOXYjxnFO1cYfDltOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8wSnYyH; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7a0442bso768678766b.2;
        Tue, 19 Aug 2025 05:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605814; x=1756210614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
        b=c8wSnYyHhWhOuJEiSt9R+OMlYuSCgzNW4Dr5y2/ZSiIwa/4EGSHMXAIh7mxOKUAFfP
         kF5BmB8KPwzcZTawvtqkL2iBWF0+gnsIrJ/9vQcdpjPFc4H8ycV2qVBIB0XCuIK724jj
         aeU/secEKAeRaxADVqNifnWXrgURMKiuHrhVKKp8LC14AsoX711dYoJiweQmPniUH0x7
         RPLRA/mvVpWxBm/KBpdR04IK06qt8hxc453cxZJ9d/2g3CBQrY5rF5um6/X4OI3hqJBD
         UZUDjE+mY72HyMwnOgCJQzPWo/NJgCFqgTx/ntMP62Rzz44V1sJ/gWd/HVH6/uqji4fr
         807Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605814; x=1756210614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiixv77psU4RDvOrkp4fJ28vu40GaS8M7efoSdjRzBY=;
        b=ZHcXUfzA2956Ksdf9QAyvFym0ww6Ch/k4ovq+fAmb3CMXWDxZbW/hbN7wK6f0YEzDy
         6gKO+lxJs3rJUTBda2rp5WrVufBIdIkh+Mha/NPq9yXqs1QsMcMSG+RA6bwWbFvY2qLu
         llBTtJKmFw4ddkdrA7fyVDsrucwONbhY96K9augsVuQ+63Hsndi2iJYpznISn1qhJYnE
         mUq9jz0+LA/5FXlg66vBSop1dlmpoFUClzpbUkgkhr5/1wqT63b5SywI/JkLj8GepkWt
         SaVLO0lmRFlshnmKW8HFikL5t5zH/bOuB+KwQ3y4taSE8BgI4WuDPZN6JAgmUgwMtLyh
         8xfg==
X-Forwarded-Encrypted: i=1; AJvYcCUI+dUag7CXA3dPzIMSH48i2rVBgvg3yMHzS47e074TeLgoXAhW4MCrYGGWp0XoQG5GRspNgaSoFuEJS1w=@vger.kernel.org, AJvYcCUVWIgdmuLHmSbXNhgb82r449q5/TH9jFpQVhwJ43TxTjjAuFZ//IwCvx0IsHsrJ+CXx3+KnVK3wZp6@vger.kernel.org, AJvYcCUZiWmAqWKYAVTNZ+Ro0qdzVIMy7ZuPre+VbmPJL1R+Qakpx+2H2Qhw3Nk5gZX450jYMZMFUOGzdiklGgrG@vger.kernel.org, AJvYcCXgesftQp8zckt9V/lmphPQOzFRjyjdpkZM+i6WXfiOso1/FWEVIqqDQcocogbJUjD6GVWbdVDKQGRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbIaE24IsNrtXQwVySZdEvP7r1F4Zljvw+q/QYez/gKikr4WE
	NBizCeiturxeg5OH76aEoQCqlro1iBbvT3I2jVWNPKbRPUvfiXyXYrQs
X-Gm-Gg: ASbGnctphM+ETwELvug3HN1XInHK+LbWDoYp4ht7yn5+llb7VlsxGzG3akHmYz1GRPM
	e6LrFE1EvydSU8rHs4MAh8wRrM2+Uo/UXwjSGl8lqpwG9SM739nIS3dVvJx4WTgZLf7HGfRDBWw
	eTZzz+TaQZzpPxmWvJs1k00zhOWZ+3QgXdi8zWpNKb9r5IJG6kMaIMWlAOnC1pobCM4T1huLWra
	R38vujTo2TXPWv4u/JlAilGKVRmQLoLfgkgmHyeU6GMHmxyYWdkTbohbCGeSo8R+4j4L7SqXwRa
	Kgma3zgXuLWu7l1lx7jW/w3LiljL14WyYxFp0iarHmgVfPE5tVIoHROJbIRMG7dbD5wMK1/oUHY
	hB4/Nlz+CqU7jGA==
X-Google-Smtp-Source: AGHT+IHoW7cmlDSj4FeLC0Y6L5fKUHnHWGAThm5Gw2ojTL8jZq6/7sTeg99ABpe7CZ+VwcMWcDndRA==
X-Received: by 2002:a17:907:3d43:b0:ae3:bd96:78cd with SMTP id a640c23a62f3a-afddc95d9cemr232522666b.7.1755605814133;
        Tue, 19 Aug 2025 05:16:54 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:53 -0700 (PDT)
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
Subject: [PATCH v1 07/19] staging: media: tegra-video: csi: parametrize MIPI calibration device presence
Date: Tue, 19 Aug 2025 15:16:19 +0300
Message-ID: <20250819121631.84280-8-clamor95@gmail.com>
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

Dedicated MIPI calibration block appears only in Tegra114, before Tegra114
all MIPI calibration pads were part of VI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c      | 12 +++++++-----
 drivers/staging/media/tegra-video/csi.h      |  1 +
 drivers/staging/media/tegra-video/tegra210.c |  1 +
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 74c92db1032f..2f9907a20db1 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -485,11 +485,13 @@ static int tegra_csi_channel_alloc(struct tegra_csi *csi,
 	if (IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
 		return 0;
 
-	chan->mipi = tegra_mipi_request(csi->dev, node);
-	if (IS_ERR(chan->mipi)) {
-		ret = PTR_ERR(chan->mipi);
-		chan->mipi = NULL;
-		dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+	if (csi->soc->has_mipi_calibration) {
+		chan->mipi = tegra_mipi_request(csi->dev, node);
+		if (IS_ERR(chan->mipi)) {
+			ret = PTR_ERR(chan->mipi);
+			chan->mipi = NULL;
+			dev_err(csi->dev, "failed to get mipi device: %d\n", ret);
+		}
 	}
 
 	return ret;
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3ed2dbc73ce9..400b913bb1cb 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -128,6 +128,7 @@ struct tegra_csi_soc {
 	unsigned int num_clks;
 	const struct tpg_framerate *tpg_frmrate_table;
 	unsigned int tpg_frmrate_table_size;
+	bool has_mipi_calibration;
 };
 
 /**
diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..305472e94af4 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1218,4 +1218,5 @@ const struct tegra_csi_soc tegra210_csi_soc = {
 	.num_clks = ARRAY_SIZE(tegra210_csi_cil_clks),
 	.tpg_frmrate_table = tegra210_tpg_frmrate_table,
 	.tpg_frmrate_table_size = ARRAY_SIZE(tegra210_tpg_frmrate_table),
+	.has_mipi_calibration = true,
 };
-- 
2.48.1


