Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457EF22A5CD
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387965AbgGWDHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:07:47 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:27911 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387715AbgGWDG2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:28 -0400
X-UUID: 9a538721d09c4e7d9c6dfd0a74a1033c-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IoKqoQSEzNL0ydDeWJGXDtf1QFwV7E6davdZhiC7qws=;
        b=J+rOBc/iDjtMifd3vfyTMQraOcl0mLnwgxHpU+4ObDiXnRMkvOQdqQ8g5quaYtH/MDGa77e9GIDZ844ubp8+vgcw3BeAtk2ygRTdAEH2J++5FbIp/Ja0C4QnGv5f3CAlLDyc5tHcHdx6KY9zuJKSdnefRIdQNXm74rVPWO2oBJE=;
X-UUID: 9a538721d09c4e7d9c6dfd0a74a1033c-20200723
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 295587754; Thu, 23 Jul 2020 11:06:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:18 +0800
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
Subject: [PATCH v10 11/28] media: platform: Stylistic changes for improving code quality
Date:   Thu, 23 Jul 2020 11:04:34 +0800
Message-ID: <20200723030451.5616-12-xia.jiang@mediatek.com>
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

Q2hhbmdlIHJlZ2lzdGVyIG9mZnNldCBoZXggbnVtZXJhbHMgZnJvbSB1cHBlcmNhc2UgdG8gbG93
ZXJjYXNlLg0KQ2hhbmdlIGRhdGEgdHlwZSBvZiBtYXgvbWluIHdpZHRoL2hlaWdodCBmcm9tIGlu
dGVnZXIgdG8gdW5zaWduZWQNCmludGVnZXIuDQoNClJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8
dGZpZ2FAY2hyb21pdW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4aWEuamlhbmdA
bWVkaWF0ZWsuY29tPg0KLS0tDQp2MTA6IG5vIGNoYW5nZXMNCi0tLQ0KIC4uLi9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmggICAgfCAgOCArKysrLS0tLQ0KIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmggfCAxOCArKysrKysrKystLS0t
LS0tLS0NCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19jb3JlLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
aA0KaW5kZXggMzIwYzRmOGEwMTRhLi5jOWY1MTYyZDI5MjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCkBAIC0yMSwxMCArMjEsMTAg
QEANCiAjZGVmaW5lIE1US19KUEVHX0ZNVF9UWVBFX09VVFBVVAkxDQogI2RlZmluZSBNVEtfSlBF
R19GTVRfVFlQRV9DQVBUVVJFCTINCiANCi0jZGVmaW5lIE1US19KUEVHX01JTl9XSURUSAkzMg0K
LSNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkzMg0KLSNkZWZpbmUgTVRLX0pQRUdfTUFYX1dJ
RFRICTgxOTINCi0jZGVmaW5lIE1US19KUEVHX01BWF9IRUlHSFQJODE5Mg0KKyNkZWZpbmUgTVRL
X0pQRUdfTUlOX1dJRFRICTMyVQ0KKyNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkzMlUNCisj
ZGVmaW5lIE1US19KUEVHX01BWF9XSURUSAk4MTkyVQ0KKyNkZWZpbmUgTVRLX0pQRUdfTUFYX0hF
SUdIVAk4MTkyVQ0KIA0KICNkZWZpbmUgTVRLX0pQRUdfREVGQVVMVF9TSVpFSU1BR0UJKDEgKiAx
MDI0ICogMTAyNCkNCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX3JlZy5oIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtf
anBlZ19yZWcuaA0KaW5kZXggOTRkYjA0ZTljZGI2Li4yOTQ1ZGE4NDJkZmEgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQorKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQpAQCAtMjAsMjkg
KzIwLDI5IEBADQogI2RlZmluZSBCSVRfSU5RU1RfTUFTS19BTExJUlEJCTB4MzcNCiANCiAjZGVm
aW5lIEpQR0RFQ19SRUdfUkVTRVQJCTB4MDA5MA0KLSNkZWZpbmUgSlBHREVDX1JFR19CUlpfRkFD
VE9SCQkweDAwRjgNCi0jZGVmaW5lIEpQR0RFQ19SRUdfRFVfTlVNCQkweDAwRkMNCisjZGVmaW5l
IEpQR0RFQ19SRUdfQlJaX0ZBQ1RPUgkJMHgwMGY4DQorI2RlZmluZSBKUEdERUNfUkVHX0RVX05V
TQkJMHgwMGZjDQogI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjBfWQkJMHgwMTQwDQogI2Rl
ZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjBfVQkJMHgwMTQ0DQogI2RlZmluZSBKUEdERUNfUkVH
X0RFU1RfQUREUjBfVgkJMHgwMTQ4DQotI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfWQkJ
MHgwMTRDDQorI2RlZmluZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfWQkJMHgwMTRjDQogI2RlZmlu
ZSBKUEdERUNfUkVHX0RFU1RfQUREUjFfVQkJMHgwMTUwDQogI2RlZmluZSBKUEdERUNfUkVHX0RF
U1RfQUREUjFfVgkJMHgwMTU0DQogI2RlZmluZSBKUEdERUNfUkVHX1NUUklERV9ZCQkweDAxNTgN
Ci0jZGVmaW5lIEpQR0RFQ19SRUdfU1RSSURFX1VWCQkweDAxNUMNCisjZGVmaW5lIEpQR0RFQ19S
RUdfU1RSSURFX1VWCQkweDAxNWMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfSU1HX1NUUklERV9ZCQkw
eDAxNjANCiAjZGVmaW5lIEpQR0RFQ19SRUdfSU1HX1NUUklERV9VVgkweDAxNjQNCi0jZGVmaW5l
IEpQR0RFQ19SRUdfV0RNQV9DVFJMCQkweDAxNkMNCisjZGVmaW5lIEpQR0RFQ19SRUdfV0RNQV9D
VFJMCQkweDAxNmMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfUEFVU0VfTUNVX05VTQkweDAxNzANCi0j
ZGVmaW5lIEpQR0RFQ19SRUdfT1BFUkFUSU9OX01PREUJMHgwMTdDDQorI2RlZmluZSBKUEdERUNf
UkVHX09QRVJBVElPTl9NT0RFCTB4MDE3Yw0KICNkZWZpbmUgSlBHREVDX1JFR19GSUxFX0FERFIJ
CTB4MDIwMA0KLSNkZWZpbmUgSlBHREVDX1JFR19DT01QX0lECQkweDAyMEMNCisjZGVmaW5lIEpQ
R0RFQ19SRUdfQ09NUF9JRAkJMHgwMjBjDQogI2RlZmluZSBKUEdERUNfUkVHX1RPVEFMX01DVV9O
VU0JMHgwMjEwDQogI2RlZmluZSBKUEdERUNfUkVHX0NPTVAwX0RBVEFfVU5JVF9OVU0JMHgwMjI0
DQotI2RlZmluZSBKUEdERUNfUkVHX0RVX0NUUkwJCTB4MDIzQw0KKyNkZWZpbmUgSlBHREVDX1JF
R19EVV9DVFJMCQkweDAyM2MNCiAjZGVmaW5lIEpQR0RFQ19SRUdfVFJJRwkJCTB4MDI0MA0KICNk
ZWZpbmUgSlBHREVDX1JFR19GSUxFX0JSUAkJMHgwMjQ4DQotI2RlZmluZSBKUEdERUNfUkVHX0ZJ
TEVfVE9UQUxfU0laRQkweDAyNEMNCisjZGVmaW5lIEpQR0RFQ19SRUdfRklMRV9UT1RBTF9TSVpF
CTB4MDI0Yw0KICNkZWZpbmUgSlBHREVDX1JFR19RVF9JRAkJMHgwMjcwDQogI2RlZmluZSBKUEdE
RUNfUkVHX0lOVEVSUlVQVF9TVEFUVVMJMHgwMjc0DQogI2RlZmluZSBKUEdERUNfUkVHX1NUQVRV
UwkJMHgwMjc4DQotLSANCjIuMTguMA0K

