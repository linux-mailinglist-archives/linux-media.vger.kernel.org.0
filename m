Return-Path: <linux-media+bounces-62427-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO1LHDzMDmovCQYAu9opvQ
	(envelope-from <linux-media+bounces-62427-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:11:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB815A1FD3
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85EC530685D6
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3B5372EC5;
	Thu, 21 May 2026 09:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ByhuevAG"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010068.outbound.protection.outlook.com [52.101.84.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A327346FA7;
	Thu, 21 May 2026 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354460; cv=fail; b=OYp9dYvgjJDQAZDkKvVcqnpO6fZKfb3SsrFlsPRFXz44HwzP5UCGsdVfS6EUCLlMm0gUd1HYbkbT6oZq6t+N67gs/NFm0AclcG87A7+mI9a5QBEb4LF5QBaxWA095d7y6IYfIb7jP+B5arToGCGdQ++H3VXkIGAf/3oL6eZ7gDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354460; c=relaxed/simple;
	bh=EkGGKSNyw7AnehXSs5Xl89VuIdDd9orbG87qyje5T5o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IByJijNMzdX1BF+f22b+LASmxTH2RLitaZ2ezrT9J5gKFSp3B7riWZrIsxmavDX3wn+qnMfAY1bV1jTNaNmvYNKHVDQVV0UbfzaK2Ynxpb1canNwUDuZfaj2Z7O2xNDoh+yNLg2H8hBF3+wwZn5LmrUnF7LXl4C2qlnwudqvY7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ByhuevAG; arc=fail smtp.client-ip=52.101.84.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc4kgkkipaGs2CmNnmFgGqvO1xnntchDKfhiiWQkxnod1WKe5ancg6JlXQH/g1tZA9/gvvtREkY7ILSNiGZwBrRTw2CJgXs1X63Bhel5pVIVjjRWLxDSnrpGsCS9DzDXcZc0s8ea7ePBoBRBExj9qk6oaV9iqgnlnhG5T8bwsxMvg0N25OHN6K55geR/xKp7M0vhpxeMfHfaw5y+ouPCDBxd0pIuMz0a4zsnxnjR75qh/EzCFKPny3LpO9FDUu7tGZPifvnPDrA9QM7IPMWDs/Ro7Boq7UKw/s/WURRnMoOmxxTNR2i+JbuOatyK4o1qyFSwJIFRIk1BsQ6gCp4U9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE0+e4pHjJ4pVj5BWvxUiksQFKOCayHXihzU8rfTBIA=;
 b=UyoxPdxmXBwL1uNK+E8ugN/T3nLk9TPaU0uM+sDxgrp+XGqz3Iag8I61OGAaLpTd5f6XDOfI1fsnuU3PKO/A57eidHEFbn7VVlVazkpPl6Iqc2OPTZRKw+u7FxurqIpg641tCD48hN684OBV/9P/YzFu7IA9wKb+fsJft9SfAeVAcBbfAbMCF2C97TQ6HyYWI8XgLP47u7sIg+KNbcf+n0IJUHCmHTcPXGHOqHU2nMAX+5XibpGwxcPfY5y8knHKpIgC4hfYJsnz7EQ2Y8dX4Z/cdmDLo69/53r4IyidlghFEBqMpHq91EM96uWQR3ORai6DHwatDI785Z/dz4hovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE0+e4pHjJ4pVj5BWvxUiksQFKOCayHXihzU8rfTBIA=;
 b=ByhuevAG0mPMwCrDQkQ9mbWsM/X3Yyy4IzYpyeHASJa28VcxvNmILvEi4xPQfoN7VQnfq1vWkdyAoLQWxqj1J2tojl3vxomY4+ZaYLch8zRLq3jLHcmNSwcIEFJFVHVl+5VXbohT3GboMWchdsVBPgoSinyIvjYg2/HV3id30RKkn65NTKtApMG/wNaLrUKV8qGxOEF7qcjoA/wUmaDUr/NfxoSGtT3ReFTa6M7SVx8WXRbA+pJLe4EPojmoOzpR1g50oFNzg7rjNzvmB+8oGK7gn9gleOvUCTRZoQUkiZmCJb7IH5hS1MY1LZIh4G+yrgMZXwpOILO+Fld+hnIs8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB11467.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 09:07:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:07:33 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 21 May 2026 17:10:04 +0800
Subject: [PATCH v5 1/2] media: imx8-isi: crossbar: Add get_frame_desc
 operation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-isi_vc-v5-1-a38eb4fcd58e@oss.nxp.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
In-Reply-To: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779354625; l=1554;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=XQauEoHr2n0XOpfIAH225oPyqKAumXox6VGii8oO6Qs=;
 b=ZRbYrgCzv829ATDpUY1KvclTxgGhv2RXapEtc9YmIDNTFuuV/sZdTsfv/6QFoy4tta8PUIO9O
 rti+F/xlE+rC6KMQv6+0rLlzDxQqj52xu3K6hsNZV+UqfyB+42WBglD
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS5PR04MB11467:EE_
X-MS-Office365-Filtering-Correlation-Id: 23f70f75-bbca-4584-3499-08deb718649e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|18002099003|22082099003|56012099003|38350700014|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
 g1vtot14gyEPAOi8TV8cA8juG5ZE9k701dELD8S8QWJNmSbqSrkfw11QI5bTcznz7EGZ6UZw9pJvn+3ZINOafH1KvdeyvB0hwcNmckN6r3E7Cuu6aJfVvIelUG+FBItBsNCJmtnM88U1uyc2pW1OgktfDZSg/EaySH9VZ/zeTTTbdEHeMOxfHHMYIZjBaxvuTmuLCegVeIbZEguCbQBcSTwhuEWTwhfJZHVJwnAJDrCF59RhAAClu2gmHVIM5/MLan+T2r/O6D/jC9AGnaaN5O4Tw/wbvEzU3S/uV0owBJmgD29dwwdN4t/y8id4VIEFc6niXcAKw+AYHN6U5zT7VJ2LnkgxGVIiClZt2pROTSPHzYGxj6uRoIkk1xx3jtDte3n4c/qvHmbl3PpnVHxOudN3nmIydLsmQGxhYMsvk/gvn2y9dDLOeA3mF2cqzjh16kamzGUxuQ400wvcRfW8ScONL/VI8hs8hrq/BdcKWQNxk49plv/Nb7qHtn/VKPTGdbM5VWUIQCl924Uscfp57LAx7ZOvSQYMqTqvev3tbFRJ2uixoI+VOSqiZwfr6d2ygk3VmBkp/bDND6khkECwVfHCd57ICoTs/OGC0weuFPHF87T7+8xmoWS1+Jdj4VOWtzkOf951pGuBiiXvTud2hHiEBbxsIzP1eOSPvvFVGUYaGM1gFXZejZNroAd8MDDrzhA/AcJXVMZolMknslpnK/V2ahUEQcX0QtrQBadFbq8XeR6fSEL75DO/gCe+zadR
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(18002099003)(22082099003)(56012099003)(38350700014)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VEFOS3FyRTZucTkwVUhvcXpGK0JHV1pRemVMRnVnajc4d1BqNG0yQmk0c056?=
 =?utf-8?B?VE9meGxWZjNaRVh6aVBxYnJxd0dzQlFTVEEvWTdVanR2V2RSeFJWaGVtVktH?=
 =?utf-8?B?TUZZMzZVRkVFa0kxSHpjRTNlSUtQREUvUFl6SnI0cTR5V0puZWhuYXJvME5k?=
 =?utf-8?B?Q0FIMFk4dWVERUFZQ2F0VHU4Sk1sYlI2cHRscHlKalptVCtZVXV1bUFFaUJy?=
 =?utf-8?B?WHJEN000VkF5QnY1QUsyUHNVV2NDTHBsMWcwVHBTVkdGb0owNkVjYkZwdkov?=
 =?utf-8?B?Y1lxQ1ozNEhVK0dDRzBnWHF3RUVYOXd2MndFbGJzTjkyZ3JQUk5VRitUMTBE?=
 =?utf-8?B?UlBHaU9LdVVRTHJ0SHBxby8xekNhclBHZytQNWI4MDNyM3V4RkJSZnJpOEVz?=
 =?utf-8?B?UUtidk4rbWhMeklLcWdTdWZwajYwZ1BWV1pBVkZ6T01SajNUUm5IWWRPRlEr?=
 =?utf-8?B?YkNsQUJxbkNIVzkrQWNVUHdneHpPL3ZaM3FyOG5RYUlFWHB3YUZoWCsrbXNT?=
 =?utf-8?B?bVdzMkJQRHBUZkRSYzA1MFU1dTRjM3luRXlEWjBYaEp2M3hqRnRBTi9tckdZ?=
 =?utf-8?B?VUVBdmlsMVh4YjdyT2dwcFJBZ003VUxGRzNwVVgxejArK3pHRGZieHFNc3lB?=
 =?utf-8?B?WHBtMVhoZXBhVjNJUzNnQmlxRGZocVZCUWswZFBnZ0M0TVB6RkNxRHFXb0VG?=
 =?utf-8?B?ZEJndUdHZmhuZzZGdGdtTThLWklnOExQSGRxM1N6OThzZi9BbGhMUkFSaUxC?=
 =?utf-8?B?cnB6Y3JCNVdCODdBT2svQ1IvQXNRUUZVSzJyOWtiTEhrN2dydFdSWDJMeXd5?=
 =?utf-8?B?bEJkZmkzbnhuQTdPVzErMGNRVmdNMUJ3elo3a2VXb2MyOENOME45cXlWRzJP?=
 =?utf-8?B?c3IveTg4c3pQVkF6OTk2dWhBTkZxL2dGSnJwc1IwR05pSXN0V2dHVUZVZWd6?=
 =?utf-8?B?bUwyWDZ6ZTVZZGsvNXZLclNEb0ZqZnBvZG9pZGxBcHlrNTkyVG5DWVg0Vmpw?=
 =?utf-8?B?MmppRkIrUW5Qb2Jua3F6cjN4L2tXdVFrUG9TM09LMWpDZVl4eGJpRXR1WkVq?=
 =?utf-8?B?VDBlT0VHcGRIMEtxcVptME9Db3pZeUhINlRMR2JaSG51a1Q4VjFIOXVQSjQz?=
 =?utf-8?B?OGtGYlNWRHJMcEJSSUI4ZFpLUUxNNFcyL2pKYit5MmJQa3VMUTh1d0NuQUNO?=
 =?utf-8?B?Rld5S1VZMjVnNll3ZE5lZVhrMW53SC9uVFM3ZVdaSVNjNDZrOFpJNDZRUlN6?=
 =?utf-8?B?a0NDRnVGZXFLMnZsQm8vWUEzNEhmSzhoVVZBQWtPQ1N6RlBLblMvZGhrTEtY?=
 =?utf-8?B?aWg2aTYrTEUvZHBxN0JRWFVKSFhlNzlJMjhWUkwxbldvQTRCV1FyVjk4ZXNP?=
 =?utf-8?B?aitzSGoxcUxPekxzSnZBUU8xaHFiMkdsSisrK2lDeWJ3bXJtZUFCaDNiRFBh?=
 =?utf-8?B?eHh0SmFMNCtiYTVqYTlhTjVadnR5ZS9xZWcrNnhpS09Tckwxb3RQUjJlSG5Z?=
 =?utf-8?B?OFl6SVlMaW50c0V1ZmJmajY5cHlXY2dZS3ZnNk9hOXZhbnh4eGNaNStVQ0x4?=
 =?utf-8?B?T1IyWTZqK2x1NGJVbGxnWmNGY0VMS05BMGJBWXM5VmNwUDIwNVF5UGNDZEpz?=
 =?utf-8?B?dUtOUUZKdjcyRjJ2QTNkK3NWWTNjY3Vyd0NGN0NDSVQ5eWora0NCaGhSS3pX?=
 =?utf-8?B?ckp0UFBJb3VyK3I1d2dCUG9DWjFmaDlib1J3UGU4UW1JTVRxSGVnUmRyc29F?=
 =?utf-8?B?L1d0MUZQVzk2MGJwaEhtdTVmT0hkTHB4VjlLZEw0cDN2eDdkZ0lHdW5UNGZ5?=
 =?utf-8?B?R3RlcVZ0cUxBRWN6QVZ5bGVUZUpsdXQ2K1RNaWwvZ1JrbTlkZmNPb09DN3lI?=
 =?utf-8?B?eVhmZmNDbVF2ZGRNbkdLTGM2cXhCZ2ZLVmh2TEJDUjRxcXZadnBqeFNJZDcx?=
 =?utf-8?B?UmlmcUh5WmNJdk1SZzJMSlcxTUlZdkQrNEZqcitDeCtmQXIzSUJTMmRSTFRW?=
 =?utf-8?B?RXIwUTBkS09hcm9vc2JLT3hmRHZEcmFOKzFudHBqU3ZXNjVjQVkvS3VoL3VG?=
 =?utf-8?B?TGlWK0JMYk1mY3VtY0ZjazB5cXVhMldpVjVCS1BETStMRzA3Vmx5YWNRbk1F?=
 =?utf-8?B?SjZiV1lXSEF2VG4wUm1sYlE1K2laWnpvMUkrUnNwYVgzUU1aSmIvQ1Z5dGdX?=
 =?utf-8?B?U25GQndkaXdxdHhWeDNmanIyUTEydVRHcUdnU3J1MDRFdUZMMlRyVWpEa0l3?=
 =?utf-8?B?eHJhT1hWQTB0bDdUdFFiQndwYVZxVy9GUzZSdW9NSmo1N2M4dkJxQkZqemdz?=
 =?utf-8?B?clBzV0ZOZlBGZmVGK3RoUU9YTFp3am1ZNlVXL2pWcnhpdzNNaFpvQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f70f75-bbca-4584-3499-08deb718649e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:07:33.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GT8Yvyf3nlsYi0AjK88yLFdsQS+i5VhqnMZ4yM5fwj+2qIMmKiUWkb/jHEJSkHbp5lTqqXBWGnAU/LFYlecOiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11467
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62427-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0FB815A1FD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Implement the get_frame_desc pad operation for the crossbar subdev using
the v4l2_subdev_get_frame_desc_passthrough() helper. This allows the
crossbar to properly propagate frame descriptors from its sink pads to
its source pads, which is necessary for proper stream configuration in
multiplexed streams scenarios.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Use v4l2_subdev_get_frame_desc_passthrough helper
- Rewrote commit message

Changes in v4:
- Use %d instead of %u for ret variable in error messages
- Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue

Changes in v3:
- New patch added based on feedback from Laurent Pinchart
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..0b593aed618b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -404,6 +404,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
 	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_crossbar_set_fmt,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.set_routing = mxc_isi_crossbar_set_routing,
 	.enable_streams = mxc_isi_crossbar_enable_streams,
 	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
2.34.1


