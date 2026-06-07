Return-Path: <linux-media+bounces-64035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xmhHEdjmJGqcBQIAu9opvQ
	(envelope-from <linux-media+bounces-64035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:34:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18964EBF7
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 05:34:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=dGDahu2H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64035-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64035-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2162E3010B86
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 03:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C481F348C61;
	Sun,  7 Jun 2026 03:34:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385444071DA;
	Sun,  7 Jun 2026 03:34:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780803284; cv=none; b=RkC7LN3jrqYeunax1c3S2dgkNAB1wefVUR4Lk2w9IIoLiziDHk+u8gSBgrn0UmxdJ/aAhOVlsTvKCiSpinSEJrJcjBRgGJATtV7CC79hASoceZKyXgbe3NEwExzOjdOAokYbnqTUdnA8vcU+/DOfocT99NsaTkPItm+l/aZ8AK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780803284; c=relaxed/simple;
	bh=m9+EXGQ2189+pWi7+qm/GPNsrwU0aGu5PWmyLqwSDHM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=drsT3xd5Bw+fa0uXgtZmSQS9BwZRkbqA7wRmK5OU644jletlx2360JyflM8URm+VcIY2y4yRVpMs5mce6KheWTcFbcbACbC6uI1arVXf8Mj70JI2VdnW9y/led9TDo8o0N9ThrrvMQlP2N0l7Achd+7MhsVu5cDPqUO51UqzhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dGDahu2H; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A163497;
	Sun,  7 Jun 2026 05:34:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780803253;
	bh=m9+EXGQ2189+pWi7+qm/GPNsrwU0aGu5PWmyLqwSDHM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dGDahu2HMw/0fAcImtYLNCHDT2Z6ppPFzo61XRXuRsCuvCcOR++//W/MK+s0ExztH
	 GIp2a5GMBDsz4wdYgS8zIXUW/z3qmWmcZYyRV0CGn+gVe/MTa99Bzhqd/LLT+NA+sA
	 syvHFdFr96xRQmWQfJLtqSjwGOU0ebaf7AC2GPM0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN0P287MB1828B9AF2057CE964675318E8B1E2@PN0P287MB1828.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com> <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com> <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM> <178075217188.9570.14789474340505402551@freya> <PN3P287MB18292FBAEABB556C051434848B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM> <178075974823.9570.15829300390679437100@freya> <PN0P287MB1828B9AF2057CE964675318E8B1E2@PN0P287MB1828.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Sun, 07 Jun 2026 09:04:34 +0530
Message-ID: <178080327481.9570.13702566645856478041@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64035-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:kieran.bingham@ideasonboard.com,m:krzk+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:sakari.ailus@linux.intel.com,m:tarang.raval@siliconsignals.io,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,freya:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E18964EBF7

Quoting Tarang Raval (2026-06-06 21:51:38)
> > Quoting Tarang Raval (2026-06-06 20:15:48)
> > > Hi Jai.
> > >
> > > > Quoting Tarang Raval (2026-06-06 13:47:36)
> > > > > Hi Jai,
> > > > >
> > > > > Sorry, in my first review I missed a few minor issues listed belo=
w.
> > > > >
> > > >
> > > > No worries, thank you for the reviews.
> > > >
> > > > > I also noticed one major issue in the driver. Please check the co=
mments below.
> > > > >
> > > > > Other than that, the driver looks perfect.
> > > > >
> > > > > > Add a V4L2 subdev driver for the Sony IMX678 image sensor.
> > > > > >
> > > > > > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type
> > > > > > solid-state image sensor with a square pixel array and 8.40 M e=
ffective
> > > > > > pixels.
> > > > > >
> > > > > > The following features are supported by this driver:
> > > > > > - MIPI RAW12 output
> > > > > > - Monochrome and Color (Bayer filter) variants
> > > > > > - Multiple input clock frequencies
> > > > > > - Multiple link frequencies
> > > > > > - VBLANK and HBLANK control for variable framerate
> > > > > > - VFLIP and HFLIP control for flipping readout
> > > > > > - Exposure and analogue gain control
> > > > > > - Test pattern control
> > > > > >
> > > > > > Following features are not currently supported:
> > > > > > - MIPI RAW10 output
> > > > > > - Pixel-perfect crop reporting, accounting for the shift-by-1 w=
hen
> > > > > >   doing HFLIP/VFLIP where the sensor maintains RGGB bayer order=
ing
> > > > > >
> > > > > > Along with the ones below which depend on the new raw sensor mo=
del:
> > > > > > - Embedded data stream
> > > > > > - Freely configurable cropping
> > > > > > - Increased framerate when cropping
> > > > > > - 2x2 binning support
> > > > > >
> > > > > > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > >
> > > > > ...
> > > > >
> > > > > > +static const u32 codes_bayer[] =3D {
> > > > > > +       MEDIA_BUS_FMT_SRGGB12_1X12,
> > > > > > +};
> > > > > > +
> > > > > > +static const u32 codes_monochrome[] =3D {
> > > > > > +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */
> > > > >
> > > > > Above comment adds no useful information and can be dropped.
> > > > >
> > > > > > +};
> > > > > > +
> > > > > > +static const struct imx678_model_info imx678_aaqr_info =3D {
> > > > > > +       .type =3D IMX678_COLOR,
> > > > > > +       .codes =3D codes_bayer,
> > > > > > +       .num_codes =3D ARRAY_SIZE(codes_bayer),
> > > > > > +};
> > > > > > +
> > > > > > +static const struct imx678_model_info imx678_aamr_info =3D {
> > > > > > +       .type =3D IMX678_MONOCHROME,
> > > > > > +       .codes =3D codes_monochrome,
> > > > > > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),
> > > > > > +};
> > > > > > +
> > > > > > +static const char * const imx678_supply_name[] =3D {
> > > > > > +       "avdd",  /* Analog (3.3V) supply */
> > > > > > +       "dvdd",  /* Digital Core (1.1V) supply */
> > > > > > +       "ovdd",  /* IF (1.8V) supply */
> > > > > > +};
> > > > > > +
> > > > > > +struct imx678 {
> > > > > > +       struct v4l2_subdev sd;
> > > > > > +       struct media_pad pad;
> > > > > > +       struct regmap *cci;
> > > > > > +
> > > > > > +       const struct imx678_model_info *info;
> > > > > > +
> > > > > > +       struct clk *xclk;
> > > > > > +       u32 xclk_freq;
> > > > > > +
> > > > > > +       /* chosen INCK_SEL register value */
> > > > > > +       u8  inck_sel_val;
> > > > > > +
> > > > > > +       /* Link configurations */
> > > > > > +       enum imx678_lanemode lane_mode;
> > > > > > +       unsigned long link_freq_bitmap;
> > > > > > +
> > > > > > +       struct gpio_desc *reset_gpio;
> > > > > > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_s=
upply_name)];
> > > > > > +
> > > > > > +       struct v4l2_ctrl_handler ctrl_handler;
> > > > > > +
> > > > > > +       /* V4L2 Controls */
> > > > > > +       struct v4l2_ctrl *exposure;
> > > > > > +       struct v4l2_ctrl *vblank;
> > > > > > +       struct v4l2_ctrl *hblank;
> > > > > > +
> > > > > > +       /* Tracking sensor VMAX/HMAX value */
> > > > > > +       u32 vmax;
> > > > > > +};
> > > > > > +
> > > > > > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
> > > > > > +{
> > > > > > +       return container_of(_sd, struct imx678, sd);
> > > > >
> > > > > Use container_of_const.
> > > > >
> > > >
> > > > Why is that necessary?
> > >
> > > container_of_const() preserves const and avoids accidentally casting =
it away.
> > > For non-const pointers it behaves the same as container_of(), while f=
or const
> > > pointers it preserves constness.
> > >
> > > >
> > > > > > +}
> > > > >
> > > > > ...
> > > > >
> > > > > > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > > +{
> > > > > > +       struct imx678 *imx678 =3D container_of(ctrl->handler, s=
truct imx678,
> > > > > > +                                            ctrl_handler);
> > > > >
> > > > > Use container_of_const.
> > > > >
> > > > > > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx6=
78->sd);
> > > > > > +       const struct v4l2_mbus_framefmt *format;
> > > > > > +       struct v4l2_subdev_state *state;
> > > > > > +       int rpm_in_use;
> > > > > > +       int ret =3D 0;
> > > > > > +
> > > > > > +       state =3D v4l2_subdev_get_locked_active_state(&imx678->=
sd);
> > > > > > +       format =3D v4l2_subdev_state_get_format(state, IMX678_S=
OURCE_PAD);
> > > > > > +
> > > > > > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > > > > +               u32 current_exposure =3D imx678->exposure->cur.=
val;
> > > > > > +
> > > > > > +               imx678->vmax =3D format->height + ctrl->val;
> > > > >
> > > > > ........(1)
> > > > >
> > > > > > +
> > > > > > +               current_exposure =3D clamp_t(u32, current_expos=
ure,
> > > > > > +                                          IMX678_EXPOSURE_MIN,
> > > > > > +                                          imx678->vmax - IMX67=
8_SHR_MIN);
> > > > > > +               ret =3D __v4l2_ctrl_modify_range(imx678->exposu=
re,
> > > > > > +                                              IMX678_EXPOSURE_=
MIN,
> > > > > > +                                              imx678->vmax - I=
MX678_SHR_MIN,
> > > > > > +                                              1, current_expos=
ure);
> > > > > > +               if (ret)
> > > > > > +                       return ret;
> > > > > > +       }
> > > > > > +
> > > > > > +       /*
> > > > > > +        * Applying V4L2 control value only happens when power =
is up for
> > > > > > +        * streaming
> > > > > > +        */
> > > > > > +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev);
> > > > > > +       if (!rpm_in_use)
> > > > > > +               return 0;
> > > > >
> > > > > As in the last revision, as I suggested before, I will again sugg=
est using
> > > > > pm_runtime_get_if_active() here instead of pm_runtime_get_if_in_u=
se().
> > > > >
> > > > > This does not seem to align with the comment above:
> > > > > Applying V4L2 control value only happens when power is up for str=
eaming
> > > > >
> > > > > "Power is up" implies that the device is in the runtime PM ACTIVE=
 state,
> > > > > rather than simply having a non-zero usage count.
> > > > >
> > > >
> > > > I agree with the comment being slightly misleading, but same as the=
 last
> > > > revision, I still don't fully buy your argument here :-)
> > > >
> > > > In the case you talk about, where PM is ACTIVE but usage count =3D=
=3D 0, we
> > > > anyway know that the count will only increase when .enable_streams =
is
> > > > called, at which point the driver will anyway write *all* the regis=
ters
> > > > including calling set_ctrl for each control with the cached values.
> > > >
> > > > So why should we do (redundant) writes here?
> > >
> > > I think this is mostly a difference in expectations.
> > >
> > > My view is that if the device is runtime PM ACTIVE, the hardware is a=
ccessible
> > > and register writes can be performed. In that case, I would expect a =
control
> > > change to be applied to hardware immediately.
> > >
> > > With pm_runtime_get_if_in_use(), there is a state where the device is=
 still
> > > ACTIVE but control changes are only cached in software and not writte=
n to
> > > hardware until streaming starts again. While the value is not lost, I=
 would
> > > expect hardware and control state to remain synchronized whenever the=
 device
> > > is already active.
> > >
> > > So I understand the cached-control argument, but if the hardware is a=
ccessible,
> > > I would prefer applying the control immediately rather than deferring=
 it.
> > >
> >
> > Why does it matter if some sensor register doesn't match the value in t=
he
> > cached controls for a brief period after streaming stopped and sensor is
> > powered off? We don't have autosuspend timer here like other drivers.
> >
> > I'll update the comment in v5 for future readers/developers in case that
> > changes.
>=20
>=20
> Fair enough for me.
>=20
>=20
> > > > > I also don't understand why we need to be strict here and require=
 the
> > > > > runtime PM usage count to be greater than zero. What matters befo=
re accessing
> > > > > the hardware registers is that the device is powered and accessib=
le, not
> > > > > whether there is an active user holding a runtime PM reference.
> > > > >
> > > > > Anyway, rpm_in_use does not seem necessary here. The check could =
be simplified to:
> > > > > if (pm_runtime_get_if_active(&client->dev) <=3D 0)
> > > >
> > > > The rpm_in_use value is used below in this function to ensure we do=
n't do
> > > > pm_runtime_put() in case of a negative retval. This is not really h=
andled
> > > > by most drivers today, but I wanted to fix it here given recent dis=
cussion
> > > > [1] and annoying Sashiko reports.
> > > >
> > > > [1]: https://lore.kernel.org/all/ahyh0ZlwlZqr7VNa%40kekkonen.locald=
omain
> > >
> > > Thats my understanding as well. With:
> > > if (pm_runtime_get_if_active(&client->dev) <=3D 0)
> > >         return 0;
> > >
> > > both the 0 and negative return paths exit immediately, so neither the=
 switch
> > > statement nor pm_runtime_put() can be reached.
> >
> > If we do that no controls will be written to the hardware if userspace =
has
> > disabled runtime.
>=20
> Do you mean the case where userspace disables runtime PM via sysfs while =

> streaming is still running?
>=20
> In that scenario, shouldn't the device usage count remain non-zero due to=
 the
> active stream?

Ah no, I meant if userspace disabled it through sysfs while streaming is
not running. But I checked on my board and it always returns 1 in that
case. There is no way to trigger a pm_runtime_disable() from userspace, all
you can do is force the device to always be on.

So it only returns -EINVAL if CONFIG_PM=3Dn, in which case we should still
write registers. Thus I don't agree with:

    if (pm_runtime_get_if_active(&client->dev) <=3D 0)
            return 0;

On testing the CONFIG_PM=3Dn case though, I see that pm_runtime_put will
always return -ENOSYS due to being stubbed out... so the original code flow
was correct:

    if (!pm_runtime_get_if_active(&client->dev))
            return 0;

    /* write registers */

    /* unconditional put */
    pm_runtime_put(&client->dev)

I'll switch back to it in next revision.

>=20
> Best Regards,
> Tarang

Thanks,
Jai

