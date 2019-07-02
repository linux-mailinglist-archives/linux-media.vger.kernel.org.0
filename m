Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACAB5D3DA
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 18:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbfGBQF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 12:05:59 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:33844 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbfGBQF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 12:05:58 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62Fuw61030898;
        Tue, 2 Jul 2019 18:05:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Gv8n01/kBVlf7RCnuKc035bJ+prAX5fBSZIeFogqO0Y=;
 b=UeeVHpsqzhJo5dalvREnkx+f0cyhh0XxSmE2hOzqEjj4vPQNpzN44dR+e4KVZCbGjOVm
 SrEskEH2JWxa+ffN125ztSBQxmZLvB1Tj0qPUiVxZkw+y9hUQiaQSNh9xsAEWo9m56OT
 GjVNqldPm2YNGVvQNfYA/llh+oMHO0Muaee+xpY6hGYrOjLjQlvIhGrC5CvDg/IzFjRt
 lzuzRb5NePrlHmxAE9FZg52ZLOqyOR9SzhRu+wLceg5T0boQrTqvji+LX79fso71ow/5
 0ujfX0V+TYNjYleiTpjQJ4eKMk3Y775Fb87pgICos0qV7B2eK23//w610BnWjjl99Wzn tQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tdxvhw44j-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 18:05:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64EBA34;
        Tue,  2 Jul 2019 16:05:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 104C44DDA;
        Tue,  2 Jul 2019 16:05:47 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE3.st.com
 (10.75.127.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 18:05:46 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 18:05:46 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Jacopo Mondi <jacopo@jmondi.org>
CC:     Steve Longerbeam <slongerbeam@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Thread-Topic: [PATCH v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
Thread-Index: AQHVLQJlOjCpwYSvfEindPL7LJBZs6a3ZHgA
Date:   Tue, 2 Jul 2019 16:05:46 +0000
Message-ID: <5b43d59c-92d0-7234-71aa-b283e7462a84@st.com>
References: <1561640224-24062-1-git-send-email-hugues.fruchet@st.com>
 <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
In-Reply-To: <20190627160518.ylc2xfvqdw5w77xc@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C21B5DD38A0804489BBFFBC360264F22@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiA2LzI3LzE5IDY6MDUgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
SGkgSHVndWVzLA0KPiANCj4gT24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6NTc6MDRQTSArMDIw
MCwgSHVndWVzIEZydWNoZXQgd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBvZiBWNEwyX0NJRF9MSU5L
X0ZSRVEsIHRoaXMgaXMgbmVlZGVkDQo+PiBieSBzb21lIENTSS0yIHJlY2VpdmVycy4NCj4+DQo+
PiAzODRNSHogaXMgZXhwb3NlZCBmb3IgdGhlIHRpbWUgYmVpbmcsIGNvcnJlc3BvbmRpbmcNCj4+
IHRvIDk2TUh6IHBpeGVsIGNsb2NrIHdpdGggMiBieXRlcyBwZXIgcGl4ZWwgb24gMiBkYXRhIGxh
bmVzLg0KPj4NCj4+IFRoaXMgc2V0dXAgaGFzIGJlZW4gdGVzdGVkIHN1Y2Nlc3NmdWxseSB3aXRo
IFNUIE1JUElEMDINCj4+IENTSS0yIHRvIHBhcmFsbGVsIGJyaWRnZS4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAc3QuY29tPg0KPj4gLS0tDQo+
IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IFRoZSBkcml2ZXIgY2FsY3VsYXRlcyB0
aGUgc2Vuc29yIGNvbmZpZ3VyYXRpb24gYmFzZWQgb24gaXRzIGNvbmZpZ3VyYXRpb24sDQo+IGFu
ZCB0aGlzIG5lZWRzIHRvIGJlIHJlZmxlY3RlZCBpbiB0aGUgbGluayBmcmVxdWVuY3k6IGl0J3Mg
bm90IGEgc3RhdGljDQo+IHZhbHVlLiBTZWUgZS5nLiBvdjU2NDBfY2FsY19zeXNfY2xrKCkuDQo+
IA0KDQpJIGtub3cgdGhpcyBjb2RlLCBidXQgZm9yIGEgcmVhc29uIEkgZG9uJ3QgdW5kZXJzdGFu
ZCB5ZXQsIHRoaXMgc2VlbXMNCnRvIG5vdCBoYXZlIGVmZmVjdHMgb24gdGhlIENTSS0yIGxpbmsg
ZnJlcXVlbmN5Lg0KDQpUaGlzIGhhcyBiZWVuIHZlcmlmaWVkIHdpdGggTUlQSUQwMiBDU0ktMiBi
cmlkZ2Ugd2hpY2ggb25seSB3b3JrIHdpdGgNCnRoaXMgZml4ZWQgbGluayBmcmVxdWVuY3kgYXMg
aW5wdXQgdG8gcHJvZ3JhbSBpdHMgdWlfeDQgcmVnaXN0ZXIgDQpzZXR0aW5nLCBzZWUgDQpodHRw
czovL3d3dy5tYWlsLWFyY2hpdmUuY29tL2xpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcvbXNn
MjAyODE3MS5odG1sLg0KQWxsIHJlc29sdXRpb25zIGFuZCBhbGwgZnJhbWVyYXRlIGhhdmUgYmVl
biB0ZXN0ZWQgc3VjY2VzZnVsbHkgd2l0aCB0aGlzIA0Kc2V0dGluZy4NCg0KSW5pdGlhbGx5IEkg
dHJpZWQgdG8gc2V0IHRoZSBsaW5rIGZyZXF1ZW5jeSBhY2NvcmRpbmcgdG8gdGhlIHZhbHVlIA0K
Y29tcHV0ZWQgaW4gb3Y1NjQwX2NhbGNfc3lzX2NsaygpIGJ1dCBpdCB3YXMgb25seSBmdW5jdGlv
bmFsIHdoZW4gDQpyZXNvbHV0aW9ucy9mcmFtZXJhdGUgd2FzIGNsb3NlIHRvIHRoZSAzODRNSHog
dmFsdWUuLi4NCg0KQXMgT1Y1NjQwIEQzIGVuZ2luZWVyaW5nIGJvYXJkIGhhcyBiZWVuIGluaXRp
YWxseSBkZXZlbG9wcGVkIGZvciANCmRyYWdvbmJvYXJkLCBJJ2xsIGRpZyBpbnRvIHRoaXMgYW5k
IGZvdW5kIHRoaXMgY29tbWl0Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Bh
dGNoLzg4Njc5NC8NCndoaWNoIHNldCBhIGZpeGVkIHBpeGVsIHJhdGUgdmFsdWUgdG8gOTZNSHos
IHdoaWNoIG1hdGNoIHBlcmZlY3RseQ0Kd2l0aCB0aGUgMzg0TUh6IHZhbHVlIEkgZm91bmQgZm9y
IGxpbmsgZnJlcXVlbmN5Li4uDQoNClBlcmhhcHMgb3RoZXIgQ1NJLTIgT1Y1NjQwIHVzZXJzIGNh
biBjb21tZW50IGFib3V0IGl0IGFuZCBoYXZlIHRoZSANCmV4cGxhbmF0aW9ucyBvZiB3aGF0IEkg
ZXhwZXJpbWVudC4uLg0KTWF4aW1lLCBKYWNvcG8sIGRvIHlvdSBoYXZlIGFueSBpZGVhIGFib3V0
IGl0ID8NCg0KDQo+PiB2ZXJzaW9uIDI6DQo+PiAgICAtIGRvIG5vdCBzZXQgY29udHJvbCByZWFk
IG9ubHkgYXMgcGVyIEhhbnMnIGNvbW1lbnQ6DQo+PiAgICAgIFNlZSBodHRwczovL3d3dy5tYWls
LWFyY2hpdmUuY29tL2xpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZy9tc2cxNDc5MTAuaHRtbA0K
Pj4NCj4+ICAgZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxMCArKysrKysrKysrDQo+PiAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+
IGluZGV4IDgyZDRjZTkuLmU2MzA3ZjMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+IEBAIC0y
MTgsNiArMjE4LDcgQEAgc3RydWN0IG92NTY0MF9jdHJscyB7DQo+PiAgIAlzdHJ1Y3QgdjRsMl9j
dHJsICp0ZXN0X3BhdHRlcm47DQo+PiAgIAlzdHJ1Y3QgdjRsMl9jdHJsICpoZmxpcDsNCj4+ICAg
CXN0cnVjdCB2NGwyX2N0cmwgKnZmbGlwOw0KPj4gKwlzdHJ1Y3QgdjRsMl9jdHJsICpsaW5rX2Zy
ZXE7DQo+PiAgIH07DQo+PiAgIA0KPj4gICBzdHJ1Y3Qgb3Y1NjQwX2RldiB7DQo+PiBAQCAtMjE5
OCw2ICsyMTk5LDEwIEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3RyeV9mbXRfaW50ZXJuYWwoc3RydWN0
IHY0bDJfc3ViZGV2ICpzZCwNCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0
YXRpYyBjb25zdCBzNjQgbGlua19mcmVxX21lbnVfaXRlbXNbXSA9IHsNCj4+ICsJMzg0MDAwMDAw
LA0KPj4gK307DQo+PiArDQo+PiAgIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9mbXQoc3RydWN0IHY0
bDJfc3ViZGV2ICpzZCwNCj4+ICAgCQkJICBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX2NvbmZpZyAq
Y2ZnLA0KPj4gICAJCQkgIHN0cnVjdCB2NGwyX3N1YmRldl9mb3JtYXQgKmZvcm1hdCkNCj4+IEBA
IC0yNjM2LDYgKzI2NDEsOCBAQCBzdGF0aWMgaW50IG92NTY0MF9zX2N0cmwoc3RydWN0IHY0bDJf
Y3RybCAqY3RybCkNCj4+ICAgCWNhc2UgVjRMMl9DSURfVkZMSVA6DQo+PiAgIAkJcmV0ID0gb3Y1
NjQwX3NldF9jdHJsX3ZmbGlwKHNlbnNvciwgY3RybC0+dmFsKTsNCj4+ICAgCQlicmVhazsNCj4+
ICsJY2FzZSBWNEwyX0NJRF9MSU5LX0ZSRVE6DQo+PiArCQlyZXR1cm4gMDsNCj4+ICAgCWRlZmF1
bHQ6DQo+PiAgIAkJcmV0ID0gLUVJTlZBTDsNCj4+ICAgCQlicmVhazsNCj4+IEBAIC0yNzAzLDYg
KzI3MTAsOSBAQCBzdGF0aWMgaW50IG92NTY0MF9pbml0X2NvbnRyb2xzKHN0cnVjdCBvdjU2NDBf
ZGV2ICpzZW5zb3IpDQo+PiAgIAkJCQkgICAgICAgVjRMMl9DSURfUE9XRVJfTElORV9GUkVRVUVO
Q1lfQVVUTywgMCwNCj4+ICAgCQkJCSAgICAgICBWNEwyX0NJRF9QT1dFUl9MSU5FX0ZSRVFVRU5D
WV81MEhaKTsNCj4+ICAgDQo+PiArCWN0cmxzLT5saW5rX2ZyZXEgPSB2NGwyX2N0cmxfbmV3X2lu
dF9tZW51KGhkbCwgb3BzLCBWNEwyX0NJRF9MSU5LX0ZSRVEsDQo+PiArCQkJCQkJICAwLCAwLCBs
aW5rX2ZyZXFfbWVudV9pdGVtcyk7DQo+PiArDQo+PiAgIAlpZiAoaGRsLT5lcnJvcikgew0KPj4g
ICAJCXJldCA9IGhkbC0+ZXJyb3I7DQo+PiAgIAkJZ290byBmcmVlX2N0cmxzOw0KPj4gLS0gDQo+
PiAyLjcuNA0KPj4NCj4gDQoNCkJSLA0KSHVndWVzLg==
