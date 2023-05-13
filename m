Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13B701943
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 20:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjEMSgd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 14:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEMSgc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 14:36:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721131FCB
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 11:36:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D62961D4B
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 18:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B06C433D2;
        Sat, 13 May 2023 18:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684002990;
        bh=Ahm9mCVPAvZiQsxx8Wq10F5G/H10vgNoWViQjrCIoFI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ND6lLVTRHsU/HokDjvEAHBaCcrETPiCFmm1bfNyLnY9q6CoLBSMkhJVYDT+ZGhb88
         eJcHW2VWe2chxBsYJFvKYS6TT3jd4+mj+UVK3/Tdj6VsVRMU14ph5Dd5gz8gM5eH+r
         876vGmiFrSj1CO666tIsUYxkecHcttmcOzMXoEMsgD9/6VdyQUskl6rUp8+AN8YayR
         xJVfciOdqQ8u3F4dbxK5y37T7l5eM+Icbj56Km0ftX+KtWBxOYA/vOC72/nMbx3HaK
         6UCP5rTmHLbg6fyLF3DFg980RBlfjeNnSzVfgLKVLOxMzvDjPMF01DDdTEjHAVOPG/
         b+kEgwLZ8pf6w==
Date:   Sat, 13 May 2023 19:36:26 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] media: Switch i2c drivers back to use .probe()
Message-ID: <20230513193626.48ed9a28@sal.lan>
In-Reply-To: <20230513175931.159764-1-u.kleine-koenig@pengutronix.de>
References: <20230513175931.159764-1-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
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

Em Sat, 13 May 2023 19:59:31 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> escreveu:

> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Doing some minor cleanups en passant (whitespace cleanups, drop & from
> function pointers.)
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this patch was generated using coccinelle, but I aligned the result to
> the per-file indention.
>=20
> If you don't like the cleanups that are orthogonal to this patch, just
> tell me, then I can drop this change from the patch. Also if you want it
> split per driver or directory for improved patch count numbers, please
> tell me.
>=20
> Also I didn't Cc: all the individual maintainers to not exceed the
> allowed length of To: and Cc:. If this patch will be split I can extend
> the audience accordingly.

Sounds good to me.=20

> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 17465fcf28e3..7b26ba72ff2a 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2616,7 +2616,7 @@ static struct i2c_driver ov5648_driver =3D {
>  		.of_match_table =3D ov5648_of_match,
>  		.pm =3D &ov5648_pm_ops,
>  	},
> -	.probe_new =3D ov5648_probe,
> +	.probe =3D ov5648_probe,
>  	.remove	 =3D ov5648_remove,
>  };

Nit: you should probably remove the extra spaces from .remove
or align .probe here.

-

Are you planning to merge this via I2C tree?
If so:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro

