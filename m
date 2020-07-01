Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A698210BA7
	for <lists+linux-media@lfdr.de>; Wed,  1 Jul 2020 15:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730941AbgGANDF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jul 2020 09:03:05 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:33028 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730934AbgGANC5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Jul 2020 09:02:57 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 061CsoKU018099;
        Wed, 1 Jul 2020 15:02:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qDqIDNVMDXBsFhc42TpMkva+hZeSczm/Qp1TCPPpnnM=;
 b=uLaIcqH2HF71zXBGJGF6Fm4CyhZB+9l2WzSyBsPVF/KbZrzc6pxzEHmzhd48Fu767gqB
 1dy5Sl+vGsTvXSEYBO/fwAfXytg5lhMurkHsZfnhB9iPdHgo6pKRkrSS6L1UgKvt7U0X
 7LvYQ/Jz1S//7dFhH6hMezfZowKb9sbbH7VWtylfdhDYFAJSEaukKNvelLMlrs5i6AuH
 ydeQdY6WyoB8DIr1075iAUDbGAizJkgpI7Q3+S6X7nBMdEgb/uf55cGUTbTPXu5NgYtx
 FipqRU+WdYJj5WKq4RblZalvuYkTxIpZ7NUEVIh7a8chZ5Wn/qUwmdt1Q70Hsse4jEgI /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31ww0ga3tw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 01 Jul 2020 15:02:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 94A9410002A;
        Wed,  1 Jul 2020 15:02:46 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C72B2B66E2;
        Wed,  1 Jul 2020 15:02:46 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Jul
 2020 15:02:45 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Wed, 1 Jul 2020 15:02:45 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 0/3] DCMI set minimum cpufreq requirement
Thread-Topic: [PATCH v6 0/3] DCMI set minimum cpufreq requirement
Thread-Index: AQHWT6dwxW+BVT2pZ0iRJjHfwS5knqjyjv2A
Date:   Wed, 1 Jul 2020 13:02:45 +0000
Message-ID: <52850ead-3e49-7f24-e96b-3f6f293d54fe@st.com>
References: <20200701125918.30793-1-benjamin.gaignard@st.com>
In-Reply-To: <20200701125918.30793-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8DE9CF046A29B04DBEAD7A88575F79F6@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-01_08:2020-07-01,2020-07-01 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDcvMS8yMCAyOjU5IFBNLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZToNCj4gVGhpcyBz
ZXJpZXMgYWxsb3cgdG8gU1RNMzIgY2FtZXJhIGludGVyZmFjZSAoRENNSSkgdG8gcmVxdWlyZSBh
IG1pbmltdW0NCj4gZnJlcXVlbmN5IHRvIHRoZSBDUFVzIGJlZm9yZSBzdGFydCBzdHJlYW1pbmcg
ZnJhbWVzIGZyb20gdGhlIHNlbnNvci4NCj4gVGhlIG1pbmltdW0gZnJlcXVlbmN5IHJlcXVpcmVt
ZW50IGlzIHByb3ZpZGVkIGluIHRoZSBkZXZpZGUtdHJlZSBub2RlLg0KPg0KPiBTZXR0aW5nIGEg
bWluaW11bSBmcmVxdWVuY3kgZm9yIHRoZSBDUFVzIGlzIG5lZWRlZCB0byBlbnN1cmUgYSBxdWlj
ayBoYW5kbGluZw0KPiBvZiB0aGUgaW50ZXJydXB0cyBiZXR3ZWVuIHR3byBzZW5zb3IgZnJhbWVz
IGFuZCBhdm9pZCBkcm9wcGluZyBoYWxmIG9mIHRoZW0uDQpQbGVhc2UgZm9yZ2V0IHRoaXMgdmVy
c2lvbiwgdGhlIGluY29taW5nIHZlcnNpb24gNyBzaG91bGQgaGF2ZSBmaXggeW91ciANCnJlbWFy
a3MuDQoNClNvcnJ5LA0KQmVuamFtaW4NCj4gdmVyc2lvbiA2Og0KPiAtIGNvbWUgYmFjayB0byB2
ZXJzaW9uIDQgYW5kIGZvbGxvdyBWYWxlbnRpbidzIHN1Z2dlc3Rpb25zIGFib3V0IG5vdGlmaWVy
DQo+DQo+IHZlcnNpb24gNToNCj4gLSBhZGQgYSBtdXRleCB0byBwcm90ZWN0IGRjbWlfaXJxX25v
dGlmaWVyX25vdGlmeSgpDQo+IC0gcmVnaXN0ZXIgbm90aWZpZXIgYSBwcm9iZSB0aW1lDQo+DQo+
IHZlcnNpb24gNDoNCj4gLSBzaW1wbGlmeSBpcnEgYWZmaW5pdHkgaGFuZGxpbmcgYnkgdXNpbmcg
b25seSBkY21pX2lycV9ub3RpZmllcl9ub3RpZnkoKQ0KPg0KPiB2ZXJzaW9uIDM6DQo+IC0gYWRk
IGEgY3B1bWFzayBmaWVsZCB0byB0cmFjayBib29zdGVkIENQVXMNCj4gLSBhZGQgaXJxX2FmZmlu
aXR5X25vdGlmeSBjYWxsYmFjaw0KPiAtIHByb3RlY3QgY3B1bWFzayBmaWVsZCB3aXRoIGEgbXV0
ZXgNCj4NCj4gQmVuamFtaW4gR2FpZ25hcmQgKDMpOg0KPiAgICBkdC1iaW5kaW5nczogbWVkaWE6
IHN0bTMyLWRjbWk6IEFkZCBEQ01JIG1pbiBmcmVxdWVuY3kgcHJvcGVydHkNCj4gICAgbWVkaWE6
IHN0bTMyLWRjbWk6IFNldCBtaW5pbXVtIGNwdWZyZXEgcmVxdWlyZW1lbnQNCj4gICAgQVJNOiBk
dHM6IHN0bTMyOiBTZXQgRENNSSBmcmVxdWVuY3kgcmVxdWlyZW1lbnQgZm9yIHN0bTMybXAxNXgN
Cj4NCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwg
ICB8ICAgOCArKw0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMy
LWRjbWkuYyAgICAgICAgICB8IDEzOCArKysrKysrKysrKysrKysrKysrLS0NCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDEzOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0K
