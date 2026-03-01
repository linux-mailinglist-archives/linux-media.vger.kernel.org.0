Return-Path: <linux-media+bounces-53863-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCKKKzuOo2ndGgUAu9opvQ
	(envelope-from <linux-media+bounces-53863-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:54:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDA41C9E83
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 01:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBD84302F9B7
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 00:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A68D274B53;
	Sun,  1 Mar 2026 00:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKAzhGzu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847A1FC101;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772326283; cv=none; b=ua8UKQCDlZ5URAlJ0BpKumnmdhhQhqBiPL+xUoin9tNDNK8kIrdV6QkHpSJ4y6keDWmHruvKmSSe/YJ+WZmsbaSZatVMi7RZCK1cdPlMFfhPTggEVrOGl609+sthn5S/OXFew5k7JqBambDlUiQLH8neeV4HF37JvwiNsvSWk0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772326283; c=relaxed/simple;
	bh=GIAUjbq9PiCelPqfa+JCpuOravGxjjBAbE3pFshSze4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jiy+ct8HrkC5EgpG+MeSzMEkIfI/bTi4NuvaJKH06bj/+uvUOqCE69mohMJC8PuJhPpJ8aSYYXj7ngF0REvGAKiCL+muiNyILdhbuNWxVuBHFlCXZzbzMl7vWYMKmtHxKAeGRHpiFjnxXGwYWk9aY+IbWve3C6EdpAtg6ynnNsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKAzhGzu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 887A0C2BCB1;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772326283;
	bh=GIAUjbq9PiCelPqfa+JCpuOravGxjjBAbE3pFshSze4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tKAzhGzuQ39T89220eO4Rsvxr6FFUAwTWvUuPNr3G/xrOb3vUAyQUYkuNskHKzV/V
	 yrTFKYYZn8fFaWfLJZ3HAJyI4JIIZkQsnxVQ5e8pynWGDjxNC1p+ik7RwUSN+zDrE5
	 8csDBY78QOXR1IkMmMJ+hWPzKfYgo1i061lfQqKpVaVX8RW2e9bggmQZ5JGc2SbaCs
	 yYWNceoEM80sjnzABc3QMd5y1RkbO+kCBG8AhoIiuoh2Z3mzYLdNYam+GgPl++cogC
	 K6s0eAcF7GRPeM9IJK7t9eqc2R7JDlB8fLEtiJloXpfiX9p5QvDbra/FVQDMt+bBGd
	 E5U3432Gx5Bqg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBBCFD0049;
	Sun,  1 Mar 2026 00:51:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 01:51:24 +0100
Subject: [PATCH WIP v4 5/9] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 CPHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-qcom-cphy-v4-5-e53316d2cc65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4775; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B1E9kx91YD51I9W2PKm9POghBayKJYyFPNrgNOQt3hU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpo42IDCXijuslERtph+rHkWK9nDjcjyjVMsYAA
 lgNDnh7QreJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaONiAAKCRBgAj/E00kg
 clkMD/471+PnP5TpNyauBg7ZKBeZd8ue2c14C2VnIMYlu+vz4bdAAoEwIeZrhWmZdnC0IlUKoj+
 fnYZYTAcXPfhnaOddUyWFj9xpQqrb6riA9Z6rJmpN8uL6ZcBs2+HF7l4NzO71dw5aFLfvAnAb6/
 e54PL5UYAeCZkmbeKjoCkEDgfHUEEQM3NwIAD1H60OJ3NPrdA0xJQxUw+O0i1OeBKV1kY0Oupdo
 7Lr56FbT4Yd/wVdpWzDhVNnRRKNirwCD183oZP7w39IMeKBlScUxCZ5T0FQ9K9fe3UrUlOgMP+g
 SjiL7oTcnSeQYUUNYgsBXNxSKCbVDcssnh5mrQV08g9wHuaJzAgdE3y4THgqGVZetam+AnS3r8A
 tdq4kR8Qg0jrFZOetZ5NncNEJkPBFPhSyy3ms81caDDdhO6+uBu1toDlIy9agaLe71loF2SC34K
 4pwvMtqkbkblwfwGo+/M27cBmE25RfkihuMfeGZriyuD9JiX0ubC4gsOL4+08NwA5peE8PKOy24
 z4rPlBiKULK9lR3wte2gXozOsKQG+JO/2iwrnLOKshh4ruxxq9yw51KKY/0TxmUsv7/k86NGfcm
 FHNILCu3QW7DREoBgM8sgxsSptk/Pn9yTRGYRiH0XW5TzRSxU6CC3DSeg9enS5NRIS9t9hQQBZi
 g+gTq6jNGVHgKRA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53863-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 0FDA41C9E83
X-Rspamd-Action: no action

From: Casey Connolly <casey.connolly@linaro.org>

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports three-phase C-PHY mode.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 72 +++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 9748208107222..5482fb5163e17 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -146,6 +146,7 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 };
 
 /* GEN2 1.0 2PH */
+/* 5 entries: clock + 4 lanes */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -220,6 +221,71 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* GEN2 1.0 3PH */
+/* 3 entries: 3 lanes (C-PHY) */
+static const struct
+csiphy_lane_regs lane_regs_sdm845_3ph[] = {
+	{0x015c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0168, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x016c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0104, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x010c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0108, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0114, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0150, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0118, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x011c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0120, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0124, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0128, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x012c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0144, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0160, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0164, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x01dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x035c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0368, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x036c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0304, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x030c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0308, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0314, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0350, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0318, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x031c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0320, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0324, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0328, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x032c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0344, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0360, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0364, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x03dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+
+	{0x055c, 0x43, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0568, 0xa0, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x056c, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0504, 0x06, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x050c, 0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x0508, 0x00, 0x00, CSIPHY_SETTLE_CNT_HIGHER_BYTE},
+	{0x0514, 0x20, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0550, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0518, 0x3e, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x051c, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0520, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0524, 0x7f, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0528, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x052c, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0544, 0x12, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0560, 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05cc, 0x41, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0564, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x05dc, 0x51, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.1 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sc8280xp[] = {
@@ -1050,7 +1116,11 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
-		{
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = &lane_regs_sdm845_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
+
+		} else {
 			regs->lane_regs = &lane_regs_sdm845[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		}

-- 
2.51.0



