Return-Path: <linux-media+bounces-44018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 192A7BC686B
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 22:02:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBEEE4EEDFE
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 20:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C64627B351;
	Wed,  8 Oct 2025 20:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BgC/dCpb"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E4E1BD9F0
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 20:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953735; cv=fail; b=L+Jmd00ufR+Y1MGoYbQ6bfPoqV1Je4UY1c87xwnq5e5PFxTUFcK9RbBH/OQ6AHfK3Phs4H9+reoqZwDO+Z2r7nfCNVVsuntzQ3XLKcoiwFyfyM/UAPOGHGO5AJZHt7XOcVP89xkB6MkKYF2FfdwxmDFL8DNeWVcOee5FGhSQuMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953735; c=relaxed/simple;
	bh=HmBhFrogIjCAXFRXIsN2SuLJF7DGEMgrqmndD6homME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ql6xGm2WsjwyP0cQTeb6e1B9NnTe52XPHOYD3uJKy+7KZ+m9K6QUft260rpvsZtJ9Pfy4guN+wmuWo1atnVbLGbGpkBnSq1i2TS12+iQ9UCmAwNN7cwJ08hp1/+y6eFwnl5DgQ8eHmhq8XUikJ4jbSysrXLV9JQyXp5aZ4CE7Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BgC/dCpb; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIWLgrsp+Jt9ACgVcXnY+3mcAhEe6w1Gc1sjaTjR+7i6ITA5/VxOJYvJEjrUDz4Ela4T/hUG7niLloeif+s4WZss/7qo+jW2iBWpxjJcDwBTnzD6hAzPaWb6NJTior5wAqVPl4gLJwlr1hMA+krTs0MC9mqLLXXByXssNncQ1FyAzwhLUND1DXP0WZPYiqs79Ox3Ny5fEsajN1WalmRsKIjeEDW321vFSxjDfoDtB+wSNNYz8p9ymaGwQxsJ4qDgws1D9FjRReKemGvs8xs2SzRrjoxR3Xb9Q9iTLw7QS+Ku+/UzFcPAsoukKAOfq3WRNMVeZVJyhjZRgXOD2w5wPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18ZRg4yHTMNMjNABa7eJU9lvfFHBPibdWwBTJfi0+9o=;
 b=WilMFRVuAbsTVRa8eWhXGzKimDWlFanrNjJwMydc18sF0XGhTMxnQEExX3zOGbMX4ecp2K93WTdzOU+pAY/MwASIGgWTgDlh3jhX/YVfu0C5QruJqNrA9ELjxDX0atK1iuVVV+PShEco4wi2I9MRacZNa7I/6R+b/GPpCeylWpQGOee6JzTVW+dKEbxQCfpkApVIVEXw2kI0t6dDnQqDn6R0MZNNG4ZP38HnKzYiFMvCglNpkflTNkP9b1ekTdEpaj2MZc5U6BE3wmEzyf8QU4nqTSbaDBFj0wQyQ3nUorT/Wrnp+3sVmObp4FdV3lD4J17DWjetgMzrEa/g6hxMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18ZRg4yHTMNMjNABa7eJU9lvfFHBPibdWwBTJfi0+9o=;
 b=BgC/dCpb1BKxYAWDcVO62vOuxGpMwS+Jc925oN2qFWQgq7GBUa2WcrMF0HptmKvWhpoDlLtceRToJd/fAAYpdPuSxg80yeg5y0sGzfLY4e3Ahutnm4IOJgD+S6OQ05NKPrwLD8gpGoZ5ac7NntrN2R+W8Wq2gKxWBDpajLiDhuyyI9sgsDHXrB73Rhc9Ybim0tGbNs4q62RZUVA7DG02ZM1HDx/gjuhr4ydUoE/x9uODcoR+1MgE02cCXIAirlPdcAJMqKZXZ7/8TWmY3j2w+/07oLjnGiwLb4si7kJjfdQ5FhYnwYj9DblrTyeEzNhqT6nYc5PHKoxVXP474MRnBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB8849.eurprd04.prod.outlook.com (2603:10a6:20b:42c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 20:02:09 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 20:02:09 +0000
Date: Wed, 8 Oct 2025 16:02:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 12/25] media: imx-pxp: Drop unneeded v4l2_m2m_get_vq()
 NULL check
Message-ID: <aObDOYM1FfxnZN1I@lizhi-Precision-Tower-5810>
References: <20251008175052.19925-1-laurent.pinchart@ideasonboard.com>
 <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008175052.19925-13-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SJ0PR05CA0206.namprd05.prod.outlook.com
 (2603:10b6:a03:330::31) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5c4431-2266-454b-d356-08de06a5905b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?r+fswR9Xiz3+yh9cEfA+lrHrN/4s8IjnvQ2hMpVNEy9L1q9dAuu9QH3WJCCA?=
 =?us-ascii?Q?U7NPE759R8z9l0gMrcMeJhlYN1t3A1QVtvJ3gR8NULVpZzI/Hz3RUbbtIfWP?=
 =?us-ascii?Q?BsrtvSEOql68oz4URl8AIZDxGKMC2P6HKmtdCd10/cA8yVLeTYJ9ATVe7pF9?=
 =?us-ascii?Q?2X9L4qs+zkhRoVKZ7jrvqTWu7W8gL8+jzGCbq1QextNHcjFvtCQ8WGwaybV1?=
 =?us-ascii?Q?f+sG/yWJIaK0fd0kg7VZR+uvyqWmuG0eR/N7vNjks6gfl8SBHx9h4kGTIw7z?=
 =?us-ascii?Q?MOy/fjRfpSEg6IhT2ePDWhll8PcQUPYmQawkTD/SkZbZQIE7DXLyWqNr+0g+?=
 =?us-ascii?Q?CTrn01IbUirL9ek3f1FpeZW+F9ySsvsKggPn1Hyuo9wX5BxFWEezdkug60Jg?=
 =?us-ascii?Q?DKpACYKlEcX9G4OZBJ7WyzhIWgmWRuzpgoEjUG2mZTHmpmcDCEBI6OTvMzF1?=
 =?us-ascii?Q?AtLpYskEtfGD9y0InnTD3GWLNqWNR60017bpioHSLYi2Me9Vc18JxRKXNu1G?=
 =?us-ascii?Q?VQoBQYcMnoNWqvUmlI0ziIHWNi0A4+9RzDIO3d1mXUC8Wf7imIOGO1x7L/Pj?=
 =?us-ascii?Q?3O/7ahguyYxx9Ry3sKDlr5fp9qPX2m7dGC5DGQrpUyryM5G5acniikZSyMj1?=
 =?us-ascii?Q?ZuPmpvxV5tSK4ZPL7aXy1MLpWOLHr0YkuoqyfZlVap5WaJN/hPWTYNH8OBWt?=
 =?us-ascii?Q?Ij0YXeyVpbNZfI4m17wCNcWxiry4NwqVjNOhxYAWyIwruiPpKmA6YkNjGR4w?=
 =?us-ascii?Q?i+TM743oj4obG1UZflLCGIVOlEBDI+hhFYQBduhQ5Y+6oTWuLZaqm9uOw8aU?=
 =?us-ascii?Q?bsdDEHJEwVp5x0ApUbDd+hbcMkODYzhhEv1ZKRZN9PHI4a8PN0wQUkVXr2b4?=
 =?us-ascii?Q?9plIucpmg7rr2N+de4MKrvWXgvs3p4HmZ0aQUumireLdr+ADJDvvA/1h8gtW?=
 =?us-ascii?Q?DB8YCvN63LY4OdbT216ZfCdM3Tof4a1GgdqCyA2B+L+7Gr4zLmo11ktW1v2z?=
 =?us-ascii?Q?4IDIZHA5gVIcRDS9Z5Pud1hcZvNFMuCc2ud4U+vcX/wDRaOsW/EsMokywaMO?=
 =?us-ascii?Q?uudoPqqwhX0nrAJks80Gk0KQnR2HJUFQ8O+znDZu42s4VQGorELyPta/KD4I?=
 =?us-ascii?Q?cR32iIg+8h12h9HP+tOpWp+5ErAfp+MEonHk/5hiXfXxG/Y9JTEzmjTv0K/2?=
 =?us-ascii?Q?+nBj2qamPR32RmxGo9xD1GdQ6FCYTgBc2bO71JzLnCo9PV2lyq8HJSb+FD0O?=
 =?us-ascii?Q?bEid0tdwLUfQ7vL4iyOVpYCgfXqEE59gIRZGRwbp/L43bRXwjpEMStm6bMn9?=
 =?us-ascii?Q?3MKqd4UWWOcwqEIhxskI5N1AHDmoHjUZYjCMzV6sQUpIy/FsS4bCo6Nn3VS4?=
 =?us-ascii?Q?yirK6mh+GVS3AtUZJdq9pqR+UraFUIZOlIJ49hh3uQoxK5loLd3GdgPf5NGJ?=
 =?us-ascii?Q?whwoXOyy/vhMZOTCsLmKU68HaD1PWsdcqY5qKXPFuCcAOOE5a5Ok0tCXRGnD?=
 =?us-ascii?Q?IB12MbD5ojNA/dp1iijuq++hAh90HsuD30iH?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aQ+hZLyI3KKXCPqGNHUpjG8DgEZ1zyyfSsz7PEgfol9V7K2o3BDRhNaR4xWH?=
 =?us-ascii?Q?5hWR28Ltbrrc8DK+zk1IptWF3qDklIP5tMDMFQETvXrSP8kSAH+U2C1AHp7t?=
 =?us-ascii?Q?gM1qxD/KkyML6zkFg4/jl8YbKzrDiI+PsUUVgqaRc4n7KaRRHvKzCAQtQ6b/?=
 =?us-ascii?Q?ClGdzqnSnqJgfHi+eZx0Qkpz7ZB+f2hocJi0+0RsCwOn7MKsMB7e0p6vZd6F?=
 =?us-ascii?Q?8YA1nVmewc2xthM8FegYsxlKWhPfFirvbNWIdjYXgHy8X1sUejjuu80e4TYg?=
 =?us-ascii?Q?y/uYDzM5DmgPbjPj5PBmukgg4stWdVjt8A1laCGwJoOA7tbkWlBRbaOUedWC?=
 =?us-ascii?Q?0cKCxasoNQ+t2Zfrj2gw7W1GG6hOVfHVSd6r4r9wjY/MWXKm5rtPYhgMwMOT?=
 =?us-ascii?Q?HEag8NHPHaH8pxNTYPbPa7ZPLSLUMz36pGxJGZgaoX5GTIYR1r0R/PbsPI3e?=
 =?us-ascii?Q?0gjUSiegkyTLMPDqgo5UfNrPxbEGg7rqyT6A0Kx4pUO6yEaijE3FFDRmukPC?=
 =?us-ascii?Q?U8xYlgk/YDeqaWtvGG4Jc8B8JJpdbtC3vGHreq0gTA59M5XO6W9xLYvflo9o?=
 =?us-ascii?Q?qYwmT0JZrKkcftFru/rIdufqaQ2GwgxD6qrDpGA7bFck1JjjhAe6nGOS6OS+?=
 =?us-ascii?Q?j30HKD+l5Mta1xQlt2OZdDAR7Hb2lCk1CKg6LCAqIJjmnlA3kCEJJ3OlBwHn?=
 =?us-ascii?Q?E6bJ++L7h9Lxsq58bgl1gB0+RPnmZp7Kpc/l6Lk2tVLzWQJrCFDWAVX7bl2q?=
 =?us-ascii?Q?ibEtSZIbQqPGkxdr0bKBUY0gTcLUzaf95X8Q+AhTpkOibBwd1MjcvFAM2wjQ?=
 =?us-ascii?Q?N5OfodrSZl2zVDnvO7G78f7S6gecarCQ3o5h1HHjeM2HnRayR4CgrCNRVbSQ?=
 =?us-ascii?Q?jwduUyTTHeORSZv6sixE7/o9GdlTyt+mr7hbPVFQBu1PENnmiggeawgIEt9E?=
 =?us-ascii?Q?sQmKBSyOrrlA9BgNdoDiEPCu5LqH57xe7TSirtK4JKgoUg5ESx7RDGSRiygI?=
 =?us-ascii?Q?oxw2G/DfS5XuWzls1JrcoWzoMWK+FK8Chqv2B2NI7kYy/iGszoUot2P4HsY/?=
 =?us-ascii?Q?5JBLwLJn/iPHlWsnIxqK/8yj2sU1I0CMZWQ9gdZExQYY0zgLt9dI4OpKOU5d?=
 =?us-ascii?Q?3ZXSpg0prIAJTHFO0PUNuUUkyB2VVDj8SHqSuLcr4egWsy5u7lanwyHhnXRZ?=
 =?us-ascii?Q?j9JJhpgDLPJiGEVBjeYpZqxari2hWvn7MQ5EJxmVBochpWE7pBwO0NonKvV8?=
 =?us-ascii?Q?Ox0SfbzXJ4W5W1LEO67XEnersTTtkX6uUr1Qs904eMWS62YwvpZ03AVWh8LV?=
 =?us-ascii?Q?d7P7PYfmVYjgePDp2JEBYIpDKnyKt/E9O7WAESNl1Q5CSchAeOcn86sde0ok?=
 =?us-ascii?Q?AX5lRN1iMI84eD0b68Hkm7rrUsd7Srx7yuyNG3FvXNM9GqTdhNQg2gxo3ytU?=
 =?us-ascii?Q?HKBBxK3ZLdfNhjwG2r4FM64ob6IwLRvS8vDrQ7HiNKnxLnevgC5PBL7BbnV/?=
 =?us-ascii?Q?6W7mWo6lG4mFjOiLXyBYgfd3cBMakEcRTkM0wDjIG+o8Tz7HjNau2qnxG4fx?=
 =?us-ascii?Q?9+oZl1yttx0iwjoQHf9g2Eq1T5bXgtzVhiNCZBmY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5c4431-2266-454b-d356-08de06a5905b
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 20:02:09.5535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qf02v5Gg3qg1nBL8lRAJjOlalQKylGkiByC+aPf9c8n6fj3scOzX/BxVkWC9KywBZ67MldytFCvv7Q4/w9mYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8849

On Wed, Oct 08, 2025 at 08:50:39PM +0300, Laurent Pinchart wrote:
> The v4l2_m2m_get_vq() function never returns NULL.
>
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
>
> In the get format handler, the return value is not used for any purpose
> other than the NULL check, which was therefore probably intended to
> catch invalid format types. That's not needed for the same reason as in
> the set format handler.
>
> Drop the unneeded return value checks and, as the function has no side
> effect, the unneeded function call as well.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx-pxp.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index 7f8ffbac582f..5386650ce194 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1180,13 +1180,8 @@ static int pxp_enum_fmt_vid_out(struct file *file, void *priv,
>
>  static int pxp_g_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
>  {
> -	struct vb2_queue *vq;
>  	struct pxp_q_data *q_data;
>
> -	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
> -
>  	q_data = get_q_data(ctx, f->type);
>
>  	f->fmt.pix.width	= q_data->width;
> @@ -1329,8 +1324,6 @@ static int pxp_s_fmt(struct pxp_ctx *ctx, struct v4l2_format *f)
>  	struct vb2_queue *vq;
>
>  	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
> -	if (!vq)
> -		return -EINVAL;
>
>  	q_data = get_q_data(ctx, f->type);
>  	if (!q_data)
> --
> Regards,
>
> Laurent Pinchart
>

