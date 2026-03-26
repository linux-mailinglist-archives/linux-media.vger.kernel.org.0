Return-Path: <linux-media+bounces-57109-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GCHG8WMxGlr0QQAu9opvQ
	(envelope-from <linux-media+bounces-57109-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B41E32DEBF
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A0830B548E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F2C37EFE2;
	Thu, 26 Mar 2026 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2hibFnS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B737D113
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488497; cv=none; b=UtIYLyl11gRh5c+H7R6Iwhu8Udq56n+CC6d/tTL37a+WYTFcJ4Vwv6pK6Jca4PXtq17uFTEOCYkDyTnq6/M/FgN37nj84F7snXK6sdW209Ynj4CjJ8VO1qhP+CqLo6VCfBnUmsGEdn/CObsoJdun8oyWmNWpFcC06lgcdf2xA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488497; c=relaxed/simple;
	bh=we5ywP7iRPMRTAg6yOKxUrxdHq7+NpGw0G97RgZw0gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmNWdcuwjLbdDT8R4srjCkTzypMmQIeS1o+XV1KVrk6F5KT00Hu73sYLmRN/Kwf1yOyNtOsyoR2ymuqiynkmn6gux3HVaYrXoEoF3rPzdM6SkBev5MWFitYHueTQnbH0MssZ1uPC53GQBUs1qJZ2mPrYE93RGdp9hW8Zcj04VrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2hibFnS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso295523f8f.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488490; x=1775093290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekM3vLkgNR/9kVDhmI/IiqMjFO2m+5M/TZ2EQg913rs=;
        b=S2hibFnS7z7UqamuRYPGNdC1kP+ia8WoFCBnZaIoQ1Kpg5ZHwgZ7QYy5D0r7WXKbb+
         e+a81wpJUmiLL/7hysVokUDxOWpDzic6qZWzQn8WUc4Rlrt1x61LcBUHJA4HK+mtl3uL
         r7ivIRJRfy621WKEQWVzjZieu+5463wCyzROYlqyqQwVjF0UbitDWfYxRapHFtFPL6D5
         ABtu9rZsUKElcqRa5+Ulp+Vhr+b4j0gXOnIrMPgp2Cmry27L8bpwp5Iay/rl3JAPCQVJ
         xs/m4+0hZW6BXWpgaP5UsHv0rhtlId04kMYedUna8ozYL//DTFBrDuRX0UuJTd7dWVV1
         E1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488490; x=1775093290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ekM3vLkgNR/9kVDhmI/IiqMjFO2m+5M/TZ2EQg913rs=;
        b=eE2/mDdfW/TfkUSFOQ4SX64Tb/uDzm5DJq4wXque2XRnJg+jK0tVKdKOWFVOfplvGB
         6SD3D5n8em/oHTiYG7CJoWh338sSupoXPMbOI8GEaCiKgHP/ZiAk/RizvbuH4JjpjKz1
         9ETU1k/IWPjZj+X8RAVrld8KkdlTt0o50gOKuUyiYwqsz7b9FLQhv8s1KZVG3HfAcUnS
         NAis1j4g19P8Ppn156ItlF3/LBf0hgoayyVo3WZ9CO2yVRl30KPb53xzleI69kmEtvqN
         K6nlfPWu4oxmL1rNdPLpZJQRuQ8tXNroQ6vmiCmkZj/NAnOfVfmtWBkgSnEH0Gc2m0R+
         yw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZGNTlSzySjGJTB27OjzhTBvPCJMQV+GuULQYFTZ93F9VIetqzrSyOWKSenlMUKF13T7SCDWuyJlZwuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdJsTEZsQIOvRegGIZXEVyjuWJOOgtf9N4UMqC/TRc9+SpS/hb
	XOdxZ3SH0rkOnktUNIazbMLumVUsjuMVfjZvlpYxmPJHvBi4Ros5hJd0neDH3VttQp8=
X-Gm-Gg: ATEYQzzC2gPvvk3HJnAfKJ6jlmrcso2/BTvkjR/3MftORURsBOZj76NMTOuTxNMR34y
	pKCrSvq5npo2qlJoe2VV2kUsiGHZcniBj/Y70LjhT9vT1tT/0hfChM/ed5cTFyd0XmAiJLeRPcb
	Njb28NEZrBy69lGW4mCKNEzIOw2vM9FiYFL3co1IrR5uLpbYrqoAWw8LLZZied1RpsIn1jPiJ+E
	dehjhbZTi7RVwufOyXVLGevPqsQEuiOzWx6VG9niTTxlDoaQpOeKBKKXJnGNWRbib1ow0G5TkyZ
	u5v/F/DgNUXbDO9Y9vwUEJJMGMeFYHRHVEg7K7qtJsAU6iG1iMdgV/MyO+WIHg6oVN1BlP58ZcX
	noqocZFY4dzIsb2ERkRiRElzSz0hQRyOY0qkvAa6S8IwswCCk0VSmCM/KOvli9dMKoEeOfepxP6
	L+VS06FEdbcX/H0l667GyIjC16JLtUnWgw6h4=
X-Received: by 2002:a05:6000:26c3:b0:43b:42af:75b with SMTP id ffacd0b85a97d-43b88a3a379mr8156018f8f.55.1774488490319;
        Wed, 25 Mar 2026 18:28:10 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:33 +0000
Subject: [PATCH v11 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-5-5b93415be6dd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6433;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=we5ywP7iRPMRTAg6yOKxUrxdHq7+NpGw0G97RgZw0gY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvARhAaqvf4pYzE1y4EDxMLp+F/9kmDukiyq
 4maGPZhhvuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 Oh2DEACsXDzvF7YwEWShB3maiqgvopBIILEb0v6l1Q0PD6l5clhv1ks5cyRsWTbbPeIU+sz+gFB
 YOy16TjM329e1NAT21DCjZlumVO6ACXpjLnsf6vP5BFpkdjGFg2sDqcGmWDQO4xTe+a3ISMPhux
 ywmvKfwThxCfKX3+IWZWVdzqvz45Y+KqrAeo9HMvuik05VD1VD6okbzN8i/a5JXv3u4otjCS4MZ
 wIrUoEY/BSMSh0K9PH3fw+2Sd8R8Q6jFqYpQ36zupJcjA9nbwwgbCRF4wcHG7fAuk8IUGo3NJoc
 Q9ng2PWuqd5l/akKr6uoVcod47xmOmG/xVL6K2klmhnVgvXxnD0hfLmcDrcOcyLIpicfp7nNlEV
 RKeMdAWUpEQylJ6gq484VXmpw0LuG2JBhLejnLIQ7Ic4ICwapWuIicqRS2W22IlqmsajJkybJJ4
 GvJk+kquheyKh26OhgB5ZcPJ3xEelzIHM52F2vFCOnKBXh7TB+QzA5eiwIOeQWH1pRUM8TQfhhT
 3kiZfQ2ta7NzuuNsWeXelRDzPw4IaGq2+R0k+63uZ6jT6QuctGJPBpj6epzDLXg7ZzzZoH8rDv1
 OuKwScm9evoI9y0Lizq+wgo+O0bu7CwlR3Wk0vRRdRS+rh2hsifWC4sx0i/iP2kYUyeJmrvG3iO
 OgqDd24FsqINPBQ==
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
	TAGGED_FROM(0.00)[bounces-57109-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0B41E32DEBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 66ea057291f6d..2749895152e32 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5107,6 +5107,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5118,6 +5119,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5129,6 +5131,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5142,6 +5145,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5153,6 +5157,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5166,6 +5171,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5180,6 +5186,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5193,6 +5200,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5204,6 +5212,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5215,6 +5224,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5226,6 +5236,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5239,6 +5250,7 @@ static const struct camss_resources sm6150_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5252,6 +5264,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5266,6 +5279,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5279,6 +5293,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5293,6 +5308,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5307,6 +5323,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919e..24ec3ad7990e7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -104,6 +104,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.52.0


