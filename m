Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCB824458B
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgHNHOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:14:53 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:40235 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726674AbgHNHN2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:28 -0400
X-UUID: 4735ccdb2a09448fba078424b10a34be-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L1y9pPxdA0pzcOflsm1/2eGbT5uGkzxv9JWPGmzEw9Q=;
        b=V3fulic27HKChV+ZUQArxzeJxo58VWhZvef1E8c6jOaETMXDmqLCcAjOf+pDwlQ3GGtCh7f+Ezkn7nqy+Fv4tvRN+oVeoFCknADQmhTPa2suZPNJ4ft0hKb52nvz2QHMyh1KSHw1p/tMWqOQeMLdIeaZUGvkKAj/o9a42MyWSVQ=;
X-UUID: 4735ccdb2a09448fba078424b10a34be-20200814
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1500603377; Fri, 14 Aug 2020 15:13:24 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:22 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:21 +0800
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
Subject: [PATCH v12 16/29] media: platform: Delete vidioc_s_selection ioctl of jpeg dec
Date:   Fri, 14 Aug 2020 15:11:49 +0800
Message-ID: <20200814071202.25067-18-xia.jiang@mediatek.com>
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

SlBFRyBkZWMgZG9lcyd0IHN1cHBvcnQgc2V0dGluZyBhIGNvbXBvc2UgcmVjdGFuZ2xlLCBzbyBy
ZW1vdmUNCm10a19qcGVnX2RlY19zX3NlbGVjdGlvbigpLg0KDQpSZXZpZXdlZC1ieTogVG9tYXN6
IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFuZyA8eGlh
LmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEyOiBubyBjaGFuZ2VzDQotLS0NCiAuLi4vbWVk
aWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCAyMiAtLS0tLS0tLS0tLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDIyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXggZGIzYThiMjJk
Y2NkLi45ZDE5MzVkMDc4MmIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
anBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC00MzksMjcgKzQzOSw2IEBAIHN0YXRpYyBpbnQgbXRr
X2pwZWdfZ19zZWxlY3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQogCXJldHVy
biAwOw0KIH0NCiANCi1zdGF0aWMgaW50IG10a19qcGVnX3Nfc2VsZWN0aW9uKHN0cnVjdCBmaWxl
ICpmaWxlLCB2b2lkICpwcml2LA0KLQkJCQlzdHJ1Y3QgdjRsMl9zZWxlY3Rpb24gKnMpDQotew0K
LQlzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHggPSBtdGtfanBlZ19maF90b19jdHgocHJpdik7DQot
DQotCWlmIChzLT50eXBlICE9IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRSkNCi0JCXJldHVy
biAtRUlOVkFMOw0KLQ0KLQlzd2l0Y2ggKHMtPnRhcmdldCkgew0KLQljYXNlIFY0TDJfU0VMX1RH
VF9DT01QT1NFOg0KLQkJcy0+ci5sZWZ0ID0gMDsNCi0JCXMtPnIudG9wID0gMDsNCi0JCXMtPnIu
d2lkdGggPSBjdHgtPm91dF9xLnc7DQotCQlzLT5yLmhlaWdodCA9IGN0eC0+b3V0X3EuaDsNCi0J
CWJyZWFrOw0KLQlkZWZhdWx0Og0KLQkJcmV0dXJuIC1FSU5WQUw7DQotCX0NCi0JcmV0dXJuIDA7
DQotfQ0KLQ0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9pb2N0bF9vcHMgbXRrX2pwZWdfaW9j
dGxfb3BzID0gew0KIAkudmlkaW9jX3F1ZXJ5Y2FwICAgICAgICAgICAgICAgID0gbXRrX2pwZWdf
cXVlcnljYXAsDQogCS52aWRpb2NfZW51bV9mbXRfdmlkX2NhcAk9IG10a19qcGVnX2VudW1fZm10
X3ZpZF9jYXAsDQpAQCAtNDczLDcgKzQ1Miw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9p
b2N0bF9vcHMgbXRrX2pwZWdfaW9jdGxfb3BzID0gew0KIAkudmlkaW9jX3FidWYgICAgICAgICAg
ICAgICAgICAgID0gdjRsMl9tMm1faW9jdGxfcWJ1ZiwNCiAJLnZpZGlvY19zdWJzY3JpYmVfZXZl
bnQgICAgICAgICA9IG10a19qcGVnX3N1YnNjcmliZV9ldmVudCwNCiAJLnZpZGlvY19nX3NlbGVj
dGlvbgkJPSBtdGtfanBlZ19nX3NlbGVjdGlvbiwNCi0JLnZpZGlvY19zX3NlbGVjdGlvbgkJPSBt
dGtfanBlZ19zX3NlbGVjdGlvbiwNCiANCiAJLnZpZGlvY19jcmVhdGVfYnVmcwkJPSB2NGwyX20y
bV9pb2N0bF9jcmVhdGVfYnVmcywNCiAJLnZpZGlvY19wcmVwYXJlX2J1ZgkJPSB2NGwyX20ybV9p
b2N0bF9wcmVwYXJlX2J1ZiwNCi0tIA0KMi4xOC4wDQo=

