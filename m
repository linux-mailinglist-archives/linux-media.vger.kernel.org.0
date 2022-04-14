Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2C3500C3A
	for <lists+linux-media@lfdr.de>; Thu, 14 Apr 2022 13:35:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241256AbiDNLhW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Apr 2022 07:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbiDNLhV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Apr 2022 07:37:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6720386E27;
        Thu, 14 Apr 2022 04:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxyjfVtFcVE/bxtawLqgsBfSXGbctIfWXjvhsK/oVtHxvP+WN/7OeRCHPOJog4+bra21XVpVqB2cUtV+GWaLYbLnrLM2OyKMloUvgXDe4tBA0dJUx7Tvqrb9hNRC8BLHeML2e45anQpaSuxEE4Twzs/xo1ZKZ7ZF6qp+TTGlW+FQ8Ixv0RmmGZrH0ZYOkx4vJLV0PwUPDcWrK0tn0cp2qMaoRtV6sNVWtBCJJKf6vig4ngorCnyldTKlKkBaTUpZ6OWcWFUAxXvTqk0+o2c0R/0b+XcVFw7vVsjzH/DIHB44S0QQkjgZ1grPTgQ3INaudjFH8CLT9Wx3iye8XWzc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wd+bbqs8dCcfZ1G6JNpQg1LACvMNZ5CyoM/p24ygqZg=;
 b=bh9mHQc5tVMSd+6KuyKqdCYnNKeXqNLbrfqC4jolihjvUFEdmT2KcTIpKnM0YmZJTDJSJuiVFcmlL44/gLZBuBfpOSHfrv6Rv6+wXTGf+1gagqX28Q8thLB68wsdA58ifkclXQPdTHl0vTREXz9E5OngZ8CFxwAgEdreo34O1OctsXywUghWgfmyDzU9r9Xsl7MQFY7aJM1XB7bg3HlpagEaxxHGpWaaAV+z/bWopLYciqYBF5PRCxzcLrJksxE1Ml+xJJgZBNEBqM0Iaw9s4F3DJxJBxweVmS9u1r0sXqPbytC1Lcwa85cnLgI/zvsDG+H3jPgO7C6nGPCTtY9o1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wd+bbqs8dCcfZ1G6JNpQg1LACvMNZ5CyoM/p24ygqZg=;
 b=me5uU+NDGiQELvWV2S4CcJlL+djzbyRad6ciBCvmuvXUPuZ8sSgx5i5Vfm2BRn0Gb3d/5Plo8MO8mjIwr96sNAbKXVvj7XAc2g6Jk76Nx1vQpwnDL/nwkZMj06RY+Ha1b0JaYVFil/PZVL9zJ1/J4xQg4i8yL8q6EHmntg0n/xg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB6129.jpnprd01.prod.outlook.com (2603:1096:604:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Thu, 14 Apr
 2022 11:34:53 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5144.030; Thu, 14 Apr 2022
 11:34:53 +0000
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
Subject: RE: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYOSzSqQ5uPXv4KEu+Gs1Pb9njJazvQ+sAgAAuWeA=
Date:   Thu, 14 Apr 2022 11:34:53 +0000
Message-ID: <OS0PR01MB592209477F5EBBBA902DDDC086EF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220316115551.29222-1-biju.das.jz@bp.renesas.com>
 <20220316115551.29222-4-biju.das.jz@bp.renesas.com>
 <164992556078.22830.1913645020940169619@Monstersaurus>
In-Reply-To: <164992556078.22830.1913645020940169619@Monstersaurus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6de83687-b0be-44ac-23cd-08da1e0acb1c
x-ms-traffictypediagnostic: OS0PR01MB6129:EE_
x-microsoft-antispam-prvs: <OS0PR01MB6129A56FACEE0172F34872CF86EF9@OS0PR01MB6129.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MoeNftDt2T7P4EuCLbF3+5OQE1CT09y0URpeWahprijte31JHqEHPisQowZHoy2czPIdxh9p58m5Ki3vrVtLF8NrDkQP9D3GHTnKMpJO1Cob+aRv6towDFrwcgU1IP+/aPp/xUjyJXsJ39Zxm50/V2VzzLkm022/A9iab5U1e7atSm4OKQS8GDr0FZHrQ5RdHpYDU5KnZxe6mdbjWzvYwV3+hzkpY7Qfc2OlA9F5Azh27caRL7bUM+2/TyClYFiXoZjkqGreEB2iIOu0kooOx+vumsXIZg/aPVKlSw4tvhmJO2RhyDXEjiTEGN/fh3npMduWkuhJojsPRJX/hRj6gabonn2BKeFZ/uRMtun1oed5tuLtLHokn05zp9n1wqkUscEy/sZZdoyPi718ro9J+LIGq7D6CP7dc7WZPFcns2OS+dVoEvom2NLVRsnJxa2bOlkPMNqkd/H4qIdrOMItCimRJiNKaSMNeBnNEHsMn6Helouje8oOnP91E3Iz8vHJt+kLv6tnT87ThQXNta40TSuR84KhgaiiIywOPglIWitF7XS9/ReW9Ldcw6y5Me7CLJhcYymIU9FILOhwjubikHtXQmyqqRyPnGPR0RTXuTeW8yI+TCNGtgjlGRoYgyLda6HX33mlFUy02kCkzeF69Hn7csNHKpXWUWueqt+YsP1oMVvHK/YFxPM31ImebK2FvhuDh8I+ue8a/bOg2DZcog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(508600001)(8676002)(38070700005)(6506007)(2906002)(30864003)(122000001)(52536014)(86362001)(5660300002)(38100700002)(8936002)(186003)(26005)(316002)(107886003)(110136005)(66556008)(71200400001)(4326008)(66946007)(76116006)(55016003)(64756008)(66476007)(66446008)(83380400001)(33656002)(9686003)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a4Ayt1WhP8mW3G7muNdrVNju8OJyHLlExM3LHngAeAGsUenBvhkuW4LuIkpt?=
 =?us-ascii?Q?9/y184c81kbOj6IIXUGj4QpWiv+YUfaM/dw5tMMkPJkpQ0SHyL9cEUr0q0ia?=
 =?us-ascii?Q?vFRjNyckyYFxGfaBr31SKhLBwtuoli6mPfvm2FweV122NkCYeKuRHLaB30Sv?=
 =?us-ascii?Q?kdhuS+GsOP5bUMgVDIkOU6o7cXCK3JjFOeke2iZRQSpjCFIC6jO3Nyo8TmVV?=
 =?us-ascii?Q?mFDX0whGm9wz1JCx88AQ7ICXSpkBvYnyiBlAfwu/EZ9SjUNZr+L6XMQ0K13A?=
 =?us-ascii?Q?PwV3SgqsGSLAE3KXy+X17KI1nXMSqjyR7kEP2SLLdNlAxaJfeHvJ7ziTEtT5?=
 =?us-ascii?Q?HvU4S+QJMfvp+GjHDlH2SeIyiXsuTykQj7n9IEuWhUnMNvzq88SYK5QAOZlK?=
 =?us-ascii?Q?Y12ZT27OPDdLgETQlHNpHUi3otR0X4eEqMqGSrUnP6ijPgAO+pCgWCMSihX7?=
 =?us-ascii?Q?LtwfpuVKTJa9/kK/Yl55pQ89ElAlMiUWyYI3E5ALLfFo0Jk/xenau9WkI8Zb?=
 =?us-ascii?Q?nDTdoh5PjTwR3TR9zNOV/P/9pdiAg/SfAQIV6xjPOKR+JJHx+IkAXfhJ62p1?=
 =?us-ascii?Q?dUONtwdinR20cREvyoBwocVgjRMjbdVmbOsdOEo5GqtpIE4NmneIDHGaRB1v?=
 =?us-ascii?Q?SrnflDHsU7gjrIaqOKqy7nShe0VYhmzdHElYL5czNGAmCys45XApuM425z4w?=
 =?us-ascii?Q?d0FNlonY3KdGsAauMKofRFxG81vgWbg4Bhq1hiphtLQWT7lbAegq65LDrb8/?=
 =?us-ascii?Q?y0Uy0V1eQ/J8TVkC2AqzUHsXnC7fQJ6Mh+TrDXdM2nhUtnG7ggiICU69zb09?=
 =?us-ascii?Q?c9cKrvplk5JJLXobwKyDvuzQXuxlUuIaRFyYMxo2D3TdpSkbfRYm1qx6JVEZ?=
 =?us-ascii?Q?YC9MaFVTHpBjJKEutdD7v7GMU7T0dnOvYwrlezdE+MSHMxz5P8lmrd39KJrC?=
 =?us-ascii?Q?QBU2XrO4su44iiso90jY+1h2Zu/jKi8KJOloe1mJ6pa6JhvcvvkbJMO1KjTF?=
 =?us-ascii?Q?oaCvujzIuvj3M/YFjqpvi5+2UW3Zlwe5rL9kIMNn4Q3DJq68J8NGGWcnkD18?=
 =?us-ascii?Q?VOWRo//+DhZpX2b+XX/tL3c8QT7O4bbQcGKHhoL12tn3hPjtqBztjsB7E+E/?=
 =?us-ascii?Q?E6s+pRbztu8NAp/hMGgXcu0pBiFx2O1a8c6Z1fsVm8JRJJmtcMIpbCjF7O9N?=
 =?us-ascii?Q?sTgjnA6B4T5N3A6Z5Wz6/tQiVPX1D4RQqmmuv1ejHDbaoCTswQipN26NAW6u?=
 =?us-ascii?Q?1E1wezWt4UAcI+RIkp5jj0u2w9D7K9xrVJrt9LkeRp+d+Hz/ExPb3AeJfw/U?=
 =?us-ascii?Q?ULdeq0gIWuseZQFCbAxwzPMZgMA2zipNzyZNtsxbfODPVWgVfrwOaNrdu3Wr?=
 =?us-ascii?Q?OjabFGVsbsJqux+NYRLhoTO/W652i7Hk+KkRMbCilXhJAHoQ8LPrVdePnIbu?=
 =?us-ascii?Q?z6P4uVwXEDDO3631eVsE4WIdD2/xvP9GMAAo0DAFGck9Ik1v7tVrc2UHHTIo?=
 =?us-ascii?Q?BKi0HPyh2Ll35TLVrLP94QbQ2juydurYVDRjWzYSudvq/ij19OiOdYrTVe4L?=
 =?us-ascii?Q?WiEJBm5bnRTwhIg60PerBSKHQvJYse3fcILC35bLAtO9B9h1GOIBF/JVa475?=
 =?us-ascii?Q?I4v0b/exKjwH26RyN2tG9V813f6WfZV286y1RULLjQiSEFKxh7EYl6p6AzBC?=
 =?us-ascii?Q?iH57Q8KD64f+yXroMFbwT3Kw/mwhoLmqtOPcVo9kIqlJO9B8OdEYrqVVNWWR?=
 =?us-ascii?Q?YKd1WIjz1MfOlAOtoXgKcfmBA8TUNB0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de83687-b0be-44ac-23cd-08da1e0acb1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2022 11:34:53.1534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sSlSphvL7kXjDcz7U2ve1YLp6pkEkm0I0tsb5PIFtRWcgovGe342zMoNBC9kbh8QrQixWdi+lPVlLArDn5WDee1qnOPqwHiKX5sgtyfgh1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6129
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

> Subject: Re: [PATCH v6 3/3] media: renesas: vsp1: Add support for RZ/G2L
> VSPD
>=20
> Quoting Biju Das (2022-03-16 11:55:51)
> > The RZ/G2L VSPD provides a single VSPD instance. It has the following
> > sub modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
> >
> > The VSPD block on RZ/G2L does not have a version register, so added a
> > new compatible string "renesas,rzg2l-vsp2" with a data pointer
> > containing the info structure. Also the reset line is shared with the D=
U
> module.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5->v6:
> >  * Rebased to media_staging and updated commit header
> >  * Removed the extra tab from rzg2l_vsp2_device_info
> >  * Changed the function vsp1_lookup->vsp1_lookup_info and
> >    all info match related code moved here.
> >  * Add VI6_IP_VERSION_VSP and VI6_IP_VERSION_VSP_SW macros to
> >    distinguish HW & SW IP_VSP_Version.
> >  * Used 0x80 for RZG2L VSPD model and SoC identification
> >  * Updated Switch() for LIF0 buffer attribute handling.
> > v4->v5:
> >  * Fixed typo VI6_IP_VERSION_MODEL_MASK->VI6_IP_VERSION_MASK
> >  * To be consistent with other SoC's, introduced VI6_IP_VERSION_SOC_G2L
> >    for RZ/G2L SoC's.
> > v3->v4:
> >  * Added Rb tag from Geert
> >  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> > v2->v3:
> >  * Fixed version comparison in vsp1_lookup()
> > v1->v2:
> >  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
> >  * Added standalone device info for rzg2l-vsp2.
> >  * Added vsp1_lookup helper function.
> >  * Updated comments for LIF0 buffer attribute register
> >  * Used last ID for rzg2l-vsp2.
> > RFC->v1:
> >  * Used data pointer containing info structure to retrieve version
> > information
> > RFC:
> > ---
> >  .../media/platform/renesas/vsp1/vsp1_drv.c    | 56 ++++++++++++++-----
> >  .../media/platform/renesas/vsp1/vsp1_lif.c    | 18 ++++--
> >  .../media/platform/renesas/vsp1/vsp1_regs.h   |  8 +++
> >  3 files changed, 62 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > index 159b68fa0829..f1f52c0c1c59 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> > @@ -812,11 +812,47 @@ static const struct vsp1_device_info
> vsp1_device_infos[] =3D {
> >         },
> >  };
> >
> > +static const struct vsp1_device_info rzg2l_vsp2_device_info =3D {
> > +       .version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> > +       .model =3D "VSP2-D",
> > +       .gen =3D 3,
> > +       .features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP | VSP1_HAS_EXT_=
DL,
> > +       .lif_count =3D 1,
> > +       .rpf_count =3D 2,
> > +       .wpf_count =3D 1,
> > +};
> > +
> > +static const struct vsp1_device_info *vsp1_lookup_info(struct
> > +vsp1_device *vsp1) {
> > +       const struct vsp1_device_info *info;
> > +       unsigned int i;
> > +
> > +       /*
> > +        * Try the info stored in match data first for devices that
> don't have
> > +        * a version register.
> > +        */
> > +       info =3D of_device_get_match_data(vsp1->dev);
> > +       if (info)
>=20
> Presumably - as this will not call vsp1_read(vsp1, VI6_IP_VERSION), we
> could/should always set vsp1->version here, or'ing in the _SW flag with
> the derived version and SoC identifiers from the info structure.

OK, I have prototyped as per your suggestion, and it looks good.

Here it is

      if (info) {
              vsp1->quirks =3D LIF_BUF_ATTR_QUIRKS;
              vsp1->version =3D VI6_IP_VERSION_VSP_SW | info->version |
                              VI6_IP_VERSION_SOC_RZG2L;



>=20
> > +               return info;
> > +
> > +       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > +
> > +       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > +               info =3D &vsp1_device_infos[i];
> > +
> > +               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D =
info-
> >version)

Here it is=20
              if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D info->=
version) {
                       if ((vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
                         (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC=
_V3M))
                               vsp1->quirks =3D LIF_BUF_ATTR_QUIRKS;


> > +                       return info;
> > +       }
> > +
> > +       dev_err(vsp1->dev, "unsupported IP version 0x%08x\n",
> > + vsp1->version);
> > +
> > +       return NULL;
> > +}
> > +
> >  static int vsp1_probe(struct platform_device *pdev)  {
> >         struct vsp1_device *vsp1;
> >         struct device_node *fcp_node;
> > -       unsigned int i;
> >         int ret;
> >         int irq;
> >
> > @@ -872,25 +908,16 @@ static int vsp1_probe(struct platform_device
> *pdev)
> >         if (ret < 0)
> >                 goto done;
> >
> > -       vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > -
> > -       for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > -               if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> > -                   vsp1_device_infos[i].version) {
> > -                       vsp1->info =3D &vsp1_device_infos[i];
> > -                       break;
> > -               }
> > -       }
> > -
> > +       vsp1->info =3D vsp1_lookup_info(vsp1);
> >         if (!vsp1->info) {
> > -               dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> > -                       vsp1->version);
> >                 vsp1_device_put(vsp1);
> >                 ret =3D -ENXIO;
> >                 goto done;
> >         }
> >
> > -       dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
> > +       if ((vsp1->version & VI6_IP_VERSION_VSP_MASK) !=3D
> VI6_IP_VERSION_VSP)
> > +               vsp1->version =3D VI6_IP_VERSION_VSP_SW | vsp1->info-
> >version |
> > +                               VI6_IP_VERSION_SOC_RZG2L;
>=20
> It seems odd to have this specific version assignment here. Shouldn't tha=
t
> be set during vsp1_lookup_info() in the case that there is a match from
> of_device_get_match_data()? That way it would be extendable by adding jus=
t
> a new vsp1_device_info structure for the next platform that has this
> issue. This implies that they will 'always' be RZG2L but that information
> should live in the vsp1_device_info structure I think.
>=20

We can remove this assignment from here and move vsp1_lookup_info.

> Could be handled when/if we get a new device added I guess, but I think
> that VI6_IP_VERSION_SOC_RZG2L should be something that is retrieved from
> the vsp1_device_info structure.
>=20
> Re-reading the vsp1_lookup_info() function - it does seem like something
> suited to there, as the vsp1->version is never read from hardware in the
> new case.

Ok, Agreed.

>=20
> >
> >         /*
> >          * Previous use of the hardware (e.g. by the bootloader) could
> > leave @@ -941,6 +968,7 @@ static int vsp1_remove(struct
> > platform_device *pdev)  static const struct of_device_id vsp1_of_match[=
]
> =3D {
> >         { .compatible =3D "renesas,vsp1" },
> >         { .compatible =3D "renesas,vsp2" },
> > +       { .compatible =3D "renesas,rzg2l-vsp2", .data =3D
> > + &rzg2l_vsp2_device_info },
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff --git
> > a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > index 6a6857ac9327..e36ed2d2b22b 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_lif.c
> > @@ -107,6 +107,7 @@ static void lif_configure_stream(struct
> > vsp1_entity *entity,
> >
> >         case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
> >         case VI6_IP_VERSION_MODEL_VSPD_V3:
> > +       case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
> >                 hbth =3D 0;
> >                 obth =3D 1500;
> >                 lbth =3D 0;
> > @@ -130,16 +131,21 @@ static void lif_configure_stream(struct
> vsp1_entity *entity,
> >                         VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
> >
> >         /*
> > -        * On R-Car V3M the LIF0 buffer attribute register has to be se=
t
> to a
> > -        * non-default value to guarantee proper operation (otherwise
> artifacts
> > -        * may appear on the output). The value required by the manual
> is not
> > -        * explained but is likely a buffer size or threshold.
> > +        * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register
> has to be
> > +        * set to a non-default value to guarantee proper operation
> (otherwise
> > +        * artifacts may appear on the output). The value required by
> the
> > +        * manual is not explained but is likely a buffer size or
> threshold.
> >          */
> > -       if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > -           (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > +       switch (entity->vsp1->version) {
> > +       case (VI6_IP_VERSION_VSP | VI6_IP_VERSION_MODEL_VSPD_V3 |
> > +             VI6_IP_VERSION_SOC_V3M):
> > +       case (VI6_IP_VERSION_VSP_SW | VI6_IP_VERSION_MODEL_VSPD_RZG2L |
> > +             VI6_IP_VERSION_SOC_RZG2L):
>=20
> If this is going to grow - I would think it would be better served with a
> feature flag - although this isn't so much of a feature, and more of a
> quirk, so I wonder if that would push us closer to getting a quirks flag.
>=20
> I'm weary that this may not scale otherwise, but ... for now this works,
> but I think it means we have multiple ways of handling platform specific
> code already.

Here it is

if (lif->quirks)
          vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
                           VI6_LIF_LBA_LBA0 |
                            (1536 << VI6_LIF_LBA_LBA1_SHIFT));

And the below change in vsp1_lif_create

  lif->quirks =3D vsp1->quirks & LIF_BUF_ATTR_QUIRKS;

>=20
>=20
> >                 vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> >                                VI6_LIF_LBA_LBA0 |
> >                                (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> > +               break;
> > +       }
> >  }
> >
> >  static const struct vsp1_entity_operations lif_entity_ops =3D { diff
> > --git a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > index fae7286eb01e..e66553c42e50 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_regs.h
> > @@ -767,6 +767,8 @@
> >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3        (0x19 << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3        (0x1a << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPD_V3U  (0x1c << 8)
> > +/* RZ/G2L SoC's have no version register, So use 0x80 as the model
> version */
> > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L        (0x80 << 8)
> >
> >  #define VI6_IP_VERSION_SOC_MASK                (0xff << 0)
> >  #define VI6_IP_VERSION_SOC_H2          (0x01 << 0)
> > @@ -780,6 +782,12 @@
> >  #define VI6_IP_VERSION_SOC_M3N         (0x04 << 0)
> >  #define VI6_IP_VERSION_SOC_E3          (0x04 << 0)
> >  #define VI6_IP_VERSION_SOC_V3U         (0x05 << 0)
> > +/* RZ/G2L SoC's have no version register, So use 0x80 for SoC
> Identification */
> > +#define VI6_IP_VERSION_SOC_RZG2L       (0x80 << 0)
> > +
> > +#define VI6_IP_VERSION_VSP_MASK                (0xffff << 16)
> > +#define VI6_IP_VERSION_VSP             (0x0101 << 16) /* HW VSP versio=
n
> */
>=20
> Is this constant on all supported platforms? both Gen2 and Gen3? (Is ther=
e
> a gen1?). Does it need to be specified to the generation?

I have checked Gen1 and Gen2 HW manual I don't find this info. So I would l=
ike
to remove this macro as it is unused after quirk changes.

I am planning to send V7 with these changes, please let me know if you have=
 any feedback.

Cheers,
Biju

>=20
> There's nothing specifically complex there or blocking I don't think - so
> with comments considered as required:
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> > +#define VI6_IP_VERSION_VSP_SW          (0xfffe << 16) /* SW VSP versio=
n
> */
> >
> >  /* -------------------------------------------------------------------=
-
> ---------
> >   * RPF CLUT Registers
> > --
> > 2.17.1
> >
