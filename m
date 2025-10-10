Return-Path: <linux-media+bounces-44167-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E63BCC835
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 12:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1730F4F3B76
	for <lists+linux-media@lfdr.de>; Fri, 10 Oct 2025 10:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0EF2820DB;
	Fri, 10 Oct 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XTsQnevZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FE4222587
	for <linux-media@vger.kernel.org>; Fri, 10 Oct 2025 10:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091698; cv=none; b=M5fl+C7xkeR6/WDHv8t58hs+jTuN2eGsZm9UETdARvWlZ3gP+/pgT6pO/0iADuaeEXngUBP+AiYLr/FpdXscQICHlgbtcsePJY2TARI3e/7uNxT1Q0AgJ0GT/EzoG+hraXWlewC2HYsqTtFcwbQAke2q+NgaAJQ81pV1VrlqGYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091698; c=relaxed/simple;
	bh=QEcKGCZbEZZE/R/DZ0/hOcVo7miNIcrLva2zViQDY7Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nCaN2xx22tiAIRjRBSoxnrPt0oDi3vWlL8GSj+vAA6737ZpU1VmNoy+dy13RphalwLhPpmkR1/QBispfBfToJiyTkRhraqdoVlXiQblhVj3oQHVTP1ZuS1Zr+HvYXroJBlBXu6zJTcRqcM/ywZkNB39SpQwC5pv7FlpSSvPJ5Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=fail (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XTsQnevZ reason="signature verification failed"; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2a00:6020:448c:6c00:22d7:7fc4:7ab4:3e13])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EFBFE2C5;
	Fri, 10 Oct 2025 12:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760091598;
	bh=QEcKGCZbEZZE/R/DZ0/hOcVo7miNIcrLva2zViQDY7Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XTsQnevZKSczancY3Xj/lGmpAO3D9/S1nHzOaHD4drn7Xairt+5YXSz4dNKyPKqs5
	 Y5nzJCvBHCZ/Tr6gL5tY6NFzVpPu9EwCR1hDwVStBcpuvkWXzWsBxVxWdzJ3zHn1N5
	 oS50MS60b5y4iQB6GSV9F5ArRJoUr46JlhBUJdTU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250825095107.1332313-44-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com> <20250825095107.1332313-44-sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v11 43/66] media: uapi: Add V4L2_CID_BINNING control for binning configuration
From: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, =?utf-8?q?Andr=C3=A9?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
 , Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Date: Fri, 10 Oct 2025 12:21:30 +0200
Message-ID: <176009169065.211618.2319574445990293219@localhost>
User-Agent: alot/0.12.dev8+g2c003385c862.d20250602

Hi Sakari,

Quoting Sakari Ailus (2025-08-25 11:50:44)
> Add V4L2_CID_BINNING control for configuring binning and enumerating a
> camera sensor's binning capabilities. The control combines horizontal and
> vertical binning into a single control as the two are generally related.
>=20
> New drivers should use this control to configure binning.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst           | 12 ++++++++
>  .../media/v4l/ext-ctrls-camera.rst            | 29 +++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 ++
>  include/uapi/linux/v4l2-controls.h            |  1 +
>  4 files changed, 44 insertions(+)
>=20
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 39f3f91c6733..ef1f51862980 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -120,6 +120,18 @@ values programmed by the register sequences. The def=
ault values of these
>  controls shall be 0 (disabled). Especially these controls shall not be i=
nverted,
>  independently of the sensor's mounting rotation.
> =20
> +Binning
> +-------
> +
> +Binning has traditionally been configured using :ref:`the compose select=
ion
> +rectangle <v4l2-selection-targets-table>`. The :ref:`V4L2_CID_BINNING
> +<v4l2-cid-camera-sensor-binning>` is also available for binning configur=
ation and
> +users should use it when it's available. Drivers supporting the control =
shall
> +also support the compose rectangle, albeit the rectangle may be read-onl=
y when
> +the control is present.
> +
> +Binning isn't affected by flipping.
> +
>  .. _media_using_camera_sensor_drivers_embedded_data:
> =20
>  Embedded data
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b=
/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> index cdc515c60468..18b484ff5d75 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
> @@ -672,3 +672,32 @@ enum v4l2_scene_mode -
> =20
>      As modes differ for each sensor, menu items are not standardized by =
this
>      control and are left to the programmer.
> +
> +.. _v4l2-cid-camera-sensor-binning:
> +
> +``V4L2_CID_BINNING_FACTORS (integer menu)``
> +
> +    Horizontal and vertical binning factors. Binning combines several
> +    horizontal, vertical or both pixel values into a single pixel. It is=
 a way
> +    to scale an image. Binning typically produces fairly good quality ou=
tput.
> +
> +    Determines both horizontal and vertical binning factors for a camera
> +    sensor. The values are encoded in the following way:
> +
> +.. flat-table::
> +    :header-rows:  1
> +    :stub-columns: 0
> +
> +    * - Bits
> +      - Synopsis
> +    * - 48--63
> +      - Horizontal binning numerator.
> +    * - 32--47
> +      - Horizontal binning denominator.
> +    * - 16--31
> +      - Vertical binning numerator.
> +    * - 0--15
> +      - Vertical binning denominator.

I know I'm late to the game, but I'd like to mention it anyways. I
expect there will be usecases where we'd like to distinguish between
different binning strategies (e.g. summing to increase SNR and
weighting). But I believe it will be difficult to actually standardize
on specific binning strategies as these are very sensor specific. On the
other hand the available strategies will be tied to the binning modes.
What about sparing some bits to encode the binning strategy in a sensor
specific manner?

I don't think we'll ever need more than 1 byte per
numerator/denominator. We could even spend 12 bits per value, and would
still have 16 bits left for additional information.

What do you think?

Best regards,
Stefan

> +
> +For instance, a value of ``0x0001000300020003`` indicates binning by 3
> +(horizontally) * 3/2 (vertically).
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index a7ea380de5ee..5e1c28850e87 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1087,6 +1087,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>         case V4L2_CID_CAMERA_ORIENTATION:       return "Camera Orientatio=
n";
>         case V4L2_CID_CAMERA_SENSOR_ROTATION:   return "Camera Sensor Rot=
ation";
>         case V4L2_CID_HDR_SENSOR_MODE:          return "HDR Sensor Mode";
> +       case V4L2_CID_BINNING_FACTORS:          return "Binning Factors";
> =20
>         /* FM Radio Modulator controls */
>         /* Keep the order of the 'case's the same as in v4l2-controls.h! =
*/
> @@ -1427,6 +1428,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum=
 v4l2_ctrl_type *type,
>         case V4L2_CID_HDR_SENSOR_MODE:
>                 *type =3D V4L2_CTRL_TYPE_MENU;
>                 break;
> +       case V4L2_CID_BINNING_FACTORS:
>         case V4L2_CID_LINK_FREQ:
>                 *type =3D V4L2_CTRL_TYPE_INTEGER_MENU;
>                 break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index e25c9d669687..90f47f4780e5 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1101,6 +1101,7 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_CAMERA_SENSOR_ROTATION                (V4L2_CID_CAMERA_=
CLASS_BASE+35)
> =20
>  #define V4L2_CID_HDR_SENSOR_MODE               (V4L2_CID_CAMERA_CLASS_BA=
SE+36)
> +#define V4L2_CID_BINNING_FACTORS               (V4L2_CID_CAMERA_CLASS_BA=
SE+37)
> =20
>  /* FM Modulator class control IDs */
> =20
> --=20
> 2.47.2
>=20
>

