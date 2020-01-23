Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34724146502
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2020 10:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbgAWJxF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jan 2020 04:53:05 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:18370 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbgAWJxF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jan 2020 04:53:05 -0500
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00N9qYtJ031103;
        Thu, 23 Jan 2020 10:52:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=VkExEA1zSYkkIawwysFPM2UtiIcmbIryXd4T7Fqwhqw=;
 b=MKEoa9U0xc75iuaGbBbbosWCuyYadzLqTILEEEWqRcR75ATLSLHrcIPj9jX3T8S+7Caw
 JmAGtOoXoO4X2wuLUhigGLBBJ5Zf+stX01D6TTxpNSJV8s2zvRkewk40do/n7n/JyFB5
 qHsa85WpdQlKxGfbNjNiwBGOlzhqXj6Db3pU5sVeToX7K5FVmupCmp8TMGncU97steV3
 3DixSsYcnRpM66nh6SWwaSojdJ+iYU364qANn0FVN3ZGPa5RGj1Rp6md+3Xp2gHKM34Q
 ktOkVFEL0iLiZKL6pg4okiLsZ2Vjb437LIkpw2FX7cnIsx46QlfLFUJWYlt48SQQgq3e 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkrp2hep3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 23 Jan 2020 10:52:56 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93FF310002A;
        Thu, 23 Jan 2020 10:52:51 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 83128220301;
        Thu, 23 Jan 2020 10:52:51 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jan
 2020 10:52:50 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 23 Jan 2020 10:52:50 +0100
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
Subject: Re: [PATCH] media: platform: stm32: defer probe for auxiliary clock
Thread-Topic: [PATCH] media: platform: stm32: defer probe for auxiliary clock
Thread-Index: AQHV0ESzDelCfuJRrECy+dIwI+lKx6f39HIA
Date:   Thu, 23 Jan 2020 09:52:50 +0000
Message-ID: <e7573c97-7c88-bb3d-1bfb-dea92f146da9@st.com>
References: <1579602152-7432-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1579602152-7432-1-git-send-email-yannick.fertre@st.com>
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
Content-ID: <034509C68120DF4483F7B9EB6FAA225C@st.com>
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
Q2hhbmdlIHN0bTMyLWNlYyBkcml2ZXIgdG8gZGVmZXIgcHJvYmUgd2hlbiBhdXhpbGlhcnkgY2xv
Y2sNCj4gImhkbWktY2VjIiBpcyByZWdpc3RlcmVkIGluIHRoZSBzeXN0ZW0gbm90IGhhcyBub3Qg
YmVlbiBwcm9iZWQgeWV0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRXRpZW5uZSBDYXJyaWVyZSA8
ZXRpZW5uZS5jYXJyaWVyZUBzdC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vc3RtMzIvc3RtMzItY2VjLmMgfCA2ICsrKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9z
dG0zMi9zdG0zMi1jZWMuYw0KPiBpbmRleCA4YTg2YjJjLi41NDNjOWVjIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWNlYy5jDQo+ICsrKyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItY2VjLmMNCj4gQEAgLTMwMiwxMCArMzAyLDE0
IEBAIHN0YXRpYyBpbnQgc3RtMzJfY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgCX0NCj4gICANCj4gICAJY2VjLT5jbGtfaGRtaV9jZWMgPSBkZXZtX2Nsa19nZXQo
JnBkZXYtPmRldiwgImhkbWktY2VjIik7DQo+ICsJaWYgKElTX0VSUihjZWMtPmNsa19oZG1pX2Nl
YykgJiYNCj4gKwkgICAgUFRSX0VSUihjZWMtPmNsa19oZG1pX2NlYykgPT0gLUVQUk9CRV9ERUZF
UikNCj4gKwkJCXJldHVybiAtRVBST0JFX0RFRkVSOw0KPiArDQo+ICAgCWlmICghSVNfRVJSKGNl
Yy0+Y2xrX2hkbWlfY2VjKSkgew0KPiAgIAkJcmV0ID0gY2xrX3ByZXBhcmUoY2VjLT5jbGtfaGRt
aV9jZWMpOw0KPiAgIAkJaWYgKHJldCkgew0KPiAtCQkJZGV2X2VycigmcGRldi0+ZGV2LCAiVW5h
YmxlIHRvIHByZXBhcmUgaGRtaS1jZWMgY2xvY2tcbiIpOw0KPiArCQkJZGV2X2VycigmcGRldi0+
ZGV2LCAiQ2FuJ3QgcHJlcGFyZSBoZG1pLWNlYyBjbG9ja1xuIik7DQo+ICAgCQkJcmV0dXJuIHJl
dDsNCj4gICAJCX0NCj4gICAJfQ0KPiA=
