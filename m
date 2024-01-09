Return-Path: <linux-media+bounces-3420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C88289A4
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 17:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59A11F2536F
	for <lists+linux-media@lfdr.de>; Tue,  9 Jan 2024 16:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7903A1D9;
	Tue,  9 Jan 2024 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lvQCD/ig"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5266F3A1A0
	for <linux-media@vger.kernel.org>; Tue,  9 Jan 2024 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3376f71fcbbso1582232f8f.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jan 2024 08:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704816361; x=1705421161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrDQaKaLoC6HAA7NXSJEUsah06CyH+NV6eUOiFE3MbA=;
        b=lvQCD/igmHFnhOcBs88OExsrD0SjNSXZNH7oIjHcYJZMDPQDi4E219lgFeLkvmdDXL
         Q3s4c9UWIki7gPsOluzB+knR5PSBE76isu/9tAHvKHP1oV1o0lQgHrZ2pdd8tuzxiFzH
         GF1qNPmsD7l68icQB93zOxhaLctnmmU2jku+aEiJw8cxSLO9kmDkpm91DNI84SAw8tIh
         Ya4KyBS08gIHEoq8gbXGGFYpeIVPs1RpmsGVZr8ncrcSetowl9XY0thSzrcKtLoAvnFw
         KpRTPWBAQvKYIwAOtrZwjyx6s6L1tu+ROxMJQok5tihfwODyUvNevWTD6SWToReGvHrO
         wUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704816361; x=1705421161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrDQaKaLoC6HAA7NXSJEUsah06CyH+NV6eUOiFE3MbA=;
        b=sIQtvJ+LV57ChdgKKqLs8M3BDw6ea/W2SXvMxR0Wio5I5UQS8VPmAdopVcswF8t5fE
         TSaqzoLJZnmhFzGJb3uJ2xyyDnSEFCerzdSdpcuVF4SuJnmF8UDoCwNCvZWD7i5zK/TD
         NQjNwDrGX5JiR+hfWio1i8JbYoeEE3HM6D1fc6/2F3LHEovXx22vFoiRNafWy5Y2wp1n
         gLvDU6248oDZgOD6fmHg8fN5wkBa4Oo1M1QsKXT4p03l4UwOci9j6tGFU2A0MiD65nZu
         J4PWNq9IS+zHx7dgrxOGVgA9K9F4oV9av0zqUKeutiCEFqoyAPPFirRmpT68mBEyHU7s
         y5Ww==
X-Gm-Message-State: AOJu0YyRnNGATMtMDSnaEZ+GArbsMIlyAkdnE5J3K5bem0VM87vwHS48
	KjXCTQ+niWWYugQRk8UFDHqM19RXCauxrg==
X-Google-Smtp-Source: AGHT+IEo9SoUdLbLfwlLwyHstgbrprERFZV7lGv3y66ty2G1w7fkWhp9KLqC1WLb4FV7k4fTE6f1ig==
X-Received: by 2002:a5d:6d84:0:b0:337:5554:9f71 with SMTP id l4-20020a5d6d84000000b0033755549f71mr470750wrs.28.1704816361498;
        Tue, 09 Jan 2024 08:06:01 -0800 (PST)
Received: from [127.0.1.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id z8-20020adfec88000000b0033762d4ad5asm2726490wrn.81.2024.01.09.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 08:06:01 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 09 Jan 2024 16:06:02 +0000
Subject: [PATCH v3 1/4] dt-bindings: i2c: qcom-cci: Document sc8280xp
 compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-1-b8e3a74a6e6a@linaro.org>
References: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org>
In-Reply-To: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13-dev-4e032

Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 8386cfe21532..369d72882874 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,sc7280-cci
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -176,6 +177,24 @@ allOf:
             - const: cci
             - const: cci_src
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-cci
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: slow_ahb_src
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:

-- 
2.42.0


