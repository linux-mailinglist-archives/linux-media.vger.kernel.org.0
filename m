Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02D3678199
	for <lists+linux-media@lfdr.de>; Sun, 28 Jul 2019 22:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfG1UyB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jul 2019 16:54:01 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:46155 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfG1UyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jul 2019 16:54:00 -0400
X-Originating-IP: 82.58.19.211
Received: from uno.localdomain (host211-19-dynamic.58-82-r.retail.telecomitalia.it [82.58.19.211])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 7C9A11BF205;
        Sun, 28 Jul 2019 20:53:56 +0000 (UTC)
Date:   Sun, 28 Jul 2019 22:55:13 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laura Nao <laura.nao@kynetics.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        sam@elite-embedded.com
Subject: Re: Issues with ov5640 camera on i.MX6Q
Message-ID: <20190728205513.pd6w7j5wi7dc2yib@uno.localdomain>
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5574y5muicmj2ngy"
Content-Disposition: inline
In-Reply-To: <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--5574y5muicmj2ngy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laura,

I went through your changes and tried to make a sense out of them. Good job
finding them out!


On Mon, Jul 22, 2019 at 05:50:35PM +0200, Laura Nao wrote:
> Thanks Fabio!
>
> I tried tweaking the PLL configuration in the driver and did some further
> tests on 5.2 kernel.
>
> I was finally able to capture RAW frames that match the test pattern for
> 1280x720 and 1920x1080 resolutions. The 2592x1944 frame is still not
> perfectly aligned, but it looks much closer to the test pattern.
>
> I uploaded the images here:
>
> https://imgur.com/a/ywHokMf
>
> The changes I made in the driver are below. Not sure these changes make much
> sense, but they seem to fix 1280x720 and 1920x1080 frames.
>

As you have reported I have no good images for resolutions < 1280x720
too.

> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 759d60c6..cfa678e 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -795,13 +795,13 @@ static int ov5640_mod_reg(struct ov5640_dev *sensor,
> u16 reg,
>   * FIXME: to be re-calcualted for 1 data lanes setups
>   */
>  #define OV5640_MIPI_DIV_PCLK	2
> -#define OV5640_MIPI_DIV_SCLK	1
> +#define OV5640_MIPI_DIV_SCLK	2
>

With this change we're now basically always setting MIPI DIV to 2, in
both the cases marked in the driver as "scaler" or "non scaler"

The best explanation I could give, based on what reported by Sam here
and in the follow up email [1] is that when capturing in RAW mode
we're always bypassing the ISP scaler, and we're thus acting always in
"non-scaler" mode.

Recalling the "non verified constraints" mentioned in the past emails:

Non-ISP-scaler:
MIPI_CLK = 4 ; PCLK = 2; SCLK = 1

ISP-scaler:
MIPI_CLK = 8 ; PCLK = 2; SCLK = 1

Your above change makes the system work in Non-ISP-scaler mode for RAW
formats. The fact we still have troubles capturing resolution <
1280x720 (the ones described as going through the scaler) makes me
suspect my explanation is only not totally correct though.

I tried playing a bit around with the dividers in the clock tree
without getting much at the moment... I'll keep working on this in the
next days and i you have any idea to share I'm all hears...

https://www.spinics.net/lists/linux-media/msg141854.html

>  /*
>   * This is supposed to be ranging from 1 to 2, but the value is always
>   * set to 2 in the vendor kernels.
>   */
> -#define OV5640_PLL_ROOT_DIV			2
> +#define OV5640_PLL_ROOT_DIV			1

This is not relevant for MIPI, but only for DVP mode.

If you want to bypass the PLL ROOT DIVIDER for MIPI you should change
this line:

	ret = ov5640_mod_reg(sensor, OV5640_REG_SC_PLL_CTRL3,
			     0x1f, OV5640_PLL_CTRL3_PLL_ROOT_DIV_2 | prediv);

and set bit 0x10 to 0 according to the manual.


>  #define OV5640_PLL_CTRL3_PLL_ROOT_DIV_2		BIT(4)
>
>  /*
> @@ -836,8 +836,8 @@ static unsigned long ov5640_compute_sys_clk(struct
> ov5640_dev *sensor,
>  	unsigned long sysclk = sensor->xclk_freq / pll_prediv * pll_mult;
>
>  	/* PLL1 output cannot exceed 1GHz. */
> -	if (sysclk / 1000000 > 1000)
> -		return 0;
> +	// if (sysclk / 1000000 > 1000)
> +	// 	return 0;

This is weird :)

I've seen it making a difference sometime, but most of the time it did
not.

I printed out the PLL1 output configuration at the end of
"ov5640_calc_sys_clk()" with:

@@ -899,6 +899,9 @@ static unsigned long ov5640_calc_sys_clk(struct ov5640_dev *sensor,
        *sysdiv = best_sysdiv;
        *pll_prediv = OV5640_PLL_PREDIV;
        *pll_mult = best_mult;
+       pr_err("%s:%d rate %ld - best %ld - PLL1 out %ld - prediv %u - mult %u - sysdiv %u \n",
+               __func__, __LINE__, rate, best, (best * best_sysdiv), *pll_prediv, *pll_mult, best_sysdiv);
+

        return best;
 }

and with this part commented out I get (for 1280x720)
ov5640_calc_sys_clk:902 rate 336019200 - best 338666666 - PLL1 out 1015999998 - prediv 3 - mult 127 - sysdiv 3

While if I keep the 1GHz limit in place I sometimes have half-crippled
images and the PLL gets configured as:
ov5640_calc_sys_clk:902 rate 336019200 - best 340000000 - PLL1 out 680000000 - prediv 3 - mult 85 - sysdiv 2

Apparently the PLL gets configured with a too fast clock if we remove
the limit. Ironic :) There might be some tolerance in the 1GHz limit,
or we're hitting a corner case maybe... How often does capture fails
for you without this change in and for which resolution...

Sorry for not being able to go much further but resurrecting my testing
setup took quite some time :)

Thanks
  j


>
>  	return sysclk / sysdiv;
>  }
> @@ -1818,7 +1824,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
>  	 * All the formats we support have 16 bits per pixel, seems to require
>  	 * the same rate than YUV, so we can just use 16 bpp all the time.
>  	 */
> -	rate = mode->vtot * mode->htot * 16;
> +	rate = mode->vtot * mode->htot * 8;
>  	rate *= ov5640_framerates[sensor->current_fr];
>  	if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY) {
>  		rate = rate / sensor->ep.bus.mipi_csi2.num_data_lanes;
>
> Thanks,
>
> Best,
>
> Laura
>
> On 7/22/19 2:45 PM, Fabio Estevam wrote:
> > [Adding Steve and Philipp]
> >
> > On Thu, Jul 18, 2019 at 10:06 AM Laura Nao <laura.nao@kynetics.com> wrote:
> > >
> > > Hello Loic,
> > >
> > > I'm having some issues with RAW8 mode on the OV5640 camera and I'd like
> > > to kindly ask for your advice, as I saw that you added support for RAW
> > > mode in the mainline kernel driver.
> > >
> > > I'm trying to capture some raw images on a i.MX6Q based board. I
> > > configured the pipeline as follows:
> > >
> > > media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > media-ctl -V "'ov5640 1-003c':0 [fmt:SBGGR8_1X8/2592x1944 field:none]"
> > > media-ctl -V "'imx6-mipi-csi2':2 [fmt:SBGGR8_1X8/2592x1944 field:none]"
> > >
> > > I'm capturing the frame using v4l-utils:
> > >
> > > v4l2-ctl -d /dev/video5 --verbose --set-fmt
> > > video=width=2592,height=1944,pixelformat=BA81 --stream-mmap
> > > --stream-count=1 --stream-to=bggr_2592x1944.raw
> > >
> > > The images I'm obtaining are completely garbled. I tried both 5.2
> > > mainline and 5.1.18 kernels.
> > >
> > > I'm able to correctly capture YUV frames in all resolutions with the
> > > same driver (with the pipeline configured to go through the
> > > ipu1_ic_prpenc node first).
> > >
> > > Do you have any insight on what might be causing these issues? Is the
> > > PLL configuration supposed to be changed when RAW8 format is selected?
> > >
> > > Thanks for your help,
> > >
> > > Best regards,
> > >
> > > Laura

--5574y5muicmj2ngy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl0+C7EACgkQcjQGjxah
VjxvUw/+Nh4gqVcB4ye1fDZNAPk/V0QTueAgdUUPqdbtBdpRGB6SrwrM8CDq8HWd
Aha8AhHNvCUzumYNopo1r5VtE8Vu5jfiI2y25+5nUBN38jkFqp9Nlo8YvNyGlTmb
+zVy5bFUQ+jit25Rl8pprLseGkCwY2lS92HqNwYPZInbJT7tia5Ke7pTiiBvOUei
+//lCzY1MVYs1KqSuV3TYaNPF9xrc7VW6hF/sw4tbaTiLQCER8aivWVGm9BNA2zO
MiBVryTdx0+7hHAdCKk3z2aJPqnzb5GQ80xnYCkOF9sB0Upr53XhNyIdEgbHYL33
FboGbsh/3+J07K3s95d02r7Ns4UbBXU9266QwSZ7b+OTZc9+sMAqrremazHgNpqx
XEEsUuUg1HWWWeb567zZnrNW5nmsxoiV4WAqBqATaFYtKALwOMhmU+3VsFIDkpa3
WmsPQqMVunv0tp+MOX4XPOT4YuqPRWhTf1GcnsDSyK2Nd03DdvGgzwlFtsuymRqj
UafaEMKgP/slH6lJsyDZME6pW+VWRVlrPfMzwc5Ii9PK6facnb7MzChRgwUD2LSp
tYwGG8B5bLKHtxZaXtfHALhy0750H0HM1kSGGW+ELMTxtK700CnUqe8ILf4HuJyy
DiL1VUhd2283KQr4nz3ZGYCnMywnd3IobL6GgkKwJaMflCRPT2o=
=aTIU
-----END PGP SIGNATURE-----

--5574y5muicmj2ngy--
