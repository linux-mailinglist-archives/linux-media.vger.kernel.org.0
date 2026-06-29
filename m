Return-Path: <linux-media+bounces-65982-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AiSOGfOPQmow9wkAu9opvQ
	(envelope-from <linux-media+bounces-65982-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:32:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18346DCB6B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 17:32:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=Pk0ArWek;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65982-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65982-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9262430AA89E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 15:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474773EB115;
	Mon, 29 Jun 2026 15:10:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F33E168B;
	Mon, 29 Jun 2026 15:10:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745857; cv=fail; b=L8ES+HRRQpeobOHf+vVXnh804IMLWVox0xYJPy+Aq82SZZ2WzsoPY95CoG/YNsovTyqKAycq+HiZtL1/qTCWApTyjb1oQuazb+ak6SNEHCZsYIQUJiNOVPdrSSI9s+N7TPYb4flEN+KkIQHD09xjRW4UQIEVtJaSDkMV9mLFtdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745857; c=relaxed/simple;
	bh=QduJgQxqUxAj3RCpWwuwDCTUriSan343FP4sF5DpGtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uJRIhhE8o02AvbPRdWh7Pxaii0DMQPu0U+R3dwHPaXDCsGftrfEp5EfxB58htCoz14tGp2q97liIvH2x+RmlmR+5AS0snYlHo7mXGMkUg0gG1xGK7dNr/M8B5q9fkwKPOiwknv8Mb/kesLjOV5l8+yZoO2vbFdo6GTY/RnTIbes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Pk0ArWek; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUhW6cnzL24cbCpYWiQMghqzNq/CpVcmjHJDnl6LvBiD5vHAIfqaBEwZObxArTs4FnjYM+mS3wn56Q61fb8RFmk7bBhFOByfbAbvgSy/NHi6AVTniE823FHOILUdH5TQsMIqXyKj4uIM41xLJwlnMgef1x8VwOuIc9UdnGevFnIC19bEwQ+bsoYEaOGwrtmX8BOjvzfT78a6hZdaNyxRbOXthbnvTCY++umvDlDR9wdnabU0/Sxu3y1NMLmwr/AyZdy4ag472VxuuQVtGVVWTLxSJMhXYrCZgU+TriqFd00qEDRU2AZPZv9M8Wo0FqA7sLsPqA7lO337+Mk52FNiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDDQbVpOVOskc2PVp7AfDLUF0qTl57ClIgX0lnpBJd4=;
 b=xywr42VSikKTBpbPJImp6gDT3sc5QyBS46EM9a9OWfzzP5rlFWeq78fuD0YiaEmD3BONqh6tZ3ecMdf8Vu5aBmnjiF5u8zIDioNLy1fWwuGTdOEvU+EyyjY9TZfAH2IVE7gyJrwEp7gcxVNchlBr3t1aWVXj8Z4NkEuibo06lgKcrWdGd7JtX0dIAZZDTp7V//M3zbFbUblC43h+Ql0ueW+7QjRGhlZp6X6gur7rrk7DoejV0/88H5aBfdDDU6+JL6Q4iCYbyTFNSn8xz0qcj4dJ5Ey4WHYLWw0sK4GtTNaoVhpte49efWkx/RYVFTUbt5r8xAh3R6OjO/LlOGsDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDDQbVpOVOskc2PVp7AfDLUF0qTl57ClIgX0lnpBJd4=;
 b=Pk0ArWek1tb5Wi4g4e2XbX2VRFZ1iCenJMJT8IvWO4TCz0gwjxGFaq9A+m5LcdwQkwt0rLV6+PhA+4mvZYlWnu6ViqicPZV/I+U2/ZXF0rXa2FIlkkn4UHtlemKygYvTg4s3NW091zKGBMgK1McYA7Uku37lDqNNzlwcpvqEESPltiMdz3inxshO7CjR2iGBKpeuUSh8GHrGlbHIJEUntut5sJuPsWjVB+vxlPMHUsghzLPl1xzLi2juP8lpJhNBa1qi656OmiPU2/X95h258cURWbkYZyX5jRWz9h6pwcTsvj/rqatAKc07xEiB7vnmZSFmY8dSUvW1bKDMSnrPhg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7850.eurprd04.prod.outlook.com (2603:10a6:10:1e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 15:10:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 15:10:52 +0000
Date: Mon, 29 Jun 2026 10:10:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH 5/5] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Message-ID: <akKK8Z-TiQ1aTfQY@SMW015318>
References: <20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com>
 <20260629-isi-v1-5-deebfdb1b07b@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-isi-v1-5-deebfdb1b07b@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e4bb698-0723-4272-cdaa-08ded5f09c12
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7416014|23010399003|6133799003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 XmC2Bxe3duDZzz1QsjbXuf4zXAewi6csd8lJ8nM6twGs5M7COF/s6l+PMukEyGua0VXHJRHsUepV8BewVs7ogTuySBV3+CjiulYmy+Pb7bG7v4zesbbiiVwHoQOpqoZij5Zy9U9Y3x8Sz2vZf2bPD5Ajv/DSR4hYr2rZtiCNR6isieKEKppiWAcIol9mm5AxgfwI9V4VOhLUkuyEz82avyt2E4rT9+GPpavW41Ho+WRMuePQxieDgOFNcxhS65rpu7Aywv7MU8Dp9b0hNkbW62diTSzFMUp3FL52dqGIba6SHRXMEqE93Px9Vk3sK/FJWua3j+dURJEoP/4868xfGH4MLVBCvGFk/9KYlvPdSwhLkMcu8vqVh+SYYgwi+4qJRWAcIg++LS70yKoQ5ZOfK1IflzAnzUmeGBTZUDsiWabWwqPLj+cswhzP4lVmlrrJNEpxHUaThpIBm7nTm5fLlzrGpUPTUGpG9rrFdAhlTDLz7u/aG/LKe+UQSpsTG4M6yPjNiZBVk2rUoP2MeWCJ4DV2LlwcVnVwQSsfylPHcCx2vv9mnKOS0LqpoPg67SNidH+pt2dNzhdpNenJ2FAWKZdZBJ5sJzUPJNLGGbYO8odFAYEfLxWBnZCPGWQg1+xsLGxoZFqCAk/EH+dJ6nhNyab9oqrJo8yJFfneHZaq/ys=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7416014)(23010399003)(6133799003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QNHHzhGzNGgr5ABWDn+jLWu6ipw9+BXH3z1NDSFkbcof2dt+OFIuTFAZy4pa?=
 =?us-ascii?Q?QTbvx08xVVaA/IKezBKbHwDrcFDnZWw6GZCCFPImCCM0Cmb6WP653tDnNbJr?=
 =?us-ascii?Q?zDma+xbdaSBF21YnKcNhZR3FJtw7wnOPviFQAoY8tCe6SR2XY7Fov3cxBnC1?=
 =?us-ascii?Q?yyubQJHMsl8iZ9wXFzf9MU5nK6zEZm3ForQYGUjxb5cs5pcON24hDO20DtZz?=
 =?us-ascii?Q?crFducXmL19lWz5Tn17/12dOVyoAJklWuoMPHrps4yhWyV4F38IKoS4Ju5Gw?=
 =?us-ascii?Q?yTeyWtewbuulqWmY1pch8ApCmOtujPjrl4fMDjCWD19zOQUh/QoPK9PG73y0?=
 =?us-ascii?Q?fFn02iWCOWpk76DIAu+vtPMWyxJsweoywi6cZKRx+mLH/IYGHdLkGTn7YEMV?=
 =?us-ascii?Q?xXTQzBnezNQFVHlFVJg3DR2poJh21fWTNpk3IeZeUAgaaHY+gTmivRZ9Q/+F?=
 =?us-ascii?Q?xGv/pRvCkClr5DHuXYtWKtkicwJs8d7Se95FIPGULfpWJRGerDWwE4UxFNIF?=
 =?us-ascii?Q?q6hgqmj67CRZhS8IFN8kT64yTXBvQGKCoxz8r465z5gHbD35to3wp5x6mLWh?=
 =?us-ascii?Q?85ofi+t7yblQ2QqT6eIoL0KeXBuc0CgThkqp+sYsv/fWawn2JViEVvjVsXh7?=
 =?us-ascii?Q?fyh6e3Qe1ly5IFEltW7+a36aFXPOWcp2WFYm1ODGrbYMC9GYaGPBj+mRBLV5?=
 =?us-ascii?Q?EbqRaIBwpn7jxxz4fZp63NfQvuRREadldTWXbo1/P1KyxUVdDiFazY/CIZRb?=
 =?us-ascii?Q?au+xaQhuk9OA7fc0c0t6UAb4f4lQoaHS/k+X3hVMaY/3PF5Iu5vTiQiPhmTx?=
 =?us-ascii?Q?yULu+8djcWo0MSJhQ8QQ58KR9F+lc8hL+HYbwL0YLF3ZLU8cOffrYVsKnD/b?=
 =?us-ascii?Q?O8ZXcLnOSvge15TiZhxp3pM80MFa5ROaLQd8cfC6m4krM13EacOgkklsJbAI?=
 =?us-ascii?Q?hBXXKtJeqlVniMrsi3M/DMhc7AO589vJZSe1fUkGVk6XDoSCFYF2mPoQHjvr?=
 =?us-ascii?Q?oeHR7lurW63dchC2ole6KVz58TEUwdR7/1Hd1oxoWQ632zLubZzTuTfvtXy8?=
 =?us-ascii?Q?yiLfgKt6kdNYin18nJc9AQRsrRJ8kVeaHmoysrKHz3wau1Eqc6ir4Sox/5WF?=
 =?us-ascii?Q?QyOpk8/lHEhRd3pMJ1kQNEY+UymNe50PGCEkZbBigzjbzV/OGydSvMC/tVoD?=
 =?us-ascii?Q?vxF6k12Ejjd6Nly4N6/TTtKXwuMp7XkDsUCWKkVBlUYCEnIQ6e98KOFQbSAN?=
 =?us-ascii?Q?wtrzL2+3CjW/1qQSUgh85q/sff9Ilvtfd10gvOyecpCsXUye5hSn7sVwxdf9?=
 =?us-ascii?Q?5sy1z8t3TG+pmeoxCkbTotAtLEDHW2dvXjbsgMnW0YV06/rMujii02DapxOu?=
 =?us-ascii?Q?H5iy1B0DwOkVGVHJaCxJtQeSoz6saCZLOeFOUTjYCHJ+hqAWVgi+hHad4Uzt?=
 =?us-ascii?Q?bbGNsUFK3OJFh77cj8wEtyJ27VBsqtLOG3qikEJeQjoviw03MvmRpWmy+LVJ?=
 =?us-ascii?Q?0KD+pxcsMlS8G/oxYycEt/oisnIlLG9U29mEmiVOIMpTYR/XAB/qaOq1YF39?=
 =?us-ascii?Q?tFsZoX3kMuHPuH+7dtKEuLAvD7/uZEiNe3yPZAjWPypJjF/Lswc5OyJFSMYl?=
 =?us-ascii?Q?q9gNfypWvEbsoZmoUH65IC3HhVNO+7m5EnqpYvtXEyXVAnrdDascpYVx56zo?=
 =?us-ascii?Q?xHv7Lad2a4EBzSBFwoe/dJM47/ghfCefDYj+8kIpOVBMGK03AocfKCJuvmol?=
 =?us-ascii?Q?QmTRCZ6916/3+x9rJRMIiVMjlN1qv+3BE9HdzW6orDguen0mBmzi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4bb698-0723-4272-cdaa-08ded5f09c12
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 15:10:52.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhtMMGUrr7nBGrqTWLjbO/Lot0Pk/09/5FXVPPVi78pTwxtwZ0M7bREYi5Bvtoh74xeQ7tvs3NaT8tPvRHr1qqZXPYMQfsqfZGAHZk4d/z0nZpLwp9TmxkFY7EZhiJL7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7850
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:c.hemp@phytec.de,m:s.riedmueller@phytec.de,m:jacopo@jmondi.org,m:aisheng.dong@nxp.com,m:guoniu.zhou@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:robert.chiras@nxp.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65982-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,SMW015318:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B18346DCB6B

On Mon, Jun 29, 2026 at 03:44:59PM +0800, Guoniu Zhou wrote:
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010) and extend existing ABGR32 format with
> full memory-to-memory capabilities to meet Android requirements.
>
> All formats support capture, M2M input, and M2M output operations,
> enabling complete format conversion pipelines.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 59 +++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 05b51b98344b..ef638af350fe 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -160,12 +160,69 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
>  		.fourcc		= V4L2_PIX_FMT_ABGR32,
> -		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,
>  		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 32 },
>  		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
>  	},
>  	/*
>  	 * RAW formats
>
> --
> 2.34.1
>
>

