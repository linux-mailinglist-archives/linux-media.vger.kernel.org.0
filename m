Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF7F218523
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 12:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728544AbgGHKke (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 06:40:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63218 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728489AbgGHKke (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 06:40:34 -0400
X-UUID: d4d48a75af2844138e8a709b51c4452a-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Dv3GB0am1WFCJf6ZN7KVrUkgtNaBLQyeWNE0Wp3tHxg=;
        b=iBEfLFTwFV4hSScrfKkKhK/7yavjYwFKmAUDf2sz0Bt7s/pI4lDRNOBluqbM/KWNamRu/sWeGpn6UHK+vElray7LLMVQ4olYZrXlqdH3MgN3gsEBJ1EztOAs158sTSdFtT6z8Jfiw1SsLI9Zo7PSRaRIs8ZjqfbZbv6n36GhZ6c=;
X-UUID: d4d48a75af2844138e8a709b51c4452a-20200708
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2011330478; Wed, 08 Jul 2020 18:40:30 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:40:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jul 2020 18:40:27 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>
Subject: [RFC PATCH V7 3/3] dts: arm64: mt8183: Add sensor interface nodes
Date:   Wed, 8 Jul 2020 18:40:23 +0800
Message-ID: <20200708104023.3225-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200708104023.3225-1-louis.kuo@mediatek.com>
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 1E7307CC0B067F93EFFF6B5343014E9F5BDD12D783DB5CAA4B3CDE50008950C32000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIG5vZGVzIGZvciBNZWRpYXRlaydzIHNlbnNvciBpbnRlcmZhY2UgZGV2aWNlLiBTZW5zb3Ig
aW50ZXJmYWNlIG1vZHVsZQ0KZW1iZWRkZWQgaW4gTWVkaWF0ZWsgU09Dcywgd29ya3MgYXMgYSBI
VyBjYW1lcmEgaW50ZXJmYWNlIGNvbnRyb2xsZXINCmludGVuZGVkIGZvciBpbWFnZSBhbmQgZGF0
YSB0cmFuc21pc3Npb24gYmV0d2VlbiBjYW1lcmFzIGFuZCBob3N0IGRldmljZXMuDQoNClNpZ25l
ZC1vZmYtYnk6IExvdWlzIEt1byA8bG91aXMua3VvQG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDdiNzgxZWI3ZWRkNy4uZDQ4N2U1
Mzk3MDVjIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMu
ZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KQEAg
LTc2Miw1ICs3NjIsMzEgQEANCiAJCQlyZWcgPSA8MCAweDFhMDAwMDAwIDAgMHgxMDAwPjsNCiAJ
CQkjY2xvY2stY2VsbHMgPSA8MT47DQogCQl9Ow0KKw0KKwkJc2VuaW5mOiBzZW5pbmZAMWEwNDAw
MDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXNlbmluZiI7DQorCQkJcmVn
ID0gPDAgMHgxYTA0MDAwMCAwIDB4ODAwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDI1
MSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KKwkJCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDgx
ODNfUE9XRVJfRE9NQUlOX0NBTT47DQorCQkJY2xvY2tzID0gPCZjYW1zeXMgQ0xLX0NBTV9TRU5J
TkY+LA0KKwkJCQkgPCZ0b3Bja2dlbiBDTEtfVE9QX01VWF9TRU5JTkY+Ow0KKwkJCWNsb2NrLW5h
bWVzID0gImNhbV9zZW5pbmYiLCAidG9wX211eF9zZW5pbmYiOw0KKwkJCXBoeXMgPSA8Jm1pcGlf
ZHBoeSAwPjsNCisJCQlwaHktbmFtZXMgPSAic2VuaW5mIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KKw0KKwkJCXBvcnRzIHsNCisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47DQorCQkJCSNz
aXplLWNlbGxzID0gPDA+Ow0KKw0KKwkJCQlwb3J0QDQgew0KKwkJCQkJcmVnID0gPDQ+Ow0KKw0K
KwkJCQkJc2VuaW5mX2NhbWlzcF9lbmRwb2ludDogZW5kcG9pbnQgew0KKwkJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmY2FtaXNwX2VuZHBvaW50PjsNCisJCQkJCX07DQorCQkJCX07DQorCQkJfTsN
CisJCX07DQogCX07DQogfTsNCi0tDQoyLjE4LjANCg==

