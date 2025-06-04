Return-Path: <linux-media+bounces-34081-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EAACE73D
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 01:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82FD81897726
	for <lists+linux-media@lfdr.de>; Wed,  4 Jun 2025 23:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853F92741D5;
	Wed,  4 Jun 2025 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b="c4A5d3fD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-0063e101.pphosted.com (mx08-0063e101.pphosted.com [185.183.31.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6BB6F073;
	Wed,  4 Jun 2025 23:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.31.155
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749080327; cv=fail; b=ACj48+tws5ltMjYaiSxL1ksUtVdpQFJjYzYWyx2rrVc8qrobvzRmuIHHoTbSs9JgKlATa94J3YJvs2fuBk6btmaeK/O81o977A1EkGXnLvlj7q3hqHFJArFrNm1RjKn/4aK3LTZpvIVT5NiyDi96QidwabIpRF45D71pgCS/FPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749080327; c=relaxed/simple;
	bh=7uslHUMzE4kLdMN75OTXMv0yQl4+5eM1MboNQS9F82Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O0zNQjDUL2Re8DvyQg/OQOvjkVmmfHlwVysEsDZGJN7yyVpcvtwJQuQDnnIqnALif4JtRjbyNS+syiapzGcpZ0J83vm4Sp+ucPjcWsw4PilaiTmo57tarPhagarEAN4akyZGq947VYfQ5ylN7VAqiV3a4bR8qCHCtVBUVMhdph4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com; spf=pass smtp.mailfrom=blaize.com; dkim=pass (1024-bit key) header.d=BLAIZE.COM header.i=@BLAIZE.COM header.b=c4A5d3fD; arc=fail smtp.client-ip=185.183.31.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=blaize.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blaize.com
Received: from pps.filterd (m0247494.ppops.net [127.0.0.1])
	by mx08-0063e101.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554NA2Nr029593;
	Thu, 5 Jun 2025 00:14:17 +0100
Received: from pnzpr01cu001.outbound.protection.outlook.com (mail-centralindiaazon11021098.outbound.protection.outlook.com [40.107.51.98])
	by mx08-0063e101.pphosted.com (PPS) with ESMTPS id 471g878xwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Jun 2025 00:14:17 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjqmVqNY39dBER/WNGkWuqmm0ddSdHkyVxjeU2hEYDOmkTphgGpmHAWzqSpZkLjVAodGlk4CXN7R+HJjxdr/gGApAx9W/weRkD3rj1TlOVzd39LCVbwTlB73N+fiTMY+QWFediU7tESOFTLiov+7+H3ZM5eQz15XqrZNBU+Fe/VVkokkHSorM/dNH6i9X1M5aL/SuR/92FSRqr4XQyBjO7OW60dVsnyGcTFhih3mVBLNkcloHmYaR+iHlqmgUFczi9KGHE/RB5NOUC6fUbUU6dlYu2gfvSHOJlcikvvDwxn0FJ6cEh8TZshou0PhPhhNL99ZrXQ0wptcxkCzcthEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIv/tUbgIhG8wWGiy8YYT26hoHorgs7j2JSu4oCUK3M=;
 b=YvGKaYIlf43b8VOPnybLWeDISuL8t53kPpTNcpsPeWc9o9meamDIbdkd5YuyivfjDdZTW85A/fdw+rw9tJnSFQclLEFOhrRtyC+N8jcwb6fA2b5Og+qT6upoEg2QdnXbfcyaEp2wDxMIYALvYYOfavp+pr3zrAoP17+VmAQ3MPvzivpQ+W0R+psZUhX4Ub8hSeEnSwWnPSb/Wu7sBFF8al0/4UDyknKNEsbr2ye+HXlNbe2iblXlVVnN8HLWcVB3+sflUcmpBcSu7hv2C0woymXXpUXlubxiqdyNJu+005QvfUv7h3rqsPCNEMhKAIJTlJC8VJlzRhhoFNNcu8LlBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blaize.com; dmarc=pass action=none header.from=blaize.com;
 dkim=pass header.d=blaize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=BLAIZE.COM;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIv/tUbgIhG8wWGiy8YYT26hoHorgs7j2JSu4oCUK3M=;
 b=c4A5d3fD+Bwy8PGxkKIjycu7ZiD7LUmFjedNQ39WFC3TeRH57LOOWHryYW0TUdfyncfBDsbsSrGV4uvF6cLNs3N7H/lzfcl6unGq9iMHnmuObnASvoMJSUU/wybR1wwP05bgYw8GVvBP8piwavk8kEhke3Ph8R4j+A2WY7OkFuo=
Received: from PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::18c) by PN2PPF51D96C9B0.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::595) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 4 Jun
 2025 23:14:11 +0000
Received: from PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9f58:e643:db9:bf05]) by PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::9f58:e643:db9:bf05%5]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 23:14:11 +0000
Message-ID: <c31d9556-7ace-432d-b50e-df566900f535@blaize.com>
Date: Thu, 5 Jun 2025 00:14:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-ctrls: Fix H264 SEPARATE_COLOUR_PLANE check
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil
 <hverkuil@xs4all.nl>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604143552.2955475-1-james.cowgill@blaize.com>
 <254309f1c527d782e0c50c425602c94683f395b6.camel@ndufresne.ca>
Content-Language: en-US
From: James Cowgill <james.cowgill@blaize.com>
In-Reply-To: <254309f1c527d782e0c50c425602c94683f395b6.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0408.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::17) To PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04:1::18c)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPF1CBE88495:EE_|PN2PPF51D96C9B0:EE_
X-MS-Office365-Filtering-Correlation-Id: e2311a91-5174-4848-62dd-08dda3bd83f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFhMSzQ2akU3K0FYM0JLb0llZmNrTHRWc3RqTksvSEJNb3NjUGt0TXg1S2NM?=
 =?utf-8?B?M25OWXgxY0YzeXdDeUtKQWZkaTNzTTh1REVqZVBkejZXaHlxQUo5VG5GR000?=
 =?utf-8?B?aGxlam5GeUp1WC9hbzNhRVk1S2tqcDlKdHRpS1BpTXAxeHc3RVdhK2tNL2tk?=
 =?utf-8?B?djBmYTU1T1dVK0x6clVIMzhaK081NTkxaDNqMUNSb25sUklBZVVmRHZleU5y?=
 =?utf-8?B?YXJFL2NmOElZRHlGYmFCZGFzbzIzZEIxTHlPRjhNMy9Vc2MxQWRyZ2VpWm1t?=
 =?utf-8?B?UklGOWFoS1JKaTZGL1B2cWdqRmdueW1nTkhtczQ3cDMvMEZSb3FCUjg4Z3hp?=
 =?utf-8?B?OThpZG9pdDZuaDF0d0FldjRUL3RvNDJRbE1aTFFVSDJyejJ5QVJjU3dzQTI0?=
 =?utf-8?B?NXRmU1JwMXB3Q1FpN1g2Uk1pbThJV3BDaDd3Q1dod2Y1K1FxWEFsUS83RWZl?=
 =?utf-8?B?U3pVcFpCRkRWTWlGL3lKZVc2WE9aaVBmUUQrdk1Ea3FaSndkdnR3QW45MnFs?=
 =?utf-8?B?MHczTmplK3pTdG1qT0UrUTlPSllaQllqK085SlhhVlBFMFYveVozcFhuRDFw?=
 =?utf-8?B?QnYxcmY3UTQyU0VSeTNnUjhzcnBXcWdJeFV5Y1hFYWJKUUl6UHRpWG9CNWVt?=
 =?utf-8?B?ZnUzWFc1RXRRZ1lUdG95MGFtNGNYaCtmYzU1NDJDRUhqNGdHZzhuMFNTdXkv?=
 =?utf-8?B?aFRIc3U1VDhrS0t0TVlmYVo4U3BVd28zSkpTWE10TmlWUVNKS1dSQ3dZSEU2?=
 =?utf-8?B?cXpod3lUQVpMZnJYY2hRWWQzQkJJRnU5eG1zcVdNMFd5V3dqbE12QUFqZkl2?=
 =?utf-8?B?ZDlCNG5HcjhxNXhCTkh6Ry9qUFJCNm12czM5WkxEVnkrSGlHcmxvdFJrengw?=
 =?utf-8?B?bnpqUWF0OWl6dEF6L256YzlXWE9RTGR6NFdRd1FsUlJvQ1FqUkJDY1BXNXho?=
 =?utf-8?B?eU9tY3dWUUFLR3R5T0J5QzNQbnQrRWMxamYxc3lSKzNGUkh2YVQrYXZIdElq?=
 =?utf-8?B?SjUxZ1JZVzNoNHEwWVZiVXNPS1VrWmc2R3dKMmpHM2VqK2IxK0VnUUhyVXdx?=
 =?utf-8?B?a0NPSnJrN09BMnlCZUZZRHo4N3BJL0NjQ1dRU015OEZ3d3ZSRVBNemNxRWxp?=
 =?utf-8?B?K3gyVS9HckhnQjJ1TVRtTDVxUlVWNHFsUTdjNGdscW5BTW5HZjhqcXdiODlZ?=
 =?utf-8?B?MWFCQ1dSb21abE13NHhXN1RSSXFHNERiUlN3dStMWUFjMTRZbnhkLzhkcjN2?=
 =?utf-8?B?dUtoZkpXdEpKanp0OTBCUFgzSDA3YUtmN1dudTVsWTRTOGFrZytINUQ5RlR1?=
 =?utf-8?B?ZytDbWZpbkRselNCanMxcnBYODdTaG5jaVpKOHFDQVlEeGovU1c5YzBpQUVa?=
 =?utf-8?B?dHM2Y1kyeHVaZ09VM245ajlkMU9jTXJHZWxGeXhaeFhxaU1HWFJUa1daQ1JR?=
 =?utf-8?B?YUt2aGlkVWVBT2dGcEZZYktlblRLNGJUbkUvOW15cVdCMU8yTDgwYkw0T3hF?=
 =?utf-8?B?T1NYcHlYRFpDcDF3VEVVdTc1c2JBU3R4N0d1cURDb21wSFdmNlVoZ29Oa1h2?=
 =?utf-8?B?K01YNHF0QktPOFQyRGNCZDhyait3MllHWU44UkxsR2tCc01EOWsxaXhyZXQv?=
 =?utf-8?B?blRKdFUwQ0NjNDFQUnljeVdHMFllSVFjUndYWU9RRkFSNmt1dzNwQkJkN2w5?=
 =?utf-8?B?TEk1SG9SZjhPbHIyeUk3bTR6Z1B2UXNYYU9SMCtyenpkZlJIWWZJWmJTOFZC?=
 =?utf-8?B?a3FySWZzYVBoQnY3ZXN6M3JzZzd4ZWRIN2ZuK0p5VUZwUHRUVTUyNWhmOFpC?=
 =?utf-8?B?aDJzYm9TRFlLVXRFVTBGM1Fidk9KZncwRVFaL2U2Qm5kYnh1SzBWdml4M3h5?=
 =?utf-8?B?aWxqRnVNVzZOcHJQWGNLQW1DTFZBSHoyYUN2NExGOHZFdjNjQkVtcEJpeEcy?=
 =?utf-8?Q?KUdJOPEeGs8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmthM2pxVGZoQklJNGFybVVqb2FUdThmbDJCZDY0aWRXQUJoZ3c5V01SSndx?=
 =?utf-8?B?dGY3OGpUZjgyS3ltd1VUbWtDNTY5MUxYV09lcStLQ3NSY1VOOUx4c2xSUno1?=
 =?utf-8?B?VDdBR1ZNc3daZldoR3B0ZjM2bnBDakFzRzIwZmhlVVI0bHQ5UkZoSzVPcUJT?=
 =?utf-8?B?dTFHY2xYVUN0SVg3eStET3VDTlQrRVdzTFNNcUE3NC9UN2NYc21LK1VpQVM0?=
 =?utf-8?B?cGJxZlhhdm9vRFVRMjZ6WExoVmN2eUM3Q3NnZFg4cWZhUUJKMVJmNE11NTdR?=
 =?utf-8?B?NGtjV0oyNWhTdlZ3UTdwa2dtZXJqUENkY0VXbnp6ZW8vTDNRbkFFRy90bHlp?=
 =?utf-8?B?bU5EaHl3NTFUQStjWWJtaWVZU3J4aFIrMGpwRjY4bkkwanlEQytQTGo4ME5a?=
 =?utf-8?B?UTQ0a2dOeE44MjNTTlFrOVhJU1h2UU1tNzVYTkd1bTlLbGFEWXFNci9BaEFk?=
 =?utf-8?B?SW9nVUZHOUFrWk5TeTZGWFRQbFN2RVV4SzArKzJJVTRpSFZWT2M2UVdaU25v?=
 =?utf-8?B?REthY25EbWM2ZEdyMkhyY3dRY2RTRWZVY3ZtS3lpVnIvMmxQVVg3blhESHln?=
 =?utf-8?B?Qmg2Z3NvNW9IaUM0TGk5NDZYU3l6aXdzc2F2UlJRRWFwVUFaOE5FRzg3aXhQ?=
 =?utf-8?B?MnhoVnhReGVua1N6VXpCeXo0SzI1clhPWjhodUsybTFrcElBUXlrRTN3cFFQ?=
 =?utf-8?B?UFRjMTh2Y0oyV2JrcWxpL2hIOU5nN0hMZkJFdnNDUHVJR09qRmZZRVEycHR1?=
 =?utf-8?B?RW0yS1BBYk5aZDBRUVBSN1o2eGxEanFtNEFPTlhpd3JjVlJ6bW5BcU0veEhC?=
 =?utf-8?B?UHJpYmYveGFiRndyRWJTd0ZGSUl3OXM1M1VqS2NCM3hiVGJTWTRMVGlXcW5w?=
 =?utf-8?B?R0JNWDE1aFdZdmZCQjBvQ0k1R1djNFluMEpTVWRtV0x3TE5Gd2hkQkoxbzEz?=
 =?utf-8?B?VjhyNjAvbXNkdDJ0R2I3K2ZHSzE1amRFTHlhTXNYS3llbUZUY1FiOWdYZXBX?=
 =?utf-8?B?dGJWQ2U2N05UVjJHbFdjdFBtK0RYVmF3RmIrWndoZDJFT0pFSGlaUkxybDJ5?=
 =?utf-8?B?Ukx1Z0dIeS9PWU5rOVNsRlp0K29SblFFOXFUKzNLdkFNV3VwQTJoUE0vOGZl?=
 =?utf-8?B?Z0lqZm5wc0ZleTBFV2xWYXZWeHoycHlVWXRrbTl6SFEzbjhjYXNQT0FoMm9z?=
 =?utf-8?B?YWJUaHJLdEtYbWZ3SitySUlrdXRpckxhQTg4anlGc212S2lNRkM2ZHpGN2tz?=
 =?utf-8?B?bzFKQVUrakIzSW1ocGdUUjFWeStKelhXSXJwQUhONVV4QUw1NmxWOGVJK1hq?=
 =?utf-8?B?UmF6WGNQUTRYalNxVmw0QTlvaDl2eThsVGZ5RlRNSTRoVXA1cWt4RnJCSGNU?=
 =?utf-8?B?YUxtd2hqc1Z2MFhBak9UWG5QejJhR1Q3dE5ObXA1N2syTFJSN3VyQi9PUzRK?=
 =?utf-8?B?WXFyNTFlRjQ5YmpCSGkrWXh1OWN0YVdTNHdtT3p0Q1g3WU1PNERHcjNtK0dk?=
 =?utf-8?B?dmF0NmtVbzdPRDVtQzh1TTEyNGVCcjZLcFppcmlWMjJ4RXhzYUFYTWtPK2gv?=
 =?utf-8?B?Ujl0UVJCZDVUaGxuM01td1BxU01WeEk2eTdaSHdsc3picVNpWnlQNUtCZGxv?=
 =?utf-8?B?ejdqYXpwblk5czRjV0c1WmM3cUc5MDQ2enBidzk2VEZNdVZyQ1NHU295OWo3?=
 =?utf-8?B?OHBzMW5IQ3RyZzBtaWUzVW1QZVNRcnNvMW85bklheEJxNVVqaFEzWVVYMklC?=
 =?utf-8?B?bThrRHhkblI5VXdmaWtxNDhUZm1LMDBmQnlEWmV6K0plemNPYXVxcDBPdFBO?=
 =?utf-8?B?RWFveWloUnZ5MGsyY01vcHRyeXRRZmRZcDNyUXFSWUpVNyt2VHVJNDZHaWd2?=
 =?utf-8?B?YnRLditzM0tKMkdGbitwUmhmU3NpdEluVWxzZjA2Vy9sWEplWkRDRTBMQjV1?=
 =?utf-8?B?REVsME1pc2w1TTFYWFFPZ0lEUXh1RjRyV0J6N0JmbnA3VDBiT3Y4RXB5QXZh?=
 =?utf-8?B?aHZJQmRJSG1qZ1picmJpU1ArNlMxYVRTbEJUb2lSSmtkTU9OSmZvRXRJeSt0?=
 =?utf-8?B?Rm1Kd094V2RNYmR2TlFEL0JZUkIwdzBDSW5na1cxb09LNEFnRnh5eEF2Q3lu?=
 =?utf-8?B?TjBjaXZFak05anVtd2pNT2tpdjVweU9WNUlGZUxlajV1dG00cU5GYTNNTXVr?=
 =?utf-8?B?RGc9PQ==?=
X-OriginatorOrg: blaize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2311a91-5174-4848-62dd-08dda3bd83f5
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF1CBE88495.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:14:11.5525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wTiZ1YEt27+CHVAFvdYFy2yZPW16ObkJw4cLZYSwbbhveOIR5hP/aMFjvFW6wbziuiGuQpXI9ee7gnpvgZKIIIj1F8+2IlRHEKQnEZ2/jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF51D96C9B0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE5MyBTYWx0ZWRfX8CsRKiD8DAbh BNhxweezOABOK4296Vn4NQ5DTqrGNW944+FN93f0a+sATzjIXzyOSiYNNjXov1ZoHSi+4Hpuuz2 ggXpHgXmWbBvYrE6uTz+HCNnwZBbllbuLiEJWgMdMUcZdT3+hM5YrExbYH+vGmoerfQFEj4AItN
 +k4a4xIlAU6I1VNW9RgmyjaUUDSVHM50zh8Kv6pF79rx++JBNsTSWPUJ/BCZxdiEQGuiLSEvar6 8NGiHwMKv0Ntk4HQ/QhaiDuzFZ607kJyk1Qh64/g3oNSYlRvyv6jwe8LQQDAAb0eh3QF7JaQilP oF+4+grsZctw4SRDq0t6Abx2xpYzR+vXiRv6enBVVrlycS5K5E760tHOszYx1UksLC/XPEP4ERS
 B1AUqzmh0s34t4qOYfXzKQXwJ4pdtsOPY13v+L0MtA3ew1h37SuAy/tw1RDLCz8/571kWF1A
X-Proofpoint-GUID: tsnlw00dNHeDDxleY6IyP2-nvHIvMV0t
X-Authority-Analysis: v=2.4 cv=T/GMT+KQ c=1 sm=1 tr=0 ts=6840d349 cx=c_pps a=JIax31N6zdZwrNNW4sZSnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-5LYVjoNHPMA:10 a=qMsUxAKnpNKJFhcHM7YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tsnlw00dNHeDDxleY6IyP2-nvHIvMV0t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Reason: orgsafe

Hi Nicolas,

On 04/06/2025 16:35, Nicolas Dufresne wrote:
> Le mercredi 04 juin 2025 à 14:38 +0000, James Cowgill a écrit :
>> The `separate_colour_plane_flag` element is only present in the SPS if
>> `chroma_format_idc == 3`, so the corresponding flag should be disabled
>> whenever that is not the case and not just on profiles where
>> `chroma_format_idc` is not present.
> 
> 
> The fix seems correct indeed. This has no incidence on any current driver, since
> there is nothing upstream that supports decoding 4:4:4. Would you mind if we
> extend the commit with something such as:
> 
> 	This prevents invalid flags being passed, though no upstream drivers
> 	currently supports YCbCr 4:4:4 decoding.
> 
> Feel free to to suggest a better edit. It will make stable people (and bot) aware
> of the patch priority. I can make the edit while applying.

That wording seems fine to me.

And yes this patch was just based on me reading the code - it doesn't
fix any actual breakage (at least for now).

Thanks,
James

