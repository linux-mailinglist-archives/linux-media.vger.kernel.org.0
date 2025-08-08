Return-Path: <linux-media+bounces-39168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B65B1F0E8
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AA671889521
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E51D2951D2;
	Fri,  8 Aug 2025 22:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ke1wn1F3"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C4294A11;
	Fri,  8 Aug 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692897; cv=fail; b=fDYr59TmgWHT5CfRFoAmwnfxBPe9NVMPlsuqLdt2Q+9aPZTVpAEOs8H7/24IOzQ5ofjixioKFnz4FPwtVfzZqysVh2F+V0f4ud6cnPlky858XtHcKZE76Oo8lVVcDcM8WWFKv1VuPyFXgKMkXpcnfkXOpxYHVsY0d6UZPsiEzs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692897; c=relaxed/simple;
	bh=p4AYfhE2ptMllargI04A+qOF+ZtCNnGyzlaT8su4z7Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Tc3hx+gekEYPFUUD//RUvKz9ZfRuBVMHIZXxTJEo94PRF2nQT3Esd7RII4S6qf0+ZY98XodPoQwCWRS2v6U9JJult7m4IxMU0ZisPpDlTCag7g5utjcKaLqsDvTLDkVnEdd5Qy+YWDaGeA1ssBP+HyXIu+sDZ4bNVMEylp/fkXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ke1wn1F3; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJmayhLSxgs/AewK072vDJShqlVtLMslmyCFoBlvGXyj2mTZvK4gF/DKnt8Hy1nR1sHu00Fu3zJL4gnoCSEzYkrDT0I6Z13yRpvF9d/Y8vuxCOY/K/1ecOGYO1PcNwzrF8EUGpDSEtKHAkUBYdAjFIiKSFBG8EIFenNG1VnD3mK6GdjYY0lFi76aT/feGA5Mu7zJ1lbnW8ByVt3XtJJD6OJ9+YpWU3jJJMDWPXxm/DICYkowZ1unTKj+w6k3GvBfe2heVYJnnH+4jThSWHOXxrmFwbc4o0s7ALMcFs/umYyOmtQAWrANrh2JSyIW44plxeisZffYQXmfwlqoEvptCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clxcZoMur1rOtd/zHHVs2FdXClj+6RC3TIZWxgXe/sc=;
 b=NLtQCkO+rbYtt2FXDUEPDme2fUVgvjGpwCV+OYsiMDd4mgvQoPl9JRSFLN29fY46V1XJYgXnVWh7SqEcgCqtj81Kri1sUW7HKRoHZIgWV2dl/zQBwPtPSSKwrrakefWCWteM2hASeGDPIwsLmfzn/+fFQ4Mn0QraRpq5LwEt5qZIMQqo6R3O9eygSl75q/IEybNt2uIw6/p7cm9EM4Z/NzMviTLx30QWy1TsLfYPRcb6rU/ZoLe/FhcYVZvTZWtwhme8pRkrJ4wEKIcBSNf6V0zCStY70RaU5kBl1wUqsjIZOtEzdgSZ8x/Pw3nyVVOcK6rIAHDKQKWLwTacDX7G9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clxcZoMur1rOtd/zHHVs2FdXClj+6RC3TIZWxgXe/sc=;
 b=Ke1wn1F3uZl+W8tH7AAbDWuPU6iVP5Y/Ss8mv6k2NHQK4cg5BNenDxTnFbjWPY3iMX9WlYPSUie7a0quIQW+VBd9LahxK6W18lDOFT6aRX5pARB6hGWqLnkSj9zVfuMEg9KSVtOZrNnykx+3g7oeOb5ussH7qD7vpZW3l4+g55xNfOU/CmXlLfp+gJLXDmpBWgixugMI/kUHKVzNJvL0Q2HR+qH7tMCKQPq6ri99rPJZ3Vu+KfuYBaLJtzcqTIDj8scBTHdIzdQgm01uJUVQO6Gkw9Hj0ukoISedw6AKRcHzS/32I3kzCwAxr4BXa+q6jW9fcR4iS7NOIqGjmZ3wFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:41:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:41:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:19 -0400
Subject: [PATCH v2 16/32] media: staging: media: imx6-mipi-csi2: move dphy
 init part to imx6-csi2.c
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-16-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=7975;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p4AYfhE2ptMllargI04A+qOF+ZtCNnGyzlaT8su4z7Q=;
 b=oFnvPALDV1/+WcfkJPhoIOoYP71r0XNJOU3z090+1bA9Ree5rIDFzpkKR19r2oE0/hwdolOmI
 uXZSwzkq2//AZspIjuTp5cyXTLBIHYjOmEHu06ZtV6LNs7Okx/XIC4s
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dc81507-cca8-40d9-5c7a-08ddd6ccb8c7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bjRkczFzUFI1eHVYc1FHZHZQRnl3NTRGNlVPdGp0RkRMQ29kUlNVaFhXOVBV?=
 =?utf-8?B?Snp4SkQ3SWljN2lZcDU4RnFFbm5TSFBVajNQc1BMYjBpOVNQSlBDS2NrcHY1?=
 =?utf-8?B?YlQ5UStmaTI5VXlYWSthZnZNaml3OFlFc1dnSWwxa01vWVJJNDNVbVFqV0M2?=
 =?utf-8?B?NjhpdE1VdndubzBGZDJQNEFaMHhJaFhBZm1uOEs0YitYcE9lZDM4SlJZblYr?=
 =?utf-8?B?VldwM1g3QXlWUHZsQWRKTnFQelF0R1N0WmRoV3VUQWx2eWlCYld4aFVGYVdH?=
 =?utf-8?B?YmZOYjFUa1ZDVG9qdnU1Q25qSUVMTmE2Y0dmSXpZWEI4cHBUSTcvRndTQ1ZF?=
 =?utf-8?B?WUhQSy9TQ1h3NlVFbzZxcEFibmgwQWlqT2l5V2tPMEtTY0VvNGtoVC9jdnBk?=
 =?utf-8?B?ZVhmMVJLenZiUGNscWdxMVowT01YVlc0QWxHRzYxb3l6T1RlQ1VqUDhLOTJZ?=
 =?utf-8?B?WmJyYUZQYlQ3Nk1HQTJVeDRScHZHZGVkb2sxazJ6TFNXMVZTcmozOFNoeEkv?=
 =?utf-8?B?WHFMTnl2aUZ2Y0oyOWcrYkJoY3FmWjhXZmxOdlFRSXpXTnA5RjBwRURJOTRI?=
 =?utf-8?B?NjVqM1d1Vm4xVjJWWGJHRkNMV24wWHNBWVJOZmZLanNKdHdjdkZzb3dWY01o?=
 =?utf-8?B?aDkyN21FUHczeWRmdFFmN2tkSHJHQldKTmdQNUdzSVZPM1kzRVlwZ0FsWW0z?=
 =?utf-8?B?NW4xOTFlcFAwRnVEUk1KaFVYMlpwOVlUTTBYdmZmNTA1U0xZMmo1bVo5TlNB?=
 =?utf-8?B?eWREbWFaWGU1UkxyMU9raUN0cGNjSm5SUXI3Z0FKZFdib3lsNWtlR3VhaEpL?=
 =?utf-8?B?MjNLLzZJRFUxRGhtNis5ODRTdzBkcjlnUE5UQ0VMNjJPL3NuelBFTVM2Um94?=
 =?utf-8?B?MUMyR2lqcG1MdTVLRFUyaFBzblROZjRQelpvY1NMaTkranA0Z3dqWFlBK2hI?=
 =?utf-8?B?M0lkYTNCdzdjNy9HWTMzNzRaSWx1eUppc2lLejhpQU5KL2JrSjJNMU1KMFVJ?=
 =?utf-8?B?UG5kSmVmSDNPaURxSUloWVlyQ3cyck85R2p1SzN1OE5NRW5ROThKVmRxVkZV?=
 =?utf-8?B?YUdzbnpTTlQyU1pjWWFTcTg1RVhlWkFwcGJyQVRpTnZ0OW1LaG9lWWk0UjA2?=
 =?utf-8?B?VUJYaWgzWDk5MFlOUUN6R1ZDMTE3T0lmWkkyQ3V5ZDJaeURHWmRjVDRHMTA4?=
 =?utf-8?B?RGJvcjIrVTBuOXpLa01ibTJLRzVQWHAxZzcvNzVnbkIvMXR2RDFiamM0MDBW?=
 =?utf-8?B?YWtUSkVRQjk5bXBGUEQxbUVxUXBYeWU5VFVTY3FtWDgyb3Y4Q0xmZm5kUnBk?=
 =?utf-8?B?akpTbkNOZHVxSkx1R1ZnejdFNnFndmZsMmVVNUxVbURPNGdjdTBXRHkxQ1J0?=
 =?utf-8?B?UjdhdlhYdWNDaEt6TXlRZkRGSXNXZzhCQnpQOHFLdTNpeVZ1Vk8vekh5YURu?=
 =?utf-8?B?QlhvY3NqekFkcFNwZEdsTm5aSURFT2FvWDRVeklETDhrYVIyQmhzdng0TFF6?=
 =?utf-8?B?Y1o4dDk5N3phcmgyaXFySUliOTA5SWxMbXVoUlMyaUVVeHNVL2VZSlhvSCtP?=
 =?utf-8?B?ZDV6cTVzNnBhSDJCMFhaU1U0UnowQVN1NWJpNmovcEVnajZycnlOQStnNDFD?=
 =?utf-8?B?dUFuQUtDR1R1dGxudTZudmE1MUl0K1pBR0duM2ZIN1B3ZW9mVUc0czkrU0dN?=
 =?utf-8?B?MUxQOE5qNk5vY2NSOEdST3hBWkFaL0VNaGZzQUhreWgrOFZ6ckFBR1ZmS0Vp?=
 =?utf-8?B?TTFWc2FYK1pua2YzVUljY1FoajFSSVVoVHpFd1BSY1JJd1lXZXVqV1B5S1lX?=
 =?utf-8?B?N1lUbDNWd1RvcTVURU9ZeEJwWUE5TDIrV2VuWHM1aHVrZzVucnZWbC9iczRS?=
 =?utf-8?B?WkJSS2piR3NJd3NvS1ZHU1FMeTAybGlOU2V1em4yOU4xcWtMUVY2L20vWTZC?=
 =?utf-8?B?RjRDUWhmcXI3WUQ4T3RVOUJ0MFR4cVJiSXZ2UmZkNHcrVUIzNGxvVjR6cy9H?=
 =?utf-8?Q?r1yzhvkfkrZ4FsMCKR+0TFmhpz0oP8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NGhPeU5Ub2sxN0E1c3FrVUI0WUkwTEhFNTQ4UTR6VzRWRHVMYXQ1bzR5VURB?=
 =?utf-8?B?bUdaRkJPTWhaQjB3S2s0OUx0YXJrcjVCczdxOUFVeXN5ckpEOEZMWWlZNW5s?=
 =?utf-8?B?QXlXUURiWFB0L3JxU016UHM1L0NxankxekhST0RUUGtFUUx6c1psRWRJWTgy?=
 =?utf-8?B?UkMyYVhUYTVEcmUrWUlFZUdIc2U0YS9CMzZCSTRabklCYzRyUFMvcGZHTjRm?=
 =?utf-8?B?RndNSGZWVW1XbkpSQ3YyZWYrR2RqWWJVVUx2cmZ6Ym1EQkdJbUcwaW1STVNY?=
 =?utf-8?B?SkNXNWlBRlM5WG5tQzZFcmJaa0NTcG9RUTBCRERHWER5VWhXWUpWVisyUGk2?=
 =?utf-8?B?cDlEWDN6ZUQzUEFCcEhDbkxJb0ovT2s1aGNPaXBtajhSczBKSnlxWlBkaE1X?=
 =?utf-8?B?RFlnbXJEcmhuaVFzb0YrVDl1di9KM0VMRVphN3Q2UlIyU1VMeDM1ZnRnL0JL?=
 =?utf-8?B?eG8wRFp2WDNpVFUrRi9jb1FFMlBxNktGUkdLbkFWUGwzVFFXMStibnZRV2xU?=
 =?utf-8?B?OGdSUjJMZkc3TUNFMEF3QVFqcGFhVWxxeDlXeFdIN2xTSVNoQ2NsQUdhNmVR?=
 =?utf-8?B?ZXorQnBaOXM4Y1pZVzExM2FtOGgwRm9hQ3o0a1lkaTdieDhEcUZxTkEvV3lp?=
 =?utf-8?B?WFdsa0xMTzRncDZybDhKSHNRY0tvSktlc3lmUVI5Z3loUjRNSjJObHk3Rk5U?=
 =?utf-8?B?ZUNxYnpkMTJESVBYdVB3RjdTKzdjTjVFczd6MUkvU2NFYzFudlNRY0FtUlZ3?=
 =?utf-8?B?amtrMm1IdUhrc1ZzbGJkK0J1ZmdGWFRIdE0yUHYrOWhZMWhMaDFLdTUxNmgy?=
 =?utf-8?B?UGxrYkhFdGw0dGFWKzZDMVZBbXBzVWlvRktJdExBeHZQMjlIV0ttUmtOOU1E?=
 =?utf-8?B?UVVZVHBLUnlOeGdHWVQrdVh1MHVid01hWmJzZFUzdCtlTFY0NVllQTFCUU9J?=
 =?utf-8?B?UHRUeklBdUpzMG5tVjJzTldTVTFSc1hDNmFyRU1CMXl3aCsxZU54V3JSM0pC?=
 =?utf-8?B?a3BVUkY2end2UUVuMjJZZU1qLy95QjFkSUZBSWx1NUt0T0F1M0pOYnJhejBw?=
 =?utf-8?B?QWZmeGVzVHpPdW5MUlJOZVNWQXFxang0emZlSXR2NE5zYldHcVFvZXREUlF0?=
 =?utf-8?B?c0ZGbFQyK2U1MzM3cVB0S2JkdmVqMVBld3RaNElMMlg4aVZZdDZPb0dHTkIy?=
 =?utf-8?B?aGRyZXJsaGtidDROcWZ2VkxQdS9wTklydmRyUXlwRkJaQmFJcHFUUDVxYzBh?=
 =?utf-8?B?R2Q0RUcvSnlXeXE3bGFIL2lPV1d2Q1VNKzh4NzFUSTdEWk0wWVZPUXUyM3d5?=
 =?utf-8?B?cmthS2I1Y1V5bDhPbDdmVGExTzYrRHcwbzZ4ZlVkWlN4M0JUdXBMaXp1aGFY?=
 =?utf-8?B?a3dMTEs2cVp6ZlVVWTFzUWl6UUcxcGxSbUEvaFZ3aVJaQmt6TDlhMC9NcGR3?=
 =?utf-8?B?dThXS1JBWTRwRXVNVElOUHFJTzBkZERCUUd6KzZ3UTF4S3plU09hdkl5c1Mx?=
 =?utf-8?B?K2g3MXZ1V0JPQWVBOENVNUNjOSs0bXNhK2ZmbGtBMlJKQ21xMWN0ZldBZVpl?=
 =?utf-8?B?S3hFUk9xVXFhRXd0cXlPb1JmTWJQT2RtOEd4UlE3UmdZVU9OU1BXbWg0QzRp?=
 =?utf-8?B?c0JhMjFubllkTXBFaFpIY05ZZzg5RjlJVTc1NzhpUU1RdC9mQjFCUi9jeU5k?=
 =?utf-8?B?L2JxdHNnY0pKM2JLMEdlZERkUUpYeWtoNEMzZFpWK2tFSjBKQVRyNlBCdG5K?=
 =?utf-8?B?QVcreUN6RU4yTmtXWmVkdklzSWprek9MUFcxSmpEWW1xOHM3Z0h0cXNxc1Qx?=
 =?utf-8?B?NklNa0ZFNDJKNGkvczZFM0kxNHZTM21kTlZ1cHNldUJlcXI2d0NLUWVORGlY?=
 =?utf-8?B?cWZ3YkNQVi94Vkw1ODZOemhwa1UwQWw0YUFFSUlTbWowWnhGdjJNcTVObE1K?=
 =?utf-8?B?enZhTGdReXl6ZUxkaTBUd2tGUklPbkI1NGhKQjdhemRXcjVNWGJwamY5T3pw?=
 =?utf-8?B?b1NEMkNlNitxNTNsNG4wT1FBSjlpMHMva2ZQMElVTUZPVVNROHJ3U0lkZVZZ?=
 =?utf-8?B?Z2o5dUZ5aldKMFE0UXFYS3FEYXU1L21FM2EvU2UwRnRoKzNIa001b2ZLdTc4?=
 =?utf-8?Q?HQtmas/75c8z1FAdywI5/SLN9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc81507-cca8-40d9-5c7a-08ddd6ccb8c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:41:32.0863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2Gq5J2mHmoiDaHej5C0O/zdTa9sqMcyko4pGhDry5BPFTUBPnk2ZYmQh5sIoy7nukslDQyX2nUfRKEVhhCmMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Move dphy init part to imx6-csi.c.

Prepare create common library for dw MIPI CSI2 controller.

Add callback for dphy_init in struct dw_mipi_csi2_config. New driver should
use phy interface.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-csi2.c      | 55 +++++++++++++++++++++++
 drivers/staging/media/imx/imx6-mipi-csi2.c | 72 ++++++------------------------
 include/media/dw-mipi-csi2.h               | 21 +++++++++
 3 files changed, 89 insertions(+), 59 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-csi2.c b/drivers/staging/media/imx/imx6-csi2.c
index 062db72a36ef294566272d9f39d82e9414640e9a..696644aa04c83b1f2877b2b2315202627d927e96 100644
--- a/drivers/staging/media/imx/imx6-csi2.c
+++ b/drivers/staging/media/imx/imx6-csi2.c
@@ -16,6 +16,12 @@
 #include <media/dw-mipi-csi2.h>
 #include "imx-media.h"
 
+/*
+ * The default maximum bit-rate per lane in Mbps, if the
+ * source subdev does not provide V4L2_CID_LINK_FREQ.
+ */
+#define CSI2_DEFAULT_MAX_MBPS	849
+
 /*
  * i.MX CSI2IPU Gasket registers follow. The CSI2IPU gasket is
  * not part of the MIPI CSI-2 core, but its registers fall in the
@@ -28,6 +34,54 @@ struct imx6_csi2 {
 	struct dw_mipi_csi2_dev dw;
 };
 
+static const struct {
+	u32 max_mbps;
+	u32 hsfreqrange_sel;
+} hsfreq_map[] = {
+	{ 90, 0x00}, {100, 0x20}, {110, 0x40}, {125, 0x02},
+	{140, 0x22}, {150, 0x42}, {160, 0x04}, {180, 0x24},
+	{200, 0x44}, {210, 0x06}, {240, 0x26}, {250, 0x46},
+	{270, 0x08}, {300, 0x28}, {330, 0x48}, {360, 0x2a},
+	{400, 0x4a}, {450, 0x0c}, {500, 0x2c}, {550, 0x0e},
+	{600, 0x2e}, {650, 0x10}, {700, 0x30}, {750, 0x12},
+	{800, 0x32}, {850, 0x14}, {900, 0x34}, {950, 0x54},
+	{1000, 0x74},
+};
+
+static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(hsfreq_map); i++)
+		if (hsfreq_map[i].max_mbps > max_mbps)
+			return hsfreq_map[i].hsfreqrange_sel;
+
+	return -EINVAL;
+}
+
+static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
+{
+	struct v4l2_ctrl *ctrl;
+	u32 mbps_per_lane;
+	int sel;
+
+	ctrl = v4l2_ctrl_find(csi2->src_sd->ctrl_handler,
+			      V4L2_CID_LINK_FREQ);
+	if (!ctrl)
+		mbps_per_lane = CSI2_DEFAULT_MAX_MBPS;
+	else
+		mbps_per_lane = DIV_ROUND_UP_ULL(2 * ctrl->qmenu_int[ctrl->val],
+						 USEC_PER_SEC);
+
+	sel = max_mbps_to_hsfreqrange_sel(mbps_per_lane);
+	if (sel < 0)
+		return sel;
+
+	dw_mipi_csi2_tstif_write(csi2, 0x44, sel);
+
+	return 0;
+}
+
 /* Setup the i.MX CSI2IPU Gasket */
 static void csi2ipu_gasket_init(struct dw_mipi_csi2_dev *csi2)
 {
@@ -74,6 +128,7 @@ static const struct dw_mipi_csi2_config imx6_config = {
 	.module = THIS_MODULE,
 	.name = "imx6-mipi-csi2",
 	.internal_ops = &csi2_internal_ops,
+	.dphy_init = csi2_dphy_init,
 	.grp_id = IMX_MEDIA_GRP_ID_CSI2,
 	.gasket_init = csi2ipu_gasket_init,
 	.num_pads = CSI2_NUM_PADS,
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index 546c6e7c5d13f3be618fc3eeca780695ead6bfe5..23656291d808ccdfc47f36d1f7f5104698812eba 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -21,12 +21,6 @@
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
 
-/*
- * The default maximum bit-rate per lane in Mbps, if the
- * source subdev does not provide V4L2_CID_LINK_FREQ.
- */
-#define CSI2_DEFAULT_MAX_MBPS	849
-
 struct dw_csi2_regs {
 	u32	version;
 	u32	n_lanes;
@@ -146,9 +140,11 @@ static void csi2_set_lanes(struct dw_mipi_csi2_dev *csi2, unsigned int lanes)
 	dw_writel(csi2, lanes - 1, n_lanes);
 }
 
-static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
-				   u32 test_code, u32 test_data)
+static int dw_mipi_csi2_phy_write(struct dw_mipi_tstif *tstif,
+				  u32 test_code, u32 test_data)
 {
+	struct dw_mipi_csi2_dev *csi2 = container_of(tstif, struct dw_mipi_csi2_dev, tstif);
+
 	/* Clear PHY test interface */
 	dw_writel(csi2, PHY_TESTCLR, phy_tst_ctrl0);
 	dw_writel(csi2, 0x0, phy_tst_ctrl1);
@@ -167,6 +163,8 @@ static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
 
 	/* Clear strobe signal */
 	dw_writel(csi2, 0x0, phy_tst_ctrl0);
+
+	return 0;
 }
 
 /*
@@ -174,54 +172,6 @@ static void dw_mipi_csi2_phy_write(struct dw_mipi_csi2_dev *csi2,
  * https://community.nxp.com/docs/DOC-94312. It assumes
  * a 27MHz D-PHY pll reference clock.
  */
-static const struct {
-	u32 max_mbps;
-	u32 hsfreqrange_sel;
-} hsfreq_map[] = {
-	{ 90, 0x00}, {100, 0x20}, {110, 0x40}, {125, 0x02},
-	{140, 0x22}, {150, 0x42}, {160, 0x04}, {180, 0x24},
-	{200, 0x44}, {210, 0x06}, {240, 0x26}, {250, 0x46},
-	{270, 0x08}, {300, 0x28}, {330, 0x48}, {360, 0x2a},
-	{400, 0x4a}, {450, 0x0c}, {500, 0x2c}, {550, 0x0e},
-	{600, 0x2e}, {650, 0x10}, {700, 0x30}, {750, 0x12},
-	{800, 0x32}, {850, 0x14}, {900, 0x34}, {950, 0x54},
-	{1000, 0x74},
-};
-
-static int max_mbps_to_hsfreqrange_sel(u32 max_mbps)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(hsfreq_map); i++)
-		if (hsfreq_map[i].max_mbps > max_mbps)
-			return hsfreq_map[i].hsfreqrange_sel;
-
-	return -EINVAL;
-}
-
-static int csi2_dphy_init(struct dw_mipi_csi2_dev *csi2)
-{
-	struct v4l2_ctrl *ctrl;
-	u32 mbps_per_lane;
-	int sel;
-
-	ctrl = v4l2_ctrl_find(csi2->src_sd->ctrl_handler,
-			      V4L2_CID_LINK_FREQ);
-	if (!ctrl)
-		mbps_per_lane = CSI2_DEFAULT_MAX_MBPS;
-	else
-		mbps_per_lane = DIV_ROUND_UP_ULL(2 * ctrl->qmenu_int[ctrl->val],
-						 USEC_PER_SEC);
-
-	sel = max_mbps_to_hsfreqrange_sel(mbps_per_lane);
-	if (sel < 0)
-		return sel;
-
-	dw_mipi_csi2_phy_write(csi2, 0x44, sel);
-
-	return 0;
-}
-
 /*
  * Waits for ultra-low-power state on D-PHY clock lane. This is currently
  * unused and may not be needed at all, but keep around just in case.
@@ -332,9 +282,11 @@ static int csi2_start(struct dw_mipi_csi2_dev *csi2)
 		csi2->config->gasket_init(csi2);
 
 	/* Step 3 */
-	ret = csi2_dphy_init(csi2);
-	if (ret)
-		goto err_disable_clk;
+	if (csi2->config && csi2->config->dphy_init) {
+		ret = csi2->config->dphy_init(csi2);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	ret = csi2_get_active_lanes(csi2, &lanes);
 	if (ret)
@@ -680,6 +632,8 @@ int dw_mipi_csi2_init(struct platform_device *pdev, struct dw_mipi_csi2_dev *csi
 	csi2->sd.grp_id = config->grp_id;
 	csi2->config = config;
 
+	csi2->tstif.write = dw_mipi_csi2_phy_write;
+
 	if (!config)
 		return -EINVAL;
 
diff --git a/include/media/dw-mipi-csi2.h b/include/media/dw-mipi-csi2.h
index 12e1db1d149513fcd0db8c191c801cb144d18143..935c664440aae82d69f0253a551b91ec4ff2724e 100644
--- a/include/media/dw-mipi-csi2.h
+++ b/include/media/dw-mipi-csi2.h
@@ -20,10 +20,26 @@ struct dw_mipi_csi2_config {
 	const struct v4l2_subdev_internal_ops *internal_ops;
 	/* Deprecated, should go through phy interface */
 	void (*gasket_init)(struct dw_mipi_csi2_dev *dev);
+	int (*dphy_init)(struct dw_mipi_csi2_dev *dev);
 	u32	num_pads;	/* Max 64 pad now */
 	u32	sink_pad_mask;
 };
 
+struct dw_mipi_tstif {
+	int (*write)(struct dw_mipi_tstif *tstif, u32 indice, u32 data);
+};
+
+static inline int dw_mipi_tstif_write(struct dw_mipi_tstif *tstif, u32 indice, u32 data)
+{
+	if (!tstif)
+		return -EINVAL;
+
+	if (!tstif->write)
+		return -EINVAL;
+
+	return  tstif->write(tstif, indice, data);
+}
+
 struct dw_mipi_csi2_dev {
 	struct device			*dev;
 	struct v4l2_subdev		sd;
@@ -51,8 +67,13 @@ struct dw_mipi_csi2_dev {
 	struct v4l2_subdev		*src_sd;
 	bool				sink_linked[DW_MAX_PAD_NUM];
 	const struct dw_mipi_csi2_config *config;
+
+	struct dw_mipi_tstif		tstif;
 };
 
+#define dw_mipi_csi2_tstif_write(csi2, indice, data)		\
+dw_mipi_tstif_write(&(csi2)->tstif, indice, data)
+
 static inline struct dw_mipi_csi2_dev *
 sd_to_dw_mipi_csi2_dev(struct v4l2_subdev *sd)
 {

-- 
2.34.1


