Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3252549CC
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 17:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgH0PpL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 11:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726924AbgH0PpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 11:45:07 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F55EC061264;
        Thu, 27 Aug 2020 08:45:06 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id f24so5320237edw.10;
        Thu, 27 Aug 2020 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
        b=AMPa8N1AoD9YB7fIeGgmF/cNowE7jTvmdnSlHkNXqWgTuHGj1LDyz6RY9dorKnL/fN
         Z30pyVOeUrs4fDWQn3hrs1dZvRxrbplQZbImRrNJNHdCgPH/5mhyGT43pJeH7xkrp6Sb
         MZBcScUrs/MJyLn42oxJRGaNJrvbJexbN1cPg2Cxkb3XtnP+LC3+ovtJFuj8hqptSUOv
         CcXCkksNHNjATY9ob/FlyIIO46cj2X4u3uwybNf4+PMBFfX+68NaraOwOxzF+DfICVCM
         VN25BNvOEthy10Y2DCDS0ilfaqRXmZ3ernBzLlAAUqcBNegk+XnORCZVVMope4D1TZQ+
         iXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
        b=f6srJWownTppSnU2+3MptZvEHdePKHnvbEXq54deOOW5/FFNInOh2MhO+dlDMKLC4V
         TpRtYq8GsF1rgDEC4DkwD7n0aDcdbXVc15lBXl1GBDykVcaE/e1y01mVsOpP9mvv6P+u
         W1oxEvOT6F0u88HAeUZCmnJb1c2/FFxOWWgmin3ck/4zz85xvas1gRWE0mRzVcyjYzKS
         iGhjfFdHSUGyXEtosG+HoQXrpK8nwjTtQmDlFkSSAtpQ7lG6Oxn+ioaEe/A85N1P6WP/
         xrheaxSSYgWM2iylX+hC7Lr0f6OTUZ/sQmVwgqd/za+anrKEVy2zmMdtLJhg4YoOaRnP
         kA2A==
X-Gm-Message-State: AOAM531gg3WXCpmSqM85jFSKewr0BVAeTYfxwSmLzJdvcUldxs+gBKq8
        xqZVe2tQfvthzkTgT68kYJQ=
X-Google-Smtp-Source: ABdhPJxRtAe6Y1ma+0338eCNyd9I0m6G1oP+UGM2tA/8xgx0U3OYLFtKYBAAwxNFg0VrZz+x/RmEmw==
X-Received: by 2002:a05:6402:3088:: with SMTP id de8mr20472098edb.88.1598543104973;
        Thu, 27 Aug 2020 08:45:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u4sm1804409edt.11.2020.08.27.08.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 08:45:03 -0700 (PDT)
Date:   Thu, 27 Aug 2020 17:45:02 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     hch@lst.de, joro@8bytes.org, linux@armlinux.org.uk,
        will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        jonathanh@nvidia.com, vdumpa@nvidia.com, digetx@gmail.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
Message-ID: <20200827154502.GA1660457@ulmo>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

We can't do that yet because it will currently still break for use-cases
such as display where we don't properly set up identity mappings during
boot. The result is that the dma-iommu code will enable translations
before the driver gets a chance to set up any mappings and if the
display controller was left on by the bootloader, scanning out a splash
screen, this causes faults between the point where dma-iommu is being
set up for the display controller and where the display controller
starts mapping its own buffers (rather than the ones mapped by the
bootloader).

That said, I do have a series that I've been carrying around for longer
than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
you could drop this particular change from your series so that I can
keep working on resolving the identity mapping issues first.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9H1PwACgkQ3SOs138+
s6GMrhAAqb0k0/ZQ/J5VIibNnM1oZSG1CTD/3tuwm94u1T1J++b71xlQpN0U7Fru
gJNX22olSrdpzdecS9LQ3Twqu4qgPzLazvenfBLxxrDuwS466j3hbbW8cG1Tlb/m
6lEbacziO0f91GP7ao5dAG0HIPZvIYfU1PIA/eOPnBcOlFVvWVfCnN6gOjPOSocz
20X/S1W6d5Jo7x2T0PtA0TFpD9BZVzjZA2q9XVzPSxkqLfEVMU00Yp/TnHySfWJ3
+sfRxeaUl5Ysjrtkd5YeFoIGlVctyKIKtGCIR60HU4bPlB4cdaVaaJBVkJAM7kQh
p+UGnGgl09/DyAe57qVaEWsbcXwHaxeveFmdjMHn9y0veGidzQPg0KtDUL2k7D3V
NXHKnets8HdkODT8PjTSbS3ELLEHf1GxsYAcR9aHvV1FLMl3c/8ZmMA1RZ5CIAbD
rmFaxQENmVHUev0lQnwlYP7Wwt2YyXc62L9UfyhrIkQjHmm/D+uIlPmjkr/YDreI
xndQ7H0OgVFKuc9nfSpnBOgIEeLDNr2AA59wzUxHikB+5MfDyxOk5TqnsjdcqSqr
b8257AC5ZWe79OOD0/hwDAlmSlx/hB3lO2kmm3BhLX+5tOTQv7vTSgr9BTppkZrD
dQHiT2TjMsiQyBhXhceazD0hhSAC3MSh1+TpgLDrBy2Sh96zUQ8=
=Dzgn
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
