Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDAE23DFC3
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgHFRxQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:53:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:45899 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727843AbgHFQbP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:31:15 -0400
X-UUID: 76558f2d5f414e25b1e02eef99486133-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LHDzGNEY2yp40h47jL9qAQX+uM62/KbKM8d4ZyLvJsc=;
        b=M46TxTpAo2x/gPQTvKa1lPzDpOMWn8+QyrylN9AXnc71dnFJaoyPpprJ+I7KyeDMzjwvbwnkxMc3hrMQvNGyFUCbfb8i9zs2Hf4oXqvkA6GVigNqetpxBzEqeeRhJttcoY409bnohnPwCxxHdxUbPDrWzihRAvt6a/Sb2MOMo1c=;
X-UUID: 76558f2d5f414e25b1e02eef99486133-20200806
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1217078898; Thu, 06 Aug 2020 23:27:48 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:27:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 23:27:45 +0800
Message-ID: <1596727666.963.2.camel@mtksdccf07>
Subject: Re: [PATCH V1] media: mc-device.c: change
 media_device_request_alloc to match media_ioctl_info
From:   Frederic Chen <frederic.chen@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
CC:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date:   Thu, 6 Aug 2020 23:27:46 +0800
In-Reply-To: <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
         <20200806072952.11709-2-frederic.chen@mediatek.com>
         <4b1291c4-ee97-8ada-fa2c-3eb5ed22305b@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhciBIYW5zLA0KDQpPbiBUaHUsIDIwMjAtMDgtMDYgYXQgMDk6NDIgKzAyMDAsIEhhbnMgVmVy
a3VpbCB3cm90ZToNCj4gT24gMDYvMDgvMjAyMCAwOToyOSwgZnJlZGVyaWMuY2hlbkBtZWRpYXRl
ay5jb20gd3JvdGU6DQo+ID4gRnJvbTogRnJlZGVyaWMgQ2hlbiA8ZnJlZGVyaWMuY2hlbkBtZWRp
YXRlay5jb20+DQo+ID4gDQo+ID4gV2UgbW9kaWZpZWQgdGhlIHR5cGUgb2YgbWVkaWFfZGV2aWNl
X3JlcXVlc3RfYWxsb2MoKSdzIHNlY29uZA0KPiA+IHBhcmFtZXRlciBmcm9tIGludCogdG8gdm9p
ZCogc28gdGhhdCBpdCBjYW4gbWF0Y2ggdGhlIGludGVyZmFjZQ0KPiA+IGRlZmluZWQgaW4gc3Ry
dWN0IG1lZGlhX2lvY3RsX2luZm8uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRnJlZGVyaWMg
Q2hlbiA8ZnJlZGVyaWMuY2hlbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
bWVkaWEvbWMvbWMtZGV2aWNlLmMgfCA1ICsrKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvbWMvbWMtZGV2aWNlLmMgYi9kcml2ZXJzL21lZGlhL21jL21jLWRldmljZS5jDQo+
ID4gaW5kZXggZGE4MDg4MzUxMTM1Li5iYzViNWVjYjY1ODEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9tYy9tYy1kZXZpY2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvbWMvbWMt
ZGV2aWNlLmMNCj4gPiBAQCAtMzcwLDkgKzM3MCwxMCBAQCBzdGF0aWMgbG9uZyBtZWRpYV9kZXZp
Y2VfZ2V0X3RvcG9sb2d5KHN0cnVjdCBtZWRpYV9kZXZpY2UgKm1kZXYsIHZvaWQgKmFyZykNCj4g
PiAgCXJldHVybiByZXQ7DQo+ID4gIH0NCj4gPiAgDQo+ID4gLXN0YXRpYyBsb25nIG1lZGlhX2Rl
dmljZV9yZXF1ZXN0X2FsbG9jKHN0cnVjdCBtZWRpYV9kZXZpY2UgKm1kZXYsDQo+ID4gLQkJCQkg
ICAgICAgaW50ICphbGxvY19mZCkNCj4gPiArc3RhdGljIGxvbmcgbWVkaWFfZGV2aWNlX3JlcXVl
c3RfYWxsb2Moc3RydWN0IG1lZGlhX2RldmljZSAqbWRldiwgdm9pZCAqYXJnKQ0KPiA+ICB7DQo+
ID4gKwlpbnQgKmFsbG9jX2ZkID0gYXJnOw0KPiA+ICsNCj4gPiAgI2lmZGVmIENPTkZJR19NRURJ
QV9DT05UUk9MTEVSX1JFUVVFU1RfQVBJDQo+ID4gIAlpZiAoIW1kZXYtPm9wcyB8fCAhbWRldi0+
b3BzLT5yZXFfdmFsaWRhdGUgfHwgIW1kZXYtPm9wcy0+cmVxX3F1ZXVlKQ0KPiA+ICAJCXJldHVy
biAtRU5PVFRZOw0KPiA+IA0KPiANCj4gVGhpcyBjaGFuZ2UgaXMgZmluZSwgYnV0IHRoZSByZWFz
b24gdGhpcyB3YXNuJ3Qgbm90aWNlZCBiZWZvcmUgaXMgdGhlIGNhc3QgaW4NCj4gdGhlIE1FRElB
X0lPQ19BUkcgZGVmaW5lOg0KPiANCj4gI2RlZmluZSBNRURJQV9JT0NfQVJHKF9fY21kLCBmdW5j
LCBmbCwgZnJvbV91c2VyLCB0b191c2VyKSAgICAgICAgICAgICAgXA0KPiAgICAgICAgIFtfSU9D
X05SKE1FRElBX0lPQ18jI19fY21kKV0gPSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+ICAgICAgICAgICAgICAgICAuY21kID0gTUVESUFfSU9DXyMjX19jbWQsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICAgIC5mbiA9IChsb25nICgq
KShzdHJ1Y3QgbWVkaWFfZGV2aWNlICosIHZvaWQgKikpZnVuYywgICAgXA0KPiAgICAgICAgICAg
ICAgICAgLmZsYWdzID0gZmwsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+ICAgICAgICAgICAgICAgICAuYXJnX2Zyb21fdXNlciA9IGZyb21fdXNlciwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gICAgICAgICAgICAgICAgIC5hcmdfdG9fdXNl
ciA9IHRvX3VzZXIsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAg
IH0NCj4gDQo+IFdoZW4gYXNzaWduaW5nIHRvIC5mbiB0aGUgZnVuYyBpcyBjYXN0IHRvIGEgc3Bl
Y2lmaWMgZnVuY3Rpb24gcHJvdG90eXBlLg0KPiBXaXRob3V0IHRoYXQgY2FzdCB0aGUgY29tcGls
ZXIgd291bGQgaGF2ZSB3YXJuZWQgYWJvdXQgdGhlIG1pc21hdGNoLg0KPiANCj4gSSBzZWUgbm8g
cmVhc29uIGZvciB0aGF0IGNhc3QsIHNvIGRyb3AgdGhhdCBjYXN0IGFzIHdlbGwuDQoNCkkgZ290
IGl0LiBJIHdpbGwgcmVtb3ZlIHRoZSBjYXN0IGluIHRoZSBuZXh0IHBhdGNoLg0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiANCj4gCUhhbnMNCg0KDQpTaW5jZXJlbHksDQoNCkZyZWRlcmljIENoZW4NCg0K

