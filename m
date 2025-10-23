Return-Path: <linux-media+bounces-45357-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233BC003AF
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13B8E4FE7BE
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 09:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBBF306B3E;
	Thu, 23 Oct 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XTFbLPpP"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88802306495;
	Thu, 23 Oct 2025 09:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211193; cv=fail; b=NIFRSX3SOgLtD5bIfhkaO7GdeKR+6526zzqHq3i4dC5SA3oYaPbjL8zNZqKdFBa4l2VRziV3xsW2EQnNcFVZJcHKPftqJ0sB4JSoxKd1qjoFm+zrV+SDliS6H2+wtIvP0DNFLnlj3l4TXs7fodxT6TlV2htGJ9dHShsdRg4PqZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211193; c=relaxed/simple;
	bh=aNBKdhdz0JvXdBIe75X76oWvJKKuFziqs5s9nHAhgt4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jxE1gBj9Rxu0iFZeFzQSOnnCr8A1KS8tYYc2PfiWI14C11/kqXcN6H6eVl/FfX/sulxjou9zT2YpBzMDByQXcCvdX5kK/0CNd8/t4NPNvRzXSx+Ig5xtGLe3su0rZchxUubGhL2Nlb/ziHaz9qPboSssEZgotAeeCOTQjtMM2VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XTFbLPpP; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSjfaDlFCqngVt2ptSMoNTN6tvqjqshRmfg7pZAiXwv2HUQzFwT43bPFHlMfOCpXoVnx29LZ37dYzOGkJswA6dJN4YZ126W4+qsl8lfF6zoQY1Vk0yqMUpJW5J+QFjk0ckNBkENo9V3ZWhNN0b3yOuJFKQpHzVCJCIiMDgi2rrgiky/6KkD5/+W4/NQMFkSFWXOymbkSL8YC7YuRx08uCSW3rkFvqWi9hafpGJo0teIltTDROVm5zgeZQY2SEt+/TM4GGP4ROqEZhdM/aFbkTa32iCiEPO7irWJqDiUASNgjYDvvkOBKsIEI7QuIIKOwN+yfdxdeEPA395uaXlL1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTTZIo0cYsn9RXGR8Q8kIeYKfifPVyFlBR+i6n3VyJs=;
 b=KCneGileD7sT/9xnGn9vj883bgdb4xx8WwHZjmPjfdEpSSS0nb7E42UK0YlUMSKyY39QRMA23CLpt/tkq4ck6vu1cledq3k8JDU5DPV/eCD+DN9F7o84P/CmiwkZg6BCYu9Zylb+lTaWthKrUNrCSz8sGD8NkbvFbP17Ekw4NQwguChCxehRxvwDpa9ZgS6nB6WsBvGxJ+Fo+qzGybgNAm6+tOqHjtteLAGRP2lKukEyw0YJw+lhokGRucedu9JXkf2uHSwkQa3GVSACcvtzmQMaTOe4hR/9zlgurGA0NUhKg6btcWIeQ+xWd7KcsBie/KlqE+m0WuD2yUBGOQA6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTTZIo0cYsn9RXGR8Q8kIeYKfifPVyFlBR+i6n3VyJs=;
 b=XTFbLPpP5+h8N7PKYcYj6sxiz+5aJs7Lu0yKydnIGHBp6bDHGtIjMjj8j4xBHOfcxZyEYsSmabIKEV2/iTrXmIozZKv0E2nHqlC1USDzC99KiQs6tlIJfd9fKgTqVueFOioPL+UeDz30D7jHniH8zlWD8ekXbNVSrOzDOcysxKWvhDmeLmzM+OZVqvPAz99SAHaP4Zdfiyu+oKYtjeyGyfB+xfibK6WiYyghje4gBDZ2qv9nwEMGuxDCoUXLLyPqoKRqJqyE+zk+KstJs2kJKP7/+y1HJEtzia6izccjbHz+5kyiw6IEFlUA9EOhEqhX0eB9O6DlD5vF4z0AiDyIkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com (2603:10a6:20b:44e::21)
 by PA6PR04MB11946.eurprd04.prod.outlook.com (2603:10a6:102:513::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:19:47 +0000
Received: from AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798]) by AS8SPRMB0023.eurprd04.prod.outlook.com
 ([fe80::1394:27d9:e69a:1798%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:19:47 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Oct 2025 17:19:45 +0800
Subject: [PATCH v7 4/5] media: imx8mq-mipi-csi2: Add support for i.MX8ULP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-csi2_imx8ulp-v7-4-5ecb081ce79b@nxp.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
In-Reply-To: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761211202; l=1147;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=BGnQQeD7wtCE0qBCwxCRj9F8bTqtisvoWUzjpco6j3w=;
 b=R9ropRlSLvf1nKaDjGAp5qQQBjoqsPOGA71Iiu5KyCpjhwfERRIftlkVeJ1wiHWlJUOzBND+3
 GINRSn+Ok9nBwVBmXtOQ+PGcP4osfIyEQDEqskGOmmMO3uho18xlw73
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To AS8SPRMB0023.eurprd04.prod.outlook.com
 (2603:10a6:20b:44e::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8SPRMB0023:EE_|PA6PR04MB11946:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbabe5a-db7e-44e1-0fd1-08de12154f96
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WWlNa3hWMG5YZHoxYVRHbmN6ODhId2sybFBJNGJxazY0S012d293RWVqWEdl?=
 =?utf-8?B?MXN5RHYwcDd0alB2aWVwQW1pV2tFZjE0VlMyVjhLWHIxUS81QnY0QmRac3dv?=
 =?utf-8?B?Q1pLODBjaHBpdm16bS9PdVdWdnFsY3FpYjN6eHFMSWV3cXlOWitWKy93aHF4?=
 =?utf-8?B?UHZjeG5GTlpjZ1A0bkdNRUg4K3c0czBMUjlUUTl0VkIxV2lOYkxPQU01anFM?=
 =?utf-8?B?WEVHV3Y0SXZPdS9iL2hobVVHNG1Id0VzMS85UlRBaDRjN25URzBUeVEzdWxx?=
 =?utf-8?B?SHFYWUlrZWJ5K3EwcUtKYnB4K1JpUXBvbko0WlNJYnVCYU1Wd0VjSGdxNXho?=
 =?utf-8?B?ZTB4WXJRbnFjZFJadDdmRU9tQXRGMzFwZzdUb0UxZjJaNXNxcXpvUGZjRk5h?=
 =?utf-8?B?WlZuRzB2ZlFQVHlIZUFJWkVJSFA0bGk2bGNpTlIvUHlxenB1eXIyN0JEVlh2?=
 =?utf-8?B?bkwyOTEwd2gzQlpIYkxVNFVyZUkyWk5jdTRZenZLM3VSSXBOS0JkalNPWk15?=
 =?utf-8?B?Ump1US9USnlKSE1nemQ3d2tpTmR4cFJkMmFldzc1aTJHNDBReUtnTmFkVXJ5?=
 =?utf-8?B?N2tlU2E1ckZwVFZuZmQyRVVkYU40SjdsSml3L2RNUG9BSXpJOE1iZ1M3ZFFv?=
 =?utf-8?B?T3AreVdqcE1WS0Z0ZUhDMFNoYU9vUWtwTU9xZWdIU1lYZ3B4dUN3anhjeGc3?=
 =?utf-8?B?SmlkWXZyamVMUjRJdFVwZFVXZlVidDJEdEhpK3IyZXhITzMrU1BiSXJMWmZz?=
 =?utf-8?B?UUVQSnFqYWRmbDB6aUxBRVpWZ2x1bEZJNktNOERCQ2hpV0krRTFXVnVlaGhx?=
 =?utf-8?B?VW9DNmg1QXV1SXFQdlVaRUhNS0pUbDlQdnU5b2kvOTZIRFJIQUlNRHFQSUNR?=
 =?utf-8?B?REd5WUcxMkFNa1pDcXJWUnYwY0hRNGNwdzUvVXk3SWdHVTQ0S0U4NEtMcStz?=
 =?utf-8?B?NlQyNXMzWm40WU5wSThXeWhvNDkvWGJGY1VxaFl6alNUWUY4UTljYTgra09a?=
 =?utf-8?B?dE1BZ0R2eVdwWTNXS2oyQnMwM2t2cm1ZcTIxbUx4ckQ5ZXJNS05wMlRZekR4?=
 =?utf-8?B?Yjdya1lpY3FWMkg1ZDEyR2NqSE9Jc0Jqek0yMHRXaEpxdFpKdGs4Q2x1UjNh?=
 =?utf-8?B?UHVrVkltaUF1V3NLaTdOMHMwMDhlNGtaaDhmeVpaZUdna1pkMlRCdjgzdjM2?=
 =?utf-8?B?QVBYVjhBQzVTdHpXMitTTEVVK255UXZzMjErOFhPS3lKeVdIcFZRUE94c3Fk?=
 =?utf-8?B?RlNZVDNuTGI4MmN2bjNuT3Q3Z1RKd0pTUnhGN2M1NzJSOXBXVDlqOGgrY1Fq?=
 =?utf-8?B?VnVvWm1PMmpkTkxXYXl5U242ZW1hdHBWN1RIZVBaV2lVM1FnaDJMZThtQnZO?=
 =?utf-8?B?QWFKV1lqRS9ocVgzRjdyWEZTdUEwalRxVGtRNTVOK1FudERFOTk3SXRrdU43?=
 =?utf-8?B?MFZuTTlmYndXTTN1VFZXTk40K09Wc2l1UzZtY3B0WXkydmRERWQ4ZkpnVXNj?=
 =?utf-8?B?NEdnUFJjQituTGMwQm9MVkdDU0xVNDZKZEdPTEpUY3BRWS9jL1k2ODZwRGgr?=
 =?utf-8?B?NVpxMEl3Tm1XSXdhZHZQM25VUER6aW04MjI1cjl5a3YwQmYyQUMxd1dVZkFO?=
 =?utf-8?B?RW9yZThQV2g0Ykt0NzI4RE1ReWlyeXA2RmhFc1ZpbUFWSmJGb2dCR09zRG9w?=
 =?utf-8?B?RERKRXI4NE9mWnh5VWIvVXBWNXBnaW93bFM5YlgxdzNBUGNTdlY0Z2ZPYk1v?=
 =?utf-8?B?UDhORS93Snh6ektBMUdwVE1sS3EyUFFHSDlreTV4V0piYTJJdWxrUUlLclV6?=
 =?utf-8?B?QVg0b0lQMXBCTG1XcHNoZzZuR2lqSkkzU0lJcmxsVkdOMTY5cmkxYUhXQm5q?=
 =?utf-8?B?UkxaSElhL0pzaVlZVUFhRzlSTkJEakFjY08zM0h2WFdkbS9QdTY2Mlh4NXZr?=
 =?utf-8?B?RVpxNFdzWWRJcStlL0k2SG9OTmp1SzRJSlAxQjdMSmZ3ZXdZanBDN2lLMWh4?=
 =?utf-8?B?bXd0U3l5cURpaXVXOW02TnNJNXplV0RxZFNzSWZaWXQ5eTdVTXNBM01qZFVS?=
 =?utf-8?B?SFRtbCtFTFMyMGlzaWtRZVhMRFB0ZzhJRDA0QT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8SPRMB0023.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T2h2elVVakFrNEN2S0ExcGtXb2VaM211bWcxZzQrSVlFV1BLVVBjdi9nQys5?=
 =?utf-8?B?eVh1RlJqVEUrSEc3cmVGQkozalh0cDArNWhYSXdRSmNNcXN4Nko1blNjK0sx?=
 =?utf-8?B?dzFFN0YyYlgwYWpOS1JEZ096NE14cXpZa2RMWTZJQ3B1Nzh4SzVjN0tFQ250?=
 =?utf-8?B?amYvb1VCSnJJWUNMWGRUVkZLLzErQWtkcWM4L2d3V2RpU1dldmtoeU16Y1ky?=
 =?utf-8?B?VTl0MG5ZZENtYWRsM2lwQ2NLcHN1OG5PSFBlTzlrVDFjdXIvNUh3MUtCWlV6?=
 =?utf-8?B?ZzJqUiswSzJSWG1EdlhYNHEwb0F5ZnBPNk55elM4ZG5qaVVoUVR1bEtsMUp0?=
 =?utf-8?B?TDcweE1ZK3pic2ZJYTdpeDhaMWZOdXdBZmlQMDRRL2R6ZnhvTkZXOG5EMDVW?=
 =?utf-8?B?aDV3cTNaU0QyV2RYM0E0dVdVWEV5N0FYWFI3SzBqdDJad1M2QTJwK2JqN0E5?=
 =?utf-8?B?N1JMUzZEZ2FTNERZZDkzSVJUbGpCeWE0RVloRmN5WlJuSkViaVJwOERoby9I?=
 =?utf-8?B?ZElVUWMrZkxSRm9RQlRtYlZueml3a1dON05nd0pRRUkzTHI5UnBhL2dhK05P?=
 =?utf-8?B?Q0E0ay9OQVQ3NnhlSXRTUXJVZTVhVXh2MEJpdHRzL2Q0VkZWNjRDR2hlQ1pG?=
 =?utf-8?B?bUd2UHJRSi9QS3NzL1N6NXBNT2tXZFp1SUxBKytoUlg5QkNuVkJoWlpkeitG?=
 =?utf-8?B?MDB0b2tKQ0ExYmZQVlA0czdmSjRFdklQV093Z3lMbTYzNU9XUFZjYlllSzNQ?=
 =?utf-8?B?ZmtEUVZoOW1iZEFHaXJzWStUWElpd2pnSWc1emFERUtodXV2a3dTSWFJTW1h?=
 =?utf-8?B?UlBuZ21vbytranhuSzgzQ0ZPYkVOcTd6R1lwZ01CT1Q0dWw4Ti93cVU2VXV2?=
 =?utf-8?B?TldOSDgxbWJONXEwMHUwTUxzMS9OR1dWeTBtRExJRjlaOFlJSjhtMGVRV2g3?=
 =?utf-8?B?ZzRoNjNYSkZ2VW14NEpYRFE1TC85K1lqYjIreHRsOEJhUW9scW5xa1ExcTgx?=
 =?utf-8?B?eW9Hc1IyVUxsZHM4VUg4cFg5OVNBbERxeW9ySmh4d3hzRVlDMmxRVmpDWTNI?=
 =?utf-8?B?U0ZtSzNydGw4MnF3STVhOEI5QjYxUGltdzIrTmpnWlpSRnJXWXpLQ3V1V0Jn?=
 =?utf-8?B?U0xwWmwzSWFwWmQrb2xRYW1VdDdaT0M5VW9NaTdJbXA5WDE1RCs0YnprSW4z?=
 =?utf-8?B?Vnlnd2hnaURjQkozWkpZYTR0SWxaUG9tYUR5RHZobHBjMHR0ZWw5YVlQZzRr?=
 =?utf-8?B?blRhNEU3bXU5cXFjS3pnUUJicnk4SU4ydW0rZ2diQzhnUHFSaXZVZ0VOVm5I?=
 =?utf-8?B?eTdLb1J0ZFZEaWRwYnRRWDBLejhMNUhiZ3FVajNreWEyYzdsaDBQcjliVEpv?=
 =?utf-8?B?L1F2cW5ZeU4xRDN2d1Q3Tjc0KzhCQnBzUUQwSG1JSVdwbHlrYkI1ZVpKZ0N3?=
 =?utf-8?B?NFk2VEYxenYwOWNkcTRvZ0hpaVJSZ3ZET2RnZHRGT1lIczkwenZ2WHpwWVBR?=
 =?utf-8?B?NGtsdCtQRmtUSnc0eTdQdFZhZDROTnhjKzRiZE4xbW1VWTRrNCsrVlVFbFBx?=
 =?utf-8?B?Y3lEdkdxWENkOXRiNGZrNjVZVllFWDA1R1RpbkVveVZZWWdWRE5sRTNMTTFU?=
 =?utf-8?B?b0kvMzBHUGIxeERlWmhxMGI0b0RYRElTSElpSWF4WHIzaWw1Sm84SmVjMGc1?=
 =?utf-8?B?UitLaDJUeng3b1dRR1RpNzlrRVBlQ0JnSkdTeHV6YjM0d2NKckptVFlOK1p4?=
 =?utf-8?B?eXRoQWh6dXF5SHg3UHBZUGlIbU1ROFF4c2RJOEpaZjBLSnE3OUcyMXVWc2dX?=
 =?utf-8?B?TUpxd25OS1drS3h3dEc3MnlGUEUwTUlKaTBEQXNVaDcrcHJrdENCTHVTY084?=
 =?utf-8?B?UjJYOXN6aFBHcGFtRlQyc1IvMXJiWVl2cXRESlVyYTJ1cmpmb2xPVTlzelcy?=
 =?utf-8?B?akhsdERHREo4aytDQlB3MzF2alZna0RHZXVFdnFOb3FLVHVRaURNQjZ3RXox?=
 =?utf-8?B?WDFOM2MyU1QzcWQ1M2ZFTElQekVhNGVHcXVtR3RDYklwdWg0K3VpOG9pQ1NO?=
 =?utf-8?B?LzVVc3FEYmpVZjVRbi9wY0hlZ002WVJwQnhkSm02ME9IQm5rdm1mODJwUWcr?=
 =?utf-8?Q?3BL2DQDkm7BtYIK4vQBQKsmCM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbabe5a-db7e-44e1-0fd1-08de12154f96
X-MS-Exchange-CrossTenant-AuthSource: AS8SPRMB0023.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:19:47.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tjayyVofkS5zEK+brmm22gjNTW/iHTslgVoRPm6tXs8KTm8RRm3v8yuXIqU6AT5eCz5i1QcaqtMkFGJ8e4ljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11946

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in i.MX8ULP is almost same as i.MX8QXP/QM except
clocks and resets, so add compatible string for i.MX8ULP to handle
the difference and reuse platform data of i.MX8QXP/QM.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index fd788a7f48e5feeff658e3d2347db6fefca5d0cf..d8fadb0f1b6b670110ee98a74cffd56a6c96592b 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -1069,6 +1069,7 @@ static void imx8mq_mipi_csi_remove(struct platform_device *pdev)
 static const struct of_device_id imx8mq_mipi_csi_of_match[] = {
 	{ .compatible = "fsl,imx8mq-mipi-csi2", .data = &imx8mq_data },
 	{ .compatible = "fsl,imx8qxp-mipi-csi2", .data = &imx8qxp_data },
+	{ .compatible = "fsl,imx8ulp-mipi-csi2", .data = &imx8qxp_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx8mq_mipi_csi_of_match);

-- 
2.34.1


