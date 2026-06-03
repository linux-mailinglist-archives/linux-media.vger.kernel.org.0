Return-Path: <linux-media+bounces-63583-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YCqOBloUIGpEvgAAu9opvQ
	(envelope-from <linux-media+bounces-63583-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:47:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746D637337
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 13:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=Zr6a1RWg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63583-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63583-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FDB5302EB90
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 11:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049B644D693;
	Wed,  3 Jun 2026 11:39:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F96A30567B;
	Wed,  3 Jun 2026 11:39:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780486743; cv=none; b=Wk0r1kHJCdFXGlyDPIPKsgWkQio4GYJOdInA027qTt4s9m/+oodleRNDawlmF8O5QjUdpbJsvIe91P+D4bL35c+L3fHWWuHxhoUgfIqfJ+w20Jt/HtxjtbHxoczKMH3iA/2duFyF8qHIM6ag8GEjmcyxTgonEPwshGv5tE8k1Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780486743; c=relaxed/simple;
	bh=D35XH4gUDYbf444lWDpn80YsGZwQ89CLUWC4DSa/nL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B6G2cEgWap7qHmiJtenjFmHflsiocIlRnhE5LOFPkmVB0QvLljeFA7gmYq02XAeJrptKJh3GDpLvxosZOshF+QxPWer62ecevl+6SK5SYUAezrl3FSg53BAoiHSjbRnbe6ERJMGaJDz9h2ExU/xf/HX9p384g7xFNsiwjVgaEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zr6a1RWg; arc=none smtp.client-ip=213.167.242.64
Received: from [192.168.0.218] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 21578986;
	Wed,  3 Jun 2026 13:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780486715;
	bh=D35XH4gUDYbf444lWDpn80YsGZwQ89CLUWC4DSa/nL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zr6a1RWgM4nBrCuOStkYaFu+6IIw2heVFwjSF6XcXQ9A5jPLKjCOkJIarcDhUI5aI
	 UslATkXyofI5qmNnzq2EDEMPzmKSV4ABMEqEX/0S5RP5WE4z9nxI7EU1j3zryHMPww
	 ttxMV4j1ziHOktrrfIO3IxcrUm85M3nlkvx4piOE=
Message-ID: <b8c9ce21-8bd6-4811-a965-453fc9f0924f@ideasonboard.com>
Date: Wed, 3 Jun 2026 12:38:56 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] media: i2c: Pinefeat cef168 lens control board
 driver
To: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Aliaksandr Smirnou <support@pinefeat.co.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Walter Werner Schneider <contact@schnwalter.eu>, Kate Hsuan
 <hpa@redhat.com>, Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"
 <linux-media@vger.kernel.org>
References: <20260601204814.19148-1-asmirnou@pinefeat.co.uk>
 <20260601204814.19148-3-asmirnou@pinefeat.co.uk>
Content-Language: en-GB
From: Alen Karnil <alen.karnil@ideasonboard.com>
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20260601204814.19148-3-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-63583-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:asmirnou@pinefeat.co.uk,m:mchehab@kernel.org,m:support@pinefeat.co.uk,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:xiaolei.wang@windriver.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:himanshu.bhavani@siliconsignals.io,m:clamor95@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pinefeat.co.uk,linux.intel.com,oss.qualcomm.com,linaro.org,ideasonboard.com,windriver.com,schnwalter.eu,redhat.com,siliconsignals.io,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alen.karnil@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pinefeat.co.uk:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1746D637337

Hi Aliaksandr,

On 01/06/2026 21:48, Aliaksandr Smirnou wrote:
> Add support for the Pinefeat cef168 lens control board that provides
> electronic focus and aperture control for Canon EF & EF-S lenses on
> non-Canon camera bodies.
> 
> Signed-off-by: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

I have successfully tested this on a RPi 5 with a Canon EF-S 18-55mm lens.

Tested-by: Alen Karnil <alen.karnil@ideasonboard.com>

I have no further questions in regards to the driver implementation.

Reviewed-by: Alen Karnil <alen.karnil@ideasonboard.com>

> ---
>   MAINTAINERS                        |   1 +
>   drivers/media/i2c/Kconfig          |   9 +
>   drivers/media/i2c/Makefile         |   1 +
>   drivers/media/i2c/cef168.c         | 317 +++++++++++++++++++++++++++++
>   include/uapi/linux/v4l2-controls.h |   6 +
>   5 files changed, 334 insertions(+)
>   create mode 100644 drivers/media/i2c/cef168.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06668674e167..842da3419b0d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21151,6 +21151,7 @@ M:	Aliaksandr Smirnou <support@pinefeat.co.uk>
>   L:	linux-media@vger.kernel.org
>   S:	Supported
>   F:	Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> +F:	drivers/media/i2c/cef168.c
>   
>   PLANTOWER PMS7003 AIR POLLUTION SENSOR DRIVER
>   M:	Tomasz Duszynski <tduszyns@gmail.com>
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8f2ba4121586..f1bfea009512 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -893,6 +893,15 @@ config VIDEO_AK7375
>   	  capability. This is designed for linear control of
>   	  voice coil motors, controlled via I2C serial interface.
>   
> +config VIDEO_CEF168
> +	tristate "CEF168 lens control support"
> +	select CRC8
> +	help
> +	  This is a driver for the CEF168 lens control board.
> +	  The board provides an I2C interface for electronic focus
> +	  and aperture control of EF and EF-S lenses. The driver
> +	  integrates with the V4L2 sub-device API.
> +
>   config VIDEO_DW9714
>   	tristate "DW9714 lens voice coil support"
>   	depends on GPIOLIB
> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> index 90b276a7417a..c153101cd977 100644
> --- a/drivers/media/i2c/Makefile
> +++ b/drivers/media/i2c/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_VIDEO_BT856) += bt856.o
>   obj-$(CONFIG_VIDEO_BT866) += bt866.o
>   obj-$(CONFIG_VIDEO_CCS) += ccs/
>   obj-$(CONFIG_VIDEO_CCS_PLL) += ccs-pll.o
> +obj-$(CONFIG_VIDEO_CEF168) += cef168.o
>   obj-$(CONFIG_VIDEO_CS3308) += cs3308.o
>   obj-$(CONFIG_VIDEO_CS5345) += cs5345.o
>   obj-$(CONFIG_VIDEO_CS53L32A) += cs53l32a.o
> diff --git a/drivers/media/i2c/cef168.c b/drivers/media/i2c/cef168.c
> new file mode 100644
> index 000000000000..596bf549bf25
> --- /dev/null
> +++ b/drivers/media/i2c/cef168.c
> @@ -0,0 +1,317 @@
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
> +	(V4L2_CID_USER_CEF168_BASE + custom_##ctrl)
> +
> +enum { custom_lens_id, custom_data, custom_calibrate };
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
> +	__u8 lens_id;
> +	__u8 moving : 1;
> +	__u8 calibrating : 2;
> +	__u16 moving_time;
> +	__u16 focus_position_min;
> +	__u16 focus_position_max;
> +	__u16 focus_position_cur;
> +	__u16 focus_distance_min;
> +	__u16 focus_distance_max;
> +	__u8 crc8;
> +} __packed;
> +
> +struct cef168_device {
> +	struct v4l2_ctrl_handler ctrls;
> +	struct v4l2_subdev sd;
> +};
> +
> +static inline struct cef168_device *to_cef168(struct v4l2_ctrl *ctrl)
> +{
> +	return container_of(ctrl->handler, struct cef168_device, ctrls);
> +}
> +
> +static inline struct cef168_device *sd_to_cef168(struct v4l2_subdev *subdev)
> +{
> +	return container_of(subdev, struct cef168_device, sd);
> +}
> +
> +static int cef168_i2c_write(struct cef168_device *cef168_dev, u8 cmd, u16 val)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
> +	int retry, ret;
> +
> +	__le16 le_data = cpu_to_le16(val);
> +	char tx_data[4] = { cmd, ((u8 *)&le_data)[0], ((u8 *)&le_data)[1] };
> +
> +	tx_data[3] = crc8(cef168_crc8_table, tx_data, 3, CRC8_INIT_VALUE);
> +
> +	for (retry = 0; retry < 3; retry++) {
> +		ret = i2c_master_send(client, tx_data, sizeof(tx_data));
> +		if (ret == sizeof(tx_data))
> +			return 0;
> +		else if (ret != -EIO && ret != -EREMOTEIO)
> +			break;
> +	}
> +
> +	dev_err(&client->dev, "I2C write fail after %d retries, ret=%d\n",
> +		retry, ret);
> +	return -EIO;
> +}
> +
> +static int cef168_i2c_read(struct cef168_device *cef168_dev,
> +			   struct cef168_data *rx_data)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&cef168_dev->sd);
> +
> +	int ret = i2c_master_recv(client, (char *)rx_data,
> +				  sizeof(struct cef168_data));
> +	if (ret != sizeof(struct cef168_data)) {
> +		dev_err(&client->dev, "I2C read fail, ret=%d\n", ret);
> +		return -EIO;
> +	}
> +
> +	u8 computed_crc = crc8(cef168_crc8_table, (const u8 *)rx_data,
> +			       sizeof(struct cef168_data) - 1, CRC8_INIT_VALUE);
> +	if (computed_crc != rx_data->crc8) {
> +		dev_err(&client->dev,
> +			"CRC mismatch calculated=0x%02X read=0x%02X\n",
> +			computed_crc, rx_data->crc8);
> +		return -EIO;
> +	}
> +
> +	rx_data->moving_time = le16_to_cpup((__le16 *)&rx_data->moving_time);
> +	rx_data->focus_position_min = le16_to_cpup((__le16 *)&rx_data->focus_position_min);
> +	rx_data->focus_position_max = le16_to_cpup((__le16 *)&rx_data->focus_position_max);
> +	rx_data->focus_position_cur = le16_to_cpup((__le16 *)&rx_data->focus_position_cur);
> +	rx_data->focus_distance_min = le16_to_cpup((__le16 *)&rx_data->focus_distance_min);
> +	rx_data->focus_distance_max = le16_to_cpup((__le16 *)&rx_data->focus_distance_max);
> +
> +	return 0;
> +}
> +
> +static int cef168_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct cef168_device *dev = to_cef168(ctrl);
> +	u8 cmd;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_FOCUS_ABSOLUTE:
> +		return cef168_i2c_write(dev, INP_SET_FOCUS, ctrl->val);
> +	case V4L2_CID_FOCUS_RELATIVE:
> +		cmd = ctrl->val < 0 ? INP_SET_FOCUS_N : INP_SET_FOCUS_P;
> +		return cef168_i2c_write(dev, cmd, abs(ctrl->val));
> +	case V4L2_CID_IRIS_ABSOLUTE:
> +		return cef168_i2c_write(dev, INP_SET_APERTURE, ctrl->val);
> +	case V4L2_CID_IRIS_RELATIVE:
> +		cmd = ctrl->val < 0 ? INP_SET_APERTURE_N : INP_SET_APERTURE_P;
> +		return cef168_i2c_write(dev, cmd, abs(ctrl->val));
> +	case CEF168_V4L2_CID_CUSTOM(calibrate):
> +		return cef168_i2c_write(dev, INP_CALIBRATE, 0);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int cef168_get_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct cef168_data data;
> +	struct cef168_device *dev = to_cef168(ctrl);
> +	int rval;
> +
> +	rval = cef168_i2c_read(dev, &data);
> +	if (rval < 0)
> +		return rval;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_FOCUS_ABSOLUTE:
> +		__v4l2_ctrl_modify_range(ctrl,
> +					 data.focus_position_min,
> +					 data.focus_position_max, 1, 0);
> +		ctrl->val = data.focus_position_cur;
> +		return 0;
> +	case CEF168_V4L2_CID_CUSTOM(lens_id):
> +		ctrl->p_new.p_u8[0] = data.lens_id;
> +		return 0;
> +	case CEF168_V4L2_CID_CUSTOM(data):
> +		memcpy(ctrl->p_new.p_u8, &data, sizeof(data));
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct v4l2_ctrl_ops cef168_ctrl_ops = {
> +	.g_volatile_ctrl = cef168_get_ctrl,
> +	.s_ctrl = cef168_set_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_lens_id_ctrl = {
> +	.ops = &cef168_ctrl_ops,
> +	.id = CEF168_V4L2_CID_CUSTOM(lens_id),
> +	.type = V4L2_CTRL_TYPE_U8,
> +	.name = "Lens ID",
> +	.min = 0,
> +	.max = U8_MAX,
> +	.step = 1,
> +	.def = 0,
> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_data_ctrl = {
> +	.ops = &cef168_ctrl_ops,
> +	.id = CEF168_V4L2_CID_CUSTOM(data),
> +	.type = V4L2_CTRL_TYPE_U8,
> +	.name = "Data",
> +	.min = 0,
> +	.max = U8_MAX,
> +	.step = 1,
> +	.def = 0,
> +	.dims = { sizeof(struct cef168_data) / sizeof(u8) },
> +	.elem_size = sizeof(u8),
> +	.flags = V4L2_CTRL_FLAG_VOLATILE | V4L2_CTRL_FLAG_READ_ONLY,
> +};
> +
> +static const struct v4l2_ctrl_config cef168_calibrate_ctrl = {
> +	.ops = &cef168_ctrl_ops,
> +	.id = CEF168_V4L2_CID_CUSTOM(calibrate),
> +	.type = V4L2_CTRL_TYPE_BUTTON,
> +	.name = "Calibrate",
> +};
> +
> +static const struct v4l2_subdev_core_ops cef168_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_ops cef168_ops = {
> +	.core = &cef168_core_ops,
> +};
> +
> +static int cef168_init_controls(struct cef168_device *dev)
> +{
> +	struct v4l2_ctrl *ctrl;
> +	struct v4l2_ctrl_handler *hdl = &dev->ctrls;
> +	const struct v4l2_ctrl_ops *ops = &cef168_ctrl_ops;
> +
> +	v4l2_ctrl_handler_init(hdl, 7);
> +
> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_ABSOLUTE, 0, S16_MAX,
> +				 1, 0);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE |
> +			       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_FOCUS_RELATIVE, S16_MIN, S16_MAX,
> +			  1, 0);
> +	ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_ABSOLUTE, 0, S16_MAX,
> +				 1, 0);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
> +			       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +	v4l2_ctrl_new_std(hdl, ops, V4L2_CID_IRIS_RELATIVE, S16_MIN, S16_MAX, 1,
> +			  0);
> +	ctrl = v4l2_ctrl_new_custom(hdl, &cef168_calibrate_ctrl, NULL);
> +	if (ctrl)
> +		ctrl->flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
> +			       V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
> +	v4l2_ctrl_new_custom(hdl, &cef168_data_ctrl, NULL);
> +	v4l2_ctrl_new_custom(hdl, &cef168_lens_id_ctrl, NULL);
> +
> +	if (hdl->error)
> +		dev_err(dev->sd.dev, "%s fail error: 0x%x\n", __func__,
> +			hdl->error);
> +	dev->sd.ctrl_handler = hdl;
> +	return hdl->error;
> +}
> +
> +static int cef168_probe(struct i2c_client *client)
> +{
> +	struct cef168_device *cef168_dev;
> +	int rval;
> +
> +	cef168_dev = devm_kzalloc(&client->dev, sizeof(*cef168_dev),
> +				  GFP_KERNEL);
> +	if (!cef168_dev)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&cef168_dev->sd, client, &cef168_ops);
> +	cef168_dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +				V4L2_SUBDEV_FL_HAS_EVENTS;
> +
> +	rval = cef168_init_controls(cef168_dev);
> +	if (rval)
> +		goto err_cleanup;
> +
> +	rval = media_entity_pads_init(&cef168_dev->sd.entity, 0, NULL);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	cef168_dev->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	rval = v4l2_async_register_subdev(&cef168_dev->sd);
> +	if (rval < 0)
> +		goto err_cleanup;
> +
> +	crc8_populate_msb(cef168_crc8_table, CEF_CRC8_POLYNOMIAL);
> +
> +	return 0;
> +
> +err_cleanup:
> +	v4l2_ctrl_handler_free(&cef168_dev->ctrls);
> +	media_entity_cleanup(&cef168_dev->sd.entity);
> +
> +	return rval;
> +}
> +
> +static void cef168_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct cef168_device *cef168_dev = sd_to_cef168(sd);
> +
> +	v4l2_async_unregister_subdev(&cef168_dev->sd);
> +	v4l2_ctrl_handler_free(&cef168_dev->ctrls);
> +	media_entity_cleanup(&cef168_dev->sd.entity);
> +}
> +
> +static const struct of_device_id cef168_of_table[] = {
> +	{ .compatible = "pinefeat,cef168" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, cef168_of_table);
> +
> +static struct i2c_driver cef168_i2c_driver = {
> +	.driver = {
> +		.name = CEF168_NAME,
> +		.of_match_table = cef168_of_table,
> +	},
> +	.probe = cef168_probe,
> +	.remove = cef168_remove,
> +};
> +
> +module_i2c_driver(cef168_i2c_driver);
> +
> +MODULE_AUTHOR("support@pinefeat.co.uk>");
> +MODULE_DESCRIPTION("CEF168 lens driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 68dd0c4e47b2..f2cae365612f 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -234,6 +234,12 @@ enum v4l2_colorfx {
>    */
>   #define V4L2_CID_USER_MALI_C55_BASE		(V4L2_CID_USER_BASE + 0x1230)
>   
> +/*
> + * The base for Pinefeat CEF168 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_CEF168_BASE		(V4L2_CID_USER_BASE + 0x1240)
> +
>   /* MPEG-class control IDs */
>   /* The MPEG controls are applicable to all codec controls
>    * and the 'MPEG' part of the define is historical */


