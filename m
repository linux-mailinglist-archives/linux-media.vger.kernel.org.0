Return-Path: <linux-media+bounces-1596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F5080359A
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0421A1F211E4
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74EB25749;
	Mon,  4 Dec 2023 13:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eZ08aZ5M"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA0C102;
	Mon,  4 Dec 2023 05:54:49 -0800 (PST)
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 62C2E660711D;
	Mon,  4 Dec 2023 13:54:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701698088;
	bh=PVA41weTM/0r0G0fLxhp7nE8jfHRfSplJAtdMTUdgZ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eZ08aZ5MePVxoXFWfBYnB3A5i11+zswsy2wL/1AOb+9/8NCNEEMAUaKS4Go3Z3469
	 HANX77Z6NZr0nuyGou6b3HGJOVvpc/JgdOrWBNj2GumIRSRfiGiO4jOJuolJ41rU4i
	 ut1ks1YTprC9BxLz6Sap8zzObnYVM3xMEk9vtBIK8oY8APIH0970GFGxMqde+/+kGh
	 ZMRDzUmUX5ndB199DPB5S5KZ5c0OJT8cRb7gZpTIrv0wh5xl7CVRmMNGAkXoVxhKSd
	 4sN1MArsB6j/s1aSHC3TvrN3jbExGgxp5fCNRZ9ojMZdSfuT5ecUAMvcGNJkyPtt3w
	 b299/RnvKgJ4w==
Message-ID: <a097944d068ecc8e1121350bb7dffb058859f032.camel@collabora.com>
Subject: Re: [PATCH] Fix memory leaks in wave5_vpu_open_enc() and
 wave5_vpu_open_dec()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Zeng Chi <zengchi@kylinos.cn>, nas.chung@chipsnmedia.com, 
 jackson.lee@chipsnmedia.com, mchehab@kernel.org,
 sebastian.fricke@collabora.com,  hverkuil-cisco@xs4all.nl,
 bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 04 Dec 2023 08:54:37 -0500
In-Reply-To: <20231204083957.2835095-1-zengchi@kylinos.cn>
References: <20231204083957.2835095-1-zengchi@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le lundi 04 d=C3=A9cembre 2023 =C3=A0 16:39 +0800, Zeng Chi a =C3=A9crit=C2=
=A0:
> This patch fixes memory leaks on error escapes in wave5_vpu_open_enc()
> and wave5_vpu_open_dec().
>=20
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 4 +++-
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 8b1417ece96e..2d3e8a184f93 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1792,8 +1792,10 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	int ret =3D 0;
> =20
>  	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> -	if (!inst)
> +	if (!inst) {
> +		kfree(inst);

The allocation failed, there is nothing to free here (kfree(null) is a no-o=
p).
This patch does not do what it pretends to do.

Nicolas

>  		return -ENOMEM;
> +	}
> =20
>  	inst->dev =3D dev;
>  	inst->type =3D VPU_INST_TYPE_DEC;
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f29cfa3af94a..cbf6cb6e07aa 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1537,8 +1537,10 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	int ret =3D 0;
> =20
>  	inst =3D kzalloc(sizeof(*inst), GFP_KERNEL);
> -	if (!inst)
> +	if (!inst) {
> +		kfree(inst);
>  		return -ENOMEM;
> +	}
>  	v4l2_ctrl_hdl =3D &inst->v4l2_ctrl_hdl;
> =20
>  	inst->dev =3D dev;



