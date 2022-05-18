Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5E252B543
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 11:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbiERIw4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 May 2022 04:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiERIwu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 May 2022 04:52:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06CA24BCD
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 01:52:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id c10so2099079edr.2
        for <linux-media@vger.kernel.org>; Wed, 18 May 2022 01:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sUl/2w0FHGEFd1yNG4JHtApin45+2DomsZCC+yAliOc=;
        b=Tc3nKHzDxIWPKCBl7AMlh/+mZK19QD07dUH/YkLEdQFD0E6r3yaLFY1yj0B5/T3lHg
         thiXlvL/KqwdT7BCF9BaLt868EUY/Yb4UK+YDUio4oY53Ktlid+J7cacCCaJi1hBUB7H
         l0BViUnkcUt1TEQAUU+r+TLFU29rXWUobbH2rXRqyJ1hpdKdmBV5xgB0LFxS0F0Kuhfk
         A34HtGAVwoyLMItwSFl2Q5YUWgBQUA4WIXi6pZbGKDLN7uoNH96+Vl1+B4FjAXGt/L8R
         hK5KCw4PdOp82Z8XZ4SzEmNAaD8dwKG7hoY8udHnYs3OEZN5g1D8JbuE+NzCVpBkHmad
         ox5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sUl/2w0FHGEFd1yNG4JHtApin45+2DomsZCC+yAliOc=;
        b=Isc8vUDp2KA9yMe4jv21TQ64N58S84F/Qj+ozo84jP+htFNg6bYrkumdYOz3YvYoRD
         6TleBB6PnXeQ53Xaff9e/z7vs7H3zQSFJmDJo+pM9Vii5mRVgSP2BjzMZb/S66XwVhLb
         6+5vsdMGyxIgu37o9wvFXCyEXj1CyFNgNB94e92EjJpGxn/DdPx0HIX+YM5tMO/q8w3n
         ziqy6V9AVAFEaG43XHwE9aS7SDIeU3pkUL+l7gLV/ng/0wv1LLNtyzQ8DfGxrlCHcOP1
         3jN4YVyQKpmu8RSSYa70z76TEEcbAnErwbspRiSjhFLEqZCoqQPQJzgwtWU2p8oF8OCE
         289w==
X-Gm-Message-State: AOAM530mM2VnugTDJCXyQUiSW5aYuHQ/jjc57+6lHI+nYU21YnSD5Mur
        qlIp2RiS/GxXxY5ZFMYwWipN2S0aJcBd05W5c7igYA==
X-Google-Smtp-Source: ABdhPJwFEpWW7lhtFiDaUBxeWfO91o6nkeq0Tf9krhzJYDPhi+p6E1Yr9xlowJ7bIJju757LlPpQ13KtD/3pD8B9LWM=
X-Received: by 2002:aa7:d415:0:b0:42a:bb4d:7deb with SMTP id
 z21-20020aa7d415000000b0042abb4d7debmr12257819edq.6.1652863967416; Wed, 18
 May 2022 01:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
 <165243859864.2416244.4785590696956344599@Monstersaurus> <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
 <165282888670.2416244.4233841355061128997@Monstersaurus>
In-Reply-To: <165282888670.2416244.4233841355061128997@Monstersaurus>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 18 May 2022 09:52:30 +0100
Message-ID: <CAPY8ntC9Bu3SfUjy+HqrdFHcHQWmwYrZdsVRQWYFv+JJihhGbw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video
 Selection 2
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Benjamin Marty <info@benjaminmarty.ch>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 18 May 2022 at 00:08, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Dave Stevenson (2022-05-17 18:50:11)
> > On Fri, 13 May 2022 at 11:43, Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> > >
> > > Quoting Dave Stevenson (2022-05-12 14:56:45)
> > > > Hi Benjamin.
> > > >
> > > > On Thu, 12 May 2022 at 13:11, Benjamin Marty <info@benjaminmarty.ch> wrote:
> > > > >
> > > > > This bit is marked as reserved in the ADV Hardware Reference Manual.
> > > > >
> > > > > Resetting this bit seems to cause increased video noise. Setting this
> > > > > bit according to the Hardware Reference Manual reduces the video noise
> > > > > immediately.
> > > > >
> > > > > Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> > > > > ---
> > > > > version 2:
> > > > > - Fixed Kieran's remarks
> > > > >
> > > > >  drivers/media/i2c/adv7180.c | 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > > > > index 4f5db195e66d..992111fe249e 100644
> > > > > --- a/drivers/media/i2c/adv7180.c
> > > > > +++ b/drivers/media/i2c/adv7180.c
> > > > > @@ -43,6 +43,7 @@
> > > > >  #define ADV7180_INPUT_CONTROL_INSEL_MASK               0x0f
> > > > >
> > > > >  #define ADV7182_REG_INPUT_VIDSEL                       0x0002
> > > > > +#define ADV7182_REG_INPUT_RESERVED                     BIT(2)
> > > >
> > > > Responding to Kieran's comment on V1:
> > > > > If the bit is documented with a better name, then use that of course,
> > > > > otherwise perhaps even a comment in the code saying that failing to set
> > > > > the bit increases visible noise would be suitable. (or that setting the
> > > > > bit reduces noise, I guess it depends on if you think this bit is
> > > > > performing noise reduction, or if not setting it is introducing noise)
> > > >
> > > > I went digging through the datasheet for this info as I care about
> > > > ADV728[0|1|2]M.
> > > >
> > > > https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7182.pdf
> > > > page 68 defines bits 0-3 as reserved, and "set to default" which is
> > > > 0100b.
> > > > https://www.analog.com/media/en/technical-documentation/user-guides/ADV7280_7281_7282_7283_UG-637.pdf
> > > > page 70 says the same for ADV7280/ADV7281/ADV7282/ADV7283.
> > > >
> > > > So no name or detail in the docs over what the bits do.
> > > >
> > > > The patch does mean the driver more closely follows the datasheet, so
> > > > it looks good to me.
> > > >
> > > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > >
> > > > I'll try to find a couple of minutes to get my hardware out and
> > > > confirm I see the change in video noise.
> > >
> > > Great, Is there any way we can identify (easily?) if this is introducing
> > > noise reduction, or preventing noise being added?
> > >
> > > If it's introducing noise reduction, as a feature, that's quite
> > > different to causing noise if it's not set ... (Unless perhaps people
> > > have a desire to add noise :D)
> >
> > OK, I dug out my hardware. I'm doing the nasty with:
> > i2ctransfer -y -f 10 w2@0x21 0x02 0x84
> > and
> > i2ctransfer -y -f 10 w2@0x21 0x02 0x80
> > to flip back and forth between the two settings on my PAL source.
> >
> > It does reduce the noise, but also softens the image significantly.
> >
> > As slightly iffy photos to show the difference
> > https://photos.app.goo.gl/hLKxv3TP93gX864y8 is the new setting.
> > https://photos.app.goo.gl/sWxEhdvxHLUkGL1C8 is the old setting.
> > (Yes it's a very old F1 race that happened to be on this DVD/HDD recorder).
>
> It's a really tough test case, as I expect these are frame captures from
> two separate time points, rather than some paused frame, but I would say
> the text on the old setting is clearer. That could easily be due to
> differences in the actual content though.

Yes the frames are from a few seconds apart as I thought I'd left the
remote at home (actually I hadn't). I'll recapture them later today
for the same frame from a better source (probably a DVD).
The current settings are sharper, but significantly noisier.

> It might make me think this should be a control that could be
> dynamically set to allow the user to decide...
>
> Benjamin, how does it look on your system? I presume setting this bit
> improves image quality for your use case.
>
>
> > I couldn't honestly say I prefer one over the other (analogue video
> > really is grim!), but it does mean that we're following the datasheet
> > more accurately, so:
> >
> > Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > > But I think I could add this already:
> > >
> > >
> > > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> From a driver perspective, with no other existing expecatation - I would
> say matching the datasheet is the correct thing to do anyway.

That's my view too.

  Dave

> --
> Kieran
>
>
>
> > >
> > > >
> > > >   Dave
> > > >
> > > > >  #define ADV7180_REG_OUTPUT_CONTROL                     0x0003
> > > > >  #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL            0x0004
> > > > > @@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state *state)
> > > > >
> > > > >  static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
> > > > >  {
> > > > > -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
> > > > > +       /* Failing to set the reserved bit can result in increased video noise */
> > > > > +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> > > > > +                            (std << 4) | ADV7182_REG_INPUT_RESERVED);
> > > > >  }
> > > > >
> > > > >  enum adv7182_input_type {
> > > > > --
> > > > > 2.36.1
> > > > >
