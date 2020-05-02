Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3FE1C26DC
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 18:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgEBQSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 12:18:34 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:65045 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728342AbgEBQSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 12:18:34 -0400
X-UUID: 570e609bb0434dbd94f61e0e9c1a2d38-20200503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fchvuHLghoAhuDb1n3lVC1u/DWcrET0Dm/xjW9sen3o=;
        b=sE9fQZ02O56qMR5sEZufs6ahJicIjx9Z86/a4Wn1Wc5uzuI7UYPWZm9UuMYS1nPoPWnycBSFvjfurJno0EVMDojRZAcrvoyxAJp/fNEFQibJub2bW/lAdh2xRAV5nQwjzcC2BkyIpfX3BXhKmnctH24iqHZ4Iih6yIf9vPeLqsU=;
X-UUID: 570e609bb0434dbd94f61e0e9c1a2d38-20200503
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 802083616; Sun, 03 May 2020 00:18:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 00:18:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 00:18:25 +0800
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
Subject: [V5, 1/2] media: dt-bindings: media: i2c: Document DW9768 bindings
Date:   Sun, 3 May 2020 00:17:26 +0800
Message-ID: <20200502161727.30463-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERldmljZVRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBEb25nd29vbiBBbmF0ZWNo
IERXOTc2OCB2b2ljZQ0KY29pbCBhY3R1YXRvci4NCg0KU2lnbmVkLW9mZi1ieTogRG9uZ2NodW4g
Wmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL21lZGlh
L2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCA2MCArKysrKysrKysrKysrKysrKysr
KysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNyArKysNCiAyIGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25n
d29vbixkdzk3NjgueWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi44ZGVjMjJkDQotLS0gL2Rldi9udWxsDQor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29u
LGR3OTc2OC55YW1sDQpAQCAtMCwwICsxLDYwIEBADQorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KKyMgQ29weXJpZ2h0IChjKSAyMDIwIE1lZGlh
VGVrIEluYy4NCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCMNCiskc2NoZW1hOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisNCit0aXRsZTogRG9uZ3dv
b24gQW5hdGVjaCBEVzk3NjggVm9pY2UgQ29pbCBNb3RvciAoVkNNKSBMZW5zIERldmljZSBUcmVl
IEJpbmRpbmdzDQorDQorbWFpbnRhaW5lcnM6DQorICAtIERvbmdjaHVuIFpodSA8ZG9uZ2NodW4u
emh1QG1lZGlhdGVrLmNvbT4NCisNCitkZXNjcmlwdGlvbjogfC0NCisgIFRoZSBEb25nd29vbiBE
Vzk3NjggaXMgYSBzaW5nbGUgMTAtYml0IGRpZ2l0YWwtdG8tYW5hbG9nIChEQUMpIGNvbnZlcnRl
cg0KKyAgd2l0aCAxMDAgbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBhYmlsaXR5LiBWQ00gY3Vy
cmVudCBpcyBjb250cm9sbGVkIHdpdGgNCisgIGEgbGluZWFyIG1vZGUgZHJpdmVyLiBUaGUgREFD
IGlzIGNvbnRyb2xsZWQgdmlhIGEgMi13aXJlIChJMkMtY29tcGF0aWJsZSkNCisgIHNlcmlhbCBp
bnRlcmZhY2UgdGhhdCBvcGVyYXRlcyBhdCBjbG9jayByYXRlcyB1cCB0byAxTUh6LiBUaGlzIGNo
aXANCisgIGludGVncmF0ZXMgQWR2YW5jZWQgQWN0dWF0b3IgQ29udHJvbCAoQUFDKSB0ZWNobm9s
b2d5IGFuZCBpcyBpbnRlbmRlZCBmb3INCisgIGRyaXZpbmcgdm9pY2UgY29pbCBsZW5zZXMgaW4g
Y2FtZXJhIG1vZHVsZXMuDQorDQorcHJvcGVydGllczoNCisgIGNvbXBhdGlibGU6DQorICAgIGNv
bnN0OiBkb25nd29vbixkdzk3NjgNCisNCisgIHJlZzoNCisgICAgbWF4SXRlbXM6IDENCisNCisg
IHZpbi1zdXBwbHk6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhl
IHJlZ3VsYXRvciB1c2VkIGFzIEkyQyBJL08gaW50ZXJmYWNlIHBvd2VyIHN1cHBseS4NCisNCisg
IHZkZC1zdXBwbHk6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhl
IHJlZ3VsYXRvciB1c2VkIGFzIFZDTSBjaGlwIHBvd2VyIHN1cHBseS4NCisNCityZXF1aXJlZDoN
CisgIC0gY29tcGF0aWJsZQ0KKyAgLSByZWcNCisgIC0gdmluLXN1cHBseQ0KKyAgLSB2ZGQtc3Vw
cGx5DQorDQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAt
IHwNCisgICAgaTJjIHsNCisgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsN
CisNCisgICAgICAgIGR3OTc2ODogY2FtZXJhLWxlbnNAYyB7DQorICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJkb25nd29vbixkdzk3NjgiOw0KKyAgICAgICAgICAgIHJlZyA9IDwweDBjPjsNCisN
CisgICAgICAgICAgICB2aW4tc3VwcGx5ID0gPCZtdDYzNThfdmNhbWlvX3JlZz47DQorICAgICAg
ICAgICAgdmRkLXN1cHBseSA9IDwmbXQ2MzU4X3ZjYW1hMl9yZWc+Ow0KKyAgICAgICAgfTsNCisg
ICAgfTsNCisNCisuLi4NCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQpp
bmRleCBlNjRlNWRiLi44ZDcyYzQxIDEwMDY0NA0KLS0tIGEvTUFJTlRBSU5FUlMNCisrKyBiL01B
SU5UQUlORVJTDQpAQCAtNTE1MSw2ICs1MTUxLDEzIEBAIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9y
Zy9tZWRpYV90cmVlLmdpdA0KIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9pMmMvZG9uZ3dvb24sZHc5NzE0LnR4dA0KIEY6CWRyaXZlcnMvbWVkaWEvaTJjL2R3OTcx
NC5jDQogDQorRE9OR1dPT04gRFc5NzY4IExFTlMgVk9JQ0UgQ09JTCBEUklWRVINCitNOglEb25n
Y2h1biBaaHUgPGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+DQorTDoJbGludXgtbWVkaWFAdmdl
ci5rZXJuZWwub3JnDQorUzoJTWFpbnRhaW5lZA0KK1Q6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9t
ZWRpYV90cmVlLmdpdA0KK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9pMmMvZG9uZ3dvb24sZHc5NzY4LnlhbWwNCisNCiBET05HV09PTiBEVzk4MDcgTEVOUyBWT0lD
RSBDT0lMIERSSVZFUg0KIE06CVNha2FyaSBBaWx1cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVs
LmNvbT4NCiBMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCi0tIA0KMi45LjINCg==

