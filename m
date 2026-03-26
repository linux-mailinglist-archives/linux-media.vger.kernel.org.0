Return-Path: <linux-media+bounces-57104-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yII0A++LxGn50AQAu9opvQ
	(envelope-from <linux-media+bounces-57104-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:29:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244832DDEB
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DB6C302F39C
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EBA379EE0;
	Thu, 26 Mar 2026 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQjBb4Im"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118037BE9E
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488489; cv=none; b=iaz9jmJCugj6fZ1429IQraiNfz6mMnbCD9Nxjqs1R7fKB8hAh/UrK6sRAMw3F/eGy8aCSwVhTHnR5dbEe0RkfYhdc/1gyt1+8EMeMdA8JZKA4VK3s6168Thxh8TZY9V8veEuHp1jayOnEIRRNH8Bz92kHUbGfTj8g9ihNqSZ3To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488489; c=relaxed/simple;
	bh=l1UaPhQtNnVW0oI4sGtjmy7qPwb9OiSnQbovYkRWPLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AsmrVWs3IXKunqFWLe7tQH+TdU5H6yP9UrIze2sAlPV9UWeezcMBgEB5P+jdrhC4HM7JstiVezQmTZ1ue12R0x9ebZnnpYUvAgP0iWWgbi9CWj5fJXUy/p2H3qFT/MLWddHFHiGRjMiF2NtpHWxI6RePWTRYO6Qyq39M77jEWYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQjBb4Im; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4870206f73bso2488045e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488486; x=1775093286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLZqF8LZ1KHbfBh7mEmD2cRBLJTgXB6Xg9LkOaYc0Oo=;
        b=JQjBb4ImY7LO0kRLIu6J3l4ZqfB52VjgTuEQv79xJTcM8rhvJt+2U1M8sWeJX9pIXQ
         /ES7k1zZ0jYXDIsCaCe9ckVlVQFLrVxvwq0n8ZrbgsDhqaDxS1FiELF9bFBPlDiStZoI
         Q1Gg6xAQDEW1fACZZk7R+rJLlFpSq7QvTiPl6DJLw5u2ztn83+fdEiCZN1U7OMP+mghu
         jRlOtREzwuCQecnWhd1sNzQMPdm7SB9zfOQtHayNiFWTpNHjI/0KniOjel1axrfjazgv
         NDjrRJt2c6PC3he4i/k+O8QXnIYgLAgb3Zh/Fo/0bj36ttEX9FgjDxO9dpcwjMOG8Zcg
         Tlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488486; x=1775093286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NLZqF8LZ1KHbfBh7mEmD2cRBLJTgXB6Xg9LkOaYc0Oo=;
        b=qLIQeqJUaYeuFxUy0qpnlAjWzbRr9MpQcrOqR6Ulvs2r8QtKnPZ8V+N115Ioc3MaHs
         iQFyAf51iZxXYC5oGY+B5naspXzF6iD2hdQ0kfISEnTxaIVizSaXQN8AreL1LOW3ShaP
         2/dPSTDiumPl/xLvptjZkp2ROQtJN0dBlSRs8jwVZkQtazOUAolH0sD4R2oxF/tqfVq4
         bVx7TsyJLZW2IdyLpCL4RLgecbnafiUv0gDN6+dSfdBPFUDXUe3YT1zWFuenBpjxd6Ro
         sfnUEBiPaTeD3QW/jNUeVV3chdMsxCES9kK8FojLSjPXwoksI/fmulhHR/rl6pcKm/W1
         DDGg==
X-Forwarded-Encrypted: i=1; AJvYcCXPNu/xXYj7/iVNR9taiscpsYEj8IH5a1/WoTheNReE4w6T3LZObL6P7VzDctENHPxkS46/LUCFup6Crg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwWUan7951KfdO77r0YU1BMz3V0SXVzKcZwvRMq8I7hNJNZCt
	WjVJFYQe6ezL66+NTuKSOfX0TDBYgtnEYUIX7NUPl1zXIqOrdc2kUCiG8RkoVWfBGVY=
X-Gm-Gg: ATEYQzw9hfNWg1kHAQcVJ19CHWeYpOhVoF4RSVeInJvqFhUXGQi2oNDpJGPiPPS1xGj
	PkE/QF5EYcIyNiYSjbgiykWIbm0YOhZPjxwpqWwFZKKR35CdY6Ju+JBZkMflWKFkbY7y4Jkucma
	uHDXOsIp8mmly6AGEx3hOl8JDsI5UYa40Heq1df1LEfOfGnEdbZ6xODHK1K1VonAkk7Dn8b84uE
	XjCdwGMrbKsiTe1HvTSJj1QBP6NKG26YseqnAUgNCA6245VczCdrEvI5EmJHU/wXibsoU9OlOIL
	wKPrmTtOUt+RQIftHxUh7WqZTVtTXPXQGGF8IpfoxW+wmBlrzEAuZbkXKC55rQgwWByAFpE1Ofa
	MaI1fNNuXbOmwhlHfPQL8k66/wgMklXumScwWwRrzbALCqAXg7qkzLhBZPULcmlm2XsLItPBI98
	JK6aeFKCUXVLK70NCfl8hl9SQxBxgvNebX0mE=
X-Received: by 2002:a05:600c:5296:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-4871606730amr78932125e9.28.1774488485676;
        Wed, 25 Mar 2026 18:28:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:30 +0000
Subject: [PATCH v11 2/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-2-5b93415be6dd@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4006;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=l1UaPhQtNnVW0oI4sGtjmy7qPwb9OiSnQbovYkRWPLE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/LMEY3nBRsYsGcJ1xHE9A5BEzF5ZrJAGqc
 /Vg/hRHPZ+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OocKD/9uTRkVMRllKh1KcgleItk0W5BpzA4M9o5UKUpBzVFMr/wAkPAFnvhiDfOu0/EJIu1kwl2
 fO6c/2oXWXkPNLFf+Cgg7uI3NJ9xJ8IjGXLB8QniGb3fUP8GtwcXh1xSISUCbEeev0gbUAJHgrz
 kUE4+ax3YzTT4vqYVoWoptsHrV88STaFL3wxdd6HFvfjJ6UFf5yeGKCHQT9rR/zZ3XB4VdHCbIh
 D4Gnst13HqqEEzIWo9MGvAkuKQN0cHQDta3a9LnLakm6FFTa7ITjSCGss7nP3S1HIZ3p/M7MfUE
 Sh48dYWqrqlHdvN8bxwdfba0hkHvKib+meWHJVJVy+0W159xi2R4pIZMbiV7xxq4w1LhxqwYTGi
 S0/QtWfnObRiNQNi3nYQ5xfYpfp5KOWjUmy69M/G/g9PTX+QeQSE5E+60cb9sbFeg9ABqYVtt8t
 BrBGJMeUXrtOCMMf42jBXD4fcer6o19eQfMkinLMXrSstnN/c/knUZJDxF7LfqQ/LU+X3+9zsGs
 POFYankGBWPz7MgyU53x1LNQE1qjZhcQfolIANejO8fFmDEdV7StSJuIc7U8LALfRmAYNvXJYzf
 PaZljMJ624wAiPn52y6stHmhDJ+XX1E2Vf9yK9ce0wAAbtk/3Pa7weENsMJCBxrPxVqQ/e7lhCd
 HViu1joGz/g+f+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-57104-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 6244832DDEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm CSI2 PHYs support a mode where two sensors may be attached to the
one CSIPHY.

When we have one endpoint we may have
- DPHY 1, 2 or 4 data lanes + 1 clock lane
- CPHY 3 wire data lane

When we have two endpoints this indicates the special fixed combo-mode.
- DPHY endpoint0 => 2+1 and endpoint1 => 1+1 data-lane/clock-lane combination.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 69 ++++++++++++++++++++--
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index c17b9757b2c86..f44138f522bba 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -148,7 +148,8 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     description:
-      CSI input ports.
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
 
     patternProperties:
       "^port@[0-3]$":
@@ -156,26 +157,86 @@ properties:
         unevaluatedProperties: false
 
         description:
-          Input port for receiving CSI data from a CSIPHY.
+          Input port for receiving CSI data.
 
         properties:
-          endpoint:
+          endpoint@0:
             $ref: video-interfaces.yaml#
             unevaluatedProperties: false
 
+            description:
+              Endpoint for receiving a single sensor input (or first leg of combo).
+
             properties:
               data-lanes:
                 minItems: 1
-                maxItems: 4
+                maxItems: 4 # Base max allows 4 (for D-PHY)
+
+              clock-lanes:
+                maxItems: 1
 
               bus-type:
                 enum:
                   - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
                   - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
 
+          endpoint@1:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            description:
+              Endpoint for receiving the second leg of a combo sensor input.
+
+            properties:
+              data-lanes:
+                maxItems: 1
+
+              clock-lanes:
+                maxItems: 1
+
+              bus-type:
+                const: 4 # Combo is D-PHY specific
+
             required:
               - data-lanes
 
+        allOf:
+          # Case 1: Combo Mode (endpoint@1 is present)
+          # If endpoint@1 exists, we restrict endpoint@0 to 2 lanes (D-PHY split)
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                    bus-type:
+                      const: 4
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 1
+                    bus-type:
+                      const: 4
+
+          # Case 2: Single Mode (endpoint@1 is missing)
+          # We explicitly allow up to 4 lanes here to cover the D-PHY use case.
+          - if:
+              not:
+                required:
+                  - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
 patternProperties:
   "^phy@[0-9a-f]+$":
     $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml

-- 
2.52.0


