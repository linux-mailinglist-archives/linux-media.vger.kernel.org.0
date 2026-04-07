Return-Path: <linux-media+bounces-58171-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBJDC8bZ1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58171-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:17:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D693ACAA0
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23C8130090B4
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F483A8759;
	Tue,  7 Apr 2026 10:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaLmMRiL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2627F3A7F6E;
	Tue,  7 Apr 2026 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557059; cv=none; b=G/qHT2Ufk2TjlMfMf6Qcon9W7P5mlMiRNtC3WskW6ciVtPb+tl/aUNRft9ZO0v3Ac2AXKZCdv6/U0mR2jrJ277noOigUF4tS4QyX3BwatXIwYjVK/msjU9VsAo1dgsfTVzGxp0ha6PW2HjHg38xiCprl2F/0CGqrFGBVYxGfgrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557059; c=relaxed/simple;
	bh=iGNN6cyVlrCn+rzyffG5AjbdAvQJ2IO3zK1LCu07b+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D823MMDXY6cUNBU0+XDjVzV4R8hvpqN3FXjI48i9N+cf4O9NkvbrgbHk9RqooCMJStmkVYuYExfH3jVsPjEANa7FBJGQt2x8yV+rH1V7MGOcTjsiS/Cy3SpMdou1EafLQdzPZ7j7zq3KJKCvx63Z4x04DHNPo61hjpaH5UDQSaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaLmMRiL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497FEC19421;
	Tue,  7 Apr 2026 10:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557058;
	bh=iGNN6cyVlrCn+rzyffG5AjbdAvQJ2IO3zK1LCu07b+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eaLmMRiL76BQ7j4k75wNmJWHz+3jTuuC2oODer9QJJYGsPhXDP4KUEttNMQmMJ4AK
	 JGqiHaLAOzd5yCq2VgQRBma18WWr2PNN4nxUgbkS1x1lbwpOPevs8hsprodG9ArP/i
	 qqCgY8ne387gbdLLqxSlx4tXDIb7XJYH696vidGDElDbZJzBg2Vq3bO4ONrAEtdW72
	 t1UaIHnuzQ4VLWd2ySqQREULj8L/P61Y003vxfRPDtGS0PCVXOcVVO+Lw5YhX6Q/7p
	 3i4tU9t/Sh11aYdOXleB+EIE1X7YqqZoGyJGMYwjgAsMkp6wLAKhICDgtGGK6Vxdss
	 F4d1AfBuyhnEg==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:17:23 +0100
Subject: [PATCH v2 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v2-2-66f6c600fcff@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124; i=bod@kernel.org;
 h=from:subject:message-id; bh=nCVa+/CKp/Mh7Y8L5xBma/Z9tOxi6qSOh9nYPtwRTa4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Nm1jvdp+olkOODHF5FkjSoPjF4hlBXUYCvxb
 w5DheEmmT2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTZtQAKCRAicTuzoY3I
 OjAlD/4n0iyIxrt0VUhSjX77T73wjPk/FymUJyvSiNwFonoY2YNrZXbbwgHyOj30xm+DXCtmQ1T
 AWhB1xAgREgvD4w1Y6QldjORpkFHuCoqY/yMUSND0SrpPo1a/A0zSwK5lfQohdxeW8T3mhEg54H
 XXpI8Ih3fWzkr0irHdfUdcf0XE/VHGiiXNIyJZJ4q81R3JXbBoIwJ/kh6G9vcde18JU/7mgVVoI
 2gzcJ6E7+QqfvxKLZmT+4IdipsaTSC1B+RDK3g5iV52/Hhwcq/xA8uTQsrjxmlMK8tqkUvgZR4n
 8rQdLU0hD/4QVGpBqE3r1cUlhk5b7Pf5FKRWWTPNfQkHSk4RZzjElF9HqPygfXGSH4Mladc/raj
 vcOk48oea3W9feZGFPnTQIuaBrq4cnKTD2215lVhtczjK46K1VGr/Zgm3sGM4FzYhyiev4mBszN
 hpP0CT3o9vDm5F7uNhfIRNV98FbrL9py7B2TpYeVnfIlfbJUuB121CjxU2K+KloJ4a0ggQUldSh
 PwccQ9DuGMoW3BNbjun6kkW9hSUjDgrw5CI3MKEHs/KI9AOM8fmM2xWcFsGyo/H91P9KtF3Ohyp
 Snkl3yenJMzDT96JFRcUBuZIsi12WFoqRF8JaL/waWSk8D6bzR7RKi3Xa1BhS/PIbctKrSk4ElE
 IPsrZDzpDERM6rA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58171-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: C0D693ACAA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern we
have replicated throughout CAMSS where we use the VC number to populate
both the VC fields and port fields of the CSID means that in practice only
VC = 0 on CSIDn:RDI0 to VFEn:RDI0 works.

Fix that for CSID 340 by separating VC and port. Fix to VC zero as a bugfix
we will look to properly populate the VC field with follow on patches
later.

Fixes: f0fc808a466a ("media: qcom: camss: Add CSID 340 support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34e..2e189efef79c2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -74,9 +74,9 @@ static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 	writel_relaxed(!!enable, csid->base + CSID_RDI_CTRL(rdi));
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
@@ -95,7 +95,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 *
 	 * CID   : VC 3:0 << 2 | DT_ID 1:0
 	 */
-	dt_id = vc & 0x03;
+	dt_id = port & 0x03;
 
 	val = CSID_RDI_CFG0_DECODE_FORMAT_NOP; /* only for RDI path */
 	val |= FIELD_PREP(CSID_RDI_CFG0_DT_MASK, format->data_type);
@@ -105,10 +105,11 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	if (enable)
 		val |= CSID_RDI_CFG0_ENABLE;
 
-	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x vc=%u)\n",
-		csid->id, enable ? "enable" : "disable", format->data_type, vc);
+	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x port=%u vc=%u)\n",
+		csid->id, enable ? "enable" : "disable", format->data_type,
+		port, vc);
 
-	writel_relaxed(val, csid->base + CSID_RDI_CFG0(vc));
+	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -117,9 +118,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_rx(csid, &csid->phy);
 
+	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}

-- 
2.52.0


