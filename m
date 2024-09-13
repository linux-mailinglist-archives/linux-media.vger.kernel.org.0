Return-Path: <linux-media+bounces-18258-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4D97825B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 16:14:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD8E1F2528E
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2024 14:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 446C31DC053;
	Fri, 13 Sep 2024 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DYVv36fL"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA361D86D1;
	Fri, 13 Sep 2024 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236856; cv=none; b=HDnxxtHJvKFtM7SjE7EJ96WPXIENenRxt9cU1DbND5lQD8P4do1oe1L3sD9Otk43YXDxc5SvaaRBK5Nlu1deRHVIYz2RiUCmylA1OE3biNVYtG5D1OoKZlnFML4zbfUXFxfaZ7N9IMzEdmkp6ExIoQj302EfFjUY3g55B9GhiHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236856; c=relaxed/simple;
	bh=iFQwqzYIMnfWi5KAOvdD18pv2NdDRbClhMQeK/FJXjk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyVIhvpq6dwmFad95yFh9+tqHiVVxBC3ibQr7W0KgyQjnyZF9RMRrNJFpjF2myYsHSftANpJXMYgghz9rQjL4PxnduH7yxGvW/FEwp481Iaa+dQ7xey5K1PfE6nh44qT48/GxaM5oGvdgFbjXwQETytnq+ZMiyAGRWLzlgrOwa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DYVv36fL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726236852;
	bh=iFQwqzYIMnfWi5KAOvdD18pv2NdDRbClhMQeK/FJXjk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DYVv36fLb0UKMFETQMDs1YhdloUGyhfJYnvH0CZK/wQtXxCUvx1goOdJNz4mtN4yQ
	 a3ZjDOZmnDJaRsyqF482iciDRBGXvsRwkKtsDFj3qt+HUkdMFzcwOjo6WOSisW/U9B
	 vAhl3STDukEzFW5f7zgpy+Hsq0EGw7YiU5hKIOBWgfleWV/5zboi0NyFOPWwbiS8VV
	 tfkXUi04/jZIHcqCcvqnOeGLh3y5wFixdTtzKhHpNLO0NTw7LHsrUuGQ2bNYvZWcH6
	 usGy3JnJJznZXIzypM/wR8qiCff4o7cdh+wkiZjccheZIEb8l+uiY2OHlqRCwUgKfk
	 IpxIYrXoAFy9A==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00CB517E1524;
	Fri, 13 Sep 2024 16:14:11 +0200 (CEST)
Date: Fri, 13 Sep 2024 16:14:07 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6 2/5] drm/panthor: record current and maximum device
 clock frequencies
Message-ID: <20240913161407.0a30b68f@collabora.com>
In-Reply-To: <20240913124857.389630-3-adrian.larumbe@collabora.com>
References: <20240913124857.389630-1-adrian.larumbe@collabora.com>
	<20240913124857.389630-3-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Sep 2024 13:42:10 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> In order to support UM in calculating rates of GPU utilisation, the curre=
nt
> operating and maximum GPU clock frequencies must be recorded during device
> initialisation, and also during OPP state transitions.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 18 +++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_device.h  |  6 ++++++
>  2 files changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> index c6d3c327cc24..9d0f891b9b53 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -62,14 +62,20 @@ static void panthor_devfreq_update_utilization(struct=
 panthor_devfreq *pdevfreq)
>  static int panthor_devfreq_target(struct device *dev, unsigned long *fre=
q,
>  				  u32 flags)
>  {
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
> +	int err;
> =20
>  	opp =3D devfreq_recommended_opp(dev, freq, flags);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  	dev_pm_opp_put(opp);
> =20
> -	return dev_pm_opp_set_rate(dev, *freq);
> +	err =3D dev_pm_opp_set_rate(dev, *freq);
> +	if (!err)
> +		ptdev->current_frequency =3D *freq;
> +
> +	return err;
>  }
> =20
>  static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> @@ -130,6 +136,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  	struct panthor_devfreq *pdevfreq;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
> +	unsigned long freq =3D ULONG_MAX;
>  	int ret;
> =20
>  	pdevfreq =3D drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), GFP_KE=
RNEL);
> @@ -161,6 +168,7 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  		return PTR_ERR(opp);
> =20
>  	panthor_devfreq_profile.initial_freq =3D cur_freq;
> +	ptdev->current_frequency =3D cur_freq;
> =20
>  	/* Regulator coupling only takes care of synchronizing/balancing voltage
>  	 * updates, but the coupled regulator needs to be enabled manually.
> @@ -204,6 +212,14 @@ int panthor_devfreq_init(struct panthor_device *ptde=
v)
> =20
>  	dev_pm_opp_put(opp);
> =20
> +	/* Find the fastest defined rate  */
> +	opp =3D dev_pm_opp_find_freq_floor(dev, &freq);
> +	if (IS_ERR(opp))
> +		return PTR_ERR(opp);
> +	ptdev->fast_rate =3D freq;
> +
> +	dev_pm_opp_put(opp);
> +
>  	/*
>  	 * Setup default thresholds for the simple_ondemand governor.
>  	 * The values are chosen based on experiments.
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index a48e30d0af30..2109905813e8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -184,6 +184,12 @@ struct panthor_device {
> =20
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
> +
> +	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
> +	unsigned long current_frequency;
> +
> +	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
> +	unsigned long fast_rate;
>  };
> =20
>  /**


