Return-Path: <linux-media+bounces-39939-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143AB26F5B
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 20:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E52027A82C3
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 18:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7BAF225791;
	Thu, 14 Aug 2025 18:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BLrChFF8"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C66D3FE7
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197568; cv=fail; b=O7sanKPDIcHKXPbc0dBwKNsfP1w3KLP0vzJGPf1Mphxz8ixJZTfAHX0wcc9pWCWs7jSP01uccgEP3eQB1rfBSw6+ZOIo/jbnZFVmU1BZhTn3lXNbqDl+UdgSTH4khWdOz/Z0Z4uvQMHEf68h8klJae27Ps/9hERH+nd9njDDOeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197568; c=relaxed/simple;
	bh=VoWAXQAsGw+HIO4yVjqU2VzglGts/ACf3mxrPgo632I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OfnimlVuHAlTYw3S5LkbUaEDqmuerPQcB9BA8Kl41iGdGZTEM3g0OB/FNXq8sM2QgTbEl7L+Wo1k9l2JgJzwjuwNjl5ig+qkPj9cKbukqPlJf13QE17rxyDWtsgXD/g7Mu4fyeMQkYEwxw5uXZGSerOE8H1iS7fOGuf9tBhLLWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BLrChFF8; arc=fail smtp.client-ip=52.101.72.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwqqBfJzacNV5KKNK5ksupqp2NXcQsyINGjjV3ShYB0Fb/AjHLAhqTf7MM3fU3b5qYSBO0qeWJJpR7jT5xxyF4ezPLbvdP/tixhsZ7zoqT55rlPlCaMgxScNoC1dKR9TT7CaqQnWB9UnnTjGG2GYVHbzI1XgYljUY1k99+BL2YF/wu/R8ZrrMhhmh5TLT+9UZhXHRPnw89usWx9nZYKYuHUXkmJgcxlGjj1N0+sXUAVX5EHrAdBatN1ubnXArEBia91c0Iz6HGhrS0W1bHNAQ6it4ImIpujolmwM7nyhqwKp0LX0rKuU2NZBGgbAHD886+HNdQahJMBOewCM9OUSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er5vm/coNFxbFVnyO+UrjY0eA/9vKiwI71mi2ZiSBDU=;
 b=taAVJ11x+5N+qRUpO3whd5G/DK243xwdJ3bONX5dHPOSOOKc9mMo/wn+e7w5/AgFrO+VNHF1I35J5jzuDWlC4qsZqpWrVL8OY9wJcZKXiM+7ylw1XbEdRc3phX2P7xfhmbilZdF1zwxHiadzBfbjvR6J8JqpnNSrsgzr7DcfAeYFFZJGX/GloD+OegMYs3RgxhL/F/v7faq+hglhHh8RMyNiI42A4oQxi6gdjQg8ksmKOvOm0V6C1GaaF4MhfkhADHWPu46ijXiN4B7yNo2sqtXp4O08uecscSxgmLlhLtJU1FLWwEeDweyCAKYI/276NiNGBJ3iamt3rtno8yik1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er5vm/coNFxbFVnyO+UrjY0eA/9vKiwI71mi2ZiSBDU=;
 b=BLrChFF894Zvi58SnkkJfeb1aQ2+G/hdAaEqG7G2w0D9BwPwT6wCpa7OoGPWKcKQo/e0Tr+FgI6IXxyLZ9xE0MsA4ijsCF6rYyrf7yXvuiNSSrEt2zuVwnz31+tZ0dT6OZvcbBo0VCEjshwZti5EH13YwB7wVWcJsxuT+8+y8nXqTAxeXoxOZBdDlW8COlMa7Z74S8+FGMcZNXiMzG1JV2+HdBl033EJHPLbaTd5Qx3eGM6ePsWtiiseQibgrfcxBspGys594eBh7r/fs5UgFscS90uAEJzoPsIEyz1qs7lg+IfCL5B4sEsOI2ylD/ZkCrY/oPgY7CBuSaAKOxa8nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7049.eurprd04.prod.outlook.com (2603:10a6:10:fc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 18:52:43 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 18:52:43 +0000
Date: Thu, 14 Aug 2025 14:52:36 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Leitner <richard.leitner@linux.dev>, imx@lists.linux.dev
Subject: Re: [PATCH] media: nxp: imx8-isi: Drop unused argument to
 mxc_isi_channel_chain()
Message-ID: <aJ4wdCKSl3Jyngod@lizhi-Precision-Tower-5810>
References: <20250813225501.20762-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813225501.20762-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: BYAPR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:74::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 201d373d-796d-45e9-9ec2-08dddb63c05e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pUZHJPtIH83CXhwxPq0Sci6mD46QlcTDz8ie5v2BWZkLsZVYV6vPlzg1MXr+?=
 =?us-ascii?Q?fY2BRU8/8GDEpdgvFQX4tMOAhCgPmKu1CCBkbmbA1GGrIknVWhZTtSPILxKh?=
 =?us-ascii?Q?Z4pz9ts83ZUltN3VgDX5agH586QVHxpVQbGikGKKhNAfxpw6sibLu3Py/MRN?=
 =?us-ascii?Q?v0GV6Fsjrf54jZ1VPZNaMpYs/7/SGlePHIB5dQsKs8HxRTdUQjDf6DavKK++?=
 =?us-ascii?Q?Q/nSRstANnJDgOTv6PxlP4hDk1khHLarESOoXfrG2x1tfz7BwqhhNpoUeWj8?=
 =?us-ascii?Q?Ci+cUCB4T5TcvhJRo9FKjCxNUH2UA17UAzNNO0OcA78RkQyZXF7vN1DGi8MU?=
 =?us-ascii?Q?nCQUOH1iSg1Nfp/4e+0jywz6V+hgolXWQj/jYrSw4fJFMg13ywYyWSh0wc1z?=
 =?us-ascii?Q?G1FSPA3AwdKzspS8SKtWwR51XWrATIMKinelR6KyrBoVdTNBYe98ZpVru2pN?=
 =?us-ascii?Q?bDOtjrkK3xPfn8XeWlHTdWZN7o3nKIsHAfnHrb7BHST3tvAYkD7Bd9TtrrGL?=
 =?us-ascii?Q?q+pXj3XCUlsMcASK/9VoNv59OMnqOnl8xwNA0UOq1a5QQrMFbjN6mLYlFjJy?=
 =?us-ascii?Q?U6pbwnCrLq89Xi78LBLevsUT66VB68l9IsX9WIDDL/246LDpzs1HsgC/qxEB?=
 =?us-ascii?Q?u8KU10YPCK7iWqs65iQc3pihVqK0qbBBeSeGGQK8gF7w1xiOmWryhg2pAIEK?=
 =?us-ascii?Q?e2CBIiVmEcr3UdQf5WrZGpmaClP7oDhFxdOKzJS0jAFG23iSFWzGmIjNmOHX?=
 =?us-ascii?Q?LUMDrhqUF4vm6quRN8RBjkcm922NSU7WwRUx9lGXbC7fhDDE/FZ1U/UXECpP?=
 =?us-ascii?Q?WsDJl24YtM2bHYNg+k92SvrB4mRgUUmMiNdkPU9vOcu81z7o/NAiulQI2LOH?=
 =?us-ascii?Q?SN4gVXBQfOEvXObzY43iZhnS81WCnEmCU13P+zNAFOqWvQnHdtai/lZLWh0l?=
 =?us-ascii?Q?sqFWsgvp7grj3PWD/u9WPZLXK2s3PBm99AlxnrTmFp/suPmjPi8NCTJFH+Bi?=
 =?us-ascii?Q?VtEJhIo0ReNuU1xsjyERbtFqVrZFv+snCRUMHUZqPDnAZKU/UQdLcWgbhSMY?=
 =?us-ascii?Q?oXbk2lA6Vfg1Av9/nY2qZ0iz1YzX9V9vJwuYZjBKadnDOGCTP1xzVwvmmI2J?=
 =?us-ascii?Q?vHxN0csybrt9WoFGkLKEKYOnnZ1lReoAkA+PlXI6+ccZ944iKR6lb6TAdgNK?=
 =?us-ascii?Q?FWmVAKTVP2x+Mu3Csnba3u2aH81tWMWWDTLef+P0oBovy3WmRYqCCnkxNBDR?=
 =?us-ascii?Q?6Npg46vpgs1acuzU9CzOIseCBXSYGk2odWUUHfdXikHGcYiauDaww3cNIFfu?=
 =?us-ascii?Q?t95hQxqBUKxR4ElqEZO3jxtAGBl9d1OYtwQoku4tt38NL2GjOkmnAeTsev1k?=
 =?us-ascii?Q?XF5fm40wc1v/xlxiVqNAZhi3mz+17IncaLzbS6caTkWQJGKBhQ4bx/ASxccR?=
 =?us-ascii?Q?TwIK0pajy6rpbMO9ROYIKROmpOhYxjGybVGomLrEKy/vuSbkgwl4SA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5OLrNbrcIbkb8jD8ZteCS4Em7gQ9uPfFjiVglZNuhSUZRELRHBmvf4DPQRVA?=
 =?us-ascii?Q?kOH0ny3MJxPz7XhcpXKRyTK8Wg3/+0jMKighs2VS0llFC9n8Lq79cevEscKt?=
 =?us-ascii?Q?WTo7sjVOAUMdCrHh51jWJzFAcg9Ah+cMfaHcAUspsoUnv9KG5ekR/QAw66sA?=
 =?us-ascii?Q?DpIHk1rmjA6yv5dr1FFIS3SEgoBs9WENTtmuHjd8+xLNflD2PK6CEO0hg6t1?=
 =?us-ascii?Q?pcjnRR43/yTjDir0f375i4w9BKHoI0Q6X2BuTMNTZ4+BGX+aFyZMHaUzPQNu?=
 =?us-ascii?Q?GMvgRps3vDVvC+kPrjFZ/7cv63WZwx69ocmsBSps8seci54xeCYPMjknED7e?=
 =?us-ascii?Q?0iRFMWuf6cuEfwY9iLCu9c0HTgqmfkZZ9pG+Nkqz3kUDoLitzz0mwdHhidLn?=
 =?us-ascii?Q?Yk8CH7XcrXn0THs715QUPZxif3MB4NN8AgQaTZH3IA12qlRsKIu93+DBcT7j?=
 =?us-ascii?Q?UPHLV0vSxMeMfCgd8WY7CuiiiIwWOYn4Fp3qTMPHloHNPfpzv3FrKl25+Rit?=
 =?us-ascii?Q?/ZmPwQud/lMw9HUD1CH8vadIbma66r6SBzf0+wB36b+pCK393aBsMkgh6N0l?=
 =?us-ascii?Q?SBDXahe4rm7tQef34qF31YJGzqh3hiIW+aJlNv4uu/gynGiDDMNRUOoIMmfs?=
 =?us-ascii?Q?h9tYdy8Y2e0iRjbTQTS5KLXFRodoQhHMpJXKYtCsOxx23mMzMfTE8yt60DqA?=
 =?us-ascii?Q?jf87jTutGaRDD7KJJra6a99Z25peY/AZh75hQGwOID2sU7QbP2bEgDKMK1mH?=
 =?us-ascii?Q?Zarm8wZl5ZrbpQSVNGC1Jzq/niitKbFFyxsMP52n06sDdvwB/rQcNz6wsvYB?=
 =?us-ascii?Q?pvJ9NOxfxY7lzXm8KKmpCttdDZr5saMaEzQPMbvPUaAzBcUluUhYMf1J3qNg?=
 =?us-ascii?Q?iSws4R1N7bMJ22cRpOQ+WfsC9wiss+/GBCKmDwae9bvtLK+E6HsXkKiiLzVl?=
 =?us-ascii?Q?Jwj+n1MM2HfCQt6PzaXVZM81hzVtUfWvyV9o0hIqGJeV8YKIQk2pGfqA78k7?=
 =?us-ascii?Q?Eq/FVVhGGCQSKa6ghPFns0qES/qL8LTwNmOLXeA+q039ra7I4cA4foeVglQJ?=
 =?us-ascii?Q?QxHnBneURLX8Sc4MBbe0Ge7X4eQook4dnIFSwOoKnJLyCo/dPXPBhRkSRbUk?=
 =?us-ascii?Q?D9N5HoCqcNT8KVRY6R6uAj26kWnLZvGccVQX4zy3CeYL1chCuhWlHopc5eMR?=
 =?us-ascii?Q?YYrhOnG2bCklJtPsFFglH7Dpb5Rxt/B1c6l+DmP9Bl7vMPDji3qTMOWjAOa5?=
 =?us-ascii?Q?Js4l3rDygPug7Tp3dNvDYQJHSENHIDV+evnNuzFlSZT4r596wsZJ1tZ002HR?=
 =?us-ascii?Q?/z2Ts3PumtPCle7Ci5SB85x8n+PvmxPXXnDCYlT9d2oZJ6XVDZXBEb/XTaaE?=
 =?us-ascii?Q?J3Q6eDLiR490P1HngzpfrvvmZeDrC2kkwyg6XVtIb24pISJNZ/VOD/Wfr6Cq?=
 =?us-ascii?Q?TXVgDiUxG/4ALs8PTxEGj/A4Ahs0xSU8GWV+x/AQwqe7DZT8YXuDT63V2sKQ?=
 =?us-ascii?Q?zTHD3ii477A/i37lY+5tdPSw5f7l28sf0+u49JLe0/9pEaXWz3UaRwUyk3BO?=
 =?us-ascii?Q?JpW/dnpXxi0vA4DTSy0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201d373d-796d-45e9-9ec2-08dddb63c05e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 18:52:43.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0lqo7VUeFLllIhijPsTCaUNxfWgl/ZAO8WUqMRUu0McoyKQJp8GzDFQfJ2txq2IMVorfTLeGuby4K+V8qyQXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7049

On Thu, Aug 14, 2025 at 01:55:01AM +0300, Laurent Pinchart wrote:
> The bypass argument to the mxc_isi_channel_chain() function is unused.
> Drop it.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c   |  2 +-
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  | 11 +++++------
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  2 +-
>  4 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index d86f5ede0c0e..5789e54f9428 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -361,7 +361,7 @@ void mxc_isi_channel_get(struct mxc_isi_pipe *pipe);
>  void mxc_isi_channel_put(struct mxc_isi_pipe *pipe);
>  void mxc_isi_channel_enable(struct mxc_isi_pipe *pipe);
>  void mxc_isi_channel_disable(struct mxc_isi_pipe *pipe);
> -int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass);
> +int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe);
>  void mxc_isi_channel_unchain(struct mxc_isi_pipe *pipe);
>
>  void mxc_isi_channel_config(struct mxc_isi_pipe *pipe,
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 5623914f95e6..9225a7ac1c3e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -587,7 +587,7 @@ void mxc_isi_channel_release(struct mxc_isi_pipe *pipe)
>   *
>   * TODO: Support secondary line buffer for downscaling YUV420 images.
>   */
> -int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe, bool bypass)
> +int mxc_isi_channel_chain(struct mxc_isi_pipe *pipe)
>  {
>  	/* Channel chaining requires both line and output buffer. */
>  	const u8 resources = MXC_ISI_CHANNEL_RES_OUTPUT_BUF
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 5501214cc6c0..e36781c5522e 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -491,7 +491,6 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
>  	const struct mxc_isi_format_info *out_info = ctx->queues.out.info;
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
> -	bool bypass;
>  	int ret;
>
>  	if (q->streaming)
> @@ -504,15 +503,15 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  		goto unlock;
>  	}
>
> -	bypass = cap_pix->width == out_pix->width &&
> -		 cap_pix->height == out_pix->height &&
> -		 cap_info->encoding == out_info->encoding;
> -
>  	/*
>  	 * Acquire the pipe and initialize the channel with the first user of
>  	 * the M2M device.
>  	 */
>  	if (m2m->usage_count == 0) {
> +		bool bypass = cap_pix->width == out_pix->width &&
> +			      cap_pix->height == out_pix->height &&
> +			      cap_info->encoding == out_info->encoding;
> +
>  		ret = mxc_isi_channel_acquire(m2m->pipe,
>  					      &mxc_isi_m2m_frame_write_done,
>  					      bypass);
> @@ -529,7 +528,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  	 * buffer chaining.
>  	 */
>  	if (!ctx->chained && out_pix->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
> -		ret = mxc_isi_channel_chain(m2m->pipe, bypass);
> +		ret = mxc_isi_channel_chain(m2m->pipe);
>  		if (ret)
>  			goto deinit;
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index d76eb58deb09..a41c51dd9ce0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -855,7 +855,7 @@ int mxc_isi_pipe_acquire(struct mxc_isi_pipe *pipe,
>
>  	/* Chain the channel if needed for wide resolutions. */
>  	if (sink_fmt->width > MXC_ISI_MAX_WIDTH_UNCHAINED) {
> -		ret = mxc_isi_channel_chain(pipe, bypass);
> +		ret = mxc_isi_channel_chain(pipe);
>  		if (ret)
>  			mxc_isi_channel_release(pipe);
>  	}
>
> base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
> --
> Regards,
>
> Laurent Pinchart
>

