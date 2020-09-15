Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 769B326B137
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 00:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgIOQV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 12:21:27 -0400
Received: from mail-eopbgr1300113.outbound.protection.outlook.com ([40.107.130.113]:40695
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727536AbgIOQT4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 12:19:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6WkLbHTB5hkzOSdhvlWlEo8GiTmkU8N1YrMaXMy6RmBO12oiigxMDXbfjWbydS+kmJQsQ8ITkN+THzfDiwT5DKzXkIANf+SwKdQMVeNQA2f8Mt3UjRmOv9L2nS5umJESMayN8HVeysZv7aL0VKHLu+IOP+Noa8yFJAbe26yVfnxg/5uyBly6fBJvseg3oJdxCCCNau05wis076FjZiFPAunNM6uFcWujfSClI4AdkOeADFUdRJtjYMa+MkzobBqimp5V/jSCg9yb03PXFKWzcKGZi2Cx09eLul1xabDv03Dc/OZxzcs4X4QuwZzgEnVlq0EgpgjnB49xgq//xczgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WXC/eEv8pmqTn32Y3/YxyZYwp/3cGgRo6f2ckDlo4E=;
 b=An1AT7Ocl6nY/xFRTJdjD9KGcDAH8X2H8ed0Ku1E14BsJ3qO+1YrT61oP2/UEZF4hrRKXO6oqXbsvnVXrPmYNznlcjZmVVPYe00XgP6gScuZk56+3Rvo7hzOeXFCr3svroV2QyhHEM31YKt4Y4jRZDj1iewK++l9WTf5vkPaarE/4M9jPdOO9UiIh1UXISGcVFwRt8r+CKg3PBbgcr3kxphkGulssgUi1Te7UfvyNYYwztUYYPt5YTlsP3TjJ7Dvckc7vCH8DgEWnkLZtkxj5Drn/I/aOCcl7WpHFbuTUCQIWDT/u4EP63bDENA2YnpiGs88P0cLHS3a79xSq+SZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WXC/eEv8pmqTn32Y3/YxyZYwp/3cGgRo6f2ckDlo4E=;
 b=FNesP2A8NhV9AW+ikSjmoeW4fGVoMIJaKrCJ4CglB97zrXz+THdjErA2gU430FcjtHRHHUjDSQ8qH62H0yXiaLWe7oIcWKja7PXwQX3YXz+S0yJaeMltXbqzyR9nGD1tGsTKYHYglrD2Wa10FkliTg2+0MeXfW1a6q/LxfPyFMo=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4153.jpnprd01.prod.outlook.com
 (2603:1096:404:dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 16:00:57 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%3]) with mapi id 15.20.3391.011; Tue, 15 Sep 2020
 16:00:57 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
Thread-Topic: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
Thread-Index: AQHWi3i7c0c5BpR7TEO4xjLxubn6Nqlp2v5A
Date:   Tue, 15 Sep 2020 16:00:57 +0000
Message-ID: <TYBPR01MB5309602C74A7AA57B6FB6AF886200@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200915155544.826-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 67850629-d36b-4248-5d02-08d859908898
x-ms-traffictypediagnostic: TY2PR01MB4153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4153BE18A771838363F0C13786200@TY2PR01MB4153.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YrwCJpudlKy1LXULoz1WKMIeGv7dMMfYRxa1nuOFI8xCDWMWsa/kJ+ojRuZRK6DyvUP1pg4838NN9MTbDXWIaYkWYV6IPFB3AtXFje5SXbYbRLIZ9l6XU3W6FiGuQA8PbOEY0N0/a/nQ8tb4Ou1Q5RrXCxkWsJK23Q1mzyQFJ5wMUpWhFcjPAooE4F1g32kprmYq3wRXpp47oG0y7KUlpAipMfXEkcLL4vc9JCfGOtyv7Z2tHscdR18omEX1ikAWWBx7WCKgQ3SuqGCY/rNbQNNXtZ3r/Hcby88rhGjQnwx7OOqmjyXn21/5QWtPQlskSD6W7Q9UUjujHIdc8m1t8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(52536014)(86362001)(8936002)(55016002)(76116006)(6506007)(9686003)(33656002)(7416002)(7696005)(186003)(4326008)(54906003)(110136005)(2906002)(26005)(64756008)(8676002)(66446008)(66476007)(66946007)(66556008)(478600001)(5660300002)(71200400001)(83380400001)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: y1bQgdG+AWuhmpk+EniUSfZ9Z+nzxykq8pqBOrDG8Gy1aEmg4GEOLfNGDTvoldg+e0kFmxULZmhlorYqVihSeKKFtxgzGJ94KQyXjrOYn6h/VyNiMzwWq9R3rmUNkYfVHJiuPH1q0fLBV0Dk5ui0hqdIgOCg6zGQ/SXIIdphKKnpsB+fHfq+RZHp+68PJ7KAteLzrOjfvWl+dUzD/cNa3w2xauDThd4t68PHVEQdYPLEdnw6cMaR2HS0BJJ6O1RAvPc5k+/wm9uKGyTyD+0e/U3vxqlZc8qh40IVRyMpQ97eNFsPhgI2R8hdXlhm0/3iBsu38sxKlpMlUXFkqEDX8zuwMiE90qbE2yMMtnn+qHNSD1ebWhUcGTkUEvt7t0S0sw9t1V1hjmYdS6G+R3cK8Bpb8QsFEcIdTCpj0PdJgPQ/g2R5bAVf2ZIadne2X6NFlTQsPuIeXhDLHZ0h+vf833BomdCGhbOzHn+BCJ1fiHvfRZxiqZhRNilwtTWJKRkec1qXTEpa6CJQZLVdbVNjyipL+b+hwAhWSwxq9Vx7yJi6LZq49BQHAPG0fjSWFoSjHgctjooOgferGDx8P3ghTlDFf85VrV6W2G6WLeOvM0cSqDku7UM4DF8blZ+vX86Aq7mpQ4rRsskirHMExiYNQw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67850629-d36b-4248-5d02-08d859908898
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 16:00:57.2783
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rSuQ4tr4VkRIp6uuP/3FFq1wVXtzV3gPv5mL8TJCL0OTeko6gPyXcQbnCd3fGplMMsqko1KwTwkIuRUyB158PxXncfy8nNu3fDGuEOkgQJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4153
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thanks for the patch.

> Subject: [PATCH] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
>
> With the current implementation if invalid bus-type is passed via DT
> v4l2_fwnode_endpoint_parse() defaulted the mus-type to

Typo mus-type??

> V4L2_MBUS_PARALLEL instead of returning error.
>
> This Patch adds V4L2_MBUS_INVALID entry to v4l2_mbus_type enum and

This patch ??

> when invalid bus-type is detected in v4l2_fwnode_endpoint_parse() it
> returns -EINVAL to the caller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/v4l2-core/v4l2-fwnode.c | 6 +++++-
>  include/media/v4l2-mediabus.h         | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-
> core/v4l2-fwnode.c
> index a4c3c77c1894..a6f3549eadd3 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -93,7 +93,7 @@ v4l2_fwnode_bus_type_to_mbus(enum
> v4l2_fwnode_bus_type type)
>  const struct v4l2_fwnode_bus_conv *conv =3D
>  get_v4l2_fwnode_bus_conv_by_fwnode_bus(type);
>
> -return conv ? conv->mbus_type : V4L2_MBUS_UNKNOWN;
> +return conv ? conv->mbus_type : V4L2_MBUS_INVALID;
>  }
>
>  static const char *
> @@ -436,6 +436,10 @@ static int __v4l2_fwnode_endpoint_parse(struct
> fwnode_handle *fwnode,
>   v4l2_fwnode_mbus_type_to_string(vep->bus_type),
>   vep->bus_type);
>  mbus_type =3D v4l2_fwnode_bus_type_to_mbus(bus_type);
> +if (mbus_type =3D=3D V4L2_MBUS_INVALID) {
> +pr_debug("unsupported bus type %u\n", bus_type);
> +return -EINVAL;
> +}
>
>  if (vep->bus_type !=3D V4L2_MBUS_UNKNOWN) {
>  if (mbus_type !=3D V4L2_MBUS_UNKNOWN && diff --git
> a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h index
> 45f88f0248c4..b4f630783cb7 100644
> --- a/include/media/v4l2-mediabus.h
> +++ b/include/media/v4l2-mediabus.h
> @@ -78,6 +78,7 @@
>   * @V4L2_MBUS_CCP2:CCP2 (Compact Camera Port 2)
>   * @V4L2_MBUS_CSI2_DPHY: MIPI CSI-2 serial interface, with D-PHY
>   * @V4L2_MBUS_CSI2_CPHY: MIPI CSI-2 serial interface, with C-PHY
> + * @V4L2_MBUS_INVALID:invalid bus type (keep it last for sanity)
>   */
>  enum v4l2_mbus_type {
>  V4L2_MBUS_UNKNOWN,
> @@ -87,6 +88,7 @@ enum v4l2_mbus_type {
>  V4L2_MBUS_CCP2,
>  V4L2_MBUS_CSI2_DPHY,
>  V4L2_MBUS_CSI2_CPHY,
> +V4L2_MBUS_INVALID,
>  };
>
>  /**
> --
> 2.17.1



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
