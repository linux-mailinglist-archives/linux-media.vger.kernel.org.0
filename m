Return-Path: <linux-media+bounces-53805-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHfcNWCIomkd3wQAu9opvQ
	(envelope-from <linux-media+bounces-53805-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B11C0816
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 090FA30848FC
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 06:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882F333A711;
	Sat, 28 Feb 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r+3hXSeL"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB89930BB85;
	Sat, 28 Feb 2026 06:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259407; cv=fail; b=XHazwRSMPNwQQDOrhO3GFYxN7pD+1ZtBV48w32q2GLB/VQd/i/vf4VlixdjWo2vVgSq02kz7A76zY40VXZgnMcH3kpZm3slaCijGN6sBcdj13QCxbSlv8UUmKfEsUkhN5FevKGYQPQUI0KTMt8pU+Z9ytyeVouAJy8y+r5nnPeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259407; c=relaxed/simple;
	bh=Uh1vAwH7MSODufuVr0odjY83YptKy2k1RZFww8w3us8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=riCEjVl/GYu19EPZns3Ept91i/xj6AHRfF4LzMPQ4HMmBIw34lVugq/NMd5HZtu+y9Rma9+cnywrgscnh/35fR0BmW0jINNN8isLnKg7CsZMJu0RgAcNEhEZVQwKCQJoFAPEfDjKJQyyQgZJkSYymavw4MlSbezEaXMtrfHYCBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r+3hXSeL; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY5Sqw9dUBf5maYul6Ul+cWn9rYsbqDJAdTG5CYLJe/hzabEbzkWLiS2bQpyTY7PlPDdNIyG6vr0r+HcB7/fuzk2oiIuRN2eEs5dh8PLgRX9e6I6aWGltsJ0ND8E8PWMcGZXO3/djf6qM09nSl+k/8nKumlPjIg2B5Z4KNhy+4CX3KhXimOMyxlZ61ssl5F5ueFdpHYaezpjqGgFG9T5tOESYcL509Kb4mImjHkL/RJky7uMCaHzeWbm52sPxnrslj7H8c/ESboCtf0mUyMk3IU/uZ3GvheCLCippBostPLDnp5j+LdIWIB9ezMKvL+dWVTlv5n8sFc0HytafNgaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HgzCYrVBCljKqSf78/I+w3e+1ZtcsXUQGnmZgW2JzM=;
 b=TIIVISZGMhh/RNTuMf9IVMJCPL1BPJ96GrTxu9Wp7kYEQewo+DNb7te56o5SP23bykaBc0jnCRZFO328endcvnAADCL1lCCtfDTyx4dbxvjtL/WswQlYV4/qsdx77JWYXWl8DC0YSFer6rm5CxEvNsTNr+KnU3k+cLWCAPOm4Ae+cqwSogTIuIJlP1XvU5Jwgzt5p6KtUwzyHT3T+0iKfb30wVNuVngVURrXmA69/q4wM9V7pAlAdY3VAgNFGdrdGesS2sYJNn35iACh77cbsXcxN3frtWVMOW4FzogdTxM/g6daZbyXwwmEGd//J7DZgzOqnogYcwbwUCTk9I7LeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HgzCYrVBCljKqSf78/I+w3e+1ZtcsXUQGnmZgW2JzM=;
 b=r+3hXSeLq4+vRTT7AdRZr4coSQ6Zu/tWDtRObD0op5je1iDHsQ67DL2fu6JSmbnxjHk1wptO+voo4ZlWGFD7H4FgpO3qJro0HJcfxFJdTJodp8LqLLcHZHBx+xUemQ4POwRkY+/FnJV0+LauOInqLiYFNbAYAgu0RARsxJJYULwxF3enRVVNVa+KklnsoHrkuZB5sh32CX2rSt50c9MNuPfS3yU1sHpqsaYtMHwO0iZVRM9/Oyxe6tQMfp8wwKAw+3vEXloRjYCisRdZrBKhlv8zpVI/HgfWLz8uZX1jacbqTcLMoMtk/NhGrPgSVBjAn4jVj5K6TSY6j12nCdcXCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB9809.eurprd04.prod.outlook.com (2603:10a6:800:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:16:41 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:16:41 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v5 0/4] media: i2c: ds90ub953: Add back channel GPIO
 support
Date: Sat, 28 Feb 2026 14:18:18 +0800
Message-Id: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqIomkC/1XNwY7CIBDG8VcxnGUzQAeKp30P4wHKoBxsm7ISj
 em7i8aNePwm/P7cWaYlUWa7zZ0tVFJO01gHbjdsOLnxSDyFupkEiWBB8JAtXLxFxYXutewHVA6
 A1ffzQjFdX639oe5Tyn/Tcnuli3he3xUBTaUIDtyZXqgYfYhC/I7X+WeYzuzZKLJ17e9FVgeKy
 Gjy2qP9dqp1unWqOu+NHzR2GJz5dt2/0yClaV1XXSCHVkvAaOnj1nV9AJRFLA1IAQAA
X-Change-ID: 20250901-ds90ub953-168628c53a00
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772259522; l=2187;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Uh1vAwH7MSODufuVr0odjY83YptKy2k1RZFww8w3us8=;
 b=0yY/mTFSXp/0RJCGJ2yqXH6JX+I6BowapqfXoBT3BMBE2GcIx6o5ni1/vHXAs6ed01rjpX73f
 LSoUY1M3gchA9LmaQz22MopdEoNKFMpTIYtb5QRPlwL7t1ae5lIedx3
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: 07baa6fe-2c77-4b45-3b17-08de7690f067
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	Zfduf293n1EkY6UzYKhpZFJ0UM4KrGkRzWbTogjYf/ltHgkQTaDfxFMkkvf1P2WrpBoH2JRulY1IriSwnIvO2dU9G6XJS4sGPqDSHh3aks2I/8ivYxyWTBg0wRFs1GlK+kUyDwA9NEaM+YKwW9UcFT+qqkVT7IbeJJgVD5RvkFdHVh2Vt5zUYxVmRsWRTiB+2wyfT3nizA2MK076QTP9QOHu+Tu5LFYGGo7s3IQSwfxVEJTesEl7sUrqB2SMwMolu59BPfDP7KtmLgNj0zEOhNZgz+iKu+ofkQ0tC2SFkUaiCMet8zk/ylQHMz4910xyaTqPofSCxma9+NAkm5FRqN9IA4Bl6FSfTRzWa9cdkJ+kckdqhnFHi7lvakPP1w5boOuTOmYHR5QU2WPH+xCWjMogOQhx3ULGCmmi7VP9pA+zKwe8KaFtokv04v5io9WL3AQevZx7YbuBTALhw6MH8UKUw9pa4sAXVLL10QOg5vRH2jcLELim9WwRgngsANdjD1q2LuDjS/RAIOJNRETtxzR3LXGSXoxNqsO+YebYKutRXlxXJVjeVYT/CFQb+iI3VKIMmkhLehexs2IT5Iw2xAJr/eRYsJSG4fm1vYLE/Rj3LE2/+RpPGg31w4mZjh2d6sVaIeSmEGiNijSvTHeSPfOFPfVpy6YP1bUtyozyYezbtj5zxco6B4q7NWbXrH640/+L/+WBWK80eKJ7WOvuGr8Ch8D7xJAPr3yUVGca5MoFG9oDZvuonE5zUvXC8Qcp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlhSajIxaTFBQzlScWhXazUzczlYeTgxa21CM0oxTlBwSVR0SWVzenBsa2ZV?=
 =?utf-8?B?c2xvNDBrYXVSZUkreXpmRjNQMHovelcyV0JMb1RpbVdjTnNrRUdPb3dMWnpC?=
 =?utf-8?B?TlJseWEzMUdqTkY5RGVxVSt0VkR2S2hiZ296U05taVNmakxURWVkcC9hUnlo?=
 =?utf-8?B?eHNMMFhYL01xaVltNTdiazFBOXlDZmRabHFMQ1g1eHJyQldCUS9jNThGWnUx?=
 =?utf-8?B?SXhoOG44ZnV0VkttSTIxUEZtSmdxbjdOK3ovaUpCRlVBeFBIUFRjbUhXMytj?=
 =?utf-8?B?VmtobzdNcHYzcENLMmNjdXRGWDdXdUJlYytZRFQ1dkpUY1VMUXJDakNTSzdT?=
 =?utf-8?B?eEhXQTNuUFkvVmU0VG9rNlpFeTJLQnNwdTdrcVhVQUFNc0JxUVZURndXV0E0?=
 =?utf-8?B?QSt0RUQrYjFvK2xSTjFHRXh1ek92RXY3blA5d2xSYTNlMFUvTlk3czRVNXpk?=
 =?utf-8?B?S3IzU1B3WVZNS0VhOVJQQ3BBaEpuQnRnZVlkb3dRV293S1h4Y0lLbVlhTzBS?=
 =?utf-8?B?YlMxT2FnMlBXd1JoR0dGcHFOVitGeXZwZVdLWktxMVhIV2pJRk1yNHkrRk4w?=
 =?utf-8?B?NlB6b2JsWW9CY1BkckNSVlhjVmJiZVNtWGJ0VlRoNTlLaW9nMDFGYTY2ZnVk?=
 =?utf-8?B?U3U2QmZ0VGRFa3ZzS0diYW94RW41R1hOZlJuLzBnRjJHc0d5R09taE5WTTFT?=
 =?utf-8?B?VTJLZ0I0MnlucDU4b1k0TXM0WVlkRjRObHJKN2lXNDdzRjBtQU1WNHQwWUhY?=
 =?utf-8?B?TXlaTHFzSEIyVnZLK2libzB6NFhES3N0ME1mOVAyZXBRZjU3R3NMOHJWTXlu?=
 =?utf-8?B?NFRUaTFlQmNtTk5jNmFrOE5PTG16dVRxQUsvR3MycEpCZ3czNXZzbUdTakRt?=
 =?utf-8?B?V3FFODlIUnFmOTVYYit5N2xOVWh4TW5SLzdsVW1KUDdyb2pqUmNLblM0N2dI?=
 =?utf-8?B?aHBFc3dVNGlYM0c0ZTRDak0wa3lRRXRad2dFVnkzZkM4MXlsZHBSeldQc0NJ?=
 =?utf-8?B?U3I2NkQ0NFBiU2Z3cGFpdWdpb0R0d2F6K1AvWXpjQ20vMmFWaHQ2TEN3VTJL?=
 =?utf-8?B?MTNWMkhCMDYwNDF3NWtkWnZLNWlkaEZUR3Vlc2doTXQzbUdyNGZVM2NEbWF3?=
 =?utf-8?B?WmhTNXB6blFPZ2pXc3NFK0s4M2czbkp5SGYvdCtNa2ZQa2kvTUhiOGNpb3hu?=
 =?utf-8?B?K3oxbmdLeFJVT1VVbnhnc2FwM1J1QTVIeUZWOHg5Skx1Y3pBVXVFSThQQk9o?=
 =?utf-8?B?clJONVlGVWtJNGFaSDRYR2dEbXpzWXU5ZklGSC9ZNHVvUkUwOGxybFdwTVV6?=
 =?utf-8?B?R0VDTzdhczlLNXduQmxZOTErSWRnc01MS2RtaE9NM1VhRGRDTFpGYWNhR3lI?=
 =?utf-8?B?ZFdSU1FBZGp6TStIdG0ybEd0NnN1SU9ueUpZVDJwVEFsdkd2TlRiYjhIOTZF?=
 =?utf-8?B?R0JUZm1FMWlpNm4wZjBMTGdOeDh4Y05UNUFPQTFUamN3eExwZzZNQUt6ejZV?=
 =?utf-8?B?b1BUNU5Vc3N6ZnBhS2p0TnphN0hXcVMzYTZSN253QVhjTlZPcFB3MW1TWFpt?=
 =?utf-8?B?VmhSTXNGRjVSNjZhVWtLamJiRVRVNFZIS0JSY1BDelZsaXdsNlQrZjRNNlMw?=
 =?utf-8?B?QndnRWVSOUlqcy9UZkhDeEZvM3pFNmgrb2twN2xVZmNmcEVkbDlvTmI2TEN3?=
 =?utf-8?B?YldBNDVJQlYrRXZoSXE4Y1pMZ3ppYmlDVVRaZjF1R0lmNG13MmlsZ1ZZMkc1?=
 =?utf-8?B?bkcvdkFXS3paQ281NTgwWms4dlI1aE1ITTVSVlA1ZXREa3Yxc1VFekFDYU1k?=
 =?utf-8?B?UEJBK3ZmS3VqU0hxMkpKTzhsT0Mxb0VFODcvMTEyOEVzT1J0OHYrbjMvS05o?=
 =?utf-8?B?KzVpL2JxdzJiTWt2VXNMc3dPeFdJcWxRRGRVVzVQSzE2VXFKc0lYRlhkK3p3?=
 =?utf-8?B?VzUvYjhKVURRTGtMVlo2RWo0b1ZuYXZXSzFxNk9DUUl6ekoyTjl3anN4NnB4?=
 =?utf-8?B?RDR4YnI2ZFBGUC9LTUxVM2xHS0VUWjU2Mlo0bEs0ekJ1c1ZSUmRPU01icUwz?=
 =?utf-8?B?Y2RhQnVtbnBYSmdrMTlzeDh4N2ZaSnRCNkhZYkFCTXdaSk16OVZnOXhWYXNQ?=
 =?utf-8?B?cm5iejFkWHNpRFczZmVnUmYrbmR5WXpDNjdMbVd1U3Nma1FkWmZwTFdYZjJv?=
 =?utf-8?B?anlEdCt0eTVzVUc5WjZOdnpUZ2trbXNhTjZOQnVDYVdRZ2lTTmJMVjhGN2dQ?=
 =?utf-8?B?MktSSUJRYXNwUTdGYWtwczBKS0gxbjlxWGJ5dG9vT3V4aEVCWlpVdUxidTJq?=
 =?utf-8?B?bXNSS0dyVWxOamdtMUhzSEw2dnRuZUl6SWVaa3VvckdjSTZpM0NoUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07baa6fe-2c77-4b45-3b17-08de7690f067
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:16:41.5594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90+zehPKallBeuJMWxdms3BSnnx8nfCOTY/lOTsmQfDHf+ax8HjDf/FEwgGNaNUpTQD/vs/LDwMGs4EGM5KZSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9809
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53805-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B9B11C0816
X-Rspamd-Action: no action

Add back channel GPIO support.
  dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
  media: i2c: ds90ub953: Add back channel GPIO support

Use helper macro to simplify code.
  media: i2c: ds90ub953: use devm_mutex_init() to simplify code
  media: i2c: ds90ub953: use guard() to simplify code

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v5:
- Improve the description for "#gpio-cells" as commented by Conor.
- Detail change see each patches's change log.
- Link to v4: https://lore.kernel.org/r/20260227-ds90ub953-v4-0-dea596205f9e@nxp.com

Changes in v4:
- Rebase to 7.0-rc1
- Use folder block instead of literal block for #gpio-cell property description. 
- Only log GPIO 0-3 stats since remote GPIO 4-7 reuse GPIO 0-3 pins.
- Link to v3: https://lore.kernel.org/r/20250916-ds90ub953-v3-0-bb7bc6545da7@nxp.com

Changes in v3:
- Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
  compatible deserializer suggested by Rob instead of adding third
  cell for GPIO controller.
- Update driver to expand GPIO range.
- Link to v2: https://lore.kernel.org/r/20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com

Changes in v2:
- Remove new property ti,gpio-data added in patch 1.
- Add third cell for GPIO controller to select GPIO output source.
- Move PTR_ERR() in dev_err_probe();
- Parse gpio third cell to select which GPIO pin the data from remote compatible deserializer.
- Link to v1: https://lore.kernel.org/r/20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com

---
Guoniu Zhou (4):
      dt-bindings: media: ti,ds90ub953: Add new range for remote GPIO data
      media: i2c: ds90ub953: Add back channel GPIO support
      media: i2c: ds90ub953: use devm_mutex_init() to simplify code
      media: i2c: ds90ub953: use guard() to simplify code

 .../bindings/media/i2c/ti,ds90ub953.yaml           |   8 +-
 drivers/media/i2c/ds90ub953.c                      | 109 ++++++++++++---------
 2 files changed, 66 insertions(+), 51 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20250901-ds90ub953-168628c53a00

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


