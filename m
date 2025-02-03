Return-Path: <linux-media+bounces-25594-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 788EFA25E6F
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 16:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C10771680A7
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 15:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE46205AA3;
	Mon,  3 Feb 2025 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBXxYOvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A942208A7
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595681; cv=none; b=XVkM/Rbjn+TdhFBUGkw8qc0N1+Vqhv/60lxGm5l5GFgZ+ATsaLbApkTU1o8yCGnQkKUxia45JgGy0/P6U3Hto8DvHz6/itmxLRUNQGJuMucM2SfRF0AEfAiYHbLomHWghGgz3jNTcA+qe2mCpDHc8TDT1y28ffVHBqkQgsJ0C/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595681; c=relaxed/simple;
	bh=xVYYrhuNL+G1ob06MwYKtYQ0J/CB2y07jhecYnHhAtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyt4wcIraXQ2cBBPrnBYVZGODRxe2ZLbVMuyJwqxhx8QyNuIBtWePQ0TGui53RqG5VLs7nj9iQdTIUpNIfhsocb7yXhSpn8UmDV/6pFCckhe279QHKFWohPxtXsiJVGj0o4NrGCkc3aCJr6sYPFzJo8x2eremPD1mURJcQlsCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBXxYOvQ; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8f99cb0d9so37325816d6.0
        for <linux-media@vger.kernel.org>; Mon, 03 Feb 2025 07:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595678; x=1739200478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45aHTHfgQP3zXdHwGx8iwx1VONBYNClfS5dpsMRNKaU=;
        b=BBXxYOvQU5j6AYbpxiotfu5QMS32k5sviA+sD9n16nKx2203UIMB32kFmEj2Ts6XVv
         j3vYLZJIJ0LC1KmVzfQtcl1emThWISJv8gXYJKBo9AxSBMDJKGCtvtV5SKPAJ6C2KOeq
         8ug1wvn2kdLgl4RxvYgdxGeWBJ+N3pP1B+kSoqDYjRAg5OqEe8uWwz+ZkMZL23R8/mUN
         ocLAW7g1m04ZZcdHqhYPtKNqd32NJ5lkLT7OZjE5Eichcy079/Pa9z1s1cIi5+iVFPdo
         lvvRq562p3+066eWbY+wTT6ft0uv9frml63N2cMAYt5dZbkhTNL/nhhM2KtVD+pzX1Ec
         EFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595678; x=1739200478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45aHTHfgQP3zXdHwGx8iwx1VONBYNClfS5dpsMRNKaU=;
        b=UwcgAgZqM5K7BU8QNGWVnf5rRInn/qhGuauMUflSsn5a9G4qzJudDD7VrineH2YjWL
         7hJehkyNoi9DI7Z9hdPQ+BxTss5na+Km1pEkqWNmdeYMjUAbPd52NyfzAESyFdMSu2Iz
         9KzAd+IYcQL8iqQIH9Uhw5X4ZBAwqJqDO3ZCN+QXqnKIwQ6gnqya/6zEuAvFefsj3uRu
         mF+/dpzPQkxw9nWa2wihXegd+SaIbbgOBdRt8L5JAUxjSwfkcgxd9Y4fTEFidVopkOnm
         xEbjK+1DJeNz+yJazEJvT548yO5MhQ+dn81TKhdXtBZi6CRkOZM9T4sVqfHfnx7fxvgm
         8OAw==
X-Gm-Message-State: AOJu0YxCNuJ7nyGzcP/VrTvkwD2vPz0iB+eFvVhM347MuTLuq0jSUR+L
	aFwXjaslmtahC9WeIqg6kMPXskZ+P6s1lvNwMtuaPz4KiXXapvQRajJX17mNlh/F59ctvUCFcuh
	ydI9pfq1fs2+mhq/b1sVDxu5ttRY=
X-Gm-Gg: ASbGncuo/irQcAvxXVDXvyyKfwR37YNrxNOVkxDzu5YT262si93GW3tO8gXOutdDbP0
	hB6mkVV2QOS2QTmjRMtrTG0SvSwojl29IodM2RBpuFLvzH5YzIpj4dyaOYoNqAa6x/0obWT/Z
X-Google-Smtp-Source: AGHT+IFgGclKZjpTwD93mhWBRaieAPST73428DKhGHRTkHPH9a4WVhoorqiXYi3fwD2/c42eGd/mc0xe9CixbC5A58Q=
X-Received: by 2002:a05:6214:3004:b0:6e1:7223:19a9 with SMTP id
 6a1803df08f44-6e243bf62d6mr270287196d6.24.1738595677691; Mon, 03 Feb 2025
 07:14:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com> <20250203085853.1361401-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20250203085853.1361401-5-sakari.ailus@linux.intel.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Feb 2025 15:14:11 +0000
X-Gm-Features: AWEUYZnvH-plP0RY0T-oKvtGVBWdA2DPcf9f4AT1DnDJeLDRxSLDNzstZBepIbw
Message-ID: <CA+V-a8u2UeeVwz6_-fi7ZeKNRT+rNxpnF+Mbh9PwF26=VQATfQ@mail.gmail.com>
Subject: Re: [RFC v5 04/15] media: Documentation: Add subdev configuration
 models, raw sensor model
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl, 
	laurent.pinchart@ideasonboard.com, Kate Hsuan <hpa@redhat.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	"Wang, Hongju" <hongju.wang@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you for the patch.

On Mon, Feb 3, 2025 at 8:59=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Sub-device configuration models define what V4L2 API elements are
> available on a compliant sub-device and how do they behave.
>
> The patch also adds a model for common raw sensors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../media/drivers/camera-sensor.rst           |   4 +
>  .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
>  .../media/v4l/common-raw-sensor.svg           | 134 ++++++
>  .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
>  .../media/v4l/subdev-config-model.rst         | 209 +++++++++
>  5 files changed, 790 insertions(+)
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sens=
or.dia
>  create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sens=
or.svg
>  create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-m=
odel.rst
>
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst =
b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index bc55c861fb69..5bc4c79d230c 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -18,6 +18,8 @@ binning functionality. The sensor drivers belong to two=
 distinct classes, freely
>  configurable and register list-based drivers, depending on how the drive=
r
>  configures this functionality.
>
> +Also see :ref:`media_subdev_config_model_common_raw_sensor`.
> +
>  Freely configurable camera sensor drivers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -105,6 +107,8 @@ values programmed by the register sequences. The defa=
ult values of these
>  controls shall be 0 (disabled). Especially these controls shall not be i=
nverted,
>  independently of the sensor's mounting rotation.
>
> +.. _media_using_camera_sensor_drivers_embedded_data:
> +
>  Embedded data
>  -------------
<snip>
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Docum=
entation/userspace-api/media/v4l/dev-subdev.rst
> index dcfcbd52490d..4d145bd3bd09 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -838,3 +838,5 @@ stream while it may be possible to enable and disable=
 the embedded data stream.
>
>  The embedded data format does not need to be configured on the sensor's =
pads as
>  the format is dictated by the pixel data format in this case.
> +
> +.. include:: subdev-config-model.rst
> diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rs=
t b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> new file mode 100644
> index 000000000000..b0bd09772ceb
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> @@ -0,0 +1,209 @@
> +.. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> +
> +.. _media_subdev_config_model:
> +
> +Sub-device configuration models
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +A sub-device configuration model specifies in detail what the user space=
 can
> +expect from a sub-device in terms of V4L2 sub-device interface support,
> +semantics included.
> +
> +A sub-device may implement more than one configuration model at the same
> +time. The implemented configuration models can be obtained from the sub-=
device's
> +``V4L2_CID_CONFIG_MODEL`` control.
> +
> +.. _media_subdev_config_model_common_raw_sensor:
> +
> +Common raw camera sensor model
> +------------------------------
> +
> +The common raw camera sensor model defines a set of enumeration and
> +configuration interfaces (formats, selections etc.) that cover the vast =
majority
> +of functionality of raw camera sensors. Not all of the interfaces are
> +necessarily offered by all drivers.
> +
> +A sub-device complies with the common raw sensor model if the
> +``V4L2_CONFIG_MODEL_COMMON_RAW`` bit is set in the ``V4L2_CID_CONFIG_MOD=
EL``
> +control of the sub-device.
> +
> +The common raw camera sensor model is aligned with
> +:ref:`media_using_camera_sensor_drivers`. Please refer to that regarding=
 aspects
> +not specified here.
> +
> +Each camera sensor implementing the common raw sensor model exposes a si=
ngle
> +V4L2 sub-device. The sub-device contains a single source pad (0) and two=
 or more
> +internal pads: an image data internal pad (1) and optionally an embedded=
 data
> +pad (2). Additionally, further internal pads may be supported for other
> +features, in which case they are documented separately for the given dev=
ice.
> +
> +This is shown in :ref:`media_subdev_config_model_common_raw_sensor_subde=
v`.
> +
> +.. _media_subdev_config_model_common_raw_sensor_subdev:
> +
> +.. kernel-figure:: common-raw-sensor.svg
> +    :alt:    common-raw-sensor.svg
> +    :align:  center
> +
> +    **Common raw sensor sub-device**
> +
> +Routes
> +^^^^^^
> +
> +A sub-device conforming to common raw camera sensor model implements the
> +following routes.
> +
> +.. flat-table:: Routes
> +    :header-rows: 1
> +
> +    * - Sink pad/stream
> +      - Source pad/stream
> +      - Static (X/M(aybe)/-)
> +      - Mandatory (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - 0/0
> +      - X
> +      - X
> +      - Image data
> +    * - 2/0
> +      - 0/1
> +      - M
> +      - \-
> +      - Embedded data
> +
> +Support for the embedded data stream is optional. Drivers supporting the
> +embedded data stream may allow disabling and enabling the route when the
> +streaming is disabled.
> +
> +Sensor pixel array size, cropping and binning
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The sensor's pixel array is divided into one or more areas. The areas ar=
ound the
> +edge of the pixel array, usually one or more sides, may contain optical =
black
> +pixels, dummy pixels and other non-image pixels. The entire pixel array =
size is
> +conveyed by the format on (pad, stream) pair 1/0.
> +
> +A rectangle within the pixel array contains the visible pixels. Capturin=
g the
> +non-visible pixels outside the visible pixel area may be supported by th=
e
> +sensor. The visible pixel area corresponds to the ``V4L2_SEL_TGT_CROP_DE=
FAULT``
> +selection target on (pad, stream) pair 1/0.
> +
> +Sensors can perform multiple operations that affect the output image siz=
e. First
> +of these is the analogue crop. Analogue crop limits the area of the pixe=
l array
> +which the sensor will read, affecting sensor timing as well. The granula=
rity of
> +the analogue crop configuration varies greatly across sensors: some sens=
ors
> +support only a few different analogue crop configurations whereas others=
 may
> +support anything divisible by a given number of pixels. The analogue cro=
p
> +configuration corresponds the ``V4L2_SEL_TGT_CROP`` selection target on =
(pad,
s/ corresponds the/ corresponds to the

> +stream) pair 1/0. The default analogue crop rectangle corresponds to the=
 visible
> +pixel area.
> +
> +In the next step, binning is performed on the image data read from camer=
a
> +sensor's pixel array, as determined by the analogue crop configuration. =
Enabling
> +binning will effectively result in an image smaller than the original by=
 given
> +binning factors horizontally and vertically. Typical values are 1/2 and =
1/3 but
> +others may well be supported by the hardware as well.
> +
> +Sub-sampling follows binning. Sub-sampling, like binning, reduces the si=
ze of
> +the image by including only a subset of samples read from the sensor's p=
ixel
> +matrix, typically every n'th pixel horizontally and vertically, taking t=
he
> +sensor's colour pattern into account. Sub-sampling is generally configur=
able
> +separately horizontally and vertically.
> +
> +Binning and sub-sampling are configured using the ``V4L2_SEL_TGT_COMPOSE=
``
> +rectangle, relative to the analogue crop rectangle, on (pad, stream) pai=
r
> +1/0. The driver implementation determines how to configure binning and
> +sub-sampling to achieve the desired size.
> +
> +The digital crop operation takes place after binning and sub-sampling. I=
t is
> +configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, strea=
m) pair
> +0/0. The resulting image size is further output by the sensor.
> +
> +The sensor's output mbus code is configured by setting the format on the=
 (pad,
> +stream) pair 0/0. When setting the format, always use the same width and=
 height
> +as for the digital crop setting.
> +
> +Drivers may only support some of even none of these configurations, in w=
hich
s/some of/some or

> +case they do not expose the corresponding selection rectangles. If any s=
election
> +targets are omitted, the further selection rectangle or format is instea=
d
> +related to the previous implemented selection rectangle. For instance, i=
f the
> +sensor supports binning but not analogue crop, then the binning configur=
ation
> +(``V4L2_SEL_TGT_COMPOSE`` selection target) is done in relation to the v=
isible
> +pixel area (``V4L2_SEL_TGT_CROP_DEFAULT`` selection target).
> +
> +Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
> +
> +.. flat-table:: Selection targets on pads
> +    :header-rows: 1
> +
> +    * - Pad/Stream
> +      - Selection target/format
> +      - Mandatory (X/-)
> +      - Modifiable (X/-)
> +      - Synopsis
> +    * - 1/0
> +      - Format
> +      - X
> +      - \-
> +      - Image data format. The width and the height fields indicates the=
 full
> +        size of the pixel array, including non-visible pixels. The media=
 bus
> +        code of this format reflects the native pixel depth of the senso=
r.
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP_DEFAULT``
> +      - X
> +      - \
> +      - The visible pixel area. This rectangle is relative to the format=
 on the
> +        same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Analogue crop. Analogue crop typically has a coarse granularity.=
 This
> +        rectangle is relative to the format on the same (pad, stream).
> +    * - 1/0
> +      - ``V4L2_SEL_TGT_COMPOSE``
> +      - \-
> +      - X
> +      - Binning and sub-sampling. This rectangle is relative to the
> +        ``V4L2_SEL_TGT_CROP`` rectangle on the same (pad, stream). The
> +        combination of binning and sub-sampling is configured using this
> +        selection target.
> +    * - 2/0
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data format.
> +    * - 0/0
> +      - ``V4L2_SEL_TGT_CROP``
> +      - \-
> +      - X
> +      - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_C=
OMPOSE``
> +        rectangle on (pad, stream) pair 1/0.
> +    * - 0/0
> +      - Format
> +      - X
> +      - X
> +      - Image data source format. Always assign the width and height fie=
lds of
> +        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
> +        rectangle on (pad, stream) pair 0/0. The media bus code reflects=
 the
> +        pixel data output of the sensor.
> +    * - 0/1
> +      - Format
> +      - X
> +      - \-
> +      - Embedded data source format.
> +
> +Embedded data
> +^^^^^^^^^^^^^
> +
> +The embedded data stream is produced by the sensor when the correspondin=
g route
> +is enabled. The embedded data route may also be immutable or not exist a=
t all,
> +in case the sensor (or the driver) does not support it.
> +
> +Generally the sensor embedded data width is determined by the width of t=
he image
> +data whereas the number of lines are constant for the embedded data. The=
 user
> +space may obtain the size of the embedded data once the image data size =
on the
> +source pad has been configured.
> +
> +Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
> --
> 2.39.5
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

