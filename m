Return-Path: <linux-media+bounces-58155-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGF+DBC51GnQwgcAu9opvQ
	(envelope-from <linux-media+bounces-58155-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:58:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB2A3AB07A
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4428B3014407
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 07:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332303A3835;
	Tue,  7 Apr 2026 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TrISM8vO"
X-Original-To: linux-media@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618E938645C;
	Tue,  7 Apr 2026 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775548683; cv=fail; b=tzCobU1gioEx/H+vP8fcFGhxOB8UKjHr+vbpWXyuIZ5g8rDofkufdFVN8n6RRLa6VxapkRGq5U0pyCjt4OfbacIioR2wXBytdQ1OoKoQmdX5guIib/o3MuUQXNfykSd+8Q6G76814IbS3MXzDoNGuBSfhzNaVV/s9dTNwM9iwrs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775548683; c=relaxed/simple;
	bh=2m4LTU7DswqEHSuzgjN2Z/ATdj3ejsK+lqDQNYckqbM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b8XM6KlPgqNvhECVnooHNdy9mtY8u4QJ3WduXATVGYP5DnZa7OW7PkNzrtM0Mmn8iP3fJ0Xd78xvRfF86wY6ZoYAO4Jjwg3Fh0j0QoipOBXeNcZMmiELmcY7PGu08FcGyLWcyF7vuS444+VfbymQqFZSFdQRQzS9Lp5zo8FjOl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TrISM8vO; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJZLhx/2a2P9Wb0COhy0YJzEsV+vLBy904tZ0OmAha33/gGNYEaxPhCFrPcwJdn4Bi52oPw+pmcvVtnREftdaoOIYG9xN2zZzgdmNt5OqeL6Y0C2HlhZIxtjy44jDcQbYx6fpGimYAljhETsX7eCMUWGryMPJturHYYZuPZxkbU3Myyrnck0dduBfNgSzEWoIoUA7HUq+fiGK3tpkke2/b7RNiKC4rT3hJe+f8FhGMLfjJSLBwt6XoEOwW+Gr0wA3tVS7O3fqhmxR68DtUV7ZC9aRYXyTcQPWHsFdnGJjklDmR9iONwL5j9R59sWu+ywL8SlCuBujI78vWpyNRbzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52fT8NQ0UBtszwl+Q3sXubjCt0TeMB/mkCRSG6WdtEc=;
 b=MyptjJDRMs0TSyWnahw4ioknPvD0zSplKFICesCF1p5I11WRjTZ/wX0tOFe1frvta+Jt5T7weLLH3A/jEaiGp7S2DjzFAXthWwV2G/8yEU0CXf9FzvDUyGoxkE/qY+BNyw+je5eKmfYaQlUA1Jj+MrwVeWB4L/NrpL7xc5+SutHDY1V6yacEn6HT7fZAC3BI8bdXoJXudxT1aY/MKYQAzKZL6T5LJpakEHiSw3UFNKbE6o2F3jPZ+6mPF16AvjbG21ErNTlQqpKUQHvBdZ1bU68atEsKgZ4cx2GySwaLZNBo7cNnqSOU5R7NQPV/3tCbbAbeb2Xfd0G6+PuTJ5bHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52fT8NQ0UBtszwl+Q3sXubjCt0TeMB/mkCRSG6WdtEc=;
 b=TrISM8vOyN6oQ2bm4XZWOvOhkE6xC4of1hHwpdbttH6darkG50MZ7q6F8IxdAybdk/ZaXzNFX84GyUfYj9W1op7/7SRONDmhWJTs3eJe7279AdOtNgSqFNyIwEMw49sr0xIEb+tVj9OxVHPEohqHHxoYYCeHc8Q+q4ZnvfsKkZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:57:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 07:57:59 +0000
Message-ID: <a6d1c89a-3c71-4e06-adcb-56595071dcc2@amd.com>
Date: Tue, 7 Apr 2026 09:57:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: system_heap: Optimize sg_table-to-pages
 conversion in vmap
To: "Barry Song (Xiaomi)" <baohua@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org, Xueyuan Chen <Xueyuan.chen21@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>
References: <20260406214938.24142-1-baohua@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260406214938.24142-1-baohua@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cdf0eb-c758-466a-cd46-08de947b62f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+5r2qHoE0f+7vL0n5K+/bwytGjMmghz5LHvjJC2hK3TJTZTYH/lchGqRXUk3ijec9K9TO8womLsCtZpNOqmuh0HdZV7TGeWURoX73Rhp9kipnXF6KiQc0O3J4TE2B0r3jeluJBDuy6YvViwRZKw94XnS/jgDrUvcIOLpZBMJuMmEddNwieodtJ8fSMAh2FYwNuvDY48uWH52w0mH3yC2S6kCzX9iBmxDcvXse50VLJWxEKh0DbOO0NcEZt3EDAOhRB5kT0FwpU1werz4377CYLNwoe6SsP5InNptRGeJBN0l/ir5wd9/h+JX6K+hEffZnQvfCuJMNUE2aVYKmJA40hrT9evKLLeUPEKYjh42MQns7coL5d1XE4w3lxQ7zFprFjz2IlWNnZbgi9PlluIewNoMShHlUJxhg4Opi0XTdn57xZ57KlCHx/TzRgzAG9Qlq1M/sgjZCvOjya2iJPUJyayb7tdz5xcMlHbJ1m2HSh2wv4unyKgJSNgCdRFdLFCCxEV+MNMcwre4PAO4/07hjKogW4wYcmZktiOhbanP3N9FHMLu0Px8pQNFjW64r4qmuRyitUFybF2rFvG7Iya5ES/RLkrIY5LMy+z+5qsO5yiZKQP17LcPMF3JXFoW3tm0aukxQKJNbmPt8m8XnlIvV8w6fkxdyY1rAyfGKRl+aRuc1/devvp9rUujrPxFD/k39Jc+rpj/TGzv/tbs1+ti10Bpo9uiySptoIETY9XsMR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCtwbHNRam14Mnc1b3VYODB4cFlrRkpSamhJcUY1VW1GOStJSUhHM3ZTaWhp?=
 =?utf-8?B?WWVVLzNKNjlhQjZzdFFqZ1M0WTYyZVhKOTdsMmlRb3Yxd0ZSeEE0V3BIQ24y?=
 =?utf-8?B?czhFeGszQmlobzBqMmdNZHliZXJFUUJQaWxoWU9lcEVXUkliRzgxUFV3dkRh?=
 =?utf-8?B?QUExckg5ZWxBR1lGTk5jek56WjFUbENUK3FrY1h3WlEySSs3OHNrL3BmckE0?=
 =?utf-8?B?cGlLNkJXV1daMlBuNXp1akQyWnFYckt5Tk5xMEIxcFRINUx4eGV4bnVNSEU2?=
 =?utf-8?B?alNPYmluYmRWcFpjNHF0RU4zQjRPVkhBLzBQUnRZdW1Uc0trRThJRGdFTUdJ?=
 =?utf-8?B?MGJldkpvVnBSQzNBNXI2S3ZuUmlZZ1RYaGVmR29XYjYxbmdwODdqUVRUenVB?=
 =?utf-8?B?SHNaWWRsNnE2S2dmUWJyMXhORUpsQUtOQnAvWm5Ha3hkdXU0Y3RhYU9idWZv?=
 =?utf-8?B?UlUwbEp4UmlmbW5EMXNSZ2dPc29ZaXJkNzVsb0xzWk4reXZEVzN0dE9lZUk0?=
 =?utf-8?B?NDluYUhpYklVckhBYzMzeTkrdHFlL3dPVnFJeFVnWWJna0o1ZnhSUk9tamxS?=
 =?utf-8?B?dXR4RlJEZ2thcFJVY3RCb2tGY0RCOWZJYXJOeW9icG9mcmJhN3piR3BOYlN2?=
 =?utf-8?B?TGgyRFk0SVVFWHhiSjYwSzk4Ni84YldKN2NGQ1dtMklGTXY2MlRLSDdjY2k1?=
 =?utf-8?B?bkZpaUw2bGF6Nkd4MjBCa3VGQzVIV2JTV2xsR0FKcHo2VHczN1dNTGswNFYx?=
 =?utf-8?B?dE5ic25FNmk2c3dlZlIvV2psWitFbFgzN2hwMXRHcGVPUStsY1EvNFJmdEV6?=
 =?utf-8?B?WlVmMTJaa1padlhyYUI2OGJJZW9HZVAxTlVJbjcvcHBaemltNi9BYzFuYVFp?=
 =?utf-8?B?VUlWYWZLc0hUUXlEbE10QWlCOWtFN280c2VNMHN6eDIzTjkrSklqYVg5dENs?=
 =?utf-8?B?ZlQ5VHJIWVFuSjN6Q3ZrU1hZMzdiWmI4VmlVb3V4MTlMbmxVWTQvMlNSbHRj?=
 =?utf-8?B?WmxQZk1VU0RsOWRpQkJDVXpuSXhLQ2N2RjFEWU5veVNwMHNRZkRzZmovdGNF?=
 =?utf-8?B?K0FKN2JUSThsaU1zbWd0amRvbVlhQnpRbVdxSkdDM0tSOU1jL1cydjU3OVE1?=
 =?utf-8?B?UXI4MWRSeGRldTZZZC9ueis2ZDVYYWVxdFdSaVE2ZnVXR1JHRHltZ3lpSzFJ?=
 =?utf-8?B?L2JCR2phSkNQLzFQbFlRK1J2aDMyZjZZKzI3aUE3aDZ5cmhnM2xHaElwdmhO?=
 =?utf-8?B?aXU1ZTYrczQzc0VDTVhQd0RDV0FERTF1TWJYdVg1d2RsV3ZleTFpVlN2VTd5?=
 =?utf-8?B?bWxHZ0FRdmJQbjlNQXB3WUc0OXZNcGJSbWorM2NsZXN6NFpISnVHWmFIcEsw?=
 =?utf-8?B?KzZBcHZvajRsb0J1K0tWbi9qYkJQVkwyMWppZ2xsa2NGenJuaGl6MGFPaTlY?=
 =?utf-8?B?b2dadWlCaCtuRC9INVB1cnk5RjlVRWxuV0RQZkYvZHJCVzZhVTcxeStkQVRB?=
 =?utf-8?B?NmpoYUhNRmFUVmdZVHNyT3FqYzE3SW02dC9MelNYWUxyVXVFc0pOTFVCOTBQ?=
 =?utf-8?B?VG0wTUJHUEFPL0pIdldUZkxIUm1nVUFXaElJb3A0YTVNQkhTVGRDQjFaVTYz?=
 =?utf-8?B?SWpHdVpuWHB4dUxyV3hHQkM4YmkydXlOLy9JOHNERFAyTDV6cFVYQVV6MVht?=
 =?utf-8?B?TnIrQjNmRnlHY21TN3VsZlVvRytCUURQZ09WbFdJN0djUUJNdXQ2SVJMV2FE?=
 =?utf-8?B?OHFZUkFqcy9Sb2F5N3loR3ZkcVlLZG1MdHBBMTYyOTU0MXZoV3N4dkZFWm90?=
 =?utf-8?B?VmdpbDJocWZna1dhd1hwb2V3WnlrUXZJa0p3blVEYkRnRjJ6ejZ1eFFtMEFP?=
 =?utf-8?B?VnVaL3IwYmFQRVJlNndnTFVzSWpDK2JMOStTYzVtaUFmMzU0ZkVLK0VBZ3V0?=
 =?utf-8?B?MGluVGk4dXZxRk9PY1FYcWdnUE5LeFhIT0p0K21zY0tsK25QbzR6TktHQjc5?=
 =?utf-8?B?a0t6NWZ4YlFJS0FIZi9BWmRDeWZNODdQZ2dFc3V0Ung0Q25WS3h0OEhWVXZW?=
 =?utf-8?B?d0VSckZVQUpjT1Z0OUU0VTJMMTE4cVF0bUN3NnVzbm1kQXNNK0xJYzhHV3V6?=
 =?utf-8?B?ZjdBWFQ0eHJjMDVOMGFCaDVsQVlSQnJxL21Ra3NhRjBzbXl0Ymt0TXNubkZm?=
 =?utf-8?B?ZWN4WWY3d3NOL1VxYmZxeVU5bEYrUjJNR0hkZko0N1pJS1hLM1hYUXQ3NEN4?=
 =?utf-8?B?dnQ3WUxmUHZoWUhleDgxNkw3NmJFSEZMam1BVnFUMzd0RGlVVjdLM0IvekVR?=
 =?utf-8?Q?UAPUV08IEuH6nZzb0m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cdf0eb-c758-466a-cd46-08de947b62f5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:57:59.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjc/X75ZsfO8XkGD/zigEVoUJbC7w9u01pcn4K0HO6ENo+q7dsrlzJSHWaVilG0X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,linaro.org,collabora.com,arm.com,google.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58155-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,linaro.org:email,arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9DB2A3AB07A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 23:49, Barry Song (Xiaomi) wrote:
> From: Xueyuan Chen <Xueyuan.chen21@gmail.com>
> 
> Replace the heavy for_each_sgtable_page() iterator in system_heap_do_vmap()
> with a more efficient nested loop approach.
> 
> Instead of iterating page by page, we now iterate through the scatterlist
> entries via for_each_sgtable_sg(). Because pages within a single sg entry
> are physically contiguous, we can populate the page array with a in an
> inner loop using simple pointer math. This save a lot of time.
> 
> The WARN_ON check is also pulled out of the loop to save branch
> instructions.
> 
> Performance results mapping a 2GB buffer on Radxa O6:
> - Before: ~1440000 ns
> - After:  ~232000 ns
> (~84% reduction in iteration time, or ~6.2x faster)

Well real question is why do you care about the vmap performance?

That should basically only be used for fbdev emulation (except for VMGFX) and we absolutely don't care about performance there.

Regards,
Christian.

> 
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: T.J. Mercier <tjmercier@google.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Xueyuan Chen <Xueyuan.chen21@gmail.com>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index b3650d8fd651..769f01f0cc96 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -224,16 +224,21 @@ static void *system_heap_do_vmap(struct system_heap_buffer *buffer)
>  	int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
>  	struct page **pages = vmalloc(sizeof(struct page *) * npages);
>  	struct page **tmp = pages;
> -	struct sg_page_iter piter;
>  	void *vaddr;
> +	u32 i, j, count;
> +	struct page *base_page;
> +	struct scatterlist *sg;
>  
>  	if (!pages)
>  		return ERR_PTR(-ENOMEM);
>  
> -	for_each_sgtable_page(table, &piter, 0) {
> -		WARN_ON(tmp - pages >= npages);
> -		*tmp++ = sg_page_iter_page(&piter);
> +	for_each_sgtable_sg(table, sg, i) {
> +		base_page = sg_page(sg);
> +		count = sg->length >> PAGE_SHIFT;
> +		for (j = 0; j < count; j++)
> +			*tmp++ = base_page + j;
>  	}
> +	WARN_ON(tmp - pages != npages);
>  
>  	vaddr = vmap(pages, npages, VM_MAP, PAGE_KERNEL);
>  	vfree(pages);


