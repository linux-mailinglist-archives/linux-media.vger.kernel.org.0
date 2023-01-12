Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220B7668757
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 23:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240589AbjALWwr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 17:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240570AbjALWwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 17:52:44 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B831A5E0B9
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 14:52:43 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-4a2f8ad29d5so260877357b3.8
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 14:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGAK1scWjkvFfZhQd2UhyHpiCM4+U0kv5/Wm4yJ/VPk=;
        b=LujenWSFG1nK2VvAMbU8N7KBI/1wKeA3OlAEHtrsntioHJrTYiLJC2QIltRwZie3e8
         zUXiiLmdUpc5Yjeza6Jb8s8p7JMpR1qx8hrV4WSSpmU3iVuU74LlJNnDwTn0LosKq8w5
         lGQf9rYchN0rnE+B7w5vhWTo8svEhI/gyhOIepTWtVXI6zMavHVwUumbHl7P1tvbwlzm
         jrzrTMCPp7piszNWUPO2GwtGVAzpYT4oRrlg503iD6HbZKtRB3oix5b9c2gZcAdsOKCk
         XeQZVwC2XSupHRbg0+xRXOarzaPgx5AFflSi5c4mgQBaSQo3c3DvQGrjBsiFkCt4sp5o
         h4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGAK1scWjkvFfZhQd2UhyHpiCM4+U0kv5/Wm4yJ/VPk=;
        b=lOdc7pmiNvKfL0ttDjQhT6pInhBu/Eud3PfoWXH0HDqbM9uGNr7qcYhX1RJ3VHc5cf
         k6BIcHa4dmCVI6uiA8xaRO5Xr3t1P61TWpquumGNg3WjE85H7VUOnwsahoGs9VTmiQzU
         o9csR/M8326BsMm+kkGcLRYTOWpGPkAALy4hvOz+AzZEJfpXsPSLTuytDP6gpQ+Q+3ti
         k8Vg/Ceak5vfiFAjDxfwVRoJzp9lA6scS9+/YARL7mR1KCTE5/FkayaWngjUM4Ug3rDh
         2ugBzKUXOoFkWwhvvWN1P9xF1SFa9tqZODIRm0RqD8QB0DDeDlTFG+9peDht+c+79S4d
         GNAA==
X-Gm-Message-State: AFqh2kpOUkwmIoYiLCL1Ge9LyZqg7Bdrxz38S18Fxp/+iBWwCvQgf5ov
        0UWe25CSzREtLvJnjexdotJGFO0zi3odkPoJCk13xL6v5mAe66pa
X-Google-Smtp-Source: AMrXdXvMDtYOwTkf0Ho47+g83c5oa2RPJ29u6NHr4Kr9jzPFq/yP49QpZ03cw6IGp4wmdeh3fy9E4qiwnMl50nod/fk=
X-Received: by 2002:a81:a112:0:b0:4cf:84af:7e95 with SMTP id
 y18-20020a81a112000000b004cf84af7e95mr1291823ywg.309.1673563962940; Thu, 12
 Jan 2023 14:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de> <20221213153553.648871-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221213153553.648871-2-u.kleine-koenig@pengutronix.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 12 Jan 2023 22:52:15 +0000
Message-ID: <CA+V-a8uvOUwJCixFnDBut=+ChhcHgt2eTZuyffwZDuNW24C4TA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ti/davinci: vpbe_osd: Drop empty platform
 remove function
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 13, 2022 at 3:36 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/media/platform/ti/davinci/vpbe_osd.c | 6 ------
>  1 file changed, 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/davinci/vpbe_osd.c b/drivers/media=
/platform/ti/davinci/vpbe_osd.c
> index 32f7ef547c82..f6ea71c081d4 100644
> --- a/drivers/media/platform/ti/davinci/vpbe_osd.c
> +++ b/drivers/media/platform/ti/davinci/vpbe_osd.c
> @@ -1561,14 +1561,8 @@ static int osd_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static int osd_remove(struct platform_device *pdev)
> -{
> -       return 0;
> -}
> -
>  static struct platform_driver osd_driver =3D {
>         .probe          =3D osd_probe,
> -       .remove         =3D osd_remove,
>         .driver         =3D {
>                 .name   =3D MODULE_NAME,
>         },
> --
> 2.38.1
>
