Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BACB5510B6
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 08:52:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbiFTGwY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 02:52:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiFTGwX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 02:52:23 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2105.outbound.protection.outlook.com [40.107.113.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFE316176;
        Sun, 19 Jun 2022 23:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwmB4xy3vSmahRRGnjG6REIyi50TEpbuPGbZjXPR0CRMdFi06KMb39yRyupw+sNRjUvZgxOgOYTnDPgw4yeg5Q2gdulNAJoakGjf2km0gCMvmvCm3anDN9vkzvk9M/4q8EXyt7O1oqmrSEfp9AJohTbcpYVEnGyPiGZyCyk7y07IZJBvmB2yv64j/LBWYzsbNRcTBlMqN2l8t6RXi0KBvnhqZ+EpKKYDRfsp+tSuj7pHIRyvlx3kKFzAZBU9jl9gjI/iWIk+cuFKByWo0MzpjCkXNLUjtHzSG6TeOdWdOGTr+gDjq7zb2eaxsBsHkIrWJA+sadJOJIpCZGylJJuUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9His1pTKCYbDPgpkocRIxDuBDKgi6cwvX1p7eJ22p8=;
 b=ceEBGj8Jma8P10nzjjnda32DptVh3aeeKVxw3GWGn1cBq1vRHezwPWEQna3OqEQfc6CdqVXkNI/U+coWegRYxO8DZNqK/k1PSMQRniwm2gw5273BoqaRFF0ipYw3x69ZnAv1E+pjIYSpBbsMh/ma/i3gR5poCrGn6QlqrD1s5brKSxTdegRbTLG5hc13w231dG2G1D2Dq/KsTTyeGAB7l1iVDn364ZKLLl5clusPFCUG1AYcjxq/CJfu/OnMZmdepF8JyFkUEuxfh2U3RpxYHMWnITXDSXB6tnylqcvPRSXtYtaR2JxWIFQRW/sYChHIagOt6WDWQURKaeoE5qp5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9His1pTKCYbDPgpkocRIxDuBDKgi6cwvX1p7eJ22p8=;
 b=voKoWTw7X+6V8qv38O8nrX3J+pMDl9GjBU5HrKIH/9+7PD/l6GDvkN6T01iGIPV6WBoXegwqVReI4ByFIQ1cl8jchrruaA/c977XO+nLRHOBP3BUJeQLsg6I0RWTnsz5T8Nqzwp2gSvntg8AlAK9Dw3zHoAQwBw4E9WKi0eYclQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6671.jpnprd01.prod.outlook.com (2603:1096:400:9c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 06:52:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::dc06:eb07:874:ecce%7]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 06:52:16 +0000
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
Thread-Index: AQHYdPmHuNbRnZ7S/ke6RoqwygqEDK1X+dRg
Date:   Mon, 20 Jun 2022 06:52:16 +0000
Message-ID: <OS0PR01MB5922DF5B0770E4013F39B1B486B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0c96fc4-af02-4faa-fa1e-08da528969d0
x-ms-traffictypediagnostic: TYCPR01MB6671:EE_
x-microsoft-antispam-prvs: <TYCPR01MB6671D1D4F7028C6F8613DC6D86B09@TYCPR01MB6671.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ylYnxgSmZSydt9aweouywBAMB6D47PT7/a86JT3/ggJHg+58IRVbzRJ5fTSSZvmwzRj3tPiazj5ICFyv6WsUBG0CfjMDQsGcdVTta5nVVyRXXH9Ew5h3fVcp4S280pTnyXjixWV2TMCQxC6VVJ9rZdZrRqizyk2oNeQ0yg/nUiQG+AiWIUghOFMrz+A5NHmbYvSdmEZL/W9rnEs4yhyC1VM/kKYIXXaCWLgCS9ELL84Sw/f6exPThAj87qsSz8MPYSuip2l9XqBwJXPUE7xjyNBKqOSm+FId71qKav1cg/DFifWkMTI/xSBpztAU4kvglvmyBtD/Utgj9f/BRqZIUooUIvDENQ4Ykpt4g/ccEMOf07x5S+SmK6nrShKREZQWjJ+QLIcrL0BvvClvLiUYg0Kl4JJWUaqxyUlWmgmGBVwGWiLmSlIf+TdC6Apz1mFk0vBx2AzW/gR9FK2bsX7cdmGnc8NIGz0ebknXtRTagJv+4v8fS3XoGYbph9A/1hZXtrMUrlqiu869gBGJ6HcKSfX7u5rPPGmroTiv7lVfiLR51A8pRCvra7JBC4JYD8syXGnunnKzR7lJdRLPELIkTQORxj0azIYIhzLJJVckc54G+jcFFlLnPAtt2hHmNkE/U/qMkjZkIJj8rUYvorYJ1VipuBOkcR02V2yQkYnriR1Xid+Sdem5s/qy+yD2alOpdWC5Yf0nL7j5gP118u/cIg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66446008)(64756008)(38100700002)(66476007)(52536014)(5660300002)(8936002)(107886003)(38070700005)(4326008)(8676002)(55016003)(122000001)(76116006)(186003)(86362001)(66556008)(110136005)(7696005)(9686003)(26005)(2906002)(498600001)(66946007)(71200400001)(83380400001)(33656002)(316002)(6506007)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?76rTlycNfCB4hpVFFxkKouVBCgCqg5zXZOwMfceyTXmnpd1mJO6DipfDFEI1?=
 =?us-ascii?Q?8aEZQqCixcdd81vDScC4qpSDnXSXcfHA0ZoWTaGZtyQbStcZoB6CYb9Vydaj?=
 =?us-ascii?Q?bVYXsL1bmL2YvOSZ+9LWETApWTvc9cmMOJEae1/SGoJJRL7WENWdkzsdXXLg?=
 =?us-ascii?Q?JEteLva+D+YfHoJcJI2PePhVFYI8Ala36GP1FyB7uQ07kAJbqiUgJds/qMEG?=
 =?us-ascii?Q?A+jIXBCEBkZp4WRWm+HY1xREa8EKQebII752fLuH701pMYi/IFBIUNupqssX?=
 =?us-ascii?Q?O09IcPrrTwrrw8Snj3ldkvIlsbUGW+9WlpOCYngNJ1xgAjpCMbJWdM2HcF2o?=
 =?us-ascii?Q?uTnQhETMMf2OhMf9lf0BdwW/TYbiPXDQKMqN+8jO9PGZg5G3BWU7KPwD1z9/?=
 =?us-ascii?Q?yUU3zYcuY+55VbM4eD2vaWHZ+lfrfscD4bHD5O9LrF7EuiHMJptYLTjHcXws?=
 =?us-ascii?Q?StA+REigOPfIrpoI3HTU/wjY9SCbPXIpNGatDuw3WLP71pRkQvftTs6YL9uM?=
 =?us-ascii?Q?Sp1hV9sScnpTx0lNQf9l+yHH+Tbf+Rk4G1tVHmUhiXr7Ahur9FV1Ean5UCnS?=
 =?us-ascii?Q?mvqj6ZSAYRLMfSh5UKXvCNgvmgpDoE/u9oov8H2NDRrdWfPJolqQm33VX49C?=
 =?us-ascii?Q?INbP6qe6q6G9yFSCfP67mIXMlieBE54cVa6mL/1hBWH2f9Slrtq3+j5JFiFx?=
 =?us-ascii?Q?DfFWuB/BcbzrhIDhE4Y9IA/kn/V6HTh7E3Z7EfzqSHROhT7u6Y8bfMhMt1e8?=
 =?us-ascii?Q?ArZnBolfZqESfqwnhvodPZ/V/xHqyzojzlrkejeW5Tv9uuV37fuiXm72kW21?=
 =?us-ascii?Q?AMbhTYDvefwQi0clxhRZah81d8u3Ayb0c26hYXau0VuTPOibQlq9fa1lFYVr?=
 =?us-ascii?Q?UTXnXBIXwY6RLYJZQPbsXj9gkgNOsOERC3vuxzwdVc0JwrV0djZu178pW+wK?=
 =?us-ascii?Q?Or3QwGh/0oBjlMH/vB3PQaam0m/0T+IOqdBI6yKD3MJWlwQo+L5cX37N3WD1?=
 =?us-ascii?Q?PBO+a4kRvipSj/DWlPdS9muHsOvVEXoZXuhRxP0e9z7CkjFg+zMdDkixU78j?=
 =?us-ascii?Q?Up5ssC6p7zJn/Du44t6bpB6DoeeiuuY5Ie3SwP9CHJLTAuUMcsisIoXQj7Oh?=
 =?us-ascii?Q?TKh3mqnWDvdOF1aA7bDlFuY9V2tAQU8PtODSOPFkZ0a54QfFj4ejlIcBcU6o?=
 =?us-ascii?Q?BOI8DTw2Jk9z+vLudXWgLdgumCy5UCmthay+xTePKhciDEXELmBHHk3E0+oH?=
 =?us-ascii?Q?04ZZRizpNQgl1v/ttwUcwpLJfGF/E8mjGJcGL/RFCPuXx4Qz0PXIYZOpsnoZ?=
 =?us-ascii?Q?6STAu87zhIcVJBsWGpvCNoCyZp2tqF4+r6vQpdBSrusQvn54OMckQRFO5GTT?=
 =?us-ascii?Q?+b8AsIXlviY76tZx+sC9qFBbD5L2MEBBi/muE/LmjwBYRTYbaDqqLQNclf6J?=
 =?us-ascii?Q?M0zTlFKQ2GhoDOWxOFEh1efCuwqW5NoSiEuguLYC/KFM7KF+ykRxThw/XmtS?=
 =?us-ascii?Q?HxDSwrJ8+Deg9fLsAphkJfdKETvO2GaHsomhrROhzRautF9sb1ZQUkBd5emv?=
 =?us-ascii?Q?DZYH10pe6pvc1elZYYgUlQWg6Z81OnDCDo0XzfdHPYsIXW6xeHEE14ci5gCi?=
 =?us-ascii?Q?UB/iygSRKdOEKRuKtEhVDAhD97vP7c0EsSx812VMpy+OTooRtqzicF72Hgle?=
 =?us-ascii?Q?RKeYYSbrRDA0vIW9U/Qd27AJei/IOFs/UBK9Id7n0AGp+v0U7YMOYNAdsHV+?=
 =?us-ascii?Q?Cr8at5skdwDdWIH3H7xxBnCynsnysqM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0c96fc4-af02-4faa-fa1e-08da528969d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 06:52:16.5022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BIGdvHvJ0EvdpouUxsFZQQ8rllXnT4xLYjxRocuXpDzFQ67cG2xbnweq3LpYOhrSSOYSuf++TEJR0EMKNWcYtp9fwnbz/C1+r6QEyoDECKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6671
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

Gentle ping. Are we happy with this patch series?

Cheers,
Biju

> Subject: [PATCH v11 0/5] Add support for RZ/G2L VSPD
>=20
> The RZ/G2L VSPD provides a single VSPD instance. It has the following
> sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>=20
> The VSPD block on RZ/G2L does not have a version register, so added a
> new compatible string "renesas,r9a07g044-vsp2" with a data pointer
> containing the info structure. Also the reset line is shared with the DU
> module.
>=20
> This patch series is tested on RZ/G1N, RZ/G2M and RZ/G2L boards.
>=20
> v10->v11:
>  * Added poll for reset status in order to avoid lock-up on R-Car Gen2
>  * with vsp register access after deassert.
>=20
> v9->v10
>  * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}
>=20
> V8->v9
>  * Added Rb tag from Geert for patch#3
>  * Replaced break with return info in case a Model match is found and
>    removed additional check for non-match case.
>  * Used generic check for matching SoCs with LBA feature.
>  * Replaced the code comments RZ/G2L {SoC's,SoC} with RZ/G2L SoCs.
> v7->v8:
>  * Split the patch for adding s/w version, feature bit and RZ/G2L
> support
>  * Added feature bit VSP1_HAS_NON_ZERO_LBA to device_info
>  * Added .soc for RZ/G2L
>  * Replaced the compatible "renesas,rzg2l-vsp2" -> "renesas,r9a07g044-
> vsp2"
>  * Updated Clock-names to false for non RZ/G2L SoC's on binding doc
>  * Added Rb tag from Laurent for bindings
> v6->v7:
>  * Added Rb tag from Kieran for patch#3
>  * Added a quirk to handle LIF0 buffer attribute related
>    changes for V3M and G2L.
>  * Removed the macro for VSP HW version
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
> RFC:
>  *
>  *
>=20
> Biju Das (5):
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G2L VSPD bindings
>   media: renesas: vsp1: Add support to deassert/assert reset line
>   media: renesas: vsp1: Add support for VSP software version
>   media: renesas: vsp1: Add VSP1_HAS_NON_ZERO_LBA feature bit
>   media: renesas: vsp1: Add support for RZ/G2L VSPD
>=20
>  .../bindings/media/renesas,vsp1.yaml          |  53 ++++++---
>  drivers/media/platform/renesas/vsp1/vsp1.h    |   4 +
>  .../media/platform/renesas/vsp1/vsp1_drv.c    | 104 +++++++++++++++---
>  .../media/platform/renesas/vsp1/vsp1_lif.c    |  12 +-
>  .../media/platform/renesas/vsp1/vsp1_regs.h   |   6 +
>  5 files changed, 145 insertions(+), 34 deletions(-)
>=20
> --
> 2.25.1

