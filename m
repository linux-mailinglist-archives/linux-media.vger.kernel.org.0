Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1694E23048D
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 09:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgG1Hss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 03:48:48 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:39649 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727815AbgG1Hsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 03:48:46 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06S7ldf8021363;
        Tue, 28 Jul 2020 09:48:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=K8k0zl+hckRk71X66ed2zVcHgkK+3OE2huqwQBclzAo=;
 b=Go+KLXnCVHieo8OSjaKSblmt6ax6QuHgRWTjj4MLI/FqxVfNFjTdaIgM1Dgt1j5VwbLh
 v12+EI4kmYCzm7+YFtwmBMDM4VZO4v10ngKjvlNVPj16vEvuM6rjmgxvmzPnFCuQhNns
 Lct3oosVSQ5vsSXPA1bdbpVJqgxc5H999dCQetxp/Yd1KISa9bfqch6cWCblP9SvBqsq
 AviUd/IEAlL1MKO892vh0hRxkLTKEQyUpjMuW8GOVblSGsqhg6fzOViv2uC3sobhiWwD
 Aaj9dfX0aGw74+Amx1CuP5q4DlZEqyeU9isTIiF5j3Ch1cXLtMrySaqJqlGt3XKvTedn yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gagv501h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 09:48:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BEB2100034;
        Tue, 28 Jul 2020 09:48:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47C1B21FEA5;
        Tue, 28 Jul 2020 09:48:38 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 09:48:38 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 09:48:37 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Alain VOLMAT <alain.volmat@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Yannick FERTRE <yannick.fertre@st.com>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: stm32-dcmi: fix probe error path & module
 remove
Thread-Topic: [PATCH 2/2] media: stm32-dcmi: fix probe error path & module
 remove
Thread-Index: AQHWZKm2R+1D/3BXVEaElbeITuX1IakcfCUA
Date:   Tue, 28 Jul 2020 07:48:37 +0000
Message-ID: <bb74d188-44d4-629a-f04a-a46cb3fb773b@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-3-git-send-email-alain.volmat@st.com>
In-Reply-To: <1595918278-9724-3-git-send-email-alain.volmat@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C5571533AC1A1428F5147E2E3957DED@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_01:2020-07-27,2020-07-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmV2aWV3ZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9u
IDcvMjgvMjAgODozNyBBTSwgQWxhaW4gVm9sbWF0IHdyb3RlOg0KPiBUaGlzIGNvbW1pdCBhZGQg
bWlzc2luZyB2YjJfcXVldWVfcmVsZWFzZSBjYWxscyB3aXRoIHRoZQ0KPiBwcm9iZSBlcnJvciBw
YXRoIGFuZCBtb2R1bGUgcmVtb3ZlLg0KPiBNaXNzaW5nIHY0bDJfYXN5bmNfbm90aWZpZXJfdW5y
ZWdpc3RlciBpcyBhbHNvIGFkZGVkIHdpdGhpbg0KPiB0aGUgcHJvYmUgZXJyb3IgcGF0aA0KPiAN
Cj4gRml4ZXM6IDM3NDA0ZjkxZWY4YiAoIlttZWRpYV0gc3RtMzItZGNtaTogU1RNMzIgRENNSSBj
YW1lcmEgaW50ZXJmYWNlIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IEFsYWluIFZvbG1hdCA8
YWxhaW4udm9sbWF0QHN0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9z
dG0zMi9zdG0zMi1kY21pLmMgfCA2ICsrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Rt
MzIvc3RtMzItZGNtaS5jDQo+IGluZGV4IDVlNjBkNGM2ZWVlYi4uNTc4MzBlZTY5MWJlIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPiBAQCAtMjAw
NCw3ICsyMDA0LDcgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAgDQo+ICAgCXJldCA9IGRjbWlfZ3JhcGhfaW5pdChkY21pKTsNCj4gICAJ
aWYgKHJldCA8IDApDQo+IC0JCWdvdG8gZXJyX21lZGlhX2VudGl0eV9jbGVhbnVwOw0KPiArCQln
b3RvIGVycl92YjJfcXVldWVfcmVsZWFzZTsNCj4gICANCj4gICAJLyogUmVzZXQgZGV2aWNlICov
DQo+ICAgCXJldCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGRjbWktPnJzdGMpOw0KPiBAQCAtMjAz
MCw3ICsyMDMwLDEwIEBAIHN0YXRpYyBpbnQgZGNtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgIAlyZXR1cm4gMDsNCj4gICANCj4gICBlcnJfY2xlYW51cDoNCj4gKwl2
NGwyX2FzeW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJmRjbWktPm5vdGlmaWVyKTsNCj4gICAJdjRs
Ml9hc3luY19ub3RpZmllcl9jbGVhbnVwKCZkY21pLT5ub3RpZmllcik7DQo+ICtlcnJfdmIyX3F1
ZXVlX3JlbGVhc2U6DQo+ICsJdmIyX3F1ZXVlX3JlbGVhc2UocSk7DQo+ICAgZXJyX21lZGlhX2Vu
dGl0eV9jbGVhbnVwOg0KPiAgIAltZWRpYV9lbnRpdHlfY2xlYW51cCgmZGNtaS0+dmRldi0+ZW50
aXR5KTsNCj4gICBlcnJfZGV2aWNlX3JlbGVhc2U6DQo+IEBAIC0yMDUyLDYgKzIwNTUsNyBAQCBz
dGF0aWMgaW50IGRjbWlfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAg
DQo+ICAgCXY0bDJfYXN5bmNfbm90aWZpZXJfdW5yZWdpc3RlcigmZGNtaS0+bm90aWZpZXIpOw0K
PiAgIAl2NGwyX2FzeW5jX25vdGlmaWVyX2NsZWFudXAoJmRjbWktPm5vdGlmaWVyKTsNCj4gKwl2
YjJfcXVldWVfcmVsZWFzZSgmZGNtaS0+cXVldWUpOw0KPiAgIAltZWRpYV9lbnRpdHlfY2xlYW51
cCgmZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4gICAJdjRsMl9kZXZpY2VfdW5yZWdpc3RlcigmZGNt
aS0+djRsMl9kZXYpOw0KPiAgIAltZWRpYV9kZXZpY2VfY2xlYW51cCgmZGNtaS0+bWRldik7DQo+
IA==
