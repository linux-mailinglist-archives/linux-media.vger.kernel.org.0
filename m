Return-Path: <linux-media+bounces-27992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AABEAA5B90E
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 07:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DA423B03BA
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 06:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1FA1EE7A1;
	Tue, 11 Mar 2025 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aFzjR3o6"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5881E1A05;
	Tue, 11 Mar 2025 06:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741673674; cv=fail; b=O/UTUv/O9RuCKrJU0DsNGOLi7El12y/FDxnRPsD/XluIa39/8fciJXL8ClQwcrgCL3Na7994sQIH2/xP6t7vBlSteSLbOQU1Jm6CnZGzbyrbTUK5YAhpsv2guUUVbovkMrUvcuzBFi9B0UOOwjaElvuAWPA7M669pw5OMXuZ/pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741673674; c=relaxed/simple;
	bh=bMWjNJc6W1kEvfk9QOv60hUaZHMHjPPFjCD41WeEBhs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J3XcYK4XFkwyexYP5OidWLZm5IK7oR3qvAWLBn2pHNAY83ohdL+MmfhatjBECedp5kjOe2T7eanD1w0UNZXf1J+1HHy24mW1DLmqD+RohuPmnlpIjdLVjJ6dzdWf2FmB7aLi99S6u7yu3Tn5dVMPumAHnMYtyF5ZqrCl2LPG74o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=aFzjR3o6; arc=fail smtp.client-ip=40.107.220.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2n3iM98pr6usvsz0JLzQOxpzy03LOr6Xq+469qRG+7lvy9ucIGU69nwCK5qliznkjThiJdGGmvYLrS+Ud1N74lUrKvYqCFS5lVUSyywrVOImuIcIP0tH0jbjbIVr0EDbZ216EBx8TmRxtJUXdV6EqawpuIPnpXZmu9of39w5AKqmOknz+E7Cf+tn8j2YrEMPQ8jsnSH88O5fEz3ZCUxG7uWP/I1i9TRUsgveuuLxcSp1/mtEmChNhosG/NIfZANy83QNYT4REgM6v0BhQu22l3GJ9Nsfg6jN6CviJwGg0Z7aJgkmRuPUPTol1J3g996Wj8sCCBldtSbbmwHwfNV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R13E0A7N2lRWnFrmUiK3WKiXTQzbIlYRgpw+yYux0I=;
 b=Moqv6PbdpBguJ6O1PIq95errh87nQlnGBRLNzC4EQsAxbIq0Bymndn6HBXU0eKiRCN2WrTh6hZsAFAZcI/+lBt8P5qw+U9xBTyjgTSFPujaVFioba1LXuE7syeAfbXJ/hZ/bnzqghzi6mkAUTxvPblz7YekuOke0DfgRcqgNrzQ4SlY62peYCqgE/u6Bvh9hSQ8kGhbAYAowONpkuLbEuW8kMZryLfxG/y2/vWCM3jWtIWyACtstbbu+wiZBrhcMKRyJsmaeZBu9sg/bDLbQeBHVfzkx/39BgdIScCjHRMdYt1UbnvP2jCi7EUkVwTUqvOxlFXr4n3fl/TbMV2SzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R13E0A7N2lRWnFrmUiK3WKiXTQzbIlYRgpw+yYux0I=;
 b=aFzjR3o6eZkYZ/rzstdAVVZVvhpXj6RsPSYxDnnty4Fi0uRcYKJc4rcuPaG0cA1K3L6zZsAB0iG1jHAXwjwYKVDGb6fwJcX6PJ3+QmcFtjOx/V92UpfSlKD70ctvP6xq4GHuHZnBxXbylJA3BSDoDRpVCnK1tJUe/zlwyP7kNp0xKZEdTNChbI6gy8LnvAFfKygeOZnZb43p2WbVV+G1FXlAmv1TmnTaoKv/pELMRsLoj4gUK6Mo+fJ5WcahNum/KReklIWDFRh8287ixgnKIb/qmnWnYCqgFuOb5LtR/O4laQnGDI0d6S6UnTUU4vl9OFX/S4uPxucIP4O2SUqWlQ==
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CY8PR11MB7083.namprd11.prod.outlook.com (2603:10b6:930:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 06:14:29 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 06:14:28 +0000
From: <Shravan.Chippa@microchip.com>
To: <tarang.raval@siliconsignals.io>, <sakari.ailus@linux.intel.com>,
	<kieran.bingham@ideasonboard.com>
CC: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart@ideasonboard.com>, <umang.jain@ideasonboard.com>,
	<zhi.mao@mediatek.com>, <julien.massot@collabora.com>,
	<mike.rudenko@gmail.com>, <benjamin.mugnier@foss.st.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Topic: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
 helpers
Thread-Index: AQHbkYzfwHtJybarVUKBrRCLzZBD/LNtdLwA
Date: Tue, 11 Mar 2025 06:14:28 +0000
Message-ID:
 <PH0PR11MB5611A568DC879D4206FDE76681D12@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-3-tarang.raval@siliconsignals.io>
In-Reply-To: <20250310071751.151382-3-tarang.raval@siliconsignals.io>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CY8PR11MB7083:EE_
x-ms-office365-filtering-correlation-id: da52eb63-ba34-47fd-87f4-08dd6063fb2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NmuzKaTdEShnnaqZwc2o9Y/BWS9csT6JOM2kXmxmD9djQt+CyrfFujZGAup8?=
 =?us-ascii?Q?RAv7Hk6QBNHzKrLIcUMp+B0iGXRl2y5YA0FpyW8fvfk0cDb1cvuq/H8f1jMC?=
 =?us-ascii?Q?n4hIphkokYcmK98hS7aAwB4mfLZZSunqWBYAJ4IfqrQqESZurToOLjK3EMzJ?=
 =?us-ascii?Q?vFC2HVwqCCsogegIYgsTPfXVbLW1XcswMexGRv72J4Ei93d3Ghfl+Yq0bZ8k?=
 =?us-ascii?Q?O1E4rNarB6PmiO5/jiK7GYVv9/VSSlodoBMo8+Fv7SDEWkKYODI8aCozsFo7?=
 =?us-ascii?Q?Fr5JZ4OoMYA7xxB+aL/UN5VFOg/LepFzkRQ/mOSPOjmTlkIrJlLHk3Ug10ns?=
 =?us-ascii?Q?VAS5111uQvYt0TT/BPSZ7pC0LGrJyc52NSJTbtyCUJpPEznBZZjJokdFvwQK?=
 =?us-ascii?Q?57BUwUvU5HUwK1WcMSyNnYtmWgqiomjYrM7cpTyeoJHqDyYvfvcA2VPiVybH?=
 =?us-ascii?Q?gRRjGUhWLlGstYq3ov5TMmI2iO7nnz3KyOR5U/CJuPDbp416pSB3/SbbZprz?=
 =?us-ascii?Q?7//pwpLBk6JeOfChez8qufJxgzozdtnx8Ol8Vdj+exX26SbsAQ2kL5jwPmAH?=
 =?us-ascii?Q?JH4JQNPhsfvdUnwI/kwSmaDWkE0YvyQPultbUm1C/oafr5jjcjqEmN9HYRR3?=
 =?us-ascii?Q?tkTMIpgpoJNcj76Lxpj5L6OTaJaf3vJEeEm9loLcu/1IcVQGldjbq6sS6IeP?=
 =?us-ascii?Q?h4y+6ZLYfJc4OkAbv8hGIsMBdJqp4NNvIhjLLy8Beyq5idlKVZu5jkEoWxXt?=
 =?us-ascii?Q?a2nRpqcUGKqdOCJuecvZ8mLM2AyavN1ClRv3ki5dkaOatR+qczfZsEVqtAYb?=
 =?us-ascii?Q?WjjtjsFMejktyklXCKkjhZAxEiyZUuGlw89g2fchOTBfxvJEJY9OcWtLJfGh?=
 =?us-ascii?Q?Im8O5lBdvggWRhqk5p+IaOKc9N2aAi0TE9CNoMcl1PTqDV9yvszhmf6FTurO?=
 =?us-ascii?Q?A2ifSQcevuckPDMO5ns8ovYxgmqnScZaOLb9KKpUAvPpG6TMMvjHCY1jG7ea?=
 =?us-ascii?Q?sRgpxnyxDpoCzaJBAr6RXvMKeSgyItgr2xiO7ZOzLWUZXs6O5qXMmebAWhPg?=
 =?us-ascii?Q?h/5ep5CkuH4BoZ6wqghu7WAVMV8X5r8Z/OFCeRpyrMhFyi2M9PQ5Xjs+LrSF?=
 =?us-ascii?Q?qpVjPghJY+JdCeww1hGPQZxEBbvbPEWVjo9zD6WKW4hNJLuJiw4qucCdHaE+?=
 =?us-ascii?Q?RbXRyNUZA2IoOQlIqlizM5KdEaukPQ+5CmMZXneBmH15kloAMG/cVyvbEiSi?=
 =?us-ascii?Q?bNBDSkucnqdRaiIy+FvrcddGGdcDB0VjXvESJLn8jLV3hk9LZT4peF9drSPy?=
 =?us-ascii?Q?MvEnxa9v9zzORY38jKiMfphuAkHBYtFacf+7liakpB4lU73wMSIZRSYGHc0G?=
 =?us-ascii?Q?T5T/nMDOltKA177E4ZcRvj3mZRH9zcAnedNb2OwKRhyvhzhhyD/cndpuvYaK?=
 =?us-ascii?Q?9o/amVGjBE5sqDg4w6Yk7DvLYaZ3bNIp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?slAlS5t6UGdvq77Oyp0H+UaPNS90EuGKk6Csb4QPc254U+Aw35iBHhtbTd5l?=
 =?us-ascii?Q?Velo8dYT4WPMaV12XmaDImD7QltjUuSoChTPvvWKSvALkglvl20WE82u47A4?=
 =?us-ascii?Q?3XRFWwvSZ3V5ccDMB4gZyz+Jbo6xUzOjW7/PAygKh4370oI+NIyyN3004OWX?=
 =?us-ascii?Q?K/hTzdxg8RzqXaT5uOMtrJ+68W7lfsYYSqwB+HYtQJtOXXaPVoCA+Fjo2wai?=
 =?us-ascii?Q?9e1eZYtEZwUSLJ0EeMed5U0XWdEcGEVSx2rkxTURXeQ5FKgd8mDz+p8B/8G8?=
 =?us-ascii?Q?ZCGfMdbcUEcOsZeVC4lOcB8n9/LwRYvxQFWHUv0PToyQw2dSzMUigt0zdbBj?=
 =?us-ascii?Q?Volo4o6As5qaPxMjE63/b3r+82b7OusuOfa0hItEqAEBqsEehhEsII9e3xEe?=
 =?us-ascii?Q?F4ZrD/c8GfzYsnXeuLp4HNxcA/aJTdczI3WAMJr3GlhSyGfaGfxoIex6CRlo?=
 =?us-ascii?Q?TUGnji5fg+Ao1t5KFp18zcte7QUpF7LiVwe1gWtoVuxnp1UAL/Fi0WlMcYks?=
 =?us-ascii?Q?1r9slgfL/s8UiAy8CcM5HWimz4CfcUXALWpiLinToNcVVGxgBzC060vHr0Bz?=
 =?us-ascii?Q?63AO0+vnV1YMDRYg+iGQrD6j+RNLOH8pzUgg0Z9betzocFn67+fjVsesCh+W?=
 =?us-ascii?Q?3WEMsULzA/Rw6THZDaGJd+oKt/gHAcFZIe2N0ZrEwROiJbq7P0VEUDU7Jmej?=
 =?us-ascii?Q?wQ2oEtpijucbMK4p09LNhsny6uw5zv2YRlmb60RveaUgsWgNXGMwb+ZbYEgO?=
 =?us-ascii?Q?yaookYb2fgXmvc9lfxbZ6T3fr8VzxrZn7+SnEYYgHdQ7zyq9jeBjkDx73vEN?=
 =?us-ascii?Q?EW+WqbShMINfbq9pwtwY/9f1WprMYLHEFg36c4P8t9W8YOewdSM6RKe2jCzH?=
 =?us-ascii?Q?ybix3j2GVYfenYYU98ZGI7I6jL4xYugooFsJ4llM6mBakkRfoZU61QOwMQWZ?=
 =?us-ascii?Q?h/h9Jtg+lFdjeVqfNCQ6pzNXAW5yftFpY38i2gwds3mbAjeOMASWiIinOTw6?=
 =?us-ascii?Q?B5WO5qtAc1kWmRqiJ4ZxjFyBUb9FqST7uu6pcDBLy+Ezw/gtzU8+I1WxWWDx?=
 =?us-ascii?Q?c1SMTb1eHDDrOs+N1Uh5mpayrMxks4i93zQV2BRIwxm8ocLWnY85DiiFJeNq?=
 =?us-ascii?Q?XLKkhkEqueAW02uWZmzwrpLFD7+i/yAS7bge58noqdYg/lf7EoR9j/5Y99GB?=
 =?us-ascii?Q?loro1s5B1/k91XSlAEuXHfJkWQKfaIl0P/BHP54bYZ+eEM7pRtXflKWqeUuY?=
 =?us-ascii?Q?9BbWYujPDd55LsVIsy0I2IwciXQB3KKYSHP+tkviKoX8Wgq69fCkkcWRzVJf?=
 =?us-ascii?Q?24uhMHGMdT0VIUk7mqZab+iHjK678B2GLeaVuuBL1cW7IMWGYMoPbSlMCdcI?=
 =?us-ascii?Q?kyK0FsCs/lj4+qziA9Uiw+j1fHDFt2yf3V5PLytnZrG0wDuys/w1JvRH6rPd?=
 =?us-ascii?Q?49ZYuhZ25RrowT6vNKI9PNMVIx86lHGtTEDDFXOlJrrw2E5LjjqhCsau4hZG?=
 =?us-ascii?Q?u/68HZd8YhB4stjQWCvR7OBc9fQiRXCCMQViXf4Gp7iXzKWbsrLCCU7vTDON?=
 =?us-ascii?Q?jsHWOzPdOBLwvFCjwOPalSW1c9unJS50jqbO7H7YaKyGpSWV5kaqJsAi6jV+?=
 =?us-ascii?Q?iw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da52eb63-ba34-47fd-87f4-08dd6063fb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 06:14:28.8267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 459EtKwP/Zq9gOq5HxJbk1oy6Q5aCg1rtcu5a4kdRbzgizZ+vguTvfXVRrLZvqy8OxCHmkAZNBr4pA/p1vIvaN8sDGF7eHhYDA9h3VhjR1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7083

Hi Tarang,=20

Thanks for the patch series with CCI register access helpers on top of my p=
atches
I have tested (1080p,720p, 480p resolution only) and working on my board wi=
th small PLL changes to make it compatible with pfsoc board (mpfs-video-kit=
).

Acked-by: Shravan.Chippa@microchip.com

Thanks,
Shravan

> -----Original Message-----
> From: Tarang Raval <tarang.raval@siliconsignals.io>
> Sent: Monday, March 10, 2025 12:48 PM
> To: sakari.ailus@linux.intel.com; kieran.bingham@ideasonboard.com
> Cc: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>; Tarang Raval
> <tarang.raval@siliconsignals.io>; Mauro Carvalho Chehab
> <mchehab@kernel.org>; Hans Verkuil <hverkuil@xs4all.nl>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Umang Jain
> <umang.jain@ideasonboard.com>; Zhi Mao <zhi.mao@mediatek.com>; Julien
> Massot <julien.massot@collabora.com>; Mikhail Rudenko
> <mike.rudenko@gmail.com>; Benjamin Mugnier
> <benjamin.mugnier@foss.st.com>; linux-media@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH 2/6] media: i2c: imx334: Convert to CCI register access
> helpers
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e
> content is safe
>=20
> Use the new common CCI register access helpers to replace the private
> register access helpers in the imx334 driver. This simplifies the driver =
by
> reducing the amount of code.
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/Kconfig  |   1 +
>  drivers/media/i2c/imx334.c | 698 ++++++++++++++++---------------------
>  2 files changed, 295 insertions(+), 404 deletions(-)
>=20
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig index
> 85ecb2aeefdb..c8138c1079fd 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -217,6 +217,7 @@ config VIDEO_IMX319
>  config VIDEO_IMX334
>         tristate "Sony IMX334 sensor support"
>         depends on OF_GPIO
> +       select V4L2_CCI_I2C
>         help
>           This is a Video4Linux2 sensor driver for the Sony
>           IMX334 camera.
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c inde=
x
> ad0b03a3f573..1fed03494813 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -12,42 +12,98 @@
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>=20
> +#include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>=20
>  /* Streaming Mode */
> -#define IMX334_REG_MODE_SELECT 0x3000
> +#define IMX334_REG_MODE_SELECT CCI_REG8(0x3000)
>  #define IMX334_MODE_STANDBY    0x01
>  #define IMX334_MODE_STREAMING  0x00
>=20
>  /* Lines per frame */
> -#define IMX334_REG_LPFR                0x3030
> +#define IMX334_REG_VMAX         CCI_REG24_LE(0x3030)
> +
> +#define IMX334_REG_HMAX         CCI_REG16_LE(0x3034)
> +
> +#define IMX334_REG_OPB_SIZE_V          CCI_REG8(0x304c)
> +#define IMX334_REG_ADBIT               CCI_REG8(0x3050)
> +#define IMX334_REG_MDBIT               CCI_REG8(0x319d)
> +#define IMX334_REG_ADBIT1              CCI_REG16_LE(0x341c)
> +#define IMX334_REG_Y_OUT_SIZE          CCI_REG16_LE(0x3308)
> +#define IMX334_REG_XVS_XHS_OUTSEL      CCI_REG8(0x31a0)
> +#define IMX334_REG_XVS_XHS_DRV         CCI_REG8(0x31a1)
>=20
>  /* Chip ID */
> -#define IMX334_REG_ID          0x3044
> +#define IMX334_REG_ID          CCI_REG8(0x3044)
>  #define IMX334_ID              0x1e
>=20
>  /* Exposure control */
> -#define IMX334_REG_SHUTTER     0x3058
> +#define IMX334_REG_SHUTTER     CCI_REG24_LE(0x3058)
>  #define IMX334_EXPOSURE_MIN    1
>  #define IMX334_EXPOSURE_OFFSET 5
>  #define IMX334_EXPOSURE_STEP   1
>  #define IMX334_EXPOSURE_DEFAULT        0x0648
>=20
> +#define IMX334_REG_LANEMODE            CCI_REG8(0x3a01)
> +
> +/* Window cropping Settings */
> +#define IMX334_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
> +#define IMX334_REG_AREA3_ST_ADR_2      CCI_REG16_LE(0x308e)
> +#define IMX334_REG_UNREAD_PARAM5       CCI_REG16_LE(0x30b6)
> +#define IMX334_REG_AREA3_WIDTH_1       CCI_REG16_LE(0x3076)
> +#define IMX334_REG_AREA3_WIDTH_2       CCI_REG16_LE(0x3090)
> +#define IMX334_REG_BLACK_OFSET_ADR     CCI_REG16_LE(0x30c6)
> +#define IMX334_REG_UNRD_LINE_MAX       CCI_REG16_LE(0x30ce)
> +#define IMX334_REG_UNREAD_ED_ADR       CCI_REG16_LE(0x30d8)
> +#define IMX334_REG_UNREAD_PARAM6       CCI_REG16_LE(0x3116)
> +
> +#define IMX334_REG_VREVERSE            CCI_REG8(0x304f)
> +#define IMX334_REG_HREVERSE            CCI_REG8(0x304e)
> +
> +/* Binning Settings */
> +#define IMX334_REG_HADD_VADD           CCI_REG8(0x3199)
> +#define IMX334_REG_VALID_EXPAND        CCI_REG8(0x31dd)
> +#define IMX334_REG_TCYCLE              CCI_REG8(0x3300)
> +
>  /* Analog gain control */
> -#define IMX334_REG_AGAIN       0x30e8
> +#define IMX334_REG_AGAIN       CCI_REG16_LE(0x30e8)
>  #define IMX334_AGAIN_MIN       0
>  #define IMX334_AGAIN_MAX       240
>  #define IMX334_AGAIN_STEP      1
>  #define IMX334_AGAIN_DEFAULT   0
>=20
>  /* Group hold register */
> -#define IMX334_REG_HOLD                0x3001
> +#define IMX334_REG_HOLD                CCI_REG8(0x3001)
> +
> +#define IMX334_REG_MASTER_MODE         CCI_REG8(0x3002)
> +#define IMX334_REG_WINMODE             CCI_REG8(0x3018)
> +#define IMX334_REG_HTRIMMING_START     CCI_REG16_LE(0x302c)
> +#define IMX334_REG_HNUM                CCI_REG16_LE(0x302e)
>=20
>  /* Input clock rate */
>  #define IMX334_INCLK_RATE      24000000
>=20
> +/* INCK Setting Register */
> +#define IMX334_REG_BCWAIT_TIME         CCI_REG8(0x300c)
> +#define IMX334_REG_CPWAIT_TIME         CCI_REG8(0x300d)
> +#define IMX334_REG_INCKSEL1            CCI_REG16_LE(0x314c)
> +#define IMX334_REG_INCKSEL2            CCI_REG8(0x315a)
> +#define IMX334_REG_INCKSEL3            CCI_REG8(0x3168)
> +#define IMX334_REG_INCKSEL4            CCI_REG8(0x316a)
> +#define IMX334_REG_SYS_MODE            CCI_REG8(0x319e)
> +
> +#define IMX334_REG_TCLKPOST            CCI_REG16_LE(0x3a18)
> +#define IMX334_REG_TCLKPREPARE         CCI_REG16_LE(0x3a1a)
> +#define IMX334_REG_TCLKTRAIL           CCI_REG16_LE(0x3a1c)
> +#define IMX334_REG_TCLKZERO            CCI_REG16_LE(0x3a1e)
> +#define IMX334_REG_THSPREPARE          CCI_REG16_LE(0x3a20)
> +#define IMX334_REG_THSZERO             CCI_REG16_LE(0x3a22)
> +#define IMX334_REG_THSTRAIL            CCI_REG16_LE(0x3a24)
> +#define IMX334_REG_THSEXIT             CCI_REG16_LE(0x3a26)
> +#define IMX334_REG_TPLX                CCI_REG16_LE(0x3a28)
> +
>  /* CSI2 HW configuration */
>  #define IMX334_LINK_FREQ_891M  891000000  #define
> IMX334_LINK_FREQ_445M  445500000 @@ -57,32 +113,22 @@
>  #define IMX334_REG_MAX         0xfffff
>=20
>  /* Test Pattern Control */
> -#define IMX334_REG_TP          0x329e
> +#define IMX334_REG_TP          CCI_REG8(0x329e)
>  #define IMX334_TP_COLOR_HBARS  0xA
>  #define IMX334_TP_COLOR_VBARS  0xB
>=20
> -#define IMX334_TPG_EN_DOUT     0x329c
> +#define IMX334_TPG_EN_DOUT     CCI_REG8(0x329c)
>  #define IMX334_TP_ENABLE       0x1
>  #define IMX334_TP_DISABLE      0x0
>=20
> -#define IMX334_TPG_COLORW      0x32a0
> +#define IMX334_TPG_COLORW      CCI_REG8(0x32a0)
>  #define IMX334_TPG_COLORW_120P 0x13
>=20
> -#define IMX334_TP_CLK_EN       0x3148
> +#define IMX334_TP_CLK_EN       CCI_REG8(0x3148)
>  #define IMX334_TP_CLK_EN_VAL   0x10
>  #define IMX334_TP_CLK_DIS_VAL  0x0
>=20
> -#define IMX334_DIG_CLP_MODE    0x3280
> -
> -/**
> - * struct imx334_reg - imx334 sensor register
> - * @address: Register address
> - * @val: Register value
> - */
> -struct imx334_reg {
> -       u16 address;
> -       u8 val;
> -};
> +#define IMX334_DIG_CLP_MODE    CCI_REG8(0x3280)
>=20
>  /**
>   * struct imx334_reg_list - imx334 sensor register list @@ -91,7 +137,7 =
@@
> struct imx334_reg {
>   */
>  struct imx334_reg_list {
>         u32 num_of_regs;
> -       const struct imx334_reg *regs;
> +       const struct cci_reg_sequence *regs;
>  };
>=20
>  /**
> @@ -121,6 +167,7 @@ struct imx334_mode {
>  /**
>   * struct imx334 - imx334 sensor device structure
>   * @dev: Pointer to generic device
> + * @cci: CCI register map
>   * @client: Pointer to i2c client
>   * @sd: V4L2 sub-device
>   * @pad: Media pad. Only one pad supported @@ -141,6 +188,7 @@ struct
> imx334_mode {
>   */
>  struct imx334 {
>         struct device *dev;
> +       struct regmap *cci;
>         struct i2c_client *client;
>         struct v4l2_subdev sd;
>         struct media_pad pad;
> @@ -168,250 +216,191 @@ static const s64 link_freq[] =3D {  };
>=20
>  /* Sensor common mode registers values */ -static const struct imx334_re=
g
> common_mode_regs[] =3D {
> -       {0x3000, 0x01},
> -       {0x3018, 0x04},
> -       {0x3030, 0xca},
> -       {0x3031, 0x08},
> -       {0x3032, 0x00},
> -       {0x3034, 0x4c},
> -       {0x3035, 0x04},
> -       {0x30c6, 0x00},
> -       {0x30c7, 0x00},
> -       {0x30ce, 0x00},
> -       {0x30cf, 0x00},
> -       {0x304c, 0x00},
> -       {0x304e, 0x00},
> -       {0x304f, 0x00},
> -       {0x3050, 0x00},
> -       {0x30b6, 0x00},
> -       {0x30b7, 0x00},
> -       {0x3116, 0x08},
> -       {0x3117, 0x00},
> -       {0x31a0, 0x20},
> -       {0x31a1, 0x0f},
> -       {0x300c, 0x3b},
> -       {0x300d, 0x2a},
> -       {0x314c, 0x29},
> -       {0x314d, 0x01},
> -       {0x315a, 0x06},
> -       {0x3168, 0xa0},
> -       {0x316a, 0x7e},
> -       {0x319e, 0x02},
> -       {0x3199, 0x00},
> -       {0x319d, 0x00},
> -       {0x31dd, 0x03},
> -       {0x3300, 0x00},
> -       {0x341c, 0xff},
> -       {0x341d, 0x01},
> -       {0x3a01, 0x03},
> -       {0x3a18, 0x7f},
> -       {0x3a19, 0x00},
> -       {0x3a1a, 0x37},
> -       {0x3a1b, 0x00},
> -       {0x3a1c, 0x37},
> -       {0x3a1d, 0x00},
> -       {0x3a1e, 0xf7},
> -       {0x3a1f, 0x00},
> -       {0x3a20, 0x3f},
> -       {0x3a21, 0x00},
> -       {0x3a20, 0x6f},
> -       {0x3a21, 0x00},
> -       {0x3a20, 0x3f},
> -       {0x3a21, 0x00},
> -       {0x3a20, 0x5f},
> -       {0x3a21, 0x00},
> -       {0x3a20, 0x2f},
> -       {0x3a21, 0x00},
> -       {0x3078, 0x02},
> -       {0x3079, 0x00},
> -       {0x307a, 0x00},
> -       {0x307b, 0x00},
> -       {0x3080, 0x02},
> -       {0x3081, 0x00},
> -       {0x3082, 0x00},
> -       {0x3083, 0x00},
> -       {0x3088, 0x02},
> -       {0x3094, 0x00},
> -       {0x3095, 0x00},
> -       {0x3096, 0x00},
> -       {0x309b, 0x02},
> -       {0x309c, 0x00},
> -       {0x309d, 0x00},
> -       {0x309e, 0x00},
> -       {0x30a4, 0x00},
> -       {0x30a5, 0x00},
> -       {0x3288, 0x21},
> -       {0x328a, 0x02},
> -       {0x3414, 0x05},
> -       {0x3416, 0x18},
> -       {0x35Ac, 0x0e},
> -       {0x3648, 0x01},
> -       {0x364a, 0x04},
> -       {0x364c, 0x04},
> -       {0x3678, 0x01},
> -       {0x367c, 0x31},
> -       {0x367e, 0x31},
> -       {0x3708, 0x02},
> -       {0x3714, 0x01},
> -       {0x3715, 0x02},
> -       {0x3716, 0x02},
> -       {0x3717, 0x02},
> -       {0x371c, 0x3d},
> -       {0x371d, 0x3f},
> -       {0x372c, 0x00},
> -       {0x372d, 0x00},
> -       {0x372e, 0x46},
> -       {0x372f, 0x00},
> -       {0x3730, 0x89},
> -       {0x3731, 0x00},
> -       {0x3732, 0x08},
> -       {0x3733, 0x01},
> -       {0x3734, 0xfe},
> -       {0x3735, 0x05},
> -       {0x375d, 0x00},
> -       {0x375e, 0x00},
> -       {0x375f, 0x61},
> -       {0x3760, 0x06},
> -       {0x3768, 0x1b},
> -       {0x3769, 0x1b},
> -       {0x376a, 0x1a},
> -       {0x376b, 0x19},
> -       {0x376c, 0x18},
> -       {0x376d, 0x14},
> -       {0x376e, 0x0f},
> -       {0x3776, 0x00},
> -       {0x3777, 0x00},
> -       {0x3778, 0x46},
> -       {0x3779, 0x00},
> -       {0x377a, 0x08},
> -       {0x377b, 0x01},
> -       {0x377c, 0x45},
> -       {0x377d, 0x01},
> -       {0x377e, 0x23},
> -       {0x377f, 0x02},
> -       {0x3780, 0xd9},
> -       {0x3781, 0x03},
> -       {0x3782, 0xf5},
> -       {0x3783, 0x06},
> -       {0x3784, 0xa5},
> -       {0x3788, 0x0f},
> -       {0x378a, 0xd9},
> -       {0x378b, 0x03},
> -       {0x378c, 0xeb},
> -       {0x378d, 0x05},
> -       {0x378e, 0x87},
> -       {0x378f, 0x06},
> -       {0x3790, 0xf5},
> -       {0x3792, 0x43},
> -       {0x3794, 0x7a},
> -       {0x3796, 0xa1},
> -       {0x37b0, 0x37},
> -       {0x3e04, 0x0e},
> -       {0x30e8, 0x50},
> -       {0x30e9, 0x00},
> -       {0x3e04, 0x0e},
> -       {0x3002, 0x00},
> +static const struct cci_reg_sequence common_mode_regs[] =3D {
> +       { IMX334_REG_MODE_SELECT, IMX334_MODE_STANDBY},
> +       { IMX334_REG_WINMODE, 0x04},
> +       { IMX334_REG_VMAX, 0x0008ca},
> +       { IMX334_REG_HMAX, 0x044c},
> +       { IMX334_REG_BLACK_OFSET_ADR, 0x0000},
> +       { IMX334_REG_UNRD_LINE_MAX, 0x0000},
> +       { IMX334_REG_OPB_SIZE_V, 0x00},
> +       { IMX334_REG_HREVERSE, 0x00},
> +       { IMX334_REG_VREVERSE, 0x00},
> +       { IMX334_REG_ADBIT, 0x00},
> +       { IMX334_REG_UNREAD_PARAM5, 0x0000},
> +       { IMX334_REG_UNREAD_PARAM6, 0x0008},
> +       { IMX334_REG_XVS_XHS_OUTSEL, 0x20},
> +       { IMX334_REG_XVS_XHS_DRV, 0x0f},
> +       { IMX334_REG_BCWAIT_TIME, 0x3b},
> +       { IMX334_REG_CPWAIT_TIME, 0x2a},
> +       { IMX334_REG_INCKSEL1, 0x0129},
> +       { IMX334_REG_INCKSEL2, 0x06},
> +       { IMX334_REG_INCKSEL3, 0xa0},
> +       { IMX334_REG_INCKSEL4, 0x7e},
> +       { IMX334_REG_SYS_MODE, 0x02},
> +       { IMX334_REG_HADD_VADD, 0x00},
> +       { IMX334_REG_MDBIT, 0x00},
> +       { IMX334_REG_VALID_EXPAND, 0x03},
> +       { IMX334_REG_TCYCLE, 0x00},
> +       { IMX334_REG_ADBIT1, 0x01ff},
> +       { IMX334_REG_LANEMODE, 0x03},
> +       { IMX334_REG_TCLKPOST, 0x007f},
> +       { IMX334_REG_TCLKPREPARE, 0x0037},
> +       { IMX334_REG_TCLKTRAIL, 0x0037},
> +       { IMX334_REG_TCLKZERO, 0xf7},
> +       { IMX334_REG_THSPREPARE, 0x003f},
> +       { IMX334_REG_THSPREPARE, 0x006f},
> +       { IMX334_REG_THSPREPARE, 0x003f},
> +       { IMX334_REG_THSPREPARE, 0x005f},
> +       { IMX334_REG_THSPREPARE, 0x002f},
> +       { CCI_REG8(0x3078), 0x02},
> +       { CCI_REG8(0x3079), 0x00},
> +       { CCI_REG8(0x307a), 0x00},
> +       { CCI_REG8(0x307b), 0x00},
> +       { CCI_REG8(0x3080), 0x02},
> +       { CCI_REG8(0x3081), 0x00},
> +       { CCI_REG8(0x3082), 0x00},
> +       { CCI_REG8(0x3083), 0x00},
> +       { CCI_REG8(0x3088), 0x02},
> +       { CCI_REG8(0x3094), 0x00},
> +       { CCI_REG8(0x3095), 0x00},
> +       { CCI_REG8(0x3096), 0x00},
> +       { CCI_REG8(0x309b), 0x02},
> +       { CCI_REG8(0x309c), 0x00},
> +       { CCI_REG8(0x309d), 0x00},
> +       { CCI_REG8(0x309e), 0x00},
> +       { CCI_REG8(0x30a4), 0x00},
> +       { CCI_REG8(0x30a5), 0x00},
> +       { CCI_REG8(0x3288), 0x21},
> +       { CCI_REG8(0x328a), 0x02},
> +       { CCI_REG8(0x3414), 0x05},
> +       { CCI_REG8(0x3416), 0x18},
> +       { CCI_REG8(0x35Ac), 0x0e},
> +       { CCI_REG8(0x3648), 0x01},
> +       { CCI_REG8(0x364a), 0x04},
> +       { CCI_REG8(0x364c), 0x04},
> +       { CCI_REG8(0x3678), 0x01},
> +       { CCI_REG8(0x367c), 0x31},
> +       { CCI_REG8(0x367e), 0x31},
> +       { CCI_REG8(0x3708), 0x02},
> +       { CCI_REG8(0x3714), 0x01},
> +       { CCI_REG8(0x3715), 0x02},
> +       { CCI_REG8(0x3716), 0x02},
> +       { CCI_REG8(0x3717), 0x02},
> +       { CCI_REG8(0x371c), 0x3d},
> +       { CCI_REG8(0x371d), 0x3f},
> +       { CCI_REG8(0x372c), 0x00},
> +       { CCI_REG8(0x372d), 0x00},
> +       { CCI_REG8(0x372e), 0x46},
> +       { CCI_REG8(0x372f), 0x00},
> +       { CCI_REG8(0x3730), 0x89},
> +       { CCI_REG8(0x3731), 0x00},
> +       { CCI_REG8(0x3732), 0x08},
> +       { CCI_REG8(0x3733), 0x01},
> +       { CCI_REG8(0x3734), 0xfe},
> +       { CCI_REG8(0x3735), 0x05},
> +       { CCI_REG8(0x375d), 0x00},
> +       { CCI_REG8(0x375e), 0x00},
> +       { CCI_REG8(0x375f), 0x61},
> +       { CCI_REG8(0x3760), 0x06},
> +       { CCI_REG8(0x3768), 0x1b},
> +       { CCI_REG8(0x3769), 0x1b},
> +       { CCI_REG8(0x376a), 0x1a},
> +       { CCI_REG8(0x376b), 0x19},
> +       { CCI_REG8(0x376c), 0x18},
> +       { CCI_REG8(0x376d), 0x14},
> +       { CCI_REG8(0x376e), 0x0f},
> +       { CCI_REG8(0x3776), 0x00},
> +       { CCI_REG8(0x3777), 0x00},
> +       { CCI_REG8(0x3778), 0x46},
> +       { CCI_REG8(0x3779), 0x00},
> +       { CCI_REG8(0x377a), 0x08},
> +       { CCI_REG8(0x377b), 0x01},
> +       { CCI_REG8(0x377c), 0x45},
> +       { CCI_REG8(0x377d), 0x01},
> +       { CCI_REG8(0x377e), 0x23},
> +       { CCI_REG8(0x377f), 0x02},
> +       { CCI_REG8(0x3780), 0xd9},
> +       { CCI_REG8(0x3781), 0x03},
> +       { CCI_REG8(0x3782), 0xf5},
> +       { CCI_REG8(0x3783), 0x06},
> +       { CCI_REG8(0x3784), 0xa5},
> +       { CCI_REG8(0x3788), 0x0f},
> +       { CCI_REG8(0x378a), 0xd9},
> +       { CCI_REG8(0x378b), 0x03},
> +       { CCI_REG8(0x378c), 0xeb},
> +       { CCI_REG8(0x378d), 0x05},
> +       { CCI_REG8(0x378e), 0x87},
> +       { CCI_REG8(0x378f), 0x06},
> +       { CCI_REG8(0x3790), 0xf5},
> +       { CCI_REG8(0x3792), 0x43},
> +       { CCI_REG8(0x3794), 0x7a},
> +       { CCI_REG8(0x3796), 0xa1},
> +       { CCI_REG8(0x37b0), 0x37},
> +       { CCI_REG8(0x3e04), 0x0e},
> +       { IMX334_REG_AGAIN, 0x0050},
> +       { CCI_REG8(0x3e04), 0x0e},
> +       { IMX334_REG_MASTER_MODE, 0x00},
>  };
>=20
>  /* Sensor mode registers for 640x480@30fps */ -static const struct
> imx334_reg mode_640x480_regs[] =3D {
> -       {0x302c, 0x70},
> -       {0x302d, 0x06},
> -       {0x302e, 0x80},
> -       {0x302f, 0x02},
> -       {0x3074, 0x48},
> -       {0x3075, 0x07},
> -       {0x308e, 0x49},
> -       {0x308f, 0x07},
> -       {0x3076, 0xe0},
> -       {0x3077, 0x01},
> -       {0x3090, 0xe0},
> -       {0x3091, 0x01},
> -       {0x3308, 0xe0},
> -       {0x3309, 0x01},
> -       {0x30d8, 0x30},
> -       {0x30d9, 0x0b},
> +static const struct cci_reg_sequence mode_640x480_regs[] =3D {
> +       {IMX334_REG_HTRIMMING_START, 0x0670},
> +       {IMX334_REG_HNUM, 0x0280},
> +       {IMX334_REG_AREA3_ST_ADR_1, 0x0748},
> +       {IMX334_REG_AREA3_ST_ADR_2, 0x0749},
> +       {IMX334_REG_AREA3_WIDTH_1, 0x01e0},
> +       {IMX334_REG_AREA3_WIDTH_2, 0x01e0},
> +       {IMX334_REG_Y_OUT_SIZE, 0x01e0},
> +       {IMX334_REG_UNREAD_ED_ADR, 0x0b30},
>  };
>=20
>  /* Sensor mode registers for 1280x720@30fps */ -static const struct
> imx334_reg mode_1280x720_regs[] =3D {
> -       {0x302c, 0x30},
> -       {0x302d, 0x05},
> -       {0x302e, 0x00},
> -       {0x302f, 0x05},
> -       {0x3074, 0x84},
> -       {0x3075, 0x03},
> -       {0x308e, 0x85},
> -       {0x308f, 0x03},
> -       {0x3076, 0xd0},
> -       {0x3077, 0x02},
> -       {0x3090, 0xd0},
> -       {0x3091, 0x02},
> -       {0x3308, 0xd0},
> -       {0x3309, 0x02},
> -       {0x30d8, 0x30},
> -       {0x30d9, 0x0b},
> +static const struct cci_reg_sequence mode_1280x720_regs[] =3D {
> +       {IMX334_REG_HTRIMMING_START, 0x0530},
> +       {IMX334_REG_HNUM, 0x0500},
> +       {IMX334_REG_AREA3_ST_ADR_1, 0x0384},
> +       {IMX334_REG_AREA3_ST_ADR_2, 0x0385},
> +       {IMX334_REG_AREA3_WIDTH_1, 0x02d0},
> +       {IMX334_REG_AREA3_WIDTH_2, 0x02d0},
> +       {IMX334_REG_Y_OUT_SIZE, 0x02d0},
> +       {IMX334_REG_UNREAD_ED_ADR, 0x0b30},
>  };
>=20
>  /* Sensor mode registers for 1920x1080@30fps */ -static const struct
> imx334_reg mode_1920x1080_regs[] =3D {
> -       {0x302c, 0xf0},
> -       {0x302d, 0x03},
> -       {0x302e, 0x80},
> -       {0x302f, 0x07},
> -       {0x3074, 0xcc},
> -       {0x3075, 0x02},
> -       {0x308e, 0xcd},
> -       {0x308f, 0x02},
> -       {0x3076, 0x38},
> -       {0x3077, 0x04},
> -       {0x3090, 0x38},
> -       {0x3091, 0x04},
> -       {0x3308, 0x38},
> -       {0x3309, 0x04},
> -       {0x30d8, 0x18},
> -       {0x30d9, 0x0a},
> +static const struct cci_reg_sequence mode_1920x1080_regs[] =3D {
> +       {IMX334_REG_HTRIMMING_START, 0x03f0},
> +       {IMX334_REG_HNUM, 0x0780},
> +       {IMX334_REG_AREA3_ST_ADR_1, 0x02cc},
> +       {IMX334_REG_AREA3_ST_ADR_2, 0x02cd},
> +       {IMX334_REG_AREA3_WIDTH_1, 0x0438},
> +       {IMX334_REG_AREA3_WIDTH_2, 0x0438},
> +       {IMX334_REG_Y_OUT_SIZE, 0x0438},
> +       {IMX334_REG_UNREAD_ED_ADR, 0x0a18},
>  };
>=20
>  /* Sensor mode registers for 3840x2160@30fps */ -static const struct
> imx334_reg mode_3840x2160_regs[] =3D {
> -       {0x3034, 0x26},
> -       {0x3035, 0x02},
> -       {0x315a, 0x02},
> -       {0x302c, 0x3c},
> -       {0x302d, 0x00},
> -       {0x302e, 0x00},
> -       {0x302f, 0x0f},
> -       {0x3074, 0xb0},
> -       {0x3075, 0x00},
> -       {0x308e, 0xb1},
> -       {0x308f, 0x00},
> -       {0x30d8, 0x20},
> -       {0x30d9, 0x12},
> -       {0x3076, 0x70},
> -       {0x3077, 0x08},
> -       {0x3090, 0x70},
> -       {0x3091, 0x08},
> -       {0x3308, 0x70},
> -       {0x3309, 0x08},
> -       {0x319e, 0x00},
> -       {0x3a00, 0x01},
> -       {0x3a18, 0xbf},
> -       {0x3a1a, 0x67},
> -       {0x3a1c, 0x6f},
> -       {0x3a1e, 0xd7},
> -       {0x3a1f, 0x01},
> -       {0x3a20, 0x6f},
> -       {0x3a21, 0x00},
> -       {0x3a22, 0xcf},
> -       {0x3a23, 0x00},
> -       {0x3a24, 0x6f},
> -       {0x3a25, 0x00},
> -       {0x3a26, 0xb7},
> -       {0x3a27, 0x00},
> -       {0x3a28, 0x5f},
> -       {0x3a29, 0x00},
> +static const struct cci_reg_sequence mode_3840x2160_regs[] =3D {
> +       {IMX334_REG_HMAX, 0x0226},
> +       {IMX334_REG_INCKSEL2, 0x02},
> +       {IMX334_REG_HTRIMMING_START, 0x003c},
> +       {IMX334_REG_HNUM, 0x0f00},
> +       {IMX334_REG_AREA3_ST_ADR_1, 0x00b0},
> +       {IMX334_REG_AREA3_ST_ADR_2, 0x00b1},
> +       {IMX334_REG_UNREAD_ED_ADR, 0x1220},
> +       {IMX334_REG_AREA3_WIDTH_1, 0x0870},
> +       {IMX334_REG_AREA3_WIDTH_2, 0x0870},
> +       {IMX334_REG_Y_OUT_SIZE, 0x0870},
> +       {IMX334_REG_SYS_MODE, 0x0100},
> +       {IMX334_REG_TCLKPOST, 0x00bf},
> +       {IMX334_REG_TCLKPREPARE, 0x0067},
> +       {IMX334_REG_TCLKTRAIL, 0x006f},
> +       {IMX334_REG_TCLKZERO, 0x1d7},
> +       {IMX334_REG_THSPREPARE, 0x006f},
> +       {IMX334_REG_THSZERO, 0x00cf},
> +       {IMX334_REG_THSTRAIL, 0x006f},
> +       {IMX334_REG_THSEXIT, 0x00b7},
> +       {IMX334_REG_TPLX, 0x005f},
>  };
>=20
>  static const char * const imx334_test_pattern_menu[] =3D { @@ -426,18
> +415,16 @@ static const int imx334_test_pattern_val[] =3D {
>         IMX334_TP_COLOR_VBARS,
>  };
>=20
> -static const struct imx334_reg raw10_framefmt_regs[] =3D {
> -       {0x3050, 0x00},
> -       {0x319d, 0x00},
> -       {0x341c, 0xff},
> -       {0x341d, 0x01},
> +static const struct cci_reg_sequence raw10_framefmt_regs[] =3D {
> +       {IMX334_REG_ADBIT, 0x00},
> +       {IMX334_REG_MDBIT, 0x00},
> +       {IMX334_REG_ADBIT1, 0x01ff},
>  };
>=20
> -static const struct imx334_reg raw12_framefmt_regs[] =3D {
> -       {0x3050, 0x01},
> -       {0x319d, 0x01},
> -       {0x341c, 0x47},
> -       {0x341d, 0x00},
> +static const struct cci_reg_sequence raw12_framefmt_regs[] =3D {
> +       {IMX334_REG_ADBIT, 0x01},
> +       {IMX334_REG_MDBIT, 0x01},
> +       {IMX334_REG_ADBIT1, 0x0047},
>  };
>=20
>  static const u32 imx334_mbus_codes[] =3D { @@ -513,101 +500,6 @@ static
> inline struct imx334 *to_imx334(struct v4l2_subdev *subdev)
>         return container_of(subdev, struct imx334, sd);  }
>=20
> -/**
> - * imx334_read_reg() - Read registers.
> - * @imx334: pointer to imx334 device
> - * @reg: register address
> - * @len: length of bytes to read. Max supported bytes is 4
> - * @val: pointer to register value to be filled.
> - *
> - * Big endian register addresses with little endian values.
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int imx334_read_reg(struct imx334 *imx334, u16 reg, u32 len, u32
> *val) -{
> -       struct i2c_client *client =3D v4l2_get_subdevdata(&imx334->sd);
> -       struct i2c_msg msgs[2] =3D {0};
> -       u8 addr_buf[2] =3D {0};
> -       u8 data_buf[4] =3D {0};
> -       int ret;
> -
> -       if (WARN_ON(len > 4))
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, addr_buf);
> -
> -       /* Write register address */
> -       msgs[0].addr =3D client->addr;
> -       msgs[0].flags =3D 0;
> -       msgs[0].len =3D ARRAY_SIZE(addr_buf);
> -       msgs[0].buf =3D addr_buf;
> -
> -       /* Read data from register */
> -       msgs[1].addr =3D client->addr;
> -       msgs[1].flags =3D I2C_M_RD;
> -       msgs[1].len =3D len;
> -       msgs[1].buf =3D data_buf;
> -
> -       ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
> -       if (ret !=3D ARRAY_SIZE(msgs))
> -               return -EIO;
> -
> -       *val =3D get_unaligned_le32(data_buf);
> -
> -       return 0;
> -}
> -
> -/**
> - * imx334_write_reg() - Write register
> - * @imx334: pointer to imx334 device
> - * @reg: register address
> - * @len: length of bytes. Max supported bytes is 4
> - * @val: register value
> - *
> - * Big endian register addresses with little endian values.
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int imx334_write_reg(struct imx334 *imx334, u16 reg, u32 len, u32=
 val)
> -{
> -       struct i2c_client *client =3D v4l2_get_subdevdata(&imx334->sd);
> -       u8 buf[6] =3D {0};
> -
> -       if (WARN_ON(len > 4))
> -               return -EINVAL;
> -
> -       put_unaligned_be16(reg, buf);
> -       put_unaligned_le32(val, buf + 2);
> -       if (i2c_master_send(client, buf, len + 2) !=3D len + 2)
> -               return -EIO;
> -
> -       return 0;
> -}
> -
> -/**
> - * imx334_write_regs() - Write a list of registers
> - * @imx334: pointer to imx334 device
> - * @regs: list of registers to be written
> - * @len: length of registers array
> - *
> - * Return: 0 if successful, error code otherwise.
> - */
> -static int imx334_write_regs(struct imx334 *imx334,
> -                            const struct imx334_reg *regs, u32 len)
> -{
> -       unsigned int i;
> -       int ret;
> -
> -       for (i =3D 0; i < len; i++) {
> -               ret =3D imx334_write_reg(imx334, regs[i].address, 1, regs=
[i].val);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return 0;
> -}
> -
>  /**
>   * imx334_update_controls() - Update control ranges based on streaming
> mode
>   * @imx334: pointer to imx334 device
> @@ -653,7 +545,7 @@ static int imx334_update_controls(struct imx334
> *imx334,  static int imx334_update_exp_gain(struct imx334 *imx334, u32
> exposure, u32 gain)  {
>         u32 lpfr, shutter;
> -       int ret;
> +       int ret, ret_hold;
>=20
>         lpfr =3D imx334->vblank + imx334->cur_mode->height;
>         shutter =3D lpfr - exposure;
> @@ -661,22 +553,14 @@ static int imx334_update_exp_gain(struct imx334
> *imx334, u32 exposure, u32 gain)
>         dev_dbg(imx334->dev, "Set long exp %u analog gain %u sh0 %u lpfr
> %u\n",
>                 exposure, gain, shutter, lpfr);
>=20
> -       ret =3D imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 1);
> -       if (ret)
> -               return ret;
> -
> -       ret =3D imx334_write_reg(imx334, IMX334_REG_LPFR, 3, lpfr);
> -       if (ret)
> -               goto error_release_group_hold;
> -
> -       ret =3D imx334_write_reg(imx334, IMX334_REG_SHUTTER, 3, shutter);
> -       if (ret)
> -               goto error_release_group_hold;
> -
> -       ret =3D imx334_write_reg(imx334, IMX334_REG_AGAIN, 1, gain);
> +       cci_write(imx334->cci, IMX334_REG_HOLD, 1, &ret);
> +       cci_write(imx334->cci, IMX334_REG_VMAX, lpfr, &ret);
> +       cci_write(imx334->cci, IMX334_REG_SHUTTER, shutter, &ret);
> +       cci_write(imx334->cci, IMX334_REG_AGAIN, gain, &ret);
>=20
> -error_release_group_hold:
> -       imx334_write_reg(imx334, IMX334_REG_HOLD, 1, 0);
> +       ret_hold =3D cci_write(imx334->cci, IMX334_REG_HOLD, 0, NULL);
> +       if (ret_hold)
> +               return ret_hold;
>=20
>         return ret;
>  }
> @@ -740,21 +624,21 @@ static int imx334_set_ctrl(struct v4l2_ctrl *ctrl)
>                 break;
>         case V4L2_CID_TEST_PATTERN:
>                 if (ctrl->val) {
> -                       imx334_write_reg(imx334, IMX334_TP_CLK_EN, 1,
> -                                        IMX334_TP_CLK_EN_VAL);
> -                       imx334_write_reg(imx334, IMX334_DIG_CLP_MODE, 1, =
0x0);
> -                       imx334_write_reg(imx334, IMX334_TPG_COLORW, 1,
> -                                        IMX334_TPG_COLORW_120P);
> -                       imx334_write_reg(imx334, IMX334_REG_TP, 1,
> -                                        imx334_test_pattern_val[ctrl->va=
l]);
> -                       imx334_write_reg(imx334, IMX334_TPG_EN_DOUT, 1,
> -                                        IMX334_TP_ENABLE);
> +                       cci_write(imx334->cci, IMX334_TP_CLK_EN,
> +                                 IMX334_TP_CLK_EN_VAL, NULL);
> +                       cci_write(imx334->cci, IMX334_DIG_CLP_MODE, 0x0, =
NULL);
> +                       cci_write(imx334->cci, IMX334_TPG_COLORW,
> +                                 IMX334_TPG_COLORW_120P, NULL);
> +                       cci_write(imx334->cci, IMX334_REG_TP,
> +                                 imx334_test_pattern_val[ctrl->val], NUL=
L);
> +                       cci_write(imx334->cci, IMX334_TPG_EN_DOUT,
> +                                 IMX334_TP_ENABLE, NULL);
>                 } else {
> -                       imx334_write_reg(imx334, IMX334_DIG_CLP_MODE, 1, =
0x1);
> -                       imx334_write_reg(imx334, IMX334_TP_CLK_EN, 1,
> -                                        IMX334_TP_CLK_DIS_VAL);
> -                       imx334_write_reg(imx334, IMX334_TPG_EN_DOUT, 1,
> -                                        IMX334_TP_DISABLE);
> +                       cci_write(imx334->cci, IMX334_DIG_CLP_MODE, 0x1, =
NULL);
> +                       cci_write(imx334->cci, IMX334_TP_CLK_EN,
> +                                 IMX334_TP_CLK_DIS_VAL, NULL);
> +                       cci_write(imx334->cci, IMX334_TPG_EN_DOUT,
> +                                 IMX334_TP_DISABLE, NULL);
>                 }
>                 ret =3D 0;
>                 break;
> @@ -961,12 +845,13 @@ static int imx334_set_framefmt(struct imx334
> *imx334)  {
>         switch (imx334->cur_code) {
>         case MEDIA_BUS_FMT_SRGGB10_1X10:
> -               return imx334_write_regs(imx334, raw10_framefmt_regs,
> -                                        ARRAY_SIZE(raw10_framefmt_regs))=
;
> +               return cci_multi_reg_write(imx334->cci, raw10_framefmt_re=
gs,
> +                                       ARRAY_SIZE(raw10_framefmt_regs),
> + NULL);
> +
>=20
>         case MEDIA_BUS_FMT_SRGGB12_1X12:
> -               return imx334_write_regs(imx334, raw12_framefmt_regs,
> -                                        ARRAY_SIZE(raw12_framefmt_regs))=
;
> +               return cci_multi_reg_write(imx334->cci, raw12_framefmt_re=
gs,
> +                                       ARRAY_SIZE(raw12_framefmt_regs),
> + NULL);
>         }
>=20
>         return -EINVAL;
> @@ -983,8 +868,8 @@ static int imx334_start_streaming(struct imx334
> *imx334)
>         const struct imx334_reg_list *reg_list;
>         int ret;
>=20
> -       ret =3D imx334_write_regs(imx334, common_mode_regs,
> -                               ARRAY_SIZE(common_mode_regs));
> +       ret =3D cci_multi_reg_write(imx334->cci, common_mode_regs,
> +                                 ARRAY_SIZE(common_mode_regs), NULL);
>         if (ret) {
>                 dev_err(imx334->dev, "fail to write common registers\n");
>                 return ret;
> @@ -992,8 +877,8 @@ static int imx334_start_streaming(struct imx334
> *imx334)
>=20
>         /* Write sensor mode registers */
>         reg_list =3D &imx334->cur_mode->reg_list;
> -       ret =3D imx334_write_regs(imx334, reg_list->regs,
> -                               reg_list->num_of_regs);
> +       ret =3D cci_multi_reg_write(imx334->cci, reg_list->regs,
> +                                 reg_list->num_of_regs, NULL);
>         if (ret) {
>                 dev_err(imx334->dev, "fail to write initial registers\n")=
;
>                 return ret;
> @@ -1014,8 +899,8 @@ static int imx334_start_streaming(struct imx334
> *imx334)
>         }
>=20
>         /* Start streaming */
> -       ret =3D imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
> -                              1, IMX334_MODE_STREAMING);
> +       ret =3D cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
> +                       IMX334_MODE_STREAMING, NULL);
>         if (ret) {
>                 dev_err(imx334->dev, "fail to start streaming\n");
>                 return ret;
> @@ -1032,8 +917,8 @@ static int imx334_start_streaming(struct imx334
> *imx334)
>   */
>  static int imx334_stop_streaming(struct imx334 *imx334)  {
> -       return imx334_write_reg(imx334, IMX334_REG_MODE_SELECT,
> -                               1, IMX334_MODE_STANDBY);
> +       return cci_write(imx334->cci, IMX334_REG_MODE_SELECT,
> +                       IMX334_MODE_STANDBY, NULL);
>  }
>=20
>  /**
> @@ -1084,14 +969,14 @@ static int imx334_set_stream(struct v4l2_subdev
> *sd, int enable)  static int imx334_detect(struct imx334 *imx334)  {
>         int ret;
> -       u32 val;
> +       u64 val;
>=20
> -       ret =3D imx334_read_reg(imx334, IMX334_REG_ID, 2, &val);
> +       ret =3D cci_read(imx334->cci, IMX334_REG_ID, &val, NULL);
>         if (ret)
>                 return ret;
>=20
>         if (val !=3D IMX334_ID) {
> -               dev_err(imx334->dev, "chip id mismatch: %x!=3D%x\n",
> +               dev_err(imx334->dev, "chip id mismatch: %x!=3D%llx\n",
>                         IMX334_ID, val);
>                 return -ENXIO;
>         }
> @@ -1339,6 +1224,11 @@ static int imx334_probe(struct i2c_client *client)
>                 return -ENOMEM;
>=20
>         imx334->dev =3D &client->dev;
> +       imx334->cci =3D devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx334->cci)) {
> +               dev_err(imx334->dev, "Unable to initialize I2C\n");
> +               return -ENODEV;
> +       }
>=20
>         /* Initialize subdev */
>         v4l2_i2c_subdev_init(&imx334->sd, client, &imx334_subdev_ops);
> --
> 2.34.1


