Return-Path: <linux-media+bounces-52826-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM2/M2DakWlpnQEAu9opvQ
	(envelope-from <linux-media+bounces-52826-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:38:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850913EDF6
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FF6D300DE12
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB9F2DA755;
	Sun, 15 Feb 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m+ZtpAGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FE277CA4
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166299; cv=fail; b=uyYmxBz0jtYWwevHAK2kBR7vgU7JcurUL2iMKsmey/vdPi2egV4VgO7Xz9tCzs9+T4t+6/fJ8Pmvp2OlJtKNwB391bPyxbgdzl4bVJ9lbcTTAx6CdAwNc38x32F8GXkaShGT6yhSnwR0n/4npZOUV/k+D/bQAXL9/akyafnhJrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166299; c=relaxed/simple;
	bh=G3yMNpX+oSivRYKSW+A+65Byf/gJ+VzjKldIFroGjqY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YShpHPyBFDSbM9w+wRqj3ZhXTAMUQLlLx3oM2ivNoj3+sw5VapT6vJEWEHT7A22r57+bZlUFkoXqHgFik9BA5G293b9/RdB3dM+RiWdSZQZNgHBHMyl0hoNL00V/vijNvzZJQeBGX4WIidOHX1Z/44plQBdwk6KkQYOMj0s5OlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m+ZtpAGQ; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frNA10hs2jxhAn98je90uHjJiAvgYrr9GcgNSDudc/98IVZqo3CaskJb8NQn1WfxTdtCGzTBRji2BTB88L1na89ynKtzy3967hJT7TNo+boJX/8QoVQiB/dDb+it7sn6FJLsRI2oRoN5vgYPxvzvgjwu0BdehNGzDebB49ujjIGmRzoqEx/5EnH6HSFvK4IAeYBFyUGS6PJOsctvywuu/2GCSIjSwwi2f6feh4mJCwm+Bl2zrstceDT8jhnNb2FlwWLjx9BVK+64wbHQkPY62bRLC7DwH/vGI7noSPg3Jl+uiwuO/RaHXGafqxjTapL/oaILeAszCAr+sdWCbt0vRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lCWvUvqxC3g4J4qBRQd8K2bgvfAmmZlTRInJ5Ncotw=;
 b=cgT/Ri57HVcghRO4VkeciwF/SdxDaMzwPxfrZYwxQ6Ncqk7PPlAo1iQyaZgXfRODEimXqRjHaJlXBYt1bZ4zRtoc77jZZp5vuvMVC7G8RGzX1lu+0CiBDuFrblR0WvaRud08CyF2USChppQDk/I5P8noz03xY4QfKIZjRCnvEvaaS5p15IREEkIq2jZ9lPAwqEYDfcVbHMlLMl+s2idZslyXVuz2eCbHH2laePpCnUzUm2frkVewhD2ENSs3a6fOtdMo7WVLsmkdZ/EgTabZxllAOB8GDHPTkbCQHTUKaUDvXxoV5vsDdLhJn0X2Mvi84+gu3U7CPTA8d+Z13f9oNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lCWvUvqxC3g4J4qBRQd8K2bgvfAmmZlTRInJ5Ncotw=;
 b=m+ZtpAGQ+F77xaF0ALqOPvHhPI3bZQfYua1o9fWhnfW23uOXIEnte3M/2+Zy7hx7BJ470WDOjefdXb+EVBwOhyEodXETothmYOL+h9Q9oWLLrpWgJ0T26eG6X9eQ+Lm3hs3NXIAdzC4tGZfIPba/CyGq0Xt+Rjcm81azC6e1X7B47C3GihfZMm59ruYp9TK8opfrm8tKSIOxxxCTEN55P0d5JnCkeyhd4WOG0N5zQdoptP4vDCIX4NELQmu2h7SWm+uVqdJbSB/3a5FGyOxU7uFd7smtFHEq73Ir6SEnz8UTei43MVtnZhuXz1JE3BozH0Miqs2OUcOzyRMO7xoRBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV2PR04MB11861.eurprd04.prod.outlook.com (2603:10a6:150:2f7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Sun, 15 Feb
 2026 14:38:14 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Sun, 15 Feb 2026
 14:38:14 +0000
Message-ID: <0e251066-d5f3-4bcf-9f12-b2a7f549c088@nxp.com>
Date: Sun, 15 Feb 2026 16:38:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] media: Documentation: Improve pixel rate
 calculation documentation
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-5-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-5-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::35) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV2PR04MB11861:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac844ee-d431-4fe0-5eeb-08de6c9fd9fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?M1ErV2ZWV0lyaU93RFBOWFpQVnRJcFBrazFReERFWUw4OEhja0tmb2U4L2F1?=
 =?utf-8?B?MEJLRGJGNjRMS0xpNE5IdTlDRFJTMGpiUmRzN3pwVTFlclNMT3k2R2pBSm1S?=
 =?utf-8?B?emt4ZWNrRHlkNGF2bmY2TGs3UHRjTzdSVXAxcXFzY0JaYzJ6NzByVkxKZXl6?=
 =?utf-8?B?M3d4YWZWaHZsWFVTTHZ3UXBqRFJZM2JHK3c4SXZYdEw5V0g4SHRzRUhKZVpu?=
 =?utf-8?B?SDBueXA5bk90QVJsS1lZNGt2MlNTMkdWTXBrdTYySHBSM3NZYnNMUFNvZk1l?=
 =?utf-8?B?Ny90QVBlVHZoZmN5MjFoZ3ZEeThEMjZXSzVvTmhsRlNZY24rVGYyRW1kcjFx?=
 =?utf-8?B?NVkxZkNtdDQyZ2hUNWMwSUwxUGZad0NoK0RwTWFXcjFJMjZkWU5ybElON2Jn?=
 =?utf-8?B?bllraXFqZXgwREZ2UmdpSThjdmlxMHFBOGVsUDNxd0VsalNuM2IrQVA2OGlT?=
 =?utf-8?B?NkYzM0V4TUVQY20vUFFqcFNaazR6ZVNoRjdTaVpKaTMrV3huTUhpbmsweHVB?=
 =?utf-8?B?NDVFR1dRd1lKMUN2NnFlMWIrTEVsdG5QTzhPZEJIbjhIc28xWXQ4VDlFNXdq?=
 =?utf-8?B?VEtwTS9idDN4MnIrTUJ1emtEQ0hhbnZsMEJlcENYN1pSVjlFeEFERElkQkgv?=
 =?utf-8?B?RmN1U1o4aStJSHR4bi82MHh4amI2SVVIbUYwbVlwRURrZ1VMYkpYOGkyc3Ay?=
 =?utf-8?B?QURlQmhUTU4xUzZSL3o1UlljMzNOd0pqbHl3dnFIWmFhSnZPY0RHR2FFUm1C?=
 =?utf-8?B?M0V5cXJSZk83c2VOdVlsc1lrQW9PYnZyRkVYL2EvR2s1UndqbTVmVGlhTHdQ?=
 =?utf-8?B?NDNVVHNLc21WWWNtTDJjQjA0L3k1aDZLaGkvY0N4OFJoQ1h4N2FUaXBFdHpU?=
 =?utf-8?B?QmdFR3pVcCt4N0xUS2V1TW0wZ2JiNkpvL0sveEExTWsxaEdLK2hIOWlwbkN6?=
 =?utf-8?B?aDJZKzdmR013K0xXeVNGT1NsOE94c2sveVN1a0p6Q0ZFTis2SUNEa056ZVhw?=
 =?utf-8?B?aml1VUluM3JUVXpJV0NyRzE0QUdDaEgzQ2xocDVFR1JaeUc5KytqNmVqVVpw?=
 =?utf-8?B?eUJIVVJLeWxSakNiR1dOTGxmWG9sWXN1QUR4S05pVFdqbE8xVVZTblhjMk1S?=
 =?utf-8?B?aldUY3d5bEd0REJOK0VpQXhndGgvU05tMTBTN2tITis2TVVFN1ZEY0tOc1Vy?=
 =?utf-8?B?U2RBKzBVVnZFeVJnQVprUVpJZzZtK2UxaEd1Vm9hWDZBM1dCTEZmL2xwNmh5?=
 =?utf-8?B?RHpDZ0YrZDBKeTNrZ2tkYVI3UVlBY1RDODJERUFaVGhvYmZPSU9UUnpqKzB4?=
 =?utf-8?B?S0lhRWZrM3FnbnF2RXVEUTNQV1d1Ylh1eVBQSzY1NW8zZFIyV0NFMTFhNUJk?=
 =?utf-8?B?OTFtNVRHVk5YRHBzODFFZ0MxK0hRV0dxWUxLTmRiZGVnWDNlazhVTkVIQUgy?=
 =?utf-8?B?VjZFY29DK08yTVhjOUZRVjViMXJUSURLN2xwaTBmeVhlcm1HU0JvOHQwWEFj?=
 =?utf-8?B?TjBDS2ZLU2FoVkNETzBuNlR1OGwrSEpGY0VkWU5mdXRSN2cvcjlTTlBPeEc1?=
 =?utf-8?B?dTYxczg4aGs0U1h2aWRLNk4vZWoxQ0Y1TlJKOWxTaUZPNHAxTEtDTmMybkVh?=
 =?utf-8?B?a253eldiWk1wT1VFYkJoakIweUIrem5NWStTMnRsVzZKUWU3b0hZUUlvRS8v?=
 =?utf-8?B?OStwdFNHNXc0MEdxR3ZtblpPWDV6MnZIMzY3N21BYWZzK2NhZm9mRnN4L3Fs?=
 =?utf-8?B?RVFXK1VxMFo5ZkZDeHhsM3psQU1vVXk4SFpwNVpRSlVWZmtDTEoySlJKMVlP?=
 =?utf-8?B?VE9VSkZteUNlRDRhd2xiSGFNMkFXWUxSZCtlRkFyeUR1VkFRVlBPUFNXQmFX?=
 =?utf-8?B?V1dNYU1TYTB0QlJVaStvcXBmQ2RoZnIyRmREWC9vc3hxa01Wby93S2Q3VVdp?=
 =?utf-8?B?cTYzMkZsUzEwU0RLVmpxZUxTUGVQRlBpTmxDQXFVdFFGQkk0b3U2cEFjbHJt?=
 =?utf-8?B?YzB3c2NvSE1GZDZJTnR2VHRlN2k4STlhNWhEMXhVOUpOR0swWTlsQnQxcko4?=
 =?utf-8?B?dHRkZWRlWklkMXQ2YWx2aHVqdmZxbXNJMGxVMUJpQVJEVGQ3eEh0cGtIeEVF?=
 =?utf-8?B?WkcvWGRVSHVHUmw5c0hZQk1MV1BOVjVXWkxrVzRLZWlPTWd1eGRmY3FBM3ZQ?=
 =?utf-8?Q?NuuaujD3psTQCalmF5pZorw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OXZBSnRTZW9FQ1FTUXBNc21ma1MrclR6b00yWmhnV3YvNzFkYjNkRjNxVVhS?=
 =?utf-8?B?bGFpWDcxYUx3cTVsSGpTZnR0UDUyUFRRSzlVYnVHMmhpczkzWmNNaG0wQ0N4?=
 =?utf-8?B?MlZKNC9TY1Nkb1RTNVV0NWlWL3JjQS8zZ3BBZHlEWFNYV2w2elhMZXppRTlX?=
 =?utf-8?B?ZElTakdQVkxVU1FmbUUzOGdmcEVKR1lKUHhiZDVXcFBwbmdVVXFUU3NtemVt?=
 =?utf-8?B?Y3pzNnpOTUJsc0lkeld4eFVKcXh4VzJTbDVPWXlCWmtlNGhtbUhpZWhMQ3cy?=
 =?utf-8?B?Z1NUQU4yQzlRdWdrOXJVUkNVSmdSa2lhajJkWkF6ZXRwYWpMSy9iM0Q4aWMx?=
 =?utf-8?B?N2hTTUpETkRtemllK0cyM2RMZ1lZek14N2piQWxqb1VKcGxWbWZIYS9iM094?=
 =?utf-8?B?c0J3ZHFsdnNpZGNzaGozaHA3V0hmTEcvY3luT0U5WjZ5cFQ3R3lCeit1TmI4?=
 =?utf-8?B?U3hxelBXeDdqakZKbUhDZ1R5WUJaa1pvMXo5MXd2R3pWNEJQMytsMXIzeHFN?=
 =?utf-8?B?SW40Z3hwckhYUEw4cHU4NDN6K1VSOVBJc0JhRk81QUIxSHBjdjd2TUgzZG1z?=
 =?utf-8?B?NXFyK0xYYkFXczJlRkhpUFdVT0FoVFlkT2J0cnB5Z2pybG5JUlh4Um16akIy?=
 =?utf-8?B?ek5GOEdTSGRwcnQzdjB6emZ6YWV3aHZOMW9yVi9pR3c2TWtOWU1ncW8zbHBD?=
 =?utf-8?B?aWtjQlExWkI4OFhmVVVFL3lkWXZnOUZveWpTQjJhUGh0SlZxS3gxa0F0REda?=
 =?utf-8?B?U0dOVEhaWVZwRm1YQnJLWW0wQUp2VHJsd0tkLzgyR0twREJMSDVTK2g4ckM3?=
 =?utf-8?B?VDd0OTZacHdNKyszQk5sQ2h0WHlwcmlHVmtnRnVBVnpuMlFaR1ZSVEdsdFls?=
 =?utf-8?B?Z1Y3bWs1TU5YSEFDUnlOL1N1bDBtYVNHVG4rMU1GQitWcTkrVWg3QnNzd2JE?=
 =?utf-8?B?VTVJWW1YSmhXSW13allFNDQvbkszOUxmNFRUUWNZbXV6TDFXdzg3REdtaXdw?=
 =?utf-8?B?dDlLaWtBb3FLT3A5UlNYRTFLb1ErckNnWUg0MktDaExndHZTME9BTU9BZWty?=
 =?utf-8?B?MDg3NGErYjY3a0tjK2J5KzRZdnFlUlF3eFlocFI1YXpBVUZYYzhhTWVVbXdD?=
 =?utf-8?B?Zk1vTHc2NmFzTGgraUg1UGhIeUNBZWtrSG5xRU9BcmIzdXNpUnc3YWVZM3Y4?=
 =?utf-8?B?UU9vYTNpUjUzSXFqazZkeUlseEhFNnl6UzhacnptL1A3aUtaTWlmK3JiM1ZX?=
 =?utf-8?B?NlN5cUVlbnRUMUNjVSs4TlpDYWZYUHRRRzZFQjdXUXZGbjVCcVFsWjlNa25W?=
 =?utf-8?B?VmJ3My9jQjI3bmxuSkRyeVBjc1ZIdy9ab2QxVkJxcVNMRUFVUVhDcmZSa2VJ?=
 =?utf-8?B?M3E0d2JwUndQbWZJUExiNTc4LzE3ckJ5dDRjR1RpNCt3QVlIK2trTGN1WHFG?=
 =?utf-8?B?ZWpKa1JWcDBYRlBGVjA5UEZBd1ZEaFdIaWZESzZVMjMvMXNHRWpUZmR3RFpx?=
 =?utf-8?B?T28rOXNVRkdkOFhTUGNsK2hvVzJNMDRoYWJDVnBCNy9MQUszRHA3YkMxZHBJ?=
 =?utf-8?B?RHcwQWZCVmRpQitCOG1jbjdKUTYvMGZ5S25sUlo4TjBLdDFwSXpROUxlc3FC?=
 =?utf-8?B?NllJR04rS1RyNnFhL0NoQ0Z3bjRSMDYwcktMWlU2VVRNbXdmU2lWUldIOVdV?=
 =?utf-8?B?REdFU1kwbmtiNkhKeHYxWVVpTmt2UEg3WUxBVDBEb0J6OEFnclIxMGI2UHBq?=
 =?utf-8?B?Z0VSQklaOGJOOUxWZGlWNmhTVUthQ3kvOU8zZllYd01OZjJHU1ErdkYzdzhJ?=
 =?utf-8?B?cWtGd0IrOEJ4czNqY1BIL29LNUVLTGZGM1hxNU1IUlEvVkNWYTI0TjFMc25J?=
 =?utf-8?B?QzA0NlVOZHFBNzEzUmttMUwxZXhrNkhzTHRsdFhwVVlXL2hhT3ZwKzgvMVdu?=
 =?utf-8?B?bCtlQjQwR0lKZE4yWUpXZmtNWS9JNXIrc1lNTE40Tmh0dGJNYmdVaEZxUnlM?=
 =?utf-8?B?dk5hVG80RXZXaTUyQ3N5L3VQb214Ymt3dWw3dkJtWitDVHl2ZlFwTnR5N3o3?=
 =?utf-8?B?dzBWQW8vWGtXMGtvMDB2Y2JHOHM3aFhWekZiQXVoelhDd1FNU2xKZkpaVTRD?=
 =?utf-8?B?aS91aERrM2lLdGFCZThFbmxtVC9MbytLdmNIdUJsQ0l6c3N6VG9CTVJYcFVn?=
 =?utf-8?B?U24xZjV5TGNYd0ZJWEgzWXIycXIxdFFOQ0RNdEVHMVVwaGxiYk9odXFwOVRp?=
 =?utf-8?B?NWczbXFiN2RObkFvMDI2QnpNOUlLWkpMK2JqTENMajV1RmFnYmJNaUlmZEpn?=
 =?utf-8?B?VmU1Q1JnUVgrUjFicTNabzB4UkVqTWpwMXdJTlFFV0pqOGJYU1lUZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac844ee-d431-4fe0-5eeb-08de6c9fd9fc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 14:38:14.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccIrHroqmc3zPxCQ8IHOEINTO7aMjdJwxq1Ua3zfq0SRUcLpoFKkzZ6ovwj4bYCrbX7VWkBYeirHCe3ADLA0yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11861
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52826-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3850913EDF6
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Improve documentation on calculating the pixel rate, by adding references
> to relevant functions and mentioning V4L2 fwnode endpoint instead of OF
> endpoint.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>

> ---
>   Documentation/driver-api/media/tx-rx.rst | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/media/tx-rx.rst b/Documentation/driver-api/media/tx-rx.rst
> index 7df2407817b3..9b231fa0216a 100644
> --- a/Documentation/driver-api/media/tx-rx.rst
> +++ b/Documentation/driver-api/media/tx-rx.rst
> @@ -104,7 +104,11 @@ where
>      * - k
>        - 16 for D-PHY and 7 for C-PHY.
>
> -Information on whether D-PHY or C-PHY is used, and the value of ``nr_of_lanes``, can be obtained from the OF endpoint configuration.
> +Information on whether D-PHY or C-PHY is used as well as the value of
> +``nr_of_lanes`` can be obtained from the V4L2 endpoint configuration; see
> +:c:func:`v4l2_fwnode_endpoint_alloc_parse()`,
> +:c:func:`v4l2_fwnode_endpoint_parse()` and
> +:c:func:`v4l2_get_active_data_lanes()`.
>
>   .. note::
>
> --
> 2.47.3
>

