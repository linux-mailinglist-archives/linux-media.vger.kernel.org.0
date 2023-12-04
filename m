Return-Path: <linux-media+bounces-1597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B12958035A7
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 14:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1C631C20B06
	for <lists+linux-media@lfdr.de>; Mon,  4 Dec 2023 13:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1F12576C;
	Mon,  4 Dec 2023 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ih34D7Ow"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7F690;
	Mon,  4 Dec 2023 05:55:57 -0800 (PST)
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 777066607090;
	Mon,  4 Dec 2023 13:55:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701698156;
	bh=wD2ubbvS7eFYc7JS8cp6iuoHY5//3jKYOuC554SErTw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ih34D7OwsXYpv77xCCo/dPALgCqYbEPj+mvJ/SdCmiumsp/i5nb9igiwVegqZ0xum
	 2GdCaNWzog/m9VJ/zN+fJeQWMUz7eJXkgRHxcdDZQvKOgvlnLCHujRQJTco5BRGKma
	 i2gHd0Fws8FMh6FPqJ1yR6LWqQGCzOZwuseF5uQBhiM0RTQCbLAtxx7hx038qFyfXn
	 KF0ip8xvG44l9c2yfimihZXy6oL6p19rDtBNlO5jqIHZZYqrs30yWInqhAFCidRMBM
	 ZKDRpqViPpkzDNOnCuJfJihHclTzCYyt0UhXAsHH57EGtKD57kYc93cp2Nx+w7JzLC
	 kT7/2wOxIWr1g==
Message-ID: <a4c47b282d9e3bc5c2891ac1b9cafb9c9970975c.camel@collabora.com>
Subject: Re: [PATCH] Fix memory leaks in wave5_vpu_open_enc() and
 wave5_vpu_open_dec()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Zeng Chi <zengchi@kylinos.cn>, nas.chung@chipsnmedia.com, 
 jackson.lee@chipsnmedia.com, mchehab@kernel.org,
 sebastian.fricke@collabora.com,  hverkuil-cisco@xs4all.nl,
 bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 04 Dec 2023 08:55:46 -0500
In-Reply-To: <20231204091649.3418987-1-zengchi@kylinos.cn>
References: <20231204091649.3418987-1-zengchi@kylinos.cn>
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

Le lundi 04 d=C3=A9cembre 2023 =C3=A0 17:16 +0800, Zeng Chi a =C3=A9crit=C2=
=A0:
> This patch fixes memory leaks on error escapes in wave5_vpu_open_enc()
> and wave5_vpu_open_dec().

Please avoid sending twice the same patch. This is still a NAK.

regards,
Nicolas

>=20
> Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
> Signed-off-by: Zeng Chi <zengchi@kylinos.cn>
> ---
>  drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 5 +++--
>  drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 +++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 8b1417ece96e..b0a045346bb7 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -1802,9 +1802,10 @@ static int wave5_vpu_open_dec(struct file *filp)
>  	spin_lock_init(&inst->state_spinlock);
> =20
>  	inst->codec_info =3D kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
> -	if (!inst->codec_info)
> +	if (!inst->codec_info) {
> +		kfree(inst);
>  		return -ENOMEM;
> -
> +	}
>  	v4l2_fh_init(&inst->v4l2_fh, vdev);
>  	filp->private_data =3D &inst->v4l2_fh;
>  	v4l2_fh_add(&inst->v4l2_fh);
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f29cfa3af94a..bc94de9ea546 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1546,9 +1546,10 @@ static int wave5_vpu_open_enc(struct file *filp)
>  	inst->ops =3D &wave5_vpu_enc_inst_ops;
> =20
>  	inst->codec_info =3D kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
> -	if (!inst->codec_info)
> +	if (!inst->codec_info) {
> +		kfree(inst);
>  		return -ENOMEM;
> -
> +	}
>  	v4l2_fh_init(&inst->v4l2_fh, vdev);
>  	filp->private_data =3D &inst->v4l2_fh;
>  	v4l2_fh_add(&inst->v4l2_fh);


