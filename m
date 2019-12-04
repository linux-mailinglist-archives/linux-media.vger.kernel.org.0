Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B022211281D
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 10:45:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfLDJpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 04:45:07 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:9375 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727477AbfLDJpF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 04:45:05 -0500
X-UUID: 528f980957c1488098dbe1f57108914c-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=eI1a1FV+VwSChfULE2XHhJMPkMCeZyf5a8QK8aRHLPE=;
        b=oGxDG09ONCuOLa40lP5ITQc52Zt3DBu7x8aGd7yINQW/JjAa7DDHOJBQGZKTELDqpUmrG8ff9rue4NprWNXdfeJjUpNCLZo8jwRkNAl12g5vT/LFkNrAXsqZfH2He92WJDoY3A5Ux/r/1TXawD/E5HYbaHOpqkklZ/hhNxlc0Ek=;
X-UUID: 528f980957c1488098dbe1f57108914c-20191204
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 427262360; Wed, 04 Dec 2019 17:44:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 17:44:30 +0800
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
Subject: [PATCH v5 2/5] media: dt-bindings: Add jpeg enc device tree node document
Date:   Wed, 4 Dec 2019 17:44:23 +0800
Message-ID: <20191204094424.2562-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204094424.2562-1-xia.jiang@mediatek.com>
References: <20191204094424.2562-1-xia.jiang@mediatek.com>
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
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY1OiBubyBjaGFuZ2VzDQogICAgICAgICAgIA0K
djQ6IG5vIGNoYW5nZXMNCiAgICAgICAgICAgICAgDQp2MzogY2hhbmdlIGNvbXBhdGlibGUgdG8g
U29DIHNwZWNpZmljIGNvbXBhdGlibGUNCiAgICAgICAgICAgICAgDQp2Mjogbm8gY2hhbmdlcw0K
LS0tDQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQgIHwgMzcg
KysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29k
ZXIudHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5mYThkYTY5
OTQ5M2INCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpAQCAtMCwwICsxLDM3IEBADQor
KiBNZWRpYVRlayBKUEVHIEVuY29kZXINCisNCitNZWRpYVRlayBKUEVHIEVuY29kZXIgaXMgdGhl
IEpQRUcgZW5jb2RlIGhhcmR3YXJlIHByZXNlbnQgaW4gTWVkaWFUZWsgU29Dcw0KKw0KK1JlcXVp
cmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlIDogc2hvdWxkIGJlIG9uZSBvZjoNCisgICAg
ICAgICAgICAgICAibWVkaWF0ZWssbXQyNzAxLWpwZ2VuYyINCisgICAgICAgICAgICAgICAuLi4N
CisgICAgICAgICAgICAgICBmb2xsb3dlZCBieSAibWVkaWF0ZWssbXRrLWpwZ2VuYyINCistIHJl
ZyA6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBlbmNvZGVyIHJlZ2lzdGVycyBh
bmQgbGVuZ3RoIG9mDQorICBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4NCistIGludGVycnVwdHMgOiBp
bnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlci4NCistIGNsb2Nrczog
ZGV2aWNlIGNsb2Nrcywgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Y2xvY2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0KKy0gY2xvY2stbmFtZXM6IG11
c3QgY29udGFpbiAianBnZW5jIi4gSXQgaXMgdGhlIGNsb2NrIG9mIEpQRUcgZW5jb2Rlci4NCist
IHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0aGUgcG93ZXIgZG9tYWluLCBzZWUNCisgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0IGZv
ciBkZXRhaWxzLg0KKy0gbWVkaWF0ZWssbGFyYjogbXVzdCBjb250YWluIHRoZSBsb2NhbCBhcmJp
dGVycyBpbiB0aGUgY3VycmVudCBTb0NzLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIudHh0DQorICBm
b3IgZGV0YWlscy4NCistIGlvbW11czogc2hvdWxkIHBvaW50IHRvIHRoZSByZXNwZWN0aXZlIElP
TU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMNCisgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dA0KKyAgZm9y
IGRldGFpbHMuDQorDQorRXhhbXBsZToNCisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQor
CQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlh
dGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3Mg
PSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQor
CQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJ
bWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRV
X1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNf
QlNETUE+Ow0KKwl9Ow0KLS0gDQoyLjE4LjANCg==

