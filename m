Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D06B52605C
	for <lists+linux-media@lfdr.de>; Fri, 13 May 2022 12:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353808AbiEMKn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 May 2022 06:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379580AbiEMKn2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 May 2022 06:43:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FCD16D109
        for <linux-media@vger.kernel.org>; Fri, 13 May 2022 03:43:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2BBF5A4;
        Fri, 13 May 2022 12:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1652438601;
        bh=iGCYwkDcsxMvSjtT1HPz7+ma/QOWeK7T88SIMYSDPNw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Fd4Qwm0RPmP5F565jQ4JZBOy3jqQZugkcnjTsMAfnFNxAf969B2r5jQsVd6mMegaa
         k/hq0KSHF36CM4EeGOHgrjdVfg8qLv3d75l8S9tPioDKK5Dxa4ugIitCDGzcpkMYwm
         m6LmQfMjky3xCgN4RTteAWnwzOxpyqwjXnQTSkAU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
References: <20220512120209.11614-1-info@benjaminmarty.ch> <CAPY8ntD4miACVe9naYUyVAztZcDBK47chpJLy4=qqjmego1jvA@mail.gmail.com>
Subject: Re: [PATCH v2] media: i2c: adv7180: fix reserved bit in Video Selection 2
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
To:     Benjamin Marty <info@benjaminmarty.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 13 May 2022 11:43:18 +0100
Message-ID: <165243859864.2416244.4785590696956344599@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Dave Stevenson (2022-05-12 14:56:45)
> Hi Benjamin.
>=20
> On Thu, 12 May 2022 at 13:11, Benjamin Marty <info@benjaminmarty.ch> wrot=
e:
> >
> > This bit is marked as reserved in the ADV Hardware Reference Manual.
> >
> > Resetting this bit seems to cause increased video noise. Setting this
> > bit according to the Hardware Reference Manual reduces the video noise
> > immediately.
> >
> > Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
> > ---
> > version 2:
> > - Fixed Kieran's remarks
> >
> >  drivers/media/i2c/adv7180.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index 4f5db195e66d..992111fe249e 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -43,6 +43,7 @@
> >  #define ADV7180_INPUT_CONTROL_INSEL_MASK               0x0f
> >
> >  #define ADV7182_REG_INPUT_VIDSEL                       0x0002
> > +#define ADV7182_REG_INPUT_RESERVED                     BIT(2)
>=20
> Responding to Kieran's comment on V1:
> > If the bit is documented with a better name, then use that of course,
> > otherwise perhaps even a comment in the code saying that failing to set
> > the bit increases visible noise would be suitable. (or that setting the
> > bit reduces noise, I guess it depends on if you think this bit is
> > performing noise reduction, or if not setting it is introducing noise)
>=20
> I went digging through the datasheet for this info as I care about
> ADV728[0|1|2]M.
>=20
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADV71=
82.pdf
> page 68 defines bits 0-3 as reserved, and "set to default" which is
> 0100b.
> https://www.analog.com/media/en/technical-documentation/user-guides/ADV72=
80_7281_7282_7283_UG-637.pdf
> page 70 says the same for ADV7280/ADV7281/ADV7282/ADV7283.
>=20
> So no name or detail in the docs over what the bits do.
>=20
> The patch does mean the driver more closely follows the datasheet, so
> it looks good to me.
>=20
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> I'll try to find a couple of minutes to get my hardware out and
> confirm I see the change in video noise.

Great, Is there any way we can identify (easily?) if this is introducing
noise reduction, or preventing noise being added?

If it's introducing noise reduction, as a feature, that's quite
different to causing noise if it's not set ... (Unless perhaps people
have a desire to add noise :D)

But I think I could add this already:


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
>   Dave
>=20
> >  #define ADV7180_REG_OUTPUT_CONTROL                     0x0003
> >  #define ADV7180_REG_EXTENDED_OUTPUT_CONTROL            0x0004
> > @@ -1014,7 +1015,9 @@ static int adv7182_init(struct adv7180_state *sta=
te)
> >
> >  static int adv7182_set_std(struct adv7180_state *state, unsigned int s=
td)
> >  {
> > -       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
> > +       /* Failing to set the reserved bit can result in increased vide=
o noise */
> > +       return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
> > +                            (std << 4) | ADV7182_REG_INPUT_RESERVED);
> >  }
> >
> >  enum adv7182_input_type {
> > --
> > 2.36.1
> >
