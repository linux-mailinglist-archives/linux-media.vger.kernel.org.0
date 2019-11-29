Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D71C10D8B7
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2019 17:55:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbfK2Qzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Nov 2019 11:55:49 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:61627 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726909AbfK2Qzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Nov 2019 11:55:48 -0500
X-UUID: 27e1f9e8dc8a43379aabcbe1ea1f8a3b-20191130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=RwPIBCt8Byv35g9Lc2rnuZU0pdZStU8upoyg76kEMY4=;
        b=MXX0+hWbQ23oktIZa8XNLebbhUkm7YlR0W8iVJCXosD/tcNg/q2TAd0G/cLfQ3i0oV6QERKtvXR6jFfJrK0jiYiDd8QR0jARN1R10uP7lhm2xLbacl1eNGSlFpFNn7wIZj2OhkWur5TKELO/pubyO/pQqQscpqb2yyT+xIJR0bo=;
X-UUID: 27e1f9e8dc8a43379aabcbe1ea1f8a3b-20191130
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1895794277; Sat, 30 Nov 2019 00:55:37 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 30 Nov 2019 00:55:27 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 30 Nov 2019 00:55:32 +0800
Message-ID: <1575046535.22859.12.camel@mtksdccf07>
Subject: Re: [RFC PATCH V3 3/3] platform: mtk-isp: Add Mediatek FD driver
From:   Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "lkml@metux.net" <lkml@metux.net>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>, "yuzhao@chromium.org" <yuzhao@chromium.org>,
        "zwisler@chromium.org" <zwisler@chromium.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Sean Cheng =?UTF-8?Q?=28=E9=84=AD=E6=98=87=E5=BC=98=29?= 
        <Sean.Cheng@mediatek.com>,
        "Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?=" 
        <sj.huang@mediatek.com>,
        Christie Yu =?UTF-8?Q?=28=E6=B8=B8=E9=9B=85=E6=83=A0=29?= 
        <christie.yu@mediatek.com>,
        Frederic Chen =?UTF-8?Q?=28=E9=99=B3=E4=BF=8A=E5=85=83=29?= 
        <Frederic.Chen@mediatek.com>,
        Jungo Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=8E=E4=BF=8A=29?= 
        <jungo.lin@mediatek.com>,
        Po-Yang Huang =?UTF-8?Q?=28=E9=BB=83=E6=9F=8F=E9=99=BD=29?= 
        <po-yang.huang@mediatek.com>,
        Rynn Wu =?UTF-8?Q?=28=E5=90=B3=E8=82=B2=E6=81=A9=29?= 
        <Rynn.Wu@mediatek.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
Date:   Sat, 30 Nov 2019 00:55:35 +0800
In-Reply-To: <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
References: <20190906101125.3784-1-Jerry-Ch.chen@mediatek.com>
         <20190906101125.3784-4-Jerry-Ch.chen@mediatek.com>
         <1571109375.3706.40.camel@mtksdccf07> <20191025035211.GA67000@chromium.org>
         <1574237450.20087.17.camel@mtksdccf07>
         <CAAFQd5DPErhL0_1f6BzDMMOVhxNfJdctBsK=mcBP6oNcmw-r=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D51109AE6E671CDAFBA4AA9F40A1052B9EF5BBB8763216FD60DE4E9BA0F9AFD22000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBXZWQsIDIwMTktMTEtMjAgYXQgMTg6MjggKzA5MDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCA1OjExIFBNIEplcnJ5LWNoIENo
ZW4NCj4gPEplcnJ5LWNoLkNoZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFRv
bWFzeiwNCj4gPg0KPiA+IE9uIEZyaSwgMjAxOS0xMC0yNSBhdCAxMTo1MiArMDgwMCwgVG9tYXN6
IEZpZ2Egd3JvdGU6DQo+ID4gPiBPbiBUdWUsIE9jdCAxNSwgMjAxOSBhdCAxMToxNjoxNUFNICsw
ODAwLCBKZXJyeS1jaCBDaGVuIHdyb3RlOg0KPiA+ID4gPiBIaSBUb21hc3osDQo+ID4gPiA+DQo+
ID4gPiA+IE9uIEZyaSwgMjAxOS0wOS0wNiBhdCAxODoxMSArMDgwMCwgSmVycnktY2ggQ2hlbiB3
cm90ZToNCj4gPiA+ID4gPiBGcm9tOiBKZXJyeS1jaCBDaGVuIDxqZXJyeS1jaC5jaGVuQG1lZGlh
dGVrLmNvbT4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgZHJpdmVy
IG9mIEZhY2UgRGV0ZWN0aW9uIChGRCkgdW5pdCBpbg0KPiA+ID4gPiA+IE1lZGlhdGVrIGNhbWVy
YSBzeXN0ZW0sIHByb3ZpZGluZyBmYWNlIGRldGVjdGlvbiBmdW5jdGlvbi4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFRoZSBtdGstaXNwIGRpcmVjdG9yeSB3aWxsIGNvbnRhaW4gZHJpdmVycyBmb3Ig
bXVsdGlwbGUgSVANCj4gPiA+ID4gPiBibG9ja3MgZm91bmQgaW4gTWVkaWF0ZWsgSVNQIHN5c3Rl
bS4gSXQgd2lsbCBpbmNsdWRlIElTUCBQYXNzIDENCj4gPiA+ID4gPiBkcml2ZXIgKENBTSksIHNl
bnNvciBpbnRlcmZhY2UgZHJpdmVyLCBESVAgZHJpdmVyIGFuZCBmYWNlDQo+ID4gPiA+ID4gZGV0
ZWN0aW9uIGRyaXZlci4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEplcnJ5
LWNoIENoZW4gPGplcnJ5LWNoLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+
ID4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcgICAgICAgICAgICAgICAgfCAg
ICAyICsNCj4gPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAgMiArDQo+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlz
cC9mZC9LY29uZmlnICAgICB8ICAgMTkgKw0KPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1pc3AvZmQvTWFrZWZpbGUgICAgfCAgICA1ICsNCj4gPiA+ID4gPiAgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstaXNwL2ZkL210a19mZC5oICAgIHwgIDE0OCArKw0KPiA+ID4gPiA+
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvZmQvbXRrX2ZkXzQwLmMgfCAxMjE5ICsr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIGluY2x1ZGUvdWFwaS9saW51eC9tdGstZmQtdjRs
Mi1jb250cm9scy5oICAgICB8ICAgNjkgKw0KPiA+ID4gPiA+ICBpbmNsdWRlL3VhcGkvbGludXgv
djRsMi1jb250cm9scy5oICAgICAgICAgICAgfCAgICA0ICsNCj4gPiA+ID4gPiAgOCBmaWxlcyBj
aGFuZ2VkLCAxNDY4IGluc2VydGlvbnMoKykNCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9mZC9LY29uZmlnDQo+ID4gPiA+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvZmQvTWFrZWZp
bGUNCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWlzcC9mZC9tdGtfZmQuaA0KPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL2ZkL210a19mZF80MC5jDQo+ID4gPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3VhcGkvbGludXgvbXRrLWZkLXY0bDItY29udHJvbHMuaA0K
PiA+ID4gPiA+DQo+ID4gPg0KPiA+ID4gW3NuaXBdDQo+ID4gPg0KPiA+ID4gPiA+ICtzdGF0aWMg
aW50IG10a19mZF9qb2JfYWJvcnQoc3RydWN0IG10a19mZF9kZXYgKmZkKQ0KPiA+ID4gPiA+ICt7
DQo+ID4gPiA+ID4gKyB1MzIgcmV0Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArIHJldCA9IHdh
aXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmZmQtPmZkX2lycV9kb25lLA0KPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1zZWNzX3RvX2ppZmZpZXMoTVRLX0ZE
X0hXX1RJTUVPVVQpKTsNCj4gPiA+ID4gPiArIC8qIFJlc2V0IEZEIEhXICovDQo+ID4gPiA+ID4g
KyBpZiAoIXJldCkgew0KPiA+ID4gPiA+ICsgICAgICAgICBzdHJ1Y3QgaXBpX21lc3NhZ2UgZmRf
aXBpX21zZzsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAgICAgICAgIGZkX2lwaV9tc2cuY21k
X2lkID0gTVRLX0ZEX0lQSV9DTURfUkVTRVQ7DQo+ID4gPiA+ID4gKyAgICAgICAgIGlmIChzY3Bf
aXBpX3NlbmQoZmQtPnNjcF9wZGV2LCBTQ1BfSVBJX0ZEX0NNRCwgJmZkX2lwaV9tc2csDQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKGZkX2lwaV9tc2cpLCBNVEtf
RkRfSVBJX1NFTkRfVElNRU9VVCkpDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgZGV2X2Vy
cihmZC0+ZGV2LCAiRkQgUmVzZXQgSFcgZXJyb3JcbiIpOw0KPiA+ID4gPiA+ICsgICAgICAgICBy
ZXR1cm4gLUVUSU1FRE9VVDsNCj4gPiA+ID4gPiArIH0NCj4gPiA+ID4gPiArIHJldHVybiAwOw0K
PiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gKw0KPiA+ID4gPg0KPiA+ID4gPiBDb250aW51ZSB0aGUg
ZGlzY3Vzc2lvbiBhYm91dCBqb2IgYWJvcnQgaW4gUkZDIHYyLA0KPiA+ID4gPg0KPiA+ID4gPiBJ
IHRoaW5rIHRoZSBqb2JfYWJvcnQgY2FsbGJhY2sgaW4gdjRsMl9tMm1fb3BzKCkgbWlnaHQgYmUg
dXNlZnVsLg0KPiA+ID4gPg0KPiA+ID4gPiByZWY6DQo+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJv
b3RsaW4uY29tL2xpbnV4L3Y1LjQtcmMyL3NvdXJjZS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92
NGwyLW1lbTJtZW0uYyNMMzk4DQo+ID4gPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjQtcmMyL3NvdXJjZS9pbmNsdWRlL21lZGlhL3Y0bDItbWVtMm1lbS5oI0w0Mw0KPiA+
ID4gPg0KPiA+ID4gPiBpbiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLW1lbTJtZW0uYyAj
Mzk4IHY0bDJfbTJtX2NhbmNlbF9qb2IoKQ0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gaWYgKG0ybV9j
dHgtPmpvYl9mbGFncyAmIFRSQU5TX1JVTk5JTkcpIHsNCj4gPiA+ID4gICAgIHNwaW5fdW5sb2Nr
X2lycXJlc3RvcmUoJm0ybV9kZXYtPmpvYl9zcGlubG9jaywgZmxhZ3MpOw0KPiA+ID4gPiAgICAg
aWYgKG0ybV9kZXYtPm0ybV9vcHMtPmpvYl9hYm9ydCkNCj4gPiA+ID4gICAgICAgICAgICAgbTJt
X2Rldi0+bTJtX29wcy0+am9iX2Fib3J0KG0ybV9jdHgtPnByaXYpOw0KPiA+ID4gPiAgICAgZHBy
aW50aygibTJtX2N0eCAlcCBydW5uaW5nLCB3aWxsIHdhaXQgdG8gY29tcGxldGVcbiIsIG0ybV9j
dHgpOw0KPiA+ID4gPiAgICAgd2FpdF9ldmVudChtMm1fY3R4LT5maW5pc2hlZCwNCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAhKG0ybV9jdHgtPmpvYl9mbGFncyAmIFRSQU5TX1JVTk5JTkcp
KTsNCj4gPiA+ID4gfSAuLi4NCj4gPiA+ID4NCj4gPiA+ID4gSWYgdGhpcyBvcGVyYXRpb24gaXMg
c2V0LCB3ZSBtaWdodCB1c2UgdGhlIHY0bDJfbTJtX2NhbmNlbF9qb2IoKSB3aGVuDQo+ID4gPiA+
IHN1c3BlbmQsIGFuZCBpdCB3aWxsIGRvIG10a19mZF9qb2JfYWJvcnQoKSBoZXJlLg0KPiA+ID4g
Pg0KPiA+ID4NCj4gPiA+IFRoZSBleHBlY3RhdGlvbiBmb3IgLmpvYl9hYm9ydCgpIGlzIHRoYXQg
c2lnbmFscyB0aGUgaGFyZHdhcmUgdG8NCj4gPiA+IGluc3RhbnRseSBhYmFuZG9uIHRoZSBjdXJy
ZW50IGpvYi4gRG8gd2UgaGF2ZSBhIHdheSB0byB0ZWxsIHRoZQ0KPiA+ID4gZmlybXdhcmUvaGFy
ZHdhcmUgdG8gZG8gc28/DQo+ID4gPg0KPiA+ID4gQWxzbywgc3VzcGVuZCBtdXN0IG5vdCBhYm9y
dCB0aGUgY3VycmVudCBqb2IuIEFueXRoaW5nIHRoYXQgd2FzIGFscmVhZHkNCj4gPiA+IHJ1bm5p
bmcgaXMgZXhwZWN0ZWQgdG8gY29tcGxldGUgc3VjY2Vzc2Z1bHkgYW5kIGZ1cnRoZXIgam9icyBz
aG91bGQNCj4gPiA+IGNvbnRpbnVlIGV4ZWN1dGluZyBvbmNlIHRoZSBzeXN0ZW0gcmVzdW1lcy4N
Cj4gPiA+DQo+ID4gSSBhcHByZWNpYXRlIHlvdXIgY29tbWVudHMgYW5kIFBpLUhzdW4ncyBwYXRj
aCwNCj4gPg0KPiA+IE9rLCBJIHNlZS4NCj4gPiBGb3IgRkQ0MCwgd2UgY2FuJ3QgdGVsbCB0aGUg
ZmlybXdhcmUvaGFyZHdhcmUgdG8gaW5zdGFudGx5IGFiYW5kb24gdGhlDQo+ID4gY3VycmVudCBq
b2IuDQo+ID4gVGhlcmVmb3JlLCBmb3Igc3VzcGVuZCwgd2Ugc3RvcCBzZW5kaW5nIGZ1cnRoZXIg
am9icyB0byBoYXJkd2FyZSBhbmQNCj4gPiB3YWl0IGZvciB0aGUgY29tcGxldGlvbiBvZiB0aGUg
cnVubmluZyBqb2IuDQo+ID4gRm9yIHJlc3VtZSwgd2UgY29udGludWUgc2VuZGluZyBqb2JzIHRv
IGhhcmR3YXJlLg0KPiA+DQo+ID4gPiBbc25pcF0NCj4gPiA+DQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICtzdGF0aWMgaW50IG10a19mZF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiA+
ID4gPiArew0KPiA+ID4gPiA+ICsgc3RydWN0IG10a19mZF9kZXYgKmZkID0gZGV2X2dldF9kcnZk
YXRhKGRldik7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgaWYgKHBtX3J1bnRpbWVfc3VzcGVu
ZGVkKGRldikpDQo+ID4gPiA+ID4gKyAgICAgICAgIHJldHVybiAwOw0KPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiArIGlmIChmZC0+ZmRfc3RyZWFtX2NvdW50KQ0KPiA+ID4gPiA+ICsgICAgICAgICBp
ZiAobXRrX2ZkX2pvYl9hYm9ydChmZCkpDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgbXRr
X2ZkX2h3X2pvYl9maW5pc2goZmQsIFZCMl9CVUZfU1RBVEVfRVJST1IpOw0KPiA+ID4gPiA+ICsN
Cj4gPiA+ID4NCj4gPiA+ID4gVG8gYXZvaWQgbXRrX2ZkX2h3X2pvYl9maW5pc2goKSB0cmlnZ2Vy
IHRoZSBuZXh0IGpvYiwNCj4gPiA+ID4gSSBzdXBwb3NlIHRoYXQgd2UgY291bGQgdXNlIHY0bDJf
bTJtX2NhbmNlbF9qb2IgaW5zdGVhZCBvZiBqb2JfYWJvcnQgYW5kDQo+ID4gPiA+IGpvYl9maW5p
c2ggaGVyZS4NCj4gPiA+ID4NCj4gPiA+ID4gLyoqDQo+ID4gPiA+ICAqIHY0bDJfbTJtX2NhbmNl
bF9qb2IoKSAtIGNhbmNlbCBwZW5kaW5nIGpvYnMgZm9yIHRoZSBjb250ZXh0DQo+ID4gPiA+ICAq
IEBtMm1fY3R4OiBtMm0gY29udGV4dCB3aXRoIGpvYnMgdG8gYmUgY2FuY2VsZWQNCj4gPiA+ID4g
ICoNCj4gPiA+ID4gICogSW4gY2FzZSBvZiBzdHJlYW1vZmYgb3IgcmVsZWFzZSBjYWxsZWQgb24g
YW55IGNvbnRleHQsDQo+ID4gPiA+ICAqIDFdIElmIHRoZSBjb250ZXh0IGlzIGN1cnJlbnRseSBy
dW5uaW5nLCB0aGVuIGFib3J0IGpvYiB3aWxsIGJlIGNhbGxlZA0KPiA+ID4gPiAgKiAyXSBJZiB0
aGUgY29udGV4dCBpcyBxdWV1ZWQsIHRoZW4gdGhlIGNvbnRleHQgd2lsbCBiZSByZW1vdmVkIGZy
b20NCj4gPiA+ID4gICogICAgdGhlIGpvYl9xdWV1ZQ0KPiA+ID4gPiAgKi8NCj4gPiA+ID4NCj4g
PiA+ID4gb3IgYW5vdGhlciB3YXksDQo+ID4gPiA+IHdlIG1heSBhZGQgYSBmbGFnIGFuZCBpbXBs
ZW1lbnQgbXRrX2ZkX2pvYl9yZWFkeSgpIHRoYXQgcmVhZHMgdGhlIGZsYWcNCj4gPiA+ID4gaWYg
d2Ugc3VzcGVuZCwgd2Ugc2V0IHRoZSBmbGFnIGFuZCBkbyBqb2JfYWJvcnQgYW5kIGpvYl9maW5p
c2gsIGV2ZW4gaWYNCj4gPiA+ID4gaXQgdHJ5IGVucXVldWUsIGl0IHdpbGwgc3RpbGwgbm90IHJl
YWxseSBxdWV1ZSB0aGUgam9iLCB1bnRpbCB3ZSByZXNldA0KPiA+ID4gPiB0aGUgZmxhZyBpbiBt
dGtfZmRfcmVzdW1lKCkuDQo+ID4gPiA+DQo+ID4gPiA+IGhvdyBkbyB5b3UgdGhpbms/DQo+ID4g
PiA+DQo+ID4gPg0KPiA+ID4gQXMgcGVyIG15IGNvbW1lbnQgYWJvdmUsIHN1c3BlbmQgbXVzdCBq
dXN0IHBhdXNlIHRoZSBleGVjdXRpb24gb2YgdGhlDQo+ID4gPiBqb2JzLiBJdCBtdXN0IG5vdCBj
YXVzZSBhbnkgam9icyB0byBiZSBza2lwcGVkLg0KPiA+ID4NCj4gPiA+IEFmdGVyIGFuYWx5emlu
ZyB0aGUgbTJtIGZyYW1ld29yayBhbmQgZXhpc3RpbmcgbTJtIGRyaXZlcnMgSSByZWFsaXplZA0K
PiA+ID4gdGhhdCB0aGV5IGN1cnJlbnRseSBwcm92aWRlIG5vIHdheSB0byBjb3JyZWN0bHkgaGFu
ZGxlIHN1c3BlbmQvcmVzdW1lLg0KPiA+ID4gUGktSHN1biBoYXMgYmVlbiBsb29raW5nIGludG8g
Zml4aW5nIHRoaXMgaW4gY3JyZXYuY29tL2MvMTg3ODExMiBhbmQNCj4gPiA+IHdlJ2xsIHNlbmQg
aXQgdXBzdHJlYW0gYXMgc29vbiBhcyB3ZSBnZXQgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGhhbmRs
ZQ0KPiA+ID4gYWxsIHRoZSBjYXNlcyBjb3JyZWN0bHkuDQo+ID4gPg0KPiA+IE9rLCB0aGFua3Mg
Zm9yIHRoZSBwYXRjaGVzLg0KPiA+DQo+ID4gPiA+ID4gKyAvKiBzdXNwZW5kIEZEIEhXICovDQo+
ID4gPiA+ID4gKyB3cml0ZWwoMHgwLCBmZC0+ZmRfYmFzZSArIE1US19GRF9SRUdfT0ZGU0VUX0lO
VF9FTik7DQo+ID4gPiA+ID4gKyB3cml0ZWwoMHgwLCBmZC0+ZmRfYmFzZSArIE1US19GRF9SRUdf
T0ZGU0VUX0hXX0VOQUJMRSk7DQo+ID4gPiA+ID4gKyBjbGtfZGlzYWJsZV91bnByZXBhcmUoZmQt
PmZkX2Nsayk7DQo+ID4gPiA+ID4gKyBkZXZfZGJnKGRldiwgIiVzOmRpc2FibGUgY2xvY2tcbiIs
IF9fZnVuY19fKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyByZXR1cm4gMDsNCj4gPiA+ID4g
PiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIGludCBtdGtfZmRfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICsgc3RydWN0IG10a19m
ZF9kZXYgKmZkID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gPiA+ID4gKyBpbnQgcmV0Ow0K
PiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArIGlmIChwbV9ydW50aW1lX3N1c3BlbmRlZChkZXYpKQ0K
PiA+ID4gPiA+ICsgICAgICAgICByZXR1cm4gMDsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyBy
ZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZmQtPmZkX2Nsayk7DQo+ID4gPiA+ID4gKyBpZiAocmV0
IDwgMCkgew0KPiA+ID4gPiA+ICsgICAgICAgICBkZXZfZGJnKGRldiwgIkZhaWxlZCB0byBvcGVu
IGZkIGNsazolZFxuIiwgcmV0KTsNCj4gPiA+ID4gPiArICAgICAgICAgcmV0dXJuIHJldDsNCj4g
PiA+ID4gPiArIH0NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKyAvKiByZXN1bWUgRkQgSFcgKi8N
Cj4gPiA+ID4gPiArIHdyaXRlbChNVEtfRkRfU0VUX0hXX0VOQUJMRSwgZmQtPmZkX2Jhc2UgKyBN
VEtfRkRfUkVHX09GRlNFVF9IV19FTkFCTEUpOw0KPiA+ID4gPiA+ICsgd3JpdGVsKDB4MSwgZmQt
PmZkX2Jhc2UgKyBNVEtfRkRfUkVHX09GRlNFVF9JTlRfRU4pOw0KPiA+ID4gPiA+ICsgZGV2X2Ri
ZyhkZXYsICIlczplbmFibGUgY2xvY2tcbiIsIF9fZnVuY19fKTsNCj4gPiA+DQo+ID4gPiBCeSB0
aGUgd2F5LCB3ZSBuZWVkIHRvIGtpY2sgdGhlIG0ybSBmcmFtZXdvcmsgaGVyZSB0byBzY2hlZHVs
ZSBmdXJ0aGVyDQo+ID4gPiBqb2JzLiBQaS1Ic3VuJ3MgcGF0Y2ggd2lsbCBhbHNvIHRha2UgY2Fy
ZSBvZiB0aGlzLg0KPiA+ID4NCj4gPiBPaywgSSBzZWUuDQo+ID4gSSB3b3VsZCBsaWtlIHRvIHVz
ZSBQaS1Ic3VuJ3MgcGF0Y2gsIG90aGVyd2lzZSBJIHdvdWxkIG5lZWQgdG8gY2FsbA0KPiA+IHY0
bDJfbTJtX3RyeV9ydW4oKSBoZXJlLg0KPiA+DQo+IA0KPiBZZXMsIHBsZWFzZSBpbmNsdWRlIFBp
LUhzdW4ncyBwYXRjaCAod2l0aCBvcmlnaW5hbCBhdXRob3IsIHNpZ24tb2ZmICsNCj4geW91ciBz
aWduLW9mZiBhZGRlZCkgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHlv
dXINCj4gc2VyaWVzLg0KPiANCkRvbmUuDQoNCj4gPiA+IFtzbmlwXQ0KPiA+ID4NCj4gPiA+ID4g
PiArLyogU2V0IHRoZSBmYWNlIGFuZ2xlIGFuZCBkaXJlY3Rpb25zIHRvIGJlIGRldGVjdGVkICov
DQo+ID4gPiA+ID4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0ZEX0RFVEVDVF9QT1NFICAgICAgICAg
ICAgICAoVjRMMl9DSURfVVNFUl9NVEtfRkRfQkFTRSArIDEpDQo+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ICsvKiBTZXQgaW1hZ2Ugd2lkdGhzIGZvciBhbiBpbnB1dCBpbWFnZSB0byBiZSBzY2FsZWQg
ZG93biBmb3IgZmFjZSBkZXRlY3Rpb24gKi8NCj4gPiA+ID4gPiArI2RlZmluZSBWNEwyX0NJRF9N
VEtfRkRfU0NBTEVfRE9XTl9JTUdfV0lEVEggICAgIChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNF
ICsgMikNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKy8qIFNldCBpbWFnZSBoZWlnaHRzIGZvciBh
biBpbnB1dCBpbWFnZSB0byBiZSBzY2FsZWQgZG93biBmb3IgZmFjZSBkZXRlY3Rpb24gKi8NCj4g
PiA+ID4gPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfRkRfU0NBTEVfRE9XTl9JTUdfSEVJR0hUICAg
IChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsgMykNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4g
Ky8qIFNldCB0aGUgbGVuZ3RoIG9mIHNjYWxlIGRvd24gc2l6ZSBhcnJheSAqLw0KPiA+ID4gPiA+
ICsjZGVmaW5lIFY0TDJfQ0lEX01US19GRF9TQ0FMRV9JTUdfTlVNICAgICAgICAgICAgKFY0TDJf
Q0lEX1VTRVJfTVRLX0ZEX0JBU0UgKyA0KQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArLyogU2V0
IHRoZSBkZXRlY3Rpb24gc3BlZWQsIHVzdWFsbHkgcmVkdWNpbmcgYWNjdXJhY3kuICovDQo+ID4g
PiA+ID4gKyNkZWZpbmUgVjRMMl9DSURfTVRLX0ZEX0RFVEVDVF9TUEVFRCAgICAgICAgICAgICAo
VjRMMl9DSURfVVNFUl9NVEtfRkRfQkFTRSArIDUpDQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsv
KiBTZWxlY3QgdGhlIGRldGVjdGlvbiBtb2RlbCBvciBhbGdvcml0aG0gdG8gYmUgdXNlZC4gKi8N
Cj4gPiA+ID4gPiArI2RlZmluZSBWNEwyX0NJRF9NVEtfRkRfREVURUNUSU9OX01PREVMICAgICAg
ICAgIChWNEwyX0NJRF9VU0VSX01US19GRF9CQVNFICsgNikNCj4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gKy8qIFdlIHJlc2VydmUgMTYgY29udHJvbHMgZm9yIHRoaXMgZHJpdmVyLiAqLw0KPiA+ID4g
PiA+ICsjZGVmaW5lIFY0TDJfQ0lEX01US19GRF9NQVggICAgICAgICAgICAgICAgICAgICAgMTYN
Cj4gPiA+ID4gPiArDQo+ID4gPiA+DQo+ID4gPiA+IEZvciB0aGVzZSBjb250cm9sIElEcywgSSB0
aGluayB0aGUgZm9sbG93aW5nIHNob3VsZCBiZSByZW1haW5lZCBhcyBjaGlwDQo+ID4gPiA+IHNw
ZWNpZmljIGNvbnRyb2xzLg0KPiA+ID4gPiBWNEwyX0NJRF9NVEtfRkRfU0NBTEVfRE9XTl9JTUdf
V0lEVEgsDQo+ID4gPiA+IFY0TDJfQ0lEX01US19GRF9TQ0FMRV9ET1dOX0lNR19IRUlHSFQgYW5k
IFY0TDJfQ0lEX01US19GRF9TQ0FMRV9JTUdfTlVNDQo+ID4gPiA+DQo+ID4gPiA+IEhvcGUgdGhl
cmUgd291bGQgYmUgc3RhbmRhcmRpemluZyBmYWNlIGRldGVjdGlvbiBhcGkgdGhhdCBjb3ZlciB0
aGUgcmVzdA0KPiA+ID4gPiBjb250cm9sczogVjRMMl9DSURfTVRLX0ZEX0RFVEVDVF9QT1NFLCBW
NEwyX0NJRF9NVEtfRkRfREVURUNUX1NQRUVEIGFuZA0KPiA+ID4gPiBWNEwyX0NJRF9NVEtfRkRf
REVURUNUSU9OX01PREVMDQo+ID4gPiA+DQo+ID4gPiA+IFdvdWxkIHlvdSBoYXZlIGFueSBzdWdn
ZXN0aW9ucyBvbiBob3cgdG8gcHJvcG9zZSB0aGUgc3RhbmRhcmQgZmFjZQ0KPiA+ID4gPiBkZXRl
Y3Rpb24gYXBpcz8NCj4gPiA+ID4NCj4gPiA+DQo+ID4gPiBHaXZlbiBubyBmb2xsb3cgdXAgZmVl
ZGJhY2sgZnJvbSB0aGUgY29tbXVuaXR5LCBJIHRoaW5rIHdlIGNhbiBrZWVwIHRoZW0NCj4gPiA+
IGFzIGRyaXZlci1zcGVjaWZpYywgYnV0IHNob3VsZCBtYWtlIHN1cmUgdGhhdCB0aGV5IGhhdmUg
c29tZSByZWFzb25hYmxlDQo+ID4gPiBkZWZhdWx0IHZhbHVlcyBpbiBjYXNlIGFuIGFwcGxpY2F0
aW9uIGRvZXNuJ3QgcmVjb2duaXplIHRoZW0uDQo+ID4gPg0KPiA+ID4gQmVzdCByZWdhcmRzLA0K
PiA+ID4gVG9tYXN6DQo+ID4gPg0KPiA+IFNob3VsZCBJIGtlZXAgdGhlIGZpbGUgIm10ay1mZC12
NGwyLWNvbnRyb2xzLmgiIHdoaWNoIGRlZmluZXMgdGhlDQo+ID4gY29udHJvbCBpZHMgdW5kZXIg
dGhlIGZvbGRlciAiL2luY2x1ZGUvdWFwaS9saW51eCI/DQo+IA0KPiBXZSBzaG91bGQgZGVmaW5l
IHRoZSBDSUQgYmFzZSBmb3IgdGhlIEZEIGRyaXZlciBpbiB2NGwyLWNvbnRyb2xzLmgsDQo+IGJ1
dCB0aGUgY29udHJvbHMgdGhlbXNlbHZlcyBzaG91bGQgYmUgb25seSBkZWZpbmVkIGluc2lkZSB0
aGUgZHJpdmVyLg0KPiANCj4gRm9yIGV4YW1wbGU6DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y1LjQtcmM4L3NvdXJjZS9pbmNsdWRlL3VhcGkvbGludXgvdjRsMi1jb250cm9s
cy5oI0wxNzgNCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNC1yYzgvc291
cmNlL2RyaXZlcnMvbWVkaWEvaTJjL2FkdjcxODAuYyNMMTgxDQo+IA0KPiBCZXN0IHJlZ2FyZHMs
DQo+IFRvbWFzeg0KDQpBcHByZWNpYXRlIGZvciBwcm92aWRpbmcgdGhlIGV4YW1wbGUsDQpXb3Vs
ZCBpdCBiZSBmaW5lIGZvciBtZSB0byBwdXQgdGhlIHByaXZhdGUgQ0lEIGluIHRoZSBtdGtfZmQu
aCh3aGljaCBpcw0Kc2ltaWxhciB0byBiZWZvcmUuLi4pIG9yIGZvbGxvdyB0aGUgZXhhbXBsZSB0
byBkZWZpbmUgaW5zaWRlDQptdGtfZmRfNDAuYz8/DQoNClRoZSBuZXh0IHZlcnNpb24gaXMgYWxt
b3N0IHJlYWR5LCBtYXliZSBJIGNhbiBzZW5kIGl0IHdoZW4gSSByZWFkeSBpbiBhDQpmZXcgZGF5
cz8NCg0KVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpKZXJyeQ0KDQo=

