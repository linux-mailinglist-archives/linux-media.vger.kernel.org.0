Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D84F23B385
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729754AbgHDDmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:42:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46439 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729743AbgHDDl7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:41:59 -0400
X-UUID: 9a8a06eeb0644217901e29506a7dad39-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=O/rBzXXJQXA+kYXJJy3GM1RnwLYS4x1vKamsFXK0ChY=;
        b=chT1J4UOUhzGOKgTw+XwbzBcl9E/UH7ZuvdFUeQ4Y7Va2gA/57XDQwFSpwYuDhzH2jh8arXpe14Ms1rop4T337iO/hH1fZsj4wD1szHCcF7j+IESlLPeAgfGzjfVS+EtFIIIqORYO2RTDbtQMor8NtnuunuRh7IVvpeXu2ZHWZU=;
X-UUID: 9a8a06eeb0644217901e29506a7dad39-20200804
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1552596434; Tue, 04 Aug 2020 11:41:55 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:52 +0800
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
Subject: [PATCH v11 10/28] media: platform: Delete zeroing the reserved fields
Date:   Tue, 4 Aug 2020 11:40:44 +0800
Message-ID: <20200804034102.22983-11-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVsZXRlIHplcm9pbmcgdGhlIHJlc2VydmVkIGZpZWxkcyBiZWNhdXNlIHRoYXQgdGhlIGNvcmUg
YWxyZWFkeQ0KZG9lcyBpdC4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJv
bWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5j
b20+DQotLS0NCnYxMTogbm8gY2hhbmdlcw0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCA1IC0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfY29yZS5jDQppbmRleCBmZmI0ODZlNTM3YjYuLjAxNTNkNTdhZjQ2NiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTE5OCw3
ICsxOTgsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwy
X2Zvcm1hdCAqZiwNCiAJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGN0eC0+anBlZzsNCiAJ
aW50IGk7DQogDQotCW1lbXNldChwaXhfbXAtPnJlc2VydmVkLCAwLCBzaXplb2YocGl4X21wLT5y
ZXNlcnZlZCkpOw0KIAlwaXhfbXAtPmZpZWxkID0gVjRMMl9GSUVMRF9OT05FOw0KIA0KIAlpZiAo
Y3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklUKSB7DQpAQCAtMjE3LDcgKzIxNiw2IEBAIHN0YXRp
YyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KIAkJ
CQkJICAgJnBpeF9tcC0+aGVpZ2h0LCBNVEtfSlBFR19NSU5fSEVJR0hULA0KIAkJCQkJICAgTVRL
X0pQRUdfTUFYX0hFSUdIVCwgMCk7DQogDQotCQltZW1zZXQocGZtdC0+cmVzZXJ2ZWQsIDAsIHNp
emVvZihwZm10LT5yZXNlcnZlZCkpOw0KIAkJcGZtdC0+Ynl0ZXNwZXJsaW5lID0gMDsNCiAJCS8q
IFNvdXJjZSBzaXplIG11c3QgYmUgYWxpZ25lZCB0byAxMjggKi8NCiAJCXBmbXQtPnNpemVpbWFn
ZSA9IG10a19qcGVnX2FsaWduKHBmbXQtPnNpemVpbWFnZSwgMTI4KTsNCkBAIC0yMzcsNyArMjM1
LDYgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3Jt
YXQgKmYsDQogCQl1MzIgc3RyaWRlID0gcGl4X21wLT53aWR0aCAqIGZtdC0+aF9zYW1wbGVbaV0g
LyA0Ow0KIAkJdTMyIGggPSBwaXhfbXAtPmhlaWdodCAqIGZtdC0+dl9zYW1wbGVbaV0gLyA0Ow0K
IA0KLQkJbWVtc2V0KHBmbXQtPnJlc2VydmVkLCAwLCBzaXplb2YocGZtdC0+cmVzZXJ2ZWQpKTsN
CiAJCXBmbXQtPmJ5dGVzcGVybGluZSA9IHN0cmlkZTsNCiAJCXBmbXQtPnNpemVpbWFnZSA9IHN0
cmlkZSAqIGg7DQogCX0NCkBAIC0yNzAsNyArMjY3LDYgQEAgc3RhdGljIGludCBtdGtfanBlZ19n
X2ZtdF92aWRfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KIA0KIAlxX2Rh
dGEgPSBtdGtfanBlZ19nZXRfcV9kYXRhKGN0eCwgZi0+dHlwZSk7DQogDQotCW1lbXNldChwaXhf
bXAtPnJlc2VydmVkLCAwLCBzaXplb2YocGl4X21wLT5yZXNlcnZlZCkpOw0KIAlwaXhfbXAtPndp
ZHRoID0gcV9kYXRhLT53Ow0KIAlwaXhfbXAtPmhlaWdodCA9IHFfZGF0YS0+aDsNCiAJcGl4X21w
LT5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsNCkBAIC0yOTQsNyArMjkwLDYgQEAgc3RhdGljIGlu
dCBtdGtfanBlZ19nX2ZtdF92aWRfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2
LA0KIA0KIAkJcGZtdC0+Ynl0ZXNwZXJsaW5lID0gcV9kYXRhLT5ieXRlc3BlcmxpbmVbaV07DQog
CQlwZm10LT5zaXplaW1hZ2UgPSBxX2RhdGEtPnNpemVpbWFnZVtpXTsNCi0JCW1lbXNldChwZm10
LT5yZXNlcnZlZCwgMCwgc2l6ZW9mKHBmbXQtPnJlc2VydmVkKSk7DQogDQogCQl2NGwyX2RiZygx
LCBkZWJ1ZywgJmpwZWctPnY0bDJfZGV2LA0KIAkJCSAicGxhbmVbJWRdIGJwbD0ldSwgc2l6ZT0l
dVxuIiwNCi0tIA0KMi4xOC4wDQo=

