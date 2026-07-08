Return-Path: <linux-media+bounces-66931-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8/xwAwGVTWr92QEAu9opvQ
	(envelope-from <linux-media+bounces-66931-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:08:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA17208CC
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="Ol/T55on";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66931-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66931-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 38A7F304D7FD
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D373861FCE;
	Wed,  8 Jul 2026 00:07:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5682864A8D
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469233; cv=none; b=eCt6aq/mWWcHDrhcjkdrNKh/SXx6dWG6FYi7hrY61Mj0CsUGwz/LKiYT09zPAPpj6XtbvkAwGxd1bMZQlwD0ovLnzGDRy+wnHAdABN6n+xNfHk4XRYo/SnQYkS1t1b3rnjuZFn+ySq2ACBgtFT1t5m+KlIcs1lpJCoAzT5gNjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469233; c=relaxed/simple;
	bh=wsekDSqtc2irv3LbjSaet4U9i/PPbu5gsTQ1w3nEQro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTNWjd98lQYiy1HJO6WPCg6/cZsAjZMrHs6jUWMJ9x1NeTa+eOCKuwBhSyz5inq3bOGVJfrhu/ZYBg6Ne0O92g3NWMBoB83LjBRKP2+/HowW8EPJQ4IpAdb+nSdI5CeZLuYyH1k3nIZOCARhzC/2JZ3vV2qFLLGuf6ykXpRXsUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ol/T55on; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so634155e9.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469229; x=1784074029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AoiAUK+QcuEkdSkDvLTFtpL6xxIYZx2oHXvQkPFwr9U=;
        b=Ol/T55onu02HBpfUK7rdz5mXi80MBW37T+ptUwjVcoIqs/Jne6LcVW0YNp6pdJ+yEI
         UhBuovF05fxrK3TJcVM/6eaayUYGlWBI5cE1vmvA0Jf995KzrPiEtG8vP/pwoOqclc/C
         PS2fdxxEDSaKpnhFYhoxDtmJnAqG1O+y3mgmzG33H3Syeq/2BlP3pFIwCdW9Z/wIT/O+
         2s7xnUqG/3wpiFWe5vo7msb1BlyXa8RgaEZctCq4NDB26P1b93H6Nkif/KjQBjaha85i
         OSxu6aA8QGnY1n/BvJoBXhN+BZB/lXrzAM1y4Fx3aUUSpwIbrzklwBCdXWWmKAmjAJnV
         jZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469229; x=1784074029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AoiAUK+QcuEkdSkDvLTFtpL6xxIYZx2oHXvQkPFwr9U=;
        b=PK5/NamzGhj6a9xgO4Qk0tV+KoxAxvnTYBe8Ci48c8sYisktxvHLQvHtSo8RxzsVJ/
         MB38ZvmXdwPhbDMf4fn1TkpCI59u2G2AM/qqAEbco/9r+lDVtRxflDNIbjxqKhCEOXzt
         Id5my3iCSsj/duhYDi2VgKiUMV6QL+woP3yXevcnxne/gcMcQcVn5CfRZu6ANQPh4fnU
         aP5/uL50lelxsoc25F+73uM7rRdRLFqKDnHl+948bTV43/pi+TIEAD5IILgZJXvFiusl
         fouLw/RdoFyM0QgAGCqfG9OCpySyZwni/jrKTgM5QZ2pNzUXPFZKsajmL65GE+1hF2rk
         qzKQ==
X-Forwarded-Encrypted: i=1; AHgh+RohE1YpGZqB5ya25UCQVZhjmaZG4u36P00PenusKDFuJLQ20gDQ9Gk2l1Ts0GL6gv1xtGR8Os5OHEbkmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrLdPKrzQShLhh3rEpaJQ/dRfrZv/hC90fXvXMGpnFPHvOopJG
	5BPZ9Rl/3ethe0kxguF+9YJMr/OxZL76kwwbban/y2ZgWlIo7Xn5qND8teg07tNC1q4=
X-Gm-Gg: AfdE7ckwEv6gR3VYqCwNVMP62j822fUb2IRsjQXqf83P355h7S/MnfFxIMj+nRvBGx/
	lVupeiOioLG/YzuTFC1VwhUNjxkR+SO4BNJCTX78IUMz9efCEWXvpHrs7qvhqNPIdyffT7TJ/7r
	8hw2tJhuguO2+lakJGm4fwW3zjaN8enfOR+uRj7UqZyXWDXokNb69Tt66tES/iPMoCAuyMEfaT9
	QqasatCBDgxIPrv4Gwn6z9LYpORu9BoRxgf7EILG5zEARBTgvAdWMdj9Vv1YpxUrf+0NsYGSsXf
	2N/dKNlBIyJrC5Aqn17lP4fpLjyiWczFvbrdlqNIFXU5t0ijw7N5RbF+z3BBpidmf0qIFbra71f
	G9gVIE5WdyX6DsrK3Gk2NDJ5kNQVHkApKX0/2lDS2Md/uYsM+dSCg58hlEVedyeXKOl1lh6zdQM
	2Awy3Hy1IsY8psP1nkYAJes2c=
X-Received: by 2002:a05:600c:6094:b0:492:28be:6098 with SMTP id 5b1f17b1804b1-493e68bef5dmr593455e9.11.1783469229518;
        Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:56 +0100
Subject: [PATCH v12 2/6] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-2-f8588da41f16@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wsekDSqtc2irv3LbjSaet4U9i/PPbu5gsTQ1w3nEQro=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSn3jyqM4YAJUbOEsf5SO79EIIR1f8XWFwcE
 gy8NFoifLiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 Oo/2D/0RNoa0BSf7i8yYyNmVniR4mS+IDbtbgOFuXoyHiZx41MK4tm01leIKX6hol8n+nda1ztl
 MXYXE96F/JlcmqfR2hupOiPCE3909E/oCOrGtcsEOReJXGdCYVRiJT/UrLC1nilVm+QmoCFdDDP
 do7zmfoW7ohFRzzBLwYlZpmiYBHHwT4alAoPn1dNu9HzrOwFCUc+26G3JxonElo2wJ6uudClChV
 neIn9iJlwo54gWfzVZPcOdhDCztTERADaoRfPwVQPEhkSBpX3AClqCc+p7asm1E24rCI4G2Uc2U
 JPZMkxofe88JCrFE9ZD76gVNs48Ijft+KLSP/6Z7XXG8sWeAg2pSH0WcB8WabRKVoHLUGzmzLif
 E7pDzWxKIvD85raVsyo4CIP8XfGltsLUGoFyMtlCtFuvEZgkDOtsS/XviqI/OMgd9iAw98sXXiZ
 FLvEEgC+xJzoppfp6Ak7vXsB4tfKy/869lffEIogEwtu1LksK4CG/zyYjVirgp/Y6TYFRFgrb5U
 Vroj9Bq6SMRjeQLe2hahJ89gc0TWvM0RY402ll63Do9HoZJhe4B95J/aC7hW30+1z4+ye57lgFU
 hfCFNJQhVuVkjyrtFJqOyWCqu9dDmrhdHsLS8UJj9rhb02wImCAaBEIcckxHIVbEoZRSXBsI0tO
 K2u2jY6SOUgWknA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66931-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 54DA17208CC

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
index c17b9757b2c86..c4454355f07ea 100644
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
@@ -361,13 +376,10 @@ examples:
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
2.54.0


