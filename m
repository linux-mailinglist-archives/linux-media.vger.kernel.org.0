Return-Path: <linux-media+bounces-2117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B434980D34D
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 18:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 665D8281B2A
	for <lists+linux-media@lfdr.de>; Mon, 11 Dec 2023 17:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73EC4D11B;
	Mon, 11 Dec 2023 17:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hZqh0HMA"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2127.outbound.protection.outlook.com [40.107.114.127])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5751DB7;
	Mon, 11 Dec 2023 09:10:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUljpJSRYipO2jpVBMFjTUQxWsj3qvhiDMK7uXS55HSZEbf7fhGr8TlL6JnjeWr6HZoHqkrkLE/TCt4ux7B9sdnRMvEvXq25jgrByoTuDMBV08yI3ez1IFvNn42b/2XUjeGaZpu22vKtk+4UOIGTgvzcUuJXlSk5F/YAXt5OPA3QvOVsgJ2r4Mu+bcXGT+24BAt+HurB4Dhvqw3B52GeMSfuhUogX3pakKZ5o5OYZQarNivfH3oOEOJjNm6DcLNRz2AxcObMBZl4Bw5xgVgjw1eL1v7LxVtwhoCiWrRRF8kfo3fYE1NkyR6KocdkRwOHiHFiAeTdqUWw2NwhJNn7Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIruJu8aX/7uTWbEwFpBDD168G5LL0GA2T2rsJTqNmk=;
 b=VGF3NUl2P1zZtbTP/WYR/UF2+9HU1XvHL9tVd1asGTZ8e1SzVEER258DfurDYQMTFZ8DoV6SwTiHHCXBYlZAybWysdsfxsonelrfTiEWUrFeMuMVKJnnO9lHADa+oT0Bzq0YFe79rSPXq5Ded++f1YKqOEX50Dm8uRILOcFav4ZkU47aClVtuxAwe8tjgLV0A4PXlbWyLtc5WYiEZd1/TA3broV376HGNibJCjIN6WboXH2PboJswPK2qRRAsSRw8UTb/RCHOSFKB6jCRJ5XIj8DvHP28SziXw3EttHuU8M2Fa9OH+t8QlCSPr4XXjTt3G3rKoFG0bgXZnRNlmrz2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIruJu8aX/7uTWbEwFpBDD168G5LL0GA2T2rsJTqNmk=;
 b=hZqh0HMANW6FcBfFbrt7YuQqsv1IavcTo4b+v0L5hsGWs6b2t0HiweWcNcSrF4IiBqpXXudu8h6w/Dt7ItD7Rz+o38V+tqUCQam2Bvf5fG0bdsLulsljPW2b0xiV1B6H+1rlRNgu2ture0Urv+Fnfi7G9ivVaylCDq1CtVJyPh8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9390.jpnprd01.prod.outlook.com
 (2603:1096:400:1a3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.21; Mon, 11 Dec
 2023 17:10:03 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::f216:24ab:3668:3a48%4]) with mapi id 15.20.7091.020; Mon, 11 Dec 2023
 17:10:03 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Topic: [PATCH] media: v4l: async: Fix double pointer free on
 v4l2_async_unregister_subdev()
Thread-Index: AQHaI7M5bfzjfA5nV0+qnOeAaLyhXLCkYgIw
Date: Mon, 11 Dec 2023 17:10:03 +0000
Message-ID:
 <TYCPR01MB11269FCC5199547299AFDAAF3868FA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20231130173232.130731-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9390:EE_
x-ms-office365-filtering-correlation-id: 684bd994-c1dd-4b4d-d1af-08dbfa6c0421
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ePhZ+uh4xGKk70tQvax25K0xtIJE6fCSdtNrf5Z1OnnuKZXT8gQ4eey7/Pg0J9i45JJd3QKDmG9XoqNS9esE0M3JAnapABLVpkPEpleCF+4qqvPDETtl2+GwAEsHpdolK1pSojOwg6/BFqKXY7MMeymsGIUF2ynLY7opfWg6qfljaDX5cCpTzQ8LWlgLTmZPEhEqWoFxQDWrTj21/9R8jiG134K/1OwbuS09GL1/VoVY7I9JTeehXXT/2jvCUWUni55d6sGQh9e1gIP++B5fxr8ymmNzp+PsClpU4TawuNXnWidU07COwOLcfqISCIcPSu+5C04v1Hcy1O3/HqHGpyjWV+Pgb5MSpXpGlj/iTpFLHgHFYfDUDc9qzwhWjaH2qrFMC8vUKND2gE9V2H/o4swNGsDBD3UC4VKZBLjY6HfXFcKk+TZ4rGUu/0a/O1IzpBGZtL7+fpKD/mH2LFclkYcfANaBywxAWaVI2znIzz64oSTgG9IIF/Wu/qu3gWtt/V+kXFPgA7X1lI+T4y+Nvdh76kS6EPvMq8zkUNiNLX/BH9KKWlqssyH5dTN2EyiMZKvZKf66p9Djo6ds2krnpdkv+QK0PAsAv9p7R7wi4XSvGEtDQtyBFcQ4cCDDnCPi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(55016003)(33656002)(38070700009)(66899024)(26005)(7696005)(6506007)(53546011)(66476007)(110136005)(66446008)(478600001)(8936002)(4326008)(8676002)(66946007)(66556008)(9686003)(64756008)(54906003)(52536014)(76116006)(316002)(71200400001)(2906002)(41300700001)(5660300002)(122000001)(38100700002)(83380400001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z9Dke6/2+TbIKt1oGgngmYAK4t2FFpSRrmAFBNy/oW+bg62H5NYq7s7qZ8AE?=
 =?us-ascii?Q?MN6payTmXuhw7olq9/TUaED6v0BtS6Z+4Ya/bECO7pnfgNr8U+4QNekQDA0N?=
 =?us-ascii?Q?QzWq3U6FKhZjRoHAv1r+suCLKtBanbq3Sgtxv+R+z13J8x85VzjGHvzdTD6u?=
 =?us-ascii?Q?Xpf8h10yx+t6rJR1fGrBWpIOKGFrZQRYRp4DBF06h9Qk/Ph6pAAKNWeCngWI?=
 =?us-ascii?Q?OK6t91EmTR0y9LhiJXrBfriB7S0ftox7BjYu6vcYuWZG2vbSwiPaL3cV8/Rd?=
 =?us-ascii?Q?lGuc6YHc7dq6l/uoB3CfnzxJnCqfcSXiXXd3+C5/vOh2tR2ImpbFs8lRDc0E?=
 =?us-ascii?Q?n0AWrdrKa9mR4XodPGs/YljXG5b3kjJ2aOVzW7jK4PYifGTABHFuuxkUP2Q6?=
 =?us-ascii?Q?bQoCEvxnktRPCIA6KnS4W/Mqq6n4c2UW1tnQgy+pCWqVnot6IstzwOilJPNP?=
 =?us-ascii?Q?K63fGXUdHSzNGC3i71/7xMZ8IgVjcdBIjLDKi+NE/xtOLCsOe/Y4X595K4IX?=
 =?us-ascii?Q?VSM5Wxp5he/N328o3lHtAaDbobxf/76g31+cK/+hGgr89Pz1nLTo250GihZ8?=
 =?us-ascii?Q?LYY97+V1XQLV7uQCOvuEN3iMDOJRp6X3334TjdZ/IhzNeyi1QEFbySG9u35y?=
 =?us-ascii?Q?dQp4YvU+67hAGbgkZU+2W5mk9dd/2A/qs6MoUj6JiVNTDt7g4227TwehtQ2q?=
 =?us-ascii?Q?tPgxKpqw1sTH1DOB33M/XmUvt+LhXU92uYJRxiurHnuhdWZyUXobBZ8FtT5K?=
 =?us-ascii?Q?OR3bIewQgdJZO3rUVIjMKbX7TxZFGexbeQ9GgYqlZRAlsx1p8js/pbCNQpcu?=
 =?us-ascii?Q?XLCZqqZfiSDoK0pItNSnC8emauxhq+Ub7wp0DD6x6RLi59mHNlY8VGmC8UyR?=
 =?us-ascii?Q?RiBW8GFVGgDAye57Z1LmRAhqN2mriTH+0t8euhqfCVgA4VlSJAEQmPnZ7w8E?=
 =?us-ascii?Q?JKZaOUSrHHF1aFbqLUH4PUYRL1uPqlUshHOMX2iMYVFRhj9v5G8SVPfg7IW3?=
 =?us-ascii?Q?JEOL1p/SZ02H13mxfN54gX7IB4eevvxbGJWJg9LJLu1l3znJEf/eHZLvnN0u?=
 =?us-ascii?Q?GLW2/AZ/1sWOUCZhQqEx8Q5bukqfyrWmtbQiAGuJ0tvbYppTtGz+bDtO1FAj?=
 =?us-ascii?Q?GH8pjITisoMb3jBL0rCm/W4EhDubt6PnFn00RzDNnhCupytnsON3GWeAJx03?=
 =?us-ascii?Q?mwL8Zf26d/TlGqQbgOCZZJH/JMC4U17l930Mq3HGGE9bPtZfuMvSo5arHkGv?=
 =?us-ascii?Q?mBTaJUBOAo8yr/JYuPOGBbYj/N3apslTaYWmcwEcXxJUm9djA73E4TZPNXsF?=
 =?us-ascii?Q?Pmyd8SpwnnfKiH3K2D71u2toEvnin6ofiaehVHc1AwC6HOA/de6OjMQMSn8g?=
 =?us-ascii?Q?yoV0/W2JG3cqmmlyUWm7JPa8WhE6O84ro4/5ohvu4IhrB6du+IhhcBoEKp1C?=
 =?us-ascii?Q?uRL2NH3gr2MIoK6Laqr65PN2oeE1gRyWMT6wpaJM0wVR6tGCC7Uac9f9ewU/?=
 =?us-ascii?Q?g3quXAhu4IWsS/Sc+Nx1KeqzbbjuHDkEBHrxkGDAcmuP3rqlHqk+Rue8dPd2?=
 =?us-ascii?Q?n9Dg0A8ml/hMLdr3ESmO/GyUduCNLYg/3nPV4L/hS2qDpoNWe/DTG80qTXRq?=
 =?us-ascii?Q?5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 684bd994-c1dd-4b4d-d1af-08dbfa6c0421
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2023 17:10:03.5296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3gYgSugaGW+P0RVlSUAaQI+kqpm4I6dt0xK0WcPw+gSTzsygTp2qIm9KH5yQbonoqzEXQmyVTsReMXC+5kia+CxFscRjaFufHdszNtrJvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9390

Hi All,

Gentle ping. Are we happy with this fix? Please let me know.

This issue is reproducible on RZ/G2L SMARC EVK.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, November 30, 2023 5:33 PM
> Subject: [PATCH] media: v4l: async: Fix double pointer free on
> v4l2_async_unregister_subdev()
>=20
> The v4l2_async_unbind_subdev_one() deallocates the pointer &asc-
> >asc_subdev_entry. The same pointer is again used to deallocate in
> list_del() leading to the below kernel crash.
>=20
> Unable to handle kernel paging request at virtual address dead00000000010=
8
> v4l2_async_unregister_subdev+0xf8/0x164
> rzg2l_csi2_remove+0x30/0x5c
> platform_remove+0x28/0x64
> device_remove+0x48/0x74
> device_release_driver_internal+0x1d8/0x234
> device_driver_detach+0x14/0x1c
> unbind_store+0xac/0xb0
>=20
> Fixes: 28a1295795d8 ("media: v4l: async: Allow multiple connections
> between entities")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-
> core/v4l2-async.c
> index 091e8cf4114b..8cfd593d293d 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -880,7 +880,6 @@ void v4l2_async_unregister_subdev(struct v4l2_subdev
> *sd)
>  				  &asc->notifier->waiting_list);
>=20
>  			v4l2_async_unbind_subdev_one(asc->notifier, asc);
> -			list_del(&asc->asc_subdev_entry);
>  		}
>  	}
>=20
> --
> 2.25.1


