Return-Path: <linux-media+bounces-49208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E69CD125B
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 18:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D568B305A80F
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2996621323C;
	Fri, 19 Dec 2025 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ey2vagPH"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7214A11CAF;
	Fri, 19 Dec 2025 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160519; cv=fail; b=YvAtPGG6nwz2B16poQehZztyzRPlTY7xLThqOB/t7Uyvo7+QXLkyOLDOmzHEAxo4uugMZlRn4wz69xo3KavFNUMhifytW+hJnEC4+Sqi7pzuTmaxAB/O1zsIqich7pLgnFYZ3hBFHmvZT+bZjxN8Cw6jd5M6PQ3XJnV8BQQHc20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160519; c=relaxed/simple;
	bh=EUc7wtQCLDPdy9om8zQJclCScWsx9vwt2qNAK8ZG0Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PgraOfp5Yyfl2HoSjMhewOvjVAB1tNkRawuW6MsMF+2kge9W8lha9jqwUbu6WH0pDJzqnHzmXbUY36xZbUN/fOcHh/DSQcSwDqR8NGch6B459bNQUPfvLKAuWGxQkOArGmR6JZY5CFiOdVY278oh6GkWg8HwyhKMW3LDt7TjLVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ey2vagPH; arc=fail smtp.client-ip=40.107.159.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCRxHoiiqpqiqvtYV2C7s+4do8IYHEbCkdAkwWA3nS0+vT/1KnYKWMRZiGAv7FrWOmPVuKKqy2345f14lqdXdwWxYaqqbeLQtnnxGiUWoD0HA3syQ8ewpb3ro5gC/4O5vyDcSfGZwTHFdN5KUHwJZ8WG03Xujt5XspU6seGyNPzOAHas8pc2uU311sru5ODFxvmFM/HkV8pceBEKroIXS1fkeM7pE8/O6/31VRHWXMWdXo6O/7BldemlSjaQK52l/waz1pkwFU1RI5XT8Qbqbmh9bTBLVfdKcjmtmNmL902q2mVZ+tjxvc3/3lewr/Gl4qDJZUkSKwXVIoMXoRPeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ctdb4ep6EG4cqLOsBLB7sOHUBp9VvZayOSKRVRS7+iU=;
 b=iPsleWttr/Z8UrH/zYiXoxftNExb1CraE6WCPGWVUSGM2DyQ7b0O3jVpvsIgaxQI0ItvbB6W8OEclYXnhJ6bQUtj0FzRwq2GYcLg/3bUWVRbHBezUvLIIcYAcOevmzchVfJxGCwohjDVedSWiBAV3tymL4rpIUWintWBake/ylPSXUD6MgPGyDUNqs/pVDekkK/fFs9HbFeFhHEbVDVCzI5HKvhvTIZFsoDgUKE8qVkVTG2aNDAa5hvxaSZP23OCbyLzqLbuuT/rN9VQzVzQnss0TcA51lQE2sQZLLFL3zJkKFZE+GplhRV9SeJ+MyunDB1ShT1SUen4waWEABssyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctdb4ep6EG4cqLOsBLB7sOHUBp9VvZayOSKRVRS7+iU=;
 b=Ey2vagPH58E4v/E+TSXbzxNAQIkwoU9WgEJViX9qwD+KS5iV1L0VLzeVjrZtyGZVnvrep637f6PdRbhPRDABvO1hU8HB54P+avB8EO0woKzma0e1GrdRYGBw8KTS95dTdDkBZE2zTu2hCqCO8uiIsqRwLyXuhUNuwTdVwSoWHxOB0RLNA7X1yilU6mwkNTzbxVGMZGpePwQrlH6L4WaLIyTaR4ytUaRNE949E9LN+XSs7DfAlQnsAalFxFRLK9JtewkZa5fxW9TK0wgYBmqTXWGsBlvpew7s9GoyJ54VcF+GFIpky8NAVSl7+RifMwKAA//q7I+F4OgNiHWkpV306A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GV4PR04MB11751.eurprd04.prod.outlook.com (2603:10a6:150:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 16:08:34 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 16:08:34 +0000
Date: Fri, 19 Dec 2025 11:08:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Message-ID: <aUV4enryGRDdIkIb@lizhi-Precision-Tower-5810>
References: <20251219-csi_formatter-v3-0-8680d6d87091@nxp.com>
 <20251219-csi_formatter-v3-2-8680d6d87091@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-csi_formatter-v3-2-8680d6d87091@nxp.com>
X-ClientProxiedBy: PH8PR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:510:2da::16) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GV4PR04MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 39156757-2ccd-43f0-0978-08de3f18dc4a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?eJLHnxsnn/yCZvLy9iEVHzDVue9boSixDXCrWxwN1LQ82DW0aMNZrU6y6LrS?=
 =?us-ascii?Q?uyDnmQvNDeFE4aPD5GdBWSRguFqMUdBTkKnK9e1Md89vBGu7enm56w+VU7p7?=
 =?us-ascii?Q?+51n2Dt/9bDmfZ06zh84/VK9U//gm23TPPFsN8rzJ8MGl2QkwjDxpLCXQ/mZ?=
 =?us-ascii?Q?CiVw617s7OSujWJcI7cUA/mY+h862kGYEeC/VJ0+vnf8/Ttih/aiTMszCxdg?=
 =?us-ascii?Q?K9ybZsltuBZEcl7LNZntvZVMw2RT93+yvlYs9vogXauEH9VXfT20mA75QEMg?=
 =?us-ascii?Q?vUDVDDKy157eSSnYEpN7qC8D8qOtoqP7pBR0oYpBfaeg0AWJ1GrIb9DMvc8t?=
 =?us-ascii?Q?t32b3W8VuIaXVMq79wd7gRDCeZUJl0ZChrmTiqTUooFT7Kk3Fgd5f5QbdQDa?=
 =?us-ascii?Q?MIfLqvE8ozzQCHnggpyuCDkgyzmzrNyvGy0ZiqhX7eonTlbIYnNQHSa4/sYE?=
 =?us-ascii?Q?kZLMrdDQFYoEnItlcd8OCrFYOtL72ASWa/uwb8g5rBYcpFxCOiYxH7JDbygm?=
 =?us-ascii?Q?8rAFlRe8Q/htpy/oN+i2bCjRvbDhE68KxPps0TxMBiR3krL8eEpXsXNEf9dj?=
 =?us-ascii?Q?c55Tnys5BstqDKFepo2vLQybmn2zYCVWsZuOXaMOKJ61DQHh/3+ZbYLrJBkk?=
 =?us-ascii?Q?vI//uFyJgkCF27D4e/ircfkZlIMeK9dJoEx2mOLOBPIO0ePubRChO+bknh0G?=
 =?us-ascii?Q?LUMH9x10eTjIB53ZA7C7jo1PIYOHI+SfIdiiIL6v4kYKSN+Ql3pr6LrDor6Q?=
 =?us-ascii?Q?iJ10H0JREmMCYhcay1541PGyRdIPxZnx+gQ+0IWhwYRo8s95t4s2Yw3qgl16?=
 =?us-ascii?Q?uUOH0Z6qlnObIoL9fDdcLI2FO2Cb9MjmcqSSJH1pxdpzCynrgxKFPhPnF3Q8?=
 =?us-ascii?Q?JCJ+dCEh3/hoEN1Eca1stdeX2do5T1HWgNBtAGB7s3JOnvmHVRVrkFp08MAo?=
 =?us-ascii?Q?iIniPiz0T5rqu5atVS0W+9hqMIdwMCQsBELk3mTvfEw69e3dRALAlQiJjNoT?=
 =?us-ascii?Q?6keVdlIcXHToqozG3aRsXBHfn3XDWTTkcgbwwBnRSZxWhDspSylxIEfyOdft?=
 =?us-ascii?Q?Iz2V/TzLC1RZl+BzzjUi3xEyflKnaXO4Ag3t861EZ5EpsNheiPdgniUaJ9V5?=
 =?us-ascii?Q?YDkjvKKyFZNwVJTrzguVfpu5WIwG81DyL6qSr6Llg4HJPjQsw0p50Z3qn3tl?=
 =?us-ascii?Q?YoI/njVCPBSvSSL5zinD+G7GfSwWWTHYmZMQMb0TV0oHaCJNOBrtBEPVpBM7?=
 =?us-ascii?Q?FFyxD154HC4DQ0iPZ5JSvZ1OV9/jHpZgQwn7WG0PEAz9/QcGZ8Z+EUmBrAOY?=
 =?us-ascii?Q?Lis7r2qGDiKxrEtl9m+MC7Y1z5cfnOQ+SL6+ofsAcSlI8t9dv+4rU357XLSg?=
 =?us-ascii?Q?gRGIDssjv4aL1KoMPOUfMFcsWn+L8FJDjYTv8/4OZQzndVpfPMKXj/BkrqYH?=
 =?us-ascii?Q?CoewRS22WDHeT0yqisinI/4QTlA5rJm2XkjXfLJ3JhlGDVaHuOivNlaDs294?=
 =?us-ascii?Q?QeXw4yTIGMjk/dPbHqnZIDymfLOKWQd8gNXr?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AcfduEBKRu0vl8+zY9awhZbVwqlUwsU8/jq8mIBBTWzrDVkx+w+rkXxxgwoV?=
 =?us-ascii?Q?rg3HYuqUdQH8N0e/pm6B+mKRoR5DZU2aJqqa4yTRTIkvlNQpWy/+6MvybUKL?=
 =?us-ascii?Q?Xh4pdhYiUpNDlKArF+G8TILhhXPeGuUCyKZK30TuTBbQtEvh4n29ke6WdRlZ?=
 =?us-ascii?Q?4gqn2d17YBm/wz8+SKgTkn7d/JgUQNyz4JTrENjn1glHLjPX9L1ryLnk5atM?=
 =?us-ascii?Q?xN7W8Q9I5ltFHjCyUYXv2Z6GUeIHkQtfFuv89LUAFOl1xwn4ipdIAY2guPTm?=
 =?us-ascii?Q?DvixCSIoE1PxIlStZ93V0LGAUr0VCZ56eXDwFvcaUFMA3STaNLFC3IZngOj8?=
 =?us-ascii?Q?nthf2Zp5h+OItIzX+AkfrrBQW8Gb+zYZDHFCR/MEDntXKNIKReOb1XQ1nUDb?=
 =?us-ascii?Q?6YezpJwh5mNyijDR5gkoZ+QrFVFnph+Fcri0l5acey0Z/VZJn+HYEYJpU5ox?=
 =?us-ascii?Q?ZBkSisfr/uDbw2pVfDmVjaid6Pa7QZ0RCvo77KXc1Tyn6XcOvHq6LWYJ1Cbt?=
 =?us-ascii?Q?utWBlM+k9Usi7mCh+SK41lR11gG6SRchpfeqzVlUz2jL4H0VQbazLHJmiDPv?=
 =?us-ascii?Q?MU8+gqMQhvuEHQ7D92MsEYFGxycBXtm7GUfHB9skgN7tqd/lyWLvAcBL9X07?=
 =?us-ascii?Q?KZxod9zVRxJJK7vK7s6/qr57EIoBt7LS3Qzm/8WqSJ9Af08s3WYUNDF5AGAz?=
 =?us-ascii?Q?cpwiMRmjmjy5IhUokg5DuaWYospVsNwFmtV0LfvBp4QrYR1YEIF8/RxWW9ld?=
 =?us-ascii?Q?b5dzT0Cw+Mw5BUOLkKiqTHKKEboKTvgAgzHth0qmdldY57r9sKZWIJZEinYT?=
 =?us-ascii?Q?Dx460sh5dAAufjc0X6HdMk5ZvSIVLI7TAX97IccdptJOEBl3fEf6DMGkqdd8?=
 =?us-ascii?Q?XNvJEgwBZiVuzr088LJ3lHTV7HjNuKdeIRlULSEAAonCqCVQoWMaFq+xshDP?=
 =?us-ascii?Q?fuvlGnWMmwGL/vDUMK8czqEf0uqjxgCcN5yJPcX1LwMPtAIR5/XSP5D5+jdc?=
 =?us-ascii?Q?Ad5qJyr/kHxH5zInmcimDm4LSSzMiXqxfwBjHLN0cWXbjH12Olah6H6vNLRq?=
 =?us-ascii?Q?0L+TuwRUvRj3NCLCkUDjMQdUEpnhU452nAhR3GxOsRBeJCEzS+xswZ6HFOiS?=
 =?us-ascii?Q?4g6N8samLghTSYjlUnjdZ7jt+PVQSS4pnC8eDAbPfznHJvG/aAnIbS2gQFuU?=
 =?us-ascii?Q?xdXeIoB5Sx0tCHrPIHckrjNL9cQwJjBwctzDSAQ6Kr3fKcoIZqGon7yOBmeE?=
 =?us-ascii?Q?0GaOnvL8mY8Ytls/Suh4t7Mrs5pMPLYUKokJ1DjlwSP12FKShtax2C7GP+Fx?=
 =?us-ascii?Q?QkLZa252Bb3YXhiqrJ4Qzc5j1ezvSenxRXCnttflnSn9U9GOEywt0et3pcf1?=
 =?us-ascii?Q?1yJ4V8cOr8OoizOFPXmFOfUdtSNhiUR0IKH1GsZh1gV77GkRAo4jrtHb2DYA?=
 =?us-ascii?Q?LHIZdZOUaoVdepBH1zWlk2mpqUppBWOcAbZd92icQYkKVIDXDqoIQx+8LC+m?=
 =?us-ascii?Q?EHNdLiu+giRqi+yG1I8IQZy7SQCf9kkgn8KynyJ9EecejLFkIQa6TymCaZE9?=
 =?us-ascii?Q?8HVe3yedNVlY6O1Le/6cJbghSSndhfLm3xMmfd8+DU8kLvkGhLXiaG7SUb/H?=
 =?us-ascii?Q?PjlVAgdCgjtWzUdEN06VAg5bgJ8teFGhBe5LN6LkCp8BD8p1ukfzk8PTp3Wq?=
 =?us-ascii?Q?aU6LZrJjf/U8ka3uRbh4fuEGjB/tdFpCBuSwpHqw3HjAVdEd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39156757-2ccd-43f0-0978-08de3f18dc4a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 16:08:34.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SruQHAzzrDGYgqh5rRb6nTa8/WEeIRdT+ASi2rjtWQ4b4UodR1kjKb3MxUxm5Rowr5+cY3pKqtaR4uztyJ7seA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11751

On Fri, Dec 19, 2025 at 09:50:58AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI pixel formatter is a module found on i.MX95 used to reformat
> packet info, pixel and non-pixel data from CSI-2 host controller to
> match Pixel Link(PL) definition.
>
> Add data formatting support.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  MAINTAINERS                                     |   8 +
>  drivers/media/platform/nxp/Kconfig              |  14 +
>  drivers/media/platform/nxp/Makefile             |   1 +
>  drivers/media/platform/nxp/imx9-csi-formatter.c | 880 ++++++++++++++++++++++++
>  4 files changed, 903 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4205ca007e076f869613032b51e8cc5bff06b98e..3878957b81156e5cb41da2699b2f588e49521724 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18626,6 +18626,14 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:	drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
> +M:	Guoniu Zhou <guoniu.zhou@nxp.com>
> +L:	imx@lists.linux.dev
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
> +F:	drivers/media/platform/nxp/imx9-csi-formatter.c
> +
>  NXP i.MX CLOCK DRIVERS
>  M:	Abel Vesa <abelvesa@kernel.org>
>  R:	Peng Fan <peng.fan@nxp.com>
> diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
> index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
> --- a/drivers/media/platform/nxp/Kconfig
> +++ b/drivers/media/platform/nxp/Kconfig
> @@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
>  	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
>  	  SoC.
>
> +config VIDEO_IMX9_CSI_FORMATTER
> +	tristate "NXP i.MX9 CSI Pixel Formatter driver"
> +	depends on ARCH_MXC || COMPILE_TEST
> +	depends on VIDEO_DEV
> +	select MEDIA_CONTROLLER
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  This driver provides support for the CSI Pixel Formatter found on
> +	  i.MX9 series SoC. This module unpacks the pixels received by the
> +	  formatter and reformats them to meet the pixel link format requirement.
> +
> +	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
> +
>  config VIDEO_IMX_MIPI_CSIS
>  	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
>  	depends on ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
> index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
> --- a/drivers/media/platform/nxp/Makefile
> +++ b/drivers/media/platform/nxp/Makefile
> @@ -6,6 +6,7 @@ obj-y += imx8-isi/
>
>  obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
>  obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
> +obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
>  obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
>  obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
>  obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
> diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..5786e4690e31ee471caf8201329c8e02a2cc0ee6
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
> @@ -0,0 +1,880 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 NXP
> + */
> +
...
> +
> +static const struct dt_index formatter_dt_to_index_map[] = {
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
> +	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
> +	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
> +	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
> +	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
> +	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
> +	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
> +	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
> +	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
> +	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
> +	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
> +	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
> +	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
> +	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
> +	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },

what's these index value from? register bit?

Frank
> +
> +static u8 get_index_by_dt(u8 data_type)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
> +		if (data_type == formatter_dt_to_index_map[i].dtype)
> +			break;
> +
> +	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
> +		return formatter_dt_to_index_map[0].index;
> +
> +	return formatter_dt_to_index_map[i].index;
> +}
> +
...
>
> --
> 2.34.1
>

