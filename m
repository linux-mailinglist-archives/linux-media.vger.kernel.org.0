Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D998122A593
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387831AbgGWDGn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:43 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63451 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387820AbgGWDGl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:41 -0400
X-UUID: 01c41fdf38cf4cbab516974cf727b5fa-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nkyeVbezkiMwsNrKU3e33sAw3cAgD50YmCF4Tng1Trs=;
        b=ejQPOk50txy4onRyJPkVCdrySuIsXWfHF2q+QsqsDPjmYUcGyz/ll2IEYdVEwkEl7UDIhj6sE/qhAYp3w9+2Ljcjh83NLg/kBL2aG9E2vwObX9wAhb4S6hf+JAf0CvzHCpjOufWok9+N4jjWDcmvdPCH+1oWL5iNQ/gY7fXNKJc=;
X-UUID: 01c41fdf38cf4cbab516974cf727b5fa-20200723
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 843423841; Thu, 23 Jul 2020 11:06:38 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:33 +0800
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
Subject: [PATCH v10 22/28] media: platform: Change the call functions of getting/enable/disable the jpeg's clock
Date:   Thu, 23 Jul 2020 11:04:45 +0800
Message-ID: <20200723030451.5616-23-xia.jiang@mediatek.com>
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

VXNlIHRoZSBnZW5lcmljIG9mX3Byb3BlcnR5XyogaGVscGVycyB0byBnZXQgdGhlIGNsb2NrX251
bXMgYW5kIGNsb2Nrcw0KZnJvbSBkZXZpY2UgdHJlZS4NClVzZSB0aGUgZ2VuZXJpYyBjbGtfYnVs
a18qIGhlbHBlcnMgdG8gZW5hYmxlIGFuZCBkaXNhYmxlIGNsb2Nrcy4NCg0KU2lnbmVkLW9mZi1i
eTogWGlhIEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTA6IG5ldyBhZGQg
cGF0Y2gNCi0tLQ0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMg
ICB8IDQ3ICsrKysrKysrKysrKysrKy0tLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5oICAgfCAgOCArKy0tDQogMiBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDc4ODFlOWM5M2RmNy4uOTIxZWQyMWY3ZGIz
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19j
b3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jDQpAQCAtNzgzLDE0ICs3ODMsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfY2xrX29uKHN0
cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogCXJldCA9IG10a19zbWlfbGFyYl9nZXQoanBlZy0+
bGFyYik7DQogCWlmIChyZXQpDQogCQlkZXZfZXJyKGpwZWctPmRldiwgIm10a19zbWlfbGFyYl9n
ZXQgbGFyYnZkZWMgZmFpbCAlZFxuIiwgcmV0KTsNCi0JY2xrX3ByZXBhcmVfZW5hYmxlKGpwZWct
PmNsa19qZGVjX3NtaSk7DQotCWNsa19wcmVwYXJlX2VuYWJsZShqcGVnLT5jbGtfamRlYyk7DQor
DQorCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKGpwZWctPm51bV9jbGtzLCBqcGVnLT5j
bGtzKTsNCisJaWYgKHJldCkNCisJCWRldl9lcnIoanBlZy0+ZGV2LCAiRmFpbGVkIHRvIG9wZW4g
anBlZyBjbGs6ICVkXG4iLCByZXQpOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBtdGtfanBlZ19jbGtf
b2ZmKHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogew0KLQljbGtfZGlzYWJsZV91bnByZXBh
cmUoanBlZy0+Y2xrX2pkZWMpOw0KLQljbGtfZGlzYWJsZV91bnByZXBhcmUoanBlZy0+Y2xrX2pk
ZWNfc21pKTsNCisJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoanBlZy0+bnVtX2Nsa3MsIGpw
ZWctPmNsa3MpOw0KIAltdGtfc21pX2xhcmJfcHV0KGpwZWctPmxhcmIpOw0KIH0NCiANCkBAIC05
MzksNiArOTQwLDcgQEAgc3RhdGljIGludCBtdGtfanBlZ19jbGtfaW5pdChzdHJ1Y3QgbXRrX2pw
ZWdfZGV2ICpqcGVnKQ0KIHsNCiAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KIAlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KKwlpbnQgcmV0LCBpOw0KIA0KIAlub2RlID0gb2ZfcGFy
c2VfcGhhbmRsZShqcGVnLT5kZXYtPm9mX25vZGUsICJtZWRpYXRlayxsYXJiIiwgMCk7DQogCWlm
ICghbm9kZSkNCkBAIC05NTIsMTIgKzk1NCwzOSBAQCBzdGF0aWMgaW50IG10a19qcGVnX2Nsa19p
bml0KHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogDQogCWpwZWctPmxhcmIgPSAmcGRldi0+
ZGV2Ow0KIA0KLQlqcGVnLT5jbGtfamRlYyA9IGRldm1fY2xrX2dldChqcGVnLT5kZXYsICJqcGdk
ZWMiKTsNCi0JaWYgKElTX0VSUihqcGVnLT5jbGtfamRlYykpDQotCQlyZXR1cm4gUFRSX0VSUihq
cGVnLT5jbGtfamRlYyk7DQorCWpwZWctPm51bV9jbGtzID0NCisJCW9mX3Byb3BlcnR5X2NvdW50
X3N0cmluZ3MoanBlZy0+ZGV2LT5vZl9ub2RlLCAiY2xvY2stbmFtZXMiKTsNCisNCisJaWYgKGpw
ZWctPm51bV9jbGtzID4gMCkgew0KKwkJanBlZy0+Y2xrcyA9IGRldm1fa2NhbGxvYyhqcGVnLT5k
ZXYsIGpwZWctPm51bV9jbGtzLA0KKwkJCQkJICBzaXplb2Yoc3RydWN0IGNsa19idWxrX2RhdGEp
LA0KKwkJCQkJICBHRlBfS0VSTkVMKTsNCisJCWlmICghanBlZy0+Y2xrcykNCisJCQlyZXR1cm4g
LUVOT01FTTsNCisJfSBlbHNlIHsNCisJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBn
ZXQganBlZyBjbG9jayBjb3VudFxuIik7DQorCQlyZXR1cm4gLUVJTlZBTDsNCisJfQ0KKw0KKwlm
b3IgKGkgPSAwOyBpIDwganBlZy0+bnVtX2Nsa3M7IGkrKykgew0KKwkJcmV0ID0gb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmdfaW5kZXgoanBlZy0+ZGV2LT5vZl9ub2RlLA0KKwkJCQkJCSAgICAiY2xv
Y2stbmFtZXMiLCBpLA0KKwkJCQkJCSAgICAmanBlZy0+Y2xrcy0+aWQpOw0KKwkJaWYgKHJldCkg
ew0KKwkJCWRldl9lcnIoJnBkZXYtPmRldiwNCisJCQkJIkZhaWxlZCB0byBnZXQgY2xvY2sgbmFt
ZSBpZCA9ICVkIiwgaSk7DQorCQkJcmV0dXJuIHJldDsNCisJCX0NCisJfQ0KIA0KLQlqcGVnLT5j
bGtfamRlY19zbWkgPSBkZXZtX2Nsa19nZXQoanBlZy0+ZGV2LCAianBnZGVjLXNtaSIpOw0KLQly
ZXR1cm4gUFRSX0VSUl9PUl9aRVJPKGpwZWctPmNsa19qZGVjX3NtaSk7DQorDQorCXJldCA9IGRl
dm1fY2xrX2J1bGtfZ2V0KGpwZWctPmRldiwganBlZy0+bnVtX2Nsa3MsIGpwZWctPmNsa3MpOw0K
KwlpZiAocmV0KSB7DQorCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gZ2V0IGpwZWcg
Y2xvY2s6JWRcbiIsIHJldCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCXJldHVybiAwOw0K
IH0NCiANCiBzdGF0aWMgdm9pZCBtdGtfanBlZ19qb2JfdGltZW91dF93b3JrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yaykNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5oDQppbmRleCA0Yzc2YTlkY2M0YjcuLmE1NGUxZTgyZTY1NSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KQEAgLTUy
LDggKzUyLDggQEAgZW51bSBtdGtfanBlZ19jdHhfc3RhdGUgew0KICAqIEBhbGxvY19jdHg6CQl2
aWRlb2J1ZjIgbWVtb3J5IGFsbG9jYXRvcidzIGNvbnRleHQNCiAgKiBAZGVjX3ZkZXY6CQl2aWRl
byBkZXZpY2Ugbm9kZSBmb3IgZGVjb2RlciBtZW0ybWVtIG1vZGUNCiAgKiBAZGVjX3JlZ19iYXNl
OglKUEVHIHJlZ2lzdGVycyBtYXBwaW5nDQotICogQGNsa19qZGVjOgkJSlBFRyBodyB3b3JraW5n
IGNsb2NrDQotICogQGNsa19qZGVjX3NtaToJSlBFRyBTTUkgYnVzIGNsb2NrDQorICogQGNsa3M6
CQljbG9jayBuYW1lcw0KKyAqIEBudW1fY2xrczoJCW51bWJlcnMgb2YgY2xvY2sNCiAgKiBAbGFy
YjoJCVNNSSBkZXZpY2UNCiAgKiBAam9iX3RpbWVvdXRfd29yazoJSVJRIHRpbWVvdXQgc3RydWN0
dXJlDQogICovDQpAQCAtNjcsOCArNjcsOCBAQCBzdHJ1Y3QgbXRrX2pwZWdfZGV2IHsNCiAJdm9p
ZAkJCSphbGxvY19jdHg7DQogCXN0cnVjdCB2aWRlb19kZXZpY2UJKmRlY192ZGV2Ow0KIAl2b2lk
IF9faW9tZW0JCSpkZWNfcmVnX2Jhc2U7DQotCXN0cnVjdCBjbGsJCSpjbGtfamRlYzsNCi0Jc3Ry
dWN0IGNsawkJKmNsa19qZGVjX3NtaTsNCisJc3RydWN0IGNsa19idWxrX2RhdGEgKmNsa3M7DQor
CWludCBudW1fY2xrczsNCiAJc3RydWN0IGRldmljZQkJKmxhcmI7DQogCXN0cnVjdCBkZWxheWVk
X3dvcmsgam9iX3RpbWVvdXRfd29yazsNCiB9Ow0KLS0gDQoyLjE4LjANCg==

