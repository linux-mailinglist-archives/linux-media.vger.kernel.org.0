Return-Path: <linux-media+bounces-35078-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86CADCC9D
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 15:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E1016C18F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 13:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF5D2E266E;
	Tue, 17 Jun 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="Fkvmjd2w"
X-Original-To: linux-media@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B24502A
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165511; cv=none; b=n+9oTpPyzczTsJCsaTH5Kw77bvezn1glWzCQDoJNFpE7QT+yDD1ZPtkZtTbHEmCRcgLuIH3gNGTZ0OOZoyddcB24o04mWNrdwPQLFmG1oK/daSe3MRgErZQDYZLdTINsPpJLTVlCDTDtu0ynTF7LrquWH+9xnOzBg7L9JxG56eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165511; c=relaxed/simple;
	bh=YtoDAWYSDZkOd781YVW7hg/ioUKOFG6cn0xldzGgFz8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KdT2ejXzbql6seML7sjJBgj+gLHIMorUtm8BdmvIKDk8/sAvavF4JUZ4kd8l1jlm2gMrc2eGYrTBCA1ad8/PWUCnpgGM8mU4zmJR8FW6mNBdu8RwtXPpmMAa4e7MEoYZdFElbNwgM2uSO/QiByVXxDSLO9DiJRJ4uPCZGGEyJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=Fkvmjd2w; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1750165497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zjtqGhgjnm5yBwbIgqfOiHPrC8nlYTo3NpdAZ+T86I=;
	b=Fkvmjd2w2NQ8I5Hn2AJHECacEiSJ1Ao16vtWobrQ89RmfTW9kxU8gLMlO+MMDsSdqAcHRM
	ZSOeUUHWE21vVjLIgdR/pl48JrO9JuhNQ4I9WvjudTFO2fyrLI3m0cofplneVJR2gZ4BG5
	DjWx1auT9lzJ3gw0gYvyyzmkDQZqg35+bLkZ3AouwWgpUhv/p+K6TfuYXbZBHcAJM0gB39
	Y0/Q0KcW5E4RSrcfuM51EuSEvtnLGnqp9FsB84aO5Y7YWBZkVnOl/92OdbpmahOS+gxAOv
	7CSSpYfKxL9oxN0n8jvcYwZktO3rtX9xc9oC8pI461JhMWyNVJ6ZfCBI60hNwQ==
Content-Type: multipart/signed;
 boundary=95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 17 Jun 2025 15:04:44 +0200
Message-Id: <DAOTVW4YEC5Q.STXG6APE0YGN@cknow.org>
Cc: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <heiko@sntech.de>, <nicolas.dufresne@collabora.com>,
 <p.zabel@pengutronix.de>, <mchehab@kernel.org>, <joro@8bytes.org>,
 <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <kernel@collabora.com>
Subject: Re: [PATCH 3/5] iommu: Add verisilicon IOMMU driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-4-benjamin.gaignard@collabora.com>
In-Reply-To: <20250616145607.116639-4-benjamin.gaignard@collabora.com>
X-Migadu-Flow: FLOW_OUT

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 16, 2025 at 4:55 PM CEST, Benjamin Gaignard wrote:
> Verisilicon IOMMU hardware block can be found in combination

Can there be only 1 hardware block or is multiple possible?
If only 1, then I'd start with "The Verisilicon ...".
If more then one, then I'd use "blocks".

> with hardware video codecs (encoders or decoders) on
> different SoCs.

This makes it sound like it can also be used with non-Verisilicon codecs
and based on the DT binding description, I get the _impression_ that
that is not the case?
But it's actually not clear to me if that's the case or not.

> Enable it will allows to use non contiguous memory

"Enabling it will allow us to use non ..." or "Enable it to allow [the]
use of non ..." or "Enabling allows the use of non ..."

> allocators for Verisilicon video codecs.

And the wrapping of the whole commit message is not following the
standards.

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/iommu/Kconfig     |   8 +
>  drivers/iommu/Makefile    |   1 +
>  drivers/iommu/vsi-iommu.c | 900 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 909 insertions(+)
>  create mode 100644 drivers/iommu/vsi-iommu.c
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 0a33d995d15d..4cf4504dcc25 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -383,4 +383,12 @@ config SPRD_IOMMU
> =20
>  	  Say Y here if you want to use the multimedia devices listed above.
> =20
> +config VSI_IOMMU
> +	bool "Verisilicon IOMMU Support"
> +	depends on ARM64
> +	select IOMMU_API
> +	select ARM_DMA_USE_IOMMU
> +	help
> +	  Support for IOMMUs used by Verisilicon video decoders.
> +
>  endif # IOMMU_SUPPORT
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 355294fa9033..68aeff31af8b 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_IOMMU_SVA) +=3D iommu-sva.o
>  obj-$(CONFIG_IOMMU_IOPF) +=3D io-pgfault.o
>  obj-$(CONFIG_SPRD_IOMMU) +=3D sprd-iommu.o
>  obj-$(CONFIG_APPLE_DART) +=3D apple-dart.o
> +obj-$(CONFIG_VSI_IOMMU) +=3D vsi-iommu.o
> diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
> new file mode 100644
> index 000000000000..f2fa1197916c
> --- /dev/null
> +++ b/drivers/iommu/vsi-iommu.c
> @@ -0,0 +1,900 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +

No copyright statement? (or an informational header block?)

Cheers,
  Diederik

> +#include <linux/clk.h>
> + <snip>

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaFFn8gAKCRDXblvOeH7b
bgL/AQC2+pfAq9y+rYClfqDV6JafnSW/BsK29aRiz2WgF9RTPwD/V9oxqTRqrf49
ZD2TLkIPP43QDiTJOJ66STMrp/UUAAw=
=lqws
-----END PGP SIGNATURE-----

--95b0041d640d325258bcee1396591f4111b720f6b27198e107b759077302--

