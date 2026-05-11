Return-Path: <linux-media+bounces-61136-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GOYLgP0AWoFmwEAu9opvQ
	(envelope-from <linux-media+bounces-61136-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:21:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B255110CD
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 17:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCBD2300CBC7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 15:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726F42DB7BF;
	Mon, 11 May 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="dQ4/1/vr"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044712D6E66;
	Mon, 11 May 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778511925; cv=none; b=RUq2LKO6xPS/cdMwHHkyaUGC5+cAihm/tK6uUh2/XVJxD8gkOFuEMt1rjYtb8X0wCwtwIkq6nhE3O0e/uSjJhWIyXE+o1EocT6K5H97gMZPNBhNrFzAecnn8v+XIKygybON++0rLAEYOMzcxaxNnV6Bmh6IuZfG6pCLqTaMvSCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778511925; c=relaxed/simple;
	bh=futsZn3euYWJ0N0dPYWwlprPmzkF9ToJg8ZJxNkUv40=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WrhahOzqeIWM4Zi9aRA+tpG0h3KSTdak3MzFPLJwAyHCR1jNB82NTf/f8Ob56ODiV4cJB7RSluw9enFUxveV+PCFjnUVulAVQ4wdMTIzVtQUBnB53anb7Eyu5OS+BGPTRC8KWHcfIfMZQ+UFy432ZM4IQyexCUMnMK+60zKFNGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=dQ4/1/vr; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778511902; x=1778771102;
	bh=3DfboyVxuZK2gODaAqfQXyjlDoIw13bkPKqoPWksTcY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dQ4/1/vr0i86wPxSroJfUMv5UU7o254xRqQnOKT3WTDQJ9hDPDXYkeYrl3xBhvoE3
	 UzFsHM3XKddv42bfxjLRNqfG+5y/pYPLjCt8HJv2OhRiBoJlnU5fSLCoEMU0sTmGAw
	 lfZ01DdOO1sIXBgCKeAnDsFNVWNjy90PdeRlOk0IEGj259/DQLGn+ug79vghr509qQ
	 aYg1v3jw5WUQVvNnUlDKVbQ7PpKYAiArvHcu51R7nQus6RId2yk8tnJBopLROqPyEq
	 2q4MVyQdOynoCvbDTgPJFzE3tnQgoTxvLpkC/uuQVT7gzg80MbsV/Z9lRlxCkhda/A
	 IvZsjE+GhVnpQ==
Date: Mon, 11 May 2026 15:04:52 +0000
To: Dafna Hirschfeld <dafna@fastmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
From: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v2] media: rkisp1: Add support for CAC
Message-ID: <20260511150439.577758-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
X-Pm-Message-ID: c266f4c420a2207e0cec3190776fae3260365978
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A6B255110CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.25 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.91)[subject];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61136-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[fastmail.com,ideasonboard.com,kernel.org,sntech.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pobrn@protonmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[protonmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:email,protonmail.com:mid,protonmail.com:dkim]
X-Rspamd-Action: no action

From: Barnab=C3=A1s P=C5=91cze <barnabas.pocze@ideasonboard.com>

The CAC block implements chromatic aberration correction. Expose it to
userspace using the extensible parameters format. This was tested on the
i.MX8MP platform, but based on available documentation it is also present
in the RK3399 variant (V10). Thus presumably also in later versions,
so no feature flag is introduced.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <barnabas.pocze@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
changes in v2:
  * address review comments

v1: https://lore.kernel.org/linux-media/20260323140216.1486161-1-barnabas.p=
ocze@ideasonboard.com/
---
 .../platform/rockchip/rkisp1/rkisp1-params.c  |  68 +++++++++++
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  15 ++-
 include/uapi/linux/rkisp1-config.h            | 107 +++++++++++++++++-
 3 files changed, 187 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drive=
rs/media/platform/rockchip/rkisp1/rkisp1-params.c
index 6442436a5e42..042b759eba62 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -64,6 +64,7 @@ union rkisp1_ext_params_config {
 =09struct rkisp1_ext_params_compand_bls_config compand_bls;
 =09struct rkisp1_ext_params_compand_curve_config compand_curve;
 =09struct rkisp1_ext_params_wdr_config wdr;
+=09struct rkisp1_ext_params_cac_config cac;
 };
=20
 enum rkisp1_params_formats {
@@ -1413,6 +1414,47 @@ static void rkisp1_wdr_config(struct rkisp1_params *=
params,
 =09=09=09=09     RKISP1_CIF_ISP_WDR_TONE_CURVE_YM_MASK);
 }
=20
+static void rkisp1_cac_config(struct rkisp1_params *params,
+=09=09=09      const struct rkisp1_cif_isp_cac_config *arg)
+{
+=09u32 val;
+
+=09/*
+=09 * The enable bit is in the same register (RKISP1_CIF_ISP_CAC_CTRL),
+=09 * so only set the clipping mode, and do not modify the other bits.
+=09 */
+=09val =3D rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL);
+=09val &=3D ~(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE |
+=09=09 RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE);
+=09val |=3D FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE, arg->h_clip_mo=
de) |
+=09       FIELD_PREP(RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE, arg->v_clip_mode=
);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_CTRL, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK, arg->h_count_=
start) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK, arg->v_count_st=
art);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_COUNT_START, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_RED_MASK, arg->red[0]) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_BLUE_MASK, arg->blue[0]);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_A, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_RED_MASK, arg->red[1]) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_BLUE_MASK, arg->blue[1]);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_B, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_RED_MASK, arg->red[2]) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_BLUE_MASK, arg->blue[2]);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_C, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_NF_MASK, arg->x_nf) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_NS_MASK, arg->x_ns);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_X_NORM, val);
+
+=09val =3D FIELD_PREP(RKISP1_CIF_ISP_CAC_NF_MASK, arg->y_nf) |
+=09      FIELD_PREP(RKISP1_CIF_ISP_CAC_NS_MASK, arg->y_ns);
+=09rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_CAC_Y_NORM, val);
+}
+
 static void
 rkisp1_isp_isr_other_config(struct rkisp1_params *params,
 =09=09=09    const struct rkisp1_params_cfg *new_params)
@@ -2089,6 +2131,25 @@ static void rkisp1_ext_params_wdr(struct rkisp1_para=
ms *params,
 =09=09=09=09      RKISP1_CIF_ISP_WDR_CTRL_ENABLE);
 }
=20
+static void rkisp1_ext_params_cac(struct rkisp1_params *params,
+=09=09=09=09  const union rkisp1_ext_params_config *block)
+{
+=09const struct rkisp1_ext_params_cac_config *cac =3D &block->cac;
+
+=09if (cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
+=09=09rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+=09=09=09=09=09RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
+=09=09return;
+=09}
+
+=09rkisp1_cac_config(params, &cac->config);
+
+=09if ((cac->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
+=09    !(params->enabled_blocks & BIT(cac->header.type)))
+=09=09rkisp1_param_set_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+=09=09=09=09      RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
+}
+
 typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
 =09=09=09     const union rkisp1_ext_params_config *config);
=20
@@ -2185,6 +2246,10 @@ static const struct rkisp1_ext_params_handler {
 =09=09.handler=09=3D rkisp1_ext_params_wdr,
 =09=09.group=09=09=3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
 =09},
+=09[RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC] =3D {
+=09=09.handler=09=3D rkisp1_ext_params_cac,
+=09=09.group=09=09=3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
+=09},
 };
=20
 #define RKISP1_PARAMS_BLOCK_INFO(block, data) \
@@ -2215,6 +2280,7 @@ rkisp1_ext_params_block_types_info[] =3D {
 =09RKISP1_PARAMS_BLOCK_INFO(COMPAND_EXPAND, compand_curve),
 =09RKISP1_PARAMS_BLOCK_INFO(COMPAND_COMPRESS, compand_curve),
 =09RKISP1_PARAMS_BLOCK_INFO(WDR, wdr),
+=09RKISP1_PARAMS_BLOCK_INFO(CAC, cac),
 };
=20
 static_assert(ARRAY_SIZE(rkisp1_ext_params_handlers) =3D=3D
@@ -2474,6 +2540,8 @@ void rkisp1_params_disable(struct rkisp1_params *para=
ms)
 =09rkisp1_ie_enable(params, false);
 =09rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_DPF_MODE,
 =09=09=09=09RKISP1_CIF_ISP_DPF_MODE_EN);
+=09rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_CAC_CTRL,
+=09=09=09=09RKISP1_CIF_ISP_CAC_CTRL_ENABLE);
 }
=20
 static const struct rkisp1_params_ops rkisp1_v10_params_ops =3D {
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers=
/media/platform/rockchip/rkisp1/rkisp1-regs.h
index fbeb186cde0d..2b842194de8f 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
@@ -724,6 +724,17 @@
 #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MASK=09=09GENMASK(20, 16)
 #define RKISP1_CIF_ISP_WDR_DMIN_STRENGTH_MAX=09=0916U
=20
+/* CAC */
+#define RKISP1_CIF_ISP_CAC_CTRL_ENABLE=09=09BIT(0)
+#define RKISP1_CIF_ISP_CAC_CTRL_V_CLIP_MODE=09GENMASK(2, 1)
+#define RKISP1_CIF_ISP_CAC_CTRL_H_CLIP_MODE=09BIT(3)
+#define RKISP1_CIF_ISP_CAC_COUNT_START_H_MASK=09GENMASK(12, 0)
+#define RKISP1_CIF_ISP_CAC_COUNT_START_V_MASK=09GENMASK(28, 16)
+#define RKISP1_CIF_ISP_CAC_RED_MASK=09=09GENMASK(8, 0)
+#define RKISP1_CIF_ISP_CAC_BLUE_MASK=09=09GENMASK(24, 16)
+#define RKISP1_CIF_ISP_CAC_NF_MASK=09=09GENMASK(4, 0)
+#define RKISP1_CIF_ISP_CAC_NS_MASK=09=09GENMASK(19, 16)
+
 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
 /*                            CIF Registers                            */
 /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D */
@@ -1196,8 +1207,8 @@
 #define RKISP1_CIF_ISP_CAC_A=09=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x00000008=
)
 #define RKISP1_CIF_ISP_CAC_B=09=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x0000000c=
)
 #define RKISP1_CIF_ISP_CAC_C=09=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x00000010=
)
-#define RKISP1_CIF_ISP_X_NORM=09=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x0000001=
4)
-#define RKISP1_CIF_ISP_Y_NORM=09=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x0000001=
8)
+#define RKISP1_CIF_ISP_CAC_X_NORM=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x000000=
14)
+#define RKISP1_CIF_ISP_CAC_Y_NORM=09=09(RKISP1_CIF_ISP_CAC_BASE + 0x000000=
18)
=20
 #define RKISP1_CIF_ISP_EXP_BASE=09=09=090x00002600
 #define RKISP1_CIF_ISP_EXP_CTRL=09=09=09(RKISP1_CIF_ISP_EXP_BASE + 0x00000=
000)
diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1=
-config.h
index b2d2a71f7baf..c6ba49621726 100644
--- a/include/uapi/linux/rkisp1-config.h
+++ b/include/uapi/linux/rkisp1-config.h
@@ -967,6 +967,92 @@ struct rkisp1_cif_isp_wdr_config {
 =09__u8 use_iref;
 };
=20
+/*
+ * enum rkisp1_cif_isp_cac_h_clip_mode - horizontal clipping mode
+ *
+ * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX: +/- 4 pixels
+ * @RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX: +/- 4/5 pixels depending on baye=
r position
+ */
+enum rkisp1_cif_isp_cac_h_clip_mode {
+=09RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4PX =3D 0,
+=09RKISP1_CIF_ISP_CAC_H_CLIP_MODE_4_5PX =3D 1,
+};
+
+/**
+ * enum rkisp1_cif_isp_cac_v_clip_mode - vertical clipping mode
+ *
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX: +/- 2 pixels
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX: +/- 3 pixels
+ * @RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX: +/- 3/4 pixels depending on baye=
r position
+ */
+enum rkisp1_cif_isp_cac_v_clip_mode {
+=09RKISP1_CIF_ISP_CAC_V_CLIP_MODE_2PX =3D 0,
+=09RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3PX =3D 1,
+=09RKISP1_CIF_ISP_CAC_V_CLIP_MODE_3_4PX =3D 2,
+};
+
+/**
+ * struct rkisp1_cif_isp_cac_config - chromatic aberration correction conf=
iguration
+ *
+ * The correction is carried out by shifting the red and blue pixels relat=
ive
+ * to the green ones, depending on the distance from the optical center:
+ *
+ * @h_count_start: horizontal coordinate of the optical center (13-bit uns=
igned integer; [1,8191])
+ * @v_count_start: vertical coordinate of the optical center (13-bit unsig=
ned integer; [1,8191])
+ *
+ * For each pixel, the x/y distances from the optical center are calculate=
d and
+ * then transformed into the [0,255] range based on the following formula:
+ *
+ *   (((d << 4) >> ns) * nf) >> 5
+ *
+ * where `d` is the distance, `ns` and `nf` are the normalization paramete=
rs:
+ *
+ * @x_nf: horizontal normalization scale parameter (5-bit unsigned integer=
; [0,31])
+ * @x_ns: horizontal normalization shift parameter (4-bit unsigned integer=
; [0,15])
+ *
+ * @y_nf: vertical normalization scale parameter (5-bit unsigned integer; =
[0,31])
+ * @y_ns: vertical normalization shift parameter (4-bit unsigned integer; =
[0,15])
+ *
+ * These parameters should be chosen based on the image resolution, the po=
sition
+ * of the optical center, and the shape of pixels, so that no normalized d=
istance
+ * is larger than 255. If the pixels have square shape, the two sets of pa=
rameters
+ * should be equal.
+ *
+ * The actual amount of correction is calculated with a third degree polyn=
omial:
+ *
+ *   c[0] * r + c[1] * r^2 + c[2] * r^3
+ *
+ * where `c` is the set of coefficients for the given color, and `r` is di=
stance:
+ *
+ * @red: red coefficients (5.4 two's complement; [-16,15.9375])
+ * @blue: blue coefficients (5.4 two's complement; [-16,15.9375])
+ *
+ * Finally, the amount is clipped as requested:
+ *
+ * @h_clip_mode: maximum horizontal shift (from enum rkisp1_cif_isp_cac_h_=
clip_mode)
+ * @v_clip_mode: maximum vertical shift (from enum rkisp1_cif_isp_cac_v_cl=
ip_mode)
+ *
+ * A positive result will shift away from the optical center, while a nega=
tive
+ * one will shift towards the optical center. In the latter case, the pixe=
l
+ * values at the edges are duplicated.
+ */
+struct rkisp1_cif_isp_cac_config {
+=09__u8 h_clip_mode;
+=09__u8 v_clip_mode;
+
+=09__u16 h_count_start;
+=09__u16 v_count_start;
+
+=09__u16 red[3];
+=09__u16 blue[3];
+
+=09__u8 x_nf;
+=09__u8 x_ns;
+
+=09__u8 y_nf;
+=09__u8 y_ns;
+};
+
 /*---------- PART2: Measurement Statistics ------------*/
=20
 /**
@@ -1138,6 +1224,7 @@ struct rkisp1_stat_buffer {
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress cur=
ve
  * @RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR: Wide dynamic range
+ * @RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC: Chromatic aberration correction
  */
 enum rkisp1_ext_params_block_type {
 =09RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
@@ -1161,6 +1248,7 @@ enum rkisp1_ext_params_block_type {
 =09RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
 =09RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
 =09RKISP1_EXT_PARAMS_BLOCK_TYPE_WDR,
+=09RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC,
 };
=20
 /* For backward compatibility */
@@ -1507,6 +1595,22 @@ struct rkisp1_ext_params_wdr_config {
 =09struct rkisp1_cif_isp_wdr_config config;
 } __attribute__((aligned(8)));
=20
+/**
+ * struct rkisp1_ext_params_cac_config - RkISP1 extensible params CAC conf=
ig
+ *
+ * RkISP1 extensible parameters CAC block.
+ * Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_CAC`.
+ *
+ * @header: The RkISP1 extensible parameters header, see
+ *=09    :c:type:`rkisp1_ext_params_block_header`
+ * @config: CAC configuration, see
+ *=09    :c:type:`rkisp1_cif_isp_cac_config`
+ */
+struct rkisp1_ext_params_cac_config {
+=09struct rkisp1_ext_params_block_header header;
+=09struct rkisp1_cif_isp_cac_config config;
+} __attribute__((aligned(8)));
+
 /*
  * The rkisp1_ext_params_compand_curve_config structure is counted twice a=
s it
  * is used for both the COMPAND_EXPAND and COMPAND_COMPRESS block types.
@@ -1532,7 +1636,8 @@ struct rkisp1_ext_params_wdr_config {
 =09sizeof(struct rkisp1_ext_params_compand_bls_config)=09=09+\
 =09sizeof(struct rkisp1_ext_params_compand_curve_config)=09=09+\
 =09sizeof(struct rkisp1_ext_params_compand_curve_config)=09=09+\
-=09sizeof(struct rkisp1_ext_params_wdr_config))
+=09sizeof(struct rkisp1_ext_params_wdr_config)=09=09=09+\
+=09sizeof(struct rkisp1_ext_params_cac_config))
=20
 /**
  * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters ver=
sion
--=20
2.54.0



