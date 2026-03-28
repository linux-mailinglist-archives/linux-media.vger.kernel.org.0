Return-Path: <linux-media+bounces-57425-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK3LJNiQx2kDZQUAu9opvQ
	(envelope-from <linux-media+bounces-57425-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:27:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7534DD12
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 09:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06967304B3A3
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2026 08:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D85A374E47;
	Sat, 28 Mar 2026 08:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tn0GT3WG"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8437472B;
	Sat, 28 Mar 2026 08:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686407; cv=fail; b=HUWwKTM67dO36XUApgVPUtSwWHsG+0SAQ34Myry9yxNXZ0O6kmx92NAgjXMyHd4QY2LWlTjxrJlISTX7VmFbSpehttyUPpICRwd37/TfedV7iJrj9pBjBeMw+6WpfllkNxgPTUk9K2bXCIbivkMFf5mKfqKCdYTX+Nt3neMSXcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686407; c=relaxed/simple;
	bh=17QV5jAcv852NLZSV1QDM4exj3j3/QP4oT5e+71t4Zw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WXVgqvqLDG1Jf4o/WQcDJBanvDYTGEhBXBn9UfVhb9EPgfoq8VVMcVBGD5diAmd5uVJI1Y+zvS1xLnO/lx3jwurnK+Q3VBeKQhOVcikIrye0AIxLAEF06pFEBtsk5Fzys3QiNonA4qUkMz5C2Zrv0BD5t7YHAggQCetwXCytvbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tn0GT3WG; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXzEsfBnezCWF8fAnOFvVXUZHxvT4OjM9A+m83NlJCT7CxIWaIRMcMwQV8BVSfIFXIX+pf6CfdVsq/GkAqViyCG9AtQ7VbuxQFgqprTH10WiOhnZkprb1RvQcQu/9cvZ27fEVLywyahJlUDkPNxmXsbHCKrqAthec2nIZMm9rh5HZ5U0dnpOwHrH+s0B2XGsh65+ySjuzm1uOZfZ68UlNZyGZ2pm4OU3B3Am5bQfjMj4sRUyT+egjdeXg7Qwo8cnjnmA1kyHBMMeVmW4VA3dfnYLHkKJnCWInWilQLncK1In/2XNorEJsNvwwjHpOM+vc6eroCnlptmyCStYv9dhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+cNd1zjbqfXQPVcuJDWIh4a5RZFpw+GYf3QtvMfaxs=;
 b=yrpmAhCIiUQWMK+QV+bgR1QeYfBurZdxo1a+4EfCYo3Y7MT8/tqpfFsPXwHrCZqYe9o4hR/3vRjBFbjH6HC/s8mLKvBoWiyikJ4wdwNtdhY1JytNqfj3hOUwXvlg+AkJ/3y3HOAutp0Ft1pzPTNT6f0Se3LjT+JroGXEYu5WVM6b09zrHifeGh+FTXPjPrQCN4F3HAKtU2cU/WQPD+dFGxmEvl0Bh4gKpjrTQN4i7boT/EH1Pe/6SoRguXfyew+9aVcvZGR4/yegR/41DArb7IysVSlVVvGF4XWJDp1hp0Gmm+vjHS3ZZslvM+nA6SIL6P8vrFB+HrolPd8ijv55EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+cNd1zjbqfXQPVcuJDWIh4a5RZFpw+GYf3QtvMfaxs=;
 b=tn0GT3WG0K8TEwuKsrDLHy8ELVUhUiS1ESFS/3bbA5ceFa7DKyziXeFxpCRb5bggqPlpaeg3KSyqNDr2HfwWS7WBaw1v6wXKXh0Y5ScHBOEoF0Do51UkpAONUngUf5vnjSC3CyGqL04bQezbvOGKpGGrKAqMCMoNAREtMtCVh1jPdDogtdJtH46ccjSEc+r6oiZbRQ+UgQAD9EqaCRzu7BT5Iaf59rmlTLo/1EioZD+z+EhqAZIcYFu63IN4CydRkxGyn/qvSpNlABq/QsttI2rh/C9OcgCvUOxpA4yXfl8x4DwBbA7j+dsaAMlF0h7eYUtbP1DbLqNYqhO3smcAsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10569.eurprd04.prod.outlook.com (2603:10a6:800:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Sat, 28 Mar
 2026 08:26:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9745.024; Sat, 28 Mar 2026
 08:26:42 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Mar 2026 16:28:32 +0800
Subject: [PATCH v3 2/2] media: nxp: imx8-isi: Implement get_frame_desc for
 crossbar subdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-isi_vc-v3-2-a03b9a6fe117@oss.nxp.com>
References: <20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com>
In-Reply-To: <20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774686533; l=4533;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=w7S1A8iPdc97eTpGmkhOdDTok5hCAvrqm502P4xAX80=;
 b=qwJEuDfWvEh3lQe814hPgnqwgU4bGbfZ40Cd7f4lfuZ/z8/ZwUwES+tNoGCMfrMhgF8kRAUee
 R5V6dSehuu1AqEWL0KxxH/UqEXGjI9mn27BsduvX6EHG4L+vFbo0eP7
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DU2PR04MB9081.eurprd04.prod.outlook.com (2603:10a6:10:2f0::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI2PR04MB10569:EE_
X-MS-Office365-Filtering-Correlation-Id: c17a948b-adf8-43d9-c251-08de8ca3bd69
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 Sr2U2l3pW9a2pZ/R4D0pA1M3e1+rC16boQb3IWVtLcfLrHXprc1ATjrIdaB6Pnb/vH4UYTCrNk24fY308/fVxCFhWwCXYizkqPVrxLISZjQPY2XUzEaU6sQtxRSB+gttf/ordyeo633zfYGmwABXPspVTgyh1pSxefgZ3US+F/fxve0KOGyGaZ0T/bmbJLuDwwv/yB9c7cEOhwde2mHPzLisy8kPRz6N3qHrbcFHJT8hfLnAvuwnSx2gVy2pfJVL8gqCBBVoUi9qBMub7S3DVUYR+zJXjsF7QugLbVJCnqy89gAzw8ZInZkge6FvQkvF6JUD3xP0u+aJqDvDWo5CNXCKKJl8vPeOlKLNXson15HeF7AyF+vTGMR6i+4WMYqS/kOlMSbZwxrVJM3I9bO2dQd2ImRwjetfRjFdEx+IAQz/ukJAdw0WH86n/kfGO/VMsoW0bXdZGaz9JxmYenTbuozfC+vTieQ8pxhruk2O8xkHoZuELNgEuQ6/xyNQHTtt8tvlidH+uuoQty5VyCFjGgXg9vMGPJmuE5qUvtvPd6KqXKrOqm3jnADql/KOou9tRMu2yrIgYlFz5eiKw/6XpW+UPfALchGoYtShE+sgIrOHo5qRwNlx5aDsxVUNM7xZeW4pMbregODEQoZV8QULY1XSHh8E2sx/rxfrfp4GCYYI5b3gGKjFqXLEGxvFrH92CDIiRJ05EWWK0n2QFpNXjgVxRqKYStv4WKTeIua8LR1r7RjUCf8KBd3bbiC6TQF3kMhWHCXrHNwwJyq60p7/vrQf1LugGXxRh1suXP3NbS0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?alBXc0YxOU56dHpQTERsTmVYbFUyU2NtbEk5MHVBb0tNQkw2aUg2bnpLZmJN?=
 =?utf-8?B?MmZiSUpQdWlDUVNuR3NQanNIRFErWUxERVZ5M3I2Z3ZoK3dUT3JWbmltZEhK?=
 =?utf-8?B?eUhQSThqN214VkxmdFRYNGp6UFJWRmlZMHZKamczaE1jTmJ4cDlBQk1GZm03?=
 =?utf-8?B?dTNTWk9NT0VNTHRYd0N1NHZQSGVkbVl4ZEJJVDNNUmZCZW9ZaW9abWFybUxp?=
 =?utf-8?B?YWNMK2J4ZkY1amlsTHl5aU40NTJzMFN2K0xZYUtIWmNyaXBGeTRFYW91dlJM?=
 =?utf-8?B?aWxGNjVhV2VRMG1pQXZONldNNEtCTDVVbUx0empwSGsvQTkxUStvbklicUdq?=
 =?utf-8?B?UnZNRURjZ0I5elNoTmY1V0t2Q283SFBYRkkySm55QnhhTTVzMWhKTFBndFNT?=
 =?utf-8?B?UlpUcmV0QXZRQ1dZSFFSdnlwOURDcThsMy9iaXBCcThueTR3SWNpUm1zTUJa?=
 =?utf-8?B?K3VVaWdnZlo3NDA0bHZPeEl2U1V0M1lxNytaQjFrS3FlNzQxeUlldXpMN0U0?=
 =?utf-8?B?eEJETEtjUis4WU9xSmpiN3VLTjdCYk0vWExyMG93WUFwSnE1aHNHajI5ZSth?=
 =?utf-8?B?STZra1BOVHR0TFMrR0xwRVlYaUlXbzZHNlFlVnRTZVNjOVZhQjhlUzJhQ1N2?=
 =?utf-8?B?enRHcGtrUlNXRWJXbCtUbXdwREkzNlBDVXFjajFnTXlseWkzMFVOa3FRai9j?=
 =?utf-8?B?SDVzK0JvbkZwTUNCSVdNbVlDajVJZVdPR1FqMTIzZjVPU2ZsdFJIdWxKUEdG?=
 =?utf-8?B?Z3Y0ZXZuZ1M4MzZJVDNPeTdDdXY3eHhrQnBoV1hrbm5OUHhNYVBDVllLTCtP?=
 =?utf-8?B?UkVFaUJQSkgzMWJkWlJEdUN5ZnFleTFPQVdQRVNjOFdnaDBwSVV4clpneFZK?=
 =?utf-8?B?SzJlUTVtOXpJZ2FpSkF0S3VzZGtrMU9OSXlMckRnK2UzNmVuanVIeGtndkFY?=
 =?utf-8?B?dElQM0lQdDdpMjRpcTl0TnZTekVzOU1NUUxPT0w5WEJUWEtHNFJrcytSRUpJ?=
 =?utf-8?B?d1VRM1BPc1BVakpLQWVRVU9zOFYxNElNSkQyUERVSkg0b0xwZTR6ODREOXNT?=
 =?utf-8?B?UkVST3ZacVRZc2VmSVVCU0d2SFlza1RiK0ZTWlR1QlFiR0J5WndUR1pNZlY0?=
 =?utf-8?B?eFAxbzF4OUlhczVmZ2Fhand5MjFSRHBQR0syTGpaMWJ6dy9jZU1USklYVDVz?=
 =?utf-8?B?ZmRwUWVETTUyMWd4UTJ5c3JBME5LODJUT0w3MXAwNnJ0ZDV2ZmdVb2pLT1Mx?=
 =?utf-8?B?RUM0YXlpMjkzODRVRm5BOTVEeVNEWC9tVTJoVTVuM0xUSFFSV1Iwc2k3dzZv?=
 =?utf-8?B?YkoyOG9kNkVGZ0FTZXlsWHZ4OEJoeVBicXN4MFZQamlSdWlWaXhETDY5UkRS?=
 =?utf-8?B?UGd3OUNHSEV1TkgwejYrcXBVOFpJaXFQYTNUcmxDZ1VidmwyalJCa3d2c015?=
 =?utf-8?B?OWorV093VWNsclJKeU9iVjFadFQrcGNKVFIrWHlTTjM4U29nbW14MDlZNWFq?=
 =?utf-8?B?eTRmUldWWnVKVm4reDFCQ1p6aC9PSWFEcm5vSVBJSkpnRHFJdjZuYXVBTks2?=
 =?utf-8?B?WmoxdEczMnd5M0NBcHJZOTNFMkhob2JOTVo5cFAwZk9zMnZZRDVDRWV5UHdY?=
 =?utf-8?B?NHZxd09pL3BBcmNFaTVDaXhsc1pGb0tnb2FiVExlZkc1N0Nqd2ZGejI1WU1P?=
 =?utf-8?B?aWlGSjQyV01rWHQyZWhFRmJLU1A1ajJLQWJjeWoxMzB2ODhOcnRhWHRYWFB4?=
 =?utf-8?B?NnVVOTh2eGpmQXg0dGZHM1dSZ2w2SGlEMDBMZlkwSExIRXViMmxCYWhXYlVp?=
 =?utf-8?B?NlBTZ0xPK3crbVdCK2ViRVRXUEtOc1U3U3RnS0xlYy9NN0VsK0hJQW1Kc3py?=
 =?utf-8?B?NkhOeldiUSsvUzlMYzFtNnN5L1Uzak5JclliS1RlN0ZHMVNzblZGcEtCU28w?=
 =?utf-8?B?NHVoazR5UUNzV3gwdCtDQW11am1YeXdaRWswTGwrOXd1NGxPOStQQVpXOFlt?=
 =?utf-8?B?L0V6dEhVSDVFbUxTUTNnOVFRQ3h6elQzdUxpOHZUL0pmd2QrQ29xQkVtYktu?=
 =?utf-8?B?TzI2ZEJHUXhuNUREajlmWGxPMUJkM2R1bG5EOUpQOEllRTdSbmhLSW95cndW?=
 =?utf-8?B?QlgzaWw2OFA0azJEcmJ3Yis3d0JBYzltclIvcDZMT0JzWXVLQlczSXBsQmZ6?=
 =?utf-8?B?VE5CQnQyTU5uY3lvTmtGM0liNHpZaVBJWEVjeWRGVHV3WCthLysvdXZjczly?=
 =?utf-8?B?WEF0bHBBS0RRaWNLeDhEcndOWjNkdkNlRkFNS2V0dUgvK1pDK1BmU0lqdDh5?=
 =?utf-8?B?d3NoZVZDSW55dm9IMEJZRnFpTTdDLzlhTXJnUVJtWGgyRHE4bE0xZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17a948b-adf8-43d9-c251-08de8ca3bd69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB9081.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 08:26:42.1456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8YAXpKZ1qtk2i7JC6iGXuK+Cf5SeVNthwGOzlB6F3XXdtqJLIuypncsr5bobrhA/A9JeVI1POKqbDIsfvNckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10569
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57425-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 1DB7534DD12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Implement the get_frame_desc pad operation for the crossbar subdevice
to propagate frame descriptor information from the source subdevice to
downstream ISI channels.

This allows the ISI driver to retrieve virtual channel information and
other stream parameters from the connected upstream, which is required
for proper virtual channel routing on platforms supporting multiple VCs.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- New patch added based on feedback from Laurent Pinchart
---
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 97 ++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 605a45124103..2e98fedbabc2 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -306,6 +306,102 @@ static int mxc_isi_crossbar_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int mxc_isi_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+				  struct v4l2_mbus_frame_desc *fd)
+{
+	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct device *dev = xbar->isi->dev;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret = 0;
+
+	if (pad < xbar->num_sinks)
+		return -EINVAL;
+
+	memset(fd, 0, sizeof(*fd));
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	/*
+	 * Iterate over all active routes. For each route going through the
+	 * requested source pad, get the frame descriptor from the connected
+	 * source subdev, find the corresponding stream entry, and add it to
+	 * the output frame descriptor with the routed stream ID.
+	 */
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc source_fd;
+		struct v4l2_subdev *remote_sd;
+		struct media_pad *remote_pad;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		/* Find the remote subdev connected to this sink pad */
+		remote_pad = media_pad_remote_pad_first(&xbar->pads[route->sink_pad]);
+		if (!remote_pad) {
+			dev_dbg(dev, "no remote pad connected to crossbar input %u\n",
+				route->sink_pad);
+			continue;
+		}
+
+		remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		if (!remote_sd) {
+			dev_err(dev, "no subdev connected to crossbar input %u\n",
+				route->sink_pad);
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		/* Get frame descriptor from the remote subdev */
+		ret = v4l2_subdev_call(remote_sd, pad, get_frame_desc,
+				       remote_pad->index, &source_fd);
+		if (ret == -ENOIOCTLCMD) {
+			dev_dbg(dev, "%s:%u does not support frame descriptors\n",
+				remote_sd->entity.name, remote_pad->index);
+			continue;
+		}
+		if (ret < 0) {
+			dev_err(dev, "failed to get frame desc from %s:%u: %u\n",
+				remote_sd->entity.name, remote_pad->index, ret);
+			goto out_unlock;
+		}
+
+		if (fd->num_entries == 0)
+			fd->type = source_fd.type;
+
+		/* Find the source frame descriptor entry matching the sink stream */
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream)
+				break;
+		}
+
+		if (i == source_fd.num_entries) {
+			dev_err(dev, "stream %u not found in frame desc from %s:%u\n",
+				route->sink_stream, remote_sd->entity.name,
+				remote_pad->index);
+			ret = -EPIPE;
+			goto out_unlock;
+		}
+
+		if (fd->num_entries >= ARRAY_SIZE(fd->entry)) {
+			dev_err(dev, "frame descriptor is full\n");
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+
+		/* Copy the entry and update the stream ID */
+		fd->entry[fd->num_entries] = source_fd.entry[i];
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->num_entries++;
+	}
+
+out_unlock:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
+}
+
 static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					enum v4l2_subdev_format_whence which,
@@ -404,6 +500,7 @@ static const struct v4l2_subdev_pad_ops mxc_isi_crossbar_subdev_pad_ops = {
 	.enum_mbus_code = mxc_isi_crossbar_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = mxc_isi_crossbar_set_fmt,
+	.get_frame_desc = mxc_isi_get_frame_desc,
 	.set_routing = mxc_isi_crossbar_set_routing,
 	.enable_streams = mxc_isi_crossbar_enable_streams,
 	.disable_streams = mxc_isi_crossbar_disable_streams,

-- 
2.34.1


