Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06C6F18E768
	for <lists+linux-media@lfdr.de>; Sun, 22 Mar 2020 08:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgCVH57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Mar 2020 03:57:59 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:60803 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725769AbgCVH57 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Mar 2020 03:57:59 -0400
X-UUID: e8fc1f60d13d4fecb20824b8b5ac1334-20200322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0SlVnuKkPvNl1cm3aUi1MmMi33v297Tf8W2wHp9Pizo=;
        b=m/T+oeODnMdXZQhCkTIr2D164EKWkksrg/KPGUNIqDGIXN6Zjk8uvwt9LV8VNZdeu+djRhrwSW9kSiOAEEaBOvgAQYaNjt8YswWL52dVbrEdhdr5dVpXykqrzo+76DHj8TQ39rrhQAJydadUaudcxA4Ud0l7Z4f/72MB2wDnMYI=;
X-UUID: e8fc1f60d13d4fecb20824b8b5ac1334-20200322
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 507518638; Sun, 22 Mar 2020 15:57:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Mar 2020 15:55:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 22 Mar 2020 15:58:07 +0800
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
Subject: [PATCH] media: mtk-vpu: load vpu firmware from the new location
Date:   Sun, 22 Mar 2020 15:57:45 +0800
Message-ID: <20200322075745.6133-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCg0KbXQ4MTczIFZQ
VSBmaXJtd2FyZSBoYXMgYmVlbiBtb3ZlZCB0byBhIHN1Yi1mb2xkZXIgb2YNCmxpbnV4LWZpcm13
YXJlLCBzbyBsb2FkIHZwdS1mdyBmcm9tIHRoZSBuZXcgbG9jYXRpb24gZmlyc3QsDQppZiBpdCBm
YWlscywgdGhlbiBmcm9tIHRoZSBvbGQgb25lLg0KDQpTaWduZWQtb2ZmLWJ5OiBSdWkgV2FuZyA8
Z3RrX3J1aXdhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdnB1L210a192cHUuYyB8IDE2ICsrKysrKysrKysrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12cHUvbXRrX3ZwdS5jDQppbmRleCBhNzY4NzA3YWJiOTQuLjg5Mjc0ODQyZTA3YiAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCisrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZwdS9tdGtfdnB1LmMNCkBAIC00Niw2ICs0Niw4
IEBADQogLyogYmluYXJ5IGZpcm13YXJlIG5hbWUgKi8NCiAjZGVmaW5lIFZQVV9QX0ZXCQkidnB1
X3AuYmluIg0KICNkZWZpbmUgVlBVX0RfRlcJCSJ2cHVfZC5iaW4iDQorI2RlZmluZSBWUFVfUF9G
V19ORVcJCSJtZWRpYXRlay9tdDgxNzMvdnB1X3AuYmluIg0KKyNkZWZpbmUgVlBVX0RfRldfTkVX
CQkibWVkaWF0ZWsvbXQ4MTczL3ZwdV9kLmJpbiINCiANCiAjZGVmaW5lIFZQVV9SRVNFVAkJMHgw
DQogI2RlZmluZSBWUFVfVENNX0NGRwkJMHgwMDA4DQpAQCAtNDc3LDE2ICs0NzksMjQgQEAgc3Rh
dGljIGludCBsb2FkX3JlcXVlc3RlZF92cHUoc3RydWN0IG10a192cHUgKnZwdSwNCiAJc2l6ZV90
IHRjbV9zaXplID0gZndfdHlwZSA/IFZQVV9EVENNX1NJWkUgOiBWUFVfUFRDTV9TSVpFOw0KIAlz
aXplX3QgZndfc2l6ZSA9IGZ3X3R5cGUgPyBWUFVfRF9GV19TSVpFIDogVlBVX1BfRldfU0laRTsN
CiAJY2hhciAqZndfbmFtZSA9IGZ3X3R5cGUgPyBWUFVfRF9GVyA6IFZQVV9QX0ZXOw0KKwljaGFy
ICpmd19uZXdfbmFtZSA9IGZ3X3R5cGUgPyBWUFVfRF9GV19ORVcgOiBWUFVfUF9GV19ORVc7DQog
CWNvbnN0IHN0cnVjdCBmaXJtd2FyZSAqdnB1X2Z3Ow0KIAlzaXplX3QgZGxfc2l6ZSA9IDA7DQog
CXNpemVfdCBleHRyYV9md19zaXplID0gMDsNCiAJdm9pZCAqZGVzdDsNCiAJaW50IHJldDsNCiAN
Ci0JcmV0ID0gcmVxdWVzdF9maXJtd2FyZSgmdnB1X2Z3LCBmd19uYW1lLCB2cHUtPmRldik7DQor
CXJldCA9IHJlcXVlc3RfZmlybXdhcmUoJnZwdV9mdywgZndfbmV3X25hbWUsIHZwdS0+ZGV2KTsN
CiAJaWYgKHJldCA8IDApIHsNCi0JCWRldl9lcnIodnB1LT5kZXYsICJGYWlsZWQgdG8gbG9hZCAl
cywgJWRcbiIsIGZ3X25hbWUsIHJldCk7DQotCQlyZXR1cm4gcmV0Ow0KKwkJZGV2X2luZm8odnB1
LT5kZXYsICJGYWlsZWQgdG8gbG9hZCAlcywgJWQsIHJldHJ5XG4iLA0KKwkJCSBmd19uZXdfbmFt
ZSwgcmV0KTsNCisNCisJCXJldCA9IHJlcXVlc3RfZmlybXdhcmUoJnZwdV9mdywgZndfbmFtZSwg
dnB1LT5kZXYpOw0KKwkJaWYgKHJldCA8IDApIHsNCisJCQlkZXZfZXJyKHZwdS0+ZGV2LCAiRmFp
bGVkIHRvIGxvYWQgJXMsICVkXG4iLCBmd19uYW1lLA0KKwkJCQlyZXQpOw0KKwkJCXJldHVybiBy
ZXQ7DQorCQl9DQogCX0NCiAJZGxfc2l6ZSA9IHZwdV9mdy0+c2l6ZTsNCiAJaWYgKGRsX3NpemUg
PiBmd19zaXplKSB7DQotLSANCjIuMTguMA0K

