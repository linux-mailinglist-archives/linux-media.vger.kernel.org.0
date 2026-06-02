Return-Path: <linux-media+bounces-63455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WljbK1xoH2rllgAAu9opvQ
	(envelope-from <linux-media+bounces-63455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:33:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABD632EE3
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 01:33:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=NEtYC2mZ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63455-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63455-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A46163026093
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 23:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63483CB919;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066B1A3172;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443053; cv=none; b=XP1UqXdF6ZzPDjFKRswG2DS75gawxwgNyGWpNfrC+mQJ0L3UpIM51gLrgl0Gw2MKMIChD9yruEhqItswPOBQubrt4YUd1NeTvReJzeVQe3W8rLfdwG6aY8Zz1SpkFpQneaWZBAObxXc8rsVASLaN4VEM5qADpy7tsRkRUw6fcxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443053; c=relaxed/simple;
	bh=nJddC/Z7OwZ/rap+GYxNeDDYb1mE12SYEhchPrea2PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T8RMGsBd6dSOojwSDF5wHzMpLT9gRIC3a/AmNhK9rBRfAkyKkeZ8fFkUrGcc5k3DRvQE1UPckxARJqN6p/78AoJ5UhclrjpRPDCVxWC8qh/XcqiYUH/aef6Sp7e0+oSf2xGOzPT3AqrlKuLrLwm/nfq9P5LhmTkZfXREjaAz4CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEtYC2mZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 118CDC4AF0E;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780443053;
	bh=nJddC/Z7OwZ/rap+GYxNeDDYb1mE12SYEhchPrea2PM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NEtYC2mZNDo6ofIWMfTFOCEoN/W/2OTIHPerOsmgKNUvNrvSDbcHD2acwF6RBQSuy
	 ysmvIoGiKsjnCnbjdFAX0wgRfqQAxCxBDhDZapWYflQBkLWqiIBdDdvpNedal4ZmO/
	 tj3rwDTTx9cgfhyjBE+UV8St/aLpBsJuUe+RE21/UMgB5eKUNQxs8REJO6dnuadbQX
	 dDNQMan2PrnBLW1y8yefCScxhEuzZKwfQAgHqO60+j9Cn6I3XQWr+zp+8pYZH4pIou
	 vHOPUVoP3JMavomKL7gk2fW6i6GXlh6BqXWCtrTa5sOCzrb8w2gxiStUEDUt14aNPk
	 98Byodyhs8i1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09611CD6E6B;
	Tue,  2 Jun 2026 23:30:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 03 Jun 2026 01:30:42 +0200
Subject: [PATCH v6 4/8] media: qcom: camss: Initialize lanes after lane
 configuration is available
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-qcom-cphy-v6-4-e50de0b557a8@ixit.cz>
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
In-Reply-To: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, 
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Kieran Bingham <kbingham@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6018; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=24+txQXjEyB9lC+2OldI9aNjjI7Fi2LvMIIxQ/zF9IE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqH2eqV6s+ZIBkjJMtGsSxiXMyVQzmZymYkan53
 CRj2Fqfs3eJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCah9nqgAKCRBgAj/E00kg
 cqQMD/9tWrRrtxvqY5hT09PzCfQoBLlREfROuh5xiJ1Pwecu2GsgJw6X7YPQ5fwX23s8FozgxiS
 qy/XWqvJskGj2DBNWcmaEHkM8gz957wwMYOAB2Bt1plGWzpPpT5k5wuutsay3IqVjrRF4dsrIQu
 X885kgPlbIaIjcgeOgrX+Oqg6CrB99ig5mzEW36rwZOFJSOI9PydDkNoky6WIIVKekshhCVAM4f
 loiXeKyOub80/KVyl49X02nCl0qMWZ8thWA5dpIT4mg8ho++EWltNDa6v8Pz5D34Cn/rO8uGQ4M
 vjuanjjNeCuJpBHVD0DAMqebJ0AM6GHn3K66gFQ05WACyog8KRRfSiGP7c2qnK7wgBlSawGgkDO
 OrhqJ+UIQVPcclfCqlOQ22cq4toY+YSvCvqtUEwI5yeOexXfCBuNIo/TNdyFkUc8jqjYBtp9h0v
 m5REvffY7EoIpRFcW7I+itnQshaDS/OH9M01BJ12InEmhAYsQbWXkK9j6hga55wOMXpFteBaTS2
 N6a26YSLJBX/gFZ71FywwtUmD9L0jOSDcYRQ+GA1FV0BF1ye+FlUxBtkU1ria57kliN0I51hx8n
 skL4WcdBtZsoGiSvsgVRJm3Y2+qCIVX1W/bGMkdTDUp953t/9j1m9+x/y9qosbVijVWGLMss5Dn
 GrWnn1rBtQsOjfQ==
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63455-lists,linux-media=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:todortoo@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,protonmail.com:email,linaro.org:email,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEABD632EE3

From: David Heidelberg <david@ixit.cz>

The lanes must not be initialized before the driver has access to
the lane configuration, as it depends on whether D-PHY or C-PHY mode
is in use. Move the lane initialization to csiphy_lanes_enable which is
called when the configuration structures are available.

Co-developed-by: Petr Hodina <phodina@protonmail.com>
Signed-off-by: Petr Hodina <phodina@protonmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Cory Keitz <ckeitz@amazon.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 131 +++++++++++++++------
 1 file changed, 93 insertions(+), 38 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 15876eb973718..938c365eb352f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1163,16 +1163,108 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				s64 link_freq, u8 lane_mask)
 {
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
+	if (!regs->lane_regs && c->phy_cfg == V4L2_MBUS_CSI2_CPHY)
+		WARN_ONCE(1, "Missing lane_regs definition for C-PHY!\n");
+
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
 	val = 0;
 
 	switch (c->phy_cfg) {
 	case V4L2_MBUS_CSI2_CPHY:
 		for (i = 0; i < c->num_data; i++)
 			val |= BIT((c->data[i].pos * 2) + 1);
@@ -1231,63 +1323,26 @@ static int csiphy_init(struct csiphy_device *csiphy)
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



