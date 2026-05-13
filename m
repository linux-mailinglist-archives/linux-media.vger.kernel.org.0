Return-Path: <linux-media+bounces-61538-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFW1KsfoBGqnQQIAu9opvQ
	(envelope-from <linux-media+bounces-61538-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:10:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CAA53AE0F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 23:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFA173007BAE
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 21:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE04B395AC3;
	Wed, 13 May 2026 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZXOeI34m"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAF13955C1
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 21:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706628; cv=fail; b=n9D4CBrPGyj+vWy5tlXaXHCoKfJCuDF0AnI24mA992bR5gXAQvd1HenFsrIaAudVO9Aqq9LiIvPRl6YgEBZwDLs7RTNe3ibZ0Hqy1MLkOTyxyeAwM0B0p/i9iesitJLlOcjsnWw0HMU4+keHEbumSC0Rjzd3sm4stHdHR3/F3Z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706628; c=relaxed/simple;
	bh=vOeHU5ztRlOy8CJqkdaXcntLl+N4U6CorRS2FwM43XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LqSTjeWXtHnKrhyuJWRpP2uL43DeITkJi89S7LRWzv8HfNzPwvMUuMLp8OTLTZ1Z81TPQ7voxYQEz9a5DT+brkbWWfBsBT0yD0qCi54ZKUsmMq4YfyhQq2E4tLxWREq1hqeyQ7N5YfdJ4KF6uM2U7yVZ9gQlWm5huq4olFKyocI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZXOeI34m; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/nbq8LthxPEKB8AaDXrIACppAN0kglvVacwgBxIEG0vxwJjxemK9/KH9kKBCs/hh2Fy94hrdawxZ8eRkeT8wBmp8bJ86oAOkL3mI0YlyTwVMSOVOaGAAcF0ZAmq2WbA3VzFWbTdHLOf0u95vHgKvfo70Vv0NuBliyxu1HDCyHFE7+7dVRVCs1VBhJ0s1WA4URrTLyewrrR5Y68n/SLAdq6tAQY82BWmJJsqIqv6Wsg7xGJlQ6u9mXb4dm5VZ+AgytPWIvl1yjyJhoNLbpRNfluh9FMBrLKgKQ2kC+he4DOMzi+bw45U4xOjw2nskJyEsN+q7JcpG0RF3VokZLOiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM+t289f25BfCuOn43YaaIGFpEIBfEpQo/qdOB1IAAU=;
 b=B5ZxPSR2qpLuAoWtyil1pvb+yVKALcWa0OD06XOzfIoAWuv/0B44wdvvq/uIbI7QsM7QuKRMHidCcm8v6mGDcIS96ImKK02sdDd+ZYcHyDDLM6xtWXHWRy6V57xHB9s4vuFxkplx9AKpbmqAXoTal377IrTmv/jLx5PJYLeUtltDAWY9lEDON8i37b1uSc+ZMAsXA2Kc98+2B+zauXPyNPw6ffOKmYMO7t0SqACLqcrtyzwf0JY+DIAkYhhzXwobiNdse+FlpCxnvtnmVQvLxUZI99ohYknNUOizHvLO1BJqloSiNQJHnHG/33z4TwSWe1CH0eAofW9gEeolsPq3DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lM+t289f25BfCuOn43YaaIGFpEIBfEpQo/qdOB1IAAU=;
 b=ZXOeI34mRNybtag0WV71ICkk37Fy9GCP80ZbOXapJ3sNxyfLVJChtEc8N4trFlq4MVtNyhmAZtpekckhDV/A0fkHDkvr5y50JpXCbhpbpFeZ4JlmmlBs1Wvaha2+EeAVKBElFpYzvkVoe50Sq45y06fjjpgd1NKfMnQzoBxw86TG1Zgo8YPLmhFe3+O9MSWUgyWBb7jGIdnzSSzmQYiaOL6iQGcNck7+qQCJ+TUxtHwy1vjq0RjaHV7kRd95I2NhDCGpzIARCaIxHE3ZdNL2IliLyBag4gYEuY6+ua/iaR9x7lY8l3FfRVfFdrWE+CQV2Vm2joNSFbQQ4p4lcUk3Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 21:10:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 21:10:23 +0000
Date: Wed, 13 May 2026 17:10:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 02/17] media: v4l2-subdev: Align frame descriptor error
 codes with routing
Message-ID: <agToueX6lzE506Nv@lizhi-Precision-Tower-5810>
References: <20260513104358.2252605-1-sakari.ailus@linux.intel.com>
 <20260513104358.2252605-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513104358.2252605-3-sakari.ailus@linux.intel.com>
X-ClientProxiedBy: SA9PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:806:21::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: 83899db0-d600-47f1-7238-08deb1340c09
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|11063799003|18002099003|56012099003|22082099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
 xxoap1LNqERo9p/ErYJz1sbTXZ6zsQ7jzixHogS8vqJXLX7WvIytrlJBIB9m1rldQbIUIg4t/NQsCA71grhYo9UTiFh+cGb8YbGTkYiM/sZq99lmWIjdhgPhOC8ny4cpkNxPK52si5fUTBvpPMTnsrvnQ9Vm7fB5Otc6beocPAToGDpboVwwGKzydfBi8TPw2lYd1SqRYQm2ulpGYZgqWqXjn7/DQpb50Sh8vnAs3clOwueaijE+KgsS3Pfds5C1HZXYqn3nBySbh2WLBUY60E+5kugcUWpE91b287vODSJ3wPN7xv02Uu7k1Vrg5AmzTaYPKaQ7cMxpT0uK1CdS/PqLYel0ere/VS5i52pbHEuNQsAlOHaL/zvBvXYifmrJsgnyrn+hhRDpvX0MiqVAqstDmcWA1IOGmOqvDXMLYiU9bwQJbeEAm5phTNYuGiAZ5pau8GIx+5DzOUzNhtkIP8/lI7TQDJfwDwTNl8pw3Zlep3LsIKxGJjFXwAVtJw0v21smqaL2C5Q7RFknOOyA6idrMuRJGdHuPTgv+TcIFWC9LuX/7XPIkfQiO1LgGB9W0TVYUHI3bSn7D1tPq8GxnCjs1AnnNZ5HCdeKUeY03sgrf4OXYRws2K8+2MD1HmDtYVuFzO5oVUt176qGA7zZky/PvXssf6jlBxNOhiX3jakBUw45qxCbF1f1B9/5Mvolc38p7ntcFB94NFyfR9UbHBxLQAWbWBcXHqdfLt+qEpK7M71Cg5lBXmDAcXi3jHr5
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(11063799003)(18002099003)(56012099003)(22082099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aQ2Kk2Sfxy5zBp9UJBH5x6zHlg7RhlJW3R3bQ02TlVTPQIf3bB6pVIJINuop?=
 =?us-ascii?Q?vTXb+olot9ijdX/1dzNPZDIGAUGF3061i3qFeF8TUP5bf6cDkeBVIZwwKpSo?=
 =?us-ascii?Q?tlY6OvJ/Nn0myoBTFIc3tg3K0jsuZcSjF12o44mTcdQkl1SrSbc2miICn908?=
 =?us-ascii?Q?btqgVcF/kFHVJg3utK/okNELpJuNuMHFjerAiCUdQlsf2FKRoQ26KEX9Y+dZ?=
 =?us-ascii?Q?zfqC1RlSCx3xQqPwdVofKgKL7Mfhoc1SmNwOJjslK9Ljvk39Dr0Co+HeUg7T?=
 =?us-ascii?Q?sfQRS3kgE5zVfhXes+6lBAvvpKZ9ClCanEzhyycs2ZUCfUzun3bjyPacHB59?=
 =?us-ascii?Q?vnf2ZggNJkNhk4c1ZUbrdVdl2XAzMF3zXdWwCFYEZdHG0rLJ5sGguTsN7Ccf?=
 =?us-ascii?Q?c/7QC2tKKoLqo/BNO6DlqiM4QofZdCEJD4fzrr+tfa86pEhrGdYPGswYwGFc?=
 =?us-ascii?Q?Q3o+5NH8c/0CM7qBqlHTQXL9VC36u7CvuliDI9T7zcEnol7CvvZzX1JkvEvG?=
 =?us-ascii?Q?bIIhQHWouR1YfDpRoA0rdhYuZpx1XeZr6OOZfz3fIQegQDCnmYJM31xoJ2an?=
 =?us-ascii?Q?y8YciVabYmCyec7/lyTqHbjsMrrL2VcCdmmGBfjLoUlZUTlAJ1O4Vi/tzDyS?=
 =?us-ascii?Q?8zd598zGFwSgXKr1CDuN3LoDri7VTtcrZpb7iTBwiVvPISqzR+JTAg+nOk01?=
 =?us-ascii?Q?VO+pYMjnlw7OjN6P06jUh0iRvYf8cu0ANEIaKpHIEPQtIGTYNKjLPZCecz8h?=
 =?us-ascii?Q?DrPbaGST8cqzeDFAHzYahMqO3x+eY4bXDTIK7hjvYPWJefy93ya5MeZEnHLy?=
 =?us-ascii?Q?fa1BtCZExiZdDFosmHT9Ak1i1X9RqWMsmLkV2lO3GrajjTAfjLEb4n0ZS7H2?=
 =?us-ascii?Q?zxC8w2W7Mipgt53LBrTrrh9XXDwRKaQ/xq0A78/zuN/aWawQtyU64A65nASg?=
 =?us-ascii?Q?Nok9lKQEnbp1D1UmJnbeiEIQUMh7kCIvj9yw5UI82DQz7jX/W0P6LYPUHU50?=
 =?us-ascii?Q?2T42b/AxTvPweouKrlPipSA/cRsr4FL+XJ7oLMf72eS3WCy54mg7KDCaKmLH?=
 =?us-ascii?Q?eUHk0WKcuLzM0ZsCLIo8W4peUKtYQA0PaFzHNrRkkE28T/W0errei0BdRTdv?=
 =?us-ascii?Q?Wz8/JBdn5A1oowvq8GbSaZnmQn4s32+2IrJO3mRJLX6lyU3OwXvUcZY322CO?=
 =?us-ascii?Q?IQ5DmhT3YVwlopXQKCMyeb5g1IUZ16QuKWSb50KeItgf+17yRe0YxiCAGvh9?=
 =?us-ascii?Q?qWsfNqHwumYSssYa6KkDeQZ8KpZegYbeGJf46KjkFfjcAHXXYZyJiPPMO85x?=
 =?us-ascii?Q?TcI172yNE6qasGbVx7HoyIXW4g0xyBvhglX29VbPefV2AjvNj33veL/64jA8?=
 =?us-ascii?Q?uKm551+yGI6vgMyvuM6oIrFlAGPHaP4cJaBWdCRWJQKWtgGwEcKOt7wZ7mvH?=
 =?us-ascii?Q?SkMkYIyq+1S7ZXojazqJgA2bMcmr6UPiXTML0drX0dOfzcIDE/Y471/mXzHw?=
 =?us-ascii?Q?y13MGmUKtE/Pi8K/049TlBhUMFX5Ei/HmCKU4ykwsc1f4mExqEBRuLbPk2CX?=
 =?us-ascii?Q?Pgu723fn+cPvVeF3qhJRgKJsbAOkUCA1+Ynsc6WwvQ0ID1iJzHUEwrqCB1hQ?=
 =?us-ascii?Q?Z+wS6YIVS7dCkEuzjgleXzDBNjtyNbV4IjJHcTvrKVhQ79VA4HmBC41zEJ9e?=
 =?us-ascii?Q?8bVcS9RE7nEVMkrXbr1C/sJ1hUPoJRnIdAplnuGvHtlNXlPqzVNSEesDKzVr?=
 =?us-ascii?Q?+YXQNt7/wQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83899db0-d600-47f1-7238-08deb1340c09
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 21:10:23.2970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSJo4W9CWVlly+qyjRzAEDxG6Y4oFKrMN/guC2yvgKnKEAxVdbhCAshAC9JrMN+gE8jkTz5BhPq6+mKDFQ9vfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
X-Rspamd-Queue-Id: 57CAA53AE0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61538-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,intel.com:email]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 01:43:43PM +0300, Sakari Ailus wrote:
> __v4l2_subdev_get_frame_desc_passthrough() returns -ENOSPC when there are
> too many routes. There's a subtle difference when compared to -E2BIG, but
> -E2BIG can be used in this case as well. In practice this was unlikely to
> having been ever returned from the kernel as things currently stand.
>
> -ENOSPC can be then repurposed for signalling of running out of entries in
> the statically allocated array.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index e9f81b9be9e2..d93ed50255ed 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -2639,7 +2639,7 @@ int __v4l2_subdev_get_frame_desc_passthrough(struct v4l2_subdev *sd,
>
>  			if (fd->num_entries >= V4L2_FRAME_DESC_ENTRY_MAX) {
>  				dev_dbg(dev, "Frame desc entry limit reached\n");
> -				return -ENOSPC;
> +				return -E2BIG;
>  			}
>
>  			fd->entry[fd->num_entries] = *source_entry;
> --
> 2.47.3
>

