Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C41219D3FA
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403815AbgDCJk5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:57 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:39845 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403794AbgDCJk4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:56 -0400
X-UUID: 0f27bcc056f341068cfa5e2a7c24ae41-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vO4wXhYXcSep7KxHBBCGWP+a7KpWpW4JjdTA/LnljvQ=;
        b=KF8PgNrVTgp8SIpV3AAgyeR8e4Pdkz59DpIxQnq664erbpwgKhU0Wg1Y2HxfSahN6a3ATeVgBwfVGi6B5DC6Yhj2zFFthJgAR0FWgSG8UhfkRDQSUDoalFyBRjpITYKSmQQEMZyXr9gQrzy1PETKBzqYKtDZPGbq2zVRtcCAuEg=;
X-UUID: 0f27bcc056f341068cfa5e2a7c24ae41-20200403
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1773045195; Fri, 03 Apr 2020 17:40:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:45 +0800
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
Subject: [PATCH v8 12/14] arm: dts: Add jpeg enc device tree node
Date:   Fri, 3 Apr 2020 17:40:31 +0800
Message-ID: <20200403094033.8288-13-xia.jiang@mediatek.com>
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

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUNCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5n
IDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2ODogbm8gY2hhbmdlcw0KDQp2Nzogbm8g
Y2hhbmdlcw0KDQp2Njogbm8gY2hhbmdlcw0KDQp2NTogbm8gY2hhbmdlcw0KDQp2NDogbm8gY2hh
bmdlcw0KDQp2MzogY2hhbmdlIGNvbXBhdGlibGUgdG8gU29DIHNwZWNpZmljIGNvbXBhdGlibGUN
Cg0KdjI6IG5vIGNoYW5nZXMNCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIHwg
MTMgKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL210MjcwMS5kdHNpDQppbmRleCA1MWUxMzA1YzY0NzEuLmYyZjkyMTUwYjNmYiAxMDA2NDQN
Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpDQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9tdDI3MDEuZHRzaQ0KQEAgLTU2OSw2ICs1NjksMTkgQEANCiAJCQkgPCZpb21tdSBNVDI3
MDFfTTRVX1BPUlRfSlBHREVDX0JTRE1BPjsNCiAJfTsNCiANCisJanBlZ2VuYzoganBlZ2VuY0Ax
NTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJ
CSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4
MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47
DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0g
ImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJ
Tl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21t
dSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVf
UE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KKw0KIAl2ZGVjc3lzOiBzeXNjb25AMTYwMDAwMDAg
ew0KIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtdmRlY3N5cyIsICJzeXNjb24iOw0K
IAkJcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAwMD47DQotLSANCjIuMTguMA0K

