Return-Path: <linux-media+bounces-39611-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9AB22D68
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 18:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91C287AB988
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 16:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86EE2F90E1;
	Tue, 12 Aug 2025 16:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="StY5fJkR"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7792D2393;
	Tue, 12 Aug 2025 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755015955; cv=fail; b=tmGo4qVDP7St1ysTc8YZ6m8nwXOf0HmVJRM1RJloy9FealMI797s4vm5aVZDEO06JXHQw6V1KVm8SW1VxPwww+b0mJk293EE7jZG8TSNpWqTJiXIH+5DeIqAqbBgVs4HEkdHLKQ4gUO0jPFozrB++M0Cci1TfDCMJlgP0Qj9ryc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755015955; c=relaxed/simple;
	bh=tOwkHMHEuURRMlBmK7DNNtx7oHCjLQSsPXUzST0CqQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t47Lv9JOHm+sz0f4W03wN9pZGJq8dwsTzoKhxaeNWFs8QcBgUBGTpKSF6fkGXx0Tzoret60ueTf3MRqNZMwZ4CC8ss6+vvUvK37YssZUOQ4fV7nMxTYiXjjQI/qQWrn8kEC8iyFrgjvgDVRIcdwsbHkp5rdMmk9t+Dm/vHiF664=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=StY5fJkR; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKQ5Km8XRGJsp1QHG1VKDxyDQbhmG8eqpY/vpogneF/7ZnkzrtOgx87RIDujcj/lYj7jPg8bvt10OYRm8FG9aoetySOaCYLcKf/hK3wMOreXtkdTmhAsOA0HW5LtXasu3iyg1jr0+HUgKkqsQpfxCMWpCOREao4V4tpe9nkEuiMgc46fYMkyjURZwj4ydFjnBUlmnC8djs3XtEyqwsKkzm6flq6V7nRS7TQEXqCPdHZyER8rNOIVu9JfKpo2faPCFHPXnOvIhih87QKnLRmt7jcAoG7jjQ4lVnA4uuF881Fa7LkFfSkWJudYpFnvor0w/xqd5FlDc1y0Yx2X5inMCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XTsLVBd1jNOX7+tNYMg16ZvduoxVdmFVfV1Fn7p2uw0=;
 b=mPk+1IfyhROOig9Z3p6jxtslA6NZk5LhTY4zsdZB18ttEvtA+1OWDzNedUhQdmMT7PDxx/9OSzjIxW0VHBHMy6luvY8MRpFJnMV1EeW8ItX6iZI35X3zyTzXQMi5OJyRdKuAHFGwiP4pH4/+mzzP7W3z9OcP73FIsjENXgdXKZOeUcldLRyUcmJ9WMajc6eceppsOnkFrrr/VOXsYvtwMQ3lR8rH46TFYv9ItmwS8n5bqvDujuR/4aou6l7dfoGSmI9rvaM6raWJS0h9JW3Wy+rhtaPh9XU14dvei4Hj9aisdVLK87+0mCXMLD+guavfF9X6NmNmpuSK48cdNoRLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XTsLVBd1jNOX7+tNYMg16ZvduoxVdmFVfV1Fn7p2uw0=;
 b=StY5fJkRWCe4qpzIVAVIF5Vh+gamiPkA9Nxyfdc/oV4pjMdJuWRjnCIkLUhXoxkvFSRyD5QGH47MxeBAUmrShnkQGytj0Of4Se8Z8tmLQWgyoiDSwW9wxeNqDIQcqhLMv7RG4NGdSIaZruZDFOqwKOaXIvWE/f01hgZRhWS4CeVVWlikYQBRiIXAZzk+oRTJzmmnXAWi22WKf4p9857tRGpPRHayO/LQDGJ/F85JSpHh2oMCZ9XeidnvTYiz65o9ccfd5uCLe1PWPg4zKWmXcyQFbCYJ0qAJ7u1mp8Rr1ZpMjGJZQE7txsg/txQUt19XMYpCzd8ofGQ9pTL8XRA7nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 16:25:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 16:25:49 +0000
Date: Tue, 12 Aug 2025 12:25:40 -0400
From: Frank Li <Frank.li@nxp.com>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <aJtrBKD00lj2TzwW@lizhi-Precision-Tower-5810>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
 <20250812081923.1019345-2-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812081923.1019345-2-guoniu.zhou@oss.nxp.com>
X-ClientProxiedBy: PH8PR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: 182c146e-263f-484a-0cca-08ddd9bce5bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Q8J3sRplJJruoRqP4kOpKCI07bHeI0hwVTMb3QD3usR0pHGKCWgvj2nGYSbP?=
 =?us-ascii?Q?3f8C44wzEnSfZi/GMPWwx5rPXAgJtsoLXfRbusxmIitujDWRtqxq/5j369oS?=
 =?us-ascii?Q?CztMikFiIh1NtEJ/gpifVVDLdP6sGTikvuUpzvR4QDr6vDmMB2w5AwwlTJdC?=
 =?us-ascii?Q?9JFFdX/txwiGWHiTDC37THva8qSXJBqwdfKMfUZ2myFebM+7Uouy/UDGu00m?=
 =?us-ascii?Q?lHnujvLYopofOjEthkSP+JWbI1fQGlJ7G/I22E/+h3LLsTgFVbMq3XWBH2D+?=
 =?us-ascii?Q?yA6nPP2sZ4R30qR9MBTyhrgFStupsdbqV68LygkJdqvpzWSGj6HxBQ10ty6R?=
 =?us-ascii?Q?s5IRzS3o+0g+C/FSPW7xinccUilAgovXSVxRo0dPWXDm+ikkY1B1+Nsq1yHi?=
 =?us-ascii?Q?+nP9t+PePcorubIwMbOWcxxPcxhqr9WsHsc+LVJMv9W2b1TgGjiAH+vckjRZ?=
 =?us-ascii?Q?Pc7jyl5lzsx44EBKgFVRonaxmgTmBeqGU3YQDqVNWALUxSbJR6qVAWxsEhep?=
 =?us-ascii?Q?Tq7hVEGJ9fQ1qHfz/w3rwLCIqaOoxDZgWGmzY33XlckTAQefElgXUuIR9jqd?=
 =?us-ascii?Q?Pd3+rIz5Hph+D4CPWK80kM2k8BakHqKjTGASKYbCiaLYsNNcBtmIOVjY5vho?=
 =?us-ascii?Q?4M5YtGvU4fbj1rwZEwgXydZ7fzBf0FUx8OVydGFtzVgQ5niMRHgtxtZ7mogB?=
 =?us-ascii?Q?yZEsWnE9eZIdDW+duf5xOG2qjli2JWW8hFwa/o2vgK3VPyz8nrJ0dpy+xS06?=
 =?us-ascii?Q?oOO+n2AKZIMfyQukRsrFWhB96akkrlZ0tsTiX+k/M77cO2jNPPsNzKVVsbZd?=
 =?us-ascii?Q?AjHJA0IWHFVheof6aGBzSrPcw05d9LGJRFNhsDc0oWO9D7pG0AG9Br0HykeS?=
 =?us-ascii?Q?QhSAMcaSRHf5hXv0Q+MiVskLx0ZniftPmeqOhIOghZmJw1+StfJG5IKee5l8?=
 =?us-ascii?Q?y1DQRMioh7BZm4TbCpJZmxNrwmHfVYJLymGbwV/XpEBthRyUMCFkSev5SGvy?=
 =?us-ascii?Q?gHJwUEceCFU22+pRfFlqiZ6Bq/kqK4B5HqaPKWCHT30ys3o9H9/LJ8t7Q6T3?=
 =?us-ascii?Q?qUII4rFz5nyBm+d/3FA+9+SkqlQelYcELVOLSD8E+12gxn7CEzz/Hy/D3ZtQ?=
 =?us-ascii?Q?THRBua4Z6Mvg6GbF+7natNJFVSNPDbmlacc2kcv/Sqaho2BrIGDxwQddCw9v?=
 =?us-ascii?Q?oDXZGZuPjoGIkr1bhEOot92bbKL0crhLhXIVFJ3zVdDUKXrKmguojWaw3lSY?=
 =?us-ascii?Q?6N+ZZaeCjmp94SGUq6bs3ZfN/A3I/GcOeF21OXcRvgc9gtllOiBN6zFYVLts?=
 =?us-ascii?Q?s4tXk6x8HtyD1z3LpVetM0Oa06fl6pdEKIR2zhXsy82kNd65phlRFn2Bgp79?=
 =?us-ascii?Q?+EPXVgL6tNO2nztai1JMWmqYmR1H4TSS4+3NMaPjnfuqTjDe9WxStNLI25fe?=
 =?us-ascii?Q?PbIrzTmgG03qzAyxmYIhd0BVwx56SAuCegGbsjo1lIUwuF5M2EXEYg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OUIu1GS11OMVPVH8dAMkNeRv6gGEpbb7j06SJxiKxQYEmFs40TDgrFV1nTdD?=
 =?us-ascii?Q?pVR62qiBidXnIggs6JKCquyXfcmikX114ste6LPMdosOqKKd6iRIJ+MB0vBm?=
 =?us-ascii?Q?MSKToPca1wSn2qS0A9JWbmutZHQgKZGispN4VFjF06Pbl4bkPvu8ph0Y8z7U?=
 =?us-ascii?Q?BcJDMg/KVL6TW0Hf9gYDvIr/t+ymJhdTsEDyjbW8JU6WqALF/1P31Ld8F28N?=
 =?us-ascii?Q?7yEGcbSbXX44P1rDNDX1V9DfxrHwlCKasY7/IlDuj+Z3/lESrysppznAiXfg?=
 =?us-ascii?Q?/KULK+0MHR+Z6kNbnGg4ZBcdC18ediuDud0WWqWpOCAoBy6i/kUuXmD4iT3c?=
 =?us-ascii?Q?PEJ0JJUm1tPnrSeJwH/8tWT/eZNzGs5Bt1uCPDoffjJ7jsyif4utbnGN0gB2?=
 =?us-ascii?Q?doYG9QFh0WJnsz/HNYIQcfwth8zdt6ZhDCxzqsiPwG9OfhZEx7vE2WHf0zfx?=
 =?us-ascii?Q?CHKITumVItslPYFIgwM2UZHaZB0HjFgFkFLSywKwtQszNf3wMnTkN5jCDjCa?=
 =?us-ascii?Q?wsg9hS7cfMws8hPQS9V2lmtiWoC9fLiwe6ymG0n9SauHHuzpT8RMJw5NNCec?=
 =?us-ascii?Q?juWLf3GpM9NS+UP94NxNAEcnrCmPArQ46gPoZbqkbs4wi7oBJIhc9MHdxXXp?=
 =?us-ascii?Q?IWvshWxpLOfaGWmKaSW3hKE1tZA/GSLcOhjM85KoJ50pNjgOPBO/RF0XNWXu?=
 =?us-ascii?Q?Kw+VQ2bjMF0+TG/SEMAacehmoUipZmp9a+rBDWwzUpZd+6MLLkfBNQLvLAHs?=
 =?us-ascii?Q?UJlmZ4RIJbHCPff3EYMom8oYLM2M14RI6YydgYb9w5f/g25xRVoQ76W1ntNP?=
 =?us-ascii?Q?NSQ5yGYFeidZmPe9kKjQXV4dpn/V0tqCYYhP5lllMROa4iNnX7J5M4FP+yzK?=
 =?us-ascii?Q?INYR5zjeH8nDvXs7Wu9KdYtCvg4PTOsIItnoJ1lbpiQrxmnLfVBATIfCzchb?=
 =?us-ascii?Q?8ZZ+6lRc9P6vbM7xK3cyC9bkcRkKrzXCBRABYTqgUVPd5HoWtVmsKRATSXx4?=
 =?us-ascii?Q?BSDdNgo1WC0a/j5axozTrwCOicWd3Rtk1quHkWUSfsu9nJPKLTWN0f8hEIJ4?=
 =?us-ascii?Q?KlWqK5eSMOAX633/MhRWXqApEUJvDbRbhTplDtFlu2mU7irskPcTTiJmEoIx?=
 =?us-ascii?Q?Lw6xsRjcy9K6Q48JsHuIiLYHO27Gvu89/ygL0i7D9oDAeyMO9AmVbJM5Ivf0?=
 =?us-ascii?Q?XgUk2biu0r9dMtimQPDiO0vEAJZ59fvyTf8Utz2KzyFjGekTMHXqrLLJTArG?=
 =?us-ascii?Q?tn55kvQU5FlHJKInNfXDZq4Es+n3Ja1lKHmRu8AaE8pr8VKIFg53GddpoNJS?=
 =?us-ascii?Q?QFTtUGxy5juVa1VKn/v3uNDO75WFPrlwbIkUz2QrYdSr4KrVwT1enLJRcA+S?=
 =?us-ascii?Q?ShZ0IC72QvAGOYN2o3Qil9EJA1mHOgpoKzWR0suctcPcayBmnW1u3iMNjUSS?=
 =?us-ascii?Q?FXEZjgvlPPECuITeVkw+rRhk9zwr7dc3fzeohMNp+9CIMFG+epCBUOlxY0sJ?=
 =?us-ascii?Q?FJOQRewFGCXdBkMlRS/ggNynuXVJp7tZUAjFBOWEuJ0CwMYpCVdYABwzjxIC?=
 =?us-ascii?Q?1FqKZmt0PXDqPOWAEnQEUV3BDbITKcpYRVlgu9um?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182c146e-263f-484a-0cca-08ddd9bce5bf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 16:25:49.0122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bB5tCsQtH76Cl3mkcqonndxwXWXhXm3IGdJ6ViG7ihhhBdKWF5IgpZ0V+hfAl2RWEOeFrg5pulE9PPqHdqVMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185

On Tue, Aug 12, 2025 at 04:19:21PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> The CSI-2 receiver in the i.MX8ULP is almost identical to the
> version present in the i.MX8QXP/QM. But have different reset
> and clock design, so add a device-specific compatible string
> for i.MX8ULP to handle the difference.

Nit: wrap at 75 chars.

Keep the same restriction for other compatible string.

>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> index 3389bab266a9..83fdda2252e5 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - fsl,imx8mq-mipi-csi2
>            - fsl,imx8qxp-mipi-csi2
> +          - fsl,imx8ulp-mipi-csi2
>        - items:
>            - const: fsl,imx8qm-mipi-csi2
>            - const: fsl,imx8qxp-mipi-csi2
> @@ -39,12 +40,17 @@ properties:
>                       clock that the RX DPHY receives.
>        - description: ui is the pixel clock (phy_ref up to 333Mhz).
>                       See the reference manual for details.
> +      - description: pclk is the lpav bus clock of i.MX8ULP.
> +                     See the reference manual for details.
> +    minItems: 3
>
>    clock-names:
>      items:
>        - const: core
>        - const: esc
>        - const: ui
> +      - const: pclk
> +    minItems: 3
>
>    power-domains:
>      maxItems: 1
> @@ -137,6 +143,23 @@ allOf:
>            minItems: 2
>          resets:
>            maxItems: 1
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-mipi-csi2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +        resets:
> +          maxItems: 2

need restrict minItems:  also, because top reset: minItems is 1.

Frank
> +        clocks:
> +          minItems: 4
> +        clock-names:
> +          minItems: 4
>      else:
>        properties:
>          reg:
> --
> 2.34.1
>

