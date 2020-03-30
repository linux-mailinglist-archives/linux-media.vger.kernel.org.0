Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9DF197BF7
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 14:36:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730202AbgC3Mgp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 08:36:45 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:17306 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730192AbgC3Mgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 08:36:44 -0400
X-UUID: 00bebd62035445278bdf78af3c13137b-20200330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vKZ2EjPZ/y2qtamzYyVm0qfJ+kD0edNKbJeAfcXDOkc=;
        b=FoFQfCFX0Hk9vbVF3R5KgSroaT9HK9c7B0vUUpJXUZc5dRmRI4ulost6hQeXUughmH7lR8r9VOOa/XUuUZgUAlbxrdhDjniKwDOtNLaKtj2LiYxCx83mGxfqky6OE1atCBuu2vo6xm81MMU068sI6UdQcnDI4NtUAYI+Pemxz18=;
X-UUID: 00bebd62035445278bdf78af3c13137b-20200330
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 198941398; Mon, 30 Mar 2020 20:36:42 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Mar 2020 20:36:28 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Mar 2020 20:36:27 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
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
Subject: [V4, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Date:   Mon, 30 Mar 2020 20:36:33 +0800
Message-ID: <20200330123634.363-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200330123634.363-1-dongchun.zhu@mediatek.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D4B238AFE7EE4988C1108ED15035833D549164685550A449E551F0E1740931472000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBpcyB0byBhZGQgdGhlIERldmljZXRyZWVlIGJpbmRpbmcgZG9jdW1lbnRhdGlv
biBhbmQNCk1BSU5UQUlORVJTIGVudHJ5IGZvciBkdzk3NjggYWN0dWF0b3IuDQoNClNpZ25lZC1v
ZmYtYnk6IERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIC4u
Li9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwgICAgICAgIHwgNjIgKysr
KysrKysrKysrKysrKysrKysrKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDcgKysrDQogMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25z
KCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3
OTc2OC55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMC4uOGEzNTNkYw0K
LS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KQEAgLTAsMCArMSw2MiBAQA0KKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkNCisjIENvcHlyaWdo
dCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQorJVlBTUwgMS4yDQorLS0tDQorJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwjDQor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQor
DQordGl0bGU6IERvbmd3b29uIEFuYXRlY2ggRFc5NzY4IFZvaWNlIENvaWwgTW90b3IgKFZDTSkg
RGV2aWNlIFRyZWUgQmluZGluZ3MNCisNCittYWludGFpbmVyczoNCisgIC0gRG9uZ2NodW4gWmh1
IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KKw0KK2Rlc2NyaXB0aW9uOiB8LQ0KKyAgVGhl
IERvbmd3b29uIERXOTc2OCBpcyBhIHNpbmdsZSAxMC1iaXQgZGlnaXRhbC10by1hbmFsb2cgKERB
QykgY29udmVydGVyDQorICB3aXRoIDEwMCBtQSBvdXRwdXQgY3VycmVudCBzaW5rIGNhcGFiaWxp
dHkuIFZDTSBjdXJyZW50IGlzIGNvbnRyb2xsZWQgd2l0aA0KKyAgYSBsaW5lYXIgbW9kZSBkcml2
ZXIuIFRoZSBEQUMgaXMgY29udHJvbGxlZCB2aWEgYSAyLXdpcmUgKEkyQy1jb21wYXRpYmxlKQ0K
KyAgc2VyaWFsIGludGVyZmFjZSB0aGF0IG9wZXJhdGVzIGF0IGNsb2NrIHJhdGVzIHVwIHRvIDFN
SHouIFRoaXMgY2hpcA0KKyAgaW50ZWdyYXRlcyBBZHZhbmNlZCBBY3R1YXRvciBDb250cm9sIChB
QUMpIHRlY2hub2xvZ3kgYW5kIGlzIGludGVuZGVkIGZvcg0KKyAgZHJpdmluZyB2b2ljZSBjb2ls
IGxlbnNlcyBpbiBjYW1lcmEgbW9kdWxlcy4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJs
ZToNCisgICAgY29uc3Q6IGRvbmd3b29uLGR3OTc2OA0KKw0KKyAgcmVnOg0KKyAgICBtYXhJdGVt
czogMQ0KKw0KKyAgdmluLXN1cHBseToNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgRGVmaW5p
dGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgSTJDIEkvTyBpbnRlcmZhY2UgcG93ZXIgc3Vw
cGx5Lg0KKyAgICBtYXhJdGVtczogMQ0KKw0KKyAgdmRkLXN1cHBseToNCisgICAgZGVzY3JpcHRp
b246DQorICAgICAgRGVmaW5pdGlvbiBvZiB0aGUgcmVndWxhdG9yIHVzZWQgYXMgVkNNIGNoaXAg
cG93ZXIgc3VwcGx5Lg0KKyAgICBtYXhJdGVtczogMQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21w
YXRpYmxlDQorICAtIHJlZw0KKyAgLSB2aW4tc3VwcGx5DQorICAtIHZkZC1zdXBwbHkNCisNCith
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCitleGFtcGxlczoNCisgIC0gfA0KKyAgICBp
MmMyOiBpMmNAMTEwMDkwMDAgew0KKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47
DQorICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCisgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Ow0KKw0KKyAgICAgICAgZHc5NzY4OiBjYW1lcmEtbGVuc0BjIHsNCisgICAgICAgICAgICBj
b21wYXRpYmxlID0gImRvbmd3b29uLGR3OTc2OCI7DQorICAgICAgICAgICAgcmVnID0gPDB4MGM+
Ow0KKw0KKyAgICAgICAgICAgIHZpbi1zdXBwbHkgPSA8Jm10NjM1OF92Y2FtaW9fcmVnPjsNCisg
ICAgICAgICAgICB2ZGQtc3VwcGx5ID0gPCZtdDYzNThfdmNhbWEyX3JlZz47DQorICAgICAgICB9
Ow0KKyAgICB9Ow0KKw0KKy4uLg0KZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5F
UlMNCmluZGV4IDM4ZmUyZjMuLjVlMTI0ZDIgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVSUw0KKysr
IGIvTUFJTlRBSU5FUlMNCkBAIC01MTM0LDYgKzUxMzQsMTMgQEAgUzoJTWFpbnRhaW5lZA0KIEY6
CWRyaXZlcnMvbWVkaWEvaTJjL2R3OTcxNC5jDQogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3MTQudHh0DQogDQorRE9OR1dPT04gRFc5
NzY4IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCitNOglEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpo
dUBtZWRpYXRlay5jb20+DQorTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQorUzoJTWFp
bnRhaW5lZA0KK1Q6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KK0Y6CURv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4
LnlhbWwNCisNCiBET05HV09PTiBEVzk4MDcgTEVOUyBWT0lDRSBDT0lMIERSSVZFUg0KIE06CVNh
a2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCiBMOglsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcNCi0tIA0KMi45LjINCg==

