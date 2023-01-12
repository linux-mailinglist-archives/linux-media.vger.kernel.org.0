Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7447F66875C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 23:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbjALWyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 17:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240513AbjALWys (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 17:54:48 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC6413FA7
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 14:54:48 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id o75so20513929yba.2
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 14:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC1DetWh6kRK3EpNfO02isoCimQpGhv0f9q9qtB7P/I=;
        b=A/wGetX96UTUmexdy/dZfZR5zdt0jHFhbOJgbCx87rZ7+t+bwE8opSVz7UtUEHD5er
         A051N5ZLG5cicE3NxPo4EHe83IgAFA0cARKt4YxMYw3/j50aQvtNzWo61tQWErhRwQOm
         hynI6SM73IN1Fl7JAs/mwK/OIoye75//qsfebhSh+kWf0Roez24lrXF4gjfF1iZrc8gC
         3jP57/szZR5blGXu/JNvQtWc2EjFTmaxGiiBy+r3e81WBjAjKc4bvIg2kk9iD0S/hKaS
         ZHXInWcjUTZNommRHIkHnzBTcMcH+1ZODfTVQX2Wr3+hOs2JSqo2bdirEUrtOS3VGqw/
         Fs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC1DetWh6kRK3EpNfO02isoCimQpGhv0f9q9qtB7P/I=;
        b=Eh9ISr/t8f8sblAS0FHarXaIn3eTc3GbiDgsWSOxV23Ay4yRKznmBgBMlQil0UmGgK
         NDm7cMhyV6aKscOcNJQ7hnQWP+9ekDEcPaFxMVTHQpdC03fflNV4WVQt8J8576X8axFC
         V1EIrb7FP9xN6N81XvE1vbmW/FO1Y0MtaxTydumeTVm+IUx9yIxzI2CanuzEMpWBQ+wv
         RA5sHTSwa6iSQTF5umGkNm/yILHSWFJ5syXfe64K1NInm7XSuOyr/g69JdIy8ayHH+l+
         jQGk0m+Xntwha1WJpSSe8Zumb4Rqm4FTE9F12EwYDyKWJq8+NDSoww1PkcBjpS0a+tcf
         6GDg==
X-Gm-Message-State: AFqh2krNRjdBs8cpGnCQZUCOL81dsL36UkScLvehn2qDnZCL9WxEmuc1
        eM+3YSsZ692I34wK/gAuGdQwkDlLef9g34oX45g=
X-Google-Smtp-Source: AMrXdXvPOApCTjqZ6olW2ta5Tvz8/K12tILN42GiatO+lPS3tslyCIRlbsppdYCGldS27vqEdP2ubCOvyrocxwgz1oE=
X-Received: by 2002:a5b:891:0:b0:753:4894:9043 with SMTP id
 e17-20020a5b0891000000b0075348949043mr8589005ybq.337.1673564087388; Thu, 12
 Jan 2023 14:54:47 -0800 (PST)
MIME-Version: 1.0
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de> <20221213153553.648871-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221213153553.648871-3-u.kleine-koenig@pengutronix.de>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 12 Jan 2023 22:54:20 +0000
Message-ID: <CA+V-a8tweOM_Ebt2CUTbOy=Ox3+nxDnLbnsK2vGC5RE2BbvkRQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: ti/davinci: vpbe_venc: Drop empty platform
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
>  drivers/media/platform/ti/davinci/vpbe_venc.c | 6 ------
>  1 file changed, 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/davinci/vpbe_venc.c b/drivers/medi=
a/platform/ti/davinci/vpbe_venc.c
> index 4c8e31de12b1..6bde6517cba5 100644
> --- a/drivers/media/platform/ti/davinci/vpbe_venc.c
> +++ b/drivers/media/platform/ti/davinci/vpbe_venc.c
> @@ -655,14 +655,8 @@ static int venc_probe(struct platform_device *pdev)
>         return 0;
>  }
>
> -static int venc_remove(struct platform_device *pdev)
> -{
> -       return 0;
> -}
> -
>  static struct platform_driver venc_driver =3D {
>         .probe          =3D venc_probe,
> -       .remove         =3D venc_remove,
>         .driver         =3D {
>                 .name   =3D MODULE_NAME,
>         },
> --
> 2.38.1
>
