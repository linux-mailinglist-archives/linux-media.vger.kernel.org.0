Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05F08146507
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 10:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgAWJxd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 04:53:33 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:34547 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726170AbgAWJxc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 04:53:32 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00N9qXBO031074;
        Thu, 23 Jan 2020 10:53:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=jebCpCZZPKIum5p14EQM9vpinaAYlo2VjAoXb/u5ZBY=;
 b=MpyUX39+rEZepgTqjQAc6e5DadLTkm8Pu+rILybvdd5rHQF2t0mA9Ic48DJG4LiNj3Ln
 IffXiAW7mxZr3TH2XK6sq8GGyAr73LiYNJJWzzi/orPd9oXkyCKI7U4pwBLybOmyOiAe
 nw3p8KRMqaNmy0eFKOR+zREEUFNU5p8nmmRXIOal4NxELI4EQIz4g3dTBQwMETKJ5fGm
 XzcFb4loYanznOg8ZXJAEhaF7hClWIbGyhjogbGL/Ahdx+yrlHRk0q2vjem0/iJqomLl
 +AdxaavzF0TtrRWVLDbCEIUzvJfk+giqXHDsUmgT16QvlWPFm5VdGWa0mQkbABcZbsIZ Zg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkrp2her6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jan 2020 10:53:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EF31100038;
        Thu, 23 Jan 2020 10:53:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18C3A220308;
        Thu, 23 Jan 2020 10:53:20 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 10:53:19 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:53:19 +0100
From:   Philippe CORNU <philippe.cornu@st.com>
To:     Yannick FERTRE <yannick.fertre@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre TORGUE" <alexandre.torgue@st.com>,
        Etienne CARRIERE <etienne.carriere@st.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: platform: stm32: don't print an error on probe
 deferral
Thread-Topic: [PATCH] media: platform: stm32: don't print an error on probe
 deferral
Thread-Index: AQHV0ES87tnRYSqWgkGOHCLoEwzT46f39JSA
Date:   Thu, 23 Jan 2020 09:53:19 +0000
Message-ID: <a1b2d0b4-749e-71db-9e1a-9f784da9d729@st.com>
References: <1579602169-7484-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579602169-7484-1-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-Type: text/plain; charset="utf-8"
Content-ID: <692E62893EDD6D4F9096E3ACEFF068B2@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-23_01:2020-01-23,2020-01-22 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVhcnMgWWFubmljayAmIEV0aWVubmUsDQpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsDQoNClJl
dmlld2VkLWJ5OiBQaGlsaXBwZSBDb3JudSA8cGhpbGlwcGUuY29ybnVAc3QuY29tPg0KDQpQaGls
aXBwZSA6LSkNCg0KT24gMS8yMS8yMCAxMToyMiBBTSwgWWFubmljayBGZXJ0cmUgd3JvdGU6DQo+
IEZyb206IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAc3QuY29tPg0KPiANCj4g
Q2hhbmdlIHN0bTMyLWNlYyBkcml2ZXIgdG8gbm90IHByaW50IGFuIGVycm9yIG1lc3NhZ2Ugd2hl
biB0aGUNCj4gZGV2aWNlIHByb2JlIG9wZXJhdGlvbiBpcyBkZWZlcnJlZC4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAc3QuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jIHwgNCArKyst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItY2VjLmMg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jDQo+IGluZGV4IDhhODZi
MmMuLjljMTM3ZjEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIv
c3RtMzItY2VjLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1j
ZWMuYw0KPiBAQCAtMjkxLDcgKzI5MSw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfY2VjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgDQo+ICAgCWNlYy0+Y2xrX2NlYyA9IGRl
dm1fY2xrX2dldCgmcGRldi0+ZGV2LCAiY2VjIik7DQo+ICAgCWlmIChJU19FUlIoY2VjLT5jbGtf
Y2VjKSkgew0KPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJDYW5ub3QgZ2V0IGNlYyBjbG9ja1xu
Iik7DQo+ICsJCWlmIChQVFJfRVJSKGNlYy0+Y2xrX2NlYykgIT0gLUVQUk9CRV9ERUZFUikNCj4g
KwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkNhbm5vdCBnZXQgY2VjIGNsb2NrXG4iKTsNCj4gKw0K
PiAgIAkJcmV0dXJuIFBUUl9FUlIoY2VjLT5jbGtfY2VjKTsNCj4gICAJfQ0KPiAgIA0KPiA=
