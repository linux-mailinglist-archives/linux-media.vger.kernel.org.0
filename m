Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD2B4505EA0
	for <lists+linux-media@lfdr.de>; Mon, 18 Apr 2022 21:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347723AbiDRTo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Apr 2022 15:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234364AbiDRTo1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Apr 2022 15:44:27 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2119.outbound.protection.outlook.com [40.107.114.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AFA2495F;
        Mon, 18 Apr 2022 12:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNdJIij4+1t2mmKYg80BTYoZpPqn+qJli1urYD2VhgAXuYLHhcLBJ7rUspFE/2/xs11Ez6vuf0SCij3GnO3vVuOgh+1vteh9HXIcOxI5bRRg6W4cuGgfQ+itkTelWjqX4VNzZdH34awVz+FE4uw2sSoCGej+a4y9xTorXNV7Aw7gvfmb/4OiUQgLj/qkfOUjJO14sNf9sal+c/dNXxRLJ2yeAIOXtqgHnFbA04H0bwyyhT5zYXe/EDPKnHNGe7355oILBmfBZdpqRnI5/PT3nEwtLB5HfXYrO02CHGZH5BWQse9jD5wsXVZVNEbRwmNyPCjVIfME3fmgaLamPTkZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fpn2EdeqtLQ3sXEm9/gkpZsEfMe92A1DAksaAbEQaDI=;
 b=Iqt85CwZ7ba6hpPRk840Qut/nflgW3D+Mk+xAekPlOKbiIcJANVFFmcJ/p3GxBTnQJ4lGfc8DnXk9GMO4hAwZ8cjbjtR3VMUxk0npFs1OBxWkmr0qLVIOAIyaXvT0xQCcxPio0YWZKecgMny00ii2ReQoO+n/Wg5KxeKYoBisru37eiFa+sf8QlbPxKU45Yn6Vr8CZzORCqqkjyAXJJAXoiW8uJILynOsISh6QUMuZAHQXmlEg0j3ui7vmEbnmB4FmUts99HxMh85b2Hr4NLKTgLaQseMktjtE1AWNeKAB3S6sELJ+jiCqDBsXV3kGI9TF3v69bKJqnLY00Ha8l2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fpn2EdeqtLQ3sXEm9/gkpZsEfMe92A1DAksaAbEQaDI=;
 b=mknqMYF871O2uZr6v8PyeDmOBm1RbNgLH9m6zzlxNqGE6vspBydZ9bXH/tT4aw9xnJokD1OroMEJytcRbyOMvHgFMwkB84DyS4ES59sxnJgtQvE2wWxoI8C7NtRjDozT14UIQMLTydbzBWdiaQ8Ptm7g3KDNvqJK0VUKYsop5pU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB2891.jpnprd01.prod.outlook.com (2603:1096:404:6b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 19:41:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 19:41:43 +0000
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
Subject: RE: [PATCH v7 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v7 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYUAufCFg2cM1J3Uir201QW5DvtazwvTmAgAVZbOA=
Date:   Mon, 18 Apr 2022 19:41:43 +0000
Message-ID: <OS0PR01MB592257788035459E7FD45D7E86F39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220414142605.26235-1-biju.das.jz@bp.renesas.com>
 <20220414142605.26235-4-biju.das.jz@bp.renesas.com>
 <YllAmTJoR40AXn28@pendragon.ideasonboard.com>
In-Reply-To: <YllAmTJoR40AXn28@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3eb1c8d-7b60-4e48-61e9-08da21737745
x-ms-traffictypediagnostic: TY2PR01MB2891:EE_
x-microsoft-antispam-prvs: <TY2PR01MB289113BE05AEB5D41898290786F39@TY2PR01MB2891.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BX5iCce0LGoD5Mj2B38RLVaLxeGLVe7i8PGRClwzWjeMVVD8TuopDUygCOEpf7UnBsqOXsmIXKyRqQRsRXMv2dEsEt801bRszX/QO7gJbFa4csNiqQIgPAdBeWyTboRtzknqNSh8k1Nba2mdIPjwNu5b+1vyJCb7bOzx1AjkzCApkA1miG7tTN1sAkl5e0IZpfpRaIdk7KfpO5YyO60LVW0jPioLK/f8qTCCo0lTCUn7CmBlbcs5DsHUwseR59xcgAZmbf5MDWV4J9T195QUiNve2ko3WZVx4eb78ptFu5RMDkgnG6sWiSFqu4KGoBwFzsy5diue3BOtDwB5/NX6MGNnPE5ne2wkooX7z2+qjj195d1Fhnvx+xuen2Gjxsoa3dik9faJensKRpTEW3I4649lUT5TVMwNAbMpV/pFNm02C6ADND077yv5rnstJLXO7IrdzaaHHoc4qCKMePZXODd8pIKcvHyGUY+P3Td2U8bHeLCmIvRRDFX74q9OoPQi2+IMfEAmZBqBwuyEE82hUH5QeL/bJiFR5d36oeNGPZd7CptIGwKj5WnRdGqTqjV868D1r3WtpCskgmsBGWJwCf+aNzhq/WMrgDDkrWbnUVJaze7R5VQC0NfV4YlFwoZT6MIX0WgGrDBqd0sI3lnDbzLOX2m72+HyCIgrl/h5tHVQik+ie8gScgFeN73ziXJzI9oYpfdxdV4BxYnS7T0tuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(71200400001)(4326008)(186003)(8936002)(107886003)(86362001)(55016003)(30864003)(83380400001)(6506007)(7696005)(9686003)(26005)(508600001)(52536014)(33656002)(122000001)(66476007)(76116006)(66946007)(66556008)(5660300002)(316002)(66446008)(8676002)(64756008)(38070700005)(38100700002)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?X5g/DlPJ5sr1qk0tUWEF0oLpyWG1WFHPl2Bgu0g3XqEN6yAbjz7jJSTz83UC?=
 =?us-ascii?Q?/O56cCwaAyr7AApWhFXjcWOGy9R8mRps4+DrgXz4/1CYlQrVonN2PxN0LKwh?=
 =?us-ascii?Q?PH9m9nGKnseF8uv5Pe0VKluRZNw/Mck6rzfINXBzcYYvcEjHF/2rWeaE8tcd?=
 =?us-ascii?Q?cfk98TzHGIxNYkfjW7+eyvuESun3z7J7cnjQxHo5Imp2DvlRzuvRcK0Mi1Cy?=
 =?us-ascii?Q?0MdMLWICaUYqH3Wvjeut50eULS/vumP/lp9bPh2GLYvEaHxxc6qKlTeulx/D?=
 =?us-ascii?Q?acI9WLTJbcScd9V0/dMoDluDVxQMbrlgZeBhJ+st7psjZ4tZLgrknmShjsS7?=
 =?us-ascii?Q?yeyiBixkFV+bcBnqOOLFbgazQRHTkukM6+0vwI78f9BRea0OyehfXqBK5bA6?=
 =?us-ascii?Q?aGZFWhXVZ6ugeS6C3c39iCKxHnXJh4GxZdssNK1/cL8R5trtquShdB/jeXtP?=
 =?us-ascii?Q?WFVrmD7mKdi2mK5dP1ChY6smMDKnuiWdw9DhVHOi9LSKwdx5MpGJ1Bsu8LDw?=
 =?us-ascii?Q?4YCbFwfc4ZKhHFvxdzOWproSTDjPsLgLutcIxGtHCudw9JAzTkjajWPEYnxv?=
 =?us-ascii?Q?78yiMgONtCatBr+88us0hVeh/ou67mdL682Ie8m4QeSqYzd6ODHIcDVa5Wud?=
 =?us-ascii?Q?1weQGtCNAguVVJOko1PONhgeMWya2VOTmmyXopOW8Qw4Q71qe6AdRwgmvtAZ?=
 =?us-ascii?Q?lBU/k3YnFW4bgGYufpFuY8v4Xiui9yaCm4iRjDm3fwdK0C52Y80oOTLD0bnT?=
 =?us-ascii?Q?mjj1t2oo/oCfnhIoxxwQ5+qC8m657Iv1uim0iutrWWKf+t8tolCn+4koEfNS?=
 =?us-ascii?Q?w6RxdEA2HbjIynx/VFo/i4TBzqiAKTa35e5iUwGlGI/Etjqq2TV8u6idLtdl?=
 =?us-ascii?Q?5l1hCP3yavxpUVTVcztl7+xhhKgjzBRIgfh7VG72CLDn1Q5otfo/JwY8GOAp?=
 =?us-ascii?Q?qCzkcJbJiUualHLhMw8X25/gb8krZaCqJjM1IZvE+F4JpKUWnGwOs3SeUNPL?=
 =?us-ascii?Q?3vuHx/UZ0Rq3X6Ym8DmnU7rLcPhGpxpVg3bQERRY1ifPcB9fB6XPh4RdVrh1?=
 =?us-ascii?Q?q0ff7V3qCwAEd3SR65cRKlox+gyD5ntFwKT9pw2/qcXEF9KYewHrtx2zEb6I?=
 =?us-ascii?Q?sd+AzAYotaHCmhBFP3Cg9y65+CFWB+rKDLl0Hx7rTHlqKbsLYm3Z2V6Wl5pi?=
 =?us-ascii?Q?9jo6wrvZnBsVULCXqwlx4xhZgl+i+sS7qeV5+FfQeyFjhFFveqMvszlczxn2?=
 =?us-ascii?Q?umt7qtIzf5mGnN2G7aeENNNlnxxYwW8PxZyP8MYpC10rRVQRsPxuGMw6jokm?=
 =?us-ascii?Q?yLwnFsRYhCQJeKn1ASjWoMIcn67g8vbg/9DqaPt5PZ8IdW6JRg2nENcPBv0R?=
 =?us-ascii?Q?iVx0hfHMulyZpUOvtL28gE78R4os3hRUaO6STh60BLeLCFBTOYp2jgXsv7m+?=
 =?us-ascii?Q?uORwi+vtz2EG3++pZRZoXe8URbVN0NoQbkf5JsToSNdQI08tjlUIsHaygC/h?=
 =?us-ascii?Q?5W3Lvrnp++a5fZc+0arY4bOxAPVY1eI6NgPcUw7XOU9vzFkISLQJoQTzlwqt?=
 =?us-ascii?Q?LgNV//g5iu+7Fb4a16MvIxttGyRhdHHhTqTOOg1ViRdsfs53pfuuPYF+yTrm?=
 =?us-ascii?Q?bbrsrC5sD5PB9fP0MFxLdLKGmngc17Nq/IAs6UO2E2DGAoUPT/BYrgWBve8N?=
 =?us-ascii?Q?xRhMhxV5ymMDWSZY6rFLzajtdyEvB0Rh290XSI2Gw6FbZO57PojLtS9b/6Bh?=
 =?us-ascii?Q?2mP9QAgbMR7bN0EjhKqnsya3sNu6zF4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eb1c8d-7b60-4e48-61e9-08da21737745
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2022 19:41:43.1556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F7o922GX6RyXIIdjE3B09p3fGCkFXR7P2tuDPw+DO5kvIo8jkusHlWmUC21Kum6Zf1oR3OmESDVsbDYCDIT2MxVPLa44C028A1Yc/0CZ8/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2891
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Thanks for the feedback

> Subject: Re: [PATCH v7 3/3] media: renesas: vsp1: Add support for RZ/G2L
> VSPD
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Thu, Apr 14, 2022 at 03:26:05PM +0100, Biju Das wrote:
> > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> >
> > The VSPD block on RZ/G2L does not have a version register, so added a
> > new compatible string "renesas,rzg2l-vsp2" with a data pointer
> > containing the info structure. Also the reset line is shared with the D=
U
> module.
> >
> > Apart from this, added a quirk to handle LIF0 buffer attribute to fix
> > the artifacts on the output for both R-Car V3M and RZ/G2L alike SoC's.
>=20
> That's quite a few changes, it should have been split in multiple patches
> (one that adds the software version mechanism, one that extends the LIF
> buffer attribute handling mechanism, and one that adds RZ/G2L support). Y=
ou
> don't have to split the changes in the next version, but please keep it i=
n
> mind for future series.

OK, will take care this in future series.

>=20
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > v6->v7:
> >  * Added Rb tag from Kieran
> >  * Added a quirk to handle LIF0 buffer attribute related
> >    changes for V3M and G2L.
> >  * Removed the macro for VSP HW version
> > v5->v6:
> >  * Rebased to media_staging and updated commit header
> >  * Removed the extra tab from rzg2l_vsp2_device_info
> >  * Changed the function vsp1_lookup->vsp1_lookup_info and
> >    all info match related code moved here.
> >  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
> >    distinguish HW & SW IP_VSP_Version.
> >  * Used 0x80 for RZG2L VSPD model and SoC identification
> >  * Updated Switch() for LIF0 buffer attribute handling.
> > v4->v5:
> >  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
> >  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
> >    for RZ/G2L SoC's.
> > v3->v4:
> >  * Added Rb tag from Geert
> >  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> > v2->v3:
> >  * Fixed version comparison in vsp1_lookup()
> > v1->v2:
> >  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
> >  * Added standalone device info for rzg2l-vsp2.
> >  * Added vsp1_lookup helper function.
> >  * Updated comments for LIF0 buffer attribute register
> >  * Used last ID for rzg2l-vsp2.
> > RFC->v1:
> >  * Used data pointer containing info structure to retrieve version
> > information
> > RFC:
>=20
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1.h    |  3 +
> >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 64 ++++++++++++++-----
> >  .../media/platform/renesas/vsp1/vsp1_lif.c    | 13 ++--
> >  .../media/platform/renesas/vsp1/vsp1_lif.h    |  1 +
> >  .../media/platform/renesas/vsp1/vsp1_regs.h   |  7 ++
> >  5 files changed, 67 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h
> > b/drivers/media/platform/renesas/vsp1/vsp1.h
> > index baf898d577ec..de3685cc89f3 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> > @@ -56,6 +56,8 @@ struct vsp1_uif;
> >  #define VSP1_HAS_BRS		BIT(9)
> >  #define VSP1_HAS_EXT_DL		BIT(10)
> >
> > +#define LIF_BUF_ATTR_QUIRK	BIT(0)
> > +
> >  struct vsp1_device_info {
> >  	u32 version;
> >  	const char *model;
> > @@ -76,6 +78,7 @@ struct vsp1_device {
> >  	struct device *dev;
> >  	const struct vsp1_device_info *info;
> >  	u32 version;
> > +	u32 quirks;
>=20
> It would have been nice to make this a feature bit in the vsp1_device_inf=
o
> structure instead, but that won't work on V3M as the info structure is
> shared with V3H.

Yep, I agree.=20

>=20
> >
> >  	void __iomem *mmio;
> >  	struct rcar_fcp_device *fcp;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > index 159b68fa0829..206fe18c3c09 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > @@ -812,11 +812,57 @@ static const struct vsp1_device_info
> vsp1_device_infos[] =3D {
> >  	},
> >  };
> >
> > +static const struct vsp1_device_info rzg2l_vsp2_device_info =3D {
> > +	.version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> > +	.model =3D "VSP2-D",
> > +	.gen =3D 3,
> > +	.features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_DL,
> > +	.lif_count =3D 1,
> > +	.rpf_count =3D 2,
> > +	.wpf_count =3D 1,
> > +};
> > +
> > +static const struct vsp1_device_info *vsp1_lookup_info(struct
> > +vsp1_device *vsp1) {
> > +	const struct vsp1_device_info *info;
> > +	unsigned int i;
> > +
> > +	/*
> > +	 * Try the info stored in match data first for devices that don't
> have
> > +	 * a version register.
> > +	 */
> > +	info =3D of_device_get_match_data(vsp1->dev);
> > +	if (info) {
> > +		vsp1->quirks =3D LIF_BUF_ATTR_QUIRK;
> > +		vsp1->version =3D VI6_IP_VERSION_VSP_SW | info->version |
> > +				VI6_IP_VERSION_SOC_RZG2L;
> > +
> > +		return info;
> > +	}
> > +
> > +	vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > +		info =3D &vsp1_device_infos[i];
> > +
> > +		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D info-
> >version) {
> > +			if ((vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > +			    (VI6_IP_VERSION_MODEL_VSPD_V3 |
> VI6_IP_VERSION_SOC_V3M))
> > +				vsp1->quirks =3D LIF_BUF_ATTR_QUIRK;
> > +
> > +			return info;
> > +		}
> > +	}
> > +
> > +	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n",
> > +vsp1->version);
> > +
> > +	return NULL;
>=20
> I'd rather handle the error first:

Agreed.

>=20
> 	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> 		info =3D &vsp1_device_infos[i];
>=20
> 		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D info-
> >version)
> 			break;
> 	}
>=20
> 	if (i =3D=3D ARRAY_SIZE(vsp1_device_infos) {
> 		dev_err(vsp1->dev, "unsupported IP version 0x%08x\n",
> 			vsp1->version);
> 		return NULL;
> 	}
>=20
> 	if ((vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> 	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> 		vsp1->quirks =3D LIF_BUF_ATTR_QUIRK;
>=20
> 	return info;
>=20
> > +}
> > +
> >  static int vsp1_probe(struct platform_device *pdev)  {
> >  	struct vsp1_device *vsp1;
> >  	struct device_node *fcp_node;
> > -	unsigned int i;
> >  	int ret;
> >  	int irq;
> >
> > @@ -872,26 +918,13 @@ static int vsp1_probe(struct platform_device *pde=
v)
> >  	if (ret < 0)
> >  		goto done;
> >
> > -	vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > -
> > -	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> > -		    vsp1_device_infos[i].version) {
> > -			vsp1->info =3D &vsp1_device_infos[i];
> > -			break;
> > -		}
> > -	}
> > -
> > +	vsp1->info =3D vsp1_lookup_info(vsp1);
> >  	if (!vsp1->info) {
> > -		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> > -			vsp1->version);
> >  		vsp1_device_put(vsp1);
> >  		ret =3D -ENXIO;
> >  		goto done;
> >  	}
> >
> > -	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
>=20
> Any particular reason to drop this message ?

It is deleted by mistake.

>=20
> > -
> >  	/*
> >  	 * Previous use of the hardware (e.g. by the bootloader) could leave
> >  	 * some interrupts enabled and pending.
> > @@ -941,6 +974,7 @@ static int vsp1_remove(struct platform_device
> > *pdev)  static const struct of_device_id vsp1_of_match[] =3D {
> >  	{ .compatible =3D "renesas,vsp1" },
> >  	{ .compatible =3D "renesas,vsp2" },
> > +	{ .compatible =3D "renesas,rzg2l-vsp2", .data =3D
> > +&rzg2l_vsp2_device_info },
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff --git
> > a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > index 6a6857ac9327..e041871185d2 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > @@ -107,6 +107,7 @@ static void lif_configure_stream(struct
> > vsp1_entity *entity,
> >
> >  	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
> >  	case VI6_IP_VERSION_MODEL_VSPD_V3:
> > +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
> >  		hbth =3D 0;
> >  		obth =3D 1500;
> >  		lbth =3D 0;
> > @@ -130,13 +131,12 @@ static void lif_configure_stream(struct vsp1_enti=
ty
> *entity,
> >  			VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
> >
> >  	/*
> > -	 * On R-Car V3M the LIF0 buffer attribute register has to be set to
> a
> > -	 * non-default value to guarantee proper operation (otherwise
> artifacts
> > -	 * may appear on the output). The value required by the manual is
> not
> > -	 * explained but is likely a buffer size or threshold.
> > +	 * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to
> be
> > +	 * set to a non-default value to guarantee proper operation
> (otherwise
> > +	 * artifacts may appear on the output). The value required by the
> > +	 * manual is not explained but is likely a buffer size or threshold.
> >  	 */
> > -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > +	if (lif->quirks)
>=20
> I don't think we need a new quirks field in the vsp1_lif structure, you c=
an
> access vsp1->quirks here.

Good point, I missed it.

Cheers,
Biju


>=20
> >  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> >  			       VI6_LIF_LBA_LBA0 |
> >  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT)); @@ -162,6
> +162,7 @@
> > struct vsp1_lif *vsp1_lif_create(struct vsp1_device *vsp1, unsigned int
> index)
> >  	lif->entity.ops =3D &lif_entity_ops;
> >  	lif->entity.type =3D VSP1_ENTITY_LIF;
> >  	lif->entity.index =3D index;
> > +	lif->quirks =3D vsp1->quirks & LIF_BUF_ATTR_QUIRK;
> >
> >  	/*
> >  	 * The LIF is never exposed to userspace, but media entity
> > registration diff --git
> > a/drivers/media/platform/renesas/vsp1/vsp1_lif.h
> > b/drivers/media/platform/renesas/vsp1/vsp1_lif.h
> > index 71a4eda9c2b2..f073784e429b 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.h
> > @@ -21,6 +21,7 @@ struct vsp1_device;
> >
> >  struct vsp1_lif {
> >  	struct vsp1_entity entity;
> > +	u32 quirks;
> >  };
> >
> >  static inline struct vsp1_lif *to_lif(struct v4l2_subdev *subdev)
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > index fae7286eb01e..41bea15597c9 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > @@ -767,6 +767,8 @@
> >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> > +/* RZ/G2L SoC's have no version register, So use 0x80 as the model
> version */
> > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
> >
> >  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
> >  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
> > @@ -780,6 +782,11 @@
> >  #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
> >  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
> >  #define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
> > +/* RZ/G2L SoC's have no version register, So use 0x80 for SoC
> Identification */
> > +#define VI6_IP_VERSION_SOC_RZG2L	(0x80 << 0)
> > +
> > +#define VI6_IP_VERSION_VSP_MASK		(0xffff << 16)
> > +#define VI6_IP_VERSION_VSP_SW		(0xfffe << 16) /* SW VSP version
> */
> >
> >  /* -------------------------------------------------------------------=
--
> --------
> >   * RPF CLUT Registers
>=20
> --
> Regards,
>=20
> Laurent Pinchart
