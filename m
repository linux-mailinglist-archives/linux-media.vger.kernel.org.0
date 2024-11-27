Return-Path: <linux-media+bounces-22183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F7A9DA7F4
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78FC2B248D5
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134631FCD05;
	Wed, 27 Nov 2024 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hyqmfg6m"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCE1FCCF6
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710609; cv=none; b=o+R9jvMbj00HlThZ496dU0tqtWE1hT97HwVAH/3xf9Jkcc0VN7wAsQ5EB91v3Q8fH1o1OVfxkT1W60jtXXIyxhiDH9DiuCH3IlsLwXF+bZH8jY3hS+4hVm6vYw6BPA8PKFMdAS3Qpw+J3vTLRNKlwCW1w7SmXnXmI6TwL/GJDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710609; c=relaxed/simple;
	bh=1HSBdMh6wfN3s6P/Pz367KpBowZKJDapMzkV5wpGJCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmBgZLAnEq+ymHAdu9CL5AW0C8CypQ+VXIV8/Qr7hVoeLkYuCiaTAMonVAlSrINbML+Zwb6yeTKzN/vaJwzt7wg4i51b2m2JJqYS03RZimxIeUY4oxjXP9G+1e7vhw6v5+GW4MGLnx58xDkaFAHgRRrxiKtoi5ExQdwCgjJimSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hyqmfg6m; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53ddb4f8450so535559e87.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710606; x=1733315406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YHGkGvfRWiylmf26eOuJT5PWJDFkDGLf5fy8GDJu8o=;
        b=hyqmfg6mij14rNNI8OeFz0y/F3e6gUogH4XO+v2DYFA/OEUTnUIeEQkdzu1fM2yYd4
         PRhSsNBpIJiSGKR2MoIwwm4InzYnI9YiQTz8gJs4aWrkW6GlTL0iHGpH0uNjQPLb+vjy
         LCilJwSu1b7SvK+kxwW96VM7be10Id0jB4sZ2KIJ+6JjxS4W5R/rgmcrIYZG8g4zA3M6
         gSF/AahUCPZZ6SZU4NqvfZ8rUTn3XsUJcWqog6aRcfGk+GlPpqTbuyBXkPbHUZUjy/CI
         4+KE1U8OtPmZyYBZsAGScyhi4yMm1Qd3hVAvFeM90IjSanqJILfL49VwQkomjMZwjxxy
         YrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710606; x=1733315406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YHGkGvfRWiylmf26eOuJT5PWJDFkDGLf5fy8GDJu8o=;
        b=o2RU8m+VKaI44ViVZ5eLDARUExMPQ6yybdXE7KJI66v3omCqw5Hd7nWp6yZKuSFtSo
         S/LokN6iX0gSoVqASzEo/ZwLeDD4VhIGsg6oLqvY558PgfEZINeOxa/qNPNnXZeTlrUD
         djTh0j6L7xLcMRO1QVZD4AQwK81B72A+Tzxc8anx+bV11v6lWRNK3ijIQ7ABxs25WoAD
         0YkoKGa2OSgwYOd+6leOyVkl2SLepJASaOLapdR2XWAVK9n58K9ogaGo6o2vmxl5tRFj
         Zp1GBTauvVPBNFhKRJfaw+4MckEL8DtqnWczixCxAIlMWL152UnWjaY+nVTn3pgZWWtM
         h2Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVGl2ZI1RVujWvIarpQ3FryYTzaPs9x22XDYpzziSobkM2WA5rsE4RaQ39VJuohX2J8FKdYOshL6rcerg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+tU5BwhYjq4dbUd1iSV8itTNxY94JRgWctgO+SRo09tSkQ75j
	ppVaqwRi5Im55C11ubuF2Ux7gLb3rpaQvJcaUayglH06VtPSutaSA0i8ysXFQ3Q=
X-Gm-Gg: ASbGncvh6vHhu4BEF0qYyguOAi2cCKdr3R/EVQTh/WeE5+NDczefSENg2lkNC/jxjM/
	jaq0F0JzZi6vZWuAcpCsK5GGVurozcnSqbU1n4e64A9064tKeAhio5XjnIxh6ngY2Pbe/Ul+CHK
	6bFH1ZhlONaN9cojbPboW8+MTzvOPIIBNL09uSNj4htBAWQC6K0vKdaAVQpIkZwmDRBrbf+xj/a
	14esbhmrQXbiD5dfSHW07fpJcRMCS2b7MM4Qux0aQmyh9VJd6XXCK7cfwhMn+INYjfM2H/kSz4Y
	H2syk0yiZk+6wzHTKTd5XiZ1wh8SBSp5iYmCq6Q=
X-Google-Smtp-Source: AGHT+IE6l2CbwDIyizpqAEKumrX5YByiMnhEAc9ERpp6FYYrorQ32FMnc66slHzbN+Jy6uQeksIX6w==
X-Received: by 2002:a05:6512:3e22:b0:53d:e4d2:bb8 with SMTP id 2adb3069b0e04-53df00d945dmr287070e87.7.1732710605774;
        Wed, 27 Nov 2024 04:30:05 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:30:04 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
Date: Wed, 27 Nov 2024 14:29:49 +0200
Message-ID: <20241127122950.885982-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
References: <20241127122950.885982-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm IP catalog says that all CAMSS interrupts is edge rising,
fix it in the CAMSS device tree node for sdm845 SoC.

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 1ed794638a7c..cb9fae39334c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4326,16 +4326,16 @@ camss: camss@acb3000 {
 				"vfe1",
 				"vfe_lite";
 
-			interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "csid0",
 				"csid1",
 				"csid2",
-- 
2.45.2


