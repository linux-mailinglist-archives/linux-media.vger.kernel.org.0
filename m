Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431F05A38AB
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 18:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbiH0QKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Aug 2022 12:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233732AbiH0QKW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Aug 2022 12:10:22 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B28D11F;
        Sat, 27 Aug 2022 09:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGeieH8A0jWNmgUAtJqb+ay6SKy9yFRI7/xAqMwcdQLYvCqAr+EqtCpZrZIWsQtOIrrj1Vq1JzxDz9qEwOR1CI1z0Iu3UxHnp7nGTOY3X5GxK27QrqYrQLkqfC3om2wZfV+GA75Gqn5dAet+JI5F8xLjBb+xKORl4eZJ/8461vU98GQAK8ME/PuOrwi73JtOGgT7WKd5+4Ma4rtAreZ+xWcJNfh2fxHUfOMBWaWjJQPyejEphiiKQxI7QGyw4iAVdVsHmbe3OpU6b8Vz0izTaHM1BGKVejt7ZMroFq+EjTmHuIFWC0gxvSMfjOAbaBh5ZxL9Cq1rthzSgdUE7wOWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dVEUAtV9fpxJv6KL2fnHkMbm9aBMOIdDhhkR/HXr1Ew=;
 b=PTvIlN0OYuw2Zv5KIHcqT7k/PUxzyyIrZa0Dlk4fPDL1NTHDCJLByh5GyH486ucJdtaYwz/9Rw5Td6TJT1iDEWkWvcgAZI5GXtZc3VTy4e7EATSWZy6rEMPnZ1hnAEy8uw9Rx25T2xE+HqouvH4pQcJBYtgcIhvHL5DQJqYzyDGl4suRq/RAubVX6kdOwTWyuPv3K46d4Az6oJkP5/p/jMdAGhMYs69xz17r2s32QHY8VSOLM3QCY0LbwdHqR8vODtQhOgNSE7nD5+v6cXDIWlQ+69R9HI1vxJOgsYQHuKMcixYwtgGfF5D5g00ZgdXP91UulE4PXKYwxQtYYI1jCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dVEUAtV9fpxJv6KL2fnHkMbm9aBMOIdDhhkR/HXr1Ew=;
 b=E8YqXzaNdrNbfAXBVnXn2lFcH8YUK/i/ZO0vvBqc8gVbtNQXoPaUUxrg+JM6HVMFJlNZYi59/VsgUYMv3HOH4SpVGwhOEhmsE2vUzD8l6spJvY40Ravy2cT+6sTVJ1K2fjyc6X6BTU/TycfxanEJOvbi4pMYDCTdUYsP51XcS4c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB3392.jpnprd01.prod.outlook.com (2603:1096:404:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 16:10:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 16:10:18 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v13 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
Thread-Topic: [PATCH v13 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
Thread-Index: AQHYuIWwGvPEphtqfE+FtjxOsyHSo63B7myAgAD/C1A=
Date:   Sat, 27 Aug 2022 16:10:18 +0000
Message-ID: <OS0PR01MB5922060988E8E8633BB34B9E86749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-5-biju.das.jz@bp.renesas.com>
 <Ywlrj28w+8/Coe4Z@pendragon.ideasonboard.com>
In-Reply-To: <Ywlrj28w+8/Coe4Z@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be667c0e-1d49-4945-dbab-08da8846a2f4
x-ms-traffictypediagnostic: TYAPR01MB3392:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L10O2lZKEi7STRaNfgWbyRX5w1ULfCqVZJb7zv09o8SJrLaflntlgT7D/03S5fIR6vL81/AzJe7LC2W8TKJRLTpJW1lAd8Ny/Tjv+PFosKvLMwu1/poXog5R/pczGkqvTpURiW+Jk05vfn1c8rgUR/cna+BR59Mns32+Ui8TAPNeZbsqjpGa/jEisnVCvbRDdrh2mFcP8gGtOWCJq/v1qAKaw4FdoXnZWXetffLp5Jd0M/t6Hk0XgUNBrwlOVLuQ9Y6G6KFWaetlyttQUOLUrCXPAu35hf9BDjVXAvFyEpVvMfLEATPF0tnLJsdtiWuwzsKkDHMZDw6QCSiJq1udMLcrx3CYiQXXGWs37BmZKwFK9CItQZMOmwZG63mJhLnbe3SJTebLBfAEFacPj5uNoEdRNMDBW0X6zUiVUY9VpyNiyI3jThN7tQqwtmKXwPT0o6Z/psFLVIr0rZcYDjo96QnXsSWXjsFROsbddcBU/S3XbT+i9I0pdFZqcmX6imEggAIAXFlsJX5R7zt/JNimw8r8dlEMgvIf1AvIuAr6dHpc3eLxd3DWuVSUFNFRd/J6vsbEKKIrYNzyjyhFZ4v25SWCWiVLDjG2z2WpGKLrFnKkBD+eU95quq/Qv/8zTpQW9CvTgNXnV0WhTvdzR1Jo2InINTF7bx1Z+b7gnHyciAhAaNTARnoOYN2T2LVvdLw+LYUcG+SgPugzQfWbVIKjZQ/TfVgNiAxi1hMKg5YOD0/+ZQX/klVGTjnnkQjcedNEnavNxsf60wi3YDRhLiuVDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(26005)(52536014)(38100700002)(71200400001)(5660300002)(478600001)(122000001)(2906002)(33656002)(8936002)(6916009)(316002)(76116006)(38070700005)(66946007)(66446008)(41300700001)(107886003)(64756008)(66476007)(8676002)(7696005)(186003)(66556008)(86362001)(4326008)(9686003)(55016003)(54906003)(83380400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2E2SlZ2SjNLanU3cjZqTUd5SHIrQU56NDkvZWNPaWY2ZnArVFczdWtyNmVZ?=
 =?utf-8?B?V2JTREhaVmF1cElBdW5IcmVxcVVEQVlLTTdtNWRuNXNMbGdlcCtEYUFkSDRa?=
 =?utf-8?B?dTJYOTBYajk4Umx5d2tKRHVlMFg5Y0FsNDh4em1uSDhOeDhBUU9nL3FXZjNp?=
 =?utf-8?B?bEs2VGdQNi84eUk1TDFHaWJHZ3BzR0xQSEorRUlwNzlnR2lHTEljVnZhM1dL?=
 =?utf-8?B?S0hIZGZBR3pLMmNaeUFMcG8vUTFPZ0IybUtQZkJHU0prL0UvT09nV3JNdlNa?=
 =?utf-8?B?SFRDWno5UG80RWNuZGVkQ3lPdW16emdwYk9hMGZlV0x6cmlMT0U4cEwxTi9m?=
 =?utf-8?B?aWNpcU5pQThMM3NSUGdjblJyR1FrVXhKVThTTmRiNGE5UFovNXhoU2tCUzdH?=
 =?utf-8?B?WDZZSktKSFFuWWh2eGcybWlLZEY2cVZ5UkZCSjRPMVZJOTBqL1VFdGd2dENJ?=
 =?utf-8?B?KzNYVGNGVFNFL2VrTnlVZEVBWFNrS2Z2K1d6SlJFVmNMc0lqdmo4cERVUWZw?=
 =?utf-8?B?U2ZDRFpjekwvRkR5SERpbGhYeWEwV2g3YWZZNUcxNDN0YVQvbm1jYmhzRjND?=
 =?utf-8?B?ckZJbFI4ZEJGdFR0YlZQNTZDWHZmaTdXU1p6NUR3eXg3VERNZnRvUlNUVDBQ?=
 =?utf-8?B?RkZrbHRycmtEaERyUXRKQ2hoMzVVUzF6UjRzelVIRUEweTdGaU1rdkN5dmVy?=
 =?utf-8?B?T2hyL21vV2UyYUc3QkdkSmxTMnIydVcwOXJJc3lpa2QzbWFvbWp2ZTlpek9w?=
 =?utf-8?B?cXVtbzRjQzZFSms4dmczT3dhZHRIOUVIYXpmcGllKy9vcklDU2xZK0Y4ZDF1?=
 =?utf-8?B?ZDBEWXl3Z1RsSWM0dWMzNDRPOTJESTRibThoTHdDQ2k1TXhZVGRoMlFnWEdM?=
 =?utf-8?B?TXpTc1pVOHRUWE5lZ2Evb3p1M0ltbkFuREtsV1NpYnlKazVQOWxOTzBpQ3dv?=
 =?utf-8?B?aTFqY29Za1gxcU5qeVJRZHZCMW1TMzFUWm5XWkREQzA5ejhweDFzb1BtZ3dP?=
 =?utf-8?B?NHF2empPcno5dm5tem51Z1lsQU10U0xLcnlKRHN4TTJyTW1WMkFKcWUvSnpw?=
 =?utf-8?B?ZUxPU3dONmNjeTNIMlk1SFdlRVNLQ2xlSVVZTWpTU1J4Y2ZHTTk4Y3JtdFQ1?=
 =?utf-8?B?TWVUV1RWa2JFWHdoRHNkVW1sY21VY3k2WWYvQVBYSkVBN1hiZHduNjU1LzBt?=
 =?utf-8?B?elJKUE51V2xaQWdFMTdlck03UGpQZ1JrVUNEcG1WU1A4ZTVBMyt3K1lQdmtL?=
 =?utf-8?B?bEhpK2szVzg5c216QXZJTXVLRC9TZStRVml3dGFrMEY4cmlkQnRHZ3ZuMmxL?=
 =?utf-8?B?d0QzTllyN3RqdFhOQ0hIVzR3MEFXVGlvdkMzbHpEWTM1MHJGcUhxUWJXTU1j?=
 =?utf-8?B?VVRWMkZITEd0c2NFZmtRZTRETU9GUFpYaEtuVk1qWlVzVkgzK3VKU21DMGFM?=
 =?utf-8?B?bGxDWE1kditEKzQ0MWd0MXlDbmYxM1lFUzdTb0xUUUVNenBFU1dTY0g0cFBw?=
 =?utf-8?B?YWd4WUVjU3ZyR2tMUFZFaVlQdTZtbm1CQ05sU1BlaDY2YU5EMG5zUWlsS0JI?=
 =?utf-8?B?cnVZR2xqS1lYQXYvRUUrQ2FGNkFXNUV3MUNUU0VJUVdrSElMdHk3eUZhNWwx?=
 =?utf-8?B?czBTeThQRGxVa21HOTY5aUwzQTZnaDh1MFpBL210NmV5Rnp0aEgycDhEemt0?=
 =?utf-8?B?RGhLdHVweFdtYmd4UGNQNWlmbDdKNXc1MFJTVnpST1RpalNJMzFNcHlVVm4z?=
 =?utf-8?B?MXhhQmJIdkw1MWUxYUFyZ2tKT3hIMHFoZitNUlhIaDlmUStVbTJLUjRCaFI1?=
 =?utf-8?B?L0VNK3B3ZDZVMmZrRy9zYVJkWk5PVk5KWlRqYWxUVHhkRjgzbGZHSmtELy9P?=
 =?utf-8?B?L0dPRG9sVHMzVERLWDRPVUZ5VVgyaXF1K29tcHZFRThId1BsODg4WjhYa1B6?=
 =?utf-8?B?U3A5a1E5NFdSWEI2OThBOXVScUxtRVFvYlNHc1pQWS9jbGFOdGtBdElwZmc4?=
 =?utf-8?B?TlJNZGFOWVJZZWFpL3Z6UERKOTExbCs5WnJFZFEzV3IyRHhWdE4wUzhHc1dw?=
 =?utf-8?B?Zmk2eDhJWE5ObUMvMkdvcXpzbTlJaWlibnd4dCt1eUxPeHZvbVBLa3NueThi?=
 =?utf-8?Q?n0FpvdwmFhe8FUyamfkujkPS2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be667c0e-1d49-4945-dbab-08da8846a2f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 16:10:18.8765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BhQ5GWI7tzemmI2wndDL6+rEa7BgZP4SeaIss6CnjrWjOvRRuaXCHzs2BqEkYDTEO83NQMWOyMaklEkAxPq3ouoLegimFViWViXoh0f+r68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3392
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MTMgNC81XSBtZWRpYTogcmVuZXNhczogdnNwMTogQWRkDQo+IFZTUDFfSEFTX05P
Tl9aRVJPX0xCQSBmZWF0dXJlIGJpdA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVGh1LCBBdWcgMjUsIDIwMjIgYXQgMDI6MjE6NDNQTSAr
MDEwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQXMgcGVyIEhXIG1hbnVhbCBWM00gYW5kIFJaL0cy
TCBTb0NzIGhhcyBub256ZXJvIExJRiBidWZmZXINCj4gPiBhdHRyaWJ1dGVzLiBTbywgaW50cm9k
dWNlIGEgZmVhdHVyZSBiaXQgZm9yIGhhbmRsaW5nIHRoZSBzYW1lLg0KPiA+DQo+ID4gVGhpcyBw
YXRjaCBhbHNvIGFkZHMgc2VwYXJhdGUgZGV2aWNlIGluZm8gc3RydWN0dXJlIGZvciBWM00gYW5k
IFYzSA0KPiA+IFNvQ3MsIGFzIGJvdGggdGhlc2UgU29DcyBzaGFyZSB0aGUgc2FtZSBtb2RlbCBJ
RCwgYnV0IFYzSCBkb2VzIG5vdA0KPiA+IGhhdmUgVlNQMV9IQVNfTk9OX1pFUk9fTEJBIGZlYXR1
cmUgYml0Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxMi0+djEzOg0KPiA+ICAqIE5vIGNoYW5nZQ0K
PiA+IHYxMS0+djEyOg0KPiA+ICAqIE5vIGNoYW5nZQ0KPiA+IHYxMC0+djExOg0KPiA+ICAqIE5v
IGNoYW5nZQ0KPiA+IHY5LT52MTA6DQo+ID4gICogTm8gY2hhbmdlDQo+ID4gdjgtPnY5Og0KPiA+
ICAqIFVzZWQgZ2VuZXJpYyBjaGVjayBmb3IgbWF0Y2hpbmcgU29DcyB3aXRoIExCQSBmZWF0dXJl
Lg0KPiA+IHY4Og0KPiA+ICAqIE5ldyBwYXRjaA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxLmggICAgIHwgIDEgKw0KPiA+ICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX2Rydi5jIHwgMTgNCj4gPiArKysrKysrKysr
KysrKysrKy0gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDFfbGlmLmMg
fA0KPiA+IDMgKy0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3JlbmVzYXMvdnNwMS92c3AxLmgNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNh
cy92c3AxL3ZzcDEuaA0KPiA+IGluZGV4IGZmNDQzNTcwNWFiYi4uMmY2ZjBjNmFlNTU1IDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDEuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDEuaA0KPiA+
IEBAIC01NSw2ICs1NSw3IEBAIHN0cnVjdCB2c3AxX3VpZjsNCj4gPiAgI2RlZmluZSBWU1AxX0hB
U19IR1QJCUJJVCg4KQ0KPiA+ICAjZGVmaW5lIFZTUDFfSEFTX0JSUwkJQklUKDkpDQo+ID4gICNk
ZWZpbmUgVlNQMV9IQVNfRVhUX0RMCQlCSVQoMTApDQo+ID4gKyNkZWZpbmUgVlNQMV9IQVNfTk9O
X1pFUk9fTEJBCUJJVCgxMSkNCj4gPg0KPiA+ICBzdHJ1Y3QgdnNwMV9kZXZpY2VfaW5mbyB7DQo+
ID4gIAl1MzIgdmVyc2lvbjsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9yZW5lc2FzL3ZzcDEvdnNwMV9kcnYuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9y
ZW5lc2FzL3ZzcDEvdnNwMV9kcnYuYw0KPiA+IGluZGV4IDIyM2RkNWY1NTdiYS4uYzBkODE0ZDkw
NDRlIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3Ax
L3ZzcDFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNw
MS92c3AxX2Rydi5jDQo+ID4gQEAgLTc4Nyw2ICs3ODcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHZzcDFfZGV2aWNlX2luZm8NCj4gdnNwMV9kZXZpY2VfaW5mb3NbXSA9IHsNCj4gPiAgCX0sIHsN
Cj4gPiAgCQkudmVyc2lvbiA9IFZJNl9JUF9WRVJTSU9OX01PREVMX1ZTUERfVjMsDQo+ID4gIAkJ
Lm1vZGVsID0gIlZTUDItRCIsDQo+ID4gKwkJLnNvYyA9IFZJNl9JUF9WRVJTSU9OX1NPQ19WM0gs
DQo+ID4gIAkJLmdlbiA9IDMsDQo+ID4gIAkJLmZlYXR1cmVzID0gVlNQMV9IQVNfQlJTIHwgVlNQ
MV9IQVNfQlJVLA0KPiA+ICAJCS5saWZfY291bnQgPSAxLA0KPiA+IEBAIC03OTQsNiArNzk1LDE3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdnNwMV9kZXZpY2VfaW5mbw0KPiB2c3AxX2RldmljZV9p
bmZvc1tdID0gew0KPiA+ICAJCS51aWZfY291bnQgPSAxLA0KPiA+ICAJCS53cGZfY291bnQgPSAx
LA0KPiA+ICAJCS5udW1fYnJ1X2lucHV0cyA9IDUsDQo+ID4gKwl9LCB7DQo+ID4gKwkJLnZlcnNp
b24gPSBWSTZfSVBfVkVSU0lPTl9NT0RFTF9WU1BEX1YzLA0KPiA+ICsJCS5tb2RlbCA9ICJWU1Ay
LUQiLA0KPiA+ICsJCS5zb2MgPSBWSTZfSVBfVkVSU0lPTl9TT0NfVjNNLA0KPiA+ICsJCS5nZW4g
PSAzLA0KPiA+ICsJCS5mZWF0dXJlcyA9IFZTUDFfSEFTX0JSUyB8IFZTUDFfSEFTX0JSVSB8DQo+
IFZTUDFfSEFTX05PTl9aRVJPX0xCQSwNCj4gPiArCQkubGlmX2NvdW50ID0gMSwNCj4gPiArCQku
cnBmX2NvdW50ID0gNSwNCj4gPiArCQkudWlmX2NvdW50ID0gMSwNCj4gPiArCQkud3BmX2NvdW50
ID0gMSwNCj4gPiArCQkubnVtX2JydV9pbnB1dHMgPSA1LA0KPiA+ICAJfSwgew0KPiA+ICAJCS52
ZXJzaW9uID0gVkk2X0lQX1ZFUlNJT05fTU9ERUxfVlNQRExfR0VOMywNCj4gPiAgCQkubW9kZWwg
PSAiVlNQMi1ETCIsDQo+ID4gQEAgLTgzNyw4ICs4NDksMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2c3AxX2RldmljZV9pbmZvDQo+ICp2c3AxX2xvb2t1cF9pbmZvKHN0cnVjdCB2c3AxX2Rldmlj
ZSAqdnNwMSkNCj4gPiAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHZzcDFfZGV2aWNlX2lu
Zm9zKTsgKytpKSB7DQo+ID4gIAkJaW5mbyA9ICZ2c3AxX2RldmljZV9pbmZvc1tpXTsNCj4gPg0K
PiA+IC0JCWlmICgodnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9OX01PREVMX01BU0spID09
IGluZm8tDQo+ID52ZXJzaW9uKQ0KPiA+ICsJCWlmICgodnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9W
RVJTSU9OX01PREVMX01BU0spID09IGluZm8tDQo+ID52ZXJzaW9uKSB7DQo+ID4gKwkJCWlmIChp
bmZvLT5zb2MgJiYNCj4gPiArCQkJICAgICgodnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9O
X1NPQ19NQVNLKSAhPQ0KPiBpbmZvLT5zb2MpKQ0KPiA+ICsJCQkJY29udGludWU7DQo+ID4gIAkJ
CXJldHVybiBpbmZvOw0KPiA+ICsJCX0NCj4gDQo+IEhvdyBhYm91dCBtYWtpbmcgdGhpcyBtb3Jl
IHJlYWRhYmxlID8NCj4gDQo+IAl1MzIgbW9kZWw7DQo+IAl1MzIgc29jOw0KPiANCj4gCS4uLg0K
PiANCj4gCW1vZGVsID0gdnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9OX01PREVMX01BU0s7
DQo+IAlzb2MgPSB2c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fU09DX01BU0s7DQo+IA0K
PiAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUodnNwMV9kZXZpY2VfaW5mb3MpOyArK2kpIHsN
Cj4gCQlpbmZvID0gJnZzcDFfZGV2aWNlX2luZm9zW2ldOw0KPiANCj4gCQlpZiAobW9kZWwgPT0g
aW5mby0+dmVyc2lvbiAmJiAoIWluZm8tPnNvYyB8fCBzb2MgPT0gaW5mby0NCj4gPnNvYykpDQo+
IAkJCXJldHVybiBpbmZvOw0KPiAJfQ0KDQpPSywgaXQgaXMgbXVjaCBiZXR0ZXIgbG9naWMuIFdp
bGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCj4gDQo+ID4gIAl9DQo+ID4NCj4gPiAgCWRldl9lcnIodnNwMS0+ZGV2LCAidW5zdXBwb3J0
ZWQgSVAgdmVyc2lvbiAweCUwOHhcbiIsDQo+ID4gdnNwMS0+dmVyc2lvbik7IGRpZmYgLS1naXQN
Cj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDFfbGlmLmMNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDFfbGlmLmMNCj4gPiBp
bmRleCA2YTY4NTdhYzkzMjcuLjlhZGI4OTJlZGNkYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX2xpZi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3ZzcDEvdnNwMV9saWYuYw0KPiA+IEBAIC0xMzUsOCAr
MTM1LDcgQEAgc3RhdGljIHZvaWQgbGlmX2NvbmZpZ3VyZV9zdHJlYW0oc3RydWN0DQo+IHZzcDFf
ZW50aXR5ICplbnRpdHksDQo+ID4gIAkgKiBtYXkgYXBwZWFyIG9uIHRoZSBvdXRwdXQpLiBUaGUg
dmFsdWUgcmVxdWlyZWQgYnkgdGhlIG1hbnVhbCBpcw0KPiBub3QNCj4gPiAgCSAqIGV4cGxhaW5l
ZCBidXQgaXMgbGlrZWx5IGEgYnVmZmVyIHNpemUgb3IgdGhyZXNob2xkLg0KPiA+ICAJICovDQo+
ID4gLQlpZiAoKGVudGl0eS0+dnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJTSU9OX01BU0spID09
DQo+ID4gLQkgICAgKFZJNl9JUF9WRVJTSU9OX01PREVMX1ZTUERfVjMgfCBWSTZfSVBfVkVSU0lP
Tl9TT0NfVjNNKSkNCj4gPiArCWlmICh2c3AxX2ZlYXR1cmUoZW50aXR5LT52c3AxLCBWU1AxX0hB
U19OT05fWkVST19MQkEpKQ0KPiA+ICAJCXZzcDFfbGlmX3dyaXRlKGxpZiwgZGxiLCBWSTZfTElG
X0xCQSwNCj4gPiAgCQkJICAgICAgIFZJNl9MSUZfTEJBX0xCQTAgfA0KPiA+ICAJCQkgICAgICAg
KDE1MzYgPDwgVkk2X0xJRl9MQkFfTEJBMV9TSElGVCkpOw0KPiANCj4gLS0NCj4gUmVnYXJkcywN
Cj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==
