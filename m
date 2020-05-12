Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C559B1CF367
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2020 13:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgELLeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 May 2020 07:34:14 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:40007 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726187AbgELLeN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 May 2020 07:34:13 -0400
X-UUID: 9115f98e50a54094a0f661c803b2f75f-20200512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=gYtKISy5CfAfS11vOn7jp+933wg8sWUwDhiuvPMr3cY=;
        b=Fcl89wJDY49143DUnx7+LqDMMlQ+e64wrPfpJXQ36I8GP/D2ClLv76zSdIhVB0XiI2GEXgzXfrocxCbq9mR7REI+K5MbODswoHdjIT/BRtdLyjRaHgbtrxod2Wt4cYCJOkMDDNCkabxUTa0m2BO5P9g0EyIgY/HpKOTzY42vd7c=;
X-UUID: 9115f98e50a54094a0f661c803b2f75f-20200512
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1662016292; Tue, 12 May 2020 19:33:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 12 May
 2020 19:33:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 May 2020 19:33:56 +0800
Message-ID: <1589283161.8804.331.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Cao Bing Bu" <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Sj Huang <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Louis Kuo <louis.kuo@mediatek.com>,
        "Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=" 
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Tue, 12 May 2020 19:32:41 +0800
In-Reply-To: <20200512085832.GI11272@paasikivi.fi.intel.com>
References: <20200502161727.30463-3-dongchun.zhu@mediatek.com>
         <20200506151352.GZ9190@paasikivi.fi.intel.com>
         <1588855524.8804.168.camel@mhfsdcap03>
         <20200507131220.GC9190@paasikivi.fi.intel.com>
         <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
         <1588907288.8804.188.camel@mhfsdcap03>
         <20200508211319.GJ9190@paasikivi.fi.intel.com>
         <1588991026.8804.235.camel@mhfsdcap03>
         <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
         <1589254403.8804.306.camel@mhfsdcap03>
         <20200512085832.GI11272@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 755C8DCD69677F5587F2CEB84A3317C4F6D165D7560D5A48C2ADD67EEADEC3A42000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUdWUsIDIwMjAtMDUtMTIgYXQgMTE6NTggKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgRG9uZ2NodW4sDQo+IA0KPiBPbiBUdWUsIE1heSAxMiwgMjAyMCBh
dCAxMTozMzoyM0FNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gSGkgVG9tYXN6LA0K
PiA+IA0KPiA+IE9uIE1vbiwgMjAyMC0wNS0xMSBhdCAyMDoyMCArMDIwMCwgVG9tYXN6IEZpZ2Eg
d3JvdGU6DQo+ID4gPiBIaSBEb25nY2h1biwNCj4gPiA+IA0KPiA+ID4gT24gU2F0LCBNYXkgOSwg
MjAyMCBhdCA0OjI1IEFNIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4g
d3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEhpIFNha2FyaSwNCj4gPiA+ID4NCj4gPiA+ID4gT24g
U2F0LCAyMDIwLTA1LTA5IGF0IDAwOjEzICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4g
PiA+ID4gSGkgRG9uZ2NodW4sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBPbiBGcmksIE1heSAwOCwg
MjAyMCBhdCAxMTowODowOEFNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4g
PiBIaSBTYWthcmksIFRvbWFzeiwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGFua3MgZm9y
IHRoZSByZXZpZXcuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gVGh1LCAyMDIwLTA1LTA3
IGF0IDE1OjQ2ICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gSGkgU2Fr
YXJpLCBEb25nY2h1biwNCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gT24gVGh1LCBNYXkg
NywgMjAyMCBhdCAzOjEyIFBNIFNha2FyaSBBaWx1cw0KPiA+ID4gPiA+ID4gPiA8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gPiBISSBEb25nY2h1biwNCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IE9uIFRo
dSwgTWF5IDA3LCAyMDIwIGF0IDA4OjQ1OjI0UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToN
Cj4gPiA+ID4gPiA+ID4gPiA+IEhpIFNha2FyaSwNCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+ID4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gPiA+ID4gT24gV2VkLCAyMDIwLTA1LTA2IGF0IDE4OjEzICswMzAwLCBTYWthcmkg
QWlsdXMgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEhpIERvbmdjaHVuLA0KPiA+ID4gPiA+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBTdW4sIE1heSAwMywgMjAyMCBhdCAx
MjoxNzoyN0FNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gQWRkIGEgVjRMMiBzdWItZGV2aWNlIGRyaXZlciBmb3IgRFc5NzY4IHZvaWNlIGNvaWwgbW90
b3IsIHByb3ZpZGluZw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGNvbnRyb2wgdG8gc2V0IHRoZSBk
ZXNpcmVkIGZvY3VzIHZpYSBJSUMgc2VyaWFsIGludGVyZmFjZS4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8
ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgfCAgIDEgKw0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICB8ICAxMSAr
Kw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSB8ICAg
MSArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5jIHwg
NDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDQ1MyBpbnNlcnRpb25zKCspDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9k
dzk3NjguYw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZGlm
ZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBpbmRleCA4ZDcyYzQxLi5jOTJkYzk5IDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0t
LSBhL01BSU5UQUlORVJTDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvTUFJTlRBSU5FUlMN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtNTE1Nyw2ICs1MTU3LDcgQEAgTDogIGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBTOiAgICAgICBNYWlu
dGFpbmVkDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIFQ6ICAgICAgIGdpdCBnaXQ6Ly9saW51eHR2
Lm9yZy9tZWRpYV90cmVlLmdpdA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICBGOiAgICAgICBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55
YW1sDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gK0Y6ICAgICAgIGRyaXZlcnMvbWVkaWEvaTJjL2R3
OTc2OC5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAgRE9O
R1dPT04gRFc5ODA3IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiAgTTogICAgICAgU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9LY29u
ZmlnIGIvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGlu
ZGV4IDEyNWQ1OTYuLjZhM2Y5ZGEgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvbWVkaWEvaTJjL0tjb25maWcNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMTA0MCw2
ICsxMDQwLDE3IEBAIGNvbmZpZyBWSURFT19EVzk3MTQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAg
ICAgY2FwYWJpbGl0eS4gVGhpcyBpcyBkZXNpZ25lZCBmb3IgbGluZWFyIGNvbnRyb2wgb2YNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgdm9pY2UgY29pbCBtb3RvcnMsIGNvbnRyb2xsZWQgdmlh
IEkyQyBzZXJpYWwgaW50ZXJmYWNlLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gK2NvbmZpZyBWSURFT19EVzk3NjgNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAr
IHRyaXN0YXRlICJEVzk3NjggbGVucyB2b2ljZSBjb2lsIHN1cHBvcnQiDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gKyBkZXBlbmRzIG9uIEkyQyAmJiBWSURFT19WNEwyICYmIE1FRElBX0NPTlRST0xM
RVINCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIGRlcGVuZHMgb24gVklERU9fVjRMMl9TVUJERVZf
QVBJDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+IFBsZWFzZSBjaGVj
ayBob3cgdGhpcyB3b3JrcyBpbiB0aGUgbWVkaWEgdHJlZSBtYXN0ZXIgYnJhbmNoIG5vdyAtLS0g
aXQncw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBsYXJnZWx5IHNlbGVjdCBiYXNlZC4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBUaGUgYWN0
dWF0b3IgZHJpdmVyIHVzZXMgc29tZSBzdHJ1Y3R1cmVzIHRoYXQgcmVxdWlyZSB0aGUNCj4gPiA+
ID4gPiA+ID4gPiA+IFZJREVPX1Y0TDJfU1VCREVWX0FQSSBjb2RlLCBzbyBoZXJlIHdlIGFkZCBW
SURFT19WNEwyX1NVQkRFVl9BUEkNCj4gPiA+ID4gPiA+ID4gPiA+IGRlcGVuZGVuY3kgdG8gYXZv
aWQgcG9zc2libGUgYnVpbGQgZXJyb3Igd2hlbiBpdCdzIG5vdCBlbmFibGVkLg0KPiA+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gUGxlYXNlIG1ha2Ugc3VyZSB0aGlzIHdvcmtzIHdpdGgg
Y3VycmVudCBtZWRpYSB0cmVlIG1hc3Rlci4gUmlnaHQgbm93IGl0DQo+ID4gPiA+ID4gPiA+ID4g
ZG9lcyBub3QuDQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
RG9uZ2NodW4sIGFzIFNha2FyaSBzYWlkLCBwbGVhc2UgbWFrZSBzdXJlIHRvIGJhc2UgdGhlIHBh
dGNoZXMgb24gdGhlDQo+ID4gPiA+ID4gPiA+IG1hc3RlciBicmFuY2ggb2YgdGhlIG1lZGlhIHRy
ZWUuDQo+ID4gPiA+ID4gPiA+IChodHRwczovL2dpdC5saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdp
dC8pLiBUaGUgYXBwcm9hY2ggZm9yIEtjb25maWcNCj4gPiA+ID4gPiA+ID4gZGVwZW5kZW5jeSBz
ZWxlY3Rpb24gdGhlcmUgc2VlbXMgdG8gaGF2ZSBjaGFuZ2VkIHJlY2VudGx5Lg0KPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEkgc2VhcmNoZWQgdGhlIHBhdGNoZXMgb24g
dGhlIG1lZGlhIHRyZWUgbWFzdGVyIGJyYW5jaC4NCj4gPiA+ID4gPiA+IEl0IHNlZW1zIHRoYXQg
d2UgbmVlZCB0byByZW1vdmUgdGhlIFZJREVPX1Y0TDJfU1VCREVWX0FQSSBkZXBlbmRlbmN5IGlu
DQo+ID4gPiA+ID4gPiBLY29uZmlnLCBhbmQgYWRkICNpZmRlZiBDT05GSUdfVklERU9fVjRMMl9T
VUJERVZfQVBJIHRvIGluY2x1ZGUNCj4gPiA+ID4gPiA+IHY0bDItc3ViZGV2IGNvZGUuDQo+ID4g
PiA+ID4gPiBUaGUgY2hhbmdlIG1haW5seSBpcyB0byBtYWtlIGJ1aWxkIHBhc3MsIGFuZCBkb24n
dCByZXR1cm4gRU5PVFRZIGlmDQo+ID4gPiA+ID4gPiBTVUJERVZfQVBJIGlzIG5vdCBzZXQuDQo+
ID4gPiA+ID4gPiBBbSBJIHJpZ2h0Pw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gUGxlYXNlIHNlZSBL
Y29uZmlnIGVudHJpZXMgZm9yIG90aGVyIHNpbWlsYXIgZHJpdmVycyBmcm9tIERvbmd3b29uLg0K
PiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFNvcnJ5IGZvciB0aGUgbWlzdGFrZSA6LSkNCj4g
PiA+ID4gSnVzdCBmb3VuZCB0aGUgY3VycmVudCBtZWRpYSB0cmVlIG1hc3RlciBicmFuY2ggY29k
ZS4uLg0KPiA+ID4gPiBJIHdvdWxkIHVwZGF0ZSBLY29uZmlnIGVudHJpZXMgaW4gbmV4dCByZWxl
YXNlIGJ5IHJlZmVycmluZyB0bzoNCj4gPiA+ID4gaHR0cHM6Ly9naXQubGludXh0di5vcmcvbWVk
aWFfdHJlZS5naXQvdHJlZS9kcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnDQo+ID4gPiANCj4gPiA+
IFNvcnJ5IGZvciBsYXN0IG1pbnV0ZSBjb21tZW50cyBhZ2Fpbi4gV2UgaGFkIGEgc2hvcnQgZGlz
Y3Vzc2lvbg0KPiA+ID4gb2ZmbGluZSB3aXRoIFNha2FyaSBhbmQgd2UgdGhpbmsgdGhlcmUgYXJl
IHNvbWUgY2hhbmdlcyBuZWVkZWQgdG8gdGhpcw0KPiA+ID4gZHJpdmVyLCBuYW1lbHk6DQo+ID4g
PiANCj4gPiA+IDEpIFRoZSBoYXJkd2FyZSBiZWluZyBkcml2ZW4gaW4gb3VyIGNhc2UgaXMgYSBn
dDk3NjksIHdoaWNoIGNvdWxkIGJlDQo+ID4gPiBjb21wYXRpYmxlIHdpdGggZHc5NzY4LCBidXQg
aXQncyBzdGlsbCBhIGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbiBhbmQNCj4gPiA+IGNvdWxkIGhh
dmUgc2xpZ2h0bHkgZGlmZmVyZW50IGNoYXJhY3RlcmlzdGljcy4gVGh1cyB3ZSB0aGluayB0aGUN
Cj4gPiA+IGRyaXZlciBuYW1lIGFuZCBjb21wYXRpYmxlIHN0cmluZ3Mgc2hvdWxkIGJlIHJlbmFt
ZWQgZnJvbQ0KPiA+ID4gZG9uZ3dvb24sZHc5NzY4IHRvIGdpYW50ZWMsZ3Q5NzY5LiBJbiB0aGUg
ZnV0dXJlLCBpZiB0aGVyZSBpcyBhIGRldmljZQ0KPiANCj4gU29ycnksIEkgYWN0dWFsbHkgbWVh
bnQganVzdCB0aGUgY29tcGF0aWJsZSBzdHJpbmcgLS0tIERvbmd3b29uIGlzIGxpa2VseQ0KPiB0
aGUgb3JpZ2luYWwgbWFudWZhY3R1cmVyLiBUaGVyZWZvcmUgSSdkIG5hbWUgdGhlIGRyaXZlciBh
Y2NvcmRpbmcgdG8gdGhhdCwNCj4gYW5kIGp1c3QgYWRkIGEgc2Vjb25kIGNvbXBhdGlibGUgc3Ry
aW5nIGZvciB0aGUgR2lhbnRlYyBkZXZpY2UuDQo+IA0KPiBFaXRoZXIgd29ya3MgZm9yIG1lIHRo
b3VnaC4NCj4gDQoNCkp1c3QgY2hlY2tlZCB0aGUgbGVnYWN5IGxlbnMgZHJpdmVyIGJhc2VkIG9u
IE1lZGlhdGVrIGFyY2hpdGVjdHVyZS4NCkkgZm91bmQgdGhhdCBib3RoIERXOTcxOCBhbmQgRFc5
NzE5IGhhdmUgYmVlbiB1c2luZyBzb21lIGNvbmZpZ3VyYXRpb24NCnJlZ2lzdGVycyB0byBpbml0
aWFsaXplIFZDTS4NClVubGlja2lseSwgSSBjYW5ub3Qgc2VlIGFueSB1cHN0cmVhbSBwYXRjaGVz
IGFib3V0IHRoZXNlIHR3byBsZW5zDQpkcml2ZXJzIG9uIHRoZSBjb21tdW5pdHkuDQoNCkZvciB5
b3VyIHN1Z2dlc3Rpb24sIEkgdGhpbmsgaXQgaXMgb2theS4NCkluIGZhY3QsIEkganVzdCBzeW5j
ZWQgd2l0aCBHaWFudGVjIEZBRS4NCkRvbmd3b29uIEFuYXRlY2ggYW5kIEdpYW50ZWMgYXJlIHR3
byBkaWZmZXJlbnQgZHJpdmVyIGNvbXBhbmllcy4NClRoZWlyIG1vc3QgVkNNIGRyaXZlciBwcm9k
dWN0cyBhcmUgY29tcGF0aWJsZSB3aXRoIGVhY2ggb3RoZXIuDQpJbiBmYWN0LCB0aGV5IGhhdmUg
YSBtYXBwaW5nIHRhYmxlIG9mIERXICYgR1QuDQpGb3IgdXNlciwgdGhlIGFjdHVhdG9yIGRyaXZl
ciBpcyBjb21tb24sIHN1Y2ggYXMgRFc5NzY4IGFuZCBHVDk3NjkuDQpIb3dldmVyLCBhbGdvcml0
aG1zIGluc2lkZSB0aGUgY2hpcCBmcm9tIGRpZmZlcmVudCBNYW51ZmFjdHVyZXMgZGlmZmVycy4N
Cg0KRm9yIEdUOTc2OS9EVzk3NjgsIHRoZXJlIGlzIG9uZSByZWFkLW9ubHkgcmVnaXN0ZXIgMHgw
MCB0aGF0IGNvdWxkIGJlDQpyZWFkIG91dCB0byBkaXN0aW5ndWlzaCBWQ00gSUMgTWFudWZhY3R1
cmUgSUQuDQpUaGUgZGVmYXVsdCB2YWx1ZSAweEUxIHJlcHJlc2VudHMgR2lhbnRlYy4NCg0KRmlu
YWxseSBJIHdvdWxkIGFkZCBvbmUgbW9yZSBjb21wYXRpYmxlIGZvciBHaWFudGVjIGluIG5leHQg
cmVsZWFzZS4NCkxpa2UgdGhpczoNCnN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3
OTc2OF9vZl90YWJsZVtdID0gew0KICAgeyAuY29tcGF0aWJsZSA9ICJkb25nd29vbixkdzk3Njgi
IH0sDQogICB7IC5jb21wYXRpYmxlID0gImdpYW50ZWMsZ3Q5NzY5IiB9LA0KICAge30NCn07DQpN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkdzk3Njhfb2ZfdGFibGUpOw0KDQo=

