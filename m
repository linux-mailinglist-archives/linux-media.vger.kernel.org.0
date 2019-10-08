Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CCFCF2B5
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 08:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730051AbfJHGYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 02:24:00 -0400
Received: from mail-oln040092071026.outbound.protection.outlook.com ([40.92.71.26]:57221
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729952AbfJHGX6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 02:23:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERtFbpLKXPOARu8GGBK5rLxWgYVNQTFTtvdCVT5mL7h7jSl8EG5UInCxlc3Oio/60WZLMJolr+AioFLMOmcf6Uk00psaro0g6L6IFkEWEEaq9s+ma5TSaeW40vof5DQXioyyn9dwJ9Yei0V2Ei1ocEyweOc5obDrPuuGwS/GJC1wNKKTVtPIYYoKEJBrWeDC8tYYbF2xgdv+2GPe9uzastcw/aQzrJi33/6T9z4R2eancb4WEKm527PQhbxbfPVJaHL6BaKB1WnULwJKs0Bpvdecue79dkgY/oMIQNUKOqC1qDdhoiNlOLFG4xGk3IjkuDJgSKapVfxkkogkAEewSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPrzhF49+eU+GhnDSVT2iGgZ93qvbycT1DVh2elduvM=;
 b=N6IDc2Ns6BMoLYgp6X2mh+NaHEC7UecmJkW0T8DuiV+vhaYO/TtPgvDR1ap9RCLHAzjtwIVLh80TSr9dCG/0ys7C76ak4X260KbohU77awHTi4eFgeN902xSwxjerbXug4JhsjBlyuawyvfbHv5nJECdYinuaalZ3Qid4Npkn3AfyzqbmKaB3hW9eygs+QNKPzx8lOazy4Sa9rlxLRji8/X9uuMS3UuNHkwNCwQbqnSIV8TYhUYlxzoCRYIHcSarDJWln3OW8l0e8dDF13kddpFzRxYLr+oVFwa4Y6RuQQYCr4Jt0zCH8QWcKcc4mM1GIVXpJlfC9adI24kpE9uIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (10.152.20.52) by DB5EUR03HT173.eop-EUR03.prod.protection.outlook.com
 (10.152.21.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15; Tue, 8 Oct
 2019 06:23:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.20.52) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 8 Oct 2019 06:23:50 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 06:23:49 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Ezequiel Garcia <ezequiel@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Topic: [PATCH v2 for 5.4 3/4] media: hantro: Fix motion vectors usage
 condition
Thread-Index: AQHVfTc5j58jepLQQEujLcDcYkaduadPgRaAgACVogCAADC1AA==
Date:   Tue, 8 Oct 2019 06:23:49 +0000
Message-ID: <HE1PR06MB40111D7287970183CF6D0DD1AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-4-ezequiel@collabora.com>
 <HE1PR06MB4011204B3FC2DAABB4BD1BACAC9B0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
In-Reply-To: <CAAFQd5BEPO3nicr1PzRNWoVEzsvKvv5AkqoMVh2AG7qST+bZdA@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::18) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:31DFEF726A71697507B474B73AE137538D1ED3B9A39DA2AF1233546C5561879E;UpperCasedChecksum:8A1F0FE99EFB0AED292FED597F1AB6FA55E2B1BBBDE06CEB5D5ACC3D55C3B45C;SizeAsReceived:8335;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [F+D/NMObG7M1TVyZcZbf/0O/ctLCol/W]
x-microsoft-original-message-id: <e2878bf1-fd0f-a59f-06ea-b6c0c0518ef4@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: DB5EUR03HT173:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KKKLhri9YNHg2dFXN675fEjKXLCU0bgSuWXuo1v1qaY6afOSFrk5sB7At08Qc0atDq866JHsCnvTQdnt21kXrK3daj1ypUysNnrqICWVC+reF3oHIa2uPYYhRaCCLH825LmK4JpggOpj/Sb6aEoNWacGHwqcOtmBuHkSGuc7d75Q8/sGFoMFwDvRwAhM4qiD
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <2CFDDD4A09BD664FAFFC25D53E8CFDF0@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdbffd2-7a70-4e2a-7482-08d74bb8149d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 06:23:49.2990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR03HT173
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0xMC0wOCAwNToyOSwgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IEhpIEpvbmFzLA0KPg0K
PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDM6MzMgQU0gSm9uYXMgS2FybG1hbiA8am9uYXNAa3dp
Ym9vLnNlPiB3cm90ZToNCj4+IE9uIDIwMTktMTAtMDcgMTk6NDUsIEV6ZXF1aWVsIEdhcmNpYSB3
cm90ZToNCj4+PiBGcm9tOiBGcmFuY29pcyBCdWVyZ2lzc2VyIDxmYnVlcmdpc3NlckBjaHJvbWl1
bS5vcmc+DQo+Pj4NCj4+PiBUaGUgc2V0dGluZyBvZiB0aGUgbW90aW9uIHZlY3RvcnMgdXNhZ2Ug
YW5kIHRoZSBzZXR0aW5nIG9mIG1vdGlvbg0KPj4+IHZlY3RvcnMgYWRkcmVzcyBhcmUgY3VycmVu
dGx5IGRvbmUgdW5kZXIgZGlmZmVyZW50IGNvbmRpdGlvbnMuDQo+Pj4NCj4+PiBXaGVuIGRlY29k
aW5nIHByZS1yZWNvcmRlZCB2aWRlb3MsIHRoaXMgcmVzdWx0cyBvZiBsZWF2aW5nIHRoZSBtb3Rp
b24NCj4+PiB2ZWN0b3JzIGFkZHJlc3MgdW5zZXQsIHJlc3VsdGluZyBpbiBmYXVsdHkgbWVtb3J5
IGFjY2Vzc2VzLiBGaXggaXQNCj4+PiBieSB1c2luZyB0aGUgc2FtZSBjb25kaXRpb24gZXZlcnl3
aGVyZSwgd2hpY2ggbWF0Y2hlcyB0aGUgcHJvZmlsZXMNCj4+PiB0aGF0IHN1cHBvcnQgbW90aW9u
IHZlY3RvcnMuDQo+PiBUaGlzIGRvZXMgbm90IGZ1bGx5IG1hdGNoIGhhbnRybyBzZGs6DQo+Pg0K
Pj4gICBlbmFibGUgZGlyZWN0IE1WIHdyaXRpbmcgYW5kIFBPQyB0YWJsZXMgZm9yIGhpZ2gvbWFp
biBzdHJlYW1zLg0KPj4gICBlbmFibGUgaXQgYWxzbyBmb3IgYW55ICJiYXNlbGluZSIgc3RyZWFt
IHdoaWNoIGhhdmUgbWFpbi9oaWdoIHRvb2xzIGVuYWJsZWQuDQo+Pg0KPj4gICAoc3BzLT5wcm9m
aWxlX2lkYyA+IDY2ICYmIHNwcy0+Y29uc3RyYWluZWRfc2V0MF9mbGFnID09IDApIHx8DQo+PiAg
IHNwcy0+ZnJhbWVfbWJzX29ubHlfZmxhZyAhPSAxIHx8DQo+PiAgIHNwcy0+Y2hyb21hX2Zvcm1h
dF9pZGMgIT0gMSB8fA0KPj4gICBzcHMtPnNjYWxpbmdfbWF0cml4X3ByZXNlbnRfZmxhZyAhPSAw
IHx8DQo+PiAgIHBwcy0+ZW50cm9weV9jb2RpbmdfbW9kZV9mbGFnICE9IDAgfHwNCj4+ICAgcHBz
LT53ZWlnaHRlZF9wcmVkX2ZsYWcgIT0gMCB8fA0KPj4gICBwcHMtPndlaWdodGVkX2JpX3ByZWRf
aWRjICE9IDAgfHwNCj4+ICAgcHBzLT50cmFuc2Zvcm04eDhfZmxhZyAhPSAwIHx8DQo+PiAgIHBw
cy0+c2NhbGluZ19tYXRyaXhfcHJlc2VudF9mbGFnICE9IDANCj4gVGhhbmtzIGZvciBkb3VibGUg
Y2hlY2tpbmcgdGhpcy4gSSBjYW4gY29uZmlybSB0aGF0IGl0J3Mgd2hhdCBIYW50cm8NCj4gU0RL
IGRvZXMgaW5kZWVkLg0KPg0KPiBIb3dldmVyLCB3b3VsZCBhIHN0cmVhbSB3aXRoIHNwcy0+cHJv
ZmlsZV9pZGMgPD0gNjYgYW5kIHRob3NlIG90aGVyDQo+IGNvbmRpdGlvbnMgbWV0IGJlIHN0aWxs
IGEgY29tcGxpYW50IHN0cmVhbT8NCg0KWW91IGFyZSBjb3JyZWN0LCBpZiBhIG5vbi1jb21wbGlh
bnQgdmlkZW8gaXMgaGF2aW5nIGRlY29kaW5nIHByb2JsZW1zIGl0IHNob3VsZCBwcm9iYWJseSBi
ZSBoYW5kbGVkDQpvbiB1c2Vyc3BhY2Ugc2lkZSAoYnkgbm90IHJlcG9ydGluZyBiYXNlbGluZSBw
cm9maWxlKSBhbmQgbm90IGluIGtlcm5lbC4NCkFsbCBteSB2aWRlbyBzYW1wbGVzIHRoYXQgd2Fz
IGhhdmluZyB0aGUgaXNzdWUgZml4ZWQgaW4gdGhpcyBwYXRjaCBhcmUgbm93IGRlY29kZWQgY29y
cmVjdGx5Lg0KDQo+DQo+PiBBYm92ZSBjaGVjayBpcyB1c2VkIHdoZW4gRElSX01WX0JBU0Ugc2hv
dWxkIGJlIHdyaXR0ZW4uDQo+PiBBbmQgV1JJVEVfTVZTX0UgaXMgc2V0IHRvIG5hbF9yZWZfaWRj
ICE9IDAgd2hlbiBhYm92ZSBpcyB0cnVlLg0KPj4NCj4+IEkgdGhpbmsgaXQgbWF5IGJlIHNhZmVy
IHRvIGFsd2F5cyBzZXQgRElSX01WX0JBU0UgYW5kIGtlZXAgdGhlIGV4aXN0aW5nIG5hbF9yZWZf
aWRjIGNoZWNrIGZvciBXUklURV9NVlNfRS4NCj4gVGhhdCBtaWdodCBoYXZlIGEgcGVyZm9ybWFu
Y2UgcGVuYWx0eSBvciBzb21lIG90aGVyIHNpZGUgZWZmZWN0cywNCj4gdGhvdWdoLiBPdGhlcndp
c2UgSGFudHJvIFNESyB3b3VsZG4ndCBoYXZlIGVuYWJsZSBpdCBjb25kaXRpb25hbGx5Lg0KPg0K
Pj4gKFRoYXQgaXMgd2hhdCBJIGRpZCBpbiBteSAibWVkaWE6IGhhbnRybzogSDI2NCBmaXhlcyBh
bmQgaW1wcm92ZW1lbnRzIiBzZXJpZXMsIHYyIGlzIGluY29taW5nKQ0KPj4gT3IgaGF2ZSB5b3Ug
Zm91bmQgYW55IHZpZGVvIHRoYXQgaXMgaGF2aW5nIGlzc3VlcyBpbiBzdWNoIGNhc2U/DQo+IFdl
J3ZlIGJlZW4gcnVubmluZyB0aGUgY29kZSB3aXRoIHNwcy0+cHJvZmlsZV9pZGMgPiA2NiBpbiBw
cm9kdWN0aW9uDQo+IGZvciA0IHllYXJzIGFuZCBoYXZlbid0IHNlZW4gYW55IHJlcG9ydHMgb2Yg
YSBzdHJlYW0gdGhhdCB3YXNuJ3QNCj4gZGVjb2RlZCBjb3JyZWN0bHkuDQo+DQo+IElmIHdlIGRl
Y2lkZSB0byBnbyB3aXRoIGEgZGlmZmVyZW50IGJlaGF2aW9yLCBJJ2Qgc3VnZ2VzdCB0aG9yb3Vn
aGx5DQo+IHZlcmlmeWluZyB0aGUgYmVoYXZpb3Igb24gYSBiaWcgbnVtYmVyIG9mIHN0cmVhbXMs
IGluY2x1ZGluZyBzb21lDQo+IHBlcmZvcm1hbmNlIG1lYXN1cmVtZW50cy4NCg0KSSBhZ3JlZSwg
SSB3b3VsZCBob3dldmVyIHN1Z2dlc3QgdG8gY2hhbmdlIHRoZSBpZiBzdGF0ZW1lbnQgdG8gdGhl
IGZvbGxvd2luZyAob3Igc2ltaWxhcikNCmFzIHRoYXQgc2hvdWxkIGJlIHRoZSBvcHRpbWFsIGZv
ciBwZXJmb3JtYW5jZSByZWFzb25zIGFuZCBtYXRjaCB0aGUgaGFudHJvIHNkay4NCg0KaWYgKHNw
cy0+cHJvZmlsZV9pZGMgPiA2NiAmJiBkZWNfcGFyYW0tPm5hbF9yZWZfaWRjKQ0KDQpSZWdhcmRz
LA0KSm9uYXMNCg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IFRvbWFzeg0KPg0KPj4gUmVnYXJkcywN
Cj4+IEpvbmFzDQo+Pg0KPj4+IEZpeGVzOiBkZWEwYTgyZjNkMjIgKCJtZWRpYTogaGFudHJvOiBB
ZGQgc3VwcG9ydCBmb3IgSDI2NCBkZWNvZGluZyBvbiBHMSIpDQo+Pj4gU2lnbmVkLW9mZi1ieTog
RnJhbmNvaXMgQnVlcmdpc3NlciA8ZmJ1ZXJnaXNzZXJAY2hyb21pdW0ub3JnPg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEV6ZXF1aWVsIEdhcmNpYSA8ZXplcXVpZWxAY29sbGFib3JhLmNvbT4NCj4+PiAt
LS0NCj4+PiB2MjoNCj4+PiAqIE5ldyBwYXRjaC4NCj4+Pg0KPj4+ICBkcml2ZXJzL3N0YWdpbmcv
bWVkaWEvaGFudHJvL2hhbnRyb19nMV9oMjY0X2RlYy5jIHwgMiArLQ0KPj4+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaGFudHJvL2hhbnRyb19nMV9oMjY0X2RlYy5jIGIvZHJp
dmVycy9zdGFnaW5nL21lZGlhL2hhbnRyby9oYW50cm9fZzFfaDI2NF9kZWMuYw0KPj4+IGluZGV4
IDdhYjUzNDkzNjg0My4uYzkyNDYwNDA3NjEzIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9tZWRpYS9oYW50cm8vaGFudHJvX2cxX2gyNjRfZGVjLmMNCj4+PiArKysgYi9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvaGFudHJvL2hhbnRyb19nMV9oMjY0X2RlYy5jDQo+Pj4gQEAgLTM1LDcg
KzM1LDcgQEAgc3RhdGljIHZvaWQgc2V0X3BhcmFtcyhzdHJ1Y3QgaGFudHJvX2N0eCAqY3R4KQ0K
Pj4+ICAgICAgIGlmIChzcHMtPmZsYWdzICYgVjRMMl9IMjY0X1NQU19GTEFHX01CX0FEQVBUSVZF
X0ZSQU1FX0ZJRUxEKQ0KPj4+ICAgICAgICAgICAgICAgcmVnIHw9IEcxX1JFR19ERUNfQ1RSTDBf
U0VRX01CQUZGX0U7DQo+Pj4gICAgICAgcmVnIHw9IEcxX1JFR19ERUNfQ1RSTDBfUElDT1JEX0NP
VU5UX0U7DQo+Pj4gLSAgICAgaWYgKGRlY19wYXJhbS0+bmFsX3JlZl9pZGMpDQo+Pj4gKyAgICAg
aWYgKHNwcy0+cHJvZmlsZV9pZGMgPiA2NikNCj4+PiAgICAgICAgICAgICAgIHJlZyB8PSBHMV9S
RUdfREVDX0NUUkwwX1dSSVRFX01WU19FOw0KPj4+DQo+Pj4gICAgICAgaWYgKCEoc3BzLT5mbGFn
cyAmIFY0TDJfSDI2NF9TUFNfRkxBR19GUkFNRV9NQlNfT05MWSkgJiYNCg0K
