Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53CE15A38A5
	for <lists+linux-media@lfdr.de>; Sat, 27 Aug 2022 18:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbiH0QID (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Aug 2022 12:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbiH0QIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Aug 2022 12:08:02 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FCC22A97D;
        Sat, 27 Aug 2022 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbNS/3L6VM6owMNTP4TWiu40t9vBrUVJgpK+sOZ0YnD67+ny6yoPDw4wrSSFsuOS9D5Xuz7gdPCT9UhGcf9HoDXoglWv2sGclcgnsDPdurxcUhDznpxIOCMNf4P0NhtQqZBl7eFGfhPFNRfSqd6RwBlIJCPyGC2jNl57z1HOqDfGd7qQMJgj+33L1QIbts83mLacRimUF4NprAY4xL2gqtvnLR3x51m25j65zL2SoH2Ey/nmSaNSdUtn+HZUC9KpiSXwfs/gw04wtc25Rn6FrS91hXOA0N+rnD1fyjJ2HNwpl5j3IsEE4vPAh2R0CV2RRyOAy2yIvLbPThEaIYyHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p8et98+Y+7jNsVEMoE/V06GqNka1FVRso973bhy8TI=;
 b=H94rY2KSzaY1u/FRjCnXfewIASPX3HtEFIkvwCRDCZDW322RfIxzG25uc0HIrA7PNM6CIuPnuvX20hcybx2xD9mDOEIfcSOHW8ckvaRNseu/hVWTzL4y9SagRXoPslxen84wYd37acv8Kjt5fnOvV5vo0WjWZ2RJJ+01kYs0xv0cZzzaMHG8fibSmYQL48CWOikNgLp+p8MUXoGJIFQOeRRFOKLsxJXmqTqXDGCLKXPPOb/ia4NRki12mbM2h+Tb1lMIoJLPWtz+gNPvjOyEUjLCttgdGzaR6gnjtukSnCH3WqYed9ST1caVH8ZCWAQtzC6N62MffkhHH4gDNFZL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p8et98+Y+7jNsVEMoE/V06GqNka1FVRso973bhy8TI=;
 b=XBENeyIVDtUsPilGalxFN0EUd/sJVbDqOvblI8+EMMaByp/uXkZL4EyFZwugrs1wTisUePjIt8PNPtlDf9rPHOSnoRX9e4X5a2qU/w+YSoiHzTThgWMa4SSTroxpHxf8UJeFXaD46RJ2nICeaO/O/FvptSxfhFVueiEthX+wKMw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB3392.jpnprd01.prod.outlook.com (2603:1096:404:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 16:07:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::14d3:5079:9de1:ceaf%3]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 16:07:57 +0000
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
Subject: RE: [PATCH v13 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Topic: [PATCH v13 2/5] media: renesas: vsp1: Add support to
 deassert/assert reset line
Thread-Index: AQHYuIWrnFcbHNn6hEGY7173Soh9Zq3B64SAgAD/zhA=
Date:   Sat, 27 Aug 2022 16:07:56 +0000
Message-ID: <OS0PR01MB5922E5A8E32F547787511F7C86749@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-3-biju.das.jz@bp.renesas.com>
 <YwlpH2kHv0aPwTx9@pendragon.ideasonboard.com>
In-Reply-To: <YwlpH2kHv0aPwTx9@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: afb59569-49ab-400a-2d5d-08da88464e5d
x-ms-traffictypediagnostic: TYAPR01MB3392:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O2nhNC905FhS8L3DFRfGF271JIO/+cBuF+aW+1sDOzl3vmMdhAUMrGkx9fW7gT6M29V/CbFfzuYAUZ1bjFjqJJSoMXhWpw4zo1t7l8gvLOBYivp29bNIFB8DEonB55sh/Ngb9sPHl7GYwfmm9dE4mrF7DMIgQtX3hAzGC/jX/tli+fXxw5nq8gTR7VgzxmgcjMXeG93hIekLFcIXmzgKmqO2R3YHaAivjg5gH64WoARiaR6RsDJgIh9PGhffcPR0/R/22IFm4feEut70pZVvon8kZ0b2OyFEHay57DwyyE8WO/FQxz1pEJuRIA0ySMkfwPS9nPjQvil6oDGrWNurIwHfPB2Ohir4e7VZuGh8ifusCwDa1fkk0Y6i+d6fbLjD5OUFnN3i5CdhUaAs5OHJ8/Az+xqmxrFotgul6OdL+82wd+OUqIJaoaEk6Js7/KJcWP5GFkz9mBwjo4CLnGPamg5SazpgRYU2QkXc5ln54Hodo798l/lU2QeYmsRScw9RsrwfyVVYwfyhvIPbZg7aB7W9OfwapsHz7e8tHfH36uLPuWTc/tThMWn7Jvlk+krv/YqInmo4LCMAzeAbUqveiohmOk7o/DZ3BSHAfWapmatieV6Y37ydWOxjgrT1+rJ9209C6q2b+ETcYAJsWWYgiZ0L1ecp+PJz3CKgDls28UNzbQ/BgoZAAANMYNoubJXPNvNRW4y77M4Zr/BDRHUNMqLrbsg8+lhu41Ff5nUcDYEi4tDtyvSvgF0euZNvpVWWxMr1QuSekUb01Hk4VyHMXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(366004)(346002)(39860400002)(376002)(26005)(52536014)(38100700002)(71200400001)(5660300002)(478600001)(122000001)(2906002)(33656002)(8936002)(6916009)(316002)(76116006)(38070700005)(66946007)(66446008)(41300700001)(107886003)(64756008)(66476007)(8676002)(7696005)(186003)(66556008)(86362001)(4326008)(9686003)(55016003)(54906003)(83380400001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4EzK3+achj1bm4d+XxlPZIr5W8OyDBg5toeuDJOdTpR2naUlZDea4eyG3LJV?=
 =?us-ascii?Q?SoaJmglfpazUqB0gJDQAy0fmRecOet9BGL7ERqjrR4KPi0Z1HKbNVM/g/WYa?=
 =?us-ascii?Q?aWnnlITvvUM5+9GHhciwhw8zzB0scab327kdo0TO5pGcJzsaTSN62gJZaQyU?=
 =?us-ascii?Q?TutP0fXIE7Y4M2yA2FIfWin3haed2Teeoue1swfHM56jkFrw/fOcCnJPCzTq?=
 =?us-ascii?Q?F+SoKyGMly7RR3I5fLH/ef/ov3hHk9McKU5yzSKAYIG7FiHMJ6u2b4/yuKCh?=
 =?us-ascii?Q?bJZIhT+a1/PQBltxrlBIJ8etGCjh7OFoVCC+8KPv/TMtqi8fxxBN46vwF317?=
 =?us-ascii?Q?6/wRpmKiEwzkZVThkC/q2kuqnwbuPVc796naUf/0mFhTqPe3GQZVklEcD9SI?=
 =?us-ascii?Q?tS9HkM76bLwpeD8PeEWMhrd2o7BNgZ+U4zfCOoYkqJZBgTMuKOdwTIJZG37G?=
 =?us-ascii?Q?T6QBieJlhEhVCk+9JuRzqJKFgc9VSpWudTjccH10HoUCjYsnXCblH9isDYpo?=
 =?us-ascii?Q?i2vmvc1NxR7Qx8gfeSE3TAufj0x4bYm/bu74lgb5+I4/zjiki9/QVShIHyri?=
 =?us-ascii?Q?be7t65Nk4QlaM8afizOJanEWU5ryROJCl6zXOhmeR5/jeAjPkbxGRjbMDKrv?=
 =?us-ascii?Q?lqTqf3nGCgptgHYux4sZ5z4F+YHD6zer81zRqb4KDxOJ+D6hzWowwY0QT0+u?=
 =?us-ascii?Q?Hr3X70LFMw9l7Z3j1WExkIciAAp5fzOuX0+FtwTxb4hep9zP8BgdVhkH8c+L?=
 =?us-ascii?Q?k65AUygI/x6jPBfMBgswf1hJ1HVGB5tyFzUApSr53e5K+injTX8bLlE6qyP7?=
 =?us-ascii?Q?/xYH9YrOGdwQnLiXlrLCgsAOpg3rADJgCEuzD6cPS8TfJh0s7cfO38LAyglU?=
 =?us-ascii?Q?WluXY/e+vwLGjs2gFjyVVqfmxtr2SlIrEpYHklquGGAkoOKUqgju0oht9mmR?=
 =?us-ascii?Q?RTZ9VQOQ8y2Ylcu+8wgHjbtH+mmWlaqFDLq3DNwxMLU3Sibdgj2pXeQYd9xG?=
 =?us-ascii?Q?09+6gR6zFhedCba7qP2PRJ9j8+muDcrWQsoPDsqjEnpKJgFR2CzeSUMgTAPa?=
 =?us-ascii?Q?uMtnGLWSTVZx++TWrAs3r2glG/mvYkQo3Fvdpiey/2HQOtlzNhi4IdVI8PLk?=
 =?us-ascii?Q?p7gG9au70tDPQ7pU0Kfck7ReyraiZ/eRzl0dyGeyKgk6wYWyXZOmIaEAbvF9?=
 =?us-ascii?Q?dIA1IL2YAHWp5wkBvA9i1g/bZ7ck+W83wWj23KDTqt+mfWdlPSkvxg7c+gnN?=
 =?us-ascii?Q?YmmXqK0Ln6WWfjd2TbzU42z7LQ1bhFK9WemH9DCZ1wdyVl9P+CaTjzjNCCaI?=
 =?us-ascii?Q?/YNX/kcihOoebAo33xYZhVAkFViHH9qHKNwPPXUWQN0LGroMdNgKn/uTsV8T?=
 =?us-ascii?Q?h6wPfU1yiL9OrfANuhGKmGfUfW7bFKwOT+3jmv43rg0b59jW2jyP6h3YUOXD?=
 =?us-ascii?Q?//KeZpxrMumvyNKmiCnOeGGCBr7IGXJ98777rcSEBr16sFxv9ozr/M6zVU0b?=
 =?us-ascii?Q?+PuGgSJ+/fhP4XtAW7IPyoV8GsohCnaBxv+oYlH+2LRKShbFN04tosbIWL5L?=
 =?us-ascii?Q?CmKq3HZD3y8tXG3+WTvFzdXDAoJ+nZnmsE6ISIzf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb59569-49ab-400a-2d5d-08da88464e5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2022 16:07:56.9540
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JtInh3q4FV5vkEAYFOYPHNnFfQ0y2qKa7zerEtq68PsV0+26Ry2rvYsOr6QpuHOUTQloc3UhaUyTgnhJmdjpQc2ljIJ7Hq49qHntg9Waua4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3392
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

> Subject: Re: [PATCH v13 2/5] media: renesas: vsp1: Add support to
> deassert/assert reset line
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Thu, Aug 25, 2022 at 02:21:41PM +0100, Biju Das wrote:
> > As the resets DT property is mandatory, and is present in all .dtsi in
> > mainline, add support to perform deassert/assert using reference
> > counted reset handle.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v12->v13:
> >  * Removed unused iopoll.h header file.
> >  * Added Rb tag from Geert.
> > v11->v12:
> >  * Replaced read_poll_timeout_atomic-> udelay(1) as testing on RZ/G1N
> >    shows this delay is sufficient to avoid lock-up.
> >  * Removed Rb tags.
> > v10->v11:
> >  * To avoid lock-up on R-Car Gen2, added poll for reset status after
> deassert.
> > v9->v10:
> >  * Moved {deassert,assert} calls to vsp1_pm_runtime_{resume,suspend}
> > v8->v9:
> >  * No change
> > v7->v8:
> >  * No Change
> > v6->v7:
> >  * No change
> > v5->v6:
> >  * Rebased to media_staging and updated commit header
> >  * Added Rb tag from Laurent
> >  * Added forward declaration for struct reset_control
> >  * Updated vsp1_device_get() with changes suggested by Laurent
> >  * Updated error message for reset_control_get form ctrl->control.
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
> >  drivers/media/platform/renesas/vsp1/vsp1.h    |  2 ++
> >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 28 +++++++++++++++++-
> -
> >  2 files changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1.h
> > b/drivers/media/platform/renesas/vsp1/vsp1.h
> > index 37cf33c7e6ca..baf898d577ec 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1.h
> > @@ -22,6 +22,7 @@
> >  struct clk;
> >  struct device;
> >  struct rcar_fcp_device;
> > +struct reset_control;
> >
> >  struct vsp1_drm;
> >  struct vsp1_entity;
> > @@ -79,6 +80,7 @@ struct vsp1_device {
> >  	void __iomem *mmio;
> >  	struct rcar_fcp_device *fcp;
> >  	struct device *bus_master;
> > +	struct reset_control *rstc;
> >
> >  	struct vsp1_brx *brs;
> >  	struct vsp1_brx *bru;
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > index 1f73c48eb738..975e6851735e 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> >  #include <linux/videodev2.h>
> >
> >  #include <media/rcar-fcp.h>
> > @@ -622,6 +623,7 @@ static int __maybe_unused
> vsp1_pm_runtime_suspend(struct device *dev)
> >  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
> >
> >  	rcar_fcp_disable(vsp1->fcp);
> > +	reset_control_assert(vsp1->rstc);
> >
> >  	return 0;
> >  }
> > @@ -631,13 +633,30 @@ static int __maybe_unused
> vsp1_pm_runtime_resume(struct device *dev)
> >  	struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
> >  	int ret;
> >
> > +	ret =3D reset_control_deassert(vsp1->rstc);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/*
> > +	 * On R-Car Gen2, vsp1 register access after deassert can cause
> > +	 * lock-up. It is a special case and needs some delay to avoid
> > +	 * this lock-up.
>=20
> You can reflow this to 80 columns:
>=20
> 	 * On R-Car Gen2, vsp1 register access after deassert can cause
> lock-up.
> 	 * It is a special case and needs some delay to avoid this lock-
> up.
>=20
> > +	 */

OK, but after adding conditional check for Gen2, it will look like [1]

> > +	udelay(1);
>=20
> Is it worth conditioning this on the VSP version to only add the delay
> on Gen2 ?

Will fix this in next version like [1], if it is Ok to everyone.

>=20
> With these two small issues addressed,

[1]
        if (vsp1->info) {                                                  =
     =20
 70 +               /*                                                     =
         =20
 71 +                * On R-Car Gen2 and RZ/G1, vsp1 register access after =
deassert =20
 72 +                * can cause lock-up.                                  =
         =20
 73 +                * It is a special case and needs some delay to avoid t=
his      =20
 74 +                * lock-up.                                            =
         =20
 75 +                */                                                    =
         =20
 76 +               if (vsp1->info->gen =3D=3D 2)                          =
             =20
 77 +                       udelay(1);

Cheers,
Biju              =20

>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> > +
> >  	if (vsp1->info) {
> >  		ret =3D vsp1_device_init(vsp1);
> >  		if (ret < 0)
> > -			return ret;
> > +			goto done;
> >  	}
> >
> > -	return rcar_fcp_enable(vsp1->fcp);
> > +	ret =3D rcar_fcp_enable(vsp1->fcp);
> > +
> > +done:
> > +	if (ret < 0)
> > +		reset_control_assert(vsp1->rstc);
> > +
> > +	return ret;
> >  }
> >
> >  static const struct dev_pm_ops vsp1_pm_ops =3D { @@ -825,6 +844,11 @@
> > static int vsp1_probe(struct platform_device *pdev)
> >  	if (irq < 0)
> >  		return irq;
> >
> > +	vsp1->rstc =3D devm_reset_control_get_shared(&pdev->dev, NULL);
> > +	if (IS_ERR(vsp1->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
> > +				     "failed to get reset control\n");
> > +
> >  	/* FCP (optional). */
> >  	fcp_node =3D of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
> >  	if (fcp_node) {
>=20
> --
> Regards,
>=20
> Laurent Pinchart
