Return-Path: <linux-media+bounces-1361-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACE47FD856
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 14:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C3521C20D38
	for <lists+linux-media@lfdr.de>; Wed, 29 Nov 2023 13:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37856208CD;
	Wed, 29 Nov 2023 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A9eW5feD"
X-Original-To: linux-media@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AFAC1;
	Wed, 29 Nov 2023 05:40:31 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D83EE0004;
	Wed, 29 Nov 2023 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701265230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mg87daM6N7IwtDqh3Oxpi+m/n/+fVFbpa0PC/b0XCNw=;
	b=A9eW5feD3zpSW8TWW4yzTnNDWulTByW0ZWSm1zltBwCeC3kcfyH884hQIwXujL+XagYVWA
	mOs5XTj+TFJW4r0lIw3KJW40SqmLwdy76RbMH7R9JIyguD1kYevWXNF/iDN0I0HRyCgm+C
	8XTzS8lGdFntp5LKRBbXw9TO61Iy5z0UMveBvSuToTxW1jUX5jH1p572nV3jM91TjppV/8
	Mxrv3mnP9aT/pvrc8QkvGuiIzQ47ZEK51nGifzmtX/fHse1ZZttg4i/Eg+gTSQPIbrVcMh
	/sUQiLULUs5Ldof6h9RD2/3+wrBAZc7SxUefJ1QMaHnaLUAwb53J+MdGLotJ3w==
Date: Wed, 29 Nov 2023 14:40:27 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: hverkuil@xs4all.nl, mchehab@kernel.org, tfiga@chromium.org,
	m.szyprowski@samsung.com, matt.ranostay@konsulko.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, kernel@collabora.com,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 27/55] media: sun6i-isp: Stop abusing of
 min_buffers_needed field
Message-ID: <ZWc_S8CuPyc9zRXz@aptenodytes>
References: <20231127165454.166373-1-benjamin.gaignard@collabora.com>
 <20231127165454.166373-28-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mU8YCCCm68AE0htG"
Content-Disposition: inline
In-Reply-To: <20231127165454.166373-28-benjamin.gaignard@collabora.com>
X-GND-Sasl: paul.kocialkowski@bootlin.com


--mU8YCCCm68AE0htG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On Mon 27 Nov 23, 17:54, Benjamin Gaignard wrote:
> 'min_buffers_needed' is suppose to be used to indicate the number
> of buffers needed by DMA engine to start streaming.
> sun6i-isp driver doesn't use DMA engine and just want to specify
> the minimum number of buffers to allocate when calling VIDIOC_REQBUFS.
> That 'min_reqbufs_allocation' field purpose so use it.

The hardware actually has its own DMA engine. It can work with just one buf=
fer
though (which will never be returned to userspace). But I think we should s=
till
require at least two buffers allocated, otherwise the driver will be of no =
use
at all.

So I don't think the commit message here is correct.

Cheers,

Paul

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> CC: Chen-Yu Tsai <wens@csie.org>
> CC: Jernej Skrabec <jernej.skrabec@gmail.com>
> CC: Samuel Holland <samuel@sholland.org>
> CC: linux-sunxi@lists.linux.dev
> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c | 2 +-
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c b/=
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> index 1595a9607775..f47f9946c19f 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_capture.c
> @@ -660,7 +660,7 @@ int sun6i_isp_capture_setup(struct sun6i_isp_device *=
isp_dev)
>  	queue->buf_struct_size =3D sizeof(struct sun6i_isp_buffer);
>  	queue->ops =3D &sun6i_isp_capture_queue_ops;
>  	queue->mem_ops =3D &vb2_dma_contig_memops;
> -	queue->min_buffers_needed =3D 2;
> +	queue->min_reqbufs_allocation =3D 2;
>  	queue->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	queue->lock =3D &capture->lock;
>  	queue->dev =3D isp_dev->dev;
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c b/d=
rivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> index e28be895b486..259f6bfcb620 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_params.c
> @@ -489,7 +489,7 @@ int sun6i_isp_params_setup(struct sun6i_isp_device *i=
sp_dev)
>  	queue->buf_struct_size =3D sizeof(struct sun6i_isp_buffer);
>  	queue->ops =3D &sun6i_isp_params_queue_ops;
>  	queue->mem_ops =3D &vb2_vmalloc_memops;
> -	queue->min_buffers_needed =3D 1;
> +	queue->min_reqbufs_allocation =3D 1;
>  	queue->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
>  	queue->lock =3D &params->lock;
>  	queue->dev =3D isp_dev->dev;
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--mU8YCCCm68AE0htG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVnP0sACgkQ3cLmz3+f
v9F5uwf9HEjUyWv7gu/wFi6nn9TZDZ93ao3xKo/mZikju6pBUS74UzOuzCPOcSGX
GZ3YLIKmAeF/EDAbivvsp7a5coFBr93y9abkPMRfhWQww/uijQ4E9gqe/EWlHw3O
Xm1g1YnLDqTjVETR4fb6iiGPK9EaKDmr4dhYadoz6ILO3WNZq1+lRTaxEc+H8FpS
C62ybRSaHm1TbbMr04szpPrLWT7AAuTFNIsj/hhAA4+ukdUKgc0vMOCH5C/H049l
AIOOQZNS4SfqOIt1kBpD7/KchD4frUJOaJUAfbpKbNv8uV7HAal3+0A1I5TvzWy6
nBKgOMp2YyEeY0n0x1XG5ndCKWVGGA==
=C4Ap
-----END PGP SIGNATURE-----

--mU8YCCCm68AE0htG--

