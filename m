Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF2A7C0138
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 18:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbjJJQIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 12:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233576AbjJJQIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 12:08:37 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AA49EB;
        Tue, 10 Oct 2023 09:08:34 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-323ef9a8b59so5554234f8f.3;
        Tue, 10 Oct 2023 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696954113; x=1697558913; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KciAMRf813ZegYwZo69Zen20WMwLpOEWtLW30hTwQtw=;
        b=gZ0jBAZmtKHz47NTuUb3CGZSoIN4kD3c98+vOEEvTIZn6venfJ/EZNxe5WD0zYhiHy
         OhEUvWiwqNuOjrmT/so74sHmOnhz0IJzLNudBMNsd1+VJY6uNbyVFXaScOnt47PnB9m8
         ysOLWk8Y7/mT1wxc6DQk4BYSw7jg2DzjRXElQ+MjIJeBDc+B9+P1nQwMO4yDEV+lcn3v
         4kvUHfl1GZQUiGfO0UCIwFn5p5ClFxsQmyzL3En+DdK1cORK8Nb1l4d7/G32B7ILYq1G
         tucowJt9zmpgHN7gxG6R+WOD9ursOA5kKTguRbwet0MdMW0mM1X2ZHu/9pEvV9edXUj2
         EH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954113; x=1697558913;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KciAMRf813ZegYwZo69Zen20WMwLpOEWtLW30hTwQtw=;
        b=BKqOqstseGhN4epLVMq/j7zCvQp23jpCfawV+9Ic6YwnQI6jT6d/0pt3ZXzSXUtXQK
         j/8NjLd2Xi3aKTEKh3qtplPeZqxV1lATG2k97MDXl8doNnjYznsixa6Bchr3Va44i9Q/
         ommaXIcoqo3ibLpgqi7oUpZ+5vwKhxnHJwQGssSXyxH2i1wsQRxaTPs4Rd17a+SdotGi
         QFNzfzbfPwt5wMa2C7dMa1zri/ImGcdZF7FUeOlRjFeSZNEp23fWYNwyDJ4ZDzFd1bcO
         3YXFDsm/Mg4/jEiRI21WqWnrW43LnsB+9Ez37mjiDa/yKG2xOzMfOMShzC6dnmbYc3T0
         X56w==
X-Gm-Message-State: AOJu0Yx/9PZZIFtOy5/z9qVhSZnM7PsGBJ4dzZVLr0YhRjQ2DBbvGbMY
        gldqarqA43EzPrzbNVO+58xiMKi9/Hk=
X-Google-Smtp-Source: AGHT+IEE2T7NF36+dgYtxgB14/X2M+xHn7SEBZckZhElz1nk/AZwAyK4cN8rfIcPlOEOvM1qMada/g==
X-Received: by 2002:a05:6000:cce:b0:32d:2489:911f with SMTP id dq14-20020a0560000cce00b0032d2489911fmr1702976wrb.15.1696954113090;
        Tue, 10 Oct 2023 09:08:33 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b003258934a4bcsm13056556wrp.42.2023.10.10.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:08:32 -0700 (PDT)
Date:   Tue, 10 Oct 2023 18:08:30 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH -next] media: tegra_cec: fix the return value handle for
 platform_get_irq()
Message-ID: <ZSV2_hVbUSrYGA8X@orome.fritz.box>
References: <20230801135253.456322-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lZ2kD5tAJbjEJdaD"
Content-Disposition: inline
In-Reply-To: <20230801135253.456322-1-ruanjinjie@huawei.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--lZ2kD5tAJbjEJdaD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 01, 2023 at 09:52:53PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/media/cec/platform/tegra/tegra_cec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Doesn't look like this has been applied yet. For the record:

Acked-by: Thierry Reding <treding@nvidia.com>

--lZ2kD5tAJbjEJdaD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUldvwACgkQ3SOs138+
s6FdUQ//bmStVG5f3XXFmrJOaQtmBb/AxfvuNT0s4cUQ046r2Xw7s0dqcIQOVsuG
kOdDoaybiJYKdoasHXmt76Okwfxa0qEgL2Gq7r7GBYr004uqllxmxK3RcRwKl5rF
JwGYwvP9rFqAFUUH2N3DkTziT+n0U3cHaQh2PYcv2AMGx1QNP/VLVeGyDDstb0rn
d+ruWj7mAdoJzg6IFiFGN+6eFZFKnh6jdoochTvnBUNEphXw1RKnov4IpabX+UGA
UOziyKOhPLt1yRh1VaT2OfppoiYMfIylr23IPH4ou+FUnK9jXdveHMaVf3dAL1Fx
+H+Me5DQUmyAdNJNpab3STNrmExkWOQw89YHsVJQkFxjVNyI/0O6Ik8/H/z8wpab
e+IbWmO3P0Zp5Ko1Gau+71sTfwX7zJv2i+u3sqvWpwRyyVKSf6aMtfjChUoURv+4
1qDptxi4+0Sszt/JeyXBhd8tIimqM7J9s8M5LbtUWDYwbGVoBWlGVWRMQ2FWxY0t
hmTsNAgT8+Zdz8tFVUkwC350Ds8rfUZ1DSC1oxGfssYiXnvaIDFl5yEcZwrhFpHb
1iC9lS2qATa14AbLZyk54lfLM1cC8bGCIQ7QPLznOKOVIAMd4bp6HbJWQLDV7PbT
Wxb+bWDkOXdMnaxH0dn9v8RU3oV+AVYUixuBewXU3pB25Y5HzHI=
=QD2J
-----END PGP SIGNATURE-----

--lZ2kD5tAJbjEJdaD--
