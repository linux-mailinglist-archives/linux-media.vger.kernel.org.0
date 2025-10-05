Return-Path: <linux-media+bounces-43758-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5EBB984A
	for <lists+linux-media@lfdr.de>; Sun, 05 Oct 2025 16:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42A4E1896FA6
	for <lists+linux-media@lfdr.de>; Sun,  5 Oct 2025 14:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B66128B4FD;
	Sun,  5 Oct 2025 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iy6yKPtC"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77939FD9;
	Sun,  5 Oct 2025 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759674776; cv=none; b=SefGZy+hti/krLyiu0Be3slRh+aPhoFuhtuksVIe3qpBTH5lC3XQpyGOKNEfZBs5WVyI2FPlf/L9W8Du4p2Sf9lROT1fva9VDjA7AkcjMqKg2XVb8A8rSU/HZxcRXdMvQvo6Wp0fpce4IQH6q8Hz8gPTw96se/U2PPlE9332aHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759674776; c=relaxed/simple;
	bh=sxY2NAIOW2lWzLmqZchAt2vALq/TgAC3j2XHh1mx9HI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uhnvbX8ovekB8YiSsSkJURiH6MzrXaz+2zPYlSmArBXNozF07UR3ODz0YwfjDDN67J09NFsqMaObHms4VAx5iUxSf9r5uinu8Yf74THbp6dLOkMWjOKBccroexLjQbdMJgY5tplUZKfoLkWpTi+UdXW8qEygPXNGG81heQtn8Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iy6yKPtC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DBFE1340;
	Sun,  5 Oct 2025 16:31:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759674677;
	bh=sxY2NAIOW2lWzLmqZchAt2vALq/TgAC3j2XHh1mx9HI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iy6yKPtCPoiuEyTw9qvyhRuQmm948gHWrjkIy5FabeN7vyJvqjBb76wkrHXGBWzFG
	 nNk9APUI9iNmYI5I0g7eHbvFEBlBL92t4OjocjYqKjZYkn8IAeEGf8h1s8yQCTRsB1
	 wcfp4hiZ0SVfBBVJvhD/LeJV3A5wArX10nBU07RM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251005133228.62704-3-asmirnou@pinefeat.co.uk>
References: <20251005133228.62704-1-asmirnou@pinefeat.co.uk> <20251005133228.62704-3-asmirnou@pinefeat.co.uk>
Subject: Re: [PATCH v5 2/2] media: i2c: Pinefeat cef168 lens control board driver
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>, conor+dt@kernel.org, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org
Date: Sun, 05 Oct 2025 15:32:45 +0100
Message-ID: <175967476560.756374.10666787102940352317@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Hi Aliaksandr,

Quoting Aliaksandr Smirnou (2025-10-05 14:32:28)
> Add support for the Pinefeat cef168 lens control board that provides
> electronic focus and aperture control for Canon EF & EF-S lenses on
> non-Canon camera bodies.

I'm really looking forward to trying this device out sometime. Very
interesting piece of kit - Thank you for working directly to upstream
the support! That's really awesome.

> Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
> ---
>  MAINTAINERS                        |   1 +
>  drivers/media/i2c/Kconfig          |   9 +
>  drivers/media/i2c/Makefile         |   1 +
>  drivers/media/i2c/cef168.c         | 331 +++++++++++++++++++++++++++++
>  include/uapi/linux/v4l2-controls.h |   6 +
>  5 files changed, 348 insertions(+)
>  create mode 100644 drivers/media/i2c/cef168.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a59cd27caf11..0cf3b3a35827 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20337,6 +20337,7 @@ M:      Aliaksandr Smirnou <support@pinefeat.co.u=
k>
>  L:     linux-media@vger.kernel.org
>  S:     Supported
>  F:     Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> +F:     drivers/media/i2c/cef168.c
> =20
>  PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
>  M:     Tomasz Duszynski <tduszyns@gmail.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index cdd7ba5da0d5..694b2571de37 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -823,6 +823,15 @@ config VIDEO_AK7375
>           capability. This is designed for linear control of
>           voice coil motors, controlled via I2C serial interface.
> =20
> +config VIDEO_CEF168
> +       tristate "CEF168 lens control support"
> +       select CRC8
> +       help
> +         This is a driver for the CEF168 lens control board.
> +         The board provides an I2C interface for electronic focus
> +         and aperture control of EF and EF-S lenses. The driver
> +         integrates with the V4L2 sub-device API.
> +
>  config VIDEO_DW9714
>         tristate "DW9714 lens voice coil support"
>         depends on GPIOLIB
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 57cdd8dc96f6..2e8f0a968352 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_VIDEO_BT856) +=3D bt856.o
>  obj-$(CONFIG_VIDEO_BT866) +=3D bt866.o
>  obj-$(CONFIG_VIDEO_CCS) +=3D ccs/
>  obj-$(CONFIG_VIDEO_CCS_PLL) +=3D ccs-pll.o
> +obj-$(CONFIG_VIDEO_CEF168) +=3D cef168.o
>  obj-$(CONFIG_VIDEO_CS3308) +=3D cs3308.o
>  obj-$(CONFIG_VIDEO_CS5345) +=3D cs5345.o
>  obj-$(CONFIG_VIDEO_CS53L32A) +=3D cs53l32a.o
> diff --git a/drivers/media/i2c/cef168.c b/drivers/media/i2c/cef168.c
> new file mode 100644
> index 000000000000..cfcef476f09d
> --- /dev/null
> +++ b/drivers/media/i2c/cef168.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2025 Pinefeat LLP
> +
> +#include <linux/crc8.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/v4l2-controls.h>
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-event.h>
> +
> +#define CEF168_NAME "cef168"
> +
> +#define CEF168_V4L2_CID_CUSTOM(ctrl) \
> +       (V4L2_CID_USER_CEF168_BASE + custom_##ctrl)
> +
> +enum { custom_lens_id, custom_data, custom_focus_range, custom_calibrate=
 };
> +
> +#define INP_CALIBRATE 0x22
> +#define INP_SET_FOCUS 0x80
> +#define INP_SET_FOCUS_P 0x81
> +#define INP_SET_FOCUS_N 0x82
> +#define INP_SET_APERTURE 0x7A
> +#define INP_SET_APERTURE_P 0x7B
> +#define INP_SET_APERTURE_N 0x7C
> +
> +#define CEF_CRC8_POLYNOMIAL 168
> +
> +DECLARE_CRC8_TABLE(cef168_crc8_table);
> +
> +struct cef168_data {
> +       __u8 lens_id;
> +       __u8 moving : 1;
> +       __u8 calibrating : 2;
> +       __u16 moving_time;
> +       __u16 focus_position_min;
> +       __u16 focus_position_max;
> +       __u16 focus_position_cur;
> +       __u16 focus_distance_min;
> +       __u16 focus_distance_max;
> +       __u8 crc8;
> +} __packed;
> +
> +struct cef168_device {
> +       struct v4l2_ctrl_handler ctrls;
> +       struct v4l2_subdev sd;
> +};
> +
> +static inline struct cef168_device *to_cef168(struct v4l2_ctrl *ctrl)
> +{
> +       return container_of(ctrl->handler, struct cef168_device, ctrls);
> +}
> +
> +static inline struct cef168_device *sd_to_cef168(struct v4l2_subdev *sub=
dev)
> +{
> +       return container_of(subdev, struct cef168_device, sd);
> +}
> +
> +static int cef168_i2c_write(struct cef168_device *cef168_dev, u8 cmd, u1=
6 val)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&cef168_dev->sd=
);
> +       int retry, ret;
> +
> +       __le16 le_data =3D cpu_to_le16(val);
> +       char tx_data[4] =3D { cmd, ((u8 *)&le_data)[0], ((u8 *)&le_data)[=
1] };
> +
> +       tx_data[3] =3D crc8(cef168_crc8_table, tx_data, 3, CRC8_INIT_VALU=
E);
> +
> +       for (retry =3D 0; retry < 3; retry++) {
> +               ret =3D i2c_master_send(client, tx_data, sizeof(tx_data));
> +               if (ret =3D=3D sizeof(tx_data))
> +                       return 0;
> +               else if (ret !=3D -EIO && ret !=3D -EREMOTEIO)
> +                       break;
> +       }
> +
> +       dev_err(&client->dev, "I2C write fail after %d retries, ret=3D%d\=
n",
> +               retry, ret);
> +       return -EIO;
> +}
> +
> +static int cef168_i2c_read(struct cef168_device *cef168_dev,
> +                          struct cef168_data *rx_data)
> +{
> +       struct i2c_client *client =3D v4l2_get_subdevdata(&cef168_dev->sd=
);
> +
> +       int ret =3D i2c_master_recv(client, (char *)rx_data,
> +                                 sizeof(struct cef168_data));
> +       if (ret !=3D sizeof(struct cef168_data)) {
> +               dev_err(&client->dev, "I2C read fail, ret=3D%d\n", ret);
> +               return -EIO;
> +       }
> +
> +       u8 computed_crc =3D crc8(cef168_crc8_table, (const u8 *)rx_data,
> +                              sizeof(struct cef168_data) - 1, CRC8_INIT_=
VALUE);
> +       if (computed_crc !=3D rx_data->crc8) {
> +               dev_err(&client->dev,
> +                       "CRC mismatch calculated=3D0x%02X read=3D0x%02X\n=
",
> +                       computed_crc, rx_data->crc8);
> +               return -EIO;
> +       }
> +
> +       rx_data->moving_time =3D le16_to_cpup((__le16 *)&rx_data->moving_=
time);
> +       rx_data->focus_position_min =3D le16_to_cpup((__le16 *)&rx_data->=
focus_position_min);
> +       rx_data->focus_position_max =3D le16_to_cpup((__le16 *)&rx_data->=
focus_position_max);
> +       rx_data->focus_position_cur =3D le16_to_cpup((__le16 *)&rx_data->=
focus_position_cur);
> +       rx_data->focus_distance_min =3D le16_to_cpup((__le16 *)&rx_data->=
focus_distance_min);
> +       rx_data->focus_distance_max =3D le16_to_cpup((__le16 *)&rx_data->=
focus_distance_max);

What is the focus distance in this case? Is it a measured distance that
could be applied to focus?

> +
> +       return 0;
> +}
> +
> +static int cef168_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct cef168_device *dev =3D to_cef168(ctrl);
> +       u8 cmd;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_FOCUS_ABSOLUTE:
> +               return cef168_i2c_write(dev, INP_SET_FOCUS, ctrl->val);
> +       case V4L2_CID_FOCUS_RELATIVE:
> +               cmd =3D ctrl->val < 0 ? INP_SET_FOCUS_N : INP_SET_FOCUS_P;
> +               return cef168_i2c_write(dev, cmd, abs(ctrl->val));
> +       case V4L2_CID_IRIS_ABSOLUTE:
> +               return cef168_i2c_write(dev, INP_SET_APERTURE, ctrl->val);
> +       case V4L2_CID_IRIS_RELATIVE:
> +               cmd =3D ctrl->val < 0 ? INP_SET_APERTURE_N : INP_SET_APER=
TURE_P;
> +               return cef168_i2c_write(dev, cmd, abs(ctrl->val));
> +       case CEF168_V4L2_CID_CUSTOM(calibrate):
> +               return cef168_i2c_write(dev, INP_CALIBRATE, 0);

Is there any documentation on how to use this control?

> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int cef168_get_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +       struct cef168_data data;
> +       struct cef168_device *dev =3D to_cef168(ctrl);
> +       int rval;
> +
> +       rval =3D cef168_i2c_read(dev, &data);
> +       if (rval < 0)
> +               return rval;
> +
> +       switch (ctrl->id) {
> +       case V4L2_CID_FOCUS_ABSOLUTE:
> +               ctrl->val =3D data.focus_position_cur;
> +               return 0;
> +       case CEF168_V4L2_CID_CUSTOM(focus_range):
> +               ctrl->p_new.p_u32[0] =3D ((u32)data.focus_position_min <<=
 16) |
> +                                      (u32)data.focus_position_max;

Is this really a custom control ? Is there any way to convey this
through the min/max of the FOCUS_ABSOLUTE control ?

> +               return 0;
> +       case CEF168_V4L2_CID_CUSTOM(lens_id):
> +               ctrl->p_new.p_u8[0] =3D data.lens_id;
> +               return 0;

Is this a specific individual ID value for the connected lens (i.e.
every lens has a custom id?) or is it a reference to the lens
model/type?

Is this something we could use in libcamera for instance to select an
appropriate tuning file per lens (type) ?


> +       case CEF168_V4L2_CID_CUSTOM(data):
> +               memcpy(ctrl->p_new.p_u8, &data, sizeof(data));
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops cef168_ctrl_ops =3D {
> +       .g_volatile_ctrl =3D cef168_get_ctrl,
> +       .s_ctrl =3D cef168_set_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_lens_id_ctrl =3D {
> +       .ops =3D &cef168_ctrl_ops,
> +       .id =3D CEF168_V4L2_CID_CUSTOM(lens_id),
> +       .type =3D V4L2_CTRL_TYPE_U8,
> +       .name =3D "Lens ID",
> +       .min =3D 0,
> +       .max =3D U8_MAX,
> +       .step =3D 1,
> +       .def =3D 0,
> +       .flags =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_focus_range_ctrl =3D {
> +       .ops =3D &cef168_ctrl_ops,
> +       .id =3D CEF168_V4L2_CID_CUSTOM(focus_range),
> +       .type =3D V4L2_CTRL_TYPE_U32,
> +       .name =3D "Focus Range",
> +       .min =3D 0,
> +       .max =3D U32_MAX,
> +       .step =3D 1,
> +       .def =3D 0,
> +       .flags =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_data_ctrl =3D {
> +       .ops =3D &cef168_ctrl_ops,
> +       .id =3D CEF168_V4L2_CID_CUSTOM(data),
> +       .type =3D V4L2_CTRL_TYPE_U8,
> +       .name =3D "Data",
> +       .min =3D 0,
> +       .max =3D U8_MAX,
> +       .step =3D 1,
> +       .def =3D 0,
> +       .dims =3D { sizeof(struct cef168_data) / sizeof(u8) },
> +       .elem_size =3D sizeof(u8),
> +       .flags =3D V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_calibrate_ctrl =3D {
> +       .ops =3D &cef168_ctrl_ops,
> +       .id =3D CEF168_V4L2_CID_CUSTOM(calibrate),
> +       .type =3D V4L2_CTRL_TYPE_BUTTON,
> +       .name =3D "Calibrate",
> +};
> +
> +static const struct v4l2_subdev_core_ops cef168_core_ops =3D {
> +       .log_status =3D v4l2_ctrl_subdev_log_status,
> +       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops cef168_ops =3D {
> +       .core =3D &cef168_core_ops,
> +};
> +
> +static int cef168_init_controls(struct cef168_device *dev)
> +{
> +       struct v4l2_ctrl *ctrl;
> +       struct v4l2_ctrl_handler *hdl =3D &dev->ctrls;
> +       const struct v4l2_ctrl_ops *ops =3D &cef168_ctrl_ops;
> +
> +       v4l2_ctrl_handler_init(hdl, 8);
> +
> +       ctrl =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0, =
S16_MAX,
> +                                1, 0);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_VOLATILE |
> +                              V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_RELATIVE, S16_MIN, S16=
_MAX,
> +                         1, 0);
> +       ctrl =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_ABSOLUTE, 0, S=
16_MAX,
> +                                1, 0);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY |
> +                              V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_RELATIVE, S16_MIN, S16_=
MAX, 1,
> +                         0);
> +       ctrl =3D v4l2_ctrl_new_custom(hdl, &cef168_calibrate_ctrl, NULL);
> +       if (ctrl)
> +               ctrl->flags |=3D V4L2_CTRL_FLAG_WRITE_ONLY |
> +                              V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +       v4l2_ctrl_new_custom(hdl, &cef168_focus_range_ctrl, NULL);
> +       v4l2_ctrl_new_custom(hdl, &cef168_data_ctrl, NULL);
> +       v4l2_ctrl_new_custom(hdl, &cef168_lens_id_ctrl, NULL);
> +
> +       if (hdl->error)
> +               dev_err(dev->sd.dev, "%s fail error: 0x%x\n", __func__,
> +                       hdl->error);
> +       dev->sd.ctrl_handler =3D hdl;
> +       return hdl->error;
> +}
> +
> +static int cef168_probe(struct i2c_client *client)
> +{
> +       struct cef168_device *cef168_dev;
> +       int rval;
> +
> +       cef168_dev =3D devm_kzalloc(&client->dev, sizeof(*cef168_dev),
> +                                 GFP_KERNEL);
> +       if (!cef168_dev)
> +               return -ENOMEM;
> +
> +       v4l2_i2c_subdev_init(&cef168_dev->sd, client, &cef168_ops);
> +       cef168_dev->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> +                               V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +       rval =3D cef168_init_controls(cef168_dev);
> +       if (rval)
> +               goto err_cleanup;
> +
> +       rval =3D media_entity_pads_init(&cef168_dev->sd.entity, 0, NULL);
> +       if (rval < 0)
> +               goto err_cleanup;
> +
> +       cef168_dev->sd.entity.function =3D MEDIA_ENT_F_LENS;
> +
> +       rval =3D v4l2_async_register_subdev(&cef168_dev->sd);
> +       if (rval < 0)
> +               goto err_cleanup;
> +
> +       crc8_populate_msb(cef168_crc8_table, CEF_CRC8_POLYNOMIAL);
> +
> +       return 0;
> +
> +err_cleanup:
> +       v4l2_ctrl_handler_free(&cef168_dev->ctrls);
> +       media_entity_cleanup(&cef168_dev->sd.entity);
> +
> +       return rval;
> +}
> +
> +static void cef168_remove(struct i2c_client *client)
> +{
> +       struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +       struct cef168_device *cef168_dev =3D sd_to_cef168(sd);
> +
> +       v4l2_async_unregister_subdev(&cef168_dev->sd);
> +       v4l2_ctrl_handler_free(&cef168_dev->ctrls);
> +       media_entity_cleanup(&cef168_dev->sd.entity);
> +}
> +
> +static const struct of_device_id cef168_of_table[] =3D {
> +       { .compatible =3D "pinefeat,cef168" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cef168_of_table);
> +
> +static struct i2c_driver cef168_i2c_driver =3D {
> +       .driver =3D {
> +               .name =3D CEF168_NAME,
> +               .of_match_table =3D cef168_of_table,
> +       },
> +       .probe =3D cef168_probe,
> +       .remove =3D cef168_remove,
> +};
> +
> +module_i2c_driver(cef168_i2c_driver);
> +
> +MODULE_AUTHOR("support@pinefeat.co.uk>");
> +MODULE_DESCRIPTION("CEF168 lens driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 2d30107e047e..f8ca4f8c89af 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -228,6 +228,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_RKISP1_BASE              (V4L2_CID_USER_BASE + 0x1=
220)
> =20
> +/*
> + * The base for Pinefeat CEF168 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_CEF168_BASE              (V4L2_CID_USER_BASE + 0x1=
230)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */
> --=20
> 2.34.1
>

