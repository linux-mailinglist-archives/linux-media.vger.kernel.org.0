Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E9B125D2A
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 10:01:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLSJB0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 04:01:26 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:40300 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726620AbfLSJB0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 04:01:26 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBJ8sFHe010665;
        Thu, 19 Dec 2019 10:01:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TEeByFJ0CY0UkpT28k/1zNZXZNmAfuYl1OecILg9r/w=;
 b=GYVZ0l9UQAE9O2RYrUCbhuq888RdQ92uzp7iwz48zy94d1zqC0ND0l7BVscx77dgrexm
 wtAN32f9FLo9lDTzVqKM9Pe7vvso08s5UC0uSTqn1+Mskl6gz4pd8EGLd9HVA6ACizDd
 luifAI4Or7xeES3wbQutdutIjRdlTkt7lfm5hkYRJ7IOdTo/Uu3zjg79q0977u86yBwQ
 b6hcC/6mUGXhnhyYUqJqHf2imhGuiYoi6pepArZfbnau+fratBitcIxM/RIKeYfGWhs6
 QsYcqKftFieN1/mUqeEhMxeUHhyoZzU+0X3i3oBkTevD3VS0O3dfkBHo5zTVkq3hZ1dT TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wvqgq0bk4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Dec 2019 10:01:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E74BC10002A;
        Thu, 19 Dec 2019 10:01:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DAD602A7C94;
        Thu, 19 Dec 2019 10:01:17 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 10:01:17 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 19 Dec 2019 10:01:17 +0100
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: sti: bdisp: fix a possible sleep-in-atomic-context
 bug in bdisp_device_run()
Thread-Topic: [PATCH] media: sti: bdisp: fix a possible
 sleep-in-atomic-context bug in bdisp_device_run()
Thread-Index: AQHVtaxEax7uyZMMgkib5/WTY24ilKfBGaKA
Date:   Thu, 19 Dec 2019 09:01:17 +0000
Message-ID: <705a5381-4edd-211e-9602-78a2b4b67ea9@st.com>
References: <20191218140537.12193-1-baijiaju1990@gmail.com>
In-Reply-To: <20191218140537.12193-1-baijiaju1990@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D86BCCFDAB86684C9BEAEEB52316D4CD@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_08:2019-12-17,2019-12-18 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmlhX0p1LA0KDQoNClRoaXMgaXMgYSBnb29kIGZpbmRpbmcuIFNlZSBteSByZW1hcmtzIGJl
bG93Lg0KDQoNCk9uIDE4LzEyLzIwMTkgMzowNSBQTSwgSmlhLUp1IEJhaSB3cm90ZToNCj4gVGhl
IGRyaXZlciBtYXkgc2xlZXAgd2hpbGUgaG9sZGluZyBhIHNwaW5sb2NrLg0KPiBUaGUgZnVuY3Rp
b24gY2FsbCBwYXRoIChmcm9tIGJvdHRvbSB0byB0b3ApIGluIExpbnV4IDQuMTkgaXM6DQo+DQo+
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLWh3LmMsIDM4NToNCj4gCW1z
bGVlcCBpbiBiZGlzcF9od19yZXNldA0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlz
cC9iZGlzcC12NGwyLmMsIDM0MToNCj4gCWJkaXNwX2h3X3Jlc2V0IGluIGJkaXNwX2RldmljZV9y
dW4NCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jLCAzMTc6
DQo+IAlfcmF3X3NwaW5fbG9ja19pcnFzYXZlIGluIGJkaXNwX2RldmljZV9ydW4NCj4NCj4gVG8g
Zml4IHRoaXMgYnVnLCBtc2xlZXAoKSBpcyByZXBsYWNlZCB3aXRoIG1kZWxheSgpLg0KPg0KPiBU
aGlzIGJ1ZyBpcyBmb3VuZCBieSBhIHN0YXRpYyBhbmFseXNpcyB0b29sIFNUQ2hlY2sgd3JpdHRl
biBieSBteXNlbGYuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEppYS1KdSBCYWkgPGJhaWppYWp1MTk5
MEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNw
L2JkaXNwLWh3LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0
aS9iZGlzcC9iZGlzcC1ody5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRp
c3AtaHcuYw0KPiBpbmRleCA0MzcyYWJiYjU5NTAuLjFhNTYzNDg4MDVhMiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtaHcuYw0KPiArKysgYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC1ody5jDQo+IEBAIC0zODIsNyAr
MzgyLDcgQEAgaW50IGJkaXNwX2h3X3Jlc2V0KHN0cnVjdCBiZGlzcF9kZXYgKmJkaXNwKQ0KPiAg
IAlmb3IgKGkgPSAwOyBpIDwgUE9MTF9SU1RfTUFYOyBpKyspIHsNCj4gICAJCWlmIChyZWFkbChi
ZGlzcC0+cmVncyArIEJMVF9TVEExKSAmIEJMVF9TVEExX0lETEUpDQo+ICAgCQkJYnJlYWs7DQo+
IC0JCW1zbGVlcChQT0xMX1JTVF9ERUxBWV9NUyk7DQo+ICsJCW1kZWxheShQT0xMX1JTVF9ERUxB
WV9NUyk7DQoNCkluIGdlbmVyYWwsIHVzZSBvZiBtZGVsYXkgaXMgZGlzY291cmFnZWQuIEhlcmUg
d2UgY2FuIHVzZSB1ZGVsYXkgaW5zdGVhZCANCm9mLCB3aXRoIGEgbWF4IHZhbHVlIG9mIE1BWF9V
REVMQVlfTVMgd2hpY2ggaXMgMiBvbiBBUk0uDQoNClNvLCBpbnN0ZWFkIG9mIHJ1bm5pbmcgNTAg
KFBPTExfUlNUX01BWCkgdGltZXMgYSAyMG1zIA0KKFBPTExfUlNUX0RFTEFZX01TKSBkZWxheSwg
d2UgY2FuIHJ1biA1MDAgdGltZXMgYSAybXMgKDIwMDB1cykgZGVsYXkuDQoNClRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaGFsbCBiZSBmaW5lOg0KDQogwqDCoMKgIFBPTExfUlNUX01BWCA1MCAtLT4g
NTAwDQoNCiDCoMKgwqAgUE9MTF9SU1RfREVMQVlfTVPCoCAyMCAtLT4gMg0KDQogwqDCoMKgIG1k
ZWxheShQT0xMX1JTVF9ERUxBWV9NUykgLS0+IHVkZWxheShQT0xMX1JTVF9ERUxBWV9NUyAqIDEw
MDApDQoNCg0KQlINCg0KRmFiaWVuDQoNCg0KPiAgIAl9DQo+ICAgCWlmIChpID09IFBPTExfUlNU
X01BWCkNCj4gICAJCWRldl9lcnIoYmRpc3AtPmRldiwgIlJlc2V0IHRpbWVvdXRcbiIpOw==
