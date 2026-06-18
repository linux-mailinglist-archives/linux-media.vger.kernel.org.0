Return-Path: <linux-media+bounces-65157-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cXCFBWK9M2qvFgYAu9opvQ
	(envelope-from <linux-media+bounces-65157-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:41:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8B869EF4F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 11:41:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=dXGRyuAj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65157-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65157-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 108DC305900F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 09:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C263E00A7;
	Thu, 18 Jun 2026 09:38:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AEE3DFC61;
	Thu, 18 Jun 2026 09:38:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781775537; cv=fail; b=VoyD4afCsXT7V/GZ5bpFGcftpqS7G4qlsL35zpL4Ft052KaN2y85EBABwRDMD0TwiVBdvkhl7//NvvP2a1gWwI+f2eDVVtOy90P6jzRb6ZIc7eEIf/+z3OdU2v6HSk+37Ezj9I4lTUidEQ/C/gX5vsSS0TgKU9AuYQdNVfPbKHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781775537; c=relaxed/simple;
	bh=x2SgUEB/v5h9TrLG6pEEQ4VEjjjW60EvYgZAfTUpHA0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kE2nUKvFuZnQmdHKsGxE8t3UJzD43q34RY0T/YQZeFcm0tOeQWQeH2yCtS8eYw0yyLQxDjHIcGZiRphZnIyLySnRVSz5wuy4oBdavS1eoL/5qmjoCz0+fbnLOwAsy0IBBg4j6sZP6Jgr7HinhmKzzLIYHHhCiVI7n76zT1HRrj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dXGRyuAj; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCvGF8wZDXfsViyjr5kIYBZavIpXZWinnObjholMEJAPtRAdnBeGi4APJJeJLd6QsWPpvg+g3/R0i49rqT2DIc5Tj080HxYls5Idk1gcQ6QiK7/ff1kERVhc/iFE/LzOyMB8ksw4PAkYa3g3xN9UQX9KSklBNucwTXj5jVdvYMiaKBPGL3h+IQ50jT4Zk7Ibe/kZtlSV2sp3Bv+4D9NiaSGu1oVClPgblIHKBRZ1xao4cdP5btpQdoZBkkVMfx5Idqii4yViiNL5Dcd5WpNmm+aW+Wa9gG7sPcfYcKIkYGxVCE2LcQGwzsHtP0WRU0qiStZ1tAEWPQtPKylSejIxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osCb+6pgVUpxWYsjmRfWxfr1/xRRUbXBc/0qCHxA93A=;
 b=hSO9YwWKZiTA8E0pzmkTRitYkh6J0Tq5QiVFqZDoVF8HCdhPhGRMSOYXiAFPHbCMnmcqHo38yEsgAerId1Des+OuQSBwEB5LhqZHW1AZqwDeJ5KdV2FhEMwI/OHA/VLxEKpGNNL33WB9uft3roYPUR0rGtzjtdZgm8JVNgAwppXw6PO/5CYYUh94ab2OuASnHQ5y1vvL7prh8jGWh7jQjt5MrU1dcShcdCWcftqlylfArH3NqPstL/g/+c7dTHC3bHkXJhPK2VO4vR6yAp6cTu8VEbUJ+PVbNnudJW43U16ga4e0/9lr2dzFowdBEf5vsK5/mdgbFDlNaVKYeHMO/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osCb+6pgVUpxWYsjmRfWxfr1/xRRUbXBc/0qCHxA93A=;
 b=dXGRyuAjqZm+gb1Utlq/VOGYoadu6r90BbPJ8BH8Wh+POzKV/KnXa/g0KZbc3548b7o2tGOQA1xaR0JTw7ovYhpEvtfObOqw7QmFa7iKT8tJB+3wXXgFXeY/P/vru5jwk4lI4AJ7tE8b+C6TaZzMcGId8iq/RDR/u5JLUWfLZ/MX3/scUTrp2G6fnrQssmGgS7pezSJ92wI/uYGVdr95zjANYuoMvBUN23Vk/dI5dBnmqZZGYlXgoVhpoDy2rXpqixCEocSMihBeSu06OlWcZS4Y9jSkPeLEgrbU3FADTIO/cdrMWB8MrKjuUvjH0SW0x8KlK1q9cXJGkh1m3swL5A==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PAWPR04MB9813.eurprd04.prod.outlook.com (2603:10a6:102:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 09:38:49 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.011; Thu, 18 Jun 2026
 09:38:49 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 18 Jun 2026 17:41:35 +0800
Subject: [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single
 quotes consistently
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
In-Reply-To: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781775717; l=1047;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=zNzYP9u3XqOMdyMLqeZJ0XaI9bAvZqPI2frAeWBun4M=;
 b=7bidGbckTd53GMu6cV1sH3jdD3a0bi9HyIM+RukJTSPqBKtGA76LKAslgPCPpG2mRrryrZGX2
 D9S6T1q/TqDCgnJS3uRVAtXDG48MphpbKb7ZlwTUw7lDtF6ooCUenZz
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::10) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PAWPR04MB9813:EE_
X-MS-Office365-Filtering-Correlation-Id: a105c19a-4bfc-45c7-aa55-08decd1d666f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 HNgSdhqTfDjEJyK9Wq2Oit18OsX2SyuLKUVHkwd1L/UAjJ6nI3XGcvQS7wQ21nPVSzJMTfyr/CCtbsuYYo8zxz/SB1QK7FoPMIzdsLjzR66maEbbZg+mLfSxUq9ykDdFrQHQatWBXS3SAkzEQ9SDdF3YComypH9fark7ITgGUWiQoyI50as22JKyZHCeIlJrWNiob28F6fxPywcbpU6cTFIpa1eIK2mWuxEQl1TJdkqLMRQmq4H1glxauZ8c+3fWiYkndAAiDk5CoAVSDeeB5vSG33ZQ8OM6xkpxZb9PRnkf2B3htUZtze84yKcLob0XW8ZkKuBFzhV6AJ/7yci9zwpBOg0t+wV3haltAKkZq4KP2U12B7PGYDP5mUlbJ5PEKidSOFSQQqPIzFp8Qfapbsauz6nAfCLQpKJrlsMgUnmdMD625rD/2auu256r0r++90RfAiLyhaOFp566J3UNCaKe14ENZCFMu/mbB5Zo4SOUnPY7DzZeiRUpFmY6nxgSvgR3QV1MVfeQYTyfxgDAvIeyDhR85eMeIB5pDRNXewtmIVo4zofmOH9Gs6csnnSaUu6IALSLWoZIAXTJTllchn26HElR0uvTgnkXs7nCu0Y3KDxAPKKMCtB7CBf9MEkE+fTkkz7oAO8vzqq/Rpue17peLkFRSCoYdlcOX9uisjCCGLJj8wro34+pm4rLpYLW0UkIQ8IqMud2zzLVmMKyc/p5AymC7OUluL1SQ/N6g3I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N2duaDE1eXQydmpvOXI0TWdIZElLK05TdWtGZzc0aXpjTytMVkJ4L0crY1lU?=
 =?utf-8?B?dDlqUzN3S2VwTERSNHdEY1E2ajBpOElTaDV6aU4zTWo2WTErbXY5TTBrOXRr?=
 =?utf-8?B?MkJBVjV5YXdIYWNIZ3diU2c1a0x5RHJmaUVZeldKMCtUT0x2M0RIbjNYaDdI?=
 =?utf-8?B?ZGE3RWFMeHBOT0RNcWVCNzhsSHdnWGJUdS9USHh1UGUva1RiSXV5OTQxQi9i?=
 =?utf-8?B?TFdkREZ5MGRJYnJoWEpoVlNhanVuT3l2RTFDeGtGSWdPcFRyQU82UWtOa2gw?=
 =?utf-8?B?TU9VTnlsVDQwcFpDRE9wbEtveUJHc0JpYWo2RWpITEZweGtiNForM1FpTWp2?=
 =?utf-8?B?RWw3TmtpSTNDdDJoa0doYUtUVDVDZmlmWkhGTDRRZjYrcW9aclp1WU1td1Yx?=
 =?utf-8?B?K0ZXV0dFZFJoYzN3R3NqUUVndUdVM2N2SFJLVExWMlJvSFcrOGJ6VjRDTWZ5?=
 =?utf-8?B?V3RobElLeE1VSDREUCtsY09ROUJTbDVyTmNaTEIrWEQ3cEI1a3pOQ0JRc1Fh?=
 =?utf-8?B?bGtpaXJNdE5GR25NcnRBanZPU0dEZUtNMFk3aG0vbS9ybTU0R0NmaGprYVJL?=
 =?utf-8?B?ZVhPWTlkU21ORnF2MWJWNW9pNXBKWFpiTkpldDA5UXU3N3dFdXliZEphcWRJ?=
 =?utf-8?B?bGxYQTBJY2NiTUZmQUZDSWRTQWtmR0lCY3NKQ3d3dy9jZjdIM1VSaFRzczFE?=
 =?utf-8?B?NU1VbXBiLzlqVElneE9BNW9LUUlVWTMzVWhKNHMzd05YUEZMOS9ZMXpvNEVs?=
 =?utf-8?B?VkhWdUdPWHgzUXRnMWFiaGlOUWdEci9nbG9LUFNoSDROQ09XVkJnSW9YbWZE?=
 =?utf-8?B?TUtJYUdDbHhWWC92Z1VWY0FwTGVyZ3JWRDgvekRqWVJvWGJVSmFtNFI1ajU3?=
 =?utf-8?B?Q09vbDJ5NmVRNHNrcjRBTm12Z09HbXpPSVczRFZkSjhYWmRaWStYd25aZGxq?=
 =?utf-8?B?WGhrcjR1cVJ4eFNiVGFhS2lLZlZjYjNFeElQaVpVV2g3MkRxVHRJcFVxMWwx?=
 =?utf-8?B?UmtIVjZFRjQ2VmxGajlJZEFUeUVIdllmWWEzdk9rZWpaSzJyQjd2M3ZONGJ5?=
 =?utf-8?B?SGJWajJGVzRvM1h5cXdWOVBIRmNrSTB6Mzh6R1dyenhwWE5SYUhBTWhubXhq?=
 =?utf-8?B?THdzVTFBNEdSc2FGczU0enduM3l6ODFjdmQvVVBKdkNzMi9UZFU1SmhDZFgx?=
 =?utf-8?B?d05ZL0FSR0NoSkpDS0c3SkJOckp5eDRNWEdVYmVpODRpWi82eWt0ZUs1ZWN5?=
 =?utf-8?B?RnBRdGpCVWgxcG5LZzZUZ0NuYjl2cy9GN1VxVXVQRm95Q01lRlJPQXJoT1Zx?=
 =?utf-8?B?QU02NzVPZ0pBZFhBR1JwWEg0UGErYnExa1A2bjhkbkYzcUtlNy9EUnkyOS9Z?=
 =?utf-8?B?UDdXbk1vZTBkU2prWG0xVGVYS3VJZ3JJQlJNMHBxZWxvclJsN2NHUEk5cGxt?=
 =?utf-8?B?TGxmOVVtdzVVZk43cmtLZmw5MUIzaFd1U0xJaXE1VVh1aXBiaThHem43R1ZR?=
 =?utf-8?B?dVJJSk9Cajh3dTlwL1d6NGo3YmJwYS94eGM0dDVaVEw5bVZyOU02UjNGOGRp?=
 =?utf-8?B?QzhlR040UWJOL2ZuL2pmWnpLMmRsSkl0WEFpdzVtbURLRlphckQwV3gxT1Q5?=
 =?utf-8?B?UDZhbWdLSTZCUUxWVnFoTnBkMzZtQ2FYd1g3bVM4L05temV5T3RsbVJQL0E1?=
 =?utf-8?B?MVlEaGVvbFI4RG94M3grWG01VGNZdXQ2YzFXSXhlZ2o5dGNocGxxZE9EVFJv?=
 =?utf-8?B?czlTN0tYYVBGeHdINHhCV0tLNDJDZXFDNjZuUTZORTBOZHM5OEZ5dEd4TzBs?=
 =?utf-8?B?QmRjWXhxWUI0ZEgrK0Vrdjc0OUFVcE1IamMzYnhJcEtEbXRoZGYvODVwRFZI?=
 =?utf-8?B?NGRyMWZnd2ZvbDRoSjZSM0NQUGVoRzhEbUZpM2ROTEtyZDJhQmQwajFHVWx5?=
 =?utf-8?B?dDk4VkhhM0RMZTdrTi9pcWQxQWx1dElXOFRycThuZVNYQ0N6ZkhtcE84czdh?=
 =?utf-8?B?N0RpZGN3dWhWcEh0dzh4RFNSY1FRc1I5Z0ZMNm91TUl5ODQySmNOMHliMXYr?=
 =?utf-8?B?ZENvVjI0cXgvM1R3bnVKeXZzTE5nRnJpaDJvN3Zma3hUbUJydmlIeE9oQXdE?=
 =?utf-8?B?UjNBZ2NxWGQ4dnNVenNId3dQeEQwMzI5YXVmRHRiMy9uRUMxL0pFMGQrR0x1?=
 =?utf-8?B?dlFRbmljN3BxcnZCNWFSdVNsbXdDNm4zYTQ3MXpZKzR2TytNMkpwbWRKampY?=
 =?utf-8?B?dDB4RUFEaWhER2NxTHJKSHRQS3lsRk9vaEpUTXNqTC9MYWw5bFR1a1Rua2Ru?=
 =?utf-8?B?ZitXajZtNU5DMDZkdFpFR2lWUldOWnU3UWhUYTFieWZwc01qM3BHQ0hTT3hH?=
 =?utf-8?Q?ot9pb5Q5zOu2TKmVoBJB3u19LmQ1aGyNt3FxP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a105c19a-4bfc-45c7-aa55-08decd1d666f
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 09:38:49.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOED3YI6RRvd6/niOE5bacOM+0U90cwa/IuhmUH48VfN37f1g0xt9BIDDAg7WPNRiIX/NgTFbOqsFOWcL4j43I7e6WOjABhV8jgydTrziffyU2IeaOyOh3v2EKh6DAvp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9813
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65157-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:laurent.pinchart@ideasonboard.com,m:frank.li@nxp.com,m:abelvesa@kernel.org,m:peng.fan@nxp.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:imx@lists.linux.dev,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:guoniu.zhou@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[kernel.org,pengutronix.de,gmail.com,ideasonboard.com,nxp.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,nxp.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F8B869EF4F

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Change "clocks" to 'clocks' in the description to match the quote style
used for property names like '#clock-cells' throughout the file.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v10:
- New patch to fix inconsistent quote usage (Krzysztof Kozlowski)
---
 Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index 27403b4c52d6..534fa219d9f9 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -36,7 +36,7 @@ properties:
     const: 1
     description:
       The clock consumer should specify the desired clock by having the clock
-      ID in its "clocks" phandle cell. See
+      ID in its 'clocks' phandle cell. See
       include/dt-bindings/clock/nxp,imx95-clock.h
 
 required:

-- 
2.34.1


