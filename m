Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94061136A9F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 11:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbgAJKIZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 05:08:25 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:58767 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727539AbgAJKIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 05:08:23 -0500
X-UUID: 2ca0150a18fd4d6698ea54d17c03c9c8-20200110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FYP5p0wxJ3QFwXLMGPYrw3vhC17+4GD5PVgVtXVVOhQ=;
        b=q7++ne3AnzWXWNTq4xNmouj5aa2eDIdlw9sI08/AJ9rMRXmfJLWQPH7JNajbssaEgwEInkfipZG1OEArM7j0VrO1/CGzQMcXpfHV7zAsvIzJee/zsfMX4SgzOmBN5TXLN1ngB2npMiEzvkyKPmwgO6F6tcri2K125pg+ug/bR9s=;
X-UUID: 2ca0150a18fd4d6698ea54d17c03c9c8-20200110
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 568683733; Fri, 10 Jan 2020 18:08:17 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 18:07:49 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 18:08:54 +0800
Message-ID: <1578650895.3348.18.camel@mtksdccf07>
Subject: Re: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC:     <tfiga@chromium.org>, <laurent.pinchart@ideasonboard.com>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <Sean.Cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <ryan.yu@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>
Date:   Fri, 10 Jan 2020 18:08:15 +0800
In-Reply-To: <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
References: <Jungo Lin <jungo.lin@mediatek.com>
         <20191219054930.29513-1-jungo.lin@mediatek.com>
         <20191219054930.29513-4-jungo.lin@mediatek.com>
         <081d7d77-2bf7-0fc2-60ea-8ba8faa5b6af@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFuczoNCg0KQXBwcmVjaWF0ZSB5b3VyIGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2guDQoNCk9u
IFR1ZSwgMjAyMC0wMS0wNyBhdCAxNToxMCArMDEwMCwgSGFucyBWZXJrdWlsIHdyb3RlOg0KPiBP
biAxMi8xOS8xOSA2OjQ5IEFNLCBKdW5nbyBMaW4gd3JvdGU6DQo+ID4gRm9yIENhbWVyYSBBUihB
dWdtZW50ZWQgUmVhbGl0eSkgYXBwbGljYXRpb24gcmVxdWlyZXMgY2FtZXJhIHRpbWVzdGFtcHMN
Cj4gPiB0byBiZSByZXBvcnRlZCB3aXRoIENMT0NLX0JPT1RUSU1FIHRvIHN5bmMgdGltZXN0YW1w
IHdpdGggb3RoZXIgc2Vuc29yDQo+ID4gc291cmNlcy4NCj4gPiANCj4gPiBUaGUgYm9vdHRpbWUg
dGltZXN0YW1wIGlzIGlkZW50aWNhbCB0byBtb25vdG9uaWMgdGltZXN0YW1wLA0KPiA+IGV4Y2Vw
dCBpdCBhbHNvIGluY2x1ZGVzIGFueSB0aW1lIHRoYXQgdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQu
DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSnVuZ28gTGluIDxqdW5nby5saW5AbWVkaWF0ZWsu
Y29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgZnJvbSB2NjoNCj4gPiAgLSBObyBjaGFuZ2UuDQo+
ID4gLS0tDQo+ID4gIERvY3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvYnVmZmVyLnJzdCB8IDEx
ICsrKysrKysrKystDQo+ID4gIGluY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCAgICAgICAg
ICB8ICAyICsrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL21lZGlhL3VhcGkv
djRsL2J1ZmZlci5yc3QgYi9Eb2N1bWVudGF0aW9uL21lZGlhL3VhcGkvdjRsL2J1ZmZlci5yc3QN
Cj4gPiBpbmRleCA5MTQ5YjU3NzI4ZTUuLmY0NWJmY2U3ZmRkZCAxMDA2NDQNCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL21lZGlhL3VhcGkvdjRsL2J1ZmZlci5yc3QNCj4gPiArKysgYi9Eb2N1bWVu
dGF0aW9uL21lZGlhL3VhcGkvdjRsL2J1ZmZlci5yc3QNCj4gPiBAQCAtNjYyLDEzICs2NjIsMjIg
QEAgQnVmZmVyIEZsYWdzDQo+ID4gICAgICAgIC0gMHgwMDAwMjAwMA0KPiA+ICAgICAgICAtIFRo
ZSBidWZmZXIgdGltZXN0YW1wIGhhcyBiZWVuIHRha2VuIGZyb20gdGhlIGBgQ0xPQ0tfTU9OT1RP
TklDYGANCj4gPiAgCWNsb2NrLiBUbyBhY2Nlc3MgdGhlIHNhbWUgY2xvY2sgb3V0c2lkZSBWNEwy
LCB1c2UNCj4gPiAtCTpjOmZ1bmM6YGNsb2NrX2dldHRpbWVgLg0KPiA+ICsJOmM6ZnVuYzpgY2xv
Y2tfZ2V0dGltZWAgdXNpbmcgY2xvY2sgSURzIGBgQ0xPQ0tfTU9OT1RPTklDYGAuDQo+IA0KPiBJ
RHMgLT4gSUQNCj4gDQoNCk9rLCBmaXggaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gICAgICAqIC4u
IF9gVjRMMi1CVUYtRkxBRy1USU1FU1RBTVAtQ09QWWA6DQo+ID4gIA0KPiA+ICAgICAgICAtIGBg
VjRMMl9CVUZfRkxBR19USU1FU1RBTVBfQ09QWWBgDQo+ID4gICAgICAgIC0gMHgwMDAwNDAwMA0K
PiA+ICAgICAgICAtIFRoZSBDQVBUVVJFIGJ1ZmZlciB0aW1lc3RhbXAgaGFzIGJlZW4gdGFrZW4g
ZnJvbSB0aGUgY29ycmVzcG9uZGluZw0KPiA+ICAJT1VUUFVUIGJ1ZmZlci4gVGhpcyBmbGFnIGFw
cGxpZXMgb25seSB0byBtZW0ybWVtIGRldmljZXMuDQo+ID4gKyAgICAqIC4uIF9gVjRMMl9CVUZf
RkxBR19USU1FU1RBTVBfQk9PVElNRWA6DQo+IA0KPiBZb3UgbWlzdHlwZWQgQk9PVFRJTUUgYXMg
Qk9PVElNRSBpbiBhIGxvdCBvZiBwbGFjZXMuIFBsZWFzZSBjaGVjay4NCj4gDQoNCk9rLCBmaXgg
dGhpcyB0eXBvIGluIG5leHQgdmVyc2lvbi4NCg0KPiA+ICsNCj4gPiArICAgICAgLSBgYFY0TDJf
QlVGX0ZMQUdfVElNRVNUQU1QX0JPT1RJTUVgYA0KPiA+ICsgICAgICAtIDB4MDAwMDgwMDANCj4g
PiArICAgICAgLSBUaGUgYnVmZmVyIHRpbWVzdGFtcCBoYXMgYmVlbiB0YWtlbiBmcm9tIHRoZSBg
YENMT0NLX0JPT1RUSU1FYGANCj4gPiArCWNsb2NrLiBUbyBhY2Nlc3MgdGhlIHNhbWUgY2xvY2sg
b3V0c2lkZSBWNEwyLCB1c2UNCj4gPiArCTpjOmZ1bmM6YGNsb2NrX2dldHRpbWVgIHVzaW5nIGNs
b2NrIElEcyBgYENMT0NLX0JPT1RUSU1FYGAuDQo+IA0KPiBJRHMgLT4gSUQNCj4gDQoNCkRpdHRv
Lg0KDQo+ID4gKwlJZGVudGljYWwgdG8gQ0xPQ0tfTU9OT1RPTklDLCBleGNlcHQgaXQgYWxzbyBp
bmNsdWRlcyBhbnkgdGltZSB0aGF0DQo+ID4gKwl0aGUgc3lzdGVtIGlzIHN1c3BlbmRlZC4NCj4g
PiAgICAgICogLi4gX2BWNEwyLUJVRi1GTEFHLVRTVEFNUC1TUkMtTUFTS2A6DQo+ID4gIA0KPiA+
ICAgICAgICAtIGBgVjRMMl9CVUZfRkxBR19UU1RBTVBfU1JDX01BU0tgYA0KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmgNCj4gPiBpbmRleCAwNDQ4MWM3MTdmZWUuLjc0ZWY5NDcyZTcwMiAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gPiArKysgYi9pbmNs
dWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCj4gPiBAQCAtMTA2MCw2ICsxMDYwLDggQEAgc3Rh
dGljIGlubGluZSBfX3U2NCB2NGwyX3RpbWV2YWxfdG9fbnMoY29uc3Qgc3RydWN0IHRpbWV2YWwg
KnR2KQ0KPiA+ICAjZGVmaW5lIFY0TDJfQlVGX0ZMQUdfVElNRVNUQU1QX1VOS05PV04JCTB4MDAw
MDAwMDANCj4gPiAgI2RlZmluZSBWNEwyX0JVRl9GTEFHX1RJTUVTVEFNUF9NT05PVE9OSUMJMHgw
MDAwMjAwMA0KPiA+ICAjZGVmaW5lIFY0TDJfQlVGX0ZMQUdfVElNRVNUQU1QX0NPUFkJCTB4MDAw
MDQwMDANCj4gPiArI2RlZmluZSBWNEwyX0JVRl9GTEFHX1RJTUVTVEFNUF9CT09USU1FCQkweDAw
MDA4MDAwDQo+IA0KPiBUaGlzIHNob3VsZCBiZSAweDAwMDA2MDAwLg0KPiANCj4gKGZsYWdzICYg
VjRMMl9CVUZfRkxBR19USU1FU1RBTVBfTUFTSykgaXMgYSB2YWx1ZSB0aGF0IGRldGVybWluZXMg
dGhlIHRpbWVzdGFtcA0KPiBzb3VyY2UsIHNvIHRoZXNlIHRpbWVzdGFtcCBkZWZpbmVzIGFyZSB2
YWx1ZXMsIG5vdCBiaXRtYXNrcy4NCj4gDQo+IEhvd2V2ZXIsIEkgZG9uJ3QgbGlrZSB5b3VyIGFw
cHJvYWNoLiBXaGV0aGVyIHRvIHVzZSBNT05PVE9OSUMgb3IgQk9PVFRJTUUgaXMgcmVhbGx5DQo+
IGEgdXNlcnNwYWNlIGRlY2lzaW9uLCBhbmQgbG9ja2luZyBhIGRyaXZlciB0byBvbmUgb2YgdGhl
c2UgdHdvIG9wdGlvbnMgc2VlbXMNCj4gd3JvbmcgdG8gbWUuDQo+IA0KPiBJbnN0ZWFkIGFkZCBu
ZXcgVjRMMl9CVUZfRkxBR19VU0VfQk9PVFRJTUUgZmxhZyB0aGF0IHVzZXJzcGFjZSBjYW4gc2V0
IHdoZW4gcXVldWluZw0KPiB0aGUgYnVmZmVyIGFuZCB0aGF0IGluZGljYXRlcyB0aGF0IGluc3Rl
YWQgb2YgdGhlIE1PTk9UT05JQyB0aW1lc3RhbXAsIGl0IHNob3VsZCByZXR1cm4NCj4gdGhlIEJP
T1RUSU1FIHRpbWVzdGFtcC4gVGhpcyByZXF1aXJlcyBhIHNpbXBsZSBoZWxwZXIgZnVuY3Rpb24g
dGhhdCByZXR1cm5zIGVpdGhlcg0KPiBrdGltZV9nZXRfbnMgb3Iga3RpbWVfZ2V0X2Jvb3R0aW1l
X25zIGJhc2VkIG9uIHRoZSB2YjJfdjRsMl9idWZmZXIgZmxhZ3MgZmllbGQuDQo+IA0KPiBJdCdz
IGRlZmluaXRlbHkgbW9yZSB3b3JrIChhbHRob3VnaCBpdCBjYW4gYmUgbGltaXRlZCB0byBkcml2
ZXJzIHRoYXQgdXNlIHZiMiksDQo+IGJ1dCBtdWNoIG1vcmUgdXNlZnVsLg0KPiANCj4gUmVnYXJk
cywNCj4gDQo+IAlIYW5zDQo+IA0KDQpBZ3JlZS4NCldlIHdpbGwgYWRkIG5ldyBWNEwyX0JVRl9G
TEFHX1VTRV9CT09UVElNRSBmbGFnICgweDAwMDA2MDAwLikgdG8gcmVwbGFjZQ0KdGhpcyBWNEwy
X0JVRl9GTEFHX1RJTUVTVEFNUF9CT09USU1FIGZsYWcgZm9yIGJldHRlciB1c2FnZS4NCg0KPiA+
ICsNCj4gPiAgLyogVGltZXN0YW1wIHNvdXJjZXMuICovDQo+ID4gICNkZWZpbmUgVjRMMl9CVUZf
RkxBR19UU1RBTVBfU1JDX01BU0sJCTB4MDAwNzAwMDANCj4gPiAgI2RlZmluZSBWNEwyX0JVRl9G
TEFHX1RTVEFNUF9TUkNfRU9GCQkweDAwMDAwMDAwDQo+ID4gDQo+IA0KDQpTaW5jZXJlbHkNCg0K
SnVuZ28NCg==

