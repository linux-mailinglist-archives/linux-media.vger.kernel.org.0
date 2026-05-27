Return-Path: <linux-media+bounces-62885-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMnWEdDRFmowsgcAu9opvQ
	(envelope-from <linux-media+bounces-62885-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:13:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B10AD5E3353
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 13:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4D86D30CBEA7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 11:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A94D3F8EC9;
	Wed, 27 May 2026 11:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Cl3TObE8"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4793EDE4E;
	Wed, 27 May 2026 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880085; cv=none; b=NOF3t8qPcCqSXwRrR9nvinpEXLFdzkm/MglkCyqWx7Dlbx+LeK/wpBNZ8Pu/8jnnN6klN/RIJThIywx4ABK+Sqe/rDKFgQnH1PKTRRGNXGwppHGthlghll5puXvoB1Y09t45bLPjTKT1thRpS/ePYRu0rQCH6TQl5f1wXrrAe/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880085; c=relaxed/simple;
	bh=pVmGDAZOYpvv6zhC4vesYSgi0PH4UdqqtX59FCdftXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QdCDvJD/iNpAoR7nvEuow24xENxgFM5Ehh9o/T0OmVQOWGhpr0Ifq/BCd8tjIBghHuw+OZ03ZvKsAMM50o/jmMR9lBDMotd938mPl191s5AQPV1+ZfzL48sl/8mFav9qdkZ55wNp+qEzmn59uMCg4YjZGPwQtBv8gHrLYwRfVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Cl3TObE8; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779880083; x=1811416083;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pVmGDAZOYpvv6zhC4vesYSgi0PH4UdqqtX59FCdftXs=;
  b=Cl3TObE8sl2iRif58hK5p4ul2M2BENtRv6c8WvRITH7q4DocTRPRvoMb
   F0tZ1IHU+4HoCPGiVcjELH+bKKz741tUAmh/8fH5qfoahjHVVEZkdk5n5
   uZDv2Bcat+HXlyez3bKkyTMJtXiO/HJCfkkaKe8KnqyNFcsQUo5knX0wh
   371puUlBE1DSeTe4S32UUIp1gZ6ERNvcJjwCb6FA6dVz8PAPZKzFIKG77
   5LIkISx+5mUVGLPdTm/kXBPB42nc3l4BsbGD2xGKpXc03JvGoVoP0b0tm
   DvOtpbjVTKfusN2I6QuE7ylyRRkV+5+v97h4Qzhl3WDAuadfQO9HJdZ9h
   g==;
X-CSE-ConnectionGUID: syUvuG+5QGGvHUuuXW9bSg==
X-CSE-MsgGUID: Njo5+PNoTLyhxF33SUaa+A==
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="66995049"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2026 04:08:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 May 2026 04:08:02 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 27 May 2026 04:07:58 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Wed, 27 May 2026 16:37:25 +0530
Subject: [PATCH v5 09/12] media: microchip-isc: add SAMA7G5 hue and
 saturation controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260527-microchip-isc-fixes-v5-9-b0ec1bb954be@microchip.com>
References: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
In-Reply-To: <20260527-microchip-isc-fixes-v5-0-b0ec1bb954be@microchip.com>
To: Eugen Hristev <ehristev@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, <stable@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Balakrishnan
 Sambath" <balakrishnan.s@microchip.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62885-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: B10AD5E3353
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The CBHS (Contrast/Brightness/Hue/Saturation) block on SAMA7G5
operates in YCbCr space; expose hue and saturation as V4L2 controls
for the YUV/RGB output paths only. The SAMA5D2 has only the CBC
block (no hue/saturation), so the controls are gated on a new
has_cbhs flag.

Saturation uses the Q4 fixed-point range 0..127 with default 16
(1.0x) directly matching the CBHS_SAT register field. The control
state is initialised to neutral at probe so the first config_cbc()
write after streaming starts does not produce a grayscale image.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  | 75 ++++++++++++++++++++++
 .../media/platform/microchip/microchip-isc-regs.h  | 11 ++--
 drivers/media/platform/microchip/microchip-isc.h   |  3 +
 .../platform/microchip/microchip-sama7g5-isc.c     |  6 +-
 4 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index 04187127070d..cb338133d03f 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -859,6 +859,56 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 	return 0;
 }
 
+static bool isc_format_has_chroma(u32 fourcc)
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
+ * isc_update_cbc_ctrl_activity() - Activate/deactivate CBC controls
+ *
+ * Called from isc_set_fmt(), isc_link_validate(), and isc_ctrl_init().
+ * At isc_ctrl_init() time isc->config.bits_pipeline is zero (no format
+ * has been negotiated yet), so all CBC controls are initially marked
+ * inactive.  They become active once a format that includes CBHS in the
+ * pipeline is configured via VIDIOC_S_FMT or link validation.
+ */
+static void isc_update_cbc_ctrl_activity(struct isc_device *isc)
+{
+	struct v4l2_ctrl_handler *hdl = &isc->ctrls.handler;
+	struct v4l2_ctrl *brightness;
+	struct v4l2_ctrl *contrast;
+	struct v4l2_ctrl *hue;
+	struct v4l2_ctrl *saturation;
+	bool cbc_active = isc->config.bits_pipeline & CBHS_ENABLE;
+	bool chroma_active = cbc_active && isc_format_has_chroma(isc->config.fourcc);
+
+	brightness = v4l2_ctrl_find(hdl, V4L2_CID_BRIGHTNESS);
+	if (brightness)
+		v4l2_ctrl_activate(brightness, cbc_active);
+
+	contrast = v4l2_ctrl_find(hdl, V4L2_CID_CONTRAST);
+	if (contrast)
+		v4l2_ctrl_activate(contrast, cbc_active);
+
+	hue = v4l2_ctrl_find(hdl, V4L2_CID_HUE);
+	if (hue)
+		v4l2_ctrl_activate(hue, chroma_active);
+
+	saturation = v4l2_ctrl_find(hdl, V4L2_CID_SATURATION);
+	if (saturation)
+		v4l2_ctrl_activate(saturation, chroma_active);
+}
+
 static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pixfmt = &f->fmt.pix;
@@ -902,6 +952,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v4l2_format *f)
 	/* make the try configuration active */
 	isc->config = isc->try_config;
 	isc->fmt = isc->try_fmt;
+	isc_update_cbc_ctrl_activity(isc);
 
 	dev_dbg(isc->dev, "ISC set_fmt to %.4s @%dx%d\n",
 		(char *)&f->fmt.pix.pixelformat,
@@ -989,6 +1040,7 @@ static int isc_link_validate(struct media_link *link)
 		return ret;
 
 	isc->config = isc->try_config;
+	isc_update_cbc_ctrl_activity(isc);
 
 	dev_dbg(isc->dev, "New ISC configuration in place\n");
 
@@ -1457,6 +1509,14 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1464,6 +1524,7 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 	}
 
+	/* config_cbc() flushes ctrls to hardware at stream start. */
 	return 0;
 }
 
@@ -1647,6 +1708,19 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
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
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 127, 1, 16);
+	}
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1,
 			  isc->gamma_default);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
@@ -1665,6 +1739,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	}
 
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
+	isc_update_cbc_ctrl_activity(isc);
 
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
index 2282ef7dd596..36a9c0cb241f 100644
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
@@ -343,6 +345,7 @@ struct isc_device {
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
 	u32		gamma_default;
+	bool		has_cbhs;
 
 	u32		max_width;
 	u32		max_height;
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 06aa801b88f9..f51c7cac25df 100644
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
@@ -463,6 +462,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	isc->gamma_max = 2;
 	/* Index 1 in the SAMA7G5 table is gamma 1/2.2 (sRGB). */
 	isc->gamma_default = 1;
+	isc->has_cbhs = true;
 
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;

-- 
2.34.1


