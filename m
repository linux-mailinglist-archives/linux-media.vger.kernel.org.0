Return-Path: <linux-media+bounces-57825-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO6uJBx+zGl/TQYAu9opvQ
	(envelope-from <linux-media+bounces-57825-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 04:08:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F25373A1B
	for <lists+linux-media@lfdr.de>; Wed, 01 Apr 2026 04:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF8D3300639B
	for <lists+linux-media@lfdr.de>; Wed,  1 Apr 2026 02:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD702C21F4;
	Wed,  1 Apr 2026 02:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VEkByS89"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF77227B94;
	Wed,  1 Apr 2026 02:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009294; cv=fail; b=iDl65dYnlgb0WmEuVXLGWlL/h+YR80LabWPY/vbNQvEoY21Zci+IHYDMofLk6voN1t9UgL3ckif/6FbAP1AU6C5iiMgTLMEJEuQw6q7XnxA48gNBJhP73Yf5/911CRsP7U7856l2RqqQNSD6HQeXMVOMP+5gcCMULVkI4HorDYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009294; c=relaxed/simple;
	bh=h05bzCaEYiuHmU/aN2pvJ/whSExVG/kIId94ftFrVmM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ReJDJBuZzy3db3FECXjnZ6ZKkHo495fMZU++IIL0FYWURsBCcrRqJa1cOcukbq+KGqrmGOOsLUZYqALvJTSXUHdo/Rc1uLzbbEVA6Sq+MQf6MEU4RbiGmglJb7cHWdOIwObHB54AubBvpXc9ZqOuZOydRSt15kapdI9AoKx2PiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VEkByS89; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u005y7CHQnArdNnSKGe1wFMUJqAz6ZfklAMtqeljgICTmc2vmbzhP5tqfBsvZbsGOiLCpH7iZ30WDl94QT52bIf+gr5UuJXquz/wm3VlzmHDGzCb7hYuSpfAOufox1zZayw/qoC7INf5EruCTPIMqAn4BUslCVVRaqTcJaFrXoH9rcV9dQysPIyTjUkYfrvwJXaDufRsBobvxsZ23bfM23E5WuBQkAxjlb0/zNLyg2YJdR/lUy2ZfTLP59RY7Zr/+ooYID9KITuzVqXC9pN5LbHkKcQFClICRSs2ewCt+DlnJ+nn2Xf/AQly4jH4YIIx7ztsWbM20rQXYILX09K+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZbvQ73kh+nnq3/PJbmOTfvciOjlxNl416Bk+dcHwX4=;
 b=AyQOvQ0Fr2rbMbkJsQb1yztx1tYHxz6JsqE154wF3wKbQZT5cEcIGTjJtUSwRh7fSfmgegicns9uqrZatBIA50qqGMrEOmexQsRw+ny3UeSwbsN7koLgJhPwumpuG1GY5cpHP75HCuORAiLsrjhf987NE+AgHZ/m7+z9c/5ZLbF2yaEkETOyNH3ijM3PO9XIt68259SAI9QugkE2QsvNcrbMxN4C8pj+Uul+78tSUVwaYaABlUUDqxJbG+sGKoXHZxxRPde72/pht/DXUsChfM5KA4cadwtZJO+gbD8K+dsDvtVxZndQkUOWj2RaLFEgosBOWubymNL14Rfq7npPDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZbvQ73kh+nnq3/PJbmOTfvciOjlxNl416Bk+dcHwX4=;
 b=VEkByS89dZTTf02pebJBFjsZABvISkKm/wQLoclMsbW3LzjOx0JnObn7ZT4HSPKXrkFZJuv8EG5jsfYNkNzkd5Qt67M+0E4PKdM+i286xk8/1QNWZLq3x8Y0L4S5ozYYA4a7UQ9LUwD9yLTKy/9zZqLod7mPGMMXZTs/vZ6X3r77IZwdhEXxdga0E9eOTzIgpTvb8Qa8HyB+2Hb2jS/3sm8qi3H5kROrOn4UmNexSb7m+APXtDx3u/qwwbGHfvU5cOC9DGziTuHrcnB9hG3qHGMVk4N6dWTDJBgr4emgsiWoI2CyDf8dpob1ol4MMP1x+Dwdf3OfaN39PQUezqtoSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DB9PR04MB9961.eurprd04.prod.outlook.com (2603:10a6:10:4ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:08:08 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Wed, 1 Apr 2026
 02:08:07 +0000
Message-ID: <09dc06f1-b792-4479-a325-985e29946a6d@oss.nxp.com>
Date: Wed, 1 Apr 2026 10:07:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 sebastian.fricke@collabora.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DB9PR04MB9961:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cec7d0-1456-4102-a4a6-08de8f938428
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6zwEhMrZjr2Wjf17CiKu2ayM7rJVP/Kc70Eta/sXeF3Pq1lQvTP/jedB329P66myMtpA3pI6lOKNTxX3MK687GcWpqCcxos/311/50xY+Q1qf/DPZu5fFdX6gQxqzWsxSHeTgH0iqFmtVH928enUT03WbqPPbLW3wCslLZ35k8k9IKuCtT7hz2k0dj3VQfkyscS4DZLsJLgmKqwilk3nwLuy9WiwNMq3usu4rQILw4fUT9t+OQpIRnH7A8WneVsEsHUUxwyAYGlrqqsO6He7g54MBwq8CXuKCV0LR4fdY5UukRmEJSJZUgIhq4y+1uIAnlRK+woShdOI826FJw8l1H3QqcAQXrkj+Kp7vmQRoP9aDPsJ4rk/Yk3je2Ub9MlNpInYzR4Pq0Ag5tfmEKxTVzRCR2fIHVZHpE0/FpZYgE8rxQSvLm46Zcfn2INMExPLto2fE0W70rDiwhUUJHZCZb5cn0fEytgvyPvTGuSnYSTj7LL6LF6Zc8vJRei2O7i9+SoMgXhfRzCW3iJKqavLK9Ry4VJSciMmQ5V5kzxiZGXR4Hxe+yak1da97vpaLrTq8ajPrO1LzqLbcwNNspm33GEOYxbh/y5sYbD0/qU/JHMm2VyfWKCc95jpI9HJ/3ZEWBUv28t9+AAbR8HjG3BRDtedGnJqqOk20+fTKS60klyL0gkgPszC+BxVYLCHaw2sQtH047rDV60As4lp931WYI5tP/4dFgr1KvxlrNNkuqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWsvQ29qZTVSWGZNL296aTdDNi9hUVM2aHY0T0p6ZlY2MENTUVdTNjNBTU9a?=
 =?utf-8?B?M3J3bGZwejR6MUlnZUVLcXRvUDRBL29yNTNWUFNJcUhncEoxd0s3Mm9YYXFW?=
 =?utf-8?B?T0piMTRVaWJyanVDRkhSMnpseWlXck5kQ2JyeGpBMTV5YUJieFQrTnNyYStR?=
 =?utf-8?B?RUF5NGFiNFZFTm5rZFU3UkFEUHNxdW9qM3BCbzU1em1iZ25KNS9IY04za3ZP?=
 =?utf-8?B?dGROSk1CSUcyQTJ4OFRnaGw5a2NORXJUOUYyWk5zVVNqbTVqZlcvcDNRbDZK?=
 =?utf-8?B?N2xwbGJqL2FYakptVHJHeGZFdEVnSVVzRnJyY0pMNkNJeHRzRDNoZVVwQnRi?=
 =?utf-8?B?d2ZJZExHY3QzRjNvTkdsMFh5YWZoUXNJTUxoaVhWdjRQbUpobzdSRE1SVHBO?=
 =?utf-8?B?NlVWS245M1FuTUk5VGZyUWIyWVVFanVXR0RwbG5OaXpicnY4cGhLckR6TXVz?=
 =?utf-8?B?QlhrWXF6UEQ5UG56ck1LalhpUlFIQnl5YTZJd290SDRXTG94NSs1aDAzQUNH?=
 =?utf-8?B?eXovbStDc3hSSGJnMDJCQSszbWJBdVVqWGdRcnl2NWNIS1M3NVZjQnR5Z29Y?=
 =?utf-8?B?RVpNakFyL0xObTY5TWlqUWtsMGpyd0prZFRNM3ppamdrRUViRU9ycy9qd3FG?=
 =?utf-8?B?V1pXWVRTT1h5Mm1ranUvaXA2ODdWU1lpeGF6SEZTMHk0Q0EzNjRxa3gzU2lZ?=
 =?utf-8?B?Ukx0M2NZYjZ0Y3crWHpCWEFIclB1UzR4RHBMeDh0aGVvWmY4cnczWjZrK3Zx?=
 =?utf-8?B?aUF3dmpISDFZM2JDV3oyWTBzT1ZQMXF5MHdmTVhwdjlxSVduem5pV2VkaGZn?=
 =?utf-8?B?NlpJYlBaa2tRYlBnUk1tYVoyODZTeXFQekJZVW96azNWNG9teVJSTXdlTy9Y?=
 =?utf-8?B?ZGNvQTVqTE1YVEd2S1dKVk5rZUNHQWlZazhZcXFjQW5xZ3VTbkEyaVV5UWVH?=
 =?utf-8?B?MnRKYzd2M1hBMkxRVCtNd1BVTGFQdExkekFkcHJITG9tOHZzYU16cDFjVFBB?=
 =?utf-8?B?cTgwdmlUWFprdmd3V291WUpVdGV4QlNSZ0ltMVI4UXBiMmU1ZmFWK1FaNnNQ?=
 =?utf-8?B?YTI2cUxIYWhpalpxcmtFVXpDcEFDUy9FeGUyOVFnVG1MUmJDdUtZSnBwMUNR?=
 =?utf-8?B?bm1hNDMrdUJBY2dPNUVyMisyakJ1YjFSVDMrRTQ0VW01NStEVWRya1pJODUw?=
 =?utf-8?B?WlNvSVFaWGYzM3lUTUhqdFMySC9oaU94QzE4SUo5c1JXV3dsaEtIN3pLS2Ru?=
 =?utf-8?B?UndPbDhGWWloM3l1blNKdCtqMDI3OGRyVFNZNnZBbU85aEh4c3lZbHAwOXNY?=
 =?utf-8?B?RkNFUFFxYUkybzh4ZEh4Qnl1a2lRWllqZGJnNXFBanB5VUhTcXpBNFVldnNs?=
 =?utf-8?B?aEhyMmtDNG50V2pGT25FK1hxdVZFYVpQbVVNQzFvUERnT3ZCK1h6dmJOUk5r?=
 =?utf-8?B?NXY4VDJHY0xzd3F2L1FYVFBud3k2Zk9KSExtb0NjWUU2Y0lHQStyVjJRQ0xQ?=
 =?utf-8?B?L0RvMHlLdkhkdmM4Tkt1eXNUdHdSTDV4OXBsR2NFWDhBVnJRaGJseWhTYm1H?=
 =?utf-8?B?cTY0SUN5cUVHOGZLb1JOTlM0NnZTdEhscklIelJzRm13aVdnVTJBM0hnZHlw?=
 =?utf-8?B?d1RXZFNjQ0tXRTYvbW5ack1OcnIySVRFdVNnN29PaHA0ZE5vMW1jbmkzR2hC?=
 =?utf-8?B?M2FGbEk2cEU2VXhZYkNiRFBVSURBL1BiY0JKZkNSQjY1QjJmUzJjZmpXdjht?=
 =?utf-8?B?Ky9JT3ZPMkk4YW8rd2tjVXlrVTA1U0JTZlVKaWlkemtaQlN0dmVTaE95UzEy?=
 =?utf-8?B?U2VmaldrZ1dTaFRrNjlpWjZTY25SL0t6UnM2VWE1NlpMcURuOHdlTXljZ1BN?=
 =?utf-8?B?cUVRY2tKdFQ4bS9kaTdDcHB3OGZxOC90VmJML3VRa2pmVVhXd0hpaTljV25z?=
 =?utf-8?B?aXlqckNyeGtJZHJha0JGZ0kwYWJPYThKQU9TdjFyeG84TlFic3NaVjd3ajR2?=
 =?utf-8?B?blJVM0s5K0M0cFk4K2Z5dWNOU3Q2blVaRmd0ajJKOFFmQkJ6WDVuQlZtcDRI?=
 =?utf-8?B?WkEzQ3M0d2prYjN6dmNxaFkzb3BwMTkyVG1kS2xjaFhMUGNQdWtVK0Evdm85?=
 =?utf-8?B?dExOcUdOVm82dEFBVHJDS1k0SzhvcnNLY0RYak9oV2c5Y01aVVYvcmRmNS9Y?=
 =?utf-8?B?YlluQ29meUZsYUZEYTMxRENoV3VMeGlvQ0N3RjNBVlZVZVphWDA1Mk51ZGFH?=
 =?utf-8?B?aTMwVmVuRXRWK2Q2S0hOTTRMamNWcytQYmJTMVNoc0lNc3lwN3BwTlA1cHh5?=
 =?utf-8?B?RnhUVlBkTHVvUm5Mczc1bXg3UXJyQ3JIRWZyb29FVXI2bEtUMW11QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cec7d0-1456-4102-a4a6-08de8f938428
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:08:07.8362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDjz3NrMq/ycKnDX1N8yjoHIwv8m7YzRFrygdq/ZZlzUq7/NguBpNSwhT/u5zvf7yG5ChUmkWZlTXBDA5kx2gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9961
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57825-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: E4F25373A1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,


On 3/31/2026 10:33 PM, Frank Li wrote:
> On Tue, Mar 31, 2026 at 03:23:11PM +0800, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
>> applications to query the total amount of memory currently used
>> by a device instance.
>>
>> This control reports the memory consumption in bytes, including
>> internal buffers, intermediate processing data, and other
>> driver-managed allocations. Applications can use this information
>> for debugging, resource monitoring, or making informed decisions
>> about buffer allocation strategies.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
> 
> Not sure why not export these information by debugfs, or any benefit vs
> debugfs?

> 
> Generanlly document should be first patch, then driver change.
> 
> Frank

Thanks for the comments.

The key reason for adding a V4L2 ctrl is that the original requirement
(from Android) is to query the memory usage per VPU instance in a simple
and stable way. A ctrl naturally fits this use case, as userspace
already has the instance fd and does not need to locate or map any
external paths. In contrast, relying only on debugfs would require
userspace to figure out the relationship between an instance and a
debugfs node, which is neither stable nor friendly for production
systems where debugfs may not even be available.

Debugfs is added only to expose the full hierarchical memory‑tracking
structure (device → instance → queue) for debugging and analysis. It
complements the ctrl, but cannot replace it for the original functional
requirement.

I will reorder the documentation patch to come first in the next
revision.


Regards,
Ming

> 
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>>   include/uapi/linux/v4l2-controls.h        | 4 +++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> index 551426c4cd01..053db78ff661 100644
>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>   	case V4L2_CID_ALPHA_COMPONENT:		return "Alpha Component";
>>   	case V4L2_CID_COLORFX_CBCR:		return "Color Effects, CbCr";
>>   	case V4L2_CID_COLORFX_RGB:              return "Color Effects, RGB";
>> +	case V4L2_CID_MEMORY_USAGE:		return "Memory Usage";
>>
>>   	/*
>>   	 * Codec controls
>> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>>   		*min = 0;
>>   		*max = 0xffff;
>>   		break;
>> +	case V4L2_CID_MEMORY_USAGE:
>> +		*type = V4L2_CTRL_TYPE_INTEGER64;
>> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>> +		*min = 0;
>> +		*max = S64_MAX;
>> +		*step = 1;
>> +		break;
>>   	case V4L2_CID_FLASH_FAULT:
>>   	case V4L2_CID_JPEG_ACTIVE_MARKER:
>>   	case V4L2_CID_3A_LOCK:
>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
>> index 68dd0c4e47b2..02c6f960d38e 100644
>> --- a/include/uapi/linux/v4l2-controls.h
>> +++ b/include/uapi/linux/v4l2-controls.h
>> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>>   #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
>>   #define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
>>
>> +#define V4L2_CID_MEMORY_USAGE			(V4L2_CID_BASE+44)
>> +
>>   /* last CID + 1 */
>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>>
>>   /* USER-class private control IDs */
>>
>> --
>> 2.53.0
>>

