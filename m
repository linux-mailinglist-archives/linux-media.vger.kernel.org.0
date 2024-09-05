Return-Path: <linux-media+bounces-17703-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A996E007
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 18:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B3881C21342
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2024 16:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8CB1A08A4;
	Thu,  5 Sep 2024 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rARPfdUp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9611A00F3
	for <linux-media@vger.kernel.org>; Thu,  5 Sep 2024 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725554517; cv=none; b=PDRxtti3L7msOzWDZe1p47LytihWpJu9epFm9NXJb2N9CPr2E2l7ow8w0GjCfx+OlXmNYCch7sQ17PHh4vR0WpvRbkv9o+bDLpEmHMbtD+9lZ5Jiq5PD2jRHrCqVbHuzoSZ/ydPoM8UDTlySK2rqjoaRi0Xvpay/eSPd7Q2Af00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725554517; c=relaxed/simple;
	bh=kFJB7f55yaQbNphw3oqY4Q81daCzBOTGC5lHQafHYvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo0He+API238Iu5jWBr1DbspP8puBiTcIu+kc4mispWwgW/ZBkEmOqRzGjftjCjl0wr0ZqJ5GMpFQGLA75/SOlgU3521QHZv8w8soWl4clDTc1synHY9nB18/FbUoyXwJKWhRZ19W45yO1gevBjV1dH4MXn8O6esmPyE+aBFK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rARPfdUp; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53569ef26e6so141115e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Sep 2024 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725554514; x=1726159314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNOPLJE4duWNY1Bx/F8u179uln33M2nSGOkrTYlRXcw=;
        b=rARPfdUpqYmyJvxGlz2XRcwo4rn99sDvzNKyqblIZweClW/bkG4tip+8MA6oiW06m0
         96En060AwZYh56k6Sy4SglFfEWdYvg9aVFr/xay55VKOOevPayr+/w07PpzrN/VEzSiQ
         jtR+QWUv6tFNbNSXVhAY9TZxC6D9FpR6tgTs2zObhj8Yn+Fc+7buxAQgG5j0oC4ke4wR
         PXDp0nrgyEbMke507/0s5F1OUa0BgKqDht5UeVuBnCQmfDwXNdazYFJxK2o5cv466887
         WA8Sr1HML0MpAH7V0KGrmOGh6yqldC+yvg2L1guYOazrpYBrGiHMdxChLJdgvUwCYPOp
         8mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725554514; x=1726159314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNOPLJE4duWNY1Bx/F8u179uln33M2nSGOkrTYlRXcw=;
        b=bDolDXlEFR6ieTFpEZolz822txiBvgjc6AqM0RLKPswH4X7ED/2KcwN3Bzp88jqVWZ
         whXVX/GnYoEysWz04IHPyNtqc77NRGCoRWQoBYFEBqC3aGbOMsCjZJnID6ciisvt95/m
         HHmU8AyD9PXot44xQVuY6lkjVsPfan/faVsln5r36rH5c9qgYy4orJOUuVd2jiIwqUkz
         WGIWJkPdm/lCCZBJRbyl5VHnDpAbav0HCgtfGcBF7H/UVLJlta6aqpomH2lEOFM59A6U
         WsXgjpqMkoZI7WwUunVkn3vWyMm0xuPqoQgPoVoMQe4t3c6A+TmDFLLfwG1I7R9c/bhP
         9AIg==
X-Forwarded-Encrypted: i=1; AJvYcCWfDM7LTEsmWYApoKEOg/2yLiKFvmEzlqO9ObPTpLwMsGZakAvzhwff3IaTTIllctJ6/8m3VPCpBQqrfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUb8JYOxTvRicsWDfprfUYiZwIvU9+tF2Ylx3GuX83gTHUpxFG
	xAVtY/LvTkYT7+UNYxhVpXhG4JY+2w689cYiQd4ePZGtoEMobgxhClxbRhuCseA=
X-Google-Smtp-Source: AGHT+IFyikow6IjqDwxydm45MaAYDlfxHrgpdMFeSrYAryURJgLmes46M2fHvXabs9qAmtdGdyE94g==
X-Received: by 2002:a05:6512:12d5:b0:52f:c22f:32a4 with SMTP id 2adb3069b0e04-53546bb9cd7mr7004911e87.6.1725554513681;
        Thu, 05 Sep 2024 09:41:53 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53655182c91sm100674e87.306.2024.09.05.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:41:53 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/6] media: dt-bindings: media: qcom,sm8250-camss: Fix interrupt types
Date: Thu,  5 Sep 2024 19:41:39 +0300
Message-ID: <20240905164142.3475873-4-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
References: <20240905164142.3475873-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The expected type of all CAMSS interrupts is edge rising, fix it in
the documented example from CAMSS device tree bindings for SM8250.

Fixes: 46f8ac8497c5 ("media: dt-bindings: media: camss: Add qcom,sm8250-camss binding")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml     | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index fa5073c0fd1e..06db2c1e6079 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -329,20 +329,20 @@ examples:
             vdda-phy-supply = <&vreg_l5a_0p88>;
             vdda-pll-supply = <&vreg_l9a_1p2>;
 
-            interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
-                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>;
+            interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
             interrupt-names = "csiphy0",
                               "csiphy1",
                               "csiphy2",
-- 
2.45.2


