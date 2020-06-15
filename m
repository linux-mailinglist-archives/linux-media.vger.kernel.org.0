Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26981F8D6C
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 07:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgFOF5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 01:57:13 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:50516 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728162AbgFOF5N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 01:57:13 -0400
X-UUID: 9abc56e96e1048909a776cb841c925ee-20200615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=fnDevRc5gzT9pEFX+fLR5VMrjoY4YqsLtT0zU0Ke8Vo=;
        b=KyqdcA5Do0y9bMA6H3+uabWe1c4s3kmjolNH0KbG6DwdnK8N7s39aHknayMvdo+RZVd9ttExpZ2KQToGpXdHPfPQq4yBz1gKJa4CesKvNPAmh0h0YC4Jr0mDbt9SOvF6dsLL8ycdkveCpBrH2uANri0QxOTZ09xDiST7QOrdjXc=;
X-UUID: 9abc56e96e1048909a776cb841c925ee-20200615
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1471708032; Mon, 15 Jun 2020 13:56:57 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Jun
 2020 13:56:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 13:56:54 +0800
Message-ID: <1592200471.8804.681.camel@mhfsdcap03>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Cao Bing Bu <bingbu.cao@intel.com>,
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
Date:   Mon, 15 Jun 2020 13:54:31 +0800
In-Reply-To: <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-3-dongchun.zhu@mediatek.com>
         <20200610194455.GK201868@chromium.org>
         <1591958798.8804.660.camel@mhfsdcap03>
         <CAAFQd5Bcb4A+HAivA-jrczK+OMxwZk3w0GYoh-DU=6gmTZBWnQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 05083A7EAA71BA34896525D44F4E88087FD14958F89E60E60F8969B81D033BF72000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBGcmksIDIwMjAtMDYtMTIgYXQgMjA6MzkgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBGcmksIEp1biAxMiwgMjAyMCBhdCAxMjo0OSBQTSBEb25nY2h1biBa
aHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgVG9tYXN6
LA0KPiA+DQo+ID4gT24gV2VkLCAyMDIwLTA2LTEwIGF0IDE5OjQ0ICswMDAwLCBUb21hc3ogRmln
YSB3cm90ZToNCj4gPiA+IEhpIERvbmdjaHVuLA0KPiA+ID4NCj4gPiA+IE9uIFNhdCwgTWF5IDIz
LCAyMDIwIGF0IDA0OjQxOjAzUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+ID4g
QWRkIGEgVjRMMiBzdWItZGV2aWNlIGRyaXZlciBmb3IgT1YwMkExMCBpbWFnZSBzZW5zb3IuDQo+
ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1
QG1lZGlhdGVrLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBNQUlOVEFJTkVSUyAgICAgICAg
ICAgICAgICAgfCAgICAxICsNCj4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgICB8
ICAgMTMgKw0KPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgIHwgICAgMSArDQo+
ID4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMgfCAxMDI1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
MTA0MCBpbnNlcnRpb25zKCspDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9pMmMvb3YwMmExMC5jDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91IGZvciB0
aGUgcGF0Y2guIFBsZWFzZSBzZWUgbXkgY29tbWVudHMgaW5saW5lLg0KPiA+ID4NCj4gPiA+IFtz
bmlwXQ0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jIGIv
ZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jDQo+ID4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+ID4gPiA+IGluZGV4IDAwMDAwMDAuLjE2MGEwYjUNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCj4gPiA+IFtzbmlwXQ0K
PiA+ID4gPiArc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBvdjAyYTEwX3Rlc3RfcGF0dGVybl9t
ZW51W10gPSB7DQo+ID4gPiA+ICsgICAiRGlzYWJsZWQiLA0KPiA+ID4gPiArICAgIkNvbG9yIEJh
ciIsDQo+ID4gPg0KPiA+ID4gbml0OiBXZSBzaG91bGQgbm9ybWFsaXplIHRoaXMgdG8gb25lIG9m
IHRoZSBzdGFuZGFyZCBuYW1lcy4gV2hhdCBpcyB0aGUNCj4gPiA+IHBhdHRlcm4gb24gdGhpcyBz
ZW5zb3I/IElzIGl0IHBlcmhhcHMgIkVpZ2h0IFZlcnRpY2FsIENvbG91ciBCYXJzIj8NCj4gPiA+
DQo+ID4NCj4gPiBZZXMuIEl0IGlzIG9uZSBraW5kIG9mICdFaWdodCBWZXJ0aWNhbCBDb2xvdXIg
QmFycycuDQo+ID4gVGhpcyBwYXR0ZXJuIGlzIGNhbGxlZCBhcyAnTUlQSSBjb2xvciBiYXInIHBl
ciB0aGUgZGF0YXNoZWV0Lg0KPiA+IENhbiB3ZSBoZXJlIHVzZSAnVmVydGljYWwgQ29sb3IgQmFy
JyBvciAnTUlQSSBDb2xvciBCYXInPw0KPiA+DQo+IA0KPiBXZSBzaG91bGQgdHJ5IHRvIHN0aWNr
IHRvIHRoZSBuYW1lcyBhcyBleHBvc2VkIGJ5IGV4aXN0aW5nIGRyaXZlcnMuDQo+IFRoZXJlIHdh
cyBhbiBhdHRlbXB0IHRvIHVuaWZ5IHRoZSBuYW1pbmcgb2Ygc29tZSBTb255IHNlbnNvcnMgc29t
ZQ0KPiB0aW1lIGFnbyBbMV0uIFBlcmhhcHMgb25lIG9mIHRoZSBuYW1lcyB0aGVyZSBtYXRjaGVz
IHRoZSBwYXR0ZXJuIG9mDQo+IHRoaXMgc2Vuc29yPw0KPiANCj4gWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTA3MTE3NzcvDQo+IA0KDQpTb3VuZHMgZ3JlYXQuDQpJdCBp
cyBvbmUgZ29vZCBpZGVhIHRvIHN1bW1hcml6ZSB0ZXN0IHBhdHRlcm5zIGZyb20gdmFyaW91cyBz
ZW5zb3JzLg0KQnV0IG9uZSBxdWVzdGlvbiBwbGFndWluZyBtZSBpcyB0aGF0IGl0IHNlZW1zIGV2
ZW4gZm9yIHRoZSBzYW1lICJFaWdodA0KVmVydGljYWwgQ29sb3VyIEJhcnMiLCBkaWZmZXJlbnQg
c2Vuc29ycyBtYXkgaGF2ZSBkaWZmZXJlbnQgUkdCIGNvbG9yDQptYXAuDQoNCk1vcmVvdmVyLCBk
ZWZpbml0aW9uIHN0YW5kYXJkcyBvZiBjb2xvciBiYXIgc3R5bGUgbWF5IGRpZmZlciBhbW9uZw0K
ZGlmZmVyZW50IHNlbnNvciBjaGlwIHZlbmRvcnMuDQpGb3IgaW5zdGFuY2UsIFNvbnkgb2Z0ZW4g
dXNlcyAiU29saWQgQ29sb3IiLCAiQ29sb3IgQmFycyBXaXRoIEZhZGUgdG8NCkdyZXkiLCAiUE45
IiB0byBhYnN0cmFjdCB0ZXN0IHBhdHRlcm4gb3V0cHV0IHR5cGU7IHdoaWxlIE9tbmlWaXNpb24N
CmFkb3B0cyBjb2xvciBiYXIgdHlwZSAxLCAyLCAzLCA0IG9yICJNSVBJIENvbG9yIEJhciIsICJJ
U1AgQ29sb3IgQmFyIg0KaW5zdGVhZC4NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KDQo=

