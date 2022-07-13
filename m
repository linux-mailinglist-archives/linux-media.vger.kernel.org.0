Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE5D57326D
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 11:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbiGMJ2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 05:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiGMJ2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 05:28:11 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E77F1E0C;
        Wed, 13 Jul 2022 02:28:09 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id mi10so4418347qvb.1;
        Wed, 13 Jul 2022 02:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuFFYxmqMjCJ8pz73zGncdvFFI6WJ0UAqWokCvCbxfc=;
        b=KVKhZaBIqFGBmpI8gsC+TAU9mC0vjMozW3XLpxunqQUeSwL+Uznz2VQmwpULFU5BjG
         XyX5TSBwVgiH41I6DJp1B7Qn+Tr3KqtsXAQ3G9+06YnUA6MuDovcthI0G2WHEa743f0N
         jdFYn/yWRHnEWAb7PUJse7KU8sSChDp+W7hFEg7NXp7m/CjYMfuR6EcOtfHVI4oxRrAQ
         zZSacgjZDV91uGC/MRCatdw1aku0jKJgVAkAzFnHU95NwpE5yC+DVLV/3H+z/ONBRUFI
         +dA63JJFZq44x3pf27+Va4nV5dviSN9Q0RUJHRUoQjFA5bX9JJnvaJEe68oZf2mu8vRI
         SGYg==
X-Gm-Message-State: AJIora9FafFSLPJhmjGc9HLNJRVcd1GT3izW31wlleufnDt4SbCUx+y6
        lCcsSg+mMXnlj/fEVW1XJL7TMOiPH7ZTMQ==
X-Google-Smtp-Source: AGRyM1vXo0w+MMlwHADe/UQ5Mxg3mUsjpdx1hiccs4hFDcwGbC1BQr/zKka3731cDB2jHmQXOekjTg==
X-Received: by 2002:a05:6214:20a7:b0:473:4571:3721 with SMTP id 7-20020a05621420a700b0047345713721mr1964941qvd.60.1657704488624;
        Wed, 13 Jul 2022 02:28:08 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id t16-20020ac85310000000b003177969a48fsm9274131qtn.21.2022.07.13.02.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 02:28:08 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-31c89653790so106045077b3.13;
        Wed, 13 Jul 2022 02:28:08 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr2947064ywd.283.1657704487775; Wed, 13
 Jul 2022 02:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com> <20220713081856.GA14683@pengutronix.de>
 <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jul 2022 11:27:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
Message-ID: <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Biju,

On Wed, Jul 13, 2022 at 11:18 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> > deassert/assert reset line
> >
> > On Tue, May 31, 2022 at 03:19:55PM +0100, Biju Das wrote:
> > > As the resets DT property is mandatory, and is present in all .dtsi in
> > > mainline, add support to perform deassert/assert using reference
> > > counted reset handle.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > v10->v11:
> > >  * To avoid lock-up on R-Car Gen2, added poll for reset status after
> > deassert.
> >
> > I didn't look at this earlier because of my preexisting R-b.
> > It looks to me like this should be moved into the reset driver.
>
> OK, sorry, I should have removed Rb tag while sending this patch.
>
> > [...]
> > > @@ -631,13 +634,33 @@ static int __maybe_unused
> > vsp1_pm_runtime_resume(struct device *dev)
> > >     struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> > >     int ret;
> > >
> > > +   ret = reset_control_deassert(vsp1->rstc);
> > > +   if (ret < 0)
> > > +           return ret;
> > > +
> > > +   /*
> > > +    * On R-Car Gen2, vsp1 register access after deassert can cause
> > > +    * lock-up. Therefore, we need to poll the status of the reset to
> > > +    * avoid lock-up.
> > > +    */
> > > +   ret = read_poll_timeout_atomic(reset_control_status, ret, ret == 0,
> > 1,
> > > +                                  100, false, vsp1->rstc);
> >
> > So the reset driver does not follow the reset API documentation ("After
> > calling this function, the reset is guaranteed to be deasserted." [1])?
> > If so, this status polling should be moved into the reset driver.
> >
>
> Sure, will move it to reset driver. Geert also suggested same thing[1]

Actually I suggested handling this in the VSP driver, as VSP seems
to be "special".

>
> [1]
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220504184406.93788-1-biju.das.jz@bp.renesas.com/
>
>
> > Also, why use the atomic poll variant here? As far as I can tell, this
> > driver doesn't call pm_runtime_irq_safe. The reset_control_deassert() API
> > does not guarantee that the driver implementation doesn't sleep, either.
>
> As per [1], I2C driver uses atomic one, so just used the same here.
>
> OK, will use non atomic variant in deassert().
>
> Do you recommend to fix the reset as well as per [1]?
>
> >
> > [...]
> > > @@ -825,6 +848,11 @@ static int vsp1_probe(struct platform_device
> > *pdev)
> > >     if (irq < 0)
> > >             return irq;
> > >
> > > +   vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
> > > +   if (IS_ERR(vsp1->rstc))
> > > +           return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > > +                                "failed to get reset control\n");
> > > +
> >
> > What about the other consumers of this shared reset? Don't they need the
> > status poll you added here as well?
>
> This lockup issue happens only on Gen2 SoC's. Gen3 SoC's are not affected.

We are not sure about that.  On R-Car Gen3, accesses to registers
while a device is not clocked/ready usually do not cause an imprecise
external abort in Linux, unlike on R-Car Gen2.  But perhaps the
abort is caught by the firmware, and nullified?

> RZ/G2L SoC is Gen3 variant, and it is the only consumer for shared reset as reset lines are shared between DU and VSPD. Other SoC's have explicit reset for VSP.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
