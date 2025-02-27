Return-Path: <linux-media+bounces-27111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D4A47500
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 06:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5A6168787
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 05:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2DE1E8341;
	Thu, 27 Feb 2025 05:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="GDFs91/y"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4195B3209;
	Thu, 27 Feb 2025 05:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740632656; cv=fail; b=gBZn+3prdESIkAnz8VFcRpHmxPk5Xo8ieUqhtZLSSwOf/sYgPsfp/x4ry9qBw83uGxGdAmrxf8zgBKnYiTkQYWFrBxIcHjU+hkMj6y9bf2aUJ5GzmzF6nWAFTfaf4m8VjlVga3cAJ2nA2syyi0PeiTRRpyvA7S7rRbhrOMw8aQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740632656; c=relaxed/simple;
	bh=WYYIqTOc//nuTpTgfRXwgVihwhvbQdXdf0xzrTU92vU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=anVY89inkVoqmlsrE9PP09uLQwaHqTjw8qBM8liJnCi45ELTOb+NE7fU9ySnGRjCGt8QGy8YADnZpVW21vqyt3hO00zYEtLBb+zHkEE8IcD34nH8fgtq+Q0zP06OSUhNr/mhabClMg0BFy48RpSCmlV9jn9fwIEWHtXe6DCFu5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=GDFs91/y; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXsYrHuhW3mJ3znY79eJmssjb4osnOMCNeO5nm4H9N6mi7NG2ncIP+dkVCFkY1EYRCPa+pQO4aHuzyfnj/qDd+pvCTc88OuWq/eF04jDx4lyvtT58/TAg+E2nFepL88lJwvsThPhHxdazPInvZwmybA771RJ/Gp/0gF/4ORsU/9p4brjnuHceSc4B5n51RUmfOqJGBs99d0qEk7W4Or5otPsIv5fTfoNjADanwmjQn7iYb06BGbPp6vAn2ckwmiVlLAw7Byoonp7tmQMMzQSINE0YvyaeLmJ7a+Uo/sOhaoekpl1UBHKytzJhNRnFayv2VXTWM9QtEJUyvB0R9YQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FcIGHLtP53J+t0TimwWGosH+5wQU9fwaRECAvJjEv4=;
 b=IkUaaOhKJFuzgTPlGEspZg9Avg/FS6mJdoyXarb+MsIjl6CyE/coKBTZnpI35cv3/DLo5v88Ha5GJWeAYTSL5lfzhP4GYea30/oHnZCNvpesNARCIE9xQHpyna4Y3EPUfIQpJaAv85QzkIA2l87uEGar/x3aRSTveCmlbXHDYQt2pSl40vd9rXwN5a+arRj/7ixIL7164YRSIZ4qLjRcLjKS0vJ9vcSy7yAbVjqueZ2tN/j2pr6hvryy2BUPuAVxKOacujC/qW2vtAqRhfRmg4HD3k+nGAZhlFo9R146YOTeX3+9RxZwketbv/UQrDguvFRzknh7Vv8r8x5zVg09Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FcIGHLtP53J+t0TimwWGosH+5wQU9fwaRECAvJjEv4=;
 b=GDFs91/ye693ll+IVD/2MO0sPD0Xs5na54mXOa5A+yhV+mCWK74w5FY5Bu27JuTvH0f94XZGRj04xfJCM3e+qp2Y/7baxYyDeeuy0dUdGkCDoAFSGL8Xc1M2tby3623Q+JmFc1ryEP7pWFKXvMIOzojP/MSMk1xJQHr8b6dlKkDNl1GI5PjgrFOh4zowygSJFA1sRJiTqOXzyCYlKfHCuT9vg7k/OeEkbXjeNuhV4Du8eeXE/vIdYnE2f2PXKQul1rtYWHektIG2WBL/d16xUI6PN7cv/4/R0NwYox2tsCe8ZTf0CRoCjm68+boZgzPCSUuOmQOrCmZXlz/oiyfkbQ==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Thu, 27 Feb
 2025 05:04:11 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8489.018; Thu, 27 Feb 2025
 05:04:11 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <mchehab@kernel.org>, <kieran.bingham@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Conor.Dooley@microchip.com>, <Valentina.FernandezAlanis@microchip.com>,
	<Praveen.Kumar@microchip.com>
Subject: RE: [PATCH V5 1/2] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Topic: [PATCH V5 1/2] media: i2c: imx334: Optimized 4k and 2k mode
 register arrays
Thread-Index: AQHbh05+NkGxpo7iTUOk3DNXeuYl37NZpuyAgADxoXA=
Date: Thu, 27 Feb 2025 05:04:11 +0000
Message-ID:
 <PH0PR11MB56115C346E4BE3CD3598DB5C81CD2@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250225062635.3566513-1-shravan.chippa@microchip.com>
 <20250225062635.3566513-2-shravan.chippa@microchip.com>
 <Z78lKVUsd-sxnZ0v@kekkonen.localdomain>
In-Reply-To: <Z78lKVUsd-sxnZ0v@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|PH0PR11MB4774:EE_
x-ms-office365-filtering-correlation-id: 503952eb-4852-4d5a-ffc7-08dd56ec2c75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oD+DBcspXA0d5FWLwWDz52J3yfpt/SmOFOkizUSJ5F6kd76eR6v8/kHb6k3/?=
 =?us-ascii?Q?+i+CQhL1Rg6Soj73cARD6J4ce0PiMkXCGWnzgB2Ld/tfdtNxkAXcRAROQ1fy?=
 =?us-ascii?Q?/9klIJlZBX1UN7srmPvFpgQkDIJ3gNi5cDyQJgn6xwi1V0FZ9w0mSCj5IzwA?=
 =?us-ascii?Q?8gVoXNyV9E1KS4vPRPyqdL3rm7XGQHuOfoeHDY1DITHkd3eThi7UDWtRw1en?=
 =?us-ascii?Q?wuPkzDjyy18ctGKPbyxFYdYWep4VuJAyoC6MppheMRJUb8Ei8hPp8ioaNd5q?=
 =?us-ascii?Q?QNampQXeZZKluxmS23Uh4bdPtVbPnj5lT8nm2GHzSAkj4QdcrqJsukTwcW2C?=
 =?us-ascii?Q?JjdvOnOEt246atH/ziS3xg1nC4JhUec2hNQYpwJzn4zQS++kC60b7rDdAsF6?=
 =?us-ascii?Q?/u1kugQVc6X0tg6xGji7cCstf6OCPwawLL1gYaNDj8fx/Con9wzGfI1Z8hf4?=
 =?us-ascii?Q?pxxJ8x8hH9OB/qzsSYlZgEywjU3iMq289t8qhsDcjJBcGS+au2RqRdNIKBUC?=
 =?us-ascii?Q?6mOYpUy5KgkD91r4lsQWMFPPBJvsJyGZuRlFLfWmlnSufvgwdhS4IfnYgiAy?=
 =?us-ascii?Q?FthbC/oiHhrHMzd+QIhgbLabtokSoAJco2JqMt8lPd9pcYjR2kyEhiLRFOZ7?=
 =?us-ascii?Q?Ze/NClOhA3rEBe6aH6pWPDne6/VEjL11Izyw5H0F/tOvtA6dVaouwpVpKT6s?=
 =?us-ascii?Q?+S/f0qDNNAhEFdqJSXDxM09myu7ho2ds6K4yjgj0vi5i65ij9FJy7JWqw5Nx?=
 =?us-ascii?Q?ZQf0CpR2pSPP5Au171HoVs97ySXWFGxXu9sQSwJezVzGeQ5KxsKmoTx9unDC?=
 =?us-ascii?Q?DM/3g8EFDeVoivIVg9/rFubHToLkD9g6WAJC0cc5roxjtJQ6bXQATJ80UHa5?=
 =?us-ascii?Q?voO5DVXfe24WYf8f9o0BmoefjqyYv5M9N6HyIHKSIboDVW9H3v6ree0v5jo4?=
 =?us-ascii?Q?K9hmA8W2JZoQKaZZPbakFj+8YUiVv+ODCg8FBpCSjD1YLqqRqSM7n9HqVD+I?=
 =?us-ascii?Q?XiqV3qbVE1xhYG/vt2N5xpGf88/IrB3ayjhn7vyznWclYbRunTKSOhtr52uz?=
 =?us-ascii?Q?wOeYRAcEPE84ItxHHGbz92PyWRrua6BNEJbqENTTlNdM9s4tym5219v5gKdw?=
 =?us-ascii?Q?uDpLTx2ajPNdA0Je0tCSL9DdtHkn4dZhA4edKBpaKd6ZOQ7FNfqJ/eASNM5V?=
 =?us-ascii?Q?n2rIml4qdcQqqRp88HGbiirJXLtkcDkxupaXyt5MrP083UjnYaKPkl/ZUsDg?=
 =?us-ascii?Q?sDDDb1P7WC5bkHlaSJTLPZ3bVBYo+0au3ZbYilma3Tqu6V0bUlFhTxi+01PK?=
 =?us-ascii?Q?dm+uKLM6Ux6JTiOzpXJmSDrV0uyl2QVUmE/UdppdkxuTJasXSiRWteeXFiga?=
 =?us-ascii?Q?Vs5CyoupaELmE7ultXe8gag22gSPAXkLhQvmn5sm5NY2dWnk/lyb+sQ/yZK5?=
 =?us-ascii?Q?y7bPgb4RQGJkUt4qAPcl0K9+5D24LlHK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yp6pMhrxyajWXRsyQjqIBHin4894vANecIHfuiEl0muQfN+eQaz5jmvM+TKf?=
 =?us-ascii?Q?mVgZ7Jih4N02i/8E8l2abXXrYtOLnNsDd82+S7IjRgsToQEaPz5iKprNJIB+?=
 =?us-ascii?Q?iEWqV0p9zQzz+zAWvmkzfrsPlJHqt3Hj5nWfdzk1ZpGiZaN20TS/Hm8tPjlV?=
 =?us-ascii?Q?RsW+oYkbB3ytV+clcdP18h3xjmDAmYW3vNNtawXEJbrjG5Nv/gH+kem9GEXa?=
 =?us-ascii?Q?i1H9FDkDyggTh98NEIHeoG3fkBu2KLAxZCmeVCny7o1L6t5pHC2mK+mbbNQc?=
 =?us-ascii?Q?9Sb/eOiPjpu3pYiauQWAsuWj6f+9JKhFWCoCvzGOD5KIiG6SeHQRxYsiiOjA?=
 =?us-ascii?Q?5hk3Z/5NhzB+qu1Xx7XroMUTbz+gCBhZwhqj9wjeUByneqm3cJk5Dzi0HyGJ?=
 =?us-ascii?Q?QmHrGyFxxsmp/k88DjTg6zamUN0mAA6KiYNjdJaniDILkVJUQrdkQ81ufysN?=
 =?us-ascii?Q?AoErWEoBtRKcGOaQKIjcPtwEE1crhIjEWd3pbKHb4m2PykI2qInDjNiaGLVm?=
 =?us-ascii?Q?B2PtSovyDVzdrU07dUCbTVceIKwAacsG5PY1iBANsZkdGSl8txkqxIXFwfvG?=
 =?us-ascii?Q?Ww1Sa1LrJemG7J7qq2OB+/YG9u9jiNKSIUL2ePki7v2cX2wiUtiCEtMLTv4o?=
 =?us-ascii?Q?KziXiePWvsKKot3vfMsYi0MQJnJC5gDO4NL04OmB2p2txQzl0SSKJB4aDFQ/?=
 =?us-ascii?Q?JKH1MSRbFUFudjlpNODLquUIMIqFYGEVzOjtGbO9eWVPbEaHLINy3BP0j1F9?=
 =?us-ascii?Q?CkHVWT3OWVX4WyjDbhRjMemIqnGy5DM31xhvaUppTgPJwMRkWUGl6s/UNY10?=
 =?us-ascii?Q?EQgsmgbH6MkfZ+3SF//mUvdSOrkt5Dlmrd5OxrgyLPagd3yvpklTp8x5CXpV?=
 =?us-ascii?Q?NGym/ByM7Pk8Zo9wHIGx46ZsSuDcKhRKn93GxQpe+kq/X01nehxzs7uP1ZFW?=
 =?us-ascii?Q?PqleS6n0HCu2bgRknkBvlc0gP2o5hwwNwmL28B+N+Ai9ghv+sHtSlbc20+k/?=
 =?us-ascii?Q?rcNzvytrCx1I4Vh9V1VulhgZgwdyOf0dhuqIu/eO9M8na2y0Bnx8Zi9V4qeT?=
 =?us-ascii?Q?S+F7yJQf9qVacqFRioTqKQtOSnwbLgeV5uDNIvftHqLBT4LYWD3+qIaoTj/1?=
 =?us-ascii?Q?9YmNLcWV9BkIPCOStNlVrXMDXnTKvxH90Dh4gqamCejBxgL6bjMFrh9McZXm?=
 =?us-ascii?Q?tAJJf22uzf7erj1hhiK3XvTNK8GmbgZ4CDLqpJjBj7Gd5WVpthMngauiM48p?=
 =?us-ascii?Q?HMnf+NjB6DQuijFzShDB1nLqNLxrXqiCgSHqDMrmII3WOyWw1qeaRIH/LQ/P?=
 =?us-ascii?Q?FM/jOtNT5hqeLGJfi9vJl1BPV+BbU+k5SgKCJhCrh8NKVDV9QL9kFUIUe6Pg?=
 =?us-ascii?Q?ZoPfvSSGEKN3Q5HBUgG2wu1KqzhQgH9YVpHKgXprmTlHBLFAZH4gfQ5xA+Dc?=
 =?us-ascii?Q?+dIG5ZiJ3dc3cGt5UVBQvNq87EEInf5CpSSz6PCjIfnIUJGLtsoMaB8CV+M9?=
 =?us-ascii?Q?liadXA2JpCbNfeI+sH9XQpk0JF/ae3TxavZtAoha8SMfT6BZB6/06F9WerbN?=
 =?us-ascii?Q?Jj2pfh8Ne557ihh5K026zDMvZWgcl+3wC9ZHTmlWc3ggfeq30D/lypga3RI7?=
 =?us-ascii?Q?hg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 503952eb-4852-4d5a-ffc7-08dd56ec2c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 05:04:11.4512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkaMD4udBkq7tj1uugmyxTeadDmUbWSwJ+T1EPjrt0numHYy/0JdQyaPukinM4Cfjh4nCm6I8v1+Ox4ne5kyc963eYNhQ8bNDVmuWj/PlSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774

Hi Sakari,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, February 26, 2025 7:59 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> I30718 <Praveen.Kumar@microchip.com>
> Subject: Re: [PATCH V5 1/2] media: i2c: imx334: Optimized 4k and 2k mode
> register arrays
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan,
>=20
> On Tue, Feb 25, 2025 at 11:56:34AM +0530, shravan kumar wrote:
> > From: Shravan Chippa <shravan.chippa@microchip.com>
> >
> > Optimized the resolution arrays by integrating a common register array.
> >
> > Adjusted the register array values for 1920x1080@30 and 3840x2160@30
> > resolutions to align with the common register array values.
> >
> > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > ---
> >  drivers/media/i2c/imx334.c | 148
> > +++++++++++--------------------------
> >  1 file changed, 43 insertions(+), 105 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index a544fc3df39c..b2ad19abaca8 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -167,8 +167,8 @@ static const s64 link_freq[] =3D {
> >       IMX334_LINK_FREQ_445M,
> >  };
> >
> > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > imx334_reg mode_1920x1080_regs[] =3D {
> > +/* Sensor common mode registers values */ static const struct
> > +imx334_reg common_mode_regs[] =3D {
> >       {0x3000, 0x01},
> >       {0x3018, 0x04},
> >       {0x3030, 0xca},
> > @@ -176,26 +176,10 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3032, 0x00},
> >       {0x3034, 0x4c},
> >       {0x3035, 0x04},
> > -     {0x302c, 0xf0},
> > -     {0x302d, 0x03},
> > -     {0x302e, 0x80},
> > -     {0x302f, 0x07},
> > -     {0x3074, 0xcc},
> > -     {0x3075, 0x02},
> > -     {0x308e, 0xcd},
> > -     {0x308f, 0x02},
> > -     {0x3076, 0x38},
> > -     {0x3077, 0x04},
> > -     {0x3090, 0x38},
> > -     {0x3091, 0x04},
> > -     {0x3308, 0x38},
> > -     {0x3309, 0x04},
> > -     {0x30C6, 0x00},
> > +     {0x30c6, 0x00},
> >       {0x30c7, 0x00},
> >       {0x30ce, 0x00},
> >       {0x30cf, 0x00},
> > -     {0x30d8, 0x18},
> > -     {0x30d9, 0x0a},
> >       {0x304c, 0x00},
> >       {0x304e, 0x00},
> >       {0x304f, 0x00},
> > @@ -210,7 +194,7 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x300d, 0x29},
> >       {0x314c, 0x29},
> >       {0x314d, 0x01},
> > -     {0x315a, 0x06},
> > +     {0x315a, 0x0a},
> >       {0x3168, 0xa0},
> >       {0x316a, 0x7e},
> >       {0x319e, 0x02},
> > @@ -330,116 +314,63 @@ static const struct imx334_reg
> mode_1920x1080_regs[] =3D {
> >       {0x3002, 0x00},
> >  };
> >
> > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > +imx334_reg mode_1920x1080_regs[] =3D {
> > +     {0x302c, 0xf0},
> > +     {0x302d, 0x03},
> > +     {0x302e, 0x80},
> > +     {0x302f, 0x07},
> > +     {0x3074, 0xcc},
> > +     {0x3075, 0x02},
> > +     {0x308e, 0xcd},
> > +     {0x308f, 0x02},
> > +     {0x3076, 0x38},
> > +     {0x3077, 0x04},
> > +     {0x3090, 0x38},
> > +     {0x3091, 0x04},
> > +     {0x3308, 0x38},
> > +     {0x3309, 0x04},
> > +     {0x30d8, 0x18},
> > +     {0x30d9, 0x0a},
> > +};
> > +
> >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > imx334_reg mode_3840x2160_regs[] =3D {
> > -     {0x3000, 0x01},
> > -     {0x3002, 0x00},
> > -     {0x3018, 0x04},
> > -     {0x37b0, 0x36},
> > -     {0x304c, 0x00},
> > -     {0x300c, 0x3b},
> > -     {0x300d, 0x2a},
> > -     {0x3034, 0x26},
> > -     {0x3035, 0x02},
> > -     {0x314c, 0x29},
> > -     {0x314d, 0x01},
> > -     {0x315a, 0x02},
> > -     {0x3168, 0xa0},
> > -     {0x316a, 0x7e},
> > -     {0x3288, 0x21},
> > -     {0x328a, 0x02},
> >       {0x302c, 0x3c},
> >       {0x302d, 0x00},
> >       {0x302e, 0x00},
> >       {0x302f, 0x0f},
> > +     {0x3074, 0xb0},
> > +     {0x3075, 0x00},
> > +     {0x308e, 0xb1},
>=20
> This register wasn't part of the original register list for the mode. It =
seems to
> have been written to in the other (binned?) mode only. It looks like a po=
ssible
> bugfix. Should it be in a separate patch? This patch is only meant to reo=
rganise
> register settings to a base set and modes, not change the registers writt=
en in
> any way.

Yes, it is correct that these values are not part of the original 3840x2160=
 register list. However, these registers have been modified in the other th=
ree mode registers array. The 3840x2160 mode operates with the reset value.=
 If we switch to the other three modes and then return to the 3840x2160 mod=
e, it should function correctly. Therefore, I am restoring the reset values=
.

Thanks,
Shravan

>=20
> > +     {0x308f, 0x00},
> >       {0x3076, 0x70},
> >       {0x3077, 0x08},
> >       {0x3090, 0x70},
> >       {0x3091, 0x08},
> > -     {0x30d8, 0x20},
> > -     {0x30d9, 0x12},
> >       {0x3308, 0x70},
> >       {0x3309, 0x08},
> > -     {0x3414, 0x05},
> > -     {0x3416, 0x18},
> > -     {0x35ac, 0x0e},
> > -     {0x3648, 0x01},
> > -     {0x364a, 0x04},
> > -     {0x364c, 0x04},
> > -     {0x3678, 0x01},
> > -     {0x367c, 0x31},
> > -     {0x367e, 0x31},
> > -     {0x3708, 0x02},
> > -     {0x3714, 0x01},
> > -     {0x3715, 0x02},
> > -     {0x3716, 0x02},
> > -     {0x3717, 0x02},
> > -     {0x371c, 0x3d},
> > -     {0x371d, 0x3f},
> > -     {0x372c, 0x00},
> > -     {0x372d, 0x00},
> > -     {0x372e, 0x46},
> > -     {0x372f, 0x00},
> > -     {0x3730, 0x89},
> > -     {0x3731, 0x00},
> > -     {0x3732, 0x08},
> > -     {0x3733, 0x01},
> > -     {0x3734, 0xfe},
> > -     {0x3735, 0x05},
> > -     {0x375d, 0x00},
> > -     {0x375e, 0x00},
> > -     {0x375f, 0x61},
> > -     {0x3760, 0x06},
> > -     {0x3768, 0x1b},
> > -     {0x3769, 0x1b},
> > -     {0x376a, 0x1a},
> > -     {0x376b, 0x19},
> > -     {0x376c, 0x18},
> > -     {0x376d, 0x14},
> > -     {0x376e, 0x0f},
> > -     {0x3776, 0x00},
> > -     {0x3777, 0x00},
> > -     {0x3778, 0x46},
> > -     {0x3779, 0x00},
> > -     {0x377a, 0x08},
> > -     {0x377b, 0x01},
> > -     {0x377c, 0x45},
> > -     {0x377d, 0x01},
> > -     {0x377e, 0x23},
> > -     {0x377f, 0x02},
> > -     {0x3780, 0xd9},
> > -     {0x3781, 0x03},
> > -     {0x3782, 0xf5},
> > -     {0x3783, 0x06},
> > -     {0x3784, 0xa5},
> > -     {0x3788, 0x0f},
> > -     {0x378a, 0xd9},
> > -     {0x378b, 0x03},
> > -     {0x378c, 0xeb},
> > -     {0x378d, 0x05},
> > -     {0x378e, 0x87},
> > -     {0x378f, 0x06},
> > -     {0x3790, 0xf5},
> > -     {0x3792, 0x43},
> > -     {0x3794, 0x7a},
> > -     {0x3796, 0xa1},
> > -     {0x3e04, 0x0e},
> > +     {0x30d8, 0x20},
> > +     {0x30d9, 0x12},
> >       {0x319e, 0x00},
> >       {0x3a00, 0x01},
> >       {0x3a18, 0xbf},
> > -     {0x3a19, 0x00},
> >       {0x3a1a, 0x67},
> > -     {0x3a1b, 0x00},
> >       {0x3a1c, 0x6f},
> > -     {0x3a1d, 0x00},
> >       {0x3a1e, 0xd7},
> >       {0x3a1f, 0x01},
> > +     {0x300d, 0x2a},
> > +     {0x3034, 0x26},
> > +     {0x3035, 0x02},
> > +     {0x315a, 0x02},
> >       {0x3a20, 0x6f},
> >       {0x3a21, 0x00},
> >       {0x3a22, 0xcf},
> >       {0x3a23, 0x00},
> >       {0x3a24, 0x6f},
> >       {0x3a25, 0x00},
> > +     {0x3a24, 0x6f},
> > +     {0x3a25, 0x00},
> >       {0x3a26, 0xb7},
> >       {0x3a27, 0x00},
> >       {0x3a28, 0x5f},
> > @@ -989,6 +920,13 @@ static int imx334_start_streaming(struct imx334
> *imx334)
> >       const struct imx334_reg_list *reg_list;
> >       int ret;
> >
> > +     ret =3D imx334_write_regs(imx334, common_mode_regs,
> > +                             ARRAY_SIZE(common_mode_regs));
> > +     if (ret) {
> > +             dev_err(imx334->dev, "fail to write common registers");
> > +             return ret;
> > +     }
> > +
> >       /* Write sensor mode registers */
> >       reg_list =3D &imx334->cur_mode->reg_list;
> >       ret =3D imx334_write_regs(imx334, reg_list->regs,
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

