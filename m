Return-Path: <linux-media+bounces-64264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dL7kCD6tJ2rY0QIAu9opvQ
	(envelope-from <linux-media+bounces-64264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 08:05:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5665C975
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 08:05:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=ideasonboard.com header.s=mail header.b=Xq8gysN0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64264-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64264-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=ideasonboard.com (policy=none);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B20CE3076B08
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 06:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8733CF054;
	Tue,  9 Jun 2026 06:02:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9824F3C942C
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 06:02:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984925; cv=none; b=S/lpjQ66l756rG/5H32TO6o8LdtB/s5Xltr4O/gGq5TLkNvYMrPH+7Sr/xtBz8GALyRaxCfd/kwDWWaKcQeVq5c8MJx5ItwvjpiLH0QOz/3rXjgvkeEXJoaC6SLV/o1bkxUg9XePb+9h+K5q4HhU1tCFyXUrUIH4loaUua91uDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984925; c=relaxed/simple;
	bh=lFWrenF/4MW4z1T4d37sS9c0v+gst4cGzhC3AItnytk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NvUtXfsHThL6bJyWjSUybjxE1V67sm23ofKgr60mJBFPX4ixEDhd6zRJXxll9A45bM0z7nlr51qBz/SL1ajWzfkozEh+52e6l0rd8jnDH5AbHlnLxfHYayUec/wYgDMsC30xjp/Xy5cpP1HcFYyYnx3+u1JeRPjsH5dYBA+HM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xq8gysN0 reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:bcf2:9325:a9bd:32b:e71])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB7C615BF;
	Tue,  9 Jun 2026 08:01:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780984892;
	bh=lFWrenF/4MW4z1T4d37sS9c0v+gst4cGzhC3AItnytk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Xq8gysN0zS424yjE2cNN+qPSv/oGbwBNWo+r+/t9dyHJnnzlJiEIzafjqpfYETZS2
	 ph5KgCnbBCWkltrdYbGQ3Ne69YFWSetvLuA96zItz668xlgngerkTs+2hgcO2uvFY3
	 AAw5s3OcJeu+YSmsuFciE7t7Ay+Lq2T4vLeCdsVg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178098472222.19620.1186662371886498871@freya>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260607215356.842932-3-sakari.ailus@linux.intel.com> <CAPY8ntDvpP8Nuc2VFOFgp+5HSDNWmJCika5in=pjZJVry=J7RQ@mail.gmail.com> <20260608212856.GA944266@killaraus.ideasonboard.com> <178098472222.19620.1186662371886498871@freya>
Subject: Re: [PATCH v5 02/10] media: imx219: Scale the vblank limits according to rate_factor
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, hans@jjverkuil.nl, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, David Plowman <david.plowman@raspberrypi.com>, "Yu, On
 g Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen" <khai.wen.ng@intel.com>, Rishikesh Donadkar <r-donadkar@ti.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 09 Jun 2026 11:31:54 +0530
Message-ID: <178098491481.19620.16486648231434103823@freya>
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
	TAGGED_FROM(0.00)[bounces-64264-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:dave.stevenson@raspberrypi.com,m:laurent.pinchart@ideasonboard.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,freya:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75D5665C975

Quoting Jai Luthra (2026-06-09 11:28:42)
> Hi Laurent,
>=20
> Quoting Laurent Pinchart (2026-06-09 02:58:56)
> > Hi Dave,
> >=20
> > Thanks a lot for taking the time to investigate and provide very
> > valuable insight. I really appreciate that.
> >=20
> > On Mon, Jun 08, 2026 at 04:29:46PM +0100, Dave Stevenson wrote:
> > > On Sun, 7 Jun 2026 at 22:54, Sakari Ailus wrote:
> > > >
> > > > The limits for vertical blanking (and frame length in pixels) is re=
lated
> > > > to the properties of the hardware, it's not in half-line units the =
driver
> > > > uses. Multiply the vertical blanking limits by the rate_factor to s=
atisty
> > > > hardware requirements.
> > >=20
> > > Whilst that would be a logical interpretation, it doesn't match with
> > > how the hardware performs, nor the docs.
> > >=20
> > > The datasheet for register FRM_LENGTH_A 0x160 says
> > > frame_length_lines
> > > BINNING_MODE =3D 0,1,2
> > > Unit: 1Lines
> > > BINNING_MODE =3D 3
> > > Units: 2Lines
> > >=20
> > > That's not units of 2 lines for active lines only, that is units of 2
> > > lines for ALL lines.
> > >=20
> > > I have tested it, and the sensor works fine with FRM_LENGTH_A being
> > > 0x278 in the 1640x1232 mode, and 0x100 in 640x480 modes with all the
> > > tests I've thrown at it. Drop them any lower and it does stall or give
> > > corrupt horizontal lines.
> >=20
> > If I understand this correctly, it indicates that
> >=20
> > - The frame length is expressed as a number of lines at the output of
> >   the sensor (after binning).
> >=20
> > - The minimum margin between the output height (after binning) and the
> >   frame length is 32 lines.
> >=20
> > - In special binning mode, the FRM_LENGTH_A register needs to be
> >   programmed with frame_length_lines / 2.
> >=20
> > The last constraint is device-specific, and as far as I understand it
> > can be handled directly in the driver without affecting the userspace
> > API by simply dividing the frame length value by 2 before writing it to
> > the register.
> >=20
> > It's getting a bit late, I'll test the "regular" binning mode
> > (BINNING_MODE =3D 1) tomorrow to see how it compares (unless someone be=
ats
> > me to it). Unless I get very unexpected results, it seems that the
> > existing implementation is correct and the patch should be dropped.
> >=20
> > One thing that may not be implemented correctly is different binning
> > modes horizontally and vertically. imx219_get_rate_factor() will return
> > 2 only when both the horizontal and vertical binning modes are "special
> > analog binning". When used to scale the frame length and exposure time,
> > I wonder if only vertical binning should be taken into account.
> >=20
>=20
> That does make sense.
>=20
> When I was working on the binning and related issues in this driver, I had
> decided to always keep `bin_h =3D=3D bin_v` everywhere after some brief t=
ests
> with different values for them:
>=20
> 1. Setting bin_h =3D 0x1 (normal x2 binning) and bin_v =3D 0x0 (or vice v=
ersa)
>    results in the output image being stretched/squeezed, which is expected
>    but not a typical usecase
>=20
> 2. Setting bin_h =3D 0x3 (special x2 binning) and bin_v =3D 0x0 (or vice =
versa)
>    results in both dimensions getting binned as opposed to only one, which

Ah sorry it was: "none of the dimensions getting binned" but the output was
cropped. So in the above case (bin_h =3D 0x3), it would just drop the right
half of the image as opposed to squeezing it when bin_h =3D 0x1.

>    is unexpected, and it might be breaking other things with the sensor
>    timing too
>=20
> My analysis on the other sub-thread also suggests special x2 binning means
> analogue-domain averaging in both horzizontal and vertical dimensions..
> which matches up with this behaviour, so maybe we can't really separate
> vertical and horizontal out for the "special" case even if the registers
> allow us to.
>=20
> Thanks,
>     Jai
>=20
> > > (Please note that the sensor extends the frame length automatically to
> > > accommodate the exposure time requested, so do ensure the exposure
> > > time doesn't interact with the frame length if you're testing).
> > >=20
> > > This patch drops the maximum frame rate from 81.07 to 79.07fps in
> > > 1640x1232 (2.5%), and 200.1 to 188.39fps in 640x480 (6%) for no good
> > > reason that I can see.
> > > Unless anyone can produce a genuine situation where they see the
> > > sensor behave incorrectly with the old setup, I'll be very sad to see
> > > this merged.
> > >=20
> > > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for =
analog binning")
> > > > Cc: stable@vger.kernel.org
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 10 ++++++----
> > > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 223d3753cc93..d8fe7db18b6c 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_=
subdev *sd,
> > > >         crop->top =3D (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > > >
> > > >         if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > > > +               unsigned int rate_factor =3D imx219_get_rate_factor=
(state);
> > > >                 int exposure_max;
> > > >                 int exposure_def;
> > > >                 int llp_min;
> > > >                 int pixel_rate;
> > > >
> > > >                 /* Update limits and set FPS to default */
> > > > -               ret =3D __v4l2_ctrl_modify_range(imx219->vblank, IM=
X219_VBLANK_MIN,
> > > > -                                              IMX219_FLL_MAX - mod=
e->height, 1,
> > > > +               ret =3D __v4l2_ctrl_modify_range(imx219->vblank,
> > > > +                                              IMX219_VBLANK_MIN * =
rate_factor,
> > > > +                                              (IMX219_FLL_MAX - mo=
de->height) *
> > > > +                                              rate_factor, rate_fa=
ctor,
> > > >                                                mode->fll_def - mode=
->height);
> > > >                 if (ret)
> > > >                         return ret;
> > > > @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_su=
bdev *sd,
> > > >                         return ret;
> > > >
> > > >                 /* Scale the pixel rate based on the mode specific =
factor */
> > > > -               pixel_rate =3D imx219_get_pixel_rate(imx219) *
> > > > -                            imx219_get_rate_factor(state);
> > > > +               pixel_rate =3D imx219_get_pixel_rate(imx219) * rate=
_factor;
> > > >                 ret =3D __v4l2_ctrl_modify_range(imx219->pixel_rate=
, pixel_rate,
> > > >                                                pixel_rate, 1, pixel=
_rate);
> > > >                 if (ret)
> >=20
> > --=20
> > Regards,
> >=20
> > Laurent Pinchart

