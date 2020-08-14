Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F032445B1
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgHNHPF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:15:05 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:14627 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726741AbgHNHNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:23 -0400
X-UUID: 0ad4a1a3a62948b5bd23b581caf5419d-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xdw36FEdfbjrpmm/25wdOBNJsrHP+0pR/IpHGiG6feo=;
        b=QfzWjQE7raE+lDntAjTl8x2zrNlGkQBIQ8wCDoEsNEJQBcOa1L5xfLm7ZVUG8m5ChdExEOb9YsZeR6qHeUKLMZ49kf5OWuXGf04z+luV5qbDiezyO1dn/vmj+YILNC+X72mi6SGqjLP/05+kO8vkwhzgjG6R3YoYOS1wm2N7zgo=;
X-UUID: 0ad4a1a3a62948b5bd23b581caf5419d-20200814
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1411788834; Fri, 14 Aug 2020 15:13:17 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:13 +0800
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
Subject: [PATCH v12 10/29] media: platform: Cancel the last frame handling flow
Date:   Fri, 14 Aug 2020 15:11:43 +0800
Message-ID: <20200814071202.25067-12-xia.jiang@mediatek.com>
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

VGhlcmUgaXMgbm8gbmVlZCB0byBxdWV1ZSBhbiBlbXB0eSBidWZmZXIgZm9yIHNpZ25hbGluZyBh
IGxhc3QgZnJhbWUsDQpiZWNhdXNlIGFsbCBmcmFtZXMgYXJlIHNlcGFyYXRlIGZyb20gZWFjaCBv
dGhlciBpbiBKUEVHLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVt
Lm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KdjEyOiBubyBjaGFuZ2VzDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5jICAgfCA0NiArLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCA5YmFlZWFjYjQ0NTIu
LmZmYjQ4NmU1MzdiNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuYw0KQEAgLTU1LDE1ICs1NSw5IEBAIHN0YXRpYyBzdHJ1Y3QgbXRrX2pw
ZWdfZm10IG10a19qcGVnX2Zvcm1hdHNbXSA9IHsNCiANCiAjZGVmaW5lIE1US19KUEVHX05VTV9G
T1JNQVRTIEFSUkFZX1NJWkUobXRrX2pwZWdfZm9ybWF0cykNCiANCi1lbnVtIHsNCi0JTVRLX0pQ
RUdfQlVGX0ZMQUdTX0lOSVQJCQk9IDAsDQotCU1US19KUEVHX0JVRl9GTEFHU19MQVNUX0ZSQU1F
CQk9IDEsDQotfTsNCi0NCiBzdHJ1Y3QgbXRrX2pwZWdfc3JjX2J1ZiB7DQogCXN0cnVjdCB2YjJf
djRsMl9idWZmZXIgYjsNCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KLQlpbnQgZmxhZ3M7DQog
CXN0cnVjdCBtdGtfanBlZ19kZWNfcGFyYW0gZGVjX3BhcmFtOw0KIH07DQogDQpAQCAtNTAxLDMx
ICs0OTUsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Nfc2VsZWN0aW9uKHN0cnVjdCBmaWxlICpm
aWxlLCB2b2lkICpwcml2LA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBtdGtfanBl
Z19xYnVmKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3QgdjRsMl9idWZmZXIg
KmJ1ZikNCi17DQotCXN0cnVjdCB2NGwyX2ZoICpmaCA9IGZpbGUtPnByaXZhdGVfZGF0YTsNCi0J
c3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gbXRrX2pwZWdfZmhfdG9fY3R4KHByaXYpOw0KLQlz
dHJ1Y3QgdmIyX3F1ZXVlICp2cTsNCi0Jc3RydWN0IHZiMl9idWZmZXIgKnZiOw0KLQlzdHJ1Y3Qg
bXRrX2pwZWdfc3JjX2J1ZiAqanBlZ19zcmNfYnVmOw0KLQ0KLQlpZiAoYnVmLT50eXBlICE9IFY0
TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkNCi0JCWdvdG8gZW5kOw0KLQ0KLQl2cSA9
IHY0bDJfbTJtX2dldF92cShmaC0+bTJtX2N0eCwgYnVmLT50eXBlKTsNCi0JaWYgKGJ1Zi0+aW5k
ZXggPj0gdnEtPm51bV9idWZmZXJzKSB7DQotCQlkZXZfZXJyKGN0eC0+anBlZy0+ZGV2LCAiYnVm
ZmVyIGluZGV4IG91dCBvZiByYW5nZVxuIik7DQotCQlyZXR1cm4gLUVJTlZBTDsNCi0JfQ0KLQ0K
LQl2YiA9IHZiMl9nZXRfYnVmZmVyKHZxLCBidWYtPmluZGV4KTsNCi0JanBlZ19zcmNfYnVmID0g
bXRrX2pwZWdfdmIyX3RvX3NyY2J1Zih2Yik7DQotCWpwZWdfc3JjX2J1Zi0+ZmxhZ3MgPSAoYnVm
LT5tLnBsYW5lc1swXS5ieXRlc3VzZWQgPT0gMCkgPw0KLQkJTVRLX0pQRUdfQlVGX0ZMQUdTX0xB
U1RfRlJBTUUgOiBNVEtfSlBFR19CVUZfRkxBR1NfSU5JVDsNCi1lbmQ6DQotCXJldHVybiB2NGwy
X20ybV9xYnVmKGZpbGUsIGZoLT5tMm1fY3R4LCBidWYpOw0KLX0NCi0NCiBzdGF0aWMgY29uc3Qg
c3RydWN0IHY0bDJfaW9jdGxfb3BzIG10a19qcGVnX2lvY3RsX29wcyA9IHsNCiAJLnZpZGlvY19x
dWVyeWNhcCAgICAgICAgICAgICAgICA9IG10a19qcGVnX3F1ZXJ5Y2FwLA0KIAkudmlkaW9jX2Vu
dW1fZm10X3ZpZF9jYXAJPSBtdGtfanBlZ19lbnVtX2ZtdF92aWRfY2FwLA0KQEAgLTUzNiw3ICs1
MDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfaW9jdGxfb3BzIG10a19qcGVnX2lvY3Rs
X29wcyA9IHsNCiAJLnZpZGlvY19nX2ZtdF92aWRfb3V0X21wbGFuZSAgICA9IG10a19qcGVnX2df
Zm10X3ZpZF9tcGxhbmUsDQogCS52aWRpb2Nfc19mbXRfdmlkX2NhcF9tcGxhbmUgICAgPSBtdGtf
anBlZ19zX2ZtdF92aWRfY2FwX21wbGFuZSwNCiAJLnZpZGlvY19zX2ZtdF92aWRfb3V0X21wbGFu
ZSAgICA9IG10a19qcGVnX3NfZm10X3ZpZF9vdXRfbXBsYW5lLA0KLQkudmlkaW9jX3FidWYgICAg
ICAgICAgICAgICAgICAgID0gbXRrX2pwZWdfcWJ1ZiwNCisJLnZpZGlvY19xYnVmICAgICAgICAg
ICAgICAgICAgICA9IHY0bDJfbTJtX2lvY3RsX3FidWYsDQogCS52aWRpb2Nfc3Vic2NyaWJlX2V2
ZW50ICAgICAgICAgPSBtdGtfanBlZ19zdWJzY3JpYmVfZXZlbnQsDQogCS52aWRpb2NfZ19zZWxl
Y3Rpb24JCT0gbXRrX2pwZWdfZ19zZWxlY3Rpb24sDQogCS52aWRpb2Nfc19zZWxlY3Rpb24JCT0g
bXRrX2pwZWdfc19zZWxlY3Rpb24sDQpAQCAtNjc2LDEwICs2NDUsNiBAQCBzdGF0aWMgdm9pZCBt
dGtfanBlZ19idWZfcXVldWUoc3RydWN0IHZiMl9idWZmZXIgKnZiKQ0KIAlwYXJhbSA9ICZqcGVn
X3NyY19idWYtPmRlY19wYXJhbTsNCiAJbWVtc2V0KHBhcmFtLCAwLCBzaXplb2YoKnBhcmFtKSk7
DQogDQotCWlmIChqcGVnX3NyY19idWYtPmZsYWdzICYgTVRLX0pQRUdfQlVGX0ZMQUdTX0xBU1Rf
RlJBTUUpIHsNCi0JCXY0bDJfZGJnKDEsIGRlYnVnLCAmanBlZy0+djRsMl9kZXYsICJHb3QgZW9z
XG4iKTsNCi0JCWdvdG8gZW5kOw0KLQl9DQogCWhlYWRlcl92YWxpZCA9IG10a19qcGVnX3BhcnNl
KHBhcmFtLCAodTggKil2YjJfcGxhbmVfdmFkZHIodmIsIDApLA0KIAkJCQkgICAgICB2YjJfZ2V0
X3BsYW5lX3BheWxvYWQodmIsIDApKTsNCiAJaWYgKCFoZWFkZXJfdmFsaWQpIHsNCkBAIC03OTIs
MTkgKzc1NywxMiBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19kZXZpY2VfcnVuKHZvaWQgKnByaXYp
DQogCXN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpqcGVnX3NyY19idWY7DQogCXN0cnVjdCBtdGtf
anBlZ19icyBiczsNCiAJc3RydWN0IG10a19qcGVnX2ZiIGZiOw0KLQlpbnQgaSwgcmV0Ow0KKwlp
bnQgcmV0Ow0KIA0KIAlzcmNfYnVmID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGN0eC0+ZmgubTJt
X2N0eCk7DQogCWRzdF9idWYgPSB2NGwyX20ybV9uZXh0X2RzdF9idWYoY3R4LT5maC5tMm1fY3R4
KTsNCiAJanBlZ19zcmNfYnVmID0gbXRrX2pwZWdfdmIyX3RvX3NyY2J1Zigmc3JjX2J1Zi0+dmIy
X2J1Zik7DQogDQotCWlmIChqcGVnX3NyY19idWYtPmZsYWdzICYgTVRLX0pQRUdfQlVGX0ZMQUdT
X0xBU1RfRlJBTUUpIHsNCi0JCWZvciAoaSA9IDA7IGkgPCBkc3RfYnVmLT52YjJfYnVmLm51bV9w
bGFuZXM7IGkrKykNCi0JCQl2YjJfc2V0X3BsYW5lX3BheWxvYWQoJmRzdF9idWYtPnZiMl9idWYs
IGksIDApOw0KLQkJYnVmX3N0YXRlID0gVkIyX0JVRl9TVEFURV9ET05FOw0KLQkJZ290byBkZWNf
ZW5kOw0KLQl9DQotDQogCWlmIChtdGtfanBlZ19jaGVja19yZXNvbHV0aW9uX2NoYW5nZShjdHgs
ICZqcGVnX3NyY19idWYtPmRlY19wYXJhbSkpIHsNCiAJCW10a19qcGVnX3F1ZXVlX3NyY19jaGdf
ZXZlbnQoY3R4KTsNCiAJCWN0eC0+c3RhdGUgPSBNVEtfSlBFR19TT1VSQ0VfQ0hBTkdFOw0KLS0g
DQoyLjE4LjANCg==

