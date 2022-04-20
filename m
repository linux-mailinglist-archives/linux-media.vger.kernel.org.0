Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3AC508662
	for <lists+linux-media@lfdr.de>; Wed, 20 Apr 2022 12:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377838AbiDTKzM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Apr 2022 06:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359695AbiDTKzG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Apr 2022 06:55:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0743A403C6;
        Wed, 20 Apr 2022 03:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnsDbPHsl/W4RroMlNHSPl0D6vw9PglVJr2a4/YmskANHaJpYK0p1OoniIJGSYUJt5qT+VnyT3pcFuo5SJT3HhE7pG1uIEEqTSN6lWYmZ7cPcjMZ3nvK2VSSlWIAGqDA5lDSCPJ8cEFf88Ug99GLfBxM1iSGdUUokmW2r6V13Mf9oKRsitMDJs6U3IewR+sqUsfbJ0TKcDpiNBVywZ40CSAiPX4AC9Ox4PEMR5Z8gi+vI+9em4FZg++6VchgRMvhrpud8BRwuizWOZBtE6qN9O54PTZxFkCztXBFZWETMVzuLUfOUnJUBMRYPion+oZ2e0lOCTIC2RGvhMtOF+NFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEj8MqJG5qVyBM/SZrok7hvvobl5tYKTZUnhCKrwRsU=;
 b=J75nYpF0TJm6s0IhX/RJwCr9pS14feRxU0crK5+p4ZqrDj/ruvwBBNWe71VYqXT69vMbDEivU0oE0WCJOn5xq38eRsfadLZB7izDWKYeMGHGQIoJ4QS+bbLe9BmqjfqzS5qIohmdBVwJfhBHV5yY5dUUlecEpWVkGn8ru6L3lPj9K7S5tmuGYqjcHySjGR6+CNTZwZkHLZqKMFAg9HIb7E4/Z0cug6U+EzQlMbRjmRLsgpB4oaAuG3/dwfEMurAnXZ7XeP+yij3tFA4/72VYbQ0WglFjelNaCPWuNPxBLNBVzGdh2DMLk5y1RnfcDu2vQ2TXiAYXzanPgHG0mUPSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEj8MqJG5qVyBM/SZrok7hvvobl5tYKTZUnhCKrwRsU=;
 b=iK2DZ6JRcbVBNo30T32nSqGJK+IIlp7muwyo7v52smYY4izmHeIF78z1oNIkCPxug6zqukLZR0M/28PIZEC/s8YdrwjpN9+4vT/KE/IYPUPpLBse/2JhNDn4XH5Hi6/E5abzPeykH5zNEwFNikiOmE7tfgt15whNz5ErDPAAQGM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3641.jpnprd01.prod.outlook.com (2603:1096:404:d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 10:52:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 10:52:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: RE: [PATCH v8 1/5] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2L VSPD bindings
Thread-Topic: [PATCH v8 1/5] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2L VSPD bindings
Thread-Index: AQHYVBnTeibtrylt20WscBIstiRasqz4mE8AgAAHAGA=
Date:   Wed, 20 Apr 2022 10:52:17 +0000
Message-ID: <OS0PR01MB592245415D71BF56713201C886F59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com>
 <20220419181757.63346-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXAgJf89ZS_SnF0UMU9tUhROqDxP5N_mAeNj9N6oQBAUw@mail.gmail.com>
In-Reply-To: <CAMuHMdXAgJf89ZS_SnF0UMU9tUhROqDxP5N_mAeNj9N6oQBAUw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ab19f6d-dd64-47a2-cc4f-08da22bbd629
x-ms-traffictypediagnostic: TY2PR01MB3641:EE_
x-microsoft-antispam-prvs: <TY2PR01MB364144FCA68D1F7F554C9E7886F59@TY2PR01MB3641.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jZnBWl6qFU1fI0FwmK1EkfoQxSGJ3TUoA9tpL1/8ZddZjJrEbop3/B8Aw/7ePw241T1XdVHzrljM8t9HkhTgJRh09LfHjP/TI9SP+8uUyyNJicOdjrUjcrWSZkqL8HIyYFjoj0UTIqvYOtHj2T4f0RAqIswqHX7j/H8/pO7o1DKGwusR8QheFv1dWQBOHz2dj6yl50w9AfxC1ig8SdF43ME6CHpQtwZO79do/yml8uNhTxD7cC3YW5XTF0bm+Ldhqk7Htza6H+VEx2mmZzt2GJi8hZQLQbx3ouX5pWIOCnW3QTzQkf3ytUhGDmd5K5NkyfRTTYFg9VAeheDwb0VQwsFnEj3XP9akHMvnBmMeT/yL2GRD0FOIgJiaYXrFlRgccRQQSfQDO5M8WUBF00d7spLxZIC31+CtFxpTP04rWl+MTXfi+KXhpM0m4BUMQe9WePZTtNjYaqRnungBVlJjefkWQMAOuHJ0VrtmGkh3ehRYiCZYQh5OeEliGzvmILPFP41uprYedEzU7evFQ8/B3gUjqmhX+wIr3m1xEu9OV6GW1MPeEO8OiCAYbi4Wi6u85nQd7UoxzYas8lbFdYEN9YGxpld5BVbprIHpVNB+HxP2iF9hn3EGaZSoIDvh9sm7WNlT37e4XrPlLmENBelvDH4ugzkmL2XrSZVAie4qjqcwv3ERRFfHSehGU+1JaELWIV+4Ua1NPD0q7no5cVh0ng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(86362001)(71200400001)(9686003)(83380400001)(8676002)(2906002)(53546011)(122000001)(52536014)(7696005)(6506007)(55016003)(4326008)(8936002)(5660300002)(33656002)(38100700002)(7416002)(38070700005)(508600001)(6916009)(316002)(66446008)(66556008)(186003)(76116006)(64756008)(54906003)(66476007)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVRSUVR4NXh0RmdkOVgwakhYVURpOVUveXdkakZaNE1CZnROU2tHK0NEaENr?=
 =?utf-8?B?Vms4NERTbnkycHR2dDVFKzE1UzEvRGttbEkveTBQb1F6cHlsOEUzYVZ5dlhv?=
 =?utf-8?B?eGRBU0lPVCtRa2MzVGlJZjcrOGcvZXIwNWI5QmVoSjkvbWVmd1puRERJeTdh?=
 =?utf-8?B?NjhDYkN4d29QNTJiL1FEMXpCZTdkcjkxUUtSSisyOHd4Z0VlWFJ0WkplT0ZZ?=
 =?utf-8?B?NkZHcUhEWksyaTZIbTBkOHNWRU9WTXFmWlF4OUp5WEJ6UjJ4citPZWhlV3ZB?=
 =?utf-8?B?VU1LNDdyWTYySjBTMlREQ0FNdUMvbC8xeCtTd0tPYUFCdXl4eG1zazJJMURL?=
 =?utf-8?B?akpHYlB6NzFkc09JTW4xeSttUEEyYnFITG9FSTI0YkFEYWpUVXdwWFlkeUxV?=
 =?utf-8?B?Ym03WGlUTTlCNXVJUmJ6UnVyWXp4YlFndXhUQ3hVV2M3ZDhiajNRYUVrOVhz?=
 =?utf-8?B?YVJlVWRUaU5BQnBGQkR4dC9VdDhCeUY0Z08xREhrZ3p5cG1OYStpZy9iTGlK?=
 =?utf-8?B?WktvQVlnZnpPWTJTekcrQVlWeHFjcjRGUWlBa1lWWUVTUnRtcm1ZaG5TN1Y4?=
 =?utf-8?B?RmZMczZod2FiRW9wdFh1RllyYjhjdzZCaW5ZRFBQMFlnd3VicWRLM1FnYnNs?=
 =?utf-8?B?THB2d1c1bHV3dG1ETUNuWTRiN0pDVFE3MHFuRjIzWXRpOU9MTkJXa3ZoT3Rm?=
 =?utf-8?B?S1Q4dUNWaUZkWGdRVThKa2xUZmtVS1lBWUdaUnBlMjVXOXVWT3NKZjkvU21U?=
 =?utf-8?B?czV2dks4bVd6NFJFY2VtTUs5NWo4SjBPYjdyTExOWVpZcExBN2RsMTRsaFEy?=
 =?utf-8?B?cE9HaTdBWnN5NWROaFJIOWRMR29ORXZFY1RHNnZHU3lnQ3hnUHhHcUxVd1FM?=
 =?utf-8?B?YXhzenpZN3FuWEVrWCtmQlRJbFhvSmhvd3NtbTNyd1dQNWJIVnlxd2hsc0Nw?=
 =?utf-8?B?OE1oZHY1SmxGZy9tbDBjRVJLM0JSMG82ME1SWDQxcmJva2VWQ1dHZzFDc1Zp?=
 =?utf-8?B?R1UxcG93d2libDB5ZHU5N2dMTldTbG1tZ2NXUDdTbEorZllYUXBOYkFqL2Ux?=
 =?utf-8?B?OFFZSmtFS1grZ1E5cG9HanQydmNEWHFoaDNQRThWNUdiQm9kODlReFBsTHZm?=
 =?utf-8?B?Mzg4VFM0Z3N0UUEwYTBPbG5Ia09DejZDVUJ5b3hqNzFYS3MwcjdObllMVmFP?=
 =?utf-8?B?SlNKQUtJYVZHOFBaWXVtb0Q5V1BYelZVTURTU3BRQXA1ZDBsOXliWmdRRyts?=
 =?utf-8?B?OEkxSzNyUjBRRzNkMU5VakVtdUNGbVFXdmtSVUdSeWphNlJVSVI4YytxNkN5?=
 =?utf-8?B?UEpyS2VZa2FhNnlsc044ZEplZ1pKenk1QWNVOGwwM3Q4U3dHN1lpZHMzdmNH?=
 =?utf-8?B?OWlzM20yVGZkVzkxRDkvZnlFakhGb2tIdXFxSlQ2cDJFR1I3RmtMa093QXFu?=
 =?utf-8?B?QlJ1Tm1QQ3Vkcmt6cVdlUVB2djVkeUV0VzBtOFhGTmd2eVRrdmJVYk55VWRq?=
 =?utf-8?B?U0tDTjFKTzBaaTVOY2Vqb2hxVE5XbC9zVm5aUXp5eXUrai9jdDNKVkl5TXho?=
 =?utf-8?B?d2owdGplQzNIVXhCRnBpQ3FuaGwzSXFpeDZwMEttZXY3Wisrd3ZhdFNObldy?=
 =?utf-8?B?M2FiMkttSmFSZTBkY1dLU2gwdEtYTmFOZ0sxWVE4Z01hOGp5ZGJUM3pNSThH?=
 =?utf-8?B?MjJPZFFSc0ROY2pGSk16SDhtMUhNZXJ3cFV5ekFiY09tT3RXbFNldVRQcHU5?=
 =?utf-8?B?b2t0RGw4Uk93TjBuNUE3T04wWUwwWXhkR3NLc21NL2Rnckg2SmcrSVdvcXJs?=
 =?utf-8?B?Qlg1SDIyWndFa3NGWmI3Y2kxK3lJMTVvTHRDbU1FWmQzakxodmVnWEpRMHdn?=
 =?utf-8?B?SFRBQzJRS3BOTFU2ckpQRE4wU0VnaTVtSy9UK01rVG45UFdtN3U2blVTOHdG?=
 =?utf-8?B?NUcwS1ZydCs5N0txai9hS2VEajZZUmI5VHVnWWxRZkJTek02aE1sSnJ6cnNL?=
 =?utf-8?B?NlpkNEQ4Slk5NUgxU2M4M0h6TjR0SXBRdnhtamZobjRGNHJMc2g4cFo3NXFW?=
 =?utf-8?B?dlc4UkhQZ2JZaTVMOTFGS3U3MmNyZTRQbjMzZ1JwMzZZWTM2Zjk1UHNoTWdq?=
 =?utf-8?B?bWVlUWpIQWhFREU3ZU8rd2ZDaGlqcjExMlFvZHdEYlEycDFZTVcvVVp0STd2?=
 =?utf-8?B?VXNXR2hwZ0ltZS9QMXFLemxIK0dVL0tVZC9aS1c1SlJuOG1yNjhuRGRXSUhr?=
 =?utf-8?B?WXRPK2FUdHhmNFQzcDZucG1IUXB0WDBZMkF1UmNuQXg2bTh0TTdnaHhkOFhB?=
 =?utf-8?B?bCsrVUxKMzZtNzc5U1VzSkdWN3dtQ2VNRmFKL3pUS0poK1Y2MUVjV0JhWG9u?=
 =?utf-8?Q?yG/RiQMnrSuUG1xk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab19f6d-dd64-47a2-cc4f-08da22bbd629
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 10:52:17.2701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9oqwLLpNYUBBQgxdLNQaPhXSxffl8hd64L+kzFPpEilNzUmR031u19RmagNx0fRc+8z9EH0rY9A41VGiDZ5kaidxM5VHd8giiMMXBcOYqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3641
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjggMS81XSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLHZzcDE6DQo+
IERvY3VtZW50IFJaL0cyTCBWU1BEIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
VHVlLCBBcHIgMTksIDIwMjIgYXQgODoxOCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IERvY3VtZW50IFZTUEQgZm91bmQgaW4gUlovRzJMIFNv
Qy4gVlNQRCBibG9jayBpcyBzaW1pbGFyIHRvIFZTUDItRA0KPiA+IGZvdW5kIG9uIFItQ2FyIFNv
QydzLCBidXQgaXQgZG9lcyBub3QgaGF2ZSBhIHZlcnNpb24gcmVnaXN0ZXIgYW5kIGl0DQo+ID4g
aGFzIDMgY2xvY2tzIGNvbXBhcmVkIHRvIDEgY2xvY2sgb24gdnNwMSBhbmQgdnNwMi4NCj4gPg0K
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyBjb21wYXRpYmxlICdyZW5lc2FzLHI5YTA3
ZzA0NC12c3AyJyB0bw0KPiA+IGhhbmRsZSB0aGVzZSBkaWZmZXJlbmNlcy4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJl
bmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0
b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiB2
Ny0+djg6DQo+IA0KPiBUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQo+IA0KPiA+ICAqIEFkZGVkIENs
b2NrLW5hbWVzIHRvIGZhbHNlIGZvciBOb24gUlovRzJMIFNvQydzDQo+ID4gICogUmVwbGFjZWQg
Y29tcGF0YmxlICdyZW5lc2FzLHJ6ZzJsLXZzcDInLT4ncmVuZXNhcyxyOWEwN2cwNDQtdnNwMicN
Cj4gDQo+IERvbid0IHlvdSB3YW50IHRvIGtlZXAgInJlbmVzYXMscnpnMmwtdnNwMiIgYXMgYSBm
YWxsYmFjay4uLg0KDQpBcyB3ZSBoYXZlIC5zb2MgZmllbGQgaW4gaW5mbyBzdHJ1Y3R1cmUuIEkg
YW0gUGxhbm5pbmcgdG8gYWRkIHNlcGFyYXRlIFNXIFNvQyB2ZXJzaW9uIGZvciBSWi9WMkwsIGFz
IDB4ODEuDQoNCk1vZGVsIHZlcnNpb24gZm9yIFJaL0cyTCBhbGlrZSBTb0MncyB3aWxsIGJlIHNh
bWUsIGJ1dCBTb0MgdmVyc2lvbiB3aWxsIGJlIGRpZmZlcmVudCBmb3IgUlovRzJMLCBSWi9WMkwg
YW5kIFJaL0cyVUwuDQoNCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL3JlbmVzYXMsdnNwMS55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3JlbmVzYXMsdnNwMS55YW1sDQo+ID4gQEAgLTE3LDYg
KzE3LDcgQEAgZGVzY3JpcHRpb246DQo+ID4gIHByb3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJs
ZToNCj4gPiAgICAgIGVudW06DQo+ID4gKyAgICAgIC0gcmVuZXNhcyxyOWEwN2cwNDQtdnNwMiAj
IFJaL0cyTA0KPiA+ICAgICAgICAtIHJlbmVzYXMsdnNwMSAjIFItQ2FyIEdlbjIgYW5kIFJaL0cx
DQo+ID4gICAgICAgIC0gcmVuZXNhcyx2c3AyICMgUi1DYXIgR2VuMyBhbmQgUlovRzINCj4gPg0K
PiANCj4gPiBAQCAtNTAsMTcgKzUxLDQzIEBAIHJlcXVpcmVkOg0KPiA+DQo+ID4gIGFkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gLWlmOg0KPiA+IC0gIHByb3BlcnRpZXM6DQo+
ID4gLSAgICBjb21wYXRpYmxlOg0KPiA+IC0gICAgICBpdGVtczoNCj4gPiAtICAgICAgICAtIGNv
bnN0OiByZW5lc2FzLHZzcDENCj4gPiAtdGhlbjoNCj4gPiAtICBwcm9wZXJ0aWVzOg0KPiA+IC0g
ICAgcmVuZXNhcyxmY3A6IGZhbHNlDQo+ID4gLWVsc2U6DQo+ID4gLSAgcmVxdWlyZWQ6DQo+ID4g
LSAgICAtIHJlbmVzYXMsZmNwDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAg
IHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPiArICAgICAgICAgIGNv
bnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDogcmVuZXNhcyx2c3AxDQo+ID4gKyAgICB0
aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIHJlbmVzYXMsZmNwOiBm
YWxzZQ0KPiA+ICsgICAgZWxzZToNCj4gPiArICAgICAgcmVxdWlyZWQ6DQo+ID4gKyAgICAgICAg
LSByZW5lc2FzLGZjcA0KPiA+ICsNCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVz
Og0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4g
PiArICAgICAgICAgICAgY29uc3Q6IHJlbmVzYXMscjlhMDdnMDQ0LXZzcDINCj4gDQo+IC4uLiBz
byB5b3UgY2FuIGNoZWNrIGZvciAgInJlbmVzYXMscnpnMmwtdnNwMiIgaGVyZSAoYW5kIGluIHRo
ZSBkcml2ZXIpLA0KPiBhbmQgZG9uJ3QgaGF2ZSB0byB1cGRhdGUgdGhpcyBjaGVjayAoYW5kIHRo
ZSBkcml2ZXIpIHdoZW4gYWRkaW5nIHN1cHBvcnQNCj4gZm9yIFJaL1YyTCBsYXRlcj8NCg0KQXMg
d2UgaW50cm9kdWNlZCAuc29jIGZpZWxkIGluIGRldmljZV9pbmZvIGFuZCBwbGFuIHRvIGFkZCBz
ZXBhcmF0ZSBTL1cgU29DIHZlcnNpb24gZm9yIFYyTCwNCmZhbGxiYWNrIGlzIG5vdCByZWxldmFu
dCBhbnltb3JlLg0KDQpLaWVyYW4vR2VlcnQvTGF1cmVudCwgUGxlYXNlIGNvcnJlY3QgbWUsIGlm
IG15IHVuZGVyc3RhbmRpbmcgaXMgd3Jvbmc/DQoNCg0KUmVnYXJkcywNCkJpanUNCg0K
