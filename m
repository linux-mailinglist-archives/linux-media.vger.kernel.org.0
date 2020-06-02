Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 714A91EB763
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 10:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgFBI3z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 04:29:55 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:31472 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgFBI3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jun 2020 04:29:54 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0528SDJr026270;
        Tue, 2 Jun 2020 10:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6XTqD4oSlrbjM9/x3g1YaVOoeoVL9aa2OTi5ThyuPwU=;
 b=k09ef3UywWNyT67MNoGBHI4ZPUwtwJR6gOuT1+2KnA+ifAvFV6a5VYVL0hKX/ckO5/o4
 ITQgyRe7JF5o7ZEaY/b1mlOGAFz/E0tg5kJK7kFMAOmk/EOXFpLEAWKDuhvQLm+RqLp3
 BKCKTERRngN/N5C0LLulBMBorgDnpzZxUkf9d50rwRvujWBreb+2x7yMUdokyUYi0uDN
 4ZEy3o5LEBlH+qmPrVYeIDiq+MO6JpndyQmfmiekY3L9MGNgkviKgp6ZF/W8iyPRA0ks
 qqShYb1lUKr+Me++2/IKQ0VMnvQgSOaAdxZVQFLp8EBQk8G+Tj32Y1mZ1BE+a6a9VshR Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31bcy0dbp8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Jun 2020 10:29:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D80D410002A;
        Tue,  2 Jun 2020 10:29:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A661A2AAD1F;
        Tue,  2 Jun 2020 10:29:36 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 2 Jun
 2020 10:29:36 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 2 Jun 2020 10:29:36 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>
Subject: Re: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Topic: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Index: AQHWNDnEu2gs2ws6JUCiuNPgKFH4kKjE5e6A
Date:   Tue, 2 Jun 2020 08:29:36 +0000
Message-ID: <c53ca6f9-5350-0234-eb52-2c656ffab79c@st.com>
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
In-Reply-To: <20200527151613.16083-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C415AA3C357474291DF12AFD1D350E4@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-02_11:2020-06-01,2020-06-02 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWNrZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9uIDUv
MjcvMjAgNToxNiBQTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+IEJlZm9yZSBzdGFydCBz
dHJlYW1pbmcgc2V0IGNwdWZyZXEgbWluaW11bSBmcmVxdWVuY3kgcmVxdWlyZW1lbnQuDQo+IFRo
ZSBjcHVmcmVxIGdvdmVybm9yIHdpbGwgYWRhcHQgdGhlIGZyZXF1ZW5jaWVzIGFuZCB3ZSB3aWxs
IGhhdmUNCj4gbm8gbGF0ZW5jeSBmb3IgaGFuZGxpbmcgaW50ZXJydXB0cy4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+DQo+
IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIHwgMjkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjggaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9z
dG0zMi9zdG0zMi1kY21pLmMNCj4gaW5kZXggYjg5MzE0OTBiODNiLi45N2MzNDIzNTE1NjkgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jDQo+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jDQo+IEBAIC0x
Myw2ICsxMyw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvY3B1ZnJlcS5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9kbWFlbmdp
bmUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiBAQCAtOTksNiArMTAwLDggQEAg
ZW51bSBzdGF0ZSB7DQo+ICAgDQo+ICAgI2RlZmluZSBPVkVSUlVOX0VSUk9SX1RIUkVTSE9MRAkz
DQo+ICAgDQo+ICsjZGVmaW5lIERDTUlfTUlOX0ZSRVEJNjUwMDAwIC8qIGluIEtIeiAqLw0KPiAr
DQo+ICAgc3RydWN0IGRjbWlfZ3JhcGhfZW50aXR5IHsNCj4gICAJc3RydWN0IHY0bDJfYXN5bmNf
c3ViZGV2IGFzZDsNCj4gICANCj4gQEAgLTE3Myw2ICsxNzYsMTAgQEAgc3RydWN0IHN0bTMyX2Rj
bWkgew0KPiAgIAlzdHJ1Y3QgbWVkaWFfZGV2aWNlCQltZGV2Ow0KPiAgIAlzdHJ1Y3QgbWVkaWFf
cGFkCQl2aWRfY2FwX3BhZDsNCj4gICAJc3RydWN0IG1lZGlhX3BpcGVsaW5lCQlwaXBlbGluZTsN
Cj4gKw0KPiArCS8qIENQVSBmcmVxIGNvbnRyYWludCAqLw0KPiArCXN0cnVjdCBjcHVmcmVxX3Bv
bGljeQkJKnBvbGljeTsNCj4gKwlzdHJ1Y3QgZnJlcV9xb3NfcmVxdWVzdAkJcW9zX3JlcTsNCj4g
ICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHN0bTMyX2RjbWkgKm5vdGlmaWVy
X3RvX2RjbWkoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm4pDQo+IEBAIC03MzYsMTEgKzc0
MywyMCBAQCBzdGF0aWMgaW50IGRjbWlfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUg
KnZxLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+ICAgCQlnb3RvIGVycl9yZWxlYXNlX2J1ZmZlcnM7
DQo+ICAgCX0NCj4gICANCj4gKwlpZiAoZGNtaS0+cG9saWN5KSB7DQo+ICsJCXJldCA9IGZyZXFf
cW9zX2FkZF9yZXF1ZXN0KCZkY21pLT5wb2xpY3ktPmNvbnN0cmFpbnRzLA0KPiArCQkJCQkgICAm
ZGNtaS0+cW9zX3JlcSwgRlJFUV9RT1NfTUlOLA0KPiArCQkJCQkgICBEQ01JX01JTl9GUkVRKTsN
Cj4gKw0KPiArCQlpZiAocmV0IDwgMCkNCj4gKwkJCWdvdG8gZXJyX3BtX3B1dDsNCj4gKwl9DQo+
ICsNCj4gICAJcmV0ID0gbWVkaWFfcGlwZWxpbmVfc3RhcnQoJmRjbWktPnZkZXYtPmVudGl0eSwg
JmRjbWktPnBpcGVsaW5lKTsNCj4gICAJaWYgKHJldCA8IDApIHsNCj4gICAJCWRldl9lcnIoZGNt
aS0+ZGV2LCAiJXM6IEZhaWxlZCB0byBzdGFydCBzdHJlYW1pbmcsIG1lZGlhIHBpcGVsaW5lIHN0
YXJ0IGVycm9yICglZClcbiIsDQo+ICAgCQkJX19mdW5jX18sIHJldCk7DQo+IC0JCWdvdG8gZXJy
X3BtX3B1dDsNCj4gKwkJZ290byBlcnJfZHJvcF9xb3M7DQo+ICAgCX0NCj4gICANCj4gICAJcmV0
ID0gZGNtaV9waXBlbGluZV9zdGFydChkY21pKTsNCj4gQEAgLTgzNSw2ICs4NTEsOSBAQCBzdGF0
aWMgaW50IGRjbWlfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnZxLCB1bnNpZ25l
ZCBpbnQgY291bnQpDQo+ICAgZXJyX21lZGlhX3BpcGVsaW5lX3N0b3A6DQo+ICAgCW1lZGlhX3Bp
cGVsaW5lX3N0b3AoJmRjbWktPnZkZXYtPmVudGl0eSk7DQo+ICAgDQo+ICtlcnJfZHJvcF9xb3M6
DQo+ICsJaWYgKGRjbWktPnBvbGljeSkNCj4gKwkJZnJlcV9xb3NfcmVtb3ZlX3JlcXVlc3QoJmRj
bWktPnFvc19yZXEpOw0KPiAgIGVycl9wbV9wdXQ6DQo+ICAgCXBtX3J1bnRpbWVfcHV0KGRjbWkt
PmRldik7DQo+ICAgDQo+IEBAIC04NjMsNiArODgyLDkgQEAgc3RhdGljIHZvaWQgZGNtaV9zdG9w
X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICp2cSkNCj4gICANCj4gICAJbWVkaWFfcGlwZWxp
bmVfc3RvcCgmZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4gICANCj4gKwlpZiAoZGNtaS0+cG9saWN5
KQ0KPiArCQlmcmVxX3Fvc19yZW1vdmVfcmVxdWVzdCgmZGNtaS0+cW9zX3JlcSk7DQo+ICsNCj4g
ICAJc3Bpbl9sb2NrX2lycSgmZGNtaS0+aXJxbG9jayk7DQo+ICAgDQo+ICAgCS8qIERpc2FibGUg
aW50ZXJydXB0aW9ucyAqLw0KPiBAQCAtMjAyMCw2ICsyMDQyLDggQEAgc3RhdGljIGludCBkY21p
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlnb3RvIGVycl9jbGVh
bnVwOw0KPiAgIAl9DQo+ICAgDQo+ICsJZGNtaS0+cG9saWN5ID0gY3B1ZnJlcV9jcHVfZ2V0KDAp
Ow0KPiArDQo+ICAgCWRldl9pbmZvKCZwZGV2LT5kZXYsICJQcm9iZSBkb25lXG4iKTsNCj4gICAN
Cj4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgZGNtaSk7DQo+IEBAIC0yMDQ5LDYgKzIw
NzMsOSBAQCBzdGF0aWMgaW50IGRjbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgDQo+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gICANCj4g
KwlpZiAoZGNtaS0+cG9saWN5KQ0KPiArCQljcHVmcmVxX2NwdV9wdXQoZGNtaS0+cG9saWN5KTsN
Cj4gKw0KPiAgIAl2NGwyX2FzeW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJmRjbWktPm5vdGlmaWVy
KTsNCj4gICAJdjRsMl9hc3luY19ub3RpZmllcl9jbGVhbnVwKCZkY21pLT5ub3RpZmllcik7DQo+
ICAgCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZkY21pLT52ZGV2LT5lbnRpdHkpOw0KPiA=
