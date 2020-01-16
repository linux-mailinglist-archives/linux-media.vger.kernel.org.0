Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A841C13D608
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 09:41:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731187AbgAPIlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 03:41:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:17519 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727009AbgAPIlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 03:41:15 -0500
X-UUID: 98a1ffaac5b04842b2e9094fe4b03bb8-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tTAYhyV1yO1eGfYT9UX2vuD8lvcZaEL8mGmAAGdJsuQ=;
        b=kk6g4iGbbeHRKbyQIY9b/5wh+CTLoS7BQGWBbPYDCwc7fy/YMeoX1csBUuSkyopBBwpNRFSaHe6jRx+e/OwwNgtI1KpJGOth80OPRTA1GrHT/7UtyuJaxcWNLbxdXv6sVJkYrD8iapIfv/BIzLEyAKAl/HiYwZMNL2EVNnqtaes=;
X-UUID: 98a1ffaac5b04842b2e9094fe4b03bb8-20200116
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <gtk_ruiwang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 543665243; Thu, 16 Jan 2020 16:41:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 Jan 2020 16:40:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 16 Jan 2020 16:40:20 +0800
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
Subject: [PATCH][v2] media: mtk-vcodec: reset segment data then trig decoder
Date:   Thu, 16 Jan 2020 16:41:02 +0800
Message-ID: <20200116084102.5079-1-gtk_ruiwang@mediatek.com>
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
bT4NCi0tLQ0KQ2hhbmdlZCBpbiB2MjoNCi0gYWRkIGJpdDMmYml0NCBmb3Iga2VybmVsIGFuZCB2
cHUtZmlybXdhcmUgY29tcGF0aWJpbGl0eSANCi0tLQ0KIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVj
L3ZkZWMvdmRlY192cDlfaWYuYyAgICB8IDI5ICsrKysrKysrKysrKysrKystLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvdmRlYy92ZGVjX3ZwOV9pZi5jDQppbmRl
eCAyNGMxZjBiZjIxNDcuLjA4M2FlY2EyODhmNiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMNCisrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfdnA5X2lmLmMNCkBAIC0xMTAsNyArMTEw
LDExIEBAIHN0cnVjdCB2cDlfc2ZfcmVmX2ZiIHsNCiAgKiBAYnVmX2xlbl9zel9jIDogc2l6ZSB1
c2VkIHRvIHN0b3JlIGNiY3IgcGxhbmUgdWZvIGluZm8gKEFQLVIsIFZQVS1XKQ0KIA0KICAqIEBw
cm9maWxlIDogcHJvZmlsZSBzcGFyc2VkIGZyb20gdnB1IChBUC1SLCBWUFUtVykNCi0gKiBAc2hv
d19mcmFtZSA6IGRpc3BsYXkgdGhpcyBmcmFtZSBvciBub3QgKEFQLVIsIFZQVS1XKQ0KKyAqIEBz
aG93X2ZyYW1lIDogW0JJVCgwKV0gZGlzcGxheSB0aGlzIGZyYW1lIG9yIG5vdCAoQVAtUiwgVlBV
LVcpDQorICoJW0JJVCgxKV0gcmVzZXQgc2VnbWVudCBkYXRhIG9yIG5vdCAoQVAtUiwgVlBVLVcp
DQorICoJW0JJVCgyKV0gdHJpZyBkZWNvZGVyIGhhcmR3YXJlIG9yIG5vdCAoQVAtUiwgVlBVLVcp
DQorICoJW0JJVCgzKV0gbm90aWZ5IFZQVSBzZXQgZGVjb2RlciBiZWhhdmlvciAoQVAtVywgVlBV
LVIpDQorICoJW0JJVCg0KV0gZG8gbm90IHJlc2V0IHNlZ21lbnQgZGF0YSBiZWZvcmUgZXZlcnkg
ZnJhbWUgKEFQLVIsIFZQVS1XKQ0KICAqIEBzaG93X2V4aXN0aW5nX2ZyYW1lIDogaW5mb3JtIHRo
aXMgZnJhbWUgaXMgc2hvdyBleGlzdGluZyBmcmFtZQ0KICAqCShBUC1SLCBWUFUtVykNCiAgKiBA
ZnJtX3RvX3Nob3dfaWR4IDogaW5kZXggdG8gc2hvdyBmcmFtZSAoQVAtUiwgVlBVLVcpDQpAQCAt
NDk0LDEyICs0OTgsMTIgQEAgc3RhdGljIHZvaWQgdnA5X3N3YXBfZnJtX2J1ZnMoc3RydWN0IHZk
ZWNfdnA5X2luc3QgKmluc3QpDQogCQkJCQlmcm1fdG9fc2hvdy0+ZmItPmJhc2VfeS5zaXplKTsN
CiAJCX0NCiAJCWlmICghdnA5X2lzX3NmX3JlZl9mYihpbnN0LCBpbnN0LT5jdXJfZmIpKSB7DQot
CQkJaWYgKHZzaS0+c2hvd19mcmFtZSkNCisJCQlpZiAodnNpLT5zaG93X2ZyYW1lICYgQklUKDAp
KQ0KIAkJCQl2cDlfYWRkX3RvX2ZiX2Rpc3BfbGlzdChpbnN0LCBpbnN0LT5jdXJfZmIpOw0KIAkJ
fQ0KIAl9IGVsc2Ugew0KIAkJaWYgKCF2cDlfaXNfc2ZfcmVmX2ZiKGluc3QsIGluc3QtPmN1cl9m
YikpIHsNCi0JCQlpZiAodnNpLT5zaG93X2ZyYW1lKQ0KKwkJCWlmICh2c2ktPnNob3dfZnJhbWUg
JiBCSVQoMCkpDQogCQkJCXZwOV9hZGRfdG9fZmJfZGlzcF9saXN0KGluc3QsIGZybV90b19zaG93
LT5mYik7DQogCQl9DQogCX0NCkBAIC04MDAsNiArODA0LDkgQEAgc3RhdGljIGludCB2ZGVjX3Zw
OV9pbml0KHN0cnVjdCBtdGtfdmNvZGVjX2N0eCAqY3R4KQ0KIAl9DQogDQogCWluc3QtPnZzaSA9
IChzdHJ1Y3QgdmRlY192cDlfdnNpICopaW5zdC0+dnB1LnZzaTsNCisNCisJaW5zdC0+dnNpLT5z
aG93X2ZyYW1lIHw9IEJJVCgzKTsNCisNCiAJaW5pdF9hbGxfZmJfbGlzdHMoaW5zdCk7DQogDQog
CWN0eC0+ZHJ2X2hhbmRsZSA9IGluc3Q7DQpAQCAtODcwLDEzICs4NzcsMjcgQEAgc3RhdGljIGlu
dCB2ZGVjX3ZwOV9kZWNvZGUodm9pZCAqaF92ZGVjLCBzdHJ1Y3QgbXRrX3Zjb2RlY19tZW0gKmJz
LA0KIAkJCQkJdnNpLT5zZl9mcm1fc3pbaWR4XSk7DQogCQkJfQ0KIAkJfQ0KLQkJbWVtc2V0KGlu
c3QtPnNlZ19pZF9idWYudmEsIDAsIGluc3QtPnNlZ19pZF9idWYuc2l6ZSk7DQorDQorCQlpZiAo
ISh2c2ktPnNob3dfZnJhbWUgJiBCSVQoNCkpKQ0KKwkJCW1lbXNldChpbnN0LT5zZWdfaWRfYnVm
LnZhLCAwLCBpbnN0LT5zZWdfaWRfYnVmLnNpemUpOw0KKw0KIAkJcmV0ID0gdnB1X2RlY19zdGFy
dCgmaW5zdC0+dnB1LCBkYXRhLCAzKTsNCiAJCWlmIChyZXQpIHsNCiAJCQltdGtfdmNvZGVjX2Vy
cihpbnN0LCAidnB1X2RlY19zdGFydCBmYWlsZWQiKTsNCiAJCQlnb3RvIERFQ09ERV9FUlJPUjsN
CiAJCX0NCiANCisJCWlmICh2c2ktPnNob3dfZnJhbWUgJiBCSVQoMSkpIHsNCisJCQltZW1zZXQo
aW5zdC0+c2VnX2lkX2J1Zi52YSwgMCwgaW5zdC0+c2VnX2lkX2J1Zi5zaXplKTsNCisNCisJCQlp
ZiAodnNpLT5zaG93X2ZyYW1lICYgQklUKDIpKSB7DQorCQkJCWlmICh2cHVfZGVjX3N0YXJ0KCZp
bnN0LT52cHUsIE5VTEwsIDApKSB7DQorCQkJCQltdGtfdmNvZGVjX2VycihpbnN0LCAidnB1IHRy
aWcgZGVjb2RlciBmYWlsZWQiKTsNCisJCQkJCWdvdG8gREVDT0RFX0VSUk9SOw0KKwkJCQl9DQor
CQkJfQ0KKwkJfQ0KKw0KIAkJcmV0ID0gdmFsaWRhdGVfdnNpX2FycmF5X2luZGV4ZXMoaW5zdCwg
dnNpKTsNCiAJCWlmIChyZXQpIHsNCiAJCQltdGtfdmNvZGVjX2VycihpbnN0LCAiSW52YWxpZCB2
YWx1ZXMgZnJvbSBWUFUuIik7DQotLSANCjIuMTguMA0K

