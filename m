Return-Path: <linux-media+bounces-59369-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFbwNM/W6Wn3lQIAu9opvQ
	(envelope-from <linux-media+bounces-59369-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E35D44E797
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 10:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD8B30179D7
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2026 08:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B0B3BE635;
	Thu, 23 Apr 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AT6EyJYc"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012011.outbound.protection.outlook.com [52.101.66.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82584394792;
	Thu, 23 Apr 2026 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932485; cv=fail; b=e6dKdmHS4ftYzQGy+m2ri+vHqMYOFNO4HfX8UPRUyQjDJWUzS4gN57M5hAr1zEvC+q4x6fry/fPLX1zeEOE7UCK/wwavRt5iJKNhUpNsQppjhKGqmXgQPtrXcBKDRYj+RucX18OdYWZUy6qgvBZYcmOWA5yH3CEQOxr6kJ+jkbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932485; c=relaxed/simple;
	bh=dmtdhzz3oobT0rMu3qFcwdUCUPFa8staym2TF+ge4hk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YEDaYNEEQV7FnVJc9mpk1Yt15sFCBRVoTmyBXE5tPMq05NgxlL9NxG+Iqaj+7uEx8+qoQdrwUtzl8WpSSS8WMX0tNSxBvGWfm5uJ3BifA9cSh/qRam5e+h7cSit6ZkBKXrn9xxqxqOY5ORBJaA7epfpVDTraljvzx1m8fQ1t16A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AT6EyJYc; arc=fail smtp.client-ip=52.101.66.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOSiJyIeKvGOssWJXK8eVe717a7yJ6TecfCxPkpQ8t0sKk9TXJKWH3hfzu8AbRUVAejzbLrp8d/EOKbVEF+TAqAMzEjzAkvv71zBfnfnhCixP2Xawu+3p+zfrGAui/gNBx02BVVhZr2YVqotX4+5n7HY3iDU2TT/3qfxNkghg2OBqad2L5keiq3GUg1AJj926MKMvGXarvsCJ2ERSx9gTaJrdeJ3U2hvZNHyAkpDumOtYsxvmn5EqDgor/Gq9rDg8/Ky2w9QvsSIQFqQ2nXtYoG0FtrARH9cl6Tdxcim2epFq5tbz23pR0+24NNn7ofox94VC5CBCmm9xixb82kWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1IwAITGKCH3SLRX6sEAw/pysQRa6LVbNZmoksO5pLMI=;
 b=ILij92r6sAgo2dSIgF+634LrFwdxrL4HcgkHKgff/H+pbXF3yFB9GFOvhFtL+CsWvFxO2cRJSEhwO2eJMhmhTF9ePBnpyeaCc5WbeVKy5pN/diSb/ZYdG2lRlPU/OEJWYaGGpDiok7JRdo/rxEnWbJ3eLVGi9vDBiTdbVWNZSC1sJTmFooalY64cdYLtd6pnw2MIn1m5uFI7CVaqTJfIU1gM63/lPcs+eZa5dQwZMuoET8mw8wXh76gAvAU+T0Rf35iKMC9hzfPeUXPV3Jlk+NZ4ovVUPTThXddkDXXocYE34qySiOGq8BncELcb8yE54BuV/O6DiUegIazU3V4P3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1IwAITGKCH3SLRX6sEAw/pysQRa6LVbNZmoksO5pLMI=;
 b=AT6EyJYcN2DTQIK5ShEcmwdnsbFv2jmRs7is75/YWAftMjDS5pgz0e/QwVIX7vl1dC+R3QrgXNvzo49uxkyAdYV98Dkpf1c587877x+JwucohdiDFJ2rp1K3OvJh/GOaZ6IAi1ftxPhWjzltEf2S09Xkgnx/sSoEt4/X4PiGYfpuUa7yNjRwg84RrRz6l1qNxS73uKoP6L3Hap0/KLG8QzUz0/PfBLU8yjBmWF2U+nzETGLZ11X5rvnZCOQG/kEOrcPMi+CP/1X1eO6gkQFp7HJZJZypG3cxu3pyAuWOU9QR1SDSHu4+JJ621Cjd3T1WSk7mygHGF6S53vf6v28FwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 08:21:21 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 08:21:21 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Apr 2026 16:22:59 +0800
Subject: [PATCH v2 4/7] media: synopsys: Add support for multiple streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-csi2_imx95-v2-4-934c02f3422a@oss.nxp.com>
References: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
In-Reply-To: <20260423-csi2_imx95-v2-0-934c02f3422a@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776932600; l=2433;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=dmtdhzz3oobT0rMu3qFcwdUCUPFa8staym2TF+ge4hk=;
 b=zvG88WjdOnpib83W0byyasPTvdnkntnBZ+7nVpILtocy9ws6c6sOmDr6549/O383QgGly6Zcr
 G3qXmAZT5EqC0wFiyu7dJEyUMP9LqEG5d/dZxNHKywlfVK8XtIAbKfP
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR06CA0252.apcprd06.prod.outlook.com
 (2603:1096:4:ac::36) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 4998b7e8-82c9-4569-3766-08dea1114cfd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|19092799006|18002099003|921020|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 6qh3bSBWHpR8FbmIBQI0j0bWFdFs2LdL0/fYlZ1zhjSxuK272okmKj2vijvVnWZQZ7wuhLSnDnxKAGdy3Wi+/2Y/SgEjwHPI8RrD45TR3bn0+gyY5MgHKpEJXihDV+RqzRLTfypUbr78WxdwnKKqlsTmgLQVYe07OG2rydp/likB1T+ssyfQPmH2ybuLJz2au9lJgtJRQi9RtPGc24uBcAHmLlZ0cgE3PskRKN/iyU3+PEctnojGsY2jJhY6pF1jLDPwJXKxsCniUlucjSzU50pBwRBfPoIYvYtHw+HPNH21AOUORAfJKWcEnF/6JlGqCxa/i0pCUfk1PAc/URE4/4IAA8/UU4ReJF2+wSwTEQtlwNCNbFyUtqwWM1TtGlxXvN2K5Iv9QCgT0NLF0HbKEDEWBM0o6NKHNwiRMlQTLNaBzgEGES+X1fW80oPmZd9lE8TfBGtdC8BQrUmXOgusyjwbbmgC5RNikgaMm+iQfcgrvDzaTu0zQxwP56mK62kC3saAJjd/KbwYZnK70UtUWVpDX57gWtt5SdULK3aP/kHsptY3CXDPdftjFPb5sFxVkME+lvBWC5E1Qzm2W8XLUAMXukJ/zCz5xFiFZJ1BiVaFQ3oUYbmPQbqSektyoBf11fr5hj/jssIABJwdZDUi6eGIY33kJ124nkjAOVdO8FJTfbjpVhDnQ2rYkQACtZR2nt/3m26FkDNDoIbEK+nGg0rJqzvN0z0UnEHJZqm719I82Y2YfVwBYxCS6LGwUhyq6XiCoWMyUFoeFK6ydEPllK4nvIhXpPRiQ36SJbecpiPYFS1qcatRyivhVulNNJtZ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(19092799006)(18002099003)(921020)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QXV6YXBPOEtweWd5MG9hMUt5L3ZGZ1FSd3drRlp2UWsvN21EZklHNEQwUjJ1?=
 =?utf-8?B?azd5MG9RYzcySkwrd3pJdXJ3SHRqdjBGQWg4bjZGOGI0d04xaEFrdnlkVERB?=
 =?utf-8?B?Q05qWmNGVndLVnQrRFFFTkFnblV3NFBEWTBUc2Npd2tvYnpOMGlSeGw5UjBM?=
 =?utf-8?B?dU1yQTRueWE1T1lLaHVNMGpQSmphUWJPaEd5RXNhWTkzaUhqNi9uZlJNRk12?=
 =?utf-8?B?czIzMmZqbmFub1R0VmFMODJXRzhJaXZ0aldvR0dBVzh5OTVtTC9YbVFrUjhC?=
 =?utf-8?B?Mzloc3UzUTM2d0o4K0NVRTRvOHNkMDYzdDNGS09oemRRWVVtbjB4SUYySzVq?=
 =?utf-8?B?ak44SnNISUhoVUNvUlNtN1d5V0tVZ1pDYWZCbS9xcFV5UVZEYUgvd0RPYWJK?=
 =?utf-8?B?dTNqOW5qT2ZVNVcyS0xFMHdxY05yK09ieGIzNjNQaXF3bThmbWhNTUQ3ZmFW?=
 =?utf-8?B?OGJObDNBeW9uUG9kUlQvMVRRQnNmY0l6MU9weThQR0k5dkY3NkZwcm9oSVFa?=
 =?utf-8?B?YUFoRDBnNzM1TjdJVVluUEoyMlMzeHZHUi9tcVZhYk83U1NRdW1KK3l6aG0v?=
 =?utf-8?B?ZDZsQzAvRkFMaUtRa3FKc0k4RlVRTmxpaUoxVXF6b01McEUvbnV1cFpTYXR6?=
 =?utf-8?B?Qno4bjJlb0MvMm1zNEVxZkZqR2VmMjZwLzFleHdVRzh4US9aYlVGS1ZKRTNU?=
 =?utf-8?B?eG5vd21UWEdLV2ZHb3R5bmxLWVRPcHh2MHBRTVFIVnd6YkwrZW11Ti9DSlNC?=
 =?utf-8?B?RnNmL01NU1BJb2VONmtXZ0EzNVFEaWNrY3JwSG52b3JRQTlseDk3SHVwdmpy?=
 =?utf-8?B?ZlRidUc4ajVtYzMzMjVJUDROQUduR3JvVXlPdFE4RHMwVFd3NC9Uc09PQkk5?=
 =?utf-8?B?VGVOTDZXOWxJUEwxdWlLcmFLOU5xdmgyb0R6S096OCtocVl4eUdYbG5TdEdZ?=
 =?utf-8?B?VXJBbU9TOW5aNnZ3U21ZNkxHZU9YSEVSRGFMK0RBcnBKYmNQWmFxNStHd0tn?=
 =?utf-8?B?aE5oYVFuU2R2K1RRMFJRdjNweTN6RkpoMGhPSWJKOURVSDhrOExtd1RHaGRs?=
 =?utf-8?B?N0txdjN0MGFrNmJVTlBaem1Va0wzTm83L0xkWEZFQnZTOFJUMTlWWTF0UFVp?=
 =?utf-8?B?UE1yTWxZaEMrWHNPR2lqamp6ZzlFY0MweHo2UFhLdWx0eUV4UzJvS3N5NXBE?=
 =?utf-8?B?dnd2SGRhU0lObGFEQ0JPL01KMDhPTkErYnNlMkF2ZXpnNzlCeUFTeXFEUVk2?=
 =?utf-8?B?V3dDb1RlUU9sSnd1bWpYeUhYWTN3MWwrQXFxd1pBLzNkQ1dVeldEVUtGK3dy?=
 =?utf-8?B?Yjd3VTBnWjMyUVcvVTBQRnR4RnAwN0pZbDVyWlh6eUlTdmNWTUFsbGl5bzhX?=
 =?utf-8?B?L1VVV1FkOWZGYlgrYTgzTk5ONDV1VmJ6UTBseGNCK21HREs1TVF2VGk0SGpt?=
 =?utf-8?B?czZVS1BnVlJNdjBPRjArUGJEcTUvZFMxUTRmZXF5a3lqcnZVQTFKOHVWWlpJ?=
 =?utf-8?B?RzI3ZjQ4Y0kzYlo5MHJvYlZLNi9QbXdTUzZkMEJjSHZLT1kybENnbnU3YUZF?=
 =?utf-8?B?L1pUMUg4OHlqNE0zM1I3eGFPbkdWOTZDa3Y1VVUyUGZCeGd3ZlRvUWFTU2hF?=
 =?utf-8?B?RzgyajExTGNKVHNieUFrS1BlRktoZGJrQmhMQUg1eWhMN1ZWa1RDVFFsdTgw?=
 =?utf-8?B?blN0aFF5d3M2ZklORTl5L3FQZlhxL2xnU3ROZERaNFUwWmZxTVdvUGlnaTlI?=
 =?utf-8?B?cFBvV2N4c25BUWNTazgwd05IMU91UGpqYm1nUnZ6azhwVkhHdytWVjhlSTRY?=
 =?utf-8?B?Wk9RU0xTeDNOczk2akJQcUgvUlg1ZmdQOE8vUnloVTAvZHAweWp1a1huU2RE?=
 =?utf-8?B?WHhSeVZWNVkrdjVxbkRnRlBBb2wxZVptZW9tMTh2YlJIWllWVXlycjF6OXNM?=
 =?utf-8?B?S2s4VEtWTmJUMGo0aDNHeTlJUlpwZ2ZxTEJMKzVDZGJCUndPMEI0QVFJU0p3?=
 =?utf-8?B?cXJDWmh1eTZkQ0crTVRJRWMxcUd0ZnlFYUcyaFhFYXRBaE1DTG1qQUFWUFg0?=
 =?utf-8?B?NDJDN0E5WlRDRmNjLzk1a0paYlJDTUo1eHZkclQ1VmJMOHV5bG1JSVRVSm5B?=
 =?utf-8?B?ODNjalZYZTBEUGtZOW9MV2dLOHRYcHFldUNZYzI2NEU1bnJ2a3RuRU5aU0wr?=
 =?utf-8?B?WUV1b3pWU0kyNisveEpXdXFPMExFcjdNWmN2ekIxSEpYNmpWRmhXUWsrbGFs?=
 =?utf-8?B?L2ZhN1NqL0VidytLZHY2clZLeklGaWRlREJMOEJyTjlJQ3FUQ1dNVkRNMW9U?=
 =?utf-8?B?Nkl4RmF1eUhkOWF0UmpUcjNmZWV0c2VxM3BEVldMbWdDa0w5YldOZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4998b7e8-82c9-4569-3766-08dea1114cfd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 08:21:21.2824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuArngpXOwITKwihjYyXMuFbPbEqXM+Itu0AnE6gK6UUPXpTeP0BqldEewKpH2rtVWaZmx/FZbvZfB05NEjzyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59369-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 4E35D44E797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current driver only supports single stream operation. Add support
for multiple concurrent streams by tracking enabled streams with a
bitmask and only initializing the hardware once for the first stream.

This enables use cases such as surround view systems where multiple
camera streams need to be processed simultaneously through the same
CSI-2 receiver interface.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Simplify error handling by keeping goto labels instead of early returns
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index d572d2eb3bcb..5a2e74d055c0 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
 };
@@ -537,20 +538,26 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto err;
 
-	ret = dw_mipi_csi2rx_start(csi2);
-	if (ret) {
-		dev_err(dev, "failed to enable CSI hardware\n");
-		goto err_pm_runtime_put;
+	if (!csi2->enabled_streams) {
+		ret = dw_mipi_csi2rx_start(csi2);
+		if (ret) {
+			dev_err(dev, "failed to enable CSI hardware\n");
+			goto err_pm_runtime_put;
+		}
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
 	if (ret)
 		goto err_csi_stop;
 
+	csi2->enabled_streams |= streams_mask;
+
 	return 0;
 
 err_csi_stop:
-	dw_mipi_csi2rx_stop(csi2);
+	/* Stop CSI hardware if no streams are enabled */
+	if (!csi2->enabled_streams)
+		dw_mipi_csi2rx_stop(csi2);
 err_pm_runtime_put:
 	pm_runtime_put(dev);
 err:
@@ -577,11 +584,16 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
 
-	dw_mipi_csi2rx_stop(csi2);
+	csi2->enabled_streams &= ~streams_mask;
 
 	pm_runtime_put(dev);
 
+	if (!csi2->enabled_streams)
+		dw_mipi_csi2rx_stop(csi2);
+
 	return ret;
 }
 

-- 
2.34.1


