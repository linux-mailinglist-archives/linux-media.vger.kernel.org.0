Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2AD1EF183
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 08:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgFEGnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 02:43:51 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:26910 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725280AbgFEGnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 02:43:51 -0400
X-UUID: 998f3d8e1ac64702882897d42f807527-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2NIYixWsd8OlqvdqL7k42R4lVtIiWeWmPEs4+j5aw84=;
        b=scrmkA2Q1gMCLG7mO0qBnWOnetWhjs8WDqtJEw6LFgvy1UozYo+AzuZ0LIxN1EewXI+KKMfWxGT7uq0rVt8zZHbH6Su+V+9hxNZycBMFjDmJmbHkJpCMWeMbvJXam9SRxdmOLi5DDQItZKtZvKodhH5n1kYuL9WPH11O+z6Q8KI=;
X-UUID: 998f3d8e1ac64702882897d42f807527-20200605
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 971553996; Fri, 05 Jun 2020 14:43:38 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Jun
 2020 14:43:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 14:43:35 +0800
Message-ID: <1591339293.32607.1.camel@mhfsdcap03>
Subject: Re: [PATCH v8 10/14] media: platform: Delete redundant code for
 improving code quality
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
Date:   Fri, 5 Jun 2020 14:41:33 +0800
In-Reply-To: <20200521154958.GI209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-11-xia.jiang@mediatek.com>
         <20200521154958.GI209565@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F245DA40095EEB20DE8BBC128389585E3910708CD5A9103CE40F6172721A704B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE1OjQ5ICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gRnJpLCBBcHIgMDMsIDIwMjAgYXQgMDU6NDA6MjlQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiA+IERlbGV0ZSB1bnVzZWQgbWVtYmVyIHZhcmlhYmxlcyBhbm5v
dGF0aW9uLg0KPiA+IERlbGV0ZSB1bnVzZWQgdmFyaWFibGUgZGVmaW5pdGlvbi4NCj4gPiBEZWxl
dGUgcmVkdW5kYW50IGxvZyBwcmludCwgYmVjYXVzZSBWNEwyIGRlYnVnIGxvZ3MgYWxyZWFkeSBw
cmludCBpdC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0Bt
ZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdjg6IG5vIGNoYW5nZXMNCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxNiArKy0t
LS0tLS0tLS0tLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfY29yZS5oIHwgIDUgKysrLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDE2IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gu
IFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KPiA+IGluZGV4IDRlNjQwNDZh
Njg1NC4uOWU1OWI5YTUxZWYwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBAQCAtMTgyLDcgKzE4Miw2IEBAIHN0
YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0K
PiA+ICAJCQkJICAgc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LCBpbnQgcV90eXBlKQ0KPiA+ICB7
DQo+ID4gIAlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAqcGl4X21wID0gJmYtPmZtdC5w
aXhfbXA7DQo+ID4gLQlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVnOw0KPiA+
ICAJaW50IGk7DQo+ID4gIA0KPiA+ICAJbWVtc2V0KHBpeF9tcC0+cmVzZXJ2ZWQsIDAsIHNpemVv
ZihwaXhfbXAtPnJlc2VydmVkKSk7DQo+ID4gQEAgLTE5MCw3ICsxODksNyBAQCBzdGF0aWMgaW50
IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCj4gPiAgDQo+
ID4gIAlpZiAoY3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklUKSB7DQo+ID4gIAkJbXRrX2pwZWdf
YWRqdXN0X2ZtdF9tcGxhbmUoY3R4LCBmKTsNCj4gPiAtCQlnb3RvIGVuZDsNCj4gPiArCQlyZXR1
cm4gMDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAlwaXhfbXAtPm51bV9wbGFuZXMgPSBmbXQtPmNv
bHBsYW5lczsNCj4gPiBAQCAtMjEwLDcgKzIwOSw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5
X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KPiA+ICAJCXBmbXQtPnNpemVpbWFn
ZSA9IHJvdW5kX3VwKHBmbXQtPnNpemVpbWFnZSwgMTI4KTsNCj4gPiAgCQlpZiAocGZtdC0+c2l6
ZWltYWdlID09IDApDQo+ID4gIAkJCXBmbXQtPnNpemVpbWFnZSA9IE1US19KUEVHX0RFRkFVTFRf
U0laRUlNQUdFOw0KPiA+IC0JCWdvdG8gZW5kOw0KPiA+ICsJCXJldHVybiAwOw0KPiA+ICAJfQ0K
PiA+ICANCj4gPiAgCS8qIHR5cGUgaXMgTVRLX0pQRUdfRk1UX1RZUEVfQ0FQVFVSRSAqLw0KPiA+
IEBAIC0yMjQsMjAgKzIyMyw5IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUo
c3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KPiA+ICAJCXUzMiBzdHJpZGUgPSBwaXhfbXAtPndpZHRo
ICogZm10LT5oX3NhbXBsZVtpXSAvIDQ7DQo+ID4gIAkJdTMyIGggPSBwaXhfbXAtPmhlaWdodCAq
IGZtdC0+dl9zYW1wbGVbaV0gLyA0Ow0KPiA+ICANCj4gPiAtCQltZW1zZXQocGZtdC0+cmVzZXJ2
ZWQsIDAsIHNpemVvZihwZm10LT5yZXNlcnZlZCkpOw0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgbm90
IG1lbnRpb25lZCBpbiB0aGUgZGVzY3JpcHRpb24uIEknZCBzdWdnZXN0IG1vdmluZyBpdA0KPiB0
byBhIHNlcGFyYXRlIHBhdGNoLCBiZWNhdXNlIGl0J3MgYSBmdW5jdGlvbmFsIGNoYW5nZS4NCj4g
DQo+ID4gIAkJcGZtdC0+Ynl0ZXNwZXJsaW5lID0gc3RyaWRlOw0KPiA+ICAJCXBmbXQtPnNpemVp
bWFnZSA9IHN0cmlkZSAqIGg7DQo+ID4gIAl9DQo+ID4gLWVuZDoNCj4gPiAtCXY0bDJfZGJnKDIs
IGRlYnVnLCAmanBlZy0+djRsMl9kZXYsICJ3eGg6JXV4JXVcbiIsDQo+ID4gLQkJIHBpeF9tcC0+
d2lkdGgsIHBpeF9tcC0+aGVpZ2h0KTsNCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBwaXhfbXAtPm51
bV9wbGFuZXM7IGkrKykgew0KPiA+IC0JCXY0bDJfZGJnKDIsIGRlYnVnLCAmanBlZy0+djRsMl9k
ZXYsDQo+ID4gLQkJCSAicGxhbmVbJWRdIGJwbD0ldSwgc2l6ZT0ldVxuIiwNCj4gPiAtCQkJIGks
DQo+ID4gLQkJCSBwaXhfbXAtPnBsYW5lX2ZtdFtpXS5ieXRlc3BlcmxpbmUsDQo+ID4gLQkJCSBw
aXhfbXAtPnBsYW5lX2ZtdFtpXS5zaXplaW1hZ2UpOw0KPiA+IC0JfQ0KPiA+ICAJcmV0dXJuIDA7
DQo+ID4gIH0NCj4gPiAgDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19jb3JlLmgNCj4gPiBpbmRleCA2NGE3MzEyNjEyMTQuLjliYmQ2MTViMTA2NyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVn
X2NvcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfY29yZS5oDQo+ID4gQEAgLTMwLDYgKzMwLDkgQEANCj4gPiAgDQo+ID4gICNkZWZpbmUgTVRL
X0pQRUdfREVGQVVMVF9TSVpFSU1BR0UJKDEgKiAxMDI0ICogMTAyNCkNCj4gPiAgDQo+ID4gKy8q
Kg0KPiA+ICsgKiBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSAtIGNvbnRleCBzdGF0ZSBvZiBqcGVn
DQo+IA0KPiB0eXBvOiBzL2NvbnRleC9jb250ZXh0Lw0KPiANCj4gQnV0IEknZCByZXBocmFzZSBp
dCB0byAic3RhdGVzIG9mIHRoZSBjb250ZXh0IHN0YXRlIG1hY2hpbmUiLg0KPiANCj4gPiArICov
DQo+IA0KPiBOb3QgbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbi4gQWxzbywgdGhlIGRvY3Vt
ZW50YXRpb24gb2YgYW4gZW51bQ0KPiBzaG91bGQgaGF2ZSBkZXNjcmlwdGlvbnMgZm9yIHRoZSB2
YWx1ZXMuDQpEb25lLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

