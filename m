Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1803D56D5
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 11:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232973AbhGZJM3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 05:12:29 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:10726 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232861AbhGZJM2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 05:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627293177; x=1658829177;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mLpyIj+YqJZq7yOSwojOW4M1rClhPbYVQxv2WDiVTM8=;
  b=ZSO9Sq5XfBkGghj+Sqb8//fg+kgTfvDpDYAn0Qeg1x9iiR5OVu04Pb3X
   Qw8Usj/jBf9ulK8HtKrWTReZZs2eY5h2qNkKVJaCDiRG3sCbx37aFJ1CJ
   CQIiRQtOtv/9DU9Wx0xCK5/4qRjV7a55fT85gnhzEWP/wnSFkQHN1UF/6
   vfnVC/AtUNQtNsA/h6ZyVgQsi8Qyo0tiWQpds3TPpp/TQ22cfXCZglw7v
   XTWx/xS9JwBTPTFkwgwEpWUBjQ7GqXyOCtc/6KTQ79qT8YdabHQxjMkxB
   2cXvbH1Y6LihysS9NayNmY0tuAtcJpvKzd3Vp1pHU5Wp+jR8LHGFIdp4n
   Q==;
IronPort-SDR: SNaGwDhU+3dXwrF888UkTJm7npN2wuLrcRabM9N2d2UTKORr52l5juIBJAzPlCCYo9+rUcsUxT
 zC8l3j79hQ6xy6grAq46xXZlKyfD/4iQaz7LjWYnwR3SzOLYnlOMDW6sKjUhzidgz57xjoY6rr
 XFXJFDDrjRhVxZiKINOfnKjvPuRrwE/bBFa+8MZqQ+k6lBmrX5eofGMHjxqi8gqV0Vbi4yE+04
 n7jATjPoa6W6ICf6D0AoDpSkzlRzoLlwFGvf2nC0nvH35Gf6JiOxMBVY1t53XxsnWJHXfHL6p4
 J6ofL43Rhc81HfmBoUfUOiZS
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="130351087"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2021 02:52:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 02:52:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 26 Jul 2021 02:52:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+dTdR+62YGKsj94Nnz5mj0+aLLReGNHAsO2XMRADKlprdFp/RXOg8lKzGZnIIRFUlWk1kzFVWh2RP4FdBqNWKiXHefe2QclSggkCsEqPoJH5Ddz63mzOJSA070VYR9jGDNkAisBO1cIQibcd+1YuFQAnz2NOJJto7i1trXUrfCqqmVE9+SIiQI0zliH3aAe86CqPWQUGtmyu5jGh+kMLgjNrpWTXv43BzbZ9N5VhHlVcyVTKWtsJPxEXXSgZHKPRdjQk3WwNTJf9scIWD8dyGiibedkhMgThHDYtzvh/ruYfBAd0m7sM+f9G81+/L5s8oKiF75fiKxk+rTwIVsD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLpyIj+YqJZq7yOSwojOW4M1rClhPbYVQxv2WDiVTM8=;
 b=fGPZZf5gy64Rn3qYy/cvFv4bypxshkv6IY6yGSRqDJnsgxb7FCcTVWxtA/A4JrggKrT6RLFxVP16g2Q74xwu6Czvjdsv/X8GHq6K/UxhqQq9ko6xZ5FCrgzGTbvOd7YCf6QXMs9R4nFzlX7ymURDWecd/BXW1zkL2vpt6w8HVNrpjie1w9SQSIVgob/xCs+S2T6xfEb1fv8C0Rc+GMap2qTjIvSMPAHt2djGN0G49ICbRGGB4GOncxzOlwGjzrzqQ8PEgT2AQHH/VU1p13RpcKDY3rqIU+sIaVrt4RNoALzOiJIcHdoGPfqqCimWU0xBtEc+1p83MFGfli2c8Wb0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLpyIj+YqJZq7yOSwojOW4M1rClhPbYVQxv2WDiVTM8=;
 b=Qm9enxC0aAEYwyA0dxhleM1053Xiioh/dyWGj21ROENp4ciAML8el2th5AvRtg8joulb/K1eF7HQLuEXk62RmFNFld2UAiiZBtcxUEQ1EkHE8TTrLpV/54t6nL+NgiSX0DSBbVlpHGyoeEyMxPMFl/u27cEFqcpibBZ45batJvY=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1299.namprd11.prod.outlook.com (2603:10b6:404:49::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 09:52:53 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 09:52:53 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <arnd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <lkp@intel.com>
Subject: Re: [PATCH] media: atmel: fix build when ISC=m and XISC=y
Thread-Topic: [PATCH] media: atmel: fix build when ISC=m and XISC=y
Thread-Index: AQHXcZ1M5jQiaEj8602Rr8K1DlQzsatVJNMA
Date:   Mon, 26 Jul 2021 09:52:53 +0000
Message-ID: <44a267f7-d01d-36de-0a14-0fa0eb14b6ea@microchip.com>
References: <20210705125708.121902-1-eugen.hristev@microchip.com>
In-Reply-To: <20210705125708.121902-1-eugen.hristev@microchip.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b274f14d-87e1-4705-6097-08d9501b2335
x-ms-traffictypediagnostic: BN6PR11MB1299:
x-microsoft-antispam-prvs: <BN6PR11MB1299B9FB6A45754E4BB6EB7FE8E89@BN6PR11MB1299.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 92kFu4PmX3vC4ww5vnKtOsIrU0qrnGfWdc8Me+bITzfFDXBF+q8NvcSZZ+OujrAlBvu2kAXeE/F5o19GyB2r66vIS+wDhMyw3PIpj4jTFhlrrGYK8+AdRTRVYcQztknrdAPuhEO4Au323KID5zepkBFiPCXwhhlH3dymYBBNbczS1uM97XBLIjFSf7jScf0hEHasv1Fp8CZuWYfdha2KJ74+HsUuxtshOvaeq7u9Ve44Uq1mwhRgbggp632hqIJFoBr2w3/CyLuhsaHogHUhy38nQv+e0303YELM1XeiaQzSdZlVnUvKPkZpQb3lCIuwZE61Md/CswbF2oOsdJFOCsb3bnUaoEKtcC2pWs67bn2x4774psUSOAtg0Mk8y24s/PAMqzGDn+xR3po5znWuQw/wNU9iBz+eRS76/xs2UvZe9bXCDMCvbjZiNT9GhlXQAFy5E6/2ZdVH4kP/r6YEqCEf9yMKpcICwqlNse3/30f/2JcA3Sd5+dDezNbP6bpuNFe7iIvcUTlZr3clBu+O5ed5P5IH12VoF13i47giKQbuMDT39m6KW288e/yYqCa8ySH8ujtgp3h5Wf0Y3x4X0DP4EkC/FYY42kJjbjnK6fTbK/sWTYgUOvLSMFTDHul1WUm7CG+91+Hh5jLDIal6sgA+HVFYfL2xZ8PCtzi4bLqPhnC5J4nNejhGjDzjJSYeX2H3oGU++opA/2MVtU5ncaVbPQ83NjZ3F2NLl2dFcCIK4Oa/viH6sxYV8Qw8wUv4l3q+zN+eLw49gfmeJ31JNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(396003)(366004)(376002)(8676002)(71200400001)(2906002)(26005)(6486002)(66946007)(478600001)(6506007)(6512007)(76116006)(5660300002)(38100700002)(91956017)(64756008)(122000001)(86362001)(8936002)(186003)(66446008)(66556008)(66476007)(2616005)(316002)(83380400001)(54906003)(4326008)(110136005)(31696002)(53546011)(36756003)(31686004)(45980500001)(43740500002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXRCUGhORmRjZHlwQ2Z2UHFKZkpRYzNOK2FZN0Vuc2xWZVU3TDdvQk5RVklh?=
 =?utf-8?B?dVZvRXI0NUlra3QxSUo2QUZUQ3lITjIrSEk2NVlId1JaUjdzWElwTnRwQXlq?=
 =?utf-8?B?TVFkWUJlRWFsVU1PWDRDYkdUaTFPTm5Mb2NEVEdMTkxFa2hpakxia0dIOVdw?=
 =?utf-8?B?R0JjckM3a2FYeGhDWGgvTHlxZnhZaDVEbmNNbk13UHFWTGJqMFJEUlVBLzBq?=
 =?utf-8?B?UnRsdEo0MHZ3WVZVblF1a3gwd3JiSjRNV1h4NnpEaTFpVUVmalVjdUhhVzZq?=
 =?utf-8?B?VnFnalhHTEtuWUM1U1hCaVd0bmZ0dXQ1MkpJb0Q3ZWdIbnNtZDhNdE9LZXFE?=
 =?utf-8?B?TVlJZTN3L2NkU3o3ejk4UjJQcG0wcmFIMG1raUpYUlE2UWIyaFdBaEs3cVNu?=
 =?utf-8?B?TzNSL1Z0RzFrU2tMakZwUWgrMlgwQmhEVmx1ODZVTkp3SjZQRjQrSE1aU0V1?=
 =?utf-8?B?alpIc1NpbjkwKzJrazhnN1V2cVREZkl3VE8wTlJLNkJPOHVwOHJGZjlsZURT?=
 =?utf-8?B?cDc2eDk2UVVkaHVNdXJHZGFUWTA4ZXZCME4wU0hTMC9zN1JmTzZ1dDZLNFZs?=
 =?utf-8?B?NFBCYlUvdlNyMFdTbWZLaWE0MDJWZEdEc0dTZXRXallnR0ozNG9SaThuNmFq?=
 =?utf-8?B?YmJ6djBVMWpvRVlXdlVIVDJlUmpDSDJnOFhFNWNYdVFvNkZ6OUpiQXhId1E3?=
 =?utf-8?B?VWhvSDBNMjVFV01oQVBaS1B5YXVOQXJQVGtuNnk1ai9acGZyQWFrbHNOTkZy?=
 =?utf-8?B?dmFaeGRtc3NXN1NGbHcrNUV0SXpmR1U4TFVOWmN3T21kTzExQUZ3MkRKU001?=
 =?utf-8?B?UlM2S3drTVJuU0QwN1oyNFN0ZlZ0UVFWS1Q0aEhwWG1wSi80Sk83NjN1Z1lq?=
 =?utf-8?B?SVhlSUdETi9EcnBzeFZwcUlEZnpBVzErTXNyN3R1c0JUUlhMQ0VnMFpVVU95?=
 =?utf-8?B?eHNHSnhac0o2UThMek9NYkxLTll0cCt1UlNaZ1VLZ1NLcHR5UUpqU0t1bjBE?=
 =?utf-8?B?aWlhZlFza1R0U2pONlA0NHBIMjRjYklEVEJpK0UyVTBzeHlwajJDdXBIdDdO?=
 =?utf-8?B?SEhqQ09XM0VyUXZEOENXSVJJM0R5eHhFRGg4UXBCRWpzSmlpYmxkTVpLOUJX?=
 =?utf-8?B?V0lNM0dnTGEvWlpoRDNBQlhHckprekVnL1V0aklWSzhScDVRN24xT0tDV2Zo?=
 =?utf-8?B?c01LNXZIV1c0VVJpYnJlQTlaU1ZYMmFBZjF3V3F3NWhZaFV1K1dYTXI5RTJL?=
 =?utf-8?B?bzdpek9HWHdTb3pNaWFEbkh4YkQ1N2FNLzZUa3dOTFlNRFFuK1FJQyswOG9S?=
 =?utf-8?B?Z2FuRCtXS2hmektsUHJBcG12Y0VibDJxZnJZbmx2anFCcElvYXVqNGtMWEhG?=
 =?utf-8?B?WG9mRXRKSU5yVHlMUjF1cHp4U2tQcHk0cTIvdmMwbGVjY1RqTGZxQ3pYdjFs?=
 =?utf-8?B?YVpHUjZpWEw0WklQTkRzaGwzd1FSUC9kRFh2RGcwQ3BEMU1JWTlXeUxnTXFR?=
 =?utf-8?B?c25sUzdJNWorbFo2c2RpL3RBVWt0RWJ2OFJIcEFSMWpybFpGWXlHa25oUGhK?=
 =?utf-8?B?VXhXWjcvQU0vQ0tGcEo2UUJUYzROWnZkQWFkN1BwZU9QY3R1WlZYOG1ORHZL?=
 =?utf-8?B?S05pV0F4TzdIempIcHJLcUtaemRaLytMUWJOV2Y5TzhqNW9jUll0d2xjaTZa?=
 =?utf-8?B?RjU0Ukt1UFFBcE91bGJnVVNKUFFzSXAzUTRJU0pXQ1NMQVlldzRIUHVtTGFo?=
 =?utf-8?Q?gc5BMV5VubzdKCnQGs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFBF6BEDB9EFC04398DF9335AD02E588@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b274f14d-87e1-4705-6097-08d9501b2335
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 09:52:53.3351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5PxNJfVL+ZBzYiEGp0tJqT3EGlKuqydr9c+gDWQpdF0+LD4exQFzlUs1iAE55rq9S6gprpHSTbZz3ByEisA5IfIJLRWr2nYPbwoaB68euOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1299
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNy81LzIxIDM6NTcgUE0sIEV1Z2VuIEhyaXN0ZXYgd3JvdGU6DQo+IEJ1aWxkaW5nIFZJREVP
X0FUTUVMX0lTQyBhcyBtb2R1bGUgYW5kIFZJREVPX0FUTUVMX1hJU0MgYXMgYnVpbHQtaW4NCj4g
KG9yIHZpY2V2ZXJzYSkgY2F1c2VzIGJ1aWxkIGVycm9yczoNCj4gDQo+ICAgb3Ixay1saW51eC1s
ZDogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5vOiBpbiBmdW5j
dGlvbiBgaXNjX2FzeW5jX2NvbXBsZXRlJzoNCj4gICBhdG1lbC1pc2MtYmFzZS5jOigudGV4dCsw
eDQwZDApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX3RoaXNfbW9kdWxlJw0KPiAgIG9yMWst
bGludXgtbGQ6IGF0bWVsLWlzYy1iYXNlLmM6KC50ZXh0KzB4NDBmMCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYF9fdGhpc19tb2R1bGUnDQo+ICAgb3Ixay1saW51eC1sZDogZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5vOigucm9kYXRhKzB4MzkwKTogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgX190aGlzX21vZHVsZScNCj4gICBvcjFrLWxpbnV4LWxkOiBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLm86KF9fcGFyYW0rMHg0KTog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX190aGlzX21vZHVsZScNCj4gICBvcjFrLWxpbnV4LWxk
OiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLm86KF9fcGFyYW0r
MHgxOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdGhpc19tb2R1bGUnDQo+IA0KPiBUaGlz
IGlzIGNhdXNlZCBieSB0aGUgZmlsZSBhdG1lbC1pc2MtYmFzZS5jIHdoaWNoIGlzIGNvbW1vbiBj
b2RlIGJldHdlZW4NCj4gdGhlIHR3byBkcml2ZXJzLg0KPiANCj4gVGhlIHNvbHV0aW9uIGlzIHRv
IGNyZWF0ZSBhbm90aGVyIEtjb25maWcgc3ltYm9sIHRoYXQgaXMgYXV0b21hdGljYWxseQ0KPiBz
ZWxlY3RlZCBhbmQgZ2VuZXJhdGVzIHRoZSBtb2R1bGUgYXRtZWwtaXNjLWJhc2Uua28uIFRoaXMg
bW9kdWxlIGNhbiBiZQ0KPiBsb2FkZWQgd2hlbiBib3RoIGRyaXZlcnMgYXJlIG1vZHVsZXMsIG9y
IGJ1aWx0LWluIHdoZW4gYXQgbGVhc3Qgb25lIG9mIHRoZW0NCj4gaXMgYnVpbHQtaW4uDQo+IA0K
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IEZpeGVz
OiBjOWFhOTczODg0YTEgKCJtZWRpYTogYXRtZWw6IGF0bWVsLWlzYzogYWRkIG1pY3JvY2hpcC14
aXNjIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0
ZXZAbWljcm9jaGlwLmNvbT4NCj4gLS0tDQoNCkhlbGxvIEhhbnMsDQoNClRoaXMgYnVpbGQgcHJv
YmxlbSBpcyBjYXVzaW5nIHBsZW50eSBvZiByb2JvdCByZXBvcnRzIGFuZCBpc3N1ZXMgaW4gDQpj
dXJyZW50IDUuMTQgdHJlZSwgYWxzbyBBcm5kIGhhcyBzZW50IGEgc2ltaWxhciBwYXRjaCBhZnRl
ciBtaW5lIHdhcyBzZW50Lg0KDQpDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgcGxlYXNlIHN1Y2ggdGhh
dCB3ZSBmaXggdGhpcyBmb3IgNS4xNCA/DQoNClRoYW5rcywNCkV1Z2VuDQo=
