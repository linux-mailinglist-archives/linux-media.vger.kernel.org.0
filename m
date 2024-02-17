Return-Path: <linux-media+bounces-5347-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10259859064
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F8A5B209DC
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1D47C0BB;
	Sat, 17 Feb 2024 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sJUHh8wc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB18A7C09B
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708182563; cv=none; b=Hx9U+MZQZ/vBrFuSn1Eh0bXJmcKPsxf8T5Me3TDCkb9dzXFfZcXp/08/9uPiHXr9GEi+lYNgWCNyjGoRON53rEc9RhMCB9K7NC3qOincgqY/F1Fm2K6EiqBreupRxBnhfN43x+InMTUqX3W83dRVy9FE827LAjn8UJzsxKcMT/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708182563; c=relaxed/simple;
	bh=Ru+GylUt8NvXqwo31JcdjWdu8fkJ4xvaU+NU7lRIAw8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rKgALzVkNX0DqM5tHBL0LW/+GduTXkx9WIMa3gjyIackR06bmZ6ciecXoEKua/wf/hAwpMPhxiko8czHvxRjK3G3o0Qtyevql/cIKPUsv0idKHEwLbHzhmcceH4xDHUYjOK8hyaRzvh/af1X/V5VihBl0Fsx1qY4CzdV2GeVEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sJUHh8wc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1FB6B6B3;
	Sat, 17 Feb 2024 16:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708182555;
	bh=Ru+GylUt8NvXqwo31JcdjWdu8fkJ4xvaU+NU7lRIAw8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sJUHh8wcGavurGgY4r11B8LnpF5/urxLwVby6Qx3/mGQwXWwfH1hyK16mjsRjKbCb
	 ZQryudHvq4U8wrcWxtFwfUi3rMmw+W2anvq/wwfhhYXPfencdoXglUqWjnuhgHx7fo
	 6CPSvV6VZcL2Pd6+ydso+aYn3pBVdmrJgWF1nlg8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-4-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-4-hdegoede@redhat.com>
Subject: Re: [PATCH 3/9] media: atomisp: Remove custom VCM handling
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:09:17 +0000
Message-ID: <170818255737.1206667.8323412903887130424@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:32)
> Remove the custom VCM handling, instead the VCM should be controlled
> through its own v4l2-subdev and the new ipu-bridge.c code already
> supports instantiating an i2c_client for this and setting up
> the necessary endpoints in the fwnode graph.

Agreed, this sounds like a good move forwards to align with other ISPs
and existing VCM driver frameworks. I must get back to my rework of the
VCM drivers I started though!

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/include/linux/atomisp.h     |  3 -
>  .../atomisp/include/linux/atomisp_platform.h  |  5 +-
>  .../media/atomisp/pci/atomisp_internal.h      |  4 -
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 86 +------------------
>  .../staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ----
>  5 files changed, 3 insertions(+), 110 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/driv=
ers/staging/media/atomisp/include/linux/atomisp.h
> index bbbd904b696a..d9a7a599038d 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -914,9 +914,6 @@ enum atomisp_burst_capture_options {
>  /* VCM step time */
>  #define V4L2_CID_VCM_TIMING                (V4L2_CID_CAMERA_LASTP1 + 12)
> =20
> -/* Query Focus Status */
> -#define V4L2_CID_FOCUS_STATUS              (V4L2_CID_CAMERA_LASTP1 + 14)
> -
>  /* number of frames to skip at stream start */
>  #define V4L2_CID_G_SKIP_FRAMES            (V4L2_CID_CAMERA_LASTP1 + 17)
> =20
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp_platform=
.h b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> index 487ef5846c24..2535402afd73 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp_platform.h
> @@ -111,9 +111,8 @@ enum atomisp_input_format {
> =20
>  enum intel_v4l2_subdev_type {
>         RAW_CAMERA =3D 1,
> -       CAMERA_MOTOR =3D 2,
> -       LED_FLASH =3D 3,
> -       TEST_PATTERN =3D 4,
> +       LED_FLASH =3D 2,
> +       TEST_PATTERN =3D 3,
>  };
> =20
>  struct intel_v4l2_subdev_id {
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drive=
rs/staging/media/atomisp/pci/atomisp_internal.h
> index bba9bc64d447..ca8ed3a6b9b8 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
> +++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
> @@ -134,9 +134,6 @@ struct atomisp_input_subdev {
>         struct v4l2_rect active_rect;
>         /* Sensor state for which =3D=3D V4L2_SUBDEV_FORMAT_TRY calls */
>         struct v4l2_subdev_state *try_sd_state;
> -
> -       struct v4l2_subdev *motor;
> -
>         /*
>          * To show this resource is used by
>          * which stream, in ISP multiple stream mode
> @@ -210,7 +207,6 @@ struct atomisp_device {
>         unsigned int input_cnt;
>         struct atomisp_input_subdev inputs[ATOM_ISP_MAX_INPUTS];
>         struct v4l2_subdev *flash;
> -       struct v4l2_subdev *motor;
> =20
>         struct atomisp_regs saved_regs;
>         struct atomisp_css_env css_env;
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8e5e883b50..ef555054fdbf 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -557,7 +557,6 @@ static int atomisp_enum_input(struct file *file, void=
 *fh,
>         struct video_device *vdev =3D video_devdata(file);
>         struct atomisp_device *isp =3D video_get_drvdata(vdev);
>         int index =3D input->index;
> -       struct v4l2_subdev *motor;
> =20
>         if (index >=3D isp->input_cnt)
>                 return -EINVAL;
> @@ -569,28 +568,6 @@ static int atomisp_enum_input(struct file *file, voi=
d *fh,
>         strscpy(input->name, isp->inputs[index].camera->name,
>                 sizeof(input->name));
> =20
> -       /*
> -        * HACK: append actuator's name to sensor's
> -        * As currently userspace can't talk directly to subdev nodes, th=
is
> -        * ioctl is the only way to enum inputs + possible external actua=
tors
> -        * for 3A tuning purpose.
> -        */
> -       if (!IS_ISP2401)
> -               motor =3D isp->inputs[index].motor;
> -       else
> -               motor =3D isp->motor;
> -
> -       if (motor && strlen(motor->name) > 0) {
> -               const int cur_len =3D strlen(input->name);
> -               const int max_size =3D sizeof(input->name) - cur_len - 1;
> -
> -               if (max_size > 1) {
> -                       input->name[cur_len] =3D '+';
> -                       strscpy(&input->name[cur_len + 1],
> -                               motor->name, max_size);
> -               }
> -       }
> -
>         input->type =3D V4L2_INPUT_TYPE_CAMERA;
>         input->index =3D index;
>         input->reserved[0] =3D isp->inputs[index].type;
> @@ -629,7 +606,6 @@ static int atomisp_s_input(struct file *file, void *f=
h, unsigned int input)
>         struct atomisp_video_pipe *pipe =3D atomisp_to_video_pipe(vdev);
>         struct atomisp_sub_device *asd =3D pipe->asd;
>         struct v4l2_subdev *camera =3D NULL;
> -       struct v4l2_subdev *motor;
>         int ret;
> =20
>         ret =3D atomisp_pipe_check(pipe, true);
> @@ -666,17 +642,6 @@ static int atomisp_s_input(struct file *file, void *=
fh, unsigned int input)
>                 return ret;
>         }
> =20
> -       if (!IS_ISP2401) {
> -               motor =3D isp->inputs[input].motor;
> -       } else {
> -               motor =3D isp->motor;
> -               if (motor)
> -                       ret =3D v4l2_subdev_call(motor, core, s_power, 1);
> -       }
> -
> -       if (motor)
> -               ret =3D v4l2_subdev_call(motor, core, init, 1);
> -
>         asd->input_curr =3D input;
>         /* mark this camera is used by the current stream */
>         isp->inputs[input].asd =3D asd;
> @@ -1433,26 +1398,8 @@ static int atomisp_s_ctrl(struct file *file, void =
*fh,
>  static int atomisp_queryctl(struct file *file, void *fh,
>                             struct v4l2_queryctrl *qc)
>  {
> -       int i, ret =3D -EINVAL;
>         struct video_device *vdev =3D video_devdata(file);
> -       struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
> -       struct atomisp_device *isp =3D video_get_drvdata(vdev);
> -
> -       switch (qc->id) {
> -       case V4L2_CID_FOCUS_ABSOLUTE:
> -       case V4L2_CID_FOCUS_RELATIVE:
> -       case V4L2_CID_FOCUS_STATUS:
> -               if (!IS_ISP2401) {
> -                       return v4l2_queryctrl(isp->inputs[asd->input_curr=
].camera->
> -                                           ctrl_handler, qc);
> -               }
> -               /* ISP2401 */
> -               if (isp->motor)
> -                       return v4l2_queryctrl(isp->motor->ctrl_handler, q=
c);
> -               else
> -                       return v4l2_queryctrl(isp->inputs[asd->input_curr=
].
> -                                             camera->ctrl_handler, qc);
> -       }
> +       int i, ret =3D -EINVAL;
> =20
>         if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
>                 return ret;
> @@ -1478,16 +1425,10 @@ static int atomisp_camera_g_ext_ctrls(struct file=
 *file, void *fh,
>         struct video_device *vdev =3D video_devdata(file);
>         struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
>         struct atomisp_device *isp =3D video_get_drvdata(vdev);
> -       struct v4l2_subdev *motor;
>         struct v4l2_control ctrl;
>         int i;
>         int ret =3D 0;
> =20
> -       if (!IS_ISP2401)
> -               motor =3D isp->inputs[asd->input_curr].motor;
> -       else
> -               motor =3D isp->motor;
> -
>         for (i =3D 0; i < c->count; i++) {
>                 ctrl.id =3D c->controls[i].id;
>                 ctrl.value =3D c->controls[i].value;
> @@ -1509,13 +1450,6 @@ static int atomisp_camera_g_ext_ctrls(struct file =
*file, void *fh,
>                             v4l2_g_ctrl(isp->inputs[asd->input_curr].came=
ra->
>                                         ctrl_handler, &ctrl);
>                         break;
> -               case V4L2_CID_FOCUS_ABSOLUTE:
> -               case V4L2_CID_FOCUS_RELATIVE:
> -               case V4L2_CID_FOCUS_STATUS:
> -               case V4L2_CID_FOCUS_AUTO:
> -                       if (motor)
> -                               ret =3D v4l2_g_ctrl(motor->ctrl_handler, =
&ctrl);
> -                       break;
>                 case V4L2_CID_FLASH_STATUS:
>                 case V4L2_CID_FLASH_INTENSITY:
>                 case V4L2_CID_FLASH_TORCH_INTENSITY:
> @@ -1584,16 +1518,10 @@ static int atomisp_camera_s_ext_ctrls(struct file=
 *file, void *fh,
>         struct video_device *vdev =3D video_devdata(file);
>         struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
>         struct atomisp_device *isp =3D video_get_drvdata(vdev);
> -       struct v4l2_subdev *motor;
>         struct v4l2_control ctrl;
>         int i;
>         int ret =3D 0;
> =20
> -       if (!IS_ISP2401)
> -               motor =3D isp->inputs[asd->input_curr].motor;
> -       else
> -               motor =3D isp->motor;
> -
>         for (i =3D 0; i < c->count; i++) {
>                 struct v4l2_ctrl *ctr;
> =20
> @@ -1616,18 +1544,6 @@ static int atomisp_camera_s_ext_ctrls(struct file =
*file, void *fh,
>                                           isp->inputs[asd->input_curr].ca=
mera->
>                                           ctrl_handler, &ctrl);
>                         break;
> -               case V4L2_CID_FOCUS_ABSOLUTE:
> -               case V4L2_CID_FOCUS_RELATIVE:
> -               case V4L2_CID_FOCUS_STATUS:
> -               case V4L2_CID_FOCUS_AUTO:
> -                       if (motor)
> -                               ret =3D v4l2_s_ctrl(NULL, motor->ctrl_han=
dler,
> -                                                 &ctrl);
> -                       else
> -                               ret =3D v4l2_s_ctrl(NULL,
> -                                                 isp->inputs[asd->input_=
curr].
> -                                                 camera->ctrl_handler, &=
ctrl);
> -                       break;
>                 case V4L2_CID_FLASH_STATUS:
>                 case V4L2_CID_FLASH_INTENSITY:
>                 case V4L2_CID_FLASH_TORCH_INTENSITY:
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/s=
taging/media/atomisp/pci/atomisp_v4l2.c
> index f736e54c7df3..1a936dbe8eb4 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -823,13 +823,6 @@ static int atomisp_subdev_probe(struct atomisp_devic=
e *isp)
>                         isp->sensor_lanes[mipi_port] =3D subdevs->lanes;
>                         isp->sensor_subdevs[subdevs->port] =3D subdevs->s=
ubdev;
>                         break;
> -               case CAMERA_MOTOR:
> -                       if (isp->motor) {
> -                               dev_warn(isp->dev, "too many atomisp moto=
rs\n");
> -                               continue;
> -                       }
> -                       isp->motor =3D subdevs->subdev;
> -                       break;
>                 case LED_FLASH:
>                         if (isp->flash) {
>                                 dev_warn(isp->dev, "too many atomisp flas=
h devices\n");
> @@ -1066,14 +1059,6 @@ int atomisp_register_device_nodes(struct atomisp_d=
evice *isp)
> =20
>                 atomisp_init_sensor(input);
> =20
> -               /*
> -                * HACK: Currently VCM belongs to primary sensor only, bu=
t correct
> -                * approach must be to acquire from platform code which s=
ensor
> -                * owns it.
> -                */
> -               if (i =3D=3D ATOMISP_CAMERA_PORT_PRIMARY)
> -                       input->motor =3D isp->motor;
> -
>                 err =3D media_create_pad_link(&input->camera->entity, 0,
>                                             &isp->csi2_port[i].subdev.ent=
ity,
>                                             CSI2_PAD_SINK,
> --=20
> 2.43.0
>

