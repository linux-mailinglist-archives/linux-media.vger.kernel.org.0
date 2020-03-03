Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71AD817760D
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 13:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgCCMfK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 07:35:10 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:20202 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729334AbgCCMfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 07:35:09 -0500
X-UUID: 457c0cfaa5be44ffa2a50f688ec2e74e-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dcq+AR3eGy/PpopeK0fFVwtB5Q8SflRG1XYx3+KoMG0=;
        b=jfZhFdvYPFl9u/ODpuMhP/uWStkRiAU/jTwqioMmzu6J5p7pvOAJGuYatadtiTs42LzN5sYJZmOx6wRmKH9mmf4XXMo0ml02ezRfVjFUPWs3kdhiBtVYb0UX2gYxv4EGHcw82u2cWRQGdpsDhKZHSvZKhk9TY/d9ThqwMaf1UBI=;
X-UUID: 457c0cfaa5be44ffa2a50f688ec2e74e-20200303
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1740094011; Tue, 03 Mar 2020 20:35:03 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:43 +0800
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
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v7 07/11] media: platform: Delete redundant code for improving code quality
Date:   Tue, 3 Mar 2020 20:34:42 +0800
Message-ID: <20200303123446.20095-8-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200303123446.20095-1-xia.jiang@mediatek.com>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
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
IEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQ0KIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oIHwgIDUgKysrLS0N
CiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
YyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRl
eCA0ZTlmZjFmOTczMmUuLmI3NjU3NWU3ZDMwMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTE4Miw3ICsxODIsNiBAQCBzdGF0
aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCiAJ
CQkJICAgc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LCBpbnQgcV90eXBlKQ0KIHsNCiAJc3RydWN0
IHY0bDJfcGl4X2Zvcm1hdF9tcGxhbmUgKnBpeF9tcCA9ICZmLT5mbXQucGl4X21wOw0KLQlzdHJ1
Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVnOw0KIAlpbnQgaTsNCiANCiAJbWVtc2V0
KHBpeF9tcC0+cmVzZXJ2ZWQsIDAsIHNpemVvZihwaXhfbXAtPnJlc2VydmVkKSk7DQpAQCAtMTkw
LDcgKzE4OSw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0
bDJfZm9ybWF0ICpmLA0KIA0KIAlpZiAoY3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklUKSB7DQog
CQltdGtfanBlZ19hZGp1c3RfZm10X21wbGFuZShjdHgsIGYpOw0KLQkJZ290byBlbmQ7DQorCQly
ZXR1cm4gMDsNCiAJfQ0KIA0KIAlwaXhfbXAtPm51bV9wbGFuZXMgPSBmbXQtPmNvbHBsYW5lczsN
CkBAIC0yMTAsNyArMjA5LDcgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X21wbGFuZShz
dHJ1Y3QgdjRsMl9mb3JtYXQgKmYsDQogCQlwZm10LT5zaXplaW1hZ2UgPSByb3VuZF91cChwZm10
LT5zaXplaW1hZ2UsIDEyOCk7DQogCQlpZiAocGZtdC0+c2l6ZWltYWdlID09IDApDQogCQkJcGZt
dC0+c2l6ZWltYWdlID0gTVRLX0pQRUdfREVGQVVMVF9TSVpFSU1BR0U7DQotCQlnb3RvIGVuZDsN
CisJCXJldHVybiAwOw0KIAl9DQogDQogCS8qIHR5cGUgaXMgTVRLX0pQRUdfRk1UX1RZUEVfQ0FQ
VFVSRSAqLw0KQEAgLTIyNCwyMCArMjIzLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2Zt
dF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KIAkJdTMyIHN0cmlkZSA9IHBpeF9tcC0+
d2lkdGggKiBmbXQtPmhfc2FtcGxlW2ldIC8gNDsNCiAJCXUzMiBoID0gcGl4X21wLT5oZWlnaHQg
KiBmbXQtPnZfc2FtcGxlW2ldIC8gNDsNCiANCi0JCW1lbXNldChwZm10LT5yZXNlcnZlZCwgMCwg
c2l6ZW9mKHBmbXQtPnJlc2VydmVkKSk7DQogCQlwZm10LT5ieXRlc3BlcmxpbmUgPSBzdHJpZGU7
DQogCQlwZm10LT5zaXplaW1hZ2UgPSBzdHJpZGUgKiBoOw0KIAl9DQotZW5kOg0KLQl2NGwyX2Ri
ZygyLCBkZWJ1ZywgJmpwZWctPnY0bDJfZGV2LCAid3hoOiV1eCV1XG4iLA0KLQkJIHBpeF9tcC0+
d2lkdGgsIHBpeF9tcC0+aGVpZ2h0KTsNCi0JZm9yIChpID0gMDsgaSA8IHBpeF9tcC0+bnVtX3Bs
YW5lczsgaSsrKSB7DQotCQl2NGwyX2RiZygyLCBkZWJ1ZywgJmpwZWctPnY0bDJfZGV2LA0KLQkJ
CSAicGxhbmVbJWRdIGJwbD0ldSwgc2l6ZT0ldVxuIiwNCi0JCQkgaSwNCi0JCQkgcGl4X21wLT5w
bGFuZV9mbXRbaV0uYnl0ZXNwZXJsaW5lLA0KLQkJCSBwaXhfbXAtPnBsYW5lX2ZtdFtpXS5zaXpl
aW1hZ2UpOw0KLQl9DQorDQogCXJldHVybiAwOw0KIH0NCiANCmRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5oDQppbmRleCA2NGE3MzEyNjEyMTQuLjli
YmQ2MTViMTA2NyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5oDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210
a19qcGVnX2NvcmUuaA0KQEAgLTMwLDYgKzMwLDkgQEANCiANCiAjZGVmaW5lIE1US19KUEVHX0RF
RkFVTFRfU0laRUlNQUdFCSgxICogMTAyNCAqIDEwMjQpDQogDQorLyoqDQorICogZW51bSBtdGtf
anBlZ19jdHhfc3RhdGUgLSBjb250ZXggc3RhdGUgb2YganBlZw0KKyAqLw0KIGVudW0gbXRrX2pw
ZWdfY3R4X3N0YXRlIHsNCiAJTVRLX0pQRUdfSU5JVCA9IDAsDQogCU1US19KUEVHX1JVTk5JTkcs
DQpAQCAtMTA5LDkgKzExMiw3IEBAIHN0cnVjdCBtdGtfanBlZ19xX2RhdGEgew0KICAqIEBvdXRf
cToJCXNvdXJjZSAob3V0cHV0KSBxdWV1ZSBpbmZvcm1hdGlvbg0KICAqIEBjYXBfcToJCWRlc3Rp
bmF0aW9uIChjYXB0dXJlKSBxdWV1ZSBxdWV1ZSBpbmZvcm1hdGlvbg0KICAqIEBmaDoJCQlWNEwy
IGZpbGUgaGFuZGxlDQotICogQGRlY19wYXJhbQkJcGFyYW1ldGVycyBmb3IgSFcgZGVjb2RpbmcN
CiAgKiBAc3RhdGU6CQlzdGF0ZSBvZiB0aGUgY29udGV4dA0KLSAqIEBoZWFkZXJfdmFsaWQ6CXNl
dCBpZiBoZWFkZXIgaGFzIGJlZW4gcGFyc2VkIGFuZCB2YWxpZA0KICAqIEBjb2xvcnNwYWNlOiBl
bnVtIHY0bDJfY29sb3JzcGFjZTsgc3VwcGxlbWVudGFsIHRvIHBpeGVsZm9ybWF0DQogICogQHlj
YmNyX2VuYzogZW51bSB2NGwyX3ljYmNyX2VuY29kaW5nLCBZJ0NiQ3IgZW5jb2RpbmcNCiAgKiBA
cXVhbnRpemF0aW9uOiBlbnVtIHY0bDJfcXVhbnRpemF0aW9uLCBjb2xvcnNwYWNlIHF1YW50aXph
dGlvbg0KLS0gDQoyLjE4LjANCg==

