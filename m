Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0C92A4C0E
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 17:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgKCQzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 11:55:46 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:51457 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727323AbgKCQzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 11:55:45 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A3GpkZw001886;
        Tue, 3 Nov 2020 17:55:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xCGGDyECcxEK4pLY4iYEOJw7YXHq0Uc6onX6/TxiC4M=;
 b=DO8W7f4dEw8EPUwCI8ig/MR1eNspEBd9zeTRwE8FeTPo7sb9Dy/bTLNt8KH4C+sG4xsH
 KWrGfNE92tp+eTP/DhMTSTxZI816g0KLwdW2DREPBO6Z5H24dsKxW6jtQu2XIrpSNkOF
 RCdOnrupwVuNVLD3xcCbHEhygUg4rJGixnwIHx74o58y5KJY046x+/Icb+RApwHDdfrv
 3XM6Wxh0Po5wzOtr5yiaam/E9dww6NGxcpXhl+h/4g0PIaJh2qsnzfuSZTKQfx18UvC2
 l9LiM9JCXQ5J3MAgBToZCMcTUlXbAyO5oMh5jL12r1gnPxoOXvJUZD3HiHdhjuVFd2U0 Rg== 
Received: from beta.dmz-us.st.com (beta.dmz-us.st.com [167.4.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34gyw19pcr-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Tue, 03 Nov 2020 17:55:37 +0100
Received: from zeta.dmz-us.st.com (ns4.st.com [167.4.16.71])
        by beta.dmz-us.st.com (STMicroelectronics) with ESMTP id C1FEA29;
        Tue,  3 Nov 2020 16:03:15 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
        by zeta.dmz-us.st.com (STMicroelectronics) with ESMTP id A38A0DE;
        Tue,  3 Nov 2020 16:55:33 +0000 (GMT)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG1NODE2.st.com
 (10.75.127.2) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 17:55:32 +0100
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 3 Nov 2020 17:55:32 +0100
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "tomi.valkeinen@ti.com" <tomi.valkeinen@ti.com>,
        "sam@elite-embedded.com" <sam@elite-embedded.com>
CC:     "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC 2/3] media: i2c: ov5640: Rework CSI-2 clock tree
Thread-Topic: [RFC 2/3] media: i2c: ov5640: Rework CSI-2 clock tree
Thread-Index: AQHWrX20WPphCdUy1kyMPYdBICKiDam2mIiA
Date:   Tue, 3 Nov 2020 16:55:32 +0000
Message-ID: <c9c2fe98-3bfa-8491-a225-ed0341f715da@st.com>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <20201028225706.110078-3-jacopo+renesas@jmondi.org>
In-Reply-To: <20201028225706.110078-3-jacopo+renesas@jmondi.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAFC746BF861A84FBA29AF2131D3D976@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_08:2020-11-03,2020-11-03 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQpPbiAxMC8yOC8yMCAxMTo1NyBQTSwgSmFjb3BvIE1vbmRpIHdyb3RlOg0K
PiBSZS13b3JrIHRoZSBvdjU2NDBfc2V0X21pcGlfcGNsaygpIGZ1bmN0aW9uIHRvIGNhbGN1bGF0
ZSB0aGUNCj4gU1lTQ0xLIGZ1bmN0aW9uIGJhc2VkIG9uIHRoZSBDU0ktMiBsaW5rIGZyZXF1ZW5j
eS4NCj4gDQo+IFRha2UgaW50byBhY2NvdW50IGFuZCBtb3JlIGNsZWFybHkgZG9jdW1lbnQgdGhl
IGNsb2NrIHRyZWUgY29uc3RyYWludHMNCj4gcmVwb3J0ZWQgaW4gdGhlIFBMTCBkaWFncmFtcy4g
TW9zdCB2YWx1ZXMgYXJlIHN0aWxsIGZpeGVkIGFuZCBvbmx5IHRlc3RlZA0KPiB3aXRoIDE2YnBw
IFlVWVYgZm9ybWF0cyB3aXRoIGEgMiBsYW5lcyBDU0ktMiBzZXR1cC4NCj4gDQo+IFRlc3RlZCBi
eSBjYXB0dXJpbmcgYW5kIHZhbGlkYXRpbmcgaW1hZ2VzIGluIGFsbCB0aGUgc2Vuc29yIHN1cHBv
cnRlZA0KPiByZXNvbHV0aW9ucyBleGNlcHQgZnVsbCByZXNvbHV0aW9uIDI1OTJ4MTk0NC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9y
Zz4NCj4gLS0tDQo+ICAgZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMgfCAxMjUgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNl
cnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21l
ZGlhL2kyYy9vdjU2NDAuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jDQo+IGluZGV4IDEx
N2FjMjI2ODNhZC4uMjM2YzY4NGNhMjBiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiBAQCAtODgs
NiArODgsNyBAQA0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19QT0xBUklUWV9DVFJMMDAJMHg0NzQw
DQo+ICAgI2RlZmluZSBPVjU2NDBfUkVHX01JUElfQ1RSTDAwCQkweDQ4MDANCj4gICAjZGVmaW5l
IE9WNTY0MF9SRUdfREVCVUdfTU9ERQkJMHg0ODE0DQo+ICsjZGVmaW5lIE9WNTY0MF9SRUdfUENM
S19QRVJJT0QJCTB4NDgzNw0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19JU1BfRk9STUFUX01VWF9D
VFJMCTB4NTAxZg0KPiAgICNkZWZpbmUgT1Y1NjQwX1JFR19QUkVfSVNQX1RFU1RfU0VUMQkweDUw
M2QNCj4gICAjZGVmaW5lIE9WNTY0MF9SRUdfU0RFX0NUUkwwCQkweDU1ODANCj4gQEAgLTkxOSw2
NyArOTIwLDg4IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIG92NTY0MF9jYWxjX3N5c19jbGsoc3Ry
dWN0IG92NTY0MF9kZXYgKnNlbnNvciwNCj4gICAvKg0KPiAgICAqIG92NTY0MF9zZXRfbWlwaV9w
Y2xrKCkgLSBDYWxjdWxhdGUgdGhlIGNsb2NrIHRyZWUgY29uZmlndXJhdGlvbiB2YWx1ZXMNCj4g
ICAgKgkJCSAgICBmb3IgdGhlIE1JUEkgQ1NJLTIgb3V0cHV0Lg0KPiAtICoNCj4gLSAqIEByYXRl
OiBUaGUgcmVxdWVzdGVkIGJhbmR3aWR0aCBwZXIgbGFuZSBpbiBieXRlcyBwZXIgc2Vjb25kLg0K
PiAtICoJICAnQmFuZHdpZHRoIFBlciBMYW5lJyBpcyBjYWxjdWxhdGVkIGFzOg0KPiAtICoJICBi
cGwgPSBIVE9UICogVlRPVCAqIEZQUyAqIGJwcCAvIG51bV9sYW5lczsNCj4gLSAqDQo+IC0gKiBU
aGlzIGZ1bmN0aW9uIHVzZSB0aGUgcmVxdWVzdGVkIGJhbmR3aWR0aCB0byBjYWxjdWxhdGU6DQo+
IC0gKiAtIHNhbXBsZV9yYXRlID0gYnBsIC8gKGJwcCAvIG51bV9sYW5lcyk7DQo+IC0gKgkgICAg
ICAgICA9IGJwbCAvIChQTExfUkRJViAqIEJJVF9ESVYgKiBQQ0xLX0RJViAqIE1JUElfRElWIC8g
bnVtX2xhbmVzKTsNCj4gLSAqDQo+IC0gKiAtIG1pcGlfc2NsayAgID0gYnBsIC8gTUlQSV9ESVYg
LyAyOyAoIC8gMiBpcyBmb3IgQ1NJLTIgRERSKQ0KPiAtICoNCj4gLSAqIHdpdGggdGhlc2UgZml4
ZWQgcGFyYW1ldGVyczoNCj4gLSAqCVBMTF9SRElWCT0gMjsNCj4gLSAqCUJJVF9ESVZJREVSCT0g
MjsgKE1JUElfQklUX01PREUgPT0gOCA/IDIgOiAyLDUpOw0KPiAtICoJUENMS19ESVYJPSAxOw0K
PiAtICoNCj4gLSAqIFRoZSBNSVBJIGNsb2NrIGdlbmVyYXRpb24gZGlmZmVycyBmb3IgbW9kZXMg
dGhhdCB1c2UgdGhlIHNjYWxlciBhbmQgbW9kZXMNCj4gLSAqIHRoYXQgZG8gbm90LiBJbiBjYXNl
IHRoZSBzY2FsZXIgaXMgaW4gdXNlLCB0aGUgTUlQSV9TQ0xLIGdlbmVyYXRlcyB0aGUgTUlQSQ0K
PiAtICogQklUIENMaywgYW5kIHRodXM6DQo+IC0gKg0KPiAtICogLSBtaXBpX3NjbGsgPSBicGwg
LyBNSVBJX0RJViAvIDI7DQo+IC0gKiAgIE1JUElfRElWID0gMTsNCj4gLSAqDQo+IC0gKiBGb3Ig
bW9kZXMgdGhhdCBkbyBub3QgZ28gdGhyb3VnaCB0aGUgc2NhbGVyLCB0aGUgTUlQSSBCSVQgQ0xP
Q0sgaXMgZ2VuZXJhdGVkDQo+IC0gKiBmcm9tIHRoZSBwaXhlbCBjbG9jaywgYW5kIHRodXM6DQo+
IC0gKg0KPiAtICogLSBzYW1wbGVfcmF0ZSA9IGJwbCAvIChicHAgLyBudW1fbGFuZXMpOw0KPiAt
ICoJICAgICAgICAgPSBicGwgLyAoMiAqIDIgKiAxICogTUlQSV9ESVYgLyBudW1fbGFuZXMpOw0K
PiAtICoJCSA9IGJwbCAvICg0ICogTUlQSV9ESVYgLyBudW1fbGFuZXMpOw0KPiAtICogLSBNSVBJ
X0RJVgkgPSBicHAgLyAoNCAqIG51bV9sYW5lcyk7DQo+ICsgKiBAcmF0ZTogVGhlIHJlcXVlc3Rl
ZCBiaXRyYXRlIGluIGJpdHMgcGVyIHNlY29uZC4NCj4gICAgKg0KPiAgICAqIEZJWE1FOiB0aGlz
IGhhdmUgYmVlbiB0ZXN0ZWQgd2l0aCAxNmJwcCBhbmQgMiBsYW5lcyBzZXR1cCBvbmx5Lg0KPiAt
ICogTUlQSV9ESVYgaXMgZml4ZWQgdG8gdmFsdWUgMiwgYnV0IGl0IC1taWdodC0gYmUgY2hhbmdl
ZCBhY2NvcmRpbmcgdG8gdGhlDQo+IC0gKiBhYm92ZSBmb3JtdWxhIGZvciBzZXR1cHMgd2l0aCAx
IGxhbmUgb3IgaW1hZ2UgZm9ybWF0cyB3aXRoIGRpZmZlcmVudCBicHAuDQo+IC0gKg0KPiAtICog
RklYTUU6IHRoaXMgZGV2aWF0ZXMgZnJvbSB0aGUgc2Vuc29yIG1hbnVhbCBkb2N1bWVudGF0aW9u
IHdoaWNoIGlzIHF1aXRlDQo+IC0gKiB0aGluIG9uIHRoZSBNSVBJIGNsb2NrIHRyZWUgZ2VuZXJh
dGlvbiBwYXJ0Lg0KPiAgICAqLw0KPiAgIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9taXBpX3BjbGso
c3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwNCj4gICAJCQkJdW5zaWduZWQgbG9uZyByYXRlKQ0K
PiAgIHsNCj4gLQljb25zdCBzdHJ1Y3Qgb3Y1NjQwX21vZGVfaW5mbyAqbW9kZSA9IHNlbnNvci0+
Y3VycmVudF9tb2RlOw0KPiArCXU4IGJpdF9kaXYsIG1pcGlfZGl2LCBwY2xrX2Rpdiwgc2Nsa19k
aXYsIHNjbGsyeF9kaXYsIHJvb3RfZGl2Ow0KPiAgIAl1OCBwcmVkaXYsIG11bHQsIHN5c2RpdjsN
Cj4gLQl1OCBtaXBpX2RpdjsNCj4gKwl1bnNpZ25lZCBsb25nIGxpbmtfZnJlcTsNCj4gKwl1bnNp
Z25lZCBsb25nIHN5c2NsazsNCj4gKwl1OCBwY2xrX3BlcmlvZDsNCj4gICAJaW50IHJldDsNCj4g
DQo+ICAgCS8qDQo+IC0JICogMTI4MHg3MjAgaXMgcmVwb3J0ZWQgdG8gdXNlICdTVUJTQU1QTElO
Rycgb25seSwNCj4gLQkgKiBidXQgYWNjb3JkaW5nIHRvIHRoZSBzZW5zb3IgbWFudWFsIGl0IGdv
ZXMgdGhyb3VnaCB0aGUNCj4gLQkgKiBzY2FsZXIgYmVmb3JlIHN1YnNhbXBsaW5nLg0KPiArCSAq
IFRoZSAncmF0ZScgcGFyYW1ldGVyIGlzIHRoZSBiaXRyYXRlID0gVlRPVCAqIEhUT1QgKiBGUFMg
KiBCUFANCj4gKwkgKg0KPiArCSAqIEFkanVzdCBpdCB0byByZXByZXNlbnQgdGhlIENTSS0yIGxp
bmsgZnJlcXVlbmN5IGFuZCB1c2UgaXQgdG8NCj4gKwkgKiB1cGRhdGUgdGhlIGFzc29jaWF0ZWQg
Y29udHJvbC4NCj4gICAJICovDQo+IC0JaWYgKG1vZGUtPmRuX21vZGUgPT0gU0NBTElORyB8fA0K
PiAtCSAgIChtb2RlLT5pZCA9PSBPVjU2NDBfTU9ERV83MjBQXzEyODBfNzIwKSkNCj4gLQkJbWlw
aV9kaXYgPSBPVjU2NDBfTUlQSV9ESVZfU0NMSzsNCj4gKwlsaW5rX2ZyZXEgPSByYXRlIC8gc2Vu
c29yLT5lcC5idXMubWlwaV9jc2kyLm51bV9kYXRhX2xhbmVzIC8gMjsNCg0KZnJhbWVyYXRlIGlz
IGJyb2tlbiwgaXQgaXMgYWxtb3N0IDIgdGltZXMgZ3JlYXRlciB0aGF0IGV4cGVjdGVkLiANCkNo
ZWNraW5nIGNvZGUgaXQgc2VlbXMgdGhhdCBtaXBpX2RpdiBpcyBtaXNzaW5nIHdoZW4gY29tcHV0
aW5nIGxpbmtfZnJlcToNCg0KLQlsaW5rX2ZyZXEgPSByYXRlIC8gc2Vuc29yLT5lcC5idXMubWlw
aV9jc2kyLm51bV9kYXRhX2xhbmVzIC8gMjsNCisJbGlua19mcmVxID0gcmF0ZSAvIHNlbnNvci0+
ZXAuYnVzLm1pcGlfY3NpMi5udW1fZGF0YV9sYW5lcyAvIDIgLyBtaXBpX2RpdjsNCg0KVG8gdGVz
dCB0aGUgc2V0dXAgSSBoYXZlIHBhdGNoZWQgdGhlIGxpbmsgZnJlcXVlbmN5IGNvbnRyb2wgdG8g
cmVwb3J0IA0KZHluYW1pY2FsbHkgdGhlIGZyZXF1ZW5jeSBpbnN0ZWFkIG9mIGhhcmRjb2RlZCB2
YWx1ZToNCisjaWYgMA0KICAJZnJlcV9pbmRleCA9IE9WNTY0MF9MSU5LX0ZSRVFTX05VTSAtIDE7
DQogIAlmb3IgKGkgPSAwOyBpIDwgT1Y1NjQwX0xJTktfRlJFUVNfTlVNOyArK2kpIHsNCiAgCQlp
ZiAob3Y1NjQwX2xpbmtfZnJlcXNbaV0gPT0gbGlua19mcmVxKSB7DQpAQCAtOTY2LDE4ICs5Nzks
MTIgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X21pcGlfcGNsayhzdHJ1Y3Qgb3Y1NjQwX2RldiAN
CipzZW5zb3IsDQogIAlyZXQgPSBfX3Y0bDJfY3RybF9zX2N0cmwoc2Vuc29yLT5jdHJscy5saW5r
X2ZyZXEsIGZyZXFfaW5kZXgpOw0KICAJaWYgKHJldCA8IDApDQogIAkJcmV0dXJuIHJldDsNCisj
ZWxzZQ0KKwlvdjU2NDBfbGlua19mcmVxc1swXSA9IGxpbmtfZnJlcTsNCisJcmV0ID0gX192NGwy
X2N0cmxfc19jdHJsKHNlbnNvci0+Y3RybHMubGlua19mcmVxLCAwKTsNCisjZW5kaWYNCg0KPiAr
DQo+ICsJLyoNCj4gKwkgKiAtIG1pcGlfZGl2IC0gQXNzdW1wdGlvbnMgbm90IHN1cHBvcnRlZCBi
eSBkb2N1bWVudGF0aW9uDQo+ICsJICoNCj4gKwkgKiAgIFRoZSBNSVBJIGNsb2NrIGdlbmVyYXRp
b24gZGlmZmVycyBmb3IgbW9kZXMgdGhhdCB1c2UgdGhlIHNjYWxlciBhbmQNCj4gKwkgKiAgIG1v
ZGVzIHRoYXQgZG8gbm90Lg0KPiArCSAqLw0KPiArCWlmIChzZW5zb3ItPmN1cnJlbnRfbW9kZS0+
ZG5fbW9kZSA9PSBTQ0FMSU5HKQ0KPiArCQltaXBpX2RpdiA9IDE7DQo+ICAgCWVsc2UNCj4gLQkJ
bWlwaV9kaXYgPSBPVjU2NDBfTUlQSV9ESVZfUENMSzsNCj4gKwkJbWlwaV9kaXYgPSAyOw0KPiAr
DQo+ICsJc3lzY2xrID0gbGlua19mcmVxICogMiAqIG1pcGlfZGl2Ow0KPiArCW92NTY0MF9jYWxj
X3N5c19jbGsoc2Vuc29yLCBzeXNjbGssICZwcmVkaXYsICZtdWx0LCAmc3lzZGl2KTsNCj4gKw0K
PiArCS8qDQo+ICsJICogQWRqdXN0IFBMTCBwYXJhbWV0ZXJzIHRvIG1haW50YWluIHRoZSBNSVBJ
X1NDTEstdG8tUENMSyByYXRpbzsNCj4gKwkgKg0KPiArCSAqIC0gcm9vdF9kaXYgPSAyIChmaXhl
ZCkNCj4gKwkgKiAtIGJpdF9kaXYgOiBNSVBJIDgtYml0ID0gMg0KPiArCSAqCSAgICAgICBNSVBJ
IDEwLWJpdCA9IDIsNQ0KPiArCSAqIC0gcGNsa19kaXYgPSAxIChmaXhlZCkNCj4gKwkgKiAtIHBs
bF9kaXYgID0gKDIgbGFuZXMgPyBtaXBpX2RpdiA6IDIgKiBtaXBpX2RpdikNCj4gKwkgKiAgIDIg
bGFuZXM6IE1JUElfU0NMSyA9ICg0IG9yIDUpICogUENMSw0KPiArCSAqICAgMSBsYW5lczogTUlQ
SV9TQ0xLID0gKDggb3IgMTApICogUENMSw0KPiArCSAqDQo+ICsJICogVE9ETzogc3VwcG9ydCAx
MC1iaXQgZm9ybWF0cw0KPiArCSAqIFRPRE86IHN1cHBvcnQgMSBsYW5lDQo+ICsJICovDQo+ICsJ
cm9vdF9kaXYgPSBPVjU2NDBfUExMX0NUUkwzX1BMTF9ST09UX0RJVl8yOw0KPiArCWJpdF9kaXYg
PSAgT1Y1NjQwX1BMTF9DVFJMMF9NSVBJX01PREVfOEJJVDsNCj4gKwlwY2xrX2RpdiA9IE9WNTY0
MF9QTExfU1lTX1JPT1RfRElWSURFUl9CWVBBU1M7DQo+IA0KPiAtCW92NTY0MF9jYWxjX3N5c19j
bGsoc2Vuc29yLCByYXRlLCAmcHJlZGl2LCAmbXVsdCwgJnN5c2Rpdik7DQo+ICsJLyoNCj4gKwkg
KiBTY2FsZXIgY2xvY2s6DQo+ICsJICogLSBZVVY6IFBDTEsgPj0gMiAqIFNDTEsNCj4gKwkgKiAt
IFJBVyBvciBKUEVHOiBQQ0xLID49IFNDTEsNCj4gKwkgKiAtIHNjbGsyeF9kaXYgPSBzY2xrX2Rp
diAvIDINCj4gKwkgKg0KPiArCSAqIFRPRE86IGFkZCBzdXBwb3J0IGZvciBSQVcgYW5kIEpQRUcg
bW9kZXMuIFRvIG1haW50YWluIHRoZQ0KPiArCSAqIFNDTEsgdG8gUENMSyByYXRpbywgdGhlIHNj
bGtfZGl2IHNob3VsZCBwcm9iYWJseSBiZQ0KPiArCSAqIGFkanVzdGVkLg0KPiArCSAqLw0KPiAr
CXNjbGtfZGl2ID0gaWxvZzIoT1Y1NjQwX1NDTEtfUk9PVF9ESVYpOw0KPiArCXNjbGsyeF9kaXYg
PSBpbG9nMihPVjU2NDBfU0NMSzJYX1JPT1RfRElWKTsNCj4gKw0KPiArCS8qDQo+ICsJICogVGhp
cyBpcyBjYWxsZWQgcGNsayBwZXJpb2QsIGJ1dCBpdCBhY3R1YWxseSByZXByZXNlbnRzIHRoZQ0K
PiArCSAqIHNhbXBsZSBwZXJpb2QgZXhwcmVzc2VkIGluIG5zIHdpdGggMS1iaXQgZGVjaW1hbCAo
MHgwMT0wLjVucykuDQo+ICsJICoNCj4gKwkgKiAtIHBjbGsgPSBsaW5rX2ZyZXEgKiAyICogbGFu
ZXMgLyBicHANCj4gKwkgKg0KPiArCSAqIFRPRE86IHN1cHBvcnQgMSBkYXRhIGxhbmU7IHN1cHBv
cnQgbW9kZXMgd2l0aCBicHAgIT0gMTYuDQo+ICsJICovDQo+ICsJcGNsa19wZXJpb2QgPSAyMDAw
MDAwMDAwVUwgLyAobGlua19mcmVxIC8gMik7DQo+IA0KPiArCS8qIFByb2dyYW0gdGhlIGNsb2Nr
IHRyZWUgcmVnaXN0ZXJzLiAqLw0KPiAgIAlyZXQgPSBvdjU2NDBfbW9kX3JlZyhzZW5zb3IsIE9W
NTY0MF9SRUdfU0NfUExMX0NUUkwwLA0KPiAtCQkJICAgICAweDBmLCBPVjU2NDBfUExMX0NUUkww
X01JUElfTU9ERV84QklUKTsNCj4gKwkJCSAgICAgMHgwZiwgYml0X2Rpdik7DQo+ICsJaWYgKHJl
dCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gDQo+ICAgCXJldCA9IG92NTY0MF9tb2RfcmVnKHNlbnNv
ciwgT1Y1NjQwX1JFR19TQ19QTExfQ1RSTDEsDQo+ICAgCQkJICAgICAweGZmLCBzeXNkaXYgPDwg
NCB8IG1pcGlfZGl2KTsNCj4gQEAgLTk5MSwxMiArMTAxMywxNiBAQCBzdGF0aWMgaW50IG92NTY0
MF9zZXRfbWlwaV9wY2xrKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsDQo+ICAgCQlyZXR1cm4g
cmV0Ow0KPiANCj4gICAJcmV0ID0gb3Y1NjQwX21vZF9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1ND
X1BMTF9DVFJMMywNCj4gLQkJCSAgICAgMHgxZiwgT1Y1NjQwX1BMTF9DVFJMM19QTExfUk9PVF9E
SVZfMiB8IHByZWRpdik7DQo+ICsJCQkgICAgIDB4MWYsIHJvb3RfZGl2IHwgcHJlZGl2KTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0ID0gb3Y1NjQwX21vZF9y
ZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1NZU19ST09UX0RJVklERVIsIDB4M2YsDQo+ICsJCQkgICAg
ICAocGNsa19kaXYgPDwgNCkgfCAoc2NsazJ4X2RpdiA8PCAyKSB8IHNjbGtfZGl2KTsNCj4gICAJ
aWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+IA0KPiAtCXJldHVybiBvdjU2NDBfbW9kX3Jl
ZyhzZW5zb3IsIE9WNTY0MF9SRUdfU1lTX1JPT1RfRElWSURFUiwNCj4gLQkJCSAgICAgIDB4MzAs
IE9WNTY0MF9QTExfU1lTX1JPT1RfRElWSURFUl9CWVBBU1MpOw0KPiArCXJldHVybiBvdjU2NDBf
d3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QQ0xLX1BFUklPRCwgcGNsa19wZXJpb2QpOw0K
PiAgIH0NCj4gDQo+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgb3Y1NjQwX2NhbGNfcGNsayhzdHJ1
Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLA0KPiBAQCAtMTc3NSw3ICsxODAxLDYgQEAgc3RhdGljIGlu
dCBvdjU2NDBfc2V0X21vZGUoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvcikNCj4gICAJICovDQo+
ICAgCXJhdGUgPSBvdjU2NDBfY2FsY19waXhlbF9yYXRlKHNlbnNvcikgKiAxNjsNCj4gICAJaWYg
KHNlbnNvci0+ZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0NTSTJfRFBIWSkgew0KPiAtCQlyYXRl
ID0gcmF0ZSAvIHNlbnNvci0+ZXAuYnVzLm1pcGlfY3NpMi5udW1fZGF0YV9sYW5lczsNCj4gICAJ
CXJldCA9IG92NTY0MF9zZXRfbWlwaV9wY2xrKHNlbnNvciwgcmF0ZSk7DQo+ICAgCX0gZWxzZSB7
DQo+ICAgCQlyYXRlID0gcmF0ZSAvIHNlbnNvci0+ZXAuYnVzLnBhcmFsbGVsLmJ1c193aWR0aDsN
Cj4gLS0NCj4gMi4yOC4wDQo+IA0KDQpCUiwNCkh1Z3Vlcy4=
