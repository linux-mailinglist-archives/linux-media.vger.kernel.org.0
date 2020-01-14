Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A835913A30A
	for <lists+linux-media@lfdr.de>; Tue, 14 Jan 2020 09:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbgANIdw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jan 2020 03:33:52 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:27324 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725820AbgANIdw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jan 2020 03:33:52 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00E8WfYL030731;
        Tue, 14 Jan 2020 09:33:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=aH+VgKhntPJejCKotmGf4u8BN12HEJsiXYdcTd5+R1Q=;
 b=1EtTanosCjM10pmbL4b9PdRjwIbEYQqZwmF1pEv5cbonN8fXtrY5/Skitbi1dcu4+lPV
 DUDM4xap9ruGArtlmbDvrXLPrbixZdal9jAMXpHaOE0U4Ur0jMcSAqKtKqOJq9drVFqS
 20eOTtTgu8lnvH8ufLTGhEZ3URSH+KwyrXzWTKG53zwCkcTsQZHj7y6ffrhjCc3KUvF7
 3s/Xnvq6yXVoiLMQdIkmQU0lUgc+TZV1gPZ8WwGRsWiT10vGuca7ma1JkB36MBZQbzO0
 OlCLwq19DOCWYp0aWf6NpTHwpww3eHsQDcGaFbqzv1JkVviV9nDLM7r2OZH4RwDMzojK HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf77avamc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Jan 2020 09:33:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD5EA100039;
        Tue, 14 Jan 2020 09:33:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9400F20C173;
        Tue, 14 Jan 2020 09:33:36 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Jan
 2020 09:33:36 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Jan 2020 09:33:36 +0100
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] media: c8sectpfe: clean up some indenting
Thread-Topic: [PATCH] media: c8sectpfe: clean up some indenting
Thread-Index: AQHVypjqlAXDnxjPb0SJzrxmeKcFr6fpxKmA
Date:   Tue, 14 Jan 2020 08:33:36 +0000
Message-ID: <5eba4701-3460-5b2b-6fc7-f4f75481fae4@st.com>
References: <20200114051005.njxf5d6s6ycyxhfi@kili.mountain>
In-Reply-To: <20200114051005.njxf5d6s6ycyxhfi@kili.mountain>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <948CCDA2404F4A409317526ADB82D400@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-14_02:2020-01-13,2020-01-14 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRGFuDQoNCk9uIDEvMTQvMjAgNjoxMCBBTSwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gVGhl
ICJzZWdfbnVtLCIgbGluZSB3YXNuJ3QgaW5kZW50ZWQuICBBbGwgdGhlIGFyZ3VtZW50cyBjYW4g
Zml0IG5pY2VseQ0KPiBvbiB0d28gbGluZXMuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJw
ZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUuYyB8IDUgKystLS0NCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNv
cmUuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtY29y
ZS5jDQo+IGluZGV4IDViYWFkYTRmNjVlNS4uZDE1MThhNjc3MGZhIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUuYw0KPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUu
Yw0KPiBAQCAtMTAzNCw5ICsxMDM0LDggQEAgc3RhdGljIHZvaWQgbG9hZF9pbWVtX3NlZ21lbnQo
c3RydWN0IGM4c2VjdHBmZWkgKmZlaSwgRWxmMzJfUGhkciAqcGhkciwNCj4gIA0KPiAgCWRldl9k
YmcoZmVpLT5kZXYsDQo+ICAJCSJMb2FkaW5nIElNRU0gc2VnbWVudCAlZCAweCUwOHhcblx0ICgw
eCV4IGJ5dGVzKSAtPiAweCVwICgweCV4IGJ5dGVzKVxuIiwNCj4gLXNlZ19udW0sDQo+IC0JCXBo
ZHItPnBfcGFkZHIsIHBoZHItPnBfZmlsZXN6LA0KPiAtCQlkZXN0LCBwaGRyLT5wX21lbXN6ICsg
cGhkci0+cF9tZW1zeiAvIDMpOw0KPiArCQlzZWdfbnVtLCBwaGRyLT5wX3BhZGRyLCBwaGRyLT5w
X2ZpbGVzeiwgZGVzdCwNCj4gKwkJcGhkci0+cF9tZW1zeiArIHBoZHItPnBfbWVtc3ogLyAzKTsN
Cj4gIA0KPiAgCWZvciAoaSA9IDA7IGkgPCBwaGRyLT5wX2ZpbGVzejsgaSsrKSB7DQo+ICANCg0K
UmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90YXJkQHN0LmNvbT4NCg0K
VGhhbmtzDQo=
