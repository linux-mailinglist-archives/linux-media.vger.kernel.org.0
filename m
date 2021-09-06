Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFBB4017A3
	for <lists+linux-media@lfdr.de>; Mon,  6 Sep 2021 10:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240679AbhIFIPG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Sep 2021 04:15:06 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:20346 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbhIFIPF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Sep 2021 04:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1630916041; x=1662452041;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NIZqacRCYkSK5WPS+GPqeJuHbzTNnSw6RXHtcKrnZ2s=;
  b=Tr3nHhbUtckQ3q7gijklQbmKRAyZXIRfSWJ828QV928/ObuccV5dMcBV
   Pec+m24x4fCGRFvIVGjmw4UN8205EQKx4fsb0HI5cFAavhONwFSj65hKC
   ZrhoXhfXgtwM0Jkxa8EqxMwebDODEwJhB4yJs5Oo4p/ROMEWEu44wINLV
   fGrCh3730Ad6VK+9wvIW9BOwmUoA3v57cWkm6V3254QHWryFRcrVO7E73
   AfxuJzRbi7ErusNqRProqzOTbZdWhnnuTrYi5ph5lHD/r8OSNnWPlp29n
   0lfVpcoT3+IJtUfI1mtPdqFikKLPGNNu8/DKHP+lz61aqWggol4QDpBIH
   w==;
IronPort-SDR: TdVRlhCFATrs3B/cvZGs8d3PLylE5XbMRUbGu2rkNo/A5HcXYWV4jufAmyfvpHesdE483I5Suu
 w5MPB+40YbNCSyUPL4Cn4WOPlQs8MC2LMnSweHFiiy15TaY+1KtFowO5/xNHJmqlciAtzf6cTL
 aWnnZodwVje8Ck1vMpqhrOqEXW1fT2AM8ElM5DUdxcZ1wLCTSqnbvt8V/8Dg7rq+WVxyhYnv5M
 U1/LVvvAJP2oidizJIyjErB2kNCNsatdL1FGPxJi9Pnhaex6nFh2zJdqhztpyEgYHrpj0TEmPr
 vMM07UorN5lcn2UFKkOA+QJr
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="130833686"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2021 01:14:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Sep 2021 01:13:59 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 6 Sep 2021 01:13:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSHA5aN9e1lmPs5QPQEVCq/7Q1PeQVuDnoz1xex1RFBJyn+46ja3R3a977VZLeosmlybchvr0mjutUeA0Ki6rzs/YIWTBSmvsVYD3AUZt7BMEkOef8n0S9XRglzEKkEeuKPqcQmVSM6mGC/HMGqKiPCpEUWWk2d8zl78cohBbt2cYEwvDHshTTsTsw6KNEXNhpis7FtdwrRyD1EXHlSnq556vXpTWOuii6pJM0S9fK4GaavqfC0mQ9QSty691vmRk7CMAaY5UoKHF9DBwSXqs5lBrKo3pr/ENOqLogbw+XTGgGPTprnPIZw4w+YcxWOrJ6dUNdBOAKWoy85ap0t9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIZqacRCYkSK5WPS+GPqeJuHbzTNnSw6RXHtcKrnZ2s=;
 b=ZdnqJkqkdUtxLebOYnqlDq6Vy2ZJNtAkyGDNCWMWc5U/DN5KXCuZoKYf364x3VtW5Q96WynWAqeESNoVKqm8LBSqky2v2i0NA3HVMIRsIXGx3sBlOvjWUTA7AlOs0elzgWExUDOBs9KqAUvWKl5M0+VmMvI9Ql9O0NmgkGO2DgHtcu8HjaVzRr7haDT3CzZ4g2L/52Lh+f+u1VY/3oncUhCRJ9f3Xge7EJTiYGZi2DX2yW8tB+71T6Su2WTs2x46+xbQ81P+qrYz6iqAm9Fxys6Nc1AyW4GbfB+GPWiSGJ7BdCoR6MiBdJMb9ZYozpFE02bvdTCn0svP0DEFkninRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIZqacRCYkSK5WPS+GPqeJuHbzTNnSw6RXHtcKrnZ2s=;
 b=jacBpr5+3V7b3uD9DWA7ZcETK+j7filRVKpxdkr0BFoBcXIzJZf4OLV+XGu/yf7Z1VmNtbs9zi32QP6dIbYO3apcVP9PcMCRwohiHQ7OwQnlGfoyYMfscYSFU+EgOZzAqyY0UpXnMIl00aj23jawIaE4tQ8gVo3WGcj+7ss6Wug=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5515.namprd11.prod.outlook.com (2603:10b6:408:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Mon, 6 Sep
 2021 08:13:57 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::c5c0:630e:5d91:342b]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::c5c0:630e:5d91:342b%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 08:13:57 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <mchehab+huawei@kernel.org>
CC:     <Jonathan.Cameron@Huawei.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <mchehab@kernel.org>,
        <Nicolas.Ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Topic: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Index: AQHXQZL+MGs0ijyAgUSZwiGLPkSbCarUy5mAgDhgXQCAAAmegIAAJ7wAgIoKzgCAAAMCAA==
Date:   Mon, 6 Sep 2021 08:13:57 +0000
Message-ID: <1b480d13-3575-b486-e5dc-df08b50e4225@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
 <20210505130835.000006b7@Huawei.com>
 <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
 <20210610113827.57db9e77@coco.lan>
 <e25d024e-4fa6-dd67-b97a-1d2640f2b560@microchip.com>
 <20210906100310.4891fa2c@coco.lan>
In-Reply-To: <20210906100310.4891fa2c@coco.lan>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 366e9c6b-a931-4895-92ea-08d9710e46ab
x-ms-traffictypediagnostic: BN9PR11MB5515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5515843CB176B6C0A3A098B3E8D29@BN9PR11MB5515.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s+cTnEierLVXNKyvDv+QCax+f0+R9yHKSs7BZv0BqEiL6Ufocn2RjNZ0Qzr7mY2DR6zYoG8/G7lD5lYOCLrhdhGTN5ir2VYdG34h4dHvSu9oOT7G/lVUX0Rkm43EsJKGkkhEos7/TiWkCez8tQh35YxAUIrrsa5UvEgkwmqr3dnNFgCNwlwPnNO04TUTWNJp7Yu0b2U5qbmfkBj53EZIIKXeUpGP50vwUHfLRBg4hhhlLiCaYotNUGqY+JHYGPnAqnpjLKqwqrWdJWNpODxF9xIPiM5GeI76QiTg3jG6YzN2Fi+iprykxLWHM+22+LrqBswmGhg1U3zGwDQXboV+u3yBSmVgU0vu8yGqFHmT01GU5c48rkhtaqZjp+9RJPSzY1QIjD7PFAl61zC7C6HCfB7vcnr8P4ypkSJvRJO6ysP9j8FO8/6Yj7kJQCTM43zo4Jref/infJV9bvZn++0O2x/Grx/t8tv80lZpIs5756yf03PHF1VY84PgtOa/9cSYkxVTuIp2VsapAEDWs3em5P7WAu3ViyX27OEinBF1AUHiswryzaOJa8KGEadscZhla018PH3EmHnbAVx8kOt9SPyF/yja18vTyJl1etWESz4nIzfwkpqt2ttoDGhMeQEWx6DQMoqbEJONcyaaU1ULJeVaF6vZGEv54dTWQw9p0u9PMlGvsl7sr0CfbGcD2NiRAhKNo0AaQtErAnbtNNg/OIPGROo/gXVY6pzB4FrbZsSlELJoG91kutxglLg+3ci55iVKBVGI0tObE0tmqIABEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6512007)(107886003)(122000001)(66446008)(8936002)(186003)(31696002)(2906002)(4326008)(38070700005)(66556008)(38100700002)(66476007)(66946007)(76116006)(86362001)(64756008)(316002)(54906003)(2616005)(83380400001)(8676002)(6486002)(6506007)(91956017)(508600001)(36756003)(31686004)(26005)(53546011)(71200400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YThNcHFBMnlHVEM0SEtLQlVrKytEVmFPZ2w1a0xlbXhJMFhOK3VLeUZ5K1Fz?=
 =?utf-8?B?Q0tGTXhVRTBPK1hUcXUwWTZnZTl4d0F2Qy9yY2VXbGxQenpLTzRpVTQzMUZF?=
 =?utf-8?B?RTVJMzBUbjAvcmFKTVlDSmQ2elB2QnN3bUdLUjgreGR5Mks5cFJ4VkxQc3kz?=
 =?utf-8?B?VjdGcG9hbHhVR0hWcng5YnJKUE5wbGgra29SZE1QSVlrRmRQZitHcjBSL3Az?=
 =?utf-8?B?NkVQRi9TV01NbzN6ZTFQaWFmRGxWeXhSa0JZOFRDUGV6ekJHY2NYdlZxY055?=
 =?utf-8?B?Y2w0WXA1elBwLzhLakRsQ1dYUjJEQk5ROWJDNXUxYjFyTTVaYzFtQmhSV1Nm?=
 =?utf-8?B?U0V3SXJxeUVpVEpsYnhuelpmR0lwWm04c0hLcjIybXpjd1BDMjBzTm9SelhL?=
 =?utf-8?B?amQxSFVvRGpzQWdHL0dQa3doQnpSTjRVeUkxb0hRQllVQzBnMkgwNXNDWXNN?=
 =?utf-8?B?dGcycGN1anlBSFJFRlovelczSldwSERRMGprVWtQRUNQdU5ibkMwTkxJTGJ1?=
 =?utf-8?B?a1dUdFNsR0hOQ0NvbUIxR1YzcDJOUzF0VFprbERqMUlDeXpzd3hyQ2hKOVF4?=
 =?utf-8?B?eGdzUGVKT0hmZlNrc3lIL2lVZGkvTVhLdlUyQ3RNODM4N3ZsNmhnTWxFYnBa?=
 =?utf-8?B?b2xhWlAySlhFUDZ1VzhBVC8rMkhZL0J4UjQ0WUxxNmhNc1JpOStBZDFaYVMx?=
 =?utf-8?B?Y1J4M2JtWnVYTzJKWndRK1RHbmNqT2FWUVdrb3E2WnpiNjJ0QnlCdGp5RUN6?=
 =?utf-8?B?YnV4Z1IwV0tjMkVDekRuakV6QVEwbVcrM1BaaHBFdWY5TCtVUkV5WDBBUWk2?=
 =?utf-8?B?TkZNZFdvWm8wRjZVclZQWGFCTlV6T2JDU2tuWDFBWlI0L2hkSU5zOW1YenRP?=
 =?utf-8?B?RlYxQk9VMm9jbEZlRXM4d2FkMTErb21yYjEraGYxSVN0czNmOHBtd3pXbjFs?=
 =?utf-8?B?RXRXQVZQWllQalZQQ2Y4VmYvR3ZFbnYxVUl4YkI0b1V4c1RjNm5OZm9NSnZY?=
 =?utf-8?B?N0pZS2xkTWdyWU9kZFk0SUpjRHpKT1RyUWhKWFovSi9LODErVzVoN3pLNCsy?=
 =?utf-8?B?MHdwTzIvNWVrNHR0elgxNTErZU92RWIyYk1pZVpMNXBBb2hYakdUL0g0OUdS?=
 =?utf-8?B?RWpIZGdmd3RDeUprUVF5T2xSRDIyaExFRTJjWG8xaXYzemRtcDJFQW9SUmxM?=
 =?utf-8?B?d096Q2xiMUZmanBhTTlCaUs5SU53QTJjUEtQMUpnSk5Ec21GdXQxZEcwUmpi?=
 =?utf-8?B?ME5hSHdZZndTODBSYzRJOGErNEZ6aXhQTGFUbG5zbGxIK3lrMHRHNU1LOXYz?=
 =?utf-8?B?ZDR3ZkFCQU9FVCtjTkVLTGVWc0xtR29vVFFxL3Y0ZDRJZXpsU0I5d2N5L1Jv?=
 =?utf-8?B?alQzcVhpbkY2aThPbnJUSUI2U2I0VE1kdzhJbTZ5dWJrRU83eTNOQ2tIYUtD?=
 =?utf-8?B?VWNVUzk0VUpDVVFJeHd1amRoVGIxeDBZTG1Sa3lDa2dRUVdwMWhQYmRUVmlK?=
 =?utf-8?B?MVhyakMreXJKZmRaZDhKMFc1OTBnMjkwczVJN1AzRnVBWWR2cHZxSDk5WmdR?=
 =?utf-8?B?N09oQVVoOEs3bHdPejFGeW9qRWV4N1VoN3B6aGRFUEU4U1NId2hNYnc3TGxJ?=
 =?utf-8?B?M2tKS016dDFWSHEvZVVRL1dxM0dnNklOQVFlajl3L3BDUit3RXI3MVBuc1JF?=
 =?utf-8?B?VTNRQXFlc0RmUW9mU2tHUTdaN2UzV0hPNytROUpLY3BIcDNjektUdDlRVGJ5?=
 =?utf-8?Q?BHTWGBcTtk1G22GJJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <52505AB7B52A0341B22BAC86E5BD61C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366e9c6b-a931-4895-92ea-08d9710e46ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2021 08:13:57.7272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJqR8fTgxm0GeRN20F1n7Og0OHmPzzKSepZx/LaE7x6PQbjNHGjA/VGxZIlEVpt37pGuIIr7Dq+gSnecQGacdAzGSyskbXvty6NenWkuQgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5515
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gOS82LzIxIDExOjAzIEFNLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6DQo+IEhpIEV1
Z2VuLA0KPiANCj4gRW0gVGh1LCAxMCBKdW4gMjAyMSAxMjowMDo0MiArMDAwMA0KPiA8RXVnZW4u
SHJpc3RldkBtaWNyb2NoaXAuY29tPiBlc2NyZXZldToNCj4gDQo+PiBPbiA2LzEwLzIxIDEyOjM4
IFBNLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBFbSBUaHUsIDEwIEp1biAyMDIxIDA5OjA0OjA3ICsw
MDAwDQo+Pj4gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gZXNjcmV2ZXU6DQo+Pj4NCj4+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2Mt
YmFzZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+
Pj4+Pj4gaW5kZXggZmUzZWM4ZDBlYWVlLi5jZThlMTM1MWZhNTMgMTAwNjQ0DQo+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+Pj4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+
Pj4gQEAgLTI5NCw5ICsyOTQsMTMgQEAgc3RhdGljIGludCBpc2Nfd2FpdF9jbGtfc3RhYmxlKHN0
cnVjdCBjbGtfaHcgKmh3KQ0KPj4+Pj4+ICAgICBzdGF0aWMgaW50IGlzY19jbGtfcHJlcGFyZShz
dHJ1Y3QgY2xrX2h3ICpodykNCj4+Pj4+PiAgICAgew0KPj4+Pj4+ICAgICAgICAgIHN0cnVjdCBp
c2NfY2xrICppc2NfY2xrID0gdG9faXNjX2Nsayhodyk7DQo+Pj4+Pj4gKyAgICAgaW50IHJldDsN
Cj4+Pj4+Pg0KPj4+Pj4+IC0gICAgIGlmIChpc2NfY2xrLT5pZCA9PSBJU0NfSVNQQ0spDQo+Pj4+
Pj4gLSAgICAgICAgICAgICBwbV9ydW50aW1lX2dldF9zeW5jKGlzY19jbGstPmRldik7DQo+Pj4+
Pj4gKyAgICAgaWYgKGlzY19jbGstPmlkID09IElTQ19JU1BDSykgew0KPj4+Pj4+ICsgICAgICAg
ICAgICAgcmV0ID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChpc2NfY2xrLT5kZXYpOw0KPj4+
Pj4+ICsgICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiByZXQ7DQo+Pj4+Pj4gKyAgICAgfQ0KPj4+Pg0KPj4+PiBIaSBNYXVybywNCj4+
Pj4NCj4+Pj4gV2l0aCB0aGlzIHBhdGNoLCB0aGUgSVNDIGlzIGJyb2tlbiBvbiBsYXRlc3QgbWVk
aWEgdHJlZS4gSXQgbG9va3MgbGlrZQ0KPj4+PiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGZv
ciB0aGUgSVNDX0lTUENLIGNsb2NrIHJldHVybnMgLUVOT0FDQ0VTUyBhbmQNCj4+Pj4gdGh1cywg
dGhlIHByb2JlIG9mIHRoZSBkcml2ZXIgZmFpbHM6DQo+Pj4+DQo+Pj4+IGF0bWVsLXNhbWE1ZDIt
aXNjIGYwMDA4MDAwLmlzYzogZmFpbGVkIHRvIGVuYWJsZSBpc3BjazogLTEzDQo+Pj4+IGF0bWVs
LXNhbWE1ZDItaXNjOiBwcm9iZSBvZiBmMDAwODAwMC5pc2MgZmFpbGVkIHdpdGggZXJyb3IgLTEz
DQo+IA0KPiBXaGF0J3MgdGhlIGN1cnJlbnQgc3RhdHVzIG9mIHRoaXMgaXNzdWU/DQoNCkhpIE1h
dXJvLA0KDQpDdXJyZW50bHksIGFzIGZhciBhcyBJIGtub3csIHRoZSBJU0MgaXMgYnJva2VuIGlu
IDUuMTQgYW5kIGN1cnJlbnQgTGludXggDQptYXN0ZXIuIEkgcGxhbiB0byBpbnZlc3RpZ2F0ZSB0
aGlzIGlzc3VlIHRoaXMgd2VlayAob3IgdGhlIG5leHQuLi4pLCANCnRvZ2V0aGVyIHdpdGggc29t
ZSBvdGhlciB0aGluZ3MuIEkgd2FudCB0byB0cnlvdXQgdGhlIFBNIHBhcnQgb2YgdGhlIA0KZHJp
dmVyIHRvIHNlZSB3aGVyZSBpcyB0aGUgcHJvYmxlbS4NCldoZW4gSSBjb21lIHVwIHdpdGggYSBm
aXggb3IgcGF0Y2gsIEkgd2lsbCBzZW5kIGl0IG9uIHRoZSBtYWlsaW5nIGxpc3QuDQpJZiB5b3Ug
aGF2ZSBhbnkgaWRlYXMgdGhhdCBJIGNhbiB0cnkgbWVhbndoaWxlLCBmZWVsIGZyZWUgdG8gY29u
dGFjdCBtZSANCnRvIHNlbmQgYSBwYXRjaCB0aGF0IEkgY2FuIHRlc3QuDQoNCg0KRXVnZW4NCg0K
DQo+IA0KPiBJZiB0aGUgYnVnIHN0aWxsIGhhcHBlbnMsIHdlIG5lZWQgYSBmaXggZm9yIGl0Lg0K
PiANCj4gV2UgbWlnaHQgcmV2ZXJ0IHRoaXMgcGF0Y2gsIGJ1dCB0aGlzIHdvdWxkIGp1c3QgYmUg
bWFza2luZyBzb21lIG90aGVyDQo+IGhpZGRlbiBidWcuDQo+IA0KPiBSZWdhcmRzLA0KPiBNYXVy
bw0KPiANCj4gDQo+IA0KPj4+Pg0KPj4+Pg0KPj4+PiBDb3VsZCB5b3UgcG9pbnQgb3V0IGhvdyBJ
IGNvdWxkIGZpeCB0aGlzID8gTWF5YmUgdGhlIGlzY19jbGstPmRldiBpcyBub3QNCj4+Pj4gcHJv
cGVybHkgaGFuZGxlZC9pbml0aWFsaXplZCBpbiBzb21lIG90aGVyIHBhcnQgb2YgdGhlIGNvZGUg
Pw0KPj4+DQo+Pj4gTG9va2luZyBhdCBSUE0gaW1wbGVtZW50YXRpb246DQo+Pj4NCj4+PiAgICAg
ICAgICAgc3RhdGljIGludCBycG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IHJwbWZs
YWdzKQ0KPj4+ICAgICAgICAgICB7DQo+Pj4gLi4uDQo+Pj4gICAgICAgICAgIGlmIChkZXYtPnBv
d2VyLnJ1bnRpbWVfZXJyb3IpDQo+Pj4gICAgICAgICAgICAgICAgICAgcmV0dmFsID0gLUVJTlZB
TDsNCj4+PiAgICAgICAgICAgZWxzZSBpZiAoZGV2LT5wb3dlci5kaXNhYmxlX2RlcHRoID09IDEg
JiYgZGV2LT5wb3dlci5pc19zdXNwZW5kZWQNCj4+PiAgICAgICAgICAgICAgICYmIGRldi0+cG93
ZXIucnVudGltZV9zdGF0dXMgPT0gUlBNX0FDVElWRSkNCj4+PiAgICAgICAgICAgICAgICAgICBy
ZXR2YWwgPSAxOw0KPj4+ICAgICAgICAgICBlbHNlIGlmIChkZXYtPnBvd2VyLmRpc2FibGVfZGVw
dGggPiAwKQ0KPj4+ICAgICAgICAgICAgICAgICAgIHJldHZhbCA9IC1FQUNDRVM7DQo+Pj4gLi4u
DQo+Pj4NCj4+PiBJdCBzb3VuZHMgdGhhdCBSUE0gaXMgZGlzYWJsZWQgZm9yIHRoaXMgY2xvY2su
IERpZCB5b3UgY2FsbA0KPj4+IHBtX3J1bnRpbWVfZW5hYmxlKCkgYmVmb3JlIGNhbGxpbmcgaXNj
X2Nsa19wcmVwYXJlKCk/DQo+Pj4NCj4+PiBUaGFua3MsDQo+Pj4gTWF1cm8NCj4+Pg0KPj4NCj4+
IEkgdHJpZWQgdG8gY2FsbCBwbV9ydW50aW1lX2VuYWJsZSBmb3IgdGhlIGNsayBhdCBjbGtfaW5p
dCB0aW1lLCBidXQNCj4+IGRvaW5nIHRoYXQgbWFrZXMgdGhlIHJ1bnRpbWUgZm9yIHRoZSBJU0Mg
ZmFpbCBsaWtlIHRoaXM6DQo+Pg0KPj4gYXRtZWwtc2FtYTVkMi1pc2MgZjAwMDgwMDAuaXNjOiBV
bmJhbGFuY2VkIHBtX3J1bnRpbWVfZW5hYmxlIQ0KPiANCj4gDQo+IA0KPiBUaGFua3MsDQo+IE1h
dXJvDQo+IA0KDQo=
