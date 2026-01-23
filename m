Return-Path: <linux-media+bounces-51413-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNrGEutCc2mWtwAAu9opvQ
	(envelope-from <linux-media+bounces-51413-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:44:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 974447393B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 10:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73CB03045031
	for <lists+linux-media@lfdr.de>; Fri, 23 Jan 2026 09:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD2F371068;
	Fri, 23 Jan 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vB0q2N7M"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D4366058;
	Fri, 23 Jan 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160995; cv=fail; b=QgYcl2fkX8zshD8CYRKFbS5WJf3bycknsKow3aREdwbtXcgPnHgyNxS/gpgI7m/VI3pxZ+xbhifBDBFzUcgDJD1AXYqZOGgiqgmd0ONEws3pF0DOLYHxGRAO3FUFwa1BxegzjsOHdI67oSLlYChm/90f2VWCLvN93QfA2umvWBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160995; c=relaxed/simple;
	bh=5qTD38pJX/x9/XabpoR284Z1+zUs8Gjt7IbDZbcEBE8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hyAJS4rvHhrehFhoFJ6VClYbsCQnOb44liPWZWyF//Kqfdke3obzLsdpyKv7fsxKm4At6VmbGUa+PH7LPtsaHNDHur3e8uVQGCacqI5X8iDbTUIf/7JjcQQTWMKr4dfX+v+go3ugsSWzLi5lUVI/nF7NIohU2/WauhU134cc5+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vB0q2N7M; arc=fail smtp.client-ip=52.101.69.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIYiBkel78B8PP0tzNq1zOU7Qm205/xOsqHfFWATuhrhprKANSAkzE2JeyU6D5InwlpHeeu1DRnpF40FRZByLDr5KvtVe9MPM9JTzZ5ZaqhQqxdsUUQ7Dbn1zRFoH2mrxxf7IEtgRuPFEt48uLmpoCR//DGcTAp+7/r7mN9O459hqPUTPUQZ+QAt4YzTKI/Y72c0RS5azhBaNWRbJJl9A8w4+zz+dDiE4w+/C8ANAkZm4IBmgdzCRg7py+haazpP+po7z9UYJhBrluGDpBQCHaRVPHAT8dyJMRMO8afND+8DAKLjnZxl8lD+mYNhZ4Tka2bAJQgRx6BCSzFOgLvVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ncoUJUqNnEX/QtGJ5Ml/kLf86SggJnss8Z0g9iF8QQ=;
 b=yRYtgU8cd0I0kk/ei/y7eXuiPpz4yOkC0Gw1JmnSM4O5nZM3LlAHp2QQ7t0dhTzSOYRY2T4IkQmyPtpyEzeZXI3pX0fYNQUIFjNrlIO9xMRgdW6VwypKOLyLtsMT9B3JHY36cknTMRB3uMIgiIta/P9k6XErPAqBE/AS1X7+8ujdF/BQCv/Pg+c3OroHm32/icKCQ/tZRGNUr3ptTZQA3+t973ATXNX80ALqg2N+MUCLdCGUSgAst8INp+2zy8YSpuC6GF4Pl9ZMcxUyqXJB5l91UG2yJfx3IUMUfjLDvuXsJhaJ2CRe9stWz3z2oNr4enlcq4PZ9bET8A2TntKm2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ncoUJUqNnEX/QtGJ5Ml/kLf86SggJnss8Z0g9iF8QQ=;
 b=vB0q2N7MrYmKZULjtfuYyzTLqVKAPOAqJVLLUiz5O6W5FZRRgS1iv8W7kMVkCyfcEEKMVj7IQu9Jy4FvFXWLQKnKi2TSgxgbWMd7y8f6JaPtf4MSBDApE0o6M/55UkY8TY3WL6UcFOUeucjJnjVY6lN7UuZ6ED8fcIkCEHJ0nX8xZnU1YhFHtt7w25NkUe153dFEQm4xE3+7Oh3H1TFoa5s5TRxxE+Dn98nH8so5bc3GI9gR3WQM+D3RvXrzx6qxIXAWFDngkeOYcdWL6udsvlrf4JlaZ0yITaS/0uR2YQKzfqo8pFU0rirPNxn/HkQdkKAeBpIUO+sKmDIg2nV6qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:36:17 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:36:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 23 Jan 2026 17:35:18 +0800
Subject: [PATCH v5 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2
 driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-csi_formatter-v5-2-d5b803f867bf@nxp.com>
References: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
In-Reply-To: <20260123-csi_formatter-v5-0-d5b803f867bf@nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769160965; l=27936;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=M8Q9ybSqqpvmcdU+CyYMtYUbIv+PLrsg1eguPS9YTFQ=;
 b=K4hdDNdHExcIyOLbjX8vDv65bMVicnhz9m6WuxN57zn3LerB/EmRBUH16Vj8j1i3m+S2br2Mn
 CKm6vzFwwZbAjvXIoXvn3zvHUHui5zV3IwF8hhh+CSXvTm7kcaxC77c
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb28595-85ce-423c-597f-08de5a62db69
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|7416014|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S3VTSnJrWlZGVWhxYUlPc2xBalJZOTBsUG1USUtYLzVCRGVtSWVGU2w4Rkkz?=
 =?utf-8?B?eVJQNEdXTkdSVUtxWFhpbmZHL0RIL2MwSE0xNEw5Wlh4UzdHRXFpNlhGVG1M?=
 =?utf-8?B?QSsyY0JpdEprRWFZdlFDNXc5SG9Fa1M4MXlyWDJTT01wY1NUUU4vNU1pK0Fr?=
 =?utf-8?B?NTlPblVzN0Mza0JkWW5Wb0VnaktNckkyY3RxekJqQVQ3RHI2U2Q5MTNhRExs?=
 =?utf-8?B?ZVRuSmFHbjRIcnJicm1iejQwYmVZL2cvSnpKWUlnNU9DNGt4aTBlQ0d6Tm4z?=
 =?utf-8?B?c3hYT0FuRWNyL29VOEFuNXdOSDl2YlJvRXhKZ2pXWFI4TnpIMHUzN2l4QkZy?=
 =?utf-8?B?cUtKZjFEeVhlczN3RXl6RXdhZlFibHJYK3hzZmNEeVVvMVIvdExBUjhVU29P?=
 =?utf-8?B?VXVqbkdMTk91Ymd2WHdGMWlOb1l1Z1g0SjdpdFFIczd1ZFE3U3RhY0tjTlJx?=
 =?utf-8?B?YzVCdC9RYnJLclAyTzlOU1dOQVRQdGRCUVNwaVp2eXVsclR0UzVGM0RndnRj?=
 =?utf-8?B?RVF0ZDVaMDNBVnkxTjk2d1NkVitGR0NNc0dMMGptRG9jMmY2WC9BYkRha2x0?=
 =?utf-8?B?VVRaNHMzMEk0NktNT3Z0cVBDRVkwNVhHNHd5dEc4cTBzUEZPSzRBV2FYWHps?=
 =?utf-8?B?U0hZbTdyUFl4a0Nyc0FDQU5RbWV4WHV3dGlrRFJhaWF3d1YvSW9RMklmMDZw?=
 =?utf-8?B?bk5mNlZmeHNTVy83cmdiZEIxck41d2VYbTVoMThPS2txOXBYdWZpUThIZG9a?=
 =?utf-8?B?VnpSU01DeGFhZENYZzEyeWNmMTEzRnZtTW1Yck12dE5Ib2hITlBnZEtkV1JE?=
 =?utf-8?B?TXZBa3hpOUp1bGh5a0FSTUdXcWkvU0VIcDRTbkwzYjJKMjVERTd3L0JkVTBl?=
 =?utf-8?B?NmhkelZuVERaTnJuZ1JXU1QvMjJ0SVdzbU5LTkhSNUxwUHkrcnJIV2FZOEc4?=
 =?utf-8?B?UERaUEJ3MXREQndiY2tNYzZ5Mjd4aDJQRWo5d05qNlJaWU9JWHE2Q0dDeVZ0?=
 =?utf-8?B?M1hEZzN2dkNmNFU4VXRZQkI3R3FxUGNhTUc1cTBTQ0orYnVyN053dDI5eVdJ?=
 =?utf-8?B?RC9ZbWx1Tk8vcWh0b3NrNXZqWWJVTzVrUHJ0dkhnbXZrVmRlOFJ5TVo0TVR5?=
 =?utf-8?B?WDFqN1JZdEQwOUdNMVFpSXVRU2d2Zzhqc05SNGYwWncrakk5M1AyckJnQXB2?=
 =?utf-8?B?djFtVUM5R2cycTlzMklFUXFrNmJhLzlEaTFBdFlWblBTajhjTGgxZkZrV3NL?=
 =?utf-8?B?M2pzS3FPSUhJUzBSSCtoQ3dNVHNCN3NvdXFkU2tsRFlCNkVKaHp5VFBBd1pN?=
 =?utf-8?B?amZSdHhNZk9nNi9oaWZhRHVkS1VOWUIzZGt0QmJ2NXYwUGRzQ3h2b1djUTk4?=
 =?utf-8?B?Z3Nqd3RvNUpNZ243eGl3ZkZ1MkVBMElIZk1tTjl2Y1VWTkNSSEV6U1dNQVVz?=
 =?utf-8?B?cW1xQzVGb0pQQmZBQUdmNTJuaDBEV3VjT2hBclN6QVZxTUtQYzJvR2FxYmRM?=
 =?utf-8?B?akRrRUpQbG5iYVZQWTV6U2dHMWNKLzNVSFJwanlieHhJYmFTTnA1V0tYY3BW?=
 =?utf-8?B?RHorT3JvZHpWdmxHYkpvOTRZQ3pXbDVQdHdmQWVYMEJ0cGZVV0FicWVqZG4x?=
 =?utf-8?B?TWZKM0VUbEpzVzcrK0pUakVrekVIcWRBMjQzVVNkdWJmc2hkblk1N0ZrbFZU?=
 =?utf-8?B?Y29qMisza3dpWCt6Q1RBUFRwcUE2UjNtS3RQQkVnanZjbDhZK3V0aWhrdzZK?=
 =?utf-8?B?UHExK2dESnp0NmpaSEVQMVl4REJzT2J3czA0dVM3aTFZdFUvK2VLWjNjajRv?=
 =?utf-8?B?WjlxajJ0M2Z3elU1dlB5KzNpVkRSY1QwSllvdHZWZGY5TE82K20waTZFZ0lN?=
 =?utf-8?B?TzNFRk5BL2JMS3U2YmlFbXFXSitZK1VuVE1McHBxbUM2N2FoWEZFTkdCWGdz?=
 =?utf-8?B?VGt4ekx5d2FTanNnYmhaNjVDcE1ZUFk2aHFsOUFnZWFkd0ZPSkNUQWpCTW1U?=
 =?utf-8?B?Lyt6M2FqVzlmaDdTR2xyQ2xhdTV1WlZNTnhocUllQzJIdUFxclpOZUk4NW1w?=
 =?utf-8?B?NXJVNjB2Q01kczI4S3lxZXdBRzIwSDMrWVNyWGZBTkU0YnNlUzVESWE1RDhi?=
 =?utf-8?B?ZkdMM0xKeWRmc1ZVYWo3L3FkNFNvUjdEbVlpZjJ5LzdLdEIzNmgzcXkzVjdM?=
 =?utf-8?Q?dMXkV1Vd+yNL6QlTn2WBDHrTvxGHfLSC1SvJwCWephHD?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(7416014)(921020)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YXhmS0hmd3pjOEVXTHhicEU2VE9VcGI4QWRXa3c3VlN5bHUwTXZFV0JhbHJu?=
 =?utf-8?B?Nm5ranhvb1g5WlVQck54ajVwWHEzdkZzLzJpNG0wQWtOc09GZ2ltN3FPWVVp?=
 =?utf-8?B?WVVVdjY0TW1NSjllZE1oWGlreGFkalNwR1NSeEJpWjJSZXB0R044YngwVndM?=
 =?utf-8?B?M1BGQllDUjduWWoxMGlKT29HMGtia2JsL092SXBBK2VWM1hXZ2hUekhIOHdK?=
 =?utf-8?B?Y3NaQWZyRGZCZEtZT2RvdlA5VWZLK2VhbFdMeE8rVW82aHNxL2pZTkxmRzgw?=
 =?utf-8?B?M25pSFp2dTZxUFU4UlJOT2ZZTjdsSkpRbWcrTWpDdXAxSVc4clNXUmQ2RE11?=
 =?utf-8?B?TWFjd3laVDRneng4RFlhUG1sZWh3QWM0VURBQlhjQ0Jwd1l2a3dVQ3A0OFAx?=
 =?utf-8?B?N3BHUk5leW1rcHg3NnkwcE9XOVk1MEt5OFE1Q0tobmlZeTRTK3ppWllwZXVa?=
 =?utf-8?B?Z0s3WFBjR1V1Zjk0Y0tYTlNVSkY3d1VneHlBaXppTzVET3BkQS84ZjlhajV0?=
 =?utf-8?B?M0pjWVU2ZW5STlN3bjBvZWhFcG9BYXpiK0RKZ0VJWjAzWitmLzliNzNUZElH?=
 =?utf-8?B?dU1MQmF5Skcyby9EM05Xd3VlSzF5SW5sb3J3L1J3QXdxNDhqT0U1bEFDZWZR?=
 =?utf-8?B?eC9yVkJ2alF6SVJXSkR0WVB0Z0Z0SU4wMThPeTJ2ZDNmWlpxb0JjN3FRNmFv?=
 =?utf-8?B?SDVhTXREYjRJK0QxT3dEbzlNUGQxUFJ3emlpckVaTUEvMGZ2bUZpM0NZOExo?=
 =?utf-8?B?SUZLSVdpS0N6OGlsU2IvQUFkZXBTdHBoNS9ocG5CRXNPTG1DcUhJWWFGeE1X?=
 =?utf-8?B?YU9tMU0zdEVXV0JJaDNxajkyeCt4ai9nL0p4cnBHVG4xdUtZU3ZaUWVwMGtz?=
 =?utf-8?B?bjFCcWt0ZGpTUTkreDVKcGRweXRHMWpObzJkNXN6cXMvdENZWnk1d0FYcW8x?=
 =?utf-8?B?Rm01OEZEemJlT3dvRVdzK0F6ZUY0aTA5Z1BIWEc5RGZRb1ZkWitLNlAxVEM0?=
 =?utf-8?B?dVpQS29ySDlUY2hxeFNwczRNVDNRZmd6VHp6YjJKRm9tZllsMHcxT2xmcDho?=
 =?utf-8?B?M2RjdldvK0hhc0ZqMTNZaEo2dGYyUG5rRFJvYkozM1RaNytEMjNvR3BiUEVL?=
 =?utf-8?B?RG5xTkhLRE1MVldvcGQrWW1BYzExNVlHTDVuL20reFJxWThlV3RJSjYyT2sz?=
 =?utf-8?B?bk1IV1E1T0t6dTlvNWNvUXM4WDUvME9oNEJkMllWMmwzNHR6QllMeEkzM3Zr?=
 =?utf-8?B?K0tHM3AxazdWbVBIMm1MTnhJRmNuTHpuUngrbUdlblZIS3ZmS3dkbGpJRHRi?=
 =?utf-8?B?NkRZU01YajJlZERUUlZmL0YwM1hQZlVCaUZ5VlYxdkNWb2tEeElPYWFTU3Aw?=
 =?utf-8?B?cHFXekJSeTJYOWIycW13RzRNMzk2ZnA3cUJqUkN2NHlOeWowMUdqY29vM1E3?=
 =?utf-8?B?TTdmdXZnSkVjV0JZbGdvRGN0Z0JucmkzY09NZkRsM2ovZUExcHBtYlkyejhW?=
 =?utf-8?B?ZC94WGw2ZFVzZUZ4VytpN2M5WTM3MklmWFVaNUtaaDBMaHVVZWpqdjc5UVBz?=
 =?utf-8?B?US81M0UvaHFLT2JQZktoQ0FrQ0JGWml4eFlqdDJMTGxmalg3eEQ4OVhMM2Qr?=
 =?utf-8?B?aDJDSEJHMnpobHNaSDJDMGNxK015N1dnWFRPTDBOVUI4QnZYQ1htZTRMcnhw?=
 =?utf-8?B?ZFlqekJMSXBGRlNUczVTdERmZ1hSa3pjSWRzRmRjUWMwTW5CSzhxcHVHMTc5?=
 =?utf-8?B?YWZLcFdtRUZBeGE0b0g3VEIvb2c0cFJEdjBjQU8rOGZBKzVETDBRYVc1N0FM?=
 =?utf-8?B?a0JWUThJc2xOYXBLbTVnVFliUWdZcEoweTk4WGZvOXRuZVdiSmgyc3BIN25p?=
 =?utf-8?B?K1JnUHI5MDBLN3d6bE92S0V2c2pMUVc4YzBJSWRPZEZYN2JHZ1d6djhkbUN5?=
 =?utf-8?B?ekpob3RVZWZ0eXBxYXNIN1dKUmVFeHJmTkN0MEQxV0NaTjFGYWE0NEFFbStk?=
 =?utf-8?B?eEJBYmtENW4xbnFNMXpyR3d3THNRYmt3VnlOZEZWcGZ1MUliYVBNeDVFUmNj?=
 =?utf-8?B?NjMybkUzNEJZaTJkSFh0ckR3REtDU2tCM01XS0plbFdNMEZYaFpvakw4aXJu?=
 =?utf-8?B?MHA3WDM2ZUovMUdTYWJ5VzBOTFl0NWdPOVRkcXhmdTM4K0pHOThxUk9PcGlx?=
 =?utf-8?B?YXdJNms5dnkycElhUjlXNU9FUis5ODY1Q3RUTW1nSVNaV0h4Y3ZYSVhadWZR?=
 =?utf-8?B?SDZrTE9zTktHSW9ILzlMSlVWWDE3cFlJQ2xOdkVJN0RGdlp2bDVKNzRkSWhr?=
 =?utf-8?B?a0RGSSs5anRjMlpKMlFqREZEL29jUmZqZUtzWEtkaGNkQmdMbnhhdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb28595-85ce-423c-597f-08de5a62db69
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:36:16.9339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yot+ff0MkYzD/0CNAXdzXvOkT4uhh9Yu8ncUoKX4KdGP6wZZDskKkpVehiDciJ4gYnNxVEtTzBFBGZRRv/8X7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51413-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url,linux.dev:email]
X-Rspamd-Queue-Id: 974447393B
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI pixel formatter is a module found on i.MX95 used to reformat
packet info, pixel and non-pixel data from CSI-2 host controller to
match Pixel Link(PL) definition.

Add data formatting support.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 MAINTAINERS                                     |   8 +
 drivers/media/platform/nxp/Kconfig              |  14 +
 drivers/media/platform/nxp/Makefile             |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c | 861 ++++++++++++++++++++++++
 4 files changed, 884 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5560da0deb716c247c9bf8f245e7bbeb9b69e788..c2c80148e8b225768d32e3069cc4a70115ae21ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18867,6 +18867,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
 F:	drivers/media/platform/nxp/imx-jpeg
 
+NXP i.MX 9 CSI PIXEL FORMATTER V4L2 DRIVER
+M:	Guoniu Zhou <guoniu.zhou@nxp.com>
+L:	imx@lists.linux.dev
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx9-csi-formatter.yaml
+F:	drivers/media/platform/nxp/imx9-csi-formatter.c
+
 NXP i.MX CLOCK DRIVERS
 M:	Abel Vesa <abelvesa@kernel.org>
 R:	Peng Fan <peng.fan@nxp.com>
diff --git a/drivers/media/platform/nxp/Kconfig b/drivers/media/platform/nxp/Kconfig
index 40e3436669e213fdc5da70821dc0b420e1821f4f..a7bb62a2b0249659ffdfeac50fa488aee9590a87 100644
--- a/drivers/media/platform/nxp/Kconfig
+++ b/drivers/media/platform/nxp/Kconfig
@@ -28,6 +28,20 @@ config VIDEO_IMX8MQ_MIPI_CSI2
 	  Video4Linux2 driver for the MIPI CSI-2 receiver found on the i.MX8MQ
 	  SoC.
 
+config VIDEO_IMX9_CSI_FORMATTER
+	tristate "NXP i.MX9 CSI Pixel Formatter driver"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on VIDEO_DEV
+	select MEDIA_CONTROLLER
+	select V4L2_FWNODE
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This driver provides support for the CSI Pixel Formatter found on
+	  i.MX9 series SoC. This module unpacks the pixels received by the
+	  formatter and reformats them to meet the pixel link format requirement.
+
+	  Say Y here to enable CSI Pixel Formater module for i.MX9 SoC.
+
 config VIDEO_IMX_MIPI_CSIS
 	tristate "NXP MIPI CSI-2 CSIS receiver found on i.MX7 and i.MX8 models"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/media/platform/nxp/Makefile b/drivers/media/platform/nxp/Makefile
index 4d90eb71365259ebdda84ea58483e1c4131d3ac7..39ba5660ba923141e7637b01b5b34a021dad7bb3 100644
--- a/drivers/media/platform/nxp/Makefile
+++ b/drivers/media/platform/nxp/Makefile
@@ -6,6 +6,7 @@ obj-y += imx8-isi/
 
 obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
 obj-$(CONFIG_VIDEO_IMX8MQ_MIPI_CSI2) += imx8mq-mipi-csi2.o
+obj-$(CONFIG_VIDEO_IMX9_CSI_FORMATTER) += imx9-csi-formatter.o
 obj-$(CONFIG_VIDEO_IMX_MIPI_CSIS) += imx-mipi-csis.o
 obj-$(CONFIG_VIDEO_IMX_PXP) += imx-pxp.o
 obj-$(CONFIG_VIDEO_MX2_EMMAPRP) += mx2_emmaprp.o
diff --git a/drivers/media/platform/nxp/imx9-csi-formatter.c b/drivers/media/platform/nxp/imx9-csi-formatter.c
new file mode 100644
index 0000000000000000000000000000000000000000..8a91e88d6eed639159a5672623a3292beca4c675
--- /dev/null
+++ b/drivers/media/platform/nxp/imx9-csi-formatter.c
@@ -0,0 +1,861 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
+/* CSI Pixel Formatter registers map */
+
+#define CSI_VCx_INTERLACED_LINE_CNT(x)		(0x00 + (x) * 0x04)
+#define INTERLACED_ODD_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(13, 0), (x))
+#define INTERLACED_EVEN_LINE_CNT_SET(x)		FIELD_PREP(GENMASK(29, 16), (x))
+
+#define CSI_VC_INTERLACED_CTRL			0x20
+
+#define CSI_VC_INTERLACED_ERR			0x24
+#define CSI_VC_ERR_MASK				GENMASK(7, 0)
+#define CSI_VC_ERR(vc)				BIT((vc))
+
+#define CSI_VC_YUV420_FIRST_LINE_EVEN		0x28
+#define YUV420_FIRST_LINE_EVEN(vc)		BIT((vc))
+
+#define CSI_RAW32_CTRL				0x30
+#define CSI_VCX_RAW32_MODE(vc)			BIT((vc))
+#define CSI_VCX_RAW32_SWAP_MODE(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_CTRL			0x34
+#define CSI_VCx_STREAM_FENCING(vc)		BIT((vc))
+#define CSI_VCx_STREAM_FENCING_RST(vc)		BIT((vc) + 8)
+
+#define STREAM_FENCING_STS			0x38
+#define STREAM_FENCING_STS_MASK			GENMASK(7, 0)
+
+#define CSI_VCX_NON_PIXEL_DATA_TYPE(vc)		(0x40 + (vc) * 0x04)
+
+#define CSI_VCX_PIXEL_DATA_CTRL(vc)		(0x60 + (vc) * 0x04)
+#define NEW_VC(x)				FIELD_PREP(GENMASK(3, 1), x)
+#define REROUTE_VC_ENABLE			BIT(0)
+
+#define CSI_VCx_ROUTE_PIXEL_DATA_TYPE(vc)	(0x80 + (vc) * 0x04)
+
+#define CSI_VCx_NON_PIXEL_DATA_CTRL(vc)		(0xa0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE(vc)		(0xc0 + (vc) * 0x04)
+
+#define CSI_VCx_PIXEL_DATA_TYPE_ERR(vc)		(0xe0 + (vc) * 0x04)
+
+#define CSI_FORMATTER_PAD_SINK			0
+#define CSI_FORMATTER_PAD_SOURCE		1
+#define CSI_FORMATTER_PAD_NUM			2
+
+#define CSI_FORMATTER_VC_MAX			8
+
+struct formatter_pix_format {
+	u32 code;
+	u32 data_type;
+};
+
+struct csi_formatter {
+	struct device *dev;
+	struct regmap *regs;
+	struct clk *clk;
+
+	struct v4l2_subdev sd;
+	struct v4l2_subdev *csi_sd;
+	struct v4l2_async_notifier notifier;
+	struct v4l2_mbus_framefmt format[CSI_FORMATTER_PAD_NUM];
+	struct media_pad pads[CSI_FORMATTER_PAD_NUM];
+	const struct formatter_pix_format *fmt;
+
+	u16 remote_pad;
+	u32 reg_offset;
+	u64 enabled_streams;
+};
+
+struct dt_index {
+	u8 dtype;
+	u8 index;
+};
+
+/*
+ * The index should correspond to the bit index define in register
+ * which enable the data type of pixel data transported by Formatter.
+ */
+static const struct dt_index formatter_dt_to_index_map[] = {
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B,        .index = 0 },
+	{ .dtype = MIPI_CSI2_DT_YUV420_8B_LEGACY, .index = 2 },
+	{ .dtype = MIPI_CSI2_DT_YUV422_8B,        .index = 6 },
+	{ .dtype = MIPI_CSI2_DT_RGB444,		  .index = 8 },
+	{ .dtype = MIPI_CSI2_DT_RGB555,           .index = 9 },
+	{ .dtype = MIPI_CSI2_DT_RGB565,           .index = 10 },
+	{ .dtype = MIPI_CSI2_DT_RGB666,           .index = 11 },
+	{ .dtype = MIPI_CSI2_DT_RGB888,           .index = 12 },
+	{ .dtype = MIPI_CSI2_DT_RAW6,             .index = 16 },
+	{ .dtype = MIPI_CSI2_DT_RAW7,             .index = 17 },
+	{ .dtype = MIPI_CSI2_DT_RAW8,             .index = 18 },
+	{ .dtype = MIPI_CSI2_DT_RAW10,            .index = 19 },
+	{ .dtype = MIPI_CSI2_DT_RAW12,            .index = 20 },
+	{ .dtype = MIPI_CSI2_DT_RAW14,            .index = 21 },
+	{ .dtype = MIPI_CSI2_DT_RAW16,            .index = 22 },
+};
+
+static const struct formatter_pix_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DT_RGB565,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+	},
+	/* RAW (Bayer and greyscale) formats. */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
+	}, {
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}, {
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.data_type = MIPI_CSI2_DT_RAW16,
+	}
+};
+
+static const struct v4l2_mbus_framefmt formatter_default_fmt = {
+	.code = MEDIA_BUS_FMT_UYVY8_1X16,
+	.width = 1920U,
+	.height = 1080U,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SMPTE170M,
+	.xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(V4L2_COLORSPACE_SMPTE170M),
+	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+};
+
+static const struct formatter_pix_format *find_csi_format(u32 code)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(formats); i++)
+		if (code == formats[i].code)
+			return &formats[i];
+
+	return &formats[0];
+}
+
+/* -----------------------------------------------------------------------------
+ * V4L2 subdev operations
+ */
+
+static inline struct csi_formatter *sd_to_formatter(struct v4l2_subdev *sdev)
+{
+	return container_of(sdev, struct csi_formatter, sd);
+}
+
+static int __formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					  struct v4l2_subdev_state *state,
+					  struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+						&formatter_default_fmt);
+}
+
+static int formatter_subdev_init_state(struct v4l2_subdev *sd,
+				       struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI_FORMATTER_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI_FORMATTER_PAD_SOURCE,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return __formatter_subdev_set_routing(sd, sd_state, &routing);
+}
+
+static int formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *sd_state,
+					   struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
+		struct v4l2_mbus_framefmt *fmt;
+
+		if (code->index > 0)
+			return -EINVAL;
+
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
+						   code->stream);
+		code->code = fmt->code;
+		return 0;
+	}
+
+	if (code->index >= ARRAY_SIZE(formats))
+		return -EINVAL;
+
+	code->code = formats[code->index].code;
+
+	return 0;
+}
+
+static int formatter_subdev_set_fmt(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_format *sdformat)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct formatter_pix_format const *format;
+	struct v4l2_mbus_framefmt *fmt;
+
+	if (sdformat->pad == CSI_FORMATTER_PAD_SOURCE)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
+	/*
+	 * Validate the media bus code and clamp and align the size.
+	 *
+	 * The total number of bits per line must be a multiple of 8. We thus
+	 * need to align the width for formats that are not multiples of 8
+	 * bits.
+	 */
+	format = find_csi_format(sdformat->format.code);
+
+	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
+			      &sdformat->format.height, 1, 0xffff, 0, 0);
+
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
+					   sdformat->stream);
+	*fmt = sdformat->format;
+
+	/* Set default code if user set an invalid value */
+	fmt->code = format->code;
+
+	/* Propagate the format from sink stream to source stream */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
+							   sdformat->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = sdformat->format;
+
+	/* Store the CSIS format descriptor for active formats. */
+	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
+		formatter->fmt = format;
+
+	return 0;
+}
+
+static int formatter_subdev_get_frame_desc(struct v4l2_subdev *sd,
+					   unsigned int pad,
+					   struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct v4l2_mbus_frame_desc csi_fd;
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	if (pad != CSI_FORMATTER_PAD_SOURCE)
+		return -EINVAL;
+
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &csi_fd);
+	if (ret)
+		return ret;
+
+	if (csi_fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(formatter->dev,
+			"Frame descriptor does not describe CSI-2 link\n");
+		return -EINVAL;
+	}
+
+	memset(fd, 0, sizeof(*fd));
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < csi_fd.num_entries; ++i) {
+			if (csi_fd.entry[i].stream == route->sink_stream) {
+				entry = &csi_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!entry) {
+			dev_err(formatter->dev,
+				"Failed to find stream from source frames desc\n");
+			ret = -EPIPE;
+			break;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = entry->flags;
+		fd->entry[fd->num_entries].length = entry->length;
+		fd->entry[fd->num_entries].pixelcode = entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc = entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt = entry->bus.csi2.dt;
+
+		fd->num_entries++;
+	}
+
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static int formatter_subdev_set_routing(struct v4l2_subdev *sd,
+					struct v4l2_subdev_state *state,
+					enum v4l2_subdev_format_whence which,
+					struct v4l2_subdev_krouting *routing)
+{
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE &&
+	    media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	return __formatter_subdev_set_routing(sd, state, routing);
+}
+
+static inline void formatter_write(struct csi_formatter *formatter,
+				   unsigned int reg, unsigned int value)
+{
+	u32 offset = formatter->reg_offset;
+
+	regmap_write(formatter->regs, reg + offset, value);
+}
+
+static u8 get_index_by_dt(u8 data_type)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(formatter_dt_to_index_map); ++i)
+		if (data_type == formatter_dt_to_index_map[i].dtype)
+			break;
+
+	if (i == ARRAY_SIZE(formatter_dt_to_index_map))
+		return formatter_dt_to_index_map[0].index;
+
+	return formatter_dt_to_index_map[i].index;
+}
+
+static int get_vc(struct csi_formatter *formatter, unsigned int stream)
+{
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int ret;
+
+	/*
+	 * Return virtual channel 0 as default value when remote subdev
+	 * don't implement .get_frame_desc subdev callback
+	 */
+	ret = v4l2_subdev_call(formatter->csi_sd, pad, get_frame_desc,
+			       formatter->remote_pad, &source_fd);
+	if (ret < 0)
+		return (ret == -ENOIOCTLCMD) ? 0 : ret;
+
+	for (i = 0; i < source_fd.num_entries; ++i) {
+		if (source_fd.entry[i].stream == stream) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(formatter->dev,
+			"Can't find valid frame desc corresponding to stream %d\n", stream);
+		return -EPIPE;
+	}
+
+	return entry->bus.csi2.vc;
+}
+
+static int csi_formatter_start_stream(struct csi_formatter *formatter,
+				      u64 stream_mask)
+{
+	const struct formatter_pix_format *fmt = formatter->fmt;
+	unsigned int i;
+	u32 val;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	val = BIT(get_index_by_dt(fmt->data_type));
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), val);
+
+	return 0;
+}
+
+static int csi_formatter_stop_stream(struct csi_formatter *formatter,
+				     u64 stream_mask)
+{
+	unsigned int i;
+	int vc;
+
+	for (i = 0; i < V4L2_FRAME_DESC_ENTRY_MAX; ++i) {
+		if (stream_mask & BIT(i))
+			break;
+	}
+
+	if (i == V4L2_FRAME_DESC_ENTRY_MAX) {
+		dev_err(formatter->dev, "Stream ID out of range\n");
+		return -EINVAL;
+	}
+
+	vc = get_vc(formatter, i);
+
+	if (vc < 0 || vc > CSI_FORMATTER_VC_MAX) {
+		dev_err(formatter->dev, "Invalid virtual channel(%d)\n", vc);
+		return -EINVAL;
+	}
+
+	formatter_write(formatter, CSI_VCx_PIXEL_DATA_TYPE(vc), 0);
+
+	return 0;
+}
+
+static int formatter_subdev_enable_streams(struct v4l2_subdev *sd,
+					   struct v4l2_subdev_state *state,
+					   u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	struct device *dev = formatter->dev;
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	dev_dbg(dev, "remote sd: %s pad: %u, sink_stream:0x%llx\n",
+		formatter->csi_sd->name, formatter->remote_pad, sink_streams);
+
+	if (!formatter->csi_sd) {
+		dev_err(dev, "CSI controller don't link with formatter\n");
+		return -EPIPE;
+	}
+
+	if (!formatter->enabled_streams) {
+		ret = pm_runtime_resume_and_get(formatter->dev);
+		if (ret < 0) {
+			dev_err(dev, "Formatter runtime get fail\n");
+			return ret;
+		}
+	}
+
+	ret = csi_formatter_start_stream(formatter, streams_mask);
+	if (ret)
+		goto runtime_put;
+
+	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
+					 formatter->remote_pad,
+					 sink_streams);
+	if (ret)
+		goto stop_stream;
+
+	formatter->enabled_streams |= streams_mask;
+
+	return 0;
+
+stop_stream:
+	csi_formatter_stop_stream(formatter, streams_mask);
+runtime_put:
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+	return ret;
+}
+
+static int formatter_subdev_disable_streams(struct v4l2_subdev *sd,
+					    struct v4l2_subdev_state *state,
+					    u32 pad, u64 streams_mask)
+{
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+	u64 sink_streams;
+	int ret;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       CSI_FORMATTER_PAD_SOURCE,
+						       CSI_FORMATTER_PAD_SINK,
+						       &streams_mask);
+	if (!sink_streams || !streams_mask)
+		return -EINVAL;
+
+	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
+					  sink_streams);
+	if (ret)
+		return ret;
+
+	ret = csi_formatter_stop_stream(formatter, streams_mask);
+	if (ret)
+		return ret;
+
+	formatter->enabled_streams &= ~streams_mask;
+
+	if (!formatter->enabled_streams)
+		pm_runtime_put(formatter->dev);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops formatter_subdev_pad_ops = {
+	.enum_mbus_code		= formatter_subdev_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= formatter_subdev_set_fmt,
+	.get_frame_desc		= formatter_subdev_get_frame_desc,
+	.set_routing		= formatter_subdev_set_routing,
+	.enable_streams		= formatter_subdev_enable_streams,
+	.disable_streams	= formatter_subdev_disable_streams,
+};
+
+static const struct v4l2_subdev_ops formatter_subdev_ops = {
+	.pad = &formatter_subdev_pad_ops,
+};
+
+static const struct v4l2_subdev_internal_ops formatter_internal_ops = {
+	.init_state = formatter_subdev_init_state,
+};
+
+/* -----------------------------------------------------------------------------
+ * Media entity operations
+ */
+
+static const struct media_entity_operations formatter_entity_ops = {
+	.link_validate	= v4l2_subdev_link_validate,
+	.get_fwnode_pad = v4l2_subdev_get_fwnode_pad_1_to_1,
+};
+
+static int csi_formatter_subdev_init(struct csi_formatter *formatter)
+{
+	struct v4l2_subdev *sd = &formatter->sd;
+	int ret;
+
+	v4l2_subdev_init(sd, &formatter_subdev_ops);
+
+	snprintf(sd->name, sizeof(sd->name), "%s", dev_name(formatter->dev));
+	sd->internal_ops = &formatter_internal_ops;
+
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
+		     V4L2_SUBDEV_FL_HAS_EVENTS |
+		     V4L2_SUBDEV_FL_STREAMS;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->entity.ops = &formatter_entity_ops;
+	sd->dev = formatter->dev;
+
+	formatter->pads[CSI_FORMATTER_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	formatter->pads[CSI_FORMATTER_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
+
+	ret = media_entity_pads_init(&sd->entity, CSI_FORMATTER_PAD_NUM,
+				     formatter->pads);
+	if (ret) {
+		dev_err(formatter->dev, "Failed to init pads\n");
+		return ret;
+	}
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		media_entity_cleanup(&sd->entity);
+
+	return ret;
+}
+
+static inline struct csi_formatter *
+notifier_to_formatter(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_formatter, notifier);
+}
+
+static int csi_formatter_notify_bound(struct v4l2_async_notifier *notifier,
+				      struct v4l2_subdev *sd,
+				      struct v4l2_async_connection *asc)
+{
+	const unsigned int link_flags = MEDIA_LNK_FL_IMMUTABLE
+				      | MEDIA_LNK_FL_ENABLED;
+	struct csi_formatter *formatter = notifier_to_formatter(notifier);
+	struct v4l2_subdev *sdev = &formatter->sd;
+	struct media_pad *sink = &sdev->entity.pads[CSI_FORMATTER_PAD_SINK];
+	struct media_pad *remote_pad;
+	int ret;
+
+	formatter->csi_sd = sd;
+
+	dev_dbg(formatter->dev, "Bound subdev: %s pad\n", sd->name);
+
+	ret = v4l2_create_fwnode_links_to_pad(sd, sink, link_flags);
+	if (ret < 0)
+		return ret;
+
+	remote_pad = media_pad_remote_pad_first(sink);
+	if (!remote_pad) {
+		dev_err(formatter->dev, "Pipe not setup correctly\n");
+		return -EPIPE;
+	}
+	formatter->remote_pad = remote_pad->index;
+
+	return 0;
+}
+
+static const struct v4l2_async_notifier_operations formatter_notify_ops = {
+	.bound = csi_formatter_notify_bound,
+};
+
+static int csi_formatter_async_register(struct csi_formatter *formatter)
+{
+	struct device *dev = formatter->dev;
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	struct fwnode_handle *ep __free(fwnode_handle) =
+		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
+						FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return -ENOTCONN;
+
+	v4l2_async_subdev_nf_init(&formatter->notifier, &formatter->sd);
+
+	asc = v4l2_async_nf_add_fwnode_remote(&formatter->notifier, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
+
+	formatter->notifier.ops = &formatter_notify_ops;
+
+	ret = v4l2_async_nf_register(&formatter->notifier);
+	if (ret)
+		return ret;
+
+	return v4l2_async_register_subdev(&formatter->sd);
+}
+
+/* -----------------------------------------------------------------------------
+ * Suspend/resume
+ */
+
+static int csi_formatter_runtime_suspend(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	clk_disable_unprepare(formatter->clk);
+
+	return 0;
+}
+
+static int csi_formatter_runtime_resume(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	return clk_prepare_enable(formatter->clk);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(csi_formatter_pm_ops,
+				 csi_formatter_runtime_suspend,
+				 csi_formatter_runtime_resume, NULL);
+
+static int csi_formatter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct csi_formatter *formatter;
+	u32 val;
+	int ret;
+
+	formatter = devm_kzalloc(dev, sizeof(*formatter), GFP_KERNEL);
+	if (!formatter)
+		return -ENOMEM;
+
+	formatter->dev = dev;
+
+	formatter->regs = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(formatter->regs))
+		return dev_err_probe(dev, PTR_ERR(formatter->regs),
+				     "Failed to get csi formatter regmap\n");
+
+	ret = of_property_read_u32(dev->of_node, "reg", &val);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to get csi formatter reg property\n");
+
+	formatter->reg_offset = val;
+
+	formatter->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(formatter->clk))
+		return dev_err_probe(dev, PTR_ERR(formatter->clk),
+				     "Failed to get pixel clock\n");
+
+	ret = csi_formatter_subdev_init(formatter);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "formatter subdev init fail\n");
+
+	/* Initialize formatter pixel format */
+	formatter->fmt = find_csi_format(formatter_default_fmt.code);
+
+	ret = csi_formatter_async_register(formatter);
+	if (ret < 0) {
+		v4l2_subdev_cleanup(&formatter->sd);
+		return dev_err_probe(dev, ret, "Async register failed\n");
+	}
+
+	platform_set_drvdata(pdev, &formatter->sd);
+
+	/* Enable runtime PM. */
+	pm_runtime_enable(dev);
+
+	return 0;
+}
+
+static void csi_formatter_remove(struct platform_device *pdev)
+{
+	struct v4l2_subdev *sd = platform_get_drvdata(pdev);
+	struct csi_formatter *formatter = sd_to_formatter(sd);
+
+	v4l2_async_nf_unregister(&formatter->notifier);
+	v4l2_async_nf_cleanup(&formatter->notifier);
+	v4l2_async_unregister_subdev(&formatter->sd);
+
+	pm_runtime_disable(&pdev->dev);
+	media_entity_cleanup(&formatter->sd.entity);
+	pm_runtime_set_suspended(&pdev->dev);
+}
+
+static const struct of_device_id csi_formatter_of_match[] = {
+	{ .compatible = "fsl,imx9-csi-formatter" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, csi_formatter_of_match);
+
+static struct platform_driver csi_formatter_device_driver = {
+	.driver = {
+		.name           = "csi-pixel-formatter",
+		.of_match_table = csi_formatter_of_match,
+		.pm             = pm_ptr(&csi_formatter_pm_ops),
+	},
+	.probe  = csi_formatter_probe,
+	.remove = csi_formatter_remove,
+};
+
+module_platform_driver(csi_formatter_device_driver);
+
+MODULE_AUTHOR("NXP Semiconductor, Inc.");
+MODULE_DESCRIPTION("NXP i.MX9 CSI Pixel Formatter driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1


