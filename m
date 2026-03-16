Return-Path: <linux-media+bounces-55829-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MvEFuJWt2lsQAEAu9opvQ
	(envelope-from <linux-media+bounces-55829-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:03:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9972933F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54F0B301CFC1
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80D32222CC;
	Mon, 16 Mar 2026 01:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vV7FIq+g"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1DB83A14
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622929; cv=none; b=SmM9CDkYhGxSS9vLKZjTh+nhusvhhF/eX6T57w3hpTxu03C7evbjG6wUXjjgDYGdph75rOGDgetdVns/My1M4MY2LXcRdYulK4187TqJOo2X+qQ3eNPnSyr65EiEH8+JGn6SdcWrSizJO7/R+8qXwBiSMWuUqp6BrKpJhdN3tGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622929; c=relaxed/simple;
	bh=m3sFOUUGHoLJacVpMtfWXveVT27hc4jump/F3kg6iRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kS4ssc2n1JoKKznfHN4mfatJANFAhlKRxY2j2GgGGoEVMD5G031OlwYaZI4ksnAf38jqxNwJb++/MrL+QSk2tL4wb3wt6GdQ/0M3H1UmA5TNeY7KMe4QTaQVgkuC2FKzYvHTMbKse6EOmLj59FnrhY4hCB5c2PgNwqqJdVOywQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vV7FIq+g; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso17137f8f.0
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622926; x=1774227726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHAPraFWQyyYt02pK8dOnh29cQ9xef2U3WO2DMQ9kPs=;
        b=vV7FIq+gJ0uLMXGEVT6My+PTXLggajJ1WIbUpJPMI3UOGVdvCAfEztCqRUwiTyb0mq
         hE49GG0IvIwHRFd/JZqKD1j+QwlBJ4d0HZX277YIH/YK99wj30/ZYos3CNUXB9av1gLn
         wdV+Cbh/XYQ3ZhJQHX56towoe9SXJwOUMtFdona/Sp6t8qAw3tuOFh4cjBFz7CN17gf8
         RPpj36S6jTG2SUNkXy66NxkN1/TmjADpOmtlxfrhRQmQnchMWEfMRqrVGvkBvwSOamNZ
         Kbg6gh6PomGFlImstGUHZV8yMJazm2o+1B71VendTDBeVxdUTh5mNFYn+Ch1JJ5twKRq
         ZGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622926; x=1774227726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bHAPraFWQyyYt02pK8dOnh29cQ9xef2U3WO2DMQ9kPs=;
        b=SN1BXV+az43PKylIfzkdWMfl4h2vQs1AGzOk+jlpH8EV7wGS0LQeQzHaBoeLCeIbkQ
         2kaw4BEzJgiRhzLDFts+rY1nfQJsFuML9VTMH8U9ud9RXYo7U26MyQNeyDqPbKJnp42c
         fgO77PVJo7E/HNPYIxPeLa/BEYDT1kxBt+MkqsghprTrS9X4GODQokaRMwtILPdHuZD7
         PJwO60Z3jp7n89nMbu+k/Hlb8XyWu4Ca/IOp/3HB7gQSSf2sbaZpDxuyRwwTjuL8sSje
         t1jxb46YxVUSbq2lCC4pbThXLi1EHP5YbsGJB2omnpYuXH7wfJtzzMlCuS702U+4I1rU
         c6pg==
X-Forwarded-Encrypted: i=1; AJvYcCWFmSHi3yrV3WGVq2xqelGUSCW5zKhe7M1QgOg9AFI4Vq0ABHgpmWia+HCg39Y0kUVoMt5idArJ4NmXjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0J3KNrurk8OskCFBPcBMLqSIz0VDV/7ERjkr7dBIZlmTJaiD
	qu+X5lRewhuFZeUKPMEhq8EA4oPtA2QS3wMC4xA8rqKpsjHabOyri37xo/VysshOf2A=
X-Gm-Gg: ATEYQzxW5TZTGm4fbz9YZL1NnmPDmywQfa1FASyDtYUF0AWLyFDnr5yLEYRFZrM235s
	E9W4N6LrHhkbYym/lfCaCH/fX0+Qxopa65bXRKc5/fzRslHTIAybOwamaGG7WtPSdtHy1mOtkJ1
	EBQU2F4fxaPYFF8Aft8izy7Syxqt3x3LqeRknhPIhbNPWihKU8XdYJGHPIztW5oo6jWqcGM4Tg6
	reV6Xkil9dR0k6eKABoP6yY76y26NR+0gJvvKnwJSYL8qxXGWxH3Si/ZRIvt0wPP3Qvo7yj+GAn
	4T45EbxE8iPwMj9kvQdFtUBrhBwiP02tB6lzlPdkG++2vdURxKRwGPhENTF1LYIuBhm7S83UFgi
	hy3MFztt+5COXi76iohZw23jYFsomlkfSqSXiyuOWdKZHsLi49ut8TN8IKjVFO8NjOVADT9J+Uk
	MYVbkvN2oL94WOjX153UnwuTQaK95AoIIhymY=
X-Received: by 2002:a05:6000:2911:b0:43b:425b:ec3f with SMTP id ffacd0b85a97d-43b425beeccmr4439134f8f.4.1773622925745;
        Sun, 15 Mar 2026 18:02:05 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:04 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:03 +0000
Subject: [PATCH v10 3/7] dt-bindings: media: qcom,x1e80100-camss: Add
 support for combo-mode endpoints
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-3-fdfe984fe941@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4006;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=m3sFOUUGHoLJacVpMtfWXveVT27hc4jump/F3kg6iRU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aM2iLV/j8B0Hx52qqO7520LXPDrlCfDI8xL
 o4csPloyFSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjAAKCRAicTuzoY3I
 OmpPD/wJuBUz8CN7nRTPui9VGwGjxMuYAbyN2U/r3FWOAcwsiguAGTdjOxQydYzDjSgSJCTvXlg
 BDG9Vi68RciaUve+VturRsVvuik3bVhLqjH9rjDY0wkVB5VVhIP1ozLkKanciZabet1A+aFxZql
 krHJllxAJdY/4KZDRlObljWI4P08CMkRgv04vKVX5JmTnbUS+M6YFGTEnJCl5qrGTKb4jUdjkAF
 Br8JT+ZHk3yffEBLL+GDMw8omW9cdTHAC6xC7YFTafXb/xsVHOoTKKdCuMja2SDXjSV43GcldEJ
 r4b7adB5t1O+5tioxJKgvKRL9KQHjJQqzdcuEXzxxPmvby4Ti2rNpOnrIltgVCkr3SjCXv8ROmL
 hN96gev9P57foCFRJAn88IDXoTpYDhdbjXABVFXq08Btg21YDIMp3rV6UPidjXcew7iT3RsqjvG
 pqpf8UFGvC/kPoHH5Z4cL78ViEZX3MgsxJpMIxyVoRFQzu4S0TNQS42m1jsRpf89uIZmjzG54It
 xe6n4GG+t/tAmAaUU5LxgD/whN4Vv2VGDr1ivhbRF5NGiIIjVxzdJnKRILc1HJr23vWv0EjnueE
 JpEj+UXL05aOpLHHmjx7Waucsho+6Jom9l3GO7Qr4y/III8IBDBAaURr5jrP5b+HtJSH7lmwynk
 8z+qBlB/tZVXU3Q==
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
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-55829-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CF9972933F5
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
index 5442f981baebc..94a29f439ccf4 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -152,7 +152,8 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     description:
-      CSI input ports.
+      CSI input ports. Supports either standard single sensor mode or
+      Qualcomm's combo mode with one sensor in 2x1 + 1x1 data-lane, clock-lane mode.
 
     patternProperties:
       "^port@[0-3]$":
@@ -160,26 +161,86 @@ properties:
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


