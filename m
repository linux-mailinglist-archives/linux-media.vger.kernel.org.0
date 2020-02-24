Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2606216A805
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2020 15:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbgBXONa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Feb 2020 09:13:30 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:42736 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbgBXON3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Feb 2020 09:13:29 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id DC5433C04C1;
        Mon, 24 Feb 2020 15:13:26 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5tnY5zTXeUFO; Mon, 24 Feb 2020 15:13:21 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 9147C3C005E;
        Mon, 24 Feb 2020 15:13:09 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289]) by
 HI2EXCH01.adit-jv.com ([fe80::69bf:8148:2f13:f289%12]) with mapi id
 14.03.0468.000; Mon, 24 Feb 2020 15:13:09 +0100
From:   "Rodin, Michael (Ferchau; ADITG/ESM1)" <mrodin@de.adit-jv.com>
To:     "jacopo@jmondi.org" <jacopo@jmondi.org>
CC:     "niklas.soderlund@ragnatech.se" <niklas.soderlund@ragnatech.se>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Friedrich, Eugen (ADITG/ESM1)" <efriedrich@de.adit-jv.com>,
        "Rosca, Eugeniu (ADITG/ESM1)" <erosca@de.adit-jv.com>,
        "Udipi, Suresh (Wipro; LEADER ; ADITJ/SWG)" 
        <external.sudipi@jp.adit-jv.com>,
        "akiyama@nds-osk.co.jp" <akiyama@nds-osk.co.jp>
Subject: RE: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on
 clock lane during start of CSI2
Thread-Topic: [PATCH] [RFC] media: rcar-vin: don't wait for stop state on
 clock lane during start of CSI2
Thread-Index: AQHV5lDEYJ+KDHbHMk+ttiXKnZHzuagitZwAgAej6QA=
Date:   Mon, 24 Feb 2020 14:13:08 +0000
Message-ID: <AC35D0CFBC66A84AAA9DF4334B52828D136F94C7@HI2EXCH01.adit-jv.com>
References: <1582026251-21047-1-git-send-email-mrodin@de.adit-jv.com>
 <20200219172456.hyo2aksvubxpoqrn@uno.localdomain>
In-Reply-To: <20200219172456.hyo2aksvubxpoqrn@uno.localdomain>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.72.92.112]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiBUdWUsIEZlYiAxOCwgMjAyMCBhdCAxMjo0NDoxMVBNICswMTAwLCBNaWNoYWVsIFJvZGlu
IHdyb3RlOg0KPiA+IFRoZSBjaGFwdGVyIDcuMSAiRC1QSFkgUGh5c2ljYWwgTGF5ZXIgT3B0aW9u
IiBvZiB0aGUgQ1NJMg0KPiA+IHNwZWNpZmljYXRpb24gc3RhdGVzIHRoYXQgbm9uLWNvbnRpbnVv
dXMgY2xvY2sgYmVoYXZpb3IgaXMgb3B0aW9uYWwsDQo+ID4gaS5lLiB0aGUgQ2xvY2sgTGFuZSBj
YW4gcmVtYWluIGluIGhpZ2gtc3BlZWQgbW9kZSBiZXR3ZWVuIHRoZSB0cmFuc21pc3Npb24NCj4g
b2YgZGF0YSBwYWNrZXRzLg0KPiA+IFRoZXJlZm9yZSB3YWl0aW5nIGZvciB0aGUgc3RvcCBzdGF0
ZSAoTFAtMTEpIG9uIHRoZSBDbG9jayBMYW5lIGlzDQo+ID4gd3JvbmcgYW5kIHdpbGwgY2F1c2Ug
dGltZW91dHMgd2hlbiBhIENTSTIgdHJhbnNtaXR0ZXIgd2l0aCBjb250aW51b3VzDQo+ID4gY2xv
Y2sgYmVoYXZpb3IgaXMgYXR0YWNoZWQgdG8gUi1DYXIgQ1NJMiByZWNlaXZlci4gU28gd2FpdCBv
bmx5IGZvcg0KPiA+IHRoZSBzdG9wIHN0YXRlIG9uIHRoZSBEYXRhIExhbmVzLg0KPiANCj4gQW0g
SSB3cm9uZyBvciB0aGUgZGVzaXJlZCBiZWhhdmlvdXIgc2hvdWxkIGRlcGVuZCBvbiB0aGUgcHJl
c2VuY2Ugb2YgdGhlDQo+IGNsb2NrLW5vbmNvbnRpbnVvdXMgcHJvcGVydHkgaW4gdGhlIENTSS0y
IGlucHV0IGVuZHBvaW50ID8NCj4gSWYgY2xvY2stbm9uY29udGludW91cyBpcyBzZXQsIHRoZW4g
d2FpdCBmb3IgdGhlIGNsb2NrIGxhbmUgdG8gZW50ZXIgc3RvcCBzdGF0ZQ0KPiB0b28sIGlmIG5v
dCBqdXN0IHdhaXQgZm9yIHRoZSBkYXRhIGxhbmVzIHRvIHN0b3AuDQo+IA0KPiBJZiB0aGlzIGlz
IGNvcnJlY3QsIGl0IHdpbGwgYWxzbyByZXF1aXJlIGEgY2hhbmdlIHRvIHRoZSBiaW5kaW5ncyBh
bmQgdGhhdCdzIHRoZQ0KPiB0cmlja3kgcGFydC4gU28gZmFyIHRoZSBDU0ktMiByZWNlaXZlciBi
ZWhhdmVkIGFzIHRoZSBjbG9jay1ub25jb250aW51b3VzDQo+IHByb3BlcnR5IHdhcyBzZXQgKHdh
aXQgZm9yIGJvdGggZGF0YSBhbmQgY2xvY2sNCj4gbGFuZXMpIGFuZCBvbGRlciBkdGIgc2hvdWxk
IGNvbnRpbnVlIHRvIHdvcmsgdW5kZXIgdGhpcyBhc3N1bXB0aW9uLiBJZiB5b3UNCj4gd2FudCB0
byBzdXBwb3J0IGRldmljZXMgd2l0aCBjb250aW51b3VzIGNsb2NrIHRoZW4geW91IGhhdmUgdG8g
cmVxdWlyZSB0aGUNCj4gY2xvY2stbm9uY29udGludW91cyBwcm9wZXJ0eSB0byBiZSBleHBsaWNp
dGx5IHNldCB0byBmYWxzZSwgYW5kIGFzc3VtZSBpdCdzIHRydWUNCj4gaWYgbm90IHNwZWNpZmll
ZC4gQlVUIGNsb2NrLW5vbmNvbnRpbnVvdXMgaXMgYSBib29sZWFuIHByb3BlcnR5LCB3aG9zZSB2
YWx1ZQ0KPiBkZXBlbmRzIG9uIGl0J3MgcHJlc2VuY2Ugb25seS4gU28gSSBmZWFyIHdlIG5lZWQg
dG8gYWRkIGEgJ2Nsb2NrLWNvbnRpbnVvdXMnDQo+IGZsYWcgdG8gdmlkZW8taW50ZXJmYWNlcy50
eHQsIHBhcnNlIGl0IGluIHRoZSBDU0ktMiByZWNlaXZlciBkcml2ZXIsIGFuZCB0aGVuIGlnbm9y
ZQ0KPiB0aGUgY2xvY2sgbGFuZSBzdG9wIHN0YXRlIGlmIGFuZCBvbmx5IGlmIHNhaWQgcHJvcGVy
dHkgaXMgc3BlY2lmaWVkLg0KPiANCj4gRG9lcyB0aGlzIG1ha2Ugc2Vuc2UgPw0KPiANCg0KSGVs
bG8gSmFjb3BvLA0KDQogLSBGaXJzdCBvZiBhbGwgSSBhbSBub3Qgc28gc3VyZSB3aGV0aGVyIEkg
YW0gaW50ZXJwcmV0aW5nIHRoZSBDU0kyIHNwZWMgY29ycmVjdGx5LA0KICAgdGhpcyBpcyBhbHNv
IHRoZSByZWFzb24gd2h5IEkgbWFya2VkIG15IHBhdGNoIGFzIFtSRkNdLiBTbyBNQVlCRSB3YWl0
aW5nIGZvciBMUC0xMQ0KICAgb24gdGhlIGNsb2NrIGxhbmUgSVMgY29ycmVjdCBhdCB0aGlzIHBv
aW50IGluIHJjYXItY3NpMiBhbmQgdGhlIGlzc3VlIGlzIHNvbWV3aGVyZSBlbHNlDQogICBhbmQg
eW91ciBzdWdnZXN0aW9uIHdhcyBiYXNlZCBvbiBteSB3cm9uZyBhc3N1bXB0aW9uLiBJcyBpdCBw
b3NzaWJsZT8NCiAtIFRoZSBwcmVzZW5jZSBvZiB0aGUgImNsb2NrLW5vbmNvbnRpbnVvdXMiIHBy
b3BlcnR5IGlzIHBhcnNlZCBieSB0aGUgVjRMMiBmd25vZGUgbGlicmFyeSwNCiAgIHdoaWNoIHNl
dHMgZWl0aGVyIFY0TDJfTUJVU19DU0kyX0NPTlRJTlVPVVNfQ0xPQ0sgb3IgVjRMMl9NQlVTX0NT
STJfTk9OQ09OVElOVU9VU19DTE9DSy4NCiAgIEkgY291bGQgbm90IGZpbmQgYW55IHVwc3RyZWFt
IENTSTIgcmVjZWl2ZXIgZHJpdmVyLCB3aGljaCByZWFkcyB0aGVzZSBmbGFncy4gV291bGQgYmUg
cmNhci1jc2kyDQogICB0aGUgZmlyc3QgZHJpdmVyIHdoaWNoIHJlYWRzIHRoaXMgcHJvcGVydHkg
KG9mIGEgdHJhbnNtaXR0ZXIpIGF0IHRoZSByZWNlaXZlciBzaWRlPw0KIC0gU29ycnksIGJ1dCBJ
IGRvbid0IHVuZGVyc3RhbmQgeW91ciBjb25jZXJucyBhYm91dCBjb21wYXRpYmlsaXR5IHRvIG9s
ZCBkZXZpY2UgdHJlZXMuDQogICBJZiAiY2xvY2stbm9uY29udGludW91cyIgZXhpc3RzIGF0IHRo
ZSBDU0kyIHRyYW5zbWl0dGVyIHNpZGUsIGl0IGlzIGFzc3VtZWQgdG8gYmUNCiAgIHRydWUgKHNp
bmNlIGFzIHlvdSBtZW50aW9uZWQsIGFsbCBib29sZWFuIHByb3BlcnRpZXMgYXJlIHRydWUgaWYg
cHJlc2VudCkgYW5kIHdlDQogICB3b3VsZCB3YWl0IGZvciBMUC0xMSBvbiBjbG9jayBsYW5lIGlu
IHJjYXItY3NpMiBhbmQgb2xkZXIgZHRicyB3b3VsZCBjb250aW51ZSB0bw0KICAgd29yayBjb3Jy
ZWN0bHkuIElmIHRoaXMgcHJvcGVydHkgaXMgbm90IHByZXNlbnQgaW4gYSBDU0kyIHRyYW5zbWl0
dGVyIG5vZGUgb2YgYW4gb2xkZXINCiAgIGR0YiBhbHRob3VnaCB0aGlzIHRyYW5zbWl0dGVyIGhh
cyB0aGlzIHByb3BlcnR5LCB0aGVuIHRoaXMgaXMgYSB3cm9uZyBkZXZpY2UgdHJlZQ0KICAgY29u
ZmlndXJhdGlvbi4gU28gdGhlIHN1Z2dlc3RlZCBuZXcgImNsb2NrLWNvbnRpbnVvdXMiIHByb3Bl
cnR5IHdvdWxkIGJlIGEgd29ya2Fyb3VuZA0KICAgZm9yIHN1cHBvcnRpbmcgaW5jb3JyZWN0IGRl
dmljZSB0cmVlcy4gU2hvdWxkIHdlIG1haW50YWluIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5IGlu
IHRoaXMgY2FzZT8NCiAtIEV2ZW4gaWYgd2Ugc2hvdWxkIG1haW50YWluIGJhY2t3YXJkcyBjb21w
YXRpYmlsaXR5IHRvIGluY29ycmVjdGx5IGNvbmZpZ3VyZWQgZGV2aWNlIHRyZWVzDQogICAoaS5l
LiAiY2xvY2stbm9uY29udGludW91cyIgaXMgbm90IHNwZWNpZmllZCBmb3IgQ1NJMiB0cmFuc21p
dHRlcnMgd2l0aCBub24tY29udGludW91cyBjbG9jayBiZWhhdmlvciksDQogICBpdCBpcyBwb3Nz
aWJseSBub3QgYW4gaXNzdWUgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgYmVjYXVzZSB3ZSBkb24n
dCBoYXZlIHRvIHdhaXQgZm9yDQogICBMUC0xMSBvbiBjbG9jayBsYW5lcyBhdCBhbGwgc2luY2Ug
dGhlIG5vbi1jb250aW51b3VzIGNsb2NrIGJlaGF2aW9yIGlzIG9wdGlvbmFsIGFjY29yZGluZw0K
ICAgdG8gdGhlIGNoYXB0ZXIgNy4xIG9mIHRoZSBDU0kyIHNwZWNpZmljYXRpb24uIFNvIGZyb20g
bXkgdW5kZXJzdGFuZGluZyBhIENTSTIgcmVjZWl2ZXINCiAgIHdoaWNoIHN1cHBvcnRzIG9ubHkg
Y29udGludW91cyBjbG9jayBiZWhhdmlvciB3b3VsZCB3b3JrIHdpdGggYm90aCBraW5kcyBvZiBj
bG9jaw0KICAgYmVoYXZpb3IgYXQgdGhlIHRyYW5zbWl0dGVyIHNpZGUuIE9uIHRoZSBvdGhlciBz
aWRlIGEgQ1NJMiByZWNlaXZlciB3aGljaCBzdXBwb3J0cyBvbmx5DQogICBub24tY29udGludW91
cyBjbG9jayBiZWhhdmlvciAod2hpY2ggaXMgY3VycmVudGx5IHRoZSBiZWhhdmlvciBpbXBsZW1l
bnRlZCBpbiByY2FyLWNzaTIuYykNCiAgIGNhbiBub3QgcmVjZWl2ZSBhbnl0aGluZyBmcm9tIGEg
dHJhbnNtaXR0ZXIgd2l0aCBjb250aW51b3VzIGNsb2NrIGJlaGF2aW9yIGFuZCB3b3VsZCB2aW9s
YXRlIENTSTIgc3BlYy4NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUm9k
aW4gPG1yb2RpbkBkZS5hZGl0LWp2LmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9yY2FyLXZpbi9yY2FyLWNzaTIuYyB8IDMgKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3JjYXItdmluL3JjYXItY3NpMi5jDQo+ID4gYi9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JjYXItdmluL3JjYXItY3NpMi5jDQo+ID4gaW5kZXggZmFhOWZiMi4u
NmQxOTkyYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JjYXItdmlu
L3JjYXItY3NpMi5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yY2FyLXZpbi9y
Y2FyLWNzaTIuYw0KPiA+IEBAIC00MTYsOCArNDE2LDcgQEAgc3RhdGljIGludCByY3NpMl93YWl0
X3BoeV9zdGFydChzdHJ1Y3QgcmNhcl9jc2kyICpwcml2KQ0KPiA+ICAJZm9yICh0aW1lb3V0ID0g
MDsgdGltZW91dCA8PSAyMDsgdGltZW91dCsrKSB7DQo+ID4gIAkJY29uc3QgdTMyIGxhbmVfbWFz
ayA9ICgxIDw8IHByaXYtPmxhbmVzKSAtIDE7DQo+ID4NCj4gPiAtCQlpZiAoKHJjc2kyX3JlYWQo
cHJpdiwgUEhDTE1fUkVHKSAmIFBIQ0xNX1NUT1BTVEFURUNLTCkNCj4gJiYNCj4gPiAtCQkgICAg
KHJjc2kyX3JlYWQocHJpdiwgUEhETE1fUkVHKSAmIGxhbmVfbWFzaykgPT0gbGFuZV9tYXNrKQ0K
PiA+ICsJCWlmICgocmNzaTJfcmVhZChwcml2LCBQSERMTV9SRUcpICYgbGFuZV9tYXNrKSA9PSBs
YW5lX21hc2spDQo+ID4gIAkJCXJldHVybiAwOw0KPiA+DQo+ID4gIAkJdXNsZWVwX3JhbmdlKDEw
MDAsIDIwMDApOw0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0K
