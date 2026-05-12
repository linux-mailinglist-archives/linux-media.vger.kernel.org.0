Return-Path: <linux-media+bounces-61294-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6COyGSNSA2pq4gEAu9opvQ
	(envelope-from <linux-media+bounces-61294-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:15:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C049524781
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 18:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA21303CD02
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E223C8C73;
	Tue, 12 May 2026 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Hn7O45Hx"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5496B3C4149;
	Tue, 12 May 2026 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600655; cv=none; b=PyqJGUm/aXcLX/5ku/nCdpqbPwVdcHXUEraOgIlHGTJzxrjf2PgOf2KFNS6aX4RMHBwTsZ9GJjxjMjQk7bODZHfEM9zQbtrrK5F3JaIH0cBZ9WHWTlvvqtDeDx5oE30g32JXC1zbXwSAlGFT1Ryvs4nv3wVzwDDWhhU4Pe2/j/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600655; c=relaxed/simple;
	bh=SIMhATjX2Gs8fwNcRK0PpGZJe5yokfJFEpzZs4KSvqA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRjbVq0677oxhIsOVN6sddVl2A1Ly2EJ6YAndPZRz00H/3PY2JhrDvIX7WLhJDcHkQEmpkbuL4aTMuCBYE12TBIx2CZG90EiGyOkoI4T5n1yPp3eR7/WBsGsGtNnkC11ub/Gbkqg53FGusHHyIjtfIBleUyPQZxyd/Z5sff9oZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Hn7O45Hx; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600653; x=1810136653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SIMhATjX2Gs8fwNcRK0PpGZJe5yokfJFEpzZs4KSvqA=;
  b=Hn7O45HxUWXegRnPb9wRduUbK+0NzX737yFPOfNH4d2AjEMYa36SK7Xl
   mMMdGAjCrzpIM0wcc+RU8AOENsSOruhG4KfHnLpwQJVH/Nd28FKAVLfEN
   Br0QifBI35bHIjNrvMUZ6otNYc4HznkSfbdMcqsfHpS2WHjqcUOOpEvOW
   gEapSMDca2t4mnmmR7A5BCaQqUhfSiTr6Yhafyed7WelVZ8wok7I8m4vR
   SOnCjNWwaHaVlbJsD2Gm73R/PtGBu/9kAPInRfCRIX9bRW2xNFuLmBd1G
   ivKt+DbPb/RdrZzvgNTwvkxFDZ4wQJltY1RhlEnxwrK7ESUATnqiKkb3h
   Q==;
X-CSE-ConnectionGUID: k0jnvHzBRcKS0TR21V2SCg==
X-CSE-MsgGUID: G59cTcCNQOmYiU3Fe7ys4Q==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="57798658"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:44:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:44:12 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:09 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v2 09/15] media: microchip-isc: add SAMA7G5 hue and saturation controls
Date: Tue, 12 May 2026 21:13:33 +0530
Message-ID: <20260512154339.210444-10-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512154339.210444-1-balakrishnan.s@microchip.com>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
 <20260512154339.210444-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 2C049524781
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61294-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

SAMA7G5 extends CBC with hue and saturation. Add V4L2_CID_HUE and
V4L2_CID_SATURATION controls. Disable CBHS for RGB output since it
operates in YCbCr domain.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 86 ++++++++++++++++++-
 .../platform/microchip/microchip-isc-regs.h   | 11 ++-
 .../media/platform/microchip/microchip-isc.h  |  5 +-
 .../microchip/microchip-sama5d2-isc.c         |  2 +-
 .../microchip/microchip-sama7g5-isc.c         |  8 +-
 5 files changed, 98 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index ae2a0c6ba566..7e140af51912 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -810,7 +810,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				CSC_ENABLE | GAM_ENABLES | WB_ENABLE |
-				SUB420_ENABLE | SUB422_ENABLE | CBC_ENABLE |
+				SUB420_ENABLE | SUB422_ENABLE | CBHS_ENABLE |
 				DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
@@ -821,7 +821,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
 		}
@@ -833,7 +833,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				SUB422_ENABLE | CBC_ENABLE | DPC_BLCENABLE;
+				SUB422_ENABLE | CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
 		}
@@ -844,7 +844,7 @@ static int isc_try_configure_pipeline(struct isc_device=
 *isc)
 		if (ISC_IS_FORMAT_RAW(isc->try_config.sd_format->mbus_code)) {
 			isc->try_config.bits_pipeline =3D CFA_ENABLE |
 				CSC_ENABLE | WB_ENABLE | GAM_ENABLES |
-				CBC_ENABLE | DPC_BLCENABLE;
+				CBHS_ENABLE | DPC_BLCENABLE;
 		} else {
 			isc->try_config.bits_pipeline =3D 0x0;
 		}
@@ -859,6 +859,56 @@ static int isc_try_configure_pipeline(struct isc_devic=
e *isc)
 	return 0;
 }
=20
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
+	struct v4l2_ctrl_handler *hdl =3D &isc->ctrls.handler;
+	struct v4l2_ctrl *brightness;
+	struct v4l2_ctrl *contrast;
+	struct v4l2_ctrl *hue;
+	struct v4l2_ctrl *saturation;
+	bool cbc_active =3D isc->config.bits_pipeline & CBHS_ENABLE;
+	bool chroma_active =3D cbc_active && isc_format_has_chroma(isc->config.fo=
urcc);
+
+	brightness =3D v4l2_ctrl_find(hdl, V4L2_CID_BRIGHTNESS);
+	if (brightness)
+		v4l2_ctrl_activate(brightness, cbc_active);
+
+	contrast =3D v4l2_ctrl_find(hdl, V4L2_CID_CONTRAST);
+	if (contrast)
+		v4l2_ctrl_activate(contrast, cbc_active);
+
+	hue =3D v4l2_ctrl_find(hdl, V4L2_CID_HUE);
+	if (hue)
+		v4l2_ctrl_activate(hue, chroma_active);
+
+	saturation =3D v4l2_ctrl_find(hdl, V4L2_CID_SATURATION);
+	if (saturation)
+		v4l2_ctrl_activate(saturation, chroma_active);
+}
+
 static int isc_try_fmt(struct isc_device *isc, struct v4l2_format *f)
 {
 	struct v4l2_pix_format *pixfmt =3D &f->fmt.pix;
@@ -902,6 +952,7 @@ static int isc_set_fmt(struct isc_device *isc, struct v=
4l2_format *f)
 	/* make the try configuration active */
 	isc->config =3D isc->try_config;
 	isc->fmt =3D isc->try_fmt;
+	isc_update_cbc_ctrl_activity(isc);
=20
 	dev_dbg(isc->dev, "ISC set_fmt to %.4s @%dx%d\n",
 		(char *)&f->fmt.pix.pixelformat,
@@ -989,6 +1040,7 @@ static int isc_link_validate(struct media_link *link)
 		return ret;
=20
 	isc->config =3D isc->try_config;
+	isc_update_cbc_ctrl_activity(isc);
=20
 	dev_dbg(isc->dev, "New ISC configuration in place\n");
=20
@@ -1453,9 +1505,30 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 	switch (ctrl->id) {
 	case V4L2_CID_BRIGHTNESS:
 		ctrls->brightness =3D ctrl->val & ISC_CBC_BRIGHT_MASK;
+		regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, ctrls->brightnes=
s);
 		break;
 	case V4L2_CID_CONTRAST:
 		ctrls->contrast =3D ctrl->val & ISC_CBC_CONTRAST_MASK;
+		regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, ctrls->contras=
t);
+		break;
+	case V4L2_CID_HUE:
+		if (isc->has_cbhs) {
+			ctrls->hue =3D ctrl->val & ISC_CBHS_HUE_MASK;
+			regmap_write(regmap, ISC_CBHS_HUE, ctrls->hue);
+		}
+		break;
+	case V4L2_CID_SATURATION:
+		if (isc->has_cbhs) {
+			/*
+			 * The ISC CBHS SAT register holds a Q4 fixed-point
+			 * coefficient: 0 =3D grayscale, 16 =3D 1.0 (no change),
+			 * values above 16 boost saturation.  The V4L2 range
+			 * 0-100 (default 16) maps directly to this hardware
+			 * value; no unit conversion is applied.
+			 */
+			ctrls->saturation =3D ctrl->val & ISC_CBHS_SAT_MASK;
+			regmap_write(regmap, ISC_CBHS_SAT, ctrls->saturation);
+		}
 		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index =3D ctrl->val;
@@ -1647,6 +1720,10 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->brightness =3D 0;
=20
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_BRIGHTNESS, -1024, 1023, 1, 0);
+	if (isc->has_cbhs) {
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_HUE, -180, 180, 1, 0);
+		v4l2_ctrl_new_std(hdl, ops, V4L2_CID_SATURATION, 0, 100, 1, 16);
+	}
 	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAMMA, 0, isc->gamma_max, 1, 1);
 	isc->awb_ctrl =3D v4l2_ctrl_new_std(hdl, &isc_awb_ops,
 					  V4L2_CID_AUTO_WHITE_BALANCE,
@@ -1664,6 +1741,7 @@ static int isc_ctrl_init(struct isc_device *isc)
 	}
=20
 	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
+	isc_update_cbc_ctrl_activity(isc);
=20
 	isc->r_gain_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_r_gain_ctrl, NULL);
 	isc->b_gain_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_b_gain_ctrl, NULL);
diff --git a/drivers/media/platform/microchip/microchip-isc-regs.h b/driver=
s/media/platform/microchip/microchip-isc-regs.h
index e77e1d9a1db8..2fd8916abf21 100644
--- a/drivers/media/platform/microchip/microchip-isc-regs.h
+++ b/drivers/media/platform/microchip/microchip-isc-regs.h
@@ -268,10 +268,13 @@
 #define ISC_CBC_CONTRAST	0x000003c0
 #define ISC_CBC_CONTRAST_MASK	GENMASK(11, 0)
=20
-/* Hue Register */
-#define ISC_CBCHS_HUE	0x4e0
-/* Saturation Register */
-#define ISC_CBCHS_SAT	0x4e4
+/* Hue Register: signed 9-bit two's complement, covers -180 to +180 degree=
s */
+#define ISC_CBHS_HUE		0x4e0
+#define ISC_CBHS_HUE_MASK	GENMASK(8, 0)
+
+/* Saturation Register: unsigned Q4 fixed-point (1.0 =3D 16, V4L2 range 0-=
100) */
+#define ISC_CBHS_SAT		0x4e4
+#define ISC_CBHS_SAT_MASK	GENMASK(6, 0)
=20
 /* Offset for SUB422 register specific to sama5d2 product */
 #define ISC_SAMA5D2_SUB422_OFFSET	0
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/med=
ia/platform/microchip/microchip-isc.h
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
=20
@@ -139,6 +139,8 @@ struct isc_ctrls {
=20
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
=20
 	u32		max_width;
 	u32		max_height;
diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/dri=
vers/media/platform/microchip/microchip-sama5d2-isc.c
index 66d3d7891991..239aac170472 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -54,7 +54,7 @@
=20
 #define ISC_SAMA5D2_PIPELINE \
 	(WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
=20
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama5d2_controller_formats[] =3D {
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 8b73b625d92b..6705011edc2a 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -61,7 +61,7 @@
 #define ISC_SAMA7G5_PIPELINE \
 	(DPC_DPCENABLE | DPC_GDCENABLE | DPC_BLCENABLE | \
 	WB_ENABLE | CFA_ENABLE | CC_ENABLE | GAM_ENABLES | CSC_ENABLE | \
-	CBC_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
+	CBHS_ENABLE | SUB422_ENABLE | SUB420_ENABLE)
=20
 /* This is a list of the formats that the ISC can *output* */
 static const struct isc_format sama7g5_controller_formats[] =3D {
@@ -257,9 +257,8 @@ static void isc_sama7g5_config_cbc(struct isc_device *i=
sc)
 	/* Configure what is set via v4l2 ctrls */
 	regmap_write(regmap, ISC_CBC_BRIGHT + isc->offsets.cbc, isc->ctrls.bright=
ness);
 	regmap_write(regmap, ISC_CBC_CONTRAST + isc->offsets.cbc, isc->ctrls.cont=
rast);
-	/* Configure Hue and Saturation as neutral midpoint */
-	regmap_write(regmap, ISC_CBCHS_HUE, 0);
-	regmap_write(regmap, ISC_CBCHS_SAT, (1 << 4));
+	regmap_write(regmap, ISC_CBHS_HUE, isc->ctrls.hue);
+	regmap_write(regmap, ISC_CBHS_SAT, isc->ctrls.saturation);
 }
=20
 static void isc_sama7g5_config_cc(struct isc_device *isc)
@@ -461,6 +460,7 @@ static int microchip_xisc_probe(struct platform_device =
*pdev)
=20
 	isc->gamma_table =3D isc_sama7g5_gamma_table;
 	isc->gamma_max =3D 2;
+	isc->has_cbhs =3D true;
=20
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width =3D ISC_SAM9X7_MAX_SUPPORT_WIDTH;
--=20
2.34.1


