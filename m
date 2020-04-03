Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF4919D415
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403894AbgDCJld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:41:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51482 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403818AbgDCJlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:41:08 -0400
X-UUID: 3c3145dbd02345a0887e58ea125de1ab-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=C7gYmaCUU4cSRDwLJUXyiRJoVdUsllJH8boXNnM767E=;
        b=OcL2SsDylc4nM3OpzC4JH7U1bSiOnHjlxFhe1jGtgOGu0oBFZxqdTI9OMun1sax1Njz4a+TP1cFYzqjPS9cG5sTPxH5uDlHI/9nZaxf1631pncVAe3p/N+J4fgtf0bewnzbA+hqxBSwrPG0Jh8fFpISziJNIlBoXHl6wOvPy3/s=;
X-UUID: 3c3145dbd02345a0887e58ea125de1ab-20200403
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 349254074; Fri, 03 Apr 2020 17:41:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:40 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Matthias Brugger" <matthias.bgg@gmail.com>,
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
Subject: [PATCH v8 08/14] media: platform: Change case for improving code quality
Date:   Fri, 3 Apr 2020 17:40:27 +0800
Message-ID: <20200403094033.8288-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
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
b20+DQotLS0NCnY4OiBubyBjaGFuZ2VzDQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX3JlZy5oIHwgMTggKysrKysrKysrLS0tLS0tLS0tDQogMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmggYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQppbmRleCA5NGRiMDRlOWNkYjYu
LjI5NDVkYTg0MmRmYSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfcmVnLmgNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfcmVnLmgNCkBAIC0yMCwyOSArMjAsMjkgQEANCiAjZGVmaW5lIEJJVF9JTlFTVF9N
QVNLX0FMTElSUQkJMHgzNw0KIA0KICNkZWZpbmUgSlBHREVDX1JFR19SRVNFVAkJMHgwMDkwDQot
I2RlZmluZSBKUEdERUNfUkVHX0JSWl9GQUNUT1IJCTB4MDBGOA0KLSNkZWZpbmUgSlBHREVDX1JF
R19EVV9OVU0JCTB4MDBGQw0KKyNkZWZpbmUgSlBHREVDX1JFR19CUlpfRkFDVE9SCQkweDAwZjgN
CisjZGVmaW5lIEpQR0RFQ19SRUdfRFVfTlVNCQkweDAwZmMNCiAjZGVmaW5lIEpQR0RFQ19SRUdf
REVTVF9BRERSMF9ZCQkweDAxNDANCiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMF9VCQkw
eDAxNDQNCiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMF9WCQkweDAxNDgNCi0jZGVmaW5l
IEpQR0RFQ19SRUdfREVTVF9BRERSMV9ZCQkweDAxNEMNCisjZGVmaW5lIEpQR0RFQ19SRUdfREVT
VF9BRERSMV9ZCQkweDAxNGMNCiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMV9VCQkweDAx
NTANCiAjZGVmaW5lIEpQR0RFQ19SRUdfREVTVF9BRERSMV9WCQkweDAxNTQNCiAjZGVmaW5lIEpQ
R0RFQ19SRUdfU1RSSURFX1kJCTB4MDE1OA0KLSNkZWZpbmUgSlBHREVDX1JFR19TVFJJREVfVVYJ
CTB4MDE1Qw0KKyNkZWZpbmUgSlBHREVDX1JFR19TVFJJREVfVVYJCTB4MDE1Yw0KICNkZWZpbmUg
SlBHREVDX1JFR19JTUdfU1RSSURFX1kJCTB4MDE2MA0KICNkZWZpbmUgSlBHREVDX1JFR19JTUdf
U1RSSURFX1VWCTB4MDE2NA0KLSNkZWZpbmUgSlBHREVDX1JFR19XRE1BX0NUUkwJCTB4MDE2Qw0K
KyNkZWZpbmUgSlBHREVDX1JFR19XRE1BX0NUUkwJCTB4MDE2Yw0KICNkZWZpbmUgSlBHREVDX1JF
R19QQVVTRV9NQ1VfTlVNCTB4MDE3MA0KLSNkZWZpbmUgSlBHREVDX1JFR19PUEVSQVRJT05fTU9E
RQkweDAxN0MNCisjZGVmaW5lIEpQR0RFQ19SRUdfT1BFUkFUSU9OX01PREUJMHgwMTdjDQogI2Rl
ZmluZSBKUEdERUNfUkVHX0ZJTEVfQUREUgkJMHgwMjAwDQotI2RlZmluZSBKUEdERUNfUkVHX0NP
TVBfSUQJCTB4MDIwQw0KKyNkZWZpbmUgSlBHREVDX1JFR19DT01QX0lECQkweDAyMGMNCiAjZGVm
aW5lIEpQR0RFQ19SRUdfVE9UQUxfTUNVX05VTQkweDAyMTANCiAjZGVmaW5lIEpQR0RFQ19SRUdf
Q09NUDBfREFUQV9VTklUX05VTQkweDAyMjQNCi0jZGVmaW5lIEpQR0RFQ19SRUdfRFVfQ1RSTAkJ
MHgwMjNDDQorI2RlZmluZSBKUEdERUNfUkVHX0RVX0NUUkwJCTB4MDIzYw0KICNkZWZpbmUgSlBH
REVDX1JFR19UUklHCQkJMHgwMjQwDQogI2RlZmluZSBKUEdERUNfUkVHX0ZJTEVfQlJQCQkweDAy
NDgNCi0jZGVmaW5lIEpQR0RFQ19SRUdfRklMRV9UT1RBTF9TSVpFCTB4MDI0Qw0KKyNkZWZpbmUg
SlBHREVDX1JFR19GSUxFX1RPVEFMX1NJWkUJMHgwMjRjDQogI2RlZmluZSBKUEdERUNfUkVHX1FU
X0lECQkweDAyNzANCiAjZGVmaW5lIEpQR0RFQ19SRUdfSU5URVJSVVBUX1NUQVRVUwkweDAyNzQN
CiAjZGVmaW5lIEpQR0RFQ19SRUdfU1RBVFVTCQkweDAyNzgNCi0tIA0KMi4xOC4wDQo=

