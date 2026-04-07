Return-Path: <linux-media+bounces-58177-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INifNfre1GnzyAcAu9opvQ
	(envelope-from <linux-media+bounces-58177-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:39:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2AF3AD04F
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69208308711B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E80B3A872B;
	Tue,  7 Apr 2026 10:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ak0tfkqN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FB63A9D92;
	Tue,  7 Apr 2026 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558104; cv=none; b=Ij1ye+emZH57OEd5YhDsq7hpTfGE7tO5G+VrKGm0lu3Kk6pJkhrCeWqZRSbN/Ap71tJjSiqS7aX1ObofGPD08yTxUN3py2s5Na5aYJ3MG2nNcRhc92J/jZUuxIegkrY5ItlIJXqILhtnutojdjAbSrSILthPU3EsbmSEuXW3Yfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558104; c=relaxed/simple;
	bh=LczvgmVduK2DwFXtQcsalQYjPbPqh+XB9zd4lRW7ozk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mX3/4cyHmEXgV7ow+SQ4f4dxUhGUmxNmGD1yWemSFXmDhkUZadevnHoa4Dj1/0lLE6tRiAtNlDPY4jTB2G70wSngn/sXGXoRDcHK7OIUOLIVx+h9sbrAXI4+FBYA/KkcMH9n0UENNjs4N8xWlRB9tqdzl2kRZPaPMHD+AfagCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ak0tfkqN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D49C116C6;
	Tue,  7 Apr 2026 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775558103;
	bh=LczvgmVduK2DwFXtQcsalQYjPbPqh+XB9zd4lRW7ozk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ak0tfkqNlNvdbUPkm50rpH2w0t0BSWUcTWSurmpUMgeGAEC8sswW1gZWNSEG0W+2O
	 SDTh9CSLtfBICSbvU4gVb876b+bmPx7TXTUcALV4U8WLssZGB+/uEdydryF0QPOB4x
	 vIJwG/RnbxWADXPJnwEtuV7MSzOlgwMz1HZRH1fRj4NNjLJKB8cpdQ17ILWl5ON7ZS
	 sc7S+2Yww0FRMvAufSLidppXE/Wwv3nbjQf9IWV/ZrImuhdQKoHzO8MkWDUibZ6sFn
	 CiKoNNMhfptFpy2rZ+LqnlDdtib8XRmiRRUDLiQR9sqQOrwW3CyT1TNe1LmKWo2M3S
	 VGxREgOZyZwpg==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:34:51 +0100
Subject: [PATCH v3 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v3-1-08f72d1f3442@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5408; i=bod@kernel.org;
 h=from:subject:message-id; bh=ViaAdF1MZqpL1Iav0tudKHi7jYp56SRTGHm2URLIlKc=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1N3O2281QR3T9KeZUcJMjuMyprlUw5UudEWEe
 CUkSsl4wI+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTdzgAKCRAicTuzoY3I
 OhnOD/928O+L/c+3241jPaZ51D4ME2zMT+/OVgKXwDjdaBRG/3oKaidzrniyz08mGynSccrgXGf
 WfEzDEZllSPdrcL/7ssGsnIUIq1pyr2WhtPySyCzlJoDK8gpAgCM4lk1j3W1s1sUjaKzhb+xujc
 VcqLCQBWzDyuRTr0Z0kVv4baPZesM3vZEUpCVLoJ//8SZnhBQ8YtipX82yKjCJi4w2hnYZt9rsL
 Whabp7PtKUFIKwabXaT+CtGE7L6NvwiYlsymLLfsLponCUoDBwkspv0Prnw6xRZiJ8G4y1lZnfG
 8uZXqnOazwjEx99oEc0DAax47V7cV6F1+umCunwMxv+ryiqnrAduEtcoqRbMd/+qQP6WT7za8Wj
 0wHlEHXeVnLkmmNpABa2evfppfY2YhbFK5yXqjRZlLjh7P+iPhCZRnVUwMARGwLa4qA5mdoLhDP
 d+TiaujtG/M/mQqUDczBs1o7TcxDHF7I/4w7lga9miyW2LXKbdDMNGXYSfWNcyOMZdlX7tUT0O+
 bl6j0FD6s6UaVsvnV0WYeKJ4M13jtr44UrbO8ZVz8YeJg3QYzr/Irim4Klz3ehIHfeYdNsTZFN7
 0yqhNFejlFq3Uv/2S9lD2XEa0g8HQemseeHfHXO5hSbprkBpQvFBKnGZ3jyoZ6fx7fAVQof0tjv
 Hie5bDgyoU3Jofg==
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
	TAGGED_FROM(0.00)[bounces-58177-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 3B2AF3AD04F
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

Another way the current model breaks is the DT field. A sensor driving
different data-types on the same VC would not be able to separate the VC:DT
pair to separate RDI outputs, thus breaking another feature of VCs in the
MIPI data-stream.

Default the VC back to zero. A follow on series will implement subdev
streams to actually enable VCs without breaking CSID source to VFE sink.

Fixes: 253314b20408 ("media: qcom: camss: Add CSID 680 support")
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-680.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb8..edf01ba79907d 100644
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
@@ -233,28 +233,28 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 		lane_cnt = 4;
 
 	val = 0;
-	writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(vc));
+	writel(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(port));
 
 	/*
 	 * DT_ID is a two bit bitfield that is concatenated with
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
@@ -290,11 +290,11 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 
 	__csid_configure_top(csid);
 
-       /* Loop through all enabled VCs and configure stream for each */
+	/* Loop through all enabled ports and configure a stream for each */
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


