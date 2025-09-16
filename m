Return-Path: <linux-media+bounces-42624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C1BB59A1C
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 16:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEE81C05E37
	for <lists+linux-media@lfdr.de>; Tue, 16 Sep 2025 14:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24E2315D42;
	Tue, 16 Sep 2025 14:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Iaqxauxe"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4D3081BB;
	Tue, 16 Sep 2025 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758032781; cv=fail; b=XoPK9WVP2ky1g/IqxIcMKeyo2rSWPm2g0tMrcHdBm03btyja8Qu9hV+XtUTsk0xqdlGR9Jk5t+hBiyV4Oglb3sJEx7QAGira6+vs/j+ZlxVpvJfHMit8rPvvHm9ogNc5EIbMG2xmVrSOP1691h+BuLxuS3gzG2V4xnT5LlU0oWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758032781; c=relaxed/simple;
	bh=AFuToyTbzSkpuK2llj+sDqvjNQPLD0MHiniyfjGM+EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=scqpA1bZVL8Ome4S9Pqb0i6iPdoctd5QtwtyksUsMfKNVm53C27KwY2fYbZFd25cy++yB7halR5YkAdSSHPwDN2TEos5R1VEApSgEN4+7Aw6N87vBM+VsLDhROcN5FCTrYeMWN+vKlqnp0r5pcibu+c5xwgV6CSkEGqrg13LxZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Iaqxauxe; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOScx/SwuJSl/zFFmdpkUA92b6sitpmFWRDZGjorUiJp9h0dxRsoKO2fa2NeLs77ILX0KV/4BsyVhbJ8yAVI+jTlTEIBFZS/+3lOY/fTMwmN2PFF3yQTYc9OB/y3Ri9gLUhjU4t5ttNRILmzmO/Pb9/oYDBm133vESR4x5nW8k5emHgr575/VULO5+RY8N44+yX9ZIPhdMvLRU3DNKIs9UoxWqnx4Zu9fOLt8VknAt2/3+1v1tEfIuGcVDuH/EEu5y2ZjVzLN3l+DFdyR5h2dpFYtCVlKqDw/tE1Soo8d1Ges2UOBka9qaDvOPkjbYvbQJowua7tyTRtbCFd+XC6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Behbrvo3ApvCvj+bC4n9hN44jfWkLLWqnrq/efyLMg=;
 b=lpQAxvbqYjUntum6FkOPYmNPD6p7w4KVYraw771d4sXM68WNz9UETpXdeOrQxecYD04XHr9b43QEWCUMgt6DwZ5Ue1+LKGMHta9zGWa1bjH1dlyGV+G1/7wrpWrnh3jLn8eRNs5anMOOwpGzNEptAs5vnit9DNkygy0fYDB47nKlh0MXIXx1gTgJuaq2QlblE0XlnG48gnbgASWM1GeURZtLo0sG5b9VUiV+4olqH+o3k2MK/66bM1NiZAhEF2aIlLRJRWuK2ZTJt5rZra3WzQnKFcP+TVZ96l+UsmqHoty46tbkk+zKLbDtvWEHNvmviKnMt2d8aYhdusdvsyGyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Behbrvo3ApvCvj+bC4n9hN44jfWkLLWqnrq/efyLMg=;
 b=IaqxauxedeM4Nicw57TzK1HIMxQSn+GJpSu/Tw9Gos5y3qkOylF6vhJVUIBF6vtaZt+HOmKH0+JGzeL7fZhdP6ohkNHRxxzI2RXptlblqPR/2gnlmU9R1IrMLgxT8fTpvpXJOWdcmNmCta10StbgPmoCj2oPrh5sWC29y2lQrGM4Ex3r/ISUJcUFcXRuiC4Ld6fFg5ARuwI5oqYsSds2fEXVXLL1CPQ5hI6CBACv5NCxZwAdvwAIsx5guWgbZWTRMCJ00lbdlEOF22euFQJkYGHrnKviwFMv81bMqEubF88qFrdwkF8RJxqe8JoT2A5eHseQnV99aoKfIzamE/22qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by PR3PR04MB7228.eurprd04.prod.outlook.com (2603:10a6:102:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 14:26:14 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 14:26:14 +0000
Date: Tue, 16 Sep 2025 10:26:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Guoniu Zhou <guoniu.zhou@nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Message-ID: <aMlzfludCGR/zOzY@lizhi-Precision-Tower-5810>
References: <20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com>
 <20250916-ds90ub953-v3-3-bb7bc6545da7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-ds90ub953-v3-3-bb7bc6545da7@nxp.com>
X-ClientProxiedBy: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|PR3PR04MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e1135c-7981-4c20-4562-08ddf52cfdf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XykC6yhvqujEgJbzPBHV3Xz8XvjKErnkIBtCJnyQtPMpQuA2OKefNhBNNJwV?=
 =?us-ascii?Q?iLl3jXmKSPGx7JGq1RMKW/j3Oy37KgvrRnApDDmtiNmvt2IY1ALqeEtZWQ9l?=
 =?us-ascii?Q?8WHFwIa5gRthE76UaX/fiEk99q1fF9fwDVfA2+BkiOMEAOY8er2IOwncxDIC?=
 =?us-ascii?Q?XeXUysmnwAjx92I3PMx9RnmZM1q+Udc42hjKKVqzvShfVLDhE5jtgMMIb0mx?=
 =?us-ascii?Q?m4BrVyxcO357lhCVzr/ftTNyLTziJ6H5eouzHG2NUSx/AibXW4WIxsGbsd57?=
 =?us-ascii?Q?orkZa/gVcU8nYC1bSMWv4ErjSjRzN+aJk5ZD9MtdP8dHjewEjEoM3YBjsbEV?=
 =?us-ascii?Q?wOpQot1jVjkh3JOmdOyhMP7+viiE0mTVWMLgbKuSK5QwW6Ku3yeQURrdgK2E?=
 =?us-ascii?Q?mH2sPZoXzvm+8bwoiv43rQS0gmgtvWe+kIQIu6IHQAdyFuZttGl2Osj+gpHC?=
 =?us-ascii?Q?sIiTlpVjO7opU/ixS7Q50n0PxYNaANHnYC8q5OUYQJeMIbOIqysl2rZ1VfkI?=
 =?us-ascii?Q?MarkMpEa2JetdPsPFNgl4Ug78d0gyZNPGpYzEoBC33qQIwpER2dAt1590Drm?=
 =?us-ascii?Q?/OyTE0hbOSNd5tGg6HgXI3f4dh3gCc9dZEOXeAtnDFha6JXq3ulfviGtzepG?=
 =?us-ascii?Q?W0Ui33+yMEzUcgVTtD7s+YRV2Jvr2Dz6BXj4s2Q4OGCk4zoi189NHL+5d1WN?=
 =?us-ascii?Q?gmW8k7Ns6PycglxuiXVZmsFsY4dpbq8Qj0JNeh9NYaFRWJBd9Yuygqy6GGNG?=
 =?us-ascii?Q?z1MZPOF1+Pq/DMq7JxbK/epkquThiJkeL7AwR+8TYgHhqtnw3mOGcCzlcd8r?=
 =?us-ascii?Q?Wtxow30Soc7sYFDKqUIKTKbrzaI5tP4xpx60wqNXR69Dr229oPWTHlQso+u+?=
 =?us-ascii?Q?tHfvFFSoH8iESTU0sQ5EgZsIPaBMYr7KvntflC2eRf3xuMcpeZsPQGiV3I7z?=
 =?us-ascii?Q?gPEy7mN10DKEX9eIy/abbkUgnhXyBjlWIBNbhktaIFnfvonEwV2tkBWx9jIe?=
 =?us-ascii?Q?8jpyqRWSJg3I1QrD0Wjohbh++oMxYrvHYZ9ANcok6XJ6iHIbjFfa6YZwE5nF?=
 =?us-ascii?Q?hy0ozM8wncri9e3fpUwQqh3zFOsI4nTNfh1fqT5n7W2hOt2AQEGZkx2bOgVE?=
 =?us-ascii?Q?2Zw+eRbZzgO6L8uGDh4Dx0kTT8p4Q41+YeBymfrHRAqnWy5V6MNUMIfgRW5a?=
 =?us-ascii?Q?ZBugxW/jn3eLdV/r6w4mlZbU69knF1w4pW42DHHiDsmTuctmkubzJLYAlWIT?=
 =?us-ascii?Q?9UESnQa/sakuBVBk+Iyr0rZOx09M0nqpUOH29RYvqmelWbinjvZDsWq9IG5N?=
 =?us-ascii?Q?lON7ok52bKfMUR9ElHRhKZKc9vEF072KTyxf6rNsmUXx0h8OgAbFHhnbUByP?=
 =?us-ascii?Q?I2t/BsiE9rNNfhmcxAZfZDXmVmsGktV+4g62acwcgyFjMM9RAlL8B8ewakba?=
 =?us-ascii?Q?ULs1XNF+gaY5FmBZGLf303UNiEXzm7G7JunzqS5VNR4sCnmQYeJiDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?seB1LvamMADh7t0hyVqTGC01iTDSm2OEG9YfqijW5rbk/988cfpCIJV4j1wl?=
 =?us-ascii?Q?d2ks5JX8KLnQD6jhX7Qe0FY03yuIKv2x257v76niIfMdIAXtnTrLo1aqxh6X?=
 =?us-ascii?Q?0p8S1xBHDEFhgWtG1sTjtUSBoYwksTG0eSIq5lvYDnkbcziLaAMvhloWX/jk?=
 =?us-ascii?Q?clCc3fv1IhaPfsRi2jGQ47/T5qwFhJKZOp0FwD1lf1D5yTOm55uNnBwPGvTE?=
 =?us-ascii?Q?g3zsuQSDxsBIsrzsyF9aj4YF2bQaJ9bPYNGx1GeaLCKkcj6dS8oRHIK0uE/5?=
 =?us-ascii?Q?qNnTQTWt+1eyq1q5b9DiIQ4BlXKafXLsKpyRUwNGxOQ1kGab8QYHNNagljZt?=
 =?us-ascii?Q?v9CZDxVUHZNrkRbBd0BXa+wJ7VbT5TUWtZGDk9cWkYj0m1pYC5Ba5c4Szj2m?=
 =?us-ascii?Q?tKGoRtATHXpiwvUq139CZijYG9yE3QeYx3vsW4G8b+yx8LcxrigXjAbiCjPa?=
 =?us-ascii?Q?WYrnupPoujoslnPIOGl5E0beXaQtZVeMOlAAcT+eS81WpXtuMSFRH9PbZpi3?=
 =?us-ascii?Q?xtglCx7S3T5fTxE0GGZZLL/Ddr0yfxv5l1yEn2fyZelvhBsb38SYe04UNzjU?=
 =?us-ascii?Q?y9FeWs2y7QauXjg1kZEoTMbBOAUmVYCGmozXxSf4moJu+3Ingkd5GpYfF5bW?=
 =?us-ascii?Q?t5oVfM4omYQFi8jX9OLVqFoNPaqOF51u9RM55OU1Ub2OsdVHs13P3i1IqNZy?=
 =?us-ascii?Q?TIvaeiuoqs5bpbLn8FQvAAJsy7qGYQ46p5ofcHKLgKPgCzOSXeB/oMqDA+rE?=
 =?us-ascii?Q?WGSL8/8ghgM3NfhnlgiD9XC0/wVzcdh7De+hMnEAuicVU1fMHuMmGkBX9K2h?=
 =?us-ascii?Q?x09KPYXj0OaNF9lweFsn6by8BIuakHp8L0xF7t5Pe3lOBBZMULIHnMvlg//B?=
 =?us-ascii?Q?i68Kn+7xTHgnsDN/ZHNBn7RK8pPXImiL4SXL5pAHm/tYljYT2fElPqxjrF3v?=
 =?us-ascii?Q?bOYctVxvomnhW8qpCq1MCaWAzCRqANyhmSLBnjvdqcwhKi9DtRii8AcI6VTu?=
 =?us-ascii?Q?u6camoG7sDBwbRTbxuEx48M4ZDt8xxUCj0FR314fXD/YmsLByh7o4G2xJj/s?=
 =?us-ascii?Q?sV9KL1hlooxPXSEPnNvoJzls1M3jzCNkmmKrr5PiES/SW02Uz+0kL9ivA5Hh?=
 =?us-ascii?Q?Qdg1epP7Vk23nPvOY+iaJZDaI4oAmTiZeqvug7z1Tjycpcwg+K+bRSqnkOou?=
 =?us-ascii?Q?ZWkp0BilXcYqiQ85p+ZkAg9+oXGCEyM2SpVU+Zg3fyy9FNwDuIosrjJgx/lM?=
 =?us-ascii?Q?riG9VxwRjNHUipiJTCh6k/0CsnJQkMAOrGmbo0MHG2y8ptgimUAYLdHctpvL?=
 =?us-ascii?Q?stY1/3pzP76DRopjJu78tq9o5+e0IMbCjcxeIvir2YS2oLJpyTjnr7bIZus5?=
 =?us-ascii?Q?AosEbJqyU8wRnmn7mHwLf9hEipkIIJr0BpXvAklryfhoSkjTDXcnzvof5/hi?=
 =?us-ascii?Q?TXdsnCje9dybA7umQ8H+T9eAc8BTS3uIGh08hzayJ6NUlpoDvZYu1NQ+tg79?=
 =?us-ascii?Q?fZh6BVdJ0cVoAM70YoeOeUCiOGgVMdVwNGHthEmTRqHyHlFnNgacitXbkAEc?=
 =?us-ascii?Q?sBlRvz7WB66aiK0vZAk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e1135c-7981-4c20-4562-08ddf52cfdf1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 14:26:14.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUROaidI2S7lgO2jAX2fR+PA4MH4J3fKKvRUslkBmgTKzcYkamZMpqdBP7mZDCPnHL70Kep3+0UrLsFEzCtqlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7228

On Tue, Sep 16, 2025 at 05:43:45PM +0800, Guoniu Zhou wrote:
> Use devm_mutex_init() to simplify the code. No functional change.

Use devm_mutex_init() and dev_err_probe() to ...

Reviewed-by: Frank Li <Frank.Li@nxp.com>

Frank
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> index c6b77e4982a3449896e564a288ff1562cb1dcb79..47e7c0a5aae7737182e6a1f2797be01e7ecc8142 100644
> --- a/drivers/media/i2c/ds90ub953.c
> +++ b/drivers/media/i2c/ds90ub953.c
> @@ -1342,7 +1342,9 @@ static int ub953_probe(struct i2c_client *client)
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
> @@ -1351,32 +1353,26 @@ static int ub953_probe(struct i2c_client *client)
>  	priv->current_indirect_target = 0xff;
>
>  	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
> -	if (IS_ERR(priv->regmap)) {
> -		ret = PTR_ERR(priv->regmap);
> -		dev_err_probe(dev, ret, "Failed to init regmap\n");
> -		goto err_mutex_destroy;
> -	}
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Failed to init regmap\n");
>
>  	priv->clkin = devm_clk_get_optional(dev, "clkin");
> -	if (IS_ERR(priv->clkin)) {
> -		ret = PTR_ERR(priv->clkin);
> -		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
> -		goto err_mutex_destroy;
> -	}
> +	if (IS_ERR(priv->clkin))
> +		return dev_err_probe(dev, PTR_ERR(priv->clkin),
> +				     "Failed to parse 'clkin'\n");
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
> @@ -1400,8 +1396,6 @@ static int ub953_probe(struct i2c_client *client)
>  	ub953_subdev_uninit(priv);
>  err_gpiochip_remove:
>  	ub953_gpiochip_remove(priv);
> -err_mutex_destroy:
> -	mutex_destroy(&priv->reg_lock);
>
>  	return ret;
>  }
> @@ -1416,7 +1410,6 @@ static void ub953_remove(struct i2c_client *client)
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

