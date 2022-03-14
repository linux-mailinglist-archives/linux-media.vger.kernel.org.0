Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A8A4D81F5
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 12:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239907AbiCNL6k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 07:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240025AbiCNL5z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 07:57:55 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76171DEBB;
        Mon, 14 Mar 2022 04:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ip+LlMKYe9tRYVOWgrQpQc21EG7sP6TAg00pw3j0sPLDrp4su1iKMjbyJlD++Q/kC1ORsCl4bWnDA6uZLaajhIt9H7zDdKhYZAuDGR4zdS7SObknm1iNF80xJT0wubChNqaztTn+YyrLuUpsLot7at/rx43O8TmBgP5jSGms8gv1rXP+EBXr8emnOKR4uA20WDQ9WCt/gdVg0E5i9+GLQhZ0/7vndQlNeTgmhJTzqU39RyV+bCPF5SFgP2D8x2xIwGTxqH+hnfV+JWZSSYNxjhE3QUvknJExhh3mD2vFchWX9NFFiEzxNxHx2R88P3DK9yugoRy2UliBBo2viA8WBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asIKHFrAfZ3lbdApu+0YNMUPSJtZNgA2dhPA0M9VC44=;
 b=Bpmfu0OkGBiQnDFNQ6d7DyE8fei2f6GzgETWTM6Fr60AAI2bJ/vQyDIMumHn7LyI62T32vtglWRG8bHQQR5F1Op2l863GoanN+N0i5hiZJcihM9HFIuMWeS8vrd78b7NrUOe9MTqHdIW3BGDggA3o4NjSP7V4TYV6fIVyi+15iKBsVNqRR1ZSMM8d6YslyjPoTeyRrzA2NVJ/NR1GvQe0mLNwSD4zRR7QJfvaBlEurlpR1fZ4/lEPXj828wwq2K5JrtCnmcN8L5I5WNshTLQqpMS/ussoFvIGSADBKj43w/in9tdtPwrsjDFG1g0NQbzrZeMH5SW7g19RLc85v/MYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asIKHFrAfZ3lbdApu+0YNMUPSJtZNgA2dhPA0M9VC44=;
 b=c5RK4g2jDmbebRWxawFo9Dkvn8xy6qfPj0OfbQFSmIkcoKTNfsq5RG4aKt53EQtI2hkGp4V5j/yCFm3NiGcyX/x+a1ws5M3++n6qdbxu7LgCvIuE3NUvCacJPaqch42Ni0Tk2jI0zYMJvB8K/SB1QFamIn1OROVOm4qo3Q/Rwh8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB5010.jpnprd01.prod.outlook.com (2603:1096:604:69::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Mon, 14 Mar
 2022 11:56:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 11:56:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Topic: [PATCH v5 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Index: AQHYNe0T57itYmyO506UcYfwSM1OkKy9XuYAgAEuykCAAAqTAIAALzWQ
Date:   Mon, 14 Mar 2022 11:56:42 +0000
Message-ID: <OS0PR01MB59229492116F9FDA9239EBEF860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-2-biju.das.jz@bp.renesas.com>
 <Yi39fGVE0f9LgN/1@pendragon.ideasonboard.com>
 <OS0PR01MB592293BC9493DC1DAD1DA0C0860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
In-Reply-To: <CAMuHMdVYYMJvbnR3r-KGtU=3hiKjsiaXH4xyUzhv7vY5Y6MB6A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ad84e00-7db9-4e47-9fc4-08da05b1b47a
x-ms-traffictypediagnostic: OSAPR01MB5010:EE_
x-microsoft-antispam-prvs: <OSAPR01MB50100B824D33F54219F5539B860F9@OSAPR01MB5010.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2c+h+Xbs3QOx/IeLZKZF8f+mfjNsoJj90vOQsYnoM9uRzppDEty6tRp+dvT0CDHjsmVHlzenSATiDXxDUApDjfpU6PEUUcH1zQjYEGV2Z1tLGLgyS0JT9uQNbfv6LDMdSgJzLGZK9Y2SIshyLVNR1ztvGGDZ+z+XgBcdEHwPdHukPFG4IFXUgrx6uCk7KG0XaENy6Y5zQ/vys1SZR7cfqZOTJD2momxT6CDZRI7ygfwcdgHv4MWWFrLThl8zWCqVaOSSkNVpqmYUKDAWnnLWSJSbMfKh7kStnWuEo1Rizbzfh4YRhg6EpdN5AEZuhrIiWj14log29Au7+l3Km+R2aKxGP6jbNv+SPVWMkiERzusw0t0J6oXf2GYxN8cRckqA2MHaw08iFYoDeuGll4UxuVUCIe7g1MhKB48BcRVef+liPfCuMAxRXISZP3CvB0wunA7Cvc4kVGFfkZO3skrsVDwFNLW1ji3FXrtmKz/zKz2jas983mq4O1gMpnfxwfGY/Fk/b4c0zqB7SMUarENg+r0lNVKXGIPh0IaxI7d5e8OyystbPR5fFZen0NrC8t+7B5OXjOJIYzgOY1Ahrs3Y+mN8eii1ir7N6/FLIB2602tQ64SYREDahfIXyn73VIkRZy7WZIS55b6JVXdkebrYhBM93SAAzM3H4jPgjjP47e3PLWuy2cv7s2NcUAq167/jK2nYy59ANgD9iKnS2FpQMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(54906003)(83380400001)(6916009)(316002)(107886003)(71200400001)(7696005)(6506007)(9686003)(2906002)(186003)(26005)(38100700002)(5660300002)(64756008)(66556008)(66946007)(76116006)(86362001)(66476007)(66446008)(52536014)(8936002)(33656002)(38070700005)(4326008)(8676002)(508600001)(122000001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alc0cmxNc29wdDk4dTV3aTB1SHNjbmhycTUxYVVNb1h1LzRZSFJneVNsWmpM?=
 =?utf-8?B?dlI5MXVHSDRhc2RUMXNpY0Z2NWpFSFFMSlYxZHhlNzI3RUh4ZjVxZ3JlQ1d2?=
 =?utf-8?B?dCtCNUFTQUFmUlliVE5BYzVPbG9NUDl6TjRHVkhDT2NHVUpjclBEK0M4NGlX?=
 =?utf-8?B?NW5DNEJHcFpFSFRoQlpRUS8xNHZnZXJ0dE9mY1NSZ0N3VUxIMW5ickViaHdU?=
 =?utf-8?B?V3lhQjlqYzJZVWRqUlR2K1FGcy9YM295bmFJQmI0V25tM0JnbUJkS1NjY3d4?=
 =?utf-8?B?emFSNityV2FQczNFN2dqU1k3QXRHKzR3Nyt0Z3p2VGFOZ2xtUUJDQkx3WVNy?=
 =?utf-8?B?UVkyYXBXSzltTU80OEtKT0dubW9JY1BoYXA2SndFYkEyVFlFMDRtUGhBbzBI?=
 =?utf-8?B?cVhFVitldHBEdmtVSDAxNnBZWTZPZEIydVJWeW5mNlNPbnY4a3pGcnpLenFZ?=
 =?utf-8?B?a25zRkljOHZHSjNaQnh5cmw4Qm1BWnA5UVgrN0o5MkhISEpVU1dRRXJFM0cr?=
 =?utf-8?B?dFZOYkFBbDYvQUFpM3lMNS9KMU1XWXBrd3d1eXBBamppUUtaTzgzOGFBdzli?=
 =?utf-8?B?MHdnRHR3TVcybS9GM0tDVnB1WFhiMlk2U2hWa09CZGRYNWNJNytHWXJvOWdz?=
 =?utf-8?B?cjRSdFlIYkxScFZMWGRyVFlweDQwTmthNVBOVHJpMnpta2s2ckxqOFZjem53?=
 =?utf-8?B?TzlxcmlvWW5hUGRhNnQ1YkE3aDFLRG9QZlB1RmhVZzB3OUQ4Qkc5QzQ0U2xB?=
 =?utf-8?B?UW5RdEg0bGJ4WXErQ0N2blEwUDB6aVJrVUJtWVhmVTFHbmZUWmJSQzZkdXpC?=
 =?utf-8?B?b3M5bWF3bnJRRnd4UlVMZWFnbW9FbWtFRkcrMkZtWlBqMEFoSkh0T3Z4VXQ4?=
 =?utf-8?B?TkxpVWVJSlR4RWJjSlJmWkR1bjRzSldHVDR6bDJyTXlhNngyWDhOWi9YL0Ju?=
 =?utf-8?B?WUY4T1dXUFJwb3dOMG1MNmtWMlJjK1NicHRHVzBESExmOEhZSkRsUk9UMi9r?=
 =?utf-8?B?ZlkySFR4R3RsaWlhUlBwM2xtT2gzQ3ZPcXdGRHdZWVF5MVdsWnBIYjJzVkY1?=
 =?utf-8?B?TzJwdWt0dTJVbCtaYUpRNVV6RTlJZEFicWpoaEtEMThad0ZBUENjS3VrU3dl?=
 =?utf-8?B?K3pMbUxUeGNFWFRmTkwvN25WUEhwanFwTXJMQlRXQkkxK3dmWWl1SHNuQ3Va?=
 =?utf-8?B?K1NQcjMxeVd0M0pZa1B4MGVDRG42ZlVJWDg3aVZUMWliLy9JMWhjTVo1S3Er?=
 =?utf-8?B?TzZKY0JEeFZyQUtUSHU5NjA0aUx4aGRKTUxacVBNTXJPN1BEZ2VySkkyelZY?=
 =?utf-8?B?Znd2WXpOL1Vmck5uOVkrTXVlR00wNkh2bjVveWl5VUVNS3EvakFUTnZYYkxM?=
 =?utf-8?B?MHFiNW1FSy9MUXpFTWowRUN1Y0xYTXdqVHVFcE1LT2xFdXdYOHBwckhsSmFa?=
 =?utf-8?B?WFY4d1RsQUt3VXdMdmxlMXZ4elpPZ0pkUlZ6U0dqUjB6UzdHWFgxVVlEZ3hq?=
 =?utf-8?B?U3oyc0lBOEZGMnlwblFNOHpNbk5ZcEd3anFPVnlPNkxTRUg2S1FoN1c1ek4v?=
 =?utf-8?B?MDFpOXFBR0RKd3BnU1M4WTR1ZnhTSXVHN2RZbS8wWXBMZEI5Uys2ZFVmMEds?=
 =?utf-8?B?NXRHRkpaMFoyUnBTeUx3dmNwdVdCeGd3ckpFSEVNWHgvZVQzcTNRYmhBOHNa?=
 =?utf-8?B?UVlVTEpIUVZUNU5QNzVGMDI1cEpYM3gwLzhKd3RnUHhjUU93NHp5K0oreFdx?=
 =?utf-8?B?SkZneTFaVEd0MVRnTGJrai9WQzQ2amhOdFphWlZWRU0yb2dMNG9KNEhONjR0?=
 =?utf-8?B?MWRGbXg4S3Z2SnQyQXpXb3NWK1I1bFFFZzBicmk1bHR2K3Y0cm50THBtVDhh?=
 =?utf-8?B?TGFzaUkxZ1ZiV3VRQjhpVDhEQzlaUTlRVXRZQjhmdEZXTjZkbHRnSjV3Nzdm?=
 =?utf-8?B?Z3FmQVJIRy9kMmhEZ3ZuWnY5cGF3WGticFM1NVpob25kQkdKSU9aVEpYZlFr?=
 =?utf-8?B?YU52blhTWFh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad84e00-7db9-4e47-9fc4-08da05b1b47a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 11:56:42.1319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MTmeEmjVMMjFtLRwYq81f05Lv8OI8SKp4aE71foi1DtjkP12q9f4WO7kOjCL2PC77isq+Ry3TYGrEx/Kpu3scULKP77wxC4NpS8JQ2WBYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB5010
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMS8zXSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLHZzcDE6DQo+
IERvY3VtZW50IFJaL3tHMkwsVjJMfSBWU1BEIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gT24gTW9uLCBNYXIgMTQsIDIwMjIgYXQgOTo0NCBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAx
LzNdIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IHJlbmVzYXMsdnNwMToNCj4gPiA+IERvY3Vt
ZW50IFJaL3tHMkwsVjJMfSBWU1BEIGJpbmRpbmdzDQo+ID4gPiBPbiBTYXQsIE1hciAxMiwgMjAy
MiBhdCAwODo0MjowM0FNICswMDAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiA+ID4gRG9jdW1lbnQg
VlNQRCBmb3VuZCBpbiBSWi9HMkwgYW5kIFJaL1YyTCBmYW1pbHkgU29DJ3MuIFZTUEQgYmxvY2sN
Cj4gPiA+ID4gaXMgc2ltaWxhciB0byBWU1AyLUQgZm91bmQgb24gUi1DYXIgU29DJ3MsIGJ1dCBp
dCBkb2VzIG5vdCBoYXZlIGENCj4gPiA+ID4gdmVyc2lvbiByZWdpc3RlciBhbmQgaXQgaGFzIDMg
Y2xvY2tzIGNvbXBhcmVkIHRvIDEgY2xvY2sgb24gdnNwMSBhbmQNCj4gdnNwMi4NCj4gPiA+ID4N
Cj4gPiA+ID4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGNvbXBhdGlibGUgJ3JlbmVzYXMs
cnpnMmwtdnNwMicgdG8NCj4gPiA+ID4gaGFuZGxlIHRoZXNlIGRpZmZlcmVuY2VzLg0KPiA+ID4g
Pg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiA+ID4gPiBpbmRleCA5OTBlOWMxZGJjNDMuLjI2OTZhNDU4MjI1MSAxMDA2
NDQNCj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3JlbmVzYXMsdnNwMS55YW1sDQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9yZW5lc2FzLHZzcDEueWFtbA0KPiANCj4gPiA+ID4gKyAgICAgICAg
Y2xvY2stbmFtZXM6DQo+ID4gPiA+ICsgICAgICAgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAg
ICAgICAtIGNvbnN0OiBkdS4wDQo+ID4gPg0KPiA+ID4gU2ltaWxhcmx5LCBJJ20gbm90IHN1cmUg
dGhpcyBpcyBhIGdvb2QgbmFtZSBmcm9tIHRoZSBwb2ludCBvZiB2aWV3DQo+ID4gPiBvZiB0aGUg
VlNQLg0KPiA+DQo+ID4gT0ssIHdpbGwgdXNlIHRoZSBuYW1lICdhY2xrJywgd2hpY2ggaXMgTWFp
biBjbG9jayBmb3IgdGhpcyBtb2R1bGUNCj4gPiB3aGljaCBpcyBzaGFyZWQgd2l0aCBMQ0RDLiAn
ZHUuMCcgaXMgbm90IHZhbGlkIGFueSBtb3JlIGhlcmUgYXMgd2UgYXJlDQo+ID4gdXNpbmcgZGlm
ZmVyZW50IENSVEMgaW1wbGVtZW50YXRpb24gZm9yIFJaL0cyTEMuDQo+ID4NCj4gPiA+DQo+ID4g
PiA+ICsgICAgICAgICAgICAtIGNvbnN0OiBwY2xrDQo+ID4gPiA+ICsgICAgICAgICAgICAtIGNv
bnN0OiB2Y2xrDQo+ID4gPg0KPiA+ID4gSSBjb3VsZG4ndCBmaW5kIHRob3NlIG5hbWVzIGluIHRo
ZSBkb2N1bWVudGF0aW9uLCB3aGVyZSBkbyB0aGV5IGNvbWUNCj4gPiA+IGZyb20NCj4gPg0KPiA+
IEhXIG1hbnVhbCAocGFnZSAzMTIpIG1lbnRpb25zIGFib3V0IExDRENfQ0xLX0EsIExDRENfQ0xL
X1AgJiBMQ0RDX0NMS19ELg0KPiA+DQo+ID4gRGV0YWlsZWQgZGVzY3JpcHRpb24gaXMgbWVudGlv
bmVkIGluIENsb2NrIGxpc3QgZG9jdW1lbnQuIFBsZWFzZSBzZWUNCj4gYmVsb3cuDQo+ID4NCj4g
PiAgICAgICAgIExDRENfQ0xLX0EgICAgICBNMM+GICAgICBQTEwzICAgIDIwMCAgICAgMjAwICAg
ICAgICAgICAgIExDREMNCj4gTWFpbiBjbG9jaw0KPiA+ICAgICAgICAgTENEQ19DTEtfUCAgICAg
IFpUz4YgICAgIFBMTDMgICAgMTAwICAgICAxMDAgICAgICAgICAgICAgTENEQw0KPiBSZWdpc3Rl
ciBBY2Nlc3MgQ2xvY2sNCj4gPiAgICAgICAgIExDRENfQ0xLX0QgICAgICBNM8+GICAgICBTRUxf
UExMNV80ICAgICAgMTQ4LjV+NS44MDMgICAgIExDREMNCj4gVmlkZW8gQ2xvY2sNCj4gPg0KPiA+
ID4gPyBDb3VsZCB5b3UgbWF5YmUgc2hhcmUgYSBEVCBpbnRlZ3JhdGlvbiBleGFtcGxlID8NCj4g
Pg0KPiA+IFBsZWFzZSBzZWUgYmVsb3csDQo+IA0KPiA+DQo+ID4gKyAgICAgICAgICAgICAgIGR1
OiBkaXNwbGF5QDB4MTA4OTAwMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAicmVuZXNhcyxkdS1yOWEwN2cwNDRsIjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MCAweDEwODkwMDAwIDAgMHgxMDAwMD47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDE1MiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA3
RzA0NF9MQ0RDX0NMS19BPiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNwZyBDUEdfTU9EIFI5QTA3RzA0NF9MQ0RDX0NMS19QPiwNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNwZyBDUEdfTU9EIFI5QTA3RzA0NF9MQ0RDX0NMS19EPjsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJkdS4wIiwgInBjbGsiLCAi
dmNsayI7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmY3Bn
PjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldHMgPSA8JmNwZyBSOUEwN0cwNDRf
TENEQ19SRVNFVF9OPjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXNldC1uYW1lcyA9
ICJkdS4wIjsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICByZW5lc2FzLHZzcHMgPSA8JnZz
cGQwIDA+Ow0KPiANCj4gR2l2ZW4gdGhlIERVIGRyaXZlciBpcyBubyBsb25nZXIgc2hhcmVkLCBw
ZXJoYXBzIGFsbCBvY2N1cnJlbmNpZXMgb2YgImR1Ig0KPiBzaG91bGQgYmUgcmVwbGFjZWQgYnkg
ImxjZGMiPw0KDQpPayB0byBtZS4gV2lsbCB1c2UgImxjZGMiIGFuZCBkcml2ZXIgbmFtZSB3aWxs
IGJlICJyemcybC1sY2RjIiBpbnN0ZWFkIG9mDQoicnpnMmwtZHUiLiBXaWxsIHNlbmQgYSBwYXRj
aCB0byBNRVNBIGFzIHdlbGwgcmVwbGFjaW5nICdyY2FyLWR1JyB3aXRoDQoncnpnMmwtbGNkYycs
IG9uY2UgdGhlIGxjZGMgZHJpdmVyIGhpdHMgbWFpbmxpbmUuDQoNCkNoZWVycywNCkJpanUNCg==
