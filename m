Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD38296136
	for <lists+linux-media@lfdr.de>; Thu, 22 Oct 2020 16:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504427AbgJVO5i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Oct 2020 10:57:38 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7782 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504103AbgJVO5h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Oct 2020 10:57:37 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09MEbIXu028547;
        Thu, 22 Oct 2020 16:56:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BgPhbdVYlDxny8ooH2Pb459HocXmAZYh2XHNIPCGBRM=;
 b=zDu/u4116QgnTcyvRbmk9ZkDAg0EUALgwD3JsF+tr/WMEZrREP2eSQ3CKs6tArB6o3AT
 ckM4pFPSzILSpaIDoVyYOnNCekSD8ZTq+EUqcC/9RBkOZ6A/r4J4Ke0cj1lS6ez8ACO9
 r9PV5pJtjjo2HzKiMhLsAS0E8E2gAxceVg6WHps/hcehN+ayaA+jhKrYHsyYwtRAmEZo
 0HWUNiYpgUFfSm1zSrswujh0BvqI6q/qwgAgIml2Ld59ZLhBu9lqKzGPqpFiYTxRMAqj
 MPjh0LYUeFmnG2EsfWbXtuqbe8yihlUCip1jyM3gnSsNdA2LYY3lBsAdCUjmEX0Gv0I4 BQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34apeeqbs6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 22 Oct 2020 16:56:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D533C10002A;
        Thu, 22 Oct 2020 16:56:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B883A2C7115;
        Thu, 22 Oct 2020 16:56:17 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 16:56:17 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 22 Oct 2020 16:56:17 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>
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
Thread-Index: AQHWp6o+yOOEjcdb0U+f2PjTKsCmiqmh+tEAgAB6DACAASFDAA==
Date:   Thu, 22 Oct 2020 14:56:17 +0000
Message-ID: <327ae9d5-8683-488f-7970-4983e2fec51d@st.com>
References: <1603188889-23664-1-git-send-email-hugues.fruchet@st.com>
 <1603188889-23664-3-git-send-email-hugues.fruchet@st.com>
 <20201021130033.GI2703@paasikivi.fi.intel.com>
 <657634eb-690a-53a6-2ac1-de3c06a1cec4@st.com>
 <20201021214058.GJ2703@paasikivi.fi.intel.com>
In-Reply-To: <20201021214058.GJ2703@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D97D13016BC89E40AD0D4EC4C251C049@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.737
 definitions=2020-10-22_10:2020-10-20,2020-10-22 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQorIEphY29wbyBmb3IgaGlzIHdvcmsgb24gb3Y3NzJ4IGJpbmRpbmcgcmVs
YXRlZCB0byBCVDY1Ng0KDQpPbiAxMC8yMS8yMCAxMTo0MCBQTSwgU2FrYXJpIEFpbHVzIHdyb3Rl
Og0KPiBIaSBIdWd1ZXMsDQo+IA0KPiBPbiBXZWQsIE9jdCAyMSwgMjAyMCBhdCAwMjoyNDowOFBN
ICswMDAwLCBIdWd1ZXMgRlJVQ0hFVCB3cm90ZToNCj4+IEhpIFNha2FyaSwNCj4+DQo+PiBPbiAx
MC8yMS8yMCAzOjAwIFBNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+Pj4gSGkgSHVndWVzLA0KPj4+
DQo+Pj4gT24gVHVlLCBPY3QgMjAsIDIwMjAgYXQgMTI6MTQ6NDlQTSArMDIwMCwgSHVndWVzIEZy
dWNoZXQgd3JvdGU6DQo+Pj4+IEFkZCBzdXBwb3J0IG9mIEJUNjU2IHBhcmFsbGVsIGJ1cyBtb2Rl
IGluIERDTUkuDQo+Pj4+IFRoaXMgbW9kZSBpcyBlbmFibGVkIHdoZW4gaHN5bmMtYWN0aXZlICYg
dnN5bmMtYWN0aXZlDQo+Pj4+IGZpZWxkcyBhcmUgbm90IHNwZWNpZmllZC4NCj4+Pj4NCj4+Pj4g
U2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT4NCj4+
Pj4gLS0tDQo+Pj4+ICAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRj
bWkueWFtbCAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRjbWkueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwNCj4+
Pj4gaW5kZXggM2ZlNzc4Yy4uMWVlNTIxYSAxMDA2NDQNCj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRjbWkueWFtbA0KPj4+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55
YW1sDQo+Pj4+IEBAIC00NCw2ICs0NCwzNiBAQCBwcm9wZXJ0aWVzOg0KPj4+PiAgICAgICAgICBi
aW5kaW5ncyBkZWZpbmVkIGluDQo+Pj4+ICAgICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dC4NCj4+Pj4gICAgDQo+Pj4+ICsg
ICAgcHJvcGVydGllczoNCj4+Pj4gKyAgICAgIGVuZHBvaW50Og0KPj4+PiArICAgICAgICB0eXBl
OiBvYmplY3QNCj4+Pj4gKw0KPj4+PiArICAgICAgICBwcm9wZXJ0aWVzOg0KPj4+PiArICAgICAg
ICAgIGJ1cy13aWR0aDogdHJ1ZQ0KPj4+PiArDQo+Pj4+ICsgICAgICAgICAgaHN5bmMtYWN0aXZl
Og0KPj4+PiArICAgICAgICAgICAgZGVzY3JpcHRpb246DQo+Pj4+ICsgICAgICAgICAgICAgIElm
IGJvdGggSFNZTkMgYW5kIFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVjaWZpZWQsIEJUNjU2
DQo+Pj4+ICsgICAgICAgICAgICAgIGVtYmVkZGVkIHN5bmNocm9uaXphdGlvbiBpcyBzZWxlY3Rl
ZC4NCj4+Pj4gKyAgICAgICAgICAgIGRlZmF1bHQ6IDANCj4+Pj4gKw0KPj4+PiArICAgICAgICAg
IHZzeW5jLWFjdGl2ZToNCj4+Pj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4+PiArICAg
ICAgICAgICAgICBJZiBib3RoIEhTWU5DIGFuZCBWU1lOQyBwb2xhcml0aWVzIGFyZSBub3Qgc3Bl
Y2lmaWVkLCBCVDY1Ng0KPj4+PiArICAgICAgICAgICAgICBlbWJlZGRlZCBzeW5jaHJvbml6YXRp
b24gaXMgc2VsZWN0ZWQuDQo+Pj4+ICsgICAgICAgICAgICBkZWZhdWx0OiAwDQo+Pj4NCj4+PiBT
aG91bGQgSSB1bmRlcnN0YW5kIHRoaXMgYXMgaWYgdGhlIHBvbGFyaXRpZXMgd2VyZSBub3Qgc3Bl
Y2lmaWVkLCBCVC42NTYNCj4+PiB3aWxsIGJlIHVzZWQ/DQo+Pg0KPj4gWWVzLCB0aGlzIGlzIHdo
YXQgaXMgZG9jdW1lbnRlZCBpbiB2aWRlby1pbnRlcmZhY2VzLnR4dDoNCj4+ICINCj4+ICAgICBO
b3RlLCB0aGF0IGlmIEhTWU5DIGFuZCBWU1lOQyBwb2xhcml0aWVzIGFyZSBub3Qgc3BlY2lmaWVk
LCBlbWJlZGRlZA0KPj4gICAgIHN5bmNocm9uaXphdGlvbiBtYXkgYmUgcmVxdWlyZWQsIHdoZXJl
IHN1cHBvcnRlZC4NCj4+ICINCj4+IGFuZA0KPj4gIg0KPj4gCQkJCS8qIElmIGhzeW5jLWFjdGl2
ZS92c3luYy1hY3RpdmUgYXJlIG1pc3NpbmcsDQo+PiAJCQkJICAgZW1iZWRkZWQgQlQuNjU2IHN5
bmMgaXMgdXNlZCAqLw0KPj4gCQkJCWhzeW5jLWFjdGl2ZSA9IDwwPjsJLyogQWN0aXZlIGxvdyAq
Lw0KPj4gCQkJCXZzeW5jLWFjdGl2ZSA9IDwwPjsJLyogQWN0aXZlIGxvdyAqLw0KPj4gIg0KPj4g
YW5kIEkgZm91bmQgYWxzbyB0aGlzIGluDQo+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvcmVuZXNhcyx2aW4ueWFtbA0KPj4gIg0KPj4gICAgICAgICAgICAgaHN5bmMt
YWN0aXZlOg0KPj4gICAgICAgICAgICAgICBkZXNjcmlwdGlvbjoNCj4+ICAgICAgICAgICAgICAg
ICBJZiBib3RoIEhTWU5DIGFuZCBWU1lOQyBwb2xhcml0aWVzIGFyZSBub3Qgc3BlY2lmaWVkLA0K
Pj4gZW1iZWRkZWQNCj4+ICAgICAgICAgICAgICAgICBzeW5jaHJvbml6YXRpb24gaXMgc2VsZWN0
ZWQuDQo+PiAgICAgICAgICAgICAgIGRlZmF1bHQ6IDENCj4+DQo+PiAgICAgICAgICAgICB2c3lu
Yy1hY3RpdmU6DQo+PiAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPj4gICAgICAgICAgICAg
ICAgIElmIGJvdGggSFNZTkMgYW5kIFZTWU5DIHBvbGFyaXRpZXMgYXJlIG5vdCBzcGVjaWZpZWQs
DQo+PiBlbWJlZGRlZA0KPj4gICAgICAgICAgICAgICAgIHN5bmNocm9uaXphdGlvbiBpcyBzZWxl
Y3RlZC4NCj4+ICAgICAgICAgICAgICAgZGVmYXVsdDogMQ0KPiANCj4gSGF2aW5nIHRoZSBkZWZh
dWx0cyBsZWFkcyB0byBzb21ld2hhdCB3ZWlyZCBiZWhhdmlvdXI6IHNwZWNpZnlpbmcgdGhlDQo+
IGRlZmF1bHQgdmFsdWUgb24gZWl0aGVyIHByb3BlcnR5IGNoYW5nZXMgdGhlIGJ1cyB0eXBlLg0K
PiANCj4+ICINCj4+DQo+PiBJbiB0aGUgb3RoZXIgaGFuZCBJJ3ZlIGZvdW5kIGZldyBvY2N1cmVu
Y2VzIG9mICJidXMtdHlwZSINCj4+IChtYXJ2ZWxsLG1tcDItY2NpYy55YW1sKSwgaXQgaXMgd2h5
IEkgYXNrZWQgeW91IGlmICJidXMtdHlwZSIgaXMgdGhlIG5ldw0KPj4gd2F5IHRvIGdvIHZlcnN1
cyBwcmV2aW91cyB3YXkgdG8gc2lnbmFsIEJUNjU2ICh3aXRob3V0IGhzeW5jL3ZzeW5jKSA/DQo+
PiBBcyBleHBsYWluZWQgcHJldmlvdXNseSwgSSBwcmVmZXIgdGhpcyBsYXN0IHdheSBmb3IgYmFj
a3dhcmQgY29tcGF0aWJpbGl0eS4NCj4gDQo+IElmIHlvdSBoYXZlIGEgZGVmYXVsdCBmb3IgYnVz
LXR5cGUgKEJULjYwMSksIHRoaXMgd29uJ3QgYmUgYSBwcm9ibGVtLg0KPiANCj4gVGhlIG9sZCBE
VCBiaW5kaW5ncyB3ZXJlIHNvbWV3aGF0LCB3ZWxsLCBvcHBvcnR1bmlzdGljLiBUaGUgdjRsMi1v
Zg0KPiBmcmFtZXdvcmstbGV0IGRpZCBpdHMgYmVzdCBhbmQgc29tZXRpbWVzIGl0IHdvcmtlZC4g
VGhlIGJlaGF2aW91ciBpcyBzdGlsbA0KPiBzdXBwb3J0ZWQgYnV0IG5vdCBlbmNvdXJhZ2VkIGlu
IG5ldyBiaW5kaW5ncy4NCj4gDQoNCk9LLCBzbyBsZXQncyBnbyBmb3IgdGhlIG5ldyB3YXkuDQpJ
J3ZlIGZvdW5kIGFuIGludGVyZXN0aW5nIHBhdGNoIGZyb20gSmFjb3BvIHRoYXQgaXMgb2YgZ3Jl
YXQgaGVscDoNCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cmVl
LWJpbmRpbmdzL3BhdGNoLzIwMjAwOTEwMTYyMDU1LjYxNDA4OS00LWphY29wbytyZW5lc2FzQGpt
b25kaS5vcmcvDQoNCkhlcmUgaXMgYSBkcmFmdCBwcm9wb3NhbCBiZWZvcmUgSSBwdXNoIGEgbmV3
IHZlcnNpb24sIHBsZWFzZSBjb21tZW50Og0KDQogICAgICAgICBwcm9wZXJ0aWVzOg0KICAgICAg
ICAgICBidXMtdHlwZToNCiAgICAgICAgICAgICBlbnVtOiBbNSwgNl0NCiAgICAgICAgICAgICBk
ZWZhdWx0OiA1DQoNCiAgICAgICAgICAgYnVzLXdpZHRoOg0KICAgICAgICAgICAgIGVudW06IFs4
LCAxMCwgMTIsIDE0XQ0KICAgICAgICAgICAgIGRlZmF1bHQ6IDgNCg0KICAgICAgICAgICBoc3lu
Yy1hY3RpdmU6DQogICAgICAgICAgICAgZW51bTogWzAsIDFdDQogICAgICAgICAgICAgZGVmYXVs
dDogMA0KDQogICAgICAgICAgIHZzeW5jLWFjdGl2ZToNCiAgICAgICAgICAgICBlbnVtOiBbMCwg
MV0NCiAgICAgICAgICAgICBkZWZhdWx0OiAwDQoNCiAgICAgICAgICAgcGNsay1zYW1wbGU6DQog
ICAgICAgICAgICAgZW51bTogWzAsIDFdDQogICAgICAgICAgICAgZGVmYXVsdDogMA0KDQogICAg
ICAgICAgIHJlbW90ZS1lbmRwb2ludDogdHJ1ZQ0KDQogICAgICAgICBhbGxPZjoNCiAgICAgICAg
ICAgLSBpZjoNCiAgICAgICAgICAgICAgIHByb3BlcnRpZXM6DQogICAgICAgICAgICAgICAgIGJ1
cy10eXBlOg0KICAgICAgICAgICAgICAgICAgIGNvbnN0OiA2DQogICAgICAgICAgICAgdGhlbjoN
CiAgICAgICAgICAgICAgIHByb3BlcnRpZXM6DQogICAgICAgICAgICAgICAgIGhzeW5jLWFjdGl2
ZTogZmFsc2UNCiAgICAgICAgICAgICAgICAgdnN5bmMtYWN0aXZlOiBmYWxzZQ0KICAgICAgICAg
ICAgICAgICBidXMtd2lkdGg6DQogICAgICAgICAgICAgICAgICAgZW51bTogWzhdDQoNCiAgICAg
ICAgIHJlcXVpcmVkOg0KICAgICAgICAgICAtIHJlbW90ZS1lbmRwb2ludA0KDQogICAgICAgICB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQoNCg0KVW5mb3J0dW5hdGVseSwgdGhlICJkZWZh
dWx0OiA1IiBmb3IgYnVzLXR5cGUgaXMgbm90IHdvcmtpbmcgISENCklmIHdlIGRvbid0IHNwZWNp
ZnkgImJ1cy10eXBlIiBpbiBleGFtcGxlLCBkdF9iaW5kaW5nX2NoZWNrIGlzIGZhaWxpbmcgDQph
cyBpZiBkZWZhdWx0IHdhcyA2LCBpdCdzIGhhcmRseSB1bmRlcnN0YW5kYWJsZSAoc2VlIGJlbG93
KSAhDQogICAgICAgICBwb3J0IHsNCiAgICAgICAgICAgICAgZGNtaV8wOiBlbmRwb2ludCB7DQog
ICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmb3Y1NjQwXzA+Ow0KICAgICAg
ICAgICAgICAgICAgICBidXMtd2lkdGggPSA8MTA+Ow0KICAgICAgICAgICAgICAgICAgICBoc3lu
Yy1hY3RpdmUgPSA8MD47DQogICAgICAgICAgICAgICAgICAgIHZzeW5jLWFjdGl2ZSA9IDwwPjsN
CiAgICAgICAgICAgICAgICAgICAgcGNsay1zYW1wbGUgPSA8MT47DQogICAgICAgICAgICAgIH07
DQo9PiB0aGlzIHNob3VsZCBiZSBPSyBidXQgZXJyb3IgY2xhaW1lZDoNCiAgIERUQyANCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLmV4YW1wbGUu
ZHQueWFtbA0KICAgQ0hFQ0sgDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvc3Qsc3RtMzItZGNtaS5leGFtcGxlLmR0LnlhbWwNCkRvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLmV4YW1wbGUuZHQueWFtbDogDQpkY21pQDRj
MDA2MDAwOiBwb3J0OmVuZHBvaW50OnZzeW5jLWFjdGl2ZTogRmFsc2Ugc2NoZW1hIGRvZXMgbm90
IGFsbG93IFtbMF1dDQpkY21pQDRjMDA2MDAwOiBwb3J0OmVuZHBvaW50OmhzeW5jLWFjdGl2ZTog
RmFsc2Ugc2NoZW1hIGRvZXMgbm90IGFsbG93IFtbMF1dDQpkY21pQDRjMDA2MDAwOiBwb3J0OmVu
ZHBvaW50OmJ1cy13aWR0aDowOjA6IDEwIGlzIG5vdCBvbmUgb2YgWzhdDQoJRnJvbSBzY2hlbWE6
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlh
bWwNCg0KPT4gaWYgImJ1cy10eXBlIiBpcyBleHBsaWNpdGx5IHNldCB0byA1LCBhbGwgaXMgZmlu
ZSAoc2VlIGJlbG93KSAhDQogICAgICAgICBwb3J0IHsNCiAgICAgICAgICAgICAgZGNtaV8wOiBl
bmRwb2ludCB7DQogICAgICAgICAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmb3Y1NjQw
XzA+Ow0KICAgICAgICAgICAgICAgICAgICBidXMtdHlwZSA9IDw1PjsNCiAgICAgICAgICAgICAg
ICAgICAgYnVzLXdpZHRoID0gPDEwPjsNCiAgICAgICAgICAgICAgICAgICAgaHN5bmMtYWN0aXZl
ID0gPDA+Ow0KICAgICAgICAgICAgICAgICAgICB2c3luYy1hY3RpdmUgPSA8MD47DQogICAgICAg
ICAgICAgICAgICAgIHBjbGstc2FtcGxlID0gPDE+Ow0KICAgICAgICAgICAgICB9Ow0KICAgICAg
ICAgfTsNCg0KICBEVEMgDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
c3Qsc3RtMzItZGNtaS5leGFtcGxlLmR0LnlhbWwNCiAgIENIRUNLIA0KRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRjbWkuZXhhbXBsZS5kdC55YW1sDQp+
Ly4uLi9tZWRpYV90cmVlJA0KDQoNCj4+DQo+Pg0KPj4gVGhlIGJpbmRpbmdzIHByZXZpb3VzbHkg
ZG9jdW1lbnRlZCBCVC42MDEgKHBhcmFsbGVsKSBvbmx5LCBzbw0KPj4+IGl0IHdhcyBzb21ld2hh
dCBhbWJpZ2lvdXMgdG8gYmVnaW4gd2l0aC4gSXMgdGhlcmUgYSByaXNrIG9mIGludGVycHJldGlu
Zw0KPj4+IG9sZCBCVC42MDEgYmluZGluZ3MgYXMgQlQuNjU2Pw0KPj4gSSBkb24ndCB0aGluayBz
by4NCj4+DQo+PiBXaXRoIGJ1cy10eXBlIHByb3BlcnR5LCBJIGJlbGlldmUgeW91IGNvdWxkDQo+
Pj4gYXZvaWQgYXQgbGVhc3QgdGhhdCByaXNrLg0KPj4geWVzIGJ1dCBhcyBleHBsYWluZWQsIEkn
bGwgcHJlZmVyIG5vdCB0byBhbWVuZCBjdXJyZW50IGJvYXJkcyBkZXZpY2UNCj4+IHRyZWUgZmls
ZXMuDQo+IA0KPiBJIGRvbid0IHRoaW5rIGl0IG1hdHRlcnMgZnJvbSB0aGlzIHBvaW50IG9mIHZp
ZXcgLS0tIHlvdSBjYW4gaGF2ZSBhDQo+IGRlZmF1bHQgYnVzLXR5cGUuDQo+IA0KPj4NCj4+Pg0K
Pj4+IEFsc28gbm90IHNwZWNpZnlpbmcgYXQgbGVhc3Qgb25lIG9mIHRoZSBkZWZhdWx0IHZhbHVl
cyBsZWFkcyB0byBCVC42NTYNCj4+PiB3aXRob3V0IGJ1cy10eXBlLiBUaGF0IGNvdWxkIGJlIGFk
ZHJlc3NlZCBieSByZW1vdmluZyB0aGUgZGVmYXVsdHMuDQo+Pj4NCj4+IEknbSBuZXcgdG8geWFt
bCwgSSd2ZSB0YWtlbiB0aGF0IGZyb20gcmVuZXNhcyx2aW4ueWFtbC4gU2hvdWxkIEkganVzdA0K
Pj4gZHJvcCB0aGUgImRlZmF1bHQ6IDEiIGxpbmVzID8NCj4gDQo+IFRoYXQncyBvbmUgb3B0aW9u
LCB5ZXMuIFRoZW4geW91IGhhdmUgdG8gaGF2ZSB0aG9zZSBmb3IgQlQuNjAxIGFuZCBpdCdzIG5v
DQo+IGxvbmdlciBhbWJpZ3VvdXMuDQo+IA0KDQpCUiwNCkh1Z3Vlcy4=
