Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B728CA80
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 10:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403993AbgJMIsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 04:48:52 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21020 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2403990AbgJMIsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 04:48:52 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09D8g6iq024216;
        Tue, 13 Oct 2020 10:48:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xOgaCDjt5T9hXv05hEcKe/2aDU5DihgAgwhe86Z/AUk=;
 b=wlbeQ9sv+Af7UNIVEpmXkJT7xOAi5nobEKaeEaMqpEGrdx1bFygtKhlPjJ3N9J6UbJWh
 NFhJNeWNdd7HdO3S8e4sNAJxilhAS5oLTiAsIRDeD6MaZncF90aJOLsDuOgEUpymo50D
 3PPy2DRewrZGrkxm4dk3kFmjA6Mbo/fSyNXyHSalCH5I/LPWzsKNJTDYmJp/Y6d/zOKo
 PHpH6TObEe0AwvA2XEhPSSmEyeuCiyVLifoC2bUE1kl/pHS2qhKlxeQplVb8EgCuYwp6
 hF0pB38hGaYrnd1oaPaEuCJTE1Uk2ZcFIc8iUisywWTfX0s4S/9yhneqFOOQ3QSkbmSf xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34353w60pe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 13 Oct 2020 10:48:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40344100034;
        Tue, 13 Oct 2020 10:48:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F6832AA9DB;
        Tue, 13 Oct 2020 10:48:42 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 10:48:41 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 10:48:41 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH v3] media: ov5640: add support of 160x120 resolution
Thread-Topic: [PATCH v3] media: ov5640: add support of 160x120 resolution
Thread-Index: AQHWnU0iMA+Pbyv+dEe39LLhQPAwvKmT/q0AgAEgfQA=
Date:   Tue, 13 Oct 2020 08:48:41 +0000
Message-ID: <aeb90bb7-d0b4-0620-c7ae-d1ba2f4186a3@st.com>
References: <1602145756-4354-1-git-send-email-hugues.fruchet@st.com>
 <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
In-Reply-To: <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
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
Content-ID: <A6C3D5CB7729E543A95D706F499671C2@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-13_02:2020-10-13,2020-10-13 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQpPbiAxMC8xMi8yMCA1OjM2IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+
IEhpIEh1Z3VlcywNCj4gDQo+IE9uIFRodSwgT2N0IDA4LCAyMDIwIGF0IDEwOjI5OjE2QU0gKzAy
MDAsIEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQgb2YgMTYweDEyMCByZXNv
bHV0aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1
Y2hldEBzdC5jb20+DQo+IA0KPiBMb29rcyBnb29kLCB0aGUgbmV3IG1vZGUgd29ya3MgZm9yIG1l
IG9uIGEgQ1NJLTIgMiBsYW5lcyBzZXR1cA0KPiANCj4gVGVzdGVkLWJ5OiBKYWNvcG8gTW9uZGkg
PGphY29wbytyZW5lc2FzQGptb25kaS5vcmc+DQo+IA0KPj4gLS0tDQo+PiB2ZXJzaW9uIDM6DQo+
PiAgICAtIGZpeCB3cm9uZyBhcnJheSBhZmZlY3RhdGlvbg0KPj4NCj4+IHZlcnNpb24gMjoNCj4+
ICAgIC0gZml4IG1pc3NpbmcgbWF4IGZyYW1lcmF0ZQ0KPj4NCj4+ICAgZHJpdmVycy9tZWRpYS9p
MmMvb3Y1NjQwLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4gICAxIGZpbGUg
Y2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0
MC5jDQo+PiBpbmRleCA4ZDAyNTRkLi40MGQ2OTgzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9pMmMvb3Y1NjQwLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+
PiBAQCAtOTgsNyArOTgsOCBAQA0KPj4gICAjZGVmaW5lIE9WNTY0MF9SRUdfQVZHX1JFQURPVVQJ
CTB4NTZhMQ0KPj4NCj4+ICAgZW51bSBvdjU2NDBfbW9kZV9pZCB7DQo+PiAtCU9WNTY0MF9NT0RF
X1FDSUZfMTc2XzE0NCA9IDAsDQo+PiArCU9WNTY0MF9NT0RFX1FRVkdBXzE2MF8xMjAgPSAwLA0K
Pj4gKwlPVjU2NDBfTU9ERV9RQ0lGXzE3Nl8xNDQsDQo+PiAgIAlPVjU2NDBfTU9ERV9RVkdBXzMy
MF8yNDAsDQo+PiAgIAlPVjU2NDBfTU9ERV9WR0FfNjQwXzQ4MCwNCj4+ICAgCU9WNTY0MF9NT0RF
X05UU0NfNzIwXzQ4MCwNCj4+IEBAIC00MTYsNiArNDE3LDI0IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcmVnX3ZhbHVlIG92NTY0MF9zZXR0aW5nX1FWR0FfMzIwXzI0MFtdID0gew0KPj4gICAJezB4
MzgyNCwgMHgwMiwgMCwgMH0sIHsweDUwMDEsIDB4YTMsIDAsIDB9LA0KPj4gICB9Ow0KPj4NCj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ192YWx1ZSBvdjU2NDBfc2V0dGluZ19RUVZHQV8xNjBf
MTIwW10gPSB7DQo+PiArCXsweDNjMDcsIDB4MDgsIDAsIDB9LA0KPj4gKwl7MHgzYzA5LCAweDFj
LCAwLCAwfSwgezB4M2MwYSwgMHg5YywgMCwgMH0sIHsweDNjMGIsIDB4NDAsIDAsIDB9LA0KPj4g
Kwl7MHgzODE0LCAweDMxLCAwLCAwfSwNCj4+ICsJezB4MzgxNSwgMHgzMSwgMCwgMH0sIHsweDM4
MDAsIDB4MDAsIDAsIDB9LCB7MHgzODAxLCAweDAwLCAwLCAwfSwNCj4+ICsJezB4MzgwMiwgMHgw
MCwgMCwgMH0sIHsweDM4MDMsIDB4MDQsIDAsIDB9LCB7MHgzODA0LCAweDBhLCAwLCAwfSwNCj4+
ICsJezB4MzgwNSwgMHgzZiwgMCwgMH0sIHsweDM4MDYsIDB4MDcsIDAsIDB9LCB7MHgzODA3LCAw
eDliLCAwLCAwfSwNCj4+ICsJezB4MzgxMCwgMHgwMCwgMCwgMH0sDQo+PiArCXsweDM4MTEsIDB4
MTAsIDAsIDB9LCB7MHgzODEyLCAweDAwLCAwLCAwfSwgezB4MzgxMywgMHgwNiwgMCwgMH0sDQo+
PiArCXsweDM2MTgsIDB4MDAsIDAsIDB9LCB7MHgzNjEyLCAweDI5LCAwLCAwfSwgezB4MzcwOCwg
MHg2NCwgMCwgMH0sDQo+PiArCXsweDM3MDksIDB4NTIsIDAsIDB9LCB7MHgzNzBjLCAweDAzLCAw
LCAwfSwgezB4M2EwMiwgMHgwMywgMCwgMH0sDQo+PiArCXsweDNhMDMsIDB4ZDgsIDAsIDB9LCB7
MHgzYTA4LCAweDAxLCAwLCAwfSwgezB4M2EwOSwgMHgyNywgMCwgMH0sDQo+PiArCXsweDNhMGEs
IDB4MDAsIDAsIDB9LCB7MHgzYTBiLCAweGY2LCAwLCAwfSwgezB4M2EwZSwgMHgwMywgMCwgMH0s
DQo+PiArCXsweDNhMGQsIDB4MDQsIDAsIDB9LCB7MHgzYTE0LCAweDAzLCAwLCAwfSwgezB4M2Ex
NSwgMHhkOCwgMCwgMH0sDQo+PiArCXsweDQwMDEsIDB4MDIsIDAsIDB9LCB7MHg0MDA0LCAweDAy
LCAwLCAwfSwNCj4+ICsJezB4NDQwNywgMHgwNCwgMCwgMH0sIHsweDUwMDEsIDB4YTMsIDAsIDB9
LA0KPj4gK307DQo+PiArDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX3ZhbHVlIG92NTY0
MF9zZXR0aW5nX1FDSUZfMTc2XzE0NFtdID0gew0KPj4gICAJezB4M2MwNywgMHgwOCwgMCwgMH0s
DQo+PiAgIAl7MHgzYzA5LCAweDFjLCAwLCAwfSwgezB4M2MwYSwgMHg5YywgMCwgMH0sIHsweDNj
MGIsIDB4NDAsIDAsIDB9LA0KPj4gQEAgLTU1Miw2ICs1NzEsMTEgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBvdjU2NDBfbW9kZV9pbmZvIG92NTY0MF9tb2RlX2luaXRfZGF0YSA9IHsNCj4+DQo+PiAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3Y1NjQwX21vZGVfaW5mbw0KPj4gICBvdjU2NDBfbW9kZV9k
YXRhW09WNTY0MF9OVU1fTU9ERVNdID0gew0KPj4gKwl7T1Y1NjQwX01PREVfUVFWR0FfMTYwXzEy
MCwgU1VCU0FNUExJTkcsDQo+PiArCSAxNjAsIDE4OTYsIDEyMCwgOTg0LA0KPiANCj4gVGhlc2Ug
dmFsdWVzIGRvIG5vdCBtYXRjaCB3aGF0J3MgYWN0dWFsbHkgYXBwbGllZCBvbiB0aGUgc2Vuc29y
LCBidXQNCj4gdGhpcyBpcyBub3Qgb25seSByZWxhdGVkIHRvIHRoaXMgcGF0Y2guDQo+IA0KPiBT
ZWUgZmY2NmVhM2EtYmQyZS05YmQ2LTg5NGMtYmYzNzJkZTY5YTMxQHRpLmNvbQ0KPiBJIHNob3Vs
ZCB0cnkgdG8gcmUtc3VibWl0IFRvbWkncyBwYXRjaCBhbmQgdGhlIG9uLXRvcCBjbG9jayByZXdv
cmsuDQoNClRoYW5rcyBKYWNvcG8sIGJ1dCB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCBsaW5rIGFi
b3ZlIGFib3V0IFRvbWkncyBwYXRjaC4NCg0KPiANCj4gWW91IGhhdmUgYSBDU0ktMiBzZXR1cCB0
b28sIHJpZ2h0ID8NClllcyBJIGhhdmUsIGl0J3MgYW4gQXZlbmdlciA5NmJvYXJkIHJ1bm5pbmcg
U1RNMzJNUDEgJiBhbiBTVCBNSVBJRDAyIA0KYnJpZGdlIHdpdGggRDMgZW5naW5lZXJpbmcgT1Y1
NjQwIENTSS0yIG1lenphbmluZS4NCg0KPiANCj4gVGhhbmtzDQo+ICAgIGoNCj4gDQo+PiArCSBv
djU2NDBfc2V0dGluZ19RUVZHQV8xNjBfMTIwLA0KPj4gKwkgQVJSQVlfU0laRShvdjU2NDBfc2V0
dGluZ19RUVZHQV8xNjBfMTIwKSwNCj4+ICsJIE9WNTY0MF8zMF9GUFN9LA0KPj4gICAJe09WNTY0
MF9NT0RFX1FDSUZfMTc2XzE0NCwgU1VCU0FNUExJTkcsDQo+PiAgIAkgMTc2LCAxODk2LCAxNDQs
IDk4NCwNCj4+ICAgCSBvdjU2NDBfc2V0dGluZ19RQ0lGXzE3Nl8xNDQsDQo+PiAtLQ0KPj4gMi43
LjQNCj4+DQoNCkJSLA0KSHVndWVzLg==
