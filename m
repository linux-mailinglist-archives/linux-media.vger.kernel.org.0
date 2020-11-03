Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9842A4C11
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 17:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727869AbgKCQ53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 11:57:29 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:13504 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726581AbgKCQ53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 11:57:29 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3Gqusr012166;
        Tue, 3 Nov 2020 17:57:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uT3x6NEP6QX7pvC/252noMFvzAHzBCtBYBmVHufOspY=;
 b=i5ErpZ9u1EJVZ2YJ5MaywneIjpmr/5X2OjKyJlGl0ew9NVlwU0JvzCoCs5JJvVV+3xja
 vYrvc0x5d17epNMd8POLbwI6jhGBMSmoe+8EUM9cWN+xPVZDuvjVAs2gmiyNIVuVfCgd
 ptA4doJfT4uNfA9AmAO+q1W8OhmOmj4c8RxKkYas5mKtKcVUWzNBTtKmD0RSvPGyJ0xw
 P9tchjw048W4yi+kPcwJgbUNzT5AW4I0OwSXfUqzTUksv9rzuXgMdVZKDUeQ7RCx+KQk
 OOQJcGPW58NpS4aV9LNLZz6gVVJygaz/uMbcgTQOae6ujxJLtgIhOd25Kn3euji6HWqr 6g== 
Received: from beta.dmz-us.st.com (beta.dmz-us.st.com [167.4.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34h031jtd6-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 03 Nov 2020 17:57:21 +0100
Received: from zeta.dmz-us.st.com (ns4.st.com [167.4.16.71])
        by beta.dmz-us.st.com (STMicroelectronics) with ESMTP id 59EEB26;
        Tue,  3 Nov 2020 16:05:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by zeta.dmz-us.st.com (STMicroelectronics) with ESMTP id 42221E2;
        Tue,  3 Nov 2020 16:57:18 +0000 (GMT)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 17:57:17 +0100
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 3 Nov 2020 17:57:17 +0100
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
        "sam@elite-embedded.com" <sam@elite-embedded.com>
CC:     "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/3] media: i2c: ov5640: Adjust htot
Thread-Topic: [RFC 1/3] media: i2c: ov5640: Adjust htot
Thread-Index: AQHWrX2z/miY5a5HGkusyGw6CuDQ8qm2mQSA
Date:   Tue, 3 Nov 2020 16:57:17 +0000
Message-ID: <8c896df2-b075-8a32-3015-612ef8b57919@st.com>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <20201028225706.110078-2-jacopo+renesas@jmondi.org>
In-Reply-To: <20201028225706.110078-2-jacopo+renesas@jmondi.org>
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
Content-ID: <2189844B17074C4D836B674A8FCD402F@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLCBUb21pLA0KDQpUaGlzIHBhdGNoIGlzIGJyZWFraW5nIDEwMjR4NzY4QDMwZnBz
ICYgVkdBQDMwZnBzIG9uIG15IHNpZGUgd2hpY2ggYXJlIA0Kc2xvd2Rvd24gdG8gMTVmcHMuDQpU
b21pLCBwZXJoYXBzIGNvdWxkIHlvdSByZWNoZWNrIHdpdGggdGhlIGZpeGVkIEphY29wbyBzZXJp
ZSBpZiB5b3Ugc3RpbGwgDQplbmNvdW50ZXIgeW91ciBEUEhZIGVycm9yIGlzc3VlcyA/DQoNCk9u
IDEwLzI4LzIwIDExOjU3IFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+IEZyb206IFRvbWkgVmFs
a2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+DQo+IA0KPiBBZGp1c3QgaHRvdCBmb3IgbW9z
dCBvZiB0aGUgbW9kZXMuIFRoZSBudW1iZXJzIGFyZSBmcm9tIHRoZSBPVjU2NDANCj4gZGF0YXNo
ZWV0LCBhbmQgd2l0aCB0aGVzZSB0aGUgZHJpdmVyIHdvcmtzIG1vcmUgcmVsaWFibHkgb24gRFJB
NzYgRVZNICsNCj4gT1Y1NjQwLCB1c2luZyAyIGRhdGFsYW5lcy4NCj4gDQo+IFdpdGhvdXQgdGhl
IHBhdGNoLCBJIHNlZSBvZnRlbiBDb21wbGV4SU8gKGkuZS4gUEhZKSBlcnJvcnMgd2hlbg0KPiBz
dGFydGluZyB0aGUgc3RyZWFtaW5nLCBhbmQgMTI4MHg3MjAgZG9lcyBub3Qgd29yayBhdCBhbGwg
d2l0aG91dCB0aGlzDQo+IGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25k
aSA8amFjb3BvQGptb25kaS5vcmc+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0
MC5jIHwgMTYgKysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9p
MmMvb3Y1NjQwLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiBpbmRleCA4ZDAyNTRk
MGU1ZWEuLjExN2FjMjI2ODNhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y1
NjQwLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4gQEAgLTU1Myw0MiAr
NTUzLDQyIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3Y1NjQwX21vZGVfaW5mbyBvdjU2NDBfbW9k
ZV9pbml0X2RhdGEgPSB7DQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBvdjU2NDBfbW9kZV9pbmZv
DQo+ICAgb3Y1NjQwX21vZGVfZGF0YVtPVjU2NDBfTlVNX01PREVTXSA9IHsNCj4gICAJe09WNTY0
MF9NT0RFX1FDSUZfMTc2XzE0NCwgU1VCU0FNUExJTkcsDQo+IC0JIDE3NiwgMTg5NiwgMTQ0LCA5
ODQsDQo+ICsJIDE3NiwgMjg0NCwgMTQ0LCA5ODQsDQo+ICAgCSBvdjU2NDBfc2V0dGluZ19RQ0lG
XzE3Nl8xNDQsDQo+ICAgCSBBUlJBWV9TSVpFKG92NTY0MF9zZXR0aW5nX1FDSUZfMTc2XzE0NCks
DQo+ICAgCSBPVjU2NDBfMzBfRlBTfSwNCj4gICAJe09WNTY0MF9NT0RFX1FWR0FfMzIwXzI0MCwg
U1VCU0FNUExJTkcsDQo+IC0JIDMyMCwgMTg5NiwgMjQwLCA5ODQsDQo+ICsJIDMyMCwgMjg0NCwg
MjQwLCA5ODQsDQo+ICAgCSBvdjU2NDBfc2V0dGluZ19RVkdBXzMyMF8yNDAsDQo+ICAgCSBBUlJB
WV9TSVpFKG92NTY0MF9zZXR0aW5nX1FWR0FfMzIwXzI0MCksDQo+ICAgCSBPVjU2NDBfMzBfRlBT
fSwNCj4gICAJe09WNTY0MF9NT0RFX1ZHQV82NDBfNDgwLCBTVUJTQU1QTElORywNCj4gLQkgNjQw
LCAxODk2LCA0ODAsIDEwODAsDQo+ICsJIDY0MCwgMjg0NCwgNDgwLCAxMDgwLA0KPiAgIAkgb3Y1
NjQwX3NldHRpbmdfVkdBXzY0MF80ODAsDQo+ICAgCSBBUlJBWV9TSVpFKG92NTY0MF9zZXR0aW5n
X1ZHQV82NDBfNDgwKSwNCj4gICAJIE9WNTY0MF82MF9GUFN9LA0KPiAgIAl7T1Y1NjQwX01PREVf
TlRTQ183MjBfNDgwLCBTVUJTQU1QTElORywNCj4gLQkgNzIwLCAxODk2LCA0ODAsIDk4NCwNCj4g
KwkgNzIwLCAyODQ0LCA0ODAsIDk4NCwNCj4gICAJIG92NTY0MF9zZXR0aW5nX05UU0NfNzIwXzQ4
MCwNCj4gICAJIEFSUkFZX1NJWkUob3Y1NjQwX3NldHRpbmdfTlRTQ183MjBfNDgwKSwNCj4gICAJ
T1Y1NjQwXzMwX0ZQU30sDQo+ICAgCXtPVjU2NDBfTU9ERV9QQUxfNzIwXzU3NiwgU1VCU0FNUExJ
TkcsDQo+IC0JIDcyMCwgMTg5NiwgNTc2LCA5ODQsDQo+ICsJIDcyMCwgMjg0NCwgNTc2LCA5ODQs
DQo+ICAgCSBvdjU2NDBfc2V0dGluZ19QQUxfNzIwXzU3NiwNCj4gICAJIEFSUkFZX1NJWkUob3Y1
NjQwX3NldHRpbmdfUEFMXzcyMF81NzYpLA0KPiAgIAkgT1Y1NjQwXzMwX0ZQU30sDQo+ICAgCXtP
VjU2NDBfTU9ERV9YR0FfMTAyNF83NjgsIFNVQlNBTVBMSU5HLA0KPiAtCSAxMDI0LCAxODk2LCA3
NjgsIDEwODAsDQo+ICsJIDEwMjQsIDI4NDQsIDc2OCwgMTA4MCwNCj4gICAJIG92NTY0MF9zZXR0
aW5nX1hHQV8xMDI0Xzc2OCwNCj4gICAJIEFSUkFZX1NJWkUob3Y1NjQwX3NldHRpbmdfWEdBXzEw
MjRfNzY4KSwNCj4gICAJIE9WNTY0MF8zMF9GUFN9LA0KPiAgIAl7T1Y1NjQwX01PREVfNzIwUF8x
MjgwXzcyMCwgU1VCU0FNUExJTkcsDQo+IC0JIDEyODAsIDE4OTIsIDcyMCwgNzQwLA0KPiArCSAx
MjgwLCAyODQ0LCA3MjAsIDc0MCwNCj4gICAJIG92NTY0MF9zZXR0aW5nXzcyMFBfMTI4MF83MjAs
DQo+ICAgCSBBUlJBWV9TSVpFKG92NTY0MF9zZXR0aW5nXzcyMFBfMTI4MF83MjApLA0KPiAgIAkg
T1Y1NjQwXzMwX0ZQU30sDQo+ICAgCXtPVjU2NDBfTU9ERV8xMDgwUF8xOTIwXzEwODAsIFNDQUxJ
TkcsDQo+IC0JIDE5MjAsIDI1MDAsIDEwODAsIDExMjAsDQo+ICsJIDE5MjAsIDI4NDQsIDEwODAs
IDExMjAsDQo+ICAgCSBvdjU2NDBfc2V0dGluZ18xMDgwUF8xOTIwXzEwODAsDQo+ICAgCSBBUlJB
WV9TSVpFKG92NTY0MF9zZXR0aW5nXzEwODBQXzE5MjBfMTA4MCksDQo+ICAgCSBPVjU2NDBfMzBf
RlBTfSwNCj4gDQoNCkJSLA0KSHVndWVzLg==
