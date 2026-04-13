Return-Path: <linux-media+bounces-58661-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBDsC93T3GmcWQkAu9opvQ
	(envelope-from <linux-media+bounces-58661-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 13:30:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AF13EB513
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 13:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E7D6301386B
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 11:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DED3C1976;
	Mon, 13 Apr 2026 11:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b="GqNGU2Nn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52216356A24
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776079773; cv=none; b=VlWhr4bNJZU5Klbd9EX+14OOScFyBcYDfGhSXTy5GYPkqk51OhOA2dBZVaiTDgGlA9g2r6z1dK7qR1VICfGON8RwFA0nbBLDrvM+n2+J21ikWkBvuOjrjvMsTKAxecSroD4frQ26bg+ZTG85n3cBgLuj1oV+6eAlVsJ1bNy85aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776079773; c=relaxed/simple;
	bh=qemG22e/5nzyJ2cRqYSbIe3s25/A62DpHW91KDudR1w=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZNlz64nmUrFe7XleJk6fTWLblOBFubaOJVoOaSUYXocOIPIKJh0wnMbgSVGmEX6wjuK/haY+eUv827iwzIjrLYbmcpKOwvh5J2uoBRxOHlAPkZ6E/Tn62tBjlLyC/ktZXHlxGl8PL1saZGEFnbQXfLs/YlzP6ySWzyakOXydkvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai; spf=pass smtp.mailfrom=innora.ai; dkim=pass (2048-bit key) header.d=innora.ai header.i=@innora.ai header.b=GqNGU2Nn; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innora.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innora.ai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innora.ai;
	s=protonmail; t=1776079759; x=1776338959;
	bh=pug3q+LylfGKBnP3R57Ns6cabPwPmjWJL6bF4IL8NpM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=GqNGU2Nnp8EWeYYeDDwp8sH4OJKkbTqzIBkrbmLF8v9l+a5t2bzKOdiDYBfOH7fpm
	 5klBE07LxbNalH/Ho5dCO6y9efF1vq4fYE6GgE9yjNg0+GLKnd+wF1MQ4+GQW3BASm
	 tveDU3/MKu3GFUeNGSIIq8Ev3V06pahtSJvs8SSPi234kDuSaHOwtyyVQHCkEcyV9s
	 jjAzWvaEwwodvUDD2GUDSrXmADvGQoG9Ej/+Nxj+EwijsN+1QbVbjDGSfhDzcT6Bjq
	 /PJyL+BAZvhWCiAzsY+wz9yNqqKXJESHVerhhhHj/g5CjtMOgZ0srOKSDTa1g2FcuO
	 DvyQruOCXOOOA==
Date: Mon, 13 Apr 2026 11:29:11 +0000
To: andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
From: Feng Ning <feng@innora.ai>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org, sakari.ailus@linux.intel.com, feng <feng@innora.ai>
Subject: [PATCH] staging: media: atomisp: use kvmalloc_objs() for overflow-safe allocations
Message-ID: <20260413112904.98864-1-feng@innora.ai>
Feedback-ID: 140578448:user:proton
X-Pm-Message-ID: 8b4568203f94433d7ac2ebf28ecafddc63689276
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[innora.ai,reject];
	R_DKIM_ALLOW(-0.20)[innora.ai:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58661-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[innora.ai:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[feng@innora.ai,linux-media@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74AF13EB513
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: feng <feng@innora.ai>

Replace open-coded width * height * sizeof() multiplications with
kvmalloc_objs() and array_size() to prevent integer overflow in buffer
allocations.

The atomisp driver computes DVS, morphing table, shading table, and
statistics buffer sizes using unchecked arithmetic.  When dimensions are
large, the product can silently wrap, causing kvmalloc() to allocate an
undersized buffer.

kvmalloc_objs() uses size_mul() internally, which saturates to SIZE_MAX
on overflow, so kvmalloc() returns NULL instead of succeeding with too
few bytes.  array_size() provides the same overflow protection for the
two-factor dimension products.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Feng Ning <feng@innora.ai>
---
 .../media/atomisp/pci/sh_css_param_dvs.c      |  18 +-
 .../staging/media/atomisp/pci/sh_css_params.c | 154 ++++++++----------
 2 files changed, 79 insertions(+), 93 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers=
/staging/media/atomisp/pci/sh_css_param_dvs.c
index 9ccdb66de..5560d8054 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -5,6 +5,8 @@
  */
=20
 #include "sh_css_param_dvs.h"
+#include <linux/overflow.h>
+#include <linux/slab.h>
 #include <assert_support.h>
 #include <type_support.h>
 #include <ia_css_err.h>
@@ -48,16 +50,16 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *f=
rame_res,
 =09=09}
=20
 =09=09/* Generate Y buffers  */
-=09=09dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
-=09=09=09=09=09=09 GFP_KERNEL);
+=09=09dvs_config->xcoords_y =3D kvmalloc_objs(*dvs_config->xcoords_y,
+=09=09=09=09=09=09       array_size(width_y, height_y));
 =09=09if (!dvs_config->xcoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * sizeof(uint3=
2_t),
-=09=09=09=09=09=09 GFP_KERNEL);
+=09=09dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoords_y,
+=09=09=09=09=09=09       array_size(width_y, height_y));
 =09=09if (!dvs_config->ycoords_y) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
@@ -67,16 +69,16 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *f=
rame_res,
 =09=09/* Generate UV buffers  */
 =09=09IA_CSS_LOG("UV W %d H %d", width_uv, height_uv);
=20
-=09=09dvs_config->xcoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
-=09=09=09=09=09=09  GFP_KERNEL);
+=09=09dvs_config->xcoords_uv =3D kvmalloc_objs(*dvs_config->xcoords_uv,
+=09=09=09=09=09=09=09array_size(width_uv, height_uv));
 =09=09if (!dvs_config->xcoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
 =09=09=09goto exit;
 =09=09}
=20
-=09=09dvs_config->ycoords_uv =3D kvmalloc(width_uv * height_uv * sizeof(ui=
nt32_t),
-=09=09=09=09=09=09  GFP_KERNEL);
+=09=09dvs_config->ycoords_uv =3D kvmalloc_objs(*dvs_config->ycoords_uv,
+=09=09=09=09=09=09=09array_size(width_uv, height_uv));
 =09=09if (!dvs_config->ycoords_uv) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09err =3D -ENOMEM;
diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/st=
aging/media/atomisp/pci/sh_css_params.c
index fcebace11..a439af085 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -5,6 +5,8 @@
  */
=20
 #include <linux/math.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
=20
 #include "gdc_device.h"=09=09/* gdc_lut_store(), ... */
 #include "isp.h"=09=09=09/* ISP_VEC_ELEMBITS */
@@ -951,8 +953,8 @@ sh_css_set_black_frame(struct ia_css_stream *stream,
 =09=09params->fpn_config.data =3D NULL;
 =09}
 =09if (!params->fpn_config.data) {
-=09=09params->fpn_config.data =3D kvmalloc(array3_size(height, width, size=
of(short)),
-=09=09=09=09=09=09   GFP_KERNEL);
+=09=09params->fpn_config.data =3D kvmalloc_objs(*params->fpn_config.data,
+=09=09=09=09=09=09=09array_size(height, width));
 =09=09if (!params->fpn_config.data) {
 =09=09=09IA_CSS_ERROR("out of memory");
 =09=09=09IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
@@ -1381,12 +1383,10 @@ struct ia_css_morph_table *ia_css_morph_table_alloc=
ate(
 =09}
=20
 =09for (i =3D 0; i < IA_CSS_MORPH_TABLE_NUM_PLANES; i++) {
-=09=09me->coordinates_x[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_x[i]),
-=09=09=09=09=09=09GFP_KERNEL);
-=09=09me->coordinates_y[i] =3D kvmalloc(height * width *
-=09=09=09=09=09=09sizeof(*me->coordinates_y[i]),
-=09=09=09=09=09=09GFP_KERNEL);
+=09=09me->coordinates_x[i] =3D kvmalloc_objs(*me->coordinates_x[i],
+=09=09=09=09=09=09      array_size(height, width));
+=09=09me->coordinates_y[i] =3D kvmalloc_objs(*me->coordinates_y[i],
+=09=09=09=09=09=09      array_size(height, width));
=20
 =09=09if ((!me->coordinates_x[i]) ||
 =09=09    (!me->coordinates_y[i])) {
@@ -4167,7 +4167,7 @@ ia_css_3a_statistics_allocate(const struct ia_css_3a_=
grid_info *grid)
=20
 =09me->grid =3D *grid;
 =09grid_size =3D grid->width * grid->height;
-=09me->data =3D kvmalloc(grid_size * sizeof(*me->data), GFP_KERNEL);
+=09me->data =3D kvmalloc_objs(*me->data, array_size(grid->width, grid->hei=
ght));
 =09if (!me->data)
 =09=09goto err;
 =09/* No weighted histogram, no structure, treat the histogram data as a b=
yte dump in a byte array */
@@ -4206,13 +4206,15 @@ ia_css_dvs_statistics_allocate(const struct ia_css_=
dvs_grid_info *grid)
 =09=09goto err;
=20
 =09me->grid =3D *grid;
-=09me->hor_proj =3D kvmalloc(grid->height * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->hor_proj), GFP_KERNEL);
+=09me->hor_proj =3D kvmalloc_objs(*me->hor_proj,
+=09=09=09=09     array_size(grid->height,
+=09=09=09=09=09=09IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->hor_proj)
 =09=09goto err;
=20
-=09me->ver_proj =3D kvmalloc(grid->width * IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09sizeof(*me->ver_proj), GFP_KERNEL);
+=09me->ver_proj =3D kvmalloc_objs(*me->ver_proj,
+=09=09=09=09     array_size(grid->width,
+=09=09=09=09=09=09IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->ver_proj)
 =09=09goto err;
=20
@@ -4245,15 +4247,15 @@ ia_css_dvs_coefficients_allocate(const struct ia_cs=
s_dvs_grid_info *grid)
=20
 =09me->grid =3D *grid;
=20
-=09me->hor_coefs =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09 sizeof(*me->hor_coefs), GFP_KERNEL);
+=09me->hor_coefs =3D kvmalloc_objs(*me->hor_coefs,
+=09=09=09=09      array_size(grid->num_hor_coefs,
+=09=09=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->hor_coefs)
 =09=09goto err;
=20
-=09me->ver_coefs =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES *
-=09=09=09=09 sizeof(*me->ver_coefs), GFP_KERNEL);
+=09me->ver_coefs =3D kvmalloc_objs(*me->ver_coefs,
+=09=09=09=09      array_size(grid->num_ver_coefs,
+=09=09=09=09=09=09 IA_CSS_DVS_NUM_COEF_TYPES));
 =09if (!me->ver_coefs)
 =09=09goto err;
=20
@@ -4286,59 +4288,51 @@ ia_css_dvs2_statistics_allocate(const struct ia_css=
_dvs_grid_info *grid)
=20
 =09me->grid =3D *grid;
=20
-=09me->hor_prod.odd_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->hor_prod.odd_real),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->hor_prod.odd_real =3D kvmalloc_objs(*me->hor_prod.odd_real,
+=09=09=09=09=09      array_size(grid->aligned_width,
+=09=09=09=09=09=09=09 grid->aligned_height));
 =09if (!me->hor_prod.odd_real)
 =09=09goto err;
=20
-=09me->hor_prod.odd_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->hor_prod.odd_imag),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->hor_prod.odd_imag =3D kvmalloc_objs(*me->hor_prod.odd_imag,
+=09=09=09=09=09      array_size(grid->aligned_width,
+=09=09=09=09=09=09=09 grid->aligned_height));
 =09if (!me->hor_prod.odd_imag)
 =09=09goto err;
=20
-=09me->hor_prod.even_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->hor_prod.even_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_prod.even_real =3D kvmalloc_objs(*me->hor_prod.even_real,
+=09=09=09=09=09       array_size(grid->aligned_width,
+=09=09=09=09=09=09=09  grid->aligned_height));
 =09if (!me->hor_prod.even_real)
 =09=09goto err;
=20
-=09me->hor_prod.even_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->hor_prod.even_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_prod.even_imag =3D kvmalloc_objs(*me->hor_prod.even_imag,
+=09=09=09=09=09       array_size(grid->aligned_width,
+=09=09=09=09=09=09=09  grid->aligned_height));
 =09if (!me->hor_prod.even_imag)
 =09=09goto err;
=20
-=09me->ver_prod.odd_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->ver_prod.odd_real),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->ver_prod.odd_real =3D kvmalloc_objs(*me->ver_prod.odd_real,
+=09=09=09=09=09      array_size(grid->aligned_width,
+=09=09=09=09=09=09=09 grid->aligned_height));
 =09if (!me->ver_prod.odd_real)
 =09=09goto err;
=20
-=09me->ver_prod.odd_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09 grid->aligned_height *
-=09=09=09=09=09 sizeof(*me->ver_prod.odd_imag),
-=09=09=09=09=09 GFP_KERNEL);
+=09me->ver_prod.odd_imag =3D kvmalloc_objs(*me->ver_prod.odd_imag,
+=09=09=09=09=09      array_size(grid->aligned_width,
+=09=09=09=09=09=09=09 grid->aligned_height));
 =09if (!me->ver_prod.odd_imag)
 =09=09goto err;
=20
-=09me->ver_prod.even_real =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->ver_prod.even_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_prod.even_real =3D kvmalloc_objs(*me->ver_prod.even_real,
+=09=09=09=09=09       array_size(grid->aligned_width,
+=09=09=09=09=09=09=09  grid->aligned_height));
 =09if (!me->ver_prod.even_real)
 =09=09goto err;
=20
-=09me->ver_prod.even_imag =3D kvmalloc(grid->aligned_width *
-=09=09=09=09=09  grid->aligned_height *
-=09=09=09=09=09  sizeof(*me->ver_prod.even_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_prod.even_imag =3D kvmalloc_objs(*me->ver_prod.even_imag,
+=09=09=09=09=09       array_size(grid->aligned_width,
+=09=09=09=09=09=09=09  grid->aligned_height));
 =09if (!me->ver_prod.even_imag)
 =09=09goto err;
=20
@@ -4377,51 +4371,43 @@ ia_css_dvs2_coefficients_allocate(const struct ia_c=
ss_dvs_grid_info *grid)
=20
 =09me->grid =3D *grid;
=20
-=09me->hor_coefs.odd_real =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09=09  sizeof(*me->hor_coefs.odd_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_coefs.odd_real =3D kvmalloc_objs(*me->hor_coefs.odd_real,
+=09=09=09=09=09       grid->num_hor_coefs);
 =09if (!me->hor_coefs.odd_real)
 =09=09goto err;
=20
-=09me->hor_coefs.odd_imag =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09=09  sizeof(*me->hor_coefs.odd_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->hor_coefs.odd_imag =3D kvmalloc_objs(*me->hor_coefs.odd_imag,
+=09=09=09=09=09       grid->num_hor_coefs);
 =09if (!me->hor_coefs.odd_imag)
 =09=09goto err;
=20
-=09me->hor_coefs.even_real =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09=09   sizeof(*me->hor_coefs.even_real),
-=09=09=09=09=09   GFP_KERNEL);
+=09me->hor_coefs.even_real =3D kvmalloc_objs(*me->hor_coefs.even_real,
+=09=09=09=09=09=09grid->num_hor_coefs);
 =09if (!me->hor_coefs.even_real)
 =09=09goto err;
=20
-=09me->hor_coefs.even_imag =3D kvmalloc(grid->num_hor_coefs *
-=09=09=09=09=09   sizeof(*me->hor_coefs.even_imag),
-=09=09=09=09=09   GFP_KERNEL);
+=09me->hor_coefs.even_imag =3D kvmalloc_objs(*me->hor_coefs.even_imag,
+=09=09=09=09=09=09grid->num_hor_coefs);
 =09if (!me->hor_coefs.even_imag)
 =09=09goto err;
=20
-=09me->ver_coefs.odd_real =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09=09  sizeof(*me->ver_coefs.odd_real),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_coefs.odd_real =3D kvmalloc_objs(*me->ver_coefs.odd_real,
+=09=09=09=09=09       grid->num_ver_coefs);
 =09if (!me->ver_coefs.odd_real)
 =09=09goto err;
=20
-=09me->ver_coefs.odd_imag =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09=09  sizeof(*me->ver_coefs.odd_imag),
-=09=09=09=09=09  GFP_KERNEL);
+=09me->ver_coefs.odd_imag =3D kvmalloc_objs(*me->ver_coefs.odd_imag,
+=09=09=09=09=09       grid->num_ver_coefs);
 =09if (!me->ver_coefs.odd_imag)
 =09=09goto err;
=20
-=09me->ver_coefs.even_real =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09=09   sizeof(*me->ver_coefs.even_real),
-=09=09=09=09=09   GFP_KERNEL);
+=09me->ver_coefs.even_real =3D kvmalloc_objs(*me->ver_coefs.even_real,
+=09=09=09=09=09=09grid->num_ver_coefs);
 =09if (!me->ver_coefs.even_real)
 =09=09goto err;
=20
-=09me->ver_coefs.even_imag =3D kvmalloc(grid->num_ver_coefs *
-=09=09=09=09=09   sizeof(*me->ver_coefs.even_imag),
-=09=09=09=09=09   GFP_KERNEL);
+=09me->ver_coefs.even_imag =3D kvmalloc_objs(*me->ver_coefs.even_imag,
+=09=09=09=09=09=09grid->num_ver_coefs);
 =09if (!me->ver_coefs.even_imag)
 =09=09goto err;
=20
@@ -4478,25 +4464,23 @@ ia_css_dvs2_6axis_config_allocate(const struct ia_c=
ss_stream *stream)
 =09=09=09=09    params->pipe_dvs_6axis_config[IA_CSS_PIPE_ID_VIDEO]->heigh=
t_uv;
 =09IA_CSS_LOG("table Y: W %d H %d", width_y, height_y);
 =09IA_CSS_LOG("table UV: W %d H %d", width_uv, height_uv);
-=09dvs_config->xcoords_y =3D kvmalloc(width_y * height_y * sizeof(uint32_t=
),
-=09=09=09=09=09 GFP_KERNEL);
+=09dvs_config->xcoords_y =3D kvmalloc_objs(*dvs_config->xcoords_y,
+=09=09=09=09=09       array_size(width_y, height_y));
 =09if (!dvs_config->xcoords_y)
 =09=09goto err;
=20
-=09dvs_config->ycoords_y =3D kvmalloc(width_y * height_y * sizeof(uint32_t=
),
-=09=09=09=09=09 GFP_KERNEL);
+=09dvs_config->ycoords_y =3D kvmalloc_objs(*dvs_config->ycoords_y,
+=09=09=09=09=09       array_size(width_y, height_y));
 =09if (!dvs_config->ycoords_y)
 =09=09goto err;
=20
-=09dvs_config->xcoords_uv =3D kvmalloc(width_uv * height_uv *
-=09=09=09=09=09  sizeof(uint32_t),
-=09=09=09=09=09  GFP_KERNEL);
+=09dvs_config->xcoords_uv =3D kvmalloc_objs(*dvs_config->xcoords_uv,
+=09=09=09=09=09=09array_size(width_uv, height_uv));
 =09if (!dvs_config->xcoords_uv)
 =09=09goto err;
=20
-=09dvs_config->ycoords_uv =3D kvmalloc(width_uv * height_uv *
-=09=09=09=09=09  sizeof(uint32_t),
-=09=09=09=09=09  GFP_KERNEL);
+=09dvs_config->ycoords_uv =3D kvmalloc_objs(*dvs_config->ycoords_uv,
+=09=09=09=09=09=09array_size(width_uv, height_uv));
 =09if (!dvs_config->ycoords_uv)
 =09=09goto err;
=20
--=20
2.49.0



