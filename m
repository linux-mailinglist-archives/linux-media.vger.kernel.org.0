Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E752F210598
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 09:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgGAH7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 03:59:16 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:16002 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728258AbgGAH7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jul 2020 03:59:16 -0400
X-UUID: fc9d5e9eee9a4d578b14db3a93d3f5d7-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=3gRfBix7JRQ6WuG18aqDYF+havpIPRvkgdziQJ/XMHU=;
        b=QBlJAwxTFgLEcxxHH1hj6JcnKB8Zd4wKVmvAHS7e6ITtC1PQt74ZmHEtjOtac7C++WwWfRIW6r5lvPMhQdEoRNIr7nkJbTJLzRW0x43urK95Lf5Q2JCRs/teOwo2EUTIHThtSiejA3W3a1FCzrP/6NwJq5vIjsXUfbPdFg0Oq7A=;
X-UUID: fc9d5e9eee9a4d578b14db3a93d3f5d7-20200701
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1233999956; Wed, 01 Jul 2020 15:59:07 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Jul
 2020 15:59:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 15:59:05 +0800
Message-ID: <1593590324.17166.30.camel@mhfsdcap03>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
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
Date:   Wed, 1 Jul 2020 15:58:44 +0800
In-Reply-To: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
         <20200630024942.20891-3-dongchun.zhu@mediatek.com>
         <20200630095430.GF16711@paasikivi.fi.intel.com>
         <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
         <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
         <20200630143705.GW3703480@smile.fi.intel.com>
         <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 560D0B0501A9BD5D2873241F011FACDD2523717978D3BD25795468ED446CA7E02000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVHVlLCAyMDIwLTA2LTMwIGF0IDE2OjQwICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4g
T24gVHVlLCBKdW4gMzAsIDIwMjAgYXQgNDozNyBQTSBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIEp1
biAzMCwgMjAyMCBhdCAwNDoyMTozMVBNICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+
IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDQ6MTkgUE0gVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9t
aXVtLm9yZz4gd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgSnVuIDMwLCAyMDIwIGF0IDExOjU0IEFN
IFNha2FyaSBBaWx1cw0KPiA+ID4gPiA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4gd3Jv
dGU6DQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+ID4gPiA+ID4gKyAgICAgb3YwMmExMC0+cnN0X2dw
aW8gPSBkZXZtX2dwaW9kX2dldChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9MT1cpOw0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaG91bGRuJ3QgdGhpcyBiZSBHUElPRF9PVVRfSElH
SD8gVGhhdCdzIHRoZSBzdGF0ZSBpdCdsbCBiZSBhZnRlciBwb3dlcmluZw0KPiA+ID4gPiA+IHRo
ZSBzZW5zb3Igb2ZmIHRoZSBmaXJzdCB0aW1lLiBBbHRlcm5hdGl2ZWx5IG1ha2UgcmVzZXQgc2ln
bmFsIGhpZ2ggaW4NCj4gPiA+ID4gPiBydW50aW1lIHN1c3BlbmQgY2FsbGJhY2suDQo+ID4gPiA+
DQo+ID4gPiA+IFdlIG1pZ2h0IHdhbnQgdG8ga2VlcCB0aGUgc2lnbmFscyBsb3cgd2hlbiB0aGUg
cmVndWxhdG9ycyBhcmUgcG93ZXJlZA0KPiA+ID4gPiBkb3duLCB0byByZWR1Y2UgdGhlIGxlYWth
Z2UuDQo+ID4gPg0KPiA+ID4gQWgsIEkgYWN0dWFsbHkgcmVjYWxsIHRoYXQgdGhlIHJlc2V0IHBp
biB3YXMgcGh5c2ljYWxseSBhY3RpdmUgbG93LCBzbw0KPiA+ID4gd2Ugd291bGQgaW5kZWVkIGJl
dHRlciBrZWVwIGl0IGF0IEhJR0guIFNvcnJ5IGZvciB0aGUgbm9pc2UuDQo+ID4NCj4gPiBIZXJl
IEhJR0ggbWVhbnMgImFzc2VydGVkIiwgc28gaW4gdGhlIGNvZGUgYWJvdmUgaXQncyBMT1csIG1l
YW5zICJkZWFzc2VydGVkIiwNCj4gPiBpLm8udy4gbm9uLXJlc2V0IHN0YXRlLiBJIGR1bm5vIHdo
YXQgaXMgYmV0dGVyLCBpdCBkZXBlbmRzIHRvIHRoZSBmaXJtd2FyZSAvDQo+ID4gZHJpdmVyIGV4
cGVjdGF0aW9ucyBvZiB0aGUgZGV2aWNlIGNvbmZpZ3VyYXRpb24gKGZyb20gdGhlIHBvd2VyIHBv
aW50IG9mIHZpZXcsDQo+ID4gSElHSCBtYWtlcyBzZW5zZSBoZXJlLCBhbmQgbm90IExPVywgaS5v
LncuIGFzc2VydGVkIHJlc2V0IGxpbmUpLg0KPiA+DQo+ID4gQW5kIG5pY2Ugb2YgdGhlIGxvZ2lj
YWwgc3RhdGUgdGhhdCBpdCBkb2Vzbid0IGRlcGVuZCB0byB0aGUgYWN0aXZlIGxvdyAvIGhpZ2gN
Cj4gPiAodGhlIGxhdHRlciBqdXN0IHRyYW5zcGFyZW50IHRvIHRoZSB1c2VyKS4NCj4gDQo+IFll
YWgsIGFmdGVyIHJlYWRpbmcgdGhyb3VnaCB0aGUgR1BJTyBzdWJzeXN0ZW0gZG9jdW1lbnRhdGlv
biBhbmQNCj4gZGlzY3Vzc2luZyB3aXRoIGEgYnVuY2ggb2YgcGVvcGxlIG9uIGhvdyB0byBpbnRl
cnByZXQgaXQsIHdlIGNvbmNsdWRlZA0KPiB0aGF0IHRoZSBkcml2ZXIgbmVlZHMgdG8gZGVhbCBv
bmx5IHdpdGggdGhlIGxvZ2ljYWwgc3RhdGUgb2YgdGhlDQo+IHNpZ25hbC4NCj4gDQo+IEFjdHVh
bGx5LCBJIGxhdGVyIHJlYWxpemVkIHRoYXQgdGhlIHByb2JsZW0gb2YgbGVha2FnZSBzaG91bGQg
bGlrZWx5DQo+IGJlIHNvbHZlZCBieSBwaW5jdHJsIHN1c3BlbmQgc2V0dGluZ3MsIGJhc2VkIG9u
IGdpdmVuIGhhcmR3YXJlDQo+IGNvbmRpdGlvbnMsIHJhdGhlciB0aGFuIHRoZSBkcml2ZXIgZXhw
bGljaXRseS4NCj4gDQoNClRoYW5rIHlvdSBmb3IgYWxsIHlvdXIgZXhwbGFuYXRpb24uDQpGaXhl
ZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

