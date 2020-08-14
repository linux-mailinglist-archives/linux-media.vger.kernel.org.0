Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA931244573
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:14:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgHNHNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:39 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:8107 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726897AbgHNHNh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:37 -0400
X-UUID: 038f0abdb6264371a00993860a52ff9e-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=W1qgTHuECQUExdFStaa5wbGrDOOVm6HlT330o0LfR/0=;
        b=KpJPSaXEV8+TqHNH+0W7WTaygOwJjqARSzb2gC3HiGf4eXycCcu+KHEnudqsO1vOt3moGJCl8Bk/d4+qZh/KxiO1v6XyxYV+ul+XkVh44KkOOkCP7LNoWDlRIr557+5c00OniRGwsoXKS62P8zQyPfdrDoAzAvEHHBGbednowU4=;
X-UUID: 038f0abdb6264371a00993860a52ff9e-20200814
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1899257700; Fri, 14 Aug 2020 15:13:33 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:29 +0800
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
Subject: [PATCH v12 23/29] media: platform: Change the call functions of getting/enable/disable the jpeg's clock
Date:   Fri, 14 Aug 2020 15:11:56 +0800
Message-ID: <20200814071202.25067-25-xia.jiang@mediatek.com>
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

VXNlIHRoZSBnZW5lcmljIGNsa19idWxrXyogaGVscGVycyB0byBlbmFibGUgYW5kIGRpc2FibGUg
Y2xvY2tzLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4N
ClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0K
djEyOiBubyBjaGFuZ2VzDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfY29yZS5jICAgfCAyOCArKysrKysrKysrKysrLS0tLS0tDQogLi4uL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2NvcmUuaCAgIHwgIDggKysrLS0tDQogMiBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmluZGV4IDc4ODFlOWM5M2RmNy4u
NDdkNTcwZjMyZTNmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5jDQpAQCAtNzgzLDE0ICs3ODMsMTUgQEAgc3RhdGljIHZvaWQgbXRrX2pw
ZWdfY2xrX29uKHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogCXJldCA9IG10a19zbWlfbGFy
Yl9nZXQoanBlZy0+bGFyYik7DQogCWlmIChyZXQpDQogCQlkZXZfZXJyKGpwZWctPmRldiwgIm10
a19zbWlfbGFyYl9nZXQgbGFyYnZkZWMgZmFpbCAlZFxuIiwgcmV0KTsNCi0JY2xrX3ByZXBhcmVf
ZW5hYmxlKGpwZWctPmNsa19qZGVjX3NtaSk7DQotCWNsa19wcmVwYXJlX2VuYWJsZShqcGVnLT5j
bGtfamRlYyk7DQorDQorCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKGpwZWctPm51bV9j
bGtzLCBqcGVnLT5jbGtzKTsNCisJaWYgKHJldCkNCisJCWRldl9lcnIoanBlZy0+ZGV2LCAiRmFp
bGVkIHRvIG9wZW4ganBlZyBjbGs6ICVkXG4iLCByZXQpOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBt
dGtfanBlZ19jbGtfb2ZmKHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogew0KLQljbGtfZGlz
YWJsZV91bnByZXBhcmUoanBlZy0+Y2xrX2pkZWMpOw0KLQljbGtfZGlzYWJsZV91bnByZXBhcmUo
anBlZy0+Y2xrX2pkZWNfc21pKTsNCisJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoanBlZy0+
bnVtX2Nsa3MsIGpwZWctPmNsa3MpOw0KIAltdGtfc21pX2xhcmJfcHV0KGpwZWctPmxhcmIpOw0K
IH0NCiANCkBAIC05MzUsMTAgKzkzNiwxNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfZmls
ZV9vcGVyYXRpb25zIG10a19qcGVnX2ZvcHMgPSB7DQogCS5tbWFwICAgICAgICAgICA9IHY0bDJf
bTJtX2ZvcF9tbWFwLA0KIH07DQogDQorc3RhdGljIHN0cnVjdCBjbGtfYnVsa19kYXRhIG10ODE3
M19qcGVnX2RlY19jbG9ja3NbXSA9IHsNCisJeyAuaWQgPSAianBnZGVjLXNtaSIgfSwNCisJeyAu
aWQgPSAianBnZGVjIiB9LA0KK307DQorDQogc3RhdGljIGludCBtdGtfanBlZ19jbGtfaW5pdChz
dHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnKQ0KIHsNCiAJc3RydWN0IGRldmljZV9ub2RlICpub2Rl
Ow0KIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KKwlpbnQgcmV0Ow0KIA0KIAlub2Rl
ID0gb2ZfcGFyc2VfcGhhbmRsZShqcGVnLT5kZXYtPm9mX25vZGUsICJtZWRpYXRlayxsYXJiIiwg
MCk7DQogCWlmICghbm9kZSkNCkBAIC05NTIsMTIgKzk1OSwxNSBAQCBzdGF0aWMgaW50IG10a19q
cGVnX2Nsa19pbml0KHN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcpDQogDQogCWpwZWctPmxhcmIg
PSAmcGRldi0+ZGV2Ow0KIA0KLQlqcGVnLT5jbGtfamRlYyA9IGRldm1fY2xrX2dldChqcGVnLT5k
ZXYsICJqcGdkZWMiKTsNCi0JaWYgKElTX0VSUihqcGVnLT5jbGtfamRlYykpDQotCQlyZXR1cm4g
UFRSX0VSUihqcGVnLT5jbGtfamRlYyk7DQorCWpwZWctPmNsa3MgPSBtdDgxNzNfanBlZ19kZWNf
Y2xvY2tzOw0KKwlqcGVnLT5udW1fY2xrcyA9IEFSUkFZX1NJWkUobXQ4MTczX2pwZWdfZGVjX2Ns
b2Nrcyk7DQorCXJldCA9IGRldm1fY2xrX2J1bGtfZ2V0KGpwZWctPmRldiwganBlZy0+bnVtX2Ns
a3MsIGpwZWctPmNsa3MpOw0KKwlpZiAocmV0KSB7DQorCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJm
YWlsZWQgdG8gZ2V0IGpwZWcgY2xvY2s6JWRcbiIsIHJldCk7DQorCQlyZXR1cm4gcmV0Ow0KKwl9
DQogDQotCWpwZWctPmNsa19qZGVjX3NtaSA9IGRldm1fY2xrX2dldChqcGVnLT5kZXYsICJqcGdk
ZWMtc21pIik7DQotCXJldHVybiBQVFJfRVJSX09SX1pFUk8oanBlZy0+Y2xrX2pkZWNfc21pKTsN
CisJcmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIG10a19qcGVnX2pvYl90aW1lb3V0X3dv
cmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCmluZGV4IDRjNzZhOWRjYzRiNy4uYTU0ZTFlODJl
NjU1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19jb3JlLmgNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdf
Y29yZS5oDQpAQCAtNTIsOCArNTIsOCBAQCBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogICog
QGFsbG9jX2N0eDoJCXZpZGVvYnVmMiBtZW1vcnkgYWxsb2NhdG9yJ3MgY29udGV4dA0KICAqIEBk
ZWNfdmRldjoJCXZpZGVvIGRldmljZSBub2RlIGZvciBkZWNvZGVyIG1lbTJtZW0gbW9kZQ0KICAq
IEBkZWNfcmVnX2Jhc2U6CUpQRUcgcmVnaXN0ZXJzIG1hcHBpbmcNCi0gKiBAY2xrX2pkZWM6CQlK
UEVHIGh3IHdvcmtpbmcgY2xvY2sNCi0gKiBAY2xrX2pkZWNfc21pOglKUEVHIFNNSSBidXMgY2xv
Y2sNCisgKiBAY2xrczoJCWNsb2NrIG5hbWVzDQorICogQG51bV9jbGtzOgkJbnVtYmVycyBvZiBj
bG9jaw0KICAqIEBsYXJiOgkJU01JIGRldmljZQ0KICAqIEBqb2JfdGltZW91dF93b3JrOglJUlEg
dGltZW91dCBzdHJ1Y3R1cmUNCiAgKi8NCkBAIC02Nyw4ICs2Nyw4IEBAIHN0cnVjdCBtdGtfanBl
Z19kZXYgew0KIAl2b2lkCQkJKmFsbG9jX2N0eDsNCiAJc3RydWN0IHZpZGVvX2RldmljZQkqZGVj
X3ZkZXY7DQogCXZvaWQgX19pb21lbQkJKmRlY19yZWdfYmFzZTsNCi0Jc3RydWN0IGNsawkJKmNs
a19qZGVjOw0KLQlzdHJ1Y3QgY2xrCQkqY2xrX2pkZWNfc21pOw0KKwlzdHJ1Y3QgY2xrX2J1bGtf
ZGF0YSAqY2xrczsNCisJaW50IG51bV9jbGtzOw0KIAlzdHJ1Y3QgZGV2aWNlCQkqbGFyYjsNCiAJ
c3RydWN0IGRlbGF5ZWRfd29yayBqb2JfdGltZW91dF93b3JrOw0KIH07DQotLSANCjIuMTguMA0K

