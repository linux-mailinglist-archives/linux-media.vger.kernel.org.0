Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD9D125D63
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfLSJOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:14:34 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:29318 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726599AbfLSJOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:14:33 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBJ96eEa022726;
        Thu, 19 Dec 2019 10:14:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xS6uGwF2TUpF+zZAT7Jn9SOfXWgqUWrRbm+1dq7ZFXA=;
 b=Y6NuE2Pfo5DUYEsLav71dVLq27xL0a1Q0/BgOW1oScUoAK8Tueu3GaKCHjvL5dAWADgK
 t7r/YOsa8GSlkU1+2tSEFpWqYsDrhthI94jymkp9WGaw34HpvfY2ILoc2DMaz6pivR5E
 vWIOedANfOI71csVlnQ9OJWIaSmSghbZI1gO4aPtGQokyJar63+mEWoai/yOd0C/usQJ
 RYOEcMQtvWKqIdedzru10Cg78aGCR4HJ/9EHWUc6fnMmU325bCF1csDEiRJ0CZp78P10
 JuoSCz99IYsmAzuxuYGNA2Z7U/z3PAyNstFJV6ZwJHWGVZvRsJ9XxnSSMCvfSGfnGqOj Og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2wvpd1rmsy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Dec 2019 10:14:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6232D10002A;
        Thu, 19 Dec 2019 10:14:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 568A721CA82;
        Thu, 19 Dec 2019 10:14:23 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 10:14:20 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 19 Dec 2019 10:14:20 +0100
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: sti: bdisp: fix a possible sleep-in-atomic-context
 bug in bdisp_device_run()
Thread-Topic: [PATCH] media: sti: bdisp: fix a possible
 sleep-in-atomic-context bug in bdisp_device_run()
Thread-Index: AQHVtaxEax7uyZMMgkib5/WTY24ilKfBGaKAgAADpgA=
Date:   Thu, 19 Dec 2019 09:14:20 +0000
Message-ID: <52df5013-3188-d27c-7ad7-e05cd4912a3d@st.com>
References: <20191218140537.12193-1-baijiaju1990@gmail.com>
 <705a5381-4edd-211e-9602-78a2b4b67ea9@st.com>
In-Reply-To: <705a5381-4edd-211e-9602-78a2b4b67ea9@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8369CDAE386174E95E4B4A6DA62FB00@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_01:2019-12-17,2019-12-19 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QW5kIGNhbGxpbmcgcmVhZGxfcG9sbF90aW1lb3V0X2F0b21pYygpIHdvdWxkIHByb2JhYmx5IGJl
IGJldHRlciA6KQ0KDQoNCk9uIDE5LzEyLzIwMTkgMTA6MDEgQU0sIEZhYmllbiBERVNTRU5ORSB3
cm90ZToNCj4gSGkgSmlhX0p1LA0KPg0KPg0KPiBUaGlzIGlzIGEgZ29vZCBmaW5kaW5nLiBTZWUg
bXkgcmVtYXJrcyBiZWxvdy4NCj4NCj4NCj4gT24gMTgvMTIvMjAxOSAzOjA1IFBNLCBKaWEtSnUg
QmFpIHdyb3RlOg0KPj4gVGhlIGRyaXZlciBtYXkgc2xlZXAgd2hpbGUgaG9sZGluZyBhIHNwaW5s
b2NrLg0KPj4gVGhlIGZ1bmN0aW9uIGNhbGwgcGF0aCAoZnJvbSBib3R0b20gdG8gdG9wKSBpbiBM
aW51eCA0LjE5IGlzOg0KPj4NCj4+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2Jk
aXNwLWh3LmMsIDM4NToNCj4+IMKgwqDCoMKgbXNsZWVwIGluIGJkaXNwX2h3X3Jlc2V0DQo+PiBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12NGwyLmMsIDM0MToNCj4+IMKg
wqDCoMKgYmRpc3BfaHdfcmVzZXQgaW4gYmRpc3BfZGV2aWNlX3J1bg0KPj4gZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jLCAzMTc6DQo+PiDCoMKgwqDCoF9yYXdf
c3Bpbl9sb2NrX2lycXNhdmUgaW4gYmRpc3BfZGV2aWNlX3J1bg0KPj4NCj4+IFRvIGZpeCB0aGlz
IGJ1ZywgbXNsZWVwKCkgaXMgcmVwbGFjZWQgd2l0aCBtZGVsYXkoKS4NCj4+DQo+PiBUaGlzIGJ1
ZyBpcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sgd3JpdHRlbiBieSBt
eXNlbGYuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmlhLUp1IEJhaSA8YmFpamlhanUxOTkwQGdt
YWlsLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3Av
YmRpc3AtaHcuYyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3N0aS9iZGlzcC9iZGlzcC1ody5jIA0KPj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9i
ZGlzcC9iZGlzcC1ody5jDQo+PiBpbmRleCA0MzcyYWJiYjU5NTAuLjFhNTYzNDg4MDVhMiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLWh3LmMN
Cj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLWh3LmMNCj4+
IEBAIC0zODIsNyArMzgyLDcgQEAgaW50IGJkaXNwX2h3X3Jlc2V0KHN0cnVjdCBiZGlzcF9kZXYg
KmJkaXNwKQ0KPj4gwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgUE9MTF9SU1RfTUFYOyBpKysp
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmVhZGwoYmRpc3AtPnJlZ3MgKyBCTFRfU1RB
MSkgJiBCTFRfU1RBMV9JRExFKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7
DQo+PiAtwqDCoMKgwqDCoMKgwqAgbXNsZWVwKFBPTExfUlNUX0RFTEFZX01TKTsNCj4+ICvCoMKg
wqDCoMKgwqDCoCBtZGVsYXkoUE9MTF9SU1RfREVMQVlfTVMpOw0KPg0KPiBJbiBnZW5lcmFsLCB1
c2Ugb2YgbWRlbGF5IGlzIGRpc2NvdXJhZ2VkLiBIZXJlIHdlIGNhbiB1c2UgdWRlbGF5IA0KPiBp
bnN0ZWFkIG9mLCB3aXRoIGEgbWF4IHZhbHVlIG9mIE1BWF9VREVMQVlfTVMgd2hpY2ggaXMgMiBv
biBBUk0uDQo+DQo+IFNvLCBpbnN0ZWFkIG9mIHJ1bm5pbmcgNTAgKFBPTExfUlNUX01BWCkgdGlt
ZXMgYSAyMG1zIA0KPiAoUE9MTF9SU1RfREVMQVlfTVMpIGRlbGF5LCB3ZSBjYW4gcnVuIDUwMCB0
aW1lcyBhIDJtcyAoMjAwMHVzKSBkZWxheS4NCj4NCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNo
YWxsIGJlIGZpbmU6DQo+DQo+IMKgwqDCoCBQT0xMX1JTVF9NQVggNTAgLS0+IDUwMA0KPg0KPiDC
oMKgwqAgUE9MTF9SU1RfREVMQVlfTVPCoCAyMCAtLT4gMg0KPg0KPiDCoMKgwqAgbWRlbGF5KFBP
TExfUlNUX0RFTEFZX01TKSAtLT4gdWRlbGF5KFBPTExfUlNUX0RFTEFZX01TICogMTAwMCkNCj4N
Cj4NCj4gQlINCj4NCj4gRmFiaWVuDQo+DQo+DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgwqDCoMKg
wqAgaWYgKGkgPT0gUE9MTF9SU1RfTUFYKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIo
YmRpc3AtPmRldiwgIlJlc2V0IHRpbWVvdXRcbiIpOw==
