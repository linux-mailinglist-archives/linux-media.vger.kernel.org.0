Return-Path: <linux-media+bounces-48308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F95CA6E04
	for <lists+linux-media@lfdr.de>; Fri, 05 Dec 2025 10:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF05031CDA03
	for <lists+linux-media@lfdr.de>; Fri,  5 Dec 2025 09:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FC13242C2;
	Fri,  5 Dec 2025 09:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FObvfAfV"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B92323411;
	Fri,  5 Dec 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925707; cv=fail; b=f9BaKPPz8I1LNZZKZ7kQ8pQUD2IO5jwTgA9PRZUhiB63dCx25D74WU0eutNaNR0LQ19VzK8YuK2/z/+BYgFgxPpI/zntY34GT5odC0TDALWeKvi+9X70jLz2Jn7hp7F/KCbyfWLZeoHcXwZMptAi17S0aN5hxuDcTf8dq27XySQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925707; c=relaxed/simple;
	bh=j7pO0U/vX3Eo6mDBPo+tB6+EKCtdBRCcpusjWT1xDd0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YdkvxAPAf1PoZAhydRCDlUEtWp4n3U4wMseGnsbQzSPcio9/1UO4T1XC2GbR8YiLowDUEn5kmeMKBniqsr4u1/dsq7TkOBQ8zXk6GaeDHTYOfG8SrFX2mlkHgw+dXsNzA9+tsesEmFQYnKS8x2fI9CIMY8oZDi/RQgw1nbQAlCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FObvfAfV; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqIALJBBtU/6tLcX9aQ4h5O7RCTaSukFO9OGRFVqkgPEcJo8dvhp3jSt2q3wj85Yi/aJ29KygsrQNzldhhkIUGY4jaz9DxJikZz8AhbcNSXmtZmNNY3uTAk2P5/4fcIgDXTmrJ1F03uaKfpgZ4KWi2b/4GXVlMNO8Br9QdJboXFGRapL1PsrLjTipjy44Pk58EJ88lmFUi+2S8EQZpsraWBnqoHJH5myEh0G3Fb739n0UP2llBntbgl/eYMQ6o37r46j/Mp+vy8f/RzlrBmAsPLaYC4lf32hQK72akSVdoWtm7TkSBLdszfmgiXUZiIljFT8V6UY/KNns7GvzDGv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAHnykv+oPFVn8h63+wcXMPDqInG7mBWbvzr8dEFq9A=;
 b=tZbVDtDZ8V4PW4Lq8K8Qg09otEBGmMVaxODIvvS4ko6cFolR8bG2vKcLkL+kdjWCwqjpsUjS7buCjVnilgf0riGFJU9N2AFhu24fAz0hP2C1tZQ8y+uJomXp8VAgshlbvzi6LerG5UayXv9PQgMTSVnafw9enEAsRpV/M/4JctAaNnZYooGsSNsztx+dVNChMbYZC4LiFLNhMfJmGhx/S+DJIkT80QfSJWiAImRZiffRZFaOp0JH7zvYO2od2QKUsgp7u7pXWge8vXOdGRkCsIynvgKkVvYTI1TjssdhHPSmqdGRhGfI4727V1yNYh/ILqTrF2ISnT7Qv03hnOxtzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAHnykv+oPFVn8h63+wcXMPDqInG7mBWbvzr8dEFq9A=;
 b=FObvfAfVphEwT8wVhQtvIBHc4KGnuvCCiXyVfFsUQhcsTgLlYh5DqQ1Vv18jvWoX6UIALWtqGjfn/0PYASWRzVVKhciZCavnSbzPwJwrtA5klMdcffJuGRCVGR+mJo1Rp92hWSJba/4q9QvRbLZad8Ku/YCPtzPm4MKuZ5jW+BWUUql9kuooUkNX45bhuTFprR5jS0cojaYjrxIVy6Ytx8gUe/q9Lho5jl6j4t+LKvbHPI736NlgKq85XT5vN+pLmfMrdW/mQrfKbBd/xD797D0eNMcABFNtAr+NyVwR+QEo/dobEPwc9oXXF11BmsS6cfIOePGGKZMzgbRTxg7dtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB11042.eurprd04.prod.outlook.com (2603:10a6:150:21f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 09:07:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 09:07:33 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 05 Dec 2025 17:07:47 +0800
Subject: [PATCH v10 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-csi2_imx8ulp-v10-5-190cdadb20a3@nxp.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
In-Reply-To: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764925696; l=3075;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=pafiDd8TT+F3YKZUKFnv2yYEiY+Kqw4JnA7sm+f9DV0=;
 b=JKU3CF/xSlaqYP8LFT73CySD28uTSGkX07/H9IjgUDk+KA68cvKAYvDdnPzBunAYWXvSTl0vb
 YTRv0/e1EmHCDlqDoxJ5Ummsx1COCKFaPkYKxpCQAaBT6+9kVgAY+RG
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVXPR04MB11042:EE_
X-MS-Office365-Filtering-Correlation-Id: 19748493-a3b1-4716-25a5-08de33ddba1b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OHkzUVo5UjJvRWQraWNld0JqallsZ0NsSFVWL2k3amowenlISmtjMWp6Q0d5?=
 =?utf-8?B?MWhzZ0RnTCtXZ0dVdEtEclM0WDJVSkg1cUxrTDM5UStBdlNiQ2hkblFZaFlp?=
 =?utf-8?B?RTB6WXJSSmNTQmRaRlFHQ3c0cTlPOWdaNUh1RCtGYVRZdUpwWHpzTGlKbFlD?=
 =?utf-8?B?bE1Ub2doSVlPdGwwVW1yMTloZkkxUHRLWlVXbXRRQ1ZXOGxmZWxjb3ByL3BM?=
 =?utf-8?B?bDI5MTNNWDlIaEJTRVE1N2ZHc2ZLK3lVRGNWNWZSZ09TQmxXMWdCYmdUeFFH?=
 =?utf-8?B?T3ZBdFpGcGpmc1NDdWV2cEt3OVFZdEt4WHA1R053bnZKWS80Sy9Eby9PcndQ?=
 =?utf-8?B?UXlxMXNseUtCckNNRENrMm42ZW5ueEZTaW13UkdLdmJiM25yVHAzS0VEZVhh?=
 =?utf-8?B?TFdOd0x5bVhLNHZOa082dHQ5aGU3U09kNkoxdm9kcEYvRnNsN25qSHA5ODJh?=
 =?utf-8?B?OXJFM0ltVCswRG9VbkMrK3RZY09PdnRNZGVJblkyeFdmcXR6bTczU0RiUWZu?=
 =?utf-8?B?dmRXRTIwVW1Jam5TWTArMzVqQm1vZTdhNHRaT01wVnJLc1pHODlrQTJZVGlE?=
 =?utf-8?B?c0RNWWd5UlNJeGhUSWdiUmh4Z3QybE1iQkNhaGdVcnJZMDQyUERhRmcvR25j?=
 =?utf-8?B?ODVUaXMrQzNDY3hKSVQwdE5ja256c041anNTUzhtRml2akdOVDFLMWpsRGov?=
 =?utf-8?B?SDJWcTg0VFJNQTJSZWdQSUVFelpMN09zMEpSWVdEMGNwSFFiWk1CMjRFL0l2?=
 =?utf-8?B?VnRhY2ZiNU1BWFVxbUp4M3llMGpyUWlQN3p3U1ZPMEtiRGJGZUduSXJNNFFz?=
 =?utf-8?B?RS90bVVEbUZ6ZUF5TXZMMkNOaEhvamM2eCtGU1ZwNm94b3A4cERwMG1YZ0kr?=
 =?utf-8?B?Y1NJbVBTb1hYZ0hsRGQ2ZWNaTW83RW1xanNGcDM5OEVySGFuL3lRTHROSHlj?=
 =?utf-8?B?R3l3ZFlFOHh0RTE5eHk1TW1OeERRMkFvT0xWUFE0RVpaYUNFYnpMU2s0V1R2?=
 =?utf-8?B?VGFPbGcvaWdid21oZElNTlZhM2RzQktveGk5S0trRktDbFNMUk5ZaDdycGxz?=
 =?utf-8?B?eHJNVE82V255ZGwrSjFGRWNoNHpUaUNmZk14OTRHU1JscW1GQzdNN2pYVXUw?=
 =?utf-8?B?eTdlUlJKU0hqbjZ2d292N21Vb3RBQ2hIWE81RExHc1VFWjV0YTJ4cjBLWEcr?=
 =?utf-8?B?cGlHKzhCTjE2KzNLTXhmNVhydElXNkcxUDVXb2UwV0swbXlJc0FBV1dQWkVC?=
 =?utf-8?B?R0x2UzRmOXlSV0tncGdzd29GOGZYOW5oODF5azc2YTJFMUlBa1JZZlBBS002?=
 =?utf-8?B?WjhGYUFFd1I2bHVYbUlSSFYzQmRRQm43TGo0TmFDby8zd3NpZGdhY1BVMmdv?=
 =?utf-8?B?WkVybzkxa3MvU1QyN3ZHNFI5Mi9PTWVySVppbHh6am5kNmQ1WGpFUTVXVzVI?=
 =?utf-8?B?bUNXM3lCdFFlVVp3eVRhUmJ2M0tEd1htaUpPbUJMb01OczdBMUdDNDY1QTVW?=
 =?utf-8?B?QlgwSVZqN3c0NVRBTVBFVE1HYXdPcXBMV3JWSTd5ZXZBenhQTkVMMHVaT3RE?=
 =?utf-8?B?SVJTMmhWUUk4cnV2SDBlN3M2VDRwVzM5SklWKzZDVERhK1NvcUxPNHN6ZHgy?=
 =?utf-8?B?a215czNpQjVLb2Q2Vjlwa0xHVGtYV1RFZFVRWGhkNXJkV24vZFRMaE51a0pl?=
 =?utf-8?B?c2dpNzlnUHdzVmhsbkhUWC95aFMwVVQyM2VONmR1VjFPUVNZVzlrR1RIWkFx?=
 =?utf-8?B?c1hEQnVHNFpoMlY1QWc4YzlKbUtXSjN6UWsvQnJHZDREdk9zN0RsUGlvU1BJ?=
 =?utf-8?B?Vys4RjJxdzFVZGxnNmQzWWwzd21leFJoVXIxeU15NDhCZjMrTmtJSXRvLzdD?=
 =?utf-8?B?NldPNlRBQnJOcUJ3LzdJWjI5L0ZNZGFZaW82Nlk1MkFDVVFMNXZoU0FiT0lO?=
 =?utf-8?B?YjR5WVFpVEMxbGF6dEpVQ1Rocmszc1hxYTh5R0U0cnc0b1NNRUluZGpRMnZn?=
 =?utf-8?B?ZFB5Y204WDJjUjZSUWcwYm9pa1lqQ1NtcWt0eUlFVVBLWFFiNTlmYmZwSlQ4?=
 =?utf-8?B?NS9uNmFOYno3SEk4Wm9QZGtHRDgyZlFBdm0xZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VUljZXVqTlBNYnR4VitDM1VsQTlobEFZTnMza3BkTE9ZUnk3Y1JGWU1CU2w2?=
 =?utf-8?B?QmVFYk5uVFEvb09aUlFYK1BiVlU4Q2FpblpCUVJ2aDIrRjVYd2xsZG5YNHVV?=
 =?utf-8?B?MC9yZXk3Q0k3TEFudDljK2xrUENySFlreEE1cjlSbURMK3BudFo0dEYwK3FU?=
 =?utf-8?B?ME8yV1ZIRXpQajQ4SDdXd2FYazdaNloyNUhJSGNQeHl6NGtyU0hycDJwNjAv?=
 =?utf-8?B?SGJ2aWw4dEtBMHRLc1EybG4wUVJwaFRHS29wWlMyb1lIM3JxUmNTMXJHN0Z4?=
 =?utf-8?B?SDIreURtMDcwV0dQb2FicmtIRWk5YThKVFAwWHQrWTJ3bW5CSExtZ1U2dmhZ?=
 =?utf-8?B?ZDlvektwTWJEVWhrcXBFU3FxVHZuUGlkNE9pQk9SODM1eHRSaEhpRlh1eGlY?=
 =?utf-8?B?WkZ1YlpGRjRmS1VmZ1YyRWxYZy9OT0IyMzhialVCbWl0THB4WUhtVlJDV051?=
 =?utf-8?B?R3pSYlZqdm1YdS9qV3VCRVZKRmZmdkZTdDh4anBoZTJDbGJwV0Q1bktpbC9E?=
 =?utf-8?B?Qzh3Uy82b3l4OTVEcUtpWHQzOHJxb0JCMm5qMU5xQ3VoL1RQamdqMUM0cHM4?=
 =?utf-8?B?NVRtVEw5SmxxTlNBTC9kaWxLdENLblRXei80NUxUSWZ5ajVlYkRWdmdsVVFZ?=
 =?utf-8?B?S3IwRG9MeE41MFdtVmptblA2RFcvSDlnM0Jvd3pUaElJZCt4aVRyVFZhZFp2?=
 =?utf-8?B?aUV5eEk1Q1JRMm9jR3BqYWNMTXhCc1pJUE16QlRKME13S2tKN3ptdmYzdHlu?=
 =?utf-8?B?MkxLUi81VThXajdCVjhyTklYZmpnbjVJdE1KNlJmMlQ1WTRndXFqSVJzZnhV?=
 =?utf-8?B?VE8xVjIvTWdGcUNZRmxmWkJuNjVTTWV5ajdCYUpRcTdzNURUd0YxTHpHRWYw?=
 =?utf-8?B?ZitUTm1GWS8ya2FlcDlKTG1VM0lxNzVDeE9JVXZzS2pMY0x6UUkxK1UzcGhH?=
 =?utf-8?B?Ri9OMzdzamt6MGR1S0IwKzNsclRNZUNIcjJLMnROOE1jbGVmU3dXT3JMSGVC?=
 =?utf-8?B?NVI2bmV0UGY5L1NjaEVWa0hLWkxDMndKTUtvc1pMZkE5cjh6VUlSZ3BPVWgw?=
 =?utf-8?B?WmJpMXVDSjVsR05LbHZEUmFCRTQ2b0pMMXBwV0FyT3hnWkVNb2FCeG1VckVG?=
 =?utf-8?B?M2E5SDFTaFJWdy9vckV0cHVZeUVONjhIMXBIZmFXYm1jdHFzaXdCVjAxVC83?=
 =?utf-8?B?NHQ5ZkFOTEY2anNSR3pEemdmeFR5U2RINU9zZ3BjS0syMVZHVSttYk8xL0Nx?=
 =?utf-8?B?WmphVFVNYWJkUjBmVUFoWVNESGp3L3BTTnk3Y3Q5WkVncStvbmwvNGI4bEJl?=
 =?utf-8?B?RURmaVpuamFHWk43eTRTSlRnbDJLMXpmNFhacURneHhsQVpKbjMxQ3dUL3M1?=
 =?utf-8?B?eXpoUE9CdS82UTZQSXFIMjFISXNlZDhQRTlGRFUzZnoxMWVUdmtRU1B3TFQz?=
 =?utf-8?B?UEdJUlFzYSt5WXZvcUlpVWFhMFc0Z3M1elZoeDcxSXU3Y3pPMEhSZDZucUtR?=
 =?utf-8?B?QVRKbzd5ekVSTEVDM0p4Z1JTQTF1YWMrM08rZVVaUS85YWcvTVRhamQxYlhX?=
 =?utf-8?B?Z3NVSkZueDB2QkpMUEtqamQwR25JbksvS2NnY3VXODNKU1lQa3ZFalVLR3JC?=
 =?utf-8?B?WjQvdzcxWkVDQitRdW12VzlKTzRUQmlPU0YxY0JoMHB2cHF0Ty9QR0ZJMGla?=
 =?utf-8?B?VW1sSzV0VTFLcmFyY3JNOTQrSlFnK2hYNTdhSmNIbTlTa1ZxSFRFcU8rYzM4?=
 =?utf-8?B?dVk5TXZFc1VHQlpvS2Q1WFNMRHRzN0QxNUxFU1lZekpjNFJBNnl2SW1aMU1W?=
 =?utf-8?B?bDZ6V2ZqWnhwTzFYc3RKcWpzRXUwa0xDdXJPSVNhSnZGbU1jcjl6cUhTYW9I?=
 =?utf-8?B?bC8vR3k2L3E3OGh0TE5YUWlkWHU1ZkRrd3daSGJWa1NWTEVxeEVYWGgrQjlS?=
 =?utf-8?B?RFdOeFc3aDQwTHpKRHkyZGh1UnFTVkp0TFJpV2NoTG82SkR4SFJLdlN1YmRQ?=
 =?utf-8?B?MzVyR1hLV2o0RWhXOWRiZjlLL1VpakZwZUV4MG1ZQXBOMWpJd0c0OXFZdHhl?=
 =?utf-8?B?Q2VRdHh3Z0YrVDFKc0cxbmhUVlRRRzhaaGtqdjhKdTRWazdOV1libi9yV1Nu?=
 =?utf-8?Q?ou49BQsK9eKxlo/ebXhl+5D8F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19748493-a3b1-4716-25a5-08de33ddba1b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:07:33.7921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEpXX7xbCVozA5yjocCR1CZPI+NBUwvDKyUm16DkX7lg1sE1KeMEbsR2FbbxNMPlO1iP2OIXVsOpFvwHPBqsJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11042

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


