Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDAE3EE3C5
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 03:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235497AbhHQBhr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 21:37:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:18664 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233253AbhHQBhr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 21:37:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="196239428"
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="196239428"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2021 18:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,327,1620716400"; 
   d="scan'208";a="520190176"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Aug 2021 18:37:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 16 Aug 2021 18:37:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Mon, 16 Aug 2021 18:37:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Mon, 16 Aug 2021 18:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUsDze3x4SBq1JPUxHoC73GNVeZcW9Ygij8Ir1C+IAjqhaU5STxWB46BWzfjzAEkHkpSrkTHfci48LlgSPuFnIJ3poeDcKk60s8yLl9RPR5XS2Md8d942qLRyEcdmjpnA8QSp5ZFTjrEwxCoKidjQbMpjmprWUkwN3h3C9XtFdwKIxHb/bxGslkhIT3REMacpQ4l/LOD+2opKTt8S16sXcMiM/RXM5KsAWrBR2IY6y472Gw5auRRM1dj6LAzGbVJhYr01vU6CVN/khQMf+5cb8ekUCnSWxXCx3HFSSPw7UkesGDAnEZqcNY+w8DosHKepZjmngYRPEaVT1mYPEro6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki3s2I+QHoyY3ylz2+5BWv0fd/IeadTh6HOkn6homKI=;
 b=oZtID5jI2eWWJIxO6+N/FxYqGPQ8bo7dIEZ1AKIVDbDLCFUmJL/GpfTV3galAzdY0EwxRxNlyG+o5Ca1gUi7l7CBJKfsyKpX81NqlU4GDz8zf9iMpbFQcKfCWix8Y+EPuAh3PbGOwyp3qBohR2q9Dt9prvrexiROrPcMYFzACMu6sfvEWlgzH/vamYOj3O/x1Lnu4i1PezVNipi7WS9s08HIPNRPgdwNApmQaejdO/hF8nRjzlDosY4xB4gT+z6yJ7jnJFA+d2LMq1FnWk4n1WldYdgYImutE5PrQ+PwdIKCRteOINz7nl6hvZpRAAwjKhwnWt1eck7IhaehNnOHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ki3s2I+QHoyY3ylz2+5BWv0fd/IeadTh6HOkn6homKI=;
 b=jJWY+uvfzDGX3wEgDS9hGmuM9Ka0Xy/2rMSbgSmx42lnycGv2bME+hwk6lyhShJEWtGpdqmdbcEvGBs0HMTsK1dkXJC4gSzhWw5YJ+JJA78aDEF15kT13JwbZXmr+5wYaCgkKSqWgcyQjXVSUYUD5a6Jh4DYg+hdJvn4FSWv5sM=
Received: from DM8PR11MB5733.namprd11.prod.outlook.com (2603:10b6:8:30::14) by
 DM8PR11MB5736.namprd11.prod.outlook.com (2603:10b6:8:11::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.19; Tue, 17 Aug 2021 01:37:07 +0000
Received: from DM8PR11MB5733.namprd11.prod.outlook.com
 ([fe80::19cb:2769:dde7:8f2]) by DM8PR11MB5733.namprd11.prod.outlook.com
 ([fe80::19cb:2769:dde7:8f2%9]) with mapi id 15.20.4415.023; Tue, 17 Aug 2021
 01:37:07 +0000
From:   "Kao, Arec" <arec.kao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Yeh, Andy" <andy.yeh@intel.com>,
        "Chang, Wei Shun" <wei.shun.chang@intel.com>
Subject: RE: [PATCH v2] Add sensor driver support for the ov13b10 camera.
Thread-Topic: [PATCH v2] Add sensor driver support for the ov13b10 camera.
Thread-Index: AQHXkBLWAnP8i111q0y3JZbnILbUZatxf3eAgAVwngA=
Date:   Tue, 17 Aug 2021 01:37:07 +0000
Message-ID: <DM8PR11MB573305740BE436795AADE03E91FE9@DM8PR11MB5733.namprd11.prod.outlook.com>
References: <20210813081845.26619-1-arec.kao@intel.com>
 <20210813143047.GS3@paasikivi.fi.intel.com>
In-Reply-To: <20210813143047.GS3@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5230f0a0-a27b-4913-1d7f-08d9611f868a
x-ms-traffictypediagnostic: DM8PR11MB5736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB57369B84704676735EA353EB91FE9@DM8PR11MB5736.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HTrVdelRKrA9avq7acPC2fO23rH+owRDmxkELdbgTYHcGkW9Pkj6B0fIu6uMeopdy9lLah/xtlsoGiK/UpTeP2abq9b1oWKprw0smvQ5/ATXFabrgbubwfxyEYVOrRblghk2Do2k7pTC+MFtR1zGH7WMsoVXbP72XUuTqkZaj7lZVs2mskWNObTVdLPlkqXM0/nKPxCeN8X4mCVZ1oLnpUSfDAdvFfBUzmhOlNoC3cM/qBIkbVM0IAdORGt6Da/UtCUuf7f9W382UDCllZ2ktL4QJ4ir1gFX0kXuT49DB02s4pbWBNI4wdP9LkRcZRIMu9a8jSjl7L4VJh+KuhqIC2UGc4PW/eEluRTkd9zENWGWiGJPOJqToy3MEbQZZs8oBUJrVh/ZpElmPogYnweXluTx48aRNm7JdCm6qmmU2zoQ0H8ug0bzBh+4prVVUFpJhVlyPX7N03ZrhQjQKQMM2ykvNkafR2l4VroCNh6nEg1GNFnnamZf0ez+k44TWEvGkezopp1+/HDXzpEZIECNzKPo1CtAgN2woZlzcKehk95YRayt1137nl28WWWSG3BU4B2IR61IMbq9ptGmecUsyVhDqVnyGyMKfB+BJ5y8XbXb1pouKnkpnehUBVkYzE+NGPOjOX27P0pUFm2G7NenxvZO+Z/f9UT1wkdaXKt8Iis68iRHBQRIphpJ3eDVLUPNTKsdn5sm/Ha6U8gMhNPt1A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(5660300002)(86362001)(4744005)(8676002)(52536014)(83380400001)(8936002)(71200400001)(33656002)(6916009)(2906002)(26005)(66476007)(66556008)(64756008)(66446008)(7696005)(478600001)(53546011)(6506007)(38100700002)(66946007)(55016002)(38070700005)(186003)(54906003)(316002)(9686003)(76116006)(122000001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z8QsamLFXYowuaCP7/gmMPu4tPAWgdFaLagpQqMjCcW9OKYez9xr/sdAKdV8?=
 =?us-ascii?Q?aWmlWV7M/rTj6+8rUokrxj9ra9G8QtwrBM0kiHAI5QKZJXJOO3345DeNQA+G?=
 =?us-ascii?Q?MszW0qKchbUim/LWgu3xUmJbxnp9CROHYUcaHu5QyIH2ZYCHpo2XmAln7Qug?=
 =?us-ascii?Q?efcUJV/WDDBULT7Hu6c112KXfeVxjHZ0MeRrR+tjsgCYZ2duuVhWhsNodlbR?=
 =?us-ascii?Q?VB3L1cSgNSz9W4x2vjD3z4ztz4Fu5K7xtK7mYdQqp8tiAgwkx1OPbQg2yUSG?=
 =?us-ascii?Q?767ZY8rTQ18ZHVXs5bkjHPiPmtSQnE7wM1EiFJ3z2KB0aZjJOk+YNQMNaBex?=
 =?us-ascii?Q?u5mOg9hZqwFiWgkFcmruMqrQrvj21EolLf+8ZknEcFiD1ivk17D5T4crjMDu?=
 =?us-ascii?Q?55730dPU0wcbImqoewitV4d3pfD/+4lE62uiayh5kcrgWhLd/OvpCUEutgI+?=
 =?us-ascii?Q?8fZj6VDV0tFAS9nHeqx2FxkiaaIfRhBPfPtKbKb/R5zZMZDPk9QF7bxe0mg9?=
 =?us-ascii?Q?XNVbt1qf6x5me/pWGiLwYsie2ZaSlc7HhelkSykq0URer8D+1O5d7U0rcX3A?=
 =?us-ascii?Q?E9HQQ/VHWLyWHsO0pMlZ+Ix8eiGmhfwoJF91HtdkNgSUWF5KSCwHHvJHw/ia?=
 =?us-ascii?Q?IG+ezdqMTMse7scyzmSzZrvmBsR7MWpXSJgpG4BNtCcYddx6KR2yhU97XQJf?=
 =?us-ascii?Q?vIutGpt/VSnVaPy0kqBpcZu6gesdm9/qXlsG9xi0N0QBLinTx6QkVFpsZud9?=
 =?us-ascii?Q?qJXA3MKoRFPY8mV8pTCpSAk/lKbcl2LLUA1/o1wI4168vLO8mNjDIrfD1p9B?=
 =?us-ascii?Q?w7oK8npIGnibHTdsA5PLGEjiU82Pulw8+kcF04KhH3moNRSFirVJPmQHCCfR?=
 =?us-ascii?Q?qWU6F4sNkMYcqdJLnOJyxWmH0bgU74/oIxXnArLsc7C6Qruh2Pr81DEvTJGp?=
 =?us-ascii?Q?MgrsuT07C6IcY8H1s20ylwBAy1o9hI7b3Z+I8JpfffhYSN148Rpze8cctEoY?=
 =?us-ascii?Q?EInKyD3Vo30ZHWUN8kMhRqbWLBaUjblHh6uq8p5vfNjUK3y3o3vB68NahhbD?=
 =?us-ascii?Q?fAHk4JNcfMnzxYi2202SFWjaefNrBF6aBSPyQXgIH+64FxDFBl1HBdK4Oegu?=
 =?us-ascii?Q?ic9b5lEbitQOJ2yct5eLpi08yBFcqUTgfidy3+MArSz3vCGPe/MZtYe/V+Rh?=
 =?us-ascii?Q?BP+HmDvfgXSGMW6sRAy28IHSgkOn0pwQDls0TcHpb6vrQhlT5DE2sahRB1B6?=
 =?us-ascii?Q?NIWzntzUNvbYmo1dRzLb8JJfPR9KxeJHWgdGWxNvR/etJbFPCGMmAsxs/Tlk?=
 =?us-ascii?Q?BlTn8DccMCkLaY3MYhInqD0s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5230f0a0-a27b-4913-1d7f-08d9611f868a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 01:37:07.7271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogdnxc+xl+c3AIAZzKVxEI6rY/dSPApZkgiFWGBxRnMQQ9WjTn1HtF+cAXKz9d2A8HgxLkURIDQj9S29GHKjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5736
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for, I was not aware of that! Will add this to this driver.

Thanks,
BRs,
Arec Kao

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Friday, August 13, 2021 10:31 PM
To: Kao, Arec <arec.kao@intel.com>
Cc: linux-media@vger.kernel.org; Yeh, Andy <andy.yeh@intel.com>; Chang, Wei=
 Shun <wei.shun.chang@intel.com>
Subject: Re: [PATCH v2] Add sensor driver support for the ov13b10 camera.

Hi Arec,

On Fri, Aug 13, 2021 at 04:18:45PM +0800, Arec Kao wrote:
> This driver supports following features:
>=20
> - phase detection auto focus (PDAF)
> - manual exposure and analog/digital gain control
> - vblank/hblank control
> - test pattern
> - image vertical flip and horizontal mirror control
> - 4208x3120 at 30FPS
> - 2080x1170 at 60FPS

Forgot a few things on v2... I noticed the driver doesn't check the link fr=
equency used by the driver at the moment is valid for the given board.
Could you add that?

See e.g. drivers/media/i2c/imx319.c for an example.

Also an entry in MAINTAINERS is needed, see e.g. one for IMX319 again.

--
Kind regards,

Sakari Ailus
