Return-Path: <linux-media+bounces-67192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o4R/OFHJT2p2oQIAu9opvQ
	(envelope-from <linux-media+bounces-67192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:16:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9D67335C2
	for <lists+linux-media@lfdr.de>; Thu, 09 Jul 2026 18:16:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=buxT91dj;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67192-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67192-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DDC130F0251
	for <lists+linux-media@lfdr.de>; Thu,  9 Jul 2026 16:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B13434408;
	Thu,  9 Jul 2026 16:08:46 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97B4307AE;
	Thu,  9 Jul 2026 16:08:43 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613326; cv=fail; b=gSBvve4O1m8xNXVGdxMBNYAMoJN4bbXoxqrNXZWLNOuq8JK0Hu4iOhWAkZcnm8+MN49PL0prOjIh2pRpxicZnc6QC4yGNSJnVp5vijfqloxp8OcEjXJ4v5d33/tqInsocfaH8n8lyh0iPrjBgLQ1YpNlpPtxmINeFdSNtqwETSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613326; c=relaxed/simple;
	bh=MszivSAsmLdVZKVFn4W/HozHzKt2SboloPEFp17YQ1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jxGjD8Bu0zUmahy4qN883/FU7wWVF8MmgzRMHibVXbidUMx0906Td4Y0Fd/a44u0znuRPoZ5DPasRsJ0Zc/KpvsNqq97rbgTifpnaebz9cD1RtGBM7vlfme2wg7znKKTNznhfUHS1zwwjd56faXsXu0XWNWaguGFVyPeTGB2/9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=buxT91dj; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twNBv8XXK8W8nNOeHUdSamYDtWmO2+8fJSJ4ZDMSfSM7EZUncdpMWSENfo2YRoD2a9IX3YyHzP9Oax0BZsb7T7R0/rEQ6EfwfUrYNRQFWS5SgiO7xCf+rhFl3nnuT8h8nlFZ0Jpi3qg9hCrxUPoCWcQr5tU0TEPSDATceR8h6/fSjviHwXmuJD3SbG5NwmJpdN62d2QEfR61vb7hu+BSR9a8EIiX4dx15GY+EqFmUHHQQLbsTjKbs3L3G/UcX1XLSFK3zOkddrhBDjoAfCXk1JmeQcU3D2+WEa1IkZzXAfciUb2yzOBZF20xj4C8myNIIQ2YdSeKZNffS+BzE5M+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kxVmYZyOuIaxaL8DjKm6wjrX00M2IXEJ7FUWzzF3e4=;
 b=xgaLzu+U5pPfk75QMwuxWoM089bMfKN7E7g3tAEP+KoBxUbhHGxDMaIjtSlPNFIo0ZKMaQW1mA5/zbkf8fSlIA1ZC6NadqM4IQCCPpfcFu/Fb11ZRjID7KvZYV0AwZLPrXSG7zW146F3s9eMO+azHDiyfUv3MBxFGhieGyxKQ2m4YYtuDDpel++Jmja0DpYUbdK/rBqirgrx2uss9oORAgnG8aMw/sffj9pCO1/4tBOzIdWXgHYt5TwhudELbKgTZZoKvW6KgY77RQRbKYk6zmvm5lu2/L4cLsnPTE3qjwhtPXDeuJWqyDQ024oyHP8uMeqF2Kr9/x1tCAM3Zt1kww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kxVmYZyOuIaxaL8DjKm6wjrX00M2IXEJ7FUWzzF3e4=;
 b=buxT91djXy3uMvwJspx6W922O8ZBlV6+gvxs3qUQpSHG2zIwoSmZat8ERN2GgKhxP1x1X0lnzfQEb937c3u+RJPIbblHNZ78cOUBlSy2dmxG5H1NLQx6IEv2R17RqAcf4RuP3jOYGEE1pw5J4DYzepDpuk7CLYk4CU9W8tUGFpEpBsn+zXbPupDQd7gtoFUc5k1pWf2DlRgXG/gh9GsR4C+vXTuSFTQefkCfB8lwCUaDCiXTw/64v0fuB+RaB8YdztVpqVEsL/SLZYoPVztW3PtFvESeTYDogTYGhGxZyPvnwWqF+V6302h700P0xVdveF162no4XyDMebqISX1Fig==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 16:08:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 16:08:38 +0000
Date: Thu, 9 Jul 2026 12:08:28 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v12 5/6] media: qcom: camss: Add support for PHY API
 devices
Message-ID: <ak_HfEIpXj6Aky9c@lizhi-Precision-Tower-5810>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-5-f8588da41f16@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-5-f8588da41f16@linaro.org>
X-ClientProxiedBy: PH7PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:510:23d::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f6f028-238e-4c94-5924-08deddd45622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|7416014|1800799024|18002099003|22082099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ANTtDXfx7ZFHXVHz78R9UMMHNEss/FhVhdNCdjAnaYPRCwo9STWdOmuKz3lFFdUCOIu5RtHG9qZU0ySIhKTR51c1yfUhDJ0D8RFhl0ACLOoXCv+nqVez/nR0/SMQOXsR/kqBsCK/e+/S0Gvqw1ny9IPeC77lJQssOc7bnVDvbkZzXx5o3Mm5Kg+6PK3/Jw9wCkYOCuA60jSeZu/5itnLqSsVuHYNa9e6n+NGfVUIYDkPjYugImintNGPAhbo5INtEFqdhneTV8wqFK5u8yOfbuhiz9aJE2D46M3l97Z2LNjJCnmAI/YRsnRf8wJAWnEWT/fELtFQuOr8TelIeQbJM2oH9/HPdGpOSrb/H8EY9liU/suNw+rxXutOSqNsI4SFr6F7PSwKx5r8fR8ePjfDj7FsoXRBipQUJFzpgqGGI3StTKsQv9AQOZpWi1RQ5msk29mz75qJ7zWZN5SqyQcDdG5/Wn5RzS083soSAtFeKz2CYGwSrR+WqNzShxtOC9bBLafbKOPBwa/2rA3JdsnCtI4TBCgU1Q/XhMSnbRW4FHs4USJosnQYE0FEH2lNlVxbnKlK0oyyIm+hn18P0wd/2I9xivEmtLqdXMrgj68QC49rhixK1QzC7n3skcUn7m0P+lOUxZdJONAaEl20BWDkALrSd+bI+Q0i8E0oAzPj/yQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?arA738d+FZkY0kDX1nsOkvJtYT0dP0wm/PTZTbKfBaVq2ZsiU5m+XhgfNMEh?=
 =?us-ascii?Q?hEDLFg7kNF1KOPkcRy8tKuRbUmlyRAESuvyhJZ2tMXan5WmUkOlK4r5XQvDG?=
 =?us-ascii?Q?ShBtXaM6l9/rzKob0UtDgBuH8exR4wMerEF0zD4FxdVP13h+9vpRUmZwYixG?=
 =?us-ascii?Q?qV34pWfBxbQC+roTu3OytawZ0lATFuDXbe7uk2IWNnkOT+TM9MtZhfuKsmDT?=
 =?us-ascii?Q?kd2Ep5ohMOOHUQMhxk/M9L5xGjkO5eCN7CBsGV7xkJsOcNJmK6/xAa8PwQEf?=
 =?us-ascii?Q?4r6xDSW/5oyoDBojjAbOQUbOSa4WjzH4/TEhy5mEXh5HebPwnmdOal79WSGb?=
 =?us-ascii?Q?ZUhc8IBjOEhO+4K62kfQs1jhsAyKVID0yx/a82roaFaxEQb1QXkogJ3o/GAt?=
 =?us-ascii?Q?iPRErVkV1bbDixFQITgMO/JcqKa2bVB8cQDtoyjmLRF1Ed+t/DHzpzuYDICs?=
 =?us-ascii?Q?rdHD+KYUvJxuSON2bcNO/sQXJ1RoeAlatamR/Biawduzu1L04eyOsbg+j0w/?=
 =?us-ascii?Q?K2DKLXyAK+nfj7ody6crPmo7jqseQ07UIvoRn+ORp9QAy/bcZCYawSPVGx2R?=
 =?us-ascii?Q?KpNv6spBCCbRdEC6uKUlQ9ZhTK3PcOVS1x0rhg9xXa4dCeHaRcPLLlP9Qdtu?=
 =?us-ascii?Q?3XjihImRQowIKgR+7hDTvsiLThn6KsM+PyjT/l0yQEv2YfkeZCX2uSIJJYAc?=
 =?us-ascii?Q?Gg6RKd4Cte9rgVPPdtzbLyKsUcFKDYuZRzO8o9jKtYGHyz9edVo1JqNcggnr?=
 =?us-ascii?Q?x80KKNN7zW5BPX9aOPOsqWQ4vxzfJkmTWl5Zu8S/Wj3GF1pp9M0VACs3Ju3A?=
 =?us-ascii?Q?YTEmV36nuslVxRIxiaa/dAdq2mt6Enhn8W/hVdbja91q5EIZS/HSMf+Q92KO?=
 =?us-ascii?Q?Rxqp0rCZ1Wd8dvyXF+mqnmP91PDs2fpSX8eXYcwI9u8yqXFbKemgxVwnTUtT?=
 =?us-ascii?Q?Fa4d8nYmq+XC3zEpQSYba94gCjL1HtDtqrYQHdQquwiH9PEuHNNi0mlk689P?=
 =?us-ascii?Q?GRq5179N2+qSSu9LIIqqxj25RaTdWHrBlo/cdStuAncSElOT1SvLAozm9VKo?=
 =?us-ascii?Q?H60rwuOQTZGog239jNhluvNDFbtcxcgHLv+IsoXu5lXZY7bcYwGQzz4LWpRZ?=
 =?us-ascii?Q?2GPAoVQErsK16M5tAIeH16/q3tKZ3PmBeixtWDnAXEgXNr3MAY6va/AWxTsk?=
 =?us-ascii?Q?oxTEJ8vdgsENkFzEiVF4ZVr8ictSDruXpSL/fPGOQrPLR8taNoX6AXYiGnYy?=
 =?us-ascii?Q?85yfxDcRc13AnkCdpF9foTW+nZhQwLX1kpE1uvIeChiNtkkcKpdUjT7ZSjB8?=
 =?us-ascii?Q?Bf3y5AnFqIXZtsFa82NfahsUo78jII3XgQLEednygC0QWd+j3/T9f0N55R43?=
 =?us-ascii?Q?/tOlD10Zu/5kk0gPJ6bXRIpHaGM6drn0hLfaMyBHKxXEHVX5unsayG0Ca3ka?=
 =?us-ascii?Q?SiBMW5tZGPvbJoqDl5hUUDUqLuU0XzXg5EDzrirTJcEream69MO8bMS/fWgm?=
 =?us-ascii?Q?wdn9bj3jawRwV75JK1NN7kALUSf/3UGUHBgKVzShQEnB/g6WiB//H1ftb0A1?=
 =?us-ascii?Q?oIfQzIvyMtmItxmc4HsshE4kKLefdV3QokJMWwf2lLLPrGQON+k70nOZvRre?=
 =?us-ascii?Q?XsYeLyb5ypayJdsMnR1q6YWzv92fZ76tqwVy21MIPrC4YcWeqznL120E2zHe?=
 =?us-ascii?Q?zAH3Izaalrhfc2gq6MkfsEUNWcUMOXLsA5rlSuXsSZ1r/+TKiHO+blgqAyYg?=
 =?us-ascii?Q?uoQFjjxbtmmJbDUARfhqXOrZcuqqWC/RwW296VvTFKE16Tv8KBWH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f6f028-238e-4c94-5924-08deddd45622
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 16:08:38.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMZlALeD/ge4+II3Oa4cKZK06HF8bHHCEP8F88r4a/ubPcZhqsqIdHrjJPFhCIZ/uuKnqQ28xvm0lzwJ6mKxv7+JrbHP7LKlHoHxqxRoNArhuNoxcMA7tP6e8fh+iOS+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67192-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,args.np:url,oss.nxp.com:from_mime,NXP1.onmicrosoft.com:dkim,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B9D67335C2

On Wed, Jul 08, 2026 at 01:06:59AM +0100, Bryan O'Donoghue wrote:
> Add the ability to use a PHY pointer which interacts with the standard PHY
> API.
>
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 179 +++++++++++++++++++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |   7 +
>  drivers/media/platform/qcom/camss/camss.c        |  88 +++++++++--
>  4 files changed, 245 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEOBUF2_DMA_SG
>  	select V4L2_FWNODE
> +	select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..b740edd0c67e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -7,12 +7,14 @@
>   * Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2016-2018 Linaro Ltd.
>   */
> +#include <dt-bindings/phy/phy.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <media/media-entity.h>
> @@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format_info *formats,
>  }
>
>  /*
> - * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY module
> + * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIPHY module
>   * @csiphy: CSIPHY device
>   */
> -static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
> +static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
>  {
>  	struct device *dev = csiphy->camss->dev;
>  	s64 link_freq;
> @@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_set_power(struct v4l2_subdev *sd, int on)
> +static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
>  {
>  	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
>  	struct device *dev = csiphy->camss->dev;
> @@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>  			return ret;
>  		}
>
> -		ret = csiphy_set_clock_rates(csiphy);
> +		ret = csiphy_set_clock_rates_legacy(csiphy);
>  		if (ret < 0) {
>  			regulator_bulk_disable(csiphy->num_supplies,
>  					       csiphy->supplies);
> @@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>  }
>
>  /*
> - * csiphy_stream_on - Enable streaming on CSIPHY module
> + * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to enable streaming on CSIPHY module.
> @@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_stream_on(struct csiphy_device *csiphy)
> +static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
>  {
>  	struct csiphy_config *cfg = &csiphy->cfg;
>  	s64 link_freq;
> @@ -306,11 +308,89 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> -static void csiphy_stream_off(struct csiphy_device *csiphy)
> +static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)

suggest put these rename to prepare patch to reduce review efforts.

>  {
>  	csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
>  }
>
> +/*
> + * csiphy_stream_on - Enable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to enable streaming on CSIPHY module.
> + * Main configuration of CSIPHY module is also done here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +	u8 bpp = csiphy_get_bpp(csiphy->res->formats->formats, csiphy->res->formats->nformats,
> +				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +	struct csiphy_lanes_cfg *lncfg = &csiphy->cfg.csi2->lane_cfg;
> +	struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +	union phy_configure_opts dphy_opts = { 0 };
> +	struct device *dev = csiphy->camss->dev;
> +	u8 num_lanes = lncfg->num_data;
> +	s64 link_freq;
> +	int i;
> +	int ret;
> +
> +	dphy_cfg = &dphy_opts.mipi_dphy;
> +
> +	link_freq = camss_get_link_freq(&csiphy->subdev.entity, bpp, num_lanes);
> +
> +	if (link_freq < 0) {
> +		dev_err(dev,
> +			"Cannot get CSI2 transmitter's link frequency\n");
> +		return -EINVAL;
> +	}
> +
> +	phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num_lanes, dphy_cfg);
> +
> +	phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +
> +	ret = phy_configure(csiphy->phy, &dphy_opts);
> +	if (ret) {
> +		dev_err(dev, "failed to configure MIPI D-PHY\n");
> +		goto error;

no extra clean exist, return ret here.

> +	}
> +
> +	return phy_power_on(csiphy->phy);
> +
> +error:
> +	return ret;
> +}
> +
> +/*
> + * csiphy_stream_off - Disable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to disable streaming on CSIPHY module
> + */
> +static void csiphy_stream_off(struct csiphy_device *csiphy)
> +{
> +	phy_power_off(csiphy->phy);
> +}
> +
> +/*
> + * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> + * @sd: CSIPHY V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
> +{
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	int ret = 0;
> +
> +	if (enable)
> +		ret = csiphy_stream_on_legacy(csiphy);
> +	else
> +		csiphy_stream_off_legacy(csiphy);
> +
> +	return ret;
> +}
>
>  /*
>   * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> @@ -572,16 +652,16 @@ csiphy_match_clock_name(const char *clock_name, const char *format, ...)
>  }
>
>  /*
> - * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure and resources
>   * @csiphy: CSIPHY device
>   * @res: CSIPHY module resources table
>   * @id: CSIPHY module id
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int msm_csiphy_subdev_init(struct camss *camss,
> -			   struct csiphy_device *csiphy,
> -			   const struct camss_subdev_resources *res, u8 id)
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +				  struct csiphy_device *csiphy,
> +				  const struct camss_subdev_resources *res, u8 id)
>  {
>  	struct device *dev = camss->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -709,6 +789,60 @@ int msm_csiphy_subdev_init(struct camss *camss,
>  	return ret;
>  }
>
> +/*
> + * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
> + * @csiphy: CSIPHY device
> + * @res: CSIPHY module resources table
> + * @id: CSIPHY module id
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +int msm_csiphy_subdev_init(struct camss *camss,
> +			   struct csiphy_device *csiphy,
> +			   const struct camss_subdev_resources *res, u8 id)
> +{
> +	struct device *dev = camss->dev;
> +	struct of_phandle_args args;
> +	int idx;
> +	int ret;
> +
> +	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csiphy%d", id);
> +
> +	idx = of_property_match_string(dev->of_node, "phy-names", csiphy->name);
> +	if (idx < 0) {
> +		dev_err(dev, "%s not found\n", csiphy->name);
> +		return idx;
> +	}
> +
> +	ret = of_parse_phandle_with_args(dev->of_node, "phys", "#phy-cells", idx, &args);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to parse phys args %s\n", csiphy->name);
> +		return ret;
> +	}

why need check these information manaully?

> +
> +	if (!of_device_is_available(args.np))
> +		goto put_np;
> +
> +	csiphy->phy = devm_phy_get(dev, csiphy->name);
> +	if (IS_ERR(csiphy->phy)) {
> +		ret = PTR_ERR(csiphy->phy);
> +		goto put_np;
> +	}
> +
> +	csiphy->camss = camss;
> +	csiphy->id = id;

id information should keep into phy device, you can use phy-cells to
pass down it.

If you index is important and convince you should use
devm_of_phy_get_by_index() function.

> +	csiphy->res = &res->csiphy;
> +
> +	ret = phy_init(csiphy->phy);
> +	if (ret)
> +		dev_err(dev, "phy %s init fail %d\n", csiphy->name, ret);
> +
> +put_np:
> +	of_node_put(args.np);
> +
> +	return ret;
> +}
> +
>  /*
>   * csiphy_link_setup - Setup CSIPHY connections
>   * @entity: Pointer to media entity structure
> @@ -743,8 +877,12 @@ static int csiphy_link_setup(struct media_entity *entity,
>  	return 0;
>  }
>
> -static const struct v4l2_subdev_core_ops csiphy_core_ops = {
> -	.s_power = csiphy_set_power,
> +static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
> +	.s_power = csiphy_set_power_legacy,
> +};
> +
> +static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy = {
> +	.s_stream = csiphy_set_stream_legacy,
>  };
>
>  static const struct v4l2_subdev_video_ops csiphy_video_ops = {
> @@ -758,8 +896,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_ops = {
>  	.set_fmt = csiphy_set_format,
>  };
>
> +static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy = {
> +	.core = &csiphy_core_ops_legacy,
> +	.video = &csiphy_video_ops_legacy,
> +	.pad = &csiphy_pad_ops,
> +};
> +
>  static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
> -	.core = &csiphy_core_ops,
>  	.video = &csiphy_video_ops,
>  	.pad = &csiphy_pad_ops,
>  };
> @@ -788,7 +931,11 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>  	struct device *dev = csiphy->camss->dev;
>  	int ret;
>
> -	v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +	if (IS_ERR(csiphy->phy))
> +		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
> +	else
> +		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +
>  	sd->internal_ops = &csiphy_v4l2_internal_ops;
>  	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>  	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> @@ -828,6 +975,8 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>   */
>  void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>  {
> +	if (!IS_ERR(csiphy->phy))
> +		phy_exit(csiphy->phy);
>  	v4l2_device_unregister_subdev(&csiphy->subdev);
>  	media_entity_cleanup(&csiphy->subdev.entity);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..1879826034aac 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -12,6 +12,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> +#include <linux/phy/phy.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-mediabus.h>
> @@ -97,6 +98,7 @@ struct csiphy_device_regs {
>
>  struct csiphy_device {
>  	struct camss *camss;
> +	struct phy *phy;
>  	u8 id;
>  	struct v4l2_subdev subdev;
>  	struct media_pad pads[MSM_CSIPHY_PADS_NUM];
> @@ -104,6 +106,7 @@ struct csiphy_device {
>  	void __iomem *base_clk_mux;
>  	u32 irq;
>  	char irq_name[30];
> +	char name[16];
>  	struct camss_clock *clock;
>  	bool *rate_set;
>  	int nclocks;
> @@ -118,6 +121,10 @@ struct csiphy_device {
>
>  struct camss_subdev_resources;
>
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +				  struct csiphy_device *csiphy,
> +				  const struct camss_subdev_resources *res, u8 id);
> +
>  int msm_csiphy_subdev_init(struct camss *camss,
>  			   struct csiphy_device *csiphy,
>  			   const struct camss_subdev_resources *res, u8 id);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index e814a96953b1b..146fea438486f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4794,14 +4794,51 @@ static int camss_parse_endpoint_node(struct device *dev,
>  static int camss_parse_ports(struct camss *camss)
>  {
>  	struct device *dev = camss->dev;
> +	const struct camss_resources *res = camss->res;
>  	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
>  	int ret;
>
>  	fwnode_graph_for_each_endpoint(fwnode, ep) {
>  		struct camss_async_subdev *csd;
> +		struct fwnode_handle *remote;
> +
> +		if (!fwnode_device_is_available(ep))
> +			continue;
> +
> +		if (res->legacy_phy) {
> +			csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
> +							      typeof(*csd));
> +		} else {
> +			struct fwnode_handle *phy_out, *phy_node, *phy_in, *sensor_ep;

use auto cleanup __free(fwnode_handle)

> +
> +			phy_out = fwnode_graph_get_remote_endpoint(ep);
> +			if (!phy_out)
> +				continue;

anyways, parse phy node here look like not good enough, which should below
phy's task.

Frank
> +
> +			phy_node = fwnode_graph_get_port_parent(phy_out);
> +			fwnode_handle_put(phy_out);
> +			if (!phy_node)
> +				continue;
> +
> +			phy_in = fwnode_graph_get_endpoint_by_id(phy_node, 0, 0, 0);
> +			fwnode_handle_put(phy_node);
> +			if (!phy_in)
> +				continue;
> +
> +			sensor_ep = fwnode_graph_get_remote_endpoint(phy_in);
> +			fwnode_handle_put(phy_in);
> +			if (!sensor_ep)
> +				continue;
> +
> +			csd = v4l2_async_nf_add_fwnode(&camss->notifier, sensor_ep,
> +						struct camss_async_subdev);
> +			fwnode_handle_put(sensor_ep);
> +			if (IS_ERR(csd)) {
> +				ret = PTR_ERR(csd);
> +				goto err_cleanup;
> +			}
> +		}
>
> -		csd = v4l2_async_nf_add_fwnode_remote(&camss->notifier, ep,
> -						      typeof(*csd));
>  		if (IS_ERR(csd)) {
>  			ret = PTR_ERR(csd);
>  			goto err_cleanup;
> @@ -4833,15 +4870,26 @@ static int camss_init_subdevices(struct camss *camss)
>  	unsigned int i;
>  	int ret;
>
> -	for (i = 0; i < camss->res->csiphy_num; i++) {
> -		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -					     &res->csiphy_res[i],
> -					     res->csiphy_res[i].csiphy.id);
> -		if (ret < 0) {
> -			dev_err(camss->dev,
> -				"Failed to init csiphy%d sub-device: %d\n",
> -				i, ret);
> -			return ret;
> +	if (!res->legacy_phy) {
> +		for (i = 0; i < camss->res->csiphy_num; i++) {
> +			ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> +						     &res->csiphy_res[i],
> +						     res->csiphy_res[i].csiphy.id);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	} else {
> +		for (i = 0; i < camss->res->csiphy_num; i++) {
> +			ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
> +							    &res->csiphy_res[i],
> +							    res->csiphy_res[i].csiphy.id);
> +			if (ret < 0) {
> +				dev_err(camss->dev,
> +					"Failed to init csiphy%d sub-device: %d\n",
> +					i, ret);
> +				return ret;
> +			}
> +			camss->csiphy[i].phy = ERR_PTR(-ENODEV);
>  		}
>  	}
>
> @@ -4931,6 +4979,9 @@ static int camss_link_entities(struct camss *camss)
>
>  	for (i = 0; i < camss->res->csiphy_num; i++) {
>  		for (j = 0; j < camss->res->csid_num; j++) {
> +			if (!camss->csiphy[i].phy)
> +				continue;
> +
>  			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
>  						    MSM_CSIPHY_PAD_SRC,
>  						    &camss->csid[j].subdev.entity,
> @@ -5057,6 +5108,9 @@ static int camss_register_entities(struct camss *camss)
>  	int ret;
>
>  	for (i = 0; i < camss->res->csiphy_num; i++) {
> +		if (!camss->csiphy[i].phy)
> +			continue;
> +
>  		ret = msm_csiphy_register_entity(&camss->csiphy[i],
>  						 &camss->v4l2_dev);
>  		if (ret < 0) {
> @@ -5132,8 +5186,10 @@ static int camss_register_entities(struct camss *camss)
>
>  	i = camss->res->csiphy_num;
>  err_reg_csiphy:
> -	for (i--; i >= 0; i--)
> -		msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	for (i--; i >= 0; i--) {
> +		if (camss->csiphy[i].phy)
> +			msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	}
>
>  	return ret;
>  }
> @@ -5148,8 +5204,10 @@ static void camss_unregister_entities(struct camss *camss)
>  {
>  	unsigned int i;
>
> -	for (i = 0; i < camss->res->csiphy_num; i++)
> -		msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	for (i = 0; i < camss->res->csiphy_num; i++) {
> +		if (camss->csiphy[i].phy)
> +			msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +	}
>
>  	if (camss->tpg) {
>  		for (i = 0; i < camss->res->tpg_num; i++)
>
> --
> 2.54.0
>

