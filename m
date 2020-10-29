Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD5129E04F
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 02:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732657AbgJ2BTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 21:19:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59127 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730673AbgJ2BRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 21:17:39 -0400
X-UUID: e1df620a5ca445cd8876ff682671fcaf-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ujdVt5VMrFd483ldP8ff6NTFRc237VrH06AfNH0Wzx8=;
        b=cB5wv06C6bAjln7t01d6gCkootzuL8rbhKGnJGv6FsFxCShp4IXLUWqRD/o0EMYQgsiAKWKlBni3XSpUWj9R/nEGW7bhRSCXdXRkJHfsuXH7mvqwsULH0jyaNhZzHBifSGMF62NgdEp+Dd+qB50fTbfRh7SM+atExCjNahKLj1c=;
X-UUID: e1df620a5ca445cd8876ff682671fcaf-20201029
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 160379466; Thu, 29 Oct 2020 09:17:26 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 09:17:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 09:17:23 +0800
From:   Irui Wang <irui.wang@mediatek.com>
To:     <hverkuil@xs4all.nl>, <acourbot@chromium.org>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC:     <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <Maoguang.Meng@mediatek.com>,
        <Longfei.Wang@mediatek.com>, <Yunfei.Dong@mediatek.com>,
        <Andrew-CT.Chen@mediatek.com>, <erin.lo@mediatek.com>,
        <PoChun.Lin@mediatek.com>, <houlong.wei@mediatek.com>,
        <hsinyi@google.com>, <irui.wang@mediatek.com>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH 1/2] media: mtk-vpu: VPU should be in idle state before system is suspended
Date:   Thu, 29 Oct 2020 09:17:20 +0800
Message-ID: <20201029011721.6705-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VlBVIHNob3VsZCBiZSBpbiBpZGxlIHN0YXRlIGJlZm9yZSBzeXN0ZW0gaXMgc3VzcGVuZGVkDQpv
ciBpdCB3aWxsIHdvcmsgYWJub3JtYWxseSBsaWtlIFZQVSBwcm9ncmFtIGNvdW50ZXIgbm90DQpp
biBhIGNvcnJlY3QgYWRkcmVzcyBvciBWUFUgcmVzZXQNCg0KU2lnbmVkLW9mZi1ieTogSXJ1aSBX
YW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstdnB1L210a192cHUuYyB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dnB1L210a192cHUuYw0KaW5kZXggMzZjYjliNjEzMWY3Li44NmFiODA4YmE4NzcgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQorKysgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQpAQCAtMjcsNiArMjcsNyBAQA0K
IA0KICNkZWZpbmUgSU5JVF9USU1FT1VUX01TCQkyMDAwVQ0KICNkZWZpbmUgSVBJX1RJTUVPVVRf
TVMJCTIwMDBVDQorI2RlZmluZSBWUFVfSURMRV9USU1FT1VUX01TCTEwMDBVDQogI2RlZmluZSBW
UFVfRldfVkVSX0xFTgkJMTYNCiANCiAvKiBtYXhpbXVtIHByb2dyYW0vZGF0YSBUQ00gKFRpZ2h0
bHktQ291cGxlZCBNZW1vcnkpIHNpemUgKi8NCkBAIC01NywxMSArNTgsMTUgQEANCiAjZGVmaW5l
IFZQVV9ETUVNX0VYVDBfQUREUgkweDAwMTQNCiAjZGVmaW5lIFZQVV9ETUVNX0VYVDFfQUREUgkw
eDAwMTgNCiAjZGVmaW5lIEhPU1RfVE9fVlBVCQkweDAwMjQNCisjZGVmaW5lIFZQVV9JRExFX1JF
RwkJMHgwMDJDDQorI2RlZmluZSBWUFVfSU5UX1NUQVRVUwkJMHgwMDM0DQogI2RlZmluZSBWUFVf
UENfUkVHCQkweDAwNjANCiAjZGVmaW5lIFZQVV9XRFRfUkVHCQkweDAwODQNCiANCiAvKiB2cHUg
aW50ZXItcHJvY2Vzc29yIGNvbW11bmljYXRpb24gaW50ZXJydXB0ICovDQogI2RlZmluZSBWUFVf
SVBDX0lOVAkJQklUKDgpDQorLyogdnB1IGlkbGUgc3RhdGUgKi8NCisjZGVmaW5lIFZQVV9JRExF
X1NUQVRFCQlCSVQoMjMpDQogDQogLyoqDQogICogZW51bSB2cHVfZndfdHlwZSAtIFZQVSBmaXJt
d2FyZSB0eXBlDQpAQCAtOTQ1LDExICs5NTAsNzQgQEAgc3RhdGljIGludCBtdGtfdnB1X3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3Rh
dGljIGludCBtdGtfdnB1X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0KK3sNCisJc3RydWN0
IG10a192cHUgKnZwdSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KKwl1bnNpZ25lZCBsb25nIHRp
bWVvdXQ7DQorCWludCByZXQ7DQorDQorCXJldCA9IHZwdV9jbG9ja19lbmFibGUodnB1KTsNCisJ
aWYgKHJldCkgew0KKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIHZwdSBjbG9ja1xu
Iik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCW11dGV4X2xvY2soJnZwdS0+dnB1X211dGV4
KTsNCisJLyogZGlzYWJsZSB2cHUgdGltZXIgaW50ZXJydXB0ICovDQorCXZwdV9jZmdfd3JpdGVs
KHZwdSwgdnB1X2NmZ19yZWFkbCh2cHUsIFZQVV9JTlRfU1RBVFVTKSB8IFZQVV9JRExFX1NUQVRF
LA0KKwkJICAgICAgIFZQVV9JTlRfU1RBVFVTKTsNCisJLyogY2hlY2sgaWYgdnB1IGlzIGlkbGUg
Zm9yIHN5c3RlbSBzdXNwZW5kICovDQorCXRpbWVvdXQgPSBqaWZmaWVzICsgbXNlY3NfdG9famlm
ZmllcyhWUFVfSURMRV9USU1FT1VUX01TKTsNCisJZG8gew0KKwkJaWYgKHRpbWVfYWZ0ZXIoamlm
ZmllcywgdGltZW91dCkpIHsNCisJCQlkZXZfZXJyKGRldiwgInZwdSBpZGxlIHRpbWVvdXRcbiIp
Ow0KKwkJCW11dGV4X3VubG9jaygmdnB1LT52cHVfbXV0ZXgpOw0KKwkJCXZwdV9jbG9ja19kaXNh
YmxlKHZwdSk7DQorCQkJcmV0dXJuIC1FSU87DQorCQl9DQorCX0gd2hpbGUgKCF2cHVfY2ZnX3Jl
YWRsKHZwdSwgVlBVX0lETEVfUkVHKSk7DQorDQorCW11dGV4X3VubG9jaygmdnB1LT52cHVfbXV0
ZXgpOw0KKwl2cHVfY2xvY2tfZGlzYWJsZSh2cHUpOw0KKwljbGtfdW5wcmVwYXJlKHZwdS0+Y2xr
KTsNCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgbXRrX3ZwdV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KK3sNCisJc3RydWN0IG10a192cHUgKnZwdSA9IGRldl9nZXRfZHJ2
ZGF0YShkZXYpOw0KKwlpbnQgcmV0Ow0KKw0KKwljbGtfcHJlcGFyZSh2cHUtPmNsayk7DQorCXJl
dCA9IHZwdV9jbG9ja19lbmFibGUodnB1KTsNCisJaWYgKHJldCkgew0KKwkJZGV2X2VycihkZXYs
ICJmYWlsZWQgdG8gZW5hYmxlIHZwdSBjbG9ja1xuIik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQor
DQorCW11dGV4X2xvY2soJnZwdS0+dnB1X211dGV4KTsNCisJLyogZW5hYmxlIHZwdSB0aW1lciBp
bnRlcnJ1cHQgKi8NCisJdnB1X2NmZ193cml0ZWwodnB1LA0KKwkJICAgICAgIHZwdV9jZmdfcmVh
ZGwodnB1LCBWUFVfSU5UX1NUQVRVUykgJiB+KFZQVV9JRExFX1NUQVRFKSwNCisJCSAgICAgICBW
UFVfSU5UX1NUQVRVUyk7DQorCW11dGV4X3VubG9jaygmdnB1LT52cHVfbXV0ZXgpOw0KKwl2cHVf
Y2xvY2tfZGlzYWJsZSh2cHUpOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGNvbnN0
IHN0cnVjdCBkZXZfcG1fb3BzIG10a192cHVfcG0gPSB7DQorCS5zdXNwZW5kID0gbXRrX3ZwdV9z
dXNwZW5kLA0KKwkucmVzdW1lID0gbXRrX3ZwdV9yZXN1bWUsDQorfTsNCisNCiBzdGF0aWMgc3Ry
dWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfdnB1X2RyaXZlciA9IHsNCiAJLnByb2JlCT0gbXRrX3Zw
dV9wcm9iZSwNCiAJLnJlbW92ZQk9IG10a192cHVfcmVtb3ZlLA0KIAkuZHJpdmVyCT0gew0KIAkJ
Lm5hbWUJPSAibXRrX3ZwdSIsDQorCQkucG0gPSAmbXRrX3ZwdV9wbSwNCiAJCS5vZl9tYXRjaF90
YWJsZSA9IG10a192cHVfbWF0Y2gsDQogCX0sDQogfTsNCi0tIA0KMi4yNS4xDQo=

