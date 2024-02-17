Return-Path: <linux-media+bounces-5348-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D67F859069
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 16:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E939B28366E
	for <lists+linux-media@lfdr.de>; Sat, 17 Feb 2024 15:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECBE77C0B6;
	Sat, 17 Feb 2024 15:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NolDIweB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0D7C0AF
	for <linux-media@vger.kernel.org>; Sat, 17 Feb 2024 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708182824; cv=none; b=oq+N/a5tZElmcTC1Rw/4qOnbjWLwP1rvLqzE6c81WIcJynz4BZ1oCpGqoFh6cBGmY4nhX6/RnpWHnCIpAKtfxdBOwCzhQmI36pnNalIaOCNzXcmiqsUV52NCVSfSufASSlZKUy3soadkmplR5KP4LXtZyFMO6lDsTIz0d6Wbtmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708182824; c=relaxed/simple;
	bh=RlKHxaN1+rnIhGG537FX13k5wppJ8tU7mfa80lRmjhI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=iDNZPG3bEvwDKg6Udl+0nE2BjQIM7VXnCVhZaH7vgrnwhS8/LQ1MKj0eiDGMQZ6Ujb2cQpWDd8LANMTEQlkJE8ObDjK9sG/bfFzXE2o8LDAzsehjwpFD6EL11oEPCO+iW5hqlRNAZOqJRRG27pfuiV2cgaeu0i/atH+uVmQSDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NolDIweB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9FAB96B3;
	Sat, 17 Feb 2024 16:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708182815;
	bh=RlKHxaN1+rnIhGG537FX13k5wppJ8tU7mfa80lRmjhI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NolDIweBXrTkbb6sQR1cx3qFSPyf0HlFdYvo1L0woVr0ZdYgr0892Y4AnLu2VHsqW
	 t473rCI0kqHfxM7QEbmHMBJDYbaY/bojRC9DqdzTvPbc5TzKu4HNvpnBDtgKOhmgKl
	 jaEh7ksqLdgt+ujyQ//MjwhSq4wOq04gVVqS8jZE=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240217112438.15240-5-hdegoede@redhat.com>
References: <20240217112438.15240-1-hdegoede@redhat.com> <20240217112438.15240-5-hdegoede@redhat.com>
Subject: Re: [PATCH 4/9] media: atomisp: Remove ISP controls which get passed through to the camera
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 17 Feb 2024 15:13:38 +0000
Message-ID: <170818281837.1206667.12570775958898414938@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Hans de Goede (2024-02-17 11:24:33)
> Drop all ISP controls and ioctls which just get passed through
> to the camera subdev. Instead these calls should be done directly
> at the sensor subdev.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../media/atomisp/include/linux/atomisp.h     |  21 --
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 248 ------------------
>  2 files changed, 269 deletions(-)
>=20
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/driv=
ers/staging/media/atomisp/include/linux/atomisp.h
> index d9a7a599038d..b2735a008052 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -837,9 +837,6 @@ enum atomisp_burst_capture_options {
>  #define ATOMISP_IOC_S_PARAMETERS \
>         _IOW('v', BASE_VIDIOC_PRIVATE + 32, struct atomisp_parameters)
> =20
> -#define ATOMISP_IOC_EXT_ISP_CTRL \
> -       _IOWR('v', BASE_VIDIOC_PRIVATE + 35, struct atomisp_ext_isp_ctrl)
> -
>  #define ATOMISP_IOC_EXP_ID_UNLOCK \
>         _IOW('v', BASE_VIDIOC_PRIVATE + 36, int)
> =20
> @@ -909,19 +906,6 @@ enum atomisp_burst_capture_options {
>  /* Set the flash mode (see enum atomisp_flash_mode) */
>  #define V4L2_CID_FLASH_MODE                (V4L2_CID_CAMERA_LASTP1 + 10)
> =20
> -/* VCM slew control */
> -#define V4L2_CID_VCM_SLEW                  (V4L2_CID_CAMERA_LASTP1 + 11)
> -/* VCM step time */
> -#define V4L2_CID_VCM_TIMING                (V4L2_CID_CAMERA_LASTP1 + 12)
> -
> -/* number of frames to skip at stream start */
> -#define V4L2_CID_G_SKIP_FRAMES            (V4L2_CID_CAMERA_LASTP1 + 17)
> -
> -/* Query sensor's 2A status */
> -#define V4L2_CID_2A_STATUS                 (V4L2_CID_CAMERA_LASTP1 + 18)
> -#define V4L2_2A_STATUS_AE_READY            BIT(0)
> -#define V4L2_2A_STATUS_AWB_READY           BIT(1)
> -
>  #define V4L2_CID_RUN_MODE                      (V4L2_CID_CAMERA_LASTP1 +=
 20)
>  #define ATOMISP_RUN_MODE_VIDEO                 1
>  #define ATOMISP_RUN_MODE_STILL_CAPTURE         2
> @@ -952,11 +936,6 @@ enum atomisp_burst_capture_options {
>  /* Disable digital zoom */
>  #define V4L2_CID_DISABLE_DZ            (V4L2_CID_CAMERA_LASTP1 + 32)
> =20
> -#define V4L2_CID_TEST_PATTERN_COLOR_R  (V4L2_CID_CAMERA_LASTP1 + 33)
> -#define V4L2_CID_TEST_PATTERN_COLOR_GR (V4L2_CID_CAMERA_LASTP1 + 34)
> -#define V4L2_CID_TEST_PATTERN_COLOR_GB (V4L2_CID_CAMERA_LASTP1 + 35)
> -#define V4L2_CID_TEST_PATTERN_COLOR_B  (V4L2_CID_CAMERA_LASTP1 + 36)
> -
>  #define V4L2_CID_ATOMISP_SELECT_ISP_VERSION    (V4L2_CID_CAMERA_LASTP1 +=
 38)
> =20
>  #define V4L2_BUF_FLAG_BUFFER_INVALID       0x0400
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/=
staging/media/atomisp/pci/atomisp_ioctl.c
> index ef555054fdbf..74cf055cb09b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -82,15 +82,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] =3D {
>                 .step =3D 1,
>                 .default_value =3D 0x00,
>         },
> -       {
> -               .id =3D V4L2_CID_POWER_LINE_FREQUENCY,
> -               .type =3D V4L2_CTRL_TYPE_MENU,
> -               .name =3D "Light frequency filter",
> -               .minimum =3D 1,
> -               .maximum =3D 2,
> -               .step =3D 1,
> -               .default_value =3D 1,
> -       },
>         {
>                 .id =3D V4L2_CID_COLORFX,
>                 .type =3D V4L2_CTRL_TYPE_INTEGER,
> @@ -100,15 +91,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] =3D {
>                 .step =3D 1,
>                 .default_value =3D 0,
>         },
> -       {
> -               .id =3D V4L2_CID_COLORFX_CBCR,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Image Color Effect CbCr",
> -               .minimum =3D 0,
> -               .maximum =3D 0xffff,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
>         {
>                 .id =3D V4L2_CID_ATOMISP_BAD_PIXEL_DETECTION,
>                 .type =3D V4L2_CTRL_TYPE_INTEGER,
> @@ -172,142 +154,6 @@ static struct v4l2_queryctrl ci_v4l2_controls[] =3D=
 {
>                 .step =3D 1,
>                 .default_value =3D 1,
>         },
> -       {
> -               .id =3D V4L2_CID_2A_STATUS,
> -               .type =3D V4L2_CTRL_TYPE_BITMASK,
> -               .name =3D "AE and AWB status",
> -               .minimum =3D 0,
> -               .maximum =3D V4L2_2A_STATUS_AE_READY | V4L2_2A_STATUS_AWB=
_READY,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_EXPOSURE,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "exposure",
> -               .minimum =3D -4,
> -               .maximum =3D 4,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_EXPOSURE_ZONE_NUM,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "one-time exposure zone number",
> -               .minimum =3D 0x0,
> -               .maximum =3D 0xffff,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_EXPOSURE_AUTO_PRIORITY,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Exposure auto priority",
> -               .minimum =3D V4L2_EXPOSURE_AUTO,
> -               .maximum =3D V4L2_EXPOSURE_APERTURE_PRIORITY,
> -               .step =3D 1,
> -               .default_value =3D V4L2_EXPOSURE_AUTO,
> -       },
> -       {
> -               .id =3D V4L2_CID_SCENE_MODE,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "scene mode",
> -               .minimum =3D 0,
> -               .maximum =3D 13,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_ISO_SENSITIVITY,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "iso",
> -               .minimum =3D -4,
> -               .maximum =3D 4,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_ISO_SENSITIVITY_AUTO,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "iso mode",
> -               .minimum =3D V4L2_ISO_SENSITIVITY_MANUAL,
> -               .maximum =3D V4L2_ISO_SENSITIVITY_AUTO,
> -               .step =3D 1,
> -               .default_value =3D V4L2_ISO_SENSITIVITY_AUTO,
> -       },
> -       {
> -               .id =3D V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "white balance",
> -               .minimum =3D 0,
> -               .maximum =3D 9,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_EXPOSURE_METERING,
> -               .type =3D V4L2_CTRL_TYPE_MENU,
> -               .name =3D "metering",
> -               .minimum =3D 0,
> -               .maximum =3D 3,
> -               .step =3D 1,
> -               .default_value =3D 1,
> -       },
> -       {
> -               .id =3D V4L2_CID_3A_LOCK,
> -               .type =3D V4L2_CTRL_TYPE_BITMASK,
> -               .name =3D "3a lock",
> -               .minimum =3D 0,
> -               .maximum =3D V4L2_LOCK_EXPOSURE | V4L2_LOCK_WHITE_BALANCE
> -               | V4L2_LOCK_FOCUS,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_TEST_PATTERN,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Test Pattern",
> -               .minimum =3D 0,
> -               .maximum =3D 0xffff,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_TEST_PATTERN_COLOR_R,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Test Pattern Solid Color R",
> -               .minimum =3D INT_MIN,
> -               .maximum =3D INT_MAX,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_TEST_PATTERN_COLOR_GR,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Test Pattern Solid Color GR",
> -               .minimum =3D INT_MIN,
> -               .maximum =3D INT_MAX,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_TEST_PATTERN_COLOR_GB,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Test Pattern Solid Color GB",
> -               .minimum =3D INT_MIN,
> -               .maximum =3D INT_MAX,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
> -       {
> -               .id =3D V4L2_CID_TEST_PATTERN_COLOR_B,
> -               .type =3D V4L2_CTRL_TYPE_INTEGER,
> -               .name =3D "Test Pattern Solid Color B",
> -               .minimum =3D INT_MIN,
> -               .maximum =3D INT_MAX,
> -               .step =3D 1,
> -               .default_value =3D 0,
> -       },
>  };
> =20
>  static const u32 ctrls_num =3D ARRAY_SIZE(ci_v4l2_controls);
> @@ -1248,7 +1094,6 @@ static int atomisp_g_ctrl(struct file *file, void *=
fh,
>  {
>         struct video_device *vdev =3D video_devdata(file);
>         struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
> -       struct atomisp_device *isp =3D video_get_drvdata(vdev);
>         int i, ret =3D -EINVAL;
> =20
>         for (i =3D 0; i < ctrls_num; i++) {
> @@ -1262,27 +1107,6 @@ static int atomisp_g_ctrl(struct file *file, void =
*fh,
>                 return ret;
> =20
>         switch (control->id) {
> -       case V4L2_CID_IRIS_ABSOLUTE:
> -       case V4L2_CID_EXPOSURE_ABSOLUTE:
> -       case V4L2_CID_2A_STATUS:
> -       case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
> -       case V4L2_CID_EXPOSURE:
> -       case V4L2_CID_EXPOSURE_AUTO:
> -       case V4L2_CID_SCENE_MODE:
> -       case V4L2_CID_ISO_SENSITIVITY:
> -       case V4L2_CID_ISO_SENSITIVITY_AUTO:
> -       case V4L2_CID_CONTRAST:
> -       case V4L2_CID_SATURATION:
> -       case V4L2_CID_SHARPNESS:
> -       case V4L2_CID_3A_LOCK:
> -       case V4L2_CID_EXPOSURE_ZONE_NUM:
> -       case V4L2_CID_TEST_PATTERN:
> -       case V4L2_CID_TEST_PATTERN_COLOR_R:
> -       case V4L2_CID_TEST_PATTERN_COLOR_GR:
> -       case V4L2_CID_TEST_PATTERN_COLOR_GB:
> -       case V4L2_CID_TEST_PATTERN_COLOR_B:
> -               return v4l2_g_ctrl(isp->inputs[asd->input_curr].camera->
> -                                  ctrl_handler, control);
>         case V4L2_CID_COLORFX:
>                 ret =3D atomisp_color_effect(asd, 0, &control->value);
>                 break;
> @@ -1322,7 +1146,6 @@ static int atomisp_s_ctrl(struct file *file, void *=
fh,
>  {
>         struct video_device *vdev =3D video_devdata(file);
>         struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
> -       struct atomisp_device *isp =3D video_get_drvdata(vdev);
>         int i, ret =3D -EINVAL;
> =20
>         for (i =3D 0; i < ctrls_num; i++) {
> @@ -1336,28 +1159,6 @@ static int atomisp_s_ctrl(struct file *file, void =
*fh,
>                 return ret;
> =20
>         switch (control->id) {
> -       case V4L2_CID_AUTO_N_PRESET_WHITE_BALANCE:
> -       case V4L2_CID_EXPOSURE:
> -       case V4L2_CID_EXPOSURE_AUTO:
> -       case V4L2_CID_EXPOSURE_AUTO_PRIORITY:
> -       case V4L2_CID_SCENE_MODE:
> -       case V4L2_CID_ISO_SENSITIVITY:
> -       case V4L2_CID_ISO_SENSITIVITY_AUTO:
> -       case V4L2_CID_POWER_LINE_FREQUENCY:
> -       case V4L2_CID_EXPOSURE_METERING:
> -       case V4L2_CID_CONTRAST:
> -       case V4L2_CID_SATURATION:
> -       case V4L2_CID_SHARPNESS:
> -       case V4L2_CID_3A_LOCK:
> -       case V4L2_CID_COLORFX_CBCR:
> -       case V4L2_CID_TEST_PATTERN:
> -       case V4L2_CID_TEST_PATTERN_COLOR_R:
> -       case V4L2_CID_TEST_PATTERN_COLOR_GR:
> -       case V4L2_CID_TEST_PATTERN_COLOR_GB:
> -       case V4L2_CID_TEST_PATTERN_COLOR_B:
> -               return v4l2_s_ctrl(NULL,
> -                                  isp->inputs[asd->input_curr].camera->
> -                                  ctrl_handler, control);

Looks like a reasonable clean up from that.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>         case V4L2_CID_COLORFX:
>                 ret =3D atomisp_color_effect(asd, 1, &control->value);
>                 break;
> @@ -1398,7 +1199,6 @@ static int atomisp_s_ctrl(struct file *file, void *=
fh,
>  static int atomisp_queryctl(struct file *file, void *fh,
>                             struct v4l2_queryctrl *qc)
>  {
> -       struct video_device *vdev =3D video_devdata(file);
>         int i, ret =3D -EINVAL;
> =20
>         if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
> @@ -1433,23 +1233,6 @@ static int atomisp_camera_g_ext_ctrls(struct file =
*file, void *fh,
>                 ctrl.id =3D c->controls[i].id;
>                 ctrl.value =3D c->controls[i].value;
>                 switch (ctrl.id) {
> -               case V4L2_CID_EXPOSURE_ABSOLUTE:
> -               case V4L2_CID_EXPOSURE_AUTO:
> -               case V4L2_CID_IRIS_ABSOLUTE:
> -               case V4L2_CID_3A_LOCK:
> -               case V4L2_CID_TEST_PATTERN:
> -               case V4L2_CID_TEST_PATTERN_COLOR_R:
> -               case V4L2_CID_TEST_PATTERN_COLOR_GR:
> -               case V4L2_CID_TEST_PATTERN_COLOR_GB:
> -               case V4L2_CID_TEST_PATTERN_COLOR_B:
> -                       /*
> -                        * Exposure related control will be handled by se=
nsor
> -                        * driver
> -                        */
> -                       ret =3D
> -                           v4l2_g_ctrl(isp->inputs[asd->input_curr].came=
ra->
> -                                       ctrl_handler, &ctrl);
> -                       break;
>                 case V4L2_CID_FLASH_STATUS:
>                 case V4L2_CID_FLASH_INTENSITY:
>                 case V4L2_CID_FLASH_TORCH_INTENSITY:
> @@ -1466,11 +1249,6 @@ static int atomisp_camera_g_ext_ctrls(struct file =
*file, void *fh,
>                 case V4L2_CID_ZOOM_ABSOLUTE:
>                         ret =3D atomisp_digital_zoom(asd, 0, &ctrl.value);
>                         break;
> -               case V4L2_CID_G_SKIP_FRAMES:
> -                       ret =3D v4l2_subdev_call(
> -                                 isp->inputs[asd->input_curr].camera,
> -                                 sensor, g_skip_frames, (u32 *)&ctrl.val=
ue);
> -                       break;
>                 default:
>                         ret =3D -EINVAL;
>                 }
> @@ -1528,22 +1306,6 @@ static int atomisp_camera_s_ext_ctrls(struct file =
*file, void *fh,
>                 ctrl.id =3D c->controls[i].id;
>                 ctrl.value =3D c->controls[i].value;
>                 switch (ctrl.id) {
> -               case V4L2_CID_EXPOSURE_ABSOLUTE:
> -               case V4L2_CID_EXPOSURE_AUTO:
> -               case V4L2_CID_EXPOSURE_METERING:
> -               case V4L2_CID_IRIS_ABSOLUTE:
> -               case V4L2_CID_VCM_TIMING:
> -               case V4L2_CID_VCM_SLEW:
> -               case V4L2_CID_3A_LOCK:
> -               case V4L2_CID_TEST_PATTERN:
> -               case V4L2_CID_TEST_PATTERN_COLOR_R:
> -               case V4L2_CID_TEST_PATTERN_COLOR_GR:
> -               case V4L2_CID_TEST_PATTERN_COLOR_GB:
> -               case V4L2_CID_TEST_PATTERN_COLOR_B:
> -                       ret =3D v4l2_s_ctrl(NULL,
> -                                         isp->inputs[asd->input_curr].ca=
mera->
> -                                         ctrl_handler, &ctrl);
> -                       break;
>                 case V4L2_CID_FLASH_STATUS:
>                 case V4L2_CID_FLASH_INTENSITY:
>                 case V4L2_CID_FLASH_TORCH_INTENSITY:
> @@ -1692,7 +1454,6 @@ static long atomisp_vidioc_default(struct file *fil=
e, void *fh,
>                                    bool valid_prio, unsigned int cmd, voi=
d *arg)
>  {
>         struct video_device *vdev =3D video_devdata(file);
> -       struct atomisp_device *isp =3D video_get_drvdata(vdev);
>         struct atomisp_sub_device *asd =3D atomisp_to_video_pipe(vdev)->a=
sd;
>         int err;
> =20
> @@ -1839,11 +1600,6 @@ static long atomisp_vidioc_default(struct file *fi=
le, void *fh,
>                 err =3D atomisp_fixed_pattern_table(asd, arg);
>                 break;
> =20
> -       case ATOMISP_IOC_S_EXPOSURE:
> -               err =3D v4l2_subdev_call(isp->inputs[asd->input_curr].cam=
era,
> -                                      core, ioctl, cmd, arg);
> -               break;
> -
>         case ATOMISP_IOC_S_ISP_SHD_TAB:
>                 err =3D atomisp_set_shading_table(asd, arg);
>                 break;
> @@ -1860,10 +1616,6 @@ static long atomisp_vidioc_default(struct file *fi=
le, void *fh,
>                 err =3D atomisp_set_parameters(vdev, arg);
>                 break;
> =20
> -       case ATOMISP_IOC_EXT_ISP_CTRL:
> -               err =3D v4l2_subdev_call(isp->inputs[asd->input_curr].cam=
era,
> -                                      core, ioctl, cmd, arg);
> -               break;
>         case ATOMISP_IOC_EXP_ID_UNLOCK:
>                 err =3D atomisp_exp_id_unlock(asd, arg);
>                 break;
> --=20
> 2.43.0
>

