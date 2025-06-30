Return-Path: <linux-media+bounces-36355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07CAEEA33
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4AF42207E
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D29A2918E9;
	Mon, 30 Jun 2025 22:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l+Mj+TCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A612459E0;
	Mon, 30 Jun 2025 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322512; cv=fail; b=AN392IMlNYk2Z2RdXUgPur5p/ceyiusmiUrdiWs6d6i5WBcvLwzjS3AK7qN0VQHLmnWU2l6Dnfs+JGlTY8nDbOo7B0a37HABFq013/QbiEhjzhESBHi9dyKgGGHxFO2uk7JzjimUeAks4zT9OkHGul8WVaWVHcULZgrmSXZneBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322512; c=relaxed/simple;
	bh=6TOA/wHXt1YfJWAK8T4oB/2fh5sdNScUHhHSZPdCU4Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jSnLXj8PAPQBHNK/U42AXNnxv7KVH0jeW23/xaYMRqn4G6NcTqAZuEYkYbeINmJWu3xXxrTZtMoALyT+ajIRgylmpzHJESSOF4J3AVeVP/5L/TnT81MiQuMJUQ3R8T6k5cory7KUohDWtIHPhORqnm4IenZzoancGUg0DUCkvaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l+Mj+TCQ; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et5J7AYjhNSOy0EnTDqhzDPAlu3YFa2v6rJsmp851afwtaxK/6B5ltP/XSfmNlrM0jjXa4CnRiXFVVBc4GWm0aigs26E7fOxtYthRqXzZ+W0ZNWOJebnhRd8VqKgIYFO5o6aoNwS8+JbahcaxBoy/OveRAakCfdpj7loefIFVdz/GeWlGYWh++wlM2QbHODZeTfTFueEC96Hv0090sXeMXE+EljrtyvTNU6OgDo5ZfBsv96vdyPMFOcpIhlxC2rHRkQ61sJFH7tMPcXhEgb7isk8INjkG6YTxAvvQOsQt+L9OH0YeJVxUDApMWF6fZ4auNREgUz2KXLjF0aj3u1iPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzb9h0I+9YnHrazmgeuAdMquBrkJOzZ0q+4Yf8X21Ms=;
 b=bBg/k3CX+D2w9Lw738iycjGQ3Ze470tNADuUR7CnQDYsdS9BTAdz0pLcNWvJE/3/VJC3VU0dMaJxt2+56ygcYx9Heol7OzoyimPewxQO8VBUmdCeNp8JaLxuClIEvHveKgGaWiMxjvPf+ZT6+2U3mDaagGLuWGUT5GdiumH9auTc0v3UNReoWjyghwCLPV0n7itgO0DGMyl2O7u6nRT9CrVs3TUzNpHVIr9ZivM3+6xPl79B2/OpmIFWb2zuEygoiBzoQFnACASl/c7VWfD92xcam7AMmY9TG/ljHiGKypXikCQMz4D1OUrgT39QY0pyrg7+59UDZ3z1mkXNzfOBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzb9h0I+9YnHrazmgeuAdMquBrkJOzZ0q+4Yf8X21Ms=;
 b=l+Mj+TCQBmdalplZFi8aQQvYx3i+8a33qkgQHFhXmI/zBhwalaMji2CfBshHg05AJoUcinKotzxJRcTj3phOivr1VWAbbuyxX3jiuLeLiYAayyf4758OEcZE6J3E3BeHuDvuIW1F54ON/M+kHjVqM2CfaL4e+EAQD4ylSzjiUpzx/Fuy9ORSteTGSQm5vKqc7cltXRyK+KWQxqplZlV+4BpZEHUKIrCyjq686YoX7GAdLEPgjZm3+qdaSPxFRvoPHNMGlu6WtkpRe69eszvTnVOTJw5M8YvmCkmg8sTm7GLKVntWBCB9o8BlFayutjVbqCEsvuwqsGriRhXvCglyrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 22:28:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 22:28:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 30 Jun 2025 18:28:17 -0400
Subject: [PATCH 1/5] media: nxp: isi: add support for UYVY8_2X8 and
 YUYV8_2X8 bus codes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-imx8qxp_pcam-v1-1-eccd38d99201@nxp.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
In-Reply-To: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751322499; l=1302;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Clpptg04Qxx21j13dlBxRzB0tg8OFwpkwtihdS3bt0g=;
 b=LzLoaGoFaL2AmVg7wvymEoTR+ZcgrvzEgiPUTmp8FFkrcfOwX7xA3SQwvjPe1KRtDgEslRd5b
 ezfejq385vNDzNxsXXrRQRbL5w3HZu9VzdBzSZR7VKCld5xfLQ1dxJm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 57300f45-5a97-4a9d-c680-08ddb8256e80
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VHFoOFBYU2JTSElZNEpOZVFpNC9sWDhmWDJMaldlMGloMHpZT2dvS1k4UTI0?=
 =?utf-8?B?dmovMEt6TWhKd0cwUEhUR0t4NzdpTjc2enBVdEkzcGJTMXN0cnRldGkwK3Nr?=
 =?utf-8?B?aGZiaDRmTnM1V29Oc2gxUGpwVjBjdUFqQ3dqQWsvNEk1NE1teXNjdWhmRmlo?=
 =?utf-8?B?TjR5bmQrcUdGMnBnZHAzMm9vOU93QjBvaSt5TXdBQXg0YjlZZWFtYWNGWXV4?=
 =?utf-8?B?c1h4ZWdEbDNTbWpETFRpbEpiYnRmSkNmQkhxczlSL0FoWElLQzd0cDlFZks2?=
 =?utf-8?B?YmMzRlR4YU54UG9xc0xHcTdKWG9jVmVsaUM0R24vdHJlelF0R2E5WlVTb0tL?=
 =?utf-8?B?TSs5NEN5MzF1ekpEWFlvQ3V1SkJFTGRwQkpna1U3RkUwMmE3VzFWU2EwTFVL?=
 =?utf-8?B?QU9XQkhLTnJ3ZEkveTRlV3c1S1lYQ3ExRU9KMlUyUTk2YjdnTlVPSzJFczdr?=
 =?utf-8?B?UmVvSzBjQXRhNjJNR1liUUZHaVVOZGRrMHNOdkNCRjRqdW05ZVhCUjJSZURB?=
 =?utf-8?B?QWRKeG9xMktkdFprYVVaZzh2VTZOdnhhUWx2d2ZWQUlwbE1ZK3NVUC9jUExP?=
 =?utf-8?B?MnR0VFZmMXU5RWFHenRzdHJ4QUtxTzNNcFppL043MWlzK1dIY0tMWnNBU1Mv?=
 =?utf-8?B?dyttdWttR2oyUTc2T1EyblpmaENscmc2aEplUGtOMlJsd2xGd1B5R3VqY3V6?=
 =?utf-8?B?R2NpSENQYm8yM2NJY1lBdUFxVTE0ZXNCYkpjUVovdnpVNzRZOTlUZ09Oek9W?=
 =?utf-8?B?WmxYdDNUaHJHcUd3UFZsS3J1RDJxRTEwdUVZS3Y0eTZlcGg5K2JmU3IrSEVr?=
 =?utf-8?B?Sk9GMS9EdVp3cjNaNTVWRlg5RE9FWjJzTWRhK3dYbDNUQ3NLcC9VcnRYU2tU?=
 =?utf-8?B?NHRKTmVVME5OS2tFQU5GZ3ZFclJrd2ZNb3RETkNnUC9ucGFvSWtpaHIwMjJw?=
 =?utf-8?B?Slc0Vi9taWZaY0swSUU3MGMyNUpraDRPZ2d5WnI3WVNsMitwRmx4c2g5UkY2?=
 =?utf-8?B?alJxZi9EMHVxeGttSVNkbzBWSzc2M29UV240NDkzMzhpNzU2SVdRUHhFNXNK?=
 =?utf-8?B?MGVHRDVNa1YreGRyWkN4Umd5bnBucXNDMmY3WUlGRnVsOU9NQ0ZmSGxuZ0RT?=
 =?utf-8?B?NE9vakdidGZpbmtBb1ZvU2VpSmpCUXp2RmphdlZiWFFqMHFCMUZUbTJ1RjhU?=
 =?utf-8?B?MnQ0VGh5OGEvYmxHdXAwdEFKSVVOMlJjdXA1ZExLV0Z1SHBFblRyVXJ4MWs4?=
 =?utf-8?B?UHQ5cjA3azAyc1hETUM3Zy9XSTFLVVNWRVhyZkt0T0trTnk0dStuYk5xTmw3?=
 =?utf-8?B?dFpiWGcyTTFOcFp0MUJSTFpLb1p3VzV6R1dUeEtBMysvamdQUkwxSE1XTnVa?=
 =?utf-8?B?bEZkSzZ6MitKeDNmOGphaHFudVhobFRCejhOTXBPMjhEOVFhWUhoSDRwU0x4?=
 =?utf-8?B?MGxEVkhhQmRTeHp4T1FydXU0ZmR3U1k3bngxMWJlUVJaSW1jN1JkejF3Z29t?=
 =?utf-8?B?R3dtZmVCOTdKVms2N0xiQk9MZkpvcjhMN0IyVzBpazdISVYxeXFEay9NcnhC?=
 =?utf-8?B?ZFAwTHB6eFdwNmV0Y2lmc3BBeFdmb1dlSGZCLzA2RTVyY2NBeWg5UG16alVv?=
 =?utf-8?B?L0d2ekJFRkJ3SVVDZzZ6MkZtV0xMVndyTjNkL3g0cjFpd09PZHNhS1duU3Zr?=
 =?utf-8?B?aW91MWVmNjg5d1lLZTR6S2xGQzltbEZSY1EwMGp3SW03SExQcjdBNlB4ZjJU?=
 =?utf-8?B?U3lROXlJdnE3aDVxdkR4L1ZYdzRQcEdUMEN5VDArSGZYdVdWcU10OU5zNUVN?=
 =?utf-8?B?eHFJU2p1SXlIK0phM2lYdDB1L3ZpQTNpdUMzUW42Ti9aMGFrWWtoSWZMMWNJ?=
 =?utf-8?B?cDI0WmdzVERpd2NORENSM1FDcUVGT2VKdXpXS0k5aVRpUkJIZm1mQUtPcS84?=
 =?utf-8?B?dnl6QVdBY083azBWOGoyMjZpZWFwUHAxM1R6UTJxeXpnK1BLZkJZc3N4ZHRC?=
 =?utf-8?Q?lqVffjnG2mIV1BI3hxoMkXB0lEOYUo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ajd2MzBSbWJpblludS9tOXdsTFBoNDhoeDZvV29SWEtoWEROL3A0ZFc5TlF2?=
 =?utf-8?B?cGdWWmw1OXF3YVBIYnFPTGd3b0NrdWpHQU9IUE9yelVXd3JEdHFrcVhHd3pI?=
 =?utf-8?B?dFQzQTY1WkwzeHptN1pFMmEraDh5VGJmZkl4cnVWU2E0TitHSWZ2aTJNckIr?=
 =?utf-8?B?ck1idEV5TXoyL0hCOFJaTUMvM0JxanhqYi92N1FLZEpEdWQwZ3d4SUFRQy9x?=
 =?utf-8?B?SndJanNEanZxWVZ5TWNSN0YyRWZlTXJLdEIrWkkzdGc0YVR4ak5OZVdKL2hT?=
 =?utf-8?B?U1l5TlVQTFgvc1BNdldYdVJndE1YOUZqMXdWUUFDS0Q5L2djMzM5djZyVmRa?=
 =?utf-8?B?ZHpwS3lpdGJ4NFpjdE9zRFp4ejlhRWI4czh4VXpCWkoxbU5IM1JTdlFnWmNt?=
 =?utf-8?B?TWYyWWkxMU5JblBEQVBRRTA3WUo1eUx2UzdhSVRUWEk1bldXUkJja3dLOG9j?=
 =?utf-8?B?amRhazhXUUl4SzhRWVVHdDBWVnVHNXluVUUvZFlSZVN1bjBjeTBPc3ZmMVNX?=
 =?utf-8?B?T3VRclBKejd6SFdtRmdJeW5Pdk50VFNVT2Z5UVJmc2pQVWRpNjVHWlkvV3lW?=
 =?utf-8?B?SjQ2OUtZQVRpRm0zbzRyS1FzSVdwZjRBaTI4dXpBWDlBckRSVDVyOTVoTVE5?=
 =?utf-8?B?aU5pZ1JOTHVqVzN4Q0Vic1M2NGFRc2dYcE9CejlUdUtiMHhFWjlOcUJqVWlT?=
 =?utf-8?B?dXArRG9HTU0wa3l3K2hhazJXZWFPa1BrNnZqb1pBVlBUYTlkMzcvRWVQTENP?=
 =?utf-8?B?cmRUV0tuWlZwb0NBNWZuRnFCbWMyOFBiYWRiTDdPcHo2RmtSUVYyNkFQRUJL?=
 =?utf-8?B?UXFHbUd3NXhqOHZlbC9pdUsrSGgwVWJvM3JsRHVEMVZWMzd5YlFrY3hCYnV3?=
 =?utf-8?B?TGdyWTk1by9IQ3V1eTQ1SkdyY1JIRVRaUG5JSzdJc2JXeGs1NVc3WllIdDNZ?=
 =?utf-8?B?ZitUeDBqOThsSnRER3VvNmp6UGRobktrVjM5MitzcjlYMExqTnk3SFlHZWJz?=
 =?utf-8?B?bjNUaXhSRXcyMGQ4eUdRNkpTVWM5bVN5ZHV3YnlMNGlwWlNpMGVOUmpoOFpa?=
 =?utf-8?B?eTNKai9KaWxIeGNsWWVtc0dQSVhPMExXOFdWR3RmVXdUeEdxQm1SQ3FZVGRw?=
 =?utf-8?B?YXhKbEpGb1BNbWpUbUV5b3o2OGhZNTRYby9tQ05qdXQ5NjZ0TlMxTnpEeGNq?=
 =?utf-8?B?RkJyVGUvWjF3RWNWY0ttL1BMOStlTDR5bjF4dFlubHp0RXdxbU15Q0JBdU82?=
 =?utf-8?B?MFVMQjVleHpOSHlja1BSZDFPY0JGdkw5MnJSWkhFUG91QVNvNlI5aDM1eDFL?=
 =?utf-8?B?M2VjMFEvU3JndWMzSnVDMXY5cEZNWXpNaHRTRmVRRWlKRFo5dGR2elAzWGZV?=
 =?utf-8?B?d0NHc3RrNkdtQXVxVjRsU2p3dmN1TVAzTUlBQ1JlbVhkQWNOK2xsaGtWUUFU?=
 =?utf-8?B?bTNjUHBYOVVUR2NCc29JemEwWHdCMmxHRUdmZ1FFem5td2MrQnAxK2hlK2dt?=
 =?utf-8?B?b1BpL0FDWHBiUXkycGFiZ3NLeCtHTytEaGF4c0VUL2thRUF6Q1RYSGNZS2t2?=
 =?utf-8?B?OWtEaEQvODVCY3dWakhoeUJ4ZGNvVDcwRFRvZDU0eGF5VEFUUk96Z2J1eU9F?=
 =?utf-8?B?VDhVRnJVVlMrTHlZQ2VzUGRubEJ4dmM3cU82RGFZVXZtVndVcCtVU05LVkFX?=
 =?utf-8?B?RkZvSVhjajJKeXZldk1QK3lUeFM2Y045akpLSHBFekpkWWltTC9XZGROek1r?=
 =?utf-8?B?enNrTExJWVZ2RzJVSm1kQnJRK1JoVWtmQnlvQ0NhQ2s2bGkxWXZCQ3IrYWVa?=
 =?utf-8?B?eWpDSzNGMDBndVZNdnUxcDUvS1VYZ3Z4cVlyTzFVTDVQUGIyVmJuT2JPeTNJ?=
 =?utf-8?B?ZkdDRXFmQWFQbFNoNEpGOFVVOEN1enUzNGFVekRRWHFWVWlFRk9qcmNJMGJV?=
 =?utf-8?B?SEJYdk5VOUx3Yng5aGJEQzhLazM4a2l0Nll4eklkZUdIV2owTDlVdmRUMzd1?=
 =?utf-8?B?THY4a3lMZWlaaHJ1N09BT2dDS2lNU25neXF0YlJ5OUk4bU5ld0RmU21hUzlr?=
 =?utf-8?B?ZzIrZjNBaEIya2QrWTlDbDZrTVYyNWdtNjdvYWNmNXREUWNOa2dpZ2haaVdx?=
 =?utf-8?Q?GynaCEOhr+6wMamkWoXAN386N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57300f45-5a97-4a9d-c680-08ddb8256e80
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:26.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W88MVDtbjHllPifvMyxsCpRn/C6AT50a4De9nqaMzaKMK4j532h5cgmw/m+X/W1CFWy0Tlty/YkEq6pCw2l5gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

From: Alice Yuan <alice.yuan@nxp.com>

Add support for media bus codes UYVY8_2X8 and YUYV8_2X8 in the ISI pipe.
These formats are commonly used by sensors like ov5640, which typically
uses MEDIA_BUS_FMT_YUYV8_2X8.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index d76eb58deb096..1a4bf1ac02641 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -39,6 +39,16 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.output		= MEDIA_BUS_FMT_YUV8_1X24,
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
 		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_UYVY8_2X8,
+		.output		= MEDIA_BUS_FMT_YUV8_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
+		.encoding	= MXC_ISI_ENC_YUV,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
+		.output		= MEDIA_BUS_FMT_YUV8_1X24,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK),
+		.encoding	= MXC_ISI_ENC_YUV,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YUV8_1X24,
 		.output		= MEDIA_BUS_FMT_YUV8_1X24,

-- 
2.34.1


