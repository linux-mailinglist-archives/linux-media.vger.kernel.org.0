Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC649481085
	for <lists+linux-media@lfdr.de>; Wed, 29 Dec 2021 07:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239028AbhL2Gw0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Dec 2021 01:52:26 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:43488 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230472AbhL2Gw0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Dec 2021 01:52:26 -0500
X-UUID: e5f62c06c8db414c8ac8f6e7f2d567c7-20211229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=q3YWfjU6Q4Biwiymx+/oPiEp77CZ3uaLyS+aHaNVoYo=;
        b=fDx6y/eVkgkDqbaE+ooL83pTDV2saRr6p6tIjassk1z+bwa8dAbeN7pjary7RZPv5SnJpvdjQZbpm3FdDCC0TqgNK6iD47ZKLC+Ecsq0sdFFV/6HA8gPs7exKnTOjzOjuLnryji5h00DtH3CnvPHPI6d8JskO8kPzMb4MdOZZEk=;
X-UUID: e5f62c06c8db414c8ac8f6e7f2d567c7-20211229
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1332812507; Wed, 29 Dec 2021 14:52:24 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 29 Dec 2021 14:52:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Dec 2021 14:52:21 +0800
Message-ID: <8102ba18b3fdcc19e6b9f53c7a635ffc084c825b.camel@mediatek.com>
Subject: Re: [PATCH v2, 03/12] media: mtk-vcodec: get capture queue buffer
 size from scp
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Fritz Koenig" <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        "Steve Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Wed, 29 Dec 2021 14:52:21 +0800
In-Reply-To: <Ycvz4UrmbngVzIv2@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
         <20211228094146.20505-4-yunfei.dong@mediatek.com>
         <Ycvz4UrmbngVzIv2@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVHp1bmctQmksDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLg0KT24gV2VkLCAyMDIx
LTEyLTI5IGF0IDEzOjM2ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0KPiBPbiBUdWUsIERl
YyAyOCwgMjAyMSBhdCAwNTo0MTozN1BNICswODAwLCBZdW5mZWkgRG9uZyB3cm90ZToNCj4gPiBG
cm9tOiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdvb2ds
ZS5jb20+DQo+IA0KPiBbLi4uXQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWMuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjLmMNCj4gPiBpbmRleCAxMzBlY2VmMmU3NjYu
Ljg3ODkxZWJkNzI0NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay12Y29kZWMvbXRrX3Zjb2RlY19kZWMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5jDQo+ID4gQEAgLTQ2Niw2ICs0NjYsOCBAQCBz
dGF0aWMgaW50IHZpZGlvY192ZGVjX3NfZm10KHN0cnVjdCBmaWxlICpmaWxlLA0KPiA+IHZvaWQg
KnByaXYsDQo+ID4gIAkJCX0NCj4gPiAgCQkJY3R4LT5zdGF0ZSA9IE1US19TVEFURV9JTklUOw0K
PiA+ICAJCX0NCj4gPiArCX0gZWxzZSB7DQo+ID4gKwkJY3R4LT5jYXB0dXJlX2ZvdXJjYyA9IGZt
dC0+Zm91cmNjOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAgCS8qDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiA+IGlu
ZGV4IGEyM2E3NjQ2NDM3Yy4uOTVlMDdjZjJjZDNlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gPiBAQCAt
Mjc3LDYgKzI3Nyw3IEBAIHN0cnVjdCB2ZGVjX3BpY19pbmZvIHsNCj4gPiAgICoJCSAgICAgdG8g
YmUgdXNlZCB3aXRoIGVuY29kZXIgYW5kIHN0YXRlZnVsIGRlY29kZXIuDQo+ID4gICAqIEBpc19m
bHVzaGluZzogc2V0IHRvIHRydWUgaWYgZmx1c2hpbmcgaXMgaW4gcHJvZ3Jlc3MuDQo+ID4gICAq
IEBjdXJyZW50X2NvZGVjOiBjdXJyZW50IHNldCBpbnB1dCBjb2RlYywgaW4gVjRMMiBwaXhlbCBm
b3JtYXQNCj4gPiArICogQGNhcHR1cmVfZm91cmNjOiBjYXB0dXJlIHF1ZXVlIHR5cGUgaW4gVjRM
MiBwaXhlbCBmb3JtYXQNCj4gPiAgICoNCj4gPiAgICogQGNvbG9yc3BhY2U6IGVudW0gdjRsMl9j
b2xvcnNwYWNlOyBzdXBwbGVtZW50YWwgdG8gcGl4ZWxmb3JtYXQNCj4gPiAgICogQHljYmNyX2Vu
YzogZW51bSB2NGwyX3ljYmNyX2VuY29kaW5nLCBZJ0NiQ3IgZW5jb2RpbmcNCj4gPiBAQCAtMzIy
LDYgKzMyMyw3IEBAIHN0cnVjdCBtdGtfdmNvZGVjX2N0eCB7DQo+ID4gIAlib29sIGlzX2ZsdXNo
aW5nOw0KPiA+ICANCj4gPiAgCXUzMiBjdXJyZW50X2NvZGVjOw0KPiA+ICsJdTMyIGNhcHR1cmVf
Zm91cmNjOw0KPiANCj4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiBjYXB0dXJlX2ZvdXJjYz8gIEl0
IGlzIG5vdCB1c2VkLg0KPiANCk5lZWQgdG8gY2FsY3VsYXRlIGVhY2ggcGxhbmUgc2l6ZSBhY2Nv
cmRpbmcgdG8gY2FwdHVyZSBmb3VyY2MgdHlwZSBmcm9tDQpzY3AuIFRoZSBwbGFuZSBzaXplIG9m
IE1NMjEgaXMgZGlmZmVyZW50IHdpdGggTVQyMUMuIEFuZCB0aGUgY2FwdHVyZQ0KZm91cmNjIHR5
cGUgb2YgZGlmZmVyZW50IGNvZGVjIG1heWJlIGRpZmZlcmVudC4gIA0KPiA+ICsvKioNCj4gPiAr
ICogc3RydWN0IHZkZWNfYXBfaXBpX2dldF9wYXJhbSAtIGZvciBBUF9JUElNU0dfU0VUX1BBUkFN
DQo+ID4gKyAqIEBtc2dfaWQJOiBBUF9JUElNU0dfREVDX1NUQVJUDQo+ID4gKyAqIEBpbnN0X2lk
ICAgICA6IGluc3RhbmNlIElELiBVc2VkIGlmIHRoZSBBQkkgdmVyc2lvbiA+PSAyLg0KPiA+ICsg
KiBAZGF0YQk6IHBpY3R1cmUgaW5mb3JtYXRpb24NCj4gPiArICogQHBhcmFtX3R5cGUJOiBnZXQg
cGFyYW0gdHlwZQ0KPiA+ICsgKiBAY29kZWNfdHlwZQk6IENvZGVjIGZvdXJjYw0KPiA+ICsgKi8N
Cj4gPiArc3RydWN0IHZkZWNfYXBfaXBpX2dldF9wYXJhbSB7DQo+ID4gKwl1aW50MzJfdCBtc2df
aWQ7DQo+ID4gKwl1aW50MzJfdCBpbnN0X2lkOw0KPiA+ICsJdWludDMyX3QgZGF0YVs0XTsNCj4g
PiArCXVpbnQzMl90IHBhcmFtX3R5cGU7DQo+ID4gKwl1aW50MzJfdCBjb2RlY190eXBlOw0KPiA+
ICt9Ow0KPiANCj4gQXJlIEFQX0lQSU1TR19TRVRfUEFSQU0gYW5kIEFQX0lQSU1TR19ERUNfU1RB
UlQgdHlwb3M/DQo+IA0KSXQncyBnZXR0aW5nIG1lc3NhZ2UgZnJvbSBzY3Agc2lkZS4gSXQncyBs
b29rcyBtdWNoIGJldHRlciB0byBhZGQgb25lDQpuZXcgcGF0aCBmcm9tIGFwIHRvIHNjcC4NCj4g
PiArLyoqDQo+ID4gKyAqIHN0cnVjdCB2ZGVjX3ZwdV9pcGlfaW5pdF9hY2sgLSBmb3IgVlBVX0lQ
SU1TR19ERUNfSU5JVF9BQ0sNCj4gPiArICogQG1zZ19pZAk6IFZQVV9JUElNU0dfREVDX0lOSVRf
QUNLDQo+ID4gKyAqIEBzdGF0dXMJOiBWUFUgZXhldWN0aW9uIHJlc3VsdA0KPiA+ICsgKiBAYXBf
aW5zdF9hZGRyCTogQVAgdmNvZGVjX3ZwdV9pbnN0IGluc3RhbmNlIGFkZHJlc3MNCj4gPiArICog
QGRhdGEgICAgIDogcGljdHVyZSBpbmZvcm1hdGlvbiBmcm9tIFNDUC4NCj4gPiArICogQHBhcmFt
X3R5cGUJOiBnZXQgcGFyYW0gdHlwZQ0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHZkZWNfdnB1X2lw
aV9nZXRfcGFyYW1fYWNrIHsNCj4gPiArCXVpbnQzMl90IG1zZ19pZDsNCj4gPiArCWludDMyX3Qg
c3RhdHVzOw0KPiA+ICsJdWludDY0X3QgYXBfaW5zdF9hZGRyOw0KPiA+ICsJdWludDMyX3QgZGF0
YVs0XTsNCj4gPiArCXVpbnQzMl90IHBhcmFtX3R5cGU7DQo+ID4gKwl1aW50MzJfdCByZXNlcnZl
ZDsNCj4gPiArfTsNCj4gDQo+IFNhbWUgaGVyZTogaXMgVlBVX0lQSU1TR19ERUNfSU5JVF9BQ0sg
YSB0eXBvPw0KPiANCkl0J3MgZ2V0dGluZyBtZXNzYWdlIGZyb20gc2NwIHNpZGUuIEl0J3MgbG9v
a3MgbXVjaCBiZXR0ZXIgdG8gYWRkIG9uZSBuZXcgcGF0aCBmcm9tIGFwIHRvIHNjcC4+IFdoYXQg
aXMgdGhlIHB1cnBvc2Ugb2YgdGhlICJyZXNlcnZlZCIgZmllbGQ/DQo+IA0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlY192cHVfaWYuYw0KPiA+
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWNfdnB1X2lmLmMNCj4gDQoi
UmVzZXJ2ZWQiIGlzIHVzZWQgdG8gbGV0IHRoZSBzaXplIG9mIHN0cnVjdCBpcyA2NCBhbGluZ2Vk
LiBBbmQgbWF5YmUNCnVzZWQgaW4gdGhlIGZ1dHVyZSB0byBleHRlbmQuDQo+IFsuLi5dDQo+ID4g
K3N0YXRpYyB2b2lkIGhhbmRsZV9nZXRfcGFyYW1fbXNnX2FjaygNCj4gPiArCWNvbnN0IHN0cnVj
dCB2ZGVjX3ZwdV9pcGlfZ2V0X3BhcmFtX2FjayAqbXNnKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qg
dmRlY192cHVfaW5zdCAqdnB1ID0gKHN0cnVjdCB2ZGVjX3ZwdV9pbnN0ICopDQo+ID4gKwkJCQkJ
KHVuc2lnbmVkIGxvbmcpbXNnLQ0KPiA+ID5hcF9pbnN0X2FkZHI7DQo+IA0KPiBEb2VzIGl0IHJl
YWxseSBuZWVkIHRvIGNhc3QgdHdpY2U/DQo+IA0KSSB3aWxsIGNoZWNrIHdoZXRoZXIgaXQncyBw
b3NzaWJsZSB0byByZW1vdmU6ICh1bnNpZ25lZCBsb25nKQ0KPiA+IC4rDQo+ID4gKwltdGtfdmNv
ZGVjX2RlYnVnKHZwdSwgIisgYXBfaW5zdF9hZGRyID0gMHglbGx4IiwgbXNnLQ0KPiA+ID5hcF9p
bnN0X2FkZHIpOw0KPiA+ICsNCj4gPiArCS8qIHBhcmFtX3R5cGUgaXMgZW51bSB2ZGVjX2dldF9w
YXJhbV90eXBlICovDQo+ID4gKwlzd2l0Y2gobXNnLT5wYXJhbV90eXBlKSB7DQo+ID4gKwljYXNl
IDI6DQo+IA0KPiBXaGF0IGlzIDI/ICBJcyBpdCBHRVRfUEFSQU1fUElDX0lORk8/DQo+IA0KWWVz
LCBpdCdzIEdFVF9QQVJBTV9QSUNfSU5GTy4NCj4gPiAraW50IHZwdV9kZWNfZ2V0X3BhcmFtKHN0
cnVjdCB2ZGVjX3ZwdV9pbnN0ICp2cHUsIHVpbnQzMl90ICpkYXRhLA0KPiA+ICsJdW5zaWduZWQg
aW50IGxlbiwgdW5zaWduZWQgaW50IHBhcmFtX3R5cGUpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCB2
ZGVjX2FwX2lwaV9nZXRfcGFyYW0gbXNnOw0KPiA+ICsJaW50IGk7DQo+ID4gKwlpbnQgZXJyOw0K
PiA+ICsNCj4gPiArCW10a192Y29kZWNfZGVidWdfZW50ZXIodnB1KTsNCj4gPiArDQo+ID4gKwlp
ZiAobGVuID4gQVJSQVlfU0laRShtc2cuZGF0YSkpIHsNCj4gPiArCQltdGtfdmNvZGVjX2Vycih2
cHUsICJpbnZhbGlkIGxlbiA9ICVkXG4iLCBsZW4pOw0KPiA+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiA+ICsJfQ0KPiA+ICsNCj4gPiArCW1lbXNldCgmbXNnLCAwLCBzaXplb2YobXNnKSk7DQo+ID4g
Kwltc2cubXNnX2lkID0gQVBfSVBJTVNHX0RFQ19HRVRfUEFSQU07DQo+ID4gKwltc2cuaW5zdF9p
ZCA9IHZwdS0+aW5zdF9pZDsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBsZW47IGkrKykNCj4gPiAr
CQltc2cuZGF0YVtpXSA9IGRhdGFbaV07DQo+IA0KPiBXb3VsZCBpdCBiZSBtb3JlIGNvbmNpc2Ug
aWYgdXNpbmcgbWVtY3B5Pw0KPiANCkNhbiBiZSBmaXhlZC4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWNfdnB1X2lmLmgNCj4gPiBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjX3ZwdV9pZi5oDQo+ID4gaW5kZXggNGNi
M2M3ZjVhM2FkLi45NjNmOGQ0ODc3YjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWNfdnB1X2lmLmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvdmRlY192cHVfaWYuaA0KPiA+IEBAIC0yOCw2ICsyOCw4IEBA
IHN0cnVjdCBtdGtfdmNvZGVjX2N0eDsNCj4gPiAgICogQHdxICAgICAgICAgIDogd2FpdCBxdWV1
ZSB0byB3YWl0IFZQVSBtZXNzYWdlIGFjaw0KPiA+ICAgKiBAaGFuZGxlciAgICAgOiBpcGkgaGFu
ZGxlciBmb3IgZWFjaCBkZWNvZGVyDQo+ID4gICAqIEBjb2RlY190eXBlICAgICA6IHVzZSBjb2Rl
YyB0eXBlIHRvIHNlcGFyYXRlIGRpZmZlcmVudCBjb2RlY3MNCj4gPiArICogQGNhcHR1cmVfdHlw
ZSAgICA6IHVzZWQgY2FwdHVyZSB0eXBlIHRvIHNlcGFyYXRlIGRpZmZlcmVudA0KPiA+IGNhcHR1
cmUgZm9ybWF0DQo+ID4gKyAqIEBmYl9zeiAgOiBmcmFtZSBidWZmZXIgc2l6ZSBvZiBlYWNoIHBs
YW5lDQo+ID4gICAqLw0KPiA+ICBzdHJ1Y3QgdmRlY192cHVfaW5zdCB7DQo+ID4gIAlpbnQgaWQ7
DQo+ID4gQEAgLTQyLDYgKzQ0LDggQEAgc3RydWN0IHZkZWNfdnB1X2luc3Qgew0KPiA+ICAJd2Fp
dF9xdWV1ZV9oZWFkX3Qgd3E7DQo+ID4gIAltdGtfdmNvZGVjX2lwaV9oYW5kbGVyIGhhbmRsZXI7
DQo+ID4gIAl1bnNpZ25lZCBpbnQgY29kZWNfdHlwZTsNCj4gPiArCXVuc2lnbmVkIGludCBjYXB0
dXJlX3R5cGU7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZmJfc3pbMl07DQo+ID4gIH07DQo+IA0KPiBj
YXB0dXJlX3R5cGUgaXMgbm90IHVzZWQgaW4gdGhlIHBhdGNoLg0KPiANCkNhcHR1cmUgdHlwZSB3
aWxsIGJlIHVzZWQgaW4gc2NwIHRvIGdldCBjYXB0dXJlIHBsYW5lIHNpemUgYWNjb3JkaW5nIHRv
DQpjYXB0dXJlIGJ1ZmZlciB0eXBlLg0KPiBEb2VzIGZiX3N6IHRha2UgZWZmZWN0IGluIGxhdGVy
IHBhdGNoZXM/DQoNCkRvbid0IGhhdmUgZWZmZWN0IHRvIGxhdGVyIHBhdGNoZXMuDQoNClRoYW5r
cywNCll1bmZlaSBEb25nDQo=

