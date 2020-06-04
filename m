Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723FD1EE090
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 11:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgFDJIG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 05:08:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:9358 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728089AbgFDJIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 05:08:06 -0400
X-UUID: bd92d45f2c9547689140db1286055b84-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uB/eaRDqLP8g/98zHxi4C86lzCa4pVEjbzjzQz34ezU=;
        b=GhDXYv0JXpN4BRm5PyXMn3/qRML3rWD4RAr2xbx42uPrLUaUVGchfB6i5ZnhjpDKb6n7j/P1nNkotxDCr3A4h2MDq4iuCBAOb2OmyhoIs/1FCV3Ca7tfo0rBrEwVvYivkV7n2TnP3FOYroGODF8zzDh0gVvAJyagDcjiQs1iEis=;
X-UUID: bd92d45f2c9547689140db1286055b84-20200604
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 236665714; Thu, 04 Jun 2020 17:08:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:01 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:07:59 +0800
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
Subject: [PATCH RESEND v9 01/18] media: platform: Improve subscribe event flow for bug fixing
Date:   Thu, 4 Jun 2020 17:05:36 +0800
Message-ID: <20200604090553.10861-3-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TGV0IHY0bDJfY3RybF9zdWJzY3JpYmVfZXZlbnQoKSBkbyB0aGUgam9iIGZvciBvdGhlciB0eXBl
cyBleGNlcHQNClY0TDJfRVZFTlRfU09VUkNFX0NIQU5HRS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhp
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnY5OiBubyBjaGFuZ2VzDQotLS0NCiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyB8IDQgKystLQ0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQppbmRleCBmODJhODFh
M2JkZWUuLjRhZDRhNGIzMGEwZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jDQorKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2NvcmUuYw0KQEAgLTQ0Niw5ICs0NDYsOSBAQCBzdGF0aWMgaW50IG10
a19qcGVnX3N1YnNjcmliZV9ldmVudChzdHJ1Y3QgdjRsMl9maCAqZmgsDQogCXN3aXRjaCAoc3Vi
LT50eXBlKSB7DQogCWNhc2UgVjRMMl9FVkVOVF9TT1VSQ0VfQ0hBTkdFOg0KIAkJcmV0dXJuIHY0
bDJfc3JjX2NoYW5nZV9ldmVudF9zdWJzY3JpYmUoZmgsIHN1Yik7DQotCWRlZmF1bHQ6DQotCQly
ZXR1cm4gLUVJTlZBTDsNCiAJfQ0KKw0KKwlyZXR1cm4gdjRsMl9jdHJsX3N1YnNjcmliZV9ldmVu
dChmaCwgc3ViKTsNCiB9DQogDQogc3RhdGljIGludCBtdGtfanBlZ19nX3NlbGVjdGlvbihzdHJ1
Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwNCi0tIA0KMi4xOC4wDQo=

