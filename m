Return-Path: <linux-media+bounces-27394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A75BA4C6BE
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEB7E188D600
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244682417C4;
	Mon,  3 Mar 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NKXKaIgc"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D81DA31D;
	Mon,  3 Mar 2025 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018265; cv=fail; b=dZ0xZJNLqEcGqE58qriCutBh/MqxjgUQQQU2gAG3oR6fJbZ7AQZQaI7eWlT+6tssh3w6ZZJSRwo7Px+VuYSqBZ5Scoj2PZT71KZ8Zj3s0wdC1/0lLzjQLaZ86rgqWRALsFBpKmlStYMlIYgsZwKuc+TfDlD6mwYROdkGdj835/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018265; c=relaxed/simple;
	bh=5uvchA5nH03kiGbMXqq3m8CbWhBlFahJRNj26wjaNJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d75NP1AWZojzCuPfRDBBSutXfcBIphUh4Mor3/1SfOoFwiXPsfA9LK9fYGEFjI8XfdXjrZm+kYKotv/ipptT1Gx4W+CnLRzQxRFJmBWhE9CgY42vq6i7N0XDFw4TECIqSQ96+xFfOK+IRqmT4rdo1kfA3zkOqUB+y1ulEujr6hY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NKXKaIgc; arc=fail smtp.client-ip=52.101.125.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypcSES3qqZnc23VslonRtTMrxj5R9WiyyhnAAzK8onZcl5o5BnRRULx8fhMfMOv0wUo2io7ERt0LDdLqwUuJRt5UFhPoIW/gDjT4sDWyzqpYlL7iMqnn/QIGBgU1ioTs5JEWVsCBFrZ9KwMqvd/Bu5ds6/p2DqSWM2aNo1dgzngD9P8aaThJDb5zEfLAk+X5Ab13fnwUynYHlUtb57N022cJ/ziLJ8RSmXebzor6qfuhlwwOQCNtGv7C69AuQ1Wz+LBR+3JeGxGldU8AEk3DwgxoHALPxgdIfB1TejWfo3V7DAdkVuuL/OW/vXkd+ix98JPWD0H2e4PZucVnUfR/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MiP5/sRjKZ1lKqYtzwX6HFn7IU/Os8AGNJYk9K2eF0=;
 b=WeA1jVfkaEs9b6JNONl8uva7m6CtfVx0Zg0PNc/WGHe1l4cHMlFBGjA+FGLu+kHskgRmvAlzCCcUGm+rrq00gZZmqV9AF6I8Nk3NhnJNxUiaOivqQaZBK6Ha2sd8ihvsftbpZ4F1Vj5rzTIHaToRc6YEsic7wC3nSQS/pYbrpuS2A/S7kYmk5uQfcCTC9GnSRV91t+FTvi3fc5hcUI7LkpT3U+a4vsrzRA98M3AL5SVDWGg1jHXBfFzLLuORWF/tzhGaTYAaQE0aK7uIBAgBrPz8HU6gMKOKNW43a0A+Zdq7oJ/nkNXSit87P2mXxosdvMTwFI+KaDyPXd8zOEL2zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MiP5/sRjKZ1lKqYtzwX6HFn7IU/Os8AGNJYk9K2eF0=;
 b=NKXKaIgc0kYPyZJVx1a6qZOvLg39QO099dguRwIhrLLGmbLN1zgnYB8Ma2EnsFtGR0BMPgqq8ym+gWalzmVkU6zn0rBTYrRvGxsorW+fRpawZls7nRP+Xq5+Nu4Q35jjQn7N7aotoUiqT+zEXCuUDT+NOwDsBZak1kbRwZim3ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:11:01 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:11:01 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/17] media: rzg2l-cru: Add image_conv offset to OF data
Date: Mon,  3 Mar 2025 17:07:53 +0100
Message-ID: <20250303160834.3493507-14-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e1bef8-a4cc-46eb-c999-08dd5a6dfde6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y4IN3E2Z+NaNL3CiXN9LCxr67pwoT41CEf5afJMav7I3FSxbyvwLV5rxjmNv?=
 =?us-ascii?Q?qYuulivrcbDSwfNd5Nh65nNalQwedv3hDTsSr+pcXwS47aC8qin8E+T8vO36?=
 =?us-ascii?Q?A+xL1DBvDeUDQdqOyWWovdEungp33i5JfVRT42xBKL4ioRccAlvSV4e2gGYI?=
 =?us-ascii?Q?E69F5C7xfFZ4UEneMmWBa+61wJkgMc6ibfu0SJROdV0KAMTKh8gW0vmGsYHG?=
 =?us-ascii?Q?1AzEuf5PuFvkCJS2LV5KK+PFmtvmyzD9v1NLi7Xa2vZ8xOEmW12HefCfume6?=
 =?us-ascii?Q?/PlTEX4qxiOQGTG4nmGpg5A8Iw50b0p0SuH+MyqfFKEMxM4CmQbO3KK/bifj?=
 =?us-ascii?Q?dJcnIl7rys2lKyOisie3mFSEDHiw4JUmNPegVQFnJL32GRISdnSpULy6fqmk?=
 =?us-ascii?Q?7+UZ7czYyNaN2spCFtv3oI5QiVRAHIZE/cZPnfi2sTWSDE2JiqLGbqfN+x2v?=
 =?us-ascii?Q?KyhCNBtKkkPkUy7P4QFjolpp2dNNJbHn8SpMKKv6xqQQ6KYCgVX3dDzOGeWh?=
 =?us-ascii?Q?8eFmC1oB9rTIiY61AwdozYifjjKIwrJ5oBdIweQ1UEzQaqEFoB7semfVnlsk?=
 =?us-ascii?Q?McArFXvbRJnUZdcXn28dl8Acuw/aNEL2EGtmRcg27jiyHlm11ZUHj8V8wrVC?=
 =?us-ascii?Q?x88cbLo8360HziVidJPkpvI2QH0Ia12ykiwfrz7m2zNAMcaF4vrxYF7ruqfm?=
 =?us-ascii?Q?ROzx4lsSuFr6VQ+VvUHIr+7zF6Zy9Xsx/QsLbuy5w7MPMB2jZKmJFXQdm/Mr?=
 =?us-ascii?Q?vw46VBfGXPOZS+HRU8UiBcR+4a5p1LKgj8BsSoyeRquczpnNtRpujgWj6Lcc?=
 =?us-ascii?Q?RbBqXhcOS7Q/FTH7Ez7VMB+EV39p13lR9U02qUaWUcPQuWwokDz+RAAoCIl0?=
 =?us-ascii?Q?96znw16wnMzWk82ZxEzC5900Syb37xD4/Hxw+gtsIeQ96yb6mByAAvb8Is23?=
 =?us-ascii?Q?zIlsF5yJhFwh+qJkdgRWNxffsTN+NxGh4Li/aIAIoQhOabcEkN9kCUE4WHec?=
 =?us-ascii?Q?pgeUSBm5C7Ct4bPyHwBnnGSV7GnuwR2GniysFlQ+1U8VkDcS5thVJiU/2Mo2?=
 =?us-ascii?Q?Fxwkzn+vh4Xo3o6drqRtFUA29DMqPxh4gANAnv621R3tGbvqpIz2kwRU9pSh?=
 =?us-ascii?Q?BuZsq5ytuhGc6EzTIavabr+mrp8aUdUO+kwRZaGNznTANe4XFSzE0eSyfw2J?=
 =?us-ascii?Q?DfG/qTQYycTDZ4YAOr8cCQuVOxLdnrpmzs3TbYdEt/fsbBRvl7roch6VbZ+k?=
 =?us-ascii?Q?qmixdSWYXeppeNBSwonSE6wixclK1oxusCT9lD340ThcUWRaNZib/h+XXkTJ?=
 =?us-ascii?Q?I1j37qSW8r26STRMa+6NsbXA12C8Qt6i7uAuvSu0XNBq2Rd3QNikGz9AhRIV?=
 =?us-ascii?Q?dRDlutbf9Xt5XGQtiGh6qbiw1gj08w9vfSBd7bZVdRqwrGF0CZXoiXv8ruJN?=
 =?us-ascii?Q?hWrFwIQNwTL7zau8vVfgUnmtquxKnhQU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PL9s8EaDLU+nQscxfKymwfez8U8RmE15bak1GFwb0yIzs6wM+A9SJL08Z0nT?=
 =?us-ascii?Q?XQYEnMcPs9EjtD3mGsn48LQdlUY+eN68fx/8bOSI/uu99k6H6j6LybcdGF5d?=
 =?us-ascii?Q?kIE2kcR8IJ4UPBoH6qdrPboJ0Zys7YXs+tu8GpBQs1Gdq7fzdwslvCLuuTpu?=
 =?us-ascii?Q?C3jFsry2aZUuX/P+n0g4/LzFvADnLNvJNEkV/jqHwujIIxfnaGJ8hc5WGVd2?=
 =?us-ascii?Q?3rUxkpTqfm+xAbf36/vkNSu+MUaee1GN1Gz+DnPZIJvkCwiiDk96In2pZRr3?=
 =?us-ascii?Q?PYeW6luLC9z6GQIf3oo/Lp/fvjitVnyRaix7TCcoqP4qaCTPMChSiJGMHADE?=
 =?us-ascii?Q?z9RZzCcIVPtDwkZ+k+r2N0rrLVkTzyfcT4GlzJwoS08IbM/KKRn7HyD2lWfn?=
 =?us-ascii?Q?8Wn9REJvBUGQM2a2u2eLL8xhZtlbCfrLkGZq+QznIFhSfjZrrrxRBhcKlKF/?=
 =?us-ascii?Q?SXpB6v/YrX8tMIX/BIzdX1UhjabIxHWQe+JnmS7oQJAlEd6YjbKHBfUtpyc4?=
 =?us-ascii?Q?bW6r0yY85o3eg/UkXvK2upYOvP6k0IlCV1xr+g8fxFsxfV1xWkkk3xkg5e18?=
 =?us-ascii?Q?bJW5N1JJYpDHOjr9nHFGpbmLGxYZKMpDzyXyFIcMuFr8JCDaNBYVHzq3Q7sk?=
 =?us-ascii?Q?fpvNQrmJByMj3F8tiWre/xLocpIAMOYyee+O5s1O0pPAubRvtAi79/uSWUnV?=
 =?us-ascii?Q?rXi7r0njJGo1ojUledMxvODYN0QfU28ziXrfNMX2elYKHyguBmnnyYyp48LN?=
 =?us-ascii?Q?n71NMRlkuAcNMy48QD101CkewAOAMl9KoOPbi9oFwCp45i/mKHjzXWbrec6J?=
 =?us-ascii?Q?XMkZLwS+ica526MhAKUAvI3FD5HuIZwJecleRg01HdP2Wv6fl9MC2PnsqHJG?=
 =?us-ascii?Q?aONZTu6QU0CLhzMMHworq90MtTx8Dw25FAYZL2d5VkVJiF2Bk5nnhk5dsFEj?=
 =?us-ascii?Q?G70XrE3YuCW4SciGBGTujTMVQGrIQ20zCw5fw4yFrWVwDCrYdtf6MbEHPE72?=
 =?us-ascii?Q?vyrEI96JynmYB6ZNqoShPwyrqK7PNBv9ETsajog5h3T2zh2boz7FsusXz3A3?=
 =?us-ascii?Q?ZgX+VzifX5/vHe+N5+riFTsZRwrbHeypKduJsmhNS6A5Ug9HRbkvKpli2m5u?=
 =?us-ascii?Q?JsiGm3Gm9VtzxcOAv+kRBBt8J3sniC+XUqIhzDeKqtiDXolO5sMD8uwlscX6?=
 =?us-ascii?Q?yG2kKNvq8yQwd1FQWkMAmt9Gvw1ODiGt9v/AW5h5RCDKa5Qqxqr1I0eu4vx+?=
 =?us-ascii?Q?TYt05x/zW92Dq3+2obg/+08WHWrUotV2oHYPQTGQmE0fwRtqQqfTxjgXSzKo?=
 =?us-ascii?Q?g4ISZdhHIGN4O816oOWOfyD7aq7hdqxEI1t8ViLZslmoNUSObmiuTNayBjDM?=
 =?us-ascii?Q?ZK0vozSQTScK1vhxfCA6OkEwaav7o8AMJEwcGCb5qQrjczkseh81FZhxWEFc?=
 =?us-ascii?Q?/2ioTm3DSELE36gwhJB6anSx2B4/+hx0gWW93aN2lF/sftg6+djLyTJPqh2q?=
 =?us-ascii?Q?fXk+KPBAaTJagK3SMhv5q8pSN031IGEf7vcB03yRxxbf/nKINyiUKrD0A7sf?=
 =?us-ascii?Q?7n1ibotzfPzMHSsSo3yJhH+0qjFBO7rgXbU64NvP+rvfqMTC51pyYB/c+ddH?=
 =?us-ascii?Q?MC4p/Kmp9MZSlvx8JFNYWKk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e1bef8-a4cc-46eb-c999-08dd5a6dfde6
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:11:01.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQy/My87tHifR73CToR3cbCfUAcFRU1Nx4kRA81RTIcfM7Avd6KJwsWq2LvW4GK4H/M+99lkCJdQ9lklEcCeMwHRp+NVjBAUU2d7orNsJyLz1t8ClISy6fEzDKGjs2rg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19f93b7fe6fb..7e94ae803967 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948a..ca156772b949 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 93a105dec8f1..5033c8d98639 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.43.0


