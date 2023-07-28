Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F127667E5
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 10:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbjG1Ix4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 04:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235398AbjG1IxT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 04:53:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F540E78
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 01:52:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D76F62066
        for <linux-media@vger.kernel.org>; Fri, 28 Jul 2023 08:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5137BC433C9;
        Fri, 28 Jul 2023 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690534348;
        bh=WnKx5b2dYcaG+Eh6WNCuqVjIDJEzl+wAwDZBzXJN8T8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aFBAUPXTkoxVul/P2gf4QTWuBLnklC/yNpy6U5KDIX76YYZJF+UEFVRC7Or9OCxXw
         y3jn772GGaORIVWb9wikImeGQ/kw/iWHBU3Efx2J2A+s2hFAPofUyeZetIU2g3CVXa
         eti92qTubtxsMkL2AxqPkYxJejNpSebdvnaKToIe8aMDLts/9BGOjiQHZRslzAPqGY
         3/7GCnxEBEQNSnYF9VKlosx9BztLPyi3sBKiZzO/k+ZyN4wPxTDoWNm2eHGqEciMVa
         9fMeRGM+lm8zJhrgYN0y6nP/09GRidq22KecZlVg3HVA6KTMYLTQimZQoChzmpuRXL
         ljzaW0v3i9pSg==
Date:   Fri, 28 Jul 2023 10:52:18 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>, bingbu.cao@intel.com,
        niklas.soderlund@ragnatech.se,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Yong Deng <yong.deng@magewell.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Benoit Parrot <bparrot@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v6 26/38] media: v4l: async: Try more connections
Message-ID: <20230728105218.390d6b0b@coco.lan>
In-Reply-To: <20230727054255.1183255-27-sakari.ailus@linux.intel.com>
References: <20230727054255.1183255-1-sakari.ailus@linux.intel.com>
        <20230727054255.1183255-27-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 27 Jul 2023 08:42:43 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> When an async sub-device is registered, it used to be that the first one
> of its connections were matched when found. Continue looking for matches
> until a notifier no longer has any.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de> # imx6qp
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund@ragnatech.se> # rcar +=
 adv746x
> Tested-by: Aishwarya Kothari <aishwarya.kothari@toradex.com> # Apalis i.M=
X6Q with TC358743
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # Rene=
sas RZ/G2L SMARC
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-co=
re/v4l2-async.c
> index 44f72aa75c19..6b3c02d27ebf 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -789,6 +789,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  		if (!v4l2_dev)
>  			continue;
> =20
> +again:
>  		asc =3D v4l2_async_find_match(notifier, sd);
>  		if (!asc)
>  			continue;
> @@ -801,13 +802,12 @@ int v4l2_async_register_subdev(struct v4l2_subdev *=
sd)
>  		if (ret)
>  			goto err_unbind;
> =20
> -		goto out_unlock;
> +		goto again;
>  	}

Using a goto here instead of a do {} while is not nice. I'll merge it
as-is, but please send a followup patch using a proper loop.


Regards

Thanks,
Mauro
