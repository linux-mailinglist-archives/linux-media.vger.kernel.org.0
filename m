Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 325821589CB
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2020 06:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbgBKF4D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Feb 2020 00:56:03 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60310 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727434AbgBKF4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Feb 2020 00:56:02 -0500
X-UUID: acb308b7595741e49e3624f002443ef0-20200211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UZncKfN5pbA6KAUGfVcuH3KW3o6KJUR94XVtsqFT8Ho=;
        b=Y/iRRfomGL7Q82xifLIQqXMjjXhnPsfS86r6Ht8HsmCW1/wKbPmxHs5lv35m6uIiq8inVZyxD3+8xblzxeZZGD+GKl3tM/sgS8xR8FJQ9xy4RL4Gh1Lq+QyM0pafv35uAtCwXJcy9/KSCY3urdpRqRCqPVdnqbunE2417l2NtAk=;
X-UUID: acb308b7595741e49e3624f002443ef0-20200211
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 263313503; Tue, 11 Feb 2020 13:55:54 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Feb 2020 13:55:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Feb 2020 13:54:07 +0800
From:   <gtk_ruiwang@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tomasz Figa <tfiga@chromium.org>
CC:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        <gtk_ruiwang@mediatek.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH][v3] media: mtk-vcodec: reset segment data then trig decoder
Date:   Tue, 11 Feb 2020 13:55:32 +0800
Message-ID: <20200211055532.4563-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogZ3RrX3J1aXdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNvbT4NCg0KVlA5IGJpdHN0
cmVhbSBzcGVjaWZpY2F0aW9uIGluZGljYXRlIHNlZ21lbnQgZGF0YSBzaG91bGQgcmVzZXQgdG8N
CmRlZmF1bHQgd2hlbiBtZWV0IGtleSBmcmFtZXMsIGludHJhIG9ubHkgZnJhbWVzIG9yIGVuYWJs
ZSBlcnJvcg0KcmVzaWxpZW5jZSBtb2RlLiBTbyBtZW1zZXQgc2VnbWVudGF0aW9uIG1hcCBidWZm
ZXIgYmVmb3JlIGV2ZXJ5DQpkZWNvZGUgcHJvY2VzcyBpcyBub3QgYXBwcm9wcmlhdGUuDQoNClJl
c2V0IHNlZ21lbnQgZGF0YSBvbmx5IHdoZW4gbmVlZGVkLCB0aGVuIHN0YXJ0IGRlY29kZXIgaGFy
ZHdhcmUNCg0KU2lnbmVkLW9mZi1ieTogUnVpIFdhbmcgPGd0a19ydWl3YW5nQG1lZGlhdGVrLmNv
bT4NCi0tLQ0KQ2hhbmdlZCBpbiB2MzoNCi0gbW9kaWZ5IGJpdDMgdXNhZ2UgZGVzY3JpcHRpb24N
Ci0tLQ0KIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWMvdmRlY192cDlfaWYuYyAgICB8IDI5
ICsrKysrKysrKysrKysrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvdmRlYy92ZGVjX3ZwOV9pZi5jDQppbmRleCAyNGMxZjBiZjIxNDcuLjI1N2E1YjVhZDIx
MiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3Zk
ZWNfdnA5X2lmLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVj
L3ZkZWNfdnA5X2lmLmMNCkBAIC0xMTAsNyArMTEwLDExIEBAIHN0cnVjdCB2cDlfc2ZfcmVmX2Zi
IHsNCiAgKiBAYnVmX2xlbl9zel9jIDogc2l6ZSB1c2VkIHRvIHN0b3JlIGNiY3IgcGxhbmUgdWZv
IGluZm8gKEFQLVIsIFZQVS1XKQ0KIA0KICAqIEBwcm9maWxlIDogcHJvZmlsZSBzcGFyc2VkIGZy
b20gdnB1IChBUC1SLCBWUFUtVykNCi0gKiBAc2hvd19mcmFtZSA6IGRpc3BsYXkgdGhpcyBmcmFt
ZSBvciBub3QgKEFQLVIsIFZQVS1XKQ0KKyAqIEBzaG93X2ZyYW1lIDogW0JJVCgwKV0gZGlzcGxh
eSB0aGlzIGZyYW1lIG9yIG5vdCAoQVAtUiwgVlBVLVcpDQorICoJW0JJVCgxKV0gcmVzZXQgc2Vn
bWVudCBkYXRhIG9yIG5vdCAoQVAtUiwgVlBVLVcpDQorICoJW0JJVCgyKV0gdHJpZyBkZWNvZGVy
IGhhcmR3YXJlIG9yIG5vdCAoQVAtUiwgVlBVLVcpDQorICoJW0JJVCgzKV0gYXNrIFZQVSB0byBz
ZXQgYml0cygwfjQpIGFjY29yZGluZ2x5IChBUC1XLCBWUFUtUikNCisgKglbQklUKDQpXSBkbyBu
b3QgcmVzZXQgc2VnbWVudCBkYXRhIGJlZm9yZSBldmVyeSBmcmFtZSAoQVAtUiwgVlBVLVcpDQog
ICogQHNob3dfZXhpc3RpbmdfZnJhbWUgOiBpbmZvcm0gdGhpcyBmcmFtZSBpcyBzaG93IGV4aXN0
aW5nIGZyYW1lDQogICoJKEFQLVIsIFZQVS1XKQ0KICAqIEBmcm1fdG9fc2hvd19pZHggOiBpbmRl
eCB0byBzaG93IGZyYW1lIChBUC1SLCBWUFUtVykNCkBAIC00OTQsMTIgKzQ5OCwxMiBAQCBzdGF0
aWMgdm9pZCB2cDlfc3dhcF9mcm1fYnVmcyhzdHJ1Y3QgdmRlY192cDlfaW5zdCAqaW5zdCkNCiAJ
CQkJCWZybV90b19zaG93LT5mYi0+YmFzZV95LnNpemUpOw0KIAkJfQ0KIAkJaWYgKCF2cDlfaXNf
c2ZfcmVmX2ZiKGluc3QsIGluc3QtPmN1cl9mYikpIHsNCi0JCQlpZiAodnNpLT5zaG93X2ZyYW1l
KQ0KKwkJCWlmICh2c2ktPnNob3dfZnJhbWUgJiBCSVQoMCkpDQogCQkJCXZwOV9hZGRfdG9fZmJf
ZGlzcF9saXN0KGluc3QsIGluc3QtPmN1cl9mYik7DQogCQl9DQogCX0gZWxzZSB7DQogCQlpZiAo
IXZwOV9pc19zZl9yZWZfZmIoaW5zdCwgaW5zdC0+Y3VyX2ZiKSkgew0KLQkJCWlmICh2c2ktPnNo
b3dfZnJhbWUpDQorCQkJaWYgKHZzaS0+c2hvd19mcmFtZSAmIEJJVCgwKSkNCiAJCQkJdnA5X2Fk
ZF90b19mYl9kaXNwX2xpc3QoaW5zdCwgZnJtX3RvX3Nob3ctPmZiKTsNCiAJCX0NCiAJfQ0KQEAg
LTgwMCw2ICs4MDQsOSBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X2luaXQoc3RydWN0IG10a192Y29k
ZWNfY3R4ICpjdHgpDQogCX0NCiANCiAJaW5zdC0+dnNpID0gKHN0cnVjdCB2ZGVjX3ZwOV92c2kg
KilpbnN0LT52cHUudnNpOw0KKw0KKwlpbnN0LT52c2ktPnNob3dfZnJhbWUgfD0gQklUKDMpOw0K
Kw0KIAlpbml0X2FsbF9mYl9saXN0cyhpbnN0KTsNCiANCiAJY3R4LT5kcnZfaGFuZGxlID0gaW5z
dDsNCkBAIC04NzAsMTMgKzg3NywyNyBAQCBzdGF0aWMgaW50IHZkZWNfdnA5X2RlY29kZSh2b2lk
ICpoX3ZkZWMsIHN0cnVjdCBtdGtfdmNvZGVjX21lbSAqYnMsDQogCQkJCQl2c2ktPnNmX2ZybV9z
eltpZHhdKTsNCiAJCQl9DQogCQl9DQotCQltZW1zZXQoaW5zdC0+c2VnX2lkX2J1Zi52YSwgMCwg
aW5zdC0+c2VnX2lkX2J1Zi5zaXplKTsNCisNCisJCWlmICghKHZzaS0+c2hvd19mcmFtZSAmIEJJ
VCg0KSkpDQorCQkJbWVtc2V0KGluc3QtPnNlZ19pZF9idWYudmEsIDAsIGluc3QtPnNlZ19pZF9i
dWYuc2l6ZSk7DQorDQogCQlyZXQgPSB2cHVfZGVjX3N0YXJ0KCZpbnN0LT52cHUsIGRhdGEsIDMp
Ow0KIAkJaWYgKHJldCkgew0KIAkJCW10a192Y29kZWNfZXJyKGluc3QsICJ2cHVfZGVjX3N0YXJ0
IGZhaWxlZCIpOw0KIAkJCWdvdG8gREVDT0RFX0VSUk9SOw0KIAkJfQ0KIA0KKwkJaWYgKHZzaS0+
c2hvd19mcmFtZSAmIEJJVCgxKSkgew0KKwkJCW1lbXNldChpbnN0LT5zZWdfaWRfYnVmLnZhLCAw
LCBpbnN0LT5zZWdfaWRfYnVmLnNpemUpOw0KKw0KKwkJCWlmICh2c2ktPnNob3dfZnJhbWUgJiBC
SVQoMikpIHsNCisJCQkJaWYgKHZwdV9kZWNfc3RhcnQoJmluc3QtPnZwdSwgTlVMTCwgMCkpIHsN
CisJCQkJCW10a192Y29kZWNfZXJyKGluc3QsICJ2cHUgdHJpZyBkZWNvZGVyIGZhaWxlZCIpOw0K
KwkJCQkJZ290byBERUNPREVfRVJST1I7DQorCQkJCX0NCisJCQl9DQorCQl9DQorDQogCQlyZXQg
PSB2YWxpZGF0ZV92c2lfYXJyYXlfaW5kZXhlcyhpbnN0LCB2c2kpOw0KIAkJaWYgKHJldCkgew0K
IAkJCW10a192Y29kZWNfZXJyKGluc3QsICJJbnZhbGlkIHZhbHVlcyBmcm9tIFZQVS4iKTsNCi0t
IA0KMi4xOC4wDQo=

