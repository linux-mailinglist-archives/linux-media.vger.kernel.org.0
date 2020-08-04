Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693E323B381
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 05:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730589AbgHDDm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 23:42:59 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:28461 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730426AbgHDDmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 23:42:12 -0400
X-UUID: b20f2a7e9cf641349ebfb1c739e25f99-20200804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=k20Imll3mFuaXvAX4eUIHQnObVq0eM6kD80gXzk30Vo=;
        b=S0tjA3/y+6WX1tAy3bLvabit/5RsW8vvpVWHoxjrVBmlsIpogTyx3ZlKplbi97xFdRYHN7c/7KuThf3EJYti2A6GEfRvIeh5ggVYbNgWMcI7kDV40TyiydEOECf8U8QZC7TYhMp+LomXZ/45w7sjc7KpG6REdL1avLKZ9TpJnqg=;
X-UUID: b20f2a7e9cf641349ebfb1c739e25f99-20200804
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 897722860; Tue, 04 Aug 2020 11:42:07 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:04 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v11 20/28] media: platform: Change the colorspace of jpeg to the fixed value
Date:   Tue, 4 Aug 2020 11:40:54 +0800
Message-ID: <20200804034102.22983-21-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SnBlZyBkb2Vzbid0IHN1cHBvcnQgY29sb3JzcGFjZSBjb252ZXJzaW9uLCBzbyBpdCBzaG91bGRu
J3QgYWNjZXB0IGFueQ0Kb3RoZXIgY29sb3JzcGFjZSBpbiBTX0ZNVC4NCkNoYW5nZSB0aGUgY29s
b3JzcGFjZSBvZiBqcGVnIHRvIHRoZSBmaXhlZCB2YWx1ZS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhp
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnYxMTogbm8gY2hhbmdlcw0KLS0tDQogLi4uL21l
ZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyAgIHwgMjQgKysrKysrKysrLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pw
ZWdfY29yZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmMNCmluZGV4IDAxZjQ2NTZmZTJiMy4uMDM3NmJkM2JkYmJiIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCisrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQpAQCAtMzIwLDEwICszMjAs
MTAgQEAgc3RhdGljIGludCBtdGtfanBlZ19zX2ZtdF9tcGxhbmUoc3RydWN0IG10a19qcGVnX2N0
eCAqY3R4LA0KIAkJCQkJICAgcGl4X21wLT5waXhlbGZvcm1hdCwgZm10X3R5cGUpOw0KIAlxX2Rh
dGEtPnBpeF9tcC53aWR0aCA9IHBpeF9tcC0+d2lkdGg7DQogCXFfZGF0YS0+cGl4X21wLmhlaWdo
dCA9IHBpeF9tcC0+aGVpZ2h0Ow0KLQlxX2RhdGEtPnBpeF9tcC5jb2xvcnNwYWNlID0gcGl4X21w
LT5jb2xvcnNwYWNlOw0KLQlxX2RhdGEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBwaXhfbXAtPnljYmNy
X2VuYzsNCi0JcV9kYXRhLT5waXhfbXAueGZlcl9mdW5jID0gcGl4X21wLT54ZmVyX2Z1bmM7DQot
CXFfZGF0YS0+cGl4X21wLnF1YW50aXphdGlvbiA9IHBpeF9tcC0+cXVhbnRpemF0aW9uOw0KKwlx
X2RhdGEtPnBpeF9tcC5jb2xvcnNwYWNlID0gVjRMMl9DT0xPUlNQQUNFX1NSR0I7DQorCXFfZGF0
YS0+cGl4X21wLnljYmNyX2VuYyA9IFY0TDJfWUNCQ1JfRU5DXzYwMTsNCisJcV9kYXRhLT5waXhf
bXAueGZlcl9mdW5jID0gVjRMMl9YRkVSX0ZVTkNfU1JHQjsNCisJcV9kYXRhLT5waXhfbXAucXVh
bnRpemF0aW9uID0gVjRMMl9RVUFOVElaQVRJT05fRlVMTF9SQU5HRTsNCiANCiAJdjRsMl9kYmco
MSwgZGVidWcsICZqcGVnLT52NGwyX2RldiwgIiglZCkgc19mbXQ6JWMlYyVjJWMgd3hoOiV1eCV1
XG4iLA0KIAkJIGYtPnR5cGUsDQpAQCAtODQ2LDEwICs4NDYsMTAgQEAgc3RhdGljIHZvaWQgbXRr
X2pwZWdfc2V0X2RlZmF1bHRfcGFyYW1zKHN0cnVjdCBtdGtfanBlZ19jdHggKmN0eCkNCiAJc3Ry
dWN0IG10a19qcGVnX3FfZGF0YSAqcSA9ICZjdHgtPm91dF9xOw0KIAlpbnQgaTsNCiANCi0JcS0+
cGl4X21wLmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfSlBFRywNCi0JcS0+cGl4X21wLnlj
YmNyX2VuYyA9IFY0TDJfWUNCQ1JfRU5DX0RFRkFVTFQ7DQotCXEtPnBpeF9tcC5xdWFudGl6YXRp
b24gPSBWNEwyX1FVQU5USVpBVElPTl9ERUZBVUxUOw0KLQlxLT5waXhfbXAueGZlcl9mdW5jID0g
VjRMMl9YRkVSX0ZVTkNfREVGQVVMVDsNCisJcS0+cGl4X21wLmNvbG9yc3BhY2UgPSBWNEwyX0NP
TE9SU1BBQ0VfU1JHQjsNCisJcS0+cGl4X21wLnljYmNyX2VuYyA9IFY0TDJfWUNCQ1JfRU5DXzYw
MTsNCisJcS0+cGl4X21wLnF1YW50aXphdGlvbiA9IFY0TDJfUVVBTlRJWkFUSU9OX0ZVTExfUkFO
R0U7DQorCXEtPnBpeF9tcC54ZmVyX2Z1bmMgPSBWNEwyX1hGRVJfRlVOQ19TUkdCOw0KIA0KIAlx
LT5mbXQgPSBtdGtfanBlZ19maW5kX2Zvcm1hdChtdGtfanBlZ19mb3JtYXRzLCBNVEtfSlBFR19O
VU1fRk9STUFUUywNCiAJCQkJICAgICAgVjRMMl9QSVhfRk1UX0pQRUcsDQpAQCAtODYzLDEwICs4
NjMsMTAgQEAgc3RhdGljIHZvaWQgbXRrX2pwZWdfc2V0X2RlZmF1bHRfcGFyYW1zKHN0cnVjdCBt
dGtfanBlZ19jdHggKmN0eCkNCiAJcS0+Zm10ID0gbXRrX2pwZWdfZmluZF9mb3JtYXQobXRrX2pw
ZWdfZm9ybWF0cywgTVRLX0pQRUdfTlVNX0ZPUk1BVFMsDQogCQkJCSAgICAgIFY0TDJfUElYX0ZN
VF9ZVVY0MjBNLA0KIAkJCQkgICAgICBNVEtfSlBFR19GTVRfRkxBR19ERUNfQ0FQVFVSRSk7DQot
CXEtPnBpeF9tcC5jb2xvcnNwYWNlID0gVjRMMl9DT0xPUlNQQUNFX0pQRUcsDQotCXEtPnBpeF9t
cC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ19ERUZBVUxUOw0KLQlxLT5waXhfbXAucXVhbnRp
emF0aW9uID0gVjRMMl9RVUFOVElaQVRJT05fREVGQVVMVDsNCi0JcS0+cGl4X21wLnhmZXJfZnVu
YyA9IFY0TDJfWEZFUl9GVU5DX0RFRkFVTFQ7DQorCXEtPnBpeF9tcC5jb2xvcnNwYWNlID0gVjRM
Ml9DT0xPUlNQQUNFX1NSR0I7DQorCXEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VO
Q182MDE7DQorCXEtPnBpeF9tcC5xdWFudGl6YXRpb24gPSBWNEwyX1FVQU5USVpBVElPTl9GVUxM
X1JBTkdFOw0KKwlxLT5waXhfbXAueGZlcl9mdW5jID0gVjRMMl9YRkVSX0ZVTkNfU1JHQjsNCiAJ
cS0+cGl4X21wLndpZHRoID0gTVRLX0pQRUdfTUlOX1dJRFRIOw0KIAlxLT5waXhfbXAuaGVpZ2h0
ID0gTVRLX0pQRUdfTUlOX0hFSUdIVDsNCiANCi0tIA0KMi4xOC4wDQo=

