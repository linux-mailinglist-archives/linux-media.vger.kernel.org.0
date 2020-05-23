Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676F41DF60E
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 10:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbgEWImy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 04:42:54 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:63054 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387500AbgEWImv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 04:42:51 -0400
X-UUID: cfa01a54503943edae9a7ad49a7819c6-20200523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=geMgDXW7+y5x9NHSgNuLpSBU2HC0fIuZRZ1XDMQaq+U=;
        b=HyDEfmcicYVo1vQgVyNL2OM4IxuppxhmHNY0KJn7PnVFp5HmXHk4Qyhym1G8u4Rot/1RDOwGxyu+q/O5JTsLTXCWsqSwaVmJOrwac5T8ppMv4S31A0jtrjCNilH5PbB0B7/51BbcAgbEdItLZQ/12a6EGzrESv122As5DJZb79E=;
X-UUID: cfa01a54503943edae9a7ad49a7819c6-20200523
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1927283339; Sat, 23 May 2020 16:42:44 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 May 2020 16:42:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 23 May 2020 16:42:41 +0800
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
Subject: [V9, 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Sat, 23 May 2020 16:41:01 +0800
Message-ID: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIZWxsbywNCg0KVGhpcyBzZXJpZXMgYWRkcyBEVCBiaW5kaW5ncyBpbiBZQU1MIGFuZCBWNEwy
IHN1Yi1kZXZpY2UgZHJpdmVyIGZvciBPbW5pdmlzaW9uJ3MNCk9WMDJBMTAgMiBtZWdhcGl4ZWwg
Q01PUyAxLzUiIHNlbnNvciwgd2hpY2ggaGFzIGEgc2luZ2xlIE1JUEkgbGFuZSBpbnRlcmZhY2Uo
SS9GKQ0KYW5kIG91dHB1dCBmb3JtYXQgb2YgMTAtYml0IFJBVy4NCg0KVGhlIGRyaXZlciBpcyBp
bXBsZW1lbnRlZCB3aXRoIFY0TDIgRnJhbWV3b3JrLg0KIC0gQXN5bmMgcmVnaXN0ZXJlZCBhcyBv
bmUgVjRMMiBzdWItZGV2aWNlLg0KIC0gQXMgdGhlIGZpcnN0IGNvbXBvbmVudCBvZiBjYW1lcmEg
c3lzdGVtIGluY2x1ZGluZyBTZW5pbmYvSVNQIHByb2Nlc3NpbmcgcGlwZWxpbmUuDQogLSBBIG1l
ZGlhIGVudGl0eSB0aGF0IHByb3ZpZGVzIG9uZSBzb3VyY2UgcGFkIGluIGNvbW1vbiBhbmQgdHdv
IGZvciBkdWFsIGNhbWVyYS4NCiANClByZXZpb3VzIHZlcnNpb25zIG9mIHRoaXMgcGF0Y2gtc2V0
IGNhbiBiZSBmb3VuZCBoZXJlOg0KIHY4OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
ZWRpYS8yMDIwMDUwOTA4MDYyNy4yMzIyMi0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQog
djc6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNDMwMDgwOTI0LjEx
NDAtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHY2OiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1tZWRpYS8yMDE5MTIxMTExMjg0OS4xNjcwNS0xLWRvbmdjaHVuLnpodUBtZWRp
YXRlay5jb20vDQogdjU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkx
MTA0MTA1NzEzLjI0MzExLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2NDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA5MDcwOTI3MjguMjM4OTctMS1kb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1tZWRpYS8yMDE5MDgxOTAzNDMzMS4xMzA5OC0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20v
DQogdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMTkwNzA0MDg0NjUx
LjMxMDUtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDUyMzEwMjIwNC4yNDExMi0xLWRvbmdjaHVuLnpodUBt
ZWRpYXRlay5jb20vDQoNCkNoYW5nZXMgb2YgdjkgbWFpbmx5IGFkZHJlc3MgY29tbWVudHMgZnJv
bSBSb2IsIFNha2FyaSwgVG9tYXN6LCBBbmR5Lg0KSW5jbHVkaW5nOg0KIC0gQWRkIG1vcmUgZGV0
YWlsZWQgZGVzY3JpcHRpb25zIGZvciBwb3dlcmRvd24tZ3Bpb3MgYW5kIHJlc2V0LWdwaW9zIGlu
IERUDQogLSBTZXQgZGVmYXVsdCB0byBwcm9wZXJ0aWVzOiAicm90YXRpb24iIGFuZCAib3Z0aSxt
aXBpLXR4LXNwZWVkIg0KIC0gUmVtb3ZlIHJlc2VydmVkIHZhbHVlcyBvZiAib3Z0aSxtaXBpLXR4
LXNwZWVkIg0KIC0gVXNlIEFSUkFZX1NJWkUoKSBkaXJlY3RseSB0byByZXBsYWNlIG9mIGRlZmlu
aW5nIG1hY3JvIGZ1bmN0aW9uDQogLSBSZW1vdmUgX19tYXliZV91bnVzZWQgc3BlY2lmaWVyIGZv
ciBvdjAyYTEwX3Bvd2VyX29uIGFuZCBvdjAyYTEwX3Bvd2VyX29mZg0KIC0gUmVmaW5lIGRyaXZl
ciBieSByZW1vdmluZyB1bm5lY2Vzc2FyeSBsb2dzIGFuZCB1bnVzZWQgbWFjcm9zIG9yIGZpZWxk
cy4NCiAtIFBvd2VyIG9mZiBzZW5zb3Igd2hlbiBhc3luYyByZWdpc3RlciBzdWJkZXYgZmFpbGVk
IGFuZCAhcG1fcnVudGltZV9lbmFibGVkKCkNCiAtIEZpeCBvdGhlciByZXZpZXcgY29tbWVudHMg
aW4gdjgNCg0KUGxlYXNlIHJldmlldy4NClRoYW5rcy4NCg0KRG9uZ2NodW4gWmh1ICgyKToNCiAg
bWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBPVjAyQTEwIGJpbmRpbmdz
DQogIG1lZGlhOiBpMmM6IG92MDJhMTA6IEFkZCBPVjAyQTEwIGltYWdlIHNlbnNvciBkcml2ZXIN
Cg0KIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwgICAgICAgICAgIHwg
IDE3MiArKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMTMgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMDI1ICsrKysrKysrKysrKysrKysrKysrDQogNSBmaWxl
cyBjaGFuZ2VkLCAxMjE5IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92MDJhMTAueWFtbA0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCg0KLS0gDQoy
LjkuMg0K

