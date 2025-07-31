Return-Path: <linux-media+bounces-38699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02889B171B2
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 15:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6210E1AA716B
	for <lists+linux-media@lfdr.de>; Thu, 31 Jul 2025 13:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A713B2C17B4;
	Thu, 31 Jul 2025 13:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkLtsn1X"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08D22F740;
	Thu, 31 Jul 2025 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753966941; cv=none; b=tJE5sbhH+Zv6H0EqXDVow0iLrF1NlPgI0GN1SECCE42DPaYzhjWUCM4RkFtCTyGkAGOWNZsNTqwG6oJS4h7n64L27ZOPQpCLdgK1JPuzBZN5AnmHj/AGpub3X2Nr+EUWBusnMOqp7jqJpjYSA5ENdK2DF0Ttt6jpP9+mlluWEMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753966941; c=relaxed/simple;
	bh=sXCFfXbm6O5tuIal8IXKxy7djf+JyRFJi3GiJv2PHII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av83Ca8PDxobzODQAAFx04mGJqCJe2hAH4dU8mmlOLuOu7Vq2n0qTba08p/JdpsLc57y/g+Rr1wWamnhFTjD8m1aUYwP3WwSeL0ZdQarikEjmzZ46MYTvYbxGTIAFsXA0RJ38y6poFRj56xfQ/JrBjgi0/n50Fg+xJokVdKibWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkLtsn1X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CC4C4CEEF;
	Thu, 31 Jul 2025 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753966940;
	bh=sXCFfXbm6O5tuIal8IXKxy7djf+JyRFJi3GiJv2PHII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkLtsn1XoqVro+aaKJ3Mdi+cKq2o9uke1yf9twYRL3II/E7pbTXrIrYzy2//8ezXn
	 wBWnImp5RrnaYbES6icKJBh4GR/DSOvvQjmiUeMsyoMGkWrBDsEuFP882pqQ4VctET
	 w4rokUEvLjdcShahT4Iw5wexo7mbYVBRTLghwT+c0HR6Gs43kd2Rh8ijxGMMvlHNGn
	 LKvqadcNPKl1DCPY5SNGD4A800gtybPKyawE3mY/mu++P1V8x/GjMCaqcpBWSsqsbz
	 xGA7cxKk9aoA9yCciMDQY+rzJh6HhjRLQWSbXbI2U+uj56iBAGfyqr/4tvvQTO7J/U
	 p/sM4yMAjJHMw==
Date: Thu, 31 Jul 2025 15:02:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mats Randgaard <matrandg@cisco.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
Message-ID: <20250731-eggplant-oarfish-of-patience-e6e65a@houat>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
 <20250612-csi-bgr-rgb-v1-3-dc8a309118f8@kernel.org>
 <CAPY8ntCYG8ufxpMkgBj1ZpSW-H2HObpcbQNg9tj+EXUM4PGkfQ@mail.gmail.com>
 <e9b61666-6bf0-4ec2-8524-0b6d94f028ef@jjverkuil.nl>
 <20250618-dancing-rare-skua-eb7ffd@houat>
 <20250731-teal-oryx-of-shopping-ced228@houat>
 <fd856b59-8a08-4900-96aa-b8fa51a7f5e1@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zcpujofsd3ktx3m5"
Content-Disposition: inline
In-Reply-To: <fd856b59-8a08-4900-96aa-b8fa51a7f5e1@xs4all.nl>


--zcpujofsd3ktx3m5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] media: tc358743: Fix the RGB MBUS format
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 12:38:00PM +0200, Hans Verkuil wrote:
> On 31/07/2025 12:14, Maxime Ripard wrote:
> > Hi Hans,
> >=20
> > On Wed, Jun 18, 2025 at 04:54:07PM +0200, Maxime Ripard wrote:
> >> On Mon, Jun 16, 2025 at 10:02:17AM +0200, Hans Verkuil wrote:
> >>> On 12/06/2025 19:01, Dave Stevenson wrote:
> >>>> On Thu, 12 Jun 2025 at 13:54, Maxime Ripard <mripard@kernel.org> wro=
te:
> >>>>>
> >>>>> The tc358743 is an HDMI to MIPI-CSI2 bridge. It supports two of the
> >>>>> three HDMI 1.4 video formats: RGB 4:4:4 and YCbCr 422.
> >>>>>
> >>>>> RGB 4:4:4 is converted to the MIPI-CSI2 RGB888 video format, and li=
sted
> >>>>> in the driver as MEDIA_BUS_FMT_RGB888_1X24.
> >>>>>
> >>>>> Most CSI2 receiver drivers then map MEDIA_BUS_FMT_RGB888_1X24 to
> >>>>> V4L2_PIX_FMT_RGB24.
> >>>>>
> >>>>> However, V4L2_PIX_FMT_RGB24 is defined as having its color componen=
ts in
> >>>>> the R, G and B order, from left to right. MIPI-CSI2 however defines=
 the
> >>>>> RGB888 format with blue first.
> >>>>>
> >>>>> This essentially means that the R and B will be swapped compared to=
 what
> >>>>> V4L2_PIX_FMT_RGB24 defines.
> >>>>>
> >>>>> The proper MBUS format would be BGR888, so let's use that.
> >>>>
> >>>> I know where you're coming from, but this driver has been in the tree
> >>>> since 2015, so there is a reasonable expectation of users. I've had =
an
> >>>> overlay for it in our kernel tree since 4.14 (July 2018), and I know
> >>>> of at least PiKVM [1] as a product based on it. I don't know if Cisco
> >>>> are still supporting devices with it in.
> >>>
> >>> Those are all EOL, so no need to be concerned about that.
> >>>
> >>> But it is the most commonly used HDMI-to-CSI bridge, so breaking uAPI=
 is
> >>> a real concern.
> >>
> >> Is it really broken?
> >>
> >> Discussing it with Laurent and Sakari last week, we couldn't find any
> >> example of a userspace where the media format was set in stone and not
> >> propagated across the pipeline.
> >>
> >> The uAPI however is *definitely* broken with unicam right now.
> >>
> >>> See more in my review comment in the code below.
> >>>
> >>>> Whilst the pixel format may now be considered to be incorrect,
> >>>> changing it will break userspace applications that have been using it
> >>>> for those 10 years if they're explicitly looking for
> >>>> MEDIA_BUS_FMT_RGB888_1X24 or the mapping of it through to
> >>>> V4L2_PIX_FMT_RGB24.
> >>>> The kernel docs at [2] quote Linus as saying
> >>>> "If you break existing user space setups THAT IS A REGRESSION.
> >>>> It's not ok to say "but we'll fix the user space setup"
> >>>> Really. NOT OK."
> >>>>
> >>>> I'm thinking of GStreamer if the format has been specified explicitly
> >>>> - it'll fail to negotiate due to v4l2src saying it can't handle the
> >>>> caps.
> >>>>
> >>>> Yes it sucks as a situation, but I'm not sure what the best solution
> >>>> is. Potentially accepting both MEDIA_BUS_FMT_RGB888_1X24 and
> >>>> MEDIA_BUS_FMT_BGR888_1X24 as valid MBUS codes for RGB, alongside
> >>>> MEDIA_BUS_FMT_UYVY8_1X16 for UYVY?
> >>>>
> >>>>   Dave
> >>>>
> >>>> [1] https://pikvm.org/
> >>>> [2] https://www.kernel.org/doc/html/latest/process/handling-regressi=
ons.html#quotes-from-linus-about-regression
> >>>>
> >>>>> Fixes: d32d98642de6 ("[media] Driver for Toshiba TC358743 HDMI to C=
SI-2 bridge")
> >>>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >>>>> ---
> >>>>>  drivers/media/i2c/tc358743.c | 10 +++++-----
> >>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358=
743.c
> >>>>> index ca0b0b9bda1755313f066ba36ab218873b9ae438..a1c164a7716a10b0cb9=
ff38f88c0513b45f24771 100644
> >>>>> --- a/drivers/media/i2c/tc358743.c
> >>>>> +++ b/drivers/media/i2c/tc358743.c
> >>>>> @@ -688,11 +688,11 @@ static void tc358743_set_csi_color_space(stru=
ct v4l2_subdev *sd)
> >>>>>                 mutex_lock(&state->confctl_mutex);
> >>>>>                 i2c_wr16_and_or(sd, CONFCTL, ~MASK_YCBCRFMT,
> >>>>>                                 MASK_YCBCRFMT_422_8_BIT);
> >>>>>                 mutex_unlock(&state->confctl_mutex);
> >>>>>                 break;
> >>>>> -       case MEDIA_BUS_FMT_RGB888_1X24:
> >>>>> +       case MEDIA_BUS_FMT_BGR888_1X24:
> >>>>>                 v4l2_dbg(2, debug, sd, "%s: RGB 888 24-bit\n", __fu=
nc__);
> >>>>>                 i2c_wr8_and_or(sd, VOUT_SET2,
> >>>>>                                 ~(MASK_SEL422 | MASK_VOUT_422FIL_10=
0) & 0xff,
> >>>>>                                 0x00);
> >>>>>                 i2c_wr8_and_or(sd, VI_REP, ~MASK_VOUT_COLOR_SEL & 0=
xff,
> >>>>> @@ -1353,11 +1353,11 @@ static int tc358743_log_status(struct v4l2_=
subdev *sd)
> >>>>>                         (i2c_rd16(sd, CSI_STATUS) & MASK_S_HLT) ?
> >>>>>                         "yes" : "no");
> >>>>>         v4l2_info(sd, "Color space: %s\n",
> >>>>>                         state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_U=
YVY8_1X16 ?
> >>>>>                         "YCbCr 422 16-bit" :
> >>>>> -                       state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_R=
GB888_1X24 ?
> >>>>> +                       state->mbus_fmt_code =3D=3D MEDIA_BUS_FMT_B=
GR888_1X24 ?
> >>>>>                         "RGB 888 24-bit" : "Unsupported");
> >>>>>
> >>>>>         v4l2_info(sd, "-----%s status-----\n", is_hdmi(sd) ? "HDMI"=
 : "DVI-D");
> >>>>>         v4l2_info(sd, "HDCP encrypted content: %s\n",
> >>>>>                         hdmi_sys_status & MASK_S_HDCP ? "yes" : "no=
");
> >>>>> @@ -1691,11 +1691,11 @@ static int tc358743_enum_mbus_code(struct v=
4l2_subdev *sd,
> >>>>>                 struct v4l2_subdev_state *sd_state,
> >>>>>                 struct v4l2_subdev_mbus_code_enum *code)
> >>>>>  {
> >>>>>         switch (code->index) {
> >>>>>         case 0:
> >>>>> -               code->code =3D MEDIA_BUS_FMT_RGB888_1X24;
> >>>>> +               code->code =3D MEDIA_BUS_FMT_BGR888_1X24;
> >>>
> >>> So would this change break or fix the formats[] table in:
> >>>
> >>> drivers/media/platform/raspberrypi/rp1-cfe/cfe-fmts.h
> >>
> >> It's pretty much the same table than unicam, and I don't believe it
> >> does. For both those drivers the pixels are stored in memory in the CSI
> >> wire order, so the proper format to use is BGR24 for CSI, not RGB24.
> >>
> >>> Are there other bridge drivers that misinterpret MEDIA_BUS_FMT_RGB888=
_1X24
> >>> and/or MEDIA_BUS_FMT_RGB888_1X24?
> >>
> >> Yes, it's kind of a mess.
> >>
> >> adv748x, ds90ub960 and tc358743 report RGB888, and ov5640 reports
> >> BGR888.
> >>
> >> Then we have alvium CSI2 that supports both, and can swap color
> >> components, so that one isn't a concern.
> >>
> >> And finally, we have st-mipid02 which is also affected, but is a
> >> receiver so it's easier to solve.
> >>
> >> For RGB565, ov5640, mt9m114 and gc2145 are in that list, but the pixel
> >> representation isn't the same than RGB888, so it's not clear to me how
> >> they are affected.
> >>
> >> For RGB666, no v4l2 drivers are affected, but a fair bit of KMS drivers
> >> that use media bus formats still might.
> >=20
> > Can we make some progress on this, one way or another?
>=20
> Thank you for reminding me.
>=20
> I would prefer to support both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FM=
T_RGB888_1X24,
> as you suggested at one point.
>=20
> MEDIA_BUS_FMT_RGB888_1X24 should be enumerated last in enum_mbus_code.
>=20
> If MEDIA_BUS_FMT_RGB888_1X24 is used, a warn_on_once message can be logge=
d. Because
> basically it's there for backwards compatibility only.
>=20
> Clearly document this as well.
>=20
> I feel uncomfortable just dropping MEDIA_BUS_FMT_RGB888_1X24. This driver=
 is widely
> used, certainly on the RPi, and I suspect there are quite a few home-brew=
n applications
> out there that we don't know about.
>=20
> Would this work for you?

It makes total sense to me. I'll work on some patches implementing that.

Thanks!
Maxime

--zcpujofsd3ktx3m5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaItpWAAKCRAnX84Zoj2+
dt09AX98vEAWEGjKiRfaqR2L6P0UI0twRghaC5LYOFsm23VHQrkPkvGNHzWSp56Y
DH00zOQBgIMJBMbzSDTo4h4lst/BZLpdNxVS67Ujt1fnSO89mPK4FTAhhyuWDa2M
26Ly3u0RWw==
=NYpx
-----END PGP SIGNATURE-----

--zcpujofsd3ktx3m5--

