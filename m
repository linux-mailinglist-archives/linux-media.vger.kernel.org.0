Return-Path: <linux-media+bounces-56117-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKSMJHiSuWl3KgIAu9opvQ
	(envelope-from <linux-media+bounces-56117-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:42:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB8F2B003C
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 18:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51F37303549B
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 17:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3994337998B;
	Tue, 17 Mar 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HrmcxqiQ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A919F37B005;
	Tue, 17 Mar 2026 17:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769330; cv=fail; b=aNt0MwQub7Kb3TSTlp4ldYGYzvjT7ook1QW+CJNA3nWWBIGI/UiYyOBTUYYmpX3NnCqkdgv1fVosJFHvkRNpa8a6MdHKCfbD0sS71rPFiVMyi9Mgli6m3An+1R1a5Uu0x+oXxcVLtxcI9DQHKBbugPPplIob8Z781ho5sVRChGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769330; c=relaxed/simple;
	bh=+a2r35F591TC3h5ji+48incLRjm9nLMpmN9uimY2CSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rbaZKhUq0A7Ko5n+YSW5sJryocvNJ/UhzSfi5n27lYwZ6JcLlgTwLV/yyq8pv3kuUfFj0yJzO5sB6DQOMsvLmR7yNa5a7S6DDMwLQ1CSVCrhKIqSsO9uBsdj452cssv+Vy6DFwAxDSDnKZye1vKqz5K+3gcDEzTN4KJzoHyUT5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HrmcxqiQ; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGeSUwyJbhLIcdW0xhzwcEPb2NAerQjfyZ+6o/R3oqKvHC+yitg1byG3g1DMmImuDDFishk9i4ixemGv7oWdh/Lnvqcm2CQmPV6USGbcy02GwFs4i7B2x9pTJpFPxSCU7Vbi4wv8tTByoIXy2uOHNJDnuoj5Yuf93Y8DbtDvEyLrKK6Xb2On9lN0RGxxMBmhGJSY4Diok/7WFHrvbfrW3R1e6G8CLESGvz/BI4/vP1aUc//PO94Fn5c3L1f7OHnRfaGmDmabw4f0ABEfQMrziTYFvyii0w9ocYs8mrOAUC8S5mmwfrci8+9w0h/TIKJhxUwpB8tLGWZEtLes9J5bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K6HNnsZEK/qVV9/oT3AVZqOTDwleeSnBhGCek5bZ0o=;
 b=kKBzq+tE/mEz0HrMWdOlUD9fDeFD36Zp+8mDxjk6yRaGEXBBR9npfmZ7+jwApOl+vcjk2zSj4v4VXdRxiTqemVh4lxIXbOZ9SgCQNFsdHWOc7bKPysV9EfgEYzwK4jKbVOIjDLIuOBopYDhlySL4ewM0ORn9bSURiTqljp+bFDB9xOWDM8VDEZlxE6kfwcvGovbCX+pkR1QZckG8hbYlnI1VVfm6io1Gdld3ByKQaDXyqqn1GLDjYGlHRIWTvA84I0wmaijkbQcP/s8Dcr4Jwnp0D3Cll8gjqCHQW9UYrooSqmTkSMcczD63KWYQdvT4tyPfvX12eBEmDtuHXfiqFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K6HNnsZEK/qVV9/oT3AVZqOTDwleeSnBhGCek5bZ0o=;
 b=HrmcxqiQU3GpwIxsk2RKWKPzWwrZNo7oPBS+Ug0mdxHV1upfY0Ze/gUF9Hfn8jPjrP2p/RM3VYsyKiEBU+lOHz2dWB5wM60tMPWQYxPYe+XK96UV1jT/PXWkVFEgLuGAvsM/UFqB8xvSZUUzsjJh6EripNq1G2vKyNVvVmp4wqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:409::5)
 by OS7PR01MB17833.jpnprd01.prod.outlook.com (2603:1096:604:445::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 17:42:06 +0000
Received: from TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495]) by TY3PR01MB11948.jpnprd01.prod.outlook.com
 ([fe80::b718:17d0:6c0f:1495%6]) with mapi id 15.20.9700.025; Tue, 17 Mar 2026
 17:42:06 +0000
Date: Tue, 17 Mar 2026 18:41:52 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Move suspend/resume handling to
 LATE phase
Message-ID: <abmSYLmElEqzom1Z@tom-desktop>
References: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11948:EE_|OS7PR01MB17833:EE_
X-MS-Office365-Filtering-Correlation-Id: d2070a96-cb89-4f15-3e24-08de844c8165
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 A0In+Ta77u6g0pKN0m7V2BqYYfR71pc1nsnNqG/7uMc83rg+MiPu1Z/YKNmOy0etus+74M5metSDzoVHk/K5HQqtdqmuPsWVRxbxBb9rj6/tkIqoanFGK961EKVnrHpUBnZgYOyFCdvqppWsszPzUqMOY7Lq5nTC89+SZL1HKyl/hqzzUaBJ1t7DP51H4ChjNe4UEZHsubV7X77vqjc5MqJjzEJaY4CCchy1ha2LuPq//6fQ+z0EO7qE4sKAkSOsFW7xWHGb9ERFySZPUWxDOLKY0cyxH4M/pDab/TkoHy6W/zCFEkaMpJsbmwH8/cwD6LtSwjapi7AI+PFI8O9VQWBfnXod6ECYII7FfXXH39MtFFatA7o4mBVFpTb9lYEUpZv30l5Cx2BJ3Wwv0O+Q5MD63mj+7X+gJf7oMCJmR75UMgXtzczP+mwQcANm8RDxwXpVwtyOZnNZXcALX1lRteya1DStqrTqcey4PQGiYWRgaVwCEa8uHWRa+E7BKCHoVxCOOruqxx74tbaQejH985PPTsoXT8oILiXPigsoIqa9R6tV7GXIwLqP+crkEe07lB6csXMyZ5KSRqnUrNjCevojSLDcLLzXiXfiizmy7ymT0YiZAwyhqvS6M3FDNZDBNMy/dFBKWHTWQ+k2CgLETo6U/TcyvzvjruZsdZcRNY2YcKL7EljJjozUngZesMR/Zom7wkFIfMLO0Zu7q2keRPU7s2ZZbXDrrdu23FmY2VQ0djx66vkfyo4nLgJekI0w/L8vi0U3KvXUrhNyiwuKJ2gNpNhEf0IBP+Gdc7HN9aA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11948.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kIkP3lYFWm/68xmj7kSK1JELyuS9EY+ukvzGSlcEjeLy1jN82RGOGBvxXJ+c?=
 =?us-ascii?Q?VfaIO+HC4DvpoK/PlHyhT9DXIZGpyyOzHN1VXmSxgPnBEB+Xtiab8SNRg8BW?=
 =?us-ascii?Q?tWdNw1yNUmbdZfXU6YMD3/qZUnIK2NQ8xDar2NXYk6ioYWcvi4/rrR2LSiTI?=
 =?us-ascii?Q?yIsraMydrUPkwPCY4bOSovor8VRbb53tMTntRUJquJvaWHaIDYthJrSewhUb?=
 =?us-ascii?Q?/iOs+DgZz1iVhUZuwHQGxOuKS6kgAkBqNjGEcvAwVSQeie+HnAetwAcBdkUT?=
 =?us-ascii?Q?AQ88vVc61c4XOkgUp/9iZvNSPU9qXEx4dq2eYneInOxFGrpddnDTMLxMyPf9?=
 =?us-ascii?Q?amhpeI4l/29Dp04bxVwMu78mXJdin9ZC5cOmQOoCX5bgqhtyJ7qOCg/2MpFV?=
 =?us-ascii?Q?w69zj/FlNGh0Qk8cVJQ9cUVJx5aAOQiR48ySYP9cMxqWjHZ1OXazpcS0Gq13?=
 =?us-ascii?Q?6d44o+pan0kXJ0f48CGy4mYCYZYYKEfLiA/MPn2Th53Uuldt8JQ8El2Nf5fz?=
 =?us-ascii?Q?9ixZdpSAH/psp4NchwfYO8aiO4z8xkVi/oVWgVgbIb8oWnVXGWKFSmAj/wR5?=
 =?us-ascii?Q?HDp/aZPqxc+NjZ2uKYl0c1U28bfHQqwq9K+VkKJv6oLVlnXPjNsXaVRzHDs7?=
 =?us-ascii?Q?leS66SohP/kHqe4bCOi7+EhwLooO+lb89lJn5ah1A2LwDp+5AH3Ol3jV763/?=
 =?us-ascii?Q?JMQ7DyK2UKgqT4zoxmSBhOinAZSxZkZog1GByoeyuNb9e8/VBHSZToiye860?=
 =?us-ascii?Q?J8PsSlkdVB7VSMrJY8h+DPE5QgP9xeKLquM2Y+5pW139yb4Lxg+OzMjM+nYW?=
 =?us-ascii?Q?jzElyCKR0BoOS7nyet6FywZVurRfAfsvztxNuSqXEopKTrvebMI7Yrm5O81z?=
 =?us-ascii?Q?4+QQqWXKGn1TikgBEKUR8r7J2d196kSKxKRUl4WT9g0YDskoq9HV5bb29GOT?=
 =?us-ascii?Q?msdcBXKdoExxkEWxMQAgxHI0OBAA44iWtlr+nnE8UzizQbYBlOUIi2ah4jmZ?=
 =?us-ascii?Q?LYlf3YHg1JDXlZsYmshtPEBZR70ln3CIS5mczh3o+SaDBgQ6KhxkDsOU6C1O?=
 =?us-ascii?Q?UFD9H9qCIKZmtvAO3fqxhopxj8bXX/mMOHhloeEinDL/Qlhj1x+GBzBmLdv7?=
 =?us-ascii?Q?kR2LHp8li8ZeIpUf7A69bdRtjBiF8+VNg8ldl/v98Wdf4wVemHsYnyyOH6oP?=
 =?us-ascii?Q?13+Te9olymjMrZElDhpx+BUvLVD3WbyMEWbB65802lYGYQvH5NjbthAStO+6?=
 =?us-ascii?Q?cr7wwI+YzoZnOkiLpBOcI5SEjl+s3qEgOOLQ2zXgBLl3TKPP1tld9cZzwqbB?=
 =?us-ascii?Q?pIsPt1okcvh/GFWRx6h/ffje+HTOOJiaAFtX/R7XOZ4xwVOEvEBHOx8prBzr?=
 =?us-ascii?Q?myXgx0s+7xIAEv5WuEq2ZB0PXAsgr7V2TEUgLYx6/LXgfzHQhIcbPg3DRaDP?=
 =?us-ascii?Q?4GYxsZZ8ctpcwVHuQi9C7tKmO0WU8hVwRfYYqdzb9/u1zGilmZ7Q498tNMsU?=
 =?us-ascii?Q?LzIuL+fvWkcsoERMl2tNzC+McPmcBf4EmpPcO1Ha0sW47ncm/V4Lr3phC5Ae?=
 =?us-ascii?Q?4dzTS4Ecw8k/YF/mMsukoQZbQJFIzrflDMPykyhlnFXX9jG/jG8Vyur4a3EQ?=
 =?us-ascii?Q?MSmJqyVY0KAF72nSIxzND9RJvQ1C9a6LMbaCickuXJnpZGrPcmYlNnit+OeV?=
 =?us-ascii?Q?bmR6x4HNx82hIjFTU4oC7quvGFneWd8UErVxewJ8qSHdLa6F0BhK7ihEPuP+?=
 =?us-ascii?Q?ieaTlF8B8PR94ziCOruslqjm1ZMWXKdn7dlmrWcFIUOTV1z7bAim?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2070a96-cb89-4f15-3e24-08de844c8165
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 17:42:06.2624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJ1tsqiE0W/OUP45C9P0xGXJ770/+nVAW2mhoM1ptD0RGlz5aePcqI0EQU2y7YzBQYitjFsn38Fr5U3LdwPH4FEu453cMV2k6/dww3hpOF9BBSJr9IUnxn7rgqhZnN38
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17833
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56117-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 3CB8F2B003C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

Gentle ping on this patch.

Kind Regards,
Tommaso

On Fri, Dec 12, 2025 at 01:11:50PM +0100, Tommaso Merciai wrote:
> Switch the VSP1 driver's dev_pm_ops to LATE_SYSTEM_SLEEP_PM_OPS to ensure
> that suspend and resume callbacks are executed after DSI/DU suspend and
> before DSI/DU resume. This prevents timeouts and vblank wait errors during
> system resume, such as:
> 
> [drm] *ERROR* flip_done timed out [CRTC:43:crtc-0] vblank wait timed out
> 
> This addresses display commit and vblank timeouts seen with DRM atomic
> helpers during s2ram.
> 
> Co-developed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 2de515c497eb..0fbd27df1f46 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -693,7 +693,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops vsp1_pm_ops = {
> -	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
> +	LATE_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
>  	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
>  };
>  
> -- 
> 2.43.0
> 

