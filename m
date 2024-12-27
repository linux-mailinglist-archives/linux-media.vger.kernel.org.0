Return-Path: <linux-media+bounces-24131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771669FD4B2
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 14:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18B93165879
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 13:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521F21F4297;
	Fri, 27 Dec 2024 13:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJsmKB8v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D59E1F37AA
	for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735305139; cv=none; b=AXJj9DvhORxScf0eO1p1+cT4vVEUrLhTgNlpgRUmn5bwrE8njLBQBh4bf4pAFAUo6dM/kJMuxy44rbEl53ZYd8hHrma5GoN7Nfq5LUfkGXD9Xai0YwJ6fCnmoPUlhb4cXC0uhfX7jHCtvyJV+SqOuffq9186OZnP6uiI0Q0OWZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735305139; c=relaxed/simple;
	bh=1A1Mz6E7xYN3MvaSfjeMHy8CNatmsryIlxCYCFCun0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4TzomF6z7qihNFTK8O6tdROp8nr46/AbvJNBvNg9o1sTO12aNOhSV9t+kZ/X1OMdBBfjFrBvYg4a/D6cBGOuTTXW8hEO9G4uga52A2Qeu7DhLTcHner1D5jMCRddtD0d74ytRMW2bemO+CXHBwGjU/KjgVYLuDQDNOT4r+u/fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJsmKB8v; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436341f575fso76575255e9.1
        for <linux-media@vger.kernel.org>; Fri, 27 Dec 2024 05:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735305136; x=1735909936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDahXDiMrMFuseveKIbLBTZHpEpgxwm/BpoTDKiwlh0=;
        b=cJsmKB8vX2Lz3C8MIWuIdxm5vspBb3Sea2Kc2oHqf9bFgDDhJUrlIrRs8dnhFh8Do6
         SEffhBT8HoHZn87MGLQmszFe1kNTjHp+9NyvCHTe7xGDuAfA0Ho0JIT4Sl3SZjZkmaNc
         0K8usf6LF4vZLoZ7cl//E3djT5LHsdb+NFSouY2X4nG4TszSHmFOp62OAwcuBpZ2w+gh
         371JARzawb2VRA8S6zz2ZJXIurNHBFDL2QLNN73lE0n2wcH/R/UbIf7JQmY4Ugmm58UW
         mlhwWSIrUGJHz/z+Zi6hyu4mHOB9DSbh4PWqa5A7Aa0A/2vYfb5P1UMDPNzHQYPB6Ixd
         /R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735305136; x=1735909936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDahXDiMrMFuseveKIbLBTZHpEpgxwm/BpoTDKiwlh0=;
        b=acWjq7/VuvVW/82cg2PH2VlrvQf7JNWsVbOzHEN2lVKvfhOwXQX7RysZ24VBDBQpBQ
         e9m57r2igr+d45rYqxOiRARsOMH+iM5KiHTG4OipDPgsiDone2XhAWCUoIiTYkh7lIRG
         WXAgsSSuIQsEk8OJvGRMyjGIfUmOksr8W4/4F177fLB+bLV4lBcc4+ml5gt9bH3wrQHB
         jRitpv7N2bBclYk2yx0uBoTDMe8+X2OBlNdGw8CvFJySBSUjPAiECaGUQbom8K4IflZA
         oFhWMl0MWytC6giRmRGOZfYsCxeBLiPtFm2bClowRRNDlJcFkoDbuAqq0rHUcccdKHqS
         7ZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyfs6Why8AejXoqRo0yIPcfyQHreKK7LrntIF40hsiWnFJUb1ykTJsTvWu46X3rIoT3uBJAk5GdoGcyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW0HdTTpfNmp3XVi0bngR7/eyQLAVPqg9adPckxR16gqRZnE4J
	1D7IUpT1eg+RKflUbcSIumi7mOxPTl1sJeOjkUtdK/U1lzWVcetfErtlipeaZwc=
X-Gm-Gg: ASbGncvsPpXLrNYchPi7i5Jpo9CeKmUQUYxWSCKHv0N4n4z1h2gviWpBNIGnfnKvvX8
	hK188ASKiwRHl8sXH7klTawPFY8Ng5huhTdDRFakB8z/leq3Elfd/PFjPknA4AKxBmdg8NxOoei
	3MLW4vFIddMrI2yDNLwtTZnQdovq80Q+NQWhjVMUsszm5cBzEP+HFVrOeVdQRdpFKouRCh0V2aq
	vnszsll/mTyQ2jx5D3a7nmz3E4fnfOSwP0nvnCz8RhZTjZjC0aCE9/nLqzJqc1LGA==
X-Google-Smtp-Source: AGHT+IGAmEDxQC3LgNG94AqFNSpl7gwcE78FuW8AtAJgn7d20DM376eooCqV2MdMQ77nXSgpIFUobA==
X-Received: by 2002:a05:600c:4586:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-43668a3a3c4mr205128975e9.21.1735305135904;
        Fri, 27 Dec 2024 05:12:15 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c42sm298899425e9.9.2024.12.27.05.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 05:12:15 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 27 Dec 2024 13:11:35 +0000
Subject: [PATCH v2 2/6] dt-bindings: clock: move qcom,x1e80100-camcc to its
 own file
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-2-06fdd5a7d5bb@linaro.org>
References: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
In-Reply-To: <20241227-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v2-0-06fdd5a7d5bb@linaro.org>
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


