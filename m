Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0157A43F6C2
	for <lists+linux-media@lfdr.de>; Fri, 29 Oct 2021 07:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231854AbhJ2Fpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Oct 2021 01:45:35 -0400
Received: from mga04.intel.com ([192.55.52.120]:34000 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231774AbhJ2Fpf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Oct 2021 01:45:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="229321232"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="229321232"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 22:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; 
   d="scan'208";a="498761343"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP; 28 Oct 2021 22:43:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 22:43:06 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 22:43:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 22:43:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 22:43:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXKekB9bPjzO8jRFsQB6BnMZaGoWJnO6gV3tlABlYeFQSyHLtikQKMbn8Q7dQFXXjd2eymwpVmbB4iYBBDx7RtVreaINeLDY1AnNJir2XceopY8Ei89d9d5CK04stWKWNK5HscPLML6ren2hiX80yFcDAxdzDAox/Q1NMVyJdb38nFAaUgp1WW5qsFhZwpGfwzJuIqdDiuyhgGuYow7qToC5G3F/6MlygCxF7A6mz27eE8/xh2c4smAqZFvgAKnRu/57HTr/xinBv+p8fvkD/681srjomxKzBK9pxli7oqzgkOScqJTSeZ8zUQWMWwyu+pVdC02WMBJ3yejjt8LV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xapn4pS3pAulSdpq6zTgRNnH2Wj5V06pGUohI462cUg=;
 b=TDRVShB2A9vP2tcYvlqKEhL3fpmJFnip0KYV8MQ3qfqgHzO3GnjvrL+9FW/XU+Z+2mTx6daxYpQCMMoMF80JLZ/NuXv5CUhsu2NC11g4I48N5h5IZYW9O/B1CSPT5NxoP5dlF9iOqguS6X7u2SgJgc5rgt/fw9QKjgAtjTNlE4hwS9Y86U2dNRlLC1IbfqRlheFmZA22eM6HPcZLAOF710iWDepNtMbTl6Y9o8hKvrhru1WjMIZIYM4wixz760rDM7bF7zAcWJkZfKWp6yfUeDIDpX0D3sgbvZUyEeVQuRLVzmTsFf04o4HhOc0tffg3OQHCNs8Jfxg3kPK/fDAajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xapn4pS3pAulSdpq6zTgRNnH2Wj5V06pGUohI462cUg=;
 b=g2hRafGGfUwesfpvVCoJ00TlTPK66GcKmi8ljxxvjMQEQuBftwwb29lWIRXtQuStXlHiQnLxpQQKEz9G//JJ2Cf8bnCc3LxpnalOdCF/AQZfIK/iZ70JrWlRVuOYabMy26sg1C5EmNwhwUb6I2X+3d3OKeY1qtOy57Gq317eIEI=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14; Fri, 29 Oct 2021 05:43:04 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 05:43:04 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Topic: [PATCH v3] media: imx258: add vblank control to support more
 frame rate range
Thread-Index: AQHXw9CEorwlFxevV0mGeohgDRS1A6vaSIcAgAAp8eCAAAgIgIAFB0IAgAj8poCAANAiwIAADWoAgAArX0A=
Date:   Fri, 29 Oct 2021 05:43:04 +0000
Message-ID: <DM8PR11MB56530049739DE29B4D87D77C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634527576-2928-1-git-send-email-bingbu.cao@intel.com>
 <YW6/ZGI5/j4UDaBQ@paasikivi.fi.intel.com>
 <DM8PR11MB56532CA3BC7F2FDCD78C4E7E99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <DM8PR11MB5653B7646DEFC3F481B98CEF99BD9@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YXMhJJJYZl+A6dU7@paasikivi.fi.intel.com>
 <CAAFQd5BJg2PMzLCJC-QkPQagKH4d+94bw_Girb=63yw-SDPv8Q@mail.gmail.com>
 <DM8PR11MB5653F377D3FFB3F68723347C99879@DM8PR11MB5653.namprd11.prod.outlook.com>
 <CAAFQd5A9ofY4yDTxorrjGqdx9QnoWYXwssMe=6hi5qVEJPsbNA@mail.gmail.com>
In-Reply-To: <CAAFQd5A9ofY4yDTxorrjGqdx9QnoWYXwssMe=6hi5qVEJPsbNA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: bc27cf88-25ab-4a10-1b2f-08d99a9efa2d
x-ms-traffictypediagnostic: DM8PR11MB5640:
x-microsoft-antispam-prvs: <DM8PR11MB5640DB53CFB8562D6653D0EA99879@DM8PR11MB5640.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P/U5anxVleMYIJak32B4nEazGFPGNNy+C70Ld6lfu3ltbuRqBd/lP1lRPx4AQJv66bnnhI7T+FadTzjSJmGKdjXgTI5b68uCAzRFhXv+opRXldJXZt5L03JaHclwV80hil36lMsOm/NlU+uWRf7GY8A2qneakq+bn4NUwQeK02ZSq92cuEVa99HbAZtbcSGwnyWtBCnySATARcXBcTf5xM8TjTMQfmg65LescCzVr7COIbLMQ1+KqQL3bW9pFOZF7eC9SDfphhHO4E9ul2Kf/x33QNDmRPnZ5OO0cpQyobkAXhwCRt0ajtCwI7FCTtX0C188QKRDCt6lj4VJMkkNlmaTe1rfVayDgPYLutUZih3UY3GiN3L9T4WI4NGfyX/JjvHtP8af2SnQ6GVm4MYNT0aVhSdYLR83BDOE78uKv0/0iy5g9z93qNkJJsilSEUMTacXOW2Lekhg1IQJiTzg8jHmP0pPhxR2WWSfimpXb0hvBGAkqP6fS+CgfhD77a5FOGx/T6X85P1r1exLFgWYT2gasctyemsT118IqPX16oLtG/E6WuF/gTUc0VB6GfhIHMWt1A5g6FyJe2K3FXRceKvpQkCLlnvVpMVFcQcxNsJ0c309LH+j4m540qxUH7gyudn0qYCIyJZW4euI/6pKLPFP+IoNzftmW+z4kFCjiftLjeALGX8S9PrJGFf31fV0S8vD8QFpFZq24tJ64Z4EPw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(64756008)(6506007)(38100700002)(53546011)(186003)(66476007)(38070700005)(66946007)(83380400001)(71200400001)(9686003)(26005)(55016002)(122000001)(6916009)(66446008)(76116006)(66556008)(52536014)(8936002)(4326008)(508600001)(86362001)(33656002)(82960400001)(2906002)(5660300002)(7696005)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0RqU3JLcW41bzI4cTN5SjJjblNtVU5qZklMZGpTZDR0N0xQblVZMGJma0VC?=
 =?utf-8?B?bStQOWxPTEtQNVI3ZlRBSGthS09WYmZ5RjlIVmd6b1RiN1JPQ0RRek5pZElH?=
 =?utf-8?B?TjdzWEZiTkpTYllTTEo4UFFNVnlwc25zWW1BN3lCM2haUEdmdWp0MEU2SzNC?=
 =?utf-8?B?NXNWbEhTRGE1Z0t3T0g5Zm96OGFva0llVVhnKzl4SStSZllqWXF0Zkc3WXdY?=
 =?utf-8?B?UlNVZ2hQWE5oNXhOUytoejVuTHRrZWU3UE5WSkhub3JXUWhGeGxLL1QvYmI1?=
 =?utf-8?B?UEVHOTdnSzVhdFFvRWFSMnJubTdMTTRVU1N0N3k3Zjl6eUYzU0lsZy9mT3dw?=
 =?utf-8?B?cUdjMHRqbmJyMTU5QmEya1lCRW9wLzdqRjRCbWw4Zk83NVRSelZkRlNTWm1w?=
 =?utf-8?B?NFN2WTlUS1VubGtNMy96N1F3eVdnSTJEUll4U0FobDdTQ2V0a2t1VEZYd0xT?=
 =?utf-8?B?Tmd2VUpDMmZYdDc0VG9ZZHJWTzA5bHg5bnhXOG9rS2FGWms3NGZpZU5MYVNY?=
 =?utf-8?B?Z3dXNzl1VTAreUtZL3ZlUmZaWmo3Zk16aFN6YVd2bWI0ZWdnOThvRnpJSFdF?=
 =?utf-8?B?L05xVDZTZ2RyLy9Vb3VDU0hoU2pnZk1GR25GWmlGNXZKWGh6dGZsQkpYVFBk?=
 =?utf-8?B?OW4reTBvVFhXZDQ1dlkxbDhST2hobnZud0VjYkFodGVPbFFONUZjUk5VNmhW?=
 =?utf-8?B?eXVPTWY3VWNWckpUTEFDUFdkWXN6U0Ftc2pEZVlwc1pLUGN2eTNhMWlEWUlz?=
 =?utf-8?B?OVFEd2NGdFcyWFFQMXFtSFdkS2VtWVp2YVlUQXJiM3grT21NVUppZGhLTVR0?=
 =?utf-8?B?akhwbjBrZkFxUVJZM3pUSTVyUkdkSmd1bG1nVnFGZFM4amUrMjZzVHF4SC9T?=
 =?utf-8?B?ZVpmM2JGY0ltWWZ3MkxZeUJJZzBHN0ptYTdZdW90WEhpWkM5K0pYRmR5OUpY?=
 =?utf-8?B?MC9DOVpzYjhQaVdaTkkzS2lUTHpxWFlpaEdaWFI4cUxBKzh0OWxranV6UkVi?=
 =?utf-8?B?Z0VCd0ZyZElSTnd4ZHovUDQ5M3FNaTFmVU84WVdxakFDcEM0ck9VRWNtM21Z?=
 =?utf-8?B?R1NCcTViSkcrUExIMzZLTkRwdDVlM3IzVHJUVEpnbyt1ZEVFU0ZiOUQzUXdz?=
 =?utf-8?B?eE5qZWUyaGdIcm5iMGVmOUFtY1d0TlgvUFlXdzhtbnBuSFdVcXRELytZeGtO?=
 =?utf-8?B?ci9FbEQrQk9rc3Z4cXBIY0JTZXREWURFelhBejduMjVkSVRSb3BNem9mdnV3?=
 =?utf-8?B?VHhPeG9Jd2FKenNES29Hd1h3UnU4Qkh3WHp1Zll4K0NHTE1jbjl6NDk2eGRR?=
 =?utf-8?B?RlhvZi95dC9mT2JSOHFWUE5sU2NabXU5eFFtZVBVeGlPc2ZtMUVnSFUyTCtW?=
 =?utf-8?B?dWMyNGpRQXMrLzZ0c1NEWlcxbm15Zzh3anpMZWFjUFpaVG5vVzRQMnJBZ25O?=
 =?utf-8?B?THdzMzRBUG03bnZ5ejlDR1lOTTBXaFpaR2hTWXIvUGx3KzlwenVPcTNrdmZh?=
 =?utf-8?B?dFU4MWNnQzVlUkJKNGZBVmdhQng4YXp0OExJNzFXUURNMDZUdkswUzIvTjI1?=
 =?utf-8?B?aXltT0FZZTBwNjd5YzdFNGR2cTd5Q0lEYm5GbzF1ZndnZi91emZVbGpweTBt?=
 =?utf-8?B?OEpxZTdCTVZUMlo3Y2VXVEdIL3FhZ0tPenVHaTFnTzlhWDdST0JEVVNwbFk3?=
 =?utf-8?B?NzJMbDN2SmVjbURtSHRIcXczRFFURVo5UzZhR2lFN2lRekw5eDR3Zi9HanpW?=
 =?utf-8?B?T1l1T2xKbmNXODJia0tpdUVySDNuN0RYVXJVdU9uYzFsdG1mbXFDVnVodm5k?=
 =?utf-8?B?dVZRLzNlV25RNkd0Rldsa3VMYVdxWFJHSForSk1OcUUvMkRtUGlYVk11R2JH?=
 =?utf-8?B?V01CL2xRdWtuNFBOV2s1Rm5PQWxjbGhUSGZyWTFBb0RQRHBqVndqRkV5R01P?=
 =?utf-8?B?RzRXeFJOT2xPakVWWTZzNXdkUytTV2Q4dTd2VWI2Rk0vU0lwdmQ5Z0luWVRP?=
 =?utf-8?B?Ti82ZjZ1ckYzYytOd1VSYlFNaytQYjZ2WksxMzRRbHFKaHJja0ZpaU50OTNZ?=
 =?utf-8?B?NncrSVJBdCtOdGxnOXV0SDhKUlFyVG5ESFB5ZXZHMlo2MHdKMGF0WGhDYlZw?=
 =?utf-8?B?ZE1TcFhka0ZZdDFLbHNIS2RmeVFkQ0Y2VGVmajBWOHNHOGdEdFY0TW9zdTF5?=
 =?utf-8?Q?48yx0QbFAZ6Z3D3PXyswTNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc27cf88-25ab-4a10-1b2f-08d99a9efa2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 05:43:04.1500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iytCx+6AGhol8ns4wNi84yqqcgcb+7ugZhP5aoWzsSbG+OKpEexABRqzzQ7SnbKzvH0EZYKdQEmAesiDP+OGoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5640
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21hc3ogRmlnYSA8dGZpZ2FA
Y2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE9jdG9iZXIgMjksIDIwMjEgMTE6MDUgQU0N
Cj4gVG86IENhbywgQmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCj4gQ2M6IFNha2FyaSBB
aWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT47IGxpbnV4LQ0KPiBtZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmc7IGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb207DQo+IGJpbmdidS5j
YW9AbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIG1lZGlhOiBpbXgy
NTg6IGFkZCB2YmxhbmsgY29udHJvbCB0byBzdXBwb3J0DQo+IG1vcmUgZnJhbWUgcmF0ZSByYW5n
ZQ0KPiANCj4gT24gRnJpLCBPY3QgMjksIDIwMjEgYXQgMTE6MTggQU0gQ2FvLCBCaW5nYnUgPGJp
bmdidS5jYW9AaW50ZWwuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFNha2FyaSBhbmQgVG9tYXN6
LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCj4gPg0KPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fXw0KPiA+IEJScywNCj4gPiBCaW5nYnUgQ2FvDQo+ID4NCj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hy
b21pdW0ub3JnPg0KPiA+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMjgsIDIwMjEgOTo1MiBQ
TQ0KPiA+ID4gVG86IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4N
Cj4gPiA+IENjOiBDYW8sIEJpbmdidSA8YmluZ2J1LmNhb0BpbnRlbC5jb20+OyBsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBraWVyYW4uYmluZ2hhbUBpZGVhc29uYm9hcmQuY29t
OyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2
M10gbWVkaWE6IGlteDI1ODogYWRkIHZibGFuayBjb250cm9sIHRvIHN1cHBvcnQNCj4gPiA+IG1v
cmUgZnJhbWUgcmF0ZSByYW5nZQ0KPiA+ID4NCj4gPiA+IE9uIFNhdCwgT2N0IDIzLCAyMDIxIGF0
IDU6MzggQU0gU2FrYXJpIEFpbHVzDQo+ID4gPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNv
bT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIEJpbmdidSwNCj4gPiA+ID4NCj4gPiA+ID4g
T24gVHVlLCBPY3QgMTksIDIwMjEgYXQgMDM6NTg6NDFQTSArMDAwMCwgQ2FvLCBCaW5nYnUgd3Jv
dGU6DQo+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+ID4g
RnJvbTogQ2FvLCBCaW5nYnUNCj4gPiA+ID4gPiA+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTks
IDIwMjEgMTE6MzAgUE0NCj4gPiA+ID4gPiA+IFRvOiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1
c0BsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+ID4gPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJu
ZWwub3JnOyB0ZmlnYUBjaHJvbWl1bS5vcmc7DQo+ID4gPiA+ID4gPiBraWVyYW4uYmluZ2hhbUBp
ZGVhc29uYm9hcmQuY29tOyBiaW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0KPiA+ID4gPiA+ID4g
U3ViamVjdDogUkU6IFtQQVRDSCB2M10gbWVkaWE6IGlteDI1ODogYWRkIHZibGFuayBjb250cm9s
IHRvDQo+ID4gPiA+ID4gPiBzdXBwb3J0IG1vcmUgZnJhbWUgcmF0ZSByYW5nZQ0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IFNha2FyaSwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBfX19fX19f
X19fX19fX19fX19fX19fX18NCj4gPiA+ID4gPiA+IEJScywNCj4gPiA+ID4gPiA+IEJpbmdidSBD
YW8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiA+ID4gPiA+IEZyb206IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPiA+ID4gPiA+ID4gU2VudDogVHVlc2RheSwgT2N0b2JlciAxOSwgMjAyMSA4
OjUyIFBNDQo+ID4gPiA+ID4gPiA+IFRvOiBDYW8sIEJpbmdidSA8YmluZ2J1LmNhb0BpbnRlbC5j
b20+DQo+ID4gPiA+ID4gPiA+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IHRmaWdh
QGNocm9taXVtLm9yZzsNCj4gPiA+ID4gPiA+ID4ga2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJk
LmNvbTsgYmluZ2J1LmNhb0BsaW51eC5pbnRlbC5jb20NCj4gPiA+ID4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCB2M10gbWVkaWE6IGlteDI1ODogYWRkIHZibGFuayBjb250cm9sIHRvDQo+ID4g
PiA+ID4gPiA+IHN1cHBvcnQgbW9yZSBmcmFtZSByYXRlIHJhbmdlDQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IEhpIEJpbmdidSwNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT24g
TW9uLCBPY3QgMTgsIDIwMjEgYXQgMTE6MjY6MTZBTSArMDgwMCwgQmluZ2J1IENhbyB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiBDdXJyZW50IGlteDI1OCBkcml2ZXIgZW5hYmxlIHRoZSBhdXRvbWF0
aWMgZnJhbWUgbGVuZ3RoDQo+ID4gPiA+ID4gPiA+ID4gdHJhY2tpbmcgY29udHJvbCBieSBkZWZh
dWx0IGFuZCBkaWQgbm90IHN1cHBvcnQgVkJMQU5LDQo+ID4gPiA+ID4gPiA+ID4gY2hhbmdlLCBp
dCdzIGFsd2F5cw0KPiA+ID4gPiA+ID4gPiB3b3JraW5nIGF0IDMwZnBzLg0KPiA+ID4gPiA+ID4g
PiA+IEhvd2V2ZXIsIGluIHJlYWxpdHkgd2UgbmVlZCBhIHdpZGVyIGZyYW1lIHJhdGUgcmFuZ2Ug
ZnJvbQ0KPiA+ID4gPiA+ID4gPiA+IDE1DQo+ID4gPiB0byAzMC4NCj4gPiA+ID4gPiA+ID4gPiBU
aGlzIHBhdGNoIGRpc2FibGUgdGhlIGF1dG9tYXRpYyBmcmFtZSBsZW5ndGggdHJhY2tpbmcNCj4g
PiA+ID4gPiA+ID4gPiBjb250cm9sIGFuZCBlbmFibGUgdGhlIHY0bDIgVkJMQU5LIGNvbnRyb2wg
dG8gYWxsb3cgdXNlcg0KPiA+ID4gPiA+ID4gPiA+IGNoYW5naW5nIGZyYW1lIHJhdGUgcGVyDQo+
ID4gPiA+ID4gPiA+IHJlcXVpcmVtZW50Lg0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmluZ2J1IENhbyA8YmluZ2J1LmNhb0BpbnRlbC5jb20+DQo+ID4g
PiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2lteDI1
OC5jIHwgMjMgKysrKysrKysrKysrKysrKystLS0tLS0NCj4gPiA+ID4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MjU4
LmMNCj4gPiA+ID4gPiA+ID4gPiBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI1OC5jIGluZGV4DQo+
ID4gPiA+ID4gPiA+ID4gODFjZGYzNzIxNmNhLi4yYzc4N2FmNzA3NGQNCj4gPiA+ID4gPiA+ID4g
PiAxMDA2NDQNCj4gPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNTgu
Yw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI1OC5jDQo+ID4g
PiA+ID4gPiA+ID4gQEAgLTI5LDYgKzI5LDcgQEANCj4gPiA+ID4gPiA+ID4gPiAgI2RlZmluZSBJ
TVgyNThfVlRTX01BWCAgICAgICAgICAgICAgICAgMHhmZmZmDQo+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiAgLypGcmFtZSBMZW5ndGggTGluZSovDQo+ID4gPiA+ID4gPiA+ID4gKyNk
ZWZpbmUgSU1YMjU4X1JFR19GTEwgICAgICAgICAgICAgICAgIDB4MDM0MA0KPiA+ID4gPiA+ID4g
PiA+ICAjZGVmaW5lIElNWDI1OF9GTExfTUlOICAgICAgICAgICAgICAgICAweDA4YTYNCj4gPiA+
ID4gPiA+ID4gPiAgI2RlZmluZSBJTVgyNThfRkxMX01BWCAgICAgICAgICAgICAgICAgMHhmZmZm
DQo+ID4gPiA+ID4gPiA+ID4gICNkZWZpbmUgSU1YMjU4X0ZMTF9TVEVQICAgICAgICAgICAgICAg
ICAgICAgICAgMQ0KPiA+ID4gPiA+ID4gPiA+IEBAIC0yNDEsNyArMjQyLDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBpbXgyNThfcmVnDQo+ID4gPiA+ID4gPiA+ID4gbW9kZV80MjA4eDMxMThfcmVn
c1tdDQo+ID4gPiA+ID4gPiA+ID0gew0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgeyAweDAzNEQs
IDB4NzAgfSwNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgwMzRFLCAweDBDIH0sDQo+ID4g
PiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0RiwgMHgzMCB9LA0KPiA+ID4gPiA+ID4gPiA+IC0g
ICAgICAgeyAweDAzNTAsIDB4MDEgfSwNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgIHsgMHgwMzUw
LCAweDAwIH0sIC8qIG5vIGZyYW1lIGxlbmd0aCBhdXRvbWF0aWMNCj4gPiA+ID4gPiA+ID4gPiAr
IHRyYWNraW5nIGNvbnRyb2wgKi8NCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgwMjAyLCAw
eDBDIH0sDQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDIwMywgMHg0NiB9LA0KPiA+ID4g
PiA+ID4gPiA+ICAgICAgICAgeyAweDAyMDQsIDB4MDAgfSwNCj4gPiA+ID4gPiA+ID4gPiBAQCAt
MzYwLDcgKzM2MSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MjU4X3JlZw0KPiA+ID4gPiA+
ID4gPiA+IG1vZGVfMjEwNF8xNTYwX3JlZ3NbXQ0KPiA+ID4gPiA+ID4gPiA9IHsNCj4gPiA+ID4g
PiA+ID4gPiAgICAgICAgIHsgMHgwMzRELCAweDM4IH0sDQo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICB7IDB4MDM0RSwgMHgwNiB9LA0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgeyAweDAzNEYsIDB4
MTggfSwNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIHsgMHgwMzUwLCAweDAxIH0sDQo+ID4gPiA+
ID4gPiA+ID4gKyAgICAgICB7IDB4MDM1MCwgMHgwMCB9LCAvKiBubyBmcmFtZSBsZW5ndGggYXV0
b21hdGljDQo+ID4gPiA+ID4gPiA+ID4gKyB0cmFja2luZyBjb250cm9sICovDQo+ID4gPiA+ID4g
PiA+ID4gICAgICAgICB7IDB4MDIwMiwgMHgwNiB9LA0KPiA+ID4gPiA+ID4gPiA+ICAgICAgICAg
eyAweDAyMDMsIDB4MkUgfSwNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgwMjA0LCAweDAw
IH0sDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTQ3OSw3ICs0ODAsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGlteDI1OF9yZWcNCj4gPiA+ID4gPiA+ID4gPiBtb2RlXzEwNDhfNzgwX3JlZ3NbXQ0KPiA+
ID4gPiA+ID4gPiA9IHsNCj4gPiA+ID4gPiA+ID4gPiAgICAgICAgIHsgMHgwMzRELCAweDE4IH0s
DQo+ID4gPiA+ID4gPiA+ID4gICAgICAgICB7IDB4MDM0RSwgMHgwMyB9LA0KPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgeyAweDAzNEYsIDB4MEMgfSwNCj4gPiA+ID4gPiA+ID4gPiAtICAgICAgIHsg
MHgwMzUwLCAweDAxIH0sDQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICB7IDB4MDM1MCwgMHgwMCB9
LCAvKiBubyBmcmFtZSBsZW5ndGggYXV0b21hdGljDQo+ID4gPiA+ID4gPiA+ID4gKyB0cmFja2lu
ZyBjb250cm9sICovDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFdoeSBpcyBhdXRvbWF0
aWMgZnJhbWUgbGVuZ3RoIGNvbnRyb2wgZGlzYWJsZWQ/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gTXkgdW5kZXJzdGFuZGluZzoNCj4gPiA+ID4gPiA+IElmIGF1dG9tYXRpYyBmcmFtZSBsZW5n
dGggY29udHJvbCBlbmFibGVkLCB0aGUgZnJhbWUgbGVuZ3RoIGlzDQo+ID4gPiA+ID4gPiBjaGFu
Z2VkIGF1dG9tYXRpY2FsbHkgd2hlbiBDT0FSU0VfSU5URUdSQVRFX1RJTUUgKyAxMCA+DQo+ID4g
PiA+ID4gPiBGUkFNRV9MRU5HVEhfTElORVMsIGl0IG1heSBub3QgbWVldCB0aGUgcmVxdWlyZW1l
bnQgLSBsZXNzDQo+ID4gPiBpbnRlZ3JhdGUgdGltZSB3aXRoIG1vcmUgZnJhbWUgbGVuZ3RoLg0K
PiA+ID4gPiA+ID4gd2UgbmVlZCBjb250cm9sIHRoZSB2ZXJ0aWNhbCBibGFuayB0byBkbyB0aGF0
Lg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IElmIGZyYW1lIGxlbmd0aCBhdXRv
bWF0aWMgdHJhY2tpbmcgY29udHJvbCBlbmFibGVkLCB0aGUNCj4gPiA+ID4gPiBDT1JTRV9JTlRF
R1JBVEVfVElNRSBjb3VsZCBiZSBsYXJnZXIgdGhhbiBGUkFNRV9MRU5HVEhfTElORVMuDQo+ID4g
PiA+DQo+ID4gPiA+IEJvdGggYXJlIGNvbnRyb2xsZWQgYnkgdGhlIGRyaXZlci4gVGhlIGRyaXZl
ciBpcyBnZW5lcmFsbHkNCj4gPiA+ID4gcmVzcG9uc2libGUgZm9yIGVuc3VyaW5nIHRoZSBleHBv
c3VyZSB0aW1lIHN0YXlzIHdpdGhpbiB0aGUgbGltaXRzDQo+ID4gPiA+IGZvciBhIGdpdmVuIGZy
YW1lIGxlbmd0aC4NCj4gPiA+ID4NCj4gPiA+ID4gVW5sZXNzIHRoaXMgc2Vuc29yIGRvZXMgc29t
ZXRoaW5nIHdlaXJkLCBhbGwgeW91IGdldCBieSBkaXNhYmxpbmcNCj4gPiA+ID4gdGhpcyBpcyB1
bmRlZmluZWQgYmVoYXZpb3VyIGluc3RlYWQgb2YgaW5jcmVhc2VkIGZyYW1lIGxlbmd0aCB3aGVu
DQo+ID4gPiA+IHRoZSBleHBvc3VyZSB0aW1lICsgbWFyZ2luIGV4Y2VlZHMgZnJhbWUgbGVuZ3Ro
LiBUaGlzIGNvdWxkIG1lYW4NCj4gPiA+ID4gYnJva2VuDQo+ID4gPiBmcmFtZXMuDQo+ID4gPiA+
DQo+ID4gPiA+IE9mIGNvdXJzZSwgaXQgdGFrZXMgYSBkcml2ZXIgYnVnIHRvIGFycml2ZSBpbnRv
IHRoaXMgc2l0dWF0aW9uLg0KPiA+ID4NCj4gPiA+IEknZCBhcmd1ZSB0aGF0IGVuYWJsaW5nIHRo
ZSBhdXRvbWF0aWMgY29udHJvbCB3b3VsZCBtYWtlIGl0IG11Y2gNCj4gPiA+IG1vcmUgZGlmZmlj
dWx0IHRvIHNwb3QgdGhlIGRyaXZlciBidWcgaW4gdGhpcyBjYXNlIGFuZCBzbyBpdCB3b3VsZA0K
PiA+ID4gYmUgbW9yZSBkZXNpcmFibGUgdG8ga2VlcCBpdCBkaXNhYmxlZCBhcyBpbiB0aGlzIHBh
dGNoLg0KPiA+DQo+ID4gWW91IGFyZSByaWdodCwgSSB3aWxsIHJlbW92ZSB0aGUgY2hhbmdlIGlu
IG5leHQgdmVyc2lvbi4NCj4gDQo+IFNvcnJ5LCByZW1vdmUgd2hhdCBjaGFuZ2U/IE15IGNvbW1l
bnQgYWdyZWVzIHdpdGggdGhpcyBwYXRjaCB0aGF0IGtlZXBzDQo+IHRoZSBmdW5jdGlvbiBkaXNh
YmxlZC4NCg0KVG9tYXN6LCBteSBiYWQsIGxldCBtZSBrZWVwIGl0IGRpc2FibGVkLiBTYWthcmks
IHdoYXQgZG8geW91IHRoaW5rPw0KDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gVG9tYXN6DQo=
