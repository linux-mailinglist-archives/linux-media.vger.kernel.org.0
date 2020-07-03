Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9BD2135B1
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 10:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgGCIEl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 04:04:41 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42567 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726184AbgGCIEl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 04:04:41 -0400
X-UUID: 005fe3b05c1045bda024005f6778bef4-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=y3ZQlLeq+X0+2fVRNfbgBLUIJRh7RTRlh4+62Uvyedk=;
        b=SREC/7qKYx6cyOZlA8s1lLsxtTsE5ZXO2iemoimWJeoSE8bHMeCStPO3BEQD9qvSbGxZGjxy7w8P4Fs7Bb2GF5SZlEhPiPvnLem2KCKxTu5lXjTxS3p8HdKswucBufm73TNvve0S3tl2ewltbDGZdDj3eK0msBTLSeJptbuNcBE=;
X-UUID: 005fe3b05c1045bda024005f6778bef4-20200703
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1886985128; Fri, 03 Jul 2020 16:04:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 16:04:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 16:04:32 +0800
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
Subject: [PATCH V10 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date:   Fri, 3 Jul 2020 16:04:03 +0800
Message-ID: <20200703080404.29770-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
References: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERldmljZSBUcmVlIEJpbmRpbmcgRG9jdW1lbnRhdGlvbiBmb3IgRG9uZ3dvb24gQW5hdGVj
aA0KRFc5NzY4IHZvaWNlIGNvaWwgYWN0dWF0b3IuDQoNClJldmlld2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPg0KU2lnbmVkLW9mZi1ieTogRG9uZ2NodW4gWmh1IDxkb25nY2h1
bi56aHVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29v
bixkdzk3NjgueWFtbCAgICAgICAgfCAxMDAgKysrKysrKysrKysrKysrKysrKysrDQogTUFJTlRB
SU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKysNCiAy
IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4
LnlhbWwNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQpuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KaW5kZXggMDAwMDAwMC4uNTRlOTNmNg0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFt
bA0KQEAgLTAsMCArMSwxMDAgQEANCisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpDQorIyBDb3B5cmlnaHQgKGMpIDIwMjAgTWVkaWFUZWsgSW5jLg0K
KyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWVk
aWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBEb25nd29vbiBBbmF0ZWNo
IERXOTc2OCBWb2ljZSBDb2lsIE1vdG9yIChWQ00pIERldmljZSBUcmVlIEJpbmRpbmdzDQorDQor
bWFpbnRhaW5lcnM6DQorICAtIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNv
bT4NCisNCitkZXNjcmlwdGlvbjogfC0NCisgIFRoZSBEb25nd29vbiBEVzk3NjggaXMgYSBzaW5n
bGUgMTAtYml0IGRpZ2l0YWwtdG8tYW5hbG9nIChEQUMpIGNvbnZlcnRlcg0KKyAgd2l0aCAxMDAg
bUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5LiBWQ00gY3VycmVudCBpcyBjb250cm9s
bGVkIHdpdGgNCisgIGEgbGluZWFyIG1vZGUgZHJpdmVyLiBUaGUgREFDIGlzIGNvbnRyb2xsZWQg
dmlhIGEgMi13aXJlIChJMkMtY29tcGF0aWJsZSkNCisgIHNlcmlhbCBpbnRlcmZhY2UgdGhhdCBv
cGVyYXRlcyBhdCBjbG9jayByYXRlcyB1cCB0byAxTUh6LiBUaGlzIGNoaXANCisgIGludGVncmF0
ZXMgQWR2YW5jZWQgQWN0dWF0b3IgQ29udHJvbCAoQUFDKSB0ZWNobm9sb2d5IGFuZCBpcyBpbnRl
bmRlZCBmb3INCisgIGRyaXZpbmcgdm9pY2UgY29pbCBsZW5zZXMgaW4gY2FtZXJhIG1vZHVsZXMu
DQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAgIGVudW06DQorICAgICAgLSBk
b25nd29vbixkdzk3NjggIyBmb3IgRFc5NzY4IFZDTQ0KKyAgICAgIC0gZ2lhbnRlYyxndDk3Njkg
ICMgZm9yIEdUOTc2OSBWQ00NCisNCisgIHJlZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisgIHZp
bi1zdXBwbHk6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJl
Z3VsYXRvciB1c2VkIGFzIERpZ2l0YWwgSS9PIHZvbHRhZ2Ugc3VwcGx5Lg0KKw0KKyAgdmRkLXN1
cHBseToNCisgICAgZGVzY3JpcHRpb246DQorICAgICAgRGVmaW5pdGlvbiBvZiB0aGUgcmVndWxh
dG9yIHVzZWQgYXMgRGlnaXRhbCBjb3JlIHZvbHRhZ2Ugc3VwcGx5Lg0KKw0KKyAgZG9uZ3dvb24s
YWFjLW1vZGU6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIEluZGljYXRpb24gb2YgQUFDIG1v
ZGUgc2VsZWN0Lg0KKyAgICBhbGxPZjoNCisgICAgICAtICRyZWY6ICIvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzIiDQorICAgICAgLSBlbnVtOg0KKyAgICAgICAgICAtIDEg
ICAgIyAgQUFDMiBtb2RlKG9wZXJhdGlvbiB0aW1lIyAwLjQ4IHggVHZpYikNCisgICAgICAgICAg
LSAyICAgICMgIEFBQzMgbW9kZShvcGVyYXRpb24gdGltZSMgMC43MCB4IFR2aWIpDQorICAgICAg
ICAgIC0gMyAgICAjICBBQUM0IG1vZGUob3BlcmF0aW9uIHRpbWUjIDAuNzUgeCBUdmliKQ0KKyAg
ICAgICAgICAtIDUgICAgIyAgQUFDOCBtb2RlKG9wZXJhdGlvbiB0aW1lIyAxLjEzIHggVHZpYikN
CisgICAgICAgIGRlZmF1bHQ6IDINCisNCisgIGRvbmd3b29uLGFhYy10aW1pbmc6DQorICAgIGRl
c2NyaXB0aW9uOg0KKyAgICAgIE51bWJlciBvZiBBQUMgVGltaW5nIGNvdW50IHRoYXQgY29udHJv
bGxlZCBieSBvbmUgNi1iaXQgcGVyaW9kIG9mDQorICAgICAgdmlicmF0aW9uIHJlZ2lzdGVyIEFB
Q1RbNTowXSwgdGhlIHVuaXQgb2Ygd2hpY2ggaXMgMTAwIHVzLg0KKyAgICBhbGxPZjoNCisgICAg
ICAtICRyZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiDQorICAg
ICAgLSBkZWZhdWx0OiAweDIwDQorICAgICAgICBtaW5pbXVtOiAweDAwDQorICAgICAgICBtYXhp
bXVtOiAweDNmDQorDQorICBkb25nd29vbixjbG9jay1wcmVzYzoNCisgICAgZGVzY3JpcHRpb246
DQorICAgICAgSW5kaWNhdGlvbiBvZiBWQ00gaW50ZXJuYWwgY2xvY2sgZGl2aWRpbmcgcmF0ZSBz
ZWxlY3QsIGFzIG9uZSBtdWx0aXBsZQ0KKyAgICAgIGZhY3RvciB0byBjYWxjdWxhdGUgVkNNIHJp
bmcgcGVyaW9kaWMgdGltZSBUdmliLg0KKyAgICBhbGxPZjoNCisgICAgICAtICRyZWY6ICIvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiDQorICAgICAgLSBlbnVtOg0KKyAg
ICAgICAgICAtIDAgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICAyDQorICAgICAgICAgIC0gMSAgICAj
ICBEaXZpZGluZyBSYXRlIC0gIDENCisgICAgICAgICAgLSAyICAgICMgIERpdmlkaW5nIFJhdGUg
LSAgMS8yDQorICAgICAgICAgIC0gMyAgICAjICBEaXZpZGluZyBSYXRlIC0gIDEvNA0KKyAgICAg
ICAgICAtIDQgICAgIyAgRGl2aWRpbmcgUmF0ZSAtICA4DQorICAgICAgICAgIC0gNSAgICAjICBE
aXZpZGluZyBSYXRlIC0gIDQNCisgICAgICAgIGRlZmF1bHQ6IDENCisNCityZXF1aXJlZDoNCisg
IC0gY29tcGF0aWJsZQ0KKyAgLSByZWcNCisgIC0gdmluLXN1cHBseQ0KKyAgLSB2ZGQtc3VwcGx5
DQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwN
CisNCisgICAgaTJjIHsNCisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KKyAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47DQorDQorICAgICAgICBkdzk3Njg6IGNhbWVyYS1sZW5zQGMgew0K
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZG9uZ3dvb24sZHc5NzY4IjsNCisgICAgICAgICAg
ICByZWcgPSA8MHgwYz47DQorDQorICAgICAgICAgICAgdmluLXN1cHBseSA9IDwmbXQ2MzU4X3Zj
YW1pb19yZWc+Ow0KKyAgICAgICAgICAgIHZkZC1zdXBwbHkgPSA8Jm10NjM1OF92Y2FtYTJfcmVn
PjsNCisgICAgICAgICAgICBkb25nd29vbixhYWMtdGltaW5nID0gPDB4Mzk+Ow0KKyAgICAgICAg
fTsNCisgICAgfTsNCisNCisuLi4NCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTDQppbmRleCA2OGYyMWQ0Li42MjY5MGM0IDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisr
KyBiL01BSU5UQUlORVJTDQpAQCAtNTIxNSw2ICs1MjE1LDEzIEBAIFQ6CWdpdCBnaXQ6Ly9saW51
eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzE0LnR4dA0KIEY6CWRyaXZlcnMvbWVkaWEvaTJj
L2R3OTcxNC5jDQogDQorRE9OR1dPT04gRFc5NzY4IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCitN
OglEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQorTDoJbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnDQorUzoJTWFpbnRhaW5lZA0KK1Q6CWdpdCBnaXQ6Ly9saW51eHR2
Lm9yZy9tZWRpYV90cmVlLmdpdA0KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCisNCiBET05HV09PTiBEVzk4MDcgTEVO
UyBWT0lDRSBDT0lMIERSSVZFUg0KIE06CVNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4
LmludGVsLmNvbT4NCiBMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCi0tIA0KMi45LjIN
Cg==

