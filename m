Return-Path: <linux-media+bounces-36466-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6657AF03D5
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 21:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B26167A4097
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 19:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE19280022;
	Tue,  1 Jul 2025 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="COv/WEvL"
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8407A25B1FC;
	Tue,  1 Jul 2025 19:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398365; cv=none; b=jLtG+eYqpt2QjEXH0KNq4rSaebw2DiUKR2nUuZLLOVQyekdH5e6Qfhj4vEaXN1qOf8U3M3sqGK06r/vyGCfsRQifiKlb6KLc+EhTvKpQUCwgiIS3cqoKxGQXON5hII0PI+alEot7A2AbmBCIVIWUGvt284ISAwGRzDHcRKUcGnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398365; c=relaxed/simple;
	bh=niNzJeXLvd5lsHTembyVglZRkYxCH3CvL+tZgUzKEfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TaX77UP326RdMtL3aLAclr9rbfVDTJTfB+SgO0WKqbUJdV+hO2RIXtPbFY7Tgxr27ySxF0MSzhJqjWvEQpTw7RVy3nd6FnKmGngZ2WQNYMDC97CZQSBmvdmuJFlVDjIx8r0IlThsrlaasIYuEPIgBAli68tGLBRu15z7Y8ab42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=COv/WEvL; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dj2RXbZ/Tv5yAxHz/6WWadAXm0f+rEasqd5wSxNrNfk=; b=COv/WEvLADeJ6fd21KY0S80AoD
	XAN2jdqZDbmJLuHjkwzeQOPC/J+uLnEp4cOPZMr64nMBTTT7O9tyv1Eo5P3D9VzrPR9ii5R68h9u8
	x0wMgRHL8MjOUXKpx0bTeMlN96lBxW0hVtxOE/OolJEMZsQgACj71Dk+raYFqFUv+5Gt3KAdnqG5O
	zQjvfJUL9d9YX9i6ONayuZX4GPHZyO0Ot9qQXBgoQ4iOfk84Nb3DKg+BwfGpR8mQuFu0N7a1Z0iag
	J4Vn9kQA332jEckCkT25MeMr0VHE/7KDpvPcC6ylfJlD/Vwf3GgBc+asJkJag5aiUgs2e71ApfHnG
	sFw0nDZw==;
Received: from i53875bc7.versanet.de ([83.135.91.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWgi0-0007Fd-TC; Tue, 01 Jul 2025 21:32:00 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>,
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v7 03/10] accel/rocket: Add IOCTL for BO creation
Date: Tue, 01 Jul 2025 21:31:59 +0200
Message-ID: <8888010.K2JlShyGXD@diego>
In-Reply-To: <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
References:
 <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <20250606-6-10-rocket-v7-3-dc16cfe6fe4e@tomeuvizoso.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 6. Juni 2025, 08:28:23 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Tomeu Vizoso:
> This uses the SHMEM DRM helpers and we map right away to the CPU and NPU
> sides, as all buffers are expected to be accessed from both.
>=20
> v2:
> - Sync the IOMMUs for the other cores when mapping and unmapping.
>=20
> v3:
> - Make use of GPL-2.0-only for the copyright notice (Jeff Hugo)
>=20
> v6:
> - Use mutexes guard (Markus Elfring)
>=20
> v7:
> - Assign its own IOMMU domain to each client, for isolation (Daniel
>   Stone and Robin Murphy)
>=20
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---

> diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/roc=
ket_gem.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..61b7f970a6885aa13784daa12=
22611a02aa10dee
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_gem.c
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_utils.h>
> +#include <drm/rocket_accel.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iommu.h>
> +
> +#include "rocket_device.h"
> +#include "rocket_drv.h"
> +#include "rocket_gem.h"
> +
> +static void rocket_gem_bo_free(struct drm_gem_object *obj)
> +{
> +	struct rocket_device *rdev =3D to_rocket_device(obj->dev);
> +	struct rocket_gem_object *bo =3D to_rocket_bo(obj);
> +	size_t unmapped;
> +
> +	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);

This should probably be
    drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);

as pages_use_count is of type refcount_t since
commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")

Heiko



