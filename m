Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C0D1CBEB7
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 10:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgEIIID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 04:08:03 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:8656 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725880AbgEIIID (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 04:08:03 -0400
X-UUID: f76c0b7fd32843e1946649e78816ef05-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OPjXV8y9bVEk+WunDCXsPVPGZ9csUHtahP7dT1lEgO0=;
        b=l21qBQen4Jll9hOc7ByM31tWlMDd4g+xbTkQl+iCSrNmP7j/QanjjkECNIr6v0e1sog6ZyhZlKHTMn6Do2vLbnyB3+uegPz0XdEG9hcnKyTFTsOxHf0FgqNIuOyzHqyDYedhZDhUBeIOrjBzBe9NLLw1V+ZIsBO2yIBimsnGePQ=;
X-UUID: f76c0b7fd32843e1946649e78816ef05-20200509
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 605430803; Sat, 09 May 2020 16:07:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 16:07:57 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 16:07:56 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [V8, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
Date:   Sat, 9 May 2020 16:06:26 +0800
Message-ID: <20200509080627.23222-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERUIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIE9tbml2aXNpb24gT1YwMkExMCBpbWFn
ZSBzZW5zb3IuDQoNClNpZ25lZC1vZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1l
ZGlhdGVrLmNvbT4NCi0tLQ0KIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlh
bWwgICAgICAgICAgIHwgMTg0ICsrKysrKysrKysrKysrKysrKysrKw0KIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsNCiAyIGZpbGVzIGNo
YW5nZWQsIDE5MSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCg0KZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0
aSxvdjAyYTEwLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
aTJjL292dGksb3YwMmExMC55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAw
MC4uNTQ2OGQxYg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0KQEAgLTAsMCArMSwxODQgQEAN
CisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpDQor
IyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVkaWEvaTJjL292dGksb3YwMmExMC55
YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KKw0KK3RpdGxlOiBPbW5pdmlzaW9uIE9WMDJBMTAgQ01PUyBTZW5zb3IgRGV2aWNlIFRy
ZWUgQmluZGluZ3MNCisNCittYWludGFpbmVyczoNCisgIC0gRG9uZ2NodW4gWmh1IDxkb25nY2h1
bi56aHVAbWVkaWF0ZWsuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOiB8LQ0KKyAgVGhlIE9tbml2aXNp
b24gT1YwMkExMCBpcyBhIGxvdy1jb3N0LCBoaWdoIHBlcmZvcm1hbmNlLCAxLzUtaW5jaCwgMiBt
ZWdhcGl4ZWwNCisgIGltYWdlIHNlbnNvciwgd2hpY2ggaXMgdGhlIGxhdGVzdCBwcm9kdWN0aW9u
IGRlcml2ZWQgZnJvbSBPbW5pdmlzaW9uJ3MgQ01PUw0KKyAgaW1hZ2Ugc2Vuc29yIHRlY2hub2xv
Z3kuIEloaXMgY2hpcCBzdXBwb3J0cyBoaWdoIGZyYW1lIHJhdGUgc3BlZWRzIHVwIHRvIDMwZnBz
DQorICBAIDE2MDB4MTIwMCAoVVhHQSkgcmVzb2x1dGlvbiB0cmFuc2ZlcnJlZCBvdmVyIGEgMS1s
YW5lIE1JUEkgaW50ZXJmYWNlLiBUaGUNCisgIHNlbnNvciBvdXRwdXQgaXMgYXZhaWxhYmxlIHZp
YSBDU0ktMiBzZXJpYWwgZGF0YSBvdXRwdXQuDQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGli
bGU6DQorICAgIGNvbnN0OiBvdnRpLG92MDJhMTANCisNCisgIHJlZzoNCisgICAgZGVzY3JpcHRp
b246IEkyQyBkZXZpY2UgYWRkcmVzcw0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgY2xvY2tzOg0K
KyAgICBpdGVtczoNCisgICAgICAtIGRlc2NyaXB0aW9uOiB0b3AgbXV4IGNhbXRnIGNsb2NrDQor
ICAgICAgLSBkZXNjcmlwdGlvbjogZGV2aWRlciBjbG9jaw0KKw0KKyAgY2xvY2stbmFtZXM6DQor
ICAgIGl0ZW1zOg0KKyAgICAgIC0gY29uc3Q6IGVjbGsNCisgICAgICAtIGNvbnN0OiBmcmVxX211
eA0KKw0KKyAgY2xvY2stZnJlcXVlbmN5Og0KKyAgICBkZXNjcmlwdGlvbjoNCisgICAgICBGcmVx
dWVuY3kgb2YgdGhlIGVjbGsgY2xvY2sgaW4gSGVydHouDQorDQorICBkb3ZkZC1zdXBwbHk6DQor
ICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2Vk
IGFzIGludGVyZmFjZSBwb3dlciBzdXBwbHkuDQorDQorICBhdmRkLXN1cHBseToNCisgICAgZGVz
Y3JpcHRpb246DQorICAgICAgRGVmaW5pdGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgYW5h
bG9nIHBvd2VyIHN1cHBseS4NCisNCisgIGR2ZGQtc3VwcGx5Og0KKyAgICBkZXNjcmlwdGlvbjoN
CisgICAgICBEZWZpbml0aW9uIG9mIHRoZSByZWd1bGF0b3IgdXNlZCBhcyBkaWdpdGFsIHBvd2Vy
IHN1cHBseS4NCisNCisgIHBvd2VyZG93bi1ncGlvczoNCisgICAgbWF4SXRlbXM6IDENCisNCisg
IHJlc2V0LWdwaW9zOg0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgcm90YXRpb246DQorICAgIGRl
c2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHNlbnNvcidzIHBsYWNlbWVudCwg
dmFsaWQgdmFsdWVzIGFyZSAwIGFuZCAxODAuDQorICAgIGFsbE9mOg0KKyAgICAgIC0gJHJlZjog
Ii9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiINCisgICAgICAtIGVudW06
DQorICAgICAgICAgIC0gMCAgICAjIFNlbnNvciBNb3VudGVkIFVwcmlnaHQgKGRlZmF1bHQpDQor
ICAgICAgICAgIC0gMTgwICAjIFNlbnNvciBNb3VudGVkIFVwc2lkZSBEb3duDQorDQorICBvdnRp
LG1pcGktdHgtc3BlZWQ6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIEluZGljYXRpb24gb2Yg
TUlQSSB0cmFuc21pc3Npb24gc3BlZWQgc2VsZWN0LCB3aGljaCBpcyB0byBjb250cm9sIEQtUEhZ
DQorICAgICAgdGltaW5nIHNldHRpbmcgYnkgYWRqdXN0aW5nIE1JUEkgY2xvY2sgdm9sdGFnZSB0
byBpbXByb3ZlIHRoZSBjbG9jaw0KKyAgICAgIGRyaXZlciBjYXBhYmlsaXR5Lg0KKyAgICBhbGxP
ZjoNCisgICAgICAtICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50
MzIiDQorICAgICAgLSBlbnVtOg0KKyAgICAgICAgICAtIDAgICAgIyAgMjBNSHogLSAgMzBNSHoN
CisgICAgICAgICAgLSAxICAgICMgIDMwTUh6IC0gIDUwTUh6DQorICAgICAgICAgIC0gMiAgICAj
ICA1ME1IeiAtICA3NU1Ieg0KKyAgICAgICAgICAtIDMgICAgIyAgNzVNSHogLSAxMDBNSHoNCisg
ICAgICAgICAgLSA0ICAgICMgMTAwTUh6IC0gMTMwTUh6IChzdWdnZXN0ZWQpDQorICAgICAgICAg
IC0gNSAgICAjIE1hbnVhbA0KKw0KKyAgIyBTZWUgLi4vdmlkZW8taW50ZXJmYWNlcy50eHQgZm9y
IGRldGFpbHMNCisgIHBvcnQ6DQorICAgIHR5cGU6IG9iamVjdA0KKyAgICBhZGRpdGlvbmFsUHJv
cGVydGllczogZmFsc2UNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgQSBub2RlIGNvbnRhaW5p
bmcgYW4gb3V0cHV0IHBvcnQgbm9kZSB3aXRoIGFuIGVuZHBvaW50IGRlZmluaXRpb24NCisgICAg
ICBhcyBkb2N1bWVudGVkIGluDQorICAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0DQorDQorICAgIHByb3BlcnRpZXM6DQorICAg
ICAgZW5kcG9pbnQ6DQorICAgICAgICB0eXBlOiBvYmplY3QNCisNCisgICAgICAgIHByb3BlcnRp
ZXM6DQorICAgICAgICAgIGRhdGEtbGFuZXM6DQorICAgICAgICAgICAgZGVzY3JpcHRpb246IHwt
DQorICAgICAgICAgICAgICBUaGUgZHJpdmVyIG9ubHkgc3VwcG9ydHMgMS1sYW5lIG9wZXJhdGlv
bi4NCisgICAgICAgICAgICBpdGVtczoNCisgICAgICAgICAgICAgIC0gY29uc3Q6IDENCisgICAg
ICAgICAgICAgIC0gY29uc3Q6IDINCisgICAgICAgICAgICAgIC0gY29uc3Q6IDMNCisgICAgICAg
ICAgICAgIC0gY29uc3Q6IDQNCisNCisgICAgICAgICAgY2xvY2stbm9uY29udGludW91czoNCisg
ICAgICAgICAgICB0eXBlOiBib29sZWFuDQorICAgICAgICAgICAgZGVzY3JpcHRpb246IHwtDQor
ICAgICAgICAgICAgICBNSVBJIENTSS0yIGNsb2NrIGlzIG5vbi1jb250aW51b3VzIGlmIHRoaXMg
cHJvcGVydHkgaXMgcHJlc2VudCwNCisgICAgICAgICAgICAgIG90aGVyd2lzZSBpdCdzIGNvbnRp
bnVvdXMuDQorDQorICAgICAgICAgIGxpbmstZnJlcXVlbmNpZXM6DQorICAgICAgICAgICAgYWxs
T2Y6DQorICAgICAgICAgICAgICAtICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRp
b25zL3VpbnQ2NC1hcnJheQ0KKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgICAgICAg
ICAgQWxsb3dlZCBkYXRhIGJ1cyBmcmVxdWVuY2llcy4gMzkwMDAwMDAgSHogaXMgc3VwcG9ydGVk
IGJ5DQorICAgICAgICAgICAgICB0aGUgZHJpdmVyLg0KKw0KKyAgICAgICAgcmVxdWlyZWQ6DQor
ICAgICAgICAgIC0gbGluay1mcmVxdWVuY2llcw0KKw0KKyAgICByZXF1aXJlZDoNCisgICAgICAt
IGVuZHBvaW50DQorDQorcmVxdWlyZWQ6DQorICAtIGNvbXBhdGlibGUNCisgIC0gcmVnDQorICAt
IGNsb2Nrcw0KKyAgLSBjbG9jay1uYW1lcw0KKyAgLSBjbG9jay1mcmVxdWVuY3kNCisgIC0gZG92
ZGQtc3VwcGx5DQorICAtIGF2ZGQtc3VwcGx5DQorICAtIGR2ZGQtc3VwcGx5DQorICAtIHBvd2Vy
ZG93bi1ncGlvcw0KKyAgLSByZXNldC1ncGlvcw0KKyAgLSBwb3J0DQorDQorYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisNCisgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL210ODE4My1jbGsuaD4NCisgICAgI2luY2x1ZGUgPGR0LWJpbmRp
bmdzL2dwaW8vZ3Bpby5oPg0KKw0KKyAgICBpMmMgew0KKyAgICAgICAgY2xvY2stZnJlcXVlbmN5
ID0gPDQwMDAwMD47DQorICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisgICAgICAgICNz
aXplLWNlbGxzID0gPDA+Ow0KKw0KKyAgICAgICAgb3YwMmExMDogY2FtZXJhLXNlbnNvckAzZCB7
DQorICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJvdnRpLG92MDJhMTAiOw0KKyAgICAgICAgICAg
IHJlZyA9IDwweDNkPjsNCisgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0K
KyAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmY2xrXzI0bV9jYW0+Ow0KKw0KKyAgICAgICAgICAg
IGNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NVVhfQ0FNVEc+LA0KKyAgICAgICAgICAgICAg
ICAgICAgIDwmdG9wY2tnZW4gQ0xLX1RPUF9VTklWUF8xOTJNX0Q4PjsNCisgICAgICAgICAgICBj
bG9jay1uYW1lcyA9ICJlY2xrIiwgImZyZXFfbXV4IjsNCisgICAgICAgICAgICBjbG9jay1mcmVx
dWVuY3kgPSA8MjQwMDAwMDA+Ow0KKw0KKyAgICAgICAgICAgIHJvdGF0aW9uID0gPDE4MD47DQor
ICAgICAgICAgICAgb3Z0aSxtaXBpLXR4LXNwZWVkID0gPDM+Ow0KKw0KKyAgICAgICAgICAgIGRv
dmRkLXN1cHBseSA9IDwmbXQ2MzU4X3ZjYW1pb19yZWc+Ow0KKyAgICAgICAgICAgIGF2ZGQtc3Vw
cGx5ID0gPCZtdDYzNThfdmNhbWExX3JlZz47DQorICAgICAgICAgICAgZHZkZC1zdXBwbHkgPSA8
Jm10NjM1OF92Y24xOF9yZWc+Ow0KKw0KKyAgICAgICAgICAgIHBvd2VyZG93bi1ncGlvcyA9IDwm
cGlvIDEwNyBHUElPX0FDVElWRV9MT1c+Ow0KKyAgICAgICAgICAgIHJlc2V0LWdwaW9zID0gPCZw
aW8gMTA5IEdQSU9fQUNUSVZFX0hJR0g+Ow0KKw0KKyAgICAgICAgICAgIHBvcnQgew0KKyAgICAg
ICAgICAgICAgICB3Y2FtX291dDogZW5kcG9pbnQgew0KKyAgICAgICAgICAgICAgICAgICAgcmVt
b3RlLWVuZHBvaW50ID0gPCZtaXBpX2luX3djYW0+Ow0KKyAgICAgICAgICAgICAgICAgICAgZGF0
YS1sYW5lcyA9IDwxPjsNCisgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5vbmNvbnRpbnVvdXM7
DQorICAgICAgICAgICAgICAgICAgICBsaW5rLWZyZXF1ZW5jaWVzID0gL2JpdHMvIDY0IDwzOTAw
MDAwMDA+Ow0KKyAgICAgICAgICAgICAgICB9Ow0KKyAgICAgICAgICAgIH07DQorICAgICAgICB9
Ow0KKyAgICB9Ow0KKw0KKy4uLg0KZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCmluZGV4IGU2NGU1ZGIuLjYzYTIzMzUgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVSUw0KKysr
IGIvTUFJTlRBSU5FUlMNCkBAIC0xMjM4OSw2ICsxMjM4OSwxMyBAQCBNOglIYXJhbGQgV2VsdGUg
PGxhZm9yZ2VAZ251bW9ua3Mub3JnPg0KIFM6CU1haW50YWluZWQNCiBGOglkcml2ZXJzL2NoYXIv
cGNtY2lhL2NtNDA0MF9jcy4qDQogDQorT01OSVZJU0lPTiBPVjAyQTEwIFNFTlNPUiBEUklWRVIN
CitNOglEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQorTDoJbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnDQorUzoJTWFpbnRhaW5lZA0KK1Q6CWdpdCBnaXQ6Ly9saW51
eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCisNCiBPTU5JVklTSU9OIE9WMTM4NTgg
U0VOU09SIERSSVZFUg0KIE06CVNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVs
LmNvbT4NCiBMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCi0tIA0KMi45LjINCg==

