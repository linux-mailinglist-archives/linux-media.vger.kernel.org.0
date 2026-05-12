Return-Path: <linux-media+bounces-61296-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLFvGFFLA2pq3AEAu9opvQ
	(envelope-from <linux-media+bounces-61296-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:46:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C34523F0A
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50D13305FE5E
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 15:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198B73C8C47;
	Tue, 12 May 2026 15:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hwNwyKPn"
X-Original-To: linux-media@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416E3C988E;
	Tue, 12 May 2026 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778600661; cv=none; b=McCg7S3bzMVprrZyB9ZCA5F+uuxA//O4mQLkNMC/qIGvWMUosteks/rigBD7odr2Jsn9iw7Dn3vMB0SZvP/a+mIt7VJC79xfa80oil3TAbsoATVuOp4Qk2oIhv8f3oI3VaSrTNm7JwgSvtnRdrHecA0gK4zycFyYU+Q9dK6EjeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778600661; c=relaxed/simple;
	bh=qgJRjDdDKYUCbpz0CUdEc9ue5jBEBqdWfm0LHbVTgaY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=syrPBRRFUq6OVadoaGN9sVm6VbdqutNx+61zSY7ZV0lbQWFgYADPKkHAjREQpAvVC5r7v2TinCfNfOSeWU3i8GN7+3Qy19PdX4PmxV/stwNLRVL7tVGc1HjJTXh6uxyFTpJcrXl4SWS8dhpWoCcNCqhWoDHEiDB9BcyJMirrXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hwNwyKPn; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778600660; x=1810136660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qgJRjDdDKYUCbpz0CUdEc9ue5jBEBqdWfm0LHbVTgaY=;
  b=hwNwyKPnMjG+S3/V8Z913o5aITH7EmKpU92WvFHnrn4fwqLXNqgPlwx5
   UrN/1UGXCowaGHw1pFDTm+xXcUfO3JYPhKtfP9clsoZ28sdFW0MgFoIwn
   89HnDuGfw/cMN/ALZTEgQOmtW4cTJWDJbc+26ISYqP4dMPhhCt2CCwc2i
   NezUWMoV9PaSeU1z2/AK0TLEH5SFFSoiL8eqoJcC+vj33z4Pvyk2BlQYn
   J7Dvn5vZVg+G0aNmKKwvVzj2XT4R/X2yHznoJ9/Emgk47BjwpIi2OdVhq
   7pW/Ev5wHb1/U8OlV/IepZUGLwavBtWw0Dvvgm0AsLE+EqoIUPUoPRFmh
   Q==;
X-CSE-ConnectionGUID: HnGOENH1Q6mvjZ1NizDJbQ==
X-CSE-MsgGUID: e0c2Ojg3S12e0yNXxmz0ww==
X-IronPort-AV: E=Sophos;i="6.23,231,1770620400"; 
   d="scan'208";a="57399286"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 May 2026 08:44:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 12 May 2026 08:44:18 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 12 May 2026 08:44:16 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <linux-media@vger.kernel.org>
CC: <eugen.hristev@linaro.org>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
	<nicolas.ferre@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/15] media: microchip-isc: add per-channel gamma LUT controls
Date: Tue, 12 May 2026 21:13:35 +0530
Message-ID: <20260512154339.210444-12-balakrishnan.s@microchip.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 28C34523F0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61296-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balakrishnan.s@microchip.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Action: no action

Add 64-entry gamma LUT controls for R/G/B channels. Setting any LUT
overrides V4L2_CID_GAMMA; writing V4L2_CID_GAMMA restores presets.
Supports SAMA7G5 bipartite encoding.

Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
---
 .../platform/microchip/microchip-isc-base.c   | 148 +++++++++++++++++-
 .../media/platform/microchip/microchip-isc.h  |  25 ++-
 .../microchip/microchip-sama7g5-isc.c         |   1 +
 include/linux/atmel-isc-media.h               |  18 +++
 4 files changed, 184 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-isc-base.c b/driver=
s/media/platform/microchip/microchip-isc-base.c
index f78145820e40..3749f473c3c6 100644
--- a/drivers/media/platform/microchip/microchip-isc-base.c
+++ b/drivers/media/platform/microchip/microchip-isc-base.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/math64.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
@@ -250,12 +251,83 @@ static void isc_start_dma(struct isc_device *isc)
 	spin_unlock(&isc->awb_lock);
 }
=20
-static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
+/**
+ * isc_lut_to_hw() - Convert a 64-entry 10-bit LUT to ISC register format
+ * @lut:	64-element array of 10-bit output values (0-1023); element i
+ *		is the desired output for input range [i*16 .. (i+1)*16 - 1].
+ * @hw:		64-element output array to receive the packed hardware values.
+ * @bipartite:	true for SAMA7G5 (ISC_GAM_CTRL_BIPART active): delta is sto=
red
+ *		as a Q9 per-step increment (multiply by 32 =3D 512/16).
+ *		false for SAMA5D2: delta is a plain per-segment increment.
+ *
+ * Each hardware register word packs two fields:
+ *   bits[31:16] =3D 10-bit output value at the start of segment i
+ *   bits[15:0]  =3D interpolation delta
+ *
+ * In bipartite mode the hardware uses the delta to linearly interpolate
+ * across all 16 input steps within the segment (Q9 fixed-point: delta/512
+ * per step).  In non-bipartite mode the hardware applies a constant output
+ * across the whole segment.
+ */
+static void isc_lut_to_hw(const u32 *lut, u32 *hw, bool bipartite)
+{
+	unsigned int i;
+	u32 cur, next, delta;
+
+	for (i =3D 0; i < GAMMA_ENTRIES; i++) {
+		cur  =3D lut[i];
+		next =3D (i < GAMMA_ENTRIES - 1) ? lut[i + 1] : 1023;
+
+		/*
+		 * Bipartite (SAMA7G5): delta =3D per-step increment in Q9
+		 *   =3D (next - cur) * 512 / 16 =3D (next - cur) * 32
+		 * Non-bipartite (SAMA5D2): delta =3D per-segment increment
+		 *   =3D (next - cur)
+		 */
+		delta =3D bipartite ? (next - cur) * 32 : (next - cur);
+
+		hw[i] =3D (cur << 16) | (delta & 0xffff);
+	}
+}
+
+/**
+ * isc_apply_gamma() - Write gamma LUT registers from current ctrls state
+ * @isc: ISC device
+ *
+ * Converts ctrls->gamma_lut_{b,g,r}[] to hardware format via isc_lut_to_h=
w()
+ * and writes all three ISC_GAM_*ENTRY register banks.  Falls back to the
+ * preset gamma_table when gamma_lut_override is false.
+ *
+ * Must be called before isc_update_profile() whenever the gamma curve cha=
nges
+ * mid-stream, since isc_update_profile() only commits whatever is already=
 in
+ * the registers to the active pipeline shadow.
+ */
+static void isc_apply_gamma(struct isc_device *isc)
 {
 	struct regmap *regmap =3D isc->regmap;
 	struct isc_ctrls *ctrls =3D &isc->ctrls;
-	u32 val, bay_cfg;
 	const u32 *gamma;
+	u32 hw[GAMMA_ENTRIES];
+
+	if (ctrls->gamma_lut_override) {
+		isc_lut_to_hw(ctrls->gamma_lut_b, hw, isc->gamma_bipartite);
+		regmap_bulk_write(regmap, ISC_GAM_BENTRY, hw, GAMMA_ENTRIES);
+		isc_lut_to_hw(ctrls->gamma_lut_g, hw, isc->gamma_bipartite);
+		regmap_bulk_write(regmap, ISC_GAM_GENTRY, hw, GAMMA_ENTRIES);
+		isc_lut_to_hw(ctrls->gamma_lut_r, hw, isc->gamma_bipartite);
+		regmap_bulk_write(regmap, ISC_GAM_RENTRY, hw, GAMMA_ENTRIES);
+	} else {
+		gamma =3D &isc->gamma_table[ctrls->gamma_index][0];
+		regmap_bulk_write(regmap, ISC_GAM_BENTRY, gamma, GAMMA_ENTRIES);
+		regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
+		regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
+	}
+}
+
+static void isc_set_pipeline(struct isc_device *isc, u32 pipeline)
+{
+	struct regmap *regmap =3D isc->regmap;
+	u32 val, bay_cfg;
 	unsigned int i;
=20
 	/* WB-->CFA-->CC-->GAM-->CSC-->CBC-->SUB422-->SUB420 */
@@ -275,10 +347,7 @@ static void isc_set_pipeline(struct isc_device *isc, u=
32 pipeline)
=20
 	regmap_write(regmap, ISC_CFA_CFG, bay_cfg | ISC_CFA_CFG_EITPOL);
=20
-	gamma =3D &isc->gamma_table[ctrls->gamma_index][0];
-	regmap_bulk_write(regmap, ISC_GAM_BENTRY, gamma, GAMMA_ENTRIES);
-	regmap_bulk_write(regmap, ISC_GAM_GENTRY, gamma, GAMMA_ENTRIES);
-	regmap_bulk_write(regmap, ISC_GAM_RENTRY, gamma, GAMMA_ENTRIES);
+	isc_apply_gamma(isc);
=20
 	isc->config_dpc(isc);
 	isc->config_csc(isc);
@@ -1544,11 +1613,35 @@ static void isc_awb_work(struct work_struct *w)
 	pm_runtime_put_sync(isc->dev);
 }
=20
+/*
+ * isc_update_gamma_lut_override() - Evaluate gamma LUT override flag
+ *
+ * Activates the per-channel LUT override only when at least one entry
+ * across any channel is non-zero.  An all-zero write (including the
+ * default initialisation from v4l2_ctrl_handler_setup) disables the
+ * override so the built-in gamma table remains active.
+ */
+static void isc_update_gamma_lut_override(struct isc_ctrls *ctrls)
+{
+	unsigned int i;
+	bool any_nonzero =3D false;
+
+	for (i =3D 0; i < GAMMA_ENTRIES && !any_nonzero; i++) {
+		if (ctrls->gamma_lut_b[i] ||
+		    ctrls->gamma_lut_g[i] ||
+		    ctrls->gamma_lut_r[i])
+			any_nonzero =3D true;
+	}
+	ctrls->gamma_lut_override =3D any_nonzero;
+}
+
 static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct isc_device *isc =3D container_of(ctrl->handler,
 					     struct isc_device, ctrls.handler);
 	struct isc_ctrls *ctrls =3D &isc->ctrls;
+	struct regmap *regmap =3D isc->regmap;
+	bool apply_gamma =3D false;
=20
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -1583,11 +1676,42 @@ static int isc_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_GAMMA:
 		ctrls->gamma_index =3D ctrl->val;
+		ctrls->gamma_lut_override =3D false;
+		apply_gamma =3D true;
+		break;
+	case ISC_CID_GAMMA_B_LUT:
+		memcpy(ctrls->gamma_lut_b, ctrl->p_new.p_u32,
+		       GAMMA_ENTRIES * sizeof(u32));
+		isc_update_gamma_lut_override(ctrls);
+		apply_gamma =3D true;
+		break;
+	case ISC_CID_GAMMA_G_LUT:
+		memcpy(ctrls->gamma_lut_g, ctrl->p_new.p_u32,
+		       GAMMA_ENTRIES * sizeof(u32));
+		isc_update_gamma_lut_override(ctrls);
+		apply_gamma =3D true;
+		break;
+	case ISC_CID_GAMMA_R_LUT:
+		memcpy(ctrls->gamma_lut_r, ctrl->p_new.p_u32,
+		       GAMMA_ENTRIES * sizeof(u32));
+		isc_update_gamma_lut_override(ctrls);
+		apply_gamma =3D true;
 		break;
 	default:
 		return -EINVAL;
 	}
=20
+	/*
+	 * isc_apply_gamma() writes gamma LUT registers; it must be called
+	 * under awb_mutex so it does not race with isc_awb_work() which also
+	 * calls isc_update_profile() under the same lock.
+	 */
+	mutex_lock(&isc->awb_mutex);
+	if (apply_gamma)
+		isc_apply_gamma(isc);
+	isc_update_profile(isc);
+	mutex_unlock(&isc->awb_mutex);
+
 	return 0;
 }
=20
@@ -1939,7 +2063,12 @@ static int isc_ctrl_init(struct isc_device *isc)
 	ctrls->hist_stat =3D HIST_INIT;
 	isc_reset_awb_ctrls(isc);
=20
-	ret =3D v4l2_ctrl_handler_init(hdl, 13);
+	/*
+	 * 30 controls maximum (SAMA7G5 with CBHS):
+	 *   contrast(1) + brightness(1) + hue+saturation(2) + gamma(1) +
+	 *   awb+do_wb(2) + 4=C3=97gain + 4=C3=97offset + 12=C3=97CC + 3=C3=97gam=
ma_LUT
+	 */
+	ret =3D v4l2_ctrl_handler_init(hdl, 30);
 	if (ret < 0)
 		return ret;
=20
@@ -1995,6 +2124,11 @@ static int isc_ctrl_init(struct isc_device *isc)
 	isc->cc_bb =3D v4l2_ctrl_new_custom(hdl, &isc_cc_bb_ctrl, NULL);
 	isc->cc_ob =3D v4l2_ctrl_new_custom(hdl, &isc_cc_ob_ctrl, NULL);
=20
+	/* Per-channel gamma LUT controls */
+	isc->gamma_b_lut_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_gamma_b_lut_ctrl=
, NULL);
+	isc->gamma_g_lut_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_gamma_g_lut_ctrl=
, NULL);
+	isc->gamma_r_lut_ctrl =3D v4l2_ctrl_new_custom(hdl, &isc_gamma_r_lut_ctrl=
, NULL);
+
 	/*
 	 * The cluster is in auto mode with autowhitebalance enabled
 	 * and manual mode otherwise.
diff --git a/drivers/media/platform/microchip/microchip-isc.h b/drivers/med=
ia/platform/microchip/microchip-isc.h
index db651c9f1387..a4f1e6c22e44 100644
--- a/drivers/media/platform/microchip/microchip-isc.h
+++ b/drivers/media/platform/microchip/microchip-isc.h
@@ -165,6 +165,17 @@ struct isc_ctrls {
 #define HIST_MAX_INDEX		1
 	u32 hist_minmax[HIST_BAYER][2];
=20
+	/*
+	 * Custom per-channel gamma LUT (10-bit output values, 64 entries).
+	 * Set via ISC_CID_GAMMA_{R,G,B}_LUT controls.  When gamma_lut_override
+	 * is true these arrays are converted to hardware format at pipeline
+	 * start-up, overriding the preset curve from gamma_index.
+	 */
+	u32 gamma_lut_r[GAMMA_ENTRIES];
+	u32 gamma_lut_g[GAMMA_ENTRIES];
+	u32 gamma_lut_b[GAMMA_ENTRIES];
+	bool gamma_lut_override;
+
 	/* CC matrix shadow; committed from isc_set_pipeline() and isc_awb_work()=
 */
 	s32 cc_coeff[ISC_CC_COEFF_NUM];
 	s32 cc_offset[ISC_CC_OFFSET_NUM];
@@ -363,12 +374,24 @@ struct isc_device {
 		struct v4l2_ctrl        *cc_ob;
 	};
=20
-#define GAMMA_ENTRIES	64
 	/* pointer to the defined gamma table */
 	const u32	(*gamma_table)[GAMMA_ENTRIES];
 	u32		gamma_max;
 	bool		has_cbhs;
=20
+	/*
+	 * When true the GAM block operates in bipartite piecewise-linear
+	 * interpolation mode (ISC_GAM_CTRL_BIPART set).  The LUT-to-hardware
+	 * conversion uses a Q9 per-step delta; without bipartite mode the
+	 * delta is a plain per-segment increment.
+	 */
+	bool		gamma_bipartite;
+
+	/* V4L2 ctrl handles for the per-channel gamma LUT override */
+	struct v4l2_ctrl	*gamma_b_lut_ctrl;
+	struct v4l2_ctrl	*gamma_g_lut_ctrl;
+	struct v4l2_ctrl	*gamma_r_lut_ctrl;
+
 	u32		max_width;
 	u32		max_height;
=20
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/dri=
vers/media/platform/microchip/microchip-sama7g5-isc.c
index 6705011edc2a..9110690a49e4 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -461,6 +461,7 @@ static int microchip_xisc_probe(struct platform_device =
*pdev)
 	isc->gamma_table =3D isc_sama7g5_gamma_table;
 	isc->gamma_max =3D 2;
 	isc->has_cbhs =3D true;
+	isc->gamma_bipartite =3D true;
=20
 	if (of_machine_is_compatible("microchip,sam9x7")) {
 		isc->max_width =3D ISC_SAM9X7_MAX_SUPPORT_WIDTH;
diff --git a/include/linux/atmel-isc-media.h b/include/linux/atmel-isc-medi=
a.h
index 028d34c8de81..459e96170d9e 100644
--- a/include/linux/atmel-isc-media.h
+++ b/include/linux/atmel-isc-media.h
@@ -66,6 +66,24 @@ enum atmel_isc_ctrl_id {
 	ISC_CID_CC_BG,
 	ISC_CID_CC_BB,
 	ISC_CID_CC_OB,
+
+	/*
+	 * Per-channel gamma LUT override controls.
+	 *
+	 * Each control is a 64-element U32 array.  Element i holds the
+	 * desired 10-bit output value (0-1023) for sensor input values in
+	 * the range [i*16 .. (i+1)*16 - 1].  The driver converts the
+	 * simple linear array to the hardware piecewise-linear (bipartite)
+	 * register format internally.
+	 *
+	 * Setting any of these controls activates the custom LUT for all
+	 * three channels and overrides the preset curve selected by
+	 * V4L2_CID_GAMMA.  Writing V4L2_CID_GAMMA deactivates the custom
+	 * LUT and restores the selected preset curve.
+	 */
+	ISC_CID_GAMMA_B_LUT,
+	ISC_CID_GAMMA_G_LUT,
+	ISC_CID_GAMMA_R_LUT,
 };
=20
 #endif
--=20
2.34.1


