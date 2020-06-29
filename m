Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73E520D7D4
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2020 22:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732218AbgF2TdN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 15:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733042AbgF2Tcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:32:45 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38977C02F006
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 07:43:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id c1so857594pja.5
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2020 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pesu-pes-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jLORGp6VfrDrQA8PpUsXn5+mhrmQSe4/xK3Vs+cmlnA=;
        b=CN262X2BWpTSqbB1xZLnzt3P6PXjtlLIfYiIegWD8/RQLngh8QXv28Rke8t+T7ErjV
         0xoehil5YqUKWFNf9122vK/5Bl/5hRrynVReUB3J5JnMTxyoit84XWPf/TXz1ioFztsx
         AHVRLwqLna0A2h1BfWLa6SpiqcFSvanAVPhajVV+GYLDx6Q8/BDHlmGdGmlSXzWQ/ZTX
         IFWxdidVNy4yIbMMgL2eFDLZh1gon3kWRo1AzuR3WxbQGW5UDDAdyMMFy5F/qo91WYm7
         qo+N+qOh3A/N7rL4UKaOo4Xf7ki/gntOiUCTeRRDcT02wPU4+AzS2xOjl9YaWxHfl1JS
         T3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jLORGp6VfrDrQA8PpUsXn5+mhrmQSe4/xK3Vs+cmlnA=;
        b=sR+7q/1I4fHlE4ncJHAd/lf1DiDyd3CzdVXbCruPPnhDKcz+Pv4/HGOVkwvM6mUPdl
         ABS8CpQExJOAaJxDe7pc1zJRoKkg1tIe0jCu2l01syZIoyJnT4EJs+zSOVkfboHksNRi
         riuS2Ys4KNXT0lHAEpX6oCRJq2UG0nHt7ZfT/yyeHpKOkFaDnoHUATyP8ZZVfIre04wW
         IhCwtX8juR0itcGE/E4bTiKu4TkwfDJcZ/CIenFRETbxAuDguHbzvKmQE5ygz4ITSGT6
         ZK54oL7eN9NJuFfiLxu487fZML76S34B2IWZ5qD/V6OFC78AFtSOLMtQ2pl2Rg0CZVUa
         1hXw==
X-Gm-Message-State: AOAM531VPuqbdhplwrvfqrsT9qJWYSH1xU7Dd8XsqzHg6oWfFCOq66U5
        CgNAUlpt4wDAdLah1VH8iZsh2A==
X-Google-Smtp-Source: ABdhPJyirQnsQiQuhswSo/uIYV1ui5LyLyvg/sRt0KpvA9WEl1ByzdHprHAFfNPsV1N0i2xDWfS+Eg==
X-Received: by 2002:a17:90a:a413:: with SMTP id y19mr4591589pjp.59.1593441822678;
        Mon, 29 Jun 2020 07:43:42 -0700 (PDT)
Received: from localhost ([2406:7400:73:703c:908:f18a:1156:5c38])
        by smtp.gmail.com with ESMTPSA id s9sm101062pgo.22.2020.06.29.07.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 07:43:41 -0700 (PDT)
Date:   Mon, 29 Jun 2020 10:43:36 -0400
From:   B K Karthik <bkkarthik@pesu.pes.edu>
To:     B K Karthik <karthik.bk2000@live.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: i2c: atomisp-ov2680.c: fixed a
 brace coding style issue.
Message-ID: <20200629144336.fhykjoqrhfhifmes@pesu-pes-edu>
References: <20200628043833.3dodctrmkec6aoe5@pesu-pes-edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="i3ho2sv5roir6t7m"
Content-Disposition: inline
In-Reply-To: <20200628043833.3dodctrmkec6aoe5@pesu-pes-edu>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--i3ho2sv5roir6t7m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Did this get burried in along with a bunch of other patches? I am sending t=
his email only because I did not recieve a negetive acknowledgement on the =
patch.

I apologize if this message was hurtful / disrespectfull in any manner,
thank you for reading this message.

karthik

On 20/06/28 12:38AM, B K Karthik wrote:
> Fixed a coding style issue.
>=20
> Signed-off-by: B K Karthik <karthik.bk2000@live.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-ov2680.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers=
/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 90d125ba080f..c90730513438 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -495,11 +495,11 @@ static int ov2680_h_flip(struct v4l2_subdev *sd, s3=
2 value)
>  	ret =3D ov2680_read_reg(client, 1, OV2680_MIRROR_REG, &val);
>  	if (ret)
>  		return ret;
> -	if (value) {
> +	if (value)
>  		val |=3D OV2680_FLIP_MIRROR_BIT_ENABLE;
> -	} else {
> +	else
>  		val &=3D ~OV2680_FLIP_MIRROR_BIT_ENABLE;
> -	}
> +
>  	ret =3D ov2680_write_reg(client, 1,
>  			       OV2680_MIRROR_REG, val);
>  	if (ret)
> --
> 2.20.1



--i3ho2sv5roir6t7m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCgAdFiEEpIrzAt4LvWLJmKjp471Q5AHeZ2oFAl75/hgACgkQ471Q5AHe
Z2o9Zwv/W+4Q3b66dFYLTKnXoigYHIbecsuAc0LMW5V2VSXQJ8dq+DsCFvawZMh3
UmbKaZsk033rYkKxbc1rubekPkm1eQ0kAY2iG6j+sIPnYtlUpkLRT6fU6vclZkAO
gliHVAn1j0aB483pR6TJY0ek+ieMra9a7cetHsDHwzjdFQsheKDmEvtwjSYo5CCY
0gImXtqo0md5TaiCmATWZ8GA6iOFcgOA+AHxhHN/s/SJ+CmZ2Ep4JGbPiaOCZcvq
YjwBI15IiHVfJ8DDiYbemJvZRkZdKmgh8oIFDKS0jyFcGBn6fBkhWregLs9tqhyu
PaSgKyS4nCIXL0mSDv87nPH8pq8DTfmFb6LEA09slsKzwMBUgESCywCLX0jiWTSn
q0Y+CaE5mdKQBkOkizun3BuHbu43YDHKTy4qHNBDnTrLdltAKFjvxfvh6Sixfsvj
1tEo886KYQETUjkIdmdCkjs5FT5uRDF+XGjCH2MxY/uxmq/LkxMOLY/IMGjMPf9U
TkhSrXDs
=Ikkk
-----END PGP SIGNATURE-----

--i3ho2sv5roir6t7m--
