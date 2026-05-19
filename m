Return-Path: <linux-media+bounces-62190-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP/TB1HcDGp5owUAu9opvQ
	(envelope-from <linux-media+bounces-62190-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:55:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8814B585577
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 23:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED4C83025C11
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 21:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8EF3E92AE;
	Tue, 19 May 2026 21:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HZu6WZmn"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCB3DB309
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 21:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779227725; cv=fail; b=hlcTdujeCzwQ76SiEYzDThDdJN6z810+Rc0NzoFjg2om8x/8pLL0Bg1oEFwM56S7WAdEbM8ZPspmQP0JZ3j0C+50/JRWZJ2BTneOLbv1GYYqwQ1W13zETidrqvvstAOtGwnnGUtCCiiIaQtejTRT18nGaObcHpQOWUUVV1oq6zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779227725; c=relaxed/simple;
	bh=VBeR1rAVW/C2s6fr3NO1bjMNu+3SyE2xq1z/dIrAvdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XVRef7fiefPxjcNjlX+btd1y49LPF1my47yiyz+2slxjR3ltkNdTlQ6cl/gzgm5j0Nw/RLBjXT/fPjx8xbT9x8yliDpDRWXtYcuEusdMCX9LR9MKJpYmuBsinFB7WwYdKEFUot+kWnTlbt0uWN8W6EtVilQv1kdrWeLvUZRUBsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HZu6WZmn; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amNa4IVVaHOJrP0b3OObyrq61AsLXiyjIkpMfcg30JJVflEzZNbqj7yS+YWNGku4+CAiK+E2zF+uzT0u/VIWSygHutJGgnVbSP8RdEEqxVgfv7vbpkYx4rZsg3tueyM+Gghpn0sqXp9IXz0XlDpXbH22uBx2b+7b3XvcVyzsV/R/dX70YP5rJ5PmjoITqG26rQMn5rlDSR0FX5LyqlNwfWYb8lwRSJ8h8FqlHZgi4jjwfbUfIWlTAy3LNO7iSt+qVv0tsCJZPxCyDc48YojW8ARiHScKHyOlFZ03111cE9RRqDevLIQiXOhbpq93+BKQH9rO1wlxj+jD7Busa2xmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SdwTnhWRwNQJGc6f6PPOQw8ueRnkFu2AWOtGygnzUo=;
 b=IIk814LKxLxMMTDfZfHsftGnO7wRpofnz3hGv6AFKT6n8wjfV91uQZu+WcJv/6UgNczpBDYZOv53BUw4ODDRELwH1m93tY+h9Bfbp9Qy2/V6WBLivpj9PI8mcUHZCLciCB/2VYo+HE31vDW0F7khEZ/MNc4HYnPN8XbMgKDDtZps2GihKGXduZoRRSgbpJ3Ov5YkiosxDMgmHzk8cRi490zms/uIkKctpNPCKUyE+8ECiMV4Q+/1l2cIX1Mr+IqgQ/M4sBjSAVh1p2QeHZJgZe7tlhb7hq1a8Wc98O8FgCX/CtHhoAweKiVRt6ok+Kp6wwmAQCSYBIAFOzjVutfCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SdwTnhWRwNQJGc6f6PPOQw8ueRnkFu2AWOtGygnzUo=;
 b=HZu6WZmnXSKVrYU4Q1TYO2yizhvF9kpG3bQrJ6EdmrBEYuGwvxz+Ba8R8LvKhgAP+1TN7KHufMELhVhWQRAn/P7WO+zBCBJIQZZfuUm1tonSlR6uih9JRnFDNQuwa1nU7cry49EjH4w4xu5CWU6TBdhqdDFUzbhlfHCS5PwIdCJGq5HNLCfRrQoydof6zqrvCQwRDUB7d/SKvls7q6NB1Tyl+n49LI40RPwnuIoncCJmsnZizpAjSL0FK9OGZx6PdCKhmGz7c8hVLziEobu07zLF6ksFunZuItzpmMiKus4kP54P8LbaKPgTOYl7gYEe1TlnhLH/7ultoCcrGLzUiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 21:55:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 21:55:21 +0000
Date: Tue, 19 May 2026 17:55:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 06/17] media: v4l2-subdev: Change the maximum number
 of routes
Message-ID: <agzcQ7r1fBNVpaek@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-7-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA1P222CA0068.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e14da2c-d1b2-450a-6ce6-08deb5f152ac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014|11063799006|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info:
 4LBqkLVJ+E8cUTF4IVsLKQNVlV9ln4C4YSxnSb9UzIqnabyE1W3HLpEojgPPZtum1IPV4IuXicMgf81DYtZ8BByh0i12gLp12JbvTbtb/C9Z7K/zLuxj5I3hrtq4Az9YW/a0Mdi2A/iIfhsOK1wvxc8K78AlBcT9eAD26lipb7+4M+ZjNCWwjFuDmTgdyhttrkWCMC4f1qPEiWz4nsTy5Fhbkj9qBIHzWNQUZb5bQgoTaAjfOEWV/5juqMKGoo61UGrS3jxpl8NAZShi4Wv9zMqa66wC+ArXUwbfUdbA2iVjyZrKQsPckQiYs0v467/5rsCBqE5w6wI3/huUM0HGdZunYE+5pxP3VGevLc/HAI20kgQQUYKyS1NMGvelKioH3K769nkku6QXkukFNiqwzPlRHm9GmQ/dOmscgh2piuSiF90T85/HHQ5zIP6bV0axoqw9U3YvJ968kZEfWX2JAm/OevMkxkn1b1lQF+PRQWf2miwXPF/YA7Y+SMqAgEmAB3X1arj7X8WTgyUpFTZxXOK40JqhMj8SIza3r2tNAnhq11k6cD4UgS9TMXKt5l7DnvJJP+zM72St935LAbSv8ufVPtEh13PzyEGHxn8vSiUZDYe4iWuZFvj057foA0hinxkrgRGKDejQ6FmR4bR7jJr+4cpuXdBY8dNsZl7THSS/vCPczKngq/aBjo4l77g+U346L3jTuvo7p/1bP8s3ntHuNOQM4uhCAYDmkWHiWsM06PYOyg/bRsP2c7Ln2dl5
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(11063799006)(18002099003)(22082099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3LffTO2tBWRbTLXvNvVk4XmRh7a0LFNn9DyaeCNujhlRCbk3ObNC9oUEfqBH?=
 =?us-ascii?Q?tIwvfmriOTW5QnyPzWUD9HnrKtqNftyVFXXQaogE+/d2HRODUHnY6aREO0YB?=
 =?us-ascii?Q?3Af6I89Zm5+iVPsduC0cwnt0FJnoLJW5CPAeg1dR2mecXtKDLY0iVKnVFRUA?=
 =?us-ascii?Q?3pL2erURAYPFnl0OmvEbywq2nov0rUyuroSLwUoZVIkc3Ckaq9mkgihg7w7i?=
 =?us-ascii?Q?Mt4KDydrnrQSZHoi2q98ZlNKYgScaDwIPnFHE/FFdb+VNd2MEyEb9lGNosdV?=
 =?us-ascii?Q?yGrSE7flcywdKG0TlMDFjAr4Zq7b3kDhcyYmuSZigTa0XiiRY+wWBH9PxLb2?=
 =?us-ascii?Q?GHdClCSR9yDycATYNn3Q1NPUkDqIDqQWKaZpFbyJYnVtxRqoIi9e/OgKvp+K?=
 =?us-ascii?Q?oB3/VoruJtyYk7YOZKEoA3333jJklw9eXC2Bso6JvAI8qUxUffpzB+62w9Wh?=
 =?us-ascii?Q?UjXp3TV5CUj8hwYwYMoLQ1bLov4zqOK/UcDwacyqcWpBwriNMo2dF9ugnO+N?=
 =?us-ascii?Q?QolTKHUokKRX9SfqdGjzVfHMxhhbUxoqbLWYAny7lPND5WWqb8XZ4yxQDvuP?=
 =?us-ascii?Q?fq18uakW0e4dhP+WBq8C1EI9Kuwl1TOCR9CIrIyOFELJ7NqACg5ivdb54v0R?=
 =?us-ascii?Q?YJYe3MRMXrPkijr1Kg84cWHxJ8/IxLuQTulFXu2wrHeLwt85i3cqoss3lJtX?=
 =?us-ascii?Q?+9B0OU6KbiUx6RbQmgOYP1EUOfPvcOU5d98m6qfOA7zZRIVB846Ni6dK97CT?=
 =?us-ascii?Q?YljPjlEPgO8AMghhcd0ePmIJDazgVU153Kj5j8jWFNvvm9m/mthrSfRnor6w?=
 =?us-ascii?Q?dfJ7WCWJ+hg1d1ELK0UCfi/Aa9zIZEJFT2dempJW22zUkN8UmeCTSjCVx3Xt?=
 =?us-ascii?Q?e0KLGRMgkS6gxAwbMRKSl5EPVhPHvFOMnLJnu0SnHQYy4aRgVaxQSJkQsJvf?=
 =?us-ascii?Q?rfvr42ZvcCSvrmgd+COYjHl7UncCRp2B4F+O1KCOtTymbrXtA1aOjqwqi5DY?=
 =?us-ascii?Q?ZkKNevb4x+B68B1rrB352Kuhmy+cMyMHIWxY3Ke1pr8H17v0EJrYSWFrNIgg?=
 =?us-ascii?Q?kUPyCsu0L+zdE3zogxYck8OVpHeVQvPFTj8KCRPnUwGX7eiQErSrriNUoEBc?=
 =?us-ascii?Q?8JRSzlFoKOyAyODpSSc62wdU8eEyFkiOVd634FaL/UPaSebWRaXlrywaFKQs?=
 =?us-ascii?Q?NlRsfWxjRQv8lfYddluwCe21T3udP5UjOp95ATUjySsgR9RZpClBEHx+Jl5s?=
 =?us-ascii?Q?S0ETpKciuuKdrrRV1c1R3mEioyhZk/dGl9Yhkbit4avDxfO1yD2WMx1EalLh?=
 =?us-ascii?Q?Z+S/DHM83Dq1WDPLXAQ2tvgj8nckLkMgeZpu9knb/RfznK2W0HVb4hnEb1IB?=
 =?us-ascii?Q?JtQo+VPpQ6TBEh7IYkKeOSj5TnEnUFF1/xVb2LSDdmUEt03KAIYR1xleUupx?=
 =?us-ascii?Q?PNK6o4ILHJ0lZnlu+ojR8FHMEvQn33Isij/2a9gwzay1VXpTSPTkQx8VODoE?=
 =?us-ascii?Q?6ZFkdvhhjgZMOuEJatOysWaszCSTvLbD/bAKqC/FEnorpP2SM9T/IdTE7lAp?=
 =?us-ascii?Q?7kWFUKi4k989oyIVaMrp6bvNU6sshyNtDK4VKNcvDp8muor4ZGXMN9cJC46P?=
 =?us-ascii?Q?3lY4f60BdtOG83bJD9hnhRkW8z+Wms0LYd30ul5DOT1IS6sVM/Pr8iNhdyKU?=
 =?us-ascii?Q?78cExo1QhCkc7NIn862qlcrn+QDdeJFUzTGNKxMidHhi6pUxCeksFtQ7Luzs?=
 =?us-ascii?Q?Z/HxXprV6A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e14da2c-d1b2-450a-6ce6-08deb5f152ac
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:55:21.3244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3LobthL0z8D6J8jP0jZFJFY1PtS8CQ0yessdjr3HQ9LBEM1X80ROwrPBVrnR6W32uFY4QBLRRDm/JLtD6pO8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62190-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,nxp.com:email,nxp.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8814B585577
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:06PM +0300, Sakari Ailus wrote:
> As the frame descriptors are now allocated dynamically, allow as many
> routes that there can be dynamically allocated frame descriptors.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index da8464dfb265..ebcc0b40fac1 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1103,14 +1103,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				num_active_routes++;
>  		}
>
> -		/*
> -		 * Drivers that implement routing need to report a frame
> -		 * descriptor accordingly, with up to one entry per route. Until
> -		 * the frame descriptors entries get allocated dynamically,
> -		 * limit the number of active routes to
> -		 * V4L2_FRAME_DESC_ENTRY_PREALLOC.
> -		 */
> -		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_PREALLOC)
> +		if (num_active_routes > V4L2_FRAME_DESC_ENTRY_MAX)
>  			return -E2BIG;
>
>  		/*
> --
> 2.47.3
>

