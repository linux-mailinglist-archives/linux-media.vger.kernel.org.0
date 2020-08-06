Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6480D23D74E
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 09:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgHFHaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 03:30:07 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:56711 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728298AbgHFHaG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 03:30:06 -0400
X-UUID: 011edb3985af4447af090da0ddf01205-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=B8qaPDjKTfOIbqITwnr8BqIaksFSTvTxUkaMPB1xRYM=;
        b=g3zLm8dNbp40J01i/yYzw2SMc2ExBI05wGquGdG69920gPZgXvfI6VXaLA4k7986fVAp+6tm4log+Wkt879Ddgof6meoYTYVz8K5CILNhXcDn/SpS/A3eKczVJuBQtHCyM77zomip9fGHzR4twHAswjPqDR572ux28X9RLZUvUM=;
X-UUID: 011edb3985af4447af090da0ddf01205-20200806
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1899365968; Thu, 06 Aug 2020 15:30:02 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 15:29:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 15:29:59 +0800
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
Subject: [PATCH V1] media: mc-device.c: change media_device_request_alloc to match media_ioctl_info
Date:   Thu, 6 Aug 2020 15:29:52 +0800
Message-ID: <20200806072952.11709-2-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200806072952.11709-1-frederic.chen@mediatek.com>
References: <20200806072952.11709-1-frederic.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 0A052C7018DA07F1261F4C1F1DC0A8B028AFDDE8F537988F71012BDB323D49AF2000:8
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
cml2ZXJzL21lZGlhL21jL21jLWRldmljZS5jIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL21jL21jLWRldmljZS5jIGIvZHJpdmVycy9tZWRpYS9tYy9tYy1kZXZpY2UuYw0KaW5kZXgg
ZGE4MDg4MzUxMTM1Li5iYzViNWVjYjY1ODEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL21j
L21jLWRldmljZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL21jL21jLWRldmljZS5jDQpAQCAtMzcw
LDkgKzM3MCwxMCBAQCBzdGF0aWMgbG9uZyBtZWRpYV9kZXZpY2VfZ2V0X3RvcG9sb2d5KHN0cnVj
dCBtZWRpYV9kZXZpY2UgKm1kZXYsIHZvaWQgKmFyZykNCiAJcmV0dXJuIHJldDsNCiB9DQogDQot
c3RhdGljIGxvbmcgbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxsb2Moc3RydWN0IG1lZGlhX2Rldmlj
ZSAqbWRldiwNCi0JCQkJICAgICAgIGludCAqYWxsb2NfZmQpDQorc3RhdGljIGxvbmcgbWVkaWFf
ZGV2aWNlX3JlcXVlc3RfYWxsb2Moc3RydWN0IG1lZGlhX2RldmljZSAqbWRldiwgdm9pZCAqYXJn
KQ0KIHsNCisJaW50ICphbGxvY19mZCA9IGFyZzsNCisNCiAjaWZkZWYgQ09ORklHX01FRElBX0NP
TlRST0xMRVJfUkVRVUVTVF9BUEkNCiAJaWYgKCFtZGV2LT5vcHMgfHwgIW1kZXYtPm9wcy0+cmVx
X3ZhbGlkYXRlIHx8ICFtZGV2LT5vcHMtPnJlcV9xdWV1ZSkNCiAJCXJldHVybiAtRU5PVFRZOw0K
LS0gDQoyLjE4LjANCg==

