Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2766F5006C3
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 09:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240302AbiDNHR5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 03:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231537AbiDNHRy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 03:17:54 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFDEE2CCBF;
        Thu, 14 Apr 2022 00:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcKV97s2hSHWWUq3gPDoF8nmz7rLxnvCNj9GhFCS9TNdp16xzA+Hc5A2BxGdBYLJyiqiOMK13iudo8gt9iw2WJ9EZfYzMPrvk9Xu5AtOF7qTlqZ41cLMcoT4YtgUfJltpmK67n420NZMaxajHilsdHtPYuafttNMdC6xGUOP80pWs6M/AfJt5U9F7mGAIyI4m3IWhGbOsw/CpVbOwDnfDtzPMC51Ngrh8YY/KLIDKlsYK1nfXuwzTgDxrJ11cxUX661mF7Jl2ObFQtQQNIUvOqQSgUYH7YlBaMZxSSN/+9sao5W8NgG8o4LDty0YXxm4bYjkCiadPPd5gVwIBdPqOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBMZI4wIzXPC+4ZY+Fb/bcy9K0I3x0Mb3IaDc5s9JT0=;
 b=Xwfd2m5HbCaDY/QX5MEXQwaKGDiUuPIZEBaFC9jkIDgZBd2mIOwLe6eTT21E7MLbm8znF2ChzJlw3Z9azeJsccOVOKuMR8gqdagmQ2bwIJNgTCDQjMg9V50xSwD2ZsPSw8zETroronlF6zPWzQLr9BElM0AqN9ue9mKeTWd7aTpECJTQ1ndS5+ybjs2lmSTZcEdfdhhRtnjwKYMq7fUmdxCLa7jHvaewSwEPDZg+GowxIW+CLsi1z2mgwdjqD7M0sRIm42oUtaGylzH50jkQhYBn0b7hV/lcnP4VAYTsfBmj9ErA4d+E5CF4fV35jo6aSxdPlqwePrNxZo+eb7dLKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBMZI4wIzXPC+4ZY+Fb/bcy9K0I3x0Mb3IaDc5s9JT0=;
 b=C4XH+fxfTubH2g2drOqT8zEN5wRF1AnMDORv+dL2NA5pxebQr1L/IXcxf2cZc0Zv/Av6pjaJVTCQu+9mRm6n8BvHs1YAgUkebNFrycPVWtXZC6c16X9j0Mq3wUDJsR/qAgMocWz7WdYakTuXjv0F7aGMKbY/9F921KD/tIewENM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6544.jpnprd01.prod.outlook.com (2603:1096:400:98::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 07:15:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 07:15:28 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 0/3] Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v6 0/3] Add support for RZ/G2L VSPD
Thread-Index: AQHYOSzOWkSeyC0UaEqXiLOqs5Yt9azvK/Wg
Date:   Thu, 14 Apr 2022 07:15:28 +0000
Message-ID: <OS0PR01MB5922E8D86A13066800323DF186EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ed07fae-a08f-4fda-8499-08da1de68de6
x-ms-traffictypediagnostic: TYCPR01MB6544:EE_
x-microsoft-antispam-prvs: <TYCPR01MB6544F68199471ACE6F8590E986EF9@TYCPR01MB6544.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EdBeZh/BMXoNvU7DaVBYkNHdyl9vl4/ZcAnKVGF3W32DsWetjTYEdMZykRJmh2gtoBbQPHCyLaQxMT+KgnliNgushzHQAgOYHqkowuWLoGDYNa8/SJaOzcsWd5VoVIbjdov+HsGfxU1GEHy/VVW7umaWp/SkVCg8FXKefR6t9DPq7pegkef8TlCOV1fOS+i82cpBOdFPfCAVSSObhgQ1Vjrtpclu0EqtFfKHKfRKgY56hZm1yWDkZA+7mSSM3SJcZf123tOQWSFwz8Bz+ZeR/LkfwOoR2UMhZg5JIFBFrd5VNP1wKjskzGjR3VOjl1quZKhabOiT7dCN8Al93bfM+1J8FixeChrmBebUWU3FvMjgvp4ajNvMIPiatDcjJgjWpX8pMh00g+wJ35JzMpdZRvJhAypRAv8E2vsGYxPzegHNcs2oAFGhIBZZ5I5Jj7vOu2tJOIrxVe4LmRZoQzGlHTZc08gFVeGo+fBH7jBe4IYkjVVwo42u79TZglds6ExMHjzuVIBSI78PSLOpnmx3U91rRuyxDcK667NwKSBW73vlTinfUI8O/VjRp1M76aTIHI1pAwFgXIuw/0AFbUwG04jaAFF7qw2apORSxrIupwvFSRW3g2ykJyEF1OOvlo8z6QEBgsnXaZ8W5vpyqQPv1GRzHgVK+PkVhWSihL8m33rYOvHyuj6lJwSLXGUQ25Gfm82G5vVBHADq+D40j+QT5w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(54906003)(55016003)(110136005)(83380400001)(2906002)(38070700005)(76116006)(8936002)(66446008)(38100700002)(6506007)(9686003)(7696005)(86362001)(316002)(5660300002)(26005)(122000001)(186003)(508600001)(71200400001)(66946007)(66556008)(66476007)(64756008)(52536014)(107886003)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?awBGOAEElv0y13wL1W3yeOdUiAW2HN0LGX/QKpl5Afqy8gZ3VayKKLDQAAJB?=
 =?us-ascii?Q?TgF3LCALQtqgYp9V0J4w1Dy6Ar+xWMScuHdOv2ccs7R+/VhvZjQY7QKaTCza?=
 =?us-ascii?Q?kzNPJhpIsJ1Y2DbZCxM9DRUFOjfqoI5/XxgNa+e7Ad471jQEOZe73fMT57rq?=
 =?us-ascii?Q?FCpRzvuqGtq3tiSQF435qxS0kqNk5qZ52W6awug3XTz9XZtKkBZlcKoUIW6U?=
 =?us-ascii?Q?N8SqShMT7/lL8ryxt508dtczi2LqJ9taabe5O7VzBaYi7ihcrWjayrUy1PoZ?=
 =?us-ascii?Q?MFmL/mFXvW7TPu5W98FAvqZpy513CMTefCaKvtUYDLNc2+zNzKEMNH1tWstu?=
 =?us-ascii?Q?JMOdhW+CmQXCxBk2jhUNNH09RijweaaI3jPfOd5IQg/xot/8cVyHAypI5wzS?=
 =?us-ascii?Q?OZuzFcWRf5wBEzDVj5G0TZdTsmLUctn0c9ylX7vFwEv+74zt07eiFB7+BVby?=
 =?us-ascii?Q?W0/xZG/ILFTZnSPor0/djGvwv1X/7qyTai5e7y4mFlPljrGur9k19IpyWF/w?=
 =?us-ascii?Q?A4tS7v6ks7qgsuc+qPqxQWiqmfFAxccQwPxlnPU+v0UAUnJpAp8nGFEblaJp?=
 =?us-ascii?Q?dUGj3yvU+1V4yZ58FRDVWmEWu42FHgkAt+fRPd2pBCo9VPX8cBtZ3zcs3Xz1?=
 =?us-ascii?Q?kJwK/UGOWLhq0HbTbN1yefARPKdvjR5aZFpZ70kLboqPvc+Uaz9HexbhBI2U?=
 =?us-ascii?Q?UVcNKUeycJ90fOCkfR2mNE5HKIWSSxcfwNbn9AV6feVufAo+pfIHAKaxHHF4?=
 =?us-ascii?Q?oBtXTIgInTXPtX23tAU/6BtHagxMBQL/g6BS88aNXT5JNN2MOkmSPg2aRzvg?=
 =?us-ascii?Q?q9bi6BNQhQQR1o5pdDFlSiw8lWVEGHj9q5QG805wEu+TOLcR8S99Q5nSATku?=
 =?us-ascii?Q?fBBX2kPHRaZQBb1ONBjgupGHXNNnW5CNB+rMiB6hO2UOXXhr7MVAgeI/P5+4?=
 =?us-ascii?Q?kIb5jh7yKTjQraEo3/8BYt9UpZadr1f8jeHAJchPw97X+YiEDHirBu8ZvBaO?=
 =?us-ascii?Q?gZVnm6gk7rOO5JIO5QchNO3LlLwiQiVkqMogP7ceqFr6FhmZ5A0qxNKk0/QB?=
 =?us-ascii?Q?R+oI1UyZb59OlD3Tahb8TliWpMBjyY9sx2i1UIS5mFaic5spzaheRM4iWY9N?=
 =?us-ascii?Q?yxaoKanGxw5r0VxAON+50DITIa71fLJnbzPFRrDdi+2Zh+3Er7E/RPnsgN4n?=
 =?us-ascii?Q?NhL3/tR+r4i9uUMf9HOT7mCtD24eXilGY+EwIie1FLpsnRWXm51ahm4algRG?=
 =?us-ascii?Q?arsJgMJfJG/Mpc6AN44dywSGWInAAbBjbhUMiyfLANky/lZvKatwYiwdQckF?=
 =?us-ascii?Q?ttRddPiS8Ho+P915laIN6AHEV8Tonc6911Z60KODcT0lDKbDTtbTqKt+XAX+?=
 =?us-ascii?Q?a95pZ74frhoHuh6Z04nX08bcw31Ci1I3q69nyDR5HxgAhDqF8CRpW/uJbXmz?=
 =?us-ascii?Q?/zXqMSRIHLvriX/oNlufnz2DgyyYUq/nrCVm/aNLjeGagkXMuwifDqLKiZiX?=
 =?us-ascii?Q?eAjQcffEj8sDUQa/YBVlSWMauGkekxBaPzA9a80rBrAbDFuZlx3lAEDIvlUS?=
 =?us-ascii?Q?eoRiMC57C8CKYyyaEuK4iZlFxsdKwiYYo5UeN+ArQw+gWFLjTO8jjCxDME8S?=
 =?us-ascii?Q?m0c7Mm/g5qG9V8Yk87a9cm5nKzwNZhP66fLvwxmXSmYWRQrt65w2M+9txutZ?=
 =?us-ascii?Q?JxsJ40RjjeXy/JvfirPI5zQ6xw0s0YhxPp0AAtALh4G4uyfSHVrm0FsCMgWQ?=
 =?us-ascii?Q?TrUUbGewv/P+qP+dRRBHTzEa2W4Um8k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed07fae-a08f-4fda-8499-08da1de68de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 07:15:28.5943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dnZRQhJtZb0ea0yTPXVycHNFhhUQfaV855a/PTU1+HpyDFrOjfQ6bQurYiEpLq70+3y06OrbV8koNHTRWqNcnLPlBR9eroPjKZX1hiQDzWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6544
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch set?
Please let me know.

Cheers,
Biju

> Subject: [PATCH v6 0/3] Add support for RZ/G2L VSPD
>=20
> The RZ/G2L VSPD provides a single VSPD instance. It has the following sub
> modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>=20
> The VSPD block on RZ/G2L does not have a version register, so added a new
> compatible string "renesas,rzg2l-vsp2" with a data pointer containing the
> info structure. Also the reset line is shared with the DU module.
>=20
> v5->v6:
>  * Rebased to media_staging and updated commit header
>  * Removed LCDC reference clock description from bindings
>  * Changed the clock name from du.0->aclk from bindings
>  * Added Rb tag from Laurent for reset patch
>  * Added forward declaration for struct reset_control
>  * Updated vsp1_device_get() with changes suggested by Laurent
>  * Updated error message for reset_control_get form ctrl->control.
>  * Removed the extra tab from rzg2l_vsp2_device_info
>  * Changed the function vsp1_lookup->vsp1_lookup_info and
>    all info match related code moved here.
>  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
>    distinguish HW & SW IP_VSP_Version.
>  * Used 0x80 for RZG2L VSPD model and SoC identification
>  * Updated Switch() for LIF0 buffer attribute handling.
> v4->v5:
>  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
>  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
>    for SoC identification for RZ/G2L SoC's.
> v3->v4:
>  * Restored error check for pm_runtime_resume_and_get and calls
>    assert() in case of failure.
>  * Added Rb tag from Geert
>  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> SoC's
> v2->v3:
>  * Added Rb tags from Krzysztof and Philipp
>  * If reset_control_deassert() failed, return ret directly.
>  * Fixed version comparison in vsp1_lookup()
> v1->v2:
>  * Used reference counted reset handle to perform deassert/assert
>  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
>  * Added standalone device info for rzg2l-vsp2.
>  * Added vsp1_lookup helper function.
>  * Updated comments for LIF0 buffer attribute register
>  * Used last ID for rzg2l-vsp2.
> RFC->v1:
>  * Added reset support as separate patch
>  * Moved rstc just after the bus_master field in struct vsp1_device
>  * Used data pointer containing info structure to retrieve version
> information
>  * Updated commit description
>  * Changed compatible from vsp2-r9a07g044->vsp2-rzg2l
>  * Defined the clocks
>  * Clock max Items is based on SoC Compatible string
>=20
> RFC:
>  *
>=20
> Biju Das (3):
>   media: dt-bindings: media: renesas,vsp1: Document RZ/{G2L,V2L} VSPD
>     bindings
>   media: renesas: vsp1: Add support to deassert/assert reset line
>   media: renesas: vsp1: Add support for RZ/G2L VSPD
>=20
>  .../bindings/media/renesas,vsp1.yaml          | 52 +++++++++----
>  drivers/media/platform/renesas/vsp1/vsp1.h    |  2 +
>  .../media/platform/renesas/vsp1/vsp1_drv.c    | 75 +++++++++++++++----
>  .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 +++--
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 ++
>  5 files changed, 121 insertions(+), 34 deletions(-)
>=20
> --
> 2.17.1

