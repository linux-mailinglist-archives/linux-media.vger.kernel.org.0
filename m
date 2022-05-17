Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E26DB52AE6C
	for <lists+linux-media@lfdr.de>; Wed, 18 May 2022 01:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbiEQXIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 19:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbiEQXIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 19:08:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A0E337AA8
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 16:08:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 341934A8;
        Wed, 18 May 2022 01:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652828889;
        bh=XIZIu57x286mw5Zeq61JLUEb3y2bHFvbmI48RX6juBk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GqHTJGh/uS/iWTtcAbxbGufo4ZBaH51Q6S1qmWlDUjM4hYmSFKACitujBbKxHxyX1
         mOkNY+c11Sm8gKb1ksw4rBXFBDcXn5jpuF0LnYSSFKTyJGMxflnsOUR2Ccjq+WAR7u
         aCsvTtLsoh+ZaxBWsB1IN9rTY+1l2y3hJ53Nqr9U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com> <165243859864.2416244.4785590696956344599@Monstersaurus> <CAPY8ntDfnZG_+43gMz2D=v9eUBX8zjbJpDpwm1a8tTT4ak8drw@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video Selection 2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Benjamin Marty <info@benjaminmarty.ch>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 18 May 2022 00:08:06 +0100
Message-ID: <165282888670.2416244.4233841355061128997@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dave Stevenson (2022-05-17 18:50:11)
> On Fri, 13 May 2022 at 11:43, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Quoting Dave Stevenson (2022-05-12 14:56:45)
> > > Hi Benjamin.
> > >
> > > On Thu, 12 May 2022 at 13:11, Benjamin Marty <info@benjaminmarty.ch> =
wrote:
> > > >
> > > > This bit is marked as reserved in the ADV Hardware Reference Manual.
> > > >
> > > > Resetting this bit seems to cause increased video noise. Setting th=
is
> > > > bit according to the Hardware Reference Manual reduces the video no=
ise
> > > > immediately.
> > > >
> > > > Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> > > > ---
> > > > version 2:
> > > > - Fixed Kieran's remarks
> > > >
> > > >  drivers/media/i2c/adv7180.c | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv718=
0.c
> > > > index 4f5db195e66d..992111fe249e 100644
> > > > --- a/drivers/media/i2c/adv7180.c
> > > > +++ b/drivers/media/i2c/adv7180.c
> > > > @@ -43,6 +43,7 @@
> > > >  #define ADV7180_INPUT_CONTROL_INSEL_MASK               0x0f
> > > >
> > > >  #define ADV7182_REG_INPUT_VIDSEL                       0x0002
> > > > +#define ADV7182_REG_INPUT_RESERVED                     BIT(2)
> > >
> > > Responding to Kieran's comment on V1:
> > > > If the bit is documented with a better name, then use that of cours=
e,
> > > > otherwise perhaps even a comment in the code saying that failing to=
 set
> > > > the bit increases visible noise would be suitable. (or that setting=
 the
> > > > bit reduces noise, I guess it depends on if you think this bit is
> > > > performing noise reduction, or if not setting it is introducing noi=
se)
> > >
> > > I went digging through the datasheet for this info as I care about
> > > ADV728[0|1|2]M.
> > >
> > > https://www.analog.com/media/en/technical-documentation/data-sheets/A=
DV7182.pdf
> > > page 68 defines bits 0-3 as reserved, and "set to default" which is
> > > 0100b.
> > > https://www.analog.com/media/en/technical-documentation/user-guides/A=
DV7280_7281_7282_7283_UG-637.pdf
> > > page 70 says the same for ADV7280/ADV7281/ADV7282/ADV7283.
> > >
> > > So no name or detail in the docs over what the bits do.
> > >
> > > The patch does mean the driver more closely follows the datasheet, so
> > > it looks good to me.
> > >
> > > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > >
> > > I'll try to find a couple of minutes to get my hardware out and
> > > confirm I see the change in video noise.
> >
> > Great, Is there any way we can identify (easily?) if this is introducing
> > noise reduction, or preventing noise being added?
> >
> > If it's introducing noise reduction, as a feature, that's quite
> > different to causing noise if it's not set ... (Unless perhaps people
> > have a desire to add noise :D)
>=20
> OK, I dug out my hardware. I'm doing the nasty with:
> i2ctransfer -y -f 10 w2@0x21 0x02 0x84
> and
> i2ctransfer -y -f 10 w2@0x21 0x02 0x80
> to flip back and forth between the two settings on my PAL source.
>=20
> It does reduce the noise, but also softens the image significantly.
>=20
> As slightly iffy photos to show the difference
> https://photos.app.goo.gl/hLKxv3TP93gX864y8 is the new setting.
> https://photos.app.goo.gl/sWxEhdvxHLUkGL1C8 is the old setting.
> (Yes it's a very old F1 race that happened to be on this DVD/HDD recorder=
).

It's a really tough test case, as I expect these are frame captures from
two separate time points, rather than some paused frame, but I would say
the text on the old setting is clearer. That could easily be due to
differences in the actual content though.

It might make me think this should be a control that could be
dynamically set to allow the user to decide...

Benjamin, how does it look on your system? I presume setting this bit
improves image quality for your use case.


> I couldn't honestly say I prefer one over the other (analogue video
> really is grim!), but it does mean that we're following the datasheet
> more accurately, so:
>=20
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> > But I think I could add this already:
> >
> >
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

From a driver perspective, with no other existing expecatation - I would
say matching the datasheet is the correct thing to do anyway.

--
Kieran



> >
> > >
> > >   Dave
> > >
> > > >  #define ADV7180_REG_OUTPUT_CONTROL                     0x0003
> > > >  #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL            0x0004
> > > > @@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state =
*state)
> > > >
> > > >  static int adv7182_set_std(struct adv7180_state *state, unsigned i=
nt std)
> > > >  {
> > > > -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std <=
< 4);
> > > > +       /* Failing to set the reserved bit can result in increased =
video noise */
> > > > +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> > > > +                            (std << 4) | ADV7182_REG_INPUT_RESERVE=
D);
> > > >  }
> > > >
> > > >  enum adv7182_input_type {
> > > > --
> > > > 2.36.1
> > > >
