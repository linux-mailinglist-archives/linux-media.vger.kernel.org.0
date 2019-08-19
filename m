Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9E0291E1D
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 09:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbfHSHlI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 03:41:08 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:55698 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726261AbfHSHlI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 03:41:08 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7J7aQWn026361;
        Mon, 19 Aug 2019 09:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=7aSw9X3s9+ekMFjoSt5O6z5zbNruogj2ZJ47vk/drdI=;
 b=EKPcW4iBPC8PYxzEQdYvVFfEciolJUKqkhXZqUAPuf+EQN/YIb46Gp5r9kotBPe+B/el
 dZVLEq80GTQ1lTrdXPW8pMmiRNJ9VI3aTxbZLU3WbH1eXAoJaDpdutbmye4wgRZp7mDX
 40Yp0j8MWkvqx3G++CBD252jtDrei4x75/Yqs27BdPyaeKrOSFzQkcjnjR1Xe1oqSDba
 mPYaS/j31o4U4RmkyJsNSUKDpOf/TO8x2pQXYWiCEnqMoDPWxgELrMwpYtUVgwyWfm+Y
 VoS8ICQDf8uCRXFfY4VPOUcsr5sdMpFl6GRMbGEJE+NLBOMVU0gZNvcGzZ4RKyRoGWtR eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ue720t0ev-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 19 Aug 2019 09:40:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 70A003F;
        Mon, 19 Aug 2019 07:40:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5AB022C06DC;
        Mon, 19 Aug 2019 09:40:54 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 19 Aug
 2019 09:40:53 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 19 Aug 2019 09:40:53 +0200
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
Subject: Re: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Thread-Topic: [PATCH v6 2/4] media: stm32-dcmi: trace the supported
 fourcc/mbus_code
Thread-Index: AQHVVAq68UiFQiNcNkmXdD8YMRgfcacB9FUAgAAA2oCAAAQPgA==
Date:   Mon, 19 Aug 2019 07:40:53 +0000
Message-ID: <ceec05d1-5791-4ba6-e2a8-3a5fd8b89955@st.com>
References: <1565790533-10043-1-git-send-email-hugues.fruchet@st.com>
 <1565790533-10043-3-git-send-email-hugues.fruchet@st.com>
 <20190816081514.GU6133@paasikivi.fi.intel.com>
 <fb02573f-991a-18c5-b780-b5fc100da6a8@st.com>
 <20190819072621.GZ6133@paasikivi.fi.intel.com>
In-Reply-To: <20190819072621.GZ6133@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3124090F81DAD34B8BD1CF42EC06E4A3@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_02:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPSywgSSB3aWxsIGNoYW5nZS4NCg0KSGF2ZSB5b3Ugc29tZSBvdGhlciBy
ZW1hcmtzIG9uIHRoaXMgc2VyaWUgaW4gb3JkZXIgdGhhdCBJIGdyb3VwIGNoYW5nZXMgDQppbiB0
aGUgbmV4dCB2ZXJzaW9uID8NCg0KT24gOC8xOS8xOSA5OjI2IEFNLCBTYWthcmkgQWlsdXMgd3Jv
dGU6DQo+IEhpIEh1Z3VlcywNCj4gDQo+IE9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDA3OjIzOjE3
QU0gKzAwMDAsIEh1Z3VlcyBGUlVDSEVUIHdyb3RlOg0KPj4gSGkgU2FrYXJpLA0KPj4NCj4+IE9u
IDgvMTYvMTkgMTA6MTUgQU0sIFNha2FyaSBBaWx1cyB3cm90ZToNCj4+PiBIaSBIdWd1ZXMsDQo+
Pj4NCj4+PiBPbiBXZWQsIEF1ZyAxNCwgMjAxOSBhdCAwMzo0ODo1MVBNICswMjAwLCBIdWd1ZXMg
RnJ1Y2hldCB3cm90ZToNCj4+Pj4gQWRkIGEgdHJhY2Ugb2YgdGhlIHNldCBvZiBzdXBwb3J0ZWQg
Zm91cmNjL21idXNfY29kZSB3aGljaA0KPj4+PiBpbnRlcnNlY3QgYmV0d2VlbiBEQ01JIGFuZCBz
b3VyY2Ugc3ViLWRldmljZS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSHVndWVzIEZydWNo
ZXQgPGh1Z3Vlcy5mcnVjaGV0QHN0LmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vc3RtMzIvc3RtMzItZGNtaS5jIHwgMTIgKysrKysrKysrKy0tDQo+Pj4+ICAg
IDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdG0zMi9zdG0zMi1kY21p
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4+PiBpbmRl
eCBiNDYyZjcxLi4xOGFjZWNmIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4+PiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3N0bTMyL3N0bTMyLWRjbWkuYw0KPj4+PiBAQCAtMTQ0NywxMiArMTQ0NywyMCBAQCBzdGF0aWMg
aW50IGRjbWlfZm9ybWF0c19pbml0KHN0cnVjdCBzdG0zMl9kY21pICpkY21pKQ0KPj4+PiAgICAJ
CQkvKiBDb2RlIHN1cHBvcnRlZCwgaGF2ZSB3ZSBnb3QgdGhpcyBmb3VyY2MgeWV0PyAqLw0KPj4+
PiAgICAJCQlmb3IgKGogPSAwOyBqIDwgbnVtX2ZtdHM7IGorKykNCj4+Pj4gICAgCQkJCWlmIChz
ZF9mbXRzW2pdLT5mb3VyY2MgPT0NCj4+Pj4gLQkJCQkJCWRjbWlfZm9ybWF0c1tpXS5mb3VyY2Mp
DQo+Pj4+ICsJCQkJCQlkY21pX2Zvcm1hdHNbaV0uZm91cmNjKSB7DQo+Pj4+ICAgIAkJCQkJLyog
QWxyZWFkeSBhdmFpbGFibGUgKi8NCj4+Pj4gKwkJCQkJZGV2X2RiZyhkY21pLT5kZXYsICJTa2lw
cGluZyBmb3VyY2MvY29kZTogJTQuNHMvMHgleFxuIiwNCj4+Pj4gKwkJCQkJCShjaGFyICopJnNk
X2ZtdHNbal0tPmZvdXJjYywNCj4+Pj4gKwkJCQkJCW1idXNfY29kZS5jb2RlKTsNCj4+Pj4gICAg
CQkJCQlicmVhazsNCj4+Pj4gLQkJCWlmIChqID09IG51bV9mbXRzKQ0KPj4+PiArCQkJCX0NCj4+
Pj4gKwkJCWlmIChqID09IG51bV9mbXRzKSB7DQo+Pj4+ICAgIAkJCQkvKiBOZXcgKi8NCj4+Pj4g
ICAgCQkJCXNkX2ZtdHNbbnVtX2ZtdHMrK10gPSBkY21pX2Zvcm1hdHMgKyBpOw0KPj4+PiArCQkJ
CWRldl9kYmcoZGNtaS0+ZGV2LCAiU3VwcG9ydGVkIGZvdXJjYy9jb2RlOiAlNC40cy8weCV4XG4i
LA0KPj4+DQo+Pj4gT3ZlciA4MCBjaGFyYWN0ZXJzIHBlciBsaW5lLg0KPj4+DQo+Pg0KPj4gVGhp
cyBhbiBleGNlcHRpb24gb2YgdGhlICI4MCBjaGFycyIgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBn
cmVwIGluDQo+PiBrZXJuZWwgbWVzc2FnZXM6DQo+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL3Y0LjEwL3Byb2Nlc3MvY29kaW5nLXN0eWxlLmh0bWwNCj4+ICJIb3dldmVyLCBuZXZl
ciBicmVhayB1c2VyLXZpc2libGUgc3RyaW5ncyBzdWNoIGFzIHByaW50ayBtZXNzYWdlcywNCj4+
IGJlY2F1c2UgdGhhdCBicmVha3MgdGhlIGFiaWxpdHkgdG8gZ3JlcCBmb3IgdGhlbS4iDQo+Pg0K
Pj4gVGhpcyBleGNlcHRpb24gaXMgbWFuYWdlZCBpbiBjaGVja3BhdGNoLnBsICgtLXN0cmljdCku
DQo+IA0KPiBUaGlzIGV4Y2VwdGlvbiBpcyBmb3IgY2FzZXMgd2hlcmUgd3JhcHBpbmcgdGhlIGxp
bmUgaW4gdGhlIHVzdWFsIHdheSwgZS5nLg0KPiBhdCBhcmd1bWVudCBib3VuZGFyaWVzLCBkb2Vz
IG5vdCBwcmV2ZW50IGl0IGV4Y2VlZGluZyA4MCBjaGFyYWN0ZXJzLiBCdXQgaXQgaXMNCj4gbm90
IHRoZSBjYXNlIGhlcmUuDQo+IA0KDQpCUiwNCkh1Z3Vlcy4=
