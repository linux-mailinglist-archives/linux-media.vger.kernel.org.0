Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201742A2D18
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 15:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgKBOjI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Nov 2020 09:39:08 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2361 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgKBOjH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Nov 2020 09:39:07 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CPwXR0wPTz50fK;
        Mon,  2 Nov 2020 22:39:03 +0800 (CST)
Received: from dggema707-chm.china.huawei.com (10.3.20.71) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 2 Nov 2020 22:39:05 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema707-chm.china.huawei.com (10.3.20.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 2 Nov 2020 22:39:04 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Mon, 2 Nov 2020 22:39:05 +0800
From:   zhangqilong <zhangqilong3@huawei.com>
To:     Maxime Ripard <maxime@cerno.tech>
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
Thread-Index: AQHWsSMi4cifWjIJq02MoVkfrYwb0am05h5w
Date:   Mon, 2 Nov 2020 14:39:04 +0000
Message-ID: <f9f6d225275b466b86591ecfdbffb86f@huawei.com>
References: <20201102142622.140001-1-zhangqilong3@huawei.com>
 <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
In-Reply-To: <20201102141838.7oicqkeqy7vy3ki3@gilmour.lan>
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

SGkNCg0KPiANCj4gT24gTW9uLCBOb3YgMDIsIDIwMjAgYXQgMTA6MjY6MjJQTSArMDgwMCwgWmhh
bmcgUWlsb25nIHdyb3RlOg0KPiA+IHBtX3J1bnRpbWVfZ2V0X3N5bmMgd2lsbCBpbmNyZW1lbnQg
cG0gdXNhZ2UgY291bnRlciBldmVuIGl0IGZhaWxlZC4NCj4gPiBGb3JnZXR0aW5nIHRvIHBtX3J1
bnRpbWVfcHV0X25vaWRsZSB3aWxsIHJlc3VsdCBpbiByZWZlcmVuY2UgbGVhayBpbg0KPiA+IGNl
ZHJ1c19zdGFydF9zdHJlYW1pbmcuIFdlIHNob3VsZCBmaXggaXQuDQo+ID4NCj4gPiBGaXhlczog
ZDVhZWNkMjg5YmFiZiAoIm1lZGlhOiBjZWRydXM6IEltcGxlbWVudCBydW50aW1lIFBNIikNCj4g
PiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBRaWxvbmcgPHpoYW5ncWlsb25nM0BodWF3ZWkuY29tPg0K
PiANCj4gU2hvdWxkbid0IHdlIGZpeCBwbV9ydW50aW1lX2dldF9zeW5jIGluc3RlYWQgdGhlbj8g
SXQgc2VlbXMgdGhhdCBtb3N0IG9mIHRoZQ0KPiBjYWxsZXJzIGdldCB0aGlzIHdyb25nLCBhbmQg
dGhhdCdzIGRlZmluaXRlbHkgbm9uLW9idmlvdXMuDQo+DQoNCiANCkkgaGF2ZSBldmVyIHRob3Vn
aHQgdG8gZml4IGZpeCBwbV9ydW50aW1lX2dldF9zeW5jLCB0aGVuIEkgd2VudCB0byByZWFkIHRo
ZSBjb21tZW50IG9uIHRoaXMgZnVuY3Rpb24sIGFuZCBmb3VuZCB0aGF0IHRoaXMgaXMgd2hhdCB0
aGUgYXV0aG9yIGludGVuZGVkIHRvIGRvKGNvbW1lbnQ6IFRoZSBwb3NzaWJsZSByZXR1cm4gdmFs
dWVzIG9mIHRoaXMgZnVuY3Rpb24gYXJlIHRoZSBzYW1lIGFzIGZvciBwbV9ydW50aW1lX3Jlc3Vt
ZSgpIGFuZCB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudGVyIG9mIEBkZXYgcmVtYWlucyBpbmNy
ZW1lbnRlZCBpbiBhbGwgY2FzZXMsIGV2ZW4gaWYgaXQgcmV0dXJucyBhbiBlcnJvciBjb2RlKS4g
T24gdGhlIG90aGVyIGhhbmQsIEkgZm91bmQgdGhhdCB0aGUgbnVtYmVyIG9mIGNhbGxlcnMgdGhh
dCBnZXR0aW5nIHRoaXMgcmlnaHQgaXMgbXVjaCBiaWdnZXIgdGhhbiBnZXR0aW5nIHRoaXMgd3Jv
bmcgZXZlbiBtYW55IGNhbGxlcnMgZ2V0IHdyb25nLiBTbyBJIHN1Ym1pdCBzZXJ2ZXIgcGF0Y2hl
cyB0byBmaXggdGhlbSBhcyBJIGNvdWxkLg0KDQpUaGFua3MsIGJlc3Qgd2lzaCENCg0KWmhhbmcg
UWlsb25nDQogDQo+IE1heGltZQ0K
