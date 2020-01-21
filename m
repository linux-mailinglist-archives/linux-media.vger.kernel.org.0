Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4EA1439F5
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 10:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgAUJyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 04:54:06 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:6735 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728512AbgAUJyG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 04:54:06 -0500
X-UUID: 78b9e79780804a37993d71434ce5f803-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8IcL7wBmEolfM1aqC7lqWVrzqXRtoYlmHotbd9PKXF4=;
        b=BGAuchR2Kq83fmsRvz+7XFCZcs2hisNLryyvcO3wvIWDmzZEOkjunuYYFmSMsWWAe5IKz67nEkz0gfvQ5rnVvOPqiX3LvcACoTDPo46aChsxWmbJYiggVYAQ/S0D8TBaYlDRK1MUdb9QlbZWWgr5G0pUmcH9rLqwehy5fwH+gMo=;
X-UUID: 78b9e79780804a37993d71434ce5f803-20200121
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2052156044; Tue, 21 Jan 2020 17:53:59 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 17:53:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 Jan 2020 17:51:56 +0800
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
Subject: [PATCH v6 3/5] arm: dts: Add jpeg enc device tree node
Date:   Tue, 21 Jan 2020 17:53:19 +0800
Message-ID: <20200121095320.32258-4-xia.jiang@mediatek.com>
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

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUNCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5n
IDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2Njogbm8gY2hhbmdlcw0KDQp2NTogbm8g
Y2hhbmdlcw0KICAgICAgICAgICANCnY0OiBubyBjaGFuZ2VzDQogICAgICAgICAgICAgIA0KdjM6
IGNoYW5nZSBjb21wYXRpYmxlIHRvIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlDQogICAgICAgICAg
ICAgIA0KdjI6IG5vIGNoYW5nZXMNCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNp
IHwgMTMgKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoN
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL210MjcwMS5kdHNpDQppbmRleCA1MWUxMzA1YzY0NzEuLmYyZjkyMTUwYjNmYiAxMDA2
NDQNCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpDQorKysgYi9hcmNoL2FybS9i
b290L2R0cy9tdDI3MDEuZHRzaQ0KQEAgLTU2OSw2ICs1NjksMTkgQEANCiAJCQkgPCZpb21tdSBN
VDI3MDFfTTRVX1BPUlRfSlBHREVDX0JTRE1BPjsNCiAJfTsNCiANCisJanBlZ2VuYzoganBlZ2Vu
Y0AxNTAwYTAwMCB7DQorCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10MjcwMS1qcGdlbmMiLA0K
KwkJCSAgICAgIm1lZGlhdGVrLG10ay1qcGdlbmMiOw0KKwkJcmVnID0gPDAgMHgxNTAwYTAwMCAw
IDB4MTAwMD47DQorCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTQxIElSUV9UWVBFX0xFVkVMX0xP
Vz47DQorCQljbG9ja3MgPSAgPCZpbWdzeXMgQ0xLX0lNR19WRU5DPjsNCisJCWNsb2NrLW5hbWVz
ID0gImpwZ2VuYyI7DQorCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQyNzAxX1BPV0VSX0RP
TUFJTl9JU1A+Ow0KKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjI+Ow0KKwkJaW9tbXVzID0gPCZp
b21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX1JETUE+LA0KKwkJCSA8JmlvbW11IE1UMjcwMV9N
NFVfUE9SVF9KUEdFTkNfQlNETUE+Ow0KKwl9Ow0KKw0KIAl2ZGVjc3lzOiBzeXNjb25AMTYwMDAw
MDAgew0KIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtdmRlY3N5cyIsICJzeXNjb24i
Ow0KIAkJcmVnID0gPDAgMHgxNjAwMDAwMCAwIDB4MTAwMD47DQotLSANCjIuMTguMA0K

