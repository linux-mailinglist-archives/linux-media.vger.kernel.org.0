Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C684463A5
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 13:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhKEMyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 08:54:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:54006 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229468AbhKEMyq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Nov 2021 08:54:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="292725121"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="292725121"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 05:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; 
   d="scan'208";a="450561897"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 05 Nov 2021 05:52:06 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 05:52:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 05:52:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 5 Nov 2021 05:52:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 5 Nov 2021 05:52:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb5OaDsJznCvie/qJ/BWBieoWGBp/u0nlIYZvS4Gpp1Bh8kv/e6CH4n/utAqJnikkupy0FPd97k8KwD8xhZrcY5OoJ23QWgGMlYtwUHx++BKkrEOGlnU4utJI7tcFLridZOSHnjmf3+XOb/gTDcnMG8D8/f2B0UxPF0IBrflx1RR8xvudJH5ouR2BmZaXHhfwrwjNicD8hfbQrhabwKxjOqwxxCDM+apYmmjFq/CZXIaMMs61wW3cKhM/JGjTEe5PuQJQMqu0KUoLwOjD/yjtzjb5ncphFFGclSoRzp/yLMAtC3fP0xJp6OfYvzv/X+gRUC5bgcnbqHB4RhHdZAhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odRZM9PKtzzrHW4f63Ab/gkSH1jHf2rBDlPfJ2YWvww=;
 b=Pq77FdYDANTYh+9VErCd/9mRR8seJM0iGyqjAsa/AxEq8AHCrs9BwRBp8+UCZHApMPL/1eAYXHMHQD2lEWqt86DarAbiwYW7ucgIfm6Zy76asvNfSJP7xtyDI/Xv1iGqE+4U6MGMNyJ0vOCx06BY/RZrdvMfZdcbcfBQfGDTNCCnxnfJplvI9/ld+Du6iRaiy3TmdpUF1Kc+4OPc623zInJlN8ApSb6Gvh8ZzAhMOOoOGrhwW6Nzx2+eTSVixrXuzM9qqfinN+wP8WLH7um3GsM5K/qszse0FPWkq+g3aKuXR5rIDWryEgPsi+ut0a2PuFFWGQFV5kswtOKihhF+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odRZM9PKtzzrHW4f63Ab/gkSH1jHf2rBDlPfJ2YWvww=;
 b=Ib4ajOn6KnxAik11BLxAPMkpFfUpWXzzkZMMNUZTfvNCN/VrIeMZUv7E1Vy1iborLo5CPfl5kcz187xcL+VRgh4A3EPEKzH0s+zmZCrQ03LpBZqfCFkk60blJ19c7HJOX3VjUx40cLZ6cGdyFYQY/w9oTIgs9RTXEib6DjUxGgY=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5575.namprd11.prod.outlook.com (2603:10b6:8:38::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 5 Nov 2021 12:52:02 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%9]) with mapi id 15.20.4649.015; Fri, 5 Nov 2021
 12:52:02 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "dongchun.zhu@mediatek.com" <dongchun.zhu@mediatek.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] media: dw9768: activate runtime PM and turn off device
Thread-Topic: [PATCH] media: dw9768: activate runtime PM and turn off device
Thread-Index: AQHXwYuuArHl0w7uVkeJn6nBPlttCav0oO6AgAACd6A=
Date:   Fri, 5 Nov 2021 12:52:01 +0000
Message-ID: <DM8PR11MB565395F554C6D1C4978EBC2A998E9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634278119-32158-1-git-send-email-bingbu.cao@intel.com>
 <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
In-Reply-To: <CAAFQd5Aykfdj-HPzsQOyQpbGBRhtTsoRm78XgpuGkFUx1joTMA@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: cba48cbb-d192-4b50-8565-08d9a05b102d
x-ms-traffictypediagnostic: DM8PR11MB5575:
x-microsoft-antispam-prvs: <DM8PR11MB5575FBED2F4B73473CE9EB48998E9@DM8PR11MB5575.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bWpKHhZexXgl63Arxj5j1tri/MkJDGYYSU64LGof9rdJrYjLXd7GwEdXfXhTP0iYueP1tOaLwv3mLuSJECmLNSbgNXbkkVa4M9DKnbrrODL03dG1CdEJ8Shjk1CNwxNqRGaOZAEuIPOsjA6DO29tpAPYnuHCNoWG3Se/5eNU54pUeafHfoVO4+yCOjYjoxjWIS66SzR+GOWMh62KQrjcr+fOecuw15bfGzSd5kPcUPYfY9o13dtsrHK0EMsm5LZOuUy06twvuycmz2USUCbY2X8s/CwxpYeEZ1Z7Zku1Nexz/bNY0K9u6RdZjk9NiY0FgXMUu7hDNhsToZvBKhy1oQRIBMkefH/odfZZ6a6kFxjFYo56g+mbiHmWNhU64cxsbFO6jcQs5IjXRMeJB+s6kCfF76c5LtJlNB2tt/Vd+M0nmy8a1yAoaM+BUXvAp+IQxn+wCcf01xjhxjESkC5fGozpcA1eDMCuK9TPGygOmYJwtGooIqShZxEliI+FG76sOPMdP8osVVpRnOldZWx7aWXbVhe0Rsv7s8WLpWKZI0Iq+UuliWhvlP7aJMHfNjgbbbaQR6dwKXVHf9/b4yUbqPQu8O8o2ktqX9XVUFrayDMCjmXmC6B0O7U1DP1LtozNx46RoZ73tiv044Kj93O9wyVfRSR2Q3w1chWrWBeTlHpqOxkLK6l3yQ2ckRioDxhGWf7ULRVTOtQohYFuGDh/NhXSVqSZ94a7b67sQhe9k/k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(9686003)(4326008)(122000001)(86362001)(38070700005)(83380400001)(7696005)(53546011)(5660300002)(6916009)(2906002)(33656002)(55016002)(8676002)(64756008)(66446008)(186003)(66556008)(82960400001)(76116006)(66946007)(8936002)(66476007)(26005)(508600001)(71200400001)(316002)(54906003)(6506007)(52536014)(38100700002)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VFk5d0xQZnpYTHBRaktLanV1Zkg0UGRoSXErNGpxSjBubXhScnBIZ1llcUxt?=
 =?utf-8?B?T3g0Uy9hS052a3RRLytmUGZwMGlCM2xPUzh4TVRXUTV3d2FtVVE3M0ZvRlI1?=
 =?utf-8?B?a2Jmd0dnbFJHVDN4SzdIOFJnTHE1NXFha3RBVzdrSmxXcVJiM1RDRm5qdTdx?=
 =?utf-8?B?UWJvODNJVjV1WW5mMEMyZFlnYURWbkpJUDk1Z3VVM1VqRlU5ZjN6UXpKZG5S?=
 =?utf-8?B?K2lvMVMxZGc4UGV3S3RQa1pUdmVRaVducHVWZ25DYVh6cTM5dkNENmxaYXdj?=
 =?utf-8?B?WWpnckNBek14K3BFQUFLSFFlbW9GbkZpT0JJbnRqT1FIb1FHZ2xrTTVkajFL?=
 =?utf-8?B?bXVFNEtGbTdBUEJqczhxVjBZcm5yV1VwZ3dJMkVlWVI5OE1QTmgvUmE0ZUVV?=
 =?utf-8?B?MFIrRk1pV2hTQXl0d0dxNUpkSDFuQWRiUWQ2aWhpUzVVbk1UWE1OQzdzcDhN?=
 =?utf-8?B?cE4xa0lhQ0JGY0JQQ1ZZeUxNVFRlck53Qk56SzhNUW9MODhVV1hvaHJoMFdP?=
 =?utf-8?B?cTh5bVN3S1RubkdOd3pORXpPY1RDSE1GRVlOL0cyTW9uZWRlU3VycWhTWjRY?=
 =?utf-8?B?Z0ZmVzhrYWcrUXRuYUU5dU9uV2w1K3MyVzZKaGxLMEhyNEJ0N2xrZEJLZTNx?=
 =?utf-8?B?SUNGWW9HanA2QXBxUEpLSW85bG9xbXhaUUo0M0plVjZtcG5aNy9hTGVSaVpj?=
 =?utf-8?B?OVBrSnR0WnpIeThwY29CK3ArT0E4VHVTSjBCeGczVjRDeC9PYy9HS0ExajBU?=
 =?utf-8?B?T3pUQkhOcjI2ajBZNXpzUmhQTWVmM0lqRkZDSHB5RWk3eUdiMERRbVNyU1pJ?=
 =?utf-8?B?UnNlMUJLenNNZmFEeWJnVUF6czJVM3Ftb3VlQ2JIbUxvamt4YkxwSnRSV2Z2?=
 =?utf-8?B?c1IvNHI4MDVuaHJHK2tXZDJSQU1ycmlaakNDK09aSGdQVy9MY0JMcUV4aXRE?=
 =?utf-8?B?QWs3ZGtMaUlzNWtEN0tIREZmN3ExenEva2l4ZksrVG5OblNQb1crTm5RRm5n?=
 =?utf-8?B?Qjg4SGdFYXd6ZlEvQTgyeG5qRUtZa2U5eGVON3o2a0ttTE1nVnNFTXdOemth?=
 =?utf-8?B?aVNmdjhxbDNiREJwU1JEaVdBUGorUjE4bTJ4cStSd3lKdWFZSHJTWVhiNVlB?=
 =?utf-8?B?bkZwU0UxMVcvSHdWMmRJQ2lhaE50N0V0aTJkeDEvdjFzMUxqUVgzNnFVcXBh?=
 =?utf-8?B?aUREcEVES0dMNXlhWUNKWW1kWEVrK1g4YmpMVS9pMTlBYmFQTS9mZ05rcE1U?=
 =?utf-8?B?WTVMcGkzbFZjd2xOTllMRytOYWdKK1NMS1pQZU45VWFwYzQrYXJNOExsNTJJ?=
 =?utf-8?B?b1dxTEUzTncyQ2p3ZjVrckEvbUFTQ0t6bmU3cTNsSFNuQnR0Vmd1V0hnTXNk?=
 =?utf-8?B?S2JqSU9qbnM3MWtHN2paT05GWVdxNVVWMzhNdkRYdGxSTE1PSGlSWXFXL2hl?=
 =?utf-8?B?ejlqbVMxSVFxSFRyZnRpakRQcWZ1cGZOT2ZxbklhWVBQY1J3T3NLTEJ0eXRW?=
 =?utf-8?B?YUgvaHcyL0NZdmt3K3dERHU4bTBNTWJZQ01iMjFxWjkyOFVEdW1SUkhtQTV5?=
 =?utf-8?B?ZVd2amdNbXlIb3MzdlVWRCtxTVVqbHA2REt2UjJycDVWRGlFRGt2aHRiellm?=
 =?utf-8?B?ODh2aGg4aDBQTVg2MUU2UkVPVHQyKzI2QWtNcm03ODlMRE1RN1dRSnJOT2xq?=
 =?utf-8?B?NWhJTCtWbks5aE8zb0VvZk14T25mZjg4OHpHYmc1czh3YkZHeFY3ZGV6dm5l?=
 =?utf-8?B?RzB0Tnd3WHFEVmdhSU8wOTdRNU80VmRtVCtUcUljT2lqTlZHa2F5bEpuYWth?=
 =?utf-8?B?ZjBaOFJxcFpDaXppdWRTSERIajEyRmVyMmpNTS9iaEVqdmM0NGhSWlpVVnZ1?=
 =?utf-8?B?OXpmcVlUeGpJbmQ5cjNwazQvQUg0UVEzckRGcEhlQnJHTy9kODY3bDN2VlYv?=
 =?utf-8?B?b1dmY2Q2d2Vub2E1M0FkOGJtQ09rNzAySng3ZEFGSXdOd3RLUEVMMGlJWWpB?=
 =?utf-8?B?TU9EUTJxdllDY3MzWGdLTVgxME5yS240RHRhWUhhTUp0ZHoydGJjQkFaMjhY?=
 =?utf-8?B?SjJRYUs0MXlubDNZZlkveDdmUTlYMnB2V2x2dTQ4ZWpIMGpWRWpVQ2oxaUhB?=
 =?utf-8?B?Tkc3NUMzWEh2em5ERXpCVmRuUVM4SDA3ZlVzWDBidVRiUkE4ZU1HWG02U1hM?=
 =?utf-8?Q?+J06+oOIL7S5z8cva/sK5zY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba48cbb-d192-4b50-8565-08d9a05b102d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 12:52:02.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omhu896TZupLc/WRjBmzrasTbOUA3FX4Ud01pD1x44ScSkoBsZkBhNOFRfidzjNwij3UeCk1jfNWuDYJ9yCDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5575
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21hc3ogRmlnYSA8dGZpZ2FA
Y2hyb21pdW0ub3JnPg0KPiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDUsIDIwMjEgMjo1NSBQTQ0K
PiBUbzogQ2FvLCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnOyBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOw0KPiBkb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tOyBRaXUsIFRpYW4gU2h1IDx0aWFuLnNodS5xaXVAaW50ZWwu
Y29tPjsNCj4gYmluZ2J1LmNhb0BsaW51eC5pbnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gbWVkaWE6IGR3OTc2ODogYWN0aXZhdGUgcnVudGltZSBQTSBhbmQgdHVybiBvZmYNCj4gZGV2
aWNlDQo+IA0KPiBPbiBGcmksIE9jdCAxNSwgMjAyMSBhdCAzOjEyIFBNIEJpbmdidSBDYW8gPGJp
bmdidS5jYW9AaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IFdoZW4gZHc5NzY4IHdvcmtpbmcg
d2l0aCBBQ1BJIHN5c3RlbXMsIHRoZSBkdzk3Njggd2FzIHR1cm5lZCBieQ0KPiA+IGkyYy1jb3Jl
IGR1cmluZyBwcm9iZSwgZHJpdmVyIG5lZWQgYWN0aXZhdGUgdGhlIFBNIHJ1bnRpbWUgYW5kIGFz
aw0KPiA+IHJ1bnRpbWUgUE0gdG8gdHVybiBvZmYgdGhlIGRldmljZS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYyB8IDYgKysrKysrDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L2kyYy9kdzk3NjguYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jDQo+ID4gaW5kZXggYzA4
NjU4MGVmYWM3Li42NWM2YWNmM2NlZDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9p
MmMvZHc5NzY4LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9kdzk3NjguYw0KPiA+IEBA
IC00NjksNiArNDY5LDExIEBAIHN0YXRpYyBpbnQgZHc5NzY4X3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50DQo+ID4gKmNsaWVudCkNCj4gPg0KPiA+ICAgICAgICAgZHc5NzY4LT5zZC5lbnRpdHkuZnVu
Y3Rpb24gPSBNRURJQV9FTlRfRl9MRU5TOw0KPiA+DQo+ID4gKyAgICAgICAvKg0KPiA+ICsgICAg
ICAgICogRGV2aWNlIGlzIGFscmVhZHkgdHVybmVkIG9uIGJ5IGkyYy1jb3JlIHdpdGggQUNQSSBk
b21haW4gUE0uDQo+ID4gKyAgICAgICAgKiBBdHRlbXB0IHRvIHR1cm4gb2ZmIHRoZSBkZXZpY2Ug
dG8gc2F0aXNmeSB0aGUgcHJpdmFjeSBMRUQNCj4gY29uY2VybnMuDQo+ID4gKyAgICAgICAgKi8N
Cj4gPiArICAgICAgIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZShkZXYpOw0KPiANCj4gVGhpcyBkcml2
ZXIgaXMgdXNlZCBieSBub24tQUNQSSBzeXN0ZW1zIGFzIHdlbGwuIFRoaXMgY2hhbmdlIHdpbGwg
bWFrZQ0KPiB0aGUgUE0gY29yZSBub3QgY2FsbCB0aGUgcnVudGltZV9yZXN1bWUoKSBjYWxsYmFj
ayBwcm92aWRlZCBieSB0aGUNCj4gZHJpdmVyIGFuZCB0aGUgcG93ZXIgd291bGQgbmV2ZXIgYmUg
dHVybmVkIG9uIG9uIHN1Y2ggc3lzdGVtcy4NCj4gDQoNCj4gV2Fzbid0IHRoZSBpbnRlbnRpb24g
b2YgU2FrYXJpJ3MgQUNQSSBwYXRjaGVzIHRvIGFsbG93IGJ5cGFzc2luZyB0aGUNCj4gQUNQSSBk
b21haW4gcG93ZXIgb24gYXQgYm9vdCB1cCBhbmQgZWxpbWluYXRlIHRoZSBuZWVkIGZvciB0aGlz
IGNoYW5nZT8NCg0KVG9tYXN6LCB0aGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpUaGUgY29tbWVu
dCBoZXJlIGlzIGludmFsaWQsIGl0IHNob3VsZCBub3QgYmUgc3Ryb25nbHkgcmVsYXRlZCB0byB0
aGUgcHJpdmFjeQ0KTEVEIGNvbmNlcm4uIEFueXdheSwgdGhlIGRldmljZSBzaG91bGQgYmUgdHVy
bmVkIG9mZiBvbiBBQ1BJIGFuZCBub24tQUNQSQ0Kc3lzdGVtcyBldmVuIHdpdGhvdXQgU2FrYXJp
J3MgY2hhbmdlcy4NCg0KSSBhbSB3b25kZXJpbmcgaG93IHRoZSBkcml2ZXIgd29yayB3aXRoIFBN
IGNvcmUgb24gbm9uLUFDUEkgc3lzdGVtLg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFz
eg0KPiANCj4gPg0KPiA+ICAgICAgICAgcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiAgICAg
ICAgIGlmICghcG1fcnVudGltZV9lbmFibGVkKGRldikpIHsNCj4gPiAgICAgICAgICAgICAgICAg
cmV0ID0gZHc5NzY4X3J1bnRpbWVfcmVzdW1lKGRldik7IEBAIC00ODMsNiArNDg4LDcgQEANCj4g
PiBzdGF0aWMgaW50IGR3OTc2OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+
ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBWNEwyIHN1
YmRldjogJWQiLA0KPiByZXQpOw0KPiA+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9wb3dlcl9v
ZmY7DQo+ID4gICAgICAgICB9DQo+ID4gKyAgICAgICBwbV9ydW50aW1lX2lkbGUoZGV2KTsNCj4g
Pg0KPiA+ICAgICAgICAgcmV0dXJuIDA7DQo+ID4NCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCg==
