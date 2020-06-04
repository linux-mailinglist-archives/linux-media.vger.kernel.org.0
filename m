Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9161C1EE0BB
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgFDJI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:29 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:15408 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728336AbgFDJI1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:27 -0400
X-UUID: 4440c8ef08b340a8b7cabd92f4721d94-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vkxEcxVbz+KaSwcUkdHQ5ny9Os/VdTrQm9pCD9BhSDg=;
        b=p7/+XN+xMw+Hfie8oXbM2IpSrwEQi7kuvd9c8+z2c9Xu/XLD3pth/6vwJq71ljzy1+ISjPpGK8f1Qw0uwoANJg56kUJbt/fAC02QINHO9rvZIOr3LSpQtQLWvgQtVeFyvrDBj0VeO/RvltDJYpBJEO8s68GSrHUyv9GySkj4b98=;
X-UUID: 4440c8ef08b340a8b7cabd92f4721d94-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 698401104; Thu, 04 Jun 2020 17:08:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:20 +0800
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
Subject: [PATCH RESEND v9 15/18] arm: dts: mt2701: Add jpeg enc device tree node
Date:   Thu, 4 Jun 2020 17:05:50 +0800
Message-ID: <20200604090553.10861-17-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFu
ZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0Kdjk6IGFkZCAibXQyNzAxIiBpbiB0aGUg
dGl0bGUgZGVzY3JpcHRpb24NCi0tLQ0KIGFyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpIHwg
MTMgKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspDQoNCmRp
ZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL210MjcwMS5kdHNpDQppbmRleCAyYzRlYzgyNTQ3ZWUuLjIzNWJhY2MwZTQxOCAxMDA2NDQN
Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210MjcwMS5kdHNpDQorKysgYi9hcmNoL2FybS9ib290
L2R0cy9tdDI3MDEuZHRzaQ0KQEAgLTU2OCw2ICs1NjgsMTkgQEANCiAJCQkgPCZpb21tdSBNVDI3
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

