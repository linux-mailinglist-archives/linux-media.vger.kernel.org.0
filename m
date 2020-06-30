Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A4020EB9D
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 04:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbgF3CuW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 22:50:22 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:10582 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726746AbgF3CuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 22:50:21 -0400
X-UUID: f202c3ed1e094bf19253249996f51644-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=RYhTo3ImPjc8DYiqz9mKElKM/RF9Xgj3mJn+T6zHAvI=;
        b=szZCSzBEkruUgJMP4szQPc/+s2/7JGwAWI2c8kMm3MRFgfzm9Ybte089AuB38Bx9U19rDYKqIBdnjW06HF6RG00aff0yZXsRnARYjqwq9QGRKAiK0B7Ru8bvh1OrrAlAPuzvqkW51s+jSdCC06cg+TSGWHLPnug5yC9UtBrQCUQ=;
X-UUID: f202c3ed1e094bf19253249996f51644-20200630
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 513364050; Tue, 30 Jun 2020 10:50:13 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 10:50:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 10:50:10 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <sakari.ailus@linux.intel.com>, <drinkcat@chromium.org>,
        <tfiga@chromium.org>, <matthias.bgg@gmail.com>,
        <bingbu.cao@intel.com>
CC:     <srv_heupstream@mediatek.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <sj.huang@mediatek.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <louis.kuo@mediatek.com>, <shengnan.wang@mediatek.com>,
        <dongchun.zhu@mediatek.com>
Subject: [PATCH V11 0/2] media: i2c: Add support for 0V02A10 sensor
Date:   Tue, 30 Jun 2020 10:49:40 +0800
Message-ID: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZ3MgYW5kIFY0TDIgc3ViLWRldmlj
ZSBkcml2ZXIgZm9yIE9tbmlWaXNpb24ncw0KT1YwMkExMCAyIG1lZ2FwaXhlbCBDTU9TIDEvNSIg
c2Vuc29yLCB3aGljaCBoYXMgYSBzaW5nbGUgTUlQSSBsYW5lIGludGVyZmFjZQ0KYW5kIG91dHB1
dCBmb3JtYXQgb2YgMTAtYml0IFJBVy4NCg0KVGhlIGRyaXZlciBpcyBpbXBsZW1lbnRlZCB3aXRo
IFY0TDIgZnJhbWV3b3JrLg0KIC0gQXN5bmMgcmVnaXN0ZXJlZCBhcyBhIFY0TDIgc3ViLWRldmlj
ZS4NCiAtIEFzIHRoZSBmaXJzdCBjb21wb25lbnQgb2YgY2FtZXJhIHN5c3RlbSBpbmNsdWRpbmcg
U2VuaW5mLCBJU1AgcGlwZWxpbmUuDQogLSBBIG1lZGlhIGVudGl0eSB0aGF0IHByb3ZpZGVzIG9u
ZSBzb3VyY2UgcGFkIGluIGNvbW1vbiBhbmQgdHdvIGZvciBkdWFsLWNhbS4NCiANClByZXZpb3Vz
IHZlcnNpb25zIG9mIHRoaXMgcGF0Y2gtc2V0IGNhbiBiZSBmb3VuZCBoZXJlOg0KIHYxMDogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA2MTUxMjI5MzcuMTg5NjUtMy1k
b25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwOTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtbWVkaWEvMjAyMDA1MjMwODQxMDMuMzEyNzYtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsu
Y29tLw0KIHYwODogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA1MDkw
ODA2MjcuMjMyMjItMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwNzogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAyMDA0MzAwODA5MjQuMTE0MC0xLWRvbmdjaHVu
LnpodUBtZWRpYXRlay5jb20vDQogdjA2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
ZWRpYS8yMDE5MTIxMTExMjg0OS4xNjcwNS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQog
djA1OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MTEwNDEwNTcxMy4y
NDMxMS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjA0OiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDkwNzA5MjcyOC4yMzg5Ny0xLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQogdjAzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8y
MDE5MDgxOTAzNDMzMS4xMzA5OC0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjAyOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDcwNDA4NDY1MS4zMTA1LTEt
ZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LW1lZGlhLzIwMTkwNTIzMTAyMjA0LjI0MTEyLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVr
LmNvbS8NCg0KQ2hhbmdlcyBvZiB2MTEgYXJlIG1haW5seSBhZGRyZXNzaW5nIGNvbW1lbnRzIGZy
b20gVG9tYXN6Lg0KQ29tcGFyZWQgdG8gdjEwOg0KIC0gUmViYXNlIG9udG8gNS44LXJjMQ0KIC0g
VXBkYXRlIHRoZSBHUElPIHBvbGFyaXR5IGZvciBwb3dlcmRvd24gYW5kIHJlc2V0IHBpbnMgdGhh
dCBkZWZpbmVkIGluIERUDQogLSBSZWZpbmUgb3YwMmExMF9zZXRfZm10KCkNCiAtIFJlYWRqdXN0
IHRoZSBHUElPIHN0YXRlL3ZhbHVlIHNldHRpbmcgZm9yIHBvd2VyZG93biBhbmQgcmVzZXQgcGlu
cw0KIC0gUmVmaW5lIGVycl9wb3dlcl9vZmYgZXJyb3IgaGFuZGxlciBzZWN0aW9uIGluIHByb2Jl
DQogLSBVc2UgcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCkgaW4gcmVtb3ZlDQoNClBsZWFz
ZSByZXZpZXcuDQpUaGFua3MuDQoNCkRvbmdjaHVuIFpodSAoMik6DQogIG1lZGlhOiBkdC1iaW5k
aW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQgT1YwMkExMCBiaW5kaW5ncw0KICBtZWRpYTogaTJj
OiBvdjAyYTEwOiBBZGQgT1YwMkExMCBpbWFnZSBzZW5zb3IgZHJpdmVyDQoNCiAuLi4vYmluZGlu
Z3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55YW1sICAgICAgICAgICB8ICAxNzIgKysrKw0KIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCAr
DQogZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEzICsNCiBkcml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgIDEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL292MDJhMTAuYyAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTA1MiArKysrKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgMTI0
NiBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwNCiBjcmVhdGUgbW9kZSAx
MDA2NDQgZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jDQoNCi0tIA0KMi45LjINCg==

