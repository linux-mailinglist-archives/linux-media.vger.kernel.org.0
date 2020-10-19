Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E1C29259A
	for <lists+linux-media@lfdr.de>; Mon, 19 Oct 2020 12:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgJSKUU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Oct 2020 06:20:20 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:5850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726421AbgJSKUU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Oct 2020 06:20:20 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09JAHlFg030633;
        Mon, 19 Oct 2020 12:20:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WGENNG6DUtyjPs25lMIjm++FozcEfG/A8smjVsEwavo=;
 b=lFyyHNbGn3d9+8PqWsm0aL00a6C/NFB6V6v3jtdm1O4IlE0m8Wyn0ZUW8oNsJeFPp87l
 XwypLjOFkln6gbkhgXvvGnizJa7f6YIIrEYfkdqRTyxoyO04IeHtZr9+RIkGOcKEKDWB
 nUj4zJnFukjsH96wmC3CvP2Yiw7VcjS3/UiYesISR0u7bOyKqG/klOhnQp5I9hwrrPgM
 KcPgYsErmyG4TEYgTENxsHSiNrrqNyGqa7h+dKv9SFw2ad+ZYCovZdksfvrE6RhmilP/
 j9RkDba+qqhV6iTG2Gz4LYAmnl5A3FmJKT06/JqsIyU1kqmSwvgoDkIbn4C+GcWH/6F+ gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 347p30aap9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Oct 2020 12:20:00 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39E6C10002A;
        Mon, 19 Oct 2020 12:19:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0ED522AB724;
        Mon, 19 Oct 2020 12:19:59 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Oct
 2020 12:19:58 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Mon, 19 Oct 2020 12:19:58 +0200
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
Thread-Index: AQHWoUBkV9IGF/l+kUSwjdCwug2yKamYr2IAgAXvYoA=
Date:   Mon, 19 Oct 2020 10:19:58 +0000
Message-ID: <254e2f2e-94ca-2421-1a1b-bcd43a75b847@st.com>
References: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
 <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
 <1e1eb9d1-75af-c560-7d06-14d25bb52b3f@st.com>
In-Reply-To: <1e1eb9d1-75af-c560-7d06-14d25bb52b3f@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <950951452643D147BFF22B2EE1F82CD0@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-19_02:2020-10-16,2020-10-19 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpJIGhhdmUgcXVlc3Rpb25zIGFib3V0ICJidXMtdHlwZSIgaGFuZGxpbmcg
YmVsb3cuDQoNCk9uIDEwLzE1LzIwIDU6NDEgUE0sIEh1Z3VlcyBGUlVDSEVUIHdyb3RlOg0KPiBI
aSBTYWthcmksDQo+IA0KPiBUaGFua3MgZm9yIHJldmlld2luZywNCj4gDQo+IE9uIDEwLzEzLzIw
IDExOjA3IEFNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+PiBIaSBIdWd1ZXMsDQo+Pg0KPj4gT24g
V2VkLCBPY3QgMDcsIDIwMjAgYXQgMDY6MTQ6NTBQTSArMDIwMCwgSHVndWVzIEZydWNoZXQgd3Jv
dGU6DQo+Pj4gQWRkIHN1cHBvcnQgb2YgQlQ2NTYgZW1iZWRkZWQgc3luY2hyb25pemF0aW9uIGJ1
cy4NCj4+PiBUaGlzIG1vZGUgYWxsb3dzIHRvIHNhdmUgaGFyZHdhcmUgc3luY2hybyBsaW5lcyBo
c3luYyAmIHZzeW5jDQo+Pj4gYnkgcmVwbGFjaW5nIHRoZW0gd2l0aCBzeW5jaHJvIGNvZGVzIGVt
YmVkZGVkIGluIGRhdGEgc3RyZWFtLg0KPj4+IFRoaXMgYnVzIHR5cGUgaXMgb25seSBjb21wYXRp
YmxlIHdpdGggOCBiaXRzIHdpZHRoIGRhdGEgYnVzLg0KPj4+IER1ZSB0byByZXNlcnZlZCB2YWx1
ZXMgMHgwMCAmIDB4ZmYgdXNlZCBmb3Igc3luY2hybyBjb2RlcywNCj4+PiB2YWxpZCBkYXRhIG9u
bHkgdmFyeSBmcm9tIDB4MSB0byAweGZlLCB0aGlzIGlzIHVwIHRvIHNlbnNvcg0KPj4+IHRvIGNs
aXAgYWNjb3JkaW5nbHkgcGl4ZWwgZGF0YS4gQXMgYSBjb25zZXF1ZW5jZSBvZiB0aGlzDQo+Pj4g
Y2xpcHBpbmcsIEpQRUcgaXMgbm90IHN1cHBvcnRlZCB3aGVuIHVzaW5nIHRoaXMgYnVzIHR5cGUu
DQo+Pj4gRENNSSBjcm9wIGZlYXR1cmUgaXMgYWxzbyBub3QgYXZhaWxhYmxlIHdpdGggdGhpcyBi
dXMgdHlwZS4NCj4+DQo+PiBZb3UgY2FuIGhhdmUgbW9yZSB0aGFuIDYyIGNoYXJhY3RlcnMgcGVy
IGxpbmUuIEluIGZhY3QsIDc1IGlzIHRoZQ0KPj4gcmVjb21tZW5kZWQgbWF4aW11bS4NCj4+DQo+
PiBZb3Ugc2hvdWxkIGFsc28gYW1lbmQgdGhlIGJpbmRpbmdzIHRvIGNvdmVyIEJULjY1NiBtb2Rl
LiBBbHNvIGJ1cy10eXBlDQo+PiBzaG91bGQgcHJvYmFibHkgYmUgbWFkZSBtYW5kYXRvcnksIHRv
by4NCj4gV2lsbCBkbyBib3RoLg0KPiANCg0KTXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBwYXJh
bGxlbCBCVDY1NiBidXMgaXMgaGFuZGxlZCBieSB0aGUgYWJzZW5jZSANCm9mIGhzeW5jL3ZzeW5j
LWFjdGl2ZSwgYXMgc3RhdGVkIGluIA0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Og0KIiAgTm90ZSwgdGhhdCBpZiBIU1lOQyBhbmQg
VlNZTkMgcG9sYXJpdGllcyBhcmUgbm90IHNwZWNpZmllZCwgZW1iZWRkZWQNCiAgIHN5bmNocm9u
aXphdGlvbiBtYXkgYmUgcmVxdWlyZWQsIHdoZXJlIHN1cHBvcnRlZC4gIg0KDQpEbyB5b3Ugd2Fu
dCB0byBlbmZvcmNlIHVzYWdlIG9mICJidXMtdHlwZSIgbm93IGluIG9yZGVyIHRvIGJlIG1vcmUg
DQpleHBsaWNpdCBvbiBwYXJhbGxlbCBvciBidDY1NiA/DQpJZiBJIGNoYW5nZSBiaW5kaW5nIHRv
IG1ha2UgImJ1cy10eXBlIiByZXF1aXJlZCwgSSBoYXZlIHRvIGNoYW5nZSB0aGUgDQpjdXJyZW50
IGJvYXJkIGRldmljZXRyZWUgZmlsZXMgdG8gYWRkIHN1cHBvcnQgb2YgaXQsIGFuZCBJIHdvdWxk
IHByZWZlciANCnRvIG5vdCBkbyB0aGF0LiBJcyB0aGVyZSBhIHdheSB0byBwdXQgImJ1cy10eXBl
IiBhcyBub3QgbWFuZGF0b3J5IGFuZCANCnJlbHkgb24gYWJzZW5jZSBvZiBoc3luYy92eXNuYyB0
byB0cmlnIEJUNjU2ID8gSSB3aWxsIG5ldmVydGhlbGVzcyBhbWVuZCANCmJpbmRpbmdzIGluIG9y
ZGVyIHRvIGRvY3VtZW50IHRoYXQuDQpXaGF0IGRvIHlvdSBzdWdnZXN0ID8NCg0KPj4NCj4+Pg0K
Pj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+
DQo+Pj4gLS0tDQo+Pj4gwqAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21p
LmMgfCAzNyANCj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMgDQo+
Pj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4+IGluZGV4
IGZkMWM0MWMuLmQ3ZDdjZGIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9zdG0zMi9zdG0zMi1kY21pLmMNCj4+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0
bTMyL3N0bTMyLWRjbWkuYw0KPj4+IEBAIC0xNTcsNiArMTU3LDcgQEAgc3RydWN0IHN0bTMyX2Rj
bWkgew0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IHZiMl9xdWV1ZcKgwqDCoMKgwqDCoMKgIHF1ZXVl
Ow0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IHY0bDJfZndub2RlX2J1c19wYXJhbGxlbMKgwqDCoCBi
dXM7DQo+Pj4gK8KgwqDCoCBlbnVtIHY0bDJfbWJ1c190eXBlwqDCoMKgwqDCoMKgwqAgYnVzX3R5
cGU7DQo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY29tcGxldGlvbsKgwqDCoMKgwqDCoMKgIGNvbXBs
ZXRlOw0KPj4+IMKgwqDCoMKgwqAgc3RydWN0IGNsa8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKm1j
bGs7DQo+Pj4gwqDCoMKgwqDCoCBlbnVtIHN0YXRlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0
ZTsNCj4+PiBAQCAtNzc3LDYgKzc3OCwyMyBAQCBzdGF0aWMgaW50IGRjbWlfc3RhcnRfc3RyZWFt
aW5nKHN0cnVjdCB2YjJfcXVldWUgDQo+Pj4gKnZxLCB1bnNpZ25lZCBpbnQgY291bnQpDQo+Pj4g
wqDCoMKgwqDCoCBpZiAoZGNtaS0+YnVzLmZsYWdzICYgVjRMMl9NQlVTX1BDTEtfU0FNUExFX1JJ
U0lORykNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsIHw9IENSX1BDS1BPTDsNCj4+PiArwqDC
oMKgIC8qDQo+Pj4gK8KgwqDCoMKgICogQlQ2NTYgZW1iZWRkZWQgc3luY2hyb25pc2F0aW9uIGJ1
cyBtb2RlLg0KPj4+ICvCoMKgwqDCoCAqDQo+Pj4gK8KgwqDCoMKgICogRGVmYXVsdCBTQVYvRUFW
IG1vZGUgaXMgc3VwcG9ydGVkIGhlcmUgd2l0aCBkZWZhdWx0IGNvZGVzDQo+Pj4gK8KgwqDCoMKg
ICogU0FWPTB4ZmYwMDAwODAgJiBFQVY9MHhmZjAwMDA5ZC4NCj4+PiArwqDCoMKgwqAgKiBXaXRo
IERDTUkgdGhpcyBtZWFucyBMU0M9U0FWPTB4ODAgJiBMRUM9RUFWPTB4OWQuDQo+Pj4gK8KgwqDC
oMKgICovDQo+Pj4gK8KgwqDCoCBpZiAoZGNtaS0+YnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2
KSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHZhbCB8PSBDUl9FU1M7DQo+Pj4gKw0KPj4+ICvCoMKg
wqDCoMKgwqDCoCAvKiBVbm1hc2sgYWxsIGNvZGVzICovDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
Z193cml0ZShkY21pLT5yZWdzLCBEQ01JX0VTVVIsIDB4ZmZmZmZmZmYpOy8qIA0KPj4+IEZFQzpM
RUM6TFNDOkZTQyAqLw0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogVHJpZyBvbiBMU0M9
MHg4MCAmIExFQz0weDlkIGNvZGVzLCBpZ25vcmUgRlNDIGFuZCBGRUMgKi8NCj4+PiArwqDCoMKg
wqDCoMKgwqAgcmVnX3dyaXRlKGRjbWktPnJlZ3MsIERDTUlfRVNDUiwgMHhmZjlkODBmZik7Lyog
DQo+Pj4gRkVDOkxFQzpMU0M6RlNDICovDQo+Pj4gK8KgwqDCoCB9DQo+Pj4gKw0KPj4+IMKgwqDC
oMKgwqAgcmVnX3dyaXRlKGRjbWktPnJlZ3MsIERDTUlfQ1IsIHZhbCk7DQo+Pj4gwqDCoMKgwqDC
oCAvKiBTZXQgY3JvcCAqLw0KPj4+IEBAIC0xMDY3LDggKzEwODUsOSBAQCBzdGF0aWMgaW50IGRj
bWlfc2V0X2ZtdChzdHJ1Y3Qgc3RtMzJfZGNtaSANCj4+PiAqZGNtaSwgc3RydWN0IHY0bDJfZm9y
bWF0ICpmKQ0KPj4+IMKgwqDCoMKgwqAgaWYgKHJldCkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsNCj4+PiAtwqDCoMKgIC8qIERpc2FibGUgY3JvcCBpZiBKUEVHIGlzIHJlcXVl
c3RlZCAqLw0KPj4+IC3CoMKgwqAgaWYgKHBpeC0+cGl4ZWxmb3JtYXQgPT0gVjRMMl9QSVhfRk1U
X0pQRUcpDQo+Pj4gK8KgwqDCoCAvKiBEaXNhYmxlIGNyb3AgaWYgSlBFRyBpcyByZXF1ZXN0ZWQg
b3IgQlQ2NTYgYnVzIGlzIHNlbGVjdGVkICovDQo+Pj4gK8KgwqDCoCBpZiAocGl4LT5waXhlbGZv
cm1hdCA9PSBWNEwyX1BJWF9GTVRfSlBFRyAmJg0KPj4+ICvCoMKgwqDCoMKgwqDCoCBkY21pLT5i
dXNfdHlwZSAhPSBWNEwyX01CVVNfQlQ2NTYpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRjbWkt
PmRvX2Nyb3AgPSBmYWxzZTsNCj4+PiDCoMKgwqDCoMKgIC8qIHBpeCB0byBtYnVzIGZvcm1hdCAq
Lw0KPj4+IEBAIC0xNTkyLDYgKzE2MTEsMTEgQEAgc3RhdGljIGludCBkY21pX2Zvcm1hdHNfaW5p
dChzdHJ1Y3Qgc3RtMzJfZGNtaSANCj4+PiAqZGNtaSkNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoZGNtaV9mb3JtYXRzW2ldLm1idXNfY29kZSAhPSBtYnVzX2NvZGUuY29kZSkN
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIEV4Y2x1ZGUgSlBFRyBpZiBCVDY1NiBidXMgaXMgc2Vs
ZWN0ZWQgKi8NCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZGNtaV9mb3JtYXRzW2ld
LmZvdXJjYyA9PSBWNEwyX1BJWF9GTVRfSlBFRyAmJg0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGNtaS0+YnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2KQ0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7DQo+Pj4gKw0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIENvZGUgc3VwcG9ydGVkLCBoYXZlIHdlIGdvdCB0aGlzIGZv
dXJjYyB5ZXQ/ICovDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZm9yIChqID0gMDsg
aiA8IG51bV9mbXRzOyBqKyspDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoc2RfZm10c1tqXS0+Zm91cmNjID09DQo+Pj4gQEAgLTE4NzMsOSArMTg5NywxOCBAQCBz
dGF0aWMgaW50IGRjbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSANCj4+PiAqcGRldikN
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAiQ1NJIGJ1cyBub3Qg
c3VwcG9ydGVkXG4iKTsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+
Pj4gwqDCoMKgwqDCoCB9DQo+Pj4gKw0KPj4+ICvCoMKgwqAgaWYgKGVwLmJ1c190eXBlID09IFY0
TDJfTUJVU19CVDY1NiAmJg0KPj4+ICvCoMKgwqDCoMKgwqDCoCBlcC5idXMucGFyYWxsZWwuYnVz
X3dpZHRoICE9IDgpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycigmcGRldi0+ZGV2LCAi
QlQ2NTYgYnVzIGNvbmZsaWN0cyB3aXRoICVkIGJpdHMgYnVzIA0KPj4+IHdpZHRoICg4IGJpdHMg
cmVxdWlyZWQpXG4iLA0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVwLmJ1cy5wYXJhbGxl
bC5idXNfd2lkdGgpOw0KPj4NCj4+IGJ1c193aWR0aCBpcyB1bnNpZ25lZCBoZXJlLg0KPiBJIHdp
bGwgZml4IGl0Lg0KPiANCj4+DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0K
Pj4+ICvCoMKgwqAgfQ0KPj4+ICsNCj4+PiDCoMKgwqDCoMKgIGRjbWktPmJ1cy5mbGFncyA9IGVw
LmJ1cy5wYXJhbGxlbC5mbGFnczsNCj4+PiDCoMKgwqDCoMKgIGRjbWktPmJ1cy5idXNfd2lkdGgg
PSBlcC5idXMucGFyYWxsZWwuYnVzX3dpZHRoOw0KPj4+IMKgwqDCoMKgwqAgZGNtaS0+YnVzLmRh
dGFfc2hpZnQgPSBlcC5idXMucGFyYWxsZWwuZGF0YV9zaGlmdDsNCj4+PiArwqDCoMKgIGRjbWkt
PmJ1c190eXBlID0gZXAuYnVzX3R5cGU7DQo+Pj4gwqDCoMKgwqDCoCBpcnEgPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIDApOw0KPj4+IMKgwqDCoMKgwqAgaWYgKGlycSA8PSAwKQ0KPj4NCj4gDQo+
IEJSLA0KPiBIdWd1ZXMuDQoNCkJSLA0KSHVndWVzLg==
