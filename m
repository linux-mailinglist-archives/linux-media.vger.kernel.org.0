Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F397B412ED3
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 08:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhIUGuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 02:50:44 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:41786 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229755AbhIUGuo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 02:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1632206956; x=1663742956;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-id:
   content-transfer-encoding;
  bh=PNhbTpLcqgS/7W7YjEyPaoFKs9rvEAXNcEpwDJq5RPI=;
  b=JlBYpeLQm/OX0I3X/p4Y61qy0xvgu9zF26IPA921GFfDmSBckmfxUyLg
   nECjuR3yN0H7rvfcTRNNgnvdt1OYliXlpGaNLNrYxBus1D+lKuLPS0XWg
   4Q9uFeOAhFsaRZavOkNtMc0GhzSs+DMwZFiHP6GIVmcA8v9jJzo1VBn+o
   EBs1UbZ5L2sSH5gtMHI5T9J5xx89IjownahmJCE4SJ1Ii7IQvSWjfUBM0
   tt2vxOwfL5w+pR24jMi9SFsAfaCr3BJhWh5U2sQ4rlbDpJQqZrJhJondi
   YnB2MxSE1xEVOxBfEFfcNyIMjxYi9lStpLMFEO3hzwlz7z7u0RzdDeXMq
   g==;
X-IronPort-AV: E=Sophos;i="5.85,310,1624312800"; 
   d="scan'208";a="19612991"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Sep 2021 08:49:15 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 21 Sep 2021 08:49:15 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 21 Sep 2021 08:49:15 +0200
X-IronPort-AV: E=Sophos;i="5.85,310,1624312800"; 
   d="scan'208";a="19612990"
Received: from vmail01.tq-net.de ([10.150.72.11])
  by mx1.tq-group.com with ESMTP; 21 Sep 2021 08:49:15 +0200
Received: from vmail01.tq-net.de (10.150.72.11) by vmail01.tq-net.de
 (10.150.72.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 21 Sep
 2021 08:49:15 +0200
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2308.014; Tue, 21 Sep 2021 08:49:15 +0200
From:   "Stein, Alexander" <Alexander.Stein@tq-group.com>
To:     "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>
CC:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: (EXT) Re: Sony IMX290 link frequency
Thread-Topic: (EXT) Re: Sony IMX290 link frequency
Thread-Index: AQHXre5JzF/aKpNWCk+hzVQ71Sk0G6usp7AAgAFEgAA=
Date:   Tue, 21 Sep 2021 06:49:14 +0000
Message-ID: <a5e73b514299e17008f9e4a233553283ec7a88c9.camel@tq-group.com>
References: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
         <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com>
In-Reply-To: <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FEB8DF55409564D8D2B4EF9D4F51018@tq-group.com>
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gRGF2ZSwNCg0KdGhhbmsgeW91IGZvciB5b3VyIHZlcmJvc2UgZXhwbGFuYXRpb24uIEkg
dGhpbmsgSSB1bmRlcnN0YW5kIGEgbG90IG1vcmUNCm5vdyBhYm91dCB0aG9zZSBzZW5zb3JzLiBJ
J20gdXNpbmcgYW4gSU1YMzI3IGFzIHdlbGwsIGJ1dCB0aGVyZSBkb2Vzbid0DQpzZWVtIHRvIGJl
IGEgaHVnZSBkaWZmZXJlbmNlLg0KDQpPbiBNb250YWcsIDIwIFNlcHQgMjAyMSBhdCAxMjoyNyAr
MDEwMCwgRGF2ZSBTdGV2ZW5zb24NCj4gSXQgaGFzIHR3byBjbG9jayBwYXRocyAtIG9uZSBkcml2
aW5nIHRoZSBwaXhlbCBhcnJheSwgYW5kIG9uZSBkcml2aW5nDQo+IHRoZSBNSVBJIGNvcmUuIFRo
ZXJlIGlzIGEgRklGTyBiZXR3ZWVuIHRoZSB0d28sIHNvIHRoZXkgY2FuIHJ1biBhdA0KPiBkaWZm
ZXJlbnQgcmF0ZXMuDQo+IA0KPiBNeSBjb25jbHVzaW9uIGlzIHRoYXQgdGhlIHBpeGVsIGFycmF5
IGFsd2F5cyBydW5zIGF0IHRoZSBzYW1lIHBpeGVsDQo+IHJhdGUsIHdoZXRoZXIgMTA4MHAsIDcy
MHAsIG9yIGNyb3BwZWQgLSAxNDguNU1QaXgvcy4gQ2VydGFpbmx5IHRoYXQNCj4gaXMNCj4gdGhl
IHJlc3VsdCBuZWVkZWQgZm9yIHZibGFuayBhbmQgaGJsYW5rIGNvbnRyb2xzIHRvIHdvcmsgY29y
cmVjdGx5IGluDQo+IGNvbXB1dGluZyBmcmFtZSByYXRlLiBUaGUgZGF0YXNoZWV0IGFnYWluIGNv
bnRhaW5zIGZpeGVkIHJlZ2lzdGVyDQo+IHNldHRpbmdzIGZvciAyNSwgMzAsIDUwLCA2MCwgMTAw
LCBhbmQgMTIwZnBzIGJ5IGNoYW5naW5nIEhNQVgNCj4gKHJlZ2lzdGVyIDB4MzAxYy9kKSwgYnV0
IHRoZXkgYXJlIGFsbCBqdXN0IGxpbmVhcmx5IHNjYWxlZCB2YWx1ZXMgb2YNCj4gZWFjaCBvdGhl
ciwgc28gaXQgbWFwcyBjbGVhbmx5IG9udG8gVjRMMl9DSURfSEJMQU5LLiBWTUFYIGlzIGZpeGVk
DQo+IGZvcg0KPiAxMDgwcCBhbmQgNzIwcCBtb2Rlcywgc28gbWFwcyB0byBWNEwyX0NJRF9WQkxB
TksuDQoNCkdpdmVuIHRoYXQgdGhlcmUgYXJlIGZpeGVkIG51bWJlcnMgZm9yIDEwODBwLzcyMHAg
Zm9yIFZNQVggYW5kIGZvcg0KMjUsMzAsNTAsNjAgZnBzIGZvciBITUFYIHNob3VsZG4ndCB0aG9z
ZSBjb250cm9scyBiZSByZWFkLW9ubHk/DQpXaGF0J3MgdGhlIGJlbmVmaXQgb2YgYmVpbmcgd3Jp
dGFibGUgaW4gWzFdPw0KDQo+IFRoZSBNSVBJIFBIWSB0aGVuIHJ1bnMgYXQgYSBsaW5rIGZyZXF1
ZW5jeSBzdWZmaWNpZW50IHRvIGNvbnZleSB0aGUNCj4gZGVzaXJlZCBwaXhlbHM6DQo+IC0gMzU2
NCBNYml0L3MgYWNyb3NzIDQgbGFuZXMgZm9yIDEwODBwMTAwLzEyMCAxMGJwcA0KPiAtIDE3ODIg
TWJpdC9zIHNwbGl0IGFjcm9zcyAyIG9yIDQgbGFuZXMgZm9yIDEwODBwIG9yIHdpbmRvdyBjcm9w
cGVkDQo+IG1vZGVzIHVwIHRvIDYwZnBzLCAxMCBvciAxMmJwcC4NCj4gLSAxMTg4IE1iaXQvcyBz
cGxpdCBhY3Jvc3MgMiBvciA0IGxhbmVzIGZvciA3MjBwIHVwIHRvIDYwZnBzLCAxMCBvcg0KPiAx
MmJwcA0KPiBUaGlzIGlzIGNvbnRyb2xsZWQgcHJlZG9taW5hbnRseSBieSBJTkNLU0VMMSAmIDIg
KHJlZ2lzdGVycw0KPiAweDMwNWMvZCkuDQo+IEkgdmVyaWZpZWQgdGhlIGFjdHVhbCBsaW5rIGZy
ZXF1ZW5jaWVzIHVzZWQgb24gYSBzY29wZSwgYW5kIHRoZXkgYXJlDQo+IGFzIGRlc2NyaWJlZC4N
Cj4gMTc4Mk1iaXQvcyBpcyBzdWZmaWNpZW50IGZvciAxOTIweDEwODBANjBmcHMgMTJicHAuIENy
b3BwaW5nIG9yIDEwYnBwDQo+IGp1c3QgaW5jcmVhc2VzIHRoZSBwZXIgbGluZSBibGFua2luZyBw
ZXJpb2Qgb24gdGhlIENTSTIgaW50ZXJmYWNlLg0KDQpJcyB0aGVyZSBhY3R1YWwgYmxhbmtpbmcg
b24gQ1NJMiBpbnRlcmZhY2UsIGFzIGluIGluc2VydGluZyAiZHVtbXkiDQpwaXhlbHMgaW4gYSBy
b3cgYW5kIGR1bW15IGxpbmVzPyBHaXZlbiB0aGF0IHRoZSBzcGVjIGlzIG5vdCBhdmFpbGFibGUN
CmZyZWVseSBpdCdzIGhhcmQgdG8gdW5kZXJzdGFuZCB3aGF0J3MgYWN0dWFsbHkgaGFwcGVuaW5n
IG9uIHRoZQ0KaW50ZXJmYWNlLg0KR2l2ZW4gdGhhdCB0aGUgbGluayBmcmVxdWVuY3kgaXMgZml4
ZWQgKGluIHRoaXMgY2FzZSBkZXBlbmRpbmcgb24NCndpbmRvdyBtb2RlLCBpbnB1dCBjbG9jayBh
bmQgbnVtYmVyIG9mIGxhbmVzKSBJIHdhcyB3b25kZXJpbmcgd2hhdCdzDQpoYXBwZW5pbmcgd2hl
biB0aGUgcGF5bG9hZCBsZW5ndGggY2hhbmdlcyAoZS5nLiBzd2l0Y2hpbmcgYnBwIG9yDQpjcm9w
cGluZykuDQoNCj4gQUZBSUNUIHlvdSBjb3VsZCBqdXN0IGFsd2F5cyBydW4gYXQgdGhlIDE3ODIg
TWJpdC9zIHJhdGUgd2l0aA0KPiBzbGlnaHRseQ0KPiBpbmNyZWFzZWQgaWRsZSB0aW1lIG9uIHRo
ZSBDU0kyIGJ1cyBmb3IgdGhlIDcyMHAgbW9kZSwgYnV0IHRoYXQgaXNuJ3QNCj4gdGhlIHdheSBT
b255IGhhdmUgc3BlY2lmaWVkIGl0Lg0KPiANCj4gVGhlcmUgaXMgYSBmdXJ0aGVyIHJlZ2lzdGVy
IHRvIGhhbHZlIHRoZSBsaW5rIGZyZXF1ZW5jeSBhZ2FpbiBmb3IgbWF4DQo+IDI1LzMwZnBzIG1v
ZGVzICgweDM0MDUpLCBhbHRob3VnaCBkb2luZyBzbyBoYXMgbGltaXRlZCBiZW5lZml0IChpdCdk
DQo+IGluY3JlYXNlIHJvbGxpbmcgc2h1dHRlciBlZmZlY3RzIGFzIGl0IHdvdWxkIGluY3JlYXNl
IHRoZSB0ZW1wb3JhbA0KPiBkaWZmZXJlbmNlIGJldHdlZW4gZWFjaCBsaW5lKS4NCj4gDQo+IEkg
aG9wZSB0aGF0IG1ha2VzIHRoaW5ncyBhIGxpdHRsZSBjbGVhcmVyLiBJbmRlZWQgdGhlIGN1cnJl
bnQgZHJpdmVyDQo+IGlzIHNsaWdodGx5IHdyb25nLCBidXQgb25seSBpbiByZWxhdGlvbiB0byBw
aXhlbCByYXRlLCBub3QgbGluaw0KPiBmcmVxdWVuY3kuDQoNClRoYW5rcyBmb3IgY29uZmlybWF0
aW9uLiBJIG1lYW53aGlsZSBmb3VuZCB0aGUgdGFibGUgcHJvdmlkaW5nIHRoZSBsaW5rDQpmcmVx
dWVuY2llcy4NCkkgYXNzdW1lIG5vdyB0aGF0IG15IGN1cnJlbnQgcHJvYmxlbSByZWdhcmRpbmcg
c2V0dGxlIHRpbWUgaXMgc29tZXdoZXJlDQplbHNlLiBJIGNhbiBjdXJyZW50bHkgb25seSBhc3N1
bWUgdGhlIGVzY2FwZSBjbG9jayBpcyBub3QgY29ycmVjdCwgYnV0DQp0aGVyZSBpcyBwcmV0dHkg
bXVjaCBubyBkb2N1bWVudGF0aW9uIGF0IGFsbCBvbiB0aGF0IHRvcGljLg0KDQpUaGFua3MgYW5k
IGJlc3QgcmVnYXJkcw0KQWxleGFuZGVyDQoNClsxXSANCmh0dHBzOi8vZ2l0aHViLmNvbS9yYXNw
YmVycnlwaS9saW51eC9jb21taXRzL3JwaS01LjEwLnkvZHJpdmVycy9tZWRpYS9pMmMvaW14Mjkw
LmMNCg0KLS0gDQpNaXQgZnJldW5kbGljaGVuIEdyw7zDn2VuDQogDQppLkEuIEFsZXhhbmRlciBT
dGVpbg0KRW50d2lja2x1bmcgU3RhbmRvcnQgQ2hlbW5pdHoNClRlbC4gKzQ5IDM3MSA0MzMxNTEt
MCwgRmF4ICs0OSAzNzEgNDMzMTUxLTIyDQpad2lja2F1ZXIgU3RyYcOfZSAxNzMsIDA5MTE2IENo
ZW1uaXR6DQptYWlsdG86IEFsZXhhbmRlci5TdGVpbkB0cS1ncm91cC5jb20NCiANClRRLVN5c3Rl
bXMgR21iSA0KTcO8aGxzdHJhw59lIDIsIEd1dCBEZWxsaW5nLCA4MjIyOSBTZWVmZWxkDQpBbXRz
Z2VyaWNodCBNw7xuY2hlbiwgSFJCIDEwNTAxOA0KU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBTZWVm
ZWxkDQpHZXNjaMOkZnRzZsO8aHJlcjogRGV0bGVmIFNjaG5laWRlciwgUsO8ZGlnZXIgU3RhaGws
IFN0ZWZhbiBTY2huZWlkZXINCnd3dy50cS1ncm91cC5jb20NCg0K
