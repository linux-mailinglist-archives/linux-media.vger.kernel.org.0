Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4983C511B27
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbiD0N05 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbiD0N0x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:26:53 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C45F2E6AC;
        Wed, 27 Apr 2022 06:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMn/Gz2xq0Pe2+DDeVh8/ghDF0eDXEp2vfNGYxWcOPnIOE40uiZwToUcqjmqAt2nf7X6DQjZVJUHI9GocztO8v7QEuLL/1HpRwcZYkfrYFe8F2y1W+bDV8A4a78TxKaGQEdawl5uhh6asp/6qOou9LM+YPNBJJpEEVAi1xzJoeTWLJJPH1hV1YdrJkgXZBFTyMHVxqbvZ8hdWLpD1mLmc8BN3djfS+QRF8cdoQK3PxBq97M1zyqw/s+HLFv9mQ7g0AkVpasa/oV3gHIPwYRS16mRNdNkKoUlIhPKBDzXEezGFpcmxSHgT/GQmVWB642wbPGlCnFqRp+WxiApMRI6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INubfSg4i2yVYRGee2RARORoUpbHv/vKmmZgZf7YeAU=;
 b=UM85ZZ2kCA1lsjn+d6ppuzl+a/ikUIkkHw/rR4o9LK2L/s2xC8k+WqdQd9IclFJVnhW+XKXOzeSb30SF7FqYGwWPryiDhBXh5idsm+PpXC+txuZfzyQym4l4odqvU11bNCQd0nIaCF40CLnZqAyOQlisduQ5aViN4FJybsLyM/loBV0vbR8JfYTsxamVC9kS23lzm2g8ODgzuJGvRr5Y2mRq6NMEtX6kYh+MGv9I8muBFkVIYGE0tOBhTVNd/C5oJFMWVed5kq4KgnCgAVRzrZvvCA9L55yMz2i1RHNzGbLYTMF6pki/ajRz6BMZXpzozUw4Tiioc6KcFadKUfRbnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INubfSg4i2yVYRGee2RARORoUpbHv/vKmmZgZf7YeAU=;
 b=vLHIhUA0iiunRC9WdLh8SeGebzrKlYgYzdl6OUkNFlt4uE1L4e/c1KLAlFGJRnc6V8dcQfO1DBimaymSGHYwZ0lvjiUtu6FFJDIcCU72QB5QDUkhjPu4kckiIP5x/V3oR7WedNhXcEhSs6ofSMIKCRrZsy/OUUmkr4tk2ugglEM=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSAPR01MB7206.jpnprd01.prod.outlook.com (2603:1096:604:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 13:23:39 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4%9]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:23:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v8 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
Thread-Topic: [PATCH v8 4/5] media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA
 feature bit
Thread-Index: AQHYVBnaEeMs5tKNWUiHNbE7OElbZ60DwLIAgAAIYaA=
Date:   Wed, 27 Apr 2022 13:23:39 +0000
Message-ID: <TYCPR01MB59339416B797BB6F6A998E0986FA9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com>
 <20220419181757.63346-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVv6e+ydQGeEdtsy1g9u1OLY+ZO_7EKw8SU4HapXcfa+w@mail.gmail.com>
In-Reply-To: <CAMuHMdVv6e+ydQGeEdtsy1g9u1OLY+ZO_7EKw8SU4HapXcfa+w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 113f26f7-cb78-4921-4510-08da2851248d
x-ms-traffictypediagnostic: OSAPR01MB7206:EE_
x-microsoft-antispam-prvs: <OSAPR01MB7206F2325BCB1D87FC62657C86FA9@OSAPR01MB7206.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g8mkq49taAZCljmr87Hi4LsKzyeZazpFDN4nmePefwReKJj7McIAYloGQMgY6h3BsC7XwBMnYiMpnnCyCVwWRwUqv9LEqnD3b7ravdh5/KBz9X7eirf/cFaqZ6kpmpP6V28G4zJ8gzrqx+Wwfie+v3yvbyt2IIuu6Euidgkq/vBEz3BMvGY1Q6NtRpO1NJf0vBSk60rHSbmjSVzYvPxzYTK4gLtk0UmkOsw7BuMYrsrFgKL157YTtgtpI3iCSzPGKTZZvWn5Brxsp84h0QuWT843W4GSsYwb5+hL8kmAs93cZLnlkop7VX5Yyk/tBNGqhmInjKOz6cGaPSuRL2MuWz5g6ak8+nh67NnSVhxLMOnH+LmR7/nS0Cgp0kPMyeoeWTJb+87+Le+40mMT6lY2JVEbfCBmKXPd5FfKYv5i+A4wjhF9EDpgGVZ0X2cKljzskfLQaxzWsiZ73O3ftNFiTuBdw6jrS7b6fIjJvk2wr1mFp5QN0vHWN3KTl7WnV4xSQggri/9+iLF+e9ibixurwetGwG0RFEwKc2g+u0OZxJUVz833tex8Wph/jz7b+yiGB+r9el6rLhjGo8pZmX1OtS8Wi2FqB3IFBu1ZcKanXFEy23sPJNEgvUaSd08EEXNSOPidgioX9HWgjZXlCez0Xj6DBvvwTOaiqmnSGCj6MLxi1G+a3mMlDODa/6bZjR3Mp4eUi0VHy0Emo+f8ztOh6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(6916009)(122000001)(508600001)(38100700002)(66946007)(4326008)(76116006)(8676002)(66446008)(66476007)(66556008)(71200400001)(55016003)(64756008)(8936002)(52536014)(86362001)(5660300002)(316002)(26005)(9686003)(107886003)(53546011)(186003)(6506007)(7696005)(33656002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXQrWE5JZm16d05PWVEvRmJ2SjkxcFk0UmtCaG45US9kN2UvQk9VWUNHU1l2?=
 =?utf-8?B?dW5tT1hYRW1CYTllZzZwSDdyUno3Y0xoMVRWUU9CY1FpRzhjNVBXbklLaGpZ?=
 =?utf-8?B?QzdBWnVSaHlPd09QdnFLYmJkUzJnaFd5VEl0U3lyNGY5WU1wWUN2NnV2dzV2?=
 =?utf-8?B?TWF3MDdLaVVmanFnK1hXRHpxci9aRG1QckxWSW9xaDhKOEdINWFoaU9lOUI0?=
 =?utf-8?B?aHVTNDl6U2ViNFJlOFpJYnJhcmdweWVtWGU2L25WUmhsRFhEZ2lYUmVyczZQ?=
 =?utf-8?B?SXo3aDE1T0E2NGIweHhnWnJnOVJ1VHg5OUFWaUpWSEY2RVRWdlh6cmg2YWN3?=
 =?utf-8?B?aVFFazZvUmd0M1V0eXpsbndYNEZiSmo5a3BHMWE3ZEgxeVVIZ2xYOHdlVjBx?=
 =?utf-8?B?d1pCZ0FRWXpOVE9KTldZS3VQMEpwTFR0NkdnNjgxTndOTlowUXBPZTRPZkFI?=
 =?utf-8?B?aHp6RDloWXNuUDBnN3VNd1U3dFY2NVRSR3hxWFArU3UvalVWeXgvUld5bHhN?=
 =?utf-8?B?VHVGeDdJTHZTRXBxZTg1SDBuVlZMZkVvZVVzT2JKS2VYU3hOUlhMSUthY0ti?=
 =?utf-8?B?MzA3dlhTckY3cTlmaWRVOFRFa0VtK2ZQckVWc0d0bDFKV0dEV3FCeStYTjJG?=
 =?utf-8?B?UlB0N0tZZzJHQnhXQzRvbVgxdFo3WVFBT1F2bUJSL2pqOTJURGdzM0V1TVJ3?=
 =?utf-8?B?dUFINXNJUld0eTRQRWJuQzZ3T2RXMVFmV0UyNXZna0krQnM1RlAzWXJSR3RZ?=
 =?utf-8?B?bTlWa0hRWm1ONDJOMUlybHJVSkV4KzVjZzBYbGlOelYxdGgvVVlsZnBzYWpo?=
 =?utf-8?B?RC9SSmsrQ002bGg4SXRaSC9sdFNtUUVhVXVhNmtkZTZMSWFwTFg4WVh4S2I2?=
 =?utf-8?B?dk5sSXJsdTF4NzhJdlNOeXFhY3AyaDBtT2FRVC9NblhxOHNueGh5WDNhVjJF?=
 =?utf-8?B?N3ZpMkFpM0dKT1B6OTJUMENoMzZGNE1GQzNNcXNKVDdmMUkwQXBlQWdRK21a?=
 =?utf-8?B?Q1cwaUllQzJGUklJeDVUR25wbW5QZFVqTDd0NGt0cVNsVU5FYndBbEpvM3BF?=
 =?utf-8?B?R2dqczNyemF5cWZSMHBQZGduRDVrY1JRbzg5bEtHUFdTMWFrd256bGN0QXUz?=
 =?utf-8?B?bllmNU9DTnFyYWNMbS9DRFlRL3FTKzhGalZEK2kwb3V1R3ZuS1lRQitKbXZv?=
 =?utf-8?B?OTBaRG9Ta1gwS1kxOEtYS3ErUm5vaTZNSVFPQlhsOTJWOHFxQlFYVUFYMUlQ?=
 =?utf-8?B?QXhjblRRVnJlSjQyamZZaWtmZ1FiNWdGVGpKYTcxZ0R6MWtERXpwZEpHSmNw?=
 =?utf-8?B?Ti9SSjhUbnBVbW11clZtY0ZjY1VTcUV2YnV6MnVUcFMrSHZaYXhXRHNpV0J1?=
 =?utf-8?B?NTNDUlR2OXc1blBTQWpQN0pOM3A2Zy9ITWY2L2pscVA2Vjl3SDJ0Z0JPVVpx?=
 =?utf-8?B?aVEvV1hXNzVsN1ZtM2xXSUZuWE5zdm5wRHlwa1lIQXlsaXJZNmxUWmt1NzVH?=
 =?utf-8?B?eGxGT0w0dHBKb0VGUEVEWGxDampZclEybWFXMUZBekJaY3hFVUJGcHl3NGRF?=
 =?utf-8?B?VUY5L0hucWZSRDI2SlZGM0tYdUZvOHVtWlNvdXdpUk16MmlYSjZ0eWs3K01x?=
 =?utf-8?B?VHFUa05VMUJoeFFraittNHVva2tGK3U5R3dLUG9tOVBJekZ0bVh5TXN4V2dj?=
 =?utf-8?B?QjBTbXo3OUkrVlBFMTF3MzM3ak95UDhHeTMzSFhKK1ZHSnJZTWlBdE4wQkNV?=
 =?utf-8?B?N08zaTZVUTRjNUtSK1hJQzRJS3ZVNjhqTUZObGtEb2NxOVlqbGdxTVIxNjlt?=
 =?utf-8?B?cWdtdm83WTBjVXlyRWczNjVCZnE1Z3owVjlvNXVReTRuTG83T3lDMzg5ODRR?=
 =?utf-8?B?ZDY1SDkvbXlMUTY0anBEYkNMaGluaUs3VlNZRldlZTFzRFc0elAveTRyWlNR?=
 =?utf-8?B?Q2lkYi93MkJnb1p2WHhWcEQ1SXVXRW95NTE4V0N6TThnSlA2SFNtNG1TUG9C?=
 =?utf-8?B?WVpNMEhHak9TcjdtRk1Sc3UzNVA5ZC96NjNHRkdPSDVucTdLNTRpVDJWcitQ?=
 =?utf-8?B?bzhBMGs4YXlJSHkvQnZpS2YvZktnR2FYRzRCVjdJcVlOYmFVZEtvdjFSeHE1?=
 =?utf-8?B?LzZxR2JmY09zMmlnRml2SWUxVERDMldMMUNqclpQWVhrTlpPRlRlUEtCbzU1?=
 =?utf-8?B?TUoxcERGOFlqUXlKN29tT21vQ05hZzNYelNyK01Xa2VaQ2RyZi9kbXl1dm42?=
 =?utf-8?B?Q2RFRzlwUWRLcG9jckJ5MS9mMVFLalhOeXNGNXBuVWVsUGVubTlYY0o2bnpl?=
 =?utf-8?B?ZFljd3c4REZ1TkNrbjR2dWNJbXBFK3crZXJZOXRsY3hMWWNhOEowa21KN1pO?=
 =?utf-8?Q?s4c9oKKp64pqkl1Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113f26f7-cb78-4921-4510-08da2851248d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:23:39.6577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ooEYm29+sg3IRPk3ezCEuvNiErthzv5heHDlSbKt4VWuaL8rOamYhRIQDvig4xjTEzW+hbR6RYIrxuw2zc9aMr7F+49TumSi7SraFsWDDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7206
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjggNC81XSBtZWRpYTogcmVuZXNhczogdnNwMTogQWRkDQo+IFZTUDFfSEFTX05PTl9a
RVJPX0xCQSBmZWF0dXJlIGJpdA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgQXByIDE5
LCAyMDIyIGF0IDg6MTggUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiB3cm90ZToNCj4gPiBBcyBwZXIgSFcgbWFudWFsIFYzTSBhbmQgUlovRzJMIFNvQydzIGhhcyBu
b24gemVybyBMSUYgYnVmZmVyDQo+ID4gYXR0cmlidXRlcy4gU28gaW50cm9kdWNlIGEgZmVhdHVy
ZSBiaXQgZm9yIGhhbmRsaW5nIHRoZSBzYW1lLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhbHNvIGFk
ZCBzZXBhcmF0ZSBkZXZpY2UgaW5mbyBzdHJ1Y3R1cmUgZm9yIFYzTSBhbmQgVjNIDQo+ID4gU29D
LCBhcyBib3RoIHRoZXNlIFNvQydzIHNoYXJlIHRoZSBzYW1lIG1vZGVsIElELCBidXQgVjNIIGRv
ZXMgbm90DQo+ID4gaGF2ZSBWU1AxX0hBU19OT05fWkVST19MQkEgZmVhdHVyZSBiaXQuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+ID4gLS0tDQo+ID4gdjg6DQo+ID4gICogTmV3IHBhdGNoDQo+IA0KPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92
c3AxL3ZzcDFfZHJ2LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMv
dnNwMS92c3AxX2Rydi5jDQo+ID4gQEAgLTc4Miw2ICs3ODIsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHZzcDFfZGV2aWNlX2luZm8NCj4gdnNwMV9kZXZpY2VfaW5mb3NbXSA9IHsNCj4gPiAgICAg
ICAgIH0sIHsNCj4gPiAgICAgICAgICAgICAgICAgLnZlcnNpb24gPSBWSTZfSVBfVkVSU0lPTl9N
T0RFTF9WU1BEX1YzLA0KPiA+ICAgICAgICAgICAgICAgICAubW9kZWwgPSAiVlNQMi1EIiwNCj4g
PiArICAgICAgICAgICAgICAgLnNvYyA9IFZJNl9JUF9WRVJTSU9OX1NPQ19WM0gsDQo+ID4gICAg
ICAgICAgICAgICAgIC5nZW4gPSAzLA0KPiA+ICAgICAgICAgICAgICAgICAuZmVhdHVyZXMgPSBW
U1AxX0hBU19CUlMgfCBWU1AxX0hBU19CUlUsDQo+ID4gICAgICAgICAgICAgICAgIC5saWZfY291
bnQgPSAxLA0KPiA+IEBAIC03ODksNiArNzkwLDE3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdnNw
MV9kZXZpY2VfaW5mbw0KPiB2c3AxX2RldmljZV9pbmZvc1tdID0gew0KPiA+ICAgICAgICAgICAg
ICAgICAudWlmX2NvdW50ID0gMSwNCj4gPiAgICAgICAgICAgICAgICAgLndwZl9jb3VudCA9IDEs
DQo+ID4gICAgICAgICAgICAgICAgIC5udW1fYnJ1X2lucHV0cyA9IDUsDQo+ID4gKyAgICAgICB9
LCB7DQo+ID4gKyAgICAgICAgICAgICAgIC52ZXJzaW9uID0gVkk2X0lQX1ZFUlNJT05fTU9ERUxf
VlNQRF9WMywNCj4gPiArICAgICAgICAgICAgICAgLm1vZGVsID0gIlZTUDItRCIsDQo+ID4gKyAg
ICAgICAgICAgICAgIC5zb2MgPSBWSTZfSVBfVkVSU0lPTl9TT0NfVjNNLA0KPiA+ICsgICAgICAg
ICAgICAgICAuZ2VuID0gMywNCj4gPiArICAgICAgICAgICAgICAgLmZlYXR1cmVzID0gVlNQMV9I
QVNfQlJTIHwgVlNQMV9IQVNfQlJVIHwNCj4gVlNQMV9IQVNfTk9OX1pFUk9fTEJBLA0KPiA+ICsg
ICAgICAgICAgICAgICAubGlmX2NvdW50ID0gMSwNCj4gPiArICAgICAgICAgICAgICAgLnJwZl9j
b3VudCA9IDUsDQo+ID4gKyAgICAgICAgICAgICAgIC51aWZfY291bnQgPSAxLA0KPiA+ICsgICAg
ICAgICAgICAgICAud3BmX2NvdW50ID0gMSwNCj4gPiArICAgICAgICAgICAgICAgLm51bV9icnVf
aW5wdXRzID0gNSwNCj4gPiAgICAgICAgIH0sIHsNCj4gPiAgICAgICAgICAgICAgICAgLnZlcnNp
b24gPSBWSTZfSVBfVkVSU0lPTl9NT0RFTF9WU1BETF9HRU4zLA0KPiA+ICAgICAgICAgICAgICAg
ICAubW9kZWwgPSAiVlNQMi1ETCIsDQo+ID4gQEAgLTgzMiw4ICs4NDQsMTIgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCB2c3AxX2RldmljZV9pbmZvDQo+ICp2c3AxX2xvb2t1cF9pbmZvKHN0cnVjdCB2
c3AxX2RldmljZSAqdnNwMSkNCj4gPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpF
KHZzcDFfZGV2aWNlX2luZm9zKTsgKytpKSB7DQo+ID4gICAgICAgICAgICAgICAgIGluZm8gPSAm
dnNwMV9kZXZpY2VfaW5mb3NbaV07DQo+ID4NCj4gPiAtICAgICAgICAgICAgICAgaWYgKCh2c3Ax
LT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fTU9ERUxfTUFTSykgPT0gaW5mby0NCj4gPnZlcnNp
b24pDQo+ID4gKyAgICAgICAgICAgICAgIGlmICgodnNwMS0+dmVyc2lvbiAmIFZJNl9JUF9WRVJT
SU9OX01PREVMX01BU0spID09IGluZm8tDQo+ID52ZXJzaW9uKSB7DQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKGluZm8tPnZlcnNpb24gPT0NCj4gVkk2X0lQX1ZFUlNJT05fTU9ERUxf
VlNQRF9WMyAmJg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAoKHZzcDEtPnZlcnNp
b24gJiBWSTZfSVBfVkVSU0lPTl9TT0NfTUFTSykNCj4gPiArICE9IGluZm8tPnNvYykpDQo+IA0K
PiBUaGlzIGNoZWNrIGxvb2tzIGZyYWdpbGUgdG8gbWUuDQo+IFdoYXQgYWJvdXQNCj4gDQo+ICAg
ICBpZiAoaW5mby0+c29jICYmICh2c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fU09DX01B
U0spICE9IGluZm8tDQo+ID5zb2MpKQ0KPiANCj4gPw0KDQpGaW5lIGJ5IG1lICwgYXMgdGhlIHVu
aXF1ZSB2YWx1ZSBpcyAnTW9kZWwgKyBTb0MnIGFuZCB3ZSBhbHJlYWR5IG1hdGNoZWQgJ01vZGVs
LA0KYWJvdmUuIFNvIGZhciwgU29DcyB3aXRoIExCQSBIVyBmZWF0dXJlIGhhcyBub256ZXJvICdT
b0MnIHZhbHVlLg0KDQpUaGVyZWZvcmUsIHRoZSBnZW5lcmljICdTb0MnIGNoZWNrIGlzIGZpbmUg
aGVyZS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29udGludWU7DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+
ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgIH0NCj4gDQo=
