Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 977F11322D0
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 10:47:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgAGJq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 04:46:56 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:3320 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726485AbgAGJq4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 04:46:56 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0079hXZE002027;
        Tue, 7 Jan 2020 10:46:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PbJCZFncQBZH/BlAK8ELONqW5LqwKaEvIZc7w5b0OYI=;
 b=RCbEkKpltn980AU8jCPraagLch9+XkO2So8RCosC4vLxjWoswqVX78LebnrISoiwapKm
 JuZlqJt+r+uy7BJtymA2T/56uij5CmU6ncVS9S/AYkKDPl2jNyhfVpNZ9bTfLHRHzQAW
 lUFlxbq8pQ/dpU4/9thGZxZPcOS68rSnmiE84fhiEIQjrSahRsjx/3UuTOr0GXrRuDnp
 bTT+gCrwIaQWjK+Iby3JMHagMY24XdafhZ5eVOcMVpaBRGWXTKagH1N1zBdnwHScu535
 Z28CSxglPzWQqcYFDBXwn8GcStcvYEb4QnMNo61rGubr5/LfAr5SmLb3BUhrWSjGuphW JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm5d5km-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 10:46:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 414D0100034;
        Tue,  7 Jan 2020 10:46:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2EE722A8204;
        Tue,  7 Jan 2020 10:46:41 +0100 (CET)
Received: from SFHDAG5NODE2.st.com (10.75.127.14) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan
 2020 10:46:40 +0100
Received: from SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0]) by
 SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0%20]) with mapi id
 15.00.1473.003; Tue, 7 Jan 2020 10:46:40 +0100
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "vkoul@kernel.org" <vkoul@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: stm32-dcmi: Use dma_request_chan() instead
 dma_request_slave_channel()
Thread-Topic: [PATCH] media: stm32-dcmi: Use dma_request_chan() instead
 dma_request_slave_channel()
Thread-Index: AQHVtMaOm1nAskP+t06Lg3ivGfEhOKe/qEeAgB9cIQA=
Date:   Tue, 7 Jan 2020 09:46:40 +0000
Message-ID: <8229c7ed-b513-6bf8-5684-60d87a92d41f@st.com>
References: <20191217104135.23554-1-peter.ujfalusi@ti.com>
 <84946ffd-8e90-7b6a-6667-a10e27d31655@st.com>
In-Reply-To: <84946ffd-8e90-7b6a-6667-a10e27d31655@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CF506707FC8704EA5378A1A551351F2@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_02:2020-01-06,2020-01-07 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGV0ZXIsDQoNCklmIG5vdCB0b28gbGF0ZSwgY291bGQgeW91IGNoYW5nZSB0cmFjZSB0byBv
bmx5IHRyaWcgZXJyb3IgdHJhY2Ugd2hlbg0KZXJyb3IgaXMgbm90ICJwcm9iZSBkZWZlcmVkIiA/
IFNlZSBiZWxvdzoNCg0KLQljaGFuID0gZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCgmcGRldi0+
ZGV2LCAidHgiKTsNCi0JaWYgKCFjaGFuKSB7DQotCQlkZXZfaW5mbygmcGRldi0+ZGV2LCAiVW5h
YmxlIHRvIHJlcXVlc3QgRE1BIGNoYW5uZWwsIGRlZmVyIHByb2JpbmdcbiIpOw0KLQkJcmV0dXJu
IC1FUFJPQkVfREVGRVI7DQorCWNoYW4gPSBkbWFfcmVxdWVzdF9jaGFuKCZwZGV2LT5kZXYsICJ0
eCIpOw0KKwlpZiAoSVNfRVJSKGNoYW4pKSB7DQorCQlpZiAoUFRSX0VSUihjaGFuKSAhPSAtRVBS
T0JFX0RFRkVSKQ0KKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIlVuYWJsZSB0byByZXF1ZXN0IERN
QSBjaGFubmVsXG4iKTsNCisJCXJldHVybiBQVFJfRVJSKGNoYW4pOw0KDQoNCkJlc3QgcmVnYXJk
cywNCkh1Z3Vlcy4NCg0KT24gMTIvMTgvMTkgMTE6NTIgQU0sIEh1Z3VlcyBGUlVDSEVUIHdyb3Rl
Og0KPiBUaGFua3MgZm9yIHBhdGNoaW5nIFBldGVyLA0KPiANCj4gTm8gcmVncmVzc2lvbiBvYnNl
cnZlZCBvbiBteSBzaWRlLg0KPiANCj4gQWNrZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMu
ZnJ1Y2hldEBzdC5jb20+DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEh1Z3Vlcy4NCj4gDQo+IE9u
IDEyLzE3LzE5IDExOjQxIEFNLCBQZXRlciBVamZhbHVzaSB3cm90ZToNCj4+IGRtYV9yZXF1ZXN0
X3NsYXZlX2NoYW5uZWwoKSBpcyBhIHdyYXBwZXIgb24gdG9wIG9mIGRtYV9yZXF1ZXN0X2NoYW4o
KQ0KPj4gZWF0aW5nIHVwIHRoZSBlcnJvciBjb2RlLg0KPj4NCj4+IEJ5IHVzaW5nIGRtYV9yZXF1
ZXN0X2NoYW4oKSBkaXJlY3RseSB0aGUgZHJpdmVyIGNhbiBzdXBwb3J0IGRlZmVycmVkDQo+PiBw
cm9iaW5nIGFnYWluc3QgRE1BLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFVqZmFsdXNp
IDxwZXRlci51amZhbHVzaUB0aS5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIHwgNiArKystLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIA0KPj4gYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gaW5kZXggOTM5MmUzNDA5ZmJhLi41
NTM1MTg3MmIwYzcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMy
L3N0bTMyLWRjbWkuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0z
Mi1kY21pLmMNCj4+IEBAIC0xOTEwLDEwICsxOTEwLDEwIEBAIHN0YXRpYyBpbnQgZGNtaV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIA0KPj4gKnBkZXYpDQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIFBUUl9FUlIobWNsayk7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IC3CoMKgwqAgY2hh
biA9IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwoJnBkZXYtPmRldiwgInR4Iik7DQo+PiAtwqDC
oMKgIGlmICghY2hhbikgew0KPj4gK8KgwqDCoCBjaGFuID0gZG1hX3JlcXVlc3RfY2hhbigmcGRl
di0+ZGV2LCAidHgiKTsNCj4+ICvCoMKgwqAgaWYgKElTX0VSUihjaGFuKSkgew0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGRldl9pbmZvKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gcmVxdWVzdCBETUEg
Y2hhbm5lbCwgZGVmZXIgDQo+PiBwcm9iaW5nXG4iKTsNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1
cm4gLUVQUk9CRV9ERUZFUjsNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihjaGFu
KTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCBzcGluX2xvY2tfaW5pdCgmZGNtaS0+
aXJxbG9jayk7DQo+Pg==
