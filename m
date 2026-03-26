Return-Path: <linux-media+bounces-57105-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6F2tNL+LxGn50AQAu9opvQ
	(envelope-from <linux-media+bounces-57105-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C7F32DDAF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D1333056669
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD2137C0E7;
	Thu, 26 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0FS7gpb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4D37C0F8
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488490; cv=none; b=ieDyvJvzOmB5dI+yqmY8PlYExq6KeAUqg5jCxuJyupQ52UARHEogpyisSS61xHVvSp2fwXtzP7WG2ZzJddQl9KFwvPMxBw1/PkN2IyJ3GVGCRFsnppomqoAjHh73gQLP72V3FP/DBuQa34TLg+8hD8ImT2hilvvvJ4f7PHDzjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488490; c=relaxed/simple;
	bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5WmuYlqOIfNEbaDV/1LgQaBeiQxqR1nRMHPalC4ZSk50UKAY1cfA/E+Hb3qddpwU3PY7G8W2W5RkA7TQvEc2rB7GniJm8YmB7fIYdSy3jO9JZEfE9QOEeBtmaJDc/Tvb2aH0R5tRQULhhD65n/fBNtTQvTE9nIG07TmgczRgNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0FS7gpb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so5277625e9.3
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488487; x=1775093287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=c0FS7gpbKxS2+Xj8brsaRetc01HMQlP32vMUmD6UIpvhCifFbTq667FgcIIkjPuaLx
         4owO6xI946gRIKuDKObsunpfEUssxPunoZpIr+fnnM4Tq2Yl5+4ClPvS4o9hvu894LA0
         FEtj35O7R2V+Gj138aNbltNjAaXXhvrtiVvrID/WUiQ7qyguczAVzew0pYd3xqzlNq3D
         HAz/Pdc+6DjkpoxgoBPI3sGe2agMHggxE0bGGh/WPD/HHvCmcnS+W+09OaliTItO8tJ+
         XFR8d0VqrB+EaMMCvKljDexCwpVC1uSgRYqQ0uSdSmDCVEQgC+zOTTy0NBS5HuwkEDGv
         ZE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488487; x=1775093287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P21FDgbBj2GIbBZ7VBtv5L9RLy5tJ4WiwvtA0ou3a9I=;
        b=dZyi4/sBo8ghU+i8pA4fEm2EFJQC1YG5GASl3VyzvozpWeMOKeMG0ZYKJFBvXEfPAL
         kf5IuM8yyxtt4YHngUKYp1C4MyTek+tQfI6BezdDYOj8C2rdfVSGQmzu5wyuG0xSvKOb
         XISd7mdj/wyzS4xaUPKhZ0fSw09UPOmzR/kw4MdjUrjDftgnz7JeFjx+6j+Gt4nmzQ7d
         1vD1nfq2RwpXUgnfMB9FC/VEK4eAgPJGfD+JNqJcBfziKHW9H8AJpZ76eb0kxlAzR2G+
         bDllovRKFWD+cxfWkiJjVPhQTeyEJitxO8iyPADEcqMwxTY/NF5hmGAS+ipJ+6rtUn37
         CW7Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/mxli9STyV1ykvQdRx8iRj0h4jxIuHrrjyinLpPClQJHARecc4R3Vmf3ws7umAKWD0z9CdaVbvZk5QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuko4MmOudfNKCwfV4GOAPw8IYsuWVlhgaBH7TXMbVRBxS964w
	ia1wqhwN0sIdXyk7hgjLWBw4ft/0M1tSsOSAgw9PmAbpj9dGeLcRfduzv/OkL0c1Ejg=
X-Gm-Gg: ATEYQzzmfw3hqDelxjAru/MoTK2isv+Qjthj37R4asF0YAtX+DNy9GCThFn1s4It8ok
	AHWeKWjnQQwYbWQGOU2vOj7cfYGZhve25leFziCKRVI3hZv7uv5FmW8IAd++dFuRQYebSWkJH+8
	34I5cszZoy4Cz6NV/QaP9iQkO4inxkYvP9EqfR0EpeWFkHewjPNX5y0sJGumEnJH3KznkLg1oRC
	/vA8g/CVF+oOVyrbAEPvrULnuQyeAg+mVF0dYcKOdUpv9z9Y0c+QXnks4+4Fco1YypKuzwAYMsg
	AUlLHxaCS6OiAJOqLmCNexgYP8jhFl/DNYCbsFJHg/R+vXwUSM/FIobmT+LbIFOHBc+rB0WPDAe
	9m2cJU13ioWL3O/rY92x843CVZ3jpyqTskE3nTstIfDH73I+kEkBQfx1/xGU1cuz1gcTN9vyOvn
	PnBi7ivbaRhWJ1nsp7nc8Vc2LMJQCUc15naEc=
X-Received: by 2002:a05:600c:350f:b0:485:40c6:f528 with SMTP id 5b1f17b1804b1-487160a213bmr80479925e9.30.1774488487128;
        Wed, 25 Mar 2026 18:28:07 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:06 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:31 +0000
Subject: [PATCH v11 3/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-3-5b93415be6dd@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YKW1V7XuMJ4AeReIm3Qwtpj6WjYoSkYt9XgvGuaFoSY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIu/t9wn0hjOdBeGp1+ZXyrdnpvlJZRgwHIFn
 gVTWXwfNdGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLvwAKCRAicTuzoY3I
 OoLtEACy/NhZw3B+kOA16FZWbXQzqgmtyi90H8KVps1zpqy5P/5Wnx7Yyhack7yH/S/WazGWavk
 nu1rmIM5HpFqDEFTOiL6dtQ/4UZ4mr+NmyQMxMDRkVNmwDRlUC1wOI93eYIWl5AmF63jfhytaMl
 buqSyEga2A5R4VeocXLwPL6YrLsdYBjo85PJt4NZpL+8sMq3iIQY4c214oQ0tE7wRlYzARDSnNs
 wWs8/7XDsgC8kiXOC2X42nVFbEXyv8GROVnSllMUNXtyt8BHNtryTpmM1ecdiRa3fR+L+fpxs+/
 sxTSkko+IahfRebJPkqGcAqxlbtOz9dTUuTmfV4/Qo1ZwVAr5H6v55byB1ocViBNKde8fyq40tY
 CB6qHjT9hhz83YYLMAR9F7M6mWNc7T1L8fdstLDnHVb1VdL/r9I9MUHDopr0O0pu4ozgS36Uj9A
 Bkw/dG9zJ8DYDRRtFoWeBETVto7aIeA6sney65DtIAwgjpSA5koaVbS6JNRd9AKoeqGy0vTbunX
 MfdzrV6tsl44jMEfVq+Xk/Yag4aeLwpWLSdAhv5J/FInbVV30WgysEMIK4T2zLqYfgFHAm7Riph
 r7FZAwrJ+xJNNZSfDljO3clL/iRFQj7K96i7NbD17n5qPEW/IIzQcUL2SDj9bBBaymXEhSUp7FT
 8GRl/ih9TlzVCdw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57105-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 91C7F32DDAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index f44138f522bba..d2763977a494d 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -112,7 +112,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -422,13 +437,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.52.0


