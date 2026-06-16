Return-Path: <linux-media+bounces-65044-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fqr3GL5vMWonjQUAu9opvQ
	(envelope-from <linux-media+bounces-65044-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:46:06 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F896915F1
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:46:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=TL+GVqgg;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65044-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65044-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4376A3122EE0
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9D944CF4F;
	Tue, 16 Jun 2026 15:37:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021111.outbound.protection.outlook.com [52.101.95.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E5743E9C6;
	Tue, 16 Jun 2026 15:37:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624239; cv=fail; b=K7qttydSUgh9JrMF63yLWE5WrDJAiLZTADXtCNdpAypELT5adKtf8KyGT51X5fM17+lS9A9hGsi6OlXb5EVVUbPbvn/fXGwP55NNrPKDvwt/YRdD/QFjNM6BLkrERO0gqjEiKEbfbE/we15I/m3CTJnFG1/RRttEdN4FjmBaeAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624239; c=relaxed/simple;
	bh=u8lA3R6FqywJffb1s/x9GBo0txXenIPohBsL9GukA9g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YRo6IHJyXO2/TRETqavULHOLqVQLuAmCu7bISdaJSGT0Cnjl1BbKfXAhZJS0rkmtyWATOGREvOS6b20Nw5eQ7+OW4LyHx2xI8kvITu4RAHywopK8JQTCTWdVRCe7CwBgUmC5naTQjDYvrOrbbeMP0JPMw80npP6lnaEeyiQVIys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TL+GVqgg; arc=fail smtp.client-ip=52.101.95.111
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xVpWVywju3EATtn1VzyO4FcNxoLCBQDFwz5SctuMsq0onDrPCP0Ai7/uT4jghxQ9K85JoBh/TYR/llh5KFX4FDbnOvktB6qMuTGG6VyOHDkAHGSR5VLv8PgylPt1ZOrLOkdA712mqPQ/L651NU73YQVWZg7gcFK7myY4dGTnmCzQuXik3UL4cSiulr92GA8n4GBFKOENAzYcPg0+HzRck6TQhQ2aeGcaAX4256goB+dU0UEmr5PgoNgNgpVncxD0A74lnfN4XsUaGIZx0N0adwE8/ez1FOv0CjdhwvV5G/Utut7Cv9OYKTzpaiLul/SE430PWc9wpn+7paVDINPuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8lA3R6FqywJffb1s/x9GBo0txXenIPohBsL9GukA9g=;
 b=ehlkkZVitpETzpIA2PoVYZv+FqOdUEXeWSS6+71vffd7hx+MUpmykRrkaOHYaEnp1tr7FrTAxGxJpjKonUiegNlijMG+ofnZggHjkneIT7rYeHt/XWXZAhpArBxyAKBJ0k2hCzLXZ1RSr015nSMDq1SXqh3kp/2LD+KPrXgwJrwcV9GKKdVJXYK0ODa+9XuKrmJ8Q4yGl4/Y4XzoZXO4DUbDVjf3sy8BjJ1EJRLoCLcT7PSW+yuWnWo/xSK0lwdFXNPKssIjVdscbjGd6ufQo81BWe3cYGanLXMW0VIKDDLrk/09grAzSVjxOWrSCu0G+bOKJABwnA4hprjsSiCEfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8lA3R6FqywJffb1s/x9GBo0txXenIPohBsL9GukA9g=;
 b=TL+GVqggRuqnSFLTBZSqZncOGkt40FdXAZ92XEPIEcz6sNVhJ3J2eaUhI4FHTy1Why5ypVWvrRjMextZwIQST0DFLoC01tcTpNVGomUqnCEpmyBc9jmOZzzOyYw2ixiTm9Jf6FuUZA9Y7S7F1gLj+93Ujd/4npF0Yl26wPhlxH4=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6470.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 15:37:12 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 15:37:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 16:37:11 +0100
Message-Id: <DJAL2X1X0WS9.32XO3YJFYCW8D@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Sumit Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj Upadhyay"
 <neeraj.upadhyay@kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Josh Triplett" <josh@joshtriplett.org>, "Uladzislau Rezki"
 <urezki@gmail.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Mathieu
 Desnoyers" <mathieu.desnoyers@efficios.com>, "Lai Jiangshan"
 <jiangshanlai@gmail.com>, "Zqiang" <qiang.zhang@linux.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Igor Korotin" <igor.korotin@linux.dev>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Krishna Ketan Rai" <prafulrai522@gmail.com>, "Shankari Anand"
 <shankari.ak0208@gmail.com>, <manos@pitsidianak.is>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rcu@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] rust: Add dma_fence abstractions
From: "Gary Guo" <gary@garyguo.net>
To: <phasta@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260616082819.2943886-2-phasta@kernel.org>
 <20260616082819.2943886-7-phasta@kernel.org>
 <20260616124755.460550-1-work@onurozkan.dev>
 <d074d3105a2c1d4f594bc6d7b0b09e62757790d5.camel@mailbox.org>
In-Reply-To: <d074d3105a2c1d4f594bc6d7b0b09e62757790d5.camel@mailbox.org>
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: ec41858d-de02-424a-04e5-08decbbd22b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|10070799003|1800799024|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3Y70rvbmrh6P97Le19fjzPCS7GmpNDcgUcN1OivNy4Qtfmiq2WY9dL9T+ug55ZHakMjQ6hA3T/cF3VCEdqU88dibj5DJKCaYfy2H5+hyZ/ZntMIka6pclM/DHpd1+KaHsP7B8Oa+dwlvN17PYMofLX/XMSFC5t1+yeEXYZTNQoP3pBbBSrcGd0kveNrQPfC0SAjsjmjX9tBfEVIisaaMMnTcowT8m8pEmyfGGE79uiFTdf9u+DgzhGqINFt9PgnifakU7pJicFxcUWVZ16sAEvl9+Hu9YIaTrk0RZE/8JukxgvFgJfIvxy4XjMtTYFWixSq/TJ9oXfi3rwmgZFMVTV7D3IMS/f5dP1ekTXGdeMcxvQtdiCwvvf/uolaRJpGVRgxdDgnt/igCS3HqvuzEeW4Kh+an1Tj3Q7XojlcHJoXMHynzl9RfR4fOzBSLArUd3+EEDw9hNxpOn4IVpyBkvA7cTO/BRJak7gqdcBGIftPFxhcjnVvc3O0+txEFzN301FXDNrC3I3rgeccwpomR/8NYPR6jQ5j6m9kzgcJAfuvqomQIUR1y5ki3rqFNMXCdoBMIXHko4sum+Zu/XTJ77lXQgv7HUOxCysZN6wqtUpmz9ard/JJ20CFC+RgY2BW/IM8Hcdjk5m/DsCU6WpE6ePjIdUv92wnM+x/FuPpTCS37TiSq2hxb2Q0gXSuHN2tB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(10070799003)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9jQmdJKzlkUUZ2ZlIyTEZvNWJ2clg0SkVpSDU2a1VTM2NhNXdJMmlBUnpO?=
 =?utf-8?B?R3JxaERzYXM3Z3JkT25PUU9GVUg2R1M1dWpCcStuVFFUMDV5emFPN2M0NUht?=
 =?utf-8?B?cUpvVjVzSEpSOWVkcXNZNldVREkvUWJNcnk1NkUwMjd5d1FGSGZKTE92dGpV?=
 =?utf-8?B?aHpvaGtqZUNqV3hiUTB5VDQvUU1aS3Z6T1poTzFRVEwxOW1jWm1mcE1mbW50?=
 =?utf-8?B?L212QkNCTFVxcGl3dDV4NnpxRWxsZnUraWlUTm5IVWNFYUNnMkdHeVZzV1BB?=
 =?utf-8?B?SEFaSDRTR1BSK1JWbHFEL3dxWU1mTkt4RjQ3MHZVa1k0LzVZanpPSllzbDgz?=
 =?utf-8?B?YjUwcHhiT3dKVGROVWJEZkFnTkpROXZwOFM0ajR6R3dCcjYraXNrRXR0bHBo?=
 =?utf-8?B?bE1pZW45QUtzTjlYdmRyY2hQOEJLdGpsY3IxNGU5ZmR4b1p3a1NkOHdrWmJS?=
 =?utf-8?B?d0F2QnNIdkJsU1d3MlRUaTNBQkhiU3VCTGJKdnAyOGlycEE2STZoWXBBOXRU?=
 =?utf-8?B?R21rUG13ZGZDa1c5SCs4NFhmWjFBUUMxVHlFMCtkMDNFS0t3TU5UK1lkVE5v?=
 =?utf-8?B?Nzc5VzJyaExucjB4K0d0QUs2MnMwbTJuMllnWVVjQjBTQzRrQnIyamg5SXN2?=
 =?utf-8?B?U3ZScys2VlpyN1NIdkxIK0U3OTNMMXI1TzhUVml3aklBSWJ0N3VpalUvWStB?=
 =?utf-8?B?K1U0VmFnNEErOER4ckxtV3I4Y1R5amFIZEUwMXVBc3RZK2lWZ29ZTExZa0pJ?=
 =?utf-8?B?Z2tPRDl2Zlh0QytEWUhSM2UvSnliWFFZRVUvZWFXVjU5aUo4ZVZlenZ5a3Fz?=
 =?utf-8?B?Q1ZjZmNUN0NwM1ZKdkw2aWJzdG1rbDNSQ2tVclp2ZVdGYWRlWExUUStObHJD?=
 =?utf-8?B?Y2NIV0cvcVlEYTErUFk1blBBLzM1dDZuZkFRMVh0WjUrd0JtcEdFUURFY1Ez?=
 =?utf-8?B?VXBQNkFTWmF3Y1JobmUyRVB5aU1aUU1ObXNEd3Nqb0dFQ1VyM3ZyUGc5akVT?=
 =?utf-8?B?OXNJTmo4S2pmWmltZkExN0RUT2wrZFc1WEdabXdkZW9VbTNrRDErTUhLbW1R?=
 =?utf-8?B?NXgxNlV5U3B2RFhwSWxEdnJBL2YzdU5VbFYyNEVHT1dhb24wQ09FVHZBRCtn?=
 =?utf-8?B?MzZMMEd5MWJvMkxvQWNVYUs4aUpZc3JlWEdpcGdsUkthS3haK2lEcDdyenV2?=
 =?utf-8?B?RzREM0QwV0J4S1hWazNQRW43eUVHeDUraGpNV3hJNklPL3dzOCtRSkJCektq?=
 =?utf-8?B?Y2pIYkVtV0lpVkRkOUgrMFJZNXo0V1EvN1J3ejlDc1puRzdyTjhaaktWWmlj?=
 =?utf-8?B?OFNZQW5TSlBaTUpCZnpuMURjZEM1KzFXcjROWHNUaWRCL3B6UVdYYVh6TEVB?=
 =?utf-8?B?eEpSYSs1T3ZjMmZjVUowR0tGbEpkeEdqK28zYXl2WnlCeS9uR0FRT1ZlcE9X?=
 =?utf-8?B?WlZaRjJScm4rdFRhaWlCT2dRZnorMTBSWGJEbENPTWhUK1libVV0Zm4xUG1n?=
 =?utf-8?B?c3lKYkZpRVc3T0pFSXl5MmVkMWtiZ3FvNkU5U2xuOURwYjZER3V1R09BZkx6?=
 =?utf-8?B?RFUwclVCTmExMHZTYmN5YjYzVDhiUEdzUi9XeXZsSitmS2g3RURLSmJFTXlk?=
 =?utf-8?B?cmt2VnVlQ0JUdlZkb2lpUnRhN0dmeUpjL3EzQ1ZDbytNMWIwK3lhTFJGT2dy?=
 =?utf-8?B?QUs0cUxqVFU2eWp3V201OExsWG1ON2V1OHhTd1lqM3FXdnhRbTZIYVY5WjFz?=
 =?utf-8?B?UlNRSTd1SXNTNyszSTl5c1BjU1lLNGJFcG9NZlMzV1V2OTgvNXVUREdvR1Ar?=
 =?utf-8?B?WDE2S1FrVytRanNCY0g3QWNJc1puaUVqR3JQOE1PQ2VHWnRpTi9ocTlFZngv?=
 =?utf-8?B?elF0VndOZmFpWWwxeUNtZmpVb1A4dDAxczVkc2o0ZEt0UmhtOTBGNnJYcFFK?=
 =?utf-8?B?ZFlKUmZrSG5RcWtrbU12bGhSdngxblVyZHhmRWJOWm41VlFhT1RJNWtWNVhL?=
 =?utf-8?B?WDY1Y1ltRG90MWpJRFp6bjlaU2xpd2NWSmxXVXNUSjNnR2dPeWFzZE1QOVd6?=
 =?utf-8?B?UVEvWkc5c0x0eFNYenNsRGxETjVxcWZFcFdyTFBSWlN4cjhQOUM2MVpQQ2Nm?=
 =?utf-8?B?dDdvS2EzUWVUdFZPY0VMVThucFIrRnhIcXczTFVNcGdYdXRIdlpxVlNmbzJp?=
 =?utf-8?B?SlVrYmRtTGVxUnd0QTl2N054dVpacXdNamxrV1JYcGpQcy9RQjhFeWFkYVZB?=
 =?utf-8?B?SEZCR1kvKzk2WU96cmVtN2lkbERqTVZFYmpFZlZ5dXRYcDZGQ2RlbGw2VEZi?=
 =?utf-8?B?endoRk9WTU96VGU2NzVYYzBlYytnNDdYenZhajJnaW5kcWh0R3RaZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ec41858d-de02-424a-04e5-08decbbd22b5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 15:37:12.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LpgOL60N/IEK5OPyYUQkHw3bci4vWoxVotv3PiEBB+OWC3VcoYh7TLS40fX5P+fmpZxKUII0GduSCp3iPWHmKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6470
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65044-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:paulmck@kernel.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:daniel.almeida@collabora.com,m:gregkh@linuxfoundation.org,m:igor.korotin@linux.dev,m:ljs@kernel.org,m:acourbot@nvidia.com,m:fujita.tomonori@gmail.com,m:prafulrai522@gmail.com,m:shankari.ak0208@gmail.com,m:manos@pitsidianak.is,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:rcu@vger.kernel.org,m:phasta@kernel.org,m:work@onurozkan.dev,m:fujitatomonori@gmail.com,m:shankari
 ak0208@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,linaro.org,amd.com,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,collabora.com,linuxfoundation.org,pitsidianak.is,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89F896915F1

On Tue Jun 16, 2026 at 3:38 PM BST, Philipp Stanner wrote:
> On Tue, 2026-06-16 at 15:47 +0300, Onur =C3=96zkan wrote:
>> On Tue, 16 Jun 2026 10:28:17 +0200
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // DriverFenceData is repr=
(C) and a Fence is its first member.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fence_data_ptr =3D fen=
ce_ptr as *mut DriverFenceData<T>;
>>=20
>> Either the field ordering on the type or this code is wrong because the =
first
>> member of DriverFenceData is `rcu_head`.
>
> Yeah, that's a bug introduced in this revision. Thx for pointing it
> out. Already fixed it downstream.
>
> I'm just wondering why my test did not blow up.
>
>> >=20
>> > +}
>>=20
>> I am unsure whether it is safe to cast the pointer in Fence::from_raw wi=
thout
>> Fence being #[repr(transparent)] as the layout compatibility is not guar=
anteed
>> explicitly.
>
> Shouldn't #[repr(C)] do that trick, too? Do you need both?
>
> Who can answer that?

You have `#[repr(C)]` for DriverFence, but not on `Fence`. `Fence::from_raw=
`
does require layout equivalence between `Fence` and `bindings::dma_fence` a=
nd
this is done by adding `#[repr(transparent)]` on `Fence`.

Best,
Gary

