Return-Path: <linux-media+bounces-66930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R/GNKd6UTWr02QEAu9opvQ
	(envelope-from <linux-media+bounces-66930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4687208BD
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=CJTWhG+8;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66930-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66930-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C3A33022F8B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305D3175A7E;
	Wed,  8 Jul 2026 00:07:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0933CA5A
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469231; cv=none; b=Ogcjko6VZe6EJk52aFyiALsKnuYaU4d+SzlVqoMEx+zl+BlnhE5EVruYsP/jlK8RteJHwU3Xd/0ElZ4ZbGPijDS0SHn9lAsqcapWfbeaBJmU0EPfkn7lsjVcdNzgKNjWh5+2AM4qEMHtXi1iUEFB9w/eL/852GLcW1PGGOZ6pZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469231; c=relaxed/simple;
	bh=vawJBwoRRSQ7Z+CYpJw8nQJq3wDymyLcuoAY2mdir6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sdbESfDBQzQn47XkMl5tWuMFgOwfVMXWNApqYmMWiAREv76NqzZ5sGGvmTj8MKkOG/zLUIaPXDqhgcAbl6pX114iKFReMPPsKTcc2AQU3xO9wgAzlKuaFFUqCfZNMbQ8Jv+bLCqCXjWOM3Gu99seSwBEsHfHL59g7XoCsNuQEww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CJTWhG+8; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4798bea72f9so59207f8f.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469228; x=1784074028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qElOScGvIRJiFGpwifE05EQl/M8pjbubEmFymuyuFiM=;
        b=CJTWhG+8WzLoVapJGspU42nrJbF7FFKzEsxkt4kaVE/7nCwpizLwtujZJkw19rlN6T
         pw1+6/tS9meKu+0zk2hM1ly0UTYVe+d4J9b1YlyGLbQSXYFBlhUJxuZjAiGhNAvV4ZA0
         Mbc09i8o/n6FpDVmX8FcDBKNjK2W0CE8NxzXmg5bq3FEQDqbVFVCfuI4Vixh7lk/q388
         Uq+9Bntrjz109tA1odflZWXNRNV5dTSTUwMJP55nP/sjO4Phn5h8S0TkF/bICUs4hwyQ
         PEHOCwpXTNyB4tRMp2qJvlfS2axUHht1/7Qbtu2Qqu0CsP2zhexybgMnGVGgptNWTpzg
         2OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469228; x=1784074028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qElOScGvIRJiFGpwifE05EQl/M8pjbubEmFymuyuFiM=;
        b=PJ51TDWvRX4gfCTwhiHHErx0qoUwZqOTySAF0mtUYnnpjABdIAlAbd2ze+alyyuHnc
         77wukESWYHmursJsdSnylJHX9uRxPJ5SazGRh94geKQzpmY/6MKg/7Oe+IzkEQ0b/7rA
         5YdRTYUf93Wk0yHD0gwvcfroTyHnmkUgmzBgAHTXmYX8cSDfdppouZTrUyBGxUhKq1tB
         Ez2QbCK/x0WRPmK+KO/e8UPbH2Ao30/tCI7dtB76gmDL9aRe9oUwRBXzm3eSOsGqc9te
         owg2Znjlq54aoY0lBD0hLMKXD2rm6MD0h4+Nl9IIN/QOIj0Q/9XmWG7TrnVC+CziHtQJ
         04SA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ3ij1NFaRVsi7WBoh2Jf7egpk2ivbM1HZVs95U5YIWwJuW6RDs2d16RMNzNwKvHbaIdPCEfAQ20ytoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVviD5pPU9qQg18mtFKlCDPNsXfavdtSfFr1PUf4H0UR2IOwNQ
	F5E/ZSVADabLQOe4rVpDsCrzHyHtPwiFBn3wxzWGyMaBKAawkZLw5c7EHv8YBxvGUmg=
X-Gm-Gg: AfdE7ckPglEc5gMH4nMCN6jOwTwAIHnUdxqEuwo0q5gETkbjsDUxtZeIgxpuWLlgRna
	f+GvSluTp7ZCedKYBWxMi0LB5oIpdQkwkjNuxH8UwvSh9eNzQUvwWC8eBknhoMzR8FZorOsZWCF
	sNYVAbiFAWRvK2YybhaNW042VpN+wkgeclEDy9IixQvXsgDmpX/AbbDd3TAAzDnEoP4vsa2QMr4
	o+gwSJKG4/hfE/6N+cGOzx8Gb5zuPC40UkLlz5IySFV8aNHAdDywH4Mh6heXohMZLUInye7MDJ1
	f/BQ3L7Gy+otLLltx5XWpKa5yLcc9kdcSP6BdYZiQfM5/mOLrQom84jOSvqDnodgSFE3J+S8t1f
	L4hdwcfBnbv75nYPqzlGAKaXUz8jRCNnp78Tv2BAcMrsK8ePsfZ2H/CyeHBayFRxNO7/bZ/2WxW
	LxWC9v86CBOE2ewwTjf+3nHNA=
X-Received: by 2002:adf:f0cd:0:b0:475:f0c2:5b04 with SMTP id ffacd0b85a97d-47de66eaee6mr6441632f8f.58.1783469228245;
        Tue, 07 Jul 2026 17:07:08 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:07 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:55 +0100
Subject: [PATCH v12 1/6] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-1-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2635;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=vawJBwoRRSQ7Z+CYpJw8nQJq3wDymyLcuoAY2mdir6I=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSmptQLankPUIlvPjCHt99mAOCF8KVRiCBlS
 xs6B+fFehmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpgAKCRAicTuzoY3I
 OvhBEACYOZVhGP98Ru8tDiE1XvIWlJyQeiKOZfYf0usCjdIUzQ15/Onf0jAR/pHojJMVmrsD69c
 nu77Q+VCOgjdUisRqZnaP3XM+r1/Hr7WDdWq3hTgZDB5T491H0FBGRvjPYQUyjLy/ljhJFW7dfR
 8Tj7t9lZcuWMKuRJqPur94zecwtdCrk8Zq36DI+P0JToW/Zss7IjNRmoT3KJuOLnkd2KDKE7Dbe
 ZD0snVA127QDKNNEeO5iC3IyJr3wkNrZuXyDtXQa7lduW5UpGyyN9TgeT/wJFn/VTpGKhhPT6Ln
 qgwEf5M5ed3fn4broAMmyxdmN7z98dOjPVieNB32CkKCGt1eVJAWvXXVMzXBwvIyRoBpd5XX4zR
 J8n7q096g6YwPnBftiYkgbiizbYrK04juBZf1Dp7AbffIu7E8w5pP96RcfZq8LWj7R9PMLWyLBV
 gcQe5sLdrZUVbO4jm7Uj7znq5HLjzxwb4hJiMgpYH3ObO0azUufrhnvDOJaliK7XVUPZ7ytmzKX
 Gelu2GtY+hjf+s+833DNp8VPr9YLQqjxbaPRcO4ZDpMNcxWszzq+ZbCdcvz1hABBDhPT2v6EhUM
 VZfYr7e1mM44GC0oYT7kAS46Y11qUY6XJ4+Z0CKPyYRVNapcDUbW+/UkT+szQRHfndEvQ1aYxwS
 msygCRdzGrnJtjg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66930-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D4687208BD

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
2.54.0


