Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073DC19D3F2
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403778AbgDCJkt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36555 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2390641AbgDCJks (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:48 -0400
X-UUID: 894e7ce08cc3454abaa8a2594a772217-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WpMIy3AkmSG9PNgIdQtrXjvW6Cg2lVIoIoOuUGR4AuY=;
        b=teuH07FlNyw1+PlkFDRCnsPCrsaO5yUushdWq+0RvCiRNw1o2sw61iqyZ+vwZcCr0kCDqxmvI8SiNW47jmY6p/4G7BOlN6RGSkW29fz/geJnu6AhL2B9YQf/fzohaGqvGGURZejN7gyomDaLy9WHBTUCC8wTTrllnBy7QSM2MAE=;
X-UUID: 894e7ce08cc3454abaa8a2594a772217-20200403
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 968873322; Fri, 03 Apr 2020 17:40:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:38 +0800
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
Subject: [PATCH v8 06/14] media: platform: Improve the implementation of the system PM ops
Date:   Fri, 3 Apr 2020 17:40:25 +0800
Message-ID: <20200403094033.8288-7-xia.jiang@mediatek.com>
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

Q2FuY2VsIHJlc2V0IGh3IG9wZXJhdGlvbiBpbiBzdXNwZW5kIGFuZCByZXN1bWUgZnVuY3Rpb24g
YmVjYXVzZSB0aGlzDQp3aWxsIGJlIGRvbmUgaW4gZGV2aWNlX3J1bigpLg0KQWRkIHNwaW5fbG9j
ayBhbmQgdW5sb2NrIG9wZXJhdGlvbiBpbiBpcnEgYW5kIHJlc3VtZSBmdW5jdGlvbiB0byBtYWtl
DQpzdXJlIHRoYXQgdGhlIGN1cnJlbnQgZnJhbWUgaXMgcHJvY2Vzc2VkIGNvbXBsZXRlbHkgYmVm
b3JlIHN1c3BlbmQuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlh
dGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdf
Y29yZS5jIHwgMTEgKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVn
L210a19qcGVnX2NvcmUuYw0KaW5kZXggZGQ1Y2FkZDEwMWVmLi4yZmEzNzExZmRjOWIgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0K
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBA
IC05MTEsNiArOTExLDggQEAgc3RhdGljIGlycXJldHVybl90IG10a19qcGVnX2RlY19pcnEoaW50
IGlycSwgdm9pZCAqcHJpdikNCiAJdTMyIGRlY19yZXQ7DQogCWludCBpOw0KIA0KKwlzcGluX2xv
Y2soJmpwZWctPmh3X2xvY2spOw0KKw0KIAlkZWNfcmV0ID0gbXRrX2pwZWdfZGVjX2dldF9pbnRf
c3RhdHVzKGpwZWctPmRlY19yZWdfYmFzZSk7DQogCWRlY19pcnFfcmV0ID0gbXRrX2pwZWdfZGVj
X2VudW1fcmVzdWx0KGRlY19yZXQpOw0KIAljdHggPSB2NGwyX20ybV9nZXRfY3Vycl9wcml2KGpw
ZWctPm0ybV9kZXYpOw0KQEAgLTk0MSw2ICs5NDMsNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRr
X2pwZWdfZGVjX2lycShpbnQgaXJxLCB2b2lkICpwcml2KQ0KIAl2NGwyX20ybV9idWZfZG9uZShz
cmNfYnVmLCBidWZfc3RhdGUpOw0KIAl2NGwyX20ybV9idWZfZG9uZShkc3RfYnVmLCBidWZfc3Rh
dGUpOw0KIAl2NGwyX20ybV9qb2JfZmluaXNoKGpwZWctPm0ybV9kZXYsIGN0eC0+ZmgubTJtX2N0
eCk7DQorCXNwaW5fdW5sb2NrKCZqcGVnLT5od19sb2NrKTsNCiAJcG1fcnVudGltZV9wdXRfc3lu
YyhjdHgtPmpwZWctPmRldik7DQogCXJldHVybiBJUlFfSEFORExFRDsNCiB9DQpAQCAtMTE5MSw3
ICsxMTk0LDYgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfanBlZ19wbV9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldikNCiB7DQogCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCiANCi0JbXRrX2pwZWdfZGVjX3Jlc2V0KGpwZWctPmRlY19y
ZWdfYmFzZSk7DQogCW10a19qcGVnX2Nsa19vZmYoanBlZyk7DQogDQogCXJldHVybiAwOw0KQEAg
LTEyMDIsMTkgKzEyMDQsMjQgQEAgc3RhdGljIF9fbWF5YmVfdW51c2VkIGludCBtdGtfanBlZ19w
bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVn
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQogDQogCW10a19qcGVnX2Nsa19vbihqcGVnKTsNCi0J
bXRrX2pwZWdfZGVjX3Jlc2V0KGpwZWctPmRlY19yZWdfYmFzZSk7DQogDQogCXJldHVybiAwOw0K
IH0NCiANCiBzdGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3N1c3BlbmQoc3RydWN0
IGRldmljZSAqZGV2KQ0KIHsNCisJc3RydWN0IG10a19qcGVnX2RldiAqanBlZyA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KIAlpbnQgcmV0Ow0KIA0KIAlp
ZiAocG1fcnVudGltZV9zdXNwZW5kZWQoZGV2KSkNCiAJCXJldHVybiAwOw0KIA0KKwlzcGluX2xv
Y2tfaXJxc2F2ZSgmanBlZy0+aHdfbG9jaywgZmxhZ3MpOw0KKw0KIAlyZXQgPSBtdGtfanBlZ19w
bV9zdXNwZW5kKGRldik7DQorDQorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmpwZWctPmh3X2xv
Y2ssIGZsYWdzKTsNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotLSANCjIuMTguMA0K

