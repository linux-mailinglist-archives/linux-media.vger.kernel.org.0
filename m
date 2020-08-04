Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A73F23B367
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730462AbgHDDmR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:42:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:9557 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730445AbgHDDmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:42:15 -0400
X-UUID: 38a749cf16a74bf5ac1f65d5f5a6e8e9-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sLmbhAn5i/KN5j/D+NiojDjhhrT4fosckciY9L3BBPY=;
        b=Q4cUPfctbJyalSvjbEVL9KVf0IEuNK+uPzGerb9E7Gs1djMWInbuSjk2SwCH+mT+62xMvKKVPYzUILs8K9Kx0BOgJOy8Fkuw8tczwEHWODcgvKbydbbBcu5Tc6IsfYU4N0+QHICsHfJcQ2H4FyRMfwx+0NVeUM3iyDcT3LMk+Us=;
X-UUID: 38a749cf16a74bf5ac1f65d5f5a6e8e9-20200804
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1438428460; Tue, 04 Aug 2020 11:42:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:08 +0800
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
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v11 23/28] media: dt-bindings: Add jpeg enc device tree node document
Date:   Tue, 4 Aug 2020 11:40:57 +0800
Message-ID: <20200804034102.22983-24-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUgZG9jdW1lbnQuDQoNClJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBjaHJvbWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0Bt
ZWRpYXRlay5jb20+DQotLS0NCnYxMTogbm8gY2hhbmdlcw0KLS0tDQogLi4uL2JpbmRpbmdzL21l
ZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQgIHwgMzUgKysrKysrKysrKysrKysrKysrKw0K
IDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29k
ZXIudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi43MzZiZTdjYWQzODUNCi0tLSAvZGV2L251bGwN
CisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1q
cGVnLWVuY29kZXIudHh0DQpAQCAtMCwwICsxLDM1IEBADQorKiBNZWRpYVRlayBKUEVHIEVuY29k
ZXINCisNCitNZWRpYVRlayBKUEVHIEVuY29kZXIgaXMgdGhlIEpQRUcgZW5jb2RlIGhhcmR3YXJl
IHByZXNlbnQgaW4gTWVkaWFUZWsgU29Dcw0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBj
b21wYXRpYmxlIDogIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiDQorICBmb2xsb3dlZCBieSAibWVk
aWF0ZWssbXRrLWpwZ2VuYyINCistIHJlZyA6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUg
SlBFRyBlbmNvZGVyIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mDQorICBtZW1vcnkgbWFwcGVkIHJl
Z2lvbi4NCistIGludGVycnVwdHMgOiBpbnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBpbnRlcnJ1cHQg
Y29udHJvbGxlci4NCistIGNsb2NrczogZGV2aWNlIGNsb2Nrcywgc2VlDQorICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRh
aWxzLg0KKy0gY2xvY2stbmFtZXM6IG11c3QgY29udGFpbiAianBnZW5jIi4gSXQgaXMgdGhlIGNs
b2NrIG9mIEpQRUcgZW5jb2Rlci4NCistIHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0aGUg
cG93ZXIgZG9tYWluLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9w
b3dlci9wb3dlcl9kb21haW4udHh0IGZvciBkZXRhaWxzLg0KKy0gbWVkaWF0ZWssbGFyYjogbXVz
dCBjb250YWluIHRoZSBsb2NhbCBhcmJpdGVycyBpbiB0aGUgY3VycmVudCBTb0NzLCBzZWUNCisg
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVk
aWF0ZWssc21pLWxhcmIudHh0DQorICBmb3IgZGV0YWlscy4NCistIGlvbW11czogc2hvdWxkIHBv
aW50IHRvIHRoZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMNCisg
IGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21l
ZGlhdGVrLGlvbW11LnR4dA0KKyAgZm9yIGRldGFpbHMuDQorDQorRXhhbXBsZToNCisJanBlZ2Vu
YzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1q
cGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgx
NTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBF
X0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNs
b2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAx
X1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9t
bXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11
IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KLS0gDQoyLjE4LjANCg==

