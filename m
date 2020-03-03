Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F60417761B
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 13:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729429AbgCCMfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 07:35:21 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:57298 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729335AbgCCMfK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 07:35:10 -0500
X-UUID: 557549cccf77469ca2700fc1560273e9-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jpNv/Qz84Nln2D6jXUXY+B9wTlqS5UgTmY0yTu96SWM=;
        b=kzjSiQlIsX7JACNBFLPtb6HI7v3KIo1GNIPCeRgx3Oh+4XCVQCKQZ8emgcwaRleL9ZU7rsY7GdV4nktny/frBL9xPyrhfYDxA6T4FNbt8KGOsFfC043tEoQGpkV4WQSgj5X+Y1ssauSQsRgORfTTZIGYYZxYOStAY5ugTuJwE4U=;
X-UUID: 557549cccf77469ca2700fc1560273e9-20200303
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1176969654; Tue, 03 Mar 2020 20:35:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:44 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v7 08/11] media: dt-bindings: Add jpeg enc device tree node document
Date:   Tue, 3 Mar 2020 20:34:43 +0800
Message-ID: <20200303123446.20095-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200303123446.20095-1-xia.jiang@mediatek.com>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUgZG9jdW1lbnQNCg0KUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhp
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY3OiBubyBjaGFuZ2VzDQoNCnY2OiBubyBjaGFu
Z2VzDQoNCnY1OiBubyBjaGFuZ2VzDQoNCnY0OiBubyBjaGFuZ2VzDQoNCnYzOiBjaGFuZ2UgY29t
cGF0aWJsZSB0byBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZQ0KDQp2Mjogbm8gY2hhbmdlcw0KLS0t
DQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQgIHwgMzcgKysr
KysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIu
dHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5mYThkYTY5OTQ5
M2INCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpAQCAtMCwwICsxLDM3IEBADQorKiBN
ZWRpYVRlayBKUEVHIEVuY29kZXINCisNCitNZWRpYVRlayBKUEVHIEVuY29kZXIgaXMgdGhlIEpQ
RUcgZW5jb2RlIGhhcmR3YXJlIHByZXNlbnQgaW4gTWVkaWFUZWsgU29Dcw0KKw0KK1JlcXVpcmVk
IHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlIDogc2hvdWxkIGJlIG9uZSBvZjoNCisgICAgICAg
ICAgICAgICAibWVkaWF0ZWssbXQyNzAxLWpwZ2VuYyINCisgICAgICAgICAgICAgICAuLi4NCisg
ICAgICAgICAgICAgICBmb2xsb3dlZCBieSAibWVkaWF0ZWssbXRrLWpwZ2VuYyINCistIHJlZyA6
IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBlbmNvZGVyIHJlZ2lzdGVycyBhbmQg
bGVuZ3RoIG9mDQorICBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4NCistIGludGVycnVwdHMgOiBpbnRl
cnJ1cHQgbnVtYmVyIHRvIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlci4NCistIGNsb2NrczogZGV2
aWNlIGNsb2Nrcywgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xv
Y2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0KKy0gY2xvY2stbmFtZXM6IG11c3Qg
Y29udGFpbiAianBnZW5jIi4gSXQgaXMgdGhlIGNsb2NrIG9mIEpQRUcgZW5jb2Rlci4NCistIHBv
d2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0aGUgcG93ZXIgZG9tYWluLCBzZWUNCisgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0IGZvciBk
ZXRhaWxzLg0KKy0gbWVkaWF0ZWssbGFyYjogbXVzdCBjb250YWluIHRoZSBsb2NhbCBhcmJpdGVy
cyBpbiB0aGUgY3VycmVudCBTb0NzLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIudHh0DQorICBmb3Ig
ZGV0YWlscy4NCistIGlvbW11czogc2hvdWxkIHBvaW50IHRvIHRoZSByZXNwZWN0aXZlIElPTU1V
IGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMNCisgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dA0KKyAgZm9yIGRl
dGFpbHMuDQorDQorRXhhbXBsZToNCisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVr
LG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAg
PCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlw
b3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVk
aWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BP
UlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNE
TUE+Ow0KKwl9Ow0KLS0gDQoyLjE4LjANCg==

