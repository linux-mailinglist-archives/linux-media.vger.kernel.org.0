Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A663998C1
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 05:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCD5a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 23:57:30 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:35856 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229553AbhFCD53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 23:57:29 -0400
X-UUID: b78cd8cfc02548399cfce42d03739b2d-20210603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=hJQJVtfWs3taTeNFrzIry6OR+myqkplM/O272A0KfOk=;
        b=GInvq07l94bMgKnSLlXrYupx4pG9GJJ2v6uLxqMWbPAOsZdyrZi7ERDYx9QjXDEGIAtnMphcx61XinMhOM36Hgh6UXA2gz5WfCAEUtHINKx/T2VVygQCexk0r5uTZFC63O0EE4AuPyNDOEJPzj8/Ou3btyik9sNvhSzYGU6aCxE=;
X-UUID: b78cd8cfc02548399cfce42d03739b2d-20210603
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1061075213; Thu, 03 Jun 2021 11:55:41 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Jun
 2021 11:55:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Jun 2021 11:55:34 +0800
Message-ID: <1622692534.28790.4.camel@mhfsdcap03>
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
From:   Irui Wang <irui.wang@mediatek.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        "Longfei Wang" <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        "Yunfei Dong" <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Thu, 3 Jun 2021 11:55:34 +0800
In-Reply-To: <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
         <20210521070139.20644-6-irui.wang@mediatek.com>
         <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 01C8CE8F446CD0E2ED0DB8CF07CB6F7D203A7F72CD36341BE9C7A3056A86438F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCk9uIEZyaSwgMjAyMS0wNS0yOCBhdCAwODoyNyArMDMwMCwgRGFmbmEgSGlyc2NoZmVs
ZCB3cm90ZToNCj4gSGkNCj4gDQo+IE9uIDIxLjA1LjIxIDEwOjAxLCBJcnVpIFdhbmcgd3JvdGU6
DQo+ID4gQWRkIE1UODE5MiB2ZW5jIGRyaXZlcidzIGNvbXBhdGlibGUgYW5kIGRldmljZSBwcml2
YXRlIGRhdGEuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSXJ1aSBXYW5nIDxpcnVpLndhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dmNvZGVjL210a192Y29kZWNfZHJ2LmggfCAgMSArDQo+ID4gICAuLi4vbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ID4g
ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmggYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiA+IGlu
ZGV4IGQwM2NjYTk1ZTk5Yi4uMTQ4OTNkMjc3YmI4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gPiBAQCAt
MzAyLDYgKzMwMiw3IEBAIHN0cnVjdCBtdGtfdmNvZGVjX2N0eCB7DQo+ID4gICBlbnVtIG10a19j
aGlwIHsNCj4gPiAgIAlNVEtfTVQ4MTczLA0KPiA+ICAgCU1US19NVDgxODMsDQo+ID4gKwlNVEtf
TVQ4MTkyLA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICAgLyoqDQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiA+
IGluZGV4IDI2YjA4OWU4MTIxMy4uNzhmM2RkMTY2OTE3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19kcnYu
Yw0KPiA+IEBAIC00MjUsMTIgKzQyNSwyNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a192Y29k
ZWNfZW5jX3BkYXRhIG10ODE4M19wZGF0YSA9IHsNCj4gPiAgIAkuY29yZV9pZCA9IFZFTkNfU1lT
LA0KPiA+ICAgfTsNCj4gPiAgIA0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a192Y29kZWNf
ZW5jX3BkYXRhIG10ODE5Ml9wZGF0YSA9IHsNCj4gPiArCS5jaGlwID0gTVRLX01UODE5MiwNCj4g
PiArCS51c2VzX2V4dCA9IHRydWUsDQo+ID4gKwkvKiBNVDgxOTIgc3VwcG9ydHMgdGhlIHNhbWUg
Y2FwdHVyZSBmb3JtYXRzIGFzIE1UODE4MyovDQo+IA0KPiBtaXNzaW5nIHNwYWNlIGJlZm9yZSAn
Ki8nDQo+IA0KPiA+ICsJLmNhcHR1cmVfZm9ybWF0cyA9IG10a192aWRlb19mb3JtYXRzX2NhcHR1
cmVfbXQ4MTgzLA0KPiA+ICsJLm51bV9jYXB0dXJlX2Zvcm1hdHMgPSBBUlJBWV9TSVpFKG10a192
aWRlb19mb3JtYXRzX2NhcHR1cmVfbXQ4MTgzKSwNCj4gPiArCS8qIE1UODE5MiBzdXBwb3J0cyB0
aGUgc2FtZSBvdXRwdXQgZm9ybWF0cyBhcyBNVDgxNzMgKi8NCj4gPiArCS5vdXRwdXRfZm9ybWF0
cyA9IG10a192aWRlb19mb3JtYXRzX291dHB1dF9tdDgxNzMsDQo+ID4gKwkubnVtX291dHB1dF9m
b3JtYXRzID0gQVJSQVlfU0laRShtdGtfdmlkZW9fZm9ybWF0c19vdXRwdXRfbXQ4MTczKSwNCj4g
DQo+IElmIGFsbCB0aHJlZSBtb2RlbHMgbXQ4MTczLCBtdDgxODMgYW5kIG10ODE5MiBzdXBwb3J0
IHRoZSBzYW1lIGZvcm1hdHMgdGhlbg0KPiB3ZSBzaG91bGQgcHJvYmFibHkgbm90IG5hbWUgdGhl
IHN0cnVjdHMgYWNjb3JkaW5nIHRvIG9uZSBvZiB0aGUgbW9kZWxzLCBzbyBtYXliZToNCj4gDQo+
IHMvbXRrX3ZpZGVvX2Zvcm1hdHNfY2FwdHVyZV9tdDgxODMvbXRrX3ZpZGVvX2Zvcm1hdHNfY2Fw
dHVyZS8NCj4gcy9tdGtfdmlkZW9fZm9ybWF0c19vdXRwdXRfbXQ4MTczL210a192aWRlb19mb3Jt
YXRzX291dHB1dC8NCj4gDQo+IG9yIHNvbWUgb3RoZXIgbmFtaW5nDQo+IA0KPiBUaGFua3MsDQo+
IERhZm5hDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIGNvbW1lbnRzLCB3ZSB3aWxsIHJl
bmFtZSB0aGVzZSBpbiBhbm90aGVyDQpwYXRjaHNldCwgdGhpcyBwYXRjaHNldCBqdXN0IGZvciBN
VDgxOTIgbm93Lg0KPiANCj4gDQo+ID4gKwkubWluX2JpdHJhdGUgPSA2NCwNCj4gPiArCS5tYXhf
Yml0cmF0ZSA9IDEwMDAwMDAwMCwNCj4gPiArCS5jb3JlX2lkID0gVkVOQ19TWVMsDQo+ID4gK307
DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdGtfdmNvZGVjX2VuY19t
YXRjaFtdID0gew0KPiA+ICAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtdmNvZGVj
LWVuYyIsDQo+ID4gICAJCQkuZGF0YSA9ICZtdDgxNzNfYXZjX3BkYXRhfSwNCj4gPiAgIAl7LmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXZjb2RlYy1lbmMtdnA4IiwNCj4gPiAgIAkJCS5k
YXRhID0gJm10ODE3M192cDhfcGRhdGF9LA0KPiA+ICAgCXsuY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxODMtdmNvZGVjLWVuYyIsIC5kYXRhID0gJm10ODE4M19wZGF0YX0sDQo+ID4gKwl7LmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXZjb2RlYy1lbmMiLCAuZGF0YSA9ICZtdDgxOTJf
cGRhdGF9LA0KPiA+ICAgCXt9LA0KPiA+ICAgfTsNCj4gPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIG10a192Y29kZWNfZW5jX21hdGNoKTsNCj4gPiANCg0K

