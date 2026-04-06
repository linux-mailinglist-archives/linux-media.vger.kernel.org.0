Return-Path: <linux-media+bounces-58136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFwLB/0r1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C30FA3A7AE6
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9AC1130374AA
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954AF39E16B;
	Mon,  6 Apr 2026 21:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DZ0kM8Ov"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB37F39DBE5;
	Mon,  6 Apr 2026 21:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512528; cv=none; b=q0cja2iaLDM0bYLCd2Y3/ryir67C/Jt7D/U02ipYP/00dEr3u8UZ+IVpOT41vo8djuBq1tf3GYmMK+bfp9SBIOecgjz3/wJQlXuakRi+rtowEHgH8j6vDU1TsqF6LMZUx/2JXjLikhMNchHey3gwZRj5pDlEEIou4f1VHPb02CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512528; c=relaxed/simple;
	bh=0QxvyC1cn7tK46cplqZeg4qdzMokeBdIQRwpjkp4/PY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PN3OWLYjREKy5ORTMOnuTtcCqAGWosPBIQpkX+DYaTprQK+UVS9yvYgbIUXdA+oiLeB8e89aBBZzQfG0vIb5YjOxT+eK5V25/BuQ9AiQrosSQoom419ly3vgzQn1rQPgSnxqh7K9FrBwM90Ehkit02YAUD4n4drSKHtzDmvxTc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DZ0kM8Ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFB1C2BCB0;
	Mon,  6 Apr 2026 21:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512527;
	bh=0QxvyC1cn7tK46cplqZeg4qdzMokeBdIQRwpjkp4/PY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DZ0kM8OvzNV/Yyvll39n5LpB/qUD71OhtJ5INo4VPJKr4xsX4we57wmSQvIG+hgbD
	 Ycyu1f3IUCziPde3SM6y0apNMf2Oyz7xP+EdKNFH8Asb4SnooITbwVPe3Qo9pJJtnG
	 EUa87WVa7JjHNMfA1ZeqpJMnI+ChVGZ35u2t2yRTZLlpiHhOougDtBy+G5COPfbtln
	 P1Jl19PI6a10GGX3IYgc+9c5uEsSzqKV12Z+vv6i6HwDmBLdkxbnH0Q19Eq0VVCDyB
	 qUpaS3uuYZOGawzCkQHLz249b64vdtW2aBy1bYod7Q5FnJsJIIjBrfRDDKrWrld4Fo
	 FG/FDmJ3fYYXg==
From: bod@kernel.org
Date: Mon, 06 Apr 2026 22:55:05 +0100
Subject: [PATCH 5/5] media: qcom: camss: csid: Rename en_vc to en_port
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-camss-rdi-fix-v1-5-d3f8b12473d0@kernel.org>
References: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
In-Reply-To: <20260406-camss-rdi-fix-v1-0-d3f8b12473d0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6492; i=bod@kernel.org;
 h=from:subject:message-id; bh=xsT0Ris5mi9SRI4eg7YgmmflBFr6JlknESMVmg1quFo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu5kDTL2DMit2Fr0OxlMcDFKm7dOkszYdbpc
 ZDg1XtBHXWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQruQAKCRAicTuzoY3I
 Ort1EACL16ZwfQVG2NlCsqrfv3/hoQovZM7zC4FXU5MZjhC2lB3oMbuyb0deAYLV9+c+WwBBNkq
 FufBoDilKaUOED5StrjMUKvVvk2JFUzRkjO975IgafSPFU33khHWu0rYW084y9Q8QDpIndG4gAy
 VA6LBub1mV+nnNrYZSr/vwhedj2TyEMRJW4LU02y6ndMfi4EawlY7Z0nDAn8TkDHfuHA4oOxLsA
 kUvPrGJh1OmxPJaFq13isv52PLyZYoYDvzP7O0p93YOZTMdRDQRYug+CEKsTDHATROEG4wuM/4x
 LzvX9oQgPLvklOs9MXiyDYYWg5viwcWb7/cAFQrspL3yMTROv1fYnE8wDD8yum2cM80TFVTuOc/
 cEYBfpcuYYYafq2a90i0l6ev2+nSiLJX8HcOqur5rpxoWLkBA/FYOC2VQqAYtkBYQ5H4hUmEuUf
 /W8vBhKDG3byzpgRy4/P3BfH+VN668f1TTMnqKGwSYmGkVYKFic0xGhAF8epmTYr9jyZlk8LzaU
 ffhF4f0pPjnbgAEt+VwGMNxVDBH+HguFIT/oY7/WuS3nTV6B+tqA4maJljVbHSODoBfJxlQzokM
 35eiYIci+INRBXLBzmGXcDOrnHPGTrPMIlTFuUSGV1+MqyMqrd4G0nl3gpYSHu5ucMsG8qsTNBG
 6I4Of+srKFEuXug==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58136-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C30FA3A7AE6
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
index 5a7271785ec7a..da5e03b340bb7 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -119,7 +119,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	__csid_configure_rx(csid, &csid->phy);
 
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 35a6bb209f97c..80d8bcd6e0854 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
        /* Loop through all enabled VCs and configure stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 331feed199094..e2d14b25f8c85 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -328,7 +328,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	u8 i;
 	/* Loop through all enabled VCs and configure stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			if (tg->enabled)
 				__csid_configure_testgen(csid, enable, i, 0);
 
@@ -369,7 +369,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 
 	/* Read and clear IRQ status for each enabled RDI channel */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+		if (csid->phy.en_port & BIT(i)) {
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 		}
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 73504c349fd0b..b92234ba84efc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	/* Loop through all enabled VCs and configure stream for each */
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


