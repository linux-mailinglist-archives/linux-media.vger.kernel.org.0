Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB0D230488
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 09:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgG1HsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 03:48:24 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:21452 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727815AbgG1HsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 03:48:23 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06S7lixs021797;
        Tue, 28 Jul 2020 09:48:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NkOHTuIum3uJvQxrbwjluQtz8Ukz7QuQntHgqGitDlw=;
 b=bojODVCblJyp8S4KJpH6pSb/TKSHi0RXB7DGidnYw1C6ywC2eUcka5l6Y0c5/IyQwKrY
 sWfnyugYKcJlPg6+ge0GlvzoseuKAyWY9gcVm1c5m8GYcROqZMzXTZr3KcYF00/6YlLE
 0lnZFPwsC+rV1lZVAd195muEDXv6DrWLq28lNmA0fRog8KRmXEojSnpuFKm3zq0QYaUa
 A43rcrPfMr0UajwkhpN4cQGk2AW+Au8pW/tPBA52KPIlYC1JbnD6k5KKrOAx0Dqt0Rcl
 8DQMcpfyE01+bI64/+HqmSskt3F0K7T3lwh9s1zYvPGJsW4a7oTeclfJ0dYmneGsqHhY CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 32gagv4yy8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 09:48:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E828610002A;
        Tue, 28 Jul 2020 09:48:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2CFA21FEA2;
        Tue, 28 Jul 2020 09:48:11 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jul
 2020 09:48:11 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 09:48:11 +0200
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
Subject: Re: [PATCH 1/2] media: stm32-dcmi: create video dev within notifier
 bound
Thread-Topic: [PATCH 1/2] media: stm32-dcmi: create video dev within notifier
 bound
Thread-Index: AQHWZKm2hQlOt6e2MkK9C4kMLjRhyqkce/UA
Date:   Tue, 28 Jul 2020 07:48:11 +0000
Message-ID: <5650a872-3352-64cb-2f35-94e2be3b187f@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-2-git-send-email-alain.volmat@st.com>
In-Reply-To: <1595918278-9724-2-git-send-email-alain.volmat@st.com>
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
Content-ID: <0E5966DDEF578E4E9CEA2E6722F65B2D@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_01:2020-07-27,2020-07-28 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

UmV2aWV3ZWQtYnk6IEh1Z3VlcyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQoNCk9u
IDcvMjgvMjAgODozNyBBTSwgQWxhaW4gVm9sbWF0IHdyb3RlOg0KPiBJbiBjYXNlIG9mIGFuIGVy
cm9yIGR1cmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHNlbnNvciwNCj4gdGhlIHZpZGVv
IGRldmljZSBpcyBzdGlsbCBhdmFpbGFibGUgc2luY2UgY3JlYXRlZCBhdCB0aGUNCj4gcHJvYmUg
b2YgdGhlIGRjbWkgZHJpdmVyLiBNb3Jlb3ZlciB0aGUgZGV2aWNlIHdvdWxkbid0DQo+IGJlIHJl
bGVhc2VkIGV2ZW4gd2hlbiByZW1vdmluZyB0aGUgbW9kdWxlIHNpbmNlIHRoZSByZWxlYXNlDQo+
IGlzIHBlcmZvcm1lZCBhcyBwYXJ0IG9mIHRoZSBub3RpZmllciB1bmJpbmQgY2FsbGJhY2sNCj4g
KG5vdCBjYWxsZWQgaWYgbm8gc2Vuc29yIGlzIHByb3Blcmx5IGluaXRpYWxpemVkKS4NCj4gDQo+
IFRoaXMgcGF0Y2ggbW92ZSB0aGUgdmlkZW8gZGV2aWNlIGNyZWF0aW9uIHdpdGggdGhlIHY0bDIg
bm90aWZpZXINCj4gYm91bmQgaGFuZGxlciBpbiBvcmRlciB0byBhdm9pZCBoYXZpbmcgYSB2aWRl
byBkZXZpY2UgY3JlYXRlZCB3aGVuDQo+IGFuIGVycm9yIGhhcHBlbiBkdXJpbmcgdGhlIHBpcGUg
KGRjbWkgLSBzZW5zb3IpIGluaXRpYWxpemF0aW9uLg0KPiANCj4gVGhpcyBhbHNvIG1ha2VzIHRo
ZSB2aWRlbyBkZXZpY2UgY3JlYXRpb24gc3ltbWV0cmljIHdpdGggdGhlDQo+IHJlbGVhc2Ugd2hp
Y2ggaXMgYWxyZWFkeSBkb25lIHdpdGhpbiB0aGUgbm90aWZpZXIgdW5iaW5kIGhhbmRsZXIuDQo+
IA0KPiBGaXhlczogMzc0MDRmOTFlZjhiICgiW21lZGlhXSBzdG0zMi1kY21pOiBTVE0zMiBEQ01J
IGNhbWVyYSBpbnRlcmZhY2UgZHJpdmVyIikNCj4gU2lnbmVkLW9mZi1ieTogQWxhaW4gVm9sbWF0
IDxhbGFpbi52b2xtYXRAc3QuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3N0bTMyL3N0bTMyLWRjbWkuYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4gaW5kZXggYjg5MzE0OTBi
ODNiLi41ZTYwZDRjNmVlZWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
c3RtMzIvc3RtMzItZGNtaS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIv
c3RtMzItZGNtaS5jDQo+IEBAIC0xNzQ3LDYgKzE3NDcsMTUgQEAgc3RhdGljIGludCBkY21pX2dy
YXBoX25vdGlmeV9ib3VuZChzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIsDQo+
ICAgDQo+ICAgCWRldl9kYmcoZGNtaS0+ZGV2LCAiU3ViZGV2IFwiJXNcIiBib3VuZFxuIiwgc3Vi
ZGV2LT5uYW1lKTsNCj4gICANCj4gKwlyZXQgPSB2aWRlb19yZWdpc3Rlcl9kZXZpY2UoZGNtaS0+
dmRldiwgVkZMX1RZUEVfVklERU8sIC0xKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIo
ZGNtaS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIHZpZGVvIGRldmljZVxuIik7DQo+ICsJCXJl
dHVybiByZXQ7DQo+ICsJfQ0KPiArDQo+ICsJZGV2X2RiZyhkY21pLT5kZXYsICJEZXZpY2UgcmVn
aXN0ZXJlZCBhcyAlc1xuIiwNCj4gKwkJdmlkZW9fZGV2aWNlX25vZGVfbmFtZShkY21pLT52ZGV2
KSk7DQo+ICsNCj4gICAJLyoNCj4gICAJICogTGluayB0aGlzIHN1Yi1kZXZpY2UgdG8gRENNSSwg
aXQgY291bGQgYmUNCj4gICAJICogYSBwYXJhbGxlbCBjYW1lcmEgc2Vuc29yIG9yIGEgYnJpZGdl
DQo+IEBAIC0xNzU5LDEwICsxNzY4LDExIEBAIHN0YXRpYyBpbnQgZGNtaV9ncmFwaF9ub3RpZnlf
Ym91bmQoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm5vdGlmaWVyLA0KPiAgIAkJCQkgICAg
JmRjbWktPnZkZXYtPmVudGl0eSwgMCwNCj4gICAJCQkJICAgIE1FRElBX0xOS19GTF9JTU1VVEFC
TEUgfA0KPiAgIAkJCQkgICAgTUVESUFfTE5LX0ZMX0VOQUJMRUQpOw0KPiAtCWlmIChyZXQpDQo+
ICsJaWYgKHJldCkgew0KPiAgIAkJZGV2X2VycihkY21pLT5kZXYsICJGYWlsZWQgdG8gY3JlYXRl
IG1lZGlhIHBhZCBsaW5rIHdpdGggc3ViZGV2IFwiJXNcIlxuIiwNCj4gICAJCQlzdWJkZXYtPm5h
bWUpOw0KPiAtCWVsc2UNCj4gKwkJdmlkZW9fdW5yZWdpc3Rlcl9kZXZpY2UoZGNtaS0+dmRldik7
DQo+ICsJfSBlbHNlDQo+ICAgCQlkZXZfZGJnKGRjbWktPmRldiwgIkRDTUkgaXMgbm93IGxpbmtl
ZCB0byBcIiVzXCJcbiIsDQo+ICAgCQkJc3ViZGV2LT5uYW1lKTsNCj4gICANCj4gQEAgLTE5NzQs
MTUgKzE5ODQsNiBAQCBzdGF0aWMgaW50IGRjbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gICAJfQ0KPiAgIAlkY21pLT52ZGV2LT5lbnRpdHkuZmxhZ3MgfD0gTUVESUFf
RU5UX0ZMX0RFRkFVTFQ7DQo+ICAgDQo+IC0JcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNlKGRj
bWktPnZkZXYsIFZGTF9UWVBFX1ZJREVPLCAtMSk7DQo+IC0JaWYgKHJldCkgew0KPiAtCQlkZXZf
ZXJyKGRjbWktPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBkZXZpY2VcbiIpOw0KPiAt
CQlnb3RvIGVycl9tZWRpYV9lbnRpdHlfY2xlYW51cDsNCj4gLQl9DQo+IC0NCj4gLQlkZXZfZGJn
KGRjbWktPmRldiwgIkRldmljZSByZWdpc3RlcmVkIGFzICVzXG4iLA0KPiAtCQl2aWRlb19kZXZp
Y2Vfbm9kZV9uYW1lKGRjbWktPnZkZXYpKTsNCj4gLQ0KPiAgIAkvKiBCdWZmZXIgcXVldWUgKi8N
Cj4gICAJcS0+dHlwZSA9IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVSRTsNCj4gICAJcS0+aW9f
bW9kZXMgPSBWQjJfTU1BUCB8IFZCMl9SRUFEIHwgVkIyX0RNQUJVRjsNCj4g
