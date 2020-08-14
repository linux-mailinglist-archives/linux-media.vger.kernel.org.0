Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8746B24456C
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgHNHNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:33 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:22567 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726837AbgHNHNb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:31 -0400
X-UUID: 08470711103b441d95bda6fc1ba8e991-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=puws50E7EyfO/dsTmQ8s/j03hkmRAbRm7I9mCZj0rpI=;
        b=k/FH2WO+FBDlyGj2mTCa32NAoOlPRAu1TJFzXyIie0e00TawNoJEztuAk3Q3eUeHZ8uyBXjH5VDsMWbPcijRsjBOIingk5l/Ke4udmwwDFHxakwChoXmbRikJ89LQse+oXWcVEgoOTT6rFeb/X8J8KHNvW49BUhQA5iOw8Jh7OM=;
X-UUID: 08470711103b441d95bda6fc1ba8e991-20200814
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1974106389; Fri, 14 Aug 2020 15:13:27 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:23 +0800
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
Subject: [PATCH v12 18/29] media: platform: Refactor mtk_jpeg_try_fmt_mplane()
Date:   Fri, 14 Aug 2020 15:11:51 +0800
Message-ID: <20200814071202.25067-20-xia.jiang@mediatek.com>
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

VGhlIGZ1bmN0aW9uIG9mIG10a19qcGVnX2FkanVzdF9mbXRfbXBsYW5lKCkgZXF1YWxzDQptdGtf
anBlZ19nX2ZtdF92aWRfbXBsYW5lKCksIHNvIHVzZSBtdGtfanBlZ19nX2ZtdF92aWRfbXBsYW5l
KCkgdG8NCnJlcGxhY2UgaXQgLg0KRGVsZXRlIHRoZSB1bnVzZWQgY3R4IHBhcmFtZXRlci4NClVz
aW5nIGZvdXJjYyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIGRpZmZlcmVudCBmb3JtYXRzIGlzIG1v
cmUgZ2VuZXJpYywNCmJlY2F1c2UgdGhhdCBqcGVnIGVuYyB3aWxsIGFsc28gdXNlIGl0Lg0KDQpS
ZXZpZXdlZC1ieTogVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYt
Ynk6IFhpYSBKaWFuZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEyOiBubyBjaGFu
Z2VzDQotLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAg
fCA0OSArKysrKystLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KyksIDMzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1q
cGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXggOWQxOTM1ZDA3ODJiLi5hYmE1ODNmMDNlZjEgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUu
Yw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMN
CkBAIC0xNTEsNDQgKzE1MSwxNyBAQCBzdGF0aWMgc3RydWN0IG10a19qcGVnX2ZtdCAqbXRrX2pw
ZWdfZmluZF9mb3JtYXQoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LA0KIAlyZXR1cm4gTlVMTDsN
CiB9DQogDQotc3RhdGljIHZvaWQgbXRrX2pwZWdfYWRqdXN0X2ZtdF9tcGxhbmUoc3RydWN0IG10
a19qcGVnX2N0eCAqY3R4LA0KLQkJCQkgICAgICAgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0KK3N0
YXRpYyBpbnQgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfcGl4X2Zvcm1hdF9t
cGxhbmUgKnBpeF9tcCwNCisJCQkJICAgc3RydWN0IG10a19qcGVnX2ZtdCAqZm10KQ0KIHsNCi0J
c3RydWN0IHY0bDJfcGl4X2Zvcm1hdF9tcGxhbmUgKnBpeF9tcCA9ICZmLT5mbXQucGl4X21wOw0K
LQlzdHJ1Y3QgbXRrX2pwZWdfcV9kYXRhICpxX2RhdGE7DQotCWludCBpOw0KLQ0KLQlxX2RhdGEg
PSBtdGtfanBlZ19nZXRfcV9kYXRhKGN0eCwgZi0+dHlwZSk7DQotDQotCXBpeF9tcC0+d2lkdGgg
PSBxX2RhdGEtPnc7DQotCXBpeF9tcC0+aGVpZ2h0ID0gcV9kYXRhLT5oOw0KLQlwaXhfbXAtPnBp
eGVsZm9ybWF0ID0gcV9kYXRhLT5mbXQtPmZvdXJjYzsNCi0JcGl4X21wLT5udW1fcGxhbmVzID0g
cV9kYXRhLT5mbXQtPmNvbHBsYW5lczsNCi0NCi0JZm9yIChpID0gMDsgaSA8IHBpeF9tcC0+bnVt
X3BsYW5lczsgaSsrKSB7DQotCQlwaXhfbXAtPnBsYW5lX2ZtdFtpXS5ieXRlc3BlcmxpbmUgPSBx
X2RhdGEtPmJ5dGVzcGVybGluZVtpXTsNCi0JCXBpeF9tcC0+cGxhbmVfZm10W2ldLnNpemVpbWFn
ZSA9IHFfZGF0YS0+c2l6ZWltYWdlW2ldOw0KLQl9DQotfQ0KLQ0KLXN0YXRpYyBpbnQgbXRrX2pw
ZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KLQkJCQkgICBzdHJ1Y3Qg
bXRrX2pwZWdfZm10ICpmbXQsDQotCQkJCSAgIHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCwgaW50
IHFfdHlwZSkNCi17DQotCXN0cnVjdCB2NGwyX3BpeF9mb3JtYXRfbXBsYW5lICpwaXhfbXAgPSAm
Zi0+Zm10LnBpeF9tcDsNCiAJaW50IGk7DQogDQogCXBpeF9tcC0+ZmllbGQgPSBWNEwyX0ZJRUxE
X05PTkU7DQogDQotCWlmIChjdHgtPnN0YXRlICE9IE1US19KUEVHX0lOSVQpIHsNCi0JCW10a19q
cGVnX2FkanVzdF9mbXRfbXBsYW5lKGN0eCwgZik7DQotCQlyZXR1cm4gMDsNCi0JfQ0KLQ0KIAlw
aXhfbXAtPm51bV9wbGFuZXMgPSBmbXQtPmNvbHBsYW5lczsNCiAJcGl4X21wLT5waXhlbGZvcm1h
dCA9IGZtdC0+Zm91cmNjOw0KIA0KLQlpZiAocV90eXBlID09IE1US19KUEVHX0ZNVF9UWVBFX09V
VFBVVCkgew0KKwlpZiAoZm10LT5mb3VyY2MgPT0gVjRMMl9QSVhfRk1UX0pQRUcpIHsNCiAJCXN0
cnVjdCB2NGwyX3BsYW5lX3BpeF9mb3JtYXQgKnBmbXQgPSAmcGl4X21wLT5wbGFuZV9mbXRbMF07
DQogDQogCQlwaXhfbXAtPmhlaWdodCA9IGNsYW1wKHBpeF9tcC0+aGVpZ2h0LCBNVEtfSlBFR19N
SU5fSEVJR0hULA0KQEAgLTIwNCw3ICsxNzcsNyBAQCBzdGF0aWMgaW50IG10a19qcGVnX3RyeV9m
bXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwNCiAJCXJldHVybiAwOw0KIAl9DQogDQot
CS8qIHR5cGUgaXMgTVRLX0pQRUdfRk1UX1RZUEVfQ0FQVFVSRSAqLw0KKwkvKiBvdGhlciBmb3Vy
Y2MgKi8NCiAJcGl4X21wLT5oZWlnaHQgPSBjbGFtcChyb3VuZF91cChwaXhfbXAtPmhlaWdodCwg
Zm10LT52X2FsaWduKSwNCiAJCQkgICAgICAgTVRLX0pQRUdfTUlOX0hFSUdIVCwgTVRLX0pQRUdf
TUFYX0hFSUdIVCk7DQogCXBpeF9tcC0+d2lkdGggPSBjbGFtcChyb3VuZF91cChwaXhfbXAtPndp
ZHRoLCBmbXQtPmhfYWxpZ24pLA0KQEAgLTI4OCw3ICsyNjEsMTIgQEAgc3RhdGljIGludCBtdGtf
anBlZ190cnlfZm10X3ZpZF9jYXBfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2
LA0KIAkJIChmbXQtPmZvdXJjYyA+PiAxNiAmIDB4ZmYpLA0KIAkJIChmbXQtPmZvdXJjYyA+PiAy
NCAmIDB4ZmYpKTsNCiANCi0JcmV0dXJuIG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKGYsIGZtdCwg
Y3R4LCBNVEtfSlBFR19GTVRfVFlQRV9DQVBUVVJFKTsNCisJaWYgKGN0eC0+c3RhdGUgIT0gTVRL
X0pQRUdfSU5JVCkgew0KKwkJbXRrX2pwZWdfZ19mbXRfdmlkX21wbGFuZShmaWxlLCBwcml2LCBm
KTsNCisJCXJldHVybiAwOw0KKwl9DQorDQorCXJldHVybiBtdGtfanBlZ190cnlfZm10X21wbGFu
ZSgmZi0+Zm10LnBpeF9tcCwgZm10KTsNCiB9DQogDQogc3RhdGljIGludCBtdGtfanBlZ190cnlf
Zm10X3ZpZF9vdXRfbXBsYW5lKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KQEAgLTMw
OSw3ICsyODcsMTIgQEAgc3RhdGljIGludCBtdGtfanBlZ190cnlfZm10X3ZpZF9vdXRfbXBsYW5l
KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpwcml2LA0KIAkJIChmbXQtPmZvdXJjYyA+PiAxNiAm
IDB4ZmYpLA0KIAkJIChmbXQtPmZvdXJjYyA+PiAyNCAmIDB4ZmYpKTsNCiANCi0JcmV0dXJuIG10
a19qcGVnX3RyeV9mbXRfbXBsYW5lKGYsIGZtdCwgY3R4LCBNVEtfSlBFR19GTVRfVFlQRV9PVVRQ
VVQpOw0KKwlpZiAoY3R4LT5zdGF0ZSAhPSBNVEtfSlBFR19JTklUKSB7DQorCQltdGtfanBlZ19n
X2ZtdF92aWRfbXBsYW5lKGZpbGUsIHByaXYsIGYpOw0KKwkJcmV0dXJuIDA7DQorCX0NCisNCisJ
cmV0dXJuIG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKCZmLT5mbXQucGl4X21wLCBmbXQpOw0KIH0N
CiANCiBzdGF0aWMgaW50IG10a19qcGVnX3NfZm10X21wbGFuZShzdHJ1Y3QgbXRrX2pwZWdfY3R4
ICpjdHgsDQotLSANCjIuMTguMA0K

