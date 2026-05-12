Return-Path: <linux-media+bounces-61295-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEU4BoVMA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61295-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:51:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A5524087
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FE5C309A1E3
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9AF3C988D;
	Tue, 12 May 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="S7yO9oq0"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DEE3C8C7D;
	Tue, 12 May 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600658; cv=none; b=TDtLHYq7ZVlgKNVgd9XgQy7NxmUikono2YM0J8xfkuHDhKl2qoiIPnfMZjLyyPvo8uivBdZdjjF5+w/QVP3Y8iJsLnfPxw19h3r85mdKGxU76NhfrhHkArqqHsXLj6V5yV+7TP7ZxJqLjL3Wy9eWy20LyplhkaPsnKcoM9qlXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600658; c=relaxed/simple;
	bh=5yCExlH+Lzz0uNStrjzI+Z50N3UCUAbboRtJptlwOd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9BOCrVjohqeWIvWyWbY0muhKrqaD/XyinaijUswoFaeEIFG6xCj8eVxYlGJFhcywj0E0NSVSPUArv3/FRvqDEwUVjjTovfwqmiPudBdDahqMWzIcxvloSQEleBTek8d/9dGZnAoM0FPhvZwjat9TFLW/z3GispKUcK47h98sw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=S7yO9oq0; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600657; x=1810136657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5yCExlH+Lzz0uNStrjzI+Z50N3UCUAbboRtJptlwOd4=;
  b=S7yO9oq0isHyN89KDS6EW955HHRTf66oPXziZKnwBvM3oooUVz3qEKjl
   d+YPpd/lxkk4vL9iGCBMDwqV4Si+EwKsPibZFum7BwiVlm/f/ZSm3siHk
   eLDDDaJmpWGoEOfssNboNUywiuSXS9plo5f45rUUj15AQecOtVUuTTRoj
   Qz+QaJW9YC4IBloz99RYt/+/WIPhS2N3ApfuczrCGbnksxvwb/KrfPF2z
   lhWaLf748X0OJcmFLDvz90Ag4xvD/5/zbpE39W8v8GBwmH1id7KnaNsRy
   9lNjnJ5V9jOjvxlg/U6j8QznZcoMUUxsGRdZ5TpGRumzKkfslOB5NUlZR
   Q==;
X-CSE-ConnectionGUID: 8v2vbvooQ3afilXTCFNQoA==
X-CSE-MsgGUID: F2/xLscwR2iAP+AHDCI7Ow==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="288760457"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 08:44:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Tue, 12 May 2026 08:44:15 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:12 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>,
	"Balamanikandan Gunasundar" <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v2 10/15] media: microchip-isc: expose color correction matrix as V4L2 controls
Date: Tue, 12 May 2026 21:13:34 +0530
Message-ID: <20260512154339.210444-11-balakrishnan.s@microchip.com>
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
X-Rspamd-Queue-Id: 881A5524087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61295-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[microchip.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:mid,microchip.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add custom controls for 3x3 color correction matrix and RGB offsets.
Used by libcamera IPA for sensor color calibration.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microch=
ip.com>
Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 247 +++++++++++++++++-
 .../media/platform/microchip/microchip-isc.h  |  23 ++
 include/linux/atmel-isc-media.h               |  13 +
 3 files changed, 281 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index 7e140af51912..f78145820e40 100644
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
@@ -55,6 +55,46 @@ static inline void isc_update_v4l2_ctrls(struct isc_devi=
ce *isc)
 	v4l2_ctrl_s_ctrl(isc->gb_off_ctrl, ctrls->offset[ISC_HIS_CFG_MODE_GB]);
 }
=20
+static void isc_apply_gamma(struct isc_device *isc);
+
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
@@ -90,6 +130,14 @@ static inline void isc_reset_awb_ctrls(struct isc_devic=
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
@@ -235,7 +283,8 @@ static void isc_set_pipeline(struct isc_device *isc, u3=
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
@@ -1481,6 +1530,8 @@ static void isc_awb_work(struct work_struct *w)
 		goto out_pm_put;
 	}
=20
+	/* write pending CC matrix from shadow to hardware registers */
+	isc_update_cc_ctrls(isc);
 	isc_update_profile(isc);
=20
 	mutex_unlock(&isc->awb_mutex);
@@ -1659,6 +1710,161 @@ static int isc_g_volatile_awb_ctrl(struct v4l2_ctrl=
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
@@ -1700,6 +1906,29 @@ ISC_CTRL_GAIN(isc_b_gain_ctrl, ISC_CID_B_GAIN, "Blue=
 Component Gain");
 ISC_CTRL_GAIN(isc_gr_gain_ctrl, ISC_CID_GR_GAIN, "Green Red Component Gain=
");
 ISC_CTRL_GAIN(isc_gb_gain_ctrl, ISC_CID_GB_GAIN, "Green Blue Component Gai=
n");
=20
+/*
+ * Per-channel gamma LUT controls (64-element U32 arrays, range 0-1023).
+ * Setting any of these activates the custom tone curve and overrides the
+ * preset V4L2_CID_GAMMA curve.  One macro expands to a static v4l2_ctrl_c=
onfig.
+ */
+#define ISC_CTRL_GAMMA_LUT(_name, _id, _name_str) \
+	static const struct v4l2_ctrl_config _name =3D { \
+		.ops  =3D &isc_ctrl_ops, \
+		.id   =3D _id, \
+		.name =3D _name_str, \
+		.type =3D V4L2_CTRL_TYPE_U32, \
+		.flags =3D V4L2_CTRL_FLAG_EXECUTE_ON_WRITE, \
+		.dims =3D { GAMMA_ENTRIES }, \
+		.min  =3D 0, \
+		.max  =3D 1023, \
+		.step =3D 1, \
+		.def  =3D 0, \
+	}
+
+ISC_CTRL_GAMMA_LUT(isc_gamma_b_lut_ctrl, ISC_CID_GAMMA_B_LUT, "Blue Gamma =
LUT");
+ISC_CTRL_GAMMA_LUT(isc_gamma_g_lut_ctrl, ISC_CID_GAMMA_G_LUT, "Green Gamma=
 LUT");
+ISC_CTRL_GAMMA_LUT(isc_gamma_r_lut_ctrl, ISC_CID_GAMMA_R_LUT, "Red Gamma L=
UT");
+
 static int isc_ctrl_init(struct isc_device *isc)
 {
 	const struct v4l2_ctrl_ops *ops =3D &isc_ctrl_ops;
@@ -1752,6 +1981,20 @@ static int isc_ctrl_init(struct isc_device *isc)
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


