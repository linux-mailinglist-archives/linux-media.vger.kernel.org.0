Return-Path: <linux-media+bounces-25693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CFA29738
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3173F168018
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E711FECA3;
	Wed,  5 Feb 2025 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iIN+iKOF"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62B1FF1D9;
	Wed,  5 Feb 2025 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738775978; cv=fail; b=FmGknEfLcVIMf2O2MoD7WX6Ga6gnn3dC0mpT5YuXvahua6Kav7VfCdm7QYigsyH2qcqwW5e7DE6BuYRApz2WgRJZPCD97YqSC+Zs3w+8RscojTSURhZBpC3Lpv/n4bFCLZtj+qs/Gb1cyrmLLJe4BFnATEcHT2Zyt2ghkbDdaMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738775978; c=relaxed/simple;
	bh=Gm6CcMPA5mc4+vboVRbc4HVWURGFOQPIGYPaLtF5anU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nx1BMGpJQiWUgE1s/eovmkxel3ASFRc3/xBLCwQJLV7EpsHQmG3Oa1gUhh5atmp7YlFT4q/qKfgmcoQc9J9caOZ8NSI+x8i66ArF97aIE+Ela8YnXeZ1M1EcrPIHLyVMX5pK4bYKQxyENiakBsWdUrWGL1PSaJQtwDqTfHHli/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iIN+iKOF; arc=fail smtp.client-ip=40.107.162.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFhhe4DlRsHY71MP3fGd5cHzZ2qZIVPjGpN4YhnMrNpBHQiNhARPgHNdukm3bHcYBuNZ4GvL+xWNOQGkNKZcMOV/EyYYiLnrjwn6jsShX3MYDYULjqfHu4n1/WeTCSGaNUuvJ2zcOYbQwz3pGu6SRJqXWyqifIvIExrpxCEcowUba1YmZUps4WJiTwlR/m8pe/denD30I9d4e8YefAl6Yso8Y9SnwbmqxwncIIbJ3saSjUkFmtgZQjLjADUWrcqGVyE7cHn7vVKFqpsRc0aoRrL3oSf7svdCPF0+XX2OpoSYU+I5NFSqGUXSsGs28PYdGZo9pGQFvyt3V20pb9Pvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=donUNJocA2FYZ/hMtO0UtACgvKSPgfpjpEO/4nsATaY=;
 b=qIU0BUqYawWZg20fTJTXjMEwFabMFhWrZ/bCfFLZF0eb1SM3L3IXLMqSjgmz9nUxtXp42TUHT8R0qx7EtV4MpRbTBGOBgZpSCQWq8LWypxJRR2KmdD9bkwyUv6O/G58AF0/DAdeAHoQpmwzsg8ymiTgk53Gc8kOHqGHvXcd+v3eBh1Tyb3DLamdDSCR+KEAxvlSpKElwkffce8OA0VISLAnMOG4W+tPbYpzC37pp2Pw368YGVjekTuIme9hGiCRfVe4Ebyw4kMc3X+gg4O/zTCCIsB5emaL3S5UKlcKJ5FhoPSA6vnxRKinig/52BuK/u3v8MAckVmermTdsOomm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=donUNJocA2FYZ/hMtO0UtACgvKSPgfpjpEO/4nsATaY=;
 b=iIN+iKOFBc0/JYTlQa929GqNzs1mobfQAQPKqSBwDd0KRJITGGbWn9SUXDmkw8uP0roGbF8GnEYQVFjO1SXGf4+ulybQ98+iMLZrmh9I5n1aEKhA/EFemFaFDTK7b2c21SFcd7r37JmHl8NBq9g5mmXZ8SaQ93Pn0tXYHvfHUiV22H3QoeIeCbmajwpNBGl9dwNLA4caP0L2Ua3tsmxVzrMFd/ziu7LdKT6IdqetRNkGTIRMa8CU8PtPLUJAwEdR2LpkE8uOWxv+UjgKO7uT0P6zXxKmBAsmHy8ayCU6qT0635crdQyXe1aSfEfhAuDMcdfCfneEEJhVVn+aDhmerQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10546.eurprd04.prod.outlook.com (2603:10a6:800:274::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 17:19:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:19:33 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:17 -0500
Subject: [PATCH v2 08/14] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-8-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=2332;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wHYM5d409qebj/8mM5wcqQQ+pF550mrssdrGWO+v884=;
 b=yQQN1i9IIGUwlymUcovsS/Rc2ljq2fEeQrQ90WgKlDMpEWOfDRFZ+hrVdnuAGUzc69N5Xuvy1
 N6G88/Vh0NIAK7c2Q9tV/cuo6El5f/EwjHLXNsFBvbPg45CwvjGjhAs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10546:EE_
X-MS-Office365-Filtering-Correlation-Id: 81925056-40f8-43a1-2047-08dd460941dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dWVndHFUZTVBVnM5Vlh3dlJPUzdIS014K3lGcVRvRXVHcWlIRjlwWmxoWVkw?=
 =?utf-8?B?cStscWJWd0ZkcW5EYVNtL2dwbGt1Y2NoNDAxdWZldzFiS1R3dGUwS1QwbzNV?=
 =?utf-8?B?RDl2MTl4eHNxbUFYczRUbUFOb3VqRERkNERKcjVJaW1XZXdZdHk4UU9VN0hB?=
 =?utf-8?B?VHdrYjI1dUpEQWtWYktyV3hva3BMdGRZZURtemNyOTFEVnBYYXU2WVhWZmt3?=
 =?utf-8?B?NWZSd2E5VklkV0NyTFd2MmphY3hpbE9PKzdVbDFqWjhrdEtLT1JsWWF4WmNj?=
 =?utf-8?B?OEJ2VWZvcXdZeDd1ZHN2a2trR0ordkI4WVRIY245cU95a2lRUXo2L1hGM0Nx?=
 =?utf-8?B?ZU12S0srMEh5NFRVaTZubjlraEVCeXAvRWpSSlRhRCtGcHd6TlVDWUgycGF2?=
 =?utf-8?B?SlRGdnJ0UGFTRDBjNjFMeklqQTlGenByL085UlFWREtSTDcrMllWMFVPSnBR?=
 =?utf-8?B?SGpHSFpPMEdYN0pnelBUc2prQkFKSi9KK1kxTXFXeERRZ3VuRXN0Z0k3TUlH?=
 =?utf-8?B?OXFDbXJxcXd2RFAybnoyd09MbmhuYlMrN1k4clZSeG9SVFVkTTBOZmRqeUFS?=
 =?utf-8?B?TFJLbDFTQkxCM0ZuZjJUKytqNW9lUzRTNGdmQklhS1g2WGw4eUo3eUZVV0xR?=
 =?utf-8?B?a1g3SUZhMHZERHJmckhKM1F3dWNVeXlWU2V6U05wVWQ2VXFRUy9pZDI3R25X?=
 =?utf-8?B?UE0veFl1aXBrcHBoTXlYS3VwbG1QamQxQzZpYlhxTExORDZVeXFHaWdQMlk1?=
 =?utf-8?B?dW5SWHg5ekpKRjV0aW5CSlMzZUQrdGdTU1IzTXdwRVErR01reWdtUmNVK01Y?=
 =?utf-8?B?bmxvN3FEN04yUmpoUmRBRFh2eEdoVTAvYk9Ccmg5eEE4NzZzZUk5YUpVdTlJ?=
 =?utf-8?B?N2Z1THYzck9xWTdoTmh6TUJzNHJQa3NadUNFNlNJaEdrTkZHUURsWTdEbEdH?=
 =?utf-8?B?aFZFVithOU1qcTYrVk1yQkhyVUpzOEdFOFpub3hERHNMWXd5RDN6Zi96MnZG?=
 =?utf-8?B?djE1ODMza0FMZkd5ZHkyUTFabXYzUTFPSkZvVGFzRXQ1WGZDOTBRc0d3MlAr?=
 =?utf-8?B?S1R5dHB4RG1OY1BWOFNCaWNiTDJmZE4vK3FZeDlESmFUZldrdmdlK2RSRExC?=
 =?utf-8?B?ZThyUVRQNFU1MzEyYlVUbGlIc0FkSlhiQ0h5Zmk4N1ZieDRTSmNBQlBjNmR1?=
 =?utf-8?B?MGdtZnlLOUptQ0tQbEJrVzNzRG1Ha0Rtd0lyRlhocGJMM1dMejcwaUVmb2Iz?=
 =?utf-8?B?emltaXUwUTh2OGEvYTBHVitqd3hTNWdCeDMxWGVGWFFXVnNCdUx6YmRoTWRn?=
 =?utf-8?B?RENyUGMzWkprNCtlamI0TVo4V1lIeTZWQ2tPNnkvU0NKMFpDM0FiS21ZSGRU?=
 =?utf-8?B?Q05TRWRLWENUTFpUaXJGaHNlRkgvQW1pcng4aEQ4TkNhdm1JaHZvL2kxRk1D?=
 =?utf-8?B?aDR4U3RmVHZJalRRenVEODVwcDlkdlB5TEZFcG5VUm9RaEJIWHZ6WUNUOGhj?=
 =?utf-8?B?dXAxczYyY0ZDbzgxZGs1MDdMYy92R2x0a2ZIejc5d2dzTVRnMnZpTlp3dnlO?=
 =?utf-8?B?bzBOdzU1MEMyV01JTEgxeUNaTk1lNGJxRE8wRm1Cd1JCZXNST2kxNkJyYW9S?=
 =?utf-8?B?dURkSzJPSk1TMDJoWUZ1Y3FMT0ZOS29RUnh6YnBDbHFIYlVLaXUrZ0RBZk42?=
 =?utf-8?B?N2pTNXlpRmd2bzg4aVlnM2U0TWRFYUZOdytnc0h5TmdwZG42amU2SkpaNVdX?=
 =?utf-8?B?bVlUOUVSSkVzTGdvZ0hHZ3U0S2svZGdIVHpwaHNEQVpmQUw3N2ppcU5PNnFM?=
 =?utf-8?B?Z3Z2NVdPZ1JPcW1WSkI4QW1ZWWh1eWdGRXdaMzNoSlRnZWp6djgvQzNKeVU1?=
 =?utf-8?B?ZGVZTWtYNi9mcU1Idk1LWk5TbVp4Z3FIM3ArOGxXYnN0UGdLSFVkSjB5OEtI?=
 =?utf-8?B?enpkamtVYUJGdkxFTjhNLzdCTXJreDVhNERyQ3MyMGFMODlhczhqZkdwUE51?=
 =?utf-8?B?UVliYktlZm5nPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cmlyVHV3UXQ5SytiRzBuNzF1cUNFcDQveEtjekx5dklMNkJPR2EwZkk2WUw3?=
 =?utf-8?B?aU82V01MZEZUcit3NXgxSlc2SHlOUEV2TGRmdUNjbGovMTViZldEK2pjeWMy?=
 =?utf-8?B?MGNpcm1WQ0R5eUYvOUYxOG1Bc3dvNWNtQ09qb2lxVk1sWFlCVHNEcVdJbEd2?=
 =?utf-8?B?T3U0NGd6bHVOTVpEaUFUWWJVNUlYUllVaXJnMzZ6eXF4ejdwOXRnc0g4blQr?=
 =?utf-8?B?TWhFVUdEaDFoZXpMSHZEd0tqa0ViK0p5VlJlUFFHVW52NlBaNTgyUUVIQ0Mw?=
 =?utf-8?B?SXVRSDN1YkIyUldwdzJFYTEwUTVoRHE5S2VaL05URDRFWUhoZ0FxQnZ5M0c5?=
 =?utf-8?B?YU5XRGZHR0dBeXNCaTNvTmpEUUQ3Ykx3aTB6TitzL0Rva1JZcnhVdDlPUlVv?=
 =?utf-8?B?Y09qRXpNcUpvT0dScWtvYmw2cVRGdjdLdnQ0YWo1dDQzcjg0cFJ1MmZUNUZF?=
 =?utf-8?B?SUZKbm01bE1QVmpVVjJSNDBRSFZEZHlubml5TXNqeDJtRDE3TzdWN1gyRjg1?=
 =?utf-8?B?Y3hMRjVJUjllWDFGL0lZUVZSRDUrMFJVS2hmeGxQdCtKbEZTa05lQi9xSTlZ?=
 =?utf-8?B?THhsb3l0a1g0aTgwdmpSSmJ5cThOOHByazZUZEEwTWp1NHhVMG1LU2YwOG5H?=
 =?utf-8?B?MXZQVy91NWM5N2JoUXFDb3k3S3VKT3RWZHpaRURzYmtheVIxaTB1TjFKVVRD?=
 =?utf-8?B?SkJ4bTRxOVZRM0tLeWV1NEZOdGIxVUxnUVdvb1RTUjJPQ1BBNjU1blRKUkhX?=
 =?utf-8?B?cU5SZDczbGRCZjBBOWp0QzcwdndpLzNKejcxODVWZ1pCR1F6YlZrYmp0ZjN2?=
 =?utf-8?B?MEFrcGg4WVhFQTQrWkFqcnZFSnpDSXZ2dnhRRGpJbjR5c3FiS1dQQ0xKVHN1?=
 =?utf-8?B?ZlhQdXZLbHhsNWVjZk1pVkJUVmZzN1VxTy8vanBGcGRrZjFkTWlZbzF4dDlU?=
 =?utf-8?B?OUt2emlXUGxKQVFRZ3lCd051TlJyNUdlYy92dmtFZEovNmtMZXBQcEZrajkz?=
 =?utf-8?B?T0NsSDY5Sm4yZjVwdUE4K0prMzdoZEFISkp0YmNQVVgvZkUwWk1kaThtN293?=
 =?utf-8?B?QkVHektlcnlUSytMY2JxUTZMZVRRNkJoamc4OEJKQTZzVVVvWElIWkNpSFBx?=
 =?utf-8?B?OG01SVVwSmxZQlg2NmVYRzFyd0oxcUhEQ0NFZFNzUzB1RHFhYzBOQzFMSk1R?=
 =?utf-8?B?TkF0a3hwR0szZ0pnVlgxQys2QitQUGZyOTNCSFZLUkFBemFiREg2ZHk4bzBH?=
 =?utf-8?B?TGRFb09jWlNVZi81N0JwTUFHMkJNbVE3WlZaNjZTak9Oa3ZJUzVBa0ozbkFW?=
 =?utf-8?B?OVNUL0djcExJQThXYStLNGdqL2V2dlN5YkJQYVJxMnRMVklKUjljSGJrU0k3?=
 =?utf-8?B?azcwSzFDUUlHcFlmWS9rVjZCZW90dWxaNC93VnU5MEh6SFdCOVg2SjdPUFpk?=
 =?utf-8?B?dVBJbitxUnVheXpxWVZjaW1vL2E1d2U4K3orMy9sQlBBd09veFdnRGx2b1Yw?=
 =?utf-8?B?LzNFMWtsakVUM2ZjVTM3cDVLSzNERllCWWVLejhmRDlLU21taWh6YnN3TnFh?=
 =?utf-8?B?MklBaXFYd21raWRmczZBWlRNTUdOZ05raTRvY0hvSHZSTmRyOUhhZzBZaXVY?=
 =?utf-8?B?ODY2bWNkQzdZVm5mdTdzTStweld5bVg5Sm0zbkNIYzNaaytkbG9jb3Z1bHk3?=
 =?utf-8?B?VVAwM1J4MXlMSEFTRUVpdkp4YXNTVjhsYnl0eHRUTURMajhUdnA4emRyZ3JB?=
 =?utf-8?B?Y1JiMEdpRlM0cUhaUG9JVnFuT2RmTU0xMktXRjMyVW80TjZxcHYvOWhBK2hH?=
 =?utf-8?B?eVhkcXRkbDNDZGFyWWcxbmlUMzRjT2pjUk5SQ3BMR1pJZFc3YUhFZnVBbUNE?=
 =?utf-8?B?Q3JIdzY3elRMNk0vY0tMbzBvdlQxSmVVS215UE1jZ1VEWlBqN2RudzlpNHpo?=
 =?utf-8?B?VzBNN2Z4NjlybWxNN1Y0K0tZTDdtM2x0ZlVyYUF6ZVF0QXJWekxQaEhBRmRG?=
 =?utf-8?B?TmZ4RkVBVGIwQVFqU3BjTGNJQWVGeVRmMkpCZTBnTVk2SW5GcGJIRk1Mckxk?=
 =?utf-8?B?WjZ0QlZ5L3hKL3VTcHljRHRxVTh5ZEh6SWsydzhSUmtPc2gwYW94VkZHVncw?=
 =?utf-8?Q?/0ILgSyS1hT7GoQWE7pgza3hq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81925056-40f8-43a1-2047-08dd460941dd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:19:33.1199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tq80J8A5ZGsKQBYRFfu6glVleogp7lisOIc7cW+oc8tqLx4YGynbP/zmokEhDSx6au9YNmxQpAsp1GLdHqSO6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10546

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
fsl,mipi-phy-gpr from required properties and add 'phys', since i.MX8QM and
i.MX8QXP  use standard phy interface.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- remove internal review tags
- remove reg maxitems:1
- remove 8ulp part
- add 8qxp compatible string and make 8qm failback to 8qxp
- limit reset and power domain number to 1 for 8qxp and 8qm
- remove power-domains change because 8qm/8qxp only need 1 power domain
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 34 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..ae0654027182b 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -16,8 +16,13 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx8mq-mipi-csi2
+          - fsl,imx8qxp-mipi-csi2
+      - items:
+          - const: fsl,imx8qm-mipi-csi2
+          - const: fsl,imx8qxp-mipi-csi2
 
   reg:
     maxItems: 1
@@ -46,6 +51,10 @@ properties:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
+
+  phys:
+    maxItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +122,28 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-csi2
+    then:
+      properties:
+        resets:
+          maxItems: 1
+      required:
+        - phys
+    else:
+      properties:
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


