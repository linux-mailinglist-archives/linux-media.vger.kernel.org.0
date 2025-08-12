Return-Path: <linux-media+bounces-39551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B800DB22263
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6248C7AB04E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D1D2E7654;
	Tue, 12 Aug 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iJhy5PFk"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6282E7641;
	Tue, 12 Aug 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754989758; cv=fail; b=O90QkG3PYfMWotn+wYxf6OJGX8KpuP2dKceb9Vh5sQxqsWsw5HqoDWPRHbS6SfMnWc1yVTzqzQ2yfp1QF5+QGuJeXEyLLmz32lKYJQu9EnDhOhojPVyMVf4Eq6cfAfGB/sUa/uvCeAiAzeCgLxVAFYphYXgJ2VZz8SnQZuxXqTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754989758; c=relaxed/simple;
	bh=sdRuOn34ta9541SitXEVhzzMaOTm5yjxxRa/+8F1GzU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HrC4RCKB2bQGkX+VsAhSdVkEl3DQo6is9fPo5h/guuyFAHDsFwbCoWsiDv205+ffGui8qj8G7np/Za4XIjSFCL5tUe4cnR2Xuu6uX0jBiiMWEWto+cuqPIvSz3dumLHPCXn6UBGncVDLyfc/dRJCi1uwH0si0gyd90hHa4BLWxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iJhy5PFk; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghEekmhUNKNfNcRjb9ooNUio7MAxDDT9n8vy5xshlSppUDjBT9SwOk+9Ph/tHHvl0JPRE4nTAJynOCuBampb3JB0UFxdTBtrKJO5CsoVnxkFN487qnohPsrXk1pes8VE9gTNhLvArv685gR7FsEntysTvZHDPmKnGMcYnmm5WP2Ssry9luKKNv723u0/I7qyJ4gloRV5+GPyPj7Yq+66B2qVFu5MXJ3UyO/1NqSQSNQZboHm/4LL6qdAZTp20mJYZO1kFIt60hDTli8LxjG0vgSTN+B8b6+HEKwJQBgaqj0Hq1YvGFlXhRWFtJFw/3u42/e7/6K73ECItA5fSuA7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sZj1bYhKjACuubWLzXl01alOqWiQ947yJkOOYxbmP4=;
 b=I+NwkQL5YWXmb+74tWABpfvRcvQIlXYEbSb1FZewcvr9sqkL767AV9E4JqsC3sz8kfY/7VvrPG/PVIEoFPtnDTTaLJYAtayd2OE1O9HZWI4X6R7wTLnEfSUnOqKYrX3WCd+J4qbiTx+7A80bkDeEC0t4Z7txT009b7Y1CH9jva4vmudP1O8vTGI67dwcZbWauVl6Ar8eF/DwoORGsBgfqA1zIGgafrEsfS4agCcaCbKogkPA1H8S4pNyVq7/DCRHkatHssxlgCNZl39dANl0GGgc1qmBBUruAScuu0Gcbt9BeyFCDdCvbqZd2wa70pN6wwbOYGYsytSOhyunHbbkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sZj1bYhKjACuubWLzXl01alOqWiQ947yJkOOYxbmP4=;
 b=iJhy5PFkoF++7hnQKaJg5089Z/W30Q0HtdZsvcvQTFUQhfUpeDdp+rI5X/WvAnSuju/NYb5BvsMPJWQ8CTLAWI79ieJ3/mcj2b6g5lecYb+CHGOUkHjFdXKzJjM3nVTuW5qSeq6LQtmddRndEMXhK3Egkd+LB3OwF9AGRlMLIjMw/YxrMaRdl9C1lFvuQV3ugALy7EI/aiQXtWJNQqfvMBbBoSHTLfaDUVaupZqGV3GldxMrrv408lK03rFMSeHesotuchQoZeb6bZl11If73yncsrknD3/0tFYsmBGNX2sJK+5RpeBQuRpbWJi2xQ90p5rbdaMl0QMj2OgfYIOjJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 09:09:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:09:12 +0000
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
Subject: [PATCH v2 0/3] media: imx8mq-mipi-csi2: Enhance the driver to meet more usage case
Date: Tue, 12 Aug 2025 17:08:40 +0800
Message-Id: <20250812090843.1035800-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0117.apcprd02.prod.outlook.com
 (2603:1096:4:92::33) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU0PR04MB9251:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a17a24f-a115-4b9d-0854-08ddd97fe6f3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UnlVd0lZWmZ6QmVSeEZhYU1YeTZaMHJ2dmc2NXozMVNtMEpPR2owcFBRelFz?=
 =?utf-8?B?Ykh6QkE1RVpPS2NHVXo4b1BsYWFJOEhMM3pRaWwzdCtLOHpudU1ucWNhLzd4?=
 =?utf-8?B?N2oyZmUzYVhwVTAxeUdVUzd1RGVadER3TUQvZ0o3V1ptOGNHazdsaXNvNFpz?=
 =?utf-8?B?MC94VWhxQW5aNlpUYmwyeDhYcVZBejduN2d3K01zdjhFdXdjWitLRHFlWkRq?=
 =?utf-8?B?SFFtdFVGWlozbTRVcGk4cmJXbVRqK0QvKzJSQnZITDVva2M1RmY5elpid09a?=
 =?utf-8?B?ZCt3cGt2YWtkdm9XMUZnZ0N0UUxITEV1OG8vUTJuV1k3dll3S0VBRTZ2VUdF?=
 =?utf-8?B?aWhkTkk4ckdxZDJMTnBxTlNlQzJ0eURhS21temhjRU91azNVM3V0MlJLRmVQ?=
 =?utf-8?B?ZHpxRmxwYkJTYjAxQ3pXbnZyTDEwM3N4bDdsb0NBM01wMzd5RlhUU2lRUDBB?=
 =?utf-8?B?cUc5OGlDenBhc3JkMVFzSmR1VmRtbFlwLzU4aWdCWldUeWxPc2xiMitaME1n?=
 =?utf-8?B?NjRhZEMwVnJwamhHbnllZS9CdkJSM0JzQ2NKY2krTEp1UkliMUZkQzlzUVVM?=
 =?utf-8?B?b0Z4SjJsNFZNVHExVkx6dVBMeHU2VlZUdE1GWW83ZEV3blBWbStOS28yTWcx?=
 =?utf-8?B?TXRDZWg0SVVRd1lWZjNlVjJya3N2Vkttb0Y4Y29vc3JCaERITG1FZ1NHYjNw?=
 =?utf-8?B?K0pxN0NNcTRPNFVBcHhHVzVEUzUvYXM5RDJzL081cVFsSW9HQ2V2MEFSOEdD?=
 =?utf-8?B?TkI1bFB4b1E2ZVZxN2pmWHdnam5SL0ZUVkJiUlRUdmhVRTg0Nks5R1o4dVFZ?=
 =?utf-8?B?ZzNlQTZwS1lrZmh5M1BITytJT3h5QVVxR3J4VXpmaWJUcVQwQUFibXd3cXJD?=
 =?utf-8?B?SUp4NklyMDdwQ3l1QlpyRVBTMTczejRrTDNxY3ZRODJDZ1pBbi8rcGtWM0JN?=
 =?utf-8?B?ZmNmTzFTeGwwc3ZKdXpZQ1YxZm1XUGJaMngxNFNBTElzaUZXY2pjQis0aXNv?=
 =?utf-8?B?RjBSR3VaYjY0TWxHc1hkbzNndjBWS25JOWo5V0E1SWp2OUNTUmMxRnBFcDI4?=
 =?utf-8?B?b0hDM0tkaFVZVllmakVuaE5kRXNXdG4zUnZhMWhXL0Nuc3FaeFl2Y0IyZDJ0?=
 =?utf-8?B?Und3UW5Bc0pPUFk0RUZvVERvZjRKem1ESmFRMTg3dk1MWnVXaThGc2xUcmp1?=
 =?utf-8?B?aGhNVE1hV3VpcEcvMkw2UkVkZ253TVBWU3E3TVJORjJzS3NIbzFWSU1tdjVW?=
 =?utf-8?B?WWMwRko0TFM5ZEMrMjhpMW9oSE42bjJQNTU3QTQ1cjZhYlo1cWtxTWgrMkJP?=
 =?utf-8?B?V04xVVhwRStUUndwY05wdlJLUkhNZGVDSW5kNEZ4bDkwSUtPNk1GODVHNVBN?=
 =?utf-8?B?TFJXMCsrOTFpSGQrQVFQd1pyOGpOeGhlUjMxNldxRUFQaytQcWRXaXAvTVhS?=
 =?utf-8?B?SVllR1lSWityby9uOS93dVRxMDdUQkp3b1JYMm1CaXlKK2JhaW5ROU5VbU1E?=
 =?utf-8?B?RzA3Yy9UNVpMdE5WelBVVjl3R2NFYXQwTUhrNVJWcDU2aXpHTE9mNWUxdlVN?=
 =?utf-8?B?NkF0WWFzUWsyRjJYVVEwZG56MndaYTM0dVhQNjV5RTFwUVVxL1hQeGtGcHNK?=
 =?utf-8?B?TDh0VkdwSFQvd08zdmJzdlRXeEo4VEFaR3N6YnBleHFJamZSckhhVUVZNVpp?=
 =?utf-8?B?bFFSVS9ZaXdXb0tkVWo5VmNPNzk4eWppemZlNDBuUTM5ZnFzczdsVFFIYlVp?=
 =?utf-8?B?RjFyc1h5a1FZUzhESFJsb2t5WWlPZkYvTHZqZmpCNkgzNFduY1U0aXJtWEE1?=
 =?utf-8?B?b1JSbC9jaHowNmlpMUNNY0V0ckt2b0JxZU43bjU0Z1pyRUxuTS8vb09pdGxH?=
 =?utf-8?B?RDFTUXhORmtDc2xPbGVaYmVVaURLZEdRakU0TFRkTlNXRjVhMGdkWnU2WTZF?=
 =?utf-8?B?VGgrTVdnemJqem1OK2F6anIxOTVORDkxYllFek5zK3k0RDF0ZXo2VHJ1Vkpw?=
 =?utf-8?B?Y1hrTkJkZXFnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dytySlFtY3ZkZDB4UDhFV3lRZTBPciticmFMdGtRREoxSkVseDJrOTNidzNk?=
 =?utf-8?B?UHFCZGk1MHZXaEhSbzdleVZSVXhYamladExsc1gvamJzZXNWQVZYTlBsUmlT?=
 =?utf-8?B?TXJiaWJDYkdLSXpHN0MzMjc2NU5tanNDL0ozby9rWHNXQWtlYWYvdEZ4Mi9a?=
 =?utf-8?B?czdBSEp6ZXlyc2VGWC83aGkyc21VMHNWMStLTE9RSFVIcEdWMmJBNFNzckI3?=
 =?utf-8?B?TmRrMWtjcS9jU2h5U3RRM0pXZEpQOFVCby94WTZFVXZDejhyZTZCQVdhcnpp?=
 =?utf-8?B?V3hOMDd3ZXhVWTZPNWlqelhXS09VbXdEWDlMVEZtdmxKMlNxVlh4YWU1ZnVv?=
 =?utf-8?B?RlVFZ1RvNmRuSWZ4RXlxWmcyWXZVTjNtblRHNDl1ajE3NS9GUzJtcTlsUlhG?=
 =?utf-8?B?dHA1N29DMm9KTXJnQ1RtT3p4VmZCRmVDQXV3bE1MbUt3ZFpLOWtYQ3dTZld5?=
 =?utf-8?B?alE4ajR4VWtHYXRYb2ZDT3VkeG9sakZrWUZHNHB1UmRCaExONGZ1QmZtTE5I?=
 =?utf-8?B?ZjVqalR4VDZiN3R0YkVEdzEybEZkazJGUFh5cmNUQWVFKzNWbitSb2NhVzRR?=
 =?utf-8?B?Q2lHWWlodlpzaGU2YWtSWFVhdjQwNzNYbmlINlpvRGI2N2tBcVBxSzZCWjFx?=
 =?utf-8?B?WVNsYllHSXYzdjhNT0ttdUZqQ2t6Vk5MeTM0dndkK1FLcHZtOWNPaXhlLzBF?=
 =?utf-8?B?LzFBNmQ1MHlRYnZwUGNuQkVyaGkyQk0xNmdJTDAvemdyVTFJckhCWUs2VE9U?=
 =?utf-8?B?SnRiZDVBZHpqZzk4SzBtMHRZMHV3Y2EwY3lyUDkxRTRRWGVyYVRrbXM1cEd1?=
 =?utf-8?B?c09ZYW5ya3RGbHFCUGpWak5yQ3Z0YWFyTVFCR1Y0dUg0ajJ1TmhablBCdkha?=
 =?utf-8?B?cllUOWpwdGVxQXFkNlM0TGxUUVV4RWlRSnpHdlF5UkhhZzZoT0MvWEdORmQz?=
 =?utf-8?B?alpGUFlCOXRqd0kwZURDQXJOUnNRMXQyTUU5MmNiMG5qaW4xNlYvM1dlalU3?=
 =?utf-8?B?VStBazB1U0hXM3pIdzlrZnZycjN6Qk9UMWtPQ0gxRjJwZDZidk9rSXNqbXNz?=
 =?utf-8?B?SFFJKzBGMGlhbVNDaU5hTnFCTXNHdW1XQzB0dzNVN3d1YmdSNDUzR0NNbzk0?=
 =?utf-8?B?WmxZSHBLeFNxb08wODhyR09HeGxtUzQramhnbnVObWk5RllqTkZ2cWlJdmFY?=
 =?utf-8?B?R21qNVNCTmdFU1VrREhpRzJORTBJcWJoL2NkZDJsbEhjWXNuK2I3VEdncFdL?=
 =?utf-8?B?dFZKTE0vZHBrTlFXMmhyTVg1WjcwVDZSaHpXOWxoZHMrQUdxL0ZkMjg2Qzkz?=
 =?utf-8?B?SnhqdzIvWmlMSm1RV2xSRExLMFVzVkx2RmZEdENUMmlPMGJ5VytkTkd4U1Vj?=
 =?utf-8?B?M2NkU05LalcvU09ac04yWXBoK25qcFZ1WE1FSFloN21mUmFTT0dxZSt6cWN3?=
 =?utf-8?B?dXU1UjhPMGFEMk9OR1VMNG83U0tabEg0SGtJOUJEc2FHVG5IRDh1N0RyUElj?=
 =?utf-8?B?cjQ0WXFWaG9MbHdSdVlKTE1aWUJGVnFNMlBzRXRVd2dTWWlLaHdHSVJQVTd3?=
 =?utf-8?B?dmo1REpCYlFBRHFTV3hhSWtXLzcwNlNLMVJJalBxRGtiVWJ2TXNoT0t1d1FC?=
 =?utf-8?B?bmhTM05TWFRtUURaMFlyZHlCWjRwZXBaTlVmUFo1dHcwWHhyZjN5WEZpa0Y1?=
 =?utf-8?B?c3hoSXZlNUwxNFNuNHZoN2NSeVF0UHB6K1NzZzRlRFg1dFA1OU5kZXpEU2ht?=
 =?utf-8?B?WVF4RDZFaEp2VEVVVVVsNEd3Qld3dnlsUVNRR0cvd0pQT2h2aHpEcmp5cVN2?=
 =?utf-8?B?VkpKU09mU0w3ZXhxSHIzdnVpb1JKREwreW5CUGZ0VVFWUlpIaWppLzBUWUFm?=
 =?utf-8?B?SlNnRXZTc1NwRUhjeS9NZ1NvUVdrTWt3SVhXSEdsL2hXeHlMUGtjdEtOOURu?=
 =?utf-8?B?K3RUNnU5TlB6cFZzVjVxMTJhMFRtZXhCaGFtM1RNYkZCVGlGV2xBNjV4VElO?=
 =?utf-8?B?amFqUjhLV05nclBXUUJNakRJNVgraXB6SEIrcFVDRUg2Uy9PUE9KOFl1M2Fy?=
 =?utf-8?B?TUlyUlJiK1BvVmViaGhSWjQ1ZlpWRzBGTlRIUDE3MkZ4bnNBMkMyWW1LUnVy?=
 =?utf-8?Q?rzNCanch2S3MOhKRezxp3SkPm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a17a24f-a115-4b9d-0854-08ddd97fe6f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:09:12.2865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wgh8aBTt8BHvcMsDVdxEGDasOPPuN2dej39RieLVg65HcwOBuQ2sNe4QAOUyOlip3ec9y/7MbqEfcAqRiU7Brw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9251

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The bellow miscellaneous patches enhance the driver to meet more
usage case, such as i.MX8ULP.

Guoniu Zhou (3):
  media: imx8mq-mipi-csi2: Add data type field in pixel format
  media: imx8mq-mipi-csi2: Add RGB format support
  media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

-- 
2.34.1


