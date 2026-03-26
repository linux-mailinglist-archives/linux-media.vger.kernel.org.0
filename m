Return-Path: <linux-media+bounces-57108-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P5SDcSMxGlr0QQAu9opvQ
	(envelope-from <linux-media+bounces-57108-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:52 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2632DEB7
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 02:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85EE130B4D8E
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2026 01:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B603C379EE4;
	Thu, 26 Mar 2026 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E1W6UC6x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467AA37C907
	for <linux-media@vger.kernel.org>; Thu, 26 Mar 2026 01:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488497; cv=none; b=ALadXuJ6ydyWa42AX9+SNqKrKVeNajNBLL7LYJb/YM8o5+IXFTO6Bp390RUNHlop4op5YJuJJM4ejEnAbaSJZmaez6Qu6Jz2RTBxXpWlWH+XFCjEIwEx4Do6lmR0jr9wg8F703K32+UAOdPa+ee7EGlW7HF6AuNinF2LJUpvNxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488497; c=relaxed/simple;
	bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIvWzBwDpxrfLwzgw2b8DTxJHlIRvRcZA3R6xyeqYcADylmWWY/dP5x4jG6IyUc4J9DfaHEMIDq7QjYxVUnLAS345XLf9oJ1CF7SuiIRxsb91O0h0IkP6qrcPl0bzdbBQwUjqkDfqwIen9VLmcet+ZS/R7XowGEAabTkyvPJiqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E1W6UC6x; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b4915161fso339034f8f.2
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488493; x=1775093293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=E1W6UC6xKnL6b3zxASMNW9DWMIB+SBTPk3A2L9HKxHiGZM9wuM6XdHpZhhmnzVDL33
         ZvvdEdd3A3UxMiYLpNjPSsVZAYW/QcGo0FaCSbngx3urLzYDXdAyPYGGdSBfNUJq5gEj
         vTmk1MRR1tJLv/87qiF3h80rRIrsKYLthOpLsVxMq6yLmeqyciQgd33UYOdWPuP5PeP6
         gJfEl2ryO3ki9TdZQmMA3JCE+mnMLssxaR7NQ7Tp+45T+Aj4JFdnGdzu3O+aZIj22a8e
         FZmtcJTfsyPyn3QC/tDFMkHg28eqoni7duwBqaC45oHSMliU4+XWoDQFIkRJGszpybrM
         ZpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488493; x=1775093293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=n8jpWcmtwXYeferTxj/LKJnw3Dg1L+K1ov72s0jUTewSHJ3yIGhkWrwtXhLm1Hsf0I
         qmLLdSU7ZpZ7MSxo538O5IzOr634DDidebVDuN9Q4iYLIsSAwxl09HnyFbYkZlPnoesj
         nyZIqk/BNqDparlXxoAW/ej21gbDHpptuHaIr2Mntdtr2OpuVJKHqO8KAAyYwmmBuAFq
         Y6SB00S4e01YCbSiP0YgFcTLdMzu4onchUlidvn5BFtEpL9fJhJVdZHw40qz/7Qw7M5B
         i3XkzRjb3P0cBgx9FyVSUrBwgTqcuVxKproYSQagRwYYwZCqmAvOS4twx+J7pZ+kMJKx
         bmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo9rigrO3wQUaLMMn904NI/WP8OUn3Ai5+/Uq6pgtqm/L+XU4Ql0Iq2rsTnt6dHv9jDquGlBARfROnKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa172FhcyZPo617cCE3tb+C0PBsVjUUEBdnGof1TNZ2PoMfop1
	mV+RluGvpQqfabtS1WYIlK1mcFB6LFa5bh9K6U6uLltdtv0OUNZIVUjr/nWp5+afW2k=
X-Gm-Gg: ATEYQzwq3YSd+aEqGW/5GLDSbctNnO2yPhoQAREpk/qz+EzdVW8JPOP4yGmKPO4BsUq
	dK3d9nsT2UZbuV+iUzQOYPr4C5zYl+D5IIRTqmLdWU/6OoJYQ117xtMkYYzI0xiiNukJ7p7wi6Q
	bGluCQVfp8gpHL1VwfgNB2w1MzM2gmPyiFensWrirREjMMHyxSfFceOuxnZUhmIRbaYs8qFiQfr
	rbjuKCw+kIsoWfQfpLukFy+mboosb3+sOf1m+FLsi6DVFZRRFdQAo7G9nKTgBL+f9xVVdY/yoIJ
	wL1AKT4wbZ5u7gc+B2vaVmHrKAA83G2+Yv3xZlg4ObwmA/QlJV/X/zJk0bfHxlwLAdB76iG0K4j
	ZvajmoGzFll04ONZXH+YIl2CP2uI5piWDnI/2JNwQpgaC2RIPX1uzw8+S/Zq64OkBthcmfp+cDm
	Pt5ribqiBQIq6ifKtyg6aYPGiopop61t0B4p0=
X-Received: by 2002:a5d:64e7:0:b0:43b:3c05:d7fb with SMTP id ffacd0b85a97d-43b88a39b7amr8254132f8f.54.1774488493490;
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:35 +0000
Subject: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvAW/02o1imMUf4CeWHGfYnnSEV/h55Bnm95
 89E+DnlACmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 OmeHEACz2r5rOYRYzaR2gfd8IFZe4AGMT/qP/a1S1ZqysbMJWb+lApAt50A/4VelvLBR76cDeo1
 9rYvr6oRXNFZWJZpk+JHQ3jx2Sm9IZove9pAV4pWYxVJsym9r+koD5zQwywQOeFvyvizvsGRsEq
 fnRYzHymI2Lo9QnJR+mUlK5Gr/FXJ7ElGVI11WlWQZLSbO125JtS0e3Ve1AcSU05RTiZ++J/LrV
 m91WApzYPYJUFGwdDxd4dWUZC51LL8LTSLDFAWYU6DuIP1AwS5k4+DdXgxeLu+canP8K53jC8QV
 Er90YGREEx43r3S2eXwS743Z5zYXiU2QNc1W0WPvsQ4+D+kOskrMDDakHugusK0IJCoYdx/t6Ti
 jTBssLHgS9fiyypxCwV4LKuJOO81S6g5YqxSm13BbcWN3OUn/U5l/yNprtsnS5pAHAyb55kC/RF
 9iinNXo8ZCN7rUuddhGsZtZgPWiqrI0WTlYJHFCH1uenDrdYnm893IsSTBcSeRiFYU3cUuQ4jfA
 bBxQupEW/n2Ut19upmltARvES2wfzAv0P5q8cdI2S8vtvZcf0MYPrXWIdGpwaF2i71JNMdYQVkI
 So6btYsJc6d5lhvoDAUJVkqDYu6K2T7WQumaHSquDzrmYNv6DMxk4ZNuyJ47Y/KYazIA0nu8vPX
 QfPKTV/SBF53dDA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57108-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: ABF2632DEB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 224b5472d7771..3b092560b5df5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy2", "csiphy2_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy4", "csiphy4_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0


