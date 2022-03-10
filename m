Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B6444D478C
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242232AbiCJNAs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242240AbiCJNAr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:00:47 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2095.outbound.protection.outlook.com [40.107.114.95])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB1F7007B;
        Thu, 10 Mar 2022 04:59:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGXsD4jDrEU+ih4S25AgCvXVJGK5PskOoE4VqBRgFqwVjrv1b6inY7UWf6TQWJyVHC0NdRJ75L/zT0q5teVlJcGNWZJjib242jvyEKoD/bPDskyYpkprJZ5iGGYIxE7Zn/3WtolGreiewMSz9FyMTULqHQSpS/rLiRicbpi8SLsvmZQfu36JGdSuQKvqJX7/IrdgVcAtdI+Cc4WnEqcIdbvKKvvkFMyphM6nN/Kcwp9OFienrY06Vv8nL55JfsJzVd3U50K29hwPrJNUjXVQ4R37RaxHccptmcJCXbjz38HKC8/X6NSlyIWQ6DE2I0sjSoLmRgW9yi/fU/2L0RK9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjoCzPfm+JaGv4kwIYwABQ3bnutJFB2GpfLEWnx2s0o=;
 b=SyI5ks9hKBrTM2SBaO5uztsTAViAfxLaJU1Z0enJ3DZmxkUG6otpHittpdT3TzNR+8As5dtkVjtEGz6wqQuzslJddhD5ZpXJ3cV59NuoUNmHeqWQyGJ6WVN64iStwCA4NWSZ1In7AhaxKgizg957POWy8Jpx9Pve3SvViG0PKlgFp8o/qChdXRiQRvs9q2ma3xUp5o9fZCB8//2FZqwi0WS26bg9Rb34RFVFxl9OIYmxktXILDTvT/0pSnhIp6w+rfWEcew6oUZsFMK1R/sGlrxQgKqt4gIVrzC/IhZehYlMetFhD80EQxqQf852iWki5jH/aMwPXCa2rF8Sk8OZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjoCzPfm+JaGv4kwIYwABQ3bnutJFB2GpfLEWnx2s0o=;
 b=j6aW+Kwmh/gmRh6hkUz5ocEggWr9DHpTm9VX8Pmd1iSkAEI7wjujaFJGSALn5YwnkDTy0x0WBi7/jPoLRO8ex71nifQ3zKeVPqY7QfpRGVLbB8Y7xhIqOBW1aWPjt2dhLJReJotesh3y5ooBx+UQuAX/ngp70Wa+LeCWsqdT0IE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB3359.jpnprd01.prod.outlook.com (2603:1096:404:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 12:59:39 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 12:59:39 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYM+5AeJxexxDclU2PUbIF1R4c/ay4a7uAgAAHsgCAABRLgIAACFBg
Date:   Thu, 10 Mar 2022 12:59:39 +0000
Message-ID: <OS0PR01MB5922D1B89DF5F56172739490860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
 <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
 <164690820109.123014.3107899517422264094@Monstersaurus>
 <OS0PR01MB5922FA79BF95266260364627860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUSBY6pE81OuoE9LX-Ekn+kFHDK=YT4=1w_+yfx-OmJ2A@mail.gmail.com>
In-Reply-To: <CAMuHMdUSBY6pE81OuoE9LX-Ekn+kFHDK=YT4=1w_+yfx-OmJ2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63426f51-3c94-4e77-87ed-08da0295d64c
x-ms-traffictypediagnostic: TYAPR01MB3359:EE_
x-microsoft-antispam-prvs: <TYAPR01MB3359002CA58463131EDD84DC860B9@TYAPR01MB3359.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ckc+CeogUJVq3ByogdxWRtJXwxcUn8X75zdAkcJtQ7gXrfGz4vl9YrVE7Hiq2rO3W6Bxl6+0yPKsBwU+A9iCnTgOJpDfVczbPg6PCkR1cj5OYsCPPPH0//25jzN3RMGiu3NyED4WAQXAzrF6zxMjJ9crthF7a01PeJV5R+vzKY1kws3aAfwFvJxlEqO2XIUWmLWHyxV0AEr7TGczOtw6c7h6UB+vATtjn55vSEynK3WzaS5JCRzlBodEwzfK08LnxTIhDrGdfKtKc9UvPAVhzVDr9NU6/DOdLR0pI/vRfNxQechkQYYdOFBRbIHXGxdcpkzFSrXxYjNDAWf63WuS1XF+VeEbMc+c/gXAWvDEMvOssVoWPonOZy0QjkMoNhuiL+baE0y2yDE+sxghbXUFdz4xavA2h0oPBm9oY6pUm+TVRl5V1n00lfk2+RjjCQ8tYiEirzShHh7Q7FX3lb2A+aeyicJoxdH9OH2zATlDcvSv7yJZM4EFp/Z2zKJQ7wHNOhDfPtABPMyPKhTBAAv95cKx30cfejBhjlTAe8V5QYkk7EPB7d/djLq887OUQPqwDzrNbSVeX/bTjf80hdYPeMIqbDksO76UnLSsJrI0ukMiI8asRBOL7Q5GttsiyA/xsgDeIXW5kBwCJEwKhfdDyBYakgMRYh/URlvKMLaur3HwpvyM8IJn8ODq3HA61MJb99tf65pPTpuFe8l2EJVWxA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(316002)(186003)(107886003)(55016003)(54906003)(122000001)(2906002)(6916009)(508600001)(66556008)(66476007)(8936002)(38070700005)(66946007)(4326008)(86362001)(64756008)(8676002)(52536014)(83380400001)(71200400001)(53546011)(66446008)(26005)(6506007)(9686003)(7696005)(38100700002)(5660300002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clVXU1RMTVBFekxtT1d3QW9zVGdvNEg2RzZSMzV0UkJ3RHc1Qk9HeDN5WWRY?=
 =?utf-8?B?OHJiV29XQk0wVU1naXNNRDZVN3dKUFcvM0E5djg0NW45TG1QTVp5cDhSSGwr?=
 =?utf-8?B?ekRqZE9yUXZFaVA2cWpNU1pzMFF2bWRVMHdpaThDeHlIZXRHTFhPZm9PZjNZ?=
 =?utf-8?B?b1RNblFMWXhYMXZSeFlyQ1BhMkplRFRsaU81VDc5WG9tY3kwTms4NTNrSjFV?=
 =?utf-8?B?MlQ1TXRSd0p3MlE4Y3Bhc0dQWWZ0TW1TaFpKQUNHK0JhT2pRZHJZd0l5SENV?=
 =?utf-8?B?RzBobmU4T05OODkwblBUUFRaMVlWcDZTaGVyYVVwaUNEK2ZZMGtTY29hZ2Ur?=
 =?utf-8?B?WXo2R3B1SERHdHdacGJ3OUhDSnpyb0Q0QWdOR3dDSmJ1MDZxUGorRmpPczVl?=
 =?utf-8?B?bVhlYXYyMEZQZEpBajZmU0NtNmpJaS9MdllRK3JvbUtVOGJsaUw4aG1GMVlr?=
 =?utf-8?B?YURUR2tWNzlsSVhleWFGb3ROd1hPSjRRb0F3bGRONVJIckNNWXNmcjZlaVZv?=
 =?utf-8?B?NGlFOHNsMnRHckxoS3E3YmxvSzBaRzR5TU9WUWx0SThGaGRBTE5ZUjZBVjBG?=
 =?utf-8?B?R3FCTWZ4MzVGVVdCbVBJdzRhVmRCRkdCVWxZTEJFSDIvNWJmb3RxdFFyUFdr?=
 =?utf-8?B?Q29oQjhUVVlZUEJpV21iZFZ2NGl2eVB1NGpyT2VCT29TZDBKcTZnQ2dOUzN4?=
 =?utf-8?B?SHpZbkh5c0tXNDVGalpGYjlHazRXYmhDTUI5d1Vaa2VacFJlek5nRFRjUDc0?=
 =?utf-8?B?L21NY3NLOFQwZzRuT3oxMFBqSllvUmdCV0hWYjU5TUlIWXFJc29iaUVycHda?=
 =?utf-8?B?dThmVVBjS0RuSWxZTFpqL1Q3MUcyNGpqOU5QV3Y5Mmdnemk1K2REMHVYa2V6?=
 =?utf-8?B?NGNxRDVnaW5rM0lQQUhROHhMOUxrM3BDS1ZzK2RJSENzRWJHaXVDM095OUFH?=
 =?utf-8?B?ZHV3ZUZPUWNmK1RkWmdnS1lwbHI4RjEwdDF2bVk0SkVMaDlrODNEZGl1eFdS?=
 =?utf-8?B?ZG53YklNcE5KakJiN0kzSWVMd2ZnVysrVm9TcFFLczRLRU9qMUtTK2t4NUNJ?=
 =?utf-8?B?QkJDOHRQMlpMc0RpeDBEU2M4dkl1WHE2cnAxUWY5UC82U2RuamwwZC8vQndj?=
 =?utf-8?B?MjFHWDhzTzJ6TjFuWGZMYmRCeTBWZkE3ei81SU9QdEl0SWVuTkJYcklTZDdj?=
 =?utf-8?B?YUlCbjA3VmFCbG9heU91NDdlVEZZN1U3WFFzOWVVdCtpLy9QUHQzamVJNkZp?=
 =?utf-8?B?S0d5bU82WHJpK0pVUlF2N0x2aksrMUxoRUNsQ0xoZHhhYjhxeXhySyt5WUFV?=
 =?utf-8?B?a3RiMFYvWWgySDR0MDlrcU5CWkMrc3hpSHlHM1J3WVlBNFNYcFZUK0RtcHpN?=
 =?utf-8?B?akFldlFlcGduc1FpN2hJNktqbkdSVVhuR01wT1RSWElBRXd1VkRDYlZ2YnBh?=
 =?utf-8?B?ZktZdlNvMDQ3R0xCUHA4bmhlWmlTVFJpdVUySG85c1VhZExqb1dDUE9KM3A3?=
 =?utf-8?B?MHR5aGRmbjJ3bGJDQTJqVWtnUWpWM2J1N09LK2d6bFQ0SWJzcW4yeEtoU1E0?=
 =?utf-8?B?T3FGbG1sMmIyQmZpaHp6VE4vcEwybUdEQlhiV1liaWxaWUFTVVBlaEV6Yjhz?=
 =?utf-8?B?L0JnN2QzNUZLZkx4QnZNMUlWYml6ZThyaE51VFZmbWhBdUtyMklkN0UzcnRO?=
 =?utf-8?B?U042MkxVOWZUQm1BV1ppSWxXYVE4NmZwaTNTVC9VVmZ3Lzk3N1MrZkNFZHg3?=
 =?utf-8?B?MmU4eWhEMVNzVTk0QS9uK0VwVkNtL1hDNDhuZy9RQ0VHUGNyWGMxand5dm9r?=
 =?utf-8?B?UFlxa3ZIWW5xOTdPL2QyVGtWUkRtbEd4TWppRm5sUXdwY2t2REg2ZXF3cXhi?=
 =?utf-8?B?bUFhdHZxRG9hRktsdXZBQTB5SXBvRUpTTEd3WGp3cWJkV2ZqMWdMU0RuelF5?=
 =?utf-8?B?MS9uaERwVkQ1TlZzb055K0lGOWFMRHRUTTAyd1AxemxNRitkV2RUamlGemlH?=
 =?utf-8?B?bDZwbEU5bGYyYktFM2poWlIzKzRyMjV3djVQQUNPRlA1NFFoNTVwVGtCS3Bk?=
 =?utf-8?B?ajhJZVRlSU5jRDdTYTdJVzNnS2xHSXJFMzNudmJBK29wRUhqNWMvaDYyM2tK?=
 =?utf-8?B?V2VJT0l1eGZsWU0wRXVLekxGbUwvMXR4RTNCQnZ4MThyOENxR3p3RXNtZFBy?=
 =?utf-8?B?cW0xNG1FN1NCWGJFdk9jVGN6Zlg5TmY4UXYzZ240Z2xzdmhZdWtCRDZMQktC?=
 =?utf-8?B?ZVZlNnEvTzZLcWdvbmVPVmFtSkNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63426f51-3c94-4e77-87ed-08da0295d64c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 12:59:39.4287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yICThi8F/dVWfUM9ttiVPCoj69Id3/9Q/f7kWmGHSIBle+LVBpxYeoxZSRscCPg6JttCP1NhmJ+8iDpswtPuZWvU0scNly7uJaqJVzas6Gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3359
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
UEFUQ0ggMy8zXSBtZWRpYTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFJaL0cyTCBWU1BEDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXIgMTAsIDIwMjIgYXQgMTI6MTEgUE0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMy8zXSBtZWRpYTogdnNwMTogQWRkIHN1cHBvcnQgZm9yIFJaL0cyTCBWU1BE
DQo+ID4gPiBRdW90aW5nIEJpanUgRGFzICgyMDIyLTAzLTA5IDE5OjQ1OjIxKQ0KPiA+ID4gPiBU
aGUgUlovRzJMIFZTUEQgcHJvdmlkZXMgYSBzaW5nbGUgVlNQRCBpbnN0YW5jZS4gSXQgaGFzIHRo
ZQ0KPiA+ID4gPiBmb2xsb3dpbmcgc3ViIG1vZHVsZXMgTUFVLCBDVFUsIFJQRiwgRFBSLCBMVVQs
IEJSUywgV1BGIGFuZCBMSUYuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBWU1BEIGJsb2NrIG9uIFJa
L0cyTCBkb2VzIG5vdCBoYXZlIGEgdmVyc2lvbiByZWdpc3Rlciwgc28NCj4gPiA+ID4gYWRkZWQg
YSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgInJlbmVzYXMsdnNwMi1yemcybCIgd2l0aCBhIGRhdGEN
Cj4gPiA+ID4gcG9pbnRlciBjb250YWluaW5nDQo+IA0KPiA+ID4gPiAgZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS92c3AxL3ZzcDFfZHJ2LmMgIHwgMzINCj4gPiA+ID4gKysrKysrKysrKysrKysrKysr
Ky0tLS0tLSAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfbGlmLmMNCj4gPiA+ID4g
KysrKysrKysrKysrKysrKysrK3wNCj4gPiA+ID4gNyArKysrLS0gIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vdnNwMS92c3AxX3JlZ3MuaCB8ICAxICsNCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MzEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdnNwMS92c3AxX2Rydi5jDQo+ID4gPiA+IGIv
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfZHJ2LmMNCj4gPiA+ID4gaW5kZXggNzdk
YTZhNjczMmQ4Li40MGM2ZDkyOTA2ODEgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vdnNwMS92c3AxX2Rydi5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vdnNwMS92c3AxX2Rydi5jDQo+IA0KPiA+ID4gPiAgICAgICAgIGlmIChJU19FUlIo
dnNwMS0+cnN0YykpDQo+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9i
ZSgmcGRldi0+ZGV2LCBQVFJfRVJSKHZzcDEtDQo+ID5yc3RjKSwNCj4gPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmYWlsZWQgdG8gZ2V0IHJlc2V0DQo+ID4gPiA+
IGN0cmxcbiIpOyBAQA0KPiA+ID4gPiAtODc0LDEzICs4ODksMTUgQEAgc3RhdGljIGludCB2c3Ax
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+ID4gPiA+ICAgICAgICAg
aWYgKHJldCA8IDApDQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+ID4gPiA+
DQo+ID4gPiA+IC0gICAgICAgdnNwMS0+dmVyc2lvbiA9IHZzcDFfcmVhZCh2c3AxLCBWSTZfSVBf
VkVSU0lPTik7DQo+ID4gPiA+ICsgICAgICAgaWYgKCF2c3AxLT5pbmZvKSB7DQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICB2c3AxLT52ZXJzaW9uID0gdnNwMV9yZWFkKHZzcDEsIFZJNl9JUF9WRVJT
SU9OKTsNCj4gPiA+ID4NCj4gPiA+ID4gLSAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RSh2c3AxX2RldmljZV9pbmZvcyk7ICsraSkgew0KPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYg
KCh2c3AxLT52ZXJzaW9uICYgVkk2X0lQX1ZFUlNJT05fTU9ERUxfTUFTSykgPT0NCj4gPiA+ID4g
LSAgICAgICAgICAgICAgICAgICB2c3AxX2RldmljZV9pbmZvc1tpXS52ZXJzaW9uKSB7DQo+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIHZzcDEtPmluZm8gPSAmdnNwMV9kZXZpY2VfaW5m
b3NbaV07DQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gPiAr
ICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUodnNwMV9kZXZpY2VfaW5m
b3MpOyArK2kpDQo+IHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCh2c3Ax
LT52ZXJzaW9uICYNCj4gPiA+ID4gKyBWSTZfSVBfVkVSU0lPTl9NT0RFTF9NQVNLKQ0KPiA+ID4g
PT0NCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHZzcDFfZGV2aWNlX2luZm9z
W2ldLnZlcnNpb24pIHsNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
c3AxLT5pbmZvID0gJnZzcDFfZGV2aWNlX2luZm9zW2ldOw0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICB9DQo+ID4gPg0KPiA+ID4NCj4gPiA+IFRoaXMgaXMgbG9va2luZyBsaWtlIGl0IGdldHMgYSBi
aXQgYXdrd2FyZC4gVHdvIG1ldGhvZHMgZm9yDQo+ID4gPiBpZGVudGlmeWluZyB0aGUgdmVyc2lv
biBhbmQgaW5mbyBzdHJ1Y3R1cmUgaXMgZ29pbmcgdG8gYmUgYSBwYWluLg0KPiA+DQo+ID4gT24g
UkZDLCBMYXVyZW50IHN1Z2dlc3RlZCB0byB1c2UgaW5mbyBmb3IgUlovRzJMLiBEbyB5b3UgaGF2
ZSBiZXR0ZXINCj4gPiBTdWdnZXN0aW9uPyBQbGVhc2UgbGV0IG1lIGtub3cuDQo+IA0KPiBJJ20g
YWZyYWlkIHdlIGhhdmUgbm8gb3RoZXIgb3B0aW9uLiAgQnV0IHRoZSBmbG93IGNvdWxkIGJlIG1h
ZGUgcHJldHRpZXINCj4gYnkgbW92aW5nIHRoZSB0YWJsZSBsb29rdXAgaW50byBpdHMgb3duIGZ1
bmN0aW9uLCBhbmQgdXNpbmcgc29tZXRoaW5nIGxpa2UNCj4gYmVsb3cgaW4gdGhlIHByb2JlIGZ1
bmN0aW9uOg0KDQpTb3VuZHMgZ29vZCB0byBtZS4gS2llcmFuL0xhdXJlbnQsIGFyZSB5b3UgT0sg
d2l0aCBHZWVydCdzIHN1Z2dlc3Rpb24/DQoNCj4gDQo+ICAgICB2c3AxLT5pbmZvID0gb2ZfZGV2
aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiAgICAgaWYgKCF2c3AxLT5pbmZvKQ0K
PiAgICAgICAgICAgICB2c3AxLT5pbmZvID0gdnNwMV9sb29rdXAodnNwMV9yZWFkKHZzcDEsIFZJ
Nl9JUF9WRVJTSU9OKSk7DQo+ICAgICBpZiAoIXZzcDEtPmluZm8pDQo+ICAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWLg0KPiANCj4gPiA+ID4gQEAgLTk0Myw2ICs5NjAsNyBAQCBzdGF0aWMgaW50
IHZzcDFfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiA+ID4gKnBkZXYpICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB2c3AxX29mX21hdGNoW10gPSB7DQo+ID4gPiA+
ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHZzcDEiIH0sDQo+ID4gPiA+ICAgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHZzcDIiIH0sDQo+ID4gPiA+ICsgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHZzcDItcnpnMmwiLCAuZGF0YSA9DQo+ID4gPiA+ICsgJnZz
cDFfZGV2aWNlX2luZm9zWzE0XSB9LA0KPiA+ID4NCj4gPiA+IEkgZG9uJ3QgdGhpbmsgeW91IHNo
b3VsZCByZWZlcmVuY2UgYSBzcGVjaWZpYyBpbmRleCBvZiB0aGUgaW5mb3MNCj4gdGFibGUuDQo+
ID4gPiBXaGF0IGhhcHBlbnMgaWYgc29tZW9uZSBhZGRzIGFuIGVudHJ5IGhpZ2hlciBpbiB0aGUg
dGFibGUgd2hpY2gNCj4gPiA+IHB1c2hlcyB0aGUgaW5kZXhlcyBkb3duID8NCj4gPg0KPiA+IEkg
Y2FuIHRoaW5rIG9mIGFkZGluZyBtYWNyb3MgaW4gaW5mbyBzdHJ1Y3R1cmUgYW5kIHVzZSB0aGF0
IG1hY3JvIGhlcmUNCj4gPiB0byBhdm9pZCBzdWNoIGNvbmRpdGlvbiwgaWYgaXQgYWxsIG5lZWRl
ZC4NCj4gPg0KPiA+IERvIHlvdSBoYXZlIGFueSBvdGhlciBiZXR0ZXIgYWx0ZXJuYXRpdmUgdG8g
aGFuZGxlIHRoaXMgc2NlbmFyaW8/DQo+ID4gUGxlYXNlIGxldCBtZSBrbm93Lg0KPiANCj4gSSB3
b3VsZCB1c2UgYSBwb2ludGVyIHRvIGFuIGluZGVwZW5kZW50IHN0cnVjdCB2c3AxX2RldmljZV9p
bmZvLCBub3QgcGFydA0KPiBvZiB2c3AxX2RldmljZV9pbmZvc1tdLCBzbyBpdCBjYW4gbmV2ZXIg
YmUgbWF0Y2hlZCBieSBhY2NpZGVudCAoc2VlDQo+IGJlbG93KS4NCg0KU291bmRzIGdvb2QgdG8g
bWUuIEtpZXJhbi9MYXVyZW50LCBhcmUgeW91IE9LIHdpdGggR2VlcnQncyBzdWdnZXN0aW9uPw0K
DQo+IA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZzcDEvdnNwMV9yZWdz
LmgNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92c3AxL3ZzcDFfcmVncy5o
DQo+ID4gPiA+IEBAIC03NjYsNiArNzY2LDcgQEANCj4gPiA+ID4gICNkZWZpbmUgVkk2X0lQX1ZF
UlNJT05fTU9ERUxfVlNQRF9WMyAgICgweDE4IDw8IDgpDQo+ID4gPiA+ICAjZGVmaW5lIFZJNl9J
UF9WRVJTSU9OX01PREVMX1ZTUERMX0dFTjMgICAgICAgICgweDE5IDw8IDgpDQo+ID4gPiA+ICAj
ZGVmaW5lIFZJNl9JUF9WRVJTSU9OX01PREVMX1ZTUEJTX0dFTjMgICAgICAgICgweDFhIDw8IDgp
DQo+ID4gPiA+ICsjZGVmaW5lIFZJNl9JUF9WRVJTSU9OX01PREVMX1ZTUERfUlpHMkwgICAgICAg
ICgweDFiIDw8IDgpDQo+ID4gPg0KPiA+ID4gSSBkb24ndCBsaWtlIHRoZSBpZGVhIG9mIHVzaW5n
IGEgdmFsdWUgaGVyZSB0aGF0IGNvdWxkIHJlYWxseSBiZQ0KPiA+ID4gdXNlZCBvbiBhIHJlYWwg
ZGV2aWNlIHNvbWV3aGVyZS4NCj4gPiA+DQo+ID4gPiBUaGUgaG9sZSBpbiB0aGUgc2VxdWVuY2Ug
aXMgb25seSB0aGVyZSBiZWNhdXNlIHdlIGhhdmVudCcgc2VlbiBhDQo+ID4gPiBkYXRhc2hlZXQg
d2l0aCAweDFiIGRlZmluZWQuDQo+ID4gPg0KPiA+ID4gSWYgdGhlcmUgdHJ1ZWx5IGlzIG5vIHZl
cnNpb24gcmVnaXN0ZXIgb24gdGhpcyBoYXJkd2FyZSwgd2UncmUgZ29pbmcNCj4gPiA+IHRvIGhh
dmUgdG8gbWFrZSBzdXJlIHRoaXMgdmVyc2lvbiB2YWx1ZSBjYW4ndCBjb25mbGljdC4NCj4gPg0K
PiA+IEN1cnJlbnRseSwgSSBkb24ndCBzZWUgYW55IGRldmljZSB3aXRoIDB4MWIuIElmIGluIGZ1
dHVyZSBpZiB3ZSBmb3VuZA0KPiA+IGEgZGV2aWNlIFdpdGggMHgxYiwgVGhpcyBjYW4gYmUgbW92
ZWQgdG8gYSBoaWdoZXIgdmFsdWUgZm9yIGVnOi0gMHhmZS4NCj4gPg0KPiA+IFBsZWFzZSBsZXQg
bWUga25vdyB5b3VyIHRob3VnaHRzLg0KPiANCj4gSSBhZ3JlZSB3aXRoIEtpZXJhbiwgYW5kIHN0
cm9uZ2x5IHJlY29tbWVuZCBhZ2FpbnN0IHVzaW5nIGEgbnVtYmVyIHRoYXQNCj4gbWlnaHQgZXhp
c3QgZm9yIHJlYWwgb24gY3VycmVudCBvciBmdXR1cmUgU29Dcy4gIFVuZm9ydHVuYXRlbHkgdGhl
cmUncw0KPiBvbmx5IDggYml0cyBhdmFpbGFibGUsIHByZWNsdWRpbmcgdGhlIHVzZSBvZiBlLmcu
ICgweGJlZWYwMSA8PCA4KS4gQnV0DQo+IHN0YXJ0aW5nIGZyb20gKDB4ZmYgPDwgOCksIGFuZCBj
b3VudGluZyBkb3duIGZvciBmdXR1cmUgZW50cmllcywgaWYNCj4gbmVlZGVkLCBzb3VuZHMgbGlr
ZSBhIGdvb2QgY29tcHJvbWlzZS4NCj4gDQo+IEFuZCBvZiBjb3Vyc2UgdGhlcmUgc2hvdWxkIGJl
IGEgY29tbWVudCBuZXh0IHRvIHRoZSBkZWZpbml0aW9uLCB0byBtYWtlIGl0DQo+IGNsZWFyIHRo
aXMgaXMgYSBtYWRlLXVwIG51bWJlci4NCg0KU291bmRzIGdvb2QgdG8gbWUuIEtpZXJhbi9MYXVy
ZW50LCBhcmUgeW91IE9LIHdpdGggR2VlcnQncyBzdWdnZXN0aW9uPw0KDQo+IA0KPiBQLlMuIElm
IHBvc3NpYmxlLCBwbGVhc2UgY29tbXVuaWNhdGUgdG8gdGhlIGhhcmR3YXJlIGVuZ2luZWVycyBp
dA0KPiAgICAgIHdhcyBJTUhPIGEgYmFkIGRlY2lzaW9uIHRvIGdldCByaWQgb2YgdGhlIHZlcnNp
b24gcmVnaXN0ZXIsDQo+ICAgICAgd2hpY2ggc2hvdWxkIGJlIHJlY29uc2lkZXJlZCBmb3IgZnV0
dXJlIFNvQ3MuDQoNCkkgYW0gY2hlY2tpbmcgd2l0aCBIVyBlbmdpbmVlciwgSSB3aWxsIHVwZGF0
ZSB5b3Ugb25jZSBJIGdldCBmZWVkYmFjayBmcm9tIHRoZW0uDQoNCkNoZWVycywNCkJpanUNCg==
