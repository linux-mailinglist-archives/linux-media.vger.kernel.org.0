Return-Path: <linux-media+bounces-64175-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wcIvJTacJmrhZgIAu9opvQ
	(envelope-from <linux-media+bounces-64175-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:40:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D965539A
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 12:40:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=sVcK9aes;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64175-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64175-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D54823089EA7
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 10:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D123BB12D;
	Mon,  8 Jun 2026 10:31:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6786F3BA241
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 10:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914676; cv=none; b=Mpl4oWWemqr1zGqAGGwArDQmwu4Uc45iB3yzOEnb+XD1Opx4kup2XcJOlTzpblyyFUBTJXPq31KKVQoBFuKKDj4eLpY+Ge87bqxuV99Bmu0Pqxqsrbz7X9GOC3SFlfm876nHuXiJB7znsZF/+zTRsxPNRRUuTDtybCp81jT/Crk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914676; c=relaxed/simple;
	bh=TWMs+P233zw51vncShRvr4wnmbH5eT652u3c2jB1WM4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=EX9aFKG5sYEoHd0kDhmXHJPOERpnH496jxs04/vJFHrMt9drRhwSiIgY0Obn2IcQR/Zm229tLTMbTxNjBBNVN60zqaGL2O8x8MjSB9nYhfF0iVKot3KpjY+YtVQfR0CFhkucKlrrxk6pL2k7RojzQiAXe/AcTLoaw0qUQm4lEqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sVcK9aes reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A610267;
	Mon,  8 Jun 2026 12:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780914644;
	bh=TWMs+P233zw51vncShRvr4wnmbH5eT652u3c2jB1WM4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sVcK9aes+OQEZpk0l4Q5KGp3WUZP93fORhxRyTHj8RBiMESE3JCuGchGIvWFgQtjS
	 1gxGdNDtRax5zYTRwDPdaHmaQtMphAUmuQEhXfFpdm2H/a5JSf+gDHNkuabhtqY5jK
	 BgVxkBcFmMHCFwaokQT30OjIexcFJcK8sJ0xsVy0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aiZnQgyEBkZH7er0@zed>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-7-sakari.ailus@linux.intel.com> <aiZnQgyEBkZH7er0@zed>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and exposure for analogue binning
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com
 >
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans@jjverkuil.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 08 Jun 2026 16:01:06 +0530
Message-ID: <178091466607.16054.13972332068848565738@freya>
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
	TAGGED_FROM(0.00)[bounces-64175-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:dave.stevenson@raspberrypi.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:from_mime,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D4D965539A

Hi Jacopo, Sakari,
++ Dave, Hans and Laurent,

Quoting Jacopo Mondi (2026-06-08 12:28:46)
> Hi Sakari
>=20
> On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > When vertical analogue binning is in use, the minimum frame length in
> > lines decreases to around half of the normal. In relation to the sensor=
's
> > output size this means vertical blanking can be negative but that's not=
 an
> > issue as control values are signed. Remove the workaround for this
>=20
> Didn't we just discussed two weeks ago in media summit how negative
> blankings are a bad idea, and of all drivers one could decide to play
> with imx219 is probably the worse due it's large use base and the fact
> libcamera doesn't support negative blankings ?
>=20
> Have I missed something ?
>=20

I think it would be helpful if I write down clearly how this sensor
operates (to the best of my knowledge) so we can decide on the correct
fix:

--------------------

IMX219 sensor has an active resolution of 3280x2464.

The driver currently programs the sensor VT pixel clock as fixed for a
given lane configuration.

In 2-lane mode it reads 182.4 MPixel/second:

    #define IMX219_PIXEL_RATE		182400000

And the framerate is given by:

    PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)

where FRAME_LENGTH and LINE_LENGTH are registers that include the active
height and width along with blankings.

There are restrictions on the minimum of the LINE_LENGTH register and
minimum vertical blanking (32), which cap the framerate for the full resolu=
tion
mode.

    MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
    MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) =3D 2464 + 32
                           =3D> 2496 lines

The maximum frame rate is

    182400000/(2496*3448) =3D> ~ 21.2 frames/second

--------------------

A user might want to stream a lower resolution with the full field-of-view,
let's take 1640x1232 (which is exactly 1/2 of active area) as an example.

The sensor hardware can achieve this using two different binning modes:

    2x2-binning (regval: 0x1)
    2x2-analog-(special)-binning (regval: 0x3)

The sensor pipeline looks like:

active pixel array ->
    analogue crop (none) ->
        2x2 binning and ADC readout ->
                output to CSI-2 bus

The mode names suggest that binning can happen either before or after ADC,
but the datasheet is not very clear about the process. We can infer
some details though. See below..

--------------------

With the "normal" 2x2-binning mode the sensor allows programming
FRAME_LENGTH to a lower value. The driver still uses the min blanking of 32
lines, but the height is now 1232, half of the 2464 before.

    MIN_LINE_LENGTH: 0xd78 =3D> 3448 pixels
    MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK =3D 1232 + 32
                           =3D> 1264 lines

The maximum frame rate is

    182400000/(1264*3448) =3D> ~ 41.8 frames/second

--------------------

With the "special" 2x2-binning mode, the datasheet notes that FRAME_LENGTH
register should be in units of 2 Lines instead of 1 Line. This means
cutting it down by half once more:

    MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 =3D (1232 + 32)/2
                           =3D> 632 lines

While there is a slightly higher minimum enforced for the line length:

    MIN_LINE_LENGTH: 0xde8 =3D> 3560 pixels

The maximum frame rate is

    182400000/(632*3560) =3D> ~ 81.0 frames/second

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
registers and maximum possible framerate, I think it is safe to say that:

    2x2-binning =3D> Readout half the pixels (do vertical averaging in the
                                            analogue domain, before ADC
                                            reads out the voltages)

    2x2-special-binning =3D> Readout a quarter of the pixels (???)

FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4x1
binning (combining 4 lines instead of blocks of 2x2).. which does not make
sense to me.

My best guess is that in 2x2-special-binning mode the sensor does *both
horizontal and vertical* averaging in the analogue domain, before the ADC
reads out the voltages.

A higher minimum LINE_LENGTH value for this mode is the best "hard"
evidence I have for this guess unfortunately, as the datasheet is quite
lacking on this topic.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The APIs before Sakari's series expose HBLANK and VBLANK controls instead
of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.

The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1232,
so the sensor registers would suggest that we have a *negative vertical
blanking*. Which as Jacopo and Laurent both point out, does not make any
conceptual sense whatsoever.

What the driver does today to avoid these negative values is to double the
PIXEL_RATE control value to 364800000 when using 2x2-special-binning mode
(and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
 2xLines)

As Sakari pointed out, that does not make any sense either. The sensor PLL
values are completely unchanged, so the pixel readout must still be
happening at the same rate. Moreover, the new raw sensor model will expose
FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
doubling the PIXEL_RATE breaks those calculations.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If we want to support the new raw sensor model (that mandates the new
FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
fix the PIXEL_RATE for sure. I see two options going forward:

OPTION 1 (as proposed by Sakari):

    Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
    and VBLANK controls when using 2x2-special-binning mode.

    This will break any userspace tools, many libcamera pipelines included,
    that never expected those control values to be negative (even though
    the API has always permitted those)

OPTION 2 (something that struck me today morning discussing with Jacopo):
   =20
    Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
    lower to compensate, which will diverge from the sensor registers which
    keep MIN_LINE_LENGTH fixed across both binning modes.

    This will make the driver quite more complicated, but userspace
    expectations of non-negative blankings will be met. And it's likely
    that the sensor is internally doing pre-ADC averaging horizontally as
    well, or so my best guess is.

Of course, there are other options to just leave this highly used sensor
alone, or support embedded data and internal pads without mandating the new
FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that as
a last resort.

> > non-issue that doubled the pixel rate, frame length in lines and exposu=
re
> > time.
> >
> > The resulting change also fixes the minimum, the maximum and the step
> > values for the control.
> >
> > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for anal=
og binning")
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks,
    Jai

> > ---
> >  drivers/media/i2c/imx219.c | 37 ++++++++++++++-----------------------
> >  1 file changed, 14 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 3aebcbaa3fcd..3cee31758b7e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -420,15 +420,6 @@ static void imx219_get_binning(struct v4l2_subdev_=
state *state, u8 *bin_h,
> >
> >  }
> >
> > -static inline u32 imx219_get_rate_factor(struct v4l2_subdev_state *sta=
te)
> > -{
> > -     u8 bin_h, bin_v;
> > -
> > -     imx219_get_binning(state, &bin_h, &bin_v);
> > -
> > -     return (bin_h & bin_v) =3D=3D IMX219_BINNING_X2_ANALOG ? 2 : 1;
> > -}
> > -
> >  /* -------------------------------------------------------------------=
----------
> >   * Controls
> >   */
> > @@ -440,19 +431,17 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >       struct i2c_client *client =3D v4l2_get_subdevdata(&imx219->sd);
> >       const struct v4l2_mbus_framefmt *format;
> >       struct v4l2_subdev_state *state;
> > -     u32 rate_factor;
> >       int ret =3D 0;
> >
> >       state =3D v4l2_subdev_get_locked_active_state(&imx219->sd);
> >       format =3D v4l2_subdev_state_get_format(state, 0);
> > -     rate_factor =3D imx219_get_rate_factor(state);
> >
> >       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> >               int exposure_max, exposure_def;
> >
> >               /* Update max exposure while meeting expected vblanking */
> >               exposure_max =3D format->height + ctrl->val -
> > -                     IMX219_EXPOSURE_OFFSET * rate_factor;
> > +                     IMX219_EXPOSURE_OFFSET;
> >               exposure_def =3D (exposure_max < IMX219_EXPOSURE_DEFAULT)=
 ?
> >                               exposure_max : IMX219_EXPOSURE_DEFAULT;
> >               ret =3D __v4l2_ctrl_modify_range(imx219->exposure,
> > @@ -479,7 +468,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >               break;
> >       case V4L2_CID_EXPOSURE:
> >               cci_write(imx219->regmap, IMX219_REG_EXPOSURE,
> > -                       ctrl->val / rate_factor, &ret);
> > +                       ctrl->val, &ret);
> >               break;
> >       case V4L2_CID_DIGITAL_GAIN:
> >               cci_write(imx219->regmap, IMX219_REG_DIGITAL_GAIN,
> > @@ -496,7 +485,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
> >               break;
> >       case V4L2_CID_VBLANK:
> >               cci_write(imx219->regmap, IMX219_REG_FRM_LENGTH_A,
> > -                       (format->height + ctrl->val) / rate_factor, &re=
t);
> > +                       format->height + ctrl->val, &ret);
> >               break;
> >       case V4L2_CID_HBLANK:
> >               cci_write(imx219->regmap, IMX219_REG_LINE_LENGTH_A,
> > @@ -837,8 +826,8 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
> >       const struct imx219_mode *mode;
> >       struct v4l2_mbus_framefmt *format;
> >       struct v4l2_rect *crop;
> > -     u8 bin_h, bin_v, bin_hv;
> > -     int ret;
> > +     u8 bin_h, bin_v;
> > +     int ret, bin_hv;
> >
> >       format =3D v4l2_subdev_state_get_format(state, 0);
> >
> > @@ -879,23 +868,25 @@ static int imx219_set_pad_format(struct v4l2_subd=
ev *sd,
> >       crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> >
> >       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > -             unsigned int rate_factor =3D imx219_get_rate_factor(state=
);
> >               int exposure_max;
> >               int exposure_def;
> >               int llp_min;
> >               int pixel_rate;
> >
> >               /* Update limits and set FPS to default */
> > +             int vblank_min =3D ((int)mode->height * (1 - bin_hv) / bi=
n_hv) +
> > +                     IMX219_VBLANK_MIN;
> >               ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> > -                                            IMX219_VBLANK_MIN * rate_f=
actor,
> > -                                            (IMX219_FLL_MAX - mode->he=
ight) *
> > -                                            rate_factor, rate_factor,
> > -                                            mode->fll_def - mode->heig=
ht);
> > +                                            vblank_min,
> > +                                            IMX219_FLL_MAX - mode->hei=
ght, 1,
> > +                                            (int)(mode->fll_def / bin_=
hv) -
> > +                                            (int)mode->height);
> >               if (ret)
> >                       return ret;
> >
> >               ret =3D __v4l2_ctrl_s_ctrl(imx219->vblank,
> > -                                      mode->fll_def - mode->height);
> > +                                      (int)(mode->fll_def / bin_hv) -
> > +                                      (int)mode->height);
> >               if (ret)
> >                       return ret;
> >
> > @@ -932,7 +923,7 @@ static int imx219_set_pad_format(struct v4l2_subdev=
 *sd,
> >                       return ret;
> >
> >               /* Scale the pixel rate based on the mode specific factor=
 */
> > -             pixel_rate =3D imx219_get_pixel_rate(imx219) * rate_facto=
r;
> > +             pixel_rate =3D imx219_get_pixel_rate(imx219);
> >               ret =3D __v4l2_ctrl_modify_range(imx219->pixel_rate, pixe=
l_rate,
> >                                              pixel_rate, 1, pixel_rate);
> >               if (ret)
> > --
> > 2.47.3
> >
> >

