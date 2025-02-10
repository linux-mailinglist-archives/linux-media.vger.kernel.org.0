Return-Path: <linux-media+bounces-25958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10216A2FB2F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54E7C188607F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC8224CEC4;
	Mon, 10 Feb 2025 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dfmzB2/G"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A01C5F14;
	Mon, 10 Feb 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221196; cv=fail; b=tLANUeuv5tXMuqw51P1hcCLvUa92yjNwjLHgrTOc4z13ASEoxhXtUas5R5THZjD1bfbYC1DhCnz9XH14NufFyJle/HK40v0szaL53vkEQIgK1X3LLYLqg/wa62bWtd00pUfA0AptfMAVkESTkNbYpXsj0/CqJNoiHtjM+MVs4HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221196; c=relaxed/simple;
	bh=dd8/Ug9FWSIY71oz3ox19AN8ahX29pEr9QhaZFP3tfA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TNhyekZlskWYSixu/SwIprBOOZkkKC/TpljQMWzrCce/TK7Vr9212rvnmgm6kzZmJWiABR5IM8QiJQTMoOz4JKwx1thB39eIkwjhkYVJXbahQJaJJy9BdnKyLIWtSI2XJaWCwgdqoBPMu/kLZ8T1pVgwwfXx0IU0FD6mOlctsIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dfmzB2/G; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJUdsyS8oXUeUxeVhCdKcUQgfM2trP87eRnfMyocKcagHBzPwCQIzTvzjlc0tZIceJcWtlVm1ZzBW6ctufaibI6IOrJU5btTb5sW9/jKNjdBKdQx+xtyjszoqYkAboMNa3PeWCiMd5koh3NFcLGr6WObpqO5YmchtzuMBmYpcyV4kNC5izPiTO5qiN4iuN8uLVP4M/measyVR7wuufVvcPpqHvHeFkvsGZcUA4C/P44UoAS4NLrBF6StcqGq+FAlKhIEMm/B4k0ddhAlcre8mSEvFLQu63QUkRBdgGh905Hi7pR+xD3SaFUd23yP+YxZku0q3Bqog5Kz6l0rh3dFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SeofZwEQcI0PJLPguFnElFCq6SLOXi7vxu6iLYJuZlE=;
 b=Upk5cPgiMrU68vFTXmSiRc0eLXSsCTnoNA4SrA/5Lse1CqtJPl2bWpnWud5MBWqYYarCdwh1XeJyw3g9sVaxipRaBaZJmhHWCMYQQrtHfHs3f9TtGGbve5TC2cqg6FgGFHeR3tKzZk3Ck6WUhx04ZM2lbCxEYBgm0m9CHbLpqmPGHsBWWsWKSdEie09WQqBROLOxOdqT1BSLQe2ZjV3PB4IAx0y7+q5bZ6UXba1/qpadnE0UfxaIw41KYtMTDoyfId59L74tRnn6bisVXs6mjEuUITRG5z59KRQH91qYnIgA+BsC/QPF/EE4XmQGNxqkFObPAaFo/QUmEL+it5QmDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SeofZwEQcI0PJLPguFnElFCq6SLOXi7vxu6iLYJuZlE=;
 b=dfmzB2/GbvNkRjqfeAhsQGUNvYacT+keangw9vm+s4TXe9pHPlyGdiKp3WmeuRCrTuFsfZQVJ6c9cVFSyhcBrrZ3D+MXIfU/Od11K33448NXe/BT/jmnuZMylcvkwJRhWTS6JBkKiZJvATz2fVwnrllF4kM9NTZD8ZcDKcqdoIkqA2wS+d2FBeyoe2XyR5DJY3Gnf4lJfGROWOq8b2iWB0YRjeU6m+g2QbvIncnreSxong7LGmmBaPPs8BuGRu+oY5tnKIRpaihxeThgH+UXslGpDgP9NuPzd13+xo+nWJOihOqs964GSLvUXCvkOMQd/a+uoxeQi/PbmOtB2NtChQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:59:52 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 20:59:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:20 -0500
Subject: [PATCH v3 01/12] dt-bindings: firmware: imx: add property
 reset-controller
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-1-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=1171;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dd8/Ug9FWSIY71oz3ox19AN8ahX29pEr9QhaZFP3tfA=;
 b=7rakT6zzWUXoYuuvsdNxzyoByhry52qjUPOZbttjnY7JXmhLS99ek4Abll5+7zyzmT9gZHjJf
 /I4nHkYprkiBZ4wJmqaWHzLFcpHDkyCahwJl7OAVNax3dPUziaE4Grk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bb355be-32e0-4baf-52fd-08dd4a15dd11
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dWVVZWh3UkJxcDhlUDdCY1Y5WUZCUDNKdFRDcksrbFFyYWpybDl6dnRRdkNL?=
 =?utf-8?B?OURvS1ljVU95TDc4YmJTRFVrcGRUTWdKTFErWkZ3MGxlaEJhWUpQcHNtdWlY?=
 =?utf-8?B?UEphMFB2WVUvZS9oNWVmQjJvRTdwMTBVTnIya2RaU2ozbzhxRmQ5a05QaVpY?=
 =?utf-8?B?S2xWWTY1UzZXZlpBalZQcFhFSzlQSFd6N3I0ZFN5OWp6UEFOUHppaCtid2RO?=
 =?utf-8?B?dFlwSWpZSVpoc2FNcjdiREFWNGFQNTIva3I2NGdsRGMyUnZVYi9rMXRoaWNt?=
 =?utf-8?B?OXdGL3prbzljcnFrN2phaWdPb3h2VHNqOGNPcGF3bldIMXppNG1lZ3E5dFE4?=
 =?utf-8?B?cFlGazlKY3dSazNnZFZLb3dpdU9SekpPeTYxV1oyZFlUTzVvL2tOMHFwTXFx?=
 =?utf-8?B?UFcyNWFnWFlFQ0R5dHVsc0FoUTM5NzFTKzlxNXJET3Y1YU9wTmFjT2tMSmNX?=
 =?utf-8?B?T2t0Y1RYK3E3MytKaUtGd0Y4aDgxc0I1T0RDWjAvbWFyQ1RnSUtyS2NaQ1dF?=
 =?utf-8?B?d3F0bE13YWZySEhYMzlYRDIranFRUXpEU3ZZTzlWa1hDT2xCdE12N0JDZzVF?=
 =?utf-8?B?ZWp6NVJnaDNJeXRhMXg1dExWa2Z0cWJWRVZNNndNdStmWllZZGpGKzUzREE4?=
 =?utf-8?B?VEJuZGpyZGxOK2tiUVVqV3F6Mno1TFgrcmM5NEFNUkFxcGFReTFOaURpWUc0?=
 =?utf-8?B?WGxoUjZ2MTNEeVVRQlBUdWpBdEJEVWdtRExQV1hlajVLaVZ5czBKWGw4SWRC?=
 =?utf-8?B?dmV2WlgvV09PZzV2RDA4M1ZFZG1HcVV4QlNSTzRBL3labzVweXdobm9EbkJI?=
 =?utf-8?B?aCtyb29SaDNZZHIyM1NoZjF0bmNmZytqRUxSRFhWeWFSbWhQUEE1RDV6a21U?=
 =?utf-8?B?ZUMwb0ordVh6R2dnT1U4Ym5rcXRRczdnN0tudVMxSjdkZkpuUCtZb0Fobk0w?=
 =?utf-8?B?RmVpRXJJRVcvQ1J0OE1WNUhzK0J2RWI5cVFacU9SSllxbUFteVVxa3o1U3F1?=
 =?utf-8?B?eEJDcmJGQ2k3d2NVVGU3YmtHblBtNkk1VFh1c0oySWg5M2lReHMyWFpaMEJk?=
 =?utf-8?B?Ylh3SXhva0lyNlJxZnRLN1B4VU81RnV5czl6bEx4S1paSHJLdnJCRDJSd3Bw?=
 =?utf-8?B?WUowNEhoUndPWGNoTWl5NXIvY3lnNWF4OWRSclBDeFRBbXpSQVgxTXNueXhU?=
 =?utf-8?B?ZG8ydENlaHR0b0hBckdCZzhjYURxMVpmK0M3YnFWVDBGRHRTR0NtRVp3WTg1?=
 =?utf-8?B?RkU4b1NsSjQ2bkVBeHRXYnU5MXpiV2V0OHpTZGkzSHExK0Q0MmJmeW1oajZM?=
 =?utf-8?B?NGFTbHhaZ01VNTNNUFVFSllCbytzYzVEWU11ZllKc1RRRTlpRUd2MDE3MlZp?=
 =?utf-8?B?OGlscExTbE1remlaTjIvK1lBZDBpSEVPQi9nbEtqbm9CS3lEVytSTEg4N24y?=
 =?utf-8?B?N1krcjlHclowQ2d6NlR0T1JOKzdURjRQcXNobjZraVAwQlBBS3FMOUQ0MU9E?=
 =?utf-8?B?OVNISW5sL0NCc1Nld0thb0ZiMzJRcFFSVEZGWjB4UERUTERTSC9ybUEwcllO?=
 =?utf-8?B?Zi9mZkxEamZTZjVqSCtPVUJCdTAzN3ZIWUFsTlZaL3E4NnIxU2lrT2doYk5W?=
 =?utf-8?B?WnpwaGQyQmdkOVhOQm5BelVGVWlyemFZNXRUN0xZUjc2V3Q2S2M0UUVVK2xl?=
 =?utf-8?B?bXRSTFVhdGdvd0dGM1A0cWpwRnIzZTljaWM0RDliQURTUTRMYkZrN3RERkZ6?=
 =?utf-8?B?VUZvN0hxbkRFdnJJVWQvb3crdndRZjRZYVBxeTczNHNBREhESTRDQjVkUkln?=
 =?utf-8?B?OWxTOGFoQ0JwcU95Qm9TUzJZb2c0OGtIQUhSUVBsNVVOZ2dmaXl1aGNSRldY?=
 =?utf-8?B?RmE3R0hHQkxHNTlCdWRmc0pRc1FsdkJhOVBMS2xERjB6dnpWQzFud2MyV1d5?=
 =?utf-8?B?cE0rUFVJNGt4MkxvdDNrMU1QYzhZTk1kZ0tJbXBSTFlvaUxDS3A5TlRrQmd6?=
 =?utf-8?B?Y09ocTdwcGtBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WXl5RkN4LzhVVlVPam1RNkY4ekNXd0xiVDhicVJqbFE1NDJTVUhRaGk3d1ZH?=
 =?utf-8?B?ZTVWUTc0T2pHZjNob3MycytqSFZPTGNsQnFYQ0NBczBjdnF2S2g5SEJJbVpP?=
 =?utf-8?B?SnJBeGdjZlNZQVZtZXkrdHQ2UFY1ZElDNEh3R294MlhOQUxGYzVXZmh6WmlF?=
 =?utf-8?B?eHZDeW5acnZKaGozUGkvMkdOSEkyVHMrSXpYQnlnS3VQS2NJUkY4OURiUXov?=
 =?utf-8?B?ckdjNGcrUkM4UDk0REVFV0owQmtUTHNLZGlNTGw2ejh0N3dYWnZmTnFEL0E0?=
 =?utf-8?B?YmF0V2RCY1RYWDhKT1BpMzVTMS94aEg2OGhjTlk1aUJWZ1FJaHNYbVBiVVFU?=
 =?utf-8?B?L0ZDNTRRUkpwL2U1eXI3SWpYUGY5RHRlSCt4anIxZVF2U2pzZjh6UHByT1lP?=
 =?utf-8?B?aVR2MVBsMmR6YmY5WGJZZVFxbTNscUNUQmJUNzdvRm1jL0J6VkNVMzVqTW4w?=
 =?utf-8?B?SmcyZzhxUkRxREh5OER4YTllL0MrZThrc0Z3T1BXQXpFZlVZV2tNZTVXbDgv?=
 =?utf-8?B?dnFWZTd2bWo1Q3JTQ3VMTUhLNExDREFSQk5VMFNPNjlHM1k5MW0xT3BUYW14?=
 =?utf-8?B?UnJwRFVWQUMyQ0d2cElsRUNvV29iK1ZhRks0bXBsR0lTSGFkRW5PUG1qdDBn?=
 =?utf-8?B?SEtmYW9LTnNKMlpiM29BWWZlK3VLemRVRi9tQnEvQ2J0YWNqdDRqZjgwckhG?=
 =?utf-8?B?N1ROcXFESGZwK2dmRndTUjdwWGErZ2tZMFRUdHF3OHo5bTgvU2NtcVVUWEpr?=
 =?utf-8?B?OHNQYXFNVGlVcEpXdGdZT0VxWnRzMHRDNEFtTnRuSXh3Nks0UkNCVXB5Y1JF?=
 =?utf-8?B?YW0zSGtBUzBtTzhqK1RaeDlVbXFQbnZONGlTTjFDcGRoUEVkU05kd0ZVd1gz?=
 =?utf-8?B?cUZEMW5IdFZ2UmN2L0thWTRqN0N6YmdCbnBWVWVOMzRrTUtncHFMWXc1N0hK?=
 =?utf-8?B?d0lVcThkR0NxTWMvSldYaU1mdkVSVS9mOGg2NDFtbW9WRDMzWXhXY3RxRW14?=
 =?utf-8?B?VFNCM2dYUmlUQXFDV1ZJV1M2QitOQm8vUEJEYUE2ZVNDNDBQR1h6WXRlcFU3?=
 =?utf-8?B?OTluRVAxMDZPckpPM01lclBhTitLZCtNbzhGTW1uM0VwSnZSS2VORkRKdWwr?=
 =?utf-8?B?NXFVN0NDYWxhM3Z4VVVhQWxRby9wZmdmeTNkZVo0ZWhhMEZNSUtVb1V3S2tF?=
 =?utf-8?B?K2dsalZXckhxNk1ObXdodjVxWVBmUUNjQ21EWlZvbTlTOXJ4UG9mSjdjVFhD?=
 =?utf-8?B?S0dVcWtXV2J2aS9oKzI5QzY5TTJmQ2lvOHFHR0tnU0JpblRUa1AyQjJQbXRt?=
 =?utf-8?B?ekdHdW4wMlYya05sZ0h2em5qQ3pCbjMzYkN2NWdsT3ZHcUp5ZUdueVVBendJ?=
 =?utf-8?B?ZmlYTk8yOXZLd2IxV1NLTzNUWktYNnJXaVJqNGR6N1U0cVR6MEY3L0lZMkVh?=
 =?utf-8?B?QjFOd1B2UlU3d2t5YW5YSEhuZlI1eUUveDJrZmtrMjN1dGNxWVoySEJoZUNV?=
 =?utf-8?B?OFczbU9Vci9IVmJpd0NjTU9hSGNIckIySHZGOHFLQU1HQWZlY0toNSswL0Zt?=
 =?utf-8?B?aWEyaTlINVVUVGx5ejNLckxPaUVuSEkvcWtzTE1ZdFcySU5YNkRUTCtCa0V0?=
 =?utf-8?B?Wk4yQmh5eW5QdmE3SVVQTElMSzM5dzBEREkwVjhGem1taU9oZTJUdjFpaEtx?=
 =?utf-8?B?cjRhRUNTY0k1NHFTZFBJUlRDVE9TblVsa1pkbno0ZHRKZGxZYkZFOEhHVVBh?=
 =?utf-8?B?RkFJRTczY25lbUlNSnZhWms0VzN6K1ZCbDVyMDJBUG9CbGVrd1BURkNZdW1y?=
 =?utf-8?B?UTBCQkxUMnF2c2dSY3NjTEJNRkcrRzJXZk03UWk5L2txK1ZlS3FBVzZoNFpK?=
 =?utf-8?B?RithYit1b0tPQ3dtMnVKNGF2ZDk5K3VZYzRIMkNTeStGNnQwSThZRmFQeERE?=
 =?utf-8?B?bXg0VVRZSGoyRUxMQVlVNk5zZ0JJWGp5dlV5ZmsyRVJ5OHBwY1FuajVRYkFI?=
 =?utf-8?B?YWZwTFhnTm5PRGYxVU96YklTWDErM3lpVnhhbEtiVXJxR0hnazlMVGY1MGxR?=
 =?utf-8?B?dU1CV1NlbmJneFhhaWZYUEtMZjRuT2k5ZndLUTB1Q25IbzdIR0cyaDZ4bTNQ?=
 =?utf-8?Q?JG7UWxPtoU0EoeyCmDASxw3Mg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb355be-32e0-4baf-52fd-08dd4a15dd11
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:59:52.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYt5Jz1rWIrzKn8K6xHRY5F/z0Rl/EcRVN4UvROyvGiyYWaA45U7NkzuF6342HImG84FoLK+lXg5/2JhufpuFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

System Controller Firmware(SCU) reset some peripherals, such as CSI. So add
reset-controller for it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
-none

change from v1 to v2
- new patch, move reset-controller in top fsl,scu.yaml
---
 Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 557e524786c22..f9ba18f063692 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -45,6 +45,18 @@ properties:
       Keys provided by the SCU
     $ref: /schemas/input/fsl,scu-key.yaml
 
+  reset-controller:
+    type: object
+    properties:
+      compatible:
+        const: fsl,imx-scu-reset
+      '#reset-cells':
+        const: 1
+    required:
+      - compatible
+      - '#reset-cells'
+    additionalProperties: false
+
   mboxes:
     description:
       A list of phandles of TX MU channels followed by a list of phandles of

-- 
2.34.1


