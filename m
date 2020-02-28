Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1AE1173C5B
	for <lists+linux-media@lfdr.de>; Fri, 28 Feb 2020 17:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbgB1QAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Feb 2020 11:00:14 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:43434 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727116AbgB1QAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Feb 2020 11:00:14 -0500
X-UUID: 39bd3b5b92dd4a1a8d047736faed5f73-20200229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5RJLY1MQrP0gGlwkxNDSI9bID468livNLpfE52uIpb0=;
        b=L7ZzXiqT3rNe224+4Z6hFiCoha4TiSI/0skUQfx7BA8C7ob0dWPWVNN4ojCGqnHYLrPfPzYy0oJc9WB+sBX+DIu/3Y/CrWaaljva+AQxdFP7VqSq+eUKRs66IROeXLuiCy+dX/g5EznEG0N5yxNvSp7Bt9eARTtYL/Z92EqnG5s=;
X-UUID: 39bd3b5b92dd4a1a8d047736faed5f73-20200229
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1699948858; Sat, 29 Feb 2020 00:00:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 23:59:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 23:59:50 +0800
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
Subject: [V3, 1/2] media: i2c: dw9768: Add DT support and MAINTAINERS entry
Date:   Fri, 28 Feb 2020 23:59:57 +0800
Message-ID: <20200228155958.20657-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBpcyB0byBhZGQgdGhlIERldmljZXRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9u
IGFuZA0KTUFJTlRBSU5FUlMgZW50cnkgZm9yIGR3OTc2OCBhY3R1YXRvci4NCg0KU2lnbmVkLW9m
Zi1ieTogRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4u
L2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCAgICAgICAgfCA1NSArKysr
KysrKysrKysrKysrKysrKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNyArKysNCiAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMo
KykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvZG9uZ3dvb24sZHc5
NzY4LnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi41NWY3YzI5DQot
LS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvaTJjL2Rvbmd3b29uLGR3OTc2OC55YW1sDQpAQCAtMCwwICsxLDU1IEBADQorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQ0KKyMgQ29weXJpZ2h0
IChjKSAyMDIwIE1lZGlhVGVrIEluYy4NCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL2kyYy9kb25nd29vbixkdzk3NjgueWFtbCMNCisk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCisN
Cit0aXRsZTogRG9uZ3dvb24gQW5hdGVjaCBEVzk3NjggVm9pY2UgQ29pbCBNb3RvciAoVkNNKSBM
ZW5zIERldmljZSBUcmVlIEJpbmRpbmdzDQorDQorbWFpbnRhaW5lcnM6DQorICAtIERvbmdjaHVu
IFpodSA8ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCisNCitkZXNjcmlwdGlvbjogfC0NCisg
IFRoZSBEb25nd29vbiBEVzk3NjggaXMgYSBzaW5nbGUgMTAtYml0IGRpZ2l0YWwtdG8tYW5hbG9n
IChEQUMpIGNvbnZlcnRlcg0KKyAgd2l0aCAxMDAgbUEgb3V0cHV0IGN1cnJlbnQgc2luayBjYXBh
YmlsaXR5LiBWQ00gY3VycmVudCBpcyBjb250cm9sbGVkIHdpdGgNCisgIGEgbGluZWFyIG1vZGUg
ZHJpdmVyLiBUaGUgREFDIGlzIGNvbnRyb2xsZWQgdmlhIGEgMi13aXJlIChJMkMtY29tcGF0aWJs
ZSkNCisgIHNlcmlhbCBpbnRlcmZhY2UgdGhhdCBvcGVyYXRlcyBhdCBjbG9jayByYXRlcyB1cCB0
byAxTUh6LiBUaGlzIGNoaXANCisgIGludGVncmF0ZXMgQWR2YW5jZWQgQWN0dWF0b3IgQ29udHJv
bCAoQUFDKSB0ZWNobm9sb2d5IGFuZCBpcyBpbnRlbmRlZCBmb3INCisgIGRyaXZpbmcgdm9pY2Ug
Y29pbCBsZW5zZXMgaW4gY2FtZXJhIG1vZHVsZXMuDQorDQorcHJvcGVydGllczoNCisgIGNvbXBh
dGlibGU6DQorICAgIGNvbnN0OiBkb25nd29vbixkdzk3NjgNCisNCisgIHJlZzoNCisgICAgbWF4
SXRlbXM6IDENCisNCisgIHZpbi1zdXBwbHk6DQorICAgIGRlc2NyaXB0aW9uOg0KKyAgICAgIERl
ZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIEkyQyBJL08gaW50ZXJmYWNlIHBvd2Vy
IHN1cHBseS4NCisgICAgbWF4SXRlbXM6IDENCisNCisgIHZkZC1zdXBwbHk6DQorICAgIGRlc2Ny
aXB0aW9uOg0KKyAgICAgIERlZmluaXRpb24gb2YgdGhlIHJlZ3VsYXRvciB1c2VkIGFzIFZDTSBj
aGlwIHBvd2VyIHN1cHBseS4NCisgICAgbWF4SXRlbXM6IDENCisNCityZXF1aXJlZDoNCisgIC0g
Y29tcGF0aWJsZQ0KKyAgLSByZWcNCisgIC0gdmluLXN1cHBseQ0KKyAgLSB2ZGQtc3VwcGx5DQor
DQorYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisg
ICAgZHc5NzY4OiBjYW1lcmEtbGVuc0AwYyB7DQorICAgICAgICBjb21wYXRpYmxlID0gImRvbmd3
b29uLGR3OTc2OCI7DQorICAgICAgICByZWcgPSA8MHgwYz47DQorICAgICAgICB2aW4tc3VwcGx5
ID0gPCZtdDYzNThfdmNhbWlvX3JlZz47DQorICAgICAgICB2ZGQtc3VwcGx5ID0gPCZtdDYzNThf
dmNhbWEyX3JlZz47DQorICAgIH07DQorDQorLi4uDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMg
Yi9NQUlOVEFJTkVSUw0KaW5kZXggMzhmZTJmMy4uYjgwNWUyOSAxMDA2NDQNCi0tLSBhL01BSU5U
QUlORVJTDQorKysgYi9NQUlOVEFJTkVSUw0KQEAgLTUxMzQsNiArNTEzNCwxMyBAQCBTOglNYWlu
dGFpbmVkDQogRjoJZHJpdmVycy9tZWRpYS9pMmMvZHc5NzE0LmMNCiBGOglEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL2Rvbmd3b29uLGR3OTcxNC50eHQNCiANCitE
T05HV09PTiBEVzk3NjggTEVOUyBWT0lDRSBDT0lMIERSSVZFUg0KK006CURvbmdjaHVuIFpodSA8
ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbT4NCitMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCitUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCitTOglNYWludGFp
bmVkDQorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9kb25n
d29vbixkdzk3NjgueWFtbA0KKw0KIERPTkdXT09OIERXOTgwNyBMRU5TIFZPSUNFIENPSUwgRFJJ
VkVSDQogTToJU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KIEw6
CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KLS0gDQoyLjkuMg0K

