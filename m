Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B8419D409
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403863AbgDCJlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:41:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63318 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403846AbgDCJlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:41:13 -0400
X-UUID: bd4417ea673b495fafbfc6319c4c9212-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bUhGrLapqpGG5TNnQ19oiY23ELwVrSpG9+CqRSWV9fQ=;
        b=a82BehKbOIgOfhGRaxuJi4RHoW9UG0wjP7gvIxsuyx0P+VXAonMK+nrc+JVhTUAwzDIT2T7rZh0lXM8iX3eq0QkUEcHdNUpnDoR4gJW6LuNUhkLx7mhMpatmLU6unlFQ8YX4H5vhYWv5k9EnJsF6x3OOtFg5h5VTbjfIBMg0JH0=;
X-UUID: bd4417ea673b495fafbfc6319c4c9212-20200403
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 86479516; Fri, 03 Apr 2020 17:41:10 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:44 +0800
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
Subject: [PATCH v8 11/14] media: dt-bindings: Add jpeg enc device tree node document
Date:   Fri, 3 Apr 2020 17:40:30 +0800
Message-ID: <20200403094033.8288-12-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
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
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY4OiBubyBjaGFuZ2VzDQoNCnY3OiBubyBjaGFu
Z2VzDQoNCnY2OiBubyBjaGFuZ2VzDQoNCnY1OiBubyBjaGFuZ2VzDQoNCnY0OiBubyBjaGFuZ2Vz
DQoNCnYzOiBjaGFuZ2UgY29tcGF0aWJsZSB0byBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZQ0KDQp2
Mjogbm8gY2hhbmdlcw0KLS0tDQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5j
b2Rlci50eHQgIHwgMzcgKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBp
bnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQoNCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1l
bmNvZGVyLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRp
YXRlay1qcGVnLWVuY29kZXIudHh0DQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAw
MDAwMDAwLi5mYThkYTY5OTQ5M2INCi0tLSAvZGV2L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1qcGVnLWVuY29kZXIudHh0DQpAQCAt
MCwwICsxLDM3IEBADQorKiBNZWRpYVRlayBKUEVHIEVuY29kZXINCisNCitNZWRpYVRlayBKUEVH
IEVuY29kZXIgaXMgdGhlIEpQRUcgZW5jb2RlIGhhcmR3YXJlIHByZXNlbnQgaW4gTWVkaWFUZWsg
U29Dcw0KKw0KK1JlcXVpcmVkIHByb3BlcnRpZXM6DQorLSBjb21wYXRpYmxlIDogc2hvdWxkIGJl
IG9uZSBvZjoNCisgICAgICAgICAgICAgICAibWVkaWF0ZWssbXQyNzAxLWpwZ2VuYyINCisgICAg
ICAgICAgICAgICAuLi4NCisgICAgICAgICAgICAgICBmb2xsb3dlZCBieSAibWVkaWF0ZWssbXRr
LWpwZ2VuYyINCistIHJlZyA6IHBoeXNpY2FsIGJhc2UgYWRkcmVzcyBvZiB0aGUgSlBFRyBlbmNv
ZGVyIHJlZ2lzdGVycyBhbmQgbGVuZ3RoIG9mDQorICBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4NCist
IGludGVycnVwdHMgOiBpbnRlcnJ1cHQgbnVtYmVyIHRvIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxl
ci4NCistIGNsb2NrczogZGV2aWNlIGNsb2Nrcywgc2VlDQorICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svY2xvY2stYmluZGluZ3MudHh0IGZvciBkZXRhaWxzLg0KKy0g
Y2xvY2stbmFtZXM6IG11c3QgY29udGFpbiAianBnZW5jIi4gSXQgaXMgdGhlIGNsb2NrIG9mIEpQ
RUcgZW5jb2Rlci4NCistIHBvd2VyLWRvbWFpbnM6IGEgcGhhbmRsZSB0byB0aGUgcG93ZXIgZG9t
YWluLCBzZWUNCisgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dl
cl9kb21haW4udHh0IGZvciBkZXRhaWxzLg0KKy0gbWVkaWF0ZWssbGFyYjogbXVzdCBjb250YWlu
IHRoZSBsb2NhbCBhcmJpdGVycyBpbiB0aGUgY3VycmVudCBTb0NzLCBzZWUNCisgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvbWVkaWF0ZWssc21p
LWxhcmIudHh0DQorICBmb3IgZGV0YWlscy4NCistIGlvbW11czogc2hvdWxkIHBvaW50IHRvIHRo
ZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdpdGggbWFzdGVyIHBvcnQgYXMNCisgIGFyZ3VtZW50
LCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlv
bW11LnR4dA0KKyAgZm9yIGRldGFpbHMuDQorDQorRXhhbXBsZToNCisJanBlZ2VuYzoganBlZ2Vu
Y0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0K
KwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAw
IDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xP
Vz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVz
ID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RP
TUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZp
b21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9N
NFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KLS0gDQoyLjE4LjANCg==

