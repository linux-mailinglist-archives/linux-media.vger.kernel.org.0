Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB4C3307D
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 15:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbfFCND4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 09:03:56 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8034 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726379AbfFCNDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 09:03:55 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x53D29gj007830;
        Mon, 3 Jun 2019 15:03:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Yw1hBtZR78FRlvaY6GGctzL2o+O10Y/M0xnj+n+p2Bc=;
 b=hp+ZYfxxfJeIuT/RaytPDswUXx+ds5iGHjF2orcdEDZur/sIDfUbb85B9EQGs4KkmZ5f
 KyGWLZ3dGw5KVOu2jhV2/nxv5zvNfcLL605UUPvG+ZyM9FEPm+xK5+zETprDYxSNetBK
 67WbBy9piiuojVicOol5hKWDMHkO5ajhMmdwq60YeRFvAmxtmj84JC5QzN5vlNI02N/z
 gAGV0P6Y6Fa6f/V2PZYnjsYsob6dwUJkUY91V5z2yYA+uYvcQWvUkfZ3LoAuIa63inCd
 rC6Fr75jQrNQJ5ychX3YNpFTi7pJ+xtYLoa+uuB3+2KnId4alxfXj5ZYAN6AuVL9Q/ip Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sunmeaess-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 03 Jun 2019 15:03:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D35C13F;
        Mon,  3 Jun 2019 13:03:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A223D2434;
        Mon,  3 Jun 2019 13:03:40 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Jun
 2019 15:03:40 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Mon, 3 Jun 2019 15:03:40 +0200
From:   Fabien DESSENNE <fabien.dessenne@st.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hugues FRUCHET <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Pavel Machek <pavel@denx.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] media: stm32-dcmi: fix irq = 0 case
Thread-Topic: [PATCH] media: stm32-dcmi: fix irq = 0 case
Thread-Index: AQHVF5HP7OIc+eCgyUyFjdbkSczlYqaJswGAgAAV2oA=
Date:   Mon, 3 Jun 2019 13:03:40 +0000
Message-ID: <dd4ca76b-9f93-5ddc-e878-25b9905e0cd2@st.com>
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
 <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
In-Reply-To: <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-Type: text/plain; charset="utf-8"
Content-ID: <16FAE0F28C0E154C942967FC70244FEE@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-03_10:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucw0KDQoNCiJwbGF0Zm9ybV9nZXRfaXJxKCkgPSAwIiBzaGFsbCBiZSBjb25zaWRlcmVk
IGFzIGFuIGVycm9yLiBTZWUgdGhlc2UgDQpkaXNjdXNzaW9uczoNCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcGF0Y2gvMTAwMDY2NTEvDQpodHRwczovL3lhcmNoaXZlLm5ldC9jb21wL2xp
bnV4L3plcm8uaHRtbA0KDQpCUg0KDQpGYWJpZW4NCg0KT24gMDMvMDYvMjAxOSAxOjQ1IFBNLCBI
YW5zIFZlcmt1aWwgd3JvdGU6DQo+IE9uIDUvMzEvMTkgMTE6MTggQU0sIEZhYmllbiBEZXNzZW5u
ZSB3cm90ZToNCj4+IE1hbmFnZSB0aGUgaXJxID0gMCBjYXNlLCB3aGVyZSB3ZSBzaGFsbCByZXR1
cm4gYW4gZXJyb3IuDQo+Pg0KPj4gRml4ZXM6IGI1YjVhMjdiZWU1OCAoIm1lZGlhOiBzdG0zMi1k
Y21pOiByZXR1cm4gYXBwcm9wcmlhdGUgZXJyb3IgY29kZXMgZHVyaW5nIHByb2JlIikNCj4+IFNp
Z25lZC1vZmYtYnk6IEZhYmllbiBEZXNzZW5uZSA8ZmFiaWVuLmRlc3Nlbm5lQHN0LmNvbT4NCj4+
IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyB8IDIg
Ky0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNt
aS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4+IGluZGV4
IGI5ZGFkMGEuLmQ4NTVlOWMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0z
Mi9zdG0zMi1kY21pLmMNCj4+IEBAIC0xNzAyLDcgKzE3MDIsNyBAQCBzdGF0aWMgaW50IGRjbWlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgCWlmIChpcnEgPD0gMCkg
ew0KPiBTaG91bGRuJ3QgdGhpcyBiZSAnaXJxIDwgMCcgaW5zdGVhZCBvZiAnPD0nID8NCj4NCj4g
QUZBSUNUIGlycSA9PSAwIGNhbiBiZSBhIHZhbGlkIGlycSBhbmQgaXNuJ3QgYW4gZXJyb3IuDQo+
DQo+IFJlZ2FyZHMsDQo+DQo+IAlIYW5zDQo+DQo+PiAgIAkJaWYgKGlycSAhPSAtRVBST0JFX0RF
RkVSKQ0KPj4gICAJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDb3VsZCBub3QgZ2V0IGlycVxuIik7
DQo+PiAtCQlyZXR1cm4gaXJxOw0KPj4gKwkJcmV0dXJuIGlycSA/IGlycSA6IC1FTlhJTzsNCj4+
ICAgCX0NCj4+ICAgDQo+PiAgIAlkY21pLT5yZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRl
diwgSU9SRVNPVVJDRV9NRU0sIDApOw0KPj4=
