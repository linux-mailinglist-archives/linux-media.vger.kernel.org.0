Return-Path: <linux-media+bounces-58179-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG+wARDf1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58179-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:40:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 995163AD066
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 710D130971B2
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01733A9618;
	Tue,  7 Apr 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ays6wbuS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4023A8759;
	Tue,  7 Apr 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558111; cv=none; b=JViwvrpVOri6iWb/uTyYDO1bAofiCzY1qAGfKD0/y0cCyGGjWEBZKw4rC1XHbPLb+q63OxANFpHUC+lXgsrELdzJ7nLbkucsZKSFabyKnY+GuPHoYVJ46zcKKRMUCbWwfmCqHG9UtICdsmyP7LElOWVLYapbVTAB0LI1UpoTM5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558111; c=relaxed/simple;
	bh=VX8Uug46LlSSH+i+14I1o4WqRRC22e9JL7NTJkdIL2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVu+OVHecBYo22Qb3GIp8ZyvgBPmCnPXjz0VQqyvmhrel8kjW5b4FiaucoB6oUJSK863wcA9fHYt/7psSISBWU1xb6lK9HHwYxUkkdh4p5nH1FXXUPcLNuvBQCC52s14BdXRPqkIj6X27T2F+rtHbWYvXWunQTXlrItUZKZPxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ays6wbuS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF1BC19421;
	Tue,  7 Apr 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558111;
	bh=VX8Uug46LlSSH+i+14I1o4WqRRC22e9JL7NTJkdIL2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ays6wbuShv+Zw46EHBOLW6t9l9KD5B6v1ZwOm1syYlosSyLAa2DsuUa3lj80YpeG2
	 K/CS9XGmlhYgPKFLAS7t0XQSAXp+FOJcG4/gCJ/BvbegAZmH37Kqr6wbefODArksXL
	 09O3p+khVvhnh/iomu3NxvUgYuaqm+2xGtGBvxYFPyA1F0fRp8+nkp/N+dAf7kHv48
	 cPJ1p9zf3REhyaEuKURouWauA3EO5ro7lMvHe3WB9xDaTl7v7mt/pz+XY+/IvVEIQN
	 0/i7LHHXs0kl46f2MU3A7U1lPY84aI5VIPfOgyEPGIm7k62MUxYZ+IYrOLeiiZR2Ny
	 gE4T12sV/FPoA==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:34:53 +0100
Subject: [PATCH v3 3/5] media: qcom: camss: Fix RDI streaming for CSID GEN2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v3-3-08f72d1f3442@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6024; i=bod@kernel.org;
 h=from:subject:message-id; bh=hrKeKKgc331oZFhBS+mM9op8nYbhOMvFpP8gYBgb9YU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3P5tQ8w2t6ZyV0Nrb8rFuZ7jbNWJdxAGedV
 DAUdn13pSKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzwAKCRAicTuzoY3I
 OvofD/oCT7GJ5UxSkaP4JQw0qOGNOhvm6YBvrTF3xCj3nVRV4knEWDSme/lBSyATa/lLUN235kO
 Zalfp2WcS+fXH4Q/vC45I1iBluOSG90GWDf14nHLjIRjRkH5l/izPEXM3pcRU8gkM7IkQ/GUuvB
 0vUVG4A2pYRRrv/GjcKZUNWfSrLXnOk3zaxN2CkIGMcTxitfYjLWtXmh727huVLbTCbIXLMeQzX
 W7y4Z5irRAs29uhPrOrRDzk1APxmLN0InfMuOGWEl0MRsB9ve4gNa8IZgjdjCyFxnNbforwlzBK
 AFCqo9Qo9K1mgfzOq9S1/QUu8RIjsPQVVKhO173vauAWK9o1HDvPyFx1u3lnG0SGqnsFFGIiX+I
 ZKJl1KPGY4FommSBYERofZkDIquW1VFCgZobeSUeCcQoVX+roClRoFoZDunUJ9kK6y+NImpB4Qb
 dV93+e6SCbuQ2RHtOgc15u0E698fNXHji4NeyWtUTwIdcJCy8VGMBpz8IKih95EdgSEK+ia4QmH
 6TfuR9yI2qUtdvx2kXp9kkbCrYEP1ld/1+eZTj5WX8c23PbD2zvRZk52wi1WOBNagv+x7P6kMt+
 AciECIHQTo2KyiRSUHfnWmBTV+cMKex5nBKj+2wZHmhjnCWj+Nwa4LXovA/49w8bgDwhxQuutDQ
 kdzhxUS+4P2RqKA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	TAGGED_FROM(0.00)[bounces-58179-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 995163AD066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
have replicated throughout CAMSS where we use the VC number to populate
both the VC fields and port fields of the CSID means that in practice only
VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.

Fix that for CSID gen2 by separating VC and port. Fix to VC zero as a
bugfix we will look to properly populate the VC field with follow on
patches later.

Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for CSID 170")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 47 +++++++++++-----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5b..eadcb2f7e3aaa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -203,10 +203,10 @@ static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
 }
 
-static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
@@ -253,10 +253,10 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 vc)
 	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
@@ -267,14 +267,14 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 * the four least significant bits of the five bit VC
 	 * bitfield to generate an internal CID value.
 	 *
-	 * CSID_RDI_CFG0(vc)
+	 * CSID_RDI_CFG0(port)
 	 * DT_ID : 28:27
 	 * VC    : 26:22
 	 * DT    : 21:16
 	 *
 	 * CID   : VC 3:0 << 2 | DT_ID 1:0
 	 */
-	u8 dt_id = vc & 0x03;
+	u8 dt_id = port & 0x03;
 
 	val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 	val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
@@ -284,56 +284,57 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= format->data_type << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 
 	/* CSID_TIMESTAMP_STB_POST_IRQ */
 	val = 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
-	writel_relaxed(val, csid->base + CSID_RDI_CFG1(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_CFG1(port));
 
 	val = 1;
-	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(port));
 
 	val = 0;
-	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(port));
 
 	val = 1;
-	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
 
 	val = 0;
-	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
 
 	val = 1;
-	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PERIOD(port));
 
 	val = 0;
-	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_DROP_PATTERN(port));
 
 	val = 1;
-	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PERIOD(port));
 
 	val = 0;
-	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE_DROP_PATTERN(port));
 
 	val = 0;
-	writel_relaxed(val, csid->base + CSID_RDI_CTRL(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
 
-	val = readl_relaxed(csid->base + CSID_RDI_CFG0(vc));
+	val = readl_relaxed(csid->base + CSID_RDI_CFG0(port));
 	val |=  enable << RDI_CFG0_ENABLE;
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u8 i;
-	/* Loop through all enabled VCs and configure stream for each */
+
+	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 		if (csid->phy.en_vc & BIT(i)) {
 			if (tg->enabled)
-				__csid_configure_testgen(csid, enable, i);
+				__csid_configure_testgen(csid, enable, i, 0);
 
-			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }

-- 
2.52.0


