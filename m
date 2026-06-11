Return-Path: <linux-media+bounces-64561-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z7R7J418KmqFqwMAu9opvQ
	(envelope-from <linux-media+bounces-64561-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:14:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 136D76704DE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:14:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=H0UhUqLV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64561-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64561-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A8AA30451ED
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932CB3BADA3;
	Thu, 11 Jun 2026 09:14:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D747374E7D;
	Thu, 11 Jun 2026 09:14:45 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169287; cv=fail; b=sg5RJdxFGwOavzQ2PoMt/oX9wWurmSVFMB/FCfjObjt6chrDXh+XQfkn6oVWe0iaIss0r7YYby1T/bFXj1zKK4Y211xTglsdbxuDPIqZ5UPdG2Dlr4LeMJzp4WIDwlC8B0fN9h833DlsOHPEXSBaiFyoDWfcJClPBIQdsWrli4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169287; c=relaxed/simple;
	bh=XBTlSq4JpYRgWNTr24Wf90aXop/fPdlIQWi0WHTl93g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A0ER4KXvuOf6fqf7eoXcS4eKQyZG41w465spOPpPw1Arud1QctrewRxf5ux+uwPsuexYybcJBlyeNFxjuYJPDV71S3S6YFqWYnnn9r3f5YL9Va/KHADOtTkBp3wBLXpc+dkIPDC90nMYtnUKzO89kZvF6muawGsKZgzm3UU60Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H0UhUqLV; arc=fail smtp.client-ip=52.101.53.57
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+POMKSwSHmTuvPNdpTfTInET/YT1WfW5TW6r08ewNm75zofOQK+aN0Xtwcl0cA9B9Py7vb9KKYhGhLbM62avrWXW4eMj/bOhFJmYjbBYmp1uYLjDQKerd7BwO7YL83YA2+bP9N0vs+G1J+wQ24q2ibrxibDgIKu/lquIf/fYYVrGtBczcPDtbI/zUDhhyu7IwHhy+1mKYlCtJupxE+eS5gbaBfHmK7Pp22SdfjzHdTHFVvnp3V+ak3F0WT9XwwmCoq6b/smO20YZaUtgny2uHFhh+ACdEEc65XszHJUk4JCPtEt+cyGiBvlbIZuf9brj/YJMe+p72SbUhgA+J/PMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSW5H/OmviwF3MKkJZWB13P0VVwfzgSYt5VjgLO6RfY=;
 b=BcbRIFTksnXVCV0pvM5FPIHAa2LymwIs6dmVdXOAfy3H/6mcLLkc5khDmy+6bL2zo0XlW/lx6PWPuXaB+Sz/biniwZrXKSOjRMmRVhxhs9ZQATszHbWJkiNx+WUsX58kHOYK+VQaAi0Dzq832L0AuavS1LuIloDkRR/lk39zaDX2kmOVnfqzbYo2U4fxWTtoPnhO+L/KJsU3Oxvmc/wha39aBlv2WbCaJcfjnMd6dVlKO45TbLHa3Y1PJM5igdRT8TNPX8TMzukVf42MT639EMxx9tIvIMFetO2aoZkXR6OWi7zACsVsasTJdkzQV98+7xuWPUTFT9Z0FJw6QBJVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSW5H/OmviwF3MKkJZWB13P0VVwfzgSYt5VjgLO6RfY=;
 b=H0UhUqLVjA+qvcJ+zZkx8+AzztmLicpuS8kwVE8TmH5040MHnH8nfdaO5UfJ9/9INHafXZsZqDmY1NIMZINiAUBk5wnJbEV4U2eAoTRDXKU0Znl6LftjmyXBU9wL0q7r+7vxd9cCVkD3PDAQUaqzinMB0Awvk9t9ladAaw8X/8M=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 09:14:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006; Thu, 11 Jun 2026
 09:14:41 +0000
Message-ID: <c3e8a9b8-e344-491f-8b8c-f6a682f15121@amd.com>
Date: Thu, 11 Jun 2026 11:14:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dma-fence: Fix races of fence callbacks versus
 destructors by locking
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com
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
 <DJ3VYD71HDQ2.3C8GG983Z2YCM@kernel.org>
 <c8564ea0-8ff4-4049-996d-bd978c478372@amd.com>
 <aebe759117cd65004510946e39bd02e4c903e1e3.camel@mailbox.org>
 <84519e72-e057-45f9-8ace-baf12f095e55@amd.com>
 <29754897c2b6d0a9560a05fcd1c0a0946577518d.camel@mailbox.org>
 <25494ee8-5108-4044-b4d9-cfcb37c397ea@amd.com>
 <c6a3964b130ac371e203aeee5f5b52d146c22bea.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c6a3964b130ac371e203aeee5f5b52d146c22bea.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0060.namprd15.prod.outlook.com
 (2603:10b6:208:237::29) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed42e47-ca50-41f0-e5e0-08dec799de9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|11063799006|4143699003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KdLMYY8mnlZZwE/GZLvRN73Tn74WkziDLduRSU5e47zwliauA/lmeApenPJdO+R7DTyH1VaRE8pZuhbjqO+4wEaI1+HPQ6xLNnxa4Q/TKlVd9oXnnPaNT81uNN39thEaiTGW0A+rm5VFeT52V/nhWP4IFQ+lEcsFs3xUmnV6PABG5FhTsK1S0AwSa25gO33a+wPiLuEm7CNiG6KKYFwJWT9/wERJFIkoKSat1iul1xvRYFfvZ6nZpk33tVASteb8VfEw38qHzGbWiy9nJfDo90wn1X8J6DtjaU00QG0R7aLYce9gskWwSs1heTiqgU3wix9O+s6Xk75pcWpaDApVkkaQGtFHYhIIt2yKLgRm/NV97WfgIrx6EXtL2gFI2HqIcbcS6K+pcMLu6LR4l2j27gBTYU2+K4aym8EI4hPAajPkAKpqU9KeA/gYr84Pn1pvd+EjDQyLpAniw3W+bUGDck1i1r2eccRO7hy3eQ5qb+bZhSGejfz3Txp6r41XyJICsmSZu9oLfaPJUl9AdBQshXD3gEjWvYgA/sGsHrAdfHPaTurxeMRF1ujrRB+g8y1qG2z/XMhi0Q5gn7rtikwqwE6JgNOzE/PuoMuY3zSSv/sm5K8Ja0vo3lPAKiskTyClCS/vOhVlverE1CFsg7iIF1w3fvfGCXGCOTbEPtjigntC370rT0Q8wbdIbX04RZ6jX7IswvmcMb+pXvKBKfqOCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(11063799006)(4143699003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC9ZcjBodkZZM2poNVRORTlPei9NNlhScExHd0ZVdGQxcHdnQXNsTTk2Zkc5?=
 =?utf-8?B?NE9HTnVpeWtCRHFmRExZcnpSZy9Zb1Myb2FteDJsNUJoVXRJVyt0YXpHaFg2?=
 =?utf-8?B?MWdjcE1DY3ZZZXozOTNPenpmT0VEQTlqcXIya1BUdVdJWlAyVGFoSHI4ejlr?=
 =?utf-8?B?WWt2WVc2ZzhHbGZjcDlUdmxhUFBYZVNMdWoyeVlVa296TUdMZ1liNHVDc3dN?=
 =?utf-8?B?NnBaa0UvOUQ1dTJ1RndwMXNQeEV1eG9zaUhHQU5qTW9xSThTWWorZ0xwbWNO?=
 =?utf-8?B?Z3JCRit5OVhFYWxXL0hqUjFQd0FWZXZIRFdKZXFhbE9Od2RZNGlNb1ZFNUk3?=
 =?utf-8?B?QXNRRjFCTkZIbkc0YWdKeGVWU3lYMFBhd2ZaVUxDUTZnTHhMTjBNUEIyV3Ix?=
 =?utf-8?B?VWZEWGVnNzcvNXVmN3hsM0czR0RmTWhsWG1PWGhURi9YM2prVndBeVNaMXVD?=
 =?utf-8?B?TUM5Y1BSQSs1VCt2eXd0RDNST3FQeXBQSUFid20xYkxVUmdWRlBjczJ2aFhW?=
 =?utf-8?B?RW1BZ0NHcS83SjAzbmpsaE9lUDJCMjVCYURUMjJ2eFQwVDRtL25VVWp0dGpQ?=
 =?utf-8?B?a1JxSUh0MmxDRWhHNjZka3pFdnBvaHJKNkdONkVxb2VCWHVLb2ZGdVdSUkQr?=
 =?utf-8?B?a0gzaXdtU2UxMnczd3JSVjkwNW9GM1JXcldFaEpwU1gxSENYa1l6Q0RmQ1pX?=
 =?utf-8?B?cTV2b1FHQm5meUEvclBmNGpuTE5UM1Bxc0N0enZNV0NEKy9jS0pFdWN3ckRm?=
 =?utf-8?B?dUNRelhaNURDc3BaK0FRU1Fzb3E3UEpmdUlTMnB2UlVnaVB1RStrbnBWWVBH?=
 =?utf-8?B?VFczSjQ3aG9yZVMvSFY4cVdpTmhuajNqUkVCb2c1RVFlYWV2cStrcUd2WGFY?=
 =?utf-8?B?RTR5RzhUanJ4a2xsTW5OVlFBbDUrQ1o5Y0dvT0ExUlk4eENOUDF4N3NMaVZr?=
 =?utf-8?B?TzBVUE1hb3JhK2QyY3lBbi8zWlVrUXNOUVRqS1FCdUNWQ3JzT2xQenhWc1dX?=
 =?utf-8?B?MmpJZE5OcExJK05IYmVMZXI3Rk54eVArbC8wdFRPYUQ0UzhZcWxpR3M0YW1a?=
 =?utf-8?B?cXVsMEtjL1JNTWI3cGhkV25zTkVBY1JEbFNreU5lcUhnYXlqMXdQZlo1ZDBi?=
 =?utf-8?B?V3VZV0ZxRkFUWC9MZkhMMVhveExwMW9nQWxqQ3RJU1A3bVdvVU5uSGY4YkJu?=
 =?utf-8?B?ckFsdXJYaVN4K2xSQXFvZzdpc0lsRHdLd1BVY0ZOZDNDT080VzlzYzZSSElY?=
 =?utf-8?B?bENEU2luZ2FkeVBNOE1iWHRjcFQ1R1hXUmhQSnYzbHlGTXpRWVFSNkdlTXhV?=
 =?utf-8?B?ZitMTForbTR2NjB2S1JjL0tjWWRoUmpMbzNpZGZqRDVWRk13WE9vbXFxRWdT?=
 =?utf-8?B?cVFWeWFQa0RqNTZKdHhPOS9MVVB0Z3dsOW1GSm9QbHBOak9pc0hFWnF4WGRL?=
 =?utf-8?B?Y29maDVXOHNGMktKT2QxZXYyTEFjeEJHS1FXWS9tM2xDME9tMG1HWGNlVVdS?=
 =?utf-8?B?WnBwWTZpNzEvSktwNWNyZCtPTHRRV1BkclkvakNsY25RblAweG4zZjNKNTIy?=
 =?utf-8?B?U3hHdTBHSkdrYTYzN0FjL1RORkdiMWt6L0dVNllOTDRLOFhmUVozdHdFWWJH?=
 =?utf-8?B?WTRYUUExdjg2MFBLa0w4RUhTL092KzV0aGRZNFI5Tm5LZEVxdnhUdG02VGJS?=
 =?utf-8?B?eXU3bHVJVUJlMG5yNzE5VVh3S28rUUl0azVVUGlNMEM2NnlSRHl0U3k5REdn?=
 =?utf-8?B?SXpKTVNqTXJQV0xOa1JRbDUrN281eGk4cG02ZnIxUVp5dE5iVGxqSWJWSThy?=
 =?utf-8?B?SGdRRXNhNVRXaW5DNmVKT3laVys2L1hwSVowRlEzL3dSdFUzeGRyc2JMYkRL?=
 =?utf-8?B?NmVyV01tdmxDUDZIY0lLS2Y2UW1VRVY4amdnZTNRYVZOaDhma01WMUROYzZE?=
 =?utf-8?B?VStVTkNrUDBOUmN6VzFXMkU0eWpPNmMrRUxCWnQ5amE4Y3pzVjJFV2VsczZO?=
 =?utf-8?B?cUw2ZjdWa3oxK2dsZ1B2MDdYU2ZGdFhmdnpMRS9JamNnR2RleFQxNEZEZ0Nw?=
 =?utf-8?B?dUZuL0JSSVhUdzJBQXVhUHRaWll6K3hveVo3QnlxY2pwTXR4aU1KcVNuWHBV?=
 =?utf-8?B?UG5UdlJKQk0vNzhydC8vL3cveU50eWdNQVVzT0k0aUJYZnBTcmJrVmlIV3Iv?=
 =?utf-8?B?MDJUMnFDa1pWL0tyZDZIN0NnU1Ara3BjOWJlcjRCSWpVaTdyWDdyb295Z1BE?=
 =?utf-8?B?WVF0c0h5aHVDZkF0UWRPeWQzUExhQmwrZnQzc2lsMHRUblViQmVqdGdUNkYr?=
 =?utf-8?Q?sRx3FLCJJ71wX5Rk1/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed42e47-ca50-41f0-e5e0-08dec799de9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:14:41.3362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWyuAelpdDe9HKmLGlMw29TfxEd+xoRs9SRbe9SGgNmAAlTUIZ88AQxvoT0ORZHl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64561-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:sumit.semwal@linaro.org,m:boris.brezillon@collabora.com,m:aliceryhl@google.com,m:dwlsalmeida@gmail.com,m:gary@garyguo.net,m:tvrtko.ursulin@igalia.com,m:linux-media@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,collabora.com,google.com,gmail.com,garyguo.net,igalia.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spinics.net:url,amd.com:dkim,amd.com:mid,amd.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 136D76704DE

On 6/11/26 10:35, Philipp Stanner wrote:
> On Wed, 2026-06-10 at 17:15 +0200, Christian König wrote:
>> On 6/10/26 16:25, Philipp Stanner wrote:
>>>
>>> Are you referring to this comment from the documentation?
>>>
>>>  * Since many implementations can call dma_fence_signal() even when before
>>>  * @enable_signaling has been called there's a race window, where the
>>>  * dma_fence_signal() might result in the final fence reference being
>>>  * released and its memory freed. To avoid this, implementations of this
>>>  * callback should grab their own reference using dma_fence_get(), to be
>>>  * released when the fence is signalled (through e.g. the interrupt
>>>  * handler).
>>>  *
>>>  * This callback is optional. If this callback is not present, then the
>>>  * driver must always have signaling enabled.
>>>  */
>>>  bool (*enable_signaling)(struct dma_fence *fence);
>>
>> Yes, that was an extremely bad idea which I have tried multiple times to fix.
> 
> What's the reason why enable_signaling() is nowadays called with lock-
> protection?

That was some decision originally made a long long time ago because the initial thought was that fence need to signal in order, but that concept was also abandoned a long long time ago.

Fixing this is on my TODO list ever since we figured out that this was a bad idea, see the latest patch set here as well: https://www.spinics.net/lists/dri-devel/msg461253.html

>>> Sure you can. If everything is properly synchronized.
>>>
>>> // driver
>>> dma_fence_signal(f);
>>> // all callbacks can't reach our driver anymore
>>
>> That's irrelevant. The question is not if a callback can reach the backend after signaling.
> 
> Irrelevant for your lock-inversion maybe. It's very relevant for life
> time and module unload. Proof: you and Tvrtko made dma_fence_signal()
> the decoupling point, with RCU protection.
> 
> And as I keep saying, that synchronisation point would make the entire
> framework simpler and more robust if we were making it consistent.

Exactly that's what I strongly disagree on.

The fence lock and the synchronization point which allows the driver to know when nobody else is in a callback any more are two very different things we should not be mixed up together.

The fence lock protects the signaled state of the fence, so that the fence functions can add callbacks, test signaling etc... while the fence can't signal. It is protecting internal state of the fence and so should be internal to the fence, external code should not touch it if possible.

The synchronization point for the driver is a service the dma_fence implementation offers to let drivers know when there is no more caller of their function. And usually this is implemented using RCU/SRCU.

Tvrko and I now choose RCU instead of SRCU because there didn't seem to be a need to sleep in the fence callbacks.

But both RCU and SRCU offer not only synchronize_rcu()/_srcu() but also call_rcu()/_srcu() which allows drivers to delegate the cleanup to a point where it is save to do so.

So while I see the problem I actually don't understand why you insist of solving it with the fence lock? That just brings us back to the bad design we had before where internal fence state is abused to protect something else.

Regards,
Christian.

