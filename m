Return-Path: <linux-media+bounces-50858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A59DCD2F12B
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 10:53:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65955300FEF6
	for <lists+linux-media@lfdr.de>; Fri, 16 Jan 2026 09:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E731271471;
	Fri, 16 Jan 2026 09:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Z3prj9WL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCB23183C
	for <linux-media@vger.kernel.org>; Fri, 16 Jan 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768557188; cv=none; b=XgU2V8JApwjkbTDNJ19eKuUY/IHV4xC+7G240pWnwth/X7Fy9FLyRamqej21PFBpgbkpmVpTx9qLNPprqJXsUoM6cgUCdUWgK+USE3dMMvWRT+Bu8MJrLQOt7Ee1sJzuFzsCLAmePavz6OSVWW4MHuCmmw4UTZ9x66ywvdva4OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768557188; c=relaxed/simple;
	bh=GkJL2EmITiB/2rVFB//ZJTqLB8tqFn7V8I4WIetKjuE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Cc:Date:Message-ID; b=J41OvN0CgEOfU13VVNl09zS7rHKsc5fur01sgmdfVdUm7sxK8IAhkwgjhJb5ceGu/RqGfDTnT7bETO+7CRh6p0rrKDv4DZGA+GbG84N2nRCWtx91tCau0zO38hRcRQEVcP+uY/3UbbwWWlmmEDuQQzCNdX0qAkxNA76Hcmr9lMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Z3prj9WL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7466F4B3;
	Fri, 16 Jan 2026 10:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768557155;
	bh=GkJL2EmITiB/2rVFB//ZJTqLB8tqFn7V8I4WIetKjuE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Z3prj9WLt7iNB2ajuKuHXTsAy291BCgsZvi5z4j1zpJCLAHTdlY7Yu1QjH5dhw+tL
	 0I0Ni2y/CJUKB1EWc5NhJqQ4v+cs+wgrNHG6lk8lrBI1vb3Q0hMCvosKhkqmKNCSDb
	 ZA30HL1rPjAS16LZqZNiYRvFZ2OAXsLOl1gYF83A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260115191050.1370387-3-faizel.kb@gmail.com>
References: <20260115191050.1370387-1-faizel.kb@gmail.com> <20260115191050.1370387-3-faizel.kb@gmail.com>
Subject: Re: [PATCH 2/3] media: vimc: sensor: Add frame rate configuration support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Shuah Khan <skhan@linuxfoundation.org>, faizel.kb@gmail.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Faizel K B <faizel.kb@gmail.com>, libcamera-devel@lists.libcamera.org,
Date: Fri, 16 Jan 2026 09:53:00 +0000
Message-ID: <176855718062.1693075.8294828651917203116@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Faizel,

Pullling in the libcamera-devel mailing list for relevant awareness too.

Quoting faizel.kb@gmail.com (2026-01-15 19:10:49)
> From: Faizel K B <faizel.kb@gmail.com>
>=20
> Implement set_frame_interval and get_frame_interval callbacks in
> v4l2_subdev_pad_ops to enable frame rate configuration from 1-240 FPS.
> The default frame rate is 60 FPS.
>=20
> The configured frame interval is pre-calculated into jiffies and
> stored in the sensor's hw structure for efficient access by the
> streamer thread.

This is a really interesting and helpful bit of work - but I'm weary it
might have taken one small mis-direction.

VIMC aims to replicate the usage of camera sensors, and I don't think
we're supposed to use frame interval interface for that.

Instead following the camera sensor model, this should be implemented to
mirror what the hardware in camera sensors actually does/needs which is
to make the frame rate a function of the exposure time and blankings
(both hblank and vblank).

We have a bit of a write up about the calculation at the bottom of this
page:

 - https://libcamera.org/camera-sensor-model.html

Or perhaps the sensor requirements of libcamera might be what a virtual
sensor should aim for:

 - https://libcamera.org/sensor_driver_requirements.html

There's probably more helpful documentation in the linux kernel too in
the upcoming sensor model rework from Sakari.

Aha - in fact I found this:
 - https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camer=
a-sensor.html#raw-camera-sensors

"2.2. Frame interval configuration

There are two different methods for obtaining possibilities for
different frame intervals as well as configuring the frame interval.
Which one to implement depends on the type of the device."

So perhaps the question we need to clarify is "what type of device is
vimc-sensor".

I'm likely biased to presume it's a virtual raw camera sensor ... But is
it ?

--
Kieran


> Signed-off-by: Faizel K B <faizel.kb@gmail.com>
> ---
>  drivers/media/test-drivers/vimc/vimc-common.h |  2 +
>  drivers/media/test-drivers/vimc/vimc-sensor.c | 45 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>=20
> diff --git a/drivers/media/test-drivers/vimc/vimc-common.h b/drivers/medi=
a/test-drivers/vimc/vimc-common.h
> index 7f5f008e407b..a71ef761fa77 100644
> --- a/drivers/media/test-drivers/vimc/vimc-common.h
> +++ b/drivers/media/test-drivers/vimc/vimc-common.h
> @@ -173,6 +173,7 @@ struct vimc_sensor_device {
>         struct tpg_data tpg;
>         struct v4l2_ctrl_handler hdl;
>         struct media_pad pad;
> +       struct v4l2_fract frame_interval;
> =20
>         u8 *frame;
> =20
> @@ -184,6 +185,7 @@ struct vimc_sensor_device {
>                 struct v4l2_area size;
>                 enum vimc_sensor_osd_mode osd_value;
>                 u64 start_stream_ts;
> +               unsigned long fps_jiffies;
>         } hw;
>  };
> =20
> diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/medi=
a/test-drivers/vimc/vimc-sensor.c
> index 2b07dc1f1278..d54425ff28a1 100644
> --- a/drivers/media/test-drivers/vimc/vimc-sensor.c
> +++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
> @@ -140,12 +140,53 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *=
sd,
> =20
>         return 0;
>  }
> +static int vimc_sensor_get_frame_interval(struct v4l2_subdev *sd,
> +                                         struct v4l2_subdev_state *state,
> +                                         struct v4l2_subdev_frame_interv=
al *fi)
> +{
> +       struct vimc_sensor_device *vsensor =3D v4l2_get_subdevdata(sd);
> +
> +       fi->interval =3D vsensor->frame_interval;
> +
> +       return 0;
> +}
> +
> +static int vimc_sensor_set_frame_interval(struct v4l2_subdev *sd,
> +                                         struct v4l2_subdev_state *state,
> +                                         struct v4l2_subdev_frame_interv=
al *fi)
> +{
> +       struct vimc_sensor_device *vsensor =3D v4l2_get_subdevdata(sd);
> +       u32 fps;
> +
> +       /* Sanitize to default if invalid */
> +       if (unlikely(!fi->interval.numerator || !fi->interval.denominator=
)) {
> +               fi->interval.numerator =3D 1;
> +               fi->interval.denominator =3D 60;
> +       } else {
> +               /* Clamp FPS to 1-240 range */
> +               fps =3D fi->interval.denominator / fi->interval.numerator;
> +               fps =3D clamp(fps, 1U, 240U);
> +
> +               fi->interval.numerator =3D 1;
> +               fi->interval.denominator =3D fps;
> +       }
> +
> +       vsensor->frame_interval =3D fi->interval;
> +
> +       /* Update hardware timing configuration */
> +       vsensor->hw.fps_jiffies =3D (HZ * vsensor->frame_interval.numerat=
or) /
> +                                 vsensor->frame_interval.denominator;
> +
> +       return 0;
> +}
> =20
>  static const struct v4l2_subdev_pad_ops vimc_sensor_pad_ops =3D {
>         .enum_mbus_code         =3D vimc_sensor_enum_mbus_code,
>         .enum_frame_size        =3D vimc_sensor_enum_frame_size,
>         .get_fmt                =3D v4l2_subdev_get_fmt,
>         .set_fmt                =3D vimc_sensor_set_fmt,
> +       .get_frame_interval     =3D vimc_sensor_get_frame_interval,
> +       .set_frame_interval     =3D vimc_sensor_set_frame_interval,
>  };
> =20
>  static void *vimc_sensor_process_frame(struct vimc_ent_device *ved,
> @@ -400,6 +441,10 @@ static struct vimc_ent_device *vimc_sensor_add(struc=
t vimc_device *vimc,
> =20
>         vsensor->ved.process_frame =3D vimc_sensor_process_frame;
>         vsensor->ved.dev =3D vimc->mdev.dev;
> +       /* Initialize to 60 FPS */
> +       vsensor->frame_interval.numerator =3D 1;
> +       vsensor->frame_interval.denominator =3D 60;
> +       vsensor->hw.fps_jiffies =3D HZ / 60;
> =20
>         return &vsensor->ved;
> =20
> --=20
> 2.43.0
>

