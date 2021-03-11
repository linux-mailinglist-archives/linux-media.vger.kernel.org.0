Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6461E336CF6
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 08:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhCKHPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 02:15:17 -0500
Received: from mail-eopbgr1400112.outbound.protection.outlook.com ([40.107.140.112]:14841
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231264AbhCKHPE (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 02:15:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5LOfRb0sfxRLDG7vlg9lSjeWo5kbcPlE9BXsObUNwSU1sN+oYKUt6wyX8+2sadDJG4sP5PlooQ/4Zl2/nwNiY7DxspgB7z7J36NIKAqajrRPKB8yxevu9+c6s8NIaUqIzHoVw5BFGWgCouMSW2cReez044asVfBmEeSaUBYA/AeyjbhuWbONmiRej+5zpOaD0SCV3kVIXVS3JSkPlWLwnU5843M7yHKmCBTpjXo6He5YjcNS64HouUsiKl8bKiAajGyj6QIkSTkVZ7De0GncZoq8gYk35zyPc7kfWl21bHyQqbl0rGBzfLYKQ2uY6POFO66NsBk/ObAzUvo0+tkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArDKscN6qJTkctur0ml8p0JZ1NXd+X22VdHtG1QEjyY=;
 b=fS5dt3+Y93KW4JdEOUGYHTchfnfVFJby8bUtjoVPY4EVjLs/HpOvyhPBy+2feFoNOgIJarF6V8UhfAhcwVTIVZbQLGN3ao9QI19TWsZ1R/3/XBo4zAcSnTDt7WGWaxPhvJ3/dcDtktrNjBlLsBhtsUVUrge2tRzVDuEhWSSAE0cR8eN5WH4MEmyqgYafO5/77okTJtKv4zHFOPTD+1lblf9LADMvkyU3y3sRHxEqsMDHfL/F/V8e5GFYm6h3hLadRvj9ycePd9TkkzyFdJ5Oh24RTWrBmbVjSsslS3fSgFrJBRe4/iOepQsIsTQpd90nWQdXvf9L4op5TBstptkbdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArDKscN6qJTkctur0ml8p0JZ1NXd+X22VdHtG1QEjyY=;
 b=XHbnI8fQ6yqxRj5mbmcTAyN8+KPv1WkoMB2RwlLYpTfQF7DNisw4jQPkJNhrWhelAmHdEEhsk1IKHzZA2Dzl6cr2Pf7s2eeH8LvOYa+mweBKRwTrg9ZFjqXzaWnYp4WKB9DRKZPp0wTEsGThAEW9TXUaJ8kvWRJAFhUltW1mM88=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5927.jpnprd01.prod.outlook.com (2603:1096:604:c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 07:15:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::a1c6:97eb:7268:c2b3%4]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 07:15:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "kieran.bingham+renesas@ideasonboard.com" 
        <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Thread-Topic: [PATCH 1/2] media: v4l: vsp1: Fix bru null pointer access
Thread-Index: AQHXDpOc6lCyYQk/MU6wTBj2ngPlwKp6wlAAgAOortA=
Date:   Thu, 11 Mar 2021 07:15:01 +0000
Message-ID: <OS0PR01MB59225484E090C01FD25BAF3C86909@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210301120828.6945-1-biju.das.jz@bp.renesas.com>
 <20210301120828.6945-2-biju.das.jz@bp.renesas.com>
 <67dbb76a-db02-7a49-9b1d-0218d01c3173@ideasonboard.com>
In-Reply-To: <67dbb76a-db02-7a49-9b1d-0218d01c3173@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4729b08c-1f69-4e74-2c12-08d8e45d6351
x-ms-traffictypediagnostic: OS3PR01MB5927:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB5927FA0E27455F751F33D9C286909@OS3PR01MB5927.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yvQM74n4auoNrxEz+IP99H0lM5pErMQE0Zv3n6rh3ySX2olp7tzNfkqTopy0mqw9kOzpgNgeD+QeL1wZLB8/ns137DG8LDz4lICPbXx9YeAVJy9PJDSnkjLHgg76B1dGtNbh2au02QeJQD33ZbBMsHulY2FV25tcKtpt5dQhICnWKkE3fvXGOHn+9IrqDxrh3J6hnmEFauhjVKi5hZ0P6OPF+Taq82DGgDi//EXBucAWnXjfWfb0gQVn83FGiwgAb3s2PmHNpk2v6bcTrsPYvdESH3oZxij+nz1GCkaGaicpYyU9eagQ2YgkTq2PGThyxBVGaoKDAEq3k55n7t8k1fOV4cN1/0wB8+5+j07YL7apFkanTJVxcc2zwZ6sJ9LYZgAlANlX6dUbt72U5DYwB5XGV1vR/5ocrDrUNS4mZhG6bsUeul77ae4SW67IEF7UL0mQ9fMcIWUXurEJgl76OfVNPAnyVRhYIbJ+ksjxzoL6x2cJnsmN8KFhqFhklb1Yg7YrqnnPFRwdMwfOSNebRQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(478600001)(110136005)(71200400001)(8676002)(186003)(54906003)(8936002)(66946007)(52536014)(76116006)(2906002)(33656002)(66446008)(7696005)(5660300002)(86362001)(66476007)(6506007)(53546011)(64756008)(66556008)(4326008)(26005)(9686003)(316002)(83380400001)(107886003)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?S25UVHZnajBUeWpHelE5SWR6YksvUTJrUEhWN1ZpNzREV1NwQTg1WXBtTFd0?=
 =?utf-8?B?d0RiSEdJT3JJb0loM3hzcEh6TERYWjlZcDR1VXRBUnlKMmVDNE55VXpBeGts?=
 =?utf-8?B?b0l2cnVTVzRiejJTTTVhMVZCdWVLMnVUdEg2MUpVOEtGcHR3NUowTUFCN1FL?=
 =?utf-8?B?a3Z6TGkxb1pkdGpFTTdrdUFZTW55THd4R0czSUVacHhMaWNpZzVXN2dCa2ZL?=
 =?utf-8?B?ajlES0x1dlVoM24wa0RIVGR6Z2VRWGFaWFA1dWwzdHpSSVJoSEE3OVBIZ2VO?=
 =?utf-8?B?ZkhDcnE1WHBKOEhGQ0d1QjZtRmZ1QkQzVUxKNzR4SlNPaFFZWUsyTlNMUTRl?=
 =?utf-8?B?QlQxSHZHWFJXWU4wT1dXQ3hVbVQrYjNjR05RbC9GdXZBYUFUYkJSYVo0UFBy?=
 =?utf-8?B?NE9XclJQN3VsVTRVSlFmQUxCaGhpUWdnelVSTHo2VnZacXRzclk2WTlZbGxS?=
 =?utf-8?B?ZDF2MTRZZ2tHcVRsTy82MHNXOW9IeExGZ3lSaXZLbFhmb2E3VUhkb01rd1dB?=
 =?utf-8?B?QWxRMnlPUVFHNkN4aTZyRTlJRzdGRVU3UWptUlc0ZENKV0xZN0lMc0xtZ2F0?=
 =?utf-8?B?cEQyOTV0cktwRGYrdDg5alR4L1pkeW9zSmJMU0FjaTRnbnRiK296U2FmemZv?=
 =?utf-8?B?MS8wY0xsR0drR0E4UHJFSFpjaHZqZGxjSHFJZVM4aHRsVGVXVU1QSzJaWWxP?=
 =?utf-8?B?SVpwTStBMkhRbkorTGNtS1c0c05KNFdMVFQwTkUyNXZzaTZtN09mMWZHTVBi?=
 =?utf-8?B?OFYvbGxaWEl5OVd2bFNMSG1sSk5INVBuZHY5WkZITkN1eDR6M01FQlNCYmRU?=
 =?utf-8?B?TVU1NGtNWjRRMXNyUHdPL0NoQTA0UFVrT01Ta2VweFREcDl1SmNKRnM0SXJ2?=
 =?utf-8?B?VEVOcnZWNHhITENPMHpzUVVTMTIyeXN5cWREaVhLcnBEL2laVWs4anNwOGJK?=
 =?utf-8?B?UmhMQlZwV1kybWVLMllwTXhLQmFzdWJ0aENqY3IvRERtalJxWnlFcGZsV3R6?=
 =?utf-8?B?NUpONE43WU56RlhwY0pWK0ZMeVVpdEJoMFBlR3FHNXR3bzdZM2NPSFBsUWxP?=
 =?utf-8?B?Mjl6VWVDZDJYRkV3SzkwUHMwS000WUFmTld1K3IrTlZWZGVobXA4QjRjUUNK?=
 =?utf-8?B?cEdzT0FRTy80Tmt2TitkZ0EwZDdKTkVEU2lISk1kWS9PczVtNFdWMlBWSHVZ?=
 =?utf-8?B?NGtTTHdyajJsS3hiSGJETEVwMXhIQzVoRXlBMk83U1Z0dlBoazc0RzZUekJw?=
 =?utf-8?B?MWdPOThVVXJYd2w3MG1ZMGhvTFBrcEg5eWloTEdtRWNtbHMzMVU3SCtnM3Ay?=
 =?utf-8?B?NFU4ZnVQc2JGaWJib2RBWTgxRVBOQ29Ia2NsSjM3YU1sVkxiZ0xhUE0yeG1o?=
 =?utf-8?B?S2tNTFpiUWZiK2NDS2h6K09IUGt1TVlSZEd0RnhMUjlaa3dMVm9sdTAvM1E3?=
 =?utf-8?B?dkx3UGkrYmtXVVV3WCsyUXZheFVla09NbkF0bkY4bTJQM0hlbXBBL1dDSThh?=
 =?utf-8?B?L3dEQXJPMk5iS0N1UEdOVVNMVDVDM2UxVGkxaGE3REd4aExhR0JOVjU4K3RM?=
 =?utf-8?B?UU80T2ROek9DZlcyQlN3NlA0NHpYdml4eWx5Y0NWQ2pWaGhoUkoxT1V2Z3lR?=
 =?utf-8?B?YS9uRVhhOEhTc2ZTNTY5MndGTXBxbHdjNTFYcHA4YUNhSFZiSVpBdlpuVHRa?=
 =?utf-8?B?S3hRb3FkUjZPR21xdjhEcCs5ZUhJWVJHR05uY1JRR1FwWTI4NmcybWF4TEJZ?=
 =?utf-8?Q?gujMAs9cjDNDh9GQEoFg/3P1PvB1eLd7xPEJe0D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4729b08c-1f69-4e74-2c12-08d8e45d6351
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 07:15:01.9851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdGpaYXHf3nyMS1FdgeWBywOsSncV4DdggOfYRu0WvnwvRxkU4/48nd/uEGwfdbu1kV+jNoRn4e3PR+lmkuy/RuZqMhwGL6TXVLoSADgVBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5927
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgS2llcmFuLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIDEvMl0gbWVkaWE6IHY0bDogdnNwMTogRml4IGJydSBudWxsIHBvaW50ZXIgYWNjZXNz
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gMDEvMDMvMjAyMSAxMjowOCwgQmlqdSBEYXMgd3Jv
dGU6DQo+ID4gUlovRzJMIFNvQyBoYXMgb25seSBCUlMuIFRoaXMgcGF0Y2ggZml4ZXMgbnVsbCBw
b2ludGVyIGFjY2Vzcyx3aGVuDQo+ID4gb25seSBCUlMgaXMgZW5hYmxlZC4NCj4gPg0KPiA+IEZp
eGVzOiBjYmI3ZmE0OWM3NDY2KCJtZWRpYTogdjRsOiB2c3AxOiBSZW5hbWUgQlJVIHRvIEJSeCIp
DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYyB8
IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFf
ZHJtLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2RybS5jDQo+ID4g
aW5kZXggODZkNWUzZjRiMWZmLi5mNmQyZjQ3YTQwNTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJtLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3ZzcDEvdnNwMV9kcm0uYw0KPiA+IEBAIC0yNDUsNyArMjQ1LDcgQEAgc3RhdGlj
IGludCB2c3AxX2R1X3BpcGVsaW5lX3NldHVwX2JyeChzdHJ1Y3QNCj4gdnNwMV9kZXZpY2UgKnZz
cDEsDQo+ID4gIAkJYnJ4ID0gJnZzcDEtPmJydS0+ZW50aXR5Ow0KPiA+ICAJZWxzZSBpZiAocGlw
ZS0+YnJ4ICYmICFkcm1fcGlwZS0+Zm9yY2VfYnJ4X3JlbGVhc2UpDQo+ID4gIAkJYnJ4ID0gcGlw
ZS0+YnJ4Ow0KPiA+IC0JZWxzZSBpZiAoIXZzcDEtPmJydS0+ZW50aXR5LnBpcGUpDQo+ID4gKwll
bHNlIGlmICh2c3AxX2ZlYXR1cmUodnNwMSwgVlNQMV9IQVNfQlJVKSAmJg0KPiA+ICshdnNwMS0+
YnJ1LT5lbnRpdHkucGlwZSkNCj4gPiAgCQlicnggPSAmdnNwMS0+YnJ1LT5lbnRpdHk7DQo+ID4g
IAllbHNlDQo+ID4gIAkJYnJ4ID0gJnZzcDEtPmJycy0+ZW50aXR5Ow0KPiANCj4gDQo+IFRoZSBj
b21tZW50cyBoZXJlIGRlc2NyaWJlIHRoYXQgdGhlIGNob2ljZSB0byBzdGFydCBhdCB0aGUgQlJV
IGlzDQo+IGFyYml0cmFyeSwgc28gaWYgd2UgY291bGQgY29uZmlybSB0aGF0IHRoZXJlIHdpbGwg
YWx3YXlzIGJlIGEgQlJTDQo+IG90aGVyd2lzZSwgd2UgY291bGQgc3dhcCB0aG9zZSB0byBzYXZl
IGFuIGV4dHJhIGZlYXR1cmUgY2hlY2suDQoNCkFzIGxvbmcgYXMgd2UgYXJlIHN1cHBvcnRpbmcg
Y29tcG9zaXRpb24oTXVsdGlwbGUgaW5wdXRzIHdpdGggQmxlbmQgYW5kIFJhc3RlciBvcGVyYXRp
b25zKQ0KVGhlcmUgd2lsbCBiZSBlaXRoZXIgQlJVIG9yIEJSUyBvciBib3RoIGluIFItQ2FyIEdl
bjN8UlovRzIgU29DJ3MuIEN1cnJlbnRseSB0aGlzIGlzDQp0aGUgY2FzZSB3aXRoIGFsbCBTb0Mg
dmFyaWFudCBvZiB0aGlzIGZhbWlsaWVzLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IEJ1dCBh
cyB3ZSBoYXZlIGJvdGggdnNwMV9mZWF0dXJlKHZzcDEsIFZTUDFfSEFTX0JSVSkgYW5kDQo+IHZz
cDFfZmVhdHVyZSh2c3AxLCBWU1AxX0hBU19CUlMpLCBJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUg
Y2FzZS4NCj4gDQo+IEknZCBhbG1vc3Qgd2FudCB0byBjaGVjayBmb3IgdnNwMV9mZWF0dXJlKHZz
cDEsIFZTUDFfSEFTX0JSUykgb24gdGhlDQo+IGJycy0+ZW50aXR5IGxpbmUgdG8ga2VlcCB0aGUg
c3ltbWV0cnkgLi4uIGJ1dCBpdCB3b3VsZG4ndCBiZSBuZWVkZWQsIGFzDQo+IGl0IHNob3VsZCBm
YWxsIHRocm91Z2guIElmIHRoZXJlIGlzbid0IGEgQlJTIHRoZXJlIG11c3QgYmUgYSBCUlUgb3Ig
d2UNCj4gd291bGRuJ3QgYmUgc2V0dGluZyB1cCBhIGJyeCBpbiB0aGUgZmlyc3QgcGxhY2UgOy0p
DQo+IA0KPiBTbyBJIHRoaW5rIHdoYXQgeW91IGhhdmUgaXMgZ29vZC4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQu
Y29tPg0K
