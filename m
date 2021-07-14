Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366CB3C8251
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 12:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239002AbhGNKEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 06:04:23 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:49848 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238638AbhGNKEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 06:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626256889; x=1628848889;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0ji/ipLO3fPbltVE8RyB8bIAo/Pf5w3lSwqfXIL5icM=;
        b=MhhqreNXHLj7dMjq8IFtuv3ujtYy8arBPR48DSHp7oCDdVfFTgbyyJHDylPZk0xn
        PBHk6ROawVCLQ6KPzb0Fx8/Eu5jHXteGAJp+KFfh0vxwkZtqv3jxfHpvL9sqeFa8
        rss6HGM7mFs4qriCEcUH/rKokmszQ/NUwXIx/MdhJuA=;
X-AuditID: c39127d2-1e4f970000001daf-98-60eeb5f909a2
Received: from berlix.phytec.de (Berlix.phytec.de [172.16.0.117])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 49.C4.07599.9F5BEE06; Wed, 14 Jul 2021 12:01:29 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Berlix.phytec.de
 (172.16.0.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 14 Jul
 2021 12:01:29 +0200
Received: from Berlix.phytec.de ([fe80::c131:350d:c471:aafd]) by
 berlix.phytec.de ([fe80::c131:350d:c471:aafd%3]) with mapi id 15.01.2308.008;
 Wed, 14 Jul 2021 12:01:29 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Topic: [PATCH v5 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Index: AQHXdvuuBNuYG6Irn0qubhgT2GTh/atBnb0AgACBMoA=
Date:   Wed, 14 Jul 2021 10:01:29 +0000
Message-ID: <99b0b3ad4eac3a5653e0e4630bf59fc63eef114d.camel@phytec.de>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
         <20210712085535.11907-6-s.riedmueller@phytec.de>
         <20210714021904.GA1312716@robh.at.kernel.org>
In-Reply-To: <20210714021904.GA1312716@robh.at.kernel.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE662190177C8B4AB43A21C0DCF018BA@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsWyRoChVPfn1ncJBl03rSzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk8X/PTvYLT5t+cbkwO4xu2Mmq8emVZ1sHvNOBnp83iQXwBLFZZOS
        mpNZllqkb5fAlTFx50PWgjOOFQde9LE1MH6x72Lk5JAQMJHonDCJpYuRi0NIYDmTxJ61B5kg
        nIeMEkv7pkFlNjFKHJl5gRmkhU3AReJz2zc2EFtEQF1i4eqHzCBFzALfmCQudN0AKxIWCJZo
        XfOHGaIoROLGgj5GCNtK4umGs+xdjBwcLAKqEh0rdUFMXgE3iQvrnSF2LWSUWPgTZCYHBydQ
        efdvDZBORgFZic6Gd0wgNrOAuMSmZ99ZIT4QkFiy5zwzhC0q8fLxP6i4gkRbTycTyBhmAU2J
        9bv0IVotJLYf3s8CYStKTOl+yA5i8woISpyc+YRlAqP4LCQbZiF0z0LSPQtJ9ywk3QsYWVcx
        CuVmJmenFmVm6xVkVJakJuulpG5iBEbq4Ynql3Yw9s3xOMTIxMF4iFGCg1lJhHep0dsEId6U
        xMqq1KL8+KLSnNTiQ4zSHCxK4rwbeEvChATSE0tSs1NTC1KLYLJMHJxSDYxSUT4dsx1zm6Xe
        fVr6Y9rti7+vr1g38dB0+fkqKvGyMScDDrR98daojHLSflu76Niybp3uusdszz71Xg9tS20Q
        6X3XUi832Vg1P2P2JAWBcykn3jgdadsYYx2q18h/W8tThzv/0a8GGadl/C9914tYObx3d8qd
        +l3d8s677BvLlR5cevx5x0klluKMREMt5qLiRAC7KFEjwgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpPbiBUdWUsIDIwMjEtMDctMTMgYXQgMjA6MTkgLTA2MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBNb24sIEp1bCAxMiwgMjAyMSBhdCAxMDo1NTozNEFNICswMjAwLCBTdGVm
YW4gUmllZG11ZWxsZXIgd3JvdGU6DQo+ID4gQ29udmVydCBtdDlwMDMxIHNlbnNvciBiaW5kaW5n
cyB0byB5YW1sIHNjaGVtYS4gQWxzbyB1cGRhdGUgdGhlDQo+ID4gTUFJTlRBSU5FUlMgZW50cnku
DQo+ID4gDQo+ID4gQWx0aG91Z2ggaW5wdXQtY2xvY2stZnJlcXVlbmN5IGFuZCBwaXhlbC1jbG9j
ay1mcmVxdWVuY3kgaGF2ZSBub3QgYmVlbg0KPiA+IGRlZmluZGVkIGFzIGVuZHBvaW50IHByb3Bp
ZXJ0aWVzIGluIHRoZSB0ZXh0dWFsIGJpbmRpbmdzLCB0aGUgc2Vuc29yDQo+ID4gZG9lcyBwYXJz
ZSB0aGVtIGZyb20gdGhlIGVuZHBvaW50LiBUaHVzIG1vdmUgdGhlc2UgcHJvcGVydGllcyB0byB0
aGUNCj4gPiBlbmRwb2ludCBpbiB0aGUgbmV3IHlhbWwgYmluZGluZ3MuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55YW1s
ICAgIHwgNzUgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQgfCA0MCAtLS0tLS0tLS0tDQo+ID4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkNCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2ky
Yy9hcHRpbmEsbXQ5cDAzMS55YW1sDQo+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQNCj4gPiAN
Cj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvaTJjL2FwdGluYSxtdDlwMDMxLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvYXB0aW5hLG10OXAwMzEueWFtbA0KPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hZDlhMmRiNzNkODYNCj4gPiAt
LS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55YW1sDQo+ID4gQEAgLTAsMCArMSw3NSBAQA0KPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9zY2hlbWFzL21lZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55YW1sIw0KPiA+ICskc2NoZW1h
OiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+
ID4gK3RpdGxlOiBBcHRpbmEgMS8yLjUtSW5jaCA1TXAgQ01PUyBEaWdpdGFsIEltYWdlIFNlbnNv
cg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlv
bjogfA0KPiA+ICsgIFRoZSBBcHRpbmEgTVQ5UDAzMSBpcyBhIDEvMi41LWluY2ggQ01PUyBhY3Rp
dmUgcGl4ZWwgZGlnaXRhbCBpbWFnZQ0KPiA+IHNlbnNvcg0KPiA+ICsgIHdpdGggYW4gYWN0aXZl
IGFycmF5IHNpemUgb2YgMjU5MkggeCAxOTQ0Vi4gSXQgaXMgcHJvZ3JhbW1hYmxlIHRocm91Z2gN
Cj4gPiBhDQo+ID4gKyAgc2ltcGxlIHR3by13aXJlIHNlcmlhbCBpbnRlcmZhY2UuDQo+ID4gKw0K
PiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+
ICsgICAgICAtIGFwdGluYSxtdDlwMDMxDQo+ID4gKyAgICAgIC0gYXB0aW5hLG10OXAwMzFtDQo+
ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBJMkMgZGV2aWNlIGFkZHJl
c3MNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIHJlc2V0LWdwaW9zOg0KPiA+
ICsgICAgbWF4SXRlbXM6IDENCj4gPiArICAgIGRlc2NyaXB0aW9uOiBDaGlwIHJlc2V0IEdQSU8N
Cj4gPiArDQo+ID4gKyAgcG9ydDoNCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwj
LyRkZWZzL3BvcnQtYmFzZQ0KPiA+ICsgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ID4gKw0KPiA+ICsgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgZW5kcG9pbnQ6DQo+ID4gKyAg
ICAgICAgJHJlZjogL3NjaGVtYXMvbWVkaWEvdmlkZW8taW50ZXJmYWNlcy55YW1sIw0KPiANCj4g
RG9lc24ndCBsb29rIGxpa2UgeW91IHVzZSBhbnkgcHJvcGVydGllcyBmcm9tIHZpZGVvLWludGVy
ZmFjZXMueWFtbC4gWW91IA0KPiBzaG91bGQganVzdCByZWZlcmVuY2UgZ3JhcGgueWFtbCMvJGRl
ZnMvZW5kcG9pbnQtYmFzZSBpbnN0ZWFkLg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4gSXQg
bWFkZSBtZSByZWFsaXplLCB0aGF0IEkgaGF2ZSBzb21ldGhpbmcgd3JvbmcuIFRoZQ0KZHJpdmVy
IGRvZXMgdXNlIHByb3BlcnRpZXMgZnJvbSB0aGUgdmlkZW8gaW50ZXJmYWNlIGFzIGl0IHBhcnNl
cyB0aGUgYnVzDQpjb25maWd1cmF0aW9uIGZyb20gdGhlIGVuZHBvaW50LiBCdXQgSSB0aG91Z2h0
IHRoZXNlIHByb3BlcnRpZXMgd2VyZQ0KaW1wbGljaXRseSB1c2VkIGJ5IHJlZmVyZW5jaW5nIHRo
ZSB2aWRlby1pbnRlcmZhY2VzIHNjaGVtYS4gTm93IEkgYXNzdW1lIHRoYXQNCkkgaGF2ZSB0byBt
ZW50aW9uIHRoZW0gaGVyZSBleHBsaWNpdGx5LiBDb3JyZWN0Pw0KDQo+IA0KPiA+ICsgICAgICAg
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gPiArDQo+ID4gKyAgICAgICAgcHJvcGVy
dGllczoNCj4gPiArICAgICAgICAgIGlucHV0LWNsb2NrLWZyZXF1ZW5jeTogdHJ1ZQ0KPiA+ICsg
ICAgICAgICAgcGl4ZWwtY2xvY2stZnJlcXVlbmN5OiB0cnVlDQo+IA0KPiBUaGVzZSBhcmUgY3Vz
dG9tIHByb3BlcnRpZXMsIHNvIHRoZXkgbmVlZCBhIHR5cGUsIGRlc2NyaXB0aW9uLCBhbmQgYW55
IA0KPiBjb25zdHJhaW50cy4NCg0KSSdsbCBhZGQgdGhhdC4NCg0KVGhhbmtzLA0KU3RlZmFuDQoN
Cj4gDQo+ID4gKw0KPiA+ICsgICAgICAgIHJlcXVpcmVkOg0KPiA+ICsgICAgICAgICAgLSBpbnB1
dC1jbG9jay1mcmVxdWVuY3kNCj4gPiArICAgICAgICAgIC0gcGl4ZWwtY2xvY2stZnJlcXVlbmN5
DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJl
Zw0KPiA+ICsgIC0gcG9ydA0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
DQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArICAgIGkyYzAgew0KPiA+
ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICNzaXplLWNlbGxz
ID0gPDA+Ow0KPiA+ICsNCj4gPiArICAgICAgICBtdDlwMDMxQDVkIHsNCj4gPiArICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhcHRpbmEsbXQ5cDAzMSI7DQo+ID4gKyAgICAgICAgICAgIHJlZyA9
IDwweDVkPjsNCj4gPiArICAgICAgICAgICAgcmVzZXQtZ3Bpb3MgPSA8JmdwaW9fc2Vuc29yIDAg
MD47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICBwb3J0IHsNCj4gPiArICAgICAgICAgICAgICAg
IG10OXAwMzFfMTogZW5kcG9pbnQgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgIGlucHV0LWNs
b2NrLWZyZXF1ZW5jeSA9IDw2MDAwMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICBwaXhl
bC1jbG9jay1mcmVxdWVuY3kgPSA8OTYwMDAwMDA+Ow0KPiA+ICsgICAgICAgICAgICAgICAgfTsN
Cj4gPiArICAgICAgICAgICAgfTsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gPiAr
DQo+ID4gKy4uLg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+ID4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggY2I2MDQ0M2ZmNzhmLi4wMDAwMDAwMDAwMDANCj4gPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+
ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDQwICswLDAgQEANCj4gPiAtKiBBcHRpbmEgMS8y
LjUtSW5jaCA1TXAgQ01PUyBEaWdpdGFsIEltYWdlIFNlbnNvcg0KPiA+IC0NCj4gPiAtVGhlIEFw
dGluYSBNVDlQMDMxIGlzIGEgMS8yLjUtaW5jaCBDTU9TIGFjdGl2ZSBwaXhlbCBkaWdpdGFsIGlt
YWdlIHNlbnNvcg0KPiA+IHdpdGgNCj4gPiAtYW4gYWN0aXZlIGFycmF5IHNpemUgb2YgMjU5Mkgg
eCAxOTQ0Vi4gSXQgaXMgcHJvZ3JhbW1hYmxlIHRocm91Z2ggYQ0KPiA+IHNpbXBsZQ0KPiA+IC10
d28td2lyZSBzZXJpYWwgaW50ZXJmYWNlLg0KPiA+IC0NCj4gPiAtUmVxdWlyZWQgUHJvcGVydGll
czoNCj4gPiAtLSBjb21wYXRpYmxlOiB2YWx1ZSBzaG91bGQgYmUgZWl0aGVyIG9uZSBhbW9uZyB0
aGUgZm9sbG93aW5nDQo+ID4gLQkoYSkgImFwdGluYSxtdDlwMDMxIiBmb3IgbXQ5cDAzMSBzZW5z
b3INCj4gPiAtCShiKSAiYXB0aW5hLG10OXAwMzFtIiBmb3IgbXQ5cDAzMW0gc2Vuc29yDQo+ID4g
LQ0KPiA+IC0tIGlucHV0LWNsb2NrLWZyZXF1ZW5jeTogSW5wdXQgY2xvY2sgZnJlcXVlbmN5Lg0K
PiA+IC0NCj4gPiAtLSBwaXhlbC1jbG9jay1mcmVxdWVuY3k6IFBpeGVsIGNsb2NrIGZyZXF1ZW5j
eS4NCj4gPiAtDQo+ID4gLU9wdGlvbmFsIFByb3BlcnRpZXM6DQo+ID4gLS0gcmVzZXQtZ3Bpb3M6
IENoaXAgcmVzZXQgR1BJTw0KPiA+IC0NCj4gPiAtRm9yIGZ1cnRoZXIgcmVhZGluZyBvbiBwb3J0
IG5vZGUgcmVmZXIgdG8NCj4gPiAtRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0Lg0KPiA+IC0NCj4gPiAtRXhhbXBsZToNCj4gPiAtDQo+
ID4gLQlpMmMwQDFjMjIwMDAgew0KPiA+IC0JCS4uLg0KPiA+IC0JCS4uLg0KPiA+IC0JCW10OXAw
MzFANWQgew0KPiA+IC0JCQljb21wYXRpYmxlID0gImFwdGluYSxtdDlwMDMxIjsNCj4gPiAtCQkJ
cmVnID0gPDB4NWQ+Ow0KPiA+IC0JCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzMgMzAgMD47DQo+ID4g
LQ0KPiA+IC0JCQlwb3J0IHsNCj4gPiAtCQkJCW10OXAwMzFfMTogZW5kcG9pbnQgew0KPiA+IC0J
CQkJCWlucHV0LWNsb2NrLWZyZXF1ZW5jeSA9IDw2MDAwMDAwPjsNCj4gPiAtCQkJCQlwaXhlbC1j
bG9jay1mcmVxdWVuY3kgPSA8OTYwMDAwMDA+Ow0KPiA+IC0JCQkJfTsNCj4gPiAtCQkJfTsNCj4g
PiAtCQl9Ow0KPiA+IC0JCS4uLg0KPiA+IC0JfTsNCj4gPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUw0KPiA+IGluZGV4IGE2MWY0ZjNiNzhhOS4uMzNkZDgxMjM3YTkxIDEw
MDY0NA0KPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gKysrIGIvTUFJTlRBSU5FUlMNCj4gPiBA
QCAtMTI2MzUsNiArMTI2MzUsNyBAQCBNOglMYXVyZW50IFBpbmNoYXJ0IDwNCj4gPiBsYXVyZW50
LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+ID4gIEw6CWxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZw0KPiA+ICBTOglNYWludGFpbmVkDQo+ID4gIFQ6CWdpdCBnaXQ6Ly9saW51eHR2Lm9y
Zy9tZWRpYV90cmVlLmdpdA0KPiA+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWVkaWEvaTJjL2FwdGluYSxtdDlwMDMxLnlhbWwNCj4gPiAgRjoJZHJpdmVycy9tZWRpYS9p
MmMvbXQ5cDAzMS5jDQo+ID4gIEY6CWluY2x1ZGUvbWVkaWEvaTJjL210OXAwMzEuaA0KPiA+ICAN
Cj4gPiAtLSANCj4gPiAyLjI1LjENCj4gPiANCj4gPiANCg==
