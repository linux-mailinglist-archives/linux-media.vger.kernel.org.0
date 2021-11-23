Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC0445A19F
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236212AbhKWLkS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:40:18 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:40540 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbhKWLkQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637667428; x=1669203428;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=LXHRJiRVor0IZyinc1qTpoqnCRXjWjcQ+filp9vvOYc=;
  b=ryNzZ9uGz6HfvWcBsdR8zOtp866I3wHgRbYUWhpcnzaLTOZTV6hNhLbP
   RHSSXASJ0AXgUC8qjr8Z2i+gicqv/wezg8qTFgdURZwHGWwrmdwciDHyh
   HZpekD095Nxy+LpFeOMa0DXoE/8i+1NkucNt+RPdMZYPrIs/jdjvDcoft
   k3vg/QgeO3yTSeV1fLTCyVddMN0gUOX5RJf4NJAoweNdgq2nYS0TwzHRH
   3vVVI51QVvdmSleSLiiXd+rJXx1XRTT28Iwh5q9L7C+MMDFEtg/swZKFX
   dcDxNvKKvHtGxNeQMbaYLNHLhohlctG7UON6SA2PEMQW6QYV0h90JXP5j
   g==;
IronPort-SDR: SlwADrpUt/N+IDeSrfFy7ujCKFTvkApE6Y86MVvB+/zDI8Z22oqpu9uHS1kksef5Hx129hnuFQ
 EgspksdKB1HMjtgrDvJEbVEgolRV8eO/R4R7DF1oSUqXMgpqf8BIwK8zrTqXy25RroPp8tPhcx
 K2eFND9rVSF00qTEdPKSIjRxdSqsPFzzMXCqi85sYJbG8jkkJjlCeLmann03kXq5bEfHDB1LPY
 zkdMdxieb8k6jsabEUQqbaXktL175G3zU4PNnaJqj0omIW0ZSMUtWIOdiz60clqCLvsRqKS4Mp
 Qc9XdVnbFlEQUv3dij5d73EH
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="137452225"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2021 04:37:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 04:37:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 04:37:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaP/m/ZafJx1czggbucLrwpHU50/fUfJGRzIZWbgck3XnThBz41DEuoa2FMSudyy1/yE9fJgkAtu6Be+JCt5JJ7jqLr5WFv2b81cHiyAXNvuZtsdAQF1+hEug2lbPWxo9kOqeRdvxbqq23GLV3z6xc5prKzPLS6IAEkbpMK/OAvCfGx4yAGUBUW5rMAkzBafxB3lnCD+i5/RQvUU/5q6CGRtgA6rqu3gwsFc+UiQkn7BL1OAmUM8H+N4ZNPIbzp/JanoTNvVffCOIQuYhkgg0I8fHTxa2j7gqYLFFRQpd5copZzSadt83OFlzjfq9eMwHtiBp2PhAvp9dHIVemcWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXHRJiRVor0IZyinc1qTpoqnCRXjWjcQ+filp9vvOYc=;
 b=d5RhWBslZKTbuUAbhhep0rN0jJaIoT3aU2qy3nzD3QGrB9EOnPG07JUsAGDHRoKDRP+t4i7OfiG6ETQ3x8Ay6xEKPlDnxyKsSNP/bQl+ZJoHDZjCLD+a08SSTnAKcO1Ntqv2DC2+wd/Np2btUh9Um29B8TLfSg4RA41bGqfbka0lhwxeXoixhJHqMYqvt/sxW8kmbHOD/032/zcaYr09Dca3GYsF+92yoO9WMfvu2trg3Z4lUu5skLRW7cj9UwZnwr1QoPJGA+rG8z7UHeg3hz6XSJFvd6LRXh+98mSfhJUAwIe4oMM2IVH62PFi5bDiWIQxi24Q+Cy/vWn5w16bkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXHRJiRVor0IZyinc1qTpoqnCRXjWjcQ+filp9vvOYc=;
 b=Jv1aMgdJ4R8o398XLyfGSuJIpOIVVa/i6csEfePQImgK2uCq9yt0k+Mr4gBk+RCmP5KLGsmZKw13qPVM8syhtm3+jHZ6KFS+fCIELPh4CROBubpuvkxlS2Je1yW58kFjZtQy7FzjmTKEVQKMmggyOJdGoiK8x9VngcUmMCLnUXA=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5308.namprd11.prod.outlook.com (2603:10b6:408:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Tue, 23 Nov
 2021 11:37:03 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Tue, 23 Nov 2021
 11:37:03 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>,
        <skomatineni@nvidia.com>, <luca@lucaceresoli.net>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: imx274: implement fwnode parsing
Thread-Topic: [PATCH 2/2] media: i2c: imx274: implement fwnode parsing
Thread-Index: AQHX4Ft+8sAsBJ4NqEG9bv/gvgDoNqwQ+FcAgAADzwA=
Date:   Tue, 23 Nov 2021 11:37:03 +0000
Message-ID: <829cc139-ff72-268c-9d8c-5844d82a1fba@microchip.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
 <20211123111521.593863-2-eugen.hristev@microchip.com>
 <YZzPLOv2RBuj+zoS@paasikivi.fi.intel.com>
In-Reply-To: <YZzPLOv2RBuj+zoS@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 554f68e9-0a7f-4884-8639-08d9ae75922e
x-ms-traffictypediagnostic: BN9PR11MB5308:
x-microsoft-antispam-prvs: <BN9PR11MB53089FED0D2CDEF7C2385352E8609@BN9PR11MB5308.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfX049rSBs3Icmd6TU92ZvFUUFufobf2hxH7jwCMt1pB4vHC5IDvWOFXrbBBrlEqKffN4yUM/ZegtrKKj3/2XQ/H7AF1+NNTY+FI27VocfMJyxp0e6/oLsVCOJ7sjfciejErYsVmiC2Xcv47dBucv1AvOpNeZQFoOShqB+BO1guWHNvI0UXCwMrYM8rOjdzY1VgbGQ+alFZ6Ty3r6C4cqIL02FuJUT0DHt/NRC1ENIr0KDOYjpNIpoGgx27PUidhdAaROcehyFadWXAPgj7jDopse1eYw65dBncUFtEydEebjRzOjHCDT0Xv0j9TXib7sBdDVas5+tmbyd9kiDCf4XxLoNezZcxFPa/cY3tu3hemWgQZAy7FTh949MAST03c+xUc21K6bRg0hcnhXQvTwP83vdDCChd40pjDkp1W9R75B8Q/0XY2+7SNlYhGcQT2P2xqLfheMauREgpPYtBN1ILx96frBxgKTa2CQKeRgdYNUT9wVAI3HF4xExI+wExGwG9oP67HoylIruwo1I99NWSq703WXxjrWLVkgObzFsNormDhoSvQVS1WDYxjJrEOOgq0cw6ZBLXPISDl196FvF3Wccpx6ku7l5rWNClmF1UurTzZOkOnJHPrhotAn+cnURhk8qIzsgdP2A4Hv+I89xU0x40VWW1tz9iVEB4JNB7Ijk4+LpUjbt5YUw5md76sOawDzf3BJ7DtIe4qHz8GHRzmCSYoVErlXMepLY5hDMga3fI0eizVYJPvePEcoqclb6Cbr6mKuX0uHkXkLPawXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(64756008)(31686004)(71200400001)(8676002)(4326008)(31696002)(66446008)(38070700005)(66946007)(66476007)(66556008)(508600001)(6486002)(5660300002)(6916009)(2616005)(186003)(316002)(8936002)(83380400001)(26005)(122000001)(91956017)(86362001)(76116006)(36756003)(53546011)(6506007)(2906002)(38100700002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkdDcE1WSi9qd2VCa3MrSGNDcUNLUURzV3huRHFWNlVGMCtmSVZOZ1RqVXR0?=
 =?utf-8?B?cGhUOGVKZ2VrOERXM3BCcUd5emprb1RlK3lhUTMrYWV5V1NzMkV3UGNMMkZ5?=
 =?utf-8?B?Z0FST1EyeVlZOUFxODZVZit2REtNQUJPTlZsYlNWRzh5ZU1BTWdBS2pmN2th?=
 =?utf-8?B?MFJLYkQyQ0hHZmw2SzVENWswbC9TSHUwdUtsSTR3TGNFV1J2RlljSlFtbm04?=
 =?utf-8?B?Slo4R3BXTlBJVHF2SVVPSUl4RVh4OTg5c1NBYklYMVh3Qm92YnAwOEhJcEpR?=
 =?utf-8?B?RFRVWURBYU1wM0NPem9sbUFvc3FiMkVRTCs2b0cyTWd2cjlIdHNUVk5FejFX?=
 =?utf-8?B?N2dZa0VETVY0Y2psQ0lCWjNUNXhPUFF0dWQvTW1razc2blF5SGRMNC9hZWVL?=
 =?utf-8?B?Y0xQYVAyMUFuNkw0M0pJRElNZzkzK3J1bU9hbjAvM3VJejVQM0lKdlJubVdM?=
 =?utf-8?B?OEVoTzhKOVZQZWdrMC8yRFQ5d0RmdzdtQkRXNFpTdFVncHRqUTg0RjM4Qlpi?=
 =?utf-8?B?TUhVcnZFQzNZVlAwQnJaZytzRVBKMXNkeHNiMUhwRU05OUE4UWNVZDMvMHll?=
 =?utf-8?B?N1A0MWpEV3VENEM1aXFkVmFOUXFZbThlTXRqL2twRVEzTzhTT2lzV2F0RFJo?=
 =?utf-8?B?bmdkTW9sV1Vwcmo3RUJhbHA3NThOdXJxbUk5bi94ZGl3dUVHWThtM1ZwUDlJ?=
 =?utf-8?B?M0UrQ1NMNUN6YmpYaU1ZOTN0VFdkVUovSTZURksrOEh3ZUdKQUkzRWExcDF2?=
 =?utf-8?B?UTl5T083czlUSDRCcytKRjlpNFdlK05NRzFlblFOWWdCYXN5VzlvRmxSVlN4?=
 =?utf-8?B?RlA5UjU3NlNWRElyM0Q4R3J6SHpkQWxxWWVWYmEraXN3bmplQzdJOGxvMzlt?=
 =?utf-8?B?L0Z4Q3lOL3RPMVVwN3VqUFYxaThnRjU0VUZONHVaKysvSlV6a2d1cEloWjFX?=
 =?utf-8?B?RW1IL21Ya1pYWXE1UnNQVnJ5d25SNG0rV2NDSXBPeU9jNm5uekhLTnpzTnZJ?=
 =?utf-8?B?alJlcHdqNnB2Rm8zYVBMU21jbTFYcDVRYk1tVkF5QWRFMGtZeGkvQ253VzlT?=
 =?utf-8?B?cHpKWTVKeUY1QnVHcm5Sd0tuYWVrVTBsaEhvdytBNkdjKzRreDEwSm9iS01j?=
 =?utf-8?B?UGVMUTZuTU54WEVNbnpZcTFYZ3doMnBwbndzeWlkUmtJOWJBMDlXTjg2YVk2?=
 =?utf-8?B?dXhMMU51UkFrOGZHWmFGZzFibE42THBpc2gyVUM1M1NOaXpuU3BCR21tNk5N?=
 =?utf-8?B?Qkg1Y0R1U21CVmpmZkQ0a09kZnpJZmlnMFBzYXRPdFgrTHZTZVpDZ2JGYzhC?=
 =?utf-8?B?cnZsbnZXMS8rSFVRcEkwWkZuY1dWUjQ5YWlKd2laUldBSTdXOWJJZzZ6Wkt1?=
 =?utf-8?B?YXJ5NmR4VTRnNDMvZVlhb0dnYmFuTXJHZVoycldrUVR3VFI5akN0YktNRk43?=
 =?utf-8?B?QmxmL2E2cldQaExBQnAvMHZtdjRBYzR2dmtMNkEwNDIrdXlyclY2allud1A3?=
 =?utf-8?B?UmZUa29YMS9FbG5MZy96enNRT1QxNGlPVklVais3MXdBcFVHcENublk1WmtH?=
 =?utf-8?B?MmNpc0lubEFISFQwY1JvZVFFbEM2K0Z0UG1KNGVlbllEUFpkYTdZYXJiVnhC?=
 =?utf-8?B?Q2pna3hldWZod3BhV3VWSUQ2eFJsNU5uMlhtcmdROGFsdVoyN01tRTkwdUc5?=
 =?utf-8?B?WHQvcUpualA5TkFIQWpjdWRwcmNLZkxwS0dNd0N6ejJERVM1c1Q2QWFWVkZR?=
 =?utf-8?B?alBvd2RkclFUQmhOM3NwYkhOLzVFS3oyUkN5YVRRNlhGbEZ3Q3JBSlNaQldH?=
 =?utf-8?B?NzZOamtyVEFhL2VpcW84VGcrdlRLZmZKcFdQVWpsRDhCRmVsVW8wVTYzL0FW?=
 =?utf-8?B?YkRkQTBBcVpnSDVreGJLdk5NRlE1aitvZFBFYzJxbjE5UVkyYnF3NWUyYUIw?=
 =?utf-8?B?UGNJY2lGUVNNelM3OGlPQUhDVm1jSUtXL0Q2aVNkaU1uUnNpUG02OGJPeGNB?=
 =?utf-8?B?L0ZpQzJmbHFTVFhrbnBKQXVGcE0vWkY5aFlnemloQXdrMGo2UGZpdm03ekFU?=
 =?utf-8?B?U21uS1grbzczdXZ1QUY0OVUxTUMwS25ZOHE1Ymx2VmVncUV5SzNwWmxwQUFI?=
 =?utf-8?B?Y28yYWNISnM5RXMxRktxekdKYkg4a0N5ek5SMCswZHgvYnMvYVQxNURqUVBr?=
 =?utf-8?B?UmFTRmVSRnZCdDY5SmZmQWQ3Ky9tVG1nY3c5RTFaRjFqQzZiSnhVYzkwekl3?=
 =?utf-8?B?VmxXMG9QV0tPRTV0TzBuSTZRTWtBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <616D8132CE0724409A7D2F4B041BCD77@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554f68e9-0a7f-4884-8639-08d9ae75922e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 11:37:03.5649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1ni2VTznYGZqIxvtaUnj0JO1uMmLxbYTakpbvNx08gAoPZqLR5D9u0d6qQn/AJreow7jVBmmbh0tdEBm23ZT9RRTy3gq/QFCEqJ/wDYjNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5308
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMjMvMjEgMToyMyBQTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBFdWdlbiwNCj4g
DQo+IE9uIFR1ZSwgTm92IDIzLCAyMDIxIGF0IDAxOjE1OjIxUE0gKzAyMDAsIEV1Z2VuIEhyaXN0
ZXYgd3JvdGU6DQo+PiBJbXBsZW1lbnQgZndub2RlIHBhcnNpbmcgYXQgcHJvYmUgdGltZS4NCj4+
IENoZWNrIGlmIHRoZSBidXMgYW5kIG51bWJlciBvZiBsYW5lcyBhcmUgc3VwcG9ydGVkLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYyB8IDQwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0
MCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDI3NC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvaW14Mjc0LmMNCj4+IGluZGV4IGUzMWYwMDZiMTBk
OS4uNzc0OTEyZjQ0ZWZlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14Mjc0
LmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lteDI3NC5jDQo+PiBAQCAtMjcsNiArMjcs
NyBAQA0KPj4NCj4+ICAgI2luY2x1ZGUgPG1lZGlhL3Y0bDItY3RybHMuaD4NCj4+ICAgI2luY2x1
ZGUgPG1lZGlhL3Y0bDItZGV2aWNlLmg+DQo+PiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItZndub2Rl
Lmg+DQo+PiAgICNpbmNsdWRlIDxtZWRpYS92NGwyLXN1YmRldi5oPg0KPj4NCj4+ICAgLyoNCj4+
IEBAIC0xOTU3LDYgKzE5NTgsNDEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lk
IGlteDI3NF9pZFtdID0gew0KPj4gICB9Ow0KPj4gICBNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywg
aW14Mjc0X2lkKTsNCj4+DQo+PiArc3RhdGljIGludCBpbXgyNzRfZndub2RlX3BhcnNlKHN0cnVj
dCBkZXZpY2UgKmRldikNCj4+ICt7DQo+PiArICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZW5k
cG9pbnQ7DQo+PiArICAgICAvKiBPbmx5IENTSTIgaXMgc3VwcG9ydGVkICovDQo+PiArICAgICBz
dHJ1Y3QgdjRsMl9md25vZGVfZW5kcG9pbnQgZXAgPSB7DQo+PiArICAgICAgICAgICAgIC5idXNf
dHlwZSA9IFY0TDJfTUJVU19DU0kyX0RQSFkNCj4+ICsgICAgIH07DQo+PiArICAgICBpbnQgcmV0
Ow0KPj4gKw0KPj4gKyAgICAgZW5kcG9pbnQgPSBmd25vZGVfZ3JhcGhfZ2V0X25leHRfZW5kcG9p
bnQoZGV2X2Z3bm9kZShkZXYpLCBOVUxMKTsNCj4+ICsgICAgIGlmICghZW5kcG9pbnQpIHsNCj4+
ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJFbmRwb2ludCBub2RlIG5vdCBmb3VuZFxuIik7
DQo+PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICAgfQ0KPj4gKw0KPj4g
KyAgICAgcmV0ID0gdjRsMl9md25vZGVfZW5kcG9pbnRfYWxsb2NfcGFyc2UoZW5kcG9pbnQsICZl
cCk7DQo+IA0KPiBUaGlzIGFsbG9jYXRlcyBtZW1vcnkgZm9yIHRoZSBsaW5rIGZyZXF1ZW5jaWVz
LiBJdCBuZWVkcyB0byBiZSByZWxlYXNlZCBhdA0KPiBzb21lIHBvaW50Lg0KPiANCj4gWW91IGNv
dWxkIGFsc28gdXNlIHY0bDFfZndub2RlX2VuZHBvaW50X3BhcnNlKCkgYXMgdGhlIGRyaXZlciBk
b2Vzbid0IHNlZW0NCj4gdG8gdXNlIGxpbmsgZnJlcXVlbmNpZXMgKGFsYmVpdCBpdCBwcm9iYWJs
eSBzaG91bGQsIGJ1dCB0aGF0J3MgYW5vdGhlcg0KPiBkaXNjdXNzaW9uKS4NCg0KT2theSwgZ290
IGl0LCBJIGFtIGNoYW5naW5nLCB0ZXN0aW5nIGFuZCByZXNlbmRpbmcuDQoNClRoYW5rcw0KDQo+
IA0KPj4gKyAgICAgZndub2RlX2hhbmRsZV9wdXQoZW5kcG9pbnQpOw0KPj4gKyAgICAgaWYgKHJl
dCA9PSAtRU5YSU8pIHsNCj4+ICsgICAgICAgICAgICAgZGV2X2VycihkZXYsICJVbnN1cHBvcnRl
ZCBidXMgdHlwZSwgc2hvdWxkIGJlIENTSTJcbiIpOw0KPj4gKyAgICAgICAgICAgICByZXR1cm4g
cmV0Ow0KPj4gKyAgICAgfSBlbHNlIGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgZGV2X2Vy
cihkZXYsICJQYXJzaW5nIGVuZHBvaW50IG5vZGUgZmFpbGVkICVkXG4iLCByZXQpOw0KPj4gKyAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgfQ0KPj4gKw0KPj4gKyAgICAgLyogQ2hl
Y2sgbnVtYmVyIG9mIGRhdGEgbGFuZXMsIG9ubHkgNCBsYW5lcyBzdXBwb3J0ZWQgKi8NCj4+ICsg
ICAgIGlmIChlcC5idXMubWlwaV9jc2kyLm51bV9kYXRhX2xhbmVzICE9IDQpIHsNCj4+ICsgICAg
ICAgICAgICAgZGV2X2VycihkZXYsICJJbnZhbGlkIGRhdGEgbGFuZXM6ICVkXG4iLA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgIGVwLmJ1cy5taXBpX2NzaTIubnVtX2RhdGFfbGFuZXMpOw0KPj4g
KyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAg
IHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIGludCBpbXgyNzRfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCkNCj4+ICAgew0KPj4gICAgICAgIHN0cnVjdCB2NGwyX3N1
YmRldiAqc2Q7DQo+PiBAQCAtMTk3MSw2ICsyMDA3LDEwIEBAIHN0YXRpYyBpbnQgaW14Mjc0X3By
b2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+Pg0KPj4gICAgICAgIG11dGV4X2luaXQo
JmlteDI3NC0+bG9jayk7DQo+Pg0KPj4gKyAgICAgcmV0ID0gaW14Mjc0X2Z3bm9kZV9wYXJzZShk
ZXYpOw0KPj4gKyAgICAgaWYgKHJldCkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+
ICsNCj4+ICAgICAgICBpbXgyNzQtPmluY2sgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoZGV2LCAi
aW5jayIpOw0KPj4gICAgICAgIGlmIChJU19FUlIoaW14Mjc0LT5pbmNrKSkNCj4+ICAgICAgICAg
ICAgICAgIHJldHVybiBQVFJfRVJSKGlteDI3NC0+aW5jayk7DQo+IA0KPiAtLQ0KPiBLaW5kIHJl
Z2FyZHMsDQo+IA0KPiBTYWthcmkgQWlsdXMNCj4gDQoNCg==
