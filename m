Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3019E397E11
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 03:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhFBBeX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Jun 2021 21:34:23 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3499 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbhFBBeW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Jun 2021 21:34:22 -0400
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fvs026ZQwzYsPY;
        Wed,  2 Jun 2021 09:29:54 +0800 (CST)
Received: from dggeme760-chm.china.huawei.com (10.3.19.106) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 2 Jun 2021 09:32:38 +0800
Received: from dggeme760-chm.china.huawei.com ([10.6.80.70]) by
 dggeme760-chm.china.huawei.com ([10.6.80.70]) with mapi id 15.01.2176.012;
 Wed, 2 Jun 2021 09:32:39 +0800
From:   zhengyongjun <zhengyongjun3@huawei.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIC1uZXh0XSBtZWRpYTogYXRvbWlzcDogUmVtb3ZlIHVu?=
 =?gb2312?Q?needed_if-null-free_check?=
Thread-Topic: [PATCH -next] media: atomisp: Remove unneeded if-null-free check
Thread-Index: AQHXVu9Q97VgF0SyCkOeh4YsEDg3Kar+teYAgAE6dpA=
Date:   Wed, 2 Jun 2021 01:32:38 +0000
Message-ID: <9087d9398abf469f9f1ff30fcb608719@huawei.com>
References: <20210601142005.4132018-1-zhengyongjun3@huawei.com>
 <20210601144644.GB1955@kadam>
In-Reply-To: <20210601144644.GB1955@kadam>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.176.64]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhhbmtzIGZvciB5b3VyIGFkdmljZSwgSSBzZW5kIHBhdGNoIHYyIG5vdyA6KQ0KDQotLS0tLdPK
vP7Urbz+LS0tLS0NCreivP7IyzogRGFuIENhcnBlbnRlciBbbWFpbHRvOmRhbi5jYXJwZW50ZXJA
b3JhY2xlLmNvbV0gDQq3osvNyrG85DogMjAyMcTqNtTCMcjVIDIyOjQ3DQrK1bz+yMs6IHpoZW5n
eW9uZ2p1biA8emhlbmd5b25nanVuM0BodWF3ZWkuY29tPg0Ks63LzTogbWNoZWhhYkBrZXJuZWwu
b3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXN0YWdpbmdAbGlzdHMubGlu
dXguZGV2OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBzYWthcmkuYWlsdXNAbGludXgu
aW50ZWwuY29tOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZw0K1vfM4jogUmU6IFtQQVRDSCAt
bmV4dF0gbWVkaWE6IGF0b21pc3A6IFJlbW92ZSB1bm5lZWRlZCBpZi1udWxsLWZyZWUgY2hlY2sN
Cg0KT24gVHVlLCBKdW4gMDEsIDIwMjEgYXQgMTA6MjA6MDVQTSArMDgwMCwgWmhlbmcgWW9uZ2p1
biB3cm90ZToNCj4gRWxpbWluYXRlIHRoZSBmb2xsb3dpbmcgY29jY2ljaGVjayB3YXJuaW5nOg0K
PiANCj4gZHJpdmVycy9zdGFnaW5nL21lZGlhL2F0b21pc3AvcGNpL3NoX2Nzc19maXJtd2FyZS5j
OjM2OTo0LTEwOiBXQVJOSU5HOg0KPiBOVUxMIGNoZWNrIGJlZm9yZSBzb21lIGZyZWVpbmcgZnVu
Y3Rpb25zIGlzIG5vdCBuZWVkZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuZyBZb25nanVu
IDx6aGVuZ3lvbmdqdW4zQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9zdGFnaW5nL21l
ZGlhL2F0b21pc3AvcGNpL3NoX2Nzc19maXJtd2FyZS5jIHwgMyArLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2Zpcm13YXJlLmMgYi9kcml2
ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2Zpcm13YXJlLmMNCj4gaW5kZXgg
ZjRjZThhY2U5ZDUwLi45ODBmYzA5ZmNjOGIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9hdG9taXNwL3BjaS9zaF9jc3NfZmlybXdhcmUuYw0KPiArKysgYi9kcml2ZXJzL3N0
YWdpbmcvbWVkaWEvYXRvbWlzcC9wY2kvc2hfY3NzX2Zpcm13YXJlLmMNCj4gQEAgLTM2NSw4ICsz
NjUsNyBAQCB2b2lkIHNoX2Nzc191bmxvYWRfZmlybXdhcmUodm9pZCkNCj4gIAkJZm9yIChpID0g
MDsgaSA8IHNoX2Nzc19udW1fYmluYXJpZXM7IGkrKykgew0KPiAgCQkJaWYgKGZ3X21pbmlidWZm
ZXJbaV0ubmFtZSkNCj4gIAkJCQlrZnJlZSgodm9pZCAqKWZ3X21pbmlidWZmZXJbaV0ubmFtZSk7
DQoNCkNoYW5nZSB0aGlzIHRvby4NCg0KPiAtCQkJaWYgKGZ3X21pbmlidWZmZXJbaV0uYnVmZmVy
KQ0KPiAtCQkJCWt2ZnJlZShmd19taW5pYnVmZmVyW2ldLmJ1ZmZlcik7DQo+ICsJCQlrdmZyZWUo
ZndfbWluaWJ1ZmZlcltpXS5idWZmZXIpOw0KPiAgCQl9DQo+ICAJCWtmcmVlKGZ3X21pbmlidWZm
ZXIpOw0KPiAgCQlmd19taW5pYnVmZmVyID0gTlVMTDsNCg0KcmVnYXJkcywNCmRhbiBjYXJwZW50
ZXINCg==
