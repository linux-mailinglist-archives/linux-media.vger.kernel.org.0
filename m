Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6441BF339
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 10:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgD3Inn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 04:43:43 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:53672 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726420AbgD3Inm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 04:43:42 -0400
X-UUID: a647c6c69356451099f2236fc665425a-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=wmJJNzcR3k9GVE2jLM5Fa1SIp2IO4dqVkL3WED3AOeo=;
        b=i/1K6zjNXZJi+oSRhdM8EvkjycK5IKRIg1T7ZY0DwPOjR4tamk41h6GExHbLrMGrBRzc2SrENvbF69goI6zafnOaWdiztrzBewaA7pg8kSC8aQfN7nDXF633Hkjc959YfOKr8KYTHBkOg9Pzd9GM0lS9pv5rr+6ya4DOV60YH6w=;
X-UUID: a647c6c69356451099f2236fc665425a-20200430
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 2083140545; Thu, 30 Apr 2020 16:43:25 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 30 Apr
 2020 16:43:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:43:21 +0800
Message-ID: <1588236152.8804.88.camel@mhfsdcap03>
Subject: Re: [V4, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS
 entry
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <mark.rutland@arm.com>, <sakari.ailus@linux.intel.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Thu, 30 Apr 2020 16:42:32 +0800
In-Reply-To: <20200410172527.GA24529@bogus>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
         <20200330123634.363-2-dongchun.zhu@mediatek.com>
         <20200410172527.GA24529@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: ECC204BF1CE98C25F6F81482310D100CC86CD6865F2FBC31D2991D5DB77265862000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gUm9iLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIEZyaSwgMjAyMC0wNC0x
MCBhdCAxMjoyNSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIE1vbiwgTWFyIDMwLCAy
MDIwIGF0IDA4OjM2OjMzUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBUaGlzIHBh
dGNoIGlzIHRvIGFkZCB0aGUgRGV2aWNldHJlZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGFuZA0K
PiA+IE1BSU5UQUlORVJTIGVudHJ5IGZvciBkdzk3NjggYWN0dWF0b3IuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sICAg
ICAgICB8IDYyICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysNCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1s
DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQo+ID4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwLi44YTM1M2RjDQo+ID4gLS0tIC9kZXYvbnVs
bA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMv
ZG9uZ3dvb24sZHc5NzY4LnlhbWwNCj4gPiBAQCAtMCwwICsxLDYyIEBADQo+ID4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gPiArIyBDb3B5
cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KPiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+
ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvaTJjL2Rvbmd3b29u
LGR3OTc2OC55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1z
Y2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBEb25nd29vbiBBbmF0ZWNoIERX
OTc2OCBWb2ljZSBDb2lsIE1vdG9yIChWQ00pIERldmljZSBUcmVlIEJpbmRpbmdzDQo+ID4gKw0K
PiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1l
ZGlhdGVrLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8LQ0KPiA+ICsgIFRoZSBEb25n
d29vbiBEVzk3NjggaXMgYSBzaW5nbGUgMTAtYml0IGRpZ2l0YWwtdG8tYW5hbG9nIChEQUMpIGNv
bnZlcnRlcg0KPiA+ICsgIHdpdGggMTAwIG1BIG91dHB1dCBjdXJyZW50IHNpbmsgY2FwYWJpbGl0
eS4gVkNNIGN1cnJlbnQgaXMgY29udHJvbGxlZCB3aXRoDQo+ID4gKyAgYSBsaW5lYXIgbW9kZSBk
cml2ZXIuIFRoZSBEQUMgaXMgY29udHJvbGxlZCB2aWEgYSAyLXdpcmUgKEkyQy1jb21wYXRpYmxl
KQ0KPiA+ICsgIHNlcmlhbCBpbnRlcmZhY2UgdGhhdCBvcGVyYXRlcyBhdCBjbG9jayByYXRlcyB1
cCB0byAxTUh6LiBUaGlzIGNoaXANCj4gPiArICBpbnRlZ3JhdGVzIEFkdmFuY2VkIEFjdHVhdG9y
IENvbnRyb2wgKEFBQykgdGVjaG5vbG9neSBhbmQgaXMgaW50ZW5kZWQgZm9yDQo+ID4gKyAgZHJp
dmluZyB2b2ljZSBjb2lsIGxlbnNlcyBpbiBjYW1lcmEgbW9kdWxlcy4NCj4gPiArDQo+ID4gK3By
b3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBkb25nd29vbixk
dzk3NjgNCj4gPiArDQo+ID4gKyAgcmVnOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiArDQo+
ID4gKyAgdmluLXN1cHBseToNCj4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICBEZWZp
bml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBhcyBJMkMgSS9PIGludGVyZmFjZSBwb3dlciBz
dXBwbHkuDQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiANCj4gWW91IGNhbiBkcm9wIHRoaXMuICot
c3VwcGx5IGlzIGFsd2F5cyBhIHNpbmdsZSBlbnRyeS4NCj4gDQoNCkZpeGVkIGluIG5leHQgcmVs
ZWFzZS4NCg0KPiA+ICsNCj4gPiArICB2ZGQtc3VwcGx5Og0KPiA+ICsgICAgZGVzY3JpcHRpb246
DQo+ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIFZDTSBjaGlw
IHBvd2VyIHN1cHBseS4NCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+IA0KPiBTYW1lIGhlcmUuDQo+
IA0KDQpGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4gPiArDQo+ID4gK3JlcXVpcmVkOg0KPiA+
ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSB2aW4tc3VwcGx5DQo+ID4g
KyAgLSB2ZGQtc3VwcGx5DQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgaTJjMjogaTJjQDEx
MDA5MDAwIHsNCj4gDQo+IGkyYyB7DQo+IA0KDQpGaXhlZCBpbiBuZXh0IHJlbGVhc2UuDQoNCj4g
PiArICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsNCj4gPiArICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiAr
DQo+ID4gKyAgICAgICAgZHc5NzY4OiBjYW1lcmEtbGVuc0BjIHsNCj4gPiArICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJkb25nd29vbixkdzk3NjgiOw0KPiA+ICsgICAgICAgICAgICByZWcgPSA8
MHgwYz47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICB2aW4tc3VwcGx5ID0gPCZtdDYzNThfdmNh
bWlvX3JlZz47DQo+ID4gKyAgICAgICAgICAgIHZkZC1zdXBwbHkgPSA8Jm10NjM1OF92Y2FtYTJf
cmVnPjsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gPiArDQo+ID4gKy4uLg0KPiA+
IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+ID4gaW5kZXggMzhmZTJm
My4uNWUxMjRkMiAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5U
QUlORVJTDQo+ID4gQEAgLTUxMzQsNiArNTEzNCwxMyBAQCBTOglNYWludGFpbmVkDQo+ID4gIEY6
CWRyaXZlcnMvbWVkaWEvaTJjL2R3OTcxNC5jDQo+ID4gIEY6CURvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzE0LnR4dA0KPiA+ICANCj4gPiAr
RE9OR1dPT04gRFc5NzY4IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCj4gPiArTToJRG9uZ2NodW4g
Wmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+ICtMOglsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gPiArUzoJTWFpbnRhaW5lZA0KPiA+ICtUOglnaXQgZ2l0Oi8vbGludXh0
di5vcmcvbWVkaWFfdHJlZS5naXQNCj4gPiArRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KPiA+ICsNCj4gPiAgRE9OR1dP
T04gRFc5ODA3IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCj4gPiAgTToJU2FrYXJpIEFpbHVzIDxz
YWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiA+ICBMOglsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmcNCj4gPiAtLSANCj4gPiAyLjkuMg0KDQo=

