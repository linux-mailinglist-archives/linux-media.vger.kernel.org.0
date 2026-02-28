Return-Path: <linux-media+bounces-53807-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML0tNdWIomkd3wQAu9opvQ
	(envelope-from <linux-media+bounces-53807-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:19:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B51C0862
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD3EB3110C23
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 06:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046D8339705;
	Sat, 28 Feb 2026 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RXvlmLrQ"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013064.outbound.protection.outlook.com [52.101.83.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F833321DE;
	Sat, 28 Feb 2026 06:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259414; cv=fail; b=exvLIVxEyzDyRs0JQW368ovj80L0yXajb/AQvRfkmkWqhvd/pefUqGR4lhmcqzwWSnxvCsfxeZ80/oWqswCffpPiPiSnXIFSt0ADSsI0p2nGXnztK7W9toiwLPPBT3TJjOT+vuCfdGqKIWE0xSosqQEJhpAOvDM4FIiipWW+VHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259414; c=relaxed/simple;
	bh=1wuExgeASVTL+eCfTkPvna50NlxRchikkbKTZCj3mjo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ExU/caXrok14iO1FjkJvuz4+bnS7GO3Qdd5K1nds6iTpQq96FVWwhkQoupmFGKVs2tO468XEJ8XoxuRlEpmersy2i0GkhMxVl31PjZL2WWgCUIr7shu6It7DnZ3M50x0WmJsEJV/+hdt/jBWPxNP98bHFIsiqqlgUSz1O/cwFHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RXvlmLrQ; arc=fail smtp.client-ip=52.101.83.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUps8W8WC7/YdF5cm08oA5wA58nCyHDZBwL1MZdkyOd6T1DdCxEO59SbwUsvZKWwe236vyWOrTv9CZqiKBCWf/L+oBsaMvzbJAlYDQq013f0W6Nh13iB9dWzCkeoTLyongkYD1B1oStV4W2FlPqp1I9sBmWfbEfgE50LdIhD5SMx3IJeBykaD60ForQol646oLjPyjW5NCPFY2ApesHEwMdgzC+XMEzALXy7Pl+coWXy/DFffNYrQ2AaCBjFL2fBCIBfFjXZjiHTG6lnLtx3/q+ikfaQDGpap7JjKYoK60cVuKd01JBvvvX1hbi4Bqmfla4xg/9VnOZ+eVpHantwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIk76qODxn5DLV5chvk7lDsxZdlvYMvt3zSRXIHdjfU=;
 b=xEFzr43UEWd7WOoOMSGPCLJnbM+AXPA8wXOAg71GgqmoyT2zpAmVjQZXCXHtaT68thgi6oiNdd9pkWmaNzJXwSHtp9t4yqpNAH/xfceqZ/1ZwE3GFxv2ROsTiERhs3D4H2bSIxYe1waBibGggmSeXjV8FyV1roCxgfqIUpR6yCCGWoN13wjSgxR7UrLZNMqDo4Z5M3lmKDxhhj8Yn71I4mIRhVzW7nNb5khm02usQSE/fSuukm1OOW9fwKT7vyV8vgaXyNW5DN+CWh7KP6mUsxsBgP+33yoPLfGrekTjqid6mzNzMWxwJxpoOyeGQGYh0dKnG4PTsWn/KvMYXX6tYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIk76qODxn5DLV5chvk7lDsxZdlvYMvt3zSRXIHdjfU=;
 b=RXvlmLrQykJ2M9osvXxJ/CSecoBCHC9porX8ChwcUEibsUex39/+akYwbM51IQc05lcDHh9ln9jMK7Eljb3uSjs1b/+CIgpLpLhvWhSjGieIe+yFMBvMKaQMnrBDn1sSYe9Wd7a90edAZkCS41VQdEsfJCprSXVyzvo40q3J1VKlbsP9b9LnGvHErxBzQQlN494Y07QGFjkL7zb6RhGCJJW/Uazb5Ks/De4CZy2Ak7PNdg81wuSC0Z4bVNB0KlGBzEQQAvMFnGDrXyItuTejIJuqD8JHTA/5rEUvAUuNcw7/eFKx9o23suX0UlNBjHQoKDtRBXhbnJmU/lzwh77auA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:16:49 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:16:49 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Feb 2026 14:18:20 +0800
Subject: [PATCH v5 2/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-ds90ub953-v5-2-056cf07cc8f1@nxp.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
In-Reply-To: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772259522; l=4819;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=5vNm/7YzwZfGUU0D4E8ViozkZCXptMzh+HgyUIdjD6M=;
 b=xDKGLU+0c06HUm7u0w2yJv/MUfoYKygh8wR4qEXZzSS6yfOXpnMUqIU+Y0Hs75YkoX7gWFo5n
 OaxUeFnPP0jBZhgvpvRTo7fV03gWZwoPA9GHpT75VVo2hqEP6MUfl+p
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7a42cd-3b58-412c-9067-08de7690f513
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	efgtHXaGkHTox5ljjb4HcDMGwjLPS+0Zvu+J2iADGWMjH4S8IBW+c44wgLw/ZtoMMGyxISrKuUd3bnKnRuA/PIGmUmvQLimAeZq24nPuut2q+d8fv1JZuGjNnGy++ripvH+qxepJFjyjA11PlaSlWUF49Pl7d2UcsZB0sQxwMu4PpIeqB9Aih72ho6ZpqGuEYmmYmL+xh59OMyZBJK0RDgPdNc1WbN6JLhDhrN14up4DQfMk29PzJguAiajslr4hj6jHtxKixPVJhR9hNoURXwOU3lnoLgPh8lfhyM6I0ZJdYgC1SJWMjSZI2wccwcW6nwqzuEaIOY1DWtIkPHamJ7WQhNTE0hm+nD6xqmdUNo3wTmpOuAXtAfgw1/XoT9CTK6lEvTb/Qc6pzoSyPCEvd/MwioUHNWjHXsKIgeLzVFU+FW+rSkfUm9XkA5oddj5ujnP0HFw96399i9AckLnkg5t6OaGkIouxb4pYX6zelR2No64DXhtwpnus0+buGyB9c3UsG6s8RoyC+AU2ePTDFBAI70d0UcJEjgOMpbTd328KZRFMZlsPHdoQTiuiPOdsWrsjIRSTfxEIMfEr7AUVYRU96EjC37aG9RsD200cP5GIYbVnlhYd6tXO221/Ziemh4lmVFFyebEWxGR5a3NVAI9DkmtS4cOde7HlHTbC4Eqkf7VCEFjqRCnirDDpbm+kvYApXZ2Oytf9PPrl3UnoXj0iu5rZEgGeuLCuulvUgRrqLkgK6K95P5O6qJXxxpTpoBCoPxPKdEPmwEf82bRxIteu+IriRcvnttR5m+2PJuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xRRTBPKzhPanZjQkozSnZlMVlUTEI4M2xoeDJWUEhrUk9MK0MvcWhwSk5l?=
 =?utf-8?B?UE92Y1ppdUVQM2dRQ3lZcVZYM1NKa2huNFk1UnJBZjJMS3JYTFN2ZVFkNitR?=
 =?utf-8?B?OENTTFBsWWg5eGZiZi93MTkwdkZYSnJ5VUhPT3V6L3AydThoZXJFTldWVXdl?=
 =?utf-8?B?SVN0eXQ0dWJPVEkyaC80cXMwdXZ6UVBVLy9rU29rUEdrUGF2NTdJcFQ5dmNP?=
 =?utf-8?B?VlZpYTd3WXZFbDNCbUV3Ymx2Tmd3OUhlRy9kZ0lYZ0d2R3p3NW05UnVlWVZC?=
 =?utf-8?B?dDFNN3N0cldMYnFOTTVkRHRhb24wN3VHNEFGKzVMUHVyQnNTZVEvV3Jyc2lQ?=
 =?utf-8?B?emN3dWdBL2J5M1gxYTlCRUdOdDA5anV3N2NlRzF4ZkExblhENEZqeW5Sc2Ny?=
 =?utf-8?B?OUxnaUgvdGUzLytGTy9BVlk0V2x0MnpWZkpIYzk2NXViZVdFOXdhZUs0a29o?=
 =?utf-8?B?VE9KNVYxS2ZpNWZqTWJhcktrS1NSV3V6eWZKWmN1OHoySjgrS1RSeVRVSEQr?=
 =?utf-8?B?TlpUSWF5RGRCNXdKQW1LTFZpdDdnb3Jka1dsMktWUGxwMnRlZnd3YkM4emgr?=
 =?utf-8?B?ZGVMN3Z6K2hRSTBRRUYyUS9scUQ2TVRuYVJRTUllYXM5bFhFSEUyRGkxUDBx?=
 =?utf-8?B?VEN1cWtORjFLVTBFVzUxUTNpMEwrM2svbFNKQjhCT3RPUCtoaEUyZUlOMith?=
 =?utf-8?B?a1BRUDB6b01MdFlyUkl5RHhXQWhsRVZ5RHM1cWZkQ2xuaFFyL2xXVGR5d3NC?=
 =?utf-8?B?cUNBTnFDTmZ2Zmx4MjNHSW1lTUtFSlU3R0ZyajlPTnppNnNHTlZvamJOdlNJ?=
 =?utf-8?B?clVlWWQ2MTZCK3VuUW5QRTVPc3hERlpFSGVJZW5Oa2VIWTV5dG9hVnBPTU9Z?=
 =?utf-8?B?ZWsrUWk4TGNwUyt2WTh6ZzBDREpsblNHS2h6Wk90VzB0ekxrdWQrTW54cjE3?=
 =?utf-8?B?cURVOHg5bmNPWllvYlA2ckkxMUhkZVlLOEZ1OVhaYzJjcERsMnVvM2NEMGUy?=
 =?utf-8?B?UCtUN1N5TUpPb0pESFVmdEV3ck1iR3pyQzV0R2M1Mm9YRmZCNGdXbHZqbDZk?=
 =?utf-8?B?OW1zU2RqS3RQcVJEaXpmQjNKSEdWb3ZMWEY1WjVidCs0d0p5bDRFU3ZrNlAz?=
 =?utf-8?B?cC9wRk1QbkNHeVBOckpjcVp1YytCZXZZWWtLNUsxWHBwV0JGRFVuSTk4bUVM?=
 =?utf-8?B?TnNUaFVIUmxhM0lDL2tJUU9OanAwZkpIUUtzYWdPaTR0VHo0dEVPbFp4LzhO?=
 =?utf-8?B?a2FNMk03SFgzU25udFZHNC9yS2tLa3BDWUZDa0xaOXBoRndMZEEwQ2dUU1Fv?=
 =?utf-8?B?QzZtemM3R0JhRWJHNThUWFAyN0tPQnNTdkd0cGswWmxmdnZLdlhqeUlLQVJs?=
 =?utf-8?B?OStOZkhKbnRsaER4ZnNzeVJnV3ZZSkZRSmR4QjdsS1pVaEY4N3RTNGtJZG1W?=
 =?utf-8?B?MGhJN0YzRERPUVlVcGZ2U1JlZ3hSRVFRK014MU1VajE1RzB2c2U0WkhuenlK?=
 =?utf-8?B?SVBVT0d0QnJHa0FTRHJhbnZCaFFzanlxdWtlNkJzV3g5RXFGZ3hyYXFvcHp4?=
 =?utf-8?B?ajJiZzQ3QkhrOGExaWt2dDRLTnlVZmF2Wkd4ckpqUXppZFZHMGpMRXRnSjJs?=
 =?utf-8?B?S0JyVWdRaE1ma2xvVnNpYjZ3UkhQdm0zTjkvV2ZkdXVqa1RhdDErbWtZTVpB?=
 =?utf-8?B?VHFqRWtzaHRVTlAxcHlrVm9zc2JpT01yZnQ2UDBRYjZGZmhZRW9ZVTV5NThQ?=
 =?utf-8?B?ZmdjWnBVZWdOZkFFLzBTRmc5OFZ4Z1JXcGFBV0NyUzVSNWgxNk44c3RPNWRG?=
 =?utf-8?B?M1Y4dEdZS2VPQTZqU0JDUTVPM09WYWQwUlhDdHIrM0x1QkJjRVRUQWNsU1hZ?=
 =?utf-8?B?OGliL01MOE93dkNtT2RMdUNKSCtSTGhKQnFlRlNGL1U5OWdXdG11c3FTKzNE?=
 =?utf-8?B?TVNqbDFwdk5PVEJMMmN2V2tZVGcxbHVjVlBDajdvejBOMjFkTnB0YTFOSWJP?=
 =?utf-8?B?dGQrU2pCN09HWDYxcU9DNmV5TnpLdGovelhXT1UrVjhhb1p1b2pMOElVUUlw?=
 =?utf-8?B?aDBXc2FNakVFeFlpYkkrL1ZJNUVHOTlaRHpHTjB4bGNpRWd6Unk0V1UvT3VC?=
 =?utf-8?B?d1JyOGp2MVpveitRV21VekNQSk9TOWQ1MC81SEliQk1Cb0lLQjBqL05wallk?=
 =?utf-8?B?TzgzWHB5WDgvMWc0UHBhV2Jxa0tsdXNkWkdQWGZ6cTJRYTErSDZsa1ozNGJx?=
 =?utf-8?B?Sk51RUtDZmltcFBqMW95QzNmRXc5VzBPejdEc1I3cUVOclZGUDhyQjBJaWxV?=
 =?utf-8?B?YlVTQi9LbHJHcTd5MUJHNzdkQ0VXQ0NaUTArbTNldkJqTlUvKzdHQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7a42cd-3b58-412c-9067-08de7690f513
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:16:49.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHn798FyzKg5JYX901BwRYJ7BA8jgFkqT27fR9rIfpi+4OQcWGTddpda3bvo0nu6pqmJ0ypSC/IBgjbursn4uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53807-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 388B51C0862
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ds90ub953 supports GPIO0 through GPIO3. When enabled as an output,
each GPIO pin can be programed to output remote data coming from the
compatible deserializer using the register LOCAL_GPIO_DATA[7:4] field.

Make GPIO range from 0-3 to 0-7 to support this case. 0-3 for local GPIO
and 4-7 for remote GPIO data.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v4:
- Only log GPIO 0-3 stats since remote GPIO 4-7 reuse GPIO 0-3 pins.

Changes in v3:
- Update driver to expand GPIO range.

Changes in v2:
- Parse gpio third cell to select which GPIO pin the data from remote
  compatible deserializer.
---
 drivers/media/i2c/ds90ub953.c | 42 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index daefdb108fbf402453baeaccc61d1f3530521d74..14dd0aa4cc6ceba66a8c3545c7d7d19694007431 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -32,7 +32,9 @@
 #define UB953_PAD_SINK			0
 #define UB953_PAD_SOURCE		1
 
-#define UB953_NUM_GPIOS			4
+#define UB953_NUM_LOCAL_GPIOS		4
+#define UB953_NUM_REMOTE_GPIOS		4
+#define UB953_NUM_GPIOS			(UB953_NUM_LOCAL_GPIOS + UB953_NUM_REMOTE_GPIOS)
 
 #define UB953_DEFAULT_CLKOUT_RATE	25000000UL
 
@@ -268,7 +270,7 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset))
+	if (v & UB953_REG_GPIO_INPUT_CTRL_INPUT_EN((offset % UB953_NUM_LOCAL_GPIOS)))
 		return GPIO_LINE_DIRECTION_IN;
 	else
 		return GPIO_LINE_DIRECTION_OUT;
@@ -277,6 +279,12 @@ static int ub953_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 static int ub953_gpio_direction_in(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u can't be programed as input\n", offset);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
 				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
@@ -288,10 +296,14 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 				    int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	unsigned int pin;
 	int ret;
 
+	pin = offset % UB953_NUM_LOCAL_GPIOS;
+
 	ret = regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(pin) |
+				 UB953_REG_LOCAL_GPIO_DATA_GPIO_RMTEN(pin),
 				 value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
 					 0);
 
@@ -299,9 +311,9 @@ static int ub953_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
 		return ret;
 
 	return regmap_update_bits(priv->regmap, UB953_REG_GPIO_INPUT_CTRL,
-				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(offset) |
-					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset),
-				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(offset));
+				  UB953_REG_GPIO_INPUT_CTRL_INPUT_EN(pin) |
+					  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin),
+				  UB953_REG_GPIO_INPUT_CTRL_OUT_EN(pin));
 }
 
 static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -314,12 +326,19 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	if (ret)
 		return ret;
 
-	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
+	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS((offset % UB953_NUM_LOCAL_GPIOS)));
 }
 
 static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
+	struct device *dev = &priv->client->dev;
+
+	if (offset > UB953_NUM_LOCAL_GPIOS) {
+		dev_err(dev, "GPIO%u be programed to output remote data\n",
+			offset % UB953_NUM_LOCAL_GPIOS);
+		return -EINVAL;
+	}
 
 	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
 				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
@@ -330,6 +349,9 @@ static int ub953_gpio_of_xlate(struct gpio_chip *gc,
 			       const struct of_phandle_args *gpiospec,
 			       u32 *flags)
 {
+	if (gpiospec->args[0] >= UB953_NUM_GPIOS)
+		return -EINVAL;
+
 	if (flags)
 		*flags = gpiospec->args[1];
 
@@ -632,7 +654,11 @@ static int ub953_log_status(struct v4l2_subdev *sd)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < UB953_NUM_GPIOS; i++) {
+	/*
+	 * Only log GPIO 0-3 state since remote GPIO 4-7 pins reuse local
+	 * GPIO 0-3 when enabled as an output.
+	 */
+	for (i = 0; i < UB953_NUM_LOCAL_GPIOS; i++) {
 		dev_info(dev,
 			 "GPIO%u: remote: %u is_input: %u is_output: %u val: %u sts: %u\n",
 			 i,

-- 
2.34.1


