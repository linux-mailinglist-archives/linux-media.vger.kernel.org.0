Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3550481178
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 11:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239644AbhL2KAt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 05:00:49 -0500
Received: from mga05.intel.com ([192.55.52.43]:48158 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235190AbhL2KAs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 05:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640772048; x=1672308048;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yJo/SJYW1CAgq3mIi+g709WkvPjkUr7pi/Tu3A2kZcE=;
  b=IKEG9k7q/vjoXwkqUmiUMuBOfUio6n2tQacsi5gPicFg2G20UjADBr4O
   ku0A39Z7e4ZiEgiE9XmG3NBuwuZtDabPibWhZ5jy2iyC9iCCatZpC5T1n
   rsyEZnZoWjk5Boi/3L8FZSNtxrmBWv0E5GIzG0lHeY6WfNVPdOK0CGp5Z
   KZIo+foG9vokMA6fuPgsLzSHMhSayjMJlLnXQGAxc3Zk8vrE4nlIcHlzJ
   eoTNGoaecQ8yVQ7Ap+htyGVcN7XuoJoAdtVnmtNjDOuHn8Jc6r/JOHsS+
   XnZnxUGcL/6/1YQ/BIvQdytchKPq4DLrZvdVbq6Bsx649Z52rMqLeaYlX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10211"; a="327824992"
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="327824992"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2021 02:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,244,1635231600"; 
   d="scan'208";a="615927164"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP; 29 Dec 2021 02:00:48 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 02:00:47 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 02:00:47 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 29 Dec 2021 02:00:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 29 Dec 2021 02:00:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC2NZSGjBDTHIWVpkHY/1Cf0VKxlnROhyhxgWemfauo8C5WbNbFv5E46o7h6O4zrxarMjLUOzXzQ4ymVSkyFJTaBhYtuObwXh1ebaGRwpBDrhKfQYgnNRE0/s81Tvx6dO+w2JFYDSlwTa8thVIbSXZL5W1cZOpmmtKEwDPP8/2A4coK6WP0rFlAfUUOxLsqAasa3UdABe4HmS3fMWXB7/XeirzpXY4IkzUB0Q8TiFhTWkDYFndrkqG1PN3ZWgF2f5RSwIQQ6kxj+nXuaF2CKYPZmIWbn6iNKC/2NyqNv29yLPOF60/7vbeaaeU+zFsTjkV0b2rFcPDJTTiI/FgTNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJo/SJYW1CAgq3mIi+g709WkvPjkUr7pi/Tu3A2kZcE=;
 b=BQsZGec38kygfJagBP8aSd4+vVImzsx4k6rOgvt0Yxrma9sXbBnR/ppWwaDmh7UJIQDMb8+rhSULzPNfJ2Ob4yb0FYnltAA8gHzw+5gsb3H7nTXJdcUhk4BK1emUrSVz2MZLxGUrZQ/T3TnRCVOtbV6P9/1/YgzwaMf0a23b7ndrnPUhvelnUdOTJTGepdxfTORNgabfuHXgh6Je0H4rZ95zpBJFM1Vh16jM7V6zjBf4qhv+w/gefKNuFwSwIOy57yzEsQelTtFYi6jTnwbyATyuTiTRDWRNWhi5nDGqyj+fwPqv/GLNnAYU8sHny5lHs5z6xEVraeBaaxzmiRSQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5638.namprd11.prod.outlook.com (2603:10b6:8:27::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.14; Wed, 29 Dec 2021 10:00:43 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::e40a:cc5d:8b71:4ba9%4]) with mapi id 15.20.4823.017; Wed, 29 Dec 2021
 10:00:43 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Yeh, Andy" <andy.yeh@intel.com>
Subject: RE: [PATCH] media: ov5675: use group write to update digital gain
Thread-Topic: [PATCH] media: ov5675: use group write to update digital gain
Thread-Index: AQHX/JKhnaD11vHKqk2lXjO1X3bec6xJN2GAgAAC9OA=
Date:   Wed, 29 Dec 2021 10:00:43 +0000
Message-ID: <DM8PR11MB565373D28B23D9D36C0560EE99449@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1640768259-18070-1-git-send-email-bingbu.cao@intel.com>
 <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
In-Reply-To: <YcwtTaenpE1OK0TP@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f475ac4-ff34-410d-759b-08d9cab213f7
x-ms-traffictypediagnostic: DM8PR11MB5638:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM8PR11MB5638A23CE18CE896443C090B99449@DM8PR11MB5638.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8TLyYHKypaDs6ztKvncsy223Uv3Bxc6AlV9bUAXxgQoKnBjjspZLU9sP6NsXkEGa86/CPY3Mw/73CJA2LtKmlkuk+uC9eXHyIkf4M5MzkoQivAbxMr12oYVv77/f+A4Gjc9naoirddOn8fZ1fuQQUCMhLjDxJH0Pxdb8+s1wRcMXNSZ/etosWOHjMgoXNymdxOLPNAITp4fR9vfYD3w4AT8euY5/KbAtKSaZFVdeMa+GgkT2V9JLldZhmxD4DkcnR+NZ9VUn6ErNF+Jkz3BopQwiOa/t0ytvGWpjawIe09n29RK0+dkKOVL0dydWdyr2X5sFcjuTokVxdFwPLjlYrvx95zA3kqcaUqK75AnTUtrhTGDG2+NDyn5pd14t7jM1kDo9280s2m1K0zkgYUbWoslam/CIVVH7Xvj9gDvMOM6hb1bXHlyr0WuoSWY/k8Wn7y0Y22ypaOLQW8/SusDALDRr65u/BPeNKR+pHUE6+JK50EzRjJRdyp6uAkt5mFcqHPKzRUmOCR3IZd40xm18w4Hk9yt8yQO261iqMBbsN5c6Yjv8ardWjLqroEGY7sOpmUjZ9pK8wdW0BO/5LoirEgzioBhz+ZS0wVDxuH9ikhdsj7RGaDbwp0PXBVpchU+zlEJJ/drBeoMyQSjSJfRrPSMJKdKpvF0wEAVdRaNK1a71XCosOL/xRovy1nEJ1pXyU/AnAEdU7zJyG6BTF62odA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(55016003)(186003)(8676002)(66946007)(53546011)(66556008)(66446008)(64756008)(33656002)(26005)(316002)(66476007)(2906002)(54906003)(71200400001)(508600001)(83380400001)(76116006)(4326008)(15650500001)(6916009)(86362001)(122000001)(38100700002)(38070700005)(52536014)(9686003)(8936002)(7696005)(82960400001)(5660300002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v3XW+DE3OOvyztjB6Gc3Vwc0NC8EhNSAo0LpM/i9QkG52bYqKpbyzF4WJLK9?=
 =?us-ascii?Q?QDWDE7zu5g3pESrsfsx1nRpV1Y6tTaLaNDMLJHTD8ssYwRw37XFffVlvXCkp?=
 =?us-ascii?Q?QRSPHP0psE8CuQEtRG7u+DLo3gZsG00N00swLIfRdN6DH+Vdg3Gkp3jeH84q?=
 =?us-ascii?Q?CNHLdLCXlbpn1dMgFPC/jAPvGJmLFBUwy+k02VzWEjBKmoHXIKLgmdfxLtJq?=
 =?us-ascii?Q?Q04abTZKNKsVbCV12Gt1GffcuopnmEzbOBlgVvh8lz7ACETK1zsuuMMR7gpV?=
 =?us-ascii?Q?688KWLGm2It2Eb0lWLmOI81FRzKfC4L4NK3NuAzKIL1a5yeoQln0P1HRKIyQ?=
 =?us-ascii?Q?Mlgz/Psmp0DVz1DTWfmhgJpXlS8b1SXk8jOr6Iy7sa7AJY1P8zsS0OROkWyY?=
 =?us-ascii?Q?MlzM+sRVTZt7VDLXxxXhAzujVjNv6YwwsHgw5nCo7n0C+H882X/UoLUjzjrb?=
 =?us-ascii?Q?zTeW5Se5zUzh9+6t+mYTQyp0HeD0vU2A+hNSmqfSgfn+563lwZsFuaA1SSgn?=
 =?us-ascii?Q?A0xWHLFsbcAKQ2k4tcwxuZeoWcOEhgtkPZ61mHJhN2hswow65+SXaoruUuyp?=
 =?us-ascii?Q?dlB+QjgDgKe4qVhqp68fdmqc28HlXc+HCOUHz24VyZvSYEKF4V5kP9bSzKp3?=
 =?us-ascii?Q?8bM6bQoSHH/KhE1t5mnDccgvNraj7cWuTEU6dZdHn7ypip9jcjV41lkzj4LO?=
 =?us-ascii?Q?kGcXXffgDMU4EP1lqHz5HJ2QubvETYiSuoV4+QZECh80D96fAVkWFFs2QR+i?=
 =?us-ascii?Q?TXLlcYCvwyd+7EPhPicI+ix5uNUnLhn99wsRICUQd1dgsdG8qfhIO4qeILYF?=
 =?us-ascii?Q?aPo7G3J2THWF3LGo6wWKV9oFuJe2KNuQT6AyqSitQGat8UaEEAhGXdSLgJGW?=
 =?us-ascii?Q?UC/Yjy1mberpXIybc/PPXQIqYPjY5tUBx7V5J+GnFKC6Vse+W0zKeCV4OhMC?=
 =?us-ascii?Q?/GpXnV79YtSXcTKp5k0E+JJy2qAvFc2kqDaeJn5I0KIkUEJ+DssrxMQ0CTHp?=
 =?us-ascii?Q?VJC4GUCUswcKDA31vTGb0ax4ZyK6Eegku4Hk2wy2Y4TcdvS0YQRSJgzJQMZj?=
 =?us-ascii?Q?rgdZuTTL3WADyXmfE8q63fDYiueE16H9mvf9GCtcjArNhKyv5KDEVU1H63LY?=
 =?us-ascii?Q?dVorQj6I8NJUpQ2AtHzoY5TcCfj00V3euzBbdEXURjrDDEVW2CMz9MWne8Jw?=
 =?us-ascii?Q?QOJdjSCHX2SIo2q3MJGP8eNqJn3bmR00j905gpEb+9ZxHvnvLvUuzLhUY0EM?=
 =?us-ascii?Q?nJo1GV8JMVQcqZOllSuQKX1ASwTppwAZOtCnh9h7IajqlPAJKbSRPBmxqflt?=
 =?us-ascii?Q?rd/34oaVUjerHvkhbNuLhdGm6aZEVL1i3G9bWZEgADP/1rsc2BcSQ9oYtVhJ?=
 =?us-ascii?Q?H1vTnb9cZHEnazEZD88Mah0ljayd2gJW8VlaSN6iBZs66/Z9/ybUB1KGo6pl?=
 =?us-ascii?Q?t1RRLPyWWOY6awhrjjLmR+3dxKB/0SVXy6Qc1dFPmMcQlYl0ELfwEDWkc4mM?=
 =?us-ascii?Q?+i3q+QQxtihpSHjWOs6S7yKK8LxoaVsZGvRi9NgIs8fd1bcqsBuXCu/dc3Ob?=
 =?us-ascii?Q?Ki/HwCPa16lXvaDclm/3lOFQqa1Uje72gByHP9OKM41IcVtWTd5iQ2H6M3ys?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f475ac4-ff34-410d-759b-08d9cab213f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 10:00:43.6672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iUSnlDpngncdPHCYWnwRbJCaLd+7+B/yvdPeZ9AA6+Dzpt48Bbbg4Cq9g5FFKzO9AH+il3yIjgOWLqPsBZdF3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5638
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,=20

Thanks for your review.

________________________
BRs, =20
Bingbu Cao=20

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, December 29, 2021 5:42 PM
> To: Cao, Bingbu <bingbu.cao@intel.com>
> Cc: linux-media@vger.kernel.org; Tu, ShawnX <shawnx.tu@intel.com>;
> senozhatsky@chromium.org; tfiga@chromium.org; bingbu.cao@linux.intel.com;
> Yeh, Andy <andy.yeh@intel.com>
> Subject: Re: [PATCH] media: ov5675: use group write to update digital
> gain
>=20
> Hi Bingbu,
>=20
> On Wed, Dec 29, 2021 at 04:57:39PM +0800, Bingbu Cao wrote:
> > MWB gain register are used to set gain for each mwb channel mannually.
> > However, it will involve some artifacts at low light environment as
> > gain cannot be applied to each channel synchronously. Update the
> > driver to use group write for digital gain to make the sure RGB
> > digital gain be applied together at frame boundary.
>=20
> How about the analogue gain and exposure time?
>=20
> Shouldn't they be applied similarly as well? Adding two more writes
> increases the probability of missing a frame there.

We did not meet issue related to analog gain as the it was applied by only
1 reg write, it looks like same issue we found on ov8856, changing to set
digital gain by only 1 global gain write will fix the problem.

>=20
> This is of course a trick since the control framework doesn't really
> support this, but I think this support should be added.
>=20
> --
> Regards,
>=20
> Sakari Ailus
