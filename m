Return-Path: <linux-media+bounces-57103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGhMDK2LxGn50AQAu9opvQ
	(envelope-from <linux-media+bounces-57103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AA432DD73
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9FC5C30466A0
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4B636F434;
	Thu, 26 Mar 2026 01:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmtQwonD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74025363C61
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488487; cv=none; b=g3UpdEUEq0BRzMDNNSu92edcrU77m36d1TJqIYrX0fohSic4jkC6NqLkqKfvodIJkR/SoyRRICy4YhbG/TzYx1y5vFQ9QSIEbKiDXdYfXFt83O9YSHrXseM4kCjhiTS3dakcC6c/cgkD1DXoFBpvCYnpvZLyFySqaX47q1QgEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488487; c=relaxed/simple;
	bh=/dbNXyt6doYGJOLfnqyVmZ3WMw1uSylWcEyQ9zySLt4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eudspHNms3AgToiOKdeuaGTEHTSIe0Yu486cvDNM3PGXOzNRB54+rKH18NUvfqKrGTMAF0WLaeKE4BcKjLWC3jAqHirN/OTn72nLBD1bxGyPAL3wGvhbpwqMUgitSUNLC3+UNKfqe0itf2MzBC5AK+Uflniki9c8zsvBqXsHeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmtQwonD; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so351984f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488484; x=1775093284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3LoPG/gWfFkYY5+0Z7Xp53uSm1t2TgaG5wGY3fLPnI=;
        b=HmtQwonDcRT5IkVXOn98RpHTgmUXDrFGKxk4LP95N6QwvEiWbRrhfr/xMT9Vbcad7n
         1JaWC5S+bc2b8she83L/C6tITjuxi/gOfiT5ztboajKtJ8WKAy9TnB8r89vK8HsAPAo/
         sQRJEq57W8DWQQ0IBAD+3JuxdyazM1PP+FK6XAJS4XQb3KTH0K0RBTp13KVtBnt4jdds
         3nETor7pB+aVvqUiXSxyM9zTjccQ7L1/uG3NshOFSprdjouQWYdHGkIWvXXpZ/B9U+S7
         BZ0dFunC8WNDFiA+bowPjs/QnLPGZkmUEO5a2I5gxwJ0N8gON0fGLOeEP+ZDVLVRe1mT
         fkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488484; x=1775093284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G3LoPG/gWfFkYY5+0Z7Xp53uSm1t2TgaG5wGY3fLPnI=;
        b=l6awMAAcrSCeEMxHWC8a4KuJEuxpFoQgTcPFbjDO1ioOz1ms/NBt7K9/NxIGUC0oqJ
         fflJIiLDMHxXxZVO7/0zTYNUqMRJ80jNFU6zXM7P3qe447K5XzxTxIYDOjRdqVhf6fSH
         HX6oft0piJhKo9sGjGvxN95bAw7ypC5/n8aVMVbY6h4Vzeu0aUSU89dPFS3xwKeryTFb
         fG3kwavka1pNyDOSpI9YDuqv3J5vKXMq75hyH9QMF9Vr9wmG/I+Wo6TtypCSeC5UyOGD
         1bpjqbY8Hai4jhumS4EQYluY5NrSnwhIpaw83dsYhTh2TexyVZt8FlEynEMEHxUm6eOv
         v4/g==
X-Forwarded-Encrypted: i=1; AJvYcCXXxCzdJZE3minkh9l6MnaBT3d3KoPAgWZaFgjkXwXubCbRT8/H99htqhVq0xJ0+XUExgQBJBQW07MlFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3iV17W6clC5uHBOY8aR8lpYRmVT6SrEJCFFudYz20XSPK8Pnq
	KyD8sPcJZsAJFhN11K+KFtwngNb/TYUeJ5pGNnfFacIEFMuo+0lCKvpZFTCLl6U9eHg=
X-Gm-Gg: ATEYQzzsPMnNp/4SzXIECPf+1PD2oe3fO/VLm6/hr1tgU9symcZnFevheTorPM6ihyZ
	VsmEGjItH3TDkrDqr2FUuQLxJFPzqOt5dwkdR01pZqTLdGiS0B8EItLnTZ+YtFBtwtZBZhGvbCR
	vsJS+FMri4/RnlD44TY7V9TIhRE+hQ0SNNty827QE5smS/Lt1b9/vhYY8OneKaQlN2xgq5Lm5qB
	0vDb14zKiiPMlo7vLaruiJn1RuJ0rj5pcI64CnHRGGVWFhtDzUbq9GFtOCGDywn97Fj6lt7igrh
	gLElWajNmsFt/hIPimxNOTIi1n2rGecMfS05nlJoLwRJ0aIX9go4TuraGchh7AQzhVQxG7Teqpa
	0vXrXjheH2f3yIti+B+AC2RUoeFxj8p+gTU8bs31Wb49bV4CykSvhnRwBxX8FKdJSW24F1Fei1v
	3ZTnnBa+wK7Y3P6+DXynyCVEf9tmgDgNhd0NE=
X-Received: by 2002:a05:6000:2882:b0:43a:3cc:83da with SMTP id ffacd0b85a97d-43b889861fcmr8032628f8f.18.1774488483793;
        Wed, 25 Mar 2026 18:28:03 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:03 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:29 +0000
Subject: [PATCH v11 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
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
 bh=/dbNXyt6doYGJOLfnqyVmZ3WMw1uSylWcEyQ9zySLt4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/E36D4vvcqA2r0xt7mHFNp2+uAaUCJvARw
 S6WEVpJLsqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OqaqD/9f/Uqry3eIKvFBSjWgbIeaiP/Z1VN9oQEbcwq0w1Fl4FCM6wJVX2NLLqVvGvJbGA/OE9l
 EbqOyqrmSt/7cT/t3V3QDXyd0uzErGE/0gdQ6CVVUl4PFbyUoGKz4CEvbFkIOx+HtK8JvQ9OMEY
 waMWldOi0VnLRElAVOlZXZCNlSsbacIQdLixY21ELR7Cd5W9ZIjD+1wLqK+1UNqltcx3HzG/OCM
 YwzQHgFtpL+0993o/MISoHXjbSWIJi/wKEMZC+/yKHIjtUr7aXXLDAxoxnV59oHkxk/fZfBJ0nP
 uV3yQvRDmVTJYcIh5gon5pho6ATQC+M+zP8+yyBrEFY8JpUlyEBaoMRIvwf5d+LeWJogeB3hBm+
 He31GKV5rpRJa9CHDhSkgZm/C0sin9U9wRgilwlt2SPcd3sctpSzxeIwgFVqcu/K4ckAn9axwza
 2E9lkgcKwG2akop26RR3bFja/m4Jy05iGzpBn7kK51W57TD1eXXtdeTykA0ZKdfLDDOT1anZscY
 hMC5eqzzw7st9MBgpPjat+0xUt/cRKLLdr6ctFXPpjsr5D5czBd7/S9cKi4+nnmYS8CAvh3wj/8
 IlNDcpN8oVdWDYFgrp3yIU1HRi9wC0B4tjK1Jt2hS2uL6D1EVTKIRJaoixm26lWGEYWMcq1YJJ7
 Ddr0cvSF/fZtu+A==
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
	TAGGED_FROM(0.00)[bounces-57103-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: E3AA432DD73
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
index 2d1662ef522b7..c17b9757b2c86 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -39,6 +39,14 @@ properties:
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
 
@@ -126,6 +134,16 @@ properties:
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
 
@@ -158,6 +176,14 @@ properties:
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
@@ -171,8 +197,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -184,6 +208,7 @@ examples:
     #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     soc {
@@ -229,6 +254,10 @@ examples:
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


