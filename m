Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0543BBDAE1
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 11:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbfIYJY1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 05:24:27 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:45359 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfIYJYP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 05:24:15 -0400
X-Originating-IP: 79.19.63.71
Received: from uno.localdomain (host71-63-dynamic.19-79-r.retail.telecomitalia.it [79.19.63.71])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0BC9BFF81B;
        Wed, 25 Sep 2019 09:24:11 +0000 (UTC)
Date:   Wed, 25 Sep 2019 11:25:52 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ricardo Ribalda Delgado <ricardo@ribalda.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: Re: [PATCH v6 7/7] media: imx214: Add new control with
 V4L2_CID_UNIT_CELL_SIZE
Message-ID: <20190925092552.okhiq5nweujjuk7q@uno.localdomain>
References: <20190920135137.10052-1-ricardo@ribalda.com>
 <20190920135137.10052-8-ricardo@ribalda.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="47sbnzcg7mpaau2w"
Content-Disposition: inline
In-Reply-To: <20190920135137.10052-8-ricardo@ribalda.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--47sbnzcg7mpaau2w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ricardo,

On Fri, Sep 20, 2019 at 03:51:37PM +0200, Ricardo Ribalda Delgado wrote:
> From: Ricardo Ribalda Delgado <ribalda@kernel.org>
>
> According to the product brief, the unit cell size is 1120 nanometers^2.
>
> https://www.sony-semicon.co.jp/products_en/IS/sensor1/img/products/ProductBrief_IMX214_20150428.pdf
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> ---
>  drivers/media/i2c/imx214.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 159a3a604f0e..57562e20c4ca 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -47,6 +47,7 @@ struct imx214 {
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *exposure;
> +	struct v4l2_ctrl *unit_size;
>
>  	struct regulator_bulk_data	supplies[IMX214_NUM_SUPPLIES];
>
> @@ -948,6 +949,13 @@ static int imx214_probe(struct i2c_client *client)
>  	static const s64 link_freq[] = {
>  		IMX214_DEFAULT_LINK_FREQ,
>  	};
> +	struct v4l2_area unit_size = {
> +		.width = 1120,
> +		.height = 1120,
> +	};
> +	union v4l2_ctrl_ptr p_def = {
> +		.p_area = &unit_size,
> +	};
>  	int ret;
>
>  	ret = imx214_parse_fwnode(dev);
> @@ -1029,6 +1037,10 @@ static int imx214_probe(struct i2c_client *client)
>  					     V4L2_CID_EXPOSURE,
>  					     0, 3184, 1, 0x0c70);
>
> +	imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
> +						       NULL,
> +						       V4L2_CID_UNIT_CELL_SIZE,
> +						       p_def);
>  	ret = imx214->ctrls.error;
>  	if (ret) {
>  		dev_err(&client->dev, "%s control init failed (%d)\n",

Would something like this scale? I'm a bit bothered by the need of
declaring v4l2_ctrl_ptr structure just to set a field there in
drivers.

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 57562e20c4ca..a00d8fa481c2 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -953,9 +953,6 @@ static int imx214_probe(struct i2c_client *client)
                .width = 1120,
                .height = 1120,
        };
-       union v4l2_ctrl_ptr p_def = {
-               .p_area = &unit_size,
-       };
        int ret;

        ret = imx214_parse_fwnode(dev);
@@ -1040,7 +1037,7 @@ static int imx214_probe(struct i2c_client *client)
        imx214->unit_size = v4l2_ctrl_new_std_compound(&imx214->ctrls,
                                                       NULL,
                                                       V4L2_CID_UNIT_CELL_SIZE,
-                                                      p_def);
+                                                      &unit_size);
        ret = imx214->ctrls.error;
        if (ret) {
                dev_err(&client->dev, "%s control init failed (%d)\n",
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index f626f9983408..4a2648bee6f5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -2681,18 +2681,26 @@ EXPORT_SYMBOL(v4l2_ctrl_new_std_menu_items);
 /* Helper function for standard compound controls */
 struct v4l2_ctrl *v4l2_ctrl_new_std_compound(struct v4l2_ctrl_handler *hdl,
                                const struct v4l2_ctrl_ops *ops, u32 id,
-                               const union v4l2_ctrl_ptr p_def)
+                               void *defval)
 {
        const char *name;
        enum v4l2_ctrl_type type;
        u32 flags;
        s64 min, max, step, def;
+       union v4l2_ctrl_ptr p_def;

        v4l2_ctrl_fill(id, &name, &type, &min, &max, &step, &def, &flags);
        if (type < V4L2_CTRL_COMPOUND_TYPES) {
                handler_set_err(hdl, -EINVAL);
                return NULL;
        }
+
+       switch ((u32)type) {
+       case V4L2_CTRL_TYPE_AREA:
+               p_def.p_area = defval;
+               break;
+       }
+
        return v4l2_ctrl_new(hdl, ops, NULL, id, name, type,
                             min, max, step, def, NULL, 0,
                             flags, NULL, NULL, p_def, NULL);

However, due to my limitied understanding of the control framework, I
cannot tell how many cases the newly introduced switch should
handle...

> --
> 2.23.0
>

--47sbnzcg7mpaau2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl2LMqAACgkQcjQGjxah
Vjx1eA//eV727htb6qRYEJ1UK7FSHTrkrc9H7e1hgOXWKsZtEYOArc9GknPeLZoW
CqDyhB9X2cPwuOWacfc7n7zC0xdBr7TcGl3WdCcbbL/FZ0cLOQryQWz//O7kj02Z
xY3mwJar6NR70zF6fzEe43PeTHjNLGAo35xwnggl3Hp8Ejh57ymUD0iYw6fvZTi+
x2T6t7e2KPDDQ8TBayfhnqK90yq/vAC9p5QvOaodDrurPvp9Wt6mltmTLt8IMJX3
XrnA6+D3NW3du5C6biaBn06D9gKnV0G32LeZEnwCykRA0zqROZReTYWJ7Qo4IkBH
p0d2YA214GClV5ztVmn17AfzylOMZ4uTuu3x3B7spzIzSu9nYdmHWkwveCEpcxcx
8vKZk5N3XA3Wq2J6zeVjdylhRPmGulSeKVKLFldat/VC38uolmSfnn79jtRiaFYA
nnZMtXf/24OoAIZItvJTF9Nj95kagezcScKpNVR0bbjN05UyDPKaFyU9tDnhmZOE
cdCfIbrNYMm1Vu5fsQyHm+AnK53HQbf/GmHkRa9CoYVbMfcItXrsidgf0LXz5nmu
RA9EFQl3aTRFxeGLhY0rECU1W6E8jN7CzrLrYXgLIeIiLPXmlx6YaCR4EkXWI6C4
VSiRs9owFE1/AhU2B59ZqLzmxTuEFABwkBoYB0RcVXEkd25u4IM=
=ULmD
-----END PGP SIGNATURE-----

--47sbnzcg7mpaau2w--
