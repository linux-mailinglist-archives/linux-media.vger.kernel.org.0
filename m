Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6D022A5C5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387932AbgGWDHR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:07:17 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:56696 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387789AbgGWDGm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:42 -0400
X-UUID: 46f5daf12b064e36a0cd4d815ee2d2eb-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6YeQsKZFLpRIg37VRCeJrmPmN5uETM4lokDx2hE/OLg=;
        b=VqMKbhPitr7kymPH9PSBjU+NbA2bQzOsT5XV162QdEpwdczxQ2QDc7YDn666NqTP65deXO2tE4Cp0tUmXrQbGTCBLKdG+z+hP7wnMbeL/exVmcsf86r9WwPuI9mRFvJIh31XZDSja0/GhfTq4XlXZTzQcIOCcpkUb0ZtUSlfZbs=;
X-UUID: 46f5daf12b064e36a0cd4d815ee2d2eb-20200723
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1948171422; Thu, 23 Jul 2020 11:06:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:30 +0800
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
Subject: [PATCH v10 20/28] media: platform: Change the colorspace of jpeg to the fixed value
Date:   Thu, 23 Jul 2020 11:04:43 +0800
Message-ID: <20200723030451.5616-21-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
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
b3JzcGFjZSBvZiBqcGVnIHRvIHRoZSBmaXhlZCB2YWx1ZS4NCg0KU2lnbmVkLW9mZi1ieTogWGlh
IEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2MTA6IG5ldyBhZGQgcGF0Y2gN
Ci0tLQ0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgICB8IDI0
ICsrKysrKysrKy0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcv
bXRrX2pwZWdfY29yZS5jDQppbmRleCAwMWY0NjU2ZmUyYjMuLjAzNzZiZDNiZGJiYiAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQor
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAg
LTMyMCwxMCArMzIwLDEwIEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdfc19mbXRfbXBsYW5lKHN0cnVj
dCBtdGtfanBlZ19jdHggKmN0eCwNCiAJCQkJCSAgIHBpeF9tcC0+cGl4ZWxmb3JtYXQsIGZtdF90
eXBlKTsNCiAJcV9kYXRhLT5waXhfbXAud2lkdGggPSBwaXhfbXAtPndpZHRoOw0KIAlxX2RhdGEt
PnBpeF9tcC5oZWlnaHQgPSBwaXhfbXAtPmhlaWdodDsNCi0JcV9kYXRhLT5waXhfbXAuY29sb3Jz
cGFjZSA9IHBpeF9tcC0+Y29sb3JzcGFjZTsNCi0JcV9kYXRhLT5waXhfbXAueWNiY3JfZW5jID0g
cGl4X21wLT55Y2Jjcl9lbmM7DQotCXFfZGF0YS0+cGl4X21wLnhmZXJfZnVuYyA9IHBpeF9tcC0+
eGZlcl9mdW5jOw0KLQlxX2RhdGEtPnBpeF9tcC5xdWFudGl6YXRpb24gPSBwaXhfbXAtPnF1YW50
aXphdGlvbjsNCisJcV9kYXRhLT5waXhfbXAuY29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9T
UkdCOw0KKwlxX2RhdGEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ182MDE7DQor
CXFfZGF0YS0+cGl4X21wLnhmZXJfZnVuYyA9IFY0TDJfWEZFUl9GVU5DX1NSR0I7DQorCXFfZGF0
YS0+cGl4X21wLnF1YW50aXphdGlvbiA9IFY0TDJfUVVBTlRJWkFUSU9OX0ZVTExfUkFOR0U7DQog
DQogCXY0bDJfZGJnKDEsIGRlYnVnLCAmanBlZy0+djRsMl9kZXYsICIoJWQpIHNfZm10OiVjJWMl
YyVjIHd4aDoldXgldVxuIiwNCiAJCSBmLT50eXBlLA0KQEAgLTg0NiwxMCArODQ2LDEwIEBAIHN0
YXRpYyB2b2lkIG10a19qcGVnX3NldF9kZWZhdWx0X3BhcmFtcyhzdHJ1Y3QgbXRrX2pwZWdfY3R4
ICpjdHgpDQogCXN0cnVjdCBtdGtfanBlZ19xX2RhdGEgKnEgPSAmY3R4LT5vdXRfcTsNCiAJaW50
IGk7DQogDQotCXEtPnBpeF9tcC5jb2xvcnNwYWNlID0gVjRMMl9DT0xPUlNQQUNFX0pQRUcsDQot
CXEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBWNEwyX1lDQkNSX0VOQ19ERUZBVUxUOw0KLQlxLT5waXhf
bXAucXVhbnRpemF0aW9uID0gVjRMMl9RVUFOVElaQVRJT05fREVGQVVMVDsNCi0JcS0+cGl4X21w
LnhmZXJfZnVuYyA9IFY0TDJfWEZFUl9GVU5DX0RFRkFVTFQ7DQorCXEtPnBpeF9tcC5jb2xvcnNw
YWNlID0gVjRMMl9DT0xPUlNQQUNFX1NSR0I7DQorCXEtPnBpeF9tcC55Y2Jjcl9lbmMgPSBWNEwy
X1lDQkNSX0VOQ182MDE7DQorCXEtPnBpeF9tcC5xdWFudGl6YXRpb24gPSBWNEwyX1FVQU5USVpB
VElPTl9GVUxMX1JBTkdFOw0KKwlxLT5waXhfbXAueGZlcl9mdW5jID0gVjRMMl9YRkVSX0ZVTkNf
U1JHQjsNCiANCiAJcS0+Zm10ID0gbXRrX2pwZWdfZmluZF9mb3JtYXQobXRrX2pwZWdfZm9ybWF0
cywgTVRLX0pQRUdfTlVNX0ZPUk1BVFMsDQogCQkJCSAgICAgIFY0TDJfUElYX0ZNVF9KUEVHLA0K
QEAgLTg2MywxMCArODYzLDEwIEBAIHN0YXRpYyB2b2lkIG10a19qcGVnX3NldF9kZWZhdWx0X3Bh
cmFtcyhzdHJ1Y3QgbXRrX2pwZWdfY3R4ICpjdHgpDQogCXEtPmZtdCA9IG10a19qcGVnX2ZpbmRf
Zm9ybWF0KG10a19qcGVnX2Zvcm1hdHMsIE1US19KUEVHX05VTV9GT1JNQVRTLA0KIAkJCQkgICAg
ICBWNEwyX1BJWF9GTVRfWVVWNDIwTSwNCiAJCQkJICAgICAgTVRLX0pQRUdfRk1UX0ZMQUdfREVD
X0NBUFRVUkUpOw0KLQlxLT5waXhfbXAuY29sb3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9KUEVH
LA0KLQlxLT5waXhfbXAueWNiY3JfZW5jID0gVjRMMl9ZQ0JDUl9FTkNfREVGQVVMVDsNCi0JcS0+
cGl4X21wLnF1YW50aXphdGlvbiA9IFY0TDJfUVVBTlRJWkFUSU9OX0RFRkFVTFQ7DQotCXEtPnBp
eF9tcC54ZmVyX2Z1bmMgPSBWNEwyX1hGRVJfRlVOQ19ERUZBVUxUOw0KKwlxLT5waXhfbXAuY29s
b3JzcGFjZSA9IFY0TDJfQ09MT1JTUEFDRV9TUkdCOw0KKwlxLT5waXhfbXAueWNiY3JfZW5jID0g
VjRMMl9ZQ0JDUl9FTkNfNjAxOw0KKwlxLT5waXhfbXAucXVhbnRpemF0aW9uID0gVjRMMl9RVUFO
VElaQVRJT05fRlVMTF9SQU5HRTsNCisJcS0+cGl4X21wLnhmZXJfZnVuYyA9IFY0TDJfWEZFUl9G
VU5DX1NSR0I7DQogCXEtPnBpeF9tcC53aWR0aCA9IE1US19KUEVHX01JTl9XSURUSDsNCiAJcS0+
cGl4X21wLmhlaWdodCA9IE1US19KUEVHX01JTl9IRUlHSFQ7DQogDQotLSANCjIuMTguMA0K

