Return-Path: <linux-media+bounces-63182-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLu8Cn4zHGoOLgkAu9opvQ
	(envelope-from <linux-media+bounces-63182-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB756163DF
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80FB5306295B
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAFF38F638;
	Sun, 31 May 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNQXMZZL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6581A381AF9;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=ihdw808GAVeLkJaBbZgjLwklDl5PwWE+gwZRflTie+3SfoY/uEnAojXSx4lSWT2HsixP0Ze/uN+kG8FcCkhwUF/gWGGvcpNkIAAKZrrf1+zlCe6XCaYh3sfQ56zgeCJNE53UVu+pYCJ3ilDh29ODtvTKcYYfX2hugy53N/pXqqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=WZS2gcxy/TsJR5NCwLJktnFNHh5bvltTB/UvYeEc+5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJFDXWZDGoYyhSHfJobuAOejfopmkGLM2FMsZXQiGCjI6EuuVN1Zggld1sB3y1CBWBJ0M+qU9WMrbMN2vMEBpwqFaAJWH1LAO8ZT60LhONqesWqGz8gpZ+4sf+5vOo+NktODYJ/YEE8coJcGB7XYcIuxwKo/NHRE8f+QYI5XpZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNQXMZZL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFE3AC4AF09;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232893;
	bh=WZS2gcxy/TsJR5NCwLJktnFNHh5bvltTB/UvYeEc+5U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nNQXMZZLKvcAy4MM28RRmxbfKKdPqXZ8U2fo1vkVVOJqiMl0pRI/CP1PbbaBXT9Cv
	 QuykgheJVQafiO2P9WL2Z3v+WW7UL4w6bgWKFstq0B7re4vt0+vSCqeDMfx5RMbWA5
	 0hXWcmVTvVeORA3bFv2NJbp7PbE6XtLym01JAASAANDI73rnXmaMBqzovs/aOwctLy
	 bxX/8ix2MUBEdDZYLhCC9Qo7/uAp06t4UuFUeYHj6rhakpv0zw2qSII+DuBSxzbv3W
	 zMfhmQaOq4YwysT/FE+DgTkYAAfi62KawBKLeIGKHMPLJP6nLANrySmjmvEEsYCs7I
	 tVnp9Acuy4oMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37BACD6E5D;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:13 +0200
Subject: [PATCH WIP v5 5/9] media: qcom: camss: csiphy-3ph: Add Gen2 v1.1
 MIPI CSI-2 C-PHY init
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-5-6be0f62b4d65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6019; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ZD+7osDKgzkvB3aOGbQwCFXE10n7F9+DrIYGcbeKbHI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK6P1CxxDWIj6ftOYBr48kcn6sbncvUSessU
 gvIGbAu/v2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyugAKCRBgAj/E00kg
 cth3EACDLdXP3wxk5QFqRva6HLMS1P+q4QorW2L3uvQR129kC0DqmMEAY0Qq1WMxXyRf2GJfGbh
 XkwT1iDkvqFnZxT9+OBvrdqIihSBxDii6JFnnjepZbip4p+b5XtI8ZFCA+TJSWh9h6aEkVE8s8B
 pTSXdq4Cz0wtjigpy6dLaOdEtzbCmwNhgGI3vmhpRX9kRQWAGtjgX1F2C/CbQzX/OR7vNTIghE2
 O22/IyiOFQxG3H3GKFOQEwnlsU+lPtZyJEgXcgLs4CyRh9VdQUveMVrLTsuKdApkY6RmHtN6NrL
 rPRjS3+8GSJcNGpJi2VlTGLFRSFol8s4TaxSmvq4LRbYGhoD0DVam6yH2th1rVCko5+QDHs+iJ2
 DMM6/S7MnKobtyelIx774Eg1B5BVfzqX4YCGy1XlVaLlP+W0lusBh9gwtWK2kJdgdUckOvOSa5l
 hoUSLs4rzFhpnHz7cB1UQrtaLhp0kbNVv8pWG7hXHxOiEekunB45E+MRlwlADYiNlY+Wv40c3NZ
 rZQXwKU39JlwspMShB3fvErElltBh1Iy8rAastkaDvZsLAahoBMRaKod0bScdL3nQQ7d9BYQXbd
 MjmUtsVtdOam3VvxIIG3f5YqagpHBkGcnn2iwEW/Oq7T/LqoJEjGCgTiQdr2hJmP9pD247UrgmA
 VR0rBpMrMr8nm3A==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63182-lists,linux-media=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,linaro.org:email]
X-Rspamd-Queue-Id: 7FB756163DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

Add a PHY configuration sequence for the sdm845 which uses a Qualcomm
Gen 2 version 1.1 CSI-2 PHY.

The PHY can be configured as two phase or three phase in C-PHY or D-PHY
mode. This configuration supports three-phase C-PHY mode.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Acked-by: Cory Keitz <ckeitz@amazon.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 70 +++++++++++++++++++++-
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 8bcba6107471f..d837fcf7cd2f0 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -141,16 +141,17 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 	{0x0460, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x065C, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0660, 0xFD, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
 /* GEN2 1.0 2PH */
+/* 5 entries: clock + 4 lanes */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
@@ -215,16 +216,81 @@ csiphy_lane_regs lane_regs_sdm845[] = {
 	{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
 	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
 	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
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
 	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -1167,18 +1233,18 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
-			regs->lane_regs = NULL;
-			regs->lane_array_size = 0;
+			regs->lane_regs = &lane_regs_sdm845_3ph[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845_3ph);
 		} else {
 			regs->lane_regs = &lane_regs_sdm845[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		}
 		break;
 	case CAMSS_2290:
 	case CAMSS_6150:
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {

-- 
2.53.0



