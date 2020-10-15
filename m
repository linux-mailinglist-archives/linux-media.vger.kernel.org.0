Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E369028F604
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 17:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgJOPmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 11:42:11 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26468 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731061AbgJOPmL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 11:42:11 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09FFWPqM021470;
        Thu, 15 Oct 2020 17:41:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5M9z+VJHpdMPslK5yQUX1WHh1hOOIDzT8UXdnP4viN8=;
 b=rpRhMwqOI8skSMIeeESJ2ENU7YmRahj/fKUC0OAR/VDOxL070/IAzAqpEuYaRtN83gR9
 xrhSVQPms7Vnmzq3WZHd06k/3/EW958yp6ioJC1FT1G7m+wVHLe5tnbCJYcrrzcoeJ6X
 Xzu6dJdsXq4uAa5aoZ6PheBdfCFMUvIQfZ7+Y1beFVRfJrdYzZOu35vj7QDJDrpvkJk5
 2XyIVmPX3nQejPZZCer29rV97V7osWxtr4o8W1zAAY3urVsjT+06R5menn7YGm3c0+uM
 hIjLHbTGllfkYiuidDP8/B3W9FZW59/gxweGeoEs40Z9xyqlm/XsJPgJUv3+KXahV4Qa Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34353wqrkk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 15 Oct 2020 17:41:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3BF1100034;
        Thu, 15 Oct 2020 17:41:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A14452CA82E;
        Thu, 15 Oct 2020 17:41:55 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 17:41:55 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 15 Oct 2020 17:41:55 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>
Subject: Re: [PATCH] media: stm32-dcmi: add support of BT656 bus
Thread-Topic: [PATCH] media: stm32-dcmi: add support of BT656 bus
Thread-Index: AQHWoUBkV9IGF/l+kUSwjdCwug2yKamYr2IA
Date:   Thu, 15 Oct 2020 15:41:55 +0000
Message-ID: <1e1eb9d1-75af-c560-7d06-14d25bb52b3f@st.com>
References: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
 <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
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
Content-ID: <126D0E0F6D08C44292F7D889E518AF9A@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-15_09:2020-10-14,2020-10-15 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpUaGFua3MgZm9yIHJldmlld2luZywNCg0KT24gMTAvMTMvMjAgMTE6MDcg
QU0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4gSGkgSHVndWVzLA0KPiANCj4gT24gV2VkLCBPY3Qg
MDcsIDIwMjAgYXQgMDY6MTQ6NTBQTSArMDIwMCwgSHVndWVzIEZydWNoZXQgd3JvdGU6DQo+PiBB
ZGQgc3VwcG9ydCBvZiBCVDY1NiBlbWJlZGRlZCBzeW5jaHJvbml6YXRpb24gYnVzLg0KPj4gVGhp
cyBtb2RlIGFsbG93cyB0byBzYXZlIGhhcmR3YXJlIHN5bmNocm8gbGluZXMgaHN5bmMgJiB2c3lu
Yw0KPj4gYnkgcmVwbGFjaW5nIHRoZW0gd2l0aCBzeW5jaHJvIGNvZGVzIGVtYmVkZGVkIGluIGRh
dGEgc3RyZWFtLg0KPj4gVGhpcyBidXMgdHlwZSBpcyBvbmx5IGNvbXBhdGlibGUgd2l0aCA4IGJp
dHMgd2lkdGggZGF0YSBidXMuDQo+PiBEdWUgdG8gcmVzZXJ2ZWQgdmFsdWVzIDB4MDAgJiAweGZm
IHVzZWQgZm9yIHN5bmNocm8gY29kZXMsDQo+PiB2YWxpZCBkYXRhIG9ubHkgdmFyeSBmcm9tIDB4
MSB0byAweGZlLCB0aGlzIGlzIHVwIHRvIHNlbnNvcg0KPj4gdG8gY2xpcCBhY2NvcmRpbmdseSBw
aXhlbCBkYXRhLiBBcyBhIGNvbnNlcXVlbmNlIG9mIHRoaXMNCj4+IGNsaXBwaW5nLCBKUEVHIGlz
IG5vdCBzdXBwb3J0ZWQgd2hlbiB1c2luZyB0aGlzIGJ1cyB0eXBlLg0KPj4gRENNSSBjcm9wIGZl
YXR1cmUgaXMgYWxzbyBub3QgYXZhaWxhYmxlIHdpdGggdGhpcyBidXMgdHlwZS4NCj4gDQo+IFlv
dSBjYW4gaGF2ZSBtb3JlIHRoYW4gNjIgY2hhcmFjdGVycyBwZXIgbGluZS4gSW4gZmFjdCwgNzUg
aXMgdGhlDQo+IHJlY29tbWVuZGVkIG1heGltdW0uDQo+IA0KPiBZb3Ugc2hvdWxkIGFsc28gYW1l
bmQgdGhlIGJpbmRpbmdzIHRvIGNvdmVyIEJULjY1NiBtb2RlLiBBbHNvIGJ1cy10eXBlDQo+IHNo
b3VsZCBwcm9iYWJseSBiZSBtYWRlIG1hbmRhdG9yeSwgdG9vLg0KV2lsbCBkbyBib3RoLg0KDQo+
IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBz
dC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1k
Y21pLmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jDQo+PiBpbmRleCBmZDFjNDFjLi5kN2Q3
Y2RiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1k
Y21pLmMNCj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5j
DQo+PiBAQCAtMTU3LDYgKzE1Nyw3IEBAIHN0cnVjdCBzdG0zMl9kY21pIHsNCj4+ICAgCXN0cnVj
dCB2YjJfcXVldWUJCXF1ZXVlOw0KPj4gICANCj4+ICAgCXN0cnVjdCB2NGwyX2Z3bm9kZV9idXNf
cGFyYWxsZWwJYnVzOw0KPj4gKwllbnVtIHY0bDJfbWJ1c190eXBlCQlidXNfdHlwZTsNCj4+ICAg
CXN0cnVjdCBjb21wbGV0aW9uCQljb21wbGV0ZTsNCj4+ICAgCXN0cnVjdCBjbGsJCQkqbWNsazsN
Cj4+ICAgCWVudW0gc3RhdGUJCQlzdGF0ZTsNCj4+IEBAIC03NzcsNiArNzc4LDIzIEBAIHN0YXRp
YyBpbnQgZGNtaV9zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqdnEsIHVuc2lnbmVk
IGludCBjb3VudCkNCj4+ICAgCWlmIChkY21pLT5idXMuZmxhZ3MgJiBWNEwyX01CVVNfUENMS19T
QU1QTEVfUklTSU5HKQ0KPj4gICAJCXZhbCB8PSBDUl9QQ0tQT0w7DQo+PiAgIA0KPj4gKwkvKg0K
Pj4gKwkgKiBCVDY1NiBlbWJlZGRlZCBzeW5jaHJvbmlzYXRpb24gYnVzIG1vZGUuDQo+PiArCSAq
DQo+PiArCSAqIERlZmF1bHQgU0FWL0VBViBtb2RlIGlzIHN1cHBvcnRlZCBoZXJlIHdpdGggZGVm
YXVsdCBjb2Rlcw0KPj4gKwkgKiBTQVY9MHhmZjAwMDA4MCAmIEVBVj0weGZmMDAwMDlkLg0KPj4g
KwkgKiBXaXRoIERDTUkgdGhpcyBtZWFucyBMU0M9U0FWPTB4ODAgJiBMRUM9RUFWPTB4OWQuDQo+
PiArCSAqLw0KPj4gKwlpZiAoZGNtaS0+YnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2KSB7DQo+
PiArCQl2YWwgfD0gQ1JfRVNTOw0KPj4gKw0KPj4gKwkJLyogVW5tYXNrIGFsbCBjb2RlcyAqLw0K
Pj4gKwkJcmVnX3dyaXRlKGRjbWktPnJlZ3MsIERDTUlfRVNVUiwgMHhmZmZmZmZmZik7LyogRkVD
OkxFQzpMU0M6RlNDICovDQo+PiArDQo+PiArCQkvKiBUcmlnIG9uIExTQz0weDgwICYgTEVDPTB4
OWQgY29kZXMsIGlnbm9yZSBGU0MgYW5kIEZFQyAqLw0KPj4gKwkJcmVnX3dyaXRlKGRjbWktPnJl
Z3MsIERDTUlfRVNDUiwgMHhmZjlkODBmZik7LyogRkVDOkxFQzpMU0M6RlNDICovDQo+PiArCX0N
Cj4+ICsNCj4+ICAgCXJlZ193cml0ZShkY21pLT5yZWdzLCBEQ01JX0NSLCB2YWwpOw0KPj4gICAN
Cj4+ICAgCS8qIFNldCBjcm9wICovDQo+PiBAQCAtMTA2Nyw4ICsxMDg1LDkgQEAgc3RhdGljIGlu
dCBkY21pX3NldF9mbXQoc3RydWN0IHN0bTMyX2RjbWkgKmRjbWksIHN0cnVjdCB2NGwyX2Zvcm1h
dCAqZikNCj4+ICAgCWlmIChyZXQpDQo+PiAgIAkJcmV0dXJuIHJldDsNCj4+ICAgDQo+PiAtCS8q
IERpc2FibGUgY3JvcCBpZiBKUEVHIGlzIHJlcXVlc3RlZCAqLw0KPj4gLQlpZiAocGl4LT5waXhl
bGZvcm1hdCA9PSBWNEwyX1BJWF9GTVRfSlBFRykNCj4+ICsJLyogRGlzYWJsZSBjcm9wIGlmIEpQ
RUcgaXMgcmVxdWVzdGVkIG9yIEJUNjU2IGJ1cyBpcyBzZWxlY3RlZCAqLw0KPj4gKwlpZiAocGl4
LT5waXhlbGZvcm1hdCA9PSBWNEwyX1BJWF9GTVRfSlBFRyAmJg0KPj4gKwkgICAgZGNtaS0+YnVz
X3R5cGUgIT0gVjRMMl9NQlVTX0JUNjU2KQ0KPj4gICAJCWRjbWktPmRvX2Nyb3AgPSBmYWxzZTsN
Cj4+ICAgDQo+PiAgIAkvKiBwaXggdG8gbWJ1cyBmb3JtYXQgKi8NCj4+IEBAIC0xNTkyLDYgKzE2
MTEsMTEgQEAgc3RhdGljIGludCBkY21pX2Zvcm1hdHNfaW5pdChzdHJ1Y3Qgc3RtMzJfZGNtaSAq
ZGNtaSkNCj4+ICAgCQkJaWYgKGRjbWlfZm9ybWF0c1tpXS5tYnVzX2NvZGUgIT0gbWJ1c19jb2Rl
LmNvZGUpDQo+PiAgIAkJCQljb250aW51ZTsNCj4+ICAgDQo+PiArCQkJLyogRXhjbHVkZSBKUEVH
IGlmIEJUNjU2IGJ1cyBpcyBzZWxlY3RlZCAqLw0KPj4gKwkJCWlmIChkY21pX2Zvcm1hdHNbaV0u
Zm91cmNjID09IFY0TDJfUElYX0ZNVF9KUEVHICYmDQo+PiArCQkJICAgIGRjbWktPmJ1c190eXBl
ID09IFY0TDJfTUJVU19CVDY1NikNCj4+ICsJCQkJY29udGludWU7DQo+PiArDQo+PiAgIAkJCS8q
IENvZGUgc3VwcG9ydGVkLCBoYXZlIHdlIGdvdCB0aGlzIGZvdXJjYyB5ZXQ/ICovDQo+PiAgIAkJ
CWZvciAoaiA9IDA7IGogPCBudW1fZm10czsgaisrKQ0KPj4gICAJCQkJaWYgKHNkX2ZtdHNbal0t
PmZvdXJjYyA9PQ0KPj4gQEAgLTE4NzMsOSArMTg5NywxOCBAQCBzdGF0aWMgaW50IGRjbWlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsICJDU0kgYnVzIG5vdCBzdXBwb3J0ZWRcbiIpOw0KPj4gICAJCXJldHVybiAtRU5PREVWOw0K
Pj4gICAJfQ0KPj4gKw0KPj4gKwlpZiAoZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2ICYm
DQo+PiArCSAgICBlcC5idXMucGFyYWxsZWwuYnVzX3dpZHRoICE9IDgpIHsNCj4+ICsJCWRldl9l
cnIoJnBkZXYtPmRldiwgIkJUNjU2IGJ1cyBjb25mbGljdHMgd2l0aCAlZCBiaXRzIGJ1cyB3aWR0
aCAoOCBiaXRzIHJlcXVpcmVkKVxuIiwNCj4+ICsJCQllcC5idXMucGFyYWxsZWwuYnVzX3dpZHRo
KTsNCj4gDQo+IGJ1c193aWR0aCBpcyB1bnNpZ25lZCBoZXJlLg0KSSB3aWxsIGZpeCBpdC4NCg0K
PiANCj4+ICsJCXJldHVybiAtRU5PREVWOw0KPj4gKwl9DQo+PiArDQo+PiAgIAlkY21pLT5idXMu
ZmxhZ3MgPSBlcC5idXMucGFyYWxsZWwuZmxhZ3M7DQo+PiAgIAlkY21pLT5idXMuYnVzX3dpZHRo
ID0gZXAuYnVzLnBhcmFsbGVsLmJ1c193aWR0aDsNCj4+ICAgCWRjbWktPmJ1cy5kYXRhX3NoaWZ0
ID0gZXAuYnVzLnBhcmFsbGVsLmRhdGFfc2hpZnQ7DQo+PiArCWRjbWktPmJ1c190eXBlID0gZXAu
YnVzX3R5cGU7DQo+PiAgIA0KPj4gICAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsN
Cj4+ICAgCWlmIChpcnEgPD0gMCkNCj4gDQoNCkJSLA0KSHVndWVzLg==
