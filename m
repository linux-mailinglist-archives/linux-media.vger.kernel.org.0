Return-Path: <linux-media+bounces-64022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uf0TBAYgJGq53QEAu9opvQ
	(envelope-from <linux-media+bounces-64022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 15:26:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16A64D9DB
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 15:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="i587/LT3";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64022-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64022-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B7E23051D65
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 13:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CC73B0AC4;
	Sat,  6 Jun 2026 13:23:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5125C22D781;
	Sat,  6 Jun 2026 13:23:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752189; cv=none; b=UtSp3kjCzo83CcagN52c9pG3O7cFJqMui/r3aL+M95WrYTNTX0BcQ/iRrtKw/UEYV55Kzf0WpB+MK5LPYKjG+1KHKZ6gA8WYKPlAz6qEcN1ddQGwk6a11bec3C50W+3CuZR+nqRvBjnyWqTEJnr9Cd98XP8CNzwgYISd0cgLM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752189; c=relaxed/simple;
	bh=RLIAVCK//KrMS+pM+b/MVl5xFIl2q8enEjIUDkU6NOk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=is9GGjwpEpO9Ktdy0FmXOaV/0RCJvj0aytHfJq2WZUu/mR72xwF9VUOkWPH2XKBTDTJdBctqWmOziD0bSfTW84T7UBCs7ah9UzC4zfLZf2smaYbhfqp9P9ITy9EU9IkH2VYtMkPK+Va/V9jO5fXOvyzdSTO7snA8SkPf/FFCpPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i587/LT3; arc=none smtp.client-ip=213.167.242.64
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7E4063C;
	Sat,  6 Jun 2026 15:22:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780752151;
	bh=RLIAVCK//KrMS+pM+b/MVl5xFIl2q8enEjIUDkU6NOk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i587/LT3vt+e/MY439X4JyUTGMUChOhIuiNACrMO3olA91vzHDXilvGzVDGdrldj3
	 2xTykk/1wCQFHCbppUP0tNcLDM6vBhhlaatcg9ioQYP33/bFeUV6FjV1O3/czSRQVV
	 H5fl5ldQB1gcSdRZKoQGMZSMfIwAvj1U372pVK2k=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com> <20260605-imx678-v4-2-58e57c67143d@ideasonboard.com> <PN3P287MB1829593C2DF9AFF8F24A39AF8B1E2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v4 2/2] media: i2c: imx678: Add driver for Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Sat, 06 Jun 2026 18:52:51 +0530
Message-ID: <178075217188.9570.14789474340505402551@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64022-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,freya:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5A16A64D9DB

Hi Tarang,

Quoting Tarang Raval (2026-06-06 13:47:36)
> Hi Jai,
>=20
> Sorry, in my first review I missed a few minor issues listed below.
>=20

No worries, thank you for the reviews.

> I also noticed one major issue in the driver. Please check the comments b=
elow.
>=20
> Other than that, the driver looks perfect.
>=20
> > Add a V4L2 subdev driver for the Sony IMX678 image sensor.
> >
> > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type
> > solid-state image sensor with a square pixel array and 8.40 M effective
> > pixels.
> >
> > The following features are supported by this driver:
> > - MIPI RAW12 output
> > - Monochrome and Color (Bayer filter) variants
> > - Multiple input clock frequencies
> > - Multiple link frequencies
> > - VBLANK and HBLANK control for variable framerate
> > - VFLIP and HFLIP control for flipping readout
> > - Exposure and analogue gain control
> > - Test pattern control
> >
> > Following features are not currently supported:
> > - MIPI RAW10 output
> > - Pixel-perfect crop reporting, accounting for the shift-by-1 when
> >   doing HFLIP/VFLIP where the sensor maintains RGGB bayer ordering
> >
> > Along with the ones below which depend on the new raw sensor model:
> > - Embedded data stream
> > - Freely configurable cropping
> > - Increased framerate when cropping
> > - 2x2 binning support
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> ...
>=20
> > +static const u32 codes_bayer[] =3D {
> > +       MEDIA_BUS_FMT_SRGGB12_1X12,
> > +};
> > +
> > +static const u32 codes_monochrome[] =3D {
> > +       MEDIA_BUS_FMT_Y12_1X12,   /* 12-bit mono */
>=20
> Above comment adds no useful information and can be dropped.
>=20
> > +};
> > +
> > +static const struct imx678_model_info imx678_aaqr_info =3D {
> > +       .type =3D IMX678_COLOR,
> > +       .codes =3D codes_bayer,
> > +       .num_codes =3D ARRAY_SIZE(codes_bayer),
> > +};
> > +
> > +static const struct imx678_model_info imx678_aamr_info =3D {
> > +       .type =3D IMX678_MONOCHROME,
> > +       .codes =3D codes_monochrome,
> > +       .num_codes =3D ARRAY_SIZE(codes_monochrome),
> > +};
> > +
> > +static const char * const imx678_supply_name[] =3D {
> > +       "avdd",  /* Analog (3.3V) supply */
> > +       "dvdd",  /* Digital Core (1.1V) supply */
> > +       "ovdd",  /* IF (1.8V) supply */
> > +};
> > +
> > +struct imx678 {
> > +       struct v4l2_subdev sd;
> > +       struct media_pad pad;
> > +       struct regmap *cci;
> > +
> > +       const struct imx678_model_info *info;
> > +
> > +       struct clk *xclk;
> > +       u32 xclk_freq;
> > +
> > +       /* chosen INCK_SEL register value */
> > +       u8  inck_sel_val;
> > +
> > +       /* Link configurations */
> > +       enum imx678_lanemode lane_mode;
> > +       unsigned long link_freq_bitmap;
> > +
> > +       struct gpio_desc *reset_gpio;
> > +       struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_supply_na=
me)];
> > +
> > +       struct v4l2_ctrl_handler ctrl_handler;
> > +
> > +       /* V4L2 Controls */
> > +       struct v4l2_ctrl *exposure;
> > +       struct v4l2_ctrl *vblank;
> > +       struct v4l2_ctrl *hblank;
> > +
> > +       /* Tracking sensor VMAX/HMAX value */
> > +       u32 vmax;
> > +};
> > +
> > +static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
> > +{
> > +       return container_of(_sd, struct imx678, sd);
>=20
> Use container_of_const.
>=20

Why is that necessary?

> > +}
>=20
> ...
>=20
> > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx678 *imx678 =3D container_of(ctrl->handler, struct im=
x678,
> > +                                            ctrl_handler);
>=20
> Use container_of_const.
>=20
> > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +       const struct v4l2_mbus_framefmt *format;
> > +       struct v4l2_subdev_state *state;
> > +       int rpm_in_use;
> > +       int ret =3D 0;
> > +
> > +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);
> > +       format =3D v4l2_subdev_state_get_format(state, IMX678_SOURCE_PA=
D);
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               u32 current_exposure =3D imx678->exposure->cur.val;
> > +
> > +               imx678->vmax =3D format->height + ctrl->val;
>=20
> ........(1)
>=20
> > +
> > +               current_exposure =3D clamp_t(u32, current_exposure,
> > +                                          IMX678_EXPOSURE_MIN,
> > +                                          imx678->vmax - IMX678_SHR_MI=
N);
> > +               ret =3D __v4l2_ctrl_modify_range(imx678->exposure,
> > +                                              IMX678_EXPOSURE_MIN,
> > +                                              imx678->vmax - IMX678_SH=
R_MIN,
> > +                                              1, current_exposure);
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       /*
> > +        * Applying V4L2 control value only happens when power is up for
> > +        * streaming
> > +        */
> > +       rpm_in_use =3D pm_runtime_get_if_in_use(&client->dev);
> > +       if (!rpm_in_use)
> > +               return 0;
>=20
> As in the last revision, as I suggested before, I will again suggest using
> pm_runtime_get_if_active() here instead of pm_runtime_get_if_in_use().
>=20
> This does not seem to align with the comment above:
> Applying V4L2 control value only happens when power is up for streaming
>=20
> "Power is up" implies that the device is in the runtime PM ACTIVE state,
> rather than simply having a non-zero usage count.
>=20

I agree with the comment being slightly misleading, but same as the last
revision, I still don't fully buy your argument here :-)

In the case you talk about, where PM is ACTIVE but usage count =3D=3D 0, we
anyway know that the count will only increase when .enable_streams is
called, at which point the driver will anyway write *all* the registers
including calling set_ctrl for each control with the cached values.

So why should we do (redundant) writes here?

> I also don't understand why we need to be strict here and require the
> runtime PM usage count to be greater than zero. What matters before acces=
sing
> the hardware registers is that the device is powered and accessible, not
> whether there is an active user holding a runtime PM reference.
>=20
> Anyway, rpm_in_use does not seem necessary here. The check could be simpl=
ified to:
> if (pm_runtime_get_if_active(&client->dev) <=3D 0)

The rpm_in_use value is used below in this function to ensure we don't do
pm_runtime_put() in case of a negative retval. This is not really handled
by most drivers today, but I wanted to fix it here given recent discussion
[1] and annoying Sashiko reports.

[1]: https://lore.kernel.org/all/ahyh0ZlwlZqr7VNa%40kekkonen.localdomain

>=20
> > +
> > +       switch (ctrl->id) {
> > +       case V4L2_CID_VBLANK:
> > +               cci_write(imx678->cci, IMX678_REG_VMAX, imx678->vmax, &=
ret);
> > +               fallthrough; /* SHR =3D VMAX - exposure, so update it */
> > +       case V4L2_CID_EXPOSURE: {
> > +               u32 shr =3D imx678->vmax - imx678->exposure->val;
> > +
> > +               cci_write(imx678->cci, IMX678_REG_SHR, shr, &ret);
> > +               break;
> > +       }
> > +       case V4L2_CID_ANALOGUE_GAIN:
> > +               cci_write(imx678->cci, IMX678_REG_GAIN, ctrl->val, &ret=
);
> > +               break;
> > +       case V4L2_CID_HBLANK: {
> > +               u32 hmax =3D (format->width + ctrl->val) / IMX678_PIX_P=
ER_CLK;
> > +
> > +               cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);
> > +               break;
> > +       }
> > +       case V4L2_CID_TEST_PATTERN: {
> > +               cci_write(imx678->cci, IMX678_REG_TPG_COLORWIDTH,
> > +                         IMX678_TPG_COLORWIDTH_160PIX, &ret);
> > +               cci_write(imx678->cci, IMX678_REG_TPG_PATSEL_DUOUT,
> > +                         imx678_tpg_val[ctrl->val], &ret);
> > +               cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT,
> > +                         (ctrl->val) ? 1 : 0,
> > +                         &ret);
> > +               break;
> > +       }
> > +       case V4L2_CID_HFLIP:
> > +               cci_write(imx678->cci, IMX678_REG_WINMODEH, ctrl->val, =
&ret);
> > +               break;
> > +       case V4L2_CID_VFLIP:
> > +               cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, =
&ret);
> > +               break;
> > +       default:
> > +               dev_warn(&client->dev,
> > +                        "ctrl(id:0x%x,val:0x%x) is not handled\n",
> > +                        ctrl->id, ctrl->val);
> > +               break;
> > +       }
> > +
> > +       if (rpm_in_use > 0)
> > +               pm_runtime_put(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
>=20
> ...
>=20
> > +static int imx678_set_pad_format(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *sd_state,
> > +                                struct v4l2_subdev_format *fmt)
> > +{
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +       struct v4l2_mbus_framefmt *format;
> > +       const struct v4l2_rect *crop;
> > +       int ret =3D 0;
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> > +           v4l2_subdev_is_streaming(sd))
> > +               return -EBUSY;
> > +
> > +       crop =3D v4l2_subdev_state_get_crop(sd_state, fmt->pad);
> > +
> > +       fmt->format.width =3D crop->width;
> > +       fmt->format.height =3D crop->height;
> > +       fmt->format.code =3D imx678_get_format_code(imx678, fmt->format=
.code);
> > +       fmt->format.field =3D V4L2_FIELD_NONE;
> > +       fmt->format.colorspace =3D V4L2_COLORSPACE_RAW;
> > +       fmt->format.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> > +       fmt->format.quantization =3D V4L2_QUANTIZATION_FULL_RANGE;
> > +       fmt->format.xfer_func =3D V4L2_XFER_FUNC_NONE;
> > +
> > +       format =3D v4l2_subdev_state_get_format(sd_state, fmt->pad);
> > +
> > +       if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +               ret =3D imx678_set_framing_limits(imx678, &fmt->format);
> > +
> > +       if (!ret)
> > +               *format =3D fmt->format;
>=20
> Update the ACTIVE format before adjusting the framing controls so that co=
ntrol
> callbacks operate on the correct frame dimensions.
>=20
> Currently, the VBLANK control handler recalculates the exposure limits us=
ing
> the previous height value.
>=20
> You can verify this by adding a debug print at (1) (In imx678_set_ctrl) f=
or format->height.
>=20

Yikes, my bad. I updated this function at the last moment to not mess with
the active format in case set_framing_limit gives an error, but missed that
the active state format is used by s_ctrl.

> For example:
> Streaming is running with a format of 3856 =C3=97 2160.
> Streaming is stopped.
> The media link is reconfigured to 1920 =C3=97 1080.
>=20
> At this point, the ACTIVE format has not yet been updated. As a result, t=
he
> debug print at (1) will still show 2160 instead of 1080.
>=20

Although it shouldn't cause issues as we don't allow changing resolution at
all.. at least not in this patch. I'll still fix it in my branch with crop
and binning support.

I just realized though that we don't need to call set_framing_limits at all
in a fixed-resolution driver. I'll drop it in next revision.

> > +
> > +       return ret;
> > +}
> > +
> > +static int imx678_get_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       switch (sel->target) {
> > +       case V4L2_SEL_TGT_CROP:
> > +               sel->r =3D *v4l2_subdev_state_get_crop(sd_state, sel->p=
ad);
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_NATIVE_SIZE:
> > +               sel->r =3D imx678_native_area;
> > +               return 0;
> > +
> > +       case V4L2_SEL_TGT_CROP_DEFAULT:
> > +       case V4L2_SEL_TGT_CROP_BOUNDS:
> > +               sel->r =3D imx678_active_area;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int imx678_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state)
> > +{
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +       struct v4l2_rect *crop;
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +               .pad =3D IMX678_SOURCE_PAD,
> > +               .format =3D {
> > +                       .code =3D imx678_default_mbus_code(imx678),
> > +                       .width =3D imx678_active_area.width,
> > +                       .height =3D imx678_active_area.height,
> > +               },
> > +       };
> > +
> > +       crop =3D v4l2_subdev_state_get_crop(state, IMX678_SOURCE_PAD);
> > +       *crop =3D imx678_active_area;
> > +       imx678_set_pad_format(sd, state, &fmt);
> > +
> > +       return 0;
>=20
> return imx678_set_pad_format(..).
>=20
> > +}
>=20
> ...
>=20
> > +static int imx678_identify_model(struct imx678 *imx678)
> > +{
> > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +       const struct imx678_model_info *info;
> > +       enum imx678_type detected;
> > +       int ret =3D 0;
> > +       u64 val =3D 0;
>=20
> val =3D 0 initialization is unnecessary, as val is populated by cci_read()
> before it is used.
>=20

Similar to ret, I personally find it easier to read when values that are
used but not explicitly written to within the same function, are
initialized to 0.

> > +
> > +       info =3D device_get_match_data(&client->dev);
> > +
> > +       /*
> > +        * This sensor's ID registers become accessible 80ms after comi=
ng out
> > +        * of STANDBY mode.
> > +        */
> > +       cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
> > +       fsleep(IMX678_MODULE_ID_DELAY);
> > +
> > +       cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
> > +
> > +       if (ret) {
> > +               dev_err(&client->dev,
> > +                       "I2C transaction failed ret =3D %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       if (val !=3D IMX678_ID) {
> > +               dev_err(&client->dev,
> > +                       "Chip ID mismatch: %x!=3D%llx\n", IMX678_ID, va=
l);
> > +               return -ENXIO;
> > +       }
> > +
> > +       cci_read(imx678->cci, IMX678_REG_MONOCHROME, &val, &ret);
> > +
> > +       if (ret) {
> > +               dev_err(&client->dev,
> > +                       "I2C transaction failed ret =3D %d\n", ret);
> > +               return ret;
> > +       }
> > +
> > +       detected =3D val & IMX678_TYPE;
> > +
> > +       /* Prefer to use sensor type specified in device tree */
> > +       if (info) {
> > +               imx678->info =3D info;
> > +               if (detected !=3D info->type)
> > +                       dev_err(&client->dev,
> > +                               "detected %s sensor, DT specifies %s; u=
sing DT value\n",
> > +                               detected =3D=3D IMX678_COLOR ? "color" =
: "mono",
> > +                               info->type =3D=3D IMX678_COLOR ? "color=
" : "mono");
> > +       } else {
> > +               imx678->info =3D detected =3D=3D IMX678_MONOCHROME ?
> > +                              &imx678_aamr_info : &imx678_aaqr_info;
> > +               dev_info(&client->dev,
> > +                        "sensor type missing in DT; detected %s sensor=
\n",
> > +                        detected =3D=3D IMX678_MONOCHROME ? "mono" : "=
color");
> > +       }
> > +
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +static int imx678_probe(struct i2c_client *client)
> > +{
> > +       struct device *dev =3D &client->dev;
> > +       struct imx678 *imx678;
> > +       int ret, i;
> > +
> > +       imx678 =3D devm_kzalloc(&client->dev, sizeof(*imx678), GFP_KERN=
EL);
> > +       if (!imx678)
> > +               return -ENOMEM;
> > +
> > +       v4l2_i2c_subdev_init(&imx678->sd, client, &imx678_subdev_ops);
> > +
> > +       imx678->cci =3D devm_cci_regmap_init_i2c(client, 16);
> > +       if (IS_ERR(imx678->cci))
> > +               return dev_err_probe(dev, PTR_ERR(imx678->cci),
> > +                                    "failed to init CCI\n");
> > +
> > +       if (imx678_check_hwcfg(dev, imx678))
> > +               return -EINVAL;
> > +
> > +       imx678->xclk =3D devm_v4l2_sensor_clk_get(dev, NULL);
> > +       if (IS_ERR(imx678->xclk))
> > +               return dev_err_probe(dev, PTR_ERR(imx678->xclk),
> > +                                    "failed to get xclk\n");
> > +
> > +       imx678->xclk_freq =3D clk_get_rate(imx678->xclk);
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(imx678_inck_table); ++i) {
> > +               if (imx678_inck_table[i].xclk_hz =3D=3D imx678->xclk_fr=
eq) {
> > +                       imx678->inck_sel_val =3D imx678_inck_table[i].i=
nck_sel;
> > +                       break;
> > +               }
> > +       }
> > +
> > +       if (i =3D=3D ARRAY_SIZE(imx678_inck_table))
> > +               return dev_err_probe(dev, -EINVAL,
> > +                                    "unsupported XCLK rate %u Hz\n",
> > +                                    imx678->xclk_freq);
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(imx678_supply_name); i++)
> > +               imx678->supplies[i].supply =3D imx678_supply_name[i];
> > +
> > +       ret =3D devm_regulator_bulk_get(&client->dev,
> > +                                     ARRAY_SIZE(imx678_supply_name),
> > +                                     imx678->supplies);
> > +       if (ret)
> > +               return dev_err_probe(dev, ret, "failed to get regulator=
s\n");
> > +
> > +       imx678->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > +                                                    GPIOD_OUT_HIGH);
> > +       if (IS_ERR(imx678->reset_gpio))
> > +               return dev_err_probe(dev, PTR_ERR(imx678->reset_gpio),
> > +                                    "failed to get reset GPIO\n");
> > +
> > +       ret =3D imx678_power_on(dev);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D imx678_identify_model(imx678);
> > +       if (ret)
> > +               goto error_power_off;
> > +
> > +       pm_runtime_set_active(dev);
> > +       pm_runtime_enable(dev);
> > +
> > +       ret =3D imx678_init_controls(imx678);
> > +       if (ret)
> > +               goto error_pm_runtime;
> > +
> > +       imx678->sd.internal_ops =3D &imx678_internal_ops;
> > +       imx678->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> > +                               V4L2_SUBDEV_FL_HAS_EVENTS;
>=20
> Drop V4L2_SUBDEV_FL_HAS_EVENTS flag.
>=20

Ack.

[snip]

Thanks,
    Jai

