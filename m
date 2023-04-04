Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210276D5DA8
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 12:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbjDDKid (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 06:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234049AbjDDKic (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 06:38:32 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7156610F2;
        Tue,  4 Apr 2023 03:38:31 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id i5so128848332eda.0;
        Tue, 04 Apr 2023 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680604710;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWnxBcDKf5ru+z+CIuvvbBHIiA/BoMohngBy7jcoWrs=;
        b=GmWq7oNNzqpBb3uYXT8PYGnOyE+6hq1/HTKObOJsLICzSBuvPfIuKgmARc+WpNEQl6
         MNh7NZsD+gzjJjMMRrw4AlbwPD+32OP571TgxYIitjpqueALJkTt7QIsf+q6gcFiUxUp
         yKreaj82snQbpOgya+jd0jxG2IEimNVCA84axdOJ65tPvhwuP90Kj6N5PbmsmW/fxwSZ
         ld/JyXIWLSEr4E5MyJ1lOmnDvtJsIi4mxibKSZtnLMftsFwbRigEKd8w8lnakFxNMAdH
         2tl7FyorvfkGGrkP8vOHRTcYnEoncvUvE7Dpqlvl5y3I1JelEfz/AODsG2jeaVOrSOTZ
         MICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680604710;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWnxBcDKf5ru+z+CIuvvbBHIiA/BoMohngBy7jcoWrs=;
        b=xBm8u/mCSlROvvImcqojM3KAX6IbWe7jSqAl3WmEiXqvSpIRg0UzQzoCCjc7QDbta5
         CQbMla2YUJCM0PHuYLRoaiPocY8oG02RGVQVJSi+ZxZ0/FfRWjxhKWTq76XtuJpnyzQg
         plNXrpcxw6OxxQQZNcyeawdmsEriG5BANbdv0KJHet6dEeFXymMktFmu4Wt9mRMBJddV
         qzPP6ojLmcXquuxvGB3NQ91kayBK/sWJ7e/7+bQ+dwwVxKziyybqxiYHuMGIzGDjXELC
         c5MTgd1tKtCE/ykeWtBV2i6Kd9Sq9E0XupWUjF2K5j4bztDMXxprTV2R4t59MN87YLEH
         eaHQ==
X-Gm-Message-State: AAQBX9edwKPZE3W6Vg7VaxkoCsKWl88pqN5by6Ga1ZzL62kKjnHKWcB1
        SNTOIwV/fKCBTbQCeNCVaXc=
X-Google-Smtp-Source: AKy350YT4FHLsXsEgp4U4faRQvfheWfYlBHT+d9K+g+fuUgppFA9bZ13eqmHQX71qJnDLJfq1uwp7A==
X-Received: by 2002:a17:906:4f12:b0:931:624b:680c with SMTP id t18-20020a1709064f1200b00931624b680cmr1719642eju.29.1680604709940;
        Tue, 04 Apr 2023 03:38:29 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709064e5100b009312cc428e4sm5763902ejw.165.2023.04.04.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 03:38:29 -0700 (PDT)
Date:   Tue, 4 Apr 2023 12:38:28 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 010/117] media: tegra_cec: Convert to platform remove
 callback returning void
Message-ID: <ZCv-JJDhHMOvXbta@orome>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mm86rtWwuNO/GUwD"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-13-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--mm86rtWwuNO/GUwD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 26, 2023 at 04:30:37PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/cec/platform/tegra/tegra_cec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--mm86rtWwuNO/GUwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQr/iQACgkQ3SOs138+
s6EAYw/+JtD5u8AuJXEVjOdZD36K3jP3Y/wwnpdHGzAcONkExelaSzCRoU8fghuO
PuzQlDIOWrm6kZHhM1znJpKmGCWHbSngypvmooZb4F5T5PkC2QnDBZmxwdk/o1h2
VS8lShzIb3iqVSHjRvNOUCRJE9HoV8L0mXyg7/5a5tXTE1kKdNy/6NipFtZKOTOF
wzk94+jq9xs8zxYrm8dYP3D5g5Xl+Gpw16P+NO/Kr7pupzJHSM1CBIDcpomiLQpO
5CAWyFkp7mR1yNyavsC0SI1zaergHFjYtiO/3xcCg74bnHfZQfVuMAuCC9Fe5ATl
ggM7yYSr3aue6TgvBBDy2ZTaYvzMXhRRn66cFWe4gI44vJD/UX8m6C/a5lbtbm7w
a6LHUHk5p9P57aYXo7hcFzMFQPAxeUXFZhv+yXtoVRhXpOjwKiQCrV+nFGD3zaq2
m0Bu9gB6oO4Dfg67DUoJFr4EQiC4jxM06ZkHDREPf2BlGoV6uK3PfXq0rZu0aVF0
vDt6C8+drbUiiYZSnjZlVirt1cmx9kAAlebpmB4LKDwbOMPefWWrUi8oq+smifWS
znka9rhS7rNdhiUGEGwobC/qT4kQI2rTQOQEgg5wrGRh2EsOtjfSSk3E7hCe/rRU
lDOcmtZ4Bk9jYVIC9zgY8Zxo6XTK4eVsDulNrJRaJpT89gy+dvQ=
=Kd2J
-----END PGP SIGNATURE-----

--mm86rtWwuNO/GUwD--
