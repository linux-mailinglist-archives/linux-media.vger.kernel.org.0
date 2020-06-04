Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75BD1EE0D3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728473AbgFDJJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:09:30 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:55391 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728306AbgFDJIV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:21 -0400
X-UUID: fa036b3b90274366a219024e3e29868a-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ruv+enB5poqyL/I1yboqzGHbyq2HlfaaeUs84iv1Mk0=;
        b=m/sJ5/k6ZfT9pe4VjppY1ssSvcGzUBk8bx5kVn5/PP/n64TsFBkAqliQqj/7sqoukuCWp6ywyaoq/vtq7JDeC1jR6qHosbg7CQxoqrJ5e9yz3xeqqd6X+q4ZbpgjHEBJYJ6bGg+V0E+V/nc/EGLAQayeJSAUbQwJqY4/S8AEh0A=;
X-UUID: fa036b3b90274366a219024e3e29868a-20200604
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1727685379; Thu, 04 Jun 2020 17:08:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:13 +0800
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
Subject: [PATCH RESEND v9 12/18] media: platform: Change MTK_JPEG_COMP_MAX macro definition location
Date:   Thu, 4 Jun 2020 17:05:47 +0800
Message-ID: <20200604090553.10861-14-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
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
YSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0Kdjk6IG5vIGNoYW5nZXMNCi0t
LQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIHwgMiAr
Kw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfcmVnLmggIHwgMSAt
DQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5o
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCmluZGV4
IDI4ZTliMzBhZDVjMy4uNjRhNzMxMjYxMjE0IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQpAQCAtMTUsNiArMTUsOCBAQA0KIA0KICNk
ZWZpbmUgTVRLX0pQRUdfTkFNRQkJIm10ay1qcGVnIg0KIA0KKyNkZWZpbmUgTVRLX0pQRUdfQ09N
UF9NQVgJCTMNCisNCiAjZGVmaW5lIE1US19KUEVHX0ZNVF9GTEFHX0RFQ19PVVRQVVQJQklUKDAp
DQogI2RlZmluZSBNVEtfSlBFR19GTVRfRkxBR19ERUNfQ0FQVFVSRQlCSVQoMSkNCiANCmRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19yZWcuaA0KaW5kZXggMjk0
NWRhODQyZGZhLi4yMWVjOGY5Njc5N2YgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL210ay1qcGVnL210a19qcGVnX3JlZy5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX3JlZy5oDQpAQCAtOCw3ICs4LDYgQEANCiAjaWZuZGVmIF9NVEtf
SlBFR19SRUdfSA0KICNkZWZpbmUgX01US19KUEVHX1JFR19IDQogDQotI2RlZmluZSBNVEtfSlBF
R19DT01QX01BWAkJMw0KICNkZWZpbmUgTVRLX0pQRUdfQkxPQ0tfTUFYCQkxMA0KICNkZWZpbmUg
TVRLX0pQRUdfRENUU0laRQkJOA0KIA0KLS0gDQoyLjE4LjANCg==

