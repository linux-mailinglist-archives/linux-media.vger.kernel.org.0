Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148F552A999
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 19:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351548AbiEQRud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 13:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234949AbiEQRua (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 13:50:30 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA3F50063
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 10:50:29 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id fd25so10778909edb.3
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KZOKRTKUX4ZjOyAqfwKHb2UInptNU+qwp7FxgDRzOxw=;
        b=VBuXTPja0CEFg+ig4eRzzZSnVmOF/10iSpOFjEW6mcDnH8ys0HVGJixsPx2b0tbnA8
         sC8OgFn7xIXqhUpX2ELksZF7DgaAfHdZM2Hxe9jHRbhSfGmInMal+s6CwWkVk5Z7LvQG
         rZIEqHxU0uEYMmvBQiJiWghJiL84fhPSjqKf/5RPYynoJos9a1/1D+bTmSYLIBj9lMJ7
         TVXLoPcBNTAqLR5tbbNr4mrujcBRiNm/bS8nQg4lvBRv0QXSarO3kNzWStn+fnt96NfA
         xOh2CoRfC6sOrA4PNGV1f0PFByuGdP5TiUAxWUK5QypWYct4z5Jshaj3jJLT6d4Cuarj
         qZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KZOKRTKUX4ZjOyAqfwKHb2UInptNU+qwp7FxgDRzOxw=;
        b=OHRFAZWL27keK/hqpeemdas8mORZWzfP0itWkRO1VH0SBpb/tE+v3kaND6kKx8S8tF
         iaZhmHSAuaE85jcOGNIjdNHLp278v8i2OiueFuNiqPvWuP2OW0oy9Y3qSRRb9TF1pKnx
         7e6CcDsAtxMb1yI+5pdxpWVFwLXwlXiluCliH5NigpovEXdbd1vmKlF3hs5McaQE+hjz
         D7B1hVXu6GvIh2zzXzL/prt7S2hmQkKJsT4FIPYyecJ7bgcJW6WwoNfWI6oNFrUHpLio
         lLxD62ziuUzlSkaBqguqebXou9lDm5JjxNUDFgntgBEQxVv4thspWDrTbaAvbm76DFg1
         snRg==
X-Gm-Message-State: AOAM531xB6FD8O5RksUg+w3ukCc3ujOTyupnN4P06cZFyL8hpNfbxKri
        TRKvudg1bQqk9582eo1u37B6i8ORCJa5Ld8D4iPxXqndhe3ZjQ==
X-Google-Smtp-Source: ABdhPJxwZm26j3QGZ7ttYj2HLV2GSvysdH272nYkH3GKmMv82oNe1HCjTMsQyyJ4tdsghPvoI1foWaJL9brEGa6j7Hc=
X-Received: by 2002:a05:6402:d47:b0:42a:c276:def5 with SMTP id
 ec7-20020a0564020d4700b0042ac276def5mr6482682edb.136.1652809828023; Tue, 17
 May 2022 10:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
 <165243859864.2416244.4785590696956344599@Monstersaurus>
In-Reply-To: <165243859864.2416244.4785590696956344599@Monstersaurus>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 17 May 2022 18:50:11 +0100
Message-ID: <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
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

On Fri, 13 May 2022 at 11:43, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Dave Stevenson (2022-05-12 14:56:45)
> > Hi Benjamin.
> >
> > On Thu, 12 May 2022 at 13:11, Benjamin Marty <info@benjaminmarty.ch> wrote:
> > >
> > > This bit is marked as reserved in the ADV Hardware Reference Manual.
> > >
> > > Resetting this bit seems to cause increased video noise. Setting this
> > > bit according to the Hardware Reference Manual reduces the video noise
> > > immediately.
> > >
> > > Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> > > ---
> > > version 2:
> > > - Fixed Kieran's remarks
> > >
> > >  drivers/media/i2c/adv7180.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > > index 4f5db195e66d..992111fe249e 100644
> > > --- a/drivers/media/i2c/adv7180.c
> > > +++ b/drivers/media/i2c/adv7180.c
> > > @@ -43,6 +43,7 @@
> > >  #define ADV7180_INPUT_CONTROL_INSEL_MASK               0x0f
> > >
> > >  #define ADV7182_REG_INPUT_VIDSEL                       0x0002
> > > +#define ADV7182_REG_INPUT_RESERVED                     BIT(2)
> >
> > Responding to Kieran's comment on V1:
> > > If the bit is documented with a better name, then use that of course,
> > > otherwise perhaps even a comment in the code saying that failing to set
> > > the bit increases visible noise would be suitable. (or that setting the
> > > bit reduces noise, I guess it depends on if you think this bit is
> > > performing noise reduction, or if not setting it is introducing noise)
> >
> > I went digging through the datasheet for this info as I care about
> > ADV728[0|1|2]M.
> >
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7182.pdf
> > page 68 defines bits 0-3 as reserved, and "set to default" which is
> > 0100b.
> > https://www.analog.com/media/en/technical-documentation/user-guides/ADV7280_7281_7282_7283_UG-637.pdf
> > page 70 says the same for ADV7280/ADV7281/ADV7282/ADV7283.
> >
> > So no name or detail in the docs over what the bits do.
> >
> > The patch does mean the driver more closely follows the datasheet, so
> > it looks good to me.
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >
> > I'll try to find a couple of minutes to get my hardware out and
> > confirm I see the change in video noise.
>
> Great, Is there any way we can identify (easily?) if this is introducing
> noise reduction, or preventing noise being added?
>
> If it's introducing noise reduction, as a feature, that's quite
> different to causing noise if it's not set ... (Unless perhaps people
> have a desire to add noise :D)

OK, I dug out my hardware. I'm doing the nasty with:
i2ctransfer -y -f 10 w2@0x21 0x02 0x84
and
i2ctransfer -y -f 10 w2@0x21 0x02 0x80
to flip back and forth between the two settings on my PAL source.

It does reduce the noise, but also softens the image significantly.

As slightly iffy photos to show the difference
https://photos.app.goo.gl/hLKxv3TP93gX864y8 is the new setting.
https://photos.app.goo.gl/sWxEhdvxHLUkGL1C8 is the old setting.
(Yes it's a very old F1 race that happened to be on this DVD/HDD recorder).

I couldn't honestly say I prefer one over the other (analogue video
really is grim!), but it does mean that we're following the datasheet
more accurately, so:

Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> But I think I could add this already:
>
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> >
> >   Dave
> >
> > >  #define ADV7180_REG_OUTPUT_CONTROL                     0x0003
> > >  #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL            0x0004
> > > @@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state *state)
> > >
> > >  static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
> > >  {
> > > -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
> > > +       /* Failing to set the reserved bit can result in increased video noise */
> > > +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> > > +                            (std << 4) | ADV7182_REG_INPUT_RESERVED);
> > >  }
> > >
> > >  enum adv7182_input_type {
> > > --
> > > 2.36.1
> > >
