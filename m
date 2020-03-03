Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B45176D84
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2020 04:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgCCDSx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Mar 2020 22:18:53 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:46738 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726910AbgCCDSx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Mar 2020 22:18:53 -0500
X-UUID: 3848e601389b4c439b4b7bbc89d2e7aa-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=tX5ZlBPnN+H9zqPEwz3p9EXFe3HV0cb5nDE9m2ebWQQ=;
        b=t5oEcNqt0sqqzUCUd6hHXZ/8BhoL7ywk+AJTg+jx+mmVYsmwUkqFdpVQkt/kDqEJaLbK1NZ9bP3R+2chaKcuDHHIB4O31MVNcsLGFB7q5eP2zvi2h6d/s3MwAqnuDRDDq6Xs/a/+8i6nZylL/yH83MqolR4SjWMkZGSswhUMm80=;
X-UUID: 3848e601389b4c439b4b7bbc89d2e7aa-20200303
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <ck.hu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 848565754; Tue, 03 Mar 2020 11:18:44 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 11:18:42 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 11:16:13 +0800
Message-ID: <1583205520.12858.13.camel@mtksdaap41>
Subject: Re: [PATCH v10 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
From:   CK Hu <ck.hu@mediatek.com>
To:     Matthias Brugger <mbrugger@suse.com>
CC:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <p.zabel@pengutronix.de>, <airlied@linux.ie>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <ulrich.hecht+renesas@gmail.com>,
        <laurent.pinchart@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        <rdunlap@infradead.org>, <dri-devel@lists.freedesktop.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        "Seiya Wang" <seiya.wang@mediatek.com>,
        <linux-clk@vger.kernel.org>,
        "Collabora Kernel ML" <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, <wens@csie.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <sean.wang@mediatek.com>, <frank-w@public-files.de>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        <linux-mediatek@lists.infradead.org>, <hsinyi@chromium.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Richard Fontana <rfontana@redhat.com>,
        <linux-kernel@vger.kernel.org>, <matthias.bgg@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 3 Mar 2020 11:18:40 +0800
In-Reply-To: <ed2722ab-8339-359b-8698-14c0b36d1f92@suse.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
         <20200227180858.1514157-4-enric.balletbo@collabora.com>
         <72d0e155-83f3-05c3-8f3f-e46f3860453d@suse.com>
         <ed2722ab-8339-359b-8698-14c0b36d1f92@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C72E52F7AE72402D1DB10659F83E362613CDEA184CB1CB79069EA94ABE0A8F992000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIE1hdHRoaWFzOg0KDQpPbiBUaHUsIDIwMjAtMDItMjcgYXQgMTk6MjIgKzAxMDAsIE1hdHRo
aWFzIEJydWdnZXIgd3JvdGU6DQo+IA0KPiBPbiAyNy8wMi8yMDIwIDE5OjIxLCBNYXR0aGlhcyBC
cnVnZ2VyIHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIDI3LzAyLzIwMjAgMTk6MDgsIEVucmlj
IEJhbGxldGJvIGkgU2VycmEgd3JvdGU6DQo+ID4+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1i
cnVnZ2VyQHN1c2UuY29tPg0KPiA+Pg0KPiA+PiBUaGVyZSBpcyBubyBzdHJvbmcgcmVhc29uIGZv
ciB0aGlzIHRvIHVzZSBDTEtfT0ZfREVDTEFSRSBpbnN0ZWFkIG9mDQo+ID4+IGJlaW5nIGEgcGxh
dGZvcm0gZHJpdmVyLiBQbHVzLCB0aGlzIGRyaXZlciBwcm92aWRlcyBjbG9ja3MgYnV0IGFsc28N
Cj4gPj4gYSBzaGFyZWQgcmVnaXN0ZXIgc3BhY2UgZm9yIHRoZSBtZWRpYXRlay1kcm0gYW5kIHRo
ZSBtZWRpYXRlay1tZHANCj4gPj4gZHJpdmVyLiBTbyBtb3ZlIHRvIGRyaXZlcnMvc29jL21lZGlh
dGVrIGFzIGEgcGxhdGZvcm0gZHJpdmVyLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0
aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1ieTogRW5y
aWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4NCj4gPj4g
LS0tDQo+ID4gDQo+ID4gcmVnYXJkaW5nIHRoZSBtZXJnZSBzdHJhdGVneSwgSSBwcm9wb3NlIHRo
YXQgQ0sgdGFrZXMgaXQgdGhyb3VnaCBoaXMgdHJlZSBhbmQNCj4gPiBwcm92aWRlcyBhIHN0YWJs
ZSBicmFuY2ggaW4gY2FzZSBJJ2xsIG5lZWQgdG8gcHV0IHNvbWUgcGF0Y2hlcyBvbiB0b3Agb2Yg
dGhlDQo+ID4gZHJpdmVycy9zb2MgcGFydC4NCj4gPiANCj4gDQo+IFNvcnJ5LCB0aGF0IHdhcyBt
ZWFudCBmb3IgNC81IG5vdCB0aGlzIHBhdGNoLg0KPiANCj4gPiBNYWtlcyBzZW5zZT8NCg0KVGhl
cmUgYXJlIG1hbnkgZGVwZW5kZW5jaWVzIGluIHRoaXMgc2VyaWVzLCBzbyBJIHdvdWxkIGxpa2Ug
dG8gYXBwbHkNCnRoaXMgc2VyaWVzIHRvIGEgdHJlZSB0b2dldGhlci4gSSB0aGluayBtbXN5cyBk
cml2ZXIgaXMgbWFqb3Igb2YgdGhpcw0Kc2VyaWVzLCBhbmQgdGhpcyBzZXJpZXMgZG9lcyBub3Qg
Y29uZmxpY3Qgd2l0aCBNZWRpYXRlayBEUk0gdHJlZSBub3csIHNvDQpJIHdvdWxkIGxpa2UgdG8g
YXBwbHkgdGhpcyBzZXJpZXMgdG8gc29jIHRyZWUuIEhvdyBkbyB5b3UgdGhpbms/DQoNClJlZ2Fy
ZHMsDQpDSw0KDQo+ID4gDQo+ID4gUmVnYXJkcywNCj4gPiBNYXR0aGlhcw0KPiA+IA0KPiA+Pg0K
PiA+PiBDaGFuZ2VzIGluIHYxMDoNCj4gPj4gLSBSZW5hbWVkIHRvIGJlIGdlbmVyaWMgbXRrLW1t
c3lzDQo+ID4+IC0gQWRkIGRyaXZlciBkYXRhIHN1cHBvcnQgdG8gYmUgYWJsZSB0byBzdXBwb3J0
IGRpZmVyZW50IFNvQ3MNCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2OToNCj4gPj4gLSBNb3ZlIG1t
c3lzIHRvIGRyaXZlcnMvc29jL21lZGlhdGVrIChDSykNCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2
ODoNCj4gPj4gLSBCZSBhIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGxpa2Ugb3RoZXIgbWVkaWF0
ZWsgbW1zeXMgZHJpdmVycy4NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2NzoNCj4gPj4gLSBGcmVl
IGNsa19kYXRhLT5jbGtzIGFzIHdlbGwNCj4gPj4gLSBHZXQgcmlkIG9mIHByaXZhdGUgZGF0YSBz
dHJ1Y3R1cmUNCj4gPj4NCj4gPj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYyB8
IDEwNCAtLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvS2Nv
bmZpZyAgICAgIHwgICA3ICsrDQo+ID4+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAg
ICAgfCAgIDEgKw0KPiA+PiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMgIHwgMTU0
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+PiAgNCBmaWxlcyBjaGFuZ2VkLCAx
NjIgaW5zZXJ0aW9ucygrKSwgMTA0IGRlbGV0aW9ucygtKQ0KPiA+PiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+ID4+DQo+ID4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMgYi9kcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXQ4MTczLmMNCj4gPj4gaW5kZXggNTM3YTdmNDliMGY3Li44Zjg5OGFjNDc2YzAg
MTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxNzMuYw0KPiA+
PiArKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTczLmMNCj4gPj4gQEAgLTc1Myw5
MyArNzUzLDYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSBpbWdfY2xrc1tdIF9faW5p
dGNvbnN0ID0gew0KPiA+PiAgCUdBVEVfSU1HKENMS19JTUdfRkQsICJpbWdfZmQiLCAibW1fc2Vs
IiwgMTEpLA0KPiA+PiAgfTsNCj4gPj4gIA0KPiA+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
Z2F0ZV9yZWdzIG1tMF9jZ19yZWdzIF9faW5pdGNvbnN0ID0gew0KPiA+PiAtCS5zZXRfb2ZzID0g
MHgwMTA0LA0KPiA+PiAtCS5jbHJfb2ZzID0gMHgwMTA4LA0KPiA+PiAtCS5zdGFfb2ZzID0gMHgw
MTAwLA0KPiA+PiAtfTsNCj4gPj4gLQ0KPiA+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0
ZV9yZWdzIG1tMV9jZ19yZWdzIF9faW5pdGNvbnN0ID0gew0KPiA+PiAtCS5zZXRfb2ZzID0gMHgw
MTE0LA0KPiA+PiAtCS5jbHJfb2ZzID0gMHgwMTE4LA0KPiA+PiAtCS5zdGFfb2ZzID0gMHgwMTEw
LA0KPiA+PiAtfTsNCj4gPj4gLQ0KPiA+PiAtI2RlZmluZSBHQVRFX01NMChfaWQsIF9uYW1lLCBf
cGFyZW50LCBfc2hpZnQpIHsJCQlcDQo+ID4+IC0JCS5pZCA9IF9pZCwJCQkJCVwNCj4gPj4gLQkJ
Lm5hbWUgPSBfbmFtZSwJCQkJCVwNCj4gPj4gLQkJLnBhcmVudF9uYW1lID0gX3BhcmVudCwJCQkJ
XA0KPiA+PiAtCQkucmVncyA9ICZtbTBfY2dfcmVncywJCQkJXA0KPiA+PiAtCQkuc2hpZnQgPSBf
c2hpZnQsCQkJCVwNCj4gPj4gLQkJLm9wcyA9ICZtdGtfY2xrX2dhdGVfb3BzX3NldGNsciwJCVwN
Cj4gPj4gLQl9DQo+ID4+IC0NCj4gPj4gLSNkZWZpbmUgR0FURV9NTTEoX2lkLCBfbmFtZSwgX3Bh
cmVudCwgX3NoaWZ0KSB7CQkJXA0KPiA+PiAtCQkuaWQgPSBfaWQsCQkJCQlcDQo+ID4+IC0JCS5u
YW1lID0gX25hbWUsCQkJCQlcDQo+ID4+IC0JCS5wYXJlbnRfbmFtZSA9IF9wYXJlbnQsCQkJCVwN
Cj4gPj4gLQkJLnJlZ3MgPSAmbW0xX2NnX3JlZ3MsCQkJCVwNCj4gPj4gLQkJLnNoaWZ0ID0gX3No
aWZ0LAkJCQlcDQo+ID4+IC0JCS5vcHMgPSAmbXRrX2Nsa19nYXRlX29wc19zZXRjbHIsCQlcDQo+
ID4+IC0JfQ0KPiA+PiAtDQo+ID4+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIG1tX2Ns
a3NbXSBfX2luaXRjb25zdCA9IHsNCj4gPj4gLQkvKiBNTTAgKi8NCj4gPj4gLQlHQVRFX01NMChD
TEtfTU1fU01JX0NPTU1PTiwgIm1tX3NtaV9jb21tb24iLCAibW1fc2VsIiwgMCksDQo+ID4+IC0J
R0FURV9NTTAoQ0xLX01NX1NNSV9MQVJCMCwgIm1tX3NtaV9sYXJiMCIsICJtbV9zZWwiLCAxKSwN
Cj4gPj4gLQlHQVRFX01NMChDTEtfTU1fQ0FNX01EUCwgIm1tX2NhbV9tZHAiLCAibW1fc2VsIiwg
MiksDQo+ID4+IC0JR0FURV9NTTAoQ0xLX01NX01EUF9SRE1BMCwgIm1tX21kcF9yZG1hMCIsICJt
bV9zZWwiLCAzKSwNCj4gPj4gLQlHQVRFX01NMChDTEtfTU1fTURQX1JETUExLCAibW1fbWRwX3Jk
bWExIiwgIm1tX3NlbCIsIDQpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9NRFBfUlNaMCwgIm1t
X21kcF9yc3owIiwgIm1tX3NlbCIsIDUpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9NRFBfUlNa
MSwgIm1tX21kcF9yc3oxIiwgIm1tX3NlbCIsIDYpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9N
RFBfUlNaMiwgIm1tX21kcF9yc3oyIiwgIm1tX3NlbCIsIDcpLA0KPiA+PiAtCUdBVEVfTU0wKENM
S19NTV9NRFBfVERTSFAwLCAibW1fbWRwX3Rkc2hwMCIsICJtbV9zZWwiLCA4KSwNCj4gPj4gLQlH
QVRFX01NMChDTEtfTU1fTURQX1REU0hQMSwgIm1tX21kcF90ZHNocDEiLCAibW1fc2VsIiwgOSks
DQo+ID4+IC0JR0FURV9NTTAoQ0xLX01NX01EUF9XRE1BLCAibW1fbWRwX3dkbWEiLCAibW1fc2Vs
IiwgMTEpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9NRFBfV1JPVDAsICJtbV9tZHBfd3JvdDAi
LCAibW1fc2VsIiwgMTIpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9NRFBfV1JPVDEsICJtbV9t
ZHBfd3JvdDEiLCAibW1fc2VsIiwgMTMpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9GQUtFX0VO
RywgIm1tX2Zha2VfZW5nIiwgIm1tX3NlbCIsIDE0KSwNCj4gPj4gLQlHQVRFX01NMChDTEtfTU1f
TVVURVhfMzJLLCAibW1fbXV0ZXhfMzJrIiwgInJ0Y19zZWwiLCAxNSksDQo+ID4+IC0JR0FURV9N
TTAoQ0xLX01NX0RJU1BfT1ZMMCwgIm1tX2Rpc3Bfb3ZsMCIsICJtbV9zZWwiLCAxNiksDQo+ID4+
IC0JR0FURV9NTTAoQ0xLX01NX0RJU1BfT1ZMMSwgIm1tX2Rpc3Bfb3ZsMSIsICJtbV9zZWwiLCAx
NyksDQo+ID4+IC0JR0FURV9NTTAoQ0xLX01NX0RJU1BfUkRNQTAsICJtbV9kaXNwX3JkbWEwIiwg
Im1tX3NlbCIsIDE4KSwNCj4gPj4gLQlHQVRFX01NMChDTEtfTU1fRElTUF9SRE1BMSwgIm1tX2Rp
c3BfcmRtYTEiLCAibW1fc2VsIiwgMTkpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9ESVNQX1JE
TUEyLCAibW1fZGlzcF9yZG1hMiIsICJtbV9zZWwiLCAyMCksDQo+ID4+IC0JR0FURV9NTTAoQ0xL
X01NX0RJU1BfV0RNQTAsICJtbV9kaXNwX3dkbWEwIiwgIm1tX3NlbCIsIDIxKSwNCj4gPj4gLQlH
QVRFX01NMChDTEtfTU1fRElTUF9XRE1BMSwgIm1tX2Rpc3Bfd2RtYTEiLCAibW1fc2VsIiwgMjIp
LA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9ESVNQX0NPTE9SMCwgIm1tX2Rpc3BfY29sb3IwIiwg
Im1tX3NlbCIsIDIzKSwNCj4gPj4gLQlHQVRFX01NMChDTEtfTU1fRElTUF9DT0xPUjEsICJtbV9k
aXNwX2NvbG9yMSIsICJtbV9zZWwiLCAyNCksDQo+ID4+IC0JR0FURV9NTTAoQ0xLX01NX0RJU1Bf
QUFMLCAibW1fZGlzcF9hYWwiLCAibW1fc2VsIiwgMjUpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19N
TV9ESVNQX0dBTU1BLCAibW1fZGlzcF9nYW1tYSIsICJtbV9zZWwiLCAyNiksDQo+ID4+IC0JR0FU
RV9NTTAoQ0xLX01NX0RJU1BfVUZPRSwgIm1tX2Rpc3BfdWZvZSIsICJtbV9zZWwiLCAyNyksDQo+
ID4+IC0JR0FURV9NTTAoQ0xLX01NX0RJU1BfU1BMSVQwLCAibW1fZGlzcF9zcGxpdDAiLCAibW1f
c2VsIiwgMjgpLA0KPiA+PiAtCUdBVEVfTU0wKENMS19NTV9ESVNQX1NQTElUMSwgIm1tX2Rpc3Bf
c3BsaXQxIiwgIm1tX3NlbCIsIDI5KSwNCj4gPj4gLQlHQVRFX01NMChDTEtfTU1fRElTUF9NRVJH
RSwgIm1tX2Rpc3BfbWVyZ2UiLCAibW1fc2VsIiwgMzApLA0KPiA+PiAtCUdBVEVfTU0wKENMS19N
TV9ESVNQX09ELCAibW1fZGlzcF9vZCIsICJtbV9zZWwiLCAzMSksDQo+ID4+IC0JLyogTU0xICov
DQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RJU1BfUFdNME1NLCAibW1fZGlzcF9wd20wbW0iLCAi
bW1fc2VsIiwgMCksDQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RJU1BfUFdNMDI2TSwgIm1tX2Rp
c3BfcHdtMDI2bSIsICJwd21fc2VsIiwgMSksDQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RJU1Bf
UFdNMU1NLCAibW1fZGlzcF9wd20xbW0iLCAibW1fc2VsIiwgMiksDQo+ID4+IC0JR0FURV9NTTEo
Q0xLX01NX0RJU1BfUFdNMTI2TSwgIm1tX2Rpc3BfcHdtMTI2bSIsICJwd21fc2VsIiwgMyksDQo+
ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RTSTBfRU5HSU5FLCAibW1fZHNpMF9lbmdpbmUiLCAibW1f
c2VsIiwgNCksDQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RTSTBfRElHSVRBTCwgIm1tX2RzaTBf
ZGlnaXRhbCIsICJkc2kwX2RpZyIsIDUpLA0KPiA+PiAtCUdBVEVfTU0xKENMS19NTV9EU0kxX0VO
R0lORSwgIm1tX2RzaTFfZW5naW5lIiwgIm1tX3NlbCIsIDYpLA0KPiA+PiAtCUdBVEVfTU0xKENM
S19NTV9EU0kxX0RJR0lUQUwsICJtbV9kc2kxX2RpZ2l0YWwiLCAiZHNpMV9kaWciLCA3KSwNCj4g
Pj4gLQlHQVRFX01NMShDTEtfTU1fRFBJX1BJWEVMLCAibW1fZHBpX3BpeGVsIiwgImRwaTBfc2Vs
IiwgOCksDQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0RQSV9FTkdJTkUsICJtbV9kcGlfZW5naW5l
IiwgIm1tX3NlbCIsIDkpLA0KPiA+PiAtCUdBVEVfTU0xKENMS19NTV9EUEkxX1BJWEVMLCAibW1f
ZHBpMV9waXhlbCIsICJsdmRzX3B4bCIsIDEwKSwNCj4gPj4gLQlHQVRFX01NMShDTEtfTU1fRFBJ
MV9FTkdJTkUsICJtbV9kcGkxX2VuZ2luZSIsICJtbV9zZWwiLCAxMSksDQo+ID4+IC0JR0FURV9N
TTEoQ0xLX01NX0hETUlfUElYRUwsICJtbV9oZG1pX3BpeGVsIiwgImRwaTBfc2VsIiwgMTIpLA0K
PiA+PiAtCUdBVEVfTU0xKENMS19NTV9IRE1JX1BMTENLLCAibW1faGRtaV9wbGxjayIsICJoZG1p
X3NlbCIsIDEzKSwNCj4gPj4gLQlHQVRFX01NMShDTEtfTU1fSERNSV9BVURJTywgIm1tX2hkbWlf
YXVkaW8iLCAiYXBsbDEiLCAxNCksDQo+ID4+IC0JR0FURV9NTTEoQ0xLX01NX0hETUlfU1BESUYs
ICJtbV9oZG1pX3NwZGlmIiwgImFwbGwyIiwgMTUpLA0KPiA+PiAtCUdBVEVfTU0xKENMS19NTV9M
VkRTX1BJWEVMLCAibW1fbHZkc19waXhlbCIsICJsdmRzX3B4bCIsIDE2KSwNCj4gPj4gLQlHQVRF
X01NMShDTEtfTU1fTFZEU19DVFMsICJtbV9sdmRzX2N0cyIsICJsdmRzX2N0cyIsIDE3KSwNCj4g
Pj4gLQlHQVRFX01NMShDTEtfTU1fU01JX0xBUkI0LCAibW1fc21pX2xhcmI0IiwgIm1tX3NlbCIs
IDE4KSwNCj4gPj4gLQlHQVRFX01NMShDTEtfTU1fSERNSV9IRENQLCAibW1faGRtaV9oZGNwIiwg
ImhkY3Bfc2VsIiwgMTkpLA0KPiA+PiAtCUdBVEVfTU0xKENMS19NTV9IRE1JX0hEQ1AyNE0sICJt
bV9oZG1pX2hkY3AyNG0iLCAiaGRjcF8yNG1fc2VsIiwgMjApLA0KPiA+PiAtfTsNCj4gPj4gLQ0K
PiA+PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZV9yZWdzIHZkZWMwX2NnX3JlZ3MgX19p
bml0Y29uc3QgPSB7DQo+ID4+ICAJLnNldF9vZnMgPSAweDAwMDAsDQo+ID4+ICAJLmNscl9vZnMg
PSAweDAwMDQsDQo+ID4+IEBAIC0xMTQ0LDIzICsxMDU3LDYgQEAgc3RhdGljIHZvaWQgX19pbml0
IG10a19pbWdzeXNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpDQo+ID4+ICB9DQo+ID4+
ICBDTEtfT0ZfREVDTEFSRShtdGtfaW1nc3lzLCAibWVkaWF0ZWssbXQ4MTczLWltZ3N5cyIsIG10
a19pbWdzeXNfaW5pdCk7DQo+ID4+ICANCj4gPj4gLXN0YXRpYyB2b2lkIF9faW5pdCBtdGtfbW1z
eXNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpDQo+ID4+IC17DQo+ID4+IC0Jc3RydWN0
IGNsa19vbmVjZWxsX2RhdGEgKmNsa19kYXRhOw0KPiA+PiAtCWludCByOw0KPiA+PiAtDQo+ID4+
IC0JY2xrX2RhdGEgPSBtdGtfYWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NMSyk7DQo+ID4+IC0N
Cj4gPj4gLQltdGtfY2xrX3JlZ2lzdGVyX2dhdGVzKG5vZGUsIG1tX2Nsa3MsIEFSUkFZX1NJWkUo
bW1fY2xrcyksDQo+ID4+IC0JCQkJCQljbGtfZGF0YSk7DQo+ID4+IC0NCj4gPj4gLQlyID0gb2Zf
Y2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0YSk7
DQo+ID4+IC0JaWYgKHIpDQo+ID4+IC0JCXByX2VycigiJXMoKTogY291bGQgbm90IHJlZ2lzdGVy
IGNsb2NrIHByb3ZpZGVyOiAlZFxuIiwNCj4gPj4gLQkJCV9fZnVuY19fLCByKTsNCj4gPj4gLX0N
Cj4gPj4gLUNMS19PRl9ERUNMQVJFKG10a19tbXN5cywgIm1lZGlhdGVrLG10ODE3My1tbXN5cyIs
IG10a19tbXN5c19pbml0KTsNCj4gPj4gLQ0KPiA+PiAgc3RhdGljIHZvaWQgX19pbml0IG10a192
ZGVjc3lzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlKQ0KPiA+PiAgew0KPiA+PiAgCXN0
cnVjdCBjbGtfb25lY2VsbF9kYXRhICpjbGtfZGF0YTsNCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc29jL21lZGlhdGVrL0tjb25maWcgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9LY29uZmlnDQo+
ID4+IGluZGV4IDIxMTRiNTYzNDc4Yy4uN2ExNTY5NDRkNTBlIDEwMDY0NA0KPiA+PiAtLS0gYS9k
cml2ZXJzL3NvYy9tZWRpYXRlay9LY29uZmlnDQo+ID4+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlh
dGVrL0tjb25maWcNCj4gPj4gQEAgLTQ0LDQgKzQ0LDExIEBAIGNvbmZpZyBNVEtfU0NQU1lTDQo+
ID4+ICAJICBTYXkgeWVzIGhlcmUgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBTQ1BT
WVMgcG93ZXIgZG9tYWluDQo+ID4+ICAJICBkcml2ZXIuDQo+ID4+ICANCj4gPj4gK2NvbmZpZyBN
VEtfTU1TWVMNCj4gPj4gKwlib29sICJNZWRpYVRlayBNTVNZUyBTdXBwb3J0Ig0KPiA+PiArCWRl
cGVuZHMgb24gQ09NTU9OX0NMS19NVDgxNzMNCj4gPj4gKwloZWxwDQo+ID4+ICsJICBTYXkgeWVz
IGhlcmUgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNdWx0aW1lZGlhDQo+ID4+ICsJ
ICBTdWJzeXN0ZW0gKE1NU1lTKS4NCj4gPj4gKw0KPiA+PiAgZW5kbWVudQ0KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGUgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9NYWtlZmlsZQ0KPiA+PiBpbmRleCBiMDE3MzMwNzRhZDYuLjAxZjlmODczNjM0YSAxMDA2NDQN
Cj4gPj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPj4gKysrIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvTWFrZWZpbGUNCj4gPj4gQEAgLTMsMyArMyw0IEBAIG9iai0kKENP
TkZJR19NVEtfQ01EUSkgKz0gbXRrLWNtZHEtaGVscGVyLm8NCj4gPj4gIG9iai0kKENPTkZJR19N
VEtfSU5GUkFDRkcpICs9IG10ay1pbmZyYWNmZy5vDQo+ID4+ICBvYmotJChDT05GSUdfTVRLX1BN
SUNfV1JBUCkgKz0gbXRrLXBtaWMtd3JhcC5vDQo+ID4+ICBvYmotJChDT05GSUdfTVRLX1NDUFNZ
UykgKz0gbXRrLXNjcHN5cy5vDQo+ID4+ICtvYmotJChDT05GSUdfTVRLX01NU1lTKSArPSBtdGst
bW1zeXMubw0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lz
LmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYw0KPiA+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ3M2NkZjczMmZiNQ0KPiA+PiAtLS0g
L2Rldi9udWxsDQo+ID4+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jDQo+
ID4+IEBAIC0wLDAgKzEsMTU0IEBADQo+ID4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5DQo+ID4+ICsvKg0KPiA+PiArICogQ29weXJpZ2h0IChjKSAyMDE0IE1lZGlh
VGVrIEluYy4NCj4gPj4gKyAqIEF1dGhvcjogSmFtZXMgTGlhbyA8amFtZXNqai5saWFvQG1lZGlh
dGVrLmNvbT4NCj4gPj4gKyAqLw0KPiA+PiArDQo+ID4+ICsjaW5jbHVkZSA8bGludXgvY2xrLXBy
b3ZpZGVyLmg+DQo+ID4+ICsjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQo+ID4+ICsjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4+ICsNCj4gPj4gKyNpbmNsdWRlICIu
Li8uLi9jbGsvbWVkaWF0ZWsvY2xrLWdhdGUuaCINCj4gPj4gKyNpbmNsdWRlICIuLi8uLi9jbGsv
bWVkaWF0ZWsvY2xrLW10ay5oIg0KPiA+PiArDQo+ID4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
Y2xvY2svbXQ4MTczLWNsay5oPg0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19nYXRlX3JlZ3MgbW0wX2NnX3JlZ3MgPSB7DQo+ID4+ICsJLnNldF9vZnMgPSAweDAxMDQsDQo+
ID4+ICsJLmNscl9vZnMgPSAweDAxMDgsDQo+ID4+ICsJLnN0YV9vZnMgPSAweDAxMDAsDQo+ID4+
ICt9Ow0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlX3JlZ3MgbW0x
X2NnX3JlZ3MgPSB7DQo+ID4+ICsJLnNldF9vZnMgPSAweDAxMTQsDQo+ID4+ICsJLmNscl9vZnMg
PSAweDAxMTgsDQo+ID4+ICsJLnN0YV9vZnMgPSAweDAxMTAsDQo+ID4+ICt9Ow0KPiA+PiArDQo+
ID4+ICsjZGVmaW5lIEdBVEVfTU0wKF9pZCwgX25hbWUsIF9wYXJlbnQsIF9zaGlmdCkgewkJCVwN
Cj4gPj4gKwkJLmlkID0gX2lkLAkJCQkJXA0KPiA+PiArCQkubmFtZSA9IF9uYW1lLAkJCQkJXA0K
PiA+PiArCQkucGFyZW50X25hbWUgPSBfcGFyZW50LAkJCQlcDQo+ID4+ICsJCS5yZWdzID0gJm1t
MF9jZ19yZWdzLAkJCQlcDQo+ID4+ICsJCS5zaGlmdCA9IF9zaGlmdCwJCQkJXA0KPiA+PiArCQku
b3BzID0gJm10a19jbGtfZ2F0ZV9vcHNfc2V0Y2xyLAkJXA0KPiA+PiArCX0NCj4gPj4gKw0KPiA+
PiArI2RlZmluZSBHQVRFX01NMShfaWQsIF9uYW1lLCBfcGFyZW50LCBfc2hpZnQpIHsJCQlcDQo+
ID4+ICsJCS5pZCA9IF9pZCwJCQkJCVwNCj4gPj4gKwkJLm5hbWUgPSBfbmFtZSwJCQkJCVwNCj4g
Pj4gKwkJLnBhcmVudF9uYW1lID0gX3BhcmVudCwJCQkJXA0KPiA+PiArCQkucmVncyA9ICZtbTFf
Y2dfcmVncywJCQkJXA0KPiA+PiArCQkuc2hpZnQgPSBfc2hpZnQsCQkJCVwNCj4gPj4gKwkJLm9w
cyA9ICZtdGtfY2xrX2dhdGVfb3BzX3NldGNsciwJCVwNCj4gPj4gKwl9DQo+ID4+ICsNCj4gPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGUgbXQ4MTczX21tX2Nsa3NbXSA9IHsNCj4gPj4g
KwkvKiBNTTAgKi8NCj4gPj4gKwlHQVRFX01NMChDTEtfTU1fU01JX0NPTU1PTiwgIm1tX3NtaV9j
b21tb24iLCAibW1fc2VsIiwgMCksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX1NNSV9MQVJCMCwg
Im1tX3NtaV9sYXJiMCIsICJtbV9zZWwiLCAxKSwNCj4gPj4gKwlHQVRFX01NMChDTEtfTU1fQ0FN
X01EUCwgIm1tX2NhbV9tZHAiLCAibW1fc2VsIiwgMiksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01N
X01EUF9SRE1BMCwgIm1tX21kcF9yZG1hMCIsICJtbV9zZWwiLCAzKSwNCj4gPj4gKwlHQVRFX01N
MChDTEtfTU1fTURQX1JETUExLCAibW1fbWRwX3JkbWExIiwgIm1tX3NlbCIsIDQpLA0KPiA+PiAr
CUdBVEVfTU0wKENMS19NTV9NRFBfUlNaMCwgIm1tX21kcF9yc3owIiwgIm1tX3NlbCIsIDUpLA0K
PiA+PiArCUdBVEVfTU0wKENMS19NTV9NRFBfUlNaMSwgIm1tX21kcF9yc3oxIiwgIm1tX3NlbCIs
IDYpLA0KPiA+PiArCUdBVEVfTU0wKENMS19NTV9NRFBfUlNaMiwgIm1tX21kcF9yc3oyIiwgIm1t
X3NlbCIsIDcpLA0KPiA+PiArCUdBVEVfTU0wKENMS19NTV9NRFBfVERTSFAwLCAibW1fbWRwX3Rk
c2hwMCIsICJtbV9zZWwiLCA4KSwNCj4gPj4gKwlHQVRFX01NMChDTEtfTU1fTURQX1REU0hQMSwg
Im1tX21kcF90ZHNocDEiLCAibW1fc2VsIiwgOSksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX01E
UF9XRE1BLCAibW1fbWRwX3dkbWEiLCAibW1fc2VsIiwgMTEpLA0KPiA+PiArCUdBVEVfTU0wKENM
S19NTV9NRFBfV1JPVDAsICJtbV9tZHBfd3JvdDAiLCAibW1fc2VsIiwgMTIpLA0KPiA+PiArCUdB
VEVfTU0wKENMS19NTV9NRFBfV1JPVDEsICJtbV9tZHBfd3JvdDEiLCAibW1fc2VsIiwgMTMpLA0K
PiA+PiArCUdBVEVfTU0wKENMS19NTV9GQUtFX0VORywgIm1tX2Zha2VfZW5nIiwgIm1tX3NlbCIs
IDE0KSwNCj4gPj4gKwlHQVRFX01NMChDTEtfTU1fTVVURVhfMzJLLCAibW1fbXV0ZXhfMzJrIiwg
InJ0Y19zZWwiLCAxNSksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1BfT1ZMMCwgIm1tX2Rp
c3Bfb3ZsMCIsICJtbV9zZWwiLCAxNiksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1BfT1ZM
MSwgIm1tX2Rpc3Bfb3ZsMSIsICJtbV9zZWwiLCAxNyksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01N
X0RJU1BfUkRNQTAsICJtbV9kaXNwX3JkbWEwIiwgIm1tX3NlbCIsIDE4KSwNCj4gPj4gKwlHQVRF
X01NMChDTEtfTU1fRElTUF9SRE1BMSwgIm1tX2Rpc3BfcmRtYTEiLCAibW1fc2VsIiwgMTkpLA0K
PiA+PiArCUdBVEVfTU0wKENMS19NTV9ESVNQX1JETUEyLCAibW1fZGlzcF9yZG1hMiIsICJtbV9z
ZWwiLCAyMCksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1BfV0RNQTAsICJtbV9kaXNwX3dk
bWEwIiwgIm1tX3NlbCIsIDIxKSwNCj4gPj4gKwlHQVRFX01NMChDTEtfTU1fRElTUF9XRE1BMSwg
Im1tX2Rpc3Bfd2RtYTEiLCAibW1fc2VsIiwgMjIpLA0KPiA+PiArCUdBVEVfTU0wKENMS19NTV9E
SVNQX0NPTE9SMCwgIm1tX2Rpc3BfY29sb3IwIiwgIm1tX3NlbCIsIDIzKSwNCj4gPj4gKwlHQVRF
X01NMChDTEtfTU1fRElTUF9DT0xPUjEsICJtbV9kaXNwX2NvbG9yMSIsICJtbV9zZWwiLCAyNCks
DQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1BfQUFMLCAibW1fZGlzcF9hYWwiLCAibW1fc2Vs
IiwgMjUpLA0KPiA+PiArCUdBVEVfTU0wKENMS19NTV9ESVNQX0dBTU1BLCAibW1fZGlzcF9nYW1t
YSIsICJtbV9zZWwiLCAyNiksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1BfVUZPRSwgIm1t
X2Rpc3BfdWZvZSIsICJtbV9zZWwiLCAyNyksDQo+ID4+ICsJR0FURV9NTTAoQ0xLX01NX0RJU1Bf
U1BMSVQwLCAibW1fZGlzcF9zcGxpdDAiLCAibW1fc2VsIiwgMjgpLA0KPiA+PiArCUdBVEVfTU0w
KENMS19NTV9ESVNQX1NQTElUMSwgIm1tX2Rpc3Bfc3BsaXQxIiwgIm1tX3NlbCIsIDI5KSwNCj4g
Pj4gKwlHQVRFX01NMChDTEtfTU1fRElTUF9NRVJHRSwgIm1tX2Rpc3BfbWVyZ2UiLCAibW1fc2Vs
IiwgMzApLA0KPiA+PiArCUdBVEVfTU0wKENMS19NTV9ESVNQX09ELCAibW1fZGlzcF9vZCIsICJt
bV9zZWwiLCAzMSksDQo+ID4+ICsJLyogTU0xICovDQo+ID4+ICsJR0FURV9NTTEoQ0xLX01NX0RJ
U1BfUFdNME1NLCAibW1fZGlzcF9wd20wbW0iLCAibW1fc2VsIiwgMCksDQo+ID4+ICsJR0FURV9N
TTEoQ0xLX01NX0RJU1BfUFdNMDI2TSwgIm1tX2Rpc3BfcHdtMDI2bSIsICJwd21fc2VsIiwgMSks
DQo+ID4+ICsJR0FURV9NTTEoQ0xLX01NX0RJU1BfUFdNMU1NLCAibW1fZGlzcF9wd20xbW0iLCAi
bW1fc2VsIiwgMiksDQo+ID4+ICsJR0FURV9NTTEoQ0xLX01NX0RJU1BfUFdNMTI2TSwgIm1tX2Rp
c3BfcHdtMTI2bSIsICJwd21fc2VsIiwgMyksDQo+ID4+ICsJR0FURV9NTTEoQ0xLX01NX0RTSTBf
RU5HSU5FLCAibW1fZHNpMF9lbmdpbmUiLCAibW1fc2VsIiwgNCksDQo+ID4+ICsJR0FURV9NTTEo
Q0xLX01NX0RTSTBfRElHSVRBTCwgIm1tX2RzaTBfZGlnaXRhbCIsICJkc2kwX2RpZyIsIDUpLA0K
PiA+PiArCUdBVEVfTU0xKENMS19NTV9EU0kxX0VOR0lORSwgIm1tX2RzaTFfZW5naW5lIiwgIm1t
X3NlbCIsIDYpLA0KPiA+PiArCUdBVEVfTU0xKENMS19NTV9EU0kxX0RJR0lUQUwsICJtbV9kc2kx
X2RpZ2l0YWwiLCAiZHNpMV9kaWciLCA3KSwNCj4gPj4gKwlHQVRFX01NMShDTEtfTU1fRFBJX1BJ
WEVMLCAibW1fZHBpX3BpeGVsIiwgImRwaTBfc2VsIiwgOCksDQo+ID4+ICsJR0FURV9NTTEoQ0xL
X01NX0RQSV9FTkdJTkUsICJtbV9kcGlfZW5naW5lIiwgIm1tX3NlbCIsIDkpLA0KPiA+PiArCUdB
VEVfTU0xKENMS19NTV9EUEkxX1BJWEVMLCAibW1fZHBpMV9waXhlbCIsICJsdmRzX3B4bCIsIDEw
KSwNCj4gPj4gKwlHQVRFX01NMShDTEtfTU1fRFBJMV9FTkdJTkUsICJtbV9kcGkxX2VuZ2luZSIs
ICJtbV9zZWwiLCAxMSksDQo+ID4+ICsJR0FURV9NTTEoQ0xLX01NX0hETUlfUElYRUwsICJtbV9o
ZG1pX3BpeGVsIiwgImRwaTBfc2VsIiwgMTIpLA0KPiA+PiArCUdBVEVfTU0xKENMS19NTV9IRE1J
X1BMTENLLCAibW1faGRtaV9wbGxjayIsICJoZG1pX3NlbCIsIDEzKSwNCj4gPj4gKwlHQVRFX01N
MShDTEtfTU1fSERNSV9BVURJTywgIm1tX2hkbWlfYXVkaW8iLCAiYXBsbDEiLCAxNCksDQo+ID4+
ICsJR0FURV9NTTEoQ0xLX01NX0hETUlfU1BESUYsICJtbV9oZG1pX3NwZGlmIiwgImFwbGwyIiwg
MTUpLA0KPiA+PiArCUdBVEVfTU0xKENMS19NTV9MVkRTX1BJWEVMLCAibW1fbHZkc19waXhlbCIs
ICJsdmRzX3B4bCIsIDE2KSwNCj4gPj4gKwlHQVRFX01NMShDTEtfTU1fTFZEU19DVFMsICJtbV9s
dmRzX2N0cyIsICJsdmRzX2N0cyIsIDE3KSwNCj4gPj4gKwlHQVRFX01NMShDTEtfTU1fU01JX0xB
UkI0LCAibW1fc21pX2xhcmI0IiwgIm1tX3NlbCIsIDE4KSwNCj4gPj4gKwlHQVRFX01NMShDTEtf
TU1fSERNSV9IRENQLCAibW1faGRtaV9oZGNwIiwgImhkY3Bfc2VsIiwgMTkpLA0KPiA+PiArCUdB
VEVfTU0xKENMS19NTV9IRE1JX0hEQ1AyNE0sICJtbV9oZG1pX2hkY3AyNG0iLCAiaGRjcF8yNG1f
c2VsIiwgMjApLA0KPiA+PiArfTsNCj4gPj4gKw0KPiA+PiArc3RydWN0IG10a19tbXN5c19kcml2
ZXJfZGF0YSB7DQo+ID4+ICsJY29uc3Qgc3RydWN0IG10a19nYXRlICpnYXRlc19jbGs7DQo+ID4+
ICsJaW50IGdhdGVzX251bTsNCj4gPj4gK307DQo+ID4+ICsNCj4gPj4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE3M19tbXN5c19kcml2ZXJfZGF0YSA9IHsN
Cj4gPj4gKwkuZ2F0ZXNfY2xrID0gbXQ4MTczX21tX2Nsa3MsDQo+ID4+ICsJLmdhdGVzX251bSA9
IEFSUkFZX1NJWkUobXQ4MTczX21tX2Nsa3MpLA0KPiA+PiArfTsNCj4gPj4gKw0KPiA+PiArc3Rh
dGljIGludCBtdGtfbW1zeXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
Pj4gK3sNCj4gPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9k
ZTsNCj4gPj4gKwljb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhICpkYXRhOw0KPiA+
PiArCXN0cnVjdCBjbGtfb25lY2VsbF9kYXRhICpjbGtfZGF0YTsNCj4gPj4gKwlpbnQgcmV0Ow0K
PiA+PiArDQo+ID4+ICsJY2xrX2RhdGEgPSBtdGtfYWxsb2NfY2xrX2RhdGEoQ0xLX01NX05SX0NM
Syk7DQo+ID4+ICsJaWYgKCFjbGtfZGF0YSkNCj4gPj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4+
ICsNCj4gPj4gKwlkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0K
PiA+PiArDQo+ID4+ICsJcmV0ID0gbXRrX2Nsa19yZWdpc3Rlcl9nYXRlcyhub2RlLCBkYXRhLT5n
YXRlc19jbGssIGRhdGEtPmdhdGVzX251bSwNCj4gPj4gKwkJCQkgICAgIGNsa19kYXRhKTsNCj4g
Pj4gKwlpZiAocmV0KQ0KPiA+PiArCQlyZXR1cm4gcmV0Ow0KPiA+PiArDQo+ID4+ICsJcmV0ID0g
b2ZfY2xrX2FkZF9wcm92aWRlcihub2RlLCBvZl9jbGtfc3JjX29uZWNlbGxfZ2V0LCBjbGtfZGF0
YSk7DQo+ID4+ICsJaWYgKHJldCkNCj4gPj4gKwkJcmV0dXJuIHJldDsNCj4gPj4gKw0KPiA+PiAr
CXJldHVybiAwOw0KPiA+PiArfQ0KPiA+PiArDQo+ID4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBvZl9tYXRjaF9tdGtfbW1zeXNbXSA9IHsNCj4gPj4gKwl7DQo+ID4+ICsJCS5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1tbXN5cyIsDQo+ID4+ICsJCS5kYXRhID0gJm10
ODE3M19tbXN5c19kcml2ZXJfZGF0YSwNCj4gPj4gKwl9LA0KPiA+PiArCXsgfQ0KPiA+PiArfTsN
Cj4gPj4gKw0KPiA+PiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX21tc3lzX2Ry
diA9IHsNCj4gPj4gKwkuZHJpdmVyID0gew0KPiA+PiArCQkubmFtZSA9ICJtdGstbW1zeXMiLA0K
PiA+PiArCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9tdGtfbW1zeXMsDQo+ID4+ICsJfSwN
Cj4gPj4gKwkucHJvYmUgPSBtdGtfbW1zeXNfcHJvYmUsDQo+ID4+ICt9Ow0KPiA+PiArDQo+ID4+
ICtidWlsdGluX3BsYXRmb3JtX2RyaXZlcihtdGtfbW1zeXNfZHJ2KTsNCj4gPj4NCg0K

