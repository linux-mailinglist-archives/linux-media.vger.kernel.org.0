Return-Path: <linux-media+bounces-32912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D170ABD57F
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 12:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83F6E178923
	for <lists+linux-media@lfdr.de>; Tue, 20 May 2025 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ACB280CCE;
	Tue, 20 May 2025 10:42:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4F274673
	for <linux-media@vger.kernel.org>; Tue, 20 May 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737750; cv=none; b=bDxsiw/yoXrsGaiVb+RoBw7yEQ6YE6KHUhWYdx6sUAf1PPVv9X0+obNhpXCPjhuMNQ/GJ0M07TszK0N1zl55eYHWLIkbZKHidag/xiV+QuwgWy/cQKBttC8RYDLFyVXdxip+7FU2AiOvMM5EFVVfuC9H+a1B28CJ5AhLEJyLcZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737750; c=relaxed/simple;
	bh=ypsgp/8EOQfhR3gpKtdjHjDSjKXledeokdgkhyDij6s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j1pUZVRQA6sLlMheXAYz7w60meOF1kptrdfrjTiqvUJj468zwaKN0bRhgyLyYJiUoTU6pAD+hD5KWb3S6gXd8SHcimVh2L1/QZ/QcUXJwGtedShNRfs40asROQ8fPBb9CmLPz2N9IART09BTn1DGF2IzTExLY8ldsiRjQCAioOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1uHKPz-0001aN-MM; Tue, 20 May 2025 12:41:55 +0200
Message-ID: <e7c08305612e7323ca9d9ff6c44f3e2b63f171ff.camel@pengutronix.de>
Subject: Re: [PATCH v5 08/10] accel/rocket: Add IOCTLs for synchronizing
 memory accesses
From: Lucas Stach <l.stach@pengutronix.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Oded Gabbay
 <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Sebastian
 Reichel <sebastian.reichel@collabora.com>,  Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Tue, 20 May 2025 12:41:47 +0200
In-Reply-To: <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
	 <20250520-6-10-rocket-v5-8-18c9ca0fcb3c@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Hi Tomeu,

Am Dienstag, dem 20.05.2025 um 12:27 +0200 schrieb Tomeu Vizoso:
> The NPU cores have their own access to the memory bus, and this isn't
> cache coherent with the CPUs.
>=20
> Add IOCTLs so userspace can mark when the caches need to be flushed, and
> also when a writer job needs to be waited for before the buffer can be
> accessed from the CPU.
>=20
> Initially based on the same IOCTLs from the Etnaviv driver.
>=20
> v2:
> - Don't break UABI by reordering the IOCTL IDs (Jeff Hugo)
>=20
> v3:
> - Check that padding fields in IOCTLs are zero (Jeff Hugo)
>=20
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  drivers/accel/rocket/rocket_drv.c |  2 +
>  drivers/accel/rocket/rocket_gem.c | 80 +++++++++++++++++++++++++++++++++=
++++++
>  drivers/accel/rocket/rocket_gem.h |  5 +++
>  include/uapi/drm/rocket_accel.h   | 37 ++++++++++++++++++
>  4 files changed, 124 insertions(+)
>=20
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/roc=
ket_drv.c
> index fef9b93372d3f65c41c1ac35a9bfa0c01ee721a5..c06e66939e6c39909fe08bef3=
c4f301b07bf8fbf 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -59,6 +59,8 @@ static const struct drm_ioctl_desc rocket_drm_driver_io=
ctls[] =3D {
> =20
>  	ROCKET_IOCTL(CREATE_BO, create_bo),
>  	ROCKET_IOCTL(SUBMIT, submit),
> +	ROCKET_IOCTL(PREP_BO, prep_bo),
> +	ROCKET_IOCTL(FINI_BO, fini_bo),
>  };
> =20
>  DEFINE_DRM_ACCEL_FOPS(rocket_accel_driver_fops);
> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/roc=
ket_gem.c
> index 8a8a7185daac4740081293aae6945c9b2bbeb2dd..cdc5238a93fa5978129dc1ac8=
ec8de955160dc18 100644
> --- a/drivers/accel/rocket/rocket_gem.c
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -129,3 +129,83 @@ int rocket_ioctl_create_bo(struct drm_device *dev, v=
oid *data, struct drm_file *
> =20
>  	return ret;
>  }
> +
> +static inline enum dma_data_direction rocket_op_to_dma_dir(u32 op)
> +{
> +	if (op & ROCKET_PREP_READ)
> +		return DMA_FROM_DEVICE;
> +	else if (op & ROCKET_PREP_WRITE)
> +		return DMA_TO_DEVICE;
> +	else
> +		return DMA_BIDIRECTIONAL;
> +}

This has copied over the bug fixed in etnaviv commit 58979ad6330a
("drm/etnaviv: fix DMA direction handling for cached RW buffers")

Regards,
Lucas

