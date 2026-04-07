Return-Path: <linux-media+bounces-58174-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHf1BXHb1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58174-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:24:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B31FE3ACC68
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C170C30D2791
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A81F13AB276;
	Tue,  7 Apr 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SPWBr08J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082083A9D8F;
	Tue,  7 Apr 2026 10:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557071; cv=none; b=ABnIBFfcLIZpdq8hK6R0dwQUklXpz4BtFqrNGhA9zIR9MrKlhvtXhd5qdLtrwSRZa8pZVGixREC/AKLuM39T2+wk2oE7HtXhOdklZ5c8HBoie/py8uAwHUDVF8XFAmbEBONdWGH7mgfxNG6ZT100XYA9nQ4NLkxL5EwUtSuoZ04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557071; c=relaxed/simple;
	bh=DGj3axpedAEnHJKp2yI1ceJxi/eU0z5cs7/iQ1HQVnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ikNmE0OJEhxhhglqlG1dUDXXhk54NvOj/NN/umblH879Sk6W6Lhfe65Rv+Bvyyd1/PXuNaXpzJ24QWcUJs+D3S5W1rMJgQfC6rPdZ3bF1Bbxu63a0H1rKwasWVzTAUyJaT6VlfgBoo4foLArQJGSmrky9p6bA5Q97ySGeYFtsSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SPWBr08J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5243AC19421;
	Tue,  7 Apr 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557070;
	bh=DGj3axpedAEnHJKp2yI1ceJxi/eU0z5cs7/iQ1HQVnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SPWBr08JZh2nLqYEjfES/B9eomNrZnB1BoAAydzZXrpT44jbb3fvUIJGZjqGWeLuW
	 RUOcuBblEuuzozZfipz5mhzZjrUcptIbrfYDYPq9QQV56LL2sFKZsOEMpiiQ0518xo
	 VVdKBeS0+2MrmfHe29IiMWdY2QKcY809fn+PdLxz/DatXp7NvaIyfS/t/2JiY36p6N
	 fb5SfP05qBmFNEZ2uxuppk3PF8hv8fC9juysM3USdKdvxA/2HZVbZGnWbZCD7axdGC
	 RhErR9AD3LS9krUTlvFLsLMwTkXCMkZtgpBAwOXYD7I3n3RM5zmY9Y7x3tx8K783wv
	 hge6CyEEwFAiA==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:17:26 +0100
Subject: [PATCH v2 5/5] media: qcom: camss: csid: Rename en_vc to en_port
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v2-5-66f6c600fcff@kernel.org>
References: <20260407-camss-rdi-fix-v2-0-66f6c600fcff@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v2-0-66f6c600fcff@kernel.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Milen Mitkov <quic_mmitkov@quicinc.com>, 
 Depeng Shao <quic_depengs@quicinc.com>, Yongsheng Li <quic_yon@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6522; i=bod@kernel.org;
 h=from:subject:message-id; bh=DjMHY5kEPdHmjL+rHzIUEVjRX9XhouTzisnS5c5xsQY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Nm2JguINIfDhCsPzoOj0czA1j1oI15dN5+nW
 UzYXH2R4N2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTZtgAKCRAicTuzoY3I
 OpgcD/48AYIaVYM1s7AXIRXAQRq7XopT5NO3olr0v/yKwYTI/+1joleWt2ATZ7Z9S3Pk7gYgjFA
 XR2LqVRcVnrpXGy5hF7WW6s+sagbDhCoQIR92DhSvNFnN7IdH/TzHcXuFIZGhOivhv+Nq6qp6ZL
 RVNAZiJWgFW7DrKL+07FKcBth/naxUacAj2FSexLboUmZzQzqgPVWhBkeV8WcrCOqac1uNuHP/1
 BatU4/cmUNbdx9BMLVD4jrfOkRgqNrttPHAoQYWPySSMsUq4UjpAc9PWldGMFKwnqllKUgMGNCr
 yQMCqF4zX6sMeAnuYNJQ9Gx+hGohOIoMEw+CnVQ/f1Tk0sUZ0rzPZze+8AeNMfj7U6tRT8/A3bF
 JU7EUM2iiqYQsvCLr3pcqYYP8SrbH9lDy560P695W3l5peDYfe0Paae51TwcFpCqMNKKsHglSv+
 S2yA4uYU3cJ4WV4/Hf8PayMO/3A0Nyj0BiitDvw6pvSQJkMb7ojF1+hzZaN/VdnoZgQ09tCxsnm
 RaR3uVDnDeLofjAOLEnM610tPF3+K2Pyme6cJSF/FOHRKJD/tHQoEte76mEqIZ50lpn5f2r/AYq
 TSYd1SbRB+RFF9JmdZcaQX2wED453c3MppkNDm9vDdHS0VB+MCdO6ftBZEd1oEzk6i+tIpMT2mH
 LOq0YhKwNT4EC/w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	TAGGED_FROM(0.00)[bounces-58174-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B31FE3ACC68
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The en_vc mask has always also been an en_port mask. Name the variable for
what it does a bitmask of ports. When implementing v4l2 subdev streams it
probably makes more sense to have tuples for port/vc mappings. Such a
change right now feels like putting the cart before the horse.

Sanitise the name in the interregnum.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-csid-680.c  |  2 +-
 drivers/media/platform/qcom/camss/camss-csid-gen2.c |  4 ++--
 drivers/media/platform/qcom/camss/camss-csid-gen3.c |  6 +++---
 drivers/media/platform/qcom/camss/camss-csid.c      | 10 +++++-----
 drivers/media/platform/qcom/camss/camss-csid.h      |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2e189efef79c2..cc6133dc8613a 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -120,7 +120,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 0fc908096a99b..b95659af9d297 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index eadcb2f7e3aaa..0e0c44d118a59 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -329,7 +329,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			if (tg->enabled)
 				__csid_configure_testgen(csid, enable, i, 0);
 
@@ -370,7 +370,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 	/* Read and clear IRQ status for each enabled RDI channel */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index ed5c5766efd36..cb6ca470dafa8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
@@ -263,7 +263,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 	/* Read and clear IRQ status for each enabled RDI channel */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 
@@ -309,7 +309,7 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
 			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
 			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index ed1820488c987..71a40c2cb350b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1278,21 +1278,21 @@ static int csid_link_setup(struct media_entity *entity,
 		csid->phy.lane_cnt = lane_cfg->num_data;
 		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
 	}
-	/* Decide which virtual channels to enable based on which source pads are enabled */
+	/* Decide which ports to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 		struct csid_device *csid = v4l2_get_subdevdata(sd);
 		struct device *dev = csid->camss->dev;
 
 		if (flags & MEDIA_LNK_FL_ENABLED)
-			csid->phy.en_vc |= BIT(local->index - 1);
+			csid->phy.en_port |= BIT(local->index - 1);
 		else
-			csid->phy.en_vc &= ~BIT(local->index - 1);
+			csid->phy.en_port &= ~BIT(local->index - 1);
 
 		csid->phy.need_vc_update = true;
 
-		dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x\n",
-			__func__, csid->phy.en_vc);
+		dev_dbg(dev, "%s: Enabled CSID ports mask 0x%x\n",
+			__func__, csid->phy.en_port);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2f..b227923ca5c15 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -68,7 +68,7 @@ struct csid_phy_config {
 	u8 csiphy_id;
 	u8 lane_cnt;
 	u32 lane_assign;
-	u32 en_vc;
+	u32 en_port;
 	u8 need_vc_update;
 };
 

-- 
2.52.0


