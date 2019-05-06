Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF41E14B03
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 15:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbfEFNiQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 09:38:16 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50487 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbfEFNiQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 May 2019 09:38:16 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 844E924001C;
        Mon,  6 May 2019 13:38:06 +0000 (UTC)
Date:   Mon, 6 May 2019 15:39:05 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hans.verkuil@cisco.com, jacopo+renesas@jmondi.org,
        robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH v6 13/13] media: tvp5150: make debug output more readable
Message-ID: <20190506133905.gvdgrei5n6crbwxc@uno.localdomain>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
 <20190415124413.18456-14-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ytby4rv5fpn2xb64"
Content-Disposition: inline
In-Reply-To: <20190415124413.18456-14-m.felsch@pengutronix.de>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ytby4rv5fpn2xb64
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Marco,
  thanks

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

On Mon, Apr 15, 2019 at 02:44:13PM +0200, Marco Felsch wrote:
> The debug output for tvp5150_selmux() isn't really intuitive. Register
> values are printed decimal formatted and the input/output driver states
> are printed as enum. Even more the "normal" output enum mapps to zero so
> a active output will printing output=0 and a inactive output=1.
>
> Change this by brinting the register values hex formatted and the states
> as more readable string.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/media/i2c/tvp5150.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
> index c0ee08546643..13ee6d781efb 100644
> --- a/drivers/media/i2c/tvp5150.c
> +++ b/drivers/media/i2c/tvp5150.c
> @@ -302,9 +302,12 @@ static void tvp5150_selmux(struct v4l2_subdev *sd)
>  		break;
>  	}
>
> -	dev_dbg_lvl(sd->dev, 1, debug, "Selecting video route: route input=%i, output=%i => tvp5150 input=%i, opmode=%i\n",
> -			decoder->input, decoder->output,
> -			input, opmode);
> +	dev_dbg_lvl(sd->dev, 1, debug,
> +		    "Selecting video route: route input=%s, output=%s => tvp5150 input=0x%02x, opmode=0x%02x\n",
> +		    decoder->input == 0 ? "aip1a" :
> +		    decoder->input == 2 ? "aip1b" : "svideo",
> +		    decoder->output == 0 ? "normal" : "black-frame-gen",
> +		    input, opmode);
>
>  	regmap_write(decoder->regmap, TVP5150_OP_MODE_CTL, opmode);
>  	regmap_write(decoder->regmap, TVP5150_VD_IN_SRC_SEL_1, input);
> --
> 2.20.1
>

--ytby4rv5fpn2xb64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlzQOPkACgkQcjQGjxah
VjznAg//dODoy3i18xQaDyQL/9/cB5Yj5K/pC2mfndsMHOHav7xm7ikuAZ8oEhA7
3bfJnbTWFKU9qvQnozkf0VDDszqvyzpyJtSdVLPCFml87cpx6PLdd6txFUoL3Cc/
PkmvrQA+8K4waii86qubtdI5Hr5tcvRj14gnOmND4GEQlvvWhWT8silh3BsG56/M
exZmDyVC7TK6wUAGss0/ByfdC5AM/rOU0aZ2FlTZE3UWt0vDyM08CZ612Z0AE6xJ
1oJyWBbzbpzNXUlMMyOZxQoTZrR1sL/ji+RGVNNveOR52g/IsugCSwgXW5Trt5hS
Wea+v7gOZzGjFfmvYxTzYZ8gVv+Gt0u9tLQeHeJXpoGqW3kzEyQRc7VV/gNFD6TP
1cTkH9nH9q9/u7UQyMn17bkekJSk2/WbJD90nkFfuZAyKSOC68YnXx3LGrZtRtC7
ZlmkHxwLOtt63/nx92SkzmquIVC9bY6BJmAqjE6izKOhtkP9WKQAIVGtDGYJQDF8
GtB0qtw28uUEWtb3kkoOBHjZ6yQ02DLPnePt2mrZQBJpXYtxGNUJdaw1Pp19tSeL
cC69grf6OnzERkQHDGrQ9tP1skiBaEeUDiWtRYhhDYnmw3W4C6UdC45dpU5n+lTj
kIDMq6F2EPHdLpmxpd9v+NsifRSbl23cwAjjJJYp8DrdDNuZ5qM=
=qR7O
-----END PGP SIGNATURE-----

--ytby4rv5fpn2xb64--
