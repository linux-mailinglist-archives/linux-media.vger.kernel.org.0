Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952FF284439
	for <lists+linux-media@lfdr.de>; Tue,  6 Oct 2020 05:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgJFDWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Oct 2020 23:22:38 -0400
Received: from mga12.intel.com ([192.55.52.136]:61200 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbgJFDWi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 5 Oct 2020 23:22:38 -0400
IronPort-SDR: xN80ggBTnk2s+KXO5FLY7yVwonqfKLMFI5Dsw5rLSNdum/UJ7p63JInxyAbq1eH0K7h0pQ1xPo
 9GHCc5F2dmaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="143719515"
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="143719515"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 20:22:38 -0700
IronPort-SDR: pT9iXre9Jqwzyx6zuAsQfhPx3bEqXFkkKIL4mEgKcjLdyNe/mSG7p/dE9kOIGIjWcNDXUHh7nL
 p+PQlh7fGJ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,341,1596524400"; 
   d="scan'208";a="516925277"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
  by fmsmga006.fm.intel.com with ESMTP; 05 Oct 2020 20:22:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 5 Oct 2020 20:22:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 5 Oct 2020 20:22:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 5 Oct 2020 20:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7SOiFVvGrR7qknaGfJN4oEbHNnrThsI1CqSWTxhK1TxID/sBBlVzHxxoiY4lubuYd48Gg1++YtpCjulXVclWok4CsmSFSOoy1F2DRVnZvOVJXNb4VRcZlUuSrzeyFpAh55b7j71P4TKVA4DEUc7ODTwOu38m1buWjDPu0QcxSCSNCs0SKelG1wcgFJ12JQE1e757nwGSG5wNocPqrB9ALm806Ut/QkOxhNjW3sq/nnzJHsghppW2Su6SIVUMZl5dUa/Q5daY5mfuYn1VjA9frA5MycjHDav09gJb7QeQOMg079yzlvRZwibgLLuNPJ8N7d4hHqdId+tdtPPSSc06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZap2kNmkNjjsAX8NYdCnIdKSaEleSyKfqVRQHLJT1I=;
 b=HDZToB+j+xKraHNyzMWQ4ZCCDY2KQHIXo1wsxw2Ece7Eo1LRAxSKmV97UkoUYehNkxTGbW7xA9By9x3eebNG0QL/h+fscjT5yX+WTJ9kdQVeeeClh6Ud3LNVJ+HmZJLW4/gB8dbCygkUhBKGBnIMN1YHjhgPb8CXzJhMmqNWDBti6yeLXq+4IU77QzgYIcp85nNBf9rX9Lel5rJRlypAnvCQoAJ2JoR0I4oJ4txNn9EHvoY5AAtHMhh+J/zh6zphXi5pJzsNfIyzlYpOZGKQTw7iaV3aYjuhYPQM+vSZkTqIh41y5Y01KeLqO36vD2CpKGWU3tcUQr8e2s90fdDkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZap2kNmkNjjsAX8NYdCnIdKSaEleSyKfqVRQHLJT1I=;
 b=BOXApySzXgSD7xmzTO0cwAF3s+RlOezurgeO6oVuIhFl+aK+ZJcOynkUHL6IoCH08CQU7XZ0+6qRCqAxx2KV64X3LN7XhxQpdoIQnktmw6V3EQ19hjiYu+iA1zEjK2SVstnMHm5Me8ZuU4a6f9qUga4Xt8FlfDAhCf1s87KFGrM=
Received: from DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) by
 DM6PR11MB3292.namprd11.prod.outlook.com (2603:10b6:5:5a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Tue, 6 Oct 2020 03:22:35 +0000
Received: from DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21]) by DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21%3]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 03:22:35 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: ov2740: select regmap
Thread-Topic: [PATCH] media: ov2740: select regmap
Thread-Index: AQHWlsbwPyG+AAYGwUOM+lO0BRzte6mJ8jCw
Date:   Tue, 6 Oct 2020 03:22:35 +0000
Message-ID: <DM6PR11MB3995D488E86C6AD842AF090E990D0@DM6PR11MB3995.namprd11.prod.outlook.com>
References: <20200930011322.97179-1-sergey.senozhatsky@gmail.com>
In-Reply-To: <20200930011322.97179-1-sergey.senozhatsky@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: caa0805f-ec47-4a90-a8a6-08d869a71210
x-ms-traffictypediagnostic: DM6PR11MB3292:
x-microsoft-antispam-prvs: <DM6PR11MB3292D30CF983F6E5EE0B426F990D0@DM6PR11MB3292.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:765;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NYwTt022RG0KTrSjlFG55mNgrhlmDc+vhxd10x1ZF0up0o8IZ+ByNWN8PJK+Gva7VY8CjpMJktCVGIVSl8UVfK2qXlG3np2ktL/flciEOvMYkscekDNEO8M0S+odlAKRrJPVG6tURughxUo/f3q0aU4npOVCt2mgXLDqfH8gXcSnQb0z20wQ+kSUUeYvY3G5XMkk2Xf3NrqqY9BUNpdWItm3YZL6bG0HPRrLgkNcJZ7HYl8u5cF5r2k1mrBAGVX2K8WqYHp5NLIklb2xElRMxBUDsgC1OEHUE1sHdW4AZ9a8NTLUJ4To29VJMADzxncoI+mx6WoPeESYp9JNfHIQHQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(71200400001)(8676002)(76116006)(2906002)(53546011)(52536014)(6506007)(66476007)(33656002)(66556008)(66446008)(64756008)(66946007)(478600001)(8936002)(186003)(5660300002)(4326008)(86362001)(83380400001)(316002)(55016002)(54906003)(26005)(7696005)(9686003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: xha+yTBokBYuRdekTmdfmppjbCXRwGjlLV5APqhd5JfguJVCQBhkoOkTiPDPrBbczzMqmQbfStwWiZaneaFIdqSAUhMne0whlhPN/macQfWFlL78PEb8onlJz66b9NGpArKEcAR9MLJ/C6rR4P38BX//bnTLzvNtx+1ukt6yEgf6ysymEdgu3NkLQEhqX7skjBBH9r/60RUFYHwyVHg2IxtTc5rYO9RchcwcMSPB02bGp4NrKgOvvle1imGTTdVA6Z5peGzCnbCDMOAmNlacHyTZ11uFBzq5MbdkgSlWlLJ1MgA2EYo8BsfGl0qYSj2NLa8wYWyRaWiycN4krzbdDWcZZLUd8BsE9uSafSNzBzh4AJsUbq1yqQ7StcHz+GdODlkSGwCl2hdDNuNV5HhAH3gokZ1wrY3lfC9W+JRw0p8fuvHFiNoFMhSKRmNlPQs2bwN2K09PL+B2oxwMgSdb6qjU7Jfsgn72GXW5qVAPUK+s2z83qcNbSaoGWrgY0+b9lVt+7uRI+DrC4B2R8uVv/mT1Nq/vWn69rcrmYz+EvGMCm/F5Dia+eoyKo5fmwCv73IEnYw1+TF6MZWtKtoEVxs+fW49n66iMnpW2UM6yLSfAneGkt6vfQkAk8cj7LGNs32Z4NFfPojdYQzCKfFBerQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa0805f-ec47-4a90-a8a6-08d869a71210
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 03:22:35.5072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epEuPEeRu9uyzR4k17WPI37XQjN9CctccEvzj+AaPKlyHno7/3GO5rfjHoSEuQi7n2VtlevWmGsBWwe3Gk7Rmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3292
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sergey, thanks for your patch.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

________________________
BRs, =20
Bingbu Cao                         =20


> -----Original Message-----
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Sent: Wednesday, September 30, 2020 9:13 AM
> To: Mauro Carvalho Chehab <mchehab@kernel.org>; Cao, Bingbu
> <bingbu.cao@intel.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>; linux-media@vger.kernel.=
org;
> linux-kernel@vger.kernel.org; Sergey Senozhatsky
> <sergey.senozhatsky@gmail.com>
> Subject: [PATCH] media: ov2740: select regmap
>=20
> Fix OV2740 build breakage by selecting REGMAP_I2C config:
>=20
> ov2740.c:1011:23: error: variable has incomplete type 'struct regmap_conf=
ig'
>         struct regmap_config regmap_config =3D { };
>                              ^
> ov2740.c:1011:9: note: forward declaration of 'struct regmap_config'
>         struct regmap_config regmap_config =3D { };
>                ^
> ov2740.c:1028:11: error: implicit declaration of function
> 'devm_regmap_init_i2c'
>         regmap =3D devm_regmap_init_i2c(client, &regmap_config);
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> ---
>  drivers/media/i2c/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig index
> 878f66ef2719..c64326ca331c 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -877,6 +877,7 @@ config VIDEO_OV2740
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select V4L2_FWNODE
> +	select REGMAP_I2C
>  	help
>  	  This is a Video4Linux2 sensor driver for the OmniVision
>  	  OV2740 camera.
> --
> 2.28.0

