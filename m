Return-Path: <linux-media+bounces-66389-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PO4LEYyORmoYYgsAu9opvQ
	(envelope-from <linux-media+bounces-66389-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:15:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 374A46FA061
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:15:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=YyWrTCYI;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66389-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66389-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C93C63022DC3
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C6B32ED4E;
	Thu,  2 Jul 2026 16:04:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013068.outbound.protection.outlook.com [52.101.83.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F71233D6E6;
	Thu,  2 Jul 2026 16:04:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008292; cv=fail; b=Yq9RNWDvjOT+wT7+Z2veNyPPr1zXIlM06mi3SB15cOrAkV+vbX70dlPiO4Uwufr7zpnq3NZfI5QdAqx+3atClNDiKKy3ttISQtvAMypJAso7I+awRDsRiqS+H3pLAURiQVUX9ELIxdIXEBYgUliLbL1DB31YMr7pWy/xKCniY80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008292; c=relaxed/simple;
	bh=fYEFD/gfXxdHwt9fd4doCtYGCESRnTz99M9ZOEnsZdo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oL6LwPib/auNPn2VJTWnfr0mNJKIalgjIM2K7OFInaRMgjbL/LFnu7CBLaKg48GPnoQQ0KtHYoZXJ8lzZFKHj4bfBUoSkvL70UTPnLE3W7EkZVasbarlrC+WzEqvkhCTbd0Uj2cxap9oqP6yvvwO5Y1KiLliFm6XPBcpvCsV/FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YyWrTCYI; arc=fail smtp.client-ip=52.101.83.68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZ/0EJ3XmhZtSPCd+W/v2vUM4lh8tgXNeis1IHVqsNnl8GxCfsagHYmnLX8ESjGFkEy1XuGrnOcsjcs+EN36AUBsti24OYapRRdnYb+t6IH2LwGLlZfJ1H1n+Lq7SiSC+XvQvhM6b0RczsD3Ji22gUZT3NErJGDq7/Xl61k/1btsZei4QxqMUY245bvZE61nmESjUzB1giAELKcuaA3B5wX2Z/gS0yh3HATTagk15EW96VsyK1w8YEQNqd5Ojx9Aff2GGZSx7RuatG2GHrca3y6J4hBfUQczb427iA7/zmUwpHTU7EdpuhmeAwHa5EU4b+0r0Zz7+3jyjfxwo29dZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6PlCMVYQ+OWo94goKUYR/jCSBhg+rdxHBtSnzuCOXAk=;
 b=eZ7b/KMfRjgmIxYTb5zA7wpSSdV04AMCvdu8tChnoQzg8QMaNGLmglK2igI53Dwwx/dA9DlWc3n5XiNQmUCB8ek6T06fY4nRWpiTvBVkaIJXKBVeRIBS3ccaCw5049z7da+GptcJm+j3LInHGVF/7t3coSRhD4Y9TUSoydbNhpFZWCOoqdZfTpuopXRu/w5Cwm6eQpU1Vzr8nqgJE2bgPcBr6DMUsQht3bjx6ghhqnBb4V6W/R5nYIH6yUQYdJ0VvDdh+T/wx8mRpHGA9E+3Ban2MvGLUi0c1sB8GllNRM+M5GW7WhFC3w0r3C0Xkqsha2ajlXMhAKOiMHTzfY5CgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6PlCMVYQ+OWo94goKUYR/jCSBhg+rdxHBtSnzuCOXAk=;
 b=YyWrTCYIMr7T/RyWuU9aET4wjkBLlY18NgxIW8zvZbvbOolkod46FUPOsAehNGzNFbkEF3c7/CiNZFMWwt9neSrz7LkH0QIEJqjm/+AC7KAsb7nUeLnOcN+HCr9xv25oId6Hq/0O7RubF1JLeu6ZQAxhMtHKwJimLw801LvCQog0XJ+b3gHU1Uf5uG4KekaGl+5Rb4qW5Cq1nLcfTatgsSL5GgZEvbYmt6nzvpn1RtsXgS3/a4cv0sjFN4eSojHpOKq2TvbovRGUZts0sbuGmAgCUzzHE77/+IIl9zecBODJzSzVNMQb4u85VWalMoFucyTZHEiUXmsPxGWczkjvzg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:45 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:04:02 -0400
Subject: [PATCH v7 6/8] media: nxp: add V4L2 subdev driver for camera
 parallel interface (CPI)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-6-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Zhipeng Wang <zhipeng.wang_1@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=22627;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1/qXHT4T2vURyI+LkakJTEzr4rmz3RBoEfD/V9zz4f8=;
 b=ZhZgjwDL2Hk6eo8es8kydBVVsPlzXk0y8rjKyGMMwz0ddy3c40Rj/AATdqd8wdMe9EO7LwfjN
 +RbWBJ4uloyBCmIz4uvkMaBGS/Kz62FAlQTTu6sh1QjCGAVnaE2ylPd
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c5862fa-91c8-4dc4-c842-08ded853a286
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
 incK9jhoXMfY5ugmKAjhU0sjkkLfdKSy+aNi+zo5zD16YyRYPsmEQNQUMnG8/0nJt1Hnedvjtq8mvVrMIOCisGdVsYEzhuK+x6795sIXv5NT2xCvVMTe5Eagzxm33L7J3HrlHIwmLhbMMfONtA76D3Sf/J1mLtUuadXn0zl6JFlq2Wbo8D6DxlqkMb00/PEM/gqyMKwFhJCbIcVCf+SMbMHN2yf2kC5fF+0tKu8JTkrMkrItPkzWXipqybwrG75zK+W3CiOFq5oJA9kE443fYL8NjrpAy5fMZAPfjqyLxuA1cgZOs6ztWP5+20dOxVt8jYGEKEUSVSyl9q95Uc0LmeIUsp09k4qF9HRojA4LEvvuP1PVn6X/tKPfWKJwVg+9dul4Q+OvDG2V1NDEa/PLXLpOfO+kBzVsg9l3g3r32tPGsdrZriMMv/v3RzsM1o/afsKWsLEy9AlllVQk7Ah6RilZt0moxLG7i0bRClVAUmaDliFVeoyhijuMhwVLQX6qg2D03zusiS9ttt2jSUnI1E2RBaZkfwXhu96r2V2T85ZyTXX4ed1tVf6Qb/C8pNo59t7NjFYEuvXLcXsel7hlAaHa8OceM18vpclH35ETekt2MW2l6C+a3LhxUhgv8ymn5ORLoA3jc9Kowmmg43E7mVP6UHM7A1sewtAP7R+/pAe3wK4eP0u9pbkaNqdrnaDiSE170DiaUTIN8H5rlmWAuw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Y3lKTi95bVJCZGJsUjBTVy8xS28yZU1UcElncExkUWkxbzUrME5IdVUvUDhr?=
 =?utf-8?B?ZnZCK2ZFRHY4Qk1CU0VabzB5TlFsb3M1SGhYa0JoZlA2TGhWN2Nld2UrRm9D?=
 =?utf-8?B?YjNzMkNla05SMFhydFRrb3lwSlo4dk95ejg2MUd2eDBBOGFvWWVvR05vNmNK?=
 =?utf-8?B?eDd5VER2TUkzVkE2c2tacmxiU0lDVmtsTkpRb0lkc0VHa2RCU0lIa2dmaTA0?=
 =?utf-8?B?R2IzNnRIOTJyWEpVWTllSkp5dGJDUHdEaFBYME8yaE5GTDVZR1kvZXNBYmh3?=
 =?utf-8?B?RTR2bE13RHFSMXVSbW54NmJBNTFMNmg5ZXRVMzJVTmplQVRIWjh0NlMxYTI4?=
 =?utf-8?B?OU5WdDVyOHlobjYzaDdwaHlxbGhXVzhEK0syelUrcXNtbEdQWjhmOHV5ODZR?=
 =?utf-8?B?UmxnUTVTZ25VNlJQL3NqQTJMZXliZVVOb1Q3WEc1cXplMmZLL1QvVXo0Z21Y?=
 =?utf-8?B?bGNmLzFlaDRFVHRiTTIzMGdudDlydTMvcW5xL3NqQ0JqR0VORFp1Y05IbU5u?=
 =?utf-8?B?NGtqUWR4a0lDR29qVDhXWk4zNFFwNGZrKzZ4YjV5VDR5NzlrdGhsQ2o2d0k4?=
 =?utf-8?B?TTlGYk11ZjVEVFV6NmZ5VHUxME1jT2E0dEZOQUhWWTBBMzc3VFZvWDE3WGtu?=
 =?utf-8?B?SklhQmtiZW5wbGdhTzFQWDBEbERGTlVkVC95VHRvQW4zYXNUUUNyQWhBY3o2?=
 =?utf-8?B?ZXlmRGdZZ2MwSHEwS2hGR3NKSlovOGVwbFN0VXZYNkl3TFBNWVA5WnNwMUh4?=
 =?utf-8?B?bWZJQndlcmorSHl6TXlnakM2LzdUeTdjZmFQR0JDTDJJYkxYeldQbUlPWEs2?=
 =?utf-8?B?Smh2UzFsVWJpZE5sby95S1RKclZ6QkMrMjRVVTZuOTBRazZhN2xPS1YyMjkx?=
 =?utf-8?B?STdSZ0VUeDlQeGJLVHE2TmxITm5wcDVEMjdGNFA0L3d0enBFNUdzTmUvdytk?=
 =?utf-8?B?VzFuVWVEMGZpR3M5MzNQQnNmOVhYRmt0dVd3bkFLSzdOaEp4YWVid0pEN2Ew?=
 =?utf-8?B?cnhnaFZkd0JQN2ticDFiWkFaWTVER1grR0tyVFZXenRLZnRGZDJVeXhqTytv?=
 =?utf-8?B?UThvU3ZueE1CWUhHSTJUN3cwSEtLcjlVc0x4WDVDVStIanRxRkQ4T09odlNO?=
 =?utf-8?B?TVFQNEY4cFkza2tIUzVRMGkraW1DSHhpMVk0S09jNVpvTG9tbzFwWkNmQUtY?=
 =?utf-8?B?MmIwUWg1QjFVcENaMVdldi9SN2FWMFVVTEdFK0xhMkFuL2NYcDVsSWRtYkNZ?=
 =?utf-8?B?MkZVa0pYZFZFWnVKNlZJOHloQkxseERsMTd5SVk1aXZNNS9zMnFBSWVQZmdm?=
 =?utf-8?B?eXNyRzVwTjRZanlQcm9Ba3ZsbVl4RCtwN251YStURlpoT3BqWStvN1BGRlJn?=
 =?utf-8?B?aG9wNFZxbDE3aTMzcWVRUDArSDBtSnZ4N1pTM1JQTjFpaFlYcDZlZEZqdVc0?=
 =?utf-8?B?V3AwQnhoVVRUQzB2MkE4aGlvaXpWV1Zrd3ZST2pIVGZJLzVPeUNKR1VHaXV3?=
 =?utf-8?B?SXJvVmZUQTJXMHhUS1ErYUcyM0JnZTQzOGJuK3dMTUYzOWhxWTk0azRHekM5?=
 =?utf-8?B?RllOT1phQUFHQlBoQ1g3RHZUWjljMmxGa3pGb2dxUlc3T1M3OW5ibmlnUkpG?=
 =?utf-8?B?RlBxY1ZBaWw5VGNyb0UvYkdGYjluMklRN1NRczZLQ0VqcjYxMkZIVGcxZm8x?=
 =?utf-8?B?T2pjYlhXTmhlZm1XZDFDTGRsdFRoU0lwRUt3MkxnbjYzZHRQZHRBTnA1SFRN?=
 =?utf-8?B?UkVLUExFRVlUVDBqZ3lBTVZtbk9OMnNQcFpRaUFIV3FEN21DWjVlSjNxTWVk?=
 =?utf-8?B?YUFSWmwzSmJzdXVhdzVhN0NnKzhKM2htbzMrcDdoRkdON2EzSFpZSkZnb09n?=
 =?utf-8?B?V0hXbS8wR1pOS3dkc1JQK2dVdHN1b0tLU0t0Vyt5eFlPR1lzbmI2ZGY2MVoz?=
 =?utf-8?B?bDNpYVFNWjErWjV3Y3FOVlQyWDdhY2lEbHZISE1aeXEyTC9vZzVyU0EzM3JS?=
 =?utf-8?B?UTcydHJ5U3RiUHdmZlB1dTBlYW41VDVtOGFrV1pvNWU0eUVGWDU5YlZRZlUy?=
 =?utf-8?B?R0pCaU1QaTExbnAyWWZUY0RuZ0hXSDdMSTFSQnFSSFYxRmhhSmQ5b1o5b0V5?=
 =?utf-8?B?OWFtMjB3U21uWTQ5MEZCeGkzajN6Sm8rQjlBaysyazRqR21PdGlVajFyaXRp?=
 =?utf-8?B?OUNHelRvMXdtLzhCSlBJdXR5T0JNeExHTkNKSmFFRnRXRkZTYllOYWswb1JS?=
 =?utf-8?B?OUxhMDRIdVg3NzhSd0NDci94L29EbXFoeE5vWm8yV1N6WENuWnlWQ3JNSzdt?=
 =?utf-8?B?UGlxcnpJS3plL2toN1k1V2pmbm84REE4VE5vaER0aklKQWV1ajR4b2FaWTQy?=
 =?utf-8?Q?n31OjWINn7OyNXTg2nmKVZL1SJL7TFLvgNgWG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c5862fa-91c8-4dc4-c842-08ded853a286
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:45.7288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xv9hObTASr85tPR1IXu4kWZM79SzKBwYux1bq1d1SwOJujXTg7WltqCosd9/yFdGYZCvEWmPKTELs+fUyaZ13crOtD5Rnw7ugLe0NjVV/9w/KRzWv9OPuQKDdOYDbfOx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:robert.chiras@nxp.com,m:zhipeng.wang_1@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66389-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,i.mx:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 374A46FA061

From: Alice Yuan <alice.yuan@nxp.com>

Add a V4L2 sub-device driver for the CPI controller found on i.MX8QXP,
i.MX8QM, and i.MX93 SoCs. This controller supports parallel camera sensors
and enables image data capture through a parallel interface.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v7
- save vep flags to local driver data
- update according new API change.

Change in v6
- Don't use subdev_1to1
- use new api media_async_register_subdev()
- remove used switch -case

Change in v5
- Use subdev_1to1 register function
- Use v4l2_subdev_get_frame_desc_passthrough
- Use dwc csi2 similar logic enable/disable stream
- Add route settup at imx_cpi_init_state()
- Remove V2 register layout support, add it later

change in v4
- remove unnecesary header file.
- use devm_bulk_clk_get().
- update kConfig i.MX8/i.MX9
- Remove define IMX_CPI_DEF_PIX_WIDTH ..., which used once only
- drop get_interface_ctrl_reg1_param
- drop uv-swap
- drop imx_cpi_link_setup by use immutable link.
- use enable/disable_stream() replace depericated .s_stream.
- remove dbg print and reg dump functions.
- use goto/.remove() to do manual cleanup.
- remove imx93 support. Add it later.

change in v3
- replace csi with cpi
- use __free(fwnode_handle) to simpilfy code
- remove imx91 driver data, which is the same as imx93

change in v2
- remove MODULE_ALIAS
- use devm_pm_runtime_enable() and cleanup remove function
- change output format to 1x16. controller convert 2x8 to 1x16 format
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/nxp/Kconfig            |  12 +
 drivers/media/platform/nxp/Makefile           |   1 +
 drivers/media/platform/nxp/imx-parallel-cpi.c | 629 ++++++++++++++++++++++++++
 4 files changed, 643 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f690826964369..22f60b6e89bf2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16251,6 +16251,7 @@ F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
 F:	drivers/media/platform/nxp/imx-mipi-csis.c
+F:	drivers/media/platform/nxp/imx-parallel-cpi.c
 F:	drivers/media/platform/nxp/imx7-media-csi.c
 F:	drivers/media/platform/nxp/imx8mq-mipi-csi2.c
 
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e21..90f7c792003f2 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -39,6 +39,18 @@ config VIDEO_IMX_MIPI_CSIS
 	  Video4Linux2 sub-device driver for the MIPI CSI-2 CSIS receiver
 	  v3.3/v3.6.3 found on some i.MX7 and i.MX8 SoCs.
 
+config VIDEO_IMX_PARALLEL_CPI
+	tristate "NXP i.MX8/i.MX9 Parallel CPI Driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_1TO1
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  Video4Linux2 sub-device driver for PARALLEL CPI receiver found
+	  on some iMX8 and iMX9 SoCs.
+
 source "drivers/media/platform/nxp/imx8-isi/Kconfig"
 
 # mem2mem drivers
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb7136525..5346919d2f108 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -7,5 +7,6 @@ obj-y += imx8-isi/
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
+obj-$(CONFIG_VIDEO_IMX_PARALLEL_CPI) += imx-parallel-cpi.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx-parallel-cpi.c b/drivers/media/platform/nxp/imx-parallel-cpi.c
new file mode 100644
index 0000000000000..735d4a89f7b30
--- /dev/null
+++ b/drivers/media/platform/nxp/imx-parallel-cpi.c
@@ -0,0 +1,629 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * i.MX Parallel CPI receiver driver.
+ *
+ * Copyright 2019-2025 NXP
+ *
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/limits.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include <media/v4l2-common.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CI_PI INTERFACE CONTROL */
+#define IF_CTRL_REG_PL_ENABLE			BIT(0)
+#define IF_CTRL_REG_PL_VALID			BIT(1)
+#define IF_CTRL_REG_DATA_TYPE_SEL		BIT(8)
+#define IF_CTRL_REG_DATA_TYPE(x)		FIELD_PREP(GENMASK(13, 9), (x))
+
+#define DATA_TYPE_OUT_NULL			0x00
+#define DATA_TYPE_OUT_RGB			0x04
+#define DATA_TYPE_OUT_YUV444			0x08
+#define DATA_TYPE_OUT_YYU420_ODD		0x10
+#define DATA_TYPE_OUT_YYU420_EVEN		0x12
+#define DATA_TYPE_OUT_YYY_ODD			0x18
+#define DATA_TYPE_OUT_UYVY_EVEN			0x1a
+#define DATA_TYPE_OUT_RAW			0x1c
+
+#define IF_CTRL_REG_IF_FORCE_HSYNV_OVERRIDE	0x4
+#define IF_CTRL_REG_IF_FORCE_VSYNV_OVERRIDE	0x2
+#define IF_CTRL_REG_IF_FORCE_DATA_ENABLE_OVERRIDE	0x1
+
+/* CPI INTERFACE CONTROL REG */
+#define CPI_CTRL_REG_CPI_EN			BIT(0)
+#define CPI_CTRL_REG_PIXEL_CLK_POL		BIT(1)
+#define CPI_CTRL_REG_HSYNC_POL			BIT(2)
+#define CPI_CTRL_REG_VSYNC_POL			BIT(3)
+#define CPI_CTRL_REG_DE_POL			BIT(4)
+#define CPI_CTRL_REG_PIXEL_DATA_POL		BIT(5)
+#define CPI_CTRL_REG_CCIR_EXT_VSYNC_EN		BIT(6)
+#define CPI_CTRL_REG_CCIR_EN			BIT(7)
+#define CPI_CTRL_REG_CCIR_VIDEO_MODE		BIT(8)
+#define CPI_CTRL_REG_CCIR_NTSC_EN		BIT(9)
+#define CPI_CTRL_REG_CCIR_VSYNC_RESET_EN	BIT(10)
+#define CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN	BIT(11)
+#define CPI_CTRL_REG_HSYNC_FORCE_EN		BIT(12)
+#define CPI_CTRL_REG_VSYNC_FORCE_EN		BIT(13)
+#define CPI_CTRL_REG_GCLK_MODE_EN		BIT(14)
+#define CPI_CTRL_REG_VALID_SEL			BIT(15)
+#define CPI_CTRL_REG_RAW_OUT_SEL		BIT(16)
+#define CPI_CTRL_REG_HSYNC_OUT_SEL		BIT(17)
+#define CPI_CTRL_REG_HSYNC_PULSE(x)		FIELD_PREP(GENMASK(21, 19), (x))
+#define CPI_CTRL_REG_UV_SWAP_EN			BIT(22)
+#define CPI_CTRL_REG_DATA_TYPE_IN(x)		FIELD_PREP(GENMASK(26, 23), (x))
+#define CPI_CTRL_REG_MASK_VSYNC_COUNTER(x)	FIELD_PREP(GENMASK(28, 27), (x))
+#define CPI_CTRL_REG_SOFTRST			BIT(31)
+
+/* CPI INTERFACE STATUS */
+#define CPI_STATUS_FIELD_TOGGLE			BIT(0)
+#define CPI_STATUS_ECC_ERROR			BIT(1)
+
+/* CPI INTERFACE CONTROL REG1 */
+#define CPI_CTRL_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(15, 0), (v))
+#define CPI_CTRL_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
+
+#define CPI_CTRL_V2_REG1_PIXEL_WIDTH(v)		FIELD_PREP(GENMASK(16, 0), (v))
+#define CPI_CTRL_V2_REG1_VSYNC_PULSE(v)		FIELD_PREP(GENMASK(31, 16), (v))
+
+/* Need match field DATA_TYPE_IN definition at CPI CTRL register */
+enum cpi_in_data_type {
+	CPI_IN_DT_UYVY_BT656_8 = 0x0,
+	CPI_IN_DT_UYVY_BT656_10,
+	CPI_IN_DT_RGB_8,
+	CPI_IN_DT_BGR_8,
+	CPI_IN_DT_YVYU_8 = 0x5,
+	CPI_IN_DT_YUV_8,
+	CPI_IN_DT_RAW_8 = 0x9,
+	CPI_IN_DT_RAW_10,
+};
+
+enum {
+	PI_GATE_CLOCK_MODE,
+	PI_CCIR_MODE,
+};
+
+enum {
+	PI_V1,
+};
+
+struct imx_cpi_plat_data {
+	u32 version;
+	u32 if_ctrl_reg;
+	u32 interface_status;
+	u32 interface_ctrl_reg;
+	u32 interface_ctrl_reg1;
+};
+
+struct imx_cpi_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	struct v4l2_subdev sd;
+
+	const struct imx_cpi_plat_data *pdata;
+
+	u32 flags;
+	u32 enabled_streams;
+	u8 mode;
+};
+
+struct imx_cpi_pix_format {
+	u32 code;
+	u32 output;
+	u32 data_type;
+	u8 width;
+};
+
+static const struct imx_cpi_pix_format imx_cpi_formats[] = {
+	/* YUV formats. */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.output = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = CPI_IN_DT_UYVY_BT656_8,
+		.width = 16,
+	}, {
+		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.output = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = CPI_IN_DT_YVYU_8,
+		.width = 16,
+	},
+};
+
+static const struct imx_cpi_plat_data imx8qxp_pdata = {
+	.version = PI_V1,
+	.if_ctrl_reg = 0x0,
+	.interface_status = 0x20,
+	.interface_ctrl_reg = 0x10,
+	.interface_ctrl_reg1 = 0x30,
+};
+
+static const struct imx_cpi_pix_format *find_imx_cpi_format(u32 code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(imx_cpi_formats); i++)
+		if (code == imx_cpi_formats[i].code)
+			return &imx_cpi_formats[i];
+
+	return NULL;
+}
+
+static void imx_cpi_sw_reset(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Softwaret Reset */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_SOFTRST;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	fsleep(500);
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CPI_CTRL_REG_SOFTRST;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_hw_config(struct imx_cpi_device *pcpidev,
+			      const struct imx_cpi_pix_format *pcpidev_fmt)
+{
+	bool hsync_pol = pcpidev->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH;
+	bool vsync_pol = pcpidev->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH;
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Software Reset */
+	imx_cpi_sw_reset(pcpidev);
+
+	/* Config PL Data Type */
+	val = IF_CTRL_REG_DATA_TYPE(DATA_TYPE_OUT_YUV444);
+	val |= IF_CTRL_REG_PL_ENABLE | IF_CTRL_REG_PL_VALID;
+	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
+
+	/* Config CTRL REG */
+	val = CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN;
+
+	val |= CPI_CTRL_REG_DATA_TYPE_IN(pcpidev_fmt->data_type) |
+	       FIELD_PREP(CPI_CTRL_REG_HSYNC_POL, hsync_pol) |
+	       FIELD_PREP(CPI_CTRL_REG_VSYNC_POL, vsync_pol) |
+	       FIELD_PREP(CPI_CTRL_REG_PIXEL_CLK_POL, 0) |
+	       CPI_CTRL_REG_MASK_VSYNC_COUNTER(3) |
+	       CPI_CTRL_REG_HSYNC_PULSE(2);
+
+	if (pcpidev_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	    pcpidev_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8)
+		val |= CPI_CTRL_REG_UV_SWAP_EN;
+
+	if (pcpidev->mode == PI_GATE_CLOCK_MODE) {
+		val |= CPI_CTRL_REG_GCLK_MODE_EN;
+	} else if (pcpidev->mode == PI_CCIR_MODE) {
+		val |= (CPI_CTRL_REG_CCIR_EN |
+			CPI_CTRL_REG_CCIR_VSYNC_RESET_EN |
+			CPI_CTRL_REG_CCIR_EXT_VSYNC_EN |
+			CPI_CTRL_REG_CCIR_ECC_ERR_CORRECT_EN);
+	}
+
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_config_ctrl_reg1(struct imx_cpi_device *pcpidev,
+				     const struct v4l2_mbus_framefmt *format)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 pixel_width;
+	u32 vsync_pulse;
+	u32 val;
+
+	pixel_width = format->width - 1;
+	vsync_pulse = format->width << 1;
+
+	val = CPI_CTRL_REG1_PIXEL_WIDTH(pixel_width) |
+	      CPI_CTRL_REG1_VSYNC_PULSE(vsync_pulse);
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg1);
+}
+
+static void imx_cpi_enable(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Enable CPI */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_CPI_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable SYNC Force */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~(CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN);
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+}
+
+static void imx_cpi_disable(struct imx_cpi_device *pcpidev)
+{
+	const struct imx_cpi_plat_data *pdata = pcpidev->pdata;
+	u32 val;
+
+	/* Enable Sync Force */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val |= CPI_CTRL_REG_HSYNC_FORCE_EN | CPI_CTRL_REG_VSYNC_FORCE_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable CPI */
+	val = readl(pcpidev->regs + pdata->interface_ctrl_reg);
+	val &= ~CPI_CTRL_REG_CPI_EN;
+	writel(val, pcpidev->regs + pdata->interface_ctrl_reg);
+
+	/* Disable Pixel Link */
+	val = readl(pcpidev->regs + pdata->if_ctrl_reg);
+	val &= ~(IF_CTRL_REG_PL_VALID | IF_CTRL_REG_PL_ENABLE);
+	writel(val, pcpidev->regs + pdata->if_ctrl_reg);
+}
+
+static struct imx_cpi_device *sd_to_imx_cpi_device(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct imx_cpi_device, sd);
+}
+
+static const struct media_entity_operations imx_cpi_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int imx_cpi_set_fmt(struct v4l2_subdev *sd,
+			   struct v4l2_subdev_state *sd_state,
+			   struct v4l2_subdev_format *sdformat)
+{
+	struct imx_cpi_pix_format const *pcpidev_fmt;
+	struct v4l2_mbus_framefmt *fmt;
+
+	/*
+	 * The Parallel cpi can't transcode in any way, the source format
+	 * can't be modified.
+	 */
+	if (sdformat->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	pcpidev_fmt = find_imx_cpi_format(sdformat->format.code);
+	if (!pcpidev_fmt)
+		pcpidev_fmt = &imx_cpi_formats[0];
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+
+	fmt->code = pcpidev_fmt->code;
+	fmt->width = sdformat->format.width;
+	fmt->height = sdformat->format.height;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = sdformat->format.colorspace;
+	fmt->quantization = sdformat->format.quantization;
+	fmt->xfer_func = sdformat->format.xfer_func;
+	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
+
+	sdformat->format = *fmt;
+
+	/* Propagate the format from sink to source. */
+	fmt = v4l2_subdev_state_get_format(sd_state, V4L2_SUBDEV_1TO1_PADS_SOURCE);
+	*fmt = sdformat->format;
+
+	/* The format on the source pad might change due to unpacking. */
+	fmt->code = pcpidev_fmt->output;
+
+	return 0;
+}
+
+static int imx_cpi_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = V4L2_SUBDEV_1TO1_PADS_SINK,
+			.sink_stream = 0,
+			.source_pad = V4L2_SUBDEV_1TO1_PADS_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt *fmt;
+
+	fmt = v4l2_subdev_state_get_format(state, 0);
+
+	fmt->code = imx_cpi_formats[0].code;
+	fmt->width = 1920;
+	fmt->height = 1080;
+
+	fmt->colorspace = V4L2_COLORSPACE_SMPTE170M;
+	fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(fmt->colorspace);
+	fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(fmt->colorspace);
+	fmt->quantization = V4L2_MAP_QUANTIZATION_DEFAULT(false,
+							  fmt->colorspace,
+							  fmt->ycbcr_enc);
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, fmt);
+}
+
+static int imx_cpi_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = pcpidev->dev;
+	struct v4l2_subdev *remote_sd;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
+
+	pcpidev->enabled_streams &= ~streams_mask;
+
+	if (!pcpidev->enabled_streams) {
+		imx_cpi_disable(pcpidev);
+		pm_runtime_put_autosuspend(dev);
+	}
+
+	return 0;
+}
+
+static int imx_cpi_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
+{
+	struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+	const struct imx_cpi_pix_format *pcpidev_fmt;
+	const struct v4l2_mbus_framefmt *format;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = pcpidev->dev;
+	struct v4l2_subdev *remote_sd;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, V4L2_SUBDEV_1TO1_PADS_SINK,
+					       V4L2_SUBDEV_1TO1_PADS_SOURCE,
+					       &streams_mask);
+
+	format = v4l2_subdev_state_get_format(state, V4L2_SUBDEV_1TO1_PADS_SINK);
+	pcpidev_fmt = find_imx_cpi_format(format->code);
+
+	if (!pcpidev->enabled_streams) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		imx_cpi_hw_config(pcpidev, pcpidev_fmt);
+		imx_cpi_config_ctrl_reg1(pcpidev, format);
+		imx_cpi_enable(pcpidev);
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_cpi_stop;
+
+	pcpidev->enabled_streams |= streams_mask;
+
+	return 0;
+
+err_cpi_stop:
+	/* Stop CSI hardware if no streams are enabled */
+	if (!pcpidev->enabled_streams)
+		imx_cpi_disable(pcpidev);
+
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static int imx_cpi_enum_mbus_code(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_mbus_code_enum *code)
+{
+	/*
+	 * The PARALLEL CPI can't transcode in any way, the source format
+	 * is identical to the sink format.
+	 */
+	if (code->pad == V4L2_SUBDEV_1TO1_PADS_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->pad != V4L2_SUBDEV_1TO1_PADS_SINK)
+		return -EINVAL;
+
+	if (code->index >= ARRAY_SIZE(imx_cpi_formats))
+		return -EINVAL;
+
+	code->code = imx_cpi_formats[code->index].code;
+
+	return 0;
+}
+
+static int imx_cpi_set_pad_by_ep(struct v4l2_subdev *sd, struct media_pad *pad,
+				 struct v4l2_fwnode_endpoint *vep)
+{
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SINK) {
+		struct imx_cpi_device *pcpidev = sd_to_imx_cpi_device(sd);
+
+		pcpidev->flags = vep->bus.parallel.flags;
+
+		if (vep->bus_type != V4L2_MBUS_PARALLEL)
+			return -EINVAL;
+
+		pad->flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
+
+		return 0;
+	}
+
+	if (vep->base.port == V4L2_SUBDEV_1TO1_PADS_SOURCE) {
+		/* Source port */
+		pad->flags = MEDIA_PAD_FL_SOURCE | MEDIA_PAD_FL_MUST_CONNECT;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static const struct v4l2_subdev_video_ops imx_cpi_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops imx_cpi_pad_ops = {
+	.enum_mbus_code = imx_cpi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = imx_cpi_set_fmt,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.enable_streams = imx_cpi_enable_streams,
+	.disable_streams = imx_cpi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops imx_cpi_subdev_ops = {
+	.pad = &imx_cpi_pad_ops,
+	.video = &imx_cpi_video_ops,
+};
+
+static const struct v4l2_subdev_internal_ops imx_cpi_internal_ops = {
+	.init_state = imx_cpi_init_state,
+	.set_pad_by_ep = imx_cpi_set_pad_by_ep,
+};
+
+/* ----------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int imx_cpi_runtime_suspend(struct device *dev)
+{
+	struct imx_cpi_device *pcpidev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(pcpidev->num_clks, pcpidev->clks);
+
+	return 0;
+}
+
+static int imx_cpi_runtime_resume(struct device *dev)
+{
+	struct imx_cpi_device *pcpidev = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(pcpidev->num_clks, pcpidev->clks);
+}
+
+static const struct dev_pm_ops imx_cpi_pm_ops = {
+	RUNTIME_PM_OPS(imx_cpi_runtime_suspend, imx_cpi_runtime_resume, NULL)
+};
+
+static void imx_cpi_remove(struct platform_device *pdev)
+{
+	struct imx_cpi_device *pcpidev = platform_get_drvdata(pdev);
+
+	media_async_subdev_cleanup(&pcpidev->sd);
+}
+
+static int imx_cpi_probe(struct platform_device *pdev)
+{
+	struct imx_cpi_device *pcpidev;
+	struct device *dev = &pdev->dev;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	pcpidev = devm_kzalloc(dev, sizeof(*pcpidev), GFP_KERNEL);
+	if (!pcpidev)
+		return -ENOMEM;
+
+	pcpidev->dev = dev;
+	platform_set_drvdata(pdev, pcpidev);
+
+	pcpidev->pdata = of_device_get_match_data(dev);
+	pcpidev->mode = PI_GATE_CLOCK_MODE;
+
+	pcpidev->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pcpidev->regs))
+		return dev_err_probe(dev, PTR_ERR(pcpidev->regs),
+				     "Failed to get regs\n");
+
+	pcpidev->num_clks = devm_clk_bulk_get_all(dev, &pcpidev->clks);
+	if (pcpidev->num_clks < 0)
+		return pcpidev->num_clks;
+
+	sd = &pcpidev->sd;
+
+	v4l2_subdev_init(sd, &imx_cpi_subdev_ops);
+
+	sd->internal_ops = &imx_cpi_internal_ops;
+	snprintf(sd->name, sizeof(sd->name), "parallel-%s",
+		 dev_name(pcpidev->dev));
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &imx_cpi_entity_ops;
+
+	sd->dev = pcpidev->dev;
+
+	pm_runtime_use_autosuspend(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	return media_async_register_subdev(sd);
+}
+
+static const struct of_device_id imx_cpi_of_match[] = {
+	{ .compatible = "fsl,imx8qxp-pcif", .data = &imx8qxp_pdata },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, imx_cpi_of_match);
+
+static struct platform_driver imx_cpi_driver = {
+	.probe = imx_cpi_probe,
+	.remove = imx_cpi_remove,
+	.driver = {
+		.of_match_table = imx_cpi_of_match,
+		.name = "imx-parallel-cpi",
+		.pm = pm_ptr(&imx_cpi_pm_ops),
+	},
+};
+
+module_platform_driver(imx_cpi_driver);
+
+MODULE_DESCRIPTION("i.MX9 Parallel CPI receiver driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


