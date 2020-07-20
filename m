Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646B3225BD8
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 11:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgGTJio (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 05:38:44 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48162 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726520AbgGTJin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 05:38:43 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06K9MgFI017123;
        Mon, 20 Jul 2020 11:38:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=lC/LymgalsLxxn7CqvsDbLQJCr894y+aoN1Rm4+7KFI=;
 b=B2lHbtZgdj+u9WxQ68HEI/gS7/Z6eRdJaSi0mfGaOMbatZ1z9rMWQWn4GzR0qeO50ycY
 TiUjpfpwqmTMnc9JOFHouSKPbThhLA50opdyH507nGH0RLC1FLJtACNSznORxknYSY2i
 fLj3ACREU2o1kKxTYNft5iLv0mGJEWWtKB2UO4wlTPvO6U3UE/RKWDQqWUMfnmXIhz5u
 0npGd1vsXUjyFiWFfyWM8eEo5LhQuK7i7yoMEm4Z1WMenrye9nY1Mxxf4VrN82557cUs
 eEtCazhSqDwD3civFpNN0lVi49nZ28VbghP657uXePejNwTBJSsGrppIeJvCSbj5U40e eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32bsagr125-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Jul 2020 11:38:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C6925100034;
        Mon, 20 Jul 2020 11:38:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7FE82B3E71;
        Mon, 20 Jul 2020 11:38:30 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Jul
 2020 11:38:30 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Mon, 20 Jul 2020 11:38:30 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Topic: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWT6e/b2wyFUUnLkaf//MXpHPgJqj/oKMAgAC3YwCAANDPAIAPCWCA
Date:   Mon, 20 Jul 2020 09:38:30 +0000
Message-ID: <fee98476-c92c-579a-ac33-323a5f5feb76@st.com>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
 <20200709203718.GA837160@bogus> <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
 <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+VgXTJy1SQr6B63kLZ3wcRMe4YfYiRNCT6s=gUO_tmTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E726284C4B29AA4DA03C09973C9F53CF@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-20_05:2020-07-17,2020-07-20 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDcvMTAvMjAgMTA6MDEgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBPbiBGcmksIEp1
bCAxMCwgMjAyMCBhdCAxOjMzIEFNIEJlbmphbWluIEdBSUdOQVJEDQo+IDxiZW5qYW1pbi5nYWln
bmFyZEBzdC5jb20+IHdyb3RlOg0KPj4NCj4+DQo+PiBPbiA3LzkvMjAgMTA6MzcgUE0sIFJvYiBI
ZXJyaW5nIHdyb3RlOg0KPj4+IE9uIFdlZCwgSnVsIDAxLCAyMDIwIGF0IDAzOjAxOjI3UE0gKzAy
MDAsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0KPj4+PiBEb2N1bWVudCBzdCxzdG0zMi1kY21p
LW1pbi1mcmVxdWVuY3kgcHJvcGVydHkgd2hpY2ggaXMgdXNlZCB0bw0KPj4+PiByZXF1ZXN0IENQ
VXMgbWluaW11bSBmcmVxdWVuY3kgd2hlbiBzdHJlYW1pbmcgZnJhbWVzLg0KPj4+Pg0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29t
Pg0KPj4+PiAtLS0NCj4+Pj4gICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3N0LHN0bTMyLWRjbWkueWFtbCB8IDggKysrKysrKysNCj4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMyLWRjbWkueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwNCj4+Pj4g
aW5kZXggM2ZlNzc4Y2I1Y2MzLi4wNWNhODVhMjQxMWEgMTAwNjQ0DQo+Pj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwNCj4+
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3N0LHN0bTMy
LWRjbWkueWFtbA0KPj4+PiBAQCAtNDQsNiArNDQsMTMgQEAgcHJvcGVydGllczoNCj4+Pj4gICAg
ICAgICAgYmluZGluZ3MgZGVmaW5lZCBpbg0KPj4+PiAgICAgICAgICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy50eHQuDQo+Pj4+DQo+Pj4+
ICsgIHN0LHN0bTMyLWRjbWktbWluLWZyZXF1ZW5jeToNCj4+Pj4gKyAgICBkZXNjcmlwdGlvbjog
RENNSSBtaW5pbXVtIENQVXMgZnJlcXVlbmN5IHJlcXVpcmVtZW50IChpbiBLSHopLg0KPj4+PiAr
ICAgIGFsbE9mOg0KPj4+PiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy91aW50MzINCj4+Pj4gKyAgICAgIC0gbWluaW11bTogMA0KPj4+PiArICAgICAgLSBk
ZWZhdWx0OiAwDQo+Pj4gSSB0aGluayB0aGlzIGlzIHF1ZXN0aW9uYWJsZSB0byBiZSBpbiBEVCBh
bmQgaWYgaXQgaXMsIGl0J3Mgc29tZXRoaW5nDQo+Pj4gdGhhdCdzIGhhcmRseSBzcGVjaWZpYyB0
byBTVCBvciB0aGlzIGJsb2NrLiBJSVJDLCB3ZSBhbHJlYWR5IGhhdmUgYSB3YXkNCj4+PiB0byBz
cGVjaWZ5IG1pbmltdW0gT1BQcy4NCj4+IFRoaXMgYmluZGluZyBpcyBvbmx5IG5lZWRlZCBvbiBz
b21lIFNUTTMyIFNvQyB3aGVuIERWRlMgaXMgYWN0aXZhdGVkDQo+PiB3aXRoIGxvdyBmcmVxdWVu
Y3kgc2V0dGluZyBpbiBvcHAuIFRoZSB2YWx1ZSBhbHNvIGRlcGVuZHMgb2YgdGhlIHRhcmdldGVk
DQo+PiB2aWRlbyBmb3JtYXQgYW5kIGZyYW1lcmF0ZS4NCj4gQXMgdGhvc2UgMiB0aGluZ3MgYXJl
IG5vdCBpbiB0aGUgRFQsIHRoZW4gbmVpdGhlciBzaG91bGQgdGhpcyB2YWx1ZSBiZS4NCj4NCj4+
IEl0IGlzIG5vdCBhbiBvcHAgYmVjYXVzZSBpdCBkb2Vzbid0IGRlZmluZSBhIHZvbHRhZ2UtY3Vy
cmVudC1mcmVxdWVuY3kNCj4+IGNvbWJpbmF0aW9uDQo+PiBidXQgb25seSBzZXQgYSBtaW5pbXVt
IHRhcmdldCBmb3IgdGhlIENQVXMgZnJlcXVlbmN5IHRvIGd1YXJhbnR5IGEgZ29vZA0KPj4gcmVh
Y3Rpb24NCj4+IHRpbWUgd2hlbiBoYW5kbGluZyBJUlFzIGZvciB0aGUgc2Vuc29yLg0KPiBPUFBz
IGNhbiBiZSBmcmVxdWVuY3kgb25seS4gVGhpcyBpcyBwcmV0dHkgY2xlYXJseSBkZWZpbmluZyB0
aGUgQ1BVDQo+IG11c3QgT3BlcmF0ZSBhdCBhIGNlcnRhaW4gbWluaW11bSBQZXJmb3JtYW5jZSBQ
b2ludC4NCkhpIFJvYiwNCg0KTXkgZ29hbCBoZXJlIHdhc24ndCB0byBkZWZpbmUgYW4gT1BQIGZv
ciB0aGUgQ1BVIHNpbmNlIGl0IGlzIHRoZSBjYW1lcmEgDQppbnRlcmZhY2Ugbm9kZQ0KYnV0IHRv
IGF2b2lkIGxldCB0aGUgQ1BVIGdvIHRvIGRvd24uDQpJIGhhdmVuJ3QgZm91bmQgaG93IHRvIHVz
ZSBPUFAgYmluZGluZ3MsIGNhbiB5b3UgcHJvdmlkZSBtZSBoaW50cyBvciANCmV4YW1wbGVzIG9m
IGhvdw0KSSBzaG91bGQgZG8gaXQ/DQoNClRoYW5rcywNCkJlbmphbWluDQoNCj4NCj4gUm9iDQo=
