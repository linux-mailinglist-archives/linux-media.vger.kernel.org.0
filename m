Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01CDC25CFCB
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 05:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbgIDD0F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 23:26:05 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:34198 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729554AbgIDD0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 23:26:00 -0400
X-UUID: 43fdaa7ccd6a4e4b992e6270e1318647-20200904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MgYZSn5dO120VGKzJXvetFyHicODTuH1UC+5Qr8NQKo=;
        b=RfFQcZ/956mQaCGQB8khZaUU64zSLA4lYxxs/0i+gC/TuB2wxWY1YlcCtXGUNtkKMhIQm1tZMo29EqPXPNLGv3Xz57DGpdqkCuVuQt7Cc9XdgSfeQVs3h/ORocY9PlmB+V7Bx1ALyaK0eLEoicHa8kEsXGcTR/I0Cltbxx+z8pw=;
X-UUID: 43fdaa7ccd6a4e4b992e6270e1318647-20200904
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1034218313; Fri, 04 Sep 2020 11:25:54 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Sep
 2020 11:25:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 11:25:50 +0800
Message-ID: <1599189850.4733.26.camel@mhfsdcap03>
Subject: Re: [PATCH v14 1/2] media: dt-bindings: media: i2c: Document
 OV02A10 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     <robh+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <mark.rutland@arm.com>, <shengnan.wang@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <andriy.shevchenko@linux.intel.com>, <matthias.bgg@gmail.com>,
        <devicetree@vger.kernel.org>, <sj.huang@mediatek.com>,
        <sakari.ailus@linux.intel.com>, <louis.kuo@mediatek.com>,
        <drinkcat@chromium.org>, <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <mchehab@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <bingbu.cao@intel.com>,
        <dongchun.zhu@mediatek.com>, <matrix.zhu@aliyun.com>
Date:   Fri, 4 Sep 2020 11:24:10 +0800
In-Reply-To: <20200903161346.GA2875415@bogus>
References: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
         <20200902120122.24456-2-dongchun.zhu@mediatek.com>
         <20200903161346.GA2875415@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A7ECABCC12E377294537EB3BB11E063BA24C5E44B727A27FB45E9077160807172000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gUm9iLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIFRodSwgMjAyMC0wOS0w
MyBhdCAxMDoxMyAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgMDIgU2VwIDIw
MjAgMjA6MDE6MjEgKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBBZGQgWUFNTCBkZXZp
Y2UgdHJlZSBiaW5kaW5nIGZvciBPVjAyQTEwIENNT1MgaW1hZ2Ugc2Vuc29yLA0KPiA+IGFuZCB0
aGUgcmVsZXZhbnQgTUFJTlRBSU5FUlMgZW50cmllcy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4g
IC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwgICAgICAgICAgIHwgMTYx
ICsrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTY4
IGluc2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCj4gPiANCj4gDQo+
IA0KPiBNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycg
b24geW91ciBwYXRjaDoNCj4gDQo+IEVycm9yOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC5leGFtcGxlLmR0czoyOC40NS00NiBzeW50YXgg
ZXJyb3INCj4gRkFUQUwgRVJST1I6IFVuYWJsZSB0byBwYXJzZSBpbnB1dCB0cmVlDQo+IG1ha2Vb
MV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5saWI6MzQyOiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC5leGFtcGxlLmR0LnlhbWxdIEVycm9y
IDENCj4gbWFrZVsxXTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4NCj4gbWFr
ZTogKioqIFtNYWtlZmlsZToxMzY2OiBkdF9iaW5kaW5nX2NoZWNrXSBFcnJvciAyDQo+IA0KPiAN
Cj4gU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTM1NTcyMw0KPiANCj4g
SWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2Vl
IHRoZSBhYm92ZQ0KPiBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgZHQtc2NoZW1hIGlzIHVwIHRv
IGRhdGU6DQo+IA0KPiBwaXAzIGluc3RhbGwgZ2l0K2h0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0
cmVlLW9yZy9kdC1zY2hlbWEuZ2l0QG1hc3RlciAtLXVwZ3JhZGUNCj4gDQo+IFBsZWFzZSBjaGVj
ayBhbmQgcmUtc3VibWl0Lg0KPiANCg0KU28gbXVjaCBzb3JyeSBmb3IgdGhlIG1pc3Rha2UgSSd2
ZSBtYWRlLg0KSSBmb3Jnb3QgdG8gaW5jbHVkZSB0aGUgaGVhZGVyIGZpbGUgJ2R0LWJpbmRpbmdz
L2dwaW8vZ3Bpby5oJy4NClRoaXMgd291bGQgYmUgZml4ZWQgaW4gbmV4dCByZWxlYXNlIDotKQ0K
DQoNCg==

