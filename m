Return-Path: <linux-media+bounces-17107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA6963E4B
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 10:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C0FA284B08
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 08:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1974118C036;
	Thu, 29 Aug 2024 08:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NkdEsLng"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC5A171E73;
	Thu, 29 Aug 2024 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919876; cv=fail; b=SXFHYIWXOh1TH+3doqzqk8wOz4sxUmFyjBMHv/eXxnQXvcOVO0EQYzI+NadAWSyZBzsdDDW+x2GYeXnIm25p586o7gTVgEgvgsJsxc+5epUZ2TQXpHyzXtwHGSdcPi8QmN0YzN4HL5yXlZ31nVGXfo360j79hlG5uSJsTtBoTck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919876; c=relaxed/simple;
	bh=7cKUAqi8K8OKh9oBX5MsEWqIETejJmklsSnuokLu1q4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hwmIxDUpNkwFjq4Qi6bhWFjQlgdJieu6SXHL8fDo3/o/vt3tD75xid/+58ZN7/FSg6KytaIKYhiMvK2mugohKpj/qVJ6z1SoyXpcasd9tBIplxIKgBygWg6g602KXmo3/6iXNQ8VcHWUV+WnzzDNTRIKMCu3rMuChLiQpOwPj6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NkdEsLng; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pqwj1/tsA/G6FDLKZUQ1EhPbKUn5wqK4bbTvgxjo5fijcEr4m/IVGGgu+2XiCmnldY/mfzOzf/lzIiR8h6HFSWrccVT68ZfrgRU/udqfjudhKnR+yfTaQ8ZJsZI0eMloW73TlCgj+TZc2FAmeRvINrctYkrAvvexGV72RpIXcOY2HWWCAgGTjkblJOvCuHL/HOg4sL7QgX3aZEj+ytz3SPZ2SdgBxj+XkD7DpTVUVOcUcp8gd4P0NrWJd5bvxjti8jvvcVTd3SqtomaZC/9XN3WnfN1s6Ta4el9jMad9fWCO0FGQKI7bzvVrgbQxatdoaR/o9FZfRL8xHVsEJzvHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EY5LnRQQJ3VJBUrU4lzCQiYIpxL4npY3c/S4tWsEPI=;
 b=KW+hKOgkLepLQ6HxXVzI5vN88TKyXzEqv3veMHfigGgvRtOhBxKVPL6vXTokZcriBaO6PydardKNpie+8efLorPJnSN+UjCp9hruNp2PCtn7qmAuJQAawMFIcwK4xqzOkgIyok+dI6nWb3v0pN+rzKY7WgTcyKuLfxY9YzYie1Y6ov+9QtLFEi76YCeTEg3/kEJ1lOOpDf+S+S9bzVgRGDj5nI++3k/AovoagX3m1DpuhNnx3BxtLOyQQ5LDY+x2UcDQ8vUSBvhboWJa2Qbco6FhB26/D31d7YjsN+trptloqum9VN0ungMoP+N6fcnQ10rT/2pop0O2uy5opvrv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EY5LnRQQJ3VJBUrU4lzCQiYIpxL4npY3c/S4tWsEPI=;
 b=NkdEsLnghn0n0eMU0vy1Hlh32Cp8BtrripcHuiseRELbUehXZJF4RH84Y8SgZ3VPBUJKNrffztCoeyAWWB2iaXKecv9qFdqTMfhz3I+2jCgdJwlgx8Y2h73663BTZtnbEwu+/JXinMIL0z1cyMo0GLDciJw+g/khT4/P+pLAVtk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10380.jpnprd01.prod.outlook.com (2603:1096:400:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 08:24:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 08:24:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liao Chen <liaochen4@huawei.com>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>
Subject: RE: [PATCH -next 2/3] media: platform: rzg2l-cru: rzg2l-csi2: enable
 module autoloading
Thread-Topic: [PATCH -next 2/3] media: platform: rzg2l-cru: rzg2l-csi2: enable
 module autoloading
Thread-Index: AQHa+enQQMG8Vj5Mk0m0LxrkuO4AUrI95YJQ
Date: Thu, 29 Aug 2024 08:24:29 +0000
Message-ID:
 <TY3PR01MB11346E9A2EFE8B5558BB19C6386962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
 <20240829075417.526459-3-liaochen4@huawei.com>
In-Reply-To: <20240829075417.526459-3-liaochen4@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10380:EE_
x-ms-office365-filtering-correlation-id: e2618f71-2cf5-4cf9-7157-08dcc8040054
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tTOHVCrKo6qbIDP8PiUYP14Ou3V/6CZ292Mxh/vJCOHUYr2NVEGcJ7GbkGxj?=
 =?us-ascii?Q?e2ZeRFvnm0qfX1A23aT0aTqT6aAsz5aKQjv9ICLYnh+3z52MPD1atLC0zvFP?=
 =?us-ascii?Q?1BBhnuNuFxftlNM03X/qtL013UpLf1Pkn9nFE7ZMJm1dWAAx8Lygpj/dG8Pd?=
 =?us-ascii?Q?UqEgfER9+mmYHotsCMjeIbOR2JRqJ+OOkJinVpjSgavABBeV/9/OyhnmdoJ0?=
 =?us-ascii?Q?DSt2/B1Qe+ft583fB8WwEJSSzXYjoyWmaq0N9PmLHm5oSo/xzQfbABqzUPC2?=
 =?us-ascii?Q?OyJhdfK3geH1kDHE9TaNP2gOexkwMMTm6IfP+QNNJz4KjbjsRHjPFBDffoQN?=
 =?us-ascii?Q?hdnjlaOCclg6oOjXy8q1tFnzYeQovFXYNMuKGAhv2mPL9vdeFJdLTpKnlWcH?=
 =?us-ascii?Q?ARdjSRBoVrRQfWoMX4CLQq2o9pqG/Mz4pqV1/Hx1Thp3LmZXMxixtrANGejp?=
 =?us-ascii?Q?YlIIRtdWd2enpyEPRaHixSE3h3AsdoTUjqRYFGK44lrKQENeQz2kDcuxHJex?=
 =?us-ascii?Q?Vxk1OlhtLjQEnhcbwITvQUzIdBQspoQ9pI/sWuIDEbEWJ8eD+TbOMw0kXfpv?=
 =?us-ascii?Q?X8s8DhDBSigTPVLzD6bLhw6BSmyMmp1RAABCPDdYLu3cJWYIV7WD6Pz4UbEJ?=
 =?us-ascii?Q?fNkDAts83jfT3M3thhyhvSnQSWEXMRvEyt8JZ1tWeGgjs7K6UnFC0UKjp4XJ?=
 =?us-ascii?Q?li9KdqlOrz2bGtRQ8X8cyZt2MBBUmgd8rH7ebZTJCd7Dn3gvAeBysy/UboYh?=
 =?us-ascii?Q?wLcWeBuVfl8urdTTq9Gq7WOPqfntoqcjWeTniGADoeorsXVr5Uzcs3uWy/ry?=
 =?us-ascii?Q?VVQCClaat1yLWvVD66kmsOCWAw6N0T0pKXQxBwGZFQl12yZQWuB3173CC34J?=
 =?us-ascii?Q?N/T836cpmxsVtKINwD4a8t0GVwJGvLt3bsMScxkjGx4sbfoCu0q0AENQ2zBY?=
 =?us-ascii?Q?uxx8iaEGalkK/fFFUVip1NrxSogI23qV05DYFQdurgMUZ2aMRK9IvoTC9dtd?=
 =?us-ascii?Q?xWdpfgJAEDvKtr8G7pwHPDIzwXKxxQHpGUe+ER4nUoePROybgobzAA6wZ9UV?=
 =?us-ascii?Q?CBY/vy2EjqOmfKWDKooGBjF+neAvO3vImHoUQ5IOba+NHeBlZaPXTAuDEItW?=
 =?us-ascii?Q?NXM4yfNg1GIPSZgV5VIPlylRM/jmc3SLUZ1bPkfmY5JoOv8FpkBdpwkF1EDb?=
 =?us-ascii?Q?EovMr+KWU8bMIj8Fl95onUMIYUHihuhpVY6Z/Zn4QCl0cA2k/HNSblr7MZl8?=
 =?us-ascii?Q?W/omIeEW7UJhbZlDI7TjP9oHrlk9UF4FfrYXhcMZSmL6zHvwKSsX3lBFDQsH?=
 =?us-ascii?Q?c8dLSqWm5dsBqM7RUndYTY+I3MCRS9kHTtuPy07y93q0ORIncQfhFDyKbbXK?=
 =?us-ascii?Q?b3TCy78=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mbFqkFZI521CUMs4s7zAsXyBmJbE5ofLhSJepeaS1DcMYc7q37OHzt2Cs6n+?=
 =?us-ascii?Q?LbWvQtG4y66pCRRxlIvrm5zxnI9GRcPrwO41NbDn6LA7OwO2o62+FhyBgL+l?=
 =?us-ascii?Q?JkgReBrbPgTMjEH3P0fHvbsfPRep9pR0Ro+waC9x19xpciCjt2T9OeqiuPSN?=
 =?us-ascii?Q?/lkhPDigDmw43LWF9gRA7bSWd4IxyhII3XZXpZwmM8s0AoCy4I+2/lLrgb+T?=
 =?us-ascii?Q?tLLSoInScv9eILRsWgD3mkKIJ2dJ/H50GVTWIip52kCfYi+fEdp+4TkZr+pq?=
 =?us-ascii?Q?TKzeOd+nt16Vr0/IU3PpXam3/LlTfpAxQDCdoACVoUQWi72c/TlrxQ0NgweR?=
 =?us-ascii?Q?zLwsADBNFAH2tYyeiX2CpSRGyyINZq0ffZoXq1j3MzC4hx0nCa06VuqIY8id?=
 =?us-ascii?Q?ivtcqLO96c7emGQwGCZz5RC++y5P4X+xI2anOgEtkK+XtDRKF4CNdFJlAjf5?=
 =?us-ascii?Q?80vwZ3iMPD1ru0GOnXcKWEU3H2SZeyajBMaUYHH92zjldR3NA2KxE8e3z6/B?=
 =?us-ascii?Q?gBdZegQCMNb3DUhUUVhcDxqfvWn212SDtBQnzc8vJwhX7WMnt9obPDb9uCQ0?=
 =?us-ascii?Q?OFb9CINqcGkO7pKU6jTNr391Qx/7xEkzSoNM2mcHTWKTpKFrjcWkpArVPmv7?=
 =?us-ascii?Q?1qNFosMvvX9CR8ZSZyAegRBKnMD7PBTSJtnu8SrDaJHosnxQqAD0XtrWQSoz?=
 =?us-ascii?Q?x4tv45NO865o9rLWRLKrsX71ALsJ1tSc1TlpJ1CrdvoO/D6QLiQbOoUTpNSg?=
 =?us-ascii?Q?4wc949FDVcrC8pTBkAbe0suIBkv9ijvvOp5mgSUtefx6yfoBIG/laPXSYOt7?=
 =?us-ascii?Q?ElJEXVci4+DHK6uMd0RSN5yI0+aVv1HEqr1nbRlI1aNU4DG5MoRe1ccEWjEi?=
 =?us-ascii?Q?oVFGyYzsrou+YSblQLV0avVaSynoQGLmpA+DPSUEitMJVYc97T8krCUujghQ?=
 =?us-ascii?Q?pzdtkLC5L9aQgCCE75big34vn16iLmlmXA6AN/r4h2KLzEQjPqIK/HzWSCOq?=
 =?us-ascii?Q?6wllGzi/pHVSp/N6G1n0iipGSwxPlwnCL7cMYHIvmiSUVZfxjEmiG9LR6i3W?=
 =?us-ascii?Q?9amF+HVheNseYQctCbVFz+mxEGkuJssqI/3l1GAVJylXxppzpJRwsE3z5icb?=
 =?us-ascii?Q?xV712Lcq3A7oXgkBvd40+hp3NZBn4aMakZDH8I2ZoJWZCvSZZ4Adt8waK6uO?=
 =?us-ascii?Q?9+5/R59ZDX0HEf9DFJPCf46Ewny4mW50BoOTZwuxlwQ0/vWz3H034cgU71n+?=
 =?us-ascii?Q?RM2iVlp3kPits9yje6E6euBF+2FRsJlz3RstCyaqWijvWNYMBLuJokitA7Fs?=
 =?us-ascii?Q?/BV9K2C6zU8JEiXlj66kvIQQeEzFqkPhqkL3YlAVSc+3eV6LkPvXzBa3hP2X?=
 =?us-ascii?Q?ZT6c+licg+XosvpGHafzwYWGSsKi4eqUG90wJ9ZfMv4VcCIqd6APYOiZJjs6?=
 =?us-ascii?Q?xqqUqfbwmiGpgsmCuKNJRS5UjTY0h4wuE7PWhHkJp8Pt6KW9wgJmbwvj24PW?=
 =?us-ascii?Q?hAv/yd/Mqj7tfXw4pAeAX99GE45hPFT/xeWDlSLquHNMizDpEBcFvE0UnZ9F?=
 =?us-ascii?Q?EhhnJqsc1SLi+C0ggb1FOkZrTxcLaS7PF/FSPH2gdzYZgKNmWbYp+b05vRSu?=
 =?us-ascii?Q?Cg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2618f71-2cf5-4cf9-7157-08dcc8040054
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 08:24:29.0189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jb1EpIotvtinD+F/lql9cqxXTgSKo7/LM13AQo526TZL8uC8uJaG27MUnZelxefgQFfUupkKoE7Q3fatQk9jSXLMtMH2LZy6nCpR3Akcl0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10380

Hi Liao,

It is same as [1]

[1] https://git.linuxtv.org/media_stage.git/commit/?id=3D07668fb0f867388bfd=
ac0b60dbf51a4ad789f8e7

Cheers,
Biju

> -----Original Message-----
> From: Liao Chen <liaochen4@huawei.com>
> Sent: Thursday, August 29, 2024 8:54 AM
> To: linux-tegra@vger.kernel.org; linux-media@vger.kernel.org; linux-kerne=
l@vger.kernel.org
> Cc: hverkuil-cisco@xs4all.nl; mchehab@kernel.org; thierry.reding@gmail.co=
m; jonathanh@nvidia.com;
> jacopo@jmondi.org; sakari.ailus@linux.intel.com; laurent.pinchart@ideason=
board.com; Biju Das
> <biju.das.jz@bp.renesas.com>; tomi.valkeinen@ideasonboard.com; liaochen4@=
huawei.com
> Subject: [PATCH -next 2/3] media: platform: rzg2l-cru: rzg2l-csi2: enable=
 module autoloading
>=20
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based =
on the alias from
> of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index e68fcdaea207..c7fdee347ac8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -865,6 +865,7 @@ static const struct of_device_id rzg2l_csi2_of_table[=
] =3D {
>  	{ .compatible =3D "renesas,rzg2l-csi2", },
>  	{ /* sentinel */ }
>  };
> +MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
>=20
>  static struct platform_driver rzg2l_csi2_pdrv =3D {
>  	.remove_new =3D rzg2l_csi2_remove,
> --
> 2.34.1


