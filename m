Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEB4624455B
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgHNHN2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:28 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:37277 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726747AbgHNHN1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:27 -0400
X-UUID: 1e5daf667fb347b78d7527728f764c30-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/dg5C3FKQsCiarf1haqEJ1lyLt8qaoaRqSR02dgllkQ=;
        b=b0L0WXopYVB6NGznAYbN+vy0CMgLKVyGDiE+u3RnatXXisE/K8e8aVzU4DTywav3R1mAAEGRXl1duUMx5ntp1O9Om0CoIjA/RIbtsCKSmXsOPb/toHRbRoYUHEHtDFIbJzK+rkhdBSgUmBU9iDDXHTYbOT4gHjct/vp9/75AVoo=;
X-UUID: 1e5daf667fb347b78d7527728f764c30-20200814
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 60872578; Fri, 14 Aug 2020 15:13:20 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:17 +0800
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
Subject: [PATCH v12 13/29] media: platform: Use generic rounding helpers
Date:   Fri, 14 Aug 2020 15:11:46 +0800
Message-ID: <20200814071202.25067-15-xia.jiang@mediatek.com>
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

VXNlIGNsYW1wKCkgdG8gcmVwbGFjZSBtdGtfanBlZ19ib3VuZF9hbGlnbl9pbWFnZSgpIGFuZCBy
b3VuZCgpIHRvDQpyZXBsYWNlIG10a19qcGVnX2FsaWduKCkuDQoNClJldmlld2VkLWJ5OiBUb21h
c3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KU2lnbmVkLW9mZi1ieTogWGlhIEppYW5nIDx4
aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTI6IG5vIGNoYW5nZXMNCi0tLQ0KIC4uLi9t
ZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgICB8IDQxICsrKysrLS0tLS0t
LS0tLS0tLS0NCiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2h3LmMg
fCAgOCArKy0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19ody5o
IHwgIDUgLS0tDQogMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRr
X2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19j
b3JlLmMNCmluZGV4IDAxNTNkNTdhZjQ2Ni4uOTgwNTAwYmUwMjdiIDEwMDY0NA0KLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAtMTUxLDI1ICsx
NTEsNiBAQCBzdGF0aWMgc3RydWN0IG10a19qcGVnX2ZtdCAqbXRrX2pwZWdfZmluZF9mb3JtYXQo
c3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KIAlyZXR1cm4gTlVMTDsNCiB9DQogDQotc3RhdGlj
IHZvaWQgbXRrX2pwZWdfYm91bmRfYWxpZ25faW1hZ2UodTMyICp3LCB1bnNpZ25lZCBpbnQgd21p
biwNCi0JCQkJICAgICAgIHVuc2lnbmVkIGludCB3bWF4LCB1bnNpZ25lZCBpbnQgd2FsaWduLA0K
LQkJCQkgICAgICAgdTMyICpoLCB1bnNpZ25lZCBpbnQgaG1pbiwNCi0JCQkJICAgICAgIHVuc2ln
bmVkIGludCBobWF4LCB1bnNpZ25lZCBpbnQgaGFsaWduKQ0KLXsNCi0JaW50IHdpZHRoLCBoZWln
aHQsIHdfc3RlcCwgaF9zdGVwOw0KLQ0KLQl3aWR0aCA9ICp3Ow0KLQloZWlnaHQgPSAqaDsNCi0J
d19zdGVwID0gMSA8PCB3YWxpZ247DQotCWhfc3RlcCA9IDEgPDwgaGFsaWduOw0KLQ0KLQl2NGxf
Ym91bmRfYWxpZ25faW1hZ2Uodywgd21pbiwgd21heCwgd2FsaWduLCBoLCBobWluLCBobWF4LCBo
YWxpZ24sIDApOw0KLQlpZiAoKncgPCB3aWR0aCAmJiAoKncgKyB3X3N0ZXApIDw9IHdtYXgpDQot
CQkqdyArPSB3X3N0ZXA7DQotCWlmICgqaCA8IGhlaWdodCAmJiAoKmggKyBoX3N0ZXApIDw9IGht
YXgpDQotCQkqaCArPSBoX3N0ZXA7DQotfQ0KLQ0KIHN0YXRpYyB2b2lkIG10a19qcGVnX2FkanVz
dF9mbXRfbXBsYW5lKHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwNCiAJCQkJICAgICAgIHN0cnVj
dCB2NGwyX2Zvcm1hdCAqZikNCiB7DQpAQCAtMjExLDI0ICsxOTIsMjQgQEAgc3RhdGljIGludCBt
dGtfanBlZ190cnlfZm10X21wbGFuZShzdHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogCWlmIChxX3R5
cGUgPT0gTVRLX0pQRUdfRk1UX1RZUEVfT1VUUFVUKSB7DQogCQlzdHJ1Y3QgdjRsMl9wbGFuZV9w
aXhfZm9ybWF0ICpwZm10ID0gJnBpeF9tcC0+cGxhbmVfZm10WzBdOw0KIA0KLQkJbXRrX2pwZWdf
Ym91bmRfYWxpZ25faW1hZ2UoJnBpeF9tcC0+d2lkdGgsIE1US19KUEVHX01JTl9XSURUSCwNCi0J
CQkJCSAgIE1US19KUEVHX01BWF9XSURUSCwgMCwNCi0JCQkJCSAgICZwaXhfbXAtPmhlaWdodCwg
TVRLX0pQRUdfTUlOX0hFSUdIVCwNCi0JCQkJCSAgIE1US19KUEVHX01BWF9IRUlHSFQsIDApOw0K
KwkJcGl4X21wLT5oZWlnaHQgPSBjbGFtcChwaXhfbXAtPmhlaWdodCwgTVRLX0pQRUdfTUlOX0hF
SUdIVCwNCisJCQkJICAgICAgIE1US19KUEVHX01BWF9IRUlHSFQpOw0KKwkJcGl4X21wLT53aWR0
aCA9IGNsYW1wKHBpeF9tcC0+d2lkdGgsIE1US19KUEVHX01JTl9XSURUSCwNCisJCQkJICAgICAg
TVRLX0pQRUdfTUFYX1dJRFRIKTsNCiANCiAJCXBmbXQtPmJ5dGVzcGVybGluZSA9IDA7DQogCQkv
KiBTb3VyY2Ugc2l6ZSBtdXN0IGJlIGFsaWduZWQgdG8gMTI4ICovDQotCQlwZm10LT5zaXplaW1h
Z2UgPSBtdGtfanBlZ19hbGlnbihwZm10LT5zaXplaW1hZ2UsIDEyOCk7DQorCQlwZm10LT5zaXpl
aW1hZ2UgPSByb3VuZF91cChwZm10LT5zaXplaW1hZ2UsIDEyOCk7DQogCQlpZiAocGZtdC0+c2l6
ZWltYWdlID09IDApDQogCQkJcGZtdC0+c2l6ZWltYWdlID0gTVRLX0pQRUdfREVGQVVMVF9TSVpF
SU1BR0U7DQogCQlnb3RvIGVuZDsNCiAJfQ0KIA0KIAkvKiB0eXBlIGlzIE1US19KUEVHX0ZNVF9U
WVBFX0NBUFRVUkUgKi8NCi0JbXRrX2pwZWdfYm91bmRfYWxpZ25faW1hZ2UoJnBpeF9tcC0+d2lk
dGgsIE1US19KUEVHX01JTl9XSURUSCwNCi0JCQkJICAgTVRLX0pQRUdfTUFYX1dJRFRILCBmbXQt
PmhfYWxpZ24sDQotCQkJCSAgICZwaXhfbXAtPmhlaWdodCwgTVRLX0pQRUdfTUlOX0hFSUdIVCwN
Ci0JCQkJICAgTVRLX0pQRUdfTUFYX0hFSUdIVCwgZm10LT52X2FsaWduKTsNCisJcGl4X21wLT5o
ZWlnaHQgPSBjbGFtcChyb3VuZF91cChwaXhfbXAtPmhlaWdodCwgZm10LT52X2FsaWduKSwNCisJ
CQkgICAgICAgTVRLX0pQRUdfTUlOX0hFSUdIVCwgTVRLX0pQRUdfTUFYX0hFSUdIVCk7DQorCXBp
eF9tcC0+d2lkdGggPSBjbGFtcChyb3VuZF91cChwaXhfbXAtPndpZHRoLCBmbXQtPmhfYWxpZ24p
LA0KKwkJCSAgICAgIE1US19KUEVHX01JTl9XSURUSCwgTVRLX0pQRUdfTUFYX1dJRFRIKTsNCiAN
CiAJZm9yIChpID0gMDsgaSA8IGZtdC0+Y29scGxhbmVzOyBpKyspIHsNCiAJCXN0cnVjdCB2NGwy
X3BsYW5lX3BpeF9mb3JtYXQgKnBmbXQgPSAmcGl4X21wLT5wbGFuZV9mbXRbaV07DQpAQCAtNzEx
LDggKzY5Miw4IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9kZWNfc3JjKHN0cnVjdCBtdGtf
anBlZ19jdHggKmN0eCwNCiB7DQogCWJzLT5zdHJfYWRkciA9IHZiMl9kbWFfY29udGlnX3BsYW5l
X2RtYV9hZGRyKHNyY19idWYsIDApOw0KIAlicy0+ZW5kX2FkZHIgPSBicy0+c3RyX2FkZHIgKw0K
LQkJCSBtdGtfanBlZ19hbGlnbih2YjJfZ2V0X3BsYW5lX3BheWxvYWQoc3JjX2J1ZiwgMCksIDE2
KTsNCi0JYnMtPnNpemUgPSBtdGtfanBlZ19hbGlnbih2YjJfcGxhbmVfc2l6ZShzcmNfYnVmLCAw
KSwgMTI4KTsNCisJCSAgICAgICByb3VuZF91cCh2YjJfZ2V0X3BsYW5lX3BheWxvYWQoc3JjX2J1
ZiwgMCksIDE2KTsNCisJYnMtPnNpemUgPSByb3VuZF91cCh2YjJfcGxhbmVfc2l6ZShzcmNfYnVm
LCAwKSwgMTI4KTsNCiB9DQogDQogc3RhdGljIGludCBtdGtfanBlZ19zZXRfZGVjX2RzdChzdHJ1
Y3QgbXRrX2pwZWdfY3R4ICpjdHgsDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19ody5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBl
Zy9tdGtfanBlZ19ody5jDQppbmRleCBkZGYwZGZhNzhlMjAuLjY4YWJjZmQ3NDk0ZCAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfaHcuYw0KKysr
IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19ody5jDQpAQCAtMTUz
LDEwICsxNTMsMTAgQEAgc3RhdGljIGludCBtdGtfanBlZ19jYWxjX2RzdF9zaXplKHN0cnVjdCBt
dGtfanBlZ19kZWNfcGFyYW0gKnBhcmFtKQ0KIAkJCQlwYXJhbS0+c2FtcGxpbmdfd1tpXTsNCiAJ
CS8qIG91dHB1dCBmb3JtYXQgaXMgNDIwLzQyMiAqLw0KIAkJcGFyYW0tPmNvbXBfd1tpXSA9IHBh
ZGRpbmdfdyA+PiBicnpfd1tpXTsNCi0JCXBhcmFtLT5jb21wX3dbaV0gPSBtdGtfanBlZ19hbGln
bihwYXJhbS0+Y29tcF93W2ldLA0KLQkJCQkJCSAgTVRLX0pQRUdfRENUU0laRSk7DQotCQlwYXJh
bS0+aW1nX3N0cmlkZVtpXSA9IGkgPyBtdGtfanBlZ19hbGlnbihwYXJhbS0+Y29tcF93W2ldLCAx
NikNCi0JCQkJCTogbXRrX2pwZWdfYWxpZ24ocGFyYW0tPmNvbXBfd1tpXSwgMzIpOw0KKwkJcGFy
YW0tPmNvbXBfd1tpXSA9IHJvdW5kX3VwKHBhcmFtLT5jb21wX3dbaV0sDQorCQkJCQkgICAgTVRL
X0pQRUdfRENUU0laRSk7DQorCQlwYXJhbS0+aW1nX3N0cmlkZVtpXSA9IGkgPyByb3VuZF91cChw
YXJhbS0+Y29tcF93W2ldLCAxNikNCisJCQkJCTogcm91bmRfdXAocGFyYW0tPmNvbXBfd1tpXSwg
MzIpOw0KIAkJZHNfcm93X2hbaV0gPSAoTVRLX0pQRUdfRENUU0laRSAqIHBhcmFtLT5zYW1wbGlu
Z19oW2ldKTsNCiAJfQ0KIAlwYXJhbS0+ZGVjX3cgPSBwYXJhbS0+aW1nX3N0cmlkZVswXTsNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2h3Lmgg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2h3LmgNCmluZGV4IDlj
NjU4NGVhYWQ5OS4uN2IwNjg3ZjhmNGI2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19ody5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2h3LmgNCkBAIC01NCwxMSArNTQsNiBAQCBzdHJ1Y3QgbXRrX2pw
ZWdfZGVjX3BhcmFtIHsNCiAJdTggdXZfYnJ6X3c7DQogfTsNCiANCi1zdGF0aWMgaW5saW5lIHUz
MiBtdGtfanBlZ19hbGlnbih1MzIgdmFsLCB1MzIgYWxpZ24pDQotew0KLQlyZXR1cm4gKHZhbCAr
IGFsaWduIC0gMSkgJiB+KGFsaWduIC0gMSk7DQotfQ0KLQ0KIHN0cnVjdCBtdGtfanBlZ19icyB7
DQogCWRtYV9hZGRyX3QJc3RyX2FkZHI7DQogCWRtYV9hZGRyX3QJZW5kX2FkZHI7DQotLSANCjIu
MTguMA0K

