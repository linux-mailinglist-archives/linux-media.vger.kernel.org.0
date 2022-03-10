Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660BA4D4FE9
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 18:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244279AbiCJRHp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 12:07:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233068AbiCJRHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 12:07:36 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26A51156945;
        Thu, 10 Mar 2022 09:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoSl4EGyCCiNVzCAOrMg5rliF3Mf4Vr5COLzobt9dgia3FWPE/M0tRcGgqXrYyFJrGQY87LQUd/WrqoA+shez4NH2zhNWnOwJdB8rkTNEDtHKF4qaLJvnkyGG36FA5xUBggroL1q0K2XDB4GRiHTBz36//qW2NYeDz9feVT/t81PsKxQt7BcjUyo58x15xUfhakMZuBw5eVOr5yV23IOoDqcS7JiqkKEZD+q7PqwK3/QfVsAWu46Pk7hOCOXRlooQsTugzM2Tgeo79PCoWYNXXe6MTKEY08lS4bkEC6VJc1EGNqi5l3gE5Q0v06AbfbTkLAXnCljn8C/d4e1RHjjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5wzSIdFJrmr4VG1G6j6UhagGwSLwD6GXamVJtZlzLI=;
 b=oZCv9TZKyEql5ijsZ7WZfvzuaYFigPx5Jj3RX7lVkXVmzwijk19nEHeRw1w/wPvrm+QlKSys22q2JUkMMeXOzSpbUWrF8OQ6+IZGsz5MlaiW9E3Kh1qyTdousa8WLV/goBIqwmJe14FTkcs8gU8A52mKaEYXJ7cpJnmoiL3xK95qAp6dJ+7SJG/w4NpggtkoU+m+UeHBXQ0RLpPrPmhA2VZyrqYt23qXV/Vfs1fX3R1QFJHnW54TQAeNzbGt4p8yQEpJeUTVCFeCgwPsGWb3431tmR6/vM16xF9BAxXmRjDB9QwSJthXwSfD5kCuWC4y/2przI2C7ew3YY8UxclHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5wzSIdFJrmr4VG1G6j6UhagGwSLwD6GXamVJtZlzLI=;
 b=cEzt9KGdttJza7oqLKR8rtWEyQifEau6bP5S6PjLv0m4K3BjH98ohZDUvQ+I40WAD/EPDwaBolr2ujCszcQztV8HaBM+lgn84RfJD/gm6YtlctO2aaXn3U0F1qMZJ2dLgurEuUKd9gPwedAZ0HSHBxTW1Gmspgt8nnFOTSGFOzQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB2535.jpnprd01.prod.outlook.com (2603:1096:604:22::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Thu, 10 Mar
 2022 17:06:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Thu, 10 Mar 2022
 17:06:33 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Topic: [PATCH v2 2/3] media: vsp1: Add support to deassert/assert reset
 line
Thread-Index: AQHYNJvevkNXUXWNR0u/YmwBKE3ysqy40BaAgAAILdA=
Date:   Thu, 10 Mar 2022 17:06:33 +0000
Message-ID: <OS0PR01MB5922DE0A5F0FAB8C34AB0C62860B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220310162814.22234-1-biju.das.jz@bp.renesas.com>
         <20220310162814.22234-3-biju.das.jz@bp.renesas.com>
 <5321c864355578750d814024a1902ce2362e1f9a.camel@pengutronix.de>
In-Reply-To: <5321c864355578750d814024a1902ce2362e1f9a.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5045138c-e785-4755-5b40-08da02b85403
x-ms-traffictypediagnostic: OSBPR01MB2535:EE_
x-microsoft-antispam-prvs: <OSBPR01MB25358B0BAE5F76452F0B6BDF860B9@OSBPR01MB2535.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Czw1GTbpYT0c5Dyw2CmPtVYpcZ1bTvlZcYixS9NLTjZfDxGzDVVutUph+8cjFwAoisn9Fh7snHHGEM83Rqd5yGdrFwJrSKEuzNOhhj7dCxeDJmqZOLB/rSA0XNOAa0TlD9d36ywJJ6PsOo1VzalmVHsIrlU5oMZtv/nN8Q/YbTbEiBPAzLMFla7I4ir11EbDK56pNCvXB8uEOcvd39rO20lcKoEjzCh+083C1wgJYjxcieqmyQ4fjnKUWyS0XaEYer4zsBOGgQM1gfVOJ5txYWa2qpZkVWmq2qyn6BnXaegJriRLi9JptASBzwmfXGH+RdfxlBwqWuVtO1Z2/wlFJD52HyUJJ4va+zRYtSgaMKKpnu9Tgtleob2LsN9MpGzYkVAH4dVnwjltR+p3g1N57GXosFLxbLEi9txA6RYnxOsmKbHhQwjoEBS2hczWmPS1P8ktUPSMXXyx49Cvik4YyogtuptIbVG1moisOmrRmPblSyf2aET76EUNydH5pfIxhkuNsmY265jKhZm1V7kzXVlu2J7uh5enNtQLQ7+P1zqhfBn02ESRu2wqEsF27zyz/a/gbVab9t94MH1GH1OsR2qodgSdsZMwmJ+WfrkUsrJPV8qIBDB0LHduc1iGq11kpgmBV+l2/LIOlNUCJNJgx/WjBxeBMVO+wfer01po8SNR34r5hn2QQ2Ed2rip+1pqEtgQXPc6GgYOhZGUGUSLoQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(7696005)(4326008)(71200400001)(8676002)(6506007)(508600001)(5660300002)(66946007)(122000001)(66556008)(76116006)(64756008)(66446008)(66476007)(8936002)(86362001)(55016003)(38100700002)(316002)(33656002)(52536014)(110136005)(54906003)(2906002)(83380400001)(186003)(26005)(107886003)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JJQHlJBmeg7FUHz2TBdqbe5l6f99gSDuAAwchixFKUn3LV86R3PNIzpBdT?=
 =?iso-8859-1?Q?LHhzNFc1qgKLHapfU8SjC45I6LqB8iJACURppw9TQUdxIDakNtxpPH9YBL?=
 =?iso-8859-1?Q?D4ZjzSQXxposz6zYSoMlBJ9rD9P1X9LcAWluLRpqMeXMeDqrNnJ7JGZDt2?=
 =?iso-8859-1?Q?+O8JFvBtXIAOFTWKAQOymyxOtQXhx5dPK1FyjRfuSOoAMUIM6N/UBbGpAY?=
 =?iso-8859-1?Q?QwTOyJSTYmhWmFLGTjn/A/c8T0FGU2vKkNQ7+IHYC31NM+mrCm2Yq5ACZO?=
 =?iso-8859-1?Q?X4/DVg33Vs102K+5mcYyd18xJ30hd28RrFBnAT7GsuN4rq6XxNtpoHjN1L?=
 =?iso-8859-1?Q?2RvfTrj8DJE4ECl6LomyclXf/O/wcxrVVRXrgq/cXYLZp2MVg2/Fkt0Oxc?=
 =?iso-8859-1?Q?WpB5B/JLHYx4zN5OyjlYt+xtdanAQppdqkgag2bVAn5QEUlR+oocD1D/B8?=
 =?iso-8859-1?Q?K1z6OXryiDa/kIjhP18YypnDukicg7XD8faO+Hc5kAF48dwLPEx9Mek6uo?=
 =?iso-8859-1?Q?spVpE7GAts/7+F5uYNEpBqWNDe7gfBKdRh0D0HSp7tZ7Pl4L3hwk9sGKQL?=
 =?iso-8859-1?Q?P6ZZ6w7EQc3TyuTqK3onFH69HY9YYf3mLlcAPYxuRwLKF7B7aLLB+UOSuw?=
 =?iso-8859-1?Q?6Hl6qNlUvuM9TBUcGY0NE9TBQAlmINx73RwiMgrcG401tshmTtUqaE5wOx?=
 =?iso-8859-1?Q?ffs3Pmm9uGIIEKLyz/wil4Sf2lEDL6RHt+Ex0YgWKQU9PmFXCHPjQ+QAeM?=
 =?iso-8859-1?Q?t1hG51THba7rDv60OMqIDCNVsV2qS+YV/rUveDFhiWMUvuaHjJ5Hx2OLqO?=
 =?iso-8859-1?Q?V8BWZl509wvyIXo0Z7nxeKoZq2R9e+TNwdx/ofL3vgzrs5MH6Z4CbCj7YV?=
 =?iso-8859-1?Q?bRdKJrOjT7t5wc/rm1IhCFG/DB9kg6VBHwbss5G05kIJIOFVcs6FcG8kH3?=
 =?iso-8859-1?Q?rS+HrKMHjFmfOrEODgd0xy9diSHPOK9Jea8EjnV259BCaebyXAd/ZKWKpt?=
 =?iso-8859-1?Q?iUcxU9Q1k2TEtr2foVApLUBmDXeZlGbYjwj6sqiHQv0kBz7GpIMrkWgUUJ?=
 =?iso-8859-1?Q?AckJLXDrnPMaXsD56Oe9AF/TZ7Vj4yaHYQsNykIAYi376ZJzlPfxqOtSO4?=
 =?iso-8859-1?Q?GecKV29AXk+LrTWuBidvZLsdsDFNdfC7tF63q3SGu676BztcWKoX951YkE?=
 =?iso-8859-1?Q?T4HnVPZdNgtMSLonNaBhWrWjo7iE2bVDnaKG8ZFZYTu8afxeYuSa63A0Ee?=
 =?iso-8859-1?Q?n/HcwYcShUcNpFF0c3IdJ/pqkvTOCTqg+pS4tfEYc6rooeNfNRkKQpF4/5?=
 =?iso-8859-1?Q?nLfq2iZ39rj2IQRVirInymnf85AjGyk+fnGcZpS1L8ZLTcz/xMPkoh77nk?=
 =?iso-8859-1?Q?tuyNkBqSU0Q6ScVH0yOzcClRWNlS1Z5Wo9mqCMlFRLPdxFO7NGyePOyt+j?=
 =?iso-8859-1?Q?i3FuAJ3ZScznrIAm8j+G7tVfSaZVV5eduTIYVd1K8y5GMhhUsVY2omXDuc?=
 =?iso-8859-1?Q?J8yJAqBQqkf//rwDn7e5igegswQwP8E5A2sAs/N3vrUA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5045138c-e785-4755-5b40-08da02b85403
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 17:06:33.2777
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YxbaJzkJYialW0QMFedDWbntoJ4lftuJm13uuIeMqJ1K9yrLCO0B8AUr/6ktCP1WxqxBnBlq3KCFACwlTd/rAccTF0tTDiYkBGt7QukjGS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2535
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Philipp,

Thanks for the feedback.

> Subject: Re: [PATCH v2 2/3] media: vsp1: Add support to deassert/assert
> reset line
>=20
> On Do, 2022-03-10 at 16:28 +0000, Biju Das wrote:
> > As the resets DT property is mandatory, and is present in all .dtsi in
> > mainline, add support to perform deassert/assert using reference
> > counted reset handle.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > =A0* Used reference counted reset handle to perform deassert/assert
> > RFC->v1:
> > =A0* Added reset support as separate patch
> > =A0* Moved rstc just after the bus_master field in struct vsp1_device
> > RFC:
> > =A0*
> > ---
> > =A0drivers/media/platform/vsp1/vsp1.h=A0=A0=A0=A0 |=A0 1 +
> > =A0drivers/media/platform/vsp1/vsp1_drv.c | 21 ++++++++++++++++++++-
> > =A02 files changed, 21 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/vsp1/vsp1.h
> > b/drivers/media/platform/vsp1/vsp1.h
> > index 37cf33c7e6ca..c5da829c79b5 100644
> > --- a/drivers/media/platform/vsp1/vsp1.h
> > +++ b/drivers/media/platform/vsp1/vsp1.h
> > @@ -79,6 +79,7 @@ struct vsp1_device {
> > =A0=A0=A0=A0=A0=A0=A0=A0void __iomem *mmio;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct rcar_fcp_device *fcp;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct device *bus_master;
> > +=A0=A0=A0=A0=A0=A0=A0struct reset_control *rstc;
> >
> > =A0=A0=A0=A0=A0=A0=A0=A0struct vsp1_brx *brs;
> > =A0=A0=A0=A0=A0=A0=A0=A0struct vsp1_brx *bru;
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> > b/drivers/media/platform/vsp1/vsp1_drv.c
> > index 502c7d9d6890..dbe90ceec327 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -16,6 +16,7 @@
> > =A0#include <linux/of_device.h>
> > =A0#include <linux/platform_device.h>
> > =A0#include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> > =A0#include <linux/videodev2.h>
> >
> > =A0#include <media/rcar-fcp.h>
> > @@ -569,7 +570,19 @@ static void vsp1_mask_all_interrupts(struct
> > vsp1_device *vsp1)
> > =A0 */
> > =A0int vsp1_device_get(struct vsp1_device *vsp1)
> > =A0{
> > -=A0=A0=A0=A0=A0=A0=A0return pm_runtime_resume_and_get(vsp1->dev);
> > +=A0=A0=A0=A0=A0=A0=A0int ret =3D reset_control_deassert(vsp1->rstc);
> > +
> > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err;
>=20
> If reset_control_deassert() failed, return ret directly, do not jump to
> err: to call reset_control_assert().

OK, will fix this in the next version.

Cheers,
Biju

>=20
> > +
> > +=A0=A0=A0=A0=A0=A0=A0ret =3D pm_runtime_resume_and_get(vsp1->dev);
> > +=A0=A0=A0=A0=A0=A0=A0if (ret < 0)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto err;
> > +
> > +=A0=A0=A0=A0=A0=A0=A0return 0;
> > +err:
> > +=A0=A0=A0=A0=A0=A0=A0reset_control_assert(vsp1->rstc);
> > +=A0=A0=A0=A0=A0=A0=A0return ret;
> > =A0}
>=20
> With that fixed,
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>=20
> regards
> Philipp
