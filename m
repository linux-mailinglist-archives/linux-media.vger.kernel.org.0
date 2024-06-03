Return-Path: <linux-media+bounces-12416-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ABE8D798A
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 03:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031B11F218EA
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 01:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710A31C14;
	Mon,  3 Jun 2024 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="FeNnJdE2"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2049.outbound.protection.outlook.com [40.107.114.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6C01362;
	Mon,  3 Jun 2024 01:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717377446; cv=fail; b=E5Ka9ea8zRQbx/4x1Ujqqlnj/Ob/ZbOnxbHwHZx+G/7LTQO+Fdvx6sUOtAfi4gpgTk2BSQqnIW3eseTTHAUoHSeyU6g+LAOU2lxUSxu1CId7yv6BQTd01cFZFEe4Jv1uTQ0FZDamq5/NEcMDHUG2D6B8eJzTvvXw+NtyaI6GpsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717377446; c=relaxed/simple;
	bh=KhVrF+5u1kgJD9tpn9iKwliyzoqjUpHAckt44qrIZbM=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=XUAE68IBaUKYcTDXM8AM56V2vtSyx04ez9ysX8AHDOy2LU7kGQz14L5hvSc0wJouzYKCs14u8XZUnBEyb32zC/KHQ+ANfcwh+hKTnzQuuU8+unF85FnSjRqmDO+KcofbWLPn6aCgxYAtnW3YDgMkr7g2pq1Dcpr2jmjwoLgAy+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=FeNnJdE2; arc=fail smtp.client-ip=40.107.114.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KK2driHEnoyUVKscI6CG/2Jw6hOBga0YcGzTgA0CJtWolSwHkqhkYPRMVNEv+VBB2O8Jrh9L+2qMaDo+1BGQHOv4o+ETjm7oXzyCKNma6oDZ4ejJBDcgVtMOECwKHNm7L2+3Pymr2z+qCR8Jx2q7STz5qmKusQcY+hnucfbxb1qIlZ/Cq7VDXjY4HzQNW2Y1BgeGZ4gdQ4ay1m4Dovg+1TgJhF66dWkRgoIWy98oDQM6PvHLB3NGMdVFBsuoZmByrzb5WboNyZ88/KyGwO5CRimi+uKI6KSrj9co0zmgjwbMscyFA4z5YiBdWBN+xYFTAOGjMu5pe7hREJ8UhzXuzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IILUSyIzYxtQbCPC2NkhwlKzSmP2Ym4D0qskb18WL4U=;
 b=lkznDeYNuRWJdyEVKMcphkVr27fswaWfF1cRpAuYeG0sq2ezFHQYf19qBA2rKIKDhPcHXHhd/M5I28J4/xhpnesPBfPUkARlSbMj8boIp/uZZV5KKMCk8wYZGeT0Yw5FN6PDzR7wnSTdskcHO524jsiIF6zKViTdhV3oFslpmYDnfeyu/CC/uDx/urtJlKWCG/FcRZLxoDV3XeKJXz8THrm0gxnn5w+0iGky+HPS40olkhFCCs/HyZopH2nZliwaN7zOIyVlAr+s81TIUC7PmVijJCayueWyHoWvD6WLOVmP5MdSHh3FqlYENiRCRNz3pyun+u+3hY+q2SHBmO4E/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IILUSyIzYxtQbCPC2NkhwlKzSmP2Ym4D0qskb18WL4U=;
 b=FeNnJdE2M2CuNDIUy5l57QL4AFG6pLm0w5rNDDxGWYq3cMfSZiRcO+R2xnxkJekV9bmAxLfi42CjkcjuutQPILuUhsNcJfiDv/70rVDlKfuOC3ByxNMBDoYFS6KpEA59RIoMNPDEiiilbh2RGgv96OGrmL/3eAoXfQ9oWBJC5Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6330.jpnprd01.prod.outlook.com
 (2603:1096:402:3e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Mon, 3 Jun
 2024 01:17:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 01:17:20 +0000
Message-ID: <87v82q4yg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Lad Prabhakar" <prabhakar.csengg@gmail.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Rob Herring <robh+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, coresight@lists.linaro.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-omap
 @vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v4 0/9] use for_each_endpoint_of_node()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Jun 2024 01:17:20 +0000
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eccfd3a-6236-4c3e-2560-08dc836aea81
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLvM/FAyKvtJPJHpBD+R7dgTTSG6gr3z8hH8p9vaSKJYIlioylo+wdRaE58y?=
 =?us-ascii?Q?TzXXNHK/5WthAUQQn5tB/hd0RLFoh/cQXniXRsYxezHBtvx3+lrQ4vBKMb9p?=
 =?us-ascii?Q?KAMCKvo49oCgKZPoQnt60lGs5oQ6RjMDlWrfcevYm4VarjcAa/7TupCgalNM?=
 =?us-ascii?Q?yJxEjG/RZEYtoW4u05EMK0AHOcgSN6jRGRQRjn8n5+xCr2S2cBQBKnQa+GGR?=
 =?us-ascii?Q?jTViarnBEn7St0LHbm2o3aQFvog2lf4AjxV/WE8MMiRcDr26RuhOxl+ZZcqV?=
 =?us-ascii?Q?mkNEAtvmf/RM/6gIblQKS51i+9oa1inhkmgv4kV+G69LwSM5CkGVLc+u8yDH?=
 =?us-ascii?Q?1xaKp5sc7TwQUAeMofoiW1BblSCAq2JMb29I+Bk2wbtTbNzuz0FKICjrODnE?=
 =?us-ascii?Q?jUUC6Hv+7DIxaQSB1L3+STLsj2HhZ0Ux4E3+19JsrUpdY7s1pobPBWFviX6q?=
 =?us-ascii?Q?jgcJvprXH5vcfTpg+iKlR59u7vKhO/sB93yTFIy7zY42E5wTyh1XLyvjeO5H?=
 =?us-ascii?Q?at35TSqp7jJwAlpVZC+n1mi6yLG4PLqyGYIt9HELa0wPOMLzc37M5XqXjiut?=
 =?us-ascii?Q?VWZXpqPW23dP5CMURxqvx4EDIx+PnM7FVAPis3ofV7K+tGzrUDZufnyRvCKP?=
 =?us-ascii?Q?eTmCDvJ7aN054ekIQ4N/epcriDTtPOFZGx3gH5bmrzEHE/O0DMbNlkzhRfCU?=
 =?us-ascii?Q?qv5PtkttmMRDdO7GpRpa3JEHzi+Sen/O7qwxuGkb7smTbgzWKX/KPEZjzSe/?=
 =?us-ascii?Q?oKwnQtHvfcFwA2j9IkMn0AzypLVRTTgdrTy4a4hOIayMAi1q4tk+vjhuFNg5?=
 =?us-ascii?Q?65tSf0YfDpU5LG+rxmgdSpz4XhqBG8YLWqFO8YGj7flDT0a1C6Bb6KvorCFg?=
 =?us-ascii?Q?fMLJtDT2STa7hhfFjCrH9bfsfuj6Fv0+d98eRxTwgXfyEuhjlxzg//KEdzTx?=
 =?us-ascii?Q?0c9V6X3kBnLf8zr91t0H9EIOju9w+OGD+YpSMujdBr7pcbFpXJNm9XxpDavS?=
 =?us-ascii?Q?IU4va1yuCDTs3v1e0WYfd9b/+S5TD+MCslg0m5+jfHsUQ04NKsoL1ry4HJ4A?=
 =?us-ascii?Q?TjGU2g8Qx1ks8O+MHUoP4SACq2L9u0dU0oHr5hLjyqKrXKBDrhf8TRGjBwEt?=
 =?us-ascii?Q?iMfmV47oJpsSTHsYcBrxtVa982lykZWoCbY26ZVX01YLTx1hf0sH2+qnyDjV?=
 =?us-ascii?Q?lMZpb1OEkRyt9VzWbhGyvKgzgfnwr9yiRgNEELna7tikq9P7+VM1SxQi+UJU?=
 =?us-ascii?Q?yekcgptvUk8ERRzuHeuZ1aJuQFogkPevD3lmByiJ9Xa16bt+QehnlZUkWAlN?=
 =?us-ascii?Q?26mQTg/BF7yXK1t4+BBGZro/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U+4CKNoOsN9aA4DPjeSE3HWDDckSuwmpe4YQGT0BmLg9E/eP0LBspDs/bY9I?=
 =?us-ascii?Q?9sXEhsdKdBQoTXB6usmRubRtvFo6gkBk/46t7XHrtLQ1SRkQdvrTBvasQUT8?=
 =?us-ascii?Q?M1zoSkKVizGWN/VAmAJCcMn+d+iW355bXrvqUA4cYks2iWCLcH8xkN5X0u6M?=
 =?us-ascii?Q?aEZUIYOUazKzFEzRdy+k2EGzCSXXeGBDsEGPR7os/cNVwolpfl2h9sGZt2Io?=
 =?us-ascii?Q?gN1gFWpRGoVAZDKun7dCJtSOUkWzUkYNnLif62wQyxApRHOxBbXRoWxMIX5K?=
 =?us-ascii?Q?KgGHXyPTu+jOHCtQgfFrZZfVZqc0sMIHV2ZOtHRrBGMw/SOX4bwo+SQqdh9q?=
 =?us-ascii?Q?4IGMYLOmBjjdQo9avlszirIrVGM0BIxbAauBYKefcFYMCGoPQTr71a2Tp5oJ?=
 =?us-ascii?Q?EKit4KUBilCVQ45PHTa9AG6sXyWkVdlVbYiicn2uN/TwJMSYs8ODDQC9hPST?=
 =?us-ascii?Q?fiq9JMeGfJZyr5EXA2ckQKLNrVWLSSPNDkGnQSXA7Pg8+pWAPyCMoyQlMNaT?=
 =?us-ascii?Q?0S4SVwanzzq6HHgfQ7kyB957mtk3WRYLUrkNLlaLG/aVZXNIdEbt2z4KQn6c?=
 =?us-ascii?Q?bSRyLeV635i0OmWyYOtdmPMnWPjHODSt3onEsNF+0RdoaWfT8MBw4iyt5rhD?=
 =?us-ascii?Q?yIG7Ipl3jJkW1N2XGM+LHcE7BzHrfPXbtQlv+TjRtW0FKqw9eCIg9McP+TQ0?=
 =?us-ascii?Q?u7ux2bcUKjWzfU2ZiUieCVw3sT+e4hhuFeNjPwHnKB7YTKdKFP0jH2kk5gzQ?=
 =?us-ascii?Q?1kC8Gl63MVTLWGoh4qRcaTZ1Vm4jH5TQKrTm/Y1HrHJfSV8N/xzvqvjP5ikX?=
 =?us-ascii?Q?YFrEZr34L+CpYEqSfe74EENcPbmp3oE7jORInnWfFedojioHKAtUFSXbLIfS?=
 =?us-ascii?Q?aD4HncO44fyTo3In3hU2Yvi82xx6VXSsRe+UQs9WHsvrJR/pERl2jIwgq9Bt?=
 =?us-ascii?Q?3mFNqIVyOmC/wTjqi7rQcUxuT9zYBxEt9CZPYNUNONcemd3g3PUGRU3eve8T?=
 =?us-ascii?Q?mibgmeDFXsj1spkpzJVIgTmxKv6eq3MXzB1D9/w6ezNNcopdxLRtFHWDAEAy?=
 =?us-ascii?Q?b5bxAv2Ah0POe/q4AKvE9CgPKWAiTnCO4ecywgW5hAEM64W+maCcxdtBcXrp?=
 =?us-ascii?Q?+xC49OdUEUZJ76WldgOqq7xVbkYvsnYclAOTa+4Hzp1zO+el8bKppTsR7UkR?=
 =?us-ascii?Q?G3vJpjkdbbrdL6xjQjPPNfakMCN01EZVtzBcWmPBTefZ7kTd1SpsuIJDPetv?=
 =?us-ascii?Q?TKG4IXI1XQsKdCFATJgyQCVp+ZBaPxaxp0PeLMr4sTTLc4dr3mi9vYMjb/T7?=
 =?us-ascii?Q?G7LvtzjGCEOOlMs+SBeV57OEa7f1c5TeHlirZGAbkyKL0ODp1unABEG7gdKZ?=
 =?us-ascii?Q?pdaq/ewwx18fCBquqOSCQhLs2iBORaFeDhif4eg9kPu1p3hU0K8BxqGRSgqw?=
 =?us-ascii?Q?OreKwxcmAFCstmA3EXJDEcCfkgqPOZoZmwd4G2AqrtBhq5OiVh7KgRx7U7uk?=
 =?us-ascii?Q?KxQfbYjmPe9N/AzOw1JRHpZP2F2FVjjBgMdvdouCbybNBQrPcVGT6/f/WQUS?=
 =?us-ascii?Q?pnRffHwTaDPCYP4CqpsYq+1i81WC621nPrUZV/TUVvgw9Wl2XtPUT+iHreEP?=
 =?us-ascii?Q?8w7A17KM7kykeBpJaRY5wpM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eccfd3a-6236-4c3e-2560-08dc836aea81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 01:17:20.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTVDtbGY60/qUzMSYUqeRWaX8Kvv2wyJ7pCxTW8BLX+pUarXlikuF3G3byonMvgy+/fqkyNpsN2rPPSSOPk46KUrc6OfktwrcZOano13r4azgwn6md90MSBbgvAGxgSd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6330


Hi Rob, Helge

This is v4 patch-set

We already have for_each_endpoint_of_node(), but some drivers are
not using it. This patch-set replace it.

This patch-set is related to "OF" (= Rob), but many driveres are for
"MultiMedia" (= Helge). I'm not sure who handle these.

I noticed that my posted 1 patch on (A) was not yet included on
linus/master. I have included it.

Dan is indicating it needs _scoped() macro, but it is new new feature.
So I think we want to have separate this patch-set and _scoped() patch-set.
I asked it to ML/Maintainer but no responce, so v4 doesn't include it.
It will be handled by other patch-set in the future.

[o] done
[*] this patch-set

	[o] tidyup of_graph_get_endpoint_count()
(A)	[o] replace endpoint func - use endpoint_by_regs()
	[*] replace endpoint func - use for_each()
	[ ] add new port function
	[ ] add new endpoint function

v3 -> v4
	- fixup ret handling

v2 -> v3
	- don't initialize pointer.
	- add Reviewed-by / Acked-by
	- include not-yet applied missing patch

v1 -> v2
	- fixup TI patch

Link: https://lore.kernel.org/r/8734sf6mgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87cyrauf0x.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87le3soy08.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (9):
  gpu: drm: replace of_graph_get_next_endpoint()
  gpu: drm: use for_each_endpoint_of_node()
  hwtracing: use for_each_endpoint_of_node()
  media: platform: microchip: use for_each_endpoint_of_node()
  media: platform: ti: use for_each_endpoint_of_node()
  media: platform: xilinx: use for_each_endpoint_of_node()
  staging: media: atmel: use for_each_endpoint_of_node()
  video: fbdev: use for_each_endpoint_of_node()
  fbdev: omapfb: use of_graph_get_remote_port()

 drivers/gpu/drm/drm_of.c                      |  4 +++-
 drivers/gpu/drm/omapdrm/dss/base.c            |  3 +--
 .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 .../hwtracing/coresight/coresight-platform.c  |  4 ++--
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 .../media/platform/ti/am437x/am437x-vpfe.c    | 12 +++++------
 .../media/platform/ti/davinci/vpif_capture.c  | 14 ++++++-------
 drivers/media/platform/xilinx/xilinx-vipp.c   |  9 ++------
 .../deprecated/atmel/atmel-sama5d2-isc.c      | 10 +++------
 .../deprecated/atmel/atmel-sama7g5-isc.c      | 10 +++------
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 15 +------------
 .../omap2/omapfb/dss/omapdss-boot-init.c      |  3 +--
 14 files changed, 46 insertions(+), 84 deletions(-)

-- 
2.43.0


