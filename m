Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE9D29E04E
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 02:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733177AbgJ2BTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Oct 2020 21:19:18 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:59200 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730069AbgJ2BRj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Oct 2020 21:17:39 -0400
X-UUID: 73a8b9dd3eb04b4ca68919ee44e74dfa-20201029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=twT+r5b5fxyEgKPFMU6gXc8bZs5Mwk3ZxfFWSI7c33Q=;
        b=aAlerXkCRKGEwbQ8NukTm+uRpER7Li4/ilkfZdfczcduNVEmyC5M8ZgnftIT3jpEtw4tyeWcNn7X4qgJg/BEGRgDTKvPcErgFy3JoHMlV3D7iqseVSV/KAWx4t0nGDTEzJfRrbxuyUEPzZrZPi4gKuv/xHlATLae3bcm05BNCPI=;
X-UUID: 73a8b9dd3eb04b4ca68919ee44e74dfa-20201029
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 369329086; Thu, 29 Oct 2020 09:17:33 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 09:17:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 09:17:30 +0800
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
Subject: [PATCH 2/2] media: mtk-vpu: dump VPU status when IPI times out
Date:   Thu, 29 Oct 2020 09:17:21 +0800
Message-ID: <20201029011721.6705-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029011721.6705-1-irui.wang@mediatek.com>
References: <20201029011721.6705-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

d2hlbiBJUEkgdGltZSBvdXQsIGR1bXAgVlBVIHN0YXR1cyB0byBnZXQgbW9yZSBkZWJ1ZyBpbmZv
cm1hdGlvbg0KDQpTaWduZWQtb2ZmLWJ5OiBJcnVpIFdhbmcgPGlydWkud2FuZ0BtZWRpYXRlay5j
b20+DQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jIHwgMzMg
KysrKysrKysrKysrKysrKysrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12cHUvbXRrX3ZwdS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192
cHUuYw0KaW5kZXggODZhYjgwOGJhODc3Li4wNDM4OTRmNzE4OGMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQorKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jDQpAQCAtNjEsNiArNjEsOCBAQA0KICNkZWZpbmUg
VlBVX0lETEVfUkVHCQkweDAwMkMNCiAjZGVmaW5lIFZQVV9JTlRfU1RBVFVTCQkweDAwMzQNCiAj
ZGVmaW5lIFZQVV9QQ19SRUcJCTB4MDA2MA0KKyNkZWZpbmUgVlBVX1NQX1JFRwkJMHgwMDY0DQor
I2RlZmluZSBWUFVfUkFfUkVHCQkweDAwNjgNCiAjZGVmaW5lIFZQVV9XRFRfUkVHCQkweDAwODQN
CiANCiAvKiB2cHUgaW50ZXItcHJvY2Vzc29yIGNvbW11bmljYXRpb24gaW50ZXJydXB0ICovDQpA
QCAtMjY4LDYgKzI3MCwyMCBAQCBzdGF0aWMgaW50IHZwdV9jbG9ja19lbmFibGUoc3RydWN0IG10
a192cHUgKnZwdSkNCiAJcmV0dXJuIHJldDsNCiB9DQogDQorc3RhdGljIHZvaWQgdnB1X2R1bXBf
c3RhdHVzKHN0cnVjdCBtdGtfdnB1ICp2cHUpDQorew0KKwlkZXZfaW5mbyh2cHUtPmRldiwNCisJ
CSAidnB1OiBydW4gJXgsIHBjID0gMHgleCwgcmEgPSAweCV4LCBzcCA9IDB4JXgsIGlkbGUgPSAw
eCV4XG4iDQorCQkgInZwdTogaW50ICV4LCBodiA9IDB4JXgsIHZoID0gMHgleCwgd2R0ID0gMHgl
eFxuIiwNCisJCSB2cHVfcnVubmluZyh2cHUpLCB2cHVfY2ZnX3JlYWRsKHZwdSwgVlBVX1BDX1JF
RyksDQorCQkgdnB1X2NmZ19yZWFkbCh2cHUsIFZQVV9SQV9SRUcpLCB2cHVfY2ZnX3JlYWRsKHZw
dSwgVlBVX1NQX1JFRyksDQorCQkgdnB1X2NmZ19yZWFkbCh2cHUsIFZQVV9JRExFX1JFRyksDQor
CQkgdnB1X2NmZ19yZWFkbCh2cHUsIFZQVV9JTlRfU1RBVFVTKSwNCisJCSB2cHVfY2ZnX3JlYWRs
KHZwdSwgSE9TVF9UT19WUFUpLA0KKwkJIHZwdV9jZmdfcmVhZGwodnB1LCBWUFVfVE9fSE9TVCks
DQorCQkgdnB1X2NmZ19yZWFkbCh2cHUsIFZQVV9XRFRfUkVHKSk7DQorfQ0KKw0KIGludCB2cHVf
aXBpX3JlZ2lzdGVyKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsDQogCQkgICAgIGVudW0g
aXBpX2lkIGlkLCBpcGlfaGFuZGxlcl90IGhhbmRsZXIsDQogCQkgICAgIGNvbnN0IGNoYXIgKm5h
bWUsIHZvaWQgKnByaXYpDQpAQCAtMzI4LDYgKzM0NCw3IEBAIGludCB2cHVfaXBpX3NlbmQoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCiAJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRp
bWVvdXQpKSB7DQogCQkJZGV2X2Vycih2cHUtPmRldiwgInZwdV9pcGlfc2VuZDogSVBJIHRpbWVv
dXQhXG4iKTsNCiAJCQlyZXQgPSAtRUlPOw0KKwkJCXZwdV9kdW1wX3N0YXR1cyh2cHUpOw0KIAkJ
CWdvdG8gbXV0X3VubG9jazsNCiAJCX0NCiAJfSB3aGlsZSAodnB1X2NmZ19yZWFkbCh2cHUsIEhP
U1RfVE9fVlBVKSk7DQpAQCAtMzQ3LDggKzM2NCw5IEBAIGludCB2cHVfaXBpX3NlbmQoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldiwNCiAJcmV0ID0gd2FpdF9ldmVudF90aW1lb3V0KHZwdS0+
YWNrX3dxLCB2cHUtPmlwaV9pZF9hY2tbaWRdLCB0aW1lb3V0KTsNCiAJdnB1LT5pcGlfaWRfYWNr
W2lkXSA9IGZhbHNlOw0KIAlpZiAocmV0ID09IDApIHsNCi0JCWRldl9lcnIodnB1LT5kZXYsICJ2
cHUgaXBpICVkIGFjayB0aW1lIG91dCAhIiwgaWQpOw0KKwkJZGV2X2Vycih2cHUtPmRldiwgInZw
dSBpcGkgJWQgYWNrIHRpbWUgb3V0ICFcbiIsIGlkKTsNCiAJCXJldCA9IC1FSU87DQorCQl2cHVf
ZHVtcF9zdGF0dXModnB1KTsNCiAJCWdvdG8gY2xvY2tfZGlzYWJsZTsNCiAJfQ0KIAl2cHVfY2xv
Y2tfZGlzYWJsZSh2cHUpOw0KQEAgLTYzMyw3ICs2NTEsNyBAQCBzdGF0aWMgc3NpemVfdCB2cHVf
ZGVidWdfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIgKnVzZXJfYnVmLA0KIHsN
CiAJY2hhciBidWZbMjU2XTsNCiAJdW5zaWduZWQgaW50IGxlbjsNCi0JdW5zaWduZWQgaW50IHJ1
bm5pbmcsIHBjLCB2cHVfdG9faG9zdCwgaG9zdF90b192cHUsIHdkdDsNCisJdW5zaWduZWQgaW50
IHJ1bm5pbmcsIHBjLCB2cHVfdG9faG9zdCwgaG9zdF90b192cHUsIHdkdCwgaWRsZSwgcmEsIHNw
Ow0KIAlpbnQgcmV0Ow0KIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBmaWxlLT5wcml2YXRlX2RhdGE7
DQogCXN0cnVjdCBtdGtfdnB1ICp2cHUgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCkBAIC02NTAs
NiArNjY4LDEwIEBAIHN0YXRpYyBzc2l6ZV90IHZwdV9kZWJ1Z19yZWFkKHN0cnVjdCBmaWxlICpm
aWxlLCBjaGFyIF9fdXNlciAqdXNlcl9idWYsDQogCXdkdCA9IHZwdV9jZmdfcmVhZGwodnB1LCBW
UFVfV0RUX1JFRyk7DQogCWhvc3RfdG9fdnB1ID0gdnB1X2NmZ19yZWFkbCh2cHUsIEhPU1RfVE9f
VlBVKTsNCiAJdnB1X3RvX2hvc3QgPSB2cHVfY2ZnX3JlYWRsKHZwdSwgVlBVX1RPX0hPU1QpOw0K
KwlyYSA9IHZwdV9jZmdfcmVhZGwodnB1LCBWUFVfUkFfUkVHKTsNCisJc3AgPSB2cHVfY2ZnX3Jl
YWRsKHZwdSwgVlBVX1NQX1JFRyk7DQorCWlkbGUgPSB2cHVfY2ZnX3JlYWRsKHZwdSwgVlBVX0lE
TEVfUkVHKTsNCisNCiAJdnB1X2Nsb2NrX2Rpc2FibGUodnB1KTsNCiANCiAJaWYgKHJ1bm5pbmcp
IHsNCkBAIC02NTgsOSArNjgwLDEyIEBAIHN0YXRpYyBzc2l6ZV90IHZwdV9kZWJ1Z19yZWFkKHN0
cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqdXNlcl9idWYsDQogCQkiUEM6IDB4JXhcbiIN
CiAJCSJXRFQ6IDB4JXhcbiINCiAJCSJIb3N0IHRvIFZQVTogMHgleFxuIg0KLQkJIlZQVSB0byBI
b3N0OiAweCV4XG4iLA0KKwkJIlZQVSB0byBIb3N0OiAweCV4XG4iDQorCQkiU1A6IDB4JXhcbiIN
CisJCSJSQTogMHgleFxuIg0KKwkJImlkbGU6IDB4JXhcbiIsDQogCQl2cHUtPnJ1bi5md192ZXIs
IHBjLCB3ZHQsDQotCQlob3N0X3RvX3ZwdSwgdnB1X3RvX2hvc3QpOw0KKwkJaG9zdF90b192cHUs
IHZwdV90b19ob3N0LCBzcCwgcmEsIGlkbGUpOw0KIAl9IGVsc2Ugew0KIAkJbGVuID0gc25wcmlu
dGYoYnVmLCBzaXplb2YoYnVmKSwgIlZQVSBub3QgcnVubmluZ1xuIik7DQogCX0NCi0tIA0KMi4y
NS4xDQo=

