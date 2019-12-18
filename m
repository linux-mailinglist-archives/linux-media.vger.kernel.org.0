Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11B9A124516
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 11:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLRKxU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 05:53:20 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23346 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725828AbfLRKxU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 05:53:20 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xBIAgTQb021020;
        Wed, 18 Dec 2019 11:53:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WltQl+Nrsz8fgtBLEjjq7GsetJKHtSnm0grD1Qcbr9Y=;
 b=PImSGWa9eBzHSdxhKgcdjhReUg9+BmUiNMAmwZuGTRHVfIqMSR5chg+152B+leibrTKg
 v7nFMfenJhyBu1eydlGEY+6TG4lCSvA7RIXy0eMNQYHNXEi31KIe7j3YcoTThxiy9baG
 aeG59XpksS9bmDjAVsN75SH5sAENi2dT5Q6luydI3RsvoSFyNv0hJQXIj17NKWdFS0KS
 7G+jS4G+xSbQI8f7D844N1As5coVNhIxPXSkd0A2vJYCTnKcRJ4Vx5j8xzEw5QzbPvV8
 SldnwEbaiF403JoErbqRbKkANsJ+iExkjRfLrXmymY7FJtkDq1ID+uh3rePR31sCMOXq Cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wvnrekyw1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 18 Dec 2019 11:53:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2777D10002A;
        Wed, 18 Dec 2019 11:52:54 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 087AB2A8BF8;
        Wed, 18 Dec 2019 11:52:54 +0100 (CET)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Dec
 2019 11:52:53 +0100
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Dec 2019 11:52:53 +0100
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
Thread-Index: AQHVtMaOm1nAskP+t06Lg3ivGfEhOKe/qEeA
Date:   Wed, 18 Dec 2019 10:52:53 +0000
Message-ID: <84946ffd-8e90-7b6a-6667-a10e27d31655@st.com>
References: <20191217104135.23554-1-peter.ujfalusi@ti.com>
In-Reply-To: <20191217104135.23554-1-peter.ujfalusi@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8055C0FD5DE0F440A5AA37D71102D704@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-18_02:2019-12-17,2019-12-18 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

VGhhbmtzIGZvciBwYXRjaGluZyBQZXRlciwNCg0KTm8gcmVncmVzc2lvbiBvYnNlcnZlZCBvbiBt
eSBzaWRlLg0KDQpBY2tlZC1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNv
bT4NCg0KQmVzdCByZWdhcmRzLA0KSHVndWVzLg0KDQpPbiAxMi8xNy8xOSAxMTo0MSBBTSwgUGV0
ZXIgVWpmYWx1c2kgd3JvdGU6DQo+IGRtYV9yZXF1ZXN0X3NsYXZlX2NoYW5uZWwoKSBpcyBhIHdy
YXBwZXIgb24gdG9wIG9mIGRtYV9yZXF1ZXN0X2NoYW4oKQ0KPiBlYXRpbmcgdXAgdGhlIGVycm9y
IGNvZGUuDQo+IA0KPiBCeSB1c2luZyBkbWFfcmVxdWVzdF9jaGFuKCkgZGlyZWN0bHkgdGhlIGRy
aXZlciBjYW4gc3VwcG9ydCBkZWZlcnJlZA0KPiBwcm9iaW5nIGFnYWluc3QgRE1BLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4NCj4g
LS0tDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMgfCA2ICsr
Ky0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1k
Y21pLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiBpbmRl
eCA5MzkyZTM0MDlmYmEuLjU1MzUxODcyYjBjNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4gQEAgLTE5MTAsMTAgKzE5MTAsMTAgQEAgc3RhdGlj
IGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlyZXR1
cm4gUFRSX0VSUihtY2xrKTsNCj4gICAJfQ0KPiAgIA0KPiAtCWNoYW4gPSBkbWFfcmVxdWVzdF9z
bGF2ZV9jaGFubmVsKCZwZGV2LT5kZXYsICJ0eCIpOw0KPiAtCWlmICghY2hhbikgew0KPiArCWNo
YW4gPSBkbWFfcmVxdWVzdF9jaGFuKCZwZGV2LT5kZXYsICJ0eCIpOw0KPiArCWlmIChJU19FUlIo
Y2hhbikpIHsNCj4gICAJCWRldl9pbmZvKCZwZGV2LT5kZXYsICJVbmFibGUgdG8gcmVxdWVzdCBE
TUEgY2hhbm5lbCwgZGVmZXIgcHJvYmluZ1xuIik7DQo+IC0JCXJldHVybiAtRVBST0JFX0RFRkVS
Ow0KPiArCQlyZXR1cm4gUFRSX0VSUihjaGFuKTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlzcGluX2xv
Y2tfaW5pdCgmZGNtaS0+aXJxbG9jayk7DQo+IA==
