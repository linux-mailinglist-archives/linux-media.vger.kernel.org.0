Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFDC4D4402
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 10:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbiCJJya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 04:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241072AbiCJJyV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 04:54:21 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2136.outbound.protection.outlook.com [40.107.114.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687D8B151A;
        Thu, 10 Mar 2022 01:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hx8DBv3DG/XnpTij886QMcje9Tm2DzeJMGHwaQaKk6t2LnhN9E4ZThqiRneUr6vtLyCBBI3BtdOlrz1Xw13p5moN/VucbQ+iPgOzWkIz4DvvvWktQIe1gb7lIq2y1pWk4QCu8tOma7w+C1XcaoJ2VEIzjiE17WsQ19NzCHkM/IL51iA2mNSVMSI9Wc73VeuggVoxyfda0HdhF0Z+bxhD7LkBk45SO24aagpRxdQlHM/JgxbdPxn7Wb6CCtmM1YZLk5grs4iYRzpE5YYATZPmObfTQ+Tf+JKUWai/OgUPHLl0PVrWoS9t2M5Gz39uCYQJ+eKbuo8ps6NSXprrUx4AFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cyY4abdhhM+p0YDExGY74Jtri9qoCYScidI23EAx6Q=;
 b=CvLTMSepN559G72Wov6ymCl0xJbG0ejeAXkK3mTL2bvt+SEDBR5pmosWdopA9yajXiQRODoG0Pvm8CcXp5n6J1cD2G6bdbn7Lu/oLNsyUnSFDgV9YcdAXef8JMraK4ouSqw+Qqzp8zkirEV/Nu+0jmCN5Q180l4Cbwc+Cmp3o0dkGIfDhgViPW2/9cxVlMO/SiaYySklrMV6wscRsrOCih0ffmiZaQclGbJLMYm6YCJ2AW5jZ/1mKs6FXOzd9Ilw7Wv3wlOY7IGoX/tWHUAgQKAeSndV85eSBfiRZodmyyIFRmJM0B1Kvx75U49YpMloTjLXO0AECo2wi1252X3vng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cyY4abdhhM+p0YDExGY74Jtri9qoCYScidI23EAx6Q=;
 b=aSLDvjUNGfZRdl5sGcSsqAAYphHhEdn6Ehl9z1SdtJa7FClsXo+nDGbScXM4aAgqCAyEsvMYF8PUwxdsdfI9sOy84SS6/nz8Mef8ayndfmed6xEV9htFoajLYQaooNnxKhQmZQTTRL9lTxQp3Hi8wLtVby8QrDgl6OF8+0D0VTg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB3520.jpnprd01.prod.outlook.com (2603:1096:404:c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 09:53:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 09:53:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYM+5AeJxexxDclU2PUbIF1R4c/ay4Xh8AgAAA1ZA=
Date:   Thu, 10 Mar 2022 09:53:06 +0000
Message-ID: <OS0PR01MB59227D305D9CD055809F32A0860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
 <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdV8kuqD31n8wkkuu_UFc6aMnr3LrfD4rNboxO6wJqcF4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdV8kuqD31n8wkkuu_UFc6aMnr3LrfD4rNboxO6wJqcF4Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eab070b-2d63-4bc5-588e-08da027bc70c
x-ms-traffictypediagnostic: TYAPR01MB3520:EE_
x-microsoft-antispam-prvs: <TYAPR01MB3520C780231ABD2AFD9F2393860B9@TYAPR01MB3520.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nemjNqIv56X+AxKiuvXjCWrkmhP9DOJ/cUcs4A+sBseyRA0qsES8VD5ILayiaPTX6DQX9sVLkK9sr2AGGCjeeTSFYXEW7tyd4tyUMj3SPNUpQZbwnvtd0zf/rcHSkSuMs+lpox9Ca+AHoGFaS9iDXVZaPB0xry21pRg1jJYYvgCFlLCdA2/u8GhMAaWJbXW6zl6xp13Kv0DIScnxg77oYblOqruFNQqtgDyw/Dkd9M95q9IOAt2w9br0rXjO1ePI6pLQl1U2W1y5rEG5iEaG4qpo3uce7U8w1cuEkuecUCLmN+W4908w+ZNRlGK/oxmZ74X8Ce4vgVdFXcLfcdJ/lxBq8ydItI45B20DmiRHfdciY2QGJfUQEkt95ao+L2mxAk9VhtlH+bpPm8ywCQXwzHEjk1WqIC1inhwZVxz5ehy5ydmXJeCN0qm+kAQwUjsSel1c/ie0fVmUKZKk7gCy8HLiIbA2/tuR1tamzahrZY7w/R8QKeinSm3lS1DNCx9KDJ+YmcWXoDjelNeW9De1eeVvZ/xgRlnxhpfuoU5K98GwCK/nVJ2Shas/MdpssmokSA3118tev21WN0XuTwiA8bvkFIBmjlQ0+ngDZ25U1zGXME3hiYV6g7OIM800/JxSfofZw7lKwNQhR7Pyu7EJlyDeTekxsh7LBNBn4tBDcgGkCapEJQI33EFWq+n1aab86537h+iFCBuwvl0RTq27Vg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(66446008)(66476007)(8676002)(71200400001)(64756008)(66556008)(4326008)(66946007)(76116006)(5660300002)(33656002)(6506007)(7696005)(2906002)(53546011)(8936002)(52536014)(26005)(186003)(107886003)(83380400001)(38100700002)(508600001)(6916009)(55016003)(54906003)(122000001)(38070700005)(316002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B/+U0K71NkQz7KliCRkXjOavVSMR42PgBS6egp5/r/Yt0GLjhpk8HzGP3kfH?=
 =?us-ascii?Q?Jj3p2kc1vfkO/s+Z4tnSxmYF/nCp/lud63HpXpYyY2tsxFHt+tYUvkW+ykMr?=
 =?us-ascii?Q?EeiGENeJkXGTqGTD0GUPT6OLt9XJccR2hFRfJGoWdIRJ2Z8n/s7XAv+qiq9K?=
 =?us-ascii?Q?rlgCkcZFJGHdMmMZ3qxow05VL8XY9rWB9HzHNq9BMNiPwQFkFGlP0vEjl6PI?=
 =?us-ascii?Q?Gzno6QFJe79AYfEcONiVj0vSdJNXq/K9zseBCstrW8ZRMJVIMhb9lPbjUR2T?=
 =?us-ascii?Q?eDxvPNQdTpHXO3H4lwYubfadj1jPP9OjlHiRZJQX6Fx9stvGIMZaTrz1r8zp?=
 =?us-ascii?Q?hqA7yjVO0WfMhHMznJBZ9hEfJyCAQrtzUZDFTXVBuRgdN300wmdkkAB/X4tH?=
 =?us-ascii?Q?595FzigEuEbT33tGut8QvFbCGDoG4F3ZR8SipIh6Etb18vEVcVJJ55mNKPUX?=
 =?us-ascii?Q?1bOM7m0Tbf9DbtTf68b+m4IC8dIMDTFYi0JTDkFbP5Yi4cmklRrCYChm4c4S?=
 =?us-ascii?Q?f9rCdbJcsFuHYVd4hEh6pSf1F1mxt0A3IUoWpFrFewh85vFK2jq9d+QmIwyC?=
 =?us-ascii?Q?T5Ic3IgtQpe8UFXcTMXrOyghKQTMjmuefNI9b2XVK+KR3+FSx3Ts3xBUR5oI?=
 =?us-ascii?Q?Co57zpTZJQsltJpUo57lRL0fX88mqeGhTLsC8s8uWMi8fRk70NP+9AItdfaD?=
 =?us-ascii?Q?mdkU6TbP484DFcLs7cooldLVXMzKKQHCTLPMDyOER97ng/7lVdP+CvU07ELw?=
 =?us-ascii?Q?fb06DCwAnhX70NDDDYc3UnIfEQY4x8kTgg8b/Ybnhbxi8/67qJe7lfaYSWUR?=
 =?us-ascii?Q?YX/bTt9zFROiBz0KUArBFqDArfxnXStFxt4AYoiLtyp6CFG2J+VqtTRzelZw?=
 =?us-ascii?Q?SnzNyDgjyd/ukibUI9aQluxNj3x8tGjmEXKgXlqIowZbgmU3cxI1YEdiIQHl?=
 =?us-ascii?Q?NGP5EjqjBxp1j7ADo7AJq9l0r/noJ8N3+7fniEWcLBIErBaftLaIxrYLuoGE?=
 =?us-ascii?Q?CMcEY3tgngUrQ2A7AwWYUo93VU1dbarj25/ctpmbYjcn0d7pXtNGK5c+IBJ9?=
 =?us-ascii?Q?oYwHEBTh+6So6zx4euKGpZMKp6itATzysLHXSyudCHJ8FfG18s56f1muJ5Se?=
 =?us-ascii?Q?g0/CDeB7weSHnx8sZzrKFK8sFefKckmW1UOxKqNlQpnYfZgLDlg5AfbGpaR9?=
 =?us-ascii?Q?h7SF+YJeg+TjbzBtxqNboAPwbgFtHohV0Qg/Qcy/9vZwZWovM5UeIMsvhmtY?=
 =?us-ascii?Q?pM7TwDsqQTSnf80U72WDV6D5X8PFisb8SBNHrkSg3YcyTBX/MMN9e92lVbok?=
 =?us-ascii?Q?FTnkdJKSZDEReQdvQGJnOwbeFxm0c9V0VNhb62iuOJKZDPWkkeYnIVIVi1ll?=
 =?us-ascii?Q?+WKNiCb3COZ+iGC6fUMDztXBsvmbn/u8pFcxh557x7NkpFVmOPdLk++9hgSw?=
 =?us-ascii?Q?MXwqwMVNDIGrMHVSCBXMMM2hO00HgSG8D6oFkK+H2FgbDlNpZK6N+GyURD1v?=
 =?us-ascii?Q?6NvnOxJQ0KXFidViwbWZQQYxERh/cngleLQu2Zv4URovvwzPbvsjkp/DwcTu?=
 =?us-ascii?Q?VMklv2bcSp8PLYINAlYCf69n76bfh25osdSH6M7oeSvp5/nbUm4YBqgitEI9?=
 =?us-ascii?Q?ORdPQL0/W3jIyObARRBxjUdmPj6EeGj8ZURIKq8T8VF+wAjlxDhs6jDUmsXo?=
 =?us-ascii?Q?pZ2pXg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eab070b-2d63-4bc5-588e-08da027bc70c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 09:53:06.9117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3K7F8XF1sJ01cyOp8NHqAjBnzQdQ3g9iG7KkWuqsvupzQqOHkP/TcCPaJ42cU9rldnTPkqz7CGhilV6aWCQSLWbwWwAaancQP6Irfdtt7zE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3520
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
>=20
> Hi Biju,
>=20
> On Wed, Mar 9, 2022 at 8:45 PM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> >
> > The VSPD block on RZ/G2L does not have a version register, so added a
> > new compatible string "renesas,vsp2-rzg2l" with a data pointer
> > containing the info structure. Also the reset line is shared with the
> > DU module so devm_reset_control_get_shared() call is used in case of
> RZ/G2L.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v1:
> >  * Used data pointer containing info structure to retrieve version
> > information
> > RFC:
> >  *
>=20
> Thanks for the update!
>=20
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
>=20
> > @@ -841,7 +849,14 @@ static int vsp1_probe(struct platform_device *pdev=
)
> >         if (irq < 0)
> >                 return irq;
> >
> > -       vsp1->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NUL=
L);
> > +       vsp1->info =3D of_device_get_match_data(&pdev->dev);
> > +       if (vsp1->info) {
> > +               vsp1->version =3D vsp1->info->version;
> > +               vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev=
,
> NULL);
> > +       } else {
> > +               vsp1->rstc =3D
> > + devm_reset_control_get_exclusive(&pdev->dev, NULL);
>=20
> Making the reset control shared or exclusive dependent on the presence of
> match data looks fragile to me.  I think you want to check the IP version
> instead (ideally, the SoC, as this is an integration feature).
> Or just make it shared unconditionally (in the previous patch)?

Agreed.

>=20
> > +       }
> > +
> >         if (IS_ERR(vsp1->rstc))
> >                 return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> >                                      "failed to get reset ctrl\n"); @@
> > -874,13 +889,15 @@ static int vsp1_probe(struct platform_device *pdev)
> >         if (ret < 0)
> >                 goto done;
> >
> > -       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > +       if (!vsp1->info) {
> > +               vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> >
> > -       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> > -                   vsp1_device_infos[i].version) {
> > -                       vsp1->info =3D &vsp1_device_infos[i];
> > -                       break;
> > +               for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > +                       if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK)
> =3D=3D
> > +                           vsp1_device_infos[i].version) {
> > +                               vsp1->info =3D &vsp1_device_infos[i];
> > +                               break;
> > +                       }
> >                 }
> >         }
> >
> > @@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device
> > *pdev)  static const struct of_device_id vsp1_of_match[] =3D {
> >         { .compatible =3D "renesas,vsp1" },
> >         { .compatible =3D "renesas,vsp2" },
> > +       { .compatible =3D "renesas,vsp2-rzg2l", .data =3D
> > + &vsp1_device_infos[14] },
> >         { },
>=20
> Is VI6_IP_VERSION_MODEL_VSPD_RZG2L =3D 0x1b an official number?
> If yes, it might make sense to change the compatible value to
> "renesas,vsp2-0x1b".

No, it is not official one. I just use 0x1b as no one claimed it.

Cheers,
Biju
