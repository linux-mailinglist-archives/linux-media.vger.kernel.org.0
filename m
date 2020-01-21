Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9551439F0
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 10:55:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbgAUJx7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 04:53:59 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:31746 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728512AbgAUJx6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 04:53:58 -0500
X-UUID: d09fc0e5bef24e4baedfbaada5434dd9-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=cl5ygxJkfRPLgTzRmkuciFKQx6zJIatyNA3y6518NU0=;
        b=NlnBZq8RMUn7B+O30P7w7/mHZCmfRh254Y6j3D0PMY4iBg5KBqcQUSbfoDPtTgxJ2gtlXzmpls4PADodVjTA15/YXM/VELcvWt1hriAqzZJWF5/tlc7f3tIxwdoSj6fTU+FJwguuuUR+lhQIt2kPPsP19IViqbLQlWq/vr4nQhE=;
X-UUID: d09fc0e5bef24e4baedfbaada5434dd9-20200121
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2139584447; Tue, 21 Jan 2020 17:53:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 17:53:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 Jan 2020 17:51:52 +0800
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
Subject: [PATCH v6 2/5] media: dt-bindings: Add jpeg enc device tree node document
Date:   Tue, 21 Jan 2020 17:53:18 +0800
Message-ID: <20200121095320.32258-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200121095320.32258-1-xia.jiang@mediatek.com>
References: <20200121095320.32258-1-xia.jiang@mediatek.com>
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
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY2OiBubyBjaGFuZ2VzDQoNCnY1OiBubyBjaGFu
Z2VzDQogICAgICAgICAgIA0KdjQ6IG5vIGNoYW5nZXMNCiAgICAgICAgICAgICAgDQp2MzogY2hh
bmdlIGNvbXBhdGlibGUgdG8gU29DIHNwZWNpZmljIGNvbXBhdGlibGUNCiAgICAgICAgICAgICAg
DQp2Mjogbm8gY2hhbmdlcw0KLS0tDQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWct
ZW5jb2Rlci50eHQgIHwgMzcgKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQoNCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBl
Zy1lbmNvZGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAw
MDAwMDAwMDAwLi5mYThkYTY5OTQ5M2INCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpA
QCAtMCwwICsxLDM3IEBADQorKiBNZWRpYVRlayBKUEVHIEVuY29kZXINCisNCitNZWRpYVRlayBK
UEVHIEVuY29kZXIgaXMgdGhlIEpQRUcgZW5jb2RlIGhhcmR3YXJlIHByZXNlbnQgaW4gTWVkaWFU
ZWsgU29Dcw0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlIDogc2hvdWxk
IGJlIG9uZSBvZjoNCisgICAgICAgICAgICAgICAibWVkaWF0ZWssbXQyNzAxLWpwZ2VuYyINCisg
ICAgICAgICAgICAgICAuLi4NCisgICAgICAgICAgICAgICBmb2xsb3dlZCBieSAibWVkaWF0ZWss
bXRrLWpwZ2VuYyINCistIHJlZyA6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBl
bmNvZGVyIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mDQorICBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4N
CistIGludGVycnVwdHMgOiBpbnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBpbnRlcnJ1cHQgY29udHJv
bGxlci4NCistIGNsb2NrczogZGV2aWNlIGNsb2Nrcywgc2VlDQorICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0K
Ky0gY2xvY2stbmFtZXM6IG11c3QgY29udGFpbiAianBnZW5jIi4gSXQgaXMgdGhlIGNsb2NrIG9m
IEpQRUcgZW5jb2Rlci4NCistIHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0aGUgcG93ZXIg
ZG9tYWluLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9w
b3dlcl9kb21haW4udHh0IGZvciBkZXRhaWxzLg0KKy0gbWVkaWF0ZWssbGFyYjogbXVzdCBjb250
YWluIHRoZSBsb2NhbCBhcmJpdGVycyBpbiB0aGUgY3VycmVudCBTb0NzLCBzZWUNCisgIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWss
c21pLWxhcmIudHh0DQorICBmb3IgZGV0YWlscy4NCistIGlvbW11czogc2hvdWxkIHBvaW50IHRv
IHRoZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMNCisgIGFyZ3Vt
ZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVr
LGlvbW11LnR4dA0KKyAgZm9yIGRldGFpbHMuDQorDQorRXhhbXBsZToNCisJanBlZ2VuYzoganBl
Z2VuY0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMi
LA0KKwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAw
MCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVM
X0xPVz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5h
bWVzID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VS
X0RPTUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0g
PCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcw
MV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KLS0gDQoyLjE4LjANCg==

