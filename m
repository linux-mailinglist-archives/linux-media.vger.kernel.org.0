Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670F21EF17C
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 08:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgFEGnS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 02:43:18 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:17539 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725280AbgFEGnR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 02:43:17 -0400
X-UUID: 7f7f76b3478c47d188e95874d889eea5-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=82/gwfumID/oDEq9itix4sSuGV1n3vqDdEBL9hhAtBc=;
        b=I9HwEpM9lUYZOY+EBsFEW0vlf7DotszroqJKLhMSAaCr4mGgcJ5HObZGqttRx+JnyTv4TtwWj2opZKrw/2dys62pZMiNfnAQv7BI5iFoU1Eg5emTQmYmQX2sCrieZ0j+B3bVo6tWIek2heBYc/s6heeVCFIAaLM1cTKvEWPkcMk=;
X-UUID: 7f7f76b3478c47d188e95874d889eea5-20200605
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1082648919; Fri, 05 Jun 2020 14:43:08 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Jun
 2020 14:43:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 14:43:06 +0800
Message-ID: <1591339263.32607.0.camel@mhfsdcap03>
Subject: Re: [PATCH v8 07/14] media: platform: Use kernel native functions
 for improving code quality
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
Date:   Fri, 5 Jun 2020 14:41:03 +0800
In-Reply-To: <20200521154137.GG209565@chromium.org>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
         <20200403094033.8288-8-xia.jiang@mediatek.com>
         <20200521154137.GG209565@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D73C96593E44FF63D98051F58AC859BAAECFB308B2E0EFAE3235D87A954605152000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIwLTA1LTIxIGF0IDE1OjQxICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
SGkgWGlhLA0KPiANCj4gT24gRnJpLCBBcHIgMDMsIDIwMjAgYXQgMDU6NDA6MjZQTSArMDgwMCwg
WGlhIEppYW5nIHdyb3RlOg0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guIFBsZWFzZSBz
ZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiANCj4gbml0OiBJJ2QgcmVtb3ZlICJmb3IgaW1wcm92
aW5nIGNvZGUgcXVhbGl0eSIgZnJvbSB0aGUgc3ViamVjdCwgYXMgaXQncw0KPiBvYnZpb3VzIHRo
YXQgd2UgZG9uJ3QgaW50ZW5kIHRvIG1ha2UgdGhlIGNvZGUgcXVhbGl0eSB3b3JzZS4gOykNCj4g
T24gdGhlIGNvbnRyYXJ5LCBJJ2QgbWFrZSBpdCBtb3JlIHNwZWNpZmljLCBlLmcuDQo+IA0KPiBt
ZWRpYTogbXRrLWpwZWc6IFVzZSBnZW5lcmljIHJvdW5kaW5nIGhlbHBlcnMNCj4gDQo+IFdEWVQ/
DQpEb25lDQo+IA0KPiA+IFVzZSBjbGFtcCgpIHRvIHJlcGxhY2UgbXRrX2pwZWdfYm91bmRfYWxp
Z25faW1hZ2UoKSBhbmQgcm91bmQoKSB0bw0KPiA+IHJlcGxhY2UgbXRrX2pwZWdfYWxpZ24oKS4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5j
b20+DQo+ID4gLS0tDQo+ID4gdjg6IG5vIGNoYW5nZXMNCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlh
L3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgNDEgKysrKystLS0tLS0tLS0t
LS0tLQ0KPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oICAg
fCAgOCArKy0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdf
aHcuYyB8ICA4ICsrLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtf
anBlZ19ody5oIHwgIDUgLS0tDQo+ID4gIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KSwgNDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCj4gPiBpbmRleCAyZmEzNzExZmRjOWIuLjRlNjQw
NDZhNjg1NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5jDQo+ID4gQEAgLTE1NywyNSArMTU3LDYgQEAgc3RhdGljIHN0cnVj
dCBtdGtfanBlZ19mbXQgKm10a19qcGVnX2ZpbmRfZm9ybWF0KHN0cnVjdCBtdGtfanBlZ19jdHgg
KmN0eCwNCj4gPiAgCXJldHVybiBOVUxMOw0KPiA+ICB9DQo+ID4gIA0KPiA+IC1zdGF0aWMgdm9p
ZCBtdGtfanBlZ19ib3VuZF9hbGlnbl9pbWFnZSh1MzIgKncsIHVuc2lnbmVkIGludCB3bWluLA0K
PiA+IC0JCQkJICAgICAgIHVuc2lnbmVkIGludCB3bWF4LCB1bnNpZ25lZCBpbnQgd2FsaWduLA0K
PiA+IC0JCQkJICAgICAgIHUzMiAqaCwgdW5zaWduZWQgaW50IGhtaW4sDQo+ID4gLQkJCQkgICAg
ICAgdW5zaWduZWQgaW50IGhtYXgsIHVuc2lnbmVkIGludCBoYWxpZ24pDQo+ID4gLXsNCj4gPiAt
CWludCB3aWR0aCwgaGVpZ2h0LCB3X3N0ZXAsIGhfc3RlcDsNCj4gPiAtDQo+ID4gLQl3aWR0aCA9
ICp3Ow0KPiA+IC0JaGVpZ2h0ID0gKmg7DQo+ID4gLQl3X3N0ZXAgPSAxIDw8IHdhbGlnbjsNCj4g
PiAtCWhfc3RlcCA9IDEgPDwgaGFsaWduOw0KPiA+IC0NCj4gPiAtCXY0bF9ib3VuZF9hbGlnbl9p
bWFnZSh3LCB3bWluLCB3bWF4LCB3YWxpZ24sIGgsIGhtaW4sIGhtYXgsIGhhbGlnbiwgMCk7DQo+
ID4gLQlpZiAoKncgPCB3aWR0aCAmJiAoKncgKyB3X3N0ZXApIDw9IHdtYXgpDQo+ID4gLQkJKncg
Kz0gd19zdGVwOw0KPiA+IC0JaWYgKCpoIDwgaGVpZ2h0ICYmICgqaCArIGhfc3RlcCkgPD0gaG1h
eCkNCj4gPiAtCQkqaCArPSBoX3N0ZXA7DQo+ID4gLX0NCj4gPiAtDQo+ID4gIHN0YXRpYyB2b2lk
IG10a19qcGVnX2FkanVzdF9mbXRfbXBsYW5lKHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwNCj4g
PiAgCQkJCSAgICAgICBzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYpDQo+ID4gIHsNCj4gPiBAQCAtMjE4
LDI1ICsxOTksMjUgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X21wbGFuZShzdHJ1Y3Qg
djRsMl9mb3JtYXQgKmYsDQo+ID4gIAlpZiAocV90eXBlID09IE1US19KUEVHX0ZNVF9UWVBFX09V
VFBVVCkgew0KPiA+ICAJCXN0cnVjdCB2NGwyX3BsYW5lX3BpeF9mb3JtYXQgKnBmbXQgPSAmcGl4
X21wLT5wbGFuZV9mbXRbMF07DQo+ID4gIA0KPiA+IC0JCW10a19qcGVnX2JvdW5kX2FsaWduX2lt
YWdlKCZwaXhfbXAtPndpZHRoLCBNVEtfSlBFR19NSU5fV0lEVEgsDQo+ID4gLQkJCQkJICAgTVRL
X0pQRUdfTUFYX1dJRFRILCAwLA0KPiA+IC0JCQkJCSAgICZwaXhfbXAtPmhlaWdodCwgTVRLX0pQ
RUdfTUlOX0hFSUdIVCwNCj4gPiAtCQkJCQkgICBNVEtfSlBFR19NQVhfSEVJR0hULCAwKTsNCj4g
PiArCQlwaXhfbXAtPmhlaWdodCA9IGNsYW1wKHBpeF9tcC0+aGVpZ2h0LCBNVEtfSlBFR19NSU5f
SEVJR0hULA0KPiA+ICsJCQkJICAgICAgIE1US19KUEVHX01BWF9IRUlHSFQpOw0KPiA+ICsJCXBp
eF9tcC0+d2lkdGggPSBjbGFtcChwaXhfbXAtPndpZHRoLCBNVEtfSlBFR19NSU5fV0lEVEgsDQo+
ID4gKwkJCQkgICAgICBNVEtfSlBFR19NQVhfV0lEVEgpOw0KPiA+ICANCj4gPiAgCQltZW1zZXQo
cGZtdC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihwZm10LT5yZXNlcnZlZCkpOw0KPiA+ICAJCXBmbXQt
PmJ5dGVzcGVybGluZSA9IDA7DQo+ID4gIAkJLyogU291cmNlIHNpemUgbXVzdCBiZSBhbGlnbmVk
IHRvIDEyOCAqLw0KPiA+IC0JCXBmbXQtPnNpemVpbWFnZSA9IG10a19qcGVnX2FsaWduKHBmbXQt
PnNpemVpbWFnZSwgMTI4KTsNCj4gPiArCQlwZm10LT5zaXplaW1hZ2UgPSByb3VuZF91cChwZm10
LT5zaXplaW1hZ2UsIDEyOCk7DQo+ID4gIAkJaWYgKHBmbXQtPnNpemVpbWFnZSA9PSAwKQ0KPiA+
ICAJCQlwZm10LT5zaXplaW1hZ2UgPSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJTUFHRTsNCj4gPiAg
CQlnb3RvIGVuZDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gIAkvKiB0eXBlIGlzIE1US19KUEVHX0ZN
VF9UWVBFX0NBUFRVUkUgKi8NCj4gPiAtCW10a19qcGVnX2JvdW5kX2FsaWduX2ltYWdlKCZwaXhf
bXAtPndpZHRoLCBNVEtfSlBFR19NSU5fV0lEVEgsDQo+ID4gLQkJCQkgICBNVEtfSlBFR19NQVhf
V0lEVEgsIGZtdC0+aF9hbGlnbiwNCj4gPiAtCQkJCSAgICZwaXhfbXAtPmhlaWdodCwgTVRLX0pQ
RUdfTUlOX0hFSUdIVCwNCj4gPiAtCQkJCSAgIE1US19KUEVHX01BWF9IRUlHSFQsIGZtdC0+dl9h
bGlnbik7DQo+ID4gKwlwaXhfbXAtPmhlaWdodCA9IGNsYW1wKHJvdW5kX3VwKHBpeF9tcC0+aGVp
Z2h0LCBmbXQtPnZfYWxpZ24pLA0KPiA+ICsJCQkgICAgICAgTVRLX0pQRUdfTUlOX0hFSUdIVCwg
TVRLX0pQRUdfTUFYX0hFSUdIVCk7DQo+ID4gKwlwaXhfbXAtPndpZHRoID0gY2xhbXAocm91bmRf
dXAocGl4X21wLT53aWR0aCwgZm10LT5oX2FsaWduKSwNCj4gPiArCQkJICAgICAgTVRLX0pQRUdf
TUlOX1dJRFRILCBNVEtfSlBFR19NQVhfV0lEVEgpOw0KPiA+ICANCj4gPiAgCWZvciAoaSA9IDA7
IGkgPCBmbXQtPmNvbHBsYW5lczsgaSsrKSB7DQo+ID4gIAkJc3RydWN0IHY0bDJfcGxhbmVfcGl4
X2Zvcm1hdCAqcGZtdCA9ICZwaXhfbXAtPnBsYW5lX2ZtdFtpXTsNCj4gPiBAQCAtNzUxLDggKzcz
Miw4IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9kZWNfc3JjKHN0cnVjdCBtdGtfanBlZ19j
dHggKmN0eCwNCj4gPiAgew0KPiA+ICAJYnMtPnN0cl9hZGRyID0gdmIyX2RtYV9jb250aWdfcGxh
bmVfZG1hX2FkZHIoc3JjX2J1ZiwgMCk7DQo+ID4gIAlicy0+ZW5kX2FkZHIgPSBicy0+c3RyX2Fk
ZHIgKw0KPiA+IC0JCQkgbXRrX2pwZWdfYWxpZ24odmIyX2dldF9wbGFuZV9wYXlsb2FkKHNyY19i
dWYsIDApLCAxNik7DQo+ID4gLQlicy0+c2l6ZSA9IG10a19qcGVnX2FsaWduKHZiMl9wbGFuZV9z
aXplKHNyY19idWYsIDApLCAxMjgpOw0KPiA+ICsJCSAgICAgICByb3VuZF91cCh2YjJfZ2V0X3Bs
YW5lX3BheWxvYWQoc3JjX2J1ZiwgMCksIDE2KTsNCj4gPiArCWJzLT5zaXplID0gcm91bmRfdXAo
dmIyX3BsYW5lX3NpemUoc3JjX2J1ZiwgMCksIDEyOCk7DQo+ID4gIH0NCj4gPiAgDQo+ID4gIHN0
YXRpYyBpbnQgbXRrX2pwZWdfc2V0X2RlY19kc3Qoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVn
X2NvcmUuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5o
DQo+ID4gaW5kZXggOTk5YmQxNDI3ODA5Li4yOGU5YjMwYWQ1YzMgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCj4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KPiA+IEBA
IC0yMSwxMCArMjEsMTAgQEANCj4gPiAgI2RlZmluZSBNVEtfSlBFR19GTVRfVFlQRV9PVVRQVVQJ
MQ0KPiA+ICAjZGVmaW5lIE1US19KUEVHX0ZNVF9UWVBFX0NBUFRVUkUJMg0KPiA+ICANCj4gPiAt
I2RlZmluZSBNVEtfSlBFR19NSU5fV0lEVEgJMzINCj4gPiAtI2RlZmluZSBNVEtfSlBFR19NSU5f
SEVJR0hUCTMyDQo+ID4gLSNkZWZpbmUgTVRLX0pQRUdfTUFYX1dJRFRICTgxOTINCj4gPiAtI2Rl
ZmluZSBNVEtfSlBFR19NQVhfSEVJR0hUCTgxOTINCj4gPiArI2RlZmluZSBNVEtfSlBFR19NSU5f
V0lEVEgJMzJVDQo+ID4gKyNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkzMlUNCj4gPiArI2Rl
ZmluZSBNVEtfSlBFR19NQVhfV0lEVEgJODE5MlUNCj4gPiArI2RlZmluZSBNVEtfSlBFR19NQVhf
SEVJR0hUCTgxOTJVDQo+IA0KPiBUaGlzIGNoYW5nZSBpcyBub3QgbWVudGlvbmVkIGluIHRoZSBj
b21taXQgbWVzc2FnZS4gSXQgc2hvdWxkIGdvIHRvIGENCj4gc2VwYXJhdGUgcGF0Y2gsIHBvc3Np
Ymx5IG1lcmdlZCB3aXRoIG90aGVyIHJlYWxseSBtaW5vciBzdHlsaXN0aWMgY2hhbmdlcw0KPiBs
aWtlIHRoaXMsIGUuZy4gcGF0Y2ggMDgvMTQuDQpEb25lDQo+IA0KPiBPdGhlcndpc2UgdGhlIHBh
dGNoIGxvb2tzIGdvb2QsIHNvIGFmdGVyIGFkZHJlc3NpbmcgdGhlIGFib3ZlIG1pbm9yIGNoYW5n
ZXMNCj4gcGxlYXNlIGZlZWwgZnJlZSB0byBhZGQNCj4gDQo+IFJldmlld2VkLWJ5OiBUb21hc3og
RmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oN
Cj4gDQoNCg==

