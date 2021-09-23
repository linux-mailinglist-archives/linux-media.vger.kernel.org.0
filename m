Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB1E416039
	for <lists+linux-media@lfdr.de>; Thu, 23 Sep 2021 15:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241432AbhIWNqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Sep 2021 09:46:30 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:12160 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241253AbhIWNqa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Sep 2021 09:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1632404698; x=1663940698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-id:
   content-transfer-encoding;
  bh=/JY3wrl8qrfEJ2IQCgT8Yd0CJdD5eUC9jDPVJ7R47TU=;
  b=f6FeIAQWTYsW7Zz2fKw029yO2plhoNuED0Ze/Mr9GpZxL41EbvAoFX8h
   sxIpO1EKxgmbpWiqoY2OJEZTXEERskqyy9MxsdO82fyBMlniTwjuxbkt/
   7YtbIk8v2LXI5daUrC9ozYCVUI0xu4QWRS68JLXtEouY40vpzUPuBVWI8
   25rsSszUFGAfxX3He12ITgk4dbpSWYW60bdn9/sEc6y7hZYNJ7z9NIqsz
   K+SRyfafnV4phtYl48/L4mm3/Rn9SVO7lh5emxcTODNTkMlAfg5YUlDVB
   MsbmdFMvf1vBAYwpj0ogQhOZHh7POms5IaA5QfQ2G5dLL3reMLxc/bkzy
   w==;
X-IronPort-AV: E=Sophos;i="5.85,316,1624312800"; 
   d="scan'208";a="19675913"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Sep 2021 15:44:57 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 23 Sep 2021 15:44:57 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 23 Sep 2021 15:44:57 +0200
X-IronPort-AV: E=Sophos;i="5.85,316,1624312800"; 
   d="scan'208";a="19675912"
Received: from vmail01.tq-net.de ([10.150.72.11])
  by mx1.tq-group.com with ESMTP; 23 Sep 2021 15:44:57 +0200
Received: from vmail01.tq-net.de (10.150.72.11) by vmail01.tq-net.de
 (10.150.72.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 15:44:57 +0200
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2308.014; Thu, 23 Sep 2021 15:44:57 +0200
From:   "Stein, Alexander" <Alexander.Stein@tq-group.com>
To:     "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>
CC:     "mani@kernel.org" <mani@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: (EXT) Re: (EXT) Re: Sony IMX290 link frequency
Thread-Topic: (EXT) Re: (EXT) Re: Sony IMX290 link frequency
Thread-Index: AQHXre5JzF/aKpNWCk+hzVQ71Sk0G6usp7AAgAFEgACAAEDjAIADV+wA
Date:   Thu, 23 Sep 2021 13:44:57 +0000
Message-ID: <4748e83d608727a240b817375fec459649ec02cb.camel@tq-group.com>
References: <01d4c7efb1ef900c499fda6af2c5a19ce923dc15.camel@tq-group.com>
         <CAPY8ntB-7g5FigO9rNV4YGWCeHUWkO4v1kp96mW-icGwT-rk9w@mail.gmail.com>
         <a5e73b514299e17008f9e4a233553283ec7a88c9.camel@tq-group.com>
         <CAPY8ntBBxsUgGeFQJO_N1pAgg20bRxJW=t=_ZOhfWp0=MA9uBQ@mail.gmail.com>
In-Reply-To: <CAPY8ntBBxsUgGeFQJO_N1pAgg20bRxJW=t=_ZOhfWp0=MA9uBQ@mail.gmail.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C520A0911AAD74AAE5689A8A7785BD8@tq-group.com>
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8gRGF2ZSwNCg0KT24gVHVlLCAyMSBTZXB0IDIwMjEgYXQgMTE6NDEgKzAxMDAsIERhdmUg
U3RldmVuc29uOg0KPiBXaGlsc3QgdGhlIHNwZWMgaXMgcmVzdHJpY3RlZCwgdGhlcmUgYXJlIGEg
ZmV3IGludHJvZHVjdGlvbnMgdGhhdA0KPiBnaXZlDQo+IGEgYmFzaWMgdW5kZXJzdGFuZGluZywg
ZWcgWzFdDQoNClRoYW5rcywgdGhpcyBoZWxwZWQgYSBiaXQuDQoNCj4gQ2xvY2sgbGFuZXMgYW5k
IGRhdGEgbGFuZXMgbWF5IGRvIHNsaWdodGx5IGRpZmZlcmVudCB0aGluZ3MuIEl0IGlzDQo+IG5v
dA0KPiB1bmNvbW1vbiBmb3IgdGhlIGNsb2NrIGxhbmUgdG8gcmVtYWluIGluIEhTIG1vZGUgYXQg
YWxsIHRpbWVzLCBidXQNCj4gdGhlDQo+IGRhdGEgbGFuZXMgd2lsbCBhbG1vc3QgYWx3YXlzIGRy
b3AgdG8gTFAtMTEuIERldmljZSB0cmVlIGhhcyBhDQo+IGNsb2NrLW5vbmNvbnRpbnVvdXMgcHJv
cGVydHkgdG8gZGVub3RlIHRoYXQgdGhlIGNsb2NrIGxhbmUgZHJvcHMgdG8NCj4gTFAsIHdoaWNo
IG1hcHMgdG8gdGhlIFY0TDIgZmxhZyBWNEwyX01CVVNfQ1NJMl9OT05DT05USU5VT1VTX0NMT0NL
Lg0KPiBUaGVyZSBpcyBubyBtZW50aW9uIGluIHRoZSBkYXRhc2hlZXQgYXMgdG8gd2hldGhlciBJ
TVgyOTAvMzI3DQo+IHByb2R1Y2VzDQo+IGEgY29udGludW91cyBjbG9jayBzaWduYWwgb3Igbm90
LCBhbmQgSSBjYW4ndCBzYXkgdGhhdCBJJ3ZlIGNoZWNrZWQuDQo+IFNvbWUgcmVjZWl2ZXJzIGNh
biBnZXQgY29uZnVzZWQgaWYgdGhlIGNsb2NrIGlzIGNvbnRpbnVvdXMgYW5kIHRoZXkNCj4gbWlz
cyB0aGUgaW5pdGlhbCBzdGF0ZSBjaGFuZ2UgZnJvbSBMUCB0byBIUy4NCg0KV2hvIGRyaXZlcyB0
aGUgY2xvY2sgbGFuZT8gVGhlIHNlbnNvciBvciB0aGUgaG9zdCBwcm9jZXNzb3I/IElmIGl0IGlz
DQp0aGUgc2Vuc29yIGhvdyBkbyB5b3Ugc3VwcG9ydCBzZXZlcmFsIHNlbnNvcnMgb24gdGhlIHNh
bWUgYnVzPw0KDQo+ID4gPiA+ID4gPiBJIGFzc3VtZSBub3cgdGhhdCBteSBjdXJyZW50IHByb2Js
ZW0gcmVnYXJkaW5nIHNldHRsZSB0aW1lIGlzDQo+ID4gc29tZXdoZXJlDQplbHNlLiBJIGNhbiBj
dXJyZW50bHkgb25seSBhc3N1bWUgdGhlIGVzY2FwZSBjbG9jayBpcyBub3QgY29ycmVjdCwNCj4g
PiBidXQNCnRoZXJlIGlzIHByZXR0eSBtdWNoIG5vIGRvY3VtZW50YXRpb24gYXQgYWxsIG9uIHRo
YXQgdG9waWMuDQo+IA0KPiBXaGF0IHBsYXRmb3JtIGFyZSB5b3Ugd29ya2luZyB3aXRoPw0KDQpJ
J20gd29ya2luZyBvbiBhbiBpLk1YOFFNIGJhc2VkIGJvYXJkLiBBIHB1YmxpYyBSTSBpcyBhdmFp
bGFibGUgc2luY2UNCnNldmVyYWwgZGF5cyBbMV0uIFRoZSBNSVBJLUNTSSBzdWJzeXN0ZW0gY2hh
cHRlcnMgYXJlIGEgYml0IGxhY2tpbmcuDQpBbHNvIEkgYW0gYXdhcmUgdGhhdCB0aGUgSVNJIGRv
ZXMgc29tZSBzdHJhbmdlIHRoaW5ncyB3aXRoIENTSSBpbnB1dCwNCnNlZSBhbHNvIFsxXSwgYnV0
IHRoYXQgaXMgYSBkaWZmZXJlbnQgaXNzdWUuDQoNCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQgZGlm
ZmVyZW50IGRvY3VtZW50cywgdGhlIGVzY2FwZSBjbG9jayBpcyB1c2VkDQpkdXJpbmcgTFAtMTEg
YW5kIHNoYWxsIGJlIGZyb20gMTAgdG8gMjAgTUh6Lg0KVGhlIGRldmljZSB0cmVlIGNvbmZpZ3Vy
ZXMgc29tZSBjbG9jayB0byA3Mk1IeiBbMl0sIGJ1dCBJIGRvIG5vdCBrbm93DQp3aGF0J3MgaGFw
cGVuaW5nIGludGVybmFsbHkuDQoNCkkgdXNlZCB0aGUgc2FtZSBhcHByb2FjaCBmb3IgY2FsY3Vs
YXRpbmcgdGhlIHNldHRsZSB0aW1lIGFzIFszXS4gQnV0IEkNCmhhdmUgdG8gdXNlIGEgdmFsdWUg
c2xpZ2h0bHkgYmVsb3cgdGhlIG1heGltdW0gcmF0aGVyIHRoYW4gdGhlIGF2ZXJhZ2UNCg0KPiBU
aGVyZSBhcmUgcmVnaXN0ZXJzIGluIHRoZSBJTVgyOTAvMzI3IHdoaWNoIGNvbmZpZ3VyZSB0aGUg
TUlQSQ0KPiB0aW1pbmdzDQo+IC0gMHgzNDQ1LTB4MzQ1NS4gVGhlIHZhbHVlcyBkbyBkaWZmZXIg
YmFzZWQgb24gdGhlIGxpbmsgZnJlcXVlbmN5LA0KPiBidXQNCj4gY2hlY2tpbmcgb3VyIGRyaXZl
ciB0byB0aGUgZGF0YXNoZWV0IHRoZXkgYXBwZWFyIHRvIGJlIGFsbCBjb3JyZWN0Lg0KDQpBZ3Jl
ZWQuIA0KDQpbMV0gaHR0cHM6Ly93d3cubnhwLmNvbS9kb2NzL2VuL3JlZmVyZW5jZS1tYW51YWwv
SU1YOFFNUk0ucGRmDQpbMl0gDQpodHRwczovL3loYnQubmV0L2xvcmUvYWxsLzIwMjAwMjI2MTUx
NDMxLkdZNTM3OUBwYWFzaWtpdmkuZmkuaW50ZWwuY29tL1QvDQoNClszXSANCmh0dHBzOi8vc291
cmNlLmNvZGVhdXJvcmEub3JnL2V4dGVybmFsL2lteC9saW51eC1pbXgvdHJlZS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4LXNzLWltZy5kdHNpP2g9bGYtNS4xMC55I241MTYNCg0K
WzRdIA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXg4bXEtbWlw
aS1jc2kyLmMjbjM0Mw0KDQotLSANCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4NCiANCmkuQS4g
QWxleGFuZGVyIFN0ZWluDQpFbnR3aWNrbHVuZyBTdGFuZG9ydA0KQ2hlbW5pdHoNClRlbC4gKzQ5
IDM3MSA0MzMxNTEtMCwgRmF4ICs0OSAzNzEgNDMzMTUxLTIyDQpad2lja2F1ZXIgU3RyYcOfZQ0K
MTczLCAwOTExNiBDaGVtbml0eg0KbWFpbHRvOiBBbGV4YW5kZXIuU3RlaW5AdHEtZ3JvdXAuY29t
DQogDQpUUS1TeXN0ZW1zIEdtYkgNCk3DvGhsc3RyYcOfZSAyLCBHdXQgRGVsbGluZywgODIyMjkg
U2VlZmVsZA0KQW10c2dlcmljaHQgTcO8bmNoZW4sIEhSQiAxMDUwMTgNClNpdHogZGVyIEdlc2Vs
bHNjaGFmdDogU2VlZmVsZA0KR2VzY2jDpGZ0c2bDvGhyZXI6IERldGxlZiBTY2huZWlkZXIsIFLD
vGRpZ2VyIFN0YWhsLCBTdGVmYW4gU2NobmVpZGVyDQp3d3cudHEtZ3JvdXAuY29tDQo=
