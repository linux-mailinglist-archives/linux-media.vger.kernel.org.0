Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F502112823
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 10:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbfLDJpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 04:45:18 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:55255 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725971AbfLDJpR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 04:45:17 -0500
X-UUID: a321e9e2fab7412dbbc3b1a485e35b14-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=4nfCPTZKOVZLs81B59K82pq8ycGrCT2UUcNwUWfticE=;
        b=nh/FB7eoDxiiIs6/n2xhvzkZRhhYg69i0rhBIeYegQnI5WhRlFuxVTMhcDxLVqj/h9ex8EAMW8frumk+DhAdBia45SFeSVetdVzdPLK4j6ZB5DRESrlbxkNFfejzmXTHSMa5npuItz/9D1l7iG5vh3UQn2VNal88zmQ6OilpPLI=;
X-UUID: a321e9e2fab7412dbbc3b1a485e35b14-20191204
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 403269532; Wed, 04 Dec 2019 17:45:11 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 17:44:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 17:44:43 +0800
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
Subject: [PATCH v5 3/5] arm: dts: Add jpeg enc device tree node
Date:   Wed, 4 Dec 2019 17:44:25 +0800
Message-ID: <20191204094424.2562-4-xia.jiang@mediatek.com>
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

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUNCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5n
IDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2NTogbm8gY2hhbmdlcw0KICAgICAgICAg
ICANCnY0OiBubyBjaGFuZ2VzDQogICAgICAgICAgICAgIA0KdjM6IGNoYW5nZSBjb21wYXRpYmxl
IHRvIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlDQogICAgICAgICAgICAgIA0KdjI6IG5vIGNoYW5n
ZXMNCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIHwgMTMgKysrKysrKysrKysr
Kw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNp
DQppbmRleCA1MWUxMzA1YzY0NzEuLmYyZjkyMTUwYjNmYiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL210MjcwMS5kdHNpDQorKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRz
aQ0KQEAgLTU2OSw2ICs1NjksMTkgQEANCiAJCQkgPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBH
REVDX0JTRE1BPjsNCiAJfTsNCiANCisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQlj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVr
LG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRl
cnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAg
PCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlw
b3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVk
aWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BP
UlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNE
TUE+Ow0KKwl9Ow0KKw0KIAl2ZGVjc3lzOiBzeXNjb25AMTYwMDAwMDAgew0KIAkJY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDI3MDEtdmRlY3N5cyIsICJzeXNjb24iOw0KIAkJcmVnID0gPDAgMHgx
NjAwMDAwMCAwIDB4MTAwMD47DQotLSANCjIuMTguMA0K

