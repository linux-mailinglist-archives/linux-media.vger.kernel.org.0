Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490E722A589
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387727AbgGWDGY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:24 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:54949 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387715AbgGWDGX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:23 -0400
X-UUID: 9c29329a20cd4a3d8523a615a0dbc7fb-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5NgUnUMcRy8Q2wsFxSIxDCVB6qlXDJIrkJNBYcNYcys=;
        b=UUHfA6OTOrQMJixqpc/UwsmkpnRPV2MUgNAKvBRxCazRlWwPDycPzkuoR6vDcqh32TMTxvh30guevHGyDctMRBgxqrpNFovZst6pYDibj8o3DwJ7CRaFujRIWbf5CaN5cN3bGEdqGV72pCdA54WyR2DyamfCGe63/gpf2cm66pE=;
X-UUID: 9c29329a20cd4a3d8523a615a0dbc7fb-20200723
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1942776662; Thu, 23 Jul 2020 11:06:20 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:09 +0800
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
Subject: [PATCH v10 09/28] media: platform: Cancel the last frame handling flow
Date:   Thu, 23 Jul 2020 11:04:32 +0800
Message-ID: <20200723030451.5616-10-xia.jiang@mediatek.com>
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

VGhlcmUgaXMgbm8gbmVlZCB0byBxdWV1ZSBhbiBlbXB0eSBidWZmZXIgZm9yIHNpZ25hbGluZyBh
IGxhc3QgZnJhbWUsDQpiZWNhdXNlIGFsbCBmcmFtZXMgYXJlIHNlcGFyYXRlIGZyb20gZWFjaCBv
dGhlciBpbiBKUEVHLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVt
Lm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4N
Ci0tLQ0KdjEwOiBkZWxldGUgbXRrX2pwZWdfcWJ1ZigpDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZv
cm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCA0NiArLS0tLS0tLS0tLS0tLS0tLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCA5
YmFlZWFjYjQ0NTIuLmZmYjQ4NmU1MzdiNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTU1LDE1ICs1NSw5IEBAIHN0YXRpYyBz
dHJ1Y3QgbXRrX2pwZWdfZm10IG10a19qcGVnX2Zvcm1hdHNbXSA9IHsNCiANCiAjZGVmaW5lIE1U
S19KUEVHX05VTV9GT1JNQVRTIEFSUkFZX1NJWkUobXRrX2pwZWdfZm9ybWF0cykNCiANCi1lbnVt
IHsNCi0JTVRLX0pQRUdfQlVGX0ZMQUdTX0lOSVQJCQk9IDAsDQotCU1US19KUEVHX0JVRl9GTEFH
U19MQVNUX0ZSQU1FCQk9IDEsDQotfTsNCi0NCiBzdHJ1Y3QgbXRrX2pwZWdfc3JjX2J1ZiB7DQog
CXN0cnVjdCB2YjJfdjRsMl9idWZmZXIgYjsNCiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KLQlp
bnQgZmxhZ3M7DQogCXN0cnVjdCBtdGtfanBlZ19kZWNfcGFyYW0gZGVjX3BhcmFtOw0KIH07DQog
DQpAQCAtNTAxLDMxICs0OTUsNiBAQCBzdGF0aWMgaW50IG10a19qcGVnX3Nfc2VsZWN0aW9uKHN0
cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGlj
IGludCBtdGtfanBlZ19xYnVmKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LCBzdHJ1Y3Qg
djRsMl9idWZmZXIgKmJ1ZikNCi17DQotCXN0cnVjdCB2NGwyX2ZoICpmaCA9IGZpbGUtPnByaXZh
dGVfZGF0YTsNCi0Jc3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gbXRrX2pwZWdfZmhfdG9fY3R4
KHByaXYpOw0KLQlzdHJ1Y3QgdmIyX3F1ZXVlICp2cTsNCi0Jc3RydWN0IHZiMl9idWZmZXIgKnZi
Ow0KLQlzdHJ1Y3QgbXRrX2pwZWdfc3JjX2J1ZiAqanBlZ19zcmNfYnVmOw0KLQ0KLQlpZiAoYnVm
LT50eXBlICE9IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkNCi0JCWdvdG8gZW5k
Ow0KLQ0KLQl2cSA9IHY0bDJfbTJtX2dldF92cShmaC0+bTJtX2N0eCwgYnVmLT50eXBlKTsNCi0J
aWYgKGJ1Zi0+aW5kZXggPj0gdnEtPm51bV9idWZmZXJzKSB7DQotCQlkZXZfZXJyKGN0eC0+anBl
Zy0+ZGV2LCAiYnVmZmVyIGluZGV4IG91dCBvZiByYW5nZVxuIik7DQotCQlyZXR1cm4gLUVJTlZB
TDsNCi0JfQ0KLQ0KLQl2YiA9IHZiMl9nZXRfYnVmZmVyKHZxLCBidWYtPmluZGV4KTsNCi0JanBl
Z19zcmNfYnVmID0gbXRrX2pwZWdfdmIyX3RvX3NyY2J1Zih2Yik7DQotCWpwZWdfc3JjX2J1Zi0+
ZmxhZ3MgPSAoYnVmLT5tLnBsYW5lc1swXS5ieXRlc3VzZWQgPT0gMCkgPw0KLQkJTVRLX0pQRUdf
QlVGX0ZMQUdTX0xBU1RfRlJBTUUgOiBNVEtfSlBFR19CVUZfRkxBR1NfSU5JVDsNCi1lbmQ6DQot
CXJldHVybiB2NGwyX20ybV9xYnVmKGZpbGUsIGZoLT5tMm1fY3R4LCBidWYpOw0KLX0NCi0NCiBz
dGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfaW9jdGxfb3BzIG10a19qcGVnX2lvY3RsX29wcyA9IHsN
CiAJLnZpZGlvY19xdWVyeWNhcCAgICAgICAgICAgICAgICA9IG10a19qcGVnX3F1ZXJ5Y2FwLA0K
IAkudmlkaW9jX2VudW1fZm10X3ZpZF9jYXAJPSBtdGtfanBlZ19lbnVtX2ZtdF92aWRfY2FwLA0K
QEAgLTUzNiw3ICs1MDUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfaW9jdGxfb3BzIG10
a19qcGVnX2lvY3RsX29wcyA9IHsNCiAJLnZpZGlvY19nX2ZtdF92aWRfb3V0X21wbGFuZSAgICA9
IG10a19qcGVnX2dfZm10X3ZpZF9tcGxhbmUsDQogCS52aWRpb2Nfc19mbXRfdmlkX2NhcF9tcGxh
bmUgICAgPSBtdGtfanBlZ19zX2ZtdF92aWRfY2FwX21wbGFuZSwNCiAJLnZpZGlvY19zX2ZtdF92
aWRfb3V0X21wbGFuZSAgICA9IG10a19qcGVnX3NfZm10X3ZpZF9vdXRfbXBsYW5lLA0KLQkudmlk
aW9jX3FidWYgICAgICAgICAgICAgICAgICAgID0gbXRrX2pwZWdfcWJ1ZiwNCisJLnZpZGlvY19x
YnVmICAgICAgICAgICAgICAgICAgICA9IHY0bDJfbTJtX2lvY3RsX3FidWYsDQogCS52aWRpb2Nf
c3Vic2NyaWJlX2V2ZW50ICAgICAgICAgPSBtdGtfanBlZ19zdWJzY3JpYmVfZXZlbnQsDQogCS52
aWRpb2NfZ19zZWxlY3Rpb24JCT0gbXRrX2pwZWdfZ19zZWxlY3Rpb24sDQogCS52aWRpb2Nfc19z
ZWxlY3Rpb24JCT0gbXRrX2pwZWdfc19zZWxlY3Rpb24sDQpAQCAtNjc2LDEwICs2NDUsNiBAQCBz
dGF0aWMgdm9pZCBtdGtfanBlZ19idWZfcXVldWUoc3RydWN0IHZiMl9idWZmZXIgKnZiKQ0KIAlw
YXJhbSA9ICZqcGVnX3NyY19idWYtPmRlY19wYXJhbTsNCiAJbWVtc2V0KHBhcmFtLCAwLCBzaXpl
b2YoKnBhcmFtKSk7DQogDQotCWlmIChqcGVnX3NyY19idWYtPmZsYWdzICYgTVRLX0pQRUdfQlVG
X0ZMQUdTX0xBU1RfRlJBTUUpIHsNCi0JCXY0bDJfZGJnKDEsIGRlYnVnLCAmanBlZy0+djRsMl9k
ZXYsICJHb3QgZW9zXG4iKTsNCi0JCWdvdG8gZW5kOw0KLQl9DQogCWhlYWRlcl92YWxpZCA9IG10
a19qcGVnX3BhcnNlKHBhcmFtLCAodTggKil2YjJfcGxhbmVfdmFkZHIodmIsIDApLA0KIAkJCQkg
ICAgICB2YjJfZ2V0X3BsYW5lX3BheWxvYWQodmIsIDApKTsNCiAJaWYgKCFoZWFkZXJfdmFsaWQp
IHsNCkBAIC03OTIsMTkgKzc1NywxMiBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ19kZXZpY2VfcnVu
KHZvaWQgKnByaXYpDQogCXN0cnVjdCBtdGtfanBlZ19zcmNfYnVmICpqcGVnX3NyY19idWY7DQog
CXN0cnVjdCBtdGtfanBlZ19icyBiczsNCiAJc3RydWN0IG10a19qcGVnX2ZiIGZiOw0KLQlpbnQg
aSwgcmV0Ow0KKwlpbnQgcmV0Ow0KIA0KIAlzcmNfYnVmID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVm
KGN0eC0+ZmgubTJtX2N0eCk7DQogCWRzdF9idWYgPSB2NGwyX20ybV9uZXh0X2RzdF9idWYoY3R4
LT5maC5tMm1fY3R4KTsNCiAJanBlZ19zcmNfYnVmID0gbXRrX2pwZWdfdmIyX3RvX3NyY2J1Zigm
c3JjX2J1Zi0+dmIyX2J1Zik7DQogDQotCWlmIChqcGVnX3NyY19idWYtPmZsYWdzICYgTVRLX0pQ
RUdfQlVGX0ZMQUdTX0xBU1RfRlJBTUUpIHsNCi0JCWZvciAoaSA9IDA7IGkgPCBkc3RfYnVmLT52
YjJfYnVmLm51bV9wbGFuZXM7IGkrKykNCi0JCQl2YjJfc2V0X3BsYW5lX3BheWxvYWQoJmRzdF9i
dWYtPnZiMl9idWYsIGksIDApOw0KLQkJYnVmX3N0YXRlID0gVkIyX0JVRl9TVEFURV9ET05FOw0K
LQkJZ290byBkZWNfZW5kOw0KLQl9DQotDQogCWlmIChtdGtfanBlZ19jaGVja19yZXNvbHV0aW9u
X2NoYW5nZShjdHgsICZqcGVnX3NyY19idWYtPmRlY19wYXJhbSkpIHsNCiAJCW10a19qcGVnX3F1
ZXVlX3NyY19jaGdfZXZlbnQoY3R4KTsNCiAJCWN0eC0+c3RhdGUgPSBNVEtfSlBFR19TT1VSQ0Vf
Q0hBTkdFOw0KLS0gDQoyLjE4LjANCg==

