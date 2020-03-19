Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2285E18B2C0
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 12:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgCSLzT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 07:55:19 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:10621 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726998AbgCSLzS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 07:55:18 -0400
X-UUID: 1bff79c0f44e422180321699ee8622b8-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=FLsmkHJTejAiVrcG26B7Mjj7M9Wn+0Q8IDeLw5c59Hc=;
        b=Pd7SSTefh0MrG4TdS7RwTPq/ifDVK3eMan7B1l1bdaBpvM5znv7Fw8YaAUXU5gI17qV2cULleGJ1yctqQed2/R0HbSv+kJcUgWSVTmyQqjY6viQ58a65S/AGXzxo1kZaDwTql5Lp0bUYiWWoU84C6fdBCiDRHNEYDAfhhDLlANE=;
X-UUID: 1bff79c0f44e422180321699ee8622b8-20200319
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 472836935; Thu, 19 Mar 2020 19:54:31 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 19 Mar
 2020 19:53:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Mar 2020 19:54:11 +0800
Message-ID: <1584618861.5781.69.camel@mhfsdcap03>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        "Tomasz Figa" <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>, <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        <sj.huang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>
Date:   Thu, 19 Mar 2020 19:54:21 +0800
In-Reply-To: <20200319113611.GJ1922688@smile.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
         <20200228155958.20657-3-dongchun.zhu@mediatek.com>
         <20200305120516.GQ5379@paasikivi.fi.intel.com>
         <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
         <1584612215.5781.62.camel@mhfsdcap03>
         <20200319113611.GJ1922688@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AF442A7775ED82EC5799039873DB4E926EA64828482E17C5046CDA13BAF303552000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQW5keSwNCg0KT24gVGh1LCAyMDIwLTAzLTE5IGF0IDEzOjM2ICswMjAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjAzOjM1UE0gKzA4MDAs
IERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjAtMDMtMTAgYXQgMTI6MTAgKzAy
MDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiA+IE9uIFRodSwgTWFyIDUsIDIwMjAgYXQg
MjowNyBQTSBTYWthcmkgQWlsdXMNCj4gPiA+IDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29t
PiB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMTE6NTk6NThQTSArMDgw
MCwgRG9uZ2NodW4gWmh1IHdyb3RlOg0KPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIFY0TDIg
c3ViLWRldmljZSBkcml2ZXIgZm9yIERXOTc2OCBsZW5zIHZvaWNlIGNvaWwsDQo+ID4gPiA+ID4g
YW5kIHByb3ZpZGVzIGNvbnRyb2wgdG8gc2V0IHRoZSBkZXNpcmVkIGZvY3VzIHZpYSBJMkMgc2Vy
aWFsIGludGVyZmFjZS4NCj4gPiA+IA0KPiA+ID4gLi4uDQo+ID4gPiANCj4gPiA+ID4gPiAtLS0g
YS9NQUlOVEFJTkVSUw0KPiA+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJTDQo+ID4gPiA+ID4gQEAg
LTUxMzksNiArNTEzOSw3IEBAIE06ICAgICAgRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVk
aWF0ZWsuY29tPg0KPiA+ID4gPiA+ICBMOiAgIGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0K
PiA+ID4gPiA+ICBUOiAgIGdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KPiA+
ID4gPiA+ICBTOiAgIE1haW50YWluZWQNCj4gPiA+ID4gPiArRjogICBkcml2ZXJzL21lZGlhL2ky
Yy9kdzk3NjguYw0KPiA+ID4gPiA+ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCj4gPiA+IA0KPiA+ID4gVGhpcyBo
YXMgb3JkZXJpbmcgaXNzdWVzLg0KPiA+ID4gUnVuIHBhcnNlLW1haW50YWluZXJzLnBsIHRvIGZp
eC4NCj4gPiA+IA0KPiA+IA0KPiA+IFBhcmRvbiwgaG93IHRvIHJ1biBwYXJzZS1tYWludGFpbmVy
cy5wbD8NCj4gPiBMb2NhbGx5IEkgcmFuIHRoaXMgc2NyaXB0LCBpdCBvY2N1cnMgc29tZSBzeW50
YXggYXMgYmVsb3cuDQo+ID4gJC4vc2NyaXB0cy9wYXJzZS1tYWludGFpbmVycy5wbA0KPiANCj4g
SXQncyBhIHBlcmwgc2NyaXB0IHdoaWNoIGlzIG1hZGUgbm9uLWV4ZWN1dGFibGUgYnkgc29tZSBy
ZWFzb24uDQo+IA0KPiBTbywgcHJvcGVyIHJ1biBhcyBhIHBhcmFtZXRlciB0byB0aGUgbGFuZ3Vh
Z2UgaW50ZXJwcmV0ZXIsIGkuZS4NCj4gCSQgcGVybCBzY3JpcHRzL3BhcnNlLW1haW50YWluZXIu
cGwNCj4gDQoNCkkgdHJpZWQtcnVuIGFnYWluIG9uIG10ayBzZXJ2ZXIsIHdoaWNoIGhhcyBwZXJs
NSh2ZXJzaW9uIDE4LjIpLg0KQnV0IGl0IHN0aWxsIHJlcG9ydCB0aGUgc2FtZSBlcnJvci4NCklz
IHRoZXJlIGFueSByZXF1aXJlbWVudCBmb3IgcGVybCB2ZXJzaW9uPw0KDQokcGVybCBzY3JpcHRz
L3BhcnNlLW1haW50YWluZXJzLnBsDQpzeW50YXggZXJyb3IgYXQgc2NyaXB0cy9wYXJzZS1tYWlu
dGFpbmVycy5wbCBsaW5lIDEwOCwgbmVhciAiJGhhc2hyZWZ7Ig0KR2xvYmFsIHN5bWJvbCAiJHBh
dHRlcm4iIHJlcXVpcmVzIGV4cGxpY2l0IHBhY2thZ2UgbmFtZSBhdA0Kc2NyaXB0cy9wYXJzZS1t
YWludGFpbmVycy5wbCBsaW5lIDEwOS4NCnN5bnRheCBlcnJvciBhdCBzY3JpcHRzL3BhcnNlLW1h
aW50YWluZXJzLnBsIGxpbmUgMTEyLCBuZWFyICJ9Ig0KR2xvYmFsIHN5bWJvbCAiJGZpbGUiIHJl
cXVpcmVzIGV4cGxpY2l0IHBhY2thZ2UgbmFtZSBhdA0Kc2NyaXB0cy9wYXJzZS1tYWludGFpbmVy
cy5wbCBsaW5lIDExMy4NCkNhbid0IHVzZSBnbG9iYWwgQF8gaW4gIm15IiBhdCBzY3JpcHRzL3Bh
cnNlLW1haW50YWluZXJzLnBsIGxpbmUgMTE3LA0KbmVhciAiKEBfIg0Kc3ludGF4IGVycm9yIGF0
IHNjcmlwdHMvcGFyc2UtbWFpbnRhaW5lcnMucGwgbGluZSAxNTIsIG5lYXIgIn0iDQpFeGVjdXRp
b24gb2Ygc2NyaXB0cy9wYXJzZS1tYWludGFpbmVycy5wbCBhYm9ydGVkIGR1ZSB0byBjb21waWxh
dGlvbg0KZXJyb3JzLg0KDQpMb2NhbCBwZXJsIHZlcnNpb24gaXMgYXMgYmVsb3cuDQokbHMgLWFs
IC91c3IvYmluL3BlcmwNCnBlcmwgICAgICAgIHBlcmw1LjE4LjIgDQo=

