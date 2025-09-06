Return-Path: <linux-media+bounces-41898-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B666B46F94
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 15:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01EA2172838
	for <lists+linux-media@lfdr.de>; Sat,  6 Sep 2025 13:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7A12EDD75;
	Sat,  6 Sep 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6CaLwh6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4972FE049;
	Sat,  6 Sep 2025 13:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166864; cv=none; b=FL/UFjLK68gHkzVwGUC6Fqhpw8Q79KeDrGnl4YqMFrXPoAyn69oz8jEXTX2Eyp/7/8ZCl4mE3+jb4SLQZ98TuC79cabB7J/IlxD+T8AbaZueT3l/ugJaIvElNH4y2z5L3ALZEOlmna0zf0pCS0gOkZa1a1cJJnLJmKcDmdyY96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166864; c=relaxed/simple;
	bh=Q8eCWQA4kRYAiOY5WTAmChp+rUv8YWAs1rQB5H19Lbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O7cJVjkQgh1FC+uQ/4NcTjPRasrJfSnHqMd4V8qdnGPC52okB8xqH0r+tfsCZA2O1zUbw8rLdQfe+ET22WclPjvRnwzkulxc3KmMlrUGzRSGKO+Hte3sf2dEepbKcu1Y4HS1VnX1PgcJGDgPFhLblJRgMJKDPh+CoTJV5TisP7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6CaLwh6; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7039aa1eso3417730e87.1;
        Sat, 06 Sep 2025 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166861; x=1757771661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
        b=C6CaLwh6vjhD35XOIebrwmCCivAhy9wfemqj9sIE3voALPV1zIAFmjiK+5bIBrp8oQ
         OYnwzSdX4ua5T2RjYRMqdCpqbBl1TvTrkEPyLkjzLCa9dCx3BOkhIH7/a+Pcui1dzwvK
         EP8Y70AtvX5g8qECZNJRRQPjs/T1WJMjgbIu/RYgew8zo3STrP99qJv+xv6qXiDIFtof
         6hbHl2MCOK7OMZxkfvrvv7mg2/IZJyM9SVI+zLUsnm9Ey4/Cepe5huq6YyIXsRdi3BXK
         J+uoE7J9eiSwgbhULosJb5s37y14jOAp4lnM7dCrt1WLJXAhCLZhAccxrNKVTn/d4MjU
         gvxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166861; x=1757771661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IxAZoNFqRXhhMhpvmVHUSqaQIDxBjYcwMBDTUotPdE=;
        b=VzjOiDFU0oz23h/Uph+B7UnancKZjN3OESWsl4x1pZMrSeHJEEmAtDOpQXY9NwCriM
         LhT9ISUv/HTUlZbfCHFS+QdITsAFLdg0MBu59Rrg15Q9tNpl1XCE44533u6xzyIbrb4U
         6xa7nop6p/rPyo+qDnFJOMQG9LYlPF++s1Z0TUP66CqJy14lp3gS9PGk2AmvLLWvY7at
         F+P/CxnNrhdTdAUnOrxWBWpoSyzE+AoxaJao3LewH4UcWOvKYNv5QLSQLiKbWjI5sQ8/
         ouKTEt5zW83xS8drOguVbMQw3szsP7pBOTze8DscaSXhpz/HgDp3YI2WbbkWYD2kxyEd
         kaXw==
X-Forwarded-Encrypted: i=1; AJvYcCUYV97lN6IcUSiK3+Ks1VD29dE5YZJAB3iIIteir4fdpUB+6QQzLqEdnyDqL2tHiv5vWOc4TT18gmZyZ1FU@vger.kernel.org, AJvYcCUgWywvabS1d8RBsCjTanrTS2j7M2BkW4gojuw19M2B8AsAkvadXwr1VyZwWlE9QPxSINmzSLdRjx9tzhM=@vger.kernel.org, AJvYcCUmBsJ8g1xRWrpD4JY5gBfq/6cCDocgt+HAn4xM6VciD1aMJWS/tYgpv/krq0uvG93EzfA7OoVPflk2@vger.kernel.org, AJvYcCV+/4KHWO4USKAWHt8g/YFPA/MnetPo+LejWyM3sE6YPNcV7m7zMH3gmelfop4F2c9F1JEUxG4IM6wArbA=@vger.kernel.org, AJvYcCXubg0nAmE/PRRun4rV5ed2/VXh6e2ItaT/9p9tuH1tGSDiEbNlHwpaIgsZUzOx/Em6kHb1K3prvfQc@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxYuV++tVtEigYwJiiz0sikZR5EzGFix0FSsW3Jg8CwfpXDz2
	Tyao/SmIl9R5Xwb16l8QDQ4U9OyutkCn4xH/DHwWUMWmUojz/mVUEFB3
X-Gm-Gg: ASbGnctmXQhojWHUzHinUGbdqjIEUNYDcKhxPg1KL0N9U7BpKC0y0KiPyIyASXlGlMa
	x9IzlcM2Hw3urX7ywhClcRPn3OH5Y+0RD+utf8PMMhaJc8qBxhEVPwHzMXxMEbzXUkJQ/8iW5Ks
	YyAkvH7kXGf2Tfz6WWH4DUBkkIwJBqD/7fG9tXYGIlQE/PiDpjl3cLbfoKhJAXR9vIJ1OZoCQt/
	TAPYKM9HT5fOv8XGRt//cNTXdSJg+8bRh+AZSD1IgDKzXFA0WU620KJDe2Nuj3pEOumHQoVFx6X
	5qMiPbGEL8VJhpjzQw8j3tT4A09wr1Mx2BGYAkWCd+sZmwncxUdaS9IPwgNl7gsHG7sHOKrH4gq
	5dLrjhSNy2eElYg==
X-Google-Smtp-Source: AGHT+IHrlNGovAefOUdofD05VkXnyiP4PSuVmL1cFj3ZUmCUQ6U8TDmFSCBGRpnbBAUWYquvhaaN4g==
X-Received: by 2002:a05:6512:39c3:b0:55f:6a5e:36a6 with SMTP id 2adb3069b0e04-5625ffc7e17mr829513e87.17.1757166860926;
        Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:20 -0700 (PDT)
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
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 12/23] dt-bindings: display: tegra: move avdd-dsi-csi-supply from VI to CSI
Date: Sat,  6 Sep 2025 16:53:33 +0300
Message-ID: <20250906135345.241229-13-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with VI,
like same supply is used with DSI and has nothing to do with DC. Move it
to correct place.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
 .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
index dd67d4162884..bb138277d5e8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
@@ -75,9 +75,6 @@ properties:
   ranges:
     maxItems: 1
 
-  avdd-dsi-csi-supply:
-    description: DSI/CSI power supply. Must supply 1.2 V.
-
   vip:
     $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
 
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
index fa07a40d1004..37f6129c9c92 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml
@@ -37,6 +37,9 @@ properties:
       - const: cile
       - const: csi_tpg
 
+  avdd-dsi-csi-supply:
+    description: DSI/CSI power supply. Must supply 1.2 V.
+
   power-domains:
     maxItems: 1
 
-- 
2.48.1


