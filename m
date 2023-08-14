Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FD277B446
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 10:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbjHNIgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 04:36:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbjHNIgg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 04:36:36 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7209C
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1692002194; x=1692606994; i=j.neuschaefer@gmx.net;
 bh=oz40fyaPZcE7PqdTckrm2xO8OeYKsBN1zUtcCnjhu40=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=RkhmUQp7tDY2jTDP0igm+Xw51oYcHRwkVn2Q3SQ8Y4qtqrXOUj7muAH5tJoZ3lmnY/s5JSh
 /cbKodGwftwYC3tVIvg8GXuB05AEWf85fFGBqoMJVKn8hGmIXOJJKTCASFoZCUxM61I8I8lDy
 1KJcXxF1vjC5VJN5TFXjOrEdp3dWt+QpPNycYHp5iE45KEctmLfxVwsU6rpj0LCGs5hFB5w5B
 zQ2Q9WDfjNIB8nxws4iX0t/kbQOB41RzLjUDpNLsBsLK/vgIqD2eudGihQMY1U36HyDGxzHVy
 pYbAWXjrbeGjvQv8bzGP+tMypCq4E0D3mkUTHquG+xaBU1Tp+eRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.154.44]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6DWi-1qOtHA1dAO-006bF6; Mon, 14
 Aug 2023 10:23:24 +0200
Date:   Mon, 14 Aug 2023 10:23:23 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        j.neuschaefer@gmx.net, u.kleine-koenig@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH -next 2/3] media: radio-wl1273: Remove an unnecessary
 ternary operator
Message-ID: <ZNnke/yUmg7xFa+v@probook>
References: <20230804031323.2105187-1-ruanjinjie@huawei.com>
 <20230804031323.2105187-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="02r1HH4hT38FgzXK"
Content-Disposition: inline
In-Reply-To: <20230804031323.2105187-3-ruanjinjie@huawei.com>
X-Provags-ID: V03:K1:uMBNvYwdgv5feUZo9EDEmaV4sr0Hrbp7CUZheF0Umv5Spa8/lPm
 +pMRzQ/UU+uinAm95E6tkVy4GCOfFIEi5MwmnT+Q7AbjLPGDLBEzdiI7i0BE1sXwiQrU0C3
 m6KEWM+XDqz3x4cCbSRyaaeUmdXJkB5kf0PrlQLUJbgxdRa1g59DDsMBqfTs4c88sA2coEH
 orlF7+l081FTr99XjNLTg==
UI-OutboundReport: notjunk:1;M01:P0:TrwOo6XxbG8=;c99V2TjlqjnEstUuYlnTJdvf8R2
 s9wZiWvoRABlaQlEXB3yA3srfprPL+HVgmOM0L+rTrUnGV5BCaeQ68yIC0XyZg+3isFLKuMy3
 DOt1vxupmC0butnDcMmRijblAMTm2h3x2T8w+DX93+/gopFdHXHJWSt46UURJL1tl8Dcvoctb
 V5dh2zFOX+v8IJYkQLX1qjkRf6xlIZITOByWsPyFJ2xpCO2fwCKKTrTVuMKWyxUygBFf03Y/o
 9EVP4IUJITuNhNSp6MLs7aIfUQKWEgofiCtse9I/hR26MkmFDYvyRakO7vdQS1HkyCe6eI0mc
 i9e943+XVWVC12r/7VhVdXOD/RYovGIjTy9Jx+GqOrN62XMTBs8UZWS3Fq4VqlamaepdTWL0K
 dUcGD4xpAUJKOFK0Uew6twj9wsyMImrGNVxxBpOpCO+AClB640Ofv3T+bJn4IgTngdpH6bOwU
 lOQKb6soNmncF7SuX/ZA7SjngA/R1pwmrFQUhKRSe3NiHXW0CcqsmYQHaTvx+f400MOeAGFC0
 ujJNGGU4+i79PUQUPD52M8wDjFNNoYEPlms7WAn94nIBe/lGIbVQT6Kmag+Eq5f47yjttTYdN
 fQSt6K/tQ0dIVjo1s84WcqiVFMC9vUbaUOWhvb816x3uk4wr1f+/KhTuirnkvD3vcvc0z1vaN
 IJDhwOmaGMHMXpWrxoB/y2RWU4WpddDW5HxF5ROncn+Y6ftVUNPHrFDRJumsxdLuM49btjSHs
 h6IeWrADK16rgFAjMgxxWcyLRiBPLrQzpUQMnZHIATDNiOMC5EbIfj81P1VouetTDsI1fKC7q
 9RuSTwrbD+pcwyv5NhXZ4xx7X5sfa5Sc5Fw/nwW1dvh02reW69E5CHPjOnaG5/Ya4X9XywqhO
 eGY0ZZ4z6jMVjp9T3DhxAoeEovixFFa/qrT0wJhADYx0TDqfoT0coxqjCtz9q1b/UhbogI8Gz
 szLjfQ==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--02r1HH4hT38FgzXK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 11:13:22AM +0800, Ruan Jinjie wrote:
> There is a ternary operator, the true or false judgement of which
> is unnecessary in C language semantics.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/media/radio/radio-wl1273.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/radio/radio-wl1273.c b/drivers/media/radio/rad=
io-wl1273.c
> index e8166eac9efe..f6b98c304b72 100644
> --- a/drivers/media/radio/radio-wl1273.c
> +++ b/drivers/media/radio/radio-wl1273.c
> @@ -1020,7 +1020,7 @@ static int wl1273_fm_set_rds(struct wl1273_device *=
radio, unsigned int new_mode)
>  	}
> =20
>  	if (!r)
> -		radio->rds_on =3D (new_mode =3D=3D WL1273_RDS_ON) ? true : false;
> +		radio->rds_on =3D new_mode =3D=3D WL1273_RDS_ON;

Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Thanks.

--02r1HH4hT38FgzXK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmTZ5HsACgkQCDBEmo7z
X9tNYg/+NgOly4mFpRciEqyK0IK7lFOWjnJhCD5N0N5AgMGbM3mfyoZskKru5EDO
MfTH80W/dGS3WwjDGrGwDadtmoYxbsVzZe3//GY9+5dL5Te8uTkj9hXjsPQgWW8y
55v2nGxmMKq/zvzxaIL+Xl2E/T4/EkwnreHqs/kmaTu3b4BS+tGSF2WL2s1PJlgw
AUbFeIO8nUfzWnzk1U2uqaMYctK7rxp8vaFwyH5RI4xtbkrWMrnfqlm5r/Ds8OtH
eixj7pOcBPa7X8Tcaim79BJtsBz6Cfflp8Snd6hismM8avpz2cXKwF17M56BhvtG
RQaOuMcJQqdvImoE19xaNXukt6Sg+F7HV4rBmXuPKWBK04DxhXMk9Yc8+YaRtPj0
y0rG3RZIp3q1N/fiV3eo7iK6taQR9SYujEDclHcFUmGV3YNIHbBh2Ghl4GpPQARC
lJSmMxE5j1Q0/5caoQ3wOTFSRUSYVFjgq2hKDaLWSWD6yrTicxMn4JJifmxEP+Qn
1gTD/Ar1UoBBi1NT9S/2Exa27Ox/l1efl2FwaOw7qe3Vl2z7sR/A7g20Y5M2sHbD
66an4FoQz1dnhyLStbBXuD2BkMsghxrOYFfEPLBA9CrK+apJvhA4np6XInG0Vd5R
6txfES7fVf1SlevCGD/bYD2Zz1sX8j84twvd5aWL2EdO8ZqHimk=
=exkn
-----END PGP SIGNATURE-----

--02r1HH4hT38FgzXK--
