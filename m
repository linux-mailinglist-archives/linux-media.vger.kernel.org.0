Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A95BA18B0D2
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 11:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgCSKDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 06:03:50 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:28059 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726663AbgCSKDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 06:03:50 -0400
X-UUID: c72239bd6bf04386b49ecb403e10a707-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=NQc97c+bFcajvwqMNAIU5Im4/Ht7RtZjA7gAha/i0is=;
        b=PzQZfb2qdoPZppyDhZw2qodlmIbRahFn37M/cZS+fJSV1IO6WkDJ4jmxpHehxJpkTEcT6QiJD5RQkKj4eH9n0wce63YBduPXBOLmEDsjFScNVeE/Cw/CRemAUyNOQBqiVnPKDlQUB3g1+/Y2WHa4i4irDIekYFfx2ZI8EYgb8V0=;
X-UUID: c72239bd6bf04386b49ecb403e10a707-20200319
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1258962981; Thu, 19 Mar 2020 18:03:35 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 19 Mar
 2020 18:03:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 18:03:24 +0800
Message-ID: <1584612215.5781.62.camel@mhfsdcap03>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        <sj.huang@mediatek.com>,
        "Linux Media Mailing List" <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Thu, 19 Mar 2020 18:03:35 +0800
In-Reply-To: <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
         <20200228155958.20657-3-dongchun.zhu@mediatek.com>
         <20200305120516.GQ5379@paasikivi.fi.intel.com>
         <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AAF735A607185470B296EBAC9A1830596A83AB95D1C73C00CFE0BC853D96BD352000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KT24gVHVlLCAyMDIwLTAzLTEwIGF0IDEyOjEwICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFRodSwgTWFyIDUsIDIwMjAgYXQgMjowNyBQTSBTYWthcmkgQWls
dXMNCj4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+IE9uIEZyaSwg
RmViIDI4LCAyMDIwIGF0IDExOjU5OjU4UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4g
PiA+IFRoaXMgcGF0Y2ggYWRkcyBhIFY0TDIgc3ViLWRldmljZSBkcml2ZXIgZm9yIERXOTc2OCBs
ZW5zIHZvaWNlIGNvaWwsDQo+ID4gPiBhbmQgcHJvdmlkZXMgY29udHJvbCB0byBzZXQgdGhlIGRl
c2lyZWQgZm9jdXMgdmlhIEkyQyBzZXJpYWwgaW50ZXJmYWNlLg0KPiANCj4gLi4uDQo+IA0KPiA+
ID4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiBAQCAt
NTEzOSw2ICs1MTM5LDcgQEAgTTogICAgICBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRp
YXRlay5jb20+DQo+ID4gPiAgTDogICBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+
ICBUOiAgIGdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KPiA+ID4gIFM6ICAg
TWFpbnRhaW5lZA0KPiA+ID4gK0Y6ICAgZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCj4gPiA+
ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dv
b24sZHc5NzY4LnlhbWwNCj4gDQo+IFRoaXMgaGFzIG9yZGVyaW5nIGlzc3Vlcy4NCj4gUnVuIHBh
cnNlLW1haW50YWluZXJzLnBsIHRvIGZpeC4NCj4gDQoNClBhcmRvbiwgaG93IHRvIHJ1biBwYXJz
ZS1tYWludGFpbmVycy5wbD8NCkxvY2FsbHkgSSByYW4gdGhpcyBzY3JpcHQsIGl0IG9jY3VycyBz
b21lIHN5bnRheCBhcyBiZWxvdy4NCiQuL3NjcmlwdHMvcGFyc2UtbWFpbnRhaW5lcnMucGwNCnN5
bnRheCBlcnJvciBhdCAuL3NjcmlwdHMvcGFyc2UtbWFpbnRhaW5lcnMucGwgbGluZSAxMDgsIG5l
YXINCiIkaGFzaHJlZnsiDQpHbG9iYWwgc3ltYm9sICIkcGF0dGVybiIgcmVxdWlyZXMgZXhwbGlj
aXQgcGFja2FnZSBuYW1lDQphdCAuL3NjcmlwdHMvcGFyc2UtbWFpbnRhaW5lcnMucGwgbGluZSAx
MDkuDQpzeW50YXggZXJyb3IgYXQgLi9zY3JpcHRzL3BhcnNlLW1haW50YWluZXJzLnBsIGxpbmUg
MTEyLCBuZWFyICJ9Ig0KR2xvYmFsIHN5bWJvbCAiJGZpbGUiIHJlcXVpcmVzIGV4cGxpY2l0IHBh
Y2thZ2UgbmFtZQ0KYXQgLi9zY3JpcHRzL3BhcnNlLW1haW50YWluZXJzLnBsIGxpbmUgMTEzLg0K
Q2FuJ3QgdXNlIGdsb2JhbCBAXyBpbiAibXkiIGF0IC4vc2NyaXB0cy9wYXJzZS1tYWludGFpbmVy
cy5wbCBsaW5lIDExNywNCm5lYXIgIihAXyINCnN5bnRheCBlcnJvciBhdCAuL3NjcmlwdHMvcGFy
c2UtbWFpbnRhaW5lcnMucGwgbGluZSAxNTIsIG5lYXIgIn0iDQpFeGVjdXRpb24gb2YgLi9zY3Jp
cHRzL3BhcnNlLW1haW50YWluZXJzLnBsIGFib3J0ZWQgZHVlIHRvIGNvbXBpbGF0aW9uDQplcnJv
cnMuDQoNCg==

