Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8F26D415B
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 11:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjDCJzH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 05:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjDCJzA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 05:55:00 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D485910F3
        for <linux-media@vger.kernel.org>; Mon,  3 Apr 2023 02:54:34 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230403095328euoutp017ba3c666c4d38ea03fa64509505fd893~SZAqySMfk0811108111euoutp01f;
        Mon,  3 Apr 2023 09:53:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230403095328euoutp017ba3c666c4d38ea03fa64509505fd893~SZAqySMfk0811108111euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1680515608;
        bh=aUnf7wmSIgxpcEe8+Kg++j8VxdDGkMPFn3/8E/YzdoQ=;
        h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
        b=s7TismxZKlOnIBvKhyg52uGLg5tqcgcRD05Vb0+C6H2s5JxMLf4Z2j99dhQ8ptpYm
         086ZeaVUs9ExpJs2sRArvrV9vQjt3K382jI0+MRioIV3eRFYUWDfnGAcG6oNgaVyHM
         4qnN527Jsxq2hAqyocuQGsMVnNfN3O2xZ0RWLUZA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230403095327eucas1p1c0f581a9276deca29f8f79fc6b1ae6e0~SZAqe0ZQ81899318993eucas1p1l;
        Mon,  3 Apr 2023 09:53:27 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 50.13.09503.712AA246; Mon,  3
        Apr 2023 10:53:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230403095327eucas1p1095d54fc1e1b89d61d9e974b3cbea853~SZAqPBZ191900719007eucas1p1_;
        Mon,  3 Apr 2023 09:53:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230403095327eusmtrp1657579eac3c8c13b237e2c0d33b09c07~SZAqOYQvH1393013930eusmtrp1a;
        Mon,  3 Apr 2023 09:53:27 +0000 (GMT)
X-AuditID: cbfec7f2-ea5ff7000000251f-ff-642aa217f807
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 1B.C1.08862.712AA246; Mon,  3
        Apr 2023 10:53:27 +0100 (BST)
Received: from localhost (unknown [106.120.51.111]) by eusmtip1.samsung.com
        (KnoxPortal) with ESMTPA id
        20230403095327eusmtip199f31a156ffdb98eeed2d3cbf8bf98fc~SZAqAeE2k1952519525eusmtip1B;
        Mon,  3 Apr 2023 09:53:27 +0000 (GMT)
From:   Lukasz Stelmach <l.stelmach@samsung.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de, Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 069/117] media: g2d: Convert to platform remove callback
 returning void
In-Reply-To: <20230326143224.572654-72-u.kleine-koenig@pengutronix.de> ("Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Sun, 26 Mar 2023 16:31:36
        +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Mon, 03 Apr 2023 11:53:16 +0200
Message-ID: <oypijdy1n9qokz.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg="pgp-sha256";
        protocol="application/pgp-signature"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPKsWRmVeSWpSXmKPExsWy7djP87rii7RSDDp2aFqsmrqTxWLT42us
        Fj0btrJarD1yl91i2aY/TBa3J05mdGDz2LSqk81j85J6j/6/Bh59W1YxenzeJBfAGsVlk5Ka
        k1mWWqRvl8CVsfvPWZaCy6IVhzZ9Z29g3CvUxcjJISFgIjFhSyNbFyMXh5DACkaJkz/Xs0A4
        XxglOvZ/hcp8ZpR42f+OHablxrLPUFXLGSXurb0BVfWCUWL+012sXYwcHGwCehJr10aAmCIC
        bhK9c+NASpgFdjFKtB3/DTZIWCBW4vXOP4wgCU6BhYwSX/p/MYIkRAUsJf48+whWxCKgKvGg
        5zULyCBeAXOJ1v26IGFeAUGJkzOfsIDYzAK5EjPPvwGbIyHwgUOi/f9SNpB6CQEXiaNvMiGO
        FpZ4dXwL1AMyEqcn97BA1LczSjRdWcgK4UxglPjc0cQEUWUtcefcLzYI21Hi8IaL7BBD+SRu
        vBWEWMwnMWnbdGaIMK9ERxs0TFUk1vXvYYGwpSR6X61ghCjxkNj9NAISVDMZJRadnsI8gVFh
        FpJ3ZiF5ZxZQC7OApsT6XfoQYW2JZQtfM0PYthLr1r1nWcDIuopRPLW0ODc9tdgwL7Vcrzgx
        t7g0L10vOT93EyMwHZ3+d/zTDsa5rz7qHWJk4mA8xKgC1Pxow+oLjFIsefl5qUoivKpdWilC
        vCmJlVWpRfnxRaU5qcWHGKU5WJTEebVtTyYLCaQnlqRmp6YWpBbBZJk4OKUamPS2lO8MSmLd
        8OfIMg32YLdv6d5TLp5+NTmsdq9rnfC/E9xGnZ61HxMc2CW9exy93sgkKRYcvay2pXnlvpnZ
        q4Onbd+4pvLIv1kNnLeDFG2Sjk/+/iU6zFmOySR//X3WOfLr/990nvegY96+q+ffdJxp8W8S
        kpDQj507P6Ei/WXJ1f+9aVMutnTaPeq8/4Ylt/5l4udzV0qcp4nyT0j8Xjtbb/vP2f+Zlx1i
        6f91Y7rHQpFPt7bKpjqHXevf7R+ltGLvcZfjDPWcFewax+pnxp7aJL+Ef5nFzwtWKqG8L985
        fVuszLrt5Zq/Tb862ozlxHR778x8kslx5doMPyXrQm1XdT+Pjr233FMTljKdjFZiKc5INNRi
        LipOBAB6A5RowgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRmVeSWpSXmKPExsVy+t/xu7rii7RSDFbdFrFYNXUni8Wmx9dY
        LXo2bGW1WHvkLrvFsk1/mCxuT5zM6MDmsWlVJ5vH5iX1Hv1/DTz6tqxi9Pi8SS6ANUrPpii/
        tCRVISO/uMRWKdrQwkjP0NJCz8jEUs/Q2DzWyshUSd/OJiU1J7MstUjfLkEvY/efsywFl0Ur
        Dm36zt7AuFeoi5GTQ0LAROLGss8sXYxcHEICSxklHs67ztjFyAGUkJJYOTcdokZY4s+1LjaI
        mmeMEotnz2EGqWET0JNYuzYCxBQRcJPonRsHUsIssIdRov1oKxtIr7BArMTrnX8YQRKcAgsZ
        JU48X8kMkhAScJVYemc1O4gtKmAp8efZRzCbRUBV4kHPaxaQobwC5hKt+3VBwrwCghInZz5h
        AbGZBbIlvq5+zjyBUWAWktQsJKlZQN3MApoS63fpQ4S1JZYtfM0MYdtKrFv3nmUBI+sqRpHU
        0uLc9NxiQ73ixNzi0rx0veT83E2MwEjaduzn5h2M81591DvEyMTBeIhRBajz0YbVFxilWPLy
        81KVRHhVu7RShHhTEiurUovy44tKc1KLDzGaAn0wkVlKNDkfGON5JfGGZgamhiZmlgamlmbG
        SuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MzBtWthz2Z43boRak55HRd+XcjzcGK/aoTT73
        LYY38vRvfa9JG7qPz+D+dC9t9odX+QnrlzGHrZ7+aPuXtdOFNNttnmqcmsk6g3/Vyhm9S+NV
        vpkqK2+dUrPznaRiwf3VRu0LG+ebRvKc1T+tcHz2iUPnfgo+qnh0fW9LtcC6mKpNuVvsPx1V
        7Hp6TXPBxz9zljqd2b5SUOvONF+t1v02P59dNDrGZmowma/219/vxknOlX5tAZP3hGrovtps
        ZO1nI3jwXWD82eV+/lIlm1+emc2fdoZ/+onY1k0Pzr1837lbyz3QwKMr38Sfj2dJ5pEeJcWJ
        S/25tYqYJaoiF0RV7puvwsVqHPCovtJlkviOQ0osxRmJhlrMRcWJAOTvY/E5AwAA
X-CMS-MailID: 20230403095327eucas1p1095d54fc1e1b89d61d9e974b3cbea853
X-Msg-Generator: CA
X-RootMTR: 20230403095327eucas1p1095d54fc1e1b89d61d9e974b3cbea853
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230403095327eucas1p1095d54fc1e1b89d61d9e974b3cbea853
References: <20230326143224.572654-72-u.kleine-koenig@pengutronix.de>
        <CGME20230403095327eucas1p1095d54fc1e1b89d61d9e974b3cbea853@eucas1p1.samsung.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

It was <2023-03-26 nie 16:31>, when Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/platform/samsung/s5p-g2d/g2d.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Reviewed-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>

> diff --git a/drivers/media/platform/samsung/s5p-g2d/g2d.c b/drivers/media=
/platform/samsung/s5p-g2d/g2d.c
> index dd8864779a7c..89aeba47ed07 100644
> --- a/drivers/media/platform/samsung/s5p-g2d/g2d.c
> +++ b/drivers/media/platform/samsung/s5p-g2d/g2d.c
> @@ -740,7 +740,7 @@ static int g2d_probe(struct platform_device *pdev)
>  	return ret;
>  }
>=20=20
> -static int g2d_remove(struct platform_device *pdev)
> +static void g2d_remove(struct platform_device *pdev)
>  {
>  	struct g2d_dev *dev =3D platform_get_drvdata(pdev);
>=20=20
> @@ -753,7 +753,6 @@ static int g2d_remove(struct platform_device *pdev)
>  	clk_put(dev->gate);
>  	clk_unprepare(dev->clk);
>  	clk_put(dev->clk);
> -	return 0;
>  }
>=20=20
>  static struct g2d_variant g2d_drvdata_v3x =3D {
> @@ -778,7 +777,7 @@ MODULE_DEVICE_TABLE(of, exynos_g2d_match);
>=20=20
>  static struct platform_driver g2d_pdrv =3D {
>  	.probe		=3D g2d_probe,
> -	.remove		=3D g2d_remove,
> +	.remove_new	=3D g2d_remove,
>  	.driver		=3D {
>  		.name =3D G2D_NAME,
>  		.of_match_table =3D exynos_g2d_match,

=2D-=20
=C5=81ukasz Stelmach
Samsung R&D Institute Poland
Samsung Electronics

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEXpuyqjq9kGEVr9UQsK4enJilgBAFAmQqogwACgkQsK4enJil
gBB/ZAf9GA0zvTdpf59RVCJL2cju5ax4Ryd5QBS6X4us0hOpy4hCVDgeQ9gPWSH9
ZnpzH4Q3Frpqma9XEV3lQw8443tO67K2ZFXXSvhBNjn38dd7YwOAik2A5NKp8SG2
4wnLa7UoHqC78OElj9YM4/6O3vGsMJMbRF9Yl9dOHtct5jf3qmccp++DHOyM+Q1k
aKW/B1pQaKNXvO9f5D94W4RLlv3drxKRZrWbri4g2tGh0+WDd1j1RFOThOaXKl9y
LnEL/FU9nYZKBEHHoiB354IKwlC1mcPtPskPuIEkItDCE+HvjHeEI+kBhysO45Fd
fwCU3qptiruFt5RrdWS7/NSfeXm7QA==
=VRsB
-----END PGP SIGNATURE-----
--=-=-=--
