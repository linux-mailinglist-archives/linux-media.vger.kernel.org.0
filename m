Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19068577F63
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbiGRKMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 06:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233833AbiGRKMl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 06:12:41 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C31831C92D;
        Mon, 18 Jul 2022 03:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRg0egKfu8U5hoKhRP7uzONp7AeGmYhwl1vOKC9MEK9WQmUK/y1zm1iawkYIV2gDzUVQqjRmaNPpOvq2di/s+0pSLUakWzkRRA91u6FjnUTiOL+xheGKVynB40jmVxz19lxsVGrCbukqj2wDOOUQ6cQZZJMLQAFAuRHw89mr7UcPsCl3N/NCDhMe7d2QzerUvkBFVA5sRmRqawKxU7mxbDo81X6Nzp6pmBylDalDs94B1YepsBu6kxqkjdtkCqxEZu6lpfPkshF+XfLg6eX4/9DI2RCEu5G4AV8mRrFg8kzAzyT8hwEssuhOV2rhiZwnlYbgRqd1aOgTk+Pj20iDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LpsZDb9XVw4d+alHl+0LMpfljX7FUb1so1bI2KwaYc=;
 b=W32QZkvsbYcIEouxrOZBoOcc8Ll3146MJu4Gmv2v+w4Tr7ZgAQjA9yNRo/7R7FmS5ZmLvZTkG13pdWYlIpF3prEgtbj/6abc7828fIP4LpP7axWUW4kMdCbvPm45H+guZme/FVGwVLZyQWHbbJjBML/48qKkiGp0QRixKYrBiDFt+Rg7M/4J4mLTWnmcoBSxrtqp4ZwpSsABQLouNvzmT2FwexjxBf+PIz6wbdRiXCjcGfP8K5NgIhHWkbLIKlmd1KOYKEufRseb0aPcxFzYK/gXzB80LeQ92QYN1/0WCnpeQEBJSl81QJCM5KUI1cvG/901SgZWOqIS2G9pY24X2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LpsZDb9XVw4d+alHl+0LMpfljX7FUb1so1bI2KwaYc=;
 b=rZVMuUfYPwO9cKdHz6w9RRrQyPw+0XK3hTk6eGWevmxKlDjIZmwMtKxSe011HD20vJCOXZU0yuVVJptsot9CtY0FKy3LXbEvBOdE5iP70SYJL4wzJKww60nWEsQByn6LMFjmplcVEQQ8fSIlwoyCRo1fJmHTqE/GkZ+IblzEwyc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3851.jpnprd01.prod.outlook.com (2603:1096:404:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.21; Mon, 18 Jul
 2022 10:12:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:12:34 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYdPmLaH3LWDeTz0+X1dy9H4VIWa18OHAAgAAKlXCAAAizAIAAEfkAgAAGnICAB8d6EIAABR+AgAABhGA=
Date:   Mon, 18 Jul 2022 10:12:34 +0000
Message-ID: <OS0PR01MB5922B692CA3784F4C481118F868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
         <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
         <20220713081856.GA14683@pengutronix.de>
         <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
         <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
         <20220713103216.GA10829@pengutronix.de>
         <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
         <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <f3d19a38e59e73b91601b7a34aaf1c2ea41ff915.camel@pengutronix.de>
In-Reply-To: <f3d19a38e59e73b91601b7a34aaf1c2ea41ff915.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-Mentions: geert@linux-m68k.org
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9a905d6-334a-421e-ab34-08da68a6085e
x-ms-traffictypediagnostic: TY2PR01MB3851:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AuzXaZBV1lxVOnlDd+Nv74EHi1iXfD0FVNKqtIqWVmb37ihJPkb1RArSGto0xBa6lksZa4IjAXM3v46Oi0YuQn930XNFkOoo0KWdOK+RE7OB9XHCc1pHuPrVjsdcYu6gf6BbAHAXDXB04V9De9TFshsLTwQpCYJWp76eTGzvs8Q/GeNWsI8a1xa7n4W+xOkrZNntyM9YW5OM/7ZwzuXJW6neQI2RpeEzHyFJFCMuFwkAsfvzJdlCHcR/T1i+723DzTZ1yE8iLR3QtUcLM5tRlXeSUCgXB9luJy3N8D5wpGnXJcsS5PgzUL2Iz6fbgHnw+aex6ztnCayVd89d8H/a5R5zYo5/SsLOiOyKa6dSVnNbx0qlAyEBk3KW5AYV6SsNDZpXuAT3CSp26YxPkd1PYhdfk4IhQ8FqvtLWRCgnAbwcbIWejtrG3sJLR/Ap8KkZ9fqNNN1BM2FMFZWGxUXcET25dk4r1ACwG0z0i9n+UzZKFhSWf8yxOE80JiG6IssPTmbJ+3+pHFrA/2y5K743AtHuxjIBlFG4gZnDcd4s6uFgRrS4fwJ9p6eU20Mix6cV13McjuaozOA8QMPSQxTz6vUkS+245FZS6lLnDumQaXQi8N3o30PNYxvYQQPHLZpMp/qWJfzS9z/mDgDs3od463LCNoQypN2RmB3z252SaBmzmodDHClFN0f3eFHrlqg4KVAUGawqA/QVizUGlnc0t6lCZmxMstvU+GMOUthQDM8ohEi3Le5VqmMlAciHPRJ49p8M2c+O4xvAidPDQ/h1YeIplDIVzTIlYLyyhn5rl8yF+SOC0MlNDYFpDrML9qaOXdW7grwgIeWRDUbAFS6W7aRppRQVrw2XLvBYCwyBxOQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(186003)(83380400001)(55016003)(66556008)(66476007)(66446008)(110136005)(71200400001)(76116006)(66946007)(4326008)(64756008)(8676002)(26005)(478600001)(52536014)(54906003)(9686003)(107886003)(2906002)(53546011)(7696005)(6506007)(38070700005)(38100700002)(86362001)(5660300002)(41300700001)(316002)(122000001)(966005)(8936002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXJwSlhqUGgrMStEcit2MmtvaitsUmhPUmVWY0tTanUrZURDcmhXUkFUUE94?=
 =?utf-8?B?Q3BPbG1lcTdwdGdzMkFoQUFMWlc4NHFycGxCalE5dlZXYnRyV2xzOFhpQk5l?=
 =?utf-8?B?UElFZE1lNGhUR0FJREZyMWY2WlNFY0V2Q3pvSmNwKzB1TW5jY1NENEpFdVRh?=
 =?utf-8?B?Q1FyekpRVFdaSXBPMDlUcVZrNm1CUXVheDl1RlF5UDZ3UkEwZ0hFKzBiRlNz?=
 =?utf-8?B?Q2NPdy9aQnJpNUpXeTU2SmE3YXBSZnRNMFljQzBYVWJYalZlT2JQMzhMUUNn?=
 =?utf-8?B?Ym1qNzVjeGRyTlNieEM1QW5tV0tCQlhTSmdFQ0hyUFVPWWUrUW44Y2dCdWdz?=
 =?utf-8?B?cm1QRitzZVZaOUl6dE9NQnd0TU8xUEpVMWRFNGg0bVJyaVNMTnhQYWpOTDEw?=
 =?utf-8?B?MEsrelkxRVJyTndiNFUwNEpVbURPc2RHQWhucDNNOHE4OU9hSytSNjFFV2NQ?=
 =?utf-8?B?TmVxY29IbmdvcktRd3BYSlZ5UE1pa2dESitFZ01qQUMwYUVhRmthR2xJNUR1?=
 =?utf-8?B?bDdsWVRvaHZGYUxQVjBzUmVTVFk3LzF6MXZ0bnF2amxLdWJUSkdkNCs0Njcx?=
 =?utf-8?B?dVJQZGtVbDNCM0VMVmRDSGdqdEllY09mVTkvSkJzdFNqNXZRQ05oUDRVRkg4?=
 =?utf-8?B?bFdxOU5BOStvRmNoNkRkK1RxdVNubGFxS1R2TXl1TklvcEZEc0lpMHNOTVky?=
 =?utf-8?B?S25sWjBhV0RKb2JJdDNSVkVXTDRJUm1hNnZtWERkWnhjREZnaE04N0FQdmVw?=
 =?utf-8?B?R3Voc0xLaDc1cHUwVTlDb0ZzYmc2RU9XaEJrOWQrTlpjb1Rrdm43b3psOEU0?=
 =?utf-8?B?NjBMS1djbHBkKzhOaklsVS9ialkzU2N6UlJkdmJmZkVCb2tmbGZianJQZ2xN?=
 =?utf-8?B?RjBXZFZCdjN4QkxBbnh0YWFCam9WWk5kL0ZvN0ZxbzVJd1lqYjNGSENJMXhW?=
 =?utf-8?B?ME9LWXN5dCtYdXUyYkp0RnF3STJWMHRJNWJVcmxUTWp4dFJZRlZjOG44UHY0?=
 =?utf-8?B?ckJqc1JxRFNvamVRdlBtTHpzRDYrWVVCVlVQK1BNRW5QcmcvYnkxZ2pCQjZL?=
 =?utf-8?B?UnBKenZWVGc2Q21rTWVYS3pOeEhpU2d2V3Vxdkh4NWVOOHlubkF3bGJsb0hz?=
 =?utf-8?B?ajlzMmtnL3NwTnhvbzVOa2Zmam9TZEJKTjg2dDFCdkVPclpVMUdqTlVvYXNt?=
 =?utf-8?B?VGt2WFNYN3dKMUltR0lROUR3Qlp5blJVY0ZoM1IwRHhScm9lbWE2ZUN3TWE0?=
 =?utf-8?B?QytyOHZ4MFpmOW5aMm16bTEwWUxiVk1ZYkpRUXpIQzR2M1hpdkx3SnRYR1JJ?=
 =?utf-8?B?MGpzZU53dytUaWdJQ2tqd2Ura2lHZ0E5RkhmOGxIYVZKS3diZHRzVUtOWDJL?=
 =?utf-8?B?V1NVSWFHajZSZG5vSkluYnRSYjdNWGkxOUcvUHc0WXF5aFI5WjBhZU16MVpY?=
 =?utf-8?B?azRsNmJocXdodDBiTGVBOUtWNmZ2RFlDYXZBV3NoaUVlR0pGTTN2REx2KzVJ?=
 =?utf-8?B?QUZ1c2dUUHorWFFabGc4ZjRUWTNsa2R1eVRDMlRldGtaZDlXRVdSTW5EYVk3?=
 =?utf-8?B?YVgyWGI3dEMrbWtGWThia1BpWE5Qc2hOTVZuQVFCc3l2TUNtSFA5bEpHYmt3?=
 =?utf-8?B?Uk8vT1pBdURod0RZRHdscE03TWRXVHF3QnBlMWt6Wm5JbE5oMXIrRzZubnpz?=
 =?utf-8?B?UDRBYm80YTllUjhQRzhYdGtGT3hXS1FCd2tmZzllVTAzWlhCN0tRNVpkWnR6?=
 =?utf-8?B?TGwrM1BCZjJrcy9KdkhaRmdoM2YzeXIvYTl4eTkremw2TFZsSEdBRjFqempo?=
 =?utf-8?B?aFNlRWplQ295YkttbE5FdU1CMW9hK3duWWNNY25xdTlOakZJcWxtUXVudHVZ?=
 =?utf-8?B?YlQ1VlVrUGx3WDNRemp3cWVaV2hnVlpGRmM4Z3lNU3FsTFcxNVNVT1FCWGJW?=
 =?utf-8?B?T3htbXBvWm04eHBxUml4T1R0YXl5YVRsN3VSMGhQWnFYTEJ6RkxmbFZnVkdk?=
 =?utf-8?B?c3BleFZwSlVYOGRXaEpXSnpSaGpUaytLQStLVzJZRnI5Q2lIOGRXakl2MFZr?=
 =?utf-8?B?OWtnY0kvdFdSRW5MUFhrM1hCeERTeUU3QzJtK3F3MURLQWowb3pUemdrb2ZQ?=
 =?utf-8?B?eEFRLyt0VGZvQmxUUUhNVk1NZS8vZURITlhtSys2VXVGOWtHRVk3NDRWaGlo?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a905d6-334a-421e-ab34-08da68a6085e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 10:12:34.0159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HIh0/+FAmI9nLuuBfAa2L2DaSjKqLwhm5lk7LG6iIOs1ncJMz/sK1ygsVdHiLq9FAuUl4Sdn+urHUzLjNioWfMaeHJA/IVDfqHihTqO9HwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3851
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpbGlwcCBhbmQgR2VlcnQsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MTEgMi81XSBt
ZWRpYTogcmVuZXNhczogdnNwMTogQWRkIHN1cHBvcnQgdG8NCj4gZGVhc3NlcnQvYXNzZXJ0IHJl
c2V0IGxpbmUNCj4gDQo+IEhpLA0KPiANCj4gT24gTW8sIDIwMjItMDctMTggYXQgMDk6NDYgKzAw
MDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIFBoaWxpcHAgYW5kIEdlZXJ0LA0KPiA+DQo+ID4g
PiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMSAyLzVdIG1lZGlhOiByZW5lc2FzOiB2c3AxOiBBZGQg
c3VwcG9ydCB0bw0KPiA+ID4gZGVhc3NlcnQvYXNzZXJ0IHJlc2V0IGxpbmUNCj4gPiA+DQo+ID4g
PiBIaSBQaGlsaXBwLA0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgSnVsIDEzLCAyMDIyIGF0IDEyOjMy
IFBNIFBoaWxpcHAgWmFiZWwNCj4gPiA+IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPg0KPiA+ID4g
d3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgSnVsIDEzLCAyMDIyIGF0IDExOjI3OjU2QU0gKzAyMDAs
IEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gPiA+ID4gWy4uLl0NCj4gPiA+ID4gPiBBY3R1
YWxseSBJIHN1Z2dlc3RlZCBoYW5kbGluZyB0aGlzIGluIHRoZSBWU1AgZHJpdmVyLCBhcyBWU1AN
Cj4gPiA+ID4gPiBzZWVtcyB0byBiZSAic3BlY2lhbCIuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBbMV0NCj4gPiA+ID4NCj4gPiA+ID4gU28gcmVzZXRfY29udHJvbF9zdGF0
dXMgbmV2ZXIgYWN0dWFsbHkgcmV0dXJucyAxIGFuZCB0aGUgcG9sbGluZw0KPiA+ID4gPiBsb29w
IGlzIG5vdCBuZWNlc3NhcnkgYXQgYWxsPw0KPiA+ID4gPg0KPiA+ID4gPiBJZiBpdCdzIGp1c3Qg
dGhlIHN0YXR1cyByZWdpc3RlciByZWFkIHRoYXQgZml4ZXMgdGhpbmdzIGZvciBWU1AsDQo+ID4g
PiA+IGNvdWxkIGl0IGJlIHRoYXQgdGhlIGRlYXNzZXJ0aW5nIHJlZ2lzdGVyIHdyaXRlIHRvIHRo
ZSByZXNldA0KPiA+ID4gPiBjb250cm9sbGVyIGFuZCB0aGUgZm9sbG93aW5nIHJlZ2lzdGVyIHdy
aXRlcyB0byBWU1AgYXJlIG5vdA0KPiA+ID4gPiBvcmRlcmVkIHNvbWV3aGVyZSBhdCB0aGUgaW50
ZXJjb25uZWN0IGFuZCB0aGUgcmVhZCBpc3N1ZWQgdG8gdGhlDQo+ID4gPiA+IHJlc2V0IGNvbnRy
b2xsZXIganVzdCBndWFyYW50ZWVzIHRoYXQgb3JkZXI/DQo+ID4gPg0KPiA+ID4gVGhlIHVkZWxh
eSgpIGFsc28gd29ya3MuDQo+ID4gPg0KPiA+ID4gV2hpbGUgdGhlIHJlc2V0IG1heSBiZSBkZWFz
c2VydGVkIGltbWVkaWF0ZWx5IChhdCB0aGUgcmVzZXQNCj4gPiA+IGNvbnRyb2xsZXIgbGV2ZWwp
LCB0aGUgVlNQIG1heSBuZWVkIHNvbWUgYWRkaXRpb25hbCB0aW1lIHRvDQo+ID4gPiBzZXR0bGUv
aW5pdGlhbGl6ZSAoYXQgdGhlIFZTUCBsZXZlbCkuDQo+IA0KPiBeIHRoaXMgZmVlbHMgdG8gbWUg
bGlrZSB3ZSBhcmUgYmxpbmRseSBhcHBseWluZyBhIHdvcmthcm91bmQgZm9yIGFuDQo+IHVua25v
d24gcHJvYmxlbS4gSXMgdGhlcmUgYW55IHdheSB0byBmaW5kIG91dCB3aGF0IGFjdHVhbGx5IGNh
dXNlcyB0aGlzDQo+IGRlbGF5IChvciBzdGF0dXMgcmVhZGJhY2spIHRvIGJlIG5lY2Vzc2FyeT8g
SXMgdGhlcmUgc29tZXRoaW5nDQo+IGRvY3VtZW50ZWQsIGxpa2UgYSBjZXJ0YWluIG51bWJlciBv
ZiBWU1AgY2xvY2tzIHJlcXVpcmVkIHRvIGludGVybmFsbHkNCj4gcHJvcGFnYXRlIHRoZSByZXNl
dD8NCg0KT0suDQoNCj4gDQo+ID4gPg0KPiA+ID4gUmVzZXQgaXMga25vd24gdG8gd29yayBvbiBv
dGhlciBibG9ja3Mgb24gdGhlIHNhbWUgU29DLCBzbyB0aGF0J3MNCj4gPiA+IHdoeSBJIHN1Z2dl
c3RlZCBoYW5kbGluZyB0aGlzIGluIHRoZSBWU1AgZHJpdmVyIGluc3RlYWQsIGxpa2Ugd2UNCj4g
PiA+IGFscmVhZHkgZG8gZm9yIGkyYy4NCj4gPg0KPiA+IEZyb20gdGhlIGRpc2N1c3Npb24sIHdl
IGFncmVlIHRoYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gaXMgZ29vZC4NCj4gPg0KPiA+
IFBsZWFzZSBjb3JyZWN0IG1lIGlmIG15IHVuZGVyc3RhbmRpbmcgaXMgd3JvbmcuDQo+IA0KPiBG
cm9tIG15IHVuZGVyc3RhbmRpbmcsIG5vdCBxdWl0ZS4gQXQgbGVhc3QgdGhlIHRpbWVvdXQgcG9s
bCBpcw0KPiB1bm5lY2Vzc2FyeSBhbmQgbWlzbGVhZGluZy4gSXQgc3VnZ2VzdHMgdGhhdCByZXNl
dF9jb250cm9sX3N0YXR1cygpIGNvdWxkDQo+IHJldHVybiAwIGF0IHRoaXMgcG9pbnQsIHdoaWNo
IHdvdWxkIGJlIGEgYnVnIGluIHRoZSByZXNldCBkcml2ZXIuDQo+IA0KPiBJZiByZXNldF9jb250
cm9sX3N0YXR1cygpIG9ubHkgZXZlciByZXR1cm5zIDEgYW5kIHRoZSBwb2xsaW5nIGxvb3AgZW5k
cw0KPiBpbiB0aGUgZmlyc3QgaXRlcmF0aW9uLCB5b3UgY2FuIGRyb3AgdGhlIGxvb3AgYW5kIGp1
c3QgcmVhZCBzdGF0dXMgb25jZS4NCj4gT3IgdXNlIHVkZWxheSgpLCBhdCB0aGlzIHBvaW50IEkg
aGF2ZSBub3QgZW5vdWdoIGluZm9ybWF0aW9uIHRvDQo+IHVuZGVyc3RhbmQgd2hpY2ggd291bGQg
YmUgbW9yZSBhcHByb3ByaWF0ZS4NCg0KRm9yIFJaL0cxTiBTb0MncyBsaWtlIEdlZXJ0IG1lbnRp
b25lZCBpbiBbMV0sIGNhbGxpbmcgcmVzZXRfY29udHJvbF9zdGF0dXMoKSBvbmx5IG9uY2UgZml4
ZXMgdGhlIA0KaXNzdWUuIFNvIHN0cmljdGx5IHNwZWFraW5nIHBvbGxpbmcgaXMgbm90IHJlcXVp
cmVkLg0KDQpAR2VlcnQgVXl0dGVyaG9ldmVuLCBQbGVhc2Ugc2hhcmUgeW91ciBvcGluaW9uIG9u
IHRoaXMuDQoNClsxXQ0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXJlbmVzYXMtc29jL3BhdGNoLzIwMjIwNTA0MTg0NDA2LjkzNzg4LTEtYmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20vDQoNCkNoZWVycywNCkJpanUNCg0K
