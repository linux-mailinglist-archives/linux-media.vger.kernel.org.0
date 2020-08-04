Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35CB823B394
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgHDDnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:43:22 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:19680 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729750AbgHDDmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:42:01 -0400
X-UUID: dba6690adfe1495ca957e4ee1c449d54-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bC65/VDBtNsLT0CKU1jyTPQcKFdGIfKJFz865Kf9eUs=;
        b=HiVn5bmFWndAaLPUfdyDJ0pyZeUr61tZ0Ny6T/QahTSlHkeLQ0nHaxKy9SPSLHmW/5wDjtGQ4PXvv3QDU6HZnrrjgakHispKgYJUmdG//okfIDn2nvTXGfWljntFYDwNNcOIzSgvI50V5jaH8TRli/hmn2MYjE9EOBOsFMgQbXw=;
X-UUID: dba6690adfe1495ca957e4ee1c449d54-20200804
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 381715518; Tue, 04 Aug 2020 11:41:58 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:41:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:41:56 +0800
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
Subject: [PATCH v11 13/28] media: platform: Change MTK_JPEG_COMP_MAX macro definition location
Date:   Tue, 4 Aug 2020 11:40:47 +0800
Message-ID: <20200804034102.22983-14-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
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
YSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjExOiBubyBjaGFuZ2VzDQot
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

