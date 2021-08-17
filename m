Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CE33EE521
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 05:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237230AbhHQDjj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Aug 2021 23:39:39 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39032 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S237138AbhHQDjh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Aug 2021 23:39:37 -0400
X-UUID: 4ee17c911ce84e8891b13aad0443e056-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ZUQNFXr5FuKXewOx8S7z3P+aw6QvJPCFepRGuOLx3Rw=;
        b=oI1rkoI7jAHlX2gyV+B/ulTxcBBzRL/bQv74OkKi292s0hpOGO4leSoe81x+j9cLPdZ95VfR/6oxJJcuZZvgI1RY6FUlEDaF7vJSPDtF38hN6I5JANGgrMjLUWNk8fBZw+65JeTGNFJWcjBVx1aPoZo+SxMQeoqrUa7HkLeCzDA=;
X-UUID: 4ee17c911ce84e8891b13aad0443e056-20210817
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1178625717; Tue, 17 Aug 2021 11:39:00 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 11:38:58 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 11:38:57 +0800
Message-ID: <2f680f94ef4d41f7a916ba0c920ec1c9121fe583.camel@mediatek.com>
Subject: Re: [PATCH v5, 13/15] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <linux-mediatek@lists.infradead.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        <linux-kernel@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tomasz Figa <tfiga@google.com>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        "Hsin-Yi Wang" <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        George Sun <george.sun@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>
Date:   Tue, 17 Aug 2021 11:38:58 +0800
In-Reply-To: <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
         <20210811025801.21597-14-yunfei.dong@mediatek.com>
         <1628702693.304754.3975941.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgZGV0YWlsIHN1Z2dlc3Rpb24uDQoNCkZvciB0aGUg
aGVhZGVyIGZpbGUoZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oKSBpcyBpbmNsdWRlZCBp
bjoNCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9s
aXN0Lz9zZXJpZXM9NTExMTc1DQoNCk5lZWQgdG8gZGVwZW5kIG9uIHRoaXMgcGF0Y2gsIGRvIHlv
dSBoYXZlIGFueSBzdWdnZXN0aW9uIGFib3V0IGhvdyB0bw0KYWRkIGl0Pw0KDQpUaGFua3MuDQoN
Ck9uIFdlZCwgMjAyMS0wOC0xMSBhdCAxMToyNCAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+
IE9uIFdlZCwgMTEgQXVnIDIwMjEgMTA6NTc6NTkgKzA4MDAsIFl1bmZlaSBEb25nIHdyb3RlOg0K
PiA+IEFkZHMgZGVjb2RlciBkdC1iaW5kaW5ncyBmb3IgbXQ4MTkyLg0KPiA+IA0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+ID4gLS0t
DQo+ID4gdjU6IG5vIGNoYW5nZXMNCj4gPiANCj4gPiBUaGlzIHBhdGNoIGRlcGVuZHMgb24gIk1l
ZGlhdGVrIE1UODE5MiBjbG9jayBzdXBwb3J0IlsxXS4NCj4gPiANCj4gPiBUaGUgZGVmaW5pdGlv
biBvZiBkZWNvZGVyIGNsb2NrcyBhcmUgaW4gbXQ4MTkyLWNsay5oLCBuZWVkIHRvDQo+ID4gaW5j
bHVkZSB0aGVtIGluIGNhc2Ugb2YgYnVpbGQgZmFpbCBbMV0uDQo+ID4gDQo+ID4gWzFdDQo+ID4g
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3Qv
P3Nlcmllcz01MTExNzUNCj4gPiAtLS0NCj4gPiAgLi4uL21lZGlhL21lZGlhdGVrLHZjb2RlYy1j
b21wLWRlY29kZXIueWFtbCAgIHwgMTcyDQo+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxNzIgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQN
Cj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNv
ZGVjLWNvbXAtDQo+ID4gZGVjb2Rlci55YW1sDQo+ID4gDQo+IA0KPiBNeSBib3QgZm91bmQgZXJy
b3JzIHJ1bm5pbmcgJ21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbQ0KPiBkdF9iaW5kaW5nX2NoZWNr
Jw0KPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6DQo+
IA0KPiB5YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IA0KPiBkdHNjaGVtYS9kdGMgd2Fybmlu
Z3MvZXJyb3JzOg0KPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayx2Y29kZWMtY29tcC0NCj4gZGVjb2Rlci55YW1sOiAkaWQ6IHJlbGF0aXZlIHBhdGgv
ZmlsZW5hbWUgZG9lc24ndCBtYXRjaCBhY3R1YWwgcGF0aA0KPiBvciBmaWxlbmFtZQ0KPiAJZXhw
ZWN0ZWQ6IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9tZWRpYXRlayx2
Y29kZWMtY29tcC1kZWNvZGVyLnlhbWwjDQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtY29tcC0NCj4gZGVjb2Rlci5leGFtcGxlLmR0czoy
MjoxODogZmF0YWwgZXJyb3I6IGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5Mi0NCj4gY2xrLmg6IE5v
IHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4gICAgMjIgfCAgICAgICAgICNpbmNsdWRlIDxkdC1i
aW5kaW5ncy9jbG9jay9tdDgxOTItY2xrLmg+DQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiBjb21waWxhdGlvbiB0ZXJtaW5hdGVk
Lg0KPiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUubGliOjM4MDoNCj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1jb21wLQ0KPiBk
ZWNvZGVyLmV4YW1wbGUuZHQueWFtbF0gRXJyb3IgMQ0KPiBtYWtlWzFdOiAqKiogV2FpdGluZyBm
b3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KPiBtYWtlOiAqKiogW01ha2VmaWxlOjE0MTk6IGR0X2Jp
bmRpbmdfY2hlY2tdIEVycm9yIDINCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJl
ZmNoZWNrZG9jcyk6DQo+IA0KPiBTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRj
aC8xNTE1NTU2DQo+IA0KPiBUaGlzIGNoZWNrIGNhbiBmYWlsIGlmIHRoZXJlIGFyZSBhbnkgZGVw
ZW5kZW5jaWVzLiBUaGUgYmFzZSBmb3IgYQ0KPiBwYXRjaA0KPiBzZXJpZXMgaXMgZ2VuZXJhbGx5
IHRoZSBtb3N0IHJlY2VudCByYzEuDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRf
YmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVu
IG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwDQo+
IHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0K
PiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdC4NCj4gDQo=

