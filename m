Return-Path: <linux-media+bounces-39538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F5BB2209E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D9AC425D68
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5602B2E1C65;
	Tue, 12 Aug 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ERvdL6z8"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD65B2E1751;
	Tue, 12 Aug 2025 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986901; cv=fail; b=n/yueQr1I6zN+oyWxWeKumLRdPR3mC5tX1G2LxldY/4tiDQwVy/Mybg8qHFt5PWKO2kpfO6AJf/akIt0TjLfMd3urtnGezy5iFRFrPaWmes64UdKdjAwCEPESztBWwj3s7tfq4yFXZm/1oka+k/VR1CscU9+u5MUYymXs2Bz8s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986901; c=relaxed/simple;
	bh=WKQ/cmIefKu2GUd9V/1pdHywLZFxz2CoHCPjAS5YU3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F80stGCZrhFDoPXm2OUi59CEG/NFxmm1fzDd9SodwW/0OC8ePCy9h0yOKGBpFOY4T+5x/mBQyyEF0Dy8VR/q4GkGydIFsjFDLR6JFIfMDf2X4TYrKFyn6yUa76/K2ewBTKzb7i4++sL2RhQQ17iIuWvm/Z6qeK0VvORMu29Uxh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ERvdL6z8; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksWXqspmTU+SZkUfnUjjZoH0YowFGCC9OvQc1CbQVpezrEaWsnTpoq9v/o6Iz1bvbLy2VbNUPXh7+R/IiTGf5EGRi+8a4dwyx5pmzNBQe5Sbd6Kjsz/8u5tv4bjHxKViF/4dz2oti3jIxnGoKPiTQPxHYEJEpnXUsTuDf/pMjGQ1OTsaEzvxlRU+fGltgc0mrDF+veSZeSwVnpnqMdckyyHy73VhstsENpkBl90RwSjMW1Hlgkx9vC75b3hMBjGYmNpwp84GlV77e0pC7ONOfjX+peVavdt+RZoKvUP9g9tr1lsMfHBUtNcrOGx2XQ0d8/7cA2uVIMvGhm+ITZg8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTPQzHpzzXqeYJv52gnW0CdFxGV5MbpGt/Lg7EFYy18=;
 b=u1+RZl+rvYK1q+GV1wvxdnY3mV1/OXyXWrWvNkoqLeSZwHyvcWMX9o/RhIgs8BuLlwTyk5kQT/mrpMkKv9NE+OkkqLDQqhPaKCvW9iwfsoMuWQu8HwvNYR4tfEs6dNygChpyrjc8zxB/yHcG7HNtp8Lod1N4E08GQFBIue0yRy8z+QJ4D5tc02q3Ceq4yhaOMXa/K0LmLbv7WAK8odO+WOPTa3fHQ//lwRoCkSyfyHBmRhil6LqlmVeXflvulNDfIxzn1/gsFGWRwEwIvgzAAB143OZzBq7YgSOx8Ksb4Bv3u9VsoBKg0O1Znp2ZUhV50zw8chgt37arBgJXsKDgQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTPQzHpzzXqeYJv52gnW0CdFxGV5MbpGt/Lg7EFYy18=;
 b=ERvdL6z8zhCdUrP/ayt2GHzCMzGdeuFdk08ONmphMuQyV1bLIFaAdNq71jD3Qbx7xBATQIauOFdcyLaOlEd0GQspdpkKmDymVu/VD/ZrQHQkFpkZtEzymgf7acjFwhh1Atn4yKJTNYkotDBxdKDt+2I2g/cSvdsXBFNPqDWV5Wg4k3XBC2eYp85N96YC4SYqvkcYe39yo/4ew2ihrmi4lV1jH1N8W4z4MmwMoafJ3+NE77SyrFlvszNsn4gcw964E737d690T6OXwJ/S7l2dkGLrTaEXKc7VrmpZ+U0m/H19/y61EdAN0fA06ne8Q/KPTcD+8sVThrnMbfRanlXROw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB10001.eurprd04.prod.outlook.com (2603:10a6:800:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:21:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:21:35 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH 3/5] media: imx8mq-mipi-csi2: Use devm_clk_bulk_get_all() to fetch clocks
Date: Tue, 12 Aug 2025 16:19:24 +0800
Message-Id: <20250812081923.1019345-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB10001:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3aaf35-b747-4272-e246-08ddd979406b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dnhLNVpTRnpoM2NJT2t5ZzMyYm1xUnQ0ZDlpR3gyckRQL2tzRlRxRmE1RkhX?=
 =?utf-8?B?UFhCZ2d6amNQcTViMFpFamtpYlFZNlZtWG5rK082Y0t3UGpsWXhHZHFwWkZa?=
 =?utf-8?B?QXBhQkxlMVV4TmR3SGFYVnUvT3ZMSXJxNWVERG5LR1Z1d1RqejVnTU1MaXpn?=
 =?utf-8?B?ZjgvZmVSbFpQUGZxM3FBdDM3UExXQTJYYThpakc4R0gySE1zQm1IV05TUHVX?=
 =?utf-8?B?N2plUlRLMzY1U3JXQnEvWU0zVnRnM05NbFk4MnUxRzNsZ0JSeEFsTWYrRjBw?=
 =?utf-8?B?TkhhOFZORVlGMTNvME9zWHlxME5vMDh2YkxBcjVuMDQzcVEwNWlPaE5oVnF5?=
 =?utf-8?B?QU9temRJcEpmbFp6UWNMT1BjVHpDUDNkN3VwdHFrVEwzR1FIK3VUa2t2OXdB?=
 =?utf-8?B?OVpjN1piZ2Y2SFFLU3VacmFjV0ZOT1U4RS9PSFhMVDlBWThlYnZCRHZlMkh6?=
 =?utf-8?B?OU5RMEhjd21yMW11aFZPb1pXZ2Njc2dlUEcvcGRETGpOR1N5Qkx0enpSc0lL?=
 =?utf-8?B?Z1dtcGNUcHh6MlVWSVA1bFdJd0I1MWtaUW9sUmlFNjlDeVlUSXNLOURYZTZo?=
 =?utf-8?B?VlpFY0JTL2djS0x4clB1bFMweHdjeUlhRDBESFdUbWdMUWtBdkM4ZDViWDZL?=
 =?utf-8?B?ZVQ1bkhySzVQdlVTNjI0eDdiQWxQaldGQ1JQUnIzK24vSjQvV1RBMFY2NUNI?=
 =?utf-8?B?UER0a2dPelZHVi9uakZHT3ZabS9SQ3NaU1k4YUtmSUJUdll5SUgwZ0ZFWlVh?=
 =?utf-8?B?eitDRHh3YmNrOWZRTDBLU3o4SFBlMmdnSkgreEVIRUg1T0xIM2JhODlta1Q1?=
 =?utf-8?B?MlNnOE0yUE85VVBZUEJVbkd3dVVlYXdxUTgrbUNFV01na21HdUdlUlF5dlUx?=
 =?utf-8?B?NnRrQnpUc3I1bW5hYUxHQ0ZjUEMvZG9iNmI1eTk0aWdvazFKTFJLODdtOC9D?=
 =?utf-8?B?OXZxRXl4T1FYRHlWTVJrMTZSVytlODlEeVdLUlJ5aENtampHSGlZTEZRNWh6?=
 =?utf-8?B?a1pNQXJEUFNabE9ibm9DVzFZYkZ0OC9ZQTBHSFZNWDJQMStFV3RsYSt3Zk9x?=
 =?utf-8?B?a2tCd0ljaHREZ0tJLzl0bm5jZE0veEdkUkZlMmZldHRtZXF5bU4zWjA5Nlhi?=
 =?utf-8?B?N0R5bVRDWHd3WlFSZ2ZFbW9MazIvVUxqazBVRDZRNHFwOUM0UExMVUtLUlN1?=
 =?utf-8?B?NzE3VDluY1htWmZ5L1k5SklicjFpWlVxMzYvNVF2Z3pVS2V2ZUIvQVNVYVh6?=
 =?utf-8?B?bTFKNlhaMVUwUnc3L0lndzFNeWZYbGk1Y3BtMStFdUtPdkViRDRMNi9VMDN6?=
 =?utf-8?B?VjN2Z2lNRDg3YVdueW5nZFk4SS9yU0dzclZXcVpVbHo0ZEpnQTVyTDRKZGNq?=
 =?utf-8?B?VHltUzBxRHUyemJDS1ZMRXRrdWxvTXBCREppcllHUCtjVlRmcm1TWkcxaUp4?=
 =?utf-8?B?SklML3hRWkN1RGRCejN3eDJ3eDlWemduVWxiNXNpano4c29nV0hLQmVIczJY?=
 =?utf-8?B?eUVWelBrWU5tc2wwMDIyUGRDZlhUNkQzdXVQekFlNGVNUTJTcDN3NTBaUUEy?=
 =?utf-8?B?VnI4SXJoZ2k3Y0hyRG9uSjJLemNoRVlCaW1Kelloci9BNE5TRkY1OWdEcTY3?=
 =?utf-8?B?RHM0QXl0UjBsc2FKT2J4T1RYWlRsbmprUk9nMklhOGM0aExjUERKQjQ3Vkdi?=
 =?utf-8?B?eGROaVRRQ1FGaE1XT3l3UFdUTWF5Qnl3cm5yVWpZUHlYRWMzRm9raG9JK0FZ?=
 =?utf-8?B?TDJvbjc0NGlCdkh0QTlRSnhNKytlbk81WWZ5Z1V6cmd6c1lnVU80YWROeXpx?=
 =?utf-8?B?WXJ4VVpwTWpZSkdIZGNVV2ZJOFJQUGlFSjl5SjlyTXpVKzF4NjVoWTVKdEVj?=
 =?utf-8?B?QWtRbnJ2U2JKTUhsWDNndmNnaG9oczljc1Uvd0hSWTFQaW9qaDNpNVg1NFgv?=
 =?utf-8?B?Y2Q3aEd1VHp5eDM2VUJvbFVNeG9wY25DWWlqNkxFeFFocjFjUE5jT3daSDND?=
 =?utf-8?B?NGEzNlN6RkpRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1c2OGs0SkNBSFhFM1ZDQmpPS3lnNVlnSzZ1TTgrdGFvVktBWE4yMFQyN0ph?=
 =?utf-8?B?bXVhSUVDSi9mbHBHMkJaY0djQjE4dXl1bEVycEszeVVvUjYyNXRKcjQ5V3Z4?=
 =?utf-8?B?bnpzVUJaQW1OTnpQV0ZzNWh1amlVSlQzUGExTWVQV0sydGdvdzQ4S29Vd3c5?=
 =?utf-8?B?WUhTSTBnNkV4U08vWHZIMFpDZTBoM29SVm9SUHRadU8wMjVoNDg5WUdKL0RM?=
 =?utf-8?B?WkR6RjNTNWgzbjhKN0ZvSE44MzFMRlpiZEJ6SWVkaENFbVVkT0MxdkNINDZL?=
 =?utf-8?B?WnpyL2FROXUxcmVVU01yYjh0YlpIblo3Z00yZlNtTE13RVl2R0pKSVExbXU1?=
 =?utf-8?B?MDZUR1BVRmhldkhxZlFsWkYyRHArcUphaFJGMmtmNDAxaThzWklLMkttUG9m?=
 =?utf-8?B?NlJscjlBUER4NFp5VjRmcEk0OEE3eW5YaWh1dWtqNHU3MlQzMmpaZHpjS2U5?=
 =?utf-8?B?alNPYzE2KzJGSldtQW5vVjUzV3MwYUhSQ0VCVHh3R3JBOUlqQm5wVTRvd25F?=
 =?utf-8?B?K2NvbkppSWh1eWtaVVptSHJ2Nk5ObW0vYzNyYmxvWFdHNnpyU05vWDJMQW8w?=
 =?utf-8?B?a3hwMTBoU0NaRm9XQ0NvemlkK21SdUZJTHBjZnJNVnhWV2RaNHhJc0VDQmJm?=
 =?utf-8?B?ekpCekFEZHh5cUJqdHAva0NRT2dHekJBcU04VDlFL2F0cW9leldLVjlOK3hP?=
 =?utf-8?B?VXYxNUluNUxRZ1NBQk9ibjk2NjVCY3U0VjVkd1pkQ1dwQ1NnN1BMS2Z6UVJ2?=
 =?utf-8?B?R1VsSEtHcHpVQ1h2SzVCOWxMcWl1alQ2Si83ZzZ5TXlLMGFCK0p0ZGw1TWxP?=
 =?utf-8?B?OFdoRy9LVWNZTGJBU1V5a0ZpZmhDeHFkSWJuRmtmVFpFeGJuanArenViV3V3?=
 =?utf-8?B?aEpTeXhpT0JCYXA1bTRXekRKaFFtZndpa2ZyMWJqZmg5QnkrZTFVbUo5MDgv?=
 =?utf-8?B?anBNRzhHSUIzcmJxYnc2aTBucTh6ZGZ4bDl0cnRzbzBsVmhqTHpEdU41R0tM?=
 =?utf-8?B?MTNOMHFHT29RNnJLdzhCMWs0SGFWcmxneXd3RGJRNjRndjlaQzBETWw2MHNi?=
 =?utf-8?B?VS95eGJGenZtekNreE13MFVmaTlvNjJzOFc5TmVHYnhZKzFKTnBISmloM2Vx?=
 =?utf-8?B?K0F6R2s4c1R0WG1JYWlTQ2kvZWZEYnd4ZHlZMVdDRnJqYkp5QVl5d2pLajIv?=
 =?utf-8?B?WUlVRklsWHI1OXFvb1B6U1grU2RWVi8xaktZQjNOMWZiR1hyWWMvUmd6clhD?=
 =?utf-8?B?YzY5cHlKUVlKby9qbnd3OUxZODExb0o3d0FPMmsvbnlSS1NkR1VDQ21yMndG?=
 =?utf-8?B?aStwWUx1ZnRjWW9UZTI5cm1jRnQwVTRoa3UrUnlEdnQvUXV4V1Y0andmVEhw?=
 =?utf-8?B?L3NEdzBsWG0xTnQ3TW1GVEJ5dE9Hak9kWUtjcmxVbUxMVnROb2prY1VxWmlz?=
 =?utf-8?B?YUUwanlFazl4L1hlUVFwcG5Qcy9kWFpWZi9MUkdpQXdVdG85ckNTRWZJb0F3?=
 =?utf-8?B?VHVkSFhxaWhkS2Z1MjFzbTFGb3NLT0dYSEdSdDNuK1dCM2FIREpFOUVVTmNt?=
 =?utf-8?B?RmpCSzRpUXVkaEh3Z3VZckFQTUErS0pCSk1mYkV3YW0vTjkrZWhaN2xFMmV2?=
 =?utf-8?B?Wms4ejJyazU3NElYRTBBSVVaVUJwUE1MQ0x2S3VLNTdpZlZpckZqWGtDTmlh?=
 =?utf-8?B?bGVZbmM0TXZQcDc5YTZod1FaalAzUGFnVWV0WEVDWFBWVkpZci9SOHkzNW0z?=
 =?utf-8?B?cnNJQWd6RkhmbGYyQUZZcm1tbllkNjhGUzk1Wit1dmN3UzFCNzFmRmdEUkgx?=
 =?utf-8?B?S0p4bXBCRDNvOXZtT2k5MWt2Lzg2SFIrNVR6R2VlbEhmOXJ5bWNEaWJ5eFUx?=
 =?utf-8?B?TlJYUzQvR3lnVjY4VjVldERXd2JXUjgrYU1MZ0VETjRlLzRSUUZsVEtmUEhj?=
 =?utf-8?B?WUVNMG5Ba25ES1ZXMEkweC8yM2dBWnh2cW1qbUhJdWsvV3RydUcwbG1BN0Ja?=
 =?utf-8?B?UE54WkJSSkRZRlF0RFFqNkZWZFdiNm96K2FMb3RpeVF5bU8vQ1RVMk40em1Y?=
 =?utf-8?B?TlF3akZ6VEx3MHRXeVp4SzdKUTdGR1hsUkNxc2J5Rjl5UEluVEtoa1JXWllY?=
 =?utf-8?Q?a5Qr41pEB2+xxILD7fow9/iMv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3aaf35-b747-4272-e246-08ddd979406b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:21:35.4822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATOWQIY00mj2TPrxHGlj/LlvtWW6OBwdIzGYiBwnB5mC32C7DvmJfE5/JFkwsBfO/7I/8p0254XfIaoTczlZdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10001

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use devm_clk_bulk_get_all() helper to simplify clock handle code.

No functional changes intended.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 52 ++++++-------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index ed6578f7f0f9..be07ff27071f 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -72,21 +72,6 @@ enum {
 	ST_SUSPENDED	= 4,
 };
 
-enum imx8mq_mipi_csi_clk {
-	CSI2_CLK_CORE,
-	CSI2_CLK_ESC,
-	CSI2_CLK_UI,
-	CSI2_NUM_CLKS,
-};
-
-static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
-	[CSI2_CLK_CORE] = "core",
-	[CSI2_CLK_ESC] = "esc",
-	[CSI2_CLK_UI] = "ui",
-};
-
-#define CSI2_NUM_CLKS	ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
-
 struct imx8mq_plat_data {
 	int (*enable)(struct csi_state *state, u32 hs_settle);
 	void (*disable)(struct csi_state *state);
@@ -112,7 +97,8 @@ struct csi_state {
 	struct device *dev;
 	const struct imx8mq_plat_data *pdata;
 	void __iomem *regs;
-	struct clk_bulk_data clks[CSI2_NUM_CLKS];
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct reset_control *rst;
 	struct regulator *mipi_phy_regulator;
 
@@ -417,24 +403,16 @@ static void imx8mq_mipi_csi_set_params(struct csi_state *state)
 			      CSI2RX_SEND_LEVEL);
 }
 
-static int imx8mq_mipi_csi_clk_enable(struct csi_state *state)
-{
-	return clk_bulk_prepare_enable(CSI2_NUM_CLKS, state->clks);
-}
-
-static void imx8mq_mipi_csi_clk_disable(struct csi_state *state)
+static struct clk *find_esc_clk(struct csi_state *state)
 {
-	clk_bulk_disable_unprepare(CSI2_NUM_CLKS, state->clks);
-}
-
-static int imx8mq_mipi_csi_clk_get(struct csi_state *state)
-{
-	unsigned int i;
+	int i;
 
-	for (i = 0; i < CSI2_NUM_CLKS; i++)
-		state->clks[i].id = imx8mq_mipi_csi_clk_id[i];
+	for (i = 0; i < state->num_clks; i++) {
+		if (!strcmp(state->clks[i].id, "esc"))
+			return state->clks[i].clk;
+	}
 
-	return devm_clk_bulk_get(state->dev, CSI2_NUM_CLKS, state->clks);
+	return NULL;
 }
 
 static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
@@ -489,7 +467,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	 * documentation recommends picking a value away from the boundaries.
 	 * Let's pick the average.
 	 */
-	esc_clk_rate = clk_get_rate(state->clks[CSI2_CLK_ESC].clk);
+	esc_clk_rate = clk_get_rate(find_esc_clk(state));
 	if (!esc_clk_rate) {
 		dev_err(state->dev, "Could not get esc clock rate.\n");
 		return -EINVAL;
@@ -848,7 +826,7 @@ static void imx8mq_mipi_csi_pm_suspend(struct device *dev)
 
 	if (state->state & ST_POWERED) {
 		imx8mq_mipi_csi_stop_stream(state);
-		imx8mq_mipi_csi_clk_disable(state);
+		clk_bulk_disable_unprepare(state->num_clks, state->clks);
 		state->state &= ~ST_POWERED;
 	}
 
@@ -866,7 +844,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
 
 	if (!(state->state & ST_POWERED)) {
 		state->state |= ST_POWERED;
-		ret = imx8mq_mipi_csi_clk_enable(state);
+		ret = clk_bulk_prepare_enable(state->num_clks, state->clks);
 	}
 	if (state->state & ST_STREAMING) {
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
@@ -1092,9 +1070,9 @@ static int imx8mq_mipi_csi_probe(struct platform_device *pdev)
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-	ret = imx8mq_mipi_csi_clk_get(state);
-	if (ret < 0)
-		return ret;
+	state->num_clks = devm_clk_bulk_get_all(dev, &state->clks);
+	if (state->num_clks < 0)
+		return dev_err_probe(dev, state->num_clks, "Failed to get clocks\n");
 
 	platform_set_drvdata(pdev, &state->sd);
 
-- 
2.34.1


