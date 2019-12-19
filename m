Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F71125AEA
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 06:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfLSFuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 00:50:15 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:60208 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726173AbfLSFuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 00:50:15 -0500
X-UUID: 08153405ae254b168878f88ed5775368-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8+udwW9ydlC4KQTtYur2M+Ty/WRaWGdCUNJ2Tn5kvRU=;
        b=G+mRv7qvbKhffGUM7KF9OyC5kQODHjZzQeI+Vpb6BmvgBmLUR0NirDIpkYKLuyyJPHcUuBPllXCYEsu74SqTorq67P4Rhbu7rYA2ZV22QxY7LMu74aU4YIO3+cyTInJLaV0fFZBR9+S+Qb+tTgelWHfcuSfySplDald8tbsbqro=;
X-UUID: 08153405ae254b168878f88ed5775368-20191219
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 2092210126; Thu, 19 Dec 2019 13:50:09 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 13:49:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 19 Dec 2019 13:50:11 +0800
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
Subject: [v6, 2/5] dts: arm64: mt8183: Add ISP Pass 1 nodes
Date:   Thu, 19 Dec 2019 13:49:27 +0800
Message-ID: <20191219054930.29513-3-jungo.lin@mediatek.com>
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

QWRkIG5vZGVzIGZvciBQYXNzIDEgdW5pdCBvZiBNZWRpYXRlaydzIGNhbWVyYSBJU1Agc3lzdGVt
Lg0KUGFzcyAxIHVuaXQgZW1iZWRkZWQgaW4gTWVkaWF0ZWsgU29Dcywgd29ya3Mgd2l0aCB0aGUN
CmNvLXByb2Nlc3NvciB0byBwcm9jZXNzIGltYWdlIHNpZ25hbCBmcm9tIHRoZSBpbWFnZSBzZW5z
b3INCmFuZCBvdXRwdXQgUkFXIGltYWdlIGRhdGEuDQoNClNpZ25lZC1vZmYtYnk6IEp1bmdvIExp
biA8anVuZ28ubGluQG1lZGlhdGVrLmNvbT4NClNpZ25lZC1vZmYtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBjaHJvbWl1bS5vcmc+DQotLS0NCkNoYW5nZXMgZnJvbSB2NjoNCiAtIEFkZCBwb3J0IG5v
ZGUgZGVzY3JpcHRpb24gaW4gdGhlIGRldmljZSB0cmVlIGJ5IFRvbWFzeiBGaWdhLg0KLS0tDQog
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDM4ICsrKysrKysrKysr
KysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQoNCmRpZmYg
LS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQ0KaW5kZXggMTBiMzI0NzFiYzdiLi43
YTUzNDkzNzFiOWYgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My5kdHNpDQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNp
DQpAQCAtNjQxLDUgKzY0MSw0MyBAQA0KIAkJCXJlZyA9IDwwIDB4MWEwMDAwMDAgMCAweDEwMDA+
Ow0KIAkJCSNjbG9jay1jZWxscyA9IDwxPjsNCiAJCX07DQorDQorCQljYW1pc3A6IGNhbWlzcEAx
YTAwMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtY2FtaXNwIjsNCisJ
CQlyZWcgPSA8MCAweDFhMDAwMDAwIDAgMHgxMDAwPiwNCisJCQkJCTwwIDB4MWEwMDMwMDAgMCAw
eDEwMDA+LA0KKwkJCQkJPDAgMHgxYTAwNDAwMCAwIDB4MjAwMD4sDQorCQkJCQk8MCAweDFhMDA2
MDAwIDAgMHgyMDAwPiwNCisJCQkJCTwwIDB4MWEwMDgwMDAgMCAweDIwMDA+Ow0KKwkJCXJlZy1u
YW1lcyA9ICJjYW1fc3lzIiwNCisJCQkJCSJjYW1fdW5pIiwNCisJCQkJCSJjYW1fYSIsDQorCQkJ
CQkiY2FtX2IiLA0KKwkJCQkJImNhbV9jIjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjUz
IElSUV9UWVBFX0xFVkVMX0xPVz4sDQorCQkJCQk8R0lDX1NQSSAyNTQgSVJRX1RZUEVfTEVWRUxf
TE9XPiwNCisJCQkJCTxHSUNfU1BJIDI1NSBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KKwkJCQkJPEdJ
Q19TUEkgMjU2IElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQkJaW50ZXJydXB0LW5hbWVzID0gImNh
bV91bmkiLA0KKwkJCQkJImNhbV9hIiwNCisJCQkJCSJjYW1fYiIsDQorCQkJCQkiY2FtX2MiOw0K
KwkJCWlvbW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfQ0FNX0lNR08+Ow0KKwkJCWNsb2NrcyA9IDwm
Y2Ftc3lzIENMS19DQU1fQ0FNPiwNCisJCQkJCTwmY2Ftc3lzIENMS19DQU1fQ0FNVEc+Ow0KKwkJ
CWNsb2NrLW5hbWVzID0gImNhbXN5c19jYW1fY2dwZG4iLA0KKwkJCQkJImNhbXN5c19jYW10Z19j
Z3BkbiI7DQorCQkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjM+LA0KKwkJCQkJPCZsYXJiNj47DQor
CQkJcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9ET01BSU5fQ0FNPjsNCisJ
CQltZWRpYXRlayxzY3AgPSA8JnNjcD47DQorDQorCQkJcG9ydCB7DQorCQkJCWNhbWlzcF9lbmRw
b2ludDogZW5kcG9pbnQgew0KKwkJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZzZW5pbmZfY2FtaXNw
X2VuZHBvaW50PjsNCisJCQkJfTsNCisJCQl9Ow0KKwkJfTsNCisJCX07DQogCX07DQogfTsNCi0t
IA0KMi4xOC4wDQo=

