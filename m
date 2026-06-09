Return-Path: <linux-media+bounces-64324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KMnWM9FGKGr1BQMAu9opvQ
	(envelope-from <linux-media+bounces-64324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:01:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843D662B79
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 19:01:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=OJRVAIE1;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64324-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64324-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 642DF302E7DF
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 16:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B647C4968EB;
	Tue,  9 Jun 2026 16:48:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21992D0C97
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 16:48:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023737; cv=none; b=Njvz0/pQzm2bfBQW3ShEi7OyPvs43VFFbSTjfdjbzCKJ0RlQaC8DGaWp7HpIHs6M1O9BXdgB63LybxnIQud4HhqN9Ixvxrd6WAsIw0iBTNNVavxdabOnBlE4B3wCF5FQynLzZrkFeb1CLujc9VWbb+Q/7DIOtmcury6lN7bSiPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023737; c=relaxed/simple;
	bh=tZdFpkbhh/CWW+2kXmAaPMnxxkYCM66RABVEE1M0YWo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=E0tx0dmQSRMTDg9SJ86A0y8Eleqfl5HV1nQ2HTqR/IPRkRWJ2QX7tr/I53aNphoHw6fcfhvMvnP1p1MtnO3UCaIaEiY6fnwmDImdyBUV044eVPDS+k/G+sjRX+shShorZHMvt/rCRnPUBDlZua20tUwCqEz2CC/K1pgNMDasm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OJRVAIE1 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79C8D244;
	Tue,  9 Jun 2026 18:48:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781023703;
	bh=tZdFpkbhh/CWW+2kXmAaPMnxxkYCM66RABVEE1M0YWo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OJRVAIE10JUbFxZu+VrhJO2tPV7li8n+lGFgRsyjjNeIaTuvBcu4AUroLaBUMgsM7
	 f1OtBY9An6ojLlan3WdlAouWR9pqbU4FGB3J1h/A9TvzClmJ+vX/QqwuAwIUR+/hpj
	 eqSg1zEHcVHooNVLcNG9SI5U0VMCkqal+FpvY9Ws=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya> <CAPY8ntBshAPkN_7Swz4qpbOjhpu5Gfnd5VkZPrgUgUoNrM0pEg@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@idea
 sonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 09 Jun 2026 22:18:46 +0530
Message-ID: <178102372666.1799417.2096397903236324900@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64324-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@idea sonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:dave.stevenson@raspberrypi.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,jjverkuil.nl,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,kernel.org,idea sonboard.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email,ideasonboard.com:from_mime,ideasonboard.com:email,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2843D662B79

Hi Dave,

Quoting Dave Stevenson (2026-06-08 23:36:03)
> Hi Jai, Jacopo, Sakari, and Laurent
>=20
> On Mon, 8 Jun 2026 at 11:31, Jai Luthra <jai.luthra@ideasonboard.com> wro=
te:
> >
> > Hi Jacopo, Sakari,
> > ++ Dave, Hans and Laurent,
> >
> > Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > > Hi Sakari
> > >
> > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > When vertical analogue binning is in use, the minimum frame length =
in
> > > > lines decreases to around half of the normal. In relation to the se=
nsor's
> > > > output size this means vertical blanking can be negative but that's=
 not an
> > > > issue as control values are signed. Remove the workaround for this
> > >
> > > Didn't we just discussed two weeks ago in media summit how negative
> > > blankings are a bad idea, and of all drivers one could decide to play
> > > with imx219 is probably the worse due it's large use base and the fact
> > > libcamera doesn't support negative blankings ?
> > >
> > > Have I missed something ?
>=20
> I'll agree that I don't like the concept of negative blanking as it is
> very counter-intuitive.
>=20
> However libcamera *does* appear to support negative blanking through
> the Pi pipeline handler.
> Running with mainline Pi5 CFE driver, mainline libcamera, and imx219
> with this patch series. If I ask for 1640x1232 at 79.07fps then
> libcamera is setting V4L2_CID_VBLANK to -584 and giving me 79.07fps.
> The code could do with an audit though as I do see some uint32_t
> variables kicking around, so it could be more luck than judgement
> (hmm, I see a value of 4294966712 being set).

Thank you for testin it out. Good to know that the RPi pipeline handler is
more resilient than the others.

I had tested the previous revision of this series on a RKISP1 derivative
IPA (Renesas V4H) where it broke with negative blankings because uint32_t
was used at a few places. The fix wasn't hard, but still a breaking change
for the many SoCs that use RKISP1 (Rockchip, NXP, Renesas)

>=20
> > I think it would be helpful if I write down clearly how this sensor
> > operates (to the best of my knowledge) so we can decide on the correct
> > fix:
> >
> > --------------------
> >
> > IMX219 sensor has an active resolution of 3280x2464.
> >
> > The driver currently programs the sensor VT pixel clock as fixed for a
> > given lane configuration.
> >
> > In 2-lane mode it reads 182.4 MPixel/second:
> >
> >     #define IMX219_PIXEL_RATE           182400000
> >
> > And the framerate is given by:
> >
> >     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
> >
> > where FRAME_LENGTH and LINE_LENGTH are registers that include the active
> > height and width along with blankings.
> >
> > There are restrictions on the minimum of the LINE_LENGTH register and
> > minimum vertical blanking (32), which cap the framerate for the full re=
solution
> > mode.
> >
> >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> >     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) =3D 2464 + 32
> >                            =3D> 2496 lines
> >
> > The maximum frame rate is
> >
> >     182400000/(2496*3448) =3D> ~ 21.2 frames/second
> >
> > --------------------
> >
> > A user might want to stream a lower resolution with the full field-of-v=
iew,
> > let's take 1640x1232 (which is exactly 1/2 of active area) as an exampl=
e.
> >
> > The sensor hardware can achieve this using two different binning modes:
> >
> >     2x2-binning (regval: 0x1)
> >     2x2-analog-(special)-binning (regval: 0x3)
> >
> > The sensor pipeline looks like:
> >
> > active pixel array ->
> >     analogue crop (none) ->
> >         2x2 binning and ADC readout ->
> >                 output to CSI-2 bus
> >
> > The mode names suggest that binning can happen either before or after A=
DC,
> > but the datasheet is not very clear about the process. We can infer
> > some details though. See below..
>=20
> We did previously ask Sony for more information on the special binning
> mode, but there wasn't anything more to be had. imx219 is now at least
> 12 years old (we started working with it in 2014), so those who knew
> about it in Sony have generally moved on.
>=20
> > --------------------
> >
> > With the "normal" 2x2-binning mode the sensor allows programming
> > FRAME_LENGTH to a lower value. The driver still uses the min blanking o=
f 32
> > lines, but the height is now 1232, half of the 2464 before.
> >
> >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> >     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK =3D 1232 + 32
> >                            =3D> 1264 lines
> >
> > The maximum frame rate is
> >
> >     182400000/(1264*3448) =3D> ~ 41.8 frames/second
> >
> > --------------------
> >
> > With the "special" 2x2-binning mode, the datasheet notes that FRAME_LEN=
GTH
> > register should be in units of 2 Lines instead of 1 Line. This means
> > cutting it down by half once more:
> >
> >     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 =3D (1232 + 32)/2
> >                            =3D> 632 lines
> >
> > While there is a slightly higher minimum enforced for the line length:
> >
> >     MIN_LINE_LENGTH: 0xde8 =3D> 3560 pixels
> >
> > The maximum frame rate is
> >
> >     182400000/(632*3560) =3D> ~ 81.0 frames/second
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> > registers and maximum possible framerate, I think it is safe to say tha=
t:
> >
> >     2x2-binning =3D> Readout half the pixels (do vertical averaging in =
the
> >                                             analogue domain, before ADC
> >                                             reads out the voltages)
> >
> >     2x2-special-binning =3D> Readout a quarter of the pixels (???)
> >
> > FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4=
x1
> > binning (combining 4 lines instead of blocks of 2x2).. which does not m=
ake
> > sense to me.
> >
> > My best guess is that in 2x2-special-binning mode the sensor does *both
> > horizontal and vertical* averaging in the analogue domain, before the A=
DC
> > reads out the voltages.
> >
> > A higher minimum LINE_LENGTH value for this mode is the best "hard"
> > evidence I have for this guess unfortunately, as the datasheet is quite
> > lacking on this topic.
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > The APIs before Sakari's series expose HBLANK and VBLANK controls inste=
ad
> > of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
> >
> > The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x123=
2,
> > so the sensor registers would suggest that we have a *negative vertical
> > blanking*. Which as Jacopo and Laurent both point out, does not make any
> > conceptual sense whatsoever.
> >
> > What the driver does today to avoid these negative values is to double =
the
> > PIXEL_RATE control value to 364800000 when using 2x2-special-binning mo=
de
> > (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
> >  2xLines)
> >
> > As Sakari pointed out, that does not make any sense either. The sensor =
PLL
> > values are completely unchanged, so the pixel readout must still be
> > happening at the same rate. Moreover, the new raw sensor model will exp=
ose
> > FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> > doubling the PIXEL_RATE breaks those calculations.
>=20
> A model needs to describe the functional behaviour, even if it isn't
> how the hardware actually implements it.
>=20
> If the new model can't describe imx219 with a change of pixel clock
> when binning, is it going to cope with the Starvis 2 sensors (eg
> imx415, imx662 and imx678) where the HMAX register is in units related
> to the input clock rather than pixel clock? Perhaps it can, but one of
> those probably ought to be converted to prove the point (imx415 is in
> mainline and fairly easily available).
>=20

I already plan on getting my imx678 driver to work with the new model.

I don't like the idea of using PIXEL_RATE to mean some internal clock
though, and have something called LINE_LENGTH_IN_PIXELS be way lower than
the width of the image in "pixels". I think userspace control's units be
(sanely) parsable by a human rather than a raw dump of sensor register
quirks, unless of course there's no easy way to do that.

I would prefer to keep the PIXEL_RATE control like you had suggested (8 *
internal_74.25mhz_clk) and scaling the LLP control value before writing to
the HMAX register.

> A second case that needs to be considered by this generic model: there
> are a bunch of sensors (imx378, imx477, imx519, and imx708 to name 4)
> that have an exposure multiplication factor to allow for very long
> exposure times / very low frame rates. How would that get represented?
> The register is CIT_LSHIFT with permitted values from 0 (for off) to 7
> (*128). "exposure time =3D COARSE_INTEG_TIME * 2^CIT_LSHIFT", and
> likewise frame_length_lines gets multiplied by that value.
>=20
> Is there a proposal on how to handle eg ov5647 where the PLL
> configuration is changed between some of the modes for both pixel
> clock and link frequency?
> Or imx290 which changes link frequency for the modes, although it does
> keep a common pixel clock? (I've never come up with a good reason for
> the change in link frequency, just that the datasheet does it that
> way).
>=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > If we want to support the new raw sensor model (that mandates the new
> > FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> > fix the PIXEL_RATE for sure. I see two options going forward:
> >
> > OPTION 1 (as proposed by Sakari):
> >
> >     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
> >     and VBLANK controls when using 2x2-special-binning mode.
> >
> >     This will break any userspace tools, many libcamera pipelines inclu=
ded,
> >     that never expected those control values to be negative (even though
> >     the API has always permitted those)
>=20
> Will it actually break that much?
> As much as I conceptually don't like negative values, as above the Pi
> pipeline handlers in libcamera seem to just work.
> Anyone using the sensor in a raw capacity and just setting a
> precomputed value is going to break, but that's going to be the case
> with any of the proposed changes.
>=20
> > OPTION 2 (something that struck me today morning discussing with Jacopo=
):
> >
> >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
> >     lower to compensate, which will diverge from the sensor registers w=
hich
> >     keep MIN_LINE_LENGTH fixed across both binning modes.
> >
> >     This will make the driver quite more complicated, but userspace
> >     expectations of non-negative blankings will be met. And it's likely
> >     that the sensor is internally doing pre-ADC averaging horizontally =
as
> >     well, or so my best guess is.
>=20
> It is true that the line length configured is sufficient that it could
> be halved in order to keep the pixel rate the same. That would seem
> feasible.
>=20

It is indeed feasible, and imho most likely what the sensor is internally
doing (I'd be happy to be proven wrong). I've posted a patch separately
implementing that.

Thanks,
    Jai

> > Of course, there are other options to just leave this highly used sensor
> > alone, or support embedded data and internal pads without mandating the=
 new
> > FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave tha=
t as
> > a last resort.
>=20
> Is there a dependency stopping the embedded data and internal pads
> patches being merged without the common raw sensor model?
>=20
>   Dave
>=20
> > > > non-issue that doubled the pixel rate, frame length in lines and ex=
posure
> > > > time.
> > > >
> > > > The resulting change also fixes the minimum, the maximum and the st=
ep
> > > > values for the control.
> > > >
> > > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for =
analog binning")
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > Thanks,
> >     Jai
> >
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 37 ++++++++++++++--------------------=
---
> > > >  1 file changed, 14 insertions(+), 23 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 3aebcbaa3fcd..3cee31758b7e 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_sub=
dev_state *state, u8 *bin_h,
> > > >
> > > >  }
> > > >
> > > > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state =
*state)
> > > > -{
> > > > -     u8 bin_h, bin_v;
> > > > -
> > > > -     imx219_get_binning(state, &bin_h, &bin_v);
> > > > -
> > > > -     return (bin_h & bin_v) =3D=3D IMX219_BINNING_X2_ANALOG ? 2 : =
1;
> > > > -}
> > > > -
> > > >  /* ---------------------------------------------------------------=
--------------
> > > >   * Controls
> > > >   */
> > > > @@ -440,19 +431,17 @@ static int imx219_set_ctrl(struct v4l2_ctrl *=
ctrl)
> > > >       struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd=
);
> > > >       const struct v4l2_mbus_framefmt *format;
> > > >       struct v4l2_subdev_state *state;
> > > > -     u32 rate_factor;
> > > >       int ret =3D 0;
> > > >
> > > >       state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> > > >       format =3D v4l2_subdev_state_get_format(state, 0);
> > > > -     rate_factor =3D imx219_get_rate_factor(state);
> > > >
> > > >       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > >               int exposure_max, exposure_def;
> > > >
> > > >               /* Update max exposure while meeting expected vblanki=
ng */
> > > >               exposure_max =3D format->height + ctrl->val -
> > > > -                     IMX219_EXPOSURE_OFFSET * rate_factor;
> > > > +                     IMX219_EXPOSURE_OFFSET;
> > > >               exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFA=
ULT) ?
> > > >                               exposure_max : IMX219_EXPOSURE_DEFAUL=
T;
> > > >               ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
> > > > @@ -479,7 +468,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ct=
rl)
> > > >               break;
> > > >       case V4L2_CID_EXPOSURE:
> > > >               cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > > > -                       ctrl->val / rate_factor, &ret);
> > > > +                       ctrl->val, &ret);
> > > >               break;
> > > >       case V4L2_CID_DIGITAL_GAIN:
> > > >               cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > > > @@ -496,7 +485,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ct=
rl)
> > > >               break;
> > > >       case V4L2_CID_VBLANK:
> > > >               cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > > > -                       (format->height + ctrl->val) / rate_factor,=
 &ret);
> > > > +                       format->height + ctrl->val, &ret);
> > > >               break;
> > > >       case V4L2_CID_HBLANK:
> > > >               cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > > > @@ -837,8 +826,8 @@ static int imx219_set_pad_format(struct v4l2_su=
bdev *sd,
> > > >       const struct imx219_mode *mode;
> > > >       struct v4l2_mbus_framefmt *format;
> > > >       struct v4l2_rect *crop;
> > > > -     u8 bin_h, bin_v, bin_hv;
> > > > -     int ret;
> > > > +     u8 bin_h, bin_v;
> > > > +     int ret, bin_hv;
> > > >
> > > >       format =3D v4l2_subdev_state_get_format(state, 0);
> > > >
> > > > @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_=
subdev *sd,
> > > >       crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > > >
> > > >       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > -             unsigned int rate_factor =3D imx219_get_rate_factor(s=
tate);
> > > >               int exposure_max;
> > > >               int exposure_def;
> > > >               int llp_min;
> > > >               int pixel_rate;
> > > >
> > > >               /* Update limits and set FPS to default */
> > > > +             int vblank_min =3D ((int)mode->height * (1 - bin_hv) =
/ bin_hv) +
> > > > +                     IMX219_VBLANK_MIN;
> > > >               ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> > > > -                                            IMX219_VBLANK_MIN * ra=
te_factor,
> > > > -                                            (IMX219_FLL_MAX - mode=
->height) *
> > > > -                                            rate_factor, rate_fact=
or,
> > > > -                                            mode->fll_def - mode->=
height);
> > > > +                                            vblank_min,
> > > > +                                            IMX219_FLL_MAX - mode-=
>height, 1,
> > > > +                                            (int)(mode->fll_def / =
bin_hv) -
> > > > +                                            (int)mode->height);
> > > >               if (ret)
> > > >                       return ret;
> > > >
> > > >               ret =3D __v4l2_ctrl_s_ctrl(imx219->vblank,
> > > > -                                      mode->fll_def - mode->height=
);
> > > > +                                      (int)(mode->fll_def / bin_hv=
) -
> > > > +                                      (int)mode->height);
> > > >               if (ret)
> > > >                       return ret;
> > > >
> > > > @@ -932,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_su=
bdev *sd,
> > > >                       return ret;
> > > >
> > > >               /* Scale the pixel rate based on the mode specific fa=
ctor */
> > > > -             pixel_rate =3D imx219_get_pixel_rate(imx219) * rate_f=
actor;
> > > > +             pixel_rate =3D imx219_get_pixel_rate(imx219);
> > > >               ret =3D __v4l2_ctrl_modify_range(imx219->pixel_rate, =
pixel_rate,
> > > >                                              pixel_rate, 1, pixel_r=
ate);
> > > >               if (ret)
> > > > --
> > > > 2.47.3
> > > >
> > > >

