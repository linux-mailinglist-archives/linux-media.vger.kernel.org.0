Return-Path: <linux-media+bounces-42240-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED36B5243F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 00:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F703AFB74
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 22:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB1330FF3F;
	Wed, 10 Sep 2025 22:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lVVTrUmt"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E62FE58C;
	Wed, 10 Sep 2025 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757543605; cv=fail; b=NxK8VFAxTpgSpA3P048ma2xA9SP7FoXgSxTtVEA9AaC7cyNl+22XWBlcPvXbq6WEgYY/TxHTDyhGbWrCumkhmcSzQiPlvyGb7QBwJZINqK5ip7RaqDifMBsh2iML3IjfiTq85GFOu6Epm3jaiAQ+4emmG5beOnaF8hq5456Fr7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757543605; c=relaxed/simple;
	bh=05LSgXD0/YvhsGj0Ag3gJD/6L2KJEHUcKI89utXkWJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OlsbLWNZr4yAA6GN5vQTWcepqldRsZyf97iy4yktsrWH/KqfMccTiPR9FMOvBHVUDhKcRiTcUOa6Y1nNLmimAy0rWKxQKAeoN3oo/sjxJ3zrnVS6FcNxzBdL6dDYLs2HqR3nTce8Zdqari3bsxGLgZJ1hnubEMubCB9nEzKI1KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lVVTrUmt; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftz2DLuhzLOn1fOfpO37CqSPy+2+Lp6nwAJhTBSQcGhVyhhfa+q6tQtQdg9kZ1pJzm+2RLtplGVbR+TEL229qnV5oQ4IaWBdArcZljJZNDDL7RX52nNHszHE29dtiavZwiq7JaBZPTkfx5DkyxSGY6gKR9x5TfqlVRyvKhYClvqAYBSy6DH87gcRnLAUJcFuNXboPfLMVdJZLFanFB/6eP0B96i9Ral3HbbvXfvAM+Ka2w7/Fa6EDlEoz37+YWOHVsFar6Lv9FJE/FEhJoD4/x9KJeyvcLfu3bHhMZ9VFMzmMWWYhJonmL/ErgkHrtO6xDBxmLun1Wwt2NThyK6zMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqxNIDCBq1OWHGcTs27AxLTFaZkeN9auni3LPolYic4=;
 b=pBXHcLxSs2ofafwk2lgxSlEwQy/8VEzmobShcjn6oc7OvOxSOHNpHkRuze1GO7DFyEYWjjt4tYsA4xg/yIRyv1vNwBPce1rKaV0qWoja5weyu9qVqHRbCUtRoMiPjKFS2Xvqri9C3B79EJysxV2X8EdXrfE9708QaXwfLxa4hkOpS3oEdhPnCqt9rWtghKcvgyr5kIwi+oxbCmyGxDa9UzggofmowxWmCX8Q7rmvySMjfJgbeIjTQTYg4UPjv/p9NFnDvnXywLvaAhZSbr5jlwUAKeHcTm1LTTDZr0inUbJsmp1Cssc56/xKnFMOpArbJIIpOPybl4yXF7bqWbkm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqxNIDCBq1OWHGcTs27AxLTFaZkeN9auni3LPolYic4=;
 b=lVVTrUmtG1frsZwJc/UkpRwzXSmEEKzWwOGF+9zCcxJ1d/xPgNPz/WtXTSmHFededTB9XNe51/9Jfk0sb52javBCozV2dee3IuAgtRWVpGAXnPom2Fo2ATxk1fr7zOnEZLXE0pRQ/wOCPO2r1KkQUHLbNcIZRo91gl7YSG2yLkkLEHjX9URAyOinLrzSjbKzfV0gsYxkTOuzjQbVIbT5Me/kf3JXDCcjw3lQ4/rZyYsdZkgR/Nu28aIacobyQtbDIoPe67WDYZkMhrjOKibtR9ajOGvW4r2ffH+qKcPx6ZRXGE+DuyooSfd/fxCLzfNoasdYRt+7JaSSxSLmI6hIkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 22:33:20 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 22:33:19 +0000
Date: Wed, 10 Sep 2025 18:33:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Message-ID: <aMH8pxaiKvjW8dw/@lizhi-Precision-Tower-5810>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
 <20250910-ds90ub953-v1-3-a7813ffbdf11@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-ds90ub953-v1-3-a7813ffbdf11@nxp.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 991d8ab4-d23f-4764-ec9b-08ddf0ba0b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gDAPXy9KuWMPoDmhpIYLII69wikg9cR2fiI3hRoI7SDD6xyZoFMnDUbZPxLe?=
 =?us-ascii?Q?ZZzRRs8FdBNJPotQ7/XxPeVp5A6p61lLFQ1Hlal1jgcEIKNqfKQDCYR4eW3L?=
 =?us-ascii?Q?bLWwzEdMLScsVaReepCctNmZgUXSA6f9O5/I05/IPP3l89iJKcQ+XVf/Lu2p?=
 =?us-ascii?Q?1au4n5VjtumZXNPNyLEE8LrPS8W1skEoWBblx36DTb5WHigVE+tR10w3WVT5?=
 =?us-ascii?Q?DHKIPEMtmjK4x1Td+T4oOu5gal2nNq+6LD6jzBi4mmWCVYTt8bosuYQvSPYZ?=
 =?us-ascii?Q?khBjsLc+4RVF6z73x6uWGd/W7GxA9kziFcpRGRPtcrnhWvUw+GkX4CQkWXQg?=
 =?us-ascii?Q?em2kXDVvrorygamMAaTE896mEPFnO2sjWPn57diVZxkoQs6qOWu+upkDiXmi?=
 =?us-ascii?Q?JbXAbABAv3xVLCxAqZDOEU8dLfGT+ynwkZso0pgj8LKZjsuOc0Praa6eycau?=
 =?us-ascii?Q?7O9bt6L5UBUdSg5JUtf7h7G6rtu8e+H1INiAFu/zlffC6E/bqqnzKgSmnBbr?=
 =?us-ascii?Q?PXegVPrXaGrnJMXOzIuApb6K/nlre0QljlHOjbr0MueaGwEJailwqBMcSDG7?=
 =?us-ascii?Q?yHZnjHtRYGrGPZWYhxDoiaQ7Krhr+GCyypRfxwueaTP70V8OLOIqFzOKoL9q?=
 =?us-ascii?Q?wn0UUN7/Ox50FTLBZq7sdNbGDB8/5qW3Wq5FxmJXenIllyUViMyffPDMHqN4?=
 =?us-ascii?Q?VQB65cJki4NoYa1DhDoFsCt3so5SVjLU9puSQuFrOkH5MHMXtSLvT7urvGy6?=
 =?us-ascii?Q?h11+uFP+sNVhnUpScu4VEladN14k6YjjiK2mpsJEsXHE04itIXqpjU/H0cF0?=
 =?us-ascii?Q?+wxFk41WKZG5J/1EFVezTgxcCw8fRa7QqEa8LijuOJzlOLc2DcQ+haFKMEi0?=
 =?us-ascii?Q?/J4EdouHTt8GmmsRuwYUOc/JLZ9jfgKyRHHwx26UwyDpVNMKz5Z4VoHntvle?=
 =?us-ascii?Q?/x2W5jLCQHlynmZnqfoNFlvEwM7N7fjNCefsP3h5W1usOjqWRH5EQDlLXnJ0?=
 =?us-ascii?Q?eTG6f6BJaaqzlNwma8sZyOIQBn0NamUemNQQC73ikqm8X32djpQU9RBLHxWf?=
 =?us-ascii?Q?WzsAwVY9tQRTsh6AOKW/tG0GhEMGTGqo2R42XS7wfMiD2Ea2s1Hvn6WXz99p?=
 =?us-ascii?Q?0huUw2PUZwtUOAsjA7HZcaCDWBNAngum9g73s83Edsm4ZZOTOHUlktQOaF5X?=
 =?us-ascii?Q?lf0mGbZweDO89gTYr5VLEguABhs6fsvF6v4vk21zoE1ZcsxvUnisCw02nHqb?=
 =?us-ascii?Q?Y4i+EDCHP7qbIRxTh0NhKi095MwJgHrGfs6kOqOvMY6gbfW5UI1uxkCPXxNE?=
 =?us-ascii?Q?296x4zYezgIJbWmCDrkH1e7X0ZavgB+dmNgVW5NNODfB7bFUy+8KMLt3H3II?=
 =?us-ascii?Q?TRwgCe++5hEvY5u7jSjMhCwTPZIsPxeArTfrkQQ4eWbauw4leZY4O/ByspfL?=
 =?us-ascii?Q?/LOSMhCRfuzsipEVFJKSKUsrcTssHaVdv/lJLfBFTuCPr7Ay6N9Cp4mdMz4d?=
 =?us-ascii?Q?cJM1KpJnb6tgDRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WMy/3nkjANWbFVPMgVjeCt2yWxq0qKukkWdeifServano0TsgNQ3EPE519Rk?=
 =?us-ascii?Q?uUqEZ6xkr5JmYHk51wtjSAXGXCyXD65oeEgZSb5DFZgDgF/F1LD0XL9OGeJ/?=
 =?us-ascii?Q?NwuYfjMmqA6YWE1CehdlPSeivVGv5qDnhRMh0syP8DhW3lXRXpyfOaUQByFQ?=
 =?us-ascii?Q?KewpY2GSeyOHSUCVyxPWHXpMmQnfb2kEJsvmkDgRvmm6irjdZhKbsKkEDhOo?=
 =?us-ascii?Q?Y/wUA3HRcSybYyEnuPPo8aZw9ao10VwqXDFr7MrKR9E+nwiOFjT+B9m1GIRQ?=
 =?us-ascii?Q?9wLtl1dOiQXNt1zY4gmWwVvJpN3xZki6i2yocUufwJluAAT4ucYicKka08Vh?=
 =?us-ascii?Q?l84PCIc9XTNyPrRaGpg7ndLS+mCpDCEMfXHaNPO0LknSyoRAd2ueVmv3WVpd?=
 =?us-ascii?Q?tn5/57L6n0Q0AY0utyS5M+jM+Q4++dVxrRIZLnnM5PKkOfDcDLJHj9N6GeID?=
 =?us-ascii?Q?NOJszyRxGctG53JLhgnDPWrILGQUpRhxJkgapcYrf0i4/RivcNBqGyFRfs/q?=
 =?us-ascii?Q?pBXgRUyHN+O0BDxx8JkpNC4c9GoKHdlfKZobPoc+jFJXboEYRXPIwtkoR1Kx?=
 =?us-ascii?Q?YjD/AftFkmbOfyV6OeHMNb7TxrLuxhcdOBRWgQNLEzy/vlQE+/89AYIKz5wP?=
 =?us-ascii?Q?vE5ToxwHWUkB6krJdf2dqK9X5feIRA/Erb4Nuuc2BZa17qHEjjS4CpKesFjo?=
 =?us-ascii?Q?yMshQ+GaxO8Ie3sdjLX+v+PdMAWKg2qwV8DcZz/YdCtJDEBPFsCYukbTFc4v?=
 =?us-ascii?Q?twarLyay3orW0vSURPCtxZNpV+tvXUUNjHsVAb6MrMNNQ2QBXZY+HkhZEO/1?=
 =?us-ascii?Q?aBXQM5twFxOHrVmV3X3v2d6LBDIgkKmTaZjGOEXlxOgPaFzPVGEWaWvAAQqj?=
 =?us-ascii?Q?JjIMBvAMOWQnAJovTWirLeo7AbkjvpGx9ZuwqeSaPBBmaxrQr96qrQoMvtYB?=
 =?us-ascii?Q?EeMkcYq8bJXmd3j8lpA3ue1NgrW/uGn4lpqchdPjC+h6ljC0G7fZ3uh8OhBw?=
 =?us-ascii?Q?qx4ke87Eo9aE0vY7R83hTIcpEl6HYi2FKxO3EnP52lzFZT1PUWrAV386GYQF?=
 =?us-ascii?Q?lK2sRFlLlxIDtLaFbuajXS6wWPufaboWocX506NPMhajSnmZJZ87eGYpSXs5?=
 =?us-ascii?Q?xrk9LfFUsQgcOg90aUyvyMk0Li3oKmPASiqpaCmRirsZmdZHApJi/YQxwIVg?=
 =?us-ascii?Q?NZuRcjBJvQ+Qx1ZhmJ/VeaoR9jXezZodtIPVfNSfEwNe/Eoa+jiPEcDBUIJT?=
 =?us-ascii?Q?jXCNkHeHoysgKKxNeZpD9GUEdLH4XY9yq0PQKQzCr6FVix6M2zZgg3UHUlXT?=
 =?us-ascii?Q?P808j6MZWD7mGua/p/l3FN1ebKdhUfTSfm86NJ+bv5HISj7iSAMLM2WoipPY?=
 =?us-ascii?Q?ybt5Q3Sk60AbnkOoCNVZ+hSpwGXVnv584fbaN5Tkmyob2wEfqCQ4svyNRIF0?=
 =?us-ascii?Q?jKmbfZunOoEcXiSZn3cOc04qsmDdmnCMiP06Waoun1Wlca8FYBZYJEwp3nI+?=
 =?us-ascii?Q?K1WYdhTnAZOlR13aG/zbLgsTRKUC3eLxLsAGqvO+RtZreq3hAs1KQHZLcEfB?=
 =?us-ascii?Q?Rovuyvq6/GseYaAx1H6QUySrBiPclarBUCpxtcJ2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 991d8ab4-d23f-4764-ec9b-08ddf0ba0b1f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 22:33:19.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+bYAy3n2JmhcsYAzuZd+QOBXdxkSN8kZt1Kl9p1NFzDfHMBMvzlYrXVJyowRl1xQ37uYYpOhDUJw48HOHwLiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606

On Wed, Sep 10, 2025 at 05:44:40PM +0800, Guoniu Zhou wrote:
> Use devm_mutex_init() to simplify the code. No functional change.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/i2c/ds90ub953.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index 98d6b6fab810a8f65a01a6049238cbf700eb8cd6..6f09322553640384b1f43af0dbdf4f54b4ba004a 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -1339,7 +1339,9 @@ static int ub953_probe(struct i2c_client *client)
>  	if (!priv->plat_data)
>  		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
>
> -	mutex_init(&priv->reg_lock);
> +	ret = devm_mutex_init(dev, &priv->reg_lock);
> +	if (ret)
> +		return ret;
>
>  	/*
>  	 * Initialize to invalid values so that the first reg writes will
> @@ -1350,30 +1352,26 @@ static int ub953_probe(struct i2c_client *client)
>  	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> -		dev_err_probe(dev, ret, "Failed to init regmap\n");
> -		goto err_mutex_destroy;
> +		return dev_err_probe(dev, ret, "Failed to init regmap\n");
>  	}

suppose it should be below pattern

if (IS_ERR(priv->regmap))
	return ev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to init regmap\n");

Frank

>
>  	priv->clkin = devm_clk_get_optional(dev, "clkin");
>  	if (IS_ERR(priv->clkin)) {
>  		ret = PTR_ERR(priv->clkin);
> -		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
> -		goto err_mutex_destroy;
> +		return dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
>  	}
>
>  	ret = ub953_parse_dt(priv);
>  	if (ret)
> -		goto err_mutex_destroy;
> +		return ret;
>
>  	ret = ub953_hw_init(priv);
>  	if (ret)
> -		goto err_mutex_destroy;
> +		return ret;
>
>  	ret = ub953_gpiochip_probe(priv);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
> -		goto err_mutex_destroy;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
>
>  	ret = ub953_register_clkout(priv);
>  	if (ret) {
> @@ -1397,8 +1395,6 @@ static int ub953_probe(struct i2c_client *client)
>  	ub953_subdev_uninit(priv);
>  err_gpiochip_remove:
>  	ub953_gpiochip_remove(priv);
> -err_mutex_destroy:
> -	mutex_destroy(&priv->reg_lock);
>
>  	return ret;
>  }
> @@ -1413,7 +1409,6 @@ static void ub953_remove(struct i2c_client *client)
>  	ub953_subdev_uninit(priv);
>
>  	ub953_gpiochip_remove(priv);
> -	mutex_destroy(&priv->reg_lock);
>  }
>
>  static const struct ub953_hw_data ds90ub953_hw = {
>
> --
> 2.34.1
>

