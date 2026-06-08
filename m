Return-Path: <linux-media+bounces-64178-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w3NDKNSlJmoUagIAu9opvQ
	(envelope-from <linux-media+bounces-64178-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 13:21:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 407A1655A0C
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 13:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=ph3zmglR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64178-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64178-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 444C43009CE9
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 11:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9AEF36605D;
	Mon,  8 Jun 2026 11:19:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E703655FC
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 11:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780917589; cv=none; b=OPP6Wychnlx4EpdXcWsW1Eyh+mBRyeQ6aFuEeqIy04ypxvTLeQ27bbnFwK1rcncEEEJQe1y2WQ5ajqyKs+ZdeffpIylNVX3WEHy/P4YSIUi+FTRvXD0azCiOy46Cpye2dPRxLc5nL92bb55DDZOIrQ924Y6fhsxSzvACb/XWmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780917589; c=relaxed/simple;
	bh=8pivhAwv9g72oKPM4JDQTJZSqYcsYHxoyaXTG4qbN68=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=jF6S461TZzSYBjgVNv5eZZCjjETgO38o5TESaW2k5JxJ8XGZ7anVlbcy2Hoh8AuuTM20ucGgzwKFzqBni/0bwOFKRJBPtm1PmCV5o+kKtqMqQ6Va5efzvB5744HU1W2h35JvqIyjK8vQ+7tKSqPOsLJkUwa97ktUBDz9CafH6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ph3zmglR reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7A422D7;
	Mon,  8 Jun 2026 13:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780917556;
	bh=8pivhAwv9g72oKPM4JDQTJZSqYcsYHxoyaXTG4qbN68=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ph3zmglR6/xnqCRk3WgZafNs6AnAd9lgxyWB4F+3cy9SFKD+Kr2qguQeDIdagzLMi
	 UlIwekbPKD7uREugq+soADAistsDnwL6R5uTqEZRQNZGtD9nQK4020P7P3GeCV7+Ul
	 G7anwfkLXtEDW+9TcknfoHy4A2Mca+JPCQHaGc4U=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178091466607.16054.13972332068848565738@freya>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com
 >
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans Verkuil <hans@jjverkuil.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 08 Jun 2026 16:49:38 +0530
Message-ID: <178091757893.16054.4583389270412251379@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64178-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:dave.stevenson@raspberrypi.com,m:hans@jjverkuil.nl,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:from_mime,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 407A1655A0C

Quoting Jai Luthra (2026-06-08 16:01:06)
> Hi Jacopo, Sakari,
> ++ Dave, Hans and Laurent,
>=20
> Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > Hi Sakari
> >=20
> > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sens=
or's
> > > output size this means vertical blanking can be negative but that's n=
ot an
> > > issue as control values are signed. Remove the workaround for this
> >=20
> > Didn't we just discussed two weeks ago in media summit how negative
> > blankings are a bad idea, and of all drivers one could decide to play
> > with imx219 is probably the worse due it's large use base and the fact
> > libcamera doesn't support negative blankings ?
> >=20
> > Have I missed something ?
> >=20
>=20
> I think it would be helpful if I write down clearly how this sensor
> operates (to the best of my knowledge) so we can decide on the correct
> fix:
>=20
> --------------------
>=20
> IMX219 sensor has an active resolution of 3280x2464.
>=20
> The driver currently programs the sensor VT pixel clock as fixed for a
> given lane configuration.
>=20
> In 2-lane mode it reads 182.4 MPixel/second:
>=20
>     #define IMX219_PIXEL_RATE           182400000
>=20
> And the framerate is given by:
>=20
>     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
>=20
> where FRAME_LENGTH and LINE_LENGTH are registers that include the active
> height and width along with blankings.
>=20
> There are restrictions on the minimum of the LINE_LENGTH register and
> minimum vertical blanking (32), which cap the framerate for the full reso=
lution
> mode.
>=20
>     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
>     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) =3D 2464 + 32
>                            =3D> 2496 lines
>=20
> The maximum frame rate is
>=20
>     182400000/(2496*3448) =3D> ~ 21.2 frames/second
>=20
> --------------------
>=20
> A user might want to stream a lower resolution with the full field-of-vie=
w,
> let's take 1640x1232 (which is exactly 1/2 of active area) as an example.
>=20
> The sensor hardware can achieve this using two different binning modes:
>=20
>     2x2-binning (regval: 0x1)
>     2x2-analog-(special)-binning (regval: 0x3)
>=20
> The sensor pipeline looks like:
>=20
> active pixel array ->
>     analogue crop (none) ->
>         2x2 binning and ADC readout ->
>                 output to CSI-2 bus
>=20
> The mode names suggest that binning can happen either before or after ADC,
> but the datasheet is not very clear about the process. We can infer
> some details though. See below..
>=20
> --------------------
>=20
> With the "normal" 2x2-binning mode the sensor allows programming
> FRAME_LENGTH to a lower value. The driver still uses the min blanking of =
32
> lines, but the height is now 1232, half of the 2464 before.
>=20
>     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
>     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK =3D 1232 + 32
>                            =3D> 1264 lines
>=20
> The maximum frame rate is
>=20
>     182400000/(1264*3448) =3D> ~ 41.8 frames/second
>=20
> --------------------
>=20
> With the "special" 2x2-binning mode, the datasheet notes that FRAME_LENGTH
> register should be in units of 2 Lines instead of 1 Line. This means
> cutting it down by half once more:
>=20
>     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 =3D (1232 + 32)/2
>                            =3D> 632 lines
>=20
> While there is a slightly higher minimum enforced for the line length:
>=20
>     MIN_LINE_LENGTH: 0xde8 =3D> 3560 pixels
>=20
> The maximum frame rate is
>=20
>     182400000/(632*3560) =3D> ~ 81.0 frames/second
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> registers and maximum possible framerate, I think it is safe to say that:
>=20
>     2x2-binning =3D> Readout half the pixels (do vertical averaging in the
>                                             analogue domain, before ADC
>                                             reads out the voltages)
>=20
>     2x2-special-binning =3D> Readout a quarter of the pixels (???)
>=20
> FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4x1
> binning (combining 4 lines instead of blocks of 2x2).. which does not make
> sense to me.
>=20
> My best guess is that in 2x2-special-binning mode the sensor does *both
> horizontal and vertical* averaging in the analogue domain, before the ADC
> reads out the voltages.
>=20
> A higher minimum LINE_LENGTH value for this mode is the best "hard"
> evidence I have for this guess unfortunately, as the datasheet is quite
> lacking on this topic.
>=20

Found another evidence for this, see "Table 16 Mode Example" in the
datasheet.

It mentions "H Binning =3D Analog" for x2 binning mode (with ~4x the FPS)
And "H Binning =3D Digital" for x4 binning mode

It doesn't mention a ~2x FPS mode, which I assume is the normal 2x2-binning
mode, where I again assume that horizontal binning is done digitally.


> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The APIs before Sakari's series expose HBLANK and VBLANK controls instead
> of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
>=20
> The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1232,
> so the sensor registers would suggest that we have a *negative vertical
> blanking*. Which as Jacopo and Laurent both point out, does not make any
> conceptual sense whatsoever.
>=20
> What the driver does today to avoid these negative values is to double the
> PIXEL_RATE control value to 364800000 when using 2x2-special-binning mode
> (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
>  2xLines)
>=20
> As Sakari pointed out, that does not make any sense either. The sensor PLL
> values are completely unchanged, so the pixel readout must still be
> happening at the same rate. Moreover, the new raw sensor model will expose
> FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> doubling the PIXEL_RATE breaks those calculations.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> If we want to support the new raw sensor model (that mandates the new
> FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> fix the PIXEL_RATE for sure. I see two options going forward:
>=20
> OPTION 1 (as proposed by Sakari):
>=20
>     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
>     and VBLANK controls when using 2x2-special-binning mode.
>=20
>     This will break any userspace tools, many libcamera pipelines include=
d,
>     that never expected those control values to be negative (even though
>     the API has always permitted those)
>=20
> OPTION 2 (something that struck me today morning discussing with Jacopo):
>    =20
>     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
>     lower to compensate, which will diverge from the sensor registers whi=
ch
>     keep MIN_LINE_LENGTH fixed across both binning modes.
>=20
>     This will make the driver quite more complicated, but userspace
>     expectations of non-negative blankings will be met. And it's likely
>     that the sensor is internally doing pre-ADC averaging horizontally as
>     well, or so my best guess is.
>=20

Which makes me lean more on OPTION 2 now.

In our case above with 2x2-special-binning mode for 1640x1232, the register
values are:

    LINE_LENGTH =3D 3560 pixels
    FRAME_LENGTH =3D 632 lines


So OPTION 1 would give us:

    HBLANK =3D 1920, VBLANK =3D -600

When actually the datasheet's "H Binning =3D Analog" would suggest to me th=
at
reality looks more like:

    LINE_LENGTH =3D 1780 pixels
    FRAME_LENGTH =3D 1264 lines

So OPTION 2 would give us:

    HBLANK =3D 140, VBLANK =3D 32

> Of course, there are other options to just leave this highly used sensor
> alone, or support embedded data and internal pads without mandating the n=
ew
> FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that =
as
> a last resort.

[snip]

Thanks,
    Jai

