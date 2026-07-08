Return-Path: <linux-media+bounces-67050-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pOK6G5B3TmpjNQIAu9opvQ
	(envelope-from <linux-media+bounces-67050-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:15:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809E7288BD
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 18:15:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wdwnDK8B;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67050-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67050-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C95F9301FFC9
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 16:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416DE37B415;
	Wed,  8 Jul 2026 16:14:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C7A40928D;
	Wed,  8 Jul 2026 16:14:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527275; cv=fail; b=OZOQk0PwoofihYQmZnIWiysNUw6IGzreJ9nKhAWCGkuynoStdnpfDFoequbVMIVjLbpjcwtWnouopCq5Xl/6kGzqDnVsWJF2CoPyJfh8dmREfAmYYxc80gUQi84bQHb5CWttSuTQqeS8/G3ViOiTzw6+E79cR9c/47ymrY8CMvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527275; c=relaxed/simple;
	bh=Y8TajqC6izWpviMfsw2zuq7IK+qrKUoicdzR6dCyEDw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sjJQn1aN8WdEuvnBd1gwuHj6XD3ktQx5VsN3gCIubALkPha1lrdlBuyw1MB1B3UfC4iC6A6fKAPLkknjwP/sXCPqp3m6vqysulXkG4nZ7ZUxCPEKg2BKZcKJS4xv215QGK4VWnNyjPz0BnOwWMZnWGowGRP6Z1sij+XJ5m7NPAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wdwnDK8B; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmQHDU+uobolRRnM0gAl1uXOcDK/iiimnFluxfCgVnxCsfVNRPUOGWTaQHNJLTou9dkxbQjKlQKQS0iIK7xC+2nTD8kzHvk4HBu7TTPri90D6SBKHMVO7cgZ471fgzD91lDbX/u2f/78W+Iel8zKJkGZy+5LO06EIa0OsvmC7lxFhdnoe5sURaYz7MRkwscFMJttRW6p021F35YD2spjvBRqKJUZYq0TJeCuRD1m2Lp0cIJcxUrGTAiYfcuOV5lWi4+dWkESynfzHFU8nY1TLNEV+CidnmnU5SJXO21waDv7R3MZT/ZDsi2Vr7DF+/1GoCz72Sbtc53xbV9sjKijNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuwUyI7CQ26NzAj4xYyW7fx1N9rZqCGXQJBsED3jwFI=;
 b=L8d4A0uEcafw2L3vVE6AxHzS032lzUKnc3wdNSTXeMWLxgcBN9TULDmH6UEa/N2uYUH1YvqI4mN59i8KjENIr1IgCrlRgSWGLb5DpphoK1s/dSRzqn04TSPcNY+1kuIo48iiSBPUiZJosw27wBpASfYzbXMVXJ7yuQSX1VVmfUnRJukinzDWsaOA3DL/uti2jIMnpJLCmnXdD7IA0d0+mKqN8TClqmoNs8/RDKMqXwhoYJWlAYedNcJpShmZIB7f22sow4PAZrVI2cYDNTRyZ+kLIvkRt+lWKU4sTNhXd1TMv73d8FRa8YBeWArRyn5SgKU2z6SslOazc/i2VcCHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuwUyI7CQ26NzAj4xYyW7fx1N9rZqCGXQJBsED3jwFI=;
 b=wdwnDK8BOaSChYJ7F2BUWDELSepLV7UYM0GrQkxgy8xCIQ142ge+hdFTj/rE9d4AHGA8LVw4NC61dqG9/k0r2bS3hSJxLXvBqVj6YjRVgJNQ1MgJMYgqGzUniEwpmDXRkRuJjoS4VKsriiyvzZQS5ZlSc5QmLd1onn0pm7QmRMo=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB11590.jpnprd01.prod.outlook.com (2603:1096:400:3b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 16:14:30 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 16:14:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Sven=20P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: rzg2l-cru: Fix DMA stride alignment
Date: Wed,  8 Jul 2026 18:14:01 +0200
Message-ID: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0250.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB11590:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad17c2d-812c-4f22-c153-08dedd0bfd1a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|23010399003|1800799024|366016|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
 pH1ukxzMR/IRWj6lchREfySau3HYwtNHYIkdMqFasOuTJmERoBC+vDey7qltg7/NcfxIWhsCLF/3MmveWaM+TkLUDZw9DP7EA2bEA+5gTTKa3Aqtei+8PSgr70XV1wR+xv68s/8DqqAfmEIhvkSoHvvmGPHpNyBaKKDDl/XSArdUC7PXRwohKulgDE56JMFxXcAkbtoyhMnOoor6LKRYjSn+DrdD0wj+FFNT3TfNI9tIt3/nQ7lqfVUpnXAAnAUqFwshAXfUlYyVDUgwtJLx6fOlFPJChMp09fgpuB/EKiB20Y3EzO33XmvFke4qsecrK9aPkDondzJ5wexVxzNopf0V1ds3CvrJdF99tEX+j7Y0n6MI7vNhpFy2MhK/YPNOEule8T8+dq+FppRml7LdVwzKRInJJBqz8zuYnI4/Nsi5ZN0Zv6kKLBeJKECV0qKrW5m9L7UA2M0M8VtYq4G3MgNi7ObLtpn/toBEtFFAQkfuntTbvSWpN1a0SOBQJRvkTDiHDkyVhMSOgK7yiG4mKQwYzHKFApzhj9NUsRApyIpV5LIKoqJyNR32ZQOQcQk/CnEC4+dfKcny0I5g4Pfcs87NQA55yf8/BmLKKgHUBIEyBLQJRCmZjhLK3pMbwhmStj0YOhaoV1oUStmA8+XawVtSSVcNITxRrbq2+eaTel/NoZUxDknDB/UChvdRsRwmV0G52hks1gzX3tvsVyRbjx5XxkgdKRWYUFHObKod1bU=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(23010399003)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YTg1RWc3MytLeDNwWndZcllRVkpPRnROLy83NXFXTzN0dzExaXZacDdMZGx5?=
 =?utf-8?B?bVltWkt0WDgzMktTcTlKYVc1ZmxCSGdUTzZiOUJac0RxODRteWdGNzV0K0Vw?=
 =?utf-8?B?MTFZUmpkU0hFcS9BUXRBU3EzSTRaVjA2UzBMRmgyeURLbjZHSU03bDMrSG12?=
 =?utf-8?B?TzVlTVZ2U00xZitVeUh6NXBVYUo5NGR6ZWlBSGd2SHdmQXcyUWc3UmZKYTRR?=
 =?utf-8?B?RjRuQlVjQ0cyU0FQbHlubnRDR3lDRlV5ZTdtTjV0aG5VOUR3OXZPdDFoenlZ?=
 =?utf-8?B?MGN1ZUptNUJPUzdrNmltYnVqTFBWR3Q0Q1RmREtrYzB0WUpQVUxXT0MxenFy?=
 =?utf-8?B?RDFOdDcwcHVkQXlXSld3RFpWekFzWkI5WlkzYnJ5amdXVE4rZEYzSE9aS2Nk?=
 =?utf-8?B?a0tGTHMvZFRkYzFuYXM5cmhrYytRUy9TNkVyQ2VoQVVzUk1BMU9uc3pPM0ZO?=
 =?utf-8?B?VDFRZGpsWmYzLzFaYmVJQS81dkdaUWdFRndXaVp4MzRFdXljS3o0UGYva0Y1?=
 =?utf-8?B?Q0hDa0NzbU8vQkJRSmtkVWtMSFZrdFZmQWl1YVJQbGw1Q1Rnb3ZQSnNIdkg1?=
 =?utf-8?B?YWlPTDI5TjJQNXBUVGd3UUlMVU1jT2tCNTE4RXRKeW1LWndwNmZPWUlLV1JX?=
 =?utf-8?B?dGRBK3pQRC91a0N1cER6Zy9ONkVoeG1MSXlEVnlNMW1CYnNqV21iaVpHVklS?=
 =?utf-8?B?WjI4Wk4vbVAzUW1WU3FuOGVRNXFnQXdUb1hsNTZSZll1U2Nxa1ZZTE5Gejla?=
 =?utf-8?B?azJOQjJNWFovVGJZa1JrZDJTTDBmMUVudVVLK0dORW4yR1hWZ1NTYUNRRXdO?=
 =?utf-8?B?R0JCZDcyOUh0T0YrWWlCSlNwV2ZGTnZmMXFNQ0tpanU3ci9Ta0ZFRFhKWmpu?=
 =?utf-8?B?QWNxdFRNZ0lxUnMrU2RRaVZVcVZQWUpHSEdxbFVHNnlhVG9DbEcxUXNpL3hL?=
 =?utf-8?B?Wm1KaXk3S3hrQnp1eEZ3K3pUVWE2eHhQdDhCUHRwa1NRbks3cU5mK290dXRk?=
 =?utf-8?B?cjhYRGQ4SzFXZDUwWjBJa25ETTlVK3Q3QUxMSkMweXI5R0tITkM3c1VxMElq?=
 =?utf-8?B?T2NSMjJWcjNpQkRtNk9zbUU1cHNQWHREY25FTWszMXZEUXBTTkYxeVVZZDdi?=
 =?utf-8?B?RkRXaWhpK2dxZktDOFM4czJLRVhodC9mSTkwa0FscldicXJraW5kR1A2VHF2?=
 =?utf-8?B?ZW1FaDVlRHlUK2lBMDBhMXIyMyszUWlpakp5OWNQZ2xEcGNFVEo5allSWm0x?=
 =?utf-8?B?YTNaZit3Ylk0WHlhYkRZV1VIbXVpWHQrUnI5Mkx0YXNxdHJRdURhemlSd2ov?=
 =?utf-8?B?dzEzeUVhY25TTVBnZkt4V2tUeFR4YjNiS3pHU1l6RSswc3FSQys0elphUHZB?=
 =?utf-8?B?K0lnK3Nqd0lZajNXbnJNdWVseVl0RlV5SStKcHRFMjNuNTIzbVhLd21KNXRl?=
 =?utf-8?B?Z1lERXRFdmdxSVdFcUlRM0hCUVFxRkYzdGJMUCtwRERTRG9MRWVMN1ZKTGxZ?=
 =?utf-8?B?ZVZzS0FiZEVTMXI1NExEL0dmQVBOSW9YVzhYVDhVQStqRy9odDlZTXBlMVJH?=
 =?utf-8?B?UGdyTDJwNDZSNERSWjc5SzVVdnRnRTJHSlhtOGdMZDQ5VVBhOGN6dEl6by9Y?=
 =?utf-8?B?aHFZNVRmeU84VDlSS2ErMnNmc1M1dS9VTGFVLyt0MEM5KzhKb1BuOEhxZHIy?=
 =?utf-8?B?N0Z5YVVBZExqdGVub01kZE1ZS0NaUEZzbjBrVC9EVUFlOThJa1pZd3V4VDFV?=
 =?utf-8?B?Wm4rM010VnBQUENGSkh0Y1Z6elJDeUxCdXJubVEzMXF3aUh4VFM3K2kybERr?=
 =?utf-8?B?VGVKaWdsU3NNcHU5c3cwdjFGeTdaTHVrVkxvZUh6WDQ3cHhHK2l0dVcvQVQz?=
 =?utf-8?B?Z2FkOHM3ZEZQWXJtaWtaWG84VGRweHJZWUZGL1RVMnljMFhrV0FsU2pNZnlE?=
 =?utf-8?B?Sk0zQUVyeE9jY0c2blNheEVHUS8zakMyaEI4R1liaCtKdTg2SmtNSHhaK0pQ?=
 =?utf-8?B?RlNQUG9vZksvQkFEaVR5aUhLcFFHYVhDcDg2cGt2UVlteExnT3ZMSzlBMU1C?=
 =?utf-8?B?NGVldkFrRXE3QUx6YTZFYWxsaEp3M084K1lhZjBScHhkNW1IektrYUI1N0Nv?=
 =?utf-8?B?VUdNT2N0VUtLUmdPQnlUZkNiUm04eWJCaXBNY3dXNnViNVdBM2Z6QUcwNFdY?=
 =?utf-8?B?dWMzdGNNUG1WdkpDSEJsVDBUK1RlYmhCRWl4djFBK0JXTzVZODBoSVVHaGgy?=
 =?utf-8?B?YmlFVEd5MDhFRWpvbDdUQWpnbElwZlNGM1lSZUVlcjJOVWxNL0pYY01tMVgr?=
 =?utf-8?B?QmtiQkMyUVZ2a0R6d0YwNGY3dGJ4cmpFT1ZOejQyS1BiQm9lSEkwSEd4THBU?=
 =?utf-8?Q?v2kmZ09JWUagX9hzHiKrlFdzcRz+55euhQ4Z4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad17c2d-812c-4f22-c153-08dedd0bfd1a
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:14:29.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mw9iis42zZ3uVWu/mT0+WE1Rt34JaGOiG1cvt88Etov1x9ilKhmB2VhlUhxOaxUKUqO0Xl6RJwyoH3IVpkCRF3TsaprishCUlDh1qgkBpkPRfHH8JpjRMAVVR7oNqX72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11590
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67050-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:s.pueschel@pengutronix.de,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0809E7288BD

Dear All,

While testing ov5645 + RZ/G3E we found out that the UYVY8_2X8/2592x1944
is broken. The issue is that the CRU DMA engine requires the line stride
to be a multiple of 128 bytes (RZG2L_CRU_STRIDE_ALIGN). v4l2_fill_pixfmt()
sets bytesperline as width * bytes_per_pixel with no alignment, so for
widths whose natural stride is not 128-byte aligned the hardware silently
rounds up, causing a mismatch that produces visible horizontal banding in
the captured image.

Tested using:

media-ctl -d /dev/media0 --set-v4l2 '"ov5645 0-003c":0[fmt:UYVY8_2X8/2592x1944 field:none]'
media-ctl -d /dev/media0 --set-v4l2 '"csi-16000400.csi2":0[fmt:UYVY8_2X8/2592x1944]'
media-ctl -d /dev/media0 --set-v4l2 '"cru-ip-16000000.video":0[fmt:UYVY8_2X8/2592x1944]'

v4l2-ctl -d /dev/video0 --verbose --set-fmt-video=width=2592,height=1944,pixelformat=UYVY --stream-mmap --stream-count=100 --stream-to=./frame.raw
gst-launch-1.0 v4l2src device=/dev/video0 blocksize=76800 io-mode=dmabuf num-buffers=200 ! video/x-raw,format=UYVY,width=2592,height=1944 !  videoconvert ! queue ! waylandsink sync=false

This patch fix the issue.

Kind Regards,
Tommaso

v2->v3:
 - PATCH 2/4: No changes, just moved to from PATCH 3/4 to PATCH 2/4
 - PATCH 3/4: Moved to PATCH 3/4, from PATCH 2/4.
   Fixed documentation as suggested by Sven Püschel

v1->v2:
 - PATCH 3/4: Move v4l2_fill_pixfmt() into v4l2-common.h as inline wrapper
   Add v4l2_fill_pixfmt_aligned() helper documentation.
 - PATCH 4/4: Collected tag, add missing Cc stable, fix s/commit/Commit/
   into commit body.

Tommaso Merciai (4):
  media: v4l2-common: Convert v4l2_fill_pixfmt_mp() to static inline
    wrapper
  media: v4l2-common: Add v4l2_fill_pixfmt_aligned() helper
  media: v4l2-common: Add kernel-doc for v4l2_fill_pixfmt_mp_aligned()
  media: rzg2l-cru: Align bytesperline to hardware DMA stride
    requirement

 .../platform/renesas/rzg2l-cru/rzg2l-video.c  |  3 +-
 drivers/media/v4l2-core/v4l2-common.c         | 20 ++---
 include/media/v4l2-common.h                   | 75 +++++++++++++++++--
 3 files changed, 79 insertions(+), 19 deletions(-)

-- 
2.54.0


