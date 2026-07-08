Return-Path: <linux-media+bounces-66933-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qxGlGHWVTWoc2gEAu9opvQ
	(envelope-from <linux-media+bounces-66933-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:10:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFBE720908
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:10:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QwW4Ib41;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66933-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66933-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E03A330947D9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E723E214812;
	Wed,  8 Jul 2026 00:07:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98429405
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469237; cv=none; b=ktp0tJfaXmsDsr1uEqP11c6/Gpwc38vrKrYp/n7BLc+MA63EBQisuXrAzNi8jVS5zX1CelZtP/V5tiAM9YvIRcQlMEYR+pUrIUInZbt5CgcymZ6r59RloCUBQCFhDeT3c/33ujGdaV0t4dLwkSbrvQGcvLA/u+OmuPm45EjBxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469237; c=relaxed/simple;
	bh=s55OzTTyx4JFc6OFNhbSkeBARl7vZOZjP7szqFRTAIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pldvmXG/AxgUWJtCGupPnxXUuO6O++taTEQTdRZr1NTQX58QwWRhCjI8R1zNaiWO2Pyhn+BCi52xxtAYPLtt9XVuEZ+yneiId//N0eY4hjn79HGI09jI92CL77NKzvWzvATNyCHg7W1GTkZK/mH6Kpdt4Ib9sBZCXCkoVy+iQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwW4Ib41; arc=none smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso50641f8f.2
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469232; x=1784074032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPdOZb6jlCs+PFV9PlSG/tALKVa///KuSVuOG45C9AA=;
        b=QwW4Ib417LSixXhNE5pceTl4MaO+pH/UtEUFFQAJzjp/2EwqS13UgF0sJ4Gh1WtIxB
         N48V+U6xCiKGETzPslfVZgWjbEVx4IcpNbFfkvfs+ynGO9KH83INsCXUHUDyj9MWR85l
         x9pewlwUt352ppWrJ4S2eIF01z33PjXW3EKg2veQ5582i7PFleDsqUpFOeqZJY1I39CZ
         gWu/cvpcC80RBWK2GawOxKuz5Znx61zKuFmeCVGu/l0+epACLSQalR2TdFmdr4Yl7I7v
         1Ov7SllP4gWZQ4D08DHIko1lEhH9E4R7pXmWfsYZiPtDamozPYvS7OjiRn3BxbkTkllq
         crEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469232; x=1784074032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPdOZb6jlCs+PFV9PlSG/tALKVa///KuSVuOG45C9AA=;
        b=CVV5cSYjJWueyXqM41W6vRIgw/M+H+odQ6qgVDFP90NLVQahdXUx4B9BGyOn1YR6N2
         WbbrGlvt0iuelY8UNwWMW5ze8KRVMDI+wWhm/BaqRdhWh9YvCuZu//rCtultuHGtGXVL
         YINskl0ABxdODL9xMTOFu28QulF344R7Y0sgEDj1ir3O/6smwbbgSCovVgJD+jF4BBhs
         qTIgbu7tYLG040kgrq1uPoTpoXaIHIV3Kg6z+9ZiX4lSq9EIfNdryIfgJmCqirYebtxa
         HepmBXIZbPimPalyu1leSftgSmm2VOC+7rvtyjootMePMc3ez0zWiCkm/iZKyyGc6iFu
         3TlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkqLHE51JJ8Fbb/i8kiLnIBzi9KzmB+foCHfXsoCsFhF+QNee68uE3lZ7Xjp+l0pqnfEyaeWZIR2U8DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjCxgx2haR4AuL30A8FkqPclrqdCjo4AXemZpAc5hcRwzmYcF
	Mnj10Mtuea/zTR6brxF7+TO4Lb9xLQP8EYxORTCbho7w5XI3m2hjbA2rOL1M5nIGoyo=
X-Gm-Gg: AfdE7cl96tjvR0cxnJ1vKQM/GWE8FcDO/2pbiERuAfp8VLRc1VgkaVdg+ShMtnfiug+
	2MRc0Byhg8MmYnQ8BLQx5wMKrE8B+6hh5lR6V8lfNimnH3PWEKaWbm1r0K5KBI7n1M9y4mB0vK8
	FV62fk/IAzlP7tJpDUd8PJksqsi48wEGXeFoVqaUbVnIM/rRcwvEOL7P2KmBC0++WBbD+1+cKRz
	fg9guMBlQlEfUbCP+qUlqpux9+5Q8FbSAhRX6V5FRuAoAbsuC4ZCCoUcvUm/SbwRtgC7LAYB0Gl
	0Fr5oWEcT8h42cu036QagWMFpLvqoEtf7BowU6LFpEQD/zN3qGjBlJjbHHIRJVcG0EhSiFSg7vK
	6GzPxZLrUKpMBF+7IhfgOVI3/pFTZfdAPOgj6YwJR/ZHpjXJ8boBkw1AiIvmAD/689FyoLpcXcL
	hSkgE5sQRHT/DaY8HsdNm3Kew=
X-Received: by 2002:a05:6000:70b:b0:475:f6b9:5898 with SMTP id ffacd0b85a97d-47de668eeadmr8029910f8f.1.1783469232315;
        Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:58 +0100
Subject: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6263;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=s55OzTTyx4JFc6OFNhbSkeBARl7vZOZjP7szqFRTAIs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnpOULJM4zeXtSsdG3VgnKgEyCSvqOMuTjs
 ippIBikeLWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OhsWD/9Q5X9CCq7I3a1PM9CSjJ1aQxwK3triT/TIqdjHpccH+cq0oYHiaGqJGR70Mnr5kHPS/v1
 58WXvwGDjluui9OOIh36uhQR3r7syRGOERWl64nzjygIrKVfnepozibN5MG5vuYkaaaPh98B6g0
 5qkNivBLydojHVdhYNktk3pvaSGEvC+2BSQk5W5QQ9Ubv/aLf9oswdEcoqn1OoTPn1qFSCDYnxK
 V3MAbTHw76kxM4oxX0/fZ8oEkJEHpDEmXntvZ/91MI1Yz1Y/L6weat0DKllCdfMUqwTCb/c6+ns
 MKW5ODqVwdFEQ2HJL+vwt7AUmN+YMtglc5YCS9K8hlMKERfMK3taa9eKg1ows4mpcDm8NpliAZc
 HJfG7IMnc5BdLqTIktQYvPjvwrhf7zyHkU+xWVfGzJjPWR0XUxotCmwH6AsGRc98cxwhj6VjG1M
 3qrnh/DXQpiweuyLOVE679Qu1wBFpn8GtXPxqldnYBb/siijl4CMHBZfF8MswxGV7qMGW+qqUrF
 3JGIlh4SrHH5BcSkIXy/cbaC+/D7voQ4kdQKZNMT4aQJVp4foS+AF9LPYBYZQ4gDuP7SiFpdx6e
 EEdYzUjo73yGSJg+f+AH6/e72ASroHU3dKq70sDD5WPqm0z86nf17vT1OHGegBDzTlWV//h0P7u
 UaZQuFGWxSDGu9A==
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
	TAGGED_FROM(0.00)[bounces-66933-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACFBE720908

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 95e655a8b6aa0..e814a96953b1b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
@@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
@@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b..698694d3064ea 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.54.0


