Return-Path: <linux-media+bounces-65341-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYj5Oen5OGp/kwcAu9opvQ
	(envelope-from <linux-media+bounces-65341-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:01:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E726AE05D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 11:01:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=aB8V0fAV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65341-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65341-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13F9630292E1
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 08:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1BC395AD8;
	Mon, 22 Jun 2026 08:58:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F9393DF1;
	Mon, 22 Jun 2026 08:58:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118717; cv=fail; b=NTtWaHcaQ6cB1N25Vt8AZrAi3pQE3B69dXVGtHmdFbGm+4MkXzMP3bDI/nbSQjV9gj5zzswMCEkoVlK8Ra3g0q4YQ2tvTNaCM4YmJyfIaXZFqAYYGB8gXta81Yc7b0qAQZG+k8Rz/w2Ed8i8pE6685/rkjoEObYymEjzdmRNvl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118717; c=relaxed/simple;
	bh=FO6rykdyS4qr6KVQE0WiUcd7+yW5lVYwSW7HI3wyaFs=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=CmoOaagrNILNlasqLFuuD/G/MeRJ//EhYHPznbbOPRjzrTEsIEZbFB1RAC+GAX+aYKkhCCjEl2e/t7oK7JDeCshQnGlqhGmHW3abz0jDbUrTZ0MsWnSM89NIMWl+1n0TFAQW3M+kQXanMmCzP5JxWD0i/FT/PGFOEdbppBn7OK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aB8V0fAV; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=no7inYk4zH5BJZtBEfpewO0uo0M00CSMBH+tROxFyh4Yis/kr0RmkxG8mVj+4cDEpooSrIveg9+MAFk8LKq0RpZG2kP4BmfcwWZiZNuQAHvGkHI7KnCkDrppsxzC0mXbGSbhTg30Lu7mVa5PvDoEgGQFTVeX29QCEGxxRjmBKWl9JQw4DF3tTmGGYA38lzqlXhMKu07HVHcmHg00Qioy+g61SAG2bFn1jNk5kaKoX+GN2/EGyVw1AS7TpBuIWLNXoL/zCzxk7q+ZIC+ez8JQfC5qP/33Mq0eLjSvACfJco1RfrIsexUgY9S3w9HdxSe3FSqBl3sHwec6B70Xf0iAEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=;
 b=zIeWGztF1YJ6YUhf7CFJKXTVFWt15mKp4B6e4wHGGx1LqJNvRfIzmb5uDcqsikmNWkqj1iH40cfBucG5ec4wbXcEe63Xqa5tAKl8+PRVSHoTBgx16kCX0JfSX2OPk95JJ504rJknZ9VF1mEN5fuCSbfqWYeVhp86lazJkR5fgcyymJ/IooeiywRrzGd0RwYusLkgxaGX4w+kPzv83OMzSbpc9FXTBN8+NbQYbkhaBNsW9WMUFkx4iukU28JhlyK1g0nwBCnOes1YH3VUFLOiCtiPEs1Xmk3Wccp2VwBR+LmfWP8PcH/CXkDr1M3gHhn6D8i3FldPSCQFbpyOBDqhZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSUaAkplodbR9it4HhJuy2jJcVENKYCvBUg2ina55iY=;
 b=aB8V0fAVaI5jqvZ9vBFivN7deiEYTka63h1cWU9tJqh1HFFb8eSdHFlOtVklBOhVOzpBrAS3ekrUCrvklhCLoeGaxImnBeDKAkwkwLLB60LsB+6hfjn3+FDt/j1Rq1gLOSASaNOB1ZLClgu8myaHvOSpL9W+JtO5Qmx0yWdPHPkYAXINLtZNwIjuYi7Cirh+NzOXEEUTlU4s6j9bhK3KNoPjjY2eEicYK1B/GkhAY1VVdTNjmVrZT6rmnYQL8lNLkHySxJ2fROVMDPWjSZ+OzY/QlU7zNjliqFHKtaQB64zX1QE2emBG7zX4VTfY+WM2aVcHhKc6DR2kCxwZr9nVgA==
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA2PR04MB10088.eurprd04.prod.outlook.com (2603:10a6:102:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 08:58:31 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 08:58:31 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 7/8] arm64: dts: imx8: add camera parallel interface
 (CPI) node
From: guoniu.zhou@oss.nxp.com
To: Frank.Li@oss.nxp.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
References: <20260617-imx8qxp_pcam-v5-0-7fa6c8e7fba7@nxp.com>
 <20260617-imx8qxp_pcam-v5-7-7fa6c8e7fba7@nxp.com>
Date: Mon, 22 Jun 2026 17:01:14 +0800
Message-Id: <178211887405.4030874.3312107681383203634.b4-review@b4>
X-Mailer: b4 0.15-dev-0e760
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782118896; l=2090;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=FO6rykdyS4qr6KVQE0WiUcd7+yW5lVYwSW7HI3wyaFs=;
 b=suz6mLQUGwJfGSc51hFBV/aMN5r8IS8rmveHrc33Nfz8RBZWUEbB1F//v2NaQwAMD7OMQF5cs
 vzlUHQ+0rznCsZurq6j7uoVyiMyKbwSr8hwoUv/ajVhRiEQixnoMySF
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA2PR04MB10088:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a41e8cb-5595-471d-d0f4-08ded03c6ed0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
 xfbgy/H4kqSNBGf42hBsLbzoToD/2pwJZx6CwLRPzqmDUkgE+I0uNiWqeLsFCa2sAQnqDrkeY7T4TRqwU9r3CjTKgLJDzvGK+TT0buY5cknbUcTsr+HCjfe65rUts3BCOVcEG33kc0GclmSnJDj/Q1fzQpkOLFesGdy1DgqaP2OF5dbXiZN/9R8Wi5AsdVmNSeAZp/FV6zNd194Vk5QpPVCLZuw16OGdveoUOauWpjJfS05GxK1D790gTUCHUoH6LglFxdYXeYMn5lKj9UW0H8Uzh/THJNCqUIff6XZdv52WYbhrwsxPpK/iOaEmWIouv0jLSkjq+FoibAEJhu5trJtuNTs2n1nXBDlXp/To+erpEfTRZ3NYbPJlEK7ZmV4pJwANMhxiSTv+eeehpzs4EEKbmt8zvMnIk9tV4KQsqi0RPb1ah43WBReCYO9l7TcuGYn5e3vKRvMChsHUQQbD+vLMU2evrJ43Icy3Ptp1095bQgpEU0v7CXUWDfVgcx4baA6mTekA+8Y0rgOJz+ZItDNfg+vj72evQuDfH1ev3Zdqu4jLsmy16mIyTP/7TJh1vNp4XxSzyPIsvhcCwXgE7zubmic+lnOjs1azODWq4a6m0hATCs3MJFozZAuSbXOWVsOFlkxQfLY8ybGUhyQbaXmyUBH8K4U8zc2SIQUHNS0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YkFCd3ZDa1NmS1V0RHVKK21VNDRjM2tibTRUTjdjRVgrQ0pSWVc2dTNsQjJE?=
 =?utf-8?B?bkhmZDgzTlFiUXFIZy9kdHFNMy92dXgwT3VldG1hRzE1NkRpcWcrMnAzd09r?=
 =?utf-8?B?Q2dLVUh0NFhRNVoxQkEvTjRJT3JTdzBGNW14d3RBQXREbHBZb3pHdUFqQ3dD?=
 =?utf-8?B?YjhwTDh1aU8xZW9xVFo0NjdsZS9idllnUWp1YlNYaE5peXFoYm9QZlp6UGdo?=
 =?utf-8?B?RGtFclRDSTVWR1JiVjc5SHlOQ05Edzdkd0o3MzRlSFBQOEt6TExQNVYyeFUy?=
 =?utf-8?B?NmFieTh2UTl0djN1c0lFTWJ6cC8zenZvN3owclZ4Z2F0N29zQ1ZMN0lFVVRu?=
 =?utf-8?B?dDZ4NWIzS3IvZ3FpQ0dHcUkybzhQUVB1K1cwT0RVMGoyOHY2ZnBNTFliNm5z?=
 =?utf-8?B?Tk1nOHJWaW1MMkJ5dFNZZjR0a0FOU3J4OGFPOFRvZzkvY3BvZy9GYUU0VGRT?=
 =?utf-8?B?TVBlL0RKeEgwdU1NaWhpeW5qL0tZYU5PL3N5UUVmOXhvY1NuSks5SVVDeHl2?=
 =?utf-8?B?N0JveWZHeTRzbk0vSis4SmhwaHU1ZlAvbFRONU5GVEtzRDJCMjRqWWoxbjQz?=
 =?utf-8?B?eGRKZlZGemUwSGxGZjRzdStrZzhJRFdpTzFUcTREUTJsd01Mampicnk4MmZ3?=
 =?utf-8?B?U2E2dlorSWlSNVJoOW80YzhQcVQzZ1RMRzJVUzdsbkVNdWlQeHVIQ3lFekdj?=
 =?utf-8?B?VU9abTlBK2ZybnFKK0FhMlRwN3QvZ0M1VlhnZ2oxeTB3TG5UQTZaSm5LZlRh?=
 =?utf-8?B?Z3ZmMWt5aHU4SmFjaGREN2tnWFpJSDVaVzVlWE9XUGZ2YUZEOU44M3NwTzRY?=
 =?utf-8?B?NStCUVcyNTB3Q1RwQklnQXN6TFUwOXZDc2Mra1Q2OUxOUnNtdkVNbitKbk9K?=
 =?utf-8?B?R0tjZnJOZ1FVRnc3Mlo3VTlyRHdHUXJZcXFGTUdHajAwdU92VGJUL1QxWHZr?=
 =?utf-8?B?YVJab3FwU0wwczJTUXdocWR2dldQWk9PVGM0UHNTKy9LbWJ4L3Q1M3Zmblc2?=
 =?utf-8?B?b3l2ZUhLSFREZHRocjgzUmE3ZEZydHhFM2ZSZ0FaUEpyMm1QMzR3MWlqUEoz?=
 =?utf-8?B?cHVsak1LQkhnaVMvR3NXZVJuaWFsc3d0aVBrVnRVQjlQeVhuUThtTGJPS0Rm?=
 =?utf-8?B?RUZQeC9QU2twUnNlWHZmSFBLUkhlb2IzM2dwOWdtVWRLM1pjdTF0U2dtQXZx?=
 =?utf-8?B?cE5pVTlWK3BGTUxQWUZlRHR5blNpVlZGek9SdmFGTmkrRTMzcXVsd0c5bGEv?=
 =?utf-8?B?T2Q2MWRwcDBzaUx6dUEvaGo3eGZZTEIrUERudzdKam9JdGhhRFZUTTQ1WThj?=
 =?utf-8?B?bXM5STJXa0NkOG1iYWs2bHVUa1NEa2lKVU1NWHRYRFRJTUVVaWpDRTExeDJI?=
 =?utf-8?B?OHlxQ3N6ZDcwVHhGci9mem1PeUZpakQ5K3V6aEc1THk3eTgzdFlSRlZoczdR?=
 =?utf-8?B?eGFNNng1a2crbjNsdEFNd0d6Wko2QlVKb0lURm1saXZzODlKUUFkSFNWQUtx?=
 =?utf-8?B?T2twS1d2ME5rQUdWRDFpLzYrV3QrUVZmVXBmNS95NjVCaWZhd1NhczZoYzl2?=
 =?utf-8?B?VmgzZVl0RWZBMURUYkNlVlhXWVZwZGwvQWJuTEM1Y0F2L1ZzY1FOUmtUZTdT?=
 =?utf-8?B?YlJtUnRtQnB6S1pIU3Y0U0pMb2ljaWtieE5veVdEeUZWQlRFcE1MNS9SOEtN?=
 =?utf-8?B?MnNlWnNSZ0lHNmJXcFFJMGRxWFU1OStjZHZzbExpZU1hZG8zdkVVMjBXWkM5?=
 =?utf-8?B?RGVYNWF5R1FRQmxGNjJReFpJUk4vMmhDNkJhTXdyVThyaDM3NVdpVTJjMmhQ?=
 =?utf-8?B?a0lnVjlRVnpQTS9UME10cDZ0R3Y2ZUdjQTloU2RzNkhnVW5PZHM2Y25KQ1la?=
 =?utf-8?B?eHlaRkxuUDc0dkxpcUZaQ21MMkw3RHRkQzJPY2lwVTJMcENGdE4zSGc3bGxu?=
 =?utf-8?B?NWFQMnk5NlFhMnA4MnQwd05CQ01jZkQ4Uk1UVnNxdkVER0llN0VGemF5NUNP?=
 =?utf-8?B?SnkrN05aVUhrdE15UTB0NzFXVHJzUUxuOUpHQ3JmakNNc2ZEUXNzeFM1L2s5?=
 =?utf-8?B?SHp5NG55RkhBREVXQjVxajNSOWJleVZFaHpYZ0VDSnlkcFNROEVZYTdvdDNh?=
 =?utf-8?B?ODhMSUlPM2RvNjdaUW5xNzZVcGl3RVROcE40bkkyWFl2dUIzUXdkNVBXQUI3?=
 =?utf-8?B?N0dMOGRFdWwxNENIYlNBTkJHb0F6SnlITk02dU5NSDdhMjE0WUl2UjZtTEYy?=
 =?utf-8?B?UlJjcHRjWXZzM0QxWnY1QU9nZEhQaEg4NUNmRXpOcTB0b2pDR2Jaenk0VS9L?=
 =?utf-8?B?QjlzWjhmWjg5czVreSt5K2thZnFEUnI0cUp4YVE1OFlxUEYvYWRnK1pVdE9y?=
 =?utf-8?Q?2j8WzqwTZez4y5gDfmS+hPuT2xgJ7GR+8QtgW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a41e8cb-5595-471d-d0f4-08ded03c6ed0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 08:58:31.2775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LXaNQgO2fvDr5wRo0Msu62/c4P7AC/HiiTUR+GRelOYe/U/J9iUdJKIuSbcfRFZ7cUgDiXwin3i5MkfcxONAT1x70h/4r5gzo8Aj+93+5prKyzkrYN8OeuvPm683kIjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65341-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 56E726AE05D

> Add camera parallel interface (CPI) node.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index a72b2f1c4a1b..b504f99f6acd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
>  		status = "disabled";
>  	};
>  
> +	parallel_cpi: cpi@58261000 {
> +		compatible = "fsl,imx8qxp-pcif";
> +		reg = <0x58261000 0x1000>;
> +		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
> +			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
> +		clock-names = "pixel", "ipg";
> +		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
> +		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
> +		assigned-clock-rates = <160000000>;
> +		power-domains = <&pd IMX_SC_R_PI_0>;
> +		status = "disabled";
> +	};
> +
>  	pi0_ipg_lpcg: clock-controller@58263004 {
>  		compatible = "fsl,imx8qxp-lpcg";
>  		reg = <0x58263004 0x4>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> index 232cf25dadfc..5aae15540d6c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
> @@ -62,6 +62,14 @@ isi_in_2: endpoint {
>  				remote-endpoint = <&mipi_csi0_out>;
>  			};
>  		};
> +
> +		port@4 {
> +			reg = <4>;
> +
> +			isi_in_4: endpoint {
> +				remote-endpoint = <&parallel_cpi_out>;
> +			};
> +		};
>  	};
>  };
>  
> @@ -95,3 +103,22 @@ &jpegenc {
>  &mipi_csi_1 {
>  	status = "disabled";
>  };
> +
> +&parallel_cpi {
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			parallel_cpi_out: endpoint {
> +				remote-endpoint = <&isi_in_4>;
> +			};
> +		};
> +	};
> +};

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>

-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

