Return-Path: <linux-media+bounces-62192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICBxJmTlDGoHpwUAu9opvQ
	(envelope-from <linux-media+bounces-62192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:34:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC67585B1D
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 00:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 979883043FB9
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 22:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D41369D77;
	Tue, 19 May 2026 22:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hXY5EOAd"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD62B36DA0B
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 22:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779229992; cv=fail; b=lhxymfN7nlVhiQYO2pmK3vv9SzywuCCwIX10oWHsAO7mbI2rFudsJbX5bZxr7d1fOei5m1bcYPMzuJFx8yswwoZmWZaEmoEFfVMWx7+9NtBfuqdBCMvnQ0XAJqd2+Xu1op0bddQ9YKK1mr9cbURIHLjA3nAlJeZg4QNxo7ao8lA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779229992; c=relaxed/simple;
	bh=jFZUxyCe8oGltaQlzSIq2apFzG65CmibZMyXOzYwqvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lKrWogBNOt3UcIN7sIgvBkYi1Ppk3eMfpOAJ4cTVGDy8ioC1EbjJLngIyxZc6xDkzwsH7VWutBqyOyPGi8gTsqN7vinLmYkSsGiRbPNKjC5G7NwPRaZNlmLX6n0F6Pgf2zWHcMycwKLDi/ihwp++7hyOoTf81bB8/30OPwy/m8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hXY5EOAd; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHPL/glGOhzlcGQ7PaT3UEFFOn/s+3Wjq4jT+22Fb4muzebiez5K0aARv6GENJBHBQ0ETWpXSL7W4yJcpEDU0tSQNPyso9LLyMrLX+e/sra8USHf9wQ0uL5IHZDZdWkOltsOKxd1d3LyHTTHrahv5gVjdZ5zks7a+bKZ7i/UErB9onp+NFrnfxE6sol9ZW8Jz8GfsU8M/F8A/HeXG4JOo9JB5lUpO5tAyjzwxm8PP4MQOFWSnEs/YmFP5eY83FEWALIA0nlwM4EiDPfbZ7A9TEfc5ClnEU4zUY0vocbT7OB39wmU0OdDcYBrci0ThOZ1ido+NoBDRQAUbgcAl+vTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3O41akplQeq1PR6JlhaNW96HmqKvJrE5Fz4y/+ETK4=;
 b=I+6YfgnDW+0LMYdC8KQ9I5vnSPBmsXh+ozizECAAIMgFt6dV/fO0/Lrfr+Mky+Ro0v2yw9oMcSewhJ8VXnfPo7urkNa7xQUlwRBMp/2BEn2ByIFwKBp90ELkfUSvbLM3h9HrApTCLnVGt/OVSErlV+CFfkiP296iwE1NcU+3kcBUr+GebCEgc+bei6BZ4jbQH8nAyjJrL3pfmOJEtaZPEL9GYYbrNUcsYBGMgH8HpE1V6h/wrWBAcKqp1QdqbWAwm0jXhTJ506zY2zszyShmLf624k8AJc99+kXbQUqPhKPLoaj1ZROvESgBX/TPa3hx8EfoQamdAwjQlsmJtnDWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3O41akplQeq1PR6JlhaNW96HmqKvJrE5Fz4y/+ETK4=;
 b=hXY5EOAdEOcyimQJn0tMJOxLkJvzVN1c8aZlPl6RnPhOUpNnYCFXqrutA3UXsrDOVegSipj8fUj8XmlXUOVMAzcg162YgLN0fdzrb+hv3tpHMtmtFEgj87B6AduvQW300UUHFu+wunm9INTSMH9U0yXjLNfi3BqbCfo4FdsOdPvz60bbHpDzxxX6WR0IPLfeaTJkpJKVUPnktfxe9/FRJ942TPwFgU+lBbA7jOJtB/oHB/Vv44bSyEbrDRNMqQjmHhpI5iz/vl7oYFWlOriyBWzrTEKAPs0wZdFGqItykmIFZLToLXWLJUw4aUCAGJyvZAlhB5FN20lvRP0eBXsFAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6928.eurprd04.prod.outlook.com (2603:10a6:803:12e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 22:33:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 22:33:07 +0000
Date: Tue, 19 May 2026 18:33:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v2 07/17] media: v4l2-subdev: Return dynamically
 allocated pass-through routes
Message-ID: <agzlHYL_H4Qv9u3u@lizhi-Precision-Tower-5810>
References: <20260518164318.3367888-1-sakari.ailus@linux.intel.com>
 <20260518164318.3367888-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518164318.3367888-8-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SN7PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:806:122::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: a48e6676-e571-4b02-0fc7-08deb5f69956
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|366016|376014|1800799024|56012099003|18002099003|22082099003|38350700014|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 7uE6iFzS8xM3ApHXrEW5/800Rh1NhgRjq6XwJfVmpA19RMGiR30E2KaZhN9d045GdH83sF39alDOPVu2lj/tIVt9JNlaMKKjQXKypN0JsYNxrYo59o8IE1Tf3UGQ7Lv2cuQyv/4Nzyu+NM0mTYK+5eqrX/OGy9Jchw7zHTqJRUNQabXWy2EUOoMFWjmD9e8fkXWzCLb4PFAo4onZyWEozOR3+YB9JnuHiav6UNvud9b4CarlfrVMvojh2yMUUoROVe+vDhHlNKZ7dHk3LrXHlsAjjf/UpcpXRiLpAzDCE+knKrZRZ7342I8ErcWx8kyiuhPSPWwWkdXHeF+JDiVC9/l9KB9EwHQpKokPcloTvKKjwGslIgJfzPT0F0GBuOMelHogB1A9Jrz56h0AVtxYQGCRGMeTKuPnnBzVpNkkHGbfVj85eo3pvZ6BeeiR1v0CuT+t+qSrZBQQE+P2swahTG1c3jvtvWUKH0chnabL+gvBVEHMNjSYz/bYqhsK4flbxkzDjzLyu0UM+4b+gSuzNYjU0kRMRJ+WOb7qbhRdm+8/E64vpfOqdismECPdusOpt8Ik/SYuxnCBZs1FIp3pxxArOXpf4wUnumM11VBVQiHf20yMbNPXI9CZxropM7zGpytgr7s9l7JymGpGCt4ktfgZi+QkBrg/toOZflGjTolXcFc7bGZY1mgBAJOHFj0dU45p/SPav/qPgN4su3q+fIe3xt0u1JefJP3Z8Lyze7J42L8IffbUyIVm4whEulH/
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?NO9GOTgyUeVe603L/DU3IzuLXS8a6MrBcR9whi54yZvyVxXv0JomkNKnpyg/?=
 =?us-ascii?Q?MV6WSFH3zq3HfVXVXD2Y7wmK7prCBQyBC7mqwQgeqlQpnPO7ZfFP4KocmY4K?=
 =?us-ascii?Q?NG8Vy4uLOwGcUiz7whqEe2tspnapldaUPfq6FJmb9jIpu1oM8aoVvtdHgrQg?=
 =?us-ascii?Q?Y5hXrg40TvaxImG+eunQfHwVlQIC2YhVAFreWY4/UArm7HGgYLzVHdbD9Olm?=
 =?us-ascii?Q?z2bZ0EFFya2y9rD2J4Mj2rAfeKABjsvpjswfosp0LrAe0moDNjLO3cShQvPF?=
 =?us-ascii?Q?Lv8NRnHlrNddhrPVwK9b+yIUKgZ4bSwCJsj8cCsNYaxmbWWiUgUOHhr3qMCe?=
 =?us-ascii?Q?vB6VG2MJCnQxlPXWWUvNs/87UJAjrASk7OLJ9/t1cI/jnccGA9MnAdL8gXRa?=
 =?us-ascii?Q?TbsLqkcmhYQezs1yQyzGTvuIsIybD1bZHLZ4BYbfOgEoSqx8zQEshNqKV+Ev?=
 =?us-ascii?Q?YAdE4F8m61Dt/BEI+3/n9SMczrwJMIFrWhubX9RSuNYEIb1zYu5plZJsDlpK?=
 =?us-ascii?Q?UEzPuSqDCYLdKs8iClYzW7zvdzHDxSTUxOD9wA19UzFplN11bA++61HNzPhq?=
 =?us-ascii?Q?uBeg4QTdbG7ExQziSx0ADcSFlDI+Fjkqh/WJpgz7XCWu2EK6VxNtE96D7aCd?=
 =?us-ascii?Q?Pvf5DTbDY2g0T23To6FQFR84MSOnEniNFc/LrHKTCxAKhBh6opoXFZaIii0E?=
 =?us-ascii?Q?ExO3THd1psoyvNs/hBYircfflOqVT8u1fB3uTJiV8eFaHQq1d/hfa66t/LVx?=
 =?us-ascii?Q?1BpndurnFsjEEd0eky0HJdH3EUPTfjR9yrEwJvlDtNaVFOdcOS2JF3hnSmsT?=
 =?us-ascii?Q?RvIpWeg482PKPUVRi/21fikFsNzUqFeCR9d0KMLlTefVj5Je8jdlFIyX6mhv?=
 =?us-ascii?Q?/anQKXHeEkjEeglKR40MksQoH65C3uXu+0Vsh16htsPQJGVFxWhmUV69O8op?=
 =?us-ascii?Q?IusDVeA97hsfIgP1E52Cf7IFA54df4mPQz3RsfBR3mkjgkW2teFBFPQv8MuY?=
 =?us-ascii?Q?n3NPe7nOR9MSpQEchxQOGYIV1MVm2cDTTaXpbhOVIWkc4mMEbB8ChlknvfAo?=
 =?us-ascii?Q?JIlv0DBcHhNGu3a9u3p6XGjANokGETvrPC+yYqdC8AhaIjO1NLTpTqyolyHw?=
 =?us-ascii?Q?SO/omrHXsfHU93MDLXUtLyo3mAD44dfJxi1igOnm52eopfMLDWHfHBLl/qMS?=
 =?us-ascii?Q?ZbLS+y2oKH+iXvThsVE5s2NwnDIVY3rmBB5/3+1+ELT9W9qpQcR8rrqoQHuH?=
 =?us-ascii?Q?wYzlK4QERt+sdzET2ht+SL1ujKMh7KtKtCLLSZy0M4F+VudfLr8hnrGYAr3B?=
 =?us-ascii?Q?atAo/8cTEWnZtKTdie1yN9GxahB3YARuvCeiF79gUThMegaWDXlcK2OMGEu9?=
 =?us-ascii?Q?giWrPdQtvEduzmkIn8wUhDU1YaesMy8fjxACBPj7spjGfSGwU1crorLdLl4m?=
 =?us-ascii?Q?Nc1jXa4c3F/L1FKSV6GTDWRwymfNKbaluX2yKQcZMiFO8I3ywSXvaoq4eKTq?=
 =?us-ascii?Q?2FuDd/re9VnCIUlkpV0lTQalobCVV+Po1s1UvmXg3wBTWhRdd+0MrmENHNzx?=
 =?us-ascii?Q?IiMqBlsJ+LmsKhNpG1DsJ1EipQRhR/7TiZ/hYZC1Mxf0jMdihPIsNmJ4SYnC?=
 =?us-ascii?Q?ADUWtTWiyc85qUyMk/m3DND5EDTO5pYCzk3pej3CDX+Bnrfzwuey1nSiyZqd?=
 =?us-ascii?Q?tyIHbzfbH1TfTKw3bqX0obDgyhIlCDmEW3sVDRnE1OS5yxVe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48e6676-e571-4b02-0fc7-08deb5f69956
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 22:33:07.3695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1RZLqojTZaQH9NFs3hRLwgjYNaBPfn93wfaZl6OQJbW0R3sJ7cBF/gfeiywYYPs7X8iaYCeXYJSlK+T+i1I9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6928
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62192-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 2CC67585B1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 07:43:07PM +0300, Sakari Ailus wrote:
> Count the number of pass-through routes and then return the full table
> once enough memory is available for it.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index ebcc0b40fac1..b5eef0baa237 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2653,20 +2653,22 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>  				return -EPIPE;
>  			}
>
> -			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_PREALLOC) {
> +			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
>  				dev_dbg(dev, "Frame desc entry limit reached\n");
>  				return -E2BIG;
>  			}
>
> -			fd->entry[fd->num_entries] = *source_entry;
> -
> -			fd->entry[fd->num_entries].stream = route->source_stream;
> +			if (fd->num_entries < fd->len_entries) {

Peasonally, I prefer use an explicit method to get total entries number
instead of mix these.

we can use the get_frame_desc(), but use fd->entry == NULL means get
total entries number.

bad thing is that always call twice compared to current method.

Frank

> +				fd->entry[fd->num_entries] = *source_entry;
> +				fd->entry[fd->num_entries].stream =
> +					route->source_stream;
> +			}
>
>  			fd->num_entries++;
>  		}
>  	}
>
> -	return 0;
> +	return fd->num_entries < fd->len_entries ? 0 : -ENOSPC;
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_subdev_get_frame_desc_passthrough);
>
> --
> 2.47.3
>

