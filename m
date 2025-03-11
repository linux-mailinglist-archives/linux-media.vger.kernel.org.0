Return-Path: <linux-media+bounces-28016-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FF2A5BD05
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 11:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4E0189209E
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F69C22F3B0;
	Tue, 11 Mar 2025 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="El+YIluG"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7341B22B8D9;
	Tue, 11 Mar 2025 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741687177; cv=fail; b=jJ+qlhhQzHwvaBQcBDBg0pJCPMfS5bZ5fZodx7/Pi7JaAnxIlTA40G36AJlvI7XzT9hrwvmnd/HO1uJXHTzw8Abqw5KOVq11v1kBv7YsLTuMd5geHmAnIwnJ6Nbj4pU1EVsCr9KUsY8nCEb+1EjKTepNOInL8XsUSHclQm+lgCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741687177; c=relaxed/simple;
	bh=F2T6z1vN60pbgtGH7+1sK79NNUrZavThI+5+vbxmbFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nmGxhlDNS7zY5qUA99amdXidZg8o1VIS6AejlkOeulvvI/gw7FD8wfgFVqQKFEpF7kLt8+GXFVPuJ0it9qJhZA4NiuoylGcppVwkwc6gIvnLi7llDgRWStLRyJcEvFE5JaDvCg9H0Q+TQMeX5I6VbVJoXjiAdFC6AX+nAw9t6MI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=El+YIluG; arc=fail smtp.client-ip=40.107.93.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UIsjsCddTZ+/FR4vWTyOO+zwFoN4iS5prr2f9KKGlBpboT1hkSoaCD2Wi05ozfXJ7s43YeXGezaWQpEjT7GM5Agmf3gtMSJhopJBjl3eYgLo5Z4LoVV0/br7k/KJcjmyZd/uTc7vbeF7kEnri73TrcMGfPl739lld0TxkdiUhFx26sGc0YotD3/4PI6d1jxv6R3g/gkB7+tVZxV92ZnTAGNkJrErQOQkoMqYyC5JqA7cPrHaiEpZAz4F4oawW7UJAWmaS7tS3ktzGo+tBlRQK6yWuTVv6Uc+jcRdKpmHwmEb5fZghQd36lEn8CLxiodjq0XRs7e+MTm1ZiHTHvlcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBmY91bjvy5fhc3pS+WJjs660hy8kbmA9yvr7+A9M24=;
 b=Xdjv/fHun2uXax5p+F/SGWkz4oE/TFZxZ7c8cujJ09QkNWkqWrTQEwpa4kb5ZYZG/NOoV+rHzwnd0prW/hFYqpaZG4ZSxb2tq2JvGDV/xE7lbzdyGFi0oRwSCzdp3XII/SR68kfPVB2hVg1c87HjyGc1+1ar8YQkz8jB6ObR+ptevf+yu/Gn1PsdRFxAetVFN/rfDsxG7ZWymSyLgdi4s2wbpKgIppsZjleJ6LIl/TchrlhcckICnmFUd4E/kL/z13LHZpurtKVCaZlX2GLVW+RA48QI4GC0r5y2E+wmULvo4/+55DOUPQrRYwrL0EiLZz6N94MCKnsmM2EOn+Unsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBmY91bjvy5fhc3pS+WJjs660hy8kbmA9yvr7+A9M24=;
 b=El+YIluGZKCRXOcKBRi4O8Av/lh5pZwpb+OOthROOfoL+SBz2qRoLzNdZyiF6xW8xrtdqIkLNZio4Hi54izZp8TT2Hqd7OeeOr+KDDTr4ZNrA4CJYMeuvBKqaHlmTJ+InB6tUmvtq6A+TvfCJ6xF/XgGDTYOQ4JSrtnyMuvi0sSgCGKS8ccDglaZhSWgLMaHUdvJq46VqW5yOgIIwBuZJh7MHXGxqHgTjFz1t2/1xc35DVinRzpl3bKI2tweCvg9pzy2nNVGNc5tkRhWaMjHJ+BpS3Mkjf4z8cvLqNRJFEjGdwGNpEbA5zbJJk5exkrXeR7A8e9yja7Uv0Uy1khzqg==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:59:30 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:59:30 +0000
From: <Shravan.Chippa@microchip.com>
To: <sakari.ailus@linux.intel.com>
CC: <laurent.pinchart@ideasonboard.com>, <tarang.raval@siliconsignals.io>,
	<kieran.bingham@ideasonboard.com>, <mchehab@kernel.org>,
	<hverkuil@xs4all.nl>, <umang.jain@ideasonboard.com>, <zhi.mao@mediatek.com>,
	<julien.massot@collabora.com>, <mike.rudenko@gmail.com>,
	<benjamin.mugnier@foss.st.com>, <linux-media@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Topic: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Index: AQHbkYzfwHtJybarVUKBrRCLzZBD/LNtdLwAgAAIqICAAAM1IIAAMT0AgAABw5A=
Date: Tue, 11 Mar 2025 09:59:30 +0000
Message-ID:
 <PH0PR11MB56117EBAD3A022E6E89B0F4981D12@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-3-tarang.raval@siliconsignals.io>
 <PH0PR11MB5611A568DC879D4206FDE76681D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <20250311063849.GB29331@pendragon.ideasonboard.com>
 <PH0PR11MB5611257EF7BF21EA7617008881D12@PH0PR11MB5611.namprd11.prod.outlook.com>
 <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
In-Reply-To: <Z9AGeIA-207RuGQ0@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CH3PR11MB8707:EE_
x-ms-office365-filtering-correlation-id: c979d8f4-5d27-4472-595d-08dd60836aca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vYaFet8kj6HGcxrb0suN1mpAFYiNVD2ZtDEBH1IGIY70ql3ASifnSc3+sNcQ?=
 =?us-ascii?Q?/H0fepIPBwOsBci8xqORJqC5SxD34Fv5E+woPJMVA31srdtBQdNplh+Gzh5a?=
 =?us-ascii?Q?Xb0XIaIb3jx57OCMyqSwHsPAj5VHr5LCy0yqsWLkmfqsX03hLoEpCwGF4at5?=
 =?us-ascii?Q?O3mHjOEjxc2cIizv3lw9cCAxvf+812qNjM5ulqsYDPkuSHtqILFOY2ff6t05?=
 =?us-ascii?Q?TZuGMHa6iaaXI6sKdMvaJrZ6Plj8hAB1F30nMwREigpsaTu2uKGe8KfUuuOR?=
 =?us-ascii?Q?f7VvycH+l/lk82VnNtlqCjulAe2woQHu22Y6MC2ykDZ1kmwa9aYuyooK155I?=
 =?us-ascii?Q?YNcKjVKCaNVDbeBi05XufVG7oWE8cn1kYLf2ZTNdtJklKlFu2Ubl2AKCy+rf?=
 =?us-ascii?Q?H18/QWb8rNq5l31B0SW23ev+/fbc7I74WQqp11WT3E2+GGhOhKO/9mFFFdxG?=
 =?us-ascii?Q?v54Tu5uFEqM7o38NMuvQ5Ek6/kqeY3LJN8crA8tYYExfi9GnqeiE14iXt39X?=
 =?us-ascii?Q?Xh3lSa1wppy6QAodZgGDHU9rb2IC6BN+sYjK3h8dUQjcmjXezCktxotdKLW2?=
 =?us-ascii?Q?N2UPgHC4m6v4c4VLE3YjVK+0SF89YBd6IHXgZfsfKrBkhokMeseSPWgzwwTh?=
 =?us-ascii?Q?0IZOPw3MBpNetlYRzYnmpJWL+p+3UL9rQj5gjBnZBt1hmmot0dfhxvhAzTr1?=
 =?us-ascii?Q?i34cnGwC4JbSmv42h67ySneG/rkU7U9R1AzI9iYlXGHIt8t7BEE72sJclROY?=
 =?us-ascii?Q?J2PmqnvRgQZQEZW9p+USsbbLEawwkoTAiKRaKV8hejSRuQdXKfU6RM5a8fPC?=
 =?us-ascii?Q?yENIyzJEegImZ2Fzvi7qGlFM9n1jw/Cp1sQm/P8fdyQJx7uWNM60DYkICkxE?=
 =?us-ascii?Q?TVP/Ea3r+Vlqgl08Q18sqw/kJV+PX0Pv3GXycdwefYkJCjuA2d5T3mHtgXPU?=
 =?us-ascii?Q?eqPa751AeB0HkgmhklBzDXgG4Vxx55TnjuDKSlDOFHGBiKCRPFu86thedHdc?=
 =?us-ascii?Q?24iRrakAnNpRUgxW0hCqXPPmMO1Ga25Ely3KqBUABnZAp73yO/CCgIZEpjqT?=
 =?us-ascii?Q?D7xnZUNY4DfQW4Ak+bnyZRL1bvYeI7QiI1OIsrvpPnqdJ69eBgvsAavrfr+v?=
 =?us-ascii?Q?24yPXida5ZA1QmlfdwZbVxsPpMEVB2KVPDYQbUKSfrESU2+YsT+Hd0kmRB/W?=
 =?us-ascii?Q?ErTC1vuG6zIGHjaXvpaXqFsDExzwh5tI9PbE+0ctkZGh1NynNedub9Vs6yOW?=
 =?us-ascii?Q?Je5sgaAZHWcp9ijW/tU9sJTcNDckBn7xFvpWZApy0dcYDHn8BpOIe57eSWvX?=
 =?us-ascii?Q?qbeTsmVd7s/1RZcNXywWwu8DkWkUWsr8SgmXqz/xijpVn77YKNLbJTg7NhK0?=
 =?us-ascii?Q?f1FcNFXoesu04EZkisADg+MZpLA26HZVDAm4ocFIv+zzDjjNzawxROXJVVXG?=
 =?us-ascii?Q?o8xxUZvUNz9OV3Npw6u6V7iLhmcQqTAt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?m8FBv4qWz/btBzN/klYK1HdrdiiVWZdgoX4tEnkL8JTTNe0n9k1vgtanX4P5?=
 =?us-ascii?Q?jDX1r4AnTUKpoyUUWWXNDE3yrOFvOpj8OADYUt6r2h6icqVfCMnRwcLLmUgF?=
 =?us-ascii?Q?X63J4oDbTJwqg+PV30m6hmjMH+0+oZlXNvQVB6s18XkL5IzZtuooT+R8J/wT?=
 =?us-ascii?Q?GTN4fRQpCZ/YfVtS+NPZQ5nEyyxZNv3LRu/Wj/mVj3BkLO7HdFf6xpnbz78A?=
 =?us-ascii?Q?qul4GunbqxTwmMhnigKLslo1iTYSoNF4LiueVNJrt1Ocedzn2gI+qBA2m8EG?=
 =?us-ascii?Q?5Z3WK0frRu9T1npOVGlr+vXZmnZtnPYZFHuZvsOfsbZzhvt9zu8QNryRJL4f?=
 =?us-ascii?Q?q4sGVQj/Gm1FomKfBLdb64O48FbYGa8P50xJd3H9arp6WpAUXiUqYOMCMC+C?=
 =?us-ascii?Q?ZRTaKWUYw98odYo67DKmuko72xgrOIrO1qEpYW6wURRjBlaFCmYrYB2UuiSC?=
 =?us-ascii?Q?q9QiWs5d1Pg4rivscy2YhOWyOyBSkVFQIcoUBVAvRDCzVAiq1zYlEl9k6h6Y?=
 =?us-ascii?Q?BM62U07Y+TvY14dnEoYksOJ0Vy3RACAiUJA9Gno+Lpb2fx3mqaWkyf3Xm+s8?=
 =?us-ascii?Q?9TPKCXRPwuZeXLuIn6A/CSgoqd82EPr887+3lQtAqIWt+rcM/pk4dJ7PWR2C?=
 =?us-ascii?Q?e7EPpkFG4EdnbEYNBzpPP9UyozqSMQQan/4gN61Ac7SfCIDuOt+uvTUKS1e6?=
 =?us-ascii?Q?856aFikkFAdxEC1PDzj+VJTRWqzJZ1MiKzDu0lgbgJiDN23sItlzyssgLzmb?=
 =?us-ascii?Q?kL2Y/XshPFwOtrFfFAuWcn2helKAHXuMZprqcb2oDrLMRMF6znwGEx4LSVxR?=
 =?us-ascii?Q?a5Xwbe+mjT/RhVXjqDDRxsJALqES2+deJV9zlKwkIBJiP3QKmLaq/chSCeqM?=
 =?us-ascii?Q?iVkaFp8uKsVCN5frN89DFmbIpdvgvv3R4xCNsU+VpiUDKosNl/fONg+gbs1j?=
 =?us-ascii?Q?JT6rwPLOaU6hhPaN5fE3P8dcPTD7dxWi+tFmNl1T1CQFuy0mg2OHJxlF0/zH?=
 =?us-ascii?Q?9FMe+5R31so5oO0BlHYT7k3qG2UMklW5pDoyh/tdLzbK2TFduxqgC3anpUjk?=
 =?us-ascii?Q?Qg4DFEa96hE5FTdziIyXGH4Ij0xqQTiTN8iHFFq0Hz4Rqt+d+l13V6TkTa6f?=
 =?us-ascii?Q?FbF+ieSVj6o5KiXqKaQlFbzmQUZZyhFuIhUjVj0idSwD/CpR/YgcBkkIMKuJ?=
 =?us-ascii?Q?PqPBFfz7g4Q0a6mK5VfU2ptriTsayJnqp7quIo1uX3o3ucUdBL2Jj97yfnJD?=
 =?us-ascii?Q?8TGS00afbPg6/VCjeDODkaHWv1SA4rdhffrHflFBfriMIZlU0N3lSCCHhb1C?=
 =?us-ascii?Q?xFhovNVw4iHNRiayD7xeE2jv2OSuP6F1+Z88xLgGmTCHc2QRwGCm4yM/DyQ4?=
 =?us-ascii?Q?ZdbiLwVITmpPbWdt3p5ny8g52OFutfcI63yNxymfL6CQ7FV9jLiGEN4yzc2x?=
 =?us-ascii?Q?7zS9Uc3aAGpSOp7e0yQIpwtcyDj2n0vSGt8aIVCYnqWbDdpsfyQm5+a8xpcc?=
 =?us-ascii?Q?kEvJuuSzr0qomgxprwWc7dKDHo6QVfXaCmRIasJPk42a7diuBRLFgdSPXuG9?=
 =?us-ascii?Q?pKDyEMhzH+n5YnTxz6yGuTJCV/zqNAyE4ZKofzqYDwrGAd9JazV9t3ewFuQ+?=
 =?us-ascii?Q?wQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c979d8f4-5d27-4472-595d-08dd60836aca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 09:59:30.4993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuGKoRUGrxK0FDf64gTur61T+6tgNb4uaohbDTBySJkN4T/YqjX3VDaiq9XN4ZuoRWFkh7/ACy/oJqlcWsPDvYPVrcb+BXvGKOqelR0W18s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707

Hi Sakari ,

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Tuesday, March 11, 2025 3:17 PM
> To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> Cc: laurent.pinchart@ideasonboard.com; tarang.raval@siliconsignals.io;
> kieran.bingham@ideasonboard.com; mchehab@kernel.org;
> hverkuil@xs4all.nl; umang.jain@ideasonboard.com; zhi.mao@mediatek.com;
> julien.massot@collabora.com; mike.rudenko@gmail.com;
> benjamin.mugnier@foss.st.com; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register acce=
ss
> helpers
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Hi Shravan, Tarang,
>=20
> On Tue, Mar 11, 2025 at 06:51:48AM +0000, Shravan.Chippa@microchip.com
> wrote:
> > Hi Laurent,
> >
> > > -----Original Message-----
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Sent: Tuesday, March 11, 2025 12:09 PM
> > > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > > Cc: tarang.raval@siliconsignals.io; sakari.ailus@linux.intel.com;
> > > kieran.bingham@ideasonboard.com; mchehab@kernel.org;
> > > hverkuil@xs4all.nl; umang.jain@ideasonboard.com;
> > > zhi.mao@mediatek.com; julien.massot@collabora.com;
> > > mike.rudenko@gmail.com; benjamin.mugnier@foss.st.com;
> > > linux-media@vger.kernel.org; linux- kernel@vger.kernel.org
> > > Subject: Re: [PATCH 2/6] media: i2c: imx334: Convert to CCI register
> > > access helpers
> > >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the content is safe
> > >
> > > Hi Shravan,
> > >
> > > On Tue, Mar 11, 2025 at 06:14:28AM +0000,
> > > Shravan.Chippa@microchip.com
> > > wrote:
> > > > Hi Tarang,
> > > >
> > > > Thanks for the patch series with CCI register access helpers on
> > > > top of my patches I have tested (1080p,720p, 480p resolution only)
> > > > and working on my board with small PLL changes to make it
> > > > compatible with pfsoc board (mpfs-video-kit).
> > >
> > > Could you please provide more information about what those PLL
> > > changes are ?
> >
> > Here is the change for mpfs-video-kit board.
> >
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index 375367314416..30470dbd1f3c 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -236,9 +236,9 @@ static const struct cci_reg_sequence
> common_mode_regs[] =3D {
> >         { IMX334_REG_XVS_XHS_OUTSEL, 0x20},
> >         { IMX334_REG_XVS_XHS_DRV, 0x0f},
> >         { IMX334_REG_BCWAIT_TIME, 0x3b},
> > -       { IMX334_REG_CPWAIT_TIME, 0x2a},
> > +       { IMX334_REG_CPWAIT_TIME, 0x29},
>=20
> A patch converting the driver to use V4L2 CCI / human-readable register
> names should not change the values written.
>=20
> This change is exactly the same than your 2nd patch does. It'd be good to
> understand why it is different and what is effect of that difference.
>=20
> >         { IMX334_REG_INCKSEL1, 0x0129},
> > -       { IMX334_REG_INCKSEL2, 0x06},
> > +       { IMX334_REG_INCKSEL2, 0x0a},
>=20
> This is a bigger change indeed.
>=20
> >         { IMX334_REG_INCKSEL3, 0xa0},
> >         { IMX334_REG_INCKSEL4, 0x7e},
> >         { IMX334_REG_SYS_MODE, 0x02},

Whatever I have send is as per the data sheet. This should work on other bo=
ard

As per my understanding these changes are pfsoc mpfs-video-kit specific.
The video pipeline is not able to process the data very fast, this change w=
ill make=20
incoming stream little slow, so that video pipeline will not hang.

Thanks,
Shravan
>=20
> --
> Regards,
>=20
> Sakari Ailus

