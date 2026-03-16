Return-Path: <linux-media+bounces-55828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G4gNcNWt2lsQAEAu9opvQ
	(envelope-from <linux-media+bounces-55828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1BC2933A5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A92C300B566
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45F22505B2;
	Mon, 16 Mar 2026 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yq3BW+y7"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A0A23AB87
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622926; cv=none; b=OCGCbxpo49w0WPEXkHWg32S4pX1VshKgZUJcXyr9ZRenUTfZANljItJAd5pk2wcPt0rrGHi2Qw+QVjy0HNO6fEKju+hGn3+31tw+/oqRldmQrCQwy8HeqJr7D+LhvL0KF437muoA/aTbgy7N4scxv4ZPLjK/rKTIin7BQWmRpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622926; c=relaxed/simple;
	bh=CLD7plAx4kx256EGAsOH23fn2fiqSPTmqTRUmqF6KEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwj3fEkoK2NhpGIsHQEZXARvaDvz0xhyO6T9jkpt0e4dg+3aPIFch8nWhr1SnsLKYvZdORlphmHRQJrt3Hv91VARewiBb4X2Dqbqt2t71KYzHuicgXvEWP67s+8Re5Q6bbz4NIYadNDpoW05YxpagC8+jP7nzBBaQq7ZdcqzMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yq3BW+y7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4855dbfc129so16739515e9.0
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622923; x=1774227723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1te5YEH0gYMSw917nzr6gDgeGTg4NzsX9xHG1EXOTkk=;
        b=Yq3BW+y7ncbL1f0zlIiR5ednwCtRYmlhxltexIKijnoWjcBg93+n7zy6fi+j4Oe57W
         TSTlfUNIcHflO21oye+i13+Hnl7VnzfvxFzDRzyAEvfbQQ9kl/hc1MeMW3iY/AdpnbKh
         tXfK+bkzMngXf6Xv9JjNJ8SCj9CWL1Y76HS3JlVZ72Um35PpzVLn1JKYbWnmEU0caCr5
         ibJo0ttLtNvIuv8gR6t5di1WjQk2xncDeZ5rYiLxJc1vxokZY0sat66zhM0G5HKpHdcw
         gY4jSsBlMBLOgnT+ebjkt2ePzPXNFdm2dGg8IdDPxwrSjeJ76U+O/K0uSwpVm9XU0KEB
         I+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622923; x=1774227723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1te5YEH0gYMSw917nzr6gDgeGTg4NzsX9xHG1EXOTkk=;
        b=Fw3aCX7hfW8LVMy7nq0ODC3Jx7jN/l+34+v99Lqcwx4pmetLGv8Drxv+c67PKY+mjl
         62Zo9knF8SM6+mVywjZ4TtFLsIehntlZNlhaBjzrNo3Z0NNlcpJ9fhbONW4JasAWIYXj
         pgx9FNrDnG1p+rwGgVqVlzqms9EmfW/E7dyi58PenQzKhw8wyW3lBaxWU4/UR1MMNZSj
         mo2qI2aCmo7mloItAE3FXUD78X5I1QJY+rFbz/CZjo+l78hBdvHrbgxxnleHcopiNvUh
         DsbzicLyCXaKzb6zta2S4/bgN8ZuauM4rzl4hFyCZ71flsGENee225ChY9vRG7RLoBMf
         ggmw==
X-Forwarded-Encrypted: i=1; AJvYcCXsZ2Ne7RBZiGAXTrKDy60DcVvxi8aYc7szga+wSgcnxB/HRWMfTvRbQ3rf8nCERI9woeEaj75/67Cf3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya8sdpMM/DFVxS60lPNpVXk/r++DKCQ7gXxhdfo4xuVyKYvSfA
	YnUFPuCT/YQUxb+Q4lkE2uFwo2LVhFeMOm9HMAD1fWbnErTMMHZZxmroPC6hXzSa/yE=
X-Gm-Gg: ATEYQzyUu6C21iqgmnJeBAK6RNKT9zKp/JgzN0gGRjKSJXXvVsc1BZK8gf5ZN4vzEOs
	DHpBq7Q8hJWp56QRK9Q0O+SAmXACAviiALDtmkSxOj/iSZ9PBfGjd+HpV1ojM117RnQgPA8KPBM
	Tr5LAHLeQMZ+NLwUcv1hwF7fC8To3hMr2I3Gl289GGo8nP/E38Y4LdFc3TR55vuJzgpLLEBpOIT
	SUUzlYKEG62FDjUCTv/GjvddRMdg+Bev0jPyTyTLwmTLi1B12Vtf1tiH+qRzvSaX/Nq35UoNTOr
	o1Y6yCL0UIxJOY7L+Vrh95Gom1dci55GXDp0MGnHzK1F74mWqB3MSl0DXi0bgHPleza7wiLElOl
	wPCQdECucaXl0fvuV1N1oFbiKDiroamR7DtAPz6rf8mLVTtF4T9RlhJGh9LGto9zVrAkJhtzLZ3
	l+FFYtjfRWJ8clwJ71jTNaprRCsH+k6D8+rsk=
X-Received: by 2002:a05:6000:184a:b0:43b:3f2d:7d58 with SMTP id ffacd0b85a97d-43b3f2d7fc1mr6266218f8f.52.1773622922742;
        Sun, 15 Mar 2026 18:02:02 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:01 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:02 +0000
Subject: [PATCH v10 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-2-fdfe984fe941@linaro.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
In-Reply-To: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=CLD7plAx4kx256EGAsOH23fn2fiqSPTmqTRUmqF6KEE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aMekIzpJ8q1fVJcbItgh6FdhwBrvDzsimwn
 VNES1pk2nuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OohFEACDsnuxYUUvG/2qxEmt3khiQhsVwCXSEZlHB/HbjiCeSPqmAeLRbvdrVLEmhrDS0ZIANtQ
 V4cvJfRFInp+VpfjsITexNkvBgcAY32GBr+5Vjwzzm/wE4JtzLtU/QL6FKLxoCW9iJ46PE+MGz/
 7a7NKkkxe9Dh1WUO9QTZvA7FxFDfqCRuOEKmQJgKzcgzOCOQuLhsUUtsJKdNW99jaVv3WGHrGtX
 UtIp9uhKu6w4QvpbW8C4qxxrzrBPzLeP2N/rB7uNw8thNbBaqei0jUIjSL/4kLj/Xjf35dY41L2
 T4XgqZvQTOKGroQzpWffBkoTyqHtT8xQqg5xbErCQRhrplIlgdF/CqRUsW7GDcnfBrzoPWmsUNH
 lnEnVKDesLd23v1UCnL/rQF1/ge05qEB1tvZL3TeKU5fPgAjc2m7CEjEzZoBlp6EEKbqG5+k+6X
 aW6o4oHp47eVYpoXqxhGOF4+9LYtARVlmIa+O4JyC8eyVDxYE3HYNtJutfu5iFdUk4mV9kXhS2m
 vWXVIUK+x3bnxc+eOOGPdgRoQuO71zCd63JrPMNlJiClPeimjSYVv+HME7pyHLwhO+PJtGWWg7E
 7Te3ZlwN2zKbOJ9G2e8EZ0gHLsCiEvrTcwFJLKwQBeBEGijrlk+tKvj3RC828ipDsxgqRUvDZfs
 e+dP72zYnarfbjg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55828-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8F1BC2933A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add optional PHY handle definitions. This will allow for supporting both
legacy PHY definitions as well as supporting the optional new handle based
approach.

Drop the legacy high-level 0p8 and 1p2 supplies as required, each PHY has
its own individual rails. The old binding is still valid but with
individual nodes we define the rails in the CSIPHY sub-nodes.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index b5654ef71bd89..5442f981baebc 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -43,6 +43,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
   clocks:
     maxItems: 29
 
@@ -130,6 +138,16 @@ properties:
     description:
       1.2V supply to a PHY.
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -162,6 +180,14 @@ properties:
             required:
               - data-lanes
 
+patternProperties:
+  "^phy@[0-9a-f]+$":
+    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml
+    unevaluatedProperties: false
+
+  "^opp-table(-.*)?$":
+    type: object
+
 required:
   - compatible
   - reg
@@ -175,8 +201,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -188,6 +212,7 @@ examples:
     #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     soc {
@@ -233,6 +258,10 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
             clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
                      <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
                      <&camcc CAM_CC_CORE_AHB_CLK>,

-- 
2.52.0


