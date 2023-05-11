Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8B976FEBD9
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 08:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbjEKGnC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 02:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjEKGm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 02:42:59 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFD046A6
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 23:42:57 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-559e317eef1so121408127b3.0
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 23:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683787376; x=1686379376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPmMK/vjZZrn+75oLPGLVOkpQXhNBYzPy7ovkiUarXQ=;
        b=kYziRZEGFkdIAkSnHevawmmAZe12fcrq0m0m+OhpQjK7no2ZH2UKvi4P5fh6lvezMH
         KNRWgZs2dl8m/vtZeo3Z5aWoFDEaSZAq03PHFheSjloBNuKphB8ZLN80AX4sFmSFdM7C
         iJatjmeeEQN3GyBDLwXmZIWlFcx//nb6wRMjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683787376; x=1686379376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPmMK/vjZZrn+75oLPGLVOkpQXhNBYzPy7ovkiUarXQ=;
        b=dH1IgWjx+Ce/t9VqoGQf9hcW3wW58K+h8bXUqgmcxbJezT2guiAX265LTBpDDY3tJg
         lItTbGNNkoYuP18SS+jEl7aSpyLwHVqwT+M8nVefrzSLq/PCLQVIQD8HPlQl9guZ7Tt7
         ORlq490Cdw+PZ5E/ZUHsRZLQICvWWWABFpmZ0afH9/SzE7CDIF9Pc9JEH8EMUwKsCw4Z
         zJtKK8onVlNmxB4VpUFmYfWOfrppqSCAPgiYfnNXhvVN9aScEkfiNNNJDwoQbBcYHpnl
         aJN/vtOSffvJ9WIpuShG05mCbPakiyAmuCuNs4U9Ypyq6txSJRhD8HjNnAR2o4Qw9cgn
         g3kA==
X-Gm-Message-State: AC+VfDzFRbUZZ6tCUrnymjehnZq8MQFkae/nKxrrAfu0HLnwcfVxwnTq
        GwD9XMH4y2BKEq4HcGZ9AU+5B1CG5y5lP5dZlG3v8Q==
X-Google-Smtp-Source: ACHHUZ7Cgla6fclCQUcGb3zaJ14PmcFlIgc73/kyF1iGduj6PrCtoLXAN4+kHbrCuo1qamJkwkJZnQ==
X-Received: by 2002:a25:641:0:b0:b9e:d6ac:6941 with SMTP id 62-20020a250641000000b00b9ed6ac6941mr19346472ybg.8.1683787376510;
        Wed, 10 May 2023 23:42:56 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id t204-20020a0dead5000000b0055a1069886fsm4645720ywe.129.2023.05.10.23.42.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 23:42:56 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-559e317eef1so121407877b3.0
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 23:42:56 -0700 (PDT)
X-Received: by 2002:a5e:8e07:0:b0:760:ea63:3385 with SMTP id
 a7-20020a5e8e07000000b00760ea633385mr13727151ion.19.1683786980560; Wed, 10
 May 2023 23:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
 <20230510164330.z2ygkl7vws6fci75@pengutronix.de> <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
In-Reply-To: <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Thu, 11 May 2023 14:35:43 +0800
X-Gmail-Original-Message-ID: <CAC=S1niad5qa-rGFSqqRQX=DZN9f4U=WWoP8-A0LQ-UyF31OnA@mail.gmail.com>
Message-ID: <CAC=S1niad5qa-rGFSqqRQX=DZN9f4U=WWoP8-A0LQ-UyF31OnA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw
 platform remove callback
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On Thu, May 11, 2023 at 1:50=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> On Thu, May 11, 2023 at 12:43=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > [expanding the audience a bit for more expertise]
> >
> > Hello,
> >
> > On Wed, May 10, 2023 at 11:31:35PM +0800, Fei Shao wrote:
> > > This aligns with [1] and converts the platform remove callback to
> > > .remove_new(), which returns void.
> > >
> > > [1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
> > >      platform remove callback returning void")
> > >
> > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > >
> > > ---
> > >
> > >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++---=
-
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw=
.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > index b753bf54ebd9..bd5743723da6 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > > @@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_de=
vice *pdev)
> > >       return ret;
> > >  }
> > >
> > > -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> > > +static void mtk_vdec_hw_remove(struct platform_device *pdev)
> > >  {
> > >       pm_runtime_disable(&pdev->dev);
> > > -
> > > -     return 0;
> > >  }
> > >
> > >  static struct platform_driver mtk_vdec_driver =3D {
> > >       .probe  =3D mtk_vdec_hw_probe,
> > > -     .remove =3D mtk_vdec_hw_remove,
> > > +     .remove_new =3D mtk_vdec_hw_remove,
> > >       .driver =3D {
> > >               .name   =3D "mtk-vdec-comp",
> > >               .of_match_table =3D mtk_vdec_hw_match,
> >
> > While the patch looks fine, I wonder if having a remove callback just t=
o
> > do pm_runtime_disable() is worth keeping it. Doesn't the core care for
> > things like that? I grepped a bit around, device_unbind_cleanup() is
> > called after device_remove() which calls pm_runtime_reinit(). Does that
> > mean calling pm_runtime_disable in .remove() is useless? In that case,
> > you could just drop the .remove() callback.

Thanks for the feedback.

I wonder if the core would handle that for drivers... if I understand
it correctly, pm_runtime_reinit() does not disable runtime PM for a
device, otherwise pm_runtime_remove() wouldn't need to bother
calling __pm_runtime_disable() before pm_runtime_reinit().

In fact, from the runtime_pm documentation [1] I read the following:
"Drivers in ->remove() callback should undo the runtime PM changes
done in ->probe(). Usually this means calling pm_runtime_disable(),
pm_runtime_dont_use_autosuspend() etc."

Based on the above I assume it's still necessary given pm_runtime_enable()
was called in ->probe().

[1]: https://www.kernel.org/doc/Documentation/power/runtime_pm.txt

>
> Maybe just switch to devm_pm_runtime_enable() on the enable side?

That sounds like a good alternative, I'll revise and send a new patch, than=
ks.

Regards,
Fei

>
> ChenYu
