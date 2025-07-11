Return-Path: <linux-media+bounces-37491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE3B01C92
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:59:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 470C91CA6735
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA422D46C2;
	Fri, 11 Jul 2025 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzhNTVeX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662D42D46AE
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238689; cv=none; b=pbn7onhPSKYccceG/W7lQ1U/BBMsbFWcVBPKFzbT10vZ/wPbFCBAJUqcp0f/bryCOfJhBlyKi0tL+mfqdOHJ6LlYsxSsoKwg9Jnp4fb0T0phvXK3t+5E2+HIFm5NsTUDCHBhA3xefl9HFZo0FjVWRPYkQhQz6FijtNuWAQFtn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238689; c=relaxed/simple;
	bh=BKvuiOBqgHCQIm3MGLLe9t9yZBDaLPJiHTcKkR8dS2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2KrwLTZxkx9E+OMKsV1A3aeAmfFNS51B3CjV5uHO39HoFygdAdAmvbjMYyyUCJrQelzAAHhF4/BdWUUhsEIGy19YQyPr5Hx8ayv/RvdMtwUhHe5Zz8K4UWhA32icY4vEtqfahz9ILPlO0YPrl8WPBLHUI3ocVYlnlweAKdJ9Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BzhNTVeX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a53359dea5so1246618f8f.0
        for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 05:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752238686; x=1752843486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWjAPYRuv78L63LZKDTf1ZKpw8MclurSpz8fHMfB2Y8=;
        b=BzhNTVeXmtjNJvpN3aHCt2plIxfGIWyk7aNvnAkbVjy/b38RS+GQluPi4Z4rtwGeAz
         IKLQB9OuV5kqFzGyxduGcEbsKoygoaaGMmTIUfpeDL+cBZonTGHfdelnk0KLxqyuAj6f
         CDc60QfzvFfyUzSNirRDwcqr8CwF1eeT835e2fWQ/2u+986DYM/+hTR2N7AAdErK1gpI
         aHNCFcmi5rDeWqs2bo4LChKg9fiyKLmH4TdBJTU4AJUX+1P4qJE/eMbVHdWp3nynXJX2
         +5gLidJarqfI/Lu9zddwrab2QfMCRVLEjvwIlczpjWWLZD9rdkerIfy6PuveMPY4M1Xd
         gMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238686; x=1752843486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWjAPYRuv78L63LZKDTf1ZKpw8MclurSpz8fHMfB2Y8=;
        b=OBEFYRMJG702c5QNShXuShwjI3Oh8Afk0V7Zts682CewJpp3SgKHwp8iW5mPOROLfC
         8O9MH3008IX8gZoq3E+Aa48NgzReJwhuWtXfe/e8BXmdAXpKTvK/H6Zmr2rZK4tQTn7H
         gx9KEdwwgSp/idT4iE1xE1pjTy5ZOOR9EcyA0bU/t+1LK02PC26gINWcQ89Tm9drGer+
         Vy0AjDe/g0BSmOqHh0LvKYqMGCt4BvvR+OY3ttjR39pemr8G+CWHJCwr9VqmtJAxl+rq
         lUfYvwb/GB9YmSt3GIInqCqMrlglFjE+moWBk1WlBGc+KdhtOQ8S+0tDHPbyMMNiZLlp
         WnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQccJZTl9YbNpgueMxhOpwEI1RUaleZr8MiRGlk6uWnCvCpZoym5UIQYlJN2iDB0y3DjCNVLSfZnTzgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkS3s1jFzDetvZbQR9R/Z+kGGeWeMPP8+VZhC/eaHnfYsBfwpR
	J9zlhAe6LcfWkAePLeUN4OxmgPdhNEl74L8HGoYmS2+cJ9z4JImcMLt+HPuvIU/ZnOo=
X-Gm-Gg: ASbGncs3KcjcI+yw0ulG7Mj/oEqCppcWfdP9vVZROXoTJsxQeZMq+nxqWBLPF4GqLFA
	bzZZDweCWv7E22rsReXlRHnbU4XvFu35t0LPIBsAvVtpE6KehIAB+MW7C3rav0tT8hRL5YRViIw
	OeUCwqWulJ+4EHKFhVSsqzy9WHD9GsL3rY7G1C2ACB7PTO/uGqNCt1iKPHgCFF0LEHDBkWVd9u+
	EvLAzibR6jT3ynucJbd1Ot0VXuZvyo/smcS2pn7gLPm0IJRyJoBYYly5Vv2C/1qJnUyfab74azy
	2L1xQQvkPNB1ucaKRf3VsBqrAoCRZqkUj7cJnF7sag0uwKUVz/cHcla98oFwt9fi9eTXsByN4Bh
	SNLJWGxiJEw5ribOhgu0HUrjNGb4N3a7uAMAuMsCwJiBQOu63Skms9RvgypKJwpk1qBBzODijIe
	Q=
X-Google-Smtp-Source: AGHT+IGp1bakrJvow4zyavX2gOZY+N8rlEo+qFgmN/7ER7BE1KeIT7HJymmPWF0kYw8JPtkiv7Ujiw==
X-Received: by 2002:a05:6000:2089:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b5f2dd474cmr2283608f8f.22.1752238685741;
        Fri, 11 Jul 2025 05:58:05 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc1f70sm4373648f8f.27.2025.07.11.05.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:58:05 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 11 Jul 2025 13:57:57 +0100
Subject: [PATCH v7 05/15] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-5-0bc5da82f526@linaro.org>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=BKvuiOBqgHCQIm3MGLLe9t9yZBDaLPJiHTcKkR8dS2g=;
 b=owEBbQKS/ZANAwAIASJxO7Ohjcg6AcsmYgBocQpTEfswbU4UPgeVmWYMnuxy7qAAd3qpJv56Q
 pghCayzYmOJAjMEAAEIAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaHEKUwAKCRAicTuzoY3I
 OiNAD/4+bum0Y+XKTMw1SNJDo0VGXndefkd76SCW8bpswhrX+jGWuhOEDxJjqMK0QjE4JNIvfBL
 2aJcAwcqaUtYz4n8bwojaR78oBbLE5Gq8Jlam+Ip8tyhPugfZuouFDwVI1VCf0NjMyLWAouFYwq
 GjCM4LgNqXIzPbGmab+t37rk2EImlH25bqRmiahqqPLsRNqEFg6ResOnnObTzXQjM+NcCJiFDSR
 tjfibao5UBZC8j52xGWTfYilFgPI3WAWb3eubSw4eZdJbzy/qm2VgDYFgsjVdIX/kEwxfT5/oYa
 OuBz5CeIxIh7kM5N03OJWXh6lta065G9T/MOX8hphNEngXz0ZuxCfbL9wwxfrQPqPFc+709aZmA
 mIP9Eud5ExU3Ccm+vpk6Cp4aZIiIL0yfbd4JOpUeP8vi7Wg8L8pWjg4D2SHN5eYUFbP+R25eLkL
 s2j5kyyKXZR4GnFnOFwjV+2zeYQ3g55nQisYu5O9iGk4fBB/CSaLRG6vFK0JCqm006PfBC8Uf5s
 jCHEU98yINZNfilJSLbrTFHPqpG7VljaTTzKulq98FQ4d4qK3HDhAMquv5Lt+g7lzmb+OKgtOdl
 ss22shRy/0RFIGVA9F8Vr2O8hGznijWVgKHf4KuYR7MlRMC/g7La42ySnNPOJADfuQVwZqvx1A4
 pX9nMtVVUFUOIzQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1817fa7f922b3b30168655bffbcd629feeec167a..1585b5985fc45130238120bdfdb461477971fb9d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2486,13 +2486,6 @@ static const struct resources_icc icc_res_sm8550[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
-		.clock = { "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -2501,13 +2494,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
-		.clock = { "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -2516,13 +2502,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
-		.clock = { "csiphy2", "csiphy2_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -2531,13 +2510,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = { "vdd-csiphy-0p8",
-				"vdd-csiphy-1p2" },
-		.clock = { "csiphy4", "csiphy4_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3898,7 +3870,6 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.49.0


