Return-Path: <linux-media+bounces-61343-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDahCBgnBGqDEwIAu9opvQ
	(envelope-from <linux-media+bounces-61343-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:24:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E852E953
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 09:24:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E2B83117311
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 07:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235B13D649C;
	Wed, 13 May 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="XUOmG/KF"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E003D6471;
	Wed, 13 May 2026 07:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778656701; cv=none; b=X8ychi5bmEVG+y4hfnCHtSz8uriA+I2iBeAoHdNAZxPx0PiSBlYqXPGwhigiNUY4zElhQZa0uROrj00HeJfg+SI5eEVXBQRqCEmri5+c1eIBoEun4gsR9QEbiJrQU2I1Gueda4azR9XZ96na6n2GDwpTRmCCc6GrQ5U+9YrUb1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778656701; c=relaxed/simple;
	bh=EI10U6l0lPTC8H5qaudUesuZm7mPwvRbs/ym2nBo298=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObwwucrHt+2UxOwEfC5FbQLM/XayBmVT3oLlJChR8J763V5fvPFJz3BN075g0ZTndOJ5pDN9CUYQlhoTUFy1wglAz3zJhewSeP6A/4u550WD3Ruw52ncwaF7Sud/gU2hDyDJhM4o9vmYmFw1XGO256rZcnifI4r5AJo5jL4VSNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=XUOmG/KF; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778656697; x=1810192697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EI10U6l0lPTC8H5qaudUesuZm7mPwvRbs/ym2nBo298=;
  b=XUOmG/KFHN1TzIeTEs0yZTjJh/Hx7rwic/56RTQ0uaj8M0LZqMT5ouZ5
   x+PqJOZXeFpOhJ1CocthV9odRjrtNwswbVgJTEPuyN7EzQbpI/Tf+qyEB
   dBtvl+WMj+sOyqzGsaM9gcmP9AzwjQLYX9qVEdM/94ypvGYdYvG3sPE63
   IIPCzbZzftWDEnu+vji23xjzHNLIPmnK5dPq7cSpYa+nYXv7MUvCO77j2
   za0h9tBGYEPfeevw8qNq8nfu54mAfGmWf166GZakRTHG3pHvV3ThuqGsp
   u7L/eYL1TdCy9DJX6n7j+w1obVSSFNvwMJz5BTwQOypHV44A5p88624g5
   w==;
X-CSE-ConnectionGUID: N97c+eAxRAuIqI0gATmRjA==
X-CSE-MsgGUID: BV/A1zSRThuRtdxj4Z6iEw==
X-IronPort-AV: E=Sophos;i="6.23,232,1770620400"; 
   d="scan'208";a="57838972"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 00:18:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 13 May 2026 00:18:16 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 13 May 2026 00:18:14 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 10/15] media: microchip-isc: expose color correction matrix as V4L2 controls
Date: Wed, 13 May 2026 12:47:37 +0530
Message-ID: <20260513071742.97263-11-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513071742.97263-1-balakrishnan.s@microchip.com>
References: <20260512154339.210444-1-balakrishnan.s@microchip.com>
 <20260513071742.97263-1-balakrishnan.s@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Rspamd-Queue-Id: 588E852E953
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61343-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add custom controls for 3x3 color correction matrix and RGB offsets.
Used by libcamera IPA for sensor color calibration.

Co-developed-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 222 +++++++++++++++++-
 .../media/platform/microchip/microchip-isc.h  |  23 ++
 include/linux/atmel-isc-media.h               |  13 +
 3 files changed, 256 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index 1727c98665d1..c24a03f9a843 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -32,7 +32,7 @@
 #include "microchip-isc-regs.h"
 #include "microchip-isc.h"
=20
-#define ISC_IS_FORMAT_RAW(mbus_code) \
+#define ISC_IS_FORMAT_RAW(mbus_code)		\
 	(((mbus_code) & 0xf000) =3D=3D 0x3000)
=20
 #define ISC_IS_FORMAT_GREY(mbus_code) \
@@ -55,6 +55,44 @@ static inline void isc_update_v4l2_ctrls(struct isc_devi=
ce *isc)
 	v4l2_ctrl_s_ctrl(isc->gb_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_GB]);
 }
=20
+/* commit CC shadow to hardware; called while ISC is powered */
+static void isc_update_cc_ctrls(struct isc_device *isc)
+{
+	struct isc_ctrls *ctrls =3D &isc->ctrls;
+	struct regmap *regmap =3D isc->regmap;
+	u32 m =3D GENMASK(11, 0);
+
+	if (!ctrls->cc_dirty)
+		return;
+
+	regmap_update_bits(regmap, ISC_CC_RR_RG, m,
+			   (u32)ctrls->cc_coeff[0] & m);
+	regmap_update_bits(regmap, ISC_CC_RR_RG, GENMASK(27, 16),
+			   ((u32)ctrls->cc_coeff[1] & m) << 16);
+	regmap_update_bits(regmap, ISC_CC_RB_OR, m,
+			   (u32)ctrls->cc_coeff[2] & m);
+	regmap_update_bits(regmap, ISC_CC_RB_OR, GENMASK(27, 16),
+			   ((u32)ctrls->cc_offset[0] & m) << 16);
+	regmap_update_bits(regmap, ISC_CC_GR_GG, m,
+			   (u32)ctrls->cc_coeff[3] & m);
+	regmap_update_bits(regmap, ISC_CC_GR_GG, GENMASK(27, 16),
+			   ((u32)ctrls->cc_coeff[4] & m) << 16);
+	regmap_update_bits(regmap, ISC_CC_GB_OG, m,
+			   (u32)ctrls->cc_coeff[5] & m);
+	regmap_update_bits(regmap, ISC_CC_GB_OG, GENMASK(27, 16),
+			   ((u32)ctrls->cc_offset[1] & m) << 16);
+	regmap_update_bits(regmap, ISC_CC_BR_BG, m,
+			   (u32)ctrls->cc_coeff[6] & m);
+	regmap_update_bits(regmap, ISC_CC_BR_BG, GENMASK(27, 16),
+			   ((u32)ctrls->cc_coeff[7] & m) << 16);
+	regmap_update_bits(regmap, ISC_CC_BB_OB, m,
+			   (u32)ctrls->cc_coeff[8] & m);
+	regmap_update_bits(regmap, ISC_CC_BB_OB, GENMASK(27, 16),
+			   ((u32)ctrls->cc_offset[2] & m) << 16);
+
+	ctrls->cc_dirty =3D false;
+}
+
 static inline void isc_update_awb_ctrls(struct isc_device *isc)
 {
 	struct isc_ctrls *ctrls =3D &isc->ctrls;
@@ -90,6 +128,14 @@ static inline void isc_reset_awb_ctrls(struct isc_devic=
e *isc)
 		/* offsets are in 2's complements */
 		isc->ctrls.offset[c] =3D 0;
 	}
+
+	/* identity matrix: diagonal =3D 1.0 in Q4.8 =3D 256, off-diagonal =3D 0 =
*/
+	memset(isc->ctrls.cc_coeff, 0, sizeof(isc->ctrls.cc_coeff));
+	isc->ctrls.cc_coeff[0] =3D 256; /* RR */
+	isc->ctrls.cc_coeff[4] =3D 256; /* GG */
+	isc->ctrls.cc_coeff[8] =3D 256; /* BB */
+	memset(isc->ctrls.cc_offset, 0, sizeof(isc->ctrls.cc_offset));
+	isc->ctrls.cc_dirty =3D false;
 }
=20
 static int isc_queue_setup(struct vb2_queue *vq,
@@ -235,7 +281,8 @@ static void isc_set_pipeline(struct isc_device *isc, u3=
2 pipeline)
 	isc->config_dpc(isc);
 	isc->config_csc(isc);
 	isc->config_cbc(isc);
-	isc->config_cc(isc);
+	/* use shadow; config_cc() always resets to identity */
+	isc_update_cc_ctrls(isc);
 	isc->config_gam(isc);
 }
=20
@@ -1481,6 +1528,8 @@ static void isc_awb_work(struct work_struct *w)
 		goto out_pm_put;
 	}
=20
+	/* write pending CC matrix from shadow to hardware registers */
+	isc_update_cc_ctrls(isc);
 	isc_update_profile(isc);
=20
 	mutex_unlock(&isc->awb_mutex);
@@ -1660,6 +1709,161 @@ static int isc_g_volatile_awb_ctrl(struct v4l2_ctrl=
 *ctrl)
 	return 0;
 }
=20
+static int isc_cc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct isc_device *isc =3D container_of(ctrl->handler,
+					     struct isc_device, ctrls.handler);
+	struct isc_ctrls *ctrls =3D &isc->ctrls;
+
+	dev_dbg(isc->dev, "id =3D 0x%x; val =3D 0x%x", ctrl->id, ctrl->val);
+
+	/*
+	 * CC registers need pm_runtime active for access.
+	 * Store to shadow here; isc_update_cc_ctrls() writes to hardware
+	 * from isc_awb_work() where ISC is powered.
+	 */
+	switch (ctrl->id) {
+	case ISC_CID_CC_RR:
+		ctrls->cc_coeff[0] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_RG:
+		ctrls->cc_coeff[1] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_RB:
+		ctrls->cc_coeff[2] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_OR:
+		ctrls->cc_offset[0] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_GR:
+		ctrls->cc_coeff[3] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_GG:
+		ctrls->cc_coeff[4] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_GB:
+		ctrls->cc_coeff[5] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_OG:
+		ctrls->cc_offset[1] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_BR:
+		ctrls->cc_coeff[6] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_BG:
+		ctrls->cc_coeff[7] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_BB:
+		ctrls->cc_coeff[8] =3D ctrl->val;
+		break;
+	case ISC_CID_CC_OB:
+		ctrls->cc_offset[2] =3D ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ctrls->cc_dirty =3D true;
+	return 0;
+}
+
+static int isc_cc_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct isc_device *isc =3D container_of(ctrl->handler,
+					     struct isc_device, ctrls.handler);
+	struct regmap *regmap =3D isc->regmap;
+	unsigned int reg;
+
+	switch (ctrl->id) {
+	case ISC_CID_CC_RR:
+		regmap_read(regmap, ISC_CC_RR_RG, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_RG:
+		regmap_read(regmap, ISC_CC_RR_RG, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_RB:
+		regmap_read(regmap, ISC_CC_RB_OR, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OR:
+		regmap_read(regmap, ISC_CC_RB_OR, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_GR:
+		regmap_read(regmap, ISC_CC_GR_GG, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_GG:
+		regmap_read(regmap, ISC_CC_GR_GG, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_GB:
+		regmap_read(regmap, ISC_CC_GB_OG, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OG:
+		regmap_read(regmap, ISC_CC_GB_OG, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_BR:
+		regmap_read(regmap, ISC_CC_BR_BG, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_BG:
+		regmap_read(regmap, ISC_CC_BR_BG, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	case ISC_CID_CC_BB:
+		regmap_read(regmap, ISC_CC_BB_OB, &reg);
+		ctrl->val =3D sign_extend32(reg & GENMASK(11, 0), 11);
+		break;
+	case ISC_CID_CC_OB:
+		regmap_read(regmap, ISC_CC_BB_OB, &reg);
+		ctrl->val =3D sign_extend32((reg & GENMASK(27, 16)) >> 16, 11);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(isc->dev, "id =3D 0x%x; val =3D 0x%x", ctrl->id, ctrl->val);
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops isc_cc_ops =3D {
+	.s_ctrl =3D isc_cc_s_ctrl,
+	.g_volatile_ctrl =3D isc_cc_g_volatile_ctrl,
+};
+
+#define ISC_CTRL_CC(_name, _id, _name_str, _def) \
+	static const struct v4l2_ctrl_config _name =3D { \
+		.ops =3D &isc_cc_ops, \
+		.id =3D _id, \
+		.name =3D _name_str, \
+		.type =3D V4L2_CTRL_TYPE_INTEGER, \
+		.flags =3D V4L2_CTRL_FLAG_SLIDER | V4L2_CTRL_FLAG_VOLATILE | \
+			 V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, \
+		.min =3D -2048, \
+		.max =3D 2047, \
+		.step =3D 1, \
+		.def =3D _def, \
+	}
+
+ISC_CTRL_CC(isc_cc_rr_ctrl, ISC_CID_CC_RR, "CC RR", 256);
+ISC_CTRL_CC(isc_cc_rg_ctrl, ISC_CID_CC_RG, "CC RG", 0);
+ISC_CTRL_CC(isc_cc_rb_ctrl, ISC_CID_CC_RB, "CC RB", 0);
+ISC_CTRL_CC(isc_cc_or_ctrl, ISC_CID_CC_OR, "CC OR", 0);
+ISC_CTRL_CC(isc_cc_gr_ctrl, ISC_CID_CC_GR, "CC GR", 0);
+ISC_CTRL_CC(isc_cc_gg_ctrl, ISC_CID_CC_GG, "CC GG", 256);
+ISC_CTRL_CC(isc_cc_gb_ctrl, ISC_CID_CC_GB, "CC GB", 0);
+ISC_CTRL_CC(isc_cc_og_ctrl, ISC_CID_CC_OG, "CC OG", 0);
+ISC_CTRL_CC(isc_cc_br_ctrl, ISC_CID_CC_BR, "CC BR", 0);
+ISC_CTRL_CC(isc_cc_bg_ctrl, ISC_CID_CC_BG, "CC BG", 0);
+ISC_CTRL_CC(isc_cc_bb_ctrl, ISC_CID_CC_BB, "CC BB", 256);
+ISC_CTRL_CC(isc_cc_ob_ctrl, ISC_CID_CC_OB, "CC OB", 0);
+
 static const struct v4l2_ctrl_ops isc_awb_ops =3D {
 	.s_ctrl =3D isc_s_awb_ctrl,
 	.g_volatile_ctrl =3D isc_g_volatile_awb_ctrl,
@@ -1753,6 +1957,20 @@ static int isc_ctrl_init(struct isc_device *isc)
 	isc->gr_off_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_gr_off_ctrl, NULL);
 	isc->gb_off_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_gb_off_ctrl, NULL);
=20
+	/* Color correction control */
+	isc->cc_rr =3D v4l2_ctrl_new_custom(hdl, &isc_cc_rr_ctrl, NULL);
+	isc->cc_rg =3D v4l2_ctrl_new_custom(hdl, &isc_cc_rg_ctrl, NULL);
+	isc->cc_rb =3D v4l2_ctrl_new_custom(hdl, &isc_cc_rb_ctrl, NULL);
+	isc->cc_or =3D v4l2_ctrl_new_custom(hdl, &isc_cc_or_ctrl, NULL);
+	isc->cc_gr =3D v4l2_ctrl_new_custom(hdl, &isc_cc_gr_ctrl, NULL);
+	isc->cc_gg =3D v4l2_ctrl_new_custom(hdl, &isc_cc_gg_ctrl, NULL);
+	isc->cc_gb =3D v4l2_ctrl_new_custom(hdl, &isc_cc_gb_ctrl, NULL);
+	isc->cc_og =3D v4l2_ctrl_new_custom(hdl, &isc_cc_og_ctrl, NULL);
+	isc->cc_br =3D v4l2_ctrl_new_custom(hdl, &isc_cc_br_ctrl, NULL);
+	isc->cc_bg =3D v4l2_ctrl_new_custom(hdl, &isc_cc_bg_ctrl, NULL);
+	isc->cc_bb =3D v4l2_ctrl_new_custom(hdl, &isc_cc_bb_ctrl, NULL);
+	isc->cc_ob =3D v4l2_ctrl_new_custom(hdl, &isc_cc_ob_ctrl, NULL);
+
 	/*
 	 * The cluster is in auto mode with autowhitebalance enabled
 	 * and manual mode otherwise.
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/med=
ia/platform/microchip/microchip-isc.h
index 2c8bcaaa26ea..db651c9f1387 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -134,6 +134,12 @@ enum{
 	HIST_DISABLED,
 };
=20
+#define GAMMA_ENTRIES		64
+
+/* CC matrix coefficients (3x3 row-major) and per-channel offsets */
+#define ISC_CC_COEFF_NUM	9
+#define ISC_CC_OFFSET_NUM	3
+
 struct isc_ctrls {
 	struct v4l2_ctrl_handler handler;
=20
@@ -158,6 +164,11 @@ struct isc_ctrls {
 #define HIST_MIN_INDEX		0
 #define HIST_MAX_INDEX		1
 	u32 hist_minmax[HIST_BAYER][2];
+
+	/* CC matrix shadow; committed from isc_set_pipeline() and isc_awb_work()=
 */
+	s32 cc_coeff[ISC_CC_COEFF_NUM];
+	s32 cc_offset[ISC_CC_OFFSET_NUM];
+	bool cc_dirty;
 };
=20
 #define ISC_PIPE_LINE_NODE_NUM	15
@@ -338,6 +349,18 @@ struct isc_device {
 		struct v4l2_ctrl	*b_off_ctrl;
 		struct v4l2_ctrl	*gr_off_ctrl;
 		struct v4l2_ctrl	*gb_off_ctrl;
+		struct v4l2_ctrl        *cc_rr;
+		struct v4l2_ctrl        *cc_rg;
+		struct v4l2_ctrl        *cc_rb;
+		struct v4l2_ctrl        *cc_or;
+		struct v4l2_ctrl        *cc_gr;
+		struct v4l2_ctrl        *cc_gg;
+		struct v4l2_ctrl        *cc_gb;
+		struct v4l2_ctrl        *cc_og;
+		struct v4l2_ctrl        *cc_br;
+		struct v4l2_ctrl        *cc_bg;
+		struct v4l2_ctrl        *cc_bb;
+		struct v4l2_ctrl        *cc_ob;
 	};
=20
 #define GAMMA_ENTRIES	64
diff --git a/include/linux/atmel-isc-media.h b/include/linux/atmel-isc-medi=
a.h
index 79a320fb724e..028d34c8de81 100644
--- a/include/linux/atmel-isc-media.h
+++ b/include/linux/atmel-isc-media.h
@@ -53,6 +53,19 @@ enum atmel_isc_ctrl_id {
 	ISC_CID_GR_OFFSET,
 	/* Green Blue component offset control */
 	ISC_CID_GB_OFFSET,
+	/* Color correction registers */
+	ISC_CID_CC_RR,
+	ISC_CID_CC_RG,
+	ISC_CID_CC_RB,
+	ISC_CID_CC_OR,
+	ISC_CID_CC_GR,
+	ISC_CID_CC_GG,
+	ISC_CID_CC_GB,
+	ISC_CID_CC_OG,
+	ISC_CID_CC_BR,
+	ISC_CID_CC_BG,
+	ISC_CID_CC_BB,
+	ISC_CID_CC_OB,
 };
=20
 #endif
--=20
2.34.1


