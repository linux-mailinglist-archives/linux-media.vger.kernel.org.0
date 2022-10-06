Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31575F672F
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 15:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiJFNDS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 09:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiJFNDQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 09:03:16 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56CC9DD8F
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 06:03:15 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a2so4351370ejx.10
        for <linux-media@vger.kernel.org>; Thu, 06 Oct 2022 06:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ImtqKNyv6Fw7vLvQT8KQyz6n4JXNPwX5y7850MBZooI=;
        b=ByCCkJdgW17vleTAUu92ZtoVxYwZz85h33xpBa272mqoitnSWZCup2a7nWV9liuYbN
         jAQdgubp1a+LDne7QcOusLRGA7Pv0Ytj3gEQoUF113HGAvedCVQ6PpCet/EwSDU7zFGG
         hZpbFoe3A8EK/usgsLEL6cxQukbthaVZLyRZyR5ISV1Pcgkky6KAFiXrX2IVecUBIUAv
         Psn1RI1tzhK2RaQmHhwQeuhxmpB4c8eS2G12pZlITJrnMo3kk6RrY+9EXlJUD72OHdlc
         muxAshTi/mySlwABpc02X55ZLOUfCC/Tylj/78WTHA1YVHCKP2+cR/SKKhKGsGalUEdU
         PNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ImtqKNyv6Fw7vLvQT8KQyz6n4JXNPwX5y7850MBZooI=;
        b=v9kBKL2Ord3tSp3mPi7H4haPREPr0sb5x2WbbGR5VB/KynABIdfxA96wOnUz1TrvAN
         nsSQ2ilMQWzSeddOL86ZYaASQLVzclIfPXwzmrWrrY+teJbefzTcjT2tbtyPJZxz7iJO
         keKhtjVBkPG1H3xAN0pslQ7lkYB8KRd/kKuybngLAShfyL9l4w9mW27pPCVT+rVyqeb5
         RonjTccBat4085sMBbf6HVIeGvI5TIrL0tKzjsG3JmKq8UgPAcqIDRK67n05+DD6Q9PQ
         7b4swv1I17kvxLf3oUAPHLuLHEV/cHSgqtNsv1NUy+597pZy5dFrb7gyVwqP3u4rMjuq
         eVtQ==
X-Gm-Message-State: ACrzQf2Fc15lPSaZBqY+wmvCatr2GdUSUmqW6VOE12qRDKx+sK5PCR7C
        IQSY6ZcvoqjGRlE+5W042le502dU4ieTnvT275KreQ==
X-Google-Smtp-Source: AMsMyM6bOOGcuyJfim2SW/zNnjG6EitsbRbjwAbh8TewtuJHTU2emXjVoN3pZM6dUK0MavpRKnCkWJA4cAcJwIS72rM=
X-Received: by 2002:a17:907:8b0f:b0:783:6169:5bc5 with SMTP id
 sz15-20020a1709078b0f00b0078361695bc5mr4053209ejc.200.1665061394344; Thu, 06
 Oct 2022 06:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221005152809.3785786-1-dave.stevenson@raspberrypi.com>
 <20221005152809.3785786-8-dave.stevenson@raspberrypi.com> <20221006115610.zwyocdduhexusfyb@uno.localdomain>
In-Reply-To: <20221006115610.zwyocdduhexusfyb@uno.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 6 Oct 2022 14:02:54 +0100
Message-ID: <CAPY8ntAJuNDfb5UozD22qzBBcecQEJqWh2qTf+85yLonn6kS5Q@mail.gmail.com>
Subject: Re: [PATCH 07/16] media: i2c: ov9282: Reduce vblank_min values based
 on testing
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     paul.j.murphy@intel.com, daniele.alessandrelli@intel.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

On Thu, 6 Oct 2022 at 12:56, Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Dave,
>
> On Wed, Oct 05, 2022 at 04:28:00PM +0100, Dave Stevenson wrote:
> > The configured vblank_min setting of 250 (meaning VTS of
>
> Do you mean 151 ?

I did. Misread hblank for vblank.

  Dave

> > 720 + 250 = 970) is far higher than the setting that works on
> > the sensor, and there are no obvious restrictions stated in the
> > datasheet.
> >
> > Reduce the vblank_min to allow for faster frame rates.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/ov9282.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index 1cd6cb4addfb..abb1223c0260 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -268,7 +268,7 @@ static const struct ov9282_mode supported_modes[] = {
> >               .height = 720,
> >               .hblank = 250,
> >               .vblank = 1022,
> > -             .vblank_min = 151,
> > +             .vblank_min = 41,
> >               .vblank_max = 51540,
> >               .link_freq_idx = 0,
> >               .reg_list = {
> > --
> > 2.34.1
> >
