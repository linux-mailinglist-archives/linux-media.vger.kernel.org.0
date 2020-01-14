Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A87139FFD
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 04:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729568AbgANDcl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 22:32:41 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:12117 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729049AbgANDcl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 22:32:41 -0500
X-UUID: 098240cd3e7a43099e43b09fc090a668-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XLvcWral8p9KiUuPJwP/lks3XQA8VB4u3bPZ7v2sRGk=;
        b=RwNSojpB5vo6kCRx0n9uhj2e/9lVZwNoNC6oEPN2f753noLbqCrU1T1ATvmTGQVBKwWVwVaHf3ODpiwuDAxrrIp1itGuRNBl1MQvfk5JtLfkNzCGYI1smLCT8xGqWyLV8E9K+Sg4GcAcW0aQb8zskVjVvW+ud8GvyFm54CujnbM=;
X-UUID: 098240cd3e7a43099e43b09fc090a668-20200114
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1321228197; Tue, 14 Jan 2020 11:32:36 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 11:32:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 11:32:46 +0800
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
Subject: media: mtk-vcodec: reset segment data then trig decoder
Date:   Tue, 14 Jan 2020 11:32:26 +0800
Message-ID: <20200114033226.16786-1-gtk_ruiwang@mediatek.com>
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
c2V0IHNlZ21lbnQgZGF0YSBvbmx5IHdoZW4gbmVlZGVkLCB0aGVuIHRyaWcgZGVjb2RlciBoYXJk
d2FyZQ0KDQpTaWduZWQtb2ZmLWJ5OiBSdWkgV2FuZyA8Z3RrX3J1aXdhbmdAbWVkaWF0ZWsuY29t
Pg0KLS0tDQogLi4uL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVjX3ZwOV9pZi5jICAgIHwg
MTkgKysrKysrKysrKysrKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstdmNvZGVjL3ZkZWMvdmRlY192cDlfaWYuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMNCmluZGV4IDI0YzFmMGJmMjE0Ny4uNDJjOWMzYzk4
MDc2IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3ZkZWMv
dmRlY192cDlfaWYuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3Zk
ZWMvdmRlY192cDlfaWYuYw0KQEAgLTExMCw3ICsxMTAsOSBAQCBzdHJ1Y3QgdnA5X3NmX3JlZl9m
YiB7DQogICogQGJ1Zl9sZW5fc3pfYyA6IHNpemUgdXNlZCB0byBzdG9yZSBjYmNyIHBsYW5lIHVm
byBpbmZvIChBUC1SLCBWUFUtVykNCiANCiAgKiBAcHJvZmlsZSA6IHByb2ZpbGUgc3BhcnNlZCBm
cm9tIHZwdSAoQVAtUiwgVlBVLVcpDQotICogQHNob3dfZnJhbWUgOiBkaXNwbGF5IHRoaXMgZnJh
bWUgb3Igbm90IChBUC1SLCBWUFUtVykNCisgKiBAc2hvd19mcmFtZSA6IFtCSVQoMCldIGRpc3Bs
YXkgdGhpcyBmcmFtZSBvciBub3QgKEFQLVIsIFZQVS1XKQ0KKyAqCVtCSVQoMTQpXSByZXNldCBz
ZWdtZW50IGRhdGEgb3Igbm90IChBUC1SLCBWUFUtVykNCisgKglbQklUKDE1KV0gdHJpZyBkZWNv
ZGVyIGhhcmR3YXJlIG9yIG5vdCAoQVAtUiwgVlBVLVcpDQogICogQHNob3dfZXhpc3RpbmdfZnJh
bWUgOiBpbmZvcm0gdGhpcyBmcmFtZSBpcyBzaG93IGV4aXN0aW5nIGZyYW1lDQogICoJKEFQLVIs
IFZQVS1XKQ0KICAqIEBmcm1fdG9fc2hvd19pZHggOiBpbmRleCB0byBzaG93IGZyYW1lIChBUC1S
LCBWUFUtVykNCkBAIC00OTQsMTIgKzQ5NiwxMiBAQCBzdGF0aWMgdm9pZCB2cDlfc3dhcF9mcm1f
YnVmcyhzdHJ1Y3QgdmRlY192cDlfaW5zdCAqaW5zdCkNCiAJCQkJCWZybV90b19zaG93LT5mYi0+
YmFzZV95LnNpemUpOw0KIAkJfQ0KIAkJaWYgKCF2cDlfaXNfc2ZfcmVmX2ZiKGluc3QsIGluc3Qt
PmN1cl9mYikpIHsNCi0JCQlpZiAodnNpLT5zaG93X2ZyYW1lKQ0KKwkJCWlmICh2c2ktPnNob3df
ZnJhbWUgJiBCSVQoMCkpDQogCQkJCXZwOV9hZGRfdG9fZmJfZGlzcF9saXN0KGluc3QsIGluc3Qt
PmN1cl9mYik7DQogCQl9DQogCX0gZWxzZSB7DQogCQlpZiAoIXZwOV9pc19zZl9yZWZfZmIoaW5z
dCwgaW5zdC0+Y3VyX2ZiKSkgew0KLQkJCWlmICh2c2ktPnNob3dfZnJhbWUpDQorCQkJaWYgKHZz
aS0+c2hvd19mcmFtZSAmIEJJVCgwKSkNCiAJCQkJdnA5X2FkZF90b19mYl9kaXNwX2xpc3QoaW5z
dCwgZnJtX3RvX3Nob3ctPmZiKTsNCiAJCX0NCiAJfQ0KQEAgLTg3MCwxMyArODcyLDIyIEBAIHN0
YXRpYyBpbnQgdmRlY192cDlfZGVjb2RlKHZvaWQgKmhfdmRlYywgc3RydWN0IG10a192Y29kZWNf
bWVtICpicywNCiAJCQkJCXZzaS0+c2ZfZnJtX3N6W2lkeF0pOw0KIAkJCX0NCiAJCX0NCi0JCW1l
bXNldChpbnN0LT5zZWdfaWRfYnVmLnZhLCAwLCBpbnN0LT5zZWdfaWRfYnVmLnNpemUpOw0KIAkJ
cmV0ID0gdnB1X2RlY19zdGFydCgmaW5zdC0+dnB1LCBkYXRhLCAzKTsNCiAJCWlmIChyZXQpIHsN
CiAJCQltdGtfdmNvZGVjX2VycihpbnN0LCAidnB1X2RlY19zdGFydCBmYWlsZWQiKTsNCiAJCQln
b3RvIERFQ09ERV9FUlJPUjsNCiAJCX0NCiANCisJCWlmICgodnNpLT5zaG93X2ZyYW1lICYgQklU
KDE1KSkgJiYNCisJCSAgICAodnNpLT5zaG93X2ZyYW1lICYgQklUKDE0KSkpIHsNCisJCQltZW1z
ZXQoaW5zdC0+c2VnX2lkX2J1Zi52YSwgMCwgaW5zdC0+c2VnX2lkX2J1Zi5zaXplKTsNCisJCQly
ZXQgPSB2cHVfZGVjX3N0YXJ0KCZpbnN0LT52cHUsIE5VTEwsIDApOw0KKwkJCWlmIChyZXQpIHsN
CisJCQkJbXRrX3Zjb2RlY19lcnIoaW5zdCwgInZwdSB0cmlnIGRlY29kZXIgZmFpbGVkIik7DQor
CQkJCWdvdG8gREVDT0RFX0VSUk9SOw0KKwkJCX0NCisJCX0NCisNCiAJCXJldCA9IHZhbGlkYXRl
X3ZzaV9hcnJheV9pbmRleGVzKGluc3QsIHZzaSk7DQogCQlpZiAocmV0KSB7DQogCQkJbXRrX3Zj
b2RlY19lcnIoaW5zdCwgIkludmFsaWQgdmFsdWVzIGZyb20gVlBVLiIpOw0KLS0gDQoyLjE4LjAN
Cg==

