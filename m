Return-Path: <linux-media+bounces-33179-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF80AC12C6
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0BF1C016BC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E76E22A1D5;
	Thu, 22 May 2025 17:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C6HBtYL3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F681A3148;
	Thu, 22 May 2025 17:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936629; cv=fail; b=Vpgu5qd1vzBRn4eD08/hLAOe/V81+TG4zGNYzYElMIXeUgk2ioIsk5C/4DIDdCXe/P+fXm9AIjz2R/EwjYiAfK3snD9FjOTkLhaym9RyTuAJBT2j5+QGNlGf2GeSCYSvMZzGUHVrlerxUZp0uAdI6Q3/btQJ4/C3jMkqUhlikcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936629; c=relaxed/simple;
	bh=dbvfHs4Y1u0Z4nbcX83zBCGc85HmV+AR+iGjoQBpZS4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ppXh4oALThpcaLaYT3G7sElmq+aA10eJKgeim3KjesCkQzkuQ7uVOMQyemhHnpverEnxmCbhWfVRPNvCbFEPewaDp2i+AwgBlc8LkEkPoE3TLPAI6yE7qfdO8DP8Xf9zyvORBkMdar2V5BE/bnyouSOqjq4QBUGA+CY2okHVC/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C6HBtYL3; arc=fail smtp.client-ip=40.107.20.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbZzQixfOaKS/399ARfEjuUfcop8QA3hgziLl+trWw6Lu/peCMoop5e6x2Cph2p+tTgWPe78pGCLFFs0/JGSAsoCzm+90/BBDW110MI0twSA1SaKGJ+zjx5zKq+sCL1QNuspkFQMHXopzL4k5Y9UA7HgJx33NYK0JGEOHzd8gxC4KqIGmd0WwGc3yK2xQXeuRlYZFK/CMF2RsHtM6wmjkhxmxvZK+FuLZnjgnUohjeEUUOuzqEZMWPjuzYaXINyuORY11ygs6TlLpzgz3m3Ey3CRNUeccc4PgCTYiMXsoelykN5AIFmY4rCh1kwwGvLhIM8DZYlnFP4Vx1UCyBCUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VETvqoxvgoeZOItDUdI81FqR1pnbi0KyE/AF7g8nYA=;
 b=RJ4CJdw13VVk/9BGJiv/HJ67neaUmsnM7Hqoq/0yTrbMhmcJUxh5/lknUfpYKyI28JppBXlZFCH60vI/je5WL+0tyg4FemHxY5GCnX2/qZWIm/hJNmgF0TRPMEQDuUYnBM5AfbSh2/CDFs4TeWpZdshRWnqBisLq6+H/yUFgbwIPGrhPglKKP41HAawfbIJlJ/DGKHLOvOfb9G2y4hB5+nu57dnuCcdBSfzGXcgJwE5E+JcQCJ7SrXdbX0s2WUJMs4xmnZ0KK6Gu9KisZlZA1yPu/YyW9AAaW6ir5kZarxIUE/KU3rkmF2hUasAyNMUdwdswBLNv/DDl6B7wXzZl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VETvqoxvgoeZOItDUdI81FqR1pnbi0KyE/AF7g8nYA=;
 b=C6HBtYL3d5D3HZQNgAlp90/kX65TbwWWe5yLtQDajys83vO/Zq1U20ZYPsMH2WxGoSQZEZCFqmgclgTDrSiYR18wV+MUlMELq4tuF5wyhRn/wDyIjlL06JJj8p/Z/WY18mDM/AAGFZ9vcucNmyw67gyosiWGXINqyLBoaHe7zLv0nqLZccXUIU4ajIewZsLrSbcwND4C6e1V+HVWSYtaSfqC1X7pG7ZT4+aw5PXDpgXQ+3+2XH24IJt1Sdf75A+WFnYWRcx1MIzVZXj20LUkB7/SV8Z9Ec3Bz+Ia1XXKXd0md9WS3DB3zNRFzauJzVc6c3IqwVpJmRQHmBK0szWaCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Thu, 22 May
 2025 17:57:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:40 -0400
Subject: [PATCH v5 02/13] media: nxp: imx8-isi: Allow num_sources to be
 greater than num_sink
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-2-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=2343;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dbvfHs4Y1u0Z4nbcX83zBCGc85HmV+AR+iGjoQBpZS4=;
 b=XYssoSUC7BG/I0OwAGTgjZnBdh8e6lnW7eHuduxdXMNhGZsqJ2Zv+/cdF1X6uHLyyjxbeTbda
 M+rfI0mnYYiACM3cn+SvJc+4q3uWdnF8t1rZmvqwdGf3+fr04PKZfwy
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e70d656-1375-40c9-d9dc-08dd995a10a2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Q3k0ZS9sNFNKbks3MmJwa0hxSmZzUHhOdGZvWHNlckZXK211d2kranZwWVRT?=
 =?utf-8?B?NWtvMjMyV09NcmU2OWtvTmhldDFLUVVLOGcxSFJQQUcxdExlR0pkYnM1Mjdu?=
 =?utf-8?B?SFFKbG5rcWwrTTRnVlhTRkplcHRwWm1kMHZ5d2pqOHd0cG1BZnR1V045SHpm?=
 =?utf-8?B?N0FlcmExV3k3MDdwMkx3dlFzZ0c4WjJLVldtZmNOQWZPMGJ3M21TK3JReDIz?=
 =?utf-8?B?L3ZIbzBDMXpTanRRWW5iZGVYdUt2V2dtNHA4VWp1UWxWSjBtcnk5azVTM0NN?=
 =?utf-8?B?WGx6Nnlvdi8vdkNjdERvTlJQSWV1eXE2VzVJaDJYVnZuMmF4LzVsUlk5MWlo?=
 =?utf-8?B?THk1b1Q0SkFQQmMwREZxVWh4aFpMMEU0aFpQckREZGVuN3h3UElSak9hVmtX?=
 =?utf-8?B?KzRqZllSbTB6dDdsVGVXbE5XajV5dU9pZm1TSzJJUFBCUmVITDgvZnhyMFZj?=
 =?utf-8?B?T1k3dE9HNzBlZmxwWmV2b2ljVGdQY1JMRzJvSU5GdDdPRm1lbXhTYkZOMUhW?=
 =?utf-8?B?N2RCcVdsQ1RIdlNiZ1RTM3F5WUR1TCtBemY2QkNzTjBlS2hkSXR0UWFHTnps?=
 =?utf-8?B?cWpPRCs3OWs4WEw4S3R4TVFjRHZxUWtDQ2RFK3pYWnhIWVp6NEhFeW9vUmQ0?=
 =?utf-8?B?cEpsZHRxTUIyZUEyMzZySnFHcWtTVXFqRS95VVhhZnRZT20vSUNEMEMxa2o3?=
 =?utf-8?B?ZUJJeXVDM1I1MzZ1YitNZC9jMnFjRlRNQ00vZHNPZ3hlWUJNcjg0WlFCV0M5?=
 =?utf-8?B?ZkVaVXdjWm9WTk9sUzZSWkRMMnRMWGl1SGdJTGhkbnlSak1SUXZCajR1ZnZR?=
 =?utf-8?B?NDJ5OGV4RFN4bVVKcWw4ZEZHMmNHOUZtdDZqRGd3cXpVRS9CRVArUjlnU2hZ?=
 =?utf-8?B?UjZURHVzcWZXWTU4dnlEYWg3SWhKdGxpUDhXS2xMUkRERzZ1VUE2S3Q3c3M2?=
 =?utf-8?B?M2JhTVpJanpXZnNpK2hGUHF5RlhpWm1YdGJHNWVFVmFaelFFUkZPaUNNeEtL?=
 =?utf-8?B?ZDhPblY0RU1xMkFHZm4xTnJHZzZrMk1yYlcreXNEYnh3cVlVdHBBdUFSdTgr?=
 =?utf-8?B?VkkyNW1KUTBmOGpSNUxJVVltOURBcC92WVcwZm83bm9YWDg4TzlmbFhGOWVv?=
 =?utf-8?B?ZGVnZnBSbERCcWU1Rm1ZUnJ6YmxzcndFZEQ3SUZnQ2FXZUVKSC80QUdEY21Q?=
 =?utf-8?B?MEhqR2kwVS9ob3BYbkZLckVzcmJKZVU5OGpVZ25ZVHkvZHZTUHNSUXdoc0Jx?=
 =?utf-8?B?a0Z5SWYramZRQTBEMnJMTWtJQzNxY2pXa3EreFpwL3FDcE53aVpiQWR5cFhB?=
 =?utf-8?B?SkxWTmthUUUyVkRmQnhqMUdMeURIenFZY1JZK1E3UUtjZktNMWhMcW9xd1Zz?=
 =?utf-8?B?YUwybWtHL05oQjRVVmdsMFZDWVFZSHdLTGdaRGRDNGVjVlhrTnNjektaOGRm?=
 =?utf-8?B?NGFmZHFrbXJZSDQ2Uk5NWGtVOGZHejlqSEtpUjJrc3FTd1ZzVENjWW5uSERH?=
 =?utf-8?B?VmFvQWVWTlJYOUh0OW12Q01aVHhiM05YWjJRdnRGL0J1UmFLZWkyejBDSEND?=
 =?utf-8?B?Yk93VXByL1U2eWxyOXp0V2lPbkt6c2I5NXFDRE00cThDZGVjaENDdENZR0FN?=
 =?utf-8?B?bXhYYWNBd0EvTEVLVTJsemdqS2JJeFRyczNNMkhJM2NtVWMrVmcrOGxWVStz?=
 =?utf-8?B?bFRtRkI3RW1ZVDJ4aUViVjQ1K004Sm4ydVNFenVqMm1LWnJhOU14M242Smxh?=
 =?utf-8?B?QjBtT0t0Qm9ZOGdmZXYzY2RpWEVqRkVQL3hjMFJqV2dFS2dXTSs3UlVZWVMv?=
 =?utf-8?B?Tzh1S1I3UnJhZGtBSFprRUdjekQ2R3daWitnZUpvMnJSL05YLzVQUjVscGov?=
 =?utf-8?B?MG5vZVd1dmdVNTNKdFIzbFpaZWdQS0pud2V0MXk0TjBCUGhqRU9OdVZ6c2F1?=
 =?utf-8?B?N0UvR3NBNFlyMGlLL1F5ZFlFM2pkNDlOZG85NndYZURyYUh6SmJHcFR0Nk5v?=
 =?utf-8?Q?fYDZuKooI8zoKcy8antjtPhkLAy4P0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MDhkMHB2c1lwdVhLTXpsU0ZDbFJ2Tk9QMEZjUnZYVnJlWEo2ZVBtMjVyWUdY?=
 =?utf-8?B?Ky9iQzFHYU5qZnRRM0VpL3RaVVdrK21rekh1Y0pkNFAxNlpsNjNmbGxNMzBv?=
 =?utf-8?B?WDJIem9KbDJabGNmMzZOUXFIT3JlVk05WGRsZ3ppZXAzRzZwcW5RZHpOeGdR?=
 =?utf-8?B?RWRlV2ErZWpRUmVNaEpES081ckw3emdsTkp6ZHRvRVdzSXFxN09DWkFzYnlB?=
 =?utf-8?B?bnNKeGFuTjdDQWFwZDVwcTVadDRGblNWTDFGaytxQzFmMGxuV1kzaW5Fenh2?=
 =?utf-8?B?dWMraDdUQ0xlVU9hb2tSMzJFNXFXYVRVOWk1RHZDSGNlSVJ5Ym5FYW8rV2o4?=
 =?utf-8?B?ODVmU2NtN0NsL3RHUWhRSythZ3dPeEJPeVFEZXByYmIxZ2puV3BnWFNIdlRF?=
 =?utf-8?B?dHMwYXpXWXZwZ1M1eXczTGRpTHo3ZTNRVUF3K2xSenp2Yy9XdlZSSGd1bGtU?=
 =?utf-8?B?OVYrOWVDanB2T0hnRDhESHFpOWlSbXFmNDNOcHZkc2tpaUZvVEc1R3VnVnVT?=
 =?utf-8?B?VVJxcFFpeXMzNW9BanNveE45NEdsbFRIRDd4VWl4QkliVkFpV1BEb2d4dndJ?=
 =?utf-8?B?VVR6anRvTjNqSHc0SjRMYkdZcDZUSzhJalQ3UXMxQ1FqNDQ0UXFmMU1Td1Jt?=
 =?utf-8?B?L3d3ODh5dFc3OGJaTnNvSmxTL2tnNUlDZnd4Z2pNc2JaNlFINDlTUlFMSy9I?=
 =?utf-8?B?YzdnVzlLK0IxcXNuN200VlRWQWhQd3lIaEY0NmljbzJnVUdnL2dXSE5XYnJw?=
 =?utf-8?B?MS8yM2pRS01mb2lGWUVoa1FvTi8xY0ZIdE1jOGtKd2VCdDhTV2cyQkc3Yjd2?=
 =?utf-8?B?RFBVL1NhQnVlNE0wcmVKTjYxQ3ZPWGZId09WanQwWlNZUDFxYTltdWtJSjVK?=
 =?utf-8?B?T1JERTl1K3hSRnVyaDdLdCtPUlc4dzRyQnRidEcrSnNvOHFzMUtWZkphZjMz?=
 =?utf-8?B?TmxZS3RSRXEvL0U3bUUzR3NZYVhTNzI5bGtXU0w1aEVCTytOZFVoaFdVOGxQ?=
 =?utf-8?B?ajJiVFZCMzA4SzBib0U0dm1HVzFHbndldTRsaGhTVkViSE1zVmJ0Y1ZqUTJn?=
 =?utf-8?B?eGxoM1p5YXFNSjZVSUhRMDB6M0NvU011SmlLT1RPZmtIYUw2VU01OXVRN2Rr?=
 =?utf-8?B?REV6OGJ1ZzNuV296UCs1SVlZSkdHbWVydzB6dlUxd1ZzaHhFK01Za0RUZm5v?=
 =?utf-8?B?S09SV2RUR1pLakpMVmhYY2ZkRzJLaUhxeUZkbTZYbUx1RmZZNEpDd0JmQ2E2?=
 =?utf-8?B?Y0R6VTN5R2FHaEYwNTNDdDJ6RTgxd0NQNnRzRHI2M09HMmdFNlRRa2p5bjhI?=
 =?utf-8?B?TDVuSWtJVkszMVhpbElqVlVTRGxTS3UvaW9CbGpvQWFrdW9HZlF0Qk5mRXlZ?=
 =?utf-8?B?Ykp2dkxNRUs0UVBQdGlXRTg1SDlvSENqVWF3azRsbUJnbVRTdFRMYWdNZThV?=
 =?utf-8?B?ZTdSYkxwd2dLdDBNSm1iR1hjZUJlNzhDeHV3V2hQcUhZRnJzdlZ1RlUwdDBo?=
 =?utf-8?B?bkNRUVBvU2FxajlVUmk3eUxpR2h0Y0Q5WFZZaG9KKytmTmNPNW5SZXZvTlVL?=
 =?utf-8?B?YVNEcHRKYmprZ2tLcldiK3JGUDRjK3c5WTZrdyt1ZFhLMlRIdjB0dXVReThQ?=
 =?utf-8?B?dEpZMW9xZy81d3JFbVIwOHBtSTJaWE90dDg3Vk56QzVXS2RLbG5iOXlVZFIv?=
 =?utf-8?B?MHRvdVZjUUhkc3RiZ29WS2VYck5DTlJXc01hSytWRXQyY25aQnNhMmpQeVlx?=
 =?utf-8?B?RDBNd2ltVmpaWVlaOUFDdERyVnpNNjdMRWJOYTd0eEE0NFd4eExvc0UwdTNz?=
 =?utf-8?B?RTU5N3U4dXdtdjcrZFExSC9VZnJKVXZDSzEvbXhhbDFpSjg1dk5aTklsYXlv?=
 =?utf-8?B?a09pbkVBb2R1TU5lczhtaW1hZENoL2pORE1NY1hGNUcvd05sd00wK09FOFJX?=
 =?utf-8?B?R0xRMFEwZWhNdnhpZlViSlV2dlRsNFIwZ00yOVl4RWQxYnRsTVBmSEI0OGxW?=
 =?utf-8?B?dUJ2U0VXVEw1U2ZTVWQwNWQrVVIxaW0zZDBOOVU3WnAxWGQ1TUdVelEwVm5K?=
 =?utf-8?B?OFdQc2JiRVpISklFTVlTNFFORTU3bmc4bVljR2JvWkVrTnpzdUlyMzIraFJJ?=
 =?utf-8?Q?bZMMUePYGvLZKdaRYWqNXlY13?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e70d656-1375-40c9-d9dc-08dd995a10a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:06.3060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIkbaUYdSjULMyAfNaE4MxTbM+FB9om01OOXrmxE+AfrZoiIIuqsja86gtNZ7aGNESF1b9gjl3r4y+6sIYgthQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

Allow num_sources (drvdata: num_channels) to be greater than num_sink
(drvdata: num_ports + 1).

ISI support stream multiplexing, such as differentiates multiple cameras
from a single 2-lane MIPI input, or duplicates input stream into multiple
outputs. So num_channels may be greater than num_ports at some platform.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v4 to v5
- none

change from v3 to v4
- use routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources)
- replace xbar->num_sinks - 1 with routing.num_routes

change from v1 to v3
- none
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 93a55c97cd173..55454445359f4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -188,11 +188,12 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 	 * Create a 1:1 mapping between pixel link inputs and outputs to
 	 * pipelines by default.
 	 */
-	routes = kcalloc(xbar->num_sources, sizeof(*routes), GFP_KERNEL);
+	routing.num_routes = min(xbar->num_sinks - 1, xbar->num_sources);
+	routes = kcalloc(routing.num_routes, sizeof(*routes), GFP_KERNEL);
 	if (!routes)
 		return -ENOMEM;
 
-	for (i = 0; i < xbar->num_sources; ++i) {
+	for (i = 0; i < routing.num_routes; ++i) {
 		struct v4l2_subdev_route *route = &routes[i];
 
 		route->sink_pad = i;
@@ -200,7 +201,6 @@ static int mxc_isi_crossbar_init_state(struct v4l2_subdev *sd,
 		route->flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = xbar->num_sources;
 	routing.routes = routes;
 
 	ret = __mxc_isi_crossbar_set_routing(sd, state, &routing);
@@ -453,7 +453,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
 	 * the memory input.
 	 */
 	xbar->num_sinks = isi->pdata->num_ports + 1;
-	xbar->num_sources = isi->pdata->num_ports;
+	xbar->num_sources = isi->pdata->num_channels;
 	num_pads = xbar->num_sinks + xbar->num_sources;
 
 	xbar->pads = kcalloc(num_pads, sizeof(*xbar->pads), GFP_KERNEL);

-- 
2.34.1


