Return-Path: <linux-media+bounces-56472-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGMhIB7svGkL4gIAu9opvQ
	(envelope-from <linux-media+bounces-56472-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:41:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5622D64EB
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6BDA130B9828
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F62327BF4;
	Fri, 20 Mar 2026 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dPcXWmVw"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C285326D51;
	Fri, 20 Mar 2026 06:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988843; cv=fail; b=jjkng2YR3c2+UOOCxWE8n+7KCVx8YdVSofA1tEcRj0IG7fZVSrIRvAbY5E7b6PIOXl50P4BFB+x9u5oGDE+8tAnzoNuhrnWwsHR27C4J5/ykxVLiPSv7T4M/+0DUcFZHChzA7QN6caVq4+r55s6tijaK0yhl+BwiMu6FPteC/GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988843; c=relaxed/simple;
	bh=0kjrL/9OXBxKr7+Q4JdLKmUp6iS2al/lnMt2GXH6WIs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TByFdS7DFhZMNpctvxkWP/gjdaYVhI0eeqvn6y15PGi4eBBJBlCcW8AQm0WiYsH5P2zYA3v1OCjTAUgzctgoJW/qeN8PlMCrH4nOeIiEriVhnYmDFg1L1x1ab86H58CFLfG0XBxZyS3qggf2LWTArrcFaSds7xk1rfykZ6EN/C8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dPcXWmVw; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqs8WWtxluivlOTkumDU1hjMYesF+iUJUrRaWX6LWNe99fe3WG1FORf9/eRsWd+VEBf0mTVUjCpUI5AZPq6EXKq/J8qBHZw5Ox/vCJP4xcsr3WEcrP/FvFoecMd8WM6qXAGRbUm7HPtiDUjXECB2xEmzQ3TzRzSeHw/ihehthMc2Q/pW9Zw6RwPo3AGukPhGP2ZsJIAv8Eie3q4sTs2aci4yBlLrEUFDmr973N/hdWrYYUtGn73+JSmGARTr+64xj8ntfsDQ+U5Yez199EoWRsVxprn8bJyPtZuM9AfYHAajCM9YpA+RhJ3n/d753d5g0ZMxpcjU20Lel3pJGt/d4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TROLToLzc8fMhOmIb1+tkvl2R2fwYVTIiUsJcgoRJxI=;
 b=yebphTNgt2fttpYD4f0TgJkPFAyv2vxr9zLbXP+aXAfd/jejNDWxe+SPcFaIfoZxX7qf4Irw81GfJXzkFXM6iSyJsfOwVk6XMzjik5VVADXnKJhuuuOuvaLW4xqoMUPypTP0ZLSkOpHYszoLTGJT7r8Le7hGI14L02/h2GZ5bVgDFosUpMNLIP28ArNvETCoZWIw8hovjg5KVJMFYjBlmgm0wlHa69wlJE/H9+P77vpWzhrvM1N2nCbotIeIYaAS4e5KDCeJmUjGtC8z1y7HsIA/IthabuBomCsoO1wCByOHLc4aqj7XqU98JXhDrrDad96HECk/zoAw+GMmbWicYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TROLToLzc8fMhOmIb1+tkvl2R2fwYVTIiUsJcgoRJxI=;
 b=dPcXWmVwLI6ZiHM3j+O0YNBpefUyJat4+LvFiEBPr+yK7eQlr5YvbHyR/bg3CyW0nkuCP7tYiqhRrgk6EFe9TsmQW2s9a1lAorlMYTnXfRuYC7ed7pNH1HbmWmjbEj6qCqskFjRvuQe0jjYkCTdZAG+w9gMTgSyd+P9NioYg8UgXYwzx3Ltp0PZRJnO/4WVM22xATVdHnz7SFL5HClcefiaB2ge+HO5SGnjBgzoMLlOQ0hbvqYoAemMhvdMT/ywrwW9qDJtCbjLqdeAePOc5XjxD9djij2ysW3GKW/34Kzjhnw4I7VG4qIAvWzLOck8yc6f20FLn6C/d8PHq8J+n+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVUPR04MB12196.eurprd04.prod.outlook.com (2603:10a6:150:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 06:40:30 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:40:38 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 20 Mar 2026 14:42:01 +0800
Subject: [PATCH v3 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-isi_min_buffers-v3-1-66e0fabccca3@oss.nxp.com>
References: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
In-Reply-To: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773988967; l=1816;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=zs6w3SBlfQzFIcT7ZNKa6hYJoWu8arqkIqMkknU8Ktg=;
 b=r6AVwAaJdtmfT5lqa2LV4I/AnlcPtbxTvhlXCLGzekUaL+hmumxkroVNtJ1FPvDdUqZLkzyOa
 crjV0rMsdEyCglkwyfuY53sKWmb0xtBxO+w83ddgJ+emLl+Ea5X/I6M
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVUPR04MB12196:EE_
X-MS-Office365-Filtering-Correlation-Id: 83049651-cec7-4a40-efc1-08de864b9902
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 w570USuNisLy4Lsmy1RlcSPbgC+w+bxE8+p/qNpvvjKm62wYPHVtYY5QkrATSdkUTTDG1VereOb8xx9SYsn/nXwboR0fM7dlRkq5HFNwszXqJ9yp0zRZ7BRur5wTZdS8hHXeBnhnUgvruf7viGbDdxi9rHZLZX6o4F/xcafDawmx6ygJ0/LSxJ4p9pDTQH8i9GDs7F2k45JOQHEtVd2K3mGFzayAGyS12PZh4NHZuPjSNo6pxAFhNKynSaxWzyQbR3/f3Z5Y5/5OV9NlTQfp1f6qDj86xUJrZM+d4BGmbSXfDFENCP4KcQ9Il5hj1fisnPBchmIYM0PYIrXXxzXHofkbElp+zu9dEls469XKYbnnZlMsG6xRKsKw2ccGL7Q5LEZUF5FfULgw+Qv9TmmQqPXY0xrvOPFcqHHDwQGafqVGGSGah0ReSQoc4iRTN+fM40Ocudw3MSAXWBjSt2k6vR6JNPCA2QraZFepP7djjeWBCWG23RvupYMKVcO9omLwL1eA2HHFfDonrOd4LOMj9uVHulh5c4KlWTcC++D4/gVlklDJHVz3d1g9S6ZY7IOAISmQIVqru7xJBR+IDhZRQi3HPS6Iza1KeKDJ4b4iB7rU1CoBRjdVpQWdQVQiLRP2J1EGS/fl5WpIKt6qupMCb/7J9QOOD7+yWDomUEmvTPwTvrXb6OF6LgBXqEfyVqQ/kxtwP8MEnocTRnxiUrQJJOmZ4fvyaWh+/bD7Tas7J+ZFYspWuWGTR7FoHbGwFX6O
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?alJvbi9XNzdWMXFXNXNPb0hlNmg3SmJQcWs2YlFlcWVTMUJ4S3NsK1pzdnV5?=
 =?utf-8?B?eDZBRFE2K2FOdnk5b2hzMlhBeDZpNEpRanNmdmVYcG9UditQYmNqZGJDS3ZF?=
 =?utf-8?B?SWhseWI4L09RZGZMVEFERWZJV3RkR2Vrcjk0Sk52SmhNZVU0eVoyM2JjM1Uy?=
 =?utf-8?B?Uk9xbFBDaWxSd3pORGxTbEsyZ0NtRDlETktieVZzNTQwTENiM0oxclFydUZT?=
 =?utf-8?B?YmtlVDFQOS8vOG1VaWJWeTRzZUFyMWxXaXQzMnBQZTFpRjlnenVkcjZ3NHhp?=
 =?utf-8?B?ZTZ6aFltd3pabWtaSVQzcjhEVkJwWnVlV2loVmJ1K2M1Rm1sdUxaaVk4TUl1?=
 =?utf-8?B?aDFTR08rRnVsNE5YYW53bjMyQUpaODQ2SUNIalB4U2lsUDM1ZTM1MUlzemhw?=
 =?utf-8?B?TlBuSnBOcU93OUptWk5uanNRellKSTE5Uit3b3BEazF5UjMyUzlLc1FhdVRJ?=
 =?utf-8?B?ajhmNmJKNXBsTmxxYkJZUGtkMk90N1UxUUJVNkhpTVlHMXhsVlZFeEd1eklZ?=
 =?utf-8?B?VFFObzlWbDA1ZUNTOHRpWk5ITUJUZHkxT3NQb3ZxL2pjZnZPVU5reEp2a2I3?=
 =?utf-8?B?RnhXYmNJbjFVUHM3NHpNNGVRMWxHRUYxem9iTldHckFBOUlkY2xYOHBEZm12?=
 =?utf-8?B?aVh3czQ0cmFZaDlFWkhVTUQ4WVFFWXJpODV0em9WSWt1eW9HRGkwSWRFd1U1?=
 =?utf-8?B?L2ZOTTk2TGNVNzEzWHM5aVRIaFErN3h2NDVXbHpMRk04WG1pZU1PK2FjYjVF?=
 =?utf-8?B?UlZpbGZoZVY5RThQZmswbTFQcGMwL0FzYktkc05pK3hrZUcwdU81OG1WSlNa?=
 =?utf-8?B?dmpKNi85QThvMjV4c0wyY0ZRQkpMa2NmSzUrTEtWRi8yZWo5TCtRb3dEeDNR?=
 =?utf-8?B?eWRzSGZsT1k2SnBuOVB3UGNDTTlEWHRqVmN3TncyTmtxQ0o5bDl1dG1CVWJZ?=
 =?utf-8?B?cnhFRFc2Z0dPajFjV3JmMnZQY0VEV0tzUEtTajQ0OXdNbVVZTFhqaXl6bjV2?=
 =?utf-8?B?K2xIcDFEM2NSd3F5a0Rza0xLRmNCRVN2L3lhdEJpQktQWlJyN1ZZYVM4YUJH?=
 =?utf-8?B?NTdlVHkxSFlNZ1NGYXpoZU5yblZETkU1VkJUOGswcWFlNHcvZUtDN0MvcjJN?=
 =?utf-8?B?U29oak1GaTU3UE4rRkhabzhGNElUMGQveTBJSThseURJWU00VENXY1pYTVhk?=
 =?utf-8?B?TW1sUHR1N1pGdjZ3QnNCSjlWRGVnT0l1eEZWaklSQjlxZjRPSllmcVZOTDRw?=
 =?utf-8?B?dW1mcVJJYVdpdlZ3NldJTGhxUy9IckdpUnBtRHZjMWFQZTJZaEtURDFGM3hX?=
 =?utf-8?B?YzJYU1IrSi8zWEJQcVVaUkRwVFpFS1pJNHMwUzB3NWhFaG80YVJzSXcvand0?=
 =?utf-8?B?aVhzdUtUYkl2MGFqODRSUkdEY0RDcmhaK09MTzcrSmFVamd4cTlGZDRGMjNS?=
 =?utf-8?B?N3ZBM1krMURKVWlNcHVCNEluMmdId1JvYmhVWVJOV0cvZGJDYnYzeDBlRXB4?=
 =?utf-8?B?NG1tcStRMEpnTndjVHFibFhadzRBcTVoTkV3WmtnNXQvWTJERkthcVdkZkMv?=
 =?utf-8?B?NjduVXlBOTRvVU9xejR2UCtCVlRTRkhJU3BPbExFNTBpM3NUZUhwQ3hJRlc1?=
 =?utf-8?B?dWRjbVh4YlNkaXZCOFM3azJLVG5IWWVuOUhWMXQvbnlySlV6VStKWlArOWpX?=
 =?utf-8?B?UTI1RnFnYU03bEk5SnY5NzdOdDZZc3V0ZUlOd1pmWEMrOVNWMElPc2tlR28v?=
 =?utf-8?B?emRXdEN5VEFXK0dxUDZMbk4vL1BtcElxSHk5RzlpSHBUK1A1V2VVRGpkODZ2?=
 =?utf-8?B?RGlBZTEvb0N0S0lpc3I3OXF5aWRxKzUyeVpGTnB3emFrSFVOazVBWE5qWGQ4?=
 =?utf-8?B?NFY2K295Mkc2cVhHdGRpeVJ6cFVUWE9ZWEdCYzBUbVB2MDl3KzdLOW1BcnJP?=
 =?utf-8?B?UUE4SlhDM3BTR3g0Rlk4YmZDWmpOUWJQcHRoSzduV0xzdFdPa1h3Mno4ckxE?=
 =?utf-8?B?bEppWldJSG9oc2N2WTN3bGNWdmhOS1FORnovR1lqSjIyZXN5LzEwVjdvbWpp?=
 =?utf-8?B?QXJ5ZTd5NUh3aFBTTUNVdWt3Q1RYSldWL2JuL01CRUVDRlJOSzA2bzF1SnNw?=
 =?utf-8?B?SEg5ZEp2eWprWW9DcjVWbENlY25NYndsZlVLcjJKN1VsMHZCTlYvbWJkc0xU?=
 =?utf-8?B?SDk0TXlsRmduWDB0ZTVWZFg4eUJNUnNITTBVeVJIOFJMdjdXVEIvTC9BRGVq?=
 =?utf-8?B?QkhPdGxiMFNMVEk2aEpYREROYmVJZFF1b2g2TmlZUUwwbThvaVhEWG55cmJM?=
 =?utf-8?B?cG5lMXh1eFQ2NWlhWEExdHA4ODR1OThYbjR6Z0hvQVJVUHZZNnI4Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83049651-cec7-4a40-efc1-08de864b9902
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 06:40:38.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaFwK/aLmNagwgb0JXOKxv8ZqUrnkoPOBEBSt/lBCA4r2+YycG+efhKihxbTqjRiJRyhnsbhWRr9vicmTZk1bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12196
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56472-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,ideasonboard.com:email,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 1C5622D64EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Fix a hang issue when capturing a single frame with applications like cam
in libcamera. It would hang waiting for the driver to complete the buffer,
but streaming never starts because min_queued_buffers was set to 2.

The ISI module uses a ping-pong buffer mechanism that requires two buffers
to be programmed at all times. However, when fewer than 2 user buffers are
available, the driver use internal discard buffers to fill the remaining
slot(s). Reduce minimum queued buffers from 2 to 0 allows streaming to
start without any queued buffers.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v3:
- Add Rb tag from Laurent Pinchart

Changes in v2:
- Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
  https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#mcd4b7dcc218a02e2f218ba2c83b947ccefd9308b
- Add fix tag
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 13682bf6e9f8..1be3a728f32f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->min_queued_buffers = 2;
+	q->min_queued_buffers = 0;
 	q->lock = &video->lock;
 	q->dev = pipe->isi->dev;
 

-- 
2.34.1


