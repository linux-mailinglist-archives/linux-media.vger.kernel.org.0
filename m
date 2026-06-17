Return-Path: <linux-media+bounces-65137-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7lpAKqj6Mmrz8AUAu9opvQ
	(envelope-from <linux-media+bounces-65137-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:51:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B9E69C3A4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:51:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=aVtcoYaN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65137-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65137-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC48308B23B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC67438BF69;
	Wed, 17 Jun 2026 19:50:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CBD38AC83;
	Wed, 17 Jun 2026 19:50:29 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725831; cv=fail; b=OxkuypD/X+aMTqztfplCmUmFbi3PZwu3JTN5LXMKjet3drt9bnb/dr2rlNLwq0xGkC/Vw5eA9PRqWdKPhcYb+70A2q8DKAHmCF2hhwG4XkupVOvY4vtwmeOo7ETy2J7KBXLxfFVWtiopq+BhnT6XkyvdMNM+Q0bk/WRgqn40oxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725831; c=relaxed/simple;
	bh=qB2lpwFzTrZToO68G8qx1Es7n9LXBisCDs83I6ru7aw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PLsFLWosi3dYCNbJ8wSuyEOq1UBhkTroPW/COpzorShqMO9Pemvn+9VxbEmHmUcAmvyHCPMDXnVvU/unpTl2HevFZQfBj9Y+/JyZhCkJ85M0jTkhjLsfU/N/0ORY59lxIug8DqFMl49HDPp2usYEC/5p0bQ/3HfIhbBAloKn8ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aVtcoYaN; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bluKX2grwh/AchouC1xQQf8AqRwxPphsKwOX6U2HoJ3Wqlmrbx3sQZiWLyol1AAWphA2nyskQUQ6A18Ga4ELCd7e+rtN3tZPhSS7DzbBmNxFd5Quoc4+Q0Akch9p1moeMzngzfJSNnSP4ASi7w+yTs7617Wu1UAYnN7EC2vhStWo+Lid0zgDVwKq1WmVVGgqn7YeeS5w61NzSPAqjmAp+aVHzDB4qdqFeuu9QrwgUnO+Yp1uqMqrXR3v9Nt0G2v9Y5WSOR4d53QpywhG6m3W5k8dW0/ChpSvlLBl6pq/4YyPzQh0wWD3sz3RKezeOBWLkVKE0BnoxBJTyz//8QBLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8Z7xXlBCrV8zDanIZcC7kEJxaLremIrCD2pRsrodYQ=;
 b=jBUDcjCSFPdEZyzh9g3aeNHGAljSZoQQvz0DkPZY472GjAcGo00Yrcz3ji1oDQg3XNzIcBBu2fICEbByrxaSUFOhUE2RmskpLNLzOq7oo4AIUhp79bVkWAlO/9MMLO9yscMbKydJCMz60PzCjxTz1tN18uwFICrRlycSc46o2B7GEspm6lhxkQ+NJurIkrJxd/zOf85E0Ni4pHHT7XSnyPdrnMGoa5oEsp8ekUGUx8IyBXJNgMiUr2hPnuIUAzV5Sf0DZj15wOZuPCJdaXj5ErsBLaN+Z1oZ0A/IL/PXhq5/+a/Xryv1neiM797AHlT8EkRBRTkPyJoVYhmx7aNGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8Z7xXlBCrV8zDanIZcC7kEJxaLremIrCD2pRsrodYQ=;
 b=aVtcoYaNIKzfdRCjuYXkh9BhILkVg6afHbVkB1YAmifu1oLfBwJ1+N8IXyroWFoiUEFCeZLfOEv09B5qlKwNDZn9SxyHoRfEHXhCtECaVBp7IeLj83HSTiti56jRLK+WlZSPVKkd3hetiG1o8qwBpVhNY8F/OqEHeSRr6yAy7Torrs11Bc3OQydqMbFqD7+u7wz3c7DAyWf6JCiQQgwNShjMhuu6fu7rl1vjsFV7Bnsvx0VSYSmiwEhB2+PZcr6A5hwZF6rN6QrZ2/bGh2qnMoFNhRf0q1kQmpwQgaTsaR+dAY7jX4pzV/h3dIhwT3vyk8vy/DmJ+SSdhAOCjXugxA==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:26 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:11 -0400
Subject: [PATCH v5 1/8] media: v4l2-fwnode: Extract common helper
 __v4l2_async_register_subdev_fwnode()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-1-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
In-Reply-To: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
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
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=2950;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=809ipkqPsufw7qKzATYoBt/J9AJj7sT/nAUWVb0Fw9o=;
 b=eWICtRNRTQoFVN09VCHyWkUP/9II+GUsTTy0jRIhWDw1gA5JG24T7uVF8pamy+jCzl9pAiTM9
 +8p21Gh1q6cDJf+oSRkLQZTLA5rK0RP8e9xjwbxDerdi9KLGxSkST9e
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1P222CA0079.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: a75a6066-6087-472b-63e2-08decca9ad88
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 pDxV31r0+WKKif2bN9zxafp7TMFnFotZCHN4h2gTOG75d3QC9LkIV1L1z43G7LnQ20OmgbmAlr2medUVCKcDABY6KJUVE2TYf8DPy0x1INJ7Uuaii6o3RAClqNAfqvnPZ6F3htejLXDFfjqeCrj3NDC6R4KpdYHbI5Q2M0dQskEUrdsKO4NdK2TQrwgld+w+hIiosonzigj4pdnQy1/kqH3pCYXsOMQ52wWyN2lUJU/F8+LOZxUpSSnnQ7A/c3nZVx3lpbRDSWX9taO8kKo92hnmWIOCC3XHXQWQUtm8CmS8PE1QFvgMSYPFKZqM+TUn1uDbAtUa6qd9Kjb7QXagOjyVwDs5qqbWofxL6qzl/ddKdFX9woRWjhmAYYGrStC3rQZOyWkOqsNU4ieuGtbW86gzy37QSWPi6qcEiZ765GXwdlpwu4ZOdihz7KDj0t/YZ1gembqizhOGlOEwPPJ7l0fjmsD+WO9JVmE6NqjaVOjIO4AN0cmrDDNKnpBygTBGOo1ANKDHkowZdFfvB3qKN0hYIPiIB0mq590d5WoZIlGun6wgdwQtbwI1NdT9YtMlo0K+U+qiIexNztnB6BEs19MUpk0N+HZwLwmhMtXZwR3NYG8ueYAEx1lyccRQVzIYctGPFR6EMto5YQk/RuAl4iwKo179ngdHwYxwZDuFzFDfQACOR8JauT02H+oN5Nmi0EpS3sQl4rpBsfZLBhsRpsjdQCi65sTbdY02cp28Rds=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?K21LZXRZU2xrS1JjT01Sb2wxQVVWc2E1ZDE0c1Q3YjlRM08wNzJ1a1lBK2JO?=
 =?utf-8?B?U1pGTTBySlVJa1p3U1Ezall1SDRobGlYdWRJalZpSllIWnAwSGZ2SkdUTEFx?=
 =?utf-8?B?WmdSTFFycWZxUnVYZHVmN1IrUjg5bVcwUHBFQjNtRFl1WGVmdGtKWTRrd05n?=
 =?utf-8?B?TWNmTys4bGEra2l0TU9relpDRGtnQkV2ZktBVHF4QzR5Nml3bUp0c2YrVEFD?=
 =?utf-8?B?b1JkZHl5cVRxYmtmOWxGdmhVUStzdkVVVm1lamJVRks5NkNGeUc5SjkxUXVN?=
 =?utf-8?B?WjdRb2dFWTluMjJhNEZyTGlxK1Z2RkRFY1VRcVd0WGIrOVo5U3ZTSzF2WFNC?=
 =?utf-8?B?dzNjRm52YnlzekhOMkgwbTRtNU5hUUxzekoyL3I3Umc2Z2YvZDhDZlV6SCtn?=
 =?utf-8?B?ZTZCcnhQdm13MUcwb0tkUmVxeGN6TTJQSG9KWkRkekZ1Q1BsSHVjT3ExZnBB?=
 =?utf-8?B?T0lnVU1XanNUeGltUFJIdmROVnJ3SVVsUTJzSWtneFpNSVlKUnc2azBYajFR?=
 =?utf-8?B?Z1dRZzFBYWZSOTVBY3hmNXk5TitLeFFRaGprdTJZd0J3OTJYQzJYd1RpeVVK?=
 =?utf-8?B?eEpYVm5zemZOTTlMV3Y0SFZDUnh1ZzQ3S1YwWkdScU02eFVFMVZrbFhGOGcv?=
 =?utf-8?B?ellNSVo2VDdSMkdEVDBBdXFEa0V5TnRlRVpoUHRUZzlQNFE3M29LM2lBOEZM?=
 =?utf-8?B?RGhuRzRuNlNUb0NYaVRGeC9UUC9NbS9QTzlqejRVK3UybzErcGRBRzIzNFRB?=
 =?utf-8?B?MjhNc0JxUnV1TmtTblRLdUJxRmxOQVUxajBVS1JEMUVzNGtwbFhEUWtxSzBF?=
 =?utf-8?B?QTVLZkpsZXlkaUtZT2pMTDhiVEJjVGl5SFdCRWpOQ2lzZC9iRHBrVkpFTGxR?=
 =?utf-8?B?d0FSOXVwVmtndUpzbkhZTDRaR080UWExamtsalNiTHZFSlhkc3dBM01qSWlS?=
 =?utf-8?B?RVFxY0F1YWNEdmNGZzE2NDdjdVRhbldjUnhwajJaSkVaSkxTV21tZ3VWR05k?=
 =?utf-8?B?SXl4N1Y5QXg4MGREbWNOQlI1ZmdPWCtpd3ducy9PbTQrMmtXaWNSWWQzaDQ3?=
 =?utf-8?B?YXZYaDRZU2lab0pnZitrYVZyS1FyYnFKc3JscmZhSStpMGRYeHMvMHk3MHdi?=
 =?utf-8?B?Zi9kY2E0TGFDaHRyY0RMUDhENEl5L2FLMDVqTkczKzNsZDJ0UWRNMEI2TlZv?=
 =?utf-8?B?THZkOGd5TnZvaXd5c3hFNi9YR3Y1M0h0OGk4Um9GUlBRSnlUM3JXTkpwNGo5?=
 =?utf-8?B?QjBTWitXSW1KQktTTWxQQ2NKdnhWUjBlU3lMRi9Na1c4SGJOTWhqOEh1NEU2?=
 =?utf-8?B?bGlzQW0zdGJ6NFdhRkM4bUJlOC92bnViZWdYNjBsOWpSRlRwdmY2emo1Nnkv?=
 =?utf-8?B?Nk84K2ptSHhUVzVtRGNlU2dqRWhXUU5UQmdJdlRnbzVZd0ZUdHF0eTkxUEpC?=
 =?utf-8?B?UmtCMzhCZm9NdUdWVmxkczBtSmM0bVIyUGtUeXd0TzJpT28rNTRQbXNHcVNQ?=
 =?utf-8?B?RUZDUmxKeWtGTWRkcHA1M2orQUZxUkFXaG0wcE9vWUJaeVM4bmZGUHhhKzV5?=
 =?utf-8?B?ZFVQOXJpYmN4clNJK3o0MGlCUmg2cnZrVWQyVEV1UUxoVFg1cXVjWjVVOTFX?=
 =?utf-8?B?QmZabk1JOFYrRSt1NjVjcTRNQzNHL2pqUmt5TGpiT1dKMVl1MTg0KytPZkM5?=
 =?utf-8?B?LzRqcGlOL243MjFob0gvYldBZlFVcTV6VzNDMURoeFovcFBvTG5yK3J1aHFJ?=
 =?utf-8?B?MldOc2JUZGlTSm5RV1Fsdi9pWnVsU2xrUTA2c0w5WW1EWkVGdWdBcFF6cmNu?=
 =?utf-8?B?ZW9iNWRyMXVIQWdyY2MwbGZJUjR4dGpCNlM2T20rWUdrVFgvUlEwTXNKeU1z?=
 =?utf-8?B?L04zUFAxWmN4TjZ6ZS9sTzhvMm54Sm1HYU9PV0ZzWEgxM2tOVzFyRC9HQzJq?=
 =?utf-8?B?VkxqUlB1eUlabUpwN05TNlppbWlnTExXVi96NFBPZ3d3VzVnOTkzQzBWTTkx?=
 =?utf-8?B?V3ltSURYMWNMUzNuR1B6ckhvTkNaWXpKcVU0R3o4dWs1RG9sNDB2M0xGZXlF?=
 =?utf-8?B?Q1B2bmlKVHBzL0U0cmhwUTI5c08yeHIrQ3RFbENBRU1CUUdUK3hEUWx5T29K?=
 =?utf-8?B?aGczRlpyaURDbE94ZDA5aHErc3ZmeVBHL1lVTTdUS2VsOWxIR0xjUjhKQWVS?=
 =?utf-8?B?Mkh2RmJ2N2lCMVFaYzB3a0RmYjhnUE93czBOYkxoYkwzZDIvdFYvaDljSXhF?=
 =?utf-8?B?emJscVlWcG1tczFBN1VVUXhRSjl5VnlTZzFRdVZaRkxSYUFyOVpVYVJYNzlh?=
 =?utf-8?B?eHVxU2wvcWlEMUI2MzdZeEtzMmpkUkUydEk4VHBXOG1KQ3hWcHZORjZEeWVp?=
 =?utf-8?Q?QsK3s2hi+evPQLw/0FVxzu86JDz7zAJHjt3ne?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a75a6066-6087-472b-63e2-08decca9ad88
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:26.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8nfdgiCZQ8xmjVoC8Z3J9gbytwsDcbmORivicSFF9B43ZUmjDnex3qBErgDM4AiA/hXqLk/7DwGEmhEMpEqBE915QE6FdrDREmjueEhVh5cvpxzH3HSxjTOKiAfZC/w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65137-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,NXP1.onmicrosoft.com:dkim,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,intel.com:email,nxp.com:mid,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 02B9E69C3A4

From: Frank Li <Frank.Li@nxp.com>

Extract __v4l2_async_register_subdev_fwnode() from
__media_async_register_subdev_1to1() and make the notifier parsing
function a parameter.

This prepares for future support of v4l2_async_register_subdev_1to1() by
allowing different fwnode parsing implementations to reuse the common
registration logic.

No functional change intended.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5:
- new patch
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 17 ++++++++++++++---
 include/media/v4l2-async.h            |  6 ++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 62a3a452f7884..f32dbf5bc8344 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -1256,7 +1256,11 @@ v4l2_async_nf_parse_fwnode_sensor(struct device *dev,
 	return 0;
 }
 
-int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module)
+int
+__v4l2_async_register_subdev_fwnode(struct v4l2_subdev *sd,
+				    int (*parse_fwnode)(struct device *dev,
+							struct v4l2_async_notifier *notifier),
+				    struct module *module)
 {
 	struct v4l2_async_notifier *notifier;
 	int ret;
@@ -1274,7 +1278,7 @@ int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *m
 	if (ret < 0)
 		goto out_cleanup;
 
-	ret = v4l2_async_nf_parse_fwnode_sensor(sd->dev, notifier);
+	ret = parse_fwnode(sd->dev, notifier);
 	if (ret < 0)
 		goto out_cleanup;
 
@@ -1300,8 +1304,15 @@ int __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *m
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
+EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_fwnode);
 
+int
+__v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module)
+{
+	return __v4l2_async_register_subdev_fwnode(sd, v4l2_async_nf_parse_fwnode_sensor,
+						   module);
+}
+EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
 MODULE_DESCRIPTION("V4L2 fwnode binding parsing library");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 54a2d9620ed5b..a9345fb921b43 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -338,6 +338,12 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
 int __must_check
 __v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd, struct module *module);
 
+int __must_check
+__v4l2_async_register_subdev_fwnode(struct v4l2_subdev *sd,
+				    int (*parse_fwnode)(struct device *dev,
+							struct v4l2_async_notifier *notifier),
+				    struct module *module);
+
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
  *	subdevice framework

-- 
2.43.0


