Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4464264428A
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 12:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbiLFLyC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 06:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233702AbiLFLyA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 06:54:00 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B83FB876
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 03:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670327636; x=1701863636;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=lhLvHDW+qlURmfRoHVa09wrjH5tffd/KMqn7B/txvNM=;
  b=NI35eEcEZVCGCRAQ7JX8VGWyaapAYPphfei67xuy1QB/7tRodBKTwpDL
   H215ACKrMXtQ31DO4tZHQqzwCVW781pLr9r88m1Nf4yQSqwa58/P5lvkP
   JsTV3a0YMbnMlejV+vsX6ock+hMsFgZza67FtPjXv6/98KVxWnpBwAkjU
   bEL+9KyGz44C+TtISkHcO9OmBhuWhhT8evHYMlxlgGXG62RdRW0bcTC9w
   uktekBuzb5QRPfbcACVGlzDvfMsnn2vYFJn9d+aBtV1kDR9Etz5WDD5zH
   sCT69G7Lro/70m92M7by4ea2D9wNTkViHyIJLE04nEoNuATQy/HnXRbuO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="314248186"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="314248186"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 03:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="646191481"
X-IronPort-AV: E=Sophos;i="5.96,222,1665471600"; 
   d="scan'208";a="646191481"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 06 Dec 2022 03:52:58 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:58 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 6 Dec 2022 03:52:57 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 6 Dec 2022 03:52:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc4CwzsrKACRCDagyJcL+A61vwTYzH4LiIZZBiKCP5zo/ILkSXXdr3cqQyTipkY9ewQIs0eHmjXkHD/FWAST0ZOqyjggtEpVkVRlPDVPcAY7XsfXSRVjNG9/7OvGuHzDN8SDzxiAtKHYtPRPkZNe9R/4Du/oEdzQj5uTFVBA5VTSzgsA55E5NRWEpxtIhQGn5G2AtiIMaM0AURL+FLIXsjLkjB/d86NOiCoKcZYY9cW0BkjpuaJasS/P2hxXe4MqlfNq4VTIBJF0Q+vAifqAzkFxUF6xw0dMSF1Nhp/dZ4wq8a4m1sdIduaPXnDecwWGuFFAXEVjVITEDV6r/C9ACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWLtAOuSSChELvKAKW66F8/4X7Pqn1ADL2R1nd4I9Zw=;
 b=KqVjJ6Rqd8mrS+fABaqeaNlB8KnG3eQYS+YOc/E/uJHGKXZbR315qWqbybIUxacJCg4jtzU1jrKZkx9tBNr2KCTXwvn3MTYap8tB4d/C0nkTuH3AQJa9ALNo5I//6VBgY6MiexrJSa1Q6DpHR66O3fTYWOD4V2hapbRkr3naduj8DRDhw5MjyrNs5wsyLv2gIXlyieIamHDyasVdKzwAghjnLGCnFWocwJgyZEKux7wmRDiFAeNI47yTrQrRTSvdeN3dsXjOX4uc8KG2SPvjgz3pLyYzMTl396dZKHIsiY/ow9F4MViwnBPt3kAt7OYwAshJyVJgmiEQg2a3L+iVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 11:52:55 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 11:52:55 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Su, Jimmy" <jimmy.su@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] media: i2c: imx355: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Topic: [PATCH v2 4/5] media: i2c: imx355: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Index: AQHZCL188d6YEhhNHUKuRUSk3tSRq65gwQjw
Date:   Tue, 6 Dec 2022 11:52:55 +0000
Message-ID: <DM8PR11MB56531091C14A6C78996359DC991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
 <20221205152149.1364185-5-dave.stevenson@raspberrypi.com>
In-Reply-To: <20221205152149.1364185-5-dave.stevenson@raspberrypi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|MW4PR11MB6763:EE_
x-ms-office365-filtering-correlation-id: d1f744a3-444c-45ea-57aa-08dad78069a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HwQTYX1aSKzpWSFNeb1SffdewavnhnAHL6mVj418Ev8pCmmGDVgjh5xN7Uwq87EFPXXh+0Zej7a/nYrv2Q2Jtlw0Tg/gg7Aa9lapxMxROI3oXxAtWuPOHUDCEXFTJh/H8GY7N+qqYr1AaWkR9fou8vWGa+v9l2qW2Ln63wlCh1gFHClLu7RVYryG+6h+qAZBTUELb6qcKFDe8ErcIQ2mXf0Iha9gumB2GCJI2FTd+/dQeuQWcUbWbFXovz4B7grL9dQpnWombl4W6f/FeGAjw/5scvoYb3Mx5u42LANuhec2qxIxb5im4GdxcxnlFH+FtG71NgDRpOCPZS5T543SoIsJ5/d08TPhdVYFKR2ORV/UXKp/cJxD+Q35ALJaUmKto3utdHrnlVCa1J+jSGiB5UHGh7nCcFAjkjeH0fN7membM1ER2vXI/4LJpf0nZy8YJECpsyhCREqTMeqEq+4IpbyREzeNOZuiWY2mKEK6/VgyLovv0DITi9AuFCwvwMnWg5Sk9HcYDKK/z17cB/R89kMPsrxUyM8dqQgo9e4vSl8338Oe90KyI+hlTpz5j1FkozrLt+B/EqjCZiXfc4LABryAwaawarnEDcmtiw1Hr6YB9/V0p+JZ2agqUljS9kJbsgMmxtUvWsCcFkgZRu+SwsJE8YYgJeHN2CWehBOwVVvcrYefzBPHte//ydfZSOvxnM17ZUE4VV3MujRIzh91Vw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199015)(55016003)(66446008)(64756008)(76116006)(66476007)(66556008)(122000001)(66946007)(33656002)(8676002)(478600001)(38100700002)(82960400001)(2906002)(71200400001)(186003)(26005)(86362001)(110136005)(83380400001)(38070700005)(6506007)(7696005)(53546011)(8936002)(9686003)(5660300002)(52536014)(41300700001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TPlhm7xIhF3VmDhjPhPk27DimSGLW67vIPWb8BZ0s7cCj8p09T0s5ZwMBwEy?=
 =?us-ascii?Q?meKg8RVL1hvJNqiRbDjWUaC2IjrUEL6LfurW8Ai05MEYc8Jv4OcIAu7Y4IY6?=
 =?us-ascii?Q?knBvRV68JxxeI8z4qXU8JqoUvFEIRhQC0d1WGjs7nab9SbUu+7fJ/ZP/RHTh?=
 =?us-ascii?Q?uYPqc1QqgZJgSf81DCOcaidZ5haUJnn6vVDTaw4R8wHFdsLi2j3Qg6/aqAd0?=
 =?us-ascii?Q?F37z6Zsih85AVkEaKesZs54z5dQWywFrrAUI66AwTbU/o9Yg+rCVaAbbPwmt?=
 =?us-ascii?Q?sDj0az+b7kEBpGrqC4qmzKpni8jxI1YGRT3lO7w6f0ZM6qX4iB8Nscgvntzq?=
 =?us-ascii?Q?K+SqVErz56vFoJ0h6rojsKTDIUQaFEurlWfhwmzBYztD9gtBszAyYmIDKwve?=
 =?us-ascii?Q?LTgEwnogAmMCfasd53YeYopY6vGuvQdsvMpDMUhg0/Pr4cBYUyXbrr+v/MxI?=
 =?us-ascii?Q?DcKLbQUPrTIvp5jbc7CiaAPDE1zRO+uz3o9RyQynKepyPxOwl5HJbo9iq8qo?=
 =?us-ascii?Q?95pSTGET7O7jDfzjlza6Ur7DeqDgBkqQJArjHKhlLUeVIGddd2wNXR9S0Lvy?=
 =?us-ascii?Q?XR6r16R6Ol2qSeuqg/2GCCbT8GPvhBNfxx24OLKxPOaPfIj5NfFBZLql1lt0?=
 =?us-ascii?Q?U5oyIKoUDCUGVEPT+ehdNDZFuW1r44pGhWy/tGIn+Gn4JaH6wzPZF3kJ0/Qa?=
 =?us-ascii?Q?N/7WeVftebbhQinHnUErtIRHorHVqcfrZ+nZjaCHEhxDwYq8gAHosXqSHZyo?=
 =?us-ascii?Q?W7asorKzjYibiA7+23Uy9cvLsLRyVU9pe48//ilhUIvP40+uMBP1EMoVxBje?=
 =?us-ascii?Q?lrLiTDloeunBBYsmjnCTeIL95ICX5qXKF7WyAFB4JN/1ZaJQoQ7Ein5yzSMg?=
 =?us-ascii?Q?mG+KsOM0q88jlmAMw7/0xs6el5uMrXhhm7wkBJcaA77hDgoGs+e/vISUS5GM?=
 =?us-ascii?Q?/tcOamfq4pNCH1Z7KpnA5aGhFH2WO964MqVMOa1Q+3GMTj/oBmKvp2ZzjsZg?=
 =?us-ascii?Q?MfpS096TnMbOVjnhPxy4gJG0wFeAwWAw4qAM9gjhS/exBYyGp4R+LpPrORMP?=
 =?us-ascii?Q?7A3Mkw10uzJlOtOO32EMPoI13EjQrT8DtIHkv+riN0tVxbCrUBQ+qHvMnJh4?=
 =?us-ascii?Q?cPSlrCu/htkGieU2CwhBqidT6JjmU8JerIqZMdbjqIfNQgrXBeWjjZdhxQgA?=
 =?us-ascii?Q?f51LTvRr/3pHYtWM8xmLZ6CCcBDfuKGRWvG5dFF9+ypUiUp5VamNIHi+fsWT?=
 =?us-ascii?Q?7SBgahp6dK01POjWnX6g36KaDm6tc7jhZ8BtqLIVbqdFkp206n1ICojo9o6s?=
 =?us-ascii?Q?FPsFCURWcSNPk5oA9YZPG+Oyuq7miDepV0QtJuxi8BHynRV08vyzVf0Mh2ia?=
 =?us-ascii?Q?Tk1Ioie9iaRFaCyibMSk0ms32WJzO1y/6jncE5z6zg27Xl63Hz+HrhIqtgFZ?=
 =?us-ascii?Q?zAi2WcpUJeetHuY2pYtOL3edUERE6MErxvaVLAV1Cu/+QBSs+82pmz4tNimz?=
 =?us-ascii?Q?43uMMsQgaYN6qtKf0MxZ51eGHkBXj59wkE6mUZkYxb5oylTjaNZHSQoCZEJy?=
 =?us-ascii?Q?9hAto5jIecfPuQwpwChrSDKPEWALH2jQuJv+RLFX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f744a3-444c-45ea-57aa-08dad78069a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 11:52:55.4288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xCkqX+1NxmjLIUULHEWzMfaKAgS1U2dESQyeNx0YX1rCJJx49XaFBvALQLrO2v5EjXWXFiHahuDdCA/MNBuokA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

________________________
BRs, =20
VTG - Linux&Chrome IPU SW
Bingbu Cao=20

> -----Original Message-----
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Sent: Monday, December 5, 2022 23:22
> To: Rui Miguel Silva <rmfrfs@gmail.com>; Sakari Ailus
> <sakari.ailus@linux.intel.com>; Cao, Bingbu <bingbu.cao@intel.com>; Qiu,
> Tian Shu <tian.shu.qiu@intel.com>; Su, Jimmy <jimmy.su@intel.com>; linux-
> media@vger.kernel.org
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Subject: [PATCH v2 4/5] media: i2c: imx355: Set V4L2_CTRL_FLAG_MODIFY_LAY=
OUT
> on flips
>=20
> The driver changes the Bayer order based on the flips, but does not defin=
e
> the control correctly with the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
>=20
> Add the V4L2_CTRL_FLAG_MODIFY_LAYOUT flag.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx355.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c inde=
x
> b46178681c05..25d4dbb6041e 100644
> --- a/drivers/media/i2c/imx355.c
> +++ b/drivers/media/i2c/imx355.c
> @@ -1617,8 +1617,12 @@ static int imx355_init_controls(struct imx355 *imx=
355)
>=20
>  	imx355->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
>  					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (imx355->hflip)
> +		imx355->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	imx355->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops,
>  					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (imx355->vflip)
> +		imx355->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>=20
>  	v4l2_ctrl_new_std(ctrl_hdlr, &imx355_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>  			  IMX355_ANA_GAIN_MIN, IMX355_ANA_GAIN_MAX,
> --
> 2.34.1

