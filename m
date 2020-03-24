Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7BA9190E36
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 13:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727376AbgCXM42 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 08:56:28 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:64730 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727083AbgCXM41 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 08:56:27 -0400
X-UUID: aaa37f338d034e6f9b6edf6c6c0c9f71-20200324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ik4urh0s9/sTZNn7i7tAqN7eathzuR+7EqLI9vueugY=;
        b=fu+Yy7CI4h1f5rxfvRKCQ5QJ5dfNiAccwbs5lldVLq3gsoF3Cs3kXaTjE/w5ViQnMQFA8jYCnYMGqX6DpKAgJjtuATgFiewPB3wbxu/QogHhJmSGXom7fTSPGM0qlJjGAOHd1urNQJrgPA1YnZikwpj5qs2k9hqMPS7G8vWbh9w=;
X-UUID: aaa37f338d034e6f9b6edf6c6c0c9f71-20200324
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 412146991; Tue, 24 Mar 2020 20:56:18 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 24 Mar
 2020 20:56:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Mar 2020 20:56:16 +0800
Message-ID: <1585054582.6276.24.camel@mhfsdcap03>
Subject: Re: [PATCH] media: mtk-vpu: load vpu firmware from the new location
From:   gtk_ruiwang <gtk_ruiwang@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Tomasz Figa" <tfiga@chromium.org>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>,
        Sj Huang <sj.huang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <srv_heupstream@mediatek.com>
Date:   Tue, 24 Mar 2020 20:56:22 +0800
In-Reply-To: <396021fd-ec2e-1ec1-602e-08b9393c5ae9@xs4all.nl>
References: <20200322075745.6133-1-gtk_ruiwang@mediatek.com>
         <396021fd-ec2e-1ec1-602e-08b9393c5ae9@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C39E2D690E3AA5905C6E84713D6ABD87D4D1C41A2322D8E148CE3102567C89072000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBIYW5zLA0KDQpQYXRjaCBWMiBoYXMgc2VudCwgdGhhbmtzIGEgbG90Lg0KDQpTaW5jZXJl
bHkgUmVnYXJkcw0KDQpPbiBUdWUsIDIwMjAtMDMtMjQgYXQgMTM6MjAgKzAxMDAsIEhhbnMgVmVy
a3VpbCB3cm90ZToNCj4gT24gMy8yMi8yMCA4OjU3IEFNLCBndGtfcnVpd2FuZ0BtZWRpYXRlay5j
b20gd3JvdGU6DQo+ID4gRnJvbTogZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiANCj4gPiBtdDgxNzMgVlBVIGZpcm13YXJlIGhhcyBiZWVuIG1vdmVkIHRvIGEgc3Vi
LWZvbGRlciBvZg0KPiA+IGxpbnV4LWZpcm13YXJlLCBzbyBsb2FkIHZwdS1mdyBmcm9tIHRoZSBu
ZXcgbG9jYXRpb24gZmlyc3QsDQo+ID4gaWYgaXQgZmFpbHMsIHRoZW4gZnJvbSB0aGUgb2xkIG9u
ZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBSdWkgV2FuZyA8Z3RrX3J1aXdhbmdAbWVkaWF0
ZWsuY29tPg0KPiANCj4gSG1tLCBJJ20gZ2V0dGluZyB0aGlzIGZyb20gY2hlY2twYXRjaC5wbCAt
LXN0cmljdDoNCj4gDQo+IFdBUk5JTkc6IE1pc3NpbmcgU2lnbmVkLW9mZi1ieTogbGluZSBieSBu
b21pbmFsIHBhdGNoIGF1dGhvciAnZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNv
bT4nDQo+IA0KPiBSYXRoZXIgdGhhbiBzZW5kaW5nIHRoaXMgZnJvbSAnZ3RrX3J1aXdhbmdAbWVk
aWF0ZWsuY29tJywgY2FuIHlvdSBzZW5kIHRoaXMgZnJvbQ0KPiAnUnVpIFdhbmcgPGd0a19ydWl3
YW5nQG1lZGlhdGVrLmNvbT4nPw0KPiANCj4gVGhlbiB0aGUgdHdvIGFyZSB0aGUgc2FtZS4NCj4g
DQo+IFJlZ2FyZHMsDQo+IA0KPiAJSGFucw0KPiANCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYyB8IDE2ICsrKysrKysrKysrKystLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQo+ID4gaW5kZXggYTc2
ODcwN2FiYjk0Li44OTI3NDg0MmUwN2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdnB1L210a192cHUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZwdS9tdGtfdnB1LmMNCj4gPiBAQCAtNDYsNiArNDYsOCBAQA0KPiA+ICAvKiBiaW5h
cnkgZmlybXdhcmUgbmFtZSAqLw0KPiA+ICAjZGVmaW5lIFZQVV9QX0ZXCQkidnB1X3AuYmluIg0K
PiA+ICAjZGVmaW5lIFZQVV9EX0ZXCQkidnB1X2QuYmluIg0KPiA+ICsjZGVmaW5lIFZQVV9QX0ZX
X05FVwkJIm1lZGlhdGVrL210ODE3My92cHVfcC5iaW4iDQo+ID4gKyNkZWZpbmUgVlBVX0RfRldf
TkVXCQkibWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbiINCj4gPiAgDQo+ID4gICNkZWZpbmUgVlBV
X1JFU0VUCQkweDANCj4gPiAgI2RlZmluZSBWUFVfVENNX0NGRwkJMHgwMDA4DQo+ID4gQEAgLTQ3
NywxNiArNDc5LDI0IEBAIHN0YXRpYyBpbnQgbG9hZF9yZXF1ZXN0ZWRfdnB1KHN0cnVjdCBtdGtf
dnB1ICp2cHUsDQo+ID4gIAlzaXplX3QgdGNtX3NpemUgPSBmd190eXBlID8gVlBVX0RUQ01fU0la
RSA6IFZQVV9QVENNX1NJWkU7DQo+ID4gIAlzaXplX3QgZndfc2l6ZSA9IGZ3X3R5cGUgPyBWUFVf
RF9GV19TSVpFIDogVlBVX1BfRldfU0laRTsNCj4gPiAgCWNoYXIgKmZ3X25hbWUgPSBmd190eXBl
ID8gVlBVX0RfRlcgOiBWUFVfUF9GVzsNCj4gPiArCWNoYXIgKmZ3X25ld19uYW1lID0gZndfdHlw
ZSA/IFZQVV9EX0ZXX05FVyA6IFZQVV9QX0ZXX05FVzsNCj4gPiAgCWNvbnN0IHN0cnVjdCBmaXJt
d2FyZSAqdnB1X2Z3Ow0KPiA+ICAJc2l6ZV90IGRsX3NpemUgPSAwOw0KPiA+ICAJc2l6ZV90IGV4
dHJhX2Z3X3NpemUgPSAwOw0KPiA+ICAJdm9pZCAqZGVzdDsNCj4gPiAgCWludCByZXQ7DQo+ID4g
IA0KPiA+IC0JcmV0ID0gcmVxdWVzdF9maXJtd2FyZSgmdnB1X2Z3LCBmd19uYW1lLCB2cHUtPmRl
dik7DQo+ID4gKwlyZXQgPSByZXF1ZXN0X2Zpcm13YXJlKCZ2cHVfZncsIGZ3X25ld19uYW1lLCB2
cHUtPmRldik7DQo+ID4gIAlpZiAocmV0IDwgMCkgew0KPiA+IC0JCWRldl9lcnIodnB1LT5kZXYs
ICJGYWlsZWQgdG8gbG9hZCAlcywgJWRcbiIsIGZ3X25hbWUsIHJldCk7DQo+ID4gLQkJcmV0dXJu
IHJldDsNCj4gPiArCQlkZXZfaW5mbyh2cHUtPmRldiwgIkZhaWxlZCB0byBsb2FkICVzLCAlZCwg
cmV0cnlcbiIsDQo+ID4gKwkJCSBmd19uZXdfbmFtZSwgcmV0KTsNCj4gPiArDQo+ID4gKwkJcmV0
ID0gcmVxdWVzdF9maXJtd2FyZSgmdnB1X2Z3LCBmd19uYW1lLCB2cHUtPmRldik7DQo+ID4gKwkJ
aWYgKHJldCA8IDApIHsNCj4gPiArCQkJZGV2X2Vycih2cHUtPmRldiwgIkZhaWxlZCB0byBsb2Fk
ICVzLCAlZFxuIiwgZndfbmFtZSwNCj4gPiArCQkJCXJldCk7DQo+ID4gKwkJCXJldHVybiByZXQ7
DQo+ID4gKwkJfQ0KPiA+ICAJfQ0KPiA+ICAJZGxfc2l6ZSA9IHZwdV9mdy0+c2l6ZTsNCj4gPiAg
CWlmIChkbF9zaXplID4gZndfc2l6ZSkgew0KPiA+IA0KPiANCg0K

