Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3D617F274
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 09:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgCJI5r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 04:57:47 -0400
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:21536
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726389AbgCJI5r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 04:57:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4i+SAoHRTgRt5wVSL6VZeJlRwhhmsAWTEM/chWYKD6388vIPuQksMB9UT5xodlmaqMHFdKQjEBVFRuQdvj2Ywyy/eV5azhrAWJb2K265JJbldZwCkatPse+Ga16ossIA+0o80zjxJzLROnx+5xRl3zKECGHcyVUHW8ph9YhGO93kAdu8iQOmeLqw1+z9ilUpOcoqFT/ScDJGk7Tx+9+8iCXGE6RxQRGq0WGLb7YCwAvKtIUmatzP+2ij/zMyrDZuJRNmMUS85ltYxBkdC7rayvyzLJ6ys6bG7Ep+jLq3vFCZNyEmGgexh4nO5lcf83NvEEOnemamiGkKIdPdz2S2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDPEk/Ljw/aMGgoBNBhlqfmgjnKHnpcNetx3IG5UJ1o=;
 b=eK3fowrtJnqgBogxTDPLC5jG321ewN0KDLRuI98sbY3kC2DjdFCTK61jujqQQEnddfGDCpR3c4CPBodmK0vMgRuIraYaajC52JlrE2elLw2YSU01R7VoI95kI/E4InAZIhpb45rYsHvZlrHRa/9sz2G2AgUh0IsI4xn0AtCbwY/Oq/gbhZkwwHQIw12Kr406MhVv5ZxzT45qAc6UwTdApVa19nDEHQ5+6qs3CgWik7d2R02dzlibDjQP57Ge6f0KfX6FX86lYB1+TGpYlFeYl0zEd9cdUUwgCdG10Pa7ZNkkj2js64jSfddraHRRaWYFinUMs9NmfODHeQqCkQb1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDPEk/Ljw/aMGgoBNBhlqfmgjnKHnpcNetx3IG5UJ1o=;
 b=gKg+K8sce8pV4u8HD+bNQXgy8Dew4Za1T7DXQMm5mMAwRUOUtzLok7rGhTDDVaB8N5uobSXnoMzu1xXwLdPp7V49+Z3YBUIh/KDXBGdrFVCT/em7R5CUhdX8laRio29oqyifUySQBH3lbG0wkthQ+69xmPKdl5q+nzpZLk3mJmo=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
 OSBPR01MB2168.jpnprd01.prod.outlook.com (52.134.242.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 08:57:42 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b]) by OSBPR01MB3590.jpnprd01.prod.outlook.com
 ([fe80::6df0:eb47:a259:b94b%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 08:57:42 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH 2/2] media: i2c: ov5645: Switch to assigned-clock-rates
Thread-Topic: [PATCH 2/2] media: i2c: ov5645: Switch to assigned-clock-rates
Thread-Index: AQHV9ghyXLEK7w0bFkWyEANalmhRxqhBhdKAgAAAdqA=
Date:   Tue, 10 Mar 2020 08:57:42 +0000
Message-ID: <OSBPR01MB3590059F0ADB45559111C135AAFF0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1583754373-16510-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583754373-16510-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200310085027.GA5379@paasikivi.fi.intel.com>
In-Reply-To: <20200310085027.GA5379@paasikivi.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9fa99573-dda6-48c3-e4c9-08d7c4d117f6
x-ms-traffictypediagnostic: OSBPR01MB2168:
x-microsoft-antispam-prvs: <OSBPR01MB2168F76207CF5DAA1AB04B1EAAFF0@OSBPR01MB2168.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(189003)(199004)(54906003)(2906002)(4326008)(53546011)(6916009)(6506007)(7696005)(5660300002)(316002)(52536014)(478600001)(71200400001)(7416002)(81166006)(55016002)(81156014)(66476007)(66446008)(33656002)(8936002)(86362001)(26005)(64756008)(8676002)(66556008)(186003)(66946007)(9686003)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2168;H:OSBPR01MB3590.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5qE61C1+mnKb5jsmGaeIumj1yd5t8U+fdCMuBbdXEfaZmZdLyLLrd473b3NShjoHZ/u3K05NvWW8/WOVm2atYAsDBsJr8B+5urJcQ0Prc619LjM/VhLbvOAY9hS66w1RyQjJUVamaYWN/ZaRgg2odMZAnM6CVHlOF8ZkOBSw+zzGXmuYx6qBGJSqvM/hkx1zPgjMjE0LMMOpxxGgAuTlfximOjXBBCwAhCQ1OkM2LcVVZf2Zqh5TqBGV3iaUI/zQqvcXJ9MjWdHnu3dWQTl5WAaOP5SDftqmMIFIB0fSmDvFHaqleAUV87dC0TCqqG/ci5jTTJsVpa5onQskAPC9/Ohv3X7H/WSkdzcjxvJg7bwa0Psb300nLSvkt8KVPQfPFdY+Xig/ygGkR0FQdQg5iN/GQSzgGvjzwgDxynNnIL6rmpX4mfUPlGMNJflB9kDh
x-ms-exchange-antispam-messagedata: ZLvfwDD8A/9QuYvYAd3nxEc+wL+4iOCLG5DFys4JHavglSaTmtn9hCKRT/bzfCFRcAwmJi/o77nT278L99rWYEyXm6jbXXrTQpLr6uGz/+3onttAfLptp0sBKh/ryTxaGKK1Ze93sAnXKL8jy9xJQg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa99573-dda6-48c3-e4c9-08d7c4d117f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 08:57:42.2331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FSFJB/Jl+WMUCB6VZgNiUqIAMR3gaX/Gwrku697496hjB3nfwqfl+rgu3ocPMRcLJaKscwRw1ftECoUddu7LW0VW9VgMk8e5B1yun9QVWPfrikFWVRhMGL4j2Wv1yLMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2168
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the review.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: 10 March 2020 08:50
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>; Rob Herring
> <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Shawn
> Guo <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; NXP Linux Team <linux-imx@nxp.com>; Kieran
> Bingham <kieran.bingham+renesas@ideasonboard.com>; linux-
> media@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Lad
> Prabhakar <prabhakar.csengg@gmail.com>
> Subject: Re: [PATCH 2/2] media: i2c: ov5645: Switch to assigned-clock-rat=
es
>
> Hi Prabhakar,
>
> On Mon, Mar 09, 2020 at 11:46:13AM +0000, Lad Prabhakar wrote:
> > This patch switches to assigned-clock-rates for specifying the clock ra=
te.
> > The clk-conf.c internally handles setting the clock rate, as a result
> > setting the clk rate from the driver is dropped.
> >
> > Correspondingly imx6qdl-wandboard.dtsi which references to ov5645 has
> > been updated to use assigned-clock-rates in the same patch to avoid
> > bisect failures.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > ---
> >  arch/arm/boot/dts/imx6qdl-wandboard.dtsi | 3 ++-
> >  drivers/media/i2c/ov5645.c               | 9 ++-------
> >  2 files changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> > b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> > index c070893..71f5f75 100644
> > --- a/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> > +++ b/arch/arm/boot/dts/imx6qdl-wandboard.dtsi
> > @@ -126,7 +126,8 @@
> >  reg =3D <0x3c>;
> >  clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> >  clock-names =3D "xclk";
> > -clock-frequency =3D <24000000>;
> > +assigned-clocks =3D <&clks IMX6QDL_CLK_CKO2>;
> > +assigned-clock-rates =3D <24000000>;
> >  vdddo-supply =3D <&reg_1p8v>;
> >  vdda-supply =3D <&reg_2p8v>;
> >  vddd-supply =3D <&reg_1p5v>;
>
> Shouldn't this be a separate patch?
>
I did think about it, but realized it might break bisect, but with below ch=
anges this can
be a separate patch now.

> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> > index a6c17d1..2aa2677 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -1094,7 +1094,8 @@ static int ov5645_probe(struct i2c_client *client=
)
> >  return PTR_ERR(ov5645->xclk);
> >  }
> >
> > -ret =3D of_property_read_u32(dev->of_node, "clock-frequency",
> &xclk_freq);
> > +ret =3D of_property_read_u32(dev->of_node, "assigned-clock-rates",
> > +   &xclk_freq);
>
> I think you'd still need to check for clock-frequency to be compatible wi=
th
> existing DT binaries.
>
Makes sense, I will add the check for it and if clock-frequency is specifie=
d Ill let the driver
set the clock.

Cheers,
--Prabhakar

> >  if (ret) {
> >  dev_err(dev, "could not get xclk frequency\n");
> >  return ret;
> > @@ -1107,12 +1108,6 @@ static int ov5645_probe(struct i2c_client *clien=
t)
> >  return -EINVAL;
> >  }
> >
> > -ret =3D clk_set_rate(ov5645->xclk, xclk_freq);
> > -if (ret) {
> > -dev_err(dev, "could not set xclk frequency\n");
> > -return ret;
> > -}
> > -
> >  for (i =3D 0; i < OV5645_NUM_SUPPLIES; i++)
> >  ov5645->supplies[i].supply =3D ov5645_supply_name[i];
> >
>
> --
> Regards,
>
> Sakari Ailus


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
