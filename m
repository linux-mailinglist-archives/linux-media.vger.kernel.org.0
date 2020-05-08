Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9FDA1CA770
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 11:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEHJqI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 05:46:08 -0400
Received: from mga18.intel.com ([134.134.136.126]:34419 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgEHJqH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 05:46:07 -0400
IronPort-SDR: 8RgRICC0x/jFFKiyPkP0sZbTyxX6ClQ9OMJ2w4V0gf9lcPGr4O30/jE1D/CSRzGqFlsaiJUJpP
 fFP55fCpUqgQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2020 02:46:02 -0700
IronPort-SDR: sayrHDSTwIjiB0936w6yveKNUpyvvpH1/6Kd9L1vPZminDp35yBKCFVijVZRhk9gvXr5b2McEH
 xjdq9UAYQF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,367,1583222400"; 
   d="scan'208";a="305383605"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
  by FMSMGA003.fm.intel.com with ESMTP; 08 May 2020 02:46:01 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 02:46:01 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 8 May 2020 02:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZaBz+K7I7LX7Pq3rxR41/uyFWoDtjOtW5rLZwVfmRBqbM8GksL4cc7ZTPYeN/yvJuvacaJ2aWm2bBRWBymWsMuDzMRZ1jQV0NffsfHGot10Q7ZzkgD1s1w4rs7pK2KFEM44A3G70Tt6xIsmRjmh9tJQy2QePByRBp0uCkNMDOfcTV1hgTEpiUX91EL0KybQJxMMOK90VSnXfeQaAGKPOF/vSLXaIv78uUcI7QrhaZBNaofncbEUZaO+BmrgrOtu8psdFjrD2te0FKRfMEV8b8RjTw2ab01zgairdxuu/NKysY7Dl4jBL2/PzvdLo7SZpHlLyS6zercriR1U0kBomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXxQSZdRq1D3+FIj7qb9KqrzPWhL/PSW88RkKZdeJQU=;
 b=cDRJNTGZMfecrLCxAFBRZ+hrnxENZb6JjMA1GN1qneiyYMwX6JOPCoOZWjgrvLV7uddrFDRdrplGN1oxwgpToUI17ZJNtNUzwE843rmyqeigDRv7FWeZfaGkUB7j99R5uql0FlZk+tHZRdIWKAYmreAXYl6doxOEcp83jg0Hc2Ufsw4YOjLe8wAy14WBYzODktZvk9KahZLpvSuGtUmV069ew9JkM1YeMLBwB/eJ8DkF6lJscsZpYsD/8WEZpz8HwWMTQAaHSn21s34JngFLz5PMdiIOHBYp7dKC6PfwtOJhdg473YXxNW8ksgZqjfbdkT6tJ9kTSBxnBtPgbMcfXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXxQSZdRq1D3+FIj7qb9KqrzPWhL/PSW88RkKZdeJQU=;
 b=ntLuqp2X/7yB2WyKNVHPL+4+hcxSVekxhPHegjyyTK7yFcA5kTm70zDMSXf7bxaw8h0WOl8pfbKDbz0X3l7nADd4kXyTmG57EqIcrDCh2hAzYdbnPXU6PKGrK4GDshMh0jtl/htuQA5v21yLO7TKljtyJ6Ho+LD6MrdY+/BZ0MA=
Received: from SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 by SN6PR11MB3070.namprd11.prod.outlook.com (2603:10b6:805:d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Fri, 8 May
 2020 09:46:00 +0000
Received: from SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::55b:4ee0:cce8:b80a]) by SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::55b:4ee0:cce8:b80a%7]) with mapi id 15.20.2958.030; Fri, 8 May 2020
 09:45:59 +0000
From:   "Kao, Ben" <ben.kao@intel.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
CC:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Maxime Ripard <maxime@cerno.tech>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: RE: [PATCH v7 2/3] media: ov8856: Add devicetree support
Thread-Topic: [PATCH v7 2/3] media: ov8856: Add devicetree support
Thread-Index: AQHWIsRSr9qrYL8+20yc4tjjkTiCJKicPgTwgAANj4CAAaeM8A==
Date:   Fri, 8 May 2020 09:45:59 +0000
Message-ID: <SN6PR11MB329325EF070C6E28724C0415EDA20@SN6PR11MB3293.namprd11.prod.outlook.com>
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-3-robert.foss@linaro.org>
 <SN6PR11MB3293BF52D336178B9D2F5974EDA50@SN6PR11MB3293.namprd11.prod.outlook.com>
 <20200507082149.y7yzzgzkmw5nu7b4@pengutronix.de>
In-Reply-To: <20200507082149.y7yzzgzkmw5nu7b4@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.218]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bae96bd-8d25-46c4-f251-08d7f3349d53
x-ms-traffictypediagnostic: SN6PR11MB3070:
x-microsoft-antispam-prvs: <SN6PR11MB30703F1CCCFEB24FAB31FD76EDA20@SN6PR11MB3070.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjIyTA02cuIffqAkBjXncm5TGAi+EwJWV0isOHD8qXT0XXgTmlVKxU1BEHvTpcr3ljOhI+IqkB/asOR7PNjKNdGbwisIFb+p0sYuPkw9kP1kpSoKjl5pjnIJEiXEMPhR6eogBGlVTCu+nRUS9t0eONhw9p5aljUCuHibXl687QTMjP1434OikXUS+PgNgnwFEg7gSobrTn7QRuOzPwB1Ww51lznqUrFw2v0sIprwlhYXXuwwR+v6pCz0NFDWPmM+58Y0SJnwXfi6/OBuny8xxQI2lAEwVs9YF/qLJ15UJxsCO56MHDddWBItDDRdCH5+t6HLroQNKj4/ZTGhU/L1ZuUJwgiNg+2QRYJAXnV9Bt86BsJC5U5T87qkEXBQuFxigePRvHz6e3CAIAVWrcfVaYbTykepiO6feCupyW8JwnMjhjUOBmiuPfdxmP/s4SwaGbVG1RHXTFHiudRkca94yiA7ZefY8If5h1CMXy8lyBsrMYLTFY1musP4ESxcb9DJnzdgaL/Hc5ko/eDmR+PvPBsDP3J4P6wp1u945VCrQ4l1ZuQB0TsvubrnwJt7GGNkwdYLFaq+m/U1hI1V/xfD72r2LNSJhAYqZ2OQvSLPvvYxcLgRBVFMcpvlNukIzKdS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3293.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(396003)(39860400002)(376002)(33430700001)(4326008)(33656002)(33440700001)(83300400001)(83320400001)(83290400001)(55016002)(83310400001)(83280400001)(9686003)(30864003)(83080400001)(76116006)(2906002)(478600001)(7416002)(966005)(5660300002)(66946007)(66556008)(66446008)(64756008)(66476007)(8936002)(316002)(8676002)(6506007)(71200400001)(6916009)(86362001)(52536014)(54906003)(186003)(7696005)(53546011)(26005)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: PpHT+zjf5gij4M8yx+tB2EhtA9vxYSiSQ/kPGviJLys+xSTu4p4cg6IvS95+CYjEIli7F0pk891LbQ1dtkR9An2JFsozkubCnrXgQv3co02d2ADzALZ7rf+E+YZsA1VEi0lE6rEQ0IuVFx/Vo3Kq05gldbAG6kzPvj+vrP3HIn+mefdZHNUUy8hf8UbyXwCz3gopIvRaFI09zGQ14hzyLjWF/pcWFYr0Dac5A94sCsTKTSfrkf8+F6R3IIdqlLXGYTi6YQ2FtKYTKbasMopcOVRb4VkQ90h/9KTf8Yz5vJ56y5G6IQVyu3VS6/CcIYphUqnDNbd5GBejEXkfs2bpFBLSZid33/Czb2WY82h/oyDxTb/PghMXcRUwK4Rp4AR7Z+nkqWxFBot5eZX0wYx0v0+CSYAeBOHL6TcwJAr2vwrCT0Km9m8ePdLn8JCYyYLMl6d11bTfHKQtKJq5OYCA3wDzYysRyA7goTqAprGiRag=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bae96bd-8d25-46c4-f251-08d7f3349d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 09:45:59.8198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4v2v4gsHTfAre0mJrmNIvWOTmx6TYAgB/0VPfl5nGdJ9O7aW87S1MAjSbEhIZaHpFy/czeLVUrJNpRnvmONQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3070
X-OriginatorOrg: intel.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco Felsch,

> 20-05-08 04:22, Marco Felsch wrote: =20
> Hi Ben,
>=20
> On 20-05-07 08:06, Kao, Ben wrote:
> > Hi Robert,
> >
> > On 20-05-05 12:01, Robert Foss wrote:
> > > Add match table, enable ov8856_probe() to support both ACPI and DT mo=
des.
> > >
> > > ACPI and DT modes are primarily distinguished from by checking for
> > > ACPI mode and by having resource like be NULL.
> > >
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > > ---
> > >
> > > - Changes since v6:
> > >   * Marco: Bail out of __ov8856_power_on earlier if ACPI mode
> > >
> > > - Changes since v5:
> > >   * Maxime & Sakari: Replaced clock tolerance check with warning
> > >
> > > - Changes since v4:
> > >   * Maxime & Sakari: Switch to clock-frequency
> > >
> > > - Changes since v3:
> > >   * Remove redundant {}-brackets
> > >   * Compare xvclk_rate to 5% tolerance
> > >   * Andy: Use dev_fwnode()
> > >   * Andy: Use %pe instead of %ld + PTR_ERR()
> > >   * Andy: Invert reset_gpio logic
> > >   * Andy: Remove dev_dbg() from failing reset_gpio setup
> > >   * Andy: Use dev_err for logging for failures
> > >   * Andy: Remove dev_warn from EDEFER/regulator error path
> > >   * Andy & Sakari: Replaced GPIOD_OUT_XXX with 0/1
> > >   * Maxime & Sakari: Verify clock frequency from DT
> > >   * Sakari: Verify the 'xvclk_rate' is set correctly for ACPI/DT devi=
ces
> > >   * Sakari: Remove duplicate ov8856->dev assignment
> > >
> > > - Changes since v2:
> > >   * Added "struct device *dev" member to struct ov8856
> > >   * Andy: Switch to optional version of devm_gpiod_get
> > >   * Andy: Switch to optional version of devm_clk_get
> > >   * Fabio: Add reset sleep period
> > >   * Sakari: Unify defines for 19.2Mhz
> > >   * Sakari: Remove 24Mhz clock, since it isn't needed for supported m=
odes
> > >   * Sakari: Replace dev_info() with dev_dbg()
> > >   * Sakari: Switch induction variable type to unsigned
> > >   * Sakari: Don't wait for reset_gpio when in ACPI mode
> > >   * Sakari: Pull reset GPIO high on power on failure
> > >   * Sakari: Add power on/off to resume/suspend
> > >   * Sakari: Fix indentation
> > >   * Sakari: Power off during ov8856_remove()
> > >   * Sakari: Don't sleep during power-on in ACPI mode
> > >   * Sakari: Switch to getting xvclk from clk_get_rate
> > >
> > > - Changes since v1:
> > >   * Andy & Sakari: Make XVCLK optional since to not break ACPI
> > >   * Fabio: Change n_shutdown_gpio name to reset_gpio
> > >   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH ->
> > > GPIO_ACTIVE_LOW change
> > >   * Fabio: Remove empty line
> > >   * Fabio: Remove real error from devm_gpiod_get() failures
> > >   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPL=
IES
> > >   * Sakari: Use XVCLK rate as provided by DT
> > >
> > >  drivers/media/i2c/ov8856.c | 137
> > > +++++++++++++++++++++++++++++++++----
> > >  1 file changed, 123 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> > > index 8655842af275..e6418a79801e 100644
> > > --- a/drivers/media/i2c/ov8856.c
> > > +++ b/drivers/media/i2c/ov8856.c
> > > @@ -3,10 +3,13 @@
> > >
> > >  #include <asm/unaligned.h>
> > >  #include <linux/acpi.h>
> > > +#include <linux/clk.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > > +#include <linux/regulator/consumer.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > >  #include <media/v4l2-fwnode.h>
> > > @@ -18,7 +21,7 @@
> > >  #define OV8856_LINK_FREQ_360MHZ		360000000ULL
> > >  #define OV8856_LINK_FREQ_180MHZ		180000000ULL
> > >  #define OV8856_SCLK			144000000ULL
> > > -#define OV8856_MCLK			19200000
> > > +#define OV8856_XVCLK_19_2		19200000
> > >  #define OV8856_DATA_LANES		4
> > >  #define OV8856_RGB_DEPTH		10
> > >
> > > @@ -64,6 +67,12 @@
> > >
> > >  #define to_ov8856(_sd)			container_of(_sd, struct
> ov8856, sd)
> > >
> > > +static const char * const ov8856_supply_names[] =3D {
> > > +	"dovdd",	/* Digital I/O power */
> > > +	"avdd",		/* Analog power */
> > > +	"dvdd",		/* Digital core power */
> > > +};
> > > +
> > >  enum {
> > >  	OV8856_LINK_FREQ_720MBPS,
> > >  	OV8856_LINK_FREQ_360MBPS,
> > > @@ -566,6 +575,11 @@ struct ov8856 {
> > >  	struct media_pad pad;
> > >  	struct v4l2_ctrl_handler ctrl_handler;
> > >
> > > +	struct device		*dev;
> > > +	struct clk		*xvclk;
> > > +	struct gpio_desc	*reset_gpio;
> > > +	struct regulator_bulk_data
> > > supplies[ARRAY_SIZE(ov8856_supply_names)];
> > > +
> > >  	/* V4L2 Controls */
> > >  	struct v4l2_ctrl *link_freq;
> > >  	struct v4l2_ctrl *pixel_rate;
> > > @@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_subdev
> > > *sd, int enable)
> > >  	return ret;
> > >  }
> > >
> > > +static int __ov8856_power_on(struct ov8856 *ov8856) {
> > > +	struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->sd);
> > > +	int ret;
> > > +
> > > +	if (is_acpi_node(dev_fwnode(ov8856->dev)))
> > > +		return 0;
> > > +
> > > +	ret =3D clk_prepare_enable(ov8856->xvclk);
> > > +	if (ret < 0) {
> > > +		dev_err(&client->dev, "failed to enable xvclk\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (ov8856->reset_gpio) {
> > > +		gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +		usleep_range(1000, 2000);
> > > +	}
> > > +
> > > +	ret =3D regulator_bulk_enable(ARRAY_SIZE(ov8856_supply_names),
> > > +				    ov8856->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(&client->dev, "failed to enable regulators\n");
> > > +		goto disable_clk;
> > > +	}
> > > +
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 0);
> > > +	usleep_range(1500, 1800);
> > > +
> > > +	return 0;
> > > +
> > > +disable_clk:
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void __ov8856_power_off(struct ov8856 *ov8856) {
> > > +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> > > +	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> > > +			       ov8856->supplies);
> > > +	clk_disable_unprepare(ov8856->xvclk);
> > > +}
> > > +
> > >  static int __maybe_unused ov8856_suspend(struct device *dev)  {
> > >  	struct i2c_client *client =3D to_i2c_client(dev); @@ -918,6 +978,7
> > > @@ static int __maybe_unused ov8856_suspend(struct device *dev)
> > >  	if (ov8856->streaming)
> > >  		ov8856_stop_streaming(ov8856);
> > >
> > > +	__ov8856_power_off(ov8856);
> > >  	mutex_unlock(&ov8856->mutex);
> > >
> > >  	return 0;
> > > @@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struct
> > > device *dev)
> > >  	int ret;
> > >
> > >  	mutex_lock(&ov8856->mutex);
> > > +
> > > +	__ov8856_power_on(ov8856);
> > >  	if (ov8856->streaming) {
> > >  		ret =3D ov8856_start_streaming(ov8856);
> > >  		if (ret) {
> > > @@ -1092,29 +1155,54 @@ static int ov8856_identify_module(struct
> > > ov8856
> > > *ov8856)
> > >  	return 0;
> > >  }
> > >
> > > -static int ov8856_check_hwcfg(struct device *dev)
> > > +static int ov8856_get_hwcfg(struct ov8856 *ov8856)
> > >  {
> > > +	struct device *dev =3D ov8856->dev;
> > >  	struct fwnode_handle *ep;
> > >  	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> > >  	struct v4l2_fwnode_endpoint bus_cfg =3D {
> > >  		.bus_type =3D V4L2_MBUS_CSI2_DPHY
> > >  	};
> > > -	u32 mclk;
> > > +	u32 xvclk_rate;
> > >  	int ret;
> > >  	unsigned int i, j;
> > >
> > >  	if (!fwnode)
> > >  		return -ENXIO;
> > >
> > > -	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> > > +	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency",
> > > +		&xvclk_rate);
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	if (mclk !=3D OV8856_MCLK) {
> > > -		dev_err(dev, "external clock %d is not supported", mclk);
> > > -		return -EINVAL;
> > > +	if (!is_acpi_node(fwnode)) {
> > > +		ov8856->xvclk =3D devm_clk_get(dev, "xvclk");
> > > +		if (IS_ERR(ov8856->xvclk)) {
> > > +			dev_err(dev, "could not get xvclk clock (%pe)\n",
> > > +					ov8856->xvclk);
> > > +			return PTR_ERR(ov8856->xvclk);
> > > +		}
> > > +
> > > +		clk_set_rate(ov8856->xvclk, xvclk_rate);
> > > +		xvclk_rate =3D clk_get_rate(ov8856->xvclk);
> > >  	}
> > >
> > > +	if (xvclk_rate !=3D OV8856_XVCLK_19_2)
> > > +		dev_warn(dev, "external clock rate %d is unsupported",
> > > xvclk_rate);
> > > +
> > > +	ov8856->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> > > +		GPIOD_OUT_LOW);
> > > +	if (IS_ERR(ov8856->reset_gpio))
> > > +		return PTR_ERR(ov8856->reset_gpio);
> > > +
> > > +	for (i =3D 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> > > +		ov8856->supplies[i].supply =3D ov8856_supply_names[i];
> > > +
> > > +	ret =3D devm_regulator_bulk_get(dev,
> > > ARRAY_SIZE(ov8856_supply_names),
> > > +				      ov8856->supplies);
> > > +	if (ret)
> > > +		return ret;
> > > +
> >
> > In case of ACPI this cannot get ov8856->reset_gpio  and ov8856->supplie=
s,
> please add the check for ACPI case:
> > if (!is_acpi_node(fwnode)) { }
>=20
> I tought that dummy-regulators will be created in case of ACPI?
You are right, the check is unnecessary.

Ben
>=20
> Regards,
>   Marco
>=20
> > Thanks.
> > Ben
> >
> > >  	ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
> > >  	if (!ep)
> > >  		return -ENXIO;
> > > @@ -1169,6 +1257,8 @@ static int ov8856_remove(struct i2c_client *cli=
ent)
> > >  	pm_runtime_disable(&client->dev);
> > >  	mutex_destroy(&ov8856->mutex);
> > >
> > > +	__ov8856_power_off(ov8856);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -1177,22 +1267,31 @@ static int ov8856_probe(struct i2c_client *cl=
ient)
> > >  	struct ov8856 *ov8856;
> > >  	int ret;
> > >
> > > -	ret =3D ov8856_check_hwcfg(&client->dev);
> > > +	ov8856 =3D devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
> > > +	if (!ov8856)
> > > +		return -ENOMEM;
> > > +
> > > +	ov8856->dev =3D &client->dev;
> > > +
> > > +	ret =3D ov8856_get_hwcfg(ov8856);
> > >  	if (ret) {
> > > -		dev_err(&client->dev, "failed to check HW configuration: %d",
> > > +		dev_err(&client->dev, "failed to get HW configuration: %d",
> > >  			ret);
> > >  		return ret;
> > >  	}
> > >
> > > -	ov8856 =3D devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
> > > -	if (!ov8856)
> > > -		return -ENOMEM;
> > > -
> > >  	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> > > +
> > > +	ret =3D __ov8856_power_on(ov8856);
> > > +	if (ret) {
> > > +		dev_err(&client->dev, "failed to power on\n");
> > > +		return ret;
> > > +	}
> > > +
> > >  	ret =3D ov8856_identify_module(ov8856);
> > >  	if (ret) {
> > >  		dev_err(&client->dev, "failed to find sensor: %d", ret);
> > > -		return ret;
> > > +		goto probe_power_off;
> > >  	}
> > >
> > >  	mutex_init(&ov8856->mutex);
> > > @@ -1238,6 +1337,9 @@ static int ov8856_probe(struct i2c_client *clie=
nt)
> > >  	v4l2_ctrl_handler_free(ov8856->sd.ctrl_handler);
> > >  	mutex_destroy(&ov8856->mutex);
> > >
> > > +probe_power_off:
> > > +	__ov8856_power_off(ov8856);
> > > +
> > >  	return ret;
> > >  }
> > >
> > > @@ -1254,11 +1356,18 @@ static const struct acpi_device_id
> > > ov8856_acpi_ids[] =3D {  MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);
> > > #endif
> > >
> > > +static const struct of_device_id ov8856_of_match[] =3D {
> > > +	{ .compatible =3D "ovti,ov8856" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ov8856_of_match);
> > > +
> > >  static struct i2c_driver ov8856_i2c_driver =3D {
> > >  	.driver =3D {
> > >  		.name =3D "ov8856",
> > >  		.pm =3D &ov8856_pm_ops,
> > >  		.acpi_match_table =3D ACPI_PTR(ov8856_acpi_ids),
> > > +		.of_match_table =3D ov8856_of_match,
> > >  	},
> > >  	.probe_new =3D ov8856_probe,
> > >  	.remove =3D ov8856_remove,
> > > --
> > > 2.25.1
> >
> >
>=20
> --
> Pengutronix e.K.                           |                             =
|
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  =
|
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    =
|
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 =
|
