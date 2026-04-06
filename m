Return-Path: <linux-media+bounces-58135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JifGlgs1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:57:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD233A7B27
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37A3C30A1FF5
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2CA39DBE7;
	Mon,  6 Apr 2026 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSGn4Olf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E572D5923;
	Mon,  6 Apr 2026 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512524; cv=none; b=kagtbxpuZ5vI1b9V0YDo24B9Syc+J96ZUSWH8Dz1VYoMieJQs7HgFqKK7PAn6K1/q8pzHtziZOso4q/Xweet3OZTf3SC65fzSCkl2O4zTYHqBKNAwoMRj+IarxnWrt6pfqNJ2VU/vbQRtFM6o6EuhRNIktFgAPicbJ36bTKImhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512524; c=relaxed/simple;
	bh=4lisSni6lGk1MIzF7sW1BD8o1POa+IS+ZTibgxJAOIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jNY3QBbD578C8VzGPwvk8+Gkgds71H0bRR44t9llsXbU3Fe0M30AuPDv2gFupVC11T3U2+wBJSimuQXkmK/gZqPyGUcyymGAGUQgiE8AvuGDOQRN2XjCXY9nIZq0uhsogtElllvMz8gSlGcCAWf1SMeLGI2cKPysOQu4b4g2CeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSGn4Olf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB04C2BC9E;
	Mon,  6 Apr 2026 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512524;
	bh=4lisSni6lGk1MIzF7sW1BD8o1POa+IS+ZTibgxJAOIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SSGn4OlfPFP54kMQ5AKuV2XiDelw4PStMU4zYUzBpxXfNGuhOXDnkEMmTo/0PrtiQ
	 iwPaDhyfrwFSoro6yvwUgTteONN2vp1qyVueR3jrGqMFQ30X3As6T9h8SdpF5uoJQ1
	 Y7hJbq/zx1GQcRUWs70/6pvqRmYVrwiPEz9X3m/13lMQqx76n3ag0xqJRGxd5QAGSj
	 jogr9d895/P7TRoeoj4fp1WUUXflppz5Kh06we49nrR7KYTfgWmCbjcjbSumbvc8x0
	 15KFySgvNlF3XOSkzRXMPocQ+NWEd//9EqMJiu3razB6p7oVXSJItqde2GD0BRJybT
	 eP5vxS0MNepvQ==
From: bod@kernel.org
Date: Mon, 06 Apr 2026 22:55:04 +0100
Subject: [PATCH 4/5] media: qcom: camss: Fix RDI streaming for CSID GEN3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-camss-rdi-fix-v1-4-d3f8b12473d0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4197; i=bod@kernel.org;
 h=from:subject:message-id; bh=oAUZRh7lXLkkZV3ONvBHnnJtk/4iA0IrdUCuSBhihPk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu5MXjR8orSix9wGGxWUT98y4UwY1oCWcf73
 tuvgSo2K0aJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQruQAKCRAicTuzoY3I
 On//D/9cbT7pvq7GpIaL4A9ioke5VfrnkCj3CIxZ6s0lz+82GPOalTpCPUf4/UDvy5yFApujoa3
 5Z3SH5o00jKAFkn/V3GKO9lo/0T8JN6YGcjkxl80f8IeFpLJ7zuZYRMQepI3lX42bgGi9K1+B8r
 zj/whpYfUrLIgBUnrOUVNqeuphhaA1JjfgaWL95fz7TVaRhrsxGf3BQmjnLzovF9byQUdel803X
 eYM621Qk1NbmPrJd91pSfcTnfNZBJfDFNUmNzSIltdo5zafmQy3UdK1JwDUW29maahBfAOmWy2h
 drU/6h8+Yw5bRIjyvnNQX99W+1LSUKBnnoEId5wcG6JeEmn0QHBy2T0QgusQyH/QRvyyREhQZyt
 QQElGjSwe1VXdE/hkNJpFFRwWZ/vwE4dwafNjJXLcJWNJBveQ9mv9Z2C33bqRz7enaVvunjxPB5
 QFbEEzwiXrFnZ6pkkLzkkmxU7pzBySQpob2Obupk0u+fqNzylCA2/z5oWcveuzH9yxSYoCqra43
 o2KTbQ6ho9p4u9torkfcvIEaIIKSXeB7OBypOeXXqAoEUwzfgqiNR5ROfzXnnbiTZRtURms1KbG
 4rcYKk7jSQJ53vhe5cj7jKvcWEVHHpr6eSm1OuEe9CWrO2jYfsFa+WYJ7P1WmK6o0JE4sXZnTut
 ICLk0aDKQs9RfHg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58135-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BDD233A7B27
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
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index bd059243790ed..73504c349fd0b 100644
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
@@ -216,8 +216,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	/* Loop through all enabled VCs and configure stream for each */
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


