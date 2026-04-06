Return-Path: <linux-media+bounces-58133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2APLJhcs1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F11003A7AF4
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1900A307B003
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A5939DBD2;
	Mon,  6 Apr 2026 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRklpXtS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC23274FDC;
	Mon,  6 Apr 2026 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512517; cv=none; b=bu/xLtAjNETGpnLPlJ0mee9wxk+pQ7qgDlf9TNEmWmpmVo6R7YuQSmzdvZyyRnays+fd7nTI7s6LfiXJvoFqLs9yYjtLyWmPfu0iqbp9pRyX5FetoKy34VTqA+Kf7vK27uyDbwlus6jwSmzMgXVjoafBBdUDFU/wN4GlOhZgPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512517; c=relaxed/simple;
	bh=Z9r0dbQzT/tJ52KABpH4UhKOxrTmTU6KUEpsWEpGA0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s8vzoCgx4EOvy6rkPT3x9UEZg5Y2s5/RZSA7WorGiHL+xPYNJkERzrcpSms8aWPEm7BZZ8GYDPCLmXbCaMMU9jvsm6XwvYJZmkLQymyc7TWefc5Q8/Skwr3/vuy8QRFsyfvuSK98e7k3V82xGU8FZDwj1LPrOriAs0PtAWaKYP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRklpXtS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF1BC2BCAF;
	Mon,  6 Apr 2026 21:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512516;
	bh=Z9r0dbQzT/tJ52KABpH4UhKOxrTmTU6KUEpsWEpGA0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FRklpXtSsr22QptRA6hS3vZmhCB1rEGjNmdhSCsyJzzqxTzRmU9tBwBTypfkqgM9U
	 yJUBzk33GzaOqFHe1V7XlYJTIdaORU6f51I1zQo3/9yY62oELKNIW4avAGSwbHZ6o9
	 q0nTJe0v7kvzUnwwnXmfpGMCp3ogI/0mG2hPUDh6mlegHHe6AzvLC94Xx1xrAZf3vS
	 AJ57NVqBUvmRC7NyXbpYGwQjjIZDjr7gtOmaB+X4QBvGtQR34u4m2/7xAJGRZtdvYi
	 KqiO4scFjrmxcmRuoTQe19vZiZ5ab0jqIRsQgU1JM+UyD+V8HXUI7zZq98yd7nHIq8
	 D64PPzIPEfA8A==
From: bod@kernel.org
Date: Mon, 06 Apr 2026 22:55:02 +0100
Subject: [PATCH 2/5] media: qcom: camss: Fix RDI streaming for CSID 340
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-camss-rdi-fix-v1-2-d3f8b12473d0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005; i=bod@kernel.org;
 h=from:subject:message-id; bh=rMMfBnojIW90eGYUR2SwkMLX8SQysFcHYJO9587rzoE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu4LUWv55g2X9GC0Lw2/RJzlqoG1j+zqFmDC
 ViV7MAnOO2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQruAAKCRAicTuzoY3I
 OspSEAC9J6UYQiVa10lMHM7gmeiaCrJ/G0f7RE7ZrZrufgcieRN6Z7bySTfFSLxEpN9CxeFGVOG
 qZ0X5/XYrsvq+x8APf9Jc207haHPHEojZUDxhkHuiLf9qtZMQmUzgW6GxhFHgRC9mgPMdrNjX31
 Fo9zZA6mPpsuSdrxGD4dTawCAZ5e1LqK6g1SYLytOs3rV7LBaB4F5vZ7UsAQdM4ftjwDWBdjVoO
 7+mLs0j/jNdzfs3oxwvtmfLidHAu3GoP39v6LPXztG7LZAzVHiSNwgHMsi3lT7bDld8n0zBp1ce
 BCPpzt2aPEkfRbjbGh4gC0kVZ2uJNOW7e3Ti5+swRKQO5Fn+3mKoWsfaCg2BTR0/Gabd4CEBSxx
 DX4wLc7Yl7zbbfO3i3gFDKr6tHzf1qlDQix2qRj7SUlvrDUA/P62h1cDjxji5TB/4z5o3ZR6ch5
 9cSOv1gFcwnbb4sC0ZQa14NUJQhpJesuz3L2tycxB1uEvwMgochi8L49a9ISsY+Adu8EBmeUe9s
 TjerlS2TEjbbVBvrqi0XeBwm+dWYpJ55brZL5+CUCuTeKDPyuXRTqCH0sMqEkIe4639qCHG469Y
 HcWd/edNKThMdXlzIYp9EMM7UXBJEpSGhwyMPCasNK/fK5rs6hSxW+iUauyxDBQkSiZ+TxLx47M
 xBtX5AZYk1koCiw==
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
	TAGGED_FROM(0.00)[bounces-58133-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: F11003A7AF4
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
 drivers/media/platform/qcom/camss/camss-csid-340.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 2b50f9b96a34e..5a7271785ec7a 100644
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
@@ -119,7 +120,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i);
+			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_ctrl_rdi(csid, enable, i);
 		}
 	}

-- 
2.52.0


