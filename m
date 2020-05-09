Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0491CBEB6
	for <lists+linux-media@lfdr.de>; Sat,  9 May 2020 10:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgEIIID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 May 2020 04:08:03 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40711 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725901AbgEIIID (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 May 2020 04:08:03 -0400
X-UUID: 09f27500c2f14871b0490df84dca006f-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Mhv6h1F1j43UMpt10ltzdfLLnRC2QJxLwaCggRjdpNs=;
        b=oypYKjAOdMSD9PnxbvGoNx5fj4PZxyYNOlQ6HCTUH9Vuy+HGEgPt8HUS21+1Uoj3JIob4ULJgErAEaaNyQpKX4H90h9JMnHc1NxpOo+cO4pBL5LSEmOv72mij8jmUJ3+6BkVjEQjT4kKi061LM6+gCXUZf/iqnHvX8U8HbIypHY=;
X-UUID: 09f27500c2f14871b0490df84dca006f-20200509
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 560800752; Sat, 09 May 2020 16:07:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 16:07:56 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 16:07:54 +0800
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
Subject: [V8, 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Sat, 9 May 2020 16:06:25 +0800
Message-ID: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZ3MgaW4gWUFNTCBhbmQgVjRMMiBz
dWItZGV2aWNlIGRyaXZlciBmb3IgT21uaXZpc2lvbidzDQpPVjAyQTEwIDIgbWVnYXBpeGVsIENN
T1MgMS81IiBzZW5zb3IsIHdoaWNoIGhhcyBhIHNpbmdsZSBNSVBJIGxhbmUgaW50ZXJmYWNlDQph
bmQgb3V0cHV0IGZvcm1hdCBvZiAxMC1iaXQgUkFXLg0KDQpUaGUgZHJpdmVyIGlzIGltcGxlbWVu
dGVkIHdpdGggVjRMMiBmcmFtZXdvcmsuDQogLSBBc3luYyByZWdpc3RlcmVkIGFzIGEgVjRMMiBz
dWItZGV2aWNlLg0KIC0gQXMgdGhlIGZpcnN0IGNvbXBvbmVudCBvZiBjYW1lcmEgc3lzdGVtIGlu
Y2x1ZGluZyBTZW5pbmYsIElTUCBwaXBlbGluZS4NCiAtIEEgbWVkaWEgZW50aXR5IHRoYXQgcHJv
dmlkZXMgb25lIHNvdXJjZSBwYWQgaW4gY29tbW9uIGFuZCB0d28gZm9yIGR1YWwtY2FtLg0KIA0K
UHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5kIGhlcmU6DQog
djc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNDMwMDgwOTI0LjEx
NDAtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHY2OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1tZWRpYS8yMDE5MTIxMTExMjg0OS4xNjcwNS0xLWRvbmdjaHVuLnpodUBtZWRp
YXRlay5jb20vDQogdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkx
MTA0MTA1NzEzLjI0MzExLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2NDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA5MDcwOTI3MjguMjM4OTctMS1kb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tZWRpYS8yMDE5MDgxOTAzNDMzMS4xMzA5OC0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20v
DQogdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwNzA0MDg0NjUx
LjMxMDUtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDUyMzEwMjIwNC4yNDExMi0xLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQoNCkNoYW5nZXMgb2YgdjggbWFpbmx5IGFkZHJlc3MgY29tbWVudHMgZnJv
bSBSb2IsIFRvbWFzeiwgU2FrYXJpLCBBbm4uDQogLSBVcGRhdGUgbW9yZSBkZXRhaWxzIGFib3V0
IHRoZSBwcml2YXRlIERUIHByb3BlcnR5ICJvdnRpLG1pcGktdHgtc3BlZWQiDQogLSBEcm9wIHVu
bmVjZXNzYXJ5IGRlc2NyaXB0aW9uIG9mICJwb3dlcmRvd24tZ3Bpb3MiIGFuZCAicmVzZXQtZ3Bp
b3MiDQogLSBBZGQgImRhdGEtbGFuZXMiIGFuZCAiY2xvY2stbm9uY29udGludW91cyIgdG8gYmUg
cHJlc2VudA0KIC0gU2V0IFAxOjB4QTEgdG8gMHgwNCB0byBmb2xsb3cgdGhlIG5ld2VzdCBEQiBz
ZXR0aW5ncw0KDQpQbGVhc2UgcmV2aWV3Lg0KVGhhbmtzLg0KDQpEb25nY2h1biBaaHUgKDIpOg0K
ICBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiBpMmM6IERvY3VtZW50IE9WMDJBMTAgYmluZGlu
Z3MNCiAgbWVkaWE6IGkyYzogb3YwMmExMDogQWRkIE9WMDJBMTAgaW1hZ2Ugc2Vuc29yIGRyaXZl
cg0KDQogLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbCAgICAgICAgICAg
fCAgMTg0ICsrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDggKw0KIGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAxMyArDQogZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICAxICsNCiBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMg
ICAgICAgICAgICAgICAgICAgICAgICB8IDEwOTQgKysrKysrKysrKysrKysrKysrKysNCiA1IGZp
bGVzIGNoYW5nZWQsIDEzMDAgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1s
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL292MDJhMTAuYw0KDQotLSAN
CjIuOS4yDQo=

