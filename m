Return-Path: <linux-media+bounces-63181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLGUKyczHGoOLgkAu9opvQ
	(envelope-from <linux-media+bounces-63181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:09:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F96163B9
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 15:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5567930492AF
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2026 13:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CB338E120;
	Sun, 31 May 2026 13:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="du8wMt9T"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22630C35C;
	Sun, 31 May 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780232893; cv=none; b=FTJqB06ATL5n1AGe0eFmr/iONBw9v2y1cjZVPmCwNHcjh8UCB2ZUjUoMAXE7KGoyAdd3hjnod3S2VsHd/CnV6/xCr9ma+KpFPLoliicSlzB59kZGIikNY87x3itgjf92yX4NqvVPU+EU7HiM2yt+8DcOMZYnfE3gke0jSUUxQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780232893; c=relaxed/simple;
	bh=QjbgkcU5PIegFa3GX1Vtv/S8QqtoQLmGROlA/j1cPz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZH+PCbVaIvbkoVteu0Xez+7Qi68B61i22Xyp/E2mXm3KytaqrBXeS7bodsfT0gCL2F3tQVldNfTdMpv3QaO1HVRK8dooH/mrob4YGCzeEToZxrxS1QO92fOCjxF4i8ZlyzXUUacmMlgWw4Gg1WcgQFHulw62ZERt+AOL2p9BOm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=du8wMt9T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E40A1C2BCF5;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780232892;
	bh=QjbgkcU5PIegFa3GX1Vtv/S8QqtoQLmGROlA/j1cPz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=du8wMt9T3NyWJu8WEy7GwwrQy66lgp2AefnqidQlU1pr/rRjlpWTURaLpCl7N2zuH
	 IFGqN/4QwssI0mMe1ggAG8PbLfi6YZJczz0+SixCziQDC+x3emJ5lvfiFCQP+B2f8T
	 Xd0dUMwBeRGZ7yPPg/A8/sQwujsC0evBaq1yxoJdxyWnhW+6VktaibwgxlYbLtzesJ
	 8C9QOW9Scbwe6DqFKFam0ZTFHsPzP/Nmh6OwG77Jmnphrgi0KwCWZcRvpGqxU4vt2k
	 stH9ejAfy1ZAg0UHgSleGWin1PeIJx8dzt3o15vtbjEfJdwnYD1za8XNL3RYrqf1a2
	 7jx9FYyiNo3VQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6504CD6E5E;
	Sun, 31 May 2026 13:08:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 31 May 2026 15:08:12 +0200
Subject: [PATCH WIP v5 4/9] media: qcom: camss: Initialize lanes after lane
 configuration is available
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-qcom-cphy-v5-4-6be0f62b4d65@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5950; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=dWOt5dZdmn593tye85C2/K4nGj/PKk/cJpue2OmW62I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqHDK6Fksemqu0EcgXqA2yZFBAkKkR8QedjRCQV
 t/wvPhPSF6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCahwyugAKCRBgAj/E00kg
 cr2hD/9uz2KhHVk7XvMkm8LPSzWoiyfrony7/e1Qc9dtiudlrMu/7VE3mnBNJS/d0f38zGyimf4
 CUFOO+GXhv0HkSgnu7FDgHb21t688y5V/V114lrMAtwMkrqMfAwNdDT5FIzwVTdVjdIpJPo6rmc
 i3T3+cOlU34hjWMIeo6EeNw3380S6HqLJEMCNXIliU5wIxz9PQlyh5NaerLgUG/vHymgSD2EzJq
 GRTgwZ4dMenul4ELPhseF8JK0owvSPav4ZGzY/9fD6ldHdbCKEHQKc0oFtrnHgYJfYF9HJZOKYz
 JfUzL/fyuRnXJNFUT9Tn94QSmCmI0WKJpl/lN9rf1t+GhfBBpZcidOH47EgXb3Dy9klBBrxQtAC
 fqFhFr6uitE6OD3vS2HYwZizWo1ekIHJIf6MN8E91tHGl/C1kvc6SeBOhd6VMOFQYD7FuHqbwDs
 L8FeZir0utKnatTbb6HS/hHhYqEnFZrZTnqDh/+221NmpFSFZTQMxx+wRRPiI8SmsoMUamf81LG
 NBCEi5dSpL64rIx1fzRtS5ndYMYQJjYczXBdsV1zuP4Ab+xBJRwhwDTFqxpKny9+G9mcmUlpwPI
 lr7Q/arfCwvARaQhqGZwurXuMqka2TD/JN4Ltc4hsiMCeikQCldROsx/UinhmgFcSr2W7883+NB
 Yc66quhVvHJcePg==
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
	TAGGED_FROM(0.00)[bounces-63181-lists,linux-media=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:replyto,ixit.cz:mid,ixit.cz:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,protonmail.com:email]
X-Rspamd-Queue-Id: 412F96163B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to csiphy_lanes_enable which is
called when the configuration structures are available.

Co-developed-by: Petr Hodina <phodina@protonmail.com>
Signed-off-by: Petr Hodina <phodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 133 +++++++++++++++------
 1 file changed, 95 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index d4624417a7424..8bcba6107471f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1164,16 +1164,110 @@ static int csiphy_lanes_enable(struct csiphy_device *csiphy,
 {
 	struct device *dev = csiphy->camss->dev;
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
 	u8 settle_cnt;
 	u8 val;
 	int i;
 
+	switch (csiphy->camss->res->version) {
+	case CAMSS_845:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sdm845[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
+		}
+		break;
+	case CAMSS_2290:
+	case CAMSS_6150:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_qcm2290[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
+		}
+		break;
+	case CAMSS_6350:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sm6350[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
+		}
+		break;
+	case CAMSS_7280:
+	case CAMSS_8250:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sm8250[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
+		}
+		break;
+	case CAMSS_8280XP:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sc8280xp[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
+		}
+		break;
+	case CAMSS_X1E80100:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_x1e80100[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
+		}
+		break;
+	case CAMSS_8550:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sm8550[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
+		}
+		break;
+	case CAMSS_8650:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sm8650[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
+		}
+		break;
+	case CAMSS_8300:
+	case CAMSS_8775P:
+		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+			regs->lane_regs = NULL;
+			regs->lane_array_size = 0;
+		} else {
+			regs->lane_regs = &lane_regs_sa8775p[0];
+			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (!regs->lane_regs && c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
+		dev_err(dev, "Missing lane_regs definition for C-PHY\n");
+		return -EINVAL;
+	}
+
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	val = 0;
 
 	switch (c->phy_cfg) {
 	case V4L2_MBUS_CSI2_CPHY:
 		for (i = 0; i < c->num_data; i++)
 			val |= BIT((c->data[i].pos * 2) + 1);
@@ -1235,63 +1329,26 @@ static int csiphy_init(struct csiphy_device *csiphy)
 	struct device *dev = csiphy->camss->dev;
 	struct csiphy_device_regs *regs;
 
 	regs = devm_kmalloc(dev, sizeof(*regs), GFP_KERNEL);
 	if (!regs)
 		return -ENOMEM;
 
 	csiphy->regs = regs;
-	regs->offset = 0x800;
 	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
-	case CAMSS_845:
-		regs->lane_regs = &lane_regs_sdm845[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
-		break;
-	case CAMSS_2290:
-	case CAMSS_6150:
-		regs->lane_regs = &lane_regs_qcm2290[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
-		break;
-	case CAMSS_6350:
-		regs->lane_regs = &lane_regs_sm6350[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm6350);
-		break;
-	case CAMSS_7280:
-	case CAMSS_8250:
-		regs->lane_regs = &lane_regs_sm8250[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8250);
-		break;
-	case CAMSS_8280XP:
-		regs->lane_regs = &lane_regs_sc8280xp[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sc8280xp);
-		break;
 	case CAMSS_X1E80100:
-		regs->lane_regs = &lane_regs_x1e80100[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_x1e80100);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8550:
-		regs->lane_regs = &lane_regs_sm8550[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8550);
-		regs->offset = 0x1000;
-		break;
 	case CAMSS_8650:
-		regs->lane_regs = &lane_regs_sm8650[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8650);
 		regs->offset = 0x1000;
 		break;
-	case CAMSS_8300:
-	case CAMSS_8775P:
-		regs->lane_regs = &lane_regs_sa8775p[0];
-		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
-		break;
 	default:
+		regs->offset = 0x800;
 		break;
 	}
 
 	return 0;
 }
 
 const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
 	.get_lane_mask = csiphy_get_lane_mask,

-- 
2.53.0



