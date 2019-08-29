Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8054DA1FA7
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 17:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfH2PtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 11:49:07 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45708 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfH2PtH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 11:49:07 -0400
Received: by mail-ed1-f68.google.com with SMTP id x19so4531610eda.12;
        Thu, 29 Aug 2019 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OMFH7+qjxeCQGYMrtHVwq2Z9xuNxBOoK9zXTLfD2WVQ=;
        b=rfOp5laI6/xjsO80X1sxdmMFx8QGuwGro3BfHKTFabWhPNW3y6spDEyUMs9jP+m6cx
         VWLJgGzBoLMVGS0Lm3dzSyWite+/psRInRKDD1A3owUYD8DYdKqUVVYqmRvnADiSquxW
         0AnhLJifOSFFVEE3ahY4p/Kioc1hwOPhvJNeGnbY04iGetKNRa5mC0YtlUfaqzou+xAZ
         FgbeEQa7vWqXAlVpxyu79T/ff3v/KCWx1mhl67SAMJ6usW0VjvySueKg1AaKLK3DQMsD
         thWNjgHYY5KHhHg7+YFfd9lg2SqoTDJFt9JZr+SbSP21BHcds0gEKCO/hKbmSsf1AaTj
         hw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OMFH7+qjxeCQGYMrtHVwq2Z9xuNxBOoK9zXTLfD2WVQ=;
        b=MogBmn/1vpax3j7qayfuXGKP0tqspp3E0+C1/kP+U8TViELMDfFzaGVdvHESvS2LlM
         PHKsPYy9qHlMv2dHBcHRW3XL9mVDyLAasPibQxWUV+qr/iyFKx9XCO9z/7ShgkMBRK76
         nW+bkkcV/PsviqFEJgSj9PibuKR6/+C2Inp8PJdcZZ/ogzf71dWPZcgZqrn/CJpQVuZQ
         uoHVujwNC4roiAumXn600B2pouhlm1puKgKg6sQ5QfD+LuX6vZjItPeAFJKUAeIjJt4G
         kqHwDHucDM/oxKCU7IuAjfnFGk03illifKGK6vYjnkoRuoWR7wS3C+wgaEBGBnsPQLjV
         vhlw==
X-Gm-Message-State: APjAAAX5ltCxNIWsINK1TizIuqTTTlfR+4Ug/6gGIbcPZv6X8CHkhi/9
        CkbWjc6175MqfSoHLrhQgvU=
X-Google-Smtp-Source: APXvYqwI5co88zXUDufxRjlo+vg5MbEMZisIAz99qPUitWfRikhAaOML4+k5Qz+V/aLg9T/WPdMS2g==
X-Received: by 2002:a17:906:185b:: with SMTP id w27mr8732892eje.203.1567093745064;
        Thu, 29 Aug 2019 08:49:05 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
        by smtp.gmail.com with ESMTPSA id a22sm501256edt.88.2019.08.29.08.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 08:49:03 -0700 (PDT)
Date:   Thu, 29 Aug 2019 17:49:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        YueHaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        robin.murphy@arm.com, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
Message-ID: <20190829154902.GC19842@ulmo>
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
 <20190829124034.GA19842@ulmo>
 <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2019 at 04:58:22PM +0300, Dmitry Osipenko wrote:
> 29.08.2019 15:40, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
> >> On 8/26/19 3:31 PM, YueHaibing wrote:
> >>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
> >>> to m will set IOMMU_IOVA to m, this fails the building of
> >>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
> >>>
> >>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
> >>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
> >>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
> >>>
> >>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
> >>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
> >>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
> >>>
> >>> Reported-by: Hulk Robot <hulkci@huawei.com>
> >>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
> >>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU sup=
port")
> >>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >>> ---
> >>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/stagin=
g/media/tegra-vde/Kconfig
> >>> index ba49ea5..a41d30c 100644
> >>> --- a/drivers/staging/media/tegra-vde/Kconfig
> >>> +++ b/drivers/staging/media/tegra-vde/Kconfig
> >>> @@ -1,9 +1,9 @@
> >>>  # SPDX-License-Identifier: GPL-2.0
> >>>  config TEGRA_VDE
> >>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
> >>> -	depends on ARCH_TEGRA || COMPILE_TEST
> >>> +	depends on ARCH_TEGRA
> >>
> >> What happens if you drop this change,
> >>
> >>>  	select DMA_SHARED_BUFFER
> >>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
> >>> +	select IOMMU_IOVA if IOMMU_SUPPORT
> >>
> >> but keep this change?
> >>
> >> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
> >> work when compile testing this tegra-vde driver.
> >>
> >> Haven't tried it, but making sure that compile testing keep working is
> >> really important.
>=20
> The driver's code compilation works okay, it's the linkage stage which
> fails during compile-testing.
>=20
> > Yeah, that variant seems to work for me. I think it's also more correct
> > because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
> > IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
> > then IOVA is not needed either, so the dummies will do just fine.
>=20
> Am I understanding correctly that you're suggesting to revert [1][2] and
> get back to the other problem?
>=20
> [1]
> https://lore.kernel.org/linux-media/dd547b44-7abb-371f-aeee-a82b96f824e2@=
gmail.com/T/
> [2] https://patchwork.ozlabs.org/patch/1136619/
>=20
> If we want to keep compile testing, I guess the only reasonable variant
> right now is to select IOMMU_IOVA unconditionally in all of the drivers
> (vde, host1x, drm and etc) and then just ignore that IOVA will be
> compiled-and-unused if IOMMU_SUPPORT=3Dn (note that IOMMU_SUPPORT=3Dy in =
all
> of default kernel configurations).

Agreed. I think we should just select IOMMU_IOVA unconditionally. We
really do want IOMMU_SUPPORT always as well, but it might be nice to be
able to switch it off for testing or so. In the cases that really matter
we will be enabling both IOMMU_SUPPORT and IOMMU_IOVA anyway, so might
as well select IOMMU_IOVA always. It's not terribly big and I can't
imagine anyone wanting to run a kernel without IOMMU_SUPPORT for
anything other than testing.

Thierry

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1n8+oACgkQ3SOs138+
s6Hbfw//W5zV6nU1EoH+SEkePE93YLIaRnk0SQKzSBCTDuVDIXnRE3iqhCRDH/Fg
AInyjQFdbHKGt0AWTlpijP7gaEgZDP66trt1BBrJLwaF9/PCM/cKzyY2XUjuIMxN
rCBvh/jzRcJPb4e9mQAmyJGcrw/MnM+xn+Vk2zPpDA/Km5jQ6NoIR99HdcJ7JBxr
sncQof6st+gMIarbZ5z9bxG9x6tjUJ6/iJREqKqufxL4TpwCtzuvdzioXSRUF3vz
u8zGA7dysvAGjPPY/lNTQvFq+HJz8p5BaLDhYc+YH4u/OuvNU8dlnG6nqPiots9l
yC6K9VRJR0J7q5J+sAwwMggW4nKGP3f3lnTZbewJkAilA4el4u/YabU+Wh6x+VPz
2gDIfni/lRgJZ8+fxkAF0NQdeKE/zEyCxPngKbEwaFVkIF9JSwdaiNbKwnal5b1I
24e1TkDHP089dfOS8C1RfUC5+G9JfwkorC1olf2SJ4GtsG12bE94viDLf/VPYPt5
JCsRXvP8cGjwJmu6sTdxtiHYjYc+WD/uFLe6R+mJFHz7SsCbgU5KwqkBVBYEzpu7
KBHq9GciM1tokCVdt5XO0j2Oq8X+MerHkX/jEiyFVcCovt/6aHrNgCkxOzmklo5q
2rISJqrNQO+cw88/i8fW5i3bZpAoJoHemz4SgQdZzdxaFgVNyTg=
=Pgi/
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
