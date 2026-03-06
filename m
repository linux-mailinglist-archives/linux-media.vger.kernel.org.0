Return-Path: <linux-media+bounces-54836-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEfjL79Pq2m4cAEAu9opvQ
	(envelope-from <linux-media+bounces-54836-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 23:05:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB7F22831C
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 23:05:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 028343024C9D
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 22:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EEF494A08;
	Fri,  6 Mar 2026 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OycGBfS7"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013071.outbound.protection.outlook.com [40.107.159.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C64949F3
	for <linux-media@vger.kernel.org>; Fri,  6 Mar 2026 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772834745; cv=fail; b=kB0wL+l7V+ChcnWCdqgYMiT5+nPeR+7xn2I1gxE074r3Js7kV56uYFq7i2VQGis0XHlsOth6rlf8YIxrDtC4oKOz0L5t4RERojEf+3oidzk4eoRlFNa3pNRwb4bq2uH1EMDwp4hl3VHTRPW68HNWK/vlG7/8h4m+0074SUD27I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772834745; c=relaxed/simple;
	bh=4zrJxbi+r/wxNMC5kVS5Uzc9RVeKbZC/KuPHOVI55Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VOzv3+mIrLTBZ6pz8gtEFIGKQGFXi39r+EokS9dE7mOyJBDCkJYAD7Ole5rV7I4hWBrbsNkfej9j2FjpPWpyfqK9Vst7l9k0+ZM8qmXypKp2kGD2uMP+lKBTBH16NByVb6lHcrf9pisicZrFRbdrKwi9e2ZqUuGQPY7Cd6rV5as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OycGBfS7; arc=fail smtp.client-ip=40.107.159.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnjNMPOaSswKtqEIghTvWaOlJxw3jL0i2hOntFSPwBXyMIHwC2/42ruy/4Sh0l5NXvNS3J4dbdxPVqH6wpOi7tKJJvp93K5EM+mshYYM3M2pWtuu/WxpCPtHt8Bl5OhnIaXupcHg8qetegFD9noiG4wkkWfbL8wZZF8nGHDP9cei62UzAVnacMCywarI23kNk3SAkCevbNFqyzbYr4qkVRBNMEDvEIzrhVkbBm7EytPqTY2V8G7xa5j+fGNE8pyX1XLDTXglRPyka327LtMj4SAbTZxRaB5Q6AzCJv4xOYAoLxQNKfEJEDoPv/MCJTmp9YK8UpJDqlpdahaV1PMdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHeyFjWViGBk5ttQEl4u9dr/gLx6bb37nGCsSEGbUO4=;
 b=XXHWRIu9+KECfx+ku2DrrR64HRkeIIRpW+sdsDW47q2jvnc2CRIGnn4uUzuPZNm/qcYc7m0hLY21ur8DTzUbUOTU6kLUC53fj6P7OmrpFNuID9mn3/7aoo1mZ2/AzKthDlo2CHrT24VcRnLeWsBnfvHfAM/MbDDv1KNg7Wyu8g56EXV1mpU11B4Maxwwh1/kN7uX5aTKZlQMHUih6Prh4jj6jqa6orcbLFnAEB67ZxqH2EcHv6TIqBI6Vsp4ScPmiFq+99pcRFrdsWR55JTmWZ3PK0shNk5qqVPn/hY23GbH0L+QW78khoq3pIwqWkTaxLig5IeXtjy7PP46HSQXNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHeyFjWViGBk5ttQEl4u9dr/gLx6bb37nGCsSEGbUO4=;
 b=OycGBfS77X1v+bksGnZ8ZoJCOp+2Rz/daOIhtjVGuPiJZ7NIA/fDY9T7EglWmSRlB1nWF4pciRlrycUVLnJZJOM57qPtlPZuHAUUe0fCZGc8tr95lJmJSsnBMYq+xardIfN1r3Rj5S3h/o0jbFZqPoKeGhTSBcHEdzSIrTBWk4bv/xfW/CFSEXKgpHaHqZR/PdynO/ndRlxRM89RBbWsgWqzhBMNSd59n8NZM19Pj4SHrrV6idaVIQn+TlO2f7tAupxOLJmP/dUWCOqnAQt4Hf9d0vFoyAVZw5w+xPJuvQalPlgRIKv260DeyAuMzX8Q/F2J1mreH9alavjacQFZjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 22:05:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 22:05:41 +0000
Date: Fri, 6 Mar 2026 17:05:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, jacopo.mondi@ideasonboard.com,
	niklas.soderlund+renesas@ragnatech.se, antti.laakso@linux.intel.com
Subject: Re: [PATCH v3 1/1] media: v4l2-fwnode: Return -EPROBE_DEFER on
 parsing NULL endpoints
Message-ID: <aatPrySYV8ych32h@lizhi-Precision-Tower-5810>
References: <20260306162009.673081-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306162009.673081-1-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA0PR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:806:d2::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9cc091-8c80-4800-daee-08de7bcc816b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	1ybeLb8VLkbqbimR2CrKtrv1h7Xdi4x0AAF8PjDIn/fqgwdkOMtMQZ0JTDif4TIyMxuJshvpVOFgbJdOkjRHhniuUUiTA2zUHn3jYTbZD9gTQWXkxe6A/qDEQYJa06fK1Z9ly2oMiGzbLyy/cH36YiFdbVPMPZgFZaPj3YtAm208jWwIWeIEVVJsw3iW/BQ4Mix6XJvhhvs2f7773RcbF1JxIvAqYg7/yXqzB1/FNMogedoVBw3/P4byrgj6qxsG7ge/RvPzkgNQG3j0d+Kosg4E/rk8D3yhkFDRORpkDpCsmBXDo4MVu+OQ2zxZjxVmdTn1UrcoIAsuZdCtWS3N84xhlvdtSCIbo1Dj1tu8GEh8O5SHXasHEB3iszZRoifEK2yzDw9mDzYX/qNSGaJTIxDlqgTOS5kDyoT1pRIpRT02T1AXHk3NmIJqTS2re1hlwNWJH8YZz+VHXMYAbd3EcZc/ss7tH4xL0G3cysABJlrgKMbvGfKSOpjDCJ3eENcHyBJv2jMh3C8+D9MmJtfxtKOMvH48QA2O4kJd8/SJ3RsozbAZzsdFAQoY7aOuj+QyjiskszTFDG2uZZjwWtJoUH8wO0NUoVUBSO5q003VzOIoOuICOK+CAKPKEzfiOHrWbIFsjJuASY9MC3KuR76bNhUusZ9mjBZIaHItALUj5P5FFJZUsSew2aOO5vyZs+Ajlch0ye2PBXfBmbk1WDzQvP0JLPJZZa03DjnouT95tQQiz6W2XN0VD3WuwEwqE1XFLYq2VSKm/Bd7vQY5q3ET0rQVmbecJp4Bbmp2TEtwOBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kk5/Cql13SODS1BuKwjcRzzVf5tyAg7XIMb9Haqy1pZZyb7vwmunkUO2d9OZ?=
 =?us-ascii?Q?wG6S5NIVE4tFVFwOEKJVPcHoXrtznrXAHowGmAx33hODw6kBac2PuPSmAmoG?=
 =?us-ascii?Q?xOgh6eJkrEan5xkxQmzkqw5bJVYKuVxHfqg5D3CoOkqCC4cTjBMlKcjijrWy?=
 =?us-ascii?Q?PHFrP9y6IC0XijBUvnf+fw0NfACC6mhSH0toNRE5mABZBxeoEc0NnleoyE6t?=
 =?us-ascii?Q?+JQFVsZuTAVa7JOvNNQtd7bvf6nbT2mMP2g5cPms6Ro3nD5qgsGxic+9HKy1?=
 =?us-ascii?Q?qikWKsRwZFHiWk0nbDKkthYepUv0MNncJ4z64UjbBPr2KXGwlc12URZtM1WC?=
 =?us-ascii?Q?umIarATIavaO7s0yLTHASrJbTVHh3lxZdnNONlYb4DIXz4oV7SYxHPP1JvWd?=
 =?us-ascii?Q?SQt+m9/ImMLf7fN/bizXO1IP+pAZcmXB5dJgphPmxmX4JQHelqNw7KBhK+Nk?=
 =?us-ascii?Q?x5jX7SIWGWEDLPIBGQ1hnTmAQruGzQb/aMqFR3iAzaXTPKyYVNEmA0gjm1tA?=
 =?us-ascii?Q?2CY6dKnBoB09jnDA5I0RE2Clx4zL0TfWZnZkoJIrKG1c3kavBLYm1iUJgnot?=
 =?us-ascii?Q?WF0xhxYqvZ8FTbmZd5BaXO5hVJ+mp1/wQX5xt3q+RfHK2v8BOcscT0bDVBhz?=
 =?us-ascii?Q?20eK1xJbKUHaL9rhutjjq9EXYYdwg1eP/m4/QdWfvRe2tqvHvjxZsH/3SP9L?=
 =?us-ascii?Q?0j6EyP+Qbb858XBdvSHmQl2SQ6dijOHPLhErJ7j/heo3ZRVh/nzTTzzzli1l?=
 =?us-ascii?Q?GsopyPQbju31Uavd/9ZUdiNvh4RZHKPwdyFEWExht9L7t+9faOnwufFDNCV/?=
 =?us-ascii?Q?h5KrnwrIUmQ7gXgKI9gsbYp98Tx8IvwvFn7rAwEpXOybdsMbHIsttJKUSttW?=
 =?us-ascii?Q?REUc1pEzu6KL/oAg94M/j0b0wHtfistIvGjlSaqhX4jX7y3x0/b1Kp5U+G+E?=
 =?us-ascii?Q?3NSvYg5m8Y8Hk+1FZjt652vC/xk4oKXYcyRJTM9hO7eX42RdErPfEc2SKgql?=
 =?us-ascii?Q?KJge8bPoRFNeRbmWGsK6ETZ8tGN1vsipPFqT1rjsDgXXLUt4+Zzc4/iOeEZZ?=
 =?us-ascii?Q?KjTsrM2wlIKuGb7nhhq9jXHVbdVFK6msrdah9rQ4LYTW49sAO34/2IS8VLlT?=
 =?us-ascii?Q?BAZt2WDsf//9BMXe1vGtokftwaZjbb3qqsYjosM1YfGFZnDimonbTbDhUW+A?=
 =?us-ascii?Q?JGaBbDQwjm+dnUHKtn/oN6da4UkFvCSy+fHxHuwKMLfnSERae2TTbUtrNbVI?=
 =?us-ascii?Q?BTr9m7GJoUidS+5V2x/hGYtXj/ngFGjoKGluZIEU8FyJ1i2D31C2kwd0l1GO?=
 =?us-ascii?Q?p5LHqnZxgl6SF5MMw/XFq0/TQmOIaoWeEFfOoVNPivovpRPQEke3zQ40dn8N?=
 =?us-ascii?Q?SugyqaFaN9vR95vjiFn5Ra6Rgm/lmu6BiO2GlETXW/NLmzvJZYSd8FO5UwCA?=
 =?us-ascii?Q?twnCw+WcF0ivCvD3mz0K0Zl+q+oJQ2W+MsDx+0BnpCOoDtvYJDkAz6dQRXYB?=
 =?us-ascii?Q?1viiw2m15Hh2bGSyVM/yC2gz+m8sZuwFQph/1VZlEBopXZyhQIqm0QfK74+R?=
 =?us-ascii?Q?mYsPMHjyWdPTNzXCJv0huQjO7DGnotWBLgI61CCPF0PWbLu9XkLVUFJ+JyC7?=
 =?us-ascii?Q?yoIGkHH72hOu2hUno+qii0G02HxiJ+1HaJ3hValtbdHgWkJuvf0DF1XfkkbF?=
 =?us-ascii?Q?9sWbKeT8t4zkg9A7D+QqkA85fMVB7gKdAcU1W8cAh6HKLRfwEUBFYcuit1qy?=
 =?us-ascii?Q?0LwwcAMURg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9cc091-8c80-4800-daee-08de7bcc816b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 22:05:40.9794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhMrAO7Bj6ntVctYOrVSK9tcqRHUW5sg1mpOreKT8yQ+rx63DsBl9ORZo5RJ72N5xajogw1GrXaSB2eUtZiIgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714
X-Rspamd-Queue-Id: DCB7F22831C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54836-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 06:20:09PM +0200, Sakari Ailus wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> since v2:
>
> - Fix documentation
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
> index cd82e70ccbaa..d7abbd76a421 100644
> --- a/include/media/v4l2-fwnode.h
> +++ b/include/media/v4l2-fwnode.h
> @@ -218,8 +218,9 @@ enum v4l2_fwnode_bus_type {
>   *
>   * Return: %0 on success or a negative error code on failure:
>   *	   %-ENOMEM on memory allocation failure
> - *	   %-EINVAL on parsing failure, including @fwnode == NULL
> + *	   %-EINVAL on parsing failure
>   *	   %-ENXIO on mismatching bus types
> + *	   %-EPROBE_DEFER on NULL @fwnode
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
> + *	   %-EPROBE_DEFER on NULL @fwnode
>   */
>  int v4l2_fwnode_endpoint_alloc_parse(struct fwnode_handle *fwnode,
>  				     struct v4l2_fwnode_endpoint *vep);
> --
> 2.47.3
>

