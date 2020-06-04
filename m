Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27941EE0B0
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgFDJIM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:12 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:40299 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728049AbgFDJIM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:12 -0400
X-UUID: 2983abcc2d2b479c8928d05ed5f9e960-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=51Q/BrpkoBDx3k26Ti/j+oiGnanwsh55IVVK3mN0szc=;
        b=bW5R80KpViX7DhvH7mpoPd8uezTOXm1wzEKq/l4DeCuiHau1JUUk1E08O+K62ToB3iBCEPvWKQPQtfji7ixEk+gRFvIOv1BCNOMF3oOo1osXFaWJLZsqEXz3va/m5/qvuMu9FqrczKeveVy5OlkueRL5fxP33tMEwISqg3y3jAU=;
X-UUID: 2983abcc2d2b479c8928d05ed5f9e960-20200604
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2119825636; Thu, 04 Jun 2020 17:08:09 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:08 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:05 +0800
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
Subject: [PATCH RESEND v9 06/18] media: platform: Delete the resetting hardware flow in the system PM ops
Date:   Thu, 4 Jun 2020 17:05:41 +0800
Message-ID: <20200604090553.10861-8-xia.jiang@mediatek.com>
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

RGVsZXRlIHRoZSByZXNldHRpbmcgaGFyZHdhcmUgZmxvdyBpbiBzdXNwZW5kIGFuZCByZXN1bWUg
ZnVuY3Rpb24NCmJlY2F1c2UgdGhhdCByZXNldHRpbmcgb3BlcmF0aW9uIHdpbGwgYmUgZG9uZSBp
biBkZXZpY2VfcnVuKCkuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1l
ZGlhdGVrLmNvbT4NCi0tLQ0Kdjk6IG5ldyBwYXRjaA0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAyIC0tDQogMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jDQppbmRleCBmYjYyNDM4NTk2OWUuLjdmNzQ1OTcyNjJmYyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTEx
OTEsNyArMTE5MSw2IEBAIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRrX2pwZWdfcG1fc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQogew0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVn
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQotCW10a19qcGVnX2RlY19yZXNldChqcGVnLT5k
ZWNfcmVnX2Jhc2UpOw0KIAltdGtfanBlZ19jbGtfb2ZmKGpwZWcpOw0KIA0KIAlyZXR1cm4gMDsN
CkBAIC0xMjAyLDcgKzEyMDEsNiBAQCBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVn
X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpw
ZWcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiANCiAJbXRrX2pwZWdfY2xrX29uKGpwZWcpOw0K
LQltdGtfanBlZ19kZWNfcmVzZXQoanBlZy0+ZGVjX3JlZ19iYXNlKTsNCiANCiAJcmV0dXJuIDA7
DQogfQ0KLS0gDQoyLjE4LjANCg==

