Return-Path: <linux-media+bounces-38249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD48B0F1A8
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A13960B6E
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800A228B7F9;
	Wed, 23 Jul 2025 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iDPoUU3C"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193DEEEDE
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 11:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271603; cv=fail; b=sq+2XCXHoWbDhnV/UlpuCuSxi2Hl+2IlOYoOMV2gbe460Q6bd22W9cpBk9T1+xlIW/rzT7tg4ABQyb61/CyCZdJjG0kfBmFE0xl/BT4UYbrZvd7d0tdibHIZpN4zCFbz64zegO0zQCRVgSpwf9gH/7dA6YANv50lg/8b3mqlmHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271603; c=relaxed/simple;
	bh=wbniZqMUDnqLuLkjH+xo6RF3gdBlqrDeMpaQJLcXzDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UeM0tpXfcCkm/jZ/fHbuj6F0ONEBZpgbvZRXRjnd7ND/dNRauvg8wuod/3go+i1+GntgJPPpKtRYY64HsQ2QaaqUFCIHtxjL/NPqBCeCfeV7YjaZEu9g3F2g2SJNZLE65RMLXQtFQJ6l6lOo0S3c0C3K9u7vuHhew/0YOqF6N34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iDPoUU3C; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6aUH1nEMeuCM2rDMAVhzO1j71dsBHnY1m6OtR+o+yPtvw6T4Pb/UgoOhTCKrFqCUP2L1PmMWAOK2+6Makq08MSAK6SBVTcTho/55AlGvIVmqgqFXDiniSo/yJWvYf5VcuQaTCslwWfc1IgR1iFpqy7cNhSAcW8a38dqi3tlYZvyCrxSU1+uAWBjIR1CpdrehOVU2lUNiZbSlfp6QKmEzbXXHfby49yCjwknT6IcSuNaE7UhNd6CuhaLnu79SofLq9ZAuTnInELdepaWWtgxgWdkno0AKPlTTDw1RspTfy2BXNDuVnc2RAPuj4oZMbXS/8EMOdt29kAPVKUFplVwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8krKnjGBp22f9k8ovP3t9odJq9uKGJ4lOp8DtjeBzk=;
 b=FNCJB7ELado9l97N+7018GPSI4EH4RNOOPkx4YFsJ+vM/r0VLBLRUzeGhU8Cry8Ev9uCMS0Z6lizf3TX0T4MDR/R+8Zd1cbvpQBeTFOIlh4tq+qVlT1WbM+Foec92B2W55pHBWPmS8q8sCqkrgP9QShLJpPh2p7qoZLFEKnjUv/nlmpbZ1NCPS4bpRYfii+jLprsJPEiSqr+5K8BG/wIhP69AiPHXw0oWfnZRoaufbzfEBUQ9V9kvwTJgVQNifT2u7vFQpdkPVIgA5eUxKd2CIuN9JLLGWO4evfhtuf8jvoqDdddnR2ynEZwp6dSqukEOMepOwJkFpfVz+D6vdM+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8krKnjGBp22f9k8ovP3t9odJq9uKGJ4lOp8DtjeBzk=;
 b=iDPoUU3CMbMg8QOYnX2CnZzegYT8adESqM37iGoqinXtV9pBj8caCMlB7K9iVVw7F5qdkEy6Qs7bGT+hp0xE+PjuhoVZZthZcGqLRnq9uutnSyymb9K0E1RiNbHxR5eEpG4r+KRCm03OGiXhReHPR9a50ZvBVGxZJ2OCTk2/kK85sWKv/qJkiaEw6zlG4Y1umM40izSPbL8cv+MYpXzOuPJeK1/pzWc7HF5jEjiKETWuo2RZjctui5lWuudHV0au7nCljRiQ/QcdSXSmume37XNlh+bdyFCBqGgxO2JV3lsshJGgciEU63gZwm7KqXtUaEwMunP6qnGWuPOHwGOxGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 11:53:18 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 11:53:18 +0000
Message-ID: <43ae1005-f27e-4fe2-a5e7-8c69922483d2@nxp.com>
Date: Wed, 23 Jul 2025 14:53:09 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 23/64] media: Documentation: Document embedded data
 guidelines for camera sensors
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-24-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::46) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 0adc2c43-2f47-473a-020e-08ddc9df8368
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?S3habVhmY1d5YlhoV2k4Y0YwZ3IzNk9vaDlkYTVvL0pLczZaZC9MaFJJNVRX?=
 =?utf-8?B?cVVUZHFpY2pkNGRlSXVmdThHTXVvSFk5WWFSRkI5VVl2R2t4SUV5WGhseTR1?=
 =?utf-8?B?eXUyeFlkMVdFOXJlNnBsQ0xQUlBiN01hRW5hOVYxUUZKeGV4N0JEdVVScmlK?=
 =?utf-8?B?RThEZVFORXZ0TzhGZ0ErdHhSekJrdml4d1B0SGxudXRYSnlLaW54Mlh5bzZ4?=
 =?utf-8?B?UnFMWi9ZYkVQQjdwS0FYSUpISjhPOGRhOUtKblI3R0RtZWtNUzBIOVlPemlI?=
 =?utf-8?B?NnBXZldtVkFubEUrUlN4S3dxVTRlZkVkeDI0VGhGYllSNEE5NWZHaG1laFlu?=
 =?utf-8?B?VTlMd0l3T3V5Q2ovQ2xDa2pNSmVuY1VXNG5HYWdCL3JabUFBMy9UV0xpWnpV?=
 =?utf-8?B?N0ZIRWRJQW5wb0JZS0F0L0RURHdHb0dkUGVkOUkwVU81YVR1ang2TGQ3WDZF?=
 =?utf-8?B?MC9ZQi9PbnZGTm1TNzZSYVpQQlEvRDN0R2c2akx0am9nRU82MjNUSTJCdzRD?=
 =?utf-8?B?OHZUSzVIU25OQUl3SlgrOWhObkFacjMraThSUkVXVEJWVHhHZ3ZnSWdiWlBW?=
 =?utf-8?B?Zkl0Rm4yVFVVNXN2c09uMHNyVVpvVXJQYTk5VFI3WWJyL2pGcGlkc2Z4U0dn?=
 =?utf-8?B?c3VpM3VaNVVmT21sZjNpWmR0anl3ZXY1ZjJyRHl2Y3ZDbWJadXRrOWVGY3Bj?=
 =?utf-8?B?d0diSHFGczdoODlBTVZUNk40d0kxTTZmc1Ivc0NlQmhoclhrNi95UnRhZWdw?=
 =?utf-8?B?OW1UOVY0WUFiWGRvSURKektkZiszY3JxZU5JTDR2K2c1ZWVwMjNBS3JMeElN?=
 =?utf-8?B?R1JhQ2xLT3FBMG92L3k5WEF1R3BEUnNUMHh2VFVYTVNIbEk3M1BUbDNxbVdU?=
 =?utf-8?B?bEhudU5FVUo1L0NZRnpHa0lSWk9Eak80aVFyMmY0NithWHN3U216dFN6ZXA2?=
 =?utf-8?B?N0NSZUxkaktaWVNBUk51RWtYTnM4ZVZmdUI5NU9qZG1taXVUOHdMZDlMcm8w?=
 =?utf-8?B?ZDR1REJ5YTNKdy9zU2x3NUFSak0zY2xOQ1lxa0dQOW5WMzMzNnlLdmpoZmtH?=
 =?utf-8?B?RzYvYzRPeG80YUNsTnBUME93ekc5OGdqYnd1UXVPREZ0UjlHWlBReE9pNkc2?=
 =?utf-8?B?UE1zZ1lZNXhXcmRZb1VGS1J1bnVqbndKVndWMkpneEEvVmZYVm56SWl3SU95?=
 =?utf-8?B?ZkRyQWFwdUhzdTZQR3o4YkZObUhhVS9HZFduejBUZSthNEtSUFJENUtRMktT?=
 =?utf-8?B?aFdwajdQWDZxNDV2bWpjNlZRMUNIcHpJcWhUVTNFR1RDbzk3Yzl5SjNCRUhZ?=
 =?utf-8?B?OStqdFczTlJqMlhMeUpNcExpdVZJaVVUSTJ0d3JBck9uUCtXZmhhLzlWeWVK?=
 =?utf-8?B?MDRqaldPdmxHRFpkNmwxSExEMlBKdGNhL2lCTEZrbUI2ZHkzWkNJRGNrK29M?=
 =?utf-8?B?WW9SSlN0TWRkbzJuaGFSSzB5TkgzME9mZFNWQndWUGFSWTJMYjBuT0d6elJN?=
 =?utf-8?B?c3VOSmpUK3NudndaakpTbUhZaFdIVGhNN1hWWVlWMVNWVUtGT3RiTlp2YThu?=
 =?utf-8?B?MTZzUG83RFJvSUlUcmVQRjdpVjY3b3M3VEpuQzZSNzNFdU9QYnhCNWdpTGtz?=
 =?utf-8?B?Q2VHZEwzNlIyaHZCUlJhUURoVFhYYXV0VUxSa1c3VzFoWm9BMEZ6QnI2Q1Ev?=
 =?utf-8?B?bG4wQXZLRUJZUStaRlFLRmhFTHlxMThiK05qendadW4wMFhlRTEwdHBCRFQ3?=
 =?utf-8?B?QUZFTlFuMTYvN1dydTVwRG1xREdvVzU4NjRTQjFGZklXWkRZNkhLL1NHOG9q?=
 =?utf-8?B?bjB6MnJrbTg2b05mNU00dEhEUmh5RWlDWHRrUmlFOTU5N21JeFh6QjhEK1Ni?=
 =?utf-8?B?SWhmOUlCejRHY3BjTWlOUGMvd2NaMW1TVHV5S29tZzl6d2VvVnNlQWlRTW95?=
 =?utf-8?B?Q2tRMzN6ME9JbGtJYzF6aDlIb1hlUFdyV0JRZlpJVDE1QVlPTG90d3lBUXhL?=
 =?utf-8?B?WG16SENEYW53PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NlZsL1RPTjR2ZzQrR3F4ZUkwbVBmUGs3eFZJNzBMNWJDRUxkV0VqNFAvcUx4?=
 =?utf-8?B?eWpGZHhJdkFIaW5hTWcrQjE4aXRkelZoUnlvdG1ZQzdweXFWYUtWSmZseUVt?=
 =?utf-8?B?UnNLOFBmdUVoNFRuWk9GQ0JHNUs5cE44VDdFVGpoSFBPVWx0QnpEV1lsdUdu?=
 =?utf-8?B?S0FtODNFRXVWZUhjbUIxd08reEl5RE80Yjkvb0xqYW42Y1J6eG4wcWQwSUoy?=
 =?utf-8?B?V1c3ZUo0Vi9FTHhVenlSenRGMlhnZWRjdDJrbUh3R3J2V2l0ZXArWEw2ZURq?=
 =?utf-8?B?NDhsWnI0UFhXT2VGRnM0R1k4dHhSZjVVdGtFREVGc013YVNiVmJzWjJCRUJT?=
 =?utf-8?B?MjBHNVgvOTJPU3JxQ2JRMmY3ek9VZ1o3K2hkMVh1YkNqU0RLV2ZScGV6am1u?=
 =?utf-8?B?T0trMzlxc3lWZmxQQXArb0tjbmxRdlJlcisyV3RJeWpFOEtqcFA1Z2NLUnZ3?=
 =?utf-8?B?dGNLSHdmY3FrWDFnZUpBQ0VmWTk1V0RCWWxNSE54UTY3T3gwYWxWZG9ZOFlF?=
 =?utf-8?B?QStONlFPZDJOWGZlSFY4VWpMcVFsZ0xNbUZGdkJ6YmRZOU1yYVY5Vzlka2tk?=
 =?utf-8?B?MlAxVXJjMkpsZ0RVZzBqelZwK05iSm5wN2gyaTBWd0JKcVhWalQvdW1WR3ZM?=
 =?utf-8?B?MllDZ1N0eXk0VkFPc2JUcVlNdC9jRkE5a2REVUlsa0dYNnh3V1VZTEc1WWll?=
 =?utf-8?B?Y2hubzdtZHFlMTJqVk0rekdjZ3FVYlhrVFNMUkhwM2E1UUlKMm95M1M3Zmlk?=
 =?utf-8?B?anlJSXhYcFUvUkhtdUdiTHNuWkdEVVhyZ0UrYWlsSFNFU3dIRGZlNURUMkUy?=
 =?utf-8?B?aFdrV1FBNkdQM1BLVFFCQzZLWWVuWWU1UUg4SXJwWGVTRENYbHU5dFdWV0Iv?=
 =?utf-8?B?OExnY1g1bzFyN2Zlb2hyVU5UaHJjOTVKdmd3dGRXNXlnL05VRS9oRzlldjE5?=
 =?utf-8?B?MC8xRlBYMUVpRDJUWkhzVWFXMDRSSGxqTUVSYU0zeHZWcmEvR2lEb3REakow?=
 =?utf-8?B?aEhvNFAzZTMvbDEvdExWQjN1UllsOCtlN0N6dFk1em0ydjVFK1UrZW9lMUhh?=
 =?utf-8?B?ZFZIM21NOVVWcVdxOW1IZmZVNWpJaHBxUmIrUFlZdE5WRXI3RWhFRkVXSlFK?=
 =?utf-8?B?T2g0TWdrRkRUVkNZKzNTNlVXL0xnRWJtcWI0dzl4ZlVlYkkvTXdSR0MyajRY?=
 =?utf-8?B?cW9VcHVZK3NiNFNVRGlDbnFtbU9VOUFNREloNDAwYlpLd1lYMU5BbDdMWEhl?=
 =?utf-8?B?dGR1MEduMzlxcDdpKzh1Y2VJQ3VGWmhDL2hJSkJVc3llSEU2VkNYTllFL0pE?=
 =?utf-8?B?UmVmSzlhSStqYm42dHRCR1BZQnJTc09iZWxRR1h3UlJZbXJUZFQrSTlobDVI?=
 =?utf-8?B?dkhUK1U3a3hxbFpwbm55NUxpaGREUDExVGJ3VmliK2RKazFGN1NtOWcySko2?=
 =?utf-8?B?Uk4yZ0VKekVkdnVmOGVNZHFrVmczWDBtMldDcVVGZEI0THkzakkwVmRmeWtO?=
 =?utf-8?B?WXVnVFBWWlQva0N2TzFxa0lNSWw5QmpLR2lPQnRJTzh2UE1oWFRGdUUzcFhF?=
 =?utf-8?B?aC9EU1J1Y3V5RWlRZERvbWZoRmdmK2ZxQnQzeGRZalUxeXJXWGtyR1JHZDho?=
 =?utf-8?B?NHNtejVjaklYWkEzb291RDlBMkxMUjlHZFNudFBpREpTbmRHM2pJbU5DdmlG?=
 =?utf-8?B?S2p0QzFxTTVXb1orWnVUOGV1Y2hzVGJzV0R3NVkvTVk5SDkvajZVMTYxZVZ4?=
 =?utf-8?B?VmgxN1N3YmE2NU85RklremlYaEJkU0QzZUlLU0xlUFRJelpEWTFqRU5JWEtC?=
 =?utf-8?B?Y3Qxb1M2dFVDNU9jRG8zREFWZXIzdDFqd3FRZW1OUFpJc2s5TjAxbnZGWm5X?=
 =?utf-8?B?bTErclFqNjJ3RmxZdGZUa3lRWlV4UEtkTjZsbHc0THErMURPWTFJL0VIOVRz?=
 =?utf-8?B?aVYvVGtHNkcrTGloQ0RjWTZxZ0d6TmYzNmxrVXIxbnlNSEh0MXQ1MlhyODBi?=
 =?utf-8?B?UUUyck9TSjlLTkRRSlN5SFB3SXY4aUFjallaM1Y3TEZNdWkrL0dtQWZwRkR4?=
 =?utf-8?B?cnBjc2JldHFEemRUR0Vha0NxTnZWQm5ndExxVTJOdGU4SUE4ZHRYV3ZvVzlU?=
 =?utf-8?Q?ndzXg0MbJ9Oahc9IXbhVy7R2B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0adc2c43-2f47-473a-020e-08ddc9df8368
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:53:17.9610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXLZLoXrChvn32OfXpte0SScHiUI1dgSZt0OVSYolM2raE0eGpA90X2Zn0Is5Vlg9/VMxqYupHgqbLeF/Y9acw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Document how embedded data support should be implemented for camera
> sensors, and when and how CCS embedded data layout should be referenced.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   .../media/drivers/camera-sensor.rst           | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 9f68d24dfe0b..450e5940c6e7 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -115,3 +115,24 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
>   values programmed by the register sequences. The default values of these
>   controls shall be 0 (disabled). Especially these controls shall not be inverted,
>   independently of the sensor's mounting rotation.
> +
> +Embedded data
> +-------------
> +
> +Many sensors, mostly raw sensors, support embedded data which is used to convey
> +the sensor configuration for the captured frame back to the host. While CSI-2 is
> +the most common data interface used by such sensors, embedded data can be
> +available on other interfaces as well.
> +
> +Such sensors expose two internal sink pads (pads that have both the
> +``MEDIA_PAD_FL_SINK <MEDIA-PAD-FL-SINK>`` and ``MEDIA_PAD_FL_INTERNAL
> +<MEDIA-PAD-FL-INTERNAL>`` flags set) to model the source of the image and

If MEDIA_PAD_FL_INTERNAL and MEDIA_PAD_FL_SINK are supposed to be links, 
they are not working in the generated documentations.

Regards,
Mirela

> +embedded data streams. Both of these pads produces a single stream, and the
> +sub-device routes those streams to the external (source) pad. If the sub-device
> +driver supports disabling embedded data, this can be done by disabling the
> +embedded data route via the ``VIDIOC_SUBDEV_S_ROUTING`` IOCTL.
> +
> +In general, changing the embedded data layout from the driver-configured values
> +is not supported. The height of the metadata is device-specific and the width
> +is that (or less of that) of the image width, as configured on the pixel data
> +stream.
> --
> 2.39.5
> 


