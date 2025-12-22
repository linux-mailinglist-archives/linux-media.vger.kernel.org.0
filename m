Return-Path: <linux-media+bounces-49375-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 561E0CD7586
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 23:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7237230777B9
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 22:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579F5358D3A;
	Mon, 22 Dec 2025 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="TkRQdQkw"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC439358D21
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442947; cv=none; b=HXMxdmcD+GoIq2YRH8DtZidGpuhz2928bGV3+aCyXjtlz7W6qrTCgPYgn76B3ovKXYIGAckfENUyHD7XFxcqespBNj6demfTLmXRYlhDq+9vcADVdHYa09mG6SzPWY8nlWIFFL5dx5nbO6oyEbIjnnw7I6ti0XR/0RfBRb63C4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442947; c=relaxed/simple;
	bh=BaU3E96FQp8ZvYcJzZwcBLcSrEDN01XBA5UL1uriwZk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n3WVB8Hbv8HAtvWWcBr8EGo/aLGNn8n9Wr0mV+XpSeyaDKxee2t89kQlvtwKvRAG/ajCWppKqFd1O6fpYfibWCD9XD7YhzzXbi/GLGiPouujgk3vj4riexYqc/mbb9PaPExuoPTDOeotoRixSWz0iOGz8jH0LCN1olFitU04ZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=TkRQdQkw; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ba4197fbd4so469313785a.2
        for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1766442943; x=1767047743; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+lFPnrdd01B2/HIPkqWvR4vYa+WKSBFffN+plTj2/us=;
        b=TkRQdQkwK0PzRRf5b4ZIi5HK+J3XkGah4QY8LGZJDAGqS1W2OEvJMD+/wB1WRhVW4C
         NP4sqM1YMiWAtSrZS0yOAhL1AZh3EvuMaJXCoqyqfCu1ItpE74eYyj9IOHeL6Th0Osiq
         Q0oqfyDmdd1v29jVLkr1A4z36F84gi9PFV2I3RhfHrPVwNz+vOoBUzDRNTcJIOh3iZMc
         wa11oHW0vym9PKSK5tDANCKKWBs1Zc+ZBFkbs3pIntQDnYlwnOqG9zFezxD7wznpD840
         u5/P3n+lE1LOnXiI2GAb+eK2K2GXKTUbNkY9R3GTPxie6APvN5un9FWJM3XY9Xdxu0je
         tNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766442943; x=1767047743;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lFPnrdd01B2/HIPkqWvR4vYa+WKSBFffN+plTj2/us=;
        b=Iddups6j2vRi4ZZsZTZDKWULSEE2ayti/4C3dVB6XuPCauIUc2fGECIkh+oAiY0XRX
         ATQWqxjhU7AcqoXWzGcZlM4JU2iEqBS3zU7Tky++O/9j1mLfrIZmfWwnI8OHrAqpo4NN
         jcRRgQln+kg70w8JIpr/sJ1D8px62v9PIWZCxmZASCUjBIiz/MNZZnZZtW2Mpd7xdH7h
         Mr5phUD2iAa0gkCil26Zi9LJNVjIhrNwk4Spp+qyO4PnJOaintAlI3z/GeN1Tm5/80LK
         tby9AUPBhKGWWk6yvuDI+XK3FA3Naurm2WZYIAxntGKvWDr6NeL9VH5gknmCpJnD0dI6
         PzVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFyqzboKMOxspkE/E11snEhxtV+duv1ZlSD+D0LsLshcnV/kxRkifq1ZoKYvKRi4BySHKOltZToX55aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdzDPV1T06a+1eZix2d5gv5sk2de6r+QzHkm8fQaELujg4UFXa
	PBguS019HMm+nEpLnrxGh+5UXiJb6+0NAtd1QzlNFd9Eyn8azaL+0hdqONlg+S8i9Hs=
X-Gm-Gg: AY/fxX42yGtDb9e+efDZe/gs+TCbhhUzKQlxDYrn3pbt0woPjqMHjjfqB513owBdLbm
	r77boZ1bJupXzwxjJ+Clp0XObHJDM2r9ggYw0ySYhiNVRugFBpB5qjU/OFh8eIKpNMbn9oyy8qk
	J9IXQVBmnC7nsr1rC8flPB01VERC5ChbOlrd9VAMA+2FL0AqlyQuYR6AQHUCEw7VPYmQ9vb8Zk7
	siILLTHFBs9RybmHQNd8M3RktDUj6QlzazWI7JJJI24KWm7JFNFJpzMZvIv2ZfKdTPhSgPWBWBU
	u5c2qZa2S5SPrCY41+AKDaIuHei3r0782p29ZVELyG6quM+LIN93fVU8PkxGTo37gPClEA0dYBm
	uMVopGwKii9cRP4xQfMD101f9fckpSwAYLGVesRallZavbXfrpufOsLPRY77Ha4PmhxAGF5a3sS
	EMK8hlzjxylwCVe4w1
X-Google-Smtp-Source: AGHT+IFdxlL6YgflXgWqRcaniEygQOZ9pMpbHKkx8jTvJV6El83VBcIIdXJI1ynv5a6dxOtnogjHjQ==
X-Received: by 2002:a05:620a:7105:b0:88f:c5d4:504e with SMTP id af79cd13be357-8c08fbbcec4mr1991628685a.81.1766442943489;
        Mon, 22 Dec 2025 14:35:43 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::c41? ([2606:6d00:17:7b4b::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973efa97sm980864385a.39.2025.12.22.14.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 14:35:42 -0800 (PST)
Message-ID: <de871401c693088783de5ad8068533ac532a9f03.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 22 Dec 2025 17:35:40 -0500
In-Reply-To: <20251222084912.747-1-ming.qian@oss.nxp.com>
References: <20251222084912.747-1-ming.qian@oss.nxp.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-c/Jy4/cQG9vccoL5oh6W"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-c/Jy4/cQG9vccoL5oh6W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 22 d=C3=A9cembre 2025 =C3=A0 16:49 +0800, ming.qian@oss.nxp.com a =
=C3=A9crit=C2=A0:
> From: Ming Qian <ming.qian@oss.nxp.com>
>=20
> Replace vmalloc/vfree with kmalloc/kfree for allocating small
> driver structures (vpu_inst, vdec_t, venc_t, vpu_cmd_t, and
> frame objects).
>=20
> vmalloc() is designed for large memory allocations and incurs
> unnecessary overhead for small objects due to virtual memory
> mapping. kmalloc() is more appropriate as it allocates physically
> contiguous memory with lower overhead.
>=20
> ftrace measurements of vpu_alloc_cmd() show significant improvement:
>=20
> =C2=A0 Before (vmalloc):=C2=A0 35-72 us=C2=A0=C2=A0 (avg ~45.7 us)
> =C2=A0 After (kmalloc):=C2=A0=C2=A0 11-26 us=C2=A0=C2=A0 (avg ~16.8 us)
>=20
> This reduces allocation time by approximately 63%.
>=20
> No functional changes are intended.
>=20
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

I don't see this patch on patchwork yet, I don't know why. Did you get a
notification or anything ? The patch looks good to me.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/amphion/vdec.c=C2=A0=C2=A0=C2=A0=C2=A0 | 16 =
+++++++---------
> =C2=A0drivers/media/platform/amphion/venc.c=C2=A0=C2=A0=C2=A0=C2=A0 | 20 =
+++++++++-----------
> =C2=A0drivers/media/platform/amphion/vpu_cmds.c | 15 +++++++--------
> =C2=A0drivers/media/platform/amphion/vpu_core.c | 11 ++++-------
> =C2=A04 files changed, 27 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platfo=
rm/amphion/vdec.c
> index c0d2aabb9e0e..7a1c58cac02d 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -9,7 +9,6 @@
> =C2=A0#include <linux/list.h>
> =C2=A0#include <linux/kernel.h>
> =C2=A0#include <linux/module.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> @@ -17,7 +16,6 @@
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -1642,9 +1640,9 @@ static void vdec_cleanup(struct vpu_inst *inst)
> =C2=A0		vdec->slots =3D NULL;
> =C2=A0		vdec->slot_count =3D 0;
> =C2=A0	}
> -	vfree(vdec);
> +	kfree(vdec);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static void vdec_init_params(struct vdec_t *vdec)
> @@ -1909,13 +1907,13 @@ static int vdec_open(struct file *file)
> =C2=A0	struct vdec_t *vdec;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	vdec =3D vzalloc(sizeof(*vdec));
> +	vdec =3D kzalloc(sizeof(*vdec), GFP_KERNEL);
> =C2=A0	if (!vdec) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> @@ -1923,8 +1921,8 @@ static int vdec_open(struct file *file)
> =C2=A0				=C2=A0=C2=A0=C2=A0 sizeof(*vdec->slots),
> =C2=A0				=C2=A0=C2=A0=C2=A0 GFP_KERNEL | __GFP_ZERO);
> =C2=A0	if (!vdec->slots) {
> -		vfree(vdec);
> -		vfree(inst);
> +		kfree(vdec);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0	vdec->slot_count =3D VDEC_SLOT_CNT_DFT;
> diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platfo=
rm/amphion/venc.c
> index aced76401b69..9e5cbc2b0d3f 100644
> --- a/drivers/media/platform/amphion/venc.c
> +++ b/drivers/media/platform/amphion/venc.c
> @@ -13,14 +13,12 @@
> =C2=A0#include <linux/videodev2.h>
> =C2=A0#include <linux/ktime.h>
> =C2=A0#include <linux/rational.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include <media/v4l2-device.h>
> =C2=A0#include <media/v4l2-event.h>
> =C2=A0#include <media/v4l2-mem2mem.h>
> =C2=A0#include <media/v4l2-ioctl.h>
> =C2=A0#include <media/videobuf2-v4l2.h>
> =C2=A0#include <media/videobuf2-dma-contig.h>
> -#include <media/videobuf2-vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -844,7 +842,7 @@ static int venc_get_encoded_frames(struct vpu_inst *i=
nst)
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_dst_buf_remove(i=
nst->fh.m2m_ctx)))
> =C2=A0			break;
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, =
void *arg)
> =C2=A0	if (!info)
> =C2=A0		return -EINVAL;
> =C2=A0	venc =3D inst->priv;
> -	frame =3D vzalloc(sizeof(*frame));
> +	frame =3D kzalloc(sizeof(*frame), GFP_KERNEL);
> =C2=A0	if (!frame)
> =C2=A0		return -ENOMEM;
> =C2=A0
> @@ -912,9 +910,9 @@ static void venc_cleanup(struct vpu_inst *inst)
> =C2=A0		return;
> =C2=A0
> =C2=A0	venc =3D inst->priv;
> -	vfree(venc);
> +	kfree(venc);
> =C2=A0	inst->priv =3D NULL;
> -	vfree(inst);
> +	kfree(inst);
> =C2=A0}
> =C2=A0
> =C2=A0static int venc_start_session(struct vpu_inst *inst, u32 type)
> @@ -1067,7 +1065,7 @@ static void venc_cleanup_frames(struct venc_t *venc=
)
> =C2=A0
> =C2=A0	list_for_each_entry_safe(frame, tmp, &venc->frames, list) {
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0}
> =C2=A0
> @@ -1151,7 +1149,7 @@ static int venc_process_capture(struct vpu_inst *in=
st, struct vb2_buffer *vb)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	list_del_init(&frame->list);
> -	vfree(frame);
> +	kfree(frame);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -1309,13 +1307,13 @@ static int venc_open(struct file *file)
> =C2=A0	struct venc_t *venc;
> =C2=A0	int ret;
> =C2=A0
> -	inst =3D vzalloc(sizeof(*inst));
> +	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> =C2=A0	if (!inst)
> =C2=A0		return -ENOMEM;
> =C2=A0
> -	venc =3D vzalloc(sizeof(*venc));
> +	venc =3D kzalloc(sizeof(*venc), GFP_KERNEL);
> =C2=A0	if (!venc) {
> -		vfree(inst);
> +		kfree(inst);
> =C2=A0		return -ENOMEM;
> =C2=A0	}
> =C2=A0
> diff --git a/drivers/media/platform/amphion/vpu_cmds.c b/drivers/media/pl=
atform/amphion/vpu_cmds.c
> index 5695f5c1cb3e..ab69412e0aa7 100644
> --- a/drivers/media/platform/amphion/vpu_cmds.c
> +++ b/drivers/media/platform/amphion/vpu_cmds.c
> @@ -13,7 +13,6 @@
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/types.h>
> =C2=A0#include <linux/delay.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_cmds.h"
> @@ -84,13 +83,13 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_ins=
t *inst, u32 id, void *data
> =C2=A0	int i;
> =C2=A0	int ret;
> =C2=A0
> -	cmd =3D vzalloc(sizeof(*cmd));
> +	cmd =3D kzalloc(sizeof(*cmd), GFP_KERNEL);
> =C2=A0	if (!cmd)
> =C2=A0		return NULL;
> =C2=A0
> -	cmd->pkt =3D vzalloc(sizeof(*cmd->pkt));
> +	cmd->pkt =3D kzalloc(sizeof(*cmd->pkt), GFP_KERNEL);
> =C2=A0	if (!cmd->pkt) {
> -		vfree(cmd);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst =
*inst, u32 id, void *data
> =C2=A0	ret =3D vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, dat=
a);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(inst->dev, "iface pack cmd %s fail\n", vpu_id_name(id));
> -		vfree(cmd->pkt);
> -		vfree(cmd);
> +		kfree(cmd->pkt);
> +		kfree(cmd);
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0	for (i =3D 0; i < ARRAY_SIZE(vpu_cmd_requests); i++) {
> @@ -118,8 +117,8 @@ static void vpu_free_cmd(struct vpu_cmd_t *cmd)
> =C2=A0		return;
> =C2=A0	if (cmd->last_response_cmd)
> =C2=A0		atomic_long_set(cmd->last_response_cmd, cmd->key);
> -	vfree(cmd->pkt);
> -	vfree(cmd);
> +	kfree(cmd->pkt);
> +	kfree(cmd);
> =C2=A0}
> =C2=A0
> =C2=A0static int vpu_session_process_cmd(struct vpu_inst *inst, struct vp=
u_cmd_t *cmd)
> diff --git a/drivers/media/platform/amphion/vpu_core.c b/drivers/media/pl=
atform/amphion/vpu_core.c
> index 168f0514851e..85cc4a14f8ed 100644
> --- a/drivers/media/platform/amphion/vpu_core.c
> +++ b/drivers/media/platform/amphion/vpu_core.c
> @@ -17,7 +17,6 @@
> =C2=A0#include <linux/pm_runtime.h>
> =C2=A0#include <linux/pm_domain.h>
> =C2=A0#include <linux/firmware.h>
> -#include <linux/vmalloc.h>
> =C2=A0#include "vpu.h"
> =C2=A0#include "vpu_defs.h"
> =C2=A0#include "vpu_core.h"
> @@ -265,7 +264,7 @@ static int vpu_core_register(struct device *dev, stru=
ct vpu_core *core)
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> =C2=A0	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(buffer_size);
> +	core->msg_buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, str=
uct vpu_core *core)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0error:
> -	if (core->msg_buffer) {
> -		vfree(core->msg_buffer);
> -		core->msg_buffer =3D NULL;
> -	}
> +	kfree(core->msg_buffer);
> +	core->msg_buffer =3D NULL;
> =C2=A0	if (core->workqueue) {
> =C2=A0		destroy_workqueue(core->workqueue);
> =C2=A0		core->workqueue =3D NULL;
> @@ -308,7 +305,7 @@ static int vpu_core_unregister(struct device *dev, st=
ruct vpu_core *core)
> =C2=A0
> =C2=A0	vpu_core_put_vpu(core);
> =C2=A0	core->vpu =3D NULL;
> -	vfree(core->msg_buffer);
> +	kfree(core->msg_buffer);
> =C2=A0	core->msg_buffer =3D NULL;
> =C2=A0
> =C2=A0	if (core->workqueue) {
>=20
> base-commit: b70886ff5833cf499e77af77d2324ce8f68b60ce

--=-c/Jy4/cQG9vccoL5oh6W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaUnHvAAKCRDZQZRRKWBy
9Ck3AQC2kqi4+/RTLYugo8zWqI929S8SKF2nE937SXpvMRbLzwEA3jOKIbLFWmQt
37C+DqieAJs+bZ3APZjw4Ny8e2vtOgA=
=C2HX
-----END PGP SIGNATURE-----

--=-c/Jy4/cQG9vccoL5oh6W--

