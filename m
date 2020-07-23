Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B5322A5CE
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387961AbgGWDHr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:07:47 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:62717 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387744AbgGWDG3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:29 -0400
X-UUID: 95a27920a0854c2bbb0c87c99325ee94-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dqAGKjG8xe7pTrMaIftkMbLqgXnHgq/LssHxo/Q6Lg8=;
        b=dHK0WCOkYZIhqIjaeBxEinJ3YDkpPdGepekYYVQW7aIKL5VpVCU3I/WxZWpkZPtuXvmXTpnLEX18UI4zivw+XBMikSdELBA00+Jraz3r1KHirp8S+HUJ2S2Eu4CHyz+S8Rk483dC2XK2i1sj9sYKYnscN6i6A2+D7FQMnX60HRE=;
X-UUID: 95a27920a0854c2bbb0c87c99325ee94-20200723
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1956231706; Thu, 23 Jul 2020 11:06:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:25 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:21 +0800
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
Subject: [PATCH v10 13/28] media: platform: Change MTK_JPEG_COMP_MAX macro definition location
Date:   Thu, 23 Jul 2020 11:04:36 +0800
Message-ID: <20200723030451.5616-14-xia.jiang@mediatek.com>
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

TW92ZSBNVEtfSlBFR19DT01QX01BWCBkZWZpbml0aW9uIHRvIG10a19qcGVnX2NvcmUuaCBmaWxl
LCBiZWNhdXNlIGl0DQppcyB1c2VkIGJ5IG10a19qcGVnX2NvcmUuYyBmaWxlLg0KDQpSZXZpZXdl
ZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6IFhp
YSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEwOiBubyBjaGFuZ2VzDQot
LS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCB8IDIg
KysNCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oICB8IDEg
LQ0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
aCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQppbmRl
eCBjOWY1MTYyZDI5MjQuLjRkNjI0Mzg5NjNjMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KQEAgLTE1LDYgKzE1LDggQEANCiANCiAj
ZGVmaW5lIE1US19KUEVHX05BTUUJCSJtdGstanBlZyINCiANCisjZGVmaW5lIE1US19KUEVHX0NP
TVBfTUFYCQkzDQorDQogI2RlZmluZSBNVEtfSlBFR19GTVRfRkxBR19ERUNfT1VUUFVUCUJJVCgw
KQ0KICNkZWZpbmUgTVRLX0pQRUdfRk1UX0ZMQUdfREVDX0NBUFRVUkUJQklUKDEpDQogDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19yZWcuaCBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmgNCmluZGV4IDI5
NDVkYTg0MmRmYS4uMjFlYzhmOTY3OTdmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19yZWcuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19yZWcuaA0KQEAgLTgsNyArOCw2IEBADQogI2lmbmRlZiBfTVRL
X0pQRUdfUkVHX0gNCiAjZGVmaW5lIF9NVEtfSlBFR19SRUdfSA0KIA0KLSNkZWZpbmUgTVRLX0pQ
RUdfQ09NUF9NQVgJCTMNCiAjZGVmaW5lIE1US19KUEVHX0JMT0NLX01BWAkJMTANCiAjZGVmaW5l
IE1US19KUEVHX0RDVFNJWkUJCTgNCiANCi0tIA0KMi4xOC4wDQo=

