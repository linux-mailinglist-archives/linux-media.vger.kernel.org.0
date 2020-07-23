Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E1422A5C3
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgGWDHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:07:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63451 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387822AbgGWDGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:42 -0400
X-UUID: b9295c0047c84e80ac0be1d58157b328-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5qxiN19UNnnzIWoPjqLAZDNGGcHWrAH9dd/CpJtMBoQ=;
        b=YGQ239fFlItA8gifCQBO6dwOxZ23wLBbJKEPww6iwMCZQxPvqIPv1d+wopOnmsS8UE54YfM91QXWcswH6Y5Cd0ssSes4XFQpESLLCi3ANmBN0aTsM8KV2baTL2ofzASWi3/IbjPj7XXrkd+UB2vc2auDqbnDCb/YayQrgQ4Ea/A=;
X-UUID: b9295c0047c84e80ac0be1d58157b328-20200723
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 779627179; Thu, 23 Jul 2020 11:06:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:32 +0800
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
Subject: [PATCH v10 21/28] media: platform: Refactor mtk_jpeg_set_default_params()
Date:   Thu, 23 Jul 2020 11:04:44 +0800
Message-ID: <20200723030451.5616-22-xia.jiang@mediatek.com>
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

Q2FsbCBtdGtfanBlZ190cnlfZm10X21wbGFuZSgpIHRvIHJlcGxhY2UgdGhlIG9yaWdpbmFsIGNv
bXB1dGF0aW9uIG9mDQpzaXplaW1hZ2UgYW5kIGJ5dGVzcGVybGluZSwgYmVjYXVzZSB0aGF0IG10
a19qcGVnX3RyeV9mbXRfbXBsYW5lKCkNCmFscmVhZHkgZGlkIGl0Lg0KDQpTaWduZWQtb2ZmLWJ5
OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnYxMDogbmV3IGFkZCBw
YXRjaA0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmMgfCAxMiArKy0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
MCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9t
dGtfanBlZ19jb3JlLmMNCmluZGV4IDAzNzZiZDNiZGJiYi4uNzg4MWU5YzkzZGY3IDEwMDY0NA0K
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAt
ODQ0LDcgKzg0NCw2IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtdGtfanBlZ19kZWNfaXJxKGludCBp
cnEsIHZvaWQgKnByaXYpDQogc3RhdGljIHZvaWQgbXRrX2pwZWdfc2V0X2RlZmF1bHRfcGFyYW1z
KHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCkNCiB7DQogCXN0cnVjdCBtdGtfanBlZ19xX2RhdGEg
KnEgPSAmY3R4LT5vdXRfcTsNCi0JaW50IGk7DQogDQogCXEtPnBpeF9tcC5jb2xvcnNwYWNlID0g
VjRMMl9DT0xPUlNQQUNFX1NSR0I7DQogCXEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNS
X0VOQ182MDE7DQpAQCAtODU2LDggKzg1NSw3IEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9k
ZWZhdWx0X3BhcmFtcyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgpDQogCQkJCSAgICAgIE1US19K
UEVHX0ZNVF9GTEFHX0RFQ19PVVRQVVQpOw0KIAlxLT5waXhfbXAud2lkdGggPSBNVEtfSlBFR19N
SU5fV0lEVEg7DQogCXEtPnBpeF9tcC5oZWlnaHQgPSBNVEtfSlBFR19NSU5fSEVJR0hUOw0KLQlx
LT5waXhfbXAucGxhbmVfZm10WzBdLmJ5dGVzcGVybGluZSA9IDA7DQotCXEtPnBpeF9tcC5wbGFu
ZV9mbXRbMF0uc2l6ZWltYWdlID0gTVRLX0pQRUdfREVGQVVMVF9TSVpFSU1BR0U7DQorCW10a19q
cGVnX3RyeV9mbXRfbXBsYW5lKCZxLT5waXhfbXAsIHEtPmZtdCk7DQogDQogCXEgPSAmY3R4LT5j
YXBfcTsNCiAJcS0+Zm10ID0gbXRrX2pwZWdfZmluZF9mb3JtYXQobXRrX2pwZWdfZm9ybWF0cywg
TVRLX0pQRUdfTlVNX0ZPUk1BVFMsDQpAQCAtODcwLDEzICs4NjgsNyBAQCBzdGF0aWMgdm9pZCBt
dGtfanBlZ19zZXRfZGVmYXVsdF9wYXJhbXMoc3RydWN0IG10a19qcGVnX2N0eCAqY3R4KQ0KIAlx
LT5waXhfbXAud2lkdGggPSBNVEtfSlBFR19NSU5fV0lEVEg7DQogCXEtPnBpeF9tcC5oZWlnaHQg
PSBNVEtfSlBFR19NSU5fSEVJR0hUOw0KIA0KLQlmb3IgKGkgPSAwOyBpIDwgcS0+Zm10LT5jb2xw
bGFuZXM7IGkrKykgew0KLQkJdTMyIHN0cmlkZSA9IHEtPnBpeF9tcC53aWR0aCAqIHEtPmZtdC0+
aF9zYW1wbGVbaV0gLyA0Ow0KLQkJdTMyIGggPSBxLT5waXhfbXAuaGVpZ2h0ICogcS0+Zm10LT52
X3NhbXBsZVtpXSAvIDQ7DQotDQotCQlxLT5waXhfbXAucGxhbmVfZm10W2ldLmJ5dGVzcGVybGlu
ZSA9IHN0cmlkZTsNCi0JCXEtPnBpeF9tcC5wbGFuZV9mbXRbaV0uc2l6ZWltYWdlID0gc3RyaWRl
ICogaDsNCi0JfQ0KKwltdGtfanBlZ190cnlfZm10X21wbGFuZSgmcS0+cGl4X21wLCBxLT5mbXQp
Ow0KIH0NCiANCiBzdGF0aWMgaW50IG10a19qcGVnX29wZW4oc3RydWN0IGZpbGUgKmZpbGUpDQot
LSANCjIuMTguMA0K

