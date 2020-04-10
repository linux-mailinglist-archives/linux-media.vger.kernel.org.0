Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069491A42E2
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 09:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDJHRo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 03:17:44 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:55079 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726650AbgDJHRo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 03:17:44 -0400
X-UUID: f31927d3540146769e684233bfe988e4-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ygWe+eLtAFpl7pbb42yoKAd2QeY0+GuA6Di3Dh7DXzY=;
        b=HCaRMZW4ivGsHsJ1BJ+bY+/A8A2Nb72V8QzlxhUuMredEpdQOg5hrcwcBFhmPPoTnZLFuF579QEHykwT73qfn6++1trN7FG7cFoD9+uZ6ZIwWkV7jFT1NtNlHlOc/c3waZ6FmSApCwObVqfVW6w4MXGHJv2IAZVaSqbvdSfbybc=;
X-UUID: f31927d3540146769e684233bfe988e4-20200410
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1426561054; Fri, 10 Apr 2020 15:17:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:17:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Apr 2020 15:17:31 +0800
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
Subject: [RFC PATCH V6 3/3] dts: arm64: mt8183: Add sensor interface nodes
Date:   Fri, 10 Apr 2020 15:17:23 +0800
Message-ID: <20200410071723.19720-4-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200410071723.19720-1-louis.kuo@mediatek.com>
References: <20200410071723.19720-1-louis.kuo@mediatek.com>
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
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kNCmluZGV4IDQzM2M2MmVmYWIyZC4uNWM3YmVk
NWE2ZjMyIDEwMDY0NA0KLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMu
ZHRzaQ0KKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KQEAg
LTcxNSw1ICs3MTUsMzAgQEANCiAJCQlyZWcgPSA8MCAweDFhMDAwMDAwIDAgMHgxMDAwPjsNCiAJ
CQkjY2xvY2stY2VsbHMgPSA8MT47DQogCQl9Ow0KKwkJc2VuaW5mOiBzZW5pbmZAMWEwNDAwMDAg
ew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLXNlbmluZiI7DQorCQkJcmVnID0g
PDAgMHgxYTA0MDAwMCAwIDB4ODAwMD4sDQorCQkJICAgICAgPDAgMHgxMWM4MDAwMCAwIDB4NjAw
MD47DQorCQkJcmVnLW5hbWVzID0gImJhc2UiLCAicngiOw0KKwkJCWludGVycnVwdHMgPSA8R0lD
X1NQSSAyNTEgSVJRX1RZUEVfTEVWRUxfTE9XPjsNCisJCQlwb3dlci1kb21haW5zID0gPCZzY3Bz
eXMgTVQ4MTgzX1BPV0VSX0RPTUFJTl9DQU0+Ow0KKwkJCWNsb2NrcyA9IDwmY2Ftc3lzIENMS19D
QU1fU0VOSU5GPiwNCisJCQkJIDwmdG9wY2tnZW4gQ0xLX1RPUF9NVVhfU0VOSU5GPjsNCisJCQlj
bG9jay1uYW1lcyA9ICJjbGtfY2FtX3NlbmluZiIsICJjbGtfdG9wX211eF9zZW5pbmYiOw0KKwkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7DQorDQorCQkJcG9ydHMgew0KKwkJCQkjYWRkcmVzcy1jZWxs
cyA9IDwxPjsNCisJCQkJI3NpemUtY2VsbHMgPSA8MD47DQorDQorCQkJCXBvcnRANCB7DQorCQkJ
CQlyZWcgPSA8ND47DQorDQorCQkJCQlzZW5pbmZfY2FtaXNwX2VuZHBvaW50OiBlbmRwb2ludCB7
DQorCQkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZjYW1pc3BfZW5kcG9pbnQ+Ow0KKwkJCQkJfTsN
CisJCQkJfTsNCisJCQl9Ow0KKwkJfTsNCiAJfTsNCiB9Ow0KLS0gDQoyLjE4LjANCg==

