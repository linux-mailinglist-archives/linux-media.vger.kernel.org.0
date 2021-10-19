Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4848433AD6
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 17:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhJSPmV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 11:42:21 -0400
Received: from mga12.intel.com ([192.55.52.136]:36667 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhJSPmU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 11:42:20 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="208651561"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="208651561"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 08:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; 
   d="scan'208";a="444539236"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 19 Oct 2021 08:30:04 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 19 Oct 2021 08:30:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 19 Oct 2021 08:30:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 19 Oct 2021 08:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UYHcFAxBS2JNxZDjWfSDo5ZF4Yu/Qzwxm+h7PgDezLsmKdQqrUCQKWEBZXcs4ytjdgynlxLjmfIWBRYOHfxkh14kOSWF/rs+rYbeUD/+zy5VCIO5ZJDj8UhWkZKN4KgOkrZn3cbD+JnpVGg2lDFmVZDi0LrC74MzN+liLWsvaf4NbDA8jv66XE/KK9NCS6+EDQY7UO0hMIKLmyQEOPOBPt1rsySI9pZLhkrPI12LVRp5B6yD/qjpZ1fEqU2oFtfDLkLX7UEPyUe8x3mUcHLfu3BS3jWg+ILLZCa1MWNXmO8tS9zuiZrupOA+/WPOTraxq2JCysFHWyjwLXhX6lqcGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xK2Db0yUuKbwtBk1JCTNjFqETN14ToofIAjQWoaQx08=;
 b=B0Hv+iU9I+6KWk7NcCoeR7CLj45LAzN6gWn+GjWjbIrdlqZcPz2mflTJ4Hz6ibDvetQvQK4uWn4Y0mDl40P42zb9rDPKTWcRgB6RMSMpkOl+F82OqLvFytBlfjxeoWjGZn+49SHQrerTe14G9o5p28eJr6VvbAiH63gF7kD7b0EjSDuyXjq8NuRCF4puJWuF6S+iIJbJF+xTYuxXENJ+KpzfvtT/K8KwXp1W22dqeebyJz0MtBVynTbddV3XzoKiT2eDwfOFQM49H90tH00XFXumhtc+ig/DC5W+Lt4j9VQvJ+7iOVdTReSPtS0idhyqsuTVNRI9/nmkj+IfaqbFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xK2Db0yUuKbwtBk1JCTNjFqETN14ToofIAjQWoaQx08=;
 b=uajVF8IdsY9GXS2HgVArwFkEVhFnfSelR+SneHIiX8BbUepNIbC2sWyyLX4BthPjpqy6g15kWPfEZzxYapi4VrDUy7IXa08SKChYGLg8pyTQLVFMJ4gwqhqtaiGEn3jn+yqw8KjeEdn8J0ZZbRBOAqLLcsnkbAszBTZ9IDkjen8=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5607.namprd11.prod.outlook.com (2603:10b6:8:28::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.15; Tue, 19 Oct 2021 15:30:01 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4628.015; Tue, 19 Oct 2021
 15:30:01 +0000
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
Thread-Index: AQHXw9CEorwlFxevV0mGeohgDRS1A6vaSIcAgAAp8eA=
Date:   Tue, 19 Oct 2021 15:30:01 +0000
Message-ID: <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
In-Reply-To: <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
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
x-ms-office365-filtering-correlation-id: 9fb20d93-f346-48ca-5850-08d99315511d
x-ms-traffictypediagnostic: DM8PR11MB5607:
x-microsoft-antispam-prvs: <DM8PR11MB56076D19FC74D4A50B79D1C399BD9@DM8PR11MB5607.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Zhop93Rt7OfygVLGAhYnXQwF3LGXo8KHylgI7vaGWO5bBbkfhiClcszQCueEArKxjREdZa0G0T/seLJRszOP7qh9j26UHRq7lupMrnlF021BhWlTdhZbNlm5V9znf1Lbu4sCrQOlshpDS5l8kRE/lJYsYt81gcUTltEm85JdJ+aywj7yxBSHQjod9yEnHKB6ecWozaZFowxdl7p+MaT/dx55OxVelYXR394l0WBfRsiWDoTSSp+NzvOeUiPCi7EhvFJy4UPFLIArDRpkibqmHye5SjznGVgN43QE2R9h65e1NhmxSOdHQ6dPVZBfJB9gU/v5JhXhX9zigaRprBzIzO25a2vBbI5I0ytFDGogdrqTtBLqnfqAzxMJ71omyJtK7ihRvc7OF1JA2b2w1xXzwB5O8hnp0zFsMhrykhP9R7KUh+bFk952O9M3EF8/std7pq+wGFmHlmZbdAh56gYzOQKTdwhwGxO8gln9QWRJgx+kgM00IL3+7sN2luRW++HZJLP4J+kH276EduFL9yaTa2w78Ib6yAgKpvaFpCyRN7SnZ3GNTTKI5bP61iQeC+FW3M3SGBgQmVQ/YU96NwgM6NkkRExNhqIzzUg2IyaCh2d0O1YyVzJsJ59YuVGfwWFVEfnx5ht7EyFu7ZDSv+REbF7u35mLr/vtyQA33ozUCX4+V9ER1kGBjxT9pu3FSg4pLfIySh501g03xoKucj3qvQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(8936002)(4326008)(26005)(53546011)(6506007)(76116006)(64756008)(66946007)(5660300002)(66556008)(66446008)(66476007)(508600001)(316002)(2906002)(7696005)(54906003)(9686003)(55016002)(6916009)(52536014)(122000001)(38100700002)(83380400001)(86362001)(33656002)(71200400001)(82960400001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T9ytIKhlVOTdZA5QHPqwGlMgdnVz35M+HqJoceBzEMMzEDoK/hhFPDlFXYWj?=
 =?us-ascii?Q?uUGQvtbs7c4RB3G2IbmOM2S+qagUwwGNRFQ+86LmJ7nl5mABVr72xY1rtN3n?=
 =?us-ascii?Q?esL/YIkbWTketukR/lVZf8Zl1KHIY/kxytAPfC/xk8by4Sq0/vF1Rtw8NQXk?=
 =?us-ascii?Q?g90/5NNWjokdJuf2pdVlinMliUUFVFl0tKNiyBmno8b9D+iJygedi+bP5uGp?=
 =?us-ascii?Q?f5B+8dXBEXTWpzfyJYf4l28FUkSsFBE6zc569qb2y0Y+bqOjndELHYC0hwuj?=
 =?us-ascii?Q?Vf2Dt9gKCU561pNekPawLwhbi4GTzQvpOyBF2huVpfwGuIYqDEN38KE2Ly4+?=
 =?us-ascii?Q?w9fBmOLBAcPpxtAqZKcCeFmwcqGAZfXlk6O3WOJicWUuGkJ7C00QgKwqpq4F?=
 =?us-ascii?Q?pbWkrp97jhfS8axMuAaIUrFUQHUqfp1D35bFU9dtNuavxIqo4RAFm6XhWAFg?=
 =?us-ascii?Q?hM6XaUYQmNtWY70OkvssqV18vFGnqTJnmV1mkCUzKD+CDiNjPr4nGJDyNuSV?=
 =?us-ascii?Q?wwqaTn1CAJPdeSY8ZE2cCyDvqNAdWPvmB7/UHxxAvk7tDVdXlAxGnKEfNC+T?=
 =?us-ascii?Q?7gzYy6SdGzTkoXC0o62gjyszKf2/J4OdQbuZKEHJXJoDZGPvhjs6Er71OdEH?=
 =?us-ascii?Q?1CihQDkgVR/0rd9OudBpKUo0z8sWF1Tr6/aGtN6rlAjT5ULLjgD5NX5Z4hoQ?=
 =?us-ascii?Q?k/EfEn+TLHhAFSVCe+GxPe0CLuQ3R67CbxkAdkfOdl1zFonSn1pg5yuY8EO8?=
 =?us-ascii?Q?a3NewIcs5anRfyRrgzH5wibyaQBEJuJJfZgVNZ3yVCq2EmsBoSR/egEBgUW4?=
 =?us-ascii?Q?kPrVUIghHB8jAzrOKS63HUD1gbOsFvpjJpi7ZTxn14/iDHk/RBpNYZSQQuM2?=
 =?us-ascii?Q?mBgCQ/kY6fmU/6Grv3YY2BWME/R2VoCmtRWFMD8ZOOMzWlMyvQn645BoQ638?=
 =?us-ascii?Q?ya/ryxjvJ1PgyG1+9If4lsDtrgEtNjsKQ4N9LAA9byMrBVmUCDH1bN1VDVpc?=
 =?us-ascii?Q?XtpD8hxtu9zmMRNbzDe8Gj4bka5HaZaa/3KxMr9MXesA84+1wjf9K0B0IrId?=
 =?us-ascii?Q?IjTHtw4hRnNa/Ysqq1M+8WPLlJ2JrsFXhLcpdgp7HLEFvofqc8bD/rcNO0d/?=
 =?us-ascii?Q?7aQslupAT18FKGkjKykv+4XX4iDPWqzt5FRTG0OnbjNnx4N4F6vy/MfDRN+4?=
 =?us-ascii?Q?DKrj9koRoeGJf/5HLzoT75krjmiO7+/1V7zpiiXX3JZtgspu97dRqLlKd2oy?=
 =?us-ascii?Q?tqmALJGUPDMKzmXjOrKZyCvkSMN54fgyEMDiXxKj/tZqNPWGda3E4lsqQ9Sg?=
 =?us-ascii?Q?/YcR6uFA37lwwnEQH3lFcGM8lc5hQOtGc8I9AOIdiDA7GFL9YBl2KvqyrOPZ?=
 =?us-ascii?Q?LPx00OguULpCFsRutDM08/CxBV0PalnemQdoUzFe/U7bJ+4KsMsVK4rUxogf?=
 =?us-ascii?Q?frscVTy9rSy8+rj8jUpA5UXNlIOxnTOooSC25o8u6vFrZn634C4GovVvSn5w?=
 =?us-ascii?Q?82+zME1reWOkRN+AhStoH6yqRQPXXPZQwvLKEf03LK5mjhokhQeYjPJ1hpYt?=
 =?us-ascii?Q?cxZLOcCnuH5mlk3HPz2E9Q1JIcm0Ng4Vi5FOMDQtRIzfOw9xYan+WzeOgzGh?=
 =?us-ascii?Q?N99VGX6TICCDWSl0FsVjZOg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb20d93-f346-48ca-5850-08d99315511d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 15:30:01.3363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGnniNadz4YcvYIZf6knYe1vOoNbCmUNWA5f0t+3Cj1JD0pewFNr7tsE+3Pi6FJIV2mc973xaHS8WPuJIeb9jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5607
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari,=20

________________________
BRs, =20
Bingbu Cao=20

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Tuesday, October 19, 2021 8:52 PM
> To: Cao, Bingbu <bingbu.cao@intel.com>
> Cc: linux-media@vger.kernel.org; tfiga@chromium.org;
> kieran.bingham@ideasonboard.com; bingbu.cao@linux.intel.com
> Subject: Re: [PATCH v3] media: imx258: add vblank control to support more
> frame rate range
>=20
> Hi Bingbu,
>=20
> On Mon, Oct 18, 2021 at 11:26:16AM +0800, Bingbu Cao wrote:
> > Current imx258 driver enable the automatic frame length tracking
> > control by default and did not support VBLANK change, it's always
> working at 30fps.
> > However, in reality we need a wider frame rate range from 15 to 30.
> > This patch disable the automatic frame length tracking control and
> > enable the v4l2 VBLANK control to allow user changing frame rate per
> requirement.
> >
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > ---
> >  drivers/media/i2c/imx258.c | 23 +++++++++++++++++------
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> > index 81cdf37216ca..2c787af7074d 100644
> > --- a/drivers/media/i2c/imx258.c
> > +++ b/drivers/media/i2c/imx258.c
> > @@ -29,6 +29,7 @@
> >  #define IMX258_VTS_MAX			0xffff
> >
> >  /*Frame Length Line*/
> > +#define IMX258_REG_FLL			0x0340
> >  #define IMX258_FLL_MIN			0x08a6
> >  #define IMX258_FLL_MAX			0xffff
> >  #define IMX258_FLL_STEP			1
> > @@ -241,7 +242,7 @@ static const struct imx258_reg mode_4208x3118_regs[=
]
> =3D {
> >  	{ 0x034D, 0x70 },
> >  	{ 0x034E, 0x0C },
> >  	{ 0x034F, 0x30 },
> > -	{ 0x0350, 0x01 },
> > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
> >  	{ 0x0202, 0x0C },
> >  	{ 0x0203, 0x46 },
> >  	{ 0x0204, 0x00 },
> > @@ -360,7 +361,7 @@ static const struct imx258_reg mode_2104_1560_regs[=
]
> =3D {
> >  	{ 0x034D, 0x38 },
> >  	{ 0x034E, 0x06 },
> >  	{ 0x034F, 0x18 },
> > -	{ 0x0350, 0x01 },
> > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
> >  	{ 0x0202, 0x06 },
> >  	{ 0x0203, 0x2E },
> >  	{ 0x0204, 0x00 },
> > @@ -479,7 +480,7 @@ static const struct imx258_reg mode_1048_780_regs[]
> =3D {
> >  	{ 0x034D, 0x18 },
> >  	{ 0x034E, 0x03 },
> >  	{ 0x034F, 0x0C },
> > -	{ 0x0350, 0x01 },
> > +	{ 0x0350, 0x00 }, /* no frame length automatic tracking control */
>=20
> Why is automatic frame length control disabled?

My understanding:
If automatic frame length control enabled, the frame length is changed
automatically when COARSE_INTEGRATE_TIME + 10 > FRAME_LENGTH_LINES, it
may not meet the requirement - less integrate time with more frame length.
we need control the vertical blank to do that.


>=20
> >  	{ 0x0202, 0x03 },
> >  	{ 0x0203, 0x42 },
> >  	{ 0x0204, 0x00 },
> > @@ -753,8 +754,17 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct imx258 *imx258 =3D
> >  		container_of(ctrl->handler, struct imx258, ctrl_handler);
> >  	struct i2c_client *client =3D v4l2_get_subdevdata(&imx258->sd);
> > +	s64 max;
> >  	int ret =3D 0;
> >
> > +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> > +		/* Update max exposure to meet expected vblanking */
> > +		max =3D imx258->cur_mode->height + ctrl->val - 10;
> > +		__v4l2_ctrl_modify_range(imx258->exposure,
> > +					 imx258->exposure->minimum,
> > +					 max, imx258->exposure->step, max);
> > +	}
> > +
> >  	/*
> >  	 * Applying V4L2 control value only happens
> >  	 * when power is up for streaming
> > @@ -773,6 +783,10 @@ static int imx258_set_ctrl(struct v4l2_ctrl *ctrl)
> >  				IMX258_REG_VALUE_16BIT,
> >  				ctrl->val);
> >  		break;
> > +	case V4L2_CID_VBLANK:
> > +		ret =3D imx258_write_reg(imx258, IMX258_REG_FLL, 2,
> > +				       imx258->cur_mode->height + ctrl->val);
> > +		break;
> >  	case V4L2_CID_DIGITAL_GAIN:
> >  		ret =3D imx258_update_digital_gain(imx258,
> IMX258_REG_VALUE_16BIT,
> >  				ctrl->val);
> > @@ -1189,9 +1203,6 @@ static int imx258_init_controls(struct imx258
> *imx258)
> >  				IMX258_VTS_MAX - imx258->cur_mode->height, 1,
> >  				vblank_def);
> >
> > -	if (imx258->vblank)
> > -		imx258->vblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> > -
> >  	imx258->hblank =3D v4l2_ctrl_new_std(
> >  				ctrl_hdlr, &imx258_ctrl_ops, V4L2_CID_HBLANK,
> >  				IMX258_PPL_DEFAULT - imx258->cur_mode->width,
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
