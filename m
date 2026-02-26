Return-Path: <linux-media+bounces-53521-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NWuF19eoGlViwQAu9opvQ
	(envelope-from <linux-media+bounces-53521-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:53:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E99B1A7FF7
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 15:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A594330980CC
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 14:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F983D7D7F;
	Thu, 26 Feb 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="poCAV5UR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34263D668C
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 14:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116139; cv=none; b=UsD6wTwLCz3l4pucRjJ1eRXWYA4Vu7FvUDn2kwEAz3sG4RYSqLJqhnBnYZS95qiwD+PnVZO16k8oaxDPJ3m/qydm6TweY/fv5bnj2RZnJrnp5GoBfWPmwO++jt44P35dRd0IglPT8Hj9tCB195uySf6iC01zD7kCqtNngmt+CxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116139; c=relaxed/simple;
	bh=JCJLTtRtvJ90CcOYDuxKvQaTTx+Gne77FFK0gL0HyCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zep3EMfK3yA0Jsx8wAv01DI/S3plWNVYrge7DuNGNWSq1F/joMQ5ccShqnVUutCtGus2ZOjzgmCQVEKsrw2+56rt+wK0If9TqxccXpS/jXE5AOnlyCBlMz6LBiaWGZM59kRWOQ/SrYBMCYE7SnRriUDp0PLM88c9MYUXaMLuBSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=poCAV5UR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43770c94dfaso903224f8f.2
        for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 06:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116133; x=1772720933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhJBFhoC1RwaDVTW5cflhmAq0jF+Ul6SFFdi4f77LHM=;
        b=poCAV5UR6tn51Isdfw79sNZs/F78IkV1Kw+5XZ0VAXmKfVQd8WuPvNvsVWAJTHFk4R
         V0655Nu2Ym4ct5RSExaQPRuuLrqlKvDH8NUhp8PKgzgzBJtnA2gfi/FDyRD8YYCPL/UY
         Vvi/OtXNFs4p0hhVGXDy5zM2nhD+gFjzU5DIoL0mDQQdfM33BucK4kFwDW1dQdB+9ESi
         RDIiPbrZcqCGITW5FiD/SobJhWDAITjp6HUxHE2N5Ink+CLCCw/Y6JIDDpGJeSs3b8Iy
         dn4xAjv5IIHDc8JHHKaJu/yv9cT+i3rh4W2sofJ0xPPaXODsmC72Gi4Ps73AJh8e/ZyC
         zk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116133; x=1772720933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhJBFhoC1RwaDVTW5cflhmAq0jF+Ul6SFFdi4f77LHM=;
        b=EhMORdvZitkJc2OwDhyUEyeAzkd+YrT+ZvuzAApwc6Whc40rU8sOsUP/7eNdxyaG9g
         qxzgsWSrufYV9iVjfPiVodepHuOquIg1lhZM+MZSj6NvOkXGw+6qH/CDeGhNmNSSLdS1
         ZsvY5TMPaiqYIHqZ7r9hQJbEfSAGHLoZKq4wW52xHapIILUWBEt+tCUB8eo0GsyRQqc3
         B7iCpC6g4CrEWSJ5nysgUbUc7LlVqWZYmoEtf1txkst25pf04rzbfADcu2f2PBsaoxaj
         bQwUsRya58JEowbZ1hmHqIaZQvd1vltFQ1ZW/SPq1UeYSRSMWFRBTz5+QR4iv1/CN3yw
         31Dg==
X-Forwarded-Encrypted: i=1; AJvYcCW68+lOpIkU9qxoCMRNCXrgIUtHammD5nHZtnvOk6omxWBEIEUYEOHA0yxQHSzJehdkqZKT2gTeenUGsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZuK3BRM8/K6WwyqOZD38cUVrIk2/skxRVenER2qwjRl8tVZ5Z
	uZnrfJ2fFliFkkrsFB/lK7xoiVZzIaM9cpZxN+KJ5gfZnDfRbn9xkSW1VoU9Xnuh58g=
X-Gm-Gg: ATEYQzws++jSJviPgLHb9i2ebUz39VFQQXw2TOYR7qiQ9dWJvAiRWqTfNte1KsNKqJw
	EgrytCWvas7K3K7S1c0CehDd/KYimtrYRIgxMFgrLyxUHIWtVHXaVC7Slqg5qAHYR5woJKQRF3z
	dZueF848Ma2zchCH2fCPqTcRImUHbosfyVHKu4iRiNmesERwnMNDz8F8OpGcMdWJuFjnyFOAths
	qergre3QuYRBVXR13wvK+9rk4y1hxYm+JqtOtdbECar49ItH6ew18Cqg3rvK3i3WwzcFgGhRnZF
	gHars+nQWSioRUcV56PxYffcn2rYaa2iTm93c6B/Zn3GkJyZHXfWRH6R9yHuQxqfPxVB8SRuKD4
	AXOIDoVBNabZAWNaqmCxFqGXeBDyz7aAsh59Eh84ky+pRJN+5fTyVyqerFhcYdojWk5/RJUsWtv
	+MWWchfeLVe+/g7+eu95yyiwlFCkNJaM++Us2986NGleosprwAg2S1frXJgm6q39b/
X-Received: by 2002:a05:6000:2c12:b0:437:6bcd:77f8 with SMTP id ffacd0b85a97d-43997f37a94mr4434903f8f.38.1772116133025;
        Thu, 26 Feb 2026 06:28:53 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:52 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:48 +0000
Subject: [PATCH v9 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-7-a59c3f037d0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JCJLTtRtvJ90CcOYDuxKvQaTTx+Gne77FFK0gL0HyCQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicNa7xECexMGU1qMw7iHROJ0V8EXx62VgEs
 4A+s+36pP+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 On3MD/0dlLq4Rd0TSgAR4RKDSDZlnJGCoZUBKbur4pY1ZqfwR9qr7TJUL59sGF/gzL4BwUBDk2E
 Wv6svw+sHsDWEvtmYTvhpk0GzWUzy2woe4hwSsKM1iPdaPfOg5nDtze8nDiIZQxXDicxMjKxi0o
 8iZxie+7cT0G7B5QXtB9wutNmveH5BrlI437zKzrBzW3k6kk+4e6BasMf5jsBsJPCM+Yspe7NTc
 9HnXWmhjqbg5cvq6D29It3AIyRe0IxfjRsImf2w1JctTonN5oiwI29F6PiVdai3mVOsvvGn0/Yq
 wUTtYgn0n47mDUD+dCScMVSxPcZreegMDABOt4foMUiAEnczPTFia8NMWTSGpw8TlQdlZr42Za5
 WgmwwF97G15DlyYUC4wnsdrqw8em/DKZNcALJrnO0ldmK8csRHHOtu6JSYYjBptsvgsSEu2Oh+X
 P4PAWMKDVRSafytNnbnq/1WklJpYZaTXsE5/h6jEqGJWZ7UY8EBGw6IkOadTRXMojFogCfTcEKc
 Xj8Jr+eKfUxD5PAF4SaFWT4XrhFvDYjjrMxXK62HakDIWX6ZuyS9s6Rx8qYemIr2fO4VLO3pOav
 Sj3c0WWTkQ4VsviH0knFMxAp6p8CZNddmbAwhCDyBmqlYkYD8jfhLD04AIt6pVjzAngKvz8Q5T6
 AHkyqQcVO0NCnEA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53521-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 9E99B1A7FF7
X-Rspamd-Action: no action

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

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


