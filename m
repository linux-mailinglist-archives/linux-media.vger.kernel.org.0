Return-Path: <linux-media+bounces-15448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3929F93F46A
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEB941F22CFB
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98DC145B22;
	Mon, 29 Jul 2024 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="S29qpKTA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2125.outbound.protection.outlook.com [40.107.105.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A1817
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722253623; cv=fail; b=ZiJutkbPZklqjQ1Rd0Hma8RlbYbfJ8n21VZJZJTk0ksVm5yo0AOOYG7x4MFx6N31BtprQJlboj40XprVpHR472rOy5v0VUVabcW82MO9nxfR5VyDmwf0DXT6ZvDBExNU0ZYZmRBA8oBlhTjBaN0+GcRg2bJo6G0RnQ56PSBBVeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722253623; c=relaxed/simple;
	bh=/cNNdMQv3RnBp1c/KO7gSE8CuOHo7SDYLWQ5XpsW/48=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RLKarhfrYMs5AC4xpzcqjc6yioyUA2b/3nJj5kHPwrf0Osm/e7+w7M4oEyBRTgRCYZD7jNbRdZzW2pdVjsG1UebCXac6+YN7LGiQvj7ABsZpPE7I0l7SfRKAyHDK/J2Jv8qWcQ6fgggAeYmo0WLvNegX1edSDYzkUkVlCqJA3U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=S29qpKTA; arc=fail smtp.client-ip=40.107.105.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSyfboDqpMTkNy1o0XERZTU9C6r/JspVdTJlAOCbCOxzeIf8BorDxl2k8pmCbl0irTmaC356mcnIV1YDBGrDwu8ZWHpzgbseCtO1EA5Fp5I0pS816TcWQyjwtzovdr+BBWivFwWkJzw1Z3ctUNc1gvBjrWn12cAskqY9iCgQvOHop7eDoCLagBNynMX+DukiHRuNea3DDdfQV1LU32z9QKOPu4Tg9gnwT/yuNoWY99UJIqMxbyl1svBZeJ9u8IMAAmMR0K0g3Opkgjh3d+jvU+bkv+Yt2zCzweDnwZmn48/HBEdMi9amF8BjAFzUCdCMEUhnjBBlERdSsT9UYOACmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CSLY8yVN955o1fotPrZ1EcRcQKiFC83aZ/ZEXaukizE=;
 b=TnABpu7f0iVVCEWv+95SFNKco+hdutKK4/AnGKbMg3ifP2Ao85pgPCaQO+31K0EA6QX0y9S+tn58mWHpIaCrwf0/3JAQZYGyQyt0mI4navQq1nkSxWbwfBVVQ6oL0bYz5f2vqQA327IaqeeSCrOVMQldl7UNXcDl7Iq6IDiSB/WtwN+yQ0hgorm7ElCG6J7cKRvGZxxOIQyRlqKfL9oqJsg6d2kmSFKur+HM+DmpUwMlkrql+YHKuEr8ed01kqCn0n2WoQdvIWQUuWyqMNvcc8GJwIbrUsCvvXmbxNqsrmEltgr5YeLObpx8o7fHTJRZashDyRdk+OK5PvwrcJHiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CSLY8yVN955o1fotPrZ1EcRcQKiFC83aZ/ZEXaukizE=;
 b=S29qpKTADYEhdQhTXCB8t4gIVNdBIg1tDXhpfMY8X+HPUcRC5Vi26QylEdXbOyXsZP4k+aW4gDXZ7BA64zvdcdi+ruWTP1AZoRNGtNpSerNyYahpn08TsGqKINbNM9G1lFw1EIbWBg3w2/jHpSGRPfxl8YeyUZIfh00sWYWnq/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU4PR08MB10957.eurprd08.prod.outlook.com (2603:10a6:10:56e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Mon, 29 Jul
 2024 11:46:57 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%6]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 11:46:56 +0000
Message-ID: <015cf684-56e7-48eb-887a-a06c9d04f9ee@wolfvision.net>
Date: Mon, 29 Jul 2024 13:46:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Interest for a libcamera workshop in Vienna - September 17th
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240729090042.GA2725@pendragon.ideasonboard.com>
 <20240729112239.GJ2320@pendragon.ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240729112239.GJ2320@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0027.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::16) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU4PR08MB10957:EE_
X-MS-Office365-Filtering-Correlation-Id: 46602a04-24c3-417d-5fcd-08dcafc4261b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekk2OU1WUmxJcXAxZzBldEJiemNOWE0zZUlFYlh3SlpDQUhzR2dqc0hoaFQ4?=
 =?utf-8?B?cU1EOHZyTXpTTEZiRkxQcWwwR0h4RnFjNURwUmtrMlNOc2E2TkhoeDh0S2xG?=
 =?utf-8?B?U0tMa2VUVm1Qdis0ZmpnNW5jNExvTDY5cTZ6RU41SlV4a0FlSVRkVHBIQVZM?=
 =?utf-8?B?eFF4K2JjcndoZFJmMS9kUUZ0YnBsU2hZQzk3SjBoemxyWHR0L1ROSjg3VEdC?=
 =?utf-8?B?a29wbjNTQVkvSm13K2lrbERCcEQxcytlSVA1OVFUVFBKbThHQ2JmNXpBcDdH?=
 =?utf-8?B?QmhHN2EzZVp5WXhGSmZVeXRHdENnTUNhUXlQYlJYcW4vbHZ0Y25TcVZpbW9n?=
 =?utf-8?B?a2szeW4wWW4wVzJETUZaOU52TWZQR01LZDQ2eGVuVmhlWFI5N0JZOGRmQzNj?=
 =?utf-8?B?bWZxd0hxMmNoT0ZkN3IzNmZzQWdKZWdueUt4czZ1NFJJcnBML0VXR2RObkpj?=
 =?utf-8?B?REFHUG1YMmVZcCtSR0tybzZ4dGFraUJqaE1oMFNMRThjVHBxZkd4NDdZT3VL?=
 =?utf-8?B?YWtJeDFpdkVyVXFSNnRkTUJMMzQyMG5ZME5kMVJFK0tYV0l1eDJSV3RZNVBN?=
 =?utf-8?B?dHF2VDBnUmszaCs5MzNIWE02dGc1ZEtyUXRuUC9YTzZ6WVRrbnVNaEdQOXpu?=
 =?utf-8?B?aUtTNnlmdHA2aWVyU1FpdmthLytua3BUTVV2Qy8rSHp3RE9TSUN4REJtY0JK?=
 =?utf-8?B?a0psR3FYWHA5NS9sVzRCbWJ4WnpGQmRyVURQNkdPMHU3ak9oL1VWbi9CYUJa?=
 =?utf-8?B?cnFjVnZsbjJqTkxSYzMvWmtpcFN4NFp3ait4Y3dTUVpqRW9pU1haLzBmem9l?=
 =?utf-8?B?MEFvY3BpNVRxRmRHblhIWjh5bXdGd2oxbGZYS2xWTkp6R0ROMVRGT2lVRmxt?=
 =?utf-8?B?cU5POXp2SEdEbGVYNE83VlpxWW5HMmlwdENNSTByb1ZKNER1N0NiQkMvTVNl?=
 =?utf-8?B?aDY3elNWbEMzWHpvVG1hc3BsclB2eDErMVFhNk1VQUw0TFZNaUlRRVRtZklK?=
 =?utf-8?B?U1AvQStRK1hLdEFMR1A0bnAvL3h3WnZUU3dvWU5RZS9TWmtMeDlZMndYQXpD?=
 =?utf-8?B?ckVzWXFHT1dXSVBLL2kxemxBL1hIMEVBTHVSQjRQS2VYZHlldi9VTzUwTHZD?=
 =?utf-8?B?RkpEUGtFZ0RmdlZKcTVKVWx2OFZhL3hGdU1PcXhNd2RnTEs2Wm5jbSsxNFYy?=
 =?utf-8?B?dFM5Wml6enJRaGthNGMxY211cFdDeCtGVE1uTkI5ZlNPQ05FbkxOVm1PTEU1?=
 =?utf-8?B?WnpKVlZCVGppcGNOdm1xTmNYWUFpNnc4Unpybnp5c095N24rSXF6L2QrTXVS?=
 =?utf-8?B?MDRjT2Jkb3l1YXFzcWtlR0ZhTUJ5bzN2VnBFek5kVFBlRzhPV0h5ZUxhR3B2?=
 =?utf-8?B?SVJKU0Y4M3k1a3dQVE8zZTBIRXhheFVTSDZrdlQ1VWNuY2lFdWR1dk9aQXZV?=
 =?utf-8?B?WkhRTEQxN2hxNEZyV3hNUmNDVTRtQ1dTM1h0MkY5RC9PWnNYSTZqRTNlSW52?=
 =?utf-8?B?K3hMaHcwN2FlM1kxQ2ZJOUNGUUFEOVJyQjdPR0FlTXZkRVRxL0pZeTFtOW85?=
 =?utf-8?B?cXFhcG40Q2M1R1R1cXhQZXJwNnRMT04rV1liODVHd3dTL0tnNXQ5L3ZQV3Jl?=
 =?utf-8?B?ZENiY1MzTUJNSGJLdVFKeVFtL1FpSWJjaHdlM1FwVXZ6Lzh5RUlrTWlHOTN3?=
 =?utf-8?B?aUpzMHFtVVFKUkowOERXN0dGUVBwSFppTVR4NTJHbzlxSUpObDNxbjRyN1RY?=
 =?utf-8?Q?klOxMhMAU8zWkve2ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckx5V3JibDZhQkliNnZnYTRONVZpNUdDUklteG13Q2t1NHVXVmpaWjk5TzY0?=
 =?utf-8?B?Uy92a01GWFUzLzdyL0U0N004M0VyY3hXcUFJQXdnQm11MHRqQXhrRzUzQmZN?=
 =?utf-8?B?WjIybXIrSWVPYVYwa1NZTTFrYkZmSTZOL2llTHByaldab0JTMG5mR2F0aTBh?=
 =?utf-8?B?M1BUaTY1RCtMakkrY0kxbFdiWm54a0h0aGswMmloamVQMlMxeGZZTG9TMXpr?=
 =?utf-8?B?NE9sYktQRXBnR2gxSjVaZS9kYkhrdHZWZWtsdXg4ZXpGc0xHcUtEaEJDYjVk?=
 =?utf-8?B?dzc5NkZsYjluU3lUVExucDhRRUFsWXJyYTJiYWNEc2tPUzk0S055cUVBZEtC?=
 =?utf-8?B?QmhnSWV3ZjRObXZqb3dyZ2Z5WXhRUkdzc2w5TFUzTTltWFlxa21jSEQyTjFP?=
 =?utf-8?B?anBzczNwNmhhWDY1Umc3dGtKR285OS9XS2NDRnF2N3NlZ0ZHemg1TExKOWxv?=
 =?utf-8?B?STNLT2VDOVFOQTNLSG93SDV0cEluWEpFMlMxbDdjcGpPZExUWmpNR0lnOWwx?=
 =?utf-8?B?MHBNVWFLUk1ReEI1bkJxS2JOQVBkS05nRUgwQ3AybFhPUGMwRnF2T2lOMGpZ?=
 =?utf-8?B?Q2xaWEtxeGppZTlBdTlHYXlMUElsejEvWTlEU1FnTmorMXg2REdlZ2ZYVFFN?=
 =?utf-8?B?S0VNN3ZnNGRFUjFVZDVtMGdLdVM0djlRQVV6VjlwYVloaERlYzUwS1daT0x6?=
 =?utf-8?B?K2dmTy8xNCtuZlZUVS9rV25OSUVGRWhGMFZkaWswMGgyYi9jQkEvTHRELzlK?=
 =?utf-8?B?MlBvMHEvSW43dm8wOUtHT24zeGlabmZERDViK1FRWjU2RHFINWYxazhVMWRD?=
 =?utf-8?B?MktjaVlRODR0U2hFSnFpM3lheFJSYkl1Z0lMU1hydVpLOW5zVGhiTVZiWnlP?=
 =?utf-8?B?MUlhMjVrb0Vkalc2QmRhMTd5TUlNUUZ1dldxa0VrWFQwLzIzRHBhQkIyS0hp?=
 =?utf-8?B?RnVmaWFta25WU1U5cndyVkhIdzRZclJvZDVMdVkzdnU2VVhYNVl4dWMwdjhr?=
 =?utf-8?B?eHBwSXREWlVBNE0xdmlIVFdoUG1jQVBYTTk0c3RMKzdaVzVNZW5mc0x5dXVk?=
 =?utf-8?B?Sk1LUTIyZVA1ekRvRnk2QzNiSW9Qd0lmN015YytJZXB0Y216QVFJQ0hidXpY?=
 =?utf-8?B?eTgzSVhHSms5YjkzUGVFQ3ZKQ0Q0OGhITG5UVmlEZkRDaERzZ1hheW1HRWF1?=
 =?utf-8?B?elJRZmk2cWJQeE1tWG4rM0wwaXVaTGgwbm9taUZROUZYcG9sbnoyVkgrZm9K?=
 =?utf-8?B?cGovNFptemRqbDh4TUM4dzhSVVhJUWd2UDA1MWR2cHJHTzFNTEpmcklQTUVD?=
 =?utf-8?B?YVlUd002aFFoWUZDWHlKdjFvNWNqYnlaYWhyZ2NvYnpkbW5lUWorMEJSTTQx?=
 =?utf-8?B?SVBOV0djZkx3Qlk5cEZJYkR5NnVaRlg3cWVBeWllV093L1BXS2dCVjNRZHd2?=
 =?utf-8?B?TFR3dzFTNFhlZWdBblNHcC91S3UvUGt3UkV6akRqY0xmQVFmcVpmWE5nMnh3?=
 =?utf-8?B?RkhkTTFIeTBKVnBwUVBsTUNva1pCeFBpNUtmbHc3MWlqKzgyWi9CTmt4M1BM?=
 =?utf-8?B?MlF4ZFFzcTMzUWdlWFFid1AxTi9TTGN1SlNsTUdER2tlN25NZlpETWJPOFNr?=
 =?utf-8?B?dXErTlQxYkJ2YjBuV0VGRmR1cDhrNXhleVYrTzRSNDM1QXJ3bUhYNWlDOVZk?=
 =?utf-8?B?SGQ1QmdmNDFzT0czcnFIU1RUK0c3Y1pQNmt3eklKS3ZuRnBTalYwYk9kTHRk?=
 =?utf-8?B?VzhQQTNyMjg2TjhWNFJwR2NMYTBRSjVTREs4aThiaWZRa2RJSVpVYXpWNkdX?=
 =?utf-8?B?K0hKN0ZjMHVjMWhFMEprRzJQSnB4UUovSnhnak9BL2FWenlidEExNm5PaFdj?=
 =?utf-8?B?SWtNTU5vQUFYVTVWTlY5STEvZ01yTDNRTzVQSm11dU1xdXNRNitBcFRXazg3?=
 =?utf-8?B?U1VybENWcGJvM2R0RWhVUjE1MVdkMXN6NkUxWFA4a21FWDNnV0VRUkFwU3F3?=
 =?utf-8?B?Wk9qbGNvSHRBc2JLS1JKT1N2NDlRTVJ3YWgyTFpNV3hHejJ5cWNCU1YxaTdC?=
 =?utf-8?B?Y1dBNXE0dHV1ZERJWENTYUtKWE1KdXRsWElRTzJUN2RvMEdCQ0c0OUVhRGtF?=
 =?utf-8?B?R2g1bGlMRHJlRWZxajJsUXE4OVp3UEp2dlJhNmdsSGlnRysvbnkvU3luNngv?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 46602a04-24c3-417d-5fcd-08dcafc4261b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 11:46:56.8701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBPLEJPDVwTFCSQujXFkRwv/flYhZgPlSQSKBUo4UBqbCQ32Zt2VfiLtYpZ87viAJBQ52qs/CrxPyXwmXtHEcongf7kfuqX+qKIPDqQrA8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10957

Hi Laurent,

On 7/29/24 13:22, Laurent Pinchart wrote:
> On Mon, Jul 29, 2024 at 12:00:42PM +0300, Laurent Pinchart wrote:
>> Hello everybody,
>>
>> Following the success of our workshop in Brussels in February, we would
>> like to host another event in September.
>>
>> We have evaluated different options, and opted for week 38 in Vienna.
>> The city will host during that week the Linux Media Summit (Monday the
>> 16th, [1]), OSS Europe (Monday the 16th to Wednesday the 18th, [2]) and
>> the Linux Plumbers Conference (Wednesday the 18th to Friday the 20th,
>> [3]), and we expect that co-locating with those events will ease travel
>> for attendees of the libcamera workshop.
>>
>> The week is already busy with camera-related events on Monday with the
>> Linux Media Summit, and on Thursday afternoon with the Complex Camera
>> micro-conference at LPC ([4]). We have therefore selected Tuesday the
>> 17th for libcamera.
>>
>> To help us plan the venue, could you please register your interest by
>> replying to this e-mail, either publicly, or in private to Kieran and me
>> ? The event will be free of charge for attendees.

cool, I'd love to participate!

Thanks for organizing this!

Best regards,
Michael

>>
>> Please also let us know if you have any preferred discussion topics you
>> would like to include. We will draft and circulate an agenda in the next
>> few weeks.
>>
>> [1] https://lore.kernel.org/all/ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl/
>> [2] https://events.linuxfoundation.org/open-source-summit-europe/
>> [3] https://lpc.events/
>> [4] https://lpc.events/event/18/sessions/193/
> 
> The last link is wrong, it should be
> 
> [4] https://lpc.events/event/18/sessions/204/
> 

