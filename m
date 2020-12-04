Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5A02CE5EB
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 03:48:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgLDCrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 21:47:04 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:25004 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725847AbgLDCrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 21:47:04 -0500
X-UUID: 6638b150d4d6461e8fb3934bd011f25a-20201204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=HFCQ5ohxF0aLV8mEa0u/JoA63IqNHij1i7SP2mutPLU=;
        b=Opazqa7xIWUWg4IjFor2cnt6TLiWWwNsQiz62cT1opLdc1Gsrk0OH57dLd5bt6znyWqGFHrrik355TfT6HJ52STU7gtTOBd8vnDDuGXOMEjVQ93XZ8Nnf6RunUcW2UqHZvsdd0ULLLpfteDvaVIlWELgQ5hMO9+Kea+AOiorlfM=;
X-UUID: 6638b150d4d6461e8fb3934bd011f25a-20201204
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 948566401; Fri, 04 Dec 2020 10:46:15 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Dec
 2020 10:46:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Dec 2020 10:46:05 +0800
Message-ID: <1607049966.4733.189.camel@mhfsdcap03>
Subject: Re: media: i2c: add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Colin Ian King <colin.king@canonical.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <tfiga@google.com>, <sj.huang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Fri, 4 Dec 2020 10:46:06 +0800
In-Reply-To: <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
References: <9af089ea-2532-68ac-5d22-97a669ccec91@canonical.com>
         <CAHp75Ve7Sdf=Zy5N1LN_w22=YwPgWWR-FZtrQcAkOF=ViT2Kbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9D516F0823BDF1801AF36AFAB9F17DA8860BE715019026247D88428AAF69A9E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KT24gVGh1LCAyMDIwLTEyLTAzIGF0IDIwOjEwICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFRodSwgRGVjIDMsIDIwMjAgYXQgODowMyBQTSBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90ZToNCj4gDQo+ID4gU3RhdGljIGFu
YWx5c2lzIG9uIGxpbnV4LW5leHQgd2l0aCBDb3Zlcml0eSBoYXMgZGV0ZWN0ZWQgYW4gaXNzdWUg
d2l0aA0KPiA+IHRoZSBmb2xsb3dpbmcgY29tbWl0Og0KPiANCj4gSWYgeW91IHdhbnQgdG8gZml4
IGl0IHByb3Blcmx5LCBzZWUgbXkgY29tbWVudHMgYmVsb3cuLi4NCj4gDQo+ID4gNTI5IHN0YXRp
YyBpbnQgb3YwMmExMF9zX3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLCBpbnQgb24pDQo+
ID4gNTMwIHsNCj4gPiA1MzEgICAgICAgIHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwID0gdG9fb3Yw
MmExMChzZCk7DQo+ID4gNTMyICAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0NCj4g
PiB2NGwyX2dldF9zdWJkZXZkYXRhKCZvdjAyYTEwLT5zdWJkZXYpOw0KPiA+DQo+ID4gICAgMS4g
dmFyX2RlY2w6IERlY2xhcmluZyB2YXJpYWJsZSByZXQgd2l0aG91dCBpbml0aWFsaXplci4NCj4g
Pg0KPiA+IDUzMyAgICAgICAgaW50IHJldDsNCj4gPiA1MzQNCj4gPiA1MzUgICAgICAgIG11dGV4
X2xvY2soJm92MDJhMTAtPm11dGV4KTsNCj4gPiA1MzYNCj4gPg0KPiA+ICAgIDIuIENvbmRpdGlv
biBvdjAyYTEwLT5zdHJlYW1pbmcgPT0gb24sIHRha2luZyB0cnVlIGJyYW5jaC4NCj4gPg0KPiA+
IDUzNyAgICAgICAgaWYgKG92MDJhMTAtPnN0cmVhbWluZyA9PSBvbikNCj4gPg0KPiA+ICAgIDMu
IEp1bXBpbmcgdG8gbGFiZWwgdW5sb2NrX2FuZF9yZXR1cm4uDQo+ID4NCj4gPiA1MzggICAgICAg
ICAgICAgICAgZ290byB1bmxvY2tfYW5kX3JldHVybjsNCj4gPiA1MzkNCj4gPiA1NDAgICAgICAg
IGlmIChvbikgew0KPiA+IDU0MSAgICAgICAgICAgICAgICByZXQgPSBwbV9ydW50aW1lX2dldF9z
eW5jKCZjbGllbnQtPmRldik7DQo+ID4gNTQyICAgICAgICAgICAgICAgIGlmIChyZXQgPCAwKSB7
DQo+IA0KPiA+IDU0MyAgICAgICAgICAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfcHV0X25vaWRs
ZSgmY2xpZW50LT5kZXYpOw0KPiA+IDU0NCAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gdW5s
b2NrX2FuZF9yZXR1cm47DQo+IA0KPiBJbnN0ZWFkIG9mIHR3byBhYm92ZToNCg0KRnJvbSB0aGUg
ZG9jdW1lbnQsIHBtX3J1bnRpbWVfcHV0X25vaWRsZSBpcyB0byBkZWNyZWFzZSB0aGUgcnVudGlt
ZSBQTQ0KdXNhZ2UgY291bnRlciBvZiBhIGRldmljZSB1bmxlc3MgaXQgaXMgMCBhbHJlYWR5OyB3
aGlsZSBwbV9ydW50aW1lX3B1dA0Kd291bGQgYWRkaXRpb25hbGx5IHJ1biBwbV9yZXF1ZXN0X2lk
bGUgdG8gdHVybiBvZmYgdGhlIHBvd2VyIGlmIHVzYWdlDQpjb3VudGVyIGlzIHplcm8uDQoNClNv
IGhlcmUgbWF5YmUgd2UgY2FuIHJlYWxseSB1c2UgcG1fcnVudGltZV9wdXQgaW5zdGVhZCBvZg0K
cG1fcnVudGltZV9wdXRfbm9pZGxlLCBhbHRob3VnaCBpdCBzZWVtcyB0aGF0ICdwbV9ydW50aW1l
X2dldF9zeW5jJyBhbmQNCidwbV9ydW50aW1lX3B1dF9ub2lkbGUnIG9mdGVuIGFwcGVhciBpbiBw
YWlycy4NCg0KPiAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJyX3JwbV9wdXQ7DQo+IA0K
PiA+IDU0NSAgICAgICAgICAgICAgICB9DQo+ID4gNTQ2DQo+ID4gNTQ3ICAgICAgICAgICAgICAg
IHJldCA9IF9fb3YwMmExMF9zdGFydF9zdHJlYW0ob3YwMmExMCk7DQo+ID4gNTQ4ICAgICAgICAg
ICAgICAgIGlmIChyZXQpIHsNCj4gPiA1NDkgICAgICAgICAgICAgICAgICAgICAgICBfX292MDJh
MTBfc3RvcF9zdHJlYW0ob3YwMmExMCk7DQo+ID4gNTUwICAgICAgICAgICAgICAgICAgICAgICAg
b3YwMmExMC0+c3RyZWFtaW5nID0gIW9uOw0KPiA+IDU1MSAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gZXJyX3JwbV9wdXQ7DQo+ID4gNTUyICAgICAgICAgICAgICAgIH0NCj4gPiA1NTMgICAg
ICAgIH0gZWxzZSB7DQo+ID4gNTU0ICAgICAgICAgICAgICAgIF9fb3YwMmExMF9zdG9wX3N0cmVh
bShvdjAyYTEwKTsNCj4gPiA1NTUgICAgICAgICAgICAgICAgcG1fcnVudGltZV9wdXQoJmNsaWVu
dC0+ZGV2KTsNCj4gPiA1NTYgICAgICAgIH0NCj4gPiA1NTcNCj4gPiA1NTggICAgICAgIG92MDJh
MTAtPnN0cmVhbWluZyA9IG9uOw0KPiANCj4gKDEpDQo+IA0KPiA+IDU1OSAgICAgICAgbXV0ZXhf
dW5sb2NrKCZvdjAyYTEwLT5tdXRleCk7DQo+ID4gNTYwDQo+ID4gNTYxICAgICAgICByZXR1cm4g
MDsNCj4gPiA1NjINCj4gPiA1NjMgZXJyX3JwbV9wdXQ6DQo+ID4gNTY0ICAgICAgICBwbV9ydW50
aW1lX3B1dCgmY2xpZW50LT5kZXYpOw0KPiANCj4gPiA1NjUgdW5sb2NrX2FuZF9yZXR1cm46DQo+
IA0KPiBTaG91bGQgYmUgbW92ZWQgdG8gKDEpLg0KPiANCj4gPiA1NjYgICAgICAgIG11dGV4X3Vu
bG9jaygmb3YwMmExMC0+bXV0ZXgpOw0KPiA+IDU2Nw0KPiA+DQo+ID4gVW5pbml0aWFsaXplZCBz
Y2FsYXIgdmFyaWFibGUgKFVOSU5JVCkNCj4gPiAgICAgNC4gdW5pbml0X3VzZTogVXNpbmcgdW5p
bml0aWFsaXplZCB2YWx1ZSByZXQuDQo+ID4NCj4gPiA1NjggICAgICAgIHJldHVybiByZXQ7DQo+
ID4gNTY5IH0NCj4gPg0KPiA+IFZhcmlhYmxlIHJldCBoYXMgbm90IGJlZW4gaW5pdGlhbGl6ZWQs
IHNvIHRoZSBlcnJvciByZXR1cm4gdmFsdWUgaXMgYQ0KPiA+IGdhcmJhZ2UgdmFsdWUuIEl0IHNo
b3VsZCBiZSBpbml0aWFsaXplZCB3aXRoIHNvbWUgYXBwcm9wcmlhdGUgbmVnYXRpdmUNCj4gPiBl
cnJvciBjb2RlLCBvciByZXQgY291bGQgYmUgcmVtb3ZlZCBhbmQgdGhlIHJldHVybiBzaG91bGQg
cmV0dXJuIGENCj4gPiBsaXRlcmFsIHZhbHVlIG9mIGEgZXJyb3IgY29kZS4NCj4gPg0KPiA+IEkg
d2FzIHVuc3VyZSB3aGF0IHZhbHVlIGlzIGFwcHJvcHJpYXRlIHRvIGZpeCB0aGlzLCBzbyBpbnN0
ZWFkIEknbQ0KPiA+IHJlcG9ydGluZyB0aGlzIGlzc3VlLg0KPiANCg0K

