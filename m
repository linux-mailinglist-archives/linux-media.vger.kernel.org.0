Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79573F4313
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 03:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234612AbhHWBab (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Aug 2021 21:30:31 -0400
Received: from mo-csw1116.securemx.jp ([210.130.202.158]:57270 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232005AbhHWBaa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Aug 2021 21:30:30 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 17N1TjaU029386; Mon, 23 Aug 2021 10:29:45 +0900
X-Iguazu-Qid: 2wHH6p2Z5YGRBw6s9o
X-Iguazu-QSIG: v=2; s=0; t=1629682184; q=2wHH6p2Z5YGRBw6s9o; m=qjBd3lNHyZH5HBlKfPKaLhET9AZmp+njDvgrtuPcsmk=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1112) id 17N1TibX021035
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 23 Aug 2021 10:29:44 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 31E961000CA;
        Mon, 23 Aug 2021 10:29:44 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 17N1Th72011824;
        Mon, 23 Aug 2021 10:29:44 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+dAJmMSaOFlSxN2PEzWp+ZCGeoMTmW/mQoEtHHT+ZTCE+J8hamZRc53zmKZIDs+hi4xbiFxOlhSneVFGy0uLw36AveSWRfWCfv41nv5DEwHCEk2J6vjnpDH4DK6PHLCuozzMEXWGQyLAtz9ec3Cn7Du1lrFGTrTD2ctLMjB3mtBoHYmJe4u6iduJ/wP4ZTVKpN9qy86tMtxxzWXB/jSQsAzHUzBwbATY1+ocWjam60Ebz1tR12C5glPF0PIuqg/C5AzHVf+FyoYF9Cp4hs4aQcs6RAu1aaqpvJYjCJLqWMXNBG4bWWk0DF70hDCMfQE82ZB8KsAz1yV2/jsGTDrog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20Y3ML9mmXTum06/Fbq4fNexUkq5WGKoN6XcwkzzvCE=;
 b=MO/Tku380KbfqJ8mohlj6SaWqfis0EqGmpWtWZQutTr3/ByDOX/Vl6G/aNIW6YHuBusRbAPZciKQUiwX7/Tar5TP4j6pI7t71Hf2KIRBawJzJ0CeIah7yjvD1IQT7PKKutXSwOXE+WF6GeCxn7F0OO7m779IWWX6Af8l9LKPMMAvUcbUVLaNM6eKD/+A2zemPWWWfLj84cOzljxW87xFpjEmu1y5Ez1DQeAzyZ1GD9ltGM0heFyUsohFXru/ARtJB3VjcKRu/KsgEHLxvr4Q24WfeWJovFqSDRyoFzWkGsW263WnCM+UCEj6fYEWnzEXhb4wqWJLDHhzl9ob2WMiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From:   <trung1.dothanh@toshiba.co.jp>
To:     <nicolas@ndufresne.ca>, <linux-media@vger.kernel.org>
Subject: RE: media: videobuf2: Fails to scale H264 1080p video on 1920x1080
 screen
Thread-Topic: media: videobuf2: Fails to scale H264 1080p video on 1920x1080
 screen
Thread-Index: AdeVoJe9docn7NNNS8iXibN+hg0QZAAMCJwAAEvnXsA=
Date:   Mon, 23 Aug 2021 01:29:41 +0000
X-TSB-HOP: ON
Message-ID: <OSAPR01MB334613F1921347F7DC8FAF1E93C49@OSAPR01MB3346.jpnprd01.prod.outlook.com>
References: <OSAPR01MB3346DCCEBC794AD473F5D9EC93C19@OSAPR01MB3346.jpnprd01.prod.outlook.com>
 <19177965855edd38822ca5dc1eb70594f0bd11b5.camel@ndufresne.ca>
In-Reply-To: <19177965855edd38822ca5dc1eb70594f0bd11b5.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d41ce298-610d-4367-3500-08d965d57aec
x-ms-traffictypediagnostic: OSAPR01MB2897:
x-microsoft-antispam-prvs: <OSAPR01MB289713651CEAEE83294BAF2993C49@OSAPR01MB2897.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cDqvSIkyPMDSY6nVBqzYVt0l8qWeZxvZAqgnz+0ANxkT4WOzfjgeewOjWXzFSlutX9HlHTYDIUbeZPQD6M10umMApfLY56cDZmWMSxHRNA5U5NLWF49izkGhmFLEcFLW6VN+heTwFy1+bPLDVXZpizKlEDjm/zN31+BkYTAHXnK8ZMx0BrUsqe2FDNCLs76Q/2UuQ/eIMm0TO1Pij1kX0eAgXr9Ge5GWBvg/JFGcGKu3zjHDQJbuR7Z9rasBuv/uWcamW9/4cTvzBZT7NTIkIQS4bXgZbi86k4RipPqxllAs0X1joLK3wnc4WRQeXZG3qVSU5kP/CiDQEAz9LKyrexmcj2SkfOpc/ku4/DvIBIrZixaQPBMfYzVyfJDD8l5jrHD6crqD7yXiHrOGC82Bw0ryu0VmSDATv2RupYulnF9MxnyGwHaD0dov7X9S1cRCp22ccs2kc1AHttvWqcK11GOR0sW8AQhlWi8ypPypNBTMD8eB0j+IY3Rtwc8E+YUJrNmfZk7wOiITbtG8ChZ4YiPh8YkXL1SdgJ7L17jLl8MOKIgiCA2w5HmAVN9mnCDwVspyXw8QdqyzNyFoP4Jv+bEdaYrYZk3HU25K7I4H6/5RVjMq2uZkFfMU+LJIHVenjWh8iAKqiqUBpl4jc5gPgUog/tlnfoUBLh08U9AdGY/V9kXCtqI2PPXEmfEcTsL97/FyaCaqTZ7aJczcG2eyA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB3346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(9686003)(83380400001)(186003)(122000001)(52536014)(85182001)(110136005)(55016002)(38070700005)(76116006)(966005)(38100700002)(66476007)(66946007)(8676002)(26005)(478600001)(8936002)(66556008)(5660300002)(66446008)(64756008)(71200400001)(316002)(7696005)(53546011)(6506007)(86362001)(2906002)(33656002)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SnpsTjlobXhQeG1yMUFLQTdyd1J4R0xpMUxmalExekZZWEdSYmJSWEp4RzVF?=
 =?utf-8?B?cVZlaEdvYWlKT3ZVaXJFQm5aRWdVY3pzMWtyY2N2TEF5dTFYSENUanFtY291?=
 =?utf-8?B?NlBlOHhFVng1eTZiUzcwZzlZYlN0NC9qbDZWYkFVT1I0bm96anNmOTBIVFhL?=
 =?utf-8?B?MlkyZmJsUy85ZS96M2t2Q25pTkloT0N5V01JWmJucmlvSXg3clE1RmVqbDJJ?=
 =?utf-8?B?Z0E5NDhlVUZSL3krcWNJcHJyRU91WmsycEJFUEx2eWNxR2QreXpFdDRNTHhQ?=
 =?utf-8?B?THlMWUxTODIrZ0ZpeS84dHdmUGFDMUkyR21VZEhQbWE4NUNObmZGYUN3UGFD?=
 =?utf-8?B?Ymw2RWd6TERxalZySStsSlRzRjBDcHFjTldQRnk2c1ZrOFZ0SStJZlpOODBG?=
 =?utf-8?B?a3ZiSFg2bG81dmxXNDJFZE5OcXFHb2NQdVVudm1ROE1MT2VwaXhIMWZ3Z0U0?=
 =?utf-8?B?V3pEQ1UvMmluc2lxSHZaU09LSEpnZm9USGFWUGd6OGhsTW1ndzJLUkRaaVR4?=
 =?utf-8?B?NU9OTVB4TXVDRnkwLysxaWs2ZExIL2k4dCtXeTJCZ2k1WDMxdzlXQy9IOXdC?=
 =?utf-8?B?UFZxSHJ2RElieis3b2JhN0ZqODBiNlIxeHJPM3h1a1pOT0l6MFV2ZG93MERJ?=
 =?utf-8?B?QlRDN0ZsaVh4LzVOdFJ6TFdVMXhxTFpuank0b0ZZWkk4VTlKZUc3aVlmYXpC?=
 =?utf-8?B?aENxWllMaUVUZzk3MFJsMjJKVEtidyt2R0dFSjhSOHNod2ZqNytsK2dCSy90?=
 =?utf-8?B?alg1dnFqc21JQWQ2MnFHOVR4MGxYWDhBWDBPdS9HMTF1eXlMYmRvSytCT2ZH?=
 =?utf-8?B?WUVmb21HTWpsWkVSbGNDOFByTWNNS2FlVS96SzJXd05UeFJNMTI5b2ZpYnNG?=
 =?utf-8?B?Z3RNTzNmNUxvaDMvdzZMQlJzZTQ3ZUcyM25vL0ZQMGhUdURkNHNLemwxU2Rp?=
 =?utf-8?B?WlA4SUIyL2hiRndaT1BLMEVMNkhLaEliaHQ3YkxLeURsdE90cWRvWXo5VkNr?=
 =?utf-8?B?bi9sbUlvbDZYaTNtanJieEhjTVhJVWQvaUZnTVlTMWM2S242MFFBTTAxR1Y0?=
 =?utf-8?B?VzQ3enN4MmJtZ1NJWlEwYVJzaDJPUnlxaENLdDVIbEs4ZnZ6T29ERTV0K3E1?=
 =?utf-8?B?WU5BaFhpTExpUXB3c1dQSmNVbmdqK2UrLzNERnFrdVZ5d0NLSWhURmhxZDZq?=
 =?utf-8?B?eVhMcWhzUlJ0U1R6N240ejBvUFRUTE1YWkRnQUtUVWhIWXNNN0R4M3JMVkVx?=
 =?utf-8?B?WWQ5WWhJVzJVQ2RlOHJoYjJaU0QzNnpiaThMdk5XSmk4ZHZVY3lRZDZ1a1U4?=
 =?utf-8?B?U0xUV0JaY25aK2EvVlhLakhNMnIyS1dYa2dwaklUZFk1UFZkN0IyR2FDVW5W?=
 =?utf-8?B?MnF3cTI3NHdiSDc3N0VMWW1pUVAyTmJBTjUyYXRKU0p5ZDZMNG5MRVZabVZ5?=
 =?utf-8?B?a2w1VGRuaW9aUE1oLzZwclVkUDBYSW0zbHM0L3EyajFRN2F2RmhUTmRheEsr?=
 =?utf-8?B?alBqMG5TYk42dUxkc1JoUjh6K25PZURyWEZpemVXOE1MNDJZQzdreG5FZjJT?=
 =?utf-8?B?YTdlQjY0a0EyZlk1R2ZITjZ5dE1xRHRHQlJjQ2JQdkFRaEw5bTR2c2ViZGhp?=
 =?utf-8?B?eDl3MW50MUdiUVFhUm8zN2hxTFZXWkI5TWxia3cwTG5DbEZwbTVaQkw5VGx3?=
 =?utf-8?B?N1lCZ3FHby9jd3dtbzR5a2VzY29MbVVtbDMzcGVTMUJObzQ0SWw2R2JUVWVt?=
 =?utf-8?Q?zXmbpRCJiW+FuKOkfM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB3346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41ce298-610d-4367-3500-08d965d57aec
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 01:29:41.3596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nXaoNAvVb9OTNuRX4fxPTXjLqwGT9pVJEM0fV6J/ayymv7GCecszXhUlQJ0xCAG2GMXubHQugYOn4FcG95gYIlTuUzMqKROkXtE7mzR+4Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2897
X-OriginatorOrg: toshiba.co.jp
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LiBTb3JyeSBmb3Igbm90IG1ha2UgaXQgY2xlYXIuDQoN
Cj4gCWxlbmd0aCA9IChiLT5tZW1vcnkgPT0gVkIyX01FTU9SWV9VU0VSUFRSKQ0KPgkJPyBiLT5s
ZW5ndGggOiB2Yi0+cGxhbmVzWzBdLmxlbmd0aDsNCg0KPiBXcm9uZyBzbmlwcGV0ID8gWW91IGFy
ZSB1c2luZyBWQjJfTUVNT1JZX0RNQUJVRiBhY2NvcmRpbmcgdG8geW91ciBHU3RyZWFtZXIgcGlw
ZWxpbmUuDQoNClRoYXQncyByaWdodC4gImItPm1lbW9yeSIgaXMgVkIyX01FTU9SWV9ETUFCVUYs
IHRoZW4gImxlbmd0aCIgaXMgIiB2Yi0+cGxhbmVzWzBdLmxlbmd0aCIsDQp3aGljaCBoYXMgdmFs
dWUgNDE0NzIwMCAoPSAyIHggMTkyMCB4IDEwODApLg0KTXkgaXNzdWUgaXMgdGhlIGRlY29kZWQg
ZnJhbWUgb2YgSDI2NCB2aWRlbyBpcyAxOTIweDEwODgsIHdoaWxlIHBsYW5lIGlzIG9ubHkgMTky
MHgxMDgwLA0KYW5kIHRoYXQgbWFrZXMgX192ZXJpZnlfbGVuZ3RoIHJldHVybiAnLUVJTlZBTCcu
DQpJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGZ1bmN0aW9uIHNob3VsZCBoYXZlIGEgc3BlY2lhbCBj
aGVjayBmb3IgdGhlIGNhc2UgbGlrZSB0aGlzOg0KZnVsbEhEIEgyNjQgZnJhbWUgKDE5MjB4MTA4
OCkgd2l0aCBmdWxsSEQgc2NyZWVuICgxOTIweDEwODApLg0KDQogPiBJJ20gbm90IGZ1bGx5IGNl
cnRhaW4gb2Ygd2hhdCBoYXMgZ29uZSB3cm9uZywgc2luY2UgdGhpcyBjYWxsIHdhcyBhZGRlZCAo
MS4xOC4wKSwgdGhpcyBjb2RlIHBhdGggaXMgc3VwcG9zZWQgdG8gd29yazoNCg0KPiBodHRwczov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9ibG9i
L21hc3Rlci9zeXMvdjRsMi9nc3R2NGwydHJhbnNmb3JtLmMjTDkwNQ0KDQo+IEdTdHJlYW1lciB3
aWxsIHVwZGF0ZSB0aGUgZHJpdmVyIEZNVCB0byBwYWRkZWQgd2lkdGgvaGVpZ2h0IGJlZm9yZSBj
YWxsaW5nIHN0cmVhbW9uIGFuZCBTX1NFTEVDVElPTiBpcyB1c2VkIHRvIHRlbGwgdGhlIHNjYWxl
ciB3aGljaCBwYXJ0IGlzIHRvIGJlIHVzZWQgaW4gdGhlIHNjYWxpbmcgcHJvY2Vzcy4NCg0KVGhh
bmsgeW91LiBJIHdpbGwgY2hlY2sgdGhpcyBjb2RlIHRvIHNlZSB3aGF0IEknbSBtaXNzaW5nLg0K
DQpUaGFua3MsDQpUcnVuZw0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTmlj
b2xhcyBEdWZyZXNuZSBbbWFpbHRvOm5pY29sYXNAbmR1ZnJlc25lLmNhXSANClNlbnQ6IEZyaWRh
eSwgQXVndXN0IDIwLCAyMDIxIDk6MzYgUE0NClRvOiBkbyB0aGFuaCB0cnVuZyjvvLTvvLPvvKTv
vLYg77yl772O772H44CA77yRKSA8dHJ1bmcxLmRvdGhhbmhAdG9zaGliYS5jby5qcD47IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IG1lZGlhOiB2aWRlb2J1ZjI6IEZh
aWxzIHRvIHNjYWxlIEgyNjQgMTA4MHAgdmlkZW8gb24gMTkyMHgxMDgwIHNjcmVlbg0KDQpMZSB2
ZW5kcmVkaSAyMCBhb8O7dCAyMDIxIMOgIDA4OjU1ICswMDAwLCB0cnVuZzEuZG90aGFuaEB0b3No
aWJhLmNvLmpwIGEgw6ljcml0wqA6DQo+IEhlbGxvLA0KPiANCj4gSSBhbSB0cnlpbmcgdG8gcGxh
eSB2aWRlbyB3aXRoIEdzdHJlYW1lciAgb24gYSBmdWxsSEQgbW9uaXRvci4gVGhlIGJvYXJkIEni
gJltIHVzaW5nIGlzIEFwYWxpcyBpTVg2Lg0KPiBQbGF5aW5nIHZpZGVvIHdvcmtzIGdyZWF0IHdp
dGggdjRsMmgyNjRkZWM6DQo+IA0KPiAJZ3N0LWxhdW5jaC0xLjAgZmlsZXNyYyBsb2NhdGlvbj0x
MDgwLm1rdiAhIG1hdHJvc2thZGVtdXggISBoMjY0cGFyc2UgXA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICEgdjRsMmgyNjRkZWMgY2FwdHVyZS1pby1tb2RlPWRtYWJ1ZiBcDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgISBrbXNzaW5rDQo+IA0KPiBIb3dldmVyLCBpdCBmYWlscyB0
byBzY2FsZSB2aWRlbyB0byA3MjBwIHdpdGggdjRsMmNvbnZlcnQ6DQo+IA0KPiAJZ3N0LWxhdW5j
aC0xLjAgZmlsZXNyYyBsb2NhdGlvbj0xMDgwLm1rdiAhIG1hdHJvc2thZGVtdXggISBoMjY0cGFy
c2UgXA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICEgdjRsMmgyNjRkZWMgY2FwdHVyZS1p
by1tb2RlPWRtYWJ1ZiBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgISB2NGwyY29udmVy
dCBvdXRwdXQtaW8tbW9kZT1kbWFidWYtaW1wb3J0IFwNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAhIHZpZGVvL3gtcmF3LHdpZHRoPTEyODAsaGVpZ2h0PTcyMCBcDQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgISBrbXNzaW5rDQo+IA0KPiBBZGRlZCBzb21lIGRlYnVncyBhbmQgSSBm
b3VuZCB0aGF0IGl0IGZhaWxlZCBhdCAnZHJpdmVycy9tZWRpYS9jb21tb24vdmlkZW9idWYyL3Zp
ZGVvYnVmMi12NGwyLmM6X192ZXJpZnlfbGVuZ3RoKCknLg0KPiANCj4gCWxlbmd0aCA9IChiLT5t
ZW1vcnkgPT0gVkIyX01FTU9SWV9VU0VSUFRSKQ0KDQpXcm9uZyBzbmlwcGV0ID8gWW91IGFyZSB1
c2luZyBWQjJfTUVNT1JZX0RNQUJVRiBhY2NvcmRpbmcgdG8geW91ciBHU3RyZWFtZXIgcGlwZWxp
bmUuDQoNCj4gCQk/IGItPmxlbmd0aCA6IHZiLT5wbGFuZXNbMF0ubGVuZ3RoOw0KPiAJaWYgKGIt
PmJ5dGVzdXNlZCA+IGxlbmd0aCkNCj4gCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFRoZSDigJxi
LT5ieXRldXNlZOKAnSBpcyA0MTc3OTIwICg9IDIgeCAxOTIwIHggMTA4OCksIHdoaWxlIHBsYW5l
IGxlbmd0aCBpcyBqdXN0IHcNCj4gVGhlIGFjdHVhbCBmcmFtZSBzaXplIG9mIEgyNjQgdmlkZW8g
aXMgMTkyMHgxMDg4LCBzbyBJIGFkZGVkICBhIGJ5cGFzcyANCj4gZm9yIHRoaXMgY2FzZSBhbmQg
dmlkZW8gY2FuIGJlIHNjYWxlZCwgYnV0IHRoYXQgbWF5IG5vdCBhIGNvcnJlY3Qgd2F5IHRvIGZp
eCB0aGlzIHByb2JsZW0uDQo+IA0KPiBJcyB0aGlzIGEgYnVnIG9yIEkgbmVlZCB0byBkbyBleHRy
YSBzdGVwcyBiZWZvcmUgc2NhbGUgdmlkZW8/DQoNCkknbSBub3QgZnVsbHkgY2VydGFpbiBvZiB3
aGF0IGhhcyBnb25lIHdyb25nLCBzaW5jZSB0aGlzIGNhbGwgd2FzIGFkZGVkICgxLjE4LjApLCB0
aGlzIGNvZGUgcGF0aCBpcyBzdXBwb3NlZCB0byB3b3JrOg0KDQpodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZ3N0cmVhbWVyL2dzdC1wbHVnaW5zLWdvb2QvLS9ibG9iL21hc3Rlci9zeXMv
djRsMi9nc3R2NGwydHJhbnNmb3JtLmMjTDkwNQ0KDQpHU3RyZWFtZXIgd2lsbCB1cGRhdGUgdGhl
IGRyaXZlciBGTVQgdG8gcGFkZGVkIHdpZHRoL2hlaWdodCBiZWZvcmUgY2FsbGluZyBzdHJlYW1v
biBhbmQgU19TRUxFQ1RJT04gaXMgdXNlZCB0byB0ZWxsIHRoZSBzY2FsZXIgd2hpY2ggcGFydCBp
cyB0byBiZSB1c2VkIGluIHRoZSBzY2FsaW5nIHByb2Nlc3MuDQoNCj4gDQo+IFBhY2thZ2VzIHZl
cnNpb24gaW4gbXkgZW52aXJvbm1lbnQgYXJlOg0KPiAqIEtlcm5lbDogNS4xMC4xOQ0KPiAqIEdz
dHJlYW1lcjogMS4xOC40DQo+IA0KPiBUaGFuayB5b3UsDQo+IFRydW5nDQo+IA0KDQo=

