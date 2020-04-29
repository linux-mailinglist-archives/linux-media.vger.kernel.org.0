Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B151BDAF5
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 13:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbgD2Lq7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 07:46:59 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:37589 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726511AbgD2Lq6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 07:46:58 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 4E60771A;
        Wed, 29 Apr 2020 07:46:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 29 Apr 2020 07:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=GNg8N4MpEqbpY0+HdKjq545IT9a
        sX3IFSheqvawzyns=; b=mzigDqR66/wPW6d/Bl2C6VS0hPS23t0ag/Vl+wjE8za
        zjZiu50YzDnQlwZAprMvwgpAHXCdaBOHOn3zDwQWELdd6fPoptIOUHFXivmwP9h3
        0rlslxuMoJZG4WWEUzZIHYP7W2XedQ5kpJoRjXP7Z16m3B5tNl4wOMmo5H42uxFf
        zQIbVxYciIIzeTKTMLDmJ64xmAitW9VZjguBOB7xksDVr9L3Ph684Kl3+rBDir6Y
        tgHSJ6hvI2MqOf6URFJsy2/RmpfgYS/nYX1OYDJ+99Px3erzP/RfEatYs52t4g8i
        +t95Xu/YSIZunEzmnlxshZoLjrmfzaMX5o5UXfCIocQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GNg8N4
        MpEqbpY0+HdKjq545IT9asX3IFSheqvawzyns=; b=LixaC0mQ3xBTYJ9RoIE53l
        vwV8UAJeauGMHhNsM9t7hC6sdDGMKqidJIaTmQuOIjENWrIellzoEtXhd7g3Rxkc
        C/f1orJ37Pm486aNRxv+aCuGpVL85Vy1bsNHXE59mVdEkNiJkxeUdF6I9hNeAEPC
        oLcnPJbcQDvA4L8QUoUoUqIJglmwi19EhbgHteDpMy3e75QwBuhiC3Jctb/O5Qgz
        RA9hLcTT0ZcPhWsv0tBO4VIHYl1x14/DPhj8UO2+x5lXT/Th1jSVxc+oZpreYjS4
        fbiySOseihBiuBARr3iFYRZaGR4MLhSY7qk2XLvyjHgF//yXtunHN+IWacnC1VyA
        ==
X-ME-Sender: <xms:L2mpXuQIjPH0YGUJgRFgQ9YBY0ktkty_6ZnqVh9Vrslei89vaxBXew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:L2mpXv2pEb4K0JdhRCtn6ByzyreQgAY8ToIyEOwcFgObySG-wEbj3g>
    <xmx:L2mpXhxpGX4eh3Gs53qud0xc22gNACGUfYjUqX4YTVZqqUQwNdFHRg>
    <xmx:L2mpXq_2YqkqFCL2Jee6g0fCd7iSwquf4rjXchnq8MsItmqkwslY_w>
    <xmx:L2mpXnK9Ha19zwGGTCDtRvYCOk4ekKsIT3WEXoE7LjQQjUb3IeDmMKT-bFs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id E96CC3065EEB;
        Wed, 29 Apr 2020 07:46:54 -0400 (EDT)
Date:   Wed, 29 Apr 2020 13:46:53 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v5 v5 2/3] media: ov8856: Add devicetree support
Message-ID: <20200429114653.ifzi4z2qzpys4i4q@gilmour.lan>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
 <20200428180718.1609826-2-robert.foss@linaro.org>
 <20200429090012.vhhwatojkncjquwd@gilmour.lan>
 <CAG3jFyvcgqi_rm-Enf3gTyHowbgX6iBe3coDPu91p9EBTxS2XA@mail.gmail.com>
 <20200429111307.GA867@valkosipuli.retiisi.org.uk>
 <CAG3jFyvvX6J6TSnXr=KUzu5BuQ351sNbNC2mtY0QWdqBdAz7JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4e2ce4wi52h6jxye"
Content-Disposition: inline
In-Reply-To: <CAG3jFyvvX6J6TSnXr=KUzu5BuQ351sNbNC2mtY0QWdqBdAz7JA@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--4e2ce4wi52h6jxye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2020 at 01:39:12PM +0200, Robert Foss wrote:
> On Wed, 29 Apr 2020 at 13:13, Sakari Ailus <sakari.ailus@iki.fi> wrote:
> >
> > Hi Robert, Maxime,
> >
> > On Wed, Apr 29, 2020 at 12:19:38PM +0200, Robert Foss wrote:
> > > On Wed, 29 Apr 2020 at 11:00, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Tue, Apr 28, 2020 at 08:07:17PM +0200, Robert Foss wrote:
> > > > > Add match table, enable ov8856_probe() to support
> > > > > both ACPI and DT modes.
> > > > >
> > > > > ACPI and DT modes are primarily distinguished from
> > > > > each other by relying on devm_XXX_get_optional()
> > > > > will return NULL instead of a reference for the
> > > > > desired managed resource.
> > > > >
> > > > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > > > ---
> > > > >
> > > > > - Changes since v4:
> > > > >   * Maxime & Sakari: Switch to clock-frequency
> > > > >
> > > > > - Changes since v3:
> > > > >   * Remove redundant {}-brackets
> > > > >   * Compare xvclk_rate to 5% tolerance
> > > > >   * Andy: Use dev_fwnode()
> > > > >   * Andy: Use %pe instead of %ld + PTR_ERR()
> > > > >   * Andy: Invert reset_gpio logic
> > > > >   * Andy: Remove dev_dbg() from failing reset_gpio setup
> > > > >   * Andy: Use dev_err for logging for failures
> > > > >   * Andy: Remove dev_warn from EDEFER/regulator error path
> > > > >   * Andy & Sakari: Replaced GPIOD_OUT_XXX with 0/1
> > > > >   * Maxime & Sakari: Verify clock frequency from DT
> > > > >   * Sakari: Verify the 'xvclk_rate' is set correctly for ACPI/DT =
devices
> > > > >   * Sakari: Remove duplicate ov8856->dev assignment
> > > > >
> > > > > - Changes since v2:
> > > > >   * Added "struct device *dev" member to struct ov8856
> > > > >   * Andy: Switch to optional version of devm_gpiod_get
> > > > >   * Andy: Switch to optional version of devm_clk_get
> > > > >   * Fabio: Add reset sleep period
> > > > >   * Sakari: Unify defines for 19.2Mhz
> > > > >   * Sakari: Remove 24Mhz clock, since it isn't needed for support=
ed modes
> > > > >   * Sakari: Replace dev_info() with dev_dbg()
> > > > >   * Sakari: Switch induction variable type to unsigned
> > > > >   * Sakari: Don't wait for reset_gpio when in ACPI mode
> > > > >   * Sakari: Pull reset GPIO high on power on failure
> > > > >   * Sakari: Add power on/off to resume/suspend
> > > > >   * Sakari: Fix indentation
> > > > >   * Sakari: Power off during ov8856_remove()
> > > > >   * Sakari: Don't sleep during power-on in ACPI mode
> > > > >   * Sakari: Switch to getting xvclk from clk_get_rate
> > > > >
> > > > > - Changes since v1:
> > > > >   * Andy & Sakari: Make XVCLK optional since to not break ACPI
> > > > >   * Fabio: Change n_shutdown_gpio name to reset_gpio
> > > > >   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTI=
VE_LOW change
> > > > >   * Fabio: Remove empty line
> > > > >   * Fabio: Remove real error from devm_gpiod_get() failures
> > > > >   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_S=
UPPLIES
> > > > >   * Sakari: Use XVCLK rate as provided by DT
> > > > >
> > > > >  drivers/media/i2c/ov8856.c | 139 +++++++++++++++++++++++++++++++=
++----
> > > > >  1 file changed, 126 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov885=
6.c
> > > > > index 8655842af275..48b02b8d205f 100644
> > > > > --- a/drivers/media/i2c/ov8856.c
> > > > > +++ b/drivers/media/i2c/ov8856.c
> > > > > @@ -3,10 +3,13 @@
> > > > >
> > > > >  #include <asm/unaligned.h>
> > > > >  #include <linux/acpi.h>
> > > > > +#include <linux/clk.h>
> > > > >  #include <linux/delay.h>
> > > > > +#include <linux/gpio/consumer.h>
> > > > >  #include <linux/i2c.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > > +#include <linux/regulator/consumer.h>
> > > > >  #include <media/v4l2-ctrls.h>
> > > > >  #include <media/v4l2-device.h>
> > > > >  #include <media/v4l2-fwnode.h>
> > > > > @@ -18,7 +21,7 @@
> > > > >  #define OV8856_LINK_FREQ_360MHZ              360000000ULL
> > > > >  #define OV8856_LINK_FREQ_180MHZ              180000000ULL
> > > > >  #define OV8856_SCLK                  144000000ULL
> > > > > -#define OV8856_MCLK                  19200000
> > > > > +#define OV8856_XVCLK_19_2            19200000
> > > > >  #define OV8856_DATA_LANES            4
> > > > >  #define OV8856_RGB_DEPTH             10
> > > > >
> > > > > @@ -64,6 +67,12 @@
> > > > >
> > > > >  #define to_ov8856(_sd)                       container_of(_sd, s=
truct ov8856, sd)
> > > > >
> > > > > +static const char * const ov8856_supply_names[] =3D {
> > > > > +     "dovdd",        /* Digital I/O power */
> > > > > +     "avdd",         /* Analog power */
> > > > > +     "dvdd",         /* Digital core power */
> > > > > +};
> > > > > +
> > > > >  enum {
> > > > >       OV8856_LINK_FREQ_720MBPS,
> > > > >       OV8856_LINK_FREQ_360MBPS,
> > > > > @@ -566,6 +575,11 @@ struct ov8856 {
> > > > >       struct media_pad pad;
> > > > >       struct v4l2_ctrl_handler ctrl_handler;
> > > > >
> > > > > +     struct device           *dev;
> > > > > +     struct clk              *xvclk;
> > > > > +     struct gpio_desc        *reset_gpio;
> > > > > +     struct regulator_bulk_data supplies[ARRAY_SIZE(ov8856_suppl=
y_names)];
> > > > > +
> > > > >       /* V4L2 Controls */
> > > > >       struct v4l2_ctrl *link_freq;
> > > > >       struct v4l2_ctrl *pixel_rate;
> > > > > @@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_sub=
dev *sd, int enable)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > +static int __ov8856_power_on(struct ov8856 *ov8856)
> > > > > +{
> > > > > +     struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->=
sd);
> > > > > +     int ret;
> > > > > +
> > > > > +     ret =3D clk_prepare_enable(ov8856->xvclk);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(&client->dev, "failed to enable xvclk\n");
> > > > > +             return ret;
> > > > > +     }
> > > > > +
> > > > > +     if (is_acpi_node(dev_fwnode(ov8856->dev)))
> > > > > +             return 0;
> > > > > +
> > > > > +     if (ov8856->reset_gpio) {
> > > > > +             gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > > > +             usleep_range(1000, 2000);
> > > > > +     }
> > > > > +
> > > > > +     ret =3D regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_name=
s),
> > > > > +                                 ov8856->supplies);
> > > > > +     if (ret < 0) {
> > > > > +             dev_err(&client->dev, "failed to enable regulators\=
n");
> > > > > +             goto disable_clk;
> > > > > +     }
> > > > > +
> > > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> > > > > +     usleep_range(1500, 1800);
> > > > > +
> > > > > +     return 0;
> > > > > +
> > > > > +disable_clk:
> > > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > > > +     clk_disable_unprepare(ov8856->xvclk);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static void __ov8856_power_off(struct ov8856 *ov8856)
> > > > > +{
> > > > > +     gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > > > +     regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> > > > > +                            ov8856->supplies);
> > > > > +     clk_disable_unprepare(ov8856->xvclk);
> > > > > +}
> > > > > +
> > > > >  static int __maybe_unused ov8856_suspend(struct device *dev)
> > > > >  {
> > > > >       struct i2c_client *client =3D to_i2c_client(dev);
> > > > > @@ -918,6 +978,7 @@ static int __maybe_unused ov8856_suspend(stru=
ct device *dev)
> > > > >       if (ov8856->streaming)
> > > > >               ov8856_stop_streaming(ov8856);
> > > > >
> > > > > +     __ov8856_power_off(ov8856);
> > > > >       mutex_unlock(&ov8856->mutex);
> > > > >
> > > > >       return 0;
> > > > > @@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struc=
t device *dev)
> > > > >       int ret;
> > > > >
> > > > >       mutex_lock(&ov8856->mutex);
> > > > > +
> > > > > +     __ov8856_power_on(ov8856);
> > > > >       if (ov8856->streaming) {
> > > > >               ret =3D ov8856_start_streaming(ov8856);
> > > > >               if (ret) {
> > > > > @@ -1092,29 +1155,58 @@ static int ov8856_identify_module(struct =
ov8856 *ov8856)
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > -static int ov8856_check_hwcfg(struct device *dev)
> > > > > +static int ov8856_get_hwcfg(struct ov8856 *ov8856)
> > > > >  {
> > > > > +     struct device *dev =3D ov8856->dev;
> > > > >       struct fwnode_handle *ep;
> > > > >       struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > > > >       struct v4l2_fwnode_endpoint bus_cfg =3D {
> > > > >               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > > > >       };
> > > > > -     u32 mclk;
> > > > > +     u32 xvclk_rate;
> > > > >       int ret;
> > > > >       unsigned int i, j;
> > > > >
> > > > >       if (!fwnode)
> > > > >               return -ENXIO;
> > > > >
> > > > > -     ret =3D fwnode_property_read_u32(fwnode, "clock-frequency",=
 &mclk);
> > > > > +     ret =3D fwnode_property_read_u32(fwnode, "clock-frequency",
> > > > > +             &xvclk_rate);
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > -     if (mclk !=3D OV8856_MCLK) {
> > > > > -             dev_err(dev, "external clock %d is not supported", =
mclk);
> > > > > +     if (!is_acpi_node(fwnode)) {
> > > > > +             ov8856->xvclk =3D devm_clk_get(dev, "xvclk");
> > > > > +             if (IS_ERR(ov8856->xvclk)) {
> > > > > +                     dev_err(dev, "could not get xvclk clock (%p=
e)\n",
> > > > > +                                     ov8856->xvclk);
> > > > > +                     return PTR_ERR(ov8856->xvclk);
> > > > > +             }
> > > > > +
> > > > > +             clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > > > +             xvclk_rate =3D clk_get_rate(ov8856->xvclk);
> > > > > +     }
> > > > > +
> > > > > +     /* external clock must be 19.2MHz, allow 5% tolerance */
> > > >
> > > > Where is that 5% tolerance coming from? Experimentations, datasheet=
s, something
> > > > that looks good enough? Either way, this should be in the comment.
> > >
> > > I don't have access to the full datasheet unfortunately. A 24Mhz rate
> > > is as far as I understand it supported and required for higher
> > > bandwidth count modes.
> > > It was suggested to me that adding a tolerance is the best practice,
> > > the ov5645 driver uses a 1% tolerance, which may be more appropriate.
> >
> > The frequency should really be exact. Sometimes what happens is, howeve=
r,
> > that a register list based driver does not have the register lists for a
> > frequency that is available on a given system. That's why some drivers =
have
> > allowed some difference to the intended frequency.
> >
> > That 5 % seems like a random value, just like any other number that dif=
fers
> > from the exact frequency would be.
> >
> > I'd issue a warning if the frequency differs from what was intended, but
> > still proceed with probe. This way we can make sure the difference is n=
oted
> > while boards that cannot provide the exact frequency supported by the
> > driver can still function.
>=20
> Issuing a warning sounds like a good solution to me. What do you think Ma=
xime?

Sounds good to me too :)
Maxime

--4e2ce4wi52h6jxye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqlpLQAKCRDj7w1vZxhR
xfy5AP9WB6qj36xGc19gDUzaiYtAzYINqK4aVmuNMeieKOESdAD/X643GOOZCaKS
+tW21zB5c9ZbIZnEBKZ9vft+BXIJjQw=
=khOj
-----END PGP SIGNATURE-----

--4e2ce4wi52h6jxye--
