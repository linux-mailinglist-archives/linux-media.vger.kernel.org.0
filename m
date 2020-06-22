Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFE4202E29
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2020 03:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgFVBzX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 21 Jun 2020 21:55:23 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:7073 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726910AbgFVBzW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 21 Jun 2020 21:55:22 -0400
X-UUID: 3756c7acd69a42a0bbb74e0191321fb0-20200622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zL0uYKUIajVcrjQR0y8N+YBuHqN7Cv7VTQvEPua1Nww=;
        b=PF3ssBFshqvLiWGzYDfy+YX0ciFpXzJikVGjEm67D1g0NW14n9fRfj+xK01fRdPe6TzjsuXBr2rurGu+/kz0A+julNWLlNehzX9h244J7FzRn0LveNNeR+XnHNt3n+rMTD+2ctFHkklJz+yUQNQvqpcKi/zjhV12QV5fMRbmxgU=;
X-UUID: 3756c7acd69a42a0bbb74e0191321fb0-20200622
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 792369175; Mon, 22 Jun 2020 09:55:16 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Jun 2020 09:55:12 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Jun 2020 09:55:02 +0800
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
Subject: [PATCH v2, 0/2] This patchset add Read-only(Ro) request for capture queue
Date:   Mon, 22 Jun 2020 09:52:25 +0800
Message-ID: <20200622015227.24134-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: BC319FA8B0CE42E63876C40656E541A7BC49AED5DE905F57669A587BB0ADF5292000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VXNlciBkcml2ZXIgbmVlZCB0byBnZXQgSERSMTArIGluZm9ybWF0aW9uIGZvciBlYWNoIGNhcHR1
cmUgYnVmZmVyOw0KRm9yIHNvbWUgZW5jb2RlciBjYXNlcywgdXNlciBkcml2ZXIgbmVlZCB0byBn
ZXQgZW5jb2RlZCBtZXNzYWdlIGZvcg0KZWFjaCBmcmFtZS4gU28gYWRkIHN1cHBvcnQgcmVhZC1v
bmx5KFJvKSByZXF1ZXN0IGZvciBjYXB0dXJlIHF1ZXVlLg0KDQpSbyByZXF1ZXN0IG1lYW4gdGhh
dCB1c2VyIGRyaXZlciBqdXN0IGNhbiBnZXQgZXh0IGN0cmxzLCBzZXQgZXh0IGN0cmxzDQppcyBu
b3Qgbm90IGFsbG93ZWQuIFJvIFJlcXVlc3QgYWxzbyBjYW4gYmUgdXNlZCBpbiBvdXRwdXQgcXVl
dWUuDQoNClRoZXJlIGlzIG5vdCB1cHN0cmVhbSBkcml2ZXIgdG8gdXNlIHRoaXMgZmVhdHVyZSBh
dCBub3csIGJ1dCB3ZSBhcmUNCmRldmVsb3BpbmcgaW50ZXJuYWwgZHJpdmVyIHRvIHVzZSBpdC4g
SWYgaXQgaXMgcmVhZHksIHdlIHdpbGwgdHJ5IHRvDQp1cHN0cmVhbSB2ZGVjL3ZlbmMgZHJpdmVy
IGJhc2VkIG9uIHRoaXMgZmVhdHVyZS4NCg0KQ2hhbmdlIGNvbXBhcmVkIHRvIHYxOg0KLWNoYW5n
ZSBjb21taXQgbWVzc2FnZSBvZiBwYXRjaCAwMS8wMg0KLWNoYW5nZSBjb21taXQgbWVzc2FnZSBv
ZiBwYXRjaCAwMi8wMg0KDQpZdW5mZWkgRG9uZyAoMik6DQogIG1lZGlhOiB2NGwgVUFQSTogYWRk
IFY0TDJfQlVGX0NBUF9TVVBQT1JUU19ST19SRVFVRVNUUw0KICBtZWRpYTogdjRsOiBBZGQgUm8g
cmVxdWVzdCBhcGkgZm9yIGNhcHR1cmUgcXVldWUNCg0KIC4uLi9tZWRpYS92NGwvdmlkaW9jLXJl
cWJ1ZnMucnN0ICAgICAgICAgICAgICB8ICAgNCArDQogLi4uL21lZGlhL2NvbW1vbi92aWRlb2J1
ZjIvdmlkZW9idWYyLXY0bDIuYyAgIHwgICA3ICsrDQogZHJpdmVycy9tZWRpYS9tYy9tYy1yZXF1
ZXN0LmMgICAgICAgICAgICAgICAgIHwgIDEwICstDQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUv
djRsMi1jdHJscy5jICAgICAgICAgIHwgMTA3ICsrKysrKysrKysrKysrKy0tLQ0KIGRyaXZlcnMv
bWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyAgICAgICAgICB8ICAyMiArKysrDQogZHJpdmVy
cy9tZWRpYS92NGwyLWNvcmUvdjRsMi1tZW0ybWVtLmMgICAgICAgIHwgIDE5ICsrLS0NCiBpbmNs
dWRlL21lZGlhL3Y0bDItY3RybHMuaCAgICAgICAgICAgICAgICAgICAgfCAgMjIgKysrLQ0KIGlu
Y2x1ZGUvbWVkaWEvdjRsMi1maC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQogaW5j
bHVkZS9tZWRpYS92aWRlb2J1ZjItY29yZS5oICAgICAgICAgICAgICAgIHwgICAyICsNCiBpbmNs
dWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgICAgICAgICAgfCAgIDEgKw0KIDEwIGZp
bGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCg0K

