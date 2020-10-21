Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76039294E9B
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 16:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443460AbgJUOY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 10:24:29 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:31510 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2442899AbgJUOY2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 10:24:28 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09LEM35R032420;
        Wed, 21 Oct 2020 16:24:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5W8utT3kmuoZEHHu3EI7BfGuu0kcDg/mhhNgyncNGJI=;
 b=CpP1lgYm4JjMnhSKHGz7Ip6Luy+rpnXqLb7o592JjyCPCh9Wdhd4JgHAFVCggdudoLlU
 jhv4fG0v3X3OeVkXlY8snXVsv1QtA2L7+ulf7qxb8pkyJdy4MHtLTLDtmr7p1m4BSo59
 TJ7anUs0r1npmkFWuCV4/kqQx9IHV2oUaip1u5Kqg9cRPOkADmrM2+EyPnWyeOv9vDpr
 4eH2Hqdhfs5AUcegDmGiLtUYX81/x6vc3Oc+xdW4jFWrtuIjSP1ICIpE8QT7ScDyJwcV
 SMZKs5dwXZzxdSMGYk9Sk0aUjeN945n1YbwAbs73gQ7X+5Y1EY6VjCoSHBZqF19KtGVE ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34apedg3np-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 21 Oct 2020 16:24:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29BE410002A;
        Wed, 21 Oct 2020 16:24:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF1082C758D;
        Wed, 21 Oct 2020 16:24:08 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 16:24:08 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 16:24:08 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Thread-Topic: [PATCH v4 2/2] media: dt-bindings: media: st,stm32-dcmi: Add
 support of BT656
Thread-Index: AQHWp6o+yOOEjcdb0U+f2PjTKsCmiqmh+tEA
Date:   Wed, 21 Oct 2020 14:24:08 +0000
Message-ID: <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
In-Reply-To: <20201021130033.GI2703@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="utf-8"
Content-ID: <333325C122772E4489157C905ABF9912@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-21_06:2020-10-20,2020-10-21 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiAxMC8yMS8yMCAzOjAwIFBNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+
IEhpIEh1Z3VlcywNCj4gDQo+IE9uIFR1ZSwgT2N0IDIwLCAyMDIwIGF0IDEyOjE0OjQ5UE0gKzAy
MDAsIEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gQWRkIHN1cHBvcnQgb2YgQlQ2NTYgcGFyYWxs
ZWwgYnVzIG1vZGUgaW4gRENNSS4NCj4+IFRoaXMgbW9kZSBpcyBlbmFibGVkIHdoZW4gaHN5bmMt
YWN0aXZlICYgdnN5bmMtYWN0aXZlDQo+PiBmaWVsZHMgYXJlIG5vdCBzcGVjaWZpZWQuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT4N
Cj4+IC0tLQ0KPj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21p
LnlhbWwgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDMwIGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRjbWkueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwNCj4+IGluZGV4IDNm
ZTc3OGMuLjFlZTUyMWEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sDQo+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sDQo+PiBAQCAtNDQs
NiArNDQsMzYgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAgYmluZGluZ3MgZGVmaW5lZCBpbg0K
Pj4gICAgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8t
aW50ZXJmYWNlcy50eHQuDQo+PiAgIA0KPj4gKyAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgIGVu
ZHBvaW50Og0KPj4gKyAgICAgICAgdHlwZTogb2JqZWN0DQo+PiArDQo+PiArICAgICAgICBwcm9w
ZXJ0aWVzOg0KPj4gKyAgICAgICAgICBidXMtd2lkdGg6IHRydWUNCj4+ICsNCj4+ICsgICAgICAg
ICAgaHN5bmMtYWN0aXZlOg0KPj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gKyAgICAg
ICAgICAgICAgSWYgYm90aCBIU1lOQyBhbmQgVlNZTkMgcG9sYXJpdGllcyBhcmUgbm90IHNwZWNp
ZmllZCwgQlQ2NTYNCj4+ICsgICAgICAgICAgICAgIGVtYmVkZGVkIHN5bmNocm9uaXphdGlvbiBp
cyBzZWxlY3RlZC4NCj4+ICsgICAgICAgICAgICBkZWZhdWx0OiAwDQo+PiArDQo+PiArICAgICAg
ICAgIHZzeW5jLWFjdGl2ZToNCj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4+ICsgICAg
ICAgICAgICAgIElmIGJvdGggSFNZTkMgYW5kIFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVj
aWZpZWQsIEJUNjU2DQo+PiArICAgICAgICAgICAgICBlbWJlZGRlZCBzeW5jaHJvbml6YXRpb24g
aXMgc2VsZWN0ZWQuDQo+PiArICAgICAgICAgICAgZGVmYXVsdDogMA0KPiANCj4gU2hvdWxkIEkg
dW5kZXJzdGFuZCB0aGlzIGFzIGlmIHRoZSBwb2xhcml0aWVzIHdlcmUgbm90IHNwZWNpZmllZCwg
QlQuNjU2DQo+IHdpbGwgYmUgdXNlZD8NCg0KWWVzLCB0aGlzIGlzIHdoYXQgaXMgZG9jdW1lbnRl
ZCBpbiB2aWRlby1pbnRlcmZhY2VzLnR4dDoNCiINCiAgIE5vdGUsIHRoYXQgaWYgSFNZTkMgYW5k
IFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVjaWZpZWQsIGVtYmVkZGVkDQogICBzeW5jaHJv
bml6YXRpb24gbWF5IGJlIHJlcXVpcmVkLCB3aGVyZSBzdXBwb3J0ZWQuDQoiDQphbmQNCiINCgkJ
CQkvKiBJZiBoc3luYy1hY3RpdmUvdnN5bmMtYWN0aXZlIGFyZSBtaXNzaW5nLA0KCQkJCSAgIGVt
YmVkZGVkIEJULjY1NiBzeW5jIGlzIHVzZWQgKi8NCgkJCQloc3luYy1hY3RpdmUgPSA8MD47CS8q
IEFjdGl2ZSBsb3cgKi8NCgkJCQl2c3luYy1hY3RpdmUgPSA8MD47CS8qIEFjdGl2ZSBsb3cgKi8N
CiINCmFuZCBJIGZvdW5kIGFsc28gdGhpcyBpbiANCkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZWRpYS9yZW5lc2FzLHZpbi55YW1sDQoiDQogICAgICAgICAgIGhzeW5jLWFjdGl2
ZToNCiAgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCiAgICAgICAgICAgICAgIElmIGJvdGggSFNZ
TkMgYW5kIFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVjaWZpZWQsIA0KZW1iZWRkZWQNCiAg
ICAgICAgICAgICAgIHN5bmNocm9uaXphdGlvbiBpcyBzZWxlY3RlZC4NCiAgICAgICAgICAgICBk
ZWZhdWx0OiAxDQoNCiAgICAgICAgICAgdnN5bmMtYWN0aXZlOg0KICAgICAgICAgICAgIGRlc2Ny
aXB0aW9uOg0KICAgICAgICAgICAgICAgSWYgYm90aCBIU1lOQyBhbmQgVlNZTkMgcG9sYXJpdGll
cyBhcmUgbm90IHNwZWNpZmllZCwgDQplbWJlZGRlZA0KICAgICAgICAgICAgICAgc3luY2hyb25p
emF0aW9uIGlzIHNlbGVjdGVkLg0KICAgICAgICAgICAgIGRlZmF1bHQ6IDENCiINCg0KSW4gdGhl
IG90aGVyIGhhbmQgSSd2ZSBmb3VuZCBmZXcgb2NjdXJlbmNlcyBvZiAiYnVzLXR5cGUiIA0KKG1h
cnZlbGwsbW1wMi1jY2ljLnlhbWwpLCBpdCBpcyB3aHkgSSBhc2tlZCB5b3UgaWYgImJ1cy10eXBl
IiBpcyB0aGUgbmV3IA0Kd2F5IHRvIGdvIHZlcnN1cyBwcmV2aW91cyB3YXkgdG8gc2lnbmFsIEJU
NjU2ICh3aXRob3V0IGhzeW5jL3ZzeW5jKSA/DQpBcyBleHBsYWluZWQgcHJldmlvdXNseSwgSSBw
cmVmZXIgdGhpcyBsYXN0IHdheSBmb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCg0KDQpUaGUg
YmluZGluZ3MgcHJldmlvdXNseSBkb2N1bWVudGVkIEJULjYwMSAocGFyYWxsZWwpIG9ubHksIHNv
DQo+IGl0IHdhcyBzb21ld2hhdCBhbWJpZ2lvdXMgdG8gYmVnaW4gd2l0aC4gSXMgdGhlcmUgYSBy
aXNrIG9mIGludGVycHJldGluZw0KPiBvbGQgQlQuNjAxIGJpbmRpbmdzIGFzIEJULjY1Nj8NCkkg
ZG9uJ3QgdGhpbmsgc28uDQoNCldpdGggYnVzLXR5cGUgcHJvcGVydHksIEkgYmVsaWV2ZSB5b3Ug
Y291bGQNCj4gYXZvaWQgYXQgbGVhc3QgdGhhdCByaXNrLg0KeWVzIGJ1dCBhcyBleHBsYWluZWQs
IEknbGwgcHJlZmVyIG5vdCB0byBhbWVuZCBjdXJyZW50IGJvYXJkcyBkZXZpY2UgDQp0cmVlIGZp
bGVzLg0KDQo+IA0KPiBBbHNvIG5vdCBzcGVjaWZ5aW5nIGF0IGxlYXN0IG9uZSBvZiB0aGUgZGVm
YXVsdCB2YWx1ZXMgbGVhZHMgdG8gQlQuNjU2DQo+IHdpdGhvdXQgYnVzLXR5cGUuIFRoYXQgY291
bGQgYmUgYWRkcmVzc2VkIGJ5IHJlbW92aW5nIHRoZSBkZWZhdWx0cy4NCj4gDQpJJ20gbmV3IHRv
IHlhbWwsIEkndmUgdGFrZW4gdGhhdCBmcm9tIHJlbmVzYXMsdmluLnlhbWwuIFNob3VsZCBJIGp1
c3QgDQpkcm9wIHRoZSAiZGVmYXVsdDogMSIgbGluZXMgPw0KDQo+PiArDQo+PiArICAgICAgICAg
IHBjbGstc2FtcGxlOiB0cnVlDQo+PiArDQo+PiArICAgICAgICAgIHJlbW90ZS1lbmRwb2ludDog
dHJ1ZQ0KPj4gKw0KPj4gKyAgICAgICAgcmVxdWlyZWQ6DQo+PiArICAgICAgICAgIC0gcmVtb3Rl
LWVuZHBvaW50DQo+PiArDQo+PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4+ICsNCj4+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiAgIHJl
cXVpcmVkOg0KPj4gICAgIC0gY29tcGF0aWJsZQ0KPj4gICAgIC0gcmVnDQo+IA0KDQpCUiwNCkh1
Z3Vlcy4=
