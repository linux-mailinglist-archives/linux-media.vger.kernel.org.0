Return-Path: <linux-media+bounces-52022-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABo1LuatgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52022-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:00:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5195CD0BB
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00A34300E1BA
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A889C36D506;
	Mon,  2 Feb 2026 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="l+M0RQ8o"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B783E36B064;
	Mon,  2 Feb 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040696; cv=fail; b=QEo4IcS+frnTbz+qDMo9phAYfCTS8wiznmqh6lq4iA+CuPDJFsNvsMqus1H3rqndFjIcc6ccX2VW7uk4PLvQxD8ldKiZ5ZuV/oWcfubxR4P8FCiNx03hLleuYeHAVOoelGevLKcCHvtIfi9+wuJ1DMgJ1iqzmAQbf3+if+1f2RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040696; c=relaxed/simple;
	bh=U4CSVex9TJZaLW8ttpUY5c6LjZd4Yw0crehh+qU572Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KH4OTNUUiScPgq4jLHrH6yr87E8AKfOG2tFap/2qtr1fbiGHjUh8ZTfLT5aLYidbyRyHULvNS9tusK7Xq1t0bkWM5RXkrTcxqjvmF6O4wbVsXyrC+28XrouqgDHQq4TzAgLHoIT13PfpPyn60cDDKk/j1wOJAHPahrEl/l5rPwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=l+M0RQ8o; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Do0fK316341;
	Mon, 2 Feb 2026 14:57:55 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013039.outbound.protection.outlook.com [52.101.72.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1aq7p38c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaWWwg24L6G0pYF1HgaZvhoLtUPTAn3mIXeohyHk4fZJaUB+2ZOlR9mq3rajnOstQvdrYC+g4b3PGCbdAKHCyJJrU79vm8XdyybM4WnRHmxza/3ADepFmT9/Ljg46KkSP3ezkTkRKO0nPFEua2lD4+Z9QwHkMsMnk4vrOesZ1KGZF5csy3pXFcRb0j51Bwbuc0F3BdHzf+essy8rvD9SQL+HMnPNYauk/BipVTchc9uyezEqhAF9EpqvmvQJsrMBJFUZ9G6All804EWTpuodg4BYanykSgxXr6hp0kTqmCa/hOXgPcYv9uTn299PtR4DciJ6j/fiNl+6kwrdWJY25w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM2r2rMmUwyyCGPiNMKypDWo8zrosA60E48s6fEK5kg=;
 b=ifqZgRVig5HMSR5XhE5vIhtF4QXit93uoICSuIJCEVCVpfY27E0mguzbVmiKIEy8ZZi6dBiCxnfYfGARmGzcreHvqv73WTHRaft3YFwEncflE3BX9tDYBNHKk6FSwqNjaOYHprVe5sHWy1edAJ+viu1nuBGITtdytxIIO3qwzSTF6ZHYD9F2ldEALDuZJIDfhyCS3xk4auTB6v9r0vw+obrjFeacfj6qRopFJu7ZJwbM0p1JsMzDfjaY4vb9kH383y3IhGfH6stWtVKOyKC/OP0ujk/1bHtg5KU/VfiSNbiTFUP8xkj/hdtbadCjnZifUVqM1Cik9D03+APYRT7q8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM2r2rMmUwyyCGPiNMKypDWo8zrosA60E48s6fEK5kg=;
 b=l+M0RQ8o9vKsPAAsMk6+zFrskmgD5EqOhNhXTHrYL6g+42AG/VdUCGosljcn3z87VEoaNZQIYgHz9VBcXWMd902l7riBRDKb+sDTFELve2Tq8wbhDNSblqBJ1xTI1d32tn40I9yhEr9+XO8eZOffPIDEDsTI32LAxaHgaIEI9BXBK5ft+ZDG2mdD6iRMXLKBkKPP6TIm+cnwDX4/ruHe8LZO7DGWxRtC3gexaS4yDP3albD03KBcXfg1HHS+7ozpdWvp8rWVtkjqRJ8+dAXNLLJ/qAM7XapiGyNLiyGjcZLRxeZWsHlxeDeafp/8mYj1Ld2qYdVyhInYiXQp0XYvYw==
Received: from AS4P195CA0031.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::10)
 by PA2PR10MB8618.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:41b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:46 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::ff) by AS4P195CA0031.outlook.office365.com
 (2603:10a6:20b:65a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:46 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:31 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:45 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:30 +0100
Subject: [PATCH 05/13] media: stm32: dcmipp: correct swap in YUYV data with
 parallel input
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-5-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|PA2PR10MB8618:EE_
X-MS-Office365-Filtering-Correlation-Id: d04383d3-b097-4c75-9ac1-08de62630b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTFCOVVBNms0ZlZLOS82OE82SEJKSTJYOEoyQzFJNVBQUlBLWE4rUzUvdXZY?=
 =?utf-8?B?QXdiTUhJekZheE9UYTQzbE83d2V6L01td1pJRzR6eXdzZTdDMUhmM01wcHNH?=
 =?utf-8?B?OGdsZDRPN1ZDRWd2MmJKZnFqd2g5NHB2TmlhQVNoWmx3UWwzRXVJTU5XYVZL?=
 =?utf-8?B?bjF5di82NjRtRVNyRTB0bmdhKzV5Zm5JNHc2TlZsMndQKzBCTkVSTmFPdHBi?=
 =?utf-8?B?UEg3UVh2NjR2MklXT09vcXZzSUlQZGxiSDFWU0YwUko5Yjd3ZGNhRmZYRE83?=
 =?utf-8?B?clJFaUZvdjBLcDZCYWtyVnVLK1FrcWlIcWRQK1dzRjEwanNtejkvSXlEK0h6?=
 =?utf-8?B?NFRKbkJlMTZ0Q3dHSXQ2SjMvaGcvMEsyaFVSbVV4YmY1eGZLait4Y1U1ckpm?=
 =?utf-8?B?cGllU2FKelpYK2x3UGFiQmtxSVR5WjhDamVSWmpuWVczcXJRN0dpOWlUUlJj?=
 =?utf-8?B?dEd5OVg5RGJBQnY2NEJTeTZLOERNUVAyWHdjSzlBR0FkZCtZZ0NHZXY0cU1n?=
 =?utf-8?B?RlNYc3VqUytpRlRhM2trU0puWFRHUHArWXpkZ1d4N0d2RWZSQVlocjB0TnF2?=
 =?utf-8?B?d1FUejdnR3VFL3ppNUFhNXo4Um5vL1RFcVphN1UrSVdMR1l4UFowWGgvY1dv?=
 =?utf-8?B?Y3RRcVQ2QUxvM3BvdStWemRHNTFIMXA5NmtoRzd1bEt5aWlkaU5NNW1RbGlx?=
 =?utf-8?B?ZGU3WW9LcGV1Z1V5a3BmN2krdmZyazdDTCtoQjhRZkp5b1dIVkRqMHI5eXNv?=
 =?utf-8?B?NjdCZE1rcnZPdGppZ2NzSnY0L3Jsbi9oUWUxR3Uzdm1uNTRDN0RjZDF0WVFB?=
 =?utf-8?B?a1lZYUlSZE9VajFhRnYydUZEQ2tFZDBRNzNhbHlURkw2aTRnZnhMZmxFMHFX?=
 =?utf-8?B?dzM4MkdvUlhUb2JsTEd6ZmFtRUUyYU5wMnI0MVRXVG13QUR2Qk9ETW5MVm9Z?=
 =?utf-8?B?bXZRYmtRZzIrRVloVXZyWHFhR1ptN1VnZURCb0hCUEJ6bVNPZlBnQ3crU29q?=
 =?utf-8?B?ZG43aTIyVG9NVFV0VXUzL1NqMHpuQ2dFRzV1K0RCc0F3VUhnQXZVWGFGUS9Q?=
 =?utf-8?B?SGdtVlBsRWZvOFBIK20rUTdUS1gyNURheDZyS1A5QUNrcXZkRXNFMEhDRGUr?=
 =?utf-8?B?VGJ5ZmZwdW5CL0U0dEpRZkg4eE9xTkx1L2JUZHBNNjJqTkZrSnh5NTdWdTcz?=
 =?utf-8?B?SlpyNVlUbmdrMGgyZzc0akhKSTdZNjVCYUlGSXZPay9FRmprTnJ5eDFITzNT?=
 =?utf-8?B?bjBzZ1lZVTVXT2IzQTNtQ3hWeC9Qc1dZNzQ0WWJDaTdkOXBYd1JsN3FNL3pi?=
 =?utf-8?B?YlR6K0IxT085TU5MUGtBSVIyNVNnVFJBaHVnbFdFQUYyTVNiS0dnQmlUVXVw?=
 =?utf-8?B?SE0yS0N6T2hySzNja0tQWk52YWFTMUtJeC9VQlZ5T0trZlVaYkpobEJyOFU0?=
 =?utf-8?B?U1orSWNza0ZxbE45U3B1MWRtR2Q1aldIcWhRVDRxWEwzcUk0T25vTnRDSUlr?=
 =?utf-8?B?TEtYRzM5aFQzMzJLMzI2ZDBqSFpoRTB4WHo4NHoySmZHNStRQTRQUTRLVk51?=
 =?utf-8?B?aWlxRjRKSTBKS0t6UmY4ME1IR1B0UW8wNmVEQmNnanRtc0xnQnZQSTlqeFFr?=
 =?utf-8?B?NkRsS1dVMDZkeW56cUpib2ZjYTFNaU9aRmQwSDNkZ1NSenJHdUNNNUZGL1R0?=
 =?utf-8?B?WUN4OU5rRmF6blJWakRtdVBKaDN4Z2x1UVJDaCtwRVdnMTZpTXNSM0tHSVFM?=
 =?utf-8?B?ejd0ZlRNUWRtbGx2blUzdkxiY0pZRjduRnJCNDl6NlFBVDB2OWFtekdxSUFZ?=
 =?utf-8?B?YkJXTEsrZ21PZkRTYXM2WmJQd055anY4WGFQMjBsVFNSbm9QTjJDL3RhVXVz?=
 =?utf-8?B?eHQ3TVREZDh4Y2pNd1owT1pvUTUrcnQwb0JGRFYyaUYyVUJ3eXBsMXkybk00?=
 =?utf-8?B?MWd2bC82ZmRRYTJBZVVlVjJRdmsvS1pxUXdzTG84SGFnWExFa0YxWmtxZlo5?=
 =?utf-8?B?VTZyME5wYWxKMG9vQTRGcGZ0cmxJSDFTYlJmQnZ0bmF6NlN6MFRhK1A4Y0tW?=
 =?utf-8?B?c2E4S0ZVd3o3R2VpLytZL01xWXBKcjEyOUN5ZkowR0ZPTVpxbmlwSllOMFIx?=
 =?utf-8?B?a2dvN1RGdGR5SzMvZ0hYUDMyUmtrdndzd09iVEpwRVB1TzFrYjJSaVF2ckZ0?=
 =?utf-8?B?MTFmdXBLSmhNTkx3UVhtZWw1bjB0NmFOQmVQRU8yU255NWhzOFR2M0tub2N6?=
 =?utf-8?B?U0dvVjVKZnhNYlAxaGxSL1FIcUN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U7iSylbVmBJcJ67R0ssXQL9xiAS5yDdACya4M6nDs8nANssbi8tbejKlL7jJiRHuV72UH7ufW8Y637MS3AFYAMhtL2GBxW+anYTN6mPSZWIvajNXbN/SCm9pyeY4emqEyboh0RqSqk3QzpANXO6nAHajnXjQWaiTfb0jPkSYRh6OKhXYRSkmxTpa1h6rruiODGW4qMxhwt1M1+nHoqeRwktGNm1QPuwZr+C/llwuyq3Zk1ge21vAHeke+J4QdiW5y8+O3bhIg4HHt3qnXEP3iATMk9kZ9qBmcT0K4+cOtrj2TuQbAh7b3FUBLjgVjKKITzCFUkDtXr/535fjLR73RQT25undRtilIWB1dXRbmymqLhjszmrzgMtQa18qTxhEIZdOVtD37hTYyyUjWw3IapqMEKmmQ8EZoJqjuwxxdAG9UYOToZV/h+THSQztMQRi
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:46.0558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d04383d3-b097-4c75-9ac1-08de62630b24
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8618
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX1swWy3LfZngq
 kRm+Evgjb5+2RwsiOiEE7P8jb4Du6QKxZ7kt08lZg+5YWvC2hQdBn/liYxeF94qL9Hy6ZHX7rkc
 6iq2SzzGk+sg7FAwHQ4weFDxHhM8tOdAy7rCThAhjx5QXVDZ1gb1A6KbTNmVNrKK0JEFAXMZ2zy
 Q2FgMvQRoEfTl+lIfigzFJBNZFVz7yq7eF5df+rryhRsaUhFQuyXhipafCvUFGuPDpocOb3+K3m
 /DNpBk8hMuw3OBqECQ3zJVmqPwrAllFSt6IfoxjwnsOBf8xeVCU3Hgp99+tQm6KDD9LJpEL0YNb
 RrqAGq+wYfKRgTBa5mlQHn0j13fRCyCXTK304I8MOVUYWERw9W0U2h8IYzWGV5enlH3iQrIzPq5
 Oi8yPzhK8GZxyOD7PGlFV/8zNe5pl4XL/obwIY293RumxyptpJC+KkDCMgWrwQgLBpnfu1gfr60
 2bnw6EguZL18j2Z1z8A==
X-Authority-Analysis: v=2.4 cv=LLBrgZW9 c=1 sm=1 tr=0 ts=6980ad63 cx=c_pps
 a=pv+iSUMxSX8tKyfHAWeKVg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=r18cF4YDy6_3TW5T5aoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: KXZvDY7SOfo4NHMh78s9yOgwOr-6OxD5
X-Proofpoint-ORIG-GUID: KXZvDY7SOfo4NHMh78s9yOgwOr-6OxD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52022-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D5195CD0BB
X-Rspamd-Action: no action

When used with parallel input, the DCMIPP is expecting data to come
in YUYV order (for all DUMP/MAIN and AUX pipes).  Not doing so will
lead to bad color generated by the pipes when processing is done.
The DUMP pipe is also doing by default a swap since, while it accepts
YUYV data, it will by default generate UYVY data.

Current implementation is not correct for parallel input since it is
performing a cycle swap on the input side and since the dump pipe is
also internally doing a swap, the data captured from the dump pipe are
correct, while the data captured from the main / aux pipes are not.

To correct this, only perform cycle swap when it is necessary, hence
changing from YUYV to UYVY for example, and for all parallel YUV MBUS,
add the P0PPCR based SWAPYUV to put back the data into the ordering of
the input.

Keep previous behavior when the SWAPYUV is not available (such as
stm32mp13).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 16 ++++++++++++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  1 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  3 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 28 +++++++++++++++-------
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index aa0561957b80..580896fe190c 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -25,6 +25,7 @@
 #define DCMIPP_P0SCSZR_HSIZE_SHIFT	0
 #define DCMIPP_P0SCSZR_VSIZE_SHIFT	16
 #define DCMIPP_P0PPCR	0x5c0
+#define DCMIPP_P0PPCR_SWAPYUV		BIT(0)
 #define DCMIPP_P0PPCR_BSM_1_2		0x1
 #define DCMIPP_P0PPCR_BSM_1_4		0x2
 #define DCMIPP_P0PPCR_BSM_2_4		0x3
@@ -428,9 +429,11 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (!vpix)
 		return -EINVAL;
 
-	/* clear decimation/crop */
+	/* clear decimation/crop/swap yuv */
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_BSM_MASK);
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_LSM);
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv)
+		reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_SWAPYUV);
 	reg_write(byteproc, DCMIPP_P0SCSTR, 0);
 	reg_write(byteproc, DCMIPP_P0SCSZR, 0);
 
@@ -451,6 +454,17 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (vprediv == 2)
 		val |= DCMIPP_P0PPCR_LSM | DCMIPP_P0PPCR_OELS;
 
+	/*
+	 * Perform a SWAP YUV if input is parallel since in this mode
+	 * the DCMIPP will swap YUV by default
+	 */
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (sink_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= DCMIPP_P0PPCR_SWAPYUV;
+
 	/* decimate using bytes and lines skipping */
 	if (val) {
 		reg_set(byteproc, DCMIPP_P0PPCR, val);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 9e7b2434200a..2d26425b0b0f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -118,6 +118,7 @@ struct dcmipp_pipeline_config {
 	u32 hw_revision;
 	bool has_csi2;
 	bool needs_mclk;
+	bool has_swapyuv;
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 3a0a4df410d8..9aba16096d28 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -108,7 +108,8 @@ static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
 	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
 	.hw_revision    = DCMIPP_STM32MP25_VERR,
 	.has_csi2	= true,
-	.needs_mclk	= true
+	.needs_mclk	= true,
+	.has_swapyuv	= true
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 597f88ac7915..bed79a813def 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -80,15 +80,15 @@ static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_3X8, RGB888_3X8, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_1X24, RGB888_1X24, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	/* YUV422 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_1X16, UYVY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_1X16, YVYU8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
 	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
@@ -356,8 +356,20 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 	val |= vpix->prcr_format << DCMIPP_PRCR_FORMAT_SHIFT;
 
 	/* swap cycles */
-	if (vpix->prcr_swapcycles)
-		val |= DCMIPP_PRCR_SWAPCYCLES;
+	/*
+	 * Table dcmipp_inp_pix_map_list take into consideration that SWAPYUV
+	 * bit is available when dealing with 16bit YUV formats. If it is not
+	 * available (such as on stm32mp13), swapcycle setting should be
+	 * reversed
+	 */
+	if (!inp->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (src_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= (!vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
+	else
+		val |= (vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
 
 	reg_write(inp, DCMIPP_PRCR, val);
 

-- 
2.34.1


