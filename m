Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3A3511A1D
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 16:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235958AbiD0Na2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 09:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236078AbiD0NaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 09:30:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13003D4A6;
        Wed, 27 Apr 2022 06:26:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ4Z0mZymIBSPv8Zj/TgS0m/Ol3PB+/PLBe39kLseN4t3YD+jLO9+Qcx/s8Il1G04mwkwaNI/BXLV5oYXmbCOKRPCIKcPrj2pemIxukdwVBYPVLLub8AxRS2O2V7NRw8F6Ukiacft9q5Tus6q7jGDue3TJOdUZMBatfmKLVd80nvMkJhBGZTpS3J8goq23rqet4xRcciCfGvWdgIKETX9oykGlKu9Kmqb5Qn7XIzrD3+LLtgQicxi1f6gQl5Hf1OxQVSuYVEFStQc60Y+Svf4wAOtmkrUqAIyqKnC9LRd0bpKgSjlVskkJiXROIYRfr7VAblkAbS0LMmZJUTCxgiTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xksMc0J3jHAXJMSMkXEVBSHX9xg93nImDWkv9dYbDsk=;
 b=QJWZc3NAmLdYIElvM9Egf6h5kWgPausiWi805J5nZRHJxixMWq2FQq82uzedQEtT9t/H4TfNNucROXDCMzPIO1OKtHtU3ive7pk+o4XHNdsYFzXmywp1rsXmTbLCSrPRmBT2JaPUuKUKbPtSrPGgIrDtrxKpT02h/fhRZtSHTCxw297KcQaStZGofteSRjrCc/uAi9FKMePogz/Tjoy5RvstUamhiBwZiYDcRodgrjYhoIMkLY9Ga/f8Majdtdj/SEOJ4z/BP4Sg3G1rj5x1zuyimRodME+UKmzQmgza+g0tswelsbsEL3tWW2G5vlXwKZUCklG2e8x8LtmgI9RBXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xksMc0J3jHAXJMSMkXEVBSHX9xg93nImDWkv9dYbDsk=;
 b=u6ZcGzlSCMtNVNLmVolwTJdBnWHvIMn5pyKM5JItQqr0y2xUr1bVfqKbDDJs7MxoWMeNfQb/GG4JV1MvM+YdzB+7lZwQu4KEMXKAmVUDFcB/hPFaqtUHzE1Li1U79IqfimPV6zqXDm1gW19PzAju2TzBSaVq2QHn/W3l/kyH3eg=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSAPR01MB7206.jpnprd01.prod.outlook.com (2603:1096:604:11d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 13:26:51 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::541f:37c5:2149:bbb4%9]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 13:26:51 +0000
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
Subject: RE: [PATCH v8 5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v8 5/5] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYVBncVIq0M+rvYEOby6iI/LzsBK0DwW4AgAAKfDA=
Date:   Wed, 27 Apr 2022 13:26:51 +0000
Message-ID: <TYCPR01MB5933AE0C86146DC98BB4490786FA9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220419181757.63346-1-biju.das.jz@bp.renesas.com>
 <20220419181757.63346-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdWnfZytmpMNSV4iNEAN+1ajkfE3f6=qoOM-kGbm3+rojA@mail.gmail.com>
In-Reply-To: <CAMuHMdWnfZytmpMNSV4iNEAN+1ajkfE3f6=qoOM-kGbm3+rojA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad284ea2-f4f6-42a7-6ec5-08da28519715
x-ms-traffictypediagnostic: OSAPR01MB7206:EE_
x-microsoft-antispam-prvs: <OSAPR01MB7206E7B59417590AD6CD01D786FA9@OSAPR01MB7206.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JtrE696WRd/VJTnUKKJIirjqta9UXkBpaMhGarZZQK99ymgNRCddxjIRvnBSfkQ91r3wVArX6XFX7zIdabBN2EyelMWbrxJUmD5r39LJMHzn/tNMZzoOJuYGoHKYT1yHw04MTaFx++9W0fJ7So9IAFBnHRe2PMH10j4jgnrkWEHsJbzmyIW4VIpiTuQmLlg9W3V6wN66VaxlpvgApzuPAWx4fHt9QVH9bp9RM/Do3Yp8u1zwjT/v1BneKbDCCP+tRSB2iMemb4uhGf3iKR3/w6tJSWTRzT3q4GEwCsp+qSkU6DX8AGOTDzeGSBN+5qD67DbUPylbrQEyd1kL1NHr58LuV45yHx/889bKL0iHMBpWJ8OP7Bh5t+4OzPMOqxvHek6FFhyaD2Ud1iDiDHxCBu20adlhcFu+mUXTtECXOEtM2XbGRw2aPkCu9JE6d785t94y/Iz+impI591krPdH6TAU1Mb0NJy3o9Y2S5rTBE3unjqHZirONC/ZsfO5MfobIInXT6up8kcK0lLtvS5eyajaSqGqUyyEAPpSYYouuuCAWlP7JyxymCieEpXmPM+fzScC9wrLDIUeoqp0bWFz+LMSAZvB2x+U8VFPCWZt3VrqCe0DqUmiJct2TrkisxwtLy8BgPlEQknxpF+0gZuWFlyrVqq3bAVW2f0wrDt/RY7+2WjUm8Rm5ET8TdmAnQ1klswyWPXTmovASg2cLyBzGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(6916009)(122000001)(508600001)(38100700002)(66946007)(4326008)(76116006)(8676002)(66446008)(66476007)(66556008)(71200400001)(55016003)(64756008)(8936002)(52536014)(86362001)(5660300002)(316002)(26005)(83380400001)(9686003)(107886003)(53546011)(186003)(6506007)(7696005)(33656002)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTU5WXhVOE5jdG9QTDdvZHpBM20xdzlXeml6TElQZmRGYlFWcXZCRGxFamdj?=
 =?utf-8?B?WUgrVjVCSUpqd0JuUXlRcmprVHUzRE5SZm8xQ01iY2d4OFpDZzlYdmtCYkZR?=
 =?utf-8?B?UmwxaDRFQ2FzY1FtKzlDaW02UktkSTRvOGJ5NHp4dnlwSk45TTVVbWVsQ2Vo?=
 =?utf-8?B?MEhCaGgyR205ZXZSZTZGVVRlcy8wYWxrd1U1VWM1Sk5aaitlTC9RM01ZdTU1?=
 =?utf-8?B?dDhmZ0dyQlJrQ3UzNkRQaXZiandRNXVPdC9sQ0lVUlJkbmxpeWZVTmRYMk9M?=
 =?utf-8?B?TkVSakJQUEhYT0ttaGhady9ORklUOFZOZDQ5S1ZjcHZZdldzTngyYVVkb0U2?=
 =?utf-8?B?RzRlaGFUYm42R082ZnlLM2ZLdk9KZHZuSFNDM3ZxUFFiVDdlNlNTRVI3dE5s?=
 =?utf-8?B?ZXpzbXZzbi9TRzhUc3k5T2xhK2V5YUp4cVVGMTZibXd2dDdVR1V6Vm1sRTZR?=
 =?utf-8?B?R0hnUUwyQ3p1aEphSDZXeGtwc2dkQU1xL1k3UTZRTG5BS21hWVF6N1hiRmlZ?=
 =?utf-8?B?bnV0UVN4VkU2MFNXd1U1Ujc0UndUK1hoMU5mUjAyYjByV1pPODQyTEpjWW8z?=
 =?utf-8?B?MnhNeWpFb2dWQUhhMHlQMWlQNDB2ZkpySndYbW43aWtsYzNTMk9tcnF0dkVV?=
 =?utf-8?B?cWh4VkY4ZUVaVWl1S1c1Vm9wUmp3S2N4WThJZGlxeHZlbk40djBwMzJkc1Vl?=
 =?utf-8?B?TzlYdEU3Y3BhUnRaK0Jtb2szQ2xTbVJhdU9TL3hjWWp3V3V0SmdCbjlCY3RS?=
 =?utf-8?B?UHdEcEJ0VFJpK2hjb2FjYWF3d1lLV3VFNTlpNHdyVDRGNUI1NmNGUVlJTTJt?=
 =?utf-8?B?WkJ4WkFIQ2JReXArQnNFRUNGUWJWNjB3YlV1VFNwSnowSTVITUtyY3BCOTBE?=
 =?utf-8?B?dzl5VlpQUG5XaTdRWWRFNEFsMzBDQngyamltZmxyMWROMVZMcm40M0JTV1E5?=
 =?utf-8?B?djdaMnptZ0o4YjdKZnhEdzFMRndQTUcxeTNWMWYyRW5QYUJmQUVrNUdkMzBS?=
 =?utf-8?B?VG5SM0NwdnJ4UWRmSVkxTFR0Sk93Q0lWcHJVamUrYXdDT3FuMWRjL01Mc2tu?=
 =?utf-8?B?THhLb2pmdDJZUmd1S1ZtZnhmTTVYK3dzUmpHNVlLVUR6SE1XZVVhNXNHeXVl?=
 =?utf-8?B?VC9XV0Zjb05lL2xGVEpWRDl4QnRKeUF0RzhxN0JwSGVXR3MrU3JxTm90QW04?=
 =?utf-8?B?OEtQZjVlbFNrYVkrOXlYUUJlYWdKbm1LTUFDNVZvejBRNi9lMGZSRDV5Vndo?=
 =?utf-8?B?cUtwczJzbWZVU0JDdlFXNjY5Yit2L2Q0T29jSlVHVVA1dU5yOFFoNm1GaW9H?=
 =?utf-8?B?Z0QxK0N0YkFQeHl6NUJMWWl3T0xJQzJtSkpIQUEveHlScHZmUWxOdTNWS2hY?=
 =?utf-8?B?RGV1VXBNT3l0QWd1OVYvOHJWWFUza3B6OFFnS0NPR0N5anBNL296bEZUZzh4?=
 =?utf-8?B?ZG1LUXhFT1EwUWJPemdFeFRFbGc0Y29WYStyZXE3eHNrS2R5ZW4vcHJiMWlN?=
 =?utf-8?B?QWxSOHVjSjZVSlpwZ0tmQWpJQUNMckJHVCt5SUdIT05SUVllUFQrcTNIQ2Nv?=
 =?utf-8?B?T0RZUWFjWlRUNHMwZEcvUzB4ZE1vSzlSYVpKOHl5MDVVNUJiU3hvdXdxT2Fv?=
 =?utf-8?B?SGQxelowanNWZkNGQUVZdjJDcU11azRPWWxSb3A5TzBtSmI4aFh4ZWUrakVK?=
 =?utf-8?B?WHBLd2RaMUdaODFheThwZkczMVQzWHFlSmppdHRjanRQNk93Q1JDQzlRaFNW?=
 =?utf-8?B?THc4L0pZSzFEZHNwWjFtUXdsd0FyWHR5SUc3UzJwUmNEeWkxMDJhOFlQbkQr?=
 =?utf-8?B?VUxKNi9DOW9KQmdMK2lMTDk2dDkxclliTVBORUdxcXJUbGtNeDlvTlQ5TG1P?=
 =?utf-8?B?Q1NmdnJNZ3BjR0EzcVhlVUY0c0hRYzNaWE9wWjNpby94bk5tN25TSVUvS2FM?=
 =?utf-8?B?Tys3RTdIVUtMSk82UGhEMDVMaGRQYVpmNzVkRHUvR1kzcjZSR3ZWdTl5OGZh?=
 =?utf-8?B?WjVnaXpkRnB6VGRrZW1MQTFYWXlzTXZuakJlQVVDdUdsdTlmNWE4dFAvUzBM?=
 =?utf-8?B?ZTM1S0wvOXU4UWk5SkVIU3plZG81SURkQWR4WGRXVkNQRXU0UndaWXNIRkxT?=
 =?utf-8?B?Zm1hYWNNQTJJK0w5NzhKT1NOVnZXdzQ1eHVBcTlpTUlkMGd0dDcwT0NGZUM3?=
 =?utf-8?B?VXdNSEJ5WmV0V3hqSjBQK1lJS2FaS1NFZTFHd1JYbXQ0UTlVajZWeWdld1BW?=
 =?utf-8?B?di9BaU1uLzV4WUorUndvM0x4R1lmV0lFZWxSc2NnQWhGdHp4RTQrK0h0d3hT?=
 =?utf-8?B?eCsrU3hmRFM4RlUxSnQ1a1Z1c2RUcXpvcHY5SHdxWXBZQlNWQVhWU0JSak4x?=
 =?utf-8?Q?Jlq5YkpKR1bJ5zPE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad284ea2-f4f6-42a7-6ec5-08da28519715
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 13:26:51.8104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGjvCg83xSThwv5cBmzible5mB1yW09Ydc3UCh6uBjtdAvnvYLsS70YdoDMmF8nfG7hfqtDeFR3NhldkKHFLWesZV7zOOcQc383pfscL7ME=
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
UEFUQ0ggdjggNS81XSBtZWRpYTogcmVuZXNhczogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFJaL0cy
TA0KPiBWU1BEDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCBBcHIgMTksIDIwMjIgYXQg
ODoxOCBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0K
PiA+IFRoZSBSWi9HMkwgVlNQRCBwcm92aWRlcyBhIHNpbmdsZSBWU1BEIGluc3RhbmNlLiBJdCBo
YXMgdGhlIGZvbGxvd2luZw0KPiA+IHN1YiBtb2R1bGVzIE1BVSwgQ1RVLCBSUEYsIERQUiwgTFVU
LCBCUlMsIFdQRiBhbmQgTElGLg0KPiA+DQo+ID4gVGhlIFZTUEQgYmxvY2sgb24gUlovRzJMIGRv
ZXMgbm90IGhhdmUgYSB2ZXJzaW9uIHJlZ2lzdGVyLCBzbyBhZGRlZCBhDQo+ID4gbmV3IGNvbXBh
dGlibGUgc3RyaW5nICJyZW5lc2FzLHI5YTA3ZzA0NC12c3AyIiB3aXRoIGEgZGF0YSBwb2ludGVy
DQo+ID4gY29udGFpbmluZ3RoZSBpbmZvIHN0cnVjdHVyZS4gQWxzbyB0aGUgcmVzZXQgbGluZSBp
cyBzaGFyZWQgd2l0aCB0aGUNCj4gPiBEVSBtb2R1bGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4N
Cj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRl
ci5iZT4NCj4gPiBSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtK3Jl
bmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4gPiB2Ny0+djg6DQo+ID4gICogU3Bs
aXQgdGhlIHBhdGNoIGZvciBhZGRpbmcgcy93IHZlcnNpb24sIGZlYXR1cmUgYml0IGFuZCBSWi9H
MkwNCj4gPiBzdXBwb3J0DQo+ID4gICogQWRkZWQgZmVhdHVyZSBiaXQgVlNQMV9IQVNfTk9OX1pF
Uk9fTEJBIHRvIGRldmljZV9pbmZvDQo+ID4gICogQWRkZWQgLnNvYyBmb3IgUlovRzJMDQo+ID4g
ICogUmVwbGFjZWQgdGhlIGNvbXBhdGlibGUgInJlbmVzYXMscnpnMmwtdnNwMiIgLT4gInJlbmVz
YXMscjlhMDdnMDQ0LQ0KPiB2c3AyIg0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiAN
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvdnNwMS92c3AxX3JlZ3Mu
aA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy92c3AxL3ZzcDFfcmVn
cy5oDQo+ID4gQEAgLTc2Nyw2ICs3NjcsOCBAQA0KPiA+ICAjZGVmaW5lIFZJNl9JUF9WRVJTSU9O
X01PREVMX1ZTUERMX0dFTjMgICAgICAgICgweDE5IDw8IDgpDQo+ID4gICNkZWZpbmUgVkk2X0lQ
X1ZFUlNJT05fTU9ERUxfVlNQQlNfR0VOMyAgICAgICAgKDB4MWEgPDwgOCkNCj4gPiAgI2RlZmlu
ZSBWSTZfSVBfVkVSU0lPTl9NT0RFTF9WU1BEX1YzVSAgKDB4MWMgPDwgOCkNCj4gPiArLyogUlov
RzJMIFNvQydzIGhhdmUgbm8gdmVyc2lvbiByZWdpc3RlciwgU28gdXNlIDB4ODAgYXMgdGhlIG1v
ZGVsDQo+ID4gK3ZlcnNpb24gKi8NCj4gDQo+IFJaL0cyTCBTb0NzDQoNCk9LLiANCg0KPiANCj4g
PiArI2RlZmluZSBWSTZfSVBfVkVSU0lPTl9NT0RFTF9WU1BEX1JaRzJMICAgICAgICAoMHg4MCA8
PCA4KQ0KPiA+DQo+ID4gICNkZWZpbmUgVkk2X0lQX1ZFUlNJT05fU09DX01BU0sgICAgICAgICAg
ICAgICAgKDB4ZmYgPDwgMCkNCj4gPiAgI2RlZmluZSBWSTZfSVBfVkVSU0lPTl9TT0NfSDIgICAg
ICAgICAgKDB4MDEgPDwgMCkNCj4gPiBAQCAtNzgwLDYgKzc4Miw4IEBADQo+ID4gICNkZWZpbmUg
Vkk2X0lQX1ZFUlNJT05fU09DX00zTiAgICAgICAgICgweDA0IDw8IDApDQo+ID4gICNkZWZpbmUg
Vkk2X0lQX1ZFUlNJT05fU09DX0UzICAgICAgICAgICgweDA0IDw8IDApDQo+ID4gICNkZWZpbmUg
Vkk2X0lQX1ZFUlNJT05fU09DX1YzVSAgICAgICAgICgweDA1IDw8IDApDQo+ID4gKy8qIFJaL0cy
TCBTb0MgaGF2ZSBubyB2ZXJzaW9uIHJlZ2lzdGVyLCBTbyB1c2UgMHg4MCBmb3IgU29DDQo+ID4g
K0lkZW50aWZpY2F0aW9uICovDQo+IA0KPiBSWi9HMkwgU29Dcw0KDQpPSywgYXMgaXQgaXMgYXBw
bGljYWJsZSB0byBib3RoIFJaL0cyTCBhbmQgUlovRzJMQyBTb0NzLg0KDQpSZWdhcmRzLA0KYmlq
dQ0KDQo+IA0KPiA+ICsjZGVmaW5lIFZJNl9JUF9WRVJTSU9OX1NPQ19SWkcyTCAgICAgICAoMHg4
MCA8PCAwKQ0KPiA+DQo+ID4gICNkZWZpbmUgVkk2X0lQX1ZFUlNJT05fVlNQX1NXICAgICAgICAg
ICgweGZmZmUgPDwgMTYpIC8qIFNXIFZTUCB2ZXJzaW9uDQo+ICovDQo+IA0K
