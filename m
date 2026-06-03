Return-Path: <linux-media+bounces-63506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y6oeGwHWH2r1qgAAu9opvQ
	(envelope-from <linux-media+bounces-63506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:21:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 946FA635258
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 09:21:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=mchp header.b=sbC9TXdl;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63506-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63506-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D241330DC1A2
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 07:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D153E403EB9;
	Wed,  3 Jun 2026 06:59:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5988408033;
	Wed,  3 Jun 2026 06:59:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469977; cv=none; b=PiaO+BgQigpy8z/zMYyqf2GZgEsFHvL9wKV3Lp8mdg5mDzTMC974LOVdUG5ewmsI9RQNhA+e/cPCK8fKVjfmgP+zhyxQwlZC/Y3h5Enc7Gpq4Jw7h1McH0TDw16FiYr9bMt7xmzlzSFteEAV5E0bP2SyA2C9dgPG66xOvC6lm90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469977; c=relaxed/simple;
	bh=xpgyxZlEvnFMEH8Ig2HOM7ViFJ6MtFRVhoKdcNkuiMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VkycsqBt1BeV3+Gf2QYFE8cXQlbg2YnancF4SWZr/Edtro+xg+F1pKprVJrbvNtQBBSiY9O2DUvQ2khdKqO4FJ9OUbIDUm00GKwrTs0EA5qxdf4tgpSiuRVCeebhpUN87bnU61ErxdrCFo2LiSrcH2Q7wx4t+EWuNguv3HUu7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sbC9TXdl; arc=none smtp.client-ip=68.232.153.233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1780469974; x=1812005974;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=xpgyxZlEvnFMEH8Ig2HOM7ViFJ6MtFRVhoKdcNkuiMo=;
  b=sbC9TXdlN3Jdhys7ZpBJg189nriNpGe37vs2dn0oa5718/p6mLD744j2
   xnEfAwkDShZ5IZ7l1tmhV720EmDLqmkFD5/arr+ndNJ9C9KkqiEmVxjqe
   8tu/Bt/h9/RN08E6Uup/oj5id/N2Hf4sXVpIUrFn8KAbrygZ8zr6TQIa1
   D+boC/rSZCxaLtgi1WGvFwaRgk6hxXTUGVMuwQLWWMg/nxl2p82QVJiiV
   lFczhLrDQrye0brOM+vHIIcryBnLx443iStOxJJrUxU8zH3THMn/22aQd
   62DjYlvj02PkHhuiyQruFnYZLiEjEHWXwRtKXPRIsEadOK/DOr7MDDsvw
   Q==;
X-CSE-ConnectionGUID: ILW0WVUBTiuNPEuekr8qYg==
X-CSE-MsgGUID: Vzd6GvEfQcGlWhb2+Key3A==
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="58510266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 23:59:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Tue, 2 Jun 2026 23:59:33 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 2 Jun 2026 23:59:29 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 3 Jun 2026 12:28:52 +0530
Subject: [PATCH v6 09/12] media: microchip-isc: add SAMA7G5 hue and
 saturation controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260603-microchip-isc-fixes-v6-9-8c3d7474a768@microchip.com>
References: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
In-Reply-To: <20260603-microchip-isc-fixes-v6-0-8c3d7474a768@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63506-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ehristev@kernel.org,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:balamanikandan.gunasundar@microchip.com,m:stable@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:balakrishnan.s@microchip.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:mid,microchip.com:dkim,microchip.com:from_mime,microchip.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 946FA635258

The CBHS (Contrast/Brightness/Hue/Saturation) block on SAMA7G5
operates in YCbCr space; expose hue and saturation as V4L2 controls.
Hue and saturation act on chroma, so they are active only when the
output format is YUV. The SAMA5D2 has only the CBC block (no
hue/saturation), so the controls are gated on a new has_cbhs flag.

Saturation uses the Q4 fixed-point range 0..127 with default 16
(1.0x) directly matching the CBHS_SAT register field. The control
state is initialised to neutral at probe so the first config_cbc()
write after streaming starts does not produce a grayscale image.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  | 70 +++++++++++++++++++++-
 .../media/platform/microchip/microchip-isc-regs.h  | 11 ++--
 drivers/media/platform/microchip/microchip-isc.h   |  7 +++
 .../platform/microchip/microchip-sama5d2-isc.c     |  3 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |  9 +--
 5 files changed, 90 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 04187127070d..3a941757906a 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -859,6 +859,46 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 	return 0;
 }
 
+static bool isc_format_is_yuv(u32 fourcc)
+{
+	switch (fourcc) {
+	case V4L2_PIX_FMT_YUV420:
+	case V4L2_PIX_FMT_YUV422P:
+	case V4L2_PIX_FMT_YUYV:
+	case V4L2_PIX_FMT_UYVY:
+	case V4L2_PIX_FMT_VYUY:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * isc_update_cbhs_ctrls() - Activate/deactivate CBHS controls
+ *
+ * Called from isc_set_fmt(), isc_link_validate(), and isc_ctrl_init().
+ * At isc_ctrl_init() time isc->config.bits_pipeline is zero (no format
+ * has been negotiated yet), so all CBHS controls are initially marked
+ * inactive.  They become active once a format that includes CBHS in the
+ * pipeline is configured via VIDIOC_S_FMT or link validation.  Hue and
+ * saturation operate in YCbCr space, so they activate only when the
+ * output format is YUV.
+ */
+static void isc_update_cbhs_ctrls(struct isc_device *isc)
+{
+	bool cbhs_active = isc->config.bits_pipeline & CBHS_ENABLE;
+	bool chroma_active = cbhs_active && isc_format_is_yuv(isc->config.fourcc);
+
+	if (isc->brightness_ctrl)
+		v4l2_ctrl_activate(isc->brightness_ctrl, cbhs_active);
+	if (isc->contrast_ctrl)
+		v4l2_ctrl_activate(isc->contrast_ctrl, cbhs_active);
+	if (isc->hue_ctrl)
+		v4l2_ctrl_activate(isc->hue_ctrl, chroma_active);
+	if (isc->saturation_ctrl)
+		v4l2_ctrl_activate(isc->saturation_ctrl, chroma_active);
+}
+
 static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
@@ -902,6 +942,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 	/* make the try configuration active */
 	isc->config = isc->try_config;
 	isc->fmt = isc->try_fmt;
+	isc_update_cbhs_ctrls(isc);
 
 	dev_dbg(isc->dev, "ISC set_fmt to %.4s @%dx%d\n",
 		(char *)&f->fmt.pix.pixelformat,
@@ -989,6 +1030,7 @@ static int isc_link_validate(struct media_link *link)
 		return ret;
 
 	isc->config = isc->try_config;
+	isc_update_cbhs_ctrls(isc);
 
 	dev_dbg(isc->dev, "New ISC configuration in place\n");
 
@@ -1457,6 +1499,14 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_CONTRAST:
 		ctrls->contrast = ctrl->val & ISC_CBC_CONTRAST_MASK;
 		break;
+	case V4L2_CID_HUE:
+		if (isc->has_cbhs)
+			ctrls->hue = ctrl->val & ISC_CBHS_HUE_MASK;
+		break;
+	case V4L2_CID_SATURATION:
+		if (isc->has_cbhs)
+			ctrls->saturation = ctrl->val & ISC_CBHS_SAT_MASK;
+		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index = ctrl->val;
 		break;
@@ -1646,7 +1696,24 @@ static int isc_ctrl_init(struct isc_device *isc)
 
 	ctrls->brightness = 0;
 
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
+	isc->brightness_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS,
+						 -1024, 1023, 1, 0);
+	if (isc->has_cbhs) {
+		/*
+		 * CBHS_HUE is a signed 9-bit value in degrees.
+		 * CBHS_SAT is Q4 unsigned 7-bit, 16 = 1.0x.
+		 * Initialize the kernel-side state to neutral here so the
+		 * first config_cbc() call after streaming starts does not
+		 * write zero (grayscale) to the hardware.
+		 */
+		ctrls->hue = 0;
+		ctrls->saturation = 16;
+		isc->hue_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE,
+						  -180, 180, 1, 0);
+		isc->saturation_ctrl = v4l2_ctrl_new_std(hdl, ops,
+							 V4L2_CID_SATURATION,
+							 0, 127, 1, 16);
+	}
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
 			  isc->gamma_default);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
@@ -1665,6 +1732,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	}
 
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
+	isc_update_cbhs_ctrls(isc);
 
 	isc->r_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_r_gain_ctrl, NULL);
 	isc->b_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_b_gain_ctrl, NULL);
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..7f5c2e50e74b 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -268,10 +268,13 @@
 #define ISC_CBC_CONTRAST	0x000003c0
 #define ISC_CBC_CONTRAST_MASK	GENMASK(11, 0)
 
-/* Hue Register */
-#define ISC_CBCHS_HUE	0x4e0
-/* Saturation Register */
-#define ISC_CBCHS_SAT	0x4e4
+/* Hue Register: signed 9-bit two's complement, covers -180 to +180 degrees */
+#define ISC_CBHS_HUE		0x4e0
+#define ISC_CBHS_HUE_MASK	GENMASK(8, 0)
+
+/* Saturation Register: unsigned Q4 fixed-point (1.0 = 16, V4L2 range 0..127) */
+#define ISC_CBHS_SAT		0x4e4
+#define ISC_CBHS_SAT_MASK	GENMASK(6, 0)
 
 /* Offset for SUB422 register specific to sama5d2 product */
 #define ISC_SAMA5D2_SUB422_OFFSET	0
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index 2282ef7dd596..1ecefe990f00 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -139,6 +139,8 @@ struct isc_ctrls {
 
 	u32 brightness;
 	u32 contrast;
+	u32 hue;
+	u32 saturation;
 	u8 gamma_index;
 #define ISC_WB_NONE	0
 #define ISC_WB_AUTO	1
@@ -336,6 +338,10 @@ struct isc_device {
 		struct v4l2_ctrl	*b_off_ctrl;
 		struct v4l2_ctrl	*gr_off_ctrl;
 		struct v4l2_ctrl	*gb_off_ctrl;
+		struct v4l2_ctrl	*brightness_ctrl;
+		struct v4l2_ctrl	*contrast_ctrl;
+		struct v4l2_ctrl	*hue_ctrl;
+		struct v4l2_ctrl	*saturation_ctrl;
 	};
 
 #define GAMMA_ENTRIES	64
@@ -343,6 +349,7 @@ struct isc_device {
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
 	u32		gamma_default;
+	bool		has_cbhs;
 
 	u32		max_width;
 	u32		max_height;
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 9fa8413c74c7..4b8279fba560 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -264,7 +264,8 @@ static void isc_sama5d2_config_ctrls(struct isc_device *isc,
 
 	ctrls->contrast = 256;
 
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 256);
+	isc->contrast_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST,
+					       -2048, 2047, 1, 256);
 }
 
 static void isc_sama5d2_config_dpc(struct isc_device *isc)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index ac21fe1dade0..e6ccdd465805 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -257,9 +257,8 @@ static void isc_sama7g5_config_cbc(struct isc_device *isc)
 	/* Configure what is set via v4l2 ctrls */
 	regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, isc->ctrls.brightness);
 	regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, isc->ctrls.contrast);
-	/* Configure Hue and Saturation as neutral midpoint */
-	regmap_write(regmap, ISC_CBCHS_HUE, 0);
-	regmap_write(regmap, ISC_CBCHS_SAT, (1 << 4));
+	regmap_write(regmap, ISC_CBHS_HUE, isc->ctrls.hue);
+	regmap_write(regmap, ISC_CBHS_SAT, isc->ctrls.saturation);
 }
 
 static void isc_sama7g5_config_cc(struct isc_device *isc)
@@ -283,7 +282,8 @@ static void isc_sama7g5_config_ctrls(struct isc_device *isc,
 
 	ctrls->contrast = 16;
 
-	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST, -2048, 2047, 1, 16);
+	isc->contrast_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_CONTRAST,
+					       -2048, 2047, 1, 16);
 }
 
 static void isc_sama7g5_config_dpc(struct isc_device *isc)
@@ -463,6 +463,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	isc->gamma_max = 2;
 	/* Index 1 in the SAMA7G5 table is gamma 1/2.2 (sRGB). */
 	isc->gamma_default = 1;
+	isc->has_cbhs = true;
 
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;

-- 
2.34.1


