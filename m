Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3481BD7CA
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2020 11:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgD2JA0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 05:00:26 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:60711 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726355AbgD2JA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 05:00:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 60F44A5B;
        Wed, 29 Apr 2020 05:00:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 29 Apr 2020 05:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=RyhPXJMZ0K/eykcBAOS0NyPrn8H
        hUWB7oO+D8Yn2kWI=; b=QyLJ3Wdwpg+HJsUttRtQumo34KoewfTjW/hBQ+vcnTm
        +MPrz+4pxU6X9YIrLg6PinyVRO0m/wjp4iIZHhQSmyBkkV5UX/VVwwCeGIEDh277
        +JPAvttg4AcrlH/pa2QPot5ZfWHoFvJbAJt+OKEwBKOlyvLOu85RIB8eyHDikwzF
        1wrPAxPDrS8OqFk4a+kt3xtj6FtMCAJZQBdwqy1049/FeN10QV4m1cHkgW6sEQLH
        aIm4uxkHhsPfehRw+SFUvLz1dSJKOcrCzVOAxwmCY4H4C6q0UiQk6tz5vUE8DQom
        ppWk7xElUBYZmPw8gaRzZgy40G/zLmHM+phJLCfnEPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RyhPXJ
        MZ0K/eykcBAOS0NyPrn8HhUWB7oO+D8Yn2kWI=; b=IW7WY/v7e3vObh2vr73kL3
        v94SZHr7JK48didPWNqaN1DvObqY1bFrtX99OgRbfS7gCuVij5N1dlVzNBeM333z
        cjR3xsNoOn+6L2Ghlu8AkGxbe2+RAkRAUgvWUNFDi4zCzRJUrachaXS1Dq7qtvuF
        8/RauFdQuRtN6W1ZnZzllyqaGAr0hNVfSFodVTI3Jp1V+rfY3Lg5ogDJRIfHfKqR
        QJEorhDziWQlAkXls6PTK1aPpENR/z5HxPaanI1if4QS59uFOH5y47lIyd1lSQg+
        a4P8zdcMrFKCJM22PQFHXPjfnFWe8Wlg9mThMjKEzfnx3zRWECnnOV9qQW4wwuxA
        ==
X-ME-Sender: <xms:HkKpXtBSI6aecXGhblSo9QqNTdysmlPkuX8kRQ1wMYMUTWYt-ievUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HkKpXp8-If2EJxhp6e6sqTiEgzlPn6WyIzyWGbI3oIwv7Zx54wqAlQ>
    <xmx:HkKpXl_3eH9glYXD6o5o1F0X5xHiIAgpSbZ90sg6ylKMQC8WiYwCmg>
    <xmx:HkKpXq8y9RdpB1mxHTDuo1lTv4pwsO-nWpjEfojwH5rplnh5CL6H8A>
    <xmx:KEKpXmMCFZTNZ3SH7JelYsIg1yY4ZEFMZQIHjTdgFBAdn-8F-kpfqPGEVdM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1E9083280066;
        Wed, 29 Apr 2020 05:00:14 -0400 (EDT)
Date:   Wed, 29 Apr 2020 11:00:12 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v5 v5 2/3] media: ov8856: Add devicetree support
Message-ID: <20200429090012.vhhwatojkncjquwd@gilmour.lan>
References: <20200428180718.1609826-1-robert.foss@linaro.org>
 <20200428180718.1609826-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h6avthptzu4aupac"
Content-Disposition: inline
In-Reply-To: <20200428180718.1609826-2-robert.foss@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--h6avthptzu4aupac
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 28, 2020 at 08:07:17PM +0200, Robert Foss wrote:
> Add match table, enable ov8856_probe() to support
> both ACPI and DT modes.
>=20
> ACPI and DT modes are primarily distinguished from
> each other by relying on devm_XXX_get_optional()
> will return NULL instead of a reference for the
> desired managed resource.
>=20
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>=20
> - Changes since v4:
>   * Maxime & Sakari: Switch to clock-frequency
>=20
> - Changes since v3:
>   * Remove redundant {}-brackets
>   * Compare xvclk_rate to 5% tolerance
>   * Andy: Use dev_fwnode()
>   * Andy: Use %pe instead of %ld + PTR_ERR()
>   * Andy: Invert reset_gpio logic
>   * Andy: Remove dev_dbg() from failing reset_gpio setup
>   * Andy: Use dev_err for logging for failures
>   * Andy: Remove dev_warn from EDEFER/regulator error path
>   * Andy & Sakari: Replaced GPIOD_OUT_XXX with 0/1
>   * Maxime & Sakari: Verify clock frequency from DT
>   * Sakari: Verify the 'xvclk_rate' is set correctly for ACPI/DT devices
>   * Sakari: Remove duplicate ov8856->dev assignment
>=20
> - Changes since v2:
>   * Added "struct device *dev" member to struct ov8856
>   * Andy: Switch to optional version of devm_gpiod_get
>   * Andy: Switch to optional version of devm_clk_get
>   * Fabio: Add reset sleep period
>   * Sakari: Unify defines for 19.2Mhz
>   * Sakari: Remove 24Mhz clock, since it isn't needed for supported modes
>   * Sakari: Replace dev_info() with dev_dbg()
>   * Sakari: Switch induction variable type to unsigned
>   * Sakari: Don't wait for reset_gpio when in ACPI mode
>   * Sakari: Pull reset GPIO high on power on failure
>   * Sakari: Add power on/off to resume/suspend
>   * Sakari: Fix indentation
>   * Sakari: Power off during ov8856_remove()
>   * Sakari: Don't sleep during power-on in ACPI mode
>   * Sakari: Switch to getting xvclk from clk_get_rate
>=20
> - Changes since v1:
>   * Andy & Sakari: Make XVCLK optional since to not break ACPI
>   * Fabio: Change n_shutdown_gpio name to reset_gpio
>   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTIVE_LOW c=
hange
>   * Fabio: Remove empty line
>   * Fabio: Remove real error from devm_gpiod_get() failures
>   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPLIES
>   * Sakari: Use XVCLK rate as provided by DT
>=20
>  drivers/media/i2c/ov8856.c | 139 +++++++++++++++++++++++++++++++++----
>  1 file changed, 126 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 8655842af275..48b02b8d205f 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -3,10 +3,13 @@
> =20
>  #include <asm/unaligned.h>
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -18,7 +21,7 @@
>  #define OV8856_LINK_FREQ_360MHZ		360000000ULL
>  #define OV8856_LINK_FREQ_180MHZ		180000000ULL
>  #define OV8856_SCLK			144000000ULL
> -#define OV8856_MCLK			19200000
> +#define OV8856_XVCLK_19_2		19200000
>  #define OV8856_DATA_LANES		4
>  #define OV8856_RGB_DEPTH		10
> =20
> @@ -64,6 +67,12 @@
> =20
>  #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
> =20
> +static const char * const ov8856_supply_names[] =3D {
> +	"dovdd",	/* Digital I/O power */
> +	"avdd",		/* Analog power */
> +	"dvdd",		/* Digital core power */
> +};
> +
>  enum {
>  	OV8856_LINK_FREQ_720MBPS,
>  	OV8856_LINK_FREQ_360MBPS,
> @@ -566,6 +575,11 @@ struct ov8856 {
>  	struct media_pad pad;
>  	struct v4l2_ctrl_handler ctrl_handler;
> =20
> +	struct device		*dev;
> +	struct clk		*xvclk;
> +	struct gpio_desc	*reset_gpio;
> +	struct regulator_bulk_data supplies[ARRAY_SIZE(ov8856_supply_names)];
> +
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> @@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_subdev *sd,=
 int enable)
>  	return ret;
>  }
> =20
> +static int __ov8856_power_on(struct ov8856 *ov8856)
> +{
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->sd);
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(ov8856->xvclk);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable xvclk\n");
> +		return ret;
> +	}
> +
> +	if (is_acpi_node(dev_fwnode(ov8856->dev)))
> +		return 0;
> +
> +	if (ov8856->reset_gpio) {
> +		gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> +		usleep_range(1000, 2000);
> +	}
> +
> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> +				    ov8856->supplies);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +
> +	gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> +	usleep_range(1500, 1800);
> +
> +	return 0;
> +
> +disable_clk:
> +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> +	clk_disable_unprepare(ov8856->xvclk);
> +
> +	return ret;
> +}
> +
> +static void __ov8856_power_off(struct ov8856 *ov8856)
> +{
> +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> +			       ov8856->supplies);
> +	clk_disable_unprepare(ov8856->xvclk);
> +}
> +
>  static int __maybe_unused ov8856_suspend(struct device *dev)
>  {
>  	struct i2c_client *client =3D to_i2c_client(dev);
> @@ -918,6 +978,7 @@ static int __maybe_unused ov8856_suspend(struct devic=
e *dev)
>  	if (ov8856->streaming)
>  		ov8856_stop_streaming(ov8856);
> =20
> +	__ov8856_power_off(ov8856);
>  	mutex_unlock(&ov8856->mutex);
> =20
>  	return 0;
> @@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struct device=
 *dev)
>  	int ret;
> =20
>  	mutex_lock(&ov8856->mutex);
> +
> +	__ov8856_power_on(ov8856);
>  	if (ov8856->streaming) {
>  		ret =3D ov8856_start_streaming(ov8856);
>  		if (ret) {
> @@ -1092,29 +1155,58 @@ static int ov8856_identify_module(struct ov8856 *=
ov8856)
>  	return 0;
>  }
> =20
> -static int ov8856_check_hwcfg(struct device *dev)
> +static int ov8856_get_hwcfg(struct ov8856 *ov8856)
>  {
> +	struct device *dev =3D ov8856->dev;
>  	struct fwnode_handle *ep;
>  	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>  	struct v4l2_fwnode_endpoint bus_cfg =3D {
>  		.bus_type =3D V4L2_MBUS_CSI2_DPHY
>  	};
> -	u32 mclk;
> +	u32 xvclk_rate;
>  	int ret;
>  	unsigned int i, j;
> =20
>  	if (!fwnode)
>  		return -ENXIO;
> =20
> -	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> +	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency",
> +		&xvclk_rate);
>  	if (ret)
>  		return ret;
> =20
> -	if (mclk !=3D OV8856_MCLK) {
> -		dev_err(dev, "external clock %d is not supported", mclk);
> +	if (!is_acpi_node(fwnode)) {
> +		ov8856->xvclk =3D devm_clk_get(dev, "xvclk");
> +		if (IS_ERR(ov8856->xvclk)) {
> +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> +					ov8856->xvclk);
> +			return PTR_ERR(ov8856->xvclk);
> +		}
> +
> +		clk_set_rate(ov8856->xvclk, xvclk_rate);
> +		xvclk_rate =3D clk_get_rate(ov8856->xvclk);
> +	}
> +
> +	/* external clock must be 19.2MHz, allow 5% tolerance */

Where is that 5% tolerance coming from? Experimentations, datasheets, somet=
hing
that looks good enough? Either way, this should be in the comment.

Maxime

--h6avthptzu4aupac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqlCHAAKCRDj7w1vZxhR
xTV3AQCiboFbAS2KBYrc9VBYR58qnk9RsGhz4DnGNEDpt3I/VAEAtNDE+6yIGGpO
1NeqSoNV4bWuHayL3wbWGDsnB2A91go=
=3ttV
-----END PGP SIGNATURE-----

--h6avthptzu4aupac--
