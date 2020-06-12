Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63911F770A
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 13:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgFLLDt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 07:03:49 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:48484 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725805AbgFLLDt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 07:03:49 -0400
X-UUID: 9c3d95f8b6d742db968f62d491877d9b-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qaglRPWqGP4IdwsQlkYgHrfbKPtnhQyQo7nkYFx8tsM=;
        b=opsJHtnZQPOHAn4VbAvA7iH35vWcR8TZQbA5gFuQp12G1sRNXDVOVWPR4Vtt6JKLauhKaUxNA5wIFsnGcxcJ9xM3n4YO7P9e8QY3XRUXFI50rfAhA/NXu03hQQYAPLasfjAcW2R0+uUzUpPyDO38r3r+MW2dGnxNsmgGCsKni6I=;
X-UUID: 9c3d95f8b6d742db968f62d491877d9b-20200612
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 444859813; Fri, 12 Jun 2020 19:03:40 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 12 Jun
 2020 19:03:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 19:03:38 +0800
Message-ID: <1591959682.8804.665.camel@mhfsdcap03>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Tomasz Figa <tfiga@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Cao Bing Bu" <bingbu.cao@intel.com>,
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
Date:   Fri, 12 Jun 2020 19:01:22 +0800
In-Reply-To: <20200611100322.GL16711@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
         <20200523084103.31276-3-dongchun.zhu@mediatek.com>
         <20200610194455.GK201868@chromium.org>
         <20200611095333.GK16711@paasikivi.fi.intel.com>
         <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
         <20200611100322.GL16711@paasikivi.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9664EE831528CD8C24C98DDB589FA69B119B312FFEA3696E45D9240344133E872000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUaHUsIDIwMjAtMDYtMTEgYXQgMTM6MDMgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMTE6NTc6NDNBTSArMDIwMCwg
VG9tYXN6IEZpZ2Egd3JvdGU6DQo+ID4gT24gVGh1LCBKdW4gMTEsIDIwMjAgYXQgMTE6NTMgQU0g
U2FrYXJpIEFpbHVzDQo+ID4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0K
PiA+ID4NCj4gPiA+IEhpIFRvbWFzeiwNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIEp1biAxMCwgMjAy
MCBhdCAwNzo0NDo1NVBNICswMDAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gSGkgRG9u
Z2NodW4sDQo+ID4gPiA+DQo+ID4gPiA+IE9uIFNhdCwgTWF5IDIzLCAyMDIwIGF0IDA0OjQxOjAz
UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+ID4gPiBBZGQgYSBWNEwyIHN1Yi1k
ZXZpY2UgZHJpdmVyIGZvciBPVjAyQTEwIGltYWdlIHNlbnNvci4NCj4gPiA+ID4gPg0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNv
bT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
IHwgICAgMSArDQo+ID4gPiA+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgICB8ICAgMTMg
Kw0KPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSAgfCAgICAxICsNCj4gPiA+
ID4gPiAgZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jIHwgMTAyNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwg
MTA0MCBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL2kyYy9vdjAyYTEwLmMNCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGFuayB5
b3UgZm9yIHRoZSBwYXRjaC4gUGxlYXNlIHNlZSBteSBjb21tZW50cyBpbmxpbmUuDQo+ID4gPiA+
DQo+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2ky
Yy9vdjAyYTEwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCj4gPiA+ID4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+IGluZGV4IDAwMDAwMDAuLjE2MGEwYjUNCj4gPiA+
ID4gPiAtLS0gL2Rldi9udWxsDQo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Yw
MmExMC5jDQo+ID4gPiA+IFtzbmlwXQ0KPiA+ID4gPiA+ICtzdGF0aWMgY29uc3QgY2hhciAqIGNv
bnN0IG92MDJhMTBfdGVzdF9wYXR0ZXJuX21lbnVbXSA9IHsNCj4gPiA+ID4gPiArICAgIkRpc2Fi
bGVkIiwNCj4gPiA+ID4gPiArICAgIkNvbG9yIEJhciIsDQo+ID4gPiA+DQo+ID4gPiA+IG5pdDog
V2Ugc2hvdWxkIG5vcm1hbGl6ZSB0aGlzIHRvIG9uZSBvZiB0aGUgc3RhbmRhcmQgbmFtZXMuIFdo
YXQgaXMgdGhlDQo+ID4gPiA+IHBhdHRlcm4gb24gdGhpcyBzZW5zb3I/IElzIGl0IHBlcmhhcHMg
IkVpZ2h0IFZlcnRpY2FsIENvbG91ciBCYXJzIj8NCj4gPiA+ID4NCj4gPiA+ID4gPiArfTsNCj4g
PiA+ID4gW3NuaXBdDQo+ID4gPiA+ID4gK3N0YXRpYyBpbnQgb3YwMmExMF9zZXRfZm10KHN0cnVj
dCB2NGwyX3N1YmRldiAqc2QsDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgdjRsMl9zdWJkZXZfcGFkX2NvbmZpZyAqY2ZnLA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X2Zvcm1hdCAqZm10KQ0KPiA+ID4gPiA+ICt7DQo+
ID4gPiA+ID4gKyAgIHN0cnVjdCBvdjAyYTEwICpvdjAyYTEwID0gdG9fb3YwMmExMChzZCk7DQo+
ID4gPiA+ID4gKyAgIHN0cnVjdCB2NGwyX21idXNfZnJhbWVmbXQgKm1idXNfZm10ID0gJmZtdC0+
Zm9ybWF0Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgbXV0ZXhfbG9jaygmb3YwMmExMC0+
bXV0ZXgpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gRG9uJ3Qgd2Ug
bmVlZCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlbiBmbXQtPndoaWNoIGlzIFY0TDJfU1VCREVWX0ZP
Uk1BVF9UUlksDQo+ID4gPiA+IHdoaWNoIGlzIHVzZWQgZm9yIHRyeWluZyB0aGUgZm9ybWF0LCBi
dXQgbm90IGFwcGx5aW5nIGl0IHRvIHRoZSBoYXJkd2FyZT8NCj4gPiA+DQo+ID4gPiBZZXMuDQo+
ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+ICsgICBpZiAob3YwMmExMC0+c3RyZWFtaW5nKSB7DQo+
ID4gPiA+ID4gKyAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZvdjAyYTEwLT5tdXRleCk7DQo+ID4g
PiA+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsNCj4gPiA+ID4gPiArICAgfQ0KPiA+ID4g
PiA+ICsNCj4gPiA+ID4gPiArICAgLyogT25seSBvbmUgc2Vuc29yIG1vZGUgc3VwcG9ydGVkICov
DQo+ID4gPiA+ID4gKyAgIG1idXNfZm10LT5jb2RlID0gb3YwMmExMC0+Zm10LmNvZGU7DQo+ID4g
PiA+ID4gKyAgIG92MDJhMTBfZmlsbF9mbXQob3YwMmExMC0+Y3VyX21vZGUsIG1idXNfZm10KTsN
Cj4gPiA+ID4gPiArICAgb3YwMmExMC0+Zm10ID0gZm10LT5mb3JtYXQ7DQo+ID4gPiA+ID4gKw0K
PiA+ID4gPiA+ICsgICBtdXRleF91bmxvY2soJm92MDJhMTAtPm11dGV4KTsNCj4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gKyAgIHJldHVybiAwOw0KPiA+ID4gPiA+ICt9DQo+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ICtzdGF0aWMgaW50IG92MDJhMTBfZ2V0X2ZtdChzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNk
LA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X3Bh
ZF9jb25maWcgKmNmZywNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2
NGwyX3N1YmRldl9mb3JtYXQgKmZtdCkNCj4gPiA+ID4gPiArew0KPiA+ID4gPiA+ICsgICBzdHJ1
Y3Qgb3YwMmExMCAqb3YwMmExMCA9IHRvX292MDJhMTAoc2QpOw0KPiA+ID4gPiA+ICsgICBzdHJ1
Y3QgdjRsMl9tYnVzX2ZyYW1lZm10ICptYnVzX2ZtdCA9ICZmbXQtPmZvcm1hdDsNCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyAgIG11dGV4X2xvY2soJm92MDJhMTAtPm11dGV4KTsNCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyAgIGZtdC0+Zm9ybWF0ID0gb3YwMmExMC0+Zm10Ow0KPiA+ID4gPg0K
PiA+ID4gPiBEaXR0by4NCj4gPiA+ID4NCj4gPiA+ID4gPiArICAgbWJ1c19mbXQtPmNvZGUgPSBv
djAyYTEwLT5mbXQuY29kZTsNCj4gPiA+ID4gPiArICAgb3YwMmExMF9maWxsX2ZtdChvdjAyYTEw
LT5jdXJfbW9kZSwgbWJ1c19mbXQpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgbXV0ZXhf
dW5sb2NrKCZvdjAyYTEwLT5tdXRleCk7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICByZXR1
cm4gMDsNCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArc3RhdGljIGludCBv
djAyYTEwX2VudW1fbWJ1c19jb2RlKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsDQo+ID4gPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHY0bDJfc3ViZGV2X3BhZF9jb25m
aWcgKmNmZywNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
djRsMl9zdWJkZXZfbWJ1c19jb2RlX2VudW0gKmNvZGUpDQo+ID4gPiA+ID4gK3sNCj4gPiA+ID4g
PiArICAgc3RydWN0IG92MDJhMTAgKm92MDJhMTAgPSB0b19vdjAyYTEwKHNkKTsNCj4gPiA+ID4g
PiArDQo+ID4gPiA+ID4gKyAgIGlmIChjb2RlLT5pbmRleCA+PSBBUlJBWV9TSVpFKHN1cHBvcnRl
ZF9tb2RlcykpDQo+ID4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gPiA+
DQo+ID4gPiA+IEhtbSwgc3VwcG9ydGVkX21vZGVzW10gZG9lc24ndCBzZWVtIHRvIGhvbGQgdGhl
IGluZm9ybWF0aW9uIGFib3V0IG1idXMNCj4gPiA+ID4gY29kZXMuIFNob3VsZCB0aGlzIGp1c3Qg
cGVyaGFwcyBiZSAiIT0gMCI/DQo+ID4gPiA+DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsgICBj
b2RlLT5jb2RlID0gb3YwMmExMC0+Zm10LmNvZGU7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsg
ICByZXR1cm4gMDsNCj4gPiA+ID4gPiArfQ0KPiA+ID4gPiBbc25pcF0NCj4gPiA+ID4gPiArc3Rh
dGljIGludCBvdjAyYTEwX2VudGl0eV9pbml0X2NmZyhzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkLA0K
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9zdWJk
ZXZfcGFkX2NvbmZpZyAqY2ZnKQ0KPiA+ID4gPiA+ICt7DQo+ID4gPiA+ID4gKyAgIHN0cnVjdCB2
NGwyX3N1YmRldl9mb3JtYXQgZm10ID0gew0KPiA+ID4gPiA+ICsgICAgICAgICAgIC53aGljaCA9
IGNmZyA/IFY0TDJfU1VCREVWX0ZPUk1BVF9UUlkgOiBWNEwyX1NVQkRFVl9GT1JNQVRfQUNUSVZF
LA0KPiA+ID4gPiA+ICsgICAgICAgICAgIC5mb3JtYXQgPSB7DQo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAud2lkdGggPSAxNjAwLA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
LmhlaWdodCA9IDEyMDAsDQo+ID4gPiA+ID4gKyAgICAgICAgICAgfQ0KPiA+ID4gPiA+ICsgICB9
Ow0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgb3YwMmExMF9zZXRfZm10KHNkLCBjZmcsICZm
bXQpOw0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArICAgcmV0dXJuIDA7DQo+ID4gPiA+ID4gK30N
Cj4gPiA+ID4gPiArDQo+ID4gPiA+DQo+ID4gPiA+IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlz
IGluaXRfY2ZnIG9wZXJhdGlvbiBhbmQgdGhlIGRvY3VtZW50YXRpb24gaXMgdmVyeQ0KPiA+ID4g
PiBzcGFyc2UgYWJvdXQgaXQuIFNha2FyaSwgaXMgdGhpcyBhIGNvcnJlY3QgaW1wbGVtZW50YXRp
b24/DQo+ID4gPg0KPiA+ID4gVGhlIHB1cnBvc2UgaXMgdG8gaW5pdGlhbGlzZSBhIHBhZCBjb25m
aWd1cmF0aW9uIChmb3JtYXQgYW5kIHNlbGVjdGlvbg0KPiA+ID4gcmVjdGFuZ2xlcykgdG8gdGhl
IGRldmljZSBkZWZhdWx0cy4gQXMgdGhlcmUgc2VlbSB0byBiZSBubyBzZWxlY3Rpb24NCj4gPiA+
IHJlY3RhbmdsZXMsIHRoaXMgc2VlbXMgZmluZSB0byBtZS4NCj4gPiANCj4gPiBUaGFua3MuIEkg
dHJhY2VkIHRoZSBjb2RlIGFuZCBjb3VsZCBvbmx5IHNlZSBvbmUgcGxhY2Ugd2hlcmUgdGhlDQo+
ID4gY2FsbGJhY2sgaXMgYmVpbmcgY2FsbGVkIGFuZCB0aGF0IHdhcyB3aXRoIGNmZyAhPSBOVUxM
LiBTdGlsbCwgdGhlDQo+ID4gY29kZSBhYm92ZSB1c2VzICJjZmcgPyIgYXMgYSBjaGVjayB0byBk
ZXRlcm1pbmUgd2hldGhlciBUUlkgb3IgQUNUSVZFDQo+ID4gc2hvdWxkIGJlIHBhc3NlZCB0byB3
aGljaC4gSXMgdGhhdCBhbHNvIGNvcnJlY3Q/DQo+IA0KPiBJdCBjb3VsZCBiZSB1c2VkIGluIHNl
dHRpbmcgdGhlIGFjdGl2ZSBmb3JtYXQgaW4gcHJvYmUuIFRoYXQgd291bGQgcHJvYmFibHkNCj4g
YmUgY2xlYW5lciB0aGFuIHdoYXQgaXQgY3VycmVudGx5IGRvZXMuDQo+IA0KDQpTYWthcmksIGRp
ZCB5b3UgbWVhbiB0aGF0IHdlIG5lZWQgdG8gdXBkYXRlIF9wcm9iZSBBUEk/DQpMaWtlIHRoaXM6
DQpzdHJ1Y3QgdjRsMl9zdWJkZXZfZm9ybWF0IGZtdCA9IHsNCgkud2hpY2ggPSBWNEwyX1NVQkRF
Vl9GT1JNQVRfQUNUSVZFLA0KfTsNCg0KPiBCdXQgYXBhcnQgZnJvbSB0aGF0LCB0aGUgZnJhbWV3
b3JrIGFsd2F5cyBjYWxscyBpbml0X2NmZyB3aXRoIGNmZyBub24tTlVMTC4NCj4gDQoNCg0KDQo=

