Return-Path: <linux-media+bounces-56202-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAxaKImOumnSXgIAu9opvQ
	(envelope-from <linux-media+bounces-56202-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:37:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 073592BAED8
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 12:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ADC83113590
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 11:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F9B3C5544;
	Wed, 18 Mar 2026 11:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CNwc5bai"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102573939AF;
	Wed, 18 Mar 2026 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833551; cv=fail; b=oz43rKShGYbYKrQvJTk/SNFvHN4QgBY9sIEUsPRE0RypQTjb+pSwAnQbKxjXR3E5YBeLTi+thA+bSsdcaNVFVpTrzj7VGv/zRpdoA3YE6qLJqFMKCGPwSG/P/WolKxrAaTJ/3Tj262Fu0MxIFo+sBQMVDOoKUwSykzz4iLsshLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833551; c=relaxed/simple;
	bh=J5tnRs7GjvcAkyYdMOl8RRVS1g0euAGgvVCOf9SzAvA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cE9Akg017HV0YWZHzFTem1cYj1lRXmjkQFxN1DHcvR2CPpxwOtcC7PBCj5883LnaDHnOYpycEBdhzZsqO6y2K2rMATG4tj8jxKCNvTJPZEAAIULZ0knzIaSkKBpKD0fsqzh4TIICSPikpGc5GQYY3t77Bbh2Z5SlDgewuAaFSAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CNwc5bai; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHK4yygLPj4JI8Wo9KV+sabVcdejgCtqJpR2fteU0EPxOwrD0Sc/QK3E/MvmnCQv0zVdUKylPIBnBt9hHA8KMcjus1QEDK2DVFEh9SHpBLYtcIgK/La8RKN8BADw5dxeiqERn2lQGcY1Znysgz+RLb5V5+RgfzElZ+7SRETu89/hwTqwMB5IUg1AYECF2I2ZTq4XgSQywFNUEQ47+rX31i21iND3mgjeWj5wfPc4wHJ2smx+s/ZaTp7J/cLSY09EqrpS4Zc5W1gbXhUP+W4dDY2TtADNNEOE6yXIah8U7ys8lGcewCM5feIf++T51AtDgjT6Q+0SeFiRNck1afhTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnsQbj1CQ0N+iLn+iAKJK4kgRmYKEWJAWEGHydF4xvs=;
 b=sfqHSLKfnvpA27cNdR/nj3+o9NBkLR9LR960QUPuXgQCHNYxB7GG+MS4k7WzLU6yYTGHwmmBXBmQv9ZIFW63PGU2hNQ1Nz28kBpDfuYrJVQalEhkoReThu6hZN/Rs+tO36oFhRimHJaXI+lQ2abOFJUKfb+1npx7VdA3PEpJMi2OOjnruMDfMNsR+HZ62jf5JYLGTUCGxMXcRkUVV2ch7xhLgFFBxE0t98lJIJy2lyQRgAmy8sAFUfnfKt+NrOLnkorxkU8+Bp9f+uYfpJVHmkKjVFZFeeI1YnRzHXihy0Mkgy3cqRjNhNxDKb8LzG4C0Ok5iBgeNdwUxI5ZrvBLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnsQbj1CQ0N+iLn+iAKJK4kgRmYKEWJAWEGHydF4xvs=;
 b=CNwc5baiIZvZqDocVC7IS6zwXHJ3AB1+RSG+5D58rgKry9mJi0xChiKBNQRS9G8cq7K5osJu8J/l1YHCkC5wJy8Zuy0ZvYKAfKujsS6Jea3BuY3jwbUR36fQygPgutfYn8HoqZC66tXwhBMeJjWlgK5qzxZLFk/UaQ5ZstFY13g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13735.jpnprd01.prod.outlook.com (2603:1096:604:380::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Wed, 18 Mar
 2026 11:32:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 11:32:26 +0000
Message-ID: <e7f0599a-5a1b-4da4-867c-093b14e9b907@bp.renesas.com>
Date: Wed, 18 Mar 2026 12:32:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: renesas: vsp1: Move suspend/resume handling to
 LATE phase
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <02669d4630e04fe24c17dd2576ec8b27ded458f0.1765541401.git.tommaso.merciai.xr@bp.renesas.com>
 <20260317232349.GC408929@killaraus.ideasonboard.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20260317232349.GC408929@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0325.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13735:EE_
X-MS-Office365-Filtering-Correlation-Id: f32551cf-cc35-41ed-376f-08de84e207b1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 rNdBbojW7JiTz8WTjCcqAhAoCDcBBCkVgNvZYDLdnObkNCjbLCw+RG7l3XEkG307wBDFztEGTgcofOYUD1x6O120kV4OSDLit3iDbazRw8PkLew3R5Pg9G4H1DRd0SbYfwZqvXPZua6vdN2ceN6NKlnFPTvtWQY2A93CV86U2B0q+iFuyLpTLylJzD3Q3e0ElNs6mUAD+Jp/IsYER4mlpUjVOh8/JGmSGxaKXTIYcD1hcpooizTsz0tzOSb7BLc/pFca7Lf5BgRbXZNQtYKK8IoCOw8J4spgWn2gGMrHSRKqAPYIqTqL77V4V6qvk6KEe0YixnSe19qBibl8cPgaAgwcdlhC5n556Dy+borJnPReMOKkndVOFvRl+aRbsogvXCLvMv0iJ2QHVtfJzXlJyRvOMJySkzCtvzPaTE55G+9Zc/Gm0HiKvYQGMqk9qThzqf52Ye8cDZlmMy1+VUNJY1RbVQvHt4e8V3t2iSc0hgfVHCGK9eraSo+iO4njI8D3pNymEH0s1s6jl4XpG2+zXEMVikFgrc5TDfePzynXkBdfCdKzIBJAa6af488PtXPHOr8sqlATYDL7oPnhiPyB8XFGUEkJV5UuCLEEzdjmcPnUEcktD9AJY0jsFumrcG6x5gtiw3jH+V5sC5X1FtXMF5vnmbsSCJn5s1RDl+cYBhXO9yAPekWIWWl7XJYNHLZJ
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NXNhVFlmUHphekZqMkRWcitFM1RpLzRld0x4Z1ZTeUw3MnBkWXo5TDZvS3px?=
 =?utf-8?B?cEZIMnNuWDJMenVzR2FmNnRRRlBBT3lka2ZZU28rWVNFVGlwK1VnTktIRGZR?=
 =?utf-8?B?MGhxS2M1ZkhxN1FoN1d4NHlCclh6RTY2ci96andlNHVlajZiUnNOcHBSa1o1?=
 =?utf-8?B?c1JQYXB1TjZ2NXJlamgya2w3K3RRSStUYXVBazdrK1lyK3hnV2dubmxHOUYr?=
 =?utf-8?B?dC9kY3RwWmszRzl5empiUWJ6b3U0MWt2NzV4UnAvRklDWWxFaitaK0oxYkdL?=
 =?utf-8?B?ZUlrbW1PYmtBRGZDRDJPTS9wWFhSM1dHajBIcEgyU3BTRXhNVHNXWGt0a1hN?=
 =?utf-8?B?WHp2NGRPVVJXYTRqN1ZoMHR2YjNkTTdJNGdCK1Q1aU1VWFF2b1JrZEtVdzRJ?=
 =?utf-8?B?NkpYbmpmT2NlVVo5YVc2R1pveUNlMlVjZlRYVHFJeFNPSzR6MHlJT2plU2Nz?=
 =?utf-8?B?UTdFRndlK2lDUnJ6dXhmNDZudkNMTzdzLzNlSVltWFhyNGlZelhRVFdJTWtX?=
 =?utf-8?B?RlBDNTJCbzdXNHJiYnNpa1Vsa3ZvR1JDR2lWN2c3Q0N6WGhESkpaYlJ3amVR?=
 =?utf-8?B?anYyeVVQekE4SUJxcEZwSG9HeG03b2lhclRQRmlaMjkrZ041SGNGNzlPSkxJ?=
 =?utf-8?B?UWRYQUZCRHdQa1l3K0d5UlZteUQ5NVFqMUw3V01tc1A0VU5rakRJZlpNMXlw?=
 =?utf-8?B?UlhBTUdvM29oa1E4WWFJd0Zybm5sKyt5dmo0dWtvQW4vOHdOK1NtNkg5eWVP?=
 =?utf-8?B?YWF6aFBuUVpNcERoMWdmOHkyWmkyVmpBTXl3VXZka3lCVi94d1JsSURaaS9F?=
 =?utf-8?B?Znd1ZGZkV20wbGZPaE56NUhXZGpDUERORkEzS1NJb0lUVjk1Y3ZCN202blhl?=
 =?utf-8?B?ZWVDenNmVXAzSDRZTjFyY2F4QUdRVVJueFZKWldtblh2cUdQM2JDL2dmaktP?=
 =?utf-8?B?bGN6RXRGdWE2ckJ5cFUxZ050dzd1NlIrTTNFU1lOWHYvK1piQ0FUMzNobDJk?=
 =?utf-8?B?OFJNei9jMHhGdmsvVkloOFQyT0c5eTRkZDBqZ1VSZWxLQVdSY0NDVWQya25r?=
 =?utf-8?B?RW5yZUZMdkRhRitsODdpZkFNVmhaV3BzR29rSno3eEtqT2xNWmVQYzlqb1B0?=
 =?utf-8?B?cHRVV20xVXVNblVLdTZBZk9GRXNqQjlnbnd2UHZvVW9Bdy8xdlkzOUhBalBi?=
 =?utf-8?B?MUdTQ3REYXI1MHZGYVAzdlZ3K0FZQkc4b2pHNGE1Skp5WFZNRy9IcGxmeE1j?=
 =?utf-8?B?WUIxek9wa2Q4OEtna2NtQXU0U0NSYUVhaHVTWVRNby81RmxaOVE4UDNxMlZh?=
 =?utf-8?B?RzlFOVlUVU1IZkJqelZEbm0xNnRQbkRTb1N2bUduTU5YSUtqOTFuUVZBcWt0?=
 =?utf-8?B?MmhtQkpUU2F0ODN3QWQxdlhZM3lMSG16ZzZ0aElrbEhoYXE2L01IV2FpOExP?=
 =?utf-8?B?TTk2eW9yQlJVR0lJaHJYZytiSlZxSXFOeE8wT2daSXZsQTZ3MTBwblh0OXZU?=
 =?utf-8?B?ci9CSHpxejRVS2luckQ3Mk1XRFkrWVAzV0NQTGNFNGJOeVhvL2QydW1QR1pP?=
 =?utf-8?B?SUhTb2Uza2p5QlNva3FnMW5CdVZBaFJYWnJXMTNXZXpmamUxRzJtSURJbVFP?=
 =?utf-8?B?Um05SDdyY3ZJUU9MaWdCTXQySXJQenh5S0p2RWNxQmZuVUVreWt2L2Z5SUxT?=
 =?utf-8?B?cEJKby82MkJDRU9NRncyL05iM1I5RTkyT1NyazVMMHRENS9PSmpFa0ZBd3JW?=
 =?utf-8?B?QlNqeVN1eUlyZHRzcnNRT3pKdmFOdk44UTRSWFZIdHR2L2lObnB1TXNwL1cv?=
 =?utf-8?B?VndONlp1TWlNbUtsUUtHM1lia0dndmdoVGNzUjFKRldQczJFTzlGeU90SnRM?=
 =?utf-8?B?dUM2cFFmNDJYNkN0WlNlV2RUMVpWSFpaS2RvZXN1Uk1QSkpiSW0wTWlFSjF4?=
 =?utf-8?B?MVRHdElEU2xMeE9kYzRrQlNrdlNaWFNJdk5vRE9NQXk0TG5kemVRQlJoZlBk?=
 =?utf-8?B?a05NcnZIK3dOSmZ3dHZFM3NwbXNwMWNRQ3d6MitRMXpWa2svaEs5ZURhNnJs?=
 =?utf-8?B?Ylg4SzBPUHZJelVjU0dubGpMWkJka0YzckxvOG5mZ0piR0tsam8xZkFyKzJD?=
 =?utf-8?B?K1ppVDRMaWhpV2hXV0lDOWVjd1Vlbk1KaklmOEJ3eVYzSkV3RmRoUWc4d2pR?=
 =?utf-8?B?ZW1teEdVU0pONWJvNlQyamNyNHJCc0pDS081dk1wWnZFYWRueTRkVDBRU1Q3?=
 =?utf-8?B?Mm5qcVpHNnN3elZpNklxZUFob2NmeU9yV2dUbk5QV3J6QnRlbkdjeXJ6eTdP?=
 =?utf-8?B?UGtmelRSZ0hKRGxXWFM3SG9EZjlJbUtUVmhVbi94Y0FSWDhkWVBWcXhoK0ps?=
 =?utf-8?Q?sB3g7oHWF4D5yLCKQRw0b+KGR0cR2OAYcOd32?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32551cf-cc35-41ed-376f-08de84e207b1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:32:26.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49c3ReeruVAWkMu/fj2ptx+i9f/fSvbcKCmHzksa4i7FZ7q8L6eDDD8bT3XBOKqzCKV4JjLl93NoZySEAFM8bbbxFS9b/+XVWd9hvrD+atguR6KtEO/keVF2MzNut16a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13735
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,ideasonboard.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56202-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 073592BAED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,
Thanks for your review.

On 3/18/26 00:23, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> Thank you for the patch.
> 
> On Fri, Dec 12, 2025 at 01:11:50PM +0100, Tommaso Merciai wrote:
>> Switch the VSP1 driver's dev_pm_ops to LATE_SYSTEM_SLEEP_PM_OPS to ensure
>> that suspend and resume callbacks are executed after DSI/DU suspend and
>> before DSI/DU resume.
> 
> Have you considered handling this through device links ? Using late
> system sleep is a hack that doesn't scale when more than two devices are
> involved.
> 
> I've just written and posted [1] to address the issue in the rcar-du
> driver (the suspend/resume ordering was right, but apparently only by
> chance), it should be easy to replicate it in the rz-du driver..
> 
> [1] https://lore.kernel.org/dri-devel/20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com/T/#u
> 
>> This prevents timeouts and vblank wait errors during
>> system resume, such as:
>>
>> [drm] *ERROR* flip_done timed out [CRTC:43:crtc-0] vblank wait timed out
>>
>> This addresses display commit and vblank timeouts seen with DRM atomic
>> helpers during s2ram.

Thanks for sharing I've replicated [0] on rzg2l_du_vsp driver.
I've tested that on RZ/G3E, s2ram and s2idle works fine.

[0] 
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260317231930.595719-2-laurent.pinchart+renesas@ideasonboard.com/

I'll provide feedback on the series.
Thanks for your work! :)

Kind Regards,
Tommaso

>>
>> Co-developed-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>> ---
>>   drivers/media/platform/renesas/vsp1/vsp1_drv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> index 2de515c497eb..0fbd27df1f46 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> @@ -693,7 +693,7 @@ static int vsp1_pm_runtime_resume(struct device *dev)
>>   }
>>   
>>   static const struct dev_pm_ops vsp1_pm_ops = {
>> -	SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
>> +	LATE_SYSTEM_SLEEP_PM_OPS(vsp1_pm_suspend, vsp1_pm_resume)
>>   	RUNTIME_PM_OPS(vsp1_pm_runtime_suspend, vsp1_pm_runtime_resume, NULL)
>>   };
>>   
> 


