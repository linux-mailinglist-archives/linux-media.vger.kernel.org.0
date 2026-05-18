Return-Path: <linux-media+bounces-61968-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGrXI2r5CmpZ+QQAu9opvQ
	(envelope-from <linux-media+bounces-61968-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:35:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78456BA6C
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 13:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E3C9303A814
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 11:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B28F3F6609;
	Mon, 18 May 2026 11:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="ASgQp0td"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5E3D5241;
	Mon, 18 May 2026 11:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103850; cv=none; b=bE8JUyETfU6y1tJbUYwImM9RCGuEDL79SWpdOHdzlwz/xlRyjIla+8kQOai7RqhIjfaxKoHp7zzqlaU+hxb7BsEwZEjss6yutN3X1aqjQvz2OEwA9oSBntJV/fToXjrRSaFkYfK/DPaWuKS/UayIroVI8KoiDMqDLIiDJL0y1no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103850; c=relaxed/simple;
	bh=tr3/5T4qh4wpG+Z7lLLT1RsC3xF/rDkL69R2v2U6wtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k6bXGMAXcohWuMQiECN5gwsHiSoarKdnRb50iTJ8cvkQfEFFVL1D1ayR1zlu+3VZrla49OlYucvc+mYBEXZM+/pRV54pk0BzBPLWKmMiEvmckqwnNnh/QKkXQhpq5sDo9jXMm4poWY4IBmh49CA3ONI+QZIPjH0OKZBDzvO3lJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=ASgQp0td; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779103846; x=1810639846;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tr3/5T4qh4wpG+Z7lLLT1RsC3xF/rDkL69R2v2U6wtc=;
  b=ASgQp0tdsbFEVGrOdEptMTCdZSGkyPx8GpBnbuHr+FMT5bOMwj9FdZXg
   iqIWl+ig6NGZUztD3ighdoPt8ONn98FSqak9lQAoLNknyxRAK4DM+P34u
   gwBLs9epOpNmRFC3ht3DnBpGzPyuFjog7Qw3bXk9oDQKfM6grTn3/PFnz
   SZfaXv+ErBA6zsG8Frd6L5hAl//7b1Ujfh+1fLWZ4yY23KXKeEKZivBon
   I0k1NLJB5Eq4l6asOdLOMMtCSBKjiM/AuIuoCgs5anYb58spCuiKpdDxg
   gv7LvQ3BNAoT7uHmQ1xoXxmjVnPpNbByCgJIaBFKM07qe2uJ94xg7ODFJ
   w==;
X-CSE-ConnectionGUID: zY/OVfVYR2mBbdjHU5DvgQ==
X-CSE-MsgGUID: icxgkCT2Spalwc4XfXVp+w==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66410441"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 04:30:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 04:30:42 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 04:30:38 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Date: Mon, 18 May 2026 16:59:47 +0530
Subject: [PATCH v4 09/12] media: microchip-isc: add SAMA7G5 hue and
 saturation controls
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260518-balki-isc-series1-v4-v4-9-97f189185b7e@microchip.com>
References: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
In-Reply-To: <20260518-balki-isc-series1-v4-v4-0-97f189185b7e@microchip.com>
To: Eugen Hristev <eugen.hristev@linaro.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>, Kieran Bingham
	<kieran.bingham@ideasonboard.com>, Balakrishnan Sambath
	<balakrishnan.s@microchip.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 2F78456BA6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-61968-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

SAMA7G5 extends CBC with hue and saturation. Add V4L2_CID_HUE and
V4L2_CID_SATURATION controls. Disable CBHS for RGB output since it
operates in YCbCr domain.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../media/platform/microchip/microchip-isc-base.c  | 87 +++++++++++++++++++++-
 .../media/platform/microchip/microchip-isc-regs.h  | 11 ++-
 drivers/media/platform/microchip/microchip-isc.h   |  5 +-
 .../platform/microchip/microchip-sama5d2-isc.c     |  2 +-
 .../platform/microchip/microchip-sama7g5-isc.c     |  8 +-
 5 files changed, 99 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/drivers/media/platform/microchip/microchip-isc-base.c
index ae2a0c6ba566..1727c98665d1 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -810,7 +810,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
 				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
@@ -821,7 +821,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -833,7 +833,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
@@ -844,7 +844,7 @@ static int isc_try_configure_pipeline(struct isc_device *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline = CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE | DPC_BLCENABLE;
+				CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline = 0x0;
 		}
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
 
@@ -1446,6 +1498,7 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct isc_device *isc = container_of(ctrl->handler,
 					     struct isc_device, ctrls.handler);
 	struct isc_ctrls *ctrls = &isc->ctrls;
+	struct regmap *regmap = isc->regmap;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -1453,9 +1506,30 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
 		ctrls->brightness = ctrl->val & ISC_CBC_BRIGHT_MASK;
+		regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, ctrls->brightness);
 		break;
 	case V4L2_CID_CONTRAST:
 		ctrls->contrast = ctrl->val & ISC_CBC_CONTRAST_MASK;
+		regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, ctrls->contrast);
+		break;
+	case V4L2_CID_HUE:
+		if (isc->has_cbhs) {
+			ctrls->hue = ctrl->val & ISC_CBHS_HUE_MASK;
+			regmap_write(regmap, ISC_CBHS_HUE, ctrls->hue);
+		}
+		break;
+	case V4L2_CID_SATURATION:
+		if (isc->has_cbhs) {
+			/*
+			 * The ISC CBHS SAT register holds a Q4 fixed-point
+			 * coefficient: 0 = grayscale, 16 = 1.0 (no change),
+			 * values above 16 boost saturation.  The V4L2 range
+			 * 0-100 (default 16) maps directly to this hardware
+			 * value; no unit conversion is applied.
+			 */
+			ctrls->saturation = ctrl->val & ISC_CBHS_SAT_MASK;
+			regmap_write(regmap, ISC_CBHS_SAT, ctrls->saturation);
+		}
 		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index = ctrl->val;
@@ -1647,6 +1721,10 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness = 0;
 
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
+	if (isc->has_cbhs) {
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 100, 1, 16);
+	}
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl = v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
@@ -1664,6 +1742,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	}
 
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
+	isc_update_cbc_ctrl_activity(isc);
 
 	isc->r_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_r_gain_ctrl, NULL);
 	isc->b_gain_ctrl = v4l2_ctrl_new_custom(hdl, &isc_b_gain_ctrl, NULL);
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/drivers/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..2fd8916abf21 100644
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
+/* Saturation Register: unsigned Q4 fixed-point (1.0 = 16, V4L2 range 0-100) */
+#define ISC_CBHS_SAT		0x4e4
+#define ISC_CBHS_SAT_MASK	GENMASK(6, 0)
 
 /* Offset for SUB422 register specific to sama5d2 product */
 #define ISC_SAMA5D2_SUB422_OFFSET	0
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/media/platform/microchip/microchip-isc.h
index ad4e98a1dd8f..2c8bcaaa26ea 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -88,7 +88,7 @@ struct isc_format {
 #define GAM_RENABLE	BIT(9)
 #define VHXS_ENABLE	BIT(10)
 #define CSC_ENABLE	BIT(11)
-#define CBC_ENABLE	BIT(12)
+#define CBHS_ENABLE	BIT(12)
 #define SUB422_ENABLE	BIT(13)
 #define SUB420_ENABLE	BIT(14)
 
@@ -139,6 +139,8 @@ struct isc_ctrls {
 
 	u32 brightness;
 	u32 contrast;
+	u32 hue;
+	u32 saturation;
 	u8 gamma_index;
 #define ISC_WB_NONE	0
 #define ISC_WB_AUTO	1
@@ -342,6 +344,7 @@ struct isc_device {
 	/* pointer to the defined gamma table */
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
+	bool		has_cbhs;
 
 	u32		max_width;
 	u32		max_height;
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 66d3d7891991..239aac170472 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -54,7 +54,7 @@
 
 #define ISC_SAMA5D2_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama5d2_controller_formats[] = {
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 8b73b625d92b..6705011edc2a 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -61,7 +61,7 @@
 #define ISC_SAMA7G5_PIPELINE \
 	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
 	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
 
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] = {
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
@@ -461,6 +460,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 
 	isc->gamma_table = isc_sama7g5_gamma_table;
 	isc->gamma_max = 2;
+	isc->has_cbhs = true;
 
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width = ISC_SAM9X7_MAX_SUPPORT_WIDTH;

-- 
2.34.1


