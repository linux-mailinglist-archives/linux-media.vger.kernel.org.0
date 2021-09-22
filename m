Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09BAE414098
	for <lists+linux-media@lfdr.de>; Wed, 22 Sep 2021 06:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230476AbhIVEfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Sep 2021 00:35:16 -0400
Received: from mga17.intel.com ([192.55.52.151]:10678 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229495AbhIVEfP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Sep 2021 00:35:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="203669645"
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="203669645"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2021 21:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,312,1624345200"; 
   d="scan'208";a="436106757"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2021 21:33:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Sep 2021 21:33:45 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 21 Sep 2021 21:33:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 21 Sep 2021 21:33:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 21 Sep 2021 21:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdN/jX/RGRmaStL/E98UeX1KDJKCEZxlWrS8RskOgzX44/0z7USXu6axXr13LtQg8CNpsf2Id0TzQOQqEecZKTYQM0pemfP7zTN67kNjCNCam4OV+oY6+0gIYEd/jiZBH0m0u68/c7IhvcpCsBYqYxnHCvoYzaTApkTQGnB3Id+cvR2mXuFhPI/UJXan6w2QvKKZwj45G3fxMapLfVaNxPGtizXAOaK/WuvH+PcWJ8KI6A9NAJCRXijVewMDGXlAle6DH/BfwAViPhw8HnX5xq8lkB9qg83cTjQQB3/eJ/o52E3sX+GA6fY9BjKeG/eZy0C0GK3wBaDknqlM4D67LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SCyNZLU1z5Hfkg049q9o7zamD0e4XAhuMCZEKzrBlMk=;
 b=QJEw2yhT9BctN2ea8D8eDCuV7S1PsQlaw8aKXv5GPjpnZVH6DhMl2ZY1XOqZHYgEYFQT4JAHUeYWjaik4qj9zsjUo8fHRvTgLKcfg6rwLv0ty4fv8dhkz/5oa+Eq9IrFf6wCeIqp2Zh5tq5IYpcfyYXRCCgnRl+vIbKHmMYMnUN3TiFhibQZmRXGai+BpHGYn6Vvgt1YSeM8+x3QMQRolZ/x+Dgsd65ukIoEaHgSVDGSFLH7OB15m8V0mwSbBtbATrRFR7m+xmgkNq7H3aqBf8JlAIWgSPLy1eLCK7RgkMptQV6ruwj4SukAAFV2iQyJz+Jdu5muz+riWh7tpWSpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCyNZLU1z5Hfkg049q9o7zamD0e4XAhuMCZEKzrBlMk=;
 b=fZa3UTNtJxp7Ykn6uFK6s0y3GgfS3a0j+0w9AxEMqfIYOVBSMtyvCdjAE4hkx3m2fic72Zr5hSNtCNjFfBlb0lM9OWl/f+bHHrmG0DiF+nlnfoUrBDAPzrDkEmef/8VxWa/+yhSj7nQeEDiaDoWjzZxfX0dyiUpvXojNlKxVRt0=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Wed, 22 Sep 2021 04:33:43 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::7d77:f6f4:613:b13c]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::7d77:f6f4:613:b13c%9]) with mapi id 15.20.4523.020; Wed, 22 Sep 2021
 04:33:43 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "tfiga@google.com" <tfiga@google.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice in
 the stripes
Thread-Topic: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Thread-Index: AQHXqx/Y72VMy1pUFEiS45AyrkgVKauuW1+AgAAg14CAABjrAIAA3LCQ
Date:   Wed, 22 Sep 2021 04:33:43 +0000
Message-ID: <DM8PR11MB5653D63F3F76CA1D9E80E01199A29@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20210916172504.677919-1-jeanmichel.hautbois@ideasonboard.com>
 <YUm82RNBbu9VbQj9@paasikivi.fi.intel.com>
 <19a2a09a-dcdd-fc32-0410-7f752cceffb5@ideasonboard.com>
 <YUntTJQwZJ7U3m/E@pendragon.ideasonboard.com>
In-Reply-To: <YUntTJQwZJ7U3m/E@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e1f48ca0-5b33-4e49-6fd9-08d97d8228ef
x-ms-traffictypediagnostic: DM8PR11MB5653:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB56530DE99456C60501F135CF99A29@DM8PR11MB5653.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JHoJBTfaWcO2u9DWkFD0oSPG0bdo8wkUV3phxeBa5QRGFGnhlBiLrFLHZESQByGjoA9rB6M/pGMIryXkkxHihhAIdcARy6fNdE/gmlE8cel0gyOiWyLphEjLKOw//eZLJNW+hjzWBtdX8Fu9vZzXJQD755hYiNTREriunxLCORdT/7+MRhZANmEQ9MiYCdcbPvfXuC4y1PE/FywQJR2rnw/oMm7WDo0ZRTnQKhuaAI9I5LHFrk4HKTKUlvd60PeEjweBYqQmPmJg9jA+MhAxxDLgV6Az0yxwtUrQ7+4OKpqU73NDt5q2IWGg6H3hxfh4nMtdFcl59OM1HBpetd+z+B0Jy89T7Qg1Bk7CTDL6thn5RhISj6Pqsa/nEghFGlJbal6xpGSEU69vkV7TMYD0+gr9AllY1fXeOhFsBLxyGnizj2mLG/Eper22aUrwzeMIkiBC17Jecfl0XFL8MdH67LYctQgr4zPthFNb8SP27ULYHDshNqif9dGOCQCLlrYWzmGSRY5zBWyl4DVWazAW0T6eFxBHo3eqNPUcmgfaXLWJHgPUBMIkfxbUiV5xeHYkJd8p3GEzsuXE7uQ7JNsPXi52CEHNEuS8yy9gw1127MVuSit9XYYFyOGhAOeAcPsy6rEA2QRY+/qmaX5ZgHAPGpYN9Xqlw1jdxL3weCkndczF/SkHLnEnFfSXMRaKozkKJ/Fh6pbyF8vMBkP+7HkXIwmbyAHJVLXczrH/HZWPlBCjO3+ebWvQH8UvTN6BZLca5cxCp9/SuUP4LmWa6P2fdrNMrqXIxAodJqga57t2OMI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(33656002)(2906002)(52536014)(110136005)(5660300002)(55016002)(9686003)(71200400001)(86362001)(4326008)(316002)(966005)(8676002)(508600001)(8936002)(38070700005)(38100700002)(83380400001)(6506007)(122000001)(66946007)(7696005)(53546011)(76116006)(66556008)(66446008)(66476007)(64756008)(26005)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RmNydWJhbkFZemhPcXRrS3hwS1JUdTdDZERoM0RJS2RsZDZQUkJGNXFnVG14?=
 =?utf-8?B?djk4eHc2L21DaTBLYzVxbHFpenZXVzVoZnBoMzZNRXJhRkZMOU52SDdndmJp?=
 =?utf-8?B?Z2ZvQnF3TnlYczlGS3k3VFNiS2pUZTVTSkFqYUgrT3lRSVIrVWZHanh5d29T?=
 =?utf-8?B?ODkrcVhYMkNua1ZDU0FyNllJZG1Cbkc3ZWxkd01IekVkRmNCTmVTRWZpNTVY?=
 =?utf-8?B?VWlaa1VpL0hDcFpYOG4yOVczSEZhQ1lDcGZiaXNjN203eGhjbk03M1M3RTBw?=
 =?utf-8?B?QmZScS90Y3ZOTzRjNEg4NVlMS0hUdHByS2JDZjI1QnFxWFVwZ2ovRkF0NnJR?=
 =?utf-8?B?U3dqeG1sNUdRTGEzS25lNGlMeUMyZnEvTW9tdDBjVFVRLzUrMHhFckp3ei90?=
 =?utf-8?B?REt2QTQrOUYvVGNWcTlyVGVyY1RlNzVqaFJ0Q0EyWXB6ZFBsTVlYMnZrZjhL?=
 =?utf-8?B?cDd3WEV0b1RXck9tQWU1T0g0bm42QUlRRXVQYkFMd3VwSWNSdDRMdXhDYThM?=
 =?utf-8?B?czBLS1FzOWZ0WlZ3RGJSTlhDSTA1ZlhyaEdRTlNOYjREUjh4WEMvaWpiOWkr?=
 =?utf-8?B?aDYxUjZzbmowRUpKRVZ4aWR1cW9WK0U5bHVzeWR1Vm9DSllLMEJENUQyWk1F?=
 =?utf-8?B?VzRJRU9MZStnYWQ4elR6K2hSRUo0MUFnSXdvRVRTSUVwaTh2NHdHVllyZXhL?=
 =?utf-8?B?MlZhWUd1c2dPMWdQQThUbmFMQi9jRHpnRDdyTjBrWG4wVkFBWWExcGVoMmVT?=
 =?utf-8?B?WFprWU53YVZ2OFp2dnB3NStBZGxkaXRKTE4xN3RwNyt3ek0zdUVwb0tVL1FN?=
 =?utf-8?B?ZWYxUVdQSmx6SHdVR0pLSmY3N252VUkwMHdaa3RTbnQ2dkJtdkpkbnNDU0o1?=
 =?utf-8?B?TStZVUFWVmtKT3BCeFRVLzhYaFN1dG9iMlJNOGlqelIrRWswNXRoQTlURHZa?=
 =?utf-8?B?dFBUUlAzaDU4YVdGTS9SOTBHOGRBRlcwK1FZNE05WG9VLy9TY3JGdmNMbXEr?=
 =?utf-8?B?OVRKQmJGb0RuRzZEY1J0Qk4zN0MvWFpxNDRiWDNqdSs4MitlSDlxMG5IdExS?=
 =?utf-8?B?YUxnMmhDN0tCMFNmMmZGMUxWb0dtTmlXdlJhc2tWcWkrUUVCN05sU1YxWlhy?=
 =?utf-8?B?dmNEVHpmUmpCREVxeGhCUWNOWWpkbGlnQ2t2RldCQllYNkl4d3gxd1JwelFt?=
 =?utf-8?B?QTl1ajZaY3VvS0dsKzlhQmMzV1BHU0hONU8rYVo0UElKdGtwUHd3VXhSaHBO?=
 =?utf-8?B?ZjZOR3VBZkg2UEZQcExLYUpDVlZUMEF5MTRhUUxqYkl1d3NURjBpdUNEWEEr?=
 =?utf-8?B?aDJGMVlMYkpOd0dteU5vUXFDQndYZFk5VmNsTmIzVjFacFdzcmhGRGFza1lw?=
 =?utf-8?B?SHNwaWVST3lsRzcxd2dUcDZTc213cHk0LzY3dGFpNXBZeTNkTjJ5ZEtBbGtT?=
 =?utf-8?B?Q2lxRTQ1bzVyMS8rOW54cHI0MGlzUUtScTUzNUY1ZU12ZVhKM1BSWnZadjFO?=
 =?utf-8?B?amNpU0s5RVZrcGpMUjVjcGI3WWllbUVhMDlGdHdBQWFjQ3RQZTNUR3NmYTY5?=
 =?utf-8?B?WG5NWXh3ZHZVRE5KcnN2N3J2MzYvZmxBbzVwdzBPZ00xNk1qdUpMd2duOEor?=
 =?utf-8?B?amdKS2VoM2FtSVpEQ3RnSncxYzA0S0VXKzZPWVZ2akxXQStPT0NaY0ZpbVU4?=
 =?utf-8?B?Q2I4TWphb1NQNHQ0bGozdUdWTGN6U2FGYmtFeFFLQ1RNTFhUemkvZEd3bHp5?=
 =?utf-8?Q?bI83vBVD2sv0sQv8IPD4DnNl+LG8NuygKy6v9U3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f48ca0-5b33-4e49-6fd9-08d97d8228ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 04:33:43.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sw82VJ38XtqY5HfhKZmhHTeFB7nbNkMLD1sIrACJ99WyfTfNvZNmM5f2V6lx2glB9URJL61hgEwf5sRtVzHxWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5653
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SmVhbi1NaWNoZWwsDQoNClRoYW5rcyBmb3IgeW91IHBhdGNoLg0KV2hhdCBpcyB0aGUgdmFsdWUg
b2YgLmNvbmZpZy5ncmlkX2NmZy53aWR0aCBmb3IgeW91ciBsb3cgcmVzb2x1dGlvbnM/DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fXw0KQlJzLCAgDQpCaW5nYnUgQ2FvIA0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIxLCAy
MDIxIDEwOjM0IFBNDQo+IFRvOiBKZWFuLU1pY2hlbCBIYXV0Ym9pcyA8amVhbm1pY2hlbC5oYXV0
Ym9pc0BpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNA
bGludXguaW50ZWwuY29tPjsgdGZpZ2FAZ29vZ2xlLmNvbTsgbGludXgtDQo+IG1lZGlhQHZnZXIu
a2VybmVsLm9yZzsgUWl1LCBUaWFuIFNodSA8dGlhbi5zaHUucWl1QGludGVsLmNvbT47IENhbywN
Cj4gQmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
bWVkaWE6IHN0YWdpbmc6IGlwdTMtaW1ndTogSW5pdGlhbGlzZQ0KPiBoZWlnaHRfcGVyX3NsaWNl
IGluIHRoZSBzdHJpcGVzDQo+IA0KPiBPbiBUdWUsIFNlcCAyMSwgMjAyMSBhdCAwMzowNDozN1BN
ICswMjAwLCBKZWFuLU1pY2hlbCBIYXV0Ym9pcyB3cm90ZToNCj4gPiBIaSBTYWthcmksIGFuZCBU
b21hc3ogYXMgSSBoYXZlIGEgcmVtYXJrL3F1ZXN0aW9uIGZvciB5b3UgOi0pDQo+ID4NCj4gPiBP
biAyMS8wOS8yMDIxIDEzOjA3LCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiBIaSBKZWFuLU1p
Y2hlbCAtLS0gYW5kIEJpbmdidSBhbmQgVGlhbnNodSwNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIFNl
cCAxNiwgMjAyMSBhdCAwNzoyNTowNFBNICswMjAwLCBKZWFuLU1pY2hlbCBIYXV0Ym9pcyB3cm90
ZToNCj4gPiA+PiBXaGlsZSBwbGF5aW5nIHdpdGggbG93IHJlc29sdXRpb25zIGZvciB0aGUgZ3Jp
ZCwgaXQgYXBwZWFyZWQgdGhhdA0KPiA+ID4+IGhlaWdodF9wZXJfc2xpY2UgaXMgbm90IGluaXRp
YWxpc2VkIGlmIHdlIGFyZSBub3QgdXNpbmcgYm90aA0KPiA+ID4+IHN0cmlwZXMgZm9yIHRoZSBj
YWxjdWxhdGlvbnMuIFRoaXMgcGF0dGVybiBvY2N1cnMgdGhyZWUgdGltZXM6DQo+ID4gPj4gLSBm
b3IgdGhlIGF3Yl9mciBwcm9jZXNzaW5nIGJsb2NrDQo+ID4gPj4gLSBmb3IgdGhlIGFmIHByb2Nl
c3NpbmcgYmxvY2sNCj4gPiA+PiAtIGZvciB0aGUgYXdiIHByb2Nlc3NpbmcgYmxvY2sNCj4gPiA+
Pg0KPiA+ID4+IFRoZSBpZGVhIG9mIHRoaXMgc21hbGwgcG9ydGlvbiBvZiBjb2RlIGlzIHRvIHJl
ZHVjZSBjb21wbGV4aXR5IGluDQo+ID4gPj4gbG9hZGluZyB0aGUgc3RhdGlzdGljcywgaXQgY291
bGQgYmUgZG9uZSBhbHNvIHdoZW4gb25seSBvbmUgc3RyaXBlDQo+ID4gPj4gaXMgdXNlZC4gRml4
IGl0IGJ5IGdldHRpbmcgdGhpcyBpbml0aWFsaXNhdGlvbiBjb2RlIG91dHNpZGUgb2YgdGhlDQo+
ID4gPj4gZWxzZSgpIHRlc3QgY2FzZS4NCj4gPiA+Pg0KPiA+ID4+IFNpZ25lZC1vZmYtYnk6IEpl
YW4tTWljaGVsIEhhdXRib2lzDQo+ID4gPj4gPGplYW5taWNoZWwuaGF1dGJvaXNAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gPiA+PiAtLS0NCj4gPiA+PiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL2lwdTMv
aXB1My1jc3MtcGFyYW1zLmMgfCA0NA0KPiA+ID4+ICsrKysrKysrKystLS0tLS0tLS0tDQo+ID4g
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4g
PiA+Pg0KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaXB1My9pcHUz
LWNzcy1wYXJhbXMuYw0KPiA+ID4+IGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My1j
c3MtcGFyYW1zLmMNCj4gPiA+PiBpbmRleCBlOWQ2YmQ5ZTkzMzIuLjA1ZGE3ZGJkY2E3OCAxMDA2
NDQNCj4gPiA+PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaXB1My9pcHUzLWNzcy1wYXJh
bXMuYw0KPiA+ID4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9pcHUzL2lwdTMtY3NzLXBh
cmFtcy5jDQo+ID4gPj4gQEAgLTI0MjgsMTYgKzI0MjgsMTYgQEAgaW50IGltZ3VfY3NzX2NmZ19h
Y2Moc3RydWN0IGltZ3VfY3NzICpjc3MsDQo+IHVuc2lnbmVkIGludCBwaXBlLA0KPiA+ID4+ICAJ
CQkJCWFjYy0+YXdiX2ZyLnN0cmlwZXNbMV0uZ3JpZF9jZmcud2lkdGgsDQo+ID4gPj4gIAkJCQkJ
Yl93X2xvZzIpOw0KPiA+ID4+ICAJCWFjYy0+YXdiX2ZyLnN0cmlwZXNbMV0uZ3JpZF9jZmcueF9l
bmQgPSBlbmQ7DQo+ID4gPj4gLQ0KPiA+ID4+IC0JCS8qDQo+ID4gPj4gLQkJICogVG8gcmVkdWNl
IGNvbXBsZXhpdHkgb2YgZGVidWJibGluZyBhbmQgbG9hZGluZw0KPiA+ID4+IC0JCSAqIHN0YXRp
c3RpY3MgZml4IGdyaWRfaGVpZ2h0X3Blcl9zbGljZSB0byAxIGZvciBib3RoDQo+ID4gPj4gLQkJ
ICogc3RyaXBlcy4NCj4gPiA+PiAtCQkgKi8NCj4gPiA+PiAtCQlmb3IgKGkgPSAwOyBpIDwgc3Ry
aXBlczsgaSsrKQ0KPiA+ID4+IC0JCQlhY2MtPmF3Yl9mci5zdHJpcGVzW2ldLmdyaWRfY2ZnLmhl
aWdodF9wZXJfc2xpY2UgPSAxOw0KPiA+ID4+ICAJfQ0KPiA+ID4+DQo+ID4gPj4gKwkvKg0KPiA+
ID4+ICsJICogVG8gcmVkdWNlIGNvbXBsZXhpdHkgb2YgZGVidWJibGluZyBhbmQgbG9hZGluZw0K
PiA+ID4+ICsJICogc3RhdGlzdGljcyBmaXggZ3JpZF9oZWlnaHRfcGVyX3NsaWNlIHRvIDEgZm9y
IGJvdGgNCj4gPiA+PiArCSAqIHN0cmlwZXMuDQo+ID4gPj4gKwkgKi8NCj4gPiA+PiArCWZvciAo
aSA9IDA7IGkgPCBzdHJpcGVzOyBpKyspDQo+ID4gPj4gKwkJYWNjLT5hd2JfZnIuc3RyaXBlc1tp
XS5ncmlkX2NmZy5oZWlnaHRfcGVyX3NsaWNlID0gMTsNCj4gPiA+PiArDQo+ID4gPj4gIAlpZiAo
aW1ndV9jc3NfYXdiX2ZyX29wc19jYWxjKGNzcywgcGlwZSwgJmFjYy0+YXdiX2ZyKSkNCj4gPiA+
PiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+Pg0KPiA+ID4+IEBAIC0yNTkxLDE1ICsyNTkxLDE1
IEBAIGludCBpbWd1X2Nzc19jZmdfYWNjKHN0cnVjdCBpbWd1X2NzcyAqY3NzLA0KPiB1bnNpZ25l
ZCBpbnQgcGlwZSwNCj4gPiA+PiAgCQkJaW1ndV9jc3NfZ3JpZF9lbmQoYWNjLT5hZi5zdHJpcGVz
WzFdLmdyaWRfY2ZnLnhfc3RhcnQsDQo+ID4gPj4gIAkJCQkJICBhY2MtPmFmLnN0cmlwZXNbMV0u
Z3JpZF9jZmcud2lkdGgsDQo+ID4gPj4gIAkJCQkJICBiX3dfbG9nMik7DQo+ID4gPj4gLQ0KPiA+
ID4+IC0JCS8qDQo+ID4gPj4gLQkJICogVG8gcmVkdWNlIGNvbXBsZXhpdHkgb2YgZGVidWJibGlu
ZyBhbmQgbG9hZGluZyBzdGF0aXN0aWNzDQo+ID4gPj4gLQkJICogZml4IGdyaWRfaGVpZ2h0X3Bl
cl9zbGljZSB0byAxIGZvciBib3RoIHN0cmlwZXMNCj4gPiA+PiAtCQkgKi8NCj4gPiA+PiAtCQlm
b3IgKGkgPSAwOyBpIDwgc3RyaXBlczsgaSsrKQ0KPiA+ID4+IC0JCQlhY2MtPmFmLnN0cmlwZXNb
aV0uZ3JpZF9jZmcuaGVpZ2h0X3Blcl9zbGljZSA9IDE7DQo+ID4gPj4gIAl9DQo+ID4gPj4NCj4g
PiA+PiArCS8qDQo+ID4gPj4gKwkgKiBUbyByZWR1Y2UgY29tcGxleGl0eSBvZiBkZWJ1YmJsaW5n
IGFuZCBsb2FkaW5nIHN0YXRpc3RpY3MNCj4gPiA+PiArCSAqIGZpeCBncmlkX2hlaWdodF9wZXJf
c2xpY2UgdG8gMSBmb3IgYm90aCBzdHJpcGVzDQo+ID4gPj4gKwkgKi8NCj4gPiA+PiArCWZvciAo
aSA9IDA7IGkgPCBzdHJpcGVzOyBpKyspDQo+ID4gPj4gKwkJYWNjLT5hZi5zdHJpcGVzW2ldLmdy
aWRfY2ZnLmhlaWdodF9wZXJfc2xpY2UgPSAxOw0KPiA+ID4+ICsNCj4gPiA+PiAgCWlmIChpbWd1
X2Nzc19hZl9vcHNfY2FsYyhjc3MsIHBpcGUsICZhY2MtPmFmKSkNCj4gPiA+PiAgCQlyZXR1cm4g
LUVJTlZBTDsNCj4gPiA+Pg0KPiA+ID4+IEBAIC0yNjYwLDE1ICsyNjYwLDE1IEBAIGludCBpbWd1
X2Nzc19jZmdfYWNjKHN0cnVjdCBpbWd1X2NzcyAqY3NzLA0KPiB1bnNpZ25lZCBpbnQgcGlwZSwN
Cj4gPiA+PiAgCQkJaW1ndV9jc3NfZ3JpZF9lbmQoYWNjLT5hd2Iuc3RyaXBlc1sxXS5ncmlkLnhf
c3RhcnQsDQo+ID4gPj4gIAkJCQkJICBhY2MtPmF3Yi5zdHJpcGVzWzFdLmdyaWQud2lkdGgsDQo+
ID4gPj4gIAkJCQkJICBiX3dfbG9nMik7DQo+ID4gPj4gLQ0KPiA+ID4+IC0JCS8qDQo+ID4gPj4g
LQkJICogVG8gcmVkdWNlIGNvbXBsZXhpdHkgb2YgZGVidWJibGluZyBhbmQgbG9hZGluZyBzdGF0
aXN0aWNzDQo+ID4gPj4gLQkJICogZml4IGdyaWRfaGVpZ2h0X3Blcl9zbGljZSB0byAxIGZvciBi
b3RoIHN0cmlwZXMNCj4gPiA+PiAtCQkgKi8NCj4gPiA+PiAtCQlmb3IgKGkgPSAwOyBpIDwgc3Ry
aXBlczsgaSsrKQ0KPiA+ID4+IC0JCQlhY2MtPmF3Yi5zdHJpcGVzW2ldLmdyaWQuaGVpZ2h0X3Bl
cl9zbGljZSA9IDE7DQo+ID4gPj4gIAl9DQo+ID4gPj4NCj4gPiA+PiArCS8qDQo+ID4gPj4gKwkg
KiBUbyByZWR1Y2UgY29tcGxleGl0eSBvZiBkZWJ1YmJsaW5nIGFuZCBsb2FkaW5nIHN0YXRpc3Rp
Y3MNCj4gPiA+PiArCSAqIGZpeCBncmlkX2hlaWdodF9wZXJfc2xpY2UgdG8gMSBmb3IgYm90aCBz
dHJpcGVzDQo+ID4gPj4gKwkgKi8NCj4gPiA+PiArCWZvciAoaSA9IDA7IGkgPCBzdHJpcGVzOyBp
KyspDQo+ID4gPj4gKwkJYWNjLT5hd2Iuc3RyaXBlc1tpXS5ncmlkLmhlaWdodF9wZXJfc2xpY2Ug
PSAxOw0KPiA+ID4+ICsNCj4gPiA+PiAgCWlmIChpbWd1X2Nzc19hd2Jfb3BzX2NhbGMoY3NzLCBw
aXBlLCAmYWNjLT5hd2IpKQ0KPiA+ID4+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4+DQo+ID4g
Pg0KPiA+ID4gV2hpbGUgaXQgc2VlbXMgbGlrZSBhIHNlbnNpYmxlIGlkZWEgdG8gaW5pdGlhbGlz
ZSBhcmd1bWVudHMgdG8NCj4gPiA+IGZpcm13YXJlLCBkb2VzIHRoaXMgaGF2ZSBhbiBlZmZlY3Qg
b24gdGhlIHN0YXRpc3RpY3MgZm9ybWF0PyBJZiBzbywNCj4gPiA+IGNhbiB0aGUgZXhpc3Rpbmcg
dXNlciBzcGFjZSBjb3BlIHdpdGggdGhhdD8NCj4gPg0KPiA+IFRvIHRyeSBhbmQgZmlndXJlIHRo
YXQgb3V0LCB3ZSBoYXZlIHRlc3RlZCBzZXZlcmFsIGdyaWQgY29uZmlndXJhdGlvbnMNCj4gPiBh
bmQgaW5zcGVjdGVkIHRoZSBjYXB0dXJlZCBzdGF0aXN0aWNzLiBXZSBoYXZlIGNvbnZlcnRlZCB0
aGUNCj4gPiBzdGF0aXN0aWNzIGluIGFuIGltYWdlLCByZW5kZXJpbmcgZWFjaCBjZWxsIGFzIGEg
cGl4ZWwgd2hvc2UgcmVkLA0KPiA+IGdyZWVuIGFuZCBibHVlIGNvbXBvbmVudHMgYXJlIHRoZSBj
ZWxsJ3MgcmVkLCBncmVlbiBhbmQgYmx1ZSBhdmVyYWdlcy4NCj4gPiBUaGlzIHR1cm5lZCBvdXQg
dG8gYmUgYSB2ZXJ5IGVmZmVjdGljZSB0b29sIHRvIHF1aWNrbHkgdmlzdWFsaXplIEFXQg0KPiBz
dGF0aXN0aWNzLg0KPiA+IFdlIGhhdmUgbWFkZSBhIGxvdCBvZiB0ZXN0cyB3aXRoIGRpZmZlcmVu
dCBvdXRwdXQgcmVzb2x1dGlvbnMsIGZyb20gYQ0KPiA+IHNtYWxsIG9uZSB1cCB0byB0aGUgZnVs
bC1zY2FsZSBvbmUuDQo+ID4NCj4gPiBIZXJlIGlzIG9uZSBleGFtcGxlIG9mIGEgc3RhdGlzdGlj
cyBvdXRwdXQgd2l0aCBhIFZpZXdGaW5kZXINCj4gPiBjb25maWd1cmVkIGFzIDE5MjB4MTI4MCwg
d2l0aCBhIEJEUyBvdXRwdXQgY29uZmlndXJhdGlvbiBzZXQgdG8NCj4gPiAyMzA0eDE1MzYgKHNl
bnNvciBpcyAyNTkyeDE5NDQpLg0KPiA+DQo+ID4gV2l0aG91dCB0aGUgcGF0Y2gsIGNvbmZpZ3Vy
aW5nIGEgNzl4NDUgZ3JpZCBvZiAxNngxNiBjZWxscyB3ZSBvYnRhaW4NCj4gPiB0aGUNCj4gPiBp
bWFnZTogaHR0cHM6Ly9wYXN0ZWJvYXJkLmNvL2c0bkM0ZkhqYlZFUi5wbmcuDQo+ID4gV2UgY2Fu
IG5vdGljZSBhIHdlaXJkIHBhZGRpbmcgZXZlcnkgdHdvIGxpbmVzIGFuZCBpdCBzZWVtcyB0byBi
ZQ0KPiA+IG1pc3NpbmcgaGFsZiBvZiB0aGUgZnJhbWUuDQo+ID4NCj4gPiBXaXRoIHRoZSBwYXRj
aCBhcHBsaWVkLCB0aGUgc2FtZSBjb25maWd1cmF0aW9uIGdpdmVzIHVzIHRoZSBpbWFnZToNCj4g
PiBodHRwczovL3Bhc3RlYm9hcmQuY28vcnphcDZheEl2VmR1LnBuZw0KPiA+DQo+ID4gV2UgY2Fu
IGNsZWFybHkgc2VlIHRoZSBvbmUgcGFkZGluZyBwaXhlbCBvbiB0aGUgcmlnaHQsIGFuZCB0aGUg
ZnJhbWUNCj4gPiBpcyBhbGwgdGhlcmUsIGFzIGV4cGVjdGVkLg0KPiA+DQo+ID4gVG9tYXN6OiBX
ZSdyZSBjb25jZXJuZWQgdGhhdCB0aGlzIHBhdGNoIG1heSBoYXZlIGFuIGltcGFjdCBvbiB0aGUN
Cj4gPiBDaHJvbWVPUyBJbnRlbCBDYW1lcmEgSEFMIHdpdGggdGhlIElQVTMuIElzIGl0IHBvc3Np
YmxlIGZvciBzb21lb25lIHRvDQo+ID4gcmV2aWV3IGFuZCB0ZXN0IHRoaXMgcGxlYXNlPw0KPiAN
Cj4gQXMgc2hvd24gYnkgdGhlIGltYWdlcyBhYm92ZSwgdGhpcyBpcyBhIHJlYWwgZml4LiBJdCBv
bmx5IGFmZmVjdHMgZ3JpZA0KPiBjb25maWd1cmF0aW9ucyB0aGF0IHVzZSBhIHNpbmdsZSBzdHJp
cGUgKGxlZnQgb3IgcmlnaHQpLCBzbyBlaXRoZXINCj4gInNtYWxsIiByZXNvbHV0aW9ucyAobGVz
cyB0aGFuIDEyODAgcGl4ZWxzIGF0IHRoZSBCRFMgb3V0cHV0IGlmIEkgcmVjYWxsDQo+IGNvcnJl
Y3RseSksIG9yIGdyaWQgY29uZmlndXJhdGlvbnMgdGhhdCBzcGFuIHRoZSBsZWZ0IHBhcnQgb2Yg
dGhlIGltYWdlDQo+IHdpdGggaGlnaGVyIHJlc29sdXRpb25zLiBUaGUgbGF0dGVyIGlzIHByb2Jh
Ymx5IHVubGlrZWx5LiBGb3IgdGhlIGZvcm1lciwNCj4gaXQgbWF5IGFmZmVjdCB0aGUgYmluYXJ5
IGxpYnJhcnksIGVzcGVjaWFsbHkgaWYgaXQgaW5jbHVkZXMgYSB3b3JrYXJvdW5kDQo+IGZvciB0
aGUgYnVnLg0KPiANCj4gU3RpbGwsIHRoaXMgY2hhbmdlIGlzIGdvb2QgSSBiZWxpZXZlLCBzbyBp
dCBzaG91bGQgYmUgdXBzdHJlYW1lZC4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVy
ZW50IFBpbmNoYXJ0DQo=
