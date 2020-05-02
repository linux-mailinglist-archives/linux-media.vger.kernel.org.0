Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA23E1C26DE
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 18:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbgEBQSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 12:18:44 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:54392 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728235AbgEBQSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 12:18:43 -0400
X-UUID: 23a5aba5274749f796126c1cfc8ae967-20200503
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yNe42JitrwiykairkbuNE+xwc/r2A1lOiv3oLxAVtMc=;
        b=qoKcSkUd0ks74HghM0OreLLllC+vWzkbR9wOZ2Xw8wcDIJKBC4Lw5RviWqjtBTFhS9P+F3K3NzVPzpg4NlbQRXjyfYvlQEGJoy0qmJ375sxUusF3iJxWoA/JU7+WJ/66M2A0Bm4IT9LWtcegb/6169MXsHgeu6h/Tsu8KYu4Rmo=;
X-UUID: 23a5aba5274749f796126c1cfc8ae967-20200503
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by mailgw01.mediatek.com
        (envelope-from <dongchun.zhu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1202775525; Sun, 03 May 2020 00:18:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 May 2020 00:18:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 3 May 2020 00:18:27 +0800
From:   Dongchun Zhu <dongchun.zhu@mediatek.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <mchehab@kernel.org>, <andriy.shevchenko@linux.intel.com>,
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
Subject: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Date:   Sun, 3 May 2020 00:17:27 +0800
Message-ID: <20200502161727.30463-3-dongchun.zhu@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWRkIGEgVjRMMiBzdWItZGV2aWNlIGRyaXZlciBmb3IgRFc5NzY4IHZvaWNlIGNvaWwgbW90b3Is
IHByb3ZpZGluZw0KY29udHJvbCB0byBzZXQgdGhlIGRlc2lyZWQgZm9jdXMgdmlhIElJQyBzZXJp
YWwgaW50ZXJmYWNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBEb25nY2h1biBaaHUgPGRvbmdjaHVuLnpo
dUBtZWRpYXRlay5jb20+DQotLS0NCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICB8ICAgMSAr
DQogZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZyAgfCAgMTEgKysNCiBkcml2ZXJzL21lZGlhL2ky
Yy9NYWtlZmlsZSB8ICAgMSArDQogZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMgfCA0NDAgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQogNCBmaWxlcyBjaGFu
Z2VkLCA0NTMgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlh
L2kyYy9kdzk3NjguYw0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0K
aW5kZXggOGQ3MmM0MS4uYzkyZGM5OSAxMDA2NDQNCi0tLSBhL01BSU5UQUlORVJTDQorKysgYi9N
QUlOVEFJTkVSUw0KQEAgLTUxNTcsNiArNTE1Nyw3IEBAIEw6CWxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZw0KIFM6CU1haW50YWluZWQNCiBUOglnaXQgZ2l0Oi8vbGludXh0di5vcmcvbWVkaWFf
dHJlZS5naXQNCiBGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJj
L2Rvbmd3b29uLGR3OTc2OC55YW1sDQorRjoJZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCiAN
CiBET05HV09PTiBEVzk4MDcgTEVOUyBWT0lDRSBDT0lMIERSSVZFUg0KIE06CVNha2FyaSBBaWx1
cyA8c2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbT4NCmRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL2kyYy9LY29uZmlnIGIvZHJpdmVycy9tZWRpYS9pMmMvS2NvbmZpZw0KaW5kZXggMTI1ZDU5
Ni4uNmEzZjlkYSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcNCisrKyBi
L2RyaXZlcnMvbWVkaWEvaTJjL0tjb25maWcNCkBAIC0xMDQwLDYgKzEwNDAsMTcgQEAgY29uZmln
IFZJREVPX0RXOTcxNA0KIAkgIGNhcGFiaWxpdHkuIFRoaXMgaXMgZGVzaWduZWQgZm9yIGxpbmVh
ciBjb250cm9sIG9mDQogCSAgdm9pY2UgY29pbCBtb3RvcnMsIGNvbnRyb2xsZWQgdmlhIEkyQyBz
ZXJpYWwgaW50ZXJmYWNlLg0KIA0KK2NvbmZpZyBWSURFT19EVzk3NjgNCisJdHJpc3RhdGUgIkRX
OTc2OCBsZW5zIHZvaWNlIGNvaWwgc3VwcG9ydCINCisJZGVwZW5kcyBvbiBJMkMgJiYgVklERU9f
VjRMMiAmJiBNRURJQV9DT05UUk9MTEVSDQorCWRlcGVuZHMgb24gVklERU9fVjRMMl9TVUJERVZf
QVBJDQorCWRlcGVuZHMgb24gUE0NCisJaGVscA0KKwkgIFRoaXMgaXMgYSBkcml2ZXIgZm9yIHRo
ZSBEVzk3NjggY2FtZXJhIGxlbnMgdm9pY2UgY29pbC4NCisJICBEVzk3NjggaXMgYSAxMCBiaXQg
REFDIHdpdGggMTAwbUEgb3V0cHV0IGN1cnJlbnQgc2luaw0KKwkgIGNhcGFiaWxpdHkuIFRoaXMg
aXMgZGVzaWduZWQgZm9yIGxpbmVhciBjb250cm9sIG9mDQorCSAgdm9pY2UgY29pbCBtb3RvcnMs
IGNvbnRyb2xsZWQgdmlhIEkyQyBzZXJpYWwgaW50ZXJmYWNlLg0KKw0KIGNvbmZpZyBWSURFT19E
Vzk4MDdfVkNNDQogCXRyaXN0YXRlICJEVzk4MDcgbGVucyB2b2ljZSBjb2lsIHN1cHBvcnQiDQog
CWRlcGVuZHMgb24gSTJDICYmIFZJREVPX1Y0TDIgJiYgTUVESUFfQ09OVFJPTExFUg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL01ha2VmaWxlIGIvZHJpdmVycy9tZWRpYS9pMmMvTWFr
ZWZpbGUNCmluZGV4IDc3YmY3ZDAuLjQwNTc0NzYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlh
L2kyYy9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvTWFrZWZpbGUNCkBAIC0yNCw2
ICsyNCw3IEBAIG9iai0kKENPTkZJR19WSURFT19TQUE2NzUySFMpICs9IHNhYTY3NTJocy5vDQog
b2JqLSQoQ09ORklHX1ZJREVPX0FENTgyMCkgICs9IGFkNTgyMC5vDQogb2JqLSQoQ09ORklHX1ZJ
REVPX0FLNzM3NSkgICs9IGFrNzM3NS5vDQogb2JqLSQoQ09ORklHX1ZJREVPX0RXOTcxNCkgICs9
IGR3OTcxNC5vDQorb2JqLSQoQ09ORklHX1ZJREVPX0RXOTc2OCkgICs9IGR3OTc2OC5vDQogb2Jq
LSQoQ09ORklHX1ZJREVPX0RXOTgwN19WQ00pICArPSBkdzk4MDctdmNtLm8NCiBvYmotJChDT05G
SUdfVklERU9fQURWNzE3MCkgKz0gYWR2NzE3MC5vDQogb2JqLSQoQ09ORklHX1ZJREVPX0FEVjcx
NzUpICs9IGFkdjcxNzUubw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvaTJjL2R3OTc2OC5j
IGIvZHJpdmVycy9tZWRpYS9pMmMvZHc5NzY4LmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRl
eCAwMDAwMDAwLi5kZDY4NTM0DQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL21lZGlhL2ky
Yy9kdzk3NjguYw0KQEAgLTAsMCArMSw0NDAgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KKy8vIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQorDQorI2lu
Y2x1ZGUgPGxpbnV4L2RlbGF5Lmg+DQorI2luY2x1ZGUgPGxpbnV4L2kyYy5oPg0KKyNpbmNsdWRl
IDxsaW51eC9tb2R1bGUuaD4NCisjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KKyNpbmNs
dWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCisjaW5jbHVkZSA8bWVkaWEvdjRsMi1h
c3luYy5oPg0KKyNpbmNsdWRlIDxtZWRpYS92NGwyLWN0cmxzLmg+DQorI2luY2x1ZGUgPG1lZGlh
L3Y0bDItZGV2aWNlLmg+DQorI2luY2x1ZGUgPG1lZGlhL3Y0bDItc3ViZGV2Lmg+DQorDQorI2Rl
ZmluZSBEVzk3NjhfTkFNRQkJCQkiZHc5NzY4Ig0KKyNkZWZpbmUgRFc5NzY4X01BWF9GT0NVU19Q
T1MJCQkoMTAyNCAtIDEpDQorLyoNCisgKiBUaGlzIHNldHMgdGhlIG1pbmltdW0gZ3JhbnVsYXJp
dHkgZm9yIHRoZSBmb2N1cyBwb3NpdGlvbnMuDQorICogQSB2YWx1ZSBvZiAxIGdpdmVzIG1heGlt
dW0gYWNjdXJhY3kgZm9yIGEgZGVzaXJlZCBmb2N1cyBwb3NpdGlvbg0KKyAqLw0KKyNkZWZpbmUg
RFc5NzY4X0ZPQ1VTX1NURVBTCQkJMQ0KKw0KKy8qDQorICogUmluZyBjb250cm9sIGFuZCBQb3dl
ciBjb250cm9sIHJlZ2lzdGVyDQorICogQml0WzFdIFJJTkdfRU4NCisgKiAwOiBEaXJlY3QgbW9k
ZQ0KKyAqIDE6IEFBQyBtb2RlIChyaW5naW5nIGNvbnRyb2wgbW9kZSkNCisgKiBCaXRbMF0gUEQN
CisgKiAwOiBOb3JtYWwgb3BlcmF0aW9uIG1vZGUNCisgKiAxOiBQb3dlciBkb3duIG1vZGUNCisg
KiBEVzk3NjggcmVxdWlyZXMgd2FpdGluZyB0aW1lIG9mIFRvcHIgYWZ0ZXIgUEQgcmVzZXQgdGFr
ZXMgcGxhY2UuDQorICovDQorI2RlZmluZSBEVzk3NjhfUklOR19QRF9DT05UUk9MX1JFRwkJMHgw
Mg0KKyNkZWZpbmUgRFc5NzY4X1BEX01PREVfT0ZGCQkJMHgwMA0KKyNkZWZpbmUgRFc5NzY4X1BE
X01PREVfRU4JCQlCSVQoMCkNCisjZGVmaW5lIERXOTc2OF9BQUNfTU9ERV9FTgkJCUJJVCgxKQ0K
Kw0KKy8qDQorICogRFc5NzY4IHNlcGFyYXRlcyB0d28gcmVnaXN0ZXJzIHRvIGNvbnRyb2wgdGhl
IFZDTSBwb3NpdGlvbi4NCisgKiBPbmUgZm9yIE1TQiB2YWx1ZSwgYW5vdGhlciBpcyBMU0IgdmFs
dWUuDQorICogREFDX01TQjogRFs5OjhdIChBREQ6IDB4MDMpDQorICogREFDX0xTQjogRFs3OjBd
IChBREQ6IDB4MDQpDQorICogRFs5OjBdIERBQyBkYXRhIGlucHV0OiBwb3NpdGl2ZSBvdXRwdXQg
Y3VycmVudCA9IERbOTowXSAvIDEwMjMgKiAxMDBbbUFdDQorICovDQorI2RlZmluZSBEVzk3Njhf
TVNCX0FERFIJCQkJMHgwMw0KKyNkZWZpbmUgRFc5NzY4X0xTQl9BRERSCQkJCTB4MDQNCisjZGVm
aW5lIERXOTc2OF9TVEFUVVNfQUREUgkJCTB4MDUNCisNCisvKg0KKyAqIEFBQyBtb2RlIGNvbnRy
b2wgJiBwcmVzY2FsZSByZWdpc3Rlcg0KKyAqIEJpdFs3OjVdIE5hbWVseSBBQ1syOjBdLCBkZWNp
ZGUgdGhlIFZDTSBtb2RlIGFuZCBvcGVyYXRpb24gdGltZS4NCisgKiAwMDAgRGlyZWN0KGRlZmF1
bHQpDQorICogMDAxIEFBQzIgMC40OHhUdmliDQorICogMDEwIEFBQzMgMC43MHhUdmliDQorICog
MDExIEFBQzQgMC43NXhUdmliDQorICogMTAwIFJlc2VydmVkDQorICogMTAxIEFBQzggMS4xM3hU
dmliDQorICogMTEwIFJlc2VydmVkDQorICogMTExIFJlc2VydmVkDQorICogQml0WzI6MF0gTmFt
ZWx5IFBSRVNDWzI6MF0sIHNldCB0aGUgaW50ZXJuYWwgY2xvY2sgZGl2aWRpbmcgcmF0ZSBhcyBm
b2xsb3cuDQorICogMDAwIDINCisgKiAwMDEgMShkZWZhdWx0KQ0KKyAqIDAxMCAxLzINCisgKiAw
MTEgMS80DQorICogMTAwIDgNCisgKiAxMDEgNA0KKyAqIDExMCBSZXNlcnZlZA0KKyAqIDExMSBS
ZXNlcnZlZA0KKyAqLw0KKyNkZWZpbmUgRFc5NzY4X0FBQ19QUkVTQ19SRUcJCQkweDA2DQorI2Rl
ZmluZSBEVzk3NjhfQUFDM19TRUxFQ1RfRElWSURJTkdfUkFURV8xCTB4NDENCisNCisvKg0KKyAq
IFZDTSBwZXJpb2Qgb2YgdmlicmF0aW9uIHJlZ2lzdGVyDQorICogQml0WzU6MF0gRGVmaW5lZCBh
cyBWQ00gcmlzaW5nIHBlcmlvZGljIHRpbWUgKFR2aWIpIHRvZ2V0aGVyIHdpdGggUFJFU0NbMjow
XQ0KKyAqIFR2aWIgPSAoNi4zbXMgKyBBQUNUWzU6MF0gKiAwLjFtcykgKiBEaXZpZGluZyBSYXRl
DQorICogRGl2aWRpbmcgUmF0ZSBpcyB0aGUgaW50ZXJuYWwgY2xvY2sgZGl2aWRpbmcgcmF0ZSB0
aGF0IGlzIGRlZmluZWQgYXQNCisgKiBQUkVTQ0FMRSByZWdpc3RlciAoQUREOiAweDA2KQ0KKyAq
Lw0KKyNkZWZpbmUgRFc5NzY4X0FBQ19USU1FX1JFRwkJCTB4MDcNCisjZGVmaW5lIERXOTc2OF9B
QUNUX0NOVAkJCQkweDM5DQorDQorLyoNCisgKiBEVzk3NjggcmVxdWlyZXMgd2FpdGluZyB0aW1l
IChkZWxheSB0aW1lKSBvZiB0X09QUiBhZnRlciBwb3dlci11cCwNCisgKiBvciBpbiB0aGUgY2Fz
ZSBvZiBQRCByZXNldCB0YWtpbmcgcGxhY2UuDQorICovDQorI2RlZmluZSBEVzk3NjhfVF9PUFJf
VVMJCQkJMTAwMA0KKw0KKy8qDQorICogVGhpcyBhY3RzIGFzIHRoZSBtaW5pbXVtIGdyYW51bGFy
aXR5IG9mIGxlbnMgbW92ZW1lbnQuDQorICogS2VlcCB0aGlzIHZhbHVlIHBvd2VyIG9mIDIsIHNv
IHRoZSBjb250cm9sIHN0ZXBzIGNhbiBiZQ0KKyAqIHVuaWZvcm1seSBhZGp1c3RlZCBmb3IgZ3Jh
ZHVhbCBsZW5zIG1vdmVtZW50LCB3aXRoIGRlc2lyZWQNCisgKiBudW1iZXIgb2YgY29udHJvbCBz
dGVwcy4NCisgKi8NCisjZGVmaW5lIERXOTc2OF9NT1ZFX1NURVBTCQkJMTYNCisNCisvKg0KKyAq
IERXOTc2OF9BQUNfUFJFU0NfUkVHICYgRFc5NzY4X0FBQ19USU1FX1JFRyBkZXRlcm1pbmUgVkNN
IG9wZXJhdGlvbiB0aW1lLg0KKyAqIElmIERXOTc2OF9BQUNfUFJFU0NfUkVHIGlzIDB4NDEsIGFu
ZCBEVzk3NjhfQUFDX1RJTUVfUkVHIGlzIDB4MzksIFZDTSBtb2RlDQorICogd291bGQgYmUgQUFD
MywgT3BlcmF0aW9uIFRpbWUgd291bGQgYmUgMC43MHhUdmliLCB0aGF0IGlzIDguNDBtcy4NCisg
Ki8NCisjZGVmaW5lIERXOTc2OF9NT1ZFX0RFTEFZX1VTCQkJODQwMA0KKyNkZWZpbmUgRFc5NzY4
X1NUQUJMRV9USU1FX1VTCQkJMjAwMDANCisNCitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGR3
OTc2OF9zdXBwbHlfbmFtZXNbXSA9IHsNCisJInZpbiIsCS8qIEkyQyBJL08gaW50ZXJmYWNlIHBv
d2VyICovDQorCSJ2ZGQiLAkvKiBWQ00gcG93ZXIgKi8NCit9Ow0KKw0KKy8qIGR3OTc2OCBkZXZp
Y2Ugc3RydWN0dXJlICovDQorc3RydWN0IGR3OTc2OCB7DQorCXN0cnVjdCByZWd1bGF0b3JfYnVs
a19kYXRhIHN1cHBsaWVzW0FSUkFZX1NJWkUoZHc5NzY4X3N1cHBseV9uYW1lcyldOw0KKwlzdHJ1
Y3QgdjRsMl9jdHJsX2hhbmRsZXIgY3RybHM7DQorCXN0cnVjdCB2NGwyX2N0cmwgKmZvY3VzOw0K
KwlzdHJ1Y3QgdjRsMl9zdWJkZXYgc2Q7DQorfTsNCisNCitzdGF0aWMgaW5saW5lIHN0cnVjdCBk
dzk3NjggKnRvX2R3OTc2OChzdHJ1Y3QgdjRsMl9jdHJsICpjdHJsKQ0KK3sNCisJcmV0dXJuIGNv
bnRhaW5lcl9vZihjdHJsLT5oYW5kbGVyLCBzdHJ1Y3QgZHc5NzY4LCBjdHJscyk7DQorfQ0KKw0K
K3N0YXRpYyBpbmxpbmUgc3RydWN0IGR3OTc2OCAqc2RfdG9fZHc5NzY4KHN0cnVjdCB2NGwyX3N1
YmRldiAqc3ViZGV2KQ0KK3sNCisJcmV0dXJuIGNvbnRhaW5lcl9vZihzdWJkZXYsIHN0cnVjdCBk
dzk3NjgsIHNkKTsNCit9DQorDQorc3RydWN0IHJlZ3ZhbF9saXN0IHsNCisJdTggcmVnX251bTsN
CisJdTggdmFsdWU7DQorfTsNCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ3ZhbF9saXN0IGR3
OTc2OF9pbml0X3JlZ3NbXSA9IHsNCisJe0RXOTc2OF9SSU5HX1BEX0NPTlRST0xfUkVHLCBEVzk3
NjhfQUFDX01PREVfRU59LA0KKwl7RFc5NzY4X0FBQ19QUkVTQ19SRUcsIERXOTc2OF9BQUMzX1NF
TEVDVF9ESVZJRElOR19SQVRFXzF9LA0KKwl7RFc5NzY4X0FBQ19USU1FX1JFRywgRFc5NzY4X0FB
Q1RfQ05UfSwNCit9Ow0KKw0KK3N0YXRpYyBpbnQgZHc5NzY4X3dyaXRlX2FycmF5KHN0cnVjdCBk
dzk3NjggKmR3OTc2OCwNCisJCQkgICAgICBjb25zdCBzdHJ1Y3QgcmVndmFsX2xpc3QgKnZhbHMs
IHNpemVfdCBsZW4pDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRf
c3ViZGV2ZGF0YSgmZHc5NzY4LT5zZCk7DQorCXVuc2lnbmVkIGludCBpOw0KKwlpbnQgcmV0Ow0K
Kw0KKwlmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsNCisJCXJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEoY2xpZW50LCB2YWxzW2ldLnJlZ19udW0sDQorCQkJCQkJdmFsc1tpXS52YWx1
ZSk7DQorCQlpZiAocmV0IDwgMCkNCisJCQlyZXR1cm4gcmV0Ow0KKwl9DQorCXJldHVybiAwOw0K
K30NCisNCitzdGF0aWMgaW50IGR3OTc2OF9zZXRfZGFjKHN0cnVjdCBkdzk3NjggKmR3OTc2OCwg
dTE2IHZhbCkNCit7DQorCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSB2NGwyX2dldF9zdWJk
ZXZkYXRhKCZkdzk3NjgtPnNkKTsNCisNCisJLyogV3JpdGUgVkNNIHBvc2l0aW9uIHRvIHJlZ2lz
dGVycyAqLw0KKwlyZXR1cm4gaTJjX3NtYnVzX3dyaXRlX3dvcmRfc3dhcHBlZChjbGllbnQsIERX
OTc2OF9NU0JfQUREUiwgdmFsKTsNCit9DQorDQorc3RhdGljIGludCBkdzk3NjhfaW5pdChzdHJ1
Y3QgZHc5NzY4ICpkdzk3NjgpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRs
Ml9nZXRfc3ViZGV2ZGF0YSgmZHc5NzY4LT5zZCk7DQorCWludCByZXQsIHZhbDsNCisNCisJLyog
UmVzZXQgRFc5NzY4X1JJTkdfUERfQ09OVFJPTF9SRUcgdG8gZGVmYXVsdCBzdGF0dXMgMHgwMCAq
Lw0KKwlyZXQgPSBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgRFc5NzY4X1JJTkdf
UERfQ09OVFJPTF9SRUcsDQorCQkJCQlEVzk3NjhfUERfTU9ERV9PRkYpOw0KKwlpZiAocmV0IDwg
MCkNCisJCXJldHVybiByZXQ7DQorDQorCS8qDQorCSAqIERXOTc2OSByZXF1aXJlcyB3YWl0aW5n
IGRlbGF5IHRpbWUgb2YgdF9PUFINCisJICogYWZ0ZXIgUEQgcmVzZXQgdGFrZXMgcGxhY2UuDQor
CSAqLw0KKwl1c2xlZXBfcmFuZ2UoRFc5NzY4X1RfT1BSX1VTLCBEVzk3NjhfVF9PUFJfVVMgKyAx
MDApOw0KKw0KKwlyZXQgPSBkdzk3Njhfd3JpdGVfYXJyYXkoZHc5NzY4LCBkdzk3NjhfaW5pdF9y
ZWdzLA0KKwkJCQkgQVJSQVlfU0laRShkdzk3NjhfaW5pdF9yZWdzKSk7DQorCWlmIChyZXQpDQor
CQlyZXR1cm4gcmV0Ow0KKw0KKwlmb3IgKHZhbCA9IGR3OTc2OC0+Zm9jdXMtPnZhbCAlIERXOTc2
OF9NT1ZFX1NURVBTOw0KKwkgICAgIHZhbCA8PSBkdzk3NjgtPmZvY3VzLT52YWw7DQorCSAgICAg
dmFsICs9IERXOTc2OF9NT1ZFX1NURVBTKSB7DQorCQlyZXQgPSBkdzk3Njhfc2V0X2RhYyhkdzk3
NjgsIHZhbCk7DQorCQlpZiAocmV0KSB7DQorCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICIlcyBJ
MkMgZmFpbHVyZTogJWQiLA0KKwkJCQlfX2Z1bmNfXywgcmV0KTsNCisJCQlyZXR1cm4gcmV0Ow0K
KwkJfQ0KKwkJdXNsZWVwX3JhbmdlKERXOTc2OF9NT1ZFX0RFTEFZX1VTLA0KKwkJCSAgICAgRFc5
NzY4X01PVkVfREVMQVlfVVMgKyAxMDAwKTsNCisJfQ0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQor
c3RhdGljIGludCBkdzk3NjhfcmVsZWFzZShzdHJ1Y3QgZHc5NzY4ICpkdzk3NjgpDQorew0KKwlz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0YSgmZHc5NzY4LT5z
ZCk7DQorCWludCByZXQsIHZhbDsNCisNCisJdmFsID0gcm91bmRfZG93bihkdzk3NjgtPmZvY3Vz
LT52YWwsIERXOTc2OF9NT1ZFX1NURVBTKTsNCisJZm9yICggOyB2YWwgPj0gMDsgdmFsIC09IERX
OTc2OF9NT1ZFX1NURVBTKSB7DQorCQlyZXQgPSBkdzk3Njhfc2V0X2RhYyhkdzk3NjgsIHZhbCk7
DQorCQlpZiAocmV0KSB7DQorCQkJZGV2X2VycigmY2xpZW50LT5kZXYsICJJMkMgd3JpdGUgZmFp
bDogJWQiLCByZXQpOw0KKwkJCXJldHVybiByZXQ7DQorCQl9DQorCQl1c2xlZXBfcmFuZ2UoRFc5
NzY4X01PVkVfREVMQVlfVVMsIERXOTc2OF9NT1ZFX0RFTEFZX1VTICsgMTAwMCk7DQorCX0NCisN
CisJLyoNCisJICogV2FpdCBmb3IgdGhlIG1vdG9yIHRvIHN0YWJpbGl6ZSBhZnRlciB0aGUgbGFz
dCBtb3ZlbWVudA0KKwkgKiB0byBwcmV2ZW50IHRoZSBtb3RvciBmcm9tIHNoYWtpbmcuDQorCSAq
Lw0KKwl1c2xlZXBfcmFuZ2UoRFc5NzY4X1NUQUJMRV9USU1FX1VTIC0gRFc5NzY4X01PVkVfREVM
QVlfVVMsDQorCQkgICAgIERXOTc2OF9TVEFCTEVfVElNRV9VUyAtIERXOTc2OF9NT1ZFX0RFTEFZ
X1VTICsgMTAwMCk7DQorDQorCXJldCA9IGkyY19zbWJ1c193cml0ZV9ieXRlX2RhdGEoY2xpZW50
LCBEVzk3NjhfUklOR19QRF9DT05UUk9MX1JFRywNCisJCQkJCURXOTc2OF9QRF9NT0RFX0VOKTsN
CisJaWYgKHJldCA8IDApDQorCQlyZXR1cm4gcmV0Ow0KKw0KKwkvKg0KKwkgKiBEVzk3NjkgcmVx
dWlyZXMgd2FpdGluZyBkZWxheSB0aW1lIG9mIHRfT1BSDQorCSAqIGFmdGVyIFBEIHJlc2V0IHRh
a2VzIHBsYWNlLg0KKwkgKi8NCisJdXNsZWVwX3JhbmdlKERXOTc2OF9UX09QUl9VUywgRFc5NzY4
X1RfT1BSX1VTICsgMTAwKTsNCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgX19t
YXliZV91bnVzZWQgZHc5NzY4X3J1bnRpbWVfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQor
ew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdG9faTJjX2NsaWVudChkZXYpOw0KKwlz
dHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7DQorCXN0
cnVjdCBkdzk3NjggKmR3OTc2OCA9IHNkX3RvX2R3OTc2OChzZCk7DQorDQorCWR3OTc2OF9yZWxl
YXNlKGR3OTc2OCk7DQorCXJlZ3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShkdzk3Njhf
c3VwcGx5X25hbWVzKSwNCisJCQkgICAgICAgZHc5NzY4LT5zdXBwbGllcyk7DQorDQorCXJldHVy
biAwOw0KK30NCisNCitzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGR3OTc2OF9ydW50aW1lX3Jl
c3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQorew0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50
ID0gdG9faTJjX2NsaWVudChkZXYpOw0KKwlzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0gaTJjX2dl
dF9jbGllbnRkYXRhKGNsaWVudCk7DQorCXN0cnVjdCBkdzk3NjggKmR3OTc2OCA9IHNkX3RvX2R3
OTc2OChzZCk7DQorCWludCByZXQ7DQorDQorCXJldCA9IHJlZ3VsYXRvcl9idWxrX2VuYWJsZShB
UlJBWV9TSVpFKGR3OTc2OF9zdXBwbHlfbmFtZXMpLA0KKwkJCQkgICAgZHc5NzY4LT5zdXBwbGll
cyk7DQorCWlmIChyZXQgPCAwKSB7DQorCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUg
cmVndWxhdG9yc1xuIik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCS8qDQorCSAqIFRoZSBk
YXRhc2hlZXQgcmVmZXJzIHRvIHRfT1BSIHRoYXQgbmVlZHMgdG8gYmUgd2FpdGVkIGJlZm9yZSBz
ZW5kaW5nDQorCSAqIEkyQyBjb21tYW5kcyBhZnRlciBwb3dlci11cC4NCisJICovDQorCXVzbGVl
cF9yYW5nZShEVzk3NjhfVF9PUFJfVVMsIERXOTc2OF9UX09QUl9VUyArIDEwMCk7DQorDQorCXJl
dCA9IGR3OTc2OF9pbml0KGR3OTc2OCk7DQorCWlmIChyZXQgPCAwKQ0KKwkJZ290byBkaXNhYmxl
X3JlZ3VsYXRvcjsNCisNCisJcmV0dXJuIDA7DQorDQorZGlzYWJsZV9yZWd1bGF0b3I6DQorCXJl
Z3VsYXRvcl9idWxrX2Rpc2FibGUoQVJSQVlfU0laRShkdzk3Njhfc3VwcGx5X25hbWVzKSwNCisJ
CQkgICAgICAgZHc5NzY4LT5zdXBwbGllcyk7DQorDQorCXJldHVybiByZXQ7DQorfQ0KKw0KK3N0
YXRpYyBpbnQgZHc5NzY4X3NldF9jdHJsKHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpDQorew0KKwlz
dHJ1Y3QgZHc5NzY4ICpkdzk3NjggPSB0b19kdzk3NjgoY3RybCk7DQorDQorCWlmIChjdHJsLT5p
ZCA9PSBWNEwyX0NJRF9GT0NVU19BQlNPTFVURSkNCisJCXJldHVybiBkdzk3Njhfc2V0X2RhYyhk
dzk3NjgsIGN0cmwtPnZhbCk7DQorDQorCXJldHVybiAwOw0KK30NCisNCitzdGF0aWMgY29uc3Qg
c3RydWN0IHY0bDJfY3RybF9vcHMgZHc5NzY4X2N0cmxfb3BzID0gew0KKwkuc19jdHJsID0gZHc5
NzY4X3NldF9jdHJsLA0KK307DQorDQorc3RhdGljIGludCBkdzk3Njhfb3BlbihzdHJ1Y3QgdjRs
Ml9zdWJkZXYgKnNkLCBzdHJ1Y3QgdjRsMl9zdWJkZXZfZmggKmZoKQ0KK3sNCisJaW50IHJldDsN
CisNCisJcmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhzZC0+ZGV2KTsNCisJaWYgKHJldCA8IDAp
IHsNCisJCXBtX3J1bnRpbWVfcHV0X25vaWRsZShzZC0+ZGV2KTsNCisJCXJldHVybiByZXQ7DQor
CX0NCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBpbnQgZHc5NzY4X2Nsb3NlKHN0cnVj
dCB2NGwyX3N1YmRldiAqc2QsIHN0cnVjdCB2NGwyX3N1YmRldl9maCAqZmgpDQorew0KKwlwbV9y
dW50aW1lX3B1dChzZC0+ZGV2KTsNCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgdjRsMl9zdWJkZXZfaW50ZXJuYWxfb3BzIGR3OTc2OF9pbnRfb3BzID0gew0KKwku
b3BlbiA9IGR3OTc2OF9vcGVuLA0KKwkuY2xvc2UgPSBkdzk3NjhfY2xvc2UsDQorfTsNCisNCitz
dGF0aWMgY29uc3Qgc3RydWN0IHY0bDJfc3ViZGV2X29wcyBkdzk3Njhfb3BzID0geyB9Ow0KKw0K
K3N0YXRpYyBpbnQgZHc5NzY4X2luaXRfY29udHJvbHMoc3RydWN0IGR3OTc2OCAqZHc5NzY4KQ0K
K3sNCisJc3RydWN0IHY0bDJfY3RybF9oYW5kbGVyICpoZGwgPSAmZHc5NzY4LT5jdHJsczsNCisJ
Y29uc3Qgc3RydWN0IHY0bDJfY3RybF9vcHMgKm9wcyA9ICZkdzk3NjhfY3RybF9vcHM7DQorDQor
CXY0bDJfY3RybF9oYW5kbGVyX2luaXQoaGRsLCAxKTsNCisNCisJZHc5NzY4LT5mb2N1cyA9IHY0
bDJfY3RybF9uZXdfc3RkKGhkbCwgb3BzLCBWNEwyX0NJRF9GT0NVU19BQlNPTFVURSwgMCwNCisJ
CQkJCSAgRFc5NzY4X01BWF9GT0NVU19QT1MsDQorCQkJCQkgIERXOTc2OF9GT0NVU19TVEVQUywg
MCk7DQorDQorCWlmIChoZGwtPmVycm9yKQ0KKwkJcmV0dXJuIGhkbC0+ZXJyb3I7DQorDQorCWR3
OTc2OC0+c2QuY3RybF9oYW5kbGVyID0gaGRsOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3Rh
dGljIGludCBkdzk3NjhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkNCit7DQorCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZjbGllbnQtPmRldjsNCisJc3RydWN0IGR3OTc2OCAqZHc5NzY4
Ow0KKwl1bnNpZ25lZCBpbnQgaTsNCisJaW50IHJldDsNCisNCisJZHc5NzY4ID0gZGV2bV9remFs
bG9jKGRldiwgc2l6ZW9mKCpkdzk3NjgpLCBHRlBfS0VSTkVMKTsNCisJaWYgKCFkdzk3NjgpDQor
CQlyZXR1cm4gLUVOT01FTTsNCisNCisJdjRsMl9pMmNfc3ViZGV2X2luaXQoJmR3OTc2OC0+c2Qs
IGNsaWVudCwgJmR3OTc2OF9vcHMpOw0KKw0KKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShk
dzk3Njhfc3VwcGx5X25hbWVzKTsgaSsrKQ0KKwkJZHc5NzY4LT5zdXBwbGllc1tpXS5zdXBwbHkg
PSBkdzk3Njhfc3VwcGx5X25hbWVzW2ldOw0KKw0KKwlyZXQgPSBkZXZtX3JlZ3VsYXRvcl9idWxr
X2dldChkZXYsIEFSUkFZX1NJWkUoZHc5NzY4X3N1cHBseV9uYW1lcyksDQorCQkJCSAgICAgIGR3
OTc2OC0+c3VwcGxpZXMpOw0KKwlpZiAocmV0KSB7DQorCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0
byBnZXQgcmVndWxhdG9yc1xuIik7DQorCQlyZXR1cm4gcmV0Ow0KKwl9DQorDQorCXJldCA9IGR3
OTc2OF9pbml0X2NvbnRyb2xzKGR3OTc2OCk7DQorCWlmIChyZXQpDQorCQlnb3RvIGVudGl0eV9j
bGVhbnVwOw0KKw0KKwlkdzk3NjgtPnNkLmZsYWdzIHw9IFY0TDJfU1VCREVWX0ZMX0hBU19ERVZO
T0RFOw0KKwlkdzk3NjgtPnNkLmludGVybmFsX29wcyA9ICZkdzk3NjhfaW50X29wczsNCisNCisJ
cmV0ID0gbWVkaWFfZW50aXR5X3BhZHNfaW5pdCgmZHc5NzY4LT5zZC5lbnRpdHksIDAsIE5VTEwp
Ow0KKwlpZiAocmV0IDwgMCkNCisJCWdvdG8gZW50aXR5X2NsZWFudXA7DQorDQorCWR3OTc2OC0+
c2QuZW50aXR5LmZ1bmN0aW9uID0gTUVESUFfRU5UX0ZfTEVOUzsNCisNCisJcG1fcnVudGltZV9l
bmFibGUoZGV2KTsNCisJaWYgKCFwbV9ydW50aW1lX2VuYWJsZWQoZGV2KSkgew0KKwkJcmV0ID0g
ZHc5NzY4X3J1bnRpbWVfcmVzdW1lKGRldik7DQorCQlpZiAocmV0IDwgMCkgew0KKwkJCWRldl9l
cnIoZGV2LCAiZmFpbGVkIHRvIHBvd2VyIG9uOiAlZFxuIiwgcmV0KTsNCisJCQlnb3RvIGVudGl0
eV9jbGVhbnVwOw0KKwkJfQ0KKwl9DQorDQorCXJldCA9IHY0bDJfYXN5bmNfcmVnaXN0ZXJfc3Vi
ZGV2KCZkdzk3NjgtPnNkKTsNCisJaWYgKHJldCA8IDApDQorCQlnb3RvIGVudGl0eV9jbGVhbnVw
Ow0KKw0KKwlyZXR1cm4gMDsNCisNCitlbnRpdHlfY2xlYW51cDoNCisJdjRsMl9jdHJsX2hhbmRs
ZXJfZnJlZSgmZHc5NzY4LT5jdHJscyk7DQorCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZkdzk3Njgt
PnNkLmVudGl0eSk7DQorCXJldHVybiByZXQ7DQorfQ0KKw0KK3N0YXRpYyBpbnQgZHc5NzY4X3Jl
bW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KK3sNCisJc3RydWN0IHY0bDJfc3ViZGV2
ICpzZCA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOw0KKwlzdHJ1Y3QgZHc5NzY4ICpkdzk3
NjggPSBzZF90b19kdzk3Njgoc2QpOw0KKw0KKwlwbV9ydW50aW1lX2Rpc2FibGUoJmNsaWVudC0+
ZGV2KTsNCisJdjRsMl9hc3luY191bnJlZ2lzdGVyX3N1YmRldigmZHc5NzY4LT5zZCk7DQorCXY0
bDJfY3RybF9oYW5kbGVyX2ZyZWUoJmR3OTc2OC0+Y3RybHMpOw0KKwltZWRpYV9lbnRpdHlfY2xl
YW51cCgmZHc5NzY4LT5zZC5lbnRpdHkpOw0KKwlpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3Bl
bmRlZCgmY2xpZW50LT5kZXYpKQ0KKwkJZHc5NzY4X3J1bnRpbWVfc3VzcGVuZCgmY2xpZW50LT5k
ZXYpOw0KKwlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJmNsaWVudC0+ZGV2KTsNCisNCisJcmV0
dXJuIDA7DQorfQ0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3OTc2OF9v
Zl90YWJsZVtdID0gew0KKwl7IC5jb21wYXRpYmxlID0gImRvbmd3b29uLGR3OTc2OCIgfSwNCisJ
e30NCit9Ow0KK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIGR3OTc2OF9vZl90YWJsZSk7DQorDQor
c3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGR3OTc2OF9wbV9vcHMgPSB7DQorCVNFVF9T
WVNURU1fU0xFRVBfUE1fT1BTKHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCwNCisJCQkJcG1fcnVu
dGltZV9mb3JjZV9yZXN1bWUpDQorCVNFVF9SVU5USU1FX1BNX09QUyhkdzk3NjhfcnVudGltZV9z
dXNwZW5kLCBkdzk3NjhfcnVudGltZV9yZXN1bWUsIE5VTEwpDQorfTsNCisNCitzdGF0aWMgc3Ry
dWN0IGkyY19kcml2ZXIgZHc5NzY4X2kyY19kcml2ZXIgPSB7DQorCS5kcml2ZXIgPSB7DQorCQku
bmFtZSA9IERXOTc2OF9OQU1FLA0KKwkJLnBtID0gJmR3OTc2OF9wbV9vcHMsDQorCQkub2ZfbWF0
Y2hfdGFibGUgPSBkdzk3Njhfb2ZfdGFibGUsDQorCX0sDQorCS5wcm9iZV9uZXcgID0gZHc5NzY4
X3Byb2JlLA0KKwkucmVtb3ZlID0gZHc5NzY4X3JlbW92ZSwNCit9Ow0KK21vZHVsZV9pMmNfZHJp
dmVyKGR3OTc2OF9pMmNfZHJpdmVyKTsNCisNCitNT0RVTEVfQVVUSE9SKCJEb25nY2h1biBaaHUg
PGRvbmdjaHVuLnpodUBtZWRpYXRlay5jb20+Iik7DQorTU9EVUxFX0RFU0NSSVBUSU9OKCJEVzk3
NjggVkNNIGRyaXZlciIpOw0KK01PRFVMRV9MSUNFTlNFKCJHUEwgdjIiKTsNCi0tIA0KMi45LjIN
Cg==

