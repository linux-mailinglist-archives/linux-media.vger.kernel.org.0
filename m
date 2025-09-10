Return-Path: <linux-media+bounces-42173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4189B51312
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D9793A15F6
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5F3176FD;
	Wed, 10 Sep 2025 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bnVJLMIB"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1393164C7;
	Wed, 10 Sep 2025 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497522; cv=fail; b=SVadNo39gtc+IGdZvBSV49a/OCbd/SE0a36b3mTcavFyolnu67lrb5dFSNq83J1GgR0uBLI6QAcRAHFPPNrhndHPxqTWIGK7hqWVP1roze/8myXOVoZuBccr3plcKLnSN0NDqa82ufqhsVy39fOhgVNcS5k5MPA9dlavw1zrWvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497522; c=relaxed/simple;
	bh=D5Y3COLAcHNi91Pq8SBHE7qJCFI41xY6ArEWXBXp0Pk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lkTfoWO6Vq/JfPFG3VeQS09aKwh0QI+Z8r8BHXIsB5U5o4tHG0PTTtz7BjqoJndAJTjrZi+0+AZYy2RfHMm+wYmEbjcd1+T6v/wIh/+7otugRAMAToMB9Yjd6/Nq0RpAiCAGvynw3kho5olvfDwVoL7T+AZacDDeC8WGs2iJBXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bnVJLMIB; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxb+24QXWswcZa2bN9E3OUFATFYhwQHk6cvGd9hLsk4UENH9+I9yBWX3rgyq0XCagvnPNjqdbz9xD9rU4uxD3l9CaQVtn7rOgLiS36HxJRdwU8FfRdpShNRzyu/B7Hz6fnTJ1zXxZTOsASYvSS7GNpV81KbxQzyHucJkfpp+KNK/5Y484yJm50WDCP/aCCQ0l0KACe3R+QvFhmtGe25y9aVEgGVCXlMcxmeMWaHsBavSCPRvmc0fW9jBb0fqYJlMtw6UwhMzW+XeqFZ1OmFXbGcfeGUgjYEds9NMNegV1jNBs+3osNWwHgEjuyAQljHfbCOwj1rajeLY90/27W4Mfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgOMY82UeLTzfSXW9l4VfH51f5dnx3SVmKSBL8MsnRU=;
 b=YZk5qTpbWdgbsHz7XetefGjEuYh+iCLdAllpGDyzN/Wyq38g7lanSNvR+xaPoZ0QU04dw7bgG62MTrQYo4/0ZYR+7eEbjQkejoBo1aSA5BXvZQbVbfFw9jQbDvnftOxc7G4IwK3x6g7diBhJr67W2vy8GwSt6B5uu87xlGF4CQE6XL65XJYzk+PIvi4GHDOqC4CzHc6wmzWpyuUbsjXNFYZ74FlQ446bUrrqljOEJtBix5TeGcvpnjOsRILO97PehfjqHCfNahTuo8rdCD2Sp+2ET61buB64DUQG4a2436GzPWj4gqU0QV48fhJwunKpM90rYU4vb1Ru2mQC7a84RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgOMY82UeLTzfSXW9l4VfH51f5dnx3SVmKSBL8MsnRU=;
 b=bnVJLMIBLCyfVM4foiNHfzM1e5jg1Fr+c2tjrrh4X4U33fesWIr5xvaQTzq0BS18QStbqi9OOWccus9urRw3uAH0KhlNz7wmye7uJBqxBnNypLs7RYnpL9nxBb0iQdqDt3x1cazdeYLt/1et1mFt9/VRZRdroG10DLX2pfEw4wY3PSR8jhz42yfOC92zp29ucbY0X9kSIiOAlLlMA75br04gi0V5Gnl47fQe8q5fj63Pba82Dgu1J8SVOCMqRoFwhEW8tDW7odxDzsDkZW0Eeoi/pL0gCmRGNTbNJsAct4jhTpqSFB9BrasR3wa3Ag7m3jsa5/AJqGbxw0D4OEXbMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Wed, 10 Sep
 2025 09:45:14 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 09:45:14 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 10 Sep 2025 17:44:41 +0800
Subject: [PATCH 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-ds90ub953-v1-4-a7813ffbdf11@nxp.com>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
In-Reply-To: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757497507; l=3282;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=D5Y3COLAcHNi91Pq8SBHE7qJCFI41xY6ArEWXBXp0Pk=;
 b=eGhETE+clP48+otChnEq3TyKcMLfKNPtz4aY7uc4ECJbvnL8yB1txCsnsEjTGjFYv05dyCuJe
 DKkO8/CcpYjCe1L69t7H5on7HiS/QxsIbBCCsYh6VfVQqOloN1Tyf42
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ae55c1-d160-44c6-5b6d-08ddf04ebde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkhaS0FkbXlNa2NuL2t6aTlZN2FLOXJTYksyQzVna3ZNWDVZYS85Y0FxaS9y?=
 =?utf-8?B?cXh2aVdzcFpXNTc0TjhrZ0NlZFIvUzNiRU1aV2dzMjFYNG5OdEhxbFdnMnV1?=
 =?utf-8?B?NmFaSE4xMHBuU3Z4RXh2YVh5YzJqTFNTcHo0TkNWZU9iTEUzTkNtZTFwRUll?=
 =?utf-8?B?THpJOThOdWZWUUUxbjFzVXRacG9sbUw0NEp6bXFOejV4Sjg4ckhmRktBN1VS?=
 =?utf-8?B?eHpvb3lYNjNyb2hGa0pSaFRqdkFaMTNqRXJUU0Zvc0lMOHFPTkltbkRXTzVH?=
 =?utf-8?B?SWRFU24yb21vaXhjMUswN0diZ3c3a0NWVXJYNUtEY2dvbXEwZ1ZsQ2krOWRR?=
 =?utf-8?B?eDd1QU11N05UN3JCcG91RndlUUpRMng1cHJ1M0lGY0FnQTFZODRxeGdJL2dC?=
 =?utf-8?B?NzZvWTJyYm91TkpERXBXNGRxemQ3Umd3aW80V3l1SDNaMUdoUFJpSEZwaVZz?=
 =?utf-8?B?Mk1GcjFTY1lSTzZqbTRpWUJuMW1SRjEybWIydDh5UCt2aWhWcGo1OUltS3Vv?=
 =?utf-8?B?anF0UlFtdzlJbjhYN3l3VHp5TUp6OGw5bnhwcVpNMmI3ZU4rdVZxRjhTVlk0?=
 =?utf-8?B?ZWNOdzdsSzI4cG92elFKOGQzbFhyTVk5ajExRkh2eForeW5XRmZ2ek1VdWpN?=
 =?utf-8?B?NUpGYWlNTW1LVUlha2lCVE5aTGlJT3ExMU9sTlBpelFtbS9tZ1JwL2EyRkVB?=
 =?utf-8?B?N01MdVY5T1ZkWXJEMkxORjY4a2NGQklTNk9RWnVBbjZGRjZEVE83MTFDUmdW?=
 =?utf-8?B?WHhPTjY0aktwSzdtTWJmWnJFbDZXR004OC9vM3N3K3JZMkRCQzJBcU9YYlFJ?=
 =?utf-8?B?WGcwZjBPQ1lqcGltS2JpMUZYckdPalY0Z25xQnFIYmErSnNIVU9KRzJoejVh?=
 =?utf-8?B?YVVYSFdScWNNUXZ2dlRoZ0JZZ1BvYVJnQlRyQ0twbUdpWStGeVJJNXgrblZj?=
 =?utf-8?B?blRvb2dJMmhkQ1RMSFVEZXJaNDluUGI1SzFmVWV1b3N6Y1BBUUF1MlU2Z1JP?=
 =?utf-8?B?S0MrUXAycElsWXBiM0lZeXFWOU5MMDNaQUl5aHNrZCt5eHNQWXc3eE8yODN1?=
 =?utf-8?B?aXU4UHhZbDBvQ0FFbm1JM2dXYmdhWWZVZzVJNVBKOGk0aHR3c0RSSVpmSm5T?=
 =?utf-8?B?MFRYUXI2ZFVhZzJweHNUNWNSRStrOTBpV0w5cW9veFpGdGV4RmYxN0VxMk9w?=
 =?utf-8?B?WVl5aktCYjRmUmNRYzc3UkZrU294ZGJHRjdiRTZsYUlVY1pPNDZTQjhJRXVY?=
 =?utf-8?B?REZyZldWRkR1MDRmQVN2K0txRXVwT1kvWlFkekUrcTFzRmJTOHc2eTJJS3cw?=
 =?utf-8?B?SUh5R2JLMmQxL3RCTXo2cTRYdVJTNmpDKzRWdXhKblFXM2syUkxRZTVLNkJs?=
 =?utf-8?B?ZG5WTjJLVHZYOGVqWVNnUWhMcU1kMlRpYUJKODFoWWxwNkYwTitRRXFXY3FR?=
 =?utf-8?B?czYwMG9ua1habktwa2ZiWkNzSk1TSmlNaEtUNGs5T09nTVFWYTBId0d6blR5?=
 =?utf-8?B?Mk1hOTNtN0QvcjM5WXpVSXFSdHVyS1ZrelZhMHBDWXE2cndVblNwN0dLME9I?=
 =?utf-8?B?bytSam42OGs2OWxXektRRGdzc1M0ckcrbTZXYlJoTXhlc1ZXLy8rSlZUcFIv?=
 =?utf-8?B?dU13MjhnZmh6akRDeE0wdzFLMTFXWHpaSlJjc3Q3bDIwUXlTU3RoY3FJa01S?=
 =?utf-8?B?N1RaME4yRkFWMTBZemhMZnNjTzlFZmFmdWFRcmNCWjlHTGhlVzg4MENvQWh1?=
 =?utf-8?B?QnlrOUFKOWdpVkVXZUcxam1PczNYalFxYzlaZTR3THdZUW5zSzlLbUNUcGVS?=
 =?utf-8?B?d2IzRFNoa2F0QUxWTzYzelNjM042VFhCNE14SmlJMnlhMXZXNjVSbFFrUy8y?=
 =?utf-8?B?c3gyMEFyVTRGbzRqQkFVZGI2dkQ1WDdQNU9hOFd3VXhabGZEdEIzWmZVQk8w?=
 =?utf-8?B?cnR1bGQ0Z3NsSmk3UDUxYXVwVGJYWkhOa2Ird1hhMk1DYk41ZDh1ZFI2cDVz?=
 =?utf-8?Q?QilGM4ZMhJh9EtVmH3DbOIhNHYgK9I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ttbXpDVmxEa3JTSlFVMlpmN05GL0xIbE5admxjYWsrQm9QWkhVZWMrd2xt?=
 =?utf-8?B?YXVQdGtxL2h6Sml4SnkyYlNvenMrT3hwWkJlVnY0QlhJdTJXNUxQRXpabnJ6?=
 =?utf-8?B?Z1crQ2kwTk9Da3Z6dDBsaVY0RTQ4QktBbUJXV0pmWGZmSUtTV0VZV1NENFUr?=
 =?utf-8?B?bkRFbWZydVJZZWJhQUM2Ui9kOENnVzdkZEpWZHl0WVFsa1hGWG41aXJZTGF5?=
 =?utf-8?B?T0V0RkRMbGZIbk51TVN2ZHVPWVlrc1R2Q3NjRlNTY2pFOFd0c0FVUkJHMlRx?=
 =?utf-8?B?cTNrZUErdUVMa3JWYUJYOS9IeW1LZmRaM0RIYWpqZjluZXZ4N25NUHNjMGtG?=
 =?utf-8?B?Z01rK1AvcjBQNFhJakJMT3Zpa1hnK1pTQ3hsUGw1WjY5bFUxNkJjQXdsMy9L?=
 =?utf-8?B?SGdFS25oK212bEN6d2ErejBxWElPZnlXMDQzQzBnSjB6STdwSERqdEJ4aE1i?=
 =?utf-8?B?N0h6cmRZV2NmV0V5T0t2K28zYVlEWjUwTTZ1TVZmdGhlZTNyMGNGb3grWFN3?=
 =?utf-8?B?cXE2T2pZK1lzQ01OVDd6YmJkZm5zNmZqMUoxMmh2T1oxTUt6V3oreURxT2J3?=
 =?utf-8?B?eG9UcWJyNXQwWmtweURScU9lTnluSFA3R3NBbUZFTGE4QXNBUmdUenN2OTdR?=
 =?utf-8?B?djcyeGJqZUNtbHRTbE1YYWYxT3lHQVlHTUg1OGJaWkRmRE4veW45QndqMXFp?=
 =?utf-8?B?VHljanVpRytJNjZuM0tzeHpaUW52TzVQWE1TV1EveU1PUVpZTHpPRDFQSkZW?=
 =?utf-8?B?Z0Q2andoZkh2QjR3ZmhjSXRpUHVTeHRwb2gzemRuRXl4RThHQnhlL0Y4NFpQ?=
 =?utf-8?B?bWdtbS83Rm10RWdlT2IvMTFLTUlPYjV0c1RwMHFnejlKczR4anFlUy90WDUy?=
 =?utf-8?B?M3dWVnZqRDhZbmRkd1YyN2tzZmtHQVdUUVIySkpWOUN3QUV3YVlkRHJXVzV0?=
 =?utf-8?B?MUlROTZ0QmdPd0QzY1VCTEREbnB4Y2ttTlJtRXV0ekloTjJ2aWx1eGxpUWxj?=
 =?utf-8?B?NmR4SkFLUjBKMEl4b1NiQkRBUWRLVkh4cXZpZDNVeEpmaTd6SHBTNUNWZ2Fr?=
 =?utf-8?B?RmxVQmN5RExqR2wydk9oay82aStaVWhBbmF4NE96dGo3Q1kvZUgvV05NK1JE?=
 =?utf-8?B?SUNWQXdoSU1UKzZQZlowSE1rRDBhQkdNN3ZEc1FjcnFYSytxWldQTzFQMHVY?=
 =?utf-8?B?VVlsQmQ0bkRmczUyVktoaEowY0xFM2FIazhvUktVRmQxMnU4UzNDQWxUQ2dw?=
 =?utf-8?B?dkEzNmVxeElzWVdRcmlUSGsrSEMwY1RjNGltSXVaOGhqWGdvMXRMSDh3Mm1S?=
 =?utf-8?B?NVcyZGNMRWJQUFYrWDlteENaZG9obFIxTklrbWRQY3J5Qnc3SmlyeVlVT3Q2?=
 =?utf-8?B?M1puanpoakZZaGR2R3p4VU52R2ZSNXI4dkR6MFBmT1piVmxJTjZod3NHUjh5?=
 =?utf-8?B?djF2by85bHQ0amZUSVNFU3BSb2Nia0cwTUZTZmRNUUNqRUw0WlJyekhKS2o4?=
 =?utf-8?B?a2dkbFBHenBqMEp5ODZHVXU0blZpSjJTTWhvRTYwZjVxSS9qWER5Ri9vQjNH?=
 =?utf-8?B?Tm9ndHBpOFBPa2d6VXpTN3lHZEhxWmdKRFBOOElUMVJRMVFvTG5FUWtFSzBq?=
 =?utf-8?B?Y0dRUFBUL2xjaFErM3FxYUtEakJFR2g3VFJFK0F4US9SeVhwR1dBMnpJcnRx?=
 =?utf-8?B?eEExNFNHenQ5ckpjZ0I4UjdCbTM0QlBwdkN5WEN2aVRmZ29CRlppcGM0MEVy?=
 =?utf-8?B?dnpreVhaTWhzOC9CRjdxVzgzSmxXSmllNUZHQWdaamVIT0dLckRab0FkdkRo?=
 =?utf-8?B?ODNPVGd5d1pYMGpnM3lUTHNRSUZVdWlWZklPMnJ6N3FDMkc2T0RFNmw5clhl?=
 =?utf-8?B?cWxzR0xOK3Z6RmE0US9OQ0k5K2c2ckRjV3NvV1ZuQk10WXh3S1dLYzNNc1RL?=
 =?utf-8?B?N0g4UDZwOUFIVDRSZG1hcndiaDhsWDBINVBnbW93a2NHR2laMkRucEVCS0Zk?=
 =?utf-8?B?VEVIVmpNckNLV21DbWRZK0plSCtXTlhSMzdYY2VLNVZvdFZ6RmN0STluSm5L?=
 =?utf-8?B?SWpadnczV0U0OHhHNUFVaGNuMDhsMDBkeE83WEY2Mk9TOTR4SUpNNEhPNnlj?=
 =?utf-8?Q?raSQA/sodj73G7tdjBg1mumri?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ae55c1-d160-44c6-5b6d-08ddf04ebde8
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:45:14.2663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIbNRzJ1Ipk4xKd9q7gN//2fm3snC6iTuPobZ5JoiSdIHEks+0HSmmuVzu5CSWvqMOkigHrT95Tt/W0veq4qlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 6f09322553640384b1f43af0dbdf4f54b4ba004a..d7799531773ee32bf9f95eef30618cce9d479dd0 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -112,20 +112,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -139,15 +137,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -184,18 +180,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -203,14 +199,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -226,18 +220,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -247,9 +241,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


