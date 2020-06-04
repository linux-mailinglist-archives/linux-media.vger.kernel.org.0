Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92C1EE092
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgFDJIK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:10 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:61454 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727937AbgFDJIJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:09 -0400
X-UUID: b4f99f646285407b8ea9ffeaae011a37-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1t3HNytBAi0W3bOjbjl3A2ri2OH+ls+Xo4TSymJgodk=;
        b=QrzqbvymSbwD3IXKIgUYw7ZjfLeWo/ver+E015cQrhh7xfXe9xmpPFdVDkDDu/m8IczjQ7LxdLwx1tbBVDaxw6JN4v4FvD4K5UOvuAZL2QDqZdco/4C1ncxL/b1feTgSAUYTZt1auy8PSr+gKzMI8VECYDMZFOgpDfHGEz9oAOo=;
X-UUID: b4f99f646285407b8ea9ffeaae011a37-20200604
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 250685954; Thu, 04 Jun 2020 17:08:06 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:02 +0800
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
Subject: [PATCH RESEND v9 03/18] media: platform: Improve getting and requesting irq flow for bug fixing
Date:   Thu, 4 Jun 2020 17:05:38 +0800
Message-ID: <20200604090553.10861-5-xia.jiang@mediatek.com>
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

RGVsZXRlIHBsYXRmb3JtX2dldF9yZXNvdXJjZSBvcGVyYXRpb24gZm9yIGlycS4NClJldHVybiBh
Y3R1YWwgdmFsdWUgcmF0aGVyIHRoYW4gRUlOVkFMIHdoZW4gZmFpbCB0byBnZXQgYW5kIHJlcXVl
c3QNCmlycS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+
DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0N
CnY5OiBubyBjaGFuZ2VzDQotLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuYyB8IDcgKystLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpw
ZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCA2N2EwMjJkMDRkZjcuLjI2Nzc1ODA5NDFiMCAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5j
DQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0K
QEAgLTExMDMsMTIgKzExMDMsMTAgQEAgc3RhdGljIGludCBtdGtfanBlZ19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAkJcmV0dXJuIHJldDsNCiAJfQ0KIA0KLQlyZXMgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9JUlEsIDApOw0KIAlkZWNfaXJx
ID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsNCi0JaWYgKCFyZXMgfHwgZGVjX2lycSA8IDAp
IHsNCisJaWYgKGRlY19pcnEgPCAwKSB7DQogCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQg
dG8gZ2V0IGRlY19pcnEgJWQuXG4iLCBkZWNfaXJxKTsNCi0JCXJldCA9IC1FSU5WQUw7DQotCQly
ZXR1cm4gcmV0Ow0KKwkJcmV0dXJuIGRlY19pcnE7DQogCX0NCiANCiAJcmV0ID0gZGV2bV9yZXF1
ZXN0X2lycSgmcGRldi0+ZGV2LCBkZWNfaXJxLCBtdGtfanBlZ19kZWNfaXJxLCAwLA0KQEAgLTEx
MTYsNyArMTExNCw2IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCiAJaWYgKHJldCkgew0KIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiRmFp
bGVkIHRvIHJlcXVlc3QgZGVjX2lycSAlZCAoJWQpXG4iLA0KIAkJCWRlY19pcnEsIHJldCk7DQot
CQlyZXQgPSAtRUlOVkFMOw0KIAkJZ290byBlcnJfcmVxX2lycTsNCiAJfQ0KIA0KLS0gDQoyLjE4
LjANCg==

