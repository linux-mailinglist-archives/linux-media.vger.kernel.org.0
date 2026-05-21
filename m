Return-Path: <linux-media+bounces-62426-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EJKJgvODmqdCQYAu9opvQ
	(envelope-from <linux-media+bounces-62426-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:19:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FB15A22A1
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 11:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2EA4E303F599
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 09:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AD536894F;
	Thu, 21 May 2026 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ifV2cdKa"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F92EBBA1;
	Thu, 21 May 2026 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354454; cv=fail; b=ADZPiDOi4YEqsumxAKbARnRJHaiIYGijYw14NbPSulXCtZiBA0asQIw0MQGlMNgvXtkxPU7cO2VHejmt9466Og6mH+MrbnsGqYjtDpQz8uJ/xG9I2Qym56eOCneLZ2VlgouDrZ1H+CXNNetKXoIijnoISIILpAWVgrHLxw4oSa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354454; c=relaxed/simple;
	bh=1GY/hFoszDjN3fBzOmp7PdQxWWOmAH9I5JCMNY8I65Q=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=G/OeL9SprTa/BCPXwZa+38/uUdNFoPaRtjmKp7LOfbOpN9wesD3bY1p0n6thZQIhFrqs5pqMEOVSWDNUArhTiv/tLWloFy9iHgs8pj/uCtEVkicaEaNO00aCEa+WDSf+0Nme/Y097gWDuzjG9bn9qYj9mpHbANIwqOGQU+J0yYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ifV2cdKa; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSh4NvYaWo/O2sNGgQELDRv0eZGmFQgkcsSmEliffJTgiT9XednRwKHsZt+FKd3BVfaojPurexUBf0g68KpbwGcdJGGS04JtlGznoHl7yRt27cAyPOVdSwiJCrLdtlZI9zy401obu+XSDV/QTClQ8b35dtW9VAsLJCQXFUholODQdSnvo9NhuciiY3M1evguVn2WoAY4XBmv3wSLUKB7MhFxb8778c49X64RAWfe+J/cb/7KTUgNMxmZk2vughJjjap4qeiYE6e14xwMzEzdIc+voaySKqlFEe6fXHsWd1Vy/GGZuwT6ldOvO2U+QH5QxFTsMMHw7Je338mLgumZzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAIf5bmB9ujfIX20EOJy3Q/SpkqNl4I17bFHzz2hmvw=;
 b=iAgXlriumtlG512tZem65UXOIy4HYd2j25I6circIPlMW30t5nz+JqD18nwRKKxSvm1Z5bf6xI9M/sezXdV9ozfzelc/RNOK6ckSCROJ6CYI+xFUqW5czYZcKUi/DH1p6kb9JbXeT6Q+RYCYvm93p/jEYvRfD16EvCyF6UpMK5EoCptcM+LzwEDrkyldNPWMuXelvf6Gmv9xcDrlHOB5uxxkL2taE+x59LLjomE7gvtOO8c/PtutXP0E0XsklNAN6ZAXk+q4rcFSkLW6qjE0My9hYbLbiQDd/6zm7AxDEmwAQoYwG9MBTqXABYQ71ySTvt3O5ZRPnBcgFabdFHqBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAIf5bmB9ujfIX20EOJy3Q/SpkqNl4I17bFHzz2hmvw=;
 b=ifV2cdKatGJgbDHU9wyH9L+gMSo3udL2GrkE/m3Q9D/jQfTmw7llBjVV8xAk4Fx9VKHn8NMMv6ca9vhOEaqAfCHyk2kFPZo6NdjEmJ/OyiG3K9xGHmyVhV5eQQWgqrooleKGPMWMbP4Sa0INF1kJ33BMRlCZT9Gs+MRCJO+mUnhEMkWARM3cvyvn1E7MsCw53lfG3CYsVQRKz/SMjv1+reqUiGB38LZAGdpGHUqL6/jXOucYkAU73PSpXbWPRDF6LA3fXUtT9/7K1e04qhw2WZotYbme9D0LwR7GYE9zRimpaBqeFEP4cFSNc0a1WdM/7C1Vmm4jbFCtZ/w3dLMhPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS5PR04MB11467.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 09:07:28 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 09:07:28 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual channel and frame
 descriptor support
Date: Thu, 21 May 2026 17:10:03 +0800
Message-Id: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOvLDmoC/13PTW7DIBAF4KtYrEs0DD+GrHKPqqoMDA2L2Ilxr
 VSR717qSEnc5UPzPWZurNCYqbB9c2Mjzbnkoa9BvzUsHLv+i3iONTMENCDB8TrxOQeOVqdohRY
 KiNXh80gpX9ei9497HunyXaen+yPzXSEehtMpT/sGg00kklCoILY6IQCSMB69cUEHjNhSVCKwv
 65jLtMw/qw7zmIt+7/OLLjgKYK3IHUUIR7663lXf1sLZnxBAh4IK+qCT20bvSWTtki+ILQPJDn
 wDqR3nakniPYwlLLbQPWEGp5QVZiISLpgpJNuC5dl+QW5N/KbjQEAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, linux-media@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779354625; l=3377;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=1GY/hFoszDjN3fBzOmp7PdQxWWOmAH9I5JCMNY8I65Q=;
 b=90T5F2lZxc0DNOlSzgFkwJSvHoqb7Uv8FRVRUPMIlzY+5EFbZ0jkrzfp5D0REO7ZFV262eATn
 jZA2tBzxCijDgNOlNONMaUbyZWOaNsXH5Ep4KjdyvFX3pCdLOh53AS8
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS5PR04MB11467:EE_
X-MS-Office365-Filtering-Correlation-Id: a73a08ef-f27e-4b57-6b18-08deb71861a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|19092799006|18002099003|56012099003|38350700014|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
 NW3aZCGtI9WbkyW4JTxCYksKg6k39xt+O7yIhDwu5/rdT+XBK7c/guGntDUDLXmVMvQaWg2rf8b/T0hbDC38BH0mDRzQlJj/BFLZn1MhvJvyGbe83zaefFYS9fEgOExaNG0xkP5pLOdypRSfkmzTb3xb1FfuG3KbZwwLCiw+24+TqV4fqrTiDNYqxaHIViUyQNCCWLBytM6dbcp3gz+kYjiUEJZHGbC5oLJzzZ7KZTC/pn6mx88SUil1rV6FjLtuKaDTpWhBaTRqrvSQXytqbac3QimD28XLJXTOu0aTpJfENYeOOcSvwRNuAFhiOLA+FD+Q6iu3mQuoyz6v9dckn8g/qzHmuStUiMhlGOtGqXAXv5c4ZsYLL53W4sS7mgG+iwFbJW+tkJNH8REwfY8sf12AHY7oOob7k4xOT0Fi9VG1+vH/qXEAyXpJYZdbG3R2TFkqGyKvxR/ARhjybRkqeb+hg+NHW/3WcDbUgDwj1CHOhljYaZIxsm+XkWyn7+qoFIX5fZx8tLzXuzctLZ3ZCToLXPpEjAdc78CoL50rv8o/h0SmlyxR8FHYp8LuKqudrQihevQSGBWWoWmWjZlQ7IEY+UVXKgTZg8b57qmCvjURAeEQ9aK0E4aOYFbsoPHKhHUCvPkPIy4nOiY2K89F8Y+AOgp67qkN4KDkMPKHAVi4IlN/bVJ/L2fRGmdmpWWcC0QmIsr+EOvGjL9Yv1KcmVG4sudtTOUGAimxb32MupQmRrW8i/lVUQWSzeKpPVg1
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(19092799006)(18002099003)(56012099003)(38350700014)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TXNUZzAyVFh6L0VMYWtGTG5nKzFCcFNuZTF2MzQxaDRRMEI2cjZpbyttSkhx?=
 =?utf-8?B?RUY5WFF3WlpKSzdkOXZDci93SWdVM3hhR2JPOEY1ZkZwN25LbU0yQnYvcGNQ?=
 =?utf-8?B?VWdFMHUyL0ZpL2JicUxVTUlucTR3MFJQTjNtaExZZ1pVZUdmblRtYkNkcW1R?=
 =?utf-8?B?TlFCdURpZjJ3UUVEdjRRMXVQemRKb0lacmovN1hzd1dkYTV2QXJVV0lyR0Nv?=
 =?utf-8?B?SUU3MGxJdWNmb0IybEo5WjRRT0JWTEZ4NS9ucFJWT1hoTWh6WTFSb1BuQjVt?=
 =?utf-8?B?cUdJdjk3aWJDN1p2ZmlGZkx1RlhrOEhSZC8rZTRCRHlxd1h5V0hLbStVa3Fn?=
 =?utf-8?B?V09FWENDRERiREgveFVTU2JkQ2c3bnhwQlFnYWw2R1VuQ21rNkpvbXBVSFVI?=
 =?utf-8?B?VU1ZS2VvT3UrT0YyVCtPWWVOMVBjMm9OSjVpK3JHd1lTZlpXemZ1MHhMRk1p?=
 =?utf-8?B?UGJ5aWk0Um1RdFJBeXREVHNERzNGR3dyV2JuSExwekp2Ukp1ZWFPUERxaWRj?=
 =?utf-8?B?WVZYMnpTdzdPTnMza29valhoL3orbUFZYWpDYkxVTCtmVk5YV1gxQlgraFM2?=
 =?utf-8?B?dTBhZW9iaVhzZU5vajlDaWE4bTdselk3Y2NXZUNtUTE2YXJwSjRJTUZ3d282?=
 =?utf-8?B?ZUhRWXZFc0FPSkhNbngzdXRYbGRQSWZWbUdSRDBDWjlzc0s4ZktwdGtGTkJP?=
 =?utf-8?B?MXJ6T1NyanNvb0dUcVhsalF4bjNLSUtsa3VEUVZ0THhqYmlKVWIwYjFVY2Er?=
 =?utf-8?B?MU1PRE1JWWk0bTJBWGN1Yk9FbkdONStwaWFDL0tGVTFobkF4bGtLSjM3UlRE?=
 =?utf-8?B?ZFIySS9NWlZPUzZZQmNaak9EcEl0QlJSZ05VNC9WSlEvZHRkQlpCYS9tT09T?=
 =?utf-8?B?RCtRdVVLR3ZTNkJGb0drWTY5OUFRaEdPZVV2SURsbWFnb0pOcStSdjFIdncy?=
 =?utf-8?B?czNmMnk0b0tzaHhVWGp6cmVLT3k0dUVkMmVScHhnRzc2K09jcHc4aG9YN3U5?=
 =?utf-8?B?QU9DdFpkajZaRGg1S21PcEU2b1pmaVV1cGFhTGRyLzE5alljVzBmb0tLRTVi?=
 =?utf-8?B?ZTVEeStPQzRHZnQxdkh6TkQ5eUJ5a3BkcUFkaWp6TTRTQUNFNVErZTFsalgx?=
 =?utf-8?B?d0FpcGtYUFo2bkswOXJOTFc1MzYwMnpKek4yYU50a3IyUEdyWHFiN0N2RDhI?=
 =?utf-8?B?dFlQZEdPT1hPMFBRMm90OWs3QXVwQnFwb1FNeSswK2dNdzZFSmNNam83RHRT?=
 =?utf-8?B?dnBzeGRXWTRnNXpDaXJlK3M4MGYySjRWTWlVbU9QaHZmRjZhSGxoQjZXbXFt?=
 =?utf-8?B?MmdnSU1WTlkyQ2NQVktONUJJc3lvZDBvRTBZbDQraWE1WUltb3lvNTQ0RWZC?=
 =?utf-8?B?TUo4Q0NEZjNjTlRPdU9XMjQ0a1c1cGNrNzBCdTZXa1o4TUxwM08yZnBvbE8y?=
 =?utf-8?B?aUFNTlloK0h3TTZmekJsVG1nWHQrRXVrSTlVei9TTXc5T1ovOVF1LzZWS2NJ?=
 =?utf-8?B?N2RyOWU5RE9NWWVxRVJKSi9DREpmOGpnaVZMTkFzRWtkTGxhQzJvVVk0KzdU?=
 =?utf-8?B?U1FldmVyVmZyRlhGOTl1Ukw1ZDlscmJiMFUxV0VldVhjWUdNQi9IRkF5cU5G?=
 =?utf-8?B?VGRCU2pueE1VVE5KTEw0MVNOMkFQaEh1ZWhqalVGMVhua21EbzIvQlFaeVRN?=
 =?utf-8?B?dEpjTnpsWGJWbHk3cFlpZVZmT1NyVjdCOUR6NkM5ZzBVY25MZWxaVUVyYWpI?=
 =?utf-8?B?aEg0N2JiS0prbTdzV2Y0VExtWG9JaDJWYy92ZVZLRzNoSFRJMnRXcVZMa0Y1?=
 =?utf-8?B?a2JQZ3pDZE1vVTM0NXhFQThhREsrNTFCYjRZNDE4SmQ5dXlEVlVpK0NtRU5m?=
 =?utf-8?B?WUw2NGE0VDkxeEJuNHNBVStXSS8ydWttZllyd0FyUVUxUEllaTVDK0szQzd5?=
 =?utf-8?B?SWwvdmgwZ2JScSszUWNkT2hlUTRaNXpsWEwrOGdVaDN0enByNUh0TElZRHoy?=
 =?utf-8?B?d0taMXZEbVc3NDNUSE5hVzVpUmFpYU01Vm40TEJBRmlsbUN4VVliSnh0djQx?=
 =?utf-8?B?TDRjSlhuYzRZcENIZTd5QS90MDdabTM4TmFIY1ZqaUZST2J3dXl6MWQrMzYy?=
 =?utf-8?B?bnJaN3Q0YVhnOVlXRVhGMGZ0R3FCMnpEWm1pbkE2Q2pxTHEzZGVKQ0ZPWG5s?=
 =?utf-8?B?dnphYWRpazJ5M0pMeXhOb21PZzFJRmFYRlBEWEJ2Qk1GVE5idGliZFBaZWpD?=
 =?utf-8?B?bWhtd1JUTWQ5RE9zbHV4NzFoVDBVRnZJbGZqdXFEU05UUWtYa0xTZkU1MHVk?=
 =?utf-8?B?ei93MkFYMWtNTjMxQzI0RE51dE9rWEZXRVpqRUZIRTdiV2ZzcEJyQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73a08ef-f27e-4b57-6b18-08deb71861a3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 09:07:28.0748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7mSKOzxj6DZKu8RObiB9ovF7pWGIc+wnGkIiO1RfifJHaMwwA8RaBPxooITKTfbgqSSvInxAxZMUXccqVoszA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11467
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62426-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 99FB15A22A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series enhances the i.MX ISI driver's with virtual channel
support and adds frame descriptor capabilities to the crossbar subdevice.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Rebase to latest media/next
- Swap patch order
- Return -EPIPE instead of -EINVAL for stream configuration errors
- Clear VC_ID_1 after generic mask to follow generic-then-conditional order
- Pass vc as function parameter instead of storing in pipe structure.
- Drop get_frame_desc fallback as crossbar now implements the operation
- Remove redundant num_entries check in mxc_isi_get_vc().
- Set vc to 0 for M2M as it doesn't support virtual channels.
- Use v4l2_subdev_get_frame_desc_passthrough helper
- Rewrote commit message
- Link to v4: https://lore.kernel.org/r/20260508-isi_vc-v4-0-feee39c63939@oss.nxp.com

Changes in v4:
- Rebase to latest media/next(previous dependency now in mainline)
- Fix VC boundary check: use num_vc (virtual channels count) instead of
  num_channels (ISI pipelines count)
- Set VC to 0 when frame descriptor has no entries
- Move platform-specific comments to block style to fix line length warnings
- Use %d instead of %u for ret variable in error messages
- Fix potential -ENOIOCTLCMD leak by resetting ret to 0 on continue
- See each patch's changelog for details
- Link to v3: https://lore.kernel.org/r/20260328-isi_vc-v3-0-a03b9a6fe117@oss.nxp.com

Changes in v3:
- Rebased on latest media/next
- Add num_vc field to platform data to indicate VC support
- Clear VC_ID_1 bit after reading CHNL_CTRL for proper VC switching
- Set VC_ID_1 only on platforms with num_vc > 4
- Improve mxc_isi_get_vc() error handling
- Add back CHNL_CTRL_BLANK_PXL and document platform-specific register fields
- Add xbar get_frame_desc() implementation (feedback from Laurent Pinchart)
- Link to v2: https://lore.kernel.org/r/20260310-isi_vc-v2-1-acbf77db8e6f@nxp.com

Changes in v2:
- Add Rb tag from Frank Li
- Fix typo in comment(s/support/supports/)
- Update commit log to include more details about ISI virtual channel support
  on different platform
- Include bitfield.h file to fix following build error
  drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h:23:65: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
- Link to v1: https://lore.kernel.org/r/20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com

Changes in v1:
- Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/

---
Guoniu Zhou (1):
      media: nxp: imx8-isi: Add virtual channel support

Guoniu.zhou (1):
      media: imx8-isi: crossbar: Add get_frame_desc operation

 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 17 +++++++-
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c |  2 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 50 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    | 12 ++++--
 7 files changed, 80 insertions(+), 7 deletions(-)
---
base-commit: 2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c
change-id: 20260309-isi_vc-285fd815140e

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


