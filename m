Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23B52255E8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 04:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgGTCcO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jul 2020 22:32:14 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:20179 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726225AbgGTCcN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jul 2020 22:32:13 -0400
X-UUID: 44bb924f4fb145d0b6d1fce80b5227a9-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=nRJbkNge/6U8QFSquZNdXuEsFfzsAfQcy/KuTN01eTU=;
        b=sQ+eHjk8HSTPmN2gfhDDovPLIrIi2Sm88VbuyaxxVEBKH9OayiQPbHNk1hxAMvIopx4x5QPNqbdwsxSlbVipzlaLvU0xN8fjh/AuVOGObch7X/wM8nQmGX106NRb+aiwUY0l4rGeeCa3oa0MvoRC0kN9N934PgdNuyiy3dy23uM=;
X-UUID: 44bb924f4fb145d0b6d1fce80b5227a9-20200720
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 2119504295; Mon, 20 Jul 2020 10:31:59 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 20 Jul
 2020 10:31:58 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 10:31:57 +0800
Message-ID: <1595212256.17166.116.camel@mhfsdcap03>
Subject: Re: [V7, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        <matrix.zhu@aliyun.com>, Matthias Brugger <matthias.bgg@gmail.com>,
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
Date:   Mon, 20 Jul 2020 10:30:56 +0800
In-Reply-To: <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
References: <20200505070451.GS9190@paasikivi.fi.intel.com>
         <1588688238.8804.150.camel@mhfsdcap03>
         <20200506112136.GV9190@paasikivi.fi.intel.com>
         <1588856325.8804.179.camel@mhfsdcap03>
         <CAAFQd5CXRD_j7Xkxb4=9kkd+pDy4W5pirAPSG8RsMVH6L-MU2w@mail.gmail.com>
         <20200507141147.GF9190@paasikivi.fi.intel.com>
         <CAAFQd5DgDk57MCc4vE9VmifZYjtO_SUFss+vc8W-28SFHbKDrA@mail.gmail.com>
         <1588920685.8804.230.camel@mhfsdcap03>
         <20200510223552.GA11272@paasikivi.fi.intel.com>
         <1589197265.8804.262.camel@mhfsdcap03>
         <20200715140110.GD16711@paasikivi.fi.intel.com>
         <CAAFQd5A9L73et30Fr_91sqfQGue7Qo05yCchU_S6bh5H4sBiMQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5B3CADBF14684A372A52AEA272B292F334E02DBD6C86090FC4E4B973B7A630D52000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLCBUb21hc3osDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KT24gVGh1LCAy
MDIwLTA3LTE2IGF0IDE2OjU3ICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gT24gV2VkLCBK
dWwgMTUsIDIwMjAgYXQgNDowMSBQTSBTYWthcmkgQWlsdXMNCj4gPHNha2FyaS5haWx1c0BsaW51
eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gaGkgRG9uZ2NodW4sDQo+ID4NCj4gPiBPbiBN
b24sIE1heSAxMSwgMjAyMCBhdCAwNzo0MTowNVBNICswODAwLCBEb25nY2h1biBaaHUgd3JvdGU6
DQo+ID4gPiBIaSBTYWthcmksDQo+ID4gPg0KPiA+ID4gT24gTW9uLCAyMDIwLTA1LTExIGF0IDAx
OjM1ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+IEhpIERvbmdjaHVuLA0KPiA+
ID4gPg0KPiA+ID4gPiBPbiBGcmksIE1heSAwOCwgMjAyMCBhdCAwMjo1MToyNVBNICswODAwLCBE
b25nY2h1biBaaHUgd3JvdGU6DQo+ID4gPiA+ID4gSGkgU2FrYXJpLCBUb21hc3osDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBPbiBUaHUsIDIwMjAtMDUtMDcgYXQgMTY6MjUgKzAyMDAsIFRvbWFzeiBG
aWdhIHdyb3RlOg0KPiA+ID4gPiA+ID4gT24gVGh1LCBNYXkgNywgMjAyMCBhdCA0OjEyIFBNIFNh
a2FyaSBBaWx1cw0KPiA+ID4gPiA+ID4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdy
b3RlOg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBIaSBUb21hc3osIERvbmdjaHVuLA0K
PiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAwMzo1
MDo0MFBNICswMjAwLCBUb21hc3ogRmlnYSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiBIaSBTYWth
cmkgYW5kIERvbmdjaHVuLA0KPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gT24gVGh1
LCBNYXkgNywgMjAyMCBhdCAzOjAwIFBNIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlh
dGVrLmNvbT4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4gSGkg
U2FrYXJpLA0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IFRoYW5rcyBmb3Ig
dGhlIHJldmlldy4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiBPbiBXZWQs
IDIwMjAtMDUtMDYgYXQgMTQ6MjEgKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gSGkgRG9uZ2NodW4sDQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+ID4gPiA+IE9uIFR1ZSwgTWF5IDA1LCAyMDIwIGF0IDEwOjE3OjE4UE0gKzA4MDAsIERvbmdj
aHVuIFpodSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBIaSBTYWthcmksDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBUaGFua3MgZm9yIHRoZSByZXZp
ZXcuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBPbiBUdWUs
IDIwMjAtMDUtMDUgYXQgMTA6MDQgKzAzMDAsIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IEhpIERvbmdjaHVuLA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDA0OjA5OjIzUE0g
KzA4MDAsIERvbmdjaHVuIFpodSB3cm90ZToNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gQWRk
IERUIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIE9tbml2aXNpb24gT1YwMkExMCBpbWFnZSBz
ZW5zb3IuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNv
bT4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sICAgICAgICAgICB8
IDE0OCArKysrKysrKysrKysrKysrKysrKysNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlv
bnMoKykNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1s
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292
dGksb3YwMmExMC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2kyYy9vdnRpLG92MDJhMTAueWFtbA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBpbmRleCAwMDAwMDAwLi4y
YmU0YmQyDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiBA
QCAtMCwwICsxLDE0OCBAQA0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiArIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiArJVlBTUwgMS4yDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICst
LS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sIw0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gK3RpdGxlOiBPbW5pdmlzaW9uIE9WMDJBMTAgQ01PUyBTZW5zb3IgRGV2aWNlIFRyZWUg
QmluZGluZ3MNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArbWFpbnRhaW5lcnM6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIC0gRG9u
Z2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICtkZXNjcmlwdGlvbjogfC0NCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgVGhlIE9tbml2aXNpb24gT1YwMkExMCBpcyBhIGxv
dy1jb3N0LCBoaWdoIHBlcmZvcm1hbmNlLCAxLzUtaW5jaCwgMiBtZWdhcGl4ZWwNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgaW1hZ2Ugc2Vuc29yLCB3aGljaCBpcyB0aGUgbGF0ZXN0IHBy
b2R1Y3Rpb24gZGVyaXZlZCBmcm9tIE9tbml2aXNpb24ncyBDTU9TDQo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ICsgIGltYWdlIHNlbnNvciB0ZWNobm9sb2d5LiBJaGlzIGNoaXAgc3VwcG9ydHMg
aGlnaCBmcmFtZSByYXRlIHNwZWVkcyB1cCB0byAzMGZwcw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiArICBAIDE2MDB4MTIwMCAoVVhHQSkgcmVzb2x1dGlvbiB0cmFuc2ZlcnJlZCBvdmVyIGEg
MS1sYW5lIE1JUEkgaW50ZXJmYWNlLiBUaGUNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAg
c2Vuc29yIG91dHB1dCBpcyBhdmFpbGFibGUgdmlhIENTSS0yIHNlcmlhbCBkYXRhIG91dHB1dC4N
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiAr
cHJvcGVydGllczoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgY29tcGF0aWJsZToNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICBjb25zdDogb3Z0aSxvdjAyYTEwDQo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgcmVnOg0K
PiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgY2xvY2tzOg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogdG9wIG11eCBjYW10ZyBjbG9jaw0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogZGV2aWRlciBjbG9jaw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgIGNs
b2NrLW5hbWVzOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgLSBjb25zdDogZWNsaw0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgLSBjb25zdDogZnJlcV9tdXgNCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBjbG9jay1mcmVxdWVuY3k6DQo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICBGcmVxdWVuY3kgb2YgdGhlIGVjbGsgY2xvY2sgaW4gSGVydHou
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgZG92ZGQtc3VwcGx5Og0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgRGVmaW5pdGlvbiBvZiB0aGUg
cmVndWxhdG9yIHVzZWQgYXMgaW50ZXJmYWNlIHBvd2VyIHN1cHBseS4NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICBhdmRkLXN1cHBseToN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFz
IGFuYWxvZyBwb3dlciBzdXBwbHkuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgZHZkZC1zdXBwbHk6DQo+ID4gPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAg
ICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBhcyBkaWdpdGFsIHBvd2VyIHN1cHBs
eS4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiArICBwb3dlcmRvd24tZ3Bpb3M6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgZGVz
Y3JpcHRpb246DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICBUaGUgcGhhbmRsZSBh
bmQgc3BlY2lmaWVyIGZvciB0aGUgR1BJTyB0aGF0IGNvbnRyb2xzIHNlbnNvciBwb3dlcmRvd24u
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgcmVzZXQtZ3Bpb3M6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgZGVzY3JpcHRp
b246DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICBUaGUgcGhhbmRsZSBhbmQgc3Bl
Y2lmaWVyIGZvciB0aGUgR1BJTyB0aGF0IGNvbnRyb2xzIHNlbnNvciByZXNldC4NCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICByb3RhdGlv
bjoNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiA+ID4gKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHNlbnNvcidzIHBsYWNl
bWVudCwgdmFsaWQgdmFsdWVzIGFyZSAwIGFuZCAxODAuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
PiA+ICsgICAgYWxsT2Y6DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsgICAgICAtICRyZWY6
ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiDQo+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiA+ICsgICAgICAtIGVudW06DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsg
ICAgICAgICAgLSAwICAgICMgU2Vuc29yIE1vdW50ZWQgVXByaWdodA0KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+ID4gPiArICAgICAgICAgIC0gMTgwICAjIFNlbnNvciBNb3VudGVkIFVwc2lkZSBEb3du
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
KyAgb3Z0aSxtaXBpLXR4LXNwZWVkOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgIGRl
c2NyaXB0aW9uOg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gPiArICAgICAgSW5kaWNhdGlvbiBv
ZiBNSVBJIHRyYW5zbWlzc2lvbiBzcGVlZCBzZWxlY3QuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+ID4gV2hhdCBleGFjdGx5IGRvZXMgdGhpcyBzaWduaWZ5
PyBBbmQgaG93IGRvIHlvdSBjb21lIHVwIHdpdGggdGhlIG51bWJlcj8NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBB
cG9sb2dpZXMgZm9yIG5vdCBhZGRyZXNzaW5nIHRoaXMgbnVtYmVyIGNsZWFyLg0KPiA+ID4gPiA+
ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gRnJvbSB0aGUgZGF0YXNoZWV0LCBQ
MToweEExIHJlZ2lzdGVyIHJlcHJlc2VudHMgVFhfU1BFRURfQVJFQV9TRUwgd2l0aA0KPiA+ID4g
PiA+ID4gPiA+ID4gPiA+IHRoZSBkZWZhdWx0IHZhbDogMHgwMy4NCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBUaGUgZGVzY3JpcHRpb24gb2YgdGhpcyBSVyByZWdpc3RlciBpcyBhcyBiZWxvdzoNCj4g
PiA+ID4gPiA+ID4gPiA+ID4gPiBCaXRbMjowXTogTUlQSSB0cmFuc21pc3Npb24gc3BlZWQgc2Vs
ZWN0Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gVGh1cyB0
aGUgZW51bSBzaG91bGQgYmUgZGVmaW5pdGVkIGFzIFsgMCwgMSwgMiwgMywgNCwgNSwgNiwgNyBd
Lg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoaXMgd291bGQgYmUgZml4ZWQgaW4gbmV4dCByZWxl
YXNlLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gSW4gdGhl
IG1lYW50aW1lLCBhcyB0aGUgZGVmYXVsdCB2YWwgb2YgUDE6MHhBMSBpcyAweDAzLCB3ZSBob3Bl
IHRvIGtlZXANCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiB0aGF0IHZhbHVlIGlmIHRoZXJlIGlzIG5v
IHNldHRpbmcgZm9yIHRoaXMgcHJpdmF0ZSBwcm9wZXJ0eSBpbiBEVC4NCj4gPiA+ID4gPiA+ID4g
PiA+ID4gPiBUaGUgY2FsbGVyIGluIGRyaXZlciB3b3VsZCBiZSB1cGRhdGVkIGxpa2UgdGhpcyBp
biBuZXh0IHJlbGVhc2UuDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gaWYgKG92MDJhMTAtPm1pcGlf
Y2xvY2tfdHhfc3BlZWQpDQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gICAgIHJldCA9IGkyY19zbWJ1
c193cml0ZV9ieXRlX2RhdGEoLi4uLC4uLik7DQo+ID4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+ID4gPiA+IEhvdyBkaWQgeW91IHBpY2sgdGhlIHZhbHVlIGluIHRoZSBleGFtcGxlPyBB
bmQgd2h5IGRvIHlvdSBiZWxpZXZlIGl0IGlzDQo+ID4gPiA+ID4gPiA+ID4gPiA+IHNwZWNpZmlj
IHRvIGEgcGxhdGZvcm0sIGFuZCBub3QgZS5nLiBhIHNlbnNvciBtb2RlPw0KPiA+ID4gPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gPiA+IFdlIGxvb2sgaW50
byBQMTowWEExLCBvbmUgcmVnaXN0ZXIgdGhhdCBkZWZpbmVzIE1JUEkgdHJhbnNtaXNzaW9uIHNw
ZWVkDQo+ID4gPiA+ID4gPiA+ID4gPiBzZWxlY3QuDQo+ID4gPiA+ID4gPiA+ID4gPiBGcm9tIHRo
ZSBkYXRhc2hlZXQsIHdlIGNhbiBnZXQgdGhlIHBvc3NpYmxlIHZhbHVlcyB0aGF0IGNvdWxkIGJl
IHNldCB0bw0KPiA+ID4gPiA+ID4gPiA+ID4gUDE6MHhBMS4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+ID4gPiBBY3R1YWxseSB0aGlzIHJlZ2lzdGVyIGlzIGFuIGluZGVwZW5kZW50
IG9mIHNlbnNvciBtb2RlLCBpdCBpcyBqdXN0DQo+ID4gPiA+ID4gPiA+ID4gPiBpbmNsdWRlZCBp
biBzZW5zb3IgbW9kZSdzIHJlZ2lzdGVyIHNldHRpbmcgdGFibGUuDQo+ID4gPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiA+ID4gSW4gYWRkaXRpb24sIHRoaXMgcHJpdmF0ZSBEVCBQcm9wZXJ0
eSBpcyBjcmVhdGVkIHRvIGZpeCB0aGUgTUlQSSB0ZXN0DQo+ID4gPiA+ID4gPiA+ID4gPiBmYWls
dXJlLiBUaGUgcmVnaXN0ZXIgdmFsdWVzIGFyZSBhZGp1c3RlZCBhbmQgdmVyaWZpZWQgZnJvbSB2
ZW5kb3IgdG8NCj4gPiA+ID4gPiA+ID4gPiA+IG1ha2Ugc2Vuc29yIHNpZ25hbCBtZWV0IE1JUEkg
c3BlY2lmaWNhdGlvbi4NCj4gPiA+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gPiBJbiB0aGVvcnkgdGhlIHZhbHVlIGNvdWxkIGRlcGVuZCBvbiB0aGUgbW9kZSwg
YmVjYXVzZSBkaWZmZXJlbnQgbGluaw0KPiA+ID4gPiA+ID4gPiA+IHJhdGUgY291bGQgaW1wb3Nl
IGRpZmZlcmVudCByZXF1aXJlbWVudHMgZm9yIHRoZSBwaHlzaWNhbCBpbnRlcmZhY2UuDQo+ID4g
PiA+ID4gPiA+ID4gSW4gcHJhY3RpY2UsIHdlIGhhdmVuJ3Qgc2VlbiBhbnkgaGFyZHdhcmUgdGhh
dCB3b3VsZCByZXF1aXJlIGRpZmZlcmVudA0KPiA+ID4gPiA+ID4gPiA+IHZhbHVlcyBmb3IgZGlm
ZmVyZW50IG1vZGVzLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGUgbW9kZSAocG9z
c2libHkgaW4gY29uanVuY3Rpb24gd2l0aCBvdGhlciBpbmZvcm1hdGlvbiBhdmFpbGFibGUgdG8g
dGhlDQo+ID4gPiA+ID4gPiA+IGRyaXZlciB2aWEgVjRMMiBmd25vZGUgaW50ZXJmYWNlKSBwcmVj
aXNlbHkgZGVmaW5lcyB0aGUgcGFyYW1ldGVycyBvZiB0aGUNCj4gPiA+ID4gPiA+ID4gQ1NJLTIg
YnVzIC0tLSBhcGFydCBmcm9tIHRoZSBwb3NzaWJsZSBleGNlcHRpb24gb2YgdGhlIGJ1cyB0aW1p
bmcgcmVsYXRlZA0KPiA+ID4gPiA+ID4gPiBwYXJhbWV0ZXJzIGJ1dCB0aGlzIGlzIG5vdCBzdXBw
b3J0ZWQgYnkgdGhlIG5hbWUgb2YgdGhlIHBhcmFtZXRlci4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+ID4gVGhlcmVmb3JlIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHBhcmFtZXRlciwgd2hpY2gg
c3VwcG9zZWRseSBpcyB1c2VkIHRvDQo+ID4gPiA+ID4gPiA+IGRldGVybWluZSB0aGUgQ1NJLTIg
dHJhbnNtaXNzaW9ucyBzcGVlZCwgY291bGQgYmUgYm9hcmQgc3BlY2lmaWMgYW5kIHRodXMNCj4g
PiA+ID4gPiA+ID4gYmVsb25nIHRvIERULg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEFjY29y
ZGluZyB0byB0aGUgdmVyeSBpbXByZWNpc2UgaW5mb3JtYXRpb24gSSBoYXZlIGFjY2VzcyB0bywg
aXQgaXMNCj4gPiA+ID4gPiA+IG5vdCBhYm91dCB0aGUgQ1NJLTIgYnVzIGl0c2VsZiwgYnV0IHJh
dGhlciBzb21lIGludGVybmFsIHBhcmFtZXRlciBvZg0KPiA+ID4gPiA+ID4gdGhlIHNlbnNvcidz
IENTSSBpbnRlcmZhY2UuIFVuZm9ydHVuYXRlbHkgdGhlcmUgaXNuJ3QgbXVjaCBpbmZvcm1hdGlv
bg0KPiA+ID4gPiA+ID4gb24gd2hhdCB0aGlzIHZhbHVlIGV4YWN0bHkgY29udHJvbHMuLi4NCj4g
PiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiA+ID4gPiBUb21hc3oN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IEp1c3QgZ290IHNvbWUgZmVlZGJhY2sgZnJvbSBPViB2ZW5k
b3IgYWJvdXQgdGhpcyBwYXJhbWV0ZXIuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBQMToweEExIGlz
IHRoZSByZWdpc3RlciB0byBjb250cm9sIEQtUEhZIHRpbWluZyBzZXR0aW5nIGJhc2VkIG9uIGJj
bGsuDQo+ID4gPiA+ID4gSXQgaXMgdG8gYWRqdXN0IHRoZSBNSVBJIGNsb2NrIHZvbHRhZ2UgdG8g
aW1wcm92ZSB0aGUgY2xvY2sgZHJpdmUNCj4gPiA+ID4gPiBjYXBhYmlsaXR5LCBhbmQgaGFzIG5v
IGFmZmVjdCBvbiB0aGUgdHJhbnNtaXNzaW9uIHNwZWVkIG9mIE1JUEkgZGF0YS4NCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEZyb20gdmVuZG9yJ3MgcGVyc3BlY3RpdmUsIFAxOjB4QTEgZGVwZW5kcyB1
cG9uIHRoZSBsZW5ndGggb2YgRlBDIG9mDQo+ID4gPiA+ID4gY2FtZXJhIG1vZHVsZSB0aGF0IHVz
ZWQgb24gdGhlIGJvYXJkLiBDb25zaWRlcmluZyB0aGUgcGh5c2ljYWwNCj4gPiA+ID4gPiBjb25u
ZWN0aW9ucyBmb3IgTUlQSSBzaWduYWxzIHRvIHVzZXItZmFjaW5nIGNhbWVyYSBhcmUgdmVyeSBk
aWZmZXJlbnQNCj4gPiA+ID4gPiBiZXR3ZWVuIG91ciAyIHByb2plY3RzLCBpdCBjYW4gYmUgdmVy
eSBkaWZmaWN1bHQgdG8gZmluZCB1bml2ZXJzYWwgU0kNCj4gPiA+ID4gPiBwYXJhbWV0ZXJzIGZv
ciBib3RoIHByb2plY3RzLg0KPiA+ID4gPg0KPiA+ID4gPiBBcmUgeW91IHVzaW5nIGRpZmZlcmVu
dCB2YWx1ZXMgZm9yIHRoaXMgcGFyYW1ldGVyIG9uIHRoZXNlIHR3byBwcm9qZWN0cz8NCj4gPiA+
ID4NCj4gPiA+DQo+ID4gPiBZZXMuIFdlJ3JlIGFjdHVhbGx5IGFzc2lnbmluZyB0d28gZGlmZmVy
ZW50IHZhbHVlcyB0byB0aGlzIHByb3BlcnR5Lg0KPiA+ID4gT25lIGlzIDB4MDMsIHRoZSBvdGhl
ciBpcyAweDA0Lg0KPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRodXMgaGVyZSB3ZSBjcmVh
dGUgb25lIG5ldyBEVCBwcm9wZXJ0eSB0byBzZXBhcmF0ZSB0aGVzZSB0dW5pbmcgaW4NCj4gPiA+
ID4gPiBkcml2ZXIsIHRvIGJlIG1vcmUgbGlrZSBwcm9qZWN0LXNwZWNpZmljLg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gTW9yZSBkZXRhaWxzIGFib3V0IHRoZSByZWdpc3RlciBpcyBhcyBiZWxvdy4N
Cj4gPiA+ID4gPiBQMToweEExIHZhbDogMHgwMyBkZWZhdWx0DQo+ID4gPiA+ID4gQ2FzZTogMCAg
MjBNSHotMzBNSHoNCj4gPiA+ID4gPiAgICAgICAxICAzME1Iei01ME1Ieg0KPiA+ID4gPiA+ICAg
ICAgIDIgIDUwTUh6LTc1TUh6DQo+ID4gPiA+ID4gICAgICAgMyAgNzVNSHotMTAwTUh6ICAgKGRl
ZmF1bHQsIG9sZCBEQiBzZXR0aW5nIHVzZSkNCj4gPiA+ID4gPiAgICAgICA0ICAxMDBNSHotMTMw
TUh6ICAoc3VnZ2VzdGVkLCBuZXcgREIgc2V0dGluZyB1c2UpDQo+ID4gPiA+ID4gICAgICAgNSAg
TWFudWFsDQo+ID4gPiA+ID4gU28gdGhlIHZhbHVlIGluIHRoZSBleGFtcGxlIHNob3VsZCBiZSBb
IDAsIDEsIDIsIDMsIDQsIDUgXS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFkZGl0aW9uYWxseSwg
UDE6MHhBMSBpcyByZWNvbW1lbmRlZCB0byBiZSBzZXQgYXMgMHgwNCBpbiB0aGUgbmV3ZXN0IERC
DQo+ID4gPiA+ID4gc2V0dGluZy4gV2Ugd291bGQgYWRqdXN0IHRoZSByZWdpc3RlciBpbiBuZXh0
IHJlbGVhc2UuDQo+ID4gPiA+DQo+ID4gPiA+IFRoYW5rIHlvdSBmb3IgZGlnZ2luZyBpbnRvIHRo
ZSBpc3N1ZS4NCj4gPiA+ID4NCj4gPiA+ID4gQmFzZWQgb24gdGhlIGFib3ZlIGRlc2NyaXB0aW9u
LCB0aGUgcGFyYW1ldGVyIHdvdWxkIGRlcGVuZCBvbiBib3RoIHRoZSBsaW5rDQo+ID4gPiA+IGZy
ZXF1ZW5jeSBhbmQgcG9zc2libHkgYWxzbyBvbiB3aXJlIGxlbmd0aC4gSSBndWVzcyB0aGVyZSdz
IG5vIGhhcm0gZnJvbQ0KPiA+ID4gPiB1c2luZyB0b28gc3Ryb25nIGRyaXZlLCBhcGFydCBmcm9t
IHBlcmhhcHMgcG93ZXIgY29uc3VtcHRpb24/IEFzIGluDQo+ID4gPiA+IHByaW5jaXBsZSB0aGlz
IGNvdWxkIGJlIGRpZmZlcmVudCBmb3IgZGlmZmVyZW50IHNlbnNvciBtb2Rlcy4gQWxiZWl0IEkN
Cj4gPiA+ID4gZG9uJ3QgcmVtZW1iZXIgc2VlaW5nIGEgc2Vuc29yIHdoZXJlIHN1Y2ggYSBwYXJh
bWV0ZXIgd291bGQgaGF2ZSBiZWVuDQo+ID4gPiA+IG5lZWRlZCB0byBiZSBtb2RpZmllZC4NCj4g
PiA+ID4NCj4gPiA+DQo+ID4gPiBUaGlzIG1heSBiZSByZWxhdGVkIHRvIHNvbWV0aGluZyBhYm91
dCBzZW5zb3IgZmluZSB0dW5pbmcuDQo+ID4gPiBBcyBPViB2ZW5kb3IgcG9pbnRlZCBvdXQsIHRo
ZSBzZW5zb3IgY2hpcCBwcm92aWRlcyBzdWNoIG9uZSBwcm9wZXJ0eQ0KPiA+ID4gdGhhdCB1c2Vy
IGNvdWxkIGFkanVzdCBiYXNlZCBvbiB0aGVpciBzcGVjaWZpYyBwcm9qZWN0Lg0KPiA+ID4gQWxz
bywgY2FzZSA0ICgweDA0KSBzZXR0aW5nIGlzIGNvbmZpcm1lZCB0byBoYXZlIGEgbGl0dGxlIG1v
cmUgcG93ZXINCj4gPiA+IGNvbnN1bXB0aW9uIHRoYW4gY2FzZSAzICgweDAzKS4NCj4gPg0KPiA+
IEFwb2xvZ2llcyBmb3IgYnJpbmdpbmcgYmFjayBhbiBvbGQgdG9waWMgLS0tIHRoZSBkcml2ZXIg
c3VwcG9ydHMganVzdCBhDQo+ID4gc2luZ2xlIG1vZGUsIHVzaW5nIGEgc3BlY2lmaWMgZGF0YSBy
YXRlLg0KPiA+DQo+ID4gSWYgYW5vdGhlciBtb2RlIGlzIGFkZGVkIGxhdGVyIG9uLCB3aWxsIGl0
IGNvbnRpbnVlIHRvIHVzZSB0aGUgc2FtZSB2YWx1ZQ0KPiA+IGZvciB0aGlzPyBCYXNlZCBvbiB0
aGUgZG9jdW1lbnRhdGlvbiwgaXQgc2VlbXMgdGhhdCB0aGlzIGlzIHByaW1hcmlseQ0KPiA+IGRl
ZmluZWQgYnkgdGhlIGZyZXF1ZW5jeSBvZiB0aGUgYnVzLCBub3QgYnkgYm9hcmQgZGVzaWduLiBU
aGVyZWZvcmUgcHV0dGluZw0KPiA+IHRoaXMgdG8gRFQgKGFuZCB0aHVzIGlnbm9yaW5nIHRoZSBm
cmVxdWVuY3kpIGFwcGVhcnMgd3JvbmcuDQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgZXhh
Y3RseSBpbXBsaWVkIGJ5IHRoZSBmcmVxdWVuY3kgb2YgdGhlIGJ1cy4gVGhlDQo+IHZhbHVlcyB0
aGVyZSBhcmUgcmVjb21tZW5kZWQgZm9yIGdpdmVuIGZyZXF1ZW5jeSByYW5nZXMsIGJ1dCB0aGVy
ZSBhcmUNCj4gcmVhbCBjYXNlcyB3aGVyZSBkZXBlbmRpbmcgb24gdGhlIGJvYXJkIGRpZmZlcmVu
dCB2YWx1ZXMgYXJlIG5lZWRlZC4NCj4gDQoNClNvcnJ5IGZvciBjb21pbmcgbGF0ZS4NCkZvciB0
aGUgcmVnIFAxOiAweEExLCBJIHJlLWNvbmZpcm1lZCB0aGUgc2V0dGluZyBvZiB0aGUgcGFyYW0g
d2l0aCBPVlQuDQpUaGUgcmVwbGllcyBhcmUgYXMgZm9sbG93Lg0KMS4gUDE6MHhBMSBpcyBvbmUg
cmVnaXN0ZXIgdG8gY29udHJvbCBELVBIWSB0aW1pbmcgcGFyYW1ldGVycyBiYXNlZCBvbg0KYmNs
ay4gSXRzIHNldHRpbmcgc2hhbGwgbWF0Y2ggdGhlIE1JUEkgQ1NJLTIgdGltaW5nIGNsb2NrLg0K
Mi4gRm9yIG9uZSBhbm90aGVyIHNjZW5hcmlvLCBpZiBNSVBJIHBpeGVsIHJhdGUobGluayBmcmVx
dWVuY3kpIGRpZmZlcnMNCmJldHdlZW4gc2NlbmFyaW9zLCB0aGUgc2V0dGluZyBvZiB0aGlzIHBh
cmFtZXRlciBtYXkgYWxzbyBiZSBkaWZmZXJlbnQuDQozLiBJbiBvbmUgc3BlY2lhbCBjYXNlLCB3
ZSBtYXkgYWxzbyBuZWVkIHRvIGFkanVzdCB0aGUgdmFsdWUsIGV2ZW4gZm9yDQp0aGUgc2FtZSBz
Y2VuYXJpbywgc3VjaCBhcyB0aGUgZmFpbHVyZSBvZiBhIGNlcnRhaW4gTUlQSSB0ZXN0Lg0KDQpG
cm9tIG15IHBlcnNwZWN0aXZlLCB0ZW1wb3JhbGx5IHdlIGRvbid0IHBsYW4gdG8gaGF2ZSBhIGRp
ZmZlcmVudA0Kc2NlbmFyaW8gZm9yIE9WMDJBMTAsIGFzIHRoZSBjdXJyZW50IHJlc29sdXRpb24o
MTYwMHgxMjAwKSBpcyBuZWFyIHRvDQp0aGUgbG93ZXIgbGltaXQgb2YgbW9zdCBzbWFydCBtb2Jp
bGUgZGV2aWNlcy4NCkluIHRoZSBtZWFudGltZSwgY29uc2lkZXJpbmcgdGhlIGRpZmZlcmVuY2Ug
b2YgdGhlIHBoeXNpY2FsIGNvbm5lY3Rpb25zDQpmb3IgTUlQSSBzaWduYWxzIHRvIHVzZXItZmFj
aW5nIGNhbWVyYSBiZXR3ZWVuIG91ciAyIHByb2plY3RzLCBpdCBzZWVtcw0KdG8gYmUgdmVyeSBk
aWZmaWN1bHQgdG8gZmluZCB1bml2ZXJzYWwgU0kgcGFyYW1ldGVycyBmb3IgYm90aCBwcm9qZWN0
cy4NClNvIGZvciB0aGlzIGNhc2UsIEkgd29uZGVyIHdoZXRoZXIgd2UgY291bGQgcmVzZXJ2ZSB0
aGlzIHByaXZhdGUNCnByb3BlcnR5IHRvIG1haW50YWluIHN1Y2ggZmxleGliaWxpdHkuDQoNCj4g
QmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K

