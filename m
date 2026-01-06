Return-Path: <linux-media+bounces-50075-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CCCFAE12
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 21:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB11030537A4
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 20:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DFB92D23A6;
	Tue,  6 Jan 2026 20:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="fxbO5wvu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A4D20F079
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 20:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767730397; cv=none; b=I/TUtW5ReapSUp/XsHTXvVbX52vdD42ynbsUAwf2LxUZJh69loVSV1Zb7M/0LoumUtNRLJRwbwh9VPS39t7D47UiM8pr+RRTY8HTojK4EuS84IHIxgEEQ9J+wmiPehYHun7qab1qnWmsI+S0AjYKWDi88mrbCtgCb3NkIyL//Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767730397; c=relaxed/simple;
	bh=jPVdqhWs2TPwcHlMq0L0CE1YYe4u5iPs7FdsFKOVGs8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DclXjNT5DHGg24c5DOXgxbHdAXHkacdCIs6lSz0DoxRsT0eHDwszBEs0WPCIcu5NVm2p4Zl5ql2e+LVUKjfPfd8iIQ4/9XldzDsmhT3O1kRfAgwM/JBUAq7K6E8IEBsy3Jlhr+ooycBA4Q8pWMDvfSbFzMcAWqXd0bp6H6RVtLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=fxbO5wvu; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b22b1d3e7fso130348185a.3
        for <linux-media@vger.kernel.org>; Tue, 06 Jan 2026 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1767730395; x=1768335195; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=fxbO5wvuFe/12mh+1/rlMle/bCJZ4HCbX0Wn9qzk8HHBz2qjewjAqU8VEoL3ytAwbl
         lpzhGiTf/+ORFUhwxIbEDMau+A54DmJsBM1VuHObC/osD6DA6jsHnKO3r7PujwCmKWzJ
         e7vSkacZrPiIkTlEe2rq3m37iNTrLe9erLBHSGiZ2Di8Huyh6ZbKwW8a3+tQNR/Rr+FK
         OtKIgyokcifREamf5D/4tL5R261MwuoXYGksllVoxD4TdlaBEGgnAPQTVLngIsbViZgD
         TCho3ne7ZRCY0d6SRhn3zVAhzc09MHyD+891GuOFuIv8+aQz5MFq6Th/eACoaRJZO+ks
         JsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767730395; x=1768335195;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGgADW9nZD17Da1M/Fe+ypFmIKBVR0gBMWrtY6svF8g=;
        b=dJFHliXC7m2AU2wfSAeL/31OUdy/5pEnUFMH51AoJxGSE8PrNn7P4auQM7hp6LrAxR
         pAAIT9kVqGNN2xAM8LxBhLeklalb/MVgFzWqKEp5FKjO6gb5zqWmQq4Q+Pk9vR2RDsJf
         VnWkpMMZshF9P0Z3Qz2A0pz4G/lsa+POHSSWH1TAQvYRXW3wp/ZBAbluu7l29ZtfiuC3
         6zjzeF4mPh6BJSyhJxklU2ZmgZNfIbDQmNJzQZDSckQKiFrhYW6K7pIs4d4HVCRyCeBf
         cdyw3jEzn4+RuXVecNyUBTZUI30wlvw5mejhKFczPTROdDw45EAfZevpOrkLjpt0ErJp
         do0g==
X-Forwarded-Encrypted: i=1; AJvYcCW14cQPUTK8Ytei7r0pYqhXTlk5k2RjvbLVO1EefyyNUxIte32pOYJBfiAV3xoKaUszAQogH1RWvOwHUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5hZUFnQeFVFxYEl96Wc/NxerdmkUYn8NHhz5jVrmrYsQUihH
	VdR9ucrfJhoNQnCp/1QzsI793kJH57KMLuDW1RI//azhyA33k1SBDfRClcUNzwIjDTU=
X-Gm-Gg: AY/fxX58yXw+NhB9CshESuKbuwfJyDa06S0z6mnAoeIEMWvU1va8MUSx2XfRLk60EhI
	mNptcSjm3FBZ/C59dDy7wanupCPwQ0HF2lXTVHQspb2ez3F+zZwTdNKtOJVtFPFRlqLEscSE+zJ
	v3iZwRddemyrfFLsnP6736bHfeWl4b2y/s64QY/zki6JB85vucrlxD/8zHIXiwM94hczWkFe1wf
	PUmc9iFM+J9qCBEQAzhvyMCgdFzCH9LX9ZHWFsrfEn8rS9Ta2AX2+C3BoesHknBVRVPDaGNdCu+
	vMvopT/e/Rc9r13ARWsYhqQCSXLsrNHnYZlJgG3sVLUKAy/7Aa1PNn3rtpvM5Ah+GZqqCcACRZ8
	Yq8UeIWZsOnuT9UYl2N35o9aTWzNrR+LXdjPM43S4IDk1KIQQqrMcIrPyHrianrNuJJ/6lcgR9V
	ja2BNk+/RCfnNz2cLX
X-Google-Smtp-Source: AGHT+IH/wLE7DdiFM+Bb8jYRFbO6Or+cMF7NwB8CGndt9QUJmgsJUJfLZ+U7BiCGgvq+Cm5fvn3UeQ==
X-Received: by 2002:a05:620a:29cc:b0:8b2:e1bc:f2a2 with SMTP id af79cd13be357-8c3893eb72bmr8510985a.54.1767730394771;
        Tue, 06 Jan 2026 12:13:14 -0800 (PST)
Received: from ?IPv6:2606:6d00:17:7b4b::5ac? ([2606:6d00:17:7b4b::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm232070985a.33.2026.01.06.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 12:13:13 -0800 (PST)
Message-ID: <5ae7ea006e78377c22181b7455aea280214b8471.camel@ndufresne.ca>
Subject: Re: [PATCH] media: amphion: Use kmalloc instead of vmalloc
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: ming.qian@oss.nxp.com, linux-media@vger.kernel.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, 
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 	kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, Frank.li@nxp.com, 	xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 06 Jan 2026 15:13:12 -0500
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
	protocol="application/pgp-signature"; boundary="=-FYyUlJPAcllBQWTM48ij"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-FYyUlJPAcllBQWTM48ij
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

Looks good to me.

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
> diff --git a/drivers/media/platform/amphion/vdec.c
> b/drivers/media/platform/amphion/vdec.c
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
> diff --git a/drivers/media/platform/amphion/venc.c
> b/drivers/media/platform/amphion/venc.c
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
nst-
> >fh.m2m_ctx)))
> =C2=A0			break;
> =C2=A0		list_del_init(&frame->list);
> -		vfree(frame);
> +		kfree(frame);
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -860,7 +858,7 @@ static int venc_frame_encoded(struct vpu_inst *inst, =
void
> *arg)
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
st,
> struct vb2_buffer *vb)
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
> diff --git a/drivers/media/platform/amphion/vpu_cmds.c
> b/drivers/media/platform/amphion/vpu_cmds.c
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
t
> *inst, u32 id, void *data
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
> @@ -98,8 +97,8 @@ static struct vpu_cmd_t *vpu_alloc_cmd(struct vpu_inst
> *inst, u32 id, void *data
> =C2=A0	ret =3D vpu_iface_pack_cmd(inst->core, cmd->pkt, inst->id, id, dat=
a);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(inst->dev, "iface pack cmd %s fail\n",
> vpu_id_name(id));
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
u_cmd_t
> *cmd)
> diff --git a/drivers/media/platform/amphion/vpu_core.c
> b/drivers/media/platform/amphion/vpu_core.c
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
ct
> vpu_core *core)
> =C2=A0	INIT_WORK(&core->msg_work, vpu_msg_run_work);
> =C2=A0	INIT_DELAYED_WORK(&core->msg_delayed_work, vpu_msg_delayed_work);
> =C2=A0	buffer_size =3D roundup_pow_of_two(VPU_MSG_BUFFER_SIZE);
> -	core->msg_buffer =3D vzalloc(buffer_size);
> +	core->msg_buffer =3D kzalloc(buffer_size, GFP_KERNEL);
> =C2=A0	if (!core->msg_buffer) {
> =C2=A0		dev_err(core->dev, "failed allocate buffer for fifo\n");
> =C2=A0		ret =3D -ENOMEM;
> @@ -282,10 +281,8 @@ static int vpu_core_register(struct device *dev, str=
uct
> vpu_core *core)
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
ruct
> vpu_core *core)
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

--=-FYyUlJPAcllBQWTM48ij
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaV1s2AAKCRDZQZRRKWBy
9MQyAQDxpxzr9kihozUH+t2YsCS8uiqoV1YKptAS4KpREXxtcAEAiT1yqKfjFLoF
EuHuBeiiTmRL6/5CkzLEg5xRbhEOxAE=
=1XYq
-----END PGP SIGNATURE-----

--=-FYyUlJPAcllBQWTM48ij--

