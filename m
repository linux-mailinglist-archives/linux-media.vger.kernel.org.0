Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E249920512D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732447AbgFWLst (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:48:49 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:36874 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732393AbgFWLst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:48:49 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 05NBd7JX024529;
        Tue, 23 Jun 2020 13:48:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8GLEyJF1RP/0S6eNOt0taOq5xmseUp4BDZTBqjwSORo=;
 b=HX7+MGJ0Z+CJEkGXEQ7yOlzqFwXjQFMUGKS3oq1dxNcIq4/K/g28ymBwpRySOEZxcVD0
 AZvWsOa4JUCpyWZlwP21YfoeyZ39fieNLs6QfEosgdw36Np6XdrzT60uLHZpebqIASbt
 pHSDIzRUbzNafIyqz0YJA68j0De/JpNajnDZU/VR8GpOeMuMalf0P4lmLEXqjf7i5Nst
 WgxM1OpdQe/Bi9YSN6BPdy+MNw7EdAMvB9yN/1HNBsnLf121HoPWRpfDCOFg5MGOc+hE
 sgKKWoXioMX379LTFkA7inS1qwc24UvrUbZyGZo0/R+mAosXsM2eLIh6CS0HevAWLogl xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 31s7x1q2hy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Jun 2020 13:48:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2864510002A;
        Tue, 23 Jun 2020 13:48:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 035F22BEC60;
        Tue, 23 Jun 2020 13:48:29 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 23 Jun
 2020 13:48:28 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 23 Jun 2020 13:48:28 +0200
From:   Benjamin GAIGNARD <benjamin.gaignard@st.com>
To:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
        "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
        "rjw@rjwysocki.net" <rjw@rjwysocki.net>
Subject: Re: [PATCH v6 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Topic: [PATCH v6 1/3] dt-bindings: media: stm32-dcmi: Add DCMI min
 frequency property
Thread-Index: AQHWPyIqkpbWacV/F06UdbxSuP3c1KjmCJ6A
Date:   Tue, 23 Jun 2020 11:48:28 +0000
Message-ID: <459a0e53-c8d7-b79b-3004-f0114c99cff5@st.com>
References: <20200610122500.4304-1-benjamin.gaignard@st.com>
 <20200610122500.4304-2-benjamin.gaignard@st.com>
In-Reply-To: <20200610122500.4304-2-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC7350B716B3C5449474C6B2329F898B@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-06-23_06:2020-06-23,2020-06-23 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCk9uIDYvMTAvMjAgMjoyNCBQTSwgQmVuamFtaW4gR2FpZ25hcmQgd3JvdGU6DQo+IERvY3Vt
ZW50IHN0LHN0bTMyLWRjbWktbWluLWZyZXF1ZW5jeSBwcm9wZXJ0eSB3aGljaCBpcyB1c2VkIHRv
DQo+IHJlcXVlc3QgQ1BVcyBtaW5pbXVtIGZyZXF1ZW5jeSB3aGVuIHN0cmVhbWluZyBmcmFtZXMu
DQpHZW50bGUgZm9yIHJldmlld2VycyBvbiB0aGlzIGJpbmRpbmdzLg0KDQpUaGFua3MsDQpCZW5q
YW1pbg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2Fp
Z25hcmRAc3QuY29tPg0KPiAtLS0NCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sIHwgOCArKysrKysrKw0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sDQo+IGluZGV4IDNm
ZTc3OGNiNWNjMy4uMDVjYTg1YTI0MTFhIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzItZGNtaS55YW1sDQo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMi1kY21pLnlhbWwNCj4g
QEAgLTQ0LDYgKzQ0LDEzIEBAIHByb3BlcnRpZXM6DQo+ICAgICAgICAgYmluZGluZ3MgZGVmaW5l
ZCBpbg0KPiAgICAgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS92
aWRlby1pbnRlcmZhY2VzLnR4dC4NCj4gICANCj4gKyAgc3Qsc3RtMzItZGNtaS1taW4tZnJlcXVl
bmN5Og0KPiArICAgIGRlc2NyaXB0aW9uOiBEQ01JIG1pbmltdW0gQ1BVcyBmcmVxdWVuY3kgcmVx
dWlyZW1lbnQgKGluIEtIeikuDQo+ICsgICAgYWxsT2Y6DQo+ICsgICAgICAtICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KPiArICAgICAgLSBtaW5pbXVtOiAw
DQo+ICsgICAgICAtIGRlZmF1bHQ6IDANCj4gKw0KPiAgIHJlcXVpcmVkOg0KPiAgICAgLSBjb21w
YXRpYmxlDQo+ICAgICAtIHJlZw0KPiBAQCAtNzEsNiArNzgsNyBAQCBleGFtcGxlczoNCj4gICAg
ICAgICAgIGNsb2NrLW5hbWVzID0gIm1jbGsiOw0KPiAgICAgICAgICAgZG1hcyA9IDwmZG1hbXV4
MSA3NSAweDQwMCAweDBkPjsNCj4gICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCI7DQo+ICsgICAg
ICAgIHN0LHN0bTMyLWRjbWktbWluLWZyZXF1ZW5jeSA9IDw2NTAwMDA+Ow0KPiAgIA0KPiAgICAg
ICAgICAgcG9ydCB7DQo+ICAgICAgICAgICAgICAgIGRjbWlfMDogZW5kcG9pbnQgew0K
