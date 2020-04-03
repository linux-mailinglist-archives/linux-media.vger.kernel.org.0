Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 319B619D3F4
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403798AbgDCJkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:53 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:19623 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403783AbgDCJkx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:53 -0400
X-UUID: 851245fb58ec43c4b7c4fa9c7e4da0c7-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Lprj+ufCYbzLwTfc1XoNnGUMFca4BTukbE1k5gVfSdE=;
        b=MIvGBSw/zhjYjs0qUOTihWrnVV5bXZMhWThnQLXnXpRyTjDrFvEUCC0HmC/kmm1Ak3PtuK1wJ319ypH8StWqr1BU7fTkcjQi22FGB/u1oVImy6ijPaRee0e0FdJ81E2crmNen0qPKhiAj7J6Gwwz9Td1Ts5J6xgyiILYiayG43g=;
X-UUID: 851245fb58ec43c4b7c4fa9c7e4da0c7-20200403
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 407350468; Fri, 03 Apr 2020 17:40:47 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:43 +0800
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
Subject: [PATCH v8 10/14] media: platform: Delete redundant code for improving code quality
Date:   Fri, 3 Apr 2020 17:40:29 +0800
Message-ID: <20200403094033.8288-11-xia.jiang@mediatek.com>
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

RGVsZXRlIHVudXNlZCBtZW1iZXIgdmFyaWFibGVzIGFubm90YXRpb24uDQpEZWxldGUgdW51c2Vk
IHZhcmlhYmxlIGRlZmluaXRpb24uDQpEZWxldGUgcmVkdW5kYW50IGxvZyBwcmludCwgYmVjYXVz
ZSBWNEwyIGRlYnVnIGxvZ3MgYWxyZWFkeSBwcmludCBpdC4NCg0KU2lnbmVkLW9mZi1ieTogWGlh
IEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2ODogbm8gY2hhbmdlcw0KLS0t
DQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxNiAr
Ky0tLS0tLS0tLS0tLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19jb3JlLmggfCAgNSArKystLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAx
NiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMNCmluZGV4IDRlNjQwNDZhNjg1NC4uOWU1OWI5YTUxZWYwIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAt
MTgyLDcgKzE4Miw2IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0
IHY0bDJfZm9ybWF0ICpmLA0KIAkJCQkgICBzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgsIGludCBx
X3R5cGUpDQogew0KIAlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0X21wbGFuZSAqcGl4X21wID0gJmYt
PmZtdC5waXhfbXA7DQotCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcgPSBjdHgtPmpwZWc7DQog
CWludCBpOw0KIA0KIAltZW1zZXQocGl4X21wLT5yZXNlcnZlZCwgMCwgc2l6ZW9mKHBpeF9tcC0+
cmVzZXJ2ZWQpKTsNCkBAIC0xOTAsNyArMTg5LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlf
Zm10X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogDQogCWlmIChjdHgtPnN0YXRlICE9
IE1US19KUEVHX0lOSVQpIHsNCiAJCW10a19qcGVnX2FkanVzdF9mbXRfbXBsYW5lKGN0eCwgZik7
DQotCQlnb3RvIGVuZDsNCisJCXJldHVybiAwOw0KIAl9DQogDQogCXBpeF9tcC0+bnVtX3BsYW5l
cyA9IGZtdC0+Y29scGxhbmVzOw0KQEAgLTIxMCw3ICsyMDksNyBAQCBzdGF0aWMgaW50IG10a19q
cGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCiAJCXBmbXQtPnNpemVp
bWFnZSA9IHJvdW5kX3VwKHBmbXQtPnNpemVpbWFnZSwgMTI4KTsNCiAJCWlmIChwZm10LT5zaXpl
aW1hZ2UgPT0gMCkNCiAJCQlwZm10LT5zaXplaW1hZ2UgPSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJ
TUFHRTsNCi0JCWdvdG8gZW5kOw0KKwkJcmV0dXJuIDA7DQogCX0NCiANCiAJLyogdHlwZSBpcyBN
VEtfSlBFR19GTVRfVFlQRV9DQVBUVVJFICovDQpAQCAtMjI0LDIwICsyMjMsOSBAQCBzdGF0aWMg
aW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCiAJCXUz
MiBzdHJpZGUgPSBwaXhfbXAtPndpZHRoICogZm10LT5oX3NhbXBsZVtpXSAvIDQ7DQogCQl1MzIg
aCA9IHBpeF9tcC0+aGVpZ2h0ICogZm10LT52X3NhbXBsZVtpXSAvIDQ7DQogDQotCQltZW1zZXQo
cGZtdC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihwZm10LT5yZXNlcnZlZCkpOw0KIAkJcGZtdC0+Ynl0
ZXNwZXJsaW5lID0gc3RyaWRlOw0KIAkJcGZtdC0+c2l6ZWltYWdlID0gc3RyaWRlICogaDsNCiAJ
fQ0KLWVuZDoNCi0JdjRsMl9kYmcoMiwgZGVidWcsICZqcGVnLT52NGwyX2RldiwgInd4aDoldXgl
dVxuIiwNCi0JCSBwaXhfbXAtPndpZHRoLCBwaXhfbXAtPmhlaWdodCk7DQotCWZvciAoaSA9IDA7
IGkgPCBwaXhfbXAtPm51bV9wbGFuZXM7IGkrKykgew0KLQkJdjRsMl9kYmcoMiwgZGVidWcsICZq
cGVnLT52NGwyX2RldiwNCi0JCQkgInBsYW5lWyVkXSBicGw9JXUsIHNpemU9JXVcbiIsDQotCQkJ
IGksDQotCQkJIHBpeF9tcC0+cGxhbmVfZm10W2ldLmJ5dGVzcGVybGluZSwNCi0JCQkgcGl4X21w
LT5wbGFuZV9mbXRbaV0uc2l6ZWltYWdlKTsNCi0JfQ0KIAlyZXR1cm4gMDsNCiB9DQogDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KaW5kZXgg
NjRhNzMxMjYxMjE0Li45YmJkNjE1YjEwNjcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCkBAIC0zMCw2ICszMCw5IEBADQogDQogI2Rl
ZmluZSBNVEtfSlBFR19ERUZBVUxUX1NJWkVJTUFHRQkoMSAqIDEwMjQgKiAxMDI0KQ0KIA0KKy8q
Kg0KKyAqIGVudW0gbXRrX2pwZWdfY3R4X3N0YXRlIC0gY29udGV4IHN0YXRlIG9mIGpwZWcNCisg
Ki8NCiBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogCU1US19KUEVHX0lOSVQgPSAwLA0KIAlN
VEtfSlBFR19SVU5OSU5HLA0KQEAgLTEwOSw5ICsxMTIsNyBAQCBzdHJ1Y3QgbXRrX2pwZWdfcV9k
YXRhIHsNCiAgKiBAb3V0X3E6CQlzb3VyY2UgKG91dHB1dCkgcXVldWUgaW5mb3JtYXRpb24NCiAg
KiBAY2FwX3E6CQlkZXN0aW5hdGlvbiAoY2FwdHVyZSkgcXVldWUgcXVldWUgaW5mb3JtYXRpb24N
CiAgKiBAZmg6CQkJVjRMMiBmaWxlIGhhbmRsZQ0KLSAqIEBkZWNfcGFyYW0JCXBhcmFtZXRlcnMg
Zm9yIEhXIGRlY29kaW5nDQogICogQHN0YXRlOgkJc3RhdGUgb2YgdGhlIGNvbnRleHQNCi0gKiBA
aGVhZGVyX3ZhbGlkOglzZXQgaWYgaGVhZGVyIGhhcyBiZWVuIHBhcnNlZCBhbmQgdmFsaWQNCiAg
KiBAY29sb3JzcGFjZTogZW51bSB2NGwyX2NvbG9yc3BhY2U7IHN1cHBsZW1lbnRhbCB0byBwaXhl
bGZvcm1hdA0KICAqIEB5Y2Jjcl9lbmM6IGVudW0gdjRsMl95Y2Jjcl9lbmNvZGluZywgWSdDYkNy
IGVuY29kaW5nDQogICogQHF1YW50aXphdGlvbjogZW51bSB2NGwyX3F1YW50aXphdGlvbiwgY29s
b3JzcGFjZSBxdWFudGl6YXRpb24NCi0tIA0KMi4xOC4wDQo=

