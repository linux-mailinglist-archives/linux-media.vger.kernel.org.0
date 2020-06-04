Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B851EDE46
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbgFDH3e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:29:34 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:2854 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728082AbgFDH3c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:32 -0400
X-UUID: 9bfaac2ad71347b680132c77002fca6c-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HJ9S6rma+vnVa5gCVUNR3+hSMzVhPDu4Fw67Ls/8Gl8=;
        b=NzJSIF5bN+da1jo14qB36TQHxrJ0uZwJbrLQiHG+FIxt5Az2I1UJPQbJVZHvshuctE8g4QiiB/6DC4CLdgNmntIZJ+27AF9ZJX28Sp18ahX2JNvSpmp17adZ6VixeQlQv6i4TeFxIWQs41wN2lHnxg6kCFn1NsSryppjd3YYQvE=;
X-UUID: 9bfaac2ad71347b680132c77002fca6c-20200604
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 869931923; Thu, 04 Jun 2020 15:29:28 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:26 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:24 +0800
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
Subject: [PATCH v9 10/18] media: platform: Stylistic changes for improving code quality
Date:   Thu, 4 Jun 2020 15:27:00 +0800
Message-ID: <20200604072708.9468-11-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Q2hhbmdlIHJlZ2lzdGVyIG9mZnNldCBoZXggbnVtZXJhbHMgZnJvbSB1cHBlcmNhc2UgdG8gbG93
ZXJjYXNlLg0KQ2hhbmdlIGRhdGEgdHlwZSBvZiBtYXgvbWluIHdpZHRoL2hlaWdodCBmcm9tIGlu
dGVnZXIgdG8gdW5zaWduZWQNCmludGVnZXIuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8
eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0Kdjk6IG1vdmUgY2hhbmdpbmcgZGF0YSB0eXBl
IG9mIG1heC9taW4gd2lkdGgvaGVpZ2h0IHRvIHRoaXMgcGF0Y2gNCi0tLQ0KIC4uLi9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmggICAgfCAgOCArKysrLS0tLQ0KIGRyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmggfCAxOCArKysrKysrKyst
LS0tLS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtf
anBlZ19jb3JlLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2Nv
cmUuaA0KaW5kZXggOTk5YmQxNDI3ODA5Li4yOGU5YjMwYWQ1YzMgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCkBAIC0yMSwxMCArMjEs
MTAgQEANCiAjZGVmaW5lIE1US19KUEVHX0ZNVF9UWVBFX09VVFBVVAkxDQogI2RlZmluZSBNVEtf
SlBFR19GTVRfVFlQRV9DQVBUVVJFCTINCiANCi0jZGVmaW5lIE1US19KUEVHX01JTl9XSURUSAkz
Mg0KLSNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkzMg0KLSNkZWZpbmUgTVRLX0pQRUdfTUFY
X1dJRFRICTgxOTINCi0jZGVmaW5lIE1US19KUEVHX01BWF9IRUlHSFQJODE5Mg0KKyNkZWZpbmUg
TVRLX0pQRUdfTUlOX1dJRFRICTMyVQ0KKyNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkzMlUN
CisjZGVmaW5lIE1US19KUEVHX01BWF9XSURUSAk4MTkyVQ0KKyNkZWZpbmUgTVRLX0pQRUdfTUFY
X0hFSUdIVAk4MTkyVQ0KIA0KICNkZWZpbmUgTVRLX0pQRUdfREVGQVVMVF9TSVpFSU1BR0UJKDEg
KiAxMDI0ICogMTAyNCkNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX3JlZy5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19yZWcuaA0KaW5kZXggOTRkYjA0ZTljZGI2Li4yOTQ1ZGE4NDJkZmEgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQpAQCAtMjAs
MjkgKzIwLDI5IEBADQogI2RlZmluZSBCSVRfSU5RU1RfTUFTS19BTExJUlEJCTB4MzcNCiANCiAj
ZGVmaW5lIEpQR0RFQ19SRUdfUkVTRVQJCTB4MDA5MA0KLSNkZWZpbmUgSlBHREVDX1JFR19CUlpf
RkFDVE9SCQkweDAwRjgNCi0jZGVmaW5lIEpQR0RFQ19SRUdfRFVfTlVNCQkweDAwRkMNCisjZGVm
aW5lIEpQR0RFQ19SRUdfQlJaX0ZBQ1RPUgkJMHgwMGY4DQorI2RlZmluZSBKUEdERUNfUkVHX0RV
X05VTQkJMHgwMGZjDQogI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjBfWQkJMHgwMTQwDQog
I2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjBfVQkJMHgwMTQ0DQogI2RlZmluZSBKUEdERUNf
UkVHX0RFU1RfQUREUjBfVgkJMHgwMTQ4DQotI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFf
WQkJMHgwMTRDDQorI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfWQkJMHgwMTRjDQogI2Rl
ZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfVQkJMHgwMTUwDQogI2RlZmluZSBKUEdERUNfUkVH
X0RFU1RfQUREUjFfVgkJMHgwMTU0DQogI2RlZmluZSBKUEdERUNfUkVHX1NUUklERV9ZCQkweDAx
NTgNCi0jZGVmaW5lIEpQR0RFQ19SRUdfU1RSSURFX1VWCQkweDAxNUMNCisjZGVmaW5lIEpQR0RF
Q19SRUdfU1RSSURFX1VWCQkweDAxNWMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfSU1HX1NUUklERV9Z
CQkweDAxNjANCiAjZGVmaW5lIEpQR0RFQ19SRUdfSU1HX1NUUklERV9VVgkweDAxNjQNCi0jZGVm
aW5lIEpQR0RFQ19SRUdfV0RNQV9DVFJMCQkweDAxNkMNCisjZGVmaW5lIEpQR0RFQ19SRUdfV0RN
QV9DVFJMCQkweDAxNmMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfUEFVU0VfTUNVX05VTQkweDAxNzAN
Ci0jZGVmaW5lIEpQR0RFQ19SRUdfT1BFUkFUSU9OX01PREUJMHgwMTdDDQorI2RlZmluZSBKUEdE
RUNfUkVHX09QRVJBVElPTl9NT0RFCTB4MDE3Yw0KICNkZWZpbmUgSlBHREVDX1JFR19GSUxFX0FE
RFIJCTB4MDIwMA0KLSNkZWZpbmUgSlBHREVDX1JFR19DT01QX0lECQkweDAyMEMNCisjZGVmaW5l
IEpQR0RFQ19SRUdfQ09NUF9JRAkJMHgwMjBjDQogI2RlZmluZSBKUEdERUNfUkVHX1RPVEFMX01D
VV9OVU0JMHgwMjEwDQogI2RlZmluZSBKUEdERUNfUkVHX0NPTVAwX0RBVEFfVU5JVF9OVU0JMHgw
MjI0DQotI2RlZmluZSBKUEdERUNfUkVHX0RVX0NUUkwJCTB4MDIzQw0KKyNkZWZpbmUgSlBHREVD
X1JFR19EVV9DVFJMCQkweDAyM2MNCiAjZGVmaW5lIEpQR0RFQ19SRUdfVFJJRwkJCTB4MDI0MA0K
ICNkZWZpbmUgSlBHREVDX1JFR19GSUxFX0JSUAkJMHgwMjQ4DQotI2RlZmluZSBKUEdERUNfUkVH
X0ZJTEVfVE9UQUxfU0laRQkweDAyNEMNCisjZGVmaW5lIEpQR0RFQ19SRUdfRklMRV9UT1RBTF9T
SVpFCTB4MDI0Yw0KICNkZWZpbmUgSlBHREVDX1JFR19RVF9JRAkJMHgwMjcwDQogI2RlZmluZSBK
UEdERUNfUkVHX0lOVEVSUlVQVF9TVEFUVVMJMHgwMjc0DQogI2RlZmluZSBKUEdERUNfUkVHX1NU
QVRVUwkJMHgwMjc4DQotLSANCjIuMTguMA0K

