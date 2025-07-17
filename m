Return-Path: <linux-media+bounces-37946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F81B0863C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39D637B679C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BF121C177;
	Thu, 17 Jul 2025 07:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rtii5Awx"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284A21A436;
	Thu, 17 Jul 2025 07:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736320; cv=fail; b=l10yh94g14fzzZQ/3wVUUE5rWf7G7hOqczEsI4Tq+nOXh2fJ2DqCl5C7q1UgKGGEQ6ZljndakaJItKee9r14kxYTMPU3CBjmwnBKvgBS1QnLwp5oS7PFARfikFJjnEFlrYOykwwbj5TnvwxfUu7fTZKuPjpK4ixBJKs6pFDrx/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736320; c=relaxed/simple;
	bh=HBIiMIIPASbHo3s6WOYj1j8CVBNqNFXK/uwebusVUlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XbfnvRJrR8Ijl/lskgNNPZdweY9LsGty4M0w2SF12kliPrkeEY2IGmrvbIj1WOLO8Ga2H8Il66lTxRilIuUjwc5OfuUJK2QV1sE2hgZfuk410+vERrk3C42PPe0Fetp5RhhTwoDF+LOZJ/pz0StYErBWaayEbiiCZlXsDgoZRF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rtii5Awx; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AD6OuHabK5vrb3V5q2DH4Wv3XoNEuQ80Tsy0Iz2LRJa6bwNkzUAW1CpQSn9rNfXuHrJn+8IbwFTkpqDO8Ou/be/XxAD1EfgYGUBiI85Mv8Gq4i7XZ3ts/CUsX7FAuVrWWB7GRS1FswxnFGketZvzIJMCm9Sh79/tT3RQ72HMe3cgn2YaJmVqP4jpix4YcIUXplzOGQ+abXniKN8CWP4HXKzKIDUwYReYxovrxEDV4+FQvn9CwI8GW+sOUIOvadKZg48B6Hi7yO1jfUvuST1JlSVLbI78Inku8yfBHycNv2jXpEJ6p/dzni8gApyFnzViQo3+SuJUpS4a5BgG10Yl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEr/wpzUoVjKI7Nuw1kW7n1W+ZW2MhkRC+JzOp6lTM8=;
 b=rbp6SrPIurPXCnQWM/EybkQqeCp5IoOK9OnUyu2H1kvYTOb4AxkpmetPyu8R10CWrNNKhvlJ0eDbBJiL5XALlXuvFMUecWcuLgq03bXlXXnMpcQ9R3wGevcaA7mZYDN7AVWBuoqA7rAPyyymhr4wg6UoR/wA4CzwGmdodclkOR1z6p1TY2qEMGZPHQBkCsgAgD/eH0VVCbOs6c2B3D7ltjEhWZfHc3SBbu/Rf6yZOWQuUTSexupKMSRa8xh1JWYgmPW6y4k0yjxN9TvaYacj0lsyHsmT09qTPU4dZ3OyElsZ0PgDyG0U759vuYFAfupx6xci6kbc9vW+GhprnhPIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEr/wpzUoVjKI7Nuw1kW7n1W+ZW2MhkRC+JzOp6lTM8=;
 b=rtii5Awx1FkT7D/8O8ApPqlJCSZYyAgcvF0QSR5cBT8R45Zu+aM3gPFs6UYrFgpDg0VWRCFeVdXza/SzNnplqh2DhVteErqTeY2poHL3WvQR1fJwByRcq2ec9SLdQuN4rzOckMRKQxOxWBYWB1jsgZjWJUlwcc6OvrUe7SMM47WsFuL84dzJhgHbFaKHVv4yButpK9GX43Bt2DoM+0xl7iNLaBKGLwDFEwN4pOUV4PPnpj7rynMpnUPg43sZCH3cCKKnGyNsKZTmxDqN+9tj3SkRrctGqAUeb3Wwuyy4aNyfFpP3k0btEt3s7Xh75dmnovEspqMVzEnis3Qn21PVwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:11:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%2]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 07:11:55 +0000
From: guoniu.zhou@oss.nxp.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm
Cc: mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: imx8mq-mipi-csi2: Add data type field in pixel format
Date: Thu, 17 Jul 2025 15:13:57 +0800
Message-Id: <20250717071359.1910515-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
References: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 027d7858-fa54-43d3-de9c-08ddc5013608
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?STIxeFNOZ1dRYzBoOFd6MWw3WlVDOS9vbXpNQm4wdU13UnNqaUwvTlFIZ2tU?=
 =?utf-8?B?RnlVRzJVSTlPWjJkRS92RnE5NHZSK1BpbVVoZGRmL3lwRXFTVUMwcWQzc0N6?=
 =?utf-8?B?S05ySmNpV0lEL1hkdEJHSW1kTHZ5bTUrMGJzYkJJZ09WRTRqOWl2TXRQQ1F1?=
 =?utf-8?B?SEk2V0QrRTdnUE5DZ0JDcmVQamNzR3gyQ0E4K3RKUUM4TWRKN2pHRXJodHQx?=
 =?utf-8?B?TW9jb002dlIyYnpBc1JlenpjNVdQZ2p2VFFrYVVQS2htdERHbWYwa1FtbS9l?=
 =?utf-8?B?alBGOGhmN1RFMjA5SlhuVkJnY2t2VFE1Q3JBdW9vYXd2SHdDMHM2RjBzK05N?=
 =?utf-8?B?U1pob0hjc09KbVZ0SnVVK0RudUR2SmYyM0k4dmhzWnU0R05uZjV4VHRINnBh?=
 =?utf-8?B?WXNoRFRNa3g1RXJzWW1zQ2JISUU1ZUR6akxiSWE5SlB5bHVmVGYxdmQ0RzRY?=
 =?utf-8?B?K2NUejRzMU5iSC9zQzNEamZyYkV5SGtScVY1VExpNUM3WGg2UHYvei9oc2tq?=
 =?utf-8?B?UGViZW1LZDJhcDl0T2EzZTdsd3Iyd29jRmN6T2VzVkV3NkpRZ0NGMDdVdzNP?=
 =?utf-8?B?S0RIWmh6VWY5bStEYUFqY0FzRlZSS2hLOGgwRXN0eVFpVVIyMzczU3ZKVXZl?=
 =?utf-8?B?cWFHNjFwaTRaQ0RzdTQ2VnpmOEZLQldmdTYvWjRsZFVvVGttclArZCtXdjg4?=
 =?utf-8?B?QkF1OGYyZjRSMHc5UkZNZjduUTJNMWwwaXozZ0Z3YmRyT05CejBEb09xRUZ4?=
 =?utf-8?B?THhoZTNKaTRVN0JlbjFHcTJPU2lVRTRPZ1JOOGdYWmR5YTh0eklmQTNuYlRW?=
 =?utf-8?B?MVdUTUtxNmp2dkwrQWN1VnFmdG11VisxcVY0OHk1OE1aYm9zNGJxYW91ZFFJ?=
 =?utf-8?B?RnEvQ3NvTmxGaG8zM3YxTEJuWUFoZFlUSXNCdWwyVzBVM1B3UlhBT2w5T2Fn?=
 =?utf-8?B?aHQ0TXVEOGlSQ1dzb3prc2ZRQlFDTUpvOUVVcG5aNnNoNE9ETGYwcFhQWi9Q?=
 =?utf-8?B?NUdOMDZidE9ubEJvcUE0TkRCK2VQOTZ1ZHdnQkdyQkNTcXFaVFVOV3JocUdl?=
 =?utf-8?B?TWhEK25vcGFiT09sem42RVh5NGh1V240MlpRaUl4VHBpcXQ5Zk5OR1p1MkZr?=
 =?utf-8?B?Qkl5ZDVsbWhDVUsvclJ4d253RDhMdTVyVjFxeXBCQURvRy9aeGpUdzd0K2ZI?=
 =?utf-8?B?aDF3cWpydzVJRXhRcExPSTNMWHdaZmNNNzl3WVNqbmZaOE1nbjVrQlErbHl0?=
 =?utf-8?B?blVoUUxtSkhyeW1ISHhIaUVKRzE0QytkTW1yVnVyc2F4V2U4Q1l6ZVc0dUZP?=
 =?utf-8?B?aGZvTjNNckx2a21EUTNPMVRqN3lSNnJVYzhjbUtvdTJUMEJCZk9nNlRFU2E5?=
 =?utf-8?B?clNzSWUrN2RvMlBJa0tIVXlDeTkyVSsyeG5nNnVNUzhVVEtKeUtuOFZLMWRQ?=
 =?utf-8?B?UHNNRGFzZnB2UGFmK3crVGY5cUs4T0tvREdVM3drWGVxeWMyek9lN1dEa3kz?=
 =?utf-8?B?SitGQWk1RkUzcTdtVkQvVzFPazJiYTFmYy9qWEdnaU9DZVNXN1loQVd2ekZH?=
 =?utf-8?B?TklEbTNLYzR6clE2UDdKVzVMem84eWRtUUtwejRxT2ZPQkdzVUZOSEE2Ykxy?=
 =?utf-8?B?bDMzUzZKdFE2bWVhQUIzeGp5cC9NYlVFYVJ3WEp3TTJ2aklPVXg1WWxOKzJh?=
 =?utf-8?B?ZWg3dkk2TGJGTHFYZTZDdnAwZ2pJUEZ4K05ibzVBL25YU0ZMaXUxTWVWZzhJ?=
 =?utf-8?B?eTBaaW55U3IrZGZUUUhsNFJ6NnpkbEg4UTRDSERXUTlSd0cwb0hJVUp1ME1K?=
 =?utf-8?B?UnZBV0FiTkxkYXJjSGEwa0JYa3k3citnaVNDalQyQmo0ZmFhREZaL0dieWQ4?=
 =?utf-8?B?SHJlOUJZcTVzT3IvRVJxcDhrK0FSMFNIZVhOenVTZk8xOS82OGxyMTgvbU5u?=
 =?utf-8?B?ZEJhU0dmRUxCTEJvK1FpbFJyeElIY2lPUEYvNkRBZUhMSW1VblpLUnJlVmE4?=
 =?utf-8?B?cFpxbnZpYmNRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WU54TVRPUU5zektIY05ISFF4NG5vOGcyNW9wUHd3Y2ttbmVlUlFVd3BsYjgx?=
 =?utf-8?B?MjJtR2oyaXBhS2tEREQ2UXRDUExOVUhpazJ3NEN3bk5XcTdWOS9aNGkyZjA1?=
 =?utf-8?B?N1NiQnBlekljRTV1UElCSER0MkZkTzFkTno0UFNqY3pUVkh5a2x1RytFS2hp?=
 =?utf-8?B?Y1ZPMFR4NTBFNk95UUlOTmFmVy9GOG1xNEJiMFdTcGprUHBMRHVxNlVMUTMz?=
 =?utf-8?B?UThac0QrVnBoZnNnNUo0UG54Nm9VcnBDT1NUQUMrWGlPcCtGQUJteXVWVGxK?=
 =?utf-8?B?UkNBYTRaWFdIUHJuRVZ5d0ZhTUVpUEkwSnVleUZQYVlhb29yQjB6ZWRHU3dY?=
 =?utf-8?B?S3U2MlUrdWFrR3pRNk00ZEx0RCtZc3Rwd08vNVh0cEdPLy9UUWpDNnd0NmZQ?=
 =?utf-8?B?M1JJbk9YQlpQUDFDVE1iLys4a3RPcytWb3JEdUlNaFp0NVRRMXIzSDBpR2JU?=
 =?utf-8?B?N1Y1cnJTUW1JUWt6Ly9RdlZBQ1VxalkwUklhbDhOV0R6enkxUFV5RFBMcFVw?=
 =?utf-8?B?SFFuQmdaSitqVVMrdmZiUUtCOWdaOU1mVURyUzBZc1V5enptMkR1b3d4cFdJ?=
 =?utf-8?B?MGxQSTI4WGhKeFlWa3Y4d1JubmtvQUQxbEg1NTdwc1NyaG5ZTUFXTFJKdmZI?=
 =?utf-8?B?SURsVm9DZE1nN1UvYXZCZXJYQktJYWZiSW5uaUFWT2ZDZVpuZTcva3dEZFF6?=
 =?utf-8?B?U1pDbGozeEczcDhUN213U0N6bXVuRDB0aUhKekZPWVV5MVRjUTlTazhMaFYw?=
 =?utf-8?B?MlJsSVdTTStLN3l1QXZHYWxJVHIvYVVwS2EzekxCNEsvaHVCSFdKZ1Z6dDlp?=
 =?utf-8?B?UTBTWTZSUWJSenNLb1BhTmFMY2dtYjRNazNnNE5OVk9pUmlXM28rTmRqeis0?=
 =?utf-8?B?L0hXbmphRmtERUVrSDNYbkJseHc4ejZmNkxrNWN3Tk1wRGNLbzlaUXB0ZEpW?=
 =?utf-8?B?UzJHWmxWTFpMcFEvanovK28xYjdzdHJrVFhIaE1yRDJ2NFBOTTBsVEcyb3ZZ?=
 =?utf-8?B?ZDhyVzhZS2Rmb0NVQW1uaFg4dGJZS1ZVdXI0Y2FDRURwVHU2QWFKRjB6dmV0?=
 =?utf-8?B?RUpYRjdMRmw1ZWxmbFRCUnNUdlVzR0tqN2s4TVdIZ3ZxVkcvSU9WbzJRVlFh?=
 =?utf-8?B?anZsc0RRMmc3R0JaaXNWblpIT0kySHNrbG9DV3JEeHBkWHk5Uy9UdlM4QjRY?=
 =?utf-8?B?VkFsTXlISWd3TzVSNFc5YUpERWZYa1ZxSkNpb2dTM1ZCbXlIVXNuSStYV1Vs?=
 =?utf-8?B?RU05VENucE51ZzhQbjI0bjJHSmhNaUt3Qm8yV2FYTEliZmxldEFzaVlYNFhV?=
 =?utf-8?B?VjVBRjhCbjJGS0J1NDk0YW1idDJpY0hwc0toUUw5cm1OQzM0Q1JHNnk1c2g4?=
 =?utf-8?B?TVhCRm9FUisrYXJXOW56L0pCZzVmSWtYekxhczFvdHhtb25ET3dYakJGdE5z?=
 =?utf-8?B?YTR5d0RUM011cFZSOGc2NkpFb0JGTXJUV3BmVTRoa2NGanF4WHp4TGx4MXdx?=
 =?utf-8?B?UWdmWWJNbnlYRjZYdXd4OVd0Mkh3YTUydmhob3NvSVZtajdXL1gyRHF5Y1hI?=
 =?utf-8?B?TDVtZ3BmZExGY1RuZmUvQ3grd2tQNHZQSjEvRUJzbDJaYUFsZE8rcWF5ZlpY?=
 =?utf-8?B?TS9uTVp5aGhoTGgrVXh2SmxmMGNZWEZHMmdkNnFDNEpYMjFMNFl4VXRrWFZn?=
 =?utf-8?B?T0JjeWU1N1V6cWN4VWszeWhwVENlTkk1dklrR0NLZUJLQWtSeUVicitlOGZR?=
 =?utf-8?B?V01FWEtXRjR0MXBQSXNNc0ZCWFluRzJKZTNzYitZbExYTVZwTTlWcnBrU21l?=
 =?utf-8?B?QzFGRDVGRG9zNUVoejZzWXZXbVRQRUwrdVI1OUlLd0V0azBWNS9meTMxa3lt?=
 =?utf-8?B?Zzd0NU1kRWtVZGx4aFJ2NEVpdzlxbUx2Z3J4azdFYkMzYkJQdURsR09SOVN3?=
 =?utf-8?B?M25FY0l1UFgwcEZsMnNIUDRzWXlDdHl2emQ1ekhCeUs5T2NGSHJVZlF4OUk0?=
 =?utf-8?B?c1VzNVlzT0c2Z215bEVyWmNXQmpiRWxwSm5qQXB5T005eEU3elhQaHdOT2k2?=
 =?utf-8?B?RHdEak1YNVpDWHBjV01CRHBwMGdsdUNyb2VlS2VqSnVKNHhTOHVBUklhZnA4?=
 =?utf-8?Q?Kwe8KEIr9pTEBtUhAdsRT69mA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 027d7858-fa54-43d3-de9c-08ddc5013608
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:11:55.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/gi5tBI4ezRS1jpWrEk60En5itk8FN75I2T1gLcKUV8YisY1JvghhKQUTzQ+F5vzfnJvC20mPw/eyCH3TorfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add data type field in CSI pixel format info since the downstream
subdev in the pipeline need to know.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44..7495400adc22 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -25,6 +25,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -138,6 +139,7 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
+	u32 data_type;
 	u8 width;
 };
 
@@ -262,68 +264,89 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
+		.data_type = MIPI_CSI2_DT_RAW8,
 		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.data_type = MIPI_CSI2_DT_RAW10,
 		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
+		.data_type = MIPI_CSI2_DT_RAW12,
 		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.data_type = MIPI_CSI2_DT_RAW14,
 		.width = 14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.data_type = MIPI_CSI2_DT_YUV422_8B,
 		.width = 16,
 	}
 };
-- 
2.34.1


