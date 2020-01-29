Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1076414C74D
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 09:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726237AbgA2IRS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 03:17:18 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:55253 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726178AbgA2IRS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 03:17:18 -0500
X-UUID: 645842751a3d4538bbf06b99e476a495-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3wcLgna0UQ6Pmik49xEVVcy56wDdAIj1SlCJHvZEet0=;
        b=QUGVIZbMTf5UnlVLL5xlzXz+OZIIc6a6BqD5H4ePY2JjGQ6tcHR7YxpeprLQrA7tJ0daB8m9k4Ikte69Sb5aSHyaMM5dRj1wyq7fugwr3fRapIRZ4NzkUaJk/lEoqSYd1++yKCEqJlmFdqmJe6HJ22aWV885bXFAiTdEXTrJPa8=;
X-UUID: 645842751a3d4538bbf06b99e476a495-20200129
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1633652493; Wed, 29 Jan 2020 16:17:13 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 16:16:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 Jan 2020 16:17:18 +0800
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
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V5 3/3] dts: arm64: mt8183: Add sensor interface nodes
Date:   Wed, 29 Jan 2020 16:16:50 +0800
Message-ID: <20200129081650.8027-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200129081650.8027-1-louis.kuo@mediatek.com>
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAxMiArKysrKysrKysrKysNCiAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDY2YWFhMDdmNmNlYy4uYWU4OTM4NmFmZTU2IDEwMDY0
NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KQEAgLTUwNSw1ICs1MDUs
MTcgQEANCiAJCQlyZWcgPSA8MCAweDFhMDAwMDAwIDAgMHgxMDAwPjsNCiAJCQkjY2xvY2stY2Vs
bHMgPSA8MT47DQogCQl9Ow0KKwkJc2VuaW5mOiBzZW5pbmZAMWEwNDAwMDAgew0KKwkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXNlbmluZiI7DQorCQkJcmVnID0gPDAgMHgxYTA0MDAw
MCAwIDB4ODAwMD4sDQorCQkJICAgICAgPDAgMHgxMWM4MDAwMCAwIDB4NjAwMD47DQorCQkJcmVn
LW5hbWVzID0gImJhc2UiLCAicngiOw0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAyNTEgSVJR
X1RZUEVfTEVWRUxfTE9XPjsNCisJCQlwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTgzX1BP
V0VSX0RPTUFJTl9DQU0+Ow0KKwkJCWNsb2NrcyA9IDwmY2Ftc3lzIENMS19DQU1fU0VOSU5GPiwN
CisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9NVVhfU0VOSU5GPjsNCisJCQljbG9jay1uYW1lcyA9
ICJDTEtfQ0FNX1NFTklORiIsICJDTEtfVE9QX01VWF9TRU5JTkYiOw0KKwkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7DQorCQl9Ow0KIAl9Ow0KIH07DQotLSANCjIuMTguMA0K

