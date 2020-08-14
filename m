Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FF224458D
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgHNHN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:58699 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726793AbgHNHN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:27 -0400
X-UUID: 14c1ac37ba6d416fa245bb3359548008-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Xqhy/nxyH2Ux8zbjtiue0se8A4/sG4k8Lb8OwwyRBXU=;
        b=oaZC4cs12ggm1BSjQELxH9kcHDto6NLyBJjcMu3Cj7lqpNx7eQa+kI00E6kcTYlRYg0kr9JHUWieK+Y5mV1xV2FRX2JqmVm1gJ95RNKSplijvUqIw6VuO/vUcx7TalfvGvPbgioAwrXGsuctFHfgYptQgmsMSSymJ/t1aFONCcY=;
X-UUID: 14c1ac37ba6d416fa245bb3359548008-20200814
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 406527500; Fri, 14 Aug 2020 15:13:26 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:22 +0800
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
Subject: [PATCH v12 17/29] media: platform: Change the maximum width and height supported by JPEG dec
Date:   Fri, 14 Aug 2020 15:11:50 +0800
Message-ID: <20200814071202.25067-19-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhlIG1heGltdW0gd2lkdGggYW5kIGhlaWdodCBzdXBwb3J0ZWQgYnkgSlBFRyBkZWMgaXMgNjU1
MzUsIHNvIGNoYW5nZQ0KdGhlbSBmcm9tIDgxOTIgdG8gNjU1MzUuDQoNClJldmlld2VkLWJ5OiBU
b21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5n
IDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTI6IG5vIGNoYW5nZXMNCi0tLQ0KIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIHwgNCArKy0tDQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCmluZGV4IDli
NDZiMDUwNzE4Ny4uNjEwNmNmYWJhMzExIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQpAQCAtMjUsOCArMjUsOCBAQA0KIA0KICNkZWZp
bmUgTVRLX0pQRUdfTUlOX1dJRFRICTMyVQ0KICNkZWZpbmUgTVRLX0pQRUdfTUlOX0hFSUdIVAkz
MlUNCi0jZGVmaW5lIE1US19KUEVHX01BWF9XSURUSAk4MTkyVQ0KLSNkZWZpbmUgTVRLX0pQRUdf
TUFYX0hFSUdIVAk4MTkyVQ0KKyNkZWZpbmUgTVRLX0pQRUdfTUFYX1dJRFRICTY1NTM1VQ0KKyNk
ZWZpbmUgTVRLX0pQRUdfTUFYX0hFSUdIVAk2NTUzNVUNCiANCiAjZGVmaW5lIE1US19KUEVHX0RF
RkFVTFRfU0laRUlNQUdFCSgxICogMTAyNCAqIDEwMjQpDQogDQotLSANCjIuMTguMA0K

