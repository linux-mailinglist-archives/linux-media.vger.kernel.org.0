Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC7C22A596
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 05:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387820AbgGWDGq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jul 2020 23:06:46 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:27553 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387844AbgGWDGp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jul 2020 23:06:45 -0400
X-UUID: 8b4354a3001d4126a3a128c136f3bf28-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+qGpUoiGKZLF+nB5b8VhVUABEj5+eZ7x/jkHixmWgAw=;
        b=shMPoiy9m3Al9dITMNPa8xPwuxhpDyytvXtba1diyUR9+KrRp0O30KU841NnxBKyVi2L221Gh//QZZtm/EvZ6OQuLSOeVkZ3Gin7mIDpTv9vnh5vBL9tks3QrvLI/JXYxLnWFpFrac/E+GiNZA7S/UXBlGFdABg3qbcfzzc8Vzs=;
X-UUID: 8b4354a3001d4126a3a128c136f3bf28-20200723
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1840404565; Thu, 23 Jul 2020 11:06:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:39 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:35 +0800
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
Subject: [PATCH v10 24/28] arm: dts: mt2701: Add jpeg enc device tree node
Date:   Thu, 23 Jul 2020 11:04:47 +0800
Message-ID: <20200723030451.5616-25-xia.jiang@mediatek.com>
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

QWRkIGpwZWcgZW5jIGRldmljZSB0cmVlIG5vZGUuDQoNClNpZ25lZC1vZmYtYnk6IFhpYSBKaWFu
ZyA8eGlhLmppYW5nQG1lZGlhdGVrLmNvbT4NCi0tLQ0KdjEwOiBubyBjaGFuZ2VzDQotLS0NCiBh
cmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSB8IDEzICsrKysrKysrKysrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvbXQyNzAxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaQ0KaW5kZXggOGQ0
M2E1MDJhYWRhLi4xYzFjMjEzMjIzNGYgMTAwNjQ0DQotLS0gYS9hcmNoL2FybS9ib290L2R0cy9t
dDI3MDEuZHRzaQ0KKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0c2kNCkBAIC01Njgs
NiArNTY4LDE5IEBADQogCQkJIDwmaW9tbXUgTVQyNzAxX000VV9QT1JUX0pQR0RFQ19CU0RNQT47
DQogCX07DQogDQorCWpwZWdlbmM6IGpwZWdlbmNAMTUwMGEwMDAgew0KKwkJY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDI3MDEtanBnZW5jIiwNCisJCQkgICAgICJtZWRpYXRlayxtdGstanBnZW5j
IjsNCisJCXJlZyA9IDwwIDB4MTUwMGEwMDAgMCAweDEwMDA+Ow0KKwkJaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDE0MSBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KKwkJY2xvY2tzID0gIDwmaW1nc3lzIENM
S19JTUdfVkVOQz47DQorCQljbG9jay1uYW1lcyA9ICJqcGdlbmMiOw0KKwkJcG93ZXItZG9tYWlu
cyA9IDwmc2Nwc3lzIE1UMjcwMV9QT1dFUl9ET01BSU5fSVNQPjsNCisJCW1lZGlhdGVrLGxhcmIg
PSA8JmxhcmIyPjsNCisJCWlvbW11cyA9IDwmaW9tbXUgTVQyNzAxX000VV9QT1JUX0pQR0VOQ19S
RE1BPiwNCisJCQkgPCZpb21tdSBNVDI3MDFfTTRVX1BPUlRfSlBHRU5DX0JTRE1BPjsNCisJfTsN
CisNCiAJdmRlY3N5czogc3lzY29uQDE2MDAwMDAwIHsNCiAJCWNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQyNzAxLXZkZWNzeXMiLCAic3lzY29uIjsNCiAJCXJlZyA9IDwwIDB4MTYwMDAwMDAgMCAw
eDEwMDA+Ow0KLS0gDQoyLjE4LjANCg==

