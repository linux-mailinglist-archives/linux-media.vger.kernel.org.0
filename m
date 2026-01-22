Return-Path: <linux-media+bounces-51323-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK6FAHTYcWk+MgAAu9opvQ
	(envelope-from <linux-media+bounces-51323-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:57:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9062BB8
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 08:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89216581628
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 07:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84923D3005;
	Thu, 22 Jan 2026 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MXHaNgA6"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7754B47CC60;
	Thu, 22 Jan 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068229; cv=fail; b=ilzODDvDG7OdD/paO2HyTyXf2HHLgYDtUcHG56+NlSm438jZlKiKj4TW55QZqhT8d1BMK11eiYsNMPCrUMwY18yv7Tudbx4KoLCHh2BD8DLvwiqSJn8c36u4EWgFnRE61ItbB7Zk50WFkPOCt7jEg/dQqERwsn3ssqccLKTJ/+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068229; c=relaxed/simple;
	bh=CQpod46MwEI/xAy58JYFl2KhxV+iz5zTR3j4GJLz8mI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gxi51qU42blCHBv9QI4IrWdYYpsc7wnbvOGn21kdxAt2cHkDbL4t2dLTlaBF2dKAQL5/xDGyzNRWGxyd93beovpqk79QmykFLJePycFRaURQkH6dSXRBBq6enpJSNtmdBIB1yV+wI65S9Nr9y1k3D0RPm6sBE93toy4oLDT3vF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MXHaNgA6; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sR39ZvkhFNDMTZp7VLROBILfoKmr4tleGCZNMj7A7jqo2llXEiixU1bqjzCmFMYqxUWqLJWabsbSffbgzGDjtR6qn6oEUoMRBGVMAhVKo+Ybw1UWV8COLatdgwfQ+TIJEJEZsFBNgm2nEqdvVK33VoVFCn55JVee9RGCqR7ARk3lEerLKx3hD6lW5cfVbnQnKgeN9/EROHAFT84Am/mY9y4Y7Q6IuoS4U96AM5I7BVPiqqbrN1oL1RvYdGqYwBhxU2W1knnnTQsmEYUU8hgNnXF6vWqsEaU10yQSw6gcOMSfuP8hijYpBny7hmuXLrcwUOsTVPxdPI7REZVkqaPLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=DnrZUURai8MTzWkyXec8Vg0k5z94m3edQkf+0udvLP1hT1nzBw64nyxbEKv7P0f2zgtoTNRjqXtvHo8k8Hl8LuxLeXTjSt1Q08IsS5Fg8wrJWROEMIZCGhhISV2r/yRFDMzZyc+75gYOc1IrZDchqadcZfXCUzh9VXU29kFR7uXMNsKSEbc8k/hhpl7Jn1U/+rVMjRfbhtGw+W9APDOLW2igEmaQiEemZ5/xIFjK0d55Fk8BnGckvciNhik/wvx7z3a4r0kUvtyuDgu7vjIHFtUGGp0ljRuqeo/vjzftGWho2yehq6nGm6aKfXb3Hffb8xfNHx908uaM1ZI62XoI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36Q1i6D4wAM8lvTM0CIMp0LiB0E2rvwOfEtpz0d71YY=;
 b=MXHaNgA6HPc83Q09VWIEzsV9s58PGunZ3kxYuLSt8VPiJ6fAMPCeXdfFAIprigK/XwOvj0lzli3fzKF4qaj1/FZCb+APdQNRr5ucwRhON3kDNj9fjjVrh+fQuEFJTpuhfWfGuUfZHbYPe4nEyimu2SlIA6gq7LaXr5nxV1EhjXReA4Xwzs2bkx0PHepRZLP4XQy289+OWzJs4HX9O+Y5MSRAnRH0ypZwskajoS6EWvNiTo5RtyIy+M5M9Glt/byv/YumNg0h1pGBTxsiByfT1KPxKxN6cTwc4SGezmMcCsFq91mMOHvs9RAF5y8ghP0NFlwb4ZsOfWsEjP02FbJjwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9749.eurprd04.prod.outlook.com (2603:10a6:10:4ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 07:50:07 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 07:50:07 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 22 Jan 2026 15:49:34 +0800
Subject: [PATCH v4 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-csi_formatter-v4-1-6f6fcad1c33a@nxp.com>
References: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
In-Reply-To: <20260122-csi_formatter-v4-0-6f6fcad1c33a@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769068198; l=2884;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nH6NEgl59OPi9EkQLhW3K3B+dXPHxx3jMyor6yV6qDE=;
 b=BSfrqM/e1xXJrhaONQF62Iw6HEdidlhCZOWMxxT1BlQkgLJORtIZXcPbTsK5Ysi8hF5keRkrw
 XErETmTj1m7A7S4K95DtIuRKh2m71a0h2CFkTn8WtJpL5gjhPIQGAAf
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dd2333-82b9-42d9-368f-08de598adc59
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YXpmcjdjT1U1NEJDM2E2N0F0TU40SVo3UkQ2dElkWWpmUFhBaXpqcnFSU2JT?=
 =?utf-8?B?SUx3ZkVvZEJlTHlnN3JibmVmZFFjZ3cwdjE0UzdRU3psRDJSWGlydDJvbHp2?=
 =?utf-8?B?bXY2RXEzc1VhTk4zdHNPNWRDMWUrVkhsS1RLc0t3emdIME1uMDBDdUpLSzBG?=
 =?utf-8?B?TXIxeVVmempjWWYwU2NSL3lUaXQ3aHRoMW5WYy85N1g5bmdGNnl5QlRuUW9a?=
 =?utf-8?B?UXp2TjNBVTJkTnNtOGtzdEdGSFoyOEZWdnlnbm5WVlkvdjVpbmtJZDUwa3pu?=
 =?utf-8?B?RDZsTzdsbXdvcjArSFdQUndUekczeHU0dlFGZHFXa0VpTTNtTE9DZXJkaHJE?=
 =?utf-8?B?R3VxazJQZnR3bjV5QmNaNjM5OGVGMzZzc2JLM3RSSHk4bEx2NzJZK0xnN0pF?=
 =?utf-8?B?ZE1qQUhVZFRvZ2FtQUlrZmR0L1pCVTRwVGx1OE05UzlZelJScG1wSnVpc2FV?=
 =?utf-8?B?dWVvUURpcjJ2VXpkYkkyVE9TV1lvMEFDUVdMakZSZWxEWTVKWVF2UVcrNnNz?=
 =?utf-8?B?VzJROHMxdExNTG9vdjRGd3hiVG5qWmY4eUJSRUZPRjFiZGlySW9waTJUd2V1?=
 =?utf-8?B?M0JiaVFza0w0QjlnMkZqbmZnMXFCRmhsZ2xQb0xPRytkVHMyZ091K3JUOStV?=
 =?utf-8?B?NVNwRS96YndOZHdMaTJHdk5aYnFONDBaeGd3QityTnFkUHBYUFBtOW1kTFZr?=
 =?utf-8?B?dFBTQkRFLzZqNzk1bGxXb3QvT0JXeXpkWlpTeGd3eDlROVhRMHRpRUY0YzNl?=
 =?utf-8?B?UzZFcnpnMXdBRW1zTE5uSVo1Qkl2SkJ0TDAyb1U4a0ozQVJnd1ZKUWZJMnhD?=
 =?utf-8?B?dnRBT0c0c3RwV3MrdktaaTgxQjlCWVRlZnVXQURqRmNPZ2dRYUtpQ1ZqZzVh?=
 =?utf-8?B?RVA1a0NhN09TeU1WY2V3RWxkVVFiNk5iOUFXYUlNTzkvUlpidkZSWVZtdWVs?=
 =?utf-8?B?NlhuQzBTbGxBR0cyZ0xRaENyd25YV3BXM1FaTlVzamNCU1htcmoxR3ltUi84?=
 =?utf-8?B?YWZ4c1VNeWtVVUJBZTNaVDMrbjlQR0dwODJuM1FKelRycGZlN1ArS21xTlRH?=
 =?utf-8?B?YzliSkpuM2ZOWXdqTngrTUVCbHBRZjFlUFQ5UStNSkx6dVhKejVHVFRETFUz?=
 =?utf-8?B?eUlEVDBIY0t1RWF3VkFZSWdkTklrMy9MdTBaek1QdngvMFdMMWx0Q1RtUWE5?=
 =?utf-8?B?MWNVa3BQL2M4ZWN2clcvUDgxKzAzQURabmxiaUhqUE90bU1zQmM1WC9VL3Vs?=
 =?utf-8?B?VUsxZm1xWEtodzcwMnFicThnZmdnVENrMGJCUzBMVjNKbWFBZTFUYytJbUEv?=
 =?utf-8?B?aVVvNGo2d085OEx0d2RqYiszMk52L0xZUnpNQ1QwTnBNWVNJYjdjSWJBNXls?=
 =?utf-8?B?Z1lLNmhkNXJQMFJCOUkwQkRwQ2wwZ05LT09WY3hYVlY4c2ZpSkN6bjRvcEZv?=
 =?utf-8?B?enJ1UXZmRmVlUU1FdG9WR3M4Tm9pS1EzclgzUWV0UTFCUTdBNkUybWxxUndF?=
 =?utf-8?B?b1lEY0VHa0RUV1BSSVp0QnhNdWFuNVlXNWRTWUdTNEYyRFJNZGl0Ny9SYVZQ?=
 =?utf-8?B?cWMxMit3RHVuMFg4L2d5VFVEc3dkRCs4S3QxUlRYWHlxN01NK05GN29SNmRS?=
 =?utf-8?B?MHdkU3drMjVtSkx4SEhwQ0dTZTR0dHAzZmpFdTRPS09Hd0VaSkd6UnhZVEY3?=
 =?utf-8?B?aHhDTk44UlorTUhVMDRhaHVIQUk4MHB0MlI0MTViaTRMWVNYT2F3Y2RmRkli?=
 =?utf-8?B?d2lWbFNseTd2TmxiZCtKTnN6RGUrM0UwTjhaS0FEd2xRUXJ5Mnlmamh5MHhQ?=
 =?utf-8?B?amdJZXVidmNZY1lnak1qUW5jY1hxdGhndThuU2htbldEaldHMVZBVXJ1RnJU?=
 =?utf-8?B?dlNnVU1GWHYrbk5pUHU5blZSUHIyOXphcmVMMWR5V0xCRjZXclhLYjdQcS9W?=
 =?utf-8?B?SE9qczE2cWJyYUl4UlUyUVBUaWpoWGRoNXRJclU4R1dXT2NIYTZpNDFTWEJm?=
 =?utf-8?B?VThsT0lIN09jTmR2enRWR1ZqbVNLUGt3aVBTWndpRytpQmhob20wb1pxK0Zq?=
 =?utf-8?B?cXZadW5DdlFPSjYxL3BUOWhOcUFVT283Ynd1bUdRTjdxaDRYd1pFeFhrY2xX?=
 =?utf-8?B?ODVNQnpFMlVzZ0lrTDRrbnJqMEZlYS9VL2VqbkNUOTIzMFlZTHlFNnRhY3Y1?=
 =?utf-8?B?cGc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T0NsdXYydks4ZEF2cmRtRHRpNUdpU0JMVHdnTVR5Y05kYy9QdE1MT0xwWlRC?=
 =?utf-8?B?ZWJsS2IwaG1rd3RQYUw5amVIV3luaFlIVTFWZFV4YlNBbUVQUzBnT1RPR0lU?=
 =?utf-8?B?ZGJ5WUM4M09Od3Y1U0lPQmVHNEZjbDByVDY2ZHNNaWkrODFlcDJ4dVBYYllw?=
 =?utf-8?B?UUlXY2V4UUkxRTUyNDE2aUdNdXMwemRqd1VIMjB1K0FPeEwvb3VwOHlRRWJq?=
 =?utf-8?B?blZQc3JiZmNXVXhMUW5DRWxpSVBaVWpseW00dXFQbkplSnJTQm04TE1kSS9a?=
 =?utf-8?B?ZEVyQzRHTVUxSHdOZUdoMWVDcUw5eGtuYlcwYUt2K0lDZGtsblZVRXVSM0Fs?=
 =?utf-8?B?UU5HYUhDRWVmU1JKV0hleGVFNlZlQTVmL0ExZk1YNzROTXNoMUlUbTNMY0tZ?=
 =?utf-8?B?OHNlMUY0aTFBMk5Zb25YUkNJT0t4RGZzUjkyYWpQcWJsQzlScHM0ai8yblNw?=
 =?utf-8?B?M0dvMDliMWRRZHY4RDJSU0hkNktINGJrSy9vclBBc203M0RLVlk5RlRrbFZQ?=
 =?utf-8?B?YXJzU0YxeFY0VFptRWhndEE3eXhGZlRMQXYxcVgwNXR2Nm5NRFNwOHgwei9S?=
 =?utf-8?B?OHZZbFYvZzgrT2Z4ZkhodVZxK2h1L3BPTDVaRXlYYVJIbTFFTFQ4eExyV1di?=
 =?utf-8?B?bjBXNVJBQUlZR0UyK1UwMUhXRHVrQWVTS2VuN1lGUkR5RjYwVEdveWhDUGJ4?=
 =?utf-8?B?UCtoNHNEa0tXVVJ6MUYzUGkrY2l0by8vU0VBMmswV2oxR1h5NG1OaE9QRyt4?=
 =?utf-8?B?TXJFbVcrNi8vMTBZMnpjajY2ZkZQYVVRMmpZV0lpYkxMMitQdjZKVVR6RHVS?=
 =?utf-8?B?eTlmM1RTSFU4Ym11NmNJL3ZJbjI1VUJRc0NLL0c0c1dFSGRuMTNVc0FuSlk5?=
 =?utf-8?B?Yyt2a2xtdFI2ellkUU1ZcnBjeDhEOHBxZEczVmhoSlRCY1B1aGI3U29jVnVT?=
 =?utf-8?B?bk1JMXBGYUZPN1Ftc1FuMzQ4RnRrc1RmTm9DWWtNRmNPWXNlbmhrVEF0TjhF?=
 =?utf-8?B?TFMyR2RLd2ZUY0pCZit2NGtUS2g0T2o2R0hMdi91MFJyanp5WHVxRDhSTlRP?=
 =?utf-8?B?U1J5ODZCeTZtSFgvMDhOSjZhL01tbStnWmdKWWJoZFlGdXN2cVB6MWZzNVlk?=
 =?utf-8?B?dGpKOCtwMEpRaTBXa09Xemc0b1ZBMnRtWWlZSFJOOXZMR0VUV0twVUZiUDZu?=
 =?utf-8?B?azJpU21Yek9BaWhPQjBQYjlDc1liNnhjaE1QanBwOGhPTW5hbkhHOGpaQkht?=
 =?utf-8?B?amFNc0RIWGEzTGlLYmk1NVVtTDdvQXVHd3VOSnBNbWc2bUQ3VmhHRHRQeGhJ?=
 =?utf-8?B?cHpSWU1QY2RQNExidXdYZjV2Yi8vT25Hb3JNbVBYS0RabCt5N3ZlRm1sTTd6?=
 =?utf-8?B?eFhUaEZuQU9HRGFwalc0aTlaWkJjU21pc0l1aFVCcFM3b0dBcjlJeWlNb3Rw?=
 =?utf-8?B?UE13ell3UWtvRE5SYXRiMXF0Y1NsQ0JFRFRpREFXK01rRVBYaHdRZnZNMDRj?=
 =?utf-8?B?OThoMm84SjBxQ0tXNkRqcm5nNi8reEVEczVoVmgxZEVLaXR6YklZNFJCU09n?=
 =?utf-8?B?eW5sdXVsNWZGbUQzMW1RbWZaV1BKRFNPUDI1VDBmeVZiR1Y0V1RSbjdTVTlv?=
 =?utf-8?B?VlJNTUI0Ujc0WW43RE1WM3UvZEdhL252MnJaSTJFUUZrMll2SmxsRFllUE90?=
 =?utf-8?B?ZDBhWDh4aUlLdHJmVGRVaUdZT0EzbFZWMC9DaC8wdnloRHN4NWVKejNGYktn?=
 =?utf-8?B?aktIamxXcjRvNCtTWkVUdEtCeXBQendGd296bkIxeHdjV2o4OG9kTHRRNkdS?=
 =?utf-8?B?NFZwcXREa3VhY0g2bCtzbS9nWThYeDZLNnBFMUh6MDNUblpUVExwcTVudktr?=
 =?utf-8?B?UCtMckpEektNS0QvbjRZMk10cERqcnVCaXRud21GWEc2YVNwc0g4b2xTN01N?=
 =?utf-8?B?SXdGZVhaV2xpdFBDZXoxSkJXem5VMWc3ODhKc0FMdGE1MDcvNCt3YXh1VHg2?=
 =?utf-8?B?ZWdVK2poVStCMnBIU2tKei9kZ0hOQnZlRU5Tc09Vbzg1RkV0WHRnNi9IdmFr?=
 =?utf-8?B?dVVrK2lTMVRiOTM5V21sckdJOUFPNkZBVFBPS1hDb3dGajN3QlhhWUpuQW96?=
 =?utf-8?B?S1puY2JLeG1JSGl0bnZ2eDdRT1RSR2FLVFJIRUoxUjl3SlNQTGdzY0dlRlU2?=
 =?utf-8?B?ZjluNGxJeG9oUkU2MVZMTUovbXNpd0o5SmVDSS95SXdtYjEzTTRYMFNON0RM?=
 =?utf-8?B?S2JYN2dpZHlwZTdpMzBMckZNRnpMVEJHSjBmZkMxcVRtdXRKWUZuYklhQ1ZQ?=
 =?utf-8?B?OGtTekdrS2hrNTREbFVlRlZnaUFtWFpJTytPa3VBVS9WUGVkRXUxdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dd2333-82b9-42d9-368f-08de598adc59
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 07:50:07.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJ15jViawO82tyyqKMF3JI0ZCxkoaV1yW61KWPO78olHVLcWk8d4fQyHsp1vvudGJyiy44ZOwpu7RCs/Q75KbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51323-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,0.0.0.0:email,nxp.com:mid,nxp.com:email,qualcomm.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 96C9062BB8
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The i.MX9 CSI pixel formatting module uses packet info, pixel and
non-pixel data from the CSI-2 host controller and reformat them to
match Pixel Link(PL) definition.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/fsl,imx9-csi-formatter.yaml     | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..774d37d2b987a679f0bb6378897a6dd196ea4f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx9-csi-formatter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX9 CSI Pixel Formatter
+
+maintainers:
+  - Guoniu Zhou <guoniu.zhou@nxp.com>
+
+description:
+  The CSI pixel formatting module uses packet info, pixel and non-pixel
+  data from the CSI-2 host controller and reformat them to match Pixel
+  Link(PL) definition.
+
+properties:
+  compatible:
+    const: fsl,imx9-csi-formatter
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: MIPI CSI-2 RX IDI interface
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Pixel Link Interface
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/nxp,imx95-clock.h>
+
+    formatter@20 {
+        compatible = "fsl,imx9-csi-formatter";
+        reg = <0x20 0x100>;
+        clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
+        power-domains = <&scmi_devpd 3>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mipi_csi_0_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                endpoint {
+                    remote-endpoint = <&isi_in_2>;
+                };
+            };
+        };
+    };

-- 
2.34.1


