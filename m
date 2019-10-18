Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4DCDD4F7
	for <lists+linux-media@lfdr.de>; Sat, 19 Oct 2019 00:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388594AbfJRWd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Oct 2019 18:33:56 -0400
Received: from mail-eopbgr710085.outbound.protection.outlook.com ([40.107.71.85]:34046
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728372AbfJRWdz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Oct 2019 18:33:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GED6FRiB9CcsNSlcQh+prQzFbr+IC5aZd1ht3Fou+Tx4aq9zOYz2TotzQXPnt/WKPJ17T7G2qyA8IE9qAOdyAsvh8Toae5Cgg1cX2xkuKIAs/K0m/ebH6eiluEAJBRvypvCqei66EJpiQ7onfL5d+nehedSd53Wr8iQ74bjn2Enl8qdORTstsuRfrVmjMR+G9WYD4e26DGKgwks7weTX2nZtDRvRyxTuDXPyyQw6iA2L4I6jkcvAuT0eTh3J7uLU/qstbKxh0lCqOonn3Sf8P9stoX5L9XKPDi3qwcce/3uEYW7ISbg/NXw7m/HDvzJ0Jcl8EioStkCREkmR7/lnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OVgi20UzQl07yjKbhpwchCuTWe/RxJR0vWtn0KepSc=;
 b=YHfm4z+Rk1kpACc9a8pneyMzrC9yDO9D4UFCTHfCnou21FRFLS6f+WRLO9LOS4INUc7AYe90fv+QyjbOqfx9CVRHuHDx+TFfDxrYclDq1WWaag4vb116zW3MmhPlQ8hcrZZ8MXUsYAmFRzhMr71i3JExie/B3AB99S92WT/geLA51qmYKoGTBr33c3V0nnsDySIFXk5e88N6WKgwfbwE8rkAiUHorPwMJAgSGL0pHK7NQoQ3jtxD1Qwqn6uD/eDB24+oAGNG2jQlO3zSq2C3IDQ5GsCajIUgyxOAlYlmnda/HBYCBmFwHyP2teCSJiOz9O/o7A9zRwct99AtXNei+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hedonline.com; dmarc=pass action=none
 header.from=hedonline.com; dkim=pass header.d=hedonline.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=HEDInc.onmicrosoft.com; s=selector2-HEDInc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OVgi20UzQl07yjKbhpwchCuTWe/RxJR0vWtn0KepSc=;
 b=PB1cx5fxfWL40njsag0iLNaecW888z6giG6XMnYJYthtQLHxofpHhABnD/sWjHpQUobzXrEIvp06Ic5YZEUr+DrsMmhUbrsH2+rIuu0vjouqbcDz6j89Vj/l2S2B6I+xcc7Pl4A6Dsju1Acx5jUGzxIWfAmblM4aJauFXel+TY8=
Received: from CH2PR19MB4119.namprd19.prod.outlook.com (20.180.15.139) by
 CH2PR19MB4117.namprd19.prod.outlook.com (20.180.4.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Fri, 18 Oct 2019 22:33:49 +0000
Received: from CH2PR19MB4119.namprd19.prod.outlook.com
 ([fe80::5801:1b57:f99c:3a7c]) by CH2PR19MB4119.namprd19.prod.outlook.com
 ([fe80::5801:1b57:f99c:3a7c%4]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 22:33:49 +0000
From:   Matthew Starr <mstarr@hedonline.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Fabio Estevam <festevam@gmail.com>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: RE: ADV7180 Capture with i.MX53
Thread-Topic: ADV7180 Capture with i.MX53
Thread-Index: AQHVfsYfT3IY7kQL2ESQaB8/FP/Uq6dg+TMw
Date:   Fri, 18 Oct 2019 22:33:49 +0000
Message-ID: <CH2PR19MB411980542536BC90C31FF077D86C0@CH2PR19MB4119.namprd19.prod.outlook.com>
References: <CAOMZO5B2kO7_xmA2jmqkH5cxE4hW+TYJhont-rtq0Jck3GKA0g@mail.gmail.com>
 <ba4541a2-9f91-afb6-57e8-84d51de61061@gmail.com>
 <CAOMZO5BRxvY2=8md7mo0ygsFXdrk2CVYrN_L5q-TQU_AhWCdgg@mail.gmail.com>
 <ca2d67ed-9da1-7579-05d1-4c912bbf8093@gmail.com>
 <CAOMZO5Cc9sJN+uP5ZAbcAsGoEKH_jN2v0hiCrMrHqj5Qci_Sew@mail.gmail.com>
 <CAOMZO5DmD5V+nT9QhWKTNHe+UydmQP=PJgxZopj7cm9YjEx68A@mail.gmail.com>
 <CAJ+vNU0EFWA66cnB+1ze-=vMr=WBWuV_=m6+DF_xQ6gng3J-bQ@mail.gmail.com>
 <CAOMZO5ATZw80cz6WsNUxWfgsqqX-R6A6SKz7tFQa=Tdy2ynWJA@mail.gmail.com>
 <CAJ+vNU1X6kCeA=CVcGqEU4DCH8ZO_EwdARpyuXdGVMH_Uu7+7w@mail.gmail.com>
 <CAOMZO5Ct_-wjJnb9ktp7KDcAbhajjuRxWEDYfR-13x-9ZJut6w@mail.gmail.com>
 <CAJ+vNU3FUvB_a1TxxjvtKbC9xg6-VbD+3PE6-5uEwgOwXn6WvQ@mail.gmail.com>
 <e2c7a89c-5475-6685-2f9b-3f54e822a526@gmail.com>
In-Reply-To: <e2c7a89c-5475-6685-2f9b-3f54e822a526@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mstarr@hedonline.com; 
x-originating-ip: [12.133.124.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2a9b2b1-f3d1-469f-4932-08d7541b3f0b
x-ms-traffictypediagnostic: CH2PR19MB4117:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CH2PR19MB4117B1A7175F4D80BFDE58C0D86C0@CH2PR19MB4117.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(346002)(366004)(39830400003)(136003)(376002)(13464003)(54094003)(189003)(199004)(55016002)(74316002)(33656002)(26005)(102836004)(966005)(11346002)(476003)(6506007)(7696005)(8676002)(76176011)(186003)(53546011)(7736002)(6246003)(508600001)(446003)(6436002)(229853002)(9686003)(305945005)(6306002)(3846002)(76116006)(25786009)(86362001)(52536014)(4326008)(256004)(5660300002)(81156014)(54906003)(110136005)(81166006)(316002)(14454004)(486006)(66066001)(6116002)(66556008)(64756008)(66476007)(66946007)(8936002)(66446008)(99286004)(71190400001)(71200400001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR19MB4117;H:CH2PR19MB4119.namprd19.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: hedonline.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N18MZU1XKZSHmAIWqCNti8r8kRD6vQ8yLRM7/1/waid7Z52Hhz4fSw8LffhbrRcSVEcFS01S5xlcRYLyvMTTFW0rcHRTnbyDmuEYmTeIWO7fHs6OYjrrYcBE+6GGOzp1FcjLTLO0MOiwY7uYPJ1fusJYG4g3cuyna5e0AfHhAAMtJ0W6aFnyjUjAg+0byk7GMh5+jvTJ0sJ8yb9ppGICJd3Q0W7wwUiowBQWAQpda3McuMgWNKJ0hkYDGKHjLWssk0hF00OiMccELuNYCyJHvyvRg6uxFk1WiWhnshlCxJukgZ6Hl/AkwSH/Gte0AOJmKs96gW7AAgS5P+AyFObXMl1jNHlHsMgJjPaHT2+ahyVkWwokYWlFp+dVx0UiEkL8RQwvFgmB3t/JDqQ5c3+cSwKegVMNL/sjwHYm9vKHxXxov1nXsfimENToLKu5pHi/6JFfUYsRa0/tdxaosXj1gg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: hedonline.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a9b2b1-f3d1-469f-4932-08d7541b3f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 22:33:49.2907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d8824180-9373-4f62-b87d-158fb93126e6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvQ5pPcUzc9KFB4SYzy+teg3fcuwvMZyKvHlvflHDHlYM/FW6p5yCTdW5HrqScxFNA7hd9NXpwQKIXbYxRUO1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4117
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGV2ZSBMb25nZXJiZWFtIDxz
bG9uZ2VyYmVhbUBnbWFpbC5jb20+DQo+IA0KPiBPbiAxMC85LzE5IDg6NDAgQU0sIFRpbSBIYXJ2
ZXkgd3JvdGU6DQo+ID4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA0OjQ4IFBNIEZhYmlvIEVzdGV2
YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+ID4+IEhpIFRpbSwNCj4gPj4NCj4g
Pj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCA2OjAxIFBNIFRpbSBIYXJ2ZXkgPHRoYXJ2ZXlAZ2F0
ZXdvcmtzLmNvbT4NCj4gd3JvdGU6DQo+ID4+DQo+ID4+PiBPayB0aGF0J3Mgc3RyYW5nZSBpbmRl
ZWQuIEkgZGlkIHJlY2VudGx5IHRlc3QgNS4zIG9uIGEgR2F0ZXdvcmtzDQo+ID4+PiBJTVg2IGJv
YXJkIHdpdGggQURWNzE4MCBhbmQgdGhlIG9uZSBwYXRjaCB0byBkcm9wIHRoZSBmaXJzdCBmZXcN
Cj4gPj4+IGZyYW1lcyBhbmQgaXRzIHN0YWJsZS4gV2hhdCBkb2VzIHlvdXIgdGVzdGluZyBzaG93
IG9uIGFuIElNWDYgYW5kIGRvDQo+ID4+PiB5b3Uga25vdw0KPiA+PiBJIHdpbGwgZ2l2ZSBpdCBh
IHRyeSBvbiBhIGlteDZxLXNhYnJlYXV0byBib2FyZCBmb3IgY29tcGFyaXNvbi4NCj4gPj4NCj4g
Pj4+IHdoZW4gaXQgbWF5IGhhdmUgYnJva2VuIGZvciBJTVg1Mz8NCj4gPj4gaS5NWDUzIGNhcHR1
cmUgaXMgcmVsYXRpdmVseSBuZXcgYW5kIHRoaXMgaXMgbXkgZmlyc3QgdGltZSB0cnlpbmcgdG8N
Cj4gPj4gZ2V0IGl0IHRvIHdvcmsgd2l0aCBtYWlubGluZS4NCj4gPj4NCj4gPj4gSSBhc3N1bWUg
SSBzaG91bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8geW91cg0KPiA+PiBodHRwczovL3Jhdy5n
aXRodWJ1c2VyY29udGVudC5jb20vR2F0ZXdvcmtzL21lZGlhLWN0bC0NCj4gc2V0dXAvbWFzdGVy
L21lDQo+ID4+IGRpYS1jdGwtc2V0dXAgc2NyaXB0LCBtb3JlIGVzcGVjaWZpY2FsbHkgdGhlIG1v
ZGUgMyBzZXR1cCB3aGVyZSB5b3UNCj4gPj4gaGF2ZToNCj4gPj4NCj4gPiBJIHN0cnVnZ2xlZCB3
aXRoIGNvbWluZyB1cCB3aXRoIGEgd2F5IHRvIGVhc2lseSBkb2N1bWVudCBhbGwgdGhlDQo+ID4g
dmFyaWF0aW9ucyB3aXRoIG91ciBib2FyZHMgYXMgd2UgaGF2ZSBzZXZlcmFsIGRpZmZlcmVudCBi
b2FyZHMgdGhhdA0KPiA+IGhhdmUgYW4gYWR2NzE4MCB1c2luZyBkaWZmZXJlbnQgQ1NJIHBvcnRz
IGFuZCB0aGVuIHlvdSBhbHNvIGhhdmUgdG8NCj4gPiBkZWFsIHdpdGggdGhlIGRpZmZlcmVuY2Vz
IGJldHdlZW4gSU1YNlNETCBhbmQgSU1YNlEuIFRoZSBzY3JpcHQgd2FzDQo+ID4gdGhlIGJlc3Qg
c29sdXRpb24gSSBjb3VsZCBjb21lIHVwIHdpdGggYnV0IGlmIHlvdSByZWFkIHRocm91Z2ggaXQg
aXRzDQo+ID4gcHJldHR5IGNvbXBsaWNhdGVkLg0KPiA+DQo+ID4+IGNhc2UgIiRTRU5TIiBpbg0K
PiA+PiBhZHY3MTgwKQ0KPiA+PiBmbXQgIickU0VOU09SJzowIFtmbXQ6VVlWWTJYOC8kcmVzIGZp
ZWxkOmFsdGVybmF0ZV0iDQo+ID4+IGZtdCAiJ2lwdSR7SVBVfV9jc2kke0NTSX1fbXV4JzokKChw
KzEpKSBbZm10OlVZVlkyWDgvJHJlc10iDQo+ID4+ICMgcmVjNzA5IGNvbmZpZyBhdCBDU0kgcGFk
IDANCj4gPj4gZm10ICInaXB1JHtJUFV9X2NzaSR7Q1NJfSc6MCBbZm10OiRmbXQgZmllbGQ6JGZp
ZWxkIGNvbG9yc3BhY2U6cmVjNzA5DQo+ID4+IHljYmNyOjcwOV0iDQo+ID4+ICMgQ1NJIHNyYyBw
YWQgb3V0cHV0IGlzIGZyYW1lIGhlaWdodA0KPiA+PiBoPSQoKGgqMikpDQo+ID4+IHJlcz0ke3d9
eCR7aH0NCj4gPj4gZm10ICInaXB1JHtJUFV9X2NzaSR7Q1NJfSc6MSBbZm10OkFZVVYzMi8kcmVz
XSINCj4gPj4gZm10ICInaXB1JHtJUFV9X3ZkaWMnOjIgW2ZtdDpBWVVWMzIvJHJlcyBmaWVsZDpu
b25lXSINCj4gPj4gZm10ICInaXB1JHtJUFV9X2ljX3BycCc6MiBbZm10OkFZVVYzMi8kcmVzIGZp
ZWxkOm5vbmVdIg0KPiA+PiBmbXQgIickRVAnOjEgW2ZtdDpBWVVWMzIvJHJlc10iDQo+ID4+IDs7
DQo+ID4+DQo+ID4+IFdoeSBkbyB5b3UgbXVsdGlwbGUgaCBieSAyPw0KPiA+IFRoZSBpbnB1dCB0
aGUgdGhlIENTSSBpcyBhIGZpZWxkIG9mIDI0MCBsaW5lcyBidXQgdGhlIHZkaWMgd2lsbA0KPiA+
IGNvbWJpbmUgdGhlc2UgYW5kIGhhdmUgNDgwIGxpbmVzLiBJIGRvbid0IHJlY2FsbCBleGFjdGx5
IHdoeSBidXQgZm9yDQo+ID4gdGhpcyB0byBwcm9wYWdhdGUgcHJvcGVybHkgeW91IG5lZWQgdG8g
c2V0IHRoZSA0ODAgbGluZXMgb24gdGhlIGNzaQ0KPiA+IG91dHB1dC4NCj4gDQo+IFRoZSByZWFz
b24gaXMgYmVjYXVzZSB0aGVyZSBhcmUgaXMgbm8gcmVnaXN0ZXIgc3RhdHVzIGJpdHMgdGhhdCB3
aWxsIHRlbGwgeW91DQo+IHdoZXRoZXIgYSBjYXB0dXJlZCBmaWVsZCB3YXMgZmllbGQgMCBvciBm
aWVsZCAxLiBGb3IgdGhpcyByZWFzb24gdGhlIGRyaXZlciBjYW4ndA0KPiBzdXBwb3J0IGFsdGVy
bmF0ZSBjYXB0dXJlIG1vZGUgKHdoaWNoIGNhcHR1cmVzIGluZGl2aWR1YWwgZmllbGRzIGFuZCBy
ZXBvcnRzDQo+IHRvIHVzZXJzcGFjZSBpbiB0aGUgcmV0dXJuZWQgdjRsMl9idWZmZXIncyB3aGV0
aGVyIHRoZSBmaWVsZCBpcyBhIHRvcCBmaWVsZCBvcg0KPiBib3R0b20gZmllbGQpLiBTbyB0aGUg
Q1NJIGNhcHR1cmVzIHR3byBjb25zZWN1dGl2ZSBmaWVsZHMgYW5kIHJlcG9ydHMgZmllbGQNCj4g
dHlwZSBzZXEtYnQgb3Igc2VxLXRiLCBhbmQgZG91YmxlcyBoZWlnaHQsIGF0IGl0cyBvdXRwdXQu
DQo+IA0KPiANCj4gPj4+IEkgZG8gaGF2ZSBhIGRpc2N1c3Npb24gZ29pbmcgb24gaGVyZSBhYm91
dCBORVdBVk1PREUgYW5kIEJULjY1Ni0zDQo+IHZzDQo+ID4+PiBCVC42NTYtNC4gSSB3b25kZXIg
aWYgaXRzIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoYXQgYXMgdGhhdCBpc3N1ZQ0KPiA+Pj4gY2F1
c2VzIHJvbGxpbmcgdmlkZW8gb24gSU1YNiB3aXRoIEFEVjcyODA6DQo+ID4+PiBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTE3NTc5Lw0KPiA+PiBUZXN0ZWQgdGhpcyBwYXRj
aCwgYnV0IGl0IGRpZCBub3QgaGVscC4NCj4gDQo+IEFib3V0IGEgeWVhciBhZ28gTWF0dGhldyBT
dGFyciByZXBvcnRlZCBzaW1pbGFyIGhvcml6b250YWwgcm9sbGluZyBpc3N1ZSB3aXRoDQo+IGku
bXg1MyArIGFkdjcxODAuIEkgZGlkbid0IGhhdmUgYW4gZXhwbGFuYXRpb24gZm9yIHRoZSBwcm9i
bGVtLCBzaW5jZSBJUFUNCj4gcmVnaXN0ZXItbGV2ZWwgaXMgdGhlIHNhbWUgYmV0d2VlbiBpLm14
NTMgYW5kIGkubXg2LCBhbmQNCj4gYWR2NzE4MCBjYXB0dXJlIGlzIHdvcmtpbmcgZmluZSBvbiBp
Lm14NiBTYWJyZUF1dG8uIEFuZCBsaWtlIG5vdywgdGhlDQo+IHNraXBwaW5nIG9mIGluaXRpYWwg
Y29ycnVwdCBmcmFtZXMgc29sdmVkIHZlcnRpY2FsIHN5bmMgYnV0IG5vdCB0aGUgaG9yaXpvbnRh
bA0KPiByb2xsaW5nLiBJIG5ldmVyIGhlYXJkIGJhY2sgd2hldGhlciBoZSB3YXMgYWJsZSB0byB0
cmFjayBkb3duIHRoZSBpc3N1ZS4NCj4gDQo+IE1hdHRoZXcsIHdlcmUgeW91IGV2ZXIgYWJsZSB0
byBzb2x2ZSB0aGlzPw0KDQpTdGV2ZSwNCg0KSSBuZXZlciBoYWQgYSBjaGFuY2UgdG8gZGlnIGRl
ZXBlciBvbiB0aGlzIGlzc3VlLiAgVGhlIGxhc3QgdGltZSBpdCB3YXMgd29ya2VkIG9uIHRoZSB2
aWRlbyBjb3VsZCBuZXZlciBnZXQgYSBwcm9wZXIgc3luYyBiZXR3ZWVuIGZyYW1lcywgc28gdGhl
IGltYWdlcyB3ZXJlIGFsd2F5cyBzcGxpdCBiZXR3ZWVuIGZyYW1lcy4NCg0KSWYgdGhlcmUgYXJl
IHNvbWUgbmV3IHVwZGF0ZXMgb3ZlciB0aGUgbGFzdCB5ZWFyIEkgd291bGQgYmUgd2lsbGluZyB0
byB0ZXN0IHRoZW0gb3V0Lg0KDQotIE1hdHQgU3RhcnINCg0KPiANCj4gPiBUaGF0IHBhdGNoIHdv
bid0IGFmZmVjdCBhZHY3MTgwIGJ1dCBJIHdvbmRlciBpZiB0aGUgaXNzdWVzIHlvdSBhcmUNCj4g
PiBoYXZpbmcgaGF2ZSB0byBkbyB3aXRoIHNvbWV0aGluZyBsaWtlIHRoaXMuIFRoZSBhZHY3MTgw
X2luaXQgZnVuY3Rpb24NCj4gPiB3aWxsIHNldCBCVC42NTYtNCBtb2RlIGFuZCBhZGp1c3QgViBi
aXQgZW5kIHBvc2l0aW9uIGZvciBOVFNDLi4uIEkNCj4gPiBkb24ndCBrbm93IGlmIHRoYXQncyBj
b25zaXN0ZW50IHdpdGggdGhlIElNWDUzIENTSSBuZWVkcz8NCj4gDQo+IFdlbGwsIGxpa2UgbWVu
dGlvbmVkIGFib3ZlLCB0aGUgSVBVIENTSSBpcyByZWdpc3Rlci1sZXZlbCBjb21wYXRpYmxlIGJl
dHdlZW4NCj4gaS5teDUzIGFuZCBpLm14NiwgYXQgbGVhc3QgYWNjb3JkaW5nIHRvIHRoZSByZWZl
cmVuY2UgbWFudWFscywgc28gdGhlIG5vbi0NCj4gc3RhbmRhcmQgVi1iaXQgcG9zaXRpb24gc2V0
IGJ5IGFkdjcxODAsIGFuZCBhZGp1c3RlZCBmb3IgYnkgdGhlIENTSSwgc2hvdWxkDQo+IHdvcmsg
Zm9yIGkubXg1MyBqdXN0IGxpa2UgaXQgZG9lcyBmb3IgaS5teDYuIEJ1dCBpdCdzIHBvc3NpYmxl
IHRoZXJlIGFyZSBzb21lDQo+IHVuZG9jdW1lbnRlZCBkaWZmZXJlbmNlcyBpbiB0aGUgQ1NJIGJl
dHdlZW4gdGhlc2UgU29DJ3MuDQo+IA0KPiBTdGV2ZQ0KPiANCj4gPiAgIFRoZXJlIGFyZQ0KPiA+
IGxvdHMgb2YgbGl0dGxlIHR3ZWFrcyB0aGF0IGNhbiBiZSBtYWRlIHRvIHRoZSBFQVYvU0FWIGNv
ZGVzIGFuZCBpdHMNCj4gPiBub3QgY2xlYXIgdG8gbWUgaG93IHRvIGRlYWwgd2l0aCBjb21wYXQg
aXNzdWVzIGxpa2UgaSBoYXZlIHJ1biBpbnRvDQo+ID4gd2l0aCB0aGUgYWR2NzI4MCBjb25maWcg
bm90IGJlaW5nIGNvbXBhdGlibGUgd2l0aCB0aGUgSU1YNiBDU0kgbmVlZHMuDQoNCg==
