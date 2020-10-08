Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBAD286ED7
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 08:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgJHGuB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 02:50:01 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:17516 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726361AbgJHGuB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 02:50:01 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0986XMMB012365;
        Thu, 8 Oct 2020 02:49:47 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2059.outbound.protection.outlook.com [104.47.44.59])
        by mx0a-00128a01.pphosted.com with ESMTP id 33xp74wwhk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Oct 2020 02:49:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4y320bT/be8OyA3xje54IOUoeBM9yRFKEYGrbi6aCy4pujYQpP1SCsunaIf5tXFzCVJ3XbjGkNgFGRjAvyTDuEGW8yfOSH3wNj4E9gehp3srVAOrCWkjDoicbjwp0lEoZnhlbznCtneSo+xrgL4unra5qpxH4lJ72xgxveXEV1i0y8V+0BOq0Dwh3wH+2qJ8PoJ/Ro3bcV0ae1AnLn5Zvj19bStrzxn16LWjf8Ncs+z7qvbmYlwYde4kR6iFnoIeGdqL1sMFppW7C2qCTQ9fuxcKmur84Z0RY+619lZ+/jzMaguotnErFOnxmrVzuqIzR8G3MMktJDL8CkCYMuCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROSS3SbMu6Kt/nYIl2RHoJQzYc519mmvaVo9TlDEAKM=;
 b=ffFO0adOSw+8EkDt3OuDoIwF2VjXhh4S0W2LPxY/wwbbapR4K3L0lVKPjHfRXxw5A36K/bxu6TWTiQb0iCUsYu+sEpOe0zj/659qhqWP9TYhRnZie6Y90/4mBoYImrMVaBhsY6TAtwy3Lo2qHMA4x+Eq5wScP22aUdKDKEvjd9f9uwGtoxJTwgLaVXZAFk4MAJxcwntDaZmHUeNTsJkVobxwrcITF/qBxsy+cmZqVHxJ2+rdspwjF2+445ejrvomVU2Z5AbcZta0pEMjxGc/vdVb9xSJcAJZ7iZ2yjW5ftdO9L2HmQVKZtscxxUrCKkV4wXr3Kpgk1J1jmW4ke/Jng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ROSS3SbMu6Kt/nYIl2RHoJQzYc519mmvaVo9TlDEAKM=;
 b=tUbHXkvZWfef/J8gnWqHcpNHEfpQOjc7HtD9cR3GXmcYwdVCVaM+3nKB1Qq8i12aX2CUkqi9XajYQkz6hhASQHxOYy2CO+jBhlGpVse38u8iSEJ9+TBt3R6ojU7Pcdddxqfjo2RWpWm5YuRBThunIje02rWTTzGi5VKN0I1yhps=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14)
 by DS7PR03MB5621.namprd03.prod.outlook.com (2603:10b6:5:2c8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Thu, 8 Oct
 2020 06:49:44 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd%4]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 06:49:44 +0000
From:   "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Thread-Topic: [PATCH v2 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Thread-Index: AQHWmMD6xXP4G94XmkmR6G666G0rc6mMBZEAgAFAAbA=
Date:   Thu, 8 Oct 2020 06:49:44 +0000
Message-ID: <DM6PR03MB527437AA6766E764873DA1149B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
References: <20201002133537.172379-1-bogdan.togorean@analog.com>
 <20201007111810.GJ26842@paasikivi.fi.intel.com>
In-Reply-To: <20201007111810.GJ26842@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYnRvZ29yZW?=
 =?iso-8859-1?Q?FcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy02NzkzMTk0NC0wOTMyLTExZWItODZiNC?=
 =?iso-8859-1?Q?0xODFkZWE1NDZlZDJcYW1lLXRlc3RcNjc5MzE5NDUtMDkzMi0xMWViLTg2?=
 =?iso-8859-1?Q?YjQtMTgxZGVhNTQ2ZWQyYm9keS50eHQiIHN6PSIyOTE2OSIgdD0iMTMyND?=
 =?iso-8859-1?Q?Y2MTMzNjY4MTk4NjY4IiBoPSJwczZoZzB4ZE9Xd0UwTTlKTDNGY3IrNUhn?=
 =?iso-8859-1?Q?SFE9IiBpZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVU?=
 =?iso-8859-1?Q?ZOQ2dVQUFFb0NBQUFNK1E4cVA1M1dBWGo4dHZaMVB2VlplUHkyOW5VKzlW?=
 =?iso-8859-1?Q?a0RBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBRUFBUUFCQUFBQVkvR3FKd0FBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUo0QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeU?=
 =?iso-8859-1?Q?FHOEFhZ0JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1B?=
 =?iso-8859-1?Q?YVFCMEFHa0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0?=
 =?iso-8859-1?Q?FBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFH?=
 =?iso-8859-1?Q?VUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZUUJr?=
 =?iso-8859-1?Q?QUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWlFCakFIUU?=
 =?iso-8859-1?Q?Fjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9tZXRhPg=3D?=
 =?iso-8859-1?Q?=3D?=
x-dg-rorf: true
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98073cd3-4d15-4f6b-5365-08d86b565737
x-ms-traffictypediagnostic: DS7PR03MB5621:
x-microsoft-antispam-prvs: <DS7PR03MB5621614B8A92EBA5DCEE57B59B0B0@DS7PR03MB5621.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IzoTKxjPttRdCW9KnW2/4DMNqB2FmlXXrFyt1/Hu0qiLiTW5ixHuQIX7thJNsa36ngNiwj20Pbp+0fskk8eaqS1Suo0owcH4o0GKUf6UiUO95WgDJKC79nm9XkKc6bY8rg4SRyTQME5oO6uLjdx7GQhfYsDHHJT7I0TqnHQDHSihh3YvrzdAXZkqro3p0LoGpA/DRjuE+88/JRZ1M7P4dF5s/gu1oA9yZewSI3pxUuQQb2PPSecnmzpMTZMxs6E2x4kGQfwi/i6dmQbNR/p+UXHoRyWYcbKRCHrZm63AEGFomIjazrwI4QVc/MsqueUIcpnNPMN7HsIQVG3aRV2pHHlemGurtoQ188fPIvzArWYTS5SnP4s31XFa5KzzOPfKC+iZNtBcm45DEPIAKiE2zQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(6916009)(54906003)(2906002)(316002)(66946007)(9686003)(86362001)(7696005)(7416002)(83080400001)(66476007)(8936002)(52536014)(64756008)(6506007)(66446008)(66556008)(478600001)(8676002)(55016002)(83380400001)(76116006)(5660300002)(33656002)(30864003)(71200400001)(186003)(26005)(4326008)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ag0NVNknQ8lWiUgEv9hHseGduP07z7Ouv4REpj///VG0KeIPmKWqcc86Pm9Vk5fEc1/XTU8Ed3AQ7wRdy2PtP2tLOZIug3M8ElyzEiJomXJxYQVIcz8kP+DQBfrJvEwwtujhXTUHarfIhdYDtul3SZEhkbIJhiK71cFJLZxh4G5jxlIegWCLiatspS7ZtoRnpQAEoqm1Amn12fiqSRxCk4eda3geOtRP5SDoJ1SW6G28WRaYFxzgDrYvPo8MwFZDGibKW2PAqK4S4SX5aKeq3RCiEHmn4tSE1Dwmx7nM4dHf4GnRqCamD5EHVUpfXqItV8R9xaw4Ulr0VHrrSAjlYjNjJQgWC8DZT6h/pR8Ta+Kv+O1Upgy1WeqYT3cyjIB3CvWY24MuWU1FwCO1t9Kb83kZlKuuM1SEeZO4bAg2OFoLK6bGESE8HU/27cS5hpQPN5otwIzCkupGPQzp8p764XdWQdkMZ6se+XMGNonMRizwZfjM6vGBk/ys/9ZgrUfsZvPWy0CDdDCSuxWf8m74mGRZ8hVvHRDGbFt4m4OF9ZMxTVn8Y+xm3MhGi59Brco4pREntdr/qioysD7/ygsSxLfvcCveXUg2MKkInWsIYa7ylLqkaSzNO9zDDWL7XUrwvD403RvF+r9vYcyNeaogmQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98073cd3-4d15-4f6b-5365-08d86b565737
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 06:49:44.6453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmDmqu7dwMdN+cNVil7JtHkoaH+ajelk4nblee3fx5l6jxjOeOWXuS/2ql7O48w4Ia4Y2p5ZvZ+GzJVIyM+rUw+6dttF6NCO6mSbdppjPlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5621
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-08_03:2020-10-08,2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080050
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Sakari for review

> Hi Bogdan,
>=20
> On Fri, Oct 02, 2020 at 04:35:16PM +0300, Bogdan Togorean wrote:
> > The ADDI9036 is a complete, 45 MHz, front-end solution for charge
> > coupled device (CCD) time of flight (TOF) imaging applications.
> >
> > It has 2-lane MIPI CSI-2 RAW12 data output and i2c control interface.
> >
> > The programming of calibration and firmware is performed by driver
> > using Linux Firmware API.
> >
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > ---
> >
> > v2: implemented reading of FW using Linux Firmware API
> >     removed custom controls for FW programming
> >     added custom control to select operating mode
> >     implemented V1 review remarks
> >     cleaned includes list
> > ---
> >  MAINTAINERS                        |  10 +
> >  drivers/media/i2c/Kconfig          |  14 +
> >  drivers/media/i2c/Makefile         |   1 +
> >  drivers/media/i2c/addi9036.c       | 754 +++++++++++++++++++++++++++++
> >  include/uapi/linux/v4l2-controls.h |   6 +
> >  5 files changed, 785 insertions(+)
> >  create mode 100644 drivers/media/i2c/addi9036.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0d0862b19ce5..4e3878e6c0ba 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -477,6 +477,16 @@ W:	http://wiki.analog.com/AD7879
> >  W:	http://ez.analog.com/community/linux-device-drivers
> >  F:	drivers/input/touchscreen/ad7879.c
> >
> > +ADDI9036 TOF FRONTEND DRIVER
> > +M:	Bogdan Togorean <bogdan.togorean@analog.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Supported
> > +W:	https://www.analog.com/en/products/addi9036.html
> > +W:	http://ez.analog.com/community/linux-device-drivers
> > +T:	git git://linuxtv.org/media_tree.git
> > +F:	Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > +F:	drivers/media/i2c/addi9036.c
> > +
> >  ADDRESS SPACE LAYOUT RANDOMIZATION (ASLR)
> >  M:	Jiri Kosina <jikos@kernel.org>
> >  S:	Maintained
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index c7ba76fee599..087dd307505d 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -725,6 +725,20 @@ config VIDEO_APTINA_PLL
> >  config VIDEO_SMIAPP_PLL
> >  	tristate
> >
> > +config VIDEO_ADDI9036
> > +	tristate "Analog Devices ADDI9036 ToF front-end support"
> > +	depends on I2C && VIDEO_V4L2
> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> > +	select REGMAP_I2C
> > +	help
> > +	  This is a Video4Linux2 driver for Analog Devices ADDI9036
> > +	  Time of Flight front-end.
> > +
> > +	  To compile this driver as a module, choose M here: the
> > +	  module will be called addi9036.
> > +
> >  config VIDEO_HI556
> >  	tristate "Hynix Hi-556 sensor support"
> >  	depends on I2C && VIDEO_V4L2
> > diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
> > index f0a77473979d..631a7c7612ca 100644
> > --- a/drivers/media/i2c/Makefile
> > +++ b/drivers/media/i2c/Makefile
> > @@ -26,6 +26,7 @@ obj-$(CONFIG_VIDEO_AK7375)  +=3D ak7375.o
> >  obj-$(CONFIG_VIDEO_DW9714)  +=3D dw9714.o
> >  obj-$(CONFIG_VIDEO_DW9768)  +=3D dw9768.o
> >  obj-$(CONFIG_VIDEO_DW9807_VCM)  +=3D dw9807-vcm.o
> > +obj-$(CONFIG_VIDEO_ADDI9036) +=3D addi9036.o
> >  obj-$(CONFIG_VIDEO_ADV7170) +=3D adv7170.o
> >  obj-$(CONFIG_VIDEO_ADV7175) +=3D adv7175.o
> >  obj-$(CONFIG_VIDEO_ADV7180) +=3D adv7180.o
> > diff --git a/drivers/media/i2c/addi9036.c b/drivers/media/i2c/addi9036.=
c
> > new file mode 100644
> > index 000000000000..e38e70afd23d
> > --- /dev/null
> > +++ b/drivers/media/i2c/addi9036.c
> > @@ -0,0 +1,754 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for the Analog Devices ADDI9036 ToF camera sensor.
> > + *
> > + * Copyright (C) 2019-2020 Analog Devices, All Rights Reserved.
> > + *
> > + */
> > +
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/firmware.h>
> > +#include <linux/i2c.h>
> > +#include <linux/module.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define FW_FILE_NAME	"adi/addi9036-fw.bin"
> > +#define ADDI_MAGIC	"ADDI9036"
> > +
> > +struct addi9036_mode_info {
> > +	u32 width;
> > +	u32 height;
> > +	u32 pixel_rate;
> > +	u32 link_freq_idx;
> > +};
> > +
> > +struct addi9036_mode_fw_block {
> > +	const struct reg_sequence *mode_regs;
> > +	ssize_t regs_count;
> > +};
> > +
> > +struct addi9036_fw_header {
> > +	unsigned char magic[8];
> > +	__le32 modes_nr;
> > +} __packed;
> > +
> > +struct addi9036_mode_block {
> > +	__le32 mode_id;
> > +	__le32 size_bytes;
> > +	__le16 data[];
> > +} __packed;
> > +
> > +struct addi9036 {
> > +	struct regmap *regmap;
> > +	struct device *dev;
> > +	struct v4l2_subdev sd;
> > +	struct media_pad pad;
> > +	struct v4l2_fwnode_endpoint ep;
> > +	struct v4l2_mbus_framefmt fmt;
> > +	struct v4l2_rect crop;
> > +
> > +	const struct addi9036_mode_info *current_mode;
> > +
> > +	struct v4l2_ctrl_handler ctrls;
> > +	struct v4l2_ctrl *pixel_rate;
> > +	struct v4l2_ctrl *link_freq;
> > +	/* custom controls */
> > +	struct v4l2_ctrl *set_operating_range;
> > +
> > +	/* lock to protect power state */
> > +	struct mutex power_lock;
> > +	int power_count;
> > +	bool streaming;
> > +
> > +	struct gpio_desc *rst_gpio;
> > +
> > +	/* firmware blocks for each operating mode */
> > +	struct addi9036_mode_fw_block *mode_fw_blocks;
> > +	u8 curr_operating_mode;
> > +
> > +	const struct firmware *fw;
> > +};
> > +
> > +static inline struct addi9036 *to_addi9036(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct addi9036, sd);
> > +}
> > +
> > +#define V4L2_CID_ADDI9036_OPERATING_MODE
> (V4L2_CID_USER_ADDI9036_BASE + 0)
> > +
> > +static const struct reg_sequence addi9036_powerup_setting[] =3D {
> > +	{ 0xc4c0, 0x001c },
> > +	{ 0xc4c3, 0x001c },
> > +	{ 0xc4d7, 0x0000 },
> > +	{ 0xc4d5, 0x0002 },
> > +	{ 0xc4da, 0x0001 },
> > +	{ 0xc4f0, 0x0000 },
> > +	{ 0xc427, 0x0003 },
> > +	{ 0xc427, 0x0001 },
> > +	{ 0xc427, 0x0000 },
> > +	{ 0xc426, 0x0030 },
> > +	{ 0xc426, 0x0010 },
> > +	{ 0xc426, 0x0000 },
> > +	{ 0xc423, 0x0080 },
> > +	{ 0xc431, 0x0080 },
> > +	{ 0x4001, 0x0007 },
> > +	{ 0x7c22, 0x0004 }
> > +};
> > +
> > +static const struct reg_sequence addi9036_powerdown_setting[] =3D {
> > +	{ 0xc022, 0x0001 },
> > +	{ 0x4001, 0x0006 },
> > +	{ 0x7c22, 0x0004 },
> > +	{ 0xc431, 0x0082 },
> > +	{ 0xc423, 0x0000 },
> > +	{ 0xc426, 0x0020 },
> > +	{ 0xc427, 0x0002 },
> > +	{ 0xc4c0, 0x003c },
> > +	{ 0xc4c3, 0x003c },
> > +	{ 0xc4d5, 0x0003 },
> > +	{ 0xc4da, 0x0000 },
> > +	{ 0xc4d7, 0x0001 },
> > +	{ 0xc4f0, 0x0001 }
> > +};
> > +
> > +static const s64 link_freq_tbl[] =3D {
> > +	110529000,
> > +	221184000,
>=20
> Are these a hardware property or should they come from DT? Either way, no=
t
> both of them could be available on all boards, which suggests DT.
>=20
Actually both of these are available on all boards. Depending on loaded fir=
mware
the camera can output only one stream of data (IR or DEPTH) and in that cas=
e the resolution
will be 640x480 at a lower lane-rate or can output both at the same time an=
d in that case=20
we have a total image of 640x960 and the lane-rate will also be double.
> > +};
> > +
> > +/* Elements of the structure must be ordered ascending by width & heig=
ht */
> > +static const struct addi9036_mode_info addi9036_mode_info_data[] =3D {
> > +	{
> > +		.width =3D 640,
> > +		.height =3D 480,
> > +		.pixel_rate =3D 36864000,
> > +		.link_freq_idx =3D 0 /* an index in link_freq_tbl[] */
> > +	},
> > +	{
> > +		.width =3D 640,
> > +		.height =3D 960,
> > +		.pixel_rate =3D 73728000,
> > +		.link_freq_idx =3D 1 /* an index in link_freq_tbl[] */
> > +	},
> > +};
> > +
> > +static bool addi9306_readable_register(struct device *dev, unsigned in=
t reg)
> > +{
> > +	if (((reg >=3D 0x4000) && (reg <=3D 0x6fff)) ||
> > +	    ((reg >=3D 0x7c00) && (reg <=3D 0x7fff)) ||
> > +	    ((reg >=3D 0xc000) && (reg <=3D 0xc200)) ||
> > +	    ((reg >=3D 0xc300) && (reg <=3D 0xc6bf)))
> > +		return true;
> > +	else
> > +		return false;
> > +}
> > +
> > +static bool addi9306_writeable_register(struct device *dev, unsigned i=
nt reg)
> > +{
> > +	if (((reg >=3D 0x4000) && (reg <=3D 0x6fff)) ||
> > +	    ((reg >=3D 0x7c00) && (reg <=3D 0x7fff)) ||
> > +	    ((reg >=3D 0xc000) && (reg <=3D 0xc113)) ||
> > +	    ((reg >=3D 0xc300) && (reg <=3D 0xc7ff)))
> > +		return true;
> > +	else
> > +		return false;
> > +}
> > +
> > +static const struct regmap_config addi9036_i2c_regmap_config =3D {
> > +	.reg_bits =3D 16,
> > +	.val_bits =3D 16,
> > +	.max_register =3D 0xc7ff,
> > +	.writeable_reg =3D addi9306_writeable_register,
> > +	.readable_reg =3D addi9306_readable_register,
> > +	.cache_type =3D REGCACHE_NONE,
> > +};
> > +
> > +static int addi9036_set_power_on(struct addi9036 *addi9036)
> > +{
> > +	int ret;
> > +
> > +	if (addi9036->rst_gpio)
> > +		gpiod_set_value_cansleep(addi9036->rst_gpio, 0);
> > +
> > +	ret =3D regmap_register_patch(addi9036->regmap,
> addi9036_powerup_setting,
> > +				    ARRAY_SIZE(addi9036_powerup_setting));
> > +	if (ret)
> > +		dev_err(addi9036->dev, "Could not set power up registers\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static int addi9036_set_power_off(struct addi9036 *addi9036)
> > +{
> > +	int ret;
> > +
> > +	ret =3D regmap_register_patch(addi9036->regmap,
> > +				    addi9036_powerdown_setting,
> > +				    ARRAY_SIZE(addi9036_powerdown_setting));
> > +	if (ret)
> > +		dev_err(addi9036->dev, "could not set power down
> registers\n");
> > +
> > +	if (addi9036->rst_gpio)
> > +		gpiod_set_value_cansleep(addi9036->rst_gpio, 1);
> > +
> > +	return ret;
> > +}
> > +
> > +static int addi9036_s_power(struct v4l2_subdev *sd, int on)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	int ret =3D 0;
> > +
> > +	dev_dbg(addi9036->dev, "s_power: %d\n", on);
> > +
> > +	mutex_lock(&addi9036->power_lock);
> > +
> > +	/* If the power count is modified from 0 to !=3D 0 or from !=3D 0 to =
0,
> > +	 * update the power state.
> > +	 */
> > +	if (addi9036->power_count =3D=3D !on) {
> > +		if (on)
> > +			ret =3D addi9036_set_power_on(addi9036);
> > +		else
> > +			ret =3D addi9036_set_power_off(addi9036);
> > +	}
> > +
> > +	if (!ret) {
> > +		/* Update the power count. */
> > +		addi9036->power_count +=3D on ? 1 : -1;
> > +		WARN(addi9036->power_count < 0, "Unbalanced power
> count\n");
> > +		WARN(addi9036->power_count > 1, "Duplicated s_power
> call\n");
> > +	}
> > +
> > +	mutex_unlock(&addi9036->power_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +static int addi9036_g_register(struct v4l2_subdev *sd,
> > +			       struct v4l2_dbg_register *reg)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	unsigned int read_val;
> > +	int ret;
> > +
> > +	reg->size =3D 2;
> > +	ret =3D regmap_read(addi9036->regmap, reg->reg, &read_val);
> > +	reg->val =3D read_val;
> > +
> > +	return ret;
> > +}
> > +
> > +static int addi9036_s_register(struct v4l2_subdev *sd,
> > +			       const struct v4l2_dbg_register *reg)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +
> > +	return regmap_write(addi9036->regmap, reg->reg, reg->val);
> > +}
> > +#endif
> > +
> > +static int addi9036_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct addi9036 *addi9036 =3D container_of(ctrl->handler,
> > +						 struct addi9036, ctrls);
> > +	int ret =3D 0;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_ADDI9036_OPERATING_MODE:
> > +		addi9036->curr_operating_mode =3D ctrl->val;
> > +		break;
> > +	case V4L2_CID_PIXEL_RATE:
> > +	case V4L2_CID_LINK_FREQ:
> > +		break;
> > +	default:
> > +		dev_err(addi9036->dev, "%s > Unhandled: %x  param=3D%x\n",
> > +			__func__, ctrl->id, ctrl->val);
> > +		ret =3D -EINVAL;
> > +		break;
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_ctrl_ops addi9036_ctrl_ops =3D {
> > +	.s_ctrl =3D addi9036_s_ctrl,
> > +};
> > +
> > +static const struct v4l2_ctrl_config addi9036_ctrl_operating_mode =3D =
{
> > +	.ops		=3D &addi9036_ctrl_ops,
> > +	.id		=3D V4L2_CID_ADDI9036_OPERATING_MODE,
> > +	.name		=3D "Operating Mode",
> > +	.type		=3D V4L2_CTRL_TYPE_INTEGER,
> > +	.def		=3D 0,
> > +	.min		=3D 0,
> > +	.max		=3D 1,
> > +	.step		=3D 1,
> > +};
> > +
> > +static int addi9036_enum_mbus_code(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg,
> > +				   struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->index > 0)
> > +		return -EINVAL;
> > +
> > +	code->code =3D MEDIA_BUS_FMT_SBGGR12_1X12;
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_enum_frame_size(struct v4l2_subdev *subdev,
> > +				    struct v4l2_subdev_pad_config *cfg,
> > +				    struct v4l2_subdev_frame_size_enum *fse)
> > +{
> > +	if (fse->code !=3D MEDIA_BUS_FMT_SBGGR12_1X12)
> > +		return -EINVAL;
> > +
> > +	if (fse->index >=3D ARRAY_SIZE(addi9036_mode_info_data))
> > +		return -EINVAL;
> > +
> > +	fse->min_width =3D addi9036_mode_info_data[fse->index].width;
> > +	fse->max_width =3D addi9036_mode_info_data[fse->index].width;
> > +	fse->min_height =3D addi9036_mode_info_data[fse->index].height;
> > +	fse->max_height =3D addi9036_mode_info_data[fse->index].height;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +addi9036_get_pad_format(struct addi9036 *addi9036,
> > +			struct v4l2_subdev_pad_config *cfg, unsigned int pad,
> > +			enum v4l2_subdev_format_whence which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &addi9036->fmt;
> > +	default:
> > +		return NULL;
>=20
> I'd suggest never return NULL here. Maybe issue a warning and return eith=
er
> of the valid ones? Or add NULL checks elsewhere.
ACK
>=20
> > +	}
> > +}
> > +
> > +static int addi9036_get_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_pad_config *cfg,
> > +			       struct v4l2_subdev_format *format)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	struct v4l2_mbus_framefmt *pad_format;
> > +
> > +	pad_format =3D addi9036_get_pad_format(addi9036, cfg, format->pad,
> > +					     format->which);
> > +
> > +	if (!pad_format)
> > +		return -EINVAL;
> > +
> > +	format->format =3D *pad_format;
> > +
> > +	return 0;
> > +}
> > +
> > +static struct v4l2_rect *
> > +addi9036_get_pad_crop(struct addi9036 *addi9036,
> > +		      struct v4l2_subdev_pad_config *cfg,
> > +		      unsigned int pad, enum v4l2_subdev_format_whence which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_crop(&addi9036->sd, cfg, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &addi9036->crop;
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static int addi9036_set_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_pad_config *cfg,
> > +			       struct v4l2_subdev_format *format)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	struct v4l2_mbus_framefmt *framefmt;
> > +	struct v4l2_rect *crop;
> > +	const struct addi9036_mode_info *new_mode;
> > +	int ret;
> > +
> > +	dev_dbg(addi9036->dev, "set_fmt: %x %dx%d %d\n",
> > +		format->format.code, format->format.width,
> > +		format->format.height, format->which);
> > +
> > +	crop =3D addi9036_get_pad_crop(addi9036, cfg, format->pad,
> > +				     format->which);
> > +
> > +	if (!crop)
> > +		return -EINVAL;
> > +
> > +	new_mode =3D v4l2_find_nearest_size(addi9036_mode_info_data,
> > +
> ARRAY_SIZE(addi9036_mode_info_data),
> > +					  width, height, format->format.width,
> > +					  format->format.height);
> > +	crop->width =3D new_mode->width;
> > +	crop->height =3D new_mode->height;
> > +
> > +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> > +		ret =3D v4l2_ctrl_s_ctrl_int64(addi9036->pixel_rate,
> > +					     new_mode->pixel_rate);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		ret =3D v4l2_ctrl_s_ctrl(addi9036->link_freq,
> > +				       new_mode->link_freq_idx);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		addi9036->current_mode =3D new_mode;
> > +	}
> > +
> > +	framefmt =3D addi9036_get_pad_format(addi9036, cfg, format->pad,
> > +					   format->which);
>=20
> I believe you'll need to serialise access to framefmt.
ACK
>=20
> > +	framefmt->width =3D crop->width;
> > +	framefmt->height =3D crop->height;
> > +	framefmt->code =3D MEDIA_BUS_FMT_SBGGR12_1X12;
> > +	framefmt->field =3D V4L2_FIELD_NONE;
> > +	framefmt->colorspace =3D V4L2_COLORSPACE_SRGB;
> > +
> > +	format->format =3D *framefmt;
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_entity_init_cfg(struct v4l2_subdev *subdev,
> > +				    struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct v4l2_subdev_format fmt =3D { 0 };
> > +
> > +	fmt.which =3D cfg ? V4L2_SUBDEV_FORMAT_TRY :
> V4L2_SUBDEV_FORMAT_ACTIVE;
> > +	fmt.format.width =3D addi9036_mode_info_data[1].width;
> > +	fmt.format.height =3D addi9036_mode_info_data[1].height;
> > +
> > +	addi9036_set_format(subdev, cfg, &fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_get_selection(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_pad_config *cfg,
> > +				  struct v4l2_subdev_selection *sel)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +
> > +	if (sel->target !=3D V4L2_SEL_TGT_CROP)
> > +		return -EINVAL;
> > +
> > +	sel->r =3D *addi9036_get_pad_crop(addi9036, cfg, sel->pad, sel->which=
);
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_s_stream(struct v4l2_subdev *subdev, int enable)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(subdev);
> > +	uint8_t mode =3D addi9036->curr_operating_mode;
> > +	int ret =3D 0;
> > +
> > +	dev_dbg(addi9036->dev, "s_stream: %d\n", enable);
> > +
> > +	if (addi9036->streaming =3D=3D enable)
> > +		return 0;
> > +
> > +	if (enable) {
> > +		if (addi9036->mode_fw_blocks[mode].mode_regs =3D=3D NULL) {
> > +			dev_err(addi9036->dev, "Selected mode has no data\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		dev_dbg(addi9036->dev, "Applying mode: %u\n", mode);
> > +		ret =3D regmap_multi_reg_write(addi9036->regmap,
> > +				addi9036->mode_fw_blocks[mode].mode_regs,
> > +				addi9036->mode_fw_blocks[mode].regs_count);
> > +
> > +		dev_dbg(addi9036->dev, "Writen %lu registers\n",
> > +			addi9036->mode_fw_blocks[mode].regs_count);
> > +	}
> > +
> > +	addi9036->streaming =3D enable;
> > +	return ret;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops addi9036_core_ops =3D {
> > +	.s_power	=3D addi9036_s_power,
>=20
> Please add support for runtime PM instead.
ACK
>=20
> > +#ifdef CONFIG_VIDEO_ADV_DEBUG
> > +	.g_register	=3D addi9036_g_register,
> > +	.s_register	=3D addi9036_s_register,
> > +#endif
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops addi9036_video_ops =3D {
> > +	.s_stream	=3D addi9036_s_stream,
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops addi9036_subdev_pad_ops =3D {
> > +	.init_cfg		=3D addi9036_entity_init_cfg,
> > +	.enum_mbus_code		=3D addi9036_enum_mbus_code,
> > +	.enum_frame_size	=3D addi9036_enum_frame_size,
> > +	.get_fmt		=3D addi9036_get_format,
> > +	.set_fmt		=3D addi9036_set_format,
> > +	.get_selection		=3D addi9036_get_selection,
> > +};
> > +
> > +static const struct v4l2_subdev_ops addi9036_subdev_ops =3D {
> > +	.core	=3D &addi9036_core_ops,
> > +	.video	=3D &addi9036_video_ops,
> > +	.pad	=3D &addi9036_subdev_pad_ops,
> > +};
> > +
> > +static int addi9036_g_modes_from_firmware(struct v4l2_subdev *sd)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	const struct firmware *fw =3D addi9036->fw;
> > +	const struct addi9036_fw_header *fw_head;
> > +	const struct addi9036_mode_block *mode_block;
> > +	unsigned int reg_nr, chunk_len, pos, modes_nr, i, j, k;
> > +	struct reg_sequence *reg_seq;
> > +
> > +	/*
> > +	 * Reject too small or unreasonable large files.
> > +	 */
> > +
> > +	if (fw->size < sizeof(struct addi9036_fw_header) ||
> > +	    fw->size >=3D 0x4000000) {
> > +		dev_err(addi9036->dev, "FW loading failed: Invalid size\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	fw_head =3D (struct addi9036_fw_header *)fw->data;
> > +
> > +	if (memcmp(fw_head->magic, ADDI_MAGIC, ARRAY_SIZE(fw_head-
> >magic))) {
> > +		dev_err(addi9036->dev, "FW loading failed: Invalid magic\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	modes_nr =3D le32_to_cpu(fw_head->modes_nr);
> > +
> > +	if (modes_nr =3D=3D 0) {
> > +		dev_err(addi9036->dev, "FW should contain at least 1 mode.\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	__v4l2_ctrl_modify_range(addi9036->set_operating_range,
> > +				 addi9036->set_operating_range->minimum,
> > +				 modes_nr - 1, 1, 0);
> > +
> > +	addi9036->mode_fw_blocks =3D devm_kzalloc(addi9036->dev,
> > +			      sizeof(struct addi9036_mode_fw_block) * modes_nr,
>=20
> devm_kcalloc, please.
ACK
>=20
> > +			      GFP_KERNEL);
> > +	if (!addi9036->mode_fw_blocks)
> > +		return -ENOMEM;
> > +
> > +	pos =3D sizeof(struct addi9036_fw_header);
> > +
> > +	for (i =3D 0; i < modes_nr; i++) {
> > +		mode_block =3D (struct addi9036_mode_block *)(fw->data + pos);
>=20
> I think you need more validation here. For instance, make sure the firmwa=
re
> binary is at least as big as the offset you're accessing.
ACK
>=20
> > +
> > +		chunk_len =3D le32_to_cpu(mode_block->size_bytes);
> > +		reg_nr =3D chunk_len / sizeof(uint16_t) / 2;
> > +
> > +		reg_seq =3D devm_kzalloc(addi9036->dev,
> > +				       sizeof(struct reg_sequence) * reg_nr,
> > +				       GFP_KERNEL);
> > +		if (!reg_seq)
> > +			return -ENOMEM;
> > +
> > +		k =3D 0;
> > +		for (j =3D 0; j < reg_nr * 2; j +=3D 2) {
>=20
> j =3D 0, k =3D 0
ACK
>=20
> > +			reg_seq[k].reg =3D le16_to_cpu(mode_block->data[j]);
> > +			reg_seq[k].def =3D le16_to_cpu(mode_block->data[j + 1]);
> > +			k++;
> > +		}
> > +
> > +		addi9036->mode_fw_blocks[i].mode_regs =3D reg_seq;
> > +		addi9036->mode_fw_blocks[i].regs_count =3D reg_nr;
> > +
> > +		pos +=3D chunk_len + sizeof(struct addi9036_mode_block);
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int addi9036_mode_firmware_load(struct v4l2_subdev *sd)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	int ret;
> > +
> > +	ret =3D request_firmware(&addi9036->fw, FW_FILE_NAME, addi9036-
> >dev);
> > +	if (ret < 0) {
> > +		dev_err(addi9036->dev, "FW request failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret =3D addi9036_g_modes_from_firmware(sd);
> > +
> > +	release_firmware(addi9036->fw);
> > +	if (ret < 0) {
> > +		dev_err(addi9036->dev, "FW parsing failed\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct fwnode_handle *endpoint;
> > +	struct addi9036 *addi9036;
> > +	int ret;
> > +
> > +	dev_dbg(dev, "%s: i2c addr =3D 0x%x\n", __func__, client->addr);
> > +
> > +	addi9036 =3D devm_kzalloc(dev, sizeof(struct addi9036), GFP_KERNEL);
> > +	if (!addi9036)
> > +		return -ENOMEM;
> > +
> > +	addi9036->dev =3D dev;
> > +
> > +	addi9036->regmap =3D devm_regmap_init_i2c(client,
> > +						&addi9036_i2c_regmap_config);
> > +	if (IS_ERR(addi9036->regmap)) {
> > +		dev_err(dev, "Error initializing i2c regmap\n");
> > +		return PTR_ERR(addi9036->regmap);
> > +	}
> > +
> > +	mutex_init(&addi9036->power_lock);
> > +
> > +	endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev),
> NULL);
>=20
> Could you use fwnode_graph_get_endpoint_by_id()?
ACK
>=20
> > +	if (!endpoint) {
> > +		dev_err(dev, "endpoint node not found\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D v4l2_fwnode_endpoint_parse(endpoint, &addi9036->ep);
> > +	if (ret < 0) {
> > +		dev_err(dev, "parsing endpoint node failed\n");
> > +		return ret;
> > +	}
> > +	fwnode_handle_put(endpoint);
> > +
> > +	if (addi9036->ep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
>=20
> If you expect D-PHY, please specify the bus type before calling
> v4l2_fwnode_endpoint_parse().
ACK
>=20
> > +		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	addi9036->rst_gpio =3D gpiod_get_optional(dev, "reset",
> GPIOD_OUT_HIGH);
> > +	if (IS_ERR(addi9036->rst_gpio))
> > +		dev_info(dev, "Unable to get \"reset\" gpio\n");
> > +
> > +	v4l2_ctrl_handler_init(&addi9036->ctrls, 3);
> > +
> > +	addi9036->pixel_rate =3D v4l2_ctrl_new_std(&addi9036->ctrls,
> > +						  &addi9036_ctrl_ops,
> > +						  V4L2_CID_PIXEL_RATE,
> > +						  1, INT_MAX, 1, 1);
> > +	addi9036->link_freq =3D v4l2_ctrl_new_int_menu(&addi9036->ctrls,
> > +						     &addi9036_ctrl_ops,
> > +						     V4L2_CID_LINK_FREQ,
> > +						     ARRAY_SIZE(
> > +							     link_freq_tbl) - 1,
> > +						     0, link_freq_tbl);
> > +	if (addi9036->link_freq)
> > +		addi9036->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	addi9036->set_operating_range =3D v4l2_ctrl_new_custom(&addi9036-
> >ctrls,
> > +						&addi9036_ctrl_operating_mode,
> > +						NULL);
> > +
> > +	ret =3D addi9036->ctrls.error;
> > +	if (ret) {
> > +		dev_err(dev, "%s: control initialization error %d\n",
> > +			__func__, ret);
> > +		goto free_ctrl;
> > +	}
> > +	addi9036->sd.ctrl_handler =3D &addi9036->ctrls;
> > +
> > +	v4l2_i2c_subdev_init(&addi9036->sd, client, &addi9036_subdev_ops);
> > +	addi9036->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	addi9036->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +	addi9036->sd.dev =3D &client->dev;
> > +	addi9036->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	ret =3D media_entity_pads_init(&addi9036->sd.entity, 1, &addi9036->pa=
d);
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not register media entity\n");
> > +		goto free_ctrl;
> > +	}
> > +
> > +	ret =3D addi9036_mode_firmware_load(&addi9036->sd);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	addi9036_entity_init_cfg(&addi9036->sd, NULL);
> > +
> > +	ret =3D v4l2_async_register_subdev(&addi9036->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not register v4l2 device\n");
> > +		goto free_entity;
> > +	}
> > +
> > +	return 0;
> > +
> > +free_entity:
> > +	media_entity_cleanup(&addi9036->sd.entity);
> > +free_ctrl:
> > +	v4l2_ctrl_handler_free(&addi9036->ctrls);
> > +	mutex_destroy(&addi9036->power_lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static int addi9036_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +
> > +	v4l2_async_unregister_subdev(&addi9036->sd);
> > +	media_entity_cleanup(&addi9036->sd.entity);
> > +	if (addi9036->rst_gpio)
> > +		gpiod_put(addi9036->rst_gpio);
> > +	v4l2_ctrl_handler_free(&addi9036->ctrls);
> > +	mutex_destroy(&addi9036->power_lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct i2c_device_id addi9036_id[] =3D {
>=20
> Do you really need the I=B2C device table? Please remove if not.
Not really needed so will be removed in V3
>=20
> > +	{ "addi9036", 0 },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, addi9036_id);
> > +
> > +static const struct of_device_id addi9036_of_match[] =3D {
> > +	{ .compatible =3D "adi,addi9036" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, addi9036_of_match);
> > +
> > +static struct i2c_driver addi9036_i2c_driver =3D {
> > +	.driver			=3D {
> > +		.of_match_table =3D addi9036_of_match,
> > +		.name		=3D "addi9036",
> > +	},
> > +	.probe_new		=3D addi9036_probe,
> > +	.remove			=3D addi9036_remove,
> > +	.id_table		=3D addi9036_id,
> > +};
> > +
> > +module_i2c_driver(addi9036_i2c_driver);
> > +
> > +MODULE_DESCRIPTION("Analog Devices ADDI9036 Camera Driver");
> > +MODULE_AUTHOR("Bogdan Togorean");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-
> controls.h
> > index 62271418c1be..f88b56479bc1 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -198,6 +198,12 @@ enum v4l2_colorfx {
> >   */
> >  #define V4L2_CID_USER_ATMEL_ISC_BASE		(V4L2_CID_USER_BASE +
> 0x10c0)
> >
> > +/*
> > + * The base for the addi9036 driver controls.
> > + * We reserve 16 controls for this driver.
> > + */
> > +#define V4L2_CID_USER_ADDI9036_BASE		(V4L2_CID_USER_BASE +
> 0x10e0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
>=20
> --
> Sakari Ailus

Regards, Bogdan
