Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00B5177615
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 13:36:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729369AbgCCMfQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 07:35:16 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:35625 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729377AbgCCMfL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 07:35:11 -0500
X-UUID: 49ee4d14a20e422db4a29f51573718a2-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g+BhM16xtThUyup6kZYT72Zj4L9n3+STeBC0E9yCktg=;
        b=hKfASah/EkVG7BlsNuV+Do6HK1e4Mil5mMkVMVIJRrXzaOpXRBvxI20oVzB9uDdS5fnY6ry/Gq52Ki7wQJBrz0/OrhIudhJVXeYA23Sz6Ipov4Cpl3EwBbG1Avn8Mq8YuZPAulBI1pJM1gxkb+FvG1Un8CZLSfv+k/wdAo0Dl6A=;
X-UUID: 49ee4d14a20e422db4a29f51573718a2-20200303
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1900885740; Tue, 03 Mar 2020 20:35:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:45 +0800
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
Subject: [PATCH v7 09/11] arm: dts: Add jpeg enc device tree node
Date:   Tue, 3 Mar 2020 20:34:44 +0800
Message-ID: <20200303123446.20095-10-xia.jiang@mediatek.com>
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

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUNCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5n
IDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2Nzogbm8gY2hhbmdlcw0KDQp2Njogbm8g
Y2hhbmdlcw0KDQp2NTogbm8gY2hhbmdlcw0KDQp2NDogbm8gY2hhbmdlcw0KDQp2MzogY2hhbmdl
IGNvbXBhdGlibGUgdG8gU29DIHNwZWNpZmljIGNvbXBhdGlibGUNCg0KdjI6IG5vIGNoYW5nZXMN
Ci0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIHwgMTMgKysrKysrKysrKysrKw0K
IDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpDQpp
bmRleCA1MWUxMzA1YzY0NzEuLmYyZjkyMTUwYjNmYiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL210MjcwMS5kdHNpDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQ0K
QEAgLTU2OSw2ICs1NjksMTkgQEANCiAJCQkgPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHREVD
X0JTRE1BPjsNCiAJfTsNCiANCisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQljb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVrLG10
ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAgPCZp
bWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlwb3dl
ci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVkaWF0
ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRf
SlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+
Ow0KKwl9Ow0KKw0KIAl2ZGVjc3lzOiBzeXNjb25AMTYwMDAwMDAgew0KIAkJY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDI3MDEtdmRlY3N5cyIsICJzeXNjb24iOw0KIAkJcmVnID0gPDAgMHgxNjAw
MDAwMCAwIDB4MTAwMD47DQotLSANCjIuMTguMA0K

