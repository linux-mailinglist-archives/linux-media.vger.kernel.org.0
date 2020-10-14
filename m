Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E486328DF49
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 12:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729830AbgJNKpM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 06:45:12 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:41850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbgJNKpL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 06:45:11 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09EAh9Lw019937;
        Wed, 14 Oct 2020 12:43:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ecOelpSBGEEQOBA7CraIE87FEegexzTRyWZKnUVJtU0=;
 b=AV2h70z8X48oSxSNQ5yczg4FoAcHwN4yo0OhkUXOHvQhqz0hWxqkd50tztOR9LFqo4Pk
 B0cveBL4B4Y6yr2mXHlBu9pO+e8VwRf3a0+WnkfgLlV3tuGgjnzdTnjbcTc1P9xUGzHO
 gvIIAR9WVO21vK3U9wyW1ZkAd1k7JHZRvPvQ1b7V44HDWl4tsZhuCWiiUnv0fRT4JIUk
 uyn1WRFhGyK1viJ2A5ff303vOIyKz7/Hzm7xzvrA1Aqt3nHPXFNMP4JRHC/JLrZfgCYj
 /Ji/wrYN65lUiL4hrluhHc2lv9IZCO0h3yRUE32Y1N2a3h37jq0gggkHO44S8Wu1d3WC rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34356ed0yd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 12:43:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87DB810002A;
        Wed, 14 Oct 2020 12:43:41 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 330322B53E0;
        Wed, 14 Oct 2020 12:43:41 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct
 2020 12:43:40 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Wed, 14 Oct 2020 12:43:40 +0200
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Alain VOLMAT <alain.volmat@st.com>
Subject: Re: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Thread-Topic: [PATCH v2] media: ov5640: fix support of BT656 bus mode
Thread-Index: AQHWoKc05b6XwNbbukilsBYWkG/VOqmV/N4AgADODgA=
Date:   Wed, 14 Oct 2020 10:43:40 +0000
Message-ID: <bca05e8d-461f-87d5-67e6-c02877b16edb@st.com>
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
 <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com>
In-Reply-To: <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D82C7A708A3A8C46AFC366BC561E2AC9@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_07:2020-10-14,2020-10-14 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUHJhYmhha2FyLA0KDQpPbiAxMC8xNC8yMCAxMjoyNiBBTSwgTGFkLCBQcmFiaGFrYXIgd3Jv
dGU6DQo+IEhpIEh1Z3VlcywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgY2F0Y2hpbmcgdGhlIHBvbGFy
aXR5IGJ1Zy4NClkncmUgd2VsY29tZS4NCg0KPiANCj4gT24gTW9uLCBPY3QgMTIsIDIwMjAgYXQg
Mzo1NSBQTSBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAc3QuY29tPiB3cm90ZToNCj4+
DQo+PiBGaXggUENMSyBwb2xhcml0eSBub3QgYmVpbmcgdGFrZW4gaW50byBhY2NvdW50Lg0KPj4g
QWRkIGNvbW1lbnRzIGFib3V0IEJUNjU2IHJlZ2lzdGVyIGNvbnRyb2wuDQo+PiBSZW1vdmUgdXNl
bGVzcyBvdjU2NDBfc2V0X3N0cmVhbV9idDY1NigpIGZ1bmN0aW9uLg0KPj4gUmVmaW5lIGNvbW1l
bnRzIGFib3V0IE1JUEkgSU8gcmVnaXN0ZXIgY29udHJvbC4NCj4+DQo+PiBGaXhlczogNDAzOWIw
MzcyMGY3ICgibWVkaWE6IGkyYzogb3Y1NjQwOiBBZGQgc3VwcG9ydCBmb3IgQlQ2NTYgbW9kZSIp
DQo+PiBTaWduZWQtb2ZmLWJ5OiBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVzLmZydWNoZXRAc3QuY29t
Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIHwgNzcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgNDUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5jIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMN
Cj4+IGluZGV4IDhkMDI1NGQuLmMwZWJmNGMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlh
L2kyYy9vdjU2NDAuYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y1NjQwLmMNCj4+IEBA
IC0xMjE2LDIwICsxMjE2LDYgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X2F1dG9nYWluKHN0cnVj
dCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQklUKDEpLCBvbiA/IDAgOiBCSVQoMSkpOw0KPj4gICB9DQo+Pg0KPj4gLXN0YXRp
YyBpbnQgb3Y1NjQwX3NldF9zdHJlYW1fYnQ2NTYoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwg
Ym9vbCBvbikNCj4+IC17DQo+PiAtICAgICAgIGludCByZXQ7DQo+PiAtDQo+PiAtICAgICAgIHJl
dCA9IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0NDSVI2NTZfQ1RSTDAwLA0K
Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9uID8gMHgxIDogMHgwMCk7DQo+PiAt
ICAgICAgIGlmIChyZXQpDQo+PiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+IC0NCj4+
IC0gICAgICAgcmV0dXJuIG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1NZU19D
VFJMMCwgb24gPw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVjU2NDBfUkVH
X1NZU19DVFJMMF9TV19QV1VQIDoNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
T1Y1NjQwX1JFR19TWVNfQ1RSTDBfU1dfUFdETik7DQo+PiAtfQ0KPj4gLQ0KPj4gICBzdGF0aWMg
aW50IG92NTY0MF9zZXRfc3RyZWFtX2R2cChzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBib29s
IG9uKQ0KPj4gICB7DQo+PiAgICAgICAgICByZXR1cm4gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3Is
IE9WNTY0MF9SRUdfU1lTX0NUUkwwLCBvbiA/DQo+PiBAQCAtMTk5NCw2ICsxOTgwLDcgQEAgc3Rh
dGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX21pcGkoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwg
Ym9vbCBvbikNCj4+ICAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1
NjQwX2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4gICB7DQo+PiAgICAgICAgICB1bnNpZ25lZCBp
bnQgZmxhZ3MgPSBzZW5zb3ItPmVwLmJ1cy5wYXJhbGxlbC5mbGFnczsNCj4+ICsgICAgICAgYm9v
bCBidDY1NiA9IHNlbnNvci0+ZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2Ow0KPj4gICAg
ICAgICAgdTggcGNsa19wb2wgPSAwOw0KPj4gICAgICAgICAgdTggaHN5bmNfcG9sID0gMDsNCj4+
ICAgICAgICAgIHU4IHZzeW5jX3BvbCA9IDA7DQo+PiBAQCAtMjAwMSw2ICsxOTg4LDcgQEAgc3Rh
dGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29yLCBi
b29sIG9uKQ0KPj4NCj4+ICAgICAgICAgIGlmICghb24pIHsNCj4+ICAgICAgICAgICAgICAgICAg
LyogUmVzZXQgc2V0dGluZ3MgdG8gdGhlaXIgZGVmYXVsdCB2YWx1ZXMuICovDQo+PiArICAgICAg
ICAgICAgICAgb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfQ0NJUjY1Nl9DVFJM
MDAsIDB4MDApOw0KPj4gICAgICAgICAgICAgICAgICBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwg
T1Y1NjQwX1JFR19JT19NSVBJX0NUUkwwMCwgMHg1OCk7DQo+PiAgICAgICAgICAgICAgICAgIG92
NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BPTEFSSVRZX0NUUkwwMCwgMHgyMCk7
DQo+PiAgICAgICAgICAgICAgICAgIG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVH
X1BBRF9PVVRQVVRfRU5BQkxFMDEsIDB4MDApOw0KPj4gQEAgLTIwMjQsMjMgKzIwMTIsNTEgQEAg
c3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1NjQwX2RldiAqc2Vuc29y
LCBib29sIG9uKQ0KPj4gICAgICAgICAgICogLSBWU1lOQzogICAgIGFjdGl2ZSBoaWdoDQo+PiAg
ICAgICAgICAgKiAtIEhSRUY6ICAgICAgYWN0aXZlIGxvdw0KPj4gICAgICAgICAgICogLSBQQ0xL
OiAgICAgIGFjdGl2ZSBsb3cNCj4+ICsgICAgICAgICoNCj4+ICsgICAgICAgICogVlNZTkMgJiBI
UkVGIGFyZSBub3QgY29uZmlndXJlZCBpZiBCVDY1NiBidXMgbW9kZSBpcyBzZWxlY3RlZA0KPj4g
ICAgICAgICAgICovDQo+PiArDQo+PiAgICAgICAgICAvKg0KPj4gLSAgICAgICAgKiBjb25maWd1
cmUgcGFyYWxsZWwgcG9ydCBjb250cm9sIGxpbmVzIHBvbGFyaXR5DQo+PiArICAgICAgICAqIEJU
NjU2IGVtYmVkZGVkIHN5bmNocm9uaXphdGlvbiBjb25maWd1cmF0aW9uDQo+PiAgICAgICAgICAg
Kg0KPj4gLSAgICAgICAgKiBQT0xBUklUWSBDVFJMMA0KPj4gLSAgICAgICAgKiAtIFs1XTogICAg
ICAgUENMSyBwb2xhcml0eSAoMDogYWN0aXZlIGxvdywgMTogYWN0aXZlIGhpZ2gpDQo+PiAtICAg
ICAgICAqIC0gWzFdOiAgICAgICBIUkVGIHBvbGFyaXR5ICgwOiBhY3RpdmUgbG93LCAxOiBhY3Rp
dmUgaGlnaCkNCj4+IC0gICAgICAgICogLSBbMF06ICAgICAgIFZTWU5DIHBvbGFyaXR5IChtaXNt
YXRjaCBoZXJlIGJldHdlZW4NCj4+IC0gICAgICAgICogICAgICAgICAgICAgIGRhdGFzaGVldCBh
bmQgaGFyZHdhcmUsIDAgaXMgYWN0aXZlIGhpZ2gNCj4+IC0gICAgICAgICogICAgICAgICAgICAg
IGFuZCAxIGlzIGFjdGl2ZSBsb3cuLi4pDQo+PiArICAgICAgICAqIENDSVI2NTYgQ1RSTDAwDQo+
PiArICAgICAgICAqIC0gWzddOiAgICAgICBTWU5DIGNvZGUgc2VsZWN0aW9uICgwOiBhdXRvIGdl
bmVyYXRlIHN5bmMgY29kZSwNCj4+ICsgICAgICAgICogICAgICAgICAgICAgIDE6IHN5bmMgY29k
ZSBmcm9tIHJlZ3MgMHg0NzMyLTB4NDczNSkNCj4+ICsgICAgICAgICogLSBbNl06ICAgICAgIGYg
dmFsdWUgaW4gQ0NJUjY1NiBTWU5DIGNvZGUgd2hlbiBmaXhlZCBmIHZhbHVlDQo+PiArICAgICAg
ICAqIC0gWzVdOiAgICAgICBGaXhlZCBmIHZhbHVlDQo+PiArICAgICAgICAqIC0gWzQ6M106ICAg
ICBCbGFuayB0b2dnbGUgZGF0YSBvcHRpb25zICgwMDogZGF0YT0xJ2gwNDAvMSdoMjAwLA0KPj4g
KyAgICAgICAgKiAgICAgICAgICAgICAgMDE6IGRhdGEgZnJvbSByZWdzIDB4NDczNi0weDQ3Mzgs
IDEwOiBhbHdheXMga2VlcCAwKQ0KPj4gKyAgICAgICAgKiAtIFsxXTogICAgICAgQ2xpcCBkYXRh
IGRpc2FibGUNCj4+ICsgICAgICAgICogLSBbMF06ICAgICAgIENDSVI2NTYgbW9kZSBlbmFibGUN
Cj4+ICsgICAgICAgICoNCj4+ICsgICAgICAgICogRGVmYXVsdCBDQ0lSNjU2IFNBVi9FQVYgbW9k
ZSB3aXRoIGRlZmF1bHQgY29kZXMNCj4+ICsgICAgICAgICogU0FWPTB4ZmYwMDAwODAgJiBFQVY9
MHhmZjAwMDA5ZCBpcyBlbmFibGVkIGhlcmUgd2l0aCBzZXR0aW5nczoNCj4+ICsgICAgICAgICog
LSBDQ0lSNjU2IG1vZGUgZW5hYmxlDQo+PiArICAgICAgICAqIC0gYXV0byBnZW5lcmF0aW9uIG9m
IHN5bmMgY29kZXMNCj4+ICsgICAgICAgICogLSBibGFuayB0b2dnbGUgZGF0YSAxJ2gwNDAvMSdo
MjAwDQo+PiArICAgICAgICAqIC0gY2xpcCByZXNlcnZlZCBkYXRhICgweDAwICYgMHhmZiBjaGFu
Z2VkIHRvIDB4MDEgJiAweGZlKQ0KPj4gICAgICAgICAgICovDQo+PiAtICAgICAgIGlmIChzZW5z
b3ItPmVwLmJ1c190eXBlID09IFY0TDJfTUJVU19QQVJBTExFTCkgew0KPj4gKyAgICAgICByZXQg
PSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19DQ0lSNjU2X0NUUkwwMCwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidDY1NiA/IDB4MDEgOiAweDAwKTsNCj4g
RGlkIHlvdSB0ZXN0IGJ0NjU2IG9uIHlvdXIgcGxhdGZvcm0gPyB3aXRoIHRoZXNlIGNoYW5nZXMg
QlQuNjU2IG1vZGUNCj4gZG9lc24ndCB3b3JrIGFueW1vcmUgb24gbXkgcGxhdGZvcm0uIFdpdGgg
dGhlIGJlbG93IGRpZmYgb24gdG9wIG9mDQo+IHlvdXIgcGF0Y2ggaXQgd29ya3MgT0suIENvdWxk
IHlvdSBwbGVhc2UgdGVzdCB0aGUgc2FtZSB3b3JrcyBvbiB5b3VyDQo+IHBsYXRmb3JtLg0KDQpZ
ZXMgb2YgY291cnNlLCB0ZXN0ZWQgb24gU1RNMzJNUDEgZXZhbHVhdGlvbiBib2FyZCB3aXRoIE9W
NTY0MC9wYXJhbGxlbCANCnNldHVwIChzdG0zMi1kY21pIGNhcHR1cmUgZHJpdmVyKS4gU2V2ZXJh
bCBjYXB0dXJlcyBtYWRlLCBubyBpc3N1ZXMuDQoNClNvIGluIHNob3J0IHlvdSBoYXZlIHRvIG1v
dmUgdGhlIENDSVI2NTYgbW9kZSBlbmFibGUgZnJvbSBzZXRfcG93ZXIoKSB0byANCnNldF9zdHJl
YW0oKSwgdGhpcyBpcyBzaW1pbGFyIHRvIGNoYW5nZXMgeW91J3ZlIG1hZGUgaW4gY29kZSByZWNl
bnRseQ0KYXJvdW5kIE9WNTY0MF9SRUdfU1lTX0NUUkwwICYgU1dfUFdVUC9ET1dOLCBidXQgdGhl
IHJlYXNvbiB0byBkbyB0aGF0IGlzIA0Kc3RpbGwgbm90IHVuZGVyc3Rvb2QsIGF0IGxlYXN0IG9u
IG15IHNpZGUuDQpNeSB1bmRlcnN0YW5kaW5nIHJlYWRpbmcgeW91ciBwYXRjaCB3YXMgdGhhdCBP
VjU2NDBfUkVHX1NZU19DVFJMMCAtPiANClNXX1BXVVAgdHJpZ3MgdGhlIHJlYWwgInN0cmVhbSBv
biIgb2YgdGhlIHNlbnNvciBhbmQgb25seSBhdCB0aGF0IHRpbWUgDQp0aGUgZGF0YSBhcmUgcHJv
ZHVjZWQgYnkgc2Vuc29yLCBidXQgaWYgdGhpcyBpcyB0cnVlLCB3aHkgZG8gd2UgbmVlZCB0byAN
CmVuYWJsZSBDQ0lSNjU2IHJpZ2h0IGJlZm9yZSBTV19QV1VQIGluc3RlYWQgb2YgZW5hYmxpbmcg
aXQgd2l0aCBvdGhlciANCkRWUCBzZXR0aW5ncyAoRFZQIGVuYWJsZSBhbmQgc28gb24uLi4pID8g
VGhpcyBpcyBub3QgbG9naWNhbC4NCg0KSSB0aGluayB0aGF0IHdlIGhhdmUgdG8gdW5kZXJzdGFu
ZCB3aGF0IGhhcHBlbnMgb24geW91ciBzaWRlIGJlZm9yZSANCmdvaW5nIHRvIG1vcmUgY2hhbmdl
cyBvbiB0aGlzIGFscmVhZHkgc28gY29tcGxleCBkcml2ZXIuDQoNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL292NTY0MC5j
DQo+IGluZGV4IDQ5ZTczYWNlODY4NS4uYzVlNDViYzE3YmRmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL21lZGlhL2kyYy9vdjU2NDAuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjU2NDAu
Yw0KPiBAQCAtMTk3Nyw2ICsxOTc3LDQwIEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9wb3dlcl9t
aXBpKHN0cnVjdA0KPiBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+ICAgICAgICAgIHJl
dHVybiAwOw0KPiAgIH0NCj4gDQo+ICtzdGF0aWMgaW50IG92NTY0MF9zZXRfc3RyZWFtX2J0NjU2
KHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+ICt7DQo+ICsgICAgICAgaW50
IHJldDsNCj4gKw0KPiArICAgICAgIC8qDQo+ICsgICAgICAgICogQlQ2NTYgZW1iZWRkZWQgc3lu
Y2hyb25pemF0aW9uIGNvbmZpZ3VyYXRpb24NCj4gKyAgICAgICAgKg0KPiArICAgICAgICAqIEND
SVI2NTYgQ1RSTDAwDQo+ICsgICAgICAgICogLSBbN106ICAgICAgIFNZTkMgY29kZSBzZWxlY3Rp
b24gKDA6IGF1dG8gZ2VuZXJhdGUgc3luYyBjb2RlLA0KPiArICAgICAgICAqICAgICAgICAgICAg
ICAxOiBzeW5jIGNvZGUgZnJvbSByZWdzIDB4NDczMi0weDQ3MzUpDQo+ICsgICAgICAgICogLSBb
Nl06ICAgICAgIGYgdmFsdWUgaW4gQ0NJUjY1NiBTWU5DIGNvZGUgd2hlbiBmaXhlZCBmIHZhbHVl
DQo+ICsgICAgICAgICogLSBbNV06ICAgICAgIEZpeGVkIGYgdmFsdWUNCj4gKyAgICAgICAgKiAt
IFs0OjNdOiAgICAgQmxhbmsgdG9nZ2xlIGRhdGEgb3B0aW9ucyAoMDA6IGRhdGE9MSdoMDQwLzEn
aDIwMCwNCj4gKyAgICAgICAgKiAgICAgICAgICAgICAgMDE6IGRhdGEgZnJvbSByZWdzIDB4NDcz
Ni0weDQ3MzgsIDEwOiBhbHdheXMga2VlcCAwKQ0KPiArICAgICAgICAqIC0gWzFdOiAgICAgICBD
bGlwIGRhdGEgZGlzYWJsZQ0KPiArICAgICAgICAqIC0gWzBdOiAgICAgICBDQ0lSNjU2IG1vZGUg
ZW5hYmxlDQo+ICsgICAgICAgICoNCj4gKyAgICAgICAgKiBEZWZhdWx0IENDSVI2NTYgU0FWL0VB
ViBtb2RlIHdpdGggZGVmYXVsdCBjb2Rlcw0KPiArICAgICAgICAqIFNBVj0weGZmMDAwMDgwICYg
RUFWPTB4ZmYwMDAwOWQgaXMgZW5hYmxlZCBoZXJlIHdpdGggc2V0dGluZ3M6DQo+ICsgICAgICAg
ICogLSBDQ0lSNjU2IG1vZGUgZW5hYmxlDQo+ICsgICAgICAgICogLSBhdXRvIGdlbmVyYXRpb24g
b2Ygc3luYyBjb2Rlcw0KPiArICAgICAgICAqIC0gYmxhbmsgdG9nZ2xlIGRhdGEgMSdoMDQwLzEn
aDIwMA0KPiArICAgICAgICAqIC0gY2xpcCByZXNlcnZlZCBkYXRhICgweDAwICYgMHhmZiBjaGFu
Z2VkIHRvIDB4MDEgJiAweGZlKQ0KPiArICAgICAgICAqLw0KPiArICAgICAgIHJldCA9IG92NTY0
MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0NDSVI2NTZfQ1RSTDAwLA0KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb24gPyAweDEgOiAweDAwKTsNCj4gKyAgICAgICBpZiAo
cmV0KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiArICAgICAgIHJldHVy
biBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19TWVNfQ1RSTDAsIG9uID8NCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVjU2NDBfUkVHX1NZU19DVFJMMF9TV19Q
V1VQIDoNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBPVjU2NDBfUkVHX1NZU19D
VFJMMF9TV19QV0ROKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9wb3dl
cl9kdnAoc3RydWN0IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICB7DQo+ICAgICAg
ICAgIHVuc2lnbmVkIGludCBmbGFncyA9IHNlbnNvci0+ZXAuYnVzLnBhcmFsbGVsLmZsYWdzOw0K
PiBAQCAtMjAxNCwzMSArMjA0OCw2IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3NldF9wb3dlcl9kdnAo
c3RydWN0DQo+IG92NTY0MF9kZXYgKnNlbnNvciwgYm9vbCBvbikNCj4gICAgICAgICAgICogVlNZ
TkMgJiBIUkVGIGFyZSBub3QgY29uZmlndXJlZCBpZiBCVDY1NiBidXMgbW9kZSBpcyBzZWxlY3Rl
ZA0KPiAgICAgICAgICAgKi8NCj4gDQo+IC0gICAgICAgLyoNCj4gLSAgICAgICAgKiBCVDY1NiBl
bWJlZGRlZCBzeW5jaHJvbml6YXRpb24gY29uZmlndXJhdGlvbg0KPiAtICAgICAgICAqDQo+IC0g
ICAgICAgICogQ0NJUjY1NiBDVFJMMDANCj4gLSAgICAgICAgKiAtIFs3XTogICAgICAgU1lOQyBj
b2RlIHNlbGVjdGlvbiAoMDogYXV0byBnZW5lcmF0ZSBzeW5jIGNvZGUsDQo+IC0gICAgICAgICog
ICAgICAgICAgICAgIDE6IHN5bmMgY29kZSBmcm9tIHJlZ3MgMHg0NzMyLTB4NDczNSkNCj4gLSAg
ICAgICAgKiAtIFs2XTogICAgICAgZiB2YWx1ZSBpbiBDQ0lSNjU2IFNZTkMgY29kZSB3aGVuIGZp
eGVkIGYgdmFsdWUNCj4gLSAgICAgICAgKiAtIFs1XTogICAgICAgRml4ZWQgZiB2YWx1ZQ0KPiAt
ICAgICAgICAqIC0gWzQ6M106ICAgICBCbGFuayB0b2dnbGUgZGF0YSBvcHRpb25zICgwMDogZGF0
YT0xJ2gwNDAvMSdoMjAwLA0KPiAtICAgICAgICAqICAgICAgICAgICAgICAwMTogZGF0YSBmcm9t
IHJlZ3MgMHg0NzM2LTB4NDczOCwgMTA6IGFsd2F5cyBrZWVwIDApDQo+IC0gICAgICAgICogLSBb
MV06ICAgICAgIENsaXAgZGF0YSBkaXNhYmxlDQo+IC0gICAgICAgICogLSBbMF06ICAgICAgIEND
SVI2NTYgbW9kZSBlbmFibGUNCj4gLSAgICAgICAgKg0KPiAtICAgICAgICAqIERlZmF1bHQgQ0NJ
UjY1NiBTQVYvRUFWIG1vZGUgd2l0aCBkZWZhdWx0IGNvZGVzDQo+IC0gICAgICAgICogU0FWPTB4
ZmYwMDAwODAgJiBFQVY9MHhmZjAwMDA5ZCBpcyBlbmFibGVkIGhlcmUgd2l0aCBzZXR0aW5nczoN
Cj4gLSAgICAgICAgKiAtIENDSVI2NTYgbW9kZSBlbmFibGUNCj4gLSAgICAgICAgKiAtIGF1dG8g
Z2VuZXJhdGlvbiBvZiBzeW5jIGNvZGVzDQo+IC0gICAgICAgICogLSBibGFuayB0b2dnbGUgZGF0
YSAxJ2gwNDAvMSdoMjAwDQo+IC0gICAgICAgICogLSBjbGlwIHJlc2VydmVkIGRhdGEgKDB4MDAg
JiAweGZmIGNoYW5nZWQgdG8gMHgwMSAmIDB4ZmUpDQo+IC0gICAgICAgICovDQo+IC0gICAgICAg
cmV0ID0gb3Y1NjQwX3dyaXRlX3JlZyhzZW5zb3IsIE9WNTY0MF9SRUdfQ0NJUjY1Nl9DVFJMMDAs
DQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidDY1NiA/IDB4MDEgOiAweDAwKTsN
Cj4gLSAgICAgICBpZiAocmV0KQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gLQ0K
PiAgICAgICAgICAvKg0KPiAgICAgICAgICAgKiBjb25maWd1cmUgcGFyYWxsZWwgcG9ydCBjb250
cm9sIGxpbmVzIHBvbGFyaXR5DQo+ICAgICAgICAgICAqDQo+IEBAIC0yOTM1LDYgKzI5NDQsOCBA
QCBzdGF0aWMgaW50IG92NTY0MF9zX3N0cmVhbShzdHJ1Y3QgdjRsMl9zdWJkZXYNCj4gKnNkLCBp
bnQgZW5hYmxlKQ0KPiANCj4gICAgICAgICAgICAgICAgICBpZiAoc2Vuc29yLT5lcC5idXNfdHlw
ZSA9PSBWNEwyX01CVVNfQ1NJMl9EUEhZKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gb3Y1NjQwX3NldF9zdHJlYW1fbWlwaShzZW5zb3IsIGVuYWJsZSk7DQo+ICsgICAgICAgICAg
ICAgICBlbHNlIGlmIChzZW5zb3ItPmVwLmJ1c190eXBlID09IFY0TDJfTUJVU19CVDY1NikNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb3Y1NjQwX3NldF9zdHJlYW1fYnQ2NTYoc2Vu
c29yLCBlbmFibGUpOw0KPiAgICAgICAgICAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IG92NTY0MF9zZXRfc3RyZWFtX2R2cChzZW5zb3IsIGVuYWJsZSk7DQo+
IA0KPiBDaGVlcnMsDQo+IFByYWJoYWthcg0KPiANCj4+ICsgICAgICAgaWYgKHJldCkNCj4+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKw0KPj4gKyAgICAgICBpZiAob24pIHsNCj4+
ICsgICAgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAgICAqIGNvbmZpZ3VyZSBwYXJh
bGxlbCBwb3J0IGNvbnRyb2wgbGluZXMgcG9sYXJpdHkNCj4+ICsgICAgICAgICAgICAgICAgKg0K
Pj4gKyAgICAgICAgICAgICAgICAqIFBPTEFSSVRZIENUUkwwDQo+PiArICAgICAgICAgICAgICAg
ICogLSBbNV06ICAgICAgIFBDTEsgcG9sYXJpdHkgKDA6IGFjdGl2ZSBsb3csIDE6IGFjdGl2ZSBo
aWdoKQ0KPj4gKyAgICAgICAgICAgICAgICAqIC0gWzFdOiAgICAgICBIUkVGIHBvbGFyaXR5ICgw
OiBhY3RpdmUgbG93LCAxOiBhY3RpdmUgaGlnaCkNCj4+ICsgICAgICAgICAgICAgICAgKiAtIFsw
XTogICAgICAgVlNZTkMgcG9sYXJpdHkgKG1pc21hdGNoIGhlcmUgYmV0d2Vlbg0KPj4gKyAgICAg
ICAgICAgICAgICAqICAgICAgICAgICAgICBkYXRhc2hlZXQgYW5kIGhhcmR3YXJlLCAwIGlzIGFj
dGl2ZSBoaWdoDQo+PiArICAgICAgICAgICAgICAgICogICAgICAgICAgICAgIGFuZCAxIGlzIGFj
dGl2ZSBsb3cuLi4pDQo+PiArICAgICAgICAgICAgICAgICovDQo+PiAgICAgICAgICAgICAgICAg
IGlmIChmbGFncyAmIFY0TDJfTUJVU19QQ0xLX1NBTVBMRV9SSVNJTkcpDQo+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGNsa19wb2wgPSAxOw0KPj4gLSAgICAgICAgICAgICAgIGlmIChmbGFn
cyAmIFY0TDJfTUJVU19IU1lOQ19BQ1RJVkVfSElHSCkNCj4+ICsgICAgICAgICAgICAgICBpZiAo
IWJ0NjU2ICYmIGZsYWdzICYgVjRMMl9NQlVTX0hTWU5DX0FDVElWRV9ISUdIKQ0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgIGhzeW5jX3BvbCA9IDE7DQo+PiAtICAgICAgICAgICAgICAgaWYg
KGZsYWdzICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9MT1cpDQo+PiArICAgICAgICAgICAgICAg
aWYgKCFidDY1NiAmJiBmbGFncyAmIFY0TDJfTUJVU19WU1lOQ19BQ1RJVkVfTE9XKQ0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIHZzeW5jX3BvbCA9IDE7DQo+Pg0KPj4gICAgICAgICAgICAg
ICAgICByZXQgPSBvdjU2NDBfd3JpdGVfcmVnKHNlbnNvciwgT1Y1NjQwX1JFR19QT0xBUklUWV9D
VFJMMDAsDQo+PiBAQCAtMjA1MiwxMiArMjA2OCwxMiBAQCBzdGF0aWMgaW50IG92NTY0MF9zZXRf
cG93ZXJfZHZwKHN0cnVjdCBvdjU2NDBfZGV2ICpzZW5zb3IsIGJvb2wgb24pDQo+PiAgICAgICAg
ICB9DQo+Pg0KPj4gICAgICAgICAgLyoNCj4+IC0gICAgICAgICogcG93ZXJkb3duIE1JUEkgVFgv
UlggUEhZICYgZGlzYWJsZSBNSVBJDQo+PiArICAgICAgICAqIHBvd2VyZG93biBNSVBJIFRYL1JY
IFBIWSAmIGVuYWJsZSBEVlANCj4+ICAgICAgICAgICAqDQo+PiAgICAgICAgICAgKiBNSVBJIENP
TlRST0wgMDANCj4+IC0gICAgICAgICogNDogICAgUFdETiBQSFkgVFgNCj4+IC0gICAgICAgICog
MzogICAgUFdETiBQSFkgUlgNCj4+IC0gICAgICAgICogMjogICAgTUlQSSBlbmFibGUNCj4+ICsg
ICAgICAgICogWzRdID0gMSAgICAgIDogUG93ZXIgZG93biBNSVBJIEhTIFR4DQo+PiArICAgICAg
ICAqIFszXSA9IDEgICAgICA6IFBvd2VyIGRvd24gTUlQSSBMUyBSeA0KPj4gKyAgICAgICAgKiBb
Ml0gPSAwICAgICAgOiBEVlAgZW5hYmxlIChNSVBJIGRpc2FibGUpDQo+PiAgICAgICAgICAgKi8N
Cj4+ICAgICAgICAgIHJldCA9IG92NTY0MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX0lP
X01JUElfQ1RSTDAwLCAweDE4KTsNCj4+ICAgICAgICAgIGlmIChyZXQpDQo+PiBAQCAtMjA3NCw4
ICsyMDkwLDcgQEAgc3RhdGljIGludCBvdjU2NDBfc2V0X3Bvd2VyX2R2cChzdHJ1Y3Qgb3Y1NjQw
X2RldiAqc2Vuc29yLCBib29sIG9uKQ0KPj4gICAgICAgICAgICogLSBbMzowXTogICAgIERbOTo2
XSBvdXRwdXQgZW5hYmxlDQo+PiAgICAgICAgICAgKi8NCj4+ICAgICAgICAgIHJldCA9IG92NTY0
MF93cml0ZV9yZWcoc2Vuc29yLCBPVjU2NDBfUkVHX1BBRF9PVVRQVVRfRU5BQkxFMDEsDQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBWNEwy
X01CVVNfUEFSQUxMRUwgPw0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4N2Yg
OiAweDFmKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBidDY1NiA/IDB4MWYg
OiAweDdmKTsNCj4+ICAgICAgICAgIGlmIChyZXQpDQo+PiAgICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+Pg0KPj4gQEAgLTI5MjUsOCArMjk0MCw2IEBAIHN0YXRpYyBpbnQgb3Y1NjQwX3Nf
c3RyZWFtKHN0cnVjdCB2NGwyX3N1YmRldiAqc2QsIGludCBlbmFibGUpDQo+Pg0KPj4gICAgICAg
ICAgICAgICAgICBpZiAoc2Vuc29yLT5lcC5idXNfdHlwZSA9PSBWNEwyX01CVVNfQ1NJMl9EUEhZ
KQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IG92NTY0MF9zZXRfc3RyZWFtX21p
cGkoc2Vuc29yLCBlbmFibGUpOw0KPj4gLSAgICAgICAgICAgICAgIGVsc2UgaWYgKHNlbnNvci0+
ZXAuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2KQ0KPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgcmV0ID0gb3Y1NjQwX3NldF9zdHJlYW1fYnQ2NTYoc2Vuc29yLCBlbmFibGUpOw0KPj4gICAg
ICAgICAgICAgICAgICBlbHNlDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gb3Y1
NjQwX3NldF9zdHJlYW1fZHZwKHNlbnNvciwgZW5hYmxlKTsNCj4+DQo+PiAtLQ0KPj4gMi43LjQN
Cj4+DQoNCkJSLA0KSHVndWVzLg==
