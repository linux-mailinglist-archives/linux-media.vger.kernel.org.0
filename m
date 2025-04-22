Return-Path: <linux-media+bounces-30740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5DA977AE
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 22:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99DDF3A79B6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 20:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219092D3218;
	Tue, 22 Apr 2025 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="M13exiKI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D522D798
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 20:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354048; cv=none; b=jI7adSSHZbZvm2Btl1ddTZtQfDwXcC2dh/x76mhTcZZRmnp9lQO0VnVC5PRAZHjJUFm9iPdoWH5fIwIACZDK0WXxAhB6i6GIoMXrqOggArYReISoU/NZzgWD7lG7QCTzlXOsVwKsTFo8HSv9FeY9sXIAQ2/skcv1FDoZQYatSXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354048; c=relaxed/simple;
	bh=8GonxkaMRQkF8ZVGlT10aVldkELS5ROTeTzHlgFE+Tc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rm+Us3GfK2o6BIF49DrCal3bnU4UqwNH7oSxZyBShh7Dv/SjZmopyof4jZjg4nZ14mRhaUzHOI1oX50m+ChPH6x0aG9tf7kA0TNshfF+lnTbA1yyu7kAyVYXdI5xyUhOX4uefa4heEis7dG75HzBE5m2nRMTILVeQLX1fRY7vQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=M13exiKI; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so65605916d6.0
        for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 13:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1745354042; x=1745958842; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QB/EZxvi3t87PK18i4g1vhWVTtw3rMf9PNCebJ3iyMk=;
        b=M13exiKIL43nYOBplwN/187+LQ4EExYDdDjJ852ok8R3qQo5FYSjYtgL8RQPUMYDSr
         O+waiqJ+f6UHqhi6FMqxM/oWhf3JXGgpizVlnJOuPo92iw/mVYkV9ggb0W1D1mcTkVI+
         eOgNp3PnNrEPyTfbE05+cK2xeeC8MDHW1zMLGlKQJkGxcbF4N1dMy+I1ythbBLUNZNR9
         y44zQy9qQuSCoTKPYN+tX1abf8u+2ueaCFqDuLCyGuKFwwX8LyrVzcA+cd+SypBi+XTE
         vNjoDm0rN+i6+xO4xsFJy0Xxu4rFQjB7tAx69P0yhgg5eIH+Hc/gLubuSzR+ejbz+/r8
         j2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354042; x=1745958842;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QB/EZxvi3t87PK18i4g1vhWVTtw3rMf9PNCebJ3iyMk=;
        b=ZvoKYzxUp77W6wtms/kHK7MqbXBvkQYQ9o+B++NgLY/+l+x4XpWjz9Qh7/Sb27xCP+
         U43btxC4fT1GcBWK4lhIxJF+UaRUN3ScQnisEiYIsE781omAnFI642MobKLhZtMwmyZv
         Qg+WVgUI6z96LcqRrAlWOEsbVuqSfS8dPjTnSPV6ZLxTWq2p0NMu9H2zwoC6JUmVvu/v
         MWqqkJ18HFLfGuM3OlfODxgRF7Q2JwFg27OpqXQD64xMHecK7QWpyhdKkh7HXn9Si7tK
         nChc9tbkypoNMJ6robuC3pW7/Dk8PgLuyPEOjES7jbgTAjv3h570lftoNqadi0PFNLov
         rYMg==
X-Forwarded-Encrypted: i=1; AJvYcCVhQjDx9nijbeX7lVkjHy1mI9x6cPhyua2aeGRL8JhQivA2996WwDn3cJtNJBVHMiWiOImF7XRCCjEDdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw89FP2QFRLL2MIdli6fceDFxqGu7RGsnsyNE7YRuSu0izA4H0q
	EgFwBRhGCb/d0NV/VrucCKFYyXmGcSqdgx2T5r/n8jXSK2OYnSHyVSbxSAXVXZg=
X-Gm-Gg: ASbGncsQ7/khiOAoIjL20jPZQjy+vo3r/pE3o9MRFrhxeosruST1jYJtoBlqSf6rOom
	w3BwJSDG7aL/B5kbjwvUEQ98D5P4jS2ouXKze4iArLP7Xpcjz3h5IyIQxMGGpBukwQalmHO7KaF
	xj3gHl4amphsMfTAXTkdPNsBOMXpoiICdKEHNZSPZ+jPs8P5OcdvxMJbg8Meh1YOruXw+WNbPxp
	19VbeEWfBaCNxnkQMq2xz7kObn2z9zj94X/14NE6Rhg2WmTL2/NlS2wSJ454nRmN9u8zHBWdu4N
	yrpSXFBCw6ASRlTig7tABjVy1H0Q/72MpbWc2EEl4va7Qw==
X-Google-Smtp-Source: AGHT+IF2NY8NWZhRDDTGP3IWCtm2obgw3XdCPc+7lNS25z2oTNzCLuKcPU7yqB4NlMxM4ZoFISN2xw==
X-Received: by 2002:a05:6214:5085:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6f2c4562ff4mr302755556d6.21.1745354041933;
        Tue, 22 Apr 2025 13:34:01 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2bfcfc5sm61803746d6.75.2025.04.22.13.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:34:01 -0700 (PDT)
Message-ID: <7864deb3dc090bc52cbdb4c646d0155ecc256076.camel@ndufresne.ca>
Subject: Re: [PATCH v5] media: amphion: Support dmabuf and v4l2 buffer
 without binding
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Ming Qian <ming.qian@oss.nxp.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, 	eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Tue, 22 Apr 2025 16:34:00 -0400
In-Reply-To: <20250120082105.2960717-1-ming.qian@oss.nxp.com>
References: <20250120082105.2960717-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 20 janvier 2025 =C3=A0 17:21 +0900, Ming Qian a =C3=A9crit=C2=A0:
> When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
> may not one-to-one, a single dma-buf may be queued via different
> v4l2 buffers, and different dma-bufs may be queued via the same
> v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
> as the frame store id.
>=20
> We can generate a frame store id according to the dma address.
> Then for a given dma-buf, the id is fixed.
>=20
> Driver now manages the frame store and vb2-buffer states independently.
>=20
> When a dmabuf is queued via another v4l2 buffer before the buffer is
> released by firmware, need to pend it until firmware release it.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
> v5
> - Avoid dynamic size calculation in memory allocation, use kmalloc_array
> =C2=A0 instead
> v4
> - remove unnecessary 'out of memory' message
> v3
> -- fix a typo in NULL pointer check
> v2
> -- fix an uninitialized issue reported by media-ci
>=20
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 235=
 +++++++++++++++++-----
> =C2=A0drivers/media/platform/amphion/vpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 7 +-
> =C2=A0drivers/media/platform/amphion/vpu_dbg.c=C2=A0 |=C2=A0 15 +-
> =C2=A0drivers/media/platform/amphion/vpu_v4l2.c |=C2=A0 11 +
> =C2=A04 files changed, 220 insertions(+), 48 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index b3bc9eb16d6a..f4979d537b97 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -26,6 +26,7 @@
> =C2=A0#include "vpu_cmds.h"
> =C2=A0#include "vpu_rpc.h"
> =C2=A0
> +#define VDEC_SLOT_CNT_DFT		32
> =C2=A0#define VDEC_MIN_BUFFER_CAP		8
> =C2=A0#define VDEC_MIN_BUFFER_OUT		8
> =C2=A0
> @@ -41,6 +42,14 @@ struct vdec_fs_info {
> =C2=A0	u32 tag;
> =C2=A0};
> =C2=A0
> +struct vdec_frame_store_t {
> +	struct vpu_vb2_buffer *curr;
> +	struct vpu_vb2_buffer *pend;
> +	dma_addr_t addr;
> +	unsigned int state;
> +	u32 tag;
> +};
> +
> =C2=A0struct vdec_t {
> =C2=A0	u32 seq_hdr_found;
> =C2=A0	struct vpu_buffer udata;
> @@ -48,7 +57,8 @@ struct vdec_t {
> =C2=A0	struct vpu_dec_codec_info codec_info;
> =C2=A0	enum vpu_codec_state state;
> =C2=A0
> -	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
> +	struct vdec_frame_store_t *slots;
> +	u32 slot_count;
> =C2=A0	u32 req_frame_count;
> =C2=A0	struct vdec_fs_info mbi;
> =C2=A0	struct vdec_fs_info dcp;
> @@ -289,6 +299,63 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_bu=
ffer *vb)
> +{
> +	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_vb2_buffer *vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	struct vdec_t *vdec =3D inst->priv;
> +	struct vdec_frame_store_t *new_slots =3D NULL;
> +	dma_addr_t addr;
> +	int i;
> +
> +	addr =3D vpu_get_vb_phy_addr(vb, 0);
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (addr =3D=3D vdec->slots[i].addr) {
> +			if (vdec->slots[i].curr && vdec->slots[i].curr !=3D vpu_buf) {
> +				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
> +				vdec->slots[i].pend =3D vpu_buf;
> +			} else {
> +				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
> +			}
> +			vpu_buf->fs_id =3D i;
> +			return;
> +		}
> +	}
> +
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].addr) {
> +			vdec->slots[i].addr =3D addr;
> +			vpu_buf->fs_id =3D i;
> +			return;
> +		}
> +	}
> +
> +	new_slots =3D krealloc_array(vdec->slots, vdec->slot_count * 2,
> +				=C2=A0=C2=A0 sizeof(*vdec->slots),
> +				=C2=A0=C2=A0 GFP_KERNEL | __GFP_ZERO);
> +	if (!new_slots) {
> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
> +		return;
> +	}
> +
> +	vdec->slots =3D new_slots;
> +	vdec->slot_count *=3D 2;
> +
> +	vdec->slots[i].addr =3D addr;
> +	vpu_buf->fs_id =3D i;
> +}
> +
> +static void vdec_reset_frame_store(struct vpu_inst *inst)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
> +
> +	if (!vdec->slots || !vdec->slot_count)
> +		return;
> +
> +	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
> +	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
> +}
> +
> =C2=A0static void vdec_handle_resolution_change(struct vpu_inst *inst)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> @@ -750,11 +817,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst=
, void *arg)
> =C2=A0	struct vb2_v4l2_buffer *src_buf;
> =C2=A0	int ret =3D 0;
> =C2=A0
> -	if (!info || info->id >=3D ARRAY_SIZE(vdec->slots))
> +	if (!info || info->id >=3D vdec->slot_count)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	vpu_inst_lock(inst);
> -	vpu_buf =3D vdec->slots[info->id];
> +	vpu_buf =3D vdec->slots[info->id].curr;
> =C2=A0	if (!vpu_buf) {
> =C2=A0		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, =
info->id);
> =C2=A0		ret =3D -EINVAL;
> @@ -775,11 +842,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst=
, void *arg)
> =C2=A0	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_DECODED)
> =C2=A0		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, =
info->id);
> =C2=A0	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
> +	vdec->slots[info->id].state =3D VPU_BUF_STATE_DECODED;
> =C2=A0	vdec->decoded_frame_count++;
> =C2=A0	if (vdec->params.display_delay_enable) {
> =C2=A0		struct vpu_format *cur_fmt;
> =C2=A0
> =C2=A0		cur_fmt =3D vpu_get_format(inst, inst->cap_format.type);
> +		vdec->slots[info->id].state =3D VPU_BUF_STATE_READY;
> =C2=A0		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
> =C2=A0		for (int i =3D 0; i < vbuf->vb2_buf.num_planes; i++)
> =C2=A0			vb2_set_plane_payload(&vbuf->vb2_buf,
> @@ -802,11 +871,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(stru=
ct vpu_inst *inst, u32 luma)
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0	int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(vdec->slots); i++) {
> -		if (!vdec->slots[i])
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].curr)
> =C2=A0			continue;
> -		if (luma =3D=3D vdec->slots[i]->luma)
> -			return vdec->slots[i];
> +		if (luma =3D=3D vdec->slots[i].addr)
> +			return vdec->slots[i].curr;
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> @@ -840,11 +909,11 @@ static void vdec_buf_done(struct vpu_inst *inst, st=
ruct vpu_frame_info *frame)
> =C2=A0
> =C2=A0	cur_fmt =3D vpu_get_format(inst, inst->cap_format.type);
> =C2=A0	vbuf =3D &vpu_buf->m2m_buf.vb;
> -	if (vbuf->vb2_buf.index !=3D frame->id)
> -		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
> -			inst->id, vbuf->vb2_buf.index, frame->id);
> +	if (vpu_buf->fs_id !=3D frame->id)
> +		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);

Was not newly introduced, so I'll take anyway, but can you send a patch
later to fix dismatch -> mismatch.

> =C2=A0
> -	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_READY && vdec->para=
ms.display_delay_enable)
> +	if (vdec->params.display_delay_enable)
> =C2=A0		return;
> =C2=A0
> =C2=A0	if (vpu_get_buffer_state(vbuf) !=3D VPU_BUF_STATE_DECODED)
> @@ -857,10 +926,11 @@ static void vdec_buf_done(struct vpu_inst *inst, st=
ruct vpu_frame_info *frame)
> =C2=A0	vbuf->sequence =3D vdec->sequence;
> =C2=A0	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_=
buf.timestamp);
> =C2=A0
> -	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> =C2=A0	vpu_inst_lock(inst);
> +	vdec->slots[vpu_buf->fs_id].state =3D VPU_BUF_STATE_READY;
> =C2=A0	vdec->display_frame_count++;
> =C2=A0	vpu_inst_unlock(inst);
> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
> =C2=A0	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d=
\n",
> =C2=A0		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, v=
dec->sequence);
> =C2=A0}
> @@ -1103,18 +1173,30 @@ static int vdec_response_frame(struct vpu_inst *i=
nst, struct vb2_v4l2_buffer *vb
> =C2=A0	if (!vbuf)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	if (vdec->slots[vbuf->vb2_buf.index]) {
> -		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
> -			inst->id, vbuf->vb2_buf.index);
> +	vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >=3D vdec->slot_count) {
> +		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
> +			vpu_buf->fs_id, vbuf->vb2_buf.index);
> =C2=A0		return -EINVAL;
> =C2=A0	}
> =C2=A0
> +	if (vdec->slots[vpu_buf->fs_id].curr) {
> +		if (vdec->slots[vpu_buf->fs_id].curr !=3D vpu_buf) {
> +			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
> +			vdec->slots[vpu_buf->fs_id].pend =3D vpu_buf;
> +		} else {
> +			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
> +		}
> +		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
> +		return -EAGAIN;
> +	}
> +
> =C2=A0	dev_dbg(inst->dev, "[%d] state =3D %s, alloc fs %d, tag =3D 0x%x\n=
",
> =C2=A0		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index,=
 vdec->seq_tag);
> -	vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> =C2=A0
> =C2=A0	memset(&info, 0, sizeof(info));
> -	info.id =3D vbuf->vb2_buf.index;
> +	info.id =3D vpu_buf->fs_id;
> =C2=A0	info.type =3D MEM_RES_FRAME;
> =C2=A0	info.tag =3D vdec->seq_tag;
> =C2=A0	info.luma_addr =3D vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
> @@ -1129,12 +1211,13 @@ static int vdec_response_frame(struct vpu_inst *i=
nst, struct vb2_v4l2_buffer *vb
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	vpu_buf->tag =3D info.tag;
> =C2=A0	vpu_buf->luma =3D info.luma_addr;
> =C2=A0	vpu_buf->chroma_u =3D info.chroma_addr;
> =C2=A0	vpu_buf->chroma_v =3D 0;
> =C2=A0	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
> -	vdec->slots[info.id] =3D vpu_buf;
> +	vdec->slots[info.id].tag =3D info.tag;
> +	vdec->slots[info.id].curr =3D vpu_buf;
> +	vdec->slots[info.id].state =3D VPU_BUF_STATE_INUSE;
> =C2=A0	vdec->req_frame_count--;
> =C2=A0
> =C2=A0	return 0;
> @@ -1195,25 +1278,47 @@ static void vdec_recycle_buffer(struct vpu_inst *=
inst, struct vb2_v4l2_buffer *v
> =C2=A0	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
> =C2=A0}
> =C2=A0
> -static void vdec_clear_slots(struct vpu_inst *inst)
> +static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> =C2=A0	struct vpu_vb2_buffer *vpu_buf;
> =C2=A0	struct vb2_v4l2_buffer *vbuf;
> +
> +	if (id >=3D vdec->slot_count)
> +		return;
> +	if (!vdec->slots[id].curr)
> +		return;
> +
> +	vpu_buf =3D vdec->slots[id].curr;
> +	vbuf =3D &vpu_buf->m2m_buf.vb;
> +
> +	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
> +	if (vpu_buf->fs_id =3D=3D id) {
> +		if (vpu_buf->state !=3D VPU_BUF_STATE_READY)
> +			vdec_recycle_buffer(inst, vbuf);
> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +	}
> +
> +	vdec->slots[id].curr =3D NULL;
> +	vdec->slots[id].state =3D VPU_BUF_STATE_IDLE;
> +
> +	if (vdec->slots[id].pend) {
> +		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_=
IDLE);
> +		vdec->slots[id].pend =3D NULL;
> +	}
> +}
> +
> +static void vdec_clear_slots(struct vpu_inst *inst)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
> =C2=A0	int i;
> =C2=A0
> -	for (i =3D 0; i < ARRAY_SIZE(vdec->slots); i++) {
> -		if (!vdec->slots[i])
> +	for (i =3D 0; i < vdec->slot_count; i++) {
> +		if (!vdec->slots[i].curr)
> =C2=A0			continue;
> =C2=A0
> -		vpu_buf =3D vdec->slots[i];
> -		vbuf =3D &vpu_buf->m2m_buf.vb;
> -
> =C2=A0		vpu_trace(inst->dev, "clear slot %d\n", i);
> -		vdec_response_fs_release(inst, i, vpu_buf->tag);
> -		vdec_recycle_buffer(inst, vbuf);
> -		vdec->slots[i]->state =3D VPU_BUF_STATE_IDLE;
> -		vdec->slots[i] =3D NULL;
> +		vdec_release_curr_frame_store(inst, i);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1354,39 +1459,29 @@ static void vdec_event_req_fs(struct vpu_inst *in=
st, struct vpu_fs_info *fs)
> =C2=A0static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_=
info *fs)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> -	struct vpu_vb2_buffer *vpu_buf;
> -	struct vb2_v4l2_buffer *vbuf;
> =C2=A0
> -	if (!fs || fs->id >=3D ARRAY_SIZE(vdec->slots))
> +	if (!fs || fs->id >=3D vdec->slot_count)
> =C2=A0		return;
> =C2=A0	if (fs->type !=3D MEM_RES_FRAME)
> =C2=A0		return;
> =C2=A0
> -	if (fs->id >=3D vpu_get_num_buffers(inst, inst->cap_format.type)) {
> +	if (fs->id >=3D vdec->slot_count) {
> =C2=A0		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, =
fs->id);
> =C2=A0		return;
> =C2=A0	}
> =C2=A0
> =C2=A0	vpu_inst_lock(inst);
> -	vpu_buf =3D vdec->slots[fs->id];
> -	vdec->slots[fs->id] =3D NULL;
> -
> -	if (!vpu_buf) {
> +	if (!vdec->slots[fs->id].curr) {
> =C2=A0		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs=
->id);
> =C2=A0		goto exit;
> =C2=A0	}
> =C2=A0
> -	vbuf =3D &vpu_buf->m2m_buf.vb;
> -	if (vpu_get_buffer_state(vbuf) =3D=3D VPU_BUF_STATE_DECODED) {
> +	if (vdec->slots[fs->id].state =3D=3D VPU_BUF_STATE_DECODED) {
> =C2=A0		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
> =C2=A0		vdec->sequence++;
> =C2=A0	}
> =C2=A0
> -	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
> -	if (vpu_get_buffer_state(vbuf) !=3D VPU_BUF_STATE_READY)
> -		vdec_recycle_buffer(inst, vbuf);
> -
> -	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +	vdec_release_curr_frame_store(inst, fs->id);
> =C2=A0	vpu_process_capture_buffer(inst);
> =C2=A0
> =C2=A0exit:
> @@ -1582,6 +1677,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
> =C2=A0		return;
> =C2=A0
> =C2=A0	vdec =3D inst->priv;
> +	if (vdec) {
> +		kfree(vdec->slots);
> +		vdec->slots =3D NULL;
> +		vdec->slot_count =3D 0;
> +	}
> =C2=A0	vfree(vdec);
> =C2=A0	inst->priv =3D NULL;
> =C2=A0	vfree(inst);
> @@ -1713,11 +1813,43 @@ static int vdec_stop_session(struct vpu_inst *ins=
t, u32 type)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 siz=
e, u32 i)
> +static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u3=
2 size, u32 i)
> =C2=A0{
> =C2=A0	struct vdec_t *vdec =3D inst->priv;
> +	struct vpu_vb2_buffer *vpu_buf;
> =C2=A0	int num =3D -1;
> =C2=A0
> +	vpu_inst_lock(inst);
> +	if (i >=3D vdec->slot_count || !vdec->slots[i].addr)
> +		goto exit;
> +
> +	vpu_buf =3D vdec->slots[i].curr;
> +
> +	num =3D scnprintf(str, size, "slot[%2d] :", i);
> +	if (vpu_buf) {
> +		num +=3D scnprintf(str + num, size - num, " %2d",
> +				 vpu_buf->m2m_buf.vb.vb2_buf.index);
> +		num +=3D scnprintf(str + num, size - num, "; state =3D %d", vdec->slot=
s[i].state);
> +	} else {
> +		num +=3D scnprintf(str + num, size - num, " -1");
> +	}
> +
> +	if (vdec->slots[i].pend)
> +		num +=3D scnprintf(str + num, size - num, "; %d",
> +				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
> +
> +	num +=3D scnprintf(str + num, size - num, "\n");
> +exit:
> +	vpu_inst_unlock(inst);
> +
> +	return num;
> +}
> +
> +static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 siz=
e, u32 i)
> +{
> +	struct vdec_t *vdec =3D inst->priv;
> +	int num;
> +
> =C2=A0	switch (i) {
> =C2=A0	case 0:
> =C2=A0		num =3D scnprintf(str, size,
> @@ -1771,6 +1903,7 @@ static int vdec_get_debug_info(struct vpu_inst *ins=
t, char *str, u32 size, u32 i
> =C2=A0				vdec->codec_info.vui_present);
> =C2=A0		break;
> =C2=A0	default:
> +		num =3D vdec_get_slot_debug_info(inst, str, size, i - 10);
> =C2=A0		break;
> =C2=A0	}
> =C2=A0
> @@ -1794,6 +1927,8 @@ static struct vpu_inst_ops vdec_inst_ops =3D {
> =C2=A0	.get_debug_info =3D vdec_get_debug_info,
> =C2=A0	.wait_prepare =3D vpu_inst_unlock,
> =C2=A0	.wait_finish =3D vpu_inst_lock,
> +	.attach_frame_store =3D vdec_attach_frame_store,
> +	.reset_frame_store =3D vdec_reset_frame_store,
> =C2=A0};
> =C2=A0
> =C2=A0static void vdec_init(struct file *file)
> @@ -1834,6 +1969,16 @@ static int vdec_open(struct file *file)
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> +	vdec->slots =3D kmalloc_array(VDEC_SLOT_CNT_DFT,
> +				=C2=A0=C2=A0=C2=A0 sizeof(*vdec->slots),
> +				=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ZERO);
> +	if (!vdec->slots) {
> +		vfree(vdec);
> +		vfree(inst);
> +		return -ENOMEM;
> +	}
> +	vdec->slot_count =3D VDEC_SLOT_CNT_DFT;
> +
> =C2=A0	inst->ops =3D &vdec_inst_ops;
> =C2=A0	inst->formats =3D vdec_formats;
> =C2=A0	inst->type =3D VPU_CORE_TYPE_DEC;
> diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platfor=
m/amphion/vpu.h
> index 978971712742..d8100da160d1 100644
> --- a/drivers/media/platform/amphion/vpu.h
> +++ b/drivers/media/platform/amphion/vpu.h
> @@ -223,6 +223,8 @@ struct vpu_inst_ops {
> =C2=A0	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, =
u32 i);
> =C2=A0	void (*wait_prepare)(struct vpu_inst *inst);
> =C2=A0	void (*wait_finish)(struct vpu_inst *inst);
> +	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb=
);
> +	void (*reset_frame_store)(struct vpu_inst *inst);
> =C2=A0};
> =C2=A0
> =C2=A0struct vpu_inst {
> @@ -297,7 +299,8 @@ enum {
> =C2=A0	VPU_BUF_STATE_DECODED,
> =C2=A0	VPU_BUF_STATE_READY,
> =C2=A0	VPU_BUF_STATE_SKIP,
> -	VPU_BUF_STATE_ERROR
> +	VPU_BUF_STATE_ERROR,
> +	VPU_BUF_STATE_CHANGED
> =C2=A0};
> =C2=A0
> =C2=A0struct vpu_vb2_buffer {
> @@ -306,8 +309,8 @@ struct vpu_vb2_buffer {
> =C2=A0	dma_addr_t chroma_u;
> =C2=A0	dma_addr_t chroma_v;
> =C2=A0	unsigned int state;
> -	u32 tag;
> =C2=A0	u32 average_qp;
> +	s32 fs_id;
> =C2=A0};
> =C2=A0
> =C2=A0void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/pla=
tform/amphion/vpu_dbg.c
> index 940e5bda5fa3..497ae4e8a229 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -48,6 +48,7 @@ static char *vpu_stat_name[] =3D {
> =C2=A0	[VPU_BUF_STATE_READY] =3D "ready",
> =C2=A0	[VPU_BUF_STATE_SKIP] =3D "skip",
> =C2=A0	[VPU_BUF_STATE_ERROR] =3D "error",
> +	[VPU_BUF_STATE_CHANGED] =3D "changed",
> =C2=A0};
> =C2=A0
> =C2=A0static inline const char *to_vpu_stat_name(int state)
> @@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void =
*data)
> =C2=A0	for (i =3D 0; i < vb2_get_num_buffers(vq); i++) {
> =C2=A0		struct vb2_buffer *vb;
> =C2=A0		struct vb2_v4l2_buffer *vbuf;
> +		struct vpu_vb2_buffer *vpu_buf;
> =C2=A0
> =C2=A0		vb =3D vb2_get_buffer(vq, i);
> =C2=A0		if (!vb)
> @@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, voi=
d *data)
> =C2=A0			continue;
> =C2=A0
> =C2=A0		vbuf =3D to_vb2_v4l2_buffer(vb);
> +		vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> =C2=A0
> =C2=A0		num =3D scnprintf(str, sizeof(str),
> -				"capture[%2d] state =3D %10s, %8s\n",
> +				"capture[%2d] state =3D %10s, %8s",
> =C2=A0				i, vb2_stat_name[vb->state],
> =C2=A0				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
> =C2=A0		if (seq_write(s, str, num))
> =C2=A0			return 0;
> +
> +		if (vpu_buf->fs_id >=3D 0) {
> +			num =3D scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
> +			if (seq_write(s, str, num))
> +				return 0;
> +		}
> +
> +		num =3D scnprintf(str, sizeof(str), "\n");
> +		if (seq_write(s, str, num))
> +			return 0;
> =C2=A0	}
> =C2=A0
> =C2=A0	num =3D scnprintf(str, sizeof(str), "sequence =3D %d\n", inst->seq=
uence);
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/pl=
atform/amphion/vpu_v4l2.c
> index 50aeb69d2c66..37ef706c29dd 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -500,14 +500,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq=
,
> =C2=A0		call_void_vop(inst, release);
> =C2=A0	}
> =C2=A0
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> +		call_void_vop(inst, reset_frame_store);
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int vpu_vb2_buf_init(struct vb2_buffer *vb)
> =C2=A0{
> =C2=A0	struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +	struct vpu_vb2_buffer *vpu_buf =3D to_vpu_vb2_buffer(vbuf);
> +	struct vpu_inst *inst =3D vb2_get_drv_priv(vb->vb2_queue);
> =C2=A0
> +	vpu_buf->fs_id =3D -1;
> =C2=A0	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
> +
> +	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
> +		return 0;
> +
> +	call_void_vop(inst, attach_frame_store, vb);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

