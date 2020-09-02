Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C740825AAC7
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 14:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgIBMDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 08:03:51 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:45907 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726177AbgIBMDr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Sep 2020 08:03:47 -0400
X-UUID: 1b8ccfd47a7c409192883d82bb490922-20200902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=DMolEQgcko1Hi3JfFgntu1uI44EPYKHXW5wUFW7a+48=;
        b=SMr3bXOu9PWhs1WeLiZD8aOIYVrLc4096OxzB9UIVGCCONXuOogWRk1fa83SCR4UraUODQgn47tEVMNUFdZOqAauyNBkVFpAPl35okKFwu7msPrjY7pgFbBT4iT3QA0EMJZpT2gr1VbU+QqAo8zpY8JZ9fpW68Zs0wf4hvaGaes=;
X-UUID: 1b8ccfd47a7c409192883d82bb490922-20200902
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1855598811; Wed, 02 Sep 2020 20:03:41 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 20:03:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Sep 2020 20:03:37 +0800
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
Subject: [PATCH v14 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Wed, 2 Sep 2020 20:01:20 +0800
Message-ID: <20200902120122.24456-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgWUFNTCBEVCBiaW5kaW5nIGFuZCBWNEwyIHN1Yi1k
ZXZpY2UgZHJpdmVyIGZvciBPbW5pdmlzaW9uJ3MNCk9WMDJBMTAgMi1tZWdhcGl4ZWwgMTAtYml0
IFJBVyBDTU9TIDEvNSIgc2Vuc29yLCB3aGljaCBoYXMgYSBzaW5nbGUgTUlQSSBsYW5lDQppbnRl
cmZhY2UgYW5kIHVzZXMgdGhlIEkyQyBidXMgZm9yIGNvbnRyb2wgYW5kIHRoZSBDU0ktMiBidXMg
Zm9yIGRhdGEuDQoNClRoZSBkcml2ZXIgaXMgaW1wbGVtZW50ZWQgd2l0aCBWNEwyIGZyYW1ld29y
ay4NCiAtIEFzeW5jIHJlZ2lzdGVyZWQgYXMgYSBWNEwyIHN1Yi1kZXZpY2UuDQogLSBBcyB0aGUg
Zmlyc3QgY29tcG9uZW50IG9mIGNhbWVyYSBzeXN0ZW0gaW5jbHVkaW5nIFNlbmluZiwgSVNQIHBp
cGVsaW5lLg0KIC0gQSBtZWRpYSBlbnRpdHkgdGhhdCBwcm92aWRlcyBvbmUgc291cmNlIHBhZCBp
biBjb21tb24gYW5kIHR3byBmb3IgZHVhbC1jYW0uDQoNCkFsc28gdGhpcyBkcml2ZXIgc3VwcG9y
dHMgZm9sbG93aW5nIGZlYXR1cmVzOg0KIC0gTWFudWFsIGV4cG9zdXJlIGFuZCBhbmFsb2cgZ2Fp
biBjb250cm9sIHN1cHBvcnQNCiAtIFZlcnRpY2FsIGJsYW5raW5nIGNvbnRyb2wgc3VwcG9ydA0K
IC0gVGVzdCBwYXR0ZXJuIHN1cHBvcnQNCiAtIE1lZGlhIGNvbnRyb2xsZXIgc3VwcG9ydA0KIC0g
UnVudGltZSBQTSBzdXBwb3J0DQogLSBTdXBwb3J0IHJlc29sdXRpb246IDE2MDB4MTIwMCBhdCAz
MEZQUw0KIA0KUHJldmlvdXMgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC1zZXQgY2FuIGJlIGZvdW5k
IGhlcmU6DQogdjEzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDIwMDcx
MDEwMTg1MC40NjA0LTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MTI6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNzAyMTE1MjIzLjIxNTA3LTEtZG9uZ2No
dW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MTE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LW1lZGlhLzIwMjAwNjMwMDI0OTQyLjIwODkxLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8N
CiB2MTA6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNjE1MTIyOTM3
LjE4OTY1LTMtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDk6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNTIzMDg0MTAzLjMxMjc2LTEtZG9uZ2NodW4uemh1
QG1lZGlhdGVrLmNvbS8NCiB2MDg6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlh
LzIwMjAwNTA5MDgwNjI3LjIzMjIyLTEtZG9uZ2NodW4uemh1QG1lZGlhdGVrLmNvbS8NCiB2MDc6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhLzIwMjAwNDMwMDgwOTI0LjExNDAt
MS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwNjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWVkaWEvMjAxOTEyMTExMTI4NDkuMTY3MDUtMS1kb25nY2h1bi56aHVAbWVkaWF0
ZWsuY29tLw0KIHYwNTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTEx
MDQxMDU3MTMuMjQzMTEtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwNDogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA5MDcwOTI3MjguMjM4OTctMS1kb25n
Y2h1bi56aHVAbWVkaWF0ZWsuY29tLw0KIHYwMzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtbWVkaWEvMjAxOTA4MTkwMzQzMzEuMTMwOTgtMS1kb25nY2h1bi56aHVAbWVkaWF0ZWsuY29t
Lw0KIHYwMjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWEvMjAxOTA3MDQwODQ2
NTEuMzEwNS0xLWRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20vDQogdjAxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tZWRpYS8yMDE5MDUyMzEwMjIwNC4yNDExMi0xLWRvbmdjaHVuLnpo
dUBtZWRpYXRlay5jb20vDQoNCkNoYW5nZXMgb2YgdjE0IG1haW5seSBhZGRyZXNzIGNvbW1lbnRz
IGZyb20gVG9tYXN6IGFuZCBTYWthcmkuDQpDb21wYXJlZCB0byB2MTM6DQogLSBGaXggaW1wZXJm
ZWN0aW9ucyBpbiBEVA0KIC0gVXNlIGFuIGFycmF5IHByb3BlcnR5ICJvdnRpLG1pcGktY2xvY2st
dm9sdGFnZSIgdG8gaW5kaWNhdGUgTUlQSSBUWCBzcGVlZA0KIC0gQWRkIHRoZSBoYW5kbGVyIHRv
IHRoZSBvcHRpb25hbCBwcm9wZXJ0eSAib3Z0aSxtaXBpLWNsb2NrLXZvbHRhZ2UiIGluIGRyaXZl
cg0KDQpQbGVhc2UgaGVscCB0byByZXZpZXcgdGhpcyBwYXRjaC4NClRoYW5rcy4NCg0KRG9uZ2No
dW4gWmh1ICgyKToNCiAgbWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBP
VjAyQTEwIGJpbmRpbmdzDQogIG1lZGlhOiBpMmM6IEFkZCBPVjAyQTEwIGltYWdlIHNlbnNvciBk
cml2ZXINCg0KIC4uLi9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjAyYTEwLnlhbWwgICAgICAg
ICAgIHwgIDE2MSArKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgIDggKw0KIGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxMyArDQogZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCiBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEw
LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDEwODMgKysrKysrKysrKysrKysrKysrKysNCiA1
IGZpbGVzIGNoYW5nZWQsIDEyNjYgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3YwMmExMC55
YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvaTJjL292MDJhMTAuYw0KDQot
LSANCjIuOS4yDQo=

