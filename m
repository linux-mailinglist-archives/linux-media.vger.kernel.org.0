Return-Path: <linux-media+bounces-13688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A25A90EAF4
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 14:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF5D3B23724
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A9A140368;
	Wed, 19 Jun 2024 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j1/5AkPi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8E144D29;
	Wed, 19 Jun 2024 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718799655; cv=none; b=hep/MC6/8NUgMrLmPnPbHfO2Z6CzpV7QYYgRj22rFQZM0bYJ/T17DoM7Jyg/OUFS31ZxX/Cw6sRwgskKBwCxuQXZ/M3bOh46TnWJg1UDeu/aTFrGLawwp6k9KWE9mY+Yz1h/61Jl1mjLUhh4gsJK1jDX1FU8cJpcD930lUWST20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718799655; c=relaxed/simple;
	bh=9jSdqyZIkSV8E1b0765BnFpgN59wri6zxSDG8CEb3+I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HK66VrYI/lq3zbdcGyrTCdXVF4ysHGbAouH/FjEEFk2HPHTpmEqPqPsHpgH+2v1dlZIz4mjnTsmIaIor50isi9hLWTG2BheEiaRdx9/kDR55n719B4XhUfPZJrYrHO4oBrlfeJDCeHl+645GdRk+JAhV2qcaowCHsKB+0mKZ6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j1/5AkPi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15C13541;
	Wed, 19 Jun 2024 14:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718799634;
	bh=9jSdqyZIkSV8E1b0765BnFpgN59wri6zxSDG8CEb3+I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j1/5AkPicpJDzCCsIKZUIyKCf7YjGUhFKhh/GgbEkwOjSbl+KpG2GA66UeOWiJ/YX
	 J9F3YuXLPcUN2kfp0EjFdhO3+yQWxGFzK7ikSoD7lKE/FGLyW1yE2ERuuDWLkrEOcG
	 BL5FuSNANzogbvLzdKt5BVyVy1m04rf+ikB3FzSw=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240619001722.9749-13-laurent.pinchart+renesas@ideasonboard.com>
References: <20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com> <20240619001722.9749-13-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 12/19] media: renesas: vsp1: Keep the DRM pipeline entities sorted
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-media@vger.kernel.org
Date: Wed, 19 Jun 2024 13:20:49 +0100
Message-ID: <171879964925.2248009.4044816953897425991@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2024-06-19 01:17:15)
> Some of the code that handles pipeline configuration assumes that
> entities in a pipeline's entities list are sorted from sink to source.
> To prepare for using that code with the DRM pipeline, insert the BRx
> just before the WPF, and the RPFs at the head of the list.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drm.c
> index 1aa59a74672f..e44359b661b6 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> @@ -317,7 +317,10 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_de=
vice *vsp1,
>                         list_add_tail(&released_brx->list_pipe,
>                                       &pipe->entities);
> =20
> -               /* Add the BRx to the pipeline. */
> +               /*
> +                * Add the BRx to the pipeline, inserting it just before =
the
> +                * WPF.

So - the pipe->output is from what I recall/can see the output wpf.
 (struct vsp1_rwpf *output)

> +                */
>                 dev_dbg(vsp1->dev, "%s: pipe %u: acquired %s\n",
>                         __func__, pipe->lif->index, BRX_NAME(brx));
> =20
> @@ -326,7 +329,8 @@ static int vsp1_du_pipeline_setup_brx(struct vsp1_dev=
ice *vsp1,
>                 pipe->brx->sink =3D &pipe->output->entity;
>                 pipe->brx->sink_pad =3D 0;
> =20
> -               list_add_tail(&pipe->brx->list_pipe, &pipe->entities);
> +               list_add_tail(&pipe->brx->list_pipe,
> +                             &pipe->output->entity.list_pipe);

But this reads to me as if we're adding the brx after ('the tail') of
the output WPF....

Now ... of course if we open up list_add_tail()

 * Insert a new entry before the specified head.

And that checks out - because of course the list_add adds it as the
'next' item in the list... and we're using list_add_tail as a convenient
way to provide list_add_before() ...

So I believe this is correct, but the nuance of it reads back to front to m=
e.

Because of that it possibly deserves a better comment to be explicit on
what it's doing, or makes me wonder if list.h should have something that
explicitly impliments

#define list_add_before list_add_tail

but otherwise - it does check out.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         }
> =20
>         /*
> @@ -420,7 +424,7 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_=
device *vsp1,
> =20
>                 if (!rpf->entity.pipe) {
>                         rpf->entity.pipe =3D pipe;
> -                       list_add_tail(&rpf->entity.list_pipe, &pipe->enti=
ties);
> +                       list_add(&rpf->entity.list_pipe, &pipe->entities);
>                 }
> =20
>                 brx->inputs[i].rpf =3D rpf;
> --=20
> Regards,
>=20
> Laurent Pinchart
>

