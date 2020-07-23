Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9351322A58E
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387767AbgGWDGc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:32 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:42135 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387754AbgGWDGb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:31 -0400
X-UUID: 03406a2906254d49ba085a75afab8fdc-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WkWvv0PERXwP1DwpPxOh+O/ojvXuJoDymeGP7aazNEE=;
        b=f/ryIzWl9EgS+Oqth8ag1O6aZjgDPNvVp/PTYSMMg8HAkcOS0i7877n5dWdy2PG29ddCEOmygk59QiUL0Oi9LnIsOXVl0ZX5WxyF9MIOmGYgdboAps57wzfRGH/nGcHVpjqnQ1tgkHT18tUWIZ1gguF7RwoaWerNfQmpI/RC/6A=;
X-UUID: 03406a2906254d49ba085a75afab8fdc-20200723
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 499407866; Thu, 23 Jul 2020 11:06:29 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:27 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:23 +0800
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
Subject: [PATCH v10 15/28] media: platform: Delete vidioc_s_selection ioctl of jpeg dec
Date:   Thu, 23 Jul 2020 11:04:38 +0800
Message-ID: <20200723030451.5616-16-xia.jiang@mediatek.com>
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

SlBFRyBkZWMgZG9lcyd0IHN1cHBvcnQgc2V0dGluZyBhIGNvbXBvc2UgcmVjdGFuZ2xlLCBzbyBy
ZW1vdmUNCm10a19qcGVnX2RlY19zX3NlbGVjdGlvbigpLg0KDQpTaWduZWQtb2ZmLWJ5OiBYaWEg
SmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnYxMDogbmV3IGFkZCBwYXRjaA0K
LS0tDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgMjIg
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBkZWxldGlvbnMoLSkNCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29y
ZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCmlu
ZGV4IGRiM2E4YjIyZGNjZC4uOWQxOTM1ZDA3ODJiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAtNDM5LDI3ICs0MzksNiBAQCBz
dGF0aWMgaW50IG10a19qcGVnX2dfc2VsZWN0aW9uKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpw
cml2LA0KIAlyZXR1cm4gMDsNCiB9DQogDQotc3RhdGljIGludCBtdGtfanBlZ19zX3NlbGVjdGlv
bihzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCi0JCQkJc3RydWN0IHY0bDJfc2VsZWN0
aW9uICpzKQ0KLXsNCi0Jc3RydWN0IG10a19qcGVnX2N0eCAqY3R4ID0gbXRrX2pwZWdfZmhfdG9f
Y3R4KHByaXYpOw0KLQ0KLQlpZiAocy0+dHlwZSAhPSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRV
UkUpDQotCQlyZXR1cm4gLUVJTlZBTDsNCi0NCi0Jc3dpdGNoIChzLT50YXJnZXQpIHsNCi0JY2Fz
ZSBWNEwyX1NFTF9UR1RfQ09NUE9TRToNCi0JCXMtPnIubGVmdCA9IDA7DQotCQlzLT5yLnRvcCA9
IDA7DQotCQlzLT5yLndpZHRoID0gY3R4LT5vdXRfcS53Ow0KLQkJcy0+ci5oZWlnaHQgPSBjdHgt
Pm91dF9xLmg7DQotCQlicmVhazsNCi0JZGVmYXVsdDoNCi0JCXJldHVybiAtRUlOVkFMOw0KLQl9
DQotCXJldHVybiAwOw0KLX0NCi0NCiBzdGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfaW9jdGxfb3Bz
IG10a19qcGVnX2lvY3RsX29wcyA9IHsNCiAJLnZpZGlvY19xdWVyeWNhcCAgICAgICAgICAgICAg
ICA9IG10a19qcGVnX3F1ZXJ5Y2FwLA0KIAkudmlkaW9jX2VudW1fZm10X3ZpZF9jYXAJPSBtdGtf
anBlZ19lbnVtX2ZtdF92aWRfY2FwLA0KQEAgLTQ3Myw3ICs0NTIsNiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHY0bDJfaW9jdGxfb3BzIG10a19qcGVnX2lvY3RsX29wcyA9IHsNCiAJLnZpZGlvY19x
YnVmICAgICAgICAgICAgICAgICAgICA9IHY0bDJfbTJtX2lvY3RsX3FidWYsDQogCS52aWRpb2Nf
c3Vic2NyaWJlX2V2ZW50ICAgICAgICAgPSBtdGtfanBlZ19zdWJzY3JpYmVfZXZlbnQsDQogCS52
aWRpb2NfZ19zZWxlY3Rpb24JCT0gbXRrX2pwZWdfZ19zZWxlY3Rpb24sDQotCS52aWRpb2Nfc19z
ZWxlY3Rpb24JCT0gbXRrX2pwZWdfc19zZWxlY3Rpb24sDQogDQogCS52aWRpb2NfY3JlYXRlX2J1
ZnMJCT0gdjRsMl9tMm1faW9jdGxfY3JlYXRlX2J1ZnMsDQogCS52aWRpb2NfcHJlcGFyZV9idWYJ
CT0gdjRsMl9tMm1faW9jdGxfcHJlcGFyZV9idWYsDQotLSANCjIuMTguMA0K

