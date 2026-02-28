Return-Path: <linux-media+bounces-53832-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ACpJrO2ommw5AQAu9opvQ
	(envelope-from <linux-media+bounces-53832-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:34:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 172341C1C36
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 10:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50F69304001B
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 09:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB643DA7DF;
	Sat, 28 Feb 2026 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RTdfwhZs"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AB836D4EC;
	Sat, 28 Feb 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772271271; cv=fail; b=WTNZgSBnjU7Os1Ktc5Y4aOJhg4ZnkAKbEQ3zdu5UapyRSsjg8QSrgy37GImhDd5GtQAOXwHKS3rqhj4kMMiqDKik8Zsm7OHhm8CPGBlXZq3K3oP9KJD5J6FVFv73zSHYMcT2Z8lHfgj+bxvQEa4syDsaA5HbrpewATNKhkUKl5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772271271; c=relaxed/simple;
	bh=F1zfWZdG0W1ytD8tUtpqvqGkWCCCm99DbrzOZbBDKKE=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=BQG/N844/HGGTWCE0WLR7tQnlDuv8NQMPfjKPvRn9CPK39Zc9ZBFscuNr2T/+7uv+QZHmMbLbNlqsmfiIWIkjoB3oKqxXm0iOHkYrhyNkVdZMJXO9kMdyxrCVcT2kBL/GxsD8jO5+E1/w+BgGc4OOII1ytKlyuzrIk+wGyvcl2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RTdfwhZs; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmDwn1pWzYGXerIb5DCfOI4g1T0wDRlV4g3po6fWnBWgnghfncOc2vKCZklEXJ/y8q6ipDpw8lavOXq1cQ/z4G3DzrsV/D4CBHlwJ4VOYUg9h6pIU+wsBwSYPFvmRH1k2QnYvJQ0PJy09z7U5bKMU0LZO6Hi0zkiK1+tdfBoO2zwfXuTp8lUUafPil5pU4mBoLhOoawebNj5pC9Oapx+YpyxR7/nnKk8ARlipLF25iwvVfXW0+cqxL7mO43ZDvOXT67EAztFTTJIyVgTpZ6KQFyOkeQCdxY0FFTRtikK0vi6MvhOSYJs3HmzDoToKnafgSOsUMCth6G7sE/N89uYJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0bUPfcGNZUOpgOteig7ud1scd8XgJ5Vi/zV/lbw6KHM=;
 b=E+hMUPy6TVT7lwRXS479Bb7j9Qm1RAqBbal1QO54oKcRFhFqSDOgW5rf6GgAYci765G3VovnvBFGzcKNwAVTHCSSOgeqLWlvrH2kjBAae5TFf8IzkQol5NqKjzkKoSOqM/Y84q9e3n3B2lbxP5H15NQ5OtELhRThTYW9FJ9FvJCmLYU+iGPauSv87LUwmunGYuCrqPR8MChXgZ/+NlbD6JC7Zgpdn/17TYjaINMxVxthGKlCfoXcoIKzu6kHvWARAO5uynIYDz5Mg9/uR/gmEomp2z8FmT1xoG2FKqNMtYOgoHmG+I36w5vLYXS9RBEz8rYx2SpiWPZ7l+roARppvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bUPfcGNZUOpgOteig7ud1scd8XgJ5Vi/zV/lbw6KHM=;
 b=RTdfwhZs3lECLm6PX5coB4gSA1/xFQjadrNfOoiYiz7ts8Lf719VF0to9GuoTXqPpZ5QCbufa+WVb2qUDyHvuN9PjRkAwNr942fPFseLRpyRTN0daG6SIQKhO3Zp5sm44X1cIP37Slc6NZ220Wdo5WggZPHIO2b0iiE/FYp/yavAnmPpw+UZBvEmUcr9blgQkfxgNx0KvW7EnOzRhXwcoJMjSu8T3if4QcKZV4+Y/qiO3l3PPiOpoigYjOVU9LF5dNimWz7H0JASI9ur5kJxFYRFlElLfzKkeYZiu9r2tX6R/y1S9TEamF70bPuHAmHy06+w5kqb/3NYhWccsPfcsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB12013.eurprd04.prod.outlook.com (2603:10a6:150:317::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 09:34:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 09:34:23 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Feb 2026 17:35:53 +0800
Subject: [PATCH RESEND v2] media: nxp: imx8-isi: Fix potential
 out-of-bounds issues
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>, 
 Frank Li <frank.li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772271384; l=3910;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=00TVgTGKW5d8Ko+WL1Hlqykufz4DsHx6G4ZWRhC5Co8=;
 b=hsjjZ/nTkqSY5yEFcxgrWTDzMIWPM8w7dgQuH/NozuVYaVPJQxQMkmBas7qxBjx+uabjpMcq6
 2E4LuCHsL55C0bd8NmxP2s7ydc0sFbLDHytRTnlkYS9kwwEGrt/HbDF
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:194::23) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB12013:EE_
X-MS-Office365-Filtering-Correlation-Id: 636c8417-03c9-4c0b-13e4-08de76ac8ed8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 bHhXWM16tFD/6L0lO2m79ucDWfyiDwTazYxRUP0wzrYNtgR0bOEckNePntNwYKGK85tGNWTe14qlpnMIiTL1g331bQ9GBkR95/e/0QGX1jAwIuA9lf+28adIw3AdIUk2BHgGQgqAJM7CKgdwK0JVqQ4+mzb0udKQejLZ2eRkSwpuArGhM6+lE7im3fTPcUMOPHxMjcywZOjqi6jVbjhhdYeahTU6aku7/NvykPLc/mn0ZJfyFt/Mtp9Re3aMJ1BNTWwJXUZKwNXCNuzekQSccLOCE9jocgops9rl27Qlv1TKuuLB9BqzRO54OCxJgtU0KeC4WfR0lTjZ9q64zrf8kb6slyFUKZ0NL37/NTwfe7dFFXTB86Ijo2+aaMRJhblkIQElbZWbNg5AoCGSEGZJke2Wg91/R9KVjHnqYnzjCnL6RbqxOE5zzmcHquUBfglhr/tzxaOj5pMuTYPRfauv5v51NNlHYv05v3FEosHWnTMp1vfkcnvrepD798EUTYg49JRtmSyKXEc6BPI13en1We1xi8Dg8h3YMaerPCOaY8Z+aHJE8CHMbOcoWpfIfUz0DxT+qMh1Ya/aI7Qc9bqNZSQaoyNfun81DW2JeyPUtx1Nmlkm9JojnjjPGgFhssj/OIe5G8wjC2vX25/K2mecSLVeh8bGy9StFULvhKCkuPCVfX6TZKoTBL6GNJdrqoYmoKxk2yAaeybNSPv6q+dc+0pPPrAp9clEjjkGuhDJ4jKsOHJY9ebPAsJ14htWOMD94Jj2vUYgpHYOQQSNwSImDA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eHpTbVpyUmZtQXZTeVpEMElaS2Q1YlNTNVRsNkliNjF2aFVGcXZlUlQvaGtO?=
 =?utf-8?B?VTJicm1TT0N1WUU2RkxZcDk2MXdBUlIreEtFUlBvSmRoSVlVNDIzWWcwbVRl?=
 =?utf-8?B?Mjl3UTVlTXhmc3hYdC9HR1RsS0pOVC8yREUwZjIwNU44bWNxVVZ2RjRyNkFC?=
 =?utf-8?B?Z1REckxYNVNMcGNLSXpvdlZ1UWxRcUt3QU92TGF3SkdkUzdodE9jUUJkbHZh?=
 =?utf-8?B?NFNnblRZV2s4QUdXanNtbWJXMDdNYkM0QTBpY1RLby9hV2svamNIRytNVldQ?=
 =?utf-8?B?UVh4dDZOL2hBeTlqRDRGUFNjdVBZU1IxWXZhbkxINklocDhhM3FEbjdvSkM3?=
 =?utf-8?B?eklqYXJvdzI2RVcyallpNER6cGJVWUhQZk1CQkQyQ29zNGRZdTBmekpiVEsy?=
 =?utf-8?B?dTZGODNJRVBCc0FDdXhDc0VFTDVtTVhxSHRDTVIzakI3L3FuTWxwWTVNZEp1?=
 =?utf-8?B?bFJ1MXFoS08rQUdaUndCVkozaWZWN2hpSnY2VjZ1Qk5URUtxVTB2Rjd5TXRI?=
 =?utf-8?B?eHRUWCs3ZFVLdmZ1THQ4RkZaR1YwNUh6aTUzU2ovaW1WL1pwOE1iV0x4cVhq?=
 =?utf-8?B?cEdNSTh0MlQ3eGpnYUdjZmFoZ0FPVXM0aDlDdmpsQ0FwS1MvRnZsbEw3Skox?=
 =?utf-8?B?bDh3REtyZGJsRjZhY1lxTXY0ZmlHV2JwR1lPYW1SQ3E3a1VVUFBETmQvYmln?=
 =?utf-8?B?dXJ6QytEanJCSklYVFpYVU9BeCs0ZktVL3dvL2pBR1F1TkxaUDVyV2hCRTNr?=
 =?utf-8?B?VGp5KzlZL1FvNjBSSDJEMXlZRFNsc1NBa0VBdFN5eWZDTUUvWHJNcHRIRVVT?=
 =?utf-8?B?bHRDMTJxRVJNYlIxczVLOUVDZlB3RUFFQXdxV2ZQc3o3L0J3S0ZYYW1BVGpY?=
 =?utf-8?B?Z2grYmRiQ3cvQS93NnJOaUdWbWJPV3kxaFFyWnQ2Y21aOVZUbmFwaG5sdkdQ?=
 =?utf-8?B?SVFlNzRrNUtGMlRsRlQ5RUsvdmNmaDQ2WjJGUTVremMzeVU5WmIrOFFkYlBi?=
 =?utf-8?B?S2E0dlZRcjRFZXBFeDlzc2tXR21YblVFWDJpeGg5R09JMC8xeERMQTYvT3Bn?=
 =?utf-8?B?c3lFaVhXamRnclM0bDF3SEpPaE1BUmFML0JtZ0xSZXNpNXpzdElVSzZrOWo5?=
 =?utf-8?B?M0JpQmVjWElYVHNlQjlyNSsxQ1JsMXNma3ZyZ2dGeWY2Tzk4ZlM5LzlRRmFN?=
 =?utf-8?B?K1diU1hCL2prR1FWY2pHQUluRC92clBEbW40ekJHSnVUUFI4NnZDMU9yQXNo?=
 =?utf-8?B?Rk1Ib2hWaDR0MjhjYTdld3NTZGxxQXRlcVgyZ2l4L3B5a2VuOVVPUE5zQ3h3?=
 =?utf-8?B?SU1KWVRpSFYrNWRMT3Z5RFlEMjQ3OEdrYVNjeUpzUk11UEY0dXJwYkg2OEMx?=
 =?utf-8?B?SnpwTTJMdGJHdUpGaG9aNGhxT2xtY2JPb0FETFpnR2l4SmZqNURvMjdDNU5x?=
 =?utf-8?B?RlJyTDZEL1IvZmVkRmVwSHRSZktnVHhnb0RDd0E2bTQvbE9VMHIvd1k0Q2E5?=
 =?utf-8?B?aUdONDJTUCtkT3Q4VkZaM0xnWlZNWjYxM1VtaGpPQnhhSElOM2pOZEVwbGp2?=
 =?utf-8?B?Z1ZIOHNXRVhMMnh5KzhIbVpMdUd5ZnM3MWF3MjRKRnJNZGhxWDEvZXRLVDBM?=
 =?utf-8?B?K0ZIVllsN2p1ZVpMUXpEU2RsM280NDEwbWNralAyNmdvMW03L3gvU3YvK282?=
 =?utf-8?B?VmJidkVXbEx3b2p3djNmWlpiNVU5Nk1Ka0ZaTFFueHhKeVZEY3JpcEVOdUpu?=
 =?utf-8?B?TjRpTi9iZVEzaVFUcS9Lc1pneVRXak9BVlRYM2dDSnl5MHRzcDhlQS9UM1Zy?=
 =?utf-8?B?VHBOcEIzSlFUcVdHY3FiT2RMSTdhL2NaNkRBd1lTdC9kdjZ5WTdNMy9rVnMr?=
 =?utf-8?B?NEYwc21KSVN2ajBRa3dlZ2xJdWdLMzdCZ1kyZjB5VXFkQmxsbnBJS1ZYUlRJ?=
 =?utf-8?B?QVNaeWpPWEMydDk5ZHZnK1pIUkZSci80MVVwZEY5NlJjZzhwOFBlMzVIWDVi?=
 =?utf-8?B?QVQ3RnBBcWg5SDV6VksxZDh6aG9sajN0TmpyOXJVWnVhSVpmcXFySWtTNWM0?=
 =?utf-8?B?RFgrZ2xNK093VFRXS0E0dDd6RGU5dTV6S1JSZnozZ1dvWUJncDVFWjRadllY?=
 =?utf-8?B?MVNZRldXWHZmT1QrREEwQU1Senc4Ukxpb284NS9FZXY1ejdaWXBjNDN6My9s?=
 =?utf-8?B?ZWZTaStYQzQyS3orZkRFakMwSk1jUEZmWVNpb2JDczRURHIvc1Q3Z21JbGFN?=
 =?utf-8?B?ZHNzYW9sQUwvZjdxNCtWZDNRaTh1YmVyWFVLUUVWaWR5TTBkZmQrVXNNcXFX?=
 =?utf-8?B?NFpRZlBHR2hVcG9LK0RBczlndS9sOXRhUksxSnpCSEo0Q29qcjVlQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636c8417-03c9-4c0b-13e4-08de76ac8ed8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 09:34:23.8144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXH3CCgbWz/iXnujQ6o30ZI5JD0O7C96t2/PeVWT91fN4GUlEij/yWHnpiyzeq4lrLP6cYfF8WcuRCsFP3vjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12013
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53832-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 172341C1C36
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The maximum downscaling factor supported by ISI can be up to 16. Add
minimum value constraint before applying the setting to hardware.
Otherwise, the process will not respond even when Ctrl+C is executed.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Fix possible side-effects caused by 'max_val' in CLAMP_DOWNSCALE_16 macro.
- Add space line between two paragraph in comment.
- Link to v1: https://lore.kernel.org/r/20260122-isi-v1-1-c3ec6e264f13@nxp.com
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h | 16 ++++++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c  |  6 +++---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c |  6 ++----
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..84e134f4d5fb26be652ac3e6aecd459bb2a0d1c6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -59,6 +59,22 @@ struct v4l2_m2m_dev;
 #define MXC_ISI_M2M			"mxc-isi-m2m"
 #define MXC_MAX_PLANES			3
 
+/*
+ * ISI scaling engine works in two parts: it performs pre-decimation of
+ * the image followed by bilinear filtering to achieve the desired
+ * downscaling factor.
+ *
+ * The decimation filter provides a maximum downscaling factor of 8, and
+ * the subsequent bilinear filter provides a maximum downscaling factor
+ * of 2. Combined, the maximum scaling factor can be up to 16.
+ */
+#define CLAMP_DOWNSCALE_16(val, max_val)			\
+({								\
+	typeof(max_val) __max_val = (max_val);			\
+								\
+	clamp((val), max(1U, __max_val >> 4), __max_val);	\
+})
+
 struct mxc_isi_dev;
 struct mxc_isi_m2m_ctx;
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index f425ac7868547da401e86ce5a9b70a9890e72541..8860d89713667d06abc94e6024526fabac46feb7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -509,9 +509,9 @@ __mxc_isi_m2m_try_fmt_vid(struct mxc_isi_m2m_ctx *ctx,
 			  const enum mxc_isi_video_type type)
 {
 	if (type == MXC_ISI_VIDEO_M2M_CAP) {
-		/* Downscaling only  */
-		pix->width = min(pix->width, ctx->queues.out.format.width);
-		pix->height = min(pix->height, ctx->queues.out.format.height);
+		/* Downscaling one-sixteenth only  */
+		pix->width = CLAMP_DOWNSCALE_16(pix->width, ctx->queues.out.format.width);
+		pix->height = CLAMP_DOWNSCALE_16(pix->height, ctx->queues.out.format.height);
 	}
 
 	return mxc_isi_format_try(ctx->m2m->pipe, pix, type);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..c3ffc8a38d1269c0a4e6493b4d75690f01cc87bb 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -647,10 +647,8 @@ static int mxc_isi_pipe_set_selection(struct v4l2_subdev *sd,
 
 		sel->r.left = 0;
 		sel->r.top = 0;
-		sel->r.width = clamp(sel->r.width, MXC_ISI_MIN_WIDTH,
-				     format->width);
-		sel->r.height = clamp(sel->r.height, MXC_ISI_MIN_HEIGHT,
-				      format->height);
+		sel->r.width = CLAMP_DOWNSCALE_16(sel->r.width, format->width);
+		sel->r.height = CLAMP_DOWNSCALE_16(sel->r.height, format->height);
 
 		rect = mxc_isi_pipe_get_pad_compose(pipe, state,
 						    MXC_ISI_PIPE_PAD_SINK);

---
base-commit: eb4ee870747c3a77a9c3c84d84efb64bd481013a
change-id: 20260122-isi-74f87fbb9a6f

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


