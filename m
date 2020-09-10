Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B0526434F
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 12:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730273AbgIJKJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 06:09:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13648 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725992AbgIJKJw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 06:09:52 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08AA7lbg013374;
        Thu, 10 Sep 2020 12:09:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=RJlwxPBVNUGsDj4AiY3vLscF2tTp2a4WGIjfMF+LtGA=;
 b=E7TorUABIhLY4iNnpKLxLE2vNBn7Z2fAH8FZsbFhPevI9ZPj1U7RDCfLAlr0FxIDcgdp
 Vb9AsiIlHgEahH9Y+D6kJ+iruAgrOPJWnrNyZXrWf8+y9uVe+y+0ASEATnxtTe6ZzLyc
 sq64s9wa6ZBcX5cudz7ZnNuW6oID1V5ZHVe26yoZX5mul9jrJpZJNhtX/yrzK0NpiIB3
 I/NeLUj8ts7NU2cJSxNCVFFtnOWga3PudlW26XB59uBVVMuOJsjdRWYZAiq6NoPKRvKm
 bqtm//ygrmp4iurRpfMJJOXk4hY39JU8vNdPphCPqLyRLWkYqYmTICzlWn6M+6jrB4fU Mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33byt8333y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 12:09:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7670610002A;
        Thu, 10 Sep 2020 12:09:32 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag5node5.st.com [10.75.127.78])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1C3FF221FED;
        Thu, 10 Sep 2020 12:09:32 +0200 (CEST)
Received: from GPXDAG5NODE4.st.com (10.75.127.77) by GPXDAG5NODE5.st.com
 (10.75.127.78) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 12:09:31 +0200
Received: from GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a]) by
 GPXDAG5NODE4.st.com ([fe80::f1ac:b650:75f9:818a%19]) with mapi id
 15.00.1473.003; Thu, 10 Sep 2020 12:09:31 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] media: i2c: ov5640: Add support for BT656 mode
Thread-Topic: [PATCH v2 3/4] media: i2c: ov5640: Add support for BT656 mode
Thread-Index: AQHWaaLnGsegUrjL8k+L/QYmrofV66lhwCaA
Date:   Thu, 10 Sep 2020 10:09:31 +0000
Message-ID: <ac104d73-eaaf-1199-d7a3-d1c6ccbc68c0@st.com>
References: <1596465107-14251-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596465107-14251-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1596465107-14251-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9FE1A9D2BF42648BBAFA9CB177F4708@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_01:2020-09-10,2020-09-10 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQpIaSBQcmFiaGFrYXIsDQoNCkknbSBjdXJyZW50bHkgdGVzdGluZyB0aGUgT1Y1NjQwIENDSVI2
NTYgZW1iZWRkZWQgc3luY2hyb25pc2F0aW9uIG1vZGUgDQpvbiBTVE0zMk1QMSBydW5uaW5nIFNU
TTMyIERDTUkgY2FtZXJhIGludGVyZmFjZS4NClRlc3RzIG5vdCB5ZXQgZnVsbHkgY29tcGxldGVk
IGJ1dCBzb3VuZHMgZ29vZCwgbW9yZSBkZXRhaWxzIGJlbG93Lg0KDQpPbiA4LzMvMjAgNDozMSBQ
TSwgTGFkIFByYWJoYWthciB3cm90ZToNCj4gRW5hYmxlIHN1cHBvcnQgZm9yIEJUNjU2IG1vZGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1s
YWQucmpAYnAucmVuZXNhcy5jb20+DQo+IFJldmlld2VkLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5j
IHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2
NDAuYw0KPiBpbmRleCBlYzQ0NGJlZTJjZTkuLjA4YzY3MjUwMDQyZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1
NjQwLmMNCj4gQEAgLTgyLDYgKzgyLDcgQEANCj4gICAjZGVmaW5lIE9WNTY0MF9SRUdfVkZJRk9f
SFNJWkUJCTB4NDYwMg0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19WRklGT19WU0laRQkJMHg0NjA0
DQo+ICAgI2RlZmluZSBPVjU2NDBfUkVHX0pQR19NT0RFX1NFTEVDVAkweDQ3MTMNCj4gKyNkZWZp
bmUgT1Y1NjQwX1JFR19DQ0lSNjU2X0NUUkwwMAkweDQ3MzANCj4gICAjZGVmaW5lIE9WNTY0MF9S
RUdfUE9MQVJJVFlfQ1RSTDAwCTB4NDc0MA0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19NSVBJX0NU
UkwwMAkJMHg0ODAwDQo+ICAgI2RlZmluZSBPVjU2NDBfUkVHX0RFQlVHX01PREUJCTB4NDgxNA0K
PiBAQCAtMTIxNiw2ICsxMjE3LDE4IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9hdXRvZ2Fpbihz
dHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPiAgIAkJCSAgICAgIEJJVCgxKSwg
b24gPyAwIDogQklUKDEpKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgaW50IG92NTY0MF9zZXRf
c3RyZWFtX2J0NjU2KHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+ICt7DQo+
ICsJaW50IHJldDsNCj4gKw0KPiArCXJldCA9IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2
NDBfUkVHX0NDSVI2NTZfQ1RSTDAwLCBvbiA/IDB4MSA6IDB4MDApOw0KPiArCWlmIChyZXQpDQo+
ICsJCXJldHVybiByZXQ7DQoNClBsZWFzZSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgYml0IGZp
ZWxkcyBmcm9tIGRhdGFzaGVldDoNCkJpdFs3XTogU1lOQyBjb2RlIHNlbGVjdGlvbg0KMDogQXV0
b21hdGljYWxseSBnZW5lcmF0ZSBTWU5DIGNvZGUNCjE6IFNZTkMgY29kZSBmcm9tIHJlZ2lzdGVy
IHNldHRpbmcgMHg0NzMyfjQ3MzUNCkJpdFs0OjNdOiBCbGFuayB0b2dnbGUgZGF0YSBvcHRpb25z
DQowMDogVG9nZ2xlIGRhdGEgaXMgMSdoMDQwLzEnaDIwMA0KQml0WzFdOiBDbGlwIGRhdGEgZGlz
YWJsZSAoc28gY2xpcCBpcyBlbmFibGVkKQ0KQml0WzBdOiBDQ0lSNjU2IG1vZGUgZW5hYmxlDQoN
ClNvIDB4MSBzdGFuZHMgZm9yIENDSVI2NTYgd2l0aCBhdXRvbWF0aWMgU1lOQyBjb2RlczogU0FW
L0VBViB3aXRoIA0KZGVmYXVsdCB2YWx1ZXMgaWUgU0FWPTB4RkYwMDAwODAgJiBFQVY9MHhGRjAw
MDA5ZC4NCg0KT24gU1RNMzIgcGxhdGZvcm0sIHRoaXMgY29ycmVzcG9uZCB0byBEQ01JIGNvbmZp
Z3VyYXRpb24gRVNDUj0weGZmOWQ4MGZmIA0KYW5kIEVTVVI9MHhmZmZmZmZmZi4NCk9uIFJlbmVz
YXMgcGxhdGZvcm0sIEkgaGF2ZSBub3Qgc2VlbiBhbnkgY29uZmlndXJhdGlvbiBpbiBjb2RlLCB0
aGlzIA0KU0FWL0VBViBtb2RlIHNlZW1zIHRvIGJlIGhhbmRsZWQgYnkgZGVmYXVsdCBieSBoYXJk
d2FyZSwgZG8geW91IGNvbmZpcm0gPw0KDQpOb3RlIHRoYXQgYW5vdGhlciBDQ0lSNjU2IGVtYmVk
ZGVkIHN5bmNocm8gbW9kZSBjb3VsZCBiZSB1c2VkIHdpdGggDQpjdXN0b20gc3luY2hybyBjb2Rl
cyBGUy9GRS9MUy9MRSBpbiByZWdpc3RlcnMgMHg0NzMyLTB4NDczNSwgdGhpcw0KbW9kZSBpcyBl
bmFibGVkIHdpdGggQ0NJUjY1Nl9DVFJMMDAoMHg0NzMwKSBzZXQgdG8gMHg4MToNCkJpdFs3XTog
U1lOQyBjb2RlIHNlbGVjdGlvbg0KMTogU1lOQyBjb2RlIGZyb20gcmVnaXN0ZXIgc2V0dGluZyAw
eDQ3MzJ+NDczNQ0KDQo+ICsNCj4gKwlyZXR1cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9W
NTY0MF9SRUdfU1lTX0NUUkwwLCBvbiA/DQo+ICsJCQkJT1Y1NjQwX1NPRlRXQVJFX1dBS0VVUCA6
IE9WNTY0MF9TT0ZUV0FSRV9QV0ROKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgb3Y1NjQw
X3NldF9zdHJlYW1fZHZwKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+ICAg
ew0KPiAgIAlyZXR1cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfU1lTX0NU
UkwwLCBvbiA/DQo+IEBAIC0yMDIyLDE4ICsyMDM1LDIwIEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3Nl
dF9kdnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICAJICoJCWRhdGFz
aGVldCBhbmQgaGFyZHdhcmUsIDAgaXMgYWN0aXZlIGhpZ2gNCj4gICAJICoJCWFuZCAxIGlzIGFj
dGl2ZSBsb3cuLi4pDQo+ICAgCSAqLw0KPiAtCWlmIChmbGFncyAmIFY0TDJfTUJVU19QQ0xLX1NB
TVBMRV9SSVNJTkcpDQo+IC0JCXBjbGtfcG9sID0gMTsNCj4gLQlpZiAoZmxhZ3MgJiBWNEwyX01C
VVNfSFNZTkNfQUNUSVZFX0hJR0gpDQo+IC0JCWhzeW5jX3BvbCA9IDE7DQo+IC0JaWYgKGZsYWdz
ICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9MT1cpDQo+IC0JCXZzeW5jX3BvbCA9IDE7DQo+ICsJ
aWYgKHNlbnNvci0+ZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX1BBUkFMTEVMKSB7DQo+ICsJCWlm
IChmbGFncyAmIFY0TDJfTUJVU19QQ0xLX1NBTVBMRV9SSVNJTkcpDQo+ICsJCQlwY2xrX3BvbCA9
IDE7DQo+ICsJCWlmIChmbGFncyAmIFY0TDJfTUJVU19IU1lOQ19BQ1RJVkVfSElHSCkNCj4gKwkJ
CWhzeW5jX3BvbCA9IDE7DQo+ICsJCWlmIChmbGFncyAmIFY0TDJfTUJVU19WU1lOQ19BQ1RJVkVf
TE9XKQ0KPiArCQkJdnN5bmNfcG9sID0gMTsNCj4gICANCj4gLQlyZXQgPSBvdjU2NDBfd3JpdGVf
cmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QT0xBUklUWV9DVFJMMDAsDQo+IC0JCQkgICAgICAgKHBj
bGtfcG9sIDw8IDUpIHwgKGhzeW5jX3BvbCA8PCAxKSB8IHZzeW5jX3BvbCk7DQo+ICsJCXJldCA9
IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BPTEFSSVRZX0NUUkwwMCwNCj4g
KwkJCQkgICAgICAgKHBjbGtfcG9sIDw8IDUpIHwgKGhzeW5jX3BvbCA8PCAxKSB8IHZzeW5jX3Bv
bCk7DQo+ICAgDQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwkJaWYgKHJldCkN
Cj4gKwkJCXJldHVybiByZXQ7DQo+ICsJfQ0KPiAgIA0KPiAgIAkvKg0KPiAgIAkgKiBwb3dlcmRv
d24gTUlQSSBUWC9SWCBQSFkgJiBkaXNhYmxlIE1JUEkNCj4gQEAgLTIwNTcsNyArMjA3Miw4IEBA
IHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9kdnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9v
bCBvbikNCj4gICAJICogLSA0OgkJUENMSyBvdXRwdXQgZW5hYmxlDQo+ICAgCSAqIC0gWzM6MF06
CURbOTo2XSBvdXRwdXQgZW5hYmxlDQo+ICAgCSAqLw0KPiAtCXJldCA9IG92NTY0MF93cml0ZV9y
ZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxFMDEsIDB4N2YpOw0KPiArCXJl
dCA9IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxF
MDEsDQo+ICsJCQkgICAgICAgc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBWNEwyX01CVVNfUEFSQUxM
RUwgPyAweDdmIDogMHgxZik7DQo+ICAgCWlmIChyZXQpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAg
IA0KPiBAQCAtMjkxMSw2ICsyOTI3LDggQEAgc3RhdGljIGludCBvdjU2NDBfc19zdHJlYW0oc3Ry
dWN0IHY0bDJfc3ViZGV2ICpzZCwgaW50IGVuYWJsZSkNCj4gICANCj4gICAJCWlmIChzZW5zb3It
PmVwLmJ1c190eXBlID09IFY0TDJfTUJVU19DU0kyX0RQSFkpDQo+ICAgCQkJcmV0ID0gb3Y1NjQw
X3NldF9zdHJlYW1fbWlwaShzZW5zb3IsIGVuYWJsZSk7DQo+ICsJCWVsc2UgaWYgKHNlbnNvci0+
ZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2KQ0KPiArCQkJcmV0ID0gb3Y1NjQwX3NldF9z
dHJlYW1fYnQ2NTYoc2Vuc29yLCBlbmFibGUpOw0KPiAgIAkJZWxzZQ0KPiAgIAkJCXJldCA9IG92
NTY0MF9zZXRfc3RyZWFtX2R2cChzZW5zb3IsIGVuYWJsZSk7DQo+ICAgDQo+IA0KDQpCUiwgSHVn
dWVzLg==
