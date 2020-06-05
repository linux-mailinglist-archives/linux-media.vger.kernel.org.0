Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1DA61EF126
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 08:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbgFEGFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 02:05:13 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:38939 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726044AbgFEGFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 02:05:13 -0400
X-UUID: b13683df1aa74d8aad688b4045fa9b7e-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NswnMBEYCB0ATqA+z8ftWgQH27FC9O8GRg7nuiNH9lw=;
        b=ZSzwOxeVGLQC7llW/m8kKGil0p405CRXv6I+Jnt87x1FcQ82xIa3bertIlbSbQ5BIJoss4Po7WE3XpSo++lUYqXueEkRpyyPj5mSnuzz+UbQkNgFMc3UVx+dDqAtTcdD21pKtK9FPuhq9HAd9PqUYGOMcHHFrz66GGj7qBfLCMY=;
X-UUID: b13683df1aa74d8aad688b4045fa9b7e-20200605
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1904687962; Fri, 05 Jun 2020 14:05:08 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Jun
 2020 14:05:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 14:05:04 +0800
Message-ID: <1591336981.31802.3.camel@mhfsdcap03>
Subject: Re: [PATCH v8 05/14] media: platform: Improve power on and power
 off flow
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
Date:   Fri, 5 Jun 2020 14:03:01 +0800
In-Reply-To: <20200521152253.GE209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-6-xia.jiang@mediatek.com>
         <20200521152253.GE209565@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D4D85237458B3F37009A20C7C482D59AA2A1276C3CD07436513B69A34E50B8692000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE1OjIyICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gRnJpLCBBcHIgMDMsIDIwMjAgYXQgMDU6NDA6MjRQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IENhbGwgcG1fcnVudGltZV9nZXRfc3luYygpIGJlZm9yZSBz
dGFydGluZyBhIGZyYW1lIGFuZCB0aGVuDQo+ID4gcG1fcnVudGltZV9wdXQoKSBhZnRlciBjb21w
bGV0aW5nIGl0LiBUaGlzIGNhbiBzYXZlIHBvd2VyIGZvciB0aGUgdGltZQ0KPiA+IGJldHdlZW4g
cHJvY2Vzc2luZyB0d28gZnJhbWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYSBKaWFu
ZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRm
b3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgMjcgKysrKystLS0tLS0tLS0tLS0tLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4g
PiANCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLiBQbGVhc2Ugc2VlIG15IGNvbW1lbnRz
IGlubGluZS4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMNCj4gPiBpbmRleCBhNTM2ZmE5NWIzZDYuLmRkNWNhZGQxMDFlZiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2Nv
cmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdf
Y29yZS5jDQo+ID4gQEAgLTcxMCwyMyArNzEwLDYgQEAgc3RhdGljIHN0cnVjdCB2YjJfdjRsMl9i
dWZmZXIgKm10a19qcGVnX2J1Zl9yZW1vdmUoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KPiA+
ICAJCXJldHVybiB2NGwyX20ybV9kc3RfYnVmX3JlbW92ZShjdHgtPmZoLm0ybV9jdHgpOw0KPiA+
ICB9DQo+ID4gIA0KPiA+IC1zdGF0aWMgaW50IG10a19qcGVnX3N0YXJ0X3N0cmVhbWluZyhzdHJ1
Y3QgdmIyX3F1ZXVlICpxLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+ID4gLXsNCj4gPiAtCXN0cnVj
dCBtdGtfanBlZ19jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYocSk7DQo+ID4gLQlzdHJ1Y3Qg
dmIyX3Y0bDJfYnVmZmVyICp2YjsNCj4gPiAtCWludCByZXQgPSAwOw0KPiA+IC0NCj4gPiAtCXJl
dCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoY3R4LT5qcGVnLT5kZXYpOw0KPiA+IC0JaWYgKHJldCA8
IDApDQo+ID4gLQkJZ290byBlcnI7DQo+ID4gLQ0KPiA+IC0JcmV0dXJuIDA7DQo+ID4gLWVycjoN
Cj4gPiAtCXdoaWxlICgodmIgPSBtdGtfanBlZ19idWZfcmVtb3ZlKGN0eCwgcS0+dHlwZSkpKQ0K
PiA+IC0JCXY0bDJfbTJtX2J1Zl9kb25lKHZiLCBWQjJfQlVGX1NUQVRFX1FVRVVFRCk7DQo+ID4g
LQlyZXR1cm4gcmV0Ow0KPiA+IC19DQo+ID4gLQ0KPiA+ICBzdGF0aWMgdm9pZCBtdGtfanBlZ19z
dG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KPiA+ICB7DQo+ID4gIAlzdHJ1Y3Qg
bXRrX2pwZWdfY3R4ICpjdHggPSB2YjJfZ2V0X2Rydl9wcml2KHEpOw0KPiA+IEBAIC03NTEsOCAr
NzM0LDYgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9x
dWV1ZSAqcSkNCj4gPiAgDQo+ID4gIAl3aGlsZSAoKHZiID0gbXRrX2pwZWdfYnVmX3JlbW92ZShj
dHgsIHEtPnR5cGUpKSkNCj4gPiAgCQl2NGwyX20ybV9idWZfZG9uZSh2YiwgVkIyX0JVRl9TVEFU
RV9FUlJPUik7DQo+ID4gLQ0KPiA+IC0JcG1fcnVudGltZV9wdXRfc3luYyhjdHgtPmpwZWctPmRl
dik7DQo+ID4gIH0NCj4gPiAgDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdmIyX29wcyBtdGtf
anBlZ19xb3BzID0gew0KPiA+IEBAIC03NjEsNyArNzQyLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2YjJfb3BzIG10a19qcGVnX3FvcHMgPSB7DQo+ID4gIAkuYnVmX3F1ZXVlICAgICAgICAgID0g
bXRrX2pwZWdfYnVmX3F1ZXVlLA0KPiA+ICAJLndhaXRfcHJlcGFyZSAgICAgICA9IHZiMl9vcHNf
d2FpdF9wcmVwYXJlLA0KPiA+ICAJLndhaXRfZmluaXNoICAgICAgICA9IHZiMl9vcHNfd2FpdF9m
aW5pc2gsDQo+ID4gLQkuc3RhcnRfc3RyZWFtaW5nICAgID0gbXRrX2pwZWdfc3RhcnRfc3RyZWFt
aW5nLA0KPiA+ICAJLnN0b3Bfc3RyZWFtaW5nICAgICA9IG10a19qcGVnX3N0b3Bfc3RyZWFtaW5n
LA0KPiA+ICB9Ow0KPiA+ICANCj4gPiBAQCAtODEyLDcgKzc5Miw3IEBAIHN0YXRpYyB2b2lkIG10
a19qcGVnX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gPiAgCXN0cnVjdCBtdGtfanBlZ19zcmNf
YnVmICpqcGVnX3NyY19idWY7DQo+ID4gIAlzdHJ1Y3QgbXRrX2pwZWdfYnMgYnM7DQo+ID4gIAlz
dHJ1Y3QgbXRrX2pwZWdfZmIgZmI7DQo+ID4gLQlpbnQgaTsNCj4gPiArCWludCBpLCByZXQ7DQo+
ID4gIA0KPiA+ICAJc3JjX2J1ZiA9IHY0bDJfbTJtX25leHRfc3JjX2J1ZihjdHgtPmZoLm0ybV9j
dHgpOw0KPiA+ICAJZHN0X2J1ZiA9IHY0bDJfbTJtX25leHRfZHN0X2J1ZihjdHgtPmZoLm0ybV9j
dHgpOw0KPiA+IEBAIC04MzIsNiArODEyLDEwIEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX2Rldmlj
ZV9ydW4odm9pZCAqcHJpdikNCj4gPiAgCQlyZXR1cm47DQo+ID4gIAl9DQo+ID4gIA0KPiA+ICsJ
cmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhqcGVnLT5kZXYpOw0KPiA+ICsJaWYgKHJldCA8IDAp
DQo+ID4gKwkJZ290byBkZWNfZW5kOw0KPiA+ICsNCj4gPiAgCW10a19qcGVnX3NldF9kZWNfc3Jj
KGN0eCwgJnNyY19idWYtPnZiMl9idWYsICZicyk7DQo+ID4gIAlpZiAobXRrX2pwZWdfc2V0X2Rl
Y19kc3QoY3R4LCAmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0sICZkc3RfYnVmLT52YjJfYnVmLCAm
ZmIpKQ0KPiA+ICAJCWdvdG8gZGVjX2VuZDsNCj4gPiBAQCAtOTU3LDYgKzk0MSw3IEBAIHN0YXRp
YyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBpcnEsIHZvaWQgKnByaXYpDQo+ID4g
IAl2NGwyX20ybV9idWZfZG9uZShzcmNfYnVmLCBidWZfc3RhdGUpOw0KPiA+ICAJdjRsMl9tMm1f
YnVmX2RvbmUoZHN0X2J1ZiwgYnVmX3N0YXRlKTsNCj4gPiAgCXY0bDJfbTJtX2pvYl9maW5pc2go
anBlZy0+bTJtX2RldiwgY3R4LT5maC5tMm1fY3R4KTsNCj4gPiArCXBtX3J1bnRpbWVfcHV0X3N5
bmMoY3R4LT5qcGVnLT5kZXYpOw0KPiANCj4gVGhlIF9zeW5jIHZhcmlhbnQgZXhwbGljaXRseSB3
YWl0cyB1bnRpbCB0aGUgYXN5bmNocm9ub3VzIFBNIG9wZXJhdGlvbg0KPiBjb21wbGV0ZXMuIFRo
aXMgaXMgdXN1YWxseSB1bmRlc2lyZWQsIGJlY2F1c2UgdGhlIENQVSBzdGF5cyBibG9ja2VkIGZv
cg0KPiBubyBnb29kIHJlYXNvbi4gSW4gdGhpcyBjb250ZXh0IGl0IGlzIGFjdHVhbGx5IGEgYnVn
LCBiZWNhdXNlIHRoaXMgaXMgYW4NCj4gaW50ZXJydXB0IGhhbmRsZXIgYW5kIGl0J3Mgbm90IGFs
bG93ZWQgdG8gc2xlZXAuIEkgd29uZGVyIHdoeSB0aGlzDQo+IGFjdHVhbGx5IGRpZG4ndCBjcmFz
aCBpbiB5b3VyIHRlc3RpbmcuIFBsZWFzZSBjaGFuZ2UgdG8gdGhlIHJlZ3VsYXINCj4gcG1fcnVu
dGltZV9wdXQoKS4NCkRvbmUuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQo=

