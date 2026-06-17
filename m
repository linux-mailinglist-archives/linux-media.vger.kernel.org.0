Return-Path: <linux-media+bounces-65118-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gkSCHVibMmoT2wUAu9opvQ
	(envelope-from <linux-media+bounces-65118-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:04:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C73ED699F47
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 15:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=u1Lf+ra9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65118-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65118-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28BCA305C59B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899863F5BD8;
	Wed, 17 Jun 2026 13:03:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010031.outbound.protection.outlook.com [52.101.85.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3743C09FF;
	Wed, 17 Jun 2026 13:03:55 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701436; cv=fail; b=XNiSgRnLtmArerko+bDjLPKT6R/TRYAVzqk/mB8rCdEB4rWv5Q4wdjZewiyGJ59F9gqxRDgx6L1O+6YdlqapofXAu+HxMYcC2cppAXX0fZuSlw048A9m1xU3sEqfnpZd6QUmlzuZ/fzCNm3gsC1oOarGnvxvyoSpEAtT+TC2QcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701436; c=relaxed/simple;
	bh=2riVKkAr8XLvQicQgIDtgXD6EpKIg/MIL0HEM6h1f4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AAU53pUfw0w3XPheciQ2VYg05dfkmpddLdPLFy4SLgKiskSr+Cu9y+g3l9hV7RE7c748YY/pNuNPZb0y4XVcQ2zkbIVe4ozzhYPnwIvcBmY8HtxtSsaKIh7ENyhrIOdzFau8SQzo3DqcZ6MCGMF5/OaSUdhbjIyxbIFzNP0D/Sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u1Lf+ra9; arc=fail smtp.client-ip=52.101.85.31
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyM8uUpm+mQIuHI53mhSnccica6DwJ5+xM+6LVLWHWGv07cOnE3bHHXmqE0iwcWmDkaBNkv1CVuzsnITZPVgXhpKnEwkr6nVl+mdi7SqoxPatLcunJ0uo40xBIwbpCFRKigmBUpYYNeYuQYyYDlSNsxbxTlgtcXOQ2F34V8bDHgvPPfsy1Ja5IRVrEcxUd2qOx/gb4R38ZISgpcpZzejqZsIldCSOW9S4pBcKLj6ARLMZMzYch4DExlVVFIopqLZ504GbjI7pws1rJXXQ1/vpu/Ks5/R+hTXKKtiukod+c/MRbq2qqZ+wtaSDVkuk4odSuzyyJY4UN3vARAa40rBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcBVDrQoEoYPdveOR7svUqqBr/Zv+bI0lfP7HaR71jo=;
 b=xHiM6Smh8WdYBGLckGfJhZWLMQTh+ZfaebRv+qN9BhcmZlNfdVOj6RO0NUpGjm/ojOzRj0B3jeOJaVBtws8UJ4VB6T8D6rnb/OV8FmjuR3HVJMTUG3vzcmnrZ+INscVzxk6VaTjEye6N6EEF1v2ehZkthXMFfTMCOMmv3MEaKcUJkWrdS8HpWZcqhKMNYuOjOajt+J/lGHuAJ86XvD921KoPD4oT00+YXUB95wa3XAUOCHCK5Yi3k3NgAC5I+yNoOwU5/PMJqavGEuhXU0XECIiHw7ukjrSLnN4qVfyS2jWMr4Q2RyFKwfomZmtIGKyDggRrobkQevRvto46k8mcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcBVDrQoEoYPdveOR7svUqqBr/Zv+bI0lfP7HaR71jo=;
 b=u1Lf+ra9i3ZGOFSZrcy7at/JP7v5wJGo0jBw2iHBTRaY91NKgZ3WrdctN+XZhL6A+kHD3yJNPy1j1KXWGCMrQRaB+bM5NMQ3WGZw6XEoZdVWvva5nHhMVCeyCtze2GJ6HSxcAG8LwTJThvgyzYtBdR1Dp98CLIm6iM7JFkowaqE=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 13:03:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 13:03:47 +0000
Message-ID: <c124270d-bb33-40aa-b633-54832edb7b05@amd.com>
Date: Wed, 17 Jun 2026 15:03:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Properly synchronize dma_fence->signaled bit (Was: Re: [RFC
 PATCH] dma-fence: Fix races of fence callbacks versus destructors by locking)
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <dwlsalmeida@gmail.com>,
 Gary Guo <gary@garyguo.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <95f4ae6b-9dec-4122-84e0-fbb0cdee9cb5@amd.com>
 <fa9a335196525adbc03ec21b2e05bb526e4fc174.camel@mailbox.org>
 <9d49c901-fcdf-487a-a733-0320d0bdf94c@amd.com>
 <DJ3V3OCLIK2K.3CYKWYNHYU6JQ@kernel.org>
 <ea4e0541-3702-4014-b8f6-0746a148df86@amd.com>
 <fa0dc9757bf8343516c4b156a2b70ec91b64ef8f.camel@mailbox.org>
 <6ea6c373-c6cb-4221-ad9d-e60b04d1368f@amd.com>
 <630a8a84ee8fdaa634c7b104742e7a28fcfe507c.camel@mailbox.org>
 <7ff7dc15-4df5-443c-8d7c-c8e9b2672f2c@amd.com>
 <80734f05e684ed6b8c82abd9f96c93968537d0de.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <80734f05e684ed6b8c82abd9f96c93968537d0de.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0408.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: dafb51f5-750c-42f8-048c-08decc70de64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	twvXR9IaW+misEyId2RGsxQnst64UdXxxtZ0+teLdkT6g6zFKNdgxCssjTCuYF/DY1l8dubSROn7RrWkSqLK9+LBkKMNXZ38kfCDZIoyGDEZf1cwcA5SImrlneLGmIgMAMpMMQGAZcxiU/xuxuIto2+8b+LVNl3ZWUj4lYpgOA5yvdt2Pe04KevAUZcnSPe+abbtSkamXOClu6xCbJXyIHpZT5UB7sKtoUKJFg/qRlq8bzj8aXv0uSOGaf2/Lw4VyPeQgZ853PDYJpwxlsA1ky/NPw0DXVEid65WISCFA98zo5I4TDGlvhcto0aytwrBJgzgBB0b2UuO9B/HxhZtwmfY/fplPv4pql4k/7BaZg6N1oBg+Mwgx0Fq+OShxIVSbEB5NxfoAGPBaupVfdQdy5SSSSil9tY9+uw5rrLD4xKYYPJ01f0LoClcVPRXO6v1tQdE/ZZHfTpDEaEHmko/BuvAoUvzg71eXltp95ks7MH+kLR6GMuJHNiHjR2o5SNAzTUhBSIHLndggUv9H/33YwM7vOg2B9ROQCGNrRRuNLBdiRLciudVAVJUI9yTuSsb12VwZa0HV4ujEq5/zlW5ie0xs74KC8Cy1npzcDmmUkvX9bbsOCDAgYNnPsUAJ6LdM+kiUv+xpDkXZuojWmngqmbCx/Jc/AjJoT4nYBTkzjL+WcnZiYiPbnQDkdrPNi3B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek04TjFJUnJnR3R3ZHJlV3N4dkFZSUFIKy9KUUdPeVdZU254VTViL1NZbEly?=
 =?utf-8?B?UE1rcVFnejg0M0FXZGduRi8xczExQ0dBQ3J5ZjkrbWJGRE85R2FBamQzTHRh?=
 =?utf-8?B?K2l6T0xBTVZWc1VUTExwZ1ZNa0lNUEt1Sk9kTVh6ekllcVlGbGZFKytWSld3?=
 =?utf-8?B?M0ZlOVRCR3I1OGxaajE1b09hd3VNaU1lWWVUejUzZ1E5T0dQd2pNUHFzWVBC?=
 =?utf-8?B?ZXVnSUhqeC9XQW12OUFlSW82SURNbWN3cFZHeHgzRWNNelpLSUhQQzhjTldE?=
 =?utf-8?B?YU9aL3dqNWovS1IwWHVSbkc4UHZLd3k0RDkwb1dHSTlvMnRxQ3hMbCtZc2V0?=
 =?utf-8?B?ZmNDRzlRSnM4ZVlHTk9RQTdXV012K25Kd1l5ZnI5NWdMWWN2KzN4K2hRRnEx?=
 =?utf-8?B?WkkwWkZVeWFFdWVXTGFpOXFzWk9kUW1UY2E2MG8yaU41VGNrb3V4T2lUYThD?=
 =?utf-8?B?ZFZ5d3lhdlhkYnJ4cTUrT2s4N2FSUkhLNkE0TGpjcHNOc0tOMUZmQithMHFV?=
 =?utf-8?B?Z1I4aXFKQVFjaTUycno5MEVMNFR0NDJSc0NFSEJ6SExoTTEyMUdvcURDbU93?=
 =?utf-8?B?Lzg2VExXMTBrVGZUOGxESHo3SkUrWXVERzlpN3d2dlVhTGdWOVNURlA5RHFm?=
 =?utf-8?B?R254MTFZN3JVU2tMaTlkNGdXNHFiT0RYbzlFcmlxKzhIUjV3alJtK3dxUFNv?=
 =?utf-8?B?OFZWck15NU5FbXNjU0NlRlQ1VVhOSFN1d0grQ2VQRVRleWY5b2ozWkcvc1hn?=
 =?utf-8?B?STdqNHVoUWJicjdIMkhLOHp1aFc2WGlQQ0YrNnlhM2ZjV1lCbWVwcFU1T3RQ?=
 =?utf-8?B?TnhoR2MrQmVUSUE0SnVIL1BGTTVpWkEwM2FWMGRqcXoxdDNEd05uVENWM2VB?=
 =?utf-8?B?c0Y1K0MwUzJ3OWZ2R3BldEdJbFNVYWdjV0l0dTFmanc1dkRtVWRoelp0UHFW?=
 =?utf-8?B?VXFNUXQ2YkNYNzJDMDA4U2JpYnNiR0ZGQjZiSEhWYUw0M2xkYlA2c01OeU5w?=
 =?utf-8?B?bllGVVFjQWVQTFZBeHozYzIxNklRa2NSYkRBTnFTWCtaS0R1RUxOYktxQ0xY?=
 =?utf-8?B?Ukx1eG9hT0F0dXBOMWk4VVA3MWQvcXZENmVoaWFOYnl0RUw3dktlZVEyNnE0?=
 =?utf-8?B?Umg1RDRMazhHQVJZSGFQM3o2MnVzaGw0Z2hKZldiSVp5d1Z4cHFMTUs5TlZs?=
 =?utf-8?B?dnlPU0o4eWtNTWE3R2w1d1NmdEZHMnBoOEs0UkRiQzArRkFTbUtZZWl5R3BT?=
 =?utf-8?B?RG9WZXltZUwySmF0OHlkUWpsSitjT0daMnFlWXRkaGducHpPWFlDNnJ1OVZa?=
 =?utf-8?B?N2V1Uk5uRGZkWUVTbXJ4MVdHYTBCV1lVaDF1aDhoOVJEekwzVlE1cWlPQVFE?=
 =?utf-8?B?TWpGNWdqSkpjcWxBRVpNYW1PWDduSmN0dVZ3akMxekF6NjFHQ29uRWVpK0ha?=
 =?utf-8?B?ZEFvSC9QM1p4THN1U0FXT0tuejNzOXlzcm1ETFFWdWZqM2ZzbmRUNXdjVGl0?=
 =?utf-8?B?VTFsSStNYkl6bG5YNk12ZHB0ZytTSTZwQmk0dzkwT0VYSU9rWFRwb1dXKzNz?=
 =?utf-8?B?V1FUbDRrT0dUVkw4VnNrTmZsbm1NVUhTRVR3RThUQ3FpWFFCZUM4NXhkcUNN?=
 =?utf-8?B?em5wSkt4RlVYNHhUWFRvYTZGRkQyZVZ5Qy9DZUJyRW9xRGRIQUdnQU1qS0tV?=
 =?utf-8?B?TWpzWjJ0am5VeVc3LzlVRmNTcG55RE1aUU1YbTI4OWdaUWlvbmM0bEZ6bUxz?=
 =?utf-8?B?UHZPQlhxSkdBVndJc2hqNmRtakVnNTVkN2tvalVYd1RTTmwxN3E2WGNGTXRw?=
 =?utf-8?B?dFkvU1ZTSWRPL240ZFRCZS9wb21iSjVFL3BNbWN1UHZla1lEU2JoQTRRSFBU?=
 =?utf-8?B?YnJQczlrTVZ6SGZqMkRDU1NpYnZsRTlkNFdoT01rZmtYeVlSL3RleHVLNTRC?=
 =?utf-8?B?RUJCc3pqelhwZndhak5DQUc1eW5ZK1hUV05Td1ZpbCsrNnNuVFpTMXgwd3J3?=
 =?utf-8?B?SkliYzY1aVprYm1OUSs5ZnBsQitjVE9GT200dDF2NnR0TVlYSVBVMFJXYmNa?=
 =?utf-8?B?aDJzUlhxTE8rYlRwUWEwY29XZHVQbm9rbzR2Tm9DQ092MCs0K2QxWTB3L01H?=
 =?utf-8?B?blV3bFczTjJPcTV2ZkI3dkIzMFNQUVY2Y25PbWJkS283eGZuWUJjd2lIRjFs?=
 =?utf-8?B?T3MxaUNjcWUyY1NudzFIeU5HamZ0eHVhdDB6UWZhMk1tcHlFU0UxalZ5SEFm?=
 =?utf-8?B?Z2FodUxyY1MySWxZcnNUOVN4S0phbXczcFNBSDZIQjFrNHdKTS9ZWVhTWmF2?=
 =?utf-8?Q?S6OwVdN+AhayRYj/TU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafb51f5-750c-42f8-048c-08decc70de64
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 13:03:47.4510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGlNIuoc86e4G8on1LErsTyWyCaHKDGXRf4EsHQqAesfmH8PG5mbxvkoA6sl7L5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65118-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,amd.com:dkim,amd.com:mid,amd.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C73ED699F47

On 6/17/26 12:16, Philipp Stanner wrote:
> On Wed, 2026-06-17 at 11:46 +0200, Christian König wrote:
...
>>
>>> B.
>>>
>>> I think rejecting ideas with "we tried this, it >>didn't work<<" is not
>>> a valid reason for refusing an idea. Point A above helps with that. If
>>> your commit message contains measurements or links to tickets with
>>> *real life* performance regressions (microbenchmarks are invalid), that
>>> helps reducing discussion overhead drastically.
>>>
>>> Now, in this particular case, I fail to see how taking the spinlock to
>>> check that bit is evil. If it regresses someone's speed that much, it
>>> would mean that someone is heavily punching that lock, like polling
>>> 24/7 with dma_fence_is_signaled().
>>
>> I think (but I'm not 100% sure) the the problem is that taking the
>> spinlock introduces a write to the cache line it is in.
>>
>> At the moment when a fence is signaled a read is enough to check that
>> state, so what happens is that the cache line for the signaled bit
>> sooner or later end up in all CPU caches.
>>
>> When you start to use the spinlock the cache line backing that plays
>> ping/pong between all the CPU cores and that is something which
>> always stalls each CPU when it needs to acquire the cache line. Keep
>> in mind that on a modern box you can calculate like a 4x4 matrix in
>> the same time you solve a cache miss.
>>
>> This is especially important for the stub fence which is used by
>> basically all cores at the same time whenever you need a signaled
>> dummy.
> 
> Alright, that sort of sounds logical, I guess. So the argument
> basically is that if we'd try to lock that, someone would immediately
> report real and massive performance regressions leading to a revert.
> 
> I think last time you mentioned that memory footprint is less of a
> concern for dma_fence than cache lines. Out of interest: has anyone
> ever experimented with more padding to prevent spinners from shooting
> down other CPUs cache lines?

How would that work in this case? I mean as long as you have the same variable (spinlock) you have the same cache line no matter how you pad.

> Since you're the maintainer of dma-buf, what would you wish we do?

Try to improve the documentation by sending out patches. I will send out my ideas for resilient improvements and we then discuss on the patches.

> Would you be at least OK with the memory barrier approach to make the
> API a bit more robust? AFAIU the barriers will not cause a cache line
> invalidation.

What exactly do you mean with that? The test_bit() and set_bit() are already memory barriers as far as I know.

>>
>>> Again, having that use case documented somewhere could save us all time
>>> – especially for you, Christian, since you wouldn't be forced to have
>>> the same discussion over and over again over the years ;-)
>>
>> Well I could also send out all the DMA-buf resilient patches/ideas I came up with over the years once more.
> 
> Maybe we could have sort of a wiki in Documentation/ with links to
> relevant mail threads and some explanations of why things are the way
> they are?

I think some AI analyzing the mailing list and noting when some ideas repeat would help.

At least for me maintaining some kind of Wiki additional to my current workload wouldn't be possible at all.

> btw, is there a dma-buf TODO list like for DRM in general?

No, not that I know of. We used to have minor cleanup tasks on the DRM TODOs, but those were already taken by somebody.

Regards,
Christian.

> 
> There are many passionate hackers who love challenges. We could
> certainly add a few "Difficulty: hard" entries for a few controversial
> potential reworks.
> 
> 
> P.


