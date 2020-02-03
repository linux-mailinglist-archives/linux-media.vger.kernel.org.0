Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1B9151027
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2020 20:12:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727166AbgBCTMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Feb 2020 14:12:43 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:55956 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgBCTMn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Feb 2020 14:12:43 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: alyssa)
        with ESMTPSA id 7B45929040D
Date:   Mon, 3 Feb 2020 14:12:36 -0500
From:   Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Rob Herring <robh@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Steven Price <steven.price@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-ID: <20200203191236.GA2913@kevin>
References: <20200203152724.42611-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <20200203152724.42611-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssas Rosenzweig <alyssa.rosenzweig@collabora.com>, thank
you!

On Mon, Feb 03, 2020 at 03:27:24PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanu=
p':
> drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>=20
> commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
> involved this unused variable.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 7c36ec675b73..ccb8546a9342 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
>  	}
> =20
>  	if (job->bos) {
> -		struct panfrost_gem_object *bo;
> -
> -		for (i =3D 0; i < job->bo_count; i++) {
> -			bo =3D to_panfrost_bo(job->bos[i]);
> +		for (i =3D 0; i < job->bo_count; i++)
>  			drm_gem_object_put_unlocked(job->bos[i]);
> -		}
> =20
>  		kvfree(job->bos);
>  	}
>=20
>=20
>=20

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl44cJoACgkQ/v5QWgr1
WA1MQA//eHYgx1kcsdR+AmUM+1kdx1sYRUsvVzSaADRg0iMTcRTZEmlBXAlu6hak
WYuhLq96Cw6+kkmAoWSizha3jij7Vg1HwMsaHsbQMSnocIQVyp2BqfjlOMBtWcMm
OyUzFz5QWvGFEEGh9DjSxZ8TGT4BoRzzCj0FF60d2JEEguRMSvT9xvq2Hi/JRsaN
Mx0cfCAMjmPzaPv091TR8KhTuGPIHg+Im0agoY1rd2sTARywX9abYShLIQA2ZtEj
mNSjuKGPDz7LlTdKpcgkQHK/7VQeQr63J8ymCTUDPfSFJd0qhVVAHB31knjkLLss
nTtbMjKhGYtEXB7l64s+VqxUUJvRafsRJEc/7zUaqfjEtQb0iEt0AEecDxnkAyS6
9cfC0hSMcUVYGRXENQTy0Pp8a5hFZFc25TxQq5zD36u4ndvVDs29ZCQ1iqAmg9K+
m3zOWxJdcw9+kyyyFvSjbB8GM5+CcV8jfCe5pSxdwBsXILZ5Tb+8F32Y2y9EIORV
RK9m32/mDJaZUsIPaeEmpMwkV/efHn9qTfA77iIVm9EkTRTzLBXWBjSodTC+a5mD
9y5xR5RmSIuBY4FlcVsZNlZj2d/js6+UxtPj/qqVOYv9lnrqKJr/Ji+KqRYIGEyB
QwjLFAQeOkINXhqRGfTlKgPaNwj+gFBse10UjwyLHRzL5HpLexg=
=+/k/
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
