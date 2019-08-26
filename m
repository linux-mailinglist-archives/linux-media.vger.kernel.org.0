Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56CB49CAFD
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2019 09:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730231AbfHZHxb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Aug 2019 03:53:31 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:34419 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730066AbfHZHxb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Aug 2019 03:53:31 -0400
X-Originating-IP: 87.18.63.98
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3EAA8FF80B;
        Mon, 26 Aug 2019 07:53:27 +0000 (UTC)
Date:   Mon, 26 Aug 2019 09:54:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] imx214: Use v4l2_ctrl_new_area helper
Message-ID: <20190826075457.n2doitmfswywrpy6@uno.localdomain>
References: <20190823123737.7774-1-ribalda@kernel.org>
 <20190823123737.7774-7-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ag5nue2vs66c2tae"
Content-Disposition: inline
In-Reply-To: <20190823123737.7774-7-ribalda@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ag5nue2vs66c2tae
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Aug 23, 2019 at 02:37:37PM +0200, Ricardo Ribalda Delgado wrote:
> Instead of creating manually the V4L2_CID_UNIT_CELL_SIZE control, lets
> use the helper.
>

I think you should drop 4/7 and use directly the new helper here.

Thanks
  j

> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/i2c/imx214.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index cc0a013ba7da..625617d4c81a 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -942,26 +942,6 @@ static int __maybe_unused imx214_resume(struct device *dev)
>  	return ret;
>  }
>
> -static void unit_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
> -		     union v4l2_ctrl_ptr ptr)
> -{
> -	ptr.p_area->width = 1120;
> -	ptr.p_area->height = 1120;
> -}
> -
> -static const struct v4l2_ctrl_type_ops unit_size_ops = {
> -	.init = unit_size_init,
> -};
> -
> -static struct v4l2_ctrl *new_unit_size_ctrl(struct v4l2_ctrl_handler *handler)
> -{
> -	static struct v4l2_ctrl_config ctrl = {
> -		.id = V4L2_CID_UNIT_CELL_SIZE,
> -		.type_ops = &unit_size_ops,
> -	};
> -
> -	return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
> -}
>  static int imx214_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
> @@ -969,6 +949,10 @@ static int imx214_probe(struct i2c_client *client)
>  	static const s64 link_freq[] = {
>  		IMX214_DEFAULT_LINK_FREQ,
>  	};
> +	struct v4l2_area unit_size = {
> +		.width = 1120,
> +		.height = 1120,
> +	};
>  	int ret;
>
>  	ret = imx214_parse_fwnode(dev);
> @@ -1050,7 +1034,10 @@ static int imx214_probe(struct i2c_client *client)
>  					     V4L2_CID_EXPOSURE,
>  					     0, 3184, 1, 0x0c70);
>
> -	imx214->unit_size = new_unit_size_ctrl(&imx214->ctrls);
> +	imx214->unit_size = v4l2_ctrl_new_area(&imx214->ctrls,
> +					       &imx214_ctrl_ops,
> +					       V4L2_CID_UNIT_CELL_SIZE,
> +					       &unit_size);
>
>  	ret = imx214->ctrls.error;
>  	if (ret) {
> --
> 2.23.0.rc1
>

--ag5nue2vs66c2tae
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1jkFEACgkQcjQGjxah
VjxsbA/9F2pksG16C7RtBs2UrBKqiGAbNyG2q2hAISrI+MgxbpdhXD6OY+oEydYj
+KgNoQiTV4ODdokQejJ3YrOCg76QVmSY4Xd+LwkbgJmresPGjq1h8HsmBft854AS
/FZ2JTEnQoPfb0BxlecHhfgj1lqHO9ePvN8Oe2r91p9kX0cwPS4KPzd4UJZZ/4wX
0jj+DzDW98jf1rohQtJ9unTrO5UIBubHRAXNGD3z7zHXMEpJto8SVi2Ek9a8gCwN
Su4Or4Snppr7YBVC4QlkPsxF/lxUcyW0edDdRQtfxDts3BjE5UguG/IMUj8dFsTN
XbwDRAGUbYYIzNrzx4baXaZ+FSyqk+KbyUqH+s0lAm1ju/thHKMLBuFLXip885Qy
+pOK76vRRjMCIuXP5vCCiIHZplVrxfyOomnTqjw1PsQ4/2ljv4Cz2cRB2pQVJECl
cAEgdfivU+h4EP2NOh1AR47F880Vde3l0E5YPcSzTJW0QJX5pfJPvuEFBV18RjG8
96wqHvAL2AjdoecQAcqL71MeYo3iUXH4Ed8B1EBNgT8j94QaSwK1L0Ogb1c6DtOl
59xh3p+z1yWc1ydZofSJwzyykwnlfeUHqjeG8uYrSZNzbMF0NZr4qEu3pZEp1N0Y
oAvjCfgcjJ16bvlmZRhNnObLJd4KyJhjYkD7s9bqSWX69TuFeeg=
=hMhH
-----END PGP SIGNATURE-----

--ag5nue2vs66c2tae--
