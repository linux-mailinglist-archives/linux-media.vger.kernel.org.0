Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A4C23B377
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbgHDDmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:42:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:28461 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730439AbgHDDmP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:42:15 -0400
X-UUID: 5d623802f6ff47d4bc6b7ce69512ab14-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rRaht40ywpbtfGb/T/WfXe2+9UkRVR2CCiHFLzzVJEY=;
        b=APlIGcNfTxpo+biZ+TAA0B3JY146chWCBJsea18B4RiAT1lx6qHLEGKv4P9k6WVSGDw/ebcNiLxdt0GnSfiSj8UV7tx8Bjt7jj9dsFSd0CuWsOYqhvcvlPR60LFUxPX1Nx9H89Vz4Pa7DMD6SdkZjgIRkDeSZjqD+d8mxJ7OKJU=;
X-UUID: 5d623802f6ff47d4bc6b7ce69512ab14-20200804
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 935823393; Tue, 04 Aug 2020 11:42:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:07 +0800
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
Subject: [PATCH v11 22/28] media: platform: Change the call functions of getting/enable/disable the jpeg's clock
Date:   Tue, 4 Aug 2020 11:40:56 +0800
Message-ID: <20200804034102.22983-23-xia.jiang@mediatek.com>
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

VXNlIHRoZSBnZW5lcmljIGNsa19idWxrXyogaGVscGVycyB0byBlbmFibGUgYW5kIGRpc2FibGUg
Y2xvY2tzLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5j
b20+DQotLS0NCnYxMTogc3BlY2lmeSB0aGUgbmFtZXMgb2YgdGhlIGNsb2NrcyBpbiB0aGUgZHJp
dmVyDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAg
fCAyOCArKysrKysrKysrKysrLS0tLS0tDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuaCAgIHwgIDggKysrLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDc4ODFlOWM5M2RmNy4uNDdkNTcwZjMyZTNm
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
MzUsMTAgKzkzNiwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZmlsZV9vcGVyYXRpb25z
IG10a19qcGVnX2ZvcHMgPSB7DQogCS5tbWFwICAgICAgICAgICA9IHY0bDJfbTJtX2ZvcF9tbWFw
LA0KIH07DQogDQorc3RhdGljIHN0cnVjdCBjbGtfYnVsa19kYXRhIG10ODE3M19qcGVnX2RlY19j
bG9ja3NbXSA9IHsNCisJeyAuaWQgPSAianBnZGVjLXNtaSIgfSwNCisJeyAuaWQgPSAianBnZGVj
IiB9LA0KK307DQorDQogc3RhdGljIGludCBtdGtfanBlZ19jbGtfaW5pdChzdHJ1Y3QgbXRrX2pw
ZWdfZGV2ICpqcGVnKQ0KIHsNCiAJc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KIAlzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KKwlpbnQgcmV0Ow0KIA0KIAlub2RlID0gb2ZfcGFyc2Vf
cGhhbmRsZShqcGVnLT5kZXYtPm9mX25vZGUsICJtZWRpYXRlayxsYXJiIiwgMCk7DQogCWlmICgh
bm9kZSkNCkBAIC05NTIsMTIgKzk1OSwxNSBAQCBzdGF0aWMgaW50IG10a19qcGVnX2Nsa19pbml0
KHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogDQogCWpwZWctPmxhcmIgPSAmcGRldi0+ZGV2
Ow0KIA0KLQlqcGVnLT5jbGtfamRlYyA9IGRldm1fY2xrX2dldChqcGVnLT5kZXYsICJqcGdkZWMi
KTsNCi0JaWYgKElTX0VSUihqcGVnLT5jbGtfamRlYykpDQotCQlyZXR1cm4gUFRSX0VSUihqcGVn
LT5jbGtfamRlYyk7DQorCWpwZWctPmNsa3MgPSBtdDgxNzNfanBlZ19kZWNfY2xvY2tzOw0KKwlq
cGVnLT5udW1fY2xrcyA9IEFSUkFZX1NJWkUobXQ4MTczX2pwZWdfZGVjX2Nsb2Nrcyk7DQorCXJl
dCA9IGRldm1fY2xrX2J1bGtfZ2V0KGpwZWctPmRldiwganBlZy0+bnVtX2Nsa3MsIGpwZWctPmNs
a3MpOw0KKwlpZiAocmV0KSB7DQorCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0
IGpwZWcgY2xvY2s6JWRcbiIsIHJldCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQogDQotCWpwZWct
PmNsa19qZGVjX3NtaSA9IGRldm1fY2xrX2dldChqcGVnLT5kZXYsICJqcGdkZWMtc21pIik7DQot
CXJldHVybiBQVFJfRVJSX09SX1pFUk8oanBlZy0+Y2xrX2pkZWNfc21pKTsNCisJcmV0dXJuIDA7
DQogfQ0KIA0KIHN0YXRpYyB2b2lkIG10a19qcGVnX2pvYl90aW1lb3V0X3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmgNCmluZGV4IDRjNzZhOWRjYzRiNy4uYTU0ZTFlODJlNjU1IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCisr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQpAQCAt
NTIsOCArNTIsOCBAQCBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogICogQGFsbG9jX2N0eDoJ
CXZpZGVvYnVmMiBtZW1vcnkgYWxsb2NhdG9yJ3MgY29udGV4dA0KICAqIEBkZWNfdmRldjoJCXZp
ZGVvIGRldmljZSBub2RlIGZvciBkZWNvZGVyIG1lbTJtZW0gbW9kZQ0KICAqIEBkZWNfcmVnX2Jh
c2U6CUpQRUcgcmVnaXN0ZXJzIG1hcHBpbmcNCi0gKiBAY2xrX2pkZWM6CQlKUEVHIGh3IHdvcmtp
bmcgY2xvY2sNCi0gKiBAY2xrX2pkZWNfc21pOglKUEVHIFNNSSBidXMgY2xvY2sNCisgKiBAY2xr
czoJCWNsb2NrIG5hbWVzDQorICogQG51bV9jbGtzOgkJbnVtYmVycyBvZiBjbG9jaw0KICAqIEBs
YXJiOgkJU01JIGRldmljZQ0KICAqIEBqb2JfdGltZW91dF93b3JrOglJUlEgdGltZW91dCBzdHJ1
Y3R1cmUNCiAgKi8NCkBAIC02Nyw4ICs2Nyw4IEBAIHN0cnVjdCBtdGtfanBlZ19kZXYgew0KIAl2
b2lkCQkJKmFsbG9jX2N0eDsNCiAJc3RydWN0IHZpZGVvX2RldmljZQkqZGVjX3ZkZXY7DQogCXZv
aWQgX19pb21lbQkJKmRlY19yZWdfYmFzZTsNCi0Jc3RydWN0IGNsawkJKmNsa19qZGVjOw0KLQlz
dHJ1Y3QgY2xrCQkqY2xrX2pkZWNfc21pOw0KKwlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsN
CisJaW50IG51bV9jbGtzOw0KIAlzdHJ1Y3QgZGV2aWNlCQkqbGFyYjsNCiAJc3RydWN0IGRlbGF5
ZWRfd29yayBqb2JfdGltZW91dF93b3JrOw0KIH07DQotLSANCjIuMTguMA0K

