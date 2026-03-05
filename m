Return-Path: <linux-media+bounces-54672-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIqiEYHaqWneGQEAu9opvQ
	(envelope-from <linux-media+bounces-54672-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 20:33:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 934D821795F
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 20:33:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7780230C8D26
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 19:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D516C303A1E;
	Thu,  5 Mar 2026 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lYSr5NXb"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68AB27FD54
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 19:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739140; cv=fail; b=ZXNiPlv85yRF8naTFlz2Rytq6q4I5qUeOavDJBHa1Il0Is0Bfblrkzftrc4YtlMMWWIo4diCk4e7c/xXCRocFIDG2b3TDxYi3vKtXgdjFAKZWY4AyzgSXXuX9JESpbtTYK996If6ObmMw5cESojyvlsotKQO/pYf04yPrw0Dydk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739140; c=relaxed/simple;
	bh=Ti+RLE0+fn+4JjPaDV1zZzekdSUaqU535Kv+8DkwN5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VFL2EJT7lsRDjUfLBBUzlk50A5cRStB2v6oQwtyDm0u0zK+4GfVj7ydCFNuYEQL+hKgWLeCAq068g6QFAkXno0snvabd+KhPZ8ZtQzNFXGQQox02Ct/HYvn8dGrUQzPxYf4QEs0UFKVKFHiKmvFr+jPDrj2scWka1M3UvGxvz+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lYSr5NXb; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTqz54J4Fat37YGKbv1PVfXrxjpurSOdsst3F0Hx7y2HzZK5NERsYYup2YyKraoX/7ynxwi/zrS07v5Ec/aCMz05hWGFcx5GYtbnt6Uhl2zEN2aV71CunigJQE6NTIjdfkcss/b8uHGv1FjcH8IAP4uV/VgotQJuHp8goYe8u163fnjYMjaC4EfAcz+SZFMMCtT5JKf2Vj1fiLwHk4y3wm+MGAtN+kHh0/fFy6JhhSgj6qs6R0lEXJY0fu5ykVQfFJIR7C9IOwAYQ7wtW9DWUwncpew8UfvnSzTfqfYV8OfW+FUTI+6BkRWtN3+mf8IdZA7VavdzcM1bG1YVxZiemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YD1PnS4/aGWP+JZe9HzCO6hRejwWBwn8JFXu9Mc44+s=;
 b=Uy5ISJfoxdcZdwc3l/2fZEGnPrwi1qSuCbFCOr6W1/3iE1PRHcvbtZh0VwUa56++SCLWoJ+e5LxxWeMEs3aDZizbpqgfEEGxJ/8+5EfVQ89zftOa6XtpIHFih2csS2r/SO8xhdYWLqzItFxnF47JbYkYs0iPTrnMyQnIE4itmZy2KdGTgeVEtGhWrKEJBwLngF4Ofx9QyLbllYg3ywpWkEoTMKdD/FTCdZ8P4ZDdsA039wma/wzpf1Zk2rkwp+BI44tm+fpKZh9ajp6iYuFn7j0GTMAsMu96Ly29Mc9OR7dU4BHD4FholGTvx63ykw0Uhww6mZV8wN0XQSo9MCvO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YD1PnS4/aGWP+JZe9HzCO6hRejwWBwn8JFXu9Mc44+s=;
 b=lYSr5NXbmGpXvfxK13oibBSfasvJb0HgEeYW6OqYrSy6Pd0OM2BA+cBCiLQFBh+pLeN9z9ZC1M6gK8vJ2VGq6CgGItySvh0nNAiO4uKg53BBBP8f1wp5UVMVuBtqJbexYDL9ZHtjM1PXWxKUu6ADPjLAswctmMGwCjkHAJgBvmvFcDYFK6RRZsR1ecIVNElR15Yj0hBeVJ6E+sll0twydqjHF7KOh9HlTi/diuZFJA8Xht/mFQmLn8BSWmKNJzB/QJ4T9+64KHyWXQxKyk1bMJc22w1xTWlLnWreBlaVXkP6smoTzMQcvYwXRxKGsIgPl4qZO5xmoemxE5Oyo5JEXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:32:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 19:32:16 +0000
Date: Thu, 5 Mar 2026 14:32:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se, antti.laakso@linux.intel.com
Subject: Re: [PATCH v2 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on
 parsing NULL endpoints
Message-ID: <aanaOQgQbpzSmooa@lizhi-Precision-Tower-5810>
References: <20260305173558.3907731-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305173558.3907731-1-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: PH0PR07CA0046.namprd07.prod.outlook.com
 (2603:10b6:510:e::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ae9ecd-fd51-4fca-f4d0-08de7aede858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	Ojy0jyIl8rnDIm6RUIExRMzOFJ7MQoC/Ma19kiwbUKkHK3N5/3KgLbLVnM9fQKJ5uG4kwroKFGtZVYSLk8eOPnpkBrq76dva4ZQmaVsiUdgj+zMh75YVXTojr35R9594UAwfoizgGjQf6rffqq1dnelk91+FhWEkpkjk8Jpaye/Gxul0BoPGBRMs8XCk8cVRP1Tr6RylncOZ9rb+pz6b+5Bs7Pyjj8rzMaF+89JlUuniqXsbEs+uqJGCbj2Hn0ZnLD3krpB3VjtabFlwM3eY5llp+MIWnQucdjirmYtCoY7s+luwIqbjQG3LzM4JI3bK4kl23I4qgyssopJqdsg4k9IBy8wtcxuq18h79eVTvapfQSsysxK8zlgRLvyGwShltwCB/z1GQq4Ph4736AOYIUtOr1ZEQydZCo93jrxm2RG43xDMT//eEUSJriMnZI5n4zh/nre4Of2+F2F6JXwcgrrlEpOVcrHpubbWpfaaLHu7oVeLF00Wn00PKbKuFCECeofzBSAX/ORE4rkklChQSch3Id+y6wJpUPmyUwcBlObG4yfj33AMPyen1hvxxGHlgf1wJGuJ4dAGqruUeS3hc7hpEL+iI4cT+Gj+7/AFOdyDv5TqLeWc0tBu5MdEhM6prbeExk3ro11iByEpqeV0JkQQJks7V7YBTBlkl++oWrYxhdfvenpw17PhZmpC1FWBLO8sE1AE98mxH0Jz8M8QxRX2Q2mdunsAA/bX7IoSn/uILyGP/glfWedv4H74VPrhCXsLpGjPLm0BCoiDfblYU7xqVIYk7yhoESpyj2f3qNM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AIwz0MYKFAZOtwYb+KhDLoyagg9BETmaDt+62LSTHeZzMsj9ZSNnHsN6aUKO?=
 =?us-ascii?Q?HYDOp8kfd4d3droTZeDLqhn13fWWzhuCxyf3nOAyZMi38ClJ2UNTeEBSWliD?=
 =?us-ascii?Q?yTWfXce4PIwqEIFJ6UjAshRAyNvDrTJ4mtAb/M4rIOH7eF4o+1Xe3DDdfYT1?=
 =?us-ascii?Q?60vB8eoyUMyzBpIuYSR1jUORTS5lu7MZDMRxLNJMvQbb41ieX34/vjfXhqbz?=
 =?us-ascii?Q?QFtQJQVraWOMiO1VWOiXCtugYVATcqaflWtMQkSpQVuXjlZU1UwYbk1kQGim?=
 =?us-ascii?Q?mT3HiU5DAXlxHRUMPW0GgFEv+6pTNoNKe20UU0gh207ufpbGKgd6BtTnnfEn?=
 =?us-ascii?Q?liluF1XNvkzVJoyRwCLCh6tJXaJQWY52yRMeeBN6lMnddPG/enuyFXpp3d8W?=
 =?us-ascii?Q?wx2U0OypTYIP2nOBdGci0PnYPQdZr1NBWP/E7D2chePgBGUKvxtxKz+56ll1?=
 =?us-ascii?Q?VGlM1aGDPCmhue/yTSna73o/l6i1YOEM/eoReJcWKw/pUob3xNdRlveYkx3P?=
 =?us-ascii?Q?YhKfgkN59RlrD8eTU94kkfqMuM+t6nSRHbQtxcLt3qG9/rAsdheqDu9O+95+?=
 =?us-ascii?Q?RdouzSSrTCbBq6ddyazEIm4BGKvnzlY85AH/leqxE0+Jwy/dmN96sb8afhXe?=
 =?us-ascii?Q?eFWD0xQ+N+OCK6iuc54sUU0Dp0gZznFQfliARZw0uD/vC8i5i+uNk/OSpHUJ?=
 =?us-ascii?Q?l64kxVU7xU9zViaPtvJHO8W58WkaKOqGs9qUvkhdQ/qtnl18Q6exnNumkbav?=
 =?us-ascii?Q?4uWtZQGEjaxf/O3yqnGb3uCjBT7VYvD/3u7y38y/SkaCbIs2JrXazQkbdLBR?=
 =?us-ascii?Q?mhz6vWE/vE7mg2NMosvgZ8XYxvNJzgx7aPJadxdb4XJd7Y48ELGxZ6A68S0G?=
 =?us-ascii?Q?EB+i9Fcd27NuK3VI3W4W6SLCk9aYMZOcFvCPgowBzv7pyIfJOspdygUEfuse?=
 =?us-ascii?Q?b8G6jAv9o+tF+zJldnE4Tv1R2CBYXmbUGpkBvTys2htkuedc9aR5qJVQvMDV?=
 =?us-ascii?Q?Gdzq6SQQ2tkmuA3TuIIPvvzewNfX82nl76X7vP55bYARqISSlgWQpPgh6LMS?=
 =?us-ascii?Q?J3JZU5TLe3Yu9LkPi0Yeb03EiVI8OnVaXMIbmtL8gI4J3TlXy4sXypztPKAF?=
 =?us-ascii?Q?uK6vtDW07DB/oOPx5faUrWxtGtY0UjkwrYefsJhS/Xxg4PC/Hb31waXr0Oqj?=
 =?us-ascii?Q?HHPoRrr9qiaKuCCw7OzGCFf4gZUl/BMYQlFfuSt/iDj3p6Mu3Oe+J8bNGsug?=
 =?us-ascii?Q?aWdKv9ikxp+RpgLRwY/vB5Rjk4dReRZGfQ/T8zwncr6pMmkkzP/c3KlNVdyG?=
 =?us-ascii?Q?PhQRkLi7Xy96uS5S5c05HI5wjTA/V5Ht6+0yc5U7e3qJV7N516/S0heHfYON?=
 =?us-ascii?Q?2/uRtINtnOd32LH/DBz0e5ddvPH1eXV/nxWgG4RVp6nbwG2aW6kp40RX0e9P?=
 =?us-ascii?Q?9zDASYw5ZHLLoH198PnyujLUp+YQ2wS1XBJhvQSBqutRtcHXvVBBjfqZrTuY?=
 =?us-ascii?Q?eeVnUjFLDMAp2G5MqV3em+q50F0tbzB1l8ozJ/Iuh/vzFhVWXlZqzBe6rrR+?=
 =?us-ascii?Q?K3R2U6WGYAcnnvgrUTewuw/2HFzjKapEZa8lGhRkLGZkVxEwomhEsDiNNmKh?=
 =?us-ascii?Q?rtl8FXTqbhRZBG5XT7mMx/H5T6BGykqgiVSfMjib1xCS8rkUcOsMVMO9AtFR?=
 =?us-ascii?Q?KKN6L6DM7nzmoPOT5IXP50R+SxBoMP0ivSPjtwNlRMsGeUfjm5ZUIJ0EVsbr?=
 =?us-ascii?Q?WhDLIbkTPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ae9ecd-fd51-4fca-f4d0-08de7aede858
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:32:15.9292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IL6Qy5stf/3/95S9sQ+uULSguNvZnPrXTsZkreNxQRuOgEFd/AXi/O7nXjNOjpeEtKWPx/A5nNv8hbCNSOusA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
X-Rspamd-Queue-Id: 934D821795F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54672-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,nxp.com:dkim]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 07:35:58PM +0200, Sakari Ailus wrote:
> In general drivers get their firmware graph endpoints from system
> firmware, but on some systems this information is conveyed to drivers via
> software nodes. The software nodes may be instantiated only after the
> drivers are first probed, requiring drivers to explicitly issue
> -EPROBE_DEFER when endpoints aren't found.
>
> Instead of doing this in all (or at least most) drivers, make v4l2-fwnode
> endpoint parsing functions v4l2_fwnode_endpoint_parse() and
> v4l2_fwnode_endpoint_alloc_parse() return -EPROBE_DEFER when an endpoint
> is NULL.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
>
> - Only check for NULL.
>
> - Fix the condition.
>
>  drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>  include/media/v4l2-fwnode.h           | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> index 03daa8c4ff7a..36b0495351cb 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -466,7 +466,7 @@ static int __v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  	int rval;
>
>  	if (!fwnode)
> -		return -EINVAL;
> +		return -EPROBE_DEFER;
>
>  	pr_debug("===== begin parsing endpoint %pfw\n", fwnode);
>
> diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
> index cd82e70ccbaa..44c985a12286 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> + *	   %-EINVAL on parsing failure
>   *	   %-ENXIO on mismatching bus types
> + *	   %-EPROBE_DEFER on NULL or error @fwnode

code only check fwnode is NULL.

Frank

>   */
>  int v4l2_fwnode_endpoint_parse(struct fwnode_handle *fwnode,
>  			       struct v4l2_fwnode_endpoint *vep);
> @@ -276,8 +277,9 @@ void v4l2_fwnode_endpoint_free(struct v4l2_fwnode_endpoint *vep);
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> + *	   %-EINVAL on parsing failure
>   *	   %-ENXIO on mismatching bus types
> + *	   %-EPROBE_DEFER on NULL or error @fwnode
>   */
>  int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
>  				     struct v4l2_fwnode_endpoint *vep);
> --
> 2.47.3
>

