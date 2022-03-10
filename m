Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC544D4560
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 12:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241502AbiCJLMd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 06:12:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241147AbiCJLM3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 06:12:29 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 686A3141455;
        Thu, 10 Mar 2022 03:11:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzN3NmVn0FTO0vHy/SxVue/W+xc3YBcqDY5/+7ipWn0rJvVUpI8hxROtbPX2PVEenPQCmiiReY/4QA2AEKg0qdQKQP/hhTSh9DD9ky0abCrfiCcpdnCM3yNtAwzdb32qYumA+TA2Boof1b5ZAJRqt8IuglKSDc9u2lPt5rnoZT8wVe+zytJZXItmyrTGXvFm3iaTymRJt7BLYOFPV1ATFmIh8eJF/TWVtofeiOSTEyhvi7vjacAbi3sioOPD90IdOJjcp7S4klSyVOowT+BYEybHrnzUxz2ymsz9NhqaPqPSwvVtGKWqKerJvypv5C0h730WdnfNjP8me4cjk7MdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xW3kSQ9abI64GtXAdet0noKx37j8R4l4hyEbA6JPE4=;
 b=AwEDLauOYo7QkFDdQoCMjcGehqrk2nlG/ASbGtyNQIDV7fRw6V4vOK/cdbemQJQuipyt/0lKgaLqzgvnEqi3IFyKWfskpmix45XQtjylnlIj+MXMQzbOJ8/xrgEBeH6nmpSuneRbMZP2GtUXGJZKixv6UJrFfQEaMuQ3F3IS2ifaT/rP95hohVUqQAapUl1UhEuA2weFKi6E0QdyVMsnZS2KYLqMsqNuJECImqDrwnieq9kqPGyV6gVL+JRjANLGNEgP5n2BLs5IHvRV1Uc8doCkKIPrplRVesuHF2bMzalALlZDB0kcwobbURzCi9fWP7W6z1xdtqXyNuld7kGxQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xW3kSQ9abI64GtXAdet0noKx37j8R4l4hyEbA6JPE4=;
 b=fpV/l+/tuTB/GTrbKy92j9WPQ6KGS0zSOGKKSBMq3b3QfZdKhAMHxAFVe8CwoUpWgWYmYW1+fjpsi66i2Bj4dRSahM8EeiX/Kyu5Fl59nQuBkHNEIVjQ6vCPol3iyLBy5TC5XwAn/awJPdeaAF5C1pRSx8GjhvLQHVFZXSUrmlQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB7482.jpnprd01.prod.outlook.com (2603:1096:400:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 11:11:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 11:11:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYM+5AeJxexxDclU2PUbIF1R4c/ay4a7uAgAAHsgA=
Date:   Thu, 10 Mar 2022 11:11:22 +0000
Message-ID: <OS0PR01MB5922FA79BF95266260364627860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220309194521.7028-1-biju.das.jz@bp.renesas.com>
 <20220309194521.7028-4-biju.das.jz@bp.renesas.com>
 <164690820109.123014.3107899517422264094@Monstersaurus>
In-Reply-To: <164690820109.123014.3107899517422264094@Monstersaurus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58a04aa8-a18a-4933-3f75-08da0286b61a
x-ms-traffictypediagnostic: TYCPR01MB7482:EE_
x-microsoft-antispam-prvs: <TYCPR01MB74821458E0039DD6882EA486860B9@TYCPR01MB7482.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LsI1fwzI/S9W7zOMtICGmchMwAnrURMXZajcqvnQEPuvlQgGxykugQmMJzoRyp+0T9/gLSzdsRUVqeGlxt6MvxYgeaIJ4wV/Mu5WsLabGcmTLUiU8LeQpf6XIHGlmENo7hmDpVfkMGBxqK3hkQt+Z2o5+o1ITC5z8mKantD12brpuKsczxhZniJYLcMqvNFXhgEUaqK2+qbiGwHgz+XdwK+/oOCZUy5WbQ7XksYuT1JNZlUA+j4MIgmn+lU6By1Ha1mUzsRx6ppaWCmoMqLbOpNa71aJKGEqcq5mwEvlrVxs3CYwr4IA+kdFpgL7eAEn508spBa3QS13dn6VxN9/NYeDkkIUIDZVUseQzFVeyB048IrOS8m1pmDYxWNjUSkM+lNwRwe3d5p7QM+PXarZWXkHQ1v4IYPVxbdoY7KmalX50Lsm6v1Luhy6F/IWho4ArgnTE9dFqe2tVz0MZvFElydHzX2ydPnxmz/3jg+BFTTvNFt4LuzjjeI084biUhxKjluiBU1rEhkLqDa/q4NQpHtT8CdlCPSLBPmOwjQEt0nqKNvJ6ebZkHR4/GgW30DrW5SQO/rLc7ouoB9/gsE9dzOXxkx6I9zJIDQ3zN8QnTKkaMUCK0uLl3nU1qQtkE0Va7l0rC0fMNpszYGWQPo6kpZ2bYBD5lsUwK9goPZ5Asubw7zGRs0cMhYaGNTvZ7RuemTfFNFY5+CiAuJQAzK66kLSPV8hzenSDFNmDGsnu0RuqdcopVItRv/f/59PlspCK98l1ojdsMvOO8QTosvV4ttaW8naYCOC21nwBfUBrHQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(5660300002)(83380400001)(110136005)(38070700005)(7696005)(52536014)(55016003)(2906002)(8936002)(966005)(54906003)(316002)(38100700002)(33656002)(122000001)(64756008)(66446008)(66556008)(8676002)(26005)(66476007)(9686003)(508600001)(186003)(107886003)(71200400001)(86362001)(66946007)(76116006)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dNZV/0lITIb+uvglIXNNPeKf+4DmGdWv08Yuh1FGCG6Q/YoIOZgoUajzTNRy?=
 =?us-ascii?Q?5NQO1Hs1gsUYZ8/MjAIj8+0rCffowqZGksOTIzszaIGxrIcnPYkgbKlEBfT6?=
 =?us-ascii?Q?zc8vJpeOAe0p8xZ9ass7gnnJMagAhliWlxI9YuBlvaydEo1/8Ffu/8FGvbkK?=
 =?us-ascii?Q?Zz5PmgXWCMb8vSx99WF82kxIGjwfm4hWMjG0/xVenAVWvIvNtKRCXQpFtAJD?=
 =?us-ascii?Q?oOGUrFjkZF1+KG9yH6shAY4AZuFSsZhTbsgwkIpf4Pdq7gvRy3frxYqc88nl?=
 =?us-ascii?Q?y7et8zGNkQ7OoiqSBSP25k8HCC2J0k5dwQMLJeoWJvXPV7xIL7VozHuarMIR?=
 =?us-ascii?Q?aQqAiGZlJV9iDfvPONJH5ba44utLzK8SROphuJWXFxAlibHtYi2hQ4Dm6/bY?=
 =?us-ascii?Q?LiDZ0SICyBgHJNPMeCfDzekMwodYz8Y2ujwQon3OvfD3+rPGTHnpkQRavwaf?=
 =?us-ascii?Q?mFTa52E+hfoj0lVbseVi/anBRjIK7+oXvMuXGHDdo6AWxbWZz+Ip/CtbDCLN?=
 =?us-ascii?Q?W10MkhgYXOOO3k+ZdQ2xhhIGtymMJNBdfkL62t4DSsSQuDFeVwa84xQMUml0?=
 =?us-ascii?Q?pTkXdt9RG+JECOUJZi8iBI4QXsfh1U6RDUCmCPjTLAAQheM1gdvz7udYOewK?=
 =?us-ascii?Q?QKIpCMgL/jX/NZrVn7/IfLBZVPIuQ6KvwWyPmdIY0Y/hTPbW+BzOhT5/ZIKJ?=
 =?us-ascii?Q?16IuSXGOAPXp+pC1+rb51zDI2/gFvqFOkRdQVfeGYBW74DugAjjYNgXNPllC?=
 =?us-ascii?Q?Pb4U4iYWEveSbvCtqsEeEoBLM1Y+zNJO4lKRLqL3NSfnRH2kGegwWZy1PW3L?=
 =?us-ascii?Q?N5tTvtEmIlWzFF+sJBF8nfjZFNic1JGP4z2ciBKvCfsvHcos1q626EIKCMPo?=
 =?us-ascii?Q?yO5CVKWXWm6zBCbuIiYOK7RZEF1lb9E6l5Rg07+iXJNGinR5+ilV7icj6lsE?=
 =?us-ascii?Q?gCZY/bUHq3hc4eF/E3dfbDg68ofl048GE7ydTYwHI+732tKjpDuLGY2Kb79c?=
 =?us-ascii?Q?y2FzMZ77J9ywgBbyIm1tFKVhSNtzZ36x5UjsMZTpdSlM6I+I2NaNgZ3+xc3u?=
 =?us-ascii?Q?rbh3XzZ6Q8HFybTNi5ZLJeoijfBNlPyY27cnFW1atJmmECHa1cu5jwFVBnaT?=
 =?us-ascii?Q?o1IfxvymA0i63Ly+78twtwlMTdkvYuvZynUkJVejaCjVBWhlaKRRliKJl6tc?=
 =?us-ascii?Q?xA7fi0L1LVS/C4dmBJcPvh92svuEzD+mIFs3YR8r+PhjD+VRUQmAWooz0mOv?=
 =?us-ascii?Q?/9aGVSn0okTHYn4n5h5Q1mq/6WZSS764O/rYV21YKD6twS6ug8qZDCOIreRR?=
 =?us-ascii?Q?A4y6tqxU75THwODhSA2q6/QqepEs5ZzoCF38uaAABo011TRFsr5fUwWbohjA?=
 =?us-ascii?Q?clMDE7ZCULGfZ4rc1RIzOGWLovDfj3EyKrfGXCv6XrU66xG6LClRrfGJpjK4?=
 =?us-ascii?Q?lJ2oHGPMGe+SWQixC9A6gWt8MCiJcUG8HwjFnnF9yKomece+r2ei7vDDd0Tt?=
 =?us-ascii?Q?kBMQCofyYHL6ODmFjvwpfjW4lD4cfArP6L8oZGaQch98x3B6ePF5JIF1HS4w?=
 =?us-ascii?Q?RLtgoTlgmJhFBqUec9HyrU0aYqRuE4Dq1XJqxEJHcZW06eTs9N0UWRInTXi5?=
 =?us-ascii?Q?4FRYvL+aonr5LnKz5gEHvvl6IUur/9S7VYaeMS7Nu9gAtVchV5DIwcaQAk4t?=
 =?us-ascii?Q?ZInLoA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a04aa8-a18a-4933-3f75-08da0286b61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 11:11:22.9299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KjWDFCQWbxP4axCA20dRzQchGCktx+RHEKxpnQNvetcvxqYZwCvHozzB+Pr1ZHhPJLvmLgsChUdmqnXSZW/ADoVt2ZsBiVCl8DOEiXjZBQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7482
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for the feedback.

> Subject: Re: [PATCH 3/3] media: vsp1: Add support for RZ/G2L VSPD
>=20
> Hi Biju,
>=20
> Quoting Biju Das (2022-03-09 19:45:21)
> > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> >
> > The VSPD block on RZ/G2L does not have a version register, so added a
> > new compatible string "renesas,vsp2-rzg2l" with a data pointer
> > containing
>=20
> Does this mean it is 'not' a VSP2? Is it a VSP2-lite or something
> different? (As opposed to 'the vsp2 found in an rzg2l part').

It is just VSPD, see the hardware manual[1]. It does not mention about VSP2=
-lite.

[1] https://www.renesas.com/document/mah/rzg2l-group-rzg2lc-group-users-man=
ual-hardware-0?r=3D1467981

>=20
>=20
> > the info structure. Also the reset line is shared with the DU module
> > so devm_reset_control_get_shared() call is used in case of RZ/G2L.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v1:
> >  * Used data pointer containing info structure to retrieve version
> > information
> > RFC:
> >  *
> > ---
> >  drivers/media/platform/vsp1/vsp1_drv.c  | 32
> > +++++++++++++++++++------  drivers/media/platform/vsp1/vsp1_lif.c  |
> > 7 ++++--  drivers/media/platform/vsp1/vsp1_regs.h |  1 +
> >  3 files changed, 31 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> > b/drivers/media/platform/vsp1/vsp1_drv.c
> > index 77da6a6732d8..40c6d9290681 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -811,6 +811,14 @@ static const struct vsp1_device_info
> vsp1_device_infos[] =3D {
> >                 .uif_count =3D 2,
> >                 .wpf_count =3D 1,
> >                 .num_bru_inputs =3D 5,
> > +       }, {
> > +               .version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> > +               .model =3D "VSP2-D",
> > +               .gen =3D 3,
> > +               .features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP |
> VSP1_HAS_EXT_DL,
> > +               .lif_count =3D 1,
> > +               .rpf_count =3D 2,
> > +               .wpf_count =3D 1,
> >         },
> >  };
> >
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
> > +               vsp1->rstc =3D devm_reset_control_get_exclusive(&pdev-
> >dev, NULL);
> > +       }
> > +
>=20
> I'll leave this as Geert has already commented.
>=20
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
>=20
>=20
> This is looking like it gets a bit awkward. Two methods for identifying
> the version and info structure is going to be a pain.

On RFC, Laurent suggested to use info for RZ/G2L. Do you have better=20
Suggestion? Please let me know.

>=20
>=20
> >                 }
> >         }
> >
> > @@ -943,6 +960,7 @@ static int vsp1_remove(struct platform_device
> > *pdev)  static const struct of_device_id vsp1_of_match[] =3D {
> >         { .compatible =3D "renesas,vsp1" },
> >         { .compatible =3D "renesas,vsp2" },
> > +       { .compatible =3D "renesas,vsp2-rzg2l", .data =3D
> > + &vsp1_device_infos[14] },
>=20
> I don't think you should reference a specific index of the infos table.
> What happens if someone adds an entry higher in the table which pushes th=
e
> indexes down ?

I can think of adding macros in info structure and use that macro
here to avoid such condition, if it all needed.

Do you have any other better alternative to handle this scenario?
Please let me know.

>=20
>=20
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff --git
> > a/drivers/media/platform/vsp1/vsp1_lif.c
> > b/drivers/media/platform/vsp1/vsp1_lif.c
> > index 6a6857ac9327..6e997653cfac 100644
> > --- a/drivers/media/platform/vsp1/vsp1_lif.c
> > +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> > @@ -107,6 +107,7 @@ static void lif_configure_stream(struct
> > vsp1_entity *entity,
> >
> >         case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
> >         case VI6_IP_VERSION_MODEL_VSPD_V3:
> > +       case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
> >                 hbth =3D 0;
> >                 obth =3D 1500;
> >                 lbth =3D 0;
> > @@ -135,8 +136,10 @@ static void lif_configure_stream(struct vsp1_entit=
y
> *entity,
> >          * may appear on the output). The value required by the manual
> is not
> >          * explained but is likely a buffer size or threshold.
> >          */
> > -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > +       if (((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > +           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)) ||
> > +           ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > +            VI6_IP_VERSION_MODEL_VSPD_RZG2L))
>=20
> The comment here directly references V3M, and you haven't updated it.
> But if this is going to grow I wonder if it will end up needing a quirks
> flag that can be set per device in the vsp1_device_info rather than codin=
g
> a massive conditional if (platform x or platform y or platform z.3);

OK I can update the comment above in next version. Currently only
V2M and RZ/G2L need this change. In future if it all grows, we can
revisit and add the flags in info structure.

Are you ok with it? Please let me know.

>=20
> >                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> >                                VI6_LIF_LBA_LBA0 |
> >                                (1536 << VI6_LIF_LBA_LBA1_SHIFT)); diff
> > --git a/drivers/media/platform/vsp1/vsp1_regs.h
> > b/drivers/media/platform/vsp1/vsp1_regs.h
> > index fae7286eb01e..12c5b09885dc 100644
> > --- a/drivers/media/platform/vsp1/vsp1_regs.h
> > +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> > @@ -766,6 +766,7 @@
> >  #define VI6_IP_VERSION_MODEL_VSPD_V3   (0x18 << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
> > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x1b << 8)
>=20
> I don't like the idea of using a value here that could really be used on =
a
> real device somewhere.
>=20
> The hole in the sequence is only there because we havent' seen a datashee=
t
> with 0x1b defined.
>=20
> If there truely is no version register on this hardware, we're going to
> have to make sure this version value can't conflict.

Currently, I don't see any device with 0x1b. If in future if we found a dev=
ice
With 0x1b, This can be moved to a higher value for eg:- 0xfe.

Please let me know your thoughts.

Cheers,
biju

>=20
>=20
> >  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> >
> >  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
> > --
> > 2.17.1
> >
