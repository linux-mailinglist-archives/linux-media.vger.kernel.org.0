Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E60E3C1453
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 15:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhGHNhB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 09:37:01 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:54116 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhGHNhA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 09:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625751258; x=1628343258;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zH53uNPS5xmLCDripd7d0qn0buCaziISb5rRg/JNb/0=;
        b=Iz1crQWZpbWY8N0uBYVaov5TyuQ53/U20x+m/mgPRxX/UEH/AVTHzL5rAFFtxH34
        igp2TNWH+unBazRxHBto5Vt9iycahecJH6gxdi5Fl8wdszNf0WpkyZ1iKAnfWacR
        mSR3vel6JK700grKe11D7+tyF5ksBjrB+fdsoK+bQpA=;
X-AuditID: c39127d2-1d8f870000001daf-49-60e6fed99d05
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 6E.6A.07599.9DEF6E06; Thu,  8 Jul 2021 15:34:18 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 15:34:17 +0200
Received: from Berlix.phytec.de ([fe80::c131:350d:c471:aafd]) by
 berlix.phytec.de ([fe80::c131:350d:c471:aafd%3]) with mapi id 15.01.2308.008;
 Thu, 8 Jul 2021 15:34:17 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v4 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Topic: [PATCH v4 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Index: AQHXc9pX2TiPqEDsxkK7azMWGvOkg6s4zguAgAAkn4A=
Date:   Thu, 8 Jul 2021 13:34:17 +0000
Message-ID: <b588b43347afe377b6fda03c54855f97a421d89f.camel@phytec.de>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
         <20210708091922.5508-6-s.riedmueller@phytec.de>
         <20210708112313.GA3@paasikivi.fi.intel.com>
In-Reply-To: <20210708112313.GA3@paasikivi.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBF18D637A37714A9DDBF5153DA2A2B5@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWyRoChTPfWv2cJBrd3MlrMP3KO1aJz4hJ2
        i8u75rBZ9GzYymqxbNMfJovWvUfYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAldHe28RacMGxomf3BbYGxh/2XYycHBICJhKPOnazgthCAsuZJDbsMupi5AKy
        HzBKHN+xkRHC2cgosWXSCTaQKjYBF4nPbd/AbBEBR4lZz7+wghQxCzxikvj76QhTFyMHh7BA
        sETbvXyImhCJtTv/s0LYVhLvDq9hBLFZBFQktrc+ZwexeQXcJBrm7GSDWDaXUeJZ7z0WkASn
        gIVE1+VFYDajgKxEZ8M7JhCbWUBcYtOz76wQLwhILNlznhnCFpV4+fgfVFxBoq2nE+weZgFN
        ifW79CFaLSQWLmxmhrAVJaZ0P4S6QVDi5MwnLBMYxWch2TALoXsWku5ZSLpnIelewMi6ilEo
        NzM5O7UoM1uvIKOyJDVZLyV1EyMwVg9PVL+0g7FvjschRiYOxkOMEhzMSiK8RjOeJQjxpiRW
        VqUW5ccXleakFh9ilOZgURLn3cBbEiYkkJ5YkpqdmlqQWgSTZeLglGpgFFuxKcem+ZRA3TsG
        BuFIh9BCpubvuqz5iSZmkuetEzxPrdtyINT5g6tX+jqOhyVsj53efFVeOFXv4aqn4iZP2NKY
        bBrVHzy8YSDqaxp508BZ0OBxyvvMmrOs3/d5Bl2v4OJ7d/HkWXtHvpXFmtbVC4Myk68qRLQ/
        udP5qHHOiemJ+j+fnBZRYinOSDTUYi4qTgQAU9vq58MCAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU2FrYXJpLA0KDQpPbiBUaHUsIDIwMjEtMDctMDggYXQgMTQ6MjMgKzAzMDAsIFNha2FyaSBB
aWx1cyB3cm90ZToNCj4gSGkgU3RlZmFuLA0KPiANCj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoN
ClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KPiANCj4gT24gVGh1LCBKdWwgMDgsIDIwMjEg
YXQgMTE6MTk6MjFBTSArMDIwMCwgU3RlZmFuIFJpZWRtdWVsbGVyIHdyb3RlOg0KPiA+IENvbnZl
cnQgbXQ5cDAzMSBzZW5zb3IgYmluZGluZ3MgdG8geWFtbCBzY2hlbWEuIEFsc28gdXBkYXRlIHRo
ZQ0KPiA+IE1BSU5UQUlORVJTIGVudHJ5Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZh
biBSaWVkbXVlbGxlciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMuZGU+DQo+ID4gLS0tDQo+ID4gIC4u
Li9iaW5kaW5ncy9tZWRpYS9pMmMvYXB0aW5hLG10OXAwMzEueWFtbCAgICB8IDc1ICsrKysrKysr
KysrKysrKysrKysNCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAw
MzEudHh0IHwgNDAgLS0tLS0tLS0tLQ0KPiA+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0
aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvYXB0aW5hLG10OXAwMzEu
eWFtbA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9hcHRpbmEs
bXQ5cDAzMS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvaTJjL2FwdGluYSxtdDlwMDMxLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uN2RlNjJlMzM5ODk1DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvYXB0aW5h
LG10OXAwMzEueWFtbA0KPiA+IEBAIC0wLDAgKzEsNzUgQEANCj4gPiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEu
Mg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tZWRp
YS9pMmMvbXQ5cDAzMS55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBBcHRpbmEgMS8yLjUt
SW5jaCA1TXAgQ01PUyBEaWdpdGFsIEltYWdlIFNlbnNvcg0KPiA+ICsNCj4gPiArbWFpbnRhaW5l
cnM6DQo+ID4gKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjogfA0KPiA+ICsgIFRoZSBBcHRpbmEg
TVQ5UDAzMSBpcyBhIDEvMi41LWluY2ggQ01PUyBhY3RpdmUgcGl4ZWwgZGlnaXRhbCBpbWFnZQ0K
PiA+IHNlbnNvcg0KPiA+ICsgIHdpdGggYW4gYWN0aXZlIGFycmF5IHNpemUgb2YgMjU5MkggeCAx
OTQ0Vi4gSXQgaXMgcHJvZ3JhbW1hYmxlIHRocm91Z2gNCj4gPiBhDQo+ID4gKyAgc2ltcGxlIHR3
by13aXJlIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsg
IGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAtIGFwdGluYSxtdDlwMDMx
DQo+ID4gKyAgICAgIC0gYXB0aW5hLG10OXAwMzFtDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiAr
ICAgIGRlc2NyaXB0aW9uOiBJMkMgZGV2aWNlIGFkZHJlc3MNCj4gPiArICAgIG1heEl0ZW1zOiAx
DQo+ID4gKw0KPiA+ICsgIHJlc2V0LWdwaW9zOg0KPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiAr
ICAgIGRlc2NyaXB0aW9uOiBDaGlwIHJlc2V0IEdQSU8NCj4gPiArDQo+ID4gKyAgcG9ydDoNCj4g
PiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiANCj4g
VGhpcyBzaG91bGQgcHJvYmFibHkgYmU6DQo+IA0KPiAJJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFt
bCMvJGRlZnMvcG9ydC1iYXNlDQoNCkkgYWN0dWFsbHkgd2FzIG5vdCBzdXJlIHdoaWNoIG9uZSBv
ZiB0aGVzZSB0byB1c2UgYmVjYXVzZSBJIGZvdW5kIGJvdGggaW4NCmV4aXN0aW5nIGJpbmRpbmdz
LiBBbHNvIC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydCBoYXMgYSByZWZlcmVu
Y2UNCnRvICRkZWZzL3BvcnQtYmFzZS4gSXQgd291bGQgYmUgbmljZSBpZiB5b3Ugb3Igc29tZW9u
ZSBlbHNlIGNvdWxkIGdpdmUgbWUgYQ0KaGludCB3aHkgL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRl
ZnMvcG9ydC1iYXNlIHdvdWxkIGJlIHRoZSBjb3JyZWN0IG9uZSBoZXJlLg0KDQo+IA0KPiA+ICsg
ICAgYWRkaXR0aW9uYWxQcm9lcHJ0aWVzOiBmYWxzZQ0KPiANCj4gQ291bGQgeW91IHJ1bg0KPiAN
Cj4gCW1ha2UgZHRfYmluZGluZ19jaGVjaw0KPiBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55DQo+IGFtbA0K
PiANCj4gcGxlYXNlPw0KDQpTb3JyeSwgSSB0b3RhbGx5IGZvcmdvdCBhYm91dCB0aGlzLiBJJ2xs
IGRvIHNvIGJlZm9yZSBzZW5kaW5nIHRoZSBuZXh0DQp2ZXJzaW9uLg0KDQo+IA0KPiA+ICsNCj4g
PiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIGVuZHBvaW50Og0KPiA+ICsgICAgICAgICRy
ZWY6IC9zY2hlbWFzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMNCj4gPiArICAgICAgICB1
bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4gKyAgICAgICAgICBpbnB1dC1jbG9jay1mcmVxdWVuY3k6IHRydWUNCj4gPiArICAg
ICAgICAgIHBpeGVsLWNsb2NrLWZyZXF1ZW5jeTogdHJ1ZQ0KPiANCj4gVGhlc2UgdHdvIGxlZ2Fj
eSBwcm9wZXJ0aWVzIHdlcmUgbm90IGluIHRoZSBlbmRwb2ludCBwcmV2aW91c2x5Lg0KDQpUaGF0
J3MgcmlnaHQsIGJ1dCB0aGV5IGFyZSBiZWluZyBwYXJzZWQgZnJvbSB0aGUgZW5kcG9pbnQgc28g
SSBmaWd1cmVkIHRoZXkNCmJlbG9uZyBoZXJlLiBTaG91bGQgSSBtZW50aW9uIHRoaXMgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlPw0KDQpUaGFua3MsDQpTdGVmYW4NCg0KPiANCj4gPiArDQo+ID4gKyAg
ICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgICAtIGlucHV0LWNsb2NrLWZyZXF1ZW5jeQ0K
PiA+ICsgICAgICAgICAgLSBwaXhlbC1jbG9jay1mcmVxdWVuY3kNCj4gPiArDQo+ID4gK3JlcXVp
cmVkOg0KPiA+ICsgIC0gY29tcGF0aWJsZQ0KPiA+ICsgIC0gcmVnDQo+ID4gKyAgLSBwb3J0DQo+
ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1w
bGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAgaTJjMCB7DQo+ID4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKw0KPiA+
ICsgICAgICAgIG10OXAwMzFANWQgew0KPiA+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImFw
dGluYSxtdDlwMDMxIjsNCj4gPiArICAgICAgICAgICAgcmVnID0gPDB4NWQ+Ow0KPiA+ICsgICAg
ICAgICAgICByZXNldC1ncGlvcyA9IDwmZ3Bpb19zZW5zb3IgMCAwPjsNCj4gPiArDQo+ID4gKyAg
ICAgICAgICAgIHBvcnQgew0KPiA+ICsgICAgICAgICAgICAgICAgbXQ5cDAzMV8xOiBlbmRwb2lu
dCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgaW5wdXQtY2xvY2stZnJlcXVlbmN5ID0gPDYw
MDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHBpeGVsLWNsb2NrLWZyZXF1ZW5jeSA9
IDw5NjAwMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAgICB9Ow0KPiA+ICsgICAgICAgICAgICB9
Ow0KPiA+ICsgICAgICAgIH06DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArLi4uDQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbXQ5
cDAzMS50eHQNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9p
MmMvbXQ5cDAzMS50eHQNCj4gPiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCBj
YjYwNDQzZmY3OGYuLjAwMDAwMDAwMDAwMA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQNCj4gPiArKysgL2Rldi9udWxsDQo+
ID4gQEAgLTEsNDAgKzAsMCBAQA0KPiA+IC0qIEFwdGluYSAxLzIuNS1JbmNoIDVNcCBDTU9TIERp
Z2l0YWwgSW1hZ2UgU2Vuc29yDQo+ID4gLQ0KPiA+IC1UaGUgQXB0aW5hIE1UOVAwMzEgaXMgYSAx
LzIuNS1pbmNoIENNT1MgYWN0aXZlIHBpeGVsIGRpZ2l0YWwgaW1hZ2Ugc2Vuc29yDQo+ID4gd2l0
aA0KPiA+IC1hbiBhY3RpdmUgYXJyYXkgc2l6ZSBvZiAyNTkySCB4IDE5NDRWLiBJdCBpcyBwcm9n
cmFtbWFibGUgdGhyb3VnaCBhDQo+ID4gc2ltcGxlDQo+ID4gLXR3by13aXJlIHNlcmlhbCBpbnRl
cmZhY2UuDQo+ID4gLQ0KPiA+IC1SZXF1aXJlZCBQcm9wZXJ0aWVzOg0KPiA+IC0tIGNvbXBhdGli
bGU6IHZhbHVlIHNob3VsZCBiZSBlaXRoZXIgb25lIGFtb25nIHRoZSBmb2xsb3dpbmcNCj4gPiAt
CShhKSAiYXB0aW5hLG10OXAwMzEiIGZvciBtdDlwMDMxIHNlbnNvcg0KPiA+IC0JKGIpICJhcHRp
bmEsbXQ5cDAzMW0iIGZvciBtdDlwMDMxbSBzZW5zb3INCj4gPiAtDQo+ID4gLS0gaW5wdXQtY2xv
Y2stZnJlcXVlbmN5OiBJbnB1dCBjbG9jayBmcmVxdWVuY3kuDQo+ID4gLQ0KPiA+IC0tIHBpeGVs
LWNsb2NrLWZyZXF1ZW5jeTogUGl4ZWwgY2xvY2sgZnJlcXVlbmN5Lg0KPiA+IC0NCj4gPiAtT3B0
aW9uYWwgUHJvcGVydGllczoNCj4gPiAtLSByZXNldC1ncGlvczogQ2hpcCByZXNldCBHUElPDQo+
ID4gLQ0KPiA+IC1Gb3IgZnVydGhlciByZWFkaW5nIG9uIHBvcnQgbm9kZSByZWZlciB0bw0KPiA+
IC1Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvdmlkZW8taW50ZXJmYWNl
cy50eHQuDQo+ID4gLQ0KPiA+IC1FeGFtcGxlOg0KPiA+IC0NCj4gPiAtCWkyYzBAMWMyMjAwMCB7
DQo+ID4gLQkJLi4uDQo+ID4gLQkJLi4uDQo+ID4gLQkJbXQ5cDAzMUA1ZCB7DQo+ID4gLQkJCWNv
bXBhdGlibGUgPSAiYXB0aW5hLG10OXAwMzEiOw0KPiA+IC0JCQlyZWcgPSA8MHg1ZD47DQo+ID4g
LQkJCXJlc2V0LWdwaW9zID0gPCZncGlvMyAzMCAwPjsNCj4gPiAtDQo+ID4gLQkJCXBvcnQgew0K
PiA+IC0JCQkJbXQ5cDAzMV8xOiBlbmRwb2ludCB7DQo+ID4gLQkJCQkJaW5wdXQtY2xvY2stZnJl
cXVlbmN5ID0gPDYwMDAwMDA+Ow0KPiA+IC0JCQkJCXBpeGVsLWNsb2NrLWZyZXF1ZW5jeSA9IDw5
NjAwMDAwMD47DQo+ID4gLQkJCQl9Ow0KPiA+IC0JCQl9Ow0KPiA+IC0JCX07DQo+ID4gLQkJLi4u
DQo+ID4gLQl9Ow0KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+
ID4gaW5kZXggYzc0NTY3NzZhY2U1Li5mMjEyMzIyNmJhYWUgMTAwNjQ0DQo+ID4gLS0tIGEvTUFJ
TlRBSU5FUlMNCj4gPiArKysgYi9NQUlOVEFJTkVSUw0KPiA+IEBAIC0xMjYxMCw2ICsxMjYxMCw3
IEBAIE06CUxhdXJlbnQgUGluY2hhcnQgPA0KPiA+IGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJv
YXJkLmNvbT4NCj4gPiAgTDoJbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnDQo+ID4gIFM6CU1h
aW50YWluZWQNCj4gPiAgVDoJZ2l0IGdpdDovL2xpbnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0DQo+
ID4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvYXB0aW5h
LG10OXAwMzEueWFtbA0KPiA+ICBGOglkcml2ZXJzL21lZGlhL2kyYy9tdDlwMDMxLmMNCj4gPiAg
RjoJaW5jbHVkZS9tZWRpYS9pMmMvbXQ5cDAzMS5oDQo+ID4gIA0K
