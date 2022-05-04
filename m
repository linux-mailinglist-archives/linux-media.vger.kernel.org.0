Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1EE351ACBC
	for <lists+linux-media@lfdr.de>; Wed,  4 May 2022 20:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376347AbiEDS2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 May 2022 14:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376883AbiEDS2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 May 2022 14:28:16 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9EE35620D;
        Wed,  4 May 2022 10:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBkU7gYcjHI4hkooXMMBBoCSFkxKNol9KYFjK0YV/iFde5TL+0sYrxJILFPihMPMbq88M9nTlLjqDifJKL6zMJlfQyJ9cpi0GmjhcWLlfRRySumz1GPjm52uvXP0od9JfzN4c/Dq8nMrGCzQc4NNgy5/IOTvZZULo474TArwad30yUAJvCA3O8IiH1wHXv+POD7QKd7fC+Uoi7BVEedKAj5Ar0sZZR7+4EMxFsbq7hgV33A4WMZxGBO+Dj4mhW5moLuAp9f3AsDlCvw1cH5hHbgP76r9eguXKVQwHL0IEsItWE60+3V4BOB6K0RepxiwwzMrhxwGcRfLRDYjGEz0nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFx+r9JI1y3tJBLLygW0Otb+J+AA43W4VaRx5kJexWU=;
 b=kPgMjxx+1GTqX6evX5Yd7xwUQ6BpRi33RpkvYsZKLsCscd3fOXkuCmyNu8Mc6lyz6aVX8KNRXRbqkbyImucbrZAlDIjzK+K8BTtwAZLa2AFJ19TmEzBIogyQ+6WsEoLqzvhesVwmtead9BGGZK9pYaezSUqVvSM2JYvu2nhEAcRCWjwy2IreiwPCo2AnK+v6qvEbeveVQJoYO9AQynaIIJRuMr1FOelRE3R/VjoRnOmEp4YGRzbAXLlp17eTRC8WVsQkhlEa/HdUHEHN8uZQBTAtuge947G+6sd9f/nwm6on6shf5kqgziLmeMYBvcOUpMzuBGuByEwLCpoOKjOjqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFx+r9JI1y3tJBLLygW0Otb+J+AA43W4VaRx5kJexWU=;
 b=Ujis/L0ib7yNJLKLeOZqn7MhiPWalxks3nLT2kAbgMGlfvvjub3kGoECbmPWad12nzvwP4F2rrFBt4GOwT39WQ/7go9984scg+NIqUpUpL58/0psMwQrfSF5O/RF63PnhqfTwNjZtw2QnQTqdjxvu7KO0FS2CBp82t+OBtJ5QOQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7556.jpnprd01.prod.outlook.com (2603:1096:400:f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 17:55:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 17:55:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v9 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYWsy3VT/yOu3TOUKgkMrgny1rzK0NSoqAgAG9lsA=
Date:   Wed, 4 May 2022 17:55:43 +0000
Message-ID: <OS0PR01MB592229AEAF0A46F9BA32BC6D86C39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220428065333.3108-1-biju.das.jz@bp.renesas.com>
 <20220428065333.3108-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
In-Reply-To: <CAMuHMdUBVGUsuiVdaG+y-+G2Wz3aiKovZsw1K_GvZ6Azgx_zFg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aac235a6-83fd-4d0e-5697-08da2df74f7f
x-ms-traffictypediagnostic: TYCPR01MB7556:EE_
x-microsoft-antispam-prvs: <TYCPR01MB75562E09EAA1410B5F4A4BD086C39@TYCPR01MB7556.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /01iDovfxj2lBwSUIOpYuni7arCSNkm+CfdP+NWkP9ymCLfatO+cpmf5AkG/DaaiKe3x9SUWh3yR0Z2sMHvp67jHHpwhlFgx97OSSNdhil6Y1avZONMWaSSsgmJY6o9HPLnOHajGzYa5nZCh1TZ87JJW4ZhMJ0SO7wecypFPvF/6+XxYCNDwpU6mV1W5B1OHi28/rEo32ND7M0sPn0rCepMkEtFRebpwbmCCiohsR/GX6jXSZAnX7ao1JY6rUIt2tj2yPH5idB1OLjPxFe7oRQI0u1hJp6k2B11XpG5M9uMVX4UMjk8SGZyRTYCYj1GxnwAOM77X2fNnhsc/xg0KJGAjqMYxMzUDRjDorzHZvMi3hnnTjJmOCUGC43spSZqzaiMbk2jqiw9jGxpFQbxlb8/6eJflEbQSWcOC5Kzpq3cMUAfmE+S5Q5zd+XJG6kkYkSk+r2cXH8luOG4fXxCNUMovcBer/mYNhPDmgwDyHSTUlVFrNOSnwUiJmXCpX0fEeMV1vimAp/NEmM7WEIlnvsEudV9pHvVCwJLiW8UtkvjrqoKX+KwrTaiAEUkdvaybl8akQmJzsTYxgBfkQD8/kY7fJu02rnFx9PI1zOkBB1PEPVvnL5QlrYexP1os2YphGcqeuO56UEoNmGp9w4bt1Lhsb7I9x0VTGSYGbgsmNx3oXJWnfzFBcHcTEEMOqobBCArRJW6ut3snJaBVmlkjpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(2906002)(107886003)(5660300002)(54906003)(508600001)(83380400001)(71200400001)(26005)(52536014)(64756008)(66446008)(66946007)(66476007)(66556008)(9686003)(38100700002)(8676002)(76116006)(4326008)(316002)(86362001)(38070700005)(33656002)(8936002)(7696005)(6506007)(53546011)(186003)(122000001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RU1VbmYyWVE1THJ2ai9vMlRNTW5MM3FxYTViZmxSMEl4Z1hEaStIZklBbWdT?=
 =?utf-8?B?eXFiNHRUc0JIbFh2M2UvQ04yTUlOd0VhYlU2WTNmdUhhZW44NVc2SDBKb2Ja?=
 =?utf-8?B?dERpcytrM1dFbitkMkdrSHhYN0pMQVU1Z2lkbTRiY2V4YzZORzYvRGtGRlo5?=
 =?utf-8?B?bnJXcGhrbi9HV214Q2x4a1BhS3lqZVBpL2lUQ08vdExyUlA3WW5LY3lVNUgx?=
 =?utf-8?B?cWpOS00yS3ZLTndsZUJNUG0wTUJPWlZLcWhwMnVMVlh1UmllLzgyMHo5bnc0?=
 =?utf-8?B?eUlsY1FINEVwaExsYnk5dGlTNERCaFpIaWtrbU9XYy9GVUg2Q1hrU1ZwWWx3?=
 =?utf-8?B?alFuOVkwOVJBWDZLNVpzSmZBbnZ3djVSMHQrcWlHbTBhbCsxZXhkTTNPVytS?=
 =?utf-8?B?SkZXRzlKa0NtVitWNFkyb0U3YTZybnNxdzBGZTUyZ0licHlZdjRXZ2RLclEz?=
 =?utf-8?B?ZXNNUkx1Q294dkVZTzJZczdUYkg3TnoydHFjZzJaVC9QV1Z5TTFNZ3JUOWVy?=
 =?utf-8?B?NXFFS3d1UGtEbEpBenBPMThWR2pzM09XbHUrc1VzSkE5WURIUnlEcFVUd254?=
 =?utf-8?B?VFpKYm5tdk5QeUk4Nm9ETENQUzJUSkVDRS9IM2tVNFkreEZ4WHU2VjhwYmVj?=
 =?utf-8?B?WnJBNEowVjA5UXhHRHRDT1YydXA3WHZCZllzdWp6QkxFY1ppN1RTWElmQzlT?=
 =?utf-8?B?eHlCSm5yR1FGTGo2RWxsd1hSdzF0aGZPNnpzbjlrYjNiVjBBSmRBVTlVQjYx?=
 =?utf-8?B?R3lmaC95NnhKQVpvbENKTVQ3cEw5dFBoZmREYjgyVUpYS1UzQ1J6SDgraGNy?=
 =?utf-8?B?VDJ6MVp2dmFjWE1TRmI3TDB0aThPK3JieHhGdXJKcFFncmNwSDR4QzBsaEhv?=
 =?utf-8?B?d2lQRzYrbkNNSzBkN1EySTk2T3E2NTdkTlV0M0QrdVBUQkZlWEl0elFCbGdO?=
 =?utf-8?B?a1FoR2xIMXVlZFR4RTFlZTJEdWk2QjZPM0U3WEF4bk9kdHFpZ01KSTE4c2Zl?=
 =?utf-8?B?elBHRVFYSE1NVWlWZkZ1ODQvdk9EOEx0aDFodWZlZFlzSHA4MG56MXZML3ZI?=
 =?utf-8?B?VHNRS3FYcUgvMDlqU1k5bVFRa0t6Nk50bUJYUFQ5S202eEd5VTV1OHdib0hv?=
 =?utf-8?B?RU9IdHY0QmhLekJ3VXYrOWZNQUloVXhXekppWHl3MXFFYWtPOFN1MTdkcU5U?=
 =?utf-8?B?UitwN09PQ1J3NWxVcmxqSWJ1cUFQUDNNU2pzTjFydUovaFVsbElwRFZ1REZz?=
 =?utf-8?B?Q1I2N0QzZnEzekY3VWVCUWF3UThFRGl0RkFKTVBGU296TWVha0xvcmI5STFi?=
 =?utf-8?B?U2NLL0hKQUI3Tm1sd25wdGR6SGdEeUI1b2pNY3ZPN1hiN1RaaE0vWGtOakF6?=
 =?utf-8?B?dUpjZmJ0R01xdkp4NjIxWWZHTVNma3BSMTVOMXdyeENmLzJqMENOVldmVkw0?=
 =?utf-8?B?bDNEMHZ6Q0JPaEpQenFScnZIRkNSdTRFTHVBVnFjdER0cEdpWDhSRlV2THNF?=
 =?utf-8?B?WjRTbUFRaEMvTTZxYjhkME1KRkxQYUgrZzhOYksxTlNDYW0zRzlpK1RYY0tJ?=
 =?utf-8?B?YWJmY3NJVHgwTVBTd3Q2ZjNKSk92UTdGUmdDUlJ3NE5ReG1UK1JWU3MyR1M0?=
 =?utf-8?B?aFFSUHNWdzRyVlJ4bm1xSThwRjBuM1BQQW1XQWZnQXJ6L3k2VTZkRmlObW5t?=
 =?utf-8?B?T2laRFk4T2xWZTVqdzdMcGNTOTllU2RobzJCdFJER21GR3BkK0dMc0cwZis5?=
 =?utf-8?B?N2VnQ001NWZWNllhdnBnZHNZNmttUTVFdGhLcGw1QVNTSnFKWHhIeGtZdTJS?=
 =?utf-8?B?U1krRUsrMjJSZFpEZnppNTc0VXZwTjZOclVKYjlEc3ROMWdmdjR2YlNDdUdp?=
 =?utf-8?B?UnFmWVhhNGY2OVhNenJSckxYbFZ4bE41TjBVZmRCeGRzTUdXUXB2cnBJRDFs?=
 =?utf-8?B?bHVrOTJHOVljV1VCakR4R0VDcDZpbDBGQko3YUltUTA5am5EcGk4VGVMcUhq?=
 =?utf-8?B?WUlIbytHV01zNlZlZTd1UGFnb0lMWVQ2WlpwMktHbjVTc0hPN1ZrNE10bGtt?=
 =?utf-8?B?VzVyUXRhZDd6ZjNTaGc5dnR3N0dzVlkvUmk2OWp6NXVMeThNNXAraFE0d2lO?=
 =?utf-8?B?QkZvNW41cndZTFQ1UG1maDZqWHllSmpxQXdaUnFNdXMzcjB0WVpMMStEMm9p?=
 =?utf-8?B?T0ozT0k5bVlCc3RNeFlNcTlWTG9IOTJKTThERGgxZm9TWmlncGtxUDFxZVhh?=
 =?utf-8?B?MkZRY3BSRFQ1bGJWY2hQejFVM1BLRTlvYXIxN0xaaFBjaXBPditCaEN6cXYw?=
 =?utf-8?B?dytyWVpPdVAvSi9oMmhEbHVnb2xXSGJPakVDZENuV0dWSXN0WjRIVkNWTktl?=
 =?utf-8?Q?rz+kcE5M5hQe9RAQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac235a6-83fd-4d0e-5697-08da2df74f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 17:55:44.0108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hQmUiDYlQW5fqnBIFtcxWcBpagUJGADo1asowl7tb/vTIVxc0BKa0v13GVwvyWTpKJ5EpY8CwcF7WprbeRki+ctB0ylVkGZLXNtpBP9excA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7556
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQgYW5kIExhdXJlbnQsDQoNCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDIvNV0g
bWVkaWE6IHJlbmVzYXM6IHZzcDE6IEFkZCBzdXBwb3J0IHRvDQo+IGRlYXNzZXJ0L2Fzc2VydCBy
ZXNldCBsaW5lDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBBcHIgMjgsIDIwMjIgYXQg
ODo1MyBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IEFzIHRoZSByZXNldHMgRFQgcHJvcGVydHkgaXMgbWFuZGF0b3J5LCBhbmQgaXMgcHJlc2Vu
dCBpbiBhbGwgLmR0c2kgaW4NCj4gPiBtYWlubGluZSwgYWRkIHN1cHBvcnQgdG8gcGVyZm9ybSBk
ZWFzc2VydC9hc3NlcnQgdXNpbmcgcmVmZXJlbmNlDQo+ID4gY291bnRlZCByZXNldCBoYW5kbGUu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4NCj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQ
aW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gVW5mb3J0dW5hdGVseSB0aGlzIHBhdGNoIGNhdXNlcyBh
IGxvY2stdXAgZHVyaW5nIGJvb3Qgb24gdGhlIEtvZWxzY2gNCj4gZGV2ZWxvcG1lbnQgYm9hcmQu
DQo+IA0KPiBBZGRpbmcgc29tZSBkZWJ1ZyBjb2RlIHJldmVhbHMgdGhhdCB0aGUgVlNQMSByZWdp
c3RlcnMgYXJlIGFjY2Vzc2VkIHdoaWxlDQo+IHRoZSByZXNldCBpcyBzdGlsbCBhc3NlcnRlZDoN
Cj4gDQo+IHwgV0FSTklORzogQ1BVOiAwIFBJRDogMSBhdA0KPiBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3JlbmVzYXMvdnNwMS92c3AxLmg6MTIxIHZzcDFfcmVhZCsweDQ4LzB4NzQNCj4gfCByZXNl
dCBub3QgZGVhc3NlcnRlZA0KPiB8IENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlci8wIFRhaW50
ZWQ6IEcgICAgICAgIFcNCj4gNS4xOC4wLXJjNS1zaG1vYmlsZS0wNDc4Ny1nMTc1ZGQxYjc3NTMx
LWRpcnR5ICMxMjMwDQo+IHwgSGFyZHdhcmUgbmFtZTogR2VuZXJpYyBSLUNhciBHZW4yIChGbGF0
dGVuZWQgRGV2aWNlIFRyZWUpDQo+IHwgdW53aW5kX2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2sr
MHgxMC8weDE0ICBzaG93X3N0YWNrIGZyb20NCj4gfCBkdW1wX3N0YWNrX2x2bCsweDQwLzB4NGMg
IGR1bXBfc3RhY2tfbHZsIGZyb20gX193YXJuKzB4YTAvMHgxMjQNCj4gfCBfX3dhcm4gZnJvbSB3
YXJuX3Nsb3dwYXRoX2ZtdCsweDc4LzB4YjAgIHdhcm5fc2xvd3BhdGhfZm10IGZyb20NCj4gfCB2
c3AxX3JlYWQrMHg0OC8weDc0ICB2c3AxX3JlYWQgZnJvbSB2c3AxX3Jlc2V0X3dwZisweDE0LzB4
OTANCj4gfCB2c3AxX3Jlc2V0X3dwZiBmcm9tIHZzcDFfcG1fcnVudGltZV9yZXN1bWUrMHgzYy8w
eDFjMA0KPiB8IHZzcDFfcG1fcnVudGltZV9yZXN1bWUgZnJvbSBnZW5wZF9ydW50aW1lX3Jlc3Vt
ZSsweGZjLzB4MWJjDQo+IA0KPiB2c3AxX3BtX3J1bnRpbWVfcmVzdW1lKCkgaW5pdGlhbGl6ZXMg
dGhlIFZTUDEuDQo+IA0KPiB8ICBnZW5wZF9ydW50aW1lX3Jlc3VtZSBmcm9tIF9fcnBtX2NhbGxi
YWNrKzB4M2MvMHgxMTQgIF9fcnBtX2NhbGxiYWNrDQo+IHwgZnJvbSBycG1fY2FsbGJhY2srMHg1
MC8weDU0ICBycG1fY2FsbGJhY2sgZnJvbSBycG1fcmVzdW1lKzB4M2U0LzB4NDdjDQo+IHwgcnBt
X3Jlc3VtZSBmcm9tIF9fcG1fcnVudGltZV9yZXN1bWUrMHgzOC8weDUwICBfX3BtX3J1bnRpbWVf
cmVzdW1lDQo+IHwgZnJvbSBfX2RldmljZV9hdHRhY2grMHhiYy8weDE0OCAgX19kZXZpY2VfYXR0
YWNoIGZyb20NCj4gfCBidXNfcHJvYmVfZGV2aWNlKzB4MjgvMHg4MA0KPiANCj4gX19kZXZpY2Vf
YXR0YWNoKCkgY2FsbHMgInBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2LT5wYXJlbnQpIiwNCj4gYnlw
YXNzaW5nIHZzcDFfZGV2aWNlX2dldCgpLg0KPiBIZW5jZSBpdCB3YWtlcyB0aGUgcGFyZW50LCBi
dXQgZG9lcyBub3QgZGVhc3NlcnQgcmVzZXQuDQo+IA0KPiB8ICBidXNfcHJvYmVfZGV2aWNlIGZy
b20gZGV2aWNlX2FkZCsweDU2MC8weDc4NCAgZGV2aWNlX2FkZCBmcm9tDQo+IHwgY2Rldl9kZXZp
Y2VfYWRkKzB4MjAvMHg1OCAgY2Rldl9kZXZpY2VfYWRkIGZyb20NCj4gfCBtZWRpYV9kZXZub2Rl
X3JlZ2lzdGVyKzB4MWI4LzB4MjhjDQo+IHwgIG1lZGlhX2Rldm5vZGVfcmVnaXN0ZXIgZnJvbSBf
X21lZGlhX2RldmljZV9yZWdpc3RlcisweGIwLzB4MTk4DQo+IHwgIF9fbWVkaWFfZGV2aWNlX3Jl
Z2lzdGVyIGZyb20gdnNwMV9wcm9iZSsweGY3NC8weGZlMCAgdnNwMV9wcm9iZSBmcm9tDQo+IHwg
cGxhdGZvcm1fcHJvYmUrMHg1OC8weGE4ICBwbGF0Zm9ybV9wcm9iZSBmcm9tIHJlYWxseV9wcm9i
ZSsweDEzOC8weDI5Yw0KPiB8IHJlYWxseV9wcm9iZSBmcm9tIF9fZHJpdmVyX3Byb2JlX2Rldmlj
ZSsweGM0LzB4ZDgNCj4gfCBfX2RyaXZlcl9wcm9iZV9kZXZpY2UgZnJvbSBkcml2ZXJfcHJvYmVf
ZGV2aWNlKzB4NDAvMHhjMA0KPiB8IGRyaXZlcl9wcm9iZV9kZXZpY2UgZnJvbSBfX2RyaXZlcl9h
dHRhY2grMHhkNC8weGU4ICBfX2RyaXZlcl9hdHRhY2gNCj4gfCBmcm9tIGJ1c19mb3JfZWFjaF9k
ZXYrMHg2NC8weGE4ICBidXNfZm9yX2VhY2hfZGV2IGZyb20NCj4gfCBidXNfYWRkX2RyaXZlcisw
eDE0OC8weDFhOCAgYnVzX2FkZF9kcml2ZXIgZnJvbQ0KPiB8IGRyaXZlcl9yZWdpc3RlcisweGFj
LzB4ZjAgIGRyaXZlcl9yZWdpc3RlciBmcm9tDQo+IHwgZG9fb25lX2luaXRjYWxsKzB4NzAvMHgx
NmMgIGRvX29uZV9pbml0Y2FsbCBmcm9tDQo+IHwga2VybmVsX2luaXRfZnJlZWFibGUrMHgxYWMv
MHgxZjggIGtlcm5lbF9pbml0X2ZyZWVhYmxlIGZyb20NCj4gfCBrZXJuZWxfaW5pdCsweDE0LzB4
MTJjICBrZXJuZWxfaW5pdCBmcm9tIHJldF9mcm9tX2ZvcmsrMHgxNC8weDJjDQo+IA0KPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDFfZHJ2LmMNCj4gPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX2Rydi5jDQo+IA0K
PiA+IEBAIC01NjcsNyArNTY4LDE3IEBAIHN0YXRpYyB2b2lkIHZzcDFfbWFza19hbGxfaW50ZXJy
dXB0cyhzdHJ1Y3QNCj4gdnNwMV9kZXZpY2UgKnZzcDEpDQo+ID4gICAqLw0KPiA+ICBpbnQgdnNw
MV9kZXZpY2VfZ2V0KHN0cnVjdCB2c3AxX2RldmljZSAqdnNwMSkgIHsNCj4gPiAtICAgICAgIHJl
dHVybiBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KHZzcDEtPmRldik7DQo+ID4gKyAgICAgICBp
bnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQo
dnNwMS0+cnN0Yyk7DQo+ID4gKyAgICAgICBpZiAocmV0IDwgMCkNCj4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsNCj4gDQo+IFBlcmhhcHMgeW91IGNhbiBtb3ZlIHRoZSBkZWFzc2VydGlv
biBvZiB0aGUgcmVzZXQgdG8NCj4gdnNwMV9wbV9ydW50aW1lX3Jlc3VtZSgpLCBzbyBpdCBpcyBj
YWxsZWQgYXV0b21hdGljYWxseSBvbiBldmVyeSByZXN1bWU/DQoNCkkgbW92ZWQgdGhlIGNhbGxz
IHZzcDFfcG1fcnVudGltZV8qIGFuZCB0ZXN0ZWQgdGhlIGNoYW5nZXMgb24gUlovRzFOKFItQ2Fy
IEdlbjIpLCBSWi9HMk0oUi1DYXIgTTMgdGVzdGVkIFNUUiBhcyB3ZWxsKSBhbmQgUlovRzJMLCBB
bGwgd29ya3MgT0suIA0KDQpCdXQgZm9yIFJaL0cxTihSLUNhciBHZW4yKSBjbGsgZHJpdmVyIG5l
ZWRzIGFuIGFkZGl0aW9uYWwgMzUgbWljcm9zZWNvbmRzIGRlbGF5DQphZnRlciBkZS1hc3NlcnRp
bmcgcmVzZXQsIG90aGVyd2lzZSBzeXN0ZW0gaGFuZ3MuDQoNCkkgd2lsbCBwb3N0IGEgcGF0Y2gg
d2l0aCB0aGUgY2xrIGNoYW5nZXMuDQoNClRoYW5rcyBhbmQgcmVnYXJkcywNCkJpanUNCg==
