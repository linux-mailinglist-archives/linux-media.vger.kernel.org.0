Return-Path: <linux-media+bounces-58173-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOT1Jhzb1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58173-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:23:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B42D3ACC1C
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0567301AA4A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977593AA1A7;
	Tue,  7 Apr 2026 10:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRUZkc47"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0193A9D8F;
	Tue,  7 Apr 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557067; cv=none; b=HNEJMaoAXuPHkSmDReBImjUnRUOFVgDylVIHR09r+iO56GyYoSkyBHAmK2M1RFDajSAe5GwpwSJLD436UV6hNVjO8drYC06a3+l0Afk6jHOdzk6adw6GD90TZBJNLCTj0EEfkW+wybfRjsakD5zEbMsRmaXwi5KaqFnz29ynE5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557067; c=relaxed/simple;
	bh=Iw/0ZMUWO2zJVSR27I/5GetL9KxeKyvBcMMEYB7HZ5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teoDI1DkzznotwyAYd/DoPxYygOt/kuGHNx2zVH2Vus9w7IXSscPT/wDjeSB8naIi3Tpo0WTANw4ovB30SVR7FJAYAGO8MSlgD/6kwp7Ocs5DJRoKiVLfEdT6iILzQbC+522A6SIAG+5iCARVr1R0As7bs5u114zs83zosdXgDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRUZkc47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EB3FC19421;
	Tue,  7 Apr 2026 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557066;
	bh=Iw/0ZMUWO2zJVSR27I/5GetL9KxeKyvBcMMEYB7HZ5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RRUZkc47egqJFCo1QFaNHI/D5lgf1HPJ/qcccStVUMJyKzXr6xxo65n1fq9qoT9G6
	 pmeufZaYN/Kw/U42UmgjOT490DYG/nOHqrYP/l12UIJk10FO2WqEammMDRqvROybSj
	 q2sjHm7FaTdSfXXvEbvj0A7NDEOwrETU1LRvbFRCN+PNPs+phjmkT9J+1PbNX2ULPg
	 iI3PWv8IZOE90pP2fli7uuoyAWllesJYFCZtt+Jy2EPk4pbYF7337Z0q2eeRucBZ6w
	 Ai77OzSAXEhfueoF9NslRUlGCU98MVgi3dhAtz67lwLYAuLmHDfznIwJywo+DS9b20
	 EpaYRvuOSZVTQ==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:17:25 +0100
Subject: [PATCH v2 4/5] media: qcom: camss: Fix RDI streaming for CSID GEN3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v2-4-66f6c600fcff@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4312; i=bod@kernel.org;
 h=from:subject:message-id; bh=s60sIJaXGpdYqv090mjDLH9kxg4goK1KRKFRBCPJ730=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Nm27ukRGAGTENEjVQtuWZ30q1tltYwngdMyX
 9ngbW8Gq56JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTZtgAKCRAicTuzoY3I
 OmV4D/0XwDqRUfVLkYHmr8oWLStUjCAZqdzQAaEeN9o3yFUexUzwZRm7gJwnePJpuZ/ZzJsss2d
 bp2EYfBFgpt/gq/331lV5BsXGm8Wt067IXFPO6SgSaYvoeXCGXfPxclNAvRacUlz9xJGNYrv2fS
 Lig93uQXgkRawZN/Y7nAA9DXJEObCGgVFZ69uVPIOM36cx5VIEIQabo99spPzyp77PSN/EuEOle
 rn6cRy0XvEb3QiNmV7NaMCY/125Bg7pGlCGAf9K4T2T5gbCDYPixlNAc8RGcjdA5Pvi9v3obOyW
 DnNB0TpXmTnPtWXbc0u69aRcsXALjZDp27DYf44Eixt3yjaZv/KLXAw1xW/tWvmk93o09TSXowF
 QHql0df+gHXyebA0OfxmTnwJCgKFcw4WeWOaUzZ4DpD1zT+LW2nms8Ax5Ykacdft1tdRS4EUf4t
 OXaqQNxMYBYamG83Tjr7ZJ/a3pHcmyizsWy5gJp0m252fZAA7LoSspI2nEPtWTVAlC4RIkIUIfC
 Hb6dNqWzYU8WjNFyndh2Wl0zgqdzkwoWu5ANH5XSOmF+uYENLbGV1ZibKDCJcjEKcdbyGsxEr+b
 I0OoYMvYInFVL4+FL7SnHq4OQtSA4vMfdKyeS/VHgikvcimvO+mL9ui5wxvGto+FfnTDQ2U/SRg
 /kJfl7LYuRnsm1g==
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
	TAGGED_FROM(0.00)[bounces-58173-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B42D3ACC1C
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


