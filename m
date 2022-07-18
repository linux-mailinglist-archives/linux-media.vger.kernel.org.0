Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2C2577EE7
	for <lists+linux-media@lfdr.de>; Mon, 18 Jul 2022 11:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbiGRJqg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jul 2022 05:46:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234166AbiGRJqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jul 2022 05:46:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2133.outbound.protection.outlook.com [40.107.114.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ADB71ADAD;
        Mon, 18 Jul 2022 02:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6Fk91+1DS2atmcg1zIoCqX8mLO7SErtar/vPWMl7uBbdF1Z1MiXz2O/gcIgf2Xojvcb8Q8gLVrDOn614yhYGNhfQOgFbqfA3ejq/2gCCSVDIe1kr6hBb1TGNNBlYrhR0lqaCgfNHzLCuqqYIv4LqHBgmseZccUBexwKCgC55mzaXW2KKDoPdv3wViIqHGZsJBRNF6802iAm6alPV+Atf8fx4j5vhXhpXB/1qjHwEbxaxi4oNEAXzJjSiV7S7JWIYhluZtT6Rn+YxYsAoURzOyrrbPb6SGxQ4TpyDVLGtDDblTINnB/tU/kJmYtF7uzvjt62UPQeitHNkDKA/rf/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgGC2SoFu9v+9UXGpkmzwbXu0TtZtO8NwA+LtEz+u54=;
 b=nXexei1HYGUMgQ1p+p2q9T6iDXP6nuOC5ZuLN4NAlPxg/BnatO6NFEBl9smLpNRL6TRCEvAGMNvXumkhaL/R9ULwSZZIK3PzYf8oYeQJvbIXT529tzdNGSaJBsM911uIjOqrLEMs5gt8f1sPWedLa3bp1qgRj4LZocnDqzrlejbkaQ06ir96yUgeYsydabSr+nGxF8uQwqcAjpd956IQBKuTFMxVJgoMrSdM5rx8ocYQ+H30esfP/1FxI8WWatD6Xk/FapioOySw8j7uDdZt3I+3u7k/+cjNvGCvh33j6l84o9JzQyWsk4wK3trIG+d4068B5APgBvhbxcHevXaeWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgGC2SoFu9v+9UXGpkmzwbXu0TtZtO8NwA+LtEz+u54=;
 b=gNSgU9A3KiuKrP/wR8bhNETV8erAr+QtSA0qNI0bg7tRpQhUsr9CWX2B3QHV4zPWOAZ5FTTjDV3DN5JIq796NvH3wccW7Oak2Fzi6iAUAs5PxRZ5or8q870QIyIiq+VFp/f3dhjyzuwnBmhSvuLhEgYPzvnjkz3JDZUnd0ObKV8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9597.jpnprd01.prod.outlook.com (2603:1096:604:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 09:46:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 09:46:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v11 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYdPmLaH3LWDeTz0+X1dy9H4VIWa18OHAAgAAKlXCAAAizAIAAEfkAgAAGnICAB8d6EA==
Date:   Mon, 18 Jul 2022 09:46:30 +0000
Message-ID: <OS0PR01MB5922AEA08C8DD71390E51A97868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220531141958.575616-1-biju.das.jz@bp.renesas.com>
 <20220531141958.575616-3-biju.das.jz@bp.renesas.com>
 <20220713081856.GA14683@pengutronix.de>
 <OS0PR01MB59225D5ACA3BC7BAB2F47D1D86899@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXe6P+qg07wFCryqQt7EhTpKw8ZgSN6UjqxYy16eghXdw@mail.gmail.com>
 <20220713103216.GA10829@pengutronix.de>
 <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9ULJVzxsBqkZvg2_XoxJPGqmduhjM9j_PCJDk-PdmqQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80ee4c76-53eb-42be-3d27-08da68a2644d
x-ms-traffictypediagnostic: OSZPR01MB9597:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZUqV7U93w+O/JsADbJGVb70eOvi7B/ucyfQKHxu9eMri4/VCEuzT4w0yCrYkTQKPMHpWecv9jJwZ6Gf4nwujNzTnt5aANqKm4cC3OdbzO9hycsXy/WHkvXlpuTB7Aq7w7HpjNJ1dRpxaBI72QQ2L0/v8bk6HzyFQsVZZZB9G6qiROycZWixBt8xLI3YF1+KmyLjvxKML+oHHMUpZ6f/TfVC8DIKUReAGDmjmnH8RJB+or8Ubrz7msUq8Y/PMvTY8aewXRgbCA2QmClE6CXABTyfgrrUvhI954XnkL/f12VBuHjTMMPYLYmkQVidZa78CqvGsrufeEUGVPdwewXeB0Dh155BqC6d1+u1yVmf3NZKmB5AdTptM2zxx5EH29lfBJ05XJkzAnZwg7ovVYyGWL5fc6wxHvyAcITyJUwjukni3h+zZR+5UBjEoZ6JsOcAmV1m8TbKublbslaHh5v4+Qg3TczemXvmbgdOsQym8gApQLyOJeqcrdq3GcVjweI6tEyQm8BbmxIfh3uiGifzcnz0rfMktj9qsjMnfqGnt2GxHzivTUQGzREsctNPH1LBU4wdcLNyJ1vfDw77M5Cgxy4jqWOsFJD6UKC/ro+TEiJjO+dAru7W8tX6dnsgglMipKJ0sbpCL4eTiiFucL6yDAjHM6RXN0X5rZrrLHGXNr18UquHBGtJ8ou9/RMcOjEGrc/6NlWeXJc5aYEgjAxbVIA5X0ATWZMsb8ZOTfOLjsyZG0DHdIvNU3+3hLvPD4UUT0Nf1yKIrWiodXXpmYMWfdupe7C3rAabftczCjPw2isnOVuqCmPFYWoPWTlA6axVa
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(33656002)(5660300002)(55016003)(52536014)(8936002)(2906002)(110136005)(54906003)(86362001)(76116006)(4326008)(66556008)(64756008)(66446008)(66476007)(8676002)(316002)(66946007)(53546011)(26005)(122000001)(478600001)(7696005)(71200400001)(9686003)(6506007)(83380400001)(107886003)(38100700002)(186003)(38070700005)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j4C0R/ovn9JWi1CQ9AtRTHjaiWIseLpJhpb9Q/h9tTbqvrbDTG+cgyDEqKce?=
 =?us-ascii?Q?BXedHEVMvcgCdoAneovjwbTeynefRN3DgMYwpIuA+qa8MEtBLzD6qqe3h0lQ?=
 =?us-ascii?Q?xP2SSnWLklOgo5FiTOOtysyULAmhbTuXREu2YbjVlmj4MH2abR478FE83AJL?=
 =?us-ascii?Q?NxXEASPo08mV7bHbSQCzi5kxp7brQljRZlqWZVIyMnjReDMCqCKDoCtJRPKz?=
 =?us-ascii?Q?7+EkqPap1sjqY5ZpPC6GnUg1/p8gHwGvIMR8tzuHdbY0yUEhqj2F1eR0Glv0?=
 =?us-ascii?Q?flCUr+PvRFAhE47+13G9qOE0CPf8oEKsgMgCJaQ/v/dKVWEgQgy5equlANFS?=
 =?us-ascii?Q?hF7DjF5/nGnm7Nor7l97l9ZqLEXmF0lDtqfcaKMrwPv4ZLgIZrKLCiHAAwOz?=
 =?us-ascii?Q?c4y29FIn8UH91NiZ37ZOpA6RUFC+HWmWDxfVMehZYc4ZYyGy/1Zw2gsX9H3o?=
 =?us-ascii?Q?LW5S4kgY5yTDeqJUn/tHTBXMEO1MYrnuvP0mYJpctgKIWY9zbgYjKL1a6HVd?=
 =?us-ascii?Q?p2cMUHBJEgHs2BZwI+A/Y+FClG15Mg3cioCEeVEp8GExFETATdZO9ytvt8cr?=
 =?us-ascii?Q?07NcbdL1lweEaufCHpEvFEdsK+mQrEHaO5en7/zPZGD8Y1nXpnkma7sPi9Ka?=
 =?us-ascii?Q?dmK0GESbC3osfSJ1A39qw3h/0nLK4dvYa3PtnEWEJ4L4gusj4JhO5zrqj8fX?=
 =?us-ascii?Q?dw6dMVrm8LpHCkYVVVbO7SaL/NnHXvC3UFoaTlpYL4z56Nivk8P6dCLdOxRZ?=
 =?us-ascii?Q?FcMcVmnwPLzzUvSx/4p2wppTN04JaO0swt5n+e15n7HjZ05TfbAhoWg7rpBL?=
 =?us-ascii?Q?voTJydf3S7YfrAo06Do6OsxswXVW5hu+B4hZqAdE0WS+ZlC/M2qzNIckTWHV?=
 =?us-ascii?Q?H1nsXxTr0QhILT/ecoh/5wagSDP+87qSgCGVepj+gHb72C91Plm4wP8/wps+?=
 =?us-ascii?Q?5v9Nvapx/5SWn3eppEH7poas8q8yTcS21QZaOKxqXWl1tkFXFUauQWMuNNup?=
 =?us-ascii?Q?eWZmEpkqyZSfuzOJ+adRFUZzsJKfLTuC0CwaRHjbnbLBX5WrI4qhoOPtzXxB?=
 =?us-ascii?Q?R9k87fyqxsyohf8pD4Prahlx3TPCAnZvVZp5LLsLrwBjKw/EmQa29uBzGe48?=
 =?us-ascii?Q?pR6yV1KoTdu/olG/KOYzW7MLnOKkMmwCjtoTWeFuZHk6r6Jw6uWcjRouY0Xg?=
 =?us-ascii?Q?54Cm21mLdhN1qxctwxDUvM6sXBfnvYcfrxW7bnPKnISnWtM6LRFFzzlRJcxc?=
 =?us-ascii?Q?fG2gXjiWELYPyXUQSIg7/QVVe975olDhapK4hyFI4ikVmf2WJHIHmQVPWOpZ?=
 =?us-ascii?Q?FCok2Z57GBGZW+20gn+oHcGsxi4bQ0s8WO1AaZXXQcKpit7WcYWsFH9HqHPl?=
 =?us-ascii?Q?mderNb8F3iFEMelrHYa+hFAWatmrWS3a9BNU8ogGtn9cszKzl0uTQy6xf72z?=
 =?us-ascii?Q?rU3PIWwkQSLEmVphAMGvqRmmX78LQbKQVH+P3PSLMrHcuHoJi1MZmFlis0Ur?=
 =?us-ascii?Q?yzQftahBKo0bo9eHFc2ALLk7rCD70C2WbFX4kk9O+tVxkJnJb6Wk3nDrIEjI?=
 =?us-ascii?Q?Xtmgk0nSjPOq33DQM8yc7LRKSDKhtVGzq3gwr7pSE6bLEvCET1WxCFfTvXaQ?=
 =?us-ascii?Q?Gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ee4c76-53eb-42be-3d27-08da68a2644d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 09:46:30.2808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hMWfbeqjytT96Fk8Ck3XdacFFa99yQ7ekn9JtZbzl30CLG6R6uGTTlNhDPmCwTR6H70meRVcMTOpzalvEDx5qTHLQLRWRSv5vNybruwd6SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9597
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi Philipp and Geert,

> Subject: Re: [PATCH v11 2/5] media: renesas: vsp1: Add support to
> deassert/assert reset line
>=20
> Hi Philipp,
>=20
> On Wed, Jul 13, 2022 at 12:32 PM Philipp Zabel <p.zabel@pengutronix.de>
> wrote:
> > On Wed, Jul 13, 2022 at 11:27:56AM +0200, Geert Uytterhoeven wrote:
> > [...]
> > > Actually I suggested handling this in the VSP driver, as VSP seems
> > > to be "special".
> > >
> > > >
> > > > [1]
> >
> > So reset_control_status never actually returns 1 and the polling loop
> > is not necessary at all?
> >
> > If it's just the status register read that fixes things for VSP, could
> > it be that the deasserting register write to the reset controller and
> > the following register writes to VSP are not ordered somewhere at the
> > interconnect and the read issued to the reset controller just
> > guarantees that order?
>=20
> The udelay() also works.
>=20
> While the reset may be deasserted immediately (at the reset controller
> level), the VSP may need some additional time to settle/initialize (at
> the VSP level).
>=20
> Reset is known to work on other blocks on the same SoC, so that's why I
> suggested handling this in the VSP driver instead, like we already do for
> i2c.

From the discussion, we agree that the current implementation is good.

Please correct me if my understanding is wrong.

Cheers,
Biju
