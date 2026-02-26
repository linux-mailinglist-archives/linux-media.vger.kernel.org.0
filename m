Return-Path: <linux-media+bounces-53519-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEj3JYpaoGlPigQAu9opvQ
	(envelope-from <linux-media+bounces-53519-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:36:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC01A7AF5
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B17D31431D7
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1E93D905D;
	Thu, 26 Feb 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9xm1AcH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6510C3D4113
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116134; cv=none; b=kQ4P+yXD0Ydd2HvRN+a/+cWZAdFti3tA4NJHQsH5Fcr1XdojYsQM9HtiVuKqTHG0y22itsBMKlBnpl5yM28BC+gFGFzyabzAhqnMdNa7mnveo6fdWursE6XYflKUR4Q4x+zaCZqjFrTQyqnWbd6cyVBoAd+XsKs1ZL5j6pW9TIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116134; c=relaxed/simple;
	bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kowbzmgPoFUhC8BQ7S+wu9NZJm0N/X8FznOUOvb+SyedqzfjGcPXBUgMB/geX1YRWO1mjKABhoAbdfV66PUV8Z4lrRSgaL20/r7YtOSxKsneg0cuWjCJpFdwxfVrQbO+4LKszES0e7rOcrGLrwo9fNGKxeVfru++RlLq9uzl9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9xm1AcH; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-436356740e6so969811f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116128; x=1772720928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=e9xm1AcHlxMX1N43xyXA2PMfdPacnmLvorhVdKCLqdrvbuh+VevRENkseG4WLdVvj+
         Ynp5EsSLe/P1ZNtZyMlWzHYZoRAjnB9LSxWcd5POBelfzvCk8qDPyjbuvKPgqqYZ6wku
         kxDeaEZoq7jyPWpUkK7qu+8YuhbZzRwCCRZ+UWn7mpQUpc6URs9hXhCtoV4wpcPIdz1j
         yq+nwIwBvl4gDjeW5bscZTNLbMhNlebWPTm89cbwxnjNQWwScGzsNFDZHLFVYIJs6GI1
         m1Xx2Z2Orh0hQEuMoQ+wwRDsZWhFggpf6Us/nWFlMuRSr+93l7EPJXCstkb4NCM7Gdmw
         lQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116128; x=1772720928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBils5t80gyOQ06en6vqctPVY+b40EmRNjQtdblnFBU=;
        b=iJCWLH/0bXy8x5vLzYSwTI7Bl0sRExhd+dVEp5KejJY8YVRn//uTZ2NQlTQ7TE1q9u
         uZCepREuzVSXU+ckY7Ito6cFKAI4lyQDdvROtl8YibuWWo6trspu3Qeydy5/6OHj2IW0
         nWVwrmM78u/EsP+rJrymf+/gCm3EWnXJZ1P+Q7D38rVI7hrCnkO3ysmbW0WaLK8x20bH
         1lTqAUAl7WT4+C7zBEAmlWKablepsoC3qOZcDA2dA7FnwN1crGmyrgyzWkaE8cfeCA2H
         Skp9tYFrYvS64w22dQIrAN/sMaRs5s8MeEtXKdAUG9RysW/i9jXswWtnYmiGWDzfvX1H
         /g+w==
X-Forwarded-Encrypted: i=1; AJvYcCUKLGgL9Z35W5xW8B0NoEEI5P121ymt1zwglg0dNdeNcDwMSLANsylc60mOcLlrqMHVOhSs6RplvGRcVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRuLL5K0HQoz2ZZluDFm/Fh6m4ZQKh7e8TjO49NKK2EWbVnB/s
	4hxIP3sGub0CaoGV6lp8P9syQMsOoS/riwKXUk7CSA4tSiWTs4sewzcPqy8eADLsh0I=
X-Gm-Gg: ATEYQzzfLhHxQLBfmZMGcgFevt38gsdieb0ngEVu6FdWuzyf9KLU8HicJA6llSKy1da
	rAko2w3HB7TYl7eQYWHeQSMZCzYayDlaLT3OlbxAJbJB5Rbti+n4VaKKFVK5UxLJgUn9wt8NJFV
	t75P3KHy4y/Xr1MWKv7pe7ao9qC2KGb1AEBHk4H3HB2fGqVYpS+eb/7naU7dKb0lg20zn7RlXQq
	gRI1ldl9wGloxbX3IyWZgbKPfzsKFpsf7ArtRjAotAbx9NViPAzr5lbnXV+MSZ9qDm/7dSpej4N
	HYduJ5G431O/5wyfwQn37q/+LvlqqFArbPO1+UX3+s7AQ/huak/MRLQmmyPqE/dnAIADn94B77z
	MvyScOeIsbRapU60KeVkudD3+IjVCYkKDnGogyntS6YAkVXJ9UeuaKnp7LSJpxl3jDDesa1MSpy
	D2uf81LMnIdpAXhLz7x0IPaVDMnUvVb91O5Cu6Lln/dhr/hfLf0kk/D19Dgr4Kg0qE
X-Received: by 2002:a05:6000:4304:b0:435:add0:3d68 with SMTP id ffacd0b85a97d-4399430088amr8840100f8f.58.1772116127466;
        Thu, 26 Feb 2026 06:28:47 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:46 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:44 +0000
Subject: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add iommus
 minItems: 5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=WJDLlVX2Xzk+wCJnEgTtDLZA4OHjsU9S+VdRID0jrM0=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGmgWJvI7Yftmj3tnq2NZsEYjkfrAv2WPd9BI/DTcJOV2ZZKo
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpoFibAAoJECJxO7Ohjcg6RjIQAKSu
 pnlNPCH3LuCekIzc68sDIxfaU30BrwuGyg3baSla8/vw0tDXfdKOEoyop+TR/SzFNdMl1w2e2qu
 onPnhs9nJp9NjN8i0NIZFT3VjcxbupEwaiuDz9Kb8hDT68JQiCAihwCLfQk8PYUHvUxhrum1WzA
 aCV3TR2srBdbWo/b3+bIHMhHw5g/WKct4iJUoXyAl4zU+1b5fQybNoSCp9vFUUa89pCmA3nCUGi
 a4DBeh9wwzqBGfz5uzEdMmvPFJo8TvfI65HpYK8674pYpPFWnwDfYFEnr4B/EAsT1jNbHGH+j34
 fFtGq7Zsk6kep89GkLjDx39YgAO/UHmdo4FURk4nvgjzphZf9S5aLoeIbZzhoirUasgw46CJD4v
 hgxRWX1u88wPg7U4xwM45uXkc6d7hgDcQSh+m89o27N4w8ZQxn4oW83qS4kdXrPcpT0iMuYCqGq
 uYz/IsdMlkHK8Xolpvt+QIDn2oGv4OzY73m1CSMTBV9tZVlIaF5Wq43zXKnzkyjry2GOnoGIRPL
 4GlPsIJci1jb96UwCLeNpSzTugzWde6fsvnEVyPlZ0LiOHgnuYB2ryJJEneJMHhd0eA0JI3i4nQ
 OYBeoO8nSPvljxipyiQB6WrntjGd4Cwf5FfziYZV0Yw34eM+4r5jwO4xcI5qNUh74zdfy82JHy5
 sSm++
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53519-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 5ABC01A7AF5
X-Rspamd-Action: no action

Specify a minimum number of iommus entries. Currently the schema
requires exactly eight. Add minItems to allow fewer entries while
retaining the existing maximum.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 8dbaab16b11d4..f406cf6f8f9c1 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,6 +104,7 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
+    minItems: 5
     maxItems: 8
 
   power-domains:
@@ -404,11 +405,8 @@ examples:
 
             iommus = <&apps_smmu 0x800 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
                      <&apps_smmu 0x1860 0x60>,
                      <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
                      <&apps_smmu 0x19a0 0x20>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,

-- 
2.52.0


