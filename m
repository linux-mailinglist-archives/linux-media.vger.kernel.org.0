Return-Path: <linux-media+bounces-53645-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eINxJOXPoGmTmwQAu9opvQ
	(envelope-from <linux-media+bounces-53645-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:57:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E37241B0A87
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 979EC30E1CCF
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0278245104D;
	Thu, 26 Feb 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="joqLjQNp"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011054.outbound.protection.outlook.com [52.101.70.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A488F3DA7DF;
	Thu, 26 Feb 2026 22:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146559; cv=fail; b=guilKjfMN1VXvLITUUQF+yG/1lStpNVugDYMdVKfRblf3vCk5gdPQgLDugDi7QDz5HMOFreZxjMWYP1YaDcFSqASC1Zd9XaKeNmdkR0FWaDMFMRpHw0mUNh5qLkJzr4FuNUjLZkwwVqTXOYhX/B7XkyZ6ytlEnxwTZxf/6PSzeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146559; c=relaxed/simple;
	bh=ciJxjsUBy9C0rYso7LRgpP7ETsoEM8zwacgz9WEWs/8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CXhUGoQOz3E10WCiCgaqn2q4Pu7WdHCHZdPCFgCww1ZcAhrIuAVJF+YdgoouUl+QVK39KTC0KYJkxM1FylTwfvGz/vJBHrZ8wqZ7gE6NCFXfRM+326JMrS/plR9rms0ThtzpOTAP8uFJCsSW+bXDo99eq/poReuwWRg2LMw02VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=joqLjQNp; arc=fail smtp.client-ip=52.101.70.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/enjlmJYa50RnSxaMIyyX3e9AKXXp9N+uPftLmb2H9nP//kjtPoIK0LxpvPKowzkmHsNNam1xSvry0PDiP8BFS9gRarcOW7cROJYOp/pUOx2y2XP8BjCGgvZSuI6dP9dmBzxf4YHavG9csIqq+C5Da4KahLjK4zcXtN6Yi18HFlDhhQTsjW5SrbhRSYjRi+gYkiX9Bwomay2J6tIE3QJLVMXsoSnJFACudeKXZK1nmW34t32VbQRLAOqsbvtCqzxcYstmJXW31BFugBz+PgH49x5GSdLAQq9Ut9+1fBxW2Vp1jhUlpeFzO4UIewj16mGQ1kesyFLo4jD9pk/Hl45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKcPPenLKLPVIGoDrsEI4sZur1CxZS5oYAX4qJG5SZ0=;
 b=aYlIqqUBar+blvJ7H8gJ8B8Ap4+/bOVGnvHIzUdyrL3qtXE2UK1LG9PwZ1uuhQJK5gDMMipBrxjj2ClJp277AjuHZJPz4dQKxt2JmuJfcVVNAa93AQHwgYF6WsprEo87MuflP71ucclxzqqvbO4WZehHSXhhBylk1AOXgNYwGq1EyowvRDJTFdYGcN+oSCbYhSLD6U5LLG4vraU3gTeNReyu9s1VaX93MI3cNmWmha1oRxhS3yi2becImt135meGnI8MRbuYBsXLWqQkzmQoqhC2iLQ0Dhrmt9F9hp3Yxa8X9B1yfDNmSidHKe2koJAjDqLW4NIts4t+ubyTRYJHVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKcPPenLKLPVIGoDrsEI4sZur1CxZS5oYAX4qJG5SZ0=;
 b=joqLjQNpJgVjpFix3kG2bhXKGHsDNkhYt0PbVo4omPZI26SoiCAaMnD9xAnod/C+kM2xTg1vxMFK2EUJaTdXhdZelDRhUpLasnlEizNHEpu38Rxu9sbUG6qDoebSlltqSmWyB5KdmqV7ADuT4PgWnP3PAijOursPk3+WaoPvHG5V8B9M66kC38UIJO7zVatVH+fyu59jjdOhUwSPSevCa6ol940gPmuDi5cHO0IHbE4DUoZVCpwxB9yxJDulYraKNlKBXZbNw+47PgX6z+AIT2nkzgbVrovtLTATzfovbLnghKUSJpWMELasIOARh/jCF1h9TR/nBrMCNycM7GN0oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12143.eurprd04.prod.outlook.com (2603:10a6:20b:744::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 22:55:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 22:55:54 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 26 Feb 2026 17:55:28 -0500
Subject: [PATCH v2 3/3] media: cadence: cdns-csi2rx: Use
 media_async_register_subdev() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-v4l2_init_register-v2-3-902d7140f9fa@nxp.com>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
In-Reply-To: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772146544; l=1874;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ciJxjsUBy9C0rYso7LRgpP7ETsoEM8zwacgz9WEWs/8=;
 b=SdAos39GXDYLoGvW3XDa0ZzxK23oHeW8ty20j1cqpqFHK5OE8bD1NliZCuV7T08p1EP6CrX8i
 ukPb9AbYstKA6G1kTgWVk9n+XkNrgSFxEI49V7QUEfCaga5l3dtF8CP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12143:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a29a6fb-abd6-410a-eca1-08de758a3247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	CwlhOiHmMz9yqQC17j+BQ2tKsCWN0VTPBhRsbAB52D4zKd2bH5mIW1QxhxmTJpxNDK7MI9l1AarFGE1M7NhbjGF3/sd5xwZfZrSMTQbF2NQFpCtfGoialzd//m3G8VFRtCSTfL5fDyHpOBr++VgyprrxHzzEUlwOX67bAFEq9UP478ovk2lPkHanEmkF05xIHlZ4Cnm3JvHPYlqpUsa1BUnlcKkzrFPIrbZnJZRMzyQDjLlQuk75UUV9Yo7DJo3fXFdWPAeurqSXzSoo+RLfWdGlK4QkCfMjHKvhUq3BDesdYDU5PxL8uxpvx2q/ZDtxFQnhymHTP8zXj74bUzX+nfAPkbQ2bCPGrmkWQWhF4uOjbpiZpFAux07O32FA6ZIH5BdSmcrKwmZw9WHMo4Veo5yf140TuoUg+T3jcxdQQvP2YiSRGv8mqK6TAHcvl9NaJOh+4cH0GZNjMJMVHPYPPW0G4nWj3TJus7YDtA958+dHxt3aXGRGd8yFVE/zyMpCIU3CZb2uFcsqu3vgeA4g78YwxTpIu53qP2vKzItv4OoGXC9TXFzPUP0y+AMW2lywL5WjNghYazS9W630EbG3+LvFgPhR2UV/kAVRycfJFq6Ruv1rP6utK9r5wAOoUxOpMV5jXhjqkpd151KM3LZ7T5v45uqkbAWwFDxEsKa4/PInn+VxGmSz+nEmxS1oaFItJfBeD8OLL7um+4BNOMWU9XZtRlck6dTAdZ8l+3XEFyvogaySCa7EQBdrld2LC8THQoA443rL7tTvm0HOJYoADxLESnvMMn0qST01Kgk6YpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkV3Q0RQSlF6S2lJVkI5SjZHdW9qdU5TYlRjbFdvL3IyOVBmL3JiZElrTnhk?=
 =?utf-8?B?KytKRE9aczZPM3V6MFpXdWN4UUF4TlJOdWlnZWhDeFlMb2lkSG1VanZCVmFP?=
 =?utf-8?B?akZXR1NiREQxYTBxRDBnTmNoK2x4WWRoVXZTNlcrKzNkcUtjNlh5S1VRSEdL?=
 =?utf-8?B?WGRZVjVRVWJqcFhhaS9KblF3eXV0SjgrelE4dEpHK0tzQ2JwNVFnOXdDKzd6?=
 =?utf-8?B?WnR2ZFpxMUtVSFViVFpRdHRCaUNnQ1BLT2JyRHRhTjQrNXAxck5XbDBDanJy?=
 =?utf-8?B?Zlg0S3o3cFBIZU52cUQxU0NrM0hEUWRSY3VONE1TTGxraVlPajQwUWYwdEpO?=
 =?utf-8?B?YU5lZlZUREg2NXdreU92YVovSnc5b2ZudDBBMTRmRGExMU9VakdkakhzeFR0?=
 =?utf-8?B?ckFlbFZpQnJKQURkcmtaN1VhTUpSZmo1RGNSbTFUWit0cGl6NnQ0Y3oxZW5L?=
 =?utf-8?B?NmlncktSVmpnd1IvaHIwRWc2dGVtcHU4TXJsaEMxb08vM0JPZ09ZVnNFMkZo?=
 =?utf-8?B?ODl1eUcwZmFLb09ZcG5qRHFhRmNBOHU0T2RkSEFCVjNnZVQvTURCczRiWE1W?=
 =?utf-8?B?WWhKMXFxVGx6dGFETVArcGtHd1QwSXhjZWFKQi8weVltSndoeHJKcFVPdDRQ?=
 =?utf-8?B?Qmgrb3phUC80ZTBGOXlvR3ZWQ1RJSXdqb2F0UVFEdVZ1OWVQNG9DZjRPaTBT?=
 =?utf-8?B?alNCM3Fsc3ZHZ1Z3ZmszR1cyRVJQZ1F3WTJRRlcvMWZMMllSWXBaYnlNYjNY?=
 =?utf-8?B?ZExSd2NqSUdHaWZVY1lYOG1qZnFrTTBzalc1ZWlaM1ViTVlWYkUwQnlTQnhQ?=
 =?utf-8?B?cExHSktxNkpFcDA5bFFDWk9qcmJwSEN4SGVnYWMwcnJ4K2VFcS8vZjN5bWh5?=
 =?utf-8?B?UWVOVUNuS091c2FaSjNVQnV0YnJLUEdnMUZmSzJVU0xVanAzZVdNUnJPeGdl?=
 =?utf-8?B?K0hRTFh2M2NJT0h1Qlpab1B0YTZ3V1FGblhFSVI5OEN0Zm9NN0VpTTB5OFNK?=
 =?utf-8?B?VFRHclBTT2JFUnhhMkliMWFxVkRJL29rZzBhZFlNYXlXV2hCK3RlcXVxMS9p?=
 =?utf-8?B?QTk5NWdUeXN2YkZvRGE5VERVMjIwT2ZOUU05SHJqb2Zld2lnelluOEQ1RmVx?=
 =?utf-8?B?T2owakJQNkhBTEVsQkQ2YzMvcitPanpnMnFWdjRHRHZQZmRTenhPT1JOcjZt?=
 =?utf-8?B?cm1QVmtTYnNibGx6L29SQUVYbTZQTWgxVGlDQjNoL2t3dm9wRDQrUWR0ZGpU?=
 =?utf-8?B?alZKVnYvcDFPaERzZnU3UGliNmh4UGRZY2FSM2p5dkQzT0hxNitJNXdFMXl1?=
 =?utf-8?B?ZUE4UXBpNWJvT1dqVzBWQXZjeExGSXA5dmhHY0t0OGZ6Vml2UzFjWDNPQVVj?=
 =?utf-8?B?UjF2cENmOXZDZDRNQVNMUG1VWUpGcVRFeHRNYVllRFR5RTdkNzVib1IrQWFy?=
 =?utf-8?B?enJpR0w5UkQ1dElUY0JMS1plZmNrZGxabExZQWJjenlucUJuZHJLZlp5MHF1?=
 =?utf-8?B?ZWxYNDJlMmNNSVl3aEFuT0RqbWlublpncnRuTm0xeHNQTGIrU2h4ckRoSGhB?=
 =?utf-8?B?Rlg0Uy9SN2p1UGxuU205V1d6SWQzcXZNbXRRZzFJRDZZRG5mSXNCTm5NeDdj?=
 =?utf-8?B?T2NjMXVZc21xTk5MUmtlWnRmNlErSzFib2hyM29iQitJeTBIdUUrUS9EaDJZ?=
 =?utf-8?B?eTdXQXNwc3h0T3QzR25nZVIrT0g2bG56LzRTRXZvdisycWJYeTJGTG9McDJ6?=
 =?utf-8?B?L0s2WGh0VlEzNW5TaTVYMTBENUJzU1cxaW93Z2FPcnZxdE9NSEtYbFRUb0NR?=
 =?utf-8?B?RFNDcG1yT1JNSXppbFNOWGFQWGU3TWMyYkdnSHR2SzB0QnBjem9yMWtMSEdD?=
 =?utf-8?B?eGRGcisvbnB6bUZndWNpdGdhbEZNczRSSWx2dHRka3lWOExmK011QkxhYWF1?=
 =?utf-8?B?SHpGenVKQUI1czEweHlRVXdGdEJSYVM5TkROL2IrSzhQYnVtQlhpY05YMVJz?=
 =?utf-8?B?N3o3dGkyTDFHTFNEWWNxMW1Ld1BNKzdtQytUV0dGSks4N1FjMkw0b1dnb2lp?=
 =?utf-8?B?MGttdjNBeWE0UktxOWJzbGNGN1F4bWFDY2lhcEdQQjRMZWY1WGNmVm8yNEZL?=
 =?utf-8?B?QlhiRnNWd2lmYVVYWURhTzRLTUc3aXVOSjBUOXQxbUxrUVdzc0sreWtPQ2k1?=
 =?utf-8?B?RTFnQ3plc1NYWFhoVnlLME5aNEtWaTU4YWRxNSs4TUFMMHhXUmU5T0wwRXlP?=
 =?utf-8?B?NDNkRDdWQ0dzOTFEdFQ4N3RxYXA4b0U3RVI1Y09PdXdKL3c0eE56WEowRnJV?=
 =?utf-8?B?VTlwWkpIY2pZTVduSytSc3JybXZYcUNBcEpwd0VhdjBYaUYyc2dpdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a29a6fb-abd6-410a-eca1-08de758a3247
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:55:54.4611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoMM4G3HctoFieFOeKheBrJtKAhuPGrgO+8kinCA5ZnM5ODn7kaFn1PTmJkvzTTDNImafFpP96iJUKAb9IO8Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53645-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: E37241B0A87
X-Rspamd-Action: no action

Use media_async_register_subdev() to simplify the code.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
build test only
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 8c19f125da3e50f55a0ae280b05e7918ce115101..e0fec1027c9b74dd7dc46375f3aa4cc5fc951138 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -855,11 +855,6 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
-	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
-				     csi2rx->pads);
-	if (ret)
-		goto err_cleanup;
-
 	csi2rx->error_irq = platform_get_irq_byname_optional(pdev, "error_irq");
 
 	if (csi2rx->error_irq < 0) {
@@ -875,13 +870,10 @@ static int csi2rx_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = v4l2_subdev_init_finalize(&csi2rx->subdev);
-	if (ret)
-		goto err_cleanup;
-
-	ret = v4l2_async_register_subdev(&csi2rx->subdev);
+	ret = media_async_register_subdev(&csi2rx->subdev, CSI2RX_PAD_MAX,
+					  csi2rx->pads);
 	if (ret < 0)
-		goto err_free_state;
+		goto err_cleanup;
 
 	dev_info(&pdev->dev,
 		 "Probed CSI2RX with %u/%u lanes, %u streams, %s D-PHY\n",
@@ -891,12 +883,9 @@ static int csi2rx_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free_state:
-	v4l2_subdev_cleanup(&csi2rx->subdev);
 err_cleanup:
 	v4l2_async_nf_unregister(&csi2rx->notifier);
 	v4l2_async_nf_cleanup(&csi2rx->notifier);
-	media_entity_cleanup(&csi2rx->subdev.entity);
 err_free_priv:
 	kfree(csi2rx);
 	return ret;

-- 
2.43.0


