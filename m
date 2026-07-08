Return-Path: <linux-media+bounces-66935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ixSVFcmVTWop2gEAu9opvQ
	(envelope-from <linux-media+bounces-66935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:11:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C372092C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 02:11:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=XYUUZlAW;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66935-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66935-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2A8B30D0F1E
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 00:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC8392772E;
	Wed,  8 Jul 2026 00:07:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E44BA3D
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 00:07:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469249; cv=none; b=OeL7k0G8EqkxF62uTNbr4e185BNJsOV/RDGS59bq54x+YQGK0suP7v6gKDk2KQ8shyYHyin5am6i7il+oA0udNgHXrScne20YwU7cx/NiQwvv4tSxjZ9yaxrgm/cUsYFjlvUww1AcaQvpYzjFm2p7l7aJc2lefLR/sbEx4i2DoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469249; c=relaxed/simple;
	bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KtktHfjcG9RQM2fpk5yzdi/XWDJGhrFfPApT1cdm/7Ahl39vv2dqoOXrqroeBP9hqTa+aP6IXRvr2ofzYVdbLL5/mp0LrntEzN4zsuji9rj22M23Gap95Uz+3sCbslIxP/eLZ1Wma1Mq95mcfHwa8IrO9sdouzuVHgwaRqJBQ54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYUUZlAW; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47640541585so48995f8f.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469236; x=1784074036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=XYUUZlAW+ShgNGm4VQaYzaKMov6kVD9WO0SuHyZ5BSqu1B9nV1Sb6CTvn99A9tASnZ
         rt2CBzOPBsFj+Cs5uQ9NC1xp4JkPguVrSR81HupKYyzIY/Nq+O7uAox5Tsq8V1gE2gvY
         mtDuutM38wgPNXzGfeB+EGUdLik+ImOTREkJatm4dnOw5BvwG/P/o8Tc9jE5pQqIjqTw
         xt7B1Ja46xaazXnYYZWcxPg4r3CMG07ZIPKhzOLpH0fxXy4SgoLDp3anTzVkGuYmidIf
         NsrfqPjUvlzB8ytSwL7Vhk3iILnMKodXxBNyMnEXGJRRx1kLFn6ApqY1ija9jcoofd1J
         eCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469236; x=1784074036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=HlLnUfDw7UplRZcjo/POhub9V8iZY8E4St5jP6abs74PR4gpd1p529rtbErJBUxzmE
         qNebF0Ivd55S8X8nUTg8k9RhlrLt8pPsG2Ss8fwQNEW6hqaluGZWzDcQVXy5WPgtuSHy
         mwe3pjZa3IDcRzQ6wwYuW3gnk8BnDUurwF/y7e/Tov7Tp0eX7QhnD7h0cgLJtji+t75o
         Yakhra2UL2/f5e3vAGPR7AJfcwkfkFRUb2WAhMt3lhnR9IXGPUPRF6PSSGhW9PX+BdoV
         dIGHsQAZZFVUdyJeMVo+HG0r0nL+wMHADnU8jdaIa4B1U8deXRdFSD5wMkXnw44P38n6
         tBzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqmzzq2LAMo6dNgtmkJlPQp1X6iG7raQSWOtO35nqM7AA/DgMXfH8DdPm59IJyQh5ytQrT4aH4yUDMTtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPrlbvbNHiqlsBGdPxyMbrzazICBQc5IE/ES35A9uiOaIpzyH
	/kfiwqr5PUun8vqqDPb0Jmhx6lhRKUJY4FmOMIJeeB99lLAW5LAefx1QOVU9O7PIUm4=
X-Gm-Gg: AfdE7clhDjJ+cM3iBZjOdI6uPrA1k2Et6wSi7HiyqUjb440DeBTtoiRTlVib+oCP2Ra
	e3CNlvKMV9e+lmvsyefKVcbmnH/4KyXjbI/tb4kEfoYGHS23z9SMz7MPY+u1xawx9AwSlMyrUlE
	v7jdUsrU03koNpbk/I5iiI+Bh8Dm6mTJt7Wqi7bPoCka2shngDJwKblhM+dzx9ux5U+d86pJlLe
	DWeAEUjmjRbiJ/i4zb0L8XoPVrbtDr0mNkw/5wMG2b0rBHGdLAVPzyi65A4geOQxdX/GFh0InO5
	eEZmHPJ6pA0Y71RrBMcXMXHVhxoWYrlJh0ICqSw1VLiBrK68xkhlApUZBLommQV712+G6IhrQf7
	CTQs1OS3zsYOny8t8Mci1fzUHbpt9kn5VWgy72hNL7AQCau9/Qnde8NEcpBNwVEXKt8DO+yU/QC
	vaSajg01eKvTgN31xoOfd7S/s=
X-Received: by 2002:adf:e34d:0:b0:472:c426:2ce9 with SMTP id ffacd0b85a97d-47de666b0d0mr6964115f8f.12.1783469235651;
        Tue, 07 Jul 2026 17:07:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:07:00 +0100
Subject: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSoDVvrSeIR1GEcpvrGvnRh7TNJeP7pIsOLg
 98ZcrZUbCyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UqAAKCRAicTuzoY3I
 Opw7EACl8D4iTNEOm3rvEsFvIS8xj6DIdntmnPUbPQjtqGfBP6eDN60AH668T4DmLW82RkhSrg6
 YCdbHf7h4xf1t+4DusZ7fk9x8bP3vXnitqmEKmT77+HYNZFMinclo3b62Zm/lIEucCKmbX12782
 XGjMGss3fPpJeMNRxawoXmEZBmVSQ4GnzjSjTuNze0DDKn1SyUE2TaoHJ2UENluK1Lqw6POiTJa
 +5jSUT8+dFSWOjaBCiSn6yi0kDOzJXNChp6nipQy67T+N6lxnZwUcaD2NaPusM+xZFuk8cZYuJo
 2A47lQEp7xVhcQj3NOxTgPjnqZi/9hNejuY1jlx07g0IjZVM9GYClUoN0F0UI9BEkoadqdeSOkR
 hl7Spf9gYWpiAOVof8dCE1HEaL277FV7LRaGC9Oqlz7cEAhBhUUVyFvNOWdx5bPiM9407qQ24bd
 5ujbW+13N8krxjuOxrOwveQPw33E1KIgtTb6CT/vmQFCWM+3OgkUcXrtFQtheK8d7jgUpBRMZji
 VyIk7/1JvDshePSg9oY21VyDEylKwolhmnmv9mPYWWdfH465qg+irrMUwdQ0AZgv6gJDRpmfq59
 7GwEpAL+Js4ZLp7MHlklypkjhYs6m8GuBC+4xK7mLADRfTINiZQq8+9xBXLBNnDFqXWA/IMImsN
 OzFdxJ/KvcGF+CA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66935-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: B25C372092C

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 146fea438486f..f360b2c99bf89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4191,15 +4191,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -4208,15 +4199,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4225,15 +4207,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -4242,15 +4215,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5803,7 +5767,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,

-- 
2.54.0


