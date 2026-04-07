Return-Path: <linux-media+bounces-58180-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDcDBgTe1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58180-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:35:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7E23ACF0B
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5567301EDA5
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9533AC0C9;
	Tue,  7 Apr 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6JvjKHN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540913A7F46;
	Tue,  7 Apr 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558115; cv=none; b=j2qJOPwfAey5+Lr4hsVSWNqkJR8Y4R+68MnUVPkq4af2i6O8IBsiTuEZvqWSRANaOoqkjvYocv9w989N3S1gJNigskxOCwO3yePJgOFRwcvewIi6lbvGT5RsTT6wW5cnOVg9BuzD/YHvGVmldy8rpLQawBlMGdAtn3yuxPYxFew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558115; c=relaxed/simple;
	bh=Iw/0ZMUWO2zJVSR27I/5GetL9KxeKyvBcMMEYB7HZ5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzQZZVZsC8cYKzM5gEc/DrClkrbnj6hUmQCyukRfJaoCblXatjbIPmDK7xNiLvxLOHSP8zZyJh3Dn5W+tBfAWNPACoTGURncCGueNCCTl0CfEzOaXJjtw/c7qYLGbWib9SKDDVw9aEiIRbvtFpqT3u95jCra/PfqaFx2cAm4fgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6JvjKHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D36AC116C6;
	Tue,  7 Apr 2026 10:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558115;
	bh=Iw/0ZMUWO2zJVSR27I/5GetL9KxeKyvBcMMEYB7HZ5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S6JvjKHNM2UHtrZlMGOU0vQE8t3ifHI72a1z7Fe6yM5HQglG7VUuO6NUvq6tLJlBa
	 C6oIibc1QsyiADbt9HDKY2ARKrBsogP/ixIw8J6jmXDOKVdKu3SVcE9ci9lTFU00Wq
	 L7cINQ1i/jr0jshNciD/l1j2TxN60lxYwQjOV6FBb0i374pTeJajhiHt/J8Zx7jiBS
	 Veer/m+2N6ixvd6XKVfyK/HMLaqR8HQpPK9Vz2SsH7oE33mfV4GWfy0Q0OznC3PoIP
	 n98cnhmn98eA2q9FBwy0z/x211cXDofi5fQSmaXtlRUfFcNFNXQwW7MYMKdgv6VsL2
	 K1joXLljddxgg==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:34:54 +0100
Subject: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID GEN3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4312; i=bod@kernel.org;
 h=from:subject:message-id; bh=s60sIJaXGpdYqv090mjDLH9kxg4goK1KRKFRBCPJ730=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3PPcWeqJzFYPw054Mxzqik+A0Dt6Ff1PTB1
 U7pAfMy6aCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzwAKCRAicTuzoY3I
 Oo6lD/wJdiXDtmVuFU+C2RZZO1jj6iYhJG9i695vk/L5nMyL4sPMhl/wi98I75S/SmkhAxQp1Z0
 /V5FgNqZZ6yNuQT95dJKTSIUHO4FPGAB0HG0btmlpT5GlO/7tHZ7gRbzZ3WAn/H1GMCih1HMnAD
 ee4PaKPUHksBruSQFvK+nqvBHkPnZduwZ7DFORowJa8Vd/9c2vHGPgZHbDSFhpY9MWaaRQyWm1Y
 WWeD2XHKlrN9vnMlpTs2nyzDL9PPc+6WJiliLeB/ibjnPR6KBGMcMZgZtYtigTBgHtARxjl06jR
 MpJ9mZxIoIjEIuUr8FGJxDYUGf7Qf13nm8xtDjGu9Gs7g9dlGiotlzKKbt0QqblbMtCqnQ6EmT6
 EkN2WWtxSxI+74lwscxJP1kD0yNQZMAChocFHjPLE2WhQcr7smzDL6tvQBnB3yjWWA0+iF/E1bo
 wk/UBkKVRV0BiQjuZ/u2ZkyzsLXYby/utqdrJj5di+7tTn0rYxiw34wVyTD7VtoHKlT+NJrPPbJ
 FAw7WNnWJVqhSXxCZNjMMa46RI3pP2rtBU5DbSW9o+gIH3iVbcDx97IJOSiksT4ahhct1kkAY+x
 UTyRxacrUlDJFG1DFQVQiJ8oGuuXxr93sjpYB+p03U754sDBSol9l0kTCFzuVfniLuPQhbjvU7i
 M31EY+W+WmRO1Zw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58180-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD7E23ACF0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
have replicated throughout CAMSS where we use the VC number to populate
both the VC fields and port fields of the CSID means that in practice only
VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.

Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
bugfix we will look to properly populate the VC field with follow on
patches later.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index bd059243790ed..ed5c5766efd36 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -145,12 +145,12 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	u32 val;
 	u8 lane_cnt = csid->phy.lane_cnt;
 	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
@@ -163,14 +163,14 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
 
 	val = RDI_CFG0_TIMESTAMP_EN;
 	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
@@ -180,7 +180,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= format->data_type << RDI_CFG0_DT;
 	val |= dt_id << RDI_CFG0_DT_ID;
 
-	writel(val, csid->base + CSID_RDI_CFG0(vc));
+	writel(val, csid->base + CSID_RDI_CFG0(port));
 
 	val = RDI_CFG1_PACKING_FORMAT_MIPI;
 	val |= RDI_CFG1_PIX_STORE;
@@ -189,22 +189,22 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= RDI_CFG1_CROP_H_EN;
 	val |= RDI_CFG1_CROP_V_EN;
 
-	writel(val, csid->base + CSID_RDI_CFG1(vc));
+	writel(val, csid->base + CSID_RDI_CFG1(port));
 
 	val = 0;
-	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
 
 	val = 1;
-	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
+	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
 
 	val = 0;
-	writel(val, csid->base + CSID_RDI_CTRL(vc));
+	writel(val, csid->base + CSID_RDI_CTRL(port));
 
-	val = readl(csid->base + CSID_RDI_CFG0(vc));
+	val = readl(csid->base + CSID_RDI_CFG0(port));
 
 	if (enable)
 		val |= RDI_CFG0_EN;
-	writel(val, csid->base + CSID_RDI_CFG0(vc));
+	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -213,11 +213,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_wrapper(csid);
 
-	/* Loop through all enabled VCs and configure stream for each */
+	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
-			__csid_configure_rx(csid, &csid->phy, i);
+			__csid_configure_rdi_stream(csid, enable, i, 0);
+			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 }

-- 
2.52.0


