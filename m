Return-Path: <linux-media+bounces-55832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKmiNyxXt2lsQAEAu9opvQ
	(envelope-from <linux-media+bounces-55832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:04:44 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E675D293468
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 02:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6C33C3006815
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 01:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52BF27FD4B;
	Mon, 16 Mar 2026 01:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mu6eNfD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C1280018
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 01:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622937; cv=none; b=jpuWsOjyUdI/Xhlagr6PT6VInRzAQWqkfvbpC8JaEUWLkH4nE7ip0PpBvY8+sJunj/ymcfJ3MGwkX8E89x2+nC77/B4O20XnwyxFLtbIC9A7jU8gWVLhfJb9dqwLWQ9ln5Wz665wDge7kIrkGjAWwwqlale7Ok6vdV7fvzPSW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622937; c=relaxed/simple;
	bh=aVDiNWO67RvcaLKortzpEYBNU1wRvtLFUoiyUFNRkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rp3Wg/aSGaQ/9laqtIriox1VBRq8NKbEe0HFZRCDzasGrbO1t3UQoZPoZsX46/EzdgLET1ABISLR8eCxz6XyIottNJZUjeSSYuEvqJFNjJuvWa4P1ljxoPpPo3V99BIYm77PYI2GPPlh/XeZGAwm5ZnyoDlAtgCYiSYOXTf5LnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mu6eNfD0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so33507815e9.1
        for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 18:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773622933; x=1774227733; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSn7hQ5i66Q0S46ZKJZuvK8H5ifNzHdzpxgp/ADQRCI=;
        b=mu6eNfD0XUeJO5TDPO5Q5DsaOO0noMtnEpdE5n0ICroYzdN8kb9rGmOWBNRG55jJBd
         w0EdmNY/coSq/11OX/pkGYxiq0Hmif9d8nvSulucMGsqiHfoiWIShSUywZ6YeB43HSyp
         ljfZwEpS39TePW0VdVBTXNSYsJd8T4w8zm0j5gmYftJmMpIDoiyD6egoyb+Mift1H8mf
         vCUYXCzSWXtgv5CUqfsR/WxGHhA8xMuenLZZAy6leGHmDyqxB6SXtrnkB2TYzp8WgVLd
         OW+jVSWU3KofLJ+WxeYwxCanHkGNBZX9gRUsS929K22H+XMUH8OZ7JB7a2/h9JaKcZl3
         hfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622933; x=1774227733;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aSn7hQ5i66Q0S46ZKJZuvK8H5ifNzHdzpxgp/ADQRCI=;
        b=KLYIoNwCCEvv+d0lRAFTc85h2ueQTiEwePyObCmBO0Gfaxe5fvxXrOBbhrlg6uNhbl
         FKBiXGH5pwKQHh2qWTSUgP4HPiiDEYW+TW3abOWUGIJ2O9MMmBiu/Bo3FQGaSpI8FPzu
         zdp1wG/0cbCAmwx4PwG0G35xWNSjHhAXeD5RCyGfRrMrLgqP3J9YYAx9zJ2Y0/Ynf+ga
         bf+93fCN8xJGmrjBXEXPQ76B+qkMT7SVvRXcaBtuicHlN15tTGtnxplrIC2DsKugaQ0J
         cSjIwxtEdZ5LFL71ZiE+XKsMSoZQNUB/l6dsSMfdBIVXotSF33ukV60TLQLPg/eHjj5N
         inPw==
X-Forwarded-Encrypted: i=1; AJvYcCWQwyTfI7aRAxNaahGdOJ/cC6ZcdIG7rOAj4j4HOnybflFnpRPbx8G2Mzaxy7WR+bGXmiqRtbCCkXSqEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAfJvFJfhky091EJUmBZevkpHT6sD98mu6aIi/Zxrmhot2Mol
	GirUkLpawk9rBCqHHBGeILMeqgXfBNUWoAo4sxXDNPm2HpSdS+FlWPin5TZ6V7p1Me4=
X-Gm-Gg: ATEYQzweNfr2MovIoZMcl/4KTGVuGqjt8NrnApcnbigERQhuubN6HiFjqUSaH+YJ4VI
	rxS5HmntX00RQcgfYstAkke6BNw14sRAboIybSphOXphFg7cgy7ZYU+q7Lz5gOAtjo9J/Il4LPF
	gdGmAyHa3TGIFo1vwVEVT97wHlYPGPPen1cu72p3bG2/bBxptE2L1WfdV+a28UrZdAo5xQLqpMj
	Zg4y7XTg37noxGy9SUWjZHC22gdwAcyEb05BWXCtoPQ4KReEctF+YMbeHBi5LTliVr3AwpBrGH/
	oCl7RUusHXgTRx9rAE3KnpdimuJK//pkfLhyldtdSnly0EYsq2JIND6VOO3gEFGDYeBteZG3Zs8
	nYK60Wy5JeP2eaFXAQ0dUTPVyrYz+KQLOMRKRMEVxaP8XjkVdXQZ4VwxFsg0fU99H2iuO9+UdFL
	C8anZFwQTdQMYIFMFBfCgahrkObXp8l3faJ0c=
X-Received: by 2002:a05:600c:548a:b0:485:4100:1eee with SMTP id 5b1f17b1804b1-4855670e7f9mr200978105e9.24.1773622933127;
        Sun, 15 Mar 2026 18:02:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm34729700f8f.35.2026.03.15.18.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:02:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:02:07 +0000
Subject: [PATCH v10 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-7-fdfe984fe941@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=aVDiNWO67RvcaLKortzpEYBNU1wRvtLFUoiyUFNRkzQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1aNiTUxan9LQk2eGkEMbeN+4hDN1CC/SHfks
 MpN3KerCBeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdWjQAKCRAicTuzoY3I
 OkcJD/9ncxjPqP8d7ijCG/48u6PPqFiDjus2c3VUQBQA3QGuObdumglfCpbzKeoO7ljmLEzR2j2
 EhU2jJqfGNWXS2BrCrfxXGvH6Caa7Z5o9dCDYN1MYAKcIhkXRgyGdEQ6vn1uDVYYC4lUY0MPkbz
 3caYMr5AZiAZBkxvM6Nnb9dpoWYpIvZnhU1aPwew0W0HQAkx3iuiXBzcptCR125hl3SHww6MG+H
 DxpGB76xwB0dvzlUwLb5YNJx7QcqWxHmnPrk4xTH76QVg9BC4HzzYip3BZlFgAt/nayE28rl+Vd
 /OfRZS2ITOnkF+LlY2OLebOXqWKG+b2mbetwXKdmqv7woE8d82XoajqZ4ATFC7bWVEZC5oB4sAK
 k9mzHSUMvfvWQcWRvZTb51H4sNx21meG72knIIm7593amZGSmoyVmm39OtDgmVOsPbF0u1DsUKm
 ct50qOTT1uxUJonNfyNuxeJP3E2DcYiM6eoM+6TzeCXVnQCJtDQ7V6ghIuPuHQfWfQz43N833oz
 5+RGqI4uNrRIQeSx+HdrKm/BTs0g2cfmAAG0AEWxWv4uEg4PJ05Om4sj8q2ceR8jVsRY1b71KkR
 Zpg3TR00LdxM3Plq6yjbfWiUm3X9HbWpUd+Gg2wFQH+qgGWaLDsRTPHjuWiv8F79LapMANNM68F
 UUsZHZtpFD2eCTA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55832-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: E675D293468
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
index b1737b5d52160..0ebe634f5d96b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3895,15 +3895,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -3912,15 +3903,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3929,15 +3911,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3946,15 +3919,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5362,7 +5326,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0


