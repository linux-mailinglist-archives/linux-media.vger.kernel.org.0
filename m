Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EED89858
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 09:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfHLHzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 03:55:21 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:57967 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726528AbfHLHzV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 03:55:21 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7C7pJws019345;
        Mon, 12 Aug 2019 09:55:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=K4f2t1Y5I/EziBGPEJ+ljv/yOyY+PHAdMeuhhuVCD0A=;
 b=ueE8QJvJ5XEt07B7hhwIm9PHXk8vr9MMQx57+IV19RtrYnKCgN2NH2NndaUKX9AhuEXf
 kdpIHS1q2gg7KQFcH5AlSnETBmFxMtNRZ1hYT6DBMPYQjsFLt5SHmtVW740XB8rlNuyi
 V1gsoTXk6RY+epahTtKdy3KZ09zx71p4tzYmpaWG7N5m1EK5lH2nKpWvKK1cbx7/Rjoo
 QCm1wsT5q+wFGgpmWpEuYAlbijeqf0s/xGFcBtsotZw4++HsQiPZ5A6xLXWfuj/ameX3
 ceADR+LDgFwhHiJOBFYkr5FX8e8lUdTAYBch3xSIo7VYGs6E3TyAL80orPKf4BMnmF0W lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2u9kpuhmue-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 12 Aug 2019 09:55:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D80031;
        Mon, 12 Aug 2019 07:55:05 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E99412C1097;
        Mon, 12 Aug 2019 09:55:04 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Aug
 2019 09:55:04 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 12 Aug 2019 09:55:04 +0200
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
Subject: Re: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Topic: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Index: AQHVTsvbNiH8ciXV5ESmNTxaXVzk1ab3B2CA
Date:   Mon, 12 Aug 2019 07:55:04 +0000
Message-ID: <0deb258d-bb11-15ee-0beb-8355cfd3782b@st.com>
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
Content-ID: <C5F0FC3B1E518747BF9EB47BB034675C@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-12_04:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpTb3JyeSBmb3IgaW5jb252ZW5pZW5jZSwgSSB3aWxsIHB1c2ggYSBWNSB3
aXRoIHRoYXQgZml4ZWQuDQoNCk1heSBJIHB1dCB5b3VyICJBY2tlZC1ieSIgYWxzbyBvbiB0aGUg
MiBvdGhlciBjb21taXRzID8gT3IganVzdCB0aGlzIG9uZSA/DQoNCk9uIDgvOS8xOSA2OjAxIFBN
LCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+IEhpIEh1Z3VlcywNCj4gDQo+IFRoYW5rcyBmb3IgdGVo
IHVwZGF0ZS4NCj4gDQo+IE9uIFdlZCwgSnVsIDMxLCAyMDE5IGF0IDAyOjU2OjIxUE0gKzAyMDAs
IEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gUmVuYW1lICJzdWJkZXYiIGVudGl0eSBzdHJ1Y3Qg
ZmllbGQgdG8gInNvdXJjZSINCj4+IHRvIHByZXBhcmUgZm9yIHNldmVyYWwgc3ViZGV2IHN1cHBv
cnQuDQo+PiBNb3ZlIGFzZCBmaWVsZCBvbiB0b3Agb2YgZW50aXR5IHN0cnVjdC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAc3QuY29tPg0KPj4g
Q2hhbmdlLUlkOiBJMTU0NWExYTI5YTgwNjFlZTY3Y2M2ZTRiNzk5ZTlhNjkwNzE5MTFlNw0KPiAN
Cj4gTm8gQ2hhbmdlLUlkIHRhZ3MgaW4gdGhlIGtlcm5lbCwgcGxlYXNlLiBDaGVjayB0aGUgb3Ro
ZXIgdHdvIGFzIHdlbGwuDQo+IA0KPiBXaXRoIHRoYXQgZml4ZWQsDQo+IA0KPiBBY2tlZC1ieTog
U2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tPg0KPiANCg0KQmVzdCBy
ZWdhcmRzLA0KSHVndWVzLg==
