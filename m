Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE3822A590
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387805AbgGWDGh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:37 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:46696 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387789AbgGWDGg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:36 -0400
X-UUID: b1b6705532754ce4b3133457fcbf3d07-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=di5oEQziJFSrioHOTO1osgdCck1UjjATZjOswSWUO3E=;
        b=Mw730byPMAyx4BXZmNeut1fnLyS4Zb7YXqKT5rQk/VIuVhZ3m1A3HUGLbaA569kKLMOMCjt/wSRVD15bIXal/e5FNOdZIsBYr9TE7YVB6WatpZbp8zM/gAQo6KhvBQDEYoaqJ8zpQB+KlcR7+lXKD3mgAk7TEAJ8qKmBLf1MCwA=;
X-UUID: b1b6705532754ce4b3133457fcbf3d07-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1074652875; Thu, 23 Jul 2020 11:06:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:30 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:26 +0800
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
Subject: [PATCH v10 17/28] media: platform: Refactor mtk_jpeg_try_fmt_mplane()
Date:   Thu, 23 Jul 2020 11:04:40 +0800
Message-ID: <20200723030451.5616-18-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlIGZ1bmN0aW9uIG9mIG10a19qcGVnX2FkanVzdF9mbXRfbXBsYW5lKCkgZXF1YWxzDQptdGtf
anBlZ19nX2ZtdF92aWRfbXBsYW5lKCksIHNvIHVzZSBtdGtfanBlZ19nX2ZtdF92aWRfbXBsYW5l
KCkgdG8NCnJlcGxhY2UgaXQgLg0KRGVsZXRlIHRoZSB1bnVzZWQgY3R4IHBhcmFtZXRlci4NClVz
aW5nIGZvdXJjYyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGRpZmZlcmVudCBmb3JtYXRzIGlzIG1v
cmUgZ2VuZXJpYywNCmJlY2F1c2UgdGhhdCBqcGVnIGVuYyB3aWxsIGFsc28gdXNlIGl0Lg0KDQpT
aWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnYx
MDogbmV3IGFkZCBwYXRjaA0KLS0tDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuYyAgIHwgNDkgKysrKysrLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDlkMTkzNWQwNzgyYi4uYWJh
NTgzZjAzZWYxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jDQpAQCAtMTUxLDQ0ICsxNTEsMTcgQEAgc3RhdGljIHN0cnVjdCBtdGtfanBl
Z19mbXQgKm10a19qcGVnX2ZpbmRfZm9ybWF0KHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwNCiAJ
cmV0dXJuIE5VTEw7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIG10a19qcGVnX2FkanVzdF9mbXRfbXBs
YW5lKHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwNCi0JCQkJICAgICAgIHN0cnVjdCB2NGwyX2Zv
cm1hdCAqZikNCitzdGF0aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwy
X3BpeF9mb3JtYXRfbXBsYW5lICpwaXhfbXAsDQorCQkJCSAgIHN0cnVjdCBtdGtfanBlZ19mbXQg
KmZtdCkNCiB7DQotCXN0cnVjdCB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lICpwaXhfbXAgPSAmZi0+
Zm10LnBpeF9tcDsNCi0Jc3RydWN0IG10a19qcGVnX3FfZGF0YSAqcV9kYXRhOw0KLQlpbnQgaTsN
Ci0NCi0JcV9kYXRhID0gbXRrX2pwZWdfZ2V0X3FfZGF0YShjdHgsIGYtPnR5cGUpOw0KLQ0KLQlw
aXhfbXAtPndpZHRoID0gcV9kYXRhLT53Ow0KLQlwaXhfbXAtPmhlaWdodCA9IHFfZGF0YS0+aDsN
Ci0JcGl4X21wLT5waXhlbGZvcm1hdCA9IHFfZGF0YS0+Zm10LT5mb3VyY2M7DQotCXBpeF9tcC0+
bnVtX3BsYW5lcyA9IHFfZGF0YS0+Zm10LT5jb2xwbGFuZXM7DQotDQotCWZvciAoaSA9IDA7IGkg
PCBwaXhfbXAtPm51bV9wbGFuZXM7IGkrKykgew0KLQkJcGl4X21wLT5wbGFuZV9mbXRbaV0uYnl0
ZXNwZXJsaW5lID0gcV9kYXRhLT5ieXRlc3BlcmxpbmVbaV07DQotCQlwaXhfbXAtPnBsYW5lX2Zt
dFtpXS5zaXplaW1hZ2UgPSBxX2RhdGEtPnNpemVpbWFnZVtpXTsNCi0JfQ0KLX0NCi0NCi1zdGF0
aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCi0J
CQkJICAgc3RydWN0IG10a19qcGVnX2ZtdCAqZm10LA0KLQkJCQkgICBzdHJ1Y3QgbXRrX2pwZWdf
Y3R4ICpjdHgsIGludCBxX3R5cGUpDQotew0KLQlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFu
ZSAqcGl4X21wID0gJmYtPmZtdC5waXhfbXA7DQogCWludCBpOw0KIA0KIAlwaXhfbXAtPmZpZWxk
ID0gVjRMMl9GSUVMRF9OT05FOw0KIA0KLQlpZiAoY3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklU
KSB7DQotCQltdGtfanBlZ19hZGp1c3RfZm10X21wbGFuZShjdHgsIGYpOw0KLQkJcmV0dXJuIDA7
DQotCX0NCi0NCiAJcGl4X21wLT5udW1fcGxhbmVzID0gZm10LT5jb2xwbGFuZXM7DQogCXBpeF9t
cC0+cGl4ZWxmb3JtYXQgPSBmbXQtPmZvdXJjYzsNCiANCi0JaWYgKHFfdHlwZSA9PSBNVEtfSlBF
R19GTVRfVFlQRV9PVVRQVVQpIHsNCisJaWYgKGZtdC0+Zm91cmNjID09IFY0TDJfUElYX0ZNVF9K
UEVHKSB7DQogCQlzdHJ1Y3QgdjRsMl9wbGFuZV9waXhfZm9ybWF0ICpwZm10ID0gJnBpeF9tcC0+
cGxhbmVfZm10WzBdOw0KIA0KIAkJcGl4X21wLT5oZWlnaHQgPSBjbGFtcChwaXhfbXAtPmhlaWdo
dCwgTVRLX0pQRUdfTUlOX0hFSUdIVCwNCkBAIC0yMDQsNyArMTc3LDcgQEAgc3RhdGljIGludCBt
dGtfanBlZ190cnlfZm10X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogCQlyZXR1cm4g
MDsNCiAJfQ0KIA0KLQkvKiB0eXBlIGlzIE1US19KUEVHX0ZNVF9UWVBFX0NBUFRVUkUgKi8NCisJ
Lyogb3RoZXIgZm91cmNjICovDQogCXBpeF9tcC0+aGVpZ2h0ID0gY2xhbXAocm91bmRfdXAocGl4
X21wLT5oZWlnaHQsIGZtdC0+dl9hbGlnbiksDQogCQkJICAgICAgIE1US19KUEVHX01JTl9IRUlH
SFQsIE1US19KUEVHX01BWF9IRUlHSFQpOw0KIAlwaXhfbXAtPndpZHRoID0gY2xhbXAocm91bmRf
dXAocGl4X21wLT53aWR0aCwgZm10LT5oX2FsaWduKSwNCkBAIC0yODgsNyArMjYxLDEyIEBAIHN0
YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF92aWRfY2FwX21wbGFuZShzdHJ1Y3QgZmlsZSAqZmls
ZSwgdm9pZCAqcHJpdiwNCiAJCSAoZm10LT5mb3VyY2MgPj4gMTYgJiAweGZmKSwNCiAJCSAoZm10
LT5mb3VyY2MgPj4gMjQgJiAweGZmKSk7DQogDQotCXJldHVybiBtdGtfanBlZ190cnlfZm10X21w
bGFuZShmLCBmbXQsIGN0eCwgTVRLX0pQRUdfRk1UX1RZUEVfQ0FQVFVSRSk7DQorCWlmIChjdHgt
PnN0YXRlICE9IE1US19KUEVHX0lOSVQpIHsNCisJCW10a19qcGVnX2dfZm10X3ZpZF9tcGxhbmUo
ZmlsZSwgcHJpdiwgZik7DQorCQlyZXR1cm4gMDsNCisJfQ0KKw0KKwlyZXR1cm4gbXRrX2pwZWdf
dHJ5X2ZtdF9tcGxhbmUoJmYtPmZtdC5waXhfbXAsIGZtdCk7DQogfQ0KIA0KIHN0YXRpYyBpbnQg
bXRrX2pwZWdfdHJ5X2ZtdF92aWRfb3V0X21wbGFuZShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAq
cHJpdiwNCkBAIC0zMDksNyArMjg3LDEyIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF92
aWRfb3V0X21wbGFuZShzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCiAJCSAoZm10LT5m
b3VyY2MgPj4gMTYgJiAweGZmKSwNCiAJCSAoZm10LT5mb3VyY2MgPj4gMjQgJiAweGZmKSk7DQog
DQotCXJldHVybiBtdGtfanBlZ190cnlfZm10X21wbGFuZShmLCBmbXQsIGN0eCwgTVRLX0pQRUdf
Rk1UX1RZUEVfT1VUUFVUKTsNCisJaWYgKGN0eC0+c3RhdGUgIT0gTVRLX0pQRUdfSU5JVCkgew0K
KwkJbXRrX2pwZWdfZ19mbXRfdmlkX21wbGFuZShmaWxlLCBwcml2LCBmKTsNCisJCXJldHVybiAw
Ow0KKwl9DQorDQorCXJldHVybiBtdGtfanBlZ190cnlfZm10X21wbGFuZSgmZi0+Zm10LnBpeF9t
cCwgZm10KTsNCiB9DQogDQogc3RhdGljIGludCBtdGtfanBlZ19zX2ZtdF9tcGxhbmUoc3RydWN0
IG10a19qcGVnX2N0eCAqY3R4LA0KLS0gDQoyLjE4LjANCg==

