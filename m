Return-Path: <linux-media+bounces-19590-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25E99C5E5
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2461D2816DD
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B389158851;
	Mon, 14 Oct 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wybKOIjj"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16825157466;
	Mon, 14 Oct 2024 09:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898678; cv=fail; b=S/ORbp3jgyXTAT09VPFw/NU6+jVFSeJz5B4N8zSeoUqAiYRuM5awaN+5NO8JjM3Nq1JdNfsXrcr1ZUk2Sb+/eq9vdV//iXPRNXSR64s4MhJvyBAmYu4VAG7v+JL8/B2Dsl97WlkPfWgWS3EuAFUzMLO/vIXCBU41wppHOPttS18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898678; c=relaxed/simple;
	bh=lrm4+Kev6w38sMPrGQpGT6YJSIOfz3D4UVNCfLJTO+w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rkeAF+lK+8czlW+Ro6jbOrCYI7UGB0y0fRO6arUjroKXGWbAycvkZ901OBgh2U4dECRspScW8wM4wRTLmBeTd2fX+lM+g6Jqk2fYexsaBbISTwy7JP+nIkMTKixvpGHXyRW+4xyqOzSJd3APYFfia6Efm0wq/+046zwgB4IsfZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wybKOIjj; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3LjkuU3452BWW32kEoW2s8wbUcAZIJ/eEMmqIGuXPtEUrSl4NR/pcnVRJxc+YTkhT5S1JHQiDHR+wH1KFd52BctlcYCPQ8UVTk+ElWj1zz/V8IiBQo7RTMDBf+dVNIck6hOovpMB3a3Rg+HtT06adtTl0USP4jNMhMB3DFYTceefaLF/zDps5bCQo8zXMUUOV9xIPtsDGElPOSTrzG35yTaJJ9J4UTzQa2rBsYIBnBUxqZu0Sd55Y5e4xEGOlQP+hrbvrxkRk3u53md+vQeK2i5V+i3kgfRytvVnOHdD7N1uIXIPJQ+7cOF3xTo7t2A4vBphrXmhntkPBIg+pCLsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7foQ8mCP4j5rUloG8PWgVJc3iKisntv3g7fbrnyyz0=;
 b=IHRj8pIk2Y43OnRYHI+mEv75L07P+KONSHT6QsCE440TfFSNSGwIr08RaHK90g4VxyysF7qSWSNi1waZ7O1vZls7GvcUosokLu2iZ4z7biETJOrjKjlEC7P07/XTeyYb466ouO2ttB8R1Qe9lPfnmXMWRb29mSRKYvgOxlnUeqSsUtJiUwK2fYFazOyd3DesWP8rs0B4/q1yAp6RoRTdWjWctGOjDgQLPd6OmjtDtz5LoygiJXdZqMp6z0CskVcO5cUe4i4ptd3D8xRTiMe30bldjXS0yvbk3Zc2O8YDMdTA9FnJYBZZ6w2Qfvz/bljJKzMM/pHp/bmWWuZrYTSOWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7foQ8mCP4j5rUloG8PWgVJc3iKisntv3g7fbrnyyz0=;
 b=wybKOIjjXnQ6IeAkNcKxGpHbrw4yBFb+4yNd1yznbhTEU8OZdXIljaFrOq7pXQr1k3aTL2IykrOao7y7Dc1LEyj+QKZePfug7O+K+qzzox61urx51/K03vtDgSadMfLJDptvSrcD6PFlegoyXIQ92ScoLsvpHcA7iDmHf0qtqaFMLsOZ920u8yIMq2c8Apt1WRTemiz5tMCayyv4hjf365SHt6Hs28S1YYQijF4ej72aPCNFYbkvGjkbu5gMrW2a7pHceADi1hDJ3dnqEMkChWIgdrysoUzKEOjq6Njy6QdOU1q46WhgL1j02V9qi+fZZzvcFCyxtxHT4bfiEgO3Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10942.eurprd04.prod.outlook.com (2603:10a6:150:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:32:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:32:46 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Date: Mon, 14 Oct 2024 17:33:13 +0800
Message-Id: <20241014093312.1588304-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
References: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB10942:EE_
X-MS-Office365-Filtering-Correlation-Id: 232f97a5-ba02-4b01-9f75-08dcec33293f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TXQ2T1FITEhJSlR5ZHR2MVl6ak5kZDd2MzdmYlI0TEtrTUwrOHozZkl4eElt?=
 =?utf-8?B?QlB1Y1JkRjQ0d2pGU0J5QUhyK3JVRUZCQmhmdWd2dDZpYmRvTFBzLzFUM1Vl?=
 =?utf-8?B?Uk5heXZWTlJhWEw4NG5aR0FiMm9RSG5IdGhEckFYRHNrNW00SjZDanZncGth?=
 =?utf-8?B?T3lRbnVwRFl6UnZmSGpjbVk1ZHlsM0JhRU1yRmNHdWt1MU5vTHlyS2hqem5x?=
 =?utf-8?B?TE9ORnJVaXBlY0t4MmRZRkdxTnpwWFd1WTF0ejRrSkxqRGVrY0lNcFJqbmY5?=
 =?utf-8?B?YmpEYjUvVW9nZEwvZGd0N0tCYWd0cVdXRi9pdkpRS2dsaEVjaDFjN3pRczRl?=
 =?utf-8?B?bGVZMjdoYnhFTVF2MG1BcFVMUFV2eW0rM1N6a05ld2lnZnVnV24rWE5XZk1F?=
 =?utf-8?B?aXpBZHFVRnlTUmZ0cTJxcStDU1lPTExPYlJQL0tNL2RsNjlrL1ZRMjZoczFt?=
 =?utf-8?B?VmR5TVlBV01GSldhNHFFd1ZXcm9jNWZzMEthbGRDRXExR1NmZDdERXJsWEtK?=
 =?utf-8?B?NHloZFJzRUpEdENsZVJETDBnc3ZvVHp2NlltcDJFUW1oNE1HT3lnMEhUNHI2?=
 =?utf-8?B?MFJZL090ZWlrZmZCcTZUQXlFNDBOSGNkbDlrK3lUeWZhQ0pmWlBLS1Z2ZWh6?=
 =?utf-8?B?OGkzOWdQVy9qSGhtWjh2eTQ2YzRSVmUvSXVLSEc5MDVXYjRyNitxMzFZY1FT?=
 =?utf-8?B?aDFsZkd0N21WNHUvOVFjWU16NCtWOVNoYlhrSjFMdEVlcnJ6S3VtQ2x0ZHh3?=
 =?utf-8?B?SWR6ZE10dmNjTVZsMlRWVXhLTzM0dEpHMUJReDlVeXJ5K2x6d0lNbFZsRXdY?=
 =?utf-8?B?OTR0MVRPOXJBMUpSM3RMYkZxWmlxdlVpdmtFUWsxNXVjUHJGeUY5YUNTZThJ?=
 =?utf-8?B?KzYrdy9LcnZkUWU2OVoya2RWaUFSTXVGTHN1Ky9vWC93Z0pKWmMzZmpSbWJj?=
 =?utf-8?B?bGNQZUlNTkJtbWlIaGFiK2YwZjJWNGhrb1BpSU9LVjRFS1pmaERlMEovbUdu?=
 =?utf-8?B?VDN1eG5SUCtLdnRXNnoyaDVqMUdTeUQxS0MzaG5hZmVBSzNZcjNWUmdtZzdW?=
 =?utf-8?B?Q0dHZFU0ak9TMnIvc0R4ZklkOFFHTlRlNlVzbGJyM09NUTRxM0c4Q0tKeU1t?=
 =?utf-8?B?ckJRQ1lKQmZZZXV3MndJRVlPUG84N0JWendOOFpzZmJ2dnN5dDVaNVBIVi85?=
 =?utf-8?B?Wkl1UStQWVdrL3pZd0JGTDNKeG5CRVllT3B6TUxZdFNyZ2pqNlE5SGJXMjdI?=
 =?utf-8?B?amJtclU3N2dhcjRGazdyN1dXUHZ2ZWZFbkNON2ZnTjV5L21hTUwyaW5NMmcr?=
 =?utf-8?B?MXhYOER3K1p2cnYxWDBhVHVPbm0vb2N2bjVING9pejFYRm5Da3ZCMDVTUUxx?=
 =?utf-8?B?OHFnYnJBaUtFUkM2N1BsT0ZkOFNMNFFNRjhnUXNVQkd3aWhoazUrUDFaaFla?=
 =?utf-8?B?VmdVZU1Pelgrdk1sUlZFUi9MNVdpR1BQR2ZwUktKNzJyQXFZR1FzckdBMk44?=
 =?utf-8?B?ZUg1aWMxOUZGVFJSczJteXUyRDZLZnBQRXBJdDM2WUk4VEd6RVA0VlFsR2d5?=
 =?utf-8?B?V1VXU0cwMlREdXl5Tnk4QXgwRVd1Y01KTDA1U0tOckZCbmkzU3JmQkhQT2g5?=
 =?utf-8?B?ZnlKN0RRdlhWR0hTT2J1d052VXhUSkdwK1hHUyt4MlNxcE16b0NHT1N2K29j?=
 =?utf-8?B?WW1xY00rS0tqVk5DREp0aWxOdjE0YUdsakZpQ08vTTR1VVo2aFUrK2lTckV3?=
 =?utf-8?B?VWlLQ3UzdVl5TG93NHc5YVdMRVZ5L25vQ29YYXBJR1kvc1BVUlF3SVVKRkR1?=
 =?utf-8?B?anBHS2ZVd3VYN1V3eUlrZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UFpubjQxNUFMQUVtUzdKSnZtcTRUT2tTMmlDdDNyZCt0WlVoRDQvUmdFU1By?=
 =?utf-8?B?djVTQ1ZSS0phRTRVRU12Kzg3SEV3UWlPMUIzOFV4TG8vblcrbW8wMXpDUDFZ?=
 =?utf-8?B?WmF3M09hTnBCNmg4cDNQcmxlamNyYlJKQ3FVK3Q2M2FsOURtME92TXZIMmJL?=
 =?utf-8?B?VmtrQU1yV3NnRjE5R0NGUWI3V2kyVWZUUk52UGE4WE9sTW5XSGJkNDZkV3dt?=
 =?utf-8?B?UndjUyttNmRqV3RoYlNSQWNmQ2d1U2pVMzFyVDZ3UTdJZE03bGROS3FqZzRX?=
 =?utf-8?B?dUxTSStEZXR0Tnl6TFB4M0tDSnJsai9HaDRIRW1VaG50ZzhaMkk3d3hwMEMv?=
 =?utf-8?B?UDMwaUZTcHpaV0Z0MjBQdW4wd2ZFZVU2V3k4aDVXNHZCaWtQZ3U1ME9SR1Zz?=
 =?utf-8?B?by9wTmhEOUJlV254OVhTZksrRzRDTWxTa2gzTDdwYVdMMnRJdUpaVXdUWUpY?=
 =?utf-8?B?MlIwU3MzTzhnaXI2Qm13OVNzZ1phTDJ2YmJyMU8vdTZpRWs0S1ZpVnJia2Fa?=
 =?utf-8?B?SGZQNFQ3QlhPclVIR2lIV1YyUnJoWXZmejZONUJQZzFGLzk2Z1IrTjZLUjZu?=
 =?utf-8?B?SVlMZXZWOUVFekZob2FEN3Q0RWRYUUFBNDdXcWZHL0xwY3Jjd0tMcU1LcnQy?=
 =?utf-8?B?cDdHcDc5UmlJQkpBWmU5aWZQZDJkS1FVK3hGbmo2bEZZWTdGM2ErUWdXU040?=
 =?utf-8?B?clpWTVpEOFdRai9hUzJ6NjNOMzRWa25oMXFVMXpiMUg1SkQyZCtyVGpPa2c0?=
 =?utf-8?B?YklxNmlOTEhyRlNKTVptL0dJMzJFcVMvNlNjaDBDVXgraUxRQ2NQdGEwT3dV?=
 =?utf-8?B?aFNjdzNyekgzS2RHbFgyQndma2VsYld2N2dpZ1hLU01Tb2ZHS0l5dEVzRExJ?=
 =?utf-8?B?bHNUNEdVTkJCWElodE1WRFZHQUNiaE1Ya0FBTURVc1lsajlOS0U1RDllQlRt?=
 =?utf-8?B?TFdQRUluV1FPWkc5U2hLclVvVHJKeEE2T2FFWXFjckRYMHRLT0pkdWpsTFk1?=
 =?utf-8?B?eEsyT2tOYkhuZWV4c2FKWTM5SWNER3owZ09GaVpiVzZSNEJIQldzUHFUQUZ2?=
 =?utf-8?B?Rm1SanFBbDNUUUpKU29HakVsbU1JQjVjanV6ZWVPU0lYUlFLNmRyd3pidGJV?=
 =?utf-8?B?bkl0SkpuUWQ3K3NxditvdXg1dG5rQW5td0xoa29JTzJkSVRKdGZmVkZtOFdq?=
 =?utf-8?B?SXdWZTBCWWhnbThJVFFrRlpvUyt1RXZCc0pGYk5odDhGcllXY05lNmQvd3Fa?=
 =?utf-8?B?WUs5azZpZUdOQ1FLSEs0V0RLV2FNeHRudVFyTmJQS1NxSmpVRmdRb1RKa1BI?=
 =?utf-8?B?Q1FvYUt3bm9ocE0vajNWTzJ4SUIrNFFGWUd3UzJYdW82Z1BjYVVZZktHNFdG?=
 =?utf-8?B?aTJ6WHdsSGowNXpicGs2RWlMUUxNS25GRDIxQnFFNzlxT0FHRy9QU2szVHZT?=
 =?utf-8?B?YityWTBLaERlR25QQ1Y2K2NhM0NESXJVaDJRZDFGVERNVHVhc0FrTmZORU9T?=
 =?utf-8?B?NTZTYTVkRkVDekhEdjhrM003bjBTTFprSUJaZ1RLd3ArZ0hHU09GUy9waEJU?=
 =?utf-8?B?NHR2akdNRURTYkdOWlZxWkllUkwxNVhadklyTmxUeWJzL3o0Z1ptQ1JyRUVI?=
 =?utf-8?B?WmlML0MwZnpkOVcxZUxuaEdQV01OZjZLaUd3U3NKSWZXQWYvdkpRWHBpVHFE?=
 =?utf-8?B?YythbmtrcjV3ZWZ0czlRdFh2UFdFbzd1MGcwdzM0YkQ3a2wrcWduY2J4VjJR?=
 =?utf-8?B?UHBJdXo2MkVWVS8xM0JEdVZsQXJJaW9lbVlqU09QVW15MkhQdFZ1YmwrMWd2?=
 =?utf-8?B?VjlaSm1oNUJGQ3RCQVNUb3lJeFp2am1IQ0RzaktEWktuL0FIUC91TzZib0E1?=
 =?utf-8?B?d2J5ZTNzaVRDWEt0emwrU01wbnNsbFprdUE0UEMyemlaWGt6ZFdJYzcvTWRw?=
 =?utf-8?B?ay9BUzNhQ2gyWnpPUXpnMnBDMFg3TlFXdWxweUZFUldkemhPS0oxYTdIWDgy?=
 =?utf-8?B?NldQZDZhWWkxVDlUYXN3WCt0ZFZYbVgwMU1xZ3Bla2F2RCtoamdudGllbXJn?=
 =?utf-8?B?WVRwUWhCNzAvNlg1K2lGZ2RiTzdNcmZpQ3dLMjFPcEJBRlNGMDEzeWdoSXY1?=
 =?utf-8?Q?Vs/OK4Mt9WCV9S72IdoMjs9Xt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232f97a5-ba02-4b01-9f75-08dcec33293f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:32:46.2028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHxRzwpPobZaAxNK36bqbGt9QsBiFoCutwqBE8CCm1vP9nyDN3YREQYD95D3e5XwMgUCypXxrGMFs6SIlYu5Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10942

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add ISI support for i.MX8ULP.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 14 ++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c2013995049c..528e723114d5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -307,6 +307,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
+	.model			= MXC_ISI_IMX8ULP,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0x0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
@@ -528,6 +541,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 2810ebe9b5f7..9c7fe9e5f941 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };
 
-- 
2.34.1


