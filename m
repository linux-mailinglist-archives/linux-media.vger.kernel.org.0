Return-Path: <linux-media+bounces-26317-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A136EA3B000
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 04:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D025E3B0E2E
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 03:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A541A724C;
	Wed, 19 Feb 2025 03:18:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2103.outbound.protection.partner.outlook.cn [139.219.17.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7561E192580;
	Wed, 19 Feb 2025 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739935091; cv=fail; b=shrsfuHUV2NSKW+1GUXv5GMtv+DpFkLI9gw3y9R68EIDzDSO9RUqWYpJK+hv39RVXhIYnixvQ3RVwFWoE42ujjVURDMotbB1Tl4g15REm0Nx3ozHli9ha/MIpQ+q7SmUlQG0x/W1LRgpyItu0jUhiEsA6wqA+/9xL36yTlel4rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739935091; c=relaxed/simple;
	bh=PAOa5AhE+tueJ4BfaY+9+1ROLLwdtr+t2qoHqaDz2Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tUEe4Ak+z0xBHwLyOtZVe8vJ0jnTR/f+UWB48ygZta07uR3LLbICdcU9DSVMmdwch7ce5OBUfZHzRpfe79joH3WYlmaQNKiwdxu02s6BR9ang/EYn9QElUJgpYvGTHXPFjBRbC1QBGyP34C3UvU6Gj5ZbzDWvF/F7R8Vra7DcRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyohsQFuqbd5ND+AijaDs1wAWawRNP6xc48z9olL/7tYIHW5XLIE1b+a1bT8bzqal/ubbSz4m8NsN9aVAKxDETDqlDEJpiVHKTF7gCdnyVY/RqyWCfTLixiKFX+MWFGRkFI85FTvViGOR1NZMXoe9fFrMBUUeCpesZeKI70jVntI4I2w/XL7+cp6qDLgyQPYVvziy34lUO791Y7axGJTyVDABjmvDWb1+CNl8PLMJMlGL1okKEiB6yKoB5OmOMAXYZCQAQtG9Av5/VR3mNSNRf5qGRoH+nQpWAQmeItFLIrdqnBbdId0wiVDlIszPDBET+LbRk/zn7T2plIFRj2hww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbvreYo46K1RCYIIzMmcY+A5c2mAQ13MUkzi4qZkv6U=;
 b=PE4f5tBgebk6JtrcyitCLGO5MW6XjsBKRbt1+xEucriLO1kKX9m7yFqVBNkFGlcC2tKgXSgtoV90HJEyxawT6I7JD3zkokH73f7tf4wK3bvisQXtZQ8tzj+isXiunKKkhqUF9QFIOojO/h6nhccXTQd2laIBbkIp+crCEDeS9YTzSLLs8vceJYczvpV40H4ouzTnqlUhVcBYB9YnO8h+cP2auh8CF5sp9QEWxIPdRGNqCmngEUhPiHxSc4uoYhJkZqqtL7N+5bMiXgQGtYgVDqv/Vo+Tr1V/tA9ezplohMimVF3eqUSs9jXTsOcFwmE32QNDStkh6/2r4ihkrTQ9PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1064.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.8; Wed, 19 Feb
 2025 03:02:34 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.8445.007; Wed, 19 Feb 2025 03:02:34 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: y-abhilashchandra@ti.com
Cc: conor+dt@kernel.org,
	devarsht@ti.com,
	devicetree@vger.kernel.org,
	jai.luthra@linux.dev,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	mripard@kernel.org,
	r-donadkar@ti.com,
	robh@kernel.org,
	u-kumar1@ti.com,
	vaishnav.a@ti.com
Subject: [PATCH v2 2/2] media: cadence: csi2rx: Enable csi2rx_err_irq interrupt and add support for VIDIOC_LOG_STATUS
Date: Tue, 18 Feb 2025 19:02:26 -0800
Message-Id: <20250219030226.535893-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217130013.2802293-3-y-abhilashchandra@ti.com>
References: <20250217130013.2802293-3-y-abhilashchandra@ti.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0004.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1064:EE_
X-MS-Office365-Filtering-Correlation-Id: f4977859-fb59-42b8-54eb-08dd5091dbc3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|366016|41320700013|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	xhEXIeudBFTiR/c0eeOtxEXfd/7jJcJQhP368xO/Nte96DHuSQgXuavsXCpbXh1xUVhgqSINTH2154X8OQNHtL/Fs11VJRADhv9xGTr4vp2XwA0v/OawOc1HdMZtr3Q8fPyCf84/CbuHJCSlmuilONgNebdWImQOuAp1KApMxOroKcZUPMU+AbIn044r5Hjxig0IAKs7UfdM+t/pXSKP2vRuTKpQEJLTCxg6g90g7En5zVZDH7ARz/v499bCiJ5YHLG1e/y/4nNskZpnS0L6wPYHyZtKoZ995Df51glbilnCyCDF1oe7/+/W24UW4a9zGPDxjuTX88i7eRSu1GpFu1R22Pq44UAGlWdaSo6ZelKn7oKaiWBnL1d4SKekgDMGN0gZf/sERRk2FUggs0uxPH0HD2rx3EYk53zpEfDU+x/qRKjhE+R5KGdFZVrZl28gfM6PPzsxbYR8pgf6TZIZ65XQyKQj7+zyR/ke+O3CMN0Jlwi878o9eAfcjdGYyRpiVHKJYlCfhHbwb+aw1/idgFRAkOm7aO2AdbePNLG0hqIHntS8cX1eu0SgqKLPiYb1xuUQEgiM0j0iKZxVAb/NxuQejYKbcC4RRma5RI5wqUQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(366016)(41320700013)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SCdYeI4ZdQ6orULuw+VQ/sGhzNUXZSfEjpyBRxOfKh5zkGGEVXggrt14xC1X?=
 =?us-ascii?Q?zQX2ms1n/aprR9nQpmC9bYoXqrKbDKJtcCx7/KoGNu15r4F9KhfDWcBPRsXL?=
 =?us-ascii?Q?tFVRipTdEs3ptP8/UY6gRQpQBzmcxNXACRc8GHVRW+ssUgdaBWd3h8XkBjjN?=
 =?us-ascii?Q?BDS5euDBkB0JMc2ywKY8EASbK9TPVFk0dqa5cVJT1wLKOsKErT3tkSxSeytZ?=
 =?us-ascii?Q?mxYCmuAmvNPjKjFWNTd7bgfUHNYKCrxhR/uKvI0SBvPxqmkjbQOLTu9fVkF6?=
 =?us-ascii?Q?mXzbvgSpMjH4WZNRJlpGYHg+slhAM1ozlu3PIC305no2ZF70XG5k5haeglS1?=
 =?us-ascii?Q?tNbjrkbb9+bYiMVR3ohetfNLs7B7mCI78RskcQVHbA9Q7vm/gI0n2Kw60Dvk?=
 =?us-ascii?Q?Vs/NKNMoK4ZUlWWBpsNSXymPtPl/DaN0UP0ep62i1qXHVrgRTrUAdQ03J96D?=
 =?us-ascii?Q?GjtppKa4B/iBWVKik64/G4NE+X5/ucyQsg8pI75YhfTIQGy4hTOLBrE558/d?=
 =?us-ascii?Q?pfIU57cgGGtdxBENkgDAglMHLMbNyjysAWGdpGmcI6CTZZXXAIC977ECLkBk?=
 =?us-ascii?Q?Rg+bdIM3vkROEp/wG7+sbPQT/7XFYO70oYt4ghawKDOH/R/Lzie/fZgAPQ0H?=
 =?us-ascii?Q?H8MSj9l5yvdkTcjb3R0n2DhdK+62aPSC2VZ4tydkiO49F2LnmPAd5NH/bKs8?=
 =?us-ascii?Q?6yrySONAiTIjiaxEtvZmJowH4VZ7yEiSy3Uymm1deGDzBOg6W2hEWMQrRMF8?=
 =?us-ascii?Q?aJsbUkCcqnBqicGOvvqw/nK9e1RAEo630a6b6YcFqB0LW/1NFJtdCsT6t10u?=
 =?us-ascii?Q?qPxWuhbRxfLSQD9yCQEr4yZ7as33ObJrlbbTXj24sxXSLGAydbL23V/G1sl4?=
 =?us-ascii?Q?3toa/YBSUuvGTMUbGjqBEoylZoW133wgD0cuRWs7LKL1+VQbIGIMzX4mWB5J?=
 =?us-ascii?Q?NEIbMSuaa9MnyZqKV9jycQUAFog1PoRbjtGWr/4SaoKDYsFX925wr8rDfGgK?=
 =?us-ascii?Q?d/NmYfDgVAUJFMTN5iPrf2JI5lycD5KMwzkeIF3Uw0aKjfjrd3TQ++xWMzyW?=
 =?us-ascii?Q?oXnCxXvgeeMZWYJ0ze2qrkr5ul0ms9t1ejxDE1lqYzGlczot6aLTQAJ42OuW?=
 =?us-ascii?Q?CVF2xqD0GOZv6MnyY9Py023tD3l3PdW6mfRT2Hx/TPGrsQWbZDyYWULiOSJd?=
 =?us-ascii?Q?02Pgrw4afI0Z9SazhlVfWKod/Tfn/An1Aej4xNQtlbJP4KWFrbIu5s5qKDwq?=
 =?us-ascii?Q?03I6oKMcwIly6ykSv6lRHuYhj9/1XtUfdCyp1LeUwI3c1eFBPVm1qUszyklr?=
 =?us-ascii?Q?jqWvMMtg3nIljArowtGDSnQmZ4JBKh7Xd3KiLBiu4/RDpvvChkPFNZrBzLkf?=
 =?us-ascii?Q?FwfsxVA9wQegB+5g6MiHkn5c0PWoguMKJqG48cXY5CzxVg8L144zv98j66EM?=
 =?us-ascii?Q?kCcStw7an4q6ehJsad5fkkqIfpVumVZ9sJerlfQ0ixk32r5bEuON+tusOPTm?=
 =?us-ascii?Q?NY55wJk/CWjCTE27gcCYDAnp4NoJ0bimikebG2DZhTeib0iFa/4KJVTC561W?=
 =?us-ascii?Q?sPsi2ANNB9zmK7Gtd5xpKBVNCMYarvG/Lo204QkV8gtBuUISPqgtOsQ/vLNi?=
 =?us-ascii?Q?Cl3ucVJjLg7mdLdoFx59+48=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4977859-fb59-42b8-54eb-08dd5091dbc3
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 03:02:34.5697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttko9GAYti/b8ZeE0nsR3JRe9maNOexKHvdiLeSlNm4VohDgzV+Fvh4fqXwq6/Jj4IcqcZiInarJzV48K74I5QtJPLhMteMXJR/Ngq6g+5IfNLVdvlIigG7zLssXZG41
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1064

> Enable the csi2rx_err_irq interrupt to record any errors during streaming
> and also add support for VIDIOC_LOG_STATUS ioctl. The VIDIOC_LOG_STATUS
> ioctl can be invoked from user space to retrieve the device status,
> including details about any errors.
>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---

[...]

> @@ -665,7 +752,7 @@ static int csi2rx_probe(struct platform_device *pdev)
>  {
>  	struct csi2rx_priv *csi2rx;
>  	unsigned int i;
> -	int ret;
> +	int irq, ret;
>
>  	csi2rx = kzalloc(sizeof(*csi2rx), GFP_KERNEL);
>  	if (!csi2rx)
> @@ -703,6 +790,19 @@ static int csi2rx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup;
>
> +	irq = platform_get_irq_byname_optional(to_platform_device(csi2rx->dev), "error");

Can use the "pdev" directly ?

> +	if (irq < 0) {
> +		dev_dbg(csi2rx->dev, "Optional interrupt not defined, proceeding without it\n");
> +	} else {
> +		ret = devm_request_irq(csi2rx->dev, irq, csi2rx_irq_handler, 0,
> +					"csi2rx-irq", csi2rx);
> +		if (ret) {
> +			dev_err(csi2rx->dev, "Unable to request interrupt: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
>  	if (ret)
>  		goto err_cleanup;
> --
> 2.34.1
>

