Return-Path: <linux-media+bounces-58181-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SG/uCV3e1GlUyQcAu9opvQ
	(envelope-from <linux-media+bounces-58181-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:37:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0743ACF90
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB577305B2FC
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09473AC0E6;
	Tue,  7 Apr 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUfrKZXQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E70C3A9DAF;
	Tue,  7 Apr 2026 10:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558119; cv=none; b=q/GJsLIbWmigkD4TtETxG6EaUtB9lT45Yhyp/cCcFYrtnExgp3Z7Qk6VMlQ2fmr+xdRyyCDdvHDVCTxmIrV2TdXj29AQpcqeAWqt0FlLW19QaHdM7Tn8YBpGj0tDldyCb+qXLNve1j3QFhV9WIQb7si+zMS1cdwikmou+TfY8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558119; c=relaxed/simple;
	bh=7lN50TbBT65Qepzs7fCawSE17YeYK9JRukIRgilMah4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBmEeVzvGAOFRZ2pJ/yzxlUSGx9S1BVXWZTfTdyE15EzyiVAvve+dFmxgN9l0e/TkpropPyBcIWNis4jsKJBFGfvW4vV0JgZdnBYsfPSjU84LTc7X5OisdbEiE41+P3ThUrIYnbV1qJXJvyKsn7VsCknVInsZ1vR9cIMVJs1dYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUfrKZXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F11CC116C6;
	Tue,  7 Apr 2026 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558119;
	bh=7lN50TbBT65Qepzs7fCawSE17YeYK9JRukIRgilMah4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jUfrKZXQ949G0fIjm/2TEWdDkDXv7BUVmHOkCLUTEAGLClIGSCuTmhh1Z5Z3xago+
	 TJljnR7ZA/NuMV+zds6L9gG1/hmzH8hlg1nHNe8HMG5RuL58RTYO7mKdOSDHYb3Ww9
	 FGJW+8UVVf1we3QK2qZR/TyYKSvNuZA9DgkO9KoYZcIboJXWzH6BCfmPd3SXCvSnzi
	 llx6eL7h2R+FJEHw0EjglLGMuQINFRVpbMHRWBHHlEE78s93pNfWNz3hbSAx6N0N5/
	 W/gmboMraBgfS98w930hi/dHrDooxGXGGtsQP0V3r0L48ktb02fq01exgXCntGbT8H
	 OxV2wc5mJqs2Q==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:34:55 +0100
Subject: [PATCH v3 5/5] media: qcom: camss: csid: Rename en_vc to en_port
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org>
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
 h=from:subject:message-id; bh=2byFO2j/OAVOtiUOMFVNCQ+yFp860hOkzS7MmRPim40=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3P/TvVf3jkbxyHorwNxV9GPW3bEPMG5YCBo
 b4uxw7JdImJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzwAKCRAicTuzoY3I
 OsyLD/9m/IdZYvnJBP5iaifnhVJbc6KGfNnW+PB2z23IyS/K+L71T1NL7qTo5t+VZFhB0V7XlQP
 GrAQX0IKBVKkDxS2D275OinReb8tH1iRLsF9fcVMoi3ZhYctnZMWiUccmyhNDZ3H+VwjDti161q
 nqUzPp5azu0dWrNpoEsGXf2kVMjPPmhMUGqrPmWY2dd/F9OzGS6FbP7UmBvtWf7qTdHlFel0xeH
 LJcR2X1xEbExzFIwSZGNNHv3yzfe6g1MgVlrg1g1586maHimMYQnYLJaNrlXxF761BTzP3rue1C
 cPgOOU5Jx4eCYxb2n24K+Ow+r4ZAXntpSD7GPShTSQfxugtz/VKVf9Llcywy1sUMepx0n8CADwR
 YVRIj+8DCOQ1P86L2EUY0WXtFGSOEOqXB1q2W3zFSxdKnLhLdkUBvWGiRxd4sWQ6PvYaEiLVu3Z
 v/YdksML7epIrER9fzc2ZXxacGogDhsBXUPmPiRn/n20SZqxxn2DczIStexXekoBFXx3jGE8Zuv
 88jbGlpTMytad2IBXQwiIEsY8m4lzRJ/4yagSkGqTOf+eHifKdMDyyYbvM7m3Yg1nQaQQxK/wgy
 Z6Mu/yeGMcOxhdd97jBiAUEOlJG9xbu50JSneB6iYkvn5K4nBjIJnltVi/to/fX8zovO1gwjeEv
 0nWMmLEEFkLN2VA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	TAGGED_FROM(0.00)[bounces-58181-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D0743ACF90
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
index 0231985746edf..6827d76bef5dc 100644
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
index edf01ba79907d..e530639456ee1 100644
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


