Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1B91E3517
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 03:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgE0B57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 21:57:59 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:47631 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725271AbgE0B57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 21:57:59 -0400
X-UUID: 2d4d4ee9b12f44809e2b4bc452fe3a49-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZKrqKJ1L5uEpCnzzklpqeT5Qk2zFyQCkc/heYv9ITnM=;
        b=XUpTR3U9I2ql6YbBD1AN1sf+a1IszagSd55v/wuip50S9/YIF8rA9dVIwyETT7qsAB4UioxxjiJl2jorkFc3bTQscHdkOM5PYG3KJALZhcLw5rs7aCpEHTRlLV/5R55JuwVqICKGca09ozObWc59DmiNt3f5/kisqeSm05yxpfA=;
X-UUID: 2d4d4ee9b12f44809e2b4bc452fe3a49-20200527
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 938018215; Wed, 27 May 2020 09:57:51 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 27 May
 2020 09:53:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 09:53:45 +0800
Message-ID: <1590544320.12671.10.camel@mhfsdcap03>
Subject: Re: [PATCH v8 06/14] media: platform: Improve the implementation of
 the system PM ops
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>
Date:   Wed, 27 May 2020 09:52:00 +0800
In-Reply-To: <20200521153257.GF209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-7-xia.jiang@mediatek.com>
         <20200521153257.GF209565@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 31B56BA102CB296BF42975F3308432FBE35B5776613BCF49476A31BDC9D305D32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE1OjMyICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gRnJpLCBBcHIgMDMsIDIwMjAgYXQgMDU6NDA6MjVQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IENhbmNlbCByZXNldCBodyBvcGVyYXRpb24gaW4gc3VzcGVu
ZCBhbmQgcmVzdW1lIGZ1bmN0aW9uIGJlY2F1c2UgdGhpcw0KPiA+IHdpbGwgYmUgZG9uZSBpbiBk
ZXZpY2VfcnVuKCkuDQo+IA0KPiBUaGlzIGFuZC4uLg0KPiANCj4gPiBBZGQgc3Bpbl9sb2NrIGFu
ZCB1bmxvY2sgb3BlcmF0aW9uIGluIGlycSBhbmQgcmVzdW1lIGZ1bmN0aW9uIHRvIG1ha2UNCj4g
PiBzdXJlIHRoYXQgdGhlIGN1cnJlbnQgZnJhbWUgaXMgcHJvY2Vzc2VkIGNvbXBsZXRlbHkgYmVm
b3JlIHN1c3BlbmQuDQo+IA0KPiAuLi50aGlzIGFyZSB0d28gc2VwYXJhdGUgY2hhbmdlcy4gUGxl
YXNlIHNwbGl0Lg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5q
aWFuZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIHwgMTEgKysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IGluZGV4
IGRkNWNhZGQxMDFlZi4uMmZhMzcxMWZkYzliIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtOTExLDYgKzkx
MSw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBpcnEsIHZvaWQg
KnByaXYpDQo+ID4gIAl1MzIgZGVjX3JldDsNCj4gPiAgCWludCBpOw0KPiA+ICANCj4gPiArCXNw
aW5fbG9jaygmanBlZy0+aHdfbG9jayk7DQo+ID4gKw0KPiANCj4gbml0OiBGb3IgY29uc2lzdGVu
Y3ksIGl0IGlzIHJlY29tbWVuZGVkIHRvIGFsd2F5cyB1c2UgdGhlIHNhbWUsIGkuZS4gdGhlDQo+
IHN0cm9uZ2VzdCwgc3Bpbl8odW4pbG9ja18gcHJpbWl0aXZlcyB3aGVuIG9wZXJhdGluZyBvbiB0
aGUgc2FtZSBzcGlubG9jay4NCj4gSW4gdGhpcyBjYXNlIGl0IHdvdWxkIGJlIHRoZSBpcnFzYXZl
KHJlc3RvcmUpIHZhcmlhbnRzLg0KPiANCj4gPiAgCWRlY19yZXQgPSBtdGtfanBlZ19kZWNfZ2V0
X2ludF9zdGF0dXMoanBlZy0+ZGVjX3JlZ19iYXNlKTsNCj4gPiAgCWRlY19pcnFfcmV0ID0gbXRr
X2pwZWdfZGVjX2VudW1fcmVzdWx0KGRlY19yZXQpOw0KPiA+ICAJY3R4ID0gdjRsMl9tMm1fZ2V0
X2N1cnJfcHJpdihqcGVnLT5tMm1fZGV2KTsNCj4gPiBAQCAtOTQxLDYgKzk0Myw3IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBpcnEsIHZvaWQgKnByaXYpDQo+ID4g
IAl2NGwyX20ybV9idWZfZG9uZShzcmNfYnVmLCBidWZfc3RhdGUpOw0KPiA+ICAJdjRsMl9tMm1f
YnVmX2RvbmUoZHN0X2J1ZiwgYnVmX3N0YXRlKTsNCj4gPiAgCXY0bDJfbTJtX2pvYl9maW5pc2go
anBlZy0+bTJtX2RldiwgY3R4LT5maC5tMm1fY3R4KTsNCj4gPiArCXNwaW5fdW5sb2NrKCZqcGVn
LT5od19sb2NrKTsNCj4gPiAgCXBtX3J1bnRpbWVfcHV0X3N5bmMoY3R4LT5qcGVnLT5kZXYpOw0K
PiA+ICAJcmV0dXJuIElSUV9IQU5ETEVEOw0KPiA+ICB9DQo+ID4gQEAgLTExOTEsNyArMTE5NCw2
IEBAIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRrX2pwZWdfcG1fc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiAgDQo+ID4gLQltdGtfanBlZ19kZWNfcmVzZXQoanBl
Zy0+ZGVjX3JlZ19iYXNlKTsNCj4gPiAgCW10a19qcGVnX2Nsa19vZmYoanBlZyk7DQo+ID4gIA0K
PiA+ICAJcmV0dXJuIDA7DQo+ID4gQEAgLTEyMDIsMTkgKzEyMDQsMjQgQEAgc3RhdGljIF9fbWF5
YmVfdW51c2VkIGludCBtdGtfanBlZ19wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+
ICAJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiA+
ICANCj4gPiAgCW10a19qcGVnX2Nsa19vbihqcGVnKTsNCj4gPiAtCW10a19qcGVnX2RlY19yZXNl
dChqcGVnLT5kZWNfcmVnX2Jhc2UpOw0KPiA+ICANCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4gIA0KPiA+ICBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiA+ICB7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVn
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+
ICAJaW50IHJldDsNCj4gPiAgDQo+ID4gIAlpZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2KSkN
Cj4gPiAgCQlyZXR1cm4gMDsNCj4gPiAgDQo+ID4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmanBlZy0+
aHdfbG9jaywgZmxhZ3MpOw0KPiANCj4gV2hhdCBkb2VzIHRoaXMgc3BpbmxvY2sgcHJvdGVjdCB1
cyBmcm9tPyBJIGNhbiBzZWUgdGhhdCBpdCB3b3VsZCBwcmV2ZW50DQo+IHRoZSBpbnRlcnJ1cHQg
aGFuZGxlciBmcm9tIGJlaW5nIGNhbGxlZCwgYnV0IGlzIGl0IG9rYXkgdG8gc3VzcGVuZCB0aGUN
Cj4gc3lzdGVtIHdpdGhvdXQgaGFuZGxpbmcgdGhlIGludGVycnVwdD8NCkRlYXIgVG9tYXN6LA0K
SSBtZWFuIHRoYXQgaWYgY3VycmVudCBpbWFnZSBpcyBwcm9jZXNzZWQgaW4gaXJxIGhhbmRsZXIs
c3VzcGVuZA0KZnVuY3Rpb24gY2FuIG5vdCBnZXQgdGhlIGxvY2soaXQgd2FzIGxvY2tlZCBpbiBp
cnEgaGFuZGxlcikuU2hvdWxkIEkNCm1vdmUgdGhlIHNwaW5fbG9ja19pcnFzYXZlKCZqcGVnLT5o
d19sb2NrLCBmbGFncykgdG8gdGhlIHN0YXJ0IGxvY2F0aW9uDQpvZiBzdXNwZW5kIGZ1bmN0aW9u
IG9yIHVzZSB3YWl0X2V2ZW50X3RpbWVvdXQoKSB0byBoYW5kbGUgdGhlIGludGVycnVwdA0KYmVm
b3JlIHN1c3BlbmQ/DQoNCkJlc3QgUmVnYXJkcywNClhpYSBKaWFuZw0KPiANCj4gPiArDQo+ID4g
IAlyZXQgPSBtdGtfanBlZ19wbV9zdXNwZW5kKGRldik7DQo+ID4gKw0KPiANCj4gTG9va2luZyBh
dCB0aGUgaW1wbGVtZW50YXRpb24gb2YgbXRrX2pwZWdfcG1fc3VzcGVuZCgpLCBhbGwgaXQgZG9l
cyBpcw0KPiBkaXNhYmxpbmcgdGhlIGNsb2NrLiBIb3cgZG8gd2UgbWFrZSBzdXJlIHRoYXQgdGhl
cmUgaXMgbm8gZnJhbWUgY3VycmVudGx5DQo+IGJlaW5nIHByb2Nlc3NlZCBieSB0aGUgaGFyZHdh
cmU/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQo=

