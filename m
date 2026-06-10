Return-Path: <linux-media+bounces-64485-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L8PqBeuRKWo1ZwMAu9opvQ
	(envelope-from <linux-media+bounces-64485-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:33:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8666B82F
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 18:33:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=XG2Y02fw;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64485-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64485-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84D835CD321
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5669426698;
	Wed, 10 Jun 2026 16:00:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441442189F
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 16:00:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781107215; cv=none; b=tOdLDMIM21MT1MwLp+OKT2Z1oWnMYgum4UcJYF7pvGCjanNW72t0atWd3FxMeSAPTten9Z+1Fj//6C9c97LdkyBD/IkJHWhBQ2PNuI0O/3/hEbuLXAiaeuFyVMFyUoLdyhSeUwfUsclsu5hsCTTdYoLrqugj07phVf7attygKAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781107215; c=relaxed/simple;
	bh=ihH0JsPN9Zkm6zfEZUvliq1inwKYXWX5Uuc1nu+73eM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zen+5IJRY+X801Cvoplz0gaivHEsP4HlqrVUkrzFW4XqLNkZrzBk+pV5JpD2PIeFO0GWXq3irgo0LxkNGU48edCwvKXrRYCELYzmuZqnS27hJK9Rc06sFO8W5Ccow00qWe3bmWibLD0qA7vsNtAmMajzlKKt8N71Ma3dmP+ceJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XG2Y02fw reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CD5F9A0;
	Wed, 10 Jun 2026 17:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781107179;
	bh=ihH0JsPN9Zkm6zfEZUvliq1inwKYXWX5Uuc1nu+73eM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XG2Y02fwo0Yi27QjnbHswwjdTYY7w31ghe6Hvi5J3c6U/DPuG8TXQIqmJX9FuI9dq
	 03rT514/S7eDtmNa9VNTUhsNZZswZFOYB7/DHmTzwc66qJO5K3J9UYko5f9fQ+bv2c
	 u3tPj+SkAjXQiPdnFJ5oA6RJ4pgrOFhNmxF9+mK4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aik4xzXNzgb9sFcJ@kekkonen.localdomain>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya> <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com> <aik4xzXNzgb9sFcJ@kekkonen.localdomain>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@r
 aspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 10 Jun 2026 21:30:03 +0530
Message-ID: <178110720306.1799417.2460931366670287089@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64485-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@r aspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,jjverkuil.nl,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,r aspberrypi.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AD8666B82F

Hi Sakari, Dave,

Quoting Sakari Ailus (2026-06-10 15:43:27)
> Hi Dave,
>=20
> On Mon, Jun 08, 2026 at 07:06:03PM +0100, Dave Stevenson wrote:
> > Hi Jai, Jacopo, Sakari, and Laurent
> >=20
> > On Mon, 8 Jun 2026 at 11:31, Jai Luthra <jai.luthra@ideasonboard.com> w=
rote:
> > >
> > > Hi Jacopo, Sakari,
> > > ++ Dave, Hans and Laurent,
> > >
> > > Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > > > Hi Sakari
> > > >
> > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > When vertical analogue binning is in use, the minimum frame lengt=
h in
> > > > > lines decreases to around half of the normal. In relation to the =
sensor's
> > > > > output size this means vertical blanking can be negative but that=
's not an
> > > > > issue as control values are signed. Remove the workaround for this
> > > >
> > > > Didn't we just discussed two weeks ago in media summit how negative
> > > > blankings are a bad idea, and of all drivers one could decide to pl=
ay
> > > > with imx219 is probably the worse due it's large use base and the f=
act
> > > > libcamera doesn't support negative blankings ?
> > > >
> > > > Have I missed something ?
> >=20
> > I'll agree that I don't like the concept of negative blanking as it is
> > very counter-intuitive.
> >=20
> > However libcamera *does* appear to support negative blanking through
> > the Pi pipeline handler.
> > Running with mainline Pi5 CFE driver, mainline libcamera, and imx219
> > with this patch series. If I ask for 1640x1232 at 79.07fps then
> > libcamera is setting V4L2_CID_VBLANK to -584 and giving me 79.07fps.
> > The code could do with an audit though as I do see some uint32_t
> > variables kicking around, so it could be more luck than judgement
> > (hmm, I see a value of 4294966712 being set).
>=20
> Thank you for testing this. Unfortunately it still seems other pipeline
> handlers have issues with this as Jai mentioned.
>=20
> >=20
> > > I think it would be helpful if I write down clearly how this sensor
> > > operates (to the best of my knowledge) so we can decide on the correct
> > > fix:
> > >
> > > --------------------
> > >
> > > IMX219 sensor has an active resolution of 3280x2464.
> > >
> > > The driver currently programs the sensor VT pixel clock as fixed for a
> > > given lane configuration.
> > >
> > > In 2-lane mode it reads 182.4 MPixel/second:
> > >
> > >     #define IMX219_PIXEL_RATE           182400000
> > >
> > > And the framerate is given by:
> > >
> > >     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
> > >
> > > where FRAME_LENGTH and LINE_LENGTH are registers that include the act=
ive
> > > height and width along with blankings.
> > >
> > > There are restrictions on the minimum of the LINE_LENGTH register and
> > > minimum vertical blanking (32), which cap the framerate for the full =
resolution
> > > mode.
> > >
> > >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> > >     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) =3D 2464 + 32
> > >                            =3D> 2496 lines
> > >
> > > The maximum frame rate is
> > >
> > >     182400000/(2496*3448) =3D> ~ 21.2 frames/second
> > >
> > > --------------------
> > >
> > > A user might want to stream a lower resolution with the full field-of=
-view,
> > > let's take 1640x1232 (which is exactly 1/2 of active area) as an exam=
ple.
> > >
> > > The sensor hardware can achieve this using two different binning mode=
s:
> > >
> > >     2x2-binning (regval: 0x1)
> > >     2x2-analog-(special)-binning (regval: 0x3)
> > >
> > > The sensor pipeline looks like:
> > >
> > > active pixel array ->
> > >     analogue crop (none) ->
> > >         2x2 binning and ADC readout ->
> > >                 output to CSI-2 bus
> > >
> > > The mode names suggest that binning can happen either before or after=
 ADC,
> > > but the datasheet is not very clear about the process. We can infer
> > > some details though. See below..
> >=20
> > We did previously ask Sony for more information on the special binning
> > mode, but there wasn't anything more to be had. imx219 is now at least
> > 12 years old (we started working with it in 2014), so those who knew
> > about it in Sony have generally moved on.
> >=20
> > > --------------------
> > >
> > > With the "normal" 2x2-binning mode the sensor allows programming
> > > FRAME_LENGTH to a lower value. The driver still uses the min blanking=
 of 32
> > > lines, but the height is now 1232, half of the 2464 before.
> > >
> > >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> > >     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK =3D 1232 + 32
> > >                            =3D> 1264 lines
> > >
> > > The maximum frame rate is
> > >
> > >     182400000/(1264*3448) =3D> ~ 41.8 frames/second
> > >
> > > --------------------
> > >
> > > With the "special" 2x2-binning mode, the datasheet notes that FRAME_L=
ENGTH
> > > register should be in units of 2 Lines instead of 1 Line. This means
> > > cutting it down by half once more:
> > >
> > >     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 =3D (1232 + 32)=
/2
> > >                            =3D> 632 lines
> > >
> > > While there is a slightly higher minimum enforced for the line length:
> > >
> > >     MIN_LINE_LENGTH: 0xde8 =3D> 3560 pixels
> > >
> > > The maximum frame rate is
> > >
> > >     182400000/(632*3560) =3D> ~ 81.0 frames/second
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> > > registers and maximum possible framerate, I think it is safe to say t=
hat:
> > >
> > >     2x2-binning =3D> Readout half the pixels (do vertical averaging i=
n the
> > >                                             analogue domain, before A=
DC
> > >                                             reads out the voltages)
> > >
> > >     2x2-special-binning =3D> Readout a quarter of the pixels (???)
> > >
> > > FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a=
 4x1
> > > binning (combining 4 lines instead of blocks of 2x2).. which does not=
 make
> > > sense to me.
> > >
> > > My best guess is that in 2x2-special-binning mode the sensor does *bo=
th
> > > horizontal and vertical* averaging in the analogue domain, before the=
 ADC
> > > reads out the voltages.
> > >
> > > A higher minimum LINE_LENGTH value for this mode is the best "hard"
> > > evidence I have for this guess unfortunately, as the datasheet is qui=
te
> > > lacking on this topic.
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > The APIs before Sakari's series expose HBLANK and VBLANK controls ins=
tead
> > > of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
> > >
> > > The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1=
232,
> > > so the sensor registers would suggest that we have a *negative vertic=
al
> > > blanking*. Which as Jacopo and Laurent both point out, does not make =
any
> > > conceptual sense whatsoever.
> > >
> > > What the driver does today to avoid these negative values is to doubl=
e the
> > > PIXEL_RATE control value to 364800000 when using 2x2-special-binning =
mode
> > > (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
> > >  2xLines)
> > >
> > > As Sakari pointed out, that does not make any sense either. The senso=
r PLL
> > > values are completely unchanged, so the pixel readout must still be
> > > happening at the same rate. Moreover, the new raw sensor model will e=
xpose
> > > FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> > > doubling the PIXEL_RATE breaks those calculations.
> >=20
> > A model needs to describe the functional behaviour, even if it isn't
> > how the hardware actually implements it.
> >=20
> > If the new model can't describe imx219 with a change of pixel clock
> > when binning, is it going to cope with the Starvis 2 sensors (eg
> > imx415, imx662 and imx678) where the HMAX register is in units related
> > to the input clock rather than pixel clock? Perhaps it can, but one of
> > those probably ought to be converted to prove the point (imx415 is in
> > mainline and fairly easily available).
>=20
> I think we need new controls for this purpose. It's not a problem to have
> multiple ways to configure a sensor if this is because of hardware reasons
> IMO. The UAPI still needs to allow configuring the sensor accurately so I=
'd
> like to avoid e.g. unit conversion for this purpose.
>=20

How do you propose exposure time should be calculated by userspace with the
raw sensor model?

Currently almost every platform on libcamera does something like:

    exposure =3D V4L2_CID_EXPOSURE * lineLength / V4L2_CID_PIXEL_RATE

where

    lineLength =3D outputWidth + V4L2_CID_HBLANK

Let's take some example values for this with analogue binning 1640x1232 for
~16ms exposure,

------------- mainline imx219 --------------------

                  exposure 0x00980911 (int)    : min=3D4 max=3D3411 step=3D=
1 default=3D1600 value=3D1706
     vertical_blanking 0x009e0901 (int)    : min=3D32 max=3D64303 step=3D1 =
default=3D475 value=3D2184
   horizontal_blanking 0x009e0902 (int)    : min=3D1920 max=3D31112 step=3D=
1 default=3D1920 value=3D1920
            pixel_rate 0x009f0902 (int64)  : min=3D364800000 max=3D36480000=
0 step=3D1 default=3D364800000 value=3D364800000 flags=3Dread-only

So I get,

   exposure =3D 1706 * (1640 + 1920) / 364800000
            =3D 0.016648s

------------- imx219 w/ my patch -----------------

                  exposure 0x00980911 (int)    : min=3D4 max=3D3412 step=3D=
2 default=3D1600 value=3D1706
     vertical_blanking 0x009e0901 (int)    : min=3D32 max=3D64303 step=3D2 =
default=3D475 value=3D2184
   horizontal_blanking 0x009e0902 (int)    : min=3D140 max=3D14736 step=3D1=
 default=3D140 value=3D140
            pixel_rate 0x009f0902 (int64)  : min=3D182400000 max=3D18240000=
0 step=3D1 default=3D182400000 value=3D182400000 flags=3Dread-only

So I get,

   exposure =3D 1706 * (1640 + 140) / 182400000
            =3D 0.016648s

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This worked out because we scaled down pixel rate and line length together
in my patch.

This formula breaks down if you only scale down the pixel rate, like you
propose in this patch, but don't scale the line length to match it and
instead scale the frame length. That just happens to work for the framerate
calculation, but exposure time is also part of the contract.

Thanks,
    Jai

> I really wonder why Sony has made such register API changes on their new
> sensors.
>=20
> >=20
> > A second case that needs to be considered by this generic model: there
> > are a bunch of sensors (imx378, imx477, imx519, and imx708 to name 4)
> > that have an exposure multiplication factor to allow for very long
> > exposure times / very low frame rates. How would that get represented?
> > The register is CIT_LSHIFT with permitted values from 0 (for off) to 7
> > (*128). "exposure time =3D COARSE_INTEG_TIME * 2^CIT_LSHIFT", and
> > likewise frame_length_lines gets multiplied by that value.
>=20
> I'd add a new control for the exponent.
>=20
> >=20
> > Is there a proposal on how to handle eg ov5647 where the PLL
> > configuration is changed between some of the modes for both pixel
> > clock and link frequency?
>=20
> The fact that most register list based drivers use the same PLL
> configuration for pretty much everything is probably because it's such a
> pain to implement anything else using register lists. :-)
>=20
> E.g. the CCS driver has supported this for more than 10 years now but
> documentation is scarce. Laurent brought this up recently in fact. The CCS
> driver expects the user to first pick a link frequency and then configure
> the rest the usual way. I'd do the same in other drivers, too.
>=20
> > Or imx290 which changes link frequency for the modes, although it does
> > keep a common pixel clock? (I've never come up with a good reason for
> > the change in link frequency, just that the datasheet does it that
> > way).
>=20
> It does have an effect on which precise frame rates are achievable.
>=20
> >=20
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > If we want to support the new raw sensor model (that mandates the new
> > > FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> > > fix the PIXEL_RATE for sure. I see two options going forward:
> > >
> > > OPTION 1 (as proposed by Sakari):
> > >
> > >     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBL=
ANK
> > >     and VBLANK controls when using 2x2-special-binning mode.
> > >
> > >     This will break any userspace tools, many libcamera pipelines inc=
luded,
> > >     that never expected those control values to be negative (even tho=
ugh
> > >     the API has always permitted those)
> >=20
> > Will it actually break that much?
> > As much as I conceptually don't like negative values, as above the Pi
> > pipeline handlers in libcamera seem to just work.
> > Anyone using the sensor in a raw capacity and just setting a
> > precomputed value is going to break, but that's going to be the case
> > with any of the proposed changes.
> >=20
> > > OPTION 2 (something that struck me today morning discussing with Jaco=
po):
> > >
> > >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
> > >     lower to compensate, which will diverge from the sensor registers=
 which
> > >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > >
> > >     This will make the driver quite more complicated, but userspace
> > >     expectations of non-negative blankings will be met. And it's like=
ly
> > >     that the sensor is internally doing pre-ADC averaging horizontall=
y as
> > >     well, or so my best guess is.
> >=20
> > It is true that the line length configured is sufficient that it could
> > be halved in order to keep the pixel rate the same. That would seem
> > feasible.
> >=20
> > > Of course, there are other options to just leave this highly used sen=
sor
> > > alone, or support embedded data and internal pads without mandating t=
he new
> > > FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave t=
hat as
> > > a last resort.
> >=20
> > Is there a dependency stopping the embedded data and internal pads
> > patches being merged without the common raw sensor model?
>=20
> One of the main reasons why the internal pad flag patch isn't in yet is
> that we want to avoid its use without a clearly defined semantics -- which
> is defined by the Common Raw Sensor Model.
>=20
> --=20
> Kind regards,
>=20
> Sakari Ailus

