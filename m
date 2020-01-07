Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C8B1327E9
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 14:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbgAGNjK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 08:39:10 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:37554 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728174AbgAGNjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Jan 2020 08:39:10 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 007DcqWo009126;
        Tue, 7 Jan 2020 14:38:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=hrhmpFzlfUlO5AOZGZPbwj2tFWCn5tB6qmmLQMyDAvU=;
 b=Nb8o6FmjHWuJtzNAQHb4fyuaOxive3FlitALbHr7WkGNLsn8lH9bd9QPKoiUgO7uGWII
 UX9hZHyxacfr/ONER4JPa+NjhmMmxeVU/KaXOiCCrkSQaYd8CTq0IrBw5S2/Tt2qKIkX
 ixojBNZPXSlIpOvTTCATjON/ekoA+8LIAvTcvJ5bmVFEvcHcZzNa+d4SNr+MFsI6G286
 gxUJNj+Gso7qoKV8Cu5jOs7LjWXt0Tz1vYJ+uwZ/C+9is37YkkG4tpBm3BCj5xW9WFdT
 vC/ts3sQwgIQUZ9XAGO15F3hVxv5aC4Mm9Lsm2JE9o4XkhKt+JT0LC21E0flD5eNA7SR vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2xakvb6hgb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jan 2020 14:38:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5F30510002A;
        Tue,  7 Jan 2020 14:38:57 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F0E12AD2CF;
        Tue,  7 Jan 2020 14:38:57 +0100 (CET)
Received: from SFHDAG5NODE2.st.com (10.75.127.14) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 7 Jan
 2020 14:38:56 +0100
Received: from SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0]) by
 SFHDAG5NODE2.st.com ([fe80::1cb5:6767:370b:9af0%20]) with mapi id
 15.00.1473.003; Tue, 7 Jan 2020 14:38:57 +0100
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
Subject: Re: [PATCH v2] media: stm32-dcmi: Use dma_request_chan() instead
 dma_request_slave_channel()
Thread-Topic: [PATCH v2] media: stm32-dcmi: Use dma_request_chan() instead
 dma_request_slave_channel()
Thread-Index: AQHVxVGbHPd1NuwJTkW5aQNGUInX/KffJDYA
Date:   Tue, 7 Jan 2020 13:38:56 +0000
Message-ID: <bd907564-4d1b-b0b9-f73a-0f7095974487@st.com>
References: <20200107115253.8351-1-peter.ujfalusi@ti.com>
In-Reply-To: <20200107115253.8351-1-peter.ujfalusi@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BB28C0379F2FE4CA71ECF47693910DA@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWNrZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9uIDEv
Ny8yMCAxMjo1MiBQTSwgUGV0ZXIgVWpmYWx1c2kgd3JvdGU6DQo+IGRtYV9yZXF1ZXN0X3NsYXZl
X2NoYW5uZWwoKSBpcyBhIHdyYXBwZXIgb24gdG9wIG9mIGRtYV9yZXF1ZXN0X2NoYW4oKQ0KPiBl
YXRpbmcgdXAgdGhlIGVycm9yIGNvZGUuDQo+IA0KPiBCeSB1c2luZyBkbWFfcmVxdWVzdF9jaGFu
KCkgZGlyZWN0bHkgdGhlIGRyaXZlciBjYW4gc3VwcG9ydCBkZWZlcnJlZA0KPiBwcm9iaW5nIGFn
YWluc3QgRE1BLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVq
ZmFsdXNpQHRpLmNvbT4NCj4gLS0tDQo+IEhpLA0KPiANCj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4g
LSBEbyBub3QgcHJpbnQgZXJyb3IgZm9yIEVQUk9CRV9ERUZFUg0KPiANCj4gUmVnYXJkcywNCj4g
UGV0ZXINCj4gDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMg
fCAxMSArKysrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9z
dG0zMi9zdG0zMi1kY21pLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRj
bWkuYw0KPiBpbmRleCA5MzkyZTM0MDlmYmEuLmI2M2ZmOGQ2MzZjZSAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4gQEAgLTE5MTAsMTAgKzE5MTAs
MTMgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICAgCQlyZXR1cm4gUFRSX0VSUihtY2xrKTsNCj4gICAJfQ0KPiAgIA0KPiAtCWNoYW4gPSBk
bWFfcmVxdWVzdF9zbGF2ZV9jaGFubmVsKCZwZGV2LT5kZXYsICJ0eCIpOw0KPiAtCWlmICghY2hh
bikgew0KPiAtCQlkZXZfaW5mbygmcGRldi0+ZGV2LCAiVW5hYmxlIHRvIHJlcXVlc3QgRE1BIGNo
YW5uZWwsIGRlZmVyIHByb2JpbmdcbiIpOw0KPiAtCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4g
KwljaGFuID0gZG1hX3JlcXVlc3RfY2hhbigmcGRldi0+ZGV2LCAidHgiKTsNCj4gKwlpZiAoSVNf
RVJSKGNoYW4pKSB7DQo+ICsJCXJldCA9IFBUUl9FUlIoY2hhbik7DQo+ICsJCWlmIChyZXQgIT0g
LUVQUk9CRV9ERUZFUikNCj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwNCj4gKwkJCQkiRmFpbGVk
IHRvIHJlcXVlc3QgRE1BIGNoYW5uZWw6ICVkXG4iLCByZXQpOw0KPiArCQlyZXR1cm4gcmV0Ow0K
PiAgIAl9DQo+ICAgDQo+ICAgCXNwaW5fbG9ja19pbml0KCZkY21pLT5pcnFsb2NrKTsNCj4g
