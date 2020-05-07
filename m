Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F3C1C8451
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgEGIGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 04:06:31 -0400
Received: from mga07.intel.com ([134.134.136.100]:3777 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgEGIG3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 7 May 2020 04:06:29 -0400
IronPort-SDR: lkfbjrL9f9Lz27+s5/RJyO3rR0NZSwVR4Vdn0kkPtonRYm2xVPCr85uxtC//cq45qBFVllCyS6
 zUR6oYfObd4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2020 01:06:28 -0700
IronPort-SDR: XvAwOy9rJiHh7AhaYBcpwBcg9CCfRpV+oLhcRlRZeeu5gXBHM3nQ18MVpo+XxNMWSdp2RIl5sO
 HjKMFmzrO6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,363,1583222400"; 
   d="scan'208";a="250020621"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by fmsmga007.fm.intel.com with ESMTP; 07 May 2020 01:06:28 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 7 May 2020 01:06:27 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 7 May 2020 01:06:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 7 May 2020 01:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKPxUBzWR7JqU3roFWxZvcG5+yglzXMCzM5YP+gxrKvkA9Y2cNUJaDz25Oaxs/OsUz+cusW7FbCLXPxuT7Escs7VPXS8wlXMng2qgnvoKoN/zV5hWC3KHPjmDYB1xnmh8bgJG6S1Cvl/PwmdD+psc1uYt7UMBwLkC/AkLuP4ODb0eDQ4kC6/FpivWLGTo3kOjxDoYfso9/3yyJ6turHv6CVxIwX+SdV7dopP0GZPRYmkko3JTKdJyzLioadoafOfbFsKOmQ/45ymxYYNP80ncEEflEJEeY/q0bET5bU1uZ1MT4pxgxENR4HFPBxaOFtU+QYsY8+RWES+XcFrLgohmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olf9RVDSRipIXgKxcgC0HUD6r0zTnNiQ25hd3LJKLU4=;
 b=SzX+sr1QvWxVo28dFPmLVqMbiJCyrnISw6IX5mZiFjd1AEM0AxDwClo7e/C3maXhSXeqbJ5uHbf2InMDLTVMk4NuNJnDcnEvSuOZwWRl6nwT13IhbaYhlav3qHxOTJZa4tWtEu0R9Kzx1WBgBReSERWsaEwt9LGi7348qa/M9qOH74Ya+xrR9SmaReQvJXKGN0ckxGImWZwVllZ5NEYI4NJeHud6JUDc+mtJfP0EPDBm7e+YIA9aQ9jud/MeBjbg8afLWOoOy8D6pv6i8LoXW/Tv0Vbcy28auFoMpEBEcAYK9XJ5oeAmX7hn1PBCuCzbjMsN7YadDKDwAjS/mBLrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Olf9RVDSRipIXgKxcgC0HUD6r0zTnNiQ25hd3LJKLU4=;
 b=Y/RdrtIL0uryNGI4nvOuH2lmdv6vGl6anCY08yxGGn+sig9VjrHBkLluUPEW4k3qu9VVQxGcOT3eQWXdKQhpV5J7AMutvRGanfHsSOmMSVP42lQwtzWBe5GjeT4MAcH+3Nzl3WM4A4SzvpYCn6Iwvog8JpMNakkXcwkWCPnQIco=
Received: from SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 by SN6PR11MB2862.namprd11.prod.outlook.com (2603:10b6:805:5b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Thu, 7 May
 2020 08:06:24 +0000
Received: from SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::55b:4ee0:cce8:b80a]) by SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::55b:4ee0:cce8:b80a%7]) with mapi id 15.20.2958.030; Thu, 7 May 2020
 08:06:24 +0000
From:   "Kao, Ben" <ben.kao@intel.com>
To:     Robert Foss <robert.foss@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
CC:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>
Subject: RE: [PATCH v7 2/3] media: ov8856: Add devicetree support
Thread-Topic: [PATCH v7 2/3] media: ov8856: Add devicetree support
Thread-Index: AQHWIsRSr9qrYL8+20yc4tjjkTiCJKicPgTw
Date:   Thu, 7 May 2020 08:06:23 +0000
Message-ID: <SN6PR11MB3293BF52D336178B9D2F5974EDA50@SN6PR11MB3293.namprd11.prod.outlook.com>
References: <20200505100129.104673-1-robert.foss@linaro.org>
 <20200505100129.104673-3-robert.foss@linaro.org>
In-Reply-To: <20200505100129.104673-3-robert.foss@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d718ee01-139d-459c-4ef7-08d7f25d891a
x-ms-traffictypediagnostic: SN6PR11MB2862:
x-microsoft-antispam-prvs: <SN6PR11MB286211D4028D3941FC039504EDA50@SN6PR11MB2862.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 03965EFC76
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZiwuljWPrR+J2mbIjkDLsEPK+ZqQRXn9gE6vAxsgk0aPUTaLOuNdbGNC3T5B3F3mDDqpF+TwgmPQRl6kIjWWyCtrXZF8tKKNTxpjQUma8L4U20Qfvn5xkHC4N99RsxKXgij+0iIdY+6tcb8qsA3EOYy7dTgzFxDLj9eTFsXL4noO88Po00hno7bFf39QUxU3LCmvQ8Nl9QSShAqdtwN938JoCFxoVJIZ+/kWdo4e9hp02yGvjk4EpkiYm3eu/Bm2G0+TUKeHyWWNvpH1YtoTm0eSy3Dtpe4gUMZpvvLo4jjk4/0SS2v5nrh4I01Vw8BHQ70EH7iV0YrIRqVK8dKdOsibv4Ls3z8xiraNPVtZFsLJ3zaeffakke4FCCXnTcbzSsWyBsc1lllX/oh85hi6VMxYT+yJJotnzY3ynuug+Bs/arcyAiYsinZwQPPmDsA0yVdzh1gKgJP8hrleNzl/vEburZ2eLDQcSlVo+T63NfuCe5T+MfKTT8DmJIqWPsmCFjb71lbZcoYM3O+lWkmmQH7mKu18gloa3axLQ13SeqH2c3VZPiYFFb4pUYQE9Rv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3293.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(39860400002)(136003)(396003)(346002)(366004)(33430700001)(33656002)(64756008)(8936002)(5660300002)(8676002)(33440700001)(4326008)(7416002)(7696005)(478600001)(53546011)(9686003)(186003)(55016002)(6506007)(54906003)(66476007)(76116006)(66556008)(66446008)(52536014)(83320400001)(71200400001)(83280400001)(86362001)(2906002)(316002)(66946007)(110136005)(83300400001)(83310400001)(83290400001)(26005)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: oirSL4hYYECXrBzXRp6po7pUYFe+oxm/ojd8YTGcKY7HYbTgfBVqVaG+GZ2WdK+0PxkUdld8FZ2C39jvC1JzQLUnVUNDW0o/qqgkcvO//5Lrwom4aQl9GobwT4p/ZFaaxdbuUBDVAfipH0GIj0JhszysGLmF/sDTcsaiuaA2xLUx4LMlQeAAjlfMjHwzumxz9EUIl7h4/AlKGgHsA76DET0GWlkj1GcqmNNqMKrWCz/zCulEIAYL+8mwHxbzuZeNo/pKOb7rfFvkGWsRPATDXsfrAAmaZTuiHPTg5WlDiRNpaY/bfmaXEy+B4WrEtxCMeqEhZJK0K2QrB6bv2/326ZU9u5+iCPCW3DuSYuGtDfyGFbIxq2es4l+QIvCzwijQFipmEUNlgVPQ/gNMF2dKB/gpuRWowuMf//HtO8EYt68CSaVH+K8m/Il8PSPTI6cXfh5dKsT6JXffwX9/Qi2FcT5/ZKsIiogVLhm07OaDBmbInXXn3P93TmHxBOUSjK/hOXP/BP++H8qIhaRXyxlwDmtp1KShzKEzlz58z/g9yNYjyLrGqaGX9YL8yKfWBl014bjU/lpoKAJkQhXBo7JufEhLx5XpgMBMj9NFByB2+n739FO1Xo0dr9JHlIUQCFUjdirtWm6Ea3evmWMhRAGERoa04pk7cZW7YLmux63UOTFC/TIfphpH8Kh76tVxYQTvm6ioG1hX0BZKP6Bjn5oqFC/lpEa7n0R7o6FoE1Yhgbgz9/mTbcRilArW36fu4SVZtcBfOXbA6GxPIgU6T+H0/MsB+nr6rzh4OwrV4850EJM=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d718ee01-139d-459c-4ef7-08d7f25d891a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2020 08:06:24.0778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: icU+CG8cvhJvizT8HGswfrAGzJ+8KognpP8sqWXbbrLe0yTnQ5Z7Nr0cX6NpHTFerNbS0IUhvAFPl5tZqNKgyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2862
X-OriginatorOrg: intel.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On 20-05-05 12:01, Robert Foss wrote:
> Add match table, enable ov8856_probe() to support both ACPI and DT modes.
>=20
> ACPI and DT modes are primarily distinguished from by checking for ACPI m=
ode
> and by having resource like be NULL.
>=20
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>=20
> - Changes since v6:
>   * Marco: Bail out of __ov8856_power_on earlier if ACPI mode
>=20
> - Changes since v5:
>   * Maxime & Sakari: Replaced clock tolerance check with warning
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
>   * Fabio: Invert reset_gpio due to GPIO_ACTIVE_HIGH -> GPIO_ACTIVE_LOW
> change
>   * Fabio: Remove empty line
>   * Fabio: Remove real error from devm_gpiod_get() failures
>   * Sakari: ARRAY_SIZE() directly instead of through OV8856_NUM_SUPPLIES
>   * Sakari: Use XVCLK rate as provided by DT
>=20
>  drivers/media/i2c/ov8856.c | 137 +++++++++++++++++++++++++++++++++----
>  1 file changed, 123 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c inde=
x
> 8655842af275..e6418a79801e 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -3,10 +3,13 @@
>=20
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
>=20
> @@ -64,6 +67,12 @@
>=20
>  #define to_ov8856(_sd)			container_of(_sd, struct ov8856, sd)
>=20
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
>=20
> +	struct device		*dev;
> +	struct clk		*xvclk;
> +	struct gpio_desc	*reset_gpio;
> +	struct regulator_bulk_data
> supplies[ARRAY_SIZE(ov8856_supply_names)];
> +
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> @@ -908,6 +922,52 @@ static int ov8856_set_stream(struct v4l2_subdev *sd,
> int enable)
>  	return ret;
>  }
>=20
> +static int __ov8856_power_on(struct ov8856 *ov8856) {
> +	struct i2c_client *client =3D v4l2_get_subdevdata(&ov8856->sd);
> +	int ret;
> +
> +	if (is_acpi_node(dev_fwnode(ov8856->dev)))
> +		return 0;
> +
> +	ret =3D clk_prepare_enable(ov8856->xvclk);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "failed to enable xvclk\n");
> +		return ret;
> +	}
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
> +static void __ov8856_power_off(struct ov8856 *ov8856) {
> +	gpiod_set_value_cansleep(ov8856->reset_gpio, 1);
> +	regulator_bulk_disable(ARRAY_SIZE(ov8856_supply_names),
> +			       ov8856->supplies);
> +	clk_disable_unprepare(ov8856->xvclk);
> +}
> +
>  static int __maybe_unused ov8856_suspend(struct device *dev)  {
>  	struct i2c_client *client =3D to_i2c_client(dev); @@ -918,6 +978,7 @@
> static int __maybe_unused ov8856_suspend(struct device *dev)
>  	if (ov8856->streaming)
>  		ov8856_stop_streaming(ov8856);
>=20
> +	__ov8856_power_off(ov8856);
>  	mutex_unlock(&ov8856->mutex);
>=20
>  	return 0;
> @@ -931,6 +992,8 @@ static int __maybe_unused ov8856_resume(struct
> device *dev)
>  	int ret;
>=20
>  	mutex_lock(&ov8856->mutex);
> +
> +	__ov8856_power_on(ov8856);
>  	if (ov8856->streaming) {
>  		ret =3D ov8856_start_streaming(ov8856);
>  		if (ret) {
> @@ -1092,29 +1155,54 @@ static int ov8856_identify_module(struct ov8856
> *ov8856)
>  	return 0;
>  }
>=20
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
>=20
>  	if (!fwnode)
>  		return -ENXIO;
>=20
> -	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency", &mclk);
> +	ret =3D fwnode_property_read_u32(fwnode, "clock-frequency",
> +		&xvclk_rate);
>  	if (ret)
>  		return ret;
>=20
> -	if (mclk !=3D OV8856_MCLK) {
> -		dev_err(dev, "external clock %d is not supported", mclk);
> -		return -EINVAL;
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
>  	}
>=20
> +	if (xvclk_rate !=3D OV8856_XVCLK_19_2)
> +		dev_warn(dev, "external clock rate %d is unsupported",
> xvclk_rate);
> +
> +	ov8856->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +		GPIOD_OUT_LOW);
> +	if (IS_ERR(ov8856->reset_gpio))
> +		return PTR_ERR(ov8856->reset_gpio);
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ov8856_supply_names); i++)
> +		ov8856->supplies[i].supply =3D ov8856_supply_names[i];
> +
> +	ret =3D devm_regulator_bulk_get(dev,
> ARRAY_SIZE(ov8856_supply_names),
> +				      ov8856->supplies);
> +	if (ret)
> +		return ret;
> +

In case of ACPI this cannot get ov8856->reset_gpio  and ov8856->supplies, p=
lease add the check for ACPI case:
if (!is_acpi_node(fwnode)) { }

Thanks.
Ben

>  	ep =3D fwnode_graph_get_next_endpoint(fwnode, NULL);
>  	if (!ep)
>  		return -ENXIO;
> @@ -1169,6 +1257,8 @@ static int ov8856_remove(struct i2c_client *client)
>  	pm_runtime_disable(&client->dev);
>  	mutex_destroy(&ov8856->mutex);
>=20
> +	__ov8856_power_off(ov8856);
> +
>  	return 0;
>  }
>=20
> @@ -1177,22 +1267,31 @@ static int ov8856_probe(struct i2c_client *client=
)
>  	struct ov8856 *ov8856;
>  	int ret;
>=20
> -	ret =3D ov8856_check_hwcfg(&client->dev);
> +	ov8856 =3D devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
> +	if (!ov8856)
> +		return -ENOMEM;
> +
> +	ov8856->dev =3D &client->dev;
> +
> +	ret =3D ov8856_get_hwcfg(ov8856);
>  	if (ret) {
> -		dev_err(&client->dev, "failed to check HW configuration: %d",
> +		dev_err(&client->dev, "failed to get HW configuration: %d",
>  			ret);
>  		return ret;
>  	}
>=20
> -	ov8856 =3D devm_kzalloc(&client->dev, sizeof(*ov8856), GFP_KERNEL);
> -	if (!ov8856)
> -		return -ENOMEM;
> -
>  	v4l2_i2c_subdev_init(&ov8856->sd, client, &ov8856_subdev_ops);
> +
> +	ret =3D __ov8856_power_on(ov8856);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to power on\n");
> +		return ret;
> +	}
> +
>  	ret =3D ov8856_identify_module(ov8856);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to find sensor: %d", ret);
> -		return ret;
> +		goto probe_power_off;
>  	}
>=20
>  	mutex_init(&ov8856->mutex);
> @@ -1238,6 +1337,9 @@ static int ov8856_probe(struct i2c_client *client)
>  	v4l2_ctrl_handler_free(ov8856->sd.ctrl_handler);
>  	mutex_destroy(&ov8856->mutex);
>=20
> +probe_power_off:
> +	__ov8856_power_off(ov8856);
> +
>  	return ret;
>  }
>=20
> @@ -1254,11 +1356,18 @@ static const struct acpi_device_id ov8856_acpi_id=
s[]
> =3D {  MODULE_DEVICE_TABLE(acpi, ov8856_acpi_ids);  #endif
>=20
> +static const struct of_device_id ov8856_of_match[] =3D {
> +	{ .compatible =3D "ovti,ov8856" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov8856_of_match);
> +
>  static struct i2c_driver ov8856_i2c_driver =3D {
>  	.driver =3D {
>  		.name =3D "ov8856",
>  		.pm =3D &ov8856_pm_ops,
>  		.acpi_match_table =3D ACPI_PTR(ov8856_acpi_ids),
> +		.of_match_table =3D ov8856_of_match,
>  	},
>  	.probe_new =3D ov8856_probe,
>  	.remove =3D ov8856_remove,
> --
> 2.25.1

