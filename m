Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896C01EE0B9
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgFDJI0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:23343 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728507AbgFDJIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:23 -0400
X-UUID: 71a6ca379c76468a943539d81a6f6e5c-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5ePcRgV/lHp7UcC/6PvykABEajI6oWw2EQVEmJvp6Qk=;
        b=qMRAlt+Et+RjkCGFuX1PlxaTeLeuvJKNVdS9GTRnr2Dh5c4ehkhUJ3FFXaVpknAOH4Dk2r7uvJiXQKiJbdfcE8rVISjLx5SlPaB1s6u3hSdrd2Z7B7+ytrZvQWqAnYjWOzZN4A+L98IAYY0985AHKH3OVnxpJaAwXJJUyyAJqcM=;
X-UUID: 71a6ca379c76468a943539d81a6f6e5c-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1044150056; Thu, 04 Jun 2020 17:08:19 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:15 +0800
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
Subject: [PATCH RESEND v9 13/18] media: platform: Delete redundant code and add annotation for an enum
Date:   Thu, 4 Jun 2020 17:05:48 +0800
Message-ID: <20200604090553.10861-15-xia.jiang@mediatek.com>
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

RGVsZXRlIHVudXNlZCBtZW1iZXIgdmFyaWFibGVzIGFubm90YXRpb24uDQpEZWxldGUgdW51c2Vk
IHZhcmlhYmxlIGRlZmluaXRpb24uDQpEZWxldGUgcmVkdW5kYW50IGxvZyBwcmludCwgYmVjYXVz
ZSBWNEwyIGRlYnVnIGxvZ3MgYWxyZWFkeSBwcmludCBpdC4NCkFkZCBhbm5vdGF0aW9uIGZvciBl
bnVtIG10a19qcGVnX2N0eF9zdGF0ZS4NCg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEu
amlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2OTogYWRkIGFubm90YXRpb24gZm9yIGVudW0gbXRr
X2pwZWdfY3R4X3N0YXRlDQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuYyB8IDE1ICsrLS0tLS0tLS0tLS0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIHwgIDggKysrKysrLS0NCiAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCBjOWMwMzU3YjJkNmMu
LjZjODIxMzRkNmIzZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuYw0KQEAgLTE3NiwxNCArMTc2LDEzIEBAIHN0YXRpYyBpbnQgbXRrX2pw
ZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KIAkJCQkgICBzdHJ1Y3Qg
bXRrX2pwZWdfY3R4ICpjdHgsIGludCBxX3R5cGUpDQogew0KIAlzdHJ1Y3QgdjRsMl9waXhfZm9y
bWF0X21wbGFuZSAqcGl4X21wID0gJmYtPmZtdC5waXhfbXA7DQotCXN0cnVjdCBtdGtfanBlZ19k
ZXYgKmpwZWcgPSBjdHgtPmpwZWc7DQogCWludCBpOw0KIA0KIAlwaXhfbXAtPmZpZWxkID0gVjRM
Ml9GSUVMRF9OT05FOw0KIA0KIAlpZiAoY3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklUKSB7DQog
CQltdGtfanBlZ19hZGp1c3RfZm10X21wbGFuZShjdHgsIGYpOw0KLQkJZ290byBlbmQ7DQorCQly
ZXR1cm4gMDsNCiAJfQ0KIA0KIAlwaXhfbXAtPm51bV9wbGFuZXMgPSBmbXQtPmNvbHBsYW5lczsN
CkBAIC0yMDIsNyArMjAxLDcgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X21wbGFuZShz
dHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogCQlwZm10LT5zaXplaW1hZ2UgPSByb3VuZF91cChwZm10
LT5zaXplaW1hZ2UsIDEyOCk7DQogCQlpZiAocGZtdC0+c2l6ZWltYWdlID09IDApDQogCQkJcGZt
dC0+c2l6ZWltYWdlID0gTVRLX0pQRUdfREVGQVVMVF9TSVpFSU1BR0U7DQotCQlnb3RvIGVuZDsN
CisJCXJldHVybiAwOw0KIAl9DQogDQogCS8qIHR5cGUgaXMgTVRLX0pQRUdfRk1UX1RZUEVfQ0FQ
VFVSRSAqLw0KQEAgLTIxOSwxNiArMjE4LDYgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10
X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogCQlwZm10LT5ieXRlc3BlcmxpbmUgPSBz
dHJpZGU7DQogCQlwZm10LT5zaXplaW1hZ2UgPSBzdHJpZGUgKiBoOw0KIAl9DQotZW5kOg0KLQl2
NGwyX2RiZygyLCBkZWJ1ZywgJmpwZWctPnY0bDJfZGV2LCAid3hoOiV1eCV1XG4iLA0KLQkJIHBp
eF9tcC0+d2lkdGgsIHBpeF9tcC0+aGVpZ2h0KTsNCi0JZm9yIChpID0gMDsgaSA8IHBpeF9tcC0+
bnVtX3BsYW5lczsgaSsrKSB7DQotCQl2NGwyX2RiZygyLCBkZWJ1ZywgJmpwZWctPnY0bDJfZGV2
LA0KLQkJCSAicGxhbmVbJWRdIGJwbD0ldSwgc2l6ZT0ldVxuIiwNCi0JCQkgaSwNCi0JCQkgcGl4
X21wLT5wbGFuZV9mbXRbaV0uYnl0ZXNwZXJsaW5lLA0KLQkJCSBwaXhfbXAtPnBsYW5lX2ZtdFtp
XS5zaXplaW1hZ2UpOw0KLQl9DQogCXJldHVybiAwOw0KIH0NCiANCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQppbmRleCA2NGE3MzEyNjEyMTQu
LjVmY2RmNjk1MDc4MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuaA0KQEAgLTMwLDYgKzMwLDEyIEBADQogDQogI2RlZmluZSBNVEtfSlBF
R19ERUZBVUxUX1NJWkVJTUFHRQkoMSAqIDEwMjQgKiAxMDI0KQ0KIA0KKy8qKg0KKyAqIGVudW0g
bXRrX2pwZWdfY3R4X3N0YXRlIC0gc3RhdGVzIG9mIHRoZSBjb250ZXh0IHN0YXRlIG1hY2hpbmUN
CisgKiBATVRLX0pQRUdfSU5JVDoJCWN1cnJlbnQgc3RhdGUgaXMgaW5pdGlhbGl6ZWQNCisgKiBA
TVRLX0pQRUdfUlVOTklORzoJCWN1cnJlbnQgc3RhdGUgaXMgcnVubmluZw0KKyAqIEBNVEtfSlBF
R19TT1VSQ0VfQ0hBTkdFOgljdXJyZW50IHN0YXRlIGlzIHNvdXJjZSByZXNvbHV0aW9uIGNoYW5n
ZQ0KKyAqLw0KIGVudW0gbXRrX2pwZWdfY3R4X3N0YXRlIHsNCiAJTVRLX0pQRUdfSU5JVCA9IDAs
DQogCU1US19KUEVHX1JVTk5JTkcsDQpAQCAtMTA5LDkgKzExNSw3IEBAIHN0cnVjdCBtdGtfanBl
Z19xX2RhdGEgew0KICAqIEBvdXRfcToJCXNvdXJjZSAob3V0cHV0KSBxdWV1ZSBpbmZvcm1hdGlv
bg0KICAqIEBjYXBfcToJCWRlc3RpbmF0aW9uIChjYXB0dXJlKSBxdWV1ZSBxdWV1ZSBpbmZvcm1h
dGlvbg0KICAqIEBmaDoJCQlWNEwyIGZpbGUgaGFuZGxlDQotICogQGRlY19wYXJhbQkJcGFyYW1l
dGVycyBmb3IgSFcgZGVjb2RpbmcNCiAgKiBAc3RhdGU6CQlzdGF0ZSBvZiB0aGUgY29udGV4dA0K
LSAqIEBoZWFkZXJfdmFsaWQ6CXNldCBpZiBoZWFkZXIgaGFzIGJlZW4gcGFyc2VkIGFuZCB2YWxp
ZA0KICAqIEBjb2xvcnNwYWNlOiBlbnVtIHY0bDJfY29sb3JzcGFjZTsgc3VwcGxlbWVudGFsIHRv
IHBpeGVsZm9ybWF0DQogICogQHljYmNyX2VuYzogZW51bSB2NGwyX3ljYmNyX2VuY29kaW5nLCBZ
J0NiQ3IgZW5jb2RpbmcNCiAgKiBAcXVhbnRpemF0aW9uOiBlbnVtIHY0bDJfcXVhbnRpemF0aW9u
LCBjb2xvcnNwYWNlIHF1YW50aXphdGlvbg0KLS0gDQoyLjE4LjANCg==

