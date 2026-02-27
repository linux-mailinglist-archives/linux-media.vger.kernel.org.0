Return-Path: <linux-media+bounces-53693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULbHNsN+oWlxtwQAu9opvQ
	(envelope-from <linux-media+bounces-53693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:23:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2861B682B
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04C63311FFA1
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A6E3EF0BB;
	Fri, 27 Feb 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V77cs/LD"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850063EDAC5;
	Fri, 27 Feb 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191188; cv=fail; b=bTkRjN31pQ3bIgqRrUOjA0KlH84kSOwJ1jDgVtrgcGlwdaBBT5dDMKhboIuBcLN4ZSx16uO3VaFJZiy5uf2lfCTaWOpea2jDqkvBMExNEgePHJg6KWBpl6speETjMVCCaVcIE4dxxwB1mWny9TKcHORNB+C/rG9X6sW1AQCtp9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191188; c=relaxed/simple;
	bh=ore1IFN0JAX7iRYKgaaTxmKz10F6mdKkJRfOVzt/i54=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oWZZJd05fYs0uWPbLhwtM8Im+YvWN11eNErKZugeA+PRnkIqlrkR0nSbFYERy1fkF22j91+JPMdEymivF70La8U6jt9DtB18CNLaDH823ETref0Fqvjc2Iuo+3WIRLyKIl7acBxoAqMZvR+qEL60BUSykQ4/WFp851CjV2CCqZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V77cs/LD; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQE+8rdLyf+fasG5Wy8usy2jVMkmqdWMbNePky5GKfSkexxPimobdl2e6Qa2kTDbNOwjO9JRcjXKSu1kozVDMnn9PUJn+r7sJNd9XEi4wzlQ9+A/lIBQU9OSnbhlEs2+kY4tSBKKxrC2/sBMblCBiQlPEFA1yfO5cbu93uEP6dw6v/AQlvS0ZHNjJ1g2R6RAGHjkp//l65Gg+0Wq/JrD7cv/K4XJu8P0Cif7V/W0th5K9nnPMUSNX2YyK3Q4yP8duPYPRPXTsCdrFMuJLX3GCSKFzv3dMP1xD+YsIFB99W4WJ2WJTzQayYG5qyMQsq3KU/+MuLbgpMTYyM2X6hAQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PF95Mv+uMZVyYEwHGA1nDKV7VMKtclIbRFQg4zGCO9s=;
 b=YPO8A6E9RC5r0bEBuAiwg1CHrvOuz64vkHVVibylPdfijjqjAcmWKiXu5JfeHvOTEsMyM5qfF01CbllvmzsJJQQ4MMb9j+AUqNPefyUBLYjeZss4LI6HN0kcN3GO8f1ZnDgTD+B4cASlXPuzsczoE/kHMa4eRs/u/P3QtszTUTVlvRi9Sl9lLRsvOxXO8mtlU5sAW7ouDHmmTDTstxdt+bV4w6Rkib49IBTs+iIzzg/iJBfsq+vqproWGcgkK9awnFejZf5ynZvhUBTgLmDhAbjc/02+IODU0s4ekT0Tj1tBiFIi7+RtyzIv5QYcvC6EwIf/P/PhTovWNCNj+gy4ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF95Mv+uMZVyYEwHGA1nDKV7VMKtclIbRFQg4zGCO9s=;
 b=V77cs/LDGm4KPoh3EDYBFWVjoT9YqCMg1ddVFgh5iE9JcE/9RNvie2/e/z90sjELh56CtQWI2yj2oipltfskE1/rySUjGcqcAM7Ru0AKSo2RRUWxcy3FDTOaSzE3eTwEv6EaTwiXxNbFW/xScAcUmBbVS6cFAIeo5XMJCxAhdzdeqvum/S5AYXBLHDRo0HNQod71/NN+2mJQklqrv+ZGMstZa9Wu4hjSaJC/jiiPvnGlMt0fcn6wtGBncQX02/5sPJcx8bokP9exb9GWyJRcu2GnfqTE0BHx5cTGNjDfuNM8NiULPouHIOuaKzL0g0olazlGa5LccgK2jOuOREyBQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:19:39 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:19:39 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 27 Feb 2026 19:21:12 +0800
Subject: [PATCH v4 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-ds90ub953-v4-3-dea596205f9e@nxp.com>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
In-Reply-To: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772191287; l=2628;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=7CksTlZU9zGrYvj92+U8xHf7qBBsXdtbS4LgUhKVieI=;
 b=jzgQ1s2W6nhWIaDavIFC5oSpU7U90FO41QlWKkdNCY+cFp6h3J93+ybnzGmcInyvBsRgz9Bn1
 x8LqPzimm8XB2vhB2AkFOfbhcabI3ce2q1m8lUfrcYLX0S9IpP97G1k
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 8444b854-8ef8-4c4c-6b5b-08de75f218c3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	XmhL0vLiisDXIDdZ6jwT0wpmzDZWN4tqImpavuxtf+54ZRk8oeGJtFPZBhcJmp5arL+GTAYmZbZ6l6W2l4ShjRvKNcxUyTYbQ4/9bKNlKKhtmZku8bEwQnBU55KDfJPNuvB7wToRpyX98vZMRWgkR2aBTLsEiCW5x2rntQ+Kw/RIfWglB+tKmG74XO6YZBdzdIgldRH13JGGCzWRmMsmw9JhHYFV5ZSDQqJ4QpMENgUATh4mxZ0Bwvcui+bnm9ccGqWAxxFuy9bcr1ALVjguxkZov3eSdiCGDkWR82i/f7Y6q84nwXRdPBri7RAQi8oS4m9bLmOOD0KsnompPNHha9/NvJ+lPfQiYE142Z7e7BVq5canEe04nNVaqTJb/VPRx66u8ycPBVznkAYZmtbcUWwdgmlbPIml+T9LHn3u/EtUeADAveRGttUXWQeZPTK02qBvlzC1u/amjJgS+CkGeowkQZwxgxydt72SJk2pGH6hIIFVMP2IfG7kihDgZP7z4v/HwZGg3eHdqoLNMGo9AjscCjMEHjJjYTeNiA8qRUng/zFnF6YZDDXDe6oUMBedzWnVzUuKbEdQPXyp2ZDb9lnFrHFm6H35iHb3m+rjfMttnbKot8iO283uW5lNMAI+IvsBTOxtlDl/JI0bmWOFj5rzoaZDJzLvHNSUcVEplK/rlG0C8fs2jgV/E17ro9wDuyigtkvIktCOIAo+75fTlY4gviuojJe9gJdy01CCL/26wyWOoM3T8+n+Q3iD9CTfwd805Lib9hAHzpjJdkAeZKHT/LU+1sGoCSJroTRX0K4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0JaQVhvNGdaejEzZkEwaWk0K0d6ZHlHRm83VzBJNmUwV2xLTFdFWm9IRisw?=
 =?utf-8?B?dWY0NURWRjZsM01wL1ZSZXhvK0NmOWNjUk8rR1JZRkVJanN5SkZBNGxIN2Ev?=
 =?utf-8?B?Z1J2bzNMNENHdXpmVkQybCsxTGIyeUxFWTFJSTZVejFsSHdpSzFpUVlQQjVB?=
 =?utf-8?B?YjNXOGlrL1hIaFAwZ1lOaTYyc0o0amdlLzhlcmd5WHNUTmFHNGRoU09vUTVz?=
 =?utf-8?B?d0xkTXBPVEd3ZUNneDh6ZGExRW9sNkdDOVdNUzlSNjQya21zdjZhY2NUaWRW?=
 =?utf-8?B?WmJVQWZOK3h0QzQ5VmpPWm9ic2ZSQm0yYzIwZDIyRmF2YlhNbDZoUHpRY0R6?=
 =?utf-8?B?dGViT09ZR2gxNUQ5YWpoWXZMQzVXVUlua0t6ZVJnRndxamtFSDNqbGlSOXRu?=
 =?utf-8?B?SVBNVFNjdjNQYXg5c0tRTmxoeVVWOTlLSnZmQWhROTNXdXRQa0ZSbWhmVGsv?=
 =?utf-8?B?TWF4QzlnL05JVExReGViNXdRcFVuUjdwVi9QS1BrdXZBZTlvdktlREFnOXdP?=
 =?utf-8?B?YkI0ejVIc0RobStCTUJaaTRERm11Z1NqcnAxd1lXK0ZWYVcxT2FQQ0oySXVK?=
 =?utf-8?B?NDFwLzQ0WDhVMEV6VnVPMUlGU0lNMzVsSGRKZnZMUXQzT29abFRud2I3ZjZH?=
 =?utf-8?B?L1BINHBXMm5PcitXTlh4and1K0hQVVQxSExzcDJpVHNNLzRRZmNYQkhWVkFI?=
 =?utf-8?B?ZjliTG1hMk5GSnpLbWRadkdIZjJUYVBsMHFZSHhxaFFVYy9vUkpwMHRsMUJa?=
 =?utf-8?B?Zyt0KzVnYnNQT0I4VUxQY3F6T0piclJQemFMa2hYOERjNE9pV3h6NVBQNHRh?=
 =?utf-8?B?YWk4Y3dybE5LKytGSWNydC82MXdkZ0M4THdFSkF0UnpOTHkyMlE1NkpuSmJ5?=
 =?utf-8?B?NlJRWStzMFJZamZnZ3ppWm9jbW1OZm84NTdSM0krUHdHM1FqOWVqVWVzMGNn?=
 =?utf-8?B?V2F3dFZ0V3NXNkVqSGcwNUQ3RDZVTy9jQ214d3ZCOWVrRXlwdTIvVm04SmpE?=
 =?utf-8?B?TlVHRnJQNW9wNzRiREg3MTdJQjdWT0pZOWxmQXN1T2MzVGpoWVdoRWpzQXRp?=
 =?utf-8?B?a1FsMXozRFQ5a0hwUFVGVm13WVI0REYrT1JlT21hY01lRzdEd2diblRMY3Fz?=
 =?utf-8?B?RXpVZWx2T0tqdU1hOHVheUpOMDA0cHpqMkxrQWFJTHl6anJkV2dRZ1RONDFl?=
 =?utf-8?B?Y1IrbkZ6Ym1wQmpHcjB1OEd6Z3NHZ1RNY1Y2SVY3TzJSejNnWEFvZVY4TER0?=
 =?utf-8?B?UjFOamlMQ0hvZ2RnSnJWSHhOVVZiNEhWa04vZWo3MWRDelRtYmQ0czVReVox?=
 =?utf-8?B?dmZuT01RYnNlRUhySEV5Q2Q3MFNUdHJDZGhlT0psWCtTSGR3MmJqcklqNW95?=
 =?utf-8?B?bFp1OXNQa0dEY2F3REM3WkJ6UUFrTy9qeFRDS3ZPbkxacURTVmwxbno3cHR3?=
 =?utf-8?B?WGhDaytaMjJBeEl2UWtuT3QyZ2YwWjlTKytrM2MzMHlrbVF6cEdJNFh4Q1hr?=
 =?utf-8?B?dHV3aE5XNXcyVTdyZCt0L2d3em0vV290dHdiY05yOVg4S1FveG80K21wakpH?=
 =?utf-8?B?QVRYbWhleEloVm8wZWpZV3NnWXlvU3E5YU1vNmhtYVEzQi9TaGFQLy9JQUw5?=
 =?utf-8?B?YnM3QWhxMG9xUXpmc2RFTjM1L0tUTURtOXpNUHlvR0cwS0RtNEhOM0o0ZlNh?=
 =?utf-8?B?MnVuV0lXSE1zMXA2eVZSZjlhWm1MT25aMnJ5bHR6ZTY2ak1XcnhDSFhTTU91?=
 =?utf-8?B?Z01KeW9yRS91K3BhdlJRdWhzZ2VoMWZtaTVNMVc2T0dWWk0wdk1IbjRVMEwz?=
 =?utf-8?B?TGphTW1ZRXRwY0VmVVV4S0dnV1lnNTlRd2FvWmFsc0pmQWtFQldLVE9pV3VH?=
 =?utf-8?B?N0NyajV1VVNVbkpBMkdaUUdETW02SGhsV1JsUlJZMFFielBvTVViK0huVUtK?=
 =?utf-8?B?MWtxYTVaK0hlUU8wTnViTlZ0Tll2VEdwZVdIYUZqU0lzK09abkJBQTFvSndx?=
 =?utf-8?B?UGQrZTExTElEMmVISit5N0hjM2VERlBZYjJ1UTlJaGR3Sjl4a2crenJPQ0Jm?=
 =?utf-8?B?aERPQVRRWFJtbFlrcG51MGVHbC9HaFEwdEdKL3pNdlQ4ZUFiN0dPOXdkVVB1?=
 =?utf-8?B?RWhHbmZnNktrNSt5UGxFWlhwRU9kcVdyYStlaXpkcktoVHhaNSt4bDBmcStw?=
 =?utf-8?B?aWtFUURydkc5S1BpMDhnUDdDNWFhUkZjTEFQYnNxa21PbG8yMWJxWXl2eFdt?=
 =?utf-8?B?ZGhVQVhIaU5MblZCbm90YnNDWHRGampkOEQ3Q0x2WjZxZkpiejArWEFLSExv?=
 =?utf-8?B?S1BsSytsb2wwc0twZGdCcXVTRVRsZGM1VjhNK1ZWZG9mYlNvZFk2dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8444b854-8ef8-4c4c-6b5b-08de75f218c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:19:39.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlcO7l7cMGu+dNh3KOaIhHnGLqcPa9OFWxdpUOHsIcCrZ61KKP+IEN/UcN2Y3uM8g2OkcbNcN4sMWj5XmxUWyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
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
	TAGGED_FROM(0.00)[bounces-53693-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 4E2861B682B
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_mutex_init() to simplify the code. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 14dd0aa4cc6ceba66a8c3545c7d7d19694007431..a85c6a9b64070491db161ca1586179dba9c69cb0 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1345,7 +1345,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1354,32 +1356,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->current_indirect_target = 0xff;
 
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Failed to parse 'clkin'\n");
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1403,8 +1399,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1419,7 +1413,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


