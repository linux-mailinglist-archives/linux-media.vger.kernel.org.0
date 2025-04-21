Return-Path: <linux-media+bounces-30642-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC641A9561A
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 20:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C6D1895C9F
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 18:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 630961EA7C2;
	Mon, 21 Apr 2025 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDPXetdf"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBAB1E990E;
	Mon, 21 Apr 2025 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261070; cv=fail; b=fUDjy4AI6qm0xENcXP8LAqSX/AgBAkm8Vrb1ce9/zKL375f1oHK9usIpQA7Eh4w+6SUbidj67hzLwI5kcoQi1xVY76ZgQtahxRwACbo5VvASeJeKri/fiWJt+gWzJE7M3+pgW0HYf+105yu4G+9elGjKzZNDgmwaobRegwMouI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261070; c=relaxed/simple;
	bh=GbI/N6IyTVLdaYy7nHl3JnX8AgEKHR+skEBPxGUmKJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bEgqQIe1bjG7EoMONhaPoSVhpOnkUAnt9UfUlJofLMB2uSt7yXO73N1KWonK03LGePcVAIbXhFy2AnkfVP3jCLOS5DcjDi5l0NvZAALw1TRDHJz+t9DKPXgnpyTpmBJmVzo/6Y4Qx3FoRPr8FWYm957xRTjas0YEkze+JMsjJZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDPXetdf; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EZyyx2a19RM90GaoHlsZh0WoAWCW6u3o308mBOmdY3VHAIqF9tAqL9GuXHJPYVbiFA5dNeDTXqCjyPE0ySxEy0xiP0o4l5W8Xaz/wQeTbvrm6LEekwDlqC3INQ1Iv+8zL5Mz1dhQPYDflsIExVnq5VaOVtXwxeQCWQIG/ZCu51DrkFXNfdMoc/dpf36DP39oHs9anVULZdZTFNPwdJ9qXh6MB6OsPBw1XZZMRakIcGkSE3bL2EWLk3+rxWrkjo4o0xeD9DVVzH1dWvqqKZI4//HBytwPS9XvD0RCuseUIUaCHy6/DZHVh0yJDTVhRB9nx4oMB0wljAMF4Mu3xypzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FT/0jGjH7AlyHi96WOAFut3BHEdpLzQKPmz/Wr5dtc=;
 b=mbrEIrdL9/TFmpQTw1h8WNzC8BX/Mt/XcWDhJxZlCU5UYjf35ytpgzPMBnm7LIerV6KVOjboR9syruwJ/X+aYBNLrT/YTyWrPrAvzmUO+iHbwb/eLFtf4hxQC7Mado57z7ZILyHhz9ngxsJfMzmrDKwmBRZGGm1Qu+1iKsIsnWnAgK2rjDE0M+6sT8p6jWjTnMVLQRpF68poSz3K1YLZ2wi2lKxJOBB/3ald4ndhDIK0ifn7eElmhzGtJdD6E+/iRpb5lBwQIk2bMkanTNpY+EGd2fCocvvrauEsniqCvtPw2ut5W58dMM2Wx6AIDzh/udcGA+9fTJ1UA6gJMFzsgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FT/0jGjH7AlyHi96WOAFut3BHEdpLzQKPmz/Wr5dtc=;
 b=cDPXetdfpktVbZPeLQ/RPFpHyovQfca7wxDBQ580oLy0ZYEo8n/YxwkmbgQ3i/la1QvOw/G7XpL0xqrsgzlLvtsjKo5Y5llIEfrePIc3WOqcNbKFpBAQvGRkt1NqVAS3IrxZu1lZ7TWzGtQRi7EP+v8v1vHDNY/3pREjWLPKQvvpUgbuUoarDaWmp3ZWi5fedz7rvLqonVYpGP9I/DX8idkHjkKjL4Ax/DOw1ULP0XBDG3CpZUwebUhFI+dPnTCZ0E1ZY4mGtnR0qn1AEkG8w39FG/D7idF9Pj/K64uZOhlzbwb0gzsHSBJ7A5xOu6Z8dfkMQcHAfdnhfVBFqMg2JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8213.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 18:44:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 18:44:25 +0000
Date: Mon, 21 Apr 2025 14:44:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 00/13] media: imx8: add camera support
Message-ID: <aAaSAxMio+8A94P1@lizhi-Precision-Tower-5810>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
X-ClientProxiedBy: AM0PR04CA0111.eurprd04.prod.outlook.com
 (2603:10a6:208:55::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 14084380-c075-4061-49be-08dd81048a1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?8as5KHHlBYspJk4xLLjYkZfp+lE6OuHmjiDdAaCkFNzpOF7sHCExip4coInj?=
 =?us-ascii?Q?NyYYOMkOL5k6x42bUDkwEgmMhvbLOSmdW63GoUNz/wrZlqoccrlzjfAy9DUv?=
 =?us-ascii?Q?ME+KWOaIM8zVlZNTKJQEceLFluU22KTW7nI5J4bup+uniBk9uqKma2gEv/Gf?=
 =?us-ascii?Q?lYbiRxoLum4UFWWCDI/6OIjqSF8N+GBbXKXcyxZb0VPJyVJM5OM+l8xyU8nn?=
 =?us-ascii?Q?4dO9ljJr6XysVz371Hodiea9aGhEI4QuoLHTkPBkLJN/OiO31DHDB5VDKVft?=
 =?us-ascii?Q?30pRAMyYYdgVkU4YFd3TyZ+C2yFjOpjr9H9EE90qyfw2VFOF1jROxmIufp2a?=
 =?us-ascii?Q?A4r2QtLZCooxYPnlOyFLEBrRP1un5K2fQj7IvSfaYBWXldDAB5qv+lT81oEB?=
 =?us-ascii?Q?kcRhsrjehPkGpNkl9q9eF2UsO5Q7iISE5vsbCJTmPftFsdRSFxOFpaXEpt2i?=
 =?us-ascii?Q?c1TRuO3gbFG76JMJJhUTe0kBN5sp0gAaFLfbVIN83nPuGbOjlJujzSCMAXEC?=
 =?us-ascii?Q?0rQOY6EwxlSi6PTMWTQyp/SEqRYQG/TbL9CD+ZsudZGfdm9svj4jSia9XY40?=
 =?us-ascii?Q?8HEabPoiJm9dWIilM6a+/dYxcQ8Lw8hb91VIkl+saYtTH3UaXmMyU9yybzPf?=
 =?us-ascii?Q?VScrHexHwe4YiYHZCA3iAAwOLaX6QqeeByEGJxq7QVukj8MflDxr4g78OWhN?=
 =?us-ascii?Q?P6twPaCuS+f7a6AI1t8Hc3uS+t69lRoHiIuekUkuUPk+UQzvl6hCyvyv3fYc?=
 =?us-ascii?Q?Z/lKXX756Vl9bMfzcuiD1LKuqhB0Xoawua8ZTERTv3bglcEgPQU+frakhlW3?=
 =?us-ascii?Q?UMCj20aKUPg92sb5O2pCB2sQIBkq5eoACiEL2oR4GDFFO9vlUhhSBYwYVdFu?=
 =?us-ascii?Q?11hMtg1YlrU1t1YP9PHXILY7ZQ863UqkGoDCXYAdv1RS+d1C7SRNfkG6z0pa?=
 =?us-ascii?Q?YvG4qb9qKPG4UXRxGkO7zuz1vcg7sQR0LWaSQTMAg+mm4Xo+X+8CY85rjDMq?=
 =?us-ascii?Q?2Dgcj+tjA7//Na+gGMlTDkD4iwDUqTvv5cVnSPQkD4tLjwumdzCHsJPK2kkG?=
 =?us-ascii?Q?srWXVxIJgg7VoJ7EbTP1OtbLgDQPRqE/oeFM0tmPqnz/6XgYgppwPPfCXJ/K?=
 =?us-ascii?Q?9cJ/EHJLBfp8XLUYrerfv2IOHfGVmGc8aIBH6UYTC346umRHBqXgLdDC0JH4?=
 =?us-ascii?Q?jWTHWlRvjgBWqXN0dFcR79wlJZr1yAqOXaruMz6InRNiiWVXfN6azZKYxPY8?=
 =?us-ascii?Q?9UBbI8tyuI4GhYrmM8sqRYmK1ilxY3yUjy5h3ub6Xs4Eem2xDflY73P4g7W8?=
 =?us-ascii?Q?l23qp7cbVNzfwzJQnwzPPvwLBdLEKRjHLtltWrJ6d4kjpYDZPk6pXEoSomko?=
 =?us-ascii?Q?1bPQnoUtMPPX5ZX1v9JLUntyDpSyk8CbZqvGWBQkGpcAtrjCknA0NJ514Gzj?=
 =?us-ascii?Q?TP5CQSJZvENJQNlkvPw6mkUS1e5oRQ1ucMIlod8t+yXulS3QRcvSuAvgr+Bq?=
 =?us-ascii?Q?Qo61f2QcFwMQ68oUVMrzsXwqqTwa+Cnu6X9H?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0z0BeU9qRn08td5fDNZ/m4RD3jw2+GxRzitMEgu77s6Nl7Cezasnl2X042YT?=
 =?us-ascii?Q?tae/CJ5WeA0q8cS+Aw3f+Gq9i7goX2q/hc3ZcWbixKHNC0p7y9wqfHqAfpTa?=
 =?us-ascii?Q?hFDUvHKLSzUAd//NDYVkQnZkauhl17GLcx+DzumKCgolsdRFzqn/e/Cy/eNr?=
 =?us-ascii?Q?2hNqejmxI8+ee9E14r3nJmyzAVhTBINRFnhoSwn77HAAosBCj/9cZ9GBl8H9?=
 =?us-ascii?Q?9Vtv3+x5DZuZObCBuRpSfEC7Guy4CMxP5/CzqD4gf4UZRbwIQCQ8xjHKexHP?=
 =?us-ascii?Q?0jA6+YnmxtYKU5vs5lvXWZD85Tp6btepUFO8AvvR7GcJ97T4chL2mewWST2L?=
 =?us-ascii?Q?xnyn/jWpXiIgDW7NB5+oaePuvkYpvzThB3KaRN1+/VhFVoBZbEOdu+PR85xO?=
 =?us-ascii?Q?/joRAjYqTCXnz3Uv35qHn+Oc3Swniu6+U+uMXLJKRLvntWESmaptNykeSgng?=
 =?us-ascii?Q?s/EvviU9MC913GuuJZoGfXpX8PrU0g08DUN2kW6UzQ3STmmls727Wr4jXU19?=
 =?us-ascii?Q?274x9y2PuhjyqlhOgoA0o5jRsdkL4UNQnmj+snyNOnaaOJWgIvHDs5YauHVg?=
 =?us-ascii?Q?aXKB8eS/efmG9ni1eBisuHqI3gnW69wjdUiypThaTkBD/VJvebuVDTaa9MWP?=
 =?us-ascii?Q?ujG6sq1ds2R04KZQqRLWdGzKX3d0qc5E+3wlGkpVT5q1eqX7pQva5B8MWV4p?=
 =?us-ascii?Q?XOrZOXZbFkkNAXypOpSNIBgXbxqjfXr01tIA2Mkx8CZ5zVV+pEUXvj0a7FjC?=
 =?us-ascii?Q?8BDGqa/XY3vuhUJzbvy9rfu/yqUnqQ0kSZwJRrc1QYgwB88502p4AQwgiAjZ?=
 =?us-ascii?Q?Dh0jQ6Qdi1B40YHwTE6sJCIkibkrh7ygI5TPDs3SYz8EHE/z+N2j9BEfMmFD?=
 =?us-ascii?Q?mVO5qYeCQINT7tXpMGzrkdVwJc09q4XR87xgJlcr3oCkg65O6uWvS3SoyQYR?=
 =?us-ascii?Q?x5T5EVw4VRxDQmldqyEXa06JlKWFHwlmUFvQ/U1RlDgikVWydSy0VHsZ5WrB?=
 =?us-ascii?Q?dE3gm8kpehQGbD3MQZiytpdfQEqPiRiRtZnQUQonab2CdecYqe9txFWx7e4R?=
 =?us-ascii?Q?qUw8Qp3514yUJL6Cf10F0w4lVRNYgeaoxtHvC0aQzX8q5gaz7yiXsynBTZrH?=
 =?us-ascii?Q?8Ok5scl7M4Etf6WaOVPV6O0yNdVXFoOAQvluKHajxE2JEc2BfsWuXICUI0Tq?=
 =?us-ascii?Q?15UhSjJnEiEhN95ALWW4Z9i3DTGd5Oq5FfdwXWYtihgOw4Ap3JQt7y4uSinK?=
 =?us-ascii?Q?f7hRGreJBGPUVeov64Dwu9fePXJ/RRWNnZvrbVmR8d81sSQ54+Tm68GKc2WP?=
 =?us-ascii?Q?Ar0WX2ngrF2SnecNvcb0CTZK7SyYyMyitbUh7kxXl7g9COOjRY5SifkzIQSq?=
 =?us-ascii?Q?MgLaG7INTW8wKdxj/BHwFk/CByoJnlqDM5oOZWXoX3F1gv05ZzwBGoQYeGtJ?=
 =?us-ascii?Q?Q6so9eWNiWpSgVrwWoxl2xUSf2AzW9AiNnqRv+SRhIBpNys6nzRyA87QIni3?=
 =?us-ascii?Q?x5LpIO6RKJP2eHxxiCvHGgIx5rxL/OxLdSkeuMkPZN2uKthe06ZK262fTCZb?=
 =?us-ascii?Q?dwRRQrvGoiPFg+1tylJOC9HWFJgGCkD0onBR2xAj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14084380-c075-4061-49be-08dd81048a1c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 18:44:25.5578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JE8b4LsuvYsZbFE3uNKX3T9mM7LqZGLFLBXqelLa2T5cmhDNzu11IDxvX8hz5KN33UZnazq3cISm+k2sjI6/+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8213

On Tue, Apr 08, 2025 at 05:52:58PM -0400, Frank Li wrote:
> Add SCU reset driver for i.MX8QM/i.MX8QXP.
> Update binding doc.
> Update driver for imx8qxp and imx8qm.
> Add dts files for it.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Laurent Pinchart:

	Do you have chance to check this version?

Frank Li

>
> Changes in v4:
> - Add 4 clean up patches
> 	media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
> 	media: nxp: imx8-isi: Use dev_err_probe() simplify code
> 	media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
> 	media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
> - rebase to v6.15-rc1.
> - Remove scu reset patches, which already in linux-next
> - Remove patch
> 	 Add fixed clock node clock-xtal24m to prepare to add camera support.
> - other detail change log see each patch's change log
> - Link to v3: https://lore.kernel.org/r/20250210-8qxp_camera-v3-0-324f5105accc@nxp.com
>
> Changes in v3:
> - Remove phy driver parts.
> - csr is dedicate for mipi csi2, so add it as second register space. csr is
> mixed with PHY and link control with csi2.
> - Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com
>
> Changes in v2:
> - move scu reset binding doc to top scu doc.
> - isi use seperate binding doc for imx8qxp and imx8qm.
> - phy and csi2, compatible string 8qm fallback to qxp
> - remove internal review tags
> - Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com
>
> ---
> Frank Li (10):
>       media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
>       media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
>       media: nxp: imx8-isi: Remove unused offset in mxc_isi_reg and use BIT() macro for mask
>       media: nxp: imx8-isi: Use devm_clk_bulk_get_all() to fetch clocks
>       media: nxp: imx8-isi: Remove redundant check for dma_set_mask_and_coherent()
>       media: nxp: imx8-isi: Use dev_err_probe() simplify code
>       media: imx8mq-mipi-csi2: Add support for i.MX8QXP
>       arm64: dts: imx8: add capture controller for i.MX8's img subsystem
>       arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
>       arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek
>
> Guoniu.zhou (1):
>       media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings
>
> Robert Chiras (2):
>       media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
>       media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings
>
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 ++++++
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/freescale/Makefile             |  11 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 +++++++++++++++++++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  60 ++++
>  .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  60 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  67 ++++
>  arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  85 +++++
>  arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   5 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  59 ++++
>  arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  86 +++++
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 133 ++++----
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   6 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 169 +++++++++-
>  19 files changed, 1328 insertions(+), 94 deletions(-)
> ---
> base-commit: 1f665976a7c4e8779566e153b8854d7829ce33ac
> change-id: 20250114-8qxp_camera-c1af5749d304
>
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
>

