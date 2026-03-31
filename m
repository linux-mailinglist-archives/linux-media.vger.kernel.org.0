Return-Path: <linux-media+bounces-57805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kO01JLn2y2kGNAYAu9opvQ
	(envelope-from <linux-media+bounces-57805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 18:30:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E030136CAC7
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 18:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0D1B30DF088
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 16:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570EB30E0DC;
	Tue, 31 Mar 2026 16:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="g9MONuf8"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E94B3F7A8B;
	Tue, 31 Mar 2026 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974387; cv=fail; b=O12BxiMnVvkmQpx00YHH6dwHdEJlo+Eq2KX6zCMZ8Gh9CZk8NEMVMV+X/qBsxdqZCG47FYfy7bqXA4JhBFiX/kEuJCdopOqCNH9zYy7YNtMIExH3FwQaedTxaGwVQ/7hd4omDG35eHSUGJzfG1ObaHZXOsCX+VthZWD9dGOrP4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974387; c=relaxed/simple;
	bh=FSc1eC2gVCjriYvUcaoF3r8eW4ZoByb+8FRDY4dJLOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ntvH7ljgX/G3SVpaCsk1cEyoeh/o1U2lV6hPrx34pBE2Zqddt6tRuSsBa9YER8L2VMKENn8+3aoHfrjj9IdyheLSlBqXOjqouTLygbI4lnNiUrilGtFkxDyh2yEHY9mBk+homN25CO9WAwM+0/zxm/jE2LnSPgYcNo7CPjiK1hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=g9MONuf8; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZZDy/UQg0uqxOl+F5FQkrR0OFn/BWa8eBUHMkU7bXSGyXwXKkKKtBgK163X3xwlzrzKWvzD5lWPjqogh6LK1DKYf/WKbVejgeKTVGvTtYi9aDhQtUDkzAM7/EhDvECc/Mm28W/f/0b+Fut7NqtiCtgFZeYHO7Yiqbe/ddYJfhd511NngYcDtaAciD2UjyUnh7p4ko6eIhUwEeepq0Lrln7OswcsY6X2QeSuJ1/W9jjGknZqxlVUsb9Re2d0PFohGNEE7cSRMVTwQhMq2hxxiA1OUHVJgDXFNVub/vPXcqB6BVKmiH3qMYDN8UxQvsDUkj+EuB0juaZekZ0pH7hX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhigUgzDosIn+49QaKycuCaGzujGAtwyLuypitQbFd8=;
 b=xOIaJyPuunWfNfCewLYL3WxMutsh/ko1N/MUK3nC8yQHfiv3nsfkkKvnuRKDmvL7Gn1Vjvd0YK/RyQiv0xjfqT+00ldvVTKMWF8JYZoe0OEdnRsDBOhBo7dcVra2THdeqgKQ+1uP6JE6rJSz/Q0XOVszSloZzTDVv8ALSarZIsu2/IeWIMvt/NNCI5JmzNfODiU/sNvthAY4x6fwZ02MrJJoQdlEGV7rx4iNvy/YZBBvNWAJNzYM7xfenFGlS0+xaXZWpK4kTmR9+3/WDxF3TXOwaPfIQAd0PDnXzrLxmihqT92sY2s43tR9ZXk7+Ob20vdP4BRVVXjQBiMej42CLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhigUgzDosIn+49QaKycuCaGzujGAtwyLuypitQbFd8=;
 b=g9MONuf8pCNkc3FZbyEu/k5fqSB+JCcL0XwAI04kUCTrxteoYepNZEoYiFYnD9xQxh0BpgpYMEYt9QVIwvCG8A45oojuPFEMaoZWPbuzZEl5Y12HbHQdm66R5QjwnMumzVr9J/KyasIdd261DZ4GA8cGeRP5Cvi7Z7yQg1ghcG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB17194.jpnprd01.prod.outlook.com (2603:1096:604:424::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 16:26:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 16:26:23 +0000
Date: Tue, 31 Mar 2026 18:26:05 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 12/15] media: rzg2l-cru: Rework
 rzg2l_cru_fill_hw_slot()
Message-ID: <acv1nVy4wUG5QIa9@tom-desktop>
References: <20260331-b4-cru-rework-v2-0-f94b238b35d4@ideasonboard.com>
 <20260331-b4-cru-rework-v2-12-f94b238b35d4@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-b4-cru-rework-v2-12-f94b238b35d4@ideasonboard.com>
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB17194:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d667af-b72b-48a1-83b8-08de8f423fb9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	OljLs7mQhitueTsyMBn3SeRFwcNqeddUf2AguvqmPlWvg8x/GJ14S1j46tf1sjqlz+S/62LQrWHUHpxSZJq/BTpcnM+Cp3tV9ZgPzg5dQqCpCxFNF3/qqgeAFEqIPSjFJyU1Qo4Fx4P51/TpaJFQRXlZyZ+f95Ox+z3/l+KUK2T8v5rxKySrsNYTOVeUgfCi3lJRZL9dWPtwBvkWI1y9lEQoHBQ2OblqoK9TYHHqh/HJF0szz+XgFtjdnCri6q3wmHICcHS4wxmrt3/MBHImcVMcTdOI6iYdgSvnt8OGhM79AYdQtifgjGdnFp9PyJ/qlKLHOQsV6PWd3gtzWNKJ5qLZGzGoE116JpBYAJa2ZJVskSSKRJdE7DAg6Joy5k+wmerkr6qF/V1oER9YswS9XFTPAQQlLJRnQDi9bhTf36ncSkh37ycyYmLPafP94LvdKLIDycNoV4Nfm5omdJaI3+IHY0ihchBlwcASB8d+/a28ztgXzfPmZLzNBZSj4FywrTVY+w5uLlFQjplJDb0516GRjEXnXjpkDt0KUItcMmYX5Dy9N47IqNjygfjV/cYNraD0wmPHDsJaxKLsuNbzlTLaocMX9IFbx5pxxX8dMvHA/uhsbMpREfx0yMo5cUMl02pjDdxMCYLIpkLevXBoVIzyaQneFlpmlh/WgUCnA4GkHmljbuy7b/mzWjUCQqdbZWSjic+7Uhcaowy6BnFbVxlne0dpSx9Ln5Xy3HTWwtcWIZSbDQtJQtfLwbv7VYNJyFjMZIwR8vqLr8732p2J4BJY25+bjJC6XAZlVfmLUgU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5B33ofrQI+oFqFODWGqrTuNtAE6i67trrEWSjjZ0jTVaeg9pXJ6Q9/e2b5xe?=
 =?us-ascii?Q?oHA+5btvw8n5R0+kTi0Sc80gJbir5mZRsE+Z8l9DdNnma2yHK0/FHOlMDLmp?=
 =?us-ascii?Q?HSZ7AOVmgO1rO4ix0wB1Vnp7mFJraQkVazL5KnG61RuGnoLUs/2GFgXupr6b?=
 =?us-ascii?Q?vghbhK1S7FysI5F6eMklkmNuAVFt6aJE+3o46tycm8Cl+qUqGiFPTj4AO4v0?=
 =?us-ascii?Q?sSpD3W0R3H2HSOe3Mg5m7XcscZK1rUo7raTat7y3WM5THnLDm4rIu2lZ5osp?=
 =?us-ascii?Q?D2zOsUCsTZxq9TafJcmRxF9afJZwDGKEJNvIoqFoKMoXpBApMbC9XIwnZ833?=
 =?us-ascii?Q?lEn8udt0mWmLtoZTONtZUwuFUx/FCjMMlafCLnFtunUBNKObF9XFdTD1stVY?=
 =?us-ascii?Q?Xcx0IEr3DeP2wikMaQBPuBAl5oLGKJG1LEdRS4ny59KJDVOsUEMmze/IG721?=
 =?us-ascii?Q?AfT2f2Nm3X6BzIV+tHLdUCDwPzWrmApJ+lqM4JwyWq5p3LC3xnQrFBh0t55n?=
 =?us-ascii?Q?z0nn9CiEW13H9uYHXgIMa1/AvUZGcNSUiOVxpWQqReQ9PAtMNLwFikPs0ppL?=
 =?us-ascii?Q?pPQxHFn+DK2GKE9oJArPuUT4m0i3Ov1b6MMZr5cfnIditdy7I9mOjmgM6iVO?=
 =?us-ascii?Q?3d7imONutP0f0CLs+IFrlUsQjVNbsPmNf7GhiAhl790hgIh2TL67gEn9ei9k?=
 =?us-ascii?Q?RX9GlflEYs4uyN9/76sSEqrR20QewAYeu9uOujRPGMz9zxNs7y/fkAaDMxP8?=
 =?us-ascii?Q?SkOua6nSHn/AMhMUoIq1ELh6EaBf0NyFLHdvuaPYXcn/GyX1l75pEnSJUiQ4?=
 =?us-ascii?Q?Tx3voJINBJFmuAISMhveoM799FBdseVpjXq5BiX9lAom+LG0h/GMDiQlE5H+?=
 =?us-ascii?Q?DK5UBtzgS305/eiFxcvehfUjTG8DqMQTgEJGZIrLgicBNAex9A1XwVhQrq+b?=
 =?us-ascii?Q?prQpgZUtNVHEvoRoZTQI0EWPuWjO87nhJpjJkcc5sVHlmP5yd+txZiAQYym0?=
 =?us-ascii?Q?AkrwZy20l7Gj1iZ4eG2i4W+2s0VDlAk2567GdFYEdzHpYMCYApPSXUVz4LJl?=
 =?us-ascii?Q?Shb2LPLGUrpv+N30yTgM1qTk3pT4RCV/xlzu9pwrGqhqx/tU/jxOZPGw4/4+?=
 =?us-ascii?Q?KbRiCSuB3G+NU2VQ5Y+nrUH/4nzi8z03CdjCKKJxhyYJEQinGJ3qtAdTjV72?=
 =?us-ascii?Q?xrh9unHXjbPxCh853wPcgd1g4jsRgOo4NFwuGU8tCwVXp06hNlLvHBTx0xTG?=
 =?us-ascii?Q?MbBhi/rz90TLgfs/RtJElVbqk7p1ikmdE2eu7y7gt19TYb4cuSa2WJBbijnc?=
 =?us-ascii?Q?7weWxIO/IGYrnmApt8hcAglWKNBErRAZW+PPU1QG0YXNFPWPljz5kcA4nXDG?=
 =?us-ascii?Q?dweM02Sr5/ZIL1Nz1ZLBVnlfZ9VdSCRFBWV+/wjIT5xsVze5m+LMA/BV8/LU?=
 =?us-ascii?Q?Kyz9itD3XEe3P6DqeOebKBlF51CZYpjrl97x2wEc0xG+wYZP+3MvC7CPOSDC?=
 =?us-ascii?Q?D6CnSbxVr5SOs4OjvquQIry6SE7WS/fvU+p4zq6ZiqVfm27TX64mlrSPtCXi?=
 =?us-ascii?Q?220JGOwEuYzBf6w8t+xKWr3hcg7LF0jyax43ZBZc2GhMOMDq+Zjy33RJ5UA9?=
 =?us-ascii?Q?RK/nBr4cqbMJFd4/ZaNhoIfCKgfTLEXKEy/ohURaRCpgXG7ZJ9DZitF/SnWO?=
 =?us-ascii?Q?D89HMeBV4v9XTOznVzHFqOSjtsO0koZAZAy8Dt1o4K3bZi9yIxQoGKHupOZB?=
 =?us-ascii?Q?YIjgZYJ4nzek3IlJOKOrWS5DEfFkiS+UuGKM1ETKi6vjWklbQrUU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d667af-b72b-48a1-83b8-08de8f423fb9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 16:26:23.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DssaBYUYjmdN0aRikyutYgPY61zFgGb0rKTMk4qQ6r4cU6H4MYT1X17KFlgjLTc0uhd2aJHON0FfCaQNq4vnP0eW4wnqXkBYe8y7TcaGAGa+sBo82FizKL0BV4u+JCBB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17194
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57805-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: E030136CAC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,
Thanks for your patch.

On Tue, Mar 31, 2026 at 12:27:42PM +0200, Jacopo Mondi wrote:
> From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> The current implementation of rzg2l_cru_fill_hw_slot() results in the
> artificial loss of frames. At present whenever a frame-complete IRQ
> is received the driver fills the hardware slot that was just written
> to with the address of the next buffer in the driver's queue. If the
> queue is empty, that hardware slot's address is set to the address of
> the scratch buffer to enable the capture loop to keep running. There
> is a minimum of a two-frame delay before that slot will be written to
> however, and in the intervening period userspace may queue more
> buffers which could be used.
> 
> To resolve the issue rework rzg2l_cru_fill_hw_slot() so that it
> iteratively fills all slots from the queue which currently do not
> have a buffer assigned, until the queue is empty. The scratch
> buffer is only resorted to in the event that the queue is empty and
> the next slot that will be written to does not already have a buffer
> assigned.
> 

Tested on RZ/G3E + OV5645 image sensor.
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind Regards,
Tommaso

> Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 64 +++++++++++++---------
>  1 file changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a5197196a408..f061bee51ea8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -214,47 +214,52 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>  }
>  
>  /*
> - * Moves a buffer from the queue to the HW slot. If no buffer is
> - * available use the scratch buffer. The scratch buffer is never
> - * returned to userspace, its only function is to enable the capture
> - * loop to keep running.
> + * Move as many buffers as possible from the queue to HW slots If no buffer is
> + * available use the scratch buffer. The scratch buffer is never returned to
> + * userspace, its only function is to enable the capture loop to keep running.
> + *
> + * @cru: the CRU device
> + * @slot: the slot that has just completed
>   */
>  static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
>  {
> -	struct vb2_v4l2_buffer *vbuf;
>  	struct rzg2l_cru_buffer *buf;
> +	struct vb2_v4l2_buffer *vbuf;
> +	unsigned int next_slot;
>  	dma_addr_t phys_addr;
>  
> -	/* A already populated slot shall never be overwritten. */
> -	if (WARN_ON(cru->queue_buf[slot]))
> -		return;
> +	lockdep_assert_held(&cru->hw_lock);
>  
> -	dev_dbg(cru->dev, "Filling HW slot: %d\n", slot);
> +	/* Find the next slot which hasn't a valid address programmed. */
> +	for_each_cru_slot_from(cru, next_slot, slot) {
> +		if (cru->queue_buf[next_slot])
> +			continue;
>  
> -	guard(spinlock)(&cru->qlock);
> +		scoped_guard(spinlock_irqsave, &cru->qlock) {
> +			buf = list_first_entry_or_null(&cru->buf_list,
> +						       struct rzg2l_cru_buffer, list);
> +			if (buf)
> +				list_del_init(&buf->list);
> +		}
>  
> -	if (list_empty(&cru->buf_list)) {
> -		cru->queue_buf[slot] = NULL;
> -		phys_addr = cru->scratch_phys;
> -	} else {
> -		/* Keep track of buffer we give to HW */
> -		buf = list_entry(cru->buf_list.next,
> -				 struct rzg2l_cru_buffer, list);
> -		vbuf = &buf->vb;
> -		list_del_init(to_buf_list(vbuf));
> -		cru->queue_buf[slot] = vbuf;
> +		if (!buf) {
> +			/* Direct frames to the scratch buffer. */
> +			phys_addr = cru->scratch_phys;
> +			cru->queue_buf[next_slot] = NULL;
> +			rzg2l_cru_set_slot_addr(cru, next_slot, phys_addr);
> +			return;
> +		}
>  
> -		/* Setup DMA */
> +		vbuf = &buf->vb;
> +		cru->queue_buf[next_slot] = vbuf;
>  		phys_addr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
> +		rzg2l_cru_set_slot_addr(cru, next_slot, phys_addr);
>  	}
> -
> -	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
>  }
>  
>  static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  {
>  	const struct rzg2l_cru_info *info = cru->info;
> -	unsigned int slot;
>  	u32 amnaxiattr;
>  
>  	/*
> @@ -263,8 +268,14 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	 */
>  	rzg2l_cru_write(cru, AMnMBVALID, AMnMBVALID_MBVALID(cru->num_buf - 1));
>  
> -	for (slot = 0; slot < cru->num_buf; slot++)
> -		rzg2l_cru_fill_hw_slot(cru, slot);
> +	/*
> +	 * Program slot#0 with the first available buffer, if any. Pass to the
> +	 * function 'num_buf - 1' as rzg2l_cru_fill_hw_slot() calculates which
> +	 * is the next slot to program.
> +	 */
> +	scoped_guard(spinlock_irq, &cru->hw_lock) {
> +		rzg2l_cru_fill_hw_slot(cru, cru->num_buf - 1);
> +	}
>  
>  	if (info->has_stride) {
>  		u32 stride = cru->format.bytesperline;
> @@ -695,7 +706,6 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>  	cru->active_slot = rzg2l_cru_slot_next(cru, cru->active_slot);
>  
>  	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> -	cru->buf_addr[slot] = 0;
>  
>  	/*
>  	 * To hand buffers back in a known order to userspace start
> 
> -- 
> 2.53.0
> 

