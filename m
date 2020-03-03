Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1BCD177623
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 13:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729391AbgCCMfj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 07:35:39 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:57298 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728565AbgCCMfH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 07:35:07 -0500
X-UUID: 622ff6f04c904130a46c57e334950472-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z5N9h3ZP3DBfqF0Eth6jRlSgWjKGDGeyQ0XnduA9Fgk=;
        b=DNKD3ACufsMNgcZI45uhQLffkqa56ggsPmDAkhPR/zJ/SoIqlF6QADmB5I6Nk0xht+cVQrYiPkbCtKZkfRrZ7KEK8HOen0YLd4UYEP1VJq7sZh76W8C/OAejMcsmH1T0AIXOF/e3aRprAOm5p2hKf3RV7O+X7LRZ8Tjsk8iHtPA=;
X-UUID: 622ff6f04c904130a46c57e334950472-20200303
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1967406519; Tue, 03 Mar 2020 20:35:01 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:41 +0800
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
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v7 05/11] media: platform: Change case for improving code quality
Date:   Tue, 3 Mar 2020 20:34:40 +0800
Message-ID: <20200303123446.20095-6-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200303123446.20095-1-xia.jiang@mediatek.com>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Q2hhbmdlIHJlZ2lzdGVyIG9mZnNldCBoZXggbnVtYmVyYWxzIGZyb20gdXBlcmNhc2UgdG8gbG93
ZXJjYXNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5j
b20+DQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5o
IHwgMTggKysrKysrKysrLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfcmVnLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX3JlZy5oDQppbmRleCA5NGRiMDRlOWNkYjYuLjI5NDVkYTg0MmRmYSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmgNCisr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmgNCkBAIC0y
MCwyOSArMjAsMjkgQEANCiAjZGVmaW5lIEJJVF9JTlFTVF9NQVNLX0FMTElSUQkJMHgzNw0KIA0K
ICNkZWZpbmUgSlBHREVDX1JFR19SRVNFVAkJMHgwMDkwDQotI2RlZmluZSBKUEdERUNfUkVHX0JS
Wl9GQUNUT1IJCTB4MDBGOA0KLSNkZWZpbmUgSlBHREVDX1JFR19EVV9OVU0JCTB4MDBGQw0KKyNk
ZWZpbmUgSlBHREVDX1JFR19CUlpfRkFDVE9SCQkweDAwZjgNCisjZGVmaW5lIEpQR0RFQ19SRUdf
RFVfTlVNCQkweDAwZmMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMF9ZCQkweDAxNDAN
CiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMF9VCQkweDAxNDQNCiAjZGVmaW5lIEpQR0RF
Q19SRUdfREVTVF9BRERSMF9WCQkweDAxNDgNCi0jZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERS
MV9ZCQkweDAxNEMNCisjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMV9ZCQkweDAxNGMNCiAj
ZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMV9VCQkweDAxNTANCiAjZGVmaW5lIEpQR0RFQ19S
RUdfREVTVF9BRERSMV9WCQkweDAxNTQNCiAjZGVmaW5lIEpQR0RFQ19SRUdfU1RSSURFX1kJCTB4
MDE1OA0KLSNkZWZpbmUgSlBHREVDX1JFR19TVFJJREVfVVYJCTB4MDE1Qw0KKyNkZWZpbmUgSlBH
REVDX1JFR19TVFJJREVfVVYJCTB4MDE1Yw0KICNkZWZpbmUgSlBHREVDX1JFR19JTUdfU1RSSURF
X1kJCTB4MDE2MA0KICNkZWZpbmUgSlBHREVDX1JFR19JTUdfU1RSSURFX1VWCTB4MDE2NA0KLSNk
ZWZpbmUgSlBHREVDX1JFR19XRE1BX0NUUkwJCTB4MDE2Qw0KKyNkZWZpbmUgSlBHREVDX1JFR19X
RE1BX0NUUkwJCTB4MDE2Yw0KICNkZWZpbmUgSlBHREVDX1JFR19QQVVTRV9NQ1VfTlVNCTB4MDE3
MA0KLSNkZWZpbmUgSlBHREVDX1JFR19PUEVSQVRJT05fTU9ERQkweDAxN0MNCisjZGVmaW5lIEpQ
R0RFQ19SRUdfT1BFUkFUSU9OX01PREUJMHgwMTdjDQogI2RlZmluZSBKUEdERUNfUkVHX0ZJTEVf
QUREUgkJMHgwMjAwDQotI2RlZmluZSBKUEdERUNfUkVHX0NPTVBfSUQJCTB4MDIwQw0KKyNkZWZp
bmUgSlBHREVDX1JFR19DT01QX0lECQkweDAyMGMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfVE9UQUxf
TUNVX05VTQkweDAyMTANCiAjZGVmaW5lIEpQR0RFQ19SRUdfQ09NUDBfREFUQV9VTklUX05VTQkw
eDAyMjQNCi0jZGVmaW5lIEpQR0RFQ19SRUdfRFVfQ1RSTAkJMHgwMjNDDQorI2RlZmluZSBKUEdE
RUNfUkVHX0RVX0NUUkwJCTB4MDIzYw0KICNkZWZpbmUgSlBHREVDX1JFR19UUklHCQkJMHgwMjQw
DQogI2RlZmluZSBKUEdERUNfUkVHX0ZJTEVfQlJQCQkweDAyNDgNCi0jZGVmaW5lIEpQR0RFQ19S
RUdfRklMRV9UT1RBTF9TSVpFCTB4MDI0Qw0KKyNkZWZpbmUgSlBHREVDX1JFR19GSUxFX1RPVEFM
X1NJWkUJMHgwMjRjDQogI2RlZmluZSBKUEdERUNfUkVHX1FUX0lECQkweDAyNzANCiAjZGVmaW5l
IEpQR0RFQ19SRUdfSU5URVJSVVBUX1NUQVRVUwkweDAyNzQNCiAjZGVmaW5lIEpQR0RFQ19SRUdf
U1RBVFVTCQkweDAyNzgNCi0tIA0KMi4xOC4wDQo=

