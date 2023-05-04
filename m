Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F006F62A3
	for <lists+linux-media@lfdr.de>; Thu,  4 May 2023 03:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjEDB2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 May 2023 21:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjEDB2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 May 2023 21:28:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 822BE10E3
        for <linux-media@vger.kernel.org>; Wed,  3 May 2023 18:28:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F60660F78
        for <linux-media@vger.kernel.org>; Thu,  4 May 2023 01:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F856C433EF;
        Thu,  4 May 2023 01:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683163725;
        bh=bGE2VvFwZIMtME1pqkI8jaO3IJdVwzo+V0rUgYb9ILQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tfoVrI+nwEbC+LLZ01rpwjRZpN+MeuI3k8sE1fm7pXqwEZdVHf0bJ4MKvzzkF6cOO
         QCLvSgGc7zmB/EwyKyLtnpDovYuryg78V+R6Z42QbslWnM8qNBQN53mJtz/teNpMPE
         XpfBW5i17mTgNIzDNmU6CU+35hI5xV0YynZ45033RkH5vqmPPDKfT94kIY4cUbRt2D
         HjqYTc+rgbe9vmOc3aR6SHbKG0P390bYEqGV1T1Ug+Yh6AR2TpjtKaJmnSGj29U/Rc
         ZhF+de8uzJ2PtnmYe4BmRTtnkCjcoLfS3WyDOgGHGyY7z4/SVM2WvFtiHYdH2bBZEv
         RHu+coi5gMPgw==
Date:   Thu, 4 May 2023 10:28:38 +0900
From:   Mark Brown <broonie@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: mainline/master bisection: baseline.dmesg.alert on
 rk3399-gru-kevin
Message-ID: <ZFMKRgPdgWoedjqk@finisterre.sirena.org.uk>
References: <64521df9.170a0220.24317.c9f2@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="o90CsH8qM5xCizKV"
Content-Disposition: inline
In-Reply-To: <64521df9.170a0220.24317.c9f2@mx.google.com>
X-Cookie: Avoid contact with eyes.
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--o90CsH8qM5xCizKV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 01:40:25AM -0700, KernelCI bot wrote:

The KernelCI bisection bot found that commit db6f68b51e5c ("media:
verisilicon: Do not set context src/dst formats in reset functions")
is triggering problems at boot on rk3399-gru-kevin - there are oopses
printed early on in userspace initialisation while enumerating the v4l
devices.  The top of the backtrace is:

<4>[   17.793601]  hantro_try_fmt+0xa4/0x27c [hantro_vpu]
<4>[   17.805556]  hantro_set_fmt_out+0x3c/0x298 [hantro_vpu]
<4>[   17.817914]  hantro_reset_raw_fmt+0x98/0x128 [hantro_vpu]
<4>[   17.830429]  hantro_set_fmt_cap+0x240/0x254 [hantro_vpu]
<4>[   17.842877]  hantro_reset_encoded_fmt+0x94/0xcc [hantro_vpu]
<4>[   17.855694]  hantro_reset_fmts+0x18/0x34 [hantro_vpu]
<4>[   17.867801]  hantro_open+0xd4/0x200 [hantro_vpu]

which does seem relevant.

I've left the full report below, including more details like links to
full logs as well as a tag for the bot, below:

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> mainline/master bisection: baseline.dmesg.alert on rk3399-gru-kevin
>=20
> Summary:
>   Start:      865fdb08197e Merge tag 'input-for-v6.4-rc0' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/dtor/input
>   Plain log:  https://storage.kernelci.org/mainline/master/v6.3-12423-g86=
5fdb08197e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.txt
>   HTML log:   https://storage.kernelci.org/mainline/master/v6.3-12423-g86=
5fdb08197e/arm64/defconfig+arm64-chromebook+videodec/gcc-10/lab-collabora/b=
aseline-rk3399-gru-kevin.html
>   Result:     db6f68b51e5c media: verisilicon: Do not set context src/dst=
 formats in reset functions
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       mainline
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
>   Branch:     master
>   Target:     rk3399-gru-kevin
>   CPU arch:   arm64
>   Lab:        lab-collabora
>   Compiler:   gcc-10
>   Config:     defconfig+arm64-chromebook+videodec
>   Test case:  baseline.dmesg.alert
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit db6f68b51e5c7b432185c6d872d03901c07136d2
> Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Date:   Mon Feb 20 10:48:44 2023 +0000
>=20
>     media: verisilicon: Do not set context src/dst formats in reset funct=
ions
>    =20
>     Setting context source and destination formats should only be done
>     in hantro_set_fmt_out() and hantro_set_fmt_cap() after check that
>     the targeted queue is not busy.
>     Remove these calls from hantro_reset_encoded_fmt() and
>     hantro_reset_raw_fmt() to clean the driver.
>    =20
>     Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>     Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>     Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>     Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/m=
edia/platform/verisilicon/hantro_v4l2.c
> index c0d427956210..d8aa42bd4cd4 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -382,13 +382,10 @@ hantro_reset_encoded_fmt(struct hantro_ctx *ctx)
> =20
>  	vpu_fmt =3D hantro_get_default_fmt(ctx, true);
> =20
> -	if (ctx->is_encoder) {
> -		ctx->vpu_dst_fmt =3D vpu_fmt;
> +	if (ctx->is_encoder)
>  		fmt =3D &ctx->dst_fmt;
> -	} else {
> -		ctx->vpu_src_fmt =3D vpu_fmt;
> +	else
>  		fmt =3D &ctx->src_fmt;
> -	}
> =20
>  	hantro_reset_fmt(fmt, vpu_fmt);
>  	fmt->width =3D vpu_fmt->frmsize.min_width;
> @@ -408,11 +405,9 @@ hantro_reset_raw_fmt(struct hantro_ctx *ctx)
>  	raw_vpu_fmt =3D hantro_get_default_fmt(ctx, false);
> =20
>  	if (ctx->is_encoder) {
> -		ctx->vpu_src_fmt =3D raw_vpu_fmt;
>  		raw_fmt =3D &ctx->src_fmt;
>  		encoded_fmt =3D &ctx->dst_fmt;
>  	} else {
> -		ctx->vpu_dst_fmt =3D raw_vpu_fmt;
>  		raw_fmt =3D &ctx->dst_fmt;
>  		encoded_fmt =3D &ctx->src_fmt;
>  	}
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [d53c3eaaef6a05fec04e8b5990d97d7216eb5e42] Merge tag 'soc-dt-6.4'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> git bisect good d53c3eaaef6a05fec04e8b5990d97d7216eb5e42
> # bad: [865fdb08197e657c59e74a35fa32362b12397f58] Merge tag 'input-for-v6=
=2E4-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> git bisect bad 865fdb08197e657c59e74a35fa32362b12397f58
> # bad: [6e98b09da931a00bf4e0477d0fa52748bf28fcce] Merge tag 'net-next-6.4=
' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
> git bisect bad 6e98b09da931a00bf4e0477d0fa52748bf28fcce
> # bad: [c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4] Merge tag 'fsverity-for=
-linus' of git://git.kernel.org/pub/scm/fs/fsverity/linux
> git bisect bad c3558a6b2a75d9adacf15dd7fae79dbfffa7ebe4
> # good: [289af45508ca890585f329376d16e08f41f75bd5] Merge tag 'exynos-drm-=
next-for-v6.4-2' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/d=
rm-exynos into drm-next
> git bisect good 289af45508ca890585f329376d16e08f41f75bd5
> # bad: [f5468bec213ec2ad3f2724e3f1714b3bc7bf1515] Merge tag 'regmap-v6.4'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap
> git bisect bad f5468bec213ec2ad3f2724e3f1714b3bc7bf1515
> # bad: [017984559d09aef296011f9a8e9ce855404ad519] media: common: saa7146:=
 add support for missing .vidioc_try_fmt_vbi_cap
> git bisect bad 017984559d09aef296011f9a8e9ce855404ad519
> # bad: [428bbf4be4018aefa26e4d6531779fa8925ecaaf] media: camss: Convert t=
o platform remove callback returning void
> git bisect bad 428bbf4be4018aefa26e4d6531779fa8925ecaaf
> # good: [e004c637fb1d4b975d476f800675ec18c9502cc9] media: i2c: ov5670: Pr=
operly handle !CONFIG_HAVE_CLK
> git bisect good e004c637fb1d4b975d476f800675ec18c9502cc9
> # bad: [db6f68b51e5c7b432185c6d872d03901c07136d2] media: verisilicon: Do =
not set context src/dst formats in reset functions
> git bisect bad db6f68b51e5c7b432185c6d872d03901c07136d2
> # good: [75c38caf66a10983acc5a59069bfc9492c43d682] media: mtk-jpeg: Fixes=
 jpeghw multi-core judgement
> git bisect good 75c38caf66a10983acc5a59069bfc9492c43d682
> # good: [6d020d81b91af80a977061e82de25cafa4456af5] media: mediatek: vcode=
c: Make MM21 the default capture format
> git bisect good 6d020d81b91af80a977061e82de25cafa4456af5
> # good: [5bbb6e2ca67477ab41163b32e6b3444faea74a5e] media: mediatek: vcode=
c: add params to record lat and core lat_buf count
> git bisect good 5bbb6e2ca67477ab41163b32e6b3444faea74a5e
> # good: [d227af847ac2d7d90350124a1b2451e4fc1f050c] media: mediatek: vcode=
c: add core decode done event
> git bisect good d227af847ac2d7d90350124a1b2451e4fc1f050c
> # good: [2e0ef56d81cb2569624d288b7e95a8a2734a7c74] media: mediatek: vcode=
c: making sure queue_work successfully
> git bisect good 2e0ef56d81cb2569624d288b7e95a8a2734a7c74
> # good: [960badda95f10fb0c60f6f64978b19eafa9507a7] media: mediatek: vcode=
c: change lat thread decode error condition
> git bisect good 960badda95f10fb0c60f6f64978b19eafa9507a7
> # first bad commit: [db6f68b51e5c7b432185c6d872d03901c07136d2] media: ver=
isilicon: Do not set context src/dst formats in reset functions
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#41611): https://groups.io/g/kernelci-results/message/=
41611
> Mute This Topic: https://groups.io/mt/98657502/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--o90CsH8qM5xCizKV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRTCkYACgkQJNaLcl1U
h9Cosgf+Mwyy2qZKSoOX9nSW4qJ/w48N7jUEfM8wfrCKVhV8Zes2DFbCFpAY9BKg
O9RXAkVJ8ElWyGEYqmfIFzGqwso5XhiYIeVC7tdKeQGE9ij+KgkylEwHNiLN+BgH
bzg2SlBIXPt3Q//7kxlJV6WmB5NbMsSRmbOJLH+IUIj/1Wlze6P0PGitV39Zgjg4
Lwo8De1WuwG6ltd7a7gvlKwD3prJGsaoy7tpnxVK9vRaDT7QsibAkVErAP49KUPq
+yB+byC8wNQ2pVVIfHvduy37JRlA/tAIXkRndJ5cDwo3II14EKPHhuPpsdgt8n8q
b9uMxT9EonqAgNVodiI2MPDgPu8IIw==
=JOS8
-----END PGP SIGNATURE-----

--o90CsH8qM5xCizKV--
