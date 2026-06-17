Return-Path: <linux-media+bounces-65138-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wNPKA7P6Mmr08AUAu9opvQ
	(envelope-from <linux-media+bounces-65138-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:51:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636669C3A9
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:51:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b="h0/tZeKF";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65138-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65138-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A55D6313AB50
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2864038BF69;
	Wed, 17 Jun 2026 19:50:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8738E100;
	Wed, 17 Jun 2026 19:50:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725841; cv=fail; b=mX+hhskLYEqTfphJDC+aPONvSTTmwh5Pu0WduGrvjuk5qUpLXE9EN5Y5OIKx9WrdtYBD/AiycJTUOwvP9O66jm2mc7W/iDIt3sIEA2d11XlnXvn5W7HhDey9yk2b8DnI9ySew0MtAlmGukeWYwRz4b4A5SErgSeRMyDymEBrex4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725841; c=relaxed/simple;
	bh=Oafstw1y+79S1z3nyBnuvAeD6y/TcKb/isOpmHQ+nbU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hGN+PFYJ6OBpZtFluWugO6GoQZwdBlnLIzqbJX80vHmivVxgcIvrkkBeLXs0RCUkUj1h2NiGfJiGH345J1SZJr/JwB973X9G3UYPUdErewE2Lr/hQJvR9Gx8PisrqXe52dGaZzN3BOnugAg1PxYQutbuFkUS5o8V/ZunLWBvyYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h0/tZeKF; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TB1wAhxc+bz0mupSmG8NX67mIeF4XdLegJBzRK0iYDFeOD5qw3rci1M6vy/9Db6/gBJ9eS+N9PNb2wXx0hfA54+OziIFwX6c95JqJVvVYgUlC6xXBSeNXktekFpf4o/R8z9ioGN1cDcG92Fx/tLdxNexaO6E/C8YLv/RKej/W6VEI2g8wsmO1FW5rroBEFjvFXb5szfWPBk2L/5sWFgG8WIH69y66kka+CDMQig4hT0+WOeUWSA9a3bVJ7pCAgjgCxjcT1ZmA0RQN7s+sLB8IU0YWsz6jPqbOcxcpJn4H1Y57NqbrdOEe7Y8q64YYcIuCOCjWoCgJT8IrMUhcpoYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugTg5iJK0CiyUrfBPyn7AsnPwP3vzIIuL1XQJyVuTwA=;
 b=WZoEdY9X3oNo3du5VA/LDF9/kMn0n3byG4xIli2hGu97Rnl9YdayhVsH2yaSIWB65dwClJk2hXGJV/KofV1fiS5/g0uwEy5csYG66V1bILuA6esUv6I59YTzGdBF1eI/8SW/+GUH44SFqfuIJZrGBjXsLsGVdrGnrPteXQ6SIRAdI1byPdVi7dB/stT5au3k9EuXLKoHop8ay/g/ppV0gd0flnZCUb9WzKNtSqY30yGSJXsr4gKdL0AS88cmalXnuxSBD29ipExKU5kNboGgDW5Sgc8x1xHHN2v0CyX1BdmcraTSsGbPdAwnXhoI8uKuRh/+0vtP1qKW07tHMoEN/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugTg5iJK0CiyUrfBPyn7AsnPwP3vzIIuL1XQJyVuTwA=;
 b=h0/tZeKFjQ6Jvcf8O+d/MaGxrWZcTFT+QSDdD9BjOXlxYom+v8Z5kPEj+X2TjrbvaUl4BHSwUpp/BXDt+lFEHiXHmCrh+xFXpQsOVRPQSjAF+awo/tUqSPQ9B3G3znLo80qPyCQfNQQZrx8PSHDdMf+0hkqHAIlPzA9sW64bHv6AAO/OvohJAnErUboDN4m87LEziIQFaxyaMjuEocpgp5rTKH2iDl78WVJR/wvbTw612jMSUFkDqSzXFau0Eo3O8yCUAWK6pEm08ICRLwa4rszDpS5lA56PnlNO2Zh57aXmCRBUNVylM2mXugYL4HyTKe2NhG3Dg7mjcBrvLkez4Q==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:31 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:12 -0400
Subject: [PATCH v5 2/8] media: v4l2-fwnode: Add common helper library for
 1-to-1 subdev registration
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-2-7fa6c8e7fba7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=8653;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oWDZ4WR8OfrLMiyFdtU9jDzVUqo/A6ujTI3uIMKsHWw=;
 b=JzFjM9EqydMff7SO+O/nK5rrM0bj8Feb+4VE9SE3cpztKzz+bHoPbO6Ix6iKK1N8cAkVqkak0
 Ow7hM/B8VTpCtkoA/Dz2LUIMyGATlOzgdXrvz2WwnP/cLTJzBzwzXcm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA9PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:806:20::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c9ba26-4eea-4073-77d7-08decca9b00e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|3023799007|11063799006|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
 7kPJnkJkX0g4ayULQb4sNOkGjOfsPDk0j23z4ZkPKQ8Tq99JbkOwWhKzI9brf26qwmXpULoeiLDTZniptK6KmqprjV4qnR3R8nLg9nplKIDaLhTs2in5iJVKmnecX56Elz6w7b9csT4fLFksRnp0ANOR6COKyKIoWzjWLPOuofn6OQ2FUH/VFpLfye6bEGbnbrC8Zejkh2xboAYeBY+avoRnol4MfIgdqxq3MSByj0oAt2jQuva8mlpYeKSzvoKZM59wqBL3n5ewvL2YhNOnXBDPnRwkVlS0AOAXK4aDAhKTw2bNyhhafj5HoGy4k0hcztZMNpruNwcybX7nTxpwRAdJYcIJxzbWQPGbNOskH9f0GWU3SSQoxNLJGJkpDPWsjnI9FC5e18FbkNa4Q9whHc3UYYFLZfV2Vud5ykg/PdDqP0K2+T2Xu9pb1kGmVB4J4Pz7lvUEM2aUha7h12w48m5x7fafBE3am7kdSdN698XN/11hWuWAYcrx0+UHOVb7PH3hkXZ6GVTlXJYnVfqH+u9ot5I/PPRvpUkvaDz1Du9K3KuipKTELkq9tSm0a+excRbz1XfCcYXULm9bloJxM+pM3ND1xO13XZsFD+dhhUvqo1a5dknb8RiR5y79hEgwuf2H3y/XnWDg5OPzJaynxo5wIqexYdJMuhgPOD1NpruGxtK50HHleOHBkM9j6+49lGOYjmVpHzwVcEOnLP9JFT76Ce6lTxfGV30Vwj10S7M=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZXhFRWMyOFVQdGRhSFhDT0YrVThORUhnbW9OQUY4QW5XUlhNWVNVUVNwWnUz?=
 =?utf-8?B?L0JIcW9ub2VZSHlEMVA1SUpJY01nbU1hcHo2c1VoS201a3N1UlYyZHEva3Zh?=
 =?utf-8?B?V2VDcHpjWnloNVlJUmg4d01vTXcybFpZUG5yNDVIMERyMlRoSmRScjJ3cnpq?=
 =?utf-8?B?eWc5aW10Y2hZL28yTzk0a1haK3JlZktEUUlCb0RaZjF1NVhtSHJUTmNEV3BR?=
 =?utf-8?B?eEZFSE1YdWZ3S2dEUWhvS0VPakpzOEwyU0Vwcnh4ZVJNTi9PQU1nQVdjVmx0?=
 =?utf-8?B?REFQYWhEVGp6blRVNGdhT2daWFFHU2wwOCtLYk51R1Z4UlM3QVdCOVJPdFhv?=
 =?utf-8?B?RE9FN2VOQjA5K3RDMHR5T3lObmQzTzZDT0tpd1dGVEVxbW5iSVlEdjN4Mmh1?=
 =?utf-8?B?QjFvelB0bWM5eEgvTUxJN2tSejZwVTVBS1NVUmdsOUowcGxMMVRncXk2bUNE?=
 =?utf-8?B?aThqcitNNkFsQkF1dFlIaUFqdG94czNSME9mbFBrR3JJOHZ0ZTJSOCsyYytQ?=
 =?utf-8?B?bFRJWC8wQnhwalZBSUdYRGplYzlJYmxWcjA5N2EwSUd3S09OMWFYenRhdTVJ?=
 =?utf-8?B?QUFWZjhRZEVZQi9aK2FqdnhtTUtaMlQ3OGh2eVY5SXdiekNoVjB3ZU96RDFC?=
 =?utf-8?B?eVByTjR5SndFRmNNWVlJWStvbTFDaEZuRExUQnE3ekZTOFlVSFdDakVteEJ0?=
 =?utf-8?B?Zk5BZk5pNy9pZjVuWlNFazhKbWhyL0tFR1N6R3Z4NDF3elpON1NOTzNBb2xL?=
 =?utf-8?B?a0xiNSsvcmlOMzVHWlIyN1poajg5ais0cy9PVC9TOVJWSzhlWC9wWktZcmlL?=
 =?utf-8?B?b3N0d3pEclowcEFFRG9uc2xGUUdPV3Y0ZnNCVmpsa25zTWd5YndaUVlXcnh2?=
 =?utf-8?B?cE0ycWtDd09CTWc3TjliNXg5Tm5QVkpXaTJPMk9sSnhpdzdVY3NEZUd5WTFl?=
 =?utf-8?B?TmIzMnlaVlU3elkwSXBxaVA2UFVFV0RLWlpLRDVWanBrMWJGOWZFQk1IaFN0?=
 =?utf-8?B?NkdjODlhMnM0OVZrT1lyRUVhQStDa2c5b1VQY0NOL1NNbzlrUGgyQ1J1UEEv?=
 =?utf-8?B?RDNHQzJVU0RibzdKUmdCcmJWZlJlRE9lUEhEWlA4YThKL1JXWU1GakttUmVP?=
 =?utf-8?B?VTVxM0JERVdPMkFRYXU2Q0FUQSs5UVplNXhYRVMrWUNsYVhqVnQ0N0tVMFAw?=
 =?utf-8?B?SUFWV3BsNzRmUHpWUUorbEtjMnJjMk1tdFNvdm1QOWFvTy9mYkpLZWNpVm03?=
 =?utf-8?B?cE81SnViTHphejhEcXlWMzVoZWtNOUdEZlhTZ0lHWExXbU9KWnZYZm40NWUv?=
 =?utf-8?B?OEFsbHNENmFaMDNjQjVFTitjWVdWb3ZqY0R4ZmVNVFJteVp5cnR2cWNObElq?=
 =?utf-8?B?SGt3dEdKYnhtOE81YUFuZ1BmWVVCc1QwY2d1RWQxV2JnOE14ZjhoMG5icmp5?=
 =?utf-8?B?Mzd5RWhOeGhQRDhxbHZBdkM1RVJCZVNnVStMZnU5cnhUb1NKYjU2MTZTb1pm?=
 =?utf-8?B?NU5kZkt6V1lZYXBoa282b1BkcWVab2VUL2o0VjB4M0VJWTNaTXJWL3ozeFRs?=
 =?utf-8?B?bTRjRmprRUtseTJkRWhBRklSellDVExCNDhlVFlyN0NiY2ZmMFFEUjlBeTN0?=
 =?utf-8?B?b1ZqWVAvclFvQzdRL1lRVGtmWjZvUFFZMndOalcxMldoY0d3TXFCaVkxQkMy?=
 =?utf-8?B?KzFWZ3VDVW5JbkZVQ0d4aHNrSXFTNTNvbVVvM2VsYmtMMU5QczJ6NWxuTVVs?=
 =?utf-8?B?eTVsY0NaNFFZWDBlQXZ3UEZibVhWaVZ1WXNSL3pYZzFiSzJqSnlDV0RkMENp?=
 =?utf-8?B?NmF6Rmw1YWp5YlR4R21QZ3pZVmJET3Y0ZlQzRVViUGNLdGZjMHZLT01VSk5X?=
 =?utf-8?B?cVFMUE0waC9PSFhoTlltK2FFZXhGc2pJVUJjR3dRbUR3RkZUVTM1T2s5TDRk?=
 =?utf-8?B?SDFZVVhYQm84ekNoSjdScGZyYlB1S1FBQWVOaDdyOXZTNHEySWR0Q3RnOFJL?=
 =?utf-8?B?WmFWblV3dk9PR1VFSVJvZExtZVZ5SU1PV29HVFVTc0JiUGlSeFptd09FbGlo?=
 =?utf-8?B?YndtWTZRNXZNU3RzbU0wZ1pmS2gvY1E4ZGdpOHNrZHNJNTVwYjREVjlhVUl6?=
 =?utf-8?B?T1JKb1c3S2ttNzBBS1pIMEx3WldpK1lCM0N4MFJhQmF5QTFQVUU0MjlDV2hl?=
 =?utf-8?B?MzVFM3R1Z1d1MFVvM0RSbGxadkgxdE1pZnQ4Y25ycUxGZHZsRnJPK0lQQTRi?=
 =?utf-8?B?NFRuRWxZa245aEtTRkNrNTUrcXJ3c1g0bmxKOXFmbktWYzl0SmZSVnZwTjdG?=
 =?utf-8?B?N1ZEdDVHZ0xRNXgvUFdBTVhOOVgxQlIrc0IxVSttZlB3ZGZCUkVjeThjSGRX?=
 =?utf-8?Q?A3k0UgwkBDg2o85Y/flyBiQl1CVFycOxG3Wdw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c9ba26-4eea-4073-77d7-08decca9b00e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:30.9874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2iD61Tgt4QiEGRQlZlH+wMVNll4rr8ctoc+PQzntb3lBIv95e8CQMXPL6uwBfgL/8jv49ZyQcVeb1zZjoDLdnq5bb5v5ZK2gQYe//1FjPjroKuqbKzst7c6sMCe2+gD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8227
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65138-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,oss.nxp.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7636669C3A9

From: Frank Li <Frank.Li@nxp.com>

Many V4L2 subdev drivers implement the same registration and media pad
setup logic for simple pipelines consisting of a single sink pad and a
single source pad. As a result, the same boilerplate code is duplicated
across multiple drivers.

Introduce a common helper library for 1-to-1 subdevs to encapsulate the
registration, media entity initialization, and cleanup paths. Drivers
can embed a struct v4l2_subdev_1to1 instance and use the provided helper
APIs instead of open-coding the setup sequence.

This reduces code duplication and simplifies the implementation of
simple bridge and converter drivers.

In 1TO1 subdev driver:

struct your_device {
	v4l2_subdev_1to1 sd_1to1; // instead of v4l2_subdev sd;
	...
}
...
your_device_probe()
{
	v4l2_subdev_init(&sd_1to1->sd, &dw_mipi_csi2rx_ops);
	...
	media_async_register_subdev_1to1(sd_1to1);
}

...
your_device_remove()
{
	media_async_subdev_1to1_cleanup();
}

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- new patch
---
 drivers/media/v4l2-core/Kconfig     |   3 +
 drivers/media/v4l2-core/Makefile    |   1 +
 drivers/media/v4l2-core/v4l2-1to1.c | 117 ++++++++++++++++++++++++++++++++++++
 include/media/v4l2-device-1to1.h    |  72 ++++++++++++++++++++++
 4 files changed, 193 insertions(+)

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index d50ccac9733cc..532375cae7947 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -74,6 +74,9 @@ config V4L2_FWNODE
 config V4L2_ASYNC
 	tristate
 
+config V4L2_1TO1
+	tristate
+
 config V4L2_CCI
 	tristate
 
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce994..55bf0e6bf2e33 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -24,6 +24,7 @@ videodev-$(CONFIG_VIDEO_V4L2_I2C) += v4l2-i2c.o
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
 
+obj-$(CONFIG_V4L2_1TO1) += v4l2-1to1.o
 obj-$(CONFIG_V4L2_ASYNC) += v4l2-async.o
 obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
diff --git a/drivers/media/v4l2-core/v4l2-1to1.c b/drivers/media/v4l2-core/v4l2-1to1.c
new file mode 100644
index 0000000000000..9f23dccece704
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-1to1.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/property.h>
+
+#include <media/v4l2-async.h>
+#include <media/v4l2-device-1to1.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+static int v4l2_1to1_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *sd,
+				    struct v4l2_async_connection *asd)
+{
+	struct v4l2_subdev_1to1 *sd_1to1 = v4l2_sd_to_1to1_device(notifier->sd);
+	struct media_pad *sink_pad = &sd_1to1->pads[V4L2_SUBDEV_1TO1_PADS_SINK];
+	int ret;
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad, MEDIA_LNK_FL_ENABLED);
+	if (ret) {
+		dev_err(sd_1to1->sd.dev, "failed to link source pad of %s\n", sd->name);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations v4l2_1to1_notifier_ops = {
+	.bound = v4l2_1to1_notifier_bound,
+};
+
+static int
+v4l2_async_nf_parse_fwnode_1to1(struct device *dev, struct v4l2_async_notifier *notifier)
+{
+	struct v4l2_subdev *sd = notifier->sd;
+	struct v4l2_subdev_1to1 *sd_1to1 = v4l2_sd_to_1to1_device(sd);
+	struct v4l2_fwnode_endpoint *vep = &sd_1to1->vep;
+	struct v4l2_async_connection *asd;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse endpoint\n");
+
+	if (!(BIT(vep->bus_type) & sd_1to1->remote_bustype_cap_mask))
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid bus type %d of endpoint\n",
+				     vep->bus_type);
+
+	notifier->ops = &v4l2_1to1_notifier_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd))
+		return dev_err_probe(dev, PTR_ERR(asd),
+				     "failed to add notifier\n");
+
+	return 0;
+}
+
+void media_async_subdev_1to1_cleanup(struct v4l2_subdev_1to1 *sd_1to1)
+{
+	struct v4l2_subdev *sd = &sd_1to1->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(sd->subdev_notifier);
+	v4l2_async_nf_cleanup(sd->subdev_notifier);
+
+	kfree(sd->subdev_notifier);
+}
+EXPORT_SYMBOL_GPL(media_async_subdev_1to1_cleanup);
+
+int __media_async_register_subdev_1to1(struct v4l2_subdev_1to1 *sd_1to1, struct module *module)
+{
+	struct media_pad *pads = sd_1to1->pads;
+	int ret;
+
+	pads[V4L2_SUBDEV_1TO1_PADS_SINK].flags = MEDIA_PAD_FL_SINK |
+					       MEDIA_PAD_FL_MUST_CONNECT;
+	pads[V4L2_SUBDEV_1TO1_PADS_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
+						 MEDIA_PAD_FL_MUST_CONNECT;
+
+	ret = media_entity_pads_init(&sd_1to1->sd.entity, V4L2_SUBDEV_1TO1_PADS_TOTAL, pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(&sd_1to1->sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = __v4l2_async_register_subdev_fwnode(&sd_1to1->sd,
+						  v4l2_async_nf_parse_fwnode_1to1,
+						  module);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(&sd_1to1->sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd_1to1->sd.entity);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(__media_async_register_subdev_1to1);
+
+MODULE_DESCRIPTION("V4L2 subdev 1to1 helper library");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Frank.Li@kernel.org");
diff --git a/include/media/v4l2-device-1to1.h b/include/media/v4l2-device-1to1.h
new file mode 100644
index 0000000000000..a1256767b4d4c
--- /dev/null
+++ b/include/media/v4l2-device-1to1.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __V4L2_SUBDEV_1TO1__
+#define __V4L2_SUBDEV_1TO1__
+
+#include <media/media-entity.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+enum v4l2_subdev_1to1_pads {
+	V4L2_SUBDEV_1TO1_PADS_SINK,
+	V4L2_SUBDEV_1TO1_PADS_SOURCE,
+	V4L2_SUBDEV_1TO1_PADS_TOTAL,
+};
+
+/**
+ * struct v4l2_subdev_1to1 - 1to1 sub-device
+ *
+ * @sd:         sub-device that registered the notifier, NULL otherwise
+ * @pads:	media pads(the first one is sink, the second one is source)
+ * @vep:	The V4L2 fwnode data structure for remote node.
+ * @remote_bustype_cap_mask:  Bit mask for required remote node v4l2_mbus_type.
+ */
+struct v4l2_subdev_1to1 {
+	struct v4l2_subdev sd;
+	struct media_pad pads[V4L2_SUBDEV_1TO1_PADS_TOTAL];
+	struct v4l2_fwnode_endpoint vep;
+	/* bit masks for enum v4l2_mbus_type*/
+	u32 remote_bustype_cap_mask;
+};
+
+static inline struct v4l2_subdev_1to1 *
+v4l2_sd_to_1to1_device(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct v4l2_subdev_1to1, sd);
+}
+
+/**
+ * media_async_register_subdev_1to1 - registers a 1to1 sub-device to the
+ *                                    asynchronous sub-device framework and
+ *                                    parse set up common 1to1 related
+ *                                    devices
+ *
+ * @sd_1to1: pointer to struct &v4l2_subdev_1to1
+ *
+ * This function is just like v4l2_async_register_subdev() with the exception
+ * that calling it will also parse firmware interfaces for remote references
+ * using v4l2_async_nf_parse_fwnode_sensor() and registers the
+ * async sub-devices.
+ *
+ * This function also init media_pads.
+ *
+ * The sub-device is similarly unregistered and cleanup by
+ * media_async_subdev_1to1_cleanup()
+ *
+ * While registered, the subdev module is marked as in-use.
+ *
+ * An error is returned if the module is no longer loaded on any attempts
+ * to register it.
+ */
+#define media_async_register_subdev_1to1(sd_1to1) \
+	__media_async_register_subdev_1to1(sd_1to1, THIS_MODULE)
+
+int __media_async_register_subdev_1to1(struct v4l2_subdev_1to1 *sd_1to1, struct module *module);
+
+/**
+ * media_async_subdev_1to1_cleanup - unregistered and cleanup subdev and media
+ *				     pads
+ * @sd_1to1: pointer to struct &v4l2_subdev_1to1
+ */
+void media_async_subdev_1to1_cleanup(struct v4l2_subdev_1to1 *sd_1to1);
+
+#endif

-- 
2.43.0


