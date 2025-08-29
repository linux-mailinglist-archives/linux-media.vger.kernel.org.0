Return-Path: <linux-media+bounces-41315-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53229B3B653
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA1711C87019
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749F12D7DF2;
	Fri, 29 Aug 2025 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hDQw1XDl"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022100.outbound.protection.outlook.com [40.107.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3CB2D3724;
	Fri, 29 Aug 2025 08:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457264; cv=fail; b=gz4xDt1kOJNYHZo6dSr2WPO1PnHU50WbU9aLWRQ/GJOfhPI8OZl0qAufpuw6QccOxdv8E/KT8LVGvmKlKoPFBMb2KDhyr9YG4qBxsWqlmBVtfUboW7xiTY8hnft45KBU3MRJkXKoMt2S8mt02s1uZXL2ubIh8esVIiABvH/i/Q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457264; c=relaxed/simple;
	bh=M3a7yRfdsNj5u+pQLItPwMToH4NFvuMiy34GEszYANo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QnmAWqN4tIWunkV7SfQi0hdYPICPj7Ba+6UfxgP2UmZlyTGWzYeX+wgz79yXIoJkS6+HtcltFM3xNGh06slcfi8EGsJyzgmyQLxt/dvs6Z+CZTt/NMIQYk08Xlw/V6aOMR/mpgDttXcmF4WBfF/HAvIRI4XbBuX+KoBz4UWMmrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hDQw1XDl; arc=fail smtp.client-ip=40.107.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+RXHxaFnrhr9n+hNnrd+cC2w8+kqqYQoyQK2DUe+l1LDDGhnQFNj4FB21v7HeJrmiOYsnY1jS1MqvMnYgZLfIDvmTyYDiRGia+hOrEONvrPPI5apEbhCOxBeEXXRsGPaOarXcNIyQvSLOKXqovzVoO9wC508ZIJ7DrwcAevdQ4ZsRDGVLm9XZaADpByr0WjnHJwoGCmClW5FMB+52iO/Zp6xQ91cncWkO9Zkvnn77QjGsK6qxjY/3R5UMTbyRl9eZoyXeXz00rm//ZSsq2FM6hrxBfY9d0hAmxGc6fw84pQPK5V4bzsd+LSroFp6X/iwCG5hn3XzF0CMoEwzPsq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFtWKPkiLvl8mzzH58a2LFMCdIXsjfXK5/eUFxWcCH0=;
 b=rbPVHHogCJQTUTgN8OM04JXXAU/HfuQKf8ibjWt/to3IkzuMHMtlOR3H6KMSFHlNhGVj8om4yO9xF1A4FWCKShGC/+LSDgnr/A9pBVAwJnULFLw3LisNhqF+8FMoLNwQX2fGg0jDdKFjUUeLcriTl3DPV7tl5uPlJGxqCyfWe7KoA8QQx79R+3re7SnEfFA12tS7qHm6Bdd5w/HQrTfzgQsagsN+TBIWfDDkf+dvK1CfyEcQVFwVRDX1LFIFREEvbqlKVHcg70nJlaVw1RysefT6vfH009qCpH0GwcsIHEv0QtLQ0oSr369Z0NAohoqQyiT0PRznWjBDkIKR8AFjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFtWKPkiLvl8mzzH58a2LFMCdIXsjfXK5/eUFxWcCH0=;
 b=hDQw1XDldCq7rtgszdF1tZUq0WXgt9c3Q6i0KSPWKwbYaSNyXiUXGmHUgqCNcxe3BwPc+PITeWnxYnlHNwRsUeSbhZIjHHDPmX62yXMDgQeOzeh1txRseLTa9bITSopcHiwvFv0L1XWh0+utc8iEZgZ+gFHFFkQrmcbsyDiz/no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SL2P216MB3039.KORP216.PROD.OUTLOOK.COM (2603:1096:101:283::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Fri, 29 Aug 2025 08:47:27 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9052.011; Fri, 29 Aug 2025
 08:47:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v3 8/9] media: chips-media: wave6: Add Wave6 control driver
Date: Fri, 29 Aug 2025 17:46:48 +0900
Message-Id: <20250829084649.359-9-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250829084649.359-1-nas.chung@chipsnmedia.com>
References: <20250829084649.359-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SL2P216MB3039:EE_
X-MS-Office365-Filtering-Correlation-Id: eba77fda-2e80-46c6-490a-08dde6d8aea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dDHSDTM3h22BqzJiVcKV6/MzftAmh9Rp2lBlghJUXLTdJdzXueIIjD1ee6JU?=
 =?us-ascii?Q?Kt4JIsBGZWdXMXWjuPU1CGmXjEmilZiRUob2tAh16dAhi8ttXADO/0eemqYD?=
 =?us-ascii?Q?54dTOASqR7XRiaSCxtHoD8uKW5yQk0lwJIow2oMvmeTT4aQf0kdkFTRZj1k/?=
 =?us-ascii?Q?B0iQy4oQPlE7Qm2Jh5tERafAuTcn4VG9T9zFPmkT7sIndkSuk+Fv4iJlwr0K?=
 =?us-ascii?Q?WG44ben1t0TSyzv/5Cb2eipQpi+g/6T7FqE+hVpkkpLP6FKeMkNy/CnB25dI?=
 =?us-ascii?Q?KsUd/+rDh/tLCWF3UvprzX5qtEysyRkZvpi14Aopwe5LkvCpKiaiZE/7TDTq?=
 =?us-ascii?Q?lksLY3WbPB+2Lrr/OqLM8FO9yWx+IbLRFzkAm66ZwTQQoqxrJYrQAbt9SbXm?=
 =?us-ascii?Q?4GZrjW9/6P1+vrK6f7ZHuQL/dCUe0VUpV8/gISQ2sKYGm6DjopU+oHrngNPn?=
 =?us-ascii?Q?OW+auhAxls0kaw4sfckWztuZ2HTfgm3iT5Bt/2Uxj6a5zOz3yz1BNBluN4nI?=
 =?us-ascii?Q?CPTuOGpHriPcOgzG4OWl3HaX7rnRhVT72veyiXFMJQuXRilrRjWR2ylkrnwj?=
 =?us-ascii?Q?qv/NJX1nVBzMl2T2DBbzYqnsD2sbZu3u0fXbg59+lu88JOswYlgyXDwyAGwY?=
 =?us-ascii?Q?MY7b52D9zJd5nuPIZnEXlJZsWOxtqx/d4sHWf8vA80E8k2e8fP65icMdkI70?=
 =?us-ascii?Q?5/FUM+NdmhJ9/juTET7fD0ZaLS17BW3qzVxUo//Z3ausfxbeikWzyOj0qYKR?=
 =?us-ascii?Q?T6p+AgAGZClJJlCdrl+kY9jXZIjbA/qPJTqJXdLhx4I31Uks2hCXovaeg6Vq?=
 =?us-ascii?Q?VhXY/rUGF1TMt9pEfzrabBEeENFbzyE7AHPRZW6Q9Wh7y/uem7mVriXkvHVN?=
 =?us-ascii?Q?1DUgaLE2XUGWF95s/9BI56p7lBdaGYW8LDnuI9OBcsyVJUcmOBYOj5rRTb81?=
 =?us-ascii?Q?C7JothbgmlnN6AZYWgBsI8RebMx/Ly5n5tPl84o+RqbRBvmH/Y+IYkwEi9zx?=
 =?us-ascii?Q?DyJH/kx01RUZXbKyrR1x5Jw6sQ6Ow0UvCT04eSeUtscDnAF4JMYOr1S5pFl+?=
 =?us-ascii?Q?ak3wNFrwNYjDy3XaprIEmQ9FDUCWiheuk3zCYyMWbxsbd2XQ9FW18TI80fn0?=
 =?us-ascii?Q?zc6VvPtwngQ8qa91FtIRUV+SiJrRP/BV+iMH6sFRIt/lqigSprBfTHBsjmor?=
 =?us-ascii?Q?hOBr9s8gbQUp2xca6JcbI0iolkfIgNPYYRPLsR+zhsvrsQ39cVXWxNP2LXUC?=
 =?us-ascii?Q?QpvouTcKm3NPs/153mj1BAmi60nHELKC6ijLbt6stgOd90YloDUXIOhvQ1an?=
 =?us-ascii?Q?TxxzWEODG/fOLlCi1iIdpjflCB4XuDZQMTBzg4meCWVhiUHAacyuqh9YasCZ?=
 =?us-ascii?Q?rfI0vSaEfo4CskQqI30/8ht4e8m1a6W0eusrH4Wpb4lKzQKfUT/8rMW/XrHI?=
 =?us-ascii?Q?UXD4VZXqH3Tx7BTX8tdOchyzvW+l990aI8RPjN/LRMExnJbP2OXb+g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5R6iBICo6kFrjka4IznWghgxMIruYApSDu9FCIfbxaPsUbmAbaxmmOkNwYgW?=
 =?us-ascii?Q?n6Tk/1+TMy9SmBTxAddSVps1XxqrpozFZfZ+mAyqiDhctoC74KRmB6aqN22d?=
 =?us-ascii?Q?A9uVtdb+QdtEIBfYMjFb9US2h2Hn4w5sill86PjOH+NzuF5R+1FUnqq+N9EO?=
 =?us-ascii?Q?4OIm+HL1pkjDqq9pvYX6BGVOQDlAditXQvpFVB/g9dLfohoplYeOq0qSf5Pu?=
 =?us-ascii?Q?ZNA0ewOk2FX+mJ1lj5rd8E0MU7RndTfR/W/Z9mpoTd2lrCwSlg1cl821LdRU?=
 =?us-ascii?Q?EDtXtNscL5ybciie5E0go5/74EI5oSlQHfU5gZVMHl/PEvaieQKsSF2sHTpr?=
 =?us-ascii?Q?2ENfOuUXtCMG7FvXwmUYDPVkKP75oIDlJ3KJXeRiMAI0NR6VgrgdSHRNUf0x?=
 =?us-ascii?Q?44L3V2HGCFQh4mhthxCaGeJZo/yyNPmcbjJXYLu8j4iAiGt3eWorthVHG4+m?=
 =?us-ascii?Q?1Uew0jt0bMFCbnaItZGzDZNaaDZU2lMgexFk4LLszI2xoz7MvJvxlLb11Uam?=
 =?us-ascii?Q?fL7mAo3M4HfaoAXzt/GSBGw4dbtpkBGh8s9yzYBE8xlM3iTUD+1CVTGqB1jP?=
 =?us-ascii?Q?MEzGQHQkM64vZAYvLsdVn1qo1qJ0mtHMy8Mp/M4c025LNnP6KUyewaVG7UAf?=
 =?us-ascii?Q?p8MW/oHhrKJtY/GrPd4anwiB6Oq3hGvxpqgGF25gHALrAi58U3rEMJzdRaPK?=
 =?us-ascii?Q?+vgs+b+plfCDQsP6xQU2zVPlyc4+mOqOxY13V3wX3N8a4ozn0jHtvwR+OP+e?=
 =?us-ascii?Q?a+ffBHYbcpRGnxsilKCNvFr522Lxvqw+/owyqMBbNOQ+gaME+ocO2s7/6n/V?=
 =?us-ascii?Q?EURbX87RQ1gESIwgULvCJ94IBtM+QMLP83kWj3sRCYKQ2nKjg1OQQ3TilbzU?=
 =?us-ascii?Q?ABys4ggcNXbLa7C8yt9/tHCCzXd3b1QlpMFkbBgcbejSPw8HccI4cZqA5kT6?=
 =?us-ascii?Q?4beezDFOZGM8lk59uWwlrtBLQ6VR0LaJSxfG8yq22+ngC/KwCZPZ5Zw6Xh6x?=
 =?us-ascii?Q?tLMr5A5GCu59yFXmNKyDA1j6B8RKxCVqFtIQEopH14Ba6JXrcAqm4g8M10xq?=
 =?us-ascii?Q?DKnXQtdm7v9ZBfQIA34qIhN5QPSs3NPXkc+k+/rE/0k4dxDWJPVys4jMZEez?=
 =?us-ascii?Q?TxOpd5+Q7eJ2LYhVk3Da4YphR6GqFlqATn3sm5o/v9B8nJ7uVum8MFTIUjcY?=
 =?us-ascii?Q?gP9xxWmHYe/8Ui7ob4zdTg8Jyu4NVp2IJjdP1zPkjj6K3/+EucSNKEwM5a2H?=
 =?us-ascii?Q?b5AYyyQ6p8Uzgm0TJVZ0Fm3KS5LQfkRVriZ8cAUdpbsDKMXTSvmVmXRbNMNV?=
 =?us-ascii?Q?OUGJ4LMfnE86yLCOCurSMCEDGc7/QNslHsFdgC9rWh8hPA4SbvseiKEqVcrB?=
 =?us-ascii?Q?lz2nDXE8yYWErkkXtBZ+U+2Llju15aL5S4nbwo4tc8NknR5FnmpWQD+26zYA?=
 =?us-ascii?Q?xHsTHRT/p4l2UABjzz+hKCpzEja7K9cylvFVbSpbsbgP6VUkOBXcqpBcmOy9?=
 =?us-ascii?Q?FEPXOe9DVxBaUMWx7tqPAbKIRH/yvW+y26o9KggE+njHaSwk+k+CWwgMBOtH?=
 =?us-ascii?Q?/qJxdVAZaTaPXCD2bX7VVfbXKZKkJyiwmxx8jj8dIPvTBM+R/U4I3sUtR4Ay?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba77fda-2e80-46c6-490a-08dde6d8aea8
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 08:47:27.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGmU1MwPkY9FLHn3X2MQs6/vWKyK1o+bQo03BBUjNJNqk7BpalQej7JiHkb0wSXWAZsDQz1lFtOjhucNp+lVaMf8Vn1NIk5Bja1+7iS3/iA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3039

This adds the control driver for the Chips&Media Wave6 video codec IP.

On NXP i.MX platforms, the Wave6 consists of two functional regions:
a control region responsible for firmware and shared resources,
and a core region for encoding and decoding.

The control driver manages shared resources such as firmware loading,
firmware memory allocation, and synchronization required by the core.

It also binds the `wave6-core` sub-device and coordinates with it
for firmware and power state management.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  17 +
 .../media/platform/chips-media/wave6/Makefile |  17 +
 .../platform/chips-media/wave6/wave6-vpu.c    | 654 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 131 ++++
 6 files changed, 821 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h

diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..63d79c56c7fc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select VIDEOBUF2_DMA_CONTIG
+	select V4L2_MEM2MEM_DEV
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The wave6 driver manages shared resources such as firmware memory.
+	  The wave6-core driver provides encoding and decoding capabilities
+	  for H.264, HEVC, and other video formats.
+	  To compile this driver as modules, choose M here: the
+	  modules will be called wave6 and wave6-core.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..06f8ac9bef14
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# tell define_trace.h where to find the trace header
+CFLAGS_wave6-vpu-core.o := -I$(src)
+
+wave6-objs += wave6-vpu.o \
+	      wave6-vpu-thermal.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
+
+wave6-core-objs += wave6-vpu-core.o \
+		   wave6-vpu-v4l2.o \
+		   wave6-vpu-dbg.o \
+		   wave6-vpuapi.o \
+		   wave6-vpu-dec.o \
+		   wave6-vpu-enc.o \
+		   wave6-hw.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6-core.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..2b8c3a5fec33
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,654 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+static const struct wave6_vpu_resource wave633c_data = {
+	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
+				       enum wave6_vpu_state next)
+{
+	switch (vpu->state) {
+	case WAVE6_VPU_STATE_OFF:
+		/* to PREPARE: first boot attempt */
+		/* to ON: already booted before, skipping boot */
+		if (next == WAVE6_VPU_STATE_PREPARE ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_PREPARE:
+		/* to OFF: boot failed */
+		/* to ON: boot successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_ON:
+		/* to OFF: sleep failed */
+		/* to SLEEP: sleep successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_SLEEP)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_SLEEP:
+		/* to OFF: resume failed */
+		/* to ON: resume successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	}
+
+	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
+
+	return false;
+}
+
+static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
+				enum wave6_vpu_state state)
+{
+	if (!wave6_vpu_valid_transition(vpu, state))
+		return;
+
+	dev_dbg(vpu->dev, "set state: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
+
+	vpu->state = state;
+}
+
+static int wave6_vpu_wait_busy(struct vpu_core_device *core)
+{
+	u32 val;
+
+	return read_poll_timeout(wave6_vdi_readl, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core->reg_base, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_check_result(struct vpu_core_device *core)
+{
+	if (wave6_vdi_readl(core->reg_base, W6_RET_SUCCESS))
+		return 0;
+
+	return wave6_vdi_readl(core->reg_base, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
+{
+	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
+{
+	dma_addr_t code_base = vpu->code_buf.dma_addr;
+	u32 i, reg_val;
+
+	for (i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
+		reg_val = REMAP_CTRL_ON |
+			  REMAP_CTRL_INDEX(i) |
+			  REMAP_CTRL_PAGE_SIZE_ON |
+			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
+				 i * W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
+				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
+	}
+}
+
+static void wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
+{
+	if (vpu->code_buf.size < W6_CODE_BUF_SIZE) {
+		dev_warn(vpu->dev,
+			 "code buf size (%zu) is too small\n", vpu->code_buf.size);
+		vpu->code_buf.phys_addr = 0;
+		vpu->code_buf.size = 0;
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.vaddr = devm_memremap(vpu->dev,
+					    vpu->code_buf.phys_addr,
+					    vpu->code_buf.size,
+					    MEMREMAP_WC);
+	if (!vpu->code_buf.vaddr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+
+	vpu->code_buf.dma_addr = dma_map_resource(vpu->dev,
+						  vpu->code_buf.phys_addr,
+						  vpu->code_buf.size,
+						  DMA_BIDIRECTIONAL,
+						  0);
+	if (!vpu->code_buf.dma_addr) {
+		memset(&vpu->code_buf, 0, sizeof(vpu->code_buf));
+		return;
+	}
+}
+
+static void wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
+				    struct vpu_core_device *core)
+{
+	struct wave6_vpu_work_buf *pbuf, *tmp;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!core)
+		goto init_work_buf_done;
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed\n");
+		return;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
+		return;
+	}
+
+init_work_buf_done:
+	list_for_each_entry_safe(pbuf, tmp, &vpu->work_buffers, list) {
+		list_del(&pbuf->list);
+		wave6_vdi_free_dma(&pbuf->buf);
+		kfree(pbuf);
+	}
+}
+
+static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try init directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto init_done;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+init_done:
+	wave6_vpu_init_work_buf(vpu, core);
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
+			   struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC)) {
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return 0;
+	}
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	wave6_vdi_writel(core->reg_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
+			    struct vpu_core_device *core)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try wakeup directly as firmware is running */
+	if (wave6_vdi_readl(core->reg_base, W6_VPU_VCPU_CUR_PC))
+		goto wakeup_done;
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core->reg_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core->reg_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+wakeup_done:
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
+			      struct vpu_core_device *core)
+{
+	u32 product_code;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	product_code = wave6_vdi_readl(core->reg_base, W6_VPU_RET_PRODUCT_CODE);
+	if (!PRODUCT_CODE_W_SERIES(product_code)) {
+		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_wakeup(vpu, core);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_vpu(vpu, core);
+
+	return ret;
+}
+
+static int wave6_vpu_get(struct wave6_vpu_device *vpu,
+			 struct vpu_core_device *core)
+{
+	int ret;
+
+	if (WARN_ON(!vpu || !core))
+		return -EINVAL;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return -EINVAL;
+
+	/* Only the first core executes boot; others return */
+	if (atomic_inc_return(&vpu->core_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret)
+		goto error_pm;
+
+	ret = wave6_vpu_try_boot(vpu, core);
+	if (ret)
+		goto error_boot;
+
+	return 0;
+
+error_boot:
+	pm_runtime_put_sync(vpu->dev);
+error_pm:
+	atomic_dec(&vpu->core_count);
+
+	return ret;
+}
+
+static void wave6_vpu_put(struct wave6_vpu_device *vpu,
+			  struct vpu_core_device *core)
+{
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!vpu->fw_available)
+		return;
+
+	/* Only the last core executes sleep; others return */
+	if (atomic_dec_return(&vpu->core_count) > 0)
+		return;
+
+	wave6_vpu_sleep(vpu, core);
+
+	if (!pm_runtime_suspended(vpu->dev))
+		pm_runtime_put_sync(vpu->dev);
+}
+
+static void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+					  struct vpu_core_device *core)
+{
+	struct wave6_vpu_work_buf *pbuf;
+	u32 size;
+	int ret;
+
+	if (WARN_ON(!vpu || !core))
+		return;
+
+	guard(mutex)(&vpu->lock);
+
+	size = wave6_vdi_readl(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE);
+	if (!size)
+		return;
+
+	pbuf = kzalloc(sizeof(*pbuf), GFP_KERNEL);
+	if (!pbuf)
+		goto exit;
+
+	pbuf->buf.size = size;
+	ret = wave6_vdi_alloc_dma(vpu->dev, &pbuf->buf);
+	if (ret) {
+		dev_warn(vpu->dev, "Failed to allocate work_buf memory\n");
+		kfree(pbuf);
+		goto exit;
+	}
+
+	list_add_tail(&pbuf->list, &vpu->work_buffers);
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_ADDR, pbuf->buf.daddr);
+
+exit:
+	wave6_vdi_writel(core->reg_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
+}
+
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	vpu->fw_available = false;
+	wave6_vpu_init_work_buf(vpu, NULL);
+	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
+		dma_unmap_resource(vpu->dev,
+				   vpu->sram_buf.dma_addr,
+				   vpu->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(vpu->sram_pool,
+			      (unsigned long)vpu->sram_buf.vaddr,
+			      vpu->sram_buf.size);
+	}
+	if (vpu->code_buf.dma_addr)
+		dma_unmap_resource(vpu->dev,
+				   vpu->code_buf.dma_addr,
+				   vpu->code_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+}
+
+static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
+{
+	struct wave6_vpu_device *vpu = context;
+
+	guard(mutex)(&vpu->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(vpu->dev, "No firmware.\n");
+		return;
+	}
+
+	if (!vpu->fw_available)
+		goto exit;
+
+	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
+		dev_err(vpu->dev, "firmware size (%ld > %zd) is too big\n",
+			fw->size, vpu->code_buf.size);
+		vpu->fw_available = false;
+		goto exit;
+	}
+
+	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
+
+	vpu->get_vpu = wave6_vpu_get;
+	vpu->put_vpu = wave6_vpu_put;
+	vpu->req_work_buffer = wave6_vpu_require_work_buffer;
+	of_platform_populate(vpu->dev->of_node, NULL, NULL, vpu->dev);
+
+exit:
+	release_firmware(fw);
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct wave6_vpu_device *vpu;
+	const struct wave6_vpu_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "dma_set_mask_and_coherent failed: %d\n", ret);
+		return ret;
+	}
+
+	res = of_device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
+	if (ret)
+		return ret;
+
+	atomic_set(&vpu->core_count, 0);
+	INIT_LIST_HEAD(&vpu->work_buffers);
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->res = res;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0) {
+		dev_warn(&pdev->dev, "unable to get clocks: %d\n", ret);
+		ret = 0;
+	}
+	vpu->num_clks = ret;
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			vpu->code_buf.phys_addr = mem.start;
+			vpu->code_buf.size = resource_size(&mem);
+			wave6_vpu_init_code_buf(vpu);
+		} else {
+			dev_warn(&pdev->dev, "memory-region is not available.\n");
+		}
+	}
+
+	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (vpu->sram_pool) {
+		vpu->sram_buf.size = vpu->res->sram_size;
+		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
+							 vpu->sram_buf.size,
+							 &vpu->sram_buf.phys_addr);
+		if (!vpu->sram_buf.vaddr)
+			vpu->sram_buf.size = 0;
+		else
+			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								  vpu->sram_buf.phys_addr,
+								  vpu->sram_buf.size,
+								  DMA_BIDIRECTIONAL,
+								  0);
+	}
+
+	vpu->thermal.dev = &pdev->dev;
+	ret = wave6_vpu_cooling_init(&vpu->thermal);
+	if (ret)
+		dev_err(&pdev->dev, "failed to initialize thermal cooling, ret = %d\n", ret);
+
+	pm_runtime_enable(&pdev->dev);
+	vpu->fw_available = true;
+
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     vpu->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     vpu,
+					     wave6_vpu_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_release(vpu);
+	wave6_vpu_cooling_remove(&vpu->thermal);
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	wave6_vpu_release(vpu);
+	wave6_vpu_cooling_remove(&vpu->thermal);
+	of_platform_depopulate(vpu->dev);
+	pm_runtime_disable(vpu->dev);
+}
+
+static int __maybe_unused wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int __maybe_unused wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	SET_RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+			   wave6_vpu_runtime_resume, NULL)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = &wave6_vpu_pm_ops,
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..01a2e985dd54
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/device.h>
+#include "wave6-vpu-thermal.h"
+#include "wave6-vdi.h"
+#include "wave6-vpuapi.h"
+
+#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
+
+struct wave6_vpu_device;
+struct vpu_core_device;
+
+/**
+ * enum wave6_vpu_state - VPU states
+ * @WAVE6_VPU_STATE_OFF:	VPU is powered off
+ * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
+ * @WAVE6_VPU_STATE_ON:		VPU is running
+ * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
+ */
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+/**
+ * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
+ * @size:	Buffer size
+ * @dma_addr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @phys_addr:	Physical address of the reserved memory region or gen_pool
+ *
+ * Represents a buffer allocated from pre-reserved device memory regions or
+ * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
+ * Managed by the VPU device.
+ */
+struct wave6_vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+/**
+ * struct wave6_vpu_work_buf - VPU buffer for a coherent DMA work buffer
+ * @list:	Linked list node
+ * @buf:	VPU buffer for a coherent DMA buffer
+ *
+ * Represents a single work buffer needed by a VPU instance.
+ * Managed by the VPU device in a linked list, allocated upon request
+ * when a VPU core device creates an instance.
+ */
+struct wave6_vpu_work_buf {
+	struct list_head list;
+	struct vpu_buf buf;
+};
+
+/**
+ * struct wave6_vpu_resource - VPU device compatible data
+ * @fw_name:	Firmware name for the device
+ * @sram_size:	Required SRAM size
+ */
+struct wave6_vpu_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+/**
+ * struct wave6_vpu_device - VPU driver structure
+ * @get_vpu:		Function pointer, boot or wake the device
+ * @put_vpu:		Function pointer, power off or suspend the device
+ * @req_work_buffer:	Function pointer, request allocation of a work buffer
+ * @dev:		Platform device pointer
+ * @reg_base:		Base address of MMIO registers
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @state:		Device state
+ * @lock:		Mutex protecting device data, register access
+ * @fw_available:	Firmware availability flag
+ * @res:		Device compatible data
+ * @sram_pool:		Genalloc pool for SRAM allocations
+ * @sram_buf:		Optional SRAM buffer
+ * @code_buf:		Firmware code buffer
+ * @work_buffers:	Linked list of work buffers
+ * @thermal:		Thermal cooling device
+ * @core_count:		Number of available VPU core devices
+ *
+ * @get_vpu, @put_vpu, @req_work_buffer are called by VPU core devices.
+ *
+ * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
+ * by the VPU device and accessed exclusively by the firmware.
+ */
+struct wave6_vpu_device {
+	int (*get_vpu)(struct wave6_vpu_device *vpu,
+		       struct vpu_core_device *core);
+	void (*put_vpu)(struct wave6_vpu_device *vpu,
+			struct vpu_core_device *core);
+	void (*req_work_buffer)(struct wave6_vpu_device *vpu,
+				struct vpu_core_device *core);
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	enum wave6_vpu_state state;
+	struct mutex lock; /* Protects device data, register access */
+
+	/* Prevents boot or sleep sequence if firmware is unavailable. */
+	bool fw_available;
+
+	const struct wave6_vpu_resource *res;
+	struct gen_pool *sram_pool;
+	struct wave6_vpu_dma_buf sram_buf;
+	struct wave6_vpu_dma_buf code_buf;
+
+	/* Allocates per-instance, used for storing instance-specific data. */
+	struct list_head work_buffers;
+
+	struct vpu_thermal_cooling thermal;
+	atomic_t core_count;
+};
+
+#endif /* __WAVE6_VPU_H__ */
-- 
2.31.1


