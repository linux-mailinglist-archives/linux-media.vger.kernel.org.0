Return-Path: <linux-media+bounces-64408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HCqKArxFKWqqTQMAu9opvQ
	(envelope-from <linux-media+bounces-64408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:08:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291A66898B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 13:08:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=oaeZgD0r;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64408-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64408-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0B5E3128477
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910653FE352;
	Wed, 10 Jun 2026 10:57:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3FA3FD13A
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 10:57:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089077; cv=none; b=VBFESgVdgTS08o6BGqt4WjCgJoQeICabJcUsWtFLF4iqp82iyjTcU2xi6rsiTxsGx6M9A7vqH8WxSz0RrwERwQaDcKx5DYtXbS0+W+9suOoBPYwSgzskeezidk8+Ik/Z5kytNihoOxlN8v2DOYDqrRq4GnbK/Fi764A3tlSsObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089077; c=relaxed/simple;
	bh=8J2W0ETC3p8njd9IO9dFqa2ymZdjBzftvnAKRl8dAVU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gqujNfPSV1PlYuqQLnIxsnXNx9r1HA/bdCYn8xyunePga3rGsPE8LVdNIkGXzcmJfjhekI8QOdSCPxZS9bXeJIZMAR1IFpRivTyXUTedk7i9shLGNY1OzZ1a5t2+6qaRf/Qa4c1JppGqRpzogqQfUdPzS1oY33Fj5wQteNR8y/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oaeZgD0r reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5900524;
	Wed, 10 Jun 2026 12:57:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781089040;
	bh=8J2W0ETC3p8njd9IO9dFqa2ymZdjBzftvnAKRl8dAVU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oaeZgD0rSR5Ya/AStqKWb9FUU8ijPsBaj90wGfzeEfQWKr+Vd9OuQn+5ZDKda5ydC
	 nC0kntMdLjz+bNP/6zlC6UlCTU4vjDA91WVTNFmE41l23oxwU4Qj2EpE5Nm/Tl148t
	 8kfObJMCA/MlysXKttVcwCmaX+O++Xv5GdOVQn6Y=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178108737654.1799417.12257128301401647481@freya>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed> <178091466607.16054.13972332068848565738@freya> <178091757893.16054.4583389270412251379@freya> <aikyqqC_BsYI5D2M@kekkonen.localdomain> <178108737654.1799417.12257128301401647481@freya>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, Hans Verkuil <hans@jjverkuil.nl>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@
 ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 10 Jun 2026 16:27:43 +0530
Message-ID: <178108906380.1799417.14556725807061498193@freya>
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
	TAGGED_FROM(0.00)[bounces-64408-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dave.stevenson@raspberrypi.com,m:hans@jjverkuil.nl,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:sakari.ailus@linux.intel.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[raspberrypi.com,jjverkuil.nl,ideasonboard.com,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org, ideasonboard.com,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6291A66898B

Quoting Jai Luthra (2026-06-10 15:59:36)
> Hi Sakari,
>=20
> Quoting Sakari Ailus (2026-06-10 15:17:22)
> > Hi Jai,
> >=20
> > On Mon, Jun 08, 2026 at 04:49:38PM +0530, Jai Luthra wrote:
> > > Quoting Jai Luthra (2026-06-08 16:01:06)
> > > > Hi Jacopo, Sakari,
> > > > ++ Dave, Hans and Laurent,
> > > >=20
> > > > Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > > > > Hi Sakari
> > > > >=20
> > > > > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > > > > When vertical analogue binning is in use, the minimum frame len=
gth in
> > > > > > lines decreases to around half of the normal. In relation to th=
e sensor's
> > > > > > output size this means vertical blanking can be negative but th=
at's not an
> > > > > > issue as control values are signed. Remove the workaround for t=
his
> > > > >=20
> > > > > Didn't we just discussed two weeks ago in media summit how negati=
ve
> > > > > blankings are a bad idea, and of all drivers one could decide to =
play
> > > > > with imx219 is probably the worse due it's large use base and the=
 fact
> > > > > libcamera doesn't support negative blankings ?
> > > > >=20
> > > > > Have I missed something ?
> > > > >=20
> > > >=20
> > > > I think it would be helpful if I write down clearly how this sensor
> > > > operates (to the best of my knowledge) so we can decide on the corr=
ect
> > > > fix:
> > > >=20
> > > > --------------------
> > > >=20
> > > > IMX219 sensor has an active resolution of 3280x2464.
> > > >=20
> > > > The driver currently programs the sensor VT pixel clock as fixed fo=
r a
> > > > given lane configuration.
> > > >=20
> > > > In 2-lane mode it reads 182.4 MPixel/second:
> > > >=20
> > > >     #define IMX219_PIXEL_RATE           182400000
> > > >=20
> > > > And the framerate is given by:
> > > >=20
> > > >     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
> > > >=20
> > > > where FRAME_LENGTH and LINE_LENGTH are registers that include the a=
ctive
> > > > height and width along with blankings.
> > > >=20
> > > > There are restrictions on the minimum of the LINE_LENGTH register a=
nd
> > > > minimum vertical blanking (32), which cap the framerate for the ful=
l resolution
> > > > mode.
> > > >=20
> > > >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> > > >     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) =3D 2464 + 32
> > > >                            =3D> 2496 lines
> > > >=20
> > > > The maximum frame rate is
> > > >=20
> > > >     182400000/(2496*3448) =3D> ~ 21.2 frames/second
> > > >=20
> > > > --------------------
> > > >=20
> > > > A user might want to stream a lower resolution with the full field-=
of-view,
> > > > let's take 1640x1232 (which is exactly 1/2 of active area) as an ex=
ample.
> > > >=20
> > > > The sensor hardware can achieve this using two different binning mo=
des:
> > > >=20
> > > >     2x2-binning (regval: 0x1)
> > > >     2x2-analog-(special)-binning (regval: 0x3)
> > > >=20
> > > > The sensor pipeline looks like:
> > > >=20
> > > > active pixel array ->
> > > >     analogue crop (none) ->
> > > >         2x2 binning and ADC readout ->
> > > >                 output to CSI-2 bus
> > > >=20
> > > > The mode names suggest that binning can happen either before or aft=
er ADC,
> > > > but the datasheet is not very clear about the process. We can infer
> > > > some details though. See below..
> > > >=20
> > > > --------------------
> > > >=20
> > > > With the "normal" 2x2-binning mode the sensor allows programming
> > > > FRAME_LENGTH to a lower value. The driver still uses the min blanki=
ng of 32
> > > > lines, but the height is now 1232, half of the 2464 before.
> > > >=20
> > > >     MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
> > > >     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK =3D 1232 + 32
> > > >                            =3D> 1264 lines
> > > >=20
> > > > The maximum frame rate is
> > > >=20
> > > >     182400000/(1264*3448) =3D> ~ 41.8 frames/second
> > > >=20
> > > > --------------------
> > > >=20
> > > > With the "special" 2x2-binning mode, the datasheet notes that FRAME=
_LENGTH
> > > > register should be in units of 2 Lines instead of 1 Line. This means
> > > > cutting it down by half once more:
> > > >=20
> > > >     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 =3D (1232 + 3=
2)/2
> > > >                            =3D> 632 lines
> > > >=20
> > > > While there is a slightly higher minimum enforced for the line leng=
th:
> > > >=20
> > > >     MIN_LINE_LENGTH: 0xde8 =3D> 3560 pixels
> > > >=20
> > > > The maximum frame rate is
> > > >=20
> > > >     182400000/(632*3560) =3D> ~ 81.0 frames/second
> > > >=20
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >=20
> > > > Through the minimum allowed values of the FRAME_LENGTH and LINE_LEN=
GTH
> > > > registers and maximum possible framerate, I think it is safe to say=
 that:
> > > >=20
> > > >     2x2-binning =3D> Readout half the pixels (do vertical averaging=
 in the
> > > >                                             analogue domain, before=
 ADC
> > > >                                             reads out the voltages)
> > > >=20
> > > >     2x2-special-binning =3D> Readout a quarter of the pixels (???)
> > > >=20
> > > > FRAME_LENGTH being 1/4th of normal would seem to suggest that it is=
 a 4x1
> > > > binning (combining 4 lines instead of blocks of 2x2).. which does n=
ot make
> > > > sense to me.
> > > >=20
> > > > My best guess is that in 2x2-special-binning mode the sensor does *=
both
> > > > horizontal and vertical* averaging in the analogue domain, before t=
he ADC
> > > > reads out the voltages.
> > > >=20
> > > > A higher minimum LINE_LENGTH value for this mode is the best "hard"
> > > > evidence I have for this guess unfortunately, as the datasheet is q=
uite
> > > > lacking on this topic.
> > > >=20
> > >=20
> > > Found another evidence for this, see "Table 16 Mode Example" in the
> > > datasheet.
> > >=20
> > > It mentions "H Binning =3D Analog" for x2 binning mode (with ~4x the =
FPS)
> > > And "H Binning =3D Digital" for x4 binning mode
> > >=20
> > > It doesn't mention a ~2x FPS mode, which I assume is the normal 2x2-b=
inning
> > > mode, where I again assume that horizontal binning is done digitally.
> >=20
> > Most likely 4x vertical binning uses a combination of analogue and digi=
tal
> > binning. The type of the binning in general doesn't matter much, apart =
from
> > affecting the minimum line length in pixels and frame length in lines
> > values.
> >=20
>=20
> My understanding so far is:
>=20
> x2-binning does digital binning horizontally but analogue binning
> vertically
>=20
> x4-binning also does digital binning horizontally but analogue binning
> vertically
>=20
> x2-special-binning does analogue binning in both dimensions
>=20
> > >=20
> > >=20
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >=20
> > > > The APIs before Sakari's series expose HBLANK and VBLANK controls i=
nstead
> > > > of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
> > > >=20
> > > > The minimum value of FRAME_LENGTH is 632 when we are streaming 1640=
x1232,
> > > > so the sensor registers would suggest that we have a *negative vert=
ical
> > > > blanking*. Which as Jacopo and Laurent both point out, does not mak=
e any
> > > > conceptual sense whatsoever.
> > > >=20
> > > > What the driver does today to avoid these negative values is to dou=
ble the
> > > > PIXEL_RATE control value to 364800000 when using 2x2-special-binnin=
g mode
> > > > (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units=
 of
> > > >  2xLines)
> > > >=20
> > > > As Sakari pointed out, that does not make any sense either. The sen=
sor PLL
> > > > values are completely unchanged, so the pixel readout must still be
> > > > happening at the same rate. Moreover, the new raw sensor model will=
 expose
> > > > FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> > > > doubling the PIXEL_RATE breaks those calculations.
> > > >=20
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > >=20
> > > > If we want to support the new raw sensor model (that mandates the n=
ew
> > > > FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> > > > fix the PIXEL_RATE for sure. I see two options going forward:
> > > >=20
> > > > OPTION 1 (as proposed by Sakari):
> > > >=20
> > > >     Fix PIXEL_RATE to 182400000 and allow **negative values** for H=
BLANK
> > > >     and VBLANK controls when using 2x2-special-binning mode.
> > > >=20
> > > >     This will break any userspace tools, many libcamera pipelines i=
ncluded,
> > > >     that never expected those control values to be negative (even t=
hough
> > > >     the API has always permitted those)
> >=20
> > That's a clear bug, but it only becomes apparent when the sign bit is s=
et.
> >=20
>=20
> Agreed, I'll try to send patches for that in libcamera regardless of what
> we do here.
>=20
> > > >=20
> > > > OPTION 2 (something that struck me today morning discussing with Ja=
copo):
> > > >    =20
> > > >     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to=
 go
> > > >     lower to compensate, which will diverge from the sensor registe=
rs which
> > > >     keep MIN_LINE_LENGTH fixed across both binning modes.
> > > >=20
> > > >     This will make the driver quite more complicated, but userspace
> > > >     expectations of non-negative blankings will be met. And it's li=
kely
> > > >     that the sensor is internally doing pre-ADC averaging horizonta=
lly as
> > > >     well, or so my best guess is.
> > > >=20
> > >=20
> > > Which makes me lean more on OPTION 2 now.
> > >=20
> > > In our case above with 2x2-special-binning mode for 1640x1232, the re=
gister
> > > values are:
> > >=20
> > >     LINE_LENGTH =3D 3560 pixels
> > >     FRAME_LENGTH =3D 632 lines
> > >=20
> > >=20
> > > So OPTION 1 would give us:
> > >=20
> > >     HBLANK =3D 1920, VBLANK =3D -600
> > >=20
> > > When actually the datasheet's "H Binning =3D Analog" would suggest to=
 me that
> > > reality looks more like:
> > >=20
> > >     LINE_LENGTH =3D 1780 pixels
> > >     FRAME_LENGTH =3D 1264 lines
> > >=20
> > > So OPTION 2 would give us:
> > >=20
> > >     HBLANK =3D 140, VBLANK =3D 32
> >=20
> > This approach has the downsides that 1) it doesn't reflect what the sen=
sor
> > apparently does and 2) you lose one bit of granularity on line length in
> > pixels.
> >=20
>=20
> I agree with you on 2)
>=20
> On 1) though I don't think the sensor's register values are a good
> indicator of what the sensor apparently does.
>=20
> For example, FLL being programmed to ~ 1/4th of analogue crop height, whi=
le
> LLP being fixed to ~ analogue crop width would suggest the sensor is
> averaging 4 R/Gr/Gb/B pixels vertically in the analogue domain (possibly
> through common FD charge summing) before the ADC reads it out.
>=20
> But the table in the datasheet clearly mentions horizontal binning is
> (also) done in the analogue domain. Which makes more sense as well, given
> the output has an average of a 2x2 block of pixels and not a 4x1 block of
> pixels.
>=20
> > The advantage still is that it works around the sign bit issue. The new
> > controls still have their proper values but conversion between the two
> > becomes rather complicated. See
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/commit/?h=3Dmetadata=
&id=3D366cb25c7d944ef2935668a07471e4576e7088ed>
> > for instance how it looks like without that.
> >=20
>=20
> I see.. well IMHO even the LLP and FLL controls should try to model what
> the sensor does (if it is known, at least) rather than being just a 1-to-1
> mapping of the sensor registers. Which as Dave and I have mentioned, is n=
ot
> the case in many sensors that scale the HMAX register units according to
> some lower frequency clock (so 1 clock cycle =3D> multiple pixels)
>=20
> In this particular case it would mean the new controls should scale like:
>=20
> FRAME_LENGTH =3D FLL_REG / 2
> LINE_LENGTH =3D LLP_REG * 2

Sorry I need more coffee:

FRAME_LENGTH =3D FLL_REG * 2
LINE_LENGTH =3D LLP_REG / 2

>=20
> When analogue binning is used. Which should make your code slightly easie=
r,
> even if not re-usable across all sensors.
>=20
> Thanks,
>     Jai
>=20
> > >=20
> > > > Of course, there are other options to just leave this highly used s=
ensor
> > > > alone, or support embedded data and internal pads without mandating=
 the new
> > > > FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave=
 that as
> > > > a last resort.
> >=20
> > I agree. Especially because of its wide user base, it'd be really nice =
to
> > convert the imx219 to the Common Raw Sensor Model.
> >=20
> > --=20
> > Regards,
> >=20
> > Sakari Ailus
>

