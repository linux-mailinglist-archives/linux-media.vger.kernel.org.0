Return-Path: <linux-media+bounces-24215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647A9FFBB7
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 17:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49AB3A32C6
	for <lists+linux-media@lfdr.de>; Thu,  2 Jan 2025 16:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFD51547FB;
	Thu,  2 Jan 2025 16:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kv8JZtlB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB38153BF0
	for <linux-media@vger.kernel.org>; Thu,  2 Jan 2025 16:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835656; cv=none; b=mHOpsLvZnK21cfGQnwiMwvmkPzCuiGspjrfwzsUIgCS/WRXC4hKeklKgAhar/UuNvM9xNutqpFICT3B9f9lYdbepNBuZjFqdxh0d8/e0Le0O6amupaZj90fDzJK9ZR/pausBYJFFA9LAeNWODcPXl1ZZXZ2Sh5qF9ahlBiFg4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835656; c=relaxed/simple;
	bh=40WKbX29Iuf0zZZzggGz1hwKcr+5M95z+Oavg/DIjfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZYydZ6tuk+S9e2tGwqBssCUp1dKtvQFfGvTCNqJYzNaN1Om/fFFXuXmXaiFnOIh7Se9K9YuU+xzoR/rpsLrw9173qk7PNuzS82HvFAT4Y4Tm6xaIR5evCw6HmmpJVBGEOjerN7UhInzJsJTVf2VAT+mo8Z5inXeQF2CBN4tQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kv8JZtlB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f796586so119610535e9.3
        for <linux-media@vger.kernel.org>; Thu, 02 Jan 2025 08:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735835651; x=1736440451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFa9CDvSl76k0Hh3vGlZYLlV6eb7UtNlguj/xJD/WKM=;
        b=Kv8JZtlBOgo+V15XJQ9fo5QiBS1pIXFgyYHCNR469DkqtNBzPaJxbXx1eDv5e2iEDJ
         WZeZXM52Lk71Il3HFI3RASPrvEH4Hq/N10PIsgzZ79W98q+Pfpnx59coEJczwoS5cZJu
         4PsCYRDqoO6SWG6Kb1o8q+Pg8UQ5bbPJVKswQAWQznNmqBzOzmGH0h706f95eF9lzOju
         2+qdMFTN1CqG9e5Ui+JP0q9rtXnKag+rcHeOxGdEkCsv9kkk3a0KiskUbI89Re+IJ7AR
         4Hl1bXzW31dU6VgcApiWCb+L8OFQx83EPEvdgXG4y7/WSkU2YRFrQAYTvLDKLVWmePtV
         bFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735835651; x=1736440451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFa9CDvSl76k0Hh3vGlZYLlV6eb7UtNlguj/xJD/WKM=;
        b=EZx+kc6bES0xGzFOZeEwRv3XPetrvfifNX+fzBhwFzrR5rCcbVDCrEpatfzupQNMMi
         utTRIHl3tKOUS3iiS79hv7yM6VGUq9A+czrytnc1g20iJrdVS4xSu5n4K/UBW23NqfWX
         o/Oyy/U1oDEwSL69PzrLNx68LZtyuow5IG6f3wZtFGifr64gtBSX78TduFbNU8v4bvz5
         l7tymMM/FfgjqwlFG5KBwAJ14gn9Z/YXuF9851z0rSMGjjublh3ofHPqpIDIcRDeAJ8w
         xNqldePzC540+ynd0NFw/FAm81qUtw75iKk4WZKO5npxnW0SmalT8bRncfBMSclEebtX
         aKeA==
X-Forwarded-Encrypted: i=1; AJvYcCUxi5QJ/IO6Kit0HEellUX9qD3aWRrWfNCkbSA91w/5dmwC2f9R+aYpjUzo5RX444FDQsLcHfAWtzsF2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5KIgRPbXO9KwKG0Z7NBnQ/Gz8vJuxvWMs6orsJdOXAg+wChKt
	U/UFO7XUdOzveI8f9135/jbzqgOhouuh4TKoNPFO3iLbxVOmUVhf0CcH+5ENC+c=
X-Gm-Gg: ASbGnctmyGmQdF01AvNlxeeLvDX0j0mftWn3PP4BZsXzC+eRq4He811qBuIWB7qoCCg
	HZA2Ea9At5JsJCWWTntt5Pur3lg+yAKcN9tROsjlXHBeix86CMbSxLHJp1I/KYRyUmi/RHrE4lN
	9Z83MPnaXCwzPnTH5zhWGiJW1s5l58WtvCuyh9Zj6vxb0kcvSeIZFQQp8JnSbGe50xbFRY6g2YI
	YiLUQh+KT4rtkbcnsnuDxdPtdBx8d3Nm9mx9Wqi4SVklA2sdDLR+GLB5cM7D8n2qA==
X-Google-Smtp-Source: AGHT+IHWgH76ldo5RFigeNbW999eG6qs/T9kBRAOvHKJHVOur8IF0AIVTPV3mVfNpHNdb+0us1WqcA==
X-Received: by 2002:a05:600c:5246:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-4366854c073mr381151545e9.11.1735835651405;
        Thu, 02 Jan 2025 08:34:11 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b295sm499265665e9.33.2025.01.02.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:34:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 02 Jan 2025 16:32:07 +0000
Subject: [PATCH v3 2/6] dt-bindings: clock: move qcom,x1e80100-camcc to its
 own file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-2-cb66d55d20cc@linaro.org>
References: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
In-Reply-To: <20250102-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v3-0-cb66d55d20cc@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Add an x1e80100 camcc binding. x1e80100 has two power-domain parents unlike
other similar camcc controllers.

Differentiate the new structure into a unique camcc definition. Other
similar camcc controller setups can then be easily added to this one.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,sm8450-camcc.yaml          |  2 -
 .../bindings/clock/qcom,x1e80100-camcc.yaml        | 74 ++++++++++++++++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index 0766f66c7dc4f6b81afa01f156c490f4f742fcee..b88b6c9b399a4f8f3c67dd03e6cfc306963b868f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -19,7 +19,6 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
     include/dt-bindings/clock/qcom,sm8650-camcc.h
-    include/dt-bindings/clock/qcom,x1e80100-camcc.h
 
 properties:
   compatible:
@@ -29,7 +28,6 @@ properties:
       - qcom,sm8475-camcc
       - qcom,sm8550-camcc
       - qcom,sm8650-camcc
-      - qcom,x1e80100-camcc
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5bbbaa15a26090186e4ee4397ecba2f3c2541672
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,x1e80100-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on x1e80100
+
+maintainers:
+  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on x1e80100.
+
+  See also:
+    include/dt-bindings/clock/qcom,x1e80100-camcc.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,x1e80100-camcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Camera AHB clock from GCC
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  power-domains:
+    items:
+      - description: A phandle to the MXC power-domain
+      - description: A phandle to the MMCX power-domain
+
+  required-opps:
+    maxItems: 1
+    description:
+      A phandle to an OPP node describing MMCX performance points.
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@ade0000 {
+      compatible = "qcom,x1e80100-camcc";
+      reg = <0xade0000 0x20000>;
+      clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd RPMHPD_MXC>,
+                      <&rpmhpd RPMHPD_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...

-- 
2.45.2


