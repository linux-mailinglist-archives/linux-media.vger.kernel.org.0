Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39DE05D2E7
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfGBPaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:30:09 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:8934 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725835AbfGBPaJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:30:09 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62FRTot004763;
        Tue, 2 Jul 2019 17:29:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vhsVIm+Xi0EYX8Boo/wukzQXiDvby4b9xhmKvwmlzLM=;
 b=oXOtHYzvNLLc4XuWqpUbgVzZie65IcT4ppC1a3Y9opZkhg8ESCgNog68W8Ty4r9ulJoi
 Eg0Ifxps64J6nKrPPZww5F09UJvTidIfph7v4O9DG41SzfE+RGDKmqeC0cD86grv07HV
 c2MKb658Zp776YwSPbmIO4t37ip8emF7D0iixERzBffwJKg3hl1PUJ0FsytD59CqhAEe
 XuWRactPej2xOdhTyDh7I4ZUMNWx+iwU/8aOF2fyOn+KqQ4J1L9V2JBK5eL7Kpc7lmTS
 r2+vbi4B11HHRNWaQN7rl262fv6HJvB5Zr0BWn+Pr+9jIj4VXoD5aAVbKrYh7FsWnFAC zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2tdwruvxcw-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:29:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AF0331;
        Tue,  2 Jul 2019 15:29:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5971E2D45;
        Tue,  2 Jul 2019 15:29:55 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 2 Jul
 2019 17:29:54 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 17:29:54 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Alexandre TORGUE <alexandre.torgue@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
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
Thread-Index: AQHVJ4MSX3VDRyykMUmSGPlvZRClvaa3ZXEA
Date:   Tue, 2 Jul 2019 15:29:54 +0000
Message-ID: <06b699b8-1bfb-5f05-416f-b2fbcc2c832e@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-3-git-send-email-hugues.fruchet@st.com>
 <20190620161318.zfcdp3jb5erwhjo6@kekkonen.localdomain>
In-Reply-To: <20190620161318.zfcdp3jb5erwhjo6@kekkonen.localdomain>
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
Content-ID: <F4D753D7D82C454B9329D210EA7419E4@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiA2LzIwLzE5IDY6MTMgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
SGkgSHVndWVzLA0KPiANCj4gT24gVHVlLCBKdW4gMTEsIDIwMTkgYXQgMTA6NDg6MzFBTSArMDIw
MCwgSHVndWVzIEZydWNoZXQgd3JvdGU6DQo+PiBBZGQgbWVkaWEgY29udHJvbGxlciBzdXBwb3J0
IHRvIGRjbWkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vlcy5m
cnVjaGV0QHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25m
aWcgICAgICAgICAgICB8ICAyICstDQo+PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3RtMzIv
c3RtMzItZGNtaS5jIHwgODMgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPj4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL0tjb25maWcNCj4+IGluZGV4IDhhMTk2NTQuLmRlN2UyMWYgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vS2NvbmZpZw0KPj4gQEAgLTEyMSw3ICsxMjEsNyBAQCBjb25maWcgVklE
RU9fUzNDX0NBTUlGDQo+PiAgIA0KPj4gICBjb25maWcgVklERU9fU1RNMzJfRENNSQ0KPj4gICAJ
dHJpc3RhdGUgIlNUTTMyIERpZ2l0YWwgQ2FtZXJhIE1lbW9yeSBJbnRlcmZhY2UgKERDTUkpIHN1
cHBvcnQiDQo+PiAtCWRlcGVuZHMgb24gVklERU9fVjRMMiAmJiBPRg0KPj4gKwlkZXBlbmRzIG9u
IFZJREVPX1Y0TDIgJiYgT0YgJiYgTUVESUFfQ09OVFJPTExFUg0KPiANCj4gT2ssIGlmIHRoZSBp
bnRlbnQgaXMgdG8gcmVxdWlyZSBNQyBmcm9tIG5vdyBvbiwgdGhlbiBJIHRoaW5rIHlvdSBjb3Vs
ZA0KPiBzaW1wbHkgcmVseSBvbiBtZWRpYV9lbnRpdHlfcmVtb3RlX3BhZCgpIGluIGZpbmRpbmcg
dGhlIGltYWdlIHNvdXJjZS4NCj4gDQo+PiAgIAlkZXBlbmRzIG9uIEFSQ0hfU1RNMzIgfHwgQ09N
UElMRV9URVNUDQo+PiAgIAlzZWxlY3QgVklERU9CVUYyX0RNQV9DT05USUcNCj4+ICAgCXNlbGVj
dCBWNEwyX0ZXTk9ERQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vc3Rt
MzIvc3RtMzItZGNtaS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21p
LmMNCj4+IGluZGV4IDdhNGQ1NTkuLjNhNjk3ODMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21pLmMNCj4+IEBAIC0xNzAsNiArMTcwLDkgQEAgc3RydWN0
IHN0bTMyX2RjbWkgew0KPj4gICANCj4+ICAgCS8qIEVuc3VyZSBETUEgb3BlcmF0aW9ucyBhdG9t
aWNpdHkgKi8NCj4+ICAgCXN0cnVjdCBtdXRleAkJCWRtYV9sb2NrOw0KPj4gKw0KPj4gKwlzdHJ1
Y3QgbWVkaWFfZGV2aWNlCQltZGV2Ow0KPj4gKwlzdHJ1Y3QgbWVkaWFfcGFkCQl2aWRfY2FwX3Bh
ZDsNCj4+ICAgfTsNCj4+ICAgDQo+PiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IHN0bTMyX2RjbWkg
Km5vdGlmaWVyX3RvX2RjbWkoc3RydWN0IHY0bDJfYXN5bmNfbm90aWZpZXIgKm4pDQo+PiBAQCAt
MTU0NSwyMSArMTU0OCwxMiBAQCBzdGF0aWMgaW50IGRjbWlfZ3JhcGhfbm90aWZ5X2NvbXBsZXRl
KHN0cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVyICpub3RpZmllcikNCj4+ICAgCQlkZXZfZXJyKGRj
bWktPmRldiwgIkNvdWxkIG5vdCBnZXQgc2Vuc29yIGJvdW5kc1xuIik7DQo+PiAgIAkJcmV0dXJu
IHJldDsNCj4+ICAgCX0NCj4+IC0NCj4+ICAgCXJldCA9IGRjbWlfc2V0X2RlZmF1bHRfZm10KGRj
bWkpOw0KPj4gICAJaWYgKHJldCkgew0KPj4gICAJCWRldl9lcnIoZGNtaS0+ZGV2LCAiQ291bGQg
bm90IHNldCBkZWZhdWx0IGZvcm1hdFxuIik7DQo+PiAgIAkJcmV0dXJuIHJldDsNCj4+ICAgCX0N
Cj4+ICAgDQo+PiAtCXJldCA9IHZpZGVvX3JlZ2lzdGVyX2RldmljZShkY21pLT52ZGV2LCBWRkxf
VFlQRV9HUkFCQkVSLCAtMSk7DQo+PiAtCWlmIChyZXQpIHsNCj4+IC0JCWRldl9lcnIoZGNtaS0+
ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIHZpZGVvIGRldmljZVxuIik7DQo+PiAtCQlyZXR1cm4g
cmV0Ow0KPj4gLQl9DQo+PiAtDQo+PiAtCWRldl9kYmcoZGNtaS0+ZGV2LCAiRGV2aWNlIHJlZ2lz
dGVyZWQgYXMgJXNcbiIsDQo+PiAtCQl2aWRlb19kZXZpY2Vfbm9kZV9uYW1lKGRjbWktPnZkZXYp
KTsNCj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gQEAgLTE2NDgsNiArMTY0Miwx
MiBAQCBzdGF0aWMgaW50IGRjbWlfZ3JhcGhfaW5pdChzdHJ1Y3Qgc3RtMzJfZGNtaSAqZGNtaSkN
Cj4+ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyB2b2lkIGRjbWlfZ3Jh
cGhfZGVpbml0KHN0cnVjdCBzdG0zMl9kY21pICpkY21pKQ0KPj4gK3sNCj4+ICsJdjRsMl9hc3lu
Y19ub3RpZmllcl91bnJlZ2lzdGVyKCZkY21pLT5ub3RpZmllcik7DQo+PiArCXY0bDJfYXN5bmNf
bm90aWZpZXJfY2xlYW51cCgmZGNtaS0+bm90aWZpZXIpOw0KPiANCj4gSSdkIGp1c3QgbGVhdmUg
dGhlIGNhbGxzIHdoZXJlIHRoZXkgYXJlIG5vdy4gVGhpcyBkb2Vzbid0IGltcHJvdmUNCj4gcmVh
ZGFiaWxpdHkgb2YgdGhlIGNvZGUsIHJhdGhlciB0aGUgb3Bwb3NpdGUuDQo+IA0KDQpmaXhlZCBp
biB2My4NCg0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIGludCBkY21pX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4+IEBAIC0xNzUyLDEwICsxNzUyLDI3IEBAIHN0YXRp
YyBpbnQgZGNtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gICANCj4+
ICAgCXEgPSAmZGNtaS0+cXVldWU7DQo+PiAgIA0KPj4gKwlkY21pLT52NGwyX2Rldi5tZGV2ID0g
JmRjbWktPm1kZXY7DQo+PiArDQo+PiArCS8qIEluaXRpYWxpemUgbWVkaWEgZGV2aWNlICovDQo+
PiArCXN0cnNjcHkoZGNtaS0+bWRldi5tb2RlbCwgRFJWX05BTUUsIHNpemVvZihkY21pLT5tZGV2
Lm1vZGVsKSk7DQo+PiArCXNucHJpbnRmKGRjbWktPm1kZXYuYnVzX2luZm8sIHNpemVvZihkY21p
LT5tZGV2LmJ1c19pbmZvKSwNCj4+ICsJCSAicGxhdGZvcm06JXMiLCBEUlZfTkFNRSk7DQo+PiAr
CWRjbWktPm1kZXYuZGV2ID0gJnBkZXYtPmRldjsNCj4+ICsJbWVkaWFfZGV2aWNlX2luaXQoJmRj
bWktPm1kZXYpOw0KPj4gKw0KPj4gKwkvKiBSZWdpc3RlciB0aGUgbWVkaWEgZGV2aWNlICovDQo+
PiArCXJldCA9IG1lZGlhX2RldmljZV9yZWdpc3RlcigmZGNtaS0+bWRldik7DQo+PiArCWlmIChy
ZXQpIHsNCj4+ICsJCWRldl9lcnIoZGNtaS0+ZGV2LCAiRmFpbGVkIHRvIHJlZ2lzdGVyIG1lZGlh
IGRldmljZSAoJWQpXG4iLA0KPj4gKwkJCXJldCk7DQo+PiArCQlnb3RvIGVycl9tZWRpYV9kZXZp
Y2VfY2xlYW51cDsNCj4+ICsJfQ0KPj4gKw0KPj4gICAJLyogSW5pdGlhbGl6ZSB0aGUgdG9wLWxl
dmVsIHN0cnVjdHVyZSAqLw0KPj4gICAJcmV0ID0gdjRsMl9kZXZpY2VfcmVnaXN0ZXIoJnBkZXYt
PmRldiwgJmRjbWktPnY0bDJfZGV2KTsNCj4+ICAgCWlmIChyZXQpDQo+PiAtCQlnb3RvIGVycl9k
bWFfcmVsZWFzZTsNCj4+ICsJCWdvdG8gZXJyX21lZGlhX2RldmljZV91bnJlZ2lzdGVyOw0KPj4g
ICANCj4+ICAgCWRjbWktPnZkZXYgPSB2aWRlb19kZXZpY2VfYWxsb2MoKTsNCj4+ICAgCWlmICgh
ZGNtaS0+dmRldikgew0KPj4gQEAgLTE3NzUsNiArMTc5MiwyNSBAQCBzdGF0aWMgaW50IGRjbWlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgCQkJCSAgVjRMMl9DQVBf
UkVBRFdSSVRFOw0KPj4gICAJdmlkZW9fc2V0X2RydmRhdGEoZGNtaS0+dmRldiwgZGNtaSk7DQo+
PiAgIA0KPj4gKwkvKiBNZWRpYSBlbnRpdHkgcGFkcyAqLw0KPj4gKwlkY21pLT52aWRfY2FwX3Bh
ZC5mbGFncyA9IE1FRElBX1BBRF9GTF9TSU5LOw0KPj4gKwlyZXQgPSBtZWRpYV9lbnRpdHlfcGFk
c19pbml0KCZkY21pLT52ZGV2LT5lbnRpdHksDQo+PiArCQkJCSAgICAgMSwgJmRjbWktPnZpZF9j
YXBfcGFkKTsNCj4+ICsJaWYgKHJldCkgew0KPj4gKwkJZGV2X2VycihkY21pLT5kZXYsICJGYWls
ZWQgdG8gaW5pdCBtZWRpYSBlbnRpdHkgcGFkXG4iKTsNCj4+ICsJCWdvdG8gZXJyX2RldmljZV91
bnJlZ2lzdGVyOw0KPj4gKwl9DQo+PiArCWRjbWktPnZkZXYtPmVudGl0eS5mbGFncyB8PSBNRURJ
QV9FTlRfRkxfREVGQVVMVDsNCj4+ICsNCj4+ICsJcmV0ID0gdmlkZW9fcmVnaXN0ZXJfZGV2aWNl
KGRjbWktPnZkZXYsIFZGTF9UWVBFX0dSQUJCRVIsIC0xKTsNCj4+ICsJaWYgKHJldCkgew0KPj4g
KwkJZGV2X2VycihkY21pLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIgdmlkZW8gZGV2aWNlXG4i
KTsNCj4+ICsJCWdvdG8gZXJyX21lZGlhX2VudGl0eV9jbGVhbnVwOw0KPj4gKwl9DQo+PiArDQo+
PiArCWRldl9kYmcoZGNtaS0+ZGV2LCAiRGV2aWNlIHJlZ2lzdGVyZWQgYXMgJXNcbiIsDQo+PiAr
CQl2aWRlb19kZXZpY2Vfbm9kZV9uYW1lKGRjbWktPnZkZXYpKTsNCj4+ICsNCj4+ICAgCS8qIEJ1
ZmZlciBxdWV1ZSAqLw0KPj4gICAJcS0+dHlwZSA9IFY0TDJfQlVGX1RZUEVfVklERU9fQ0FQVFVS
RTsNCj4+ICAgCXEtPmlvX21vZGVzID0gVkIyX01NQVAgfCBWQjJfUkVBRCB8IFZCMl9ETUFCVUY7
DQo+PiBAQCAtMTc5MCwxOCArMTgyNiwxOCBAQCBzdGF0aWMgaW50IGRjbWlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgCXJldCA9IHZiMl9xdWV1ZV9pbml0KHEpOw0K
Pj4gICAJaWYgKHJldCA8IDApIHsNCj4+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQg
dG8gaW5pdGlhbGl6ZSB2YjIgcXVldWVcbiIpOw0KPj4gLQkJZ290byBlcnJfZGV2aWNlX3JlbGVh
c2U7DQo+PiArCQlnb3RvIGVycl9tZWRpYV9lbnRpdHlfY2xlYW51cDsNCj4+ICAgCX0NCj4+ICAg
DQo+PiAgIAlyZXQgPSBkY21pX2dyYXBoX2luaXQoZGNtaSk7DQo+PiAgIAlpZiAocmV0IDwgMCkN
Cj4+IC0JCWdvdG8gZXJyX2RldmljZV9yZWxlYXNlOw0KPj4gKwkJZ290byBlcnJfbWVkaWFfZW50
aXR5X2NsZWFudXA7DQo+PiAgIA0KPj4gICAJLyogUmVzZXQgZGV2aWNlICovDQo+PiAgIAlyZXQg
PSByZXNldF9jb250cm9sX2Fzc2VydChkY21pLT5yc3RjKTsNCj4+ICAgCWlmIChyZXQpIHsNCj4+
ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gYXNzZXJ0IHRoZSByZXNldCBsaW5l
XG4iKTsNCj4+IC0JCWdvdG8gZXJyX2NsZWFudXA7DQo+PiArCQlnb3RvIGVycl9ncmFwaF9kZWlu
aXQ7DQo+PiAgIAl9DQo+PiAgIA0KPj4gICAJdXNsZWVwX3JhbmdlKDMwMDAsIDUwMDApOw0KPj4g
QEAgLTE4MDksNyArMTg0NSw3IEBAIHN0YXRpYyBpbnQgZGNtaV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQ0KPj4gICAJcmV0ID0gcmVzZXRfY29udHJvbF9kZWFzc2VydChkY21p
LT5yc3RjKTsNCj4+ICAgCWlmIChyZXQpIHsNCj4+ICAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJG
YWlsZWQgdG8gZGVhc3NlcnQgdGhlIHJlc2V0IGxpbmVcbiIpOw0KPj4gLQkJZ290byBlcnJfY2xl
YW51cDsNCj4+ICsJCWdvdG8gZXJyX2dyYXBoX2RlaW5pdDsNCj4+ICAgCX0NCj4+ICAgDQo+PiAg
IAlkZXZfaW5mbygmcGRldi0+ZGV2LCAiUHJvYmUgZG9uZVxuIik7DQo+PiBAQCAtMTgyMCwxMyAr
MTg1NiwxNiBAQCBzdGF0aWMgaW50IGRjbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4+ICAgDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgDQo+PiAtZXJyX2NsZWFudXA6DQo+
PiAtCXY0bDJfYXN5bmNfbm90aWZpZXJfY2xlYW51cCgmZGNtaS0+bm90aWZpZXIpOw0KPj4gLWVy
cl9kZXZpY2VfcmVsZWFzZToNCj4+IC0JdmlkZW9fZGV2aWNlX3JlbGVhc2UoZGNtaS0+dmRldik7
DQo+PiArZXJyX2dyYXBoX2RlaW5pdDoNCj4+ICsJZGNtaV9ncmFwaF9kZWluaXQoZGNtaSk7DQo+
PiArZXJyX21lZGlhX2VudGl0eV9jbGVhbnVwOg0KPj4gKwltZWRpYV9lbnRpdHlfY2xlYW51cCgm
ZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4+ICAgZXJyX2RldmljZV91bnJlZ2lzdGVyOg0KPj4gICAJ
djRsMl9kZXZpY2VfdW5yZWdpc3RlcigmZGNtaS0+djRsMl9kZXYpOw0KPj4gLWVycl9kbWFfcmVs
ZWFzZToNCj4+ICtlcnJfbWVkaWFfZGV2aWNlX3VucmVnaXN0ZXI6DQo+PiArCW1lZGlhX2Rldmlj
ZV91bnJlZ2lzdGVyKCZkY21pLT5tZGV2KTsNCj4+ICtlcnJfbWVkaWFfZGV2aWNlX2NsZWFudXA6
DQo+PiArCW1lZGlhX2RldmljZV9jbGVhbnVwKCZkY21pLT5tZGV2KTsNCj4+ICAgCWRtYV9yZWxl
YXNlX2NoYW5uZWwoZGNtaS0+ZG1hX2NoYW4pOw0KPj4gICANCj4+ICAgCXJldHVybiByZXQ7DQo+
PiBAQCAtMTgzOCw5ICsxODc3LDExIEBAIHN0YXRpYyBpbnQgZGNtaV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4+ICAgDQo+PiAgIAlwbV9ydW50aW1lX2Rpc2FibGUoJnBk
ZXYtPmRldik7DQo+PiAgIA0KPj4gLQl2NGwyX2FzeW5jX25vdGlmaWVyX3VucmVnaXN0ZXIoJmRj
bWktPm5vdGlmaWVyKTsNCj4+IC0JdjRsMl9hc3luY19ub3RpZmllcl9jbGVhbnVwKCZkY21pLT5u
b3RpZmllcik7DQo+PiArCWRjbWlfZ3JhcGhfZGVpbml0KGRjbWkpOw0KPj4gKwltZWRpYV9lbnRp
dHlfY2xlYW51cCgmZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4+ICAgCXY0bDJfZGV2aWNlX3VucmVn
aXN0ZXIoJmRjbWktPnY0bDJfZGV2KTsNCj4+ICsJbWVkaWFfZGV2aWNlX3VucmVnaXN0ZXIoJmRj
bWktPm1kZXYpOw0KPiANCj4gUGxlYXNlIHVucmVnaXN0ZXIgdGhlIG1lZGlhIGRldmljZSBmaXJz
dCBiZWZvcmUgdW5yZWdpc3RlcmluZyBhbnl0aGluZyBlbHNlDQo+IGl0IGRlcGVuZHMgb24gKGku
ZS4gYXN5bmMgbm90aWZpZXIgb3IgdGhlIGVudGl0eSkuDQo+IA0KTWVkaWEgZGV2aWNlIHJlZ2lz
dHJ5IGlzIGRyb3BwZWQgaW4gdjMgdG8gbm90IGV4cG9zZSBtZWRpYSBjb250cm9sbGVyDQppbnRl
cmZhY2VzIHRvIHVzZXJzcGFjZSBhcyBkaXNjdXNzZWQgaGVyZToNCmh0dHBzOi8vd3d3LnNwaW5p
Y3MubmV0L2xpc3RzL2xpbnV4LW1lZGlhL21zZzE1MzQxNy5odG1sDQoNCj4+ICsJbWVkaWFfZGV2
aWNlX2NsZWFudXAoJmRjbWktPm1kZXYpOw0KPj4gICANCj4+ICAgCWRtYV9yZWxlYXNlX2NoYW5u
ZWwoZGNtaS0+ZG1hX2NoYW4pOw0KPj4gICANCj4gDQoNCkJSLA0KSHVndWVzLg==
