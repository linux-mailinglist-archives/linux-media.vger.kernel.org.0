Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DEC1BF367
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 10:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbgD3Isq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 04:48:46 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:11526 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726420AbgD3Isq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:46 -0400
X-UUID: 8aedf3c2a64c448382062e595600bfbb-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qEHPZ0vJ9YaDzRAN0qw3MdQ9byhSepyxaXxCWBvrE5g=;
        b=gfi1O1nLD0z/k7SSqXn5aLDlASNVa2jqazrXSiMBWSm2XEQeEdl1nmbd/eRtrSKW8kCDgzRlk64tC4QkpcBTyJiyIDu/1D+epSsbdGihsrDXZjExysMK/1tSULoN4dqicEskW9a98ZDMWz9z8uDTrLhlRfcoIIEN7QS2JwW0hH4=;
X-UUID: 8aedf3c2a64c448382062e595600bfbb-20200430
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1700155328; Thu, 30 Apr 2020 16:48:39 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 30 Apr
 2020 16:48:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:48:36 +0800
Message-ID: <1588236466.8804.92.camel@mhfsdcap03>
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     <mchehab@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Thu, 30 Apr 2020 16:47:46 +0800
In-Reply-To: <20200331101456.GG1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
         <20200330123634.363-3-dongchun.zhu@mediatek.com>
         <20200330135751.GQ1922688@smile.fi.intel.com>
         <1585620980.5781.80.camel@mhfsdcap03>
         <20200331101456.GG1922688@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E3566C996091720B35FA9D701A04146A9F434F3E2FE424D79D363A9BF88C6DB62000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gQW5keSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUdWUsIDIwMjAtMDMt
MzEgYXQgMTM6MTQgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVHVlLCBNYXIg
MzEsIDIwMjAgYXQgMTA6MTY6MjBBTSArMDgwMCwgRG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+IE9u
IE1vbiwgMjAyMC0wMy0zMCBhdCAxNjo1NyArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0K
PiA+ID4gT24gTW9uLCBNYXIgMzAsIDIwMjAgYXQgMDg6MzY6MzRQTSArMDgwMCwgRG9uZ2NodW4g
Wmh1IHdyb3RlOg0KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgYSBWNEwyIHN1Yi1kZXZpY2UgZHJp
dmVyIGZvciBEVzk3Njggdm9pY2UgY29pbCBtb3RlciwNCj4gPiA+ID4gcHJvdmlkaW5nIGNvbnRy
b2wgdG8gc2V0IHRoZSBkZXNpcmVkIGZvY3VzIHZpYSBJMkMgc2VyaWFsIGludGVyZmFjZS4NCj4g
PiA+IA0KPiA+ID4gLi4uDQo+ID4gPiANCj4gPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyBkdzk3NjhfcG1fb3BzID0gew0KPiA+ID4gPiArCVNFVF9TWVNURU1fU0xFRVBfUE1f
T1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwNCj4gPiA+ID4gKwkJCQlwbV9ydW50aW1lX2Zv
cmNlX3Jlc3VtZSkNCj4gPiA+ID4gKwlTRVRfUlVOVElNRV9QTV9PUFMoZHc5NzY4X3J1bnRpbWVf
c3VzcGVuZCwgZHc5NzY4X3J1bnRpbWVfcmVzdW1lLCBOVUxMKQ0KPiA+ID4gPiArfTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGR3OTc2OF9pMmNfZHJpdmVy
ID0gew0KPiA+ID4gPiArCS5kcml2ZXIgPSB7DQo+ID4gPiA+ICsJCS5uYW1lID0gRFc5NzY4X05B
TUUsDQo+ID4gPiANCj4gPiA+ID4gKwkJLnBtID0gSVNfRU5BQkxFRChDT05GSUdfUE0pID8gJmR3
OTc2OF9wbV9vcHMgOiBOVUxMLA0KPiA+ID4gDQo+ID4gPiBXaGF0IGlzIHRoaXMgY29uZGl0aW9u
YWwgZm9yPw0KPiA+ID4gDQo+ID4gDQo+ID4gRm9yIHRoZSBkdzk3NjhfcG1fb3BzLCBoZXJlIG15
IGlkZWEgaXMgdG8gdXNlIGFuIElTX0VOQUJMRUQoKSBjaGVjayB0bw0KPiA+IGF2b2lkIGRlZmlu
aW5nIHRoZSBzdHJ1Y3R1cmUgd2hlbiBDT05GSUdfUE0gaXMgbm90IHNldC4NCj4gDQo+IEhhdmUg
eW91IGxvb2tlZCBhdCB0aGUgaW1wbGVtZW50YXRpb24gb2YgU0VUX1NZU1RFTV9TTEVFUF9PUFMo
KSBhbmQgYW5vdGhlciBvbmU/DQo+IA0KPiBIYXZlIHlvdSB0cmllZCB0byBhY3R1YWxseSBjb21w
aWxlIHdpdGggIUNPTkZJR19QTT8gSW4geW91ciBjYXNlIHRoZSB3YXJuaW5nDQo+IHNob3VsZCBi
ZSBpc3N1ZWQuDQo+IA0KDQpVbmRlcnN0b29kLg0KRm9sbG93IFNha2FyaSdzIGFkdmljZSwgdGhl
IGNvbmRpdGlvbiB3b3VsZCBiZSBkcm9wcGVkIGluIG5leHQgcmVsZWFzZS4NCg0K

