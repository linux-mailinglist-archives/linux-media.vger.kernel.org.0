Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09351125AEB
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 06:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfLSFuQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 00:50:16 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:48040 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726338AbfLSFuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 00:50:15 -0500
X-UUID: 146105b05f37431dad10e90c351b6e79-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7fCn/ztl4AlC39YFUcLA1Fd5PU/Oyw3txLJ3UdHhRJ8=;
        b=NoQTv/Fj9uM+eKVXU2ao/khA+tzVXC9AfhLOO8YqZTj9djH6MOrPHtiFabCbn8vvXL3+Bxb9BfpcX5twykeJ2qjY6Bu1x33ye4/SDJYJk4T8r+3e+RNx75nVQqoMnWSHIo1joAzhX60RsQ67qFw56DfDK8Uzx673i77sLc8UjsU=;
X-UUID: 146105b05f37431dad10e90c351b6e79-20191219
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 792777870; Thu, 19 Dec 2019 13:50:11 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 13:49:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Dec 2019 13:50:12 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <Sean.Cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <ryan.yu@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, <jungo.lin@mediatek.com>
Subject: [v6, 3/5] media: videodev2.h: Add new boottime timestamp type
Date:   Thu, 19 Dec 2019 13:49:28 +0800
Message-ID: <20191219054930.29513-4-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191219054930.29513-1-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20191219054930.29513-1-jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Rm9yIENhbWVyYSBBUihBdWdtZW50ZWQgUmVhbGl0eSkgYXBwbGljYXRpb24gcmVxdWlyZXMgY2Ft
ZXJhIHRpbWVzdGFtcHMNCnRvIGJlIHJlcG9ydGVkIHdpdGggQ0xPQ0tfQk9PVFRJTUUgdG8gc3lu
YyB0aW1lc3RhbXAgd2l0aCBvdGhlciBzZW5zb3INCnNvdXJjZXMuDQoNClRoZSBib290dGltZSB0
aW1lc3RhbXAgaXMgaWRlbnRpY2FsIHRvIG1vbm90b25pYyB0aW1lc3RhbXAsDQpleGNlcHQgaXQg
YWxzbyBpbmNsdWRlcyBhbnkgdGltZSB0aGF0IHRoZSBzeXN0ZW0gaXMgc3VzcGVuZGVkLg0KDQpT
aWduZWQtb2ZmLWJ5OiBKdW5nbyBMaW4gPGp1bmdvLmxpbkBtZWRpYXRlay5jb20+DQotLS0NCkNo
YW5nZXMgZnJvbSB2NjoNCiAtIE5vIGNoYW5nZS4NCi0tLQ0KIERvY3VtZW50YXRpb24vbWVkaWEv
dWFwaS92NGwvYnVmZmVyLnJzdCB8IDExICsrKysrKysrKystDQogaW5jbHVkZS91YXBpL2xpbnV4
L3ZpZGVvZGV2Mi5oICAgICAgICAgIHwgIDIgKysNCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vbWVk
aWEvdWFwaS92NGwvYnVmZmVyLnJzdCBiL0RvY3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvYnVm
ZmVyLnJzdA0KaW5kZXggOTE0OWI1NzcyOGU1Li5mNDViZmNlN2ZkZGQgMTAwNjQ0DQotLS0gYS9E
b2N1bWVudGF0aW9uL21lZGlhL3VhcGkvdjRsL2J1ZmZlci5yc3QNCisrKyBiL0RvY3VtZW50YXRp
b24vbWVkaWEvdWFwaS92NGwvYnVmZmVyLnJzdA0KQEAgLTY2MiwxMyArNjYyLDIyIEBAIEJ1ZmZl
ciBGbGFncw0KICAgICAgIC0gMHgwMDAwMjAwMA0KICAgICAgIC0gVGhlIGJ1ZmZlciB0aW1lc3Rh
bXAgaGFzIGJlZW4gdGFrZW4gZnJvbSB0aGUgYGBDTE9DS19NT05PVE9OSUNgYA0KIAljbG9jay4g
VG8gYWNjZXNzIHRoZSBzYW1lIGNsb2NrIG91dHNpZGUgVjRMMiwgdXNlDQotCTpjOmZ1bmM6YGNs
b2NrX2dldHRpbWVgLg0KKwk6YzpmdW5jOmBjbG9ja19nZXR0aW1lYCB1c2luZyBjbG9jayBJRHMg
YGBDTE9DS19NT05PVE9OSUNgYC4NCiAgICAgKiAuLiBfYFY0TDItQlVGLUZMQUctVElNRVNUQU1Q
LUNPUFlgOg0KIA0KICAgICAgIC0gYGBWNEwyX0JVRl9GTEFHX1RJTUVTVEFNUF9DT1BZYGANCiAg
ICAgICAtIDB4MDAwMDQwMDANCiAgICAgICAtIFRoZSBDQVBUVVJFIGJ1ZmZlciB0aW1lc3RhbXAg
aGFzIGJlZW4gdGFrZW4gZnJvbSB0aGUgY29ycmVzcG9uZGluZw0KIAlPVVRQVVQgYnVmZmVyLiBU
aGlzIGZsYWcgYXBwbGllcyBvbmx5IHRvIG1lbTJtZW0gZGV2aWNlcy4NCisgICAgKiAuLiBfYFY0
TDJfQlVGX0ZMQUdfVElNRVNUQU1QX0JPT1RJTUVgOg0KKw0KKyAgICAgIC0gYGBWNEwyX0JVRl9G
TEFHX1RJTUVTVEFNUF9CT09USU1FYGANCisgICAgICAtIDB4MDAwMDgwMDANCisgICAgICAtIFRo
ZSBidWZmZXIgdGltZXN0YW1wIGhhcyBiZWVuIHRha2VuIGZyb20gdGhlIGBgQ0xPQ0tfQk9PVFRJ
TUVgYA0KKwljbG9jay4gVG8gYWNjZXNzIHRoZSBzYW1lIGNsb2NrIG91dHNpZGUgVjRMMiwgdXNl
DQorCTpjOmZ1bmM6YGNsb2NrX2dldHRpbWVgIHVzaW5nIGNsb2NrIElEcyBgYENMT0NLX0JPT1RU
SU1FYGAuDQorCUlkZW50aWNhbCB0byBDTE9DS19NT05PVE9OSUMsIGV4Y2VwdCBpdCBhbHNvIGlu
Y2x1ZGVzIGFueSB0aW1lIHRoYXQNCisJdGhlIHN5c3RlbSBpcyBzdXNwZW5kZWQuDQogICAgICog
Li4gX2BWNEwyLUJVRi1GTEFHLVRTVEFNUC1TUkMtTUFTS2A6DQogDQogICAgICAgLSBgYFY0TDJf
QlVGX0ZMQUdfVFNUQU1QX1NSQ19NQVNLYGANCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGlu
dXgvdmlkZW9kZXYyLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCmluZGV4IDA0
NDgxYzcxN2ZlZS4uNzRlZjk0NzJlNzAyIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4
L3ZpZGVvZGV2Mi5oDQorKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmgNCkBAIC0x
MDYwLDYgKzEwNjAsOCBAQCBzdGF0aWMgaW5saW5lIF9fdTY0IHY0bDJfdGltZXZhbF90b19ucyhj
b25zdCBzdHJ1Y3QgdGltZXZhbCAqdHYpDQogI2RlZmluZSBWNEwyX0JVRl9GTEFHX1RJTUVTVEFN
UF9VTktOT1dOCQkweDAwMDAwMDAwDQogI2RlZmluZSBWNEwyX0JVRl9GTEFHX1RJTUVTVEFNUF9N
T05PVE9OSUMJMHgwMDAwMjAwMA0KICNkZWZpbmUgVjRMMl9CVUZfRkxBR19USU1FU1RBTVBfQ09Q
WQkJMHgwMDAwNDAwMA0KKyNkZWZpbmUgVjRMMl9CVUZfRkxBR19USU1FU1RBTVBfQk9PVElNRQkJ
MHgwMDAwODAwMA0KKw0KIC8qIFRpbWVzdGFtcCBzb3VyY2VzLiAqLw0KICNkZWZpbmUgVjRMMl9C
VUZfRkxBR19UU1RBTVBfU1JDX01BU0sJCTB4MDAwNzAwMDANCiAjZGVmaW5lIFY0TDJfQlVGX0ZM
QUdfVFNUQU1QX1NSQ19FT0YJCTB4MDAwMDAwMDANCi0tIA0KMi4xOC4wDQo=

