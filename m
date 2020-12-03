Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC2072CCCD5
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 03:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgLCCtt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Dec 2020 21:49:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:53773 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgLCCtt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Dec 2020 21:49:49 -0500
IronPort-SDR: MFHZQifRc9aJ4QQ+9i3g8SggweFW/ISwsbJ3ItOeVLuJ9jGlX3BHQghWqFsCptfVseWuv5AL4j
 Y1hLg1TUApGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="191347433"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="191347433"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 18:49:08 -0800
IronPort-SDR: Xx7w9Wj5VhHz+mrRutP/NdB5S3sotgb7xH8OD8oumnEscoNDoTECYd4VY9/rzuerarpJlrLRnM
 ujnUM/IThOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
   d="scan'208";a="365566447"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2020 18:49:08 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 18:49:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Dec 2020 18:49:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Dec 2020 18:49:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Dec 2020 18:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXzyn9TyKQwLyBJFpcAsViDWuw4KKp4JpZoWja9QtEFKoMM89Zo4AckUsRa8AjY5op53jJJusT6w21HLRPsKXrOW0vqlYlELtNJJGP742of3IDEk1U2oS262/W5DbOCsDRiKaMlOuGoVlWm6piRUXNM9VSYLKlSUgnwTDoXyWNpWkkixMhI3D+em4tGtusp+iY5GNCS7SNfPxy8WqTRa6z8UkqSx3Op4NEk7j/tSQzaq+drkSFmV6lGsDvWYWeXRWhsDxuk2Lu62bn/lu7PUFgGkLbR3Xjfwhr1vuJWdlzpw7oGJfLMM8F6mpQVSfhoWMQw5oeob+eHYVbn9kBwgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEcAMQgCsAZFRtZNgRiYN9EELse5gk0txW57PpB1O6I=;
 b=nLB51OoX5iHCwgS5QpbE1Zo+4hn3m3Y7N+WDvWZGBUbW825mTAy9HBIlJW0aUdtLur3/kWP6nj6rlPNMuSMB54aLFZr0gkt/XdVtFrftWlUOiOIWDpDS4eGRhSeIvehRQP2P3HkTbpqmdeyvgHEhweT4jt+YOnMFEXf98BaywLfjQVTuyS+Z90/22Px52cIBG7zWcrM715T10CFX6XsxdveWhmfj9lJCX1yAr5XKT9gZhp8+o/Po0TpJVIrKk3eki5e7m79VimUCwj43Vl/Es7o8kWZDB3nbWMG4nUC2Cpu52mgTfhAoyVr1Va5xPhuIA90h1PpbD4dguIRIzKaG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEcAMQgCsAZFRtZNgRiYN9EELse5gk0txW57PpB1O6I=;
 b=EifusiKLhcEWLuRvXhS28kuOIsAT3VYHQAyW/zQuj2AO+pvd2himLww/7Su10VJ+7umUtdCx3HoCi4GeSGyPEy/Igmesr1SmbkevERXOJxfi26mR5aUwnzwoDAE28o1bIQW6mC2SMxHx+oqvoO/p7Faz//PtjC0rqEU1zuYAZ5M=
Received: from DM6PR11MB2714.namprd11.prod.outlook.com (2603:10b6:5:ce::14) by
 DM6PR11MB3705.namprd11.prod.outlook.com (2603:10b6:5:136::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Thu, 3 Dec 2020 02:49:03 +0000
Received: from DM6PR11MB2714.namprd11.prod.outlook.com
 ([fe80::8178:3f05:a017:c4d9]) by DM6PR11MB2714.namprd11.prod.outlook.com
 ([fe80::8178:3f05:a017:c4d9%5]) with mapi id 15.20.3541.029; Thu, 3 Dec 2020
 02:49:03 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "colin.king@canonical.com" <colin.king@canonical.com>
Subject: RE: [bug report] media: ov2740: allow OTP data access during
 streaming
Thread-Topic: [bug report] media: ov2740: allow OTP data access during
 streaming
Thread-Index: AQHWyLo7094zuwJTHkuw2bCkcIqMbankq3NA
Date:   Thu, 3 Dec 2020 02:49:02 +0000
Message-ID: <DM6PR11MB27142F9973A124E615D9E66D99F20@DM6PR11MB2714.namprd11.prod.outlook.com>
References: <X8epMQZcpSx0xLiZ@mwanda>
In-Reply-To: <X8epMQZcpSx0xLiZ@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76621adb-38bb-42ef-25e8-08d89735fe72
x-ms-traffictypediagnostic: DM6PR11MB3705:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3705B23B349BA66D6040746099F20@DM6PR11MB3705.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yybwrbVRu8RmxOT8QaxrgvaJlRos57ZEDuM0ohazvHJHwt8XH8GPq2HTWicoaFsFI2iprKUl1TcgdKEVl8ota7bw1DZiHjVGZ6p0b0vFMZfXOjT/h3EOcm4eZjPP6emM3QB0XY4K/aHND9dP1XTbUT5PlLPvWCqkhc/kGrANky8W9HqlLtJ/4VWe0OwwuM6IYFp0f/LwDFl7zMoM3thIpvFnGazvo9hZmdMH/mZIoXIwPYjQA9QCpFGxepCG65x2RSGuTXdn5PR7IIYPjV/esyJvKaw4OCaCOaY6SFzHJpeW1kW5PgfquAznHxIVf74kwgtAq9eJyfB27V2S986FFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2714.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(186003)(52536014)(76116006)(54906003)(4326008)(86362001)(66946007)(66476007)(2906002)(66446008)(66556008)(33656002)(8676002)(83380400001)(8936002)(6506007)(316002)(9686003)(7696005)(5660300002)(53546011)(64756008)(55016002)(478600001)(26005)(71200400001)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NajEmrUt33A4uqQI1oJ3a0+GL1LjepJp3ATya9ACj0ibvAKCBkCnagvjbOzO?=
 =?us-ascii?Q?4UGPoaQydJ2Bi38iN1A3MU79ipPpFgTOv4hYoVVbJf98iW7dAIdswFEoUUE+?=
 =?us-ascii?Q?Jpa/yGXM7JmVFKgpZj+uqZhLnBGIjKbYpImQHzFm+TyrSST9llpfKJU9f7A8?=
 =?us-ascii?Q?xqkClBcG4AUMCgOiWn2Z1RodvIhVRBBU6RSURULmYt7gZSHijSx+6Xvsf2as?=
 =?us-ascii?Q?M+l7/5JmdQ2VnfTn3QYHoKanT9asMO6EOpre4BlXI7x4mV3/ouFsaMoCwGyA?=
 =?us-ascii?Q?krksXdPSXs/QcVCE2nHaMWlmS8beWrGTm578ycT/LhPHY5FAmsQhhha0AjuZ?=
 =?us-ascii?Q?Ff/2zebcbJDuZ2qTISIAXmdn0G3VGe/kL2kBh3wZfqSAe5sgm9P8VqsJBzH+?=
 =?us-ascii?Q?We8ffi7S1n4MDPtqBIsiLxDqaW0IRQPs8JDvxFnGPRfy2PnLrNKZWqUJrYPM?=
 =?us-ascii?Q?q8a/Mew6nOvxRtZhG/HCuAeO+TM7NBHHd55uJVYJO3QqFXgSLeS2H3GgjqLq?=
 =?us-ascii?Q?D/erw76u5FvV2WYt4ivVxcP+Vm+L+t2IQKZCg6UegRaf/KBq5/dgdCMPPCnB?=
 =?us-ascii?Q?bs5xezGMR/VjbRGFTM2ch6hNuWHdqfvr1Ut350uY2xdpE0J8fBB2hdgKsSxT?=
 =?us-ascii?Q?n+D15Y3CPf5uJJ5ltQCFuAXWkZjquk8VKEi5TE46qT6PR826pKiZERxxvoEf?=
 =?us-ascii?Q?WR0Av/rYZEx9IAZR2bnAL5sftltA/ht19ZRxDbqzrkcTt8s0ClJvtCSKunpV?=
 =?us-ascii?Q?EhqmN8fM+dyWNWB0ms8UXBWa+yoV7w05oS/nNSzpelQoycw5iR3B+aQU7BXd?=
 =?us-ascii?Q?c2Xyvr0eblH0R4XddGU1+u0zewoKH+CjBG0fFt6i59DgwWvmgTv+1xb2GHcz?=
 =?us-ascii?Q?+XiT41vLXp4U0nfF8j2iwAwyd5H4xJp4r3/mthzShkOWI89kmtKC1opJPoan?=
 =?us-ascii?Q?ZDYiLWtA1U/73GygKiwFCF9bEMuiNXkcXsSW00KNkzg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76621adb-38bb-42ef-25e8-08d89735fe72
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 02:49:02.9750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d7QVfTD4x3UwXDubi5jv32k2TGf5a8Jo4HEnRDZaXIEozEvNxOlk3KgfxRr1tdw7NBFTdqsWJTTxpj/BRlQBjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3705
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Dan

Thanks for your report.

There is a patch from Colin King which is addressing this issue.
media: ov2740: fix dereference before null check on pointer nvm

Thank you!

________________________
BRs, =20
Bingbu Cao=20

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Wednesday, December 2, 2020 10:48 PM
> To: Cao, Bingbu <bingbu.cao@intel.com>
> Cc: linux-media@vger.kernel.org
> Subject: [bug report] media: ov2740: allow OTP data access during
> streaming
>=20
> Hello Bingbu Cao,
>=20
> This is a semi-automatic email about new static checker warnings.
>=20
> The patch 5e6fd339b68d: "media: ov2740: allow OTP data access during
> streaming" from Nov 13, 2020, leads to the following Smatch complaint:
>=20
>     drivers/media/i2c/ov2740.c:609 ov2740_load_otp_data()
>     warn: variable dereferenced before check 'nvm' (see line 603)
>=20
> drivers/media/i2c/ov2740.c
>    601  static int ov2740_load_otp_data(struct nvm_data *nvm)
>    602	{
>    603		struct i2c_client *client =3D nvm->client;
>                                             ^^^^^^^^^^^ Dereference
>=20
>    604		struct ov2740 *ov2740 =3D
> to_ov2740(i2c_get_clientdata(client));
>    605		u32 isp_ctrl00 =3D 0;
>    606		u32 isp_ctrl01 =3D 0;
>    607		int ret;
>    608
>    609		if (!nvm)
>                     ^^^^
> Checked too late.
>=20
>    610			return -EINVAL;
>    611
>=20
> regards,
> dan carpenter
