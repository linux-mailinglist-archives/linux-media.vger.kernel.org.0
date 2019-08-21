Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6DB98028
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 18:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfHUQcU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 12:32:20 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:43846 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfHUQcU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 12:32:20 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9225C3A0666;
        Wed, 21 Aug 2019 16:14:16 +0000 (UTC)
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5776540007;
        Wed, 21 Aug 2019 16:13:54 +0000 (UTC)
Date:   Wed, 21 Aug 2019 18:15:23 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: imx214: Add new control with
 V4L2_CID_PIXEL_SIZE
Message-ID: <20190821161523.6lckivpwiihpl35z@uno.localdomain>
References: <20190819121720.31345-1-ribalda@kernel.org>
 <20190819121720.31345-3-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hqaeubgbfew7wbst"
Content-Disposition: inline
In-Reply-To: <20190819121720.31345-3-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hqaeubgbfew7wbst
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Mon, Aug 19, 2019 at 02:17:20PM +0200, Ricardo Ribalda Delgado wrote:
> According to the product brief, the unit cell size is 1120 nanometers^2.

Should this information come from DT ?

I'm asking as I've a series in review that adds an helper that
collectes dt properties and register controls for them. It currently
only supports the newly proposed camera location control, but there
might be others like the rotation, for which we already have a DT
property.

https://patchwork.kernel.org/project/linux-media/list/?series=160901

This new one is indeed an HW property of the sensor, I wonder if
having it in the firmware interface would make any sense or not...

Thanks
  j

>
> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/i2c/imx214.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 159a3a604f0e..b2f6bd2d8d7d 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -47,6 +47,7 @@ struct imx214 {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *pixel_size;
>
>  	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
>
> @@ -941,6 +942,26 @@ static int __maybe_unused imx214_resume(struct device *dev)
>  	return ret;
>  }
>
> +static void pixel_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> +		     union v4l2_ctrl_ptr ptr)
> +{
> +	ptr.p_pixel_size->width = 1120;
> +	ptr.p_pixel_size->height = 1120;
> +}
> +
> +static const struct v4l2_ctrl_type_ops pixel_size_ops = {
> +	.init = pixel_size_init,
> +};
> +
> +static struct v4l2_ctrl *new_pixel_size_ctrl(struct v4l2_ctrl_handler *handler)
> +{
> +	static struct v4l2_ctrl_config ctrl = {
> +		.id = V4L2_CID_PIXEL_SIZE,
> +		.type_ops = &pixel_size_ops,
> +	};
> +
> +	return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
> +}
>  static int imx214_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -1029,6 +1050,8 @@ static int imx214_probe(struct i2c_client *client)
>  					     V4L2_CID_EXPOSURE,
>  					     0, 3184, 1, 0x0c70);
>
> +	imx214->pixel_size = new_pixel_size_ctrl(&imx214->ctrls);
> +
>  	ret = imx214->ctrls.error;
>  	if (ret) {
>  		dev_err(&client->dev, "%s control init failed (%d)\n",
> --
> 2.23.0.rc1
>

--hqaeubgbfew7wbst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1dbhsACgkQcjQGjxah
VjwFzQ//cejLSt5kyeGMDJXBZdhAv4HpOaPRqHTO63BDgy1AdXVAfRziWShlRDdZ
IlJ7owMefKxLYduoTeSZp+shQd9BS/C3HnMVY+P12gL86WcGVwRab7LwMTuciDfy
PmF20w+4rg1CCAkHfbO9Y1uJbuDQNXqn/jWogjHJ2OhyRnUuZ/1R8elQTtzRo7F+
chM5NE6raCfZRZRDOuWgyRJWWyjGaaltaN33Q1PfApfDv1pyTYNWpDkuvRgQevqQ
O+QkOwYkagYhzd8k48+fUpL07oWBOkDiXENP4i3fq9Z8aYSn5C3xuofNd+GDLjRI
lp5pAbG4b0K94YQh9IAkRFx3r25A47ywIzGsWbT+Qy/etIP5b/CbTwsLzM/UcZ+9
85b3nxAEd+EFmPOSoYNkPG7AFld+CtiB8GzU/dxhcIIvnyPX98C/iPG5ziTU9Tpi
bHN9k6EskgDRkjWV7Rngqg58lbkdgdBAo7sgON2R2L1hgzyWUYDZ5+VMgbK4kl0e
NVB2xbEyKLSClTr81FZsbg4u7hMs5ias6dwaGMvepVoPjJvavxNmZT75kTh4uwsq
ZOjhebFKfMxZUmRikPec/nG/Lhs6A9+IZsRVGlej1ETgaFhs7+tafzXxgpSEGGYn
ys+QdcHVKO2tMIQxPl9qHmGeNdqWhhk0m7HzV/jd3ZqWiIIeIRA=
=yxQy
-----END PGP SIGNATURE-----

--hqaeubgbfew7wbst--
