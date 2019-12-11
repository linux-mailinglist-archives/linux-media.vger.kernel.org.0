Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 073A311A9E8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 12:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729052AbfLKL3A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 06:29:00 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:1339 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727469AbfLKL27 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 06:28:59 -0500
X-UUID: dc911bde62eb46ffb4946246392216f6-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uwJzHvE/Vu9p5LA/lBxfWhqMVTs13dhoL20ywQwBvn0=;
        b=Nb8lCOySEoCniNbriVcycv3GoZjVGHWYuOQrY69rAYbvjpJ3l4Wi27G3umr6RL1jnIAogFoK0/ql3wWZk+zyqAAR0MvwQkY7eF1b+3FMoJssZniCn3v/Z/wuC26VxpNhmL7Q9RIShQhV6/FwUiPoiOVHoytRcbATMlQlGjtFpx4=;
X-UUID: dc911bde62eb46ffb4946246392216f6-20191211
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 639090184; Wed, 11 Dec 2019 19:28:54 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 19:28:30 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 19:28:27 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
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
Subject: [V6, 1/2] media: dt-bindings: media: i2c: Document OV02A10 bindings
Date:   Wed, 11 Dec 2019 19:28:48 +0800
Message-ID: <20191211112849.16705-2-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
References: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIERUIGJpbmRpbmdzIGRvY3VtZW50YXRpb24gZm9yIE9tbml2aXNpb24gT1YwMkExMCBpbWFn
ZSBzZW5zb3IuDQoNClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
U2lnbmVkLW9mZi1ieTogRG9uZ2NodW4gWmh1IDxkb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tPg0K
LS0tDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292MDJhMTAudHh0ICAgICAg
fCA1NCArKysrKysrKysrKysrKysrKysrKysrDQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysNCiAyIGZpbGVzIGNoYW5nZWQsIDYxIGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9vdjAyYTEwLnR4dA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdjAyYTEwLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3YwMmExMC50eHQNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi4xOGFjYzRmDQotLS0gL2Rldi9udWxsDQorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292MDJhMTAudHh0
DQpAQCAtMCwwICsxLDU0IEBADQorKiBPbW5pdmlzaW9uIE9WMDJBMTAgTUlQSSBDU0ktMiBzZW5z
b3INCisNCitSZXF1aXJlZCBQcm9wZXJ0aWVzOg0KKy0gY29tcGF0aWJsZTogc2hhbGwgYmUgIm92
dGksb3YwMmExMCINCistIGNsb2NrczogcmVmZXJlbmNlIHRvIHRoZSBlY2xrIGlucHV0IGNsb2Nr
DQorLSBjbG9jay1uYW1lczogc2hhbGwgYmUgImVjbGsiDQorLSBkb3ZkZC1zdXBwbHk6IERpZ2l0
YWwgSS9PIHZvbHRhZ2Ugc3VwcGx5LCAxLjggdm9sdHMNCistIGF2ZGQtc3VwcGx5OiBBbmFsb2cg
dm9sdGFnZSBzdXBwbHksIDIuOCB2b2x0cw0KKy0gZHZkZC1zdXBwbHk6IERpZ2l0YWwgY29yZSB2
b2x0YWdlIHN1cHBseSwgMS44IHZvbHRzDQorLSBwb3dlcmRvd24tZ3Bpb3M6IHJlZmVyZW5jZSB0
byB0aGUgR1BJTyBjb25uZWN0ZWQgdG8gdGhlIHBvd2VyZG93biBwaW4sDQorCQkgICBpZiBhbnku
IFRoaXMgaXMgYW4gYWN0aXZlIGxvdyBzaWduYWwgdG8gdGhlIE9WMDJBMTAuDQorLSByZXNldC1n
cGlvczogcmVmZXJlbmNlIHRvIHRoZSBHUElPIGNvbm5lY3RlZCB0byB0aGUgcmVzZXQgcGluLCBp
ZiBhbnkuDQorCSAgICAgICBUaGlzIGlzIGFuIGFjdGl2ZSBoaWdoIHNpZ25hbCB0byB0aGUgT1Yw
MkExMC4NCisNCitPcHRpb25hbCBQcm9wZXJ0aWVzOg0KKy0gcm90YXRpb246IGFzIGRlZmluZWQg
aW4NCisJICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1p
bnRlcmZhY2VzLnR4dCwNCisJICAgIHZhbGlkIHZhbHVlcyBhcmUgMCAoc2Vuc29yIG1vdW50ZWQg
dXByaWdodCkgYW5kIDE4MCAoc2Vuc29yDQorCSAgICBtb3VudGVkIHVwc2lkZSBkb3duKS4NCisN
CitUaGUgZGV2aWNlIG5vZGUgc2hhbGwgY29udGFpbiBvbmUgJ3BvcnQnIGNoaWxkIG5vZGUgd2l0
aCBhbg0KKydlbmRwb2ludCcgc3Vibm9kZSBmb3IgaXRzIGRpZ2l0YWwgb3V0cHV0IHZpZGVvIHBv
cnQsDQoraW4gYWNjb3JkYW5jZSB3aXRoIHRoZSB2aWRlbyBpbnRlcmZhY2UgYmluZGluZ3MgZGVm
aW5lZCBpbg0KK0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92aWRlby1p
bnRlcmZhY2VzLnR4dC4NCisNCitFeGFtcGxlOg0KKyZpMmM0IHsNCisJb3YwMmExMDogY2FtZXJh
LXNlbnNvckAzZCB7DQorCQljb21wYXRpYmxlID0gIm92dGksb3YwMmExMCI7DQorCQlyZWcgPSA8
MHgzZD47DQorCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KKwkJcGluY3RybC0wID0gPCZj
YW1lcmFfcGluc19jYW0xX21jbGtfb24+Ow0KKw0KKwkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtf
VE9QX01VWF9DQU1URzI+LA0KKwkJCTwmdG9wY2tnZW4gQ0xLX1RPUF9VTklWUF8xOTJNX0Q4PjsN
CisJCWNsb2NrLW5hbWVzID0gImVjbGsiLCAiZnJlcV9tdXgiOw0KKwkJY2xvY2stZnJlcXVlbmN5
ID0gPDI0MDAwMDAwPjsNCisNCisJCWRvdmRkLXN1cHBseSA9IDwmbXQ2MzU4X3ZjYW1pb19yZWc+
Ow0KKwkJYXZkZC1zdXBwbHkgPSA8Jm10NjM1OF92Y2FtYTFfcmVnPjsNCisJCWR2ZGQtc3VwcGx5
ID0gPCZtdDYzNThfdmNuMThfcmVnPjsNCisJCXBvd2VyZG93bi1ncGlvcyA9IDwmcGlvIDEwNyBH
UElPX0FDVElWRV9MT1c+Ow0KKwkJcmVzZXQtZ3Bpb3MgPSA8JnBpbyAxMDkgR1BJT19BQ1RJVkVf
SElHSD47DQorCQlyb3RhdGlvbiA9IDwxODA+Ow0KKw0KKwkJcG9ydCB7DQorCQkJLyogTUlQSSBD
U0ktMiBidXMgZW5kcG9pbnQgKi8NCisJCQlvdjAyYTEwX2NvcmU6IGVuZHBvaW50IHsNCisJCQkJ
cmVtb3RlLWVuZHBvaW50ID0gPCZvdjAyYTEwXzA+Ow0KKwkJCQlsaW5rLWZyZXF1ZW5jaWVzID0g
L2JpdHMvIDY0IDwzOTAwMDAwMDA+Ow0KKwkJCX07DQorCQl9Ow0KKwl9Ow0KK307DQpkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXggYmQ1ODQ3ZS4uOTJhODY4YyAx
MDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9NQUlOVEFJTkVSUw0KQEAgLTEyMTMwLDYg
KzEyMTMwLDEzIEBAIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9yZy9tZWRpYV90cmVlLmdpdA0KIFM6
CU1haW50YWluZWQNCiBGOglkcml2ZXJzL21lZGlhL2kyYy9vdjEzODU4LmMNCiANCitPTU5JVklT
SU9OIE9WMDJBMTAgU0VOU09SIERSSVZFUg0KK006CURvbmdjaHVuIFpodSA8ZG9uZ2NodW4uemh1
QG1lZGlhdGVrLmNvbT4NCitMOglsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCitUOglnaXQg
Z2l0Oi8vbGludXh0di5vcmcvbWVkaWFfdHJlZS5naXQNCitTOglNYWludGFpbmVkDQorRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdjAyYTEwLnR4dA0KKw0K
IE9NTklWSVNJT04gT1YyNjgwIFNFTlNPUiBEUklWRVINCiBNOglSdWkgTWlndWVsIFNpbHZhIDxy
bWZyZnNAZ21haWwuY29tPg0KIEw6CWxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KLS0gDQoy
LjkuMg0K

