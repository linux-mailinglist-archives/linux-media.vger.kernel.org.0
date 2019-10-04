Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6866CB9E2
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 14:07:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfJDMH2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 08:07:28 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1967 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726002AbfJDMH2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Oct 2019 08:07:28 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x94C6bWt002807;
        Fri, 4 Oct 2019 14:07:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=9m5QvHje7gSHUoKFWE+CtI72E0kPziiwi8tkIKmKGKQ=;
 b=dW0P/B3penQ+z5oVNoqmsOKp2Wxu6VlxtknN6/ZmuvxadCL69o84FhvPyynWiDrxRVYq
 boFpiWHq8RvkVwcJgmmG3fMIZDnZDF2tETu+GCwsNpH2TiVVRFbzA9ebbHaIBabp9N1l
 mHpW0jV2v8g03YMHmIXguGWFHgTZnKGcp46EcsqXPnCQCMKZWhN4RDlfLgvmKSYZ+D9X
 fblMHZAwjE+a2dhhGVQOmojEStyHFecI0nPkTXtx/QuOQ+RT5ny+kBkdVhUzzn69NvVU
 dzwcAOesEVA/z5XUAAG4+/gvZ1QOlbGsJjIf+Y28JrJ9plVYx9nPOf+YVxWdrPVhwP6A iQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2v9w9watb7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Oct 2019 14:07:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BFD7100038;
        Fri,  4 Oct 2019 14:07:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45CBA2BDA6E;
        Fri,  4 Oct 2019 14:07:15 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 4 Oct
 2019 14:07:14 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 4 Oct 2019 14:07:14 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "Yannick FERTRE" <yannick.fertre@st.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: media: Convert stm32 cec bindings to
 json-schema
Thread-Topic: [PATCH] dt-bindings: media: Convert stm32 cec bindings to
 json-schema
Thread-Index: AQHVeTQQzAxXsEKUOU6CWUsiOtV7DKdKRJUA
Date:   Fri, 4 Oct 2019 12:07:14 +0000
Message-ID: <c74bae8a-e043-1484-2cd1-a644ad9b164d@st.com>
References: <20191002151410.15306-1-benjamin.gaignard@st.com>
In-Reply-To: <20191002151410.15306-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <16574661833B034C85DD4354A28F4483@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-04_06:2019-10-03,2019-10-04 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KyBIYW5zDQoNCk9uIDEwLzIvMTkgNToxNCBQTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+
IENvbnZlcnQgdGhlIFNUTTMyIGNlYyBiaW5kaW5nIHRvIERUIHNjaGVtYSBmb3JtYXQgdXNpbmcg
anNvbi1zY2hlbWENCj4NCj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmph
bWluLmdhaWduYXJkQHN0LmNvbT4NCj4gLS0tDQo+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvc3Qsc3RtMzItY2VjLnR4dCAgICAgfCAxOSAtLS0tLS0tLQ0KPiAgIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWNlYy55YW1sICAgIHwgNTcgKysrKysrKysrKysr
KysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgMTkgZGVs
ZXRpb25zKC0pDQo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1jZWMudHh0DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1jZWMueWFt
bA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3N0LHN0bTMyLWNlYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvc3Qsc3RtMzItY2VjLnR4dA0KPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5k
ZXggNmJlMjM4MWMxODBkLi4wMDAwMDAwMDAwMDANCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWNlYy50eHQNCj4gKysrIC9kZXYvbnVsbA0K
PiBAQCAtMSwxOSArMCwwIEBADQo+IC1TVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgQ0VDIGRyaXZl
cg0KPiAtDQo+IC1SZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPiAtIC0gY29tcGF0aWJsZSA6IHZhbHVl
IHNob3VsZCBiZSAic3Qsc3RtMzItY2VjIg0KPiAtIC0gcmVnIDogUGh5c2ljYWwgYmFzZSBhZGRy
ZXNzIG9mIHRoZSBJUCByZWdpc3RlcnMgYW5kIGxlbmd0aCBvZiBtZW1vcnkNCj4gLQkgbWFwcGVk
IHJlZ2lvbi4NCj4gLSAtIGNsb2NrcyA6IGZyb20gY29tbW9uIGNsb2NrIGJpbmRpbmc6IGhhbmRs
ZSB0byBDRUMgY2xvY2tzDQo+IC0gLSBjbG9jay1uYW1lcyA6IGZyb20gY29tbW9uIGNsb2NrIGJp
bmRpbmc6IG11c3QgYmUgImNlYyIgYW5kICJoZG1pLWNlYyIuDQo+IC0gLSBpbnRlcnJ1cHRzIDog
Q0VDIGludGVycnVwdCBudW1iZXIgdG8gdGhlIENQVS4NCj4gLQ0KPiAtRXhhbXBsZSBmb3Igc3Rt
MzJmNzQ2Og0KPiAtDQo+IC1jZWM6IGNlY0A0MDAwNmMwMCB7DQo+IC0JY29tcGF0aWJsZSA9ICJz
dCxzdG0zMi1jZWMiOw0KPiAtCXJlZyA9IDwweDQwMDA2QzAwIDB4NDAwPjsNCj4gLQlpbnRlcnJ1
cHRzID0gPDk0PjsNCj4gLQljbG9ja3MgPSA8JnJjYyAwIFNUTTMyRjdfQVBCMV9DTE9DSyhDRUMp
PiwgPCZyY2MgMSBDTEtfSERNSV9DRUM+Ow0KPiAtCWNsb2NrLW5hbWVzID0gImNlYyIsICJoZG1p
LWNlYyI7DQo+IC19Ow0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL3N0LHN0bTMyLWNlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWNlYy55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzk5MTQ0MTA3MTg1DQo+IC0tLSAvZGV2L251bGwNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWNl
Yy55YW1sDQo+IEBAIC0wLDAgKzEsNTcgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCj4gKyVZQU1MIDEuMg0KPiArLS0tDQo+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL21lZGlhL3N0LHN0bTMyLWNlYy55YW1sIw0KPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ICsNCj4gK3RpdGxlOiBT
VE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgQ0VDIGJpbmRpbmdzDQo+ICsNCj4gK21haW50YWluZXJz
Og0KPiArICAtIEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+
ICsgIC0gWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4gKw0KPiArcHJv
cGVydGllczoNCj4gKyAgY29tcGF0aWJsZToNCj4gKyAgICBjb25zdDogc3Qsc3RtMzItY2VjDQo+
ICsNCj4gKyAgcmVnOg0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsNCj4gKyAgaW50ZXJydXB0czoN
Cj4gKyAgICBtYXhJdGVtczogMQ0KPiArDQo+ICsgIGNsb2NrczoNCj4gKyAgICBpdGVtczoNCj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IE1vZHVsZSBDbG9jaw0KPiArICAgICAgLSBkZXNjcmlwdGlv
bjogQnVzIENsb2NrDQo+ICsNCj4gKyAgY2xvY2stbmFtZXM6DQo+ICsgICAgaXRlbXM6DQo+ICsg
ICAgICAtIGNvbnN0OiBjZWMNCj4gKyAgICAgIC0gY29uc3Q6IGhkbWktY2VjDQo+ICsNCj4gKyAg
cGluY3RybC1uYW1lczogdHJ1ZQ0KPiArDQo+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4gKyAgIl5w
aW5jdHJsLVswLTldKyQiOiB0cnVlDQo+ICsNCj4gK3JlcXVpcmVkOg0KPiArICAtIGNvbXBhdGli
bGUNCj4gKyAgLSByZWcNCj4gKyAgLSBpbnRlcnJ1cHRzDQo+ICsgIC0gY2xvY2tzDQo+ICsgIC0g
Y2xvY2stbmFtZXMNCj4gKw0KPiArZXhhbXBsZXM6DQo+ICsgIC0gfA0KPiArICAgICNpbmNsdWRl
IDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+DQo+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3N0bTMybXAxLWNsa3MuaD4NCj4gKyAgICBjZWM6IGNl
Y0A0MDAwNmMwMCB7DQo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItY2VjIjsNCj4g
KyAgICAgICAgcmVnID0gPDB4NDAwMDZjMDAgMHg0MDA+Ow0KPiArICAgICAgICBpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgOTQgSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsgICAgICAgIGNsb2NrcyA9
IDwmcmNjIENFQ19LPiwgPCZjbGtfbHNlPjsNCj4gKyAgICAgICAgY2xvY2stbmFtZXMgPSAiY2Vj
IiwgImhkbWktY2VjIjsNCj4gKyAgICB9Ow0KPiArDQo+ICsuLi4=
