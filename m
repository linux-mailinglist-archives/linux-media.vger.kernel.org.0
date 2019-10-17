Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533B5DABE6
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 14:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406086AbfJQMYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 08:24:11 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:29160 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728554AbfJQMYL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 08:24:11 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9HC6GwX019539;
        Thu, 17 Oct 2019 14:24:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=TGt1UZEWqcZi9YT+7fgtBx5eJzJbTWv2BIm+L25kpBw=;
 b=L0Ta2upc63+LesPIf9zpg5X8gjJxtnke98PPYmA2N4SR0CFzxFvDxkBfI5lKQdAIrMQQ
 /TlLhBkwRrQjhNmawVaYTD3sv0uJ2Lkmq8QBc7tX2le8YWtLQeEbIlWYWyLkBhZDEvKj
 rMT4KbtUsKV3Z55je4eKqpjNCHehl3ocYOgL4m7vwiD/EZEBV8xaPCwE6S+R6hyT86Gy
 ljLdE8fP56sKG0hQOWCxtxuVhOMnABJUJ2vwtbEq/9rvjvWD49EOasls/g70j37ayYF2
 o5/rKhyjj92iBak0FNBABooiOvipeQ4meet5usgG4o4dnDaBhn4Ad2Qb6ASys9Gio5MZ eQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2vk4a1kt9c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Oct 2019 14:24:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0248110002A;
        Thu, 17 Oct 2019 14:24:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E7F832D378B;
        Thu, 17 Oct 2019 14:24:04 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Oct
 2019 14:24:04 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 17 Oct 2019 14:24:04 +0200
From:   Mickael GUENE <mickael.guene@st.com>
To:     Chuhong Yuan <hslester96@gmail.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: st-mipid02: add a check for
 devm_gpiod_get_optional
Thread-Topic: [PATCH] media: st-mipid02: add a check for
 devm_gpiod_get_optional
Thread-Index: AQHVhBBYvH4VqO4jG0ud7QMMFFTos6deMe0AgAAi54CAAE0LAA==
Date:   Thu, 17 Oct 2019 12:24:04 +0000
Message-ID: <f42c4bea-8991-434f-48b4-bfbccfd29701@st.com>
References: <20191016105604.8036-1-hslester96@gmail.com>
 <8de93390-ae04-4278-bb34-aa175c659c23@st.com>
 <CANhBUQ0MvXYm4iLcx5gWyq=0VMmafRAJ7TsTtUuOT0YwgBcAOA@mail.gmail.com>
In-Reply-To: <CANhBUQ0MvXYm4iLcx5gWyq=0VMmafRAJ7TsTtUuOT0YwgBcAOA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA298225B701124C81442B57DE375669@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-17_04:2019-10-17,2019-10-17 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gQ2h1aG9uZywNCg0KIFNvcnJ5IEkgbWlzc2VkICdpZiAoUFRSX0VSUihkZXNjKSA9PSAt
RU5PRU5UKScgY2hlY2sgLi4uLg0KIENhbiB5b3UgaW4gdGhpcyBjYXNlIGFkZCBhbiBlcnJvciBt
ZXNzYWdlID8NCg0KUmVnYXJkcw0KTWlja2FlbA0KIA0KT24gMTAvMTcvMTkgMDk6NDgsIENodWhv
bmcgWXVhbiB3cm90ZToNCj4gT24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMTo0MyBQTSBNaWNrYWVs
IEdVRU5FIDxtaWNrYWVsLmd1ZW5lQHN0LmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGVsbG8gQ2h1aG9u
ZywNCj4+DQo+PiAgSXMgdGhpcyBjaGVjayBuZWNlc3NhcnkgPw0KPj4gc2luY2UgbG9va2luZyBp
bnRvIGNvZGUgaXQgc2VlbXMgdG8gbWUgZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoKSBjYW4gb25s
eQ0KPj4gcmV0dXJuIE5VTEwgaW4gY2FzZSBvZiBlcnJvciBkdWUgdG8gZm9sbG93aW5nIGNoZWNr
IGluIGRldm1fZ3Bpb2RfZ2V0X2luZGV4X29wdGlvbmFsKCkNCj4+ICAgICAgICAgaWYgKElTX0VS
UihkZXNjKSkgew0KPj4gICAgICAgICAgICAgICAgIGlmIChQVFJfRVJSKGRlc2MpID09IC1FTk9F
TlQpDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4+ICAgICAgICAg
fQ0KPj4gIEFuZCBpbiB0aGF0IGNhc2UgcmVzZXRfZ3BpbyBpcyBub3QgdXNlZA0KPj4NCj4gDQo+
IFRoZSBwcm9ibGVtIG1heSBub3QgYmUgYSBudWxsIHJldHVybiB2YWx1ZSwgYnV0IGEgcmV0dXJu
ZWQgZXJyb3IsDQo+IHdoaWNoIGlzIGEgbWludXMgdmFsdWUsDQo+IGxpa2UgLUVQUk9CRV9ERUZF
UiBvciAtRUlOVkFMIHJldHVybmVkIGJ5IGdwaW9kX2ZpbmQgaW4gZ3Bpb2RfZ2V0X2luZGV4Lg0K
PiBJbiB0aGVzZSBjYXNlcywgZGV2bV9ncGlvZF9nZXRfaW5kZXhfb3B0aW9uYWwgd2lsbCBub3Qg
cmV0dXJuIG51bGwgYnV0DQo+IHJldHVybiB0aGUgZXJyb3IuDQo+IFRoZXJlZm9yZSwgdGhpcyBj
aGVjayBpcyBuZWNlc3NhcnkuDQo+IA0KPj4gUmVnYXJkcw0KPj4gTWlja2FlbA0KPj4NCj4+IE9u
IDEwLzE2LzE5IDEyOjU2LCBDaHVob25nIFl1YW4gd3JvdGU6DQo+Pj4gbWlwaWQwMl9wcm9iZSBt
aXNzZXMgYSBjaGVjayBmb3IgZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwgYW5kIG1heSBtaXNzDQo+
Pj4gdGhlIGZhaWx1cmUuDQo+Pj4gQWRkIGEgY2hlY2sgdG8gZml4IHRoZSBwcm9ibGVtLg0KPj4+
DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4N
Cj4+PiAtLS0NCj4+PiAgZHJpdmVycy9tZWRpYS9pMmMvc3QtbWlwaWQwMi5jIHwgMyArKysNCj4+
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvaTJjL3N0LW1pcGlkMDIuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL3N0LW1p
cGlkMDIuYw0KPj4+IGluZGV4IDgxMjg1YjhkNWNmYi4uZDM4ZTg4OGIwYTQzIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL3N0LW1pcGlkMDIuYw0KPj4+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvaTJjL3N0LW1pcGlkMDIuYw0KPj4+IEBAIC05NzEsNiArOTcxLDkgQEAgc3RhdGljIGlu
dCBtaXBpZDAyX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+Pj4gICAgICAgYnJp
ZGdlLT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoZGV2LCAicmVzZXQiLA0K
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdQ
SU9EX09VVF9ISUdIKTsNCj4+Pg0KPj4+ICsgICAgIGlmIChJU19FUlIoYnJpZGdlLT5yZXNldF9n
cGlvKSkNCj4+PiArICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGJyaWRnZS0+cmVzZXRfZ3Bp
byk7DQo+Pj4gKw0KPj4+ICAgICAgIHJldCA9IG1pcGlkMDJfZ2V0X3JlZ3VsYXRvcnMoYnJpZGdl
KTsNCj4+PiAgICAgICBpZiAocmV0KSB7DQo+Pj4gICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byBnZXQgcmVndWxhdG9ycyAlZCIsIHJldCk7DQo+Pj4=
