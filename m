Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41417BC31
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 10:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387458AbfGaIsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 04:48:11 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:59321 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbfGaIrK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 04:47:10 -0400
X-Originating-IP: 82.58.19.211
Received: from uno.localdomain (host211-19-dynamic.58-82-r.retail.telecomitalia.it [82.58.19.211])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id ADBAA2000D;
        Wed, 31 Jul 2019 08:47:05 +0000 (UTC)
Date:   Wed, 31 Jul 2019 10:48:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2] media: i2c: ov5645: Fix power sequence
Message-ID: <20190731084823.gtplita7b5qhhpbd@uno.localdomain>
References: <20190710184000.8995-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="trkltqca3saeufrd"
Content-Disposition: inline
In-Reply-To: <20190710184000.8995-1-ezequiel@collabora.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--trkltqca3saeufrd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ezequiel,

On Wed, Jul 10, 2019 at 03:40:00PM -0300, Ezequiel Garcia wrote:
> This is mostly a port of Jacopo's fix:
>
>   commit aa4bb8b8838ffcc776a79f49a4d7476b82405349
>   Author: Jacopo Mondi <jacopo@jmondi.org>
>   Date:   Fri Jul 6 05:51:52 2018 -0400
>
>   media: ov5640: Re-work MIPI startup sequence
>
> In the OV5645 case, the changes are:
>
> - Move OV5645_IO_MIPI_CTRL00 (0x300e) out of the initial setting blob.

You should change this, as I still see this part of the initial
settings blob.

Apart from that
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> - At set_power(1) time power up MIPI Tx/Rx and set data and clock lanes in
>   LP11 during 'sleep' and 'idle' with MIPI clock in non-continuous mode.
> - At set_power(0) time power down MIPI Tx/Rx (in addition to the current
>   power down of regulators and clock gating).
> - At s_stream time enable/disable the MIPI interface output.
>
> With this commit the sensor is able to enter LP-11 mode during power up,
> as expected by some CSI-2 controllers.
>
> Many thanks to Fabio Estevam for his help debugging this issue.
>
> Tested-by: Fabio Estevam <festevam@gmail.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> Changes in v2:
> * As suggested by Philipp, move the initial configuration
>   to the ov5645_global_init_setting array.
> ---
>  drivers/media/i2c/ov5645.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index 124c8df04633..58972c884705 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -45,6 +45,8 @@
>  #define		OV5645_CHIP_ID_HIGH_BYTE	0x56
>  #define OV5645_CHIP_ID_LOW		0x300b
>  #define		OV5645_CHIP_ID_LOW_BYTE		0x45
> +#define OV5645_IO_MIPI_CTRL00		0x300e
> +#define OV5645_PAD_OUTPUT00		0x3019
>  #define OV5645_AWB_MANUAL_CONTROL	0x3406
>  #define		OV5645_AWB_MANUAL_ENABLE	BIT(0)
>  #define OV5645_AEC_PK_MANUAL		0x3503
> @@ -55,6 +57,7 @@
>  #define		OV5645_ISP_VFLIP		BIT(2)
>  #define OV5645_TIMING_TC_REG21		0x3821
>  #define		OV5645_SENSOR_MIRROR		BIT(1)
> +#define OV5645_MIPI_CTRL00		0x4800
>  #define OV5645_PRE_ISP_TEST_SETTING_1	0x503d
>  #define		OV5645_TEST_PATTERN_MASK	0x3
>  #define		OV5645_SET_TEST_PATTERN(x)	((x) & OV5645_TEST_PATTERN_MASK)
> @@ -121,7 +124,6 @@ static const struct reg_value ov5645_global_init_setting[] = {
>  	{ 0x3503, 0x07 },
>  	{ 0x3002, 0x1c },
>  	{ 0x3006, 0xc3 },
> -	{ 0x300e, 0x45 },
>  	{ 0x3017, 0x00 },
>  	{ 0x3018, 0x00 },
>  	{ 0x302e, 0x0b },
> @@ -350,7 +352,10 @@ static const struct reg_value ov5645_global_init_setting[] = {
>  	{ 0x3a1f, 0x14 },
>  	{ 0x0601, 0x02 },
>  	{ 0x3008, 0x42 },
> -	{ 0x3008, 0x02 }
> +	{ 0x3008, 0x02 },
> +	{ OV5645_IO_MIPI_CTRL00, 0x40 },
> +	{ OV5645_MIPI_CTRL00, 0x24 },
> +	{ OV5645_PAD_OUTPUT00, 0x70 }
>  };
>
>  static const struct reg_value ov5645_setting_sxga[] = {
> @@ -737,13 +742,9 @@ static int ov5645_s_power(struct v4l2_subdev *sd, int on)
>  				goto exit;
>  			}
>
> -			ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
> -					       OV5645_SYSTEM_CTRL0_STOP);
> -			if (ret < 0) {
> -				ov5645_set_power_off(ov5645);
> -				goto exit;
> -			}
> +			usleep_range(500, 1000);
>  		} else {
> +			ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x58);
>  			ov5645_set_power_off(ov5645);
>  		}
>  	}
> @@ -1049,11 +1050,20 @@ static int ov5645_s_stream(struct v4l2_subdev *subdev, int enable)
>  			dev_err(ov5645->dev, "could not sync v4l2 controls\n");
>  			return ret;
>  		}
> +
> +		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x45);
> +		if (ret < 0)
> +			return ret;
> +
>  		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
>  				       OV5645_SYSTEM_CTRL0_START);
>  		if (ret < 0)
>  			return ret;
>  	} else {
> +		ret = ov5645_write_reg(ov5645, OV5645_IO_MIPI_CTRL00, 0x40);
> +		if (ret < 0)
> +			return ret;
> +
>  		ret = ov5645_write_reg(ov5645, OV5645_SYSTEM_CTRL0,
>  				       OV5645_SYSTEM_CTRL0_STOP);
>  		if (ret < 0)
> --
> 2.20.1
>

--trkltqca3saeufrd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1BVdIACgkQcjQGjxah
VjxoXxAAw1lfm4mixqlzqYQi6robTRV9RiptCRIMS2FrFJ8t5+LtXQPgrGAIOtuc
yKwaHc4sLTfbp9Qa0ZFDfx1Ti9aaQLHKz514z1e5jl6qJ7Yy17lxJ3slhjkUKX31
pn6FOGJQ7xFLndYp84A/dnPob5dGbxJaD1fY14RlKcnmgRWE14juJhG/WvJXZd2f
M9UEQGGZadCdvUv27mzEAVk5nVM/8Plv5l0gmyRR1g9yyNSlRtGnSoDxbS79aIrj
JJH589w/DlWBHs+eeAZbkc4FVEC4fQbloiIvuI9zxI5JhzxTLcVm0MzG8K5CxanX
9Sz2wYFiI1awo59zYOopFuzxWtqGD9zr0DhtGfYCQ3GpOl4lflA5lyqsMpUfSBOn
PKY6EGN3IP+nJfkiaEulcpn3EAV7Up/ONqYV5ii2owLbNwuwtoq++APoNxmoS0LF
AF5zu2vbrNuRmFEq/lylmj+YIwx/nWJ1Ia8bWVvztBDEhU4d9fjRUn8rbaTZMGqJ
5GOM0M9vNDZDy4iPRQDBG8P/PlvnaTBy7LIn9NizdRR9bTZzfKSMydr1NfTnlgA4
MFptCOx2q/t9OU+cNleGh2U9F0Gp7AdQSbgGtJb0RufAbqWSjd2D+dtl72W92OuD
4KfcntfLHlE8ecUykmpfj89jhjWOf6P69RlvS8ZDSyfPkjpEsnI=
=iUjl
-----END PGP SIGNATURE-----

--trkltqca3saeufrd--
