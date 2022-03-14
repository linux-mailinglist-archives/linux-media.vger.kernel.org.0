Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C37CE4D7D6F
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236614AbiCNIRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiCNIRN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:17:13 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 622222B25C;
        Mon, 14 Mar 2022 01:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PpQXhO9S4HzHjXFGS9hwg5dXHWdynXxR5LMFFO6uriVKJ9T+703zQQBJ31vModGiGhYgwpbAlMcf4DL2mv4Np/2i8bkObN7va11pp1sUQI+FS8PgWCtR3QBtgPnlUsfXM5N/HFA+eLQsroan17fLDRGccd7OG+iUPYuEDayxR/cqTOmwZB7MN58E4hxwtBhuLtyWm0/mh/y9z9aKFy9xrx2EzSn/yrNJeI/jNNccET/nor8ZL6M9c2pYR/rsu30dtd87vTJeN/puU0nqBq4SOlWSoD1R0nJo05dXAgpPsez/TAKF3sxKltBgpxRrmEclYcNEiBhyd+IpbtZ/zELhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33ia2o8YVd9oY8AhqtY2MX3a3zidaFBjTs/WSvIseUw=;
 b=H1t5/7vbaJD8klgRD3F+IqRsmetgWPFdPZr7O1zaYrHEwdsQJLldxKaaqMMSW2I7njwO58U5Ztvz3l6gvqH1dw/ZwaRA04kc7Ep85LAo4kJ7YfOQYexct5Ep4vfUQgcxR3NWiACbCVlZw8Ehx54Fa2D73BSpuf56bQJAUDRTMkCyuhDMTbBzk1pby2SHHeSrTI+w04b/oGW/0GMWvC6k5nf6IEBGmyFUBcRzshX1+UzubgeuwUcYANSrCVSMXPftj+AOmckNwTpn6pXXFXzpwQz/6e0jLZOPqYC0XEIAcmjarmQHfe2SZoHeQC2odch4QRsCMkHceJghtywzOUTjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33ia2o8YVd9oY8AhqtY2MX3a3zidaFBjTs/WSvIseUw=;
 b=SuvR/IgPNEPSsJaINvsgW07m3qAWYIAOQh8kThe4DWJYcGTF4mmRDBXbNZwcKocjqg4fbcD+mftLG/NtQY0i70/DkW1tZeNMZJRfTlfjCQCtjf127pp7DafBWTg2auDKAsfAkYpRyieNAoLykQbPTp5fvgKY0vNTbnda98hBXWM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY2PR01MB1929.jpnprd01.prod.outlook.com (2603:1096:404:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 08:16:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 08:16:00 +0000
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
Subject: RE: [PATCH v5 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v5 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYNe0WoKrH6qBdoUGpmU8KsQt2cay9XQOAgAEWjDA=
Date:   Mon, 14 Mar 2022 08:16:00 +0000
Message-ID: <OS0PR01MB5922C05B7C4A6411DCD64017860F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220312084205.31462-1-biju.das.jz@bp.renesas.com>
 <20220312084205.31462-4-biju.das.jz@bp.renesas.com>
 <Yi375+TLcYhc+FGU@pendragon.ideasonboard.com>
In-Reply-To: <Yi375+TLcYhc+FGU@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21740716-9456-4143-b73c-08da0592e015
x-ms-traffictypediagnostic: TY2PR01MB1929:EE_
x-microsoft-antispam-prvs: <TY2PR01MB1929A9B8F594152B331574E1860F9@TY2PR01MB1929.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JJayWMR+VDzO74+XPW+fUf+S/hiMBiFqqGLwlUchcaLdY41b4+37/CmVCFqCT0L99RIodZT5QazRN9UMz2v4YzPy/IGQdcpVrK4lRl/KoKppR2RC96ZpoMeqaWGAPlLdNPBQqF29R/x1gjbtEkC79+uTQpZ3yglz+Fb1k/ZBZi/vzU4wjK/12sIkHIMjeYUmQApLHlIYORcjUPeawZzSoqmP8+QOIGDXaCwaQSvJJrJVzjguBryi3PNPtdYXcDSMy0FK0feYYz6bvQ8wSRjnEwVP0hnR/MMdA1I6iyOkbCy3JwvqFdMRVIg7wN0pWsPhugyhFSh6MqHOmkZYpernTqsMJ6rH32rCFrUOEkzgn7fE2uvtU+MNEfJcMMgO/IbA6TMwhmlKFKgPYwwfKEbzuKkfMd+BbgGfSpiR35KQKAJYJn3r9v+Nj7txEWTjCQTF5fpo4I8p0LXRgDaXeFD8HhM5zB05yxKOl2xX493a3gkfYMG5I5/kpSYk9ejw5QG3rhTTmpTNTPuCO6ojdbdBUu317tjloQG5jxOhUHzJz3rrITzm1SV6T4FVQ1InXvE9CiWiyTFG9FVpSURvcNMIjLibpUW+3r4AJ96yOBhd3TS+FPgfP5qeuxT0Yg16XPFjJ3ap975QSaiYTYxwGk+lVcRt2lagtOqevl+Qj3Xy/iCFH2oiiokWMK5C1LPof/I5tpSoYOoMjxUkE2/8n/pAOg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6506007)(66946007)(7696005)(38070700005)(66556008)(76116006)(66476007)(66446008)(9686003)(316002)(86362001)(6916009)(54906003)(508600001)(64756008)(107886003)(26005)(38100700002)(83380400001)(122000001)(33656002)(8936002)(5660300002)(30864003)(52536014)(55016003)(4326008)(8676002)(2906002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xNfiMnrHWySJ27xeI/UXqdkRJbZBG/Q6aEvd7RNdwQgMdMefeoVfqLZfIWJ8?=
 =?us-ascii?Q?wv2H2Bi6SWpi15DT5RPOn+TQ5dVUBrGSL6cyHta0MaFLMsQJKKW+dxKCfri+?=
 =?us-ascii?Q?3HHEIr2pjOMgJVgbrHtp/XzEc6p+SfuKB5OIn0HYJawSC0TxU8cuo8nYDX1p?=
 =?us-ascii?Q?PFeX+YdiTuDrKXrSg5omcmH7HtFQLNJFhCjdTk8hOtgnyU0GUsdRljrzBkcf?=
 =?us-ascii?Q?pZZQFrpVAehIUtGe2pxPx5con7ik31xr2aVdYI7tS/5A5aKWi81AOOGgkP9o?=
 =?us-ascii?Q?1yU0s07xy2ZmwfZE39MA/4IG8/Q698PonTWK2bWHENH53QAdPqB2aZrgQiXK?=
 =?us-ascii?Q?NhYjx4883plE1pLJ6cbT4yCxB+ka7Wo9DP25acduSkm051KCczG+2Ng20Gy8?=
 =?us-ascii?Q?rCEbO/hZhlYys7SssC0gc9IO18U25JMqLC5lhXNY0tgOehovbXkDS5bW9onl?=
 =?us-ascii?Q?5OxpiKeiI4KN1NDaEQGpS/J+WkEwF0WAu3F9FkI+XAmZ4XT8O8oMIw764TNb?=
 =?us-ascii?Q?p4J00EIV7efUFYcNwsfLrOzbyd+6LPUiOvwilWPXSmB9yxYcaupB1S3NLE6z?=
 =?us-ascii?Q?2QMnZUU13YyuBDC/nwo8K3g25utD1x0Zlkep6tPtSsZqjUGB59JTsdVzeEjm?=
 =?us-ascii?Q?zmI6XGEKgVVFaqXGKEms88MS6R3LUabMFT9iZwAkmNLiaqfFKEfkm4+ee+dj?=
 =?us-ascii?Q?2MARxIpCnvoGQjcmLqQvrjfsOEyiUnWEATvtJ07B1o0pvgwlq6NhumhtCHhv?=
 =?us-ascii?Q?5+VDuuEzFmhxbQ5SrYFJhxUqezXUl/PIZ4VtBTLV0Du55Ui/6VTwPkBazcpH?=
 =?us-ascii?Q?5mbMG4JERV7tA2qORp0rMbBU+jzz5eSAoXuPlLiY9kQf+kPOc0y6I89i1kFu?=
 =?us-ascii?Q?VHzDVRv/8GUO3AZo4npJiBIji9UsuGz831rIAhyaZmWdi7xhNDS16EXNu6/a?=
 =?us-ascii?Q?pZyzztfbsYEpz8vneDhaPEEpLC31w4NYX9fy+hW32bdL/PXoVlQqexOgV+Kn?=
 =?us-ascii?Q?rZvC218FTMhxiH/NE4Or6XPZkVq6Z+iJCsKlZuxAEmMgBZXkD9WslKVXFCH2?=
 =?us-ascii?Q?9LcxpPuIesLhl/7fi2RQd1vzNA0vNbLSaK9kMaDObCtcRLhwSaAgq1uayaLM?=
 =?us-ascii?Q?Ep3JaF8qBVhLFSJoliQcCFi2dnANqlAwBnJLhHEtWb49noJELhw8n3Vh3qFX?=
 =?us-ascii?Q?0u+EgRQtVgTk9MhcPFpl+pUSHXJvZE992Rm4TbyQA1Rw/bSVgUr8NT+FcFbk?=
 =?us-ascii?Q?AiaEh+3PvNsTeI331fa9vqxiNeR0dGmHoOmRNENc8kDk8gGz+9Twidmt0bm1?=
 =?us-ascii?Q?mzyqrBE63VMnO5YpIXgfeoQaQEHvi5PqYVUxAAuYhkirdTALpwD80B5eOz6M?=
 =?us-ascii?Q?Em9Vtd0nVeNDyUo7UJKn7BnhjnIYeDiswWF/QiMDj6J7yCSBSR+XUCkSjfaQ?=
 =?us-ascii?Q?mHSyPRiSomPlouR88g8ECPq6vxtkM0qwfGUtwiU1mACyUVjPmW0ruw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21740716-9456-4143-b73c-08da0592e015
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 08:16:00.8292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFkaPbnkk/ZZAo0pfuqSIs9snHa6WfJVw4A9cg40m2gbjb4oLCx9ltWJnsJEWmD4OC2yVemxxqf4raQXTlLme0rDgyzgzS24mRDuylyd0RM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1929
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

> Subject: Re: [PATCH v5 3/3] media: vsp1: Add support for RZ/G2L VSPD
>=20
> Hi Biju,
>=20
> Thank you for the patch.
>=20
> On Sat, Mar 12, 2022 at 08:42:05AM +0000, Biju Das wrote:
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
> >  *
> > ---
> >  drivers/media/platform/vsp1/vsp1_drv.c  | 44
> > +++++++++++++++++++------  drivers/media/platform/vsp1/vsp1_lif.c  |
> > 16 +++++----  drivers/media/platform/vsp1/vsp1_regs.h |  4 +++
> >  3 files changed, 48 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> > b/drivers/media/platform/vsp1/vsp1_drv.c
> > index 699d7d985df4..4eef6d525eda 100644
> > --- a/drivers/media/platform/vsp1/vsp1_drv.c
> > +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> > @@ -811,11 +811,37 @@ static const struct vsp1_device_info
> vsp1_device_infos[] =3D {
> >  	},
> >  };
> >
> > +static const struct vsp1_device_info rzg2l_vsp2_device_info =3D {
> > +		.version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> > +		.model =3D "VSP2-D",
> > +		.gen =3D 3,
> > +		.features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP |
> VSP1_HAS_EXT_DL,
> > +		.lif_count =3D 1,
> > +		.rpf_count =3D 2,
> > +		.wpf_count =3D 1,
>=20
> One tab is enough for indentation.

Agreed. Will fix this.

>=20
> > +};
> > +
> > +static const struct vsp1_device_info *vsp1_lookup(struct vsp1_device
> *vsp1,
> > +						  u32 version)
>=20
> Let's call this vsp1_lookup_info(), just "lookup" is a bit vague.

OK.

>=20
> > +{
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > +		if ((version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> > +		    vsp1_device_infos[i].version) {
> > +			vsp1->info =3D &vsp1_device_infos[i];
> > +			break;
> > +		}
> > +	}
> > +
> > +	return vsp1->info;
>=20
> Could we move all the info logic in this function ? Something like this:

OK for me, If there is no objections.

What about using vsp1->version instead of local variable version,
So that in case of synthetic version, we can override MSB's with
0xFFFE (Please see below)

>=20
> 	const struct vsp1_device_info *info;
> 	unsigned int i;
> 	u32 version;

Here Remove the local variable version and instead use vsp1->version.
>=20
> 	/*
> 	 * Try the info stored in match data first for devices that don't
> have
> 	 * a version register.
> 	 */
> 	info =3D of_device_get_match_data(vsp1->dev);
> 	if (info)
> 		return info;
>=20
> 	version =3D vsp1_read(vsp1, VI6_IP_VERSION);
=09

vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);

>=20
> 	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> 		info =3D &vsp1_device_infos[i];
>=20
> 		if ((version & VI6_IP_VERSION_MODEL_MASK) =3D=3D info->version);
> 			return info;
> 	}
>=20
> 	dev_err(vsp1->dev, "unsupported IP version 0x%08x\n", version);
>=20
> 	return NULL;
>=20
> > +}
> > +
> >  static int vsp1_probe(struct platform_device *pdev)  {
> >  	struct vsp1_device *vsp1;
> >  	struct device_node *fcp_node;
> > -	unsigned int i;
> > +	u32 version;
> >  	int ret;
> >  	int irq;
> >
> > @@ -871,24 +897,21 @@ static int vsp1_probe(struct platform_device
> *pdev)
> >  	if (ret < 0)
> >  		goto done;
> >
> > -	vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > -
> > -	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> > -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> > -		    vsp1_device_infos[i].version) {
> > -			vsp1->info =3D &vsp1_device_infos[i];
> > -			break;
> > -		}
> > +	vsp1->info =3D of_device_get_match_data(&pdev->dev);
> > +	if (!vsp1->info) {
> > +		version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> > +		vsp1->info =3D vsp1_lookup(vsp1, version);
> >  	}
> >
> >  	if (!vsp1->info) {
> >  		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> > -			vsp1->version);
> > +			version);
> >  		vsp1_device_put(vsp1);
> >  		ret =3D -ENXIO;
> >  		goto done;
> >  	}
> >
> > +	vsp1->version =3D vsp1->info->version;
>=20
> And here you would have
>=20
> 	vsp1->info =3D vsp1_lookup_info(vsp1);
> 	if (!vsp1->info) {
> 		ret =3D -ENXIO;
> 		goto done;
> 	}
>=20
> 	vsp1->version =3D vsp1->info->version;

Here some thing like
(vsp1->version & 0x0101)--> real hw version
Else
Synthetic version {
vsp1->version =3D (0xFFFE0000)| vsp1->info->version | VI6_IP_VERSION_SOC_RZ=
G2L;
}

so that it won't break user space as mentioned below.

>=20
> A subsequent patch could even drop the version field from vsp1_device and
> use vsp1->info->version instead of vsp1->version.

May be it is not needed ??

>=20
> There's however a small issue. The version number is exposed to userspace=
.
> Currently it's a full 32-bit value with the 16 MSBs being
> 0x0101 for all VSP versions, and the 16 LSBs identifying the VSP model an=
d
> SoC. With this patch, the version number is retrieved from the info
> structure, and the 16 MSBs will thus be 0x0000. This may cause issues in
> userspace.
>=20
> One option would be to set the 16 MSBs in vsp1_device_info.version (using
> a new macro added to vsp1_regs.h, I'm not sure how to call it as it's not
> clear what 0x0101 represents, if it's meant to identify the fact that the
> device is a VSP, maybe VI6_IP_VERSION_VSP ?).

HW document doesn't mention about what 0x0101 represents for MSBs?=20
What about VI6_IP_VERSION_VSP_HW_MSB to differentiate HW version.

>=20
> >  	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
> >
> >  	/*
> > @@ -940,6 +963,7 @@ static int vsp1_remove(struct platform_device
> > *pdev)  static const struct of_device_id vsp1_of_match[] =3D {
> >  	{ .compatible =3D "renesas,vsp1" },
> >  	{ .compatible =3D "renesas,vsp2" },
> > +	{ .compatible =3D "renesas,rzg2l-vsp2", .data =3D
> > +&rzg2l_vsp2_device_info },
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff --git
> > a/drivers/media/platform/vsp1/vsp1_lif.c
> > b/drivers/media/platform/vsp1/vsp1_lif.c
> > index 6a6857ac9327..35abed29f269 100644
> > --- a/drivers/media/platform/vsp1/vsp1_lif.c
> > +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> > @@ -107,6 +107,7 @@ static void lif_configure_stream(struct
> > vsp1_entity *entity,
> >
> >  	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
> >  	case VI6_IP_VERSION_MODEL_VSPD_V3:
> > +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
> >  		hbth =3D 0;
> >  		obth =3D 1500;
> >  		lbth =3D 0;
> > @@ -130,16 +131,19 @@ static void lif_configure_stream(struct
> vsp1_entity *entity,
> >  			VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
> >
> >  	/*
> > -	 * On R-Car V3M the LIF0 buffer attribute register has to be set to
> a
> > -	 * non-default value to guarantee proper operation (otherwise
> artifacts
> > -	 * may appear on the output). The value required by the manual is
> not
> > -	 * explained but is likely a buffer size or threshold.
> > +	 * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to
> be
> > +	 * set to a non-default value to guarantee proper operation
> (otherwise
> > +	 * artifacts may appear on the output). The value required by the
> > +	 * manual is not explained but is likely a buffer size or threshold.
> >  	 */
> > -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> > -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> > +	switch (entity->vsp1->version & VI6_IP_VERSION_MASK) {
> > +	case (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M):
> > +	case (VI6_IP_VERSION_MODEL_VSPD_RZG2L | VI6_IP_VERSION_SOC_G2L):
> >  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
> >  			       VI6_LIF_LBA_LBA0 |
> >  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> > +		break;
> > +	}
> >  }
> >
> >  static const struct vsp1_entity_operations lif_entity_ops =3D { diff
> > --git a/drivers/media/platform/vsp1/vsp1_regs.h
> > b/drivers/media/platform/vsp1/vsp1_regs.h
> > index fae7286eb01e..3963119eecc5 100644
> > --- a/drivers/media/platform/vsp1/vsp1_regs.h
> > +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> > @@ -767,8 +767,12 @@
> >  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
> >  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> > +/* RZ/G2L SoC's have no version register, So using last ID for the
> version */
> > +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0xff << 8)
> >
> >  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
> > +/* RZ/G2L SoC's have no version register, So use '0' for SoC
> Identification */
> > +#define VI6_IP_VERSION_SOC_G2L		(0x00 << 0)
>=20
> Hmmmm... I wonder how we can make sure here that no future SoCs will use
> 0xff or 0x00. Especially from a userspace point of view, The resulting
> version number will be 0x0000ff00, I'm not sure it will let us have a nic=
e
> versioning scheme if we have to extend this to new SoCs that have
> different VSPs also lacking a version register.
>=20
> I wonder if we could possibly use the 16 MSBs to differentiate between
> real hardware versions and synthetic versions. For instance, we could set
> the MSBs to 0xfffe (unlikely to be used by real hardware), and then we
> could allocate version numbers for the 16 LSBs freely, starting numbering
> at 0x01 (or maybe a higher value, such as 0x80 ?) for the model and SoC
> identifiers.
>=20
> What does everybody think ?

I am ok for synthetic version of "0xfffe8000" for RZ/G2L, if there is=20
no objections and add 0xFFFE in the current=20

VI6_IP_VERSION_VSP_SW_MSB		(0xFFFE << 16)
VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0x80 << 8)
VI6_IP_VERSION_SOC_RZG2L		(0x00 << 0)

We could directly use "entity->vsp1->version" instead of=20
'entity->vsp1->version & VI6_IP_VERSION_MASK'
for the switch() ('switch (entity->vsp1->version & VI6_IP_VERSION_MASK)') a=
s

switch(entity->vsp1->version) has already differentiation between real and=
=20
synthetic version.

VI6_IP_VERSION_V3M ((vsp1->version & VI6_IP_VERSION_VSP_HW_MSB) | VI6_IP_VE=
RSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M)
VI6_IP_VERSION_RZG2L ((vsp1->version & VI6_IP_VERSION_VSP_SW_MSB) | IP_VERS=
ION_MODEL_VSPD_RZG2L | VI6_IP_VERSION_SOC_RZG2L)

Cheers,
Biju


>=20
> >  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
> >  #define VI6_IP_VERSION_SOC_V2H		(0x01 << 0)
> >  #define VI6_IP_VERSION_SOC_V3M		(0x01 << 0)
> >
>=20
> --
> Regards,
>=20
> Laurent Pinchart
