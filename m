Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0F2190E07
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 13:48:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbgCXMsx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 08:48:53 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:64123 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727323AbgCXMsx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 08:48:53 -0400
X-UUID: 3f55144b779c472bbd3c960727b4aeab-20200324
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dPrwEORYxiJbRkftSzBHfBY2aV9JKjm3BUQRpBuvvv4=;
        b=EtIkbkmzyuLGenVOcV+TzYXpdxV5qx+H+OSgFOXNLnhV0hA1iuU+OC7sbvzXgfMEoBTJim20syBhXLW5C8ns16Z6teP+Q8guCMaRXfsgcyF1boKMKvDqCuLIdat1L6kqoSTgmN1PANXP7gCgS0JS8Z9s3EEsDT24aybNex7EVP0=;
X-UUID: 3f55144b779c472bbd3c960727b4aeab-20200324
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1946592548; Tue, 24 Mar 2020 20:48:49 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Mar 2020 20:48:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Mar 2020 20:48:46 +0800
From:   <gtk_ruiwang@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Erin Lo <erin.lo@mediatek.com>, Sj Huang <sj.huang@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <gtk_ruiwang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v2] media: mtk-vpu: load vpu firmware from the new location
Date:   Tue, 24 Mar 2020 20:48:49 +0800
Message-ID: <20200324124849.9490-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogUnVpIFdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCg0KbXQ4MTczIFZQVSBm
aXJtd2FyZSBoYXMgYmVlbiBtb3ZlZCB0byBhIHN1Yi1mb2xkZXIgb2YNCmxpbnV4LWZpcm13YXJl
LCBzbyBsb2FkIHZwdS1mdyBmcm9tIHRoZSBuZXcgbG9jYXRpb24gZmlyc3QsDQppZiBpdCBmYWls
cywgdGhlbiBmcm9tIHRoZSBvbGQgb25lLg0KDQpTaWduZWQtb2ZmLWJ5OiBSdWkgV2FuZyA8Z3Rr
X3J1aXdhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQpDaGFuZ2VkIGluIHYyOg0KLSByZXNsb3ZlIFdh
cm5pbmc6IE1pc3NpbmcgU09CIG5vbWluYWwgcGF0Y2ggYXV0aG9yDQotLS0NCiBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay12cHUvbXRrX3ZwdS5jIHwgMTYgKysrKysrKysrKysrKy0tLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCmluZGV4IGE3Njg3MDdhYmI5NC4uODky
NzQ4NDJlMDdiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210
a192cHUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdnB1L210a192cHUuYw0K
QEAgLTQ2LDYgKzQ2LDggQEANCiAvKiBiaW5hcnkgZmlybXdhcmUgbmFtZSAqLw0KICNkZWZpbmUg
VlBVX1BfRlcJCSJ2cHVfcC5iaW4iDQogI2RlZmluZSBWUFVfRF9GVwkJInZwdV9kLmJpbiINCisj
ZGVmaW5lIFZQVV9QX0ZXX05FVwkJIm1lZGlhdGVrL210ODE3My92cHVfcC5iaW4iDQorI2RlZmlu
ZSBWUFVfRF9GV19ORVcJCSJtZWRpYXRlay9tdDgxNzMvdnB1X2QuYmluIg0KIA0KICNkZWZpbmUg
VlBVX1JFU0VUCQkweDANCiAjZGVmaW5lIFZQVV9UQ01fQ0ZHCQkweDAwMDgNCkBAIC00NzcsMTYg
KzQ3OSwyNCBAQCBzdGF0aWMgaW50IGxvYWRfcmVxdWVzdGVkX3ZwdShzdHJ1Y3QgbXRrX3ZwdSAq
dnB1LA0KIAlzaXplX3QgdGNtX3NpemUgPSBmd190eXBlID8gVlBVX0RUQ01fU0laRSA6IFZQVV9Q
VENNX1NJWkU7DQogCXNpemVfdCBmd19zaXplID0gZndfdHlwZSA/IFZQVV9EX0ZXX1NJWkUgOiBW
UFVfUF9GV19TSVpFOw0KIAljaGFyICpmd19uYW1lID0gZndfdHlwZSA/IFZQVV9EX0ZXIDogVlBV
X1BfRlc7DQorCWNoYXIgKmZ3X25ld19uYW1lID0gZndfdHlwZSA/IFZQVV9EX0ZXX05FVyA6IFZQ
VV9QX0ZXX05FVzsNCiAJY29uc3Qgc3RydWN0IGZpcm13YXJlICp2cHVfZnc7DQogCXNpemVfdCBk
bF9zaXplID0gMDsNCiAJc2l6ZV90IGV4dHJhX2Z3X3NpemUgPSAwOw0KIAl2b2lkICpkZXN0Ow0K
IAlpbnQgcmV0Ow0KIA0KLQlyZXQgPSByZXF1ZXN0X2Zpcm13YXJlKCZ2cHVfZncsIGZ3X25hbWUs
IHZwdS0+ZGV2KTsNCisJcmV0ID0gcmVxdWVzdF9maXJtd2FyZSgmdnB1X2Z3LCBmd19uZXdfbmFt
ZSwgdnB1LT5kZXYpOw0KIAlpZiAocmV0IDwgMCkgew0KLQkJZGV2X2Vycih2cHUtPmRldiwgIkZh
aWxlZCB0byBsb2FkICVzLCAlZFxuIiwgZndfbmFtZSwgcmV0KTsNCi0JCXJldHVybiByZXQ7DQor
CQlkZXZfaW5mbyh2cHUtPmRldiwgIkZhaWxlZCB0byBsb2FkICVzLCAlZCwgcmV0cnlcbiIsDQor
CQkJIGZ3X25ld19uYW1lLCByZXQpOw0KKw0KKwkJcmV0ID0gcmVxdWVzdF9maXJtd2FyZSgmdnB1
X2Z3LCBmd19uYW1lLCB2cHUtPmRldik7DQorCQlpZiAocmV0IDwgMCkgew0KKwkJCWRldl9lcnIo
dnB1LT5kZXYsICJGYWlsZWQgdG8gbG9hZCAlcywgJWRcbiIsIGZ3X25hbWUsDQorCQkJCXJldCk7
DQorCQkJcmV0dXJuIHJldDsNCisJCX0NCiAJfQ0KIAlkbF9zaXplID0gdnB1X2Z3LT5zaXplOw0K
IAlpZiAoZGxfc2l6ZSA+IGZ3X3NpemUpIHsNCi0tIA0KMi4xOC4wDQo=

