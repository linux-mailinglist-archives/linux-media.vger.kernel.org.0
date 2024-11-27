Return-Path: <linux-media+bounces-22179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 844369DA7C7
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 13:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 451AE281D1C
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 12:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3E71FC0E2;
	Wed, 27 Nov 2024 12:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OtVcdNAl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19441FC0F4
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732710600; cv=none; b=BASLy7XflJoe78QOBhr7XvxWUJ9vrXzfEHB8Xx3ju7uHlnB3ftSTKGz1ynxOKtpvxlIJWgRFS6ARGihIQ5oVnuI4LazrxULaSZes2UBbLPDOjzUuaaL425wIqObiljCq8GK2Zu5VVBJkw25oC4MVwlz1TxiDl7aUW/YivGQuGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732710600; c=relaxed/simple;
	bh=+fCGWoWcyECsM0wl/aP6Tkn6U+mnrA9RFPJcZbVhHBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikRVXF5ZgARiLFAYdZLtYMmwx281cbLAy9T9pofKnJC8pD2ihP8wE43T6Q29SM8qh9gnzF1z+xaT5sNW02RWzLXIJQMSE/5c3+Ms+A9xgQEbesdUI/4FnDoKxbAxJeUcPZ2yMGQ2RatxdFMVo5y5FV+Ww2danfkvTdUsPPg/bFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OtVcdNAl; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53dd58a4433so765424e87.2
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732710597; x=1733315397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS0OrWqJSfJEkGDrw/31SedEoahtP5GJMRhfGX6petE=;
        b=OtVcdNAlsA3pabJHKT3MGSgXVBozCYyreTIdTuP9C4y0Ojvmp3B8R1pZeDaHcx4WC3
         qbkiCJ62vhidcwXTQvKIi/YN/63HiAjmlcFS4n+EC3HmeYIHQWRV94YkUGGs5CpxJ15Q
         Cxaxcp06sWjtE6T1yleeriOOtAge//cxrDfefw/juJo1WIuKpa0zpH/dRuyBc9ygLyHt
         PWMbF1/QZTOP4RGKcqRKLgYedBQtX2EbHexHuQCsLGPgI2jgmYBT/Ocs79wNbSlAAjI/
         4Q3fk26cK0oIkcvA/vY4WYU5eucXHa25MzT7TGy66Kc8kTtTDDoo1i1q/XQTt5hcKvZK
         JW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732710597; x=1733315397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MS0OrWqJSfJEkGDrw/31SedEoahtP5GJMRhfGX6petE=;
        b=HrW9A4UpQBsBb+c+Kv59HMYn+sgvL7xsTZN6kHw+MpnptIQtGKY1v/3OOYwdKiwpUY
         YThSIbI4dtYXV4PsYTOaChSczUhh8Z3Gy58M6ZWSdwFDuAIU2jyjo2OcWw0Hbnikhac7
         YKuEt5LXkpTBDmLVG++KElxvWhykX4YffnAFLMKJstJvcucA4ROYt0o1WI4v8ka0khrD
         S/kwcOJVQZw+futouwVE/tCiEXlUVQrzGXsoXi0wtgjE4mlbWC95nugdbmjfdICb7laa
         A49JVKUNoL9z6g8bg5kO9P28RbJXN/OyFKrFH1pwUbbRLzwg/ESjgonzk4bu1g0/JO8h
         C81w==
X-Forwarded-Encrypted: i=1; AJvYcCUIngnkx6UnRX7A0RQxesERAaqCBCDvzfrk/qFUO5a+uzdcLLGRJ0F5uRm9e2mR3KIcw6fRxVOdD/72Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLL7hYoFb+7yrpcU7xj+cb4zGDKwvtpqXi1ObZS048ylS939O
	FKNnPz1oLBp4AHLhZvjA32xvrzQgjmDpJcNniyqAZjX1oZfb/UGP807hc9a84/Q=
X-Gm-Gg: ASbGncttbO1Lqw0bo5dToMCF6oPKiBkAkK9nGVeoIB0uzWroEfd+lvL9X7lNn9u9uDk
	eDA7e0X63q4WIh7qzMtJjMcDlQ3hqV/o9K3mtPvqRT2d1vHnDvorAUEhNC+xaO4tE8eWnjLtYTP
	oHrEi4gncS0GDdm4NLYMdRW47IkOKES/cF5NPnCtrrI9L9bkoaIXJQQ8Yt4EoXtQN6UZEUq4Lb3
	KealTWRyj5bXT5AsEhcjhb14VrZN8Wb68c0gu/AiXQcq3UyDsHQkXdX/0Z9Ul4iyXTufjA3l+1N
	lsrrzsXGWny7PirRSLl5gtoyU6D8usg7DqbxaVs=
X-Google-Smtp-Source: AGHT+IGMYRMBvLxzOeXvVX6lzQnUkLaJacSW0846B7I6+A5szlAV9+EARdZefGrGZYdP8ZUZ3vHYSA==
X-Received: by 2002:a05:6512:124f:b0:53d:ee75:4a02 with SMTP id 2adb3069b0e04-53df011183bmr347840e87.12.1732710596865;
        Wed, 27 Nov 2024 04:29:56 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd24953a1sm2276621e87.228.2024.11.27.04.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 04:29:56 -0800 (PST)
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
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix interrupt types
Date: Wed, 27 Nov 2024 14:29:45 +0200
Message-ID: <20241127122950.885982-2-vladimir.zapolskiy@linaro.org>
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

Qualcomm IP catalog says that all CAMSS interrupts are edge rising,
fix it in the documented example from CAMSS device tree bindings
for sc8280xp SoC.

Fixes: bc5191e5799e ("media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sc8280xp-camss.yaml   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
index c0bc31709873..9936f0132417 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml
@@ -328,26 +328,26 @@ examples:
             vdda-phy-supply = <&vreg_l6d>;
             vdda-pll-supply = <&vreg_l4d>;
 
-            interrupts = <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 758 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 759 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 760 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 762 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 640 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 641 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 758 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 759 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 760 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 761 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 762 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 764 IRQ_TYPE_EDGE_RISING>;
 
             interrupt-names = "csid1_lite",
                               "vfe_lite1",
-- 
2.45.2


