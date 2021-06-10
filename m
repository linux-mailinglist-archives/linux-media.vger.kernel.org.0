Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB2E3A2AF8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 14:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFJMER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 08:04:17 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:2897 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230136AbhFJMEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 08:04:13 -0400
X-UUID: 34cfeea152144764869170dcd899cd94-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nqdoQ9Nvfzyjq8sKsY1fXodFn06TJLmPAimZ1WxAizs=;
        b=mF0lGPQEXi5KMZnS+yhgKQ34FvHA8Zn9gyNv2nX4/QE4Mm/dIpRI2lAWerYELTw7UTKKIQyqvrakfQnQCYHok97VaD/zYiOVxY3Jz32F+MullAflSfuqvYKEOjE8Nyb+iTYLkNW8EcbMSp+NYmziHmlYkvx2NFHDv60U75ZxKYE=;
X-UUID: 34cfeea152144764869170dcd899cd94-20210610
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <yong.wu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1285583454; Thu, 10 Jun 2021 20:02:11 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Jun
 2021 20:02:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Jun 2021 20:02:08 +0800
Message-ID: <1623326528.23717.20.camel@mhfsdcap03>
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From:   Yong Wu <yong.wu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>
CC:     Hsin-Yi Wang <hsinyi@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Evan Green" <evgreen@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Tomasz Figa" <tfiga@chromium.org>,
        Will Deacon <will.deacon@arm.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        Devicetree List <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>, <anan.sun@mediatek.com>,
        <chao.hao@mediatek.com>, <ming-fan.chen@mediatek.com>,
        <yi.kuo@mediatek.com>, <eizan@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Irui Wang <irui.wang@mediatek.com>,
        <linux-media@vger.kernel.org>
Date:   Thu, 10 Jun 2021 20:02:08 +0800
In-Reply-To: <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
         <20210410091128.31823-14-yong.wu@mediatek.com>
         <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
         <1620822547.2983.8.camel@mhfsdcap03>
         <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 31E46F2F90E698D9BE899FE64F40478A92B3CBEC8E1364ECF9F19623C746B6C02000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDIxLTA2LTEwIGF0IDA5OjUzICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiBIaSBZb25nLA0KPiANCj4gT24gMTIvMDUvMjAyMSAxNDoyOSwgWW9uZyBXdSB3cm90ZToN
Cj4gPiBPbiBXZWQsIDIwMjEtMDUtMTIgYXQgMTc6MjAgKzA4MDAsIEhzaW4tWWkgV2FuZyB3cm90
ZToNCj4gPj4gT24gU2F0LCBBcHIgMTAsIDIwMjEgYXQgNToxNCBQTSBZb25nIFd1IDx5b25nLnd1
QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4+Pg0KPiA+Pj4gTWVkaWFUZWsgSU9NTVUgaGFzIGFs
cmVhZHkgYWRkZWQgdGhlIGRldmljZV9saW5rIGJldHdlZW4gdGhlIGNvbnN1bWVyDQo+ID4+PiBh
bmQgc21pLWxhcmIgZGV2aWNlLiBJZiB0aGUgdmNvZGVjIGRldmljZSBjYWxsIHRoZSBwbV9ydW50
aW1lX2dldF9zeW5jLA0KPiA+Pj4gdGhlIHNtaS1sYXJiJ3MgcG1fcnVudGltZV9nZXRfc3luYyBh
bHNvIGJlIGNhbGxlZCBhdXRvbWF0aWNhbGx5Lg0KPiA+Pj4NCj4gPj4+IENDOiBUaWZmYW55IExp
biA8dGlmZmFueS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+Pj4gQ0M6IElydWkgV2FuZyA8aXJ1aS53
YW5nQG1lZGlhdGVrLmNvbT4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlvbmcud3VA
bWVkaWF0ZWsuY29tPg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IEV2YW4gR3JlZW4gPGV2Z3JlZW5AY2hy
b21pdW0ub3JnPg0KPiA+Pj4gQWNrZWQtYnk6IFRpZmZhbnkgTGluIDx0aWZmYW55LmxpbkBtZWRp
YXRlay5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtf
dmNvZGVjX2RlY19wbS5jICAgfCAzNyArKy0tLS0tLS0tLS0tLS0NCj4gPj4+ICAuLi4vcGxhdGZv
cm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oICAgICAgfCAgMyAtLQ0KPiA+Pj4gIC4uLi9w
bGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgICAgICB8ICAxIC0NCj4gPj4+ICAu
Li4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19wbS5jICAgfCA0NiArKy0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3
NyBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBbLi4uXQ0KPiA+IA0KPiA+Pj4gQEAgLTEwOCwxMyAr
ODAsNiBAQCB2b2lkIG10a192Y29kZWNfZW5jX2Nsb2NrX29uKHN0cnVjdCBtdGtfdmNvZGVjX3Bt
ICpwbSkNCj4gPj4+ICAgICAgICAgICAgICAgICB9DQo+ID4+PiAgICAgICAgIH0NCj4gPj4+DQo+
ID4+PiAtICAgICAgIHJldCA9IG10a19zbWlfbGFyYl9nZXQocG0tPmxhcmJ2ZW5jKTsNCj4gPj4+
IC0gICAgICAgaWYgKHJldCkgew0KPiA+Pj4gLSAgICAgICAgICAgICAgIG10a192NGwyX2Vycigi
bXRrX3NtaV9sYXJiX2dldCBsYXJiMyBmYWlsICVkIiwgcmV0KTsNCj4gPj4+IC0gICAgICAgICAg
ICAgICBnb3RvIGNsa2VycjsNCj4gPj4+IC0gICAgICAgfQ0KPiA+Pj4gLSAgICAgICByZXR1cm47
DQo+ID4+DQo+ID4+IFlvdSBjYW4ndCBkZWxldGUgdGhlIHJldHVybjsgaGVyZSwgb3RoZXJ3aXNl
IHZjb2RlY19jbGsgd2lsbCBiZSB0dXJuZWQNCj4gPj4gb2ZmIGltbWVkaWF0ZWx5IGFmdGVyIHRo
ZXkgYXJlIHR1cm5lZCBvbi4NCj4gPiANCj4gPiBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIHJl
dmlldy4NCj4gPiANCj4gPiBTb3JyeSBmb3IgdGhpcy4gWW91IGFyZSBxdWl0ZSByaWdodC4NCj4g
PiANCj4gPiBJIGNoZWNrZWQgdGhpcywgaXQgd2FzIGludHJvZHVjZWQgaW4gdjQgd2hlbiBJIHJl
YmFzZSB0aGUgY29kZS4gSSB3aWxsDQo+ID4gZml4IGl0IGluIG5leHQgdGltZS4NCj4gPiANCj4g
DQo+IFBsZWFzZSBhbHNvIG1ha2Ugc3VyZSB0aGF0IHlvdSBhZGQgYWxsIG1haW50YWluZXJzLiBJ
IHJlYWxpemVkIHRoYXQgYXQgbGVhc3QgZm9yDQo+IHRoZSBtZWRpYS9wbGF0Zm9ybSBkcml2ZXJz
IHdlIG1pc3MgdGhlIG1haW50YWluZXIgYW5kIHRoZSBjb3JyZXNwb25kaW5nIG1haWxpbmcNCj4g
bGlzdC4NCj4gVGhpcyBpcyBlc3BlY2lhbGx5IGltcG9ydGFudCBpbiB0aGlzIHNlcmllcywgYXMg
aXQgc3BhbnMgc2V2ZXJhbCBzdWJzeXN0ZW1zLg0KDQpUaGFua3MgZm9yIGhpbnQuIEkgb25seSBh
ZGRlZCB0aGUgZmlsZSBtYWludGFpbmVyIGhlcmUuIEkgd2lsbCBhZGQNCmxpbnV4LW1lZGlhIGlu
IG5leHQgdmVyc2lvbi4NCg0KQnkgdGhlIHdheSwgdGhpcyBwYXRjaHNldCBjcm9zcyBzZXZlcmFs
IHRyZWVzLCB0aGVuIHdoaWNoIHRyZWUgc2hvdWxkIGl0DQpnbyB0aHJvdWdoLiBEbyB5b3UgaGF2
ZSBzb21lIHN1Z2dlc3Rpb24/DQoNCj4gDQo+IFRoYW5rcyBhIGxvdCwNCj4gTWF0dGhpYXMNCj4g
DQo+ID4+DQo+ID4+PiAtDQo+ID4+PiAgY2xrZXJyOg0KPiA+Pj4gICAgICAgICBmb3IgKGkgLT0g
MTsgaSA+PSAwOyBpLS0pDQo+ID4+PiAgICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGVuY19jbGstPmNsa19pbmZvW2ldLnZjb2RlY19jbGspOw0KPiA+Pj4gQEAgLTEyNSw3ICs5
MCw2IEBAIHZvaWQgbXRrX3Zjb2RlY19lbmNfY2xvY2tfb2ZmKHN0cnVjdCBtdGtfdmNvZGVjX3Bt
ICpwbSkNCj4gPj4+ICAgICAgICAgc3RydWN0IG10a192Y29kZWNfY2xrICplbmNfY2xrID0gJnBt
LT52ZW5jX2NsazsNCj4gPj4+ICAgICAgICAgaW50IGkgPSAwOw0KPiA+Pj4NCj4gPj4+IC0gICAg
ICAgbXRrX3NtaV9sYXJiX3B1dChwbS0+bGFyYnZlbmMpOw0KPiA+Pj4gICAgICAgICBmb3IgKGkg
PSBlbmNfY2xrLT5jbGtfbnVtIC0gMTsgaSA+PSAwOyBpLS0pDQo+ID4+PiAgICAgICAgICAgICAg
ICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGVuY19jbGstPmNsa19pbmZvW2ldLnZjb2RlY19jbGsp
Ow0KPiA+Pj4gIH0NCj4gPj4+IC0tDQo+ID4+PiAyLjE4LjANCj4gPj4+DQo+ID4gDQoNCg==

