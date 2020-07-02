Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96732121BD
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 13:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgGBLGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 07:06:46 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:36585 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726475AbgGBLGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 07:06:44 -0400
X-UUID: 83c88d5aa76a4475bb8525fa21e591c7-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+4B3BW01TV9+2SP6lbnJU5Zv+3jreR1iD783yx5RyJE=;
        b=Asg2/UQ2SUy+gLq1l3UiFG3+T98ecVOWQQuYlC4cYQml5cVKvUwhyELTA2Bt5OyO6TwpiDhTRCOXHlrZB6V4Gd/2i8zS54HYX4eNUSr6FcEaWht0rlEu+x2tVXtKtC4S3RTEuy699Ulgt7RoGCauu/t+95xhgFWSwtlD5Wvwt88=;
X-UUID: 83c88d5aa76a4475bb8525fa21e591c7-20200702
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1749577032; Thu, 02 Jul 2020 19:06:31 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Jul
 2020 19:06:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 19:06:30 +0800
Message-ID: <1593687965.17166.73.camel@mhfsdcap03>
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "drinkcat@chromium.org" <drinkcat@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= 
        <erin.lo@mediatek.com>,
        "Louis Kuo =?UTF-8?Q?=28=E9=83=AD=E5=BE=B7=E5=AF=A7=29?=" 
        <louis.kuo@mediatek.com>,
        Sj Huang =?UTF-8?Q?=28=E9=BB=83=E4=BF=A1=E7=92=8B=29?= 
        <sj.huang@mediatek.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?= 
        <shengnan.wang@mediatek.com>, <dongchun.zhu@mediatek.com>
Date:   Thu, 2 Jul 2020 19:06:05 +0800
In-Reply-To: <20200702053449.GR16711@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
         <20200701091618.GN16711@paasikivi.fi.intel.com>
         <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
         <20200701134416.GQ16711@paasikivi.fi.intel.com>
         <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
         <20200702053449.GR16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C4F67179E8F6F04CCBF91D9FD0161E07F6A083280D043F28D6A3DBA89FC8293E2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpTb3JyeSBJIGp1c3Qgc2VudCBlbWFpbCB1c2luZyBvdXRsb29rIHdoZXJl
IGRlZmF1bHQgZm9ybWF0IGlzIEhUTUwsIG5vdw0KSSB1c2UgZXZvbHV0aW9uLCBvbmUgTGludXgg
bWFpbCBjbGllbnQgdGhhdCBJIHVzZWQgdG8gc2VuZCB1cHN0cmVhbQ0KcGF0Y2ggcHJldmlvdXNs
eS4NCg0KT24gVGh1LCAyMDIwLTA3LTAyIGF0IDA4OjM0ICswMzAwLCBTYWthcmkgQWlsdXMgd3Jv
dGU6DQo+IERvbmdjaHVuLA0KPiANCj4gUGxlYXNlIGRvbid0IHNlbmQgSFRNTCBlLW1haWwgdG8g
TGludXgga2VybmVsIHJlbGF0ZWQgbWFpbGluZyBsaXN0cy4NCj4gDQo+IE9uIFRodSwgSnVsIDAy
LCAyMDIwIGF0IDAzOjQ4OjU2QU0gKzAwMDAsIERvbmdjaHVuIFpodSAo5pyx5Lic5pilKSB3cm90
ZToNCj4gPiAgSGkgU2FrYXJpLA0KPiA+IA0KPiA+ICBTb3JyeSB0byBib3RoZXIgeW91IGFnYWlu
LCBidXQgSSBhbSBzbyBjb25mdXNlZCBhYm91dCB0aGUgcXVlc3Rpb25zIHlvdSByYWlzZWQuDQo+
ID4gIEkganVzdCBzeW5jZWQgbWFpbmxpbmU6IDUuOC1yYzMgdGFyYmFsbCBmcm9tIGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvLCBvbiB3aGljaCBJIHJhbiB0aGUgZ2l0IGFtIDxwYXRjaD4gY29tbWFu
ZC4NCj4gPiAgVGhlIHBhdGNoLWFwcGx5aW5nIHByb2Nlc3Mgc2hvd3Mgbm8gZXJyb3IuDQo+ID4g
IC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIFttdGsxNTAxM0Bt
dGtzbHQzMDcgbGludXhdJGdpdCBhcHBseSAtLWNoZWNrIG1lZGlhLWkyYy1BZGQtc3VwcG9ydC1m
b3ItRFc5NzY4LVZDTS5wYXRjaA0KPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRnaXQg
YW0gbWVkaWEtaTJjLUFkZC1zdXBwb3J0LWZvci1EVzk3NjgtVkNNLnBhdGNoDQo+ID4gIEFwcGx5
aW5nOiBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3VtZW50IERXOTc2OCBiaW5k
aW5ncw0KPiA+ICBBcHBseWluZzogbWVkaWE6IGkyYzogZHc5NzY4OiBBZGQgRFc5NzY4IFZDTSBk
cml2ZXINCj4gPiAgLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAN
Cj4gPiAgT24gdGhlIG90aGVyIGhhbmQsIEkgYWxzbyBjb21wYXJlZCBkb25nd29vbixkdzk3Njgu
eWFtbCBmaWxlIHdpdGggb3RoZXIgbWVkaWEgZGV2aWNlIGR0LWJpbmRpbmdzKGxpa2UgaW14MjE5
LnlhbWwgYW5kIG92ODg1Ni55YW1sKS4NCj4gPiAgSXQgc2VlbXMgdGhlcmUgYXJlIG5vIGFwcGFy
ZW50IGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlbS4NCj4gPiAgRXNwZWNpYWxseSwgdGhlIHNlbnRl
bmNlICcjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2Up
JyBzaGFsbCBiZSBjb21tb24uDQo+ID4gIEkgZHVubm8gd2h5IGhlcmUgZG9uZ3dvb24sZHc5NzY4
LnlhbWwgcmVwb3J0cyB0cmFpbGluZyB3aGl0ZXNwYWNlIHdhcm5pbmdzIHdoaWxlIG92ODg1Ni55
YW1sIGlzIHNpbGVudC4NCj4gPiANCj4gPiAgRm9yIHRoZSBwYXRjaCBmYWlsZWQgb24gTUFJTlRB
SU5FUlMsIEkgYW0gc3RpbGwgY3VyaW91cyB3aGF0J3Mgd3JvbmcuDQo+ID4gIEluIGZhY3QsIEkg
bG9jYWxseSBoYXZlIHJ1biBwYXJzZS1tYWludGFpbmVycy5wbCBzY3JpcHQgdG8gY2hlY2sgTUFJ
TlRBSU5FUlMgZmlsZSBiZWZvcmUgc3VibWl0dGluZyBwYXRjaC4NCj4gPiAgVGhlIHJlc3VsdCBh
bHNvIHJlcG9ydHMgbm8gZXJyb3JzLg0KPiA+ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRwZXJsIHNjcmlwdHMv
cGFyc2UtbWFpbnRhaW5lcnMucGwNCj4gPiAgW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0kbHMN
Cj4gPiAgLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiAg
QXMgdG8gQmFzZTY0IGVuY29kaW5nLCBJIGNoZWNrZWQgZWFjaCBwYXRjaCBmaWxlIGFnYWluLiBU
aGV5IGFyZSBhbGwgZW5jb2RlZCBpbiBVVEYtOC4NCj4gPiAgQXMgaHR0cHM6Ly93d3cuYmFzZTY0
ZW5jb2RlLm9yZy8gc2F5cywgZm9yIGFuIGV4YW1wbGUsICc3NycgaW4gQVNDSUkgZm9ybWF0IHdv
dWxkIGJlIGNoYW5nZWQgdG8gJ1QnIGluIEJhc2VkNjQtZW5jb2RlZCBmb3JtYXQuDQo+ID4gIFRo
aXMgbWVhbnMgdGhlcmUgc2hhbGwgYmUgbWVzc3kgY29kZSBpZiB3ZSBhZHBvdGluZyBCYXNlZDY0
LWVuY29kZWQgZm9ybWF0Lg0KPiA+ICBCdXQgSSBjYW5ub3Qgc2VlIGdhcmJsZWQgbWVzc2FnZXMg
aW4gdGhlIGN1cnJlbnQgcGF0Y2hlcy4NCj4gPiANCj4gPiAgVGhlIERXOTc2OCBzZXJpYWxzLXBh
dGNoIGlzIGF0dGFjaGVkLg0KPiA+ICBAVG9tYXN6IEBBbmR5IEBSb2IgY291bGQgYW55b25lIGhl
bHAgdHJ5IHRvIHNlZSB3aGV0aGVyIHRoZSBwYXRjaCBjYW4gYmUgY2hlcnJ5LXBpY2tlZCBvbiBM
aW51eCBtYXN0ZXIgYnJhbmNoIG9yIG5vdD8NCj4gPiAgUGF0Y2h3b3JrIGxpbms6DQo+ID4gIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTE2MzMyOTEvDQo+IA0KPiBCb3RoIG9m
IHRoZSBwYXRjaGVzIGFwcGVhciB0byBjb250YWluIG9ubHkgQVNDSUkgY2hhcmFjdGVycy4NCj4g
DQo+IEkgZGlkIHNvbWUgcmVzZWFyY2ggb24gdGhpcy4gSXQgc2VlbXMgdGhhdCB0aGUgYmFzZTY0
IGVuY29kZWQgbWVzc2FnZSBib2R5DQo+IGRvZXMgaGF2ZSBjYXJyaWFnZSByZXR1cm5zLCBpbiBi
b3RoIGNhc2VzLiBHaXQgYW0gZG9lcyBub3QgYXR0ZW1wdCB0bw0KPiByZW1vdmUgdGhlbSBpbiB0
aGF0IGNhc2UsIGJ1dCBQYXRjaHdvcmsgZG9lcy4gSGVuY2UgdGhlIGZpbGVzIGFyZSBmaW5lIGlm
DQo+IHlvdSBkb3dubG9hZCB0aGVtIGZyb20gUGF0Y2h3b3JrIC0tLSB3aGVyZSB0aGUgbWJveCBm
aWxlcyBoYXZlIG5laXRoZXINCj4gY2FycmlhZ2UgcmV0dXJucyBub3IgYmFzZTY0IGVuY29kaW5n
Lg0KPiANCj4gV2hhdCBkb2VzIHRoZSBmaWxlIGNvbW1hbmQgc2F5IGFib3V0IHRoZSBwYXRjaCBm
aWxlcyBwcm9kdWNlZCBieSBnaXQNCj4gZm9ybWF0LXBhdGNoPyBNeSBndWVzcyBpcyB0aGF0IHNv
bWV0aGluZyBpbiBiZXR3ZWVuIHlvdXIgbG9jYWwgY29tcHV0ZXIgYW5kDQo+IExNTUwgKGFuZCBv
dGhlciBtYWlsIHNlcnZlcnMpIGJhc2U2NCBlbmNvZGVzIHRoZSBtZXNzYWdlIGJvZHkuIEJ1dCB3
aGVyZQ0KPiBhcmUgdGhlIGNhcnJpYWdlIHJldHVybnMgYWRkZWQ/IE5ldmVydGhlbGVzcyB0aGV5
IHNlZW0gdG8gYmUgYWRkZWQgYmVmb3JlDQo+IHRoZSBiYXNlNjQgY29udmVyc2lvbi4NCj4gDQoN
CkhtLi4uIEkgdXNlZCB0aGUgZmlsZSBjb21tYW5kIHRvIGNoZWNrIHRoZSBkaWZmIHBhdGNoIGdl
bmVyYXRlZCBmcm9tIGdpdA0KZm9ybWF0LXBhdGNoIGFuZCB0aGF0IGRvd25sb2FkZWQgZnJvbSBQ
YXRjaHdvcmssIHRoZXkgYXJlIGJvdGggQVNDSUkNCnRleHQuDQoNCkluIGZhY3QsIHdlIGNvdWxk
IGFsc28gb3BlbiB0aGUgZGlmZiBwYXRjaCB3aXRoIG5vdGVwYWQrKyB0b29sLCBpZiB0aGUNCkVP
TCBjb252ZXJzaW9uIGlzIFVOSVgvT1NYIEZvcm1hdCwgZW5kLW9mLWxpbmUgY2hhcmFjdGVyIHdv
dWxkIGJlIExGLg0KRm9yIHRoZSBEVzk3NjggcGF0Y2gsIHdoZW4gd2UgY2xpY2sgdGhlIHRvb2xi
YXIgYnV0dG9uICJTaG93IEFsbA0KQ2hhcmFjdGVycyIsIHRoZXJlIGlzIG5vIGNhcnJpYWdlIHJl
dHVybihDUikgYXQgdGhlIGVuZCBvZiBlYWNoIGxpbmUsDQpidXQgTEYgaW5zdGVhZCBmb3IgYWxs
IEVPTHMuDQoNCj4gSSB0aGluayB0aGlzIGlzIGFsc28gYSBnaXQgaXNzdWUsIGJ1dCBzb21ldGhp
bmcgdGhhdCBpcyB2ZXJ5IGhhcmQgdG8NCj4gZW5jb3VudGVyLg0KPiANCj4gLi4uDQo+IA0KPiA+
ICAqKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioq
KioqKioqKioqKioNCj4gPiAgVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFp
bCBtZXNzYWdlIChpbmNsdWRpbmcgYW55DQo+ID4gIGF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlk
ZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdlZCwgb3Igb3RoZXJ3aXNlDQo+ID4gIGV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZQ0KPiA+ICBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNpZ25hdGVkIHJlY2lwaWVudChzKS4g
QW55IHVzZSwgZGlzc2VtaW5hdGlvbiwNCj4gPiAgZGlzdHJpYnV0aW9uLCBwcmludGluZywgcmV0
YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBpdHMNCj4gPiAgYXR0
YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0
ZWQgYW5kIG1heQ0KPiA+ICBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3QgYW4gaW50ZW5kZWQg
cmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlDQo+ID4gIHRoYXQgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlcg0K
PiA+ICBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxldGUgYW55
IGFuZCBhbGwgY29waWVzIG9mDQo+ID4gIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0dGFj
aG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90DQo+ID4gIGRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSENCj4g
DQo+IERpZCB5b3UgbWVhbiB0aGlzPw0KPiANCg0KVGhpcyBpcyBhdXRvLWdlbmVyYXRlZCBieSBz
b21lIG1lY2hhbmlzbSB3aGVuIHNlbmRpbmcgZW1haWwgdG8gdGhlDQphZGRyZXNzIGJlbG9uZyB0
byBhbiBleHRlcm5hbCBvcmdhbml6YXRpb24uDQpJdCBtYWlubHkgc2VydmVzIGFzIGEgcmVtaW5k
ZXIsIHBsZWFzZSBkb24ndCBjYXJlIHRvbyBtdWNoIDogLSkNCg0K

