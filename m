Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345681FC3E3
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 03:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgFQBxK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 21:53:10 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:45815 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726253AbgFQBxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 21:53:10 -0400
X-UUID: ae6459fcebfc49bea1f3f01cd468911b-20200617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AHVzKhLaX2oKGkCZYazZw4xrXIbvh2oXu4tD1iY5vY0=;
        b=bSnL6jozmOom2MRcFbEMkfOJGaw8QLxRFogdtM3jF7GIEaup+CRJgtJ2shVnfVIr0sxw3N/1QCcrR/+jVlwvSl78Dp1/uf6u5VgBEXZUZlgVa8u1jsqaLLZpINyW2HTbqFklAKpJQAOeDwDJWyHWl/8Iey3kVMiIYB/ooags7FA=;
X-UUID: ae6459fcebfc49bea1f3f01cd468911b-20200617
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 50012595; Wed, 17 Jun 2020 09:53:05 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 09:53:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 09:52:57 +0800
From:   Yunfei Dong <yunfei.dong@mediatek.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH 1/2] media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Date:   Wed, 17 Jun 2020 09:49:27 +0800
Message-ID: <20200617014928.4374-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: BA3C3E7F9A7679BEB34F77C5A76B6AB4D6C36B310217DF74FF99172E8D4ED8832000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBWNEwyX0JVRl9DQVBfU1VQUE9SVFNfUk9f
UkVRVUVTVFMNCmZsYWcuIFRoaXMgZmxhZyBpcyB1c2VkIGZvciBSTyBSZXF1ZXN0Lg0KDQpTaWdu
ZWQtb2ZmLWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQog
RG9jdW1lbnRhdGlvbi91c2Vyc3BhY2UtYXBpL21lZGlhL3Y0bC92aWRpb2MtcmVxYnVmcy5yc3Qg
fCA0ICsrKysNCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3ZpZGlvYy1yZXFidWZzLnJz
dCBiL0RvY3VtZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9jLXJlcWJ1ZnMu
cnN0DQppbmRleCBiNmQ1MjA4MzcwN2IuLjdjNzQ1MTc3M2I4ZSAxMDA2NDQNCi0tLSBhL0RvY3Vt
ZW50YXRpb24vdXNlcnNwYWNlLWFwaS9tZWRpYS92NGwvdmlkaW9jLXJlcWJ1ZnMucnN0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvbWVkaWEvdjRsL3ZpZGlvYy1yZXFidWZzLnJz
dA0KQEAgLTEyNiw2ICsxMjYsNyBAQCBhYm9ydGluZyBvciBmaW5pc2hpbmcgYW55IERNQSBpbiBw
cm9ncmVzcywgYW4gaW1wbGljaXQNCiAuLiBfVjRMMi1CVUYtQ0FQLVNVUFBPUlRTLVJFUVVFU1RT
Og0KIC4uIF9WNEwyLUJVRi1DQVAtU1VQUE9SVFMtT1JQSEFORUQtQlVGUzoNCiAuLiBfVjRMMi1C
VUYtQ0FQLVNVUFBPUlRTLU0yTS1IT0xELUNBUFRVUkUtQlVGOg0KKy4uIF9WNEwyLUJVRi1DQVAt
U1VQUE9SVFMtUk8tUkVRVUVTVFM6DQogDQogLi4gY3NzY2xhc3M6OiBsb25ndGFibGUNCiANCkBA
IC0xNTYsNiArMTU3LDkgQEAgYWJvcnRpbmcgb3IgZmluaXNoaW5nIGFueSBETUEgaW4gcHJvZ3Jl
c3MsIGFuIGltcGxpY2l0DQogICAgICAgLSBPbmx5IHZhbGlkIGZvciBzdGF0ZWxlc3MgZGVjb2Rl
cnMuIElmIHNldCwgdGhlbiB1c2Vyc3BhY2UgY2FuIHNldCB0aGUNCiAgICAgICAgIGBgVjRMMl9C
VUZfRkxBR19NMk1fSE9MRF9DQVBUVVJFX0JVRmBgIGZsYWcgdG8gaG9sZCBvZmYgb24gcmV0dXJu
aW5nIHRoZQ0KIAljYXB0dXJlIGJ1ZmZlciB1bnRpbCB0aGUgT1VUUFVUIHRpbWVzdGFtcCBjaGFu
Z2VzLg0KKyAgICAqIC0gYGBWNEwyX0JVRl9DQVBfU1VQUE9SVFNfUk9fUkVRVUVTVFNgYA0KKyAg
ICAgIC0gMHgwMDAwMDA0MA0KKyAgICAgIC0gVGhpcyBidWZmZXIgdHlwZSBzdXBwb3J0cyA6cmVm
OmByZXF1ZXN0cyA8bWVkaWEtcmVxdWVzdC1hcGk+YC4NCiANCiBSZXR1cm4gVmFsdWUNCiA9PT09
PT09PT09PT0NCi0tIA0KMi4yNS4xDQo=

