Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A50539FAE
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 10:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350917AbiFAIjs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 04:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350792AbiFAIjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 04:39:47 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE045FF2B
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 01:39:46 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id c14so1240393pgu.13
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 01:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/hlGZJChg6yeZr8dizwcygIwZeI0usKJn+aja9BC6uQ=;
        b=kbNZu03feANSW4Cj0446mG43egRTmCEdShrLXtPzqgPEFSLoqC8PxdX+0TwFK+eHaq
         gasv/i/pMdr+HJrGBhWTAFKHTVwnn8wSMJaVFl/BNbHP3y+m6pAasA5ZqOXmRbW/bZ6P
         AhG+erR0o1RNqNeb4wZ3YEwxK9fhtEoADXPd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/hlGZJChg6yeZr8dizwcygIwZeI0usKJn+aja9BC6uQ=;
        b=h467pMys/y/csVEVedVjkibzsOvjG5vtURmovT8EKaMze/dU5UdwkAavhAJL5Axvm8
         nyis3qt1HcuXS8znktISOT5899BN3qJ7Gp/a1j4pcb1xMou6rh44gDZJd79GhRegXpgZ
         dBuqIwqBHWyN5tD9ri0EnJIoqeUvo5nv9MdBsfVgVxQa4nP82wRtffR/FH1sC9Bp9tqS
         P2RD7eDnQh85oTDHQjBuZHKViwJJnx4c6FMqrPaPdkhNokIGr/Q4QywI7MsY6jYKE22Z
         VFGgXVBJfz5h4NjEUhfXd0LfdP5iVyX1vClB0OgQL8kAFfD9DWchdEEw3Hc4cL9TFTZ6
         FptQ==
X-Gm-Message-State: AOAM5314HX+qBQRyt/FLJicKKf+UV3SCkw9wilvJ6+vGcP0aPeS6Jn8e
        ov7ijUFKrAVQbJIzPhY4t9jPjEUUO/AP01vjafpzJg==
X-Google-Smtp-Source: ABdhPJwOoKIaZ0Q7fZF4xk7xVQnTGZTj1phoAQ+dPWj3dBBmM5G6t/1ciGWPUVxtZbMs6zlAIBVOnd/y7QerGIMFuFI=
X-Received: by 2002:a63:cd01:0:b0:3f2:7f8d:14e8 with SMTP id
 i1-20020a63cd01000000b003f27f8d14e8mr56746779pgg.491.1654072785734; Wed, 01
 Jun 2022 01:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220519075117.1003520-1-tommaso.merciai@amarulasolutions.com>
 <20220519075117.1003520-2-tommaso.merciai@amarulasolutions.com>
 <20220531131409.f54znvogejkwqqkf@uno.localdomain> <20220531154040.GA1331064@tom-ThinkPad-T14s-Gen-2i>
 <CAOf5uwmNoSPifCo8_hLZyr=DzMqL0r2Ftot2jneEVpAT8AyYVg@mail.gmail.com> <20220601081129.jlasfmvjyvqr4brd@uno.localdomain>
In-Reply-To: <20220601081129.jlasfmvjyvqr4brd@uno.localdomain>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Wed, 1 Jun 2022 10:39:34 +0200
Message-ID: <CAOf5uwmZDbT5mb3awjj1ggnVF7WQhHA3mYnt51nrzZUy1mArRA@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: i2c: ov5695: use regulator_bulk_enable/regulator_bulk
 disable instead of for loop
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Wed, Jun 1, 2022 at 10:11 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Micheal,
>
> On Tue, May 31, 2022 at 05:50:51PM +0200, Michael Nazzareno Trimarchi wrote:
> > Hi
> >
> > On Tue, May 31, 2022 at 5:40 PM Tommaso Merciai
> > <tommaso.merciai@amarulasolutions.com> wrote:
> > >
> > > Hi Jacopo,
> > > On Tue, May 31, 2022 at 03:14:09PM +0200, Jacopo Mondi wrote:
> > > > Hi Tommaso,
> > > >
> > > > On Thu, May 19, 2022 at 09:51:14AM +0200, Tommaso Merciai wrote:
> > > > > Enable regulator using regulator_bulk_enable/regulatore_bulk_disable
> > > > > function in __ov5695_power_on/__ov5695_power_off function instead of for loop.
> > > > > This reduce code size and make things more clear
> > > > >
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > > > > Co-Developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> > > > > ---
> > > > >  drivers/media/i2c/ov5695.c | 25 +++++++------------------
> > > > >  1 file changed, 7 insertions(+), 18 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
> > > > > index 439385938a51..880b586e55fe 100644
> > > > > --- a/drivers/media/i2c/ov5695.c
> > > > > +++ b/drivers/media/i2c/ov5695.c
> > > > > @@ -972,7 +972,7 @@ static int ov5695_s_stream(struct v4l2_subdev *sd, int on)
> > > > >
> > > > >  static int __ov5695_power_on(struct ov5695 *ov5695)
> > > > >  {
> > > > > -   int i, ret;
> > > > > +   int ret;
> > > > >     struct device *dev = &ov5695->client->dev;
> > > > >
> > > > >     ret = clk_prepare_enable(ov5695->xvclk);
> > > > > @@ -987,13 +987,10 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
> > > > >      * The hardware requires the regulators to be powered on in order,
> > > > >      * so enable them one by one.
> > > > >      */
> > > >
> > > > The comment says that the hardware requires regulators to be enabled
> > > > in precise order
> > > >
> >
> > They are enabled on the array order.
> >
> > > > > -   for (i = 0; i < OV5695_NUM_SUPPLIES; i++) {
> > > > > -           ret = regulator_enable(ov5695->supplies[i].consumer);
> > > > > -           if (ret) {
> > > > > -                   dev_err(dev, "Failed to enable %s: %d\n",
> > > > > -                           ov5695->supplies[i].supply, ret);
> > > > > -                   goto disable_reg_clk;
> > > > > -           }
> > > > > +   ret = regulator_bulk_enable(ARRAY_SIZE(ov5695->supplies), ov5695->supplies);
> > > >
> > > > bulk_enable() uses the async API (async_schedule_domain() in
> > > > particular) which by the name makes me think such ordering guarantee
> > > > cannot be respected.
> >
> > I don't think so. Will make no sense because if it fails, revert them.
> > Even the bulk disable disable them
> > in reverse order
> >
>
> I understand your points, but even the commit message in the patch
> linked by Tommaso [1] (which I see in mainline as
> f1a64f56663e ("media: i2c: ov5695: Fix power on and off sequences"))
> reports:
>
> "Given the bulk API does not give any guarantee about the order of
> regulators, change the driver to use regulator_disable() instead."
>
> However I would have expected the core regulator API to clearly document
> this behaviour.
>

Yes, I agree. I see two points:
- patch f1a64f56663e is not fully consistent
- a patch is needed to the regulator api documentation

I think that we need better documentation of the api but:
Work-queues are SMP-safe and guarantee serialization of actual work performed.

Michael



>
> > > >
> > > > However most sensors require some kind of ordering when enabling
> > > > regulators, and most of the use the bulk API anyhow. The fact this
> > > > driver uses the bulk API to get an release the regulators but not for
> > > > enabling them and the above comment, makes me think it has been done
> > > > on purpose ? Could you check with the driver author maybe ?
> > >
> > > Thanks for suggestion, good question.
> > > I see also ov5693 driver use bulk_enable/bulk_disable
> > > on ov5693_sensor_powerdown and ov5693_sensor_powerup functions, I take
> > > this as reference (and I'm wrong)
> > >
> > > In a functional test on PX30_Mini_evb_v11_20190507, after this series
> > > I'm able to see the correct chip id during probe and do some capture.
> > >
> > > I think you are right Jacopo, we can drop off this [PATCH 1/4]
> > > On the following link I found the issue that you describe: [1]
> > >
> >
> > WHy drop?
>
> As this is a partial revert of [1].
>
> I think in practice this won't make any actual difference, but if not
> 100% sure, better leave it the way it is as the authors of [1] might
> have actually been experiencing issues. Even more as this patch is
> not a bugfix but a nice-to-have. Up to you :)
>
>
> >
> > Michael
> >
> > > >
> > > > > +   if (ret) {
> > > > > +           dev_err(dev, "Failed to enable regulators %d\n", ret);
> > > > > +           goto disable_reg_clk;
> > > > >     }
> > > > >
> > > > >     gpiod_set_value_cansleep(ov5695->reset_gpio, 0);
> > > > > @@ -1003,8 +1000,7 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
> > > > >     return 0;
> > > > >
> > > > >  disable_reg_clk:
> > > > > -   for (--i; i >= 0; i--)
> > > > > -           regulator_disable(ov5695->supplies[i].consumer);
> > > > > +   regulator_bulk_disable(ARRAY_SIZE(ov5695->supplies), ov5695->supplies);
> > > >
> > > > FYI the bulk API does this for you if enabling any of the regulators fails.
> > > > Hence this should not be necessary.
> > >
> > > Thanks for sharing! This is new to me.
> > > I'll update the series on v2 removing this patch.
> > >
> > > Regards,
> > > Tommaso
> > >
> > > [1]: https://mailweb.openeuler.org/hyperkitty/list/kernel@openeuler.org/message/4X54QYJDRRE4K5BW4FTDZUGRAL4GRQWY/
> > >
> > > > Thanks
> > > >    j
> > > >
> > > > >     clk_disable_unprepare(ov5695->xvclk);
> > > > >
> > > > >     return ret;
> > > > > @@ -1012,8 +1008,6 @@ static int __ov5695_power_on(struct ov5695 *ov5695)
> > > > >
> > > > >  static void __ov5695_power_off(struct ov5695 *ov5695)
> > > > >  {
> > > > > -   struct device *dev = &ov5695->client->dev;
> > > > > -   int i, ret;
> > > > >
> > > > >     clk_disable_unprepare(ov5695->xvclk);
> > > > >     gpiod_set_value_cansleep(ov5695->reset_gpio, 1);
> > > > > @@ -1022,12 +1016,7 @@ static void __ov5695_power_off(struct ov5695 *ov5695)
> > > > >      * The hardware requires the regulators to be powered off in order,
> > > > >      * so disable them one by one.
> > > > >      */
> > > > > -   for (i = OV5695_NUM_SUPPLIES - 1; i >= 0; i--) {
> > > > > -           ret = regulator_disable(ov5695->supplies[i].consumer);
> > > > > -           if (ret)
> > > > > -                   dev_err(dev, "Failed to disable %s: %d\n",
> > > > > -                           ov5695->supplies[i].supply, ret);
> > > > > -   }
> > > > > +   regulator_bulk_disable(ARRAY_SIZE(ov5695->supplies), ov5695->supplies);
> > > > >  }
> > > > >
> > > > >  static int __maybe_unused ov5695_runtime_resume(struct device *dev)
> > > > > --
> > > > > 2.25.1
> > > > >
> > >
> > > --
> > > Tommaso Merciai
> > > Embedded Linux Engineer
> > > tommaso.merciai@amarulasolutions.com
> > > __________________________________
> > >
> > > Amarula Solutions SRL
> > > Via Le Canevare 30, 31100 Treviso, Veneto, IT
> > > T. +39 042 243 5310
> > > info@amarulasolutions.com
> > > www.amarulasolutions.com
> >
> >
> >
> > --
> > Michael Nazzareno Trimarchi
> > Co-Founder & Chief Executive Officer
> > M. +39 347 913 2170
> > michael@amarulasolutions.com
> > __________________________________
> >
> > Amarula Solutions BV
> > Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> > T. +31 (0)85 111 9172
> > info@amarulasolutions.com
> > www.amarulasolutions.com



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
