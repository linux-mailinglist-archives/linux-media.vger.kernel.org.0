Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D23E1EE09B
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgFDJIU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:20 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:53028 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728502AbgFDJIS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:18 -0400
X-UUID: cf6f4c84b7f645f180a0b585257749e7-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pwxgK1X1XdIdmyvhCdOXj7GI0xWZ4kTcpeu8OdlT4i0=;
        b=JffgcDqtc2/HBj5fOp3NpBUuSmgrhiYpZXVWFZEoRp7S8mUL7DpZ1zMZELWS4A3LrLb+xHzAIHVuxCGcSrTEaFzqxJtXOoh8hWMeLiF4FKUg+7YMxlWRaUbq3a5RysptDnxLh3YKVhSVY5dU03tQWx1ILC7gR2K4joM4s6AzffM=;
X-UUID: cf6f4c84b7f645f180a0b585257749e7-20200604
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1872286340; Thu, 04 Jun 2020 17:08:14 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:09 +0800
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
Subject: [PATCH RESEND v9 09/18] media: platform: Delete zeroing the reserved fields
Date:   Thu, 4 Jun 2020 17:05:44 +0800
Message-ID: <20200604090553.10861-11-xia.jiang@mediatek.com>
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

RGVsZXRlIHplcm9pbmcgdGhlIHJlc2VydmVkIGZpZWxkcyBiZWNhdXNlIHRoYXQgdGhlIGNvcmUg
YWxyZWFkeQ0KZG9lcyBpdC4NCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdA
bWVkaWF0ZWsuY29tPg0KLS0tDQp2OTogbmV3IHBhdGNoDQotLS0NCiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDUgLS0tLS0NCiAxIGZpbGUgY2hhbmdl
ZCwgNSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IGJiNGViY2U4ODFlZS4uYmQxY2M1ODMyNGM2IDEwMDY0
NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMN
CisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpA
QCAtMTk4LDcgKzE5OCw2IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3Ry
dWN0IHY0bDJfZm9ybWF0ICpmLA0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5q
cGVnOw0KIAlpbnQgaTsNCiANCi0JbWVtc2V0KHBpeF9tcC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihw
aXhfbXAtPnJlc2VydmVkKSk7DQogCXBpeF9tcC0+ZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7DQog
DQogCWlmIChjdHgtPnN0YXRlICE9IE1US19KUEVHX0lOSVQpIHsNCkBAIC0yMTcsNyArMjE2LDYg
QEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3JtYXQg
KmYsDQogCQkJCQkgICAmcGl4X21wLT5oZWlnaHQsIE1US19KUEVHX01JTl9IRUlHSFQsDQogCQkJ
CQkgICBNVEtfSlBFR19NQVhfSEVJR0hULCAwKTsNCiANCi0JCW1lbXNldChwZm10LT5yZXNlcnZl
ZCwgMCwgc2l6ZW9mKHBmbXQtPnJlc2VydmVkKSk7DQogCQlwZm10LT5ieXRlc3BlcmxpbmUgPSAw
Ow0KIAkJLyogU291cmNlIHNpemUgbXVzdCBiZSBhbGlnbmVkIHRvIDEyOCAqLw0KIAkJcGZtdC0+
c2l6ZWltYWdlID0gbXRrX2pwZWdfYWxpZ24ocGZtdC0+c2l6ZWltYWdlLCAxMjgpOw0KQEAgLTIz
Nyw3ICsyMzUsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2
NGwyX2Zvcm1hdCAqZiwNCiAJCXUzMiBzdHJpZGUgPSBwaXhfbXAtPndpZHRoICogZm10LT5oX3Nh
bXBsZVtpXSAvIDQ7DQogCQl1MzIgaCA9IHBpeF9tcC0+aGVpZ2h0ICogZm10LT52X3NhbXBsZVtp
XSAvIDQ7DQogDQotCQltZW1zZXQocGZtdC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihwZm10LT5yZXNl
cnZlZCkpOw0KIAkJcGZtdC0+Ynl0ZXNwZXJsaW5lID0gc3RyaWRlOw0KIAkJcGZtdC0+c2l6ZWlt
YWdlID0gc3RyaWRlICogaDsNCiAJfQ0KQEAgLTI3MCw3ICsyNjcsNiBAQCBzdGF0aWMgaW50IG10
a19qcGVnX2dfZm10X3ZpZF9tcGxhbmUoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQog
DQogCXFfZGF0YSA9IG10a19qcGVnX2dldF9xX2RhdGEoY3R4LCBmLT50eXBlKTsNCiANCi0JbWVt
c2V0KHBpeF9tcC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihwaXhfbXAtPnJlc2VydmVkKSk7DQogCXBp
eF9tcC0+d2lkdGggPSBxX2RhdGEtPnc7DQogCXBpeF9tcC0+aGVpZ2h0ID0gcV9kYXRhLT5oOw0K
IAlwaXhfbXAtPmZpZWxkID0gVjRMMl9GSUVMRF9OT05FOw0KQEAgLTI5NCw3ICsyOTAsNiBAQCBz
dGF0aWMgaW50IG10a19qcGVnX2dfZm10X3ZpZF9tcGxhbmUoc3RydWN0IGZpbGUgKmZpbGUsIHZv
aWQgKnByaXYsDQogDQogCQlwZm10LT5ieXRlc3BlcmxpbmUgPSBxX2RhdGEtPmJ5dGVzcGVybGlu
ZVtpXTsNCiAJCXBmbXQtPnNpemVpbWFnZSA9IHFfZGF0YS0+c2l6ZWltYWdlW2ldOw0KLQkJbWVt
c2V0KHBmbXQtPnJlc2VydmVkLCAwLCBzaXplb2YocGZtdC0+cmVzZXJ2ZWQpKTsNCiANCiAJCXY0
bDJfZGJnKDEsIGRlYnVnLCAmanBlZy0+djRsMl9kZXYsDQogCQkJICJwbGFuZVslZF0gYnBsPSV1
LCBzaXplPSV1XG4iLA0KLS0gDQoyLjE4LjANCg==

