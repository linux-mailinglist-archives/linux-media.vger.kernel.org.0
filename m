Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9F21B041
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2020 09:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726341AbgGJHdz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jul 2020 03:33:55 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:18164 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725966AbgGJHdz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jul 2020 03:33:55 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06A7UbKC028830;
        Fri, 10 Jul 2020 09:33:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nYpYw1UIr0i69d2MbqdY53TAeYo3yA3M+T5eY/nD4Vw=;
 b=TQoNd8RKNS3gU5A/56y5luF7iQO+5LKmIvGPhsfcmZHyaogi4vxrruupgAyZxN+3RE9P
 pJ8SeQhOUMbJ9TsIPjRPcfhpIroG+DBL+oZO9Egb2+ehzM8L3VmYRWPiLUEEB5QMzBQU
 0z34U+Yy9ByiGS9wnZe+CumGHUaVPiqTg0Iyz+YAcaLjNwwpB7tXbpd+yYGBXcub7fJG
 ODXeVWtjFjxyiPCQyzJlYv7W+5EgDWBi0qZWLP4FI7SIqeJjlQuW30jm9vzYCVokLFLi
 sZJSpWra/Z8j9au2LaYcFu90wZfwyLTQIJqgdajpfb168DIwr4JjPbAAsFeavdr3U/oU 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 325k409kh2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 10 Jul 2020 09:33:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43017100038;
        Fri, 10 Jul 2020 09:33:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B6422A5AFE;
        Fri, 10 Jul 2020 09:33:41 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 Jul
 2020 09:33:40 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Fri, 10 Jul 2020 09:33:40 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Rob Herring <robh@kernel.org>
CC:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Topic: [PATCH v7 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWT6e/b2wyFUUnLkaf//MXpHPgJqj/oKMAgAC3YwA=
Date:   Fri, 10 Jul 2020 07:33:40 +0000
Message-ID: <20e4907a-f218-3e43-1111-7d4b9ee6d945@st.com>
References: <20200701130129.30961-1-benjamin.gaignard@st.com>
 <20200701130129.30961-2-benjamin.gaignard@st.com>
 <20200709203718.GA837160@bogus>
In-Reply-To: <20200709203718.GA837160@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="utf-8"
Content-ID: <92383D3D1055FD4C836FEA238A220FF5@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-10_02:2020-07-10,2020-07-10 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDcvOS8yMCAxMDozNyBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IE9uIFdlZCwgSnVs
IDAxLCAyMDIwIGF0IDAzOjAxOjI3UE0gKzAyMDAsIEJlbmphbWluIEdhaWduYXJkIHdyb3RlOg0K
Pj4gRG9jdW1lbnQgc3Qsc3RtMzItZGNtaS1taW4tZnJlcXVlbmN5IHByb3BlcnR5IHdoaWNoIGlz
IHVzZWQgdG8NCj4+IHJlcXVlc3QgQ1BVcyBtaW5pbXVtIGZyZXF1ZW5jeSB3aGVuIHN0cmVhbWlu
ZyBmcmFtZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmph
bWluLmdhaWduYXJkQHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sIHwgOCArKysrKysrKw0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1s
DQo+PiBpbmRleCAzZmU3NzhjYjVjYzMuLjA1Y2E4NWEyNDExYSAxMDA2NDQNCj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwN
Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0z
Mi1kY21pLnlhbWwNCj4+IEBAIC00NCw2ICs0NCwxMyBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgICAg
ICBiaW5kaW5ncyBkZWZpbmVkIGluDQo+PiAgICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS92aWRlby1pbnRlcmZhY2VzLnR4dC4NCj4+ICAgDQo+PiArICBzdCxz
dG0zMi1kY21pLW1pbi1mcmVxdWVuY3k6DQo+PiArICAgIGRlc2NyaXB0aW9uOiBEQ01JIG1pbmlt
dW0gQ1BVcyBmcmVxdWVuY3kgcmVxdWlyZW1lbnQgKGluIEtIeikuDQo+PiArICAgIGFsbE9mOg0K
Pj4gKyAgICAgIC0gJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
DQo+PiArICAgICAgLSBtaW5pbXVtOiAwDQo+PiArICAgICAgLSBkZWZhdWx0OiAwDQo+IEkgdGhp
bmsgdGhpcyBpcyBxdWVzdGlvbmFibGUgdG8gYmUgaW4gRFQgYW5kIGlmIGl0IGlzLCBpdCdzIHNv
bWV0aGluZw0KPiB0aGF0J3MgaGFyZGx5IHNwZWNpZmljIHRvIFNUIG9yIHRoaXMgYmxvY2suIElJ
UkMsIHdlIGFscmVhZHkgaGF2ZSBhIHdheQ0KPiB0byBzcGVjaWZ5IG1pbmltdW0gT1BQcy4NClRo
aXMgYmluZGluZyBpcyBvbmx5IG5lZWRlZCBvbiBzb21lIFNUTTMyIFNvQyB3aGVuIERWRlMgaXMg
YWN0aXZhdGVkDQp3aXRoIGxvdyBmcmVxdWVuY3kgc2V0dGluZyBpbiBvcHAuIFRoZSB2YWx1ZSBh
bHNvIGRlcGVuZHMgb2YgdGhlIHRhcmdldGVkDQp2aWRlbyBmb3JtYXQgYW5kIGZyYW1lcmF0ZS4N
Cg0KSXQgaXMgbm90IGFuIG9wcCBiZWNhdXNlIGl0IGRvZXNuJ3QgZGVmaW5lIGEgdm9sdGFnZS1j
dXJyZW50LWZyZXF1ZW5jeSANCmNvbWJpbmF0aW9uDQpidXQgb25seSBzZXQgYSBtaW5pbXVtIHRh
cmdldCBmb3IgdGhlIENQVXMgZnJlcXVlbmN5IHRvIGd1YXJhbnR5IGEgZ29vZCANCnJlYWN0aW9u
DQp0aW1lIHdoZW4gaGFuZGxpbmcgSVJRcyBmb3IgdGhlIHNlbnNvci4NCg0KQmVuamFtaW4NCj4N
Cj4gUm9iDQo=
