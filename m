Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEE2643BF1
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 04:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbiLFDmJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Dec 2022 22:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiLFDmI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Dec 2022 22:42:08 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39901D659
        for <linux-media@vger.kernel.org>; Mon,  5 Dec 2022 19:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670298126; x=1701834126;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EbUJ8FgShes7xO5WXc7lZpKnRaSHcHJMSkn5EIIAyMo=;
  b=i5NIZ4xEtRv7jTLfFCyhCjnsk5UyN2RCXQFXXJOE+ZEVocsGSrYGSXqP
   +BYCRVHT8EELpURKMGYuynTKfNzbqNueUK24VpEJu2jvIR18pQsRE7cUq
   FPNf4503n/ZDBgwXsPbOmlizoTlPEgGfMKzxABP7wStICcs9IHbAOB/8L
   3xORb3rRNFhFHnZpnYaICVS9kPamw8VX52sXK5Kp6EIRQ/WnaHHS7Ay4C
   MmuhCpieDaPTM8nb6myvdj9Z0EJYJcN261lRpNpsTVxZYXmh6uSmjKR6+
   sSMf3KyGOifFcNXHjvv5Dq9PKsVMCiRLWT37NKRqOxqJ39NnF9sgD7PR1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="380819006"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="380819006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2022 19:42:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="891220404"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; 
   d="scan'208";a="891220404"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2022 19:42:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 5 Dec 2022 19:42:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 5 Dec 2022 19:42:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 5 Dec 2022 19:42:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga6fKZWsnYapMtv5+n00dhqD4kX5I5IjBW4BrS9fQebgA+wN1f8fbxRf8w+7yZTYjBpzIo3ZHb8R4WJhjt3+HsHqf5ned/uew2As454YADZJAO7WECKMsdnPzwieS/2+3Ic1tr3gaXcBBpaXqFVWknJNY1QacXna2cZR/K2433AiuHJ/H4CSTOqNxbKv7rKeLjcrQ7nH658EFdbjMyd4GE6jTuyInGnbJ8H8eNeuifyGIqJfIQcV4kvrPJEBHG+n0/noZvla4CCBTsbzfgAhQhQ5vo/o0xKBFqj3sxfLPWTyi3o/j9p+6/7b176a13n8vhbQ9k8etG/Ruz9AneQqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjfQqbCDRQ2dOIcCRqOvlqOI23Qrzuo58XR5e13+5/w=;
 b=exo25w3Ye2TPWlKm7oi7xBWnxsRLrpfZZ4a1i65gx8WSk/Ly0AXOamj0l5EPB51RbOazHL7hjOGDhVtDrAcYMGy45Rk2Sjv/DWxmbtCUdUC5a7aEoN095HlL2Nkp8rsZrdvzYjBBCoHr/uWVh3LtF8dr44rdfp82nXvqeLIwn9PiWwO76YMy3r5kAFYuWVLGZq4AyZTr+8Oc73SXK9EvApscDSY9B5ZcfIGy+k2cg2miYTk9BB+coc8a12Eju1Sswf0eHlOX1ui8Zt/aDHw4uFA9dYc4lJ6Zhv9W/Dxd4YG/oMta7ZjQ45YWknaang9I9FO+OttnEjpbhvcBax9B1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.14; Tue, 6 Dec 2022 03:42:03 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4%5]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 03:42:03 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Su, Jimmy" <jimmy.su@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 3/5] media: i2c: imx319: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Topic: [PATCH v2 3/5] media: i2c: imx319: Set
 V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
Thread-Index: AQHZCL1t2DbV17F81EqJJ1Jkhhvfkq5gNVKA
Date:   Tue, 6 Dec 2022 03:42:03 +0000
Message-ID: <DM8PR11MB56532AC6ED60D4503E5AAB11991B9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20221205152149.1364185-1-dave.stevenson@raspberrypi.com>
 <20221205152149.1364185-4-dave.stevenson@raspberrypi.com>
In-Reply-To: <20221205152149.1364185-4-dave.stevenson@raspberrypi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CH3PR11MB7820:EE_
x-ms-office365-filtering-correlation-id: d1f94ce5-7efd-47bb-98c7-08dad73bd6f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jDs2kZpTUO/DgmP9lSHofgIqpFm+nYe0/GhjD9vdz7m0EH6esnOqa3wW6WLtI7ENefvw5ard4yRPNP8Ok/10BeNN2N3W7bZsy10I4Fub7SM7bYQnsRacM187TdvDyQ5+p5p5GGpfSmBvZOjdP/KzDQGBp5dO1DiKUntbQuewtdg1TmaF6W051GdA5l/iCU5sqJn2qLudTYbrFJb7oOYbnHfblu+tPfq+D7iyMGCZLnHQyhWQx1B+fgj4wIluaCLv4h7sz4PQFzbcW4Wfg6cNIdWIoesuRkvFKgT8daoOZ7Ok2anzrJ2V7baOq/rN4JNV4keqrqq044i5lCiVudoRVVAEUh42UR/2cBwXnSN/KaDsKzFnJOAWNv6CGxsX6hbV7HR1GH53RhqUeNBDX+Vn4XUNyS96HFQ7ZjW7r3y9EW2+SKOpqdWEpTkfDEKiqfBQ72KIK+xv2VBIx5N6jx2WIe3vgsibOvB5DwbTGOydSpgb4MfTqbjftngv5lj0hXH9JWXQRr/2D8W3vicj2edaWxtUWVSWopDVxJgA3+nPmN+V+15Z8eJEMjjHre4e4R3+QFf94BovqHVOIDMw3pWiKQzerK29Dfcraf1Lgq1iayAmb8+ilN6dvLjoUrYLkWHXUV8Yxf6TC5oZ5wcn5CDD0MIbNF40VMxsN9iZpGqDEnlYqtfBlZcbmtxD46x92F8QKt+ZHuF2CrivUyzXcIH7xw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199015)(122000001)(83380400001)(33656002)(86362001)(5660300002)(82960400001)(38070700005)(8936002)(2906002)(41300700001)(478600001)(8676002)(52536014)(55016003)(26005)(53546011)(186003)(7696005)(64756008)(6506007)(9686003)(316002)(110136005)(66946007)(66446008)(66556008)(66476007)(76116006)(71200400001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7SSH+cCu15Uu/Pdq17ujubMdhyqHPU/auU1VYm/0teBfefCe/Bt49XB7XaZ3?=
 =?us-ascii?Q?VWvekiusJbvqtdxofyLyJu5LqXOp5wKhgzx9gV9WaVxgDBzltn2UBvrly4be?=
 =?us-ascii?Q?nNWhmBOpkp/AJJjbxkohNPYfmSCEyVLLqZB4fpYqps75b/21aWJmW+EzxjUm?=
 =?us-ascii?Q?kgF8Vv8yShNm+i7rbczl42aLWFSf/n4EI53UWqA+OCbE6vscxJ9YjGzrXDIr?=
 =?us-ascii?Q?xxaLa2nx+DJFuC/h/5wbRdxA/OhY26J5cFbFzhch8BnegFvXQvOOh2wM5u5Z?=
 =?us-ascii?Q?f+zHRf5XDglfdPBsTGr/cwpmvLoS6Yi9Gq6PDtBjaAuQw8rygdC6KX3l0MA7?=
 =?us-ascii?Q?dtn3V0AVF5VEYrQDg4M13N2Yo95Quko1ldHG01wsHJVm3ScjdRtF5neaLnj5?=
 =?us-ascii?Q?X3URolMjykL9UU1YcJqwEM9ELndI6mk/+eMN4L3ruTnxXJbTJ/52vsOq2uOD?=
 =?us-ascii?Q?0DvrRbPcdvQlqArFUHTunvOHMwgX06BxrhjMhRYGOv9Pl9k6b9rAi5fv5khs?=
 =?us-ascii?Q?2RfgeQzmO7ENx/YS7jkBGCbxAM3p8oPaFUV9O0Ktm5cZlnKv2GFyRgI0URzr?=
 =?us-ascii?Q?NJWZ1CtSihzEorPj+TcIpIk4pyEtzLHATcm6/g1ycqfifEtH+50Uub9SRRb0?=
 =?us-ascii?Q?cRLvYyD1CDyrkmtMZiFJ3DGvRLz1YEInTXdQzMC1g7Nf85s1HuBD3dT3udK0?=
 =?us-ascii?Q?O8RcSM2EeGjNEZMTbi2cgDAPlP/DcaLeQTyLLV8GNOz7bC71KX0A04JY9VjS?=
 =?us-ascii?Q?G4h2/YQi6sbXKS995tbSzrqsGzs7q2bMcQQjqEzw1VtAd97nRXuY/oOQfy1I?=
 =?us-ascii?Q?DyJSOMsBZi3fDodlSp8H4yZCuG0LRnWM+gOCC+5YU7vnnpivfz24XMTghK5R?=
 =?us-ascii?Q?gcMLcS5Cr4xSt4epSefhVZj9hRsKlFXDO2GE8axVW1+azrglf4PQHBfFaq/g?=
 =?us-ascii?Q?S/1379m9RoCwzPX4iacS0vHYogUAnEzG/zlBZ7yst9bPX3FzabA4N1CCUaRY?=
 =?us-ascii?Q?6DJaYCFR4dLsbmO0sY33jS0j7OV+xPrm+vLwO8PPMQHgIYwi0N10sbG+lkaf?=
 =?us-ascii?Q?yCF9jRZVff7I/dBgShgoWglMhF6+U7H+P+MgYA793wJW9rozPe4+BBAzZGx0?=
 =?us-ascii?Q?cxTFD3aVTcq7lJ8N/sQE1p27qzoMmbkpHEeq1CtLFQAGNiGQyhPUhgerKTSl?=
 =?us-ascii?Q?X2FKr5gPrD03tQn6D90iivPqI7LCt6vzFMq6HEd3StRuzHRuh2Y0xu1zoZPq?=
 =?us-ascii?Q?Kku46a2VS8ZeFC801JUc12o0F1VaDcXisIx3EISK6aHzmFs4WFOpW8Oj8Siz?=
 =?us-ascii?Q?5fc7sNv8XgxrGyuOtinXMyvFiW61GKOu5bYCevs8idqA7Ehs/57H6mueIlgN?=
 =?us-ascii?Q?tau+KfkA0ybICYgTASCAqJZfxf+SONdlsauIJynW/mJKZaqBTd76HkqNWBPy?=
 =?us-ascii?Q?n4kVtrEF67G35otsTZeUfHP5VRxYROudJ7kj8yt9/otwCkBTjXZ8eBqYsuAm?=
 =?us-ascii?Q?gA3OGjWQOks5sDk+TLHhnN5uXn/FwTdVkLY91AdJE2Zapc3i5PotvnVaI6rv?=
 =?us-ascii?Q?0VutGmIkfHXhwWSmmlYyzGx9iaNzZlzdpHR5GCcM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f94ce5-7efd-47bb-98c7-08dad73bd6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 03:42:03.4856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XJO9QCnHUHkJHV8Z3b3NF9J26A1f7hzlPHahwLDEBrKEC+D0h4aFignpPq3nimP9wB4TPlUQXoFR3/QBetam3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Stevenson,=20

Thanks for your patch.

I am wondering how V4L2_CTRL_FLAG_MODIFY_LAYOUT flag was used in current
v4l2 ctrl framework, literally it means the v4l2 ctrl will change the buffe=
r
layout. From my understanding, such as 90 degrees rotation apparently chang=
e
the layout. But I am not sure this is also the case for vflip/hflip, user c=
an
notice the bayer order update from get_fmt.

Sakari, what do you think?

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
> Subject: [PATCH v2 3/5] media: i2c: imx319: Set V4L2_CTRL_FLAG_MODIFY_LAY=
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
>  drivers/media/i2c/imx319.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c inde=
x
> 245a18fb40ad..45b1b61b2880 100644
> --- a/drivers/media/i2c/imx319.c
> +++ b/drivers/media/i2c/imx319.c
> @@ -2328,8 +2328,12 @@ static int imx319_init_controls(struct imx319 *imx=
319)
>=20
>  	imx319->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
>  					  V4L2_CID_HFLIP, 0, 1, 1, 0);
> +	if (imx319->hflip)
> +		imx319->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>  	imx319->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
>  					  V4L2_CID_VFLIP, 0, 1, 1, 0);
> +	if (imx319->vflip)
> +		imx319->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
>=20
>  	v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>  			  IMX319_ANA_GAIN_MIN, IMX319_ANA_GAIN_MAX,
> --
> 2.34.1

