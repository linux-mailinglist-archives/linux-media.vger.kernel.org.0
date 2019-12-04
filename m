Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B537112BF6
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 13:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727897AbfLDMrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 07:47:48 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60395 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726832AbfLDMrs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 07:47:48 -0500
X-UUID: c4ca31fc9e5a4bff89753803b7f98c39-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=AJ6EJ09qaARojHJVEQN6B8vyTmhEAX2xvL+vGW8QBaU=;
        b=rdUNfcQIvYCeI2NBJoGMPH8MeXwADc7TbsJv5o0UfBbDLYwboAHoEv62c3WRETa7Qn4vWwlIp2x3lQrdq9fCj9dkBHPAKZsvcIHPPwJkP1CqpRPTz2bfNJk9zHeZ1nCveoC4ARQUqiIiPbXh+88wz1qnok6hFSTae7wIi72Gmew=;
X-UUID: c4ca31fc9e5a4bff89753803b7f98c39-20191204
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <jerry-ch.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1339013228; Wed, 04 Dec 2019 20:47:42 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 20:47:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Dec 2019 20:46:45 +0800
From:   Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <pihsun@chromium.org>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <jungo.lin@mediatek.com>, <Rynn.Wu@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>,
        Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
Subject: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend, v4l2_m2m_resume
Date:   Wed, 4 Dec 2019 20:47:29 +0800
Message-ID: <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogUGktSHN1biBTaGloIDxwaWhzdW5AY2hyb21pdW0ub3JnPg0KDQpBZGQgdHdvIGZ1bmN0
aW9ucyB0aGF0IGNhbiBiZSB1c2VkIHRvIHN0b3AgbmV3IGpvYnMgZnJvbSBiZWluZyBxdWV1ZWQg
Lw0KY29udGludWUgcnVubmluZyBxdWV1ZWQgam9iLiBUaGlzIGNhbiBiZSB1c2VkIHdoaWxlIGEg
ZHJpdmVyIHVzaW5nIG0ybQ0KaGVscGVyIGlzIGdvaW5nIHRvIHN1c3BlbmQgLyB3YWtlIHVwIGZy
b20gcmVzdW1lLCBhbmQgY2FuIGVuc3VyZSB0aGF0DQp0aGVyZSdzIG5vIGpvYiBydW5uaW5nIGlu
IHN1c3BlbmQgcHJvY2Vzcy4NCg0KQlVHPWI6MTQzMDQ2ODMzDQpURVNUPWJ1aWxkDQoNClNpZ25l
ZC1vZmYtYnk6IFBpLUhzdW4gU2hpaCA8cGloc3VuQGNocm9taXVtLm9yZz4NClNpZ25lZC1vZmYt
Ynk6IEplcnJ5LWNoIENoZW4gPGplcnJ5LWNoLmNoZW5AbWVkaWF0ZWsuY29ycC1wYXJ0bmVyLmdv
b2dsZS5jb20+DQotLS0NCiBkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLW1lbTJtZW0uYyB8
IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9tZWRpYS92NGwyLW1lbTJt
ZW0uaCAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNjIg
aW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1tZW0ybWVtLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLW1lbTJtZW0uYw0KaW5k
ZXggNWJiZGVjNTViN2Q3Li43NmJhMjAzZTAwMzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92NGwyLW1lbTJtZW0uYw0KKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1tZW0ybWVtLmMNCkBAIC00Nyw2ICs0NywxMCBAQCBtb2R1bGVfcGFyYW0oZGVidWcsIGJv
b2wsIDA2NDQpOw0KICNkZWZpbmUgVFJBTlNfQUJPUlQJCSgxIDw8IDIpDQogDQogDQorLyogVGhl
IGpvYiBxdWV1ZSBpcyBub3QgcnVubmluZyBuZXcgam9icyAqLw0KKyNkZWZpbmUgUVVFVUVfUEFV
U0VECQkoMSA8PCAwKQ0KKw0KKw0KIC8qIE9mZnNldCBiYXNlIGZvciBidWZmZXJzIG9uIHRoZSBk
ZXN0aW5hdGlvbiBxdWV1ZSAtIHVzZWQgdG8gZGlzdGluZ3Vpc2gNCiAgKiBiZXR3ZWVuIHNvdXJj
ZSBhbmQgZGVzdGluYXRpb24gYnVmZmVycyB3aGVuIG1tYXBwaW5nIC0gdGhleSByZWNlaXZlIHRo
ZSBzYW1lDQogICogb2Zmc2V0cyBidXQgZm9yIGRpZmZlcmVudCBxdWV1ZXMgKi8NCkBAIC04OCw2
ICs5Miw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgbTJtX2VudGl0eV9uYW1lW10gPSB7
DQogICogQGpvYl9xdWV1ZToJCWluc3RhbmNlcyBxdWV1ZWQgdG8gcnVuDQogICogQGpvYl9zcGlu
bG9jazoJcHJvdGVjdHMgam9iX3F1ZXVlDQogICogQGpvYl93b3JrOgkJd29ya2VyIHRvIHJ1biBx
dWV1ZWQgam9icy4NCisgKiBAam9iX3F1ZXVlX2ZsYWdzOglmbGFncyBvZiB0aGUgcXVldWUgc3Rh
dHVzLCAlUVVFVUVfUEFVU0VELg0KICAqIEBtMm1fb3BzOgkJZHJpdmVyIGNhbGxiYWNrcw0KICAq
Lw0KIHN0cnVjdCB2NGwyX20ybV9kZXYgew0KQEAgLTEwNSw2ICsxMTAsNyBAQCBzdHJ1Y3QgdjRs
Ml9tMm1fZGV2IHsNCiAJc3RydWN0IGxpc3RfaGVhZAlqb2JfcXVldWU7DQogCXNwaW5sb2NrX3QJ
CWpvYl9zcGlubG9jazsNCiAJc3RydWN0IHdvcmtfc3RydWN0CWpvYl93b3JrOw0KKwl1bnNpZ25l
ZCBsb25nCQlqb2JfcXVldWVfZmxhZ3M7DQogDQogCWNvbnN0IHN0cnVjdCB2NGwyX20ybV9vcHMg
Km0ybV9vcHM7DQogfTsNCkBAIC0yNjcsNiArMjczLDEyIEBAIHN0YXRpYyB2b2lkIHY0bDJfbTJt
X3RyeV9ydW4oc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2RldikNCiAJCXJldHVybjsNCiAJfQ0K
IA0KKwlpZiAobTJtX2Rldi0+am9iX3F1ZXVlX2ZsYWdzICYgUVVFVUVfUEFVU0VEKSB7DQorCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZtMm1fZGV2LT5qb2Jfc3BpbmxvY2ssIGZsYWdzKTsNCisJ
CWRwcmludGsoIlJ1bm5pbmcgbmV3IGpvYnMgaXMgcGF1c2VkXG4iKTsNCisJCXJldHVybjsNCisJ
fQ0KKw0KIAltMm1fZGV2LT5jdXJyX2N0eCA9IGxpc3RfZmlyc3RfZW50cnkoJm0ybV9kZXYtPmpv
Yl9xdWV1ZSwNCiAJCQkJICAgc3RydWN0IHY0bDJfbTJtX2N0eCwgcXVldWUpOw0KIAltMm1fZGV2
LT5jdXJyX2N0eC0+am9iX2ZsYWdzIHw9IFRSQU5TX1JVTk5JTkc7DQpAQCAtNDQ3LDYgKzQ1OSwz
NCBAQCB2b2lkIHY0bDJfbTJtX2pvYl9maW5pc2goc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2Rl
diwNCiB9DQogRVhQT1JUX1NZTUJPTCh2NGwyX20ybV9qb2JfZmluaXNoKTsNCiANCit2b2lkIHY0
bDJfbTJtX3N1c3BlbmQoc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2RldikNCit7DQorCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQorCXN0cnVjdCB2NGwyX20ybV9jdHggKmN1cnJfY3R4Ow0KKw0KKwlz
cGluX2xvY2tfaXJxc2F2ZSgmbTJtX2Rldi0+am9iX3NwaW5sb2NrLCBmbGFncyk7DQorCW0ybV9k
ZXYtPmpvYl9xdWV1ZV9mbGFncyB8PSBRVUVVRV9QQVVTRUQ7DQorCWN1cnJfY3R4ID0gbTJtX2Rl
di0+Y3Vycl9jdHg7DQorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm0ybV9kZXYtPmpvYl9zcGlu
bG9jaywgZmxhZ3MpOw0KKw0KKwlpZiAoY3Vycl9jdHgpDQorCQl3YWl0X2V2ZW50KGN1cnJfY3R4
LT5maW5pc2hlZCwNCisJCQkgICAhKGN1cnJfY3R4LT5qb2JfZmxhZ3MgJiBUUkFOU19SVU5OSU5H
KSk7DQorfQ0KK0VYUE9SVF9TWU1CT0wodjRsMl9tMm1fc3VzcGVuZCk7DQorDQordm9pZCB2NGwy
X20ybV9yZXN1bWUoc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2RldikNCit7DQorCXVuc2lnbmVk
IGxvbmcgZmxhZ3M7DQorDQorCXNwaW5fbG9ja19pcnFzYXZlKCZtMm1fZGV2LT5qb2Jfc3Bpbmxv
Y2ssIGZsYWdzKTsNCisJbTJtX2Rldi0+am9iX3F1ZXVlX2ZsYWdzICY9IH5RVUVVRV9QQVVTRUQ7
DQorCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm0ybV9kZXYtPmpvYl9zcGlubG9jaywgZmxhZ3Mp
Ow0KKw0KKwl2NGwyX20ybV90cnlfcnVuKG0ybV9kZXYpOw0KK30NCitFWFBPUlRfU1lNQk9MKHY0
bDJfbTJtX3Jlc3VtZSk7DQorDQogaW50IHY0bDJfbTJtX3JlcWJ1ZnMoc3RydWN0IGZpbGUgKmZp
bGUsIHN0cnVjdCB2NGwyX20ybV9jdHggKm0ybV9jdHgsDQogCQkgICAgIHN0cnVjdCB2NGwyX3Jl
cXVlc3RidWZmZXJzICpyZXFidWZzKQ0KIHsNCmRpZmYgLS1naXQgYS9pbmNsdWRlL21lZGlhL3Y0
bDItbWVtMm1lbS5oIGIvaW5jbHVkZS9tZWRpYS92NGwyLW1lbTJtZW0uaA0KaW5kZXggNTQ2NzI2
NDc3MWVjLi4xMTlhMTk1ZGEzOTAgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL21lZGlhL3Y0bDItbWVt
Mm1lbS5oDQorKysgYi9pbmNsdWRlL21lZGlhL3Y0bDItbWVtMm1lbS5oDQpAQCAtMTgzLDYgKzE4
MywyOCBAQCB2NGwyX20ybV9idWZfZG9uZShzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICpidWYsIGVu
dW0gdmIyX2J1ZmZlcl9zdGF0ZSBzdGF0ZSkNCiAJdmIyX2J1ZmZlcl9kb25lKCZidWYtPnZiMl9i
dWYsIHN0YXRlKTsNCiB9DQogDQorLyoqDQorICogdjRsMl9tMm1fc3VzcGVuZCgpIC0gc3RvcCBu
ZXcgam9icyBmcm9tIGJlaW5nIHJ1biBhbmQgd2FpdCBmb3IgY3VycmVudCBqb2INCisgKiB0byBm
aW5pc2gNCisgKg0KKyAqIEBtMm1fZGV2OiBvcGFxdWUgcG9pbnRlciB0byB0aGUgaW50ZXJuYWwg
ZGF0YSB0byBoYW5kbGUgTTJNIGNvbnRleHQNCisgKg0KKyAqIENhbGxlZCBieSBhIGRyaXZlciBp
biB0aGUgc3VzcGVuZCBob29rLiBTdG9wIG5ldyBqb2JzIGZyb20gYmVpbmcgcnVuLCBhbmQNCisg
KiB3YWl0IGZvciBjdXJyZW50IHJ1bm5pbmcgam9iIHRvIGZpbmlzaC4NCisgKi8NCit2b2lkIHY0
bDJfbTJtX3N1c3BlbmQoc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2Rldik7DQorDQorLyoqDQor
ICogdjRsMl9tMm1fcmVzdW1lKCkgLSByZXN1bWUgam9iIHJ1bm5pbmcgYW5kIHRyeSB0byBydW4g
YSBxdWV1ZWQgam9iDQorICoNCisgKiBAbTJtX2Rldjogb3BhcXVlIHBvaW50ZXIgdG8gdGhlIGlu
dGVybmFsIGRhdGEgdG8gaGFuZGxlIE0yTSBjb250ZXh0DQorICoNCisgKiBDYWxsZWQgYnkgYSBk
cml2ZXIgaW4gdGhlIHJlc3VtZSBob29rLiBUaGlzIHJldmVydHMgdGhlIG9wZXJhdGlvbiBvZg0K
KyAqIHY0bDJfbTJtX3N1c3BlbmQoKSBhbmQgYWxsb3dzIGpvYiB0byBiZSBydW4uIEFsc28gdHJ5
IHRvIHJ1biBhIHF1ZXVlZCBqb2IgaWYNCisgKiB0aGVyZSBpcyBhbnkuDQorICovDQordm9pZCB2
NGwyX20ybV9yZXN1bWUoc3RydWN0IHY0bDJfbTJtX2RldiAqbTJtX2Rldik7DQorDQogLyoqDQog
ICogdjRsMl9tMm1fcmVxYnVmcygpIC0gbXVsdGktcXVldWUtYXdhcmUgUkVRQlVGUyBtdWx0aXBs
ZXhlcg0KICAqDQotLSANCjIuMTguMA0K

