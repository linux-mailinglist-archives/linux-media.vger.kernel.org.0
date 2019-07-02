Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01CA15D2AA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfGBPVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:21:19 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54186 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725972AbfGBPVT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:21:19 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62F82Ro028002;
        Tue, 2 Jul 2019 17:21:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=SzjDcNB2QeMrFWCWKsns2sD9pi5HfWIIUWIJ0NlH42M=;
 b=cI9ZfrboxcM0+cXQJkuFam761VrzZpIob6TvGDdYkNRaMLDK25m21kXCDDKDwkTrvzXJ
 FFn1IFYPeosPHTYIWw0sy1r+05ncgsx6y9L2L+s4OizRYjfpG4MyELmS2KThXh0qcwNi
 judIE+udSHlTtiefTfr1UDd7f4fLM6sfmgGsjuRJ8WdMQmagM9Y21lkprCagyb75EcnR
 zsJrjpLwPYmPtbEQXPkHfTMqe4CQYv2z7KHiv0uRrIA2Tp5MFfRUYB3EHKK4nQE6tgDi
 TY6SPi9It/IXQYsJC4Qo7FK6XzUAaQvHALZZ0RgqzdfvE1iMJyJqyAXR4EPHipJYaac5 +A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tdxvhvvsc-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:21:01 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C10383D;
        Tue,  2 Jul 2019 15:21:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8BFD42D05;
        Tue,  2 Jul 2019 15:21:00 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 17:21:00 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 17:21:00 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
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
Subject: Re: [PATCH v2 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Topic: [PATCH v2 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Index: AQHVJ3yZHgnJxvOZ40OVy3POWcVYXaa3YwCA
Date:   Tue, 2 Jul 2019 15:21:00 +0000
Message-ID: <c3dfcddd-199d-f322-a957-8c0ff1d2f5b2@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-2-git-send-email-hugues.fruchet@st.com>
 <20190620152640.chd4u4u5hd56ausk@kekkonen.localdomain>
In-Reply-To: <20190620152640.chd4u4u5hd56ausk@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDD382B92050594481214CD96E888BBA@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiA2LzIwLzE5IDU6MjYgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
SGkgSHVndWVzLA0KPiANCj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6NDg6MzBBTSArMDIw
MCwgSHVndWVzIEZydWNoZXQgd3JvdGU6DQo+PiBBZGQgYSBuZXcgInNlbnNvciIgZmllbGQgdG8g
ZGNtaSBzdHJ1Y3QgaW5zdGVhZCBvZg0KPj4gcmV1c2luZyBlbnRpdHktPnN1YmRldiB0byBhZGRy
ZXNzIHNlbnNvciBzdWJkZXYuDQpBcyBkaXNjdXNzZWQgb24gSVJDLCBmaXhlZCBpbiB2MywNCj4g
DQo+IFRoZSBwdXJwb3NlIG9mIHRoZSBzdHJ1Y3QgYmluZGluZyBpbWFnZSBzb3VyY2UncyBhc3lu
YyBzdWJkZXYgYXMgd2VsbCBhcw0KPiByZWxhdGVkIGluZm9ybWF0aW9uIGlzIHRvIGFsbG93IGFz
c29jaWF0aW5nIHRoZSB0d28uIFRoaXMgcGF0Y2ggYnJlYWtzDQo+IHRoYXQuIElmIHlvdXIgZGV2
aWNlIGNhbiBzdXBwb3J0IGEgc2luZ2xlIHNlbnNvciwgaXQgbWlnaHQgbm90IGJlIGEgYmlnDQo+
IGRlYWwuIFRoZSBlbmQgcmVzdWx0IHJlbWFpbnMgc29tZXdoYXQgaW5jb25zaXN0ZW50IGFzIHN1
YmRldiBzcGVjaWZpYw0KPiBpbmZvcm1hdGlvbiBpcyBzcHJlYWQgYWNyb3NzIHN0cnVjdCBzdG0z
Ml9kY21pIGFuZCBzdHJ1Y3QNCj4gZGNtaV9ncmFwaF9lbnRpdHkuDQpBcyBkaXNjdXNzZWQgb24g
SVJDLCBmaXhlZCBpbiB2MywNCg0KPiANCj4gSW4gZ2VuZXJhbCB5b3UgZG9uJ3QgbmVlZCB0byBr
bm93IHRoZSBzZW5zb3IgYXMgeW91IGNhbiBhbHdheXMgZmluZCBpdA0KPiB1c2luZyBtZWRpYV9l
bnRpdHlfcmVtb3RlX3BhZCgpLiBUaGlzIGRyaXZlciBpcyBhIGxpdHRsZSBkaWZmZXJlbnQgdGhv
dWdoDQo+IGFzIGl0IGNvdWxkIHByZXN1bWFibHkgY29udGludWUgdG8gd29yayB3aXRob3V0IE1D
LiBXYXMgdGhhdCB0aGUgaW50ZW50Pw0KPiANCj4gT24gYSBzaWRlIG5vdGU6IHN0cnVjdCBkY21p
X2dyYXBoX2VudGl0eSBkb2VzIE5PVCBoYXZlIHN0cnVjdA0KPiB2NGwyX2FzeW5jX3N1YmRldiBh
cyBpdHMgZmlyc3QgbWVtYmVyLiBQbGVhc2UgZml4IHRoYXQgYW5kIHByZXBlbmQgdGhlIGZpeA0K
PiB0byB0aGlzIHNldC4NCj4gDQpBcyBkaXNjdXNzZWQgb24gSVJDLCBmaXhlZCBpbiB2MywNCg0K
QlIsDQpIdWd1ZXMu
