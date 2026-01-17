Return-Path: <linux-media+bounces-50940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C677CD38C59
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 05:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4365F300D802
	for <lists+linux-media@lfdr.de>; Sat, 17 Jan 2026 04:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59406326939;
	Sat, 17 Jan 2026 04:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W78oMkq+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2CC2E11C7
	for <linux-media@vger.kernel.org>; Sat, 17 Jan 2026 04:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768625081; cv=none; b=uAfmJxIuBJzwhiLPOLifujd8HMTkTI+VKVG9d56mz2NErm4MsQZHok+Q6nUeE1qALq6yS5V13ls6TEzcy2Ie3uLiZvWayjlVqzTS8uOkWvuA/LSkwdakFEZGL5RehaaU7kRHoL/6WiyLB8pSpAhyn8BVZQ8OH2AqhzHOdw6wI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768625081; c=relaxed/simple;
	bh=/Wuoalou3aggWHgAQCEz4garPC5Alk/bJiLEKNrA5tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBh2PsRywDjVpE7f0/tjungdkVIGF42IkV7HGNIUqU9+/MllmqXkTHI1OyqOXddeLZpjvAonGwNuVf1PQ23yri2iwg8NmQj0ekUkX7YNiR1DK4PW2KMHRv3ZGzkr69cx+0aOaVL/IXkV+iCq6gMkHAFcnb3W34XMrZdT7z1cTV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W78oMkq+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1BDBE492;
	Sat, 17 Jan 2026 05:44:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768625047;
	bh=/Wuoalou3aggWHgAQCEz4garPC5Alk/bJiLEKNrA5tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W78oMkq+O7OS4H8GjPYbD5DoYpsLLfKhJuk+JAJ2PzWx45V0DLftbx+u25H3SLCXX
	 zULfdQddolOTHBAUhsGBfPxDmIcMXzdh+hYfBq4nCfhFYYBh+TCTAJjrpMEvLsmVAY
	 V/eXGdoLfYcFp4kl6urZWw1Ec1JKVq57ihsIEQpc=
Date: Sat, 17 Jan 2026 06:44:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Faizel K B <faizel.kb@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH 2/3] media: vimc: sensor: Add frame rate configuration
 support
Message-ID: <20260117044413.GB445@pendragon.ideasonboard.com>
References: <20260115191050.1370387-1-faizel.kb@gmail.com>
 <20260115191050.1370387-3-faizel.kb@gmail.com>
 <176855718062.1693075.8294828651917203116@ping.linuxembedded.co.uk>
 <cr7vrmkqxuriwici63khv4rv4fyeyp4aacejqe5mqfwuwbd2bs@xrjarfm6g4fv>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cr7vrmkqxuriwici63khv4rv4fyeyp4aacejqe5mqfwuwbd2bs@xrjarfm6g4fv>

On Fri, Jan 16, 2026 at 12:35:47PM -0800, Faizel K B wrote:
> On Fri, Jan 16, 2026 at 09:53:00AM +0000, Kieran Bingham wrote:
> > Hi Faizel,
> >
> > Pullling in the libcamera-devel mailing list for relevant awareness too.
> >
> > Quoting faizel.kb@gmail.com (2026-01-15 19:10:49)
> >> From: Faizel K B <faizel.kb@gmail.com>
> >>
> >> Implement set_frame_interval and get_frame_interval callbacks in
> >> v4l2_subdev_pad_ops to enable frame rate configuration from 1-240 FPS.
> >> The default frame rate is 60 FPS.
> >>
> >> The configured frame interval is pre-calculated into jiffies and
> >> stored in the sensor's hw structure for efficient access by the
> >> streamer thread.
> >
> > This is a really interesting and helpful bit of work - but I'm weary it
> > might have taken one small mis-direction.
> >
> > VIMC aims to replicate the usage of camera sensors, and I don't think
> > we're supposed to use frame interval interface for that.
> >
> > Instead following the camera sensor model, this should be implemented to
> > mirror what the hardware in camera sensors actually does/needs which is
> > to make the frame rate a function of the exposure time and blankings
> > (both hblank and vblank).
> >
> > We have a bit of a write up about the calculation at the bottom of this
> > page:
> >
> > - https://libcamera.org/camera-sensor-model.html
> >
> > Or perhaps the sensor requirements of libcamera might be what a virtual
> > sensor should aim for:
> >
> > - https://libcamera.org/sensor_driver_requirements.html
> 
> Thanks for the review and links. It makes sense to implement the pixelrate, 
> v/h blanking from a sensor point of view.The exposure value also
> matters. Sensors even prioritize the exposure to the frame timings or the
> other way. This parameters can be added inside using v4l2_ctrl_new_std(),
> for pixel rate,blanking and exposure and calculate the sleep time for the
> frame rate delay in the streamer thread. By this, a user need to do few
> calculations to adjust the frame rate.
> 
> > There's probably more helpful documentation in the linux kernel too in
> > the upcoming sensor model rework from Sakari.
> >
> > Aha - in fact I found this:
> > - https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#raw-camera-sensors
> >
> > "2.2. Frame interval configuration
> >
> > There are two different methods for obtaining possibilities for
> > different frame intervals as well as configuring the frame interval.
> > Which one to implement depends on the type of the device."
> >
> > So perhaps the question we need to clarify is "what type of device is
> > vimc-sensor".
> >
> > I'm likely biased to presume it's a virtual raw camera sensor ... But is
> > it ?
> 
> Would like to hear more about this.

Given that the vimc driver exposes raw bayer formats, and that the
sensor is connected to an entity called debayer, it's safe to say it
should be considered as a raw sensor. This is how libcamera uses vimc,
and I think it's the most important use case for the driver.

This being said, the media graph exposed by the vimc driver doesn't map
exactly to how a raw sensor connected to an inline ISP would look like.
It would be nice to improve this at some point.

> >> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> >> ---
> >>  drivers/media/test-drivers/vimc/vimc-common.h |  2 +
> >>  drivers/media/test-drivers/vimc/vimc-sensor.c | 45 +++++++++++++++++++
> >>  2 files changed, 47 insertions(+)
> >>
> >> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/media/test-drivers/vimc/vimc-common.h
> >> index 7f5f008e407b..a71ef761fa77 100644
> >> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> >> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> >> @@ -173,6 +173,7 @@ struct vimc_sensor_device {
> >>         struct tpg_data tpg;
> >>         struct v4l2_ctrl_handler hdl;
> >>         struct media_pad pad;
> >> +       struct v4l2_fract frame_interval;
> >>
> >>         u8 *frame;
> >>
> >> @@ -184,6 +185,7 @@ struct vimc_sensor_device {
> >>                 struct v4l2_area size;
> >>                 enum vimc_sensor_osd_mode osd_value;
> >>                 u64 start_stream_ts;
> >> +               unsigned long fps_jiffies;
> >>         } hw;
> >>  };
> >>
> >> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >> index 2b07dc1f1278..d54425ff28a1 100644
> >> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> >> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> >> @@ -140,12 +140,53 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
> >>
> >>         return 0;
> >>  }
> >> +static int vimc_sensor_get_frame_interval(struct v4l2_subdev *sd,
> >> +                                         struct v4l2_subdev_state *state,
> >> +                                         struct v4l2_subdev_frame_interval *fi)
> >> +{
> >> +       struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
> >> +
> >> +       fi->interval = vsensor->frame_interval;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >> +static int vimc_sensor_set_frame_interval(struct v4l2_subdev *sd,
> >> +                                         struct v4l2_subdev_state *state,
> >> +                                         struct v4l2_subdev_frame_interval *fi)
> >> +{
> >> +       struct vimc_sensor_device *vsensor = v4l2_get_subdevdata(sd);
> >> +       u32 fps;
> >> +
> >> +       /* Sanitize to default if invalid */
> >> +       if (unlikely(!fi->interval.numerator || !fi->interval.denominator)) {
> >> +               fi->interval.numerator = 1;
> >> +               fi->interval.denominator = 60;
> >> +       } else {
> >> +               /* Clamp FPS to 1-240 range */
> >> +               fps = fi->interval.denominator / fi->interval.numerator;
> >> +               fps = clamp(fps, 1U, 240U);
> >> +
> >> +               fi->interval.numerator = 1;
> >> +               fi->interval.denominator = fps;
> >> +       }
> >> +
> >> +       vsensor->frame_interval = fi->interval;
> >> +
> >> +       /* Update hardware timing configuration */
> >> +       vsensor->hw.fps_jiffies = (HZ * vsensor->frame_interval.numerator) /
> >> +                                 vsensor->frame_interval.denominator;
> >> +
> >> +       return 0;
> >> +}
> >>
> >>  static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops = {
> >>         .enum_mbus_code         = vimc_sensor_enum_mbus_code,
> >>         .enum_frame_size        = vimc_sensor_enum_frame_size,
> >>         .get_fmt                = v4l2_subdev_get_fmt,
> >>         .set_fmt                = vimc_sensor_set_fmt,
> >> +       .get_frame_interval     = vimc_sensor_get_frame_interval,
> >> +       .set_frame_interval     = vimc_sensor_set_frame_interval,
> >>  };
> >>
> >>  static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
> >> @@ -400,6 +441,10 @@ static struct vimc_ent_device *vimc_sensor_add(struct vimc_device *vimc,
> >>
> >>         vsensor->ved.process_frame = vimc_sensor_process_frame;
> >>         vsensor->ved.dev = vimc->mdev.dev;
> >> +       /* Initialize to 60 FPS */
> >> +       vsensor->frame_interval.numerator = 1;
> >> +       vsensor->frame_interval.denominator = 60;
> >> +       vsensor->hw.fps_jiffies = HZ / 60;
> >>
> >>         return &vsensor->ved;
> >>

-- 
Regards,

Laurent Pinchart

