Return-Path: <linux-media+bounces-66384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id quv/Jn+NRmrhYQsAu9opvQ
	(envelope-from <linux-media+bounces-66384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:10:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 338256F9FA8
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 18:10:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=GNxhqVVL;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66384-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66384-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E24B3190595
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 16:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B6433A9FC;
	Thu,  2 Jul 2026 16:04:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F9317145;
	Thu,  2 Jul 2026 16:04:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008261; cv=fail; b=bEA0Nq6ydVpYWRgmczt7IMV/qcS6++JefkK/9N8RxTi2Vbf+bM2vwtEml3/iEAqHIo17hcoFOeVI6ZvF/E7zZckHduiTC2RPgBIOVK0tneAX/AJ58XGr3NNymj4aX6dC5Ld1FzuJZn6ldbTxJnem2htigjvi90KH6ZmT5fTq+VU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008261; c=relaxed/simple;
	bh=NbyUHRMxYzYD2yEN3xNhzZgLiTlYjgl4MwAxkxzlhmk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PG7Vl/QE/oNExRd27JBuE8FtOe4WxJCj1p9jo1ye/aw6hu43dzDsCwHPRDVy1dZPMop2PG+owophuBRUBdpYWwqFs//eVDZKLyskceGmMN6iOp2s7OBrQoyijt5FfqF3HHH42Ja1iVIYHaRilE1G88XE/7cv8XCMs5kwM5gWGac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GNxhqVVL; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAcKaI5i7lN/JGkMnajpcXCC+AqZS3JQGsBYp7xG+ENio+NCTDd4lwrAh0fowdAdEabBKEoKvvtyU8yAPWZF2vDkFrNbXmWsa0ARmWCnUbxVGSCYS/JGIqt/JTr9ae3PdULSa1dI3T7y/8RIYuWtVgjuQUabEAH8ZXA0vdu0Ljbv95cHjRDkszjJokSGSNhRWSA7zDxbXvEFzuUiAScLqZKbUmnsd1WeP9B8pHMHVJvnGOUqcnl4mGNC4QVDah72WP4n3pW846PbEvISzQ0/mzy1zAJOKjKRb06fgzCQvhvtggkt6Hc7PjZNErV2DgB67HPQYrcB8dOfkQmI0djBLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xq8Hlq1Nng1oT3VPE4+S5o8zVTrpOpOSt2OP1e/D50c=;
 b=jHuEAnoQQ6lm439MROibp1g5L7NczXO1Isr5ZGZmfPO4CfYCw8uVkvszj1yVFsB+noYfqzyHSWFVY/G+mMfJyhztu0uDlBxv0kqN4aUnS/DkSL1ILCXy/E6ifNBhVvxVPeM7NJ8zN9IKfQCIzp48h7M3ydgWSDPXLiPc0mMBq8O8sDPqnTDPdaczkM8faslvi8wgZEU4uI0c+1dGgiSwo7MC6c7sYdIY7rL5gUvoggxZu7FVchGnCOQNMt0RtEgJmSlB2TOWkGZWyjaEg23SPIZE3LK1s5QruOoaAxREbdIVIj4MnyzV7EtUA1FsN2ANwQJO1WHH+0DVHIjPDPtOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xq8Hlq1Nng1oT3VPE4+S5o8zVTrpOpOSt2OP1e/D50c=;
 b=GNxhqVVL2hVadIV/WwPRzFIigeM4kBHNoyjlHhar6IDAqgIb5tQZsdHU587gnrZD/rc2WRelyZxkZ+NkgWhzQEwONhtUe6OOpEEZ8h3m6s9m4QQ5+A5sh0gBUv9ZxAkK9ZvbTaM8doQpf6CAuXvu05W3wkw4KGy8eVn75o7MPvGD0azE6Ie0qvxGm6S3+J4DRzpx2NsGzvEaHZ/z0k5PCXyUabOUmAXzGfG6GNLr2q9GuMCpDULzaFn+swLIuOadclHtUd9b/WRbQgw8HDjR6+pZxsk1wxPht14qld5afSPx/xpgBxMJZLgiEqoPeQbqXNpMX3eE7kNt29aSChrZ5w==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:16 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:16 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:03:57 -0400
Subject: [PATCH v7 1/8] media: subdev: Add set_pad_by_ep() callback to
 internal ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-1-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=2037;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Fcu6LwBWjAlMtg92rtXl9kE6Ft7YN438/rcH8f0yTI0=;
 b=InjK6A8HliL03gl2xfRhAR0ynjSDQtu//YyKZBrrKXVZr8YMjZC2DaxwQpU/QSnWZxf9VEbkv
 pbcngLXJSoJBYDo7HHev9o9TaZ2b2crModlbMMxo5zI3mHg0u6pTaVv
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: a25427ef-db46-425d-203c-08ded8539145
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|5023799004|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
 rzNTF9zPHKayFNRD+3/sdM7sK59Gz8jC7T3/qgO2NvMDOL3/agTwM8e4hXKXSBf4lTklKv+UA+1UHtn3BOVnqwGrFnyoJmD1x+FlEXTjz3Qdu2ZKjI3Gc9itl6N/fZi7EQkc9XwOpyYBUZSgudTXxDEHFoqMHbAtCCkcdW9qS0dDDgCOB7a/G/5Ex2N6AF5SGro3GBrEJrB41gN9NfPUThl1sXgbyfnP8rMit/7dHOWVnsjDrpDCO+4+D9Bgul95UPSpDJWZY6HKH5QQG3QV5YJaqgPeDigHWaxYueCKMa5OEBWFLxf+glzxCwFp18FUUCYlkyJ1CK2mB80GG0uuU6r7T/lvhN6guYOd8IDTNC13rGTrIfdhEmuDdjWRzB+UCT1G06LA4X64oLucmE9TavWUOTTvm8Mfel4gaHuHiw05hJh/AkW40itpgJVMa9C/5i2ThamCbSUmjl7voBOweBkif3vjip6vDLGaPSaAF3UowB0HbjjZHBYS5HsVcXpDkUSxjK1ryM2YNlCeQpA4dktsEIWmBwo2t2iyYJTnQw9/O8J9SEUMR0uNuq8J1aWOhTBOxPcEQ3g+mEREoa4y993xPJtrvC+75RSN0B5UGRcJX7m8m57A4Xx7cqVWrFYTqduhYfk8AG1vXrUP67zirSr5N1cTAeUsDexllwZ3xid529zAfEyUP0QXNXitjHS9tziAXeQGUaWPpZzbSXFMiA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dDJJSzM2TlFSTk1IRnZMb2srQm1sRzJIbDc0MXdSNE0vMTVtL2I4RDlYREp2?=
 =?utf-8?B?MVRrRmlhOUx6eVdaM29OempMcHFsb0xGQS9IUFJ5RGlKY1E2eDlZZElYcXFU?=
 =?utf-8?B?bGVkTU8vZVhFM2EwUmdtUW1iYmlidndVMjVSUlExdk5hOUpUdWZxMnoxU3BQ?=
 =?utf-8?B?aWRyZjBBQTBIbFpYRW9mb3RNaytKdEQvc1Arb1BpRFdqNCtkdnBmMEVJdS92?=
 =?utf-8?B?b2V1WHY3eTF3NzlQaHlVZkFLeUpFcEJnTXIrSVp5QjRLTytQblNBODJVWHhP?=
 =?utf-8?B?UjdzRlhyYUQ5YjZocUJXMlYycVNXLzRRLzBMOGs5U0QrelIwYkZJK2RVYTlG?=
 =?utf-8?B?ckF4dEUyVkhRdThYbFNlSkdBYk13R1FVWkpiWW8rZHU0WWxlR2dsOTFNZWkx?=
 =?utf-8?B?QitycG9hU0U3eEhpMXFJMGY0TjJFaGMwQjYwQ3R2TFRrM01EZGxnRHhaMkRu?=
 =?utf-8?B?UytOVi9SbFpScENBL0kwMDZMbmNiVnRycTJwMXVTcjBhb0VVTE1aclRGaDVx?=
 =?utf-8?B?bUpOYUJSakcySklsK0VtRFF4aERSWmJxTDRURnFSS2U3ekJBUStib3N0QURt?=
 =?utf-8?B?d0JwNnJ3MVNUVkMxdi9XdHYyblVwYXVObkppWEdQU1FEWjJZN0RtMGFET01a?=
 =?utf-8?B?eCtPTEpoVERLejBZZmZ6Wmxmb21qWWRqRVhyTThrbmhiL3dHYXJ2M2lWRkRq?=
 =?utf-8?B?ZHhGbDUzS1dHbHpINTNuRk5mRlU0Vkp3WGNqK3VWVnZ4Y3BxQVIyTVBYMkUr?=
 =?utf-8?B?Q29ERW9iRks0N1hxRFg0cXVRcVNEbjlCeWRUclJVOU1uYWtkZElvYlF5QnZG?=
 =?utf-8?B?anhaY2tDeERqRFlaSkJ4Z0tsOFpmQXVKM1FOK0VhT0xlSUhkNGNHU3hsZlZX?=
 =?utf-8?B?bk5TNUNabytzRkc5OHUyUCtMUmJJd09YNEM2UzNEeGE0dUZvUlZYd3N0alJ4?=
 =?utf-8?B?VExEcjZzNGM0dDUwTG9FRlE0VVArNFlFWTFwbWpsVTJVQTU4RWF6UWlIZGlB?=
 =?utf-8?B?WVppWXJybDhYN3YwRTZaZjRYcEk1ZWhaVnJjVVpVVWFsVlFyaHo1a1haNnpo?=
 =?utf-8?B?SDZPYVcwTmhkMHQ2VllQRnhOUmxoQmJHZWY1cjlCR3NRcEpBZ2t4YU53ZzQ0?=
 =?utf-8?B?cDRGZ1BoemxlL1NUU1Zobk9vVjg5SmtQSlFmTTd2R2tTOEttd1JuQTFsTmd2?=
 =?utf-8?B?elo0UmtOSE53VjZxUUpVS2xVRGoxNDhSdkVUbmFSSkRqSzNuQisvTVp3cGZE?=
 =?utf-8?B?eTJiY1NxZFBtbkJ0RVR4NnpGdGxYOFVGNlYxTzMyUlF0bkpIQi9GNTlQQXdT?=
 =?utf-8?B?LzdDRUw2cWM4bHExMExsQXUvZFdPaXRvd0lvYlY3cm1Hck9nUlVxYnpCeDF6?=
 =?utf-8?B?LzZoN2Z0SnZZTkxiOE5ncUR3Qm8rTEh3ODdELzBxdHphdTR3ZVprMlQ4bzhk?=
 =?utf-8?B?VEFidVpFNTRqZ1UrcmU1d0pRZC9HMzJxcTQycnA1ajVlR01TUFoxZG9Db0xh?=
 =?utf-8?B?QTBEdkVaWXAvUjRTR1czYnVZVU5ZUVJsRGc4N3YxRU5JQnNIdldyR3plWVNw?=
 =?utf-8?B?R3cyano3dmphWFBDNXNidUo5OXVuNkoycktwQk1pWk5IOFRIMWFobHU4bmhI?=
 =?utf-8?B?VkszUmpCdlE0SzhxbDNEU1gycjRJY3V4b1pEdVBjdVFNSnJKVEJ0YXpYeW8x?=
 =?utf-8?B?bnRvd2pmRm5VTVJYMUpaWXc1UUhXSjYwSnZvaU5ZckMyNHo1UUI3Y1BKK3Q3?=
 =?utf-8?B?QjZvRGNXMUdkaXdRQzBseWF4aWZSZlNXNTFyQm5FVVJRWVUreDBEQ0I1T1BS?=
 =?utf-8?B?T0RYR3BwMVdJbnF5em9TbzNxSWtlRHh5d3h6RFdWQXFBQThocXBKMFUrQ2V3?=
 =?utf-8?B?QVhwa3U3QVUyRW5zb0czYlJ0TGE1Q0hhemRLaEVkTzBsbktxOWJCb1NWR3Ew?=
 =?utf-8?B?V1BUT21BS1l6SnBXaGdDNWNKcE51N2s1YXQ4ZWQ0RWhpdVQyeVNGWkd6ckNz?=
 =?utf-8?B?bmVlWTZhcXVaTDBpNThHQldNaHNvV09YckZ6QVZrc1oyTTJ2aTdpd1dTd29J?=
 =?utf-8?B?RTRTd2dyMVpTTllsWVRQSDduNXBPVWp6bWtkb3VyRUVKSEhsVURvKzhkZ2pF?=
 =?utf-8?B?VWM5dGJhVUh0R1g0eklIY2drY0tDZ1NBSmlmQ29Pc2xBUENhMmx2eC9CODhR?=
 =?utf-8?B?bHo1WU9QZjFLWlVmK3pOaGdYekN6ZUdwaGUrUHM3TzFIcVUzZDY5TXEzWG1Q?=
 =?utf-8?B?ZFA3d21QZmNraTFJS0xvZStscnVZNVlYTjZlZ3Z3S0dFakVyYUFaeDlLcEY0?=
 =?utf-8?B?WC9rSzRtUG1Ha3BzU1NhdzhQZzNOVEVjWUZTT3g3Qm1nRW1nSUkvREVVa1lz?=
 =?utf-8?Q?lYlFTdcwNFwnq8qYIwRvVdEuYyNgA2upq0+vg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25427ef-db46-425d-203c-08ded8539145
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:16.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl1CAg7Iu/ktVXnmXD/MyDVWXRmJiuOwivt6HdiEY6vYB9bQNpvklIMhG3SBwz4/Nuwz9uY+IrBMNWg12rt2oALTiK4TZnuHt5lsLTwL0vwaGORJ3ibENFD9qS3uNsaS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66384-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 338256F9FA8

From: Frank Li <Frank.Li@nxp.com>

Add a set_pad_by_ep() callback to struct v4l2_subdev_internal_ops. The
callback is invoked while parsing firmware node endpoints and allows
subdevice drivers to configure media pad properties based on endpoint
information.

Typical uses include setting media pad flags according to the endpoint's
port number or type, and validating that the endpoint configuration is
supported by the underlying hardware. This provides a common mechanism
for endpoint-aware pad initialization during graph construction.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v7
- add vep argument

change in v6
- new patch
---
 include/media/v4l2-subdev.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f848..05b3ccfc856ee 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -34,6 +34,7 @@ struct v4l2_ctrl_handler;
 struct v4l2_event;
 struct v4l2_event_subscription;
 struct v4l2_fh;
+struct v4l2_fwnode_endpoint;
 struct v4l2_subdev;
 struct v4l2_subdev_fh;
 struct v4l2_subdev_stream_config;
@@ -935,6 +936,10 @@ struct v4l2_subdev_ops {
  *	the v4l2_subdev structure. It is almost certainly required for any
  *	sub-device that sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag.
  *
+ * @set_pad_by_ep: Set media pad information by parsed fwnode endpoint vep.
+ *		   return < 0 means can't support this type endpoint. Set
+ *		   pad->flags according to vep information.
+ *
  * .. note::
  *	Never call this from drivers, only the v4l2 framework can call
  *	these ops.
@@ -947,6 +952,8 @@ struct v4l2_subdev_internal_ops {
 	int (*open)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
 	int (*close)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
 	void (*release)(struct v4l2_subdev *sd);
+	int (*set_pad_by_ep)(struct v4l2_subdev *sd, struct media_pad *pad,
+			     struct v4l2_fwnode_endpoint *vep);
 };
 
 /* Set this flag if this subdev is a i2c device. */

-- 
2.43.0


