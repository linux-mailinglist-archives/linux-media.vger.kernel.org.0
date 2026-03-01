Return-Path: <linux-media+bounces-53864-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJaFBrCNo2keGwUAu9opvQ
	(envelope-from <linux-media+bounces-53864-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:52:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B571C9E2C
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBF76301CDB1
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FB3274B42;
	Sun,  1 Mar 2026 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBjuyc6z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B31FC110;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326283; cv=none; b=iZRj8CPGCQq6uTQ0ANcLiOF4vzf48ZJgJuh7Y5Ys2CTswhBGf7dlAkF+ZaT40o546iKyXShiAk3abporBtA/wlGFHubw1JcJ613JX4L8fFefVk+CCqzlLMnQqMnix5MJs17hLQSZSUtQt954PtuDuoXDBw6c7Is7v+eFbrZKvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326283; c=relaxed/simple;
	bh=Pr/N5Ge+6Q3nSvDWEB5DNNn7RCAsTf3v9Z+E4iXhcUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g76lntqYrtnIhvyhWxFF9FAg+yVQHSjGKtjZYBRPztvhUjgLhEAPO/J9NLibSxbwBRZ1r/dKG+B/HFHI1d0X4v9gSnJAF4JelwADqzocg9UCmk04cTMLBU0YbdKH+Ug1trlwOszP8qXUCfEkEKD/fhlaUlCxSmwX4KDOwANQmBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBjuyc6z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A8DFC2BC87;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=Pr/N5Ge+6Q3nSvDWEB5DNNn7RCAsTf3v9Z+E4iXhcUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=vBjuyc6zCyhtIXgCCkXbn4LG0CpBEZq1aVynmXmtv6qQGh64e2UlHlaS67xd6iECG
	 meWgPFOsMYiOKivk5t7j9bBXiJ3ZYY2zQtbiqw8ImfhLIyzgjOXOymDla8hYNQuX8K
	 tahUt5KbUPymFXRVo43FlDXR5IuAdr/Tc8UDopiIszy2CPHgUBxZq4PLd+RpBP850a
	 pSFyRbmrpknwR4/QNV6gpTVajBsE9/lCAkC5r4cddJB1X9cdvvHG0zAhvLPeM2oK+7
	 EXGf8AsTk2+RTanlP6Mwg9IggE3Dcj5kQAleO60LGsOeLWe5NX91Iq3QYjW0kXl/Sf
	 lSioVAs1kv6fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F14BFD0040;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:25 +0100
Subject: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
In-Reply-To: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2425; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=L+ePL0W59bohGVuAyXyN3A8pdfQMeFCc6aBkc+w6klo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42JddaQgNU/8hWg3u46NZcGPb+f0jmBLnMtv
 OA4qQbONCaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiQAKCRBgAj/E00kg
 cjw2D/4n6b3wsxCe/FrsaPnJlrR7iTc83xSoM2wKxpg8wYKQiiDlvmRLc10zrqGgs+9Pga3Z5zg
 /KR/P90l3cg0WP56VC+zMvalcmiBYMtRjPtQVrgejO8rjJH5U+MeBJe/AoijPj0hKL3eTcKqJgk
 FvCw9TCd5/OVj/HISpHaTJWRpPmguGklzaWxpykjjTjv9J8P4c/+b5CJivGTfsvMxWleOUxgURF
 tsgD2NOcUN8QpTQH1eLqXt5MUgSWqr48R9V1A1uOCYf6pSmMABrP7BuG8odiZxIdHoYQUhvXrbf
 Lot2fLlRBUw9OOElcrQhvBwboalJ4A5TptRPBCOpdwWCiU6D0Ux9zTv7Qc0PEN+8SGah1qE8x7E
 7GxKkW9rmEggB2sdHC984H9786cwiOlBR3uwPUt/gJz+nNqW5aKlm2wudCAeKGOk9ANChP5NepS
 HX08MtOZrooVZa+0VIVkJR9BABfQ1K+eBWUIGgLhhJCKN3wNaSGUR57AETVL2XfOHG4/BNAKHHW
 ZuIEPyQwwc6tdffuUMtDTxS8jOzmky6pdeOx7O9BA0Euz6PeATOfLCc1VLZYWtVHBXHPZDDEcBU
 BQP1QmHywEvRijjJew5cmRqS15Aps7UrLaRyMJrrwCrZWIX++DQArWUuW+U0VGbKfrrPhRRQ26b
 tuSyv18qPoU4OKA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53864-lists,linux-media=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 92B571C9E2C
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

These values should improve C-PHY behaviour. Should match most recent
Qualcomm code.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 5482fb5163e17..c612192ee727a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -225,9 +225,9 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 /* 3 entries: 3 lanes (C-PHY) */
 static const struct
 csiphy_lane_regs lane_regs_sdm845_3ph[] = {
-	{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x015c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0168, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x016c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
@@ -245,9 +245,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
 
-	{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x035c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0368, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x036c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
@@ -265,9 +265,9 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
 
-	{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
-	{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x055c, 0x63, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0568, 0xac, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x056c, 0xa5, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},

-- 
2.51.0



