Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5D2CE591
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 03:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgLDCLP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 21:11:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60978 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726080AbgLDCLP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 21:11:15 -0500
X-UUID: e49db857a0f243ac81c8110829029f86-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3fEAzKsdz//maaMh1QCscTkvSeFpqqfoqta+RxuF5gc=;
        b=OoKsbKyWhVDSoBw1doGgdBnkBkfMquEWgSzfjCy7EwXBjj/zdk//q5U4sX5CTuf1xyhwBVn3PR9nRzNg0W/5lHPFxX3Sdx9Abwp4sSumzuOMDWMDi9KfXNcPpSRtXLHo6C62RIeCjbtZIWrQBhmz9zbfjA+WzdEu8hMY1HNzecE=;
X-UUID: e49db857a0f243ac81c8110829029f86-20201204
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1648836214; Fri, 04 Dec 2020 10:10:30 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Dec
 2020 10:10:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:10:27 +0800
Message-ID: <1607047828.4733.172.camel@mhfsdcap03>
Subject: Re: [PATCH] media: i2c: fix an uninitialized error code
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Arnd Bergmann <arnd@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <clang-built-linux@googlegroups.com>, <tfiga@google.com>,
        <sj.huang@mediatek.com>
Date:   Fri, 4 Dec 2020 10:10:28 +0800
In-Reply-To: <20201203222956.1091606-1-arnd@kernel.org>
References: <20201203222956.1091606-1-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQXJuZCwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCk9uIFRodSwgMjAyMC0xMi0wMyBh
dCAyMzoyOSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToNCj4gRnJvbTogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+IENsYW5nIHBvaW50cyBvdXQgdGhhdCB0aGUgZXJyb3Ig
aGFuZGxpbmcgaW4gb3YwMmExMF9zX3N0cmVhbSgpIGlzDQo+IGJyb2tlbiwgYW5kIGp1c3QgcmV0
dXJucyBhIHJhbmRvbSBlcnJvciBjb2RlOg0KPiANCj4gZHJpdmVycy9tZWRpYS9pMmMvb3YwMmEx
MC5jOjUzNzo2OiB3YXJuaW5nOiB2YXJpYWJsZSAncmV0JyBpcyB1c2VkIHVuaW5pdGlhbGl6ZWQg
d2hlbmV2ZXIgJ2lmJyBjb25kaXRpb24gaXMgdHJ1ZSBbLVdzb21ldGltZXMtdW5pbml0aWFsaXpl
ZF0NCj4gICAgICAgICBpZiAob3YwMmExMC0+c3RyZWFtaW5nID09IG9uKQ0KPiAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5j
OjU2ODo5OiBub3RlOiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQ0KPiAgICAgICAgIHJl
dHVybiByZXQ7DQo+ICAgICAgICAgICAgICAgIF5+fg0KPiBkcml2ZXJzL21lZGlhL2kyYy9vdjAy
YTEwLmM6NTM3OjI6IG5vdGU6IHJlbW92ZSB0aGUgJ2lmJyBpZiBpdHMgY29uZGl0aW9uIGlzIGFs
d2F5cyBmYWxzZQ0KPiAgICAgICAgIGlmIChvdjAyYTEwLT5zdHJlYW1pbmcgPT0gb24pDQo+ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVycy9tZWRpYS9pMmMv
b3YwMmExMC5jOjUzMzo5OiBub3RlOiBpbml0aWFsaXplIHRoZSB2YXJpYWJsZSAncmV0JyB0byBz
aWxlbmNlIHRoaXMgd2FybmluZw0KPiAgICAgICAgIGludCByZXQ7DQo+IA0KPiBJIGFzc3VtZSB0
aGF0IC1FQlVTWSBpcyB0aGUgaW50ZW5kZWQgZXJyb3IgY29kZSwgc28gdXNlIHRoYXQuDQo+IA0K
PiBGaXhlczogOTE4MDdlZmJlOGVjICgibWVkaWE6IGkyYzogYWRkIE9WMDJBMTAgaW1hZ2Ugc2Vu
c29yIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jIHwgNCArKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jIGIvZHJpdmVycy9tZWRpYS9pMmMv
b3YwMmExMC5jDQo+IGluZGV4IDM5MTcxODEzNmFkZS4uN2VlOWM5MDRkOWI1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9p
MmMvb3YwMmExMC5jDQo+IEBAIC01MzQsOCArNTM0LDEwIEBAIHN0YXRpYyBpbnQgb3YwMmExMF9z
X3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCBpbnQgb24pDQo+ICANCj4gIAltdXRleF9s
b2NrKCZvdjAyYTEwLT5tdXRleCk7DQo+ICANCj4gLQlpZiAob3YwMmExMC0+c3RyZWFtaW5nID09
IG9uKQ0KPiArCWlmIChvdjAyYTEwLT5zdHJlYW1pbmcgPT0gb24pIHsNCj4gKwkJcmV0ID0gLUVC
VVNZOw0KPiAgCQlnb3RvIHVubG9ja19hbmRfcmV0dXJuOw0KPiArCX0NCj4gIA0KPiAgCWlmIChv
bikgew0KPiAgCQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKCZjbGllbnQtPmRldik7DQoNCk9u
bHkgaWYgc2Vuc29yIGZhaWxzIHRvIHN0cmVhbSBvbiwgcmV0IGNhbiByZXR1cm4gYSBuZWdhdGl2
ZSBlcnJvciBjb2RlLg0KVGh1cyByZXQgYWJvdmUgbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZWQgdG8g
JzAnLg0KQWxzbyB5b3UgY291bGQgZml4IHRoZSBjbGFuZyBlcnJvciBsaWtlIHRoaXMuDQoNCnN0
YXRpYyBpbnQgb3YwMmExMF9zX3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCBpbnQgb24p
DQp7DQoJc3RydWN0IG92MDJhMTAgKm92MDJhMTAgPSB0b19vdjAyYTEwKHNkKTsNCgkuLi4NCglp
bnQgcmV0ID0gMDsNCg0KCS4uLg0KCWlmIChvdjAyYTEwLT5zdHJlYW1pbmcgPT0gb24pDQoJCWdv
dG8gdW5sb2NrX2FuZF9yZXR1cm47DQoNCgkuLi4NCn0NCg0K

