Return-Path: <linux-media+bounces-58178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGa3KBDe1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:36:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4011D3ACF22
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2450303DA09
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA053AA4FC;
	Tue,  7 Apr 2026 10:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0HfuMsi"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F123A9D92;
	Tue,  7 Apr 2026 10:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558107; cv=none; b=WV15FtIoIDM0/uoH8/jysO+9OQh4wemzlbzTY13XuxmYXA63sE+HzMFzlcnRFkG71zJGtAIHL1UjS5Ro0O7fiH5eqKhOLT/eSTyCKGHuYFz/tEBbRSkbAIfGgH4pdLz4I0n8RP7aFIwDEXwtdjWCOQqcwazyYzN1+jh+iE6Nff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558107; c=relaxed/simple;
	bh=MJeBz0s3VcemoCjZGuG/mKj2+UW/3pCM/Y1AHVD6VxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DllRhtX1JtuJi9ZIfgxdRki5UMfSizV6iGyghD0PKiNHPjf4jnmtcdrKmzEv14qMLWSvBNS/k1bVv9BHqaDD/G3XxVoQL15AxgNnjIr1+Tb/fiD/IAplUNQSCGJJtn8HA6BwOulmAoinQ6c2CcZVoi4dAdHqrTDgBATjymY5z7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0HfuMsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081F3C2BCB0;
	Tue,  7 Apr 2026 10:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558107;
	bh=MJeBz0s3VcemoCjZGuG/mKj2+UW/3pCM/Y1AHVD6VxY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r0HfuMsiacIvn8RYPQ7HhG7EvEbNQXv3cTobTiLaD4kXQaBdYMSBsGcZctcXluEZd
	 hL6ZF8UEyCAuyyles55sXEMJbQ8SWFU2k1kjfbhtSowrK3q9P9ZC4KpyhA7OsAGLxk
	 aehrfY1Zxz37FdViEAMoIwB/n3T+p/usoLh7Yy/OkAY3MebK/O6DRKzc8P5mfEgE6u
	 UeCK74Pm+Rnii7YFnwgBJc0ov07DzcLQmsnwlSHxAXWQnkFcMjtJpX4Usaz9Htk4Vr
	 GikFQkwAwtOuRUgsMOMhDK5kO8xLvzjx756epvon1nPUY20DCrYp/jADRUoucjxiyL
	 7DH6vJfKzbHvQ==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:34:52 +0100
Subject: [PATCH v3 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v3-2-08f72d1f3442@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352; i=bod@kernel.org;
 h=from:subject:message-id; bh=07KqTUJnW7DuczIx6kaVXwZN/TXvGEjkOuJ5qW2VS4E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3OgxaDnr4obNPic3ia64/Xd8u2aqveo5z6X
 cJNLvfi0SmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzgAKCRAicTuzoY3I
 OhL1EACA1EvVuAaTAmjBMxY6wwln9S0t1MgvFPO99ttGiuxGaN2yY+8AdxAWERDBvm71hzJ1uJ3
 Vb2CdCGothrzBGVdhOj+I7hMBbdV7GuXeNNV4+sc9y3/QpNviUz9THBrRS24Rxmh4I8zdCkv5mi
 OeP32H7XFiDbr0mp92tEXW1EQEP7IIUVECKjg8iIQWecX0W/GnTWwrKSB1t3h/180KYl7/Vrlxu
 7iB/MoHZrDrgNNc4YqYbm0MRYPn7qdGwV+SDH4af4ZJ7mLQhXRedP47vs0NGi1vWJ1kINVC0sMm
 XfDcdcZLWbCDEpfMJY8BOk0+uCn2JFsGW2CyxKOLFUPsCcVu+JKbNxbnkSLfsW4ddVAa4F7WVEX
 5seG2dnwDx4lRaVOwNTAdIKP+HpXERDRs2x6khDMcmjNupW8mEawQzPdW65ROKwV1wm/8t7m+pP
 slrY96zMUVQsx2oSb9W3vdsgW7PnkoJU376fuexY9m2FzODKDOyWIgCa0HudCH0FTyT+BnV0wOe
 GMicTBPTcXPMgjHuhcyW/s2faMS1aOX5Z3dhR9EnCCB+y9mwjKiqG2bMfGLBawYa9VibwFo8VpE
 QjO+cYH+mGREc1ZUCzxPjEOdubF4Qa9xXawPUCEjfHqUDYB3+wF/T/nJ7+4/036HcxabgUX+G53
 MHjoqnDSepeMH1Q==
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
	TAGGED_FROM(0.00)[bounces-58178-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 4011D3ACF22
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
 drivers/media/platform/qcom/camss/camss-csid-340.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34e..0231985746edf 100644
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
@@ -88,14 +88,14 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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


