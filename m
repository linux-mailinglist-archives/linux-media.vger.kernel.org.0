Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2211F1EDB3C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 04:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgFDCfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 22:35:50 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:61819 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726047AbgFDCfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Jun 2020 22:35:50 -0400
X-UUID: a49d46d224d14aada21dbf21a3a30361-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=SuYNiPB5NMghHlkxCe+dQYVYe8ChAYf4pPTeZHrmuOY=;
        b=cxWmki0HYq5dTH7OE36wYaWDVyjQa2U44HAOaO3FE5USytxAnE+y0NAV5k37tr2j/BfL0U/bzlqBGYulhbWhGEfDP9HmHS0c72Hzh33XnO4C1kcELbjb2cQNIa0YjJVZJUX23CDX35yflbrmS8H4LyGad3l+J8YfJB0Vx4Xkw58=;
X-UUID: a49d46d224d14aada21dbf21a3a30361-20200604
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 91782993; Thu, 04 Jun 2020 10:35:41 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 4 Jun
 2020 10:35:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 10:35:40 +0800
Message-ID: <1591238018.8804.555.camel@mhfsdcap03>
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
Date:   Thu, 4 Jun 2020 10:33:38 +0800
In-Reply-To: <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
         <20200518132731.20855-3-dongchun.zhu@mediatek.com>
         <20200521195113.GC14214@chromium.org>
         <1590139561.8804.390.camel@mhfsdcap03>
         <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
         <1590570089.8804.453.camel@mhfsdcap03>
         <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F86C0FCDB567B5C188A65FAB2CBC0E5B52353EFA00CBAB634B239ED5B17F119F2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LA0KDQpPbiBNb24sIDIwMjAtMDYtMDEgYXQgMjA6NDcgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiBPbiBXZWQsIE1heSAyNywgMjAyMCBhdCAxMTowMyBBTSBEb25nY2h1biBa
aHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgVG9tYXN6
LA0KPiA+DQo+ID4gT24gTW9uLCAyMDIwLTA1LTI1IGF0IDEzOjQ1ICswMjAwLCBUb21hc3ogRmln
YSB3cm90ZToNCj4gPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDExOjI3IEFNIERvbmdjaHVu
IFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+
IEhpIFRvbWFzeiwNCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBNeSBy
ZXBsaWVzIGFyZSBhcyBiZWxvdy4NCj4gPiA+ID4NCj4gPiA+ID4gT24gVGh1LCAyMDIwLTA1LTIx
IGF0IDE5OjUxICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiBIaSBEb25nY2h1
biwgU2FrYXJpLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjAgYXQg
MDk6Mjc6MzFQTSArMDgwMCwgRG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+ID4gW3NuaXBdDQo+ID4g
PiA+ID4gPiArICAgcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiA+ID4gPiA+ICsgICBpZiAo
IXBtX3J1bnRpbWVfZW5hYmxlZChkZXYpKSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICByZXQg
PSBkdzk3NjhfcnVudGltZV9yZXN1bWUoZGV2KTsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAgIGlm
IChyZXQgPCAwKSB7DQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAiZmFpbGVkIHRvIHBvd2VyIG9uOiAlZFxuIiwgcmV0KTsNCj4gPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgZ290byBlbnRpdHlfY2xlYW51cDsNCj4gPiA+ID4gPiA+ICsgICAgICAgICAg
IH0NCj4gPiA+ID4gPiA+ICsgICB9DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiArICAgcmV0
ID0gdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoJmR3OTc2OC0+c2QpOw0KPiA+ID4gPiA+ID4g
KyAgIGlmIChyZXQgPCAwKQ0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgZ290byBlbnRpdHlfY2xl
YW51cDsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsgICByZXR1cm4gMDsNCj4gPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiA+ICtlbnRpdHlfY2xlYW51cDoNCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IE5lZWQgdG8gcG93ZXIgb2ZmIGlmIHRoZSBjb2RlIGFib3ZlIHBvd2VyZWQgb24uDQo+ID4gPiA+
ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQo+ID4gPiA+IElm
IHRoZXJlIGlzIHNvbWV0aGluZyB3cm9uZyB3aXRoIHJ1bnRpbWUgUE0sIGFjdHVhdG9yIGlzIHRv
IGJlIHBvd2VyZWQNCj4gPiA+ID4gb24gdmlhIGR3OTc2OF9ydW50aW1lX3Jlc3VtZSgpIEFQSS4N
Cj4gPiA+ID4gV2hlbiBhY3R1YXRvciBzdWItZGV2aWNlIGlzIHBvd2VyZWQgb24gY29tcGxldGVs
eSBhbmQgYXN5bmMgcmVnaXN0ZXJlZA0KPiA+ID4gPiBzdWNjZXNzZnVsbHksIHdlIHNoYWxsIHBv
d2VyIG9mZiBpdCBhZnRlcndhcmRzLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFRoZSBjb2RlIGFi
b3ZlIGNhbGxzIGR3OTc2OF9ydW50aW1lX3Jlc3VtZSgpIGlmDQo+ID4gPiAhcG1fcnVudGltZV9l
bmFibGVkKGRldiksIGJ1dCB0aGUgY2xlYW4tdXAgY29kZSBiZWxvdyB0aGUNCj4gPiA+IGVudGl0
eV9jbGVhbnVwIGxhYmVsIGRvZXNuJ3QgaGF2ZSB0aGUgY29ycmVzcG9uZGluZw0KPiA+ID4gZHc5
NzY4X3J1bnRpbWVfc3VzcGVuZCgpIGNhbGwuDQo+ID4gPg0KPiA+DQo+ID4gRGlkIHlvdSBtZWFu
IHRoZSAnZW50aXR5X2NsZWFudXAnIGFmdGVyIHY0bDJfYXN5bmNfcmVnaXN0ZXJfc3ViZGV2KCk/
DQo+IA0KPiBZZXMuDQo+IA0KPiA+IEFjdHVhbGx5IEkgbWFkZSBzb21lIGNoYW5nZXMgZm9yIE9W
MDJBIFY5LCBhY2NvcmRpbmcgdG8gdGhpcyBjb21tZW50Lg0KPiA+IENvdWxkIHlvdSBoZWxwIHJl
dmlldyB0aGF0IGNoYW5nZT8gVGhhbmtzLg0KPiANCj4gU3VyZSwgSSB3aWxsIHRha2UgYSBsb29r
Lg0KPiANCg0KVGhhbmtzLg0KU29ycnksIEkganVzdCB3YW5uYSBtYWtlIHN1cmUgdGhlIGNoYW5n
ZSBpcyBva2F5IGZvciBuZXh0IHJlbGVhc2UuDQpNYXkgd2UgdXNlIHRoZSBjaGVjayBsaWtlIE9W
MDJBIFY5IGRpZD8NCnJldCA9IHY0bDJfYXN5bmNfcmVnaXN0ZXJfc3ViZGV2KCZkdzk3NjgtPnNk
KTsNCmlmIChyZXQgPCAwKSB7DQoJaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkNCgkJZHc5
NzY4X3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KCWdvdG8gZW50aXR5X2NsZWFudXA7DQp9DQoNCj4g
QmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

