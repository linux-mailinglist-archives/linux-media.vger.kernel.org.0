Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B964D4D7AFD
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 07:49:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235379AbiCNGvC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 02:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbiCNGvA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 02:51:00 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5163E0DA;
        Sun, 13 Mar 2022 23:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRj3q4Xw43fOQ6mM5fyH3x9Rfn+E9ohBYLXmagftYsgoAenarGXix2AzKwqjS3tt71ZNOZm5idwZyWITA+iy4Ebkh7GCmp4uzhQLscn+KXZWPstfAIE77Vz3w0EeD4T7dtxVC2Or6qFWKGDn3FEVntkII0y9WSPRVZj/yeuluNZtPfBFlMJ8QR8bXug7ZiuCy8bHO67765JDCVy7tybPC1x71FuX5aU6sVtQ5VKVNgl31GKje5v+qyLaXTUoSikS2vOdtv37Ycq2fDmtw+VcExV2K8eAz+bRgCMhGIRKn96CpWh69K38DJ+0HtADnEmelIMrTYCT7CL/LxeECrZ/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqFep2CM4CzsdYkcB/BDzjj3rgAweRj2i4tV034c9BE=;
 b=YYUMG+9JR+qb2cr7dI8gowww1K9tZCVcOo5frDbsUIhu2d+7kg+qIGpUakmZnYbDaaHq81adakKCfR/T5CNbWO5jqi6W5Ss3Fo/YGFOS4IHVJk7UAiD1xSZNp09kE5iL4Ady0ovvcBfRWf5NPTs9FOq5GZraH01AUG3pdtkoR4U8LgJl5yzTQZDKr7wFWhQMSgu0ZXLmYS+rygY51uK7zOQeFPrmi4CTWaHAginWcE9L1bT3HA1xptFWdCHzMOGlbL/pi0veEdx6opMZlOYJLYZcp/gh6hmM+nOhWmrouWlJzUvZUse59JodXod50FsGSmwsMbXOC16fDEFVY6lYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqFep2CM4CzsdYkcB/BDzjj3rgAweRj2i4tV034c9BE=;
 b=KDmwiDlngfLiiO9gpVAM3Nvyz7e2Z/bn8E/CVw+GYlWR16jao1M13kxqj5lHu1wE5zKmlZoHjN0mLOATzGuPh42ZpM6E3QFuzI4DvEz+8Gwd/AhIs63jT1dbbWCgc4mfTyJwMhyX1g53dZib0Jtvs9MmO8rp41onYyPniEDyIas=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2671.jpnprd01.prod.outlook.com (2603:1096:404:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 06:49:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:49:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Topic: [PATCH v5 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Index: AQHYNe0Uxm1Cp5Wt60mEbx3c4vXZCqy9U1AAgAEfSLA=
Date:   Mon, 14 Mar 2022 06:49:46 +0000
Message-ID: <OS0PR01MB59226D729D9246D59B12E207860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-3-biju.das.jz@bp.renesas.com>
 <Yi3zxKdAZTTEhLXw@pendragon.ideasonboard.com>
In-Reply-To: <Yi3zxKdAZTTEhLXw@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 418bb58c-4580-4cee-1a3f-08da0586d418
x-ms-traffictypediagnostic: TYAPR01MB2671:EE_
x-microsoft-antispam-prvs: <TYAPR01MB2671FCB1064089E215AE05EB860F9@TYAPR01MB2671.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ec/JBBeEZCngKNNvSklQ1MaXI++aUediHPAvbvFsU7PmEhwgGUiRs3JcCfeOqjk6vuJXC3e9FoxiIeqdKkDcKEtCZCMkHmzlj5FGTqXJScUapT18UPBgxQOQYXcBXAX/5yTa4NMrUKAFuysdnF6Z4wHzpA7tWQYEFWgK7wHLMRkJepjj3IHiIwRhWXRL9Xr28HxVuWNGvOkqM1JHWz0aBQ67i3EmQ2kzS/32EmRLmVbbsIZsRVpz6vyLHKvWS/kpFq/k+qC60HB9+qYj0UE5d7Uiivjc1rHryEefkSHl5+Q44ajrUwfMdOOqGIWQsTYtcipfKbtvrREPl1j1/I97V07Cn4MwVabdSh25XvEKkY8fdVIAgSewqC8HmC2hMe5Q74u7J5eiUVa+DJeDo2MADrN2Bq8baaVbZW/RjUWkS7kDjFUu5+Ow+GuEFKBfzWxZH0MkXzbndf6OY6C9K8CKX7+So2gyEmVfLYToq5gcrZhIUgJGQHNZW7KpePRJj+/mqiMA3sv/WezJv5TNBDQb0gf3GKnBS9q9NHjM/eeS4LfwpqwelaRRYUdFjyO151hTRsZdWLYmtvxynmkrU7hiX+r19oMngWmgBRgdXk4HWX8aaXo7jyty5ARnAoS4nHtV2/vfZF02zPbLT8rxDLU3WfpyQ8HtAe+Cra82wFpF7gLUR9V5Qlkslqpb5U1mnIKr3dg86cxVB1aBQNtI2niE+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(71200400001)(38070700005)(6916009)(316002)(33656002)(86362001)(508600001)(54906003)(107886003)(83380400001)(122000001)(186003)(55016003)(5660300002)(26005)(6506007)(9686003)(7696005)(66446008)(2906002)(76116006)(4326008)(64756008)(66946007)(8676002)(66556008)(66476007)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DTBweWl6YqYNIsiUutvcemnW1O7stQEVgkS/O4R7dlMiuN24Nis7SQwjIuTG?=
 =?us-ascii?Q?HKY7ilFpmdmkw/jBgLHObg2RYkjiQuq0H9/WljFc9QeGT7X5dYtbvb//p9rr?=
 =?us-ascii?Q?pW6BiYzSdoUI7NO6uU9Pt4vbm0zPDjBkdbV/e458ke1R3euXlz1tQTwl9M8u?=
 =?us-ascii?Q?XPLUhsuX8LNdNK9mFeRPIZuJcUFMZ4v5DkgPPu9IoUvU+5zciHhgxhYCq5yY?=
 =?us-ascii?Q?Yd/Mu+2ReQdHFFSI4NR8Qvb7KjcQ9rOY9mleqjEIDo6cHdJ+wkEFYjJ9P8Zr?=
 =?us-ascii?Q?3L+AMHRggii4uWe3UOBOUKSWqHYJPKH0mmYV7RGM+IvBwkhrkP7fEzlt5aZa?=
 =?us-ascii?Q?qvYqiXFzTfYM5tipLskS/wprVUNS/RJXJ1IKh99YV7ErM3efkwP1rh39uUw2?=
 =?us-ascii?Q?B6XBxMRrWolb/q2zDlzfm83lGX8j4tm4viOuyaacKvCHFyWcx2ZFG5jKPEVt?=
 =?us-ascii?Q?0K864ki22ODZh9vxZ28eNP2EmNpzuej7irF5SVUmx9me8KLFnnecDaOm6727?=
 =?us-ascii?Q?5LCShqSN1dYtdPTZJFUQ3I7lGfopM0jRqQ1ywxJ9TJvLhOyo4Zea1xR2ed5+?=
 =?us-ascii?Q?QomvdfcI5DBjtjEcXyEH7mbl1+h0LFlr7zxMfO9Loo0J5iH5oXP00K5c88bu?=
 =?us-ascii?Q?Il76mwHdqaR10jHDrkhLnul3U1RZJJu0tyImmiBV2h+fqEzr1WP2GqRws0hO?=
 =?us-ascii?Q?pJnkRr1Py42d5Hdvf7wxU8AV2HOoirNtAgJkB4nbhDx8+wQ7vgR0+OHHVAH8?=
 =?us-ascii?Q?4gXtHszCVZR3U8+WX7OUHxNhdLrJ4EVedltXqj35jd0BCIQyvVeQrLUsMKgh?=
 =?us-ascii?Q?/yyMKHYJtz1SXUVCpkZwe2NqHCbzvXX64JxIgwPlwpZ7M42uOOnc8bnB5F3S?=
 =?us-ascii?Q?HkRj1yVdEeaiMWGQw7TDIs4BN07hwOGlHSKmKHk9emv3NlZC7qyKcBONGOgo?=
 =?us-ascii?Q?P2WzKKOo017rRMFQpSX9Abe+/zYgk3q17f+7+ysk7U4VwTBbJ1KX+1Ps5Uab?=
 =?us-ascii?Q?smZiNv3JaKFTyBTlRgSfr3+86xrrbxBRvccSNkUVcw5C5zFVynJi2U2Dyivk?=
 =?us-ascii?Q?vyVChpDan1Iu3CvLsoZKNLNNRwHHQYuiA36rpkv/jo9l++p5kXGk640BckF1?=
 =?us-ascii?Q?QYQSYK3OsrAFwOF4XOUP9FAa5/60OGknKWjyzNfHolO7CIhpUTqv6uco8L/o?=
 =?us-ascii?Q?xYZCybgfoggIlKkIapZbsxzrGrP5P38ExM4fKL4SsaoGw4UXOSU46BW8JAKq?=
 =?us-ascii?Q?2wWAoAdyi1hfLoxI2aB06FnwQ+bAV2G+LWkGp305vJuREs9BZV8U1NPy0cfJ?=
 =?us-ascii?Q?FBGJWezxizVPc5/FgchE/5Qi01DEy9DzzoYSEVfmvgQmyP7QE6mTnm9SSG0C?=
 =?us-ascii?Q?GZ3/dgYYK/M+iXRWScfUTDfYgp3FUdHxD2k4RDj2mwxv2nM1s3Gcn6O9sbzm?=
 =?us-ascii?Q?Yl3R/qlM2GtWIpyIWig5s7r4QQBN9aWjFhpJ38WJlZksBWMETgJrow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418bb58c-4580-4cee-1a3f-08da0586d418
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 06:49:46.7515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V402gbdqTHABa4phAWf6TTidy1KlRq1U3mEAj0WSXMF91oesCX1zYE4c6AsBfnGEjDvCnrbk9yzFo/zbhVpMmT6wWLTcmR5oE60LpkqJlkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2671
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

Thanks for the feedback.

> Subject: Re: [PATCH v5 2/3] media: vsp1: Add support to deassert/assert
> reset line
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Sat, Mar 12, 2022 at 08:42:04AM +0000, Biju Das wrote:
> > As the resets DT property is mandatory, and is present in all .dtsi in
> > mainline, add support to perform deassert/assert using reference
> > counted reset handle.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4->v5:
> >  * Added Rb tag from Geert
> > v3->v4:
> >  * Restored error check for pm_runtime_resume_and_get and calls
> >    assert() in case of failure.
> > v2->v3:
> >  * Added Rb tag from Philipp
> >  * If reset_control_deassert() failed, return ret directly.
> > v1->v2:
> >  * Used reference counted reset handle to perform deassert/assert
> > RFC->v1:
> >  * Added reset support as separate patch
> >  * Moved rstc just after the bus_master field in struct vsp1_device
> > RFC:
> >  *
> > ---
> >  drivers/media/platform/vsp1/vsp1.h     |  1 +
> >  drivers/media/platform/vsp1/vsp1_drv.c | 18 +++++++++++++++++-
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/vsp1/vsp1.h
> > b/drivers/media/platform/vsp1/vsp1.h
> > index 37cf33c7e6ca..c5da829c79b5 100644
> > --- a/drivers/media/platform/vsp1/vsp1.h
> > +++ b/drivers/media/platform/vsp1/vsp1.h
> > @@ -79,6 +79,7 @@ struct vsp1_device {
> >  	void __iomem *mmio;
> >  	struct rcar_fcp_device *fcp;
> >  	struct device *bus_master;
> > +	struct reset_control *rstc;
>=20
> This is missing a forward declaration for struct reset_control.

OK, Will add forward declaration struct reset_control; in next version.

>=20
> >  	struct vsp1_brx *brs;
> >  	struct vsp1_brx *bru;
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> > b/drivers/media/platform/vsp1/vsp1_drv.c
> > index 502c7d9d6890..699d7d985df4 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> >  #include <linux/videodev2.h>
> >
> >  #include <media/rcar-fcp.h>
> > @@ -569,7 +570,16 @@ static void vsp1_mask_all_interrupts(struct
> vsp1_device *vsp1)
> >   */
> >  int vsp1_device_get(struct vsp1_device *vsp1)  {
> > -	return pm_runtime_resume_and_get(vsp1->dev);
> > +	int ret =3D reset_control_deassert(vsp1->rstc);
> > +
> > +	if (ret < 0)
> > +		return ret;
>=20
> I you don't mind, I'd prefer

OK for me, if there is no objections.

>=20
> 	int ret;
>=20
> 	ret =3D reset_control_deassert(vsp1->rstc);
> 	if (ret < 0)
> 		return ret;
>=20
> > +
> > +	ret =3D pm_runtime_resume_and_get(vsp1->dev);
> > +	if (ret < 0)
> > +		reset_control_assert(vsp1->rstc);
> > +
> > +	return ret;
> >  }
> >
> >  /*
> > @@ -581,6 +591,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
> > void vsp1_device_put(struct vsp1_device *vsp1)  {
> >  	pm_runtime_put_sync(vsp1->dev);
> > +	reset_control_assert(vsp1->rstc);
> >  }
> >
> >  /*
> > ----------------------------------------------------------------------
> > ------- @@ -827,6 +838,11 @@ static int vsp1_probe(struct
> > platform_device *pdev)
> >  	if (irq < 0)
> >  		return irq;
> >
> > +	vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> > +	if (IS_ERR(vsp1->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > +				     "failed to get reset ctrl\n");
>=20
> s/ctrl/control/
>=20
> With these small issues addressed,

OK for me.

Regards,
Biju

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > +
> >  	/* FCP (optional). */
> >  	fcp_node =3D of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
> >  	if (fcp_node) {
>=20
> --
> Regards,
>=20
> Laurent Pinchart
