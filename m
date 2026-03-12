Return-Path: <linux-media+bounces-55460-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPhaNEYvsmmzJQAAu9opvQ
	(envelope-from <linux-media+bounces-55460-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:13:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532E26CB02
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 04:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D325B31AF3C9
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 03:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249A5386C10;
	Thu, 12 Mar 2026 03:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YJVdqDz6"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42BC383C75;
	Thu, 12 Mar 2026 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285043; cv=fail; b=Qb2ZkABn3uysnw4ZsH9WhGc3w3md0AOVonL9kjc5Jw3jA9hEqvv2BkH4mZggYL3pAeXOzwJeI2RZ2M1K1GIxaVBTB/UK0WHe+HpvPd8vIIviq8aZJD+G50DpgDmgdxO9cAxwbz3hb+UF/S8UVbjcwC+xmAG57hDdVfe73v3IF1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285043; c=relaxed/simple;
	bh=r3GG/uEHoENedJ0g5zMwMzONpx7LP/XyIqQSeHxnCRU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=hqNk5heiyCaKRKYaSTiI1Nt3BYKg8W0axL1m7Gj7Aplf2f2++gXZ3jCiI4xfuAdm9uisRfPD8H2rLeC4dd5MKq1HkFayz+WXWhLm4EHfDhd0CcIfg04ONyDfx7yOe5lvoAsUunRSf1rBOFA0lAT3tpAvsvBIaehjG/eZtYeRkQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YJVdqDz6; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNoqMcY1lyHo0vOnjCU9RU/Yd0DqdKPK+/Qe3hK+MQl6WDTU58QGLjyw/ZcJDzaQO/kV2BRa1WrGtmtON6lmNuP8Zu77e7Od5zViFgBOsow6J9wRi+r+unvUWv3OgZ1J2ZFOfcCL9ZZJNA1wditDczWDjN77OfmLODlw7kxuw9/ceT8NtOYt3nbSQUd0vGaFkrKnRAniPNbokrw3ZGQkA+427oA8bJIj8TmFPNNybgbjzjfNQBzwmaG/MHe7ZIsZYtvNC1fxE8j7P9RY4e0qTC5vtWZuhBylHQcgBhMZQHH0ASeNpHgImkPtsu01zrIoXE/dNt9YWhyIx0BgajAPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZ7NSpD2qJ0pndiK0rJ+ajfAaEvvxvPyVX4xQv6WneA=;
 b=hjG9q0FSKWed53e8Hg5Jgo894O5X4fKsgu92nR6cV6irIGv0JJIsLcGOBjJnU0Zw07M3mTTrPjqSKibu43/8s+w1f4UD7/L1D4uqXAeQxNCMhmZOYypfSEcFdKCIZCowF6yKquJSUpHWn9WD/hZBY8QiCyQce2srDkQou3qihdCPg3wg7pCmfdER8DOf9EPxX8r8kY54wBnGZL5hiyS6nLyYRUQVUdHoaBVTtayhHvWHCzKcMbvf4F5HvGMxKATxcoE8zkLffA8vUifu1Fh4TzQzLiY+pgorlEpsAOOjvXntGSDn10rjS64XS2/rqClbZg6Yo0kciD8AZyUJKh2jig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZ7NSpD2qJ0pndiK0rJ+ajfAaEvvxvPyVX4xQv6WneA=;
 b=YJVdqDz62OZpJVtFCWXjQEfPWk8KmoT+YTeEBKKsc2yt2qEpB8v3q2VKfDEgqcRJVOROqYwClLqifZg3xtjHTxEOyY8bSxoEG1kCwugUOCSF2StDBgCZIx08lviBhmHEkc5aAtKPdd4dN5DQgUDnaCDnni5NhcWzKEA6X+rtMsrIvjxvYL8O2o8HD6BTQGy3QrklYne45bbw8mGv4+1wwqBkSxzrde0jn+xnMXo2PO+c8KR3q2q4QzdXTAdd97wRBaeVMFRvq37lB6atE0wlZeyg2WUb+Ndj7yx68BAyqvbQfc00C05Ws8OJkamfL0/Sntxf1er9ofaz5AV32+8EQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by FRZPR04MB12395.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 03:10:36 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Thu, 12 Mar 2026
 03:10:36 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v2 0/2] media: nxp: imx8-isi: Fix single frame capture and
 optimize buffer usage
Date: Thu, 12 Mar 2026 11:12:33 +0800
Message-Id: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACEvsmkC/2WNwQqDMBBEf0X23JRkDaHpqf9RRDSudQ9GSdpgk
 fx7U6GnHt8w82aHSIEpwrXaIVDiyIsvgKcK3NT5BwkeCgNKNLJWUpRGO7Nv+9c4UohC99rKTqF
 GrKGs1kAjb4fx3hSeOD6X8D4OkvqmP5f6cyUlpHAWrR0MXToyN7+tZ7fM0OScP1RlI7KsAAAA
X-Change-ID: 20260310-isi_min_buffers-4b490a124223
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773285164; l=1300;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=r3GG/uEHoENedJ0g5zMwMzONpx7LP/XyIqQSeHxnCRU=;
 b=FaqIqlUl4RJSMCL7J0GwTwhcjQ9XHeDe94sAVsJpJQgvhu4eec2jzkHIiWLaETvRGiyN4595r
 00rfHjanz1mCE4mt5hOL6m7a9T8klftLoSXOVII1FAkBeuzPxFAAIwx
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0231.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::7) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|FRZPR04MB12395:EE_
X-MS-Office365-Filtering-Correlation-Id: 7565a37c-8781-4962-bee5-08de7fe4ee7b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 u4sfyzo09ByFjRGVcsXkfBWXXhRVmuFDQm9NFw5eHStPSX9BTfVIUSfgMvvdabdB5JoDLO9MLDrs76NQnjoWCKcatN5m+4tctbY1Bd5H3/Yah0jKKjVNUqlzVJu5EESD1PS2p44F3akBcdLA8kv/4sIiNXqPr8fYA4ytjDZqxeMzV6jikNN4Ona7XSNNe56XCGf5PLW5c/2VpqNbzdL3PS0afI8erFHaLcMywCukp93K+bmGJ+wXRELKY3l+j1zqGXKebWcRJ5cGcLwfRdMGzLczCFG8yx9/RD6axJkLvMddpXDo9O8jVp934ss7fBSD0kjA8bA3f3phswzE5/AARnb4DA6p3I4M+VoT/ClYSwffdBwSWwuF47JjyBIKfPFu/PHnIBPPZVxcRhqR7QXtA9Xdj7Qv2CXXpjzMODNsqEkzTcpDVPRUF4S8mNguoK7fZGu88TT3H9jpBV6hDPG7qCVNNmFKuMoWXapBg313qrRWqwawQf2ilBaYR04hxcUYjS1U/RfD2Lv0OHiINb/vnlxJvbAgodboIwAaBd5FJ1Yk2/hAylsc7pVlhiOi+IZIXNNwPpHO0wmjBZpL6t0bgSAdsPWaAy1FYSmZ0evZ95+Ug+wsedDI20JItvWS64ql/YID9bkjAgDdwkFbugAAJKoh9DQUrYhB3o1ISLe3LRpZJZyrdrXV+GJuiFXnK+SrMlQTtbJAopk487aKHekQ4G/CezjdH08vHTbz7uoAe1Z2C65hLL9ZayJQ13C5w4qvFTRWZk7k71sEEDf8m4aQQi0BdeN6xwVgBtMQfqi6BJs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cFk4RTNZbjdRSDhWdENUU2ZmUDdmY2F6SkRYNHEvMDdSbS90d0E5Y2VqbXE2?=
 =?utf-8?B?RGROY0NmeE4zOC82OHJaQ002ZndjcVNtaDZmQmNEREk5NWpkQisvWWo1eE1S?=
 =?utf-8?B?OEtoWkVCdjZuTmZUa25ITENWeXRyZWdZdFRIblQ3OUhWdmJPbHAydUJlYW40?=
 =?utf-8?B?NUZZZnRwR3VnTFpTUkVxN21NdEFkRENENkVCN0VQdzEyYTlkem5vVDhHYk1S?=
 =?utf-8?B?Qmw4L0VLcThNZFdvZkFtMDM2dXY3RmoycXJob0F5TWxjK0QrdHhHYlFMNWhp?=
 =?utf-8?B?bEQ3VUlJQ2hlS1hMZ0ZGSE01dVBsOUFDc05tYksxemRkRTRBZTMrN1UzZzln?=
 =?utf-8?B?STVHcHpPbzNQeDQ5VzlZRExsckxUOTdqc2FnemJQNGZtWFZpRVBIZXAxQ3pm?=
 =?utf-8?B?QkVhREczWE5DTDhxYkcrZTl5MVVwQ3pvWWVFVWZUU3RmUVgxWHpjRzhncnVQ?=
 =?utf-8?B?Q09LQk5pLzdTSG9aTmZ4YzBEZEtQcXJGeUdhL1l4ODNpRlR6cmo1SkNrSUNh?=
 =?utf-8?B?OHR6UjA1ZVkzT0h6YVFzODdZcC9aTklpODFVeTRRRENSLzdOQnpqa1BKOWxk?=
 =?utf-8?B?bFZJWVkweWNhQUNKcXYxSmdiUE9XcEVNdHUzeFJ6d0s1OEVTdFpwMFZZNDFU?=
 =?utf-8?B?ZENvUWFWcnA0R094eE9nTHM5LzVsdkNxanBEb2x3c2NIRGpkZVRaOUxVNE9M?=
 =?utf-8?B?YWNRQThhWW4zY2xscU9Xc2lvY0xBRnpKZVBEUGRCSjRwOE5rR1ZaTm5WSTIx?=
 =?utf-8?B?MFFWMXRwZjRmSzFnMHZSMU52b3hVOTBiOTFJOENnVzdEYWpIZjRFWENFOVFP?=
 =?utf-8?B?SnJ5OXcySXJPY2tkM1RXUHV6K2lVYitCaWFzTGJESmVQbExobGpWNldTZEZk?=
 =?utf-8?B?NFVuZlJyNFVGRXdvNWxGb1ltTlA4bkxZd0Rta2tJTE01ZlcyWlN2dzhObDd2?=
 =?utf-8?B?U0UvU3dQTUppYWkxZ2d6NUI1S3IxTGxoZlkycytwc2wwYS9WT3M5MHdrMzNZ?=
 =?utf-8?B?K0J6NHNpUUpJdzN1cUtUWmtCQVdqTVZDZy9VNWNWa2E2NEgrc1JwZ3Z6MDQv?=
 =?utf-8?B?WXAyVjZUN01McHFZeVdKSVliR3luZGhPZG1qWndabkxIanJIMkh6Ui9CenpQ?=
 =?utf-8?B?bjdWTjBFdkFQSTJxY284eDJUeEo4aUJDMDlPdk5zbWVsRFMrQldOME9mTDFL?=
 =?utf-8?B?aG9tbVFNQk1sMjFKWmpId3FZejN0K05vSnp1VlRBT3pJQkUzODFNOERLZW9r?=
 =?utf-8?B?ZzdZL21TSEdpSWNlci9pb1dHaW14UDVEOTg2OVpObXFuek5IVERjOVZiUjhi?=
 =?utf-8?B?NTRGVkFuTTR5RE1hOHFwbkljcDhndkZMdmwvL1JFNVh6NkhTd3BNSWZSZzVw?=
 =?utf-8?B?R3FDYmEzMzBLWnZNbzlMeDBVK3BCZ3JFSmtWdnZrb3ZNbmRpQ01yd0hDQnRK?=
 =?utf-8?B?V1owQ0Y0azlMQ25QazlsWm5odHl2aHpnQ3lWbnNPMTdjbXJFL0lXcjdoZUVu?=
 =?utf-8?B?SGt1QzZLRzhrZzE1S0VOREh0ZEdUU09iL1RRRkxTRjRneWZZWTFyUVJyUlJF?=
 =?utf-8?B?L2E1OXcxRTdNMTNRNTM0ak5Fcno5cWlEdEhTeFFIZ3AxVGl6VjN0UVNURVpZ?=
 =?utf-8?B?UnZ1SUhSZVdXNllWcFJLMzlTOWF3cUNrc0RKMDVBVG01Ylk1SFRwNElLU1pH?=
 =?utf-8?B?L0M2Q2tKY1d5YlhwMHYwUmdqSHBtbEROOU8zUkVpYW5Oa280U1JnV0g5ZDlR?=
 =?utf-8?B?Y2RkOEhuRVRxTWw3eHFJL2FnTUh0ZXZXdGtZVk5NQ3UrK1dseUR6dXNHMWsv?=
 =?utf-8?B?L1F4NDl3Wmc5MGp2eFJJdnVQalRla2FHWEVyMTBGWlhIU2J4RmkrTHdtOHpp?=
 =?utf-8?B?bEZMMzVCQkp0YnowMUJSeS9TTEpPaHJXWmN1NmNSMEVCdWt4c3VCVW9pcU94?=
 =?utf-8?B?QjRwc0NpdU00SzU0enBpeDdZRlBvU0xVZkJoU01LMHFIS2ZtOXArOEtXVjJo?=
 =?utf-8?B?M1U0WFREMUd2ckVQd2pNOFg2Q2FscGF5Y05kU0xtSWt2RHZSeWxRMGRKT1Vv?=
 =?utf-8?B?ZVdzL1E1WmxQdjF5QVI4M1BHcWlFSW4zVUVZdjNXbEdBZ2lNeHd6OGpGZTNH?=
 =?utf-8?B?TXVhSGthbjBZOXVGcngrYW5UaXBLZkpxMEorZXpKTWF4QXJidmo1ekdnR3lX?=
 =?utf-8?B?UjhScWRpeGl5S3QyU05EOVpwUmRvOHVsNHFORjN4ZDlDbkNsNkFWeURUbVlL?=
 =?utf-8?B?YllsT0NsM3J2OEhnc2EvUkgxTFBHMzFkSlE2eE5NTDlVRHg2NVY1Q3dPTXIx?=
 =?utf-8?B?MUsxb0RaaitONlVub1BTaTJtajQ0bVVvQTdxMUtLUWVUaFBVTUprZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7565a37c-8781-4962-bee5-08de7fe4ee7b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:10:36.5312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlbvO34gYzICHpdbX3qSgSCfUL2jz69dZ8K6HZIMMEjqi7YvHm4TiF3MddguTAu8+an62JpXtuHhWVMSscUPYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12395
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55460-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 3532E26CB02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series fixes a hang issue when capturing single frames and improves
buffer utilization by prioritizing user buffers over discard buffers.

Patch 1 reduces min_queued_buffers to allow streaming with a single buffer,
fixing hangs in applications like libcamera's cam tool.

Patch 2 changes the buffer selection logic to use pending user buffers first,
minimizing unnecessary frame drops at stream start.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Add fix tag
- Replace "This ensures" with "ensure"
- Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
- Put example from commit message to comment in driver suggested by Frank
- Detailed changes can be found in each patch's changelog
- Link to v1: https://lore.kernel.org/r/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com

---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
      media: nxp: imx8-isi: Prioritize pending buffers over discard buffers

 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260310-isi_min_buffers-4b490a124223

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


