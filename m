Return-Path: <linux-media+bounces-64276-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G3bOJBzTJ2rO2wIAu9opvQ
	(envelope-from <linux-media+bounces-64276-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:47:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11A65DF01
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=E8wGJn6k;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64276-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-64276-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CB0F2300CEAA
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31BB3346A04;
	Tue,  9 Jun 2026 08:47:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A038332A;
	Tue,  9 Jun 2026 08:47:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994839; cv=fail; b=u1hGkomgAdFWVBLb7vB6XeZa4Ij0GEA0vNDB6m+pmpv9B1wiLXGQoOjF5Sz2arECLM0F5BiT9nh1S1ip+mXksG2xPFDsITHWWpV4rJpZiBL/POHPTVkxkMI22EShBObkSgU3SOAf1mnBtte6dN+C/nrq3oqrnocgp2OSEkp0Q2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994839; c=relaxed/simple;
	bh=KW0NG23T3DcKHHI/GODUkC5wlMqzKT9P1+KX1b1XAE4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RK4WqZBOSexBhi4XqPPYS1pt11z1o5YAxNgbWMwxnuCLVC4nnRKjlvqi6A9nSWgSaAyCzo9RBPwWJhGGO48Sv0za7QNe6n427FtAyfNFGN9bVtkZn65hqehTjMVeXxW6TJWjswwSUAyThGCNnxHQ0CBT73JdEhJbvtyCS/w3Wgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E8wGJn6k; arc=fail smtp.client-ip=40.107.209.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJyvO7GSly9R4B4iTieBomn8lZV6BLGy/BXNXJ2wW3BpYXjI5m/s6EtocMrsHuvWDBqySAzFYdQiCzJfzRi62ghtBx5NhlXcU9QlJ9iPH4LhX7rdKM+7ficU0ceUs3ws6OhOCFzbwGQHHStDP0pKHV3s0mLS4DDfNGMDzGjupq/NO9WvDLgNJhIqtqakmNy9RQGmq8i0SUke3gvUtFsgIvvlMWqsndlDLe/6djqC2Ix+ba4KKl/34R9BRoIqpoaSFl6LgCYlL/lwGrehUomp0CnWgox7t78r06X0kFdpejBvZRfWI8alUCtb7k0nU3J6mVwzga5R2abFDHuT2tcw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDOTHWasIJgCLgG4PBYCJgg3PvPVf0yqbFZ2fW001jE=;
 b=Joj3s6M5zyTUSKJ5tRFAogxaAWOcs7/HXosYCi6+sjm4+fDhyUPetqeir2OzS0yZ4FXRBh0Y3ZInMFqJ+H10KOSsASED7/sjzRd1jYHc5eMgu0odN97x3VfPuVRIBeNn5mCzd1T+kkOYTtdnSiiHGeDOMKW6H3rS1H9EPlT9a6IucRcfULMUpbODRvdkkgMrMEFEcyULTrwMLOiDEx8b0mEZc+HaS6wLuI3efXAmkpAJXCFzhBTUanOwSuQiWT5/uLiKLMrl6vwp+PPZyBFHlfEIvLOWVlXaSoWdNhNPfLecEHxOK9Q6LXL1ttwnbYvRstDRCpVXltMVvSv99TXXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDOTHWasIJgCLgG4PBYCJgg3PvPVf0yqbFZ2fW001jE=;
 b=E8wGJn6kb7Orn0WYzylqliFCpYZlKuQWDlal/aXPMV3i+oeNN9TRiPLoGbmOH/5zz3JZPuxvsh+6NDRaOK8NxGAo86HaSD6awxVdoU+LB6MlmEX5sVub/31AKINqXzymAaMbeYou+7Gpb274gLqYN2ZGHOTv8xaaQQdRl2geQaQ=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8204.namprd12.prod.outlook.com (2603:10b6:8:e1::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 08:47:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Tue, 9 Jun 2026
 08:47:15 +0000
Message-ID: <8c155cd9-3f79-4e0b-ba3e-1c7e8dad1fa0@amd.com>
Date: Tue, 9 Jun 2026 10:47:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <dwlsalmeida@gmail.com>, Gary Guo <gary@garyguo.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260608142436.265820-2-phasta@kernel.org>
 <20260608170112.24fd92df@fedora-2.home>
 <6bdbdb6541392c6ea58e0035f0b20ac3c8f3e54e.camel@mailbox.org>
 <DJ3RRRX6JY4M.LCRKJ074W9DQ@kernel.org>
 <256dc5ae3529e2548c4151af34a540476ac928c1.camel@mailbox.org>
 <20260608181630.20145d1c@fedora-2.home>
 <739df49a9c0fc54e3d096f95f7d738081f6fcfc2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <739df49a9c0fc54e3d096f95f7d738081f6fcfc2.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0671.namprd03.prod.outlook.com
 (2603:10b6:408:10e::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: fb20895b-5ece-433c-fa9d-08dec603b4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|56012099006|3023799007|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KSDZIKcuBm2SASI8BeE3smpm/YCv62tkikxH09Qh+mj149zo14ZgMnt7JVWeLSCAQjrwu9FA1oLqo4W+yTf8XW9MgwH7tb6OAQkh68reigDk9DQz34V6XqMXd9WpcHtf/XTBeSQnck3S8dvsqvZZAR24NnTUe1c9qgftZp7m1K55V53dI8FcJz+rY0dPEMYseaWwyGFRUMHhk6SXa2WrGh5pBnpFCyR73syhT83JSfNT4vYt+tHZ9WSKKlVAtCMge/6Sz+GNXTqzCuTOYTRQd7d9icmmFu0RMVxZ3uPnb+dhhlYaIfFsrVcQDZ5uURbNp1BSXFwjrYlmUtoV5XSCXYcan+JzZncFoP63Lkr60CzLcGiwbCVFiLEiDCFm9C4fIXuH2v/VG6GVSBXekfxwA+VaRG+8b5X9j8jp/7Ct00IVn0Yo24Xk7xyF4i/4uT3rrU9yTh63pdFq6X9iTvf51Rxf5hO6ryAJR56S6qfPvKyinhjttQhMOFypk3PTKhfCN3X/nT83FMGGRZOvYFQ8PuEB9abB6Atn7fjBCGMVhmR02jW+4cHFvwbFP8GZE9wKnN3VWNcIGmtfBTcTi4RBYfHmhmf0t8Q8wpfI4Se0mYyIO1kN5tjDIFYkWylhh/pijwsFR2+rt7hU2SDilHSyff/D/LLfhtxWiRqYTFD+lqlRO/51gZ1TSw0eSfC3NVNL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(56012099006)(3023799007)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnNsZmpGR2xmTXNXbUt6RlNUbVFRckZhSXc2RysrbkRXZ1NrekJxalV0WWxN?=
 =?utf-8?B?amNQVzhFbGZtSFNOaTc2djlodlRQdkNyVzFDaTQxeWM4ZmVjOC9JcXIzejYr?=
 =?utf-8?B?VDI2ZkhqRStObUN6dnptbDY1NFRNYWQ1QWUzRDZCNTh2MC9DaExBR24yZXg1?=
 =?utf-8?B?WlluamtwZE9RS1ZkMUphTmp3WXMybTF5dXQ4am9NTW5nNElNZjdPMXNUZTdS?=
 =?utf-8?B?R2EzaytLVDdublVnM1ZDZDBtQ0o5Q0dFQkx3SHBkZjFiem13N0FTVjZjRm1r?=
 =?utf-8?B?UVg0aGJBd2dVbTBtYlV5Vk5TeE1nS2d1UVVlVGhBN1BtZStxZzFvYXZoaWhq?=
 =?utf-8?B?TlhQWmNuMmRzN280U04wSWFNUTJ5cEdmWnNZU2hadytiQVN3NDU2MHR5Qk1y?=
 =?utf-8?B?Q1lEWTM3Wjk0VldseDRhQ0tuOVQ3c3dEVU1yZHZPSXZ4OUVBdjNMUUoxQ0xh?=
 =?utf-8?B?aUVjbG5ra2dzZEx1ejZsVGk0V1UzT1Q1dkxqWDRiV25LUjQveGpUKzRHcFVP?=
 =?utf-8?B?d2FXb3ZVaWZhNXpzNkVzajlaaHZvS29FMVRzN2FJY0lIVlFvNEdEaHlnb1BK?=
 =?utf-8?B?ZnVackJXcStocEk1ek9QV2c0bGVQbnRBeC9UelVjUEtKajB4UVRIMXlLRU5L?=
 =?utf-8?B?RU1TSDRnazRjZ3UwWXVHeVV2cnhYMERLYkRNTTJiREJxUWQvV2VRVDR4aXAw?=
 =?utf-8?B?MXlDQnprT1pSTUhoLytocHhaa1pQU0l3U3c5WkpzMElLemE3UWNPNmtwYm83?=
 =?utf-8?B?bFBJZ3U5bThzeXB0a29rbDVXUS9xdktJY1l3dW84WFVxZVhtcm5aMXZOMlJB?=
 =?utf-8?B?MFlpWGpXZmNXN2xSYSt3Ync5bFU4bVpvbUVkRHlCOUczZmdXUmk0Qkk2c016?=
 =?utf-8?B?cU1Ia0l1ejVoMzlxRzFVckhobHMzV1plcmRJWjVQODF3QjY5TzFxTmFwTXRn?=
 =?utf-8?B?dHNiN0tTbTlGOHZDYy82YWpLQXJ4MWlyN2FudW13VlU2R2dNWDNTK2RrR0FC?=
 =?utf-8?B?RHlsZ3NyWVBrdnhneVFVZ25uTjg3dlluTTN3SWlyVnFBRkxJVnNUZ2hhM0hM?=
 =?utf-8?B?TkZsc25DOW9JaE9GbVNwc2J2cHNmVnNsaDdlQk9hOHJSYWM4R2JaZm5DZzQ3?=
 =?utf-8?B?WWozYjd6VnZDYzZRWEVITkRyVXV4UWVsVjl6Ly8wVTBoa0RFWTk1VTZPZjZr?=
 =?utf-8?B?QkR2clBxRTFibUt3Z3VBQSt1ejd0Z0x4MnZGTG1sWUxsK2djV1ZkbXJZclJX?=
 =?utf-8?B?ekpzR3g1MFQvc3RFZzdzbm5GYkEvUG5LeGRTdXhLY3NwS0dabjZJekJmYkJw?=
 =?utf-8?B?UXViR3J2ZmxvSjZzV0txZkg4azlJMU5HeWZnNnAxSVRiMjA0dEt1WG4yUXJ2?=
 =?utf-8?B?VlFHZ25Yc2tzQnVBa1Z0QitMZnJPZmxibWFPUmhtK2U0STZrM0U0VWdPbW5v?=
 =?utf-8?B?dFZ0ejZ0RnAxWmJacXJ4S3hOdE9KdXQ1ZEdtMTB4ZWQyOHV2cStkYndEQmt4?=
 =?utf-8?B?d0dCSm8yais1UXBpQzFLVWpTVkMrS05YbmRTWGw2dndaSjd6d0JSZnloemRN?=
 =?utf-8?B?L3hTMmxqUHRzbm1odlptL2xEZ1BTOXlQTGczNjRDMElETW5ZcXZxMHlVcHMx?=
 =?utf-8?B?QVhoV2JDcWdmT2Q1STljZitKMUxpRzNpOWtUV0tvNXp6SnQ3cHlhb2ZBQ3N5?=
 =?utf-8?B?bVV1UjVCQSttZHJ1eFJ1a3BGaExvNEt4MWxQd3R4aDcyOW84MVFsM2U0UzRT?=
 =?utf-8?B?RHJSdDI0Zkk4UnBEZFVrSHlOMThMQSszbHVMRmxqVUZDeXZCSGZEc0VLaHAr?=
 =?utf-8?B?SVRwYSszNXZTQmJCYTZkVlJFd2hBa2tWcGhWVFdnWHltN2hkYUNyRysycENw?=
 =?utf-8?B?UnpVU25kcW9sVTRPUlNmVEhmOE9rR3NwQ2RJUjRiVXFBTzFBcHVlMW4yUHR0?=
 =?utf-8?B?aVNmS0ZHUDY5VHFuQmhza0pSRlBtYmFYWGZoZkJMRW9raUc5SjRjYnJZejJY?=
 =?utf-8?B?ZnNKWFZ5ekVOblVNay9OcjNvTUVhajZLRVNFN1Vkb1NXVk1YZlVWTWtQNnlu?=
 =?utf-8?B?N1VtcjNDMWJFUkl6ZkF4MHhuTy9LY2dWM3JJWDlaNWVYL2pGQlhkemg3QlhM?=
 =?utf-8?B?TUloYU82aVc0ZVdSTCtKaDF1T2E4UFhyYU4wc0k1VzVSOE5oUlNuREw1d2oy?=
 =?utf-8?B?VDVuYTdjeWxyYUo4OHhYc1N6UnV2Ti9XUVBBQjB1SktyWkhZY1VmeU91SEhW?=
 =?utf-8?B?MFVrOWxPNDMxNzZDTFdzZk5nVmZHWk1hUmxuNUY4YWZWekQzNmNXLzNlRXA5?=
 =?utf-8?Q?gfblV8tS1fj1n9h9Es?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb20895b-5ece-433c-fa9d-08dec603b4b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:47:15.4054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VES/emS29fwwNWOftIK+tsQ7cu9/0r6oJdfV+LiRFlTByv6FDKZiWsEE154D3FH+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8204
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64276-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:sumit.semwal@linaro.org,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D11A65DF01

On 6/9/26 10:43, Philipp Stanner wrote:
> On Mon, 2026-06-08 at 18:16 +0200, Boris Brezillon wrote:
>> If I were to choose, I'd probably go for a dedicated rwlock_t to
> 
> side note:
> rw_locks are officially discouraged AFAIK. They utilize more of the
> expensive instructions than a spinlock and are only worth it if the
> read section is really long compared to the write section.
> 
>> protect dma_fence_ops, so we can:
>>
>> - protect all dma_buf_ops::xx() consistently no matter the kind of op
>> - protect returned data (get_xxx_name()) with this lock instead of the
>>   RCU read lock
> 
> That doesn't solve our Rust destructor problem though, does it?
> 
> What we want to do is:
> 
>    1. Signal the fence before it drops
>    2. Wait for all accessors to be gone
>    3. Run the destructor
> 
> Step #2 by definition demands the signaled-state lock.

If I'm not completely mistaken that approach won't work.

See you can't have a destructor if the dma_fence is independent of the module it issued.

That's why we have all the handling for inline lock and fence independents.

Regards,
Christian.

> 
> Or would your plan be to take and release the ops-lock before the
> destructor to ensure all callbacks are gone?
> 
> P.


