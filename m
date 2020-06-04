Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5B21EDE1C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 09:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgFDH30 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 03:29:26 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:36044 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728035AbgFDH3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 03:29:25 -0400
X-UUID: 79bd932093de4f64aa9a593ca6acca70-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3sd83gbBi/bwcV9u6BojfPaejlbJ45wcsK+TIeYFX5U=;
        b=bu5lt/kT+6hW/tiBwhpV5sVAXAnTdsdDFS9PkX7o+ysDBL0IkOomyE1jBHpbeC1ro7sLzqIVnGRSGAC1D23gbATDTXM8scNgtyxL32cRoDymBuX1ctp3erfyiiFPvsD/CbLY16Sls1VtjapNCmNz6VKwjoowARLRFLKEzIKiDRo=;
X-UUID: 79bd932093de4f64aa9a593ca6acca70-20200604
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 564267766; Thu, 04 Jun 2020 15:29:22 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 15:29:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 15:29:19 +0800
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
Subject: [PATCH v9 06/18] media: platform: Delete the resetting hardware flow in the system PM ops
Date:   Thu, 4 Jun 2020 15:26:56 +0800
Message-ID: <20200604072708.9468-7-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604072708.9468-1-xia.jiang@mediatek.com>
References: <20200604072708.9468-1-xia.jiang@mediatek.com>
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
ZGlhdGVrLmNvbT4NCi0tLQ0Kdjk6IG5ldyBwYXRjaA0KLS0tDQogY2hlY2sudHh0ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKysrDQogZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAgMiAtLQ0KIDIgZmls
ZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgY2hlY2sudHh0DQoNCmRpZmYgLS1naXQgYS9jaGVjay50eHQgYi9jaGVjay50eHQN
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLmFlZDM5ZTVmNjJmMg0K
LS0tIC9kZXYvbnVsbA0KKysrIGIvY2hlY2sudHh0DQpAQCAtMCwwICsxLDEzIEBADQorV0FSTklO
RzpMT05HX0xJTkU6IGxpbmUgb3ZlciA4MCBjaGFyYWN0ZXJzDQorIzgyMDogRklMRTogLi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYzo4MjA6DQorKwlpZiAo
bXRrX2pwZWdfc2V0X2RlY19kc3QoY3R4LCAmanBlZ19zcmNfYnVmLT5kZWNfcGFyYW0sICZkc3Rf
YnVmLT52YjJfYnVmLCAmZmIpKQ0KKw0KK3RvdGFsOiAwIGVycm9ycywgMSB3YXJuaW5ncywgMTI3
MSBsaW5lcyBjaGVja2VkDQorDQorTk9URTogRm9yIHNvbWUgb2YgdGhlIHJlcG9ydGVkIGRlZmVj
dHMsIGNoZWNrcGF0Y2ggbWF5IGJlIGFibGUgdG8NCisgICAgICBtZWNoYW5pY2FsbHkgY29udmVy
dCB0byB0aGUgdHlwaWNhbCBzdHlsZSB1c2luZyAtLWZpeCBvciAtLWZpeC1pbnBsYWNlLg0KKw0K
Ky4vZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgaGFzIHN0
eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3Lg0KKw0KK05PVEU6IElmIGFueSBvZiB0aGUgZXJy
b3JzIGFyZSBmYWxzZSBwb3NpdGl2ZXMsIHBsZWFzZSByZXBvcnQNCisgICAgICB0aGVtIHRvIHRo
ZSBtYWludGFpbmVyLCBzZWUgQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4NCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCBmYjYyNDM4
NTk2OWUuLjdmNzQ1OTcyNjJmYyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTExOTEsNyArMTE5MSw2IEBAIHN0YXRpYyBfX21h
eWJlX3VudXNlZCBpbnQgbXRrX2pwZWdfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQog
ew0KIAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQog
DQotCW10a19qcGVnX2RlY19yZXNldChqcGVnLT5kZWNfcmVnX2Jhc2UpOw0KIAltdGtfanBlZ19j
bGtfb2ZmKGpwZWcpOw0KIA0KIAlyZXR1cm4gMDsNCkBAIC0xMjAyLDcgKzEyMDEsNiBAQCBzdGF0
aWMgX19tYXliZV91bnVzZWQgaW50IG10a19qcGVnX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpDQogCXN0cnVjdCBtdGtfanBlZ19kZXYgKmpwZWcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsN
CiANCiAJbXRrX2pwZWdfY2xrX29uKGpwZWcpOw0KLQltdGtfanBlZ19kZWNfcmVzZXQoanBlZy0+
ZGVjX3JlZ19iYXNlKTsNCiANCiAJcmV0dXJuIDA7DQogfQ0KLS0gDQoyLjE4LjANCg==

