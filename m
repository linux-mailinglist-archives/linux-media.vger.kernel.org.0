Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0774D42EC
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 09:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiCJI7A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 03:59:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbiCJI67 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 03:58:59 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A3138BC6;
        Thu, 10 Mar 2022 00:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCu6BCYMBrmNOsQ3xI+1KYq2AORyBarGcmLJ1aB6JCIz+QzYxihccjXE2YUCDpoFMjusWSCDEbQjH8mWToKKkyQuI0FAGFATZsfx3Z9ezfDJY/pzBgEccuXZ9Pr3NWMmeSQOKSqncZzKx5gKU6zpfKe/a2rAcJstUkf0PPd7dRmobKovfOe5wcOtzUrg5FmBjWLIBNAUDSHoTGIoTEBhvvykApFCaic5fZa5sw110u8m6cslM64BnwRSlMuQQtNCvKCYMV9te+HYmTtsgbkjrTmuCnXU12TLi3DM6h6bRLL11f2wpQ7dK9ilTUwBu4bIDtQc+TbKnPwqGyorHctUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04wu+bA51XCgLs2RLNe2KYpPRAro4fDLoDsuDoYB6wU=;
 b=gFN11GSFxkqEctXmXZIGhf7msiXdykBaNSvUqQrtP75izxhjJW19/eETqAKUzgddp6kcVTtCNo9vE/HsX8WFj0dWEcAF5qizU5bCQSlWy2/vJMyTbLsx4HKkAJsOG8nKHfJGBK0yvdO3kZRIdB6FWOPRa9kazEe0pBE/5ZGdmWFPl5W09qDJ0lY+/tI8m7xeo22JZldH2pa7L+Ns+K4H67SXi6c3T60pfC+PpPUdPgLvFvtPDtVKxqBanhG8gPNTcy2wJWv6fQhTvMzo6STdO83Sco67RFRBo0k2RAT/bIC2apbqdIh6dxrlzzuaGMJ6+tw1tHfZnaoHRN8y4qABcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04wu+bA51XCgLs2RLNe2KYpPRAro4fDLoDsuDoYB6wU=;
 b=O/3VrExZzct2LmyDGPTyJgKf2qOBHZDeltX+DeH5A8pdVyK14VO6XfBYw8mKWoXsprTbV4oPLtdgS57PFYybIGSF65opTT7RgEfTs6O5f6JnMnvKbxwdHah7S7paTXYcRfi5si8N0BRjsQ2+DzDSREBZiSL/drNLIaXhR4s7FBU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8646.jpnprd01.prod.outlook.com (2603:1096:604:18f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 08:57:54 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 08:57:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Topic: [PATCH 1/3] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Index: AQHYM+48S+vm01hG8kWByV7KaxWfOay4SNIAgAAIulA=
Date:   Thu, 10 Mar 2022 08:57:54 +0000
Message-ID: <OS0PR01MB592283C63C713C71E37270DA860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
 <20220309194521.7028-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdXC_qAuiCQadL+h=C7oL-wV8OiwKpV4Zu2hH_2Mh=vwMA@mail.gmail.com>
In-Reply-To: <CAMuHMdXC_qAuiCQadL+h=C7oL-wV8OiwKpV4Zu2hH_2Mh=vwMA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c214971a-c1b7-4f66-51fd-08da02741073
x-ms-traffictypediagnostic: OSZPR01MB8646:EE_
x-microsoft-antispam-prvs: <OSZPR01MB864687B4B362FE35D9D990CF860B9@OSZPR01MB8646.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /I8MZzi+d3SEmy8bEuocn9dvNDZ1MuGGEEyzuQiHTw+F6fAu4D9bJ2JdV69qFQqf7TqDijzPJFLlAq2xtWfsQcimOj+8o6W0sFGNrZ3UXEc1gUHqYPJFPsdiSGdH0qgO2OOWOS7LaP/sfI7GbXPcqF7vWBkKAkdnp18NGUH27JuUXg4MOxZ+2yQVaJcgd0ybpyQCrjdJOWfVtNtqEDCWuBjM+nOUBCB9fixEmVPrb15Nv0F+X9juPaojNJhLFOGcm1VcnF/Mluq2YX+zLo6yZSQnLe/DBAzZjj8tH4RhLHAIokj0DFirVkG4P51RNiFINFD1FI0iqhTIWhFUH2pyQXHeu0L5LCYyuh0f9RrR2jiUmFPNeZZx5kLydN4rLY2ObQHZFeSX1Csv/UAlpPBn7pB9/N2SqPiaM84Hf17L8wkuyNxr2NjLUkRfzAxDL1t8Ee8dqa7UfzX/+NRnyKHapXrisTu7AI9oAsHOd0DZEb58zDWNadVE5dk+So6m0Lr0RQMHNyMPeDYs8f/Vbca+fRrZ6ugXUTikaWn/7Ts5PzFYAz9D/G9IUEiLfprBkaur7Gj6DKM9144aWiLScKqbpvArxvzxrMAzCio8oIY2jN86tdqO21+Wrciv7LK/sjHnIckd+frj7kuSu/KR/vp2DuJzVmXATh6jttJ2NhVjNDUgmLhVcPvOkq0LhUYdNqA0jCFp4dQ/12LHXxPXwJzjVA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(64756008)(316002)(4326008)(83380400001)(76116006)(66946007)(55016003)(508600001)(66556008)(66476007)(66446008)(38100700002)(8936002)(122000001)(5660300002)(52536014)(38070700005)(86362001)(2906002)(33656002)(53546011)(54906003)(6506007)(107886003)(6916009)(7696005)(9686003)(186003)(26005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHkxd1dOVWYxU3BlOHZaaE0zUWhmUXlkUlhwWmFRZ2luKzNzVWFoRmdmY3hX?=
 =?utf-8?B?ckhLRmVCSFo3a2o2RUgveUhaNS9OS3FWRCt0MU5URS9LdGZTMDllRDFSQ3Ry?=
 =?utf-8?B?eGNQUDlDdFc2bUlBTWZaWlltTWJuZlFUZ25VWXdXV2N6amdwRU1HZ2pIdE1X?=
 =?utf-8?B?dWtYdHliWVkzVk5BYW93bXRUOUFzZzJDNDl4dmJaRmREMThLN0J5Ulk0aE16?=
 =?utf-8?B?d3JLR3h1VzNIU1BJZWp5T2V2UGVZc3JnSHpzajZ6V01MRDJGZ0l5UUlBWE10?=
 =?utf-8?B?UURYdFhQOGM5cUxiUkZ2MVZ3ZEFYZFNnNXFIandseVMzRURZM2UwbWdPVWw1?=
 =?utf-8?B?TDNya3BOYXNaSHJySGhjZFF1ZUpxQ0Zmem1ROWpmZVRpcStEWnF5N2g3bklm?=
 =?utf-8?B?eUs3OSs4em1yV09Zc0h5QkpGaFlzVWVkbVRaQ2h0K01Kb1VRaVVidkVNWVFL?=
 =?utf-8?B?aGwyRmJieXdtTUJhcnFzdkdmYVovSlVPdlZTa0dSWEozdGZwNk9MdkU2VzJE?=
 =?utf-8?B?S29MRFl4a1d3TjVSN1YxNEVBZ1FMOEM2cVhXWUlLRGFRNHNkaVROZUNvbDFl?=
 =?utf-8?B?SHNodlBacFBDY3haYUFFOFp1U3E0dGV2b0EzdTZVRm1GbUg0NzBlNDc1c3dw?=
 =?utf-8?B?MDRHb09rQXUrQ0pvK1hIck5XdHhGM2lsT2hrY1dvZUl3QktSQW1oWjRWbU5k?=
 =?utf-8?B?YWY0OWdFeTRkcWNoQWxCbURrbXZVZ0tXY1YzK0phaUdRZXlUMFZna1lGSEc2?=
 =?utf-8?B?UUhkUzJVLy8walphQVlhN2ZIOGdEbng4WldmeHJ5blFSbXNXSFNJbllIekhN?=
 =?utf-8?B?YTh2VHlnL2NsbGh0L0NRSUhSU0E2ckwxY29jT1FWcEhoRk4xMC9QMklXNlVx?=
 =?utf-8?B?dWw0M2kxazRkRUFFMXk4MlpkTUlHQlNJMTc0em1ieUorM1FURmhkN21JUlN6?=
 =?utf-8?B?aXpIQkJTUFRwVWczenhUNWtadVdPRjdFS2x4WG9VV0wwTjd2VUlCbGQrK3Zy?=
 =?utf-8?B?S0F4anRFRDRqQ3J1Y2ZkcDZxUU5ZQS96Q3c3SWgvekRyL0ZPbDczUmIzMzlz?=
 =?utf-8?B?b0tsQkcwK2NndW9uTHoyM2Jmc2RidVJnNFYvR21CWHYrdWNBREsydndrVlpu?=
 =?utf-8?B?NFBjTVJkM0crRzY5YmloZ0c3VGVRTzNuMkErOGtZdjFtVXp2ellEQ2orRGpm?=
 =?utf-8?B?dUJKdUxBajNJamR0dUNzSjNMUXpPb0tZR1lkRFBhb3VFOU9nV2JvZFZMczYv?=
 =?utf-8?B?V1FXaHJQT1pnMUxLNTI1elF2bTdwbnZxMkVHWFhXNnE3NkttZ09TSDg4SFR6?=
 =?utf-8?B?ZE1YV0NrWGo2ZmZkTm80K0djMGxQT2xGNms2QXljYVprUzcyYS9kSDREeW93?=
 =?utf-8?B?Vksyc1c3ZVpXOUFZZ0V5cFNWbFlHVDJ1Y1lQTHQ0VnpTck5QN2VzYnZsUUNI?=
 =?utf-8?B?UmFoL0dyOVZSK1lLNlFiaHJ1eGZENFEvaWszVFk2VEJMelMvLzA3L2VKOUs5?=
 =?utf-8?B?TUlyTHhOaG55WlI3eUd6cXZyS0p0b3FwZEcra1pmTEpiMVpkY0lCTDlNaWVm?=
 =?utf-8?B?aWxLZW9tb3ZrVXZKZU8yanRCOUpxYnN4a0djSDhlZk13T0FmdGM1STZmTHVX?=
 =?utf-8?B?SVhIOFZKRDQ3MGM4N0x6UFJWdlpqRUZOMjJMRnJBQlJDT1h1bVk0TUVEYzJR?=
 =?utf-8?B?aUVhQXVkWUdUZ1FOYTVaaTR1eG9uOStHSFVuL0d4TTd3NnNrY0F3UkNiSXVa?=
 =?utf-8?B?eXVVVTV0K3FXbUdFQUlRNE90YkZtNm9jR3pzMHk0b3EvVWllajNYSnNrZU5w?=
 =?utf-8?B?TlI1Y08yWXFUQXJ4aXA0eTI2RnozcDAxdy9mTDZYVEVBRmwwYTVuWU42WHA5?=
 =?utf-8?B?U2hDVnpYUHNWSVNZeExLMjQyNzd3MzM1eGZoTkpWK1ozdTVQVHNVMXllYXpK?=
 =?utf-8?B?czhaK1hyRUE1c1p4LzJ0aHFKL1dvMVNLYVpRb1lQQzBvRHVNUW1DQXVUVzln?=
 =?utf-8?B?eUdHYUV0RzVRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c214971a-c1b7-4f66-51fd-08da02741073
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 08:57:54.1176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hU2ofamRuKgYhJt7Hjv666kTFxujDQYs2BYY3NfHjza6psEMYq/5B1HHBpms/8DUUz/D1Jm4fm7zYOa33ElnsW1O+L5Uc7mbm2hjZcd92Ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8646
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
UEFUQ0ggMS8zXSBtZWRpYTogZHQtYmluZGluZ3M6IG1lZGlhOiByZW5lc2FzLHZzcDE6IERvY3Vt
ZW50DQo+IFJaL3tHMkwsVjJMfSBWU1BEIGJpbmRpbmdzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gV2VkLCBNYXIgOSwgMjAyMiBhdCA4OjQ1IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gRG9jdW1lbnQgVlNQRCBmb3VuZCBpbiBSWi9HMkwg
YW5kIFJaL1YyTCBmYW1pbHkgU29DJ3MuIFZTUEQgYmxvY2sgaXMNCj4gPiBzaW1pbGFyIHRvIFZT
UDItRCBmb3VuZCBvbiBSLUNhciBTb0MncywgYnV0IGl0IGRvZXMgbm90IGhhdmUgYSB2ZXJzaW9u
DQo+ID4gcmVnaXN0ZXIgYW5kIGl0IGhhcyAzIGNsb2NrcyBjb21wYXJlZCB0byAxIGNsb2NrIG9u
IHZzcDEgYW5kIHZzcDIuDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGludHJvZHVjZXMgYSBuZXcgY29t
cGF0aWJsZSAncmVuZXNhcyx2c3AyLXJ6ZzJsJyB0byBoYW5kbGUNCj4gPiB0aGVzZSBkaWZmZXJl
bmNlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
cmVuZXNhcyx2c3AxLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvcmVuZXNhcyx2c3AxLnlhbWwNCj4gPiBAQCAtMTksNiArMTksNyBAQCBwcm9w
ZXJ0aWVzOg0KPiA+ICAgICAgZW51bToNCj4gPiAgICAgICAgLSByZW5lc2FzLHZzcDEgIyBSLUNh
ciBHZW4yIGFuZCBSWi9HMQ0KPiA+ICAgICAgICAtIHJlbmVzYXMsdnNwMiAjIFItQ2FyIEdlbjMg
YW5kIFJaL0cyDQo+ID4gKyAgICAgIC0gcmVuZXNhcyx2c3AyLXJ6ZzJsICMgUlovRzJMIGFuZCBS
Wi9WMkwNCj4gDQo+IFBsZWFzZSBmb2xsb3cgdGhlIHJlY29tbWVuZGVkIG9yZGVyIDx2ZW5kb3I+
LFs8ZmFtaWx5Pnw8c29jPi1dPGZ1bmN0aW9uPiwNCj4gaS5lLiAicmVuZXNhcyxyemcybC12c3Ay
Ii4NCg0KQWdyZWVkLiBXaWxsIHNlbmQgdjIgd2l0aCB0aGlzIGNoYW5nZXMuDQoNCkNoZWVycywN
CkJpanUNCg==
