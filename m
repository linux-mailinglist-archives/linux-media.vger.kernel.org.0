Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9F297C9C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 16:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729417AbfHUOWn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 10:22:43 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51791 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728871AbfHUOWn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 10:22:43 -0400
Received: from uno.localdomain (unknown [87.18.63.98])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5F671240003;
        Wed, 21 Aug 2019 14:22:37 +0000 (UTC)
Date:   Wed, 21 Aug 2019 16:24:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hugues FRUCHET <hugues.fruchet@st.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Laura Nao <laura.nao@kynetics.com>
Subject: Re: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Message-ID: <20190821142407.facveek5omjdide6@uno.localdomain>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
 <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
 <20190820091311.GB5123@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tpwyogjc36kfnbru"
Content-Disposition: inline
In-Reply-To: <20190820091311.GB5123@paasikivi.fi.intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tpwyogjc36kfnbru
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,
   +laura who has been working on supporting RAW capture for this
   driver.

On Tue, Aug 20, 2019 at 12:13:12PM +0300, Sakari Ailus wrote:
> Hi Hugues,
>
> On Tue, Jul 02, 2019 at 04:05:46PM +0000, Hugues FRUCHET wrote:
> > Hi Sakari,
> >
> > On 6/27/19 6:05 PM, Sakari Ailus wrote:
> > > Hi Hugues,
> > >
> > > On Thu, Jun 27, 2019 at 02:57:04PM +0200, Hugues Fruchet wrote:
> > >> Add support of V4L2_CID_LINK_FREQ, this is needed
> > >> by some CSI-2 receivers.
> > >>
> > >> 384MHz is exposed for the time being, corresponding
> > >> to 96MHz pixel clock with 2 bytes per pixel on 2 data lanes.
> > >>
> > >> This setup has been tested successfully with ST MIPID02
> > >> CSI-2 to parallel bridge.
> > >>
> > >> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> > >> ---
> > >
> > > Thanks for the patch.
> > >
> > > The driver calculates the sensor configuration based on its configuration,
> > > and this needs to be reflected in the link frequency: it's not a static
> > > value. See e.g. ov5640_calc_sys_clk().
> > >
> >
> > I know this code, but for a reason I don't understand yet, this seems
> > to not have effects on the CSI-2 link frequency.
> >

This seems unlikely to me, as the ov5640_calc_sys_clk() calculates the
system clock, which then generates the MIPI CLK.

I would really be interested to know if you could measure somehow the
actual frequency of the clock lane, to make sure it actually
changes according to to the driver calculations.

> > This has been verified with MIPID02 CSI-2 bridge which only work with
> > this fixed link frequency as input to program its ui_x4 register
> > setting, see
> > https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2028171.html.
> > All resolutions and all framerate have been tested succesfully with this
> > setting.
> >
> > Initially I tried to set the link frequency according to the value
> > computed in ov5640_calc_sys_clk() but it was only functional when
> > resolutions/framerate was close to the 384MHz value...
> >
> > As OV5640 D3 engineering board has been initially developped for
> > dragonboard, I'll dig into this and found this commit:
> > https://lore.kernel.org/patchwork/patch/886794/
> > which set a fixed pixel rate value to 96MHz, which match perfectly
> > with the 384MHz value I found for link frequency...
> >
> > Perhaps other CSI-2 OV5640 users can comment about it and have the
> > explanations of what I experiment...
> > Maxime, Jacopo, do you have any idea about it ?
>
> I would also like to wee a comment from someone who's familiar with the
> device. Yet I can tell a static value of 348 MHz is clearly incorrect as it
> ignores sensor runtime configuration as well as platform configuration
> (external clock frequency for instance).
>
> Generally speaking, configuring a CSI-2 receiver to expect a particular
> frequency usually doesn't mean it's going to fail even if the transmitter
> uses a different frequency, albeit the likelihood of it not working
> increases as the difference grows. Could the problem be at the receiver's
> end?
>
> Have you checked what kind of values ov5640_calc_pclk() returns for
> different configurations? It would seem like that this is what the
> LINK_FREQ (divided by lanes and multiplied by two) should be.

Not exactly. ov5640_calc_pclk() is only used when computing the
parallel bus pixel clock not for the CSI-2 bus.

To obtain the link frequency for the MIPI interface I would consider
the system clock frequency calculated by ov5640_calc_sys_clk(), which
represents the bandwidth per lane in bits per second. This should then
be divided by 2 to compensate the MIPI DDR mode [*] (no need to divide
by the number of lanes, as this is already the bandwidth -per lane-)

For 640x480 YUYV8_2X8 (and 1024x768) with 2 data lanes and 24MHz xclk
I have calculated the following values:

SYSCLK = 492MHz
MIPISCLK = 256MHz
PCLK = 61,50MHz

For 1280x720 with the same setup
SYSCLK = 340MHz
MIPI_CLK = 170MHz
PCLK = 42,50 (this seems veeery low according to datasheet)

For 1920x1080
SYSCLK = 680MHz
MIPI_CLK = 340MHz
PCLK = 85MHz (slightly slow according to the datasheet)

All captured images seems fine...

If you could confirm those values by probing the actual clock lane it
would be just great.

However, this only work assuming the here below [*], and we're still
missing something because RAW still doesn't work as expected :(

Anyway, clock tree madness apart, fixing the LINK_FREQ control value
to 96MHz seems like it does not reflect what the driver actual does.

Could you try setting the control value to what the driver actually
computes as here suggested?

Thanks
   j

PS. I'm still confused why the have the link-frequencies property in
DTS bindings. What is its purpose if all drivers compute or hardcode
it?

[*] There is a big assumption here, that the MIPI bus clock gets
generated by two different clock outputs depending if the mode goes
through the the scaler or not. You can see this at line 967 in the
driver code. If mode goes though the scaler, MIPI_DIV = 2 and you get
the bus clock from the MIPISCLK signal. If it does not go through the
scaler MIPI_DIV = 1 and then the MIPI bus clock gets provided by the
MIPI_CLK signal. This is the result of several attempts to decode the
ov5640 clock tree, but it has only been tested with modes with bpp =
16 and 2 data lanes. As it has been recently reported, for RAW mode,
this does not work well, so the assumption might not be correct.

>
> >
> >
> > >> version 2:
> > >>    - do not set control read only as per Hans' comment:
> > >>      See https://www.mail-archive.com/linux-media@vger.kernel.org/msg147910.html
> > >>
> > >>   drivers/media/i2c/ov5640.c | 10 ++++++++++
> > >>   1 file changed, 10 insertions(+)
> > >>
> > >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > >> index 82d4ce9..e6307f3 100644
> > >> --- a/drivers/media/i2c/ov5640.c
> > >> +++ b/drivers/media/i2c/ov5640.c
> > >> @@ -218,6 +218,7 @@ struct ov5640_ctrls {
> > >>   	struct v4l2_ctrl *test_pattern;
> > >>   	struct v4l2_ctrl *hflip;
> > >>   	struct v4l2_ctrl *vflip;
> > >> +	struct v4l2_ctrl *link_freq;
> > >>   };
> > >>
> > >>   struct ov5640_dev {
> > >> @@ -2198,6 +2199,10 @@ static int ov5640_try_fmt_internal(struct v4l2_subdev *sd,
> > >>   	return 0;
> > >>   }
> > >>
> > >> +static const s64 link_freq_menu_items[] = {
> > >> +	384000000,
> > >> +};
> > >> +
> > >>   static int ov5640_set_fmt(struct v4l2_subdev *sd,
> > >>   			  struct v4l2_subdev_pad_config *cfg,
> > >>   			  struct v4l2_subdev_format *format)
> > >> @@ -2636,6 +2641,8 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> > >>   	case V4L2_CID_VFLIP:
> > >>   		ret = ov5640_set_ctrl_vflip(sensor, ctrl->val);
> > >>   		break;
> > >> +	case V4L2_CID_LINK_FREQ:
> > >> +		return 0;
> > >>   	default:
> > >>   		ret = -EINVAL;
> > >>   		break;
> > >> @@ -2703,6 +2710,9 @@ static int ov5640_init_controls(struct ov5640_dev *sensor)
> > >>   				       V4L2_CID_POWER_LINE_FREQUENCY_AUTO, 0,
> > >>   				       V4L2_CID_POWER_LINE_FREQUENCY_50HZ);
> > >>
> > >> +	ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > >> +						  0, 0, link_freq_menu_items);
> > >> +
> > >>   	if (hdl->error) {
> > >>   		ret = hdl->error;
> > >>   		goto free_ctrls;
> > >> --
> > >> 2.7.4
> > >>
> > >
> >
> > BR,
> > Hugues.
>
> --
> Sakari Ailus
> sakari.ailus@linux.intel.com

--tpwyogjc36kfnbru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl1dVAcACgkQcjQGjxah
VjyHyRAAh6Ss4Pmz2okaFdBK2bZiPHTtR4Bur7ry6mnaFHlLA+jcAm6WxMB12oU4
87hsWPJaznT8TAhkTtR9RoZ1ejXwDrSubZmc4d/AM4lQBJ9LHkby9tsd4o/xCzGJ
EI0DDNqRViSKDNv8HNZDx0gnINLoJJLUYp4CkuzGkZAlKyR2qWWLS4oT/3aPdZBe
cSh8vOZphd2AzN2M8YP7C0ycKK9PcV02gAYPwqx94zKVOXJuKJMytKOWjUZ3/tQQ
L+ugmbilxjBRnIMqNPiC0+RaRCTrShth7dQtCQeKyCycfkGEd6dLn9dlpHmYhbDP
qutHVzDDYSiYyB33rMBIZjPihjDLB442wS5d6parqeEvgWf0NeEdnZPyNSH1uSH0
ApkCbCRFuHku40BEluCKVTSggyIXvRLWCV689YqIQz/9ggrlG9xTVMy2AlD3SmNd
NsJDUYbUK/B71BQQT3yGufv5KzrJ3SgzgwRfckQrlFJdKiEHoLffMzEDzprvk5Dd
QznKat2OSTiXoIpyrlbUVu+Q/yyAb7XI1WfqSjliAUPhWwV9ks0LameRjtwRa7QN
elNlCnnv/J0dtIASfsBQov8wV8lEZ/etQXxmqn9zGrtgSfuWeYF4IMYL6F9xj691
XnVX8i6nriyonRzhz7OJcYlYAr3llXrdeJikgy/evyV2jvnluYU=
=E2f4
-----END PGP SIGNATURE-----

--tpwyogjc36kfnbru--
