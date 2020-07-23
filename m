Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105A922A5AA
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387797AbgGWDGg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:36 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37719 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387781AbgGWDGf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:35 -0400
X-UUID: 96f3ddd93b3744ff9c9aaf94591348ed-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=++k+gwKMeOCZsaJ+2nKb6mZXxTpdRjb58zB3fTzZcuQ=;
        b=nZx3wiY3q7F61AQYfnUwYSTIUmQn0opPQ94tfOL4OExUXrpFGfOKogvBW0xn3s9jj7JgAnajsZycOrlK3CsQfUNVPSz+LS7/s9jMF9mzpraxB9pWETN3fMBpaf7YMxNY5Ju5VkOX6d3/8+g/9m2/MdCJQ0vnIe8e8CPbjmW09ZE=;
X-UUID: 96f3ddd93b3744ff9c9aaf94591348ed-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 959589149; Thu, 23 Jul 2020 11:06:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:25 +0800
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
Subject: [PATCH v10 16/28] media: platform: Change the maximum width and height supported by JPEG dec
Date:   Thu, 23 Jul 2020 11:04:39 +0800
Message-ID: <20200723030451.5616-17-xia.jiang@mediatek.com>
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

VGhlIG1heGltdW0gd2lkdGggYW5kIGhlaWdodCBzdXBwb3J0ZWQgYnkgSlBFRyBkZWMgaXMgNjU1
MzUsIHNvIGNoYW5nZQ0KdGhlbSBmcm9tIDgxOTIgdG8gNjU1MzUuDQoNClNpZ25lZC1vZmYtYnk6
IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEwOiBuZXcgYWRkIHBh
dGNoDQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
aCB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19q
cGVnX2NvcmUuaCBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5oDQppbmRleCA5YjQ2YjA1MDcxODcuLjYxMDZjZmFiYTMxMSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KQEAgLTI1LDggKzI1LDgg
QEANCiANCiAjZGVmaW5lIE1US19KUEVHX01JTl9XSURUSAkzMlUNCiAjZGVmaW5lIE1US19KUEVH
X01JTl9IRUlHSFQJMzJVDQotI2RlZmluZSBNVEtfSlBFR19NQVhfV0lEVEgJODE5MlUNCi0jZGVm
aW5lIE1US19KUEVHX01BWF9IRUlHSFQJODE5MlUNCisjZGVmaW5lIE1US19KUEVHX01BWF9XSURU
SAk2NTUzNVUNCisjZGVmaW5lIE1US19KUEVHX01BWF9IRUlHSFQJNjU1MzVVDQogDQogI2RlZmlu
ZSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJTUFHRQkoMSAqIDEwMjQgKiAxMDI0KQ0KIA0KLS0gDQoy
LjE4LjANCg==

