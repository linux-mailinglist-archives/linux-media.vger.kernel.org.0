Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB6E426D7F7
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgIQJpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:45:38 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:54396 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726180AbgIQJpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:45:33 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08H6xSZI016616;
        Thu, 17 Sep 2020 03:10:00 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-00128a01.pphosted.com with ESMTP id 33k5p65k1n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Sep 2020 03:09:59 -0400
Received: from m0167088.ppops.net (m0167088.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08H79xtd030328;
        Thu, 17 Sep 2020 03:09:59 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
        by mx0a-00128a01.pphosted.com with ESMTP id 33k5p65k1k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Sep 2020 03:09:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fp4U0CeL5wUhwEQc17ZbRb3a1ulVSMo+SheBX4ZcrsrdPozFXTikelWHbRBNRUGuMlOj+XCK/VwDCvtOZyQvOllz4BxnNwLDWReOAd2OfPPLkxaGDjjBiOzfQcp96gnEJyuwkT+MkCqrfuyth+aW4AKv1KTIWnz72JkUKKnRddMqw7gmPLb0jp00/yL8TAoexsaQsQY4RxgFlzF/YNAGJ7u+48h3Kl9mgPgSogjvjAcLl40HBtyu9NljD94Vy5/yrjrDqyckcbpeZOcsPwVnm6jRi8hWotfT07grsXdtv6e03RNk/l6XztkQ79OWpi6SDRzfRhMfGbrkoMFgdDENcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmoFQLiXiYxrO+tamWDp4ij+XyLkhLK61C7CD9UlVkA=;
 b=myfz0vNvf6St2CnlKn4pL1/JsJ5iREZdisxRoZabeD1RP0Rcv5pm8zq7X14Dc/QfI6CbX0yNIxW41MWsf1MccqGI0mEUFuvffcZX6CPmyqgdzOeoBT93ozIxyOGQIeimexqlL44oW06dE0oUeG42HcqBq/9zKkFWbA5MFhMLrfYUVs9Uhk5UAtPSsZIzS7P44hGSuXkGlR5F2R21Ox95VhQavYD2mIvYSLVoKRZFJnTWIib8yqTVNaqpu6iuJpnSW0yX8VNdY344Y5XmrxEOxIwGx+kiL/ZjWxuyYpiFPRYmOPesDzeeZEOStTtnxZJBFG3bKSX240GWbM+HS0Aasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmoFQLiXiYxrO+tamWDp4ij+XyLkhLK61C7CD9UlVkA=;
 b=RKEUt/OuQTc28yKMJyWlPNjnMs6v///e12rPJxolLP9rNUiHb4WxgtW7CtljZk8Sw0TSC2AxOE8k8RSWj+Iqce98nhB26yIFcK3/fSTabuLqpH2Lxt+uB8FQoWk/30rBQJ5bL9frBQumpqNSg8GvRNH7LoflUqzkRBYFMcsxjGk=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14)
 by DM5PR03MB2681.namprd03.prod.outlook.com (2603:10b6:3:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Thu, 17 Sep
 2020 07:09:57 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd%4]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 07:09:57 +0000
Content-Type: multipart/mixed;
        boundary="_000_DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0DM6PR03MB5274namp_"
From:   "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Thread-Topic: [PATCH 1/2] media: i2c: Add driver for the Analog Devices
 ADDI9036 ToF front-end
Thread-Index: AQHWh3XvzR+FuqmqSEu3z8jI/XRrEqlh7/6AgAqDmlA=
Date:   Thu, 17 Sep 2020 07:09:57 +0000
Message-ID: <DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0@DM6PR03MB5274.namprd03.prod.outlook.com>
References: <20200910162426.55306-1-bogdan.togorean@analog.com>
 <ff1762fb-749a-a0a3-e90d-dbbc8c388893@linux.intel.com>
In-Reply-To: <ff1762fb-749a-a0a3-e90d-dbbc8c388893@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0@DM6PR03MB5274.namprd03.prod.outlook.com>
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYnRvZ29yZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1jZDk3Zjg0Ni1mOGI0LTExZWEtODZhNy0xODFk?=
 =?us-ascii?Q?ZWE1NDZlZDJcYW1lLXRlc3RcY2Q5N2Y4NDgtZjhiNC0xMWVhLTg2YTctMTgx?=
 =?us-ascii?Q?ZGVhNTQ2ZWQyYm9keS50eHQiIHN6PSIyNTY4MyIgdD0iMTMyNDQ4MDAyMDI1?=
 =?us-ascii?Q?MzkzMzIwIiBoPSJTTXZMV3ppcktueVpMOGQ3RzNoQWRoakF0bkU9IiBpZD0i?=
 =?us-ascii?Q?IiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFFb0NB?=
 =?us-ascii?Q?QUNvRE8rUHdZeldBWWM2NFZDRURFMlloenJoVUlRTVRaZ0RBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBUUFCQUFBQVkvR3FKd0FBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FB?=
 =?us-ascii?Q?YVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQnpB?=
 =?us-ascii?Q?RjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFk?=
 =?us-ascii?Q?UUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFE?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNn?=
 =?us-ascii?Q?QnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9t?=
 =?us-ascii?Q?ZXRhPg=3D=3D?=
x-dg-rorf: true
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c2160e5c-9d9c-4f17-e459-08d85ad8af53
x-ms-traffictypediagnostic: DM5PR03MB2681:
x-microsoft-antispam-prvs: <DM5PR03MB2681617631235072F9C37E5C9B3E0@DM5PR03MB2681.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:230;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hcxrONGxcUruqAaGmhfVJFMaHat3fkLhccO31YYYN+LvdMxM0SFvQUKYd0PCxV2ps1lyXRA6l/K/E4Ugqv4TBNT+/ONMJfVMAKCK0jFA9AiL46FgR0QFu0uW02IQQGK6c8T4B8eOJ0nKMyoBAgOoYrYpJ7L4sJBslDgntG337fntgZHESc7u3gOmsdl1XhYZrF6QggrgOe3ratfcgo2Zc/74yfGZ/MIGSekUpsn00Erntop4RPLPEtOVwxt/IeuhvGWNs4XSy4dxCMdR4ZLWcgmKpKATaFcmJzV/MB7iyzVSujGL6357B9xmsfUsK1h6LO3Jf/XGJ8i9MEWItLD4M9UY6SAynEouphs6Tz9uIX4Fh9N/tYJpZ5m2vCPnfRvl/UU7DskKnUuxNQVRrEAoc6eMYJMonB9Gy0xwgK5ESFXln+qao1v6u9ZsW7BCpBTtOOi9SkUyyPSDbTKnRMagwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(110136005)(6506007)(66946007)(64756008)(71200400001)(66556008)(54906003)(66476007)(478600001)(55016002)(316002)(30864003)(2906002)(7416002)(86362001)(9686003)(76116006)(5660300002)(53546011)(7696005)(4326008)(33656002)(8936002)(8676002)(83380400001)(186003)(26005)(66446008)(52536014)(21314003)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jRBhl3WWs9VKPgA7vsvwuOB4YRZlcFHAfemV5KNWWMGiyGpMTRyl39Po4lgSnmgopnaRvq74BpVrJ+szN2wlV+OAQCiwbe7XIsjfwn4ZNt1PuAk6dTar6BnwMCIYKdjM0Y8YXEE/+vrH6Y/YrGaEvQiNi/L20K9inL6pOGePHGVX+LSlLniLOPHH/Z3gfltOT32nU6JymJhMXJoohmv9RsvmwtdDAVSkLSuUKmLWHv7A6IUpayjJicWQGdtRrt2YEMKX5jiINOmfzTRLDroXXSAh4jQs4p4tt4wjIF0AzZVqUMOo5dAUo49C+ujUvrQqdCQzUxFkC0XVWOoKoyj7zdhMrGdtN7n5Zf9tbYVX7Nmr/wRy7TagPTGVJ4ByLXk6BbTmr6fzw2IHvq9gwGKfY9Oy/n9+XpE+0NfeDTkx34AIJvAv5RwfzhAvN2qZAURhF9dah8FSP1XyBgzY/X03ABcl/0g/jk5L1QV79A7Mlsa72Y5CPkUuQEs2ayMAxeJ75OcLITP8a+SIA/Zmqu1KnoUdOFCmrSBHzkdgF6DjdWXAMCn3frrycBxR4o1lDe5wvzBQpmvGDLkT1jpUkMzNAVoENpkdBpxrZQiH9Xi1oRqwPdhtPoXWM4KevKLvsKpqkSgC2x/IgsS4eVc3ulwmFg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2160e5c-9d9c-4f17-e459-08d85ad8af53
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 07:09:57.3334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcIjQKIJZ341Lulxk9iMAeqdTt5tfNp40q44H3vbAHRPnrwdJIEKSxuTpEDSOG3d8bw4swESO8Xa8uyKEXQhAP450YeKoQMyP2dcPABSLFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2681
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-17_03:2020-09-16,2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170051
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--_000_DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0DM6PR03MB5274namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thank you Bingbu for review,
I'll implement your remarks in V2 that I'm working on now

> Bogdan, thanks for your patch.
>=20
> On 9/11/20 12:24 AM, Bogdan Togorean wrote:
> > The ADDI9036 is a complete, 45 MHz, front-end solution for charge
> > coupled device (CCD) time of flight (TOF) imaging applications.
> >
> > It has 2-lane MIPI CSI-2 RAW12 data output and i2c control interface.
> >
> > The programming of calibration and firmware is performed by userspace
> > SDK through CID_USER class IOCTLs.
> >
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > ---
> >  MAINTAINERS                        |  10 +
> >  drivers/media/i2c/Kconfig          |  14 +
> >  drivers/media/i2c/Makefile         |   1 +
> >  drivers/media/i2c/addi9036.c       | 673 +++++++++++++++++++++++++++++
> >  include/uapi/linux/v4l2-controls.h |   6 +
> >  5 files changed, 704 insertions(+)
> >  create mode 100644 drivers/media/i2c/addi9036.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index b5cfab015bd6..fb03ad9ca920 100644
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
> > index 000000000000..76c3444058dc
> > --- /dev/null
> > +++ b/drivers/media/i2c/addi9036.c
> > @@ -0,0 +1,673 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for the Analog Devices ADDI9036 ToF front-end.
> > + *
> > + * Copyright (C) 2019-2020 Analog Devices, All Rights Reserved.
> > + *
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/of_graph.h>
> > +#include <linux/regmap.h>
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +#include <linux/version.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +struct addi9036_mode_info {
> > +	u32 width;
> > +	u32 height;
> > +	u32 pixel_rate;
> > +	u32 link_freq_idx;
> > +};
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
> > +
> > +	/* lock to protect power state */
> > +	struct mutex power_lock;
> > +	int power_count;
> > +
> > +	struct gpio_desc *rst_gpio;
> > +
> > +	/* controls */
> > +	struct v4l2_ctrl *set_chip_config;
> > +	struct v4l2_ctrl *reg_read;
> > +};
> > +
> > +static inline struct addi9036 *to_addi9036(struct v4l2_subdev *sd)
> > +{
> > +	return container_of(sd, struct addi9036, sd);
> > +}
> > +
> > +#define V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY
> (V4L2_CID_USER_ADDI9036_BASE + 0)
> > +#define V4L2_CID_AD_DEV_REG_READ_QUERY
> (V4L2_CID_USER_ADDI9036_BASE + 1)
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
> > +};
> Menu makes more sense than table, IMO.
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
> > +	if (((reg >=3D 0x4000) && (reg <=3D 0x6FFF)) ||
> > +	    ((reg >=3D 0x7C00) && (reg <=3D 0x7FFF)) ||
> > +	    ((reg >=3D 0xC000) && (reg <=3D 0xC200)) ||
> > +	    ((reg >=3D 0xC300) && (reg <=3D 0xC6BF)))
> > +		return true;
> > +	else
> > +		return false;
> > +}
> > +
> > +static bool addi9306_writeable_register(struct device *dev, unsigned i=
nt reg)
> > +{
> > +	if (((reg >=3D 0x4000) && (reg <=3D 0x6FFF)) ||
> > +	    ((reg >=3D 0x7C00) && (reg <=3D 0x7FFF)) ||
> > +	    ((reg >=3D 0xC000) && (reg <=3D 0xC113)) ||
> > +	    ((reg >=3D 0xC300) && (reg <=3D 0xC7FF)))
> > +		return true;
> > +	else
> > +		return false;
> > +}
> Unnecessary parentheses around 'xxx >=3D 0xxxxx'. So how about
> (...&&...||..) ? true : false, and the first 'dev' parameter is unused an=
d could
> be removed.
>=20
> > +
> > +static const struct regmap_config addi9036_i2c_regmap_config =3D {
> > +	.reg_bits =3D 16,
> > +	.val_bits =3D 16,
> > +
> unnecessary blank line here?
>=20
> > +	.max_register =3D 0xC7FF,
> lower case.
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
>=20
> Could we merge these 2 wrapper into one? it could reduce some code
> duplication
> and looks succinct.
> > +
> > +static int addi9036_s_power(struct v4l2_subdev *sd, int on)
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&addi9036->power_lock);
> > +
> > +	dev_dbg(addi9036->dev, "s_power: %d\n", on);
>=20
> This line can be out of protection.
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
> If you use single one power function, one line here is enough.
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
> > +static int addi9036_set_chip_config(struct addi9036 *addi9036,
> > +				    struct v4l2_ctrl *ctrl)
> > +{
> > +	int index;
> > +	unsigned short *reg, *val;
> > +
> > +	reg =3D (unsigned short *)(ctrl->p_new.p_u16);
> > +	val =3D (unsigned short *)(ctrl->p_new.p_u16 + 1);
> > +
> > +	for (index =3D 0; index < ctrl->elems; index +=3D 2) {
> > +		regmap_write(addi9036->regmap, *reg, *val);
> > +		reg +=3D 2;
> > +		val +=3D 2;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +	struct addi9036 *addi9036 =3D container_of(ctrl->handler,
> > +						 struct addi9036, ctrls);
> > +	int ret =3D 0;
> > +	unsigned int val;
> > +
> > +	switch (ctrl->id) {
> > +	case V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY:
> > +		ret =3D addi9036_set_chip_config(addi9036, ctrl);
> > +		break;
> > +	case V4L2_CID_AD_DEV_REG_READ_QUERY:
> > +		ret =3D regmap_read(addi9036->regmap, *(u16 *)(ctrl-
> >p_new.p_u16),
> > +				  &val);
> > +		if (ret)
> > +			dev_warn(addi9036->dev,
> > +				 "could not read from register\n");
> > +		else
> > +			*(u16 *)(ctrl->p_new.p_u16) =3D val;
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
> > +static const struct v4l2_ctrl_config addi9036_ctrl_chip_config =3D {
> > +	.ops		=3D &addi9036_ctrl_ops,
> > +	.id		=3D V4L2_CID_AD_DEV_SET_CHIP_CONFIG_QUERY,
> > +	.name		=3D "chip_config",
> > +	.type		=3D V4L2_CTRL_TYPE_U16,
> > +	.def		=3D 0xFF,
> > +	.min		=3D 0x00,
> > +	.max		=3D 0xFFFF,
> > +	.step		=3D 1,
> > +	.dims		=3D { 2048 },
> > +	.elem_size	=3D 2
> > +};
> > +
> > +static const struct v4l2_ctrl_config addi9036_ctrl_reg_read =3D {
> > +	.ops	=3D &addi9036_ctrl_ops,
> > +	.id	=3D V4L2_CID_AD_DEV_REG_READ_QUERY,
> > +	.name	=3D "reg_read",
> > +	.type	=3D V4L2_CTRL_TYPE_U16,
> > +	.def	=3D 0,
> > +	.min	=3D 0x00,
> > +	.max	=3D 0xFFFF,
> > +	.step	=3D 1
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
> > +			struct v4l2_subdev_pad_config *cfg,
> > +			unsigned int pad,
> > +			enum v4l2_subdev_format_whence which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&addi9036->sd, cfg, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &addi9036->fmt;
> > +	default:
> > +		return NULL;
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
> > +static const struct addi9036_mode_info *
> > +addi9036_find_nearest_mode(unsigned int width, unsigned int height)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D ARRAY_SIZE(addi9036_mode_info_data) - 1; i > 0; i--) {
> > +		if (addi9036_mode_info_data[i].width <=3D width &&
> > +		    addi9036_mode_info_data[i].height <=3D height)
> > +			break;
> > +	}
> > +
> > +	return &addi9036_mode_info_data[i];
> > +}
> Could v4l2_find_nearest_size() cover this?
>=20
> > +
> > +static int addi9036_set_format(struct v4l2_subdev *sd,
> > +			       struct v4l2_subdev_pad_config *cfg,
> > +			       struct v4l2_subdev_format *format)
> open parenthesis alignment
>=20
> > +{
> > +	struct addi9036 *addi9036 =3D to_addi9036(sd);
> > +	struct v4l2_mbus_framefmt *framefmt;
> > +	struct v4l2_rect *crop;
> > +	const struct addi9036_mode_info *new_mode;
> > +	int ret;
> > +
> > +	dev_dbg(addi9036->dev, "set_fmt: %x %dx%d\n",
> > +		format->format.code, format->format.width,
> > +		format->format.height);
> > +
> > +	crop =3D addi9036_get_pad_crop(addi9036, cfg, format->pad,
> > +				     format->which);
> > +
> > +	if (!crop)
> > +		return -EINVAL;
> > +
> > +	new_mode =3D addi9036_find_nearest_mode(format->format.width,
> > +					      format->format.height);
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
> > +
> > +	if (!framefmt)
> > +		return -EINVAL;
> > +
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
> > +	if (cfg)
> > +		fmt.which =3D V4L2_SUBDEV_FORMAT_TRY;
> > +	else
> > +		fmt.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> > +
> > +	fmt.format.width =3D 640;
> > +	fmt.format.height =3D 960;
>=20
> Get from mode by proper index?
> > +
> > +	addi9036_set_format(subdev, cfg, &fmt);
> > +
> > +	return 0;
> > +}
> > +
> > +static int addi9036_get_selection(struct v4l2_subdev *sd,
> > +				  struct v4l2_subdev_pad_config *cfg,
> > +				  struct v4l2_subdev_selection *sel)
> open parenthesis alignment
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
> > +
> > +	dev_dbg(addi9036->dev, "stream %d\n", enable);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_core_ops addi9036_core_ops =3D {
> > +	.s_power	=3D addi9036_s_power,
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
> > +		dev_err(dev, "invalid bus type, must be MIPI CSI2\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	addi9036->rst_gpio =3D gpiod_get_optional(dev, "reset",
> GPIOD_OUT_HIGH);
> > +	if (IS_ERR(addi9036->rst_gpio)) {
> > +		dev_info(dev, "Unable to get \"reset\" gpio\n");
> > +		return PTR_ERR(addi9036->rst_gpio);
> > +	}
> > +
> > +	v4l2_ctrl_handler_init(&addi9036->ctrls, 4);
> > +
> > +	addi9036->pixel_rate =3D v4l2_ctrl_new_std(&addi9036->ctrls,
> > +						  &addi9036_ctrl_ops,
> > +						  V4L2_CID_PIXEL_RATE,
> > +						  1, INT_MAX, 1, 1);
> open parenthesis alignment
>=20
> > +	addi9036->link_freq =3D v4l2_ctrl_new_int_menu(&addi9036->ctrls,
> > +						     &addi9036_ctrl_ops,
> > +						     V4L2_CID_LINK_FREQ,
> > +						     ARRAY_SIZE(
> > +							     link_freq_tbl) - 1,
> > +						     0, link_freq_tbl);
> > +	if (addi9036->link_freq)
> > +		addi9036->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > +
> > +	addi9036->set_chip_config =3D v4l2_ctrl_new_custom(&addi9036->ctrls,
> > +						&addi9036_ctrl_chip_config,
> > +						NULL);
> ditto, alignment.
> > +
> > +	addi9036->reg_read =3D v4l2_ctrl_new_custom(&addi9036->ctrls,
> > +						  &addi9036_ctrl_reg_read,
> > +						  NULL);
> These two ctrls are used for debug?
>=20
> > +
> > +	addi9036->sd.ctrl_handler =3D &addi9036->ctrls;
> > +
> > +	if (addi9036->ctrls.error) {
> > +		dev_err(dev, "%s: control initialization error %d\n",
> > +			__func__, addi9036->ctrls.error);
> > +		ret =3D addi9036->ctrls.error;
> > +		goto free_ctrl;
> > +	}
> > +
> > +	v4l2_i2c_subdev_init(&addi9036->sd, client, &addi9036_subdev_ops);
> > +	addi9036->sd.flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	addi9036->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +	addi9036->sd.dev =3D &client->dev;
> > +	addi9036->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
> > +
> > +	ret =3D media_entity_pads_init(&addi9036->sd.entity, 1, &addi9036->pa=
d);
> > +
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not register media entity\n");
> > +		goto free_ctrl;
> > +	}
> > +
> > +	ret =3D addi9036_s_power(&addi9036->sd, true);
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not power up addi9036\n");
> > +		goto free_entity;
> > +	}
> > +
> > +	dev_info(dev, "addi9036 detected at address 0x%02x\n", client->addr);
> dev_dbg(...), and why here?
> > +
> > +	ret =3D addi9036_s_power(&addi9036->sd, false);
> > +	if (ret < 0) {
> > +		dev_err(dev, "could not power down addi9036\n");
> > +		goto free_entity;
> > +	}
> Any chance to use pm runtime?
>=20
> > +
> > +	addi9036_entity_init_cfg(&addi9036->sd, NULL);
> > +
> > +	ret =3D v4l2_async_register_subdev(&addi9036->sd);
> > +	if (ret < 0)
> > +		dev_err(dev, "could not register v4l2 device\n");
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
> >
>=20
> --
> Best regards,
> Bingbu Cao

Best regards,
Bogdan

--_000_DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0DM6PR03MB5274namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

eJ8+IlN7AQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEJgAEAIQAAADUzRURDNEYz
NTk4NDVENEU5RTE1NkUzODY1ODNBMkI1ADcHAQ2ABAACAAAAAgACAAEFgAMADgAAAOQHCQARAAcA
CQA5AAQAUgEBIIADAA4AAADkBwkAEQAHAAkAOQAEAFIBAQiABwAYAAAASVBNLk1pY3Jvc29mdCBN
YWlsLk5vdGUAMQgBBIABAFUAAABSRTogW1BBVENIIDEvMl0gbWVkaWE6IGkyYzogQWRkIGRyaXZl
ciBmb3IgdGhlIEFuYWxvZyBEZXZpY2VzIEFEREk5MDM2IFRvRiBmcm9udC1lbmQASRoBA5AGAOxc
AABqAAAAAgF/AAEAAABRAAAAPERNNlBSMDNNQjUyNzQ3RjRDNkFCRTJEQzE5RTE4NUFGODlCM0Uw
QERNNlBSMDNNQjUyNzQubmFtcHJkMDMucHJvZC5vdXRsb29rLmNvbT4AAAAACwAfDgAAAAACAQkQ
AQAAABklAAAVJQAAOXMAAExaRnWg0rsvYQAKZmJpZAQAAGNjwHBnMTI1MgD+A0PwdGV4dAH3AqQD
4wIABGNoCsBzZXQwIO8HbQKDAFARTTIKgAa0AoCWfQqACMg7CWIxOQ7AvwnDFnIKMhZxAoAVYioJ
sHMJ8ASQYXQFsg5QA2Bzom8BgCBFeBHBbhgwXQZSdgSQF7YCEHIAwHR9CFBuGjEQIAXABaAbZGSa
IANSIBAiF7JcdgiQ5HdrC4BkNR1TBPAHQA0XcDAKcRfyYmttawZzAZAAICBCTV9C4EVHSU59CvwB
8QvwxjISQBmhayB5CGAfsNkLgGdiIiAa4SAJcB1iKCxcbAuAZQqASSfubAMgB3ALUGUHgAIwIfK7
ItIAwHIfUCQQA6BWIYDedBHQBUAj0BywdwWwHaGEZyACICBub3cjZUUjZT4fsG9nZABwLL8l4iHQ
BCAisiTDCrB0EcAWLifXJ9dPA6A5LzEUMS8B0CAOkDoyNPggQU0owChkEkAocAWw2mUDkXcDYBAg
OifXKEADIaAZ4EFEREk5MOwzNiQQBCBhG9EkMhAgySjANDUF0Eh6KMADUT0CMC0J8BxgGSAKQHRp
vycBIrIRwhgwLhkFoHUkQRccYAEAHWBjGeAoQ0PcRCkcwAdxJvBmHHAjcIRnaAVAKFRPRjSwyQdw
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
AAAAUwBNAFQAUAAAAAAAAgFBAAEAAAB6AAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAACAVABvAGcA
bwByAGUAYQBuACwAIABCAG8AZwBkAGEAbgAAAFMATQBUAFAAAABCAG8AZwBkAGEAbgAuAFQAbwBn
AG8AcgBlAGEAbgBAAGEAbgBhAGwAbwBnAC4AYwBvAG0AAAAAAB8AAl0BAAAANgAAAEIAbwBnAGQA
YQBuAC4AVABvAGcAbwByAGUAYQBuAEAAYQBuAGEAbABvAGcALgBjAG8AbQAAAAAAHwDlXwEAAAA+
AAAAcwBpAHAAOgBiAG8AZwBkAGEAbgAuAHQAbwBnAG8AcgBlAGEAbgBAAGEAbgBhAGwAbwBnAC4A
YwBvAG0AAAAAAB8AGgwBAAAAIgAAAFQAbwBnAG8AcgBlAGEAbgAsACAAQgBvAGcAZABhAG4AAAAA
AB8AHwwBAAAANgAAAEIAbwBnAGQAYQBuAC4AVABvAGcAbwByAGUAYQBuAEAAYQBuAGEAbABvAGcA
LgBjAG8AbQAAAAAAHwAeDAEAAAAKAAAAUwBNAFQAUAAAAAAAAgEZDAEAAAB6AAAAAAAAAIErH6S+
oxAZnW4A3QEPVAIAAACAVABvAGcAbwByAGUAYQBuACwAIABCAG8AZwBkAGEAbgAAAFMATQBUAFAA
AABCAG8AZwBkAGEAbgAuAFQAbwBnAG8AcgBlAGEAbgBAAGEAbgBhAGwAbwBnAC4AYwBvAG0AAAAA
AB8AAV0BAAAANgAAAEIAbwBnAGQAYQBuAC4AVABvAGcAbwByAGUAYQBuAEAAYQBuAGEAbABvAGcA
LgBjAG8AbQAAAAAACwBAOgEAAAAfABoAAQAAABIAAABJAFAATQAuAE4AbwB0AGUAAAAAAAMA8T8J
BAAACwBAOgEAAAADAP0/5AQAAAIBCzABAAAAEAAAAFPtxPNZhF1OnhVuOGWDorUDABcAAQAAAEAA
OQCA0KGMwYzWAUAACDAu9NGMwYzWAQsAKQAAAAAAHwDZPwEAAAAAAgAAVABoAGEAbgBrACAAeQBv
AHUAIABCAGkAbgBnAGIAdQAgAGYAbwByACAAcgBlAHYAaQBlAHcALAANAAoASQAnAGwAbAAgAGkA
bQBwAGwAZQBtAGUAbgB0ACAAeQBvAHUAcgAgAHIAZQBtAGEAcgBrAHMAIABpAG4AIABWADIAIAB0
AGgAYQB0ACAASQAnAG0AIAB3AG8AcgBrAGkAbgBnACAAbwBuACAAbgBvAHcADQAKAA0ACgA+ACAA
QgBvAGcAZABhAG4ALAAgAHQAaABhAG4AawBzACAAZgBvAHIAIAB5AG8AdQByACAAcABhAHQAYwBo
AC4ADQAKAD4AIAANAAoAPgAgAE8AbgAgADkALwAxADEALwAyADAAIAAxADIAOgAyADQAIABBAE0A
LAAgAEIAbwBnAGQAYQBuACAAVABvAGcAbwByAGUAYQBuACAAdwByAG8AdABlADoADQAKAD4AIAA+
ACAAVABoAGUAIABBAEQARABJADkAMAAzADYAIABpAHMAIABhACAAYwBvAG0AcABsAGUAdABlACwA
IAA0ADUAIABNAEgAegAsACAAZgByAG8AbgB0AC0AZQBuAGQAIABzAG8AbAB1AHQAaQBvAG4AIABm
AG8AcgAgAGMAaABhAHIAZwBlAA0ACgA+ACAAPgAgAGMAbwB1AHAAAAALAACACCAGAAAAAADAAAAA
AAAARgAAAAAUhQAAAAAAAAsAIwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAHgAAAGEAYwBj
AGUAcAB0AGwAYQBuAGcAdQBhAGcAZQAAAAAAAQAAAAwAAABlAG4ALQBVAFMAAAADAACACCAGAAAA
AADAAAAAAAAARgEAAAAyAAAARQB4AGMAaABhAG4AZwBlAEEAcABwAGwAaQBjAGEAdABpAG8AbgBG
AGwAYQBnAHMAAAAAACAAAABIAACACCAGAAAAAADAAAAAAAAARgEAAAAiAAAATgBlAHQAdwBvAHIA
awBNAGUAcwBzAGEAZwBlAEkAZAAAAAAAXA4WwpydF0/kWQjYWtivUx8AAIATj/JB9IMUQaWE7tta
awv/AQAAABYAAABDAGwAaQBlAG4AdABJAG4AZgBvAAAAAAABAAAAKgAAAEMAbABpAGUAbgB0AD0A
TQBTAEUAeABjAGgAYQBuAGcAZQBSAFAAQwAAAAAAHwD6PwEAAAAiAAAAVABvAGcAbwByAGUAYQBu
ACwAIABCAG8AZwBkAGEAbgAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAABoUAAAAAAAAfADcA
AQAAAKoAAABSAEUAOgAgAFsAUABBAFQAQwBIACAAMQAvADIAXQAgAG0AZQBkAGkAYQA6ACAAaQAy
AGMAOgAgAEEAZABkACAAZAByAGkAdgBlAHIAIABmAG8AcgAgAHQAaABlACAAQQBuAGEAbABvAGcA
IABEAGUAdgBpAGMAZQBzACAAQQBEAEQASQA5ADAAMwA2ACAAVABvAEYAIABmAHIAbwBuAHQALQBl
AG4AZAAAAAAAHwA9AAEAAAAKAAAAUgBFADoAIAAAAAAAAwA2AAAAAAADAC4AAAAAAB8AQhABAAAA
bgAAADwAZgBmADEANwA2ADIAZgBiAC0ANwA0ADkAYQAtAGEAMABhADMALQBlADkAMABkAC0AZABi
AGIAYwA4AGMAMwA4ADgAOAA5ADMAQABsAGkAbgB1AHgALgBpAG4AdABlAGwALgBjAG8AbQA+AAAA
AAACAXEAAQAAACAAAAABAdaHde/NH4W6qapIS7fPyMj9dGsSqWHv/oCACoOaUB8AcAABAAAAogAA
AFsAUABBAFQAQwBIACAAMQAvADIAXQAgAG0AZQBkAGkAYQA6ACAAaQAyAGMAOgAgAEEAZABkACAA
ZAByAGkAdgBlAHIAIABmAG8AcgAgAHQAaABlACAAQQBuAGEAbABvAGcAIABEAGUAdgBpAGMAZQBz
ACAAQQBEAEQASQA5ADAAMwA2ACAAVABvAEYAIABmAHIAbwBuAHQALQBlAG4AZAAAAAAAHwA1EAEA
AACiAAAAPABEAE0ANgBQAFIAMAAzAE0AQgA1ADIANwA0ADcARgA0AEMANgBBAEIARQAyAEQAQwAx
ADkARQAxADgANQBBAEYAOAA5AEIAMwBFADAAQABEAE0ANgBQAFIAMAAzAE0AQgA1ADIANwA0AC4A
bgBhAG0AcAByAGQAMAAzAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA+AAAAAAAf
ADkQAQAAANYAAAA8ADIAMAAyADAAMAA5ADEAMAAxADYAMgA0ADIANgAuADUANQAzADAANgAtADEA
LQBiAG8AZwBkAGEAbgAuAHQAbwBnAG8AcgBlAGEAbgBAAGEAbgBhAGwAbwBnAC4AYwBvAG0APgAg
ADwAZgBmADEANwA2ADIAZgBiAC0ANwA0ADkAYQAtAGEAMABhADMALQBlADkAMABkAC0AZABiAGIA
YwA4AGMAMwA4ADgAOAA5ADMAQABsAGkAbgB1AHgALgBpAG4AdABlAGwALgBjAG8AbQA+AAAAAAAD
AN4/n04AAAsAAIAIIAYAAAAAAMAAAAAAAABGAAAAAAOFAAAAAAAAAwAAgAggBgAAAAAAwAAAAAAA
AEYAAAAAAYUAAAAAAAADAIAQ/////wMAExIAAAAAAgEAgBOP8kH0gxRBpYTu21prC/8BAAAALgAA
AEgAZQBhAGQAZQByAEIAbwBkAHkARgByAGEAZwBtAGUAbgB0AEwAaQBzAHQAAAAAAAEAAAA2AAAA
AQAKAAAABAAAAAEAAAAUAAAAAAAAAAAAAACBAAAAAAAAABQAAAAAAAAAsAAAAP////8AAAAAAAAL
AACAE4/yQfSDFEGlhO7bWmsL/wEAAAAcAAAASABhAHMAUQB1AG8AdABlAGQAVABlAHgAdAAAAAEA
AAALAACAE4/yQfSDFEGlhO7bWmsL/wEAAAAoAAAASQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAQwBo
AGEAbgBnAGUAZAAAAAEAAAACAQCAE4/yQfSDFEGlhO7bWmsL/wEAAABAAAAAQwBvAG4AdgBlAHIA
cwBhAHQAaQBvAG4AVAByAGUAZQBQAGEAcgBlAG4AdABSAGUAYwBvAHIAZABLAGUAeQAAAAEAAAAu
AAAAAAAAAItfVn7imphHhKoquwrCPYcBAN7vRLsd+GtAjgcWqa1ixfYAASVY7jgAAAAAQAAHMJML
jozBjNYBCwACAAEAAAADACYAAAAAAAsAKwAAAAAACwAGDAAAAAACARAwAQAAAEYAAAAAAAAAi19W
fuKamEeEqiq7CsI9hwcAg1h6j7rln022qia2VznV8QAAAAXaQwAAOFXca9QfKUOrBfbVtPzFzAAr
OAmSIgAAAAACARMwAQAAABAAAADNH4W6qapIS7fPyMj9dGsSAgEUMAEAAAAMAAAAMAcAAHuvzp1U
AAAAAwBaNgAAAAADAGg2DQAAAAsA+jYBAAAAHwD4PwEAAAAiAAAAVABvAGcAbwByAGUAYQBuACwA
IABCAG8AZwBkAGEAbgAAAAAAHwAiQAEAAAAGAAAARQBYAAAAAAAfACNAAQAAAAIBAAAvAE8APQBF
AFgAQwBIAEEATgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkA
TgBJAFMAVABSAEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBT
AFAARABMAFQAKQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMALwBDAE4APQBEADkARQBEADkA
RgA0ADEANgAxADQANwA0ADYAMwBEADkAMgA5ADAARQA2ADEAOQAyAEMANwBCAEMANwA5AEEALQBU
AE8ARwBPAFIARQBBAE4ALAAgAEIAAAAAAB8AJEABAAAABgAAAEUAWAAAAAAAHwAlQAEAAAACAQAA
LwBPAD0ARQBYAEMASABBAE4ARwBFAEwAQQBCAFMALwBPAFUAPQBFAFgAQwBIAEEATgBHAEUAIABB
AEQATQBJAE4ASQBTAFQAUgBBAFQASQBWAEUAIABHAFIATwBVAFAAIAAoAEYAWQBEAEkAQgBPAEgA
RgAyADMAUwBQAEQATABUACkALwBDAE4APQBSAEUAQwBJAFAASQBFAE4AVABTAC8AQwBOAD0ARAA5
AEUARAA5AEYANAAxADYAMQA0ADcANAA2ADMARAA5ADIAOQAwAEUANgAxADkAMgBDADcAQgBDADcA
OQBBAC0AVABPAEcATwBSAEUAQQBOACwAIABCAAAAAAAfADBAAQAAACIAAABUAG8AZwBvAHIAZQBh
AG4ALAAgAEIAbwBnAGQAYQBuAAAAAAAfADFAAQAAACIAAABUAG8AZwBvAHIAZQBhAG4ALAAgAEIA
bwBnAGQAYQBuAAAAAAAfADhAAQAAACIAAABUAG8AZwBvAHIAZQBhAG4ALAAgAEIAbwBnAGQAYQBu
AAAAAAAfADlAAQAAACIAAABUAG8AZwBvAHIAZQBhAG4ALAAgAEIAbwBnAGQAYQBuAAAAAAADAFlA
AAAAAAMAWkAAAAAAAwA3UAEAAAADAAlZAQAAAB8ACl0BAAAANgAAAEIAbwBnAGQAYQBuAC4AVABv
AGcAbwByAGUAYQBuAEAAYQBuAGEAbABvAGcALgBjAG8AbQAAAAAAHwALXQEAAAA2AAAAQgBvAGcA
ZABhAG4ALgBUAG8AZwBvAHIAZQBhAG4AQABhAG4AYQBsAG8AZwAuAGMAbwBtAAAAAAADAACAUONj
C8yc0BG82wCAX8zOBAEAAAAkAAAASQBuAGQAZQB4AGkAbgBnAEUAcgByAG8AcgBDAG8AZABlAAAA
GwAAAB8AAIBQ42MLzJzQEbzbAIBfzM4EAQAAACoAAABJAG4AZABlAHgAaQBuAGcARQByAHIAbwBy
AE0AZQBzAHMAYQBnAGUAAAAAAAEAAABwAAAASQBuAGQAZQB4AGkAbgBnACAAUABlAG4AZABpAG4A
ZwAgAHcAaABpAGwAZQAgAEIAaQBnAEYAdQBuAG4AZQBsAFAATwBJAEkAcwBVAHAAVABvAEQAYQB0
AGUAIABpAHMAIABmAGEAbABzAGUALgAAAB8AAIAfpOszqHouQr57eeGpjlSzAQAAADgAAABDAG8A
bgB2AGUAcgBzAGEAdABpAG8AbgBJAG4AZABlAHgAVAByAGEAYwBrAGkAbgBnAEUAeAAAAAEAAAD+
AQAASQBJAD0AWwBDAEkARAA9AGIAYQA4ADUAMQBmAGMAZAAtAGEAYQBhADkALQA0AGIANAA4AC0A
YgA3AGMAZgAtAGMAOABjADgAZgBkADcANAA2AGIAMQAyADsASQBEAFgASABFAEEARAA9ADAAMQBE
ADYAOAA3ADcANQBFAEYAOwBJAEQAWABDAE8AVQBOAFQAPQAzAF0AOwBTAEIATQBJAEQAPQAyADMA
OwBTADEAPQA8AGYAZgAxADcANgAyAGYAYgAtADcANAA5AGEALQBhADAAYQAzAC0AZQA5ADAAZAAt
AGQAYgBiAGMAOABjADMAOAA4ADgAOQAzAEAAbABpAG4AdQB4AC4AaQBuAHQAZQBsAC4AYwBvAG0A
PgA7AFIAVABQAD0ARABpAHIAZQBjAHQAQwBoAGkAbABkADsAVABEAE4APQBNAGkAcwBtAGEAdABj
AGgAOwBUAFAAPQBTAGEAbQBlADsAVABGAFIAPQBOAG8AdABGAG8AcgBrAGkAbgBnADsAVgBlAHIA
cwBpAG8AbgA9AFYAZQByAHMAaQBvAG4AIAAxADUALgAyADAAIAAoAEIAdQBpAGwAZAAgADMAMwA5
ADEALgAwACkALAAgAFMAdABhAGcAZQA9AEgAMQA7AFUAUAA9AEQAMAA7AEQAUAA9ADEAMAA1AAAA
AAALAACAUONjC8yc0BG82wCAX8zOBAEAAAAmAAAASQBzAFAAZQByAG0AYQBuAGUAbgB0AEYAYQBp
AGwAdQByAGUAAAAAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAAQhQAAAAAAAAMAAIAIIAYA
AAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAgoUAAAAAAAAD
AACAKQMCAAAAAADAAAAAAAAARgEAAAAQAAAAJABEAEcATQBhAHIAawAAALfaY1MfAACAhgMCAAAA
AADAAAAAAAAARgEAAAASAAAAeAAtAGQAZwAtAHIAZQBmAAAAAAABAAAAUgsAAFAARwAxAGwAZABH
AEUAKwBQAEcARgAwAEkARwA1AHQAUABTAEoAaQBiADIAUgA1AEwAbgBSADQAZABDAEkAZwBjAEQA
MABpAFkAegBwAGMAZABYAE4AbABjAG4ATgBjAFkAbgBSAHYAWgAyADkAeQBaAFcARgBjAFkAWABC
AHcAWgBHAEYAMABZAFYAeAB5AGIAMgBGAHQAYQBXADUAbgBYAEQAQQA1AFoARABnADAATwBXAEkA
MgBMAFQATQB5AFoARABNAHQATgBHAEUAMABNAEMAMAA0AE4AVwBWAGwATABUAFoAaQBPAEQAUgBp
AFkAVABJADUAWgBUAE0AMQBZAGwAeAB0AGMAMgBkAHoAWABHADEAegBaAHkAMQBqAFoARABrADMA
WgBqAGcAMABOAGkAMQBtAE8ARwBJADAATABUAEUAeABaAFcARQB0AE8ARABaAGgATgB5ADAAeABP
AEQARgBrAFoAVwBFADEATgBEAFoAbABaAEQASgBjAFkAVwAxAGwATABYAFIAbABjADMAUgBjAFkA
MgBRADUATgAyAFkANABOAEQAZwB0AFoAagBoAGkATgBDADAAeABNAFcAVgBoAEwAVABnADIAWQBU
AGMAdABNAFQAZwB4AFoARwBWAGgATgBUAFEAMgBaAFcAUQB5AFkAbQA5AGsAZQBTADUAMABlAEgA
UQBpAEkASABOADYAUABTAEkAeQBOAFQAWQA0AE0AeQBJAGcAZABEADAAaQBNAFQATQB5AE4ARABR
ADQATQBEAEEAeQBNAEQASQAxAE0AegBrAHoATQB6AEkAdwBJAGkAQgBvAFAAUwBKAFQAVABYAFoA
TQBWADMAcABwAGMAawB0AHUAZQBWAHAATQBPAEcAUQAzAFIAegBOAG8AUQBXAFIAbwBhAGsARgAw
AGIAawBVADkASQBpAEIAcABaAEQAMABpAEkAaQBCAGkAYgBEADAAaQBNAEMASQBnAFkAbQA4ADkA
SQBqAEUAaQBJAEcATgBwAFAAUwBKAGoAUQBVAEYAQgBRAFUAVgBTAFMARgBVAHgAVQBsAE4AUwBW
AFUAWgBPAFEAMgBkAFYAUQBVAEYARgBiADAATgBCAFEAVQBOAHYAUgBFADgAcgBVAEgAZABaAGUA
bABkAEIAVwBXAE0AMgBOAEYAWgBEAFIAVQBSAEYATQBsAGwAbwBlAG4ASgBvAFYAVQBsAFIAVABW
AFIAYQBaADAAUgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUA
RgBCAFEAVQBGAEIAUQBVAEYAQgBTAEUARgBCAFEAVQBGAEUAWQBVAEYAUgBRAFUARgBCAFEAVQBG
AEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUgBVAEYA
QgBVAFUARgBDAFEAVQBGAEIAUQBWAGsAdgBSADMARgBLAGQAMABGAEIAUQBVAEYAQgBRAFUARgBC
AFEAVQBGAEIAUQBVAEYAQgBRAFUAbwAwAFEAVQBGAEIAUQBtAGgAQgBSADEARgBCAFkAVgBGAEMA
WgBrAEYASQBUAFUARgBhAFUAVQBKAHEAUQBVAGgAVgBRAFcATgBuAFEAbQB4AEIAUgBqAGgAQgBZ
ADAARgBDAGUAVQBGAEgATwBFAEYAaABaADAASgBzAFEAVQBkAE4AUQBXAFIAQgBRAG4AcABCAFIA
agBoAEIAVwBtAGQAQwBhAEUARgBIAGQAMABGAGoAZAAwAEoAcwBRAFUAWQA0AFEAVgBwAG4AUQBu
AFoAQgBTAEUAMQBCAFkAVgBGAEMATQBFAEYASABhADAARgBrAFoAMABKAHMAUQBVAEYAQgBRAFUA
RgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBG
AEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYA
QgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBC
AFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIA
UQBVAEYAQgBRAFUARgBCAFEAVQBGAEYAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBXAGQAQgBR
AFUARgBCAFEAVQBGAHUAWgAwAEYAQgBRAFUAZABGAFEAVgBwAEIAUQBuAEIAQgBSAGoAaABCAFkA
MwBkAEMAYgBFAEYASABUAFUARgBrAFUAVQBKADUAUQBVAGQAVgBRAFYAaAAzAFEAbgBkAEIAUwBF
AGwAQgBZAG4AZABDAGMAVQBGAEgAVgBVAEYAWgBkADAASQB3AFEAVQBoAE4AUQBWAGgAMwBRAGoA
QgBCAFIAMgB0AEIAVwBsAEYAQwBlAFUARgBFAFIAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBG
AEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYA
QgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBC
AFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIA
UQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBR
AFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEA
VQBGAEIAUQBVAEYAQgBVAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUATgBCAFEAVQBGAEIAUQBV
AEYARABaAFUARgBCAFEAVQBGAFoAVQBVAEoAcgBRAFUAZAByAFEAVgBoADMAUQBuAHAAQgBSADEA
VgBCAFcAWABkAEMATQBVAEYASQBTAFUARgBhAFUAVQBKAG0AUQBVAGgAQgBRAFcATgBuAFEAbgBa
AEIAUgAyADkAQgBXAGwARgBDAGEAawBGAEkAVQBVAEYAagBkADAASgBtAFEAVQBoAFIAUQBXAEYA
UgBRAG0AeABCAFMARQBsAEIAVABXAGQAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBC
AFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIA
UQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBR
AFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEA
VQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBV
AEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEIAUQBVAEYAQgBRAFUA
RgBCAFEAawBGAEIAUQBVAEYAQgBRAFUARgBCAFEAVQBGAEoAUQBVAEYAQgBRAFUARgBCAFEAVAAw
ADkASQBpADgAKwBQAEMAOQB0AFoAWABSAGgAUABnAD0APQAAAAAAAgEAgAggBgAAAAAAwAAAAAAA
AEYBAAAANgAAAEkAbgBUAHIAYQBuAHMAaQB0AE0AZQBzAHMAYQBnAGUAQwBvAHIAcgBlAGwAYQB0
AG8AcgAAAAAAAQAAABAAAABJOwwgrSqQRoCCZ8L7cH35CwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA
DoUAAAAAAAAfAACACCAGAAAAAADAAAAAAAAARgAAAADYhQAAAQAAABIAAABJAFAATQAuAE4AbwB0
AGUAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAABQAAAB4AC0AZABnAC0AcgBvAHIAZgAAAAEA
AAAKAAAAdAByAHUAZQAAAAAAAwANNP0/AAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAuAAAAYQB1
AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAC0AcgBlAHMAdQBsAHQAcwAAAAAAAQAAAPwAAABsAGkA
bgB1AHgALgBpAG4AdABlAGwALgBjAG8AbQA7ACAAZABrAGkAbQA9AG4AbwBuAGUAIAAoAG0AZQBz
AHMAYQBnAGUAIABuAG8AdAAgAHMAaQBnAG4AZQBkACkAIABoAGUAYQBkAGUAcgAuAGQAPQBuAG8A
bgBlADsAbABpAG4AdQB4AC4AaQBuAHQAZQBsAC4AYwBvAG0AOwAgAGQAbQBhAHIAYwA9AG4AbwBu
AGUAIABhAGMAdABpAG8AbgA9AG4AbwBuAGUAIABoAGUAYQBkAGUAcgAuAGYAcgBvAG0APQBhAG4A
YQBsAG8AZwAuAGMAbwBtADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAAgAAAAeAAtAG0AcwAt
AGgAYQBzAC0AYQB0AHQAYQBjAGgAAAABAAAAAgAAAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEA
AAAiAAAAeAAtAG8AcgBpAGcAaQBuAGEAdABpAG4AZwAtAGkAcAAAAAAAAQAAACAAAABbADEAMwA3
AC4ANwAxAC4AMgAyADYALgA1ADQAXQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAAB4AC0A
bQBzAC0AcAB1AGIAbABpAGMAdAByAGEAZgBmAGkAYwB0AHkAcABlAAAAAAABAAAADAAAAEUAbQBh
AGkAbAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADgAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUA
MwA2ADUALQBmAGkAbAB0AGUAcgBpAG4AZwAtAGgAdAAAAAEAAAAOAAAAVABlAG4AYQBuAHQAAAAA
AB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUAMwA2ADUA
LQBmAGkAbAB0AGUAcgBpAG4AZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAtAGkAZAAAAAEAAABK
AAAAYwAyADEANgAwAGUANQBjAC0AOQBkADkAYwAtADQAZgAxADcALQBlADQANQA5AC0AMAA4AGQA
OAA1AGEAZAA4AGEAZgA1ADMAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADYAAAB4AC0AbQBz
AC0AdAByAGEAZgBmAGkAYwB0AHkAcABlAGQAaQBhAGcAbgBvAHMAdABpAGMAAAAAAAEAAAAeAAAA
RABNADUAUABSADAAMwBNAEIAMgA2ADgAMQA6AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA0
AAAAeAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AcAByAHYAcwAAAAEA
AACiAAAAPABEAE0ANQBQAFIAMAAzAE0AQgAyADYAOAAxADYAMQA3ADYAMwAxADIAMwA1ADAANwAy
AEYAOQBDADMANwBFADUAQwA5AEIAMwBFADAAQABEAE0ANQBQAFIAMAAzAE0AQgAyADYAOAAxAC4A
bgBhAG0AcAByAGQAMAAzAC4AcAByAG8AZAAuAG8AdQB0AGwAbwBvAGsALgBjAG8AbQA+AAAAAAAf
AACAhgMCAAAAAADAAAAAAAAARgEAAAA4AAAAeAAtAG0AcwAtAG8AbwBiAC0AdABsAGMALQBvAG8A
YgBjAGwAYQBzAHMAaQBmAGkAZQByAHMAAAABAAAAEgAAAE8ATABNADoAMgAzADAAOwAAAAAAHwAA
gIYDAgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBzAGUA
bgBkAGUAcgBhAGQAYwBoAGUAYwBrAAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYB
AAAAKgAAAHgALQBtAGkAYwByAG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAAAAAAAQAAAA4A
AABCAEMATAA6ADAAOwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAARAAAAHgALQBtAGkAYwBy
AG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUALQBpAG4AZgBvAAAA
AQAAALIDAABoAGMAeAByAE8ATgBHAHgAYwBVAHIAdQBxAEEAYQBHAG0AaABmAFYASgBGAE0AYQBI
AGEAdAAzAGYAawBMAGgAYwBjAE8AMwAxAFkAWQBZAE4AKwBMAHYAZABNAHgATQAwAFMARgB2AFEA
VQBLAFkAZAAwAFAAQwB4AFYAMgBwAHMAMQBsAHkAWABSAEEANgBsAC8ASwAvAEUANABVAGcAcQB2
ADQAVABCAE4AVAArAC8ATwBOAE0ASgBmAFYATQBBAEsAQwBLADAAagBGAEEAOQBBAGkATAA0ADYA
RgBnAFIAMABRAEYAdQAwAHUAVwAwADIASQBRAFEARwBLADYAYwA4AFQANABCADgAZQBPAEoAMABu
AEsATQB5AG8AQgBBAGcATwBvAFkAcgBZAHAASgA3AEwANABzAEoAQgBzAGwARABnAG4AdABHADMA
MwA3AGYAbgB0AGcAWgBIAEUAUwBjADcAdQAzAGcATwBtAHMAZABsADEAWABoAFkAWgByAEYANgBR
AGcAZwByAGcATwBlADMAcgBhAHQAZgBjAGcAbwAyAFoAYwAvADcANAB5AGYARwBaAC8ATQBJAEcA
UwBlAGsAVQBwAHMAbgAwADAARQByAG4AdABvAHAANABSAFAATABQAEUAdABPAFYAdwB4AHQALwBJ
AGUAdQBoAHYARwBXAE4AcwA0AFgAUwB5ADQAZAB4AEMATQBkAFIANABaAEwAVwBjAGcAbQBLAHAA
SwBBAFQAYQBGAGMAbQBKAHoAVgAvAE0AQgA3AGkAeQB6AFYAUwB1AGoARwBMADYAMwA1ADcAQgA5
AHgAbQBzAGYAVQBzAEsAMQBoADYATABPADMASgBmAC8AWABHAEoAOABpADkATQBFAFcASQB0AEwA
RAA0AE0AOQBVAFkANgBTAEEAeQBuAEUAbwB1AHAAaABzADYAVAB6ADkAdQBJAFgANABGAGgAOQBO
AC8AdABZAEoAcABaADUAbQAyAHYAQwBQAG4AZgBSAHYAbAAvAFUAVQA3AEQAcwBrAEsAbgBVAHUA
eABOAFEAVgBSAHIARQBBAG8AYwA2AGUATQBZAEoATQBvAG4AQgA5AEcAeQAwAHgAdwBnAEsANQBF
AFMARgBYAGwAbgArAHEAYQBvADEAdgA2AHUAOQBaAHMAVwA3AEIAQwBwAEIAVAB0AE8ATwBpADkA
UwBrAFUAeQB5AFAAUwBEAGIAVABLAG4AUgBNAGEAZwB3AFEAPQA9AAAAAAAfAACAhgMCAAAAAADA
AAAAAAAARgEAAAA4AAAAeAAtAGYAbwByAGUAZgByAG8AbgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0A
cgBlAHAAbwByAHQAAAABAAAA9AMAAEMASQBQADoAMgA1ADUALgAyADUANQAuADIANQA1AC4AMgA1
ADUAOwBDAFQAUgBZADoAOwBMAEEATgBHADoAZQBuADsAUwBDAEwAOgAxADsAUwBSAFYAOgA7AEkA
UABWADoATgBMAEkAOwBTAEYAVgA6AE4AUwBQAE0AOwBIADoARABNADYAUABSADAAMwBNAEIANQAy
ADcANAAuAG4AYQBtAHAAcgBkADAAMwAuAHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0A
OwBQAFQAUgA6ADsAQwBBAFQAOgBOAE8ATgBFADsAUwBGAFMAOgAoADQANgAzADYAMAAwADkAKQAo
ADEAMwA2ADAAMAAzACkAKAAzADkAOAA2ADAANAAwADAAMAAwADIAKQAoADMAOQA2ADAAMAAzACkA
KAAzADcANgAwADAAMgApACgAMwA2ADYAMAAwADQAKQAoADMANAA2ADAAMAAyACkAKAAxADEAMAAx
ADMANgAwADAANQApACgANgA1ADAANgAwADAANwApACgANgA2ADkANAA2ADAAMAA3ACkAKAA2ADQA
NwA1ADYAMAAwADgAKQAoADcAMQAyADAAMAA0ADAAMAAwADAAMQApACgANgA2ADUANQA2ADAAMAA4
ACkAKAA1ADQAOQAwADYAMAAwADMAKQAoADYANgA0ADcANgAwADAANwApACgANAA3ADgANgAwADAA
MAAwADEAKQAoADUANQAwADEANgAwADAAMgApACgAMwAxADYAMAAwADIAKQAoADMAMAA4ADYANAAw
ADAAMwApACgAMgA5ADAANgAwADAAMgApACgANwA0ADEANgAwADAAMgApACgAOAA2ADMANgAyADAA
MAAxACkAKAA5ADYAOAA2ADAAMAAzACkAKAA3ADYAMQAxADYAMAAwADYAKQAoADUANgA2ADAAMwAw
ADAAMAAwADIAKQAoADUAMwA1ADQANgAwADEAMQApACgANwA2ADkANgAwADAANQApACgANAAzADIA
NgAwADAAOAApACgAMwAzADYANQA2ADAAMAAyACkAKAA4ADkAMwA2ADAAMAAyACkAKAA4ADYANwA2
ADAAMAAyACkAKAA4ADMAMwA4ADAANAAwADAAMAAwADEAKQAoADEAOAA2ADAAMAAzACkAKAAyADYA
MAAwADUAKQAoADYANgA0ADQANgAwADAAOAApACgANQAyADUAMwA2ADAAMQA0ACkAKAAyADEAMwAx
ADQAMAAwADMAKQAoADUANwA5ADAAMAA0ACkAOwBEAEkAUgA6AE8AVQBUADsAUwBGAFAAOgAxADEA
MAAxADsAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAABGAAAAeAAtAG0AcwAtAGUAeABjAGgAYQBu
AGcAZQAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUAZABhAHQAYQAAAAAAAQAAADIF
AABqAFIAQgBoAGwAMwBXAFcAcwA5AFYASwBQAGcAQQA3AHYAcwB2AHcAdQBPAEIANABZAFIAWgBs
AGMARgBIAEEAZgBlAG0AVgA1AEsATgBXAFcATQBHAGkAeQBHAHAATQBUAFIAeQBsADMAOQBQAG8A
NABsAGcAUwBuAG0AZwBvAHAAbgBhAFIAdgBxADcANABCAHAAVgByAEoAKwBzAHoATgAyAHcAbABW
ACsATwBBAFEAQwBpAHcAYgBlADcAWABJAHMAagBmAHcAbgA0AFoATgB0ADEAUAB1AEEAawA2AGQA
VABhAHIANgBCAG4AdwBNAEMASQBZAEsAZABqAE0AMABZADgAWQBYAEUARQAvACsAdgByAEgANgBZ
AC8AWQByAEcAYQBFAHYAUQBpAE4AaQAvAEwAMgAwAEsAOQBpAG4ATAA2AHAATwBHAGUAUABIAEcA
VgBYACsATABTAGwATABuAGkATABPAFAASABIAC8AWgAzAGcAZgBsAHQATwBUADMAMgBuAFUANgBK
AHkAbQBKAGgATQBYAEoAbwBvAGgAbQB2ADkAUgBzAHYAbQB3AHQAZABEAEEAVgBTAGsATABTAHUA
VQBLAG0ATABXAEgAdgA3AEEANgBJAFUAcABhAHkAagBKAGkAYwBXAFEARwBkAHQAUgByAHQAMgBZ
AEUATQBLAFgANQBqAGkASQBOAE8AbQBmAHoAVABSAEwARAByAG8AWABYAFMAQQBoADQAagBRAHMA
NABwADQAdAB0ADQAdwBqAEkARgAwAEEAegBaAFYAcQBVAE0ATwBvADUAZABBAFUAbwA0ADkAQwAr
AHUAagBVAHYAcgBRAHEAZABDAFEAegBVAHgARgBrAEMAMABYAFYAVwBPAG8ASwBvAHkAagA3AHoA
ZABoAE0AcgBHAGQAdABOADcAbgA1AFoAZgA5AHQAYgBZAFYAWAA3AE4AbQByAC8AdwBSAHkANwBU
AGEAZwBQAFQARwBWAEoANABCAHkATABYAGsANgBCAGIAVABtAHIANgBmAHoAdwAyAEkASAB2AHEA
OQBnAHcARwBLAGYAWQA5AE8AeQAvAG4AOQArAFgAcABFACsAMABOAGYAZQBEAFQAawB4ADMANABB
AEkASgB2AEEAdgA1AFIAdwBmAHoAaABBAHYATgAyAHEAWgBBAFUAUgBoAEYAOQBkAGEAaAA4AEYA
UwBQADEAWAB5AEIAZwB6AFkALwBYADAAMwBBAEIAYwBsAC8AMABnAC8AagBrADUATAAxAFEAVgA3
ADkAQQA3AE0AbABzAGEANwAyAFkANQBDAFAAawBVAHUAUQBFAHMAMgBhAHkATQBBAHgAZQBKADcA
NQBPAGMATABJAFQAUAA4AGEAKwBTAEkAQQAvAFoAbQBxAHUAMQBLAG4AbwBVAGQATwBGAEMAbQBy
AFMAQgBIAHoAawBkAGcARgA2AEQAagBkAFcAWABBAE0AQwBuADMAZgByAHIAeQBjAEIAeABSADQA
bwAxAGwARABlADUAdwB2AHoAQgBRAHAAbQB2AEcARABMAGsAVAAxAGoAcABVAGsATQB6AE4AQQBW
AG8ARQBOAHAAawBkAEIAcAB4AHIAWgBRAGkASAA5AFgAaQAxAG8AUgBxAHcAUABkAGgAdABQAG8A
WABXAE0ANABLAGUAdgBLAEwAdgBzAEsAcABxAGsAUwBnAEMAMgB4AC8ASQBnAHMAUwA0AGUAVgBj
ADMAdQBsAHcAbQBGAGcAPQA9AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA+AAAAeAAtAG0A
cwAtAGUAeABjAGgAYQBuAGcAZQAtAHQAcgBhAG4AcwBwAG8AcgB0AC0AZgBvAHIAawBlAGQAAAAA
AAEAAAAKAAAAVAByAHUAZQAAAAAAxNY=

--_000_DM6PR03MB52747F4C6ABE2DC19E185AF89B3E0DM6PR03MB5274namp_--
