Return-Path: <linux-media+bounces-63186-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULSqLYgzHGoOLgkAu9opvQ
	(envelope-from <linux-media+bounces-63186-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338F7616413
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F05EE30661A4
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2ED638F653;
	Sun, 31 May 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfasYeMA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E873859DF;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=RaBuP8XuEa1DK4HfaLCPnFLukrsocQT4ZsgXkZ/W8q2c329FBPusVdKqJGB1i26GYkPYZVcrKQEyqJS63lechRniYx6eIWoPL7mvX/w/NVUJ04xpfSMP547+7P4nESRXsnLeYevQdSds6Py4Ea/WnMsM+XdAoAgfzb9O60x+T7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=p89+ASDU3VeRjzCXMDrsNSLKquw7qPiLPD0o9A0oxvI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g5TYjpSxpk7ZuHuHMUaSW3lIxElkbcT6TGHz/Bi+zGdEsbQ8KF3GF1ECE8oPlRa3tIX61+o6VMvuEMjjwhZypQXdc9LpGqSF7DdJtx6JOx/WRYieu/pMsXIhCf7sdSlE3Gt0B3rOuV1NxsiGLzMmclWWGUwNq/3soSjf5DfFWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfasYeMA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 055C4C2BD00;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232893;
	bh=p89+ASDU3VeRjzCXMDrsNSLKquw7qPiLPD0o9A0oxvI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kfasYeMAKi6gMQtXPqkY/tIF68LcrOP47g7ZZQPFOf8bTPYtmuPPUvuaBOXzkFMkO
	 /QRVoJL6oPf2mGxCWD1yltI3Py/qKZBKKK2aRsGgzUBmZ0xJhjGZCgUns5gaLgAC5a
	 M6DG0oMdL0hgpWi06lr6qCzgSuMxQJErMESiZNRCKMGkdyz3f4iogpAp1CaD2TO4n5
	 CXhHyoxsXZdv+Q/kygSPxPZXcJlZ+dhKnGzyiQgKpaD9Ktbe6h1CizXS+Nks9nsBtV
	 /TtCOB5OMExrf/K7qIwvLi4ynlfwAZAsF+/9t79SyfdCk2U1Hhb9xI97dHVM11vuzr
	 ndMVJyJ8nRCpw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ACDCD6E55;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:14 +0200
Subject: [PATCH WIP v5 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 C-PHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-6-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
In-Reply-To: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, 
 Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3860; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=0qnzO19xgIcmqRH00F7JZkTLiVzhMJPwNn5Ze/smDMg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK6Aocv0y3fmQKDsNuU7KhsS73Z27PMgXREc
 bZnIQfthTGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyugAKCRBgAj/E00kg
 cqS1D/9wia8qwdNFo+dAuRruNuNxrNdaH94pjH//ZQiGd3m/fS8pMIgDvMlBidzHKoJ4Vy3OjkK
 pPxkvK2UE4y9Wsw8LxBnopM8jFHHoBOc6c9i+5uICvkZ9hrgeS0V1Y7YFTEJFk4P0bpfnu1rrUH
 IK0srEazKnxySZrsGAJIr8AN4Qv6J+19JZVq9dhRdckTMMiGrfRggtpaWE61irijR27WON/lvEg
 DkXlXCmIHmONxwSp0yLJz4Wd45EYnrMzeiIa8yrO5y3TF6EO5SQp7ztwH1tcP8ocS9S1KgkIqFd
 TVv8YdTkK8lutC6FY7pw34TLcDqe7PJJZn2fN+ohlnhDY6Mf+zmX0b2LukWUQRIXC/yC5p4czCf
 o2zvBgX2I99KUOhyeyRj1HALVQ7FalrU+xTMJ+sxoBetfuKyoH7YC+I11hLGVsRPN6nmN/gfqoI
 zpsvJo98m4kaHVQ6IhPqMzjK+etYgnffmPPC0WI55VaV6hwXAnpiL2K07IfW5OWzdWGMcKR5wHY
 v81GXW/H4yLSvE067fvBT2Dy7hxpkFhDG7gTyNjjEdV61lK2xUhH9zFG1pZ51erq8vjRhw6c1Ue
 z2xpgzDZEWgR8eqCS1UYD/6jUoyZ9sNVKrcWUqnFopNp14GbdhW2qTf8YbnXjCWso4TuP44rIKc
 QKRJaYuu3ltIslg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63186-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 338F7616413
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

These values should improve C-PHY behaviour. Should match most recent
Qualcomm code.

Acked-by: Cory Keitz <ckeitz@amazon.com>
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index d837fcf7cd2f0..9a0f009c033bb 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -220,19 +220,19 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 /* GEN2 1.0 3PH */
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
 	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -240,19 +240,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
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
 	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -260,19 +260,19 @@ csiphy_lane_regs lane_regs_sdm845_3ph[] = {
 	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
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
 	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},

-- 
2.53.0



