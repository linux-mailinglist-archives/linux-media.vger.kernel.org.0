Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC3518D5C6
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 16:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbfHNOR2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 10:17:28 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:2944 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726019AbfHNOR2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 10:17:28 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7EEBQT5021331;
        Wed, 14 Aug 2019 16:17:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=864BMKlRVFujYQCq26+1g0K4hmq2aALb8dEnOteiolo=;
 b=J174bcZrkmVeJ7AJOl9VCKXBznmKRNGKuDznEEXShutR8zIKsYb3zZoJjmj7dK6hhK86
 pa2BHJKexcG++kpNZuT8ZtR3NgdSxFyIVq9wwvVFLbzz3smt+NVNYNSMNPz4yFx+41DE
 ARk9qY87/HMVJkZkFzWdH4htlaFv8ubQe8cLNPkXvh0nO4z1+2A/pa7zefqWKmafwPFx
 jyZvovgQIZXEd3rDaFel6SwqEZvhDThUrlZcBFE7yTwlDRUCQvKmyFumyleQApn39Dj2
 cEq8L+o0Xnx9k1l32qgFnjOWTRQ3vsPwt48I7z3O+7TwRnV2noQXt0wn56rdHAzUyzh3 TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2u9kpuwtjn-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 14 Aug 2019 16:17:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D312534;
        Wed, 14 Aug 2019 14:17:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0FDC2B910C;
        Wed, 14 Aug 2019 16:17:13 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 16:17:13 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Wed, 14 Aug 2019 16:17:13 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Topic: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Index: AQHVTsvbNiH8ciXV5ESmNTxaXVzk1ab6ls8A
Date:   Wed, 14 Aug 2019 14:17:13 +0000
Message-ID: <ca92a856-98fc-f82b-fa0a-62b9f44e266c@st.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
 <1564577783-18627-2-git-send-email-hugues.fruchet@st.com>
 <20190809160121.GA6194@paasikivi.fi.intel.com>
In-Reply-To: <20190809160121.GA6194@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDF4C1A0C930AF4EB3EB2E6088AF5865@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-14_05:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLCBIYW5zLA0KDQpJJ3ZlIGp1c3QgcHVzaGVkIGEgdjYgd2l0aCB0aGUgRklYTUUg
d2UgZGlzY3Vzc2VkIG9uIElSQyBhYm91dA0KInBhcmFsbGVsIiBtYnVzIGNvZGUgdmVyc3VzICJz
ZXJpYWwiIG1idXMgY29kZS4gSSBoYXZlIGFsc28gYWRkZWQNCnNvbWUgdHJhY2VzIHRvIGhlbHAg
aW4gZGVidWdnaW5nIGlmIHN1Y2ggY2FzZSBvY2N1cnMuDQoNCnZlcnNpb24gNjoNCiAgIC0gQXMg
cGVyIFNha2FyaSByZW1hcms6IGFkZCBhIEZJWE1FIGV4cGxhaW5pbmcgdGhhdCB0aGlzDQogICAg
IHZlcnNpb24gb25seSBzdXBwb3J0cyBzdWJkZXZpY2VzIHdoaWNoIGV4cG9zZSBSR0IgJiBZVVYN
CiAgICAgInBhcmFsbGVsIGZvcm0iIG1idXMgY29kZSAoXzJYOCkNCiAgIC0gQWRkIHNvbWUgdHJh
Y2UgYXJvdW5kIHN1YmRldl9jYWxsKHNfZm10KSBlcnJvciAmIGZvcm1hdA0KICAgICBjaGFuZ2Vz
IHRvIGRlYnVnIHN1YmRldiB3aGljaCBvbmx5IGV4cG9zZSBzZXJpYWwgbWJ1cyBjb2RlDQogICAt
IENvbmZvcm0gdG8gIjxuYW1lPiI6PHBhZCBpbmRleD4gd2hlbiB0cmFjaW5nIHN1YmRldiBpbmZv
cw0KDQoNCkJlc3QgcmVnYXJkcywNCkh1Z3Vlcy4NCg0KT24gOC85LzE5IDY6MDEgUE0sIFNha2Fy
aSBBaWx1cyB3cm90ZToNCj4gSGkgSHVndWVzLA0KPiANCj4gVGhhbmtzIGZvciB0ZWggdXBkYXRl
Lg0KPiANCj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDI6NTY6MjFQTSArMDIwMCwgSHVndWVz
IEZydWNoZXQgd3JvdGU6DQo+PiBSZW5hbWUgInN1YmRldiIgZW50aXR5IHN0cnVjdCBmaWVsZCB0
byAic291cmNlIg0KPj4gdG8gcHJlcGFyZSBmb3Igc2V2ZXJhbCBzdWJkZXYgc3VwcG9ydC4NCj4+
IE1vdmUgYXNkIGZpZWxkIG9uIHRvcCBvZiBlbnRpdHkgc3RydWN0Lg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQo+PiBDaGFuZ2Ut
SWQ6IEkxNTQ1YTFhMjlhODA2MWVlNjdjYzZlNGI3OTllOWE2OTA3MTkxMWU3DQo+IA0KPiBObyBD
aGFuZ2UtSWQgdGFncyBpbiB0aGUga2VybmVsLCBwbGVhc2UuIENoZWNrIHRoZSBvdGhlciB0d28g
YXMgd2VsbC4NCj4gDQo+IFdpdGggdGhhdCBmaXhlZCwNCj4gDQo+IEFja2VkLWJ5OiBTYWthcmkg
QWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+IA==
