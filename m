Return-Path: <linux-media+bounces-41192-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1511B38502
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 16:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B3F81BA4B44
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD3E1DE4CD;
	Wed, 27 Aug 2025 14:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CEl84/Ko"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C768481B1;
	Wed, 27 Aug 2025 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756305060; cv=fail; b=WgXsK6syJJ4TpRu+9p6DlnbGhmfcadyQ8kdqtOw1hHK9kNqI1X9fmYx8oxFXCQBDMdKvpJPysWBbzwXnuidg5v2UjQSbAcAn6eHztEiIeKUh3HRyVL0fz3hU09BLCAcWQrrhWhd2DdGwaKp/SreiBK+/TpvK/+LFq7/BW7pCnQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756305060; c=relaxed/simple;
	bh=Bw21LaqjVew4m1jT29TmUJmaFzfI7wqcwOMQiYzQjsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dk/76SGtxcFmmvHitO13nmNcYXH9WnswStdprYj9YMClWIZ8OVeagxtsHSPobIwsu70HdMSZh08446AqKSNFu6Y3HNhxsY0YkISzGR9jM6XowIbNqT23Eyq+A4gVzdAGcT5gSZh9mNCOnh1SxI3/O/zWamv3BL5DvN9UrFtCgFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CEl84/Ko; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFzEy5Ys3Y3g8KteoJNWUPEUAIfk7Nxu37VFKLY+eTpeUoHTSAF8iyTvekXeSaMoO4m015TlFwVEqb4WSmROwaYgIeosi/cu1GdmbW1Zg36mnTtc849ztPT3/nS87jQVepbyjYpAEOjrQH0BsT2o5oqUpWlbuI9zbOTJzd4u2jRp2gEbFTExuul1uwQa7Zdim5t0C+kFhnZHoCCey2tSh1sZPOyc/QczT7VmrFFhiuoU7c1djz4YYZ7bakSFQTyGdIZinmX0ntNCCCKHymb0G1+ft8DkiTccT2CE9wcUpmpofb1l6dCWcqe1wRxcMFSaO+qwi7dtha50BS7n4US9Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVYmFx4GQu8y3Mo2gN1C1HL2La180G/5HnTbDHTQ6ko=;
 b=qow0XFXAdDBo/Ug4xD3rjLnNku3sEuQS83jhkIRQRFePgLSudRLNAf3vuBLAKqRYOfMYJXKV0xKRz9fiW5fRQ3Sm9XvVu3A05b8gDW9innSXygYvfgtTWIGlJ/63zO1W4etiOOe9M5etSULVhaELtcBjPOYFguVewg8xMc+psw891Ge1snbVLaFBF8r7pDirB1Dh2nyFqrMErUckDBbjzBwZXxN1nBV3SBx26/tPpG3KfHgMZW2Ak9SQGEV5FJ/nXUm8vih9KuRuKn3AmcOA0vmEvyZK48c9bve+Q8U2reZhekW5gFqGlsfqX+ykXhpyNGs33SCAqGYg5dn7KWV7sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JVYmFx4GQu8y3Mo2gN1C1HL2La180G/5HnTbDHTQ6ko=;
 b=CEl84/KoOT6jkCTjHz99bx20wHfw0HIpjaAqaGTc3cpn6eluja+NJK3m5PY+PQaa+5kz8LCrEYvWjSBUfv0FwXKWhi+nZpTrc93Tz6G0eM99eyTvn8+o/DtxtrMraCt2/jUQo2rgXBsvHqIxLxc3odWLmTgCvcLBgpEW08MbmxwfEfAfBYPeHjPnm8Nb4gCr+R/H0x0eAauozSW5DS/GcHtoS33tH5U0umY7A/NqYT9ObR+rlwXBXDXsyE4Ds4GIUioutDJxGubD9quqz+jg+8jsVNHnOFOZFYinsorcEVwceMpAg2M/YlD/TYE9JX661BjrH/ZSM2LB6QjDWLWX7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB10966.eurprd04.prod.outlook.com (2603:10a6:150:204::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.24; Wed, 27 Aug
 2025 14:30:54 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 14:30:54 +0000
Date: Wed, 27 Aug 2025 10:30:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] media: nxp: imx8-isi: Reorder the platform data
Message-ID: <aK8WlNKmMZo+F+vW@lizhi-Precision-Tower-5810>
References: <20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com>
 <20250827-isi_imx93-v1-4-83e6b4b50c4d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-isi_imx93-v1-4-83e6b4b50c4d@nxp.com>
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB10966:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d96cfcd-28af-4495-93a4-08dde576548c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?DUukO9Wi88rtoLxvO1+FQTtR7auPym44S7mRgo1xhbS3jTEk2zjTTshqqaSy?=
 =?us-ascii?Q?nw1lPvDmB1KqgNG4fXU9cF/tnwslpFmyDjFKX7UGQBkMrnzngdT/85Dakgft?=
 =?us-ascii?Q?KmJF4ey5sktyYUGEidRMiJGBSgsPRAFFsMlLZEL/xPFjGIGxy7AsWlBT3lz/?=
 =?us-ascii?Q?wEck4sdVhw6mEJk+ODRlxj4NLat3if/8e9NrE5tddfiTp5029O9PIcERCALr?=
 =?us-ascii?Q?vpFTY4DPgjAZHK0LdL/O6d1wJ65SIltNi7DngyOP0I3Mjuz6496Se7xQI/Iq?=
 =?us-ascii?Q?SV81K3thNjgepGqpcwkIGuj0/NPy90GIqD2bFPApICQf0ajlRKkU2c58Lzop?=
 =?us-ascii?Q?FeDQMkG3bMHrXzIZ0J5/tjbm9BIY5ke7FVDnfKbPfnY9CEGRfsjF47E/Yqtp?=
 =?us-ascii?Q?eW04sOSmnV8iZ/BvcH7sHQn6e2atLJSJi2uWhdXRkLFCRKdDTWHbZsxWcLjD?=
 =?us-ascii?Q?fyjo+TYh12HNhn2VwgcKKn4QGUCH72Mwsyt7dozCfBLfGCMXjqzeo0QRyIZB?=
 =?us-ascii?Q?clvfgm773r3jgy3CZkN1E/DjumDgurRu3kvPMgr26BZQZCgdnZ5bABkQrIdL?=
 =?us-ascii?Q?wqN2/eDEbkAtrxAMF0A1P9ScpTt0U5pwxWbinvz8DDX4EYZfgyJOqzkuzGCp?=
 =?us-ascii?Q?gGW1rkF83T3Fg2AjqcHlx460oHp7yZLfbtpp/Z4UFbbA+eQ1uaiSTtjeW+6S?=
 =?us-ascii?Q?u15n1cdsE2Ei/x23CZwLtKQEnw4ng0BQIeMgh9V5jVugfJ2KCrFGcqQIpo4N?=
 =?us-ascii?Q?HsxIpolb85DIxgNgxuXJuth18PsOhxwU5xbwE67JawYuGuturji2S51FkuKC?=
 =?us-ascii?Q?xyS6k80wci075q/r76itt9zFYNOrHaZ8LDlHT+oJ6P6yQYUkNSF5m3MgYmhS?=
 =?us-ascii?Q?HV583w09p1TsdFRGNy86ShS6vWW/tHdrWYQTMqOb/jUc6oFF0o3sqyXJySda?=
 =?us-ascii?Q?rRwAZlsQ0yomeSN3iNUvM3iVVHh+jtdkgoSb+W8EP8fbM9+HjQbIwLhFsyRE?=
 =?us-ascii?Q?nsrA6lH1sZbhwu/Ud7/SLh8XLbBDnXybdvy+BopU42aaaej7kmfGlOD+Dfl0?=
 =?us-ascii?Q?MD6c+X/Ho2qxZxiPftHxQDz+J43te8AUzjsWcS/IPknY/D5WCbUlk13H0WQh?=
 =?us-ascii?Q?N1OqH6jakHtDvo0RJBQngH4XJbeUuFXscfXSlCK+1OamCUN49t/RxQZCS4ll?=
 =?us-ascii?Q?wr5OWj86Ceo1+6cKLzXrgJG37ViitX53rf92eFwjqIsWkgJ1fTR/3LMGiF21?=
 =?us-ascii?Q?1ATeulhAFjTdn+TGKw0SUN0V3oRg8inOhD3tb5ab6ohsMz7iUJ5h0N5u1zRk?=
 =?us-ascii?Q?wV+/epud/PQrEA2Gx64pzu1mZwTDK6kyJ8yfuBc5sMSGgRXwsVn6e/kuOCsR?=
 =?us-ascii?Q?g5rqkJ1v8JBM1PZg9wFd0yr/5PxGXHI1cTt6otKIrkv2ggCH69iFllEYDwiD?=
 =?us-ascii?Q?W391BZiOEHmXe89/YafGWY2+smTOAuvLsz/T5xatInRC5AoaZMAO+w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xHDyNqI/tm5OYI6nInj0ama+hJcbrlZKQbk0QjSZ4aCuNi+qe2C+vxt2MYeB?=
 =?us-ascii?Q?lSDCZalwLSPL9tJYnB1+WoyHZ2hlpo2HOwENAiFJAf7lSnUiGru55IrPg2St?=
 =?us-ascii?Q?Av2j1eMtDC3H8qiQqgNBxThH04J7u7He/x8YIFDjl7er63SL5b/hpl25V8Ks?=
 =?us-ascii?Q?m8VKpFzeBG4w15O014hLloBD1ohxEBlZXs2088f84zoM/Xo8zKQhSyruzfgQ?=
 =?us-ascii?Q?/D0Lc9QInScueI649YuQYMBXR1SjFX9IrLzOLf39gpSQ/naDjU9KYqqiwrC1?=
 =?us-ascii?Q?gZOeiDByi1p868PP4BM4EeLob1XnCXwxCeXN1NjXKyMav5+WId7t0z8vCC88?=
 =?us-ascii?Q?M0OU7hCYunjPElSZvhvwnujUO8kj73J5oZaKGYq34f1WuwlAyvxgi/eiKxON?=
 =?us-ascii?Q?OBupjP0N821SlkgonUjiyPT0yetkxL6OWt6nmx1ILVqZDPg6xKbL1Y/qdFBP?=
 =?us-ascii?Q?csFPTEWmd6Y0motnSOTCCcHRQKhuk0EDDScW1xfr+6mpoHDX03yOl0Rpq+rx?=
 =?us-ascii?Q?U933QokYtHtUpCL7E/RKMywI1yh8VPqb30RrY+KTZiy/AAzDK5ZlZdQ+ELbi?=
 =?us-ascii?Q?XFiC9w/yu5I+8NN/lnbqYQGKym16nF3rSfp0jP/sBnietiMzrWJbmSsZ9BJd?=
 =?us-ascii?Q?uNy8P4JKQegVD9mwcL2CR12glqKhMojGit6Rkqu7zRyA1/X2sQYsKeIsLte3?=
 =?us-ascii?Q?Tkgf07W3Shc4HfYsJ864mc5R/b+25qMBHuej83UoAoC486g/ghr9aWHTIaCy?=
 =?us-ascii?Q?xxffz41ot6HjMi7Jb4IFuNrb3Y+s+UEXbHnuOQJ3IJtUlFJ1emsCuRSHCEWE?=
 =?us-ascii?Q?AKm1mjzF4Mj8nWMy/K47iigZGmdYj6/XKKxKLjEwFy8S226imqoNO5wKO1qI?=
 =?us-ascii?Q?8t5H5LEFad55hhQIBkjcHn2DrAaQENxprFKF9zUD7W6g9iAMKMTb4z+pFREj?=
 =?us-ascii?Q?SQQ5/Tcw4bxvRJd4Xae5D4nLg3ko0YS/05D5WqPbfwiIm6o7BL6gudNND4M7?=
 =?us-ascii?Q?mTDsABK96PHY1EM+wBMOZbAOPzIizzhBnTBq45YnlIILeJeEdz1qSI3kp3Pu?=
 =?us-ascii?Q?nMxwo8+lC3GaQ4yZjUj5uO8MuvTyt1DuxMlfA9loy0KRY/p8HR/FLc3c/doa?=
 =?us-ascii?Q?5t8Q5x57GBwIQ2iDe1rsvWKIsVrKtlUc9eSlOa8MXEFzUttHjWBc0ycibEAL?=
 =?us-ascii?Q?4dbt0G06LpdRf6V3BUEwFa8Y79Lu/PKNaWZQ1+huhW8MocoRQ3CwcJMce3kQ?=
 =?us-ascii?Q?v5ZSShgPGnbaSoHMlYTYvacXmJp++uZYezxUWU8MYRYXeGg16wbmFJPDwrgO?=
 =?us-ascii?Q?fIJfgWgrOtbiSh0WukfoSAMmMghCj0bhqWBzRt6gUWOQZ4xzAg1T9TaL7uFW?=
 =?us-ascii?Q?HbgardRIp6JsovRKrfuOc3lkNWtjkEyjMwFdI3OV84+cSGekVcN8J08UJZKo?=
 =?us-ascii?Q?4+deo+Sj3Ws/l0fK5/CIJw3ESKJtzRRqHEtouw/q/60ZkYrXZexqpdfQhANX?=
 =?us-ascii?Q?YqLTcuUbYmgv0+7bRMya+qaIuVFkUNcqq/sWtauAcQ5eD1wmoTq1k1rBO7sY?=
 =?us-ascii?Q?TYcW3XOS3cAM7C8hUhO3544lIMHZl3YpyMZVowZE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d96cfcd-28af-4495-93a4-08dde576548c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 14:30:54.5284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HCmzjXD4fFLI9r8nkLSfGwfmt6Fzrs/SJAyuAxu2PrpzQm01AmlE+pT5psiX0LxtD3q3390UPAIngwm8lnE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10966

On Wed, Aug 27, 2025 at 05:53:51PM +0800, Guoniu Zhou wrote:
> Sort platform data in the order of compatible strings in of_match table
> to make it more convenient to read.
>
> No functions changed.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 44 +++++++++++-----------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 981648a0311374597a033a7ecbf39f7b0b252cb0..cae918792ddbe3e6f458606fbbb7d0ad5738504c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -314,6 +314,28 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>
> +static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> +	.model			= MXC_ISI_IMX8QM,
> +	.num_ports		= 5,
> +	.num_channels		= 8,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_qm,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
> +static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> +	.model			= MXC_ISI_IMX8QXP,
> +	.num_ports		= 5,
> +	.num_channels		= 6,
> +	.reg_offset		= 0x10000,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.model			= MXC_ISI_IMX8ULP,
>  	.num_ports		= 1,
> @@ -337,28 +359,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.has_36bit_dma		= false,
>  };
>
> -static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> -	.model			= MXC_ISI_IMX8QM,
> -	.num_ports		= 5,
> -	.num_channels		= 8,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_qm,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= false,
> -};
> -
> -static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
> -	.model			= MXC_ISI_IMX8QXP,
> -	.num_ports		= 5,
> -	.num_channels		= 6,
> -	.reg_offset		= 0x10000,
> -	.ier_reg		= &mxc_imx8_isi_ier_v2,
> -	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.buf_active_reverse	= true,
> -	.has_36bit_dma		= false,
> -};
> -
>  /* -----------------------------------------------------------------------------
>   * Power management
>   */
>
> --
> 2.34.1
>

