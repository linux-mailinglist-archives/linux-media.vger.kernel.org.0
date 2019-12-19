Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55BB712609B
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 12:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfLSLOd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 06:14:33 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:9356 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726652AbfLSLOd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 06:14:33 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBJBCcnw019682;
        Thu, 19 Dec 2019 12:14:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4DH0Y238d7Wa37JIqOQTzV4EkbII3MUe3/621B6vq5M=;
 b=assYaglFheKroe0eamwOjLzwZ0X8/lelbETKKlDNBVzDTPrj6RVZmE0IJazNBy5BjUf9
 gHu2JpPsLAsgKWAsWLIqd/tEWi5XywAFODSrqI4SWVXQTIiZI74WJbBVPNIUI2hoIyde
 hSyhnAswsCANd7Nhqu8qfjqKMECP1kHaBVpl4WyBVJ+KXAgSF+pY0/ENrOQusLvHccfL
 U327LcISTqzAZrKFbMw58MLdmbcF1gn9Fh07A8bNJjSGqMaUvb3RoW5jMBGFaTjjri5N
 +PyazmxYq/KmJ0NOJMvVupza0vHJCERSsXvpGBaP9dDGkCKLgI3gRX2yFApQrGULMN6/ 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wvnresbhj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 19 Dec 2019 12:14:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EBDD10002A;
        Thu, 19 Dec 2019 12:14:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 13B892B7CF1;
        Thu, 19 Dec 2019 12:14:27 +0100 (CET)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 12:14:26 +0100
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 19 Dec 2019 12:14:26 +0100
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] media: sti: bdisp: fix a possible
 sleep-in-atomic-context bug in bdisp_device_run()
Thread-Topic: [PATCH v2] media: sti: bdisp: fix a possible
 sleep-in-atomic-context bug in bdisp_device_run()
Thread-Index: AQHVtlfrPw2yzNMArUeBusJIxHDM7afBPX8A
Date:   Thu, 19 Dec 2019 11:14:26 +0000
Message-ID: <b4be57d4-4f9a-ff4a-6fce-35b5f48570cb@st.com>
References: <20191219103401.13630-1-baijiaju1990@gmail.com>
In-Reply-To: <20191219103401.13630-1-baijiaju1990@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEAD2AD213634348AE8513782E079167@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-19_01:2019-12-17,2019-12-19 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhhbmsgeW91IQ0KDQoNCk9uIDE5LzEyLzIwMTkgMTE6MzQgQU0sIEppYS1KdSBCYWkgd3JvdGU6
DQo+IFRoZSBkcml2ZXIgbWF5IHNsZWVwIHdoaWxlIGhvbGRpbmcgYSBzcGlubG9jay4NCj4gVGhl
IGZ1bmN0aW9uIGNhbGwgcGF0aCAoZnJvbSBib3R0b20gdG8gdG9wKSBpbiBMaW51eCA0LjE5IGlz
Og0KPg0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC1ody5jLCAzODU6
DQo+ICAgICAgbXNsZWVwIGluIGJkaXNwX2h3X3Jlc2V0DQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vc3RpL2JkaXNwL2JkaXNwLXY0bDIuYywgMzQxOg0KPiAgICAgIGJkaXNwX2h3X3Jlc2V0IGlu
IGJkaXNwX2RldmljZV9ydW4NCj4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRp
c3AtdjRsMi5jLCAzMTc6DQo+ICAgICAgX3Jhd19zcGluX2xvY2tfaXJxc2F2ZSBpbiBiZGlzcF9k
ZXZpY2VfcnVuDQo+DQo+IFRvIGZpeCB0aGlzIGJ1ZywgbXNsZWVwKCkgaXMgcmVwbGFjZWQgd2l0
aCB1ZGVsYXkoKS4NCj4NCj4gVGhpcyBidWcgaXMgZm91bmQgYnkgYSBzdGF0aWMgYW5hbHlzaXMg
dG9vbCBTVENoZWNrIHdyaXR0ZW4gYnkgbXlzZWxmLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKaWEt
SnUgQmFpIDxiYWlqaWFqdTE5OTBAZ21haWwuY29tPg0KDQoNClJldmlld2VkLWJ5OiBGYWJpZW4g
RGVzc2VubmUgPGZhYmllbi5kZXNzZW5uZUBzdC5jb20+DQoNCg0KPiAtLS0NCj4gdjI6DQo+ICog
VXNlIHVkZWxheSgpIGluc3RlYWQgb2YgbWRlbGF5KCkuDQo+ICAgIFRoYW5rIEZhYmllbiBmb3Ig
Z29vZCBhZHZpY2UuDQo+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2Jk
aXNwL2JkaXNwLWh3LmMgfCA2ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3N0aS9iZGlzcC9iZGlzcC1ody5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkv
YmRpc3AvYmRpc3AtaHcuYw0KPiBpbmRleCA0MzcyYWJiYjU5NTAuLmE3NGU5ZmQ2NTIzOCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtaHcuYw0K
PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC1ody5jDQo+IEBA
IC0xNCw4ICsxNCw4IEBADQo+ICAgI2RlZmluZSBNQVhfU1JDX1dJRFRIICAgICAgICAgICAyMDQ4
DQo+ICAgDQo+ICAgLyogUmVzZXQgJiBib290IHBvbGwgY29uZmlnICovDQo+IC0jZGVmaW5lIFBP
TExfUlNUX01BWCAgICAgICAgICAgIDUwDQo+IC0jZGVmaW5lIFBPTExfUlNUX0RFTEFZX01TICAg
ICAgIDIwDQo+ICsjZGVmaW5lIFBPTExfUlNUX01BWCAgICAgICAgICAgIDUwMA0KPiArI2RlZmlu
ZSBQT0xMX1JTVF9ERUxBWV9NUyAgICAgICAyDQo+ICAgDQo+ICAgZW51bSBiZGlzcF90YXJnZXRf
cGxhbiB7DQo+ICAgCUJESVNQX1JHQiwNCj4gQEAgLTM4Miw3ICszODIsNyBAQCBpbnQgYmRpc3Bf
aHdfcmVzZXQoc3RydWN0IGJkaXNwX2RldiAqYmRpc3ApDQo+ICAgCWZvciAoaSA9IDA7IGkgPCBQ
T0xMX1JTVF9NQVg7IGkrKykgew0KPiAgIAkJaWYgKHJlYWRsKGJkaXNwLT5yZWdzICsgQkxUX1NU
QTEpICYgQkxUX1NUQTFfSURMRSkNCj4gICAJCQlicmVhazsNCj4gLQkJbXNsZWVwKFBPTExfUlNU
X0RFTEFZX01TKTsNCj4gKwkJdWRlbGF5KFBPTExfUlNUX0RFTEFZX01TICogMTAwMCk7DQo+ICAg
CX0NCj4gICAJaWYgKGkgPT0gUE9MTF9SU1RfTUFYKQ0KPiAgIAkJZGV2X2VycihiZGlzcC0+ZGV2
LCAiUmVzZXQgdGltZW91dFxuIik7
