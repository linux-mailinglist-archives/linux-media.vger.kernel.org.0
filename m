Return-Path: <linux-media+bounces-63905-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZNdED7NImpzdwEAu9opvQ
	(envelope-from <linux-media+bounces-63905-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:21:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C686487C0
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 15:21:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=dx9iCVNC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63905-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63905-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99BA130CE88F
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 13:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC043FFFA7;
	Fri,  5 Jun 2026 13:14:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572743BBFBD;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665285; cv=none; b=srsLEDsDMzi46RdIcPdNUNWhnTfEWXIVkNu18WjrTYouwD0BudcC+iLT2V1fqymMmSLOE7tfz+1z6+2yNb8mK+BnYvZiTcnT5Qe5jxwbPQM0Ca6NOy68wlVfp7m7otoM4v9AX/+iIPuzDy9fKdHHTAq9QQq2xahnYVR2H4rmBK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665285; c=relaxed/simple;
	bh=/T0fBR48lIir2pjah2A+vKihBRYyqfalEzh+3nmHk1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xee/yNpiAHqRaBKn3TtgLyVoy1oOG2obD4poUKfQakMXigUom/QnPoMeST+SWaENKSVgcjjnawtBLWfOUgFkeZgZnuRh9vsDq+quxASkgeurh0EtunX3YhOxq7KKwLGv/dIwy6Xc22SJDWa6c4iFoEH0gwh0S5xpox5G68OweZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dx9iCVNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39C15C2BCB9;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665285;
	bh=/T0fBR48lIir2pjah2A+vKihBRYyqfalEzh+3nmHk1E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dx9iCVNCXdIFcIWkE5v3qhGc+aaLyun5tL5edWltLabAt25+WRETyR1BtJdarZwWv
	 zXDhPcHXHFikF5yopB1+KJnxFp4L/NCo2BKfcOeB4AofKDjsisFAMbzXiRS77e/jpY
	 qzWH0Rnd1vQ4/Jo+ZOXojxlUG4r7XEfAIycixTbLyLwblGm41jHFZOC77RuaR3/eeu
	 /7zYLBtPLnE0cu0fde7G4tuaaR2AUZdukkq1ooa+hQQKwHUbFVgvY6h+IXahQ6XgMq
	 G9MrQEWqJKtm1K0s+Y8YQU6L4FP6PmqIXLg7DSXSSfZfiaDaKTTSF38rW1EgPxhG6N
	 FYHlwSiD0g3KQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C50CD6E7C;
	Fri,  5 Jun 2026 13:14:45 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 05 Jun 2026 15:14:44 +0200
Subject: [PATCH v7 6/8] media: qcom: camss: csiphy-3ph: Update Gen2 v1.1
 MIPI CSI-2 C-PHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-qcom-cphy-v7-6-426c37e9008f@ixit.cz>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
In-Reply-To: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6215; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=SXjFB04JrDA9iR06sMcig8Xokkk2vPb6Ou/ppZyqNBE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqIsvCKHVDZ5ehtMjQq6XbMEgL9vKAFBnVP01m4
 yCh79EchmCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaiLLwgAKCRBgAj/E00kg
 ciKzEACZgO8102EBmN0SrgoQUO4wpe5XrZqgzLgj/wFcYsnBc4VFQ59ysmfLo4iRTjeAunCbIbY
 1jA4FfgsUOgVfNnx242PMDar9YJ3p4pQkY0NCRjmSM4vXAEvmjZG4Kht4GZLnQqQIrc/5ld9Yx9
 9W+V3lQtgWf5LiO66rp7y2hj0dg7KTdk+nnW6CZpkTjnA0/mtuNki8ppLwfysbLqYSxxIkEfLlR
 nXLf/u6ssCiHoNiFS7ycTRLf7iO7iHVpdfzpYDUK3fJnOCGLkfGK7I2gdtR2LAVPlApRz8Wepfc
 US1VeQNw6YeDA2vqZB6+39S1YzcmgY7GRWh8v+seAsG9vjkGEtE4EiEIH7TjM/0QBxOoXxrBzNc
 lAS5oLYW/UK7tHDpn0DR42AZ37KED+vHMW4r9ZF0GC+Lt5ZBDof6XiUkJ+51EyWlgaaoRnntI+v
 KT0m7qIdMvWYFw0VAg1s0P7dk5m4KRdfmfZM0jr/rKfgDHLrZRXSfsH9oCMmtBtu4PeecmQPh2d
 8YNLQYwMR8ZWT9DFLkJJQRA3bqXv7NKb/H/wMzauaPXBgnkaBbeBSaG+4U/U3G+iKQgWYuwmRdW
 rpRJAdmi2xMgcI++wUyqQUvKcwxsXjVavB5oGIDdnQaTbKWltr5Modnnb3rouY9Srn5FXx/FOQ7
 CVcJqUs666QTIKw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63905-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A6C686487C0

From: David Heidelberg <david@ixit.cz>

These values should improve C-PHY behaviour. Should match most recent
Qualcomm code.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index d9136e422f45f..feafe8cc45e02 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -227,19 +227,19 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 /* GEN2 1.0 3PH */
 /* 3 entries: 3 lanes (C-PHY) */
 static const struct
 csiphy_lane_regs lane_regs_sdm845_3ph[] = {
-	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -247,19 +247,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
 
-	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -267,36 +267,35 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
 
-	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(1),  0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(2),  0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(5),  0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(20), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(6),  0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(7),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(8),  0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(9),  0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(10), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(11), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(17), 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(24), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(51), 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(25), 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(55), 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
-
 };
 
 /* GEN2 1.1 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sc8280xp[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},

-- 
2.53.0



