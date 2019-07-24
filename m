Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B274773223
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387480AbfGXOsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:48:37 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:39613 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfGXOsh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:48:37 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8EB6B2000C;
        Wed, 24 Jul 2019 14:48:33 +0000 (UTC)
Date:   Wed, 24 Jul 2019 16:49:55 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laura Nao <laura.nao@kynetics.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        loic.poulain@linaro.org, linux-media <linux-media@vger.kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        sam@elite-embedded.com
Subject: Re: Issues with ov5640 camera on i.MX6Q
Message-ID: <20190724144955.ek6dmlcjjqc3wo2d@uno.localdomain>
References: <890e6dbe-2d8e-d674-b17e-2421a38e7acd@kynetics.com>
 <CAOMZO5B3GV8fPLAdsxx2F+dyH68xPn6MN5rehEvwDvjJmirZrg@mail.gmail.com>
 <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ul4tbihbxyekdz6p"
Content-Disposition: inline
In-Reply-To: <9785bc82-b741-b60c-ccd7-efdd2b507c6f@kynetics.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ul4tbihbxyekdz6p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laura,
   thanks for addressing this issue.

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

So, this has finally happened :)

When ~1 year ago we addressed dynamic clock computation for this
driver the only cases that were tested where the DVP interface by
Maxime and the CSI-2 one on my side but only for formats with 16bpp
and 2 data lanes, so I'm not surprised by the fact 8-bit raw fails
with the current implementation.[1]

[1] https://patchwork.kernel.org/patch/10680571/

The driver has clearly commented that once we were to support more
formats some changes would be required. In example, just before the
ov5640_set_mipi_pclk() function a FIXME comment reports:

 * FIXME: this have been tested with 16bpp and 2 lanes setup only.
 * MIPI_DIV is fixed to value 2, but it -might- be changed according to the
 * above formula for setups with 1 lane or image formats with different bpp.
 *
 * FIXME: this deviates from the sensor manual documentation which is quite
 * thin on the MIPI clock tree generation part.

I tried to extensively comment there PLL calculation procedure I
deduced from the not-so-clear documentation for the sensor, and I
must admit everytime I look at it again, it is still a pain :)

While your below fixes are not consumable by mainline, I would be glad
to help integrating calculation of the PLL in case of raw8 (and
possibly other formats).

I suggest to go through the iteration of the above linked series from
Maxime, as they contain somewhat interesting discussions on both the
PLL architecture and links to some useful documentation. I will find
some time to study all of this again in the next days and try to help
if necessary.

In the meantime let me cc Maxime (even if he mostly worked on the
parallel interface support) and Sam, who gave some very interesting
insights on the PLL architecture.

Thanks for your work, and please keep me and Maxime CC-ed, as the PLL
calculation part and CSI-2 support has been quite a big effort, and I
would like to help having it succesfully working with most use cases!

Thanks
   j

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
>  /*
>   * This is supposed to be ranging from 1 to 2, but the value is always
>   * set to 2 in the vendor kernels.
>   */
> -#define OV5640_PLL_ROOT_DIV			2
> +#define OV5640_PLL_ROOT_DIV			1
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

--ul4tbihbxyekdz6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl04cBMACgkQcjQGjxah
Vjz7ChAAwaKQWrokLmn5VEu0SReeF9P+oiL0ozE27aaEOdDte8xuXseRs9mLPBQg
ziy1cL2b19Rn2JBBt5eYOX+ZREnj1A11QxRkvHCqGXSfSs3bgR88Y7NyjjeMABC6
CJ90k/VaIVZ2PW11iedxPHM+wY5c3sSc3lXOkvQ0za18iW+xr3OKtG0fOQ81uhdj
h7zheLOss5bCcB1PjUJ9KD8CbYUXK8BaZETs94koipm1tw0Tli5t3AJxrRt0TTEB
HcGFakZBHa/Maqhwr3AkUb0Ao/MbvUFQpTYtsosdH9NERFN/bGJaIPyY4in/dukN
MfPPvhliQ64kuTaahNAdEervi1gYJq2GmHw28bcm7Urh5WD6MJEeL2aw0Sk8MERh
QDcH4po7Ps01xp28+m+p8TGJR6puhdT6MzZKs0BYayKvWOakj5eSgM333G6q9Mhg
1LvzygySiuKL8Ir2VCdEkjrIvijg38P4zMcsrzHjFDSDiW4Kl4MoKVfBulQSi4y0
59LPQLaUBdkJW2PSiV5R2sBeaQ2eKbZ8Os1GIJbc/Yoxnao+q8usBQ57ABy0V42F
6xR/bTCp6Vt61LuBLs9D3UyjKJLGkOtanXPI9WGeot22I5x/5xCwSLwrc/J5HnH8
G5C90ItAYXqTo4Cp1FT8V9bSnC26wmG94mDGrq9MmgGJgfWZzyI=
=aE4H
-----END PGP SIGNATURE-----

--ul4tbihbxyekdz6p--
