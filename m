Return-Path: <linux-media+bounces-58134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEVONTss1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:57:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 399673A7B0B
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 265D9304AADD
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824BC39D6D2;
	Mon,  6 Apr 2026 21:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrYaAb8q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98FE39D6DA;
	Mon,  6 Apr 2026 21:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512520; cv=none; b=FKOnq05RNCCusaYsFq6ZIoOEbBQOmrVPFcinf2KwarsrHaE9YAOVG0DVqdeJZQ32JBN3vo0IyCcXzCzzCMfnS5q2gF+fthSuXa/ciGDBe8p6leM+ZqKtO05IMwkNlXswvhnTLH5yDgp6UirbZSE9d0rxcvGHY/C7VExMKcchd9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512520; c=relaxed/simple;
	bh=MrnvUK5shL9SYgXgcz0i1EHmwlI+U/W+aO7zSEqzKPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAn5+Wb/u8gQeTmpHTtHad6dwC4qWVp9lYBOZMZx739tH63GTPfT0f8rijBS9Pl7CZphgFWqk24cLOphv1qXW3xBfZPryqMRRQF4xS3U+X00qkMW4xc6cmB+lu4pSZ9tai/U1A9fika/boQT7zxq0IyVx4vqwUWb5mXHIyE5wdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrYaAb8q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C35C4CEF7;
	Mon,  6 Apr 2026 21:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512520;
	bh=MrnvUK5shL9SYgXgcz0i1EHmwlI+U/W+aO7zSEqzKPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NrYaAb8qbjVS639TF9uo4HHxjwQMAWlbJ16VjrqHsqw3snfmuXSGgeO7l263SPOQ0
	 cmuPvjDFCZ01sv0dArOURT8CSwwMb8dFWFSXNq/pA8vuWJnMLZ+LyAB93GN1OvYYj6
	 +I2qsIIK6/7Uz04rOmDnSIdoEcaze8gB5NifJIQ2XYUBkHwdTXWHUVlKuTwiQxnZb0
	 jb56k18E1r7+fX+nOeTLqp4FBvwTiXSJSM/LR7pksSun7t8AF0tr2qO7ERfpbmS28w
	 SczTz5z9iQLyM2wQs7Mgv6Qlplw4gCSBM25JXxfgTP+BYK8imFDP7MrQuNZ9PV2eKe
	 Bjm+auFtVR0rQ==
From: bod@kernel.org
Date: Mon, 06 Apr 2026 22:55:03 +0100
Subject: [PATCH 3/5] media: qcom: camss: Fix RDI streaming for CSID GEN2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-camss-rdi-fix-v1-3-d3f8b12473d0@kernel.org>
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
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5910; i=bod@kernel.org;
 h=from:subject:message-id; bh=25psnwdU17rckVWoD1M41gs44CnKjIvqGn+sDMda3Vo=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu5rdAIVpzJvy1RD3qAW7HYnKU4CmTsOrmXb
 g9edD0Xi1CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQruQAKCRAicTuzoY3I
 OrIxD/kBsHKsKybcegzRzyeypf6rYSfFcv28nDTCLr0nVMAsKvzLGOrZLTca8kKyIK45LuQP9rE
 pEA842mzGaxsxC25pEKFfXDMSm7++QuFv2ATiNCA9GClPPst8Dg+891GmiHYR9CshFURYIJs2iI
 VMmOOu13ovJn2RCcthrzt0zYECw9wCOQHcDNyR0ajWobYi/GfYCo2ZGv+XYT57dm4iLCPZ/+3Lx
 YcZjmJA/Ew3x4CCqN0qz7HvvCoFP/5ECd9ETyFUd0ern2JRA5aeaU2rt8pvuBcvnQMxgF9JF6S+
 0Qtgm+HQmwSWk0/C77DWaDFBIeveNleSnjJp424c/+GPcPArRdWrl/csidVU38drnZ9w1AWT0sV
 MKKhHfl84oeRKthR7fpBYUTD6OOTMvO7CkzTOn8DiONoGDa6EU/NhrXurD49nrXcJB5FONg0rkV
 1BIn9z2Bv0/LwYaXGplhhL0RmoCX8g2HMQK7u1DTZx1ZUuBSwPPw0z1anU1livXG81Jw+29w2eO
 hila10Y69bhFAThv2baQS3d5S2kuRDgl8JHGG7xbf4BTv/G5b0nIDMf4gI9ZDdI2WAn+BrmjDRr
 spIG1XQBKSfI4cCgTnU6L7BxJA/aWNruHmvYkDCsifSH1Eqv8whGqzBijeRViWMIPF1qFXVe11B
 xLa1WDb16XeJkLQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58134-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 399673A7B0B
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
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 2a1746dcc1c5b..331feed199094 100644
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
@@ -284,42 +284,42 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
@@ -330,10 +330,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
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


