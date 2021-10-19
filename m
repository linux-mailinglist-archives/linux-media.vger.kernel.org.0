Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73614433B69
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhJSQBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 12:01:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:17319 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhJSQBA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 12:01:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="227325015"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="227325015"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 08:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="718352735"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2021 08:58:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 08:58:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 08:58:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 08:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZ8Tyc5T1QABMNby6SmmQnANbTJ4RmC6BWt33UPfLll+XQnvQWDMfqFT+1woz/Mt+o+bGPolIgQ4Gwl++qMyenczvCTN/O1jlqIse4SZN1KxH5dFOebP2x/qcjsGnXLumlsOburtOy3hyP1NeqLRm92gEwijQqqJ+N6688KwC2dMU25nqsY0NbMKnrB/FilHraOHkIktasUQFaxdZ7qWXLgVPvEfdmlAivHHUHjuhz7NQiyNER5/PmSnvJQzinKj4bOpc5+v8mnvP7Ebmq5fGWILVbMJYroxMbFs7Fb5bB6OT0J17JjXujwS4BDvpc21BBTeJ+intg7Ql3ILqW1wLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaiQ2B3yElXuXqwqDzpGNqFtoEqPE2K1KfcPUuF/A5I=;
 b=n7IzROmSDbUGhV5hiZYt+B4r6/XEXcOwGwmbs1r3ozjJySM0YEmTXs7c/8vDmn5W9yeaXC37y88v8xn7ZvUnIIEw1dK3VsyxbnJ123z6ZAtrlxbH4YScM57H3bJL+y2mk9Dk4ZodbGHuky3yWreaz69/XpgF9Wa2KjkCgPooSYi07VlwGKJ9DD4X85msCUD5i97hoquIWmckH26by8Tp/sxWjnb4SI6ACimTjMOO00LqQ8fTfl9YnMxYemsrhpIZPiH9O6ZX9JZQhBl8l06FWD8hxHidj6qkPmsN09PNSrZnzB2NUr86R0306xZzSWSvLL0FphaCdghVuUgYpGUIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaiQ2B3yElXuXqwqDzpGNqFtoEqPE2K1KfcPUuF/A5I=;
 b=w1lsxBg5sT9k8b3Us9KusvuNap/QhzyvaiTkIVpADKY++4P6NdY3eL4jHdTxqN3p647XhoW+2TE9EeZHtTH1peu8LDsk+iEqaQfzo1LCCCxDG+HIyjq76JsnlpHVkfg5blGqaDbLJKIq3v8DzHc/4FmoceqoxXC6nY8e9+4FP0E=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 15:58:41 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4628.015; Tue, 19 Oct 2021
 15:58:41 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Topic: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Index: AQHXw9CEorwlFxevV0mGeohgDRS1A6vaSIcAgAAp8eCAAAgIgA==
Date:   Tue, 19 Oct 2021 15:58:41 +0000
Message-ID: <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
 <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 598c03bb-ea52-4d48-287f-08d993195289
x-ms-traffictypediagnostic: DM8PR11MB5621:
x-microsoft-antispam-prvs: <DM8PR11MB5621B262DF62D276276FEFDF99BD9@DM8PR11MB5621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jrrTlmE9xJB4Q7oAd8kHfJv2mQwcy4p4gsocBpIoEO+t1Ub61SiyqnmUdDfOD56RoQC+HdocI7ZJE5PYOwljBc0f7UamGrr5CDtd4D2U81eZJoQSHcqdKDjY4EcPD0QYTdJvalh8ivCjQDEDGtmcPfowvvHzwOhyxcpqhElor04Pi2Cm/mzcZnu6fYZPuBIGPF6obddBJxJDJWeCqDfRZdj3wpzTfUniscBnu2HmZ4nB2mN+kLw7PtdEDGcEu4AU5E/Bsg9hVFxxrBbFceYdad8kYDU3HO8beg5rKXGuxBBilMK5sOHHsQIGfh70iA6hYNgbRFHZdtaU6wbrtxcbLhP1rShJn1FaQNV14jD3IbFPEcpvrE/F/+r8+1Gl0DOqdwCxQobzlYT1oYVvzjVTk2OfP1/9991zR1vb9EZcuPYPRqGKk5QT94UhBBlRAVYAb2r5FuiExzddtUsWeJRDFrge72BQnL6XwgfHyN93iX9nqoctyuEvbf/k5ikHXpsKr8RBYmCk7EwRgKQkvhfEpp+xxgMlohAQWzg+GsccST8AleUf8Zcn++hSrme98ttTd+C6bWBK+nQS1LwBlEGIG1dsWIQjJtiwbV+1J3HZWa2w3fJn3jc1XtlLCZCZbbKEeIAdylsECMa+gF5parwRnZNCialXR220fXTH+NPJnWzNzZbJ9K0QHh5gjWvn1QXIv3oPL8SGOevpFepjdf0L/g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(54906003)(64756008)(66446008)(186003)(9686003)(8936002)(86362001)(52536014)(6916009)(53546011)(76116006)(82960400001)(4326008)(33656002)(38070700005)(2906002)(316002)(508600001)(83380400001)(6506007)(66476007)(66556008)(122000001)(38100700002)(71200400001)(26005)(5660300002)(2940100002)(7696005)(55016002)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h9Jg+0GKvHCGmFNh3WsE2ppyJBvMmVdx6LkKVqOOKBTKBckZKhGkVTYLhEDk?=
 =?us-ascii?Q?GTdSl8jIKI7KKCpoTKdJEqpEbjqt8+sgJDRl4u2At6Xdd8L8OEObvu0NegCS?=
 =?us-ascii?Q?SIxE3hYDDG+LSVld68D0gXpCfctEiAVDoHyXy56QJ9EfsIVBAtBVM1YhpypI?=
 =?us-ascii?Q?2m2jjW3Y8dfwydp+QC7uAOACspUUqfZT0Bl1aZZh4D9zmqeZgholPLxLslA8?=
 =?us-ascii?Q?E33u9cP0yPTW3KR46jn/dy9dmySra0tM/ejPp0jNGnPn/jpAMfOYIwA4Ce0x?=
 =?us-ascii?Q?8PhF0K3eZps6N0XPVFFgc9Za1n1DcCXbPuPu1mYV25dMSiGzlEFivfN8AYCY?=
 =?us-ascii?Q?8ztihWTxzsYHg7E3t6a+4JB369XoXaI43PAMZGRaCIb9bhaNGOuNTlcX8IA0?=
 =?us-ascii?Q?rOQXeBh5dnDhWj+q9Ec+fYXMrw3rnOttIE5LYKaptKzV1b0F0fXNeLKK/4gn?=
 =?us-ascii?Q?woRYqA8GgYWJID0vr9wLo/h73GPe/USoWiNAnJmp5VqrbB9X3J4rv69JmBm6?=
 =?us-ascii?Q?979QPahyrxkE0wjEaKKhNk2ROA9kwPlpfGfWUKZvk4KLFnZJ9DPfjEp70/af?=
 =?us-ascii?Q?yStDiDWhJlgCM/hpvF0KoMFJWk/4UfnwQTJX2UUYqHSc0+UZRm+8zbav02jj?=
 =?us-ascii?Q?x6oKSVX52VQqkvqEfW4tR3rOcho3L75lWNH9hH3VmHZvFhYinPCusSiYeX+K?=
 =?us-ascii?Q?nzv45rl6vncnWdp+F3I89LpLe4ZF2+auPXBvbntGjrqpKfv9r/Mef4fEsB/X?=
 =?us-ascii?Q?3Fict4/SaREvsOtyRw/q6T4wM7u/0k50M/Q5B2gTCB2Pn57Pr7Kf//B4fMf1?=
 =?us-ascii?Q?RJgntUNGchNRwcq0JI48NwbwXOBSX0UREoN4+av+9Z3sf6v5DeDXxOHatK0w?=
 =?us-ascii?Q?1rVgCZ1drQq40X8kxKWP9R7qToSIgQtw6X7J5aagwmjV5Ym8iZBR6l73Hfe1?=
 =?us-ascii?Q?Rw3vLEw6JpJ+l97By2n8MkQ9WbeTG3cVgkSbUetNRQM9bBxpj+Ptyqi9hHWX?=
 =?us-ascii?Q?I+4A+4kNP3mihQbQRK8JpZWMTYsRbP+hSNmlIuG/lDOm9uTEyRwAkLdF0wmL?=
 =?us-ascii?Q?i6qj6jRmIAdr80ABGic0wcarq5cu7B6pu19QG3effGWWd4JrpNLvsalhOI6X?=
 =?us-ascii?Q?XLuPU2Q/HIXCoKXQUY6UZYyANgehxFbxJQOAidIjmkrmOD7JpNj1BbiQeWHa?=
 =?us-ascii?Q?hQ2y9cAODV05i3ZWB0BbruoM0TqH1UvzGzaVOlzR5/bnaMRjv+wILaTB+YtY?=
 =?us-ascii?Q?6nrUqOmlmtPMlWo41zPBAOEwCkiaZMPARWfeAA9AI15pW/v9S5QdItvgaMkl?=
 =?us-ascii?Q?DZBhkDva0x5YI+JVQ69iPqea?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598c03bb-ea52-4d48-287f-08d993195289
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 15:58:41.7333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tEsatJyJImerKMUK6UWbsB6gN75Fz7gS30Ldnbd32QRbd26G0sa5aGuXBmnBfRP4WZjtCELZTdI8y8/X+S1DnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Cao, Bingbu
> Sent: Tuesday, October 19, 2021 11:30 PM
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> Subject: RE: [PATCH v3] media: imx258: add vblank control to support more
> frame rate range
>=20
> Sakari,
>=20
> ________________________
> BRs,
> Bingbu Cao
>=20
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Tuesday, October 19, 2021 8:52 PM
> > To: Cao, Bingbu <bingbu.cao@intel.com>
> > Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> > kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> > Subject: Re: [PATCH v3] media: imx258: add vblank control to support
> > more frame rate range
> >
> > Hi Bingbu,
> >
> > On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> > > Current imx258 driver enable the automatic frame length tracking
> > > control by default and did not support VBLANK change, it's always
> > working at 30fps.
> > > However, in reality we need a wider frame rate range from 15 to 30.
> > > This patch disable the automatic frame length tracking control and
> > > enable the v4l2 VBLANK control to allow user changing frame rate per
> > requirement.
> > >
> > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > ---
> > >  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > > index 81cdf37216ca..2c787af7074d 100644
> > > --- a/drivers/media/i2c/imx258.c
> > > +++ b/drivers/media/i2c/imx258.c
> > > @@ -29,6 +29,7 @@
> > >  #define IMX258_VTS_MAX			0xffff
> > >
> > >  /*Frame Length Line*/
> > > +#define IMX258_REG_FLL			0x0340
> > >  #define IMX258_FLL_MIN			0x08a6
> > >  #define IMX258_FLL_MAX			0xffff
> > >  #define IMX258_FLL_STEP			1
> > > @@ -241,7 +242,7 @@ static const struct imx258_reg
> > > mode_4208x3118_regs[]
> > =3D {
> > >  	{ 0x034D, 0x70 },
> > >  	{ 0x034E, 0x0C },
> > >  	{ 0x034F, 0x30 },
> > > -	{ 0x0350, 0x01 },
> > > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
> > >  	{ 0x0202, 0x0C },
> > >  	{ 0x0203, 0x46 },
> > >  	{ 0x0204, 0x00 },
> > > @@ -360,7 +361,7 @@ static const struct imx258_reg
> > > mode_2104_1560_regs[]
> > =3D {
> > >  	{ 0x034D, 0x38 },
> > >  	{ 0x034E, 0x06 },
> > >  	{ 0x034F, 0x18 },
> > > -	{ 0x0350, 0x01 },
> > > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
> > >  	{ 0x0202, 0x06 },
> > >  	{ 0x0203, 0x2E },
> > >  	{ 0x0204, 0x00 },
> > > @@ -479,7 +480,7 @@ static const struct imx258_reg
> > > mode_1048_780_regs[]
> > =3D {
> > >  	{ 0x034D, 0x18 },
> > >  	{ 0x034E, 0x03 },
> > >  	{ 0x034F, 0x0C },
> > > -	{ 0x0350, 0x01 },
> > > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
> >
> > Why is automatic frame length control disabled?
>=20
> My understanding:
> If automatic frame length control enabled, the frame length is changed
> automatically when COARSE_INTEGRATE_TIME + 10 > FRAME_LENGTH_LINES, it
> may not meet the requirement - less integrate time with more frame length=
.
> we need control the vertical blank to do that.
>=20

If frame length automatic tracking control enabled, the CORSE_INTEGRATE_TIM=
E
could be larger than FRAME_LENGTH_LINES.

>=20
> >
> > >  	{ 0x0202, 0x03 },
> > >  	{ 0x0203, 0x42 },
> > >  	{ 0x0204, 0x00 },
> > > @@ -753,8 +754,17 @@ static int imx258_set_ctrl(struct v4l2_ctrl
> *ctrl)
> > >  	struct imx258 *imx258 =3D
> > >  		container_of(ctrl->handler, struct imx258, ctrl_handler);
> > >  	struct i2c_client *client =3D v4l2_get_subdevdata(&imx258->sd);
> > > +	s64 max;
> > >  	int ret =3D 0;
> > >
> > > +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > > +		/* Update max exposure to meet expected vblanking */
> > > +		max =3D imx258->cur_mode->height + ctrl->val - 10;
> > > +		__v4l2_ctrl_modify_range(imx258->exposure,
> > > +					 imx258->exposure->minimum,
> > > +					 max, imx258->exposure->step, max);
> > > +	}
> > > +
> > >  	/*
> > >  	 * Applying V4L2 control value only happens
> > >  	 * when power is up for streaming
> > > @@ -773,6 +783,10 @@ static int imx258_set_ctrl(struct v4l2_ctrl
> *ctrl)
> > >  				IMX258_REG_VALUE_16BIT,
> > >  				ctrl->val);
> > >  		break;
> > > +	case V4L2_CID_VBLANK:
> > > +		ret =3D imx258_write_reg(imx258, IMX258_REG_FLL, 2,
> > > +				       imx258->cur_mode->height + ctrl->val);
> > > +		break;
> > >  	case V4L2_CID_DIGITAL_GAIN:
> > >  		ret =3D imx258_update_digital_gain(imx258,
> > IMX258_REG_VALUE_16BIT,
> > >  				ctrl->val);
> > > @@ -1189,9 +1203,6 @@ static int imx258_init_controls(struct imx258
> > *imx258)
> > >  				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
> > >  				vblank_def);
> > >
> > > -	if (imx258->vblank)
> > > -		imx258->vblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > > -
> > >  	imx258->hblank =3D v4l2_ctrl_new_std(
> > >  				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
> > >  				IMX258_PPL_DEFAULT - imx258->cur_mode->width,
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus
