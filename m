Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F27A1EBA89
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 13:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgFBLiB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 07:38:01 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:12448 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725919AbgFBLiB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 07:38:01 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 052BW8ED005146;
        Tue, 2 Jun 2020 13:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zCgvAD2DnYOr6cNN/ctfmZUAkv+2YxaNhKI0IMJVfkE=;
 b=v8kkOlsyPyNieJG4nr+2nQ1vF144Qa7s0rS59Pqqo2j3rSHaEJO45M0H4pEoMSq8B8CS
 1oecrhJFDDONdjO01uKRH6A2z94ikNRrBlvVYoTJBDpZzMOCDE4oiyBWLOEzvg9s3fIl
 zcrAx+zuRUP6bsCtiu0MrjrrOmR07S5KrkFAdd5C7DL3ARzu/f+xavux99vZuwjyEVy5
 wrjvsdwrM13ZNFZDx1q2cYGQCqSJ0RiHUnHyQXAKNtovBht9ffBZQQaeRxMdBk4Mdssw
 G0hghBJU8K3yS0eSayQfL7CeeyWZPOHYoPFOXzvIlvWwJOit0N54YN6aXF6C0n7VIDdY XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31bcy0e6ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Jun 2020 13:37:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 141D110002A;
        Tue,  2 Jun 2020 13:37:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D53C72B5C35;
        Tue,  2 Jun 2020 13:37:39 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 13:37:39 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 2 Jun 2020 13:37:39 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Valentin Schneider <valentin.schneider@arm.com>
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
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Topic: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Index: AQHWNDnEPjQ+BLRck0Okhc2Oie/dNajE9yuAgAAjSoA=
Date:   Tue, 2 Jun 2020 11:37:39 +0000
Message-ID: <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com>
In-Reply-To: <jhjpnahizkm.mognet@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <783800331E8056488681241E76EAEE3C@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-02_13:2020-06-02,2020-06-02 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDYvMi8yMCAxMTozMSBBTSwgVmFsZW50aW4gU2NobmVpZGVyIHdyb3RlOg0KPiBIaSBC
ZW5qYW1pbiwNCj4NCj4gT24gMjcvMDUvMjAgMTY6MTYsIEJlbmphbWluIEdhaWduYXJkIHdyb3Rl
Og0KPj4gQmVmb3JlIHN0YXJ0IHN0cmVhbWluZyBzZXQgY3B1ZnJlcSBtaW5pbXVtIGZyZXF1ZW5j
eSByZXF1aXJlbWVudC4NCj4+IFRoZSBjcHVmcmVxIGdvdmVybm9yIHdpbGwgYWRhcHQgdGhlIGZy
ZXF1ZW5jaWVzIGFuZCB3ZSB3aWxsIGhhdmUNCj4+IG5vIGxhdGVuY3kgZm9yIGhhbmRsaW5nIGlu
dGVycnVwdHMuDQo+Pg0KPiBGZXcgY29tbWVudHMgYmVsb3cgZnJvbSBzb21lb25lIG9ibGl2aW91
cyB0byB5b3VyIHBsYXRmb3JtLCB0aGV5IG1heSBub3QNCj4gYmUgYWxsIHRoYXQgcmVsZXZhbnQg
YnV0IEkgZmlndXJlZCBJJ2QgcGl0Y2ggaW4gYW55d2F5Lg0KPg0KPj4gU2lnbmVkLW9mZi1ieTog
QmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQHN0LmNvbT4NCj4+IC0tLQ0KPj4g
ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyB8IDI5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9z
dG0zMi1kY21pLmMNCj4+IGluZGV4IGI4OTMxNDkwYjgzYi4uOTdjMzQyMzUxNTY5IDEwMDY0NA0K
Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jDQo+PiBAQCAtMTMs
NiArMTMsNyBAQA0KPj4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPj4gICAjaW5jbHVk
ZSA8bGludXgvY29tcGxldGlvbi5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9jcHVmcmVxLmg+DQo+
PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPj4gICAjaW5jbHVkZSA8bGludXgvZG1hZW5n
aW5lLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+DQo+PiBAQCAtOTksNiArMTAwLDgg
QEAgZW51bSBzdGF0ZSB7DQo+Pg0KPj4gICAjZGVmaW5lIE9WRVJSVU5fRVJST1JfVEhSRVNIT0xE
CTMNCj4+DQo+PiArI2RlZmluZSBEQ01JX01JTl9GUkVRCTY1MDAwMCAvKiBpbiBLSHogKi8NCj4+
ICsNCj4gVGhpcyBhc3N1bWVzIHRoZSBoYW5kbGluZyBwYXJ0IGlzIGd1YXJhbnRlZWQgdG8gYWx3
YXlzIHJ1biBvbiB0aGUgc2FtZSBDUFUNCj4gd2l0aCB0aGUgc2FtZSBwZXJmb3JtYW5jZSBwcm9m
aWxlIChyZWdhcmRsZXNzIG9mIHRoZSBwbGF0Zm9ybSkuIElmIHRoYXQncw0KPiBub3QgZ3VhcmFu
dGVlZCwgaXQgZmVlbHMgbGlrZSB5b3UnZCB3YW50IHRoaXMgdG8gYmUgY29uZmlndXJhYmxlIGlu
IHNvbWUNCj4gd2F5Lg0KWWVzIEkgY291bGQgYWRkIGEgc3Qsc3RtMzItZGNtaS1taW4tZnJlcXVl
bmN5IChpbiBLSHopIHBhcmFtZXRlciB0aGUgDQpkZXZpY2UgdHJlZSBub2RlLg0KDQo+DQo+PiAg
IHN0cnVjdCBkY21pX2dyYXBoX2VudGl0eSB7DQo+PiAgICAgICAgc3RydWN0IHY0bDJfYXN5bmNf
c3ViZGV2IGFzZDsNCj4+DQo+IFsuLi5dDQo+PiBAQCAtMjAyMCw2ICsyMDQyLDggQEAgc3RhdGlj
IGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgICAgICAg
ICAgICAgICBnb3RvIGVycl9jbGVhbnVwOw0KPj4gICAgICAgIH0NCj4+DQo+PiArCWRjbWktPnBv
bGljeSA9IGNwdWZyZXFfY3B1X2dldCgwKTsNCj4+ICsNCj4gSWRlYWxseSB5b3UnZCB3YW50IHRv
IGZldGNoIHRoZSBwb2xpY3kgb2YgdGhlIENQVSB5b3VyIElSUSAoYW5kIGhhbmRsaW5nDQo+IHRo
cmVhZCkgaXMgYWZmaW5lZCB0bzsgVGhlIG9ubHkgY29tcGF0aWJsZSBEVFMgSSBmb3VuZCBkZXNj
cmliZXMgYSBzaW5nbGUNCj4gQTcsIHdoaWNoIGlzIHNvbWV3aGF0IGxpbWl0ZWQgaW4gdGhlIGFm
ZmluaXR5IGFyZWEuLi4NCklmIEkgbW92ZSB0aGlzIGNvZGUganVzdCBiZWZvcmUgc3RhcnQgc3Ry
ZWFtaW5nIGFuZCB1c2UgZ2V0X2NwdSgpLCB3b3VsZCANCml0IHdvcmtzID8NCg0KQmVuamFtaW4N
Cj4NCj4+ICAgICAgICBkZXZfaW5mbygmcGRldi0+ZGV2LCAiUHJvYmUgZG9uZVxuIik7DQo+Pg0K
Pj4gICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRjbWkpOw0KPj4gQEAgLTIwNDks
NiArMjA3Myw5IEBAIHN0YXRpYyBpbnQgZGNtaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4+DQo+PiAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOw0K
Pj4NCj4+ICsJaWYgKGRjbWktPnBvbGljeSkNCj4+ICsJCWNwdWZyZXFfY3B1X3B1dChkY21pLT5w
b2xpY3kpOw0KPj4gKw0KPj4gICAgICAgIHY0bDJfYXN5bmNfbm90aWZpZXJfdW5yZWdpc3Rlcigm
ZGNtaS0+bm90aWZpZXIpOw0KPj4gICAgICAgIHY0bDJfYXN5bmNfbm90aWZpZXJfY2xlYW51cCgm
ZGNtaS0+bm90aWZpZXIpOw0KPj4gICAgICAgIG1lZGlhX2VudGl0eV9jbGVhbnVwKCZkY21pLT52
ZGV2LT5lbnRpdHkpOw0K
