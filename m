Return-Path: <linux-media+bounces-20551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B49B5A0B
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176771C2120A
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDFE194A73;
	Wed, 30 Oct 2024 02:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Utv0ZHxh"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743D87489
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 02:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730256262; cv=fail; b=l3154D0fC81l9PpxSAAxVxlgefmgEUE19PrU7xazu9KhA/Do2sHMJYKqoG1TmNF8RNDCVBN0zKy0J+RxD6o3TQC7Tpe5G2b8UAbfFrJEaoxte1ScAJ8r05sqtqYj54t7cvGPLIvyMidZJxm8D5V+5XwxTDqqFYMsnPFq8m6Bs/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730256262; c=relaxed/simple;
	bh=n0sUnZNezr6FoMjS3aBRhYMWWSFNOiNTlkNR0UejEtI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D2+oHWJc6Gzs/1ZhhkU4v/yGp2nF9BIqsjXbHilwigHUsgQRVc1lCDqhTfQ2uJHPUOdN99wEXGZjyvAg9M7Vy5fK2zM0+jqlkgwoea7wJ5TWoNQs+GHQF8+wvTJlYXUmMbKCQfwzWUyifb2fAhg5NdZLX4fDqs6+9isd+sAX9FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Utv0ZHxh; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGS3ND1viqNsjWbsDsiwgl1NF9SfUKISepNoZCVQtOSWqJCNJ6JVH/HogIjryNxXdG2N7A4skP4g0TJ49sZ4Qtj3LI9vJ9N7vZ0+YOICAZX3SFU+75v+5bdgNmn2d0VCM1y4V6M2h9RAqF7VURGGILcn2frvkygvw1hQ1MiQwj9RqxjrGoQK2WJs0Bq5TS0MZ7zgqM34BULRPXnPrBz6g7PxocDFRydc+obmqSxvG+v9cekzCRAJ9yMWn+exC92828PIT7i6ZIOnA5eFQbK1uSSEqPatIuvqfAgA781SlF1MOkFPWAEErJoJ79AjQ0mvjnACY1VM0CSRfUzLB0ltfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLSKeJUovQEbJfjwk4ZtH6+BiTv1JngRxIY9Hkp5nBY=;
 b=Frk98d3ZRHIUXp1obUEH0QRwlE4SCq6eNhg7kbxJO77L31ARPgU9IwBd6kgwPRjojiMKGsZBKFQ0bSMeL34IKkHxzNtqYE4MxvQxUndJqPJVHuY4EXxBzd7eIaxl9YBNy4uPiK4sZkHNsmes9tqhMDG7Z1KVzjvlmIrKCjXhOfyCMB1kM9b0lIeJ5M+Ogdw9DjLpDHZRB5HObDvSvt3ZZKcQo/JaxdNV6cXUolO1nvQ4OLcKsAJmbyVXt7BXpApB7uxg2XI+W3c8k63peJ1Buvvmkq6u59zOP91QsosmwQpGW/Pmuu7no0jACxPsrv/ZRBn92x3IbIXZ94YNXFtyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLSKeJUovQEbJfjwk4ZtH6+BiTv1JngRxIY9Hkp5nBY=;
 b=Utv0ZHxhCtVHksG3sHhxI/E1puWvjHo0V8yLme6Ag16QZM2ulT1Z4KV5xqPaLdeMVM+9A+ZaefErjD72HLTCHCjIQqLoy3xqrduuEgfEMYQIDx13Ecdo0a9H2IzNe1jqTn6FmvCVVzstcdtvZQXGwfiXqf+0Yfi4586bMImIOfs1tS4T6+5nB0GaN+Ufj+bJcGrK4GzxuVfa/Rz6Zc2QS++HdzVCBMmaG4TQPM0EZLmMA44qymOD5K7h+Mh3xuM+tr+B5BAo0P6u6Co4bPdhK7iUP5frDRuAR0HqpvDsWGrlVcWm4d58i17HQ+edRZfTeuwIcfuZVG7TZC92oksrJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GVXPR04MB10729.eurprd04.prod.outlook.com (2603:10a6:150:226::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:44:14 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:44:14 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v2 0/2] Support V4L2_CTRL_TYPE_RECT and V4L2_CTRL_WHICH_MIN/MAX_VAL
Date: Wed, 30 Oct 2024 11:43:04 +0900
Message-ID: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GVXPR04MB10729:EE_
X-MS-Office365-Filtering-Correlation-Id: e016a54a-a53b-48af-1535-08dcf88cbdbb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?pw0sl/ds+oc8ukVJNd0iChoH28bySf9qr+Ot9HyaSnoQqcWsILC4D2icokc4?=
 =?us-ascii?Q?5TntUUY4xuVAWIL0MJXmri1PZAdaLFbPloj+ttlcv6BaizyVXxVrs3JR52nD?=
 =?us-ascii?Q?eEY7CVyQpWTJvZvHZd5iHsqdBHTLQnUlgiT1yDTuRZKXsUX3ymEyetsMOwIe?=
 =?us-ascii?Q?BSGfh2bZk4PCdEqH0gkvos0xNIsbCQP5vDlY6FhX7JiCiox523nCWc7n95u2?=
 =?us-ascii?Q?7wtFd90hVC/G8gtXwiLGK7SuggHJrs9+kx8UWlWDrEBOVWcDzCndPMs5am7X?=
 =?us-ascii?Q?W9LM6wdZi1+Bq2nXChLFtTo7yFX7lfOeImoFxXHqO8di7aNKVn8v/YW73yvr?=
 =?us-ascii?Q?8B3kldDvV5T9kR8gEkAhB872u0hSFqYrqRS/5lhB35cVxRz+u/PX9LHH5ecA?=
 =?us-ascii?Q?NQJBXqXo90yrzmidGvBsxwtLvDMKgtRrD+lVwPnRhelKj1GvrUH6u8EEMVF0?=
 =?us-ascii?Q?k7LXjZkaSwb9jHe6lnIKipuzVsY+Xi+OVRErRhNGqhpMZKHCFSC8sFiD/PxU?=
 =?us-ascii?Q?W4ubL8F1tm6mzSMNyRMiLbneD9YXk91+mL98JsPNEg1f7WuF4Opku/utPldI?=
 =?us-ascii?Q?qmkrzvmSgqNSS9fxgI6yK4sG+WxVDZIODwZTxKEvbzMWyGltStzTE6Z7Gr7e?=
 =?us-ascii?Q?nbZyN1NZzcL8NQeLNyoomnDoZWw8jfgKHKq0aUkHk9xfAINLFJGpAROCG3Jx?=
 =?us-ascii?Q?6ULSJvqnSQr/LKRZvQLigCUdkUmQDg6eZwBRk/GMdx4EtekS0gUkqfWxI6j8?=
 =?us-ascii?Q?2nrTv33Z8DheWjQJ/P4leJt2gApj99DtBpSLEZiskk4wNc2d1H5y367CA2Rv?=
 =?us-ascii?Q?zPoQh3e0yIUGaqEbm6yn47PA0sXIWyyy7sbuX3Imqk2Cv6wwz0Z6HiMueEeJ?=
 =?us-ascii?Q?pplWkQPqauNhQ5CJAetOkmPm+15ObmC6h6R8mhOm2C9E9WLZPalzn/LC+Jwq?=
 =?us-ascii?Q?5RDGOYJ+4dYLMBDLT2+hktZT3RQDJRNl30V13+pQKBCAhO9DcsXM6U8SMuiZ?=
 =?us-ascii?Q?J+FDD9KJTlzjFWJQ5pkJW62tf/mmBFtVWaB7pulPPhUYrw4gF25GS5mjfyqj?=
 =?us-ascii?Q?ZqAhsXN+ZnBwkUPL1zDMgf17BpaC1G3aw7O699gk8p1NL0e9V9bhlBg/Fr1e?=
 =?us-ascii?Q?ZRFFQ8Yv6MXoFI+WLX906uO2wHsnyz07IDIm5YdJNLRYFoYLHzDFmShzPcO/?=
 =?us-ascii?Q?1wqz9LX2hM9lPTul3AfWABQyDLnhwBgYVkAXz5NzAeV/5TVmFPQEM6/rygUG?=
 =?us-ascii?Q?meix67AWp2Bi0AxdvBOdzZ8cAoqgvyNC1Dy4slhKwg269wIC0Y8SuHUdbzzV?=
 =?us-ascii?Q?/cTxec353zM4vDwKVh551wCgyBTr4bwjW+txVgDG5G0aa0T1gA9NRL+0xn3O?=
 =?us-ascii?Q?b9tQrnAKtMFpdE+9LGgVONgymekK?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?CG/KygCw8cWBSCMBDr55JGlje7jlEAIVRCyqmREC1RJ2OPlxMz3JRN5+MT8a?=
 =?us-ascii?Q?CmRdACW6GXW7dL1brmPZwy4AfdZdy2ielGc0sXcLy8WII4voZXpHR+gYEz5h?=
 =?us-ascii?Q?q3APEWpJc4B6ZS6TujX8uUadNulL/zvNvG5IYNxLPNjaWgmxprJYiurwrDxL?=
 =?us-ascii?Q?FaEmIEi/mRxoAYmuHpu765SgR9WDOvX61OWTKb8uC6GploGNelzVEIdfo2CX?=
 =?us-ascii?Q?0n/QjU3tU8XeeCVAn/2Q0y4czndhj+TOE4gQ1dhz1/pCCJ7zvqzwd8fjz5+z?=
 =?us-ascii?Q?QR3MCyQKc0Dw2W04ckmcQ5QJcoju2z8xiZM1+rg6BffdWwlQ0/HP08QseIWO?=
 =?us-ascii?Q?QE2zDh0Dm6uMdywa3X3G/Tqc6bSBq6pP+1wi5z1GCAT9Q+BQy59AfkovyqAc?=
 =?us-ascii?Q?KgDgR4Uq4NMCdGpuyyT0C+7bJ4kRwFmlXGhnmibm23Pbhd01X1auPnB4JNHK?=
 =?us-ascii?Q?y6tmSkK7fsIEdIztdcUNkJRYwl3uRIhagL4eOqJLtUoraYNmPNjoketxIKmA?=
 =?us-ascii?Q?hy5zIsIMxN8snTTUrZ6ceMX93WpJIm9bwSukCRHzlSwxB/mS/nNqAdOEmWeX?=
 =?us-ascii?Q?BTFY3M5lu73An8kxTDPiPwpppJgbMY7tK0teiRroeKeN0Pef19LN1yIuUdDp?=
 =?us-ascii?Q?ncl9G7xMWg/JfqIpkWZEMJ1aGVRcyNyXunxfSt1pfnhhd5JPLgqwa8rbPmVB?=
 =?us-ascii?Q?t+p7gJbDcTnM/sIZiCacx073IWsAXibu9Zq3ZEt25T7vWAJki4RRNCg+JNcW?=
 =?us-ascii?Q?fMsLTsTWi0x4QZEfjRw3QPV42OOAwRc3naU4Kv1jy0Nc4kQJ2SX+YOc9v/vn?=
 =?us-ascii?Q?/JW3oTtPXsVTRojIIr3lrAjCCq8841BtUU1MnTbbHi4ZUiS0GpXUUar+5cTW?=
 =?us-ascii?Q?vhLH5Ky5I/RA/GbeEesk44dIMR4Omhi9iYLH7tbq/iWnHgzbxMCa4WIw4Llh?=
 =?us-ascii?Q?P76bxxKJUb9kZzCmZ9/iV2NSK3zW0F6b6SSG+E1f97kmA4BwbbxmwCiLfDkG?=
 =?us-ascii?Q?8b7lnonnGUAc3a98p0SK1364Aw9Mbf7UwMJxK0F3oZXm0aUzmlaaH4kEgltp?=
 =?us-ascii?Q?a1T/ZAhl0H9UZC5jMesxZ8wOyE5DkwPpnNEsvMaRgprVkw5KOuh42Bi5OMsS?=
 =?us-ascii?Q?SDw3YSvYMcoYdV1L08PvihD/0X51bm4cemx9BPTz9zzAa8YUE60BQRwh8kCh?=
 =?us-ascii?Q?PBLfKqu9pjV031QW/FHhmUQWNfzABSAfuJYUGUwlxiz6h76SW7khoXDhA78s?=
 =?us-ascii?Q?ll2x3xkBblAuICZK5CajYTs/Ehdm5OfG3EEwVdH0U+zmRbHZcAxWXVA/LkAH?=
 =?us-ascii?Q?0Jj39CCiSo+E4uj6ByniEAd238EQMWQCxm7MWzspAmqc3iH4vddmB+v/5ern?=
 =?us-ascii?Q?zh3OhcHPnKDV1hTM/S6sAa5N6KOYDuiR3y/iwNT0xytIlLqojpOBiOX11T7C?=
 =?us-ascii?Q?8hc/4IsdUTWgYd7hAZ03lUexdyKAKtYbLg42AaeOn5r4rBzG93ojtOASVT8a?=
 =?us-ascii?Q?fuuUmB9dZyH62G7yUYC+mqR9JsAosvcAitIdHAKvyhYp8GjAaPlSHb96r3PG?=
 =?us-ascii?Q?yzmbpSxlj3xSm3S5vnhsQQnv16cgZsH1/auPl7v4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e016a54a-a53b-48af-1535-08dcf88cbdbb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:44:14.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uo4DoKWs5L8BVcz5Az9LDab9+tMboEzZDwjXa2x/KOhy/5Fm5R0I/eMgLT1eoNZPGanTTybp4nom2b/UBcDbBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10729

From: Ming Qian <ming.qian@oss.nxp.com>

Hi!

This patchset adds basic support for V4L2_CTRL_TYPE_RECT
and V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-ctl and v4l2-compliance.

The corresponding linux kernel patchset can be found at
https://lore.kernel.org/lkml/20241030022134.1098589-1-ming.qian@oss.nxp.com/

Ming Qian (1):
  v4l-utils: Define V4L2_CTRL_TYPE_RECT

Yunke Cao (2):
  v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
  v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL

 include/linux/videodev2.h                    |  5 ++++
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 24 ++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp           | 12 ++++++++++
 4 files changed, 42 insertions(+)

-- 
2.43.0-rc1


