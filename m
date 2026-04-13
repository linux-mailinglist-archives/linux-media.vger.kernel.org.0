Return-Path: <linux-media+bounces-58648-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPp9Lj6w3GldVQkAu9opvQ
	(envelope-from <linux-media+bounces-58648-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:58:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7673E96FC
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C273D30054C7
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1599B3AE1AA;
	Mon, 13 Apr 2026 08:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ya7SXqP6"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43D3A5451
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776070713; cv=fail; b=k6tmRHyJyFWBJRS7Qm3Ub4aS8easPghGHFkWgCnR9T43nNUneZR1l2nFRIXFsTTh6217Hs8EC1wV5GZEhE+IxX7gRxWJwwbEaPq88j4UFgibpajzvBa046hWmZ+/0vL9E3FK20AXISoCXs6lUATu+btqXhZWuxA0BYMCszVa7/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776070713; c=relaxed/simple;
	bh=6thp7vaJrwFVpZbiF8tvRafuobjjfQBk4eifN2aY41g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bgsl7RE5L8MqlWX47vzii/qGvTYRWBUa0sQ/vefugbGv8ci8QEpF+HelAHq/VTx2nEVVjoLyyj9bPsV+Pr6Zz/viVoHFQ7368kyeM5Bm/oAi6HtVLwBT3KXhwDRz/RbqfDgcPBfLcvmH5cUPepoXVZ0htTH126bJR6E+M0mEyy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ya7SXqP6; arc=fail smtp.client-ip=52.101.85.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3fLaaupY6wAEx7kZbrY7+wb1de9JzncxObPA5UVlp1dSBhCRaOeYl56Mv//68SpxzHFwuhGoq32PeuqtDgPYQF5puj2p7Cdlt6Omv78ECovEDzWqPz30PnJsj2TbTrdMgv4155qOLVYQnk3qrtplFvL3NuJoCTvwi6mo6bsinQUMLRDJTqbMk4dvCDhOI3e3Q7Zdf5Yac7M77bYTs6Hy4NJGPGZgZx2Yro3lf+ijcHQpvNLqqkQ1DMz27p6kn9eGBSfCD69VxewYzNPjbhDqBm6CPg+Qm1sqh2bVaUI8K8ng5MdYppVy2p5waqJxlfws/qbhacyqmuasDbVPacQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmYYmJ1pdH1p+mGrX8f/T6nmsij8qV8ZEOWGdWDaG9o=;
 b=Keu4rf/uwCJ0rjYC8Ad655t0Iw07apr/Ql/wkFLwoHh4MCfGT2egiWYaKbO2PUmg35/LwZQ0FyhOpCdVFDmHy2IRv6FoGouaFlekQcNCoBkq/HAfkqSx+qwXWOhG1iliT1pB88mFrnLZMA/1yHzbA0VwPqBftqABR2DuHzyNulUkVI22JZ53YM52u3eY/I5h5MhTm1LfUVM4gofQV3xSPq6cyOQ04aiM6Y5jFV4mm2jh4J1gTb01x/FzgNNYisSh03o/AXD5io5YE0k0R/H1hJVIoZFXksW0SgRYdTa4wfYa+T11Xb/IpEuF/hjghukZ3OQwtSQWxLh6e6xNpvqrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmYYmJ1pdH1p+mGrX8f/T6nmsij8qV8ZEOWGdWDaG9o=;
 b=Ya7SXqP6Zf2pVfk6ZF/K2nnTUWBrwQRIKzrRBR6/ba8qWJoReONIMykMvCeg0AFjcV4jsM0ox5AS7x5Df29vEuWcmdSCCSX28JUD2VpLiDT8QJV15DQcnRmIM1hDoSf59wfx3voKo3B+iHTWdmc6lfUMNK0UKiYHUzLM6Wa+7GE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:58:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 08:58:28 +0000
Message-ID: <c413710b-4c28-4ed8-88ec-aeb8c4482011@amd.com>
Date: Mon, 13 Apr 2026 10:58:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 21/26] dma-buf: Add the Physical Address List DMA
 mapping type
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, iommu@lists.linux.dev,
 Kevin Tian <kevin.tian@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <21-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c1f1eb-63ac-41f1-294d-08de993ad43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VFMAuT+pet7c+l670oZ2PyerScNqa/CsamufZPVfcV8UwgHUkCZ6lq7H0UHmdL8/fAeglCwuN7STwCAONN1IhqlYje9n6yKZKIqgB38qxfytkShzyXeC46JZnGDACWE4W9A5ciDckj4fsZKdHMt8Yt5oeUMOLCv5UoOQDIWvwUJ9W7sbkTzU97yaJGXBxOJMXSdveuD6ANw4Ivt6RC1zT4DkMpxQ8s1+XoyeVfivar4wzuqGy8IaODGqITRMhqUL2c5pxCjcXNi1hSaUfuz1a1cooUM4pMBXsAz3mAirNpofRQ29+nYnVJNQhE4Qzij76rsvWM7oLyy/5tIiYbRWghEqrS3Af0L0/CLdqyjjEBSkmCanq1aszmSR5UebBZS180xPzCxpzzWrlbNVDddQnROQjF6hw2NPwObn/QArYyqdG6DSuXAHUOisULHEHUEtiKHFMPhb2/ybt19R9/g+pqWzHKmy8+ly/ErUkX9BeqPmE4GgVaCNSq5tsKORoR41A5P8TB2n3e87sXds3KaIBRS4IPBdesBU2xMZELhPTbuAj8at+5FFYMk6yih69soF89KZ2HaZ29BNppYljnTKuP3ZFGx85Nj12rJGszt5WXDYpE/QimRguBCO6NflX3onv3kMVp7b68C8Uo9y9nzbgl5B6ufCgk7TBTXzZS1W55t2pR8IFh6aVQseUWF788PN7Z3/hgbVmEcangmhRLCUb6NvdWBUcAgZ7wvEt6A/nXg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5685.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZBMDNkeXhqakxyNXZmWE80UTFJWnBzMmJ5MEc1QUNUMnQxUjRpYmhhVVkw?=
 =?utf-8?B?QTRicEdkeE80MVpieTlEYmZoeXlWNlNyc3h1azJNMS9lVXd4REJKUGMrVVVJ?=
 =?utf-8?B?a1pUZ2FGU1hEbDNDeFQ4WHdGRDhwSXQ3THorbGZtcEtPR0ZYOGxjMmQ4NlRz?=
 =?utf-8?B?NXRRc292RlI4eFA5eDNONS9FZXVDUU8ycEFnR1hwWEZKT2JYQ01RbG0yTE9G?=
 =?utf-8?B?Y1RhUFlRVXhaL3RuazkvZk42eE9kU01KY0lRY2pZcmo3NEhwa2FFVE9YNVBB?=
 =?utf-8?B?N0hEa1NwZm50ZmUzMHpGWmlPY3JoeW4yN2JmUmQwcm1ZNUFWdURQZ2dkUXR1?=
 =?utf-8?B?dG8xUEdHSUVoZmxvbkJnT1NaVXVORzIxMW5tdWJuTVJSZlE4MEd6RWU5Zk0z?=
 =?utf-8?B?cFRVMWd0a1A4QUl4MU5KamplVHk5cWZNcE4zcHBtU0toMnpMdDFleUNrMEkw?=
 =?utf-8?B?QUh1OGFPQy92NGkyeWtLbXF5czRLNEtOemhwTkczaFJrV1FUVmlsU3ZWaElK?=
 =?utf-8?B?dXdrbVpNdkt4WlA0U084TzRMc3RjYW5oK3RTWm90bmFqZFZ0M3Ezak9BWkda?=
 =?utf-8?B?QTlRWHdJcmJTNWxWNkVJSFRpZDEwdnVpUTloWTlNaU1WQm5VNEpRVDF1bXIw?=
 =?utf-8?B?MHZNYThXY1hxSEJUVzR4MHUyRHF1bzlKaWExWmVjcHZNeWQwNGpOTVFoMU5W?=
 =?utf-8?B?a3M4cm1idTJqSXQ2cWpGOGR5di83QWxNNDJ6TFdPeEZZVTc4elg0MlhOMUFT?=
 =?utf-8?B?cWtXWlZ6c01OM0ZMSWpaNEo2RGxpVkpibHlQdEsyVVRnVkoxYnpoQ0RkQW9L?=
 =?utf-8?B?Q0Q5Y0c3TFJ0cGptaHc5SHN4TndnNjlrVHdUWWlZZ2ZyWXA2TkVVZkhpOVdH?=
 =?utf-8?B?MThLelBFc2E3d3V6ZVlHTGYwU1J0ZFNUb0ZxNUlId1ZONDM2UGZqWkRUTzFj?=
 =?utf-8?B?SG1yZHhieHNMUGFlYVNqamc3Tk14NUxoemJVZHg2Vlljb1prNU5KbEQ2SUJk?=
 =?utf-8?B?bkJHR1pxQ2ZPODlXazJURitzQ1UvWjA1VkRYWDVCMkdYTk45Z090VzdSOU5H?=
 =?utf-8?B?VXV6dWxxWkdEa1A4dUFpeXZpemdoNmhLcnkwL25UTFlwTmlhanJjald1RElD?=
 =?utf-8?B?eTgyV1lEUjZzeXpiVFU4dVAxZkZiSG9oMHNXVnVEZmRQTlFFekgyOEp2ckJz?=
 =?utf-8?B?ZVJwSFozQ0lxZzVEQVZwcXVyZDJYYUNXYWZWWnUzZmxaR1FKOXh2N1BGK0dQ?=
 =?utf-8?B?QVl2ZVJpa0ord0VMUWxEQmJRVXE1cVM1c3NxeEdHUThndXNIU2tKa01XejhN?=
 =?utf-8?B?YjBESldTQjVzaWduWFBxSVYrSysxUXoxYTBDcWVlOUFsdzJGaGdkMUl0aEI4?=
 =?utf-8?B?cG5mV0RTZ3VmcllHSDNSeE9qQjloYjhrUnFYdERJenZ5L2hjVlUvbDlGYi9E?=
 =?utf-8?B?WWJNRnNUVGdpbDkzV29rdXNyNFFpSG1BSmlTQURLWkwya2RpZldXajJvYktG?=
 =?utf-8?B?RkNvNktCOFZLYTZNdlpMcURWMk1HMWRwUGtpZzVuandjTUFFV2dBcDJBNVNm?=
 =?utf-8?B?ckY5Qmc4eVcyd1Myb3RoYjczWlVaNitzc3NZUnRYSU5BUFBDcmZSdkxPUzZM?=
 =?utf-8?B?MXVKd2NIbVJWMWtpZXNKcFM2RGpXVERlQm9nb3N2YlFQODNuOTY2ZjZ1WXh0?=
 =?utf-8?B?WmY0RlIzdE9rVzEvTHNhMEJSVmpEWXBVQzh0dzBpam45b2FzZWptZS9HbThO?=
 =?utf-8?B?eFRFUG5nRUZ0M1NodjhveWRKeWdNdGkwM3FBMkNkV2lYVlNGSTlWMUEzUVRM?=
 =?utf-8?B?UWJ4T2YzYnBwYkN1Y0hKS2lFSFlwNGNuSVR6YjJUdWdvd2Ird0o2Uy9jMVR3?=
 =?utf-8?B?SGJCSzRyd3BYbGMvdG9QWjN4U3F0RnkrdUlYY3Z0T0g4aWNsTzVlSlpFRmQz?=
 =?utf-8?B?VG1ISThkZ2FqV2NjamZ4MXdZblVJdVlCb0YzMDBVeTFJdkZjSS9GWWl5blFD?=
 =?utf-8?B?VGZuRVFoNktRY2Vmb1VURFdmcVBjV0hydmgzelkwUWdXc1puYkRFRlAzVFRW?=
 =?utf-8?B?b25KUWZmdHU2Tm9KcDR1VVhjSU1STktDYmtocUhjVDVUVWVLK1ExN2tuQnky?=
 =?utf-8?B?SGk1T1V4MXdIOGhsMUdKUTFMM3ZoZEp5UzBGZGJaWFRqaTBtc0MzN0N3ZVVi?=
 =?utf-8?B?TEVZS1FzbGtJR1lGaEtQUUY5eDlOaTRTaFVzRzF2QkxLWGdNZS9Wblkwd3o1?=
 =?utf-8?B?Z0lDdlhSUktqQjdIaG9XZUpCUnhHMWNXc2JCNlVoQkhOTUhDRE9aYk9sNmJj?=
 =?utf-8?Q?S0h4Nb/ZA0/IuyrH8w?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c1f1eb-63ac-41f1-294d-08de993ad43d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:58:28.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNrmYWqfnAQJJzswmB2U5gVYqykb3svm/hFGDSxLzqR8DbMqAsAOa8oVZGzAKGHV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58648-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F7673E96FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2/18/26 01:11, Jason Gunthorpe wrote:
> This type is required by iommufd and kvm as dmabuf importers.
> 
> Due to sensitivity about abusing physical addresses, restrict importers by
> using EXPORT_SYMBOL_FOR_MODULES(). Only iommufd can implement an importer,
> the kernel module loader will enforce this.
> 
> Allow anything to implement an exporter as there are use cases in
> DPDK/SPDK to connect GPU memory into VFIO/iommufd and it is hard to abuse
> the API as an exporter.
> 
> The physical address list exporter returns a physical address list in a
> simple kvalloc'd array of struct phys_vec.

As far as I can see that is still a pretty big NO-GO.

We have seen so many problems with direct physical address access by the importer that I clear don't want to repeat that performance.

My main question is why does IOMMUFD need the physical address in the first place?

If that is really strictly necessary then I strongly suggest to not touch drivers/dma-buf in any way, but only do this is private interface between iommufd and KVM.

Regards,
Christian.

> 
> For now all entries are assumed to be MMIO and iommufd will map into
> the IOMMU using the IOMMU_MMIO flag.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/dma-buf/dma-buf-mapping.c | 63 +++++++++++++++++++++++++++++++
>  include/linux/dma-buf-mapping.h   | 42 +++++++++++++++++++++
>  2 files changed, 105 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index baa96b37e2c6bd..d9d6b9b5bf05c6 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -349,3 +349,66 @@ struct dma_buf_mapping_type dma_buf_mapping_sgt_type = {
>  	.debugfs_dump = dma_buf_sgt_debugfs_dump,
>  };
>  EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_sgt_type, "DMA_BUF");
> +
> +static const struct dma_buf_mapping_pal_exp_ops *
> +to_pal_exp_ops(struct dma_buf_attachment *attach)
> +{
> +	return container_of(attach->map_type.exp_ops,
> +			    struct dma_buf_mapping_pal_exp_ops, ops);
> +}
> +
> +/**
> + * dma_buf_pal_map_phys - Obtain the physical address list for a PAL attachment
> + * @attach: The DMA-buf attachment
> + *
> + * Calls the exporter's map_phys() callback to retrieve the physical address
> + * list for the buffer. The caller must hold the dma-buf's reservation lock.
> + *
> + * This symbol is restricted to iommufd to prevent misuse.
> + *
> + * Returns the physical address list on success, or an ERR_PTR on failure.
> + * The returned list must be freed with dma_buf_pal_unmap_phys().
> + */
> +struct dma_buf_phys_list *
> +dma_buf_pal_map_phys(struct dma_buf_attachment *attach)
> +{
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +	return to_pal_exp_ops(attach)->map_phys(attach);
> +}
> +/*
> + * Restricted, iommufd is the only importer allowed to prevent misuse of this
> + * API.
> + */
> +EXPORT_SYMBOL_FOR_MODULES(dma_buf_pal_map_phys, "iommufd");
> +
> +/**
> + * dma_buf_pal_unmap_phys - Unmap a physical address list
> + * @attach: The DMA-buf attachment
> + * @phys: The physical address list returned by dma_buf_pal_map_phys()
> + *
> + * Returns the mapping back to the exporter. After this point the importer may
> + * not touch any of the addresses in any way.
> + */
> +void dma_buf_pal_unmap_phys(struct dma_buf_attachment *attach,
> +			    struct dma_buf_phys_list *phys)
> +{
> +	to_pal_exp_ops(attach)->unmap_phys(attach, phys);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_pal_unmap_phys, "DMA_BUF");
> +
> +static inline void
> +dma_buf_pal_finish_match(struct dma_buf_match_args *args,
> +			 const struct dma_buf_mapping_match *exp,
> +			 const struct dma_buf_mapping_match *imp)
> +{
> +	args->attach->map_type = (struct dma_buf_mapping_match){
> +		.type = &dma_buf_mapping_pal_type,
> +		.exp_ops = exp->exp_ops,
> +	};
> +}
> +
> +struct dma_buf_mapping_type dma_buf_mapping_pal_type = {
> +	.name = "Physical Address List",
> +	.finish_match = dma_buf_pal_finish_match,
> +};
> +EXPORT_SYMBOL_NS_GPL(dma_buf_mapping_pal_type, "DMA_BUF");
> diff --git a/include/linux/dma-buf-mapping.h b/include/linux/dma-buf-mapping.h
> index ac859b8913edcd..10831ce2e72851 100644
> --- a/include/linux/dma-buf-mapping.h
> +++ b/include/linux/dma-buf-mapping.h
> @@ -269,4 +269,46 @@ DMA_BUF_EMAPPING_SGT_P2P(const struct dma_buf_mapping_sgt_exp_ops *exp_ops,
>  			.exporter_requires_p2p = DMA_SGT_NO_P2P,         \
>  		} })
>  
> +/*
> + * Physical Address List mapping type
> + *
> + * Use of the Physical Address List type is restricted to prevent abuse of the
> + * physical addresses API. Please check with the DMA BUF maintainers before
> + * trying to use it.
> + */
> +struct dma_buf_phys_list {
> +	size_t length;
> +	struct dma_buf_phys_vec phys[] __counted_by(length);
> +};
> +
> +extern struct dma_buf_mapping_type dma_buf_mapping_pal_type;
> +
> +struct dma_buf_mapping_pal_exp_ops {
> +	struct dma_buf_mapping_exp_ops ops;
> +	struct dma_buf_phys_list *(*map_phys)(struct dma_buf_attachment *attach);
> +	void (*unmap_phys)(struct dma_buf_attachment *attach,
> +			   struct dma_buf_phys_list *phys);
> +};
> +
> +struct dma_buf_phys_list *
> +dma_buf_pal_map_phys(struct dma_buf_attachment *attach);
> +void dma_buf_pal_unmap_phys(struct dma_buf_attachment *attach,
> +			    struct dma_buf_phys_list *phys);
> +
> +static inline struct dma_buf_mapping_match DMA_BUF_IMAPPING_PAL(void)
> +{
> +	return (struct dma_buf_mapping_match){
> +		.type = &dma_buf_mapping_pal_type,
> +	};
> +}
> +
> +static inline struct dma_buf_mapping_match
> +DMA_BUF_EMAPPING_PAL(const struct dma_buf_mapping_pal_exp_ops *exp_ops)
> +{
> +	return (struct dma_buf_mapping_match){
> +		.type = &dma_buf_mapping_pal_type,
> +		.exp_ops = &exp_ops->ops,
> +	};
> +}
> +
>  #endif


