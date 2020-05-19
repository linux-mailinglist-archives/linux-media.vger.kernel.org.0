Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206671D8E16
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 05:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgESDMZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 23:12:25 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:27549 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726302AbgESDMY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 23:12:24 -0400
X-UUID: cc8ffec04b6a43b7bec2c9acbf9c78fa-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=r8eGAgqgE0pJRDFIe1Bekk6atwC/VS0Nd4EW/+LDtrk=;
        b=aTONkvEvCB92BYi+dGVVKlyYQLQ1LHY4Gmiqajdmkftz3xDF86UGzkZ2FjibSDAkX0Ie/3NrkY9PlMhqMS+bGAHz0TM8W/kpoNX2rfhJEiU0LIRGBb7lkZe8MS5uz7wVJlqZZgy0DYUb1niA8t4TRb+asmJ4srI8NPZettsV75U=;
X-UUID: cc8ffec04b6a43b7bec2c9acbf9c78fa-20200519
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 904599384; Tue, 19 May 2020 11:12:10 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 19 May
 2020 11:12:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 11:12:08 +0800
Message-ID: <1589857839.8804.368.camel@mhfsdcap03>
Subject: Re: [V6, 1/2] media: dt-bindings: media: i2c: Document DW9768
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
        <shengnan.wang@mediatek.com>
Date:   Tue, 19 May 2020 11:10:39 +0800
In-Reply-To: <20200518143148.GA18032@bogus>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
         <20200518132731.20855-2-dongchun.zhu@mediatek.com>
         <CAAFQd5Byvc8Fb0f3_81xSKsuyvsQJm-8g8y1Kx2aUcC=PwpS7w@mail.gmail.com>
         <20200518143148.GA18032@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 10BF97F5F2B8C09090C06F8889D22CE821A519C8A6B26C57BE0218C418F075C12000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVG9tYXN6LCBSb2IsDQoNClRoYW5rcyBmb3IgdGhlIHRpbWVseSByZXZpZXcgYW5kIGdvb2Qg
c3VnZ2VzdGlvbnMuDQoNCk9uIE1vbiwgMjAyMC0wNS0xOCBhdCAwODozMSAtMDYwMCwgUm9iIEhl
cnJpbmcgd3JvdGU6DQo+IE9uIE1vbiwgTWF5IDE4LCAyMDIwIGF0IDA0OjEyOjI4UE0gKzAyMDAs
IFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+IEhpIERvbmdjaHVuLA0KPiA+IA0KPiA+IE9uIE1vbiwg
TWF5IDE4LCAyMDIwIGF0IDM6MjkgUE0gRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0
ZWsuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBBZGQgRGV2aWNlVHJlZSBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gZm9yIERvbmd3b29uIEFuYXRlY2ggRFc5NzY4IHZvaWNlDQo+ID4gPiBjb2lsIGFj
dHVhdG9yLg0KPiA+IA0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBQbGVhc2Ugc2VlIG15IGNv
bW1lbnRzIGJlbG93Lg0KPiA+IA0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVu
IFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4gPiA+IFJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiA+IA0KPiA+IFRoaXMgdmVyc2lvbiBpbmNsdWRl
cyBzaWduaWZpY2FudCBjaGFuZ2VzLCBzbyB0aGUgcmV2aWV3ZWQtYnkgdGFnDQo+ID4gc2hvdWxk
bid0IGhhdmUgYmVlbiBjYXJyaWVkIG91dC4NCj4gPiANCg0KU29ycnksIHRoaXMgaXMgbXkgZmF1
bHQuDQpJbiBmYWN0LCBJJ3ZlIHN0cnVnZ2xlZCB3aXRoIGl0IGF0IHRoZSBiZWdpbm5pbmcuDQpZ
ZXMsIHlvdSBhcmUgcmlnaHQuDQpOb3cgdGhlIG5ldyB2ZXJzaW9uIG9mIHBhdGNoLXNldCBpbmNs
dWRlcyBodWdlIGNoYW5nZXMgcmVsYXRpdmUgdG8gdGhlDQpsYXN0IGVkaXRpb24uDQpJdCB3b3Vs
ZCBiZSByZW1vdmVkIGluIG5leHQgcmVsZWFzZS4NCg0KPiA+ID4gLS0tDQo+ID4gPiAgLi4uL2Jp
bmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCAxMDUgKysrKysr
KysrKysrKysrKysrKysrDQo+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKysNCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExMiBp
bnNlcnRpb25zKCspDQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCj4gPiA+DQo+
ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2kyYy9kb25nd29vbixkdzk3NjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCj4gPiA+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gPiBpbmRleCAwMDAwMDAwLi5iOTA5ZTgzDQo+ID4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJj
L2Rvbmd3b29uLGR3OTc2OC55YW1sDQo+ID4gPiBAQCAtMCwwICsxLDEwNSBAQA0KPiA+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCj4gPiA+
ICsjIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQo+ID4gPiArJVlBTUwgMS4yDQo+
ID4gPiArLS0tDQo+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRp
YS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwjDQo+ID4gPiArJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gPiArDQo+ID4gPiArdGl0bGU6
IERvbmd3b29uIEFuYXRlY2ggRFc5NzY4IFZvaWNlIENvaWwgTW90b3IgKFZDTSkgTGVucyBEZXZp
Y2UgVHJlZSBCaW5kaW5ncw0KPiA+ID4gKw0KPiA+ID4gK21haW50YWluZXJzOg0KPiA+ID4gKyAg
LSBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4gPiArDQo+ID4g
PiArZGVzY3JpcHRpb246IHwtDQo+ID4gPiArICBUaGUgRG9uZ3dvb24gRFc5NzY4IGlzIGEgc2lu
Z2xlIDEwLWJpdCBkaWdpdGFsLXRvLWFuYWxvZyAoREFDKSBjb252ZXJ0ZXINCj4gPiA+ICsgIHdp
dGggMTAwIG1BIG91dHB1dCBjdXJyZW50IHNpbmsgY2FwYWJpbGl0eS4gVkNNIGN1cnJlbnQgaXMg
Y29udHJvbGxlZCB3aXRoDQo+ID4gPiArICBhIGxpbmVhciBtb2RlIGRyaXZlci4gVGhlIERBQyBp
cyBjb250cm9sbGVkIHZpYSBhIDItd2lyZSAoSTJDLWNvbXBhdGlibGUpDQo+ID4gPiArICBzZXJp
YWwgaW50ZXJmYWNlIHRoYXQgb3BlcmF0ZXMgYXQgY2xvY2sgcmF0ZXMgdXAgdG8gMU1Iei4gVGhp
cyBjaGlwDQo+ID4gPiArICBpbnRlZ3JhdGVzIEFkdmFuY2VkIEFjdHVhdG9yIENvbnRyb2wgKEFB
QykgdGVjaG5vbG9neSBhbmQgaXMgaW50ZW5kZWQgZm9yDQo+ID4gPiArICBkcml2aW5nIHZvaWNl
IGNvaWwgbGVuc2VzIGluIGNhbWVyYSBtb2R1bGVzLg0KPiA+ID4gKw0KPiA+ID4gK3Byb3BlcnRp
ZXM6DQo+ID4gPiArICBjb21wYXRpYmxlOg0KPiA+ID4gKyAgICBlbnVtOg0KPiA+ID4gKyAgICAg
ICMgZm9yIERXOTc2OCBWQ00NCj4gPiA+ICsgICAgICAtIGRvbmd3b29uLGR3OTc2OA0KPiA+ID4g
KyAgICAgICMgZm9yIEdUOTc2OSBWQ00NCj4gPiA+ICsgICAgICAtIGdpYW50ZWMsZ3Q5NzY5DQo+
ID4gPiArDQo+ID4gPiArICByZWc6DQo+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiArDQo+
ID4gPiArICB2aW4tc3VwcGx5Og0KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAg
ICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBhcyBJMkMgSS9PIGludGVyZmFjZSBw
b3dlciBzdXBwbHkuDQo+ID4gPiArDQo+ID4gPiArICB2ZGQtc3VwcGx5Og0KPiA+ID4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNl
ZCBhcyBWQ00gY2hpcCBwb3dlciBzdXBwbHkuDQo+ID4gPiArDQo+ID4gPiArICBkb25nd29vbixh
YWMtbW9kZToNCj4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiArICAgICAgSW5kaWNhdGlv
biBvZiBBQUMgbW9kZSBzZWxlY3QuDQo+ID4gPiArICAgIGFsbE9mOg0KPiA+ID4gKyAgICAgIC0g
JHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCj4gPiA+ICsg
ICAgICAtIGVudW06DQo+ID4gPiArICAgICAgICAgIC0gMCAgICAjICBEaXJlY3QgKGRlZmF1bHQp
DQo+IA0KPiBEZWZhdWx0IGNhbiBiZSBleHByZXNzZWQgYXMgJ2RlZmF1bHQ6IDAnLg0KPiANCg0K
VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQpOZXh0IHJlbGVhc2UgSSdkIHRyeSB0byB3cml0ZSBE
VCBwcm9wZXJ0eSAiZG9uZ3dvb24sYWFjLW1vZGUiIGxpa2UgdGhpczoNCmRvbmd3b29uLGFhYy1t
b2RlOg0KICBkZXNjcmlwdGlvbjoNCiAgICBJbmRpY2F0aW9uIG9mIEFBQyBtb2RlIHNlbGVjdC4N
CiAgYWxsT2Y6DQogICAgLSAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyIg0KICAgIC0gZW51bToNCiAgICAgICAgLSAwICAjIERpcmVjdA0KICAgICAgICAtIDEg
ICMgQUFDMiAob3BlcmF0aW9uIHRpbWUjIDAuNDggeCBUdmliKQ0KICAgICAgICAtIDIgICMgQUFD
MyAob3BlcmF0aW9uIHRpbWUjIDAuNzAgeCBUdmliKQ0KICAgICAgICAtIDMgICMgQUFDNCAob3Bl
cmF0aW9uIHRpbWUjIDAuNzUgeCBUdmliKQ0KICAgICAgICAtIDUgICMgQUFDOCAob3BlcmF0aW9u
IHRpbWUjIDEuMTMgeCBUdmliKQ0KICAgICAgZGVmYXVsdDogMA0KDQo+ID4gPiArICAgICAgICAg
IC0gMSAgICAjICBBQUMyIChvcGVyYXRpb24gdGltZSMgMC40OCB4IFR2aWIpDQo+ID4gPiArICAg
ICAgICAgIC0gMiAgICAjICBBQUMzIChvcGVyYXRpb24gdGltZSMgMC43MCB4IFR2aWIpDQo+ID4g
PiArICAgICAgICAgIC0gMyAgICAjICBBQUM0IChvcGVyYXRpb24gdGltZSMgMC43NSB4IFR2aWIp
DQo+ID4gPiArICAgICAgICAgIC0gNCAgICAjICBSZXNlcnZlZA0KPiA+ID4gKyAgICAgICAgICAt
IDUgICAgIyAgQUFDOCAob3BlcmF0aW9uIHRpbWUjIDEuMTMgeCBUdmliKQ0KPiA+ID4gKyAgICAg
ICAgICAtIDYgICAgIyAgUmVzZXJ2ZWQNCj4gPiA+ICsgICAgICAgICAgLSA3ICAgICMgIFJlc2Vy
dmVkDQo+ID4gDQo+ID4gSSdsbCB1bHRpbWF0ZWx5IGxlYXZlIGl0IHRvIERUIG1haW50YWluZXJz
LCBidXQgaXMgdGhlcmUgYW55IHJlYXNvbiB0bw0KPiA+IGRlZmluZSB0aGUgcmVzZXJ2ZWQgdmFs
dWVzPw0KPiANCj4gTm8uDQo+IA0KPiA+IA0KPiA+ID4gKw0KPiA+ID4gKyAgZG9uZ3dvb24sYWFj
LXRpbWluZzoNCj4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiArICAgICAgSW5kaWNhdGlv
biBvZiBBQUMgVGltaW5nIGNvdW50LCB1bml0IG9mIDAuMSBtaWxsaXNlY29uZHMuDQo+IA0KPiBX
aHkgbm90IGp1c3QgdXNlIHN0YW5kYXJkIHVuaXRzICgtdXMpPw0KPiANCg0KVGhhdCBzb3VuZHMg
bmljZS4NCkknZCByZS13cml0ZSB0aGUgZGVzY3JpcHRpb24gbGlrZSB0aGlzIGluIG5leHQgcmVs
ZWFzZToNCmRvbmd3b29uLGFhYy10aW1pbmc6DQogIGRlc2NyaXB0aW9uOg0KICAgIE51bWJlciBv
ZiBBQUMgVGltaW5nIGNvdW50IHRoYXQgY29udHJvbGxlZCBieSBvbmUgNi1iaXQgcGVyaW9kDQog
ICAgb2YgdmlicmF0aW9uIHJlZ2lzdGVyIEFBQ1RbNTowXSwgdGhlIHVuaXQgb2Ygd2hpY2ggaXMg
MTAwdXMuDQogIGFsbE9mOg0KICAgIC0gJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmlu
aXRpb25zL3VpbnQzMiINCiAgICAtIG1pbmltdW06IDB4MDANCiAgICAtIG1heGltdW06IDB4M0YN
CiAgICAtIGRlZmF1bHQ6IDB4MjANCg0KPiA+ID4gKyAgICAgIFZhbGlkIHZhbHVlcyB2YXJ5IGZy
b20gMCB0byA2MyAoZGVmYXVsdCAzMikuDQo+IA0KPiBMb29rcyBsaWtlIGNvbnN0cmFpbnRzLg0K
PiANCg0KWWVzLiBUaGlzIHByb3BlcnR5IGlzIGNvbnRyb2xsZWQgYnkgb25lIDYtYml0IHJlZy4N
ClNvIGhlcmUgd2UgbmVlZCB0byBjb25zdHJhaW4gdGhlIGRhdGEgc2V0IHRvIGEgbmFycm93IHJh
bmdlLg0KDQo+ID4gPiArICAgIGFsbE9mOg0KPiA+ID4gKyAgICAgIC0gJHJlZjogIi9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCj4gPiA+ICsNCj4gPiA+ICsgIGRvbmd3
b29uLGNsb2NrLWRpdmlkaW5nLXJhdGU6DQo+ID4gPiArICAgIGRlc2NyaXB0aW9uOg0KPiA+ID4g
KyAgICAgIEluZGljYXRpb24gb2YgVkNNIGludGVybmFsIGNsb2NrIGRpdmlkaW5nIHJhdGUgc2Vs
ZWN0LCBhcyBvbmUgbXVsdGlwbGUNCj4gPiA+ICsgICAgICBmYWN0b3IgdG8gY2FsY3VsYXRlIFZD
TSByaW5nIHBlcmlvZGljIHRpbWUgVHZpYi4NCj4gPiA+ICsgICAgYWxsT2Y6DQo+ID4gPiArICAg
ICAgLSAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyIg0KPiA+
ID4gKyAgICAgIC0gZW51bToNCj4gPiA+ICsgICAgICAgICAgLSAwICAgICMgIERpdmlkaW5nIFJh
dGUgLSAgMg0KPiA+ID4gKyAgICAgICAgICAtIDEgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAxIChk
ZWZhdWx0KQ0KPiA+ID4gKyAgICAgICAgICAtIDIgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAxLzIN
Cj4gPiA+ICsgICAgICAgICAgLSAzICAgICMgIERpdmlkaW5nIFJhdGUgLSAgMS80DQo+ID4gPiAr
ICAgICAgICAgIC0gNCAgICAjICBEaXZpZGluZyBSYXRlIC0gIDgNCj4gPiA+ICsgICAgICAgICAg
LSA1ICAgICMgIERpdmlkaW5nIFJhdGUgLSAgNA0KPiA+ID4gKyAgICAgICAgICAtIDYgICAgIyAg
RGl2aWRpbmcgUmF0ZSAtICBSZXNlcnZlZA0KPiA+ID4gKyAgICAgICAgICAtIDcgICAgIyAgRGl2
aWRpbmcgUmF0ZSAtICBSZXNlcnZlZA0KPiA+IA0KPiA+IERpdHRvLg0KPiA+IA0KDQpUaGFua3Mg
Zm9yIGtpbmRseSByZW1pbmRlci4NClJlc2VydmVkIHZhbHVlcyB3b3VsZCBiZSByZW1vdmVkIGlu
IG5leHQgcmVsZWFzZS4NCkxpa2UgdGhpczoNCmRvbmd3b29uLGNsb2NrLWRpdmlkaW5nLXJhdGU6
DQogIGRlc2NyaXB0aW9uOg0KICAgIEluZGljYXRpb24gb2YgVkNNIGludGVybmFsIGNsb2NrIGRp
dmlkaW5nIHJhdGUgc2VsZWN0LCBhcyBvbmUgICAgDQogICAgbXVsdGlwbGllciB0byBjYWxjdWxh
dGUgVkNNIHJpbmcgcGVyaW9kaWMgdGltZSBUdmliLg0KICBhbGxPZjoNCiAgICAtICRyZWY6ICIv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiDQogICAgLSBlbnVtOg0KICAg
ICAgICAtIDAgICAjICBEaXZpZGluZyBSYXRlIC0gIDINCiAgICAgICAgLSAxICAgIyAgRGl2aWRp
bmcgUmF0ZSAtICAxDQogICAgICAgIC0gMiAgICAjICBEaXZpZGluZyBSYXRlIC0gIDEvMg0KICAg
ICAgICAtIDMgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAxLzQNCiAgICAgICAgLSA0ICAgICMgIERp
dmlkaW5nIFJhdGUgLSAgOA0KICAgICAgICAtIDUgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICA0DQog
ICAgICBkZWZhdWx0OiAxDQoNCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gVG9tYXN6DQoNCg==

