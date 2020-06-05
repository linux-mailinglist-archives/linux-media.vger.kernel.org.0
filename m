Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2047B1EEFF0
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 05:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgFEDbG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 23:31:06 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:48918 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727081AbgFEDbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 23:31:05 -0400
X-UUID: 14169d41129a41e7ba94d529d9e1a9a7-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=04uARMuEAI3fSF9KF2DXT7abIE8uC44WP1+LksONuRI=;
        b=dJgKTeEXHqOlfYe9dZwq+eIvKB607Ue56Q91SGrBQSb1nYZgj5zqdQkJhba10OzkoMZuwg2RHWScj5pMGYRVZmCHQ0x12Ufqcux7twSLLCs6KVvhMxHX3YObDqIp3EPpwBHxV+7uAIJRWqS8MfEU3jGpYr8DAA7mHq+rpsI6yEc=;
X-UUID: 14169d41129a41e7ba94d529d9e1a9a7-20200605
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1597456657; Fri, 05 Jun 2020 11:30:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 5 Jun
 2020 11:30:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 11:30:57 +0800
Message-ID: <1591327734.8804.564.camel@mhfsdcap03>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Cao Bing Bu" <bingbu.cao@intel.com>,
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
Date:   Fri, 5 Jun 2020 11:28:54 +0800
In-Reply-To: <20200604081032.GG16711@paasikivi.fi.intel.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
         <20200518132731.20855-3-dongchun.zhu@mediatek.com>
         <20200521195113.GC14214@chromium.org>
         <1590139561.8804.390.camel@mhfsdcap03>
         <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
         <1590570089.8804.453.camel@mhfsdcap03>
         <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
         <1591238018.8804.555.camel@mhfsdcap03>
         <20200604081032.GG16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D090CB165FCCEF44021FC7838239E93BBCC7EC861B9949712203DF71BC628EC82000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUaHUsIDIwMjAtMDYtMDQgYXQgMTE6MTAgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gT24gVGh1LCBKdW4gMDQsIDIwMjAgYXQgMTA6MzM6MzhBTSArMDgwMCwg
RG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+IEhpIFRvbWFzeiwNCj4gPiANCj4gPiBPbiBNb24sIDIw
MjAtMDYtMDEgYXQgMjA6NDcgKzAyMDAsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+ID4gT24gV2Vk
LCBNYXkgMjcsIDIwMjAgYXQgMTE6MDMgQU0gRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVk
aWF0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+ID4gPg0K
PiA+ID4gPiBPbiBNb24sIDIwMjAtMDUtMjUgYXQgMTM6NDUgKzAyMDAsIFRvbWFzeiBGaWdhIHdy
b3RlOg0KPiA+ID4gPiA+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDExOjI3IEFNIERvbmdjaHVu
IFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gSGkgVG9tYXN6LA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoYW5rcyBmb3Ig
dGhlIHJldmlldy4gTXkgcmVwbGllcyBhcmUgYXMgYmVsb3cuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gT24gVGh1LCAyMDIwLTA1LTIxIGF0IDE5OjUxICswMDAwLCBUb21hc3ogRmlnYSB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gSGkgRG9uZ2NodW4sIFNha2FyaSwNCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjAgYXQgMDk6Mjc6MzFQTSArMDgwMCwgRG9u
Z2NodW4gWmh1IHdyb3RlOg0KPiA+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiA+ID4gPiA+ICsgICBw
bV9ydW50aW1lX2VuYWJsZShkZXYpOw0KPiA+ID4gPiA+ID4gPiA+ICsgICBpZiAoIXBtX3J1bnRp
bWVfZW5hYmxlZChkZXYpKSB7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgcmV0ID0gZHc5
NzY4X3J1bnRpbWVfcmVzdW1lKGRldik7DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgaWYg
KHJldCA8IDApIHsNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiZmFpbGVkIHRvIHBvd2VyIG9uOiAlZFxuIiwgcmV0KTsNCj4gPiA+ID4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgIGdvdG8gZW50aXR5X2NsZWFudXA7DQo+ID4gPiA+ID4gPiA+ID4g
KyAgICAgICAgICAgfQ0KPiA+ID4gPiA+ID4gPiA+ICsgICB9DQo+ID4gPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gPiA+ICsgICByZXQgPSB2NGwyX2FzeW5jX3JlZ2lzdGVyX3N1YmRldigmZHc5
NzY4LT5zZCk7DQo+ID4gPiA+ID4gPiA+ID4gKyAgIGlmIChyZXQgPCAwKQ0KPiA+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgIGdvdG8gZW50aXR5X2NsZWFudXA7DQo+ID4gPiA+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ID4gPiA+ICsgICByZXR1cm4gMDsNCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gPiA+ID4gK2VudGl0eV9jbGVhbnVwOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBO
ZWVkIHRvIHBvd2VyIG9mZiBpZiB0aGUgY29kZSBhYm92ZSBwb3dlcmVkIG9uLg0KPiA+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLg0K
PiA+ID4gPiA+ID4gSWYgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdpdGggcnVudGltZSBQTSwg
YWN0dWF0b3IgaXMgdG8gYmUgcG93ZXJlZA0KPiA+ID4gPiA+ID4gb24gdmlhIGR3OTc2OF9ydW50
aW1lX3Jlc3VtZSgpIEFQSS4NCj4gPiA+ID4gPiA+IFdoZW4gYWN0dWF0b3Igc3ViLWRldmljZSBp
cyBwb3dlcmVkIG9uIGNvbXBsZXRlbHkgYW5kIGFzeW5jIHJlZ2lzdGVyZWQNCj4gPiA+ID4gPiA+
IHN1Y2Nlc3NmdWxseSwgd2Ugc2hhbGwgcG93ZXIgb2ZmIGl0IGFmdGVyd2FyZHMuDQo+ID4gPiA+
ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVGhlIGNvZGUgYWJvdmUgY2FsbHMgZHc5NzY4X3J1
bnRpbWVfcmVzdW1lKCkgaWYNCj4gPiA+ID4gPiAhcG1fcnVudGltZV9lbmFibGVkKGRldiksIGJ1
dCB0aGUgY2xlYW4tdXAgY29kZSBiZWxvdyB0aGUNCj4gPiA+ID4gPiBlbnRpdHlfY2xlYW51cCBs
YWJlbCBkb2Vzbid0IGhhdmUgdGhlIGNvcnJlc3BvbmRpbmcNCj4gPiA+ID4gPiBkdzk3NjhfcnVu
dGltZV9zdXNwZW5kKCkgY2FsbC4NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBEaWQgeW91
IG1lYW4gdGhlICdlbnRpdHlfY2xlYW51cCcgYWZ0ZXIgdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJk
ZXYoKT8NCj4gPiA+IA0KPiA+ID4gWWVzLg0KPiA+ID4gDQo+ID4gPiA+IEFjdHVhbGx5IEkgbWFk
ZSBzb21lIGNoYW5nZXMgZm9yIE9WMDJBIFY5LCBhY2NvcmRpbmcgdG8gdGhpcyBjb21tZW50Lg0K
PiA+ID4gPiBDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhhdCBjaGFuZ2U/IFRoYW5rcy4NCj4gPiA+
IA0KPiA+ID4gU3VyZSwgSSB3aWxsIHRha2UgYSBsb29rLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhh
bmtzLg0KPiA+IFNvcnJ5LCBJIGp1c3Qgd2FubmEgbWFrZSBzdXJlIHRoZSBjaGFuZ2UgaXMgb2th
eSBmb3IgbmV4dCByZWxlYXNlLg0KPiA+IE1heSB3ZSB1c2UgdGhlIGNoZWNrIGxpa2UgT1YwMkEg
VjkgZGlkPw0KPiA+IHJldCA9IHY0bDJfYXN5bmNfcmVnaXN0ZXJfc3ViZGV2KCZkdzk3NjgtPnNk
KTsNCj4gPiBpZiAocmV0IDwgMCkgew0KPiA+IAlpZiAoIXBtX3J1bnRpbWVfZW5hYmxlZChkZXYp
KQ0KPiA+IAkJZHc5NzY4X3J1bnRpbWVfc3VzcGVuZChkZXYpOw0KPiANCj4gUGxlYXNlIGRvIHRo
aXMgcGFydCB3aGVyZSB5b3UncmUganVtcGluZyB0bywgaWYgcG9zc2libGUuDQo+IA0KDQpGaW5l
Lg0KRml4ZWQgaW4gbmV4dCByZWxlYXNlLg0KDQo+ID4gCWdvdG8gZW50aXR5X2NsZWFudXA7DQo+
ID4gfQ0KPiA+IA0KPiANCg0K

