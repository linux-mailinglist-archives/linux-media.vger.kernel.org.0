Return-Path: <linux-media+bounces-23541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B552E9F43CC
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 07:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D363188C211
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 06:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BC915ECDF;
	Tue, 17 Dec 2024 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Jd1pHdnd"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2081.outbound.protection.outlook.com [40.107.247.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733F14A095;
	Tue, 17 Dec 2024 06:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417386; cv=fail; b=cx+yxzsxyRMCBY2kvtZk4SS9lhf9uCGXRVSfi4M024hwhR3Pa6wOv4Lp+fHjuZsBxceNGRyTg0JN3dzrkpU5uGuxwnnk7lIsbce67/M28d+ly1lHFrXFCzTg+15fUnfsYoe66rH5pfjcl2AsjfRkzQ5dkuk678sTr+csz7u9ThY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417386; c=relaxed/simple;
	bh=uYmd6dyOoCY/88iLNR3CwSMu6WS1JHTyZpTl00S98Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n7yNR6yz74Z9DDyATS7EZ3LgU8ssUqQiH82ZEKogHmVwmERdNOKt/859+IX1Kc6wF1IakzvOeMlmD8JzdQfb7gW8sgafcjajOKtaoWHuCyrK5LjwbulE1cLWMdxl+GWC8+PR5lSsZ1UfuiZNe0tQDtvEaBtU0Nk0WjHclWomFbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Jd1pHdnd; arc=fail smtp.client-ip=40.107.247.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9Rez+c1rwSE6THsPcuRZR0ItqZq9UxQCuyfmblY4ylqhXC36XvIksM8c0yAJuI9Ga65bY3qhPBb9HIyQoPIFdClxFoy9V3676GjX5CwmDeKJVFyQkqbf4SVFFgUHi/vSSP5HvFjUDi/LpxLj04gZANSWsJCkNNf3qAdpExO2E8v45AUW82OkJHctWakmEKd/2TPPs80obJC9gguo8av1oe5JTnhszPHa97n5u351e33MYqSimm9/6PtNSlJ3IoLDWfQht9ZZe5aHBeoBBGmNCsM4OW2dcbQdDYbpQutSjkWcrkC/Te/kDDUx5PrupFlTix5hCtO1GXHAFVNzgnL3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzAWgcuFFa1f/2lWgxcDkis5aZnGb8kYZ9OCDi/Y0dU=;
 b=tKAddPVsI9OKGJ36dbLOS08y9nqaTHmsONOFENnzqcOkIH+BQYoLepvBEsppAEcdpQ2cbVCS1ybV+/vDeef8FC0Db5jStXm4HffBJ6HEzpsqF22nb3H/L3vjSnMqXNZycOb0YtGEpATstowpGojirK8ZiSwuWccCUx5rHrNWfjF3VSd8c1bEFaBoAdVSTRhWSVWUWgvW77UhB5e3qiOIn0XDLYmYodsiKEbn64o/P9yX5g1ZsI3cMyoRCp+8KQ9njBbdnNG+6urO69HbAtdkHZLFN2rzZ/GRMlnseR1b9RlkvD0oElPDUOKdKZOqNHYpu1gFj8nPfAaJTXVO7TPC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzAWgcuFFa1f/2lWgxcDkis5aZnGb8kYZ9OCDi/Y0dU=;
 b=Jd1pHdndqNTjq95M01+bOPavhzJtG/J8TNwZ7iasXo+Vf+Y6CTsIOR5GBNdCa6wv2PQhBPZCfoDfcBK5Zme4EtfKwHt5THjT+kvTfLQDBw75lF+/3fJRZjUpMkEboCMSxiEbGP8V1+dc/h+VWEsUVWicWKSIX87uJkSiBGHfaS7NbL8WY7RTX7qzr2EsgBC5aj8+QpBnZ3tkEg1EGU+4ZzBdjTYFwW1DJ/RCa8BjiCVVlQP5kwopfBqgdcId0JQZ6vA8kaGVY1woDrCIN6sqeYv8hWhdPYxsD6tCsYpyI3mrHaLmIpQnkLqKKC9q3I2AOKNu3N1rU32MmtrB98+UOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS5PR04MB10019.eurprd04.prod.outlook.com (2603:10a6:20b:67f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 06:36:20 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:36:20 +0000
Date: Tue, 17 Dec 2024 08:36:18 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] staging: media: max96712: fix kernel oops when removing
 module
Message-ID: <g4df3ogdx7ymhluac2otwxxk2f2kx3o5ih5lqj525xowgxxlfw@a6cpyvfjvspe>
References: <20241216154750.1193584-1-laurentiu.palcu@oss.nxp.com>
 <CAPybu_2cXu0U=nJnxR+biK1ovXsq+pbcBYVV-C6ZwjWCrtsqzg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPybu_2cXu0U=nJnxR+biK1ovXsq+pbcBYVV-C6ZwjWCrtsqzg@mail.gmail.com>
X-ClientProxiedBy: WA0P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::17) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS5PR04MB10019:EE_
X-MS-Office365-Filtering-Correlation-Id: f2897e2a-cec9-4bf6-c5cb-08dd1e651e38
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2IsM9t9iBa6Q+9+7dvVmzmRoDACNjFWu/uv+z7YhAYyERvdFA95dcsUB7YQL?=
 =?us-ascii?Q?iymyZCS9MZOPS7sFmuD5XGrdy+WCo6fNUkZvIXiXef8N7sIHdq31A6MyMkqY?=
 =?us-ascii?Q?wUkzYbX4PhYEbgN/zAg3qUQCOqxW8CNLFPxhja40Lb7dJqfOacy6L/fHhCVk?=
 =?us-ascii?Q?bP5X81QlQFAaGBKktG1S9Bn8BfKWKU5oEuYuGdXAFLwrlanQWYjNawSlMgWI?=
 =?us-ascii?Q?0GrEY7GhgR1B9FQnOy8CpiCas1mgWL6szqkopEUFGCMHoL9c9RtwfZ9/UooP?=
 =?us-ascii?Q?udQ99VeTlUx00RA1JEcShk0WxD79Syqf5EmFtGnV8G4gl0juXK+2G4EIUVx4?=
 =?us-ascii?Q?RuZR44zQDxrP4iJnSCo4PNIothwaAVpr0Z0PW+GcfeEPZlQwqdmMoUt8rsuE?=
 =?us-ascii?Q?MHpIMP6cenuC27fADbpcN7LG9AyXtKVG1NKIlJlwrGR8C5v+1tBQ+BDccJ5T?=
 =?us-ascii?Q?BSd4ScKT3TbY19YwccHY3joaRtIBlc7muXB6clzU4tEdjQxjqdXXCMIINaTP?=
 =?us-ascii?Q?CTvuE+sM2UXSJlrbaTSVv5EBSjxwtXITXvcltbaGlWNoXMOxWfS5Ud8uyjBq?=
 =?us-ascii?Q?34nyCQ8fH5v6qg82dLMZ6SoF+nMGkbraN9mGSyytiaVhSQ3ZibPqwOjud/ag?=
 =?us-ascii?Q?PX+xJzJh/JrBzlnDsci001xS76BFxul+r0MzFfdCnNzFCYZtw6AdG2eAD9dN?=
 =?us-ascii?Q?V1q8enHJN93EdvHUI94wStWRIxFFoY++WT1OmvR7j3eBVofMgrYYWwt47yWZ?=
 =?us-ascii?Q?10/7I/y/s0CZRvwiW//xDctpquMcGcQTzummNJ2lkGcVrHuT+xG9A5l8tvpq?=
 =?us-ascii?Q?x05G4f4H02aM4ezz/l6qhNSNwJAjXmSsVPC1SGAgLsGjwVQOBprF8voUn8xU?=
 =?us-ascii?Q?eGfO+E5wwIo71LmDT1Z4Mgh4NXiueRXdmsi9MOxz49MS3JOKxl+ztY3p4eSX?=
 =?us-ascii?Q?rxD3gGJ/AezrElBFyKD3u2mTqLlAs7wZlY3KPjlbWiRCzfyr7NjRUDMQk3jA?=
 =?us-ascii?Q?YYpwvd6pc58iNCnMU235pl1Kv3/WiYIUp7lZtp6OAEJj8uKCw0KtZgiuMlHv?=
 =?us-ascii?Q?de2HcF2XV/XuLubymASNwaYCb/cuASKSrMGXssVOw5BtLV8W5qFtsdy8F6ck?=
 =?us-ascii?Q?tkN75AjN2vVx5MOOUjG2ri6SyST9Hak/4do2lCfJQ6jO8RTlVD9t+zWrWJ5P?=
 =?us-ascii?Q?TRE2uZfR9IizkAQlh43Hy5XkaZT0LdiWJ7YMhtbD+Xtd4RgZ1zc3+xI1RlA/?=
 =?us-ascii?Q?jPzQ4ZXPgjlVfchLDGp+fsyo9scQ7bjicutgACNWdvDZK67nwmtax+wiKpdx?=
 =?us-ascii?Q?bSZlXYADuT/bf7N4iRcL2SSmjA4gSpGOLhz7EPNVjzmA/OF4xVSl4GZ+KOcq?=
 =?us-ascii?Q?5LZeZUYkrzZql7f7sfLU99zEzUMI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kdzppaNOHp/sADyB5LOZ98eIx5STcrlEx0Mi95f1gfqqgotx13AC8HC7LZoz?=
 =?us-ascii?Q?7hRqmtLLpSBc+PCIQ1WAraZKGqDRRC9pyD+hoQdPHDCPAJ7C5pZnWj9iHd0z?=
 =?us-ascii?Q?orSJBTYaWrSWYcUGl8wLZkArCGv8NNREYvuud9cCL25RV/hFNWKYPcpVG6N2?=
 =?us-ascii?Q?rLbmTIsiGQMbNwf1ybOBQLIsnq3b6Gnfrj+N5zHiOkQih9gQrA2MHtI9sj7D?=
 =?us-ascii?Q?9h7UHDpX2ApGa0/rQlxihMpO3PcmhYX7FIKpAmkGmd4z5Vj0Wgg0ZcB6gxlg?=
 =?us-ascii?Q?/fz0Bui2IIGwB/I9ErHdlwOpzOnnpP5x9GgnlLhBSh/6N0YVWuRiGr0Rt5Iu?=
 =?us-ascii?Q?zs+9jluLhJB3nw/QTjdkC1o+pqyc2HeXV4vAEFdXbg4vHu2NJGZYp13iQvd6?=
 =?us-ascii?Q?B7IrsxEf7zt6lW9+OSt8IVE9tCj5cRcNyOmDsIeJyEt1unlvxC/ZBcPy4ScD?=
 =?us-ascii?Q?oL4XC/4NjgaWa1ul/xZkoXa9/WsKNVKeksgsTOAQ+jPmcHPTwohoJ8/i/Grn?=
 =?us-ascii?Q?uhMG7lytpLBd++G6PQ+zUWeYlVNiEVXgEsTHAbmQYteIcfGGtDi9JKA/eWJD?=
 =?us-ascii?Q?jJyL2ZHu2J5ZgteSjjlsasqkM2lVeKGnR+c/BnLBEjxcSUzTNHdm/n+a0dwR?=
 =?us-ascii?Q?AYD9mWNF3nW+pjVnxBShEXPQU8dNKf4Qr5rWMUrRFP5AouSTX8//AMtI0E1u?=
 =?us-ascii?Q?oAB0PIzh7QH7fKuy+xcuW0sy3BU5HLdCO+0PTxJ+z+qCXmNM2LRbrDmk5v3d?=
 =?us-ascii?Q?79dmplXkQ4uIigSE65wIG4JFo7Pw6kViiYQGsm50MwFO3xjo+igHpj3OeyiT?=
 =?us-ascii?Q?TzLnckZKigwxNPfO12FNgfEwH6wtvODV+ONPfmxQ3fSGYFJD+frwsgAIENc1?=
 =?us-ascii?Q?Ol9BxpLhk7F8Y0PbQYuNCqehn+DLDfNQXpmlZAQ3jMmW9nQ2DQb99HrPPEFs?=
 =?us-ascii?Q?5BPO7YI+iEkKzEjc3wdg8WI6pkXGO4HwljGm6VRLXSf8iKeLotcMz/gHWi0w?=
 =?us-ascii?Q?jt3NQjmVwI0pNTHU0Lsq6timJ5z9WXqPpvATX46t/8iO/swWmxjOsIjHysL+?=
 =?us-ascii?Q?akmJmtWZ7HjaKPxpUecoFWTa5w38pUlIFKL9AufzBZ6m4UwWthWANPl35KIq?=
 =?us-ascii?Q?+ySwdSE1zJGBLdlD1BVlLKYLUAV1KeUhAFCeiTULeuRLQfho7GvRy+NczShO?=
 =?us-ascii?Q?jWR0cvq4bwkJp3CbHDybhPP+zWf0rsrbWPebCCbk3M9CY5Pxl/7Kp8TDj2SU?=
 =?us-ascii?Q?HPYe0o/TjS2FqlYzPYlm2bVFZ2Rog86C9NxZe9Gph4vAJT4l1vObcn3QfMZY?=
 =?us-ascii?Q?wej/qUVfxSKCtmryueThGxSDmV6rhdh/JPl515OK+aW4GI0DtI6sunTAqpo4?=
 =?us-ascii?Q?5UAz12o3kA2gEgdKsR4QCddAeuzcr/zx1ebKwVwOkDp68aru8xOI3e2H6Lce?=
 =?us-ascii?Q?h2a1Iu/FYGTPboKupShQJROfM1qbK4dG2bV+UeKDRTWAdsl0IiUzzh+F5EQg?=
 =?us-ascii?Q?O+/DWWPYTNXgQzXFKL8kRj6AtNe0ZAd37P3+pcz3K6QOVEiVyj9y8Isse+DF?=
 =?us-ascii?Q?4MEdGbcRwT/8oyjWNukTRm2jCZMkYKVNyDXfWGbj7g9vsKYJ4qoHe6NhHUzC?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2897e2a-cec9-4bf6-c5cb-08dd1e651e38
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:36:20.5503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlUtbS3GRNmZOsItOitr51K3agtfAfCAAbk5wUMBpgLhba+wGwTdExQryMw8pMX1nQaub0dXXT4EK38DCcdyAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10019

Hi,

On Mon, Dec 16, 2024 at 06:05:51PM +0100, Ricardo Ribalda Delgado wrote:
> Hi
> 
> You probably want to add:
> diff --git a/drivers/staging/media/max96712/max96712.c
> b/drivers/staging/media/max96712/max96712.c
> index ede02e8c891c..a47f18d57325 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -418,7 +418,6 @@ static int max96712_probe(struct i2c_client *client)
>         priv->info = of_device_get_match_data(&client->dev);
> 
>         priv->client = client;
> -       i2c_set_clientdata(client, priv);
> 
>         priv->regmap = devm_regmap_init_i2c(client, &max96712_i2c_regmap);
>         if (IS_ERR(priv->regmap))
> 
> That way it will be more difficult to make the same mistake again.

Sounds good. Will fix in v2.

Thanks,
Laurentiu

> 
> Regards!

