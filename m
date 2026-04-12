Return-Path: <linux-media+bounces-58602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A10Kyzi2mnA6wgAu9opvQ
	(envelope-from <linux-media+bounces-58602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 02:07:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 274793E20D0
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 02:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 884CF306F90E
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 00:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4615665C;
	Sun, 12 Apr 2026 00:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="fPkuS4F/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111735975
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 00:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952325; cv=none; b=uimB6LabTRZxE2rjbTOYRpzuJ9gsRJ7VBDRsUj6k9qiE+KKSwv69tbQqTmus8EGpWoP5lM+jWlV5P6K2BeM7L7kiZCluvB57u8nzFbVhkvSETI5rit25btxNF73avOjHHpXybYuzIAZ1+JJxwoyy3vKOaiRISqQ9OhkZx3owXBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952325; c=relaxed/simple;
	bh=LazlgEFApWLbqT8UgU48BfYLjdIYeSL4TARmkYmNVTM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r9qaUQSnGHV0f0EjyAvX/ZapxFJQjR/FECGd9QuJvclqqJ1F4xjii0TmZui+hjftFI0thg7uWwniaIT+30Uq9zgLZXnFkbZEHZwGQDnH7nhKi+4RMDxYCTvfkFMRr63zN+FP2Mv4aTiMqim/hTnz2+rMqe0dqJJiXsO5zcbPIY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=fPkuS4F/; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1775952312; x=1776211512;
	bh=zqaN8UpY1i30LH4mBikR1DQFNto1ew4alVm2QMFE8jg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fPkuS4F/imo6YR8WdJVF//84/S5rSFrAmutaPRmvSIgk6bW8r5GpfxY7QG4D7Kdsc
	 0aDZAgozF/WeYkqH4gWmG3YlqoX12y6qzGjr+rH0cb2cADDDtA/JfQUgJWkvW78Xhe
	 rYFa2knwuhIc7oHkNeLuGrZQmF1CqxbDNZSHPGcgPRsK9LARq3vkZggLf+a2iirqQN
	 WJCZl+XKXJs9Jj0IhraufP4PQpo9rYyVfrTzNuZ4kq2NenzDqmAvhCcxESS/+43ce5
	 RPLE3GRJ5m16NO0DtStSLML83QGWQiml/3g83shn22YTqwtEC87jDfNzO7KLUeiIId
	 3OPxeRJ8naV7Q==
Date: Sun, 12 Apr 2026 00:05:08 +0000
To: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: andy@kernel.org, sakari.ailus@linux.intel.com, linux-media@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: media: atomisp: use array3_size() for overflow-safe allocation
Message-ID: <20260412000500.62475-1-feng@innora.ai>
In-Reply-To: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
References: <ziqbdajRR4fZ-_Ww25Td-vQI4lPfklpXD_pM87A2d1wMTKsMCgxh4hKyrZCFZSo8PXakp6_PYauSQWb3NUlsUnC-LCt6YeT_iIsD_M3GK3E=@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: db69f51280b275d17d998517f2ae2febd6f04549
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[innora.ai,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[innora.ai:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[innora.ai:+];
	TAGGED_FROM(0.00)[bounces-58602-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[feng@innora.ai,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,innora.ai:dkim,innora.ai:email,innora.ai:mid]
X-Rspamd-Queue-Id: 274793E20D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace open-coded width * height * sizeof() multiplications with
array3_size() to prevent integer overflow in buffer allocations.

The atomisp driver computes DVS, morphing table, shading table and
statistics buffer sizes using unchecked arithmetic.  When dimensions
are attacker-controlled or simply large, the product can silently wrap,
causing kvmalloc() to allocate an undersized buffer.

array3_size() saturates to SIZE_MAX on overflow, so kvmalloc() returns
NULL instead of succeeding with too few bytes.

Signed-off-by: Feng Ning <feng@innora.ai>
---
 .../media/atomisp/pci/sh_css_param_dvs.c      | 11 +++---
 .../media/atomisp/pci/sh_css_param_shading.c  |  4 ++-
 .../staging/media/atomisp/pci/sh_css_params.c | 35 +++++++++++--------
 3 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers=
/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de..6a6e9fe2e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
=20
+#include <linux/overflow.h>
 #include "sh_css_param_dvs.h"
 #include <assert_support.h>
 #include <type_support.h>
@@ -48,7 +49,7 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *fra=
me_res,
 =09=09}
=20
 =09=09/* Generate Y buffers  */
-=09=09dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
+=09=09dvs_config->xcoords_y =3D kvmalloc(array3_size(width_y, height_y, si=
zeof(uint32_t)),
 =09=09=09=09=09=09 GFP_KERNEL);
 =09=09if (!dvs_config->xcoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
@@ -56,7 +57,7 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *fra=
me_res,
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
+=09=09dvs_config->ycoords_y =3D kvmalloc(array3_size(width_y, height_y, si=
zeof(uint32_t)),
 =09=09=09=09=09=09 GFP_KERNEL);
 =09=09if (!dvs_config->ycoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
@@ -67,7 +68,8 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *fra=
me_res,
 =09=09/* Generate UV buffers  */
 =09=09IA_CSS_LOG("UV W %d H %d", width_uv, height_uv);
=20
-=09=09dvs_config->xcoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
+=09=09dvs_config->xcoords_uv =3D kvmalloc(array3_size(width_uv, height_uv,
+=09=09=09=09=09=09=09      sizeof(uint32_t)),
 =09=09=09=09=09=09  GFP_KERNEL);
 =09=09if (!dvs_config->xcoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
@@ -75,7 +77,8 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *fra=
me_res,
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
+=09=09dvs_config->ycoords_uv =3D kvmalloc(array3_size(width_uv, height_uv,
+=09=09=09=09=09=09=09      sizeof(uint32_t)),
 =09=09=09=09=09=09  GFP_KERNEL);
 =09=09if (!dvs_config->ycoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/dri=
vers/staging/media/atomisp/pci/sh_css_param_shading.c
index 9105334c7..a7584deb6 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
=20
+#include <linux/overflow.h>
 #include <linux/math.h>
 #include <linux/slab.h>
=20
@@ -339,7 +340,8 @@ ia_css_shading_table_alloc(
 =09me->fraction_bits =3D 0;
 =09for (i =3D 0; i < IA_CSS_SC_NUM_COLORS; i++) {
 =09=09me->data[i] =3D
-=09=09    kvmalloc(width * height * sizeof(*me->data[0]),
+=09=09    kvmalloc(array3_size(width, height,
+=09=09=09=09=09 sizeof(*me->data[0])),
 =09=09=09     GFP_KERNEL);
 =09=09if (!me->data[i]) {
 =09=09=09unsigned int j;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/st=
aging/media/atomisp/pci/sh_css_params.c
index fcebace11..843338888 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
=20
+#include <linux/overflow.h>
 #include <linux/math.h>
=20
 #include "gdc_device.h"=09=09/* gdc_lut_store(), ... */
@@ -1381,11 +1382,11 @@ struct ia_css_morph_table *ia_css_morph_table_alloc=
ate(
 =09}
=20
 =09for (i =3D 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
-=09=09me->coordinates_x[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_x[i]),
+=09=09me->coordinates_x[i] =3D kvmalloc(array3_size(height, width,
+=09=09=09=09=09=09=09    sizeof(*me->coordinates_x[i])),
 =09=09=09=09=09=09GFP_KERNEL);
-=09=09me->coordinates_y[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_y[i]),
+=09=09me->coordinates_y[i] =3D kvmalloc(array3_size(height, width,
+=09=09=09=09=09=09=09    sizeof(*me->coordinates_y[i])),
 =09=09=09=09=09=09GFP_KERNEL);
=20
 =09=09if ((!me->coordinates_x[i]) ||
@@ -4206,13 +4207,17 @@ ia_css_dvs_statistics_allocate(const struct ia_css_=
dvs_grid_info *grid)
 =09=09goto err;
=20
 =09me->grid =3D *grid;
-=09me->hor_proj =3D kvmalloc(grid->height * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->hor_proj), GFP_KERNEL);
+=09me->hor_proj =3D kvmalloc(array3_size(grid->height,
+=09=09=09=09=09    IA_CSS_DVS_NUM_COEF_TYPES,
+=09=09=09=09=09=09sizeof(*me->hor_proj)),
+=09=09=09=09GFP_KERNEL);
 =09if (!me->hor_proj)
 =09=09goto err;
=20
-=09me->ver_proj =3D kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->ver_proj), GFP_KERNEL);
+=09me->ver_proj =3D kvmalloc(array3_size(grid->width,
+=09=09=09=09=09    IA_CSS_DVS_NUM_COEF_TYPES,
+=09=09=09=09=09=09sizeof(*me->ver_proj)),
+=09=09=09=09GFP_KERNEL);
 =09if (!me->ver_proj)
 =09=09goto err;
=20
@@ -4478,24 +4483,26 @@ ia_css_dvs2_6axis_config_allocate(const struct ia_c=
ss_stream *stream)
 =09=09=09=09    params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO]->heigh=
t_uv;
 =09IA_CSS_LOG("table Y: W %d H %d", width_y, height_y);
 =09IA_CSS_LOG("table UV: W %d H %d", width_uv, height_uv);
-=09dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * sizeof(uint32_t=
),
+=09dvs_config->xcoords_y =3D kvmalloc(array3_size(width_y, height_y,
+=09=09=09=09=09=09     sizeof(uint32_t)),
 =09=09=09=09=09 GFP_KERNEL);
 =09if (!dvs_config->xcoords_y)
 =09=09goto err;
=20
-=09dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * sizeof(uint32_t=
),
+=09dvs_config->ycoords_y =3D kvmalloc(array3_size(width_y, height_y,
+=09=09=09=09=09=09     sizeof(uint32_t)),
 =09=09=09=09=09 GFP_KERNEL);
 =09if (!dvs_config->ycoords_y)
 =09=09goto err;
=20
-=09dvs_config->xcoords_uv =3D kvmalloc(width_uv * height_uv *
-=09=09=09=09=09  sizeof(uint32_t),
+=09dvs_config->xcoords_uv =3D kvmalloc(array3_size(width_uv, height_uv,
+=09=09=09=09=09=09      sizeof(uint32_t)),
 =09=09=09=09=09  GFP_KERNEL);
 =09if (!dvs_config->xcoords_uv)
 =09=09goto err;
=20
-=09dvs_config->ycoords_uv =3D kvmalloc(width_uv * height_uv *
-=09=09=09=09=09  sizeof(uint32_t),
+=09dvs_config->ycoords_uv =3D kvmalloc(array3_size(width_uv, height_uv,
+=09=09=09=09=09=09      sizeof(uint32_t)),
 =09=09=09=09=09  GFP_KERNEL);
 =09if (!dvs_config->ycoords_uv)
 =09=09goto err;
--=20
2.43.0



