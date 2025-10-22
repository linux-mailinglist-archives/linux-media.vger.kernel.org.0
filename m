Return-Path: <linux-media+bounces-45256-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD647BFC804
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 16:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2462219C0FC1
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 14:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5907E35029D;
	Wed, 22 Oct 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2hL1pfD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5805E34EEF7
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142912; cv=none; b=bzfgMYsAXFXnNjmhW8HUEAlHX+WkQ1JvZSftbwDreaiCSuCMFoXlo6IoKJXIuAtB9GWe7f1ILzE0CsZp3EHHToGUXLKyAsgDc+Sue8bEGh1eLOQQCZfCSDDmb9GA9ZV8Tf5PGYJyrP2V5YhqHminG6ygAR0ChZCXHLgq4bnKJfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142912; c=relaxed/simple;
	bh=r7b9miz+zGlUHxIqeITYi2Gi+cySbUCD1AnY1/8Oj/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKbuztci5ALcUsjwGiBhoGW0CtR39oDCTlUl6dwkLW/efPlaQ2GFiFxyOdeRhaRQ5/RksADaPoXvAJXrm5lDxC7qdWa/oH+VrGI4764jkZVaESWpShMxCRj4f3+xvYCeV5otoqKTg5q/vmvtVfqw/QbHOp6LSPucLudYLXr0sKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2hL1pfD; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6338670f8f.2
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142907; x=1761747707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=c2hL1pfDXaQ7BMjEDgI+CWfh1L/rZ+C1/hq8BbB/F5WSf1qIKQoA77SV7hC+sVTuQl
         IJSZCBqQbU8EmkcXQPdAcZFloz0X2sSKAxrkpiDdY360s/7SfKGywmNkZhVI/zYii9SQ
         BV/DfoaXlrOtZS1R9LadVGp8hjA1eDj+BZqzmoixM/zFS3Ir9fow8gvQmZKvB77s9Cja
         82D5L9fwEo7c7Law/gDpzKzx+EgUtNbjlqHR896YMWjsvYWx/o5nvUNGDP0GSgl8+ZE8
         31xNtKXkJX2O4X3epyG63+VG+UHAmkKSRNhS9ttio+e3d1c70PRYCzDJk0GnHWlTVFun
         +eCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142907; x=1761747707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXtaPkh3GXutadYrt9/amMN99qvUxpYxHtsBwRH0BwI=;
        b=bQuXYkMeR/f8Ndm78H3ZEThgW4feMp2EpBjDcA/fIi6W8UW/Hj1rGOywmNzwfFi1Lb
         PPUpQjsRyYfFNRriJGZ8kSWiqGA1u8PU+YV0/02rB+honf0QgTJjDs/dUIPD+Qynv70E
         uIXtIyE7h0ob6UHPXxOXTMcfgc3MWG3ZxWavDXgDKc6VdgSMnIJrWnCRDzmvTQzULzuh
         GrPuZiF7Bq8ez+O6vTmRYn+DsMEYxw0q5hlnA8c6B8EN/RZmgKVCCZYHrmX3LBZU3GAp
         /PjefZ0PoI8bDVXWYFSk1tqJY+uOAU7/ADdJ4/JSvO5lBHuBLNqskZFaVR8Wpp/W05MK
         Ct4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJSzplWVyldEjDC6Bm/epk+McTXULQRsMX4lzNMwgPebkV9GAt4s7AlGq0iR/y71OfynFSmTfrRB+50A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb7WSHeiUWsJgJuah1KzO0CbhHZ57vfI8IEO/MJru5KW+jjx55
	XiBpntiQC6e5cxFdOlu/FqZEwy5xzR2Mr8VlOXsNqdm5X5ffQ1h65ZAG
X-Gm-Gg: ASbGncuzuhqPxHHX6FZnN+gOR7l+54okwQFcUiofc8dlfbMYaB2cVkhXDHCAfXiOg0e
	s4G3izdfqCQljEJAzVPMCJWsdVAtfKPNAsiEMiO7yc/J76VoHR0p0oSrA2+kk8C/BD03Li1Mdwu
	M6sAR61U4JMVcD3o6UkthsMy08hBDRM+WOxyQGmGjYc6O6xxW4KW8syaeDS31xFE7EC80Mtpg2S
	pDRK3kA1e+FBYPz6Q0v0wTChR09TXp4F8Nk4XqmNPlKmWamUvAHCiwuLQNaQmeUDoA96SV9Q+rt
	L7kvc7rsf7Xzs9DU9imPgofaXwPkN5E5PIzqhnQHnU9oqdCbCRQEf8GyVVgkO7mn1eHsnDnzB5i
	SrXadKVhZVOHKuw9/RLeP7TUpEWtHHo1h6MQ18GnIm+2J7/NbNKWEhbiwat/4vsRpF9E=
X-Google-Smtp-Source: AGHT+IFuKTY+6VlzlctM2Ho4Y6ooXPbr1OkVqVQk/ddAnkBtDFDjaUEYC7CuSZMpeeIzVLphs/KiOA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3f7c:bcf8 with SMTP id ffacd0b85a97d-4283f7cbeefmr11118870f8f.29.1761142906649;
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:46 -0700 (PDT)
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
Subject: [PATCH v5 13/23] arm64: tegra: move avdd-dsi-csi-supply into CSI node
Date: Wed, 22 Oct 2025 17:20:41 +0300
Message-ID: <20251022142051.70400-14-clamor95@gmail.com>
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

avdd-dsi-csi-supply belongs in CSI node, not VI.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     | 4 ++--
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 584461f3a619..4a64fe510f03 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -20,10 +20,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_dsi_csi>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_dsi_csi>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index ec0e84cb83ef..f1d2606d9808 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -64,10 +64,10 @@ dpaux@54040000 {
 		vi@54080000 {
 			status = "okay";
 
-			avdd-dsi-csi-supply = <&vdd_sys_1v2>;
-
 			csi@838 {
 				status = "okay";
+
+				avdd-dsi-csi-supply = <&vdd_sys_1v2>;
 			};
 		};
 
-- 
2.48.1


