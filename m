Return-Path: <linux-media+bounces-58132-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFIlDvUr1GnLrwcAu9opvQ
	(envelope-from <linux-media+bounces-58132-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8F43A7AC7
	for <lists+linux-media@lfdr.de>; Mon, 06 Apr 2026 23:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A52B30649F6
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2026 21:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0C039D6D2;
	Mon,  6 Apr 2026 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjQC8uFx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7FB274FDC;
	Mon,  6 Apr 2026 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775512513; cv=none; b=VJuiURgump/MlkaDaeAeSwFbPu5iVsv8Nw5PXJ8Q1Le6o0h4+u4PHq2HWeBCEDp3gyVA8jUVxCSiJhkx1CuDRCiVeAMf7FrhpgifEfT604J7WzxNbNUOKcU7NUcF0ly6UdlzXsv7Fn+LbVXfTAk+6GNo5xMAUk4PlKg8B/9tJRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775512513; c=relaxed/simple;
	bh=CBd0FlqYMyo+UihOndAv+LMaCgvCiK2xmy/EWQc5hMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYV97aaIkE4zJkOlGc+4VzrB+3+2ENvf0KBO1yjA5yfoPuc7LVESSbecaJMZLbsQkupsVXHSnm9f+hYfMLoMmM+MAaUOsKNQ3wKo4NDqu0/H3CEbAMocvuWcpb5s2TGje3CST4S4Q/j7g7d/miecudOsFoFEzOZgG66+XBvCI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YjQC8uFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10479C2BC9E;
	Mon,  6 Apr 2026 21:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775512513;
	bh=CBd0FlqYMyo+UihOndAv+LMaCgvCiK2xmy/EWQc5hMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YjQC8uFxuZYehtC5TwqQ1mb/gGs0tWjDe+EhZWuZDpl7674xnkGEzI1kQW5B9+NeU
	 77vkZvnRBvxU6HY47/WsZV2lj9L3qdxbbMoHUb/j+Zrw/XwTb+O29Ee49Bz3kxBw6c
	 SkVQ/JSrF3Q0h8LX1V+QLOp7yFpEeIBl7ikMV1/3Kx55UkRRzSMqt9DNpoCmoYx5Di
	 ftO3uNYWvBlScpkFBfIsI8joa7zMNvFoho7CF5plgyplo4bP0H0ELgZPXQ7yGgaysE
	 M5PNWQX/MGzh8k5WT/S88xocOFTvIM9cR9Hzkm/m1GW0HTw1u7julrWWe2NDoX8OTz
	 YToKrqiyFhDLw==
From: bod@kernel.org
Date: Mon, 06 Apr 2026 22:55:01 +0100
Subject: [PATCH 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-camss-rdi-fix-v1-1-d3f8b12473d0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4830; i=bod@kernel.org;
 h=from:subject:message-id; bh=oQbn1r82XFSxBh7iYyo5i/uVB0YKAqo8XeTYt3/N/IE=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Cu4XvkJJSJZ2L9tWr8jmA6QZJKdEIJ2PEpMz
 VqWbYif8lCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadQruAAKCRAicTuzoY3I
 Ou05EACQBerL/HWiXzNZRfqGRpBd/ETV/yr5/tdf6wVxBKgLsOXDBxzMBR/rp5GfMdQuD2RPX1K
 wXM1QiPEmk0hI9/Q2UR09DsOOxwm7t83woHHkGDlKCoFyxnz5r0eFOnXShTD+d3i0V9bbUqiIdS
 TefsC41ZPQIWxpINlOsvANCMcv2E2b5U46zIwaJPEfOSM/iCP8q61DO9KivcnXj9ay+zLkSv26X
 N2oBUpxMHSco9+VRzXvNljCSZy4tTHhXRwjo5vzisHYF1jc2kQNBAxwQmv4d+SopPRMEYvS31IL
 MQsQXLjQ/AmPbYhrt1CKhKa+WfSONYx12jt9WkNGpHFTNXV0q7UziGZD1j1Ac6a6B9+quPj6Vqs
 I1yJJT0SQsusKYI7GNOFf/tKYd1mH+x61+O4qbajBEKPc3NMiEFcpgLjQKQYxuIROpyN2be7CW1
 Mdc1NSTl/KKieeR6U4+9hlPg8b6MdVgiNFB+71FwqVeSlYZuJlE6MKJ3NVSYxK2XYAQSJLH+bNP
 RwHR3e5Lj4wXknbJQYScniPDpDivUJW/EN+CeStNcRTWohPhFOvCGaxZWjYGjn2BbLNSaAP5GSX
 x29jHa91a5F2eyhAMh+kp9ByjcAB9lUcp3DgKpK6AE2weQdXQ1+5ZzeUS/FyOnBxW3XermN2vbm
 JwnyRE9yIfCoyEw==
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
	TAGGED_FROM(0.00)[bounces-58132-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: CD8F43A7AC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Fix streaming to RDI1 and RDI2. csid->phy.en_vc contains a bitmask of
enabled CSID ports not virtual channels.

We cycle through the number of available CSID ports and test this value
against the vc_en bitmask.

We then use the passed value both as an index to the port configuration
macros and as a virtual channel index.

This is a very broken pattern. Reviewing the initial introduction of VC
support it states that you can only map one CSID to one VFE. This is true
however each CSID has multiple sources which can sink inside of the VFE -
for example there is a "pixel" path for bayer stats which sources @
CSID(x):3 and sinks on VFE(x):pix.

That is CSID port # 3 should drive VFE port #3. With our current setup only
a sensor which drives virtual channel number #3 could possibly enable that
setup.

This is deeply wrong the virtual channel has no relevance to hooking CSID
to VFE, a fact that is proven after this patch is applied allowing
RDI0,RDI1 and RDI2 to function with VC0 whereas before only RDI1 worked.

Default the VC back to zero. A follow on series will implement subdev
streams to actually enable VCs without breaking CSID source to VFE sink.

Fixes: 253314b20408 ("media: qcom: camss: Add CSID 680 support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 26 +++++++++++-----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb8..35a6bb209f97c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -219,9 +219,9 @@ static void __csid_configure_top(struct csid_device *csid)
 	    CSID_TOP_IO_PATH_CFG0(csid->id));
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
 	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
 								   csid->res->formats->nformats,
 								   input_format->code);
@@ -240,21 +240,21 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
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
 
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
 	val |= format->data_type << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
-	writel(val, csid->base + CSID_RDI_CFG0(vc));
+	writel(val, csid->base + CSID_RDI_CFG0(port));
 
 	val = RDI_CFG1_TIMESTAMP_STB_FRAME;
 	val |= RDI_CFG1_BYTE_CNTR_EN;
@@ -265,23 +265,23 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= RDI_CFG1_CROP_V_EN;
 	val |= RDI_CFG1_PACKING_MIPI;
 
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
 		val |= RDI_CFG0_ENABLE;
 	else
 		val &= ~RDI_CFG0_ENABLE;
-	writel(val, csid->base + CSID_RDI_CFG0(vc));
+	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
@@ -293,8 +293,8 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
        /* Loop through all enabled VCs and configure stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
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


