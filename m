Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF6923DFA2
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgHFRvQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:51:16 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:47473 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728380AbgHFQd0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:33:26 -0400
X-UUID: 3b9b35ab0c7e49359ef51440ffcaceb7-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/jqy0uuQRkqAFWi+8OuqK5KNOGe914saELFHNwmA2bg=;
        b=Rk1F3FC/v3b+/mKVWLTCaKYUjMbyUnWmYW35/sLkNiBznwoFea+KC1YOUs2BoVBq9WJ4vZD3zSpO8QFZoxwQvdLQbKlas/WPvYA4IAqMr0hb8WjrdQsfnVszlvddRcR/Plt3VA43f6biPa/7hiot2co30mWKCAJMrh8BeGXjUuY=;
X-UUID: 3b9b35ab0c7e49359ef51440ffcaceb7-20200806
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 190734978; Thu, 06 Aug 2020 23:58:33 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:58:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 23:58:29 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH V2,1/1] media: mc-device.c: change media_device_request_alloc to match media_ioctl_info
Date:   Thu, 6 Aug 2020 23:58:22 +0800
Message-ID: <20200806155822.3772-2-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200806155822.3772-1-frederic.chen@mediatek.com>
References: <20200806155822.3772-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: AC723459E940B4C9E933EC8C0976E988E2BBAB82E5E89873F591BA7BC913F3372000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogRnJlZGVyaWMgQ2hlbiA8ZnJlZGVyaWMuY2hlbkBtZWRpYXRlay5jb20+DQoNCldlIG1v
ZGlmaWVkIHRoZSB0eXBlIG9mIG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKCkncyBzZWNvbmQN
CnBhcmFtZXRlciBmcm9tIGludCogdG8gdm9pZCogc28gdGhhdCBpdCBjYW4gbWF0Y2ggdGhlIGlu
dGVyZmFjZQ0KZGVmaW5lZCBpbiBzdHJ1Y3QgbWVkaWFfaW9jdGxfaW5mby4NCg0KU2lnbmVkLW9m
Zi1ieTogRnJlZGVyaWMgQ2hlbiA8ZnJlZGVyaWMuY2hlbkBtZWRpYXRlay5jb20+DQotLS0NCiBk
cml2ZXJzL21lZGlhL21jL21jLWRldmljZS5jIHwgNyArKysrLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bWVkaWEvbWMvbWMtZGV2aWNlLmMgYi9kcml2ZXJzL21lZGlhL21jL21jLWRldmljZS5jDQppbmRl
eCBkYTgwODgzNTExMzUuLjZiNjZjMjA5MWJhZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
bWMvbWMtZGV2aWNlLmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvbWMvbWMtZGV2aWNlLmMNCkBAIC0z
NzAsOSArMzcwLDEwIEBAIHN0YXRpYyBsb25nIG1lZGlhX2RldmljZV9nZXRfdG9wb2xvZ3koc3Ry
dWN0IG1lZGlhX2RldmljZSAqbWRldiwgdm9pZCAqYXJnKQ0KIAlyZXR1cm4gcmV0Ow0KIH0NCiAN
Ci1zdGF0aWMgbG9uZyBtZWRpYV9kZXZpY2VfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgbWVkaWFfZGV2
aWNlICptZGV2LA0KLQkJCQkgICAgICAgaW50ICphbGxvY19mZCkNCitzdGF0aWMgbG9uZyBtZWRp
YV9kZXZpY2VfcmVxdWVzdF9hbGxvYyhzdHJ1Y3QgbWVkaWFfZGV2aWNlICptZGV2LCB2b2lkICph
cmcpDQogew0KKwlpbnQgKmFsbG9jX2ZkID0gYXJnOw0KKw0KICNpZmRlZiBDT05GSUdfTUVESUFf
Q09OVFJPTExFUl9SRVFVRVNUX0FQSQ0KIAlpZiAoIW1kZXYtPm9wcyB8fCAhbWRldi0+b3BzLT5y
ZXFfdmFsaWRhdGUgfHwgIW1kZXYtPm9wcy0+cmVxX3F1ZXVlKQ0KIAkJcmV0dXJuIC1FTk9UVFk7
DQpAQCAtNDA3LDcgKzQwOCw3IEBAIHN0YXRpYyBsb25nIGNvcHlfYXJnX3RvX3VzZXIodm9pZCBf
X3VzZXIgKnVhcmcsIHZvaWQgKmthcmcsIHVuc2lnbmVkIGludCBjbWQpDQogI2RlZmluZSBNRURJ
QV9JT0NfQVJHKF9fY21kLCBmdW5jLCBmbCwgZnJvbV91c2VyLCB0b191c2VyKQkJXA0KIAlbX0lP
Q19OUihNRURJQV9JT0NfIyNfX2NtZCldID0gewkJCQlcDQogCQkuY21kID0gTUVESUFfSU9DXyMj
X19jbWQsCQkJCVwNCi0JCS5mbiA9IChsb25nICgqKShzdHJ1Y3QgbWVkaWFfZGV2aWNlICosIHZv
aWQgKikpZnVuYywJXA0KKwkJLmZuID0gZnVuYywJCQkJCQlcDQogCQkuZmxhZ3MgPSBmbCwJCQkJ
CQlcDQogCQkuYXJnX2Zyb21fdXNlciA9IGZyb21fdXNlciwJCQkJXA0KIAkJLmFyZ190b191c2Vy
ID0gdG9fdXNlciwJCQkJCVwNCi0tIA0KMi4xOC4wDQo=

