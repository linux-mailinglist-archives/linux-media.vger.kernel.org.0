Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11E4F1E3D0E
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 11:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388408AbgE0JDp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 05:03:45 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:5490 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388112AbgE0JDp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 05:03:45 -0400
X-UUID: dc76f055e9e34676ab08348b9857dd26-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=niIGUTjMuwM6Dzf6Aan1ADPLP3BVHBCxpGmXP1NJl2E=;
        b=JNNHgxvdyaaY1E4KFGIN+iIuH39MdujciautPSaRta1Fms+78ZhpRWwlLkNPqPuubVmWPdNfdje1sg/Qqmxf8qj62ZEiE6yzl3S4jaLswbleEVeQcYsfQ3Qd+h76huQMd48qTeGmcE45H8B+hoLX4gI2DjGp/5j1UwdRjoBJQC0=;
X-UUID: dc76f055e9e34676ab08348b9857dd26-20200527
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 239943338; Wed, 27 May 2020 17:03:35 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 27 May
 2020 17:03:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 May 2020 17:03:13 +0800
Message-ID: <1590570089.8804.453.camel@mhfsdcap03>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
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
Date:   Wed, 27 May 2020 17:01:29 +0800
In-Reply-To: <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
         <20200518132731.20855-3-dongchun.zhu@mediatek.com>
         <20200521195113.GC14214@chromium.org>
         <1590139561.8804.390.camel@mhfsdcap03>
         <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C6DAD625A2A8FEE655D867D0563F7BB4655DD51B1E8845A1432CFAC0ED8261322000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBNb24sIDIwMjAtMDUtMjUgYXQgMTM6NDUgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBGcmksIE1heSAyMiwgMjAyMCBhdCAxMToyNyBBTSBEb25nY2h1biBa
aHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgVG9tYXN6
LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBNeSByZXBsaWVzIGFyZSBhcyBiZWxv
dy4NCj4gPg0KPiA+IE9uIFRodSwgMjAyMC0wNS0yMSBhdCAxOTo1MSArMDAwMCwgVG9tYXN6IEZp
Z2Egd3JvdGU6DQo+ID4gPiBIaSBEb25nY2h1biwgU2FrYXJpLA0KPiA+ID4NCj4gPiA+IE9uIE1v
biwgTWF5IDE4LCAyMDIwIGF0IDA5OjI3OjMxUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToN
Cj4gW3NuaXBdDQo+ID4gPiA+ICsgICBwbV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ID4gPiAr
ICAgaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkgew0KPiA+ID4gPiArICAgICAgICAgICBy
ZXQgPSBkdzk3NjhfcnVudGltZV9yZXN1bWUoZGV2KTsNCj4gPiA+ID4gKyAgICAgICAgICAgaWYg
KHJldCA8IDApIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZh
aWxlZCB0byBwb3dlciBvbjogJWRcbiIsIHJldCk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgZ290byBlbnRpdHlfY2xlYW51cDsNCj4gPiA+ID4gKyAgICAgICAgICAgfQ0KPiA+ID4gPiAr
ICAgfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICByZXQgPSB2NGwyX2FzeW5jX3JlZ2lzdGVyX3N1
YmRldigmZHc5NzY4LT5zZCk7DQo+ID4gPiA+ICsgICBpZiAocmV0IDwgMCkNCj4gPiA+ID4gKyAg
ICAgICAgICAgZ290byBlbnRpdHlfY2xlYW51cDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgcmV0
dXJuIDA7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK2VudGl0eV9jbGVhbnVwOg0KPiA+ID4NCj4gPiA+
IE5lZWQgdG8gcG93ZXIgb2ZmIGlmIHRoZSBjb2RlIGFib3ZlIHBvd2VyZWQgb24uDQo+ID4gPg0K
PiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQo+ID4gSWYgdGhlcmUgaXMgc29tZXRo
aW5nIHdyb25nIHdpdGggcnVudGltZSBQTSwgYWN0dWF0b3IgaXMgdG8gYmUgcG93ZXJlZA0KPiA+
IG9uIHZpYSBkdzk3NjhfcnVudGltZV9yZXN1bWUoKSBBUEkuDQo+ID4gV2hlbiBhY3R1YXRvciBz
dWItZGV2aWNlIGlzIHBvd2VyZWQgb24gY29tcGxldGVseSBhbmQgYXN5bmMgcmVnaXN0ZXJlZA0K
PiA+IHN1Y2Nlc3NmdWxseSwgd2Ugc2hhbGwgcG93ZXIgb2ZmIGl0IGFmdGVyd2FyZHMuDQo+ID4N
Cj4gDQo+IFRoZSBjb2RlIGFib3ZlIGNhbGxzIGR3OTc2OF9ydW50aW1lX3Jlc3VtZSgpIGlmDQo+
ICFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSwgYnV0IHRoZSBjbGVhbi11cCBjb2RlIGJlbG93IHRo
ZQ0KPiBlbnRpdHlfY2xlYW51cCBsYWJlbCBkb2Vzbid0IGhhdmUgdGhlIGNvcnJlc3BvbmRpbmcN
Cj4gZHc5NzY4X3J1bnRpbWVfc3VzcGVuZCgpIGNhbGwuDQo+IA0KDQpEaWQgeW91IG1lYW4gdGhl
ICdlbnRpdHlfY2xlYW51cCcgYWZ0ZXIgdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoKT8NCkFj
dHVhbGx5IEkgbWFkZSBzb21lIGNoYW5nZXMgZm9yIE9WMDJBIFY5LCBhY2NvcmRpbmcgdG8gdGhp
cyBjb21tZW50Lg0KQ291bGQgeW91IGhlbHAgcmV2aWV3IHRoYXQgY2hhbmdlPyBUaGFua3MuDQoN
Cj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

