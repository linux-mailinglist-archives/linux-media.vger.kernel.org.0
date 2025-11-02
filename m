Return-Path: <linux-media+bounces-46146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4BC28F33
	for <lists+linux-media@lfdr.de>; Sun, 02 Nov 2025 13:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E440F347E5B
	for <lists+linux-media@lfdr.de>; Sun,  2 Nov 2025 12:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9518B23EA82;
	Sun,  2 Nov 2025 12:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="JYHEE1KI"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CC11548C;
	Sun,  2 Nov 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762086914; cv=none; b=KLrp2krCxWw4gPd+TeivuUbTFdD2NDWu0hhvKPSTDZ0jx8RbL/Nws+USa9Ol4ns/EUkguDleqQIzV3PRgphTb8g3/+M9ZcxYTnq/qwjImBXRS3g+6Kw8wWN4Xi0Afsn09ncDmT6wDDoau79Hq7cpWA5eubVtihKuPjt3aNURL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762086914; c=relaxed/simple;
	bh=7vHBY4nK0hV74/I4z4Z/9SvK8bwEIxBa8Nwebg+feXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoeGibHxm97ap9XrF2U4PIyyQsAn3oTaJpII66x8klLTrwmDCIcqqaktGMJd26IcFEFx6FDKlu+liAc08SUtLPHbOfoTBsBVdimHV1mv0L5NG8xfGRuecNe5e01enMfB5plfZNoq5FcLWOm+rsfQWboXjN1UwTTV77kPV6FYGg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=JYHEE1KI; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1762086908; x=1762691708; i=wahrenst@gmx.net;
	bh=qi2rYUH1D4aFQhbxPx+PkHOYho576tVd1qChnz4cPCQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JYHEE1KI4I0EqKPmG7O/U2O9cbITWMdvaOwifqf6/8jhKvlU6Xjwa1/Ye5ao+WW+
	 vRg/wCz85MC6lUVLOG7KNZkWf0oA0Y4HefptSPqoY+y/thgcczvQtYmd7qWyKUEtX
	 L0r05vEOCj3o7Ja08h5tMsVCR/9KJWcbwjtCaTzmTFGtEcLxtGit92a10k/8bkUuK
	 xvbEuFcdebkwspOAhKzYBjOXYOpy4W2KEiUnAQA6lcUFdcRwEeI24Hh6omYbioicy
	 AClPOq07I80m5+nZ2P92J1uAGVxH+HCbdhzCWAGXFbFWkVE5vM8Q3V2hEv3HgJhik
	 3eeqc5azcGPbT+EVLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8XTv-1wJNJl0SUz-00zIy3; Sun, 02
 Nov 2025 13:35:08 +0100
Message-ID: <bf9f4a7f-3758-4877-8985-75bfe566745c@gmx.net>
Date: Sun, 2 Nov 2025 13:35:06 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] media: i2c: ov5647: Add support for regulator
 control.
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jacopo Mondi <jacopo@jmondi.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Robinson <pbrobinson@gmail.com>, "Ivan T. Ivanov" <iivanov@suse.de>
References: <20251028-b4-rpi-ov5647-v1-0-098413454f5e@ideasonboard.com>
 <20251028-b4-rpi-ov5647-v1-7-098413454f5e@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20251028-b4-rpi-ov5647-v1-7-098413454f5e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5C9sLmuZ8zzleCHN2mveV0CRC3xrM1VNl9OSKEq3agJUXpn/ptq
 11SaAPZj4phezXjP4eO6vJ6hzEs1+QGdk/ug+DxxuPPfJIQFEh6lT4DLF/dLayRYCmBNG2K
 YpnAVpujnww1a++DE5rXmYa3DyofkGlNEQ10v+FyiXKJ80j3RlqEmYV7IAzJ0X2BHqZpuKC
 Bj7j6fti9zenrWAXaQNAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OqEPg47s7yo=;KP8rBbmJdYHRTxMBniKvOOhpyaF
 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

Am 28.10.25 um 08:27 schrieb Jai Luthra:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> The driver supported using GPIOs to control the shutdown line,
> but no regulator control.
>
> Add regulator hooks.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>   drivers/media/i2c/ov5647.c | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index a33e2d8edc114d302e830639cb7cb161f16a6208..598764638d518a28c8ac61ea=
590b996f09ecd45c 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -20,6 +20,7 @@
>   #include <linux/module.h>
>   #include <linux/of_graph.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>   #include <linux/slab.h>
>   #include <linux/videodev2.h>
>   #include <media/v4l2-ctrls.h>
> @@ -83,6 +84,15 @@
>   #define OV5647_EXPOSURE_DEFAULT		1000
>   #define OV5647_EXPOSURE_MAX		65535
>  =20
> +/* regulator supplies */
> +static const char * const ov5647_supply_names[] =3D {
> +	"avdd",		/* Analog power */
> +	"dovdd",	/* Digital I/O power */
> +	"dvdd",		/* Digital core power */
> +};
> +
> +#define OV5647_NUM_SUPPLIES ARRAY_SIZE(ov5647_supply_names)
> +
>   struct regval_list {
>   	u16 addr;
>   	u8 data;
> @@ -104,6 +114,7 @@ struct ov5647 {
>   	struct mutex			lock;
>   	struct clk			*xclk;
>   	struct gpio_desc		*pwdn;
> +	struct regulator_bulk_data supplies[OV5647_NUM_SUPPLIES];
>   	bool				clock_ncont;
>   	struct v4l2_ctrl_handler	ctrls;
>   	const struct ov5647_mode	*mode;
> @@ -781,6 +792,12 @@ static int ov5647_power_on(struct device *dev)
>  =20
>   	dev_dbg(dev, "OV5647 power on\n");
>  =20
> +	ret =3D regulator_bulk_enable(OV5647_NUM_SUPPLIES, sensor->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators\n");
In case we want to log this, please add the return code as well
> +		return ret;
> +	}
> +
>   	if (sensor->pwdn) {
>   		gpiod_set_value_cansleep(sensor->pwdn, 0);
>   		msleep(PWDN_ACTIVE_DELAY_MS);
> @@ -812,6 +829,7 @@ static int ov5647_power_on(struct device *dev)
>   	clk_disable_unprepare(sensor->xclk);
>   error_pwdn:
>   	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>  =20
>   	return ret;
>   }
> @@ -841,6 +859,7 @@ static int ov5647_power_off(struct device *dev)
>  =20
>   	clk_disable_unprepare(sensor->xclk);
>   	gpiod_set_value_cansleep(sensor->pwdn, 1);
> +	regulator_bulk_disable(OV5647_NUM_SUPPLIES, sensor->supplies);
>  =20
>   	return 0;
>   }
> @@ -1341,6 +1360,18 @@ static const struct v4l2_ctrl_ops ov5647_ctrl_ops=
 =3D {
>   	.s_ctrl =3D ov5647_s_ctrl,
>   };
>  =20
> +static int ov5647_configure_regulators(struct device *dev,
> +				       struct ov5647 *sensor)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < OV5647_NUM_SUPPLIES; i++)
> +		sensor->supplies[i].supply =3D ov5647_supply_names[i];
> +
> +	return devm_regulator_bulk_get(dev, OV5647_NUM_SUPPLIES,
> +				       sensor->supplies);
> +}
> +
>   static int ov5647_init_controls(struct ov5647 *sensor, struct device *=
dev)
>   {
>   	struct i2c_client *client =3D v4l2_get_subdevdata(&sensor->sd);
> @@ -1489,6 +1520,12 @@ static int ov5647_probe(struct i2c_client *client=
)
>   		return -EINVAL;
>   	}
>  =20
> +	ret =3D ov5647_configure_regulators(dev, sensor);
> +	if (ret) {
> +		dev_err(dev, "Failed to get power regulators\n");
Please use dev_err_probe here
> +		return ret;
> +	}
> +
>   	mutex_init(&sensor->lock);
>  =20
>   	sensor->mode =3D OV5647_DEFAULT_MODE;
>


