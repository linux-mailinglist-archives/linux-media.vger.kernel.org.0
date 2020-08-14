Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE571244583
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgHNHOZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:14:25 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22567 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726911AbgHNHNj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:39 -0400
X-UUID: efbe94de2af944eda1e551b8c95c4e46-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f00mdDsEBJ2UDYYiWju5ZciSTIy4/u2D9vFgrcV3Wb4=;
        b=Pir3NYrP84tN/Roq1Za9SGTARdGkUZyvvcbd07j6zfMx03/8AJGG28/8BCoagCkvs+yyxYZliSdwiiUXg9nEQ8ki7otdFOhcXm1+79mhvILHw9ZpdRtvv+xArhcBXdsbWN8Bnk+vU0KWDgvJ8apiS4SAomvnIND39FsbHdOmoYk=;
X-UUID: efbe94de2af944eda1e551b8c95c4e46-20200814
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 449654027; Fri, 14 Aug 2020 15:13:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:32 +0800
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
Subject: [PATCH v12 25/29] arm: dts: mt2701: Add jpeg enc device tree node
Date:   Fri, 14 Aug 2020 15:11:58 +0800
Message-ID: <20200814071202.25067-27-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUuDQoNClJldmlld2VkLWJ5OiBUb21hc3ogRmln
YSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlh
bmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTI6IG5vIGNoYW5nZXMNCi0tLQ0KIGFyY2gvYXJtL2Jv
b3QvZHRzL210MjcwMS5kdHNpIHwgMTMgKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEu
ZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpDQppbmRleCA4ZDQzYTUwMmFhZGEu
LjFjMWMyMTMyMjM0ZiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNp
DQorKysgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQ0KQEAgLTU2OCw2ICs1NjgsMTkg
QEANCiAJCQkgPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHREVDX0JTRE1BPjsNCiAJfTsNCiAN
CisJanBlZ2VuYzoganBlZ2VuY0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10MjcwMS1qcGdlbmMiLA0KKwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVn
ID0gPDAgMHgxNTAwYTAwMCAwIDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQx
IElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5D
PjsNCisJCWNsb2NrLW5hbWVzID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3Bz
eXMgTVQyNzAxX1BPV0VSX0RPTUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+
Ow0KKwkJaW9tbXVzID0gPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJ
CSA8JmlvbW11IE1UMjcwMV9NNFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KKw0KIAl2ZGVj
c3lzOiBzeXNjb25AMTYwMDAwMDAgew0KIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEt
dmRlY3N5cyIsICJzeXNjb24iOw0KIAkJcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAwMD47DQot
LSANCjIuMTguMA0K

