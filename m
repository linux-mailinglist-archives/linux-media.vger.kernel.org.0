Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B782B92FD
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 14:00:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727289AbgKSM7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Nov 2020 07:59:03 -0500
Received: from mailgw02.mediatek.com ([1.203.163.81]:8198 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727252AbgKSM7C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Nov 2020 07:59:02 -0500
X-UUID: d1d95da996414eb29b8f2eb41edb7113-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=jtIPXLdRzRuqtAWsnlgJ678Skl74sQc1PCkrSIeeLWc=;
        b=JjfRZyMyiqqLW2gQfa/o6j/BNQBKm6/cESXzVPrGtkQasFXhiYNRV6+qPu/oGN1ULJg27pyeZ451Hi6GXzT2RpNqFmImz4OK8Njpi/tyTJ4dqgs+ENND4AUnuOFQf1dmus/Iz+cwL7NMoOykZUKEDMCE9ofZMLRk2KC6iBoEOs0=;
X-UUID: d1d95da996414eb29b8f2eb41edb7113-20201119
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 993231741; Thu, 19 Nov 2020 20:58:52 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Nov
 2020 20:58:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 20:58:44 +0800
Message-ID: <1605790724.4733.107.camel@mhfsdcap03>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Date:   Thu, 19 Nov 2020 20:58:44 +0800
In-Reply-To: <20201030162756.GR26150@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
         <20201013130503.2412-2-dongchun.zhu@mediatek.com>
         <20201013161938.GE13341@paasikivi.fi.intel.com>
         <1602641418.4733.80.camel@mhfsdcap03>
         <20201014083139.GG13341@paasikivi.fi.intel.com>
         <CAAFQd5BVzN=49s4S98E9mGNuxzOt4633dAw9mbyu3Sr-rA61qw@mail.gmail.com>
         <20201019082759.GL13341@paasikivi.fi.intel.com>
         <CAAFQd5B9inO_-WJdJg_EMULw-e0EAAo8DXNgo5d+qrGvq6F8qQ@mail.gmail.com>
         <20201030162756.GR26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 35267B2D9D4741786357859B1F81D467D956B070A5A5332966B0F689BDE873402000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBGcmksIDIwMjAtMTAtMzAgYXQgMTg6MjcgKzAyMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgVG9tYXN6LCBEb25nY2h1biwNCj4gDQo+IE9uIE1vbiwgT2N0IDE5
LCAyMDIwIGF0IDA5OjIwOjE1UE0gKzAyMDAsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPiA+IE9uIE1v
biwgT2N0IDE5LCAyMDIwIGF0IDEwOjI4IEFNIFNha2FyaSBBaWx1cw0KPiA+IDxzYWthcmkuYWls
dXNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIE9jdCAxNCwg
MjAyMCBhdCAwMTo0ODowMFBNICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gT24g
V2VkLCBPY3QgMTQsIDIwMjAgYXQgMTA6MzEgQU0gU2FrYXJpIEFpbHVzDQo+ID4gPiA+IDxzYWth
cmkuYWlsdXNAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9u
IFdlZCwgT2N0IDE0LCAyMDIwIGF0IDEwOjEwOjE4QU0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90
ZToNCj4gPiA+ID4gPiA+IEhlbGxvIFNha2FyaSwNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBU
aGFua3MgZm9yIHlvdXIgdGltZWx5IHJldmlldy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBP
biBUdWUsIDIwMjAtMTAtMTMgYXQgMTk6MTkgKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
PiA+ID4gPiA+ID4gSGkgRG9uZ2NodW4sDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IE9u
IFR1ZSwgT2N0IDEzLCAyMDIwIGF0IDA5OjA1OjAyUE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90
ZToNCj4gPiA+ID4gPiA+ID4gPiBBZGQgWUFNTCBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciBPVjAy
QTEwIENNT1MgaW1hZ2Ugc2Vuc29yLCBhbmQgdGhlDQo+ID4gPiA+ID4gPiA+ID4gcmVsZXZhbnQg
TUFJTlRBSU5FUlMgZW50cmllcy4NCj4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4g
PiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2ky
Yy9vdnRpLG92MDJhMTAueWFtbCAgICAgICAgICAgfCAxNjIgKysrKysrKysrKysrKysrKysrKysr
DQo+ID4gPiA+ID4gPiA+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICA3ICsNCj4gPiA+ID4gPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
NjkgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFt
bA0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gW3NuaXBdLi4uDQo+
ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ICsgIG92dGksbWlwaS1jbG9jay12b2x0YWdlOg0K
PiA+ID4gPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ID4gPiA+ID4gKyAgICAg
IEFuIGFycmF5IG9mIDItdHVwbGVzIGl0ZW1zLCBhbmQgZWFjaCBpdGVtIGNvbnNpc3RzIG9mIGxp
bmsgZnJlcXVlbmN5IGFuZA0KPiA+ID4gPiA+ID4gPiA+ICsgICAgICBNSVBJIGNsb2NrIHZvbHRh
Z2UgdW5pdCBsaWtlIDxmcmVxLWtIeiB2b2x0LXVuaXQ+LiBDbG9jayB2b2x0YWdlIHVuaXQgaXMN
Cj4gPiA+ID4gPiA+ID4gPiArICAgICAgZGVwZW5kZW50IHVwb24gbGluayBzcGVlZCwgaW5kaWNh
dGluZyBNSVBJIHRyYW5zbWlzc2lvbiBzcGVlZCBzZWxlY3QgdGhhdA0KPiA+ID4gPiA+ID4gPiA+
ICsgICAgICBjb250cm9scyBELVBIWSB0aW1pbmcgc2V0dGluZyBieSBhZGp1c3RpbmcgTUlQSSBj
bG9jayB2b2x0YWdlIHRvIGltcHJvdmUNCj4gPiA+ID4gPiA+ID4gPiArICAgICAgdGhlIGNsb2Nr
IGRyaXZlciBjYXBhYmlsaXR5Lg0KPiA+ID4gPiA+ID4gPiA+ICsgICAgJHJlZjogIi9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheSINCj4gPiA+ID4gPiA+ID4gPiAr
ICAgIG1pbkl0ZW1zOiAyDQo+ID4gPiA+ID4gPiA+ID4gKyAgICBkZWZhdWx0OiBbMzkwMDAwLCA0
XQ0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBXaHkgZG8geW91IGhhdmUgdGhlIGxpbmsg
ZnJlcXVlbmN5IGhlcmUgYXMgd2VsbD8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gSW4g
cHJpbmNpcGxlIHRoaXMgZG9lcyBiZWxvbmcgdG8gdGhlIGVuZHBvaW50IGFzIGxpbmsgZnJlcXVl
bmNpZXMgYXJlDQo+ID4gPiA+ID4gPiA+IHNwZWNpZmljIHRvIHRoYXQsIGJ1dCBJIGRvbid0IG1p
bmQ7IHRoZXJlJ3MganVzdCBhIHNpbmdsZSBwb3J0IGFueXdheS4NCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGlzIGlzIGFuIG9wdGlvbmFsIHByb3BlcnR5IHdoaWNo
IHdlIG1vZGVsIGFzIGFuIGFycmF5IG9mIDxsaW5rIHNwZWVkLA0KPiA+ID4gPiA+ID4gY2xvY2sg
dm9sdGFnZT4gcGFpcnMuIEFuIGV4YW1wbGUgdG8gaGF2ZSBhbGwgbGluayBzcGVlZHMgdXAgdG8g
MzkwTUh6DQo+ID4gPiA+ID4gPiB1c2UgdGhlIHZhbHVlIDQgZm9yIGN1cnJlbnQgZHJpdmVyLiBJ
ZiBvbmUgd2FudHMgdG8gc2VsZWN0IGRpZmZlcmVudA0KPiA+ID4gPiA+ID4gdm9sdGFnZSBmb3Ig
ZGlmZmVyZW50IGxpbmssIHRoZXkgY291bGQgZG8gc28gYXMgd2VsbC4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IElmIHlvdSB0aGluayB5b3UnZCBuZWVkIHRoYXQsIHRoZW4geW91IG5lZWQgdG8gcHV0
IHRoaXMgdG8gdGhlIGVuZHBvaW50Lg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgbWlwaS1jbG9jay12
b2x0YWdlIHByb3BlcnR5IGlzIG5vdCBhIHByb3BlcnR5IG9mIHRoZSBlbmRwb2ludC4gVGhlDQo+
ID4gPiA+IGxpbmsgZnJlcXVlbmN5IHRoZXJlIGRvZXMgbm90IHNldCB0aGUgbGluayBmcmVxdWVu
Y3kgLSBpdCBvbmx5DQo+ID4gPiA+IHNwZWNpZmllcyB3aGljaCBsaW5rIGZyZXF1ZW5jeSB0aGUg
Z2l2ZW4gdm9sdGFnZSBzaG91bGQgYmUgdXNlZCBmb3IuDQo+ID4gPg0KPiA+ID4gSWYgaXQgaXMg
bm90IGJvdW5kIHRvIHRoZSBlbmRwb2ludCAtLS0gdGhhdCBzcGVjaWZpZXMgdGhlIHByb3BlcnRp
ZXMgb2YgdGhlDQo+ID4gPiBsaW5rIC0tLSB0aGVuIHlvdSBjb3VsZCBqdXN0IHB1dCBpdCB0byB0
aGUgZHJpdmVyLCBjb3VsZG4ndCB5b3U/DQo+ID4gPg0KPiA+ID4gQnV0IGVhcmxpZXIgb24sIHdl
IGVzdGFibGlzaGVkIHRoYXQgdGhpcyBpcyBzcGVjaWZpYyB0byBhIGdpdmVuIGJvYXJkLCBvciBh
DQo+ID4gPiBnaXZlbiBsaW5rLiBFbmRwb2ludHMgYXJlIHVzZWQgdG8gZGVzY3JpYmUgY29ubmVj
dGlvbnMgdGhhdCBhIGRldmljZSBtYXkNCj4gPiA+IGhhdmUgdG8gb3RoZXIgZGV2aWNlcy4gVGhl
cmVmb3JlIHRoZWlyIHByb3BlcnRpZXMgYXJlIGRpZmZlcmVudC4NCj4gPiA+DQo+ID4gPiBUaGUg
Z3JhcGggYmluZGluZ3MgYWxsb3cgZm9yIHNldmVyYWwgZW5kcG9pbnRzIG9uIGEgc2luZ2xlIHBo
eXNpY2FsIHBvcnQsDQo+ID4gPiBzb21lIG1heSBiZSBkaXNhYmxlZCBpbiB0aGF0IGNhc2UuIFRo
aXMgaXMgYWRtaXR0ZWRseSBtb3N0bHkgZG9uZSB3aXRoDQo+ID4gPiBDU0ktMiByZWNlaXZlcnMu
DQo+ID4gPg0KPiA+ID4gRWl0aGVyIHdheSwgcHV0dGluZyB0aGlzIHByb3BlcnR5IHRvIHRoZSBk
ZXZpY2UgbWF5IGFmZmVjdCBob3cgRFQgc291cmNlIGlzDQo+ID4gPiBhcnJhbmdlZCBmb3IgYm9h
cmRzIHRoYXQgaGF2ZSB0aGlzIGRldmljZS4gQW55IHNpbWlsYXIgY29uZmlndXJhdGlvbiBvbg0K
PiA+ID4gb3RoZXIgZGV2aWNlcyB3aXRoIG11bHRpcGxlIHRyYW5zbWl0dGVycyBvciByZWNlaXZl
cnMgd291bGQgYmUgaW4gZW5kcG9pbnRzDQo+ID4gPiBhbnl3YXkgLS0tIGJlY2F1c2UgdGhleSBo
YXZlIHRvLCBzbyBJIGRvbid0IHNlZSB3aHkgYmluZGluZ3MgZm9yIHRoaXMNCj4gPiA+IGRldmlj
ZSBzaG91bGQgYmUgZGlmZmVyZW50Lg0KPiA+ID4NCj4gPiA+IElmIHlvdSBwdXQgaXQgdG8gZW5k
cG9pbnQsIHRoZSBkcml2ZXIgYWxzbyBkb2Vzbid0IG5lZWQgdG8gbWF0Y2ggdGhlIGxpbmsNCj4g
PiA+IGZyZXF1ZW5jaWVzIGluIGtIeiBhbmQgSHogYmV0d2VlbiB0aGUgdHdvIHByb3BlcnRpZXMs
IGJ1dCBqdXN0IHVzZSB0aGUgc2FtZQ0KPiA+ID4gaW5kZXggZm9yIGJvdGguDQo+ID4gDQo+ID4g
SSBhZ3JlZSBpbiBnZW5lcmFsLCBidXQgSSB0aGluayBpbiB0aGlzIGNhc2UgdGhpcyBpcyBhIGRl
dmljZS1zcGVjaWZpYw0KPiA+IHByb3BlcnR5IGFuZCB0aGUgc2Vuc29yIG9ubHkgaGFzIDEgQ1NJ
LTIgaW50ZXJmYWNlLCBzbyBtYXliZSBpdA0KPiA+IGRvZXNuJ3QgcmVhbGx5IG1hdHRlcj8NCj4g
PiANCj4gPiBTcGVjaWZ5aW5nIGZyZXF1ZW5jeSwgdm9sdGFnZSBwYWlycyBpcyBhIGNvbW1vbiBw
cmFjdGljZSBpbiBvdGhlcg0KPiA+IGJpbmRpbmdzLCBzdWNoIGFzIHRoZSBPUFAgYmluZGluZ3Ms
IGJ5IHRoZSB3YXkuDQo+ID4gDQo+ID4gVGhhdCBzYWlkLCBpZiB5b3UgaW5zaXN0LCBJJ20gZmlu
ZSB3aXRoIHRoaXMgYmVpbmcgbW92ZWQgdG8gdGhlDQo+ID4gZW5kcG9pbnQgbm9kZSB0b28uDQo+
IA0KPiBQbGVhc2UsIHVubGVzcyB0aGVyZSBhcmUgc291bmQgdGVjaG5pY2FsIHJlYXNvbnMgdG8g
ZG8gb3RoZXJ3aXNlLg0KPiANCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lg0KDQpJbiBmYWN0
IEknbSBzdGlsbCB3b25kZXIgd2hldGhlciAnTUlQSSBjbG9jayB2b2x0YWdlIHVuaXQnIGhlcmUg
aXMgYQ0KdmVyeSBjb21tb24gb3IgbWVhbmluZ2Z1bCBwcm9wZXJ0eSB0aGF0IG5lZWRzIHRvIGJl
IG1vdmVkIHRvIHRoZQ0KZW5kcG9pbnQgZGF0YSBzdHJ1Y3R1cmUgaW4gdjRsMiBmcmFtZXdvcmsu
IEp1c3QgYmVjYXVzZSBpdCByZWxhdGVzIHRvDQpsaW5rIGZyZXF1ZW5jeT8NCg0KSW4gYW5vdGhl
ciB3b3JkcywgaWYgd2Ugc2V0IGNsb2NrIHZvbHRhZ2UgYXMgYSBzZXBhcmF0ZSBwcm9wZXJ0eSwg
YXMNCnBhdGNoc2V0IDEzIG9yIGVhcmxpZXIgdmVyc2lvbiBwcmVzZW50cywgaXMgdGhlcmUgbm8g
bmVlZCB0byBtb3ZlIHRoZQ0KcG9zaXRpb24/DQoNCg==

