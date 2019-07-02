Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DB55D294
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfGBPTN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:19:13 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:7028 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725981AbfGBPTN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:19:13 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62F6vS2023247;
        Tue, 2 Jul 2019 17:18:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=8w4SjA0DZ2W6T+fEVlEuWHyyvofsc45yKJFB1OGSjDQ=;
 b=iLktCy/Dzxwr4cRz36vk2PioowINaJYSxeZjAV9A5xG3R/Ulptoz/0VVp3M7ZGWRI17l
 Gc5aHG6ThwH2jEJz6SSQVBX/kw/+ObzqZyWNXCpsqSWnuZen7cUKq2/na+3ik++EiHE5
 5yhm4seRB8EiRIXKI6SxM3fjNGkhDLl74w0VPY6lLIm1a8vweaI2eTBkbI/6wSQm0HrI
 4bJIASNWzEX9VEw7dS8qR9BJ5p30keCo4WBLkC5echYavI4TwUrCFHxZEoSHsDJr/jsU
 5UokVxoiQQfwQdIVjUxcL+K42DfO3rbwLSZnU4yNIyZQHHRkMcs1aRCmgPDfoHDM3iH+ Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2tdwruvvk8-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:18:57 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0D9434;
        Tue,  2 Jul 2019 15:18:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87F232B39;
        Tue,  2 Jul 2019 15:18:55 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 2 Jul
 2019 17:18:55 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 17:18:55 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Sakari Ailus" <sakari.ailus@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Yannick FERTRE <yannick.fertre@st.com>,
        Philippe CORNU <philippe.cornu@st.com>,
        Mickael GUENE <mickael.guene@st.com>
Subject: Re: [PATCH v2 2/3] media: stm32-dcmi: add media controller support
Thread-Topic: [PATCH v2 2/3] media: stm32-dcmi: add media controller support
Thread-Index: AQHVJ1/zX3VDRyykMUmSGPlvZRClvaa3YqQA
Date:   Tue, 2 Jul 2019 15:18:55 +0000
Message-ID: <d4d43765-227a-733e-f772-efa4edf89518@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-3-git-send-email-hugues.fruchet@st.com>
 <0ad39c36-5636-b2a6-8098-a1b38e7f907d@xs4all.nl>
In-Reply-To: <0ad39c36-5636-b2a6-8098-a1b38e7f907d@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C73814F2F518F488F70CD1625D9E91D@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywNCg0KT24gNi8yMC8xOSAyOjAxIFBNLCBIYW5zIFZlcmt1aWwgd3JvdGU6DQo+IE9u
IDYvMTEvMTkgMTA6NDggQU0sIEh1Z3VlcyBGcnVjaGV0IHdyb3RlOg0KPj4gQWRkIG1lZGlhIGNv
bnRyb2xsZXIgc3VwcG9ydCB0byBkY21pLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3VlcyBG
cnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBzdC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9LY29uZmlnICAgICAgICAgICAgfCAgMiArLQ0KPj4gICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYyB8IDgzICsrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspLCAyMiBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29u
ZmlnIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnDQo+PiBpbmRleCA4YTE5NjU0Li5k
ZTdlMjFmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9LY29uZmlnDQo+
PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcNCj4+IEBAIC0xMjEsNyArMTIx
LDcgQEAgY29uZmlnIFZJREVPX1MzQ19DQU1JRg0KPj4gICANCj4+ICAgY29uZmlnIFZJREVPX1NU
TTMyX0RDTUkNCj4+ICAgCXRyaXN0YXRlICJTVE0zMiBEaWdpdGFsIENhbWVyYSBNZW1vcnkgSW50
ZXJmYWNlIChEQ01JKSBzdXBwb3J0Ig0KPj4gLQlkZXBlbmRzIG9uIFZJREVPX1Y0TDIgJiYgT0YN
Cj4+ICsJZGVwZW5kcyBvbiBWSURFT19WNEwyICYmIE9GICYmIE1FRElBX0NPTlRST0xMRVINCj4+
ICAgCWRlcGVuZHMgb24gQVJDSF9TVE0zMiB8fCBDT01QSUxFX1RFU1QNCj4+ICAgCXNlbGVjdCBW
SURFT0JVRjJfRE1BX0NPTlRJRw0KPj4gICAJc2VsZWN0IFY0TDJfRldOT0RFDQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMgYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gaW5kZXggN2E0ZDU1OS4uM2E2
OTc4MyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIvc3RtMzIt
ZGNtaS5jDQo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWku
Yw0KPj4gQEAgLTE3MCw2ICsxNzAsOSBAQCBzdHJ1Y3Qgc3RtMzJfZGNtaSB7DQo+PiAgIA0KPj4g
ICAJLyogRW5zdXJlIERNQSBvcGVyYXRpb25zIGF0b21pY2l0eSAqLw0KPj4gICAJc3RydWN0IG11
dGV4CQkJZG1hX2xvY2s7DQo+PiArDQo+PiArCXN0cnVjdCBtZWRpYV9kZXZpY2UJCW1kZXY7DQo+
PiArCXN0cnVjdCBtZWRpYV9wYWQJCXZpZF9jYXBfcGFkOw0KPj4gICB9Ow0KPj4gICANCj4+ICAg
c3RhdGljIGlubGluZSBzdHJ1Y3Qgc3RtMzJfZGNtaSAqbm90aWZpZXJfdG9fZGNtaShzdHJ1Y3Qg
djRsMl9hc3luY19ub3RpZmllciAqbikNCj4+IEBAIC0xNTQ1LDIxICsxNTQ4LDEyIEBAIHN0YXRp
YyBpbnQgZGNtaV9ncmFwaF9ub3RpZnlfY29tcGxldGUoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZp
ZXIgKm5vdGlmaWVyKQ0KPj4gICAJCWRldl9lcnIoZGNtaS0+ZGV2LCAiQ291bGQgbm90IGdldCBz
ZW5zb3IgYm91bmRzXG4iKTsNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4gICAJfQ0KPj4gLQ0KPj4g
ICAJcmV0ID0gZGNtaV9zZXRfZGVmYXVsdF9mbXQoZGNtaSk7DQo+PiAgIAlpZiAocmV0KSB7DQo+
PiAgIAkJZGV2X2VycihkY21pLT5kZXYsICJDb3VsZCBub3Qgc2V0IGRlZmF1bHQgZm9ybWF0XG4i
KTsNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4gICAJfQ0KPj4gICANCj4+IC0JcmV0ID0gdmlkZW9f
cmVnaXN0ZXJfZGV2aWNlKGRjbWktPnZkZXYsIFZGTF9UWVBFX0dSQUJCRVIsIC0xKTsNCj4+IC0J
aWYgKHJldCkgew0KPj4gLQkJZGV2X2VycihkY21pLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIg
dmlkZW8gZGV2aWNlXG4iKTsNCj4+IC0JCXJldHVybiByZXQ7DQo+PiAtCX0NCj4gDQo+IFdoeSB3
YXMgdGhpcyBtb3ZlZCB0byBwcm9iZSgpPyBPZmYtaGFuZCBJIHNlZSBubyByZWFzb24gZm9yIHRo
YXQuDQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gCUhhbnMNCj4gDQoNCkkgbmVlZCB0byBkbyB0aGF0
IG90aGVyd2lzZSB0aGUgZGNtaV9ncmFwaF9ub3RpZnlfYm91bmQoKSBzdWJkZXZpY2UgcGFkIA0K
bGluayBjb2RlIGNyYXNoZXM6DQogICsJLyoNCiAgKwkgKiBMaW5rIHRoaXMgc3ViLWRldmljZSB0
byBEQ01JLCBpdCBjb3VsZCBiZQ0KICArCSAqIGEgcGFyYWxsZWwgY2FtZXJhIHNlbnNvciBvciBh
IGJyaWRnZQ0KICArCSAqLw0KICArCXNyY19wYWQgPSBtZWRpYV9lbnRpdHlfZ2V0X2Z3bm9kZV9w
YWQoJnN1YmRldi0+ZW50aXR5LA0KICArCQkJCQkgICAgICBzdWJkZXYtPmZ3bm9kZSwNCiAgKwkJ
CQkJICAgICAgTUVESUFfUEFEX0ZMX1NPVVJDRSk7DQogICsNCiAgKwlyZXQgPSBtZWRpYV9jcmVh
dGVfcGFkX2xpbmsoJnN1YmRldi0+ZW50aXR5LCBzcmNfcGFkLA0KICArCQkJCSAgICAmZGNtaS0+
dmRldi0+ZW50aXR5LCAwLA0KICArCQkJCSAgICBNRURJQV9MTktfRkxfSU1NVVRBQkxFIHwNCiAg
KwkJCQkgICAgTUVESUFfTE5LX0ZMX0VOQUJMRUQpOw0Kc2VlIGh0dHBzOi8vd3d3LnNwaW5pY3Mu
bmV0L2xpc3RzL2xpbnV4LW1lZGlhL21zZzE1MzEyMC5odG1sLg0KDQoNCj4+IC0NCj4+IC0JZGV2
X2RiZyhkY21pLT5kZXYsICJEZXZpY2UgcmVnaXN0ZXJlZCBhcyAlc1xuIiwNCj4+IC0JCXZpZGVv
X2RldmljZV9ub2RlX25hbWUoZGNtaS0+dmRldikpOw0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIH0N
Cj4+ICAgDQo+PiBAQCAtMTY0OCw2ICsxNjQyLDEyIEBAIHN0YXRpYyBpbnQgZGNtaV9ncmFwaF9p
bml0KHN0cnVjdCBzdG0zMl9kY21pICpkY21pKQ0KPj4gICAJcmV0dXJuIDA7DQo+PiAgIH0NCj4+
ICAgDQo+PiArc3RhdGljIHZvaWQgZGNtaV9ncmFwaF9kZWluaXQoc3RydWN0IHN0bTMyX2RjbWkg
KmRjbWkpDQo+PiArew0KPj4gKwl2NGwyX2FzeW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJmRjbWkt
Pm5vdGlmaWVyKTsNCj4+ICsJdjRsMl9hc3luY19ub3RpZmllcl9jbGVhbnVwKCZkY21pLT5ub3Rp
Zmllcik7DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgaW50IGRjbWlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgew0KPj4gICAJc3RydWN0IGRldmljZV9ub2RlICpu
cCA9IHBkZXYtPmRldi5vZl9ub2RlOw0KPj4gQEAgLTE3NTIsMTAgKzE3NTIsMjcgQEAgc3RhdGlj
IGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIA0KPj4g
ICAJcSA9ICZkY21pLT5xdWV1ZTsNCj4+ICAgDQo+PiArCWRjbWktPnY0bDJfZGV2Lm1kZXYgPSAm
ZGNtaS0+bWRldjsNCj4+ICsNCj4+ICsJLyogSW5pdGlhbGl6ZSBtZWRpYSBkZXZpY2UgKi8NCj4+
ICsJc3Ryc2NweShkY21pLT5tZGV2Lm1vZGVsLCBEUlZfTkFNRSwgc2l6ZW9mKGRjbWktPm1kZXYu
bW9kZWwpKTsNCj4+ICsJc25wcmludGYoZGNtaS0+bWRldi5idXNfaW5mbywgc2l6ZW9mKGRjbWkt
Pm1kZXYuYnVzX2luZm8pLA0KPj4gKwkJICJwbGF0Zm9ybTolcyIsIERSVl9OQU1FKTsNCj4+ICsJ
ZGNtaS0+bWRldi5kZXYgPSAmcGRldi0+ZGV2Ow0KPj4gKwltZWRpYV9kZXZpY2VfaW5pdCgmZGNt
aS0+bWRldik7DQo+PiArDQo+PiArCS8qIFJlZ2lzdGVyIHRoZSBtZWRpYSBkZXZpY2UgKi8NCj4+
ICsJcmV0ID0gbWVkaWFfZGV2aWNlX3JlZ2lzdGVyKCZkY21pLT5tZGV2KTsNCj4+ICsJaWYgKHJl
dCkgew0KPj4gKwkJZGV2X2VycihkY21pLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgbWVkaWEg
ZGV2aWNlICglZClcbiIsDQo+PiArCQkJcmV0KTsNCj4+ICsJCWdvdG8gZXJyX21lZGlhX2Rldmlj
ZV9jbGVhbnVwOw0KPj4gKwl9DQo+PiArDQo+PiAgIAkvKiBJbml0aWFsaXplIHRoZSB0b3AtbGV2
ZWwgc3RydWN0dXJlICovDQo+PiAgIAlyZXQgPSB2NGwyX2RldmljZV9yZWdpc3RlcigmcGRldi0+
ZGV2LCAmZGNtaS0+djRsMl9kZXYpOw0KPj4gICAJaWYgKHJldCkNCj4+IC0JCWdvdG8gZXJyX2Rt
YV9yZWxlYXNlOw0KPj4gKwkJZ290byBlcnJfbWVkaWFfZGV2aWNlX3VucmVnaXN0ZXI7DQo+PiAg
IA0KPj4gICAJZGNtaS0+dmRldiA9IHZpZGVvX2RldmljZV9hbGxvYygpOw0KPj4gICAJaWYgKCFk
Y21pLT52ZGV2KSB7DQo+PiBAQCAtMTc3NSw2ICsxNzkyLDI1IEBAIHN0YXRpYyBpbnQgZGNtaV9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJCQkJICBWNEwyX0NBUF9S
RUFEV1JJVEU7DQo+PiAgIAl2aWRlb19zZXRfZHJ2ZGF0YShkY21pLT52ZGV2LCBkY21pKTsNCj4+
ICAgDQo+PiArCS8qIE1lZGlhIGVudGl0eSBwYWRzICovDQo+PiArCWRjbWktPnZpZF9jYXBfcGFk
LmZsYWdzID0gTUVESUFfUEFEX0ZMX1NJTks7DQo+PiArCXJldCA9IG1lZGlhX2VudGl0eV9wYWRz
X2luaXQoJmRjbWktPnZkZXYtPmVudGl0eSwNCj4+ICsJCQkJICAgICAxLCAmZGNtaS0+dmlkX2Nh
cF9wYWQpOw0KPj4gKwlpZiAocmV0KSB7DQo+PiArCQlkZXZfZXJyKGRjbWktPmRldiwgIkZhaWxl
ZCB0byBpbml0IG1lZGlhIGVudGl0eSBwYWRcbiIpOw0KPj4gKwkJZ290byBlcnJfZGV2aWNlX3Vu
cmVnaXN0ZXI7DQo+PiArCX0NCj4+ICsJZGNtaS0+dmRldi0+ZW50aXR5LmZsYWdzIHw9IE1FRElB
X0VOVF9GTF9ERUZBVUxUOw0KPj4gKw0KPj4gKwlyZXQgPSB2aWRlb19yZWdpc3Rlcl9kZXZpY2Uo
ZGNtaS0+dmRldiwgVkZMX1RZUEVfR1JBQkJFUiwgLTEpOw0KPj4gKwlpZiAocmV0KSB7DQo+PiAr
CQlkZXZfZXJyKGRjbWktPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciB2aWRlbyBkZXZpY2VcbiIp
Ow0KPj4gKwkJZ290byBlcnJfbWVkaWFfZW50aXR5X2NsZWFudXA7DQo+PiArCX0NCj4+ICsNCj4+
ICsJZGV2X2RiZyhkY21pLT5kZXYsICJEZXZpY2UgcmVnaXN0ZXJlZCBhcyAlc1xuIiwNCj4+ICsJ
CXZpZGVvX2RldmljZV9ub2RlX25hbWUoZGNtaS0+dmRldikpOw0KPj4gKw0KPj4gICAJLyogQnVm
ZmVyIHF1ZXVlICovDQo+PiAgIAlxLT50eXBlID0gVjRMMl9CVUZfVFlQRV9WSURFT19DQVBUVVJF
Ow0KPj4gICAJcS0+aW9fbW9kZXMgPSBWQjJfTU1BUCB8IFZCMl9SRUFEIHwgVkIyX0RNQUJVRjsN
Cj4+IEBAIC0xNzkwLDE4ICsxODI2LDE4IEBAIHN0YXRpYyBpbnQgZGNtaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJcmV0ID0gdmIyX3F1ZXVlX2luaXQocSk7DQo+
PiAgIAlpZiAocmV0IDwgMCkgew0KPj4gICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0
byBpbml0aWFsaXplIHZiMiBxdWV1ZVxuIik7DQo+PiAtCQlnb3RvIGVycl9kZXZpY2VfcmVsZWFz
ZTsNCj4+ICsJCWdvdG8gZXJyX21lZGlhX2VudGl0eV9jbGVhbnVwOw0KPj4gICAJfQ0KPj4gICAN
Cj4+ICAgCXJldCA9IGRjbWlfZ3JhcGhfaW5pdChkY21pKTsNCj4+ICAgCWlmIChyZXQgPCAwKQ0K
Pj4gLQkJZ290byBlcnJfZGV2aWNlX3JlbGVhc2U7DQo+PiArCQlnb3RvIGVycl9tZWRpYV9lbnRp
dHlfY2xlYW51cDsNCj4+ICAgDQo+PiAgIAkvKiBSZXNldCBkZXZpY2UgKi8NCj4+ICAgCXJldCA9
IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGRjbWktPnJzdGMpOw0KPj4gICAJaWYgKHJldCkgew0KPj4g
ICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byBhc3NlcnQgdGhlIHJlc2V0IGxpbmVc
biIpOw0KPj4gLQkJZ290byBlcnJfY2xlYW51cDsNCj4+ICsJCWdvdG8gZXJyX2dyYXBoX2RlaW5p
dDsNCj4+ICAgCX0NCj4+ICAgDQo+PiAgIAl1c2xlZXBfcmFuZ2UoMzAwMCwgNTAwMCk7DQo+PiBA
QCAtMTgwOSw3ICsxODQ1LDcgQEAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+PiAgIAlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KGRjbWkt
PnJzdGMpOw0KPj4gICAJaWYgKHJldCkgew0KPj4gICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZh
aWxlZCB0byBkZWFzc2VydCB0aGUgcmVzZXQgbGluZVxuIik7DQo+PiAtCQlnb3RvIGVycl9jbGVh
bnVwOw0KPj4gKwkJZ290byBlcnJfZ3JhcGhfZGVpbml0Ow0KPj4gICAJfQ0KPj4gICANCj4+ICAg
CWRldl9pbmZvKCZwZGV2LT5kZXYsICJQcm9iZSBkb25lXG4iKTsNCj4+IEBAIC0xODIwLDEzICsx
ODU2LDE2IEBAIHN0YXRpYyBpbnQgZGNtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4gICANCj4+IC1lcnJfY2xlYW51cDoNCj4+
IC0JdjRsMl9hc3luY19ub3RpZmllcl9jbGVhbnVwKCZkY21pLT5ub3RpZmllcik7DQo+PiAtZXJy
X2RldmljZV9yZWxlYXNlOg0KPj4gLQl2aWRlb19kZXZpY2VfcmVsZWFzZShkY21pLT52ZGV2KTsN
Cj4+ICtlcnJfZ3JhcGhfZGVpbml0Og0KPj4gKwlkY21pX2dyYXBoX2RlaW5pdChkY21pKTsNCj4+
ICtlcnJfbWVkaWFfZW50aXR5X2NsZWFudXA6DQo+PiArCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZk
Y21pLT52ZGV2LT5lbnRpdHkpOw0KPj4gICBlcnJfZGV2aWNlX3VucmVnaXN0ZXI6DQo+PiAgIAl2
NGwyX2RldmljZV91bnJlZ2lzdGVyKCZkY21pLT52NGwyX2Rldik7DQo+PiAtZXJyX2RtYV9yZWxl
YXNlOg0KPj4gK2Vycl9tZWRpYV9kZXZpY2VfdW5yZWdpc3RlcjoNCj4+ICsJbWVkaWFfZGV2aWNl
X3VucmVnaXN0ZXIoJmRjbWktPm1kZXYpOw0KPj4gK2Vycl9tZWRpYV9kZXZpY2VfY2xlYW51cDoN
Cj4+ICsJbWVkaWFfZGV2aWNlX2NsZWFudXAoJmRjbWktPm1kZXYpOw0KPj4gICAJZG1hX3JlbGVh
c2VfY2hhbm5lbChkY21pLT5kbWFfY2hhbik7DQo+PiAgIA0KPj4gICAJcmV0dXJuIHJldDsNCj4+
IEBAIC0xODM4LDkgKzE4NzcsMTEgQEAgc3RhdGljIGludCBkY21pX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICANCj4+ICAgCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRl
di0+ZGV2KTsNCj4+ICAgDQo+PiAtCXY0bDJfYXN5bmNfbm90aWZpZXJfdW5yZWdpc3RlcigmZGNt
aS0+bm90aWZpZXIpOw0KPj4gLQl2NGwyX2FzeW5jX25vdGlmaWVyX2NsZWFudXAoJmRjbWktPm5v
dGlmaWVyKTsNCj4+ICsJZGNtaV9ncmFwaF9kZWluaXQoZGNtaSk7DQo+PiArCW1lZGlhX2VudGl0
eV9jbGVhbnVwKCZkY21pLT52ZGV2LT5lbnRpdHkpOw0KPj4gICAJdjRsMl9kZXZpY2VfdW5yZWdp
c3RlcigmZGNtaS0+djRsMl9kZXYpOw0KPj4gKwltZWRpYV9kZXZpY2VfdW5yZWdpc3RlcigmZGNt
aS0+bWRldik7DQo+PiArCW1lZGlhX2RldmljZV9jbGVhbnVwKCZkY21pLT5tZGV2KTsNCj4+ICAg
DQo+PiAgIAlkbWFfcmVsZWFzZV9jaGFubmVsKGRjbWktPmRtYV9jaGFuKTsNCj4+ICAgDQo+Pg0K
PiANCg0KQlIsDQpIdWd1ZXMu
