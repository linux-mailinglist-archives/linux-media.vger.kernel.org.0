Return-Path: <linux-media+bounces-2055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD780B85A
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 03:00:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1B091F21038
	for <lists+linux-media@lfdr.de>; Sun, 10 Dec 2023 02:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84B2815A0;
	Sun, 10 Dec 2023 02:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RrUvwLN+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C4A10C;
	Sat,  9 Dec 2023 18:00:15 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-77f642b9a22so47848585a.0;
        Sat, 09 Dec 2023 18:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702173615; x=1702778415; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iirnk+K80ukU5tUHF57C2FdkiPvuVc7P/UMA6GstnZ0=;
        b=RrUvwLN+kPTtdZMWTB8wK/DyLJMnM5Q/Pmmg80rVlrtc5MjmI4NFORSq8MtGtDowau
         3iWb8t9nWHHiwsfGP4TmllTjKqmSx4XdmuMvl05lCmpqq0Xbomi7qxPrkTabc6d1Ci4f
         FWAu13bq6sk6xYEv3cEKcecrE9QMvV5S/FELTFMlwwVCJ7MlS1QDW8nyinEU7KSMXQj5
         ClI0LlHjhbkrAi9i/YN5BYdn9iGj+5fGK4Ueu4DrMPLdiyFkOusKTc+soUq1x6scryga
         qCdTtZoRDwXPxexSvn8Bd6lG0nzxfs3FwhzLspeKaatLF1MWb7xSAcHXiPTE3AejTIy1
         wSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702173615; x=1702778415;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iirnk+K80ukU5tUHF57C2FdkiPvuVc7P/UMA6GstnZ0=;
        b=ANS1XtRKJYDsCJFnQy6Ri4hFKQk4n0kHwNprHqx/ANHqi6uv81GGfuvTqKdOhpyflr
         CwBZ1QNdM3lWdKyimQnITAPwvTV00qDBFjhA97OB+89fQrFCzvdf3PmM5KyzRGyPzR3B
         4/GXQY5Bx95LHpe2K/7vtnvDO+yr2+/1H7spyn4DuWwQA2dRywHPnEzT4gJgg44M9YAo
         zIA/vdMiJ1az9bZgLcicbYpEoriSWQvGbR8CXi2VJ7GYbo7Vlk7E7p0M/xt8xrP9nGBF
         9FCEuECMqHqsJFLFiceeqKAERzf7c0a1irw1BMmm21nOcj8AiBby5ZJOfnrmR8lRnsxW
         eO9Q==
X-Gm-Message-State: AOJu0Yyr+ELqqk8TyCCsc5dh6PzOHe/DHLZcW2G/FAu19RnCgYxqIqxL
	Ze6GafvHBIilf8bNbzgZWDc=
X-Google-Smtp-Source: AGHT+IHmmO8yEQxrJ3T556l1Tmtu1x5im4Nj1OUazKYtPscjv2QXgn0AAZMkSWymutV6XmCr0Gc/AA==
X-Received: by 2002:a05:6214:1549:b0:67a:a2a2:3935 with SMTP id t9-20020a056214154900b0067aa2a23935mr3074853qvw.7.1702173614950;
        Sat, 09 Dec 2023 18:00:14 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
        by smtp.gmail.com with ESMTPSA id pp12-20020a056214138c00b0067a14238fa9sm2051161qvb.94.2023.12.09.18.00.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 18:00:14 -0800 (PST)
Message-ID: <cd286d71-811e-4976-8538-4f946dca6da8@gmail.com>
Date: Sat, 9 Dec 2023 21:00:04 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.1
Subject: Re: [PATCH] drm/scheduler: Unwrap job dependencies
Content-Language: en-CA, en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20231205190234.371322-1-robdclark@gmail.com>
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20231205190234.371322-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DH1b43QTRDFYjum9TFiZzmL0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DH1b43QTRDFYjum9TFiZzmL0
Content-Type: multipart/mixed; boundary="------------5AcjGbok14q8wunARMWuRa49";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Message-ID: <cd286d71-811e-4976-8538-4f946dca6da8@gmail.com>
Subject: Re: [PATCH] drm/scheduler: Unwrap job dependencies
References: <20231205190234.371322-1-robdclark@gmail.com>
In-Reply-To: <20231205190234.371322-1-robdclark@gmail.com>

--------------5AcjGbok14q8wunARMWuRa49
Content-Type: multipart/mixed; boundary="------------Xnbegemyy81hwQG4dwAVqouJ"

--------------Xnbegemyy81hwQG4dwAVqouJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On 2023-12-05 14:02, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>=20
> Container fences have burner contexts, which makes the trick to store a=
t
> most one fence per context somewhat useless if we don't unwrap array or=

> chain fences.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Link: https://lore.kernel.org/all/20230322224403.35742-1-robdclark@gmail.=
com/

Let's include a link to the original thread, as the main discussion can b=
e found
therein.

Christian, could you review this patch please?

Thanks!
--=20
Regards,
Luben

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 47 ++++++++++++++++++--------=

>  1 file changed, 32 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 9762464e3f99..16b550949c57 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -52,6 +52,7 @@
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/completion.h>
> +#include <linux/dma-fence-unwrap.h>
>  #include <linux/dma-resv.h>
>  #include <uapi/linux/sched/types.h>
> =20
> @@ -684,27 +685,14 @@ void drm_sched_job_arm(struct drm_sched_job *job)=

>  }
>  EXPORT_SYMBOL(drm_sched_job_arm);
> =20
> -/**
> - * drm_sched_job_add_dependency - adds the fence as a job dependency
> - * @job: scheduler job to add the dependencies to
> - * @fence: the dma_fence to add to the list of dependencies.
> - *
> - * Note that @fence is consumed in both the success and error cases.
> - *
> - * Returns:
> - * 0 on success, or an error on failing to expand the array.
> - */
> -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> -				 struct dma_fence *fence)
> +static int drm_sched_job_add_single_dependency(struct drm_sched_job *j=
ob,
> +					       struct dma_fence *fence)
>  {
>  	struct dma_fence *entry;
>  	unsigned long index;
>  	u32 id =3D 0;
>  	int ret;
> =20
> -	if (!fence)
> -		return 0;
> -
>  	/* Deduplicate if we already depend on a fence from the same context.=

>  	 * This lets the size of the array of deps scale with the number of
>  	 * engines involved, rather than the number of BOs.
> @@ -728,6 +716,35 @@ int drm_sched_job_add_dependency(struct drm_sched_=
job *job,
> =20
>  	return ret;
>  }
> +
> +/**
> + * drm_sched_job_add_dependency - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +				 struct dma_fence *fence)
> +{
> +	struct dma_fence_unwrap iter;
> +	struct dma_fence *f;
> +	int ret =3D 0;
> +
> +	dma_fence_unwrap_for_each (f, &iter, fence) {
> +		dma_fence_get(f);
> +		ret =3D drm_sched_job_add_single_dependency(job, f);
> +		if (ret)
> +			break;
> +	}
> +
> +	dma_fence_put(fence);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(drm_sched_job_add_dependency);
> =20
>  /**

--------------Xnbegemyy81hwQG4dwAVqouJ
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------Xnbegemyy81hwQG4dwAVqouJ--

--------------5AcjGbok14q8wunARMWuRa49--

--------------DH1b43QTRDFYjum9TFiZzmL0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZXUbpAUDAAAAAAAKCRBMFUeUMaM0r4CB
AP9BzdKV0/Demva8WlC8Tg3QI4lENeTPM8OVE+DczzG1/wEArLptFP004Ze3PTau6EO21XXw68MP
6GZn+DgxJOc7nQQ=
=MtnB
-----END PGP SIGNATURE-----

--------------DH1b43QTRDFYjum9TFiZzmL0--

