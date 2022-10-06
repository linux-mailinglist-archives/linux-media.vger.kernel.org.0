Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 236E55F6B55
	for <lists+linux-media@lfdr.de>; Thu,  6 Oct 2022 18:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbiJFQRJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Oct 2022 12:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbiJFQRI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Oct 2022 12:17:08 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3517C7CABC;
        Thu,  6 Oct 2022 09:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaR3qrx4sst+DCmDch6nfuvyjNyspW4uDWKPT0v1islLCfaLyIDRnpONnVq3oj6uA6oUkEyNjRIDs6sacmpr+4uDYTaJt/T5xH6MENFlbkKFex8Y0mp7erfBUd2l1C/lVFveqn6fPE8b+ga1FZzJIHRb5IaE2shcRTY8+lJwVb8H2t3KSrKxT+kw96qSCoS8zYk9AxHrjPw3kRvVoV1BWhzh5jCQ6hI+Yt7++XLir2st6yiw/zin4euIXkBwZVgFd/nFsYMoghyDPbGCaBM8244cXltIQuGU6fspPTjbiL0zshMM7vJuRF+FafYjL/h2Jegi63XfZE2r729YbZTDfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7o1JCnkyiBkpxWXT1YiS9Nm3ePMrfuoeJ2h59xd6oJo=;
 b=QeAHi6FyZKQF9gYCVtXR/u4OReMvgIB0xMndvba9QzohX/PsNc/skyVjtLrRXjkspOJY6zgTwP4SvIZgxacO6hytjNpgotziLRok0JIA5hqLgAxGWtzBX5F4afF5xRAUjpFIF7uV6LtBmfYSQ59M82gCZEBU+5GKjcRMZSLaKcVXb7y+GxJGp6t7JVHWHcu8EVVxKvhY8/WohQSqZ/7zWyehQUBawxXHHkcyZ6B89Dwmwm9qLC5VlXUVPAa4yjwOznj4s2is5bCjAvLFCPrfL5nfBLnaxAWeTf0BduE68KQANxUSLATWSOesLQgdDPkXJv8b4acqOaVWkFDJeebx3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7o1JCnkyiBkpxWXT1YiS9Nm3ePMrfuoeJ2h59xd6oJo=;
 b=UxqbwzPBcMnUT4T7yVuZLT4w0iSTygpb2KVIOF98w5y3k+dMQxhNNtKy/7s9wOxdJlIGTh5cjG+GwRqDmPXLnH5F0m7K1QqRCSiJD3lHs0gnu+akmxlcyGPFPu8Xc43+THwPlSiINNiR6SaPgZPKJi1eHD7+MU8m7Huaa34TQ/E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB6032.jpnprd01.prod.outlook.com (2603:1096:400:49::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.33; Thu, 6 Oct
 2022 16:17:04 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%9]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 16:17:03 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 0/3] Enable {fcpvd,vspd} on RZ/G2L SoC
Thread-Topic: [PATCH v3 0/3] Enable {fcpvd,vspd} on RZ/G2L SoC
Thread-Index: AQHYvpe/aN2OLUH7wECBDTnIW5GzEK4BwLoA
Date:   Thu, 6 Oct 2022 16:17:03 +0000
Message-ID: <OS0PR01MB5922DE44F15E6D60C627AF19865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220902064628.59001-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220902064628.59001-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB6032:EE_
x-ms-office365-filtering-correlation-id: a5d67785-74bf-4be5-667f-08daa7b634e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/8nCfe439mqgntV24uvc6DoIMNk+uT7aU2Iawbo+FhNb1qfQPUeDyzo5K6FU2LHx6TX6+ql/wr9zRXTPFsGWO8zoQg2HYxNEpJ73FPobNY+T0e5s96U//e+pMa/kp7R75aRjxHsI9pnKM7j1PTq16dQBpJbiGgFCoZ0Itqo46b0RivRmNyLgUKzTGgWMCewS4pEhsqRLryaWCZyKBEJj08E6yDZI0YKu63ZOkRjkFbhcYTGBbpLD5WGHg1TtGxr8jFPLxuqluWtRNIFxhLHdkjbzjeglr/0COwueQ7FV1n0RMMWwU6gRqki7fgG5SARwsMkveoi8nd03v7L/WSr2U/+S7XXbooB+t8Vc9ChzuLvoywOQkjxyFGoaa3OyPTO+63PS3JeSBBJbm6VAQZb6V+DgkTWwUcpI/Y41CUQYaduHq4VUMrI97b7whVku+a3bckKTkk0WIFkn+lPs3fU1VvkE/coHABwofsLw9geB748naG8xP7a09sNbPOZUoELvnzEBwWqUqVc8xX+PPHbrUGimuT9isHp/nQl4e2e2nAaWnKaFBgRVSrMqNwYtqityPQOacvp4Bx+GLLu0f0MQxqgG4Aoue0+YGg/kW+JOpGKLZqNSaUEPdPCmk3NvABQV/56R9i7iIg+SpEpJud4Bshtss3BnFUA6f4zbu5CWzYUt4KBCpypqjCBNFiClt0yS7u94gPUb04yvEA5Gq90vwZatzZ6UqohwRbSmvAWMfRZzkchfObhq9pl93HHnS2ieTEQK8yU64VLI6nN7pp+0Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199015)(4326008)(71200400001)(86362001)(107886003)(8676002)(4744005)(66446008)(76116006)(64756008)(33656002)(110136005)(52536014)(478600001)(66556008)(66476007)(66946007)(54906003)(8936002)(316002)(41300700001)(55016003)(83380400001)(5660300002)(122000001)(9686003)(26005)(38070700005)(7696005)(38100700002)(186003)(6506007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?41hhv1Vu9ejUOtsPPi0gQB3wp/MOoOVMJh5wlal+A6nXSkG29GKmC8Le3IBu?=
 =?us-ascii?Q?yqLYJ1Zjq/76u/n0CdpJ+399/9D9IT9jz9wdLZDBmC6XdSCYRMVC/N90w5nI?=
 =?us-ascii?Q?CdGP/41RVUxowDoJ4fpK3cSWSL+yu3Iscsoz8RZcDf7A+iNvO7x+MgvZouAG?=
 =?us-ascii?Q?dFuo7vlHm2jakU1kq0eTYJMyP7zyLItP5fljMr/fX0cNrjFtGZ3PujkYCtN0?=
 =?us-ascii?Q?hSA+1txxpbmEph9Yr7Eszz15xgtphfPnQB68rrKRQOPDjXMfjVveGM51MAWH?=
 =?us-ascii?Q?3VfNWtU9hm/EBAK9AbgL6wTKQ+MXQ7D9s7KLXqXD0a1HwkiuHsK7LfeGeecE?=
 =?us-ascii?Q?XGOItD4eyIVnPnWRb0PqMW4Vl09iQDai0KKi+OtyXmr06Ibt4lf7+rZOcNv5?=
 =?us-ascii?Q?N0YkmYwe5IHsGsRxrk3kML3OLLfbi9jM1/UdTwbiZ5FypOwfr7Vsx58QoDMF?=
 =?us-ascii?Q?rhCMhL/ULNoGW2XzEhF1aMWUN22KBeGqO/umkFDjGs7yZqUPLzjlLtLyc7u7?=
 =?us-ascii?Q?YCYMDmGgLqNEcRkmrFc/mTcrLQjPWOLIRw2w58Ky9vYzOARUrBnyF8pPNejz?=
 =?us-ascii?Q?ZEruUi2bk9Ac1hcTatSMsUhXkeCn9glfyowWtpE+ApMnf1yops9Z3sMoKo5w?=
 =?us-ascii?Q?WyGuZcYBJs+uYK3jOsTx/dVTKu4qKYQ544QV3tmY45uzJWIzFFyws/YaDfau?=
 =?us-ascii?Q?e7nY2WTPqqUjoil1aW+iCWT5YmHuT7nPlPFzrWWgcj5dd2ESP55BgicpLkCi?=
 =?us-ascii?Q?+k5FybXX8JLfYUK6ETuC5o1iwK4y/94LBEKDVV5zslFHyDwAZW3Z56xwZ3TR?=
 =?us-ascii?Q?xP68PV+jDIt3iV/5ry4E/o1u6RbEEGE0RgYutTrXIX+Sk5r4lICFj2FJYZFD?=
 =?us-ascii?Q?BZN8wJx5rEBs8EVa20xGDneMcVAwsfSCEdzpxzRfrS8dw7sKjFxYYRl8B044?=
 =?us-ascii?Q?NBIzPHqK82J+4GtgyTKa6RsI6QchtOqLUCrybJvEy/+QwUkOMfgGRkb7BqUv?=
 =?us-ascii?Q?3h8y3f+23RTk2SL5hSdZARbBh2Zonj/tCBaxlWluQ/Bzhh8KF6xihUmALTBh?=
 =?us-ascii?Q?vIs2qSe/CPp1DcE5SqpRHTCKvaWNC4xzWXCwUHnbczjvRnoTOiKl0SUCKOYa?=
 =?us-ascii?Q?pbcbzIKjBA5A2e6qvMNIgN3bTl/ALzmwVuIdOir8VG3a2uRwnJuZhwDk9qdC?=
 =?us-ascii?Q?NDgAGdO6B9Rw+41owoZOflEn/cX1vLCT40uKtEKG1gBBVD5LOZgZm75KVzOO?=
 =?us-ascii?Q?i/nv5dX0On56iIs39xvcg4Q9Um1QsJWhJalS7tG4v4JHHPmdpkLBV6/7cKTo?=
 =?us-ascii?Q?Yp5lU0o9Fa7SAaaLrXEv+BohY/TAlzf3HvOqPfURuZX2CzIU1jKuAL9TteLt?=
 =?us-ascii?Q?AJiWM85Jqlv4rgc5Ck39x+gmgvuwcXdKuZuUOzIXZFT8jk0TRNu6AI94jb6a?=
 =?us-ascii?Q?a1DMBw7pZTNKklGOMFERJldFN9cSQOV3Ur0jF/dNr0STnv87AXbWbJISP6kj?=
 =?us-ascii?Q?xr+IZ2QVcN+XVoY0hh7UlXCeTdtJUqLusD4e4QqcbOo5SAgRVQTGK5f+fzk9?=
 =?us-ascii?Q?rTc+gcbSSWtB6PUOGeHXLXSl5FH17ItO1kas6nNSE6gPnP7o9/00pcSrxBC2?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d67785-74bf-4be5-667f-08daa7b634e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 16:17:03.9016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svbB6LdIRvlk8X4ryKdbVys7FEkHvouCea3sUi3dyInXF1Uzez/tZe55tx5o65LnV2bmVP8jZIzun8XjpSRKnovzOfUDBlMK/yZCk3ZV+5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6032
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Gentle ping.

Cheers,
Biju


> Subject: [PATCH v3 0/3] Enable {fcpvd,vspd} on RZ/G2L SoC
>=20
> This patch series aims to enable {fcpvd,vspd} on RZ/G2L SoC.
>=20
> patch[3] depend upon [1] and [2].
>=20
> v2->v3:
>  * Updated the compatibles by replacing items->enum as
>    it is just one item.
> v1->v2:
>  * Documented RZ/{G2,V2}L FCPVD bindings
>  * Introduces new compatibles renesas,r9a07g0{44,54}-fcpvd
>  * Added clock-names property
>  * described clocks.
>  * Updated SoC dtsi to reflect changes in bindings.
>=20
> Biju Das (3):
>   media: dt-bindings: media: renesas,fcp: Document RZ/{G2,V2}L FCPVD
>     bindings
>   arm64: dts: renesas: r9a07g044: Add fcpvd node
>   arm64: dts: renesas: r9a07g044: Add vspd node
>=20
>  .../bindings/media/renesas,fcp.yaml           | 45 ++++++++++++++++--
> -
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 25 +++++++++++
>  2 files changed, 65 insertions(+), 5 deletions(-)
>=20
> --
> 2.25.1

