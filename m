Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05CF0170487
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 17:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgBZQiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 11:38:09 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42771 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBZQiJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 11:38:09 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4E35B60012;
        Wed, 26 Feb 2020 16:37:52 +0000 (UTC)
Date:   Wed, 26 Feb 2020 17:40:40 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
Cc:     "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "Udipi, Suresh (Wipro; LEADER ; ADITJ/SWG)" 
        <external.sudipi@jp.adit-jv.com>,
        "akiyama@nds-osk.co.jp" <akiyama@nds-osk.co.jp>
Subject: Re: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on
 clock lane during start of CSI2
Message-ID: <20200226164040.rzd3hqqzosqe2sar@uno.localdomain>
References: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
 <20200219172456.hyo2aksvubxpoqrn@uno.localdomain>
 <AC35D0CFBC66A84AAA9DF4334B52828D136F94C7@HI2EXCH01.adit-jv.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3z5pbb5obrrlekpa"
Content-Disposition: inline
In-Reply-To: <AC35D0CFBC66A84AAA9DF4334B52828D136F94C7@HI2EXCH01.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3z5pbb5obrrlekpa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello Michael,

On Mon, Feb 24, 2020 at 02:13:08PM +0000, Rodin, Michael (Ferchau; ADITG/ESM1) wrote:
> > On Tue, Feb 18, 2020 at 12:44:11PM +0100, Michael Rodin wrote:
> > > The chapter 7.1 "D-PHY Physical Layer Option" of the CSI2
> > > specification states that non-continuous clock behavior is optional,
> > > i.e. the Clock Lane can remain in high-speed mode between the transmission
> > of data packets.
> > > Therefore waiting for the stop state (LP-11) on the Clock Lane is
> > > wrong and will cause timeouts when a CSI2 transmitter with continuous
> > > clock behavior is attached to R-Car CSI2 receiver. So wait only for
> > > the stop state on the Data Lanes.
> >
> > Am I wrong or the desired behaviour should depend on the presence of the
> > clock-noncontinuous property in the CSI-2 input endpoint ?
> > If clock-noncontinuous is set, then wait for the clock lane to enter stop state
> > too, if not just wait for the data lanes to stop.
> >
> > If this is correct, it will also require a change to the bindings and that's the
> > tricky part. So far the CSI-2 receiver behaved as the clock-noncontinuous
> > property was set (wait for both data and clock
> > lanes) and older dtb should continue to work under this assumption. If you
> > want to support devices with continuous clock then you have to require the
> > clock-noncontinuous property to be explicitly set to false, and assume it's true
> > if not specified. BUT clock-noncontinuous is a boolean property, whose value
> > depends on it's presence only. So I fear we need to add a 'clock-continuous'
> > flag to video-interfaces.txt, parse it in the CSI-2 receiver driver, and then ignore
> > the clock lane stop state if and only if said property is specified.
> >
> > Does this make sense ?
> >
>
> Hello Jacopo,
>
>  - First of all I am not so sure whether I am interpreting the CSI2 spec correctly,
>    this is also the reason why I marked my patch as [RFC]. So MAYBE waiting for LP-11
>    on the clock lane IS correct at this point in rcar-csi2 and the issue is somewhere else
>    and your suggestion was based on my wrong assumption. Is it possible?

What I read there confirms what you said

For continuous clock behavior the Clock Lane remains in high-speed mode generating active clock signals
between the transmission of data packets.
For non-continuous clock behavior the Clock Lane enters the LP-11 state between the transmission of data
packets.

and indeed non-continuous is optional.

However, the documented rcar-csi2 PHY start procedure prescribes to
check for the clock stop state as well, so it is totally plausible the
receiver requires the clock lane to be in stop state to properly
intialize. IMX6 does the same, according to imx6-mipi-csi2.c and the
documentation of the csi2_enable() function there.

Some sensors force clock lane in stop state at power-up to help
receivers detect LP-11 state, just as an example...

But I think we're a bit mixing two issues here though. non-continous clock
mode allows clock lane to enter low-power state during frame blanking
(the LPS state in the CSI-2 specs). This feature as said, is optional,
as during LPS only data lanes are required to transition to LP-11, as
it is the initial and final phase of the SoT/EoT procedure as defined
by the DPHY specs, which delimits an high-speed transmission burst.

What your patch is doing is modifying the condition for the CSI-2 RX
to properly detect a phy start condition, which I think depends mostly
on the receiver requirements...

I have missed one thing: do you have a faulty sensor that with this
patch applied works as intended ?

>  - The presence of the "clock-noncontinuous" property is parsed by the V4L2 fwnode library,
>    which sets either V4L2_MBUS_CSI2_CONTINUOUS_CLOCK or V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK.
>    I could not find any upstream CSI2 receiver driver, which reads these flags. Would be rcar-csi2
>    the first driver which reads this property (of a transmitter) at the receiver side?

non-continous is optional, so it's totally plausible.

>  - Sorry, but I don't understand your concerns about compatibility to old device trees.
>    If "clock-noncontinuous" exists at the CSI2 transmitter side, it is assumed to be
>    true (since as you mentioned, all boolean properties are true if present) and we
>    would wait for LP-11 on clock lane in rcar-csi2 and older dtbs would continue to
>    work correctly. If this property is not present in a CSI2 transmitter node of an older
>    dtb although this transmitter has this property, then this is a wrong device tree
>    configuration. So the suggested new "clock-continuous" property would be a workaround
>    for supporting incorrect device trees. Should we maintain backwards compatibility in this case?

I'm not concerned on the CSI-2 transmitter node, but older DTB
describing the rcar csi-2 receiver. If one loads a dtb that had no
noncontinous clock property  as it was'implied' and suddenly the
driver acts as you have to specify the property to enable that feature
otherwise it assumes 'continuous', we then have troubles, as dt
bindings are an ABI and older DTBs should continue to work as they
used to. That's why, as you cannot set noncontiuous=false, I suggested
a counterpart with continous, to make that feature enabled optionally.

Anyway, scratch that, I think we really should decouple the 'phy start
up procedure' issue from the 'clock continuos/noncontinuos' one.

Are you having issue detecting a clock stop state on your sensor ?
Does the sensor have a way to set the clock lane to stop state (eg.
forcing non-continous mode) at power up ?

Thanks
   j

>  - Even if we should maintain backwards compatibility to incorrectly configured device trees
>    (i.e. "clock-noncontinuous" is not specified for CSI2 transmitters with non-continuous clock behavior),
>    it is possibly not an issue in this particular case because we don't have to wait for
>    LP-11 on clock lanes at all since the non-continuous clock behavior is optional according
>    to the chapter 7.1 of the CSI2 specification. So from my understanding a CSI2 receiver
>    which supports only continuous clock behavior would work with both kinds of clock
>    behavior at the transmitter side. On the other side a CSI2 receiver which supports only
>    non-continuous clock behavior (which is currently the behavior implemented in rcar-csi2.c)
>    can not receive anything from a transmitter with continuous clock behavior and would violate CSI2 spec.
>
> >
> > >
> > > Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-csi2.c | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > index faa9fb2..6d1992a 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> > > @@ -416,8 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
> > >  	for (timeout = 0; timeout <= 20; timeout++) {
> > >  		const u32 lane_mask = (1 << priv->lanes) - 1;
> > >
> > > -		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)
> > &&
> > > -		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > > +		if ((rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
> > >  			return 0;
> > >
> > >  		usleep_range(1000, 2000);
> > > --
> > > 2.7.4
> > >

--3z5pbb5obrrlekpa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl5Wn4gACgkQcjQGjxah
VjznhA/+MZCDyZKbhukVGXBSPBox/hOlPcPx3GeKRoEsSM76l0DLGbnYSbs0fWFx
J/AJL64crdawawB8PNQvSZ0VVkBkMzmhhPKNLNledCV9Mvz/YiI3jitfC5RuHRMK
HB6mh5i2NETceshUlCSGNpnR+ryoqfwVF/uWFoL4gI4s9oHlxSGlAiPUfGObFwqI
iDIlohbKLLxdlufCDMVDt1VK3hgtuWWvxGBd8dMoDx3VANsw+uSrWzFanjkjXWva
pXuuaC/gznK3gdfvrHfB2470mVg8n/JUMfGCud5Qy6pJFU//9THnWuqE0XvNcjy0
MfoG9BNcSDcld8zT3pHryC1Pl0psIgKDf4MviFL2tIIE/jce0DLx+7o3GUbWeOAo
926u9fGeXLKy+oHmv4jqYZKAHFRUUHCjmOnXslOu4EFXCy1XKyDNcxOd4Zh66Q/W
rEpoPVjV0me/0CnbdnSmQKZWcfQViOG8vHsynuzd4oWUoWPrQXVlxicMrduKwN2m
zUE0ocxuza9R1t/mJBMbYbHAy1kEPwrsnIRNyqtf/2iohQNxrvkz/zX08MiAsXqR
e3UTHtYlaDCJGN7lP/XQ55IRRVgIQvHeJb8MF27vw5yFLWydxUSlNABOYLKMf5Po
VYM5apyz7x6tDamP54+wfCwP+0JQPz5993twUan09q62PwGDRZ4=
=OJd7
-----END PGP SIGNATURE-----

--3z5pbb5obrrlekpa--
