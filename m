Return-Path: <linux-media+bounces-65141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPx3Nh/7MmoJ8QUAu9opvQ
	(envelope-from <linux-media+bounces-65141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB969C3E8
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 21:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=GZnE1otT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65141-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65141-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F19D314490A
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 19:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3D6F39FCC4;
	Wed, 17 Jun 2026 19:51:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A938F64E;
	Wed, 17 Jun 2026 19:50:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781725862; cv=fail; b=qdj+8ShNc/6A/UAsDSfgIanzrWhjItJhPsYhAEVGk8Vft8dNspi+ZC0qfh2SV7fS/KM1eT4cY4VSWWv+6RLPZdFx03rOnSYa89qFelbeX4BlIyQW2no8AUjPXc5sj6ohc7rYlG+9IIMm6F8yTqO6Fwi1lfoZq7pDDZRbGHGTBe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781725862; c=relaxed/simple;
	bh=y4GMb5y8CxA41uMa92l6JVk1FtEEBp6B8qKKuQ1knZk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jqFz4huLO1MgH+TECfsc6/6SnH5RLm/6+5JtCiqbnVRlNQRyXWrY2DL8W77YkU2RbztqG115yWK0zl920ru6UvvxVi5Zq2Xfm01CdnhRyjz8ydMMFAKNLiHlPA62IfHM/Wi0pfxR18X3ZQ9aKs+mXCTSdDkzCXh5MpEELevx4Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GZnE1otT; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5DUIIa+nrFb7ooNOj3o5IsMO5Mer23K7V3iNjVBJYjZUR6jeaxX50U3k6xUK9T5fk5y2kA4xP/GPjwIWIbVD5QckUX8ss0dF43ux7uf02WcFc+ppXJlHPP/cfkPxvYEQIHrZROxwHxuE8uzMETz8Fbrf2lHv0+AyGwDOgW3n9MxgLJ0JRb4A+5RY7YG3rRxw6HhN4uDUeyl8HC9pe3uyfGKl2WuZOk98UFS6phPtUVsde4M4ynyggvM7RGkH4iFpz+pT8eJGCqZA3aZBkB8+oJJioCZ6OWHEylRVbfjrYRPT16A3VeddgXpuTscggFaaFbRobQRG2xmWAuEE6Wg/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2a7Na0NdTELvh0Y5oNYDZoEeqElDxMFibMylvNm1Luc=;
 b=HQLZGZnAL+9QXcHquDaOYj3gA8mWbJSE3uZZtuaVDUE+dNoRdUjVclm8jY6ffJKuEZ4OrbgQTk+kfUX5ZcWf5r7vPU0H9SiZHDesLfjkpw2Ofjo1uCoRtIPkUZev58/YmZMvEjYiOBxzu1IaZ4VJrJ3qrYgBZywe2qrmFgdMOwE0u3GOHBT6EH1NmNO45w0u5Pp6k9HiCbq6Gu7ZYoxbwjJtWmS1qXu9NF6zTLxo87Bur8mVOot5TrJP3D1rqeH4nq1flj/iPqI6OsMlJZblrFjxKy+D0KXMwd63lEH5FHMPIKgwVOknRtmWHhRlDE0rJ7eBCDHehr7xoUg3X9LZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2a7Na0NdTELvh0Y5oNYDZoEeqElDxMFibMylvNm1Luc=;
 b=GZnE1otTdHOWFYT7lYsRUP9WL+vs0ed2iKki21b6x2ZVvRowD0KxgEPjqL7SercrsBMZEjPvCTDWldbfvvwxp6+oRGomSIQXWGYO2aZso0cG67ngYlTGb8ccdHB/yJD796I3Bblno7IeNjeIw7Gsz8mbpV5aCuwR5zjMBvZeoJTYZ9vvcsp6ABP8R2Lxg0msnz7jm/9wXh4nbFaPKFhFMf1TTCJbZKJ4j39hcyZ/gB1hGZBV/OLNm7vCS4aWrO4okhMvHjxcvH+Sk20EuQINjiSVeF8d9GO9Mw6z8Mg0TnuPz9/g3HtY74os1En3gKadMSwlToDxHkrXNM9nO7eYMQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8227.eurprd04.prod.outlook.com (2603:10a6:20b:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 19:50:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 19:50:43 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 17 Jun 2026 15:50:15 -0400
Subject: [PATCH v5 5/8] dt-bindings: media: add i.MX parallel CPI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-imx8qxp_pcam-v5-5-7fa6c8e7fba7@nxp.com>
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
 linux-arm-kernel@lists.infradead.org, Alice Yuan <alice.yuan@nxp.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781725817; l=5103;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=raQuC0b4aAxbAwxtnblv+OYKspRYjgaesOZFk2qi/3k=;
 b=TZSKcS/mk5TVjDBYqd35/Ywl4MtB76WJuIr/OmRPMiImT2klRwJYGflALLmCFKZ9IePBmxMCy
 ST/4wN4pyPLCFlV1B8SWBLhyuecNxZMKwgxynviK6gvSnE27vTwlF6C
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA0PR11CA0189.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 84406a1b-fb29-44a5-ebf0-08decca9b793
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|3023799007|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
 tzDSLnstAPf8msxzHU4t7H8WfD2yazfmqJG/KAX4zbRZmTvRhwNfYM77eZjFCs6ljwv5lEwDpt9lT4o00Mxai4Eut1NcEU3JJGhc9U1obdMGmoRMFBTSjTuNlxkUwjBdeNRJ1wACa+9kEWAd0CHeQR2aHoMhPD6RCuOh4MNoghjoK/H62licNSV4YacYfuzaWoO0LI6ChZDNj5v1/fLrK+aRns5jd8SzxmAnjKx5X+22JvblxkWWRPaj/GQhxr3NlNMMaGP/4UwW/Pr1z344B2M+9xJzxVHh7pnYBuuiU++97rlaJgZlg00okYnj4MWZgcbUay0GFwh3Ov3H0+mOWIqu9zlzERE8gYyi5MQ2Cbh4PEdJX/5gknxGfks60QF690imV1ZLKz/ycX65tAThDOSRUB6ub+/GdDr20fCnPSWFARSdrCRG9TYkLTJ/FNP8Tv8vAv+yBzGa6+u9gMG5tlB2JB4hmjtaDsObRMuOEGq9tMaCbS2a0RPefL2BpxjnE/sUTXypVrtUpTpprun5oBJAFMghQmXQFuEYvwCmJCeI9I9ZjOIEg9mMsscLoudlhPfU66TSsUbGq6dpr6ET+8FRbFHyAuOpxqFhsxrZYPQQuKkozKb9iZkEcTqp7l3ySHlLKVwWqyuYDWO93a2JyWE+VYqePRROyjzOGdaxWJoVcervvE/F7I5YqDt7wUmT
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dURqNlFNL1hxa3RoU0dwK3ZXZW1uTDh2QU9LaDhlTmlIbEM2SlJUVDc2U3l5?=
 =?utf-8?B?SEUvUnA2bnVjMzdocmJvaTRxbTBERnFvY2dqcm5Jb0hPZXVOTlEvOXhRRFBC?=
 =?utf-8?B?SXV6UkZUUmZ3WnhXekFJVDBxVHFObWxyNU1PalN5eHNXamlJTXN2cTk5elYz?=
 =?utf-8?B?dGd0Q1dVU2hkenF0bVZkM0hTOEZWTGkrYjM2NWdrTnBFSmJVWXFicWdmT2Fj?=
 =?utf-8?B?ZlZZUFJYUkVtOVRPWFZOSW9HdWQ3US9hc1hTa3VKM0g1UXZsSlJOVEtleTZi?=
 =?utf-8?B?THpQZVdwQkJwZlI3QjE0RlZoRDN2NXZ3cXYzcXZhYkRJMFE4ZTBtNTRiM3Fn?=
 =?utf-8?B?b0FHVHFZeXE2cUJOQmVOYnZnK3VRZm9iYmZ6V21vNTJmdSt6VDRWWlQxbVhD?=
 =?utf-8?B?cVE4cGhyVEJ1SERZL0g4WTVlMk1laURaejVPMEptZHZZcGRucmRpZXdubUY3?=
 =?utf-8?B?N094b0l0MFlWbm1HVDlCUXcvbHNybVUwK3NUTXQ0VTEvTitzUm5rNzh4TGR4?=
 =?utf-8?B?TlhuVTl4QmViVWpobkRvaW5mTFhBd2ppOXlPc04zVjdKbXRnZ0F3L09VOUpl?=
 =?utf-8?B?QTRuWGlDRVcxVkhtK2JxTTF2UTlMNXIwTDRtQ2VGcSt2bE9zclVyemN1d2o5?=
 =?utf-8?B?UHM1L0VXb2dxOWV2RXB5ckJpNStCRktyRTFZcVdxZVpSeHcwMlpqckJySlFE?=
 =?utf-8?B?YUJwODFlMW16dUhOanh4QWNGME5IUFJNT25UZXlJTjluV0c3b3R6RTd1aTll?=
 =?utf-8?B?M2x2U1hWeDFZUHdXOUIxK3JsaUZ6ZmtHSFJjVytXcVRVU1FHSHhmcmFUVkI2?=
 =?utf-8?B?dnRaeitUU3lISkNFeER6bmttSllvc2srK2hSRzBvRmhBWHRselVLcXNIREpq?=
 =?utf-8?B?dHp3bzNhQ1NZTTZFemw2YXRoVUxiSTNrWW1kYmNWcFRvZGlYQ2xCR0g3Skht?=
 =?utf-8?B?eUVoRUZTUm1nakRXRW13QU4wSkNET2psZ1dOWnM2SXNDcEVIa250Zmw1VCt6?=
 =?utf-8?B?OVZodnJsTXdoUnhYT0VBL2lrUXdpMzVPWnljSG5nckV3bE0wVGNKTnFiODkz?=
 =?utf-8?B?dzNpRnM3bW9LdmJrVUNId1VjQmJTUVZmQlppVVlKV0pHREVYRHJGR1dmWU1o?=
 =?utf-8?B?VWNMTitJdUV4UkJYT1NwNndrbmNVcS9WS3gwQ01UVTNOQlNQVk5KbTBoM3FB?=
 =?utf-8?B?T3U3Y0RhdVZnY21uc0R2NmpjMEsrcmE2dTBTRlVOWStGdUc1TFBjSHJwUmVa?=
 =?utf-8?B?cjk4bURNOXdCQnNScjlOQk5qY3F6UGhjV3FibEpVUksxRFlkaS9uaE1FNlBx?=
 =?utf-8?B?RXpvd0tNcnU2UzBOOGw2VmE3RC91Y21qSEZuanlTRGNCZy9XVUZYQW1PR3h0?=
 =?utf-8?B?N0xSVHFkK0xrNHFBM201SVVIbzI0YWNMTUgzLzNmeVdxUzdJUUlWRnNBTDlo?=
 =?utf-8?B?eVhFWHdDczdqSEZkY0EzOEEyb2VkbHhrWEJvWktzYm5NU0wrQ1FWMXBnMmhh?=
 =?utf-8?B?bXZXYzhkRkJzVFlhZFhxWk9ERDAza2lWZkdxU1BWZ1NEQUFneGhpVTEwSnVR?=
 =?utf-8?B?RTdqSDRRbFZ2QXVsY1ZzSmxlUHFsWVFza2dmRkkzSXBTak1kUDhkS2JlZk95?=
 =?utf-8?B?bmR2b2VkOGpSQkMvdTZNVHUwSUNCTjlVbVQxNlBnR2YzcDhHSENxVzNUSHpE?=
 =?utf-8?B?QXdyZVV3dGtWM3hqc3ZodUdTeVBtL1hTZlh5dmNsL2NyYStaM21qbmtVRXk3?=
 =?utf-8?B?dFdvVEJVRlNVYnRYTEl1VHd5eHZxL3VkZE9VUlBFckEwZzZyZy9KNWpyeVFD?=
 =?utf-8?B?QXpNNjJqV3haQXJCUkEvODJoYkt5M0JMbmZvV1dWbVFQWnVvTzM1TEo5ZDhy?=
 =?utf-8?B?SkR3ZzNSa3VHd1IwN2xwQ3FnY3VKUGx0UmpUZjRSLyt2ZjY0emFIY2d4RWUr?=
 =?utf-8?B?NFpqNjBRYU1wM2JjQWVORGtTVzcwVTJ4T0JTTUJxT1lPbFhnLzJUOGoyRmd4?=
 =?utf-8?B?QVlYZnVGTDlLTlJYVnluOEVoNjZNODhnK0VQOWR3SEVKcnd0NmU1TWpmMTMx?=
 =?utf-8?B?dEZFZ0QwOEx5VlVSR1plOGJxdFk2YlpSMHhBWTg1cUo4c2NMejFRcG1ML2lk?=
 =?utf-8?B?RWtRU09DQVRxWFVwbU9aK0hpZ0x5MDZQdURwYitvblVGRHgxQWJsMjJxWTRH?=
 =?utf-8?B?TFV2NkNNWnVMOUVnSC9iL0N1bStvVE1FM1RGZmhQUU51R2cwWlo5ZDE0OFlF?=
 =?utf-8?B?SnEyOXZmRy9oZWlrSEFxWU9EQkx1Rnc1aDloQUVwWGlWNW9XM2J3aFQ0VjJz?=
 =?utf-8?B?TmhSZTJ6ZGN2ZmVGNjBUcys2Yk9Yc2VMelVPUkE4SVZ0T0ZXR0xBcUU0QnpN?=
 =?utf-8?Q?euZILC0Y8Y5YQS6GTqfhlAv/mM+acPn5s7s5g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84406a1b-fb29-44a5-ebf0-08decca9b793
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 19:50:43.7124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeBAKgb6FnniOKBjKnCNnQaT3OMby+kVLp5738D59fbC2wTTv0TXbjdOhXQN1wZhq84ISSjksOSpTyPgQf71f/LiPri+p+wmHz+griirQj9O5Yk3T7wHPq2lWp2xWd7/
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
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:alice.yuan@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65141-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email,devicetree.org:url,ideasonboard.com:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AFB969C3E8

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagnes in v4
- add Laurent Pinchart's review by tag
- fix $ref: /schemas/graph.yaml#/$defs/port-base, original is
$ref: /schemas/graph.yaml#/properties/port-base

Change in v3:
- use enum at compatible string
- add ref to video-interfaces.yaml#
- use cpi as node name in examples.
- replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
in commit message.

Change in v2:
- use pcif surfix as Laurent Pinchart's suggest.
- put power-domains into required list
---
 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
new file mode 100644
index 0000000000000..9dd0331f6ef75
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx8qxp-pcif
+          - fsl,imx93-pcif
+      - items:
+          - enum:
+              - fsl,imx91-pcif
+          - const: fsl,imx93-pcif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    cpi@4ac10070 {
+        compatible = "fsl,imx93-pcif";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 825e7cd2d6739..deeec900ad071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16258,6 +16258,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.43.0


