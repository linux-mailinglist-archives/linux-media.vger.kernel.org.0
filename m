Return-Path: <linux-media+bounces-52199-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMLYLPJwg2mFmwMAu9opvQ
	(envelope-from <linux-media+bounces-52199-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:16:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35128EA0F5
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 17:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7227830F20FD
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 15:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D0441B34E;
	Wed,  4 Feb 2026 15:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gP6K8LZp"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013004.outbound.protection.outlook.com [40.107.162.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1435241B34B;
	Wed,  4 Feb 2026 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219786; cv=fail; b=HEBB28Nt586QyenqasRTrGN1bB/jRujuJ8SIyHxvD+Vi1AtAI7MwfgygFR5htLtH8NvgiKbOdLmdkidAH/yqD8IXPnI3hTQPiu4PTH/tIDS+Xv7Lo+RmwN2a17sV4urdEBl24EFATFp3V2hRd7pZ+mei2RzhhZSYCJtLkfpj/DI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219786; c=relaxed/simple;
	bh=EBmG9mprNklVgMJ1WyWGyeCLXfDWTMJ/DZMpdRzrII8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DynLxak6+h1RpnQ5NLR24otWzV4MFAkEi8FidakPKt3mtOm/kpaoFs1JwORPu9BoqabEocphmM7Y28otTAMIJampCjBZh1rBv54RwxVuG+rs5SwOoC93kBh9xFVYBEQIULRXgRpLqjxLtlFwd1dOPI4H2/4bsqlZyKBvv3uXoHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gP6K8LZp; arc=fail smtp.client-ip=40.107.162.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWH6j4qMYtr4yQ8wsvES2kNRo3bXCakIkwPCoyRU29r7P5ML8n275jRBbgmuafCiKlj7sW19i/tyFLET44sOPptFisfIZQA9k/oBpbj2vGJjsz2raI3NYsEr/WObHot/k9ga91cHPaO3DXnovIjYJcY5bHLpeA6BJI3Gwhr5GFam7UE6WXgGJBqGpiqCwKcS/2364BOigSlTARhTKgIpWdKQ7SxQTuqB2UVq+r3kC+oIcDz84EF3lbXnCDO/0PumVNFTu/yJXx4d/06K6Gw1gfhOXzDx3FYB1lmg8laiHBvjk9JHbyCusZ2snfgQAsQ+gzsORzcvgHz2y8SGuTDCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyueUZ4IgXgnfIbkfjc+GebV0NA+ZZO/TKdRQ8BdhIw=;
 b=tfDpvkQismbqAOeuz7OsYrh8lu3XSoaR639izio3mfPB33pM6Ej8Y7GO7EDdCM0vIIIrEZzFD3fYJep18lDbkN+VW6u+Mc65XGmvVHIdwIzxEyoLfbjQFkFJ9jqTNY2zDpueaOPA64dwt38v1MHMR1JVZCdiDAwJxIWwie5wWmG2umTu7vVsKugBRjc0E7GVSEINsigNIlLcjyEeKmuBkc2CVa1kzydrg5CH25y7nSiA+qFziudzLB9b7N9oDRy91yno7dnxnozXakS9H35MyQEaTZJx6nyzki/PrxfOrJ8jii8PowCt3JuxUz1YmYDRcvOpHOlzoKDg9LC/0YKyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pyueUZ4IgXgnfIbkfjc+GebV0NA+ZZO/TKdRQ8BdhIw=;
 b=gP6K8LZpSxd8ZxibesSVfvanJXJN09gxryw5w7L4rnqo5wVxuqwSf3AQRPEVIjBNyk+lwvHcJSI4Cogq8+Ph+tA1ARhAO/2QrUpQTziAs7ixpBdXwZpy6PSgQNGfDg9J5Ncc3xVVWb70/hYgCIzf7Yy1I2yV3LTIBYxsGFW2l5tqUcMStmFtK6GkjGWt0rNjiBLsIwKiQw4eCRiFYdG9aMulUDb9Rb0oXxwPjbk+V+YdS968dRQ9AsvLSktSHZ7mO13ctp3Iudq2wzJnnsHwMCypArRCUAQmtkvzla4Uo7oj/OQk9AiH2ERZ1k/ANuWM7mFJzXW41oCD0tb9h6dXsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB11660.eurprd04.prod.outlook.com (2603:10a6:10:60c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:43:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:43:03 +0000
Date: Wed, 4 Feb 2026 10:42:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
Message-ID: <aYNo_XjfrXA6tKX-@lizhi-Precision-Tower-5810>
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
 <20260203082349.1082-3-ming.qian@oss.nxp.com>
 <aYIopWM4U9YQB2SF@lizhi-Precision-Tower-5810>
 <0f2cc5d0-9abe-47c6-abdc-42ebe5fb5b35@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f2cc5d0-9abe-47c6-abdc-42ebe5fb5b35@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB11660:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cbd056-7128-4dcb-a2ac-08de6404154b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7cblqH+IALRDeiXYlJ7jgh/Uzzk27etV5OTcFJbbwzNEOhrMsjvDmcSObVPS?=
 =?us-ascii?Q?y2RfWAE2bOtpgHlSn0ku48UG0gC2S/6mtQvcDiYEL4Swj6nJiO6RUXR+UXqX?=
 =?us-ascii?Q?+Vs9FAe2F7xpkba1q32/MkCYo6Y8of3MDU18+olEu6JtSFh5aypNzYppzcJm?=
 =?us-ascii?Q?twRiGosBZebeVBYUjE7S/APq1yVt/YpdPp+TvHoV+0XIiGtgus6VK8JwPKB8?=
 =?us-ascii?Q?JSES5Xcb3fBf1dwa7VXUiu77ey9as9jSZBZu+EMQQ+H+yX/hohnn/54vKRg5?=
 =?us-ascii?Q?j0CHOPA7ChuMVJfFPaRJnfrPNh8yMSRj+tCX7XBHr4vxcSmYlJ0+HBQ75qFo?=
 =?us-ascii?Q?XdFKXxQyPACrL3srbKBiy36RWdjoiHXUFeO4kEQqoS9dGW9bWBPh5mTaMfhk?=
 =?us-ascii?Q?y725MunLUVPJ8QA4iG180ZewwI5z/No9IoWqVvHdzSg8k6gWvxc4+YZxcxKo?=
 =?us-ascii?Q?vLaTIA7ZppUEdUi9tl1oNBd3Ku3NgxPVQzDT7qYFPQy7yLs/mT/EovQqmkon?=
 =?us-ascii?Q?N7AjSMMVR3OK6LKfvpchBjhqT8u5u5Bvmr/LUeHEx0Q46gNFbEJ/ys6BmgEd?=
 =?us-ascii?Q?++udB/NAmmUsW0wHjAL907IL6wpzEtkjZWmefQ1rdLmMMd6wEmf9mxFumNOe?=
 =?us-ascii?Q?ktGezbPPJsbfclu3pQW4WYv6Lhb5JzRGBdxhOMY4BADIaFFcBCdXpcBg+wbE?=
 =?us-ascii?Q?llMklzZPbZCneYQvLXY6fSTj0zB+TsGmZr3xhKexyz5u/eEnQwz3tzcBp04q?=
 =?us-ascii?Q?WDqKg8i7Uz2MWHJNfkD4+idEeBE5/AmrwEWOAuijE1248iBSf3XgzR3Rcf5d?=
 =?us-ascii?Q?Gw5hpOOUfHOc3fo9jcG9vFddI5Vt1FQOnBJcbxkAxkFz/7yr+TSKzWtAHGRm?=
 =?us-ascii?Q?QCOsI2np5hzhIL7CymTlkT35z7ZPfQl1xpaJQIbf5yBsu2o6o4ydpmNi2Fqa?=
 =?us-ascii?Q?jVhU2LqzL7uL4ymD9CET5esHBZ6W4TtdYZ5mNZnf//6NG8Or/tlkCDf67+AH?=
 =?us-ascii?Q?+0GZuqaSaUb9aPNXst/6UtGIj5oa6ZwltcQebmahBEJCtG9TU6Xzizj48LXi?=
 =?us-ascii?Q?P25dYXHfNTxcS94pVQfd8LqKI4PMhwTVZwUasZtLW1YpppS+cVqRBQ2oxQgr?=
 =?us-ascii?Q?OLdtQ+k6BQ9J7r7EiS+s11vAwyPbV/wuxpyx5o9iBTDk3qN9aEdD/FwkGbsF?=
 =?us-ascii?Q?tKk98YByCcPuGG9INyLcfDxIxaoDKEPSkMDfG4mec6qR9tSokhLpp3VCdkl0?=
 =?us-ascii?Q?4XnpUb7oeWfn/KwvcNaFYbHiVFu64FwpmlCAm5m/60qVnZ19cUeljhs4mZUk?=
 =?us-ascii?Q?sa6/Gx+IYzcMWIEsFc36v/PLKE/hjXSbJKQTMST56JbdgnVMfUfgghOLLfgO?=
 =?us-ascii?Q?CqM/HVSUbrgpmBh49E17tBN3mCXn+qOBbekzfsVqfaFQ1GMnfLsXJkHXKkK4?=
 =?us-ascii?Q?qrITol5J78QQ1Jkbu068I0NDcTdjxBsgKz5EtaQnn78n4UAUoSzaUukyQ6g2?=
 =?us-ascii?Q?QOGJCQRJZb8XtLdMyjZvwArxjY6wIsBMym0iiqRItIzOFpu0KEQoOGANoJ+l?=
 =?us-ascii?Q?9jdovVmcpNaFXX+7if2nKkaHaNEj0YFUUQ7H9Hr/WDzXK6OD3qJi32lqnLgQ?=
 =?us-ascii?Q?M3RrNR7nD46NxlVBFp1aDkU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+Hw9Re/gz1iHZldKv1v26ZLSyRzwl69hZCqMmohOG05XALp8vhJKUWpNaEbo?=
 =?us-ascii?Q?mRlWumqtPxxoM6ovuRuZWKgK/FzDV0S50hkPu4IHgD5shw5HaFHtBcnhK6zx?=
 =?us-ascii?Q?j/vkfLzLqfv9JdFgl4qMJo284BUZ00jLOuWGYq9dMdNuNlUZt+XFFajIIMfY?=
 =?us-ascii?Q?vY3C8P7hU2TunkqMX0aSpi0dG30nWQKR7qHCGCnwVP2ds/Xagz/lLw827Y1h?=
 =?us-ascii?Q?frCX+UEbZHHHa3P+07/sQZvEKD7rsWnt5ihxV+23aF4KhB8d6OgvKRb2mP2I?=
 =?us-ascii?Q?wVV2D5+Z7f8Iv6r78fQ7AUZCLoAEALKbBENEykp7VorU/iRgu9JlbuZaSify?=
 =?us-ascii?Q?OZ8cgu8yQxZ3rbpdbM32uRc5iXclfyd+wEhtfHlR+4UYF+GK5JJHOhnVmv+T?=
 =?us-ascii?Q?xX7kI2v+Bm5QFSW/8vIrH4JgKZXiOkoej7M+iu4tIKRs0qfhrLzcxxv/84Qm?=
 =?us-ascii?Q?l11CUGtVAMtSiXzjhrjN0CnpI1+I9b2+kh7lvohdyuxrmsopRODYigh3e2IT?=
 =?us-ascii?Q?f5oV/16zVJlMoPe/8shPvklhiCfqod1BLKd0ZPyhQnMuQbXeSy4HMxFPProA?=
 =?us-ascii?Q?xvCVxNBNKil7ZaWSLC1lUsGZEcJqhzyou3CS2sYVAXhZv3zf5Exf62zuSJY9?=
 =?us-ascii?Q?GpMCXYtwbpxrIfmHt86/rG5reTsdVdCXu1rMvMxV7lDeFtFj/Zj+vdr0N8VL?=
 =?us-ascii?Q?oMbmp0GkhLK1/xuXEMoTznoNhlh5saAfQAE17Oc6KKM7URxVotwBm6ONHgDc?=
 =?us-ascii?Q?0PVTyPQI65vAzhIzyvOeyCK6lFPzBvzQg9ODOG2GZzuFbEHJzY/l3tDtU1QA?=
 =?us-ascii?Q?gc0XsRPaztawdNQ6luDV8eGP3501V9kxl44fJkB77/IWu0nDsm452AQ9v63V?=
 =?us-ascii?Q?JXwBlcRfGc4Uc1lvjC1F7OiyYkPfYHXYpeQxWzV00V96TDrSLPazepyjTWEe?=
 =?us-ascii?Q?SV2wj/MDHVvhbY3kF7IVTB9pmqetlIXaTgOZs1gm9Z88+OleSAwDlF8b9S2b?=
 =?us-ascii?Q?seupQ5lMZw+0KdjAHVOjIsZD6fGm3ZdFkXmDu4HgJX1FFhuGFsil9iATN6rX?=
 =?us-ascii?Q?TZOid7HFN0di+y+ZdEmASAUAUGzT8mFYhEdOWhmPn9XTjRjtO7uTUghhwdGO?=
 =?us-ascii?Q?IqisxXdu69ocVO1iYFYKY415e+45Ry5TTQm6sUBWIs2EjzZ1cu6DGvYmGWqF?=
 =?us-ascii?Q?5QZIDJCX4DtZw4QUibP3Uedbro0Jagfu8RKq/5O5OW+jF9kuV15n+7SmwmxE?=
 =?us-ascii?Q?vXmDDN6BT3oFXx4P2ZLyrnUX6GMsbIG7WrDUP/Kfg0oMS0p+rxhyg440VJgn?=
 =?us-ascii?Q?hphYL7qgxLKqPDFjQdKsj/jKy4qcDhGXG22nYNIO0PBeW6uHle5YhsNhG5Ju?=
 =?us-ascii?Q?+2B26fpgH5bvvt79ZS89zJx4RzkXNfd4VzoryEjGkibBjxOyv/rP1q/XzoY5?=
 =?us-ascii?Q?jOx0RIhmpyebA9DwHEpo4o8/Awe1j8sgAnlEA+OPK7wcT2Idgu7bWplpxlur?=
 =?us-ascii?Q?KjRr5et9sLH6E1CAywwesrODOjxRjL2HxaZzmT3CmCYQEQOXNZN1LmWgwOps?=
 =?us-ascii?Q?Lb22v8Q5xyrY66hUkopLc1PRMy6DJ/c/IBxADU4dv615LbRhgK24AVcDe5d6?=
 =?us-ascii?Q?MbCV7I8FAHqEkQxIc71Tg49/n+s+H18106ZiASow3NABxkQL9BHMfgDkosBp?=
 =?us-ascii?Q?P1Y9ZRivtrwLC1qzreUu0Tt+UNFI+hpWPo/4toTAIasWb7yz30WxMEuWv4F2?=
 =?us-ascii?Q?8V5/iwx7eg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cbd056-7128-4dcb-a2ac-08de6404154b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:43:03.4555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTcncfI5wu5JQCYwY+LuIekY92nqYg1OK71k8yRg/rZWMLwcHMf3lkzD1QuA5FWbRBE14eHLErzKIFXOtYt29A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11660
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52199-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 35128EA0F5
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 09:36:06AM +0800, Ming Qian(OSS) wrote:
> Hi Frank,
>
> On 2/4/2026 12:56 AM, Frank Li wrote:
> > On Tue, Feb 03, 2026 at 04:23:39PM +0800, ming.qian@oss.nxp.com wrote:
> > > From: Ming Qian <ming.qian@oss.nxp.com>
> > >
> > > Use devm_pm_runtime_enable() to simplify probe and exit paths.
> > >
> > > No functional change.
> > >
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >   drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
> > >   1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > index 39022c1bf36d..877e6c4f7406 100644
> > > --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> > > @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> > >   			  jpeg->dec_vdev->minor);
> > >
> > >   	platform_set_drvdata(pdev, jpeg);
> > > -	pm_runtime_enable(dev);
> > > +	ret = devm_pm_runtime_enable(dev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
> > > +		goto err_pm;
> > > +	}
> > >
> > >   	return 0;
> > >
> > > +err_pm:
> > > +	video_unregister_device(jpeg->dec_vdev);
> > > +	/* set NULL to prevent double-free */
> > > +	jpeg->dec_vdev = NULL;
> >
> > code have not simplied, you add addtional goto label. You can use
> > devm_add_action_or_reset().
> >
> > Frank
> >
>
> I don't quite understand the difference compared to directly using
> devm_pm_runtime_enable.
>
> int devm_pm_runtime_enable(struct device *dev)
> {
> 	pm_runtime_enable(dev);
>
> 	return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
> }
>
> We still need to check the return value of devm_add_action_or_reset and
> perform the corresponding error handling.
> We may still add the goto label.

Sorry, my means put video_device_release() to devm_add_action_or_reset() to
avoid goto.

If it is complex, you can keep original one.

Frank
>
> Regards,
> Ming
>
> > >   err_vdev_register:
> > > -	video_device_release(jpeg->dec_vdev);
> > > +	/* Only release if allocation succeeded but registration failed */
> > > +	if (jpeg->dec_vdev)
> > > +		video_device_release(jpeg->dec_vdev);
> > >
> > >   err_vdev_alloc:
> > >   	v4l2_m2m_release(jpeg->m2m_dev);
> > > @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device *pdev)
> > >
> > >   	mxc_jpeg_free_slot_data(jpeg);
> > >
> > > -	pm_runtime_disable(&pdev->dev);
> > >   	video_unregister_device(jpeg->dec_vdev);
> > >   	v4l2_m2m_release(jpeg->m2m_dev);
> > >   	v4l2_device_unregister(&jpeg->v4l2_dev);
> > > --
> > > 2.52.0
> > >

