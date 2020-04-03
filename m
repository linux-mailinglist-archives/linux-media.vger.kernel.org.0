Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630AE19D424
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 11:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390672AbgDCJkm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 05:40:42 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:17267 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727792AbgDCJkm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 05:40:42 -0400
X-UUID: 9ea0d21248fc418e912638293ffb9ce8-20200403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=c1lBoeePqV1aKam27q7ICTCpSJlVQ6/waFZtS3ewYis=;
        b=YybZEX8+EbcYaT/v/MJAmKpVJ3NT1XFA7cM8vqpZqWP4fLwRqgEeGT5B2SlHYh4gAYxH40bgKjoUoX2NqnXt0tGtB51nXRA+jlfDcVxcwUfLB4JC1o4m+Ra7npUqYPURndze9W0VK8Ux8cgnS60RiuqymVrlSKgmfitYi3PULrE=;
X-UUID: 9ea0d21248fc418e912638293ffb9ce8-20200403
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1287811063; Fri, 03 Apr 2020 17:40:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Apr 2020 17:40:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Apr 2020 17:40:31 +0800
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
        <maoguang.meng@mediatek.com>, <sj.huang@mediatek.com>,
        Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v8 01/14] media: platform: Improve subscribe event flow for bug fixing
Date:   Fri, 3 Apr 2020 17:40:20 +0800
Message-ID: <20200403094033.8288-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200403094033.8288-1-xia.jiang@mediatek.com>
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TGV0IHY0bDJfY3RybF9zdWJzY3JpYmVfZXZlbnQoKSBkbyB0aGUgam9iIGZvciBvdGhlciB0eXBl
cyBleGNlcHQNClY0TDJfRVZFTlRfU09VUkNFX0NIQU5HRS4NCg0KU2lnbmVkLW9mZi1ieTogWGlh
IEppYW5nIDx4aWEuamlhbmdAbWVkaWF0ZWsuY29tPg0KLS0tDQp2ODogbm8gY2hhbmdlcw0KLS0t
DQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCA0ICsr
LS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5k
ZXggZWU4MDJmYzNiY2RmLi5jZGU1OTI3NWQ0OWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC00NDYsOSArNDQ2LDkgQEAgc3Rh
dGljIGludCBtdGtfanBlZ19zdWJzY3JpYmVfZXZlbnQoc3RydWN0IHY0bDJfZmggKmZoLA0KIAlz
d2l0Y2ggKHN1Yi0+dHlwZSkgew0KIAljYXNlIFY0TDJfRVZFTlRfU09VUkNFX0NIQU5HRToNCiAJ
CXJldHVybiB2NGwyX3NyY19jaGFuZ2VfZXZlbnRfc3Vic2NyaWJlKGZoLCBzdWIpOw0KLQlkZWZh
dWx0Og0KLQkJcmV0dXJuIC1FSU5WQUw7DQogCX0NCisNCisJcmV0dXJuIHY0bDJfY3RybF9zdWJz
Y3JpYmVfZXZlbnQoZmgsIHN1Yik7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbXRrX2pwZWdfZ19zZWxl
Y3Rpb24oc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQotLSANCjIuMTguMA0K

