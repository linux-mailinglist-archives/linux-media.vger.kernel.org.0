Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACD591989D6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2020 04:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729609AbgCaCQa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 22:16:30 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:16902 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729239AbgCaCQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 22:16:30 -0400
X-UUID: 02dd4ef304ed4ed18834aaebcf31c48d-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=Pi2gmU7gUHGbZuSoj+0wP9cb73MBtHR0fEjpiake8os=;
        b=GMdHIBZw5IMWn6sQD7pbCNChTp5zKhE7hbHaMyfK8fyV/GrD3w+7aIfGZRqQN7ouclwJCGnCqdKXDEH8ZG04TdBss9yFTzgCYEyvxNMqzDgCcpHblbuJQ2U+zAi5X5mJgEttueYPwKWXsI4sHzEsAnqt1J+MlVzrOOoAbwF3lGk=;
X-UUID: 02dd4ef304ed4ed18834aaebcf31c48d-20200331
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 589410140; Tue, 31 Mar 2020 10:16:14 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 31 Mar
 2020 10:16:12 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 31 Mar 2020 10:16:10 +0800
Message-ID: <1585620980.5781.80.camel@mhfsdcap03>
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
Date:   Tue, 31 Mar 2020 10:16:20 +0800
In-Reply-To: <20200330135751.GQ1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
         <20200330123634.363-3-dongchun.zhu@mediatek.com>
         <20200330135751.GQ1922688@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B146E5EF035629031CDCFBF9CF89F0AFC588A22BD4E14778C43D5F924A3AA11C2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBNb24sIDIwMjAtMDMtMzAg
YXQgMTY6NTcgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gTW9uLCBNYXIgMzAs
IDIwMjAgYXQgMDg6MzY6MzRQTSArMDgwMCwgRG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+IFRoaXMg
cGF0Y2ggYWRkcyBhIFY0TDIgc3ViLWRldmljZSBkcml2ZXIgZm9yIERXOTc2OCB2b2ljZSBjb2ls
IG1vdGVyLA0KPiA+IHByb3ZpZGluZyBjb250cm9sIHRvIHNldCB0aGUgZGVzaXJlZCBmb2N1cyB2
aWEgSTJDIHNlcmlhbCBpbnRlcmZhY2UuDQo+IA0KPiAuLi4NCj4gDQo+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZGV2X3BtX29wcyBkdzk3NjhfcG1fb3BzID0gew0KPiA+ICsJU0VUX1NZU1RFTV9T
TEVFUF9QTV9PUFMocG1fcnVudGltZV9mb3JjZV9zdXNwZW5kLA0KPiA+ICsJCQkJcG1fcnVudGlt
ZV9mb3JjZV9yZXN1bWUpDQo+ID4gKwlTRVRfUlVOVElNRV9QTV9PUFMoZHc5NzY4X3J1bnRpbWVf
c3VzcGVuZCwgZHc5NzY4X3J1bnRpbWVfcmVzdW1lLCBOVUxMKQ0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiArc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGR3OTc2OF9pMmNfZHJpdmVyID0gew0KPiA+ICsJ
LmRyaXZlciA9IHsNCj4gPiArCQkubmFtZSA9IERXOTc2OF9OQU1FLA0KPiANCj4gPiArCQkucG0g
PSBJU19FTkFCTEVEKENPTkZJR19QTSkgPyAmZHc5NzY4X3BtX29wcyA6IE5VTEwsDQo+IA0KPiBX
aGF0IGlzIHRoaXMgY29uZGl0aW9uYWwgZm9yPw0KPiANCg0KRm9yIHRoZSBkdzk3NjhfcG1fb3Bz
LCBoZXJlIG15IGlkZWEgaXMgdG8gdXNlIGFuIElTX0VOQUJMRUQoKSBjaGVjayB0bw0KYXZvaWQg
ZGVmaW5pbmcgdGhlIHN0cnVjdHVyZSB3aGVuIENPTkZJR19QTSBpcyBub3Qgc2V0Lg0KDQo+ID4g
KwkJLm9mX21hdGNoX3RhYmxlID0gZHc5NzY4X29mX3RhYmxlLA0KPiA+ICsJfSwNCj4gPiArCS5w
cm9iZV9uZXcgID0gZHc5NzY4X3Byb2JlLA0KPiA+ICsJLnJlbW92ZSA9IGR3OTc2OF9yZW1vdmUs
DQo+ID4gK307DQo+IA0KPiA+ICsNCj4gDQo+IEV4dHJhIGJsYW5rIGxpbmUuDQo+IA0KDQpXZWly
ZCwgbW9zdCBWNEwyIGRyaXZlcihJMkMgY2xpZW50KSBzZWVtcyB0byBrZWVwIHRoaXMgYmxhbmsg
bGluZS4NClNha2FyaSwgaXMgaXQgc3RpbGwgdGhlIGNhc2Ugb3IgYW0gSSBtaXN0YWtlbj8NCg0K
PiA+ICttb2R1bGVfaTJjX2RyaXZlcihkdzk3NjhfaTJjX2RyaXZlcik7DQo+IA0KDQo=

