Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89C845D2CD
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 17:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbfGBP1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 11:27:15 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26208 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726382AbfGBP1L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 11:27:11 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62F7Lmh008553;
        Tue, 2 Jul 2019 17:27:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+XtyxaPXwDa2sSo9xoONL7Ib6xWNA0nyBuuOeaVWCaM=;
 b=IrGnIyAuzEfryQ8MTbCw80OmMMemvCAvp8BOU0ZT1ZgbrCuQB5zwOGbWFwQEYfusLl4X
 elRwuhoKUELX4uCtgggtGyiu8loj1A13/MuPTNF7XuBiFI+HmQ76pKDcJEhIYbDjuNex
 pWvyKhfq5ZRNXG1GTfG+6GcgnvfseJMXK6Md7AfVKAdrIxoO8RArcbFk5+W4vGFlIqoO
 lzpozKTa4b+yiv2PPsljbzLePzQIf75ZUQ23xVT47Y2k9EbT/aHn70t5GK6GjIoJL3Gw
 3K0Bvq1pjtGWWNcygYax/8ug9b7a8NvH30oqTHnxpgkxh9B0Nj7ffs7VdMSm7orzPhD/ xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2tdw49wchn-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 02 Jul 2019 17:26:59 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E704131;
        Tue,  2 Jul 2019 15:26:56 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B61AD2D41;
        Tue,  2 Jul 2019 15:26:56 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jul
 2019 17:26:56 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 17:26:56 +0200
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
Subject: Re: [PATCH v2 3/3] media: stm32-dcmi: add support of several
 sub-devices
Thread-Topic: [PATCH v2 3/3] media: stm32-dcmi: add support of several
 sub-devices
Thread-Index: AQHVJ4BwxzxDFTYZ2kysWj/4BkRkO6a3ZKGA
Date:   Tue, 2 Jul 2019 15:26:56 +0000
Message-ID: <e3b91ad5-894f-e8c9-3ff7-395e2e98cb3b@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-4-git-send-email-hugues.fruchet@st.com>
 <20190620155414.rei4mtinpczznpnk@kekkonen.localdomain>
In-Reply-To: <20190620155414.rei4mtinpczznpnk@kekkonen.localdomain>
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
Content-ID: <8CF8301EBFD46B4995717A2536C1FD19@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_08:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiA2LzIwLzE5IDU6NTQgUE0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4g
SGkgSHVndWVzLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgdXBkYXRlLg0KPiANCj4gT24gVHVl
LCBKdW4gMTEsIDIwMTkgYXQgMTA6NDg6MzJBTSArMDIwMCwgSHVndWVzIEZydWNoZXQgd3JvdGU6
DQo+PiBBZGQgc3VwcG9ydCBvZiBzZXZlcmFsIHN1Yi1kZXZpY2VzIHdpdGhpbiBwaXBlbGluZSBp
bnN0ZWFkDQo+PiBvZiBhIHNpbmdsZSBvbmUuDQo+PiBUaGlzIGFsbG93cyB0byBzdXBwb3J0IGEg
Q1NJLTIgY2FtZXJhIHNlbnNvciBjb25uZWN0ZWQNCj4+IHRocm91Z2ggYSBDU0ktMiB0byBwYXJh
bGxlbCBicmlkZ2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNoZXQgPGh1Z3Vl
cy5mcnVjaGV0QHN0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0
bTMyL3N0bTMyLWRjbWkuYyB8IDIwNyArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDE4OSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21p
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4gaW5kZXgg
M2E2OTc4My4uMTQ0OTEyZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
c3RtMzIvc3RtMzItZGNtaS5jDQo+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMy
L3N0bTMyLWRjbWkuYw0KPj4gQEAgLTE3Myw2ICsxNzMsNyBAQCBzdHJ1Y3Qgc3RtMzJfZGNtaSB7
DQo+PiAgIA0KPj4gICAJc3RydWN0IG1lZGlhX2RldmljZQkJbWRldjsNCj4+ICAgCXN0cnVjdCBt
ZWRpYV9wYWQJCXZpZF9jYXBfcGFkOw0KPj4gKwlzdHJ1Y3QgbWVkaWFfcGlwZWxpbmUJCXBpcGVs
aW5lOw0KPj4gICB9Ow0KPj4gICANCj4+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3RtMzJfZGNt
aSAqbm90aWZpZXJfdG9fZGNtaShzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbikNCj4+IEBA
IC01ODQsNiArNTg1LDEzNSBAQCBzdGF0aWMgdm9pZCBkY21pX2J1Zl9xdWV1ZShzdHJ1Y3QgdmIy
X2J1ZmZlciAqdmIpDQo+PiAgIAlzcGluX3VubG9ja19pcnEoJmRjbWktPmlycWxvY2spOw0KPj4g
ICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBzdHJ1Y3QgbWVkaWFfZW50aXR5ICpkY21pX2ZpbmRfc2Vu
c29yKHN0cnVjdCBzdG0zMl9kY21pICpkY21pKQ0KPiANCj4gWW91IGdlbmVyYWxseSBzaG91bGQg
YmUgb25seSBjb25jZXJuZWQgd2l0aCB0aGUgbmV4dCBlbnRpdHkgY29ubmVjdGVkIHRvIHRoZQ0K
PiBvbmUgeW91J3JlIGluIGNvbnRyb2wgb2YsIG5vdCB0aGUgcmVzdCBvZiB0aGUgcGlwZWxpbmUu
DQoNClRoaXMgd2FzIGRpc2N1c3NlZCB3aXRoIExhdXJlbnQgaGVyZToNCmh0dHBzOi8vd3d3LnNw
aW5pY3MubmV0L2xpc3RzL2xpbnV4LW1lZGlhL21zZzE1MzQxNy5odG1sDQphbmQgaXQncyBPSyBi
ZWNhdXNlIERDTUkgaXMgYSB2aWRlbyBub2RlIGFuZCB3ZSBhcmUgbm90DQpleHBvc2luZyBtZWRp
YSBjb250cm9sbGVyIGludGVyZmFjZSB0byB1c2Vyc3BhY2UuDQoNCj4gDQo+PiArew0KPj4gKwlz
dHJ1Y3QgbWVkaWFfZW50aXR5ICplbnRpdHkgPSAmZGNtaS0+dmRldi0+ZW50aXR5Ow0KPj4gKwlz
dHJ1Y3QgdjRsMl9zdWJkZXYgKnN1YmRldjsNCj4+ICsJc3RydWN0IG1lZGlhX3BhZCAqcGFkOw0K
Pj4gKw0KPj4gKwkvKiBXYWxrIHNlYXJjaGluZyBmb3IgZW50aXR5IGhhdmluZyBubyBzaW5rICov
DQo+PiArCXdoaWxlICgxKSB7DQo+PiArCQlwYWQgPSAmZW50aXR5LT5wYWRzWzBdOw0KPj4gKw0K
Pj4gKwkJc3ViZGV2ID0gbWVkaWFfZW50aXR5X3RvX3Y0bDJfc3ViZGV2KGVudGl0eSk7DQo+PiAr
DQo+PiArCQlpZiAoIShwYWQtPmZsYWdzICYgTUVESUFfUEFEX0ZMX1NJTkspKQ0KPj4gKwkJCWJy
ZWFrOw0KPj4gKw0KPj4gKwkJcGFkID0gbWVkaWFfZW50aXR5X3JlbW90ZV9wYWQocGFkKTsNCj4+
ICsJCWlmICghcGFkIHx8ICFpc19tZWRpYV9lbnRpdHlfdjRsMl9zdWJkZXYocGFkLT5lbnRpdHkp
KQ0KPj4gKwkJCWJyZWFrOw0KPj4gKw0KPj4gKwkJZW50aXR5ID0gcGFkLT5lbnRpdHk7DQo+PiAr
CX0NCj4+ICsNCj4+ICsJcmV0dXJuIGVudGl0eTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlu
dCBkY21pX3BpcGVsaW5lX3NfZm10KHN0cnVjdCBzdG0zMl9kY21pICpkY21pLA0KPj4gKwkJCSAg
ICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXZfcGFkX2NvbmZpZyAqcGFkX2NmZywNCj4+ICsJCQkgICAg
ICAgc3RydWN0IHY0bDJfc3ViZGV2X2Zvcm1hdCAqZm9ybWF0KQ0KPj4gK3sNCj4+ICsJc3RydWN0
IG1lZGlhX2VudGl0eSAqZW50aXR5ID0gJmRjbWktPnNlbnNvci0+ZW50aXR5Ow0KPj4gKwlzdHJ1
Y3QgdjRsMl9zdWJkZXYgKnN1YmRldjsNCj4+ICsJc3RydWN0IG1lZGlhX3BhZCAqc2lua19wYWQg
PSBOVUxMOw0KPj4gKwlzdHJ1Y3QgbWVkaWFfcGFkICpzcmNfcGFkID0gTlVMTDsNCj4+ICsJc3Ry
dWN0IG1lZGlhX3BhZCAqcGFkID0gTlVMTDsNCj4+ICsJc3RydWN0IHY0bDJfc3ViZGV2X2Zvcm1h
dCBmbXQgPSAqZm9ybWF0Ow0KPj4gKwlib29sIGZvdW5kID0gZmFsc2U7DQo+PiArCWludCByZXQ7
DQo+PiArDQo+PiArCS8qDQo+PiArCSAqIFN0YXJ0aW5nIGZyb20gc2Vuc29yIHN1YmRldmljZSwg
d2FsayB3aXRoaW4NCj4+ICsJICogcGlwZWxpbmUgYW5kIHNldCBmb3JtYXQgb24gZWFjaCBzdWJk
ZXZpY2UNCj4+ICsJICovDQo+PiArCXdoaWxlICgxKSB7DQo+PiArCQl1bnNpZ25lZCBpbnQgaTsN
Cj4+ICsNCj4+ICsJCS8qIFNlYXJjaCBpZiBjdXJyZW50IGVudGl0eSBoYXMgYSBzb3VyY2UgcGFk
ICovDQo+PiArCQlmb3IgKGkgPSAwOyBpIDwgZW50aXR5LT5udW1fcGFkczsgaSsrKSB7DQo+PiAr
CQkJcGFkID0gJmVudGl0eS0+cGFkc1tpXTsNCj4+ICsJCQlpZiAocGFkLT5mbGFncyAmIE1FRElB
X1BBRF9GTF9TT1VSQ0UpIHsNCj4+ICsJCQkJc3JjX3BhZCA9IHBhZDsNCj4+ICsJCQkJZm91bmQg
PSB0cnVlOw0KPj4gKwkJCQlicmVhazsNCj4+ICsJCQl9DQo+PiArCQl9DQo+PiArCQlpZiAoIWZv
dW5kKQ0KPj4gKwkJCWJyZWFrOw0KPj4gKw0KPj4gKwkJc3ViZGV2ID0gbWVkaWFfZW50aXR5X3Rv
X3Y0bDJfc3ViZGV2KGVudGl0eSk7DQo+PiArDQo+PiArCQkvKiBQcm9wYWdhdGUgZm9ybWF0IG9u
IHNpbmsgcGFkIGlmIGFueSwgb3RoZXJ3aXNlIHNvdXJjZSBwYWQgKi8NCj4+ICsJCWlmIChzaW5r
X3BhZCkNCj4+ICsJCQlwYWQgPSBzaW5rX3BhZDsNCj4+ICsNCj4+ICsJCWRldl9kYmcoZGNtaS0+
ZGV2LCAiJXNbJWRdIHBhZCBmb3JtYXQgc2V0IHRvIDB4JXggJXV4JXVcbiIsDQo+PiArCQkJc3Vi
ZGV2LT5uYW1lLCBwYWQtPmluZGV4LCBmb3JtYXQtPmZvcm1hdC5jb2RlLA0KPj4gKwkJCWZvcm1h
dC0+Zm9ybWF0LndpZHRoLCBmb3JtYXQtPmZvcm1hdC5oZWlnaHQpOw0KPj4gKw0KPj4gKwkJZm10
LnBhZCA9IHBhZC0+aW5kZXg7DQo+PiArCQlyZXQgPSB2NGwyX3N1YmRldl9jYWxsKHN1YmRldiwg
cGFkLCBzZXRfZm10LCBwYWRfY2ZnLCAmZm10KTsNCj4gDQo+IEdlbmVyYWxseSBzcGVha2luZywg
b24gTUMtY2VudHJpYyBkZXZpY2VzLCB0aGUgdXNlciBzcGFjZSBuZWVkcyB0bw0KPiBjb25maWd1
cmUgdGhlIHBpcGVsaW5lLiBUaGUgZHJpdmVyJ3MgcmVzcG9uc2liaWxpdHkgaXMgdG8gdmFsaWRh
dGUgaXQNCj4gKHRocm91Z2ggdGhlIGxpbmtfdmFsaWRhdGUgbWVkaWEgZW50aXR5IGFuZCBzdWJk
ZXYgcGFkIG9wcykuIEkuZS4gc2V0X2ZtdA0KPiBpcyBvbmx5IHVzZWQgdGhyb3VnaCB0aGUgc3Vi
ZGV2IG5vZGVzLg0KPiANCmRpdHRvDQoNCj4+ICsJCWlmIChyZXQgPCAwKQ0KPj4gKwkJCXJldHVy
biByZXQ7DQo+PiArDQo+PiArCQkvKiBXYWxrIHRvIG5leHQgZW50aXR5ICovDQo+PiArCQlzaW5r
X3BhZCA9IG1lZGlhX2VudGl0eV9yZW1vdGVfcGFkKHNyY19wYWQpOw0KPj4gKwkJaWYgKCFzaW5r
X3BhZCB8fCAhaXNfbWVkaWFfZW50aXR5X3Y0bDJfc3ViZGV2KHNpbmtfcGFkLT5lbnRpdHkpKQ0K
Pj4gKwkJCWJyZWFrOw0KPj4gKw0KPj4gKwkJZW50aXR5ID0gc2lua19wYWQtPmVudGl0eTsNCj4+
ICsJfQ0KPj4gKwkqZm9ybWF0ID0gZm10Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+
PiArDQo+PiArc3RhdGljIGludCBkY21pX3BpcGVsaW5lX3Nfc3RyZWFtKHN0cnVjdCBzdG0zMl9k
Y21pICpkY21pLCBpbnQgc3RhdGUpDQo+PiArew0KPj4gKwlzdHJ1Y3QgbWVkaWFfZW50aXR5ICpl
bnRpdHkgPSAmZGNtaS0+dmRldi0+ZW50aXR5Ow0KPj4gKwlzdHJ1Y3QgdjRsMl9zdWJkZXYgKnN1
YmRldjsNCj4+ICsJc3RydWN0IG1lZGlhX3BhZCAqcGFkOw0KPj4gKwlpbnQgcmV0Ow0KPj4gKw0K
Pj4gKwkvKiBTdGFydC9zdG9wIGFsbCBlbnRpdGllcyB3aXRoaW4gcGlwZWxpbmUgKi8NCj4+ICsJ
d2hpbGUgKDEpIHsNCj4+ICsJCXBhZCA9ICZlbnRpdHktPnBhZHNbMF07DQo+PiArCQlpZiAoIShw
YWQtPmZsYWdzICYgTUVESUFfUEFEX0ZMX1NJTkspKQ0KPj4gKwkJCWJyZWFrOw0KPj4gKw0KPj4g
KwkJcGFkID0gbWVkaWFfZW50aXR5X3JlbW90ZV9wYWQocGFkKTsNCj4+ICsJCWlmICghcGFkIHx8
ICFpc19tZWRpYV9lbnRpdHlfdjRsMl9zdWJkZXYocGFkLT5lbnRpdHkpKQ0KPj4gKwkJCWJyZWFr
Ow0KPj4gKw0KPj4gKwkJZW50aXR5ID0gcGFkLT5lbnRpdHk7DQo+PiArCQlzdWJkZXYgPSBtZWRp
YV9lbnRpdHlfdG9fdjRsMl9zdWJkZXYoZW50aXR5KTsNCj4+ICsNCj4+ICsJCXJldCA9IHY0bDJf
c3ViZGV2X2NhbGwoc3ViZGV2LCB2aWRlbywgc19zdHJlYW0sIHN0YXRlKTsNCj4gDQo+IFBsZWFz
ZSBvbmx5IGNhbGwgdGhpcyBvbiB0aGUgbmV4dCB1cHN0cmVhbSBzdWItZGV2aWNlLiBTZWUgZS5n
LiB0aGUNCj4gaXB1My1jaW8yIG9yIG9tYXAzaXNwIGRyaXZlciBmb3IgYW4gZXhhbXBsZS4NCj4g
DQpkaXR0bw0KDQo+PiArCQlpZiAocmV0IDwgMCAmJiByZXQgIT0gLUVOT0lPQ1RMQ01EKSB7DQo+
PiArCQkJZGV2X2VycihkY21pLT5kZXYsICIlczogJXMgZmFpbGVkIHRvICVzIHN0cmVhbWluZyAo
JWQpXG4iLA0KPj4gKwkJCQlfX2Z1bmNfXywgc3ViZGV2LT5uYW1lLA0KPj4gKwkJCQlzdGF0ZSA/
ICJzdGFydCIgOiAic3RvcCIsIHJldCk7DQo+PiArCQkJcmV0dXJuIHJldDsNCj4+ICsJCX0NCj4+
ICsNCj4+ICsJCWRldl9kYmcoZGNtaS0+ZGV2LCAiJXMgaXMgJXNcbiIsDQo+PiArCQkJc3ViZGV2
LT5uYW1lLCBzdGF0ZSA/ICJzdGFydGVkIiA6ICJzdG9wcGVkIik7DQo+PiArCX0NCj4+ICsNCj4+
ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgZGNtaV9waXBlbGluZV9z
dGFydChzdHJ1Y3Qgc3RtMzJfZGNtaSAqZGNtaSkNCj4+ICt7DQo+PiArCXJldHVybiBkY21pX3Bp
cGVsaW5lX3Nfc3RyZWFtKGRjbWksIDEpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBk
Y21pX3BpcGVsaW5lX3N0b3Aoc3RydWN0IHN0bTMyX2RjbWkgKmRjbWkpDQo+PiArew0KPj4gKwlk
Y21pX3BpcGVsaW5lX3Nfc3RyZWFtKGRjbWksIDApOw0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGlj
IGludCBkY21pX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwgdW5zaWduZWQg
aW50IGNvdW50KQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3Qgc3RtMzJfZGNtaSAqZGNtaSA9IHZiMl9n
ZXRfZHJ2X3ByaXYodnEpOw0KPj4gQEAgLTU5OCwxNCArNzI4LDE3IEBAIHN0YXRpYyBpbnQgZGNt
aV9zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9xdWV1ZSAqdnEsIHVuc2lnbmVkIGludCBjb3Vu
dCkNCj4+ICAgCQlnb3RvIGVycl9yZWxlYXNlX2J1ZmZlcnM7DQo+PiAgIAl9DQo+PiAgIA0KPj4g
LQkvKiBFbmFibGUgc3RyZWFtIG9uIHRoZSBzdWIgZGV2aWNlICovDQo+PiAtCXJldCA9IHY0bDJf
c3ViZGV2X2NhbGwoZGNtaS0+c2Vuc29yLCB2aWRlbywgc19zdHJlYW0sIDEpOw0KPj4gLQlpZiAo
cmV0ICYmIHJldCAhPSAtRU5PSU9DVExDTUQpIHsNCj4+IC0JCWRldl9lcnIoZGNtaS0+ZGV2LCAi
JXM6IEZhaWxlZCB0byBzdGFydCBzdHJlYW1pbmcsIHN1YmRldiBzdHJlYW1vbiBlcnJvciIsDQo+
PiAtCQkJX19mdW5jX18pOw0KPj4gKwlyZXQgPSBtZWRpYV9waXBlbGluZV9zdGFydCgmZGNtaS0+
dmRldi0+ZW50aXR5LCAmZGNtaS0+cGlwZWxpbmUpOw0KPj4gKwlpZiAocmV0IDwgMCkgew0KPj4g
KwkJZGV2X2VycihkY21pLT5kZXYsICIlczogRmFpbGVkIHRvIHN0YXJ0IHN0cmVhbWluZywgbWVk
aWEgcGlwZWxpbmUgc3RhcnQgZXJyb3IgKCVkKVxuIiwNCj4+ICsJCQlfX2Z1bmNfXywgcmV0KTsN
Cj4+ICAgCQlnb3RvIGVycl9wbV9wdXQ7DQo+PiAgIAl9DQo+PiAgIA0KPj4gKwlyZXQgPSBkY21p
X3BpcGVsaW5lX3N0YXJ0KGRjbWkpOw0KPj4gKwlpZiAocmV0KQ0KPj4gKwkJZ290byBlcnJfbWVk
aWFfcGlwZWxpbmVfc3RvcDsNCj4+ICsNCj4+ICAgCXNwaW5fbG9ja19pcnEoJmRjbWktPmlycWxv
Y2spOw0KPj4gICANCj4+ICAgCS8qIFNldCBidXMgd2lkdGggKi8NCj4+IEBAIC02NzcsNyArODEw
LDcgQEAgc3RhdGljIGludCBkY21pX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICp2
cSwgdW5zaWduZWQgaW50IGNvdW50KQ0KPj4gICAJaWYgKHJldCkgew0KPj4gICAJCWRldl9lcnIo
ZGNtaS0+ZGV2LCAiJXM6IFN0YXJ0IHN0cmVhbWluZyBmYWlsZWQsIGNhbm5vdCBzdGFydCBjYXB0
dXJlXG4iLA0KPj4gICAJCQlfX2Z1bmNfXyk7DQo+PiAtCQlnb3RvIGVycl9zdWJkZXZfc3RyZWFt
b2ZmOw0KPj4gKwkJZ290byBlcnJfcGlwZWxpbmVfc3RvcDsNCj4+ICAgCX0NCj4+ICAgDQo+PiAg
IAkvKiBFbmFibGUgaW50ZXJydXB0aW9ucyAqLw0KPj4gQEAgLTY4OCw4ICs4MjEsMTEgQEAgc3Rh
dGljIGludCBkY21pX3N0YXJ0X3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwgdW5zaWdu
ZWQgaW50IGNvdW50KQ0KPj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4gICANCj4+IC1lcnJfc3Vi
ZGV2X3N0cmVhbW9mZjoNCj4+IC0JdjRsMl9zdWJkZXZfY2FsbChkY21pLT5zZW5zb3IsIHZpZGVv
LCBzX3N0cmVhbSwgMCk7DQo+PiArZXJyX3BpcGVsaW5lX3N0b3A6DQo+PiArCWRjbWlfcGlwZWxp
bmVfc3RvcChkY21pKTsNCj4+ICsNCj4+ICtlcnJfbWVkaWFfcGlwZWxpbmVfc3RvcDoNCj4+ICsJ
bWVkaWFfcGlwZWxpbmVfc3RvcCgmZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4+ICAgDQo+PiAgIGVy
cl9wbV9wdXQ6DQo+PiAgIAlwbV9ydW50aW1lX3B1dChkY21pLT5kZXYpOw0KPj4gQEAgLTcxNCwx
MyArODUwLDEwIEBAIHN0YXRpYyB2b2lkIGRjbWlfc3RvcF9zdHJlYW1pbmcoc3RydWN0IHZiMl9x
dWV1ZSAqdnEpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCBzdG0zMl9kY21pICpkY21pID0gdmIyX2dl
dF9kcnZfcHJpdih2cSk7DQo+PiAgIAlzdHJ1Y3QgZGNtaV9idWYgKmJ1ZiwgKm5vZGU7DQo+PiAt
CWludCByZXQ7DQo+PiAgIA0KPj4gLQkvKiBEaXNhYmxlIHN0cmVhbSBvbiB0aGUgc3ViIGRldmlj
ZSAqLw0KPj4gLQlyZXQgPSB2NGwyX3N1YmRldl9jYWxsKGRjbWktPnNlbnNvciwgdmlkZW8sIHNf
c3RyZWFtLCAwKTsNCj4+IC0JaWYgKHJldCAmJiByZXQgIT0gLUVOT0lPQ1RMQ01EKQ0KPj4gLQkJ
ZGV2X2VycihkY21pLT5kZXYsICIlczogRmFpbGVkIHRvIHN0b3Agc3RyZWFtaW5nLCBzdWJkZXYg
c3RyZWFtb2ZmIGVycm9yICglZClcbiIsDQo+PiAtCQkJX19mdW5jX18sIHJldCk7DQo+PiArCWRj
bWlfcGlwZWxpbmVfc3RvcChkY21pKTsNCj4+ICsNCj4+ICsJbWVkaWFfcGlwZWxpbmVfc3RvcCgm
ZGNtaS0+dmRldi0+ZW50aXR5KTsNCj4+ICAgDQo+PiAgIAlzcGluX2xvY2tfaXJxKCZkY21pLT5p
cnFsb2NrKTsNCj4+ICAgDQo+PiBAQCAtOTM4LDggKzEwNzEsNyBAQCBzdGF0aWMgaW50IGRjbWlf
c2V0X2ZtdChzdHJ1Y3Qgc3RtMzJfZGNtaSAqZGNtaSwgc3RydWN0IHY0bDJfZm9ybWF0ICpmKQ0K
Pj4gICAJbWYtPndpZHRoID0gc2RfZnJhbWVzaXplLndpZHRoOw0KPj4gICAJbWYtPmhlaWdodCA9
IHNkX2ZyYW1lc2l6ZS5oZWlnaHQ7DQo+PiAgIA0KPj4gLQlyZXQgPSB2NGwyX3N1YmRldl9jYWxs
KGRjbWktPnNlbnNvciwgcGFkLA0KPj4gLQkJCSAgICAgICBzZXRfZm10LCBOVUxMLCAmZm9ybWF0
KTsNCj4+ICsJcmV0ID0gZGNtaV9waXBlbGluZV9zX2ZtdChkY21pLCBOVUxMLCAmZm9ybWF0KTsN
Cj4+ICAgCWlmIChyZXQgPCAwKQ0KPj4gICAJCXJldHVybiByZXQ7DQo+PiAgIA0KPj4gQEAgLTE1
MzAsNyArMTY2MiwxOSBAQCBzdGF0aWMgaW50IGRjbWlfZ3JhcGhfbm90aWZ5X2NvbXBsZXRlKHN0
cnVjdCB2NGwyX2FzeW5jX25vdGlmaWVyICpub3RpZmllcikNCj4+ICAgCXN0cnVjdCBzdG0zMl9k
Y21pICpkY21pID0gbm90aWZpZXJfdG9fZGNtaShub3RpZmllcik7DQo+PiAgIAlpbnQgcmV0Ow0K
Pj4gICANCj4+ICsJLyoNCj4+ICsJICogTm93IHRoYXQgdGhlIGdyYXBoIGlzIGNvbXBsZXRlLA0K
Pj4gKwkgKiB3ZSBzZWFyY2ggZm9yIHRoZSBjYW1lcmEgc2Vuc29yIHN1YmRldmljZQ0KPj4gKwkg
KiBpbiBvcmRlciB0byBleHBvc2UgaXQgdGhyb3VnaCBWNEwyIGludGVyZmFjZQ0KPj4gKwkgKi8N
Cj4+ICsJZGNtaS0+c2Vuc29yID0gbWVkaWFfZW50aXR5X3RvX3Y0bDJfc3ViZGV2KGRjbWlfZmlu
ZF9zZW5zb3IoZGNtaSkpOw0KPj4gKwlpZiAoIWRjbWktPnNlbnNvcikgew0KPj4gKwkJZGV2X2Vy
cihkY21pLT5kZXYsICJObyBjYW1lcmEgc2Vuc29yIHN1YmRldmljZSBmb3VuZFxuIik7DQo+PiAr
CQlyZXR1cm4gLUVOT0RFVjsNCj4+ICsJfQ0KPj4gKw0KPj4gICAJZGNtaS0+dmRldi0+Y3RybF9o
YW5kbGVyID0gZGNtaS0+c2Vuc29yLT5jdHJsX2hhbmRsZXI7DQo+PiArDQo+PiAgIAlyZXQgPSBk
Y21pX2Zvcm1hdHNfaW5pdChkY21pKTsNCj4+ICAgCWlmIChyZXQpIHsNCj4+ICAgCQlkZXZfZXJy
KGRjbWktPmRldiwgIk5vIHN1cHBvcnRlZCBtZWRpYWJ1cyBmb3JtYXQgZm91bmRcbiIpOw0KPj4g
QEAgLTE1NzQsMTIgKzE3MTgsMzAgQEAgc3RhdGljIGludCBkY21pX2dyYXBoX25vdGlmeV9ib3Vu
ZChzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIsDQo+PiAgIAkJCQkgICBzdHJ1
Y3QgdjRsMl9hc3luY19zdWJkZXYgKmFzZCkNCj4+ICAgew0KPj4gICAJc3RydWN0IHN0bTMyX2Rj
bWkgKmRjbWkgPSBub3RpZmllcl90b19kY21pKG5vdGlmaWVyKTsNCj4+ICsJdW5zaWduZWQgaW50
IHJldDsNCj4+ICsJaW50IHNyY19wYWQ7DQo+PiAgIA0KPj4gICAJZGV2X2RiZyhkY21pLT5kZXYs
ICJTdWJkZXYgJXMgYm91bmRcbiIsIHN1YmRldi0+bmFtZSk7DQo+PiAgIA0KPj4gLQlkY21pLT5z
ZW5zb3IgPSBzdWJkZXY7DQo+PiArCS8qDQo+PiArCSAqIExpbmsgdGhpcyBzdWItZGV2aWNlIHRv
IERDTUksIGl0IGNvdWxkIGJlDQo+PiArCSAqIGEgcGFyYWxsZWwgY2FtZXJhIHNlbnNvciBvciBh
IGJyaWRnZQ0KPj4gKwkgKi8NCj4+ICsJc3JjX3BhZCA9IG1lZGlhX2VudGl0eV9nZXRfZndub2Rl
X3BhZCgmc3ViZGV2LT5lbnRpdHksDQo+PiArCQkJCQkgICAgICBzdWJkZXYtPmZ3bm9kZSwNCj4+
ICsJCQkJCSAgICAgIE1FRElBX1BBRF9GTF9TT1VSQ0UpOw0KPj4gKw0KPj4gKwlyZXQgPSBtZWRp
YV9jcmVhdGVfcGFkX2xpbmsoJnN1YmRldi0+ZW50aXR5LCBzcmNfcGFkLA0KPj4gKwkJCQkgICAg
JmRjbWktPnZkZXYtPmVudGl0eSwgMCwNCj4+ICsJCQkJICAgIE1FRElBX0xOS19GTF9JTU1VVEFC
TEUgfA0KPj4gKwkJCQkgICAgTUVESUFfTE5LX0ZMX0VOQUJMRUQpOw0KPj4gKwlpZiAocmV0KQ0K
Pj4gKwkJZGV2X2VycihkY21pLT5kZXYsICJGYWlsZWQgdG8gY3JlYXRlIG1lZGlhIHBhZCBsaW5r
IHdpdGggc3ViZGV2ICVzXG4iLA0KPj4gKwkJCXN1YmRldi0+bmFtZSk7DQo+PiArCWVsc2UNCj4+
ICsJCWRldl9kYmcoZGNtaS0+ZGV2LCAiRENNSSBpcyBub3cgbGlua2VkIHRvICVzXG4iLCBzdWJk
ZXYtPm5hbWUpOw0KPj4gICANCj4+IC0JcmV0dXJuIDA7DQo+PiArCXJldHVybiByZXQ7DQo+PiAg
IH0NCj4+ICAgDQo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdjRsMl9hc3luY19ub3RpZmllcl9v
cGVyYXRpb25zIGRjbWlfZ3JhcGhfbm90aWZ5X29wcyA9IHsNCj4+IEBAIC0xNjM5LDYgKzE4MDEs
MTUgQEAgc3RhdGljIGludCBkY21pX2dyYXBoX2luaXQoc3RydWN0IHN0bTMyX2RjbWkgKmRjbWkp
DQo+PiAgIAkJcmV0dXJuIHJldDsNCj4+ICAgCX0NCj4+ICAgDQo+PiArCS8qIFJlZ2lzdGVyIGFs
bCB0aGUgc3ViZGV2IG5vZGVzICovDQo+PiArCXJldCA9IHY0bDJfZGV2aWNlX3JlZ2lzdGVyX3N1
YmRldl9ub2RlcygmZGNtaS0+djRsMl9kZXYpOw0KPj4gKwlpZiAocmV0KSB7DQo+PiArCQlkZXZf
ZXJyKGRjbWktPmRldiwgIkZhaWxlZCB0byByZWdpc3RlciBzdWJkZXYgbm9kZXNcbiIpOw0KPj4g
KwkJdjRsMl9hc3luY19ub3RpZmllcl91bnJlZ2lzdGVyKCZkY21pLT5ub3RpZmllcik7DQo+PiAr
CQlvZl9ub2RlX3B1dChkY21pLT5lbnRpdHkubm9kZSk7DQo+PiArCQlyZXR1cm4gcmV0Ow0KPj4g
Kwl9DQo+PiArDQo+PiAgIAlyZXR1cm4gMDsNCj4+ICAgfQ0KPj4gICANCj4gDQoNCkJSLA0KSHVn
dWVzLg==
