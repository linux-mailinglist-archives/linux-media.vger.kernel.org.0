Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F669C48F1
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 09:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfJBH6M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 03:58:12 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:43737 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbfJBH6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 03:58:12 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 88340240003;
        Wed,  2 Oct 2019 07:58:07 +0000 (UTC)
Date:   Wed, 2 Oct 2019 09:59:51 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        hugues.fruchet@st.com
Subject: Re: [Patch 1/3] media: ov5640: add PIXEL_RATE control
Message-ID: <20191002075951.afp2xligspqat4ew@uno.localdomain>
References: <20190925152301.21645-1-bparrot@ti.com>
 <20190925152301.21645-2-bparrot@ti.com>
 <20191001075704.GA5449@paasikivi.fi.intel.com>
 <20191001162341.f2o7ruar2nifl5ws@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ikhqxt5tabr5x7tv"
Content-Disposition: inline
In-Reply-To: <20191001162341.f2o7ruar2nifl5ws@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ikhqxt5tabr5x7tv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Benoit,
  +Hugues

If you're considering an helper, this thread might be useful to you:
https://patchwork.kernel.org/patch/11019673/

Thanks
   j

On Tue, Oct 01, 2019 at 11:23:41AM -0500, Benoit Parrot wrote:
> Hi Sakari,
>
> Thanks for the review.
>
> Sakari Ailus <sakari.ailus@linux.intel.com> wrote on Tue [2019-Oct-01 10:57:04 +0300]:
> > Hi Benoit,
> >
> > On Wed, Sep 25, 2019 at 10:22:59AM -0500, Benoit Parrot wrote:
> > > Add v4l2 controls to report the pixel rates of each mode. This is
> > > needed by some CSI2 receiver in order to perform proper DPHY
> > > configuration.
> > >
> > > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 25 +++++++++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 500d9bbff10b..c2a44f30d56e 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -193,6 +193,9 @@ struct ov5640_mode_info {
> > >
> > >  struct ov5640_ctrls {
> > >  	struct v4l2_ctrl_handler handler;
> > > +	struct {
> > > +		struct v4l2_ctrl *pixel_rate;
> > > +	};
> > >  	struct {
> > >  		struct v4l2_ctrl *auto_exp;
> > >  		struct v4l2_ctrl *exposure;
> > > @@ -241,6 +244,7 @@ struct ov5640_dev {
> > >  	const struct ov5640_mode_info *last_mode;
> > >  	enum ov5640_frame_rate current_fr;
> > >  	struct v4l2_fract frame_interval;
> > > +	u64 pixel_rate;
> > >
> > >  	struct ov5640_ctrls ctrls;
> > >
> > > @@ -2202,6 +2206,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >  	const struct ov5640_mode_info *new_mode;
> > >  	struct v4l2_mbus_framefmt *mbus_fmt = &format->format;
> > >  	struct v4l2_mbus_framefmt *fmt;
> > > +	u64 rate;
> > >  	int ret;
> > >
> > >  	if (format->pad != 0)
> > > @@ -2233,6 +2238,12 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >  	if (mbus_fmt->code != sensor->fmt.code)
> > >  		sensor->pending_fmt_change = true;
> > >
> > > +	rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > > +	rate *= ov5640_framerates[sensor->current_fr];
> > > +	sensor->pixel_rate = rate;
> > > +
> > > +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > +				 sensor->pixel_rate);
> > >  out:
> > >  	mutex_unlock(&sensor->lock);
> > >  	return ret;
> > > @@ -2657,6 +2668,13 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >  	/* we can use our own mutex for the ctrl lock */
> > >  	hdl->lock = &sensor->lock;
> > >
> > > +	/* Clock related controls */
> > > +	ctrls->pixel_rate =
> > > +		v4l2_ctrl_new_std(hdl, ops,
> > > +				  V4L2_CID_PIXEL_RATE, 0, INT_MAX, 1,
> > > +				  55969920);
> >
> > Could you calculate this value instead of using a seemingly random number?
>
> Yes I guess I could, especially if I make a helper function for it :).
>
> >
> > > +	ctrls->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > >  	/* Auto/manual white balance */
> > >  	ctrls->auto_wb = v4l2_ctrl_new_std(hdl, ops,
> > >  					   V4L2_CID_AUTO_WHITE_BALANCE,
> > > @@ -2782,6 +2800,7 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> > >  	struct ov5640_dev *sensor = to_ov5640_dev(sd);
> > >  	const struct ov5640_mode_info *mode;
> > >  	int frame_rate, ret = 0;
> > > +	u64 rate;
> > >
> > >  	if (fi->pad != 0)
> > >  		return -EINVAL;
> > > @@ -2816,6 +2835,12 @@ static int ov5640_s_frame_interval(struct v4l2_subdev *sd,
> > >  		sensor->frame_interval = fi->interval;
> > >  		sensor->current_mode = mode;
> > >  		sensor->pending_mode_change = true;
> > > +
> > > +		rate = sensor->current_mode->vtot * sensor->current_mode->htot;
> > > +		rate *= ov5640_framerates[sensor->current_fr];
> > > +		sensor->pixel_rate = rate;
> >
> > I think it'd be better to have a function to calculate the value instead of
> > duplicating the code here.
>
> Yes I'll create a helper function.
>
> Benoit
>
> >
> > > +		__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixel_rate,
> > > +					 sensor->pixel_rate);
> > >  	}
> > >  out:
> > >  	mutex_unlock(&sensor->lock);
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus
> > sakari.ailus@linux.intel.com

--ikhqxt5tabr5x7tv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2UWPYACgkQcjQGjxah
VjyMUBAAv63bbrUWjsL9pUBz7wdu92GfRg/kGitLLZQHVYMs8q0YxiA31AE+vnpY
fPrDu45KjWSq1IFFX/NaS90fnWXQ9jYslhyyYQiG1zz2Gvw1XiLQD7CkjnNiAr/i
IJGNcm2I2av/w4eEM4J+QdLgR4k4AHyOptXD+D/xJAOKWjBXehl2PSFCPY7DKDOv
Or4PFzplX15a14GNHAqgjjATOKKw7yv+I9uLX1BazX2CHvGyeuqm4A5Q7HL1BnWu
zm5kmuw6p7d5Zgy3eT36u6vixx+w1MpZVzLq1ZqipO4bo0QdvW6a0Ik8jUXxKnjd
rMpJ/WJkTkf9juSNcaN7ewSy7hGTpBztjwBzZIFr6KiuYdPn1w11QCR1BORiVYFh
YmMgm0sfmSkauu4LftQaLmMMlfl5p9KzRxjnTc0fkZsst5jrjdSZ+1m9dXXhAz9n
0A6X3e1RkmnwsvgTmhYh02ICgMipYo6haH+4frS6ABnbhvCd5TdLaVeauwqbiKSH
2gamkDttXB11urVdKP/fE0qO1ScSktjkEkrkNTqEo9APin8u4jtW3OpFJOWX+DN/
F4YMhQ6ZdfK6GfI4iCBmXk0nl5RNiwB9orxinZTLt10rJip38PYO8+LKcThZNHrF
+GNsZF5N2OZBRwi1Bx8u14Iok0pdoZIXm7nGtGYAHi1i6s5Z4jE=
=1XCp
-----END PGP SIGNATURE-----

--ikhqxt5tabr5x7tv--
