Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C52843F4EB
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 04:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhJ2CUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 22:20:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:2636 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231348AbhJ2CUp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 22:20:45 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="217752616"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="217752616"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 19:18:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="498686037"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2021 19:18:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 19:18:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 19:18:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 19:18:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBvAhLqR3hQe3ELnVzPwvTJ0Yaai3gLSLVcWMfl7yUOcMp3OH5FwKtGohnWeB0jQ+asBhwCyyodgzDCelWxdcBbdcKE7Ey+LvuBgVMDluxewCsbDODlx5Zur9dBBWyWVjY2cK/nU2yRUxaCvG+2K02Hqy58Ta+MbR757So7rOLKsRPCKrX6GqPAaz1Us4iOdHuidTd7MYYpX5BJaZTOj4AY69DnvWCenyCN4JUatrESsxZvKEJWbEXMLrZdMTx5d+lxm02I8GDTuZNb0IZjGwEUdIQUwNn3UFCX4npPCEeAzw+8LG4wXpS0e569z6en8PF9Ys6nbe6cuTEErCz9jXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx66KCrzOqg5BsNHItwHvsiUiP/UYywnHFTlwuYgKVg=;
 b=cebge3sIcQaJkMcOsjo+bMV8qBK2XunTPnx34QQ8Jm8ZVhECyQUuNsUNs994KbvOhNOEaGC42ZQqNCj0S+5ut8sijAhvZ2J4lxv2O/314o3Ke5pBCTVx/bdHjI/QfyyEfubJVQXmGovWN0/m7vWIyDhrwH5eFnghXio1HcPTk2CyOZvB4JfGEipS7OYihEVmRALFAk05igrPvPCMno5bkvb8t/yhWgwH73lonMzabNHBmOxO6tEKWERJkhQTJ5H/YjTJeffb5Lw+NifzbzMbXlzXBaUvhr0IDkSV52Ygj8QyPWw8hoLOyuwmy3E5GIrU1dL+ouROMqNi63CjKQwAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wx66KCrzOqg5BsNHItwHvsiUiP/UYywnHFTlwuYgKVg=;
 b=Z9G2Ha0HneITzd+IQ8hSUVC+xRrbgSz/5ofNjIh/98B/eSsI+EjrlRSqL6m5c1sQOVMx2jwDjkiYrJXjF+IRB4KDtn92VoZDXT5QHTi1Ijdijvy3n2kihh2KTAIxzQQTm1YDeoYOioV9YZ2auTz/mSYHTpFNGc+qIk5lomtT0YA=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18; Fri, 29 Oct 2021 02:18:15 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 02:18:15 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Topic: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Index: AQHXw9CEorwlFxevV0mGeohgDRS1A6vaSIcAgAAp8eCAAAgIgIAFB0IAgAj8poCAANAiwA==
Date:   Fri, 29 Oct 2021 02:18:15 +0000
Message-ID: <DM8PR11MB5653F377D3FFB3F68723347C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
 <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com>
 <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
In-Reply-To: <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c274c38-c366-42ba-1f34-08d99a825da0
x-ms-traffictypediagnostic: DM8PR11MB5621:
x-microsoft-antispam-prvs: <DM8PR11MB56217FB8457A3ED7ABB9688299879@DM8PR11MB5621.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1NIva2fTGwXwRln2zMLB2ETQX2XEXDC+vorFBIgaNINr5A08qVIo7IplZNFPfPS8rDLURgi4V31SjDqBmr0b7M8eCHJy4TZ3mgg8+1uYGLe198KtXJ+IWCEL5B84b3lYakCDSqbjKm4FZyYNcpKQ6PjW1yM5njqtrCOV+3yogNcw3T749YZSLzy6m5/7YuV0wcaROQCjkSrz8r9G3O1m54aMf3iNizXZX0ffg7Oz5SwBHY+V5wIcprFd1Pr3OQaWk+GCYEjwqHSg8WIh6xNuxCvWdhwYNykdhEugNm753bgV5/VS7qecEuYI4tHbPQjOlPrD5hEOjko3iE3+LE3iyfQnV+LaQ9LdKhTXq6H0w4lbuvcEv35ajP2ODIp8hRJpE/6Eds21n2JGaeAwHCqG/4lhNe7cY68dH4o2G/m2KrMZmZO5RMH4wd5AcwXFv404TcUDFz3NoggHB7KHh0pRPvuLpgP/P7vxATkef4dzKo1HQzVgoY8r2C0/BRU19BSjeVU9gpsbw7Yzs1xjPVw3Jn8puppyDUdZHvznqSDjk9mq7Kcm32s+8hxNR3k6DhDqn42EI80b4+zR5F4xnkk9OKA9dmzqvHIQvQP7HLfIQUVkICOXBjWObKJv2rnsB1FJqhGYGyuDNhQXzPFpM79L6/r9qPRPpV9ZBv31PXIZfEdrnOXNx7Wo9xOddZnr1P4lt8jrPsj15tcY+1xnR3oLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(33656002)(110136005)(76116006)(316002)(83380400001)(122000001)(71200400001)(5660300002)(82960400001)(4326008)(8676002)(55016002)(53546011)(54906003)(6506007)(52536014)(8936002)(38100700002)(38070700005)(66476007)(66446008)(508600001)(2906002)(66946007)(66556008)(86362001)(64756008)(7696005)(26005)(9686003)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDl2Wk53dllIZzhwa004ZUVRNUpLa1l1OVZyM2VGNDRLdTRET3JqbUtubnlp?=
 =?utf-8?B?L01oTVUvdWJ5c1gxdjcxd015SjA2RkRibHJ3eENNd1JVYTR2NDZqMWQzOFp6?=
 =?utf-8?B?ckNMUDB1cFR2a0laTm9odjJLdklOU2tiOTdSYjNOVzlDbmNzbVlYSUhSNVRK?=
 =?utf-8?B?aUd5cElIOUs0aE42dUxId0o5dUxhVGg1ZkIrSXZoTUFOTEdRYTVZS0d1ZTZq?=
 =?utf-8?B?OENhUEREQ0pnZnhuUXAyU0tBZGxCazN6blJSbEFPcWg1QVBlSWQxbmdrY3Rq?=
 =?utf-8?B?Q0tOQXZGNFczYkx0YkFBVEJ0NTgyZXdldkVQTUdNclhueUpQMGpURkJydUNy?=
 =?utf-8?B?UWJOa1dSYTdzWHlNUEZ3QjdSVHVyOWRycTE3SnR3NTVJZzdVOEpBTWhab3g4?=
 =?utf-8?B?cWxDOXp5czAyWXVoLzhkTFk4VWROV3J4cGkyN0NHTTVWZFZyNll5ZXB6Y1FT?=
 =?utf-8?B?Mm5zNFZEcmwrVTNWKytuRmk1b1B5bXNrNFgrUk41aFNDVkd6VFJQT3NhRkxZ?=
 =?utf-8?B?UDhuS0VsT2FoN01NWHU5NlVrY1lqVGlXU2V2OThyOTRIL2crQWdxSlJDcmVJ?=
 =?utf-8?B?ODBScWoyT3JieUFhamJqSEsrNnpWMURJcXNKWkl6RmNvTkdkUm56WkFEUm43?=
 =?utf-8?B?cGE3LzI5K2pNbEZCczF6dExRR1lMbHRvWFNCTnBMVlJBUlo2ZkVDNXZtc0Jk?=
 =?utf-8?B?eGVXRTU5S2R4WkNZT09GU0lpUXFTbXZlSHAvSVJPUTdEYS9IQnU5ZVVhR2dI?=
 =?utf-8?B?bjBTcDNxQVVPWmQrMUZ1aHFtNldCdUl2SnlPUkltOGZJSjNpcTUzMGJ6aWM5?=
 =?utf-8?B?NzlLNGNmdm9yVjZIL0FwQUFGUEJyTTA5bXV1WDFrVVFUdEo4a0g2RnprZWc2?=
 =?utf-8?B?WXZhdWNCeVJaUTU5STNJdDd4aDZtbWR4dkJtVzhvNldRaHJ1ZXFqZkdoVkFv?=
 =?utf-8?B?cUpZVk1TdjBHVGtsak9zdkRvaXBrYWZ2MUJ3dGxDa2JCc1E5L2sreERRazZv?=
 =?utf-8?B?WUJKMThHckhZNm9tUDVDTFNqVlhtOVB5QXpsUVBkNThtV2plVmF5MDRaNnpR?=
 =?utf-8?B?OWdBWTRjTCszMlRrbko4anZVV00ySkgzc29vQUtISWcxWDNyUlVvemtxaHRY?=
 =?utf-8?B?T1lUWFNpcEp2dlBhTXhpS1RZTzRNc1ZpVTBqM1RKcjJseWl5WVFQcUkxWEw4?=
 =?utf-8?B?Z29qMFdGV3pKdEJzSzE1dnNTUVFnQXViUFMvd0NqTkMvRExDTUdidGphWFdW?=
 =?utf-8?B?WUhKMnNtVUQ3UlM3RDU0VlJ2R1UxeHAxMy80a1dJdkptREFtU3l2YVVsdkVY?=
 =?utf-8?B?YmE1REZ1N1ZHdS9WSW1kc3BuVGNHbC9hd29jbEtKNU1rTHV2OC9ERFovT0wr?=
 =?utf-8?B?aHI5K1VSOEkrN2hDaUF3S0V6dDVRZkg2QUJtcTlsSVBXRjQxc0ZGUE1LQVo2?=
 =?utf-8?B?RlpSNXlNZGR0dWI5bi9SSjRwVFkvREo1UXhUUVJCUXpjMkpsdGVMRjR0c0Ft?=
 =?utf-8?B?TkpRcTJVY01LTS80MW5JSkJKMnRpdnA5NzgvVFdPTkFMQk03WmY3bHlxQVFJ?=
 =?utf-8?B?aFRJQVE1SUpNTGpPdldqWCtYenU2OVptN1pSZmswMnEyY1YwRkN5blQ0ZHFL?=
 =?utf-8?B?M3BkSm1pWExyUVA4Y2VVVG5OK3NJdG1JN2I2Q3MyRVppMm5kc2NrYk5hd29n?=
 =?utf-8?B?MEo4R2dSWTNRb2ZpSVNCbXJvSUQ0N2NGKzV2NUpyYUMxZGRWVS9jME1seFgz?=
 =?utf-8?B?OWZTVm5BckFHejNmdzcxdmJwTHUvTW53WXZqMEhqMGpKQjYyb3Fpc085dGhv?=
 =?utf-8?B?MlEySGdPM29iWHlpb09FQzBmTEZhSUpJSDRyaFVTS21ORmVmd2VYQ0p5dWt0?=
 =?utf-8?B?OVh5MkhLMzVwWnFyYldEcWpuSHVUMVZXdFlNWHR4TVN2YWQxZHlGVk5iSGtX?=
 =?utf-8?B?ZWdwY1dWOEVJUTM3bDJrUEdZTlhTb3FKSlpNLzZEQmpsMzFjOW1SWVNwRVdt?=
 =?utf-8?B?Y3ZlUm9mWVEzbkF3ZWVPTzBidzMvTmNwUXZ5eHpiZUhuSjNPbmxIWUVYdVdH?=
 =?utf-8?B?aGwxV0VlMDQzdjlFaVJTUkI4VXE3WU9mbTZvUm1PZU1Zc1NUTFFNUHJZRmU5?=
 =?utf-8?B?aFY1cUdTZUJ3aHdpYUdRVTk5MXlzNkhZS0N1Myt3UkhYWDRqQlZFMmtWUWg2?=
 =?utf-8?Q?A30qxyeliMqM5c9y0V25ldk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c274c38-c366-42ba-1f34-08d99a825da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 02:18:15.5432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NQVcCGNK2sq1KyrMS4+H8QMI1G1Uh9bRpreyqUdiwG+4KYOs7kHjZp20opdpLp11CWZgI0mdcAKyppyVo44gtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U2FrYXJpIGFuZCBUb21hc3osDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fXw0KQlJzLCAgDQpCaW5nYnUgQ2FvIA0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+DQo+
IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDI4LCAyMDIxIDk6NTIgUE0NCj4gVG86IFNha2FyaSBB
aWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IENhbywgQmluZ2J1IDxi
aW5nYnUuY2FvQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4ga2ll
cmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbTsgYmluZ2J1LmNhb0BsaW51eC5pbnRlbC5jb20N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2M10gbWVkaWE6IGlteDI1ODogYWRkIHZibGFuayBjb250
cm9sIHRvIHN1cHBvcnQNCj4gbW9yZSBmcmFtZSByYXRlIHJhbmdlDQo+IA0KPiBPbiBTYXQsIE9j
dCAyMywgMjAyMSBhdCA1OjM4IEFNIFNha2FyaSBBaWx1cw0KPiA8c2FrYXJpLmFpbHVzQGxpbnV4
LmludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBCaW5nYnUsDQo+ID4NCj4gPiBPbiBUdWUs
IE9jdCAxOSwgMjAyMSBhdCAwMzo1ODo0MVBNICswMDAwLCBDYW8sIEJpbmdidSB3cm90ZToNCj4g
PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogQ2FvLCBCaW5n
YnUNCj4gPiA+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxOSwgMjAyMSAxMTozMCBQTQ0KPiA+
ID4gPiBUbzogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+
ID4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyB0ZmlnYUBjaHJvbWl1bS5vcmc7
DQo+ID4gPiA+IGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb207IGJpbmdidS5jYW9AbGlu
dXguaW50ZWwuY29tDQo+ID4gPiA+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjNdIG1lZGlhOiBpbXgy
NTg6IGFkZCB2YmxhbmsgY29udHJvbCB0bw0KPiA+ID4gPiBzdXBwb3J0IG1vcmUgZnJhbWUgcmF0
ZSByYW5nZQ0KPiA+ID4gPg0KPiA+ID4gPiBTYWthcmksDQo+ID4gPiA+DQo+ID4gPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fXw0KPiA+ID4gPiBCUnMsDQo+ID4gPiA+IEJpbmdidSBDYW8NCj4g
PiA+ID4NCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZy
b206IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCj4gPiA+ID4g
PiBTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDE5LCAyMDIxIDg6NTIgUE0NCj4gPiA+ID4gPiBUbzog
Q2FvLCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiA+ID4gPiA+IENjOiBsaW51eC1t
ZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IHRmaWdhQGNocm9taXVtLm9yZzsNCj4gPiA+ID4gPiBraWVy
YW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29tOyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0K
PiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIG1lZGlhOiBpbXgyNTg6IGFkZCB2Ymxh
bmsgY29udHJvbCB0bw0KPiA+ID4gPiA+IHN1cHBvcnQgbW9yZSBmcmFtZSByYXRlIHJhbmdlDQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiBIaSBCaW5nYnUsDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBN
b24sIE9jdCAxOCwgMjAyMSBhdCAxMToyNjoxNkFNICswODAwLCBCaW5nYnUgQ2FvIHdyb3RlOg0K
PiA+ID4gPiA+ID4gQ3VycmVudCBpbXgyNTggZHJpdmVyIGVuYWJsZSB0aGUgYXV0b21hdGljIGZy
YW1lIGxlbmd0aA0KPiA+ID4gPiA+ID4gdHJhY2tpbmcgY29udHJvbCBieSBkZWZhdWx0IGFuZCBk
aWQgbm90IHN1cHBvcnQgVkJMQU5LIGNoYW5nZSwNCj4gPiA+ID4gPiA+IGl0J3MgYWx3YXlzDQo+
ID4gPiA+ID4gd29ya2luZyBhdCAzMGZwcy4NCj4gPiA+ID4gPiA+IEhvd2V2ZXIsIGluIHJlYWxp
dHkgd2UgbmVlZCBhIHdpZGVyIGZyYW1lIHJhdGUgcmFuZ2UgZnJvbSAxNQ0KPiB0byAzMC4NCj4g
PiA+ID4gPiA+IFRoaXMgcGF0Y2ggZGlzYWJsZSB0aGUgYXV0b21hdGljIGZyYW1lIGxlbmd0aCB0
cmFja2luZyBjb250cm9sDQo+ID4gPiA+ID4gPiBhbmQgZW5hYmxlIHRoZSB2NGwyIFZCTEFOSyBj
b250cm9sIHRvIGFsbG93IHVzZXIgY2hhbmdpbmcNCj4gPiA+ID4gPiA+IGZyYW1lIHJhdGUgcGVy
DQo+ID4gPiA+ID4gcmVxdWlyZW1lbnQuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+DQo+ID4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9pbXgyNTguYyB8IDIzICsrKysrKysr
KysrKysrKysrLS0tLS0tDQo+ID4gPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI1OC5jDQo+ID4gPiA+ID4gPiBiL2RyaXZlcnMvbWVk
aWEvaTJjL2lteDI1OC5jIGluZGV4IDgxY2RmMzcyMTZjYS4uMmM3ODdhZjcwNzRkDQo+ID4gPiA+
ID4gPiAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI1OC5j
DQo+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNTguYw0KPiA+ID4gPiA+
ID4gQEAgLTI5LDYgKzI5LDcgQEANCj4gPiA+ID4gPiA+ICAjZGVmaW5lIElNWDI1OF9WVFNfTUFY
ICAgICAgICAgICAgICAgICAweGZmZmYNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgLypGcmFt
ZSBMZW5ndGggTGluZSovDQo+ID4gPiA+ID4gPiArI2RlZmluZSBJTVgyNThfUkVHX0ZMTCAgICAg
ICAgICAgICAgICAgMHgwMzQwDQo+ID4gPiA+ID4gPiAgI2RlZmluZSBJTVgyNThfRkxMX01JTiAg
ICAgICAgICAgICAgICAgMHgwOGE2DQo+ID4gPiA+ID4gPiAgI2RlZmluZSBJTVgyNThfRkxMX01B
WCAgICAgICAgICAgICAgICAgMHhmZmZmDQo+ID4gPiA+ID4gPiAgI2RlZmluZSBJTVgyNThfRkxM
X1NURVAgICAgICAgICAgICAgICAgICAgICAgICAxDQo+ID4gPiA+ID4gPiBAQCAtMjQxLDcgKzI0
Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MjU4X3JlZw0KPiA+ID4gPiA+ID4gbW9kZV80
MjA4eDMxMThfcmVnc1tdDQo+ID4gPiA+ID4gPSB7DQo+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgw
MzRELCAweDcwIH0sDQo+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgwMzRFLCAweDBDIH0sDQo+ID4g
PiA+ID4gPiAgICAgICAgIHsgMHgwMzRGLCAweDMwIH0sDQo+ID4gPiA+ID4gPiAtICAgICAgIHsg
MHgwMzUwLCAweDAxIH0sDQo+ID4gPiA+ID4gPiArICAgICAgIHsgMHgwMzUwLCAweDAwIH0sIC8q
IG5vIGZyYW1lIGxlbmd0aCBhdXRvbWF0aWMNCj4gPiA+ID4gPiA+ICsgdHJhY2tpbmcgY29udHJv
bCAqLw0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDIwMiwgMHgwQyB9LA0KPiA+ID4gPiA+ID4g
ICAgICAgICB7IDB4MDIwMywgMHg0NiB9LA0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDIwNCwg
MHgwMCB9LA0KPiA+ID4gPiA+ID4gQEAgLTM2MCw3ICszNjEsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGlteDI1OF9yZWcNCj4gPiA+ID4gPiA+IG1vZGVfMjEwNF8xNTYwX3JlZ3NbXQ0KPiA+ID4g
PiA+ID0gew0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0RCwgMHgzOCB9LA0KPiA+ID4gPiA+
ID4gICAgICAgICB7IDB4MDM0RSwgMHgwNiB9LA0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0
RiwgMHgxOCB9LA0KPiA+ID4gPiA+ID4gLSAgICAgICB7IDB4MDM1MCwgMHgwMSB9LA0KPiA+ID4g
PiA+ID4gKyAgICAgICB7IDB4MDM1MCwgMHgwMCB9LCAvKiBubyBmcmFtZSBsZW5ndGggYXV0b21h
dGljDQo+ID4gPiA+ID4gPiArIHRyYWNraW5nIGNvbnRyb2wgKi8NCj4gPiA+ID4gPiA+ICAgICAg
ICAgeyAweDAyMDIsIDB4MDYgfSwNCj4gPiA+ID4gPiA+ICAgICAgICAgeyAweDAyMDMsIDB4MkUg
fSwNCj4gPiA+ID4gPiA+ICAgICAgICAgeyAweDAyMDQsIDB4MDAgfSwNCj4gPiA+ID4gPiA+IEBA
IC00NzksNyArNDgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbXgyNThfcmVnDQo+ID4gPiA+
ID4gPiBtb2RlXzEwNDhfNzgwX3JlZ3NbXQ0KPiA+ID4gPiA+ID0gew0KPiA+ID4gPiA+ID4gICAg
ICAgICB7IDB4MDM0RCwgMHgxOCB9LA0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0RSwgMHgw
MyB9LA0KPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0RiwgMHgwQyB9LA0KPiA+ID4gPiA+ID4g
LSAgICAgICB7IDB4MDM1MCwgMHgwMSB9LA0KPiA+ID4gPiA+ID4gKyAgICAgICB7IDB4MDM1MCwg
MHgwMCB9LCAvKiBubyBmcmFtZSBsZW5ndGggYXV0b21hdGljDQo+ID4gPiA+ID4gPiArIHRyYWNr
aW5nIGNvbnRyb2wgKi8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFdoeSBpcyBhdXRvbWF0aWMgZnJh
bWUgbGVuZ3RoIGNvbnRyb2wgZGlzYWJsZWQ/DQo+ID4gPiA+DQo+ID4gPiA+IE15IHVuZGVyc3Rh
bmRpbmc6DQo+ID4gPiA+IElmIGF1dG9tYXRpYyBmcmFtZSBsZW5ndGggY29udHJvbCBlbmFibGVk
LCB0aGUgZnJhbWUgbGVuZ3RoIGlzDQo+ID4gPiA+IGNoYW5nZWQgYXV0b21hdGljYWxseSB3aGVu
IENPQVJTRV9JTlRFR1JBVEVfVElNRSArIDEwID4NCj4gPiA+ID4gRlJBTUVfTEVOR1RIX0xJTkVT
LCBpdCBtYXkgbm90IG1lZXQgdGhlIHJlcXVpcmVtZW50IC0gbGVzcw0KPiBpbnRlZ3JhdGUgdGlt
ZSB3aXRoIG1vcmUgZnJhbWUgbGVuZ3RoLg0KPiA+ID4gPiB3ZSBuZWVkIGNvbnRyb2wgdGhlIHZl
cnRpY2FsIGJsYW5rIHRvIGRvIHRoYXQuDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gSWYgZnJhbWUg
bGVuZ3RoIGF1dG9tYXRpYyB0cmFja2luZyBjb250cm9sIGVuYWJsZWQsIHRoZQ0KPiA+ID4gQ09S
U0VfSU5URUdSQVRFX1RJTUUgY291bGQgYmUgbGFyZ2VyIHRoYW4gRlJBTUVfTEVOR1RIX0xJTkVT
Lg0KPiA+DQo+ID4gQm90aCBhcmUgY29udHJvbGxlZCBieSB0aGUgZHJpdmVyLiBUaGUgZHJpdmVy
IGlzIGdlbmVyYWxseSByZXNwb25zaWJsZQ0KPiA+IGZvciBlbnN1cmluZyB0aGUgZXhwb3N1cmUg
dGltZSBzdGF5cyB3aXRoaW4gdGhlIGxpbWl0cyBmb3IgYSBnaXZlbg0KPiA+IGZyYW1lIGxlbmd0
aC4NCj4gPg0KPiA+IFVubGVzcyB0aGlzIHNlbnNvciBkb2VzIHNvbWV0aGluZyB3ZWlyZCwgYWxs
IHlvdSBnZXQgYnkgZGlzYWJsaW5nIHRoaXMNCj4gPiBpcyB1bmRlZmluZWQgYmVoYXZpb3VyIGlu
c3RlYWQgb2YgaW5jcmVhc2VkIGZyYW1lIGxlbmd0aCB3aGVuIHRoZQ0KPiA+IGV4cG9zdXJlIHRp
bWUgKyBtYXJnaW4gZXhjZWVkcyBmcmFtZSBsZW5ndGguIFRoaXMgY291bGQgbWVhbiBicm9rZW4N
Cj4gZnJhbWVzLg0KPiA+DQo+ID4gT2YgY291cnNlLCBpdCB0YWtlcyBhIGRyaXZlciBidWcgdG8g
YXJyaXZlIGludG8gdGhpcyBzaXR1YXRpb24uDQo+IA0KPiBJJ2QgYXJndWUgdGhhdCBlbmFibGlu
ZyB0aGUgYXV0b21hdGljIGNvbnRyb2wgd291bGQgbWFrZSBpdCBtdWNoIG1vcmUNCj4gZGlmZmlj
dWx0IHRvIHNwb3QgdGhlIGRyaXZlciBidWcgaW4gdGhpcyBjYXNlIGFuZCBzbyBpdCB3b3VsZCBi
ZSBtb3JlDQo+IGRlc2lyYWJsZSB0byBrZWVwIGl0IGRpc2FibGVkIGFzIGluIHRoaXMgcGF0Y2gu
DQoNCllvdSBhcmUgcmlnaHQsIEkgd2lsbCByZW1vdmUgdGhlIGNoYW5nZSBpbiBuZXh0IHZlcnNp
b24uDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0K
