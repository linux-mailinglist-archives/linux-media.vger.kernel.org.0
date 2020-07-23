Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13DBF22A57E
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733169AbgGWDGH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:63474 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728902AbgGWDGH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:07 -0400
X-UUID: 95506dad22c346319f49b42f4fd376b2-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a+Ih5WuOcSlcSMWUoe9LrLXVyD3j6+ncj/90Nlku/Rw=;
        b=CftzqklqyS8Ze4qqPO76eeyFZvIUAyqPSwMz/u5pZ4ZcNNNGjVjSFL0+Ka4bCg93fxaTEpLigyrEqdsMLS5P6mh4aokjxG6Q9IOc0FDxXSOFMScav96BpxeL3+wvxKhhVeTKy98GbuPDH5ReSb8BAvY0r0QCUizhJ1ZfeBuAn4Q=;
X-UUID: 95506dad22c346319f49b42f4fd376b2-20200723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1114700223; Thu, 23 Jul 2020 11:06:04 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:05:59 +0800
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
Subject: [PATCH v10 01/28] media: platform: Improve subscribe event flow for bug fixing
Date:   Thu, 23 Jul 2020 11:04:24 +0800
Message-ID: <20200723030451.5616-2-xia.jiang@mediatek.com>
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

TGV0IHY0bDJfY3RybF9zdWJzY3JpYmVfZXZlbnQoKSBkbyB0aGUgam9iIGZvciBvdGhlciB0eXBl
cyBleGNlcHQNClY0TDJfRVZFTlRfU09VUkNFX0NIQU5HRS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFz
eiBGaWdhIDx0ZmlnYUBjaHJvbWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhp
YS5qaWFuZ0BtZWRpYXRlay5jb20+DQotLS0NCnYxMDogbm8gY2hhbmdlcw0KLS0tDQogZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCA0ICsrLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5kZXggZjgyYTgx
YTNiZGVlLi40YWQ0YTRiMzBhMGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC00NDYsOSArNDQ2LDkgQEAgc3RhdGljIGludCBt
dGtfanBlZ19zdWJzY3JpYmVfZXZlbnQoc3RydWN0IHY0bDJfZmggKmZoLA0KIAlzd2l0Y2ggKHN1
Yi0+dHlwZSkgew0KIAljYXNlIFY0TDJfRVZFTlRfU09VUkNFX0NIQU5HRToNCiAJCXJldHVybiB2
NGwyX3NyY19jaGFuZ2VfZXZlbnRfc3Vic2NyaWJlKGZoLCBzdWIpOw0KLQlkZWZhdWx0Og0KLQkJ
cmV0dXJuIC1FSU5WQUw7DQogCX0NCisNCisJcmV0dXJuIHY0bDJfY3RybF9zdWJzY3JpYmVfZXZl
bnQoZmgsIHN1Yik7DQogfQ0KIA0KIHN0YXRpYyBpbnQgbXRrX2pwZWdfZ19zZWxlY3Rpb24oc3Ry
dWN0IGZpbGUgKmZpbGUsIHZvaWQgKnByaXYsDQotLSANCjIuMTguMA0K

