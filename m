Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D80411A9E6
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 12:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbfLKL26 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 06:28:58 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:7506 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727365AbfLKL26 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 06:28:58 -0500
X-UUID: 5377831089d34fb8aa5b1a3d7d242e2f-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=E6iZNCkFCawyWjZRc34zhuu8VrWUse/gSOjQa/y+r/g=;
        b=HWM5xuHk3TqbXjVy/WRN4RQ1WNBaWP0zFwTpKBWTCGYAQ0iT3CRFbHTHuCsXKIddn5LPghJiV3pZ23/AzAbV32EGwIHcCF2RhswKOVH00tKV/u05DONrRPyG0fekQxfM7HWYjTEDmDy0ohl/cSTJF4RZn5kq5E/vp9j9YE5phmk=;
X-UUID: 5377831089d34fb8aa5b1a3d7d242e2f-20191211
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1867455819; Wed, 11 Dec 2019 19:28:53 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 19:28:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 19:28:26 +0800
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
Subject: [V6, 0/2] media: i2c: Add support for OV02A10 sensor
Date:   Wed, 11 Dec 2019 19:28:47 +0800
Message-ID: <20191211112849.16705-1-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgc2VyaWVzIGFkZHMgRFQgYmluZGluZyBhbmQgZHJpdmVyIGZvciBPbW5p
dmlzaW9uJ3MgT1YwMkExMCAyIG1lZ2FwaXhlbCBDTU9TIDEvNSIgc2Vuc29yLA0Kd2hpY2ggaGFz
IGEgc2luZ2xlIE1JUEkgbGFuZSBpbnRlcmZhY2UgYW5kIG91dHB1dCBmb3JtYXQgb2YgMTAtYml0
IFJBVy4NCg0KVGhlIGRyaXZlciBpcyBpbXBsZW1lbnRlZCB3dGggVjRMMiBmcmFtZXdvcmsuDQox
LiBBc3luYyByZWdpc3RlcmVkIGFzIGEgVjRMMiBJMkMgc3ViLWRldmljZS4NCjIuIFRoZSBmaXJz
dCBjb21wb25lbnQgb2YgY2FtZXJhIHN5c3RlbSBpbmNsdWRpbmcgU2VuaW5mLCBJU1AuDQozLiBB
IG1lZGlhIGVudGl0eSB0aGF0IGNhbiBwcm92aWRlIG9uZSBzb3VyY2UgcGFkIGluIGNvbW1vbiBh
bmQgdHdvIGZvciBkdWFsIGNhbWVyYS4NCg0KQ2hhbmdlcyBjb21wYXJlZCB0byB2NToNCiAtIFJl
YmFzZSBvbnRvIDUuNS1yYzENCiAtIFJlbW92ZSB0aGUgaGFuZGxlciBvZiAib3Z0aSwgaHMtdm9k
LWFkanVzdCIgcHJvcGVydHkNCiAtIERlZmluZSBuZXcgbWFjcm8gSFpfUEVSX01IWiB0byBkZXNj
cmliZSBmcmVxdWVuY3ktcmVsYXRlZCBwYXJhbWV0ZXJzDQogLSBGaXh1cCBjb2Rpbmcgc3R5bGUg
YW5kIGltcHJvdmUgY29kZSBxdWFsaXR5DQogLSBGaXggb3RoZXIgcmV2aWV3ZWQgaXNzdWVzIGlu
IHY1DQoNCkNoYW5nZXMgb2YgdjUgYXJlIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBTYWthcmks
IFRvbWFzei4NCiAtIFNldCBkZWZhdWx0IG9yaWVudGF0aW9uIGluIGR0LWJpbmRpbmdzDQogLSBN
b3ZlIHRoZSBjb250ZW50IG9mIHBvd2VyIG9uL29mZiBkaXJlY3RseSB0byB0aGUgcmVzdW1lL3N1
c3BlbmQgY2FsbGJhY2tzDQogLSBNb3ZlIHNlbnNvciBpZCBjaGVjayB0byBwb3dlciBvbiB0byBh
dm9pZCB0aGUgcHJpdmFjeSBMRUQgZmxhc2ggb24gYm9vdA0KIC0gUmVtb3ZlIHVubmVjZXNzYXJ5
IGRlYnVnIGxvZyBpbiBkcml2ZXINCiAtIEZpeCBvdGhlciByZXZpZXdlZCBpc3N1ZXMgaW4gdjQN
Cg0KQ2hhbmdlcyBvZiB2NCBtYWlubHkgYWRkcmVzcyB0aGUgY29tbWVudHMgZnJvbSBTYWthcmks
IFJvYiwgVG9tYXN6Lg0KIC0gUmVtb3ZlIGRhdGEtbGFuZXMgcHJvcGVydHkgaW4gRFQNCiAtIEFk
ZCBsaW5rIGZyZXF1ZW5jaWVzIGluIERUIHRvIG1hdGNoIHRoZSBleHBlY3QgdmFsdWUgdGhhdCBk
cml2ZXIgcmVxdWlyZXMNCiAtIE9taXQgb3BlbiBjYWxsYmFjayBhcyBpbnRfY2ZnIGlzIGltcGxl
bWVudGVkDQogLSBVc2UgaTJjX3NtYnVzX3dyaXRlX2J5dGVfZGF0YS9pMmNfc21idXNfcmVhZF9i
eXRlX2RhdGEgaW5zdGVhZCBvZiBjdXN0b21lZCBBUElzDQogLSBVc2UgZG9fZGl2IHRvIGNhbGN1
bGF0ZSBwaXhlbCByYXRlDQogLSBVc2UgdXNsZWVwX3JhbmdlIGRpcmVjdGx5IGZvciBzaG90ZXIg
c2xlZXAgY2FzZQ0KIC0gUmUtYWRqdXN0IHNlbnNvciBwb3dlciB1cC9vZmYgc2VxdWVuY2UNCiAt
IFJlLXNldCBwZC9yc3QgR1BJTyBpbnZlcnRlciBwcm9wZXJ0eSBhY2NvcmRpbmcgdG8gdGhlIGRh
dGFzaGVldA0KIC0gUmVmaW5lIHNldF9leHBvc3VyZS9zZXRfZ2Fpbi9zZXRfdmJsYW5raW5nL3Nl
dF90ZXN0X3BhdHRlcm4gZnVuY3Rpb25zDQogLSBGaXggb3RoZXIgcmV2aWV3ZWQgaXNzdWVzIGlu
IHYzDQoNCkNoYW5nZXMgb2YgdjMgYXJlIG1haW5seSBhZGRyZXNzaW5nIGNvbW1lbnRzIGZyb20g
Um9iLCBTYWthcmksIEJpbmdidS4NCiAtIEZpeCBjb2Rpbmcgc3R5bGUgZXJyb3JzIGluIGR0LWJp
bmRpbmdzDQogLSBVc2UgbWFjcm8gZmxhZyB0byBkZXNjcmlibGUgYmFzaWMgbGluZSAxMjI0IHdo
ZW4gdXBkYXRpbmcgdi1ibGFua2luZw0KIC0gUmVtb3ZlIHVubmVjZXNzYXJ5IGRlYnVnIGxvZyBp
biBkcml2ZXINCg0KTWFpbmx5IGNoYW5nZXMgb2YgdjIgYXJlIGFkZHJlc3NpbmcgdGhlIGNvbW1l
bnRzIGZyb20gTmljb2xhcywgQmluZ2J1LCBTYWthcmksIFJvYiwNCmluY2x1ZGluZywNCiAtIFB1
dCBkdCBiaW5kaW5nIGJlZm9yZSBkcml2ZXIgaW4gc2VyaWVzDQogLSBBZGQgTUFJTlRBSU5FUlMg
ZW50cmllcw0KIC0gU3F1YXNoIHRoZSBNQUlOVEFJTkVSUyBlbnRyeSBhbmQgS2NvbmZpZyB0byBk
cml2ZXIgcGF0Y2gNCiAtIEFkZCByb3RhdGlvbiBzdXBwb3J0IGZvciBkcml2ZXINCiAtIEZpeCBv
dGhlciByZXZpZXdlZCBpc3N1ZXMgaW4gdjENCg0KRG9uZ2NodW4gWmh1ICgyKToNCiAgbWVkaWE6
IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBPVjAyQTEwIGJpbmRpbmdzDQogIG1l
ZGlhOiBpMmM6IG92MDJhMTA6IEFkZCBPVjAyQTEwIGltYWdlIHNlbnNvciBkcml2ZXINCg0KIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdjAyYTEwLnR4dCAgICAgIHwgICA1NCAr
DQogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICA4ICsNCiBkcml2ZXJzL21lZGlhL2kyYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMTEgKw0KIGRyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMvb3YwMmExMC5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxMTAyICsrKysrKysrKysrKysrKysrKysrDQogNSBmaWxlcyBjaGFuZ2Vk
LCAxMTc2IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9vdjAyYTEwLnR4dA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL21lZGlhL2kyYy9vdjAyYTEwLmMNCg0KLS0gDQoyLjkuMg0K

