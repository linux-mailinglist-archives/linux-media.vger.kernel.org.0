Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4401EDE42
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgFDHal (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:30:41 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53968 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728122AbgFDH3h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:37 -0400
X-UUID: 8db6ee764e984023a85d0396cfc31bae-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zxJVs68UWIZdip9NB/UmYLUqsfCLFxh+WP/2CmUsedw=;
        b=IUSEtUuQCEHDB4T151/8JR4QRT2a/0E7crT6qDI4EPjbDre8ukV4LYfIELgMbl7SilVatmncNrqlLOy95prEo6Mh8F3gobqmBJR4wG/UeQ2SJBU03M7sN+Akbtlq2xPr2JYpp23WTkf+qsdL/4vRZw24vTZlByqZfDaeaaH6IqY=;
X-UUID: 8db6ee764e984023a85d0396cfc31bae-20200604
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1317326867; Thu, 04 Jun 2020 15:29:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:29 +0800
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
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v9 14/18] media: dt-bindings: Add jpeg enc device tree node document
Date:   Thu, 4 Jun 2020 15:27:04 +0800
Message-ID: <20200604072708.9468-15-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUgZG9jdW1lbnQuDQoNClJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4
aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2OTogbm8gY2hhbmdlcw0KLS0tDQogLi4uL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5jb2Rlci50eHQgIHwgMzcgKysrKysrKysrKysr
KysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1q
cGVnLWVuY29kZXIudHh0DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVyLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpuZXcg
ZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi5mYThkYTY5OTQ5M2INCi0tLSAv
ZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpAQCAtMCwwICsxLDM3IEBADQorKiBNZWRpYVRlayBK
UEVHIEVuY29kZXINCisNCitNZWRpYVRlayBKUEVHIEVuY29kZXIgaXMgdGhlIEpQRUcgZW5jb2Rl
IGhhcmR3YXJlIHByZXNlbnQgaW4gTWVkaWFUZWsgU29Dcw0KKw0KK1JlcXVpcmVkIHByb3BlcnRp
ZXM6DQorLSBjb21wYXRpYmxlIDogc2hvdWxkIGJlIG9uZSBvZjoNCisgICAgICAgICAgICAgICAi
bWVkaWF0ZWssbXQyNzAxLWpwZ2VuYyINCisgICAgICAgICAgICAgICAuLi4NCisgICAgICAgICAg
ICAgICBmb2xsb3dlZCBieSAibWVkaWF0ZWssbXRrLWpwZ2VuYyINCistIHJlZyA6IHBoeXNpY2Fs
IGJhc2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBlbmNvZGVyIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9m
DQorICBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4NCistIGludGVycnVwdHMgOiBpbnRlcnJ1cHQgbnVt
YmVyIHRvIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlci4NCistIGNsb2NrczogZGV2aWNlIGNsb2Nr
cywgc2VlDQorICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2st
YmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0KKy0gY2xvY2stbmFtZXM6IG11c3QgY29udGFpbiAi
anBnZW5jIi4gSXQgaXMgdGhlIGNsb2NrIG9mIEpQRUcgZW5jb2Rlci4NCistIHBvd2VyLWRvbWFp
bnM6IGEgcGhhbmRsZSB0byB0aGUgcG93ZXIgZG9tYWluLCBzZWUNCisgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0IGZvciBkZXRhaWxzLg0K
Ky0gbWVkaWF0ZWssbGFyYjogbXVzdCBjb250YWluIHRoZSBsb2NhbCBhcmJpdGVycyBpbiB0aGUg
Y3VycmVudCBTb0NzLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIudHh0DQorICBmb3IgZGV0YWlscy4N
CistIGlvbW11czogc2hvdWxkIHBvaW50IHRvIHRoZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdp
dGggbWFzdGVyIHBvcnQgYXMNCisgIGFyZ3VtZW50LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlvbW11LnR4dA0KKyAgZm9yIGRldGFpbHMuDQor
DQorRXhhbXBsZToNCisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdl
bmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0g
PEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMg
Q0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21h
aW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFy
YiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5D
X1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9
Ow0KLS0gDQoyLjE4LjANCg==

