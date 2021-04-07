Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28182356FB5
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 17:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353268AbhDGPDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 11:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353265AbhDGPDZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 11:03:25 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA8BC061756;
        Wed,  7 Apr 2021 08:03:14 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x4so269854edd.2;
        Wed, 07 Apr 2021 08:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n8RGLYZMduksKBcLvr5M1ezihPqZMf5N84YYv0yBZDI=;
        b=nkCbcdltSk3BCDNUVNYMEc183r+FP0i3CpQQhDgyy1XCuWWf6PphspAOvCHVaWBtGq
         ncno7wdoUG1T1UimhTpX1f9DusKs+mqaPbC+So/O6LeL50an/5oNFKhi7L8K85Doq786
         qUBuLHXyIxM4lzpvz5PqwCjWsI0jEYEq7rUrf3jWhZncnbFl2awxmOxEyQf7W7qruk73
         eeFuiyJQ4V5voAN5YSu7bZfiuieop81cgE9YYyhfJYYq+7IBX9c+9ms+yK3tkbLRwM/P
         LmZZ5ktjhHuBI+EHQFO9KO9tx1eCsgRwCcOyyrgygvfwX2KTZUv7VGai6n7jnLFZISrP
         6UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8RGLYZMduksKBcLvr5M1ezihPqZMf5N84YYv0yBZDI=;
        b=WJJSDFwlj84rGAcgcHtJTCOL5LXjh6U6i1femJAf1Nm6+ciYFdngrx97HsU+atkCle
         oN8rW8stgHz6hym+qGJ+IKhCtv7KaORSrgl+ykz1uawbJc/a7gSjXgnTXhXn/iMpt1oK
         u4hmmfPwv91nrN7ZF+UfDVTkd8x+V9whBeW5RSMi7UoWbQ5UlISiIn5MzMIXUCqwcyqa
         Fc0ofRK97hnGQjpr41uzB1iZTHLfzYzSGqJeWw91BZhPmL3DI7GVngziZEZ0mbnEJHMW
         ZH29LNddnji68qeyG1dWvn9SDMBSwdcHDox9ZdA9E2oNpNtiSRqjNgduGkE5CDDTG6VL
         1P2w==
X-Gm-Message-State: AOAM530iVhT5bGTEDae8+TXAA99pcnW5OlFxwH5KzYnRCm6DSHJ+3NFj
        DmQM9dXHODqlTDyditGCOQg=
X-Google-Smtp-Source: ABdhPJzBxs3zuApnnk8R/UanIbLlmYeFEpUUeQlODjt9JRG5whC0B0uQSBc+ondbTJ9OfziRBR6f8Q==
X-Received: by 2002:a05:6402:145a:: with SMTP id d26mr4972485edx.182.1617807792945;
        Wed, 07 Apr 2021 08:03:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id um13sm6319669ejb.84.2021.04.07.08.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:03:11 -0700 (PDT)
Date:   Wed, 7 Apr 2021 17:03:45 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Bixuan Cui <cuibixuan@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        jonathanh@nvidia.com, skomatineni@nvidia.com, mchehab@kernel.org,
        treding@nvidia.com, john.wanghui@huawei.com
Subject: Re: [PATCH] media: Fix compilation error
Message-ID: <YG3J0VbnYVy6mUlZ@orome.fritz.box>
References: <20210402074017.49009-1-cuibixuan@huawei.com>
 <c5b9fc40-0d52-4a31-2e73-14ec07434af4@xs4all.nl>
 <78d1052a-9f9a-315b-0bba-4628a6fb3ddb@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="n4Fq/TuBDaPwwMxN"
Content-Disposition: inline
In-Reply-To: <78d1052a-9f9a-315b-0bba-4628a6fb3ddb@nvidia.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--n4Fq/TuBDaPwwMxN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 07, 2021 at 04:45:34PM +0300, Mikko Perttunen wrote:
> On 7.4.2021 16.29, Hans Verkuil wrote:
> > On 02/04/2021 09:40, Bixuan Cui wrote:
> > > Fix the error:
> > >=20
> > > drivers/staging/media/tegra-video/vi.c:1180:4:
> > > error: implicit declaration of function 'host1x_syncpt_free' [-Werror=
,-Wimplicit-function-declaration]
> >=20
> > Against what tree is this being built? The mainline kernel doesn't have
> > host1x_syncpt_put, only host1x_syncpt_free.
>=20
> This change was done only very recently, it's in linux-next and submitted
> for 5.13. I missed this one host1x_syncpt_free call in vi.c, but Thierry =
has
> already applied an equivalent patch on his end so the issue should be
> resolved.

Indeed, this should be fixed as of next-20210406. This is going in
through the DRM tree in order to keep the change atomic and bisectible.

Thierry

--n4Fq/TuBDaPwwMxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBtyc8ACgkQ3SOs138+
s6EktA/6AgZpYvuz+LthbuPLuAjkcnkj9jkz87e8c1jJRxT9t2bFwpE2dJ6IbXGc
dk9JXqij1Y1R42pP5gTCXECs3d1BVQZ9wwKc/21xuhK15fpMWMy1bK2gf+3tnhoo
jUQvO9xphiVkhVSkjW+K0yZeuYFgCzmjKmgJBHhH0+ZJxDeHNr09m5f0I1YnoGHd
YsmlqxdujzLLYCgykzVdarhKxAPVNx2Y/1yO/S4vXwa0tFf4YihovUfJa0NT8juO
Cdr1T0JS5Cce85yTUIErXMiP4ocC9QSJEwZ2q0frt+7SgtPSSvC9Jlnu+pJF5+yP
pv8j+FIjggha5gZsoovLdFBkZdps7JkK4zbBG2UnZ+ZoYZPnEK7cSe1xCrjuU4va
xIrlnp8FfUTbQ+kt8cSzfNO1ZAbZmggwPYnX0eFXSxqmHzqi+IL9Zug2JTtGsCxH
oKcGp1QEhK/WnwAc8Gvdw7LW56lxOcXj4gb3i9VqjkIneRZLzd8GQDKtROo4rBox
bbtIN1pT2xKqW39/zOK1BuYfw1+gFazfgiBf7NQQ/Nd7HZWZ2Fk4jH85O9NqpJK8
KsyLlpOwWmmINJeLZJ8rgXR2nxzCfvQX+nrzQB83ARm/YWKs/pbYCNgIlab9I3pc
YUgMYIhpBgWX2Toyg1CUFA/U1SjBDlL40Dh0sgFXK+j/tXg2WGs=
=DwKo
-----END PGP SIGNATURE-----

--n4Fq/TuBDaPwwMxN--
