Return-Path: <linux-media+bounces-60544-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAm4IJAC+2liVQMAu9opvQ
	(envelope-from <linux-media+bounces-60544-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:57:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E14394D831A
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 10:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39CDF3069D0C
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646433E8C64;
	Wed,  6 May 2026 08:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nhabj0VI"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7653233F4;
	Wed,  6 May 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057508; cv=fail; b=OkPhCtzvmocBVdyNvXCyW/NMZRiX5PMrQhujNFaj65fIkejbQttENfPSBlE5mYtqo9EFq9/7Ba67XL+GvNwxMCbQBqz7DIVsflYYy9YrTa8J2yKxTUGfWe59YjGqht01tBXRE57gKv3XE6ka2nsJMK82i8dJD1PVDH4VzZKXlEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057508; c=relaxed/simple;
	bh=uh/7JQo+FsK9qFNgIBVtaplLH1ca70SbvuXDxJTTaiI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MKX/hC6ouIydKO1dRLRpdweGZICzC7HHAhxjGhnhmcgZiyNf5qVHiSy+vn8UUI8hu0d8RozsGVvzG2kI1LveOLvJ0z7fTvvPbEeQ3bGrzDUG4rvKA2VIu6V4wd1a9sTCtnIsZSvESuW8POMl70Ql8peNGm3NKE5f5X6yt2RYcq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nhabj0VI; arc=fail smtp.client-ip=52.101.66.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZF54l2oQ+ZQynjqR0/xsfdSMUZw5tNEZqYxNISYuXVtJtZ7Zo93U92XpOexSOXz2pzByZXr9bCRvnLw+6d/qtt2deOgPBG1gyl28p1ToGcU1EM4+QUCy84Dj1SbOhcv/78X1wXWKANiGXhL5CNtp1D6fK1IgFANCleZv6m9+ZMWBvOsxzTecljeOJ1TRt5ZmPdPYWqGGm7tH4fZ0c+4A6KXdwjke4fvWo3ZY7FIA3NszfQ/K6lvK2NBwxVYaxjjXFs2zBbHre7CI0iJ6fKuqTXC9tTX5parytzQaweUf39J9wz3i/4sul/Bua+71lk0AMN0tfac2efcAn3XEaNqUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0rqxRO6QeP0IK2vFrxSGZUWz6a88Xzli7wMghiGwcI=;
 b=ETj2RwRbRMIimz5EcNsVgoVsVvBOJjyheCcjJirhLD7+WnQUV1/kwm4euVP70VeY6W4zFF6nie/Wioa6roP8LuNzldNmsLPn0txUSAOfv5a8fI7uviakDnKbHYoo5eM0z/D5s4RCKWZu3zR+DC1xIGYGZO4+TPT4D50357w5Xs8POqgAMZvk64X9A0nOUd0hp6HG3ifQJ/FFU/oyYzOmqmcbgRBBe77TF+uPlO5GsuKiGejNOt1N3648Ekz/O7OzvRgFrgtRmkpTYyw+TYh5zedWqesxkGM/lVEyVlHiayh8q8UzaElHiFAlPB0XRuCG8v4Ms8HcH6ZI40wxSheg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0rqxRO6QeP0IK2vFrxSGZUWz6a88Xzli7wMghiGwcI=;
 b=nhabj0VICF12VghDo0BmHyLyDjcqsT2XdmrjtlTXzNN12m5qaoJnxKo+eMXSfqjeGiA5uAn3q5AL99FWwWyKyOhWiNROOoyr1gs+wzqZBZe6gOcAJSE9saKengvmAgc5QOhJp32PyGwtfJpiUG0LTsf0j2I1kqGQ/3lBoiPBwUJp0GsS0x4dTbJ2Uqh7+VzUGK1Hjh5hQ2xpwQ4+HYrou/bCZp7mtdJ7XrcPBWpDWpAwZhEHMF9x/3MNeOFekbooCb//EpgXJOW1l9ZHXbx3d5+4wFz2Cd00GkUAEhx2EYfWhjh0qF/ttUWAogpEJJ0q/RdWrv32OlAGycl2R3ZYcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:51:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:51:42 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v3 0/7] media: synopsys: enhancements and i.MX95 support
Date: Wed, 06 May 2026 16:53:59 +0800
Message-Id: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcB+2kC/1XMSwqDMBSF4a1Ixo0kNw9rR91HKSXEpN6BRpISL
 OLeG4WCDs+B/1tIchFdIrdqIdFlTBjGMsSlIrY349tR7MomwEAzySW1CeGFw9wqqpXpmGu8Fsy
 QEkzReZx37PEsu8f0CfG725lv759RRyZzymjTaeGFYteGt/eQUj3OU23DQDYowyEGcYqhxK2Ql
 oEXEsCc43Vdf3Ewk2rjAAAA
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=2687;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=uh/7JQo+FsK9qFNgIBVtaplLH1ca70SbvuXDxJTTaiI=;
 b=JvdxpWEOfNdFRe7dyaxxFs800A8pWCCgFCOd2YJ4/k2cLUop19IJmadKzCwhiqqoBBAzOI+3Y
 uf8Cws6aajaBA13VWVL0nKlBHA172JEtHRpauEa8sCvS0KIe1MLGsSP
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd40f73-9638-41e7-d8c9-08deab4cb1b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 eg7c5OfWo450zHBRK7KpoNjXCeEhL5Bjnsl5pE2b72eslYIynexz3S7SzyRePV7PTqh1TpwuLbvQZgcjMkGCb6wfa98TKCpHtXDmhFYEcmxQV0lu3IQeoNc8QOD/ibKx90yZ1e2B5il3zkLznYJXmra0xNzjO0CpkYqMVMuroflcUEY7aYi0D+dYlioH5hszQgPZ9wHp1TGnY/sBdPcxnQNxZKRTZ4wVIJQ4kDT/kcn8he38oqmIGNQDQouPMfrpgqDzo9HkBo33jpF8n19knzaznPtdBO64Pjr+RWjdbNAQUiUek7cV1djEhxQnGoYMadZd9ZF1ZS4O0VO64LqA7lMdMfhBwhOmFN3CMKeBh/AVV+8MJH+QYOpRrhrMItTx4XGfsCwZDxa+wT+e4opY6aAhTRflxe4smij/Cl7evqRDlvDdK+82I6Xj+kUGO0ed8AK3k3bHk/GcEBEqU5crzTwmv2nV4exlCErIA6CkXfs5W6RC58LiSdcviB8qFc4ADivH5HCoC6uoHcUxe4pmLsHLb0GEpwfdwDv3AjVKFTLsNyIHIlJoRsnQVGVDR10cO5Yhcfo4U29HL4h3LUzBZxbDdprGIrE0yxz1DkcT/byRYyUzDYq6XVy7sMSTTAIw9vs9hRTUmWWnpIm/f5KEOt67aQYfjq1zDg6CbpYZ3pT6WRlOCuZegtHhxG/2MeieMfZ3gS7OwhN+rzFkqfkmfQXak1WNGWHcLGsYuVOF9U4QEeNPK346yaY2gqwXeSpRKjZIL/9riLNSs/cNqVk6Cg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ejYzU25oNDZnc254ZTdjb1daNFlsUzU1OStKbmhkaWhpV1MzL3pOZTFIQTRG?=
 =?utf-8?B?aFdlSU1aakJ6ZXFHM1pod0VWRzl0eDMxYjlmNnJLdDVnVmtoeDJEcGUyZGJL?=
 =?utf-8?B?TmtleUpwNUxvNHljTlBuV3dOdEp0WUM0cEUyR2FQK1BqZW5DRlFEVi9ZSi9n?=
 =?utf-8?B?bXRkbG9ZUUd3dWxxM3ZKb3hTZGlTOTVkOXVZRUpVWDg4d2JpdzJSUjNLV1Bi?=
 =?utf-8?B?YWpaaFJWUnlVNWZEcXlndysyeGtscTB5UEFXT2J0TnVLUGRtaTQ5TTdMeEM1?=
 =?utf-8?B?ei9Lc2FWVGdQbFMxTkhjb2ErcUxvdnprWkVnSnZBTFV4Wk9yS2dkTFZ1eFFi?=
 =?utf-8?B?aHRwdjZxWERCQ01tckdmZ2hlQ3RVd3VEa2RvQjJKSUp1VTB4QWl5ZnZCYlJC?=
 =?utf-8?B?aFZ1KzVpdVVHYmFKbE16TU45YndRbVpYL2NFSzkzRDlNclFvTWphRml5cVBp?=
 =?utf-8?B?NnZjY043NFdhemwrcmR2cUZiK2o4WE1iait6eVp3Q1l6Z05ES2ttbkRkd0Np?=
 =?utf-8?B?T2swKzdCZWsveHBKUHNjeTQwaHFpWXB3VnQ5WUlkQTdTd2k3QXNyazZtdVRC?=
 =?utf-8?B?bytlWjVId2VRY0RWSkM1QjZFSnZKZmY2V2VvRnNleDFuald1VTZUYzQ0b05Y?=
 =?utf-8?B?T3o1WVN0TkZtb3hIeGh1ajZhNllBMlZvdk81MmJpNmorbENxeHpPdlppMWVr?=
 =?utf-8?B?OFN0STkwVlZuSGl3OHBQWkpmODA1OVE2UXJRNDZtREQ1WVllYTBsbTd3RmYx?=
 =?utf-8?B?S0hERzUwdjA3dWgyaEE5T29VbHRNTitRUURGVnBMOWF5M3JVeFhyaE96akFQ?=
 =?utf-8?B?SE55VHdTNmVKYkk3ZjBibm5rMDI1UG5IRjZIaHhCQUxVbk83VnJQYTFpNzhn?=
 =?utf-8?B?WTg0VXYyY0ZxVGRUdlB3cEx4Sktjdk1nUHFKbDJUYzFqcmdqWGF5VE9XbEhl?=
 =?utf-8?B?b0pWd3dHM1FncXJCbmVBTW9vNkorMkhHbmRPMGpxYzFBb1g2dEF3ZzBmQXA3?=
 =?utf-8?B?MHpzQmRMZGhGUGF3ZDFlV2Y1UjJtWjZFS2tyTlZ6bTFQZTFJdW9za05IZmZ1?=
 =?utf-8?B?T3VHajllN0pvdlNHSzVrdHdkdnVMeC9oS0tFQjR1Wml0R1MrdkZ1OENTRDM4?=
 =?utf-8?B?QzJxRVJ5MnN4dCtQMkY2RVNQVjBSbGsxMjdQUWlHNEZGUWswZktJMTc5YWRy?=
 =?utf-8?B?Q0RXZTU5SGsydXY3bG1FS2UvdWlQSEpOUExvMG1ScHFJL3hTQWRCd2oyQVkr?=
 =?utf-8?B?UjFtVkhwbWhtWmpiZEx4QkhkelhXbmZTWGhVM2hycFZrNCthK1Y0dWVKOG9v?=
 =?utf-8?B?d2x3cXFnaCt6Ry85QVNvVHZqTmxQQ2s4RU91QXh2enA5MkVORnptc3N2T1Nk?=
 =?utf-8?B?NXBXZFdvZGNvKzdTRHFBVmQyV1RTaVkzdXM4VGwzRUZ1TVRnYnlvcko5b3k0?=
 =?utf-8?B?WUtEQnJIb3czV0paRTdPZVZBVmFDaWlWQmFnWGVTZVdtQkcySWV3R0pFUEhD?=
 =?utf-8?B?dU53Tmc2ckt0V290cUxveFVibksxYUJqMUUycUhFZ0RjMnR4Z3VsQ01mN2VD?=
 =?utf-8?B?OEhweWMyRXFVbHdLR1BHUjM0ZW1Td096Zisvd3lDZ09IMTJqNnozZTNsT25G?=
 =?utf-8?B?ZzlYVVYrdklUYmJCQTZlckQrNDlRNjJlQzRDc3VJaXB4M1ZoVi93RURLZ2No?=
 =?utf-8?B?clVVSDVzdWZwVGhOTFVhWmJhYUdUUXZIUCtIZkpZSldWMnJUenVFNGpaekpP?=
 =?utf-8?B?QW80UHdRVm9nNXMrVTBWVHUrYTRzNzZOMjh5TWN2NFR2UGM5YzZtTVdURTJr?=
 =?utf-8?B?L3pNbTU4Ri9xbGpCbVhIbm1Sa2hHcFVhMENPeXpyVnIxak1OK1h3TEVEcnFt?=
 =?utf-8?B?N0JWUzNWVWNNQys1WXZFUGxaWDRITDk1RFJaUWNXUGd6NERSQ2paelNZbE1u?=
 =?utf-8?B?V0VnaHNuTzNiK3RFNkZDbTRmTU5Kd05jRWtRUk5WSElJeE9ncXorNUg3Y3V3?=
 =?utf-8?B?clFLeWpzZEFpdXBDNHE1RHhmQVh3SUNFOHQvOWJ5S25uNG5CeE5iVDRFN2VX?=
 =?utf-8?B?Vkp0dHZ0dzRUU2tlNnM3aDF5R3hHRFpxWklYYzkydmJibzYxaDY5VFhacFBl?=
 =?utf-8?B?YzdNYVNTTjl5Tk1HMVZ2ZEJGb29YWUZFYm16WTZLSmhxdXh0WkRCNUl6SUdq?=
 =?utf-8?B?R3l6OVhBc2lpVTQwVWQrMG5ZcWFvcHgydC85cTBHY3pmQzd6UGkxYlFhdDNi?=
 =?utf-8?B?TGZwYk5ZUVJZQmhia1BXU2ROb3FCMGQ0bjhVR1VyN0liRzZ6YnNJcEtjMS9E?=
 =?utf-8?B?VlBVczlldUdkaWVnUVVxQ0l2eVptSnFzK0RpVytmSEV5VzZVWjVzQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd40f73-9638-41e7-d8c9-08deab4cb1b7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:51:42.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go9QIjSsnzPVNFPt3tBkYGRtG/bKmiwt4gM+zkPnZ+OrocJd1ng4jQdGaQdhfbazEfoehQPSncTvd5QDRUrF0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-Rspamd-Queue-Id: E14394D831A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60544-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,oss.nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series enhances the Synopsys DesignWare MIPI CSI-2 receiver driver
with multiple stream support and adds i.MX95 platform support.

The i.MX95 variant is similar to i.MX93 but uses IDI instead of IPI. Since
IDI is software transparent, only a different register map is needed.

Tested on i.MX93 and i.MX95 platforms.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Added Reviewed-by tag from Frank Li for patches 1-6
- Fix formats array out-of-bounds read during enumeration
- Add NULL check for csi2->formats to handle unexpected format lookup failures
- Call pm_runtime_put() after dw_mipi_csi2rx_stop()
- Balance PM runtime get/put for asymmetric stream enable/disable operations
- Add Reviewed-by tag from Krzysztof Kozlowski
- See each patch's changelog for details.
- Link to v2: https://lore.kernel.org/r/20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com

Changes in v2:
- Add two new patches
- Simplify error handling by keeping goto labels instead of early returns
- Removes redundant register availability check
- Uses read_poll_timeout() with dw_mipi_csi2rx_read() instead of
  readl_poll_timeout() with direct register address
- Fixes stopstate condition logic
- Check PHY stopstate after sensor enable instead of before to ensure
  correct timing.
- Optimize PHY stopstate polling parameters (1000us->10us, 2s->1ms) to
  balance performance and responsiveness.
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per and
  pixel clocks)
- Update commit message to include more details about interface differences
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
- Update commit message
- See each patch's changelog for details.
- Link to v1: https://lore.kernel.org/r/20260415-csi2_imx95-v1-0-7d63f3508719@oss.nxp.com

---
Guoniu Zhou (7):
      media: synopsys: Fix out-of-bounds check in enum_mbus_code
      media: synopsys: Fix IPI using hardcoded datatype
      media: synopsys: Add support for RAW16 Bayer formats
      media: synopsys: Add support for multiple streams
      media: synopsys: Add PHY stopstate wait for i.MX93
      media: dt-bindings: add NXP i.MX95 compatible string
      media: synopsys: Add support for i.MX95

 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml  |  16 +++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 130 ++++++++++++++++++---
 2 files changed, 132 insertions(+), 14 deletions(-)
---
base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
change-id: 20260414-csi2_imx95-65ad0e7f630a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>


