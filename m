Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D1F5FA005
	for <lists+linux-media@lfdr.de>; Mon, 10 Oct 2022 16:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiJJOP2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Oct 2022 10:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiJJOP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Oct 2022 10:15:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0875A2E3;
        Mon, 10 Oct 2022 07:15:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46DF6BB0;
        Mon, 10 Oct 2022 16:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665411323;
        bh=HUUKKWN7DOTb6qRqWfIbzR54BPmPxMvPX8Hx+e+3GWM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gMo6LfP/j6zFOV3UO+m+ZJXhi4ofqySmQXETT6JXlha8X6hLYITT07wQoOdInaQL6
         7Sg0RlS4DvWAflGneF6F/B5Kygszpu47seGN+XwxwvWwqTCgIeGWoQ8Xl0JUVr6Ikn
         IZGnyWGMKEInzkE0hfDt2blSwlmGttsNDXBBnrhI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y0QncbqvmkwCQUV/@oden.dyn.berto.se>
References: <20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se> <166540999229.3760285.2092310778890819597@Monstersaurus> <Y0QncbqvmkwCQUV/@oden.dyn.berto.se>
Subject: Re: [PATCH] media: adv748x: afe: Select input port when initializing AFE
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
To:     Niklas =?utf-8?q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Date:   Mon, 10 Oct 2022 15:15:21 +0100
Message-ID: <166541132134.3760285.5424145248690989762@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2022-10-10 15:08:49)
> Hi Kieran,
>=20
> On 2022-10-10 14:53:12 +0100, Kieran Bingham wrote:
> > Hi Niklas,
> >=20
> > Your other patch for adv748x has the prefix:
> >=20
> >       media: i2c: adv748x:
> >=20
> > I'm not sure if the i2c: is required though.
> > There seems to be a mix of usage in the driver already so I don't think
> > it matters too much.
>=20
> Me neither, so I use both in an random pattern to not discriminate.  =20
> Let me know what you prefer and I will try to use that in the future. =20

Doesn't bother me - That's up to whoever picks the patch I think ;-)

> > Quoting Niklas S=C3=B6derlund (2022-10-09 15:41:46)
> > > When moving the input selection to adv748x_reset() it was missed that
> > > during probe the device is reset _before_ the initialization and pars=
ing
> > > of DT by the AFE subdevice. This can lead to the wrong input port (in
> > > case it's not port 0) being selected until the device is reset for the
> > > first time.
> > >=20
> > > Fix this by restoring the call to adv748x_afe_s_input() in the AFE
> > > initialization while also keeping it in the adv748x_reset().
> > >=20
> > > Fixes: c30ed81afe89 ("media: adv748x: afe: Select input port when dev=
ice is reset")
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > > ---
> > >  drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/=
i2c/adv748x/adv748x-afe.c
> > > index 02eabe10ab97..00095c7762c2 100644
> > > --- a/drivers/media/i2c/adv748x/adv748x-afe.c
> > > +++ b/drivers/media/i2c/adv748x/adv748x-afe.c
> > > @@ -521,6 +521,10 @@ int adv748x_afe_init(struct adv748x_afe *afe)
> > >                 }
> > >         }
> > > =20
> > > +       adv748x_afe_s_input(afe, afe->input);
> > > +
> > > +       adv_dbg(state, "AFE Default input set to %d\n", afe->input);
> >=20
> > That's now two places with this message. But we likely can't put it in
> > adv748x_afe_s_input(), as that isn't always setting the default, but the
> > current...
> >=20
> > And it's probably not worth an extra function just to dedup a single
> > debug line :S
> >=20
> > So - it seems reasonable to me.
> >=20
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > Though does this now mean that a normal boot will show (with debug
> > enabled)
> >=20
> > AFE Default input set to 0
> > ...
> > AFE Default input set to 0
> >=20
> > ?
>=20
> Yes, but if the default input is not 0 after paring DT it will be,
>=20
> AFE Default input set to 0
> ...
> AFE Default input set to 2
>=20
> Where the first one is form the reset and the second one from the probe=20
> after we have parsed DT. Not sure how much effort we should put in to=20
> resolving this, I'm happy with anything, keeping both or dropping any or =

> both of them.
>=20
> Let me know what you think. And if you wish me to spin a v2. I do like=20
> to get his fixed without to much delay as it kills my new automatic test =

> setup without an ugly quirk :-)

Doesn't bother me here I don't think. Perhaps a bit odd that the default
changes, but I suspect that fixing it to only have one would require
refactoring the ordering of how probe/reset is occuring?

You could only change/report the default as changed if it differs too
... but even that's maybe an over-optimisation.

--
Kieran


>=20
> > --
> > Kieran
> >=20
> >=20
> >=20
> >=20
> > > +
> > >         /* Entity pads and sinks are 0-indexed to match the pads */
> > >         for (i =3D ADV748X_AFE_SINK_AIN0; i <=3D ADV748X_AFE_SINK_AIN=
7; i++)
> > >                 afe->pads[i].flags =3D MEDIA_PAD_FL_SINK;
> > > --=20
> > > 2.37.3
> > >
>=20
> --=20
> Kind Regards,
> Niklas S=C3=B6derlund
