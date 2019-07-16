Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1236A2E7
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfGPH15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:27:57 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:7580 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726463AbfGPH15 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:27:57 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x6G7QPuW028268;
        Tue, 16 Jul 2019 09:27:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WDGeZy80XcTbElWt1TkbYFCN5y3sqMErTilEyo9Xl/k=;
 b=o0HZ+RFV7Ud+us+mhsTB/lKkAz4otdMk2Q5ZaaEEJKlCdf3HOXpKz2Bs1aKggaGZPwOa
 w0C/nzu63b552VNEquSIlkiT+2YCaJWder9kHkMPJf5AI364xKVbdMcO6kTpb1ZNRLg3
 RDvKmyg3qmQkqdbsC4mIBGhAsmHIVzW8rG5d/9aiGJIP+xLJ4DBDayepBso15cvaPmG6
 Jk/TIDYCrR0+wjxhD9D8qKj1KdZhGVA6zG2LCHjd6HKppq3D7Jczu7FYjzHH2vGFoKTl
 d8gmhUiePWRPqPJF4ersJQ8znoM30WRV0PuadCTfH4s6Na0pdzNok257q8qBpzUvqGTD Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tq4e8u9j3-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 16 Jul 2019 09:27:45 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B26893A;
        Tue, 16 Jul 2019 07:27:44 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 48F1F165E;
        Tue, 16 Jul 2019 07:27:44 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jul
 2019 09:27:44 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 16 Jul 2019 09:27:44 +0200
From:   Patrice CHOTARD <patrice.chotard@st.com>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: platform: sti: c8sectpfe: core: Add of_node_put()
 at goto
Thread-Topic: [PATCH] media: platform: sti: c8sectpfe: core: Add of_node_put()
 at goto
Thread-Index: AQHVO5i+VkE7w5CaLkelHQmii7JzPKbMtzGA
Date:   Tue, 16 Jul 2019 07:27:43 +0000
Message-ID: <34df6b29-cbbe-ab1e-6a67-e483d3d75868@st.com>
References: <20190716053831.2613-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190716053831.2613-1-nishkadg.linux@gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D42247B2AC76C4BB20AA1796EE60E64@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-16_02:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTmlzaGthDQoNCk9uIDcvMTYvMTkgNzozOCBBTSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOg0K
PiBFYWNoIGl0ZXJhdGlvbiBvZiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlIHB1dHMgdGhlIHByZXZp
b3VzIG5vZGUsIGJ1dCBpbg0KPiB0aGUgY2FzZSBvZiBhIGdvdG8gZnJvbSB0aGUgbWlkZGxlIG9m
IHRoZSBsb29wLCB0aGVyZSBpcyBubyBwdXQsIHRodXMNCj4gY2F1c2luZyBhIG1lbW9yeSBsZWFr
LiBIZW5jZSBhZGQgYSBuZXcgbGFiZWwgdGhhdCBwdXRzIHRoZSBsYXN0IHVzZWQNCj4gbm9kZSwg
YW5kIGVkaXQgdGhlIGdvdG8gc3RhdGVtZW50cyBpbiB0aGUgbWlkZGxlIG9mIHRoZSBsb29wIHRv
IGZpcnN0IGdvDQo+IHRvIHRoZSBuZXcgbGFiZWwuDQo+IElzc3VlIGZvdW5kIHdpdGggQ29jY2lu
ZWxsZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTmlzaGthIERhc2d1cHRhIDxuaXNoa2FkZy5saW51
eEBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgLi4uL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0
cGZlLWNvcmUuYyAgICB8IDE4ICsrKysrKysrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUuYyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vc3RpL2M4c2VjdHBmZS9jOHNlY3RwZmUtY29yZS5jDQo+IGluZGV4
IDNjMDViM2RjNDllYy4uODVhYjIwNDkyYzJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUuYw0KPiArKysgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3N0aS9jOHNlY3RwZmUvYzhzZWN0cGZlLWNvcmUuYw0KPiBAQCAtNzcx
LDcgKzc3MSw3IEBAIHN0YXRpYyBpbnQgYzhzZWN0cGZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICANCj4gIAkJaWYgKCFmZWktPmNoYW5uZWxfZGF0YVtpbmRleF0pIHsN
Cj4gIAkJCXJldCA9IC1FTk9NRU07DQo+IC0JCQlnb3RvIGVycl9jbGtfZGlzYWJsZTsNCj4gKwkJ
CWdvdG8gZXJyX25vZGVfcHV0Ow0KPiAgCQl9DQo+ICANCj4gIAkJdHNpbiA9IGZlaS0+Y2hhbm5l
bF9kYXRhW2luZGV4XTsNCj4gQEAgLTc4MSw3ICs3ODEsNyBAQCBzdGF0aWMgaW50IGM4c2VjdHBm
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlyZXQgPSBvZl9wcm9w
ZXJ0eV9yZWFkX3UzMihjaGlsZCwgInRzaW4tbnVtIiwgJnRzaW4tPnRzaW5faWQpOw0KPiAgCQlp
ZiAocmV0KSB7DQo+ICAJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJObyB0c2luX251bSBmb3VuZFxu
Iik7DQo+IC0JCQlnb3RvIGVycl9jbGtfZGlzYWJsZTsNCj4gKwkJCWdvdG8gZXJyX25vZGVfcHV0
Ow0KPiAgCQl9DQo+ICANCj4gIAkJLyogc2FuaXR5IGNoZWNrIHZhbHVlICovDQo+IEBAIC03OTAs
NyArNzkwLDcgQEAgc3RhdGljIGludCBjOHNlY3RwZmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gIAkJCQkidHNpbi1udW0gJWQgc3BlY2lmaWVkIGdyZWF0ZXIgdGhhbiBu
dW1iZXJcblx0b2YgaW5wdXQgYmxvY2sgaHcgaW4gU29DISAoJWQpIiwNCj4gIAkJCQl0c2luLT50
c2luX2lkLCBmZWktPmh3X3N0YXRzLm51bV9pYik7DQo+ICAJCQlyZXQgPSAtRUlOVkFMOw0KPiAt
CQkJZ290byBlcnJfY2xrX2Rpc2FibGU7DQo+ICsJCQlnb3RvIGVycl9ub2RlX3B1dDsNCj4gIAkJ
fQ0KPiAgDQo+ICAJCXRzaW4tPmludmVydF90c19jbGsgPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
Y2hpbGQsDQo+IEBAIC04MDYsMTQgKzgwNiwxNCBAQCBzdGF0aWMgaW50IGM4c2VjdHBmZV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQkJCQkmdHNpbi0+ZHZiX2NhcmQp
Ow0KPiAgCQlpZiAocmV0KSB7DQo+ICAJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJObyBkdmItY2Fy
ZCBmb3VuZFxuIik7DQo+IC0JCQlnb3RvIGVycl9jbGtfZGlzYWJsZTsNCj4gKwkJCWdvdG8gZXJy
X25vZGVfcHV0Ow0KPiAgCQl9DQo+ICANCj4gIAkJaTJjX2J1cyA9IG9mX3BhcnNlX3BoYW5kbGUo
Y2hpbGQsICJpMmMtYnVzIiwgMCk7DQo+ICAJCWlmICghaTJjX2J1cykgew0KPiAgCQkJZGV2X2Vy
cigmcGRldi0+ZGV2LCAiTm8gaTJjLWJ1cyBmb3VuZFxuIik7DQo+ICAJCQlyZXQgPSAtRU5PREVW
Ow0KPiAtCQkJZ290byBlcnJfY2xrX2Rpc2FibGU7DQo+ICsJCQlnb3RvIGVycl9ub2RlX3B1dDsN
Cj4gIAkJfQ0KPiAgCQl0c2luLT5pMmNfYWRhcHRlciA9DQo+ICAJCQlvZl9maW5kX2kyY19hZGFw
dGVyX2J5X25vZGUoaTJjX2J1cyk7DQo+IEBAIC04MjEsNyArODIxLDcgQEAgc3RhdGljIGludCBj
OHNlY3RwZmVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAkJCWRldl9l
cnIoJnBkZXYtPmRldiwgIk5vIGkyYyBhZGFwdGVyIGZvdW5kXG4iKTsNCj4gIAkJCW9mX25vZGVf
cHV0KGkyY19idXMpOw0KPiAgCQkJcmV0ID0gLUVOT0RFVjsNCj4gLQkJCWdvdG8gZXJyX2Nsa19k
aXNhYmxlOw0KPiArCQkJZ290byBlcnJfbm9kZV9wdXQ7DQo+ICAJCX0NCj4gIAkJb2Zfbm9kZV9w
dXQoaTJjX2J1cyk7DQo+ICANCj4gQEAgLTgzMiw3ICs4MzIsNyBAQCBzdGF0aWMgaW50IGM4c2Vj
dHBmZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQkJZGV2X2Vycihk
ZXYsDQo+ICAJCQkJInJlc2V0IGdwaW8gZm9yIHRzaW4lZCBub3QgdmFsaWQgKGdwaW89JWQpXG4i
LA0KPiAgCQkJCXRzaW4tPnRzaW5faWQsIHRzaW4tPnJzdF9ncGlvKTsNCj4gLQkJCWdvdG8gZXJy
X2Nsa19kaXNhYmxlOw0KPiArCQkJZ290byBlcnJfbm9kZV9wdXQ7DQo+ICAJCX0NCj4gIA0KPiAg
CQlyZXQgPSBkZXZtX2dwaW9fcmVxdWVzdF9vbmUoZGV2LCB0c2luLT5yc3RfZ3BpbywNCj4gQEAg
LTg0MCw3ICs4NDAsNyBAQCBzdGF0aWMgaW50IGM4c2VjdHBmZV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPiAgCQlpZiAocmV0ICYmIHJldCAhPSAtRUJVU1kpIHsNCj4gIAkJ
CWRldl9lcnIoZGV2LCAiQ2FuJ3QgcmVxdWVzdCB0c2luJWQgcmVzZXQgZ3Bpb1xuIg0KPiAgCQkJ
CSwgZmVpLT5jaGFubmVsX2RhdGFbaW5kZXhdLT50c2luX2lkKTsNCj4gLQkJCWdvdG8gZXJyX2Ns
a19kaXNhYmxlOw0KPiArCQkJZ290byBlcnJfbm9kZV9wdXQ7DQo+ICAJCX0NCj4gIA0KPiAgCQlp
ZiAoIXJldCkgew0KPiBAQCAtODgzLDYgKzg4Myw4IEBAIHN0YXRpYyBpbnQgYzhzZWN0cGZlX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICANCj4gIAlyZXR1cm4gMDsNCj4g
IA0KPiArZXJyX25vZGVfcHV0Og0KPiArCW9mX25vZGVfcHV0KGNoaWxkKTsNCj4gIGVycl9jbGtf
ZGlzYWJsZToNCj4gIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZmVpLT5jOHNlY3RwZmVjbGspOw0K
PiAgCXJldHVybiByZXQ7DQoNCkFja2VkLWJ5OiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hv
dGFyZEBzdC5jb20+DQoNClRoYW5rcw0KDQo=
