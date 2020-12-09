Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF42D3F56
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 10:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729559AbgLIJ6z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 04:58:55 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:16281 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729007AbgLIJ6z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 04:58:55 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DA8FB240004;
        Wed,  9 Dec 2020 09:58:09 +0000 (UTC)
Date:   Wed, 9 Dec 2020 10:58:19 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     kholk11@gmail.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org,
        marijn.suijten@somainline.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, sakari.ailus@iki.fi,
        andrey.konovalov@linaro.org,
        angelogioacchino.delregno@somainline.org
Subject: Re: [PATCH v3 1/2] media: i2c: Add driver for the Sony Exmor-RS
 IMX300 camera sensor
Message-ID: <20201209095819.w6lfpga2gqvu2ujn@uno.localdomain>
References: <20201127223047.2764643-1-kholk11@gmail.com>
 <20201127223047.2764643-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201127223047.2764643-2-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Fri, Nov 27, 2020 at 11:30:46PM +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This is a custom multi-aspect 25MegaPixels sensor from Sony,
> found in many Sony Xperia smartphones from various eras.
>
> The camera assembly for this sensor usually (at least in Xperia
> phones) has a lens that does not cover the entire sensor area,
> which means that the real corners are blind and that, in many
> lighting conditions, some more pixels in the corners are very
> getting obscured (as no decent amount of light can get in)...
> so, the maximum resolution that can produce a good image is:
> - In 4:3 aspect ratio, 5520x4160 (23.0MP)
> - In 16:9 aspect ratio, 5984x3392 (20.3MP).
>
> This sensor supports high frame rates (>=60FPS) when in binning
> mode and both RAW8 and RAW10 output modes.
> In this version of the driver, support has been provided for the
> following resolutions:
>     W x H     SZ   MAX_FPS  BINNING
> - 5520x4160 23.0MP   23       No
> - 5984x3392 20.3MP   26       No
> - 2992x1696  3.8MP   60       Yes
> - 1424x800   1.2MP   120      Yes
>
> Note 1: The "standard" camera assy for IMX300 also contains an
> actuator (to focus the image), but this driver only manages the
> actual image sensor.
>
> Note 2: The command tables for this sensor were reverse
> engineered from a downstream "userspace driver" that has been
> released in various versions on various Xperia smartphones.
> Register layout seems to be only vaguely similar to IMX219,
> which has a public datasheet from where some names for the
> figured out registers were taken and added to the driver:
> these names are probably not the right ones, but they surely
> represent the intended thing.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Just a few drive-by comments, as I'm looking at selection targets for
other imx sensors and I've noticed this one on the list

> ---
>  drivers/media/i2c/Kconfig  |   13 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/imx300.c | 3081 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 3095 insertions(+)
>  create mode 100644 drivers/media/i2c/imx300.c
>

[snip]

> +/*
> + * ** IMX300 native and active pixel array size **
> + *
> + * Being this a multi-aspect sensor, the following native W/H apply, but
> + * beware: the module assembly usually has a (round) lens that is shadowing
> + * or covering the corners of the (square) image sensor, so the maximum
> + * output resolution must be lower than the maximum sensor resolution
> + * otherwise we get something like a view from a porthole... :)
> + *
> + * For 4:3  aspect ratio, max is: 5984x4140 (25MP)
> + * For 16:9 aspect ratio, max is: 5984x3392 (20.3MP)
> + */

These are the sizes

> +#define IMX300_NATIVE_WIDTH		5980U
> +#define IMX300_NATIVE_HEIGHT		4140U
> +#define IMX300_PIXEL_ARRAY_LEFT		0U
> +#define IMX300_PIXEL_ARRAY_TOP		0U
> +#define IMX300_PIXEL_ARRAY_WIDTH	5520U
> +#define IMX300_PIXEL_ARRAY_HEIGHT	4160U

And here is how they are applied to selection targets

> +	case V4L2_SEL_TGT_CROP: {
> +		struct imx300 *imx300 = to_imx300(sd);
> +
> +		mutex_lock(&imx300->mutex);
> +		sel->r = *__imx300_get_pad_crop(imx300, cfg, sel->pad,
> +						sel->which);
> +		mutex_unlock(&imx300->mutex);
> +
> +		return 0;
> +	}
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = IMX300_NATIVE_WIDTH;
> +		sel->r.height = IMX300_NATIVE_HEIGHT;
> +
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +		sel->r.top = IMX300_PIXEL_ARRAY_TOP;
> +		sel->r.left = IMX300_PIXEL_ARRAY_LEFT;
> +		sel->r.width = IMX300_PIXEL_ARRAY_WIDTH;
> +		sel->r.height = IMX300_PIXEL_ARRAY_HEIGHT;
> +
> +		return 0;
> +	}
> +

1) CROP_DEFAULT should be contained in NATIVE_SIZE (actually all
targets are contained in NATIVE_SIZE, and are defined relatively to
it). This means that IMX300_PIXEL_ARRAY_HEIGHT > IMX300_NATIVE_HEIGHT
is probably wrong.

2) You need to specify CROP_BOUNDS too. If the driver does not support
reading optically black pixels using the selection API, it should be
identical to CROP_DEFAULT (v4l2-compliance should report that, see
https://git.linuxtv.org/media_tree.git/commit/?id=1ed36ecd1459b653cced8929bfb37dba94b64c5d

3) CROP_DEFAULT (and BOUNDS) should report the sensor readable active
area. You have one mode where the TGT_CROP rectangle width is bigger
than the CROP_DEFAULT (and BOUNDS) rectangle width (5984 > 5520). I
think 5984 should probably be made the CROP_DEFAULT (and BOUNDS) width
then, as the 5984 mode's width implies the 464 pixels exceeding 5520
are readable and valid for image capture.

It's not easy to get these right with a datasheet sometimes, without
one it quickly becomes a matter of guessing. But even if the values are
computed as 'best effort' we should try to respect the relationships
between the different selection targets.

Thanks
  j
