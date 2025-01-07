Return-Path: <linux-media+bounces-24313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C1BA034DA
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 03:04:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 444587A02F4
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 02:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCB486349;
	Tue,  7 Jan 2025 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P88CYuPg"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECE33EA;
	Tue,  7 Jan 2025 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736215476; cv=fail; b=BEFK0zqtKqI6jYeXQJi/SowgtBiCJo8XgN6pakmMzGY+L8hGZ+66Nv9bWpOL6RJjRqIL9YUfdjsUGjV9oW+HmMm3ZqSZqysTBM6Wi1EM5O7uHiYE9HQ51erjz60HfWU9qNEGeA/xPQxbxcL2SUqGxgAjUUUJNuV2iAtZXymH43E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736215476; c=relaxed/simple;
	bh=cSpBtNROPZCzzvgrhkxTTM2l+XNOtfoCJBOD/zoVVD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s+0J6AiEjzrZbEFgLtaH3AkvEmf0t0Q0R6pmrTWZt+bjmz+W810Upx69MrWzKcFbfr2LGHsSThLIYmxAYy8l1wwBinqN0d9iuO9WKARNZBBKqWDpkTYsULXU0oet5Q7OwwsNPFjthwA2+lHKXZPk4liMAocQDDlSURoEXAyXvqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P88CYuPg; arc=fail smtp.client-ip=40.107.22.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOxQU0+pQaxbDiMs5JDDR3WOMoAMxZVvTQKIIiBa5vVkuMhSlDDQRQsS+fo0nCS7iNQ3RKqur7LmXU+gfTPK4LVXPy74fyFAAst7MVT1GRn3mErChjdgnunCDd9f6pnZIjfThPo1ROMvPe7yqPXhgwh4PyPjwMjbxAaaEHcKUBkP0PHT7HEfDm2iIjDj9L23ed/d51Ea1n04msXxpB+OaRGBR+34NPtJqZ0byRrDfBIRAA01soD2aCJJyjnlQhBWIdyWfXDd+SkO+22n+EpS9zK/41n4MZ96m43oYcgVkWDaO/TVeQZK9XCSqgeRXHCBQ1xwyEEYX6gm8yzQe2Q+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czEhmF0sC5tvNL2NR/gPXOms7km4MiAPW2rb0YDTHb8=;
 b=mIYNn/RPuwvPmKkLltB7ZwS5VKcTXnOg5cAwIaToU4M9pBFBVFT+5WcAsqvEYYxqEFfHD1bgWQx//MRHINsNhkFfEycEFrCAtwVO+L7xe2fetmXNGevYuC3XMEQFRuJ8nQAevNnf62ccgbRv/8N9oaE7DNMwyc3VW3vM+ubiGfJkh2tLDaWu9HHIHmDT0X/uYWF4H2w57nRrccGeDhNr+6ySv+Jotcs5uhNtLQaWA0vPqHZvXqrSnp4ddpQ5ZIQZ7lPJolrGs+XuH0u8iUgfUKKUOp/zxbNNEffTmwXiTV0LZSyDSGLpZwgSBKVpyXGju3bp0sEH9Kjz4UUrRPKRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czEhmF0sC5tvNL2NR/gPXOms7km4MiAPW2rb0YDTHb8=;
 b=P88CYuPgh61/JIEZb5MctO25Nh8bdPGQ7/XdM7PX7wSRXoi/teJPWdHqiVn+FxH5xyBNrz8YQc+d8a4rpY8zFaB7gjtueJPpd9L7rDwDnSi3dGbK3t2CM4LxtXJpycIuV5rCOfrkXIWycvwu4P7Rcp0zQnN1UYozv35uahY7FU4UfvU/ZDhVJyQdwkw1ojvqoZro1x30Jf1E3DEJfn0RMrcEnlx6l4IJokUTzpkRHD3XxgeoOrNYZlVIbUuryGETBZPu0aJM+Z1Eyo9JsB67ANGx90XAVs2ADaQsPq8fAy8EvNfB5rTzxJsxBQxSKTKWDOV210K6VvX9wbZ4pGiK8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU0PR04MB9226.eurprd04.prod.outlook.com (2603:10a6:10:351::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 02:04:25 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 02:04:25 +0000
Message-ID: <e0c5483d-b438-4b1e-a0ee-58a123aeca61@oss.nxp.com>
Date: Tue, 7 Jan 2025 10:04:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: amphion: Support dmabuf and v4l2 buffer without
 binding
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241213091030.2936864-1-ming.qian@oss.nxp.com>
 <e6548df223ca891427aab1e145db04814a9eb67b.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <e6548df223ca891427aab1e145db04814a9eb67b.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU0PR04MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 5351ce46-e8e4-46a0-f04a-08dd2ebf9c6e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mkt2Zk11MS9NV29oTUQ4WmxIdE0xRDdRY3BQbGcxNXR4bW1yWm1qcVlSclVy?=
 =?utf-8?B?d0JHMnJzQ3h5NSt2OHFjOTJQL0xWaXBCYlFiaGEycjI5RUkzNlhTY3RnSDlo?=
 =?utf-8?B?YnQxekhqOW8rWUo1VUNNcXcxUU11Q08zOE5IRThnbXFoMWJpYjhWNmtMalZB?=
 =?utf-8?B?M2d1QzJ1SGQxTzZQbVNwb1UvYm1Nd0xDT1NyUlJVSyt2dkRXYms4SmRkTzJm?=
 =?utf-8?B?RFlMbmdVUUlFRG44WDJtRi9TbGJuY1A2MDFaa2dFeEVDeVJXWkJlOXVqYjRP?=
 =?utf-8?B?dlZzbWY1WVRSTVZqdGorMm1ac21PSTFEcmZMcnZCaTJLOWlFZ3NwWlZPQXRu?=
 =?utf-8?B?WGVyQnpuQmFQYWk1QmpBa3FHK3ROU0d2cHd4YkpaN08wS25IMU8xOXlhN01F?=
 =?utf-8?B?UGNpckpzanhIaHV4cGlsbWNjTUwyUzhPQnliMDRtSjdmKzMwSUFqRkdVQm5Z?=
 =?utf-8?B?L09wNVE0V0NFVjdrS3RPMHNvYzdaY2RjTWN3RlB5QTQ5c1l1VVNwYmhISncv?=
 =?utf-8?B?NTN0M2oySUdUTWkwT0c5S2tobFNGcC9CWHUzNmpZV0pyM3ByUURiT1p6WGZV?=
 =?utf-8?B?bGRkeFc0WDBZMUpRSjB0RGRtZDIvRlcxS1VIb0F3MmREa21ueUc2cm03V0xX?=
 =?utf-8?B?Qzg1WmtIcHVUbUtRdVJtNGxhbmZJT3IxcGpydE1Dck0rNDdmL2Ywakc4U1VL?=
 =?utf-8?B?ckZ3OFhqY25DOExzUyt1K3k0b25CR1ZabG02enNzY1dRRVdZakJaYjY0S3la?=
 =?utf-8?B?Ym05bHZFTGE3WnVkUU9uREluY0w4OUhKYndtWWlmWVlTUFNtalBKNUg1WVBU?=
 =?utf-8?B?WTNJS1U4aXZMU25HYU9kaEhMRHhNbmZlLzdVSmo0RGl1YnZJUkkwdFVvbFZa?=
 =?utf-8?B?U3JOTktyY3FZWnVzZ3pFdjVZbHpueERKelJpcTNweDdseGFmMDUvem50TWkr?=
 =?utf-8?B?S2s3MWFBQ3MzeThtRUNMZ1RLME9pc3hGZ2c0SFVHU2E3SEN1UHdxNXFVWEJY?=
 =?utf-8?B?Mi9lRHc0RFEydlpuQjZoaUtGVWdNM1BXbjYrSStOSlprcDZ3Z2JtaDlURjRw?=
 =?utf-8?B?bWRGMVRNWFVEOWthTHh0RGRhTS9SQWxVdE1Ya050clQxa1I0N3VNNXFXWUR2?=
 =?utf-8?B?TytwTnlSTlo3NWF5UWFFQUFpdHFJb0R5WitseklGbVlrenJMLzVuWTl4V1Jo?=
 =?utf-8?B?cS85cnVYckVSOC9DSlo1M0dLbVdKazJsQlFXQ21CYWQwWWlrSTJzS1FqS3lK?=
 =?utf-8?B?MlJNclUzRW9OdTdmVHBVbkh1Q3Qyd08wMjlZUEJMMTM0SzJRcmhrVzM0L21F?=
 =?utf-8?B?eW8vVkMwTVM1b0VTQmU1cUcrWm1YT21WOWllUUdTTTdHTnNjSnpqQll5ZUZV?=
 =?utf-8?B?eHBuSWhtZkhkYW9uTGhwdWJMcDQ5dk5GVFJMcUJ1aXRzY0VydnAzSXVJZ3E1?=
 =?utf-8?B?ZGYvUnIrakVKeVI5QTV2TmFJdjM4SGlIaHlJRFVNaWxTS0NTVmh4SlVVTUd6?=
 =?utf-8?B?VVdEbzFRY0pobXN4S05IMWdaVzBRWlBxZXhWU3pJdlZ5NzZMWHBZdXpYa0hl?=
 =?utf-8?B?TnRQSzZWWW5OL0JKWUtJZ1ZIZmgxTjRXMlZJclBkbkg4bkhSa3RWZCswYjNY?=
 =?utf-8?B?eDk4TTAxd2JCZDlzVkRnNThGMnRQNEhHdlZaS1ljWmsyWU03SlY2ZUd0NVZQ?=
 =?utf-8?B?c05PeFY2aUZxcGdRSmNzLzF2ZnJlVGxsMEhXaWhISEo3ZW5oQXV1dDhyQllO?=
 =?utf-8?B?MWtaMUNzSkMycHRiL21MRGttR3VlNGxPKzJwSDM4Si9KZjNNYTEyYlIrUW4x?=
 =?utf-8?B?ajZxWFl2U2d4aFpudXpQRTdKUzJ5MDg3cHNFajFkUzdsREpIaWpQVzk0Qlh2?=
 =?utf-8?Q?Y66NF06utK/cJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGZSTTRWQ2p5UHlJSUE5Mm1PUGdoTXZiMTdmWmNaUUhnS3ZuYnRNdm9ZSFd2?=
 =?utf-8?B?L1RHUlRLWlhQQ2p3N0RuRmhqalpoZjF4L3JNOHNQWVRkYzgyeHVQZUxCeFFH?=
 =?utf-8?B?TXN3ZUdxdUx0TWhJd1BIaDgyelM4c3ozdER5U1ByZTVjbDZrRFZNdzFGZks5?=
 =?utf-8?B?UzdQc3FPK0hVRUdUQ2FpSGcrbFVVTGtoRGxZc2pSTnQ1U3ZZdjcrckJOQTZU?=
 =?utf-8?B?YXFncVFWLzhwUkRYM3ZNa3FERUZ5RlpERUlsTEZ3YnFBcDh1VnE2VUhxMmNa?=
 =?utf-8?B?OXpVNlh3N1hrb0ZyYlhRelV5ZzdRZFpsUEdmZjNPWi9GRnFPckI4ckZjZkNI?=
 =?utf-8?B?WE9nY3R4Nk1kRGsvV3hwQUgwdmFZVHo2dnlUNFd0VVhiOGtJQWFWcC94WFNM?=
 =?utf-8?B?QlNEUUUyaEZhNDFNanBQNFBlYzBQZjArOHpVaVRteVd2YmNITEZydE94aXVQ?=
 =?utf-8?B?NnNBY2U0ZWtwM1FLR0NPdUI1NkhINStmTUYxMUx0VWhBV3hiaDdBcFVseG9m?=
 =?utf-8?B?d2FRV0k0QzlMcWJQTHkxZ2MwczVSSU4zSFRuZGVLc1RPVU1TMGNSMXpFQllD?=
 =?utf-8?B?WHVkQWdOd21OcHo1T3RIQTZWbHFZM3BCU0lOLzRQb2VLOG5Ed3Q4QkdSdlhV?=
 =?utf-8?B?UXdBbkROcXptT0dPUjl3YzZjcWRTVyt0UXY0a2srSVpMbklCem1ONXgwTytm?=
 =?utf-8?B?cTBtRjBiWnRHd3VZU0Y1K0pmQjNOd0tJVzZjZWFFek1FS2dkTEdETTREWmZO?=
 =?utf-8?B?d0hhTU56blU5c1ZGTnhEcHhoQ1JHQjNLU0ZTY2sxQkU0N1BuYWJwRU00U2U1?=
 =?utf-8?B?L29JOVkzMTZTWEswVGNFeEEwUUJJZWZQdGdYSDdYU0E3ZDI3aFpUbTFucFlu?=
 =?utf-8?B?TE1SM1g2UE1OdFUvNEhzMWRGWW5MdVZlQTRIQnhyekRDNkE3Q1NnRkY1R25r?=
 =?utf-8?B?MU5Wa0Nhb0Z5WjZ2REQwZnV4ODJ4RUx0eGU1bnVSeXd5bW12Y2x0NU4yVVow?=
 =?utf-8?B?V1Yrb1Y2aE5JQ1FMbGdTYUZCMHFwQ3pGZGNvL01jWGJmSXpoMFkyMVh6bXE0?=
 =?utf-8?B?ZEpLa0YyOHdrcEtnc01YWXdNbHdabGQ2MjFqQlVpMW5VZ09aL3NSbnMrRWhC?=
 =?utf-8?B?NFR1RDdTT2pwL3Y3eXpBZnVrKzJNdk5RYTV4RXJqM1VRQTVZOStPbWwycEUz?=
 =?utf-8?B?aWZ3YUpKcEZPTGZ0cm01ak5IWlM4SDNlWFhKVzk0dlgyNmtBUmZIYTdxcFBP?=
 =?utf-8?B?cmdpQWxzNmc1UXBDaG9rbzFlODBsWS9iSGVDaW9yZHFFWmFNZFJaS2doQXh3?=
 =?utf-8?B?UTZTRC85bkJ6TnFZVFJiaGR2OXRYWGpoOGxFM000ellRL1dFdWtHeVVNenAv?=
 =?utf-8?B?Y240eS9mUFZYQnVFYlV5S2NWcXNQZzJibEtMRlNrTkNWVjJaMVpOMWdUWlU2?=
 =?utf-8?B?NjNsQlZvMTdCQS8rL0Q2ZHB5RmZyQ2JkR1NWNVlLU0VPakxZVXlSeHpMVytr?=
 =?utf-8?B?K1dZdlBCbkdXblA0NVRwR0hCV2ljeGlkYTR6MW50QWFlQWQrMzZqUHJySFVB?=
 =?utf-8?B?MzVpeUN6WjZUZjB6THhtdUJPOVZXZjh4bCtKanFHZUFmY1RpYnNxcnZId0kx?=
 =?utf-8?B?aU82M1NLNU95RzdPNFFRTkRlekVmUm9KWk8xRkNsYWltOVhaRG53a2xoc2Jo?=
 =?utf-8?B?RXd6TmhDN1NWRk1NRm9nK3g2N2JGdHVvM2JSVG1pSEpmcUt0elVock1SNUxD?=
 =?utf-8?B?ZHhjQ0o4eGRwNXAvRThqemhBbndJcWsrVzJmTVEwM2w0cWpCWS84dmVITHdY?=
 =?utf-8?B?WUVMbnJJVC9lVURmYzZOWGNuanRFeXhJVVYxcVhHT2MwdnUycVlKUitySmc4?=
 =?utf-8?B?cHBJS0Z4RjcwYXA4SE5reitiWUk2N1k3T2VEWllGVjdiMnNDZGpDdlRJYlhL?=
 =?utf-8?B?VUtLSDRuNGxxK1IrMWpBdVJwc1RwYnZvUTZnSEhRUUVDaHllcEVWVlNaY1Nr?=
 =?utf-8?B?RWtUZXAvbXJDNjdhRG05bE1SU1BUQzFqeERtMDBvSVNSOXB2Skx3bEpKbDRO?=
 =?utf-8?B?TDQwOUJjS1IvUDEzUTUyWCtFa2Z5NHNCUUprSVlTalVQK1N0RWo0TDQwaGJj?=
 =?utf-8?Q?Ii1snhQMTNU2h4ImFFm2Ni046?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5351ce46-e8e4-46a0-f04a-08dd2ebf9c6e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 02:04:25.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijscwCD8gzy6H/6/4qQui5DMJnMVwpmKtNRGzndLaqO/00yVvS8tMT0iNw/mWRuY+omsNKAnMybRY656w6QThA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9226


Hi Nicolas,

On 2025/1/7 5:55, Nicolas Dufresne wrote:
> Le vendredi 13 décembre 2024 à 18:10 +0900, Ming Qian a écrit :
>> From: Ming Qian <ming.qian@nxp.com>
>>
>> When using VB2_DMABUF, the relationship between dma-buf and v4l2 buffer
>> may not one-to-one, a single dma-buf may be queued via different
>> v4l2 buffers, and different dma-bufs may be queued via the same
>> v4l2 buffer, so it's not appropriate to use the v4l2 buffer index
>> as the frame store id.
>>
>> We can generate a frame store id according to the dma address.
>> Then for a given dma-buf, the id is fixed.
>>
>> Driver now manages the frame store and vb2-buffer states independently.
>>
>> When a dmabuf is queued via another v4l2 buffer before the buffer is
>> released by firmware, need to pend it until firmware release it.
>>
>> Signed-off-by: Ming Qian <ming.qian@nxp.com>
>> ---
>> v2
>> -- fix an uninitialized issue reported by media-ci
>>
>>   drivers/media/platform/amphion/vdec.c     | 232 ++++++++++++++++++----
>>   drivers/media/platform/amphion/vpu.h      |   7 +-
>>   drivers/media/platform/amphion/vpu_dbg.c  |  15 +-
>>   drivers/media/platform/amphion/vpu_v4l2.c |  11 +
>>   4 files changed, 218 insertions(+), 47 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
>> index 61d5598ee6a1..a26cb0c264c9 100644
>> --- a/drivers/media/platform/amphion/vdec.c
>> +++ b/drivers/media/platform/amphion/vdec.c
>> @@ -26,6 +26,7 @@
>>   #include "vpu_cmds.h"
>>   #include "vpu_rpc.h"
>>   
>> +#define VDEC_SLOT_CNT_DFT		32
>>   #define VDEC_MIN_BUFFER_CAP		8
>>   #define VDEC_MIN_BUFFER_OUT		8
>>   
>> @@ -41,6 +42,14 @@ struct vdec_fs_info {
>>   	u32 tag;
>>   };
>>   
>> +struct vdec_frame_store_t {
>> +	struct vpu_vb2_buffer *curr;
>> +	struct vpu_vb2_buffer *pend;
>> +	dma_addr_t addr;
>> +	unsigned int state;
>> +	u32 tag;
>> +};
>> +
>>   struct vdec_t {
>>   	u32 seq_hdr_found;
>>   	struct vpu_buffer udata;
>> @@ -48,7 +57,8 @@ struct vdec_t {
>>   	struct vpu_dec_codec_info codec_info;
>>   	enum vpu_codec_state state;
>>   
>> -	struct vpu_vb2_buffer *slots[VB2_MAX_FRAME];
>> +	struct vdec_frame_store_t *slots;
>> +	u32 slot_count;
>>   	u32 req_frame_count;
>>   	struct vdec_fs_info mbi;
>>   	struct vdec_fs_info dcp;
>> @@ -289,6 +299,64 @@ static int vdec_ctrl_init(struct vpu_inst *inst)
>>   	return 0;
>>   }
>>   
>> +static void vdec_attach_frame_store(struct vpu_inst *inst, struct vb2_buffer *vb)
>> +{
>> +	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
>> +	struct vdec_t *vdec = inst->priv;
>> +	struct vdec_frame_store_t *new_slots = NULL;
>> +	dma_addr_t addr;
>> +	int i;
>> +
>> +	addr = vpu_get_vb_phy_addr(vb, 0);
>> +	for (i = 0; i < vdec->slot_count; i++) {
>> +		if (addr == vdec->slots[i].addr) {
>> +			if (vdec->slots[i].curr && vdec->slots[i].curr != vpu_buf) {
>> +				vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
>> +				vdec->slots[i].pend = vpu_buf;
>> +			} else {
>> +				vpu_set_buffer_state(vbuf, vdec->slots[i].state);
>> +			}
>> +			vpu_buf->fs_id = i;
>> +			return;
>> +		}
>> +	}
>> +
>> +	for (i = 0; i < vdec->slot_count; i++) {
>> +		if (!vdec->slots[i].addr) {
>> +			vdec->slots[i].addr = addr;
>> +			vpu_buf->fs_id = i;
>> +			return;
>> +		}
>> +	}
>> +
>> +	new_slots = vzalloc(sizeof(*vdec->slots) * vdec->slot_count * 2);
> 
> To avoid open coding arithmetics (see Documentation/process/deprecated.rst) you
> may be able to use flex_array_size(vdec, slots, vdec->slot_count * 2)

Thanks for the tip, I will fix this issue in v3 patch.

> 
>> +	if (!vdec->slots) {
>> +		dev_err(inst->dev, "fail to alloc frame store\n");
>> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_ERROR);
>> +		return;
>> +	}
>> +
>> +	memcpy(new_slots, vdec->slots, sizeof(*vdec->slots) * vdec->slot_count);
>> +	vfree(vdec->slots);
>> +	vdec->slots = new_slots;
>> +	vdec->slot_count *= 2;
>> +
>> +	vdec->slots[i].addr = addr;
>> +	vpu_buf->fs_id = i;
>> +}
>> +
>> +static void vdec_reset_frame_store(struct vpu_inst *inst)
>> +{
>> +	struct vdec_t *vdec = inst->priv;
>> +
>> +	if (!vdec->slots || !vdec->slot_count)
>> +		return;
>> +
>> +	vpu_trace(inst->dev, "inst[%d] reset slots\n", inst->id);
>> +	memset(vdec->slots, 0, sizeof(*vdec->slots) * vdec->slot_count);
> 
> 
> Same here, flex_array_size() would calculate the size for you.

Got it.

> 
>> +}
>> +
>>   static void vdec_handle_resolution_change(struct vpu_inst *inst)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> @@ -745,11 +813,11 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
>>   	struct vb2_v4l2_buffer *src_buf;
>>   	int ret = 0;
>>   
>> -	if (!info || info->id >= ARRAY_SIZE(vdec->slots))
>> +	if (!info || info->id >= vdec->slot_count)
>>   		return -EINVAL;
>>   
>>   	vpu_inst_lock(inst);
>> -	vpu_buf = vdec->slots[info->id];
>> +	vpu_buf = vdec->slots[info->id].curr;
>>   	if (!vpu_buf) {
>>   		dev_err(inst->dev, "[%d] decoded invalid frame[%d]\n", inst->id, info->id);
>>   		ret = -EINVAL;
>> @@ -770,11 +838,13 @@ static int vdec_frame_decoded(struct vpu_inst *inst, void *arg)
>>   	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED)
>>   		dev_info(inst->dev, "[%d] buf[%d] has been decoded\n", inst->id, info->id);
>>   	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_DECODED);
>> +	vdec->slots[info->id].state = VPU_BUF_STATE_DECODED;
>>   	vdec->decoded_frame_count++;
>>   	if (vdec->params.display_delay_enable) {
>>   		struct vpu_format *cur_fmt;
>>   
>>   		cur_fmt = vpu_get_format(inst, inst->cap_format.type);
>> +		vdec->slots[info->id].state = VPU_BUF_STATE_READY;
>>   		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_READY);
>>   		for (int i = 0; i < vbuf->vb2_buf.num_planes; i++)
>>   			vb2_set_plane_payload(&vbuf->vb2_buf,
>> @@ -797,11 +867,11 @@ static struct vpu_vb2_buffer *vdec_find_buffer(struct vpu_inst *inst, u32 luma)
>>   	struct vdec_t *vdec = inst->priv;
>>   	int i;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
>> -		if (!vdec->slots[i])
>> +	for (i = 0; i < vdec->slot_count; i++) {
>> +		if (!vdec->slots[i].curr)
>>   			continue;
>> -		if (luma == vdec->slots[i]->luma)
>> -			return vdec->slots[i];
>> +		if (luma == vdec->slots[i].addr)
>> +			return vdec->slots[i].curr;
>>   	}
>>   
>>   	return NULL;
>> @@ -835,11 +905,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
>>   
>>   	cur_fmt = vpu_get_format(inst, inst->cap_format.type);
>>   	vbuf = &vpu_buf->m2m_buf.vb;
>> -	if (vbuf->vb2_buf.index != frame->id)
>> -		dev_err(inst->dev, "[%d] buffer id(%d, %d) dismatch\n",
>> -			inst->id, vbuf->vb2_buf.index, frame->id);
>> +	if (vpu_buf->fs_id != frame->id)
>> +		dev_err(inst->dev, "[%d] buffer id(%d(%d), %d) dismatch\n",
>> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index, frame->id);
>>   
>> -	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_READY && vdec->params.display_delay_enable)
>> +	if (vdec->params.display_delay_enable)
>>   		return;
>>   
>>   	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_DECODED)
>> @@ -852,10 +922,11 @@ static void vdec_buf_done(struct vpu_inst *inst, struct vpu_frame_info *frame)
>>   	vbuf->sequence = vdec->sequence;
>>   	dev_dbg(inst->dev, "[%d][OUTPUT TS]%32lld\n", inst->id, vbuf->vb2_buf.timestamp);
>>   
>> -	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>>   	vpu_inst_lock(inst);
>> +	vdec->slots[vpu_buf->fs_id].state = VPU_BUF_STATE_READY;
>>   	vdec->display_frame_count++;
>>   	vpu_inst_unlock(inst);
>> +	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>>   	dev_dbg(inst->dev, "[%d] decoded : %d, display : %d, sequence : %d\n",
>>   		inst->id, vdec->decoded_frame_count, vdec->display_frame_count, vdec->sequence);
>>   }
>> @@ -1083,18 +1154,30 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
>>   	if (!vbuf)
>>   		return -EINVAL;
>>   
>> -	if (vdec->slots[vbuf->vb2_buf.index]) {
>> -		dev_err(inst->dev, "[%d] repeat alloc fs %d\n",
>> -			inst->id, vbuf->vb2_buf.index);
>> +	vpu_buf = to_vpu_vb2_buffer(vbuf);
>> +	if (vpu_buf->fs_id < 0 || vpu_buf->fs_id >= vdec->slot_count) {
>> +		dev_err(inst->dev, "invalid fs %d for v4l2 buffer %d\n",
>> +			vpu_buf->fs_id, vbuf->vb2_buf.index);
>>   		return -EINVAL;
>>   	}
>>   
>> +	if (vdec->slots[vpu_buf->fs_id].curr) {
>> +		if (vdec->slots[vpu_buf->fs_id].curr != vpu_buf) {
>> +			vpu_set_buffer_state(vbuf, VPU_BUF_STATE_CHANGED);
>> +			vdec->slots[vpu_buf->fs_id].pend = vpu_buf;
>> +		} else {
>> +			vpu_set_buffer_state(vbuf, vdec->slots[vpu_buf->fs_id].state);
>> +		}
>> +		dev_err(inst->dev, "[%d] repeat alloc fs %d (v4l2 index %d)\n",
>> +			inst->id, vpu_buf->fs_id, vbuf->vb2_buf.index);
>> +		return -EAGAIN;
>> +	}
>> +
>>   	dev_dbg(inst->dev, "[%d] state = %s, alloc fs %d, tag = 0x%x\n",
>>   		inst->id, vpu_codec_state_name(inst->state), vbuf->vb2_buf.index, vdec->seq_tag);
>> -	vpu_buf = to_vpu_vb2_buffer(vbuf);
>>   
>>   	memset(&info, 0, sizeof(info));
>> -	info.id = vbuf->vb2_buf.index;
>> +	info.id = vpu_buf->fs_id;
>>   	info.type = MEM_RES_FRAME;
>>   	info.tag = vdec->seq_tag;
>>   	info.luma_addr = vpu_get_vb_phy_addr(&vbuf->vb2_buf, 0);
>> @@ -1109,12 +1192,13 @@ static int vdec_response_frame(struct vpu_inst *inst, struct vb2_v4l2_buffer *vb
>>   	if (ret)
>>   		return ret;
>>   
>> -	vpu_buf->tag = info.tag;
>>   	vpu_buf->luma = info.luma_addr;
>>   	vpu_buf->chroma_u = info.chroma_addr;
>>   	vpu_buf->chroma_v = 0;
>>   	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_INUSE);
>> -	vdec->slots[info.id] = vpu_buf;
>> +	vdec->slots[info.id].tag = info.tag;
>> +	vdec->slots[info.id].curr = vpu_buf;
>> +	vdec->slots[info.id].state = VPU_BUF_STATE_INUSE;
>>   	vdec->req_frame_count--;
>>   
>>   	return 0;
>> @@ -1175,25 +1259,47 @@ static void vdec_recycle_buffer(struct vpu_inst *inst, struct vb2_v4l2_buffer *v
>>   	v4l2_m2m_buf_queue(inst->fh.m2m_ctx, vbuf);
>>   }
>>   
>> -static void vdec_clear_slots(struct vpu_inst *inst)
>> +static void vdec_release_curr_frame_store(struct vpu_inst *inst, u32 id)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>>   	struct vpu_vb2_buffer *vpu_buf;
>>   	struct vb2_v4l2_buffer *vbuf;
>> +
>> +	if (id >= vdec->slot_count)
>> +		return;
>> +	if (!vdec->slots[id].curr)
>> +		return;
>> +
>> +	vpu_buf = vdec->slots[id].curr;
>> +	vbuf = &vpu_buf->m2m_buf.vb;
>> +
>> +	vdec_response_fs_release(inst, id, vdec->slots[id].tag);
>> +	if (vpu_buf->fs_id == id) {
>> +		if (vpu_buf->state != VPU_BUF_STATE_READY)
>> +			vdec_recycle_buffer(inst, vbuf);
>> +		vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
>> +	}
>> +
>> +	vdec->slots[id].curr = NULL;
>> +	vdec->slots[id].state = VPU_BUF_STATE_IDLE;
>> +
>> +	if (vdec->slots[id].pend) {
>> +		vpu_set_buffer_state(&vdec->slots[id].pend->m2m_buf.vb, VPU_BUF_STATE_IDLE);
>> +		vdec->slots[id].pend = NULL;
>> +	}
>> +}
>> +
>> +static void vdec_clear_slots(struct vpu_inst *inst)
>> +{
>> +	struct vdec_t *vdec = inst->priv;
>>   	int i;
>>   
>> -	for (i = 0; i < ARRAY_SIZE(vdec->slots); i++) {
>> -		if (!vdec->slots[i])
>> +	for (i = 0; i < vdec->slot_count; i++) {
>> +		if (!vdec->slots[i].curr)
>>   			continue;
>>   
>> -		vpu_buf = vdec->slots[i];
>> -		vbuf = &vpu_buf->m2m_buf.vb;
>> -
>>   		vpu_trace(inst->dev, "clear slot %d\n", i);
>> -		vdec_response_fs_release(inst, i, vpu_buf->tag);
>> -		vdec_recycle_buffer(inst, vbuf);
>> -		vdec->slots[i]->state = VPU_BUF_STATE_IDLE;
>> -		vdec->slots[i] = NULL;
>> +		vdec_release_curr_frame_store(inst, i);
>>   	}
>>   }
>>   
>> @@ -1324,39 +1430,29 @@ static void vdec_event_req_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
>>   static void vdec_evnet_rel_fs(struct vpu_inst *inst, struct vpu_fs_info *fs)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> -	struct vpu_vb2_buffer *vpu_buf;
>> -	struct vb2_v4l2_buffer *vbuf;
>>   
>> -	if (!fs || fs->id >= ARRAY_SIZE(vdec->slots))
>> +	if (!fs || fs->id >= vdec->slot_count)
>>   		return;
>>   	if (fs->type != MEM_RES_FRAME)
>>   		return;
>>   
>> -	if (fs->id >= vpu_get_num_buffers(inst, inst->cap_format.type)) {
>> +	if (fs->id >= vdec->slot_count) {
>>   		dev_err(inst->dev, "[%d] invalid fs(%d) to release\n", inst->id, fs->id);
>>   		return;
>>   	}
>>   
>>   	vpu_inst_lock(inst);
>> -	vpu_buf = vdec->slots[fs->id];
>> -	vdec->slots[fs->id] = NULL;
>> -
>> -	if (!vpu_buf) {
>> +	if (!vdec->slots[fs->id].curr) {
>>   		dev_dbg(inst->dev, "[%d] fs[%d] has bee released\n", inst->id, fs->id);
>>   		goto exit;
>>   	}
>>   
>> -	vbuf = &vpu_buf->m2m_buf.vb;
>> -	if (vpu_get_buffer_state(vbuf) == VPU_BUF_STATE_DECODED) {
>> +	if (vdec->slots[fs->id].state == VPU_BUF_STATE_DECODED) {
>>   		dev_dbg(inst->dev, "[%d] frame skip\n", inst->id);
>>   		vdec->sequence++;
>>   	}
>>   
>> -	vdec_response_fs_release(inst, fs->id, vpu_buf->tag);
>> -	if (vpu_get_buffer_state(vbuf) != VPU_BUF_STATE_READY)
>> -		vdec_recycle_buffer(inst, vbuf);
>> -
>> -	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
>> +	vdec_release_curr_frame_store(inst, fs->id);
>>   	vpu_process_capture_buffer(inst);
>>   
>>   exit:
>> @@ -1552,6 +1648,11 @@ static void vdec_cleanup(struct vpu_inst *inst)
>>   		return;
>>   
>>   	vdec = inst->priv;
>> +	if (vdec) {
>> +		vfree(vdec->slots);
>> +		vdec->slots = NULL;
>> +		vdec->slot_count = 0;
>> +	}
>>   	vfree(vdec);
>>   	inst->priv = NULL;
>>   	vfree(inst);
>> @@ -1683,6 +1784,38 @@ static int vdec_stop_session(struct vpu_inst *inst, u32 type)
>>   	return 0;
>>   }
>>   
>> +static int vdec_get_slot_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
>> +{
>> +	struct vdec_t *vdec = inst->priv;
>> +	struct vpu_vb2_buffer *vpu_buf;
>> +	int num = -1;
>> +
>> +	vpu_inst_lock(inst);
>> +	if (i >= vdec->slot_count || !vdec->slots[i].addr)
>> +		goto exit;
>> +
>> +	vpu_buf = vdec->slots[i].curr;
>> +
>> +	num = scnprintf(str, size, "slot[%2d] :", i);
>> +	if (vpu_buf) {
>> +		num += scnprintf(str + num, size - num, " %2d",
>> +				 vpu_buf->m2m_buf.vb.vb2_buf.index);
>> +		num += scnprintf(str + num, size - num, "; state = %d", vdec->slots[i].state);
>> +	} else {
>> +		num += scnprintf(str + num, size - num, " -1");
>> +	}
>> +
>> +	if (vdec->slots[i].pend)
>> +		num += scnprintf(str + num, size - num, "; %d",
>> +				 vdec->slots[i].pend->m2m_buf.vb.vb2_buf.index);
>> +
>> +	num += scnprintf(str + num, size - num, "\n");
>> +exit:
>> +	vpu_inst_unlock(inst);
>> +
>> +	return num;
>> +}
>> +
>>   static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i)
>>   {
>>   	struct vdec_t *vdec = inst->priv;
>> @@ -1741,6 +1874,7 @@ static int vdec_get_debug_info(struct vpu_inst *inst, char *str, u32 size, u32 i
>>   				vdec->codec_info.vui_present);
>>   		break;
>>   	default:
>> +		num = vdec_get_slot_debug_info(inst, str, size, i - 10);
>>   		break;
>>   	}
>>   
>> @@ -1764,6 +1898,8 @@ static struct vpu_inst_ops vdec_inst_ops = {
>>   	.get_debug_info = vdec_get_debug_info,
>>   	.wait_prepare = vpu_inst_unlock,
>>   	.wait_finish = vpu_inst_lock,
>> +	.attach_frame_store = vdec_attach_frame_store,
>> +	.reset_frame_store = vdec_reset_frame_store,
>>   };
>>   
>>   static void vdec_init(struct file *file)
>> @@ -1804,6 +1940,14 @@ static int vdec_open(struct file *file)
>>   		return -ENOMEM;
>>   	}
>>   
>> +	vdec->slots = vzalloc(sizeof(*vdec->slots) * VDEC_SLOT_CNT_DFT);
>> +	if (!vdec->slots) {
>> +		vfree(vdec);
>> +		vfree(inst);
>> +		return -ENOMEM;
>> +	}
>> +	vdec->slot_count = VDEC_SLOT_CNT_DFT;
>> +
>>   	inst->ops = &vdec_inst_ops;
>>   	inst->formats = vdec_formats;
>>   	inst->type = VPU_CORE_TYPE_DEC;
>> diff --git a/drivers/media/platform/amphion/vpu.h b/drivers/media/platform/amphion/vpu.h
>> index 22f0da26ccec..76bfd6b26170 100644
>> --- a/drivers/media/platform/amphion/vpu.h
>> +++ b/drivers/media/platform/amphion/vpu.h
>> @@ -223,6 +223,8 @@ struct vpu_inst_ops {
>>   	int (*get_debug_info)(struct vpu_inst *inst, char *str, u32 size, u32 i);
>>   	void (*wait_prepare)(struct vpu_inst *inst);
>>   	void (*wait_finish)(struct vpu_inst *inst);
>> +	void (*attach_frame_store)(struct vpu_inst *inst, struct vb2_buffer *vb);
>> +	void (*reset_frame_store)(struct vpu_inst *inst);
>>   };
>>   
>>   struct vpu_inst {
>> @@ -296,7 +298,8 @@ enum {
>>   	VPU_BUF_STATE_DECODED,
>>   	VPU_BUF_STATE_READY,
>>   	VPU_BUF_STATE_SKIP,
>> -	VPU_BUF_STATE_ERROR
>> +	VPU_BUF_STATE_ERROR,
>> +	VPU_BUF_STATE_CHANGED
>>   };
>>   
>>   struct vpu_vb2_buffer {
>> @@ -305,8 +308,8 @@ struct vpu_vb2_buffer {
>>   	dma_addr_t chroma_u;
>>   	dma_addr_t chroma_v;
>>   	unsigned int state;
>> -	u32 tag;
>>   	u32 average_qp;
>> +	s32 fs_id;
>>   };
>>   
>>   void vpu_writel(struct vpu_dev *vpu, u32 reg, u32 val);
>> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
>> index 940e5bda5fa3..497ae4e8a229 100644
>> --- a/drivers/media/platform/amphion/vpu_dbg.c
>> +++ b/drivers/media/platform/amphion/vpu_dbg.c
>> @@ -48,6 +48,7 @@ static char *vpu_stat_name[] = {
>>   	[VPU_BUF_STATE_READY] = "ready",
>>   	[VPU_BUF_STATE_SKIP] = "skip",
>>   	[VPU_BUF_STATE_ERROR] = "error",
>> +	[VPU_BUF_STATE_CHANGED] = "changed",
>>   };
>>   
>>   static inline const char *to_vpu_stat_name(int state)
>> @@ -164,6 +165,7 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>>   	for (i = 0; i < vb2_get_num_buffers(vq); i++) {
>>   		struct vb2_buffer *vb;
>>   		struct vb2_v4l2_buffer *vbuf;
>> +		struct vpu_vb2_buffer *vpu_buf;
>>   
>>   		vb = vb2_get_buffer(vq, i);
>>   		if (!vb)
>> @@ -173,13 +175,24 @@ static int vpu_dbg_instance(struct seq_file *s, void *data)
>>   			continue;
>>   
>>   		vbuf = to_vb2_v4l2_buffer(vb);
>> +		vpu_buf = to_vpu_vb2_buffer(vbuf);
>>   
>>   		num = scnprintf(str, sizeof(str),
>> -				"capture[%2d] state = %10s, %8s\n",
>> +				"capture[%2d] state = %10s, %8s",
>>   				i, vb2_stat_name[vb->state],
>>   				to_vpu_stat_name(vpu_get_buffer_state(vbuf)));
>>   		if (seq_write(s, str, num))
>>   			return 0;
>> +
>> +		if (vpu_buf->fs_id >= 0) {
>> +			num = scnprintf(str, sizeof(str), "; fs %d", vpu_buf->fs_id);
>> +			if (seq_write(s, str, num))
>> +				return 0;
>> +		}
>> +
>> +		num = scnprintf(str, sizeof(str), "\n");
>> +		if (seq_write(s, str, num))
>> +			return 0;
>>   	}
>>   
>>   	num = scnprintf(str, sizeof(str), "sequence = %d\n", inst->sequence);
>> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
>> index 45707931bc4f..74668fa362e2 100644
>> --- a/drivers/media/platform/amphion/vpu_v4l2.c
>> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
>> @@ -501,14 +501,25 @@ static int vpu_vb2_queue_setup(struct vb2_queue *vq,
>>   		call_void_vop(inst, release);
>>   	}
>>   
>> +	if (V4L2_TYPE_IS_CAPTURE(vq->type))
>> +		call_void_vop(inst, reset_frame_store);
>> +
>>   	return 0;
>>   }
>>   
>>   static int vpu_vb2_buf_init(struct vb2_buffer *vb)
>>   {
>>   	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>> +	struct vpu_vb2_buffer *vpu_buf = to_vpu_vb2_buffer(vbuf);
>> +	struct vpu_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>   
>> +	vpu_buf->fs_id = -1;
>>   	vpu_set_buffer_state(vbuf, VPU_BUF_STATE_IDLE);
>> +
>> +	if (!inst->ops->attach_frame_store || V4L2_TYPE_IS_OUTPUT(vb->type))
>> +		return 0;
>> +
>> +	call_void_vop(inst, attach_frame_store, vb);
>>   	return 0;
>>   }
>>   
> 
> Just a general question, was the choice for a flexible array because the IP does
> not provide enough per-codec information to calculate the number of needed slots
> or to actually avoid needing to do per codec array sizing ?
> 
> Nicolas
> 

The decoder only requires the minimum number of frame buffers, it doesn't
constrain the maximum value. And the frame buffer is managed by fs_id,
so we make dma address of frame buffer have a one-to-one correspondence
with the fs_id. Here I use the slot index as the fs_id.

I guess I can give an example of why we use a flexible array.
For example, 20 v4l2 buffers are created, and 20 dma-bufs are queued,
they took 20 slots.
But after they are dequeued, the client enqueue another 20 dma-bufs via
the 20 v4l2 buffers. Then this results in a total of 40 slots.
We may not release the previous 20 slots as they are not released by the vpu
firmware.
This only happens in certain extreme cases, in most cases, we won't need
to enlarge the array.

The problem we have so far is that the client may maintain a dma-buffer 
pool,
the number of dma-bufs in the pool is indeterminate. Each time the
client get a dma-buf from the pool and qbuf() with a v4l2 buffer.
For the worst-case scenarios, we choose a flexible array to store the
frame buffers.

Thanks,
Ming


