Return-Path: <linux-media+bounces-60547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP82EZIB+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:53:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43D4D8237
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B2E0301E159
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EB63DFC92;
	Wed,  6 May 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IWtBaJZa"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56883E95B2;
	Wed,  6 May 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057527; cv=fail; b=k7li0M/J31zZmKr9fC6FMwdNknNEFoiU75o7akUH6HLIN+4pV4vCWOKNVeLMIx4PgYnzDMvumLs2Dw0quU4fngCP9DDVHBDlHloyjAlNeseJ+eiizKbwJK87Oa2L8rLHiLlL2P/A4UoZRyBkOXObQOe4chujTr/SK69Pt30vcKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057527; c=relaxed/simple;
	bh=KHgnzlejLTaZb6vU8ge+OOIIkFkxNcDnJUheiNAMoXk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z/6w/7azmn9xUX3IYgSKZ/32JepRGkTIPEr95lW8CDSxnIqpJPfTJ2HTErqwve9D9m8BDzzZ6XyNsL5ep5+JCBti1FBXCeAuwdDXJ7H7FqMXbmX4ZNsfwm6OcoRQ7Su53EFZPlfm2nrVbvmVoxzrf8o6+5/211ZLquy+gkQFGZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IWtBaJZa; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUft8smeq1qSsgQ3FIerN68G4RuFhg+3FZKKEm4J0RzknQUVMgJTArHA3PNdT7lYTLzWxFq/go8N6ry6pTscNWM+cgeoOmwvyeSwSz+FiTcXxNr5rkEV2AxDfnMjMZyghg2Qo/2OsW6OZ5hRnxtlcQ6d67Y8W0BgbvunAKFqcQ3NM5BP+7o9VYUaOB/BkZ4vLUJaNkgV34ztw3gWnas3JhTteUNdp/sWZIRv2l02mDrMpyG1BREaaesgDt0dVTesHTJH+8JyzBSA/IxX/cr3YIT2zDnr4pWmXXVGRkhLjqQKyY8p9NishH+axLwUHpUoDKRemdBccCnTYnLF1sUbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjHSpIMLghsWXLV6B6NMdfazwYqqDWRTqKPxpGHOYGY=;
 b=eD1Pgb0I6yq4dJM62mqF+CgUmUHbw+RAHDoDvCIKQeOGi9IvcQxNGFfhCKm9w+RsRVhT13eGL6k5HMOXenuOZOwUP3BW5hsLOkqAOeXsdsgzkN8xs+6+3BJJixsxj2yX2xWeZ1L9UeD3+OVKKwsSTURkTBIKXZYTf0iCMXn2NabDawHvqAh6KPlvHAP4b6R5Nvj2QYgNsUS83Tyo29o8PbZas1ymKY7fWIFjA7506LSpB9YUFGJmHSqNBjSuZ3gbXgxWaTXN3OgPK36D6Z5B+DVQRAW/H+pHfFtoLQ0D7MGb5XZeYpmSqlVlzIYregdYJuf9t/ZNFhdzQ4UpEDCaJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjHSpIMLghsWXLV6B6NMdfazwYqqDWRTqKPxpGHOYGY=;
 b=IWtBaJZaRa23HCw9Tz7w3JaXTxAXFHMnXLNHtxAlMAbiXrJcnW81wR7MpNFIXikt+JWuEE3Vlx96anaTE9jieMFimA0biOHUGdSOb721mTVBGRQ4kVqLxMC4skXLCU7x9+pmZU7zCfAqowcK4ot+ZOZudpzOD/r/WO4gzwoIHPhEJkzLLgeoWvc8AL4nT7Qcq+TGGN5MhuzHnrZgb9jHfo3gceQDNhwfDdJhNK+sK/ayA992FDSA0c1FN6XkAUuG8OersjuJBbsLYEmOyhTIPXt1MUHhw9dGBI6pLgAjcb+7Bd+U4EQUX7xNFSdjDG0ei+oZb6OXn67zwvdJM+zF/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:51:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:51:59 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:01 +0800
Subject: [PATCH v3 2/7] media: synopsys: Fix IPI using hardcoded datatype
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-2-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=2490;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=KHgnzlejLTaZb6vU8ge+OOIIkFkxNcDnJUheiNAMoXk=;
 b=AyVg2sgCG4HURHrZZs3wjuGZ1B4xpkjw+zBoH8laVIgTglqgooTQIfmO4w+YHCPL6kzM/leKC
 G/XJUxOTdQ5DZVrqdjQERk7o40HPwb0tUt2CDcWTol2RDkMri5gLN1E
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: c727bab5-fe27-495f-19d0-08deab4cbc01
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 00y3WL2zVMMUTk7pTJYzjsX9EZFe06vCdoGoZXBlrFH37NG01+aArkr0QICiMmVkCpDN7JmfyzyL55RhdI+XqlDPU6S5xFaAN63rzxTvRSXOtmOHPCQF7ue59Rf39M1N8RKfHI8y3j0+GByjPe3y8CVOeA8qa/xKoedV8u/3P6C8zf0++72TkJxs5EvCcADel1sWc3cGvzRkKOpm+VvrJOaUUcbdEFmywiadG2944bJKIRez7iP6LAmnTxmp3qFNSSEXVW0Gon1IZyxQA8UJ3oWFIRJQzBtBiw0HrE3igULoRChj18wWYtZjdb65mRPhMQozArl/ZGXNq5jlfFVOqRBMYLouSHkyJmi5uMn0BuwEvRg1Ljfze6nTd+h9DV4B7Y1onILZrI2nb3fTd1sQ5sm1c4tfwnEGcvTmZpLrv9ZVgrTUXBrJUnd61jVCrg8TRJ4E+uZ+Rq9pikdJn2ZGONA0ON8uAeMxpYlNiEx3tlNskx56b/M4Fea56QoPlnymWiYwwV+SL4C9pF+jnVHAQxIyZFAbWv1ZhIWdIrAXQkqRSH1LU64FPrFp8JtIsm30RIAD+nsf/15dXi8jT7RZ1bU6FzR72JM1ZRjVqKS9PN4MBe/CDezb6iCe6JmnJpuqLN4PcUi/ffxd15J9SeGm5xWJhalEqZQOB107mYnhVDmtrj5+ME1pPEBKpNjk96CMRO7jPU5S9SB7pdrFYb8F477ZpFtDEtrNbfnZUfM8v/oRuP3a/bcwqunzuBqZiWuCZrDDuP+Ey/eSTTqWI9yGiw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZzRkbm9vT1N2L1FHOUVjcFYzTGhVaGtMYUl0TnFENGdSZktYWDhqSFVnSTFN?=
 =?utf-8?B?UG5MdFdwT1hacTh6RzRBSmd6U0FtVzE2MXZTK3dEbzFlZ1BLVnBudWVBeEtk?=
 =?utf-8?B?dEFPVDFkMmEwVnBQVjhkYkwyYjdxMUZ6ZC9VWHNtNVI5RUEzY0p5ZzJoRjJn?=
 =?utf-8?B?cnBWTFRQQUZ6clViN2p6Q0dmczJ6TDdzcWZyUEpVNTZ2N0xlNU9zR1VuSlRs?=
 =?utf-8?B?VFdLZFpkRFhlZUJHTDVweUxUNEkxT3ZjNGptZVVYTFNvNS9RUHBYS2NDS3k5?=
 =?utf-8?B?ako2bVlqdGxrR3Q1dE1DaDVnOW1pTm5DbTNkS3NzeUFJYlBLUXFhWlpiL3FS?=
 =?utf-8?B?NDIycmRqYXp2WXk2UGhoNUV0bWZ6djMyai9GVlJPSGxvRVpWOVVXV0Y1dVFC?=
 =?utf-8?B?c0dHejdyOE44RTM4ZTFaenNLMHhGZ2NQcDN6cXBiZEFvTlI5cHo1QWc0ZzYv?=
 =?utf-8?B?YllQSUhyd0grV2ZSNlMwdk02Y09SM1NGSHUwVFFScnR4dWptcU1WcGI3L3RP?=
 =?utf-8?B?VjUzZWJCREh0cm9rWUVaYVZJZHp2YTN2azd4NkVMUW5MRzZTaHVnNXVldkk5?=
 =?utf-8?B?eTdCNmRUbG1uTEFpV0FSNlZYdHR4dTF5blRibDJaTWhSNGNzVUtTR2dVc1Fx?=
 =?utf-8?B?UXA3THlxeDh0d3p6M2FxWmVjQ2paMFZhRk81S1A0eFpVL0I5aFRJdjl3ZkRZ?=
 =?utf-8?B?YjZHYUdla1FVZkFNMWx2aFd1UTFxNm0rNWNiaEJaMTBzWDg3aUdWYkpYWG1O?=
 =?utf-8?B?QXhYNnBKNGR2a1JNOGpPazYyNm1Zckl5ZmhoRVVnbDdYYXFudE9haGZ0ZTFO?=
 =?utf-8?B?MG9ySGp2VnhJeE9BV2Vzall1bWJHNWt4NXd0am1Ob3ZxVGNSZmhqMkwydTNa?=
 =?utf-8?B?WVhqTWhidTlpS0NlTlBUUXdMWjdQc29iN3krcjU3M21Qc0NmODUrZEx3UUd3?=
 =?utf-8?B?Mms4VHJITlNNY0x5aThPZ2pLU1RpbmlqY0U0bzFacGFnNjNWWmNGdzNVZkJX?=
 =?utf-8?B?QktUUjJXTjdVQmxnTjR5dDkrdDZybFZ3NGFUa1pySCtEM0RJN0RjU2VTMXZv?=
 =?utf-8?B?UXRBczFlNnNGc2NqYXk4bXorNGJGajdEbStvWEFVV1NPcFMvdDBUQzc3bTRX?=
 =?utf-8?B?dDNnTXB5SFVORU13OHIxTm04OEJmNmtTVlRZUXY2dmxpV3RaRDZvd0wrT0U5?=
 =?utf-8?B?d3FVQmkzcmFLR0I3NGN5NE5SVjBpVEpFa0ZYNmdCRVhNdlROS2ZlZHFkTUZu?=
 =?utf-8?B?YXRQVnJBaGNJMVY4VWduVWRESlBlTHlNMzBDdHNIVEk3ZmUwTlp4QTdLUjhW?=
 =?utf-8?B?UU01QWhaZFRwd3lKWWNRaWcxUzM5dGFJd2tBS0QwZnBMU0VaOFlISnRXWjNo?=
 =?utf-8?B?d2xpdW5GSFJkdnZxM2NzVDhseWlNTXE0cnNFOUM2YTY0OU5DNmxDS1VNd01F?=
 =?utf-8?B?d1JtQmVkSWFzckkxeVFTazY4SVlKV0U4Nyt5RkFIalJqUitNK3A5TkJ5RmRn?=
 =?utf-8?B?ajQ5QlRkWjBmKzZEdVVaa2RWTEF6eEIxMmR0Zlg2KzFJNklUdmV5YjFQZUd0?=
 =?utf-8?B?NjMzRjRHZW9nZWtxTHUxWGlndFJIdEw0aS84QUNtSzRMMW5IY1ZCSWc3TVVt?=
 =?utf-8?B?NEl0ck4vaUVJWlU5L0xXeHdwYWhKL3ZPRU42UTBiYW11OU5ueWpPNE1xVTJk?=
 =?utf-8?B?ZGZvT0Z4R3NkRE5wRFFmZ0QvSmFmbkE2US9zY29iYWlRaVpPd0k2dGEwNVVr?=
 =?utf-8?B?RHZoVGZXZlIxWURSRDNVSy9uRXgwcTJvTitKbTRNaVE2aWRnMnpwbFIxS1pr?=
 =?utf-8?B?bldSMS8yb1Zudy9zOTE1bWZNRUVsSmZlaEVGamt3QUtBUENjVHFqM3ZBcVg0?=
 =?utf-8?B?Zm5ZK0x1NEd2WUhQUmxHMWJTcm0vbUZhbVZCaFhEQ3U2S0pocWRIVDllbFhM?=
 =?utf-8?B?UFIyVGFpRmtJalJ6NlI3dU9mcXd3cFNXMkdWbHA2cVZPdDNsaDRyUGhqbDd4?=
 =?utf-8?B?MGkvbmh3L25Wb1RUS0hIb1VyQTdOMmRRa21uK1RlTk5QSk03SFdBSitTVUxs?=
 =?utf-8?B?S2k3QnEvVWt5VE1ENE91OTBNempvUUswSXNSei9VRzg2VXpIQk8yWEUyQWls?=
 =?utf-8?B?Yyt6VDZua2FRV2NkQ095UGJobENDNEtXOGF1d2RITE04T2VBS2hqWFh6dU1N?=
 =?utf-8?B?OWd1OE1UaUx1OUg5dVhTUW1iL0Mvemp3L1V4N3M2UnYvTGNzaVNKYUhLRTZE?=
 =?utf-8?B?ZG1meUxHTGdxbUVWWHozMENkRjZOZ1RKcEFsclNheEEwQURhUFJkNlIraVZI?=
 =?utf-8?B?ZFdXNFhjWEVNMkRaTTM4T254OUtkL2Ntck91VDliSWNFYzB0SWsrdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c727bab5-fe27-495f-19d0-08deab4cbc01
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:51:59.4899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3g0FEHEbUFDUdTc6pLjaVXNUcdYE5su/qwWr8zk3uBhCQ2JkOTL7C73pPWBsbtiYpKJghvr/cKkA+xGfRTPlQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-Rspamd-Queue-Id: 4B43D4D8237
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60547-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The imx93_csi2rx_dphy_ipi_enable() function configures the IPI datatype
using csi2->formats->csi_dt, which is initialized during probe but never
updated in set_fmt(). This causes the IPI to always use the probe-time
default datatype, ignoring the actual media bus format negotiated at
runtime. When userspace requests a different format, the IPI hardware is
configured with the wrong datatype, resulting in incorrect image output.

Fix by updating csi2->formats in the set_fmt callback to reflect the
currently negotiated format, ensuring the IPI configuration matches the
runtime datatype.

Fixes: ec40b431f0ab ("media: synopsys: csi2rx: add i.MX93 support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Fix formats array out-of-bounds read during enumeration
- Add NULL check for csi2->formats to handle unexpected format lookup failures

Changes in v2:
- New added in v2
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 02eb4a6cafad..0b80e84983f9 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -311,7 +311,7 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_device *csi2, u32 mbus_code)
 	WARN_ON(csi2->formats_num == 0);
 
 	for (unsigned int i = 0; i < csi2->formats_num; i++) {
-		const struct dw_mipi_csi2rx_format *format = &csi2->formats[i];
+		const struct dw_mipi_csi2rx_format *format = &formats[i];
 
 		if (format->code == mbus_code)
 			return format;
@@ -433,7 +433,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
-		code->code = csi2->formats[code->index].code;
+		code->code = formats[code->index].code;
 		return 0;
 	default:
 		return -EINVAL;
@@ -470,6 +470,17 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev *sd,
 
 	*src = *sink;
 
+	/* Store the CSIS format descriptor for active formats. */
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
+		csi2->formats = fmt ? :
+			dw_mipi_csi2rx_find_format(csi2, default_format.code);
+
+		if (!csi2->formats) {
+			dev_err(csi2->dev, "Failed to find valid format\n");
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 

-- 
2.34.1


