Return-Path: <linux-media+bounces-17535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2C96B3E8
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F581F24C48
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C72A17BECA;
	Wed,  4 Sep 2024 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ig3y8/M8"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7F52F70;
	Wed,  4 Sep 2024 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725437274; cv=none; b=XmMAv8Bgx35YHjz61WxoAZCVoFwIM72PMvKEnbWOTfYpQtaSyDZvqt6hQ9wMG8gRSHQJDcHN+ipuT83kNnNS+i286T1FcdtpWI+qc1OoQO9O4zE9UeJrhFt2Hk+P0lhIIXr08ifEUcEweLGLJyib373Fd3A766fceO+nqq77JIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725437274; c=relaxed/simple;
	bh=yIZHX3eBXK8zzAS3yQQPOB9+lqHIWH64eVUUSWwPUX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B2RL1iEQuN1pq8h5PpBumKIxednNn+SsEhuf/AUf8zv8xHyyWu/O3VoNbI+lRtNTCjkM2IDwB+xejJK1bRc9S1qvyIJztewjNMz5u08EzdDynvCiof2BhJYhYB8DrciwulKUr4vPE9c+JdFTSdrjQjnH1DH82UrrcFcfKBRU8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ig3y8/M8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725437270;
	bh=yIZHX3eBXK8zzAS3yQQPOB9+lqHIWH64eVUUSWwPUX8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ig3y8/M8mLHuyDuF26oOvQqp19c7SrU7XkCJbJXqFPRD4jMtxnr8Qld/yQDpuxicC
	 nDMX6UmM5D9mo1Fv6pFcLBv6Bz67hns/sfYHF3MDCA5YmL3WMZskfyMq0CWYTZaRMH
	 I0BgkkuMIdyoWj8mpKMAfYje8wFeEgkJZzcTCP3YPl8HTXp6wXWrVuV//cLN9lcbae
	 rCHquOB6EHHfNToZh/TxKMxWPGjhLn9UD1Ataw5jZSr114kZT3dacZJ2M3tx7xw6FA
	 rZm2D347GVeopyRsmv3LPsTi56GDUuBq+9HCj/GuFb62+RaKtAA3Uh4VH1O6ovBvu1
	 hwqf0xtxdKofQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60C7A17E0F95;
	Wed,  4 Sep 2024 10:07:50 +0200 (CEST)
Date: Wed, 4 Sep 2024 10:07:43 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v5 4/4] drm/panthor: add sysfs knob for enabling job
 profiling
Message-ID: <20240904100743.225f1837@collabora.com>
In-Reply-To: <20240903202541.430225-5-adrian.larumbe@collabora.com>
References: <20240903202541.430225-1-adrian.larumbe@collabora.com>
	<20240903202541.430225-5-adrian.larumbe@collabora.com>
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

On Tue,  3 Sep 2024 21:25:38 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> This commit introduces a DRM device sysfs attribute that lets UM control
> the job accounting status in the device. The knob variable had been broug=
ht
> in as part of a previous commit, but now we're able to fix it manually.
>=20
> As sysfs files are part of a driver's uAPI, describe its legitimate input
> values and output format in a documentation file.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  Documentation/gpu/panthor.rst         | 46 +++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_drv.c | 39 +++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/gpu/panthor.rst
>=20
> diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
> new file mode 100644
> index 000000000000..cbf5c4429a2d
> --- /dev/null
> +++ b/Documentation/gpu/panthor.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> + drm/Panthor CSF driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +.. _panfrost-usage-stats:
> +
> +Panthor DRM client usage stats implementation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The drm/Panthor driver implements the DRM client usage stats specificati=
on as
> +documented in :ref:`drm-client-usage-stats`.
> +
> +Example of the output showing the implemented key value pairs and entire=
ty of
> +the currently possible format options:
> +
> +::
> +     pos:    0
> +     flags:  02400002
> +     mnt_id: 29
> +     ino:    491
> +     drm-driver:     panthor
> +     drm-client-id:  10
> +     drm-engine-panthor:     111110952750 ns
> +     drm-cycles-panthor:     94439687187
> +     drm-maxfreq-panthor:    1000000000 Hz
> +     drm-curfreq-panthor:    1000000000 Hz
> +     drm-total-memory:       16480 KiB
> +     drm-shared-memory:      0
> +     drm-active-memory:      16200 KiB
> +     drm-resident-memory:    16480 KiB
> +     drm-purgeable-memory:   0
> +
> +Possible `drm-engine-` key names are: `panthor`.
> +`drm-curfreq-` values convey the current operating frequency for that en=
gine.
> +
> +Users must bear in mind that engine and cycle sampling are disabled by d=
efault,
> +because of power saving concerns. `fdinfo` users and benchmark applicati=
ons which
> +query the fdinfo file must make sure to toggle the job profiling status =
of the
> +driver by writing into the appropriate sysfs node::
> +
> +    echo <N> > /sys/bus/platform/drivers/panthor/[a-f0-9]*.gpu/profiling
> +
> +Where `N` is a bit mask where cycle and timestamp sampling are respectiv=
ely
> +enabled by the first and second bits.

This should probably be documented in
Documentation/ABI/testing/sysfs-driver-panthor too.

> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index e18838754963..26475db96c41 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1450,6 +1450,44 @@ static void panthor_remove(struct platform_device =
*pdev)
>  	panthor_device_unplug(ptdev);
>  }
> =20
> +static ssize_t profiling_show(struct device *dev,
> +			      struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +
> +	return sysfs_emit(buf, "%d\n", ptdev->profile_mask);
> +}
> +
> +static ssize_t profiling_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t len)
> +{
> +	struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +	u32 value;
> +	int err;
> +
> +	err =3D kstrtou32(buf, 0, &value);
> +	if (err)
> +		return err;
> +
> +	if ((value & ~PANTHOR_DEVICE_PROFILING_ALL) !=3D 0)
> +		return -EINVAL;
> +
> +	ptdev->profile_mask =3D value;
> +
> +	return len;
> +}
> +
> +static DEVICE_ATTR_RW(profiling);
> +
> +static struct attribute *panthor_attrs[] =3D {
> +	&dev_attr_profiling.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(panthor);
> +
>  static const struct of_device_id dt_match[] =3D {
>  	{ .compatible =3D "rockchip,rk3588-mali" },
>  	{ .compatible =3D "arm,mali-valhall-csf" },
> @@ -1469,6 +1507,7 @@ static struct platform_driver panthor_driver =3D {
>  		.name =3D "panthor",
>  		.pm =3D pm_ptr(&panthor_pm_ops),
>  		.of_match_table =3D dt_match,
> +		.dev_groups =3D panthor_groups,
>  	},
>  };
> =20


