Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014763D22E1
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 13:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhGVLDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 07:03:41 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:55996 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231566AbhGVLDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 07:03:40 -0400
X-UUID: 6b079f1006b049b8abefc36d8306d277-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=sVejKnwGWH8m17twQO8kI259z77f4UObKDcLs86o0BA=;
        b=hZmDse7Bfa/vOwW9FbIlbTMiw6GHLOiMWFTf9wHC1rt4p1tj3N7CpwrLqTiKegRhpNJND76PSiFiDBlIi5cBVsvQX+fslD6ShUQmdtfOsR5/P3dMVu0sEqon+bJONI/ZxSqQ+mk7DTMNbJNSsrNgjDGABj2qUSfQr/3r8StdkPo=;
X-UUID: 6b079f1006b049b8abefc36d8306d277-20210722
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 570380403; Thu, 22 Jul 2021 19:44:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 19:44:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 19:44:09 +0800
Message-ID: <1626954248.32022.5.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 00/14] Using component framework to support multi
 hardware decode
From:   mtk12024 <yunfei.dong@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
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
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date:   Thu, 22 Jul 2021 19:44:08 +0800
In-Reply-To: <bac9fe10-50e1-a91f-8f71-b6295227d01b@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
         <bac9fe10-50e1-a91f-8f71-b6295227d01b@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIxLTA3LTE5IGF0IDA5OjAwICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMTcuMDcuMjEgMTA6MTIsIFl1bmZlaSBEb25nIHdyb3RlOg0KPiA+IFRoaXMg
c2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgbXVsdGkgaGFyZHdhcmUgZGVjb2RlIGludG8gbXRrLXZj
b2RlYywgYnkgZmlyc3QNCj4gPiBhZGRpbmcgY29tcG9uZW50IGZyYW1ld29yayB0byBtYW5hZ2Ug
ZWFjaCBoYXJkd2FyZSBpbmZvcm1hdGlvbjogaW50ZXJydXB0LA0KPiA+IGNsb2NrLCByZWdpc3Rl
ciBiYXNlcyBhbmQgcG93ZXIuIFNlY29uZGx5IGFkZCBjb3JlIHRocmVhZCB0byBkZWFsIHdpdGgg
Y29yZQ0KPiA+IGhhcmR3YXJlIG1lc3NhZ2UsIGF0IHRoZSBzYW1lIHRpbWUsIGFkZCBtc2cgcXVl
dWUgZm9yIGRpZmZlcmVudCBoYXJkd2FyZQ0KPiA+IHNoYXJlIG1lc3NhZ2VzLiBMYXN0bHksIHRo
ZSBhcmNoaXRlY3R1cmUgb2YgZGlmZmVyZW50IHNwZWNzIGFyZSBub3QgdGhlIHNhbWUsDQo+ID4g
dXNpbmcgc3BlY3MgdHlwZSB0byBzZXBhcmF0ZSB0aGVtLg0KPiA+IA0KPiA+IFRoaXMgc2VyaWVz
IGhhcyBiZWVuIHRlc3RlZCB3aXRoIGJvdGggTVQ4MTgzIGFuZCBNVDgxNzMuIERlY29kaW5nIHdh
cyB3b3JraW5nDQo+ID4gZm9yIGJvdGggY2hpcHMuDQo+IA0KPiBIaSwgSSBhbSBjdXJyZW50bHkg
d29ya2luZyBvbiBzdGFiaWxpemluZyB0aGUgY29kZWMgZHJpdmVycyBvbiBtdDgxNzMgY2hyb21l
b3MNCj4gICBkZXZpY2UgKGVsbSkuIEl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBpZiB5b3UgcHJv
dmlkZSBpbmZvcm1hdGlvbiBvbiBob3cgeW91DQo+IHRlc3RlZCB0aGUgY29kZS4NCj4gRGlkIHlv
dSB0ZXN0IGl0IG9uIGNocm9tZW9zIHVzZXJzcGFjZT8NCj4gRGlkIHlvdSB1c2UgdGhlIHRlc3Qt
dGFzdCBmcmFtZXdvcms/DQo+IFdoYXQgdGVzdHMgZGlkIHlvdSBydW4/DQo+IA0KPiBUaGFua3Ms
DQo+IERhZm5hDQo+IA0KSGkgRGFmbmEsDQoNCkFkZGluZyBjb21wb25lbnQgZnJhbWV3b3JrIGlz
IGp1c3QgdXNlZCBmb3IgbXQ4MTkyIGFuZCBtdDgxOTUuDQpNVDgxNzMgYW5kIE1UODE4MyBzdGls
bCB1c2UgdGhlIHRoZSBvbGRlciBhcmNoaXRlY3R1cmUuIEluIGFub3RoZXIgd2F5LA0KbXQ4MTky
IGFuZCBtdDgxOTUgaXMgc3RhdGVsZXNzIGRlY29kZSwgbXQ4MTczIGlzIHN0YXRlZnVsIGRlY29k
ZSwgaXQgaXMNCmRpZmZlcmVudC4gSSBqdXN0IHBvcnRpbmcgdGhlc2UgcGF0Y2hlcyB0byBtdDgx
NzMgYnJhbmNoLCBhbmQganVzdCBuZWVkDQp0byBkbyBzZXZlcmFsIHNpbXBsZSB0ZXN0Lg0KDQpU
aGFua3MsDQpZdW5mZWkgRG9uZw0KPiA+IA0KPiA+IFBhdGNoZXMgMSwyIHJld3JpdGUgZ2V0IHJl
Z2lzdGVyIGJhc2VzIGFuZCBwb3dlciBvbi9vZmYgaW50ZXJmYWNlLg0KPiA+IA0KPiA+IFBhdGNo
IDMtNSBhZGQgY29tcG9uZW50IGZyYW1ld29yayB0byBzdXBwb3J0IG11bHRpIGhhcmR3YXJlLg0K
PiA+IA0KPiA+IFBhdGNoZXMgNi0xNCBhZGQgaW50ZXJmYWNlcyB0byBzdXBwb3J0IGNvcmUgaGFy
ZHdhcmUuDQo+ID4gLS0tLQ0KPiA+IFRoaXMgcGF0Y2ggZGVwZW5kZW50cyBvbiAibWVkaWE6IG10
ay12Y29kZWM6IHN1cHBvcnQgZm9yIE1UODE4MyBkZWNvZGVyIlsxXS4NCj4gPiANCj4gPiBNdWx0
aSBoYXJkd2FyZSBkZWNvZGUgaXMgYmFzZWQgb24gc3RhdGVsZXNzIGRlY29kZXIsIE1UODE4MyBp
cyB0aGUgZmlyc3QNCj4gPiB0aW1lIHRvIGFkZCBzdGF0ZWxlc3MgZGVjb2Rlci4gT3RoZXJ3aXNl
IGl0IHdpbGwgY2F1c2UgY29uZmxpY3QuDQo+ID4gUGxlYXNlIGFsc28gYWNjZXB0IHRoaXMgcGF0
Y2ggdG9nZXRoZXIgd2l0aCBbMV0uDQo+ID4gDQo+ID4gWzFdaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3Byb2plY3QvbGttbC9saXN0Lz9zZXJpZXM9NTA3MDg0DQo+ID4gLS0tLQ0K
PiA+IA0KPiA+IENoYW5nZXMgY29tcGFyZWQgd2l0aCB2MToNCj4gPiAtIEZpeCBtYW55IGNvbW1l
bnRzIGZvciBwYXRjaCAzLzE0DQo+ID4gLSBSZW1vdmUgdW5uZWNlc3NhcnkgY29kZSBmb3IgcGF0
Y2ggNC8xNA0KPiA+IC0gVXNpbmcgZW51bSBtdGtfdmRlY19od19jb3VudCBpbnN0ZWFkIG9mIG1h
Z2ljIG51bWJlcnMgZm9yIHBhdGNoIDYvMTQNCj4gPiAtIFJlY29uc3RydWN0ZWQgZ2V0L3B1dCBs
YXQgYnVmZmVyIGZvciBsYXQgYW5kIGNvcmUgaGFyZHdhcmUgZm9yIHBhdGNoIDcvMTQNCj4gPiAt
IFVzaW5nIHlhbWwgZm9ybWF0IHRvIGluc3RlYWQgb2YgdHh0IGZpbGUgZm9yIHBhdGNoIDEyLzE0
DQo+ID4gDQo+ID4gWXVuZmVpIERvbmcgKDE0KToNCj4gPiAgICBtZWRpYTogbXRrLXZjb2RlYzog
R2V0IG51bWJlcnMgb2YgcmVnaXN0ZXIgYmFzZXMgZnJvbSBEVA0KPiA+ICAgIG1lZGlhOiBtdGst
dmNvZGVjOiBSZWZhY3RvciB2Y29kZWMgcG0gaW50ZXJmYWNlDQo+ID4gICAgbWVkaWE6IG10ay12
Y29kZWM6IFVzZSBjb21wb25lbnQgZnJhbWV3b3JrIHRvIG1hbmFnZSBlYWNoIGhhcmR3YXJlDQo+
ID4gICAgICBpbmZvcm1hdGlvbg0KPiA+ICAgIGR0LWJpbmRpbmdzOiBtZWRpYTogbXRrLXZjb2Rl
YzogU2VwYXJhdGUgdmlkZW8gZW5jb2RlciBhbmQgZGVjb2Rlcg0KPiA+ICAgICAgZHQtYmluZGlu
Z3MNCj4gPiAgICBtZWRpYTogbXRrLXZjb2RlYzogVXNlIHB1cmUgc2luZ2xlIGNvcmUgZm9yIE1U
ODE4Mw0KPiA+ICAgIG1lZGlhOiBtdGstdmNvZGVjOiBBZGQgaXJxIGludGVyZmFjZSBmb3IgY29y
ZSBoYXJkd2FyZQ0KPiA+ICAgIG1lZGlhOiBtdGstdmNvZGVjOiBBZGQgbXNnIHF1ZXVlIGZlYXR1
cmUgZm9yIGxhdCBhbmQgY29yZSBhcmNoaXRlY3R1cmUNCj4gPiAgICBtZWRpYTogbXRrLXZjb2Rl
YzogR2VuZXJhbGl6ZSBwb3dlciBhbmQgY2xvY2sgb24vb2ZmIGludGVyZmFjZXMNCj4gPiAgICBt
ZWRpYTogbXRrLXZjb2RlYzogQWRkIG5ldyBpbnRlcmZhY2UgdG8gbG9jayBkaWZmZXJlbnQgaGFy
ZHdhcmUNCj4gPiAgICBtZWRpYTogbXRrLXZjb2RlYzogQWRkIGNvcmUgdGhyZWFkDQo+ID4gICAg
bWVkaWE6IG10ay12Y29kZWM6IFN1cHBvcnQgMzRiaXRzIGRtYSBhZGRyZXNzIGZvciB2ZGVjDQo+
ID4gICAgZHQtYmluZGluZ3M6IG1lZGlhOiBtdGstdmNvZGVjOiBBZGRzIGRlY29kZXIgZHQtYmlu
ZGluZ3MgZm9yIG10ODE5Mg0KPiA+ICAgIG1lZGlhOiBtdGstdmNvZGVjOiBBZGQgY29yZSBkZWMg
YW5kIGRlYyBlbmQgaXBpIG1zZw0KPiA+ICAgIG1lZGlhOiBtdGstdmNvZGVjOiBVc2UgY29kZWMg
dHlwZSB0byBzZXBhcmF0ZSBkaWZmZXJlbnQgaGFyZHdhcmUNCj4gPiANCj4gPiAgIC4uLi9tZWRp
YS9tZWRpYXRlay12Y29kZWMtY29tcC1kZWNvZGVyLnlhbWwgICB8IDE1MCArKysrKysrKysNCj4g
PiAgIC4uLnZjb2RlYy50eHQgPT4gbWVkaWF0ZWstdmNvZGVjLWRlY29kZXIudHh0fSB8ICA2MiAr
LS0tDQo+ID4gICAuLi4vbWVkaWEvbWVkaWF0ZWstdmNvZGVjLWVuY29kZXIudHh0ICAgICAgICAg
fCAgNzMgKysrKysNCj4gPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9NYWtl
ZmlsZSAgICB8ICAgMiArDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2RlYy5jICAgICAgfCAgIDQgKy0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192
Y29kZWNfZGVjLmggICAgICB8ICAgMSArDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9t
dGtfdmNvZGVjX2RlY19kcnYuYyAgfCAyOTcgKysrKysrKysrKysrKysrLS0tDQo+ID4gICAuLi4v
cGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19ody5jICAgfCAxOTQgKysrKysrKysr
KysrDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19ody5oICAg
fCAgNTAgKysrDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19w
bS5jICAgfCAgOTggKysrKy0tDQo+ID4gICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19wbS5oICAgfCAgMTMgKy0NCj4gPiAgIC4uLi9tdGstdmNvZGVjL210a192Y29kZWNf
ZGVjX3N0YXRlZnVsLmMgICAgICB8ICAgMSArDQo+ID4gICAuLi4vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19zdGF0ZWxlc3MuYyAgICAgfCAgIDEgKw0KPiA+ICAgLi4uL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kcnYuaCAgICAgIHwgIDcyICsrKystDQo+ID4gICAuLi4vcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19wbS5jICAgfCAgIDEgLQ0KPiA+ICAgLi4uL3Bs
YXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19pbnRyLmMgICAgIHwgIDMyICstDQo+ID4gICAu
Li4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2ludHIuaCAgICAgfCAgIDQgKy0NCj4g
PiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfdXRpbC5jICAgICB8ICA4NyAr
KysrLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY191dGlsLmggICAg
IHwgICA4ICstDQo+ID4gICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjX2Rydl9p
Zi5jICAgfCAgMjEgKy0NCj4gPiAgIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWNf
aXBpX21zZy5oICB8ICAxNiArLQ0KPiA+ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvdmRlY19t
c2dfcXVldWUuYyAgICAgIHwgMjg2ICsrKysrKysrKysrKysrKysrDQo+ID4gICAuLi4vcGxhdGZv
cm0vbXRrLXZjb2RlYy92ZGVjX21zZ19xdWV1ZS5oICAgICAgfCAxNDMgKysrKysrKysrDQo+ID4g
ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjX3ZwdV9pZi5jICAgfCAgNDYgKyst
DQo+ID4gICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjX3ZwdV9pZi5oICAgfCAg
MjIgKysNCj4gPiAgIDI1IGZpbGVzIGNoYW5nZWQsIDE1MTYgaW5zZXJ0aW9ucygrKSwgMTY4IGRl
bGV0aW9ucygtKQ0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMtY29tcC1kZWNvZGVyLnlhbWwNCj4g
PiAgIHJlbmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEve21lZGlh
dGVrLXZjb2RlYy50eHQgPT4gbWVkaWF0ZWstdmNvZGVjLWRlY29kZXIudHh0fSAoNTYlKQ0KPiA+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9tZWRpYXRlay12Y29kZWMtZW5jb2Rlci50eHQNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfaHcuYw0K
PiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2RlY19ody5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWNfbXNnX3F1ZXVlLmMNCj4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlY19tc2dfcXVl
dWUuaA0KPiA+IA0KDQo=

