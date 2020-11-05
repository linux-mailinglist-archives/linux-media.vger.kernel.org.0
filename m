Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5619F2A788B
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 09:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgKEIHD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 03:07:03 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2362 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgKEIHC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 03:07:02 -0500
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CRbhZ0bG5z519F;
        Thu,  5 Nov 2020 16:06:54 +0800 (CST)
Received: from dggema707-chm.china.huawei.com (10.3.20.71) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Thu, 5 Nov 2020 16:06:59 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema707-chm.china.huawei.com (10.3.20.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 5 Nov 2020 16:06:58 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Thu, 5 Nov 2020 16:06:58 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Maxime Ripard <maxime@cerno.tech>
CC:     "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBtZWRpYTogY2VkcnVzOiBmaXggcmVmZXJl?=
 =?gb2312?B?bmNlIGxlYWsgaW4gY2VkcnVzX3N0YXJ0X3N0cmVhbWluZw==?=
Thread-Topic: [PATCH -next] media: cedrus: fix reference leak in
 cedrus_start_streaming
Thread-Index: AQHWsSMi4cifWjIJq02MoVkfrYwb0am3VdeAgAHb/4A=
Date:   Thu, 5 Nov 2020 08:06:58 +0000
Message-ID: <710479d756b14da591bb2342a1767242@huawei.com>
References: <20201102142622.140001-1-zhangqilong3@huawei.com>
 <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
 <2eb14a6d-4680-1527-0985-fd371e3ba2e8@xs4all.nl>
In-Reply-To: <2eb14a6d-4680-1527-0985-fd371e3ba2e8@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiAwMi8xMS8yMDIwIDE1OjE4LCBNYXhpbWUgUmlwYXJkIHdyb3RlOg0KPiA+IE9uIE1vbiwg
Tm92IDAyLCAyMDIwIGF0IDEwOjI2OjIyUE0gKzA4MDAsIFpoYW5nIFFpbG9uZyB3cm90ZToNCj4g
Pj4gcG1fcnVudGltZV9nZXRfc3luYyB3aWxsIGluY3JlbWVudCBwbSB1c2FnZSBjb3VudGVyIGV2
ZW4gaXQgZmFpbGVkLg0KPiA+PiBGb3JnZXR0aW5nIHRvIHBtX3J1bnRpbWVfcHV0X25vaWRsZSB3
aWxsIHJlc3VsdCBpbiByZWZlcmVuY2UgbGVhayBpbg0KPiA+PiBjZWRydXNfc3RhcnRfc3RyZWFt
aW5nLiBXZSBzaG91bGQgZml4IGl0Lg0KPiA+Pg0KPiA+PiBGaXhlczogZDVhZWNkMjg5YmFiZiAo
Im1lZGlhOiBjZWRydXM6IEltcGxlbWVudCBydW50aW1lIFBNIikNCj4gPj4gU2lnbmVkLW9mZi1i
eTogWmhhbmcgUWlsb25nIDx6aGFuZ3FpbG9uZzNAaHVhd2VpLmNvbT4NCj4gPg0KPiA+IFNob3Vs
ZG4ndCB3ZSBmaXggcG1fcnVudGltZV9nZXRfc3luYyBpbnN0ZWFkIHRoZW4/IEl0IHNlZW1zIHRo
YXQgbW9zdA0KPiA+IG9mIHRoZSBjYWxsZXJzIGdldCB0aGlzIHdyb25nLCBhbmQgdGhhdCdzIGRl
ZmluaXRlbHkgbm9uLW9idmlvdXMuDQo+IA0KPiBJdCdzIGJlZW4gZGlzY3Vzc2VkIGJlZm9yZSwg
YnV0IG5vYm9keSBzdGVwcGVkIHVwIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZS4gSW4gdGhlDQo+IGVu
ZCBJIGRlY2lkZWQgdG8ganVzdCBhY2NlcHQgbWVkaWEgcGF0Y2hlcyB0aGF0IGZpeCB0aGlzIGlu
IHRoZSBkcml2ZXJzIHJhdGhlcg0KPiB0aGFuIHdhaXRpbmcgZm9yIHNvbWUgbXl0aGljYWwgZnV0
dXJlIGNvcmUgZml4Lg0KPiANCj4gTm9yIGRvIEkgdGhpbmsgdGhhdCB5b3UgY2FuIGp1c3QgJ2Zp
eCcgcG1fcnVudGltZV9nZXRfc3luYywgc2luY2UgdGhlbiB5b3Ugd2lsbA0KPiBnZXQgY2FzZXMg
d2hlcmUgcG1fcnVudGltZV9wdXQgaXMgY2FsbGVkIG9uY2UgdG9vIG9mdGVuLg0KPg0KDQpUaGFu
a3MgZm9yIHlvdXIgbmljZSBjb21tZW50LCBpZiBhbnkgdXBkYXRlcyBvY2N1ciBhYm91dCBwbV9y
dW50aW1lX2dldF9zeW5jLCBJIHdpbGwgcGF5IGF0dGVudGlvbiB0byBpdC4NCg0KVGhhbmtzLCBi
ZXN0IHdpc2gsDQpaaGFuZyBRaWxvbmcNCg0KPiBSZWdhcmRzLA0KPiANCj4gCUhhbnMNCj4gDQo+
ID4NCj4gPiBNYXhpbWUNCj4gPg0KDQo=
