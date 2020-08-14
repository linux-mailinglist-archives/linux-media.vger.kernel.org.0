Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D447244597
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgHNHNJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:09 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:16565 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726116AbgHNHNI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:08 -0400
X-UUID: f3d5775591e54eec8f61fc3e395db69c-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kfcoPkQlXtcH4btxlp3G2PLUP3J4MUE9xMlPyLdDgFs=;
        b=DrzlcY4QU4oUJ+vczwhHAz5rIMy7EI2LqapwCJc2UC0+usg2s5rBwTJMqxKQGoR21DhR3J9Nd8Hzl0eNcFdVi2mTRQRZ590UkNcAqrly3mFKXXaJGD1c7nsVpkGxwIW3xSAGGN9mTMW6ZUPFDFAt72c29Sb/iqzHxW25Y6ABIsE=;
X-UUID: f3d5775591e54eec8f61fc3e395db69c-20200814
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1001869483; Fri, 14 Aug 2020 15:13:05 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:01 +0800
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
Subject: [PATCH v12 00/29] Add support for mt2701 JPEG ENC support
Date:   Fri, 14 Aug 2020 15:11:33 +0800
Message-ID: <20200814071202.25067-2-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhpcyBwYXRjaHNldCBhZGQgc3VwcG9ydCBmb3IgbXQyNzAxIEpQRUcgRU5DIHN1cHBvcnQuICAg
ICAgDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANClRoaXMgaXMgdGhlIGNvbXBsaWFuY2UgdGVzdCByZXN1bHQgZm9yIGpwZWcgZGVj
IGFuZCBlbmMuICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgDQpUaGUgSlBFRyBkZWMgbG9nOiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KdjRsMi1jb21wbGlhbmNlIC1kIC9kZXYvdmlk
ZW8wDQp2NGwyLWNvbXBsaWFuY2UgU0hBOiA3OGU0YjI5M2Y2NTRkZjFmMjczYmJjNmIxMjEzNTEx
ZjUzYTJhNDY1LCAzMiBiaXRzLCAzMi1iaXQgdGltZV90DQoNCkNvbXBsaWFuY2UgdGVzdCBmb3Ig
bXRrLWpwZWctZGVjIGRldmljZSAvZGV2L3ZpZGVvMDoNCg0KRHJpdmVyIEluZm86DQogICAgICAg
IERyaXZlciBuYW1lICAgICAgOiBtdGstanBlZy1kZWMNCiAgICAgICAgQ2FyZCB0eXBlICAgICAg
ICA6IG10ay1qcGVnLWRlYw0KICAgICAgICBCdXMgaW5mbyAgICAgICAgIDogcGxhdGZvcm06MTUw
MDQwMDAuanBlZ2RlYw0KICAgICAgICBEcml2ZXIgdmVyc2lvbiAgIDogNS44LjANCiAgICAgICAg
Q2FwYWJpbGl0aWVzICAgICA6IDB4ODQyMDQwMDANCiAgICAgICAgICAgICAgICBWaWRlbyBNZW1v
cnktdG8tTWVtb3J5IE11bHRpcGxhbmFyDQogICAgICAgICAgICAgICAgU3RyZWFtaW5nDQogICAg
ICAgICAgICAgICAgRXh0ZW5kZWQgUGl4IEZvcm1hdA0KICAgICAgICAgICAgICAgIERldmljZSBD
YXBhYmlsaXRpZXMNCiAgICAgICAgRGV2aWNlIENhcHMgICAgICA6IDB4MDQyMDQwMDANCiAgICAg
ICAgICAgICAgICBWaWRlbyBNZW1vcnktdG8tTWVtb3J5IE11bHRpcGxhbmFyDQogICAgICAgICAg
ICAgICAgU3RyZWFtaW5nDQogICAgICAgICAgICAgICAgRXh0ZW5kZWQgUGl4IEZvcm1hdA0KICAg
ICAgICBEZXRlY3RlZCBKUEVHIERlY29kZXINCg0KUmVxdWlyZWQgaW9jdGxzOg0KICAgICAgICB0
ZXN0IFZJRElPQ19RVUVSWUNBUDogT0sNCg0KQWxsb3cgZm9yIG11bHRpcGxlIG9wZW5zOg0KICAg
ICAgICB0ZXN0IHNlY29uZCAvZGV2L3ZpZGVvMCBvcGVuOiBPSw0KICAgICAgICB0ZXN0IFZJRElP
Q19RVUVSWUNBUDogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX1BSSU9SSVRZOiBPSw0KICAg
ICAgICB0ZXN0IGZvciB1bmxpbWl0ZWQgb3BlbnM6IE9LDQoNCiAgICAgICAgdGVzdCBpbnZhbGlk
IGlvY3RsczogT0sNCkRlYnVnIGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfREJHX0cvU19S
RUdJU1RFUjogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0xPR19TVEFU
VVM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KDQpJbnB1dCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklE
SU9DX0cvU19UVU5FUi9FTlVNX0ZSRVFfQkFORFM6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAg
ICB0ZXN0IFZJRElPQ19HL1NfRlJFUVVFTkNZOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAg
dGVzdCBWSURJT0NfU19IV19GUkVRX1NFRUs6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0
ZXN0IFZJRElPQ19FTlVNQVVESU86IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJ
RElPQ19HL1MvRU5VTUlOUFVUOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJ
T0NfRy9TX0FVRElPOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgSW5wdXRzOiAwIEF1ZGlv
IElucHV0czogMCBUdW5lcnM6IDANCg0KT3V0cHV0IGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJ
T0NfRy9TX01PRFVMQVRPUjogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9D
X0cvU19GUkVRVUVOQ1k6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19F
TlVNQVVET1VUOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TL0VO
VU1PVVRQVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfQVVE
T1VUOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgT3V0cHV0czogMCBBdWRpbyBPdXRwdXRz
OiAwIE1vZHVsYXRvcnM6IDANCg0KSW5wdXQvT3V0cHV0IGNvbmZpZ3VyYXRpb24gaW9jdGxzOg0K
ICAgICAgICB0ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVSWV9TVEQ6IE9LIChOb3QgU3VwcG9ydGVk
KQ0KICAgICAgICB0ZXN0IFZJRElPQ19FTlVNL0cvUy9RVUVSWV9EVl9USU1JTkdTOiBPSyAoTm90
IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRFZfVElNSU5HU19DQVA6IE9LIChOb3Qg
U3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfRURJRDogT0sgKE5vdCBTdXBwb3J0
ZWQpDQoNCkNvbnRyb2wgaW9jdGxzOg0KICAgICAgICB0ZXN0IFZJRElPQ19RVUVSWV9FWFRfQ1RS
TC9RVUVSWU1FTlU6IE9LDQogICAgICAgIHRlc3QgVklESU9DX1FVRVJZQ1RSTDogT0sNCiAgICAg
ICAgdGVzdCBWSURJT0NfRy9TX0NUUkw6IE9LDQogICAgICAgIHRlc3QgVklESU9DX0cvUy9UUllf
RVhUX0NUUkxTOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ18oVU4pU1VCU0NSSUJFX0VWRU5UL0RR
RVZFTlQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfSlBFR0NP
TVA6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICBTdGFuZGFyZCBDb250cm9sczogMCBQcml2
YXRlIENvbnRyb2xzOiAwDQoNCkZvcm1hdCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX0VO
VU1fRk1UL0ZSQU1FU0laRVMvRlJBTUVJTlRFUlZBTFM6IE9LDQogICAgICAgIHRlc3QgVklESU9D
X0cvU19QQVJNOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19GQlVG
OiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19GTVQ6IE9LDQogICAg
ICAgIHRlc3QgVklESU9DX1RSWV9GTVQ6IE9LDQogICAgICAgIHRlc3QgVklESU9DX1NfRk1UOiBP
Sw0KICAgICAgICB0ZXN0IFZJRElPQ19HX1NMSUNFRF9WQklfQ0FQOiBPSyAoTm90IFN1cHBvcnRl
ZCkNCiAgICAgICAgdGVzdCBDcm9wcGluZzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRl
c3QgQ29tcG9zaW5nOiBPSw0KICAgICAgICB0ZXN0IFNjYWxpbmc6IE9LIChOb3QgU3VwcG9ydGVk
KQ0KDQpDb2RlYyBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DXyhUUllfKUVOQ09ERVJfQ01E
OiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19FTkNfSU5ERVg6IE9L
IChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ18oVFJZXylERUNPREVSX0NNRDog
T0sgKE5vdCBTdXBwb3J0ZWQpDQoNCkJ1ZmZlciBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9D
X1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllCVUY6IE9LDQogICAgICAgIHRlc3QgVklESU9DX0VY
UEJVRjogT0sNCiAgICAgICAgdGVzdCBSZXF1ZXN0czogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNClRv
dGFsIGZvciBtdGstanBlZy1kZWMgZGV2aWNlIC9kZXYvdmlkZW8wOiA0NSwgU3VjY2VlZGVkOiA0
NSwgRmFpbGVkOiAwLCBXYXJuaW5nczogMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANClRoZSBKUEVHIGVuYyBsb2c6ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCnY0bDIt
Y29tcGxpYW5jZSAtZCAvZGV2L3ZpZGVvMQ0KdjRsMi1jb21wbGlhbmNlIFNIQTogNzhlNGIyOTNm
NjU0ZGYxZjI3M2JiYzZiMTIxMzUxMWY1M2EyYTQ2NSwgMzIgYml0cywgMzItYml0IHRpbWVfdA0K
DQpDb21wbGlhbmNlIHRlc3QgZm9yIG10ay1qcGVnLWVuYyBkZXZpY2UgL2Rldi92aWRlbzE6DQoN
CkRyaXZlciBJbmZvOg0KICAgICAgICBEcml2ZXIgbmFtZSAgICAgIDogbXRrLWpwZWctZW5jDQog
ICAgICAgIENhcmQgdHlwZSAgICAgICAgOiBtdGstanBlZy1lbmMNCiAgICAgICAgQnVzIGluZm8g
ICAgICAgICA6IHBsYXRmb3JtOjE1MDBhMDAwLmpwZWdlbmMNCiAgICAgICAgRHJpdmVyIHZlcnNp
b24gICA6IDUuOC4wDQogICAgICAgIENhcGFiaWxpdGllcyAgICAgOiAweDg0MjA0MDAwDQogICAg
ICAgICAgICAgICAgVmlkZW8gTWVtb3J5LXRvLU1lbW9yeSBNdWx0aXBsYW5hcg0KICAgICAgICAg
ICAgICAgIFN0cmVhbWluZw0KICAgICAgICAgICAgICAgIEV4dGVuZGVkIFBpeCBGb3JtYXQNCiAg
ICAgICAgICAgICAgICBEZXZpY2UgQ2FwYWJpbGl0aWVzDQogICAgICAgIERldmljZSBDYXBzICAg
ICAgOiAweDA0MjA0MDAwDQogICAgICAgICAgICAgICAgVmlkZW8gTWVtb3J5LXRvLU1lbW9yeSBN
dWx0aXBsYW5hcg0KICAgICAgICAgICAgICAgIFN0cmVhbWluZw0KICAgICAgICAgICAgICAgIEV4
dGVuZGVkIFBpeCBGb3JtYXQNCiAgICAgICAgRGV0ZWN0ZWQgSlBFRyBFbmNvZGVyDQoNClJlcXVp
cmVkIGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfUVVFUllDQVA6IE9LDQoNCkFsbG93IGZv
ciBtdWx0aXBsZSBvcGVuczoNCiAgICAgICAgdGVzdCBzZWNvbmQgL2Rldi92aWRlbzEgb3Blbjog
T0sNCiAgICAgICAgdGVzdCBWSURJT0NfUVVFUllDQVA6IE9LDQogICAgICAgIHRlc3QgVklESU9D
X0cvU19QUklPUklUWTogT0sNCiAgICAgICAgdGVzdCBmb3IgdW5saW1pdGVkIG9wZW5zOiBPSw0K
DQogICAgICAgIHRlc3QgaW52YWxpZCBpb2N0bHM6IE9LDQpEZWJ1ZyBpb2N0bHM6DQogICAgICAg
IHRlc3QgVklESU9DX0RCR19HL1NfUkVHSVNURVI6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAg
ICB0ZXN0IFZJRElPQ19MT0dfU1RBVFVTOiBPSyAoTm90IFN1cHBvcnRlZCkNCg0KSW5wdXQgaW9j
dGxzOg0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfVFVORVIvRU5VTV9GUkVRX0JBTkRTOiBPSyAo
Tm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0ZSRVFVRU5DWTogT0sgKE5v
dCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX1NfSFdfRlJFUV9TRUVLOiBPSyAoTm90
IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRU5VTUFVRElPOiBPSyAoTm90IFN1cHBv
cnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TL0VOVU1JTlBVVDogT0sgKE5vdCBTdXBwb3J0
ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19BVURJTzogT0sgKE5vdCBTdXBwb3J0ZWQpDQog
ICAgICAgIElucHV0czogMCBBdWRpbyBJbnB1dHM6IDAgVHVuZXJzOiAwDQoNCk91dHB1dCBpb2N0
bHM6DQogICAgICAgIHRlc3QgVklESU9DX0cvU19NT0RVTEFUT1I6IE9LIChOb3QgU3VwcG9ydGVk
KQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfRlJFUVVFTkNZOiBPSyAoTm90IFN1cHBvcnRlZCkN
CiAgICAgICAgdGVzdCBWSURJT0NfRU5VTUFVRE9VVDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAg
ICAgIHRlc3QgVklESU9DX0cvUy9FTlVNT1VUUFVUOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAg
ICAgdGVzdCBWSURJT0NfRy9TX0FVRE9VVDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIE91
dHB1dHM6IDAgQXVkaW8gT3V0cHV0czogMCBNb2R1bGF0b3JzOiAwDQoNCklucHV0L091dHB1dCBj
b25maWd1cmF0aW9uIGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfRU5VTS9HL1MvUVVFUllf
U1REOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRU5VTS9HL1MvUVVF
UllfRFZfVElNSU5HUzogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0RW
X1RJTUlOR1NfQ0FQOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9T
X0VESUQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KDQpDb250cm9sIGlvY3RsczoNCiAgICAgICAgdGVz
dCBWSURJT0NfUVVFUllfRVhUX0NUUkwvUVVFUllNRU5VOiBPSw0KICAgICAgICB0ZXN0IFZJRElP
Q19RVUVSWUNUUkw6IE9LDQogICAgICAgIHRlc3QgVklESU9DX0cvU19DVFJMOiBPSw0KICAgICAg
ICB0ZXN0IFZJRElPQ19HL1MvVFJZX0VYVF9DVFJMUzogT0sNCiAgICAgICAgdGVzdCBWSURJT0Nf
KFVOKVNVQlNDUklCRV9FVkVOVC9EUUVWRU5UOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ19HL1Nf
SlBFR0NPTVA6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICBTdGFuZGFyZCBDb250cm9sczog
NCBQcml2YXRlIENvbnRyb2xzOiAwDQoNCkZvcm1hdCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklE
SU9DX0VOVU1fRk1UL0ZSQU1FU0laRVMvRlJBTUVJTlRFUlZBTFM6IE9LDQogICAgICAgIHRlc3Qg
VklESU9DX0cvU19QQVJNOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0Nf
R19GQlVGOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19GTVQ6IE9L
DQogICAgICAgIHRlc3QgVklESU9DX1RSWV9GTVQ6IE9LDQogICAgICAgIHRlc3QgVklESU9DX1Nf
Rk1UOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ19HX1NMSUNFRF9WQklfQ0FQOiBPSyAoTm90IFN1
cHBvcnRlZCkNCiAgICAgICAgdGVzdCBDcm9wcGluZzogT0sNCiAgICAgICAgdGVzdCBDb21wb3Np
bmc6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFNjYWxpbmc6IE9LIChOb3QgU3Vw
cG9ydGVkKQ0KDQpDb2RlYyBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DXyhUUllfKUVOQ09E
RVJfQ01EOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfR19FTkNfSU5E
RVg6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ18oVFJZXylERUNPREVS
X0NNRDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCkJ1ZmZlciBpb2N0bHM6DQogICAgICAgIHRlc3Qg
VklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllCVUY6IE9LDQogICAgICAgIHRlc3QgVklE
SU9DX0VYUEJVRjogT0sNCiAgICAgICAgdGVzdCBSZXF1ZXN0czogT0sgKE5vdCBTdXBwb3J0ZWQp
DQoNClRvdGFsIGZvciBtdGstanBlZy1lbmMgZGV2aWNlIC9kZXYvdmlkZW8xOiA0NSwgU3VjY2Vl
ZGVkOiA0NSwgRmFpbGVkOiAwLCBXYXJuaW5nczogMA0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCkNoYW5nZSBjb21wYXJlZCB0
byB2MTE6ICAgICAgICAgICAgICAgICAgDQotIGFkZCB0aGUgcmVsaWVkIHBhdGNoKGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAxOTEyMDQxMjQ3MzIuMTA5MzItMi1K
ZXJyeS1DaC5jaGVuQG1lZGlhdGVrLmNvbS8pIHRvIHRoaXMgc2VyaWVzDQotIGZpeCB0aGUgY29t
cGlsZSB3YXJuaW5ncyBvZiBwYXRjaCAyOS8yOQ0KDQpQaS1Ic3VuIFNoaWggKDEpOg0KICBtZWRp
YTogdjRsMi1tZW0ybWVtOiBhZGQgdjRsMl9tMm1fc3VzcGVuZCwgdjRsMl9tMm1fcmVzdW1lDQoN
ClhpYSBKaWFuZyAoMjgpOg0KICBtZWRpYTogcGxhdGZvcm06IEltcHJvdmUgc3Vic2NyaWJlIGV2
ZW50IGZsb3cgZm9yIGJ1ZyBmaXhpbmcNCiAgbWVkaWE6IHBsYXRmb3JtOiBJbXByb3ZlIHF1ZXVl
IHNldCB1cCBmbG93IGZvciBidWcgZml4aW5nDQogIG1lZGlhOiBwbGF0Zm9ybTogSW1wcm92ZSBn
ZXR0aW5nIGFuZCByZXF1ZXN0aW5nIGlycSBmbG93IGZvciBidWcNCiAgICBmaXhpbmcNCiAgbWVk
aWE6IHBsYXRmb3JtOiBDaGFuZ2UgdGhlIGZpeGVkIGRldmljZSBub2RlIG51bWJlciB0byB1bmZp
eGVkIHZhbHVlDQogIG1lZGlhOiBwbGF0Zm9ybTogSW1wcm92ZSBwb3dlciBvbiBhbmQgcG93ZXIg
b2ZmIGZsb3cNCiAgbWVkaWE6IHBsYXRmb3JtOiBEZWxldGUgdGhlIHJlc2V0dGluZyBoYXJkd2Fy
ZSBmbG93IGluIHRoZSBzeXN0ZW0gUE0NCiAgICBvcHMNCiAgbWVkaWE6IHBsYXRmb3JtOiBJbXBy
b3ZlIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgc3lzdGVtIFBNIG9wcw0KICBtZWRpYTogcGxh
dGZvcm06IEFkZCBtZWNoYW5pc20gdG8gaGFuZGxlIGpwZWcgaGFyZHdhcmUncyBsb2NraW5nIHVw
DQogIG1lZGlhOiBwbGF0Zm9ybTogQ2FuY2VsIHRoZSBsYXN0IGZyYW1lIGhhbmRsaW5nIGZsb3cN
CiAgbWVkaWE6IHBsYXRmb3JtOiBEZWxldGUgemVyb2luZyB0aGUgcmVzZXJ2ZWQgZmllbGRzDQog
IG1lZGlhOiBwbGF0Zm9ybTogU3R5bGlzdGljIGNoYW5nZXMgZm9yIGltcHJvdmluZyBjb2RlIHF1
YWxpdHkNCiAgbWVkaWE6IHBsYXRmb3JtOiBVc2UgZ2VuZXJpYyByb3VuZGluZyBoZWxwZXJzDQog
IG1lZGlhOiBwbGF0Zm9ybTogQ2hhbmdlIE1US19KUEVHX0NPTVBfTUFYIG1hY3JvIGRlZmluaXRp
b24gbG9jYXRpb24NCiAgbWVkaWE6IHBsYXRmb3JtOiBEZWxldGUgcmVkdW5kYW50IGNvZGUgYW5k
IGFkZCBhbm5vdGF0aW9uIGZvciBhbiBlbnVtDQogIG1lZGlhOiBwbGF0Zm9ybTogRGVsZXRlIHZp
ZGlvY19zX3NlbGVjdGlvbiBpb2N0bCBvZiBqcGVnIGRlYw0KICBtZWRpYTogcGxhdGZvcm06IENo
YW5nZSB0aGUgbWF4aW11bSB3aWR0aCBhbmQgaGVpZ2h0IHN1cHBvcnRlZCBieSBKUEVHDQogICAg
ZGVjDQogIG1lZGlhOiBwbGF0Zm9ybTogUmVmYWN0b3IgbXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUo
KQ0KICBtZWRpYTogcGxhdGZvcm06IFJlZmFjdG9yIG10a19qcGVnX2ZpbmRfZm9ybWF0KCkNCiAg
bWVkaWE6IHBsYXRmb3JtOiBSZWRlZmluaXRpb24gb2YgbXRrX2pwZWdfcV9kYXRhIHN0cnVjdHVy
ZQ0KICBtZWRpYTogcGxhdGZvcm06IENoYW5nZSB0aGUgY29sb3JzcGFjZSBvZiBqcGVnIHRvIHRo
ZSBmaXhlZCB2YWx1ZQ0KICBtZWRpYTogcGxhdGZvcm06IFJlZmFjdG9yIG10a19qcGVnX3NldF9k
ZWZhdWx0X3BhcmFtcygpDQogIG1lZGlhOiBwbGF0Zm9ybTogQ2hhbmdlIHRoZSBjYWxsIGZ1bmN0
aW9ucyBvZiBnZXR0aW5nL2VuYWJsZS9kaXNhYmxlDQogICAgdGhlIGpwZWcncyBjbG9jaw0KICBt
ZWRpYTogZHQtYmluZGluZ3M6IEFkZCBqcGVnIGVuYyBkZXZpY2UgdHJlZSBub2RlIGRvY3VtZW50
DQogIGFybTogZHRzOiBtdDI3MDE6IEFkZCBqcGVnIGVuYyBkZXZpY2UgdHJlZSBub2RlDQogIG1l
ZGlhOiBwbGF0Zm9ybTogUmVuYW1lIGpwZWcgZGVjIGZpbGUgbmFtZQ0KICBtZWRpYTogcGxhdGZv
cm06IFJlbmFtZSBleGlzdGluZyBmdW5jdGlvbnMvZGVmaW5lcy92YXJpYWJsZXMNCiAgbWVkaWE6
IHBsYXRmb3JtOiBVc2luZyB0aGUgdmFyaWFudCBzdHJ1Y3R1cmUgdG8gY29udGFpbiB0aGUgdmFy
YWJpbGl0eQ0KICAgIGJldHdlZW4gZGVjIGFuZCBlbmMNCiAgbWVkaWE6IHBsYXRmb3JtOiBBZGQg
anBlZyBlbmMgZmVhdHVyZQ0KDQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZW5j
b2Rlci50eHQgIHwgIDM1ICsNCiBhcmNoL2FybS9ib290L2R0cy9tdDI3MDEuZHRzaSAgICAgICAg
ICAgICAgICAgfCAgMTMgKw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvTWFrZWZp
bGUgICAgICB8ICAgNSArLQ0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19j
b3JlLmMgICB8IDkzMCArKysrKysrKysrKystLS0tLS0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfY29yZS5oICAgfCAxMDYgKy0NCiAuLi4ve210a19qcGVnX2h3LmMgPT4g
bXRrX2pwZWdfZGVjX2h3LmN9ICAgICAgfCAgMTAgKy0NCiAuLi4ve210a19qcGVnX2h3LmggPT4g
bXRrX2pwZWdfZGVjX2h3Lmh9ICAgICAgfCAgMTIgKy0NCiAuLi57bXRrX2pwZWdfcGFyc2UuYyA9
PiBtdGtfanBlZ19kZWNfcGFyc2UuY30gfCAgIDIgKy0NCiAuLi57bXRrX2pwZWdfcGFyc2UuaCA9
PiBtdGtfanBlZ19kZWNfcGFyc2UuaH0gfCAgIDIgKy0NCiAuLi4ve210a19qcGVnX3JlZy5oID0+
IG10a19qcGVnX2RlY19yZWcuaH0gICAgfCAgMTkgKy0NCiAuLi4vbWVkaWEvcGxhdGZvcm0vbXRr
LWpwZWcvbXRrX2pwZWdfZW5jX2h3LmMgfCAxNTQgKysrDQogLi4uL21lZGlhL3BsYXRmb3JtL210
ay1qcGVnL210a19qcGVnX2VuY19ody5oIHwgIDkxICsrDQogZHJpdmVycy9tZWRpYS92NGwyLWNv
cmUvdjRsMi1tZW0ybWVtLmMgICAgICAgIHwgIDQxICsNCiBpbmNsdWRlL21lZGlhL3Y0bDItbWVt
Mm1lbS5oICAgICAgICAgICAgICAgICAgfCAgMjIgKw0KIDE0IGZpbGVzIGNoYW5nZWQsIDEwNTkg
aW5zZXJ0aW9ucygrKSwgMzgzIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVy
LnR4dA0KIHJlbmFtZSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL3ttdGtfanBlZ19o
dy5jID0+IG10a19qcGVnX2RlY19ody5jfSAoOTglKQ0KIHJlbmFtZSBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1qcGVnL3ttdGtfanBlZ19ody5oID0+IG10a19qcGVnX2RlY19ody5ofSAoOTEl
KQ0KIHJlbmFtZSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL3ttdGtfanBlZ19wYXJz
ZS5jID0+IG10a19qcGVnX2RlY19wYXJzZS5jfSAoOTglKQ0KIHJlbmFtZSBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1qcGVnL3ttdGtfanBlZ19wYXJzZS5oID0+IG10a19qcGVnX2RlY19wYXJz
ZS5ofSAoOTIlKQ0KIHJlbmFtZSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL3ttdGtf
anBlZ19yZWcuaCA9PiBtdGtfanBlZ19kZWNfcmVnLmh9ICg3NyUpDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBl
Z19lbmNfaHcuaA0KDQotLSANCjIuMTguMA0K

