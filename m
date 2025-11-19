Return-Path: <linux-media+bounces-47417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D36CC7128A
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 22:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A81474E2392
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 21:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3030594E;
	Wed, 19 Nov 2025 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZtBY8tv9"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013056.outbound.protection.outlook.com [40.107.159.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C58C3009D5;
	Wed, 19 Nov 2025 21:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763588083; cv=fail; b=Rwx0/L01mqduYXbVw4Ild7+F11FB9N1CKRyB118ISeH8A9V3Q+yNYdX8Z+rXouplN2LIKgr/h/NvH185HI4HRV0dnAJ6IrbZHWoZsvGMF4UET9ouBqT8o9Fc/ew7oE/Yk/Vx49O8E8chnB2EBqasnTjqCvZuv2mr8y1d6SoLxIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763588083; c=relaxed/simple;
	bh=9ScWw3wPx0c/tMuuamDJQxBF5V7mUob/YLZDUKM3HDM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=gjeKZCq1OlFfRlBWM5miHm5Jyxyp9a4lcqsIioTHEIWt71HYjYgqScMCgGQDMbOlTTHvyrq6NsewTEY/hQcxDzhRukgJILn+FeugqMQbDRerV4HzTrC4y8B4+qAVPvO5sKLqYFquew3AYlbrXePYXmZV5+4tfpEIvpi4jtEI7ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZtBY8tv9; arc=fail smtp.client-ip=40.107.159.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgScJ9yZcXOHnG3IIgTTpyBvPna7naDdsDZs5IhqF5Q5AaKhoOJGHiaFyvEJBpJ0uaBOKMrTIR6h5+i7NDrMOIz2B0PXA+j5l7ggNuZ7kP1JFj6U/SQx13rxo4+36Fg/ZCFAPyhTmEVQXxNE6iHnughkfyIGafZ0d5xTnFghnb1SPtQjYNut27FsH/VVAtR4OvgaYOrwDpxdpQr3bAlGs5svNdWOKVbqCYT4vq64V/sIEwgvbqIGa9XmbxZ2afWpYyk7GD+PvJlt1KMVwStL/mYU5M99J/xiNw6rgZTf2YYJv9HByhaFgBJ2bCrO2jz7V5Jo6x840VK1+ATtCQAGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejKDWecxH74vD0Gi6BdFZYEqphX+3qJp9GqAf4+4kng=;
 b=esWQMiT8Fdhhj6U8cCShsVzPFBX5BjgFsFQT1ULjEcJHXq9JhU/hyRmrKCY144R0ykLWWBrWhC7caXwC+FnuM9P15cUEoO+ZplB1wmd5k9aXBOiWIcg8eNpiEibhzoONTDgPNJCBJdImjo62dU0EqAgGBM+SE2mKYJI2eYSD65qGh57fwsyhqSGGKiWhFJ9UzBjGENf+S8zApsD8SwWNF9g/XykVO+n5XskR18cm3tfilOqFoIfPFU9m9gDKsB5MMHA2WMBCuKxIgeESKNMyATJuwfpYPi0dN5+W3m2+9R/GfbX5E6wmO3zYgwBNTApVINoCkHIyvqlaMwVVQ9rkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejKDWecxH74vD0Gi6BdFZYEqphX+3qJp9GqAf4+4kng=;
 b=ZtBY8tv9pTclClwjV47Mk2dNLzpNKQb8n6/kjNegb/mrnVV7Duc3AKNwPnXb56+BHFiZmPw9fv9JRgD8oAeO8/fP1VdwkMBgc306aeKPE2FkwN0x7z4b6+m4PpSYS9yZZG6bcaV3ZONpNL47sveXzvGscc9XJ8hD4ZSIvFAp5ainYhpX68af4vdhEBdzAlhNfKWuIdPLAmK+XLi68YWQc1BkDs5bbRGPuIuDV4WRiRX696o9s3QjXXkPhp/Xsz/w5Wa7zqnhpx0Kg5P0ML3KR1PYnmY7G60lZP9bARH5ghqsQlro8aCSC5phfmTceI2DVQKrZSkWCxh/yRE9o1nmPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8433.eurprd04.prod.outlook.com (2603:10a6:20b:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 21:34:38 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:34:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 0/5] media: platform: nxp: Trivial cleanup pathces
Date: Wed, 19 Nov 2025 16:34:23 -0500
Message-Id: <20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN83HmkC/1XMSw7CIBSF4a00dywGUEvryH2YxvDS3sQCASU1D
 XsXmTn8T3K+DZKNaBOcuw2izZjQuxp814GepXtYgqY2cMpPdKCCaLnc9NNK9w5E9WakSo5G6gP
 UR4j2jmvTrlPtGdPLx0/DM/utzWGM/TuZEUp6bY58ENwoMV7cGvbaLzCVUr6SjwwxpAAAAA==
X-Change-ID: 20250807-cam_cleanup-b6d90ba9dac3
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763588074; l=1327;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=9ScWw3wPx0c/tMuuamDJQxBF5V7mUob/YLZDUKM3HDM=;
 b=6mNFXaoooZ3WdxQWVt3H8YiyI09qbLx/o/wOQpmQhL7UrDsRLQWkEqJgb8w0nPOVYetYUvhcO
 TnVTaShrNO5CMzIuQAfEkQS16lf5MJhyOjhyREB8LxOUekA8L50SMz9
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::12) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: b55fb4ca-72e1-4fe3-1a37-08de27b370cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OEIvdlI2V2o0VlJEVXFvSVUwanAyTHVNckU5c3FTbnNFOG9vdVAzYnVkTWZB?=
 =?utf-8?B?VG5maDJPU1ZMK1ZVNHNqSnhGVERsZEV4aUFoMVJiSi8zUzJyUUwxWDdUWkJi?=
 =?utf-8?B?OGUyRGlnZnk1cjRuZUdPWGJaSCt5Q3B3bUh6OHpCdGJOWW9WeDcyQ0gxTnBD?=
 =?utf-8?B?SkZiMGdYV0dDWUdlYXp4MTQvYTZ4YmUxZTV1TzdxRmNiRGpnRUlWMS9oYUps?=
 =?utf-8?B?WGp1SXppcldxazhxS21Wc1I5RUxadjdoelBkdERSNThCdDlkaSt4WllmT3Aw?=
 =?utf-8?B?Z0ZNS1gwa05Xc2pHZVN2UTBocVd1OUhHK1FYM29LNkdPYjNOakVLT2t4V00x?=
 =?utf-8?B?SWdIb3pHcWFHbFdob3FJVDBhTkFWd0puUFpIbzU4RkE5QTVCTWFZQ1FBQ2N1?=
 =?utf-8?B?NVFyNzMrTGNOSzBEL2pFalRxYUZxa0xCYVNncm4wdDgrcDJsVUR3WnRxWWwr?=
 =?utf-8?B?aHBFSnNGL3czSjRXOWtnR051YnJjQUZTSXVDRHI1dWQrbmVWOU9ETnBmT2wz?=
 =?utf-8?B?NjRPYlhNeEFibDZXckM5aDhWUnBBN0hkdnE1TlB0VkFCVTZDUUgzK2l0Zi82?=
 =?utf-8?B?N2UxQTIvQ1I0aklMWDhsek9DMms2NTRtbzl2RHh0MlZUbFpSTyt6ZXhZS01F?=
 =?utf-8?B?Y1ltQ055dHNtQWptVDBzVmtIN1h5T2pWcEJPU2JlUEtLdmUwbit1QjlvazFa?=
 =?utf-8?B?bHlMUllvNDIwT3ZqaUFuVFZvUlM5ZU8vcjkxL3BZbk9PYW9yZ09uN2laSk4r?=
 =?utf-8?B?UTZ4SmxoejVTQlloRzdod1lKYkIxTDZBTGs4czRsWWN6S1dvNVo2QzFHdWla?=
 =?utf-8?B?R1FEMW56Wk11RjVLdWVLVS9KRjQ3L0xCTk1jWUVtZk9XbGYxbjVieElVenBT?=
 =?utf-8?B?ZTZteHJDQlR2VzlnOGFVZitUTldoQkhQUld0SDUxMTJTTUgwc3JUM2s2SVJT?=
 =?utf-8?B?akVPd09xSjBhM0luUmZYNG4wQjhTU3l3NG5VWm1NZ2tya0d1L0prcXltb1Bn?=
 =?utf-8?B?WXJkTHpnSnhSZGlvQk5KaVVCU0FDc3pBc1dHa2ExdUQxUDh6RVFJSVFGZDB6?=
 =?utf-8?B?MmJYcE5kaDdQb0Nza0wyWjdKaDlETXFNNkJoMGRQVmd5YWZKQ2xpNFNWdVl3?=
 =?utf-8?B?cGlESm1VNFo2aWR0QnFZK2VYOURzMjg0WEkvS1BvaHVJdU1mUmxVU2ZjNGZl?=
 =?utf-8?B?aitiL3YwQThVWFA4cmNIVldzMEZ2eU5ZbG00Q1ZwdDFxZEQwN2VVVHlxYTV2?=
 =?utf-8?B?MTQ5cXFIdkV4MW9ON05tRXpJQ1FmakxzL045WWluYm9GS3ZtQUN2RTBhUitE?=
 =?utf-8?B?SzBnMzc1L2xwY3hOYnpHT1M0Qk1qWFlsNUIvcmFWZ0VseE9kVVJtcFlUemFI?=
 =?utf-8?B?ZzJZRzRzalZEUUlZWGEvZm1rVzBYY3VwYjNlZWo4Zk02ZlFjYzkvcEYwaUN3?=
 =?utf-8?B?ajE2ZWpoWFRMSGdXdDN5NnB1OGJsbk5Mazg3ZWhHaUVobnUxa2JibnpOa2c5?=
 =?utf-8?B?NGxaa1ZQK0VHUFFTUkd1bVBuZXFSYjYrZE9IdEs1eDBQMFRXNUFmNWpjWi9q?=
 =?utf-8?B?UHM5ZzNwbVE4MWNieUVMRjAzUmJOc0ZZWVNFd0FTT01tbVlxMU9xMi9NdXN0?=
 =?utf-8?B?aE9tWTM2NDNic1JiZnFiVTdxK2tGdkFKdUdRL2E2YVhBc0JvdmgxN3FxNVUv?=
 =?utf-8?B?aDBJeGQ3MThTR1h3OXJwVCtGRHJEQmN6VUlNbVYvNDVXT1hnZWxnelE3R0gr?=
 =?utf-8?B?YnhiaVdlRG5LV3R1SGcxRkE0QmF3b08yZ2NJeTBpbGx0dmZVdWtESUVuVjZN?=
 =?utf-8?B?enFOcFN6aGpmTmFOeUVtdVFVOE42dTgzQWgvYlFhdzhMUnBObGtFVjRKbGxs?=
 =?utf-8?B?akZqa2I4bVoyTVJsd3hhOW03WTYzQk5GQ3VoUGY3cUhQYkUrc09tWlBxeDVp?=
 =?utf-8?B?QjV4UVg0cWdtWXdVUXNWT1RrcDBKV2tsQUZUTm1CaWlTMDdjd2d5ZEZxMEpq?=
 =?utf-8?B?RGF2Z09ZSENYUWthU1d0OW1aY3lMSTN0dnNYZDNmSGhoNEcxMWJNMFRvQWJI?=
 =?utf-8?B?ZWZpTFZXTzFneG56R0hFd3dWOTJiY0tFZXBqUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WCtvNzgxK0RmUUFNYUFSV2F2dUtSbUZIM2VoQnlYVmhtSGFubmRXVXkvSC9T?=
 =?utf-8?B?TDgrS1o0UG5mT1QyOFZ3QWpoQ0VYbDkwOU5GeG9uMWJVMjBxN2VXSWFPWW1q?=
 =?utf-8?B?SGtDT29YS1BkOCsrMVltajlibi8yN01wYllQYmRJb0lsdERFa3VRb2gxNFBW?=
 =?utf-8?B?bkFUSmk4TW5laWIvcmVwQW5aZy9Za0pOVzNYalEzdy9qQXhwaFlnMTN4VjdS?=
 =?utf-8?B?TmJKRmZxdVE1ZjFsQzdhREhlZGhQZ093RmZlNk1Bcjd2Y2NabnpaakdZME15?=
 =?utf-8?B?OXZxTTdIUWF0eHI5d1BnLzFDMHlWZkhMQ3ErM0thZktSd3VtWE5kTXI3MHY2?=
 =?utf-8?B?MUN2UkxxYkVoZ2R1bkhYTHBXWFlHdDN2N1NXZjNSVk5ybmp2QzZmUmxkRXoz?=
 =?utf-8?B?U2ltd25GMUFHdTN0RnlHVHFrNFdML0R6SjdITEtjZ0x0ZlVXSElleWk4Vk94?=
 =?utf-8?B?Q0xKUXZkTmprd3NwZHVRZ3dsR0xxNDNPQUN1Q0NxMzlmQU12MU9iVjRqNHJk?=
 =?utf-8?B?MjF4N0wrWk5vQXZLczlqcmUzL3o5MmVCYXhWSEcrKzBFNGpCck9PcHBpamU0?=
 =?utf-8?B?UDBRZnRZVjBudTE1ZUZiUWc5MG85dmpSYkx6RlZqVjcxaThsUFdGUXFKaFpr?=
 =?utf-8?B?WENoOFczWUc2a21WVVB5ZlhWMFZzU1Fub0ZIc2RpL1RCTEZmWjMxeEdCOXBn?=
 =?utf-8?B?aDFSc01DNFBwV1NEM2M3RG5JWmVacjkva1hDcWg5bGtvSFFhRkZUTlVvTzMz?=
 =?utf-8?B?K0JkQjNkY3VkYUVHZGJiYzhBcmNhYStiaHlkb0xYL2k4d2ltV2hDdHRmWjZP?=
 =?utf-8?B?Vk5SYVBCdFI2ZW9sTkhWMzA5ajZoQXcxQ0VWanFTVDlFbkF2ZXNsVkhBMnVF?=
 =?utf-8?B?M25NZHR2c1pKNFVjVTBEVFFiL0hsTEw2YXNPZjhRVXpnRUNudXN2RG5JeVJv?=
 =?utf-8?B?ZjMwU3BDVDJ5anFNNlJIV1hYUC9jTUh4ck1UV3BIVERLWG8xNVQxZFUwVzE0?=
 =?utf-8?B?eXF2MnpGaVpZc0ZVTlhCSGtnaWlJRStJcDl1Y3VudE9UcUQvZDBDTUJwbTEr?=
 =?utf-8?B?RStUZ3ovQXJFaXU0a2piWU9yaWR5V3JJQzBXNksrS2J2K1c0QjdZaC9DN1V6?=
 =?utf-8?B?Z2RLOFFhQURNV1R3TzBhOFJkejlseUdOYkRNWWpqVG9yeU5nMldpdHYxRnBN?=
 =?utf-8?B?Mno0bFFVU3JUSzlxdWw3bGZzSGg0M1FadnNjZXlyTnhzbm5lUEpZWlJLOEEy?=
 =?utf-8?B?UERyYkxqWWRDdnZFQkhNc2ViM3JPaENWQUU3MFl6bVJFTDAzQWo3YlFYRlZD?=
 =?utf-8?B?NTB0bnB6cWdEaTJJSjhhNVUyd3NMalV5aEhscjBOYTB1ZTJmcW05SHdxckhM?=
 =?utf-8?B?eEVkVXUyOGE1NC9zTmVmM2ovbzd5N1hMM0FRVlN6Zm9HR2lzWlVYTm4remJm?=
 =?utf-8?B?UnYrSkU0VmVTb1FnbEUrOUFaV253bHd2U2RBc25nR1FqeWZURHk5TjVGamUw?=
 =?utf-8?B?bGFPYktBeGJqanlDNVhLQ0RPOGxONFV5L2g5RDBqYTBBdVZrMEcvSlJteHpw?=
 =?utf-8?B?dDBOMW1SaG8xa0tENzRCWjhiSGtFNVB4eXg2NWpQRDNMdFBTeVVhVWptL01i?=
 =?utf-8?B?bGJ5TUE4bTBjQzZLOHlvUjJXVkxjdG1MSEVZeUxpZjcvTzFLWEl6SWl2Ynhj?=
 =?utf-8?B?QXR1WFhoUTFPTmVXRGpaT241OWtleUtVNkErQlBjcXpTWW1qYzh0U0dFaVdt?=
 =?utf-8?B?dGNERG9Xdks5V0VCTFhndFkyd3lWT1V6aFlRL1Frbmc4VzJZbE5wMHpLTm9N?=
 =?utf-8?B?Z24ycE00UUVvQmVGSm4rYjFsT2xMb1lranVjTlV6OEl4WFF3bnFPNGZsZGZY?=
 =?utf-8?B?NnFmcmZuc215K2srUU5RRGRjNGhjazdRWmVhYUZETFRoSzAxbndVQU9QZzd1?=
 =?utf-8?B?c3JJemo5NGpNWWtZWnRreWJtMXVVdjhaT3BVdlBIOElvTUFOeHFYRXptVnBO?=
 =?utf-8?B?QVdCeWc5akMrdFVxUS9kenNYaS9DYkEyNVR2ekVKOSswbVdjYUROdHNxanFO?=
 =?utf-8?B?cVRwZG80SXpGMW80V2FLSEkxRDhPRzRPemNUZjJtMkJTaG9WWC9kNWRadS9y?=
 =?utf-8?Q?+s2f67HhpP7FGE2C7APqGalpk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55fb4ca-72e1-4fe3-1a37-08de27b370cc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:34:38.0958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nlOfn/JwmPdZRgP60VOnw5gGDBJP7nIyQLh4u8QnPhiElfU/xQ/cYjo3ogfS3SAexBWMwhVGYsNOpetDj58Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8433

Some trivial patch to reduce goto at probe functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
- detail change see each patch's change log.
- Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com

---
Frank Li (5):
      media: nxp: use devm_mutex_init() simple code
      media: nxp: use dev_err_probe() to simplify code
      media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
      media: nxp: use cleanup  __free(fwnode_handle) simplify code
      media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers

 drivers/media/platform/nxp/imx-mipi-csis.c         | 50 ++++++-------
 drivers/media/platform/nxp/imx-pxp.c               |  5 +-
 drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 ++---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 84 ++++++++++------------
 drivers/media/platform/nxp/mx2_emmaprp.c           |  7 +-
 6 files changed, 79 insertions(+), 97 deletions(-)
---
base-commit: 0f2995693867bfb26197b117cd55624ddc57582f
change-id: 20250807-cam_cleanup-b6d90ba9dac3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


