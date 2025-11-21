Return-Path: <linux-media+bounces-47536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D1C7706F
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 03:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0293B2A3C2
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 02:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1F82868B5;
	Fri, 21 Nov 2025 02:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bYpx0wGJ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D8B281508;
	Fri, 21 Nov 2025 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763692884; cv=fail; b=Tq3lA+b8evnZiAgLzsC4GMjAq7m0kiNr3IFz8d/7dSweK4Y2jvsd+uZtDEMCo0Jp/wVhN9zB5732pZVbS69N0EEvjtIO63ZNtY2fmVukmB4hWi8lE77OLP0k3RVmIbgh5LUJwCW1Q0mvANjU2WJi+I8FlkcWskKP4hlrRUSpCpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763692884; c=relaxed/simple;
	bh=2CimTnz1Nd3csVvlCKC8T1GEFkaFhxB5icEMykgw2AE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hQWFrYB7+RZXl+Bb/8Q6gDKBocsep9LZhOcSC67ZL1cd4AE35mJRPJw6wgZQ+FkWtUNp7+g4U3scukh6O+U5l0XvZw6mIaw15pB3+ODOj2vsQlv7nbgRanKD4fF1+m2nCf2MPxXOM6SMgFROR8I7d0RsLTHYJILuAlOvvvSN8g4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bYpx0wGJ; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1tdLF9+DCq2QlBUSAQlcIdhTen6Q9PG245bmtux4RFp6saYLbG5Rw9v0MX1pzJqoCt66gDFVwHRuOt1t+Ex83LoYoQGdUWrQ5XjW5JZY+JsizXQGZ+jtV1n+mTYQ6E+0XnwUVcmvi3VoEee5Er9aRi9ZyGVuoeEJrRsRdlnH4/HgGoxuGQ7YcdH/DkSsCqfk3EwHFcNXfdZ+akajRGaybOEpS0tAzclm85DzhkyPUUiWcwPUb4y+nqSZRPfF/sfGkz5JO24YpWl2Tno54orlXRfAZKFouREKUEw4vVpdsNYgOo1+t2wk9/gRbH0+82/3nUSi7UiVRNFsGd9hSRBNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCB66I/F3mFfDiW112Et9MaOWRJnddQU3vxOshI5ouM=;
 b=bi5JiVzYuHLehD7n7QkJ+yaiCTKVIoZqoJIBb3DlrIjcyKaqYJ7tyG3t9ruv1a+fd63zujx0mNos6gUS8IodNIJITRNEU/Zt7FimjXr9Xu7eiJMXI2nr4SY/zPGpFAoUAdC2fR+eU8Qo9l5UkflwNqUqT8ypuwyMwlXkW+SDfxpU2D8fbDAv+uxD9ecqgfZY8OMs14USR6CTtjcZDwb9G0MA46pTKHmPkMSCIVneZqwMx7bgiLvmlpon6SQokG5Leh3HsOfKcVLAfj81pBGGdPP2VH80XF8bv/UV1zp6T1YnMDz/18vq3yUiRdg8RSDoJEbCGM2c6PUYa1DxifhHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCB66I/F3mFfDiW112Et9MaOWRJnddQU3vxOshI5ouM=;
 b=bYpx0wGJ3eo+2BIFZT/PFrPdAnplpxLjoDt6XJPBJnN1+IxQTxjJ185IzCEkFjTvSbWnbwmOo2YN2KX7cZlexEOfaad0NZS5fgA7jA4T33Z+gx/2Db2N5wj+TArFkexWO2mbbARj9u5kto8g/5kd5U4uCF2XsEgGNaY9og113NfkEnMmkpfxz6PtWQfpIGnpsho5f7LLP9IzWxTXRFnDp7VrAdOJMJmtCktP+3DGjjwEDNniIN7+MAFcdR/4li0gXyuBPncYrKb5eWHIgIKhty7MYalnj1W4ircfjTRW4OSzH2yFI5nHq/lAs0ItiG4tqBs5zvlkGftTNyTbK89n5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 21 Nov
 2025 02:41:19 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:41:19 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 21 Nov 2025 10:41:52 +0800
Subject: [PATCH v9 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-csi2_imx8ulp-v9-1-05b41b897e50@nxp.com>
References: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
In-Reply-To: <20251121-csi2_imx8ulp-v9-0-05b41b897e50@nxp.com>
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
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763692932; l=3062;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=NP4K4kzXlsKcowmJJhTx1ZLEzcgAZm4BdbbBYySKyt0=;
 b=MRvcm9Il0mItiVQRH7+SRQW7+JHWUyVmCve7n8e6MGuWjFh7hxCDZXSuhynOGh9Tb0HrFJFh5
 MllfhyWTi08Bfnku0Rm5BvauzzFffSKQDlGKkkWxkG9gXF6kNxvtZvJ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfe0824-7ed2-407c-ea73-08de28a77336
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VGt3UkV4Q2RkZmVlc2dBYlFleEJUeW5wSEUzanB3YnFWWm96a0V5Syt6QVdW?=
 =?utf-8?B?K0ZvK25Oc3VuMFdYR21MM2syZlZQdzcvYmxvZU83UjdWTnpVTkd4NmxNUjJu?=
 =?utf-8?B?VDBReDFIQ01RNE5QWFVzcDRZazVHRTRDUGpBOW1KTTBJYzdZMlp3MWFuRTZC?=
 =?utf-8?B?bGZseUpTYU5qS2hMTnAzS3ovYkJMSm1TQ3JCOERmblF1bTVIUmYzbWxJRGM4?=
 =?utf-8?B?S1oxN25pdjlQbGx4QWQzRXhWSVdpeHhYMDVCeUVQcjRqSmpqa3RlV1Q0b2lQ?=
 =?utf-8?B?L0JBQXkxeVE2T3dSN1dDWmkvdC9Yd3Y5eis2RXBsWGt6NmUvSGFoRVhTQzZt?=
 =?utf-8?B?TUxUVDl6alBYNSsybERaRmwyeVZFbDNNcHd0SCswUXh2YTlWSkZ2RVB5UDkr?=
 =?utf-8?B?Nnh3azRqK1dQV3JZb0tralBEblJjZ1A1RTdmaTBMUW5oVUdGVlppbE54a0I4?=
 =?utf-8?B?eXhDbmFPdy9BVnBBNE5CeWFrQStKZDVEWGhDZU5GMXJqRUFtTkJmdm04M1Q3?=
 =?utf-8?B?dmtWNWQzSHpZbjJLcXMydkptNFBMNmJ5ZlFLS0VFZVFiUFFaWnNmanB4cExs?=
 =?utf-8?B?NmxuTjN2REdxajFKeExjMzd0Um9teG1kY2x1ZWlBN0I0QzZ3dXFCRzJqdGhL?=
 =?utf-8?B?ckc3d2RZR0V6WEJxQnhqVHM2R0pQUndRbVc1YWIwdkxkNWM2Q0pQc29CclB4?=
 =?utf-8?B?N3VxWXBpcjdoM2s4SUtFeVhrdXRTaUNWUEZ2OU9wY0lNdTk4MUI3NHRlS1NT?=
 =?utf-8?B?aHFXcjdjVWxqYmVWMk11THRyODhNc1JWaVg2aEpGRm9UVDZwK0RjQjFiYWN6?=
 =?utf-8?B?VSttK0FvUVpvMXFtS1hEL2RNVUwvd05jUnl0elpPYnYxL2tQd20vS3RRc1Rs?=
 =?utf-8?B?R2VhR2d3VDl6OTlTaDJWVmVJWVkwOHBaclhOOHRyRGtuTmxET1pUVzNEK0Er?=
 =?utf-8?B?aVhmUFVwWDRmYytGUk13bDBrcHJBdHlXKytSa0x4blNDcjdTY004YXM5NkxP?=
 =?utf-8?B?dG5VRWY1NVVNZ3lFZGJJZ1pDTlcvRkFqNVZwSHpsWEVlRFdOek5xcUxpcVZw?=
 =?utf-8?B?Q01aak5VVWI2cHcxOGkveXFUS0J2Z09XSVRnOGtmRXM3NWs0M0Q1Mm1NbDVy?=
 =?utf-8?B?MGVBTXZBS0hVdXpKQWRzWmJGRm1yT242UlNvYlN6OUFJcm1GbnZsb2wwbndx?=
 =?utf-8?B?Qk9CaUtDREVLWkJEYkpRMThDSENoSmhreVlwZDc1M0ZCSk5lQVFpUW9kcHYw?=
 =?utf-8?B?dFdpandwZzZzRFFXREFHVEJOUW5Lb2ZRUVVTOUUrb0Y5dnNjTGVmYTZrVU1Z?=
 =?utf-8?B?d1o4Y3pXS3krd3NhcFd5aTB1MVZYWWRvL3Y0ZFVleUZDdCtoRjlZZXFERlAz?=
 =?utf-8?B?RlN2UWEzK1BJU3p5WExBQk1DaE9rYkJRSjlTUmd1VzI0L3hNdUFHYkxHd2VT?=
 =?utf-8?B?THo0ZCtrdjRtZVdneWtHbk1yaGhMZUUyQkV6c1R6Q1VGQ1M1OFI2c2Y5Sk4w?=
 =?utf-8?B?aHkyalBwQU1hMUZGTGVVczJsVmwzait4a1VMNG0wYXd0VnRscDFlcXlwWnlp?=
 =?utf-8?B?elQwRlI4STlJemg3LzBNU3dGMm5iUFVac2gyMEJTTExHVllLVjBTbDBwU3Ri?=
 =?utf-8?B?Y1VwQ3FYN2tYZzg3VmVNekRlSDFmNSsybEQ3ZEExNW5yN3hZVjJYZW9YWTYw?=
 =?utf-8?B?dG5wSmJPQ3Y3a00zU0syREFjRmk3TW41S3JLaGt1UXoyZ3Y1ODI5OU9DSjVo?=
 =?utf-8?B?V2pidVN6MnppRU1LV3dXQWlFRkxscG1mOThYRUJIaVJGb2R5bVdQL2tiZllU?=
 =?utf-8?B?VG5hbm82ZXdyTE5PZGMwT2VqM3pIOUxVRzNKOU0zQmFtZHk5VGJONGdWSHoz?=
 =?utf-8?B?ckhrR1pweng0djdEZHFMeHIvNWNBTDR3K0sxYllrNzZVK1FKV1BmNzRvalhW?=
 =?utf-8?B?VWJPbUlJaUYzamkzTnNmY3RyYmdMYTFQUHZUSjlTWFlUdVY4WVFTNDBxL2dq?=
 =?utf-8?B?T0FaR3hzMFFZWm4yck8rTFo1aUVPbUh3RnE3VWphSXdXMk1WZUE3NEQ1eGg5?=
 =?utf-8?B?QTZWbklHc3VFayt2ejFFWG8wWVNUWmNSamxIZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ME1kdEc5NUFNaVhQSzlrT09LNE1obW1ZNFM2NXdvb3BWYjQ2RldzUEhjTHVT?=
 =?utf-8?B?YkJtRkE3WC8wSkx6VE9oT0JtRDQyMjdGS3JVak1Tb0xoQkRoZ2xuWmozT2Jm?=
 =?utf-8?B?S0RBRTE3TVRzOGtVMU9hY0RacEU4bUNWenRtalhabW1RTGtOZm5nZjRFNlJE?=
 =?utf-8?B?V29HVGFBU1FRM3Jka1NoaG96bEtDUEFWMnYwSUhIY0tUVEkwRkpUUCtHZHpC?=
 =?utf-8?B?Ync1Rnd0dXM4WWo0ZW1jbjczeE4vRUl2U3lHaUoxYU0xSUhkRk5yL2E0ZWhy?=
 =?utf-8?B?emJYeGU0aVg4RHlJSlBUZkw3M2FDMHFZcFpabGs5Yzh0OHBqVUtLSnY0cmF4?=
 =?utf-8?B?bVhUYVpCRkhSRmI4Y1RLdXZBdW1qSU5lVUZMTzBlOHEySmNOMHl5TVM4U3g4?=
 =?utf-8?B?WVVxbmFMVE1sM2M3eEEvbzJzNUlabEpwMEtZSCtseXlWaU05bGcxODVjRFlW?=
 =?utf-8?B?cVV0SjdEMEJXRkYvQnpqL0JWblRxOXpJWjV0b0hjYWxDOXY0T0RNRHllVTRt?=
 =?utf-8?B?TDZYeTBhcVJoWlNhL205QStOZGIrRDJieWZ6QzdySUdYQ2lPL25sdllWU2pO?=
 =?utf-8?B?S0FsN05UR25PbEg4dGNUN1VtSVdFSDJjUk83UzErWTlIVkZ0UHJjY0xpa0dk?=
 =?utf-8?B?UHk3bGFreEZlYlRzWGlPRTdlbVVXTW1lT3J3OE9JdHl5ZDRyUVJjTmZhN0VD?=
 =?utf-8?B?amE0SGxiVXZMWnhrYmRUeDV0S25jeEE1VXVMV3YzeFpJSDdaemVJcVFMdXNW?=
 =?utf-8?B?VEV2YU9vODk0aWR4UzBXblBrNFAyMXZUU2NFU2IyQ2h2ZURRZG5MbCtYMTJW?=
 =?utf-8?B?bWJzQXBmb3VrRFl6L3g5U1hON2xzY2JTQVBMTUl2RkRmZlJZL21NWjJNOXRZ?=
 =?utf-8?B?eFRjbjhZWkNxWm9sRlgzNlBWOUxOS3NRSGQ1OW1QWWdIMUsxNWZ5dWc1TDY5?=
 =?utf-8?B?VmNMTDZST3daQnFjKzFzQkRNM3NwMjZDT0hjRm5taXF2UVBMcGF2cnNYNCth?=
 =?utf-8?B?YTRpRVpIRFNFbTlIMld0OUhoWjhYcnpMTXo3OU5JREdGdnRMUnRtTCtzUHlW?=
 =?utf-8?B?V1hTM1RkR09aU3dVYlM1Zkdabi9lbjBTR3pVZ1VEZW16TytRaXh1M01WQzFK?=
 =?utf-8?B?RFpNTENRcnRySGxFbTNSNDVRZWJNV2EwVERtWjkwN1R5UW9yMk81V0R1RWwy?=
 =?utf-8?B?YWdPV3J3cEROdHNBaEk5eEtGdzNGSS9ybllBaWtnZEVoVHQwY2tCQ2JWMm5l?=
 =?utf-8?B?cmtZbkFXSmpjWTc1V2FXV3pNOTQ1YVlSMEtodzZsMWUvbXJWb0FkcWJyT1hL?=
 =?utf-8?B?OHc4Wk91TEk0TjBRVEV5U0NqRXB6QlhmSExpOG1EZCtiWG4reU10Nk14bm9n?=
 =?utf-8?B?b2NGRkFHUVhSWTViejdEdVByRVUraFVSZWw3YVhBYXBMbGI3VnlKZUlNWTUx?=
 =?utf-8?B?U0lkU0hFR2tKK3diWUtqbGhJZUR1TG9JSnk2NEZQeG1aV0xLUzNqTkhkMTh3?=
 =?utf-8?B?MnhhZVNuY0F5VXVRT01nTWRsY2ljM0svSkFCek5pU3lQeEhHOTNlZ1d0VXRh?=
 =?utf-8?B?MnRXQnhnL2lOZnA5OXhpU2pkZDRva29PQkU1VXJVcTIvR0pMd1NtTURWQ05F?=
 =?utf-8?B?RHovSFI5Um9iTkkyTEJYVTk2LzVHNjN6bUV1eWZ3Nzliai9Od3FrNXlPcTQ5?=
 =?utf-8?B?V0ROMVloMTZjRy9hNnFKeHZxM2dkR2ZhWko2a0dpSkI2NGR1TXFPN2xUVFlD?=
 =?utf-8?B?RUJpY01Sa3FVdHRNbThrKzQxY0FzeHMxUFN5SmdOV2RKcndZTVVWQUhKNFFP?=
 =?utf-8?B?UmJLTjRoNEtWMmc2SUdFdFJXTkt4eEpncjUvaC94cXdhdXpLV2FJajVDQ2J4?=
 =?utf-8?B?MC9qLzkvbzNTcVZyZzQ4RXlNaWY2clZmb0Qwbk1zdEQ1dWh6VHhRYlhJRHJB?=
 =?utf-8?B?TEZmU25xSVFHR2NXbjdaSGFlQlhJMnUzeGxhc3c2NjVZWDNkSHE4ZWpYc0RR?=
 =?utf-8?B?dGYxWHFQaDhSZVhoaWlzZTRzeWZ1Qi93MUN1dnBnNVUrcUtyWGcza1RjbXJq?=
 =?utf-8?B?L0RYRkp3ZjZCK1RoaTZGWWNxMEhBeW1jUGlGTjlvbjllM3MxTlZtNXhQUEI4?=
 =?utf-8?Q?Bhv5HBUHuf/4DiW3HBHhgijes?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfe0824-7ed2-407c-ea73-08de28a77336
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 02:41:19.2261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9yHGbHva77NqHVdJ4teDuy2T8+R8mAUtdbgJZC/BWBH3N0IgpTlihqG9+4jo2KUuf+MivAHd0y8qWOkKlAdWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in the i.MX8ULP is almost identical to the version
present in the i.MX8QXP/QM, but i.MX8ULP CSI-2 controller needs pclk
clock as the input clock for its APB interface of Control and Status
register(CSR). So add compatible string fsl,imx8ulp-mipi-csi2 and
increase maxItems of Clocks (clock-names) to 4 from 3.  And keep the
same restriction for existing compatible.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 49 +++++++++++++++++++---
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9adbda313c8ad795b998641df12f3..4fcfc4fd35651e0cd6e80b97cc0b12301b65b684 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
+          - fsl,imx8ulp-mipi-csi2
       - items:
           - const: fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
@@ -39,12 +40,16 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is clock for csr APB interface.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -130,21 +135,53 @@ allOf:
         compatible:
           contains:
             enum:
-              - fsl,imx8qxp-mipi-csi2
+              - fsl,imx8mq-mipi-csi2
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-mipi-csi2
     then:
       properties:
         reg:
           minItems: 2
         resets:
           maxItems: 1
-    else:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
       properties:
         reg:
-          maxItems: 1
+          minItems: 2
         resets:
-          minItems: 3
-      required:
-        - fsl,mipi-phy-gpr
+          minItems: 2
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
 
 additionalProperties: false
 

-- 
2.34.1


