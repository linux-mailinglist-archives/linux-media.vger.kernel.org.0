Return-Path: <linux-media+bounces-5171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B321B855465
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 21:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60114283852
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 20:54:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B478A13DB8A;
	Wed, 14 Feb 2024 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EcH3tZe/"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2081.outbound.protection.outlook.com [40.107.114.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF274128831;
	Wed, 14 Feb 2024 20:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707944087; cv=fail; b=r2XAPgtrKJS8ngz1UjFtNkZrCWZdeg90qdYtNfAgFA/h0MxDhPR/CPOKZazT3r4jT8f/rwJxPDjsuAauYjiV51jrQgfobHVdFEnm7F8K4a+Wz67uMdFO1UzlnyaIhbV9zvg7FQXgWw39Mw1IkeqRNLwN5HpcnTbur4psvVmkw84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707944087; c=relaxed/simple;
	bh=9KsGFdDrPFvfWb8ZoHAdrgXuekNyNnXA2PDBJJYRJvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OkpBydUV90T4QQV8jiFiNhVMH44i02EhMg5GcfSdT5Wi+fMwV2k2fs8Zpa4lcreFosunsgepEY6ViFbULAWdIcFz9WmryoAEBHv+bPe5/CPqhjny5H8marYnHFfUYIrSRxW2XvJD3vj9bSNgS6unMEjcws+K3HVJeVrlWThgchM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EcH3tZe/; arc=fail smtp.client-ip=40.107.114.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iVuB5/GrilewNTD0DjiyOo3MzqFzMxNVU4nvNZQ1ye3+IIGVVv8yllE2oYh8XgSC7gQTFS+hm/h9ZwzhOrFfceEuEnr3VTBfkzwNIePs65n1UQ1tyFejIivqGUINrXWNu+mfQx+tqS1BqNfMkaBKMmxbq+ZBIeZIc6cPU7yfdcWTYy1sA3fIiIg+rbJ1YqBJ1IihwwErjPYYP38fstW++z/up7v0fiU0PzvHt8soam3VTQvNrKowyBNH4m5qlOJXrU6GfClXLhMH+u6+KQjXbTBWl4LKLE+DQm8p2aOgSXwQaGR/5oj597NjtXHHaGDFo+ORUvjFRXL9oiCsltBMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzkElRPmn+WkkbWEZ3GOB6YGwmnCpYm4TBW8Dogsuoo=;
 b=d3/1KsDbZogZMF/Mm1gWUutAiYsBmqROW9opGtXqG1C/sPPfciOBCRSXNbKzFpIeu/XtKoEArpK/+FhVKh8ap3K5TrEVKojcMaMXFjGTSq3wd70Dvd2rdiSiD+z31wP/16qH8YNgYVwGKNMgyYyrqRyWUM96sB91tNW+lKaTl+0RxIEJKsmvzWLl7wqYCoQtoGwMLc1xTMwoeuchT81rfieLrAVbvcE0mMs9xPn324jWTZJ+4f5wxFDblf63OmT9uNSTm08YLzi5E3u8EO4q09nKqJ5KLmrVrmrQGjYRLrcw+AyAZSoZbR88SdMpaW4w5YAUPoVGHNHNJgdlABi0iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzkElRPmn+WkkbWEZ3GOB6YGwmnCpYm4TBW8Dogsuoo=;
 b=EcH3tZe/gysBtLk76Hu+pLw2EwSVGihZcr12jOi1ZbjRcfr/nM0kEKH4Or220wrKeXemi3QQP1kHxjTjVCrnOTja1ONftU0Z4KnfycE9Ns6rpLOvnCEBO0XYQOQ1MukILBK3Apz2TX3mwKPxjYWE9FdpmgvFXCPOLJq/0D81Gkc=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB8642.jpnprd01.prod.outlook.com
 (2603:1096:400:139::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 20:54:42 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 20:54:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Wolfram Sang <wsa@kernel.org>, biju.das.au <biju.das.au@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Topic: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from
 ov5645_global_init_setting
Thread-Index:
 AQHaXoVU9ilCtHOjSkysdyM8MSKnYrEI2pOAgACbwACAAAz2gIAAw/DAgAAKV4CAAABRgA==
Date: Wed, 14 Feb 2024 20:54:42 +0000
Message-ID:
 <TYCPR01MB11269F35E38BE52CDD6628006864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com>
 <ZcvsyRfVwC0aJ5fb@shikoro>
 <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
 <Zcx6Ty2tu_ZGdURj@ninjato>
 <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <Zc0nWfwFFGhqxHQq@kekkonen.localdomain>
In-Reply-To: <Zc0nWfwFFGhqxHQq@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB8642:EE_
x-ms-office365-filtering-correlation-id: 7b80f7bd-7e50-4bb2-3985-08dc2d9f2ae2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XeWAJBDyvJzZ+6QEHTn1lwQoLCfg+TQ5+ROcqWFtdQ0bAW0vFe86soWq6TZjCeM7f7saOZQjJWSXlv58gWQGeC+kX0wCn7DFndXNE9gG1qGMR/+TGowzId4ATfoHO7GqQeii0PTzjJXAq7JaaQ7TxDe0IiVpERoJEuJLE39g2IdhOYu3K40oKV56+6+F8FYbYiESAy6Ly5IrbZApNkouGJjNOo8Al7eXwpcVDqh9+Ps9oGeoZo7qyheHnhUm4l+rM6upRaYraSoOIo7nLjuUxKJVVX0U1iWbh3LIje74cxC+iyRnRyejTzIzDho8uRxqyUngD4P1hB1mt37SMyjbw6b0HR90KESTR8S9AqHwpOcgFpxylc9f/NnI5M7mfCz58GGxfihCXo5ISaFokTsGwUZNZb3NO659qS/CCf+f3C07x12rBKOGnM6B9RxYKKULriXLWvYvjmZg9e0/qlKjLnABTlCUse+EaxuHhTl7PkNe1Ot4kJyoxxLErlG71WvHxLbXHCcr9quoooZAW+kL62oMlzIzeDd5OBC0xiCY5tR8sy86ZlIZehIGKS4ROjhssAnvNPCCeMxZd9r/Fuv6dAdlMR8JfbDuTb4VDtvyZnDWwnwHVRYZ1OYNKsnqTY6t
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(2906002)(86362001)(66446008)(6506007)(7696005)(9686003)(53546011)(316002)(54906003)(71200400001)(38070700009)(41300700001)(26005)(478600001)(66556008)(8676002)(66476007)(64756008)(8936002)(76116006)(6916009)(4326008)(66946007)(5660300002)(52536014)(83380400001)(33656002)(38100700002)(55016003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u3fMIZv/B6ejMYPaeozHE0tizb3i1Z4p24LTNIQLurwJXnhFvWD7t0mhT+KQ?=
 =?us-ascii?Q?Qa+oDmDxcN3VGC8goT7u7idnblElb/iXfQ7JKkmUaxAygA5uhHAK6rQO/AF3?=
 =?us-ascii?Q?/hMnmYz6qwx5f4tR8r2iVR6+NP/BAVWKL5cd+8OG6qYxVp+uyUMdQe0kv/6F?=
 =?us-ascii?Q?ZkwWSnYWds5y6PCNCvFV9yOYFOa0yuJGMCldM/TT3B6UGoIJsljChYQvwwJD?=
 =?us-ascii?Q?pTXx4fEqUilY/zv3ULcjxa4Spv+yUpbHQf8JBtbUYN32GBIP8BHCZAeQn/kh?=
 =?us-ascii?Q?NdCfA6U3YzxLILDPtuDm7cUI18XC15kmnVWh8Fvb0MQaulsy1uUBaFJN5Uq8?=
 =?us-ascii?Q?ayZ+eyJBDUsUb6kBeMBJ4g7umKG3Y0asWv19I/5SbinRdGzqpMPUphqsbv0c?=
 =?us-ascii?Q?FlMU4yW04NDrQNOt3aqmM6kMgVSIomw1z6cZ3Rx2Dbp21qeO3TfeRAPw2lOr?=
 =?us-ascii?Q?DmDMqnY/Cp9uqMr256PC+Y/NkECUZPNweSHr6uOsfCAuwUyQxTUdJd/Faeyb?=
 =?us-ascii?Q?7Y+O1vQypMRWJmI5QWcV6zqBSGn7rnw64BANGkIdmyqWU1ciRRX5PWV+uVtW?=
 =?us-ascii?Q?7gFLRXMKW2kqgfFUimYjjo0EXbSdV+OoV/CtyAamTzMlWDHjO0YOv+TqM3gt?=
 =?us-ascii?Q?9EP3WHZF4wiDXWdbIkvD3dLQ4F/sUr/UYrhZQ1snmG7ZMXYVTq18LZibgs98?=
 =?us-ascii?Q?7vRa7bMB5EectxsXaEM3kE3BHyV+593O0QjAPS+rZJtKCFK9dTm9tp/5QUjN?=
 =?us-ascii?Q?68+q7fPegMFGFRoIpULseldig1jQ2/z+eRV1dpSS2CQrZq+Xy49SEBD4eUxz?=
 =?us-ascii?Q?l0IhlIXZY43LDfXbuLL0EfIc/cQJRzpO7CNeBLYQSbJFdYMchecP1QWDv1j6?=
 =?us-ascii?Q?obFu2uF7ZF16jNc3zW278kiEfQKqGkwgR0TzvzefG9QQLFPvEDUJBRHMm/xf?=
 =?us-ascii?Q?vdygOSMHT57sIBtbz4JInM4120NMrte7uXAYAnEwByyCYuCgbLIzWJYpY/9r?=
 =?us-ascii?Q?A3B7+4LS3plm1EwNj/j2ao2MY3cOVzIbD7YJOvx8PTt/27vg5LcruK2RS1Vd?=
 =?us-ascii?Q?ssBW3WbucwX/BMds/xDTlrrRy79tRY2rLGrkj69gdxr/kksvkl3nQaKH7Os2?=
 =?us-ascii?Q?Lert/MUDU0nv9+AeezX9+ixtR1E13aU0yZK27ROOd2jZHfmmSMU1E2E+geAg?=
 =?us-ascii?Q?vOBUZ08hKfsclVtxxtEH41rGMIPc1wCgUkOLJlQHeT9aeEJAGKrmyTRRc/XA?=
 =?us-ascii?Q?JlAkGtsPjOTU4YnTKA+dpslp4VdM3zROjmNue8tDJ2DvK6g1mSSN9GKGG1RH?=
 =?us-ascii?Q?65VQ3nX8p8LudDBc+9YJuQIK68La/4A3u4qTGmBWRQHrlKFJCkbacOnux01l?=
 =?us-ascii?Q?8JKo64mfe8dNLCC0wmstlk2NuWGUVR3WXjSqE0DdycSKKIklOaH8aBf369IG?=
 =?us-ascii?Q?WrvKczcoNkXJylcYuLu44Mt1xWFHX8z7qc+aG6v/eP8qGorqjaRgwtSI58cA?=
 =?us-ascii?Q?4uPiyeMDvkSLdNVU5XpsXVKmWUAKY8G0F/pv8HtCsSAt8q3UJ2o9XH73ctuB?=
 =?us-ascii?Q?yEcok0pLYOf4MKEJl1H1ZPlImwTGL6mdKqAaqt7FEsXb0eNLCvauw1Bxo+wX?=
 =?us-ascii?Q?wQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b80f7bd-7e50-4bb2-3985-08dc2d9f2ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 20:54:42.2067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oi3953L2m9swZPh8leQ0rgi4WxTMIzth645Smr13UrufPMnKYTJvX0vZVia4/DNHu2dHjjOoNVmhJsqhdpfW/rQEwmvlc5V/pBHw5MVGr5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8642

Hi Sakari,

Thanks for the feedback.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, February 14, 2024 8:49 PM
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 fro=
m
> ov5645_global_init_setting
>=20
> Hi Biju,
>=20
> On Wed, Feb 14, 2024 at 08:25:16PM +0000, Biju Das wrote:
> > Hi Wolfram,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: Wolfram Sang <wsa@kernel.org>
> > > Sent: Wednesday, February 14, 2024 8:31 AM
> > > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register
> > > 0x3008 from ov5645_global_init_setting
> > >
> > > Hi Biju,
> > >
> > > > I think it is different here. That 1 msec is delay associated with
> > > > applying hardware power see [1]
> > >
> > > Okay, ack.
> > >
> > > > I will restore it.
> > >
> > > Thanks!
> > >
> > > I had meanwhile another thought. What if we kind of merge the two
> > > patches, so the outcome is basically this:
> > >
> > > In ov5645_set_register_array:
> > >
> > > 	If (settings->reg =3D=3D 0x3008 && settings->val =3D=3D 0x82)
> > > 		usleep_range(1000, 2000)
> > >
> > > ?
> > >
> > > Then, we don't need to split the array and we are also future proof
> > > if we ever need to set the reset bit again somewhere else.
> > >
> > > Bonus points for replacing 0x82 with a define :)
> > >
> > > What do you think?
> >
> >
> > OK, this will do check for all other registers.
> >
> > But from your power down clue and checking ov5640.c Looks like there
> > are 2 registers changes values after writing.
> >
> > [1] 0x3008, 0x82-->0x80
> > [2] 0x0601, 0x02-->0x00
> >
> > I think [1] is soft reset based on ov5640. Since there is a gpio based
> > hardware reset available, we can safely remove soft reset[1] and like
> > ov5640.c, if there is no gpio for reset, then do the soft reset[1].
>=20
> I guess that would work. My understanding is that hard reset control is
> mandatory for the device, so there really should be no need for soft rese=
t
> in the driver.

OK.

>=20
> >
> >
> > Then add 1msec delay for power down/up(0x3008: 0x42,0x02) and 0x0601
> > registers.
> >
> > With this looks like the Camera works ok @400kHz.
> >
> > The plans is to add a u8 variable for delay and enable delays for the
> > above registers and add a check like below
> >
> > static int ov5645_set_register_array(struct ov5645 *ov5645,
> > 				     const struct reg_value *settings,
> > 				     unsigned int num_settings)
> > {
> > 	unsigned int i;
> > 	int ret;
> >
> > 	for (i =3D 0; i < num_settings; ++i, ++settings) {
> > 		ret =3D ov5645_write_reg(ov5645, settings->reg, settings->val);
> > 		if (ret < 0)
> > 			return ret;
> >
> > 		if (settings->delay_ms)
> > 			usleep_range(1000 * settings->delay_ms, 2 * 1000 *
> > settings->delay_ms);
>=20
> I'd prefer checking the register address in the write function instead of
> this if you really need it. But it seems you don't.

With delays in powerup/down registers (0x3008 : 0x42,0x02) it is not stable=
.
So, as you and wolfram mentioned will check the register address instead.

I will post the patch, after testing on various platforms(RZ/{G2L,G2LC,V2L,=
G2UL}
with 400kHz and 100 kHz
=20
Cheers,
Biju

>=20
> > 	}
> >
> > 	return 0;
> > }
> >
> > Please share your thoughts on this approach.
> >
> > Cheers,
> > Biju
>=20
> --
> Regards,
>=20
> Sakari Ailus

