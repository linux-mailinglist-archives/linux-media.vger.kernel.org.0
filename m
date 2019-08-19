Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DE391FBC
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 11:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfHSJNp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 05:13:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:43346 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726186AbfHSJNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 05:13:45 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7J9C44g008020;
        Mon, 19 Aug 2019 11:13:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qPtY65syNbZPgYlU9jqqgNS94oIfK9I+q4XLxKpjhnI=;
 b=d41pUUzNDUnezdRr90IZ61ONsJ21G4K5DZYJtf2bZZGzywRpRuiz+oGVHnaedJSLmdFm
 O8vLW82Rc0hzYKWwP/S/Lr8VYzhKTxYU+y/hIG45CCgRWVyjLtKaGzI7xIYeuJasIaUt
 lq4oGEx23LCbjfWsVQhtSaF98k/ajKzTwtXgF/hcmrlNzR9BNb5WhNOTpDpXvX4uoNNO
 SiyR0mTaR5Lj3HKIfhp7ZSXmOgwSCMxrVVuHGRDfrHYqb1LhDSLo7igN3D642yM22FzR
 mLCEY8IVjtuAfFWoY52vkRfU92aA6Qt037akHvkcwsJ/HN4GNvnBRIVTZpO3qXYyJ8nY eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2ue720tdyj-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Mon, 19 Aug 2019 11:13:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 743E634;
        Mon, 19 Aug 2019 09:13:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 620CA2CA5CE;
        Mon, 19 Aug 2019 11:13:29 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Aug
 2019 11:13:29 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 19 Aug 2019 11:13:29 +0200
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
Subject: Re: [PATCH v7 0/4] DCMI bridge support
Thread-Topic: [PATCH v7 0/4] DCMI bridge support
Thread-Index: AQHVVmonZD9iAGFT80+FGsi2F1VjYqcCDlyA
Date:   Mon, 19 Aug 2019 09:13:28 +0000
Message-ID: <5d36f437-0de5-1aa0-09bf-51d3a415ad2f@st.com>
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
 <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
In-Reply-To: <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
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
Content-ID: <7454236525196C4ABD655304CB57FFD8@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-19_02:,,
 signatures=0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywgU2FrYXJpLA0KDQpPSyB0byBwdXNoIHNlcGFyYXRlbHkgdGhlIDgwIGNoYXIgZml4
Lg0KDQpUaGVyZSB3YXMgcGVuZGluZyByZWxhdGVkIGNoYW5nZXMgb24gc3QtbWlwaWQwMiBhbmQg
b3Y1NjQwIChsaXN0ZWQgDQpiZWxvdyksIGRvIHlvdSB0aGluayBpdCdzIHBvc3NpYmxlIHRvIHRh
a2UgdGhlbSBhbHNvID8NCg0KDQptZWRpYTogc3QtbWlwaWQwMjogYWRkIHN1cHBvcnQgb2YgVjRM
Ml9DSURfTElOS19GUkVRIA0KaHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcGF0Y2gvNTY5
NjkvDQpTdGF0ZQlBY2NlcHRlZA0KDQpbdjIsMS8zXSBtZWRpYTogc3QtbWlwaWQwMjogYWRkIHN1
cHBvcnQgb2YgUkdCNTY1DQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRjaC81Njk3
MC8NClN0YXRlCUFjY2VwdGVkDQoNClt2MiwyLzNdIG1lZGlhOiBzdC1taXBpZDAyOiBhZGQgc3Vw
cG9ydCBvZiBZVVlWOCBhbmQgVVlWWTgNCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3Bh
dGNoLzU2OTcxLw0KU3RhdGUJQWNjZXB0ZWQNCg0KW3YyLDMvM10gbWVkaWE6IHN0LW1pcGlkMDI6
IGFkZCBzdXBwb3J0IG9mIEpQRUcgDQpodHRwczovL3BhdGNod29yay5saW51eHR2Lm9yZy9wYXRj
aC81Njk3My8NClN0YXRlCUFjY2VwdGVkDQoNCg0KW3YyXSBtZWRpYTogb3Y1NjQwOiBhZGQgc3Vw
cG9ydCBvZiBWNEwyX0NJRF9MSU5LX0ZSRVENCmh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3Jn
L3BhdGNoLzU3MjE1Lw0KU3RhdGUJQ2hhbmdlcyBSZXF1ZXN0ZWQNCj0+IFRoaXMgY2hhbmdlIGlz
IG5lZWRlZCB0byBtYWtlIGl0IHdvcmsgdGhlIHdob2xlIHNldHVwLg0KPT4gSSBkb24ndCBrbm93
IHdoYXQgdG8gY2hhbmdlIGhlcmUsIGV2ZW4gaWYgdGhpcyAzODRNSHogZml4ZWQgdmFsdWUgDQpz
ZWVtcyBzdHJhbmdlLCBpdCB3b3JrcyBmaW5lIG9uIG15IHNldHVwLCBvbiBteSBvcGluaW9uIGl0
J3MgYmV0dGVyIHRoYW4gDQpub3RoaW5nLiBXZSBjb3VsZCBjb21lIGJhY2sgb24gdGhpcyBsYXRl
ciBvbiB3aGVuIG90aGVyIE9WNTY0MCBDU0kgDQppbnRlcmZhY2VzIHdpbGwgcmVxdWlyZSBWNEwy
X0NJRF9MSU5LX0ZSRVEgdmFsdWUuDQoNClNha2FyaSwgd2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQg
dGhpcyA/DQoNCg0KQlIsDQpIdWd1ZXMuDQoNCk9uIDgvMTkvMTkgMTA6NDMgQU0sIEhhbnMgVmVy
a3VpbCB3cm90ZToNCj4gT24gOC8xOS8xOSAxMDo0MSBBTSwgSHVndWVzIEZydWNoZXQgd3JvdGU6
DQo+PiBUaGlzIHBhdGNoIHNlcmllIGFsbG93cyB0byBjb25uZWN0IG5vbi1wYXJhbGxlbCBjYW1l
cmEgc2Vuc29yIHRvDQo+PiBEQ01JIHRoYW5rcyB0byBhIGJyaWRnZSBjb25uZWN0ZWQgaW4gYmV0
d2VlbiBzdWNoIGFzIFNUTUlQSUQwMiBbMV0uDQo+Pg0KPj4gTWVkaWEgY29udHJvbGxlciBzdXBw
b3J0IGlzIGludHJvZHVjZWQgZmlyc3QsIHRoZW4gc3VwcG9ydCBvZg0KPj4gc2V2ZXJhbCBzdWIt
ZGV2aWNlcyB3aXRoaW4gcGlwZWxpbmUgd2l0aCBkeW5hbWljIGxpbmtpbmcNCj4+IGJldHdlZW4g
dGhlbS4NCj4+IEluIG9yZGVyIHRvIGtlZXAgYmFja3dhcmQgY29tcGF0aWJpbGl0eSB3aXRoIGFw
cGxpY2F0aW9ucw0KPj4gcmVseWluZyBvbiBWNEwyIGludGVyZmFjZSBvbmx5LCBmb3JtYXQgc2V0
IG9uIHZpZGVvIG5vZGUNCj4+IGlzIHByb3BhZ2F0ZWQgdG8gYWxsIHN1Yi1kZXZpY2VzIGNvbm5l
Y3RlZCB0byBjYW1lcmEgaW50ZXJmYWNlLg0KPj4NCj4+IFsxXSBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9kZXZpY2V0cmVlL21zZzI3ODAwMi5odG1sDQo+Pg0KPj4gPT09PT09PT09PT0N
Cj4+ID0gaGlzdG9yeSA9DQo+PiA9PT09PT09PT09PQ0KPj4gdmVyc2lvbiA3Og0KPj4gICAgLSBt
aW5vciBmaXggb24gODAgY2hhciB0cmFjZSBtZXNzYWdlDQo+IA0KPiB2NiBpcyBhbHJlYWR5IGlu
IGEgcGVuZGluZyBQUi4gSSBkb24ndCByZWFsbHkgd2FudCB0byBtYWtlIGEgbmV3DQo+IFBSIGp1
c3QgZm9yIGEgODAgY2hhciB3YXJuaW5nLg0KPiANCj4gSXQgY2FuIGFsd2F5cyBiZSBkb25lIGlu
IGEgZm9sbG93LXVwIHBhdGNoLg0KPiANCj4gUmVnYXJkcywNCj4gDQo+IAlIYW5zDQo+IA0KPj4N
Cj4+IHZlcnNpb24gNjoNCj4+ICAgIC0gQXMgcGVyIFNha2FyaSByZW1hcms6IGFkZCBhIEZJWE1F
IGV4cGxhaW5pbmcgdGhhdCB0aGlzDQo+PiAgICAgIHZlcnNpb24gb25seSBzdXBwb3J0cyBzdWJk
ZXZpY2VzIHdoaWNoIGV4cG9zZSBSR0IgJiBZVVYNCj4+ICAgICAgInBhcmFsbGVsIGZvcm0iIG1i
dXMgY29kZSAoXzJYOCkNCj4+ICAgIC0gQWRkIHNvbWUgdHJhY2UgYXJvdW5kIHN1YmRldl9jYWxs
KHNfZm10KSBlcnJvciAmIGZvcm1hdA0KPj4gICAgICBjaGFuZ2VzIHRvIGRlYnVnIHN1YmRldiB3
aGljaCBvbmx5IGV4cG9zZSBzZXJpYWwgbWJ1cyBjb2RlDQo+PiAgICAtIENvbmZvcm0gdG8gIjxu
YW1lPiI6PHBhZCBpbmRleD4gd2hlbiB0cmFjaW5nIHN1YmRldiBpbmZvcw0KPj4NCj4+IHZlcnNp
b24gNToNCj4+ICAgIC0gUmVtb3ZlIHJlbWFpbmluZyBDaGFuZ2UtSWQNCj4+ICAgIC0gQWRkIEFj
a2VkLWJ5OiBTYWthcmkgQWlsdXMgPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+DQo+Pg0K
Pj4gdmVyc2lvbiA0Og0KPj4gICAgLSBBbHNvIGRyb3Agc3ViZGV2IG5vZGVzIHJlZ2lzdHJ5IGFz
IHN1Z2dlc3RlZCBieSBIYW5zOg0KPj4gICAgICBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9hcm0ta2VybmVsL21zZzc0MzM3NS5odG1sDQo+Pg0KPj4gdmVyc2lvbiAzOg0KPj4gICAgLSBE
cm9wIG1lZGlhIGRldmljZSByZWdpc3RyeSB0byBub3QgZXhwb3NlIG1lZGlhIGNvbnRyb2xsZXIN
Cj4+ICAgICAgaW50ZXJmYWNlIHRvIHVzZXJzcGFjZSBhcyBwZXIgTGF1cmVudCcgc3VnZ2VzdGlv
bjoNCj4+ICAgICAgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbWVkaWEvbXNn
MTUzNDE3Lmh0bWwNCj4+ICAgIC0gUHJlZmVyICJzb3VyY2UiIGluc3RlYWQgb2YgInNlbnNvciIg
YW5kIGtlZXAgaXQgaW4NCj4+ICAgICAgZGNtaV9ncmFwaF9lbnRpdHkgc3RydWN0LCBtb3ZlIGFz
ZCBhcyBmaXJzdCBtZW1iZXINCj4+ICAgICAgb2Ygc3RydWN0IGFzIHBlciBTYWthcmknIHN1Z2dl
c3Rpb246DQo+PiAgICAgIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0L2xpc3RzL2xpbnV4LW1lZGlh
L21zZzE1MzExOS5odG1sDQo+PiAgICAtIERyb3AgZGNtaV9ncmFwaF9kZWluaXQoKSBhcyBwZXIg
U2FrYXJpJyBzdWdnZXN0aW9uOg0KPj4gICAgICBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0
cy9saW51eC1tZWRpYS9tc2cxNTM0MTcuaHRtbA0KPj4NCj4+IHZlcnNpb24gMjoNCj4+ICAgIC0g
Rml4IGJ1c19pbmZvIG5vdCBjb25zaXN0ZW50IGJldHdlZW4gbWVkaWEgYW5kIFY0TDoNCj4+ICAg
ICAgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvYXJtLWtlcm5lbC9tc2c3MTc2NzYuaHRt
bA0KPj4gICAgLSBQcm9wYWdhdGlvbiBvZiBmb3JtYXQgc2V0IG9uIHZpZGVvIG5vZGUgdG8gdGhl
IHN1Yi1kZXZpY2VzDQo+PiAgICAgIGNoYWluIGNvbm5lY3RlZCBvbiBjYW1lcmEgaW50ZXJmYWNl
DQo+Pg0KPj4gdmVyc2lvbiAxOg0KPj4gICAgLSBJbml0aWFsIHN1Ym1pc3Npb24NCj4+DQo+PiBI
dWd1ZXMgRnJ1Y2hldCAoNCk6DQo+PiAgICBtZWRpYTogc3RtMzItZGNtaTogaW1wcm92ZSBzZW5z
b3Igc3ViZGV2IG5hbWluZw0KPj4gICAgbWVkaWE6IHN0bTMyLWRjbWk6IHRyYWNlIHRoZSBzdXBw
b3J0ZWQgZm91cmNjL21idXNfY29kZQ0KPj4gICAgbWVkaWE6IHN0bTMyLWRjbWk6IGFkZCBtZWRp
YSBjb250cm9sbGVyIHN1cHBvcnQNCj4+ICAgIG1lZGlhOiBzdG0zMi1kY21pOiBhZGQgc3VwcG9y
dCBvZiBzZXZlcmFsIHN1Yi1kZXZpY2VzDQo+Pg0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L0tjb25maWcgICAgICAgICAgICB8ICAgMiArLQ0KPj4gICBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3N0bTMyL3N0bTMyLWRjbWkuYyB8IDMxOCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0N
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyNjggaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0p
DQo+Pg0KPiA=
