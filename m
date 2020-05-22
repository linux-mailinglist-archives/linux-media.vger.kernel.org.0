Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D601DDF9C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2020 08:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgEVGBu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 02:01:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57323 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726449AbgEVGBu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 02:01:50 -0400
X-UUID: d7731f636675426d94a1e4397e86684f-20200522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qqEHW95WdmSOAWr9riOJVXKketJrkFgXfouzxJOvWDQ=;
        b=etQwEyKNvFcEhO5WbLfBescJVRQXY9OrUTJ/OABaLscv6yz2Ne0sU9ZXyTJ+gHN+fHQVcJHa8hzdpHzI6TDay5aGngSxMuRb0nA7PVHS7HjgGbSBkhvCDnLidELWkVt6ezLbS0xhjFXTOzb9WCBgkXwsAoSwZjgzh0z9faPSba0=;
X-UUID: d7731f636675426d94a1e4397e86684f-20200522
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 842208596; Fri, 22 May 2020 14:01:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 14:01:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 May 2020 14:01:41 +0800
Message-ID: <1590127302.27807.3.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        <laurent.pinchart+renesas@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Date:   Fri, 22 May 2020 14:01:42 +0800
In-Reply-To: <20200521171101.GA243874@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
         <20200521171101.GA243874@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBUaHUsIDIwMjAtMDUtMjEgYXQgMTc6MTEgKzAwMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBIaSBKZXJyeSwNCj4gDQo+IE9uIFdlZCwgRGVjIDA0LCAyMDE5IGF0IDA4
OjQ3OjI5UE0gKzA4MDAsIEplcnJ5LWNoIENoZW4gd3JvdGU6DQo+ID4gRnJvbTogUGktSHN1biBT
aGloIDxwaWhzdW5AY2hyb21pdW0ub3JnPg0KPiA+IA0KPiA+IEFkZCB0d28gZnVuY3Rpb25zIHRo
YXQgY2FuIGJlIHVzZWQgdG8gc3RvcCBuZXcgam9icyBmcm9tIGJlaW5nIHF1ZXVlZCAvDQo+ID4g
Y29udGludWUgcnVubmluZyBxdWV1ZWQgam9iLiBUaGlzIGNhbiBiZSB1c2VkIHdoaWxlIGEgZHJp
dmVyIHVzaW5nIG0ybQ0KPiA+IGhlbHBlciBpcyBnb2luZyB0byBzdXNwZW5kIC8gd2FrZSB1cCBm
cm9tIHJlc3VtZSwgYW5kIGNhbiBlbnN1cmUgdGhhdA0KPiA+IHRoZXJlJ3Mgbm8gam9iIHJ1bm5p
bmcgaW4gc3VzcGVuZCBwcm9jZXNzLg0KPiA+IA0KPiA+IEJVRz1iOjE0MzA0NjgzMw0KPiA+IFRF
U1Q9YnVpbGQNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQaS1Ic3VuIFNoaWggPHBpaHN1bkBj
aHJvbWl1bS5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmVycnktY2ggQ2hlbiA8amVycnktY2gu
Y2hlbkBtZWRpYXRlay5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1tZW0ybWVtLmMgfCA0MCArKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ICBpbmNsdWRlL21lZGlhL3Y0bDItbWVtMm1lbS5oICAgICAgICAgICB8
IDIyICsrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygr
KQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLW1l
bTJtZW0uYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItbWVtMm1lbS5jDQo+ID4gaW5k
ZXggNWJiZGVjNTViN2Q3Li43NmJhMjAzZTAwMzUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9t
ZWRpYS92NGwyLWNvcmUvdjRsMi1tZW0ybWVtLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92NGwyLW1lbTJtZW0uYw0KPiA+IEBAIC00Nyw2ICs0NywxMCBAQCBtb2R1bGVfcGFy
YW0oZGVidWcsIGJvb2wsIDA2NDQpOw0KPiA+ICAjZGVmaW5lIFRSQU5TX0FCT1JUCQkoMSA8PCAy
KQ0KPiA+ICANCj4gPiAgDQo+ID4gKy8qIFRoZSBqb2IgcXVldWUgaXMgbm90IHJ1bm5pbmcgbmV3
IGpvYnMgKi8NCj4gPiArI2RlZmluZSBRVUVVRV9QQVVTRUQJCSgxIDw8IDApDQo+ID4gKw0KPiA+
ICsNCj4gPiAgLyogT2Zmc2V0IGJhc2UgZm9yIGJ1ZmZlcnMgb24gdGhlIGRlc3RpbmF0aW9uIHF1
ZXVlIC0gdXNlZCB0byBkaXN0aW5ndWlzaA0KPiA+ICAgKiBiZXR3ZWVuIHNvdXJjZSBhbmQgZGVz
dGluYXRpb24gYnVmZmVycyB3aGVuIG1tYXBwaW5nIC0gdGhleSByZWNlaXZlIHRoZSBzYW1lDQo+
ID4gICAqIG9mZnNldHMgYnV0IGZvciBkaWZmZXJlbnQgcXVldWVzICovDQo+ID4gQEAgLTg4LDYg
KzkyLDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBtMm1fZW50aXR5X25hbWVbXSA9IHsN
Cj4gPiAgICogQGpvYl9xdWV1ZToJCWluc3RhbmNlcyBxdWV1ZWQgdG8gcnVuDQo+ID4gICAqIEBq
b2Jfc3BpbmxvY2s6CXByb3RlY3RzIGpvYl9xdWV1ZQ0KPiA+ICAgKiBAam9iX3dvcms6CQl3b3Jr
ZXIgdG8gcnVuIHF1ZXVlZCBqb2JzLg0KPiA+ICsgKiBAam9iX3F1ZXVlX2ZsYWdzOglmbGFncyBv
ZiB0aGUgcXVldWUgc3RhdHVzLCAlUVVFVUVfUEFVU0VELg0KPiA+ICAgKiBAbTJtX29wczoJCWRy
aXZlciBjYWxsYmFja3MNCj4gPiAgICovDQo+ID4gIHN0cnVjdCB2NGwyX20ybV9kZXYgew0KPiA+
IEBAIC0xMDUsNiArMTEwLDcgQEAgc3RydWN0IHY0bDJfbTJtX2RldiB7DQo+ID4gIAlzdHJ1Y3Qg
bGlzdF9oZWFkCWpvYl9xdWV1ZTsNCj4gPiAgCXNwaW5sb2NrX3QJCWpvYl9zcGlubG9jazsNCj4g
PiAgCXN0cnVjdCB3b3JrX3N0cnVjdAlqb2Jfd29yazsNCj4gPiArCXVuc2lnbmVkIGxvbmcJCWpv
Yl9xdWV1ZV9mbGFnczsNCj4gPiAgDQo+ID4gIAljb25zdCBzdHJ1Y3QgdjRsMl9tMm1fb3BzICpt
Mm1fb3BzOw0KPiA+ICB9Ow0KPiA+IEBAIC0yNjcsNiArMjczLDEyIEBAIHN0YXRpYyB2b2lkIHY0
bDJfbTJtX3RyeV9ydW4oc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2RldikNCj4gPiAgCQlyZXR1
cm47DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJaWYgKG0ybV9kZXYtPmpvYl9xdWV1ZV9mbGFncyAm
IFFVRVVFX1BBVVNFRCkgew0KPiA+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm0ybV9kZXYt
PmpvYl9zcGlubG9jaywgZmxhZ3MpOw0KPiA+ICsJCWRwcmludGsoIlJ1bm5pbmcgbmV3IGpvYnMg
aXMgcGF1c2VkXG4iKTsNCj4gPiArCQlyZXR1cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJbTJt
X2Rldi0+Y3Vycl9jdHggPSBsaXN0X2ZpcnN0X2VudHJ5KCZtMm1fZGV2LT5qb2JfcXVldWUsDQo+
ID4gIAkJCQkgICBzdHJ1Y3QgdjRsMl9tMm1fY3R4LCBxdWV1ZSk7DQo+ID4gIAltMm1fZGV2LT5j
dXJyX2N0eC0+am9iX2ZsYWdzIHw9IFRSQU5TX1JVTk5JTkc7DQo+ID4gQEAgLTQ0Nyw2ICs0NTks
MzQgQEAgdm9pZCB2NGwyX20ybV9qb2JfZmluaXNoKHN0cnVjdCB2NGwyX20ybV9kZXYgKm0ybV9k
ZXYsDQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTCh2NGwyX20ybV9qb2JfZmluaXNoKTsNCj4g
PiAgDQo+ID4gK3ZvaWQgdjRsMl9tMm1fc3VzcGVuZChzdHJ1Y3QgdjRsMl9tMm1fZGV2ICptMm1f
ZGV2KQ0KPiA+ICt7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsJc3RydWN0IHY0
bDJfbTJtX2N0eCAqY3Vycl9jdHg7DQo+ID4gKw0KPiA+ICsJc3Bpbl9sb2NrX2lycXNhdmUoJm0y
bV9kZXYtPmpvYl9zcGlubG9jaywgZmxhZ3MpOw0KPiA+ICsJbTJtX2Rldi0+am9iX3F1ZXVlX2Zs
YWdzIHw9IFFVRVVFX1BBVVNFRDsNCj4gPiArCWN1cnJfY3R4ID0gbTJtX2Rldi0+Y3Vycl9jdHg7
DQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZtMm1fZGV2LT5qb2Jfc3BpbmxvY2ssIGZs
YWdzKTsNCj4gPiArDQo+ID4gKwlpZiAoY3Vycl9jdHgpDQo+ID4gKwkJd2FpdF9ldmVudChjdXJy
X2N0eC0+ZmluaXNoZWQsDQo+ID4gKwkJCSAgICEoY3Vycl9jdHgtPmpvYl9mbGFncyAmIFRSQU5T
X1JVTk5JTkcpKTsNCj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MKHY0bDJfbTJtX3N1c3BlbmQp
Ow0KPiA+ICsNCj4gPiArdm9pZCB2NGwyX20ybV9yZXN1bWUoc3RydWN0IHY0bDJfbTJtX2RldiAq
bTJtX2RldikNCj4gPiArew0KPiA+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiArDQo+ID4g
KwlzcGluX2xvY2tfaXJxc2F2ZSgmbTJtX2Rldi0+am9iX3NwaW5sb2NrLCBmbGFncyk7DQo+ID4g
KwltMm1fZGV2LT5qb2JfcXVldWVfZmxhZ3MgJj0gflFVRVVFX1BBVVNFRDsNCj4gPiArCXNwaW5f
dW5sb2NrX2lycXJlc3RvcmUoJm0ybV9kZXYtPmpvYl9zcGlubG9jaywgZmxhZ3MpOw0KPiA+ICsN
Cj4gPiArCXY0bDJfbTJtX3RyeV9ydW4obTJtX2Rldik7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZ
TUJPTCh2NGwyX20ybV9yZXN1bWUpOw0KPiA+ICsNCj4gPiAgaW50IHY0bDJfbTJtX3JlcWJ1ZnMo
c3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCB2NGwyX20ybV9jdHggKm0ybV9jdHgsDQo+ID4gIAkJ
ICAgICBzdHJ1Y3QgdjRsMl9yZXF1ZXN0YnVmZmVycyAqcmVxYnVmcykNCj4gPiAgew0KPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL21lZGlhL3Y0bDItbWVtMm1lbS5oIGIvaW5jbHVkZS9tZWRpYS92
NGwyLW1lbTJtZW0uaA0KPiA+IGluZGV4IDU0NjcyNjQ3NzFlYy4uMTE5YTE5NWRhMzkwIDEwMDY0
NA0KPiA+IC0tLSBhL2luY2x1ZGUvbWVkaWEvdjRsMi1tZW0ybWVtLmgNCj4gPiArKysgYi9pbmNs
dWRlL21lZGlhL3Y0bDItbWVtMm1lbS5oDQo+ID4gQEAgLTE4Myw2ICsxODMsMjggQEAgdjRsMl9t
Mm1fYnVmX2RvbmUoc3RydWN0IHZiMl92NGwyX2J1ZmZlciAqYnVmLCBlbnVtIHZiMl9idWZmZXJf
c3RhdGUgc3RhdGUpDQo+ID4gIAl2YjJfYnVmZmVyX2RvbmUoJmJ1Zi0+dmIyX2J1Ziwgc3RhdGUp
Ow0KPiA+ICB9DQo+ID4gIA0KPiA+ICsvKioNCj4gPiArICogdjRsMl9tMm1fc3VzcGVuZCgpIC0g
c3RvcCBuZXcgam9icyBmcm9tIGJlaW5nIHJ1biBhbmQgd2FpdCBmb3IgY3VycmVudCBqb2INCj4g
PiArICogdG8gZmluaXNoDQo+ID4gKyAqDQo+ID4gKyAqIEBtMm1fZGV2OiBvcGFxdWUgcG9pbnRl
ciB0byB0aGUgaW50ZXJuYWwgZGF0YSB0byBoYW5kbGUgTTJNIGNvbnRleHQNCj4gPiArICoNCj4g
PiArICogQ2FsbGVkIGJ5IGEgZHJpdmVyIGluIHRoZSBzdXNwZW5kIGhvb2suIFN0b3AgbmV3IGpv
YnMgZnJvbSBiZWluZyBydW4sIGFuZA0KPiA+ICsgKiB3YWl0IGZvciBjdXJyZW50IHJ1bm5pbmcg
am9iIHRvIGZpbmlzaC4NCj4gPiArICovDQo+ID4gK3ZvaWQgdjRsMl9tMm1fc3VzcGVuZChzdHJ1
Y3QgdjRsMl9tMm1fZGV2ICptMm1fZGV2KTsNCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiB2NGwy
X20ybV9yZXN1bWUoKSAtIHJlc3VtZSBqb2IgcnVubmluZyBhbmQgdHJ5IHRvIHJ1biBhIHF1ZXVl
ZCBqb2INCj4gPiArICoNCj4gPiArICogQG0ybV9kZXY6IG9wYXF1ZSBwb2ludGVyIHRvIHRoZSBp
bnRlcm5hbCBkYXRhIHRvIGhhbmRsZSBNMk0gY29udGV4dA0KPiA+ICsgKg0KPiA+ICsgKiBDYWxs
ZWQgYnkgYSBkcml2ZXIgaW4gdGhlIHJlc3VtZSBob29rLiBUaGlzIHJldmVydHMgdGhlIG9wZXJh
dGlvbiBvZg0KPiA+ICsgKiB2NGwyX20ybV9zdXNwZW5kKCkgYW5kIGFsbG93cyBqb2IgdG8gYmUg
cnVuLiBBbHNvIHRyeSB0byBydW4gYSBxdWV1ZWQgam9iIGlmDQo+ID4gKyAqIHRoZXJlIGlzIGFu
eS4NCj4gPiArICovDQo+ID4gK3ZvaWQgdjRsMl9tMm1fcmVzdW1lKHN0cnVjdCB2NGwyX20ybV9k
ZXYgKm0ybV9kZXYpOw0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAqIHY0bDJfbTJtX3JlcWJ1ZnMo
KSAtIG11bHRpLXF1ZXVlLWF3YXJlIFJFUUJVRlMgbXVsdGlwbGV4ZXINCj4gPiAgICoNCj4gPiAt
LSANCj4gPiAyLjE4LjANCj4gDQo+IFJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hy
b21pdW0ub3JnPg0KPiANCk9rLCBJJ3ZlIGFkZGVkIGl0IGluIHRoZSBjb21taXQgbWVzc2FnZS4N
Cg0KVGhhbmtzIGFuZCBCZXN0IHJlZ2FyZHMsDQpKZXJyeQ0KDQo+IFtDb3JyZWN0ZWQgSGFucydz
IGVtYWlsIGFkZHJlc3MuXQ0KPiBIYW5zLCBkb2VzIHRoaXMgbG9vayBnb29kIHRvIHlvdT8NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gVG9tYXN6DQo+IA0KDQo=

