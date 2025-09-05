Return-Path: <linux-media+bounces-41801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6AB44E6D
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5053542089
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492652E03EE;
	Fri,  5 Sep 2025 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DVg91q7Q"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF82D4806;
	Fri,  5 Sep 2025 06:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055407; cv=fail; b=NYqPO5VcqzKMnWqUOR/QCMkdgaJ5fS2nag85vZ+4YSNPnA9DZ81til2QvezmQt9nYYY/ZFB9bnko0ako5VerP3Ql9ngyKDxjKGP1OnUf3tCF6Er5Dr9Mx2G4Fi09gFYqHxBIXbGRHJO8nKjrjUn9l/gT7wfJxMRX6veA/7TWZ74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055407; c=relaxed/simple;
	bh=1zsZXSEqJlvPbhPXwpQ9307DR9I2Q2TZUkphxaUeLVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AbodXpBMYMRFwUfHXS07ahtPLFWQMaP0KS20U2QyFyGYmdGYqahszUKGqxUJdTK59aGkwO0CcYL5sXvKOfsO/TpbO536/L4aSEIdRt9bGSEG2yTImfGltsTSr9XF5S8OYEj9cULGbh31a3o6+Jiqfb2hYK+oQf8SZZb1xTG917c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DVg91q7Q; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qO8RFeZtw6bw1xyqU/6cNp+6XAMw5A4xRx0kT4+7baQUSXX84qNHijRFUxAEpfUbk4zRYEQEAM8U5aDfb0rnLYLpqE6yhJcL/hLcYKmKrUxOdGvnGzyhKmqvPInraAwi8zXjkR2CxgcqXrzKrjY1kJBHKPiszBeafvrJ9XU/eSp+oSoD88NmqJ0DQzTdOHG8qkXtERBGtgQ/iiFde7H63xBNy1eoZO8LnH+DJCmLvScr03ytfLhxn93AgpWpzp8oeu+0zxBIDSb3UarD0I61esWrNEPByvPUOoWpNMl9tZ5m9fdYwcyUcYMLZh5tVh2A2fMv/+seJ947UOIe4UnWcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qz4RxWIbyfCOYvEGl1M/qUrbMazxgxq+RX4CzYviu7U=;
 b=meXDPpKHMMVmVSpvUv3ipSxoRaQvkzTC7t+NHMTwh31VaSUpuh2tCV7w87k9EPiWAL9LnHWIOlo4VTUm87+KXhk/6uD1pTZzSEYOoM3hPUQp8cdJt+uMvAG0vr/KSZ1jaDNGegh+R7zT5B2vBahskOTbcwfkxSDKJaybjVWIDSLzfWHZPmxHVRaKd+WOTmwbHcsfxGZdqv14cUDvKksxOyciQtdIkYdUPaEQz9SZVtfWvp0KJoC669ummATVBCXame9o5hcTiXRv+EOHZ/9q+VuTYWYhBY4grvhPZnXD4XBLpDrZagX13eVJ+EvANwtX5h8P86IOefXvqrDVXYt/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qz4RxWIbyfCOYvEGl1M/qUrbMazxgxq+RX4CzYviu7U=;
 b=DVg91q7QzZMS0P/DDul4z9W86AWx3qa265nA+psmCgdv8wNPBt5svFwXemtWSduDxjaFx2xoOPWCjVSKVneGtvKi5OqyAOg/0pYAolBCw1JkJ3UqfA5oFb7s78jy6p+u+40qSbiMTQpbp7enSYRE1s93JenYPFUHFaoRiZDSqe65q6/HSjiPjO5+hmoz8hIr/AWRyNX9TiTBifSvrSk2LUC+yeB9Y35kyRs3X8//slH5VlnXNb8Y4cEJVw1RaWL0maKMM9+w86F8z/b+t0AP/+egd1RvjNRfHrR75c8z8VU21Q8H9sIIDVBZQSylZw6VjwDlm4o53nbUquZHyEx4Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:42 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Fri, 05 Sep 2025 14:56:02 +0800
Subject: [PATCH v2 5/5] media: nxp: imx8-isi: Add ISI support for i.MX91
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-isi_imx93-v2-5-37db5f768c57@nxp.com>
References: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
In-Reply-To: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=2197;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=1zsZXSEqJlvPbhPXwpQ9307DR9I2Q2TZUkphxaUeLVE=;
 b=AbHhZMDfVBpiDXWJl/jW4odP70S48YGSWixa5Mmxtof2ZEGvhNCMOZf4QKg7LF3EpSbDfSv3Y
 xpN5ogSJYJ+A2DGFrn5UUaaWNjmmNmUR6xlN5ikhsGAXvz8T4g82ps5
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: c2a3b6d5-cd14-4fab-9e07-08ddec495ee0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V3FzckpXQUlDWlMwZnBBbXc5Kzg2ZUZjVlYrV2Z0cTRRZWhFdERVclp6aDFW?=
 =?utf-8?B?ZEU4ZlZuUFY3UUw3ZVhYajlpbjRhdXNZdlBaOEMrVXdRVTV1c0JoQW5MZXA1?=
 =?utf-8?B?VkthMnBCK3lQSDU3emF2OWhkVDdydXpHSTF0R1Y0cC9aMG00QnJFZHJkTnZu?=
 =?utf-8?B?VWVQekZyandPbFI1NENxWjRsTEpueWRqekMxeDZQbEZLdG1yYXVQWEhEdWV1?=
 =?utf-8?B?eDNWZDRZWTZ2TWI5WGdKV2pqTXcveVNLWHlncHJNSXdBWEtSalVqbjl4c2lH?=
 =?utf-8?B?OUhsdDVjaWpkTndaalNwVzg5T0JvcDR4OGdRR0ZRWHRYMnF1V2dpdm5yM2Zm?=
 =?utf-8?B?U3NvYTB4R1FPS2xJbmtXb1Jjekx3V0hwa0RESGVwanZDZng5WWI2SklFZSta?=
 =?utf-8?B?cHV1YU4xdS9vRzkwU25YbEJoQklaRGswYjlXaTlHTTBMOEwrU0wrUkhIQytj?=
 =?utf-8?B?elkrbVFpTklHZDgzQ0RsNndPQ215cUF0VDNvZ24wdDhVdm0wRGI1ODE2LzQy?=
 =?utf-8?B?eWczeHlPWmVqdEs1ZUZ3SGJ4Y1d3amF6OWl5V29QKytvTzNwVDJSbERMRVd2?=
 =?utf-8?B?ZXI5NXZQajVkNHpKZDBzVldQRXpQOG1FNlNsNXB0WC9TZGpIMmdkbUhPSzdv?=
 =?utf-8?B?RHAxd1VGQ2h6enBpdVdWNDlkMkhWTWxkVURaK21KY3ZkQis1YnR2WFE2TWNT?=
 =?utf-8?B?ODljNjMyaGJ2UnVsbUxPRlEyUERLdXRVNEFnblFzejd3ODFyZHlTVHI0ZzF4?=
 =?utf-8?B?RWsrVU1PV0tuUVcxR3p2OVVMTXBWUWVSb3djVEF4bDZ3U0JwUlBlME9JNWxL?=
 =?utf-8?B?SXFZYkIwZ01QbTJZeDJFa1d6MU92K3MyZlBlSTV4QzhWK1ovVi9ucExZVC9u?=
 =?utf-8?B?eGY2ZUk0cElVN0g4MGl2VDM0REtudVBUazFDOVo0RGtubkpPZy9kM0Q4VlBP?=
 =?utf-8?B?aXBjVGs4aTdLbG1WM05WQmZlMEdqQXRQTFRZZ0tVQVltblFpMFU3Mmwxb1ZC?=
 =?utf-8?B?VTZTNFhucG1VY1dHbzZNVnowc1FpNllHSU1meXp2ZXB5OUlvZGV2bklSZGdN?=
 =?utf-8?B?ZkJqVXhHY0RzbU9laVRVSEdIRWRhMWVhcXhMV3ZOVzVhT0hJL2VSLzFUZS9Y?=
 =?utf-8?B?TGFQaVdHSHUzdHVhRWpxa3ZWSVd4KzRGamFXT21hb3hEdXhrOWlWdGlDdVds?=
 =?utf-8?B?ZXRPMXZmeWZBN1ZrUUYyaXBHbUZKK0o1SnlmMCt6RndVVngwNXAxYmZSamVx?=
 =?utf-8?B?OWh3dG1mMGRweGszbUF1VTVzcndOZU1CUndBUWFOaGxENzlYb1VjLzY0TzZB?=
 =?utf-8?B?eFlDQVI5OUliY2ZFTVc4K2ZnSlk2SG5tSHN4aU1GOUcrc0FLVXU0SnE0c0Rn?=
 =?utf-8?B?M21aOGszVjZwQ1hoY0ptRjZ2VGdUdEJPT2VGUzBoNXVYc2krZzd2eGJOdnAy?=
 =?utf-8?B?b0FDZmpSMVJibm1iUTF6UkVncjRobXI5M0ZoRjZsQ2dzY0E1ekJ5VnlEL2Ru?=
 =?utf-8?B?VmlBNk84UUI4bWNpdWRONERXTE1NMlRJMGpMRFhVcWVXMXNhQjYreVJxM0Jn?=
 =?utf-8?B?T2hQSjJOVTRoTmtINURTVi9CZVRJMDg1WEZBYzRvTlBLQWxlblVEb2hCMVhX?=
 =?utf-8?B?TzR0OVd4QW1QVHNYYi9QaVQ1OW1MTnh4YXAxWlBMNFRETlJuVW9udDdCQ2JS?=
 =?utf-8?B?Q3RmQ01VNTFoRVNaMTA5L3ExL2hTMXg1VjR3TklraUZBVnRRMk03dForNEp5?=
 =?utf-8?B?UW9ib3Bvc0xUYlkwVEZwTGdjQUhPb1pLN2pnT2syNVd5K2w5MGZHb2o0bEVN?=
 =?utf-8?B?YkQybjVaWWRXY0hKYjBmdFh3U09jWlVOZ3hsYWc5Uy8vdFlVbU9XUVBuakJq?=
 =?utf-8?B?a0N5MkhDUVI4S0NsM2hyNGFrKzdybWFiUWsrRDFaektSem1uVE1rL1ZIS01D?=
 =?utf-8?B?enFDTnp5QmxLeUxpVy9PNkIzcjYzdU5TMFJJL1prL1I5UHBsNTJLYy9KT2JF?=
 =?utf-8?Q?Bv7Srmbrj+F3u7mlOLra8QKp/JdyM4=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Uk9Gbmw1cFdJREF2RlZqQ3pqUWlYeGNjd2kvVzVnRzdRemx4Y0NoeHdPeWtk?=
 =?utf-8?B?TzFDZFhIQnhPU0lsbjRMQWxKNUJNQmV1MzU4eXJFU2hjQ0pmbVdRTG85N21Y?=
 =?utf-8?B?VDdmMmovbEJsQ25KQXYwRVNFMlQxS2RUOUJzOEV3U1NLbmV5QkthcUZvN2d2?=
 =?utf-8?B?emRPS0NRalJ3QlVIc0p4RysvVkg2dmMyV04vejk2MGlvVFNGUTlXRUg0UE1t?=
 =?utf-8?B?Y01la1dvRkVrQTRnZElIUElxVHRKWlpwdnNLeTQyS3JJTXhjalluUzJWVFA4?=
 =?utf-8?B?M2tFcnVobG9zS29oYXkrV1ZqRzhOZ01obGFmUkRGQ3JMUWdEVjNBK2pDcFlH?=
 =?utf-8?B?UnNPZ0M2MER3djRsOU5TQTE0ZHNFUUNFaVlEeEt6cWZXRkZMUWJXRlhaR2VG?=
 =?utf-8?B?a003Rlh2VEUvV3ZwK05OalNjc0NMQ1hmcnNqWkJ2SjRTMTgraTJBV3NOeXdo?=
 =?utf-8?B?Z1o3VzJEc1dkK01CdGdLYWhWRFhxTzZCcHpzYkdEU0dDa3B5QzJoVE5zRUlj?=
 =?utf-8?B?OFNzQnpyb0xFenN2cGRMVVRSRk9XYUl0bGhaWXdPSVNLZmR0NlA3aWRyV0t2?=
 =?utf-8?B?NXg4MWl4UFJyaVZhdE9PTTdtRVZ2VkxIdlcxSG92ZlhsamtQQjdtckJaTFBw?=
 =?utf-8?B?djNzak9hbWJlRWhGMzNkcVIxblhHUUgydEcrbGw2VU9XaTZQN2hPV0lBVzdD?=
 =?utf-8?B?ZkVoaXFFb2pXcE1wSmFpVnFCRmYxWTYxT205bTJ3VzhPa1NJU3ZJaTY1R0V5?=
 =?utf-8?B?RkRBN0dqTFhFRlhBT1BLY0VzbU5GT01FcXprUCtpNXNHK0szeDdHUmtGUjZj?=
 =?utf-8?B?R2NuM3VNT1ROZ0FlZU00Z0srSFdpME41MlBmRFJ3OGpNT2RhNG93d1loa0s1?=
 =?utf-8?B?K3cvYno3dERSbnlnL1VnQ2RzR3NOZ2lDa1FFZzQxbEZYMDNQellmaHZVZVgy?=
 =?utf-8?B?TzBvNUVxbERESXFmSWVwdzdhOXh3eE1YSDZrREdhZDhtSDdhRnYrbFJrK1l3?=
 =?utf-8?B?d3JVaER6ZmNjMXhmSGduNnc2djBmUlZGSHNlTmNsV2dzYmhrRFIvUEI5K2JW?=
 =?utf-8?B?UEJmQ0Q1a1Z6ajk2OVF6b3F4M0x2SjFFNDNMeWZpUC9KNTA2OVIvRUZRVGRM?=
 =?utf-8?B?Sy9uM2hkdlllamNPb3MySWgxZlZ5OWQvQU1OR2s3Rmw2ajhGeTZrSGFRdUlt?=
 =?utf-8?B?eFhWS3VuajNjcUg5MGJDL3N5OHlnVExtbU5SYlU2N2ZsWS9vRXNDVHFhbzVJ?=
 =?utf-8?B?cXRPUlY4TEp5SEY4RVcyNkl0YU9PVm84dGhBemVlTk5JM3pxVUlPMk9CcUNy?=
 =?utf-8?B?RU5YcUg5bWFTZm9Jd2plY0JUMnNkaDRSWUgrTFJudWdFN2FGK3B4eHlOak1r?=
 =?utf-8?B?b3Q0dzdkTkdnK3NVRjk2aVJ0dWxzRmxaMmdRd1pyNTFrWHYzMlBNTFdsc0N5?=
 =?utf-8?B?aldBaUxTd3VGS2toL1ZpeHE2Y1ZtdURjMUhHWVJ6clUybnRQTUh2QjBiejV5?=
 =?utf-8?B?RXpNK0dTRXVRTzhnejVzZGhZQWZnWmUrSkgvZXdkZ25uR245NHN1UEdobXRj?=
 =?utf-8?B?TU5LbzJIQ1F6SHZlblFxNTNhNVF6ckR1cklqc0Q4Tm1PYWJqOWl3N2htbkxZ?=
 =?utf-8?B?R3FrN2Z1aHVZa21DZnRDc3VocFYyalBWaURYQU9HSUI4c0h1U0FYV3BDSE9i?=
 =?utf-8?B?WDNmUE1EZkphZG1kTStWSzFISW15anNsaXJUV2NhVFoxZzM4K1dUdUV3VnRK?=
 =?utf-8?B?T3R0eWN3NXJvVXNsS2xQc2NmLy92Wkp1VVdnQTVLREllRDRqMFVXQUtrV1px?=
 =?utf-8?B?Ni9hZTNUcUEwT2pTUnM2UTlQNW51Zm1VM2ZIMXdJV1BiNGhkZ3FORWJRRlh1?=
 =?utf-8?B?anliYnp4RUNSQmdjQStmUmJXamk2V1I0MWM3QnBhekVVemN1K1dDM0loTThq?=
 =?utf-8?B?blhTcE5oeGM3VkgzUE42R3FxMWVBOG5SN3o3MWpWTEFEYkh6OFFmbFk5NU1l?=
 =?utf-8?B?cE1sU3loM1hWd2ZKTU9hMmFTM3R4MGFQOUxXQVFDUjBZQ3lENXZUK0gzNmlq?=
 =?utf-8?B?dS84ejBVUHBUV0plbFJqWGp0ZmpISVUvOStjWmtHYTdaOVU0MDhXNDNieXpr?=
 =?utf-8?Q?J3Yeitma37+Jm1cai8zU9B0Qp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2a3b6d5-cd14-4fab-9e07-08ddec495ee0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:42.7418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlK1CIRgsQ3yCofQOkJGoTJWi/lpBEzYDzEbMSfvXeDrtgG6VoMI643fhuLFHe4X6LSenmSTcJ2OO3sYTjiKoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

The ISI module on i.MX91 implements only one channel and one parallel
camera input. As no input source selection is required, gasket ops are
unnecessary.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 12 ++++++++++++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0155c75983f02f33f7f0669e73188222ebb5e816..c3d411ddf492eb27b372763ce5d344a90c6ec524 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -347,6 +347,17 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx91_data = {
+	.model			= MXC_ISI_IMX91,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
@@ -547,6 +558,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
 	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
+	{ .compatible = "fsl,imx91-isi", .data = &mxc_imx91_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -160,6 +160,7 @@ enum model {
 	MXC_ISI_IMX8QM,
 	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
+	MXC_ISI_IMX91,
 	MXC_ISI_IMX93,
 };
 

-- 
2.34.1


