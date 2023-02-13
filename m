Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 833EB694C10
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 17:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjBMQLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 11:11:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjBMQLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 11:11:00 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192D21EFFE
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:10:59 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id p26so33056027ejx.13
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 08:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDVfwvFSS8VJ1hXNKdD4Fk6lUNif8eaxpztOBA00pq8=;
        b=UzMY9Jb6/w+2sI+xuELNwlp0VLzvhyo00S1kY/JgKVTeRXd0g+NKkV2peL3XAdFdxy
         Qb4ULglTrGW1/BCDTIdHkekJ8s6VLVhnG2XOwngOEJB7z5N87vK8ONdhqnQxvMArjT2u
         a3BhsuA+hsLJnEjU/k3uKuEYuHRid9vZO5bEBZ4pYHv3n6JYgSbaC8mStHvZrMqTodMJ
         wKkiB3ZH+eyySkjg5O9Gv1Gnn7Afpd6SEeLIu5RiuwEg4oyBmesxjAX8AoI5nEZ/VeUP
         jEuQtYRWZYH3bypiBiI7aHhpnt+7jPvx+TSaclP26HlkWbzgw9qMBD6jxBXqGXl6cYs3
         OTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDVfwvFSS8VJ1hXNKdD4Fk6lUNif8eaxpztOBA00pq8=;
        b=Uva/jtDAM7nBuiY/mtPYPH78zURKs3GyT3MZT0sq9lhKZWs9FGlDd8oei8ZdE12UVA
         cmUIC3WitvUWcqoUcyy9YJVr3Td8V7+r/qxBY4O6asXPsNRvvLKjq2vNvoXppOKFr7dx
         JppKQmYxMK+1Xu9yI9bTI/AiWp0hNHM33l1RIc4CfZMt/EfhtiWyN5oGzT0QAbEiA1aw
         AwT+A3fSp6LIBrgp2XglNby7dAfL4lwsDNxdjIIRKwJD3F7YjTnGo0D2ADNCQ/5iRYO9
         FlcZBoh1bsXbHZIeOgrVHnrLTWzkr0Wc57a98CCrsuWxIMF3AA4zKaHB9GSdlTUSbZFt
         2mGw==
X-Gm-Message-State: AO0yUKWXciZDwNOATaoIcmYR3S/3EuvdV01KZuM3S/1TuDPiBTuU8lhm
        QsMnOcAr40CmHm4uyNaQC/ellA==
X-Google-Smtp-Source: AK7set/33YBrEtdyXyOpC22woKTcLm3Q0MFElqVoHN9LjkLAGhZfTDQ88py0bNCJCKfL/ziABy0/dg==
X-Received: by 2002:a17:907:d28:b0:8af:433d:5383 with SMTP id gn40-20020a1709070d2800b008af433d5383mr19717523ejc.9.1676304657722;
        Mon, 13 Feb 2023 08:10:57 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id m10-20020a170906580a00b0086f4b8f9e42sm6906326ejq.65.2023.02.13.08.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 08:10:57 -0800 (PST)
Date:   Mon, 13 Feb 2023 17:10:56 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rcar-csi2: Add support for C-PHY on R-Car V4H
Message-ID: <Y+phEOUAVMsWadOG@oden.dyn.berto.se>
References: <20230211145310.3819989-1-niklas.soderlund+renesas@ragnatech.se>
 <20230211145310.3819989-4-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdW4A9zx6SMFUZUz9EBCedRpiB3aJsXv+5V2ggx_09NbbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW4A9zx6SMFUZUz9EBCedRpiB3aJsXv+5V2ggx_09NbbQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for your feedback.

On 2023-02-13 16:45:18 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Sat, Feb 11, 2023 at 4:06 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > Add support for C-PHY on R-Car V4H. While the V4H supports both D-PHY
> > and C-PHY this patch only adds support for the C-PHY mode due to lack of
> > documentation and hardware to test on.
> >
> > The V4H is the first Gen4 device that is enabled in the rcar-csi2
> > driver. There is much overlap with the Gen3 driver, the primary
> > difference is in how the receiver is started. The V4H have a much larger
> > register space and some addresses overlap with Gen3.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> > +++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
> 
> > @@ -1503,6 +1781,12 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
> >         .support_dphy = true,
> >  };
> >
> > +static const struct rcar_csi2_info rcar_csi2_info_r8a779g0 = {
> > +       .start_receiver = rcsi2_start_receiver_v4h,
> 
> The description of "[PATCH 1/3] media: rcar-csi2: Prepare for Gen4
> support" suggests you also need a different procedure for
> .enter_standby()?  But perhaps not doing the procedure is just the right
> thing to do?

They are indeed different, but doing nothing in enter_standby() for V4H 
is the correct thing.

Maybe the function enter_standby(), could have been better named as 
enter_standby_extra() or pre_enter_standby(). As for both on Gen3 and 
V4H after enter_standby(), if present, have been called the rest 
controller is asserted and the module is powers off.

Only that on Gen3 which have more documentation an extra step to poke 
some registers before asserting the reset controller is documented, so 
this is what happens in rcsi2_enter_standby_gen3(). I would not be 
surprised as we get more documentation for V4H we will add a 
rcsi2_enter_standby_gen4() to match updates in the datasheet.


> 
> > +       .use_isp = true,
> > +       .support_cphy = true,
> > +};
> > +
> >  static const struct of_device_id rcar_csi2_of_table[] = {
> >         {
> >                 .compatible = "renesas,r8a774a1-csi2",
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Kind Regards,
Niklas Söderlund
