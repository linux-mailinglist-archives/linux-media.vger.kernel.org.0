Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1889A28D852
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 04:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgJNCKj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 22:10:39 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:49131 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727630AbgJNCK0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 22:10:26 -0400
X-UUID: cae3ee856f8d4f67afb6a69bdf03ac7e-20201014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=4Q2q9B+1WXxYA2muWdcDjPj8VFCNwkYxZxmEFcRvFfE=;
        b=SDuzqB+sPWPu5KW0krE+LjpZ8qu6LuTn4udK1Ac+Z/hihj7AHkq3Qow2q7OjKW707IWdOYjRy3xLkzZHUaI15QCEezfeS/XyjVY5mFthJzlR/5ybepgJb99rz6VjHD5rYwasTUJQGe3GMNk3AjeEi37eCzhSPPWvwSHNuwulmm0=;
X-UUID: cae3ee856f8d4f67afb6a69bdf03ac7e-20201014
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1051578871; Wed, 14 Oct 2020 10:10:19 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Oct
 2020 10:10:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 10:10:18 +0800
Message-ID: <1602641418.4733.80.camel@mhfsdcap03>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <bingbu.cao@intel.com>,
        <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Date:   Wed, 14 Oct 2020 10:10:18 +0800
In-Reply-To: <20201013161938.GE13341@paasikivi.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
         <20201013130503.2412-2-dongchun.zhu@mediatek.com>
         <20201013161938.GE13341@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB1C224051110C1485A7323D0EF350AE1767638B0BFB10FB6D89B887DDD8727B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gU2FrYXJpLA0KDQpUaGFua3MgZm9yIHlvdXIgdGltZWx5IHJldmlldy4NCg0KT24gVHVl
LCAyMDIwLTEwLTEzIGF0IDE5OjE5ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+IEhpIERv
bmdjaHVuLA0KPiANCj4gT24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgMDk6MDU6MDJQTSArMDgwMCwg
RG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+IEFkZCBZQU1MIGRldmljZSB0cmVlIGJpbmRpbmcgZm9y
IE9WMDJBMTAgQ01PUyBpbWFnZSBzZW5zb3IsIGFuZCB0aGUNCj4gPiByZWxldmFudCBNQUlOVEFJ
TkVSUyBlbnRyaWVzLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9u
Z2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlh
L2kyYy9vdnRpLG92MDJhMTAueWFtbCAgICAgICAgICAgfCAxNjIgKysrKysrKysrKysrKysrKysr
KysrDQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA3ICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNjkgaW5zZXJ0aW9ucygrKQ0KPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0KPiA+IA0KDQpbc25pcF0uLi4NCg0KPiA+ICsgIG92
dGksbWlwaS1jbG9jay12b2x0YWdlOg0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAg
IEFuIGFycmF5IG9mIDItdHVwbGVzIGl0ZW1zLCBhbmQgZWFjaCBpdGVtIGNvbnNpc3RzIG9mIGxp
bmsgZnJlcXVlbmN5IGFuZA0KPiA+ICsgICAgICBNSVBJIGNsb2NrIHZvbHRhZ2UgdW5pdCBsaWtl
IDxmcmVxLWtIeiB2b2x0LXVuaXQ+LiBDbG9jayB2b2x0YWdlIHVuaXQgaXMNCj4gPiArICAgICAg
ZGVwZW5kZW50IHVwb24gbGluayBzcGVlZCwgaW5kaWNhdGluZyBNSVBJIHRyYW5zbWlzc2lvbiBz
cGVlZCBzZWxlY3QgdGhhdA0KPiA+ICsgICAgICBjb250cm9scyBELVBIWSB0aW1pbmcgc2V0dGlu
ZyBieSBhZGp1c3RpbmcgTUlQSSBjbG9jayB2b2x0YWdlIHRvIGltcHJvdmUNCj4gPiArICAgICAg
dGhlIGNsb2NrIGRyaXZlciBjYXBhYmlsaXR5Lg0KPiA+ICsgICAgJHJlZjogIi9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheSINCj4gPiArICAgIG1pbkl0ZW1zOiAy
DQo+ID4gKyAgICBkZWZhdWx0OiBbMzkwMDAwLCA0XQ0KPiANCj4gV2h5IGRvIHlvdSBoYXZlIHRo
ZSBsaW5rIGZyZXF1ZW5jeSBoZXJlIGFzIHdlbGw/DQo+IA0KPiBJbiBwcmluY2lwbGUgdGhpcyBk
b2VzIGJlbG9uZyB0byB0aGUgZW5kcG9pbnQgYXMgbGluayBmcmVxdWVuY2llcyBhcmUNCj4gc3Bl
Y2lmaWMgdG8gdGhhdCwgYnV0IEkgZG9uJ3QgbWluZDsgdGhlcmUncyBqdXN0IGEgc2luZ2xlIHBv
cnQgYW55d2F5Lg0KPiANCg0KVGhpcyBpcyBhbiBvcHRpb25hbCBwcm9wZXJ0eSB3aGljaCB3ZSBt
b2RlbCBhcyBhbiBhcnJheSBvZiA8bGluayBzcGVlZCwNCmNsb2NrIHZvbHRhZ2U+IHBhaXJzLiBB
biBleGFtcGxlIHRvIGhhdmUgYWxsIGxpbmsgc3BlZWRzIHVwIHRvIDM5ME1Ieg0KdXNlIHRoZSB2
YWx1ZSA0IGZvciBjdXJyZW50IGRyaXZlci4gSWYgb25lIHdhbnRzIHRvIHNlbGVjdCBkaWZmZXJl
bnQNCnZvbHRhZ2UgZm9yIGRpZmZlcmVudCBsaW5rLCB0aGV5IGNvdWxkIGRvIHNvIGFzIHdlbGwu
DQoNCg==

