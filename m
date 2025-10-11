Return-Path: <linux-media+bounces-44193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC18BCF22D
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 10:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 291484E6F71
	for <lists+linux-media@lfdr.de>; Sat, 11 Oct 2025 08:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C633238C36;
	Sat, 11 Oct 2025 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="IZtMcQP/"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4370810;
	Sat, 11 Oct 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760171253; cv=fail; b=YBaVmSfsMOVMMoCSgkcNxR+bmZ/3nCnMbwg3/j4HI0jGZUQScz50mKQUYy7aq7ZnkNPn5wzxNv9/EuztB9u1Q3bDo05+Ywq4efE2AS3cM+2lbgL8E148LIJfCHeqqrLXDpZdZKi4JMTU+nCJGcBUsXVmdc8vlHYzgMpyqs4paGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760171253; c=relaxed/simple;
	bh=7U/flBVjLBuW+L11/0H+7muUazunovrtB+a1TqANwuI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YIfrpk0s+XzSBeBI+fKeaS+JDplPbGoBhJzAbonez7TOH/+0JvpLY9AOlljjfm+RudbSXiLV/o3LZ7wc6lN2ZS3SHgPnT4trm4dKQ5Ad2l/+pNZ7F53sAwRgTfeJJsTyEsr1+eBnMEGhLsGGWmNSWaso6Me/qNuUjpI7JVaVEeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=IZtMcQP/; arc=fail smtp.client-ip=52.101.46.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6Lr+5Lr7hoOw7/tREEaOFk6SSS828nkYfewCocKLhjgk+2WinZwHLO66GiguGxkAovmfySl0wK6A5kvzR5e7T5U7AFMNMOtJgs+MWwjjNx1Kg/UFwJDRaD7F2by5gEnriTylkZA+MGIP+/9yLjzBWPWjiwHYdcyXluMpUeFTYqm/kfY/ICX8rej3N14Hv02UUfG7ixpLUBkQJFVK7h2exdx5Dlstum0aTYhV0Gk9Lkxe89RmejoBxWQh+X3T3lnaUrx+CxCIEgpjH8UY6ZM6Fa1lKKLAzL0cHZlhzEuXGFzUyFTtkNoPvr/blVdRDXnx9H6HLw23OyBrNOBFm1o6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iV8JMfckFlYMcADgkdCg0ZSUuAQEK9XrHgUht4z7B+0=;
 b=v2wKzXyj/IV+glp9IqWri/0a3Z8Gv94KKZgoAPvPrcDdCQoNGVH4hSD9QICUtdFD9Gb8cTnvsYHkApZILJSvFdVtS5o8LLD7nwVhj+OZEEbKbfSFfjvbCGwXTUaZ3VhdHkJVVHSKQdq5IyaMW4mtfqb8+D56kJeSxaw9LtxpeTVj6URxwLQlGwLFapfmm+2F1gOnF4pEQwD/hkM0n/QA+L9iqyjdnXFXDsXysi++toiU9XUW41ovuUd1nPxaLaGHeD5TTAujVVVD8D8f9f6FUR4HS6HdN7+RSoz91YmjDf4X36+mKsclGxeGaJpR7Wo0vMOUzwiMdnpNOA8oi8qyvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iV8JMfckFlYMcADgkdCg0ZSUuAQEK9XrHgUht4z7B+0=;
 b=IZtMcQP/FsE6eWp7yfSyE/R6uYjec/tWJXHH7djkWgMJ6tZDkWp4qDdBeusgImNXmCdCaTSp0+yaKK59V5T9XaEPwDo7QsGEJV2x4r2e+5B0qyEzespcKQ6IYZFeogmreXFFefOcqMTkVDBTd016GaNXJMrc4LlMdBo+D+zNs0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 08:27:25 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 08:27:24 +0000
Message-ID: <b433fb73-1652-4b12-8631-dd7059f72566@amd.com>
Date: Sat, 11 Oct 2025 16:27:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20250911100847.277408-1-Bin.Du@amd.com>
 <20250911100847.277408-5-Bin.Du@amd.com> <aNJK_tZe99_jWNdR@sultan-box>
 <c63a56cb-23d0-4c5a-8e1a-0dfe17ff1786@amd.com> <aNzXJaH_yGu1UrV2@sultan-box>
 <dbc92a53-a332-4e57-a37a-7a146b067fcd@amd.com> <aOoE3oPVeUuaElRl@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aOoE3oPVeUuaElRl@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:194::21) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d3e8a5-a9b6-496f-dbb1-08de08a00158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2dhbnNHQ2hUZnR6Q2hGU1ptLzZHOEFTZlVnVVVyRW9RWVF2OGE0WUt1Uklz?=
 =?utf-8?B?Y21SSEZKTm1NbTVpRUVvNzhUY3c5dTQvM1lnRUFjN09SQS9FTGxyTlVsdFZV?=
 =?utf-8?B?YnN5SEFadlp5eU83bU84eGZSSGJwaDJ0QkkyZ0E4KzI3YlQrVDFZeWlXZXkv?=
 =?utf-8?B?eG94dmhWSldwdlJBcmRPekNrTHFKWFB4cGx6WUpkU1dYSFJocFp3NEU4b3FO?=
 =?utf-8?B?TGh3OWV0d0M2ZWY0SUVhTk1rN3JRdWljMXFkNzV5T3hvYUI1ZmR5b1VWYi9t?=
 =?utf-8?B?SkVwbGluVWJseURLZU0rOVI0SkJnays1Rkc2SS9HdmdrWnZyTFJhVTJHTzl3?=
 =?utf-8?B?MXQwQWluSGpDVXlkUXpqQVBHL2RLaW13aWN3K3I4cDdoZWhyU0psU1dNQ0Fy?=
 =?utf-8?B?Q2VpNjRhaEkvZ2ZVcmhZZTNCSW5pMG9QUTV5NHl0QmQrRlZEd25qQ3NjUkpN?=
 =?utf-8?B?M0o2VGVrRFFFcDgvS3BTZVhPYkVOaWlhQmNva1pFclBGTm5FU2Q5b2R3cWxh?=
 =?utf-8?B?Ymw3aVBHM3lqZjR2VU5DeGt4ellMamdpS3k4L05TVW5aSWFVWndBZXJrK1Zz?=
 =?utf-8?B?M00wMmNwMnRMaENGeEE1K2IveC9VbVBqeVhDc1ZUbUREdEpKSlF0N01FdERR?=
 =?utf-8?B?RXVUSmVDeG9yVFF5b1o2eHpwcE9hQ1NqbmpPdHhSeHpFa1NXamdTY2RacjBT?=
 =?utf-8?B?S0dZMVUzdnR1YnBveER5ZzdoL0tFM3NCUUUvMHJXYlgrTkNlYjl0cFpPZFhs?=
 =?utf-8?B?WDdORlZOdkdkSXU5UzZ6Y1p0QnBmUmZkVS9XeUw0clFGcml5TVhRU2JRVXc2?=
 =?utf-8?B?bFBoZUV6M0l6RE5SaXp2MldmaFhaQWlyVThzWGY4SE5CRlZKcENzbFBObEY4?=
 =?utf-8?B?ekpGQWhvUUc4YkV3ZDZzK2FKWU5xcm1ORUtST1F2RDhlWitnUHlBeDZpVG85?=
 =?utf-8?B?UTNMUDhtd1VGU21NSS94YzYrR2RIMGZQQmdYTFBFOWJSNkxDdGtHZmMveUF4?=
 =?utf-8?B?T3lrUFpVaFc3ejlHNjRrMUYwUXo0NjRpU1NDejYzTlp2LzRoTldKcUZncGdv?=
 =?utf-8?B?QXBSbzVpa2ptamRZSWhPNWtiV3RQOC9HZFNTLzdGeVZoQW1INlNVQjFuRFkx?=
 =?utf-8?B?RWFjeXIvVVNFSXhhYk5KQkNkb2V6Z0xneWtpYmovZ2dYQUFLZDRiYnpKZFpK?=
 =?utf-8?B?b3hnRFY1bjFzQTJiaGljZVVEcWlQbEZ4WVIrcDJjRSttd1BWcjJtWmJqZEdq?=
 =?utf-8?B?SXlxYzc0WllsWGZjdEFldkpPcWRIOEhiTkE4b1A0dVdSS2NVM2M1UzRvU1hR?=
 =?utf-8?B?L2Jad0lWQU5mVEttYUpPYzhMN2kydlMzVHBwaEJ3UU5jQXNLeWJ3NlFudzVl?=
 =?utf-8?B?WFVXSzk2U2c3aTR4S3ArNWI1MjY3RVc1T2pRNFkyUE4xZ0NZeHRKdjFoNko2?=
 =?utf-8?B?RFZBMHFsdTFSeVBJMGJHRXpobVFvTVV4amxoRFBtKzdhb1dXejJ3QjQzejA3?=
 =?utf-8?B?QVk4VisvRTZLeERFMGc1ejRWTzg4RDFNMzNuSkdwaTRpUzJCSU00MTcyc1g1?=
 =?utf-8?B?ZVArNEdMMUFKaE0vamx2N1JSOEg0NkJZY0dkZkdac0RHa1loT0VUbEJKQnhq?=
 =?utf-8?B?WjVLOXg0SUEvbkJEU1RTQzdlTjRUczdLRUtLS2RvK0hPRm1TTGl1Q3Ezc0Va?=
 =?utf-8?B?K04vWmcyODljUzlJNUNzZGptTXMwYUhhc2o1RGFTOTh2MG5nY0VjeGViVGRV?=
 =?utf-8?B?QVZYUlBxQTAxZ0wxTGtsdzZrOFpRcU5HUUZXc2tTdlBudlg1NmRxOUNWWG9C?=
 =?utf-8?B?RTFsUUZqemVON1pNNG9aOWxIaGl2dUpPRXlyQzcwNzhzUzQrSXlxeDZMaGUv?=
 =?utf-8?B?TS9xOGZNSWlkUTlEVCsxNlBENkd6ZktEbDk0NDM2WVBsNWRYZjBoTGVLcnBz?=
 =?utf-8?Q?ejua47OtFCEvN0ZjxXd2D9IKy6NCPOMR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGtMWmtDSmZ2SzJsanV4ZkhuZUtQWU9MZUtXdTk3RzFTVU1jZ1RwcnIxRGQ0?=
 =?utf-8?B?WHBFRU5PSnpxZnpPK1pPTUcwaXIxSTNzcTJoZ2kvaXArRHE4UGJaVGdmT0Iw?=
 =?utf-8?B?YkZwbHVneVoxN3d6cTh6Qy81UFRrWVVFM1laQUdMamRDVndjK2s4ZGhGa3lq?=
 =?utf-8?B?RkFjaFhma2lpVXVkb3JJMGozN0xtOVpmckVXaGpZcFJxNGJEdGRFVDRGcnY3?=
 =?utf-8?B?cytDY0hCYVo3UmhhYTgyRmpUMGxLOEhUNUNlOWhIUHFoR0xETUpNS3p5aXpn?=
 =?utf-8?B?cWhERkduK3hKS0NQZ2lnWnNEQjE4dXF6Z2FacjV5TGFqWTdGNVF6Mmx5cTJ6?=
 =?utf-8?B?NUxmZzYyUTJ6VThvRDZQZDJqYzdXcFl2c3lIUWsxQVJmTytiY2hOMWtOTTY1?=
 =?utf-8?B?NnhYY3JSSkhSRStQZFJCZFVrQURBTXQyMElUOUJXWHVkNVlqUFdnVURLQXh3?=
 =?utf-8?B?V1pvakk5ZWJHd3ZDRTdoV0k5RlY5VnNkOFRDN1YrR1kzc2FSYkdoU2h2UXR0?=
 =?utf-8?B?Z0c2eUMxb2xuNmtTWksxdFkxckY1T3VGNE5SYlJ2bnFGQ25PRFhCV0JQMS93?=
 =?utf-8?B?YWswTHFnVFZYUWt2MXkxS1VhbGxkeGpWWTNYZmxGNk80YXAzYXJkRkxqRThI?=
 =?utf-8?B?cE9lZytBSmpQSG1qYnllaVNqeVBSTmlJaWhVcmJCd1p4SFZvQzVwaldFWXlp?=
 =?utf-8?B?UmxOYWc1bFhZS2IrSUVqb0t5UXpSZ01BTnZ3c3JWVDU4cUlrRHMwMGl6RXBT?=
 =?utf-8?B?c0h3MXpXMWdwcUxVTEsrNkluSnE2Vnk3NEFDUlBRMEg5enJ6bHovbDJYbDJh?=
 =?utf-8?B?K2wzcEVxTEFSbzExQ0V2dkFNaGRkNkR5SW50ZmdZSEZGS21xWnVXYjQxNWR2?=
 =?utf-8?B?bDhaZXNyZ3dkR294NnAwTVZCWklQeTZIektCbDNlQ0grU3dUUndoOVN5MDNY?=
 =?utf-8?B?Y0E2NjlRVlBUYlZqRHZVOWFSaGs2WVRJOE1vQXUzc0RUT1VuenNHQ2lsUDlp?=
 =?utf-8?B?dXp5WU9VOGRCa0tvMkREQnQvdlluTlBsd1VJK1NCU3M2NUdEeG1CT0psWnA3?=
 =?utf-8?B?VlREd0pTQVpPUzU0UGE4ZVZTVUIveUNEN2VKVEhuZHVRVUFiU3RlNzBTc3lC?=
 =?utf-8?B?d0IwY0hDNWd0SU1PUThVbG15b2ZyNHFCYXZ2aDdxekdXMnBHbmpsUkxNWGh4?=
 =?utf-8?B?UW9XTWN5YWtrV2hiQmlRVEZ3L2Q3K2NpVjNKQzNlejNFb3NGSElmVmtwUXI3?=
 =?utf-8?B?Znh5RmJ4QTgzTHhpbndNblBVS2d4cDREcnAzMWRGQVZwK2czNmFVekFkZTJ5?=
 =?utf-8?B?aG1wY2t5ajBtdDZoZ2lOcHFUQVRqVHZyZWRyYjdvN1FqeHJwcDVUVi9ZYU5i?=
 =?utf-8?B?ZjhTbTBmVGxla3hicWdtMGJ1dUdPSUZ1M3grUXNpRFUwQkJ4RmFkVEhiVXl2?=
 =?utf-8?B?UE5KbVNJOCtTSDBwT3RMN1loWmlLSFl1TmI2aytxakZUaUtJcVY0NCticVdZ?=
 =?utf-8?B?S1o4ZVg0QlJDQ1VVa1hiRVMyZzF3UnlRb2xzUHp4UUJmZkh1d21obmNIOWN3?=
 =?utf-8?B?L2g5Sm9MYnlJbUVvK2ZDUjBQeU5yNVg1UEtocitMcHVGOWRiYVJUMmhpVEVs?=
 =?utf-8?B?RWIyc1ZFMmFlVUZMVlhET2dlMVBtbDBYbmVxa21tKzZjWWlDV1lkWHpiV3lJ?=
 =?utf-8?B?eEV6VXliOUZ2Y25MK3JEdG9YRUNhWVhYWDdNaWg1R2hOVjFPUU1XeUpJTkRh?=
 =?utf-8?B?MU1SUnFtVWZ0eEVRUTlYY3IrK0xmYlZPSldlT0VKNTJoZDJWcUJ4TkEyRSto?=
 =?utf-8?B?QU5tTUoxTzNmQTFRV2x2cG5pTjJyczgwWFEvTEVPWE5KemQ3NzllS21RZ0Yr?=
 =?utf-8?B?NER5WnpHcytoVXdtd0VHRXVxYks4RVlMWVViMWdNOGF1T1ZRemh2S3V5d2xq?=
 =?utf-8?B?bnA4YXk5SmliODMzNkxaUjlxbDIyZEpGNUpkcUZ3T0ZZU2ZraFZtWXlvS3dr?=
 =?utf-8?B?Ym83VUh5THdzUmtSTW96NERac1FmTFNNY2dLT0JnT3E0cVdSSjRKK1JSTi8x?=
 =?utf-8?B?bStQSjc5aWhVNkswWkxNL09hM2I2bGN6WEQzbGl5OVVNMkc3aEJIUzc2WVoy?=
 =?utf-8?Q?Sq9E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d3e8a5-a9b6-496f-dbb1-08de08a00158
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2025 08:27:24.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTXLvk2cDve7bSpjMINJoO86HvjO+xX5zYAHWuZaiPm6CdFUPhlq/6S1uYtHzUa4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037

On 10/11/2025 3:18 PM, Sultan Alsawaf wrote:
> On Fri, Oct 10, 2025 at 06:25:48PM +0800, Du, Bin wrote:
>> Thanks, Sultan. sorry for the delayed response due to the long public
>> holiday here.
> 
> No worries, hope you had a good holiday. :)
> 

Thank you!

>> On 10/1/2025 3:24 PM, Sultan Alsawaf wrote:
>>> On Tue, Sep 30, 2025 at 03:30:49PM +0800, Du, Bin wrote:
>>>> On 9/23/2025 3:23 PM, Sultan Alsawaf wrote:
>>>>> On Thu, Sep 11, 2025 at 06:08:44PM +0800, Bin Du wrote:
>>>>>> +	u32 r1;
>>>>>> +
>>>>>> +	if (!isp_dev)
>>>>>> +		goto error_drv_data;
>>>>>> +
>>>>>> +	isp = &isp_dev->isp_sdev;
>>>>>> +	/* check ISP_SYS interrupts status */
>>>>>> +	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_SYS_INT0_STATUS);
>>>>>> +
>>>>>> +	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
>>>>>
>>>>> There are four IRQs (one for each stream) but any one of the IRQs can result in
>>>>> a notification for _all_ streams. Each IRQ should only do the work of its own
>>>>> stream.
>>>>>
>>>>> You can do this by passing devm_request_irq() a private pointer to indicate the
>>>>> mapping between a stream and its IRQ, so that isp4_irq_handler() can know which
>>>>> stream it should look at.
>>>>>
>>>>
>>>> Will do optimization to remove unused IRQs and keep only necessary ones
>>>> (reduce from 4 to 2), actually an IRQ won't result in notification to all
>>>> streams, please check the implementation of isp4_resp_interrupt_notify, it
>>>> will only wake up IRQ corresponding stream processing thread.
>>>
>>> What I mean is that the IRQ for one stream can wake a different stream if it is
>>> also ready at the same time according to the interrupt status register.
>>>
>>
>> Yes, you are correct, besides its own stream, the IRQ may wake a different
>> stream if it is ready too in the IRQ status register. But i believe the
>> shared irq handler can improve the performance without negative effects. The
>> peseudo code of isp4_irq_handler works like this (take your below example)
>> irqreturn_t isp4_irq_handler(...)
>> {
>> 	status = read_irq_status();
>> 	if(status & WPT9)
>> 		isp4_wake_up_resp_thread(isp, 1);
>> 	if(status & WPT10)
>> 		isp4_wake_up_resp_thread(isp, 2)
>>          ack_irq_status(status);
>> 	return IRQ_HANDLED;
>> }
>> Which means the first isp4_irq_handler can process all IRQs at that time.
>> For the second isp4_irq_handler, because the irq status is cleared by the
>> first isp4_irq_handler, it just does nothing and quit. So even if
>> isp4_irq_handler doen't know exactly which IRQ triggers it, there's no harm
>> as far as I can tell, not sure if I missed something.
> 
> My thinking was that it's possible for duplicate wakeups to occur when the
> stream IRQs are affined to different CPUs and they fire around the same time in
> parallel.
> 
> But now that I see how the ISP interrupts are actually GPU interrupts, it means
> that the stream IRQs will always be affined to the same CPU as each other.
> 
> So my concern does not apply here, and you should disregard it. :)
> 
> Sultan

Thanks for the further clarification.

-- 
Regards,
Bin


