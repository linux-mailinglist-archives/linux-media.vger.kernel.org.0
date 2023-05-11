Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A976FEB68
	for <lists+linux-media@lfdr.de>; Thu, 11 May 2023 07:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236896AbjEKFuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 May 2023 01:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbjEKFuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 May 2023 01:50:37 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1248C273C
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 22:50:35 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-44ff6a049a7so2897678e0c.2
        for <linux-media@vger.kernel.org>; Wed, 10 May 2023 22:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683784234; x=1686376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TZUTUOuw8gS3YY4QfM/+qXEJz2gQxAmQCsDAHLbmhU=;
        b=cmQ4baQnxQ6OJaWyiKd9TwKrwVLa3z9moGFNjZHUpOJdcpGwRAgzMMUDJZMnfbWv8J
         QGiI7irEoRuJrTYfRvNNvXnt4McMMkn6LRHsWtp6fbJHSE0OkTfKZBk9uWpVHzEP7euO
         N/kNcWjhR6aHrPQP8chTmD6UOlmnRpa+cAmiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683784234; x=1686376234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TZUTUOuw8gS3YY4QfM/+qXEJz2gQxAmQCsDAHLbmhU=;
        b=lwISP296R7P1XDYAaLOuu3H7hpkuYnwFT7T7Y/Ycb7ACHilspGQ3bE8MBP3EDPoTNc
         P+l/DJb8mfJuu+EMLLfZj5nC620qAu10N4SpckwbiAINcvWWAAqOs8wXB6F9sSnpWJVW
         69zhdc0IeKUk92dCrGygBRIsWOmoYJ9ylEwflWGKTSO7twmfuoY0WJGmS3OgGTdFo3Nx
         YvZpqD/pbx+P2VF1r8/OspLYYzmJqWH9qb9MxGormCOdDspXoVwEOQeGQv2EVfqQNn9b
         gnT4etBrAjiSBzZ4ahK+NHpBUbEUmLlQTI8+szCKaRYGkopcZsRCeOw14EfFZMpUcY/L
         i4TQ==
X-Gm-Message-State: AC+VfDwoYp2paUWZbWXdfpC1lXJq71F/ZPoYUn6nsu5sebeNI7r0CDVu
        P/tUctCu8BMWTsv/7xW5K4Mf9YkBywK+kSE4iYY3kw==
X-Google-Smtp-Source: ACHHUZ7fGE4nB3zdLHbvSnPzibOTMUdkLYtLPvJiu7zEMVz/OES4+wnOovyGzoWDL0QKVJZH9Czbi0nR2DM+Cg67Ouk=
X-Received: by 2002:a1f:3f8a:0:b0:44f:a64b:479b with SMTP id
 m132-20020a1f3f8a000000b0044fa64b479bmr6002540vka.6.1683784234113; Wed, 10
 May 2023 22:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230510233117.1.I7047714f92ef7569bd21f118ae6aee20b3175a92@changeid>
 <20230510164330.z2ygkl7vws6fci75@pengutronix.de>
In-Reply-To: <20230510164330.z2ygkl7vws6fci75@pengutronix.de>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 11 May 2023 13:50:23 +0800
Message-ID: <CAGXv+5HBM+eksJaxL2GqLfqSmK8vsQx5NXHfhe075HkOK3vjHw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Convert mtk_vcodec_dec_hw
 platform remove callback
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Fei Shao <fshao@chromium.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 11, 2023 at 12:43=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> [expanding the audience a bit for more expertise]
>
> Hello,
>
> On Wed, May 10, 2023 at 11:31:35PM +0800, Fei Shao wrote:
> > This aligns with [1] and converts the platform remove callback to
> > .remove_new(), which returns void.
> >
> > [1]: commit a3afc5b10661 ("media: mtk_vcodec_dec_drv: Convert to
> >      platform remove callback returning void")
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c=
 b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > index b753bf54ebd9..bd5743723da6 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_hw.c
> > @@ -193,16 +193,14 @@ static int mtk_vdec_hw_probe(struct platform_devi=
ce *pdev)
> >       return ret;
> >  }
> >
> > -static int mtk_vdec_hw_remove(struct platform_device *pdev)
> > +static void mtk_vdec_hw_remove(struct platform_device *pdev)
> >  {
> >       pm_runtime_disable(&pdev->dev);
> > -
> > -     return 0;
> >  }
> >
> >  static struct platform_driver mtk_vdec_driver =3D {
> >       .probe  =3D mtk_vdec_hw_probe,
> > -     .remove =3D mtk_vdec_hw_remove,
> > +     .remove_new =3D mtk_vdec_hw_remove,
> >       .driver =3D {
> >               .name   =3D "mtk-vdec-comp",
> >               .of_match_table =3D mtk_vdec_hw_match,
>
> While the patch looks fine, I wonder if having a remove callback just to
> do pm_runtime_disable() is worth keeping it. Doesn't the core care for
> things like that? I grepped a bit around, device_unbind_cleanup() is
> called after device_remove() which calls pm_runtime_reinit(). Does that
> mean calling pm_runtime_disable in .remove() is useless? In that case,
> you could just drop the .remove() callback.

Maybe just switch to devm_pm_runtime_enable() on the enable side?

ChenYu
