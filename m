Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0519563FF
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2019 10:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZIGP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Jun 2019 04:06:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51970 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725876AbfFZIGP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Jun 2019 04:06:15 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5Q82J0t030833;
        Wed, 26 Jun 2019 10:06:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=inEu8AbbKzcYFvFSR64uR6HEknHjMaCpp82W9brg7X0=;
 b=YqGTlUF+vF9Q+mKnRcAq//nq33gpmV1GMVLExf9WN1/7waciLFF4ewDgO95D06RSA1vk
 z510tEo73O0Ctmud58/eE1a1omhQSLVmh78iqEUD+W7DnzRmHRkq8ZWIu6nX/T84a3/L
 olA9KGpbYB1JqsrDcZRTgkt+UEabjR2ARNtpk3hQIJPFq5ZUfBQcBzJeVUDRlxSvkAPd
 xbrffdbOk4SN14EFViSgF46+2P9uq76pLJVMdSM+DXT/+IqKaUs4nSFfhFkRH6Qvp/3b
 EWDSFZjKxM8wz6dl9cmD/mdABUAYsEIBrdqPLmMKxQNKDbxRs2Pt2XHbvLG8Kl8b5AvN /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2t9d2jpvjn-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 26 Jun 2019 10:06:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B14973A;
        Wed, 26 Jun 2019 08:06:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8124F1651;
        Wed, 26 Jun 2019 08:06:10 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 26 Jun
 2019 10:06:10 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Wed, 26 Jun 2019 10:06:10 +0200
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 09/16] bdisp: set device_caps in struct video_device
Thread-Topic: [PATCH 09/16] bdisp: set device_caps in struct video_device
Thread-Index: AQHVK/L9E64wQuGWxkm57qqpEia6Y6atcpmA
Date:   Wed, 26 Jun 2019 08:06:10 +0000
Message-ID: <aa60863c-46d8-b029-69ea-13d827676957@st.com>
References: <20190626074421.38739-1-hverkuil-cisco@xs4all.nl>
 <20190626074421.38739-10-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20190626074421.38739-10-hverkuil-cisco@xs4all.nl>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B277F17AC327E54FA0B38B9C8FA13E63@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-26_04:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCg0KDQpPbiAyNi8wNi8yMDE5
IDk6NDQgQU0sIEhhbnMgVmVya3VpbCB3cm90ZToNCj4gSW5zdGVhZCBvZiBmaWxsaW5nIGluIHRo
ZSBzdHJ1Y3QgdjRsMl9jYXBhYmlsaXR5IGRldmljZV9jYXBzDQo+IGZpZWxkLCBmaWxsIGluIHRo
ZSBzdHJ1Y3QgdmlkZW9fZGV2aWNlIGRldmljZV9jYXBzIGZpZWxkLg0KPg0KPiBUaGF0IHdheSB0
aGUgVjRMMiBjb3JlIGtub3dzIHdoYXQgdGhlIGNhcGFiaWxpdGllcyBvZiB0aGUNCj4gdmlkZW8g
ZGV2aWNlIGFyZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+DQo+IENjOiBGYWJpZW4gRGVzc2VubmUgPGZhYmllbi5kZXNzZW5uZUBz
dC5jb20+DQoNCg0KUmV2aWV3ZWQtYnk6IEZhYmllbiBEZXNzZW5uZSA8ZmFiaWVuLmRlc3Nlbm5l
QHN0LmNvbT4NCg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RpL2JkaXNw
L2JkaXNwLXY0bDIuYyB8IDYgKy0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA1IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkv
YmRpc3AvYmRpc3AtdjRsMi5jDQo+IGluZGV4IDc5ZjdkYjFhOWQxOC4uZTkwZjFiYTMwNTc0IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0aS9iZGlzcC9iZGlzcC12NGwy
LmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdGkvYmRpc3AvYmRpc3AtdjRsMi5j
DQo+IEBAIC02OTIsMTEgKzY5Miw2IEBAIHN0YXRpYyBpbnQgYmRpc3BfcXVlcnljYXAoc3RydWN0
IGZpbGUgKmZpbGUsIHZvaWQgKmZoLA0KPiAgIAlzdHJzY3B5KGNhcC0+Y2FyZCwgYmRpc3AtPnBk
ZXYtPm5hbWUsIHNpemVvZihjYXAtPmNhcmQpKTsNCj4gICAJc25wcmludGYoY2FwLT5idXNfaW5m
bywgc2l6ZW9mKGNhcC0+YnVzX2luZm8pLCAicGxhdGZvcm06JXMlZCIsDQo+ICAgCQkgQkRJU1Bf
TkFNRSwgYmRpc3AtPmlkKTsNCj4gLQ0KPiAtCWNhcC0+ZGV2aWNlX2NhcHMgPSBWNEwyX0NBUF9T
VFJFQU1JTkcgfCBWNEwyX0NBUF9WSURFT19NMk07DQo+IC0NCj4gLQljYXAtPmNhcGFiaWxpdGll
cyA9IGNhcC0+ZGV2aWNlX2NhcHMgfCBWNEwyX0NBUF9ERVZJQ0VfQ0FQUzsNCj4gLQ0KPiAgIAly
ZXR1cm4gMDsNCj4gICB9DQo+ICAgDQo+IEBAIC0xMDU5LDYgKzEwNTQsNyBAQCBzdGF0aWMgaW50
IGJkaXNwX3JlZ2lzdGVyX2RldmljZShzdHJ1Y3QgYmRpc3BfZGV2ICpiZGlzcCkNCj4gICAJYmRp
c3AtPnZkZXYubG9jayAgICAgICAgPSAmYmRpc3AtPmxvY2s7DQo+ICAgCWJkaXNwLT52ZGV2LnZm
bF9kaXIgICAgID0gVkZMX0RJUl9NMk07DQo+ICAgCWJkaXNwLT52ZGV2LnY0bDJfZGV2ICAgID0g
JmJkaXNwLT52NGwyX2RldjsNCj4gKwliZGlzcC0+dmRldi5kZXZpY2VfY2FwcyA9IFY0TDJfQ0FQ
X1NUUkVBTUlORyB8IFY0TDJfQ0FQX1ZJREVPX00yTTsNCj4gICAJc25wcmludGYoYmRpc3AtPnZk
ZXYubmFtZSwgc2l6ZW9mKGJkaXNwLT52ZGV2Lm5hbWUpLCAiJXMuJWQiLA0KPiAgIAkJIEJESVNQ
X05BTUUsIGJkaXNwLT5pZCk7DQo+ICAg
