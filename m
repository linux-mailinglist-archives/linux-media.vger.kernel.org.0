Return-Path: <linux-media+bounces-29117-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E8BA776FF
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7E2E188D4B9
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E801EBA1E;
	Tue,  1 Apr 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fVpE/LLF"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A11D7E52;
	Tue,  1 Apr 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497864; cv=fail; b=hzVuYMY8mO5voKj2ip8ecjcNogQF1BkhXp1mwYBKxLlXKSSc8WOruD9HduaLZ7XR2fkHYal8/GUqbzQGQ8O+WWR05oR7boDnwEBqtladAEe9YouyJfPMD3FNYNKDOiL0gA2fy6PO+vAUAh5Zl2df7ynnJIvO2i4Ma0YxtxKbv2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497864; c=relaxed/simple;
	bh=22a8dXB/eJhb/C3D12ZQxLBK7DQGIUjpa94FStu7WNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=COT73Bab6jCOtt0G5mQ2fnsYtf/n368Cc4ve7h/YEyTHFDjZHReORNtZYDcQrGGmNl0pO5/EFdTkmy7M+GCCo/lu0a+jZBJZeMVK+UeE7GTyYE8lHFAmhTlVDbS4ldJI+KgiBHby34SHVBH3QxWTHXFTXib7UKy34/hfcGDRb7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fVpE/LLF; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJKG62g/FsYy3aaKWD7olzHAy9goWPME05A2jyQxD0+Y5GSWT1+nJ//ow3ph/SeCyF5OZGWjE7b1U/8cIz+QVD972CJBNXnCJR25jEcG+XSDixpEOcdssM8jrJRj5kP64roVduCIKRsU8mn7fT0OheaVFwRZtRZSOsgzkTgEGR9gly6H7x+8QIXMXqnlMs8lWN8AOSTDe/bNoM+7bzOYKRXiXM0MrDlnQ6LW4bsksodrDrspRM6HoTUId1jMGDfKUSD/OK9O5WFah73pPwE5+PHNNrPNuL89B29VMjOMqdVI0Yn7R2zpgMiAXfnHwbKNWo734dxe+NlqdCTRDVCzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIumBQqwk8IRjHBzdAh5XBpbqHal0Bq9K5L2He2dhqM=;
 b=XW2wzPGWsbNzIUmosgHxTEefDxHyqLw0haQQ8JPiUn1yfRBBSVKcV2gBlFzlI4h4J7py8pBj+t03vRtFSEnpV9XRIyjgzWKiVhdE/ZnPbvptz5aJYwJlYQiCZg34029Rm4A6ezqQB7pvOWwqYdBJsTldg9gGXQukLpoNy+HAbPj7NqhyABLLGp/2Lc9IxIphxNtrk8gjZgAZkP2FCBlXjzHLnl5PdfSL6hVGOQoiwMD1GZ4juLVzvgq/pnCmtI32jErgCDGveQRTK+84deQ6mep2l+S/Xu2LpPhMAfkbryEYCoPi25PQ0eQ59PGY6o/QXFdm5hud3VjBJJA/l4ebdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIumBQqwk8IRjHBzdAh5XBpbqHal0Bq9K5L2He2dhqM=;
 b=fVpE/LLFVVbM3ZFH233U7er26BeBueT5ACpJfH6pt+/E4ff9hN7V1QsZq/mG8qUXMEKd095pvF6CPF4k63bJNQpyOPTAMkJ7+AiD9Y0QjvCIIPfnP9VmfAOjhU9GSUBZ0IxREzIvVIcwi6B9sec7/G36yTHy6XOYDMIqhu/iDYYH6ngY6AQujOvUeBpWOYUo8miCJYX1vpRQZSkOKA19H+YP7aCyP6AOoeNvz8ixck08VjI4VbrCogubHfKxWqIhCUEjJ59Zis6iFcT9rSy1ZMCGtTC1QLyutzFvqJm8RY5lUCATY9YKfNw+EBY2fQyEqBRizzG4n30u4/9pzA/upA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Tue, 1 Apr
 2025 08:57:39 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.052; Tue, 1 Apr 2025
 08:57:39 +0000
Message-ID: <66cc2c9c-2032-4255-b602-17351c0395fb@oss.nxp.com>
Date: Tue, 1 Apr 2025 16:57:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] media: amphion: Reduce decoding latency for HEVC
 decoder
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250401073527.1626-1-ming.qian@oss.nxp.com>
 <20250401085330.2n6mcyfrxbfgebzf@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250401085330.2n6mcyfrxbfgebzf@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcef676-4a76-48cb-a55e-08dd70fb411a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUFjUUhNR0VtbWJoYlpoSlZBTngrajc4RTJLckhUZi9IL3FoREpLM0pnNStx?=
 =?utf-8?B?QmQzTU1uRmdURlRwVjBkdkJGamQ2aWthSnIrZUdDQU01czVEUWpHbmg3UVJx?=
 =?utf-8?B?SXlXTGlEOUJtbVJoVWVheXR3RnRzVFJkaDhBdEo2NnZBK05RWDVQK210Z1B5?=
 =?utf-8?B?U3Yzekp3S29LOFErUzRtVkN0Yk5uMndocWF5a1UzUmhrT09qYy93aWxlUEc3?=
 =?utf-8?B?ZzJmcldIWURFN09DYlB1UjlBR2h3WHZwSnhMNGdnbm9MeVphalUwa2tONVNV?=
 =?utf-8?B?cUMxVDR1R3E2R3RGd2pFeGE1YTZKQjhPYm5UKzZEbStZWkdvbVJ1TVFzSFBQ?=
 =?utf-8?B?ZUxzU1FMNms2NlM3MDdiOXhhMG5Da3VOTlFhTU1vMXRQencrS3hQOHdEbmxC?=
 =?utf-8?B?ak5HMW9BaktyOGtzREw3TmJnOC91UHhUdUFOcCtKbEdwbkM2YzlyWm5wbEZs?=
 =?utf-8?B?N2c5a0ZKRUZYWUlqMXFWNndPbHdNUGJjTHNCQ25zOXNVa3Bsb0R5eVJ0L29o?=
 =?utf-8?B?NSszKzNpQ2Fzaml0Y3k3S2w2OENOZVJRSm0vWmd5dGM3SGphRm1RVHZuWWpR?=
 =?utf-8?B?TXJyOVEvTlVXbVowbjh0czhXWlVScjlueUl1Z1ZGbmN0ZnlhVlQ3Q3RRU00v?=
 =?utf-8?B?bm5lNlYwTmI5Umc1RnZ6Z3VDN0IyTFNUcjMrOE9Ub2JiYXBJUW55M2Zab2I2?=
 =?utf-8?B?RG5SMCtrZ2JGU2dOTHBFdVk2Vk1zNlJScXl5N2t3OEZLaUhkZlFTZzlSdUtj?=
 =?utf-8?B?UUl0Nk1nelErbWlRazRJdTlmMXJUYlFTeDFsOUFLOFRNd1psWmNZbE9CWDd4?=
 =?utf-8?B?YXdCdm9JV2ZadEErYWtsOG5MaGdCRFRlbjdSY2s5K3EzZTB0dk1KMXlGZ1hE?=
 =?utf-8?B?aHVoV0RBd3BiL2F1UE1MU3JTbEc1aDgwTDNXRHpGS2xIdDVQOEhCZmdhMkhX?=
 =?utf-8?B?WktuTkNlR0Y2Rmd6K01PMW1acklsaW9CLzIwVU9MVmxkMDBuYkVxR3Eyc1lP?=
 =?utf-8?B?bllOL2o3ZkF2Q1VrMW1jTjY3bDB3cDFjeFMyUzBGODJMQmUxTGRiczQ5aDJX?=
 =?utf-8?B?Nk5DcGtOTEsxLzZheWdvc1VQSzQ3VnJJdmp3azhVYVBlN3hUQ3E3V1BrSkl5?=
 =?utf-8?B?c1o5R0ZpQ1RKNlVabUJVMXZObmtwK3BlbHVvNGt6N1JXakdMNUFXV21GdC9B?=
 =?utf-8?B?Tko1RjJWU2pSZWZBcWcvaDN4Q1I4V0lGMm82OXFDVEpLU1dydmFYWVRNeENF?=
 =?utf-8?B?dHZyZTJSM0haTDBVY3FoTlhBZDNYdmU4bUt6bkJ6aWliMm5xS251cTR3b0tD?=
 =?utf-8?B?SU5ueU1tSmhlTW42V2ZONXcyVExJZ0N4ejlVZ2FCOExxbFVUS1d1QkZRcUZI?=
 =?utf-8?B?V01GYThsVE5ObTA2TWtHRmpTZGFGbEVSZnBVQTRsaTdLc0dMSTNOWjFPc0hu?=
 =?utf-8?B?alJTdkRvSkRGRldpZ3Iwbk05ZmwzUXdGeW1RSElmbEY3emVnWWZxQ0lyMEg5?=
 =?utf-8?B?bWFKVlkxa0M2aDlUZkZxU1M0WlgrcUlaUnk0eUU1SWJhVWNpOFA1dytCYlBK?=
 =?utf-8?B?ZEpkMVZUeTRqY2tBK3I0TUJGSG5BcWJRVzlVeDdJUU1FMmFCaFkrMklPYnV5?=
 =?utf-8?B?RUpSZC9Dd0MyMURRVE5oWHI3K2hsYXg0YS9oTVJiOGUvbWRNOHV3dzZoMEIw?=
 =?utf-8?B?UWxQNXhQblN2dXYrUTR3c0pSRU9Sc0JHUk56RWREUGNXemNtNVZCRUdzd3RY?=
 =?utf-8?B?S3NPYmJuU3A1SkNTcy9LZk5tdENCVDlFK2RxS1V1djQ3R3FORyt5Q3k1NXho?=
 =?utf-8?B?eURjNVQ3SVMvNGM2QkNqa1M0bzJIRkp6KzBFdEZGOTRvWDFhVnljYytpeElC?=
 =?utf-8?Q?BB1AS1xWLYLBS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHhOYXpCNzZLMW5GVmZMR3RPUFBOUFYrUWJqeDRJR1dMMGNHUmRVMzhuY2cz?=
 =?utf-8?B?c2VUaXVZb2FUYmcwcnYxckl6Rzl2REw2NnZINCs4MHdKZ2U0QlZRM2lLZ2Nr?=
 =?utf-8?B?cFdOd0dDc2FZNFRWY2FkN1FGUk9TdXRSRDcyOUZyN1pwOFdIVFJmN3hSczlW?=
 =?utf-8?B?dzd5R0NKL2hyN3RCR212cWhtUEFwTUpTMWZMcG1wSDVCa3ltWGQwcHZMblhl?=
 =?utf-8?B?ZXhpNDEwMG5mVHlkeThRVDIvdVBpWGJLV3I4TlZFMnJvMXRKL2RmTmhXRkNR?=
 =?utf-8?B?SWo1TDF6aENrQWliMlNsZjBZQ3QxbEdLM3RNa2d5ZXdneU1kVGdrYnBNV2Fs?=
 =?utf-8?B?Slo3dnYwdE9lUFdvbWY0ajRqYU9nUkFWZGRiQTR0THdJTHFyZmpkSGNXM1pn?=
 =?utf-8?B?QU9PQ0Z1blQzSHdPS0FReTNLU2FKKzNGcXZJVnYrMFBhM0IrNGx3MHd6cExa?=
 =?utf-8?B?NGxTb1Z1RVA2T1ljTUduTHI5dmdjUmlNMCtxUEhHZ0Y0V0sxWW5lQ1ZRaE04?=
 =?utf-8?B?SGpqNnBOOGtMdmVCdFE0RDFlT2R4QXBZaHpjRE5jRTg0VUtZeU5TcHd3VE9K?=
 =?utf-8?B?OStneWNJdEdvZzZRTFYzd2JqbXNEWUI4OHY5Vk9IamphWUZjYTJWMGdWdXlk?=
 =?utf-8?B?aVYxM0RWdGk3YWlOclZCVjArU1ZNbDRVNGYzZ29oa3JUQ1JpRjJCZ2tEZEJY?=
 =?utf-8?B?b2NjQzRHVGV5alVyb3N5S2ZuS1hHakNTdjU1azdCcWhSWHhKTzk0VzhPbzBx?=
 =?utf-8?B?Q3NNb0xweXZucDhiblUyZDZNbUQ0dXh5bDQxRVg1WURhbFUyMldaQ05yTUsr?=
 =?utf-8?B?dWVUWWZCNTRIOVlqMlhNaW9xd3g5MHowN25oeEsyM0RyRWpMMDRzelVROCtV?=
 =?utf-8?B?YjM2Nk13d3h4SU93UE9Tang5TTlpenE1YzlUcHZPVmY1THFCVEJoSHhFSGJR?=
 =?utf-8?B?ckhtYlFrK0hWbE9LNmpoVnFBM2JVNVpORkJHOUYydWd0WEhUSjBLWGtINFY4?=
 =?utf-8?B?VFRIUDFHSGFFZzkyMjdCMkJYWi9mV3FsckRsTHVNaWRhb0twcXRZZTd6b2Jt?=
 =?utf-8?B?TDg0Z1czM005cnpDbUJIOTFRaEl5SlhZSWkycWtPZHJnbFdJV3pvUm4wQ3hZ?=
 =?utf-8?B?MGNFOUJPWWJlL1VwRFNnY25hdWtySHN1NURjbXRTM2RPZUpJSG5ueU9MR2RQ?=
 =?utf-8?B?bWxNUlZwTXpNTndiVjhDZGRrbjhqOUJwMWFuTXA5VU9veXBKTktWczZmRVhl?=
 =?utf-8?B?eWY1em9OSWk4QWdXZkZ0M2pVd0NKWEpYU1p1Vks5VGRNY3YrVmEzaE1IQUtn?=
 =?utf-8?B?NnZWaGM1YUlONnQrMEk0WlZLODZ1VHJGMkJ6OXp6Y0Q3Ri9nZHB4YnYrSTFV?=
 =?utf-8?B?azF4aEhaQzI4SzN6N2hROGtwVkhvOVFkOXVpWmdzZit2UXZDbTlqTk8veW1P?=
 =?utf-8?B?TEhMTjRvN0ZQeEtJZzVjZVIzN3lHa1ptT3RiWHNiOHNlU2hFZHlNZ3hTU0Jn?=
 =?utf-8?B?QWt3OUlSWnZ6OUNRTzRlSXoyMDQ1OVlUNlFpcStieXNieFI0Q1krQ1d5cTRT?=
 =?utf-8?B?NHN4L3NDanF0N1A2bGxlUGI1M2ZTVDNIZWhyNHRUbXNOUXcxUVhFYkYxemtw?=
 =?utf-8?B?RU1yUzFQR0dSRVBrY3crSXFhVTZXaTVYS3g0Z1llOXVUVlNldElyNDM4NXZU?=
 =?utf-8?B?Y1VuUDNNdHhnbXd0QVRWNDRFSjRmdFJ2YXdOQnBhUWlVZkpkc2tLTklGY3lq?=
 =?utf-8?B?U3c2VTJmcXZPTjQyTDIzNUlMcEprcUVUdUlnb1ZPS2NyOGt5dnlzeWozM01V?=
 =?utf-8?B?MWtaTHBRSkV6RG1lbFFzSmI5NVhFNkdIbXpCT2Z3akRHby91WHlVU1dBWnU3?=
 =?utf-8?B?S3B4OXM0U2JqdVl4RERkdjZmbjdaV0xGeVF3MzM4UXpINWxaWXdBVVJlNDgx?=
 =?utf-8?B?YWJZamR2dElsZS96S3VJS0h5M3FUL2srTVdQdm5tYlljRHhkTDY1VVVNTmRT?=
 =?utf-8?B?dU1tamJjaVZYSEF4UTI1RzBhSkU4STBUMHFHenFFaUNpL1JOVTk5QS9EREIw?=
 =?utf-8?B?dXBCRGhGR09Pd2d0cE96Mm9nM0xZa2xZWDdJWGE0TkJaZmVoN2FhY2NUQTRE?=
 =?utf-8?Q?8GUoLQ2pdNNk3jSpa7Fv9f47P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fcef676-4a76-48cb-a55e-08dd70fb411a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 08:57:39.1905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3PnBKG9KbYh+J2CPMc7D5KWFF7iyN/wLTaCUTDLqEQj8jeCu4cLDuTjgOTZbJxHyKf3wBWpyDe98a3t4i61fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800

Hi Sebastian,

On 2025/4/1 16:53, Sebastian Fricke wrote:
> Hey Ming,
> 
> thanks for the patches, unfortunatly our testing pipeline isn't happy
> with them yet.
> 
> See below ...
> 
> On 01.04.2025 15:35, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> The amphion decoder firmware supports a low latency flush mode for the
>> HEVC format since v1.9.0. This feature, which is enabled when the
>> display delay is set to 0, can help to reduce the decoding latency by
>> appending some padding data to every frame.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> ---
>> v5
>> - Apply FIELD_PREP() and FIELD_GET() in CHECK_VERSION
>> v4
>> - Add CHECK_VERSION macro
>> v3
>> - Improve commit message as recommended
>> v2
>> - Improve commit message
>> - Add firmware version check
>>
>> drivers/media/platform/amphion/vpu_malone.c | 24 ++++++++++++++++++---
>> 1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c 
>> b/drivers/media/platform/amphion/vpu_malone.c
>> index 5c6b2a841b6f..b6e4996c2d91 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -68,6 +68,12 @@
>>
>> #define MALONE_DEC_FMT_RV_MASK            BIT(21)
>>
>> +#define MALONE_VERSION_MASK            0xFFFFF
>> +#define MALONE_VERSION(maj, min, inc)        \
>> +        (FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, min) | 
>> FIELD_PREP(0xFF, inc))
> 
> drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to 
> undeclared function 'FIELD_GET'; ISO C99 and later do not support 
> implicit function declarations [-Wimplicit-function-declaration]
>    675 |         if (params->codec_format == V4L2_PIX_FMT_HEVC && 
> !CHECK_VERSION(iface, 1, 9))
>        |                                                           ^
> drivers/media/platform/amphion/vpu_malone.c:79:4: note: expanded from 
> macro 'CHECK_VERSION'
>     79 |                 (FIELD_GET(MALONE_VERSION_MASK, 
> (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
>        |                  ^
> drivers/media/platform/amphion/vpu_malone.c:675:52: error: call to 
> undeclared function 'FIELD_PREP'; ISO C99 and later do not support 
> implicit function declarations [-Wimplicit-function-declaration]
> drivers/media/platform/amphion/vpu_malone.c:79:59: note: expanded from 
> macro 'CHECK_VERSION'
>     79 |                 (FIELD_GET(MALONE_VERSION_MASK, 
> (iface)->fw_version) >= MALONE_VERSION(maj, min, 0))
>        
> |                                                                         ^
> drivers/media/platform/amphion/vpu_malone.c:77:4: note: expanded from 
> macro 'MALONE_VERSION'
>     77 |                 (FIELD_PREP(0xF0000, maj) | FIELD_PREP(0xFF00, 
> min) | FIELD_PREP(0xFF, inc))
>        |                  ^
> 2 errors generated.
> 
> https://linux-media.pages.freedesktop.org/-/users/sebastianfricke/-/jobs/73725346/artifacts/report.htm
> 

I'm sorry I missed include the header file.

Regards,
Ming

> Regards,
> Sebastian
> 
>> +#define CHECK_VERSION(iface, maj, min)        \
>> +        (FIELD_GET(MALONE_VERSION_MASK, (iface)->fw_version) >= 
>> MALONE_VERSION(maj, min, 0))
>> +
>> enum vpu_malone_stream_input_mode {
>>     INVALID_MODE = 0,
>>     FRAME_LVL,
>> @@ -332,6 +338,8 @@ struct vpu_dec_ctrl {
>>     u32 buf_addr[VID_API_NUM_STREAMS];
>> };
>>
>> +static const struct malone_padding_scode *get_padding_scode(u32 type, 
>> u32 fmt);
>> +
>> u32 vpu_malone_get_data_size(void)
>> {
>>     return sizeof(struct vpu_dec_ctrl);
>> @@ -654,9 +662,15 @@ static int vpu_malone_set_params(struct 
>> vpu_shared_addr *shared,
>>         hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>     }
>>
>> -    hc->codec_param[instance].disp_imm = params->display_delay_enable 
>> ? 1 : 0;
>> -    if (malone_format != MALONE_FMT_AVC)
>> +    if (params->display_delay_enable &&
>> +        get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>> +        hc->codec_param[instance].disp_imm = 1;
>> +    else
>>         hc->codec_param[instance].disp_imm = 0;
>> +
>> +    if (params->codec_format == V4L2_PIX_FMT_HEVC && 
>> !CHECK_VERSION(iface, 1, 9))
>> +        hc->codec_param[instance].disp_imm = 0;
>> +
>>     hc->codec_param[instance].dbglog_enable = 0;
>>     iface->dbglog_desc.level = 0;
>>
>> @@ -1024,6 +1038,7 @@ static const struct malone_padding_scode 
>> padding_scodes[] = {
>>     {SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>     {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 
>> 0x0}},
>>     {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 
>> 0x0}},
>> +    {SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 
>> 0x20}},
>> };
>>
>> static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>> @@ -1058,8 +1073,11 @@ static int vpu_malone_add_padding_scode(struct 
>> vpu_buffer *stream_buffer,
>>     int ret;
>>
>>     ps = get_padding_scode(scode_type, pixelformat);
>> -    if (!ps)
>> +    if (!ps) {
>> +        if (scode_type == SCODE_PADDING_BUFFLUSH)
>> +            return 0;
>>         return -EINVAL;
>> +    }
>>
>>     wptr = readl(&str_buf->wptr);
>>     if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + 
>> stream_buffer->length)
>> -- 
>> 2.43.0-rc1
>>
> Sebastian Fricke
> Consultant Software Engineer
> 
> Collabora Ltd
> Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> Registered in England & Wales no 5513718.

