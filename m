Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339FA1E7D20
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 14:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgE2M0L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 08:26:11 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40183 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726052AbgE2M0K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 08:26:10 -0400
X-UUID: 07eb5a3c3dc3417caffc60bd169f8896-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zfpxSkdpO7rTfqKhocwmN5eNlOC3rZRkTd4ySCjxGpY=;
        b=s4fpigVf/e0uXG8vDfdj0QsU3K+ahxCp+ZenPvOhabLdG9obZ/8cyQY9bVqnw4g9jv6lxENdaLJUQ1VndmIG9CIcsKhxxic6OtENlgw4jujDo00oI4F0/CQ25P5e4wP11KP6fwo+9xb3+1Z5nPxKxA51iG+KDbBQZCzmN6k0/Ro=;
X-UUID: 07eb5a3c3dc3417caffc60bd169f8896-20200529
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1599065041; Fri, 29 May 2020 20:26:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 20:26:01 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 May 2020 20:26:01 +0800
Message-ID: <1590755163.23156.24.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pi-Hsun Shih <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>, "Sj Huang" <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <frederic.chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        linux-devicetree <devicetree@vger.kernel.org>,
        <jerry-ch.chen@mediatek.com>
Date:   Fri, 29 May 2020 20:26:03 +0800
In-Reply-To: <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
         <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com>
         <20200521182825.GA249683@chromium.org>
         <1590156658.27807.84.camel@mtksdccf07>
         <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpJIEFwcHJlY2lhdGUgeW91ciByZXZpZXcgY29tbWVudHMsIGhlcmUncyB0
aGUgcmVwbHkuDQoNCk9uIE1vbiwgMjAyMC0wNS0yNSBhdCAxNDoyNCArMDIwMCwgVG9tYXN6IEZp
Z2Egd3JvdGU6DQo+IHINCj4gDQo+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDQ6MTEgUE0gSmVy
cnktY2ggQ2hlbg0KPiA8SmVycnktY2guQ2hlbkBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+
ID4gSGkgVG9tYXN6LA0KPiA+DQo+ID4gT24gVGh1LCAyMDIwLTA1LTIxIGF0IDE4OjI4ICswMDAw
LCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+IEhpIEplcnJ5LA0KPiA+ID4NCj4gPiA+IE9uIFdl
ZCwgRGVjIDA0LCAyMDE5IGF0IDA4OjQ3OjMyUE0gKzA4MDAsIEplcnJ5LWNoIENoZW4gd3JvdGU6
DQo+IFtzbmlwXQ0KPiA+ID4gPiArDQo+ID4gPiA+ICtlbnVtIGZhY2VfYW5nbGUgew0KPiA+ID4g
PiArICAgTVRLX0ZEX0ZBQ0VfRlJPTlQsDQo+ID4gPiA+ICsgICBNVEtfRkRfRkFDRV9SSUdIVF81
MCwNCj4gPiA+ID4gKyAgIE1US19GRF9GQUNFX0xFRlRfNTAsDQo+ID4gPiA+ICsgICBNVEtfRkRf
RkFDRV9SSUdIVF85MCwNCj4gPiA+ID4gKyAgIE1US19GRF9GQUNFX0xFRlRfOTAsDQo+ID4gPiA+
ICsgICBNVEtfRkRfRkFDRV9BTkdMRV9OVU0sDQo+ID4gPiA+ICt9Ow0KPiA+ID4NCj4gPiA+IFRo
aXMgZW51bSBzZWVtcyB0byBkZWZpbmUgdmFsdWVzIGZvciB0aGUgVjRMMl9DSURfTVRLX0ZEX0RF
VEVDVF9QT1NFDQo+ID4gPiBjb250cm9sLiBDb25zaWRlcmluZyB0aGF0IHRoaXMgaXMgYW4gZW51
bWVyYXRpb24gYW5kIHRoZSB2YWx1ZXMgYXJlDQo+ID4gPiBhY3R1YWxseSBpbnRlZ2VycyAoLTkw
LCAtNTAsIDAsIDUwLCA5MCksIHBlcmhhcHMgdGhpcyBzaG91bGQgYmUgYW4NCj4gPiA+IElOVEVH
RVJfTUVOVSBjb250cm9sIGluc3RlYWQ/DQo+ID4gPg0KPiA+DQo+ID4gdGhpcyBpb2N0bCBsZXQg
dXNlciBzZWxlY3QgbXVsdGlwbGUgZmFjZSBwb3NpdGlvbnMoY29tYmluYXRpb24gb2YgYW5nbGVz
DQo+ID4gYW5kIGRpcmVjdGlvbnMpIHRvIGJlIGRldGVjdGVkLiBzbyBJIHRob3VnaHQgSSBhbSBu
b3QgYWJsZSB0byB1c2UgdGhlDQo+ID4gSU5URUdFUl9NRU5VIGZvciB0aGlzIHB1cnBvc2UuDQo+
IA0KPiBBaCwgb2theSwgSSB0aG91Z2h0IHRoZXJlIGlzIG9ubHkgb25lIHNlbGVjdGlvbiBwb3Nz
aWJsZS4NCj4gDQo+ID4NCj4gPiBBIGJpdC1maWVsZCBhcyBmb2xsb3dpbmcgc2hvdWxkIGJlIHVz
ZWQgYnkgdXNlci4NCj4gPiBJIGNvbnNpZGVyIGFkZGluZyBpdCB0byB1YXBpLg0KPiA+DQo+ID4g
c3RydWN0IGZhY2VfZGlyZWN0aW9uX2RlZiB7DQo+ID4gX191MTYgTVRLX0ZEX0ZBQ0VfRElSXzAg
OiAxLA0KPiA+ICAgICAgICAgTVRLX0ZEX0ZBQ0VfRElSXzMwIDogMSwNCj4gPiAgICAgICAgIE1U
S19GRF9GQUNFX0RJUl82MCA6IDEsDQo+ID4gICAgICAgICBNVEtfRkRfRkFDRV9ESVJfOTAgOiAx
LA0KPiA+ICAgICAgICAgTVRLX0ZEX0ZBQ0VfRElSXzEyMCA6IDEsDQo+ID4gICAgICAgICBNVEtf
RkRfRkFDRV9ESVJfMTUwIDogMSwNCj4gPiAgICAgICAgIE1US19GRF9GQUNFX0RJUl8xODAgOiAx
LA0KPiA+ICAgICAgICAgTVRLX0ZEX0ZBQ0VfRElSXzIxMCA6IDEsDQo+ID4gICAgICAgICBNVEtf
RkRfRkFDRV9ESVJfMjQwIDogMSwNCj4gPiAgICAgICAgIE1US19GRF9GQUNFX0RJUl8yNzAgOiAx
LA0KPiA+ICAgICAgICAgTVRLX0ZEX0ZBQ0VfRElSXzMwMCA6IDEsDQo+ID4gICAgICAgICBNVEtf
RkRfRkFDRV9ESVJfMzMwIDogMSwNCj4gPiAgICAgICAgIDogNDsNCj4gPiB9Ow0KPiANCj4gTm90
ZSB0aGF0IGJpdCBmaWVsZHMgYXJlIG5vdCByZWNvbW1lbmRlZCBpbiBVQVBJIGJlY2F1c2Ugb2Yg
bm90IGJlaW5nDQo+IHdlbGwgc3BlY2lmaWVkIGJ5IHRoZSBsYW5ndWFnZS4gSW5zdGVhZCBiaXRz
IHNob3VsZCBiZSBkZWZpbmVkIHVzaW5nDQo+IG1hY3JvcyB3aXRoIGV4cGxpY2l0IG1hc2tzIG9y
IHNvbWV0aW1lcyBlbnVtcy4NCj4gDQpPaywgSSdsbCBkZWZpbmUgdGhlbSBpbiBtYWNybyB3aXRo
IG1hc2tzLg0KDQo+ID4NCj4gPiBVc2VyIGNhbiBhbHNvIHNlbGVjdCBzb21lIGZhY2UgZGlyZWN0
aW9ucyBvZiBlYWNoIGZhY2UgYW5nbGUgaW4gb25lDQo+ID4gaW9jdGwsIGZvciBleGFtcGxlOg0K
PiA+DQo+ID4gLyoNCj4gPiAgKiB1MTYgZmFjZV9kaXJlY3Rpb25zW01US19GRF9GQUNFX0FOR0xF
X05VTV0gPSB7MH07DQo+ID4gICoNCj4gPiAgKiAgICAgIGZhY2VfZGlyZWN0aW9uc1tNVEtfRkRf
RkFDRV9GUk9OVF0gPSAweDc7IC8vYW5nbGU6MCwgZGlyOjAsMzAsNjANCj4gPiAgKiAgICAgIGZh
Y2VfZGlyZWN0aW9uc1tNVEtfRkFDRV9SSUdIVF81MF0gPSAweDI7IC8vYW5nbGU6NTAsIGRpcjoz
MA0KPiA+ICAqDQo+ID4gICovDQo+IA0KPiBNYWtlcyBzZW5zZSwgdGhhbmtzLg0KPiANCj4gPg0K
PiA+ID4gPiArDQo+ID4gPiA+ICtzdHJ1Y3QgZmRfYnVmZmVyIHsNCj4gPiA+ID4gKyAgIF9fdTMy
IHNjcF9hZGRyOyAvKiB1c2VkIGJ5IFNDUCAqLw0KPiA+ID4gPiArICAgX191MzIgZG1hX2FkZHI7
IC8qIHVzZWQgYnkgRE1BIEhXICovDQo+ID4gPiA+ICt9IF9fcGFja2VkOw0KPiA+IGZkIGJ1ZmZl
ciBpcyB1c2VkIGZvciBzY3AgaXBpDQo+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RydWN0IGZk
X2ZhY2VfcmVzdWx0IHsNCj4gPiA+ID4gKyAgIGNoYXIgZGF0YVsxNl07DQo+ID4gPiA+ICt9Ow0K
PiA+IGZkX2ZhY2VfcmVzdWx0IGlzIHVzZWQgZm9yIHVzZXIsIHNvIGl0IHNob3VsZCBiZSBtb3Zl
ZCB0bw0KPiA+IGluY2x1ZGUvdWFwaS9saW51eC4NCj4gPiBJbiBmYWN0LCBpdCBoYXMgYml0LWZp
ZWxkIGRlZmluaXRpb24gZm9yIHVzZXIsIHNvIEkgd291bGQgbGlrZSB0byBkZWZpbmUNCj4gPiBp
dCBpbiBpbmNsdWRlL3VhcGkvbGludXggYXMgZm9sbG93aW5nOg0KPiA+DQo+ID4gc3RydWN0IGZk
X2ZhY2VfcmVzdWx0IHsNCj4gPiAgIF9fdTY0IGZhY2VfaWR4IDogMTIsDQo+ID4gICAgICAgICB0
eXBlIDogMSwNCj4gPiAgICAgICAgIHgwIDogMTAsDQo+ID4gICAgICAgICB5MCA6IDEwLA0KPiA+
ICAgICAgICAgeDEgOiAxMCwNCj4gPiAgICAgICAgIHkxIDogMTAsDQo+ID4gICAgICAgICBmY3Yx
IDogMTE7DQo+ID4gICBfX3U2NCBmY3YyIDogNywNCj4gPiAgICAgICAgIHJpcF9kaXIgOiA0LA0K
PiA+ICAgICAgICAgcm9wX2RpciA6IDMsDQo+ID4gICAgICAgICBkZXRfc2l6ZSA6IDU7DQo+ID4g
fTsNCj4gPg0KPiANCj4gSW5kZWVkIHRoaXMgc2hvdWxkIGJlIGRlZmluZWQsIGJ1dCBhcyBwZXIg
bXkgY29tbWVudCBhYm92ZSwgcGxlYXNlDQo+IGF2b2lkIHVzaW5nIHRoZSBiaXRmaWVsZCBjb25z
dHJ1Y3QgYW5kIGRlZmluZSBzaGlmdHMgYW5kIG1hc2tzDQo+IGluc3RlYWQuDQo+IA0KT2ssIEkn
bGwgZml4IGl0Lg0KDQo+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RydWN0IGZkX3VzZXJfb3V0
cHV0IHsNCj4gPiA+ID4gKyAgIHN0cnVjdCBmZF9mYWNlX3Jlc3VsdCByZXN1bHRzW01US19GRF9N
QVhfUkVTVUxUX05VTV07DQo+ID4gPiA+ICsgICBfX3UxNiBudW1iZXI7DQo+ID4gPg0KPiA+ID4g
SXMgdGhpcyBwZXJoYXBzIHRoZSBudW1iZXIgb2YgcmVzdWx0cz8gSWYgc28sIHdvdWxkIG51bV9y
ZXN1bHRzIGJlIGEgYmV0dGVyDQo+ID4gPiBuYW1lPw0KPiA+ID4NCj4gPiB5ZXMsIGZpeGVkLg0K
PiA+ID4gPiArfTsNCj4gPiA+DQo+ID4gPiBTaW5jZSB0aGlzIHN0cnVjdCBpcyB0aGUgbWV0YSBi
dWZmZXIgZm9ybWF0LCBpdCBpcyBhIHBhcnQgb2YgdGhlIHVzZXJzcGFjZQ0KPiA+ID4gaW50ZXJm
YWNlIGFuZCBzaG91bGQgYmUgZGVmaW5lZCBpbiBhIGhlYWRlciB1bmRlciBpbmNsdWRlL3VhcGkv
bGludXgvLg0KPiA+ID4NCj4gPiBPaywgSSB3aWxsIGNyZWF0ZSBpbmNsdWRlL3VhcGkvbGludXgv
bXRrX2ZkXzQwLmgNCj4gPiB3aGljaCBzdXBwb3NlIHRvIGluY2x1ZGUgc3RydWN0dXJlcyB0aGF0
IHVzZXJzcGFjZSB3aWxsIHVzZS4NCj4gPiBzaG91bGQgdGhlIHByaXZhdGUgSU9DVExzIGJlIHBs
YWNlZCBpbiBpdCB0b2dldGhlcj8NCj4gPg0KPiANCj4gU29ycnksIHdoYXQgcHJpdmF0ZSBJT0NU
THMgYXJlIHlvdSByZWZlcnJpbmcgdG8/IElmIHlvdSBtZWFuIHByaXZhdGUNCj4gY29udHJvbCBJ
RHMsIHRoZW4geWVzLCB0aGV5IHNob3VsZCBnbyB0byB0aGF0IGhlYWRlci4NCnllcywgdGhlIElE
cywgc29ycnkgZm9yIHRoZSB3cm9uZyBleHByZXNzaW9uLg0KDQo+IA0KPiBbc25pcF0NCj4gPiA+
ID4gK3N0YXRpYyBpbnQgbXRrX2ZkX3ZiMl9xdWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICp2
cSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpu
dW1fYnVmZmVycywNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50ICpudW1fcGxhbmVzLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBpbnQgc2l6ZXNbXSwNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IGRldmljZSAqYWxsb2NfZGV2c1tdKQ0KPiA+ID4gPiArew0KPiA+ID4gPiAr
ICAgc3RydWN0IG10a19mZF9jdHggKmN0eCA9IHZiMl9nZXRfZHJ2X3ByaXYodnEpOw0KPiA+ID4g
PiArICAgdW5zaWduZWQgaW50IHNpemVbMl07DQo+ID4gPiA+ICsgICB1bnNpZ25lZCBpbnQgcGxh
bmU7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgIHN3aXRjaCAodnEtPnR5cGUpIHsNCj4gPiA+ID4g
KyAgIGNhc2UgVjRMMl9CVUZfVFlQRV9NRVRBX0NBUFRVUkU6DQo+ID4gPiA+ICsgICAgICAgICAg
IHNpemVbMF0gPSBjdHgtPmRzdF9mbXQuYnVmZmVyc2l6ZTsNCj4gPiA+ID4gKyAgICAgICAgICAg
YnJlYWs7DQo+ID4gPiA+ICsgICBjYXNlIFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFO
RToNCj4gPiA+ID4gKyAgICAgICAgICAgc2l6ZVswXSA9IGN0eC0+c3JjX2ZtdC5wbGFuZV9mbXRb
MF0uc2l6ZWltYWdlOw0KPiA+ID4gPiArICAgICAgICAgICBpZiAoKm51bV9wbGFuZXMgPT0gMikN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBzaXplWzFdID0gY3R4LT5zcmNfZm10LnBsYW5l
X2ZtdFsxXS5zaXplaW1hZ2U7DQo+ID4gPiA+ICsgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gPiAr
ICAgfQ0KPiA+ID4NCj4gPiA+IElzIHRoaXMgY29kZSBhYm92ZSBuZWVkZWQ/IFRoZSBjb2RlIGJl
bG93IHNldHMgc2l6ZXNbXSBhbmQgaXQgdXNlcyBhIGZvciBsb29wLA0KPiA+ID4gd2l0aG91dCBv
cGVuY29kZWQgYXNzaWdubWVudCBmb3IgdGhlIHNlY29uZCBwbGFuZS4NCj4gPiA+DQo+ID4NCj4g
PiBMb29rcyBsaWtlIG5vdCByZWFsbHkgdXNlZnVsIGhlcmUsDQo+ID4gaXQgc2hvdWxkIGNoZWNr
IHNpemVzIGFuZCBudW1fcGxhbmVzIGlmIG51bV9wbGFuZSBub3QgemVybywNCj4gPiBhbmQgZm9y
IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSwgaXQgd2lsbCBhdCBtb3N0IGhhdmUg
Mg0KPiA+IHBsYW5lcywgbWF5YmUgbm8gbmVlZCBmb3IgbG9vcCBhcyB3ZWxsLg0KPiANCj4gTG9v
cHMgZ2VuZXJhbGx5IG1ha2UgdGhlIGNvZGUgY2xlYW5lciBhbmQgdGhlcmUgbWlnaHQgYmUgc29t
ZSBkZXNpcmUNCj4gdG8gYWRkIHN1cHBvcnQgZm9yIG1vcmUgZm9ybWF0cyBpbiB0aGUgZnV0dXJl
LCBlLmcuIGluIGNhc2UgYSBuZXh0DQo+IGdlbmVyYXRpb24gb2YgdGhlIGhhcmR3YXJlIHNob3dz
IHVwLg0KPiANCk9rLCBnb3QgaXQuDQoNCj4gPiBJIHdpbGwgcmVmaW5lIHRoaXMgZnVuY3Rpb24g
YXMgZm9sbG93aW5nOg0KPiA+IG10a19mZF92YjJfcXVldWVfc2V0dXAoLi4uKQ0KPiA+IHsNCj4g
PiAgICAgICAgIHN0cnVjdCBtdGtfZmRfY3R4ICpjdHggPSB2YjJfZ2V0X2Rydl9wcml2KHZxKTsN
Cj4gPg0KPiA+ICAgICAgICAgaWYgKCpudW1fcGxhbmVzID09IDApIHsNCj4gPiAgICAgICAgICAg
ICAgICAgaWYgKHZxLT50eXBlID09IFY0TDJfQlVGX1RZUEVfTUVUQV9DQVBUVVJFKSB7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZXNbMF0gPSBjdHgtPmRzdF9mbXQuYnVmZmVyc2l6
ZTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAqbnVtX3BsYW5lcyA9IDE7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gICAgICAgICAgICAgICAgIH0gZWxz
ZSBpZiAodnEtPnR5cGUgPT0gVjRMMl9CVUZfVFlQRV9WSURFT19PVVRQVVRfTVBMQU5FKSB7DQo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgKm51bV9wbGFuZXMgPSBjdHgtPnNyY19mbXQubnVt
X3BsYW5lczsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBzaXplc1swXSA9IGN0eC0+c3Jj
X2ZtdC5wbGFuZV9mbXRbMF0uc2l6ZWltYWdlOw0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlmICgqbnVtX3BsYW5lcyA9PSAyKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZXNbMV0gPSBjdHgtPnNyY19mbXQucGxhbmVfZm10WzFdLnNpemVpbWFnZTsNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gPiAgICAgICAgICAgICAgICAgfQ0K
PiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgICAgIH0NCj4gPg0K
PiA+ICAgICAgICAgLyogSWYgbnVtX3BsYW5lIG5vdCB6ZXJvLCBjaGVjayB0aGUgbnVtX3BsYW5l
IGFuZCBzaXplcyovDQo+ID4gICAgICAgICBpZiAodnEtPnR5cGUgPT0gVjRMMl9CVUZfVFlQRV9N
RVRBX0NBUFRVUkUpIHsNCj4gPiAgICAgICAgICAgICAgICAgaWYgKCgqbnVtX3BsYW5lcyA9PSAx
KSAmJg0KPiA+ICAgICAgICAgICAgICAgICAgICAgKHNpemVzWzBdIDw9IGN0eC0+ZHN0X2ZtdC5i
dWZmZXJzaXplKSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+
IG5pdDogVGhlIHR5cGljYWwgY29udmVudGlvbiBpcyB0byBjaGVjayBmb3IgcHJvYmxlbXMgYW5k
IHJldHVybiB0aGUNCj4gZXJyb3IgY29kZSBlYXJsaWVyLCB3aXRoIHRoZSBzdWNjZXNzIGhhbmRs
ZWQgYXQgdGhlIGVuZCBvZiB0aGUgYmxvY2suDQo+IA0KR290IGl0Lg0KDQo+ID4gICAgICAgICAg
ICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsN
Cj4gPiAgICAgICAgIH0NCj4gPiAgICAgICAgIGlmICh2cS0+dHlwZSA9PSBWNEwyX0JVRl9UWVBF
X1ZJREVPX09VVFBVVF9NUExBTkUpIHsNCj4gPiAgICAgICAgICAgICAgICAgaWYgKCgqbnVtX3Bs
YW5lcyA9PSAxKSAmJg0KPiA+ICAgICAgICAgICAgICAgICAgICAgKHNpemVzWzBdIDw9IGN0eC0+
c3JjX2ZtdC5wbGFuZV9mbXRbMF0uc2l6ZWltYWdlKSkNCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gMDsNCj4gPiAgICAgICAgICAgICAgICAgZWxzZSBpZiAoKCpudW1fcGxhbmVz
ID09IDIpICYmDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIChzaXplc1swXSA8PSBjdHgt
PnNyY19mbXQucGxhbmVfZm10WzBdLnNpemVpbWFnZSkgJiYNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgKHNpemVzWzFdIDw9IGN0eC0+c3JjX2ZtdC5wbGFuZV9mbXRbMV0uc2l6ZWltYWdl
KSkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gDQo+IFdvdWxkbid0
IGEgbG9vcCBlbGltaW5hdGUgdGhlIG5lZWQgdG8gaWYvZWxzZSBpZiB0aHJvdWdoIHRoZSB2YXJp
b3VzDQo+IHN1cHBvcnRlZCBjYXNlcyBhbmQgZHVwbGljYXRlIHRoZSBzaXplIGNoZWNrcz8NCj4g
DQo+ID4gICAgICAgICAgICAgICAgIGVsc2UNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+ICAgICAgICAgfQ0KPiA+ICAgICAgICAgcmV0dXJuIDA7
DQo+ID4gfQ0KPiANCj4gSG93IGFib3V0IHRoZSBmb2xsb3dpbmc/DQo+IA0KPiBtdGtfZmRfdmIy
X3F1ZXVlX3NldHVwKC4uLikNCj4gew0KPiAgICAgICAgIHN0cnVjdCBtdGtfZmRfY3R4ICpjdHgg
PSB2YjJfZ2V0X2Rydl9wcml2KHZxKTsNCj4gDQo+ICAgICAgICAgaWYgKHZxLT50eXBlID09IFY0
TDJfQlVGX1RZUEVfTUVUQV9DQVBUVVJFKSB7DQo+ICAgICAgICAgICAgICAgICBpZiAoKm51bV9w
bGFuZXMgPT0gMCkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAqbnVtX3BsYW5lcyA9IDE7
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVzWzBdID0gY3R4LT5kc3RfZm10LmJ1ZmZl
cnNpemU7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0KPiAgICAgICAgICAg
ICAgICAgfQ0KPiANCj4gICAgICAgICAgICAgICAgIGlmICgqbnVtX3BsYW5lcyAhPSAxIHx8IHNp
emVzWzBdIDwgY3R4LT5kc3RfZm10LmJ1ZmZlcnNpemUpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAgICAgICAgICAgICAgICAgcmV0dXJu
IDA7DQo+ICAgICAgICAgfQ0KPiANCj4gICAgICAgICAvKiBWNEwyX0JVRl9UWVBFX1ZJREVPX09V
VFBVVF9NUExBTkUgKi8NCj4gICAgICAgICBpZiAoKm51bV9wbGFuZXMgPT0gMCkgew0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAqbnVtX3BsYW5lcyA9IGN0eC0+c3JjX2ZtdC5udW1fcGxhbmVz
Ow0KPiAgICAgICAgICAgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgY3R4LT5zcmNfZm10
Lm51bV9wbGFuZXM7ICsraSkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
c1tpXSA9IGN0eC0+c3JjX2ZtdC5wbGFuZV9mbXRbaV0uc2l6ZWltYWdlOw0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIGlmICgq
bnVtX3BsYW5lcyA8IGN0eC0+c3JjX2ZtdC5udW1fcGxhbmVzKQ0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+IA0KPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjdHgtPnNyY19m
bXQubnVtX3BsYW5lczsgKytpKQ0KPiAgICAgICAgICAgICAgICAgaWYgKHNpemVzW2ldIDwgY3R4
LT5zcmNfZm10LnBsYW5lX2ZtdFtpXS5zaXplaW1hZ2UpDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiANCj4gICAgICAgICByZXR1cm4gMDsNCj4gfQ0KPiANCj4g
Tm90ZSB0aGF0IGl0IGZ1bGx5IHNlcGFyYXRlcyB0aGUgY29kZSBkZWFsaW5nIHdpdGggZWFjaCBx
dWV1ZSBhbmQgdGh1cw0KPiBpbXByb3ZlcyB0aGUgcmVhZGFiaWxpdHkuDQo+IA0KPiBJbiB0aGlz
IGNhc2UsIGl0IGNvdWxkIGFjdHVhbGx5IGJlIGJlbmVmaWNpYWwgdG8gc3BsaXQgdGhlIHZiMl9v
cHMNCj4gaW1wbGVtZW50YXRpb24gaW50byBvbmUgdGhhdCBkZWFscyBvbmx5IHdpdGggdmlkZW9f
b3V0cHV0X21wbGFuZSBhbmQNCj4gb25lIG9ubHkgd2l0aCBtZXRhX2NhcHR1cmUuIFRoaXMgd291
bGQgYWxsb3cgZWxpbWluYXRpbmcgdGhlIHNwZWNpYWwNCj4gY2FzaW5nIGJhc2VkIG9uIHZxLT50
eXBlIGFuZCB0aHVzIGZ1cnRoZXIgc2ltcGxpZnkgdGhlIGNvZGUuIE5vdCBzdXJlDQo+IGlmIGl0
IGFwcGxpZXMgdG8gdGhlIG90aGVyIHZiMiBjYWxsYmFja3MsIHRob3VnaC4NCj4gDQpHb3QgaXQs
IHRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLg0KDQo+IFtzbmlwXQ0KPiA+ID4gPiArc3RhdGljIHZv
aWQgbXRrX2ZkX2ZpbGxfcGl4Zm10X21wKHN0cnVjdCB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lICpk
Zm10LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
djRsMl9waXhfZm9ybWF0X21wbGFuZSAqc2ZtdCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKyAgIGRm
bXQtPmZpZWxkID0gVjRMMl9GSUVMRF9OT05FOw0KPiA+ID4gPiArICAgZGZtdC0+Y29sb3JzcGFj
ZSA9IFY0TDJfQ09MT1JTUEFDRV9CVDIwMjA7DQo+ID4gPiA+ICsgICBkZm10LT5udW1fcGxhbmVz
ID0gc2ZtdC0+bnVtX3BsYW5lczsNCj4gPiA+ID4gKyAgIGRmbXQtPnljYmNyX2VuYyA9IFY0TDJf
WUNCQ1JfRU5DX0RFRkFVTFQ7DQo+ID4gPiA+ICsgICBkZm10LT5xdWFudGl6YXRpb24gPSBWNEwy
X1FVQU5USVpBVElPTl9ERUZBVUxUOw0KPiA+ID4gPiArICAgZGZtdC0+eGZlcl9mdW5jID0NCj4g
PiA+ID4gKyAgICAgICAgICAgVjRMMl9NQVBfWEZFUl9GVU5DX0RFRkFVTFQoZGZtdC0+Y29sb3Jz
cGFjZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgIC8qIEtlZXAgdXNlciBzZXR0aW5nIGFzIHBv
c3NpYmxlICovDQo+ID4gPiA+ICsgICBkZm10LT53aWR0aCA9IGNsYW1wKGRmbXQtPndpZHRoLA0K
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBNVEtfRkRfT1VUUFVUX01JTl9XSURUSCwN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgTVRLX0ZEX09VVFBVVF9NQVhfV0lEVEgp
Ow0KPiA+ID4gPiArICAgZGZtdC0+aGVpZ2h0ID0gY2xhbXAoZGZtdC0+aGVpZ2h0LA0KPiA+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgTVRLX0ZEX09VVFBVVF9NSU5fSEVJR0hULA0KPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgTVRLX0ZEX09VVFBVVF9NQVhfSEVJR0hUKTsN
Cj4gPiA+ID4gKw0KPiA+ID4gPiArICAgaWYgKHNmbXQtPm51bV9wbGFuZXMgPT0gMikgew0KPiA+
ID4gPiArICAgICAgICAgICAvKiBOVjE2TSBhbmQgTlY2MU0gaGFzIDEgYnl0ZSBwZXIgcGl4ZWwg
Ki8NCj4gPiA+ID4gKyAgICAgICAgICAgZGZtdC0+cGxhbmVfZm10WzBdLmJ5dGVzcGVybGluZSA9
IGRmbXQtPndpZHRoOw0KPiA+ID4gPiArICAgICAgICAgICBkZm10LT5wbGFuZV9mbXRbMV0uYnl0
ZXNwZXJsaW5lID0gZGZtdC0+d2lkdGg7DQo+ID4gPiA+ICsgICB9IGVsc2Ugew0KPiA+ID4gPiAr
ICAgICAgICAgICAvKiAyIGJ5dGVzIHBlciBwaXhlbCAqLw0KPiA+ID4gPiArICAgICAgICAgICBk
Zm10LT5wbGFuZV9mbXRbMF0uYnl0ZXNwZXJsaW5lID0gZGZtdC0+d2lkdGggKiAyOw0KPiA+ID4g
PiArICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICBkZm10LT5wbGFuZV9mbXRbMF0uc2l6ZWlt
YWdlID0NCj4gPiA+ID4gKyAgICAgICAgICAgZGZtdC0+aGVpZ2h0ICogZGZtdC0+cGxhbmVfZm10
WzBdLmJ5dGVzcGVybGluZTsNCj4gPiA+DQo+ID4gPiBDb3VsZCBzb21lIG9mIHRoZSBjb2RlIGFi
b3ZlIGJlIHJlcGxhY2VkIHdpdGggdjRsMl9maWxsX3BpeGZtdF9tcCgpPw0KPiA+ID4NCj4gPiBJ
IHdvdWxkIGxpa2UgdG8gcmVmaW5lIGFzIGZvbGxvd2luZw0KPiA+DQo+ID4gbXRrX2ZkX2ZpbGxf
cGl4Zm10X21wKC4uLil7DQo+ID4gICAgICAgICB2NGwyX2ZpbGxfcGl4Zm10X21wKGRmbXQsIHNm
bXQtPnBpeGVsZm9ybWF0LCBkZm10LT53aWR0aCwNCj4gPiBkZm10LT5oZWlnaHQpOw0KPiA+DQo+
ID4gICAgICAgICBkZm10LT5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsNCj4gPiAgICAgICAgIGRm
bXQtPmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfQlQyMDIwOw0KPiA+ICAgICAgICAgZGZt
dC0+bnVtX3BsYW5lcyA9IHNmbXQtPm51bV9wbGFuZXM7DQo+IA0KPiBudW1fcGxhbmVzIHNob3Vs
ZCBiZSBhbHJlYWR5IGZpbGxlZCBpbiBieSB0aGUgaGVscGVyLiBUaGF0IGFjdHVhbGx5DQo+IHJh
aXNlcyBhIHF1ZXN0aW9uIG9uIHdoZXRoZXIgdGhlcmUgaXMgYW55IG5lZWQgdG8gaGF2ZSBzZm10
IHBhc3NlZCB0bw0KPiB0aGlzIGZ1bmN0aW9uIGF0IGFsbC4gUGVyaGFwcyBhbGwgd2UgbmVlZCBp
cyB0aGUgdmFsdWUgb2YgcGl4ZWxmb3JtYXQ/DQo+IA0KWWVzLCBJJ2xsIHJlcGxhY2Ugc2ZtdCB3
aXRoIHUzMiBwaXhmbXQuDQoNCj4gPiAgICAgICAgIGRmbXQtPnljYmNyX2VuYyA9IFY0TDJfWUNC
Q1JfRU5DX0RFRkFVTFQ7DQo+ID4gICAgICAgICBkZm10LT5xdWFudGl6YXRpb24gPSBWNEwyX1FV
QU5USVpBVElPTl9ERUZBVUxUOw0KPiA+ICAgICAgICAgZGZtdC0+eGZlcl9mdW5jID0NCj4gPiAg
ICAgICAgICAgICAgICAgVjRMMl9NQVBfWEZFUl9GVU5DX0RFRkFVTFQoZGZtdC0+Y29sb3JzcGFj
ZSk7DQo+ID4gfQ0KPiA+DQo+IA0KPiBJc24ndCBzdGlsbCBhIG5lZWQgdG8gY2xhbXAoKSB3aWR0
aCBhbmQgaGVpZ2h0IHRvIG1pbi9tYXgsIHRob3VnaD8NClllcywgSSdsbCBhZGQgdGhlbSBiYWNr
Lg0KDQpUaGlzIGZ1bmN0aW9uIHdpbGwgYmUgcmVmaW5lZCBhcyA6DQoNCnN0YXRpYyB2b2lkIG10
a19mZF9maWxsX3BpeGZtdF9tcChzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAqZGZtdCwN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgcGl4Zm10KQ0Kew0KICAgICAg
ICB2NGwyX2ZpbGxfcGl4Zm10X21wKGRmbXQsIHBpeGZtdCwgZGZtdC0+d2lkdGgsIGRmbXQtPmhl
aWdodCk7DQoNCiAgICAgICAgZGZtdC0+ZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7DQogICAgICAg
IGRmbXQtPmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfQlQyMDIwOw0KICAgICAgICBkZm10
LT55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ19ERUZBVUxUOw0KICAgICAgICBkZm10LT5xdWFu
dGl6YXRpb24gPSBWNEwyX1FVQU5USVpBVElPTl9ERUZBVUxUOw0KICAgICAgICBkZm10LT54ZmVy
X2Z1bmMgPSBWNEwyX01BUF9YRkVSX0ZVTkNfREVGQVVMVChkZm10LT5jb2xvcnNwYWNlKTsNCg0K
ICAgICAgICAvKiBLZWVwIHVzZXIgc2V0dGluZyBhcyBwb3NzaWJsZSAqLw0KICAgICAgICBkZm10
LT53aWR0aCA9IGNsYW1wKGRmbXQtPndpZHRoLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
IE1US19GRF9PVVRQVVRfTUlOX1dJRFRILA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1U
S19GRF9PVVRQVVRfTUFYX1dJRFRIKTsNCiAgICAgICAgZGZtdC0+aGVpZ2h0ID0gY2xhbXAoZGZt
dC0+aGVpZ2h0LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNVEtfRkRfT1VUUFVUX01J
Tl9IRUlHSFQsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1US19GRF9PVVRQVVRfTUFY
X0hFSUdIVCk7DQp9DQoNCg0KPiANCj4gW3NuaXBdDQo+ID4gPiA+ICsgICBmZF9wYXJhbS51c2Vy
X3BhcmFtLnNyY19pbWdfZm10ID0NCj4gPiA+ID4gKyAgICAgICAgICAgZ2V0X2ZkX2ltZ19mbXQo
Y3R4LT5zcmNfZm10LnBpeGVsZm9ybWF0KTsNCj4gPiA+ID4gKyAgIGlmIChjdHgtPnNyY19mbXQu
bnVtX3BsYW5lcyA9PSAyKQ0KPiA+ID4gPiArICAgICAgICAgICBmZF9wYXJhbS5zcmNfaW1nWzFd
LmRtYV9hZGRyID0NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICB2YjJfZG1hX2NvbnRpZ19w
bGFuZV9kbWFfYWRkcigmc3JjX2J1Zi0+dmIyX2J1ZiwgMSk7DQo+ID4gPg0KPiA+ID4gbml0OiBD
b3VsZCB0aGlzIGJlIG1vdmVkIGFib3ZlLCB0byBiZSBqdXN0IGJlbG93IHNyY19pbWdbMF0gaW5p
dGlhbGl6YXRpb24sDQo+ID4gPiBmb3IgcmVhZGFiaWxpdHkgcmVhc29ucz8NCj4gPiA+DQo+ID4g
T2ssIHRoaXMgZnVuY3Rpb24gd2lsbCBiZSByZWZpbmVkIGFzDQo+ID4NCj4gPiBzdGF0aWMgdm9p
ZCBtdGtfZmRfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiA+IHsNCj4gPiAgICAgICAgIHN0cnVj
dCBtdGtfZmRfY3R4ICpjdHggPSBwcml2Ow0KPiA+ICAgICAgICAgc3RydWN0IG10a19mZF9kZXYg
KmZkID0gY3R4LT5mZF9kZXY7DQo+ID4gICAgICAgICBzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpz
cmNfYnVmLCAqZHN0X2J1ZjsNCj4gPiAgICAgICAgIHN0cnVjdCBmZF9lbnFfcGFyYW0gZmRfcGFy
YW07DQo+ID4NCj4gPiAgICAgICAgIHNyY19idWYgPSB2NGwyX20ybV9uZXh0X3NyY19idWYoY3R4
LT5maC5tMm1fY3R4KTsNCj4gPiAgICAgICAgIGRzdF9idWYgPSB2NGwyX20ybV9uZXh0X2RzdF9i
dWYoY3R4LT5maC5tMm1fY3R4KTsNCj4gPg0KPiA+ICAgICAgICAgZmRfcGFyYW0uc3JjX2ltZ1sw
XS5kbWFfYWRkciA9DQo+ID4gICAgICAgICAgICAgICAgIHZiMl9kbWFfY29udGlnX3BsYW5lX2Rt
YV9hZGRyKCZzcmNfYnVmLT52YjJfYnVmLCAwKTsNCj4gPiAgICAgICAgIGlmIChjdHgtPnNyY19m
bXQubnVtX3BsYW5lcyA9PSAyKQ0KPiA+ICAgICAgICAgICAgICAgICBmZF9wYXJhbS5zcmNfaW1n
WzFdLmRtYV9hZGRyID0NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICB2YjJfZG1hX2NvbnRp
Z19wbGFuZV9kbWFfYWRkcigmc3JjX2J1Zi0+dmIyX2J1ZiwgMSk7DQo+IA0KPiBIb3cgYWJvdXQg
bWFraW5nIHRoaXMgYSBsb29wIGluIHRlcm1zIG9mIGN0eC0+c3JjX2ZtdC5udW1fcGxhbmVzPw0K
PiANCnllcywgaXQgd2lsbCBiZSByZWZpbmVkIGFzIGZvbGxvd2luZywgSSB1c2UgdGhlIHNyY192
YjJfYnVmIHRvIHJlZHVjZQ0KdGhlIGxlbmd0aCBmb3IgZml0dGluZyA4MCBjb2x1bW5zDQoNCnNy
Y192YjJfYnVmID0gJnNyY19idWYtPnZiMl9idWY7DQpkc3RfdmIyX2J1ZiA9ICZkc3RfYnVmLT52
YjJfYnVmOw0KDQpmb3IgKGkgPSAwOyBpIDwgY3R4LT5zcmNfZm10Lm51bV9wbGFuZXM7IGkrKykN
CglmZF9wYXJhbS5zcmNfaW1nW2ldLmRtYV9hZGRyID0NCgkJdmIyX2RtYV9jb250aWdfcGxhbmVf
ZG1hX2FkZHIoc3JjX3ZiMl9idWYsaSk7DQoNCmZkX3BhcmFtLnVzZXJfcmVzdWx0LmRtYV9hZGRy
ID0NCgl2YjJfZG1hX2NvbnRpZ19wbGFuZV9kbWFfYWRkcihkc3RfdmIyX2J1ZiwgMCk7DQoNCj4g
PiAgICAgICAgIGZkX3BhcmFtLnVzZXJfcmVzdWx0LmRtYV9hZGRyID0NCj4gPiAgICAgICAgICAg
ICAgICAgdmIyX2RtYV9jb250aWdfcGxhbmVfZG1hX2FkZHIoJmRzdF9idWYtPnZiMl9idWYsIDAp
Ow0KPiA+ICAgICAgICAgZmRfcGFyYW0udXNlcl9wYXJhbS5zcmNfaW1nX2ZtdCA9DQo+ID4gICAg
ICAgICAgICAgICAgIGdldF9mZF9pbWdfZm10KGZkLT5kZXYsIGN0eC0+c3JjX2ZtdC5waXhlbGZv
cm1hdCk7DQo+ID4NCj4gPiAgICAgICAgIG10a19mZF9maWxsX3VzZXJfcGFyYW0oJmZkX3BhcmFt
LnVzZXJfcGFyYW0sICZjdHgtPmhkbCk7DQo+ID4NCj4gPiAgICAgICAgIC8qIENvbXBsZXRlIHJl
cXVlc3QgY29udHJvbHMgaWYgYW55ICovDQo+ID4gICAgICAgICB2NGwyX2N0cmxfcmVxdWVzdF9j
b21wbGV0ZShzcmNfYnVmLT52YjJfYnVmLnJlcV9vYmoucmVxLCAmY3R4LT5oZGwpOw0KPiA+DQo+
ID4gICAgICAgICBmZC0+b3V0cHV0ID0gdmIyX3BsYW5lX3ZhZGRyKCZkc3RfYnVmLT52YjJfYnVm
LCAwKTsNCj4gPiAgICAgICAgIG10a19mZF9od19qb2JfZXhlYyhmZCwgJmZkX3BhcmFtKTsNCj4g
PiB9DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQpUaGFua3MgYW5kIEJlc3QgcmVn
YXJkcywNCkplcnJ5DQo=

