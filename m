Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610F5287116
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 10:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgJHI7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 04:59:17 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:52822 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgJHI7Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 04:59:16 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0988qOFG029333;
        Thu, 8 Oct 2020 10:58:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ynVRILT2FMFg8Vu4WHMwSw6gaUxAXjOLWz9YnoTvjoI=;
 b=fHDRDR7fw5uOuKrcMPLMb18KgJhX4pzzurl1i1GsV6/tfgt2g2moQxXuJccwE169/jCL
 oztYGdsApMJ5LSyZfV7Gdv7dZvVVTBGdVtAfNLZ0qz29Z2QH8dER0S3OUUWVyA+O1JvK
 BvVaI977AHuQumG0Wno+o2ox6GSAT3qajhaRigA/CwTauqEPsEgNlChjgq3o6ts4WdZf
 J3jxDbUPd4Ew9Dk4ckJkLtWykHBZ4/e3AvpSwNsbuqJBryJPK6NZ3ewEEtSPZp2BItXk
 E1RHQ2P56tJI1Gb5IbBe77o2l7d/jK9tSREoSkWZl/PS+6sra0AaeY2IovBEj7q9IBzn MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3402tk1n5m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Oct 2020 10:58:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA99E10002A;
        Thu,  8 Oct 2020 10:58:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7301A2ADA09;
        Thu,  8 Oct 2020 10:58:58 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 10:58:11 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 8 Oct 2020 10:58:11 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH] media: ov5640: fix MIPI power sequence
Thread-Topic: [PATCH] media: ov5640: fix MIPI power sequence
Thread-Index: AQHWnLs/CuL/W9OdtE+ovGhzaFrmY6mNR06A
Date:   Thu, 8 Oct 2020 08:58:11 +0000
Message-ID: <6507ea32-c8e7-fb3b-305a-26a0627bc06b@st.com>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
 <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
 <20201007150103.GN26842@paasikivi.fi.intel.com>
 <20201007150903.473gxynjyncok247@uno.localdomain>
In-Reply-To: <20201007150903.473gxynjyncok247@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A890AB273381DA47A38BC0D4664A6128@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-08_04:2020-10-08,2020-10-08 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLCBTYWthcmksDQoNCkFzIHlvdSB3YW50LCBsZXQncyBkcm9wIHRoaXMgcGF0Y2gu
DQoNCkJSLA0KSHVndWVzLg0KDQpPbiAxMC83LzIwIDU6MDkgUE0sIEphY29wbyBNb25kaSB3cm90
ZToNCj4gSGkgSHVndWVzLCBTYWthcmksDQo+IA0KPiBPbiBXZWQsIE9jdCAwNywgMjAyMCBhdCAw
NjowMTowM1BNICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+PiBIaSBIdWd1ZXMsDQo+Pg0K
Pj4gT24gV2VkLCBPY3QgMDcsIDIwMjAgYXQgMDQ6NDM6MThQTSArMDIwMCwgSHVndWVzIEZydWNo
ZXQgd3JvdGU6DQo+Pj4gZml4ZXM6IGIxNzUxYWU2NTJmYiAoIm1lZGlhOiBpMmM6IG92NTY0MDog
U2VwYXJhdGUgb3V0IG1pcGkgY29uZmlndXJhdGlvbiBmcm9tIHNfcG93ZXIiKQ0KPj4NCj4+IEZp
eGVzOiAuLi4NCj4+DQo+PiBBbmQgcHJlZmVycmFibHkgYmVmb3JlIFNvYiBsaW5lLg0KPj4NCj4+
Pg0KPj4+IEZpeCBvdjU2NDBfd3JpdGVfcmVnKClyZXR1cm4gdmFsdWUgdW5jaGVja2VkIGF0IHBv
d2VyIG9mZi4NCj4+PiBSZWZvcm1hdCBjb2RlIHRvIGtlZXAgcmVnaXN0ZXIgYWNjZXNzIGJlbG93
IHRoZSByZWdpc3RlciBkZXNjcmlwdGlvbi4NCj4+DQo+PiBJZiB0aGVyZSdzIGFuIGVycm9yLCBJ
IHdvdWxkbid0IHN0b3AgdHVybmluZyB0aGluZ3Mgb2ZmLCBidXQganVzdCBwcm9jZWVkLg0KPj4g
VGhlIGNhbGxlciB3aWxsIGlnbm9yZSB0aGUgZXJyb3IgaW4gdGhhdCBjYXNlIGFueXdheS4gVGhp
cyBjaGFuZ2VzIHdpdGggdGhlDQo+PiBwYXRjaC4NCj4gDQo+IEFncmVlZCwgSSB0aGluayBpdCdz
IGJlc3QgdG8gY29udGludWUgaW5zdGVhZCBvZiBiYWlsaW5nIG91dCBhcyB3ZSdyZQ0KPiBpbiBh
IHBvd2VyLW9mZiBwYXRoDQo+IA0KPj4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBG
cnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQo+Pj4gQ2hhbmdlLUlkOiBJMTJkYjY3YzQx
NmMzZDYzZWFkZWU0MDBhM2M4OWFhZjQ4YzViMTQ2OQ0KPj4NCj4+IFRoaXMgd2FzIHByb2JhYmx5
IG5vdCBpbnRlbmRlZCB0byBiZSBoZXJlLg0KPj4NCj4+PiAtLS0NCj4+PiAgIGRyaXZlcnMvbWVk
aWEvaTJjL292NTY0MC5jIHwgMTcgKysrKysrLS0tLS0tLS0tLS0NCj4+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQw
LmMNCj4+PiBpbmRleCA4ZDAyNTRkLi5mMzRlNjJlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMv
bWVkaWEvaTJjL292NTY0MC5jDQo+Pj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMN
Cj4+PiBAQCAtMTk0MCwxNCArMTk0MCw2IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9wb3dlcl9t
aXBpKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+Pj4gICB7DQo+Pj4gICAJ
aW50IHJldDsNCj4+Pg0KPj4+IC0JaWYgKCFvbikgew0KPj4+IC0JCS8qIFJlc2V0IE1JUEkgYnVz
IHNldHRpbmdzIHRvIHRoZWlyIGRlZmF1bHQgdmFsdWVzLiAqLw0KPj4+IC0JCW92NTY0MF93cml0
ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0lPX01JUElfQ1RSTDAwLCAweDU4KTsNCj4+PiAtCQlv
djU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19NSVBJX0NUUkwwMCwgMHgwNCk7DQo+
Pj4gLQkJb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfUEFEX09VVFBVVDAwLCAw
eDAwKTsNCj4+PiAtCQlyZXR1cm4gMDsNCj4+PiAtCX0NCj4+PiAtDQo+Pj4gICAJLyoNCj4+PiAg
IAkgKiBQb3dlciB1cCBNSVBJIEhTIFR4IGFuZCBMUyBSeDsgMiBkYXRhIGxhbmVzIG1vZGUNCj4+
PiAgIAkgKg0KPj4+IEBAIC0xOTU4LDcgKzE5NTAsOCBAQCBzdGF0aWMgaW50IG92NTY0MF9zZXRf
cG93ZXJfbWlwaShzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4+ICAgCSAq
IFszXSA9IDAJOiBQb3dlciB1cCBNSVBJIExTIFJ4DQo+Pj4gICAJICogWzJdID0gMAk6IE1JUEkg
aW50ZXJmYWNlIGRpc2FibGVkDQo+Pj4gICAJICovDQo+Pj4gLQlyZXQgPSBvdjU2NDBfd3JpdGVf
cmVnKHNlbnNvciwgT1Y1NjQwX1JFR19JT19NSVBJX0NUUkwwMCwgMHg0MCk7DQo+Pj4gKwlyZXQg
PSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19JT19NSVBJX0NUUkwwMCwNCj4+
PiArCQkJICAgICAgIG9uID8gMHg0MCA6IDB4NTgpOw0KPj4+ICAgCWlmIChyZXQpDQo+Pj4gICAJ
CXJldHVybiByZXQ7DQo+Pj4NCj4+PiBAQCAtMTk2OSw3ICsxOTYyLDggQEAgc3RhdGljIGludCBv
djU2NDBfc2V0X3Bvd2VyX21pcGkoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikN
Cj4+PiAgIAkgKiBbNV0gPSAxCTogR2F0ZSBjbG9jayB3aGVuICdubyBwYWNrZXRzJw0KPj4+ICAg
CSAqIFsyXSA9IDEJOiBNSVBJIGJ1cyBpbiBMUDExIHdoZW4gJ25vIHBhY2tldHMnDQo+Pj4gICAJ
ICovDQo+Pj4gLQlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19NSVBJ
X0NUUkwwMCwgMHgyNCk7DQo+Pj4gKwlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1
NjQwX1JFR19NSVBJX0NUUkwwMCwNCj4+PiArCQkJICAgICAgIG9uID8gMHgyNCA6IDB4MDQpOw0K
Pj4+ICAgCWlmIChyZXQpDQo+Pj4gICAJCXJldHVybiByZXQ7DQo+Pj4NCj4+PiBAQCAtMTk4MSw3
ICsxOTc1LDggQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX21pcGkoc3RydWN0IG92NTY0
MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4+PiAgIAkgKiBbNV0gPSAxCTogTUlQSSBkYXRhIGxh
bmUgMSBpbiBMUDExIHdoZW4gJ3NsZWVwaW5nJw0KPj4+ICAgCSAqIFs0XSA9IDEJOiBNSVBJIGNs
b2NrIGxhbmUgaW4gTFAxMSB3aGVuICdzbGVlcGluZycNCj4+PiAgIAkgKi8NCj4+PiAtCXJldCA9
IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVQwMCwgMHg3MCk7
DQo+Pj4gKwlyZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QQURfT1VU
UFVUMDAsDQo+Pj4gKwkJCSAgICAgICBvbiA/IDB4NzAgOiAweDAwKTsNCj4+PiAgIAlpZiAocmV0
KQ0KPj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4+DQo+Pg0KPj4gLS0NCj4+IEtpbmQgcmVnYXJkcywN
Cj4+DQo+PiBTYWthcmkgQWlsdXM=
