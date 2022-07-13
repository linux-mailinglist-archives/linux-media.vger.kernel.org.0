Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0611A572DDE
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 08:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiGMGFq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 02:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiGMGFp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 02:05:45 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8059B9FE14;
        Tue, 12 Jul 2022 23:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7Dx9Xe67ahqo9D613kOZGYETHGZvAwZVumDgSPLXPzUvxYfbzL8MIex20UGj/bO2eePzIGgsM3qgHAp7vZdX9pxbPiMPUxkMPRBTchskmafXU9vkWDkXhe7TQCfgvcUaLaCq1TyGi8+DySpuVCpSw8HpjSTlTl4ikI+BoJnQHVsjaAxDMAXM6EoVBJdYJ9mPOSPP2ko/+qdWVjFa5hNjYhR/RiWtGZTy6uAn50hIgf4mdREdV6S7n4XgbBll/5Zc08ZF8LfgTmKefcOIea0NsBDm+DyZTv2ZOk+cHq3m+59M8wywq/DHIm4u3JG+y87Jbh43uUmuj75zfbGSrXVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sawRbK5Vv8ZoJCTVemLduytNoH9c/C4sMslTFWiXl+Q=;
 b=UKRtsuviNbnKYSsAySShZA/804fH3c4yvF7AE4ZxzDT2ijsyKKhZRpnyaG65MDmYQKI8VH0a9Z2VHUz1MFqZtl/YZCc/IU2NzskjMQiEiiS4Gpjp18SS+yM2O4WXH+o5Ys19GtFOa78sNbvtA7Gc3psc35mmZOAL34ykPTHWglG4Ku7ZlPgsakafFEIJ+vSCyPaU3yOW7J402JtB0V4Z500AjkrSIAQqHSCy5M7CrIiF+NWNsBJ6NUzTCt6seeRxHF2/3zndhU0fUFQGAdC2UvLv8Ob2dg9Mv2JTkpAocXq6m1W5J/LVsUHUYajB4ynTOLU14763cBMZv7bH1qCd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sawRbK5Vv8ZoJCTVemLduytNoH9c/C4sMslTFWiXl+Q=;
 b=usSSNZfroSKXkNQG4I/bAyrPcmZVzBYCkzj2o9W7O6WJY/uMF/DNAHV2QoWWw6LtzKGn4VpYnx+/+lz2ZPR9PdhNJ4Gpjblxa/rgD8xk7+LWaGBmajC7PlDWvujjUAxnqCNVj/VszmnPuNCnQGl/63GkCqbgPzWdJIS/gpCKJyw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB3372.jpnprd01.prod.outlook.com (2603:1096:404:d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Wed, 13 Jul
 2022 06:05:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%8]) with mapi id 15.20.5417.026; Wed, 13 Jul 2022
 06:05:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v11 0/5] Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v11 0/5] Add support for RZ/G2L VSPD
Thread-Index: AQHYdPmHuNbRnZ7S/ke6RoqwygqEDK1X+dRggCQX85A=
Date:   Wed, 13 Jul 2022 06:05:40 +0000
Message-ID: <OS0PR01MB59225195900E8E6FDDEEEDEA86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922DF5B0770E4013F39B1B486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922DF5B0770E4013F39B1B486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db5282be-fef6-46bc-3484-08da6495b6be
x-ms-traffictypediagnostic: TY2PR01MB3372:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sncujmnYvUcIjbY1ClVq90H+aMseP53tT0h1xUDLDgfog+w1kDPYPSHCoftubrIczqWeMT7nxjoPstcV4Rrm3BXDvA41b4P1iR2K22klSI21xtaEUJlxUx57DtiFGc44cMU8kFTIpS71DMn0b0sa4XKsx4QLrtubO7a1oHeNUEynAfnDMhmLcrkl8xSx/H3zUjZk1RmS0Le+4Eg+7WD/vAWGwWD6iyqTAuZIgV6BuWkDTSG7i5tb51EKiu3XnwV598rpCkvDft5Wgj03VVJ19MpDJ1+cJWXu2iGxFWbDEP+m9T4gg+zZDt+pmgaM51bQ9brZ2loFUY7xNFQSeCc85yOW/jJWINHryWzJb+/GI2UJDwv8yxQxJStmJjpk98kkl3SVIJU4zDQLyzMqpITNYK5p8bMoNhXEBZfP4WltqOcHaAg7pMzWoLNHLs4SV5FfT9JEMIji3rFRyBuWN0MA2ICVFOslaEzjElimqit2t8d/O790Ieon4WIOT7T9pRDp8TcqLqgm0LdgXZo0mF0Y7pZ750rScbUfbHp9AiRxyM7+mhQ5+NoIiIwKb/4G2/8nz8PefYqIlk0woeO5UvU7LsYHbGFjbenJZFvPOocpGyGkHOPywXUYvK5MNs72srqpBKLavoB/375vTKYe1G4eDE2P1Kd1BANdMQzLgHg1122zAiRjaZPXZEZ/oBCGAW1dSJXEh5s6dMhCZU7Q6gfscyv9LtoOFV9JAWDYm0piLKxZElkorroYMDV5BM29LTjnzapzA88Q1eprhJ69ri3nlyQLl+NlbV6dhOA+fyNsUKnY79E/9UvzKktud53MQSWl
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(7696005)(316002)(52536014)(53546011)(54906003)(55016003)(6506007)(5660300002)(2906002)(26005)(33656002)(41300700001)(38070700005)(478600001)(9686003)(71200400001)(110136005)(66946007)(107886003)(66556008)(66476007)(122000001)(8676002)(83380400001)(38100700002)(76116006)(86362001)(64756008)(4326008)(8936002)(66446008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BOepcmC5eUw2pt+mDd4yv9TAquNi0AW93c6aAG26Oa3dNAJgF28yH5WXgwBJ?=
 =?us-ascii?Q?LpgyrtxyqQlZIcWYbTtTsoTpJYXGyW5QZyBfI1jqQAAa5wwjEpA2uy0eSwab?=
 =?us-ascii?Q?6n6NQyph7/GfwnrzaYYIsGadxxUv5fE7VLSd3sxjWqckNIDTWa04PaJH+n56?=
 =?us-ascii?Q?kJTWZp9s/NN/LmaxU5f3Ns1D77NGWTkBWIHsBYrojGiR72G1F9BPZKnNpWTh?=
 =?us-ascii?Q?VuRQu9jbPxvQy6ZUTNGcWzhzZ9rSKx5SQOFOogm1R5DSILgrYwj5CkG41JwB?=
 =?us-ascii?Q?MrMK9TdFKgAeBRFn3ucFEagBTN7T2LaV0TLffD3P2Ekj5Uecy/P0h+Ncl5XY?=
 =?us-ascii?Q?X+pptBgJTybw9MnOjReAtoUiZcfMeXigJ6l6O8HpMqHAmlJyiqqrywuePcii?=
 =?us-ascii?Q?srA8u2m9/IGTXTGO0Q7Hl9rK5CAghM9hgAMX2WvWDIxCQMWe6I0WAteJFWhz?=
 =?us-ascii?Q?k7JEmYaQLGP7/V0zecgLGMpzKB/CC2Z8bDaAFyOWum1OvdaCzTmHRPTGiXvy?=
 =?us-ascii?Q?PSgEDmJTrlUIAVItrmxOUuKbWaHanHQ+YuMp0BARBnEtl/Pa2hJ+GLYLF8am?=
 =?us-ascii?Q?rCjwWKSP2EKJTJ6HNhajvk7FAyoEIspzUrZeSq1WfmlfT3vDki49tItiu+ZC?=
 =?us-ascii?Q?qlzz8ma0K5wBk3SkjdbuxJjLN6c1bIDzHSQft/xVWQqXapH84u1JA0PvtTDd?=
 =?us-ascii?Q?Nw2+JFP2EAfYPxMxKa1MBFtM8m51JsDDSyQdS+pGOqEFHnKrwWjP7oHWfFUu?=
 =?us-ascii?Q?2YNyFTpAP5AM+hyiFdYfetN6R8SNa5QJkvVmG2ToM0odhXZ4iHnau+azGn0d?=
 =?us-ascii?Q?NyG6lMWrlaF/dGhtu9+HkTIc50fI7cu6UyeuIHnMwLKt2ykt+XFxAM2Z8h7P?=
 =?us-ascii?Q?fDllwrjGc5C/evWHwmJxzESKMsnneWlhf/BFenHJxXEnHjgiunjVZu1wXKvz?=
 =?us-ascii?Q?6/WRhlTE7kkaHBlVBDh4u6BUrRn2tWy/0gd3aauXwFoI99GR6awiQfz3JaOw?=
 =?us-ascii?Q?vefHzGrYnxJg7gwOFoGTHpEhGq5MMNDXpW4KH+vEMLdfgA862vO7dGNEL3Mv?=
 =?us-ascii?Q?KgJ+SIlKliIX/9nQ5m8lChS//RO2arluzty4f+5ghZ0NAS1E+URUwswgpz/O?=
 =?us-ascii?Q?NwRpdgOsh3QB5IteZBiOaSwcqhX4UrpzAX3ybuJWuq0h1ODh2lJxSNzeZwwU?=
 =?us-ascii?Q?kXAazQd+73Du/p0EiJ5GRN/AYg0qMbODCv1+2tmhRq3Hmy80u7thK50aBTcc?=
 =?us-ascii?Q?CVbk/RdAZ5T5gddsdFy/Ollx1jhZlDYPRQ0SxTrLUphtoLd4cgZUncGxegNZ?=
 =?us-ascii?Q?2fCrcGt8RW6/MISyN2Drm3FrPC8rix90mFfcmstQXwDFcA7zkC07NTJDnJgZ?=
 =?us-ascii?Q?l/c2C7ZX+ntVJq0UDMTJOvNeDXQfm7XbKTe3KRLZ+uJFDo6dxKYLvP7P211p?=
 =?us-ascii?Q?1kyhJy5SKrWaZjwXSqP9vG0/lolnwZpYIHYoUKbK4YmHBCZaZrG9pMVJs4jU?=
 =?us-ascii?Q?MV8eyHNcqIBALgdn+Ph9nQXTC+n/dLX2kqua2As4A32fuO6ezg7lrb2lMD4l?=
 =?us-ascii?Q?x51ksF10n/aEX7UFXT7sTcXPZDxo0cwpGzCdZ5TRn8Vm0thTLnqgSr+/mOrJ?=
 =?us-ascii?Q?eQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5282be-fef6-46bc-3484-08da6495b6be
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 06:05:40.4544
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SVc/XG/mkPr87flmdjU6VhAJh2bHdfYTHpooqTf2aGQayUAJolgIm6Ej4zM1mJxr4CFtl0mtYlcXXZvUFmRgwcMbTs6Nnu0xNFzskCeB7dQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3372
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro, Laurent and Kieran,

Gentle ping,

Are there any issues with this patch series for acceptance?

Please let me know. If needed, I can send new patch series/follow-up patche=
s for the suggestions.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das
> Sent: 20 June 2022 07:52
> To: Mauro Carvalho Chehab <mchehab@kernel.org>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>; linux-media@vger.kernel.org;
> linux-renesas-soc@vger.kernel.org; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Biju Das <biju.das@bp.renesas.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: RE: [PATCH v11 0/5] Add support for RZ/G2L VSPD
>=20
> Hi All,
>=20
> Gentle ping. Are we happy with this patch series?
>=20
> Cheers,
> Biju
>=20
> > Subject: [PATCH v11 0/5] Add support for RZ/G2L VSPD
> >
> > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> >
> > The VSPD block on RZ/G2L does not have a version register, so added a
> > new compatible string "renesas,r9a07g044-vsp2" with a data pointer
> > containing the info structure. Also the reset line is shared with the
> > DU module.
> >
> > This patch series is tested on RZ/G1N, RZ/G2M and RZ/G2L boards.
> >
> > v10->v11:
> >  * Added poll for reset status in order to avoid lock-up on R-Car Gen2
> >  * with vsp register access after deassert.
> >
> > v9->v10
> >  * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}
> >
> > V8->v9
> >  * Added Rb tag from Geert for patch#3
> >  * Replaced break with return info in case a Model match is found and
> >    removed additional check for non-match case.
> >  * Used generic check for matching SoCs with LBA feature.
> >  * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
> > v7->v8:
> >  * Split the patch for adding s/w version, feature bit and RZ/G2L
> > support
> >  * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
> >  * Added .soc for RZ/G2L
> >  * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-
> > vsp2"
> >  * Updated Clock-names to false for non RZ/G2L SoC's on binding doc
> >  * Added Rb tag from Laurent for bindings
> > v6->v7:
> >  * Added Rb tag from Kieran for patch#3
> >  * Added a quirk to handle LIF0 buffer attribute related
> >    changes for V3M and G2L.
> >  * Removed the macro for VSP HW version
> > v5->v6:
> >  * Rebased to media_staging and updated commit header
> >  * Removed LCDC reference clock description from bindings
> >  * Changed the clock name from du.0->aclk from bindings
> >  * Added Rb tag from Laurent for reset patch
> >  * Added forward declaration for struct reset_control
> >  * Updated vsp1_device_get() with changes suggested by Laurent
> >  * Updated error message for reset_control_get form ctrl->control.
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
> >    for SoC identification for RZ/G2L SoC's.
> > v3->v4:
> >  * Restored error check for pm_runtime_resume_and_get and calls
> >    assert() in case of failure.
> >  * Added Rb tag from Geert
> >  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> > SoC's
> > v2->v3:
> >  * Added Rb tags from Krzysztof and Philipp
> >  * If reset_control_deassert() failed, return ret directly.
> >  * Fixed version comparison in vsp1_lookup()
> > v1->v2:
> >  * Used reference counted reset handle to perform deassert/assert
> >  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
> >  * Added standalone device info for rzg2l-vsp2.
> >  * Added vsp1_lookup helper function.
> >  * Updated comments for LIF0 buffer attribute register
> >  * Used last ID for rzg2l-vsp2.
> > RFC->v1:
> >  * Added reset support as separate patch
> >  * Moved rstc just after the bus_master field in struct vsp1_device
> >  * Used data pointer containing info structure to retrieve version
> > information
> >  * Updated commit description
> >  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
> >  * Defined the clocks
> >  * Clock max Items is based on SoC Compatible string
> > RFC:
> >  *
> >  *
> >
> > Biju Das (5):
> >   media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD
> bindings
> >   media: renesas: vsp1: Add support to deassert/assert reset line
> >   media: renesas: vsp1: Add support for VSP software version
> >   media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
> >   media: renesas: vsp1: Add support for RZ/G2L VSPD
> >
> >  .../bindings/media/renesas,vsp1.yaml          |  53 ++++++---
> >  drivers/media/platform/renesas/vsp1/vsp1.h    |   4 +
> >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 104 +++++++++++++++---
> >  .../media/platform/renesas/vsp1/vsp1_lif.c    |  12 +-
> >  .../media/platform/renesas/vsp1/vsp1_regs.h   |   6 +
> >  5 files changed, 145 insertions(+), 34 deletions(-)
> >
> > --
> > 2.25.1

