Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9544D91DB4
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfHSHXh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:23:37 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:24318 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725846AbfHSHXh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:23:37 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7J7MCgC019108;
        Mon, 19 Aug 2019 09:23:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=IBOE9ThChyn3HPj0nzP6E2WkbMPsLIygBXtx/PEdxeI=;
 b=Hw7ZH9mSgKeNlQZ++PZMRAcJg0Ay5xqKI6dS4w26o6q6xSodd/H1RzRpm+G5v20+i7/l
 uDLQXL3Xm/+TUG1n7nUkTFr/xzLvc/rGgti5Ivc6j4HERgOf4dMlWK2libUk6qQ4RIHH
 ULz5qgZZRN5zL9npWhkSLJM2oxGwFylxvV4BJYy+0j5Nc9VJYiHHFRljKdGbjJhlx4nW
 DVBY4LYF9LN7yvxsNZu827tW/rDZwqEgfmue01Wz8VzSRkUSYeOsq68EGnSvUmk63nHQ
 O8wmuAEauv1UI0pAj3l+5+1/IT9uOCxGwJqLGo8P808opk8HgUQBsewE2YgDrPkvuSED tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ue7buhv3h-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 19 Aug 2019 09:23:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 100F331;
        Mon, 19 Aug 2019 07:23:18 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EF6932BF9FA;
        Mon, 19 Aug 2019 09:23:17 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Aug
 2019 09:23:17 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 19 Aug 2019 09:23:17 +0200
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
Subject: Re: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Thread-Topic: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Thread-Index: AQHVVAq68UiFQiNcNkmXdD8YMRgfcacB9FUA
Date:   Mon, 19 Aug 2019 07:23:17 +0000
Message-ID: <fb02573f-991a-18c5-b780-b5fc100da6a8@st.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
 <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
 <20190816081514.GU6133@paasikivi.fi.intel.com>
In-Reply-To: <20190816081514.GU6133@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <02FB72ACF9496F4298AB952A072DDEA0@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_02:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiA4LzE2LzE5IDEwOjE1IEFNLCBTYWthcmkgQWlsdXMgd3JvdGU6DQo+
IEhpIEh1Z3VlcywNCj4gDQo+IE9uIFdlZCwgQXVnIDE0LCAyMDE5IGF0IDAzOjQ4OjUxUE0gKzAy
MDAsIEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gQWRkIGEgdHJhY2Ugb2YgdGhlIHNldCBvZiBz
dXBwb3J0ZWQgZm91cmNjL21idXNfY29kZSB3aGljaA0KPj4gaW50ZXJzZWN0IGJldHdlZW4gRENN
SSBhbmQgc291cmNlIHN1Yi1kZXZpY2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZy
dWNoZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyB8IDEyICsrKysrKysrKystLQ0KPj4gICAxIGZp
bGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMgYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gaW5kZXggYjQ2MmY3MS4u
MThhY2VjZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3Rt
MzItZGNtaS5jDQo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRj
bWkuYw0KPj4gQEAgLTE0NDcsMTIgKzE0NDcsMjAgQEAgc3RhdGljIGludCBkY21pX2Zvcm1hdHNf
aW5pdChzdHJ1Y3Qgc3RtMzJfZGNtaSAqZGNtaSkNCj4+ICAgCQkJLyogQ29kZSBzdXBwb3J0ZWQs
IGhhdmUgd2UgZ290IHRoaXMgZm91cmNjIHlldD8gKi8NCj4+ICAgCQkJZm9yIChqID0gMDsgaiA8
IG51bV9mbXRzOyBqKyspDQo+PiAgIAkJCQlpZiAoc2RfZm10c1tqXS0+Zm91cmNjID09DQo+PiAt
CQkJCQkJZGNtaV9mb3JtYXRzW2ldLmZvdXJjYykNCj4+ICsJCQkJCQlkY21pX2Zvcm1hdHNbaV0u
Zm91cmNjKSB7DQo+PiAgIAkJCQkJLyogQWxyZWFkeSBhdmFpbGFibGUgKi8NCj4+ICsJCQkJCWRl
dl9kYmcoZGNtaS0+ZGV2LCAiU2tpcHBpbmcgZm91cmNjL2NvZGU6ICU0LjRzLzB4JXhcbiIsDQo+
PiArCQkJCQkJKGNoYXIgKikmc2RfZm10c1tqXS0+Zm91cmNjLA0KPj4gKwkJCQkJCW1idXNfY29k
ZS5jb2RlKTsNCj4+ICAgCQkJCQlicmVhazsNCj4+IC0JCQlpZiAoaiA9PSBudW1fZm10cykNCj4+
ICsJCQkJfQ0KPj4gKwkJCWlmIChqID09IG51bV9mbXRzKSB7DQo+PiAgIAkJCQkvKiBOZXcgKi8N
Cj4+ICAgCQkJCXNkX2ZtdHNbbnVtX2ZtdHMrK10gPSBkY21pX2Zvcm1hdHMgKyBpOw0KPj4gKwkJ
CQlkZXZfZGJnKGRjbWktPmRldiwgIlN1cHBvcnRlZCBmb3VyY2MvY29kZTogJTQuNHMvMHgleFxu
IiwNCj4gDQo+IE92ZXIgODAgY2hhcmFjdGVycyBwZXIgbGluZS4NCj4gDQoNClRoaXMgYW4gZXhj
ZXB0aW9uIG9mIHRoZSAiODAgY2hhcnMiIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gZ3JlcCBpbiAN
Cmtlcm5lbCBtZXNzYWdlczoNCmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQuMTAv
cHJvY2Vzcy9jb2Rpbmctc3R5bGUuaHRtbA0KIkhvd2V2ZXIsIG5ldmVyIGJyZWFrIHVzZXItdmlz
aWJsZSBzdHJpbmdzIHN1Y2ggYXMgcHJpbnRrIG1lc3NhZ2VzLCANCmJlY2F1c2UgdGhhdCBicmVh
a3MgdGhlIGFiaWxpdHkgdG8gZ3JlcCBmb3IgdGhlbS4iDQoNClRoaXMgZXhjZXB0aW9uIGlzIG1h
bmFnZWQgaW4gY2hlY2twYXRjaC5wbCAoLS1zdHJpY3QpLg0KDQo+PiArCQkJCQkoY2hhciAqKSZz
ZF9mbXRzW251bV9mbXRzIC0gMV0tPmZvdXJjYywNCj4+ICsJCQkJCXNkX2ZtdHNbbnVtX2ZtdHMg
LSAxXS0+bWJ1c19jb2RlKTsNCj4+ICsJCQl9DQo+PiAgIAkJfQ0KPj4gICAJCW1idXNfY29kZS5p
bmRleCsrOw0KPj4gICAJfQ0KPiANCg0KQlIsDQpIdWd1ZXMu
