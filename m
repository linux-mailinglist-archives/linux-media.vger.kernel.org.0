Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495722A3F53
	for <lists+linux-media@lfdr.de>; Tue,  3 Nov 2020 09:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgKCIwa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Nov 2020 03:52:30 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51530 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725982AbgKCIwa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Nov 2020 03:52:30 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0A38lnme026420;
        Tue, 3 Nov 2020 09:52:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=E3VpB3n5yY4alIICiRwO5h/HKeHK361x+d3PguEwtHo=;
 b=OuhHBGSRNqPxftNJ5pArAEqNCw5LdUQdQ+6thEfPXBlfj34P5INBg5cO8RaRwEoTSrtl
 Rm65jXS7O+Zb2b+ELvoO3XZi4RPxq7nSkzFru+CvRwytaZISksYQvPegHGSKPNcxw84F
 Mu6tNnAAOmfaFWG8Li8fy6KMomqsZAHfve53bPBdaEDZ/bURk7zfN8mIuuN2x0Sz1tHa
 Oo2p6v4TJU8JdGS6Ah1Lu1VChpJzFKOaJxOL7yN61fyTtP5I0sZj9dqqTSYOvyN2eDE7
 kw9g6XFm239CqQHzZZBx5lgoCXqU2bxVLG9h5pWMUcIeROLSEQ3UcoXc0bDLHxOwjVWV 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34gywqr25t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 03 Nov 2020 09:52:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 64D9210002A;
        Tue,  3 Nov 2020 09:52:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 41707231131;
        Tue,  3 Nov 2020 09:52:24 +0100 (CET)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 09:52:23 +0100
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 3 Nov 2020 09:52:23 +0100
From:   Hugues FRUCHET <hugues.fruchet@st.com>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
CC:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "sam@elite-embedded.com" <sam@elite-embedded.com>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Thread-Topic: [RFC 0/3] media: ov5640: Adjust htot, rework clock tree, add
 LINK_FREQ
Thread-Index: AQHWrX2zcckzQ+FW7UOjkHmIbru1AKm194iAgAAQ5YCAAAFdAIAABeYAgAAB2gA=
Date:   Tue, 3 Nov 2020 08:52:23 +0000
Message-ID: <2690d87c-b8a9-3f27-1eb3-fd6c156aea0a@st.com>
References: <20201028225706.110078-1-jacopo+renesas@jmondi.org>
 <1bc29f6f-20b1-245e-c346-9c57058b9a24@ti.com>
 <20201103081945.pihysjlqha2noz2m@uno.localdomain>
 <1123502e-f82f-182d-cf44-899fe54392f8@ti.com>
 <20201103084544.ocgt33at7tkaumxv@uno.localdomain>
In-Reply-To: <20201103084544.ocgt33at7tkaumxv@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-Type: text/plain; charset="utf-8"
Content-ID: <292CB3ACB7FFA44DB42A24BFBA34B879@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-03_07:2020-11-02,2020-11-03 signatures=0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSmFjb3BvLA0KDQpPbiAxMS8zLzIwIDk6NDUgQU0sIEphY29wbyBNb25kaSB3cm90ZToNCj4g
SGkgYWdhaW4sDQo+IA0KPiBPbiBUdWUsIE5vdiAwMywgMjAyMCBhdCAxMDoyNDozOEFNICswMjAw
LCBUb21pIFZhbGtlaW5lbiB3cm90ZToNCj4+IE9uIDAzLzExLzIwMjAgMTA6MTksIEphY29wbyBN
b25kaSB3cm90ZToNCj4+PiBIaSBUb21pLA0KPj4+ICAgICAgdGhhbmtzIGZvciB0ZXN0aW5nDQo+
Pj4NCj4+PiBPbiBUdWUsIE5vdiAwMywgMjAyMCBhdCAwOToxOToxN0FNICswMjAwLCBUb21pIFZh
bGtlaW5lbiB3cm90ZToNCj4+Pj4gSGkgSmFjb3BvLA0KPj4+Pg0KPj4+PiBPbiAyOS8xMC8yMDIw
IDAwOjU3LCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+Pj4+PiBIaSBIdWd1ZXMgVG9taSBhbmQgU2Ft
DQo+Pj4+Pg0KPj4+Pj4gICAgIHRoaXMgc21hbGwgc2VyaWVzIGNvbGxlY3RzIFRvbWkncyBwYXRj
aCBvbiBhZGp1c3RpbmcgaHRvdCB3aGljaCBoYXMgYmVlbg0KPj4+Pj4gZmxvYXRpbmcgYXJvdW5k
IGZvciBzb21lIHRpbWUgd2l0aCBhIHJld29yayBvZiB0aGUgY2xvY2sgdHJlZSBiYXNlZCBvbg0K
Pj4+Pj4gSHVndWVzJyBhbmQgU2FtJ3Mgd29yayBvbiBzZXR0aW5nIHBjbGtfcGVyaW9kLiBJdCBh
bHNvIGFkZHJlc3MgdGhlIG5lZWQgdG8NCj4+Pj4+IHN1cHBwb3J0IExJTktfRlJFUVVFTkNZIGNv
bnRyb2wgYXMgcG9pbnRlZCBvdXQgYnkgSHVndWVzLg0KPj4+Pj4NCj4+Pj4+IEknbSBzb3J0IG9m
IGhhcHB5IHdpdGggdGhlIHJlc3VsdCBhcyBJJ3ZlIHJlbW92ZWQgcXVpdGUgc29tZSBjaHJ1biBh
bmQgdGhlIGNsb2NrDQo+Pj4+PiB0cmVlIGNhbGN1bGF0aW9uIGlzIG1vcmUgbGluZWFyLiBBbGwg
bW9kZXMgd29yayBleGNlcHQgZnVsbC1yZXNvbHV0aW9uIHdoaWNoIGENCj4+Pj4+IGJpdCBhbm5v
eXMgbWUsIGFzIEkgY2FuJ3Qgc2VsZWN0IGl0IHRocm91Z2ggc19mbXQgKHRvIGJlIGhvbmVzdCBJ
IGhhdmUgbm90DQo+Pj4+PiBpbnZlc3RpZ2F0ZWQgdGhhdCBpbiBkZXRhaWwsIHRoYXQncyB3aHkg
YW4gUkZDKS4NCj4+Pj4+DQo+Pj4+PiBGcmFtZXJhdGUgaXMgYmV0dGVyIHRoYW4gYmVmb3JlLCBi
dXQgc3RpbGwgb2ZmIGZvciBzb21lIGNvbWJpbmF0aW9uczoNCj4+Pj4+IDY0MHg0ODBAMzAgZ2l2
ZXMgbWUgfjQwIEZQUywgMTkyMHgxMDgwQDE1IGdpdmVzIG1lIH43Lg0KPj4+Pj4gVGhlIG90aGVy
IGNvbWJpbmF0aW9ucyBJJ3ZlIHRlc3RlZCBsb29rcyBnb29kLg0KPj4+Pj4NCj4+Pj4+IENhbiBJ
IGhhdmUgeW91ciBvcGluaW9uIG9uIHRoZXNlIGNoYW5nZXMgYW5kIGlmIHRoZXkgaGVscCB5b3Ug
d2l0aCB5b3VyDQo+Pj4+PiBwbGF0Zm9ybXM/DQo+Pj4+Pg0KPj4+Pj4gSSd2ZSBvbmx5IGJlZW4g
YWJsZSB0byB0ZXN0IFlVWVYsIHN1cHBvcnQgZm9yIGZvcm1hdHMgd2l0aCAhPSBicHAgd2lsbCBu
ZWVkDQo+Pj4+PiBzb21lIHdvcmsgbW9zdCBwcm9iYWJseSwgYnV0IHRoYXQgd2FzIGxpa2UgdGhp
cyBiZWZvcmUgKGFsdGhvdWdoIGlpcmMgSHVndWVzDQo+Pj4+PiBoYXMgY2FwdHVyZWQgSlBFRywg
cmlnaHQgPykNCj4+Pj4+DQo+Pj4+PiBUaGVyZSdzIGEgYml0IG1vcmUgY2xlYW51cCBvbiB0b3Ag
dG8gYmUgZG9uZSAoSSd2ZSBsZWZ0IFRPRE9zIGFyb3VuZCkgYW5kDQo+Pj4+PiBwcm9iYWJseSB0
aGUgSEJMQU5LIGNhbGN1bGF0aW9uIHNob3VsZCBiZSBjaGVja2VkIHRvIHNlZSBpZiBpdCB3b3Jr
cyB3aXRoIHRoZQ0KPj4+Pj4gbmV3IGh0b3QgdmFsdWVzLg0KPj4+Pg0KPj4+PiBVbmZvcnR1bmF0
ZWx5IHRoZSBzZWNvbmQgcGF0Y2ggc2VlbXMgdG8gYnJlYWsgY2FwdHVyZSBvbiBBTTYgRVZNICsg
T1Y1NjQwLiBUaGUgZWZmZWN0IGlzIHByZXR0eSBvZGQuDQo+Pj4+IFRoZSBwaWN0dXJlIGlzIHZl
cnkgZGFyaywgd2l0aCBvZGQgdmVydGljYWwgbGluZXMsIGJ1dCBpdCdzIHN0aWxsIGNhcHR1cmlu
ZyBzb21ldGhpbmcgYXMgSSBjYW4gc2VlIGENCj4+Pj4gY29ycmVjdGx5IHNoYXBlZCBzaGFkb3cg
b2YgbXkgaGFuZCBpZiBJIHdhdmUgbXkgaGFuZCBvdmVyIHRoZSBzZW5zb3IuDQo+Pj4NCj4+PiBU
aGlzIHNhZGRlbnMgbWUgcXVpdGUgYSBsb3QgOiggVGhlIGN1cnJlbnQgY2xvY2sgdHJlZSBwcm9n
cmFtbWluZw0KPj4+IHByb2NlZHVyZSBpcyBob3JyaWQgYW5kIGl0IGhhcyBiZWVuIGJ1Z2dpbmcg
bWUgZm9yIDIgeWVhcnMgbm93IDooDQo+Pj4NCj4+PiBJcyBjYXB0dXJlIGJyb2tlbiBpbiBhbGwg
bW9kZXMsIG9yIGhhdmUgeW91IHRlc3RlZCBhIHNpbmdsZSBvbmUgPw0KPj4NCj4+IEkgdGVzdGVk
IDY0MHg0ODAsIDcyMHg0ODAsIDcyMHg1NzYuDQo+Pg0KPj4gSSBoYXZlIG9ubHkgdGhpcyBzZW5z
b3IgdG8gdGVzdCB0aGUgQ1NJIFJYIG9uIEFNNiBFVk0sIHNvIEkgd291bGQgbm90IGJlIHN1cnBy
aXNlZCBpZiB0aGVyZSBhcmUNCj4+IGlzc3VlcyBpbiB0aGUgQ1NJIFJYIGRyaXZlciAodG9vKS4g
QnV0IHRoaXMgaXMgc3VwZXIgZnJ1c3RyYXRpbmcgdG8gZGVidWcsIGFzIHRoZSBzZW5zb3IgaXMg
YSBiYWRseQ0KPj4gZG9jdW1lbnRlZCBibGFjayBib3gsIGFuZCBJIGRvbid0IGhhdmUgbWVhbnMg
dG8gcHJvYmUgdGhlIENTSSBsaW5lcy4uLg0KPiANCj4gSSBzZWUuLiBJJ20gc3VyZSB5b3Ugbm90
aWNlZCwgYnV0IGFzIHlvdSBtZW50aW9uZWQgdGhlICdzZWNvbmQgcGF0Y2gnDQo+IEknbGwgcG9p
bnQgaXQgb3V0IGFueXdheTogdGhlIHNlcmllcyBoYXMgdG8gYmUgYXBwbGllZCBpbiBmdWxsLCBh
cyB0aGUNCj4gbGFzdCBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHJlcG9ydGluZyB0aGUgbGluayBm
cmVxdWVuY3ksIHRoYXQgaGFzDQo+IGJlZW4gcmUtY2FsY3VsYXRlZCBieSBwYXRjaCAyLzMuIE9u
IGlteDYgYW5kIG9uIEh1Z3VlcycgcGxhdGZvcm1zDQo+IGFkanVzdGluZyB0aGUgcmVjZWl2ZXIn
cyBsaW5rIGZyZXF1ZW5jeSBiYXNlZCBvbiB3aGF0J3MgcmVwb3J0ZWQgbWFrZXMgYQ0KPiBkaWZm
ZXJlbmNlLg0KPiANCj4gTWF5YmUgSHVndWVzIGNhbiBnaXZlIHRoaXMgc2VyaWVzIGEgc3BpbiB0
byBwcm92aWRlIGFuIGFkZGl0aW9uYWwgZGF0YQ0KPiBwb2ludCA/DQoNCkZvciBzdXJlLCBJJ2xs
IHRyeSB0b2RheS4NCg0KPiANCj4gVGhhbmtzDQo+ICAgICBqDQo+IA0KPj4NCj4+ICAgVG9taQ0K
Pj4NCj4+IC0tDQo+PiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4NCj4+IFktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQu
IEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
