Return-Path: <linux-media+bounces-45254-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EB2BFC7FE
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932E21A60374
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517B2350297;
	Wed, 22 Oct 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN2k4WE0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E4343D7C
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142909; cv=none; b=SYDCaGv6mMN+23GAOey3JSCKhYri1NVB3HkqZhf5DP5WMw0DcyQ7w658UQuf09/HIwYJG8FOdEO3UrXtnwrKriII6jsEMk4KtcdprAJzzEGOywCKVZgEPCKQVl0rWIQH6xcrQ59KUlVh9vsJt9e/mFpPmas8tbWkymkyFDZd3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142909; c=relaxed/simple;
	bh=NPYq2prUDw6E4LwASXaQMdEqr6v2oIwItNqZJN/XQxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dkv3x9E1/RUmmulaXVmyZyxKDlXtqzjrp9YpeJEh6d0UmuGY/X3JKkcgjZU4xtP76rY6cxB4RWRYZ1vYbP9Lk+GpHoelYCpbmWBMZpRJKpb4n3F5ThZZUmoerjG9tpGlN+4OyEpleNXiaDQDBDEy2Hsd+RR9HaEsSOaQPIyVX5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN2k4WE0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso6788060f8f.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142901; x=1761747701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=dN2k4WE0ZY529zJSRBJ5ZwORqoW8KLeZSCDG6UUz7GYvoOwhMzgy1KeJ9j7hImNFYF
         6jgoUufnykUb7VrhHxH/ZbMkng2hRNLbLq1WXb94zmPgT7TBt1gYeZypt52aMSWdZn2A
         /nijUnNp08qxO3kNmhbsPtM1rZZ6YtRpStfEJITrlnFL7NeNBPcQxQrX09tmPKQOT2u/
         s+OHrFBQERBAlc/eA1zcXlLEhbwAo13Ju8WQ4DBjWVP6U7cE2wtMvU+GOUVJDwBNR3E7
         KyiRW5CeKo7CM6Ec+rKxfvq20nd6aTr6KFQO/Yy+9nbETsYnbb3kD+PZ/nQYEecAIMQC
         KA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142901; x=1761747701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgdj41tpB2VgIRDJrZCciZQ/xBBL1EcMgPyAyntTnpo=;
        b=fBFUrxXSNmuM/+MBx4AHqztbH4D4w8ttHexcPmZB4PZ64yoZpC0oN7TLFprBN8UQoC
         F5dGbRm8hGqzB7qfkZVVeOFflWbORv60T9nj3twqD+ant2AISyZZaCgqIIY8gLVrN0mF
         jCnX3oqcSGhwwHiqM2JFArV1UE5yQyXXM3A7PO8I90Lm3vroy3j1Xd4B3ftZDDFsiuhp
         21Gs5L+z6v3IBm5/n5rPQnIiQ3AGEjHHu2OtmCHi7SmlefrEvc0eIBKiG20GMSovpTo5
         qgdzS1YzDnziZuX5I4OmXM9J+OS93EIX/a95g3pNQuWDtw2T6wUyHHYol2xfaB3tox4g
         eNAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6usoQ5/JjSTxZI2GNTHV1QV1o7vt/m0eOQWv3MPWZH9iOvMf3QXzbE/3/Kr7j1I+xiXeXnvcYXewvqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZc9qD/6nTZNwRMxmY6YmMPe3baeBACatCWWhNVhLd3bwRZR4f
	JKzuWdamwgsGrKkD0J9MgZA4dIUf+21yYBjdtiUElw+O1F4fnjbkyrqK
X-Gm-Gg: ASbGncsRdungFcUL9l/S4lnpYTy4tJLBn7/hs1NP6F4qpp+//gvqkxXphe/5yUNlJQ8
	KVXKgcmGZPaPjvagKdp8Mj0c3TROZU0o864BjO2ixL/Kqe+WuNI4e8Tmbq/ZAHy+5n2R0a1bUZ4
	BtzlR3wLsx3JGsgh5yNHpNbsYM/VdfphYuDF1BZMLESFTIQ/qls/02vyJc9p1iXb34Ws+ELkb7Y
	tKQvK0u3ZYS6Fd9hXJeJZEsF8+lBpUXM5X1mP8UBOjZTb+9HEW2sILXqMdz79cK+vYz9ke8H6f6
	CJd19ZejZu8SEI0In8JRCO5FB+M78EArzolIbFL0GGhAHDwfZaLvsKFzI15Ikj9uOimVkhDEMol
	HLU0JaIFdtK57lpaneU6F8IkvOsfamjWstwJlIp5N0QTS7aKHST46i8/EZENzE7jjCjlPuWefox
	Boaw==
X-Google-Smtp-Source: AGHT+IHM03V7eJFt3Eu6ja1MYetjG461AcLXE4YT5HRjXzs799spnfwnfQrFSdx7t2nEB8DurbecfQ==
X-Received: by 2002:a05:6000:24c6:b0:427:928:787f with SMTP id ffacd0b85a97d-427092879c8mr10794030f8f.21.1761142901362;
        Wed, 22 Oct 2025 07:21:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:40 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
Date: Wed, 22 Oct 2025 17:20:38 +0300
Message-ID: <20251022142051.70400-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document MIPI calibration device found in Tegra132. This compatible
already exists in the Linux kernel, I have just documented it to satisfy
warnings.

Each Tegra SoC generation has unique set of registers which should be
configured. They all differ, hence fallback is not suitable here.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
index 193ddb105283..9a500f52f01d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - nvidia,tegra114-mipi
       - nvidia,tegra124-mipi
+      - nvidia,tegra132-mipi
       - nvidia,tegra210-mipi
       - nvidia,tegra186-mipi
 
-- 
2.48.1


