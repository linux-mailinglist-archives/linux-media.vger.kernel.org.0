Return-Path: <linux-media+bounces-58170-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJXOMIfa1GlxyAcAu9opvQ
	(envelope-from <linux-media+bounces-58170-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:20:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 407523ACB5A
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 12:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0EDA30C557B
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7A23A7F64;
	Tue,  7 Apr 2026 10:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1eA03bq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE33A75A3;
	Tue,  7 Apr 2026 10:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557055; cv=none; b=fY5rpXyDkq9f/Z30Spy2J20cJUpx8pj1wprc4WhLTD0grsXkczYuEB4roM+yuvvI8Cr5Zqp4Zi1iK8TMEPuc6ptKnpKfTpUucqwQVhkCNVZrb6KTpZbd5Ey/MsGxMDQK3aG6u0NdB4pZX+dZRv0NIB7t9KjSeGdnO8XZv33F4/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557055; c=relaxed/simple;
	bh=uMBVP5OBK6uG/Pd+SUjLPSpudE52pFW69OnDCkcDDvg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzZOxoGCM6IApe0g6W9WPHYKvqUogK7CZHrYet2/+ju3GklGiH6ozhQf0V2OZsdPz3X+smxWdypMPK9bWbjpMKHqpZOZzK/Xi0quxXVRwo5AAkRzH5NdHBccJ41ZPi+PAPfNQdBYHr34hk9oqG1vtogFswcQFLrLKfeTRg3TkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1eA03bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2BBC116C6;
	Tue,  7 Apr 2026 10:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775557054;
	bh=uMBVP5OBK6uG/Pd+SUjLPSpudE52pFW69OnDCkcDDvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P1eA03bqzbZZOHkKKiPvI+z3ZTuEoxFTTytPrzI6akxNnUG8hCyvF1f2N0S9ykkUW
	 JQYq6ZQ9/xgNxnvgPfIi3XMwmuR76pcljflkVF3/8Xd9sJHJ9p6cQQSLF6DKHHuENV
	 FY76SlqJgXUOltMDjRSug3MrdR/VYCg6apNFCFIRFSFE6md4PyX4VJ8kyPWRWBDRvA
	 FTke1NyGSRL2l18x6CYnJ227v9XdsD9JzqSy93Ud+0C+K110a3iqg679M3LRz3WP3S
	 2qsthDDHNO3uCy2wUWx7k4Pa4DnRhELuxaPDFIHFU0zjiRutXOEUCSGNaVR4Tui629
	 53hckoh65rVEA==
From: bod@kernel.org
Date: Tue, 07 Apr 2026 11:17:22 +0100
Subject: [PATCH v2 1/5] media: qcom: camss: Fix RDI streaming for CSID 680
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-camss-rdi-fix-v2-1-66f6c600fcff@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5186; i=bod@kernel.org;
 h=from:subject:message-id; bh=fd5whevjCZt8/WbhOku3Zl8KLKS9/LPSs38n4+PRT/8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBp1Nm1aJXjrxNHv5Gzntzzzlk3ikjB+wwog0anm
 M6gU70oH2GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCadTZtQAKCRAicTuzoY3I
 Ogr0D/9aKngQ+mZpQp9HM+I4G4bgdgF571nBspswwrfVTyT0kPRHzIafDnIMNm2NhtM+2BJmFsP
 jMgApgoooOFIseHYKgFggaPpO8IJ7K5FTv6ftXHGTq7xtX+2IKG6VjNukbBR7B287B9hb4KJ6X/
 4/1tMpstw0okjW10HYnFuSnH8CJLAEog2lLJVuTA2nSXjlXS9LCAj5NjDfmiR2eg0tdOZv/r97Z
 mCCJLPQjOmMLJso81U+bH/7zZMW4YyWLBpWDQGKNLU/RfqlJWsC46ERhJ+nOANINr27w4tfssGA
 OUm6Nc982BzBOR4c+uopAXAcO5IExVW00PgG4vDOjsSWuKmklZXY/YgsmiZeDYXIMveRH4+9Z4P
 YuUdeYkN4WnhikKojAv8OmOvz82LXDYsWkQsiW6vLPAfEoXouc4jpasxpNcZBTyYuPJN352C228
 If2IwN6d6tFJX41PuYK5J1jBliofN9xiQD6aTg7dm3Skeq2tHcj5cFoClwH7bOly89qJdcnHOIy
 tiEFV1cUcEJP/2wOJO9iHmcaIwUuTGfruk0e7cVivoIbUMiKZr2ClhnGj9Cu4z+n0eS1TTPllnK
 dzr4oVlpazaLlJMZ78UaqPwLGK/9sguXSqBEXcJyJEy1ur72T/AwfM2Zo8vOuWXhlOiI4vhPY2s
 atChhHzbdM/eazQ==
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
	TAGGED_FROM(0.00)[bounces-58170-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 407523ACB5A
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
 drivers/media/platform/qcom/camss/camss-csid-680.c | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 3ad3a174bcfb8..0fc908096a99b 100644
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


