Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1951E0E9B
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403771AbgEYMls (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 08:41:48 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45538 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2403768AbgEYMlr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 08:41:47 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 04PCX5Ta020540;
        Mon, 25 May 2020 14:41:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ChULY1QgKwE4f/d6zUXepILX21n8fYToZxGhGbwvtdU=;
 b=vAUCFGxD86/MhLh7yzlXoaybtvtKDU3bv6fGkkfNXo4ci18h/1hl1xI2oRbO+ALqnNYn
 1HCvcol7GeTu8Yw8Pwlpe+9pRaKCsIvz1KjEBZnRtT6hf1E0BX/cDOywTmVntHSThhP2
 leIquisqFDDnAxLSZsuYdT/vSFWrOpnyj9oYjl9JK4C3U8Qv9MofuD/fFPKVpbUOZg4p
 rucC0ZS/ZM37mGcKmenY29ZwW3Duh7yxUTEklxQVoviCiZl52kUWgS3I/LvWn4nSQTQg
 L7xbqvaX7b5Xi6J+wMVacTvyVIhFBwnqpf2pawq4+TcBA9ZNwwrdcWcVkf+HpCxjqDkg 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 316tqgt0hs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 May 2020 14:41:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E9DCE100034;
        Mon, 25 May 2020 14:41:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD8D6221C76;
        Mon, 25 May 2020 14:41:18 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 May
 2020 14:41:18 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Mon, 25 May 2020 14:41:18 +0200
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>, "kjlu@umn.edu" <kjlu@umn.edu>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: bdisp: Fix runtime PM imbalance on error
Thread-Topic: [PATCH] media: bdisp: Fix runtime PM imbalance on error
Thread-Index: AQHWL1arwAZV4b7b6Uaa5LImasJTuqi4o1yA
Date:   Mon, 25 May 2020 12:41:18 +0000
Message-ID: <85657433-659c-ca96-b77b-697eb8b9d702@st.com>
References: <20200521100021.12461-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200521100021.12461-1-dinghao.liu@zju.edu.cn>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <028C62B8CDA0654AAFF3B9F8FB75A63C@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216,18.0.687
 definitions=2020-05-25_07:2020-05-25,2020-05-25 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQoNCkxvb2tzIGdvb2QgdG8gbWUuDQoNClJldmlld2VkLWJ5OiBGYWJpZW4gRGVzc2VubmUg
PGZhYmllbi5kZXNzZW5uZUBzdC5jb20+DQoNCkJSDQoNCkZhYmllbg0KDQoNCk9uIDIxLzA1LzIw
MjAgMTI6MDAgcG0sIERpbmdoYW8gTGl1IHdyb3RlOg0KPiBwbV9ydW50aW1lX2dldF9zeW5jKCkg
aW5jcmVtZW50cyB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudGVyIGV2ZW4NCj4gd2hlbiBpdCBy
ZXR1cm5zIGFuIGVycm9yIGNvZGUuIFRodXMgYSBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQg
b24NCj4gdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggdG8ga2VlcCB0aGUgY291bnRlciBiYWxhbmNl
ZC4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRGluZ2hhbyBMaXUgPGRpbmdoYW8ubGl1QHpqdS5lZHUu
Y24+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNwL2JkaXNwLXY0
bDIuYyB8IDMgKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRp
c3AvYmRpc3AtdjRsMi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3At
djRsMi5jDQo+IGluZGV4IGFmMmQ1ZWI3ODJjZS4uZTFkMTUwNTg0YmRjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12NGwyLmMNCj4gKysrIGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jDQo+IEBAIC0xMzcx
LDcgKzEzNzEsNyBAQCBzdGF0aWMgaW50IGJkaXNwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAgCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsNCj4gICAJaWYg
KHJldCA8IDApIHsNCj4gICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHNldCBQTVxuIik7DQo+
IC0JCWdvdG8gZXJyX2RiZzsNCj4gKwkJZ290byBlcnJfcG07DQo+ICAgCX0NCj4gICANCj4gICAJ
LyogRmlsdGVycyAqLw0KPiBAQCAtMTM5OSw3ICsxMzk5LDYgQEAgc3RhdGljIGludCBiZGlzcF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAliZGlzcF9od19mcmVlX2Zp
bHRlcnMoYmRpc3AtPmRldik7DQo+ICAgZXJyX3BtOg0KPiAgIAlwbV9ydW50aW1lX3B1dChkZXYp
Ow0KPiAtZXJyX2RiZzoNCj4gICAJYmRpc3BfZGVidWdmc19yZW1vdmUoYmRpc3ApOw0KPiAgIGVy
cl92NGwyOg0KPiAgIAl2NGwyX2RldmljZV91bnJlZ2lzdGVyKCZiZGlzcC0+djRsMl9kZXYpOw==
