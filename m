Return-Path: <linux-media+bounces-17472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A0969E8F
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 15:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815342823C5
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 13:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974061A0BD5;
	Tue,  3 Sep 2024 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OakxvgFz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB321CA687;
	Tue,  3 Sep 2024 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725368491; cv=none; b=fD9McXhqNSIQ11V4HACDOfthRGN83A6wj2m0aDeKD/5nK9353Oc0DLdRGl5vw+8UwjJAoURR2OGfMsAUTwaArUFT3+Zh3gV9tx70DXMAh6K8PTyaLzU/ayBsqtvunSTLH5gv7eqDWxavClwNvgqhINd9jNw0M5Pfjwf59qqFjMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725368491; c=relaxed/simple;
	bh=abSFF+g/+IzRDBwRsLRk9042G7D65CkDb4YRPDJWMMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPmXuPgH0p2rNswUWJkUd6YCHUvennAMCQicQjKJgC2lwSpV3I16p3HZdXp954dShE/kV1VtRUF6VMt9cgM/006/5up4f0mmXmHaa6+tFC5h5m1rdK4DZ+04qHuKCIqxsnLKHjQX3s5ITAEBwaFpGb5eMzLKW00+ZpI2QN4NBp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OakxvgFz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6730169;
	Tue,  3 Sep 2024 15:00:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725368413;
	bh=abSFF+g/+IzRDBwRsLRk9042G7D65CkDb4YRPDJWMMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OakxvgFzt0K08PcUbo6EaFDclKs91B2uu75d5Cj3dPa7eNnolWSv9jIXDP1qryvE3
	 rDcQIgbUd7DEVpNJIQkGdyue6oum5mDuPiDrBfH6tyhftMKmy4TnL+FSAYAhWSJ5Ha
	 GFC5eawTGNxbFFoJo1tTI7bguS6ieUrCK/LR7EhA=
Date: Tue, 3 Sep 2024 16:00:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Benjamin Bara <bbara93@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: Re: [PATCH v3 4/7] media: i2c: imx290: Introduce initial "off" mode
 & link freq
Message-ID: <20240903130053.GA25878@pendragon.ideasonboard.com>
References: <20240902-imx290-avail-v3-0-b32a12799fed@skidata.com>
 <20240902-imx290-avail-v3-4-b32a12799fed@skidata.com>
 <20240902195821.GQ1995@pendragon.ideasonboard.com>
 <CAJpcXm6r_LAD+NC7u5aNvkEHq3Vb3osCea8MAn8nQ45dCtoxSg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJpcXm6r_LAD+NC7u5aNvkEHq3Vb3osCea8MAn8nQ45dCtoxSg@mail.gmail.com>

On Mon, Sep 02, 2024 at 10:55:04PM +0200, Benjamin Bara wrote:
> On Mon, 2 Sept 2024 at 21:58, Laurent Pinchart wrote:
> > On Mon, Sep 02, 2024 at 05:57:29PM +0200, bbara93@gmail.com wrote:
> > > From: Benjamin Bara <benjamin.bara@skidata.com>
> > >
> > > To be compliant to the V4L2 API, the driver currently "randomly" decides
> > > on one of the two supported modes which also implies a link frequency.
> > >
> > > Add a new mode and frequency which symbolize that the sensor is not in
> > > use. This can be used as a default value during probe() and enables us
> > > to avoid communication with the sensor.
> >
> > I really doin't like this change. I would like to instead move away from
> > modes and make the driver freely configurable.
> 
> Which controls do you want to have freely configurable? At least on the
> imx290 the exposure limits depend on the blanking, and the blanking
> limits depend on the format. As the format is defined by the mode on
> imx290, I think this will be quite hard with the current controls.

I want to make the format freely configurable.

> > Furthermore, the concept of an initial unconfigured state isn't valid
> > in V4L2. The driver must fully initialize the whole device state at
> > probe time.
> 
> I understand that and it makes sense to me. But given the dependencies
> from above and the fact that the format is currently part of this
> "state", it makes the "freely configurable" intention even harder :-(

Why can't we simply initialize the controls with limits that correspond
to the default format ? I don't understand what issue this is trying to
solve.

> > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > ---
> > > Changes since v2:
> > > - new
> > > ---
> > >  drivers/media/i2c/imx290.c | 29 +++++++++++++++++++++++------
> > >  1 file changed, 23 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 6812e7cb9e23..ece4d66001f5 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -425,14 +425,17 @@ static const struct imx290_csi_cfg imx290_csi_297mhz = {
> > >  /* supported link frequencies */
> > >  #define FREQ_INDEX_1080P     0
> > >  #define FREQ_INDEX_720P              1
> > > +#define FREQ_INDEX_OFF               2
> > >  static const s64 imx290_link_freq_2lanes[] = {
> > >       [FREQ_INDEX_1080P] = 445500000,
> > >       [FREQ_INDEX_720P] = 297000000,
> > > +     [FREQ_INDEX_OFF] = 0,
> > >  };
> > >
> > >  static const s64 imx290_link_freq_4lanes[] = {
> > >       [FREQ_INDEX_1080P] = 222750000,
> > >       [FREQ_INDEX_720P] = 148500000,
> > > +     [FREQ_INDEX_OFF] = 0,
> > >  };
> > >
> > >  /*
> > > @@ -552,6 +555,10 @@ static const struct imx290_mode imx290_modes_4lanes[] = {
> > >       },
> > >  };
> > >
> > > +static const struct imx290_mode imx290_mode_off = {
> > > +     .link_freq_index = FREQ_INDEX_OFF,
> > > +};
> > > +
> > >  static inline const struct imx290_mode *imx290_modes_ptr(const struct imx290 *imx290)
> > >  {
> > >       if (imx290->nlanes == 2)
> > > @@ -876,10 +883,19 @@ static unsigned int imx290_get_blank_min(const struct imx290 *imx290, bool v)
> > >  static void imx290_ctrl_update(struct imx290 *imx290,
> > >                              const struct imx290_mode *mode)
> > >  {
> > > -     unsigned int hblank_min = mode->hmax_min - mode->width;
> > > -     unsigned int hblank_max = IMX290_HMAX_MAX - mode->width;
> > > -     unsigned int vblank_min = mode->vmax_min - mode->height;
> > > -     unsigned int vblank_max = IMX290_VMAX_MAX - mode->height;
> > > +     unsigned int hblank_min, hblank_max, vblank_min, vblank_max;
> > > +
> > > +     if (mode == &imx290_mode_off) {
> > > +             hblank_min = imx290_get_blank_min(imx290, false);
> > > +             hblank_max = HBLANK_MAX;
> > > +             vblank_min = imx290_get_blank_min(imx290, true);
> > > +             vblank_max = VBLANK_MAX;
> > > +     } else {
> > > +             hblank_min = mode->hmax_min - mode->width;
> > > +             hblank_max = IMX290_HMAX_MAX - mode->width;
> > > +             vblank_min = mode->vmax_min - mode->height;
> > > +             vblank_max = IMX290_VMAX_MAX - mode->height;
> > > +     }
> > >
> > >       __v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> > >
> > > @@ -932,7 +948,8 @@ static int imx290_ctrl_init(struct imx290 *imx290)
> > >       imx290->link_freq =
> > >               v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
> > >                                      V4L2_CID_LINK_FREQ,
> > > -                                    imx290_link_freqs_num(imx290) - 1, 0,
> > > +                                    imx290_link_freqs_num(imx290) - 1,
> > > +                                    FREQ_INDEX_OFF,
> > >                                      imx290_link_freqs_ptr(imx290));
> > >       if (imx290->link_freq)
> > >               imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > @@ -1278,7 +1295,7 @@ static int imx290_subdev_init(struct imx290 *imx290)
> > >       struct v4l2_subdev_state *state;
> > >       int ret;
> > >
> > > -     imx290->current_mode = &imx290_modes_ptr(imx290)[0];
> > > +     imx290->current_mode = &imx290_mode_off;
> > >
> > >       v4l2_i2c_subdev_init(&imx290->sd, client, &imx290_subdev_ops);
> > >       imx290->sd.internal_ops = &imx290_internal_ops;
> > >

-- 
Regards,

Laurent Pinchart

