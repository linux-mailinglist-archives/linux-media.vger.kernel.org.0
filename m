Return-Path: <linux-media+bounces-4092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51180838FCC
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 14:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00DD6283FF6
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 13:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039675FB83;
	Tue, 23 Jan 2024 13:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nFneb86N"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EEA5DF00;
	Tue, 23 Jan 2024 13:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706016036; cv=fail; b=rtMRaEIrxATA0yc9xJ8BCwbiHndWg72JyBBfpfNtN+dJUhp0Qskrmt1ls27OJq5OnAoITNHRGjL01LpiyHs2yNhdTGsZ1khVCNU+N5oEgz27OL+YGReh1KIDO4xn9Tbj+MwIJ7atjoeX9bksyQpaK9zyI+w+z/zk3mqL9fyhc4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706016036; c=relaxed/simple;
	bh=QMse1gM5QOS46YBisYLp21UXa6dvlAvuAk5Ey4TZa80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nRixetE/xJagud4mrVgJD6Hm+f/PpbN1hbvPntQYleOJ3FSU/RWZOx6XQStfDlgQeNdOS6WjlBHnIutIypVLKLzJLsRRFgXMNfjHf0sogI2fTuetpOM1vweEPsaYEd8FghMpk178XMrtqoqJ2xBW+Z07kO+cEvGoBaazh8WDBsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nFneb86N; arc=fail smtp.client-ip=40.107.114.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBRupAJok0Pw226Faj+ZVSiO9SQZMiWFo766hch7AB0dbJF6cSFW+bFjeY37t8BMmWHgQqSL1UI8A8O6bJu128CWnJNdKlEkwO+cOdSLC9Sak7z0Das6gQESrFFjb9K7wWztEFF2TMeboyrs+uiu7bTepvAetYkL8wIDuJkjokwH0PV1FC/NbWIMqtxNyU2nI3ufN3nPlBKNanOI0RHPXOjWdABo1onBTeFbEu/wgBmFC1iuJfwN1nsA9WcbX3ha3Hv8PSq2cZ85pMB0W6jwB1yIgxSPHTqhvRZzQL+VWCs3eD/5JVwx7IsRO7jWSjksKua6/YFFGXWwzGxUHGRWNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7dMCCI+I5ubY8MRx3A5yKmkKF72V0BTS6HRm59xOhE=;
 b=MRjLK/gFs+d+xUbK0tq1/JJK//fVg9aCGoMLha+7VLeQy8F+UmOqr20eoyFbDGwVqsZwpTk3/NjmIHSKpgSuR3Qg309eo1GQksypPi0uV38Ul1iG/ghODuzdgp2mX5gvlr3jpI+3iuUJb4pkFvuncIUZaXSW7lbthFStPW5Z4bxkOaT6VD7nwkZShhNN5DHq/5zu4eSSh2yjnTBKZj0M0DgmxwGzcrNsmVp0TUJWXC6pWmMV9KnGuEfejvlPDNvvXceIdJsw5TpZSCczzCT9AORDT2oQOFzj9tbHkZDVN7sv07KyBh5arFXIqg3r7+G5m6bRIAldcqF9A5PCgW2Dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7dMCCI+I5ubY8MRx3A5yKmkKF72V0BTS6HRm59xOhE=;
 b=nFneb86NWXS3vIDX6KauYKpdMLEylgMjvuN2Pxs/DjJYHbbh7+igMbNETiEwyVM0fNLrHXztjuf1cIZwBCJKm3Ixod02RcdcyjEjARyWOAmJ4qmnNacxdpyTD7S8NcAGp6uL6iew1ZHufHQPcBvBpFpM8NMdS7Oy+k/pQoaQkeo=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OS3PR01MB9319.jpnprd01.prod.outlook.com
 (2603:1096:604:1ce::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21; Tue, 23 Jan
 2024 13:20:29 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::933f:16d3:8a2f:2fbb]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::933f:16d3:8a2f:2fbb%5]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 13:20:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Index: AQHaTfOGse1EYgJsOEas+jUOFEStH7DnUReAgAAP22A=
Date: Tue, 23 Jan 2024 13:20:29 +0000
Message-ID:
 <TYVPR01MB112790F66C1FF3CCB2C9AB6C586742@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
 <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
In-Reply-To: <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OS3PR01MB9319:EE_
x-ms-office365-filtering-correlation-id: 40dd0eec-00dc-4edc-d7d1-08dc1c1611dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 RQ85QYFvdgEpJQmljRvciq7GrxEIKpM4JHkHnfdHJ7GtDcdL40sFStgn5wptVzijI9vz+qN0GQRjNkT7A9Cyv5NIGDLIbfPvwIzzk2GDwqmjNTw7QpZEPG+aLWOZjXORDBfgWXXPGpQp/WsUC1sYRYXyN+qVRe4EpCK1dWez+QAUFUmfpTU7NtX2rOZjmLpLRFnrmRSQM6CJhd3bOalqzxvENzEE2Gu88MBnPgdmsDmQ/C1/SeFLcO4X/Hf8fhmRV7ea1KSUlU/QpircoW1UNlZ688QdXoHBl851tJpqQQ75LoGpEHHV2P4VDG7AVwW4cEOphGVopXYulTt0GKBKLGrFV+cSTLTQsZFP+gzclpgZyaoVabgV+6cu9gsVUcMVLBz6VrVj2TMHN2MKGoUV5GGSdl2ur6R6eZZAuPGJP5qQUiJv4LGLN+e1ovZkUh0K3HPd3QT88+FBrDTAtrsHncsLr0oB2V2n249dpBJgo+m7KZWiLM4xRMJ5U2L+oLQ5huUQtwVR/Rc3lWdtgGz5jBtePHp4VmX7c/rbJfjzfsFnsRlg5OuLNfJPOEpezLJFoPaAu2z5Dj82xEIqU6zYluG0EgTMjfHcB21ySp/h/zA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(39860400002)(376002)(346002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(55016003)(83380400001)(86362001)(33656002)(38070700009)(122000001)(71200400001)(38100700002)(26005)(9686003)(41300700001)(52536014)(966005)(7696005)(6506007)(2906002)(66556008)(6916009)(66946007)(76116006)(316002)(478600001)(66476007)(64756008)(54906003)(66446008)(4326008)(8676002)(5660300002)(7416002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?0qOu+LNHaPrY3J70GMqzLaBmNq4GBlCkrwvtYHqkZq9baY+qYNWJW3w31t?=
 =?iso-8859-1?Q?lE2lHrC/bNsfpWjEaccouxhiX2mkmFiaWJw960OtFFoDgEGPqB9iOM5pAT?=
 =?iso-8859-1?Q?/aW1bl+RjLD+LKV9pM3fAsx/KGNSuHKb9Xjevzju0FGYwJ/sjpWqCzWz8a?=
 =?iso-8859-1?Q?HbFOO+2M+vTiBJz8IUiQmndyNvILL40HyWqfwrl4CCF7jHFv9imSmZvZvD?=
 =?iso-8859-1?Q?LGBYIhcmf7IoyH8WthnVTuls5ZY9UxigiTjKU28AYlumQWQrEB0rdWDSHD?=
 =?iso-8859-1?Q?kwN9cpwy8AvqfufF8QhNzhTsgS4PjPGz9OrmPpd/kmnXl1I/vKgS3mrZ9T?=
 =?iso-8859-1?Q?EsC0F2w0rRNPrQNs3Aa6ZBioliziEAIMzyKdkHDlsl6YY+dDyZAIjxEty9?=
 =?iso-8859-1?Q?xQiEy1rDAwtRak44U3KrQJz0WxBw69s8rf01K7rj9GySTz8EuGs7RRJPPM?=
 =?iso-8859-1?Q?vN50CJBKmaNWknqSFWSBfg1SE937lmNnFtbc9S1byuttUqhYC4Wx661UXn?=
 =?iso-8859-1?Q?q8hq049bQDgAzUFr6HCHodtioIw3noPRcVApdbOIb1NaphnnFvYKicM4WW?=
 =?iso-8859-1?Q?OeyPtqGUKfFon9c2bM8g3sJLjhiFxR5rmjMoEGvlKEYY8xixPvMqU7iGnV?=
 =?iso-8859-1?Q?MtIc2VpMbJ1aw1joCFaEQlc7fkBSNZjKWgQ0vg6ICsqUFq+sTr4MBnKveU?=
 =?iso-8859-1?Q?fvr0UGuNZQDvxKlGlPZIXvQ4hdCCMOaDPHQVJwc5RFaU1IbSFzDtxW4FWm?=
 =?iso-8859-1?Q?pAtSZmgbpDR3Lt4E+4GIbclydU5FfwJ3rlqPi2G8EwmSYOX6KE5S5R/ZZA?=
 =?iso-8859-1?Q?l5r2VnWz6wVqWWol+Wkg53YdJHmitW1uZTtflRoQUYrlOqG8+iH7F0LE1b?=
 =?iso-8859-1?Q?b340iNpijni0aMPvyy8Wh7IIrFQyHGuv7gpxDSbqdmz1+5p+Wxb9i7nV/e?=
 =?iso-8859-1?Q?fxC4uRzcRS8AFZvMl44DJla9CMT9uEZo5vOo1WG/Wb11C6CJOayDmEhjDC?=
 =?iso-8859-1?Q?4ry6ZUtwtzqSoNAogP4uR9YTLJ2jQMYtIXj2z8woqYjCXQeZHGGEP922oo?=
 =?iso-8859-1?Q?jaSYG7PIIALsiWsKp3QfiHOvrC8n+lXrqjcrjWfuvw5c6gPtxET2Oyi1dM?=
 =?iso-8859-1?Q?scsJHIxMMB+CREuEuU+enxnvZyM+ATWGJneeQfnVAy+LopGH8LKseNDjWC?=
 =?iso-8859-1?Q?iLEcsjFJwW1/YV1N/SHP7O3YROcfCvwWdzGomkdnkMVJ4vlHxlG4uxuR4t?=
 =?iso-8859-1?Q?HoNywe+qX7kG8cPqNLGJAlV3NN+TkVmdbu/dM+E3RFvpcnV0/GL32p8iHM?=
 =?iso-8859-1?Q?HxbB9x1ncMDhza3iVMkjrO6OFZH2Qo0Mx8kBG10zfY/P5r4q8mwWwRBu6R?=
 =?iso-8859-1?Q?XnFGHp8lScp4dzy0Qv7MGb6gVLn5eJipWIeae1eSTHzaFLyx7SrSmj0b2g?=
 =?iso-8859-1?Q?voH4us3zf0MbaPfRsvTEMkG9N3/HCA+PodcQbzox8lmV3co3zzzc5wZkf8?=
 =?iso-8859-1?Q?FXegXJGo+nsQ+5GccfFRlI+eFLpohKFYOCEieXhykBq4Vq3NPKUvs340tB?=
 =?iso-8859-1?Q?AFwogUTYo6xs8WWVPIySQibirGHteortC/Sq83jMPWmJEwS4N2nL2felKx?=
 =?iso-8859-1?Q?IhpzTuRUchRA9ki+Uqf1z3BS1NvU+iMT4TTqQtieXOrVWTPJKMZm3sjA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dd0eec-00dc-4edc-d7d1-08dc1c1611dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 13:20:29.4003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQ7Gol5xOLmKujiY0PK/0/JaTCME4AEPl/CLlbLiH8LRiVonnSV+J1K0ShvMCG0YxbpgVsQ0wZEv/zl4nUys/ju7w6Vuxs47qRK8Dlx5ixM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9319

Hi Sakari Ailus,

Thanks for the feedback.

> -----Original Message-----
> Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video:
> Restructure clk handling
>=20
> Hi Biju,
>=20
> Thanks for the patch.
>=20
> On Tue, Jan 23, 2024 at 11:58:21AM +0000, Biju Das wrote:
> > As per section 35.3.1 Starting Reception for the MIPI CSI-2 Input on
> > the latest hardware manual(R01UH0914EJ0140 Rev.1.40) it is mentioned
> > that we need to supply all CRU clks and =A0we need to disable the vclk
> > before enabling the LINK reception and enable the vclk after enabling
> > the link Reception. So restructure clk handling as per the HW manual.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 55 ++++++++++++---
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 15 +---
> >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 69
> > ++++++++-----------
> >  4 files changed, 74 insertions(+), 68 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > index 811603f18af0..a5a99b004322 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > @@ -133,9 +133,6 @@ struct rzg2l_cru_dev {
> >  	struct v4l2_pix_format format;
> >  };
> >
> > -void rzg2l_cru_vclk_unprepare(struct rzg2l_cru_dev *cru); -int
> > rzg2l_cru_vclk_prepare(struct rzg2l_cru_dev *cru);
> > -
> >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru);
> > void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru);
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index c4609da9bf1a..f4c5cbb30bc9 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> >  #include <linux/delay.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> > @@ -108,6 +109,7 @@ struct rzg2l_csi2 {
> >  	struct reset_control *presetn;
> >  	struct reset_control *cmn_rstb;
> >  	struct clk *sysclk;
> > +	struct clk *vclk;
> >  	unsigned long vclk_rate;
> >
> >  	struct v4l2_subdev subdev;
> > @@ -361,10 +363,11 @@ static int rzg2l_csi2_dphy_setting(struct
> v4l2_subdev *sd, bool on)
> >  	return rzg2l_csi2_dphy_disable(csi2);  }
> >
> > -static void rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> > +static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
> >  {
> >  	unsigned long vclk_rate =3D csi2->vclk_rate / HZ_PER_MHZ;
> >  	u32 frrskw, frrclk, frrskw_coeff, frrclk_coeff;
> > +	int ret, count;
> >
> >  	/* Select data lanes */
> >  	rzg2l_csi2_write(csi2, CSI2nMCT0, CSI2nMCT0_VDLN(csi2->lanes)); @@
> > -386,11 +389,40 @@ static void rzg2l_csi2_mipi_link_enable(struct
> rzg2l_csi2 *csi2)
> >  	rzg2l_csi2_write(csi2, CSI2nDTEL, 0xf778ff0f);
> >  	rzg2l_csi2_write(csi2, CSI2nDTEH, 0x00ffff1f);
> >
> > +	clk_disable_unprepare(csi2->vclk);
> > +	for (count =3D 0; count < 5; count++) {
> > +		if (!(__clk_is_enabled(csi2->vclk)))
> > +			break;
> > +		usleep_range(10, 20);
> > +	}
> > +
> > +	if (count =3D=3D 5) {
> > +		dev_err(csi2->dev, "Timeout, not able to turn OFF vclk\n");
> > +		return -ETIMEDOUT;
> > +	}
>=20
> It'd be nice to have a CCF function to do this. Either way, you can use
> read_poll_timeout().

OK, Will update rzg2l_mod_clock_endisable() [1] to handle this.
Currently it does status check for clk on but missing the same status check=
 for clock off.

[1] https://elixir.bootlin.com/linux/latest/source/drivers/clk/renesas/rzg2=
l-cpg.c#L1201

Cheers,
Biju

