Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136E81ECA9E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgFCHe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:34:29 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:6550 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725275AbgFCHe3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:34:29 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0537XPHE021565;
        Wed, 3 Jun 2020 09:34:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=dvyUJs8o6kUEeuCGb8i9PeF6Oa2j1pEYn0SCIXZTWRQ=;
 b=c3dxij/t3E/97u08riL5vamIIH5ZfAApuIY6SKzQUuiL5Yzs2/g+/jkZZRDjLxfAfODO
 ThrOKkihXG0D5qrstMz5PfwfMio7hQM8XRCw+cJhRfqaOrm3+9tTRgkPLQ3j4SKmp7tk
 N8jKJMDPm0pReetQay9AHDKLlUXRf0+e121C704AMjB2kP7ffpPq0cbR4FWm28Bh6DQN
 oIqI0RLJKfJ/rJyyrZztBNvJHy105vw8hGRmwGM/Gh8X6Zb/hHzhevcBnSQ/fpWRdfgN
 OeHWp1dsqsZMuoQ7L7dlv9d7DgITusuxL4uEQhjL3D6jex4UG1I4gX3iiND7zv+mUAbl Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31bd8w2vf7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 03 Jun 2020 09:34:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BA70710002A;
        Wed,  3 Jun 2020 09:34:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A03D82AE6B2;
        Wed,  3 Jun 2020 09:34:13 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Jun
 2020 09:34:12 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 3 Jun 2020 09:34:13 +0200
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
Thread-Index: AQHWNDnEPjQ+BLRck0Okhc2Oie/dNajE9yuAgAAjSoCAACDvgIABLWEA
Date:   Wed, 3 Jun 2020 07:34:13 +0000
Message-ID: <1b0ace18-e7f8-0b75-f6fe-968a269626b0@st.com>
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com> <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
 <jhjo8q1io9o.mognet@arm.com>
In-Reply-To: <jhjo8q1io9o.mognet@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D00D8D0FB5BE449A19E3E0E430841A6@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-03_06:2020-06-02,2020-06-03 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDYvMi8yMCAzOjM1IFBNLCBWYWxlbnRpbiBTY2huZWlkZXIgd3JvdGU6DQo+IE9uIDAy
LzA2LzIwIDEyOjM3LCBCZW5qYW1pbiBHQUlHTkFSRCB3cm90ZToNCj4+IE9uIDYvMi8yMCAxMToz
MSBBTSwgVmFsZW50aW4gU2NobmVpZGVyIHdyb3RlOg0KPj4+PiBAQCAtOTksNiArMTAwLDggQEAg
ZW51bSBzdGF0ZSB7DQo+Pj4+DQo+Pj4+ICAgICNkZWZpbmUgT1ZFUlJVTl9FUlJPUl9USFJFU0hP
TEQJMw0KPj4+Pg0KPj4+PiArI2RlZmluZSBEQ01JX01JTl9GUkVRCTY1MDAwMCAvKiBpbiBLSHog
Ki8NCj4+Pj4gKw0KPj4+IFRoaXMgYXNzdW1lcyB0aGUgaGFuZGxpbmcgcGFydCBpcyBndWFyYW50
ZWVkIHRvIGFsd2F5cyBydW4gb24gdGhlIHNhbWUgQ1BVDQo+Pj4gd2l0aCB0aGUgc2FtZSBwZXJm
b3JtYW5jZSBwcm9maWxlIChyZWdhcmRsZXNzIG9mIHRoZSBwbGF0Zm9ybSkuIElmIHRoYXQncw0K
Pj4+IG5vdCBndWFyYW50ZWVkLCBpdCBmZWVscyBsaWtlIHlvdSdkIHdhbnQgdGhpcyB0byBiZSBj
b25maWd1cmFibGUgaW4gc29tZQ0KPj4+IHdheS4NCj4+IFllcyBJIGNvdWxkIGFkZCBhIHN0LHN0
bTMyLWRjbWktbWluLWZyZXF1ZW5jeSAoaW4gS0h6KSBwYXJhbWV0ZXIgdGhlDQo+PiBkZXZpY2Ug
dHJlZSBub2RlLg0KPj4NCj4gU29tZXRoaW5nIGxpa2UgdGhhdCAtIEknbSBub3Qgc3VyZSBob3cg
d2VsbCB0aGlzIGZpdHMgd2l0aCB0aGUgRFQNCj4gbGFuZHNjYXBlLCBhcyB5b3UgY291bGQgYXJn
dWUgaXQgaXNuJ3QgcmVhbGx5IGEgZGVzY3JpcHRpb24gb2YgdGhlDQo+IGhhcmR3YXJlLCBtb3Jl
IG9mIGEgZGVzY3JpcHRpb24gb2YgdGhlIHBlcmZvcm1hbmNlIGV4cGVjdGF0aW9ucyBvZiB0aGUN
Cj4gc29mdHdhcmUuIEkgd29uJ3QgcmVhbGx5IGFyZ3VlIGhlcmUuDQo+DQo+Pj4+ICAgIHN0cnVj
dCBkY21pX2dyYXBoX2VudGl0eSB7DQo+Pj4+ICAgICAgICAgc3RydWN0IHY0bDJfYXN5bmNfc3Vi
ZGV2IGFzZDsNCj4+Pj4NCj4+PiBbLi4uXQ0KPj4+PiBAQCAtMjAyMCw2ICsyMDQyLDggQEAgc3Rh
dGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4+ICAg
ICAgICAgICAgICAgICBnb3RvIGVycl9jbGVhbnVwOw0KPj4+PiAgICAgICAgIH0NCj4+Pj4NCj4+
Pj4gKwlkY21pLT5wb2xpY3kgPSBjcHVmcmVxX2NwdV9nZXQoMCk7DQo+Pj4+ICsNCj4+PiBJZGVh
bGx5IHlvdSdkIHdhbnQgdG8gZmV0Y2ggdGhlIHBvbGljeSBvZiB0aGUgQ1BVIHlvdXIgSVJRIChh
bmQgaGFuZGxpbmcNCj4+PiB0aHJlYWQpIGlzIGFmZmluZWQgdG87IFRoZSBvbmx5IGNvbXBhdGli
bGUgRFRTIEkgZm91bmQgZGVzY3JpYmVzIGEgc2luZ2xlDQo+Pj4gQTcsIHdoaWNoIGlzIHNvbWV3
aGF0IGxpbWl0ZWQgaW4gdGhlIGFmZmluaXR5IGFyZWEuLi4NCj4+IElmIEkgbW92ZSB0aGlzIGNv
ZGUganVzdCBiZWZvcmUgc3RhcnQgc3RyZWFtaW5nIGFuZCB1c2UgZ2V0X2NwdSgpLCB3b3VsZA0K
Pj4gaXQgd29ya3MgPw0KPj4NCj4gQUZBSUEgc3RyZWFtaW5nX3N0YXJ0KCkgaXMgbm90IG5lY2Vz
c2FyaWx5IGV4ZWN1dGluZyBvbiB0aGUgc2FtZSBDUFUgYXMgdGhlDQo+IG9uZSB0aGF0IHdpbGwg
aGFuZGxlIHRoZSBpbnRlcnJ1cHQuIEkgd2FzIHRoaW5raW5nIHlvdSBjb3VsZCB1c2UgdGhlIElS
USdzDQo+IGVmZmVjdGl2ZSBhZmZpbml0eSBhcyBhIGhpbnQgb2Ygd2hpY2ggQ1BVKHMpIHRvIGJv
b3N0LCBpLmUuIHNvbWV0aGluZyBsaWtlOg0KPg0KPiAtLS0NCj4gICAgICBzdHJ1Y3QgY3B1bWFz
a192YXJfdCB2aXNpdGVkOw0KPiAgICAgIHN0cnVjdCBpcnFfZGF0YSAqZCA9IGlycV9nZXRfaXJx
X2RhdGEoaXJxKTsNCj4NCj4gICAgICBlcnIgPSBhbGxvY19jcHVtYXNrX3Zhcih2aXNpdGVkLCBH
RlBfS0VSTkVMKTsNCj4gICAgICAvKiAuLi4gKi8NCj4gICAgICBmb3JfZWFjaF9jcHUoY3B1LCBp
cnFfZGF0YV9nZXRfZWZmZWN0aXZlX2FmZmluaXR5X21hc2soZCkpIHsNCj4gICAgICAgICAgICAg
IC8qIGNoZWNrIGlmIG5vdCBhbHJlYWR5IHNwYW5uZWQgKi8NCj4gICAgICAgICAgICAgIGlmIChj
cHVtYXNrX3Rlc3RfY3B1KGNwdSwgdmlzaXRlZCkpDQo+ICAgICAgICAgICAgICAgICAgICAgIGNv
bnRpbnVlOw0KPg0KPiAgICAgICAgICAgICAgcG9saWN5ID0gY3B1ZnJlcV9jcHVfZ2V0KGNwdSk7
DQo+ICAgICAgICAgICAgICBjcHVtYXNrX29yKHZpc2l0ZWQsIHZpc2l0ZWQsIHBvbGljeS0+Y3B1
cyk7DQo+ICAgICAgICAgICAgICAvKiBkbyB0aGUgYm9vc3QgZm9yIHRoYXQgcG9saWN5IGhlcmUg
Ki8NCj4gICAgICAgICAgICAgIC8qIC4uLiAqLw0KPiAgICAgICAgICAgICAgY3B1ZnJlcV9jcHVf
cHV0KHBvbGljeSk7DQo+ICAgICAgfQ0KPiAtLS0NCj4NCj4gVGhhdCBvZiBjb3Vyc2UgZmFsbHMg
YXBhcnQgd2hlbiBob3RwbHVnIGdldHMgaW52b2x2ZWQsIGFuZCB0aGUgZWZmZWN0aXZlDQo+IGFm
ZmluaXR5IGNoYW5nZXMuLi4gVGhlcmUncyBpcnFfc2V0X2FmZmluaXR5X25vdGlmaWVyKCkgb3V0
IHRoZXJlLCBidXQgaXQNCj4gc2VlbXMgaXQncyBvbmx5IGFib3V0IHRoZSBhZmZpbml0eSwgbm90
IHRoZSBlZmZlY3RpdmVfYWZmaW5pdHksIEknbSBub3QNCj4gc3VyZSBob3cgdmFsaWQgaXQgd291
bGQgYmUgdG8gcXVlcnkgdGhlIGVmZmVjdGl2ZV9hZmZpbml0eSBpbiB0aGF0DQo+IG5vdGlmaWVy
Lg0KSWYgSSB3YWl0IHRvIGJlIGluIHRoZSBpcnEgaXQgd2lsbCBiZSB0b28gbGF0ZSBzbyBJIHRo
aW5rIEkgd2lsbCBkbyBhIA0KbG9vcCBvdmVyIGFsbCBwb3NzaWJsZSBDUFVzDQpiZWZvcmUgc3Rh
cnQgdGhlIHN0cmVhbWluZyB0byBjaGFuZ2UgdGhlIHBvbGljaWVzLg0KDQo+DQo+PiBCZW5qYW1p
bg0KPj4+PiAgICAgICAgIGRldl9pbmZvKCZwZGV2LT5kZXYsICJQcm9iZSBkb25lXG4iKTsNCj4+
Pj4NCj4+Pj4gICAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkY21pKTsNCj4+Pj4g
QEAgLTIwNDksNiArMjA3Myw5IEBAIHN0YXRpYyBpbnQgZGNtaV9yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4+Pj4NCj4+Pj4gICAgICAgICBwbV9ydW50aW1lX2Rpc2FibGUo
JnBkZXYtPmRldik7DQo+Pj4+DQo+Pj4+ICsJaWYgKGRjbWktPnBvbGljeSkNCj4+Pj4gKwkJY3B1
ZnJlcV9jcHVfcHV0KGRjbWktPnBvbGljeSk7DQo+Pj4+ICsNCj4+Pj4gICAgICAgICB2NGwyX2Fz
eW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJmRjbWktPm5vdGlmaWVyKTsNCj4+Pj4gICAgICAgICB2
NGwyX2FzeW5jX25vdGlmaWVyX2NsZWFudXAoJmRjbWktPm5vdGlmaWVyKTsNCj4+Pj4gICAgICAg
ICBtZWRpYV9lbnRpdHlfY2xlYW51cCgmZGNtaS0+dmRldi0+ZW50aXR5KTsNCg==
