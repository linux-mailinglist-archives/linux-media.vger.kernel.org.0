Return-Path: <linux-media+bounces-62720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGE9KyJXFGrxMgcAu9opvQ
	(envelope-from <linux-media+bounces-62720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 16:05:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0408F5CB874
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 16:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D50F3082E4D
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 13:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D449388E66;
	Mon, 25 May 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GV68ruIQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3A386C20;
	Mon, 25 May 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779717518; cv=none; b=hRv+BGaz9qyUWd8kKdgjbkkAcIX5I3X2QvJQyQAIVN/Md6mpB/1YFarKd3s0LvezqyAxKchb2n8yh8U8EgtclvpSW+ldDr9D2JJbGOARS9wR3nF4mDFeL4PxBYL824viV91tyPZlYbBb5gnXvTcdF7ju7LM2lz0Zgf8CTSNx2hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779717518; c=relaxed/simple;
	bh=6LsufyGBZ63p+fsFQNTSEHnU/iHrHtNm41I4QASENBg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FMY6TQ+caYod7/ODPJ9bUHkXb1hEE8Gpjn6B2XcnRhGkshmiOng75XEPY7Bzkk7Pgav9YaC12VuJGiNtpKRP8FSVghDwMsA4RCeoDWvhBw9vqhQksDMzWb4kgmMLay89RKUyI0kfMSqtGgW4XRuEmi1SB7XqJLt+vEJ/ZIY2KOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GV68ruIQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:ad48:920a:da6f:a034])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57A907FA;
	Mon, 25 May 2026 15:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779717489;
	bh=6LsufyGBZ63p+fsFQNTSEHnU/iHrHtNm41I4QASENBg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GV68ruIQd+gHighQ561LLSyz8dbOQhUt35K0NGMZYsUsyFGUi1gHKLrx5j8RMgoON
	 05A+clgp12Z6fnHiDaCvlnFMifEbiU0APY2eaBcje9/fnw3feZax5EL+SOSJYWJbYb
	 3Rr5merWgy6MZ5gSrR9fVObA+n3DOAbBQbsJoKeY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PN3P287MB1829DE5A82688FB30D1AA28A8B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260520-imx678-v3-0-8b5f9676486e@ideasonboard.com> <20260520-imx678-v3-2-8b5f9676486e@ideasonboard.com> <PN3P287MB1829DE5A82688FB30D1AA28A8B0F2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [PATCH v3 2/2] media: i2c: imx678: Add driver for Sony IMX678
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, Ryuichi Tadano <Ryuichi.Tadano@sony.com>, Kengo Hayasaka <Kengo.Hayasaka@sony.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Tarang Raval <tarang.raval@siliconsignals.io>
Date: Mon, 25 May 2026 15:58:20 +0200
Message-ID: <177971750040.2341049.6027802052267528675@selene>
User-Agent: alot/0.12.dev70+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62720-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[soho-enterprise.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:email,ideasonboard.com:dkim,willwhang.com:email]
X-Rspamd-Queue-Id: 0408F5CB874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Tarang,

Quoting Tarang Raval (2026-05-22 19:01:01)
> Hi Jai,
>=20
> I noticed a few issues and also have one question. Could you please help =
me
> understand that part?
>=20
> Please check the comments below.
>=20
> > Add a V4L2 subdev driver for the Sony IMX678 image sensor.
> >
> > IMX678 is a diagonal 8.86 mm (Type 1/1.8) CMOS active pixel type
> > solid-state image sensor with a square pixel array and 8.40 M effective
> > pixels.
> >
> > The following features are supported by the driver:
> > - Monochrome and Color (Bayer filter) variants
> > - Multiple input clock frequencies supported
> > - Multiple link frequencies supported
> > - VBLANK and HBLANK control for variable framerate
> > - Freely configurable crop rectangle through S_SELECTION ioctl
> > - Configurable resolution with 2x2 binning (for the current crop)
> >   through S_FMT ioctl
> > - VFLIP and HFLIP control for flipping readout
> > - Test pattern control support
> > - Exposure and gain control
> > - MIPI RAW12 output
> >
> > Following features are not currently supported but may be added later:
> > - Pixel-perfect crop reporting, account for the shift-by-1 when flipping
> >   using HFLIP/VFLIP, which maintains the bayer readout order
> > - Increased framerate (lower HMAX/VMAX) when cropping
> > - MIPI RAW10 output mode
> > - Embedded data stream
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
>=20
> ...
>=20
> > +#define IMX678_REG_INCK_SEL             CCI_REG8(0x3014)
> > +
> > +/* Link Speed */
> > +#define IMX678_REG_DATARATE_SEL         CCI_REG8(0x3015)
> > +
> > +/* Lane Count */
> > +#define IMX678_REG_LANEMODE             CCI_REG8(0x3040)
> > +
> > +/*
> > + * The internal readout clock runs at 74.25 Hz. In one cycle the AD re=
ads 8
>=20
> I think it's 74.25 MHz.

Argh, yes.

>=20
> > + * pixels, thus giving us a rate of 74.25 * 8 =3D 594 MPix/s
> > + */
> > +#define IMX678_PIXEL_RATE              594000000
> > +#define IMX678_PIX_PER_CLK             8
> > +
> > +/* VMAX - Frame Length in Lines */
> > +#define IMX678_REG_VMAX                 CCI_REG24_LE(0x3028)
> > +#define IMX678_VMAX_MAX                 0xfffff
> > +#define IMX678_VMAX_DEFAULT             2250
>=20
> ...
>=20
> > +static const int imx678_tpg_val[] =3D {
> > +       IMX678_TPG_ALL_000,
> > +       IMX678_TPG_ALL_000,
> > +       IMX678_TPG_ALL_FFF,
> > +       IMX678_TPG_ALL_555,
> > +       IMX678_TPG_ALL_AAA,
> > +       IMX678_TPG_TOG_555_AAA,
> > +       IMX678_TPG_TOG_AAA_555,
> > +       IMX678_TPG_TOG_000_555,
> > +       IMX678_TPG_TOG_555_000,
> > +       IMX678_TPG_TOG_000_FFF,
> > +       IMX678_TPG_TOG_FFF_000,
> > +       IMX678_TPG_H_COLOR_BARS,
> > +       IMX678_TPG_V_COLOR_BARS,
> > +};
> > +
> > +/* IMX678 Register List */
> > +/* Common Modes */
>=20
> You can remove these comments or keep only one of them.
>=20
> > +static const struct cci_reg_sequence common_regs[] =3D {
> > +       {IMX678_REG_THIN_V_EN, 0x00},
> > +       {IMX678_REG_VCMODE, 0x01},
> > +       {CCI_REG8(0x306B), 0x00},
> > +       {IMX678_REG_GAIN_PGC_FIDMD, 0x01},
> > +       {CCI_REG8(0x3460), 0x22},
> > +       {CCI_REG8(0x355A), 0x64},
>=20
> ...
>=20
> > +static void imx678_set_framing_limits(struct imx678 *imx678,
> > +                                     struct v4l2_subdev_state *state)
> > +{
> > +       const struct v4l2_mbus_framefmt *format =3D imx678_state_format=
(state);
> > +       s64 min_hblank, default_hblank, max_hblank, vblank;
> > +       const u32 hmax_4lane =3D min_hmax_4lane[__ffs(imx678->link_freq=
_bitmap)];
> > +       const u32 lane_scale =3D imx678->lane_mode =3D=3D IMX678_LANEMO=
DE_2L ? 2 : 1;
> > +       const bool binning =3D imx678_state_binning(state);
> > +       const u8 bpp =3D binning ? 10 : 12;
> > +       u32 hmax, min_hmax;
> > +
> > +       imx678->vmax =3D IMX678_VMAX_DEFAULT;
> > +       hmax =3D hmax_4lane * lane_scale;
> > +
> > +       /* HMAX can go lower when using 10bit AD for binning */
> > +       min_hmax =3D (hmax * bpp) / 12;
> > +       min_hblank =3D min_hmax * IMX678_PIX_PER_CLK - format->width;
> > +       default_hblank =3D hmax * IMX678_PIX_PER_CLK - format->width;
> > +       max_hblank =3D IMX678_HMAX_MAX * IMX678_PIX_PER_CLK - format->w=
idth;
> > +
> > +       __v4l2_ctrl_modify_range(imx678->hblank, min_hblank, max_hblank,
> > +                                IMX678_PIX_PER_CLK, default_hblank);
> > +       __v4l2_ctrl_s_ctrl(imx678->hblank, default_hblank);
> > +
> > +       vblank =3D imx678->vmax - format->height;
> > +       __v4l2_ctrl_modify_range(imx678->vblank, vblank,
> > +                                IMX678_VMAX_MAX - format->height, 2, v=
blank);
> > +       __v4l2_ctrl_s_ctrl(imx678->vblank, IMX678_VMAX_DEFAULT - format=
->height);
> > +
> > +       __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOSURE_MIN,
> > +                                imx678->vmax - IMX678_SHR_MIN, 1,
> > +                                IMX678_EXPOSURE_DEFAULT);
>=20
> This control operation can fail, so please check the error value.
>=20
> Also, return the error by changing the return type accordingly.
>=20

Ack.

> > +}
> > +
> > +static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +       struct imx678 *imx678 =3D container_of(ctrl->handler, struct im=
x678, ctrl_handler);
> > +       struct v4l2_subdev_state *state;
> > +       struct i2c_client *client =3D v4l2_get_subdevdata(&imx678->sd);
> > +       const struct v4l2_mbus_framefmt *format;
> > +       int ret =3D 0;
> > +
> > +       state =3D v4l2_subdev_get_locked_active_state(&imx678->sd);
> > +       format =3D imx678_state_format(state);
> > +
> > +       if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +               u32 current_exposure =3D imx678->exposure->cur.val;
> > +
> > +               imx678->vmax =3D format->height + ctrl->val;
> > +
> > +               current_exposure =3D clamp_t(u32, current_exposure, IMX=
678_EXPOSURE_MIN,
> > +                                          imx678->vmax - IMX678_SHR_MI=
N);
> > +               __v4l2_ctrl_modify_range(imx678->exposure, IMX678_EXPOS=
URE_MIN,
> > +                                        imx678->vmax - IMX678_SHR_MIN,=
 1,
> > +                                        current_exposure);
>=20
> Same here, please check the error value.

Ack.

>=20
> > +       }
> > +
> > +       /*
> > +        * Applying V4L2 control value only happens
> > +        * when power is up for streaming
> > +        */
> > +       if (pm_runtime_get_if_in_use(&client->dev) =3D=3D 0)
>=20
> Use pm_runtime_get_if_active.
>=20

We anyway write all control values everytime in enable_streams(), so I
think it's okay to keep this check a bit strict and skip the writes if the
sensor is RPM_ACTIVE with 0 users. (i.e. streaming has stopped, but device
not suspended yet, which is unlikely given we don't have an autosuspend
timer but suspend immediately here)

Unless of course I misunderstood why you're suggesting it?

> > +               return 0;
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
> > +               cci_write(imx678->cci, IMX678_REG_ANALOG_GAIN, ctrl->va=
l, &ret);
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
> > +               cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT, (ctrl->=
val) ? 1 : 0,
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
> > +       pm_runtime_put(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops imx678_ctrl_ops =3D {
> > +       .s_ctrl =3D imx678_set_ctrl,
> > +};
>=20
> ...
>=20
> > +static int imx678_set_selection(struct v4l2_subdev *sd,
> > +                               struct v4l2_subdev_state *sd_state,
> > +                               struct v4l2_subdev_selection *sel)
> > +{
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +       struct v4l2_rect *crop;
> > +       struct v4l2_rect rect;
> > +
> > +       if (sel->target !=3D V4L2_SEL_TGT_CROP || sel->pad !=3D 0)
> > +               return -EINVAL;
> > +
> > +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE &&
> > +           v4l2_subdev_is_streaming(sd))
> > +               return -EBUSY;
> > +
> > +       /* Align left, top to 4 */
> > +       rect.left =3D clamp_t(s32, ALIGN(sel->r.left, IMX678_CROP_HST_A=
LIGN),
> > +                           imx678_active_area.left,
> > +                           imx678_active_area.width - IMX678_PIXEL_ARR=
AY_MIN_WIDTH);
>=20
> You are ignoring the active_area offset here; please correct it.
>=20
> In imx296, crop bounds start at (0, 0), so no offset handling is needed t=
here.
>=20
> You can refer to my patch:
> https://lore.kernel.org/linux-media/20260424092554.26130-4-elgin.perumbil=
ly@siliconsignals.io/#t
>=20

Ah good catch, will fix.

> > +       rect.top =3D clamp_t(s32, ALIGN(sel->r.top, IMX678_CROP_VST_ALI=
GN),
> > +                          imx678_active_area.top,
> > +                          imx678_active_area.height - IMX678_PIXEL_ARR=
AY_MIN_HEIGHT);
> > +       /* Align width to 16 and height to 4 */
> > +       rect.width =3D clamp_t(u32, ALIGN(sel->r.width, IMX678_CROP_HWI=
DTH_ALIGN),
> > +                            IMX678_PIXEL_ARRAY_MIN_WIDTH, imx678_activ=
e_area.width);
> > +       rect.height =3D clamp_t(u32, ALIGN(sel->r.height, IMX678_CROP_V=
WIDTH_ALIGN),
> > +                             IMX678_PIXEL_ARRAY_MIN_HEIGHT, imx678_act=
ive_area.height);
> > +
> > +       rect.width =3D min_t(u32, rect.width, imx678_native_area.width =
- rect.left);
> > +       rect.height =3D min_t(u32, rect.height, imx678_native_area.heig=
ht - rect.top);
> > +
> > +       crop =3D v4l2_subdev_state_get_crop(sd_state, sel->pad);
> > +
> > +       if (rect.width !=3D crop->width || rect.height !=3D crop->heigh=
t) {
> > +               struct v4l2_mbus_framefmt *format =3D
> > +                       v4l2_subdev_state_get_format(sd_state, sel->pad=
);
> > +               format->width =3D rect.width;
> > +               format->height =3D rect.height;
>=20
> Why are we not checking here whether binning mode is currently enabled?
>=20
> Suppose binning mode is enabled, and then userspace changes the crop.
>=20
> With the below lines:
>=20
> format->width =3D rect.width;
> format->height =3D rect.height;
>=20
> the format size becomes equal to the crop size, which silently disables b=
inning.

This was intentional.

Let's say I'm streaming in 640x480 binned mode (1280x960 crop) and want to
switch to 3200x1600, I prefer if a single S_SELECTION call with 3200x1600
crop size to do that directly.

On the other hand, if I modify just the (top, left) of my crop without
changing its size (1280x960), I want it to stay in the binned mode and not
snap back the active format to full size.

This is a matter of opinion though, which I hope would become irrelevant
once we move to the new raw sensor model with explicit controls for
binning. I plan to look into it before I post a v4, as Sakari suggested in
his review.

>=20
> Am I missing something here?
>=20
> > +       }
> > +
> > +       *crop =3D rect;
> > +       sel->r =3D *crop;
> > +
> > +       if (sel->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> > +               imx678_set_framing_limits(imx678, sd_state);
> > +
> > +       return 0;
> > +}
> > +
> > +static int imx678_init_state(struct v4l2_subdev *sd,
> > +                            struct v4l2_subdev_state *state)
> > +{
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +       struct v4l2_subdev_selection sel =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +               .target =3D V4L2_SEL_TGT_CROP,
> > +               .r =3D imx678_active_area,
> > +       };
> > +       struct v4l2_subdev_format fmt =3D {
> > +               .which =3D V4L2_SUBDEV_FORMAT_TRY,
> > +               .pad =3D 0,
> > +               .format =3D {
> > +                       .code =3D imx678_default_mbus_code(imx678),
> > +                       .width =3D imx678_active_area.width,
> > +                       .height =3D imx678_active_area.height,
> > +               },
> > +       };
> > +
> > +       imx678_set_selection(sd, state, &sel);
> > +       imx678_set_pad_format(sd, state, &fmt);
> > +
> > +       return 0;
> > +}
>=20
> ...
>=20
> > +static int imx678_enable_streams(struct v4l2_subdev *sd,
> > +                                struct v4l2_subdev_state *state, u32 p=
ad,
> > +                                u64 mask)
> > +{
> > +       struct i2c_client *client =3D v4l2_get_subdevdata(sd);
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +       const struct v4l2_rect *crop =3D imx678_state_crop(state);
> > +       const bool binning =3D imx678_state_binning(state);
> > +       int ret =3D 0;
>=20
> You can omit the initialization here.
>=20
> > +
> > +       ret =3D pm_runtime_resume_and_get(&client->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       ret =3D imx678_program_window(imx678, crop, binning);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s failed to set mode\n", __func=
__);
> > +               goto err_rpm_put;
> > +       }
> > +
> > +       ret =3D __v4l2_ctrl_handler_setup(imx678->sd.ctrl_handler);
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s failed to apply user values\n=
", __func__);
> > +               goto err_rpm_put;
> > +       }
> > +
> > +       cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STRE=
AMING, &ret);
> > +       usleep_range(IMX678_STREAM_DELAY_US, IMX678_STREAM_DELAY_US +
> > +                    IMX678_STREAM_DELAY_RANGE_US);
> > +       cci_write(imx678->cci, IMX678_REG_XMSTA, 0x00, &ret);
> > +
> > +       if (ret) {
> > +               dev_err(&client->dev, "%s failed to start streaming\n",=
 __func__);
> > +               goto err_rpm_put;
> > +       }
> > +
> > +       return 0;
> > +
> > +err_rpm_put:
> > +       pm_runtime_put(&client->dev);
> > +
> > +       return ret;
> > +}
>=20
> ...
>=20
> > +static const struct v4l2_subdev_core_ops imx678_core_ops =3D {
> > +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> > +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > +};
>=20
> Drop this
>=20
> See: https://lore.kernel.org/linux-media/20241029162106.3005800-1-tomm.me=
rciai@gmail.com/
>=20

Ack.

> > +static const struct v4l2_subdev_video_ops imx678_video_ops =3D {
> > +       .s_stream =3D v4l2_subdev_s_stream_helper,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops imx678_pad_ops =3D {
> > +       .enum_mbus_code =3D imx678_enum_mbus_code,
> > +       .get_fmt =3D v4l2_subdev_get_fmt,
> > +       .set_fmt =3D imx678_set_pad_format,
> > +       .get_selection =3D imx678_get_selection,
> > +       .set_selection =3D imx678_set_selection,
> > +       .enum_frame_size =3D imx678_enum_frame_size,
> > +       .enable_streams =3D imx678_enable_streams,
> > +       .disable_streams =3D imx678_disable_streams,
> > +};
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
> > +       ret =3D imx678_get_regulators(imx678);
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
> > +       imx678->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +       imx678->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +       ret =3D media_entity_pads_init(&imx678->sd.entity, 1, &imx678->=
pad);
> > +       if (ret) {
> > +               dev_err(dev, "failed to init entity pads: %d\n", ret);
>=20
> Use dev_err_probe.
>=20
> > +               goto error_handler_free;
> > +       }
> > +
> > +       imx678->sd.state_lock =3D imx678->ctrl_handler.lock;
> > +       ret =3D v4l2_subdev_init_finalize(&imx678->sd);
> > +       if (ret < 0) {
> > +               dev_err(dev, "subdev init error\n");
>=20
> Use dev_err_probe.
>=20
> > +               goto error_media_entity;
> > +       }
> > +
> > +       ret =3D v4l2_async_register_subdev_sensor(&imx678->sd);
> > +       if (ret < 0) {
> > +               dev_err(dev, "failed to register sensor sub-device: %d\=
n", ret);
>=20
> Use dev_err_probe.
>=20

Ack.

Thanks,
    Jai

> > +               goto error_subdev_cleanup;
> > +       }
> > +
> > +       pm_runtime_idle(dev);
> > +
> > +       return 0;
> > +
> > +error_subdev_cleanup:
> > +       v4l2_subdev_cleanup(&imx678->sd);
> > +
> > +error_media_entity:
> > +       media_entity_cleanup(&imx678->sd.entity);
> > +
> > +error_handler_free:
> > +       imx678_free_controls(imx678);
> > +
> > +error_pm_runtime:
> > +       pm_runtime_disable(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +
> > +error_power_off:
> > +       imx678_power_off(&client->dev);
> > +
> > +       return ret;
> > +}
> > +
> > +static void imx678_remove(struct i2c_client *client)
> > +{
> > +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +       struct imx678 *imx678 =3D to_imx678(sd);
> > +
> > +       v4l2_async_unregister_subdev(sd);
> > +       v4l2_subdev_cleanup(sd);
> > +       media_entity_cleanup(&sd->entity);
> > +       imx678_free_controls(imx678);
> > +
> > +       pm_runtime_disable(&client->dev);
> > +       if (!pm_runtime_status_suspended(&client->dev))
> > +               imx678_power_off(&client->dev);
> > +       pm_runtime_set_suspended(&client->dev);
> > +}
> > +
> > +static const struct dev_pm_ops imx678_pm_ops =3D {
> > +       SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)
> > +};
> > +
> > +static const struct of_device_id imx678_of_match[] =3D {
> > +       { .compatible =3D "sony,imx678" },
> > +       { .compatible =3D "sony,imx678-aamr", .data =3D &imx678_aamr_in=
fo },
> > +       { .compatible =3D "sony,imx678-aaqr", .data =3D &imx678_aaqr_in=
fo },
> > +       { /* sentinel */ }
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, imx678_of_match);
> > +
> > +static struct i2c_driver imx678_i2c_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "imx678",
> > +               .of_match_table =3D imx678_of_match,
> > +               .pm =3D &imx678_pm_ops,
> > +       },
> > +       .probe =3D imx678_probe,
> > +       .remove =3D imx678_remove,
> > +};
> > +
> > +module_i2c_driver(imx678_i2c_driver);
> > +
> > +MODULE_AUTHOR("Will Whang <will@willwhang.com>");
> > +MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");
> > +MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");
> > +MODULE_DESCRIPTION("Sony imx678 sensor driver");
> > +MODULE_LICENSE("GPL");
> >
> > --
> > 2.54.0
>=20
> Best Regards,
> Tarang

