Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9F557D41
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfF0His (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:38:48 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53975 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0His (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:38:48 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 16A30240005;
        Thu, 27 Jun 2019 07:38:41 +0000 (UTC)
Date:   Thu, 27 Jun 2019 09:39:57 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH] media: imx: mipi csi-2: Don't fail if initial state
 times-out
Message-ID: <20190627073957.z55pa24ih2xqw5pa@uno.localdomain>
References: <20190625203945.28081-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bdzir2qwavwpd4vz"
Content-Disposition: inline
In-Reply-To: <20190625203945.28081-1-ezequiel@collabora.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--bdzir2qwavwpd4vz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Ezequiel,

On Tue, Jun 25, 2019 at 05:39:45PM -0300, Ezequiel Garcia wrote:
> Not all sensors will be able to guarantee a proper initial state.
> This may be either because the driver is not properly written,
> or (probably unlikely) because the hardware won't support it.
>
> While the right solution in the former case is to fix the sensor
> driver, the real world not always allows right solutions, due to lack
> of available documentation and support on these sensors.
>

We hit this in the past with the ov5640 sensor, whose driver was not
properly initializing its data lanes in LP-11 state, so yes, I'm not
surprised other sensors might fail in the same way.

Do you get frames after you hit the error? I recall it was not
possible with ov5640, even with something similar to what you've done
here in the CSI-2 receiver driver.

> Let's relax this requirement, and allow the driver to support stream start,
> even if the sensor initial sequence wasn't the expected.
> A warning is still emitted, so users should be hinted that something is off.
>

It seems you're also silencing errors related to clock lane detection.
I would mention that.

> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 33 ++++++----------------
>  1 file changed, 9 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index f29e28df36ed..10342434e797 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
>  }
>
>  /* Waits for low-power LP-11 state on data and clock lanes. */
> -static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>  {
>  	u32 mask, reg;
>  	int ret;
> @@ -253,29 +253,21 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
>
>  	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>  				 (reg & mask) == mask, 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
>  }
>
>  /* Wait for active clock on the clock lane. */
> -static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
> +static void csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
>  {
>  	u32 reg;
>  	int ret;
>
>  	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
>  				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
> -	if (ret) {
> -		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> -			 reg);
> -		return ret;
> -	}
> -
> -	return 0;
> +	if (ret)
> +		v4l2_warn(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
> +			  reg);
>  }
>
>  /* Setup the i.MX CSI2IPU Gasket */
> @@ -316,9 +308,7 @@ static int csi2_start(struct csi2_dev *csi2)
>  	csi2_enable(csi2, true);
>
>  	/* Step 5 */
> -	ret = csi2_dphy_wait_stopstate(csi2);
> -	if (ret)
> -		goto err_assert_reset;
> +	csi2_dphy_wait_stopstate(csi2);
>
>  	/* Step 6 */
>  	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
> @@ -327,14 +317,9 @@ static int csi2_start(struct csi2_dev *csi2)
>  		goto err_assert_reset;
>
>  	/* Step 7 */
> -	ret = csi2_dphy_wait_clock_lane(csi2);
> -	if (ret)
> -		goto err_stop_upstream;
> -
> +	csi2_dphy_wait_clock_lane(csi2);
>  	return 0;
>
> -err_stop_upstream:
> -	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
>  err_assert_reset:
>  	csi2_enable(csi2, false);
>  err_disable_clk:
> --
> 2.20.1
>

--bdzir2qwavwpd4vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0Ucs0ACgkQcjQGjxah
Vjw9AQ//XyeBDHUkzW5v/hP3QjhExjfzvqrf020W3P6PglCFHO31JYzaOo3v5/t7
33KrxrpFd5VTJzdrn7cSCaKo2hkKbAiODYPKJ1/ASvwbnOEIBtWZAJ70EMFv3ANB
aH4tiFkJMYcvFTZMw60r5PExjIUmy2o8/In29Ob8Jmkl+wochKwe2UwmA/T2qwJo
7VUW6qcWw8Hn9XToblKwZAO4ipTF3d9sGhqgrBGvBjJ1A1F5YKK5H52rsQQMUzdb
1BLSvdvPQyPRzwJk8wz15xarNJ/Q+f6ZPPdJ1NLakHt9mPmDFfjD7LbatLbRK48a
5MX826uz9+7mJdLsZVUX+WRhpColArCD8egfd1GQqODAY0/Ms0uLrLxUGeiFAq8Z
3D53Zyg8FEz3nvxgCnyVv3STV7wa6MQfW+YyVwO62IydxaBPymvNOtwbneoOwRNm
KEBir2kNBElWOEutU09ZRqoGqJsWi9Q/2AD/Ygh5wVjDDs7bXe4sRm01BhjuxOIF
bIUVqYYPw+nsb6au/rSM/MDdO/6gUS5SDv4TB0UVJMcWcdxOOuzQ9lhSk1QnUVot
Q95RCrjCbedjGlHVxKd+b5QqqaQ4mKzY8ZGISSwv/DgoQqa76axwW/4B9rydg9Wn
thBaNCCJ22RbZF/UJZA6b1qRY39wCox+HHUfkfecsUnviBik/Kw=
=BS/G
-----END PGP SIGNATURE-----

--bdzir2qwavwpd4vz--
