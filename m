Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDC692046CB
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 03:37:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731901AbgFWBh1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Jun 2020 21:37:27 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:12245 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731572AbgFWBh1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Jun 2020 21:37:27 -0400
X-UUID: 09a3328321a54370926e745d114ee3eb-20200623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=PZ3UxSDpfsyJjXz23t/9wtrOnlcfsnPTfC2LpWoJmRc=;
        b=njUFqE4b06tBEs4WbBcb5Bst+MkO/7tFPtAC8syjbnG8DvrwIDuPxvxYRJuZKfG7cfkMq/T1izSrJEh5/kqmuzrn+yZ4IkUY1ymjwN0x0mKqi1AEGVusugUEGhGRJRvx58oPNeF5DIN1wCMw0OjdNfelxCzUK8K/NC3dUnZmGdk=;
X-UUID: 09a3328321a54370926e745d114ee3eb-20200623
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <tiffany.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1553650846; Tue, 23 Jun 2020 09:37:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Jun 2020 09:37:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Jun 2020 09:37:15 +0800
Message-ID: <1592876241.26708.12.camel@mtksdaap41>
Subject: Re: [PATCH 07/10] media: mtk-vcodec: venc: remove redundant code
From:   Tiffany Lin <tiffany.lin@mediatek.com>
To:     Alexandre Courbot <acourbot@chromium.org>
CC:     Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        "Pi-Hsun Shih" <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Date:   Tue, 23 Jun 2020 09:37:21 +0800
In-Reply-To: <CAPBb6MUiGtbBhfEoCVeTkQe1XrDea7wRUkybxtqQEThtQmJTwQ@mail.gmail.com>
References: <20200520082723.96136-1-acourbot@chromium.org>
         <20200520082723.96136-8-acourbot@chromium.org>
         <1592549952.23952.3.camel@mtksdaap41>
         <CAPBb6MUiGtbBhfEoCVeTkQe1XrDea7wRUkybxtqQEThtQmJTwQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AAE59E2DA6440C50517C42E801390EA0EB45C6E2C97EF65B6E99541C73A499F12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIwLTA2LTIyIGF0IDIyOjEwICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gT24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMzo1OSBQTSBUaWZmYW55IExpbiA8dGlmZmFu
eS5saW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgMjAyMC0wNS0yMCBh
dCAxNzoyNyArMDkwMCwgQWxleGFuZHJlIENvdXJib3Qgd3JvdGU6DQo+ID4gPiB2aWRpb2NfdHJ5
X2ZtdCgpIGRvZXMgY2xhbXAgaGVpZ2h0IGFuZCB3aWR0aCB3aGVuIGNhbGxlZCBvbiB0aGUgT1VU
UFVUDQo+ID4gPiBxdWV1ZSwgc28gY2xhbXBpbmcgdGhlbSBwcmlvciB0byBjYWxsaW5nIHRoaXMg
ZnVuY3Rpb24gaXMgcmVkdW5kYW50LiBTZXQNCj4gPiA+IHRoZSBxdWV1ZSdzIHBhcmFtZXRlcnMg
YWZ0ZXIgY2FsbGluZyB2aWRpb2NfdHJ5X2ZtdCgpIHNvIHdlIGNhbiB1c2UgdGhlDQo+ID4gPiB2
YWx1ZXMgaXQgY29tcHV0ZWQuDQo+ID4gPg0KPiA+DQo+ID4gdmlkaW9jX3RyeV9mbXQgY2xhbXBz
IGhlaWdodCBhbmQgd2lkdGggb25seSB3aGVuIGYtPnR5cGUgPT0NCj4gPiBWNEwyX0JVRl9UWVBF
X1ZJREVPX09VVFBVVF9NUExBTkUNCj4gPg0KPiA+IERvZXMgdGhpcyBjbGVhbnVwIHBhc3MgdjRs
MiBjb21wbGlhbmNlIHRlc3Q/DQo+IA0KPiBJdCBkb2Vzbid0IHJlc3VsdCBpbiBtb3JlIHRlc3Rz
IGZhaWxpbmcgYXQgbGVhc3QuIDopIEJ1dCBhbHRob3VnaCBJDQo+IGNhbm5vdCB0ZXN0IHdpdGgg
YSBwcmlzdGluZSB1cHN0cmVhbSB2ZXJzaW9uLCBpdCBzZWVtcyBsaWtlIHNvbWUgdGVzdHMNCj4g
YXJlIG5vdCBwYXNzaW5nIHRvIGJlZ2luIHdpdGguIElmIHlvdSBoYXZlIGRpZmZlcmVudCByZXN1
bHRzIHdpdGggYQ0KPiB0cnVlIHVwc3RyZWFtIEkgd291bGQgbGlrZSB0byBoZWFyIGFib3V0IGl0
LiBPdGhlcndpc2UgSSBhbSB3aWxsaW5nIHRvDQo+IGhlbHAgd2l0aCBnZXR0aW5nIGFsbCB0aGUg
dGVzdHMgaW4gdGhlIGdyZWVuLg0KPiANCj4gUmVnYXJkaW5nIHRoaXMgcGFydGljdWxhciBwYXRj
aCwgeW91IGFyZSByaWdodCB0aGF0IHdlIG1heSBlbmQgdXANCj4gd3JpdGluZyBhbiB1bmNsYW1w
ZWQgc2l6ZSBpbiBxX2RhdGEuIEl0J3MgcHJvYmFibHkgYmV0dGVyIHRvIGRyb3AgaXQNCj4gZm9y
IG5vdy4NCj4gDQpJIGRpZCBhdHRhY2ggY29tcGxpYW5jZSB0ZXN0cyByZXN1bHRzIHdoZW4gSSB1
cHN0cmVhbSBmaXJzdCB2ZXJzaW9uLg0KSXQncyBob3cgbWFpbnRhaW5lciBtYWtlIHN1cmUgYWxs
IHY0bDIgZHJpdmVyIGltcGxlbWVudCBpbnRlcmZhY2VzIHRoZQ0Kc2FtZSB3YXkuDQpBbmQgYnkg
ZG9pbmcgdGhpcyBhdXRvbWF0aWNhbGx5IGluc3RlYWQgcmV2aWV3IGZsb3cgdG8gbWFrZSBzdXJl
IGl0IG1lZXQNCmludGVyZmFjZXMgc3BlYy4NCg0KDQo+ID4gSSByZWNhbGwgY29tcGxpYW5jZSB0
ZXN0IHdpbGwgdHJ5IGRpZmZlcmVudCBmbXQgYW5kIG1ha2Ugc3VyZSBkcml2ZXINCj4gPiByZXNw
b25zZSBlbm91Z2ggaW5mb3JtYXRpb24/DQo+ID4NCj4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4NCj4gPiA+IC0tLQ0KPiA+
ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgICB8IDE2
ICsrKystLS0tLS0tLS0tLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiA+ID4gaW5kZXggMDU3NDNhNzQ1
YTExLi5mMGFmNzhmMTEyZGIgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMNCj4gPiA+IEBAIC00NDksNyAr
NDQ5LDYgQEAgc3RhdGljIGludCB2aWRpb2NfdmVuY19zX2ZtdF9vdXQoc3RydWN0IGZpbGUgKmZp
bGUsIHZvaWQgKnByaXYsDQo+ID4gPiAgICAgICBzdHJ1Y3QgbXRrX3FfZGF0YSAqcV9kYXRhOw0K
PiA+ID4gICAgICAgaW50IHJldCwgaTsNCj4gPiA+ICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfdmlk
ZW9fZm10ICpmbXQ7DQo+ID4gPiAtICAgICBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAq
cGl4X2ZtdF9tcCA9ICZmLT5mbXQucGl4X21wOw0KPiA+ID4NCj4gPiA+ICAgICAgIHZxID0gdjRs
Ml9tMm1fZ2V0X3ZxKGN0eC0+bTJtX2N0eCwgZi0+dHlwZSk7DQo+ID4gPiAgICAgICBpZiAoIXZx
KSB7DQo+ID4gPiBAQCAtNDc0LDIwICs0NzMsMTMgQEAgc3RhdGljIGludCB2aWRpb2NfdmVuY19z
X2ZtdF9vdXQoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQo+ID4gPiAgICAgICAgICAg
ICAgIGYtPmZtdC5waXgucGl4ZWxmb3JtYXQgPSBmbXQtPmZvdXJjYzsNCj4gPiA+ICAgICAgIH0N
Cj4gPiA+DQo+ID4gPiAtICAgICBwaXhfZm10X21wLT5oZWlnaHQgPSBjbGFtcChwaXhfZm10X21w
LT5oZWlnaHQsDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVEtfVkVOQ19N
SU5fSCwNCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19WRU5DX01BWF9I
KTsNCj4gPiA+IC0gICAgIHBpeF9mbXRfbXAtPndpZHRoID0gY2xhbXAocGl4X2ZtdF9tcC0+d2lk
dGgsDQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVEtfVkVOQ19NSU5fVywN
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19WRU5DX01BWF9XKTsNCj4g
PiA+IC0NCj4gPiA+IC0gICAgIHFfZGF0YS0+dmlzaWJsZV93aWR0aCA9IGYtPmZtdC5waXhfbXAu
d2lkdGg7DQo+ID4gPiAtICAgICBxX2RhdGEtPnZpc2libGVfaGVpZ2h0ID0gZi0+Zm10LnBpeF9t
cC5oZWlnaHQ7DQo+ID4gPiAtICAgICBxX2RhdGEtPmZtdCA9IGZtdDsNCj4gPiA+IC0gICAgIHJl
dCA9IHZpZGlvY190cnlfZm10KGYsIHFfZGF0YS0+Zm10KTsNCj4gPiA+ICsgICAgIHJldCA9IHZp
ZGlvY190cnlfZm10KGYsIGZtdCk7DQo+ID4gPiAgICAgICBpZiAocmV0KQ0KPiA+ID4gICAgICAg
ICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ID4NCj4gPiA+ICsgICAgIHFfZGF0YS0+Zm10ID0gZm10
Ow0KPiA+ID4gKyAgICAgcV9kYXRhLT52aXNpYmxlX3dpZHRoID0gZi0+Zm10LnBpeF9tcC53aWR0
aDsNCj4gPiA+ICsgICAgIHFfZGF0YS0+dmlzaWJsZV9oZWlnaHQgPSBmLT5mbXQucGl4X21wLmhl
aWdodDsNCj4gPiA+ICAgICAgIHFfZGF0YS0+Y29kZWRfd2lkdGggPSBmLT5mbXQucGl4X21wLndp
ZHRoOw0KPiA+ID4gICAgICAgcV9kYXRhLT5jb2RlZF9oZWlnaHQgPSBmLT5mbXQucGl4X21wLmhl
aWdodDsNCj4gPiA+DQo+ID4NCg0K

