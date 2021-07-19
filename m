Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF573CCE14
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 08:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbhGSGsO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 02:48:14 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:59040 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbhGSGsN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 02:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626677106; x=1629269106;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Qdnm9CA66sUlla6KwhVagioTfxHwplLRXTTYhiGp6ic=;
        b=MS+bgrY1YVFEfVIxswp0jb1eMvV4X57EDaPGFX/uREMgOQi1t/fVkx3tbnyBIg20
        /gTKdXTlfPFZc++8wJKRo5htRpHOhfTgc68CIq2dckFcRNVADn6VMpFc1N2AzAFX
        P9qYNpkj9uuLYLbaqapa16a5SkHjXPcIxFEMIv7XY6A=;
X-AuditID: c39127d2-1e4f970000001daf-6a-60f51f722ba2
Received: from florix.phytec.de (florix.phytec.de [172.16.0.118])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id C7.D7.07599.27F15F06; Mon, 19 Jul 2021 08:45:06 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Florix.phytec.de
 (172.16.0.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 19 Jul
 2021 08:45:05 +0200
Received: from Berlix.phytec.de ([fe80::c131:350d:c471:aafd]) by
 berlix.phytec.de ([fe80::c131:350d:c471:aafd%3]) with mapi id 15.01.2308.008;
 Mon, 19 Jul 2021 08:45:05 +0200
From:   =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Topic: [PATCH v6 5/6] media: dt-bindings: mt9p031: Convert bindings to
 yaml
Thread-Index: AQHXeLWU6C/OxK+q4UyOA3aaOZzcg6tF3S2AgAPjF4A=
Date:   Mon, 19 Jul 2021 06:45:05 +0000
Message-ID: <cd9a55608d1609da4c11dff392decc52fc143d72.camel@phytec.de>
References: <20210714133849.1041619-1-s.riedmueller@phytec.de>
         <20210714133849.1041619-6-s.riedmueller@phytec.de>
         <20210716192331.GA3831920@robh.at.kernel.org>
In-Reply-To: <20210716192331.GA3831920@robh.at.kernel.org>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E7CE49117A92148A41E338323C2F4D7@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRmVeSWpSXmKPExsWyRoChTLdI/muCQU87m8X8I+dYLTonLmG3
        uLxrDptFz4atrBbLNv1hsvi/Zwe7xact35gc2D1md8xk9di0qpPNY97JQI/Pm+QCWKK4bFJS
        czLLUov07RK4Mm7fzSj4pFqxu38SawPjF5UuRk4OCQETid3/VjB3MXJxCAksZ5Lo2rkRynnI
        KLH7TAc7hLOJUaJ/YQsTSAubgIvE57ZvbCC2iIC6xMLVD8E6mAW+MUlc6LoB5HBwCAsES7w8
        aw9REyKxdckmRgjbSuLg4sOsIDaLgKrEt2nv2EFsXgE3iYVPdkEtW8oocePQCrAGTqCGe3vP
        ghUxCshKdDa8AzuCWUBcYtOz76wQPwhILNlznhnCFpV4+fgfVFxBoq2nkwnkHmYBTYn1u/Qh
        Wi0krr47zQJhK0pM6X4IdYOgxMmZT1gmMIrPQrJhFkL3LCTds5B0z0LSvYCRdRWjUG5mcnZq
        UWa2XkFGZUlqsl5K6iZGYKwenqh+aQdj3xyPQ4xMHIyHGCU4mJVEeL/VfEwQ4k1JrKxKLcqP
        LyrNSS0+xCjNwaIkzruBtyRMSCA9sSQ1OzW1ILUIJsvEwSnVwFi5Rbu7zeELM2vVucrSZZt0
        vH+aJz6U/X26JS7XP40/7sHne/Krd3ff+8Lyz7tnXky73kTxk0qbfPn74+W/7tSd23tS72V/
        gqPitq/dO3T9vK0+8b/9HOgjfmy+ceNXX5FPbNeL17QUyp+cX6/yRjUmyeiUepuRZPsPhtMv
        ivq71gl/b2a0VmIpzkg01GIuKk4EAMceJEzDAgAA
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpPbiBGcmksIDIwMjEtMDctMTYgYXQgMTM6MjMgLTA2MDAsIFJvYiBIZXJyaW5n
IHdyb3RlOg0KPiBPbiBXZWQsIEp1bCAxNCwgMjAyMSBhdCAwMzozODo0OFBNICswMjAwLCBTdGVm
YW4gUmllZG11ZWxsZXIgd3JvdGU6DQo+ID4gQ29udmVydCBtdDlwMDMxIHNlbnNvciBiaW5kaW5n
cyB0byB5YW1sIHNjaGVtYS4gQWxzbyB1cGRhdGUgdGhlDQo+ID4gTUFJTlRBSU5FUlMgZW50cnku
DQo+ID4gDQo+ID4gQWx0aG91Z2ggaW5wdXQtY2xvY2stZnJlcXVlbmN5IGFuZCBwaXhlbC1jbG9j
ay1mcmVxdWVuY3kgaGF2ZSBub3QgYmVlbg0KPiA+IGRlZmluZGVkIGFzIGVuZHBvaW50IHByb3Bp
ZXJ0aWVzIGluIHRoZSB0ZXh0dWFsIGJpbmRpbmdzLCB0aGUgc2Vuc29yDQo+ID4gZG9lcyBwYXJz
ZSB0aGVtIGZyb20gdGhlIGVuZHBvaW50LiBUaHVzIG1vdmUgdGhlc2UgcHJvcGVydGllcyB0byB0
aGUNCj4gPiBlbmRwb2ludCBpbiB0aGUgbmV3IHlhbWwgYmluZGluZ3MuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIFJpZWRtdWVsbGVyIDxzLnJpZWRtdWVsbGVyQHBoeXRlYy5kZT4N
Cj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55YW1s
ICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZWRpYS9pMmMvbXQ5cDAzMS50eHQgfCA0MCAtLS0tLS0tLQ0KPiA+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgOTMgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMv
YXB0aW5hLG10OXAwMzEueWFtbA0KPiA+ICBkZWxldGUgbW9kZSAxMDA2NDQNCj4gPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL210OXAwMzEudHh0DQo+ID4gDQo+
ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9hcHRpbmEsbXQ5cDAzMS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvaTJjL2FwdGluYSxtdDlwMDMxLnlhbWwNCj4gPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTUzMWVjZDFlZDk1DQo+ID4gLS0t
IC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZWRpYS9pMmMvYXB0aW5hLG10OXAwMzEueWFtbA0KPiA+IEBAIC0wLDAgKzEsOTIgQEANCj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2Up
DQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9tZWRpYS9pMmMvYXB0aW5hLG10OXAwMzEueWFtbCMNCj4gPiArJHNjaGVtYTog
aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+
ICt0aXRsZTogQXB0aW5hIDEvMi41LUluY2ggNU1wIENNT1MgRGlnaXRhbCBJbWFnZSBTZW5zb3IN
Cj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgIC0gTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246
IHwNCj4gPiArICBUaGUgQXB0aW5hIE1UOVAwMzEgaXMgYSAxLzIuNS1pbmNoIENNT1MgYWN0aXZl
IHBpeGVsIGRpZ2l0YWwgaW1hZ2UNCj4gPiBzZW5zb3INCj4gPiArICB3aXRoIGFuIGFjdGl2ZSBh
cnJheSBzaXplIG9mIDI1OTJIIHggMTk0NFYuIEl0IGlzIHByb2dyYW1tYWJsZSB0aHJvdWdoDQo+
ID4gYQ0KPiA+ICsgIHNpbXBsZSB0d28td2lyZSBzZXJpYWwgaW50ZXJmYWNlLg0KPiA+ICsNCj4g
PiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiAr
ICAgICAgLSBhcHRpbmEsbXQ5cDAzMQ0KPiA+ICsgICAgICAtIGFwdGluYSxtdDlwMDMxbQ0KPiA+
ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogSTJDIGRldmljZSBhZGRyZXNz
DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICByZXNldC1ncGlvczoNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjogQ2hpcCByZXNldCBHUElPDQo+
ID4gKw0KPiA+ICsgIHBvcnQ6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8k
ZGVmcy9wb3J0LWJhc2UNCj4gPiArICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+
ICsNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgIGVuZHBvaW50Og0KPiA+ICsgICAg
ICAgICRyZWY6IC9zY2hlbWFzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMNCj4gPiArICAg
ICAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICsgICAgICAgIHBy
b3BlcnRpZXM6DQo+ID4gKyAgICAgICAgICBpbnB1dC1jbG9jay1mcmVxdWVuY3k6DQo+ID4gKyAg
ICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0K
PiA+ICsgICAgICAgICAgICBtaW5pbXVtOiA2MDAwMDAwDQo+ID4gKyAgICAgICAgICAgIG1heGlt
dW06IDk2MDAwMDAwDQo+ID4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBJbnB1dCBjbG9jayBm
cmVxdWVuY3kNCj4gPiArDQo+ID4gKyAgICAgICAgICBwaXhlbC1jbG9jay1mcmVxdWVuY3k6DQo+
ID4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3Vp
bnQzMg0KPiA+ICsgICAgICAgICAgICBtYXhpbXVtOiA5NjAwMDAwMA0KPiA+ICsgICAgICAgICAg
ICBkZXNjcmlwdGlvbjogVGFyZ2V0IHBpeGVsIGNsb2NrIGZyZXF1ZW5jeQ0KPiA+ICsNCj4gPiAr
ICAgICAgICAgIGJ1cy10eXBlOg0KPiA+ICsgICAgICAgICAgICBjb25zdDogNQ0KPiA+ICsNCj4g
PiArICAgICAgICAgIGJ1cy13aWR0aDoNCj4gPiArICAgICAgICAgICAgY29uc3Q6IDEyDQo+IA0K
PiBJZiB0aGVyZSdzIG9ubHkgMSBwb3NzaWJsZSBzZXR0aW5nIGZvciBib3RoIG9mIHRoZXNlLCB3
aHkgZG8gdGhleSBuZWVkIA0KPiB0byBiZSBpbiBEVD8NCg0KTXkgaWRlYSB3YXMgdG8gaGF2ZSB0
aGVtIGhlcmUgYXMgY29uc3RyYWludHMgaW4gY2FzZSBzb21lb25lIHdhbnRzIHRvIGFkZCB0aGVt
DQp0byBhbHRob3VnaCB0aGVyZSBpcyBubyBhY3R1YWwgbmVlZCB0by4gVGhhdCdzIHdoeSBJIGFk
ZGVkIHRoZW0gb3B0aW9uYWwuIEJ1dA0KdG8gYmUgaG9uZXN0LCBJIHdhc24ndCBzdXJlIGlmIHRo
YXQncyB0aGUgY29ycmVjdCBhcHByb2FjaCwgc28gaWYgeW91J2QgcHJlZmVyDQp0byBkcm9wIHRo
ZW0gdGhlbiBpdCdzIGZpbmUgd2l0aCBtZS4NCg0KUmVnYXJkcywNClN0ZWZhbg0KDQoNCg0KPiAN
Cj4gUm9iDQo=
