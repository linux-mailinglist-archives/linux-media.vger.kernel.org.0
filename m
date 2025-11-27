Return-Path: <linux-media+bounces-47832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2161BC8F346
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 16:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6E6964F295B
	for <lists+linux-media@lfdr.de>; Thu, 27 Nov 2025 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8514E334395;
	Thu, 27 Nov 2025 15:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PZtKBZ3p"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4340227E074;
	Thu, 27 Nov 2025 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256122; cv=fail; b=BIY0eLt7arrGoSgd9IzHmNj6GpMkqEv7H2v096L36jjGfYXwJlM3X+8uYClPHfom2e4pNeWfZiYu+hzpy47+5AZZO/KYmPBMtH0r5UvpYQ11we8jnmZ2lMpSTHiPCEl+oSbYrr0WnGG2Yrj1DTH7V0SEFchjmID+6LLxQDAIa1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256122; c=relaxed/simple;
	bh=PQx+rdO4g638RH4D3f45qUUlDPRedC+gOhAOV9YAhuQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aPkNFaLhg2o46PT27njNtTJOwfJyNaCbbWuhpyc2mzXJq+hEISYXfdhQHXYg47Loa+j5ewfN5lcCTI+6OjFdB55n1Npxy34fLErlGQY2AaUQ985ARqPEpO50uRO8HhZbbeSRBFr20+yuOVXNRjLTP+c4ZzNCaRm7UiwtEWd8fN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PZtKBZ3p; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXIcntSNrjNe81ev9Jjw0oGa3eoKFkPZGkzewEcNGhXLmLYe7vjFNpxKtVEBsTuprKD5drpSIl64U8Gg0S2hIVCp61dh0fzf37zJKJAQDvVcD38K/3FI6pNuD0nTCXOoIgj3OEyzt3o8jx+OIQpluQ3keuK+cJoy7A6OUJY71TM/8ufkU0xOhuWIGpM9LRFVSDTSN4uJUvt10NohLBMf/7HRdaorokkp44pepBs1gl75burRznSgcvJaeC9Za5UMvHTamgp4WQBikAVq90VMLM47dasB+wvWuVu/9zQkOeGO8FZfUm6NpcQJH+UDfYB+fA7pfuMer7PDMBdoc/X6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5b3uqVnF9AmscE8k7b8pS6zDo6TLatoGpyElX3gR88=;
 b=klZB+bzNjD5u8bfy72SnkpPhEEJbpGS9qmmnD+qbkEb+pLr6LuRsJS43bPeGS1i8z4HBOtgUBx5OgDOURCx6+FJEvfhGASQHt9UymwwuZqc8mOOY+MmN5lXCABERFX0PS4WKqKb4gBuRQ6et52bWYtJCQpGFvfqGx82XQBeI/g6YMm6SXWPJ/smRJaCcbY9B62rexaTxRRbDy7iHBtZu7TAqB76T2fO2SFZyWJbuN3AZQPGPjbD5yn16VJhY59b89fVAEt79Wm4KHe0b1qydTuorP4zWpUx92OWthqoeEZfO7Bk2HEWRQ7FA08R+rM6oKqKs6VLa4RbjDIEge5NhgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5b3uqVnF9AmscE8k7b8pS6zDo6TLatoGpyElX3gR88=;
 b=PZtKBZ3pgyjkmjh9ds5KvKcddOOSxWi7D/kLVQRQPQaBM0yTyJ0vPgeIb8MEACPH1TUPndLT4LDy9ZZsfCSNf+yq010y6wB+GvFjH37WfEljum91HztOBkgr386fHM9oJIC1DexXD+EqQg/p92QCCMeVd/uKNefcJ2MlBonUKtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 15:08:38 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 15:08:38 +0000
Message-ID: <39263b3b-3574-43ae-aec1-73fe39e29f10@amd.com>
Date: Thu, 27 Nov 2025 10:08:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] amd/amdkfd: Ignore return code of dma_fence_signal()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-4-phasta@kernel.org>
 <cef83fed-5994-4c77-962c-9c7aac9f7306@amd.com>
 <d46f753e660694ab46c65409a5e43f050b7eb2d9.camel@mailbox.org>
 <b1c3dd51-1ba9-4036-b964-8e9f4350bbee@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <b1c3dd51-1ba9-4036-b964-8e9f4350bbee@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:208:2be::27) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d61620-32c3-4d1d-71b0-08de2dc6d7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enhkSFI4ZGw3aUtZdys1eXlhRTRDcnozN2NuLzZqLzU3QkNNTTFnbTl1bUNL?=
 =?utf-8?B?bkp3eC9lNVlZN1dVZVJWSG9ucXl3bWVFQjFCRlJ5aW5DazMvOVB6S3JaOGtW?=
 =?utf-8?B?ODIvMlcxVGFNTEpZRFRYM25QK1hIUGFQQTBOaFRrdjQ3S2tqMy9lSFY1L3gy?=
 =?utf-8?B?UWFZLzVtUHdlbEZ0M21vcmdhcFJic0pNT3dPOU5odHVHNzhrcFJOQVlxZTRJ?=
 =?utf-8?B?Vm9kaXZaUUs4VHRYZlYrdVk0dGp3WGcwcmdmMGU3bUdoaVdPb1BiclI2S3BB?=
 =?utf-8?B?OENNNytjQ2Rwc1grVHRtYVdWazgwK3FZU3JmRHl6WkZVOTgyamZJMlRRbDl2?=
 =?utf-8?B?QUs3L2drMC9XUVNZQm9GWTU0b0xMVzRmQktpQThRSERKcHRTZVFXNFdHejVp?=
 =?utf-8?B?M3J5Y1BpY0JDaFpwVmY3SU1xNDE2Zm9GLytQa0tEM1FlUnNiLzJlczYreGpE?=
 =?utf-8?B?c0FQMkoxRXBjYjJ2R3llM2tqUVdJZm8rTytjMWlEVkxYZlF4RTA4UnRqWXhp?=
 =?utf-8?B?MUpTWlVMTFg4bXFoQUZSanpzSEV4QTVGc3NrWFdhZ05iYWxOeExuZlJPNngr?=
 =?utf-8?B?a3dkUDJPWDBKT2lxbHYwMkJDTVN4OWRsTGxWenpPaTdYY1VSN0p6ejZWem42?=
 =?utf-8?B?UHZVekNQaGgwb2xiSmtUQU5UeVBoQ211WWx3UXdqaFYzUTg1dFdEUVNXd0xT?=
 =?utf-8?B?SUdlNWc1Z0Z4SDlJVEcyWWU3K20xVHpRQlREdFRjQm05RnZ3cmFRcXJHQTFO?=
 =?utf-8?B?QjVCd1dyOHUwOTRlYm90b2xSVFJkekFFWXEwR1BGTDg2YnZMM0IwZTgvQXdj?=
 =?utf-8?B?ejV0MUFVa3cwdHB1V0ppREhBUnhBektnRXJ0OENJNFh6QWNFSXc5SlQ0dUhh?=
 =?utf-8?B?QjlnQlVzeDJsR0RqeEJXTis3SnVabCtjTGh0OVpUcEdyQ0hCLy9jcWI3NjdC?=
 =?utf-8?B?OHY4cTkzMWoxKzcyOGhuVWRjWHJEVWtacnVTUng0eHl5aVpFamFNa09NQ3p5?=
 =?utf-8?B?VEdyeno0SFIrRW9oSmYvVTRhWVBmNlNIamFKcXFlb0lBcGhKUGZ6RmVudmI4?=
 =?utf-8?B?RE5hVUNFT2U2SEc4MnpvSDZNTTk5ait6MG81T3dCeFVHQlFrZ1Y1Y0RKMy9K?=
 =?utf-8?B?QVFLbFFEK0wxMHVNNTE3elR4b3pkMWdtMVQxbDltVFhGb3Q4cFlJWWEvajhv?=
 =?utf-8?B?amhvMFVHcUJ1Rjhkek81RVd1VTAzeFY2cEpSaDdacm1xbnQvMEdGYkY3d1hm?=
 =?utf-8?B?OFdMZGNBMDliVFBJNGNreVhCMmNTNHo3Qjl0ZlZlOU9talV6Q3BSQXBNVWVq?=
 =?utf-8?B?dEFoV2VTY2MwbTh4SS8xdXFMSE03WFV6eUR3VXdpUXlFTUlOYnkzTWhUMWly?=
 =?utf-8?B?OTZ0bitFOXhZY0VTRjlFendVeVM2V3FrYjZzMnlTWTNtNVN2c2dHd3RvMHpV?=
 =?utf-8?B?WkF0QWtXSTZhWjhnaU0rVkZMdGhHRXR6Y3ByZkpSUzVWTXYrSDkzMFl0UDJq?=
 =?utf-8?B?a0Y2czFGOUY1UkUwa3UyUDhmR2NKQ1UzQzlJQWo5YTdZVVRJWVhRcWs0eVNO?=
 =?utf-8?B?cnl2dzlvOVdQRFY0TERDQW44N2Q1VDdVc2ZSV1Qyd25nUzFlZWZ6Rndnc3Bx?=
 =?utf-8?B?ejZWUG1HR25IcW55d2phM0xic1p0bmZDQjh3bU9rS1cxOUIreFd6SmlyQTNU?=
 =?utf-8?B?TFNrVmRkVVJOL3FnUTlqem9nMDJoeXlBcU5aNUVrRkU4eUpBQXllVHVseitM?=
 =?utf-8?B?ZGhERmNoN2t1cVBzcDZnMW9Mb1p1aUdzRHliSnFSRlhCL1VhaXhGVGxPdERU?=
 =?utf-8?B?UFl1aHVTQ2FqblhPc3YwRnIxc2RScXJmaDNnWnhGSFo2RUpDby83MG40Tmxi?=
 =?utf-8?B?RVFaYThDdHVSQ0RyL0s3SVVOUWsvak0yeSt4SlF0NmdkTlErZmFLUE0yQWg3?=
 =?utf-8?B?TUFwaHZqNGlEcC9nWXNSaGo5Y0dOMXNLRjRHa1dGdCtPdm0yK0JIYTdpZ1Z1?=
 =?utf-8?B?YjdNdkhFVVVnT2lpN0N5WXM0RkdtY0hGSFJMNWs4VmhjTVc2eHU2Qkh6RnJV?=
 =?utf-8?Q?bCIIxW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blBRUXNSZVhjeElTWFZSK3R3ZE9sblhSYkEvWUdhWGhoYUdWUlJRS0JWWVFY?=
 =?utf-8?B?blRSblZSUkFiRjlFVnBvVlB5aFAxZUZTd1R6TEc1WWZCemVVS242ZEI5SlhR?=
 =?utf-8?B?am1DTjFqSElRWis5SVhKY3RnTTF4V1RLcXZXVmN4eWpzTGlHTmtRMm02OEpW?=
 =?utf-8?B?ajJvSjlEaDNvaVZXLzJ0MnFRbHE5bDFCNEJJd3oya2QvbjFRbFJ5NngvS216?=
 =?utf-8?B?QkoxZWhqdUpVRTZlU1NxYjBHTnIwV3dzamZxbTRWeStrZ1JWTXVQTFc3cloz?=
 =?utf-8?B?MzBFc1hpL0pndXlLd1VYcEFPem9Kalc3K0VDU3R1NFVkcWhuTDRmMmdodndB?=
 =?utf-8?B?WGRjeHByTEVHbEtRelVEdjNnYTliM2hqRGNTNG5VczQ1NjFud2ZBTFV5TkJM?=
 =?utf-8?B?WjFlMytlemRtV09lbnNib3kxeDhJVytqdVhuODBOYTNDcXFETmdCc2kxY3JR?=
 =?utf-8?B?bjl3aFVWY3k3YTg2T3ZySVZZR1lFcm0zRUF6alV5TVdzbXdGeW5sWWRZSjdj?=
 =?utf-8?B?YXZNYzZnS3RvUkV1L2ttVVZDZW1YcldaOTRHNGhiTHhteHRTcC82TFA2TWNS?=
 =?utf-8?B?NFMzSHgvdUhGc1BMVXpwQm00N3hVekdWZk5pbU5qaUc2emZubFVqeVpIOXBp?=
 =?utf-8?B?Z3Y5MkJGeTZ5b0lnWjgrV2picEsrQXJTa25KM2k1TjJDeEVoVmc0d3lmRkUr?=
 =?utf-8?B?OHlPSloxSFVsc2J1UTdld3JlRWhjZ3Foa1RXSDUxTzZ4K21GSnB2NElWMDlZ?=
 =?utf-8?B?dS9xVk1ZaUs2azh3R01TcGY0YlpGdmE2Nzc2L3lneklPanBvUlFobENrUFJ2?=
 =?utf-8?B?S3RqRE5HKzV3eGk5Y0x3Yi80V29vOHFWTktlbGNWb3FwaDVVMk9NYmorVHFB?=
 =?utf-8?B?cGRZd1E1RmZUcXkzblY1YXVsQ1BxV2tBRzZ1QkNSZjV0YmYxbUNVbk5iK2tF?=
 =?utf-8?B?cG4vSURrL2pheFc0QzcwNE9sM1hnWWw2NFhYbUZWNUx3ajg3TThnSTdzVDcr?=
 =?utf-8?B?RUhlOGhQcnpzZ3VIRG9wcUlvSVQrL21rN3pHVTIrR3J3ZVZTWmsxMHpuSm9Y?=
 =?utf-8?B?L3U0bldoMUhKMDNGMGhSTmU5S2lhSk1aL3l6Z3JYUC9FTFdMVDlVODl4dTdU?=
 =?utf-8?B?bk9Vb3loN2xRN3o0eDBFZ004ODBXSWpCNEZSME5vbFlBZlVDWkt1Wmo0Tkpr?=
 =?utf-8?B?L0hMWjR2WU0zNHNxYUU0YnAwdk5lNUtMbzdwSlVWb0huNVBYbkVTcCtGQ1Jo?=
 =?utf-8?B?UHBxTnJUZUJXUmszbW1BS3A3N3FDNk10OUJUbnNWVndHUEZMS0lxZXpJUU9P?=
 =?utf-8?B?WlFuZDF2M09JcElmYkpsZGFtSGhwcmdnOXNDVDlRYmdZb3NydzNpRU84YW9n?=
 =?utf-8?B?bTVYeHhJUHVRMURXK1dxemJMakZIQ01kK2dyZjk0MC9IdVlFMnMvWmZ4UlF2?=
 =?utf-8?B?SEs1ZkdPSXhjWTVHZHByYlU2NVJRQ011OW1qUGF4Y2c3TXhPdm56Y0hhRXgx?=
 =?utf-8?B?c3lGbzBPWUlYUkZyYmFkSi85bmV3dW5CeVU2VkRxb1BFVU5RMFNiekozOXl6?=
 =?utf-8?B?dkZmQ2VYYlQ1TFhKSVVPQ2hkQUJOTVh1NzYyZXlaQzBYVGxSdk5yamxlZjB3?=
 =?utf-8?B?aC9YNmtiZHJGOWFLbFVPTEN4amRsS3ZXc2VabzdsWmc5MnRzZWdQNElPbW9p?=
 =?utf-8?B?bkRKRDIvYlFvY25TaUhEUWVnZGpRZTBmaFFSdTFuanpVVGZSbVZqaDdubjNK?=
 =?utf-8?B?SUt4OXNza3d6M1NDUjZBVGFvb2ZsL2VBSlRseG5EazErZWl1VmU5L1lRSStr?=
 =?utf-8?B?THRYY0t0RWp5Ty9mMFN5Tk5NbW1ySFdxMml0OG1QNGhta3dnaDNBb1QzVUhv?=
 =?utf-8?B?YnkyVkU5dTdmdW9PT2M2K1VTRXJuMURpK0VGUnVlR0VzUU9YeG40LzE1eGI1?=
 =?utf-8?B?R1E5bm5RSmxYMlJIMllXWGpkZDdvd2JLQkEreTFKRDdyTXJCUlBVdFVPNk44?=
 =?utf-8?B?K28rWGJDaEF4NHFQTVlxdXFlRWV1OHNINXkyQzBpeDhuR2l0ekdqZURYditq?=
 =?utf-8?B?Yi9RTHVuZDl3TG5UcWthKy9QN21FZ1A0VjBJRXczSGpOdHZrN2dDdmREa01F?=
 =?utf-8?Q?rhvfxh5dXMKEHx1pfQ0tcOFZx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d61620-32c3-4d1d-71b0-08de2dc6d7cf
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 15:08:38.2160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp4E19JwYYC4uA8NhwobfiZhnX1yKGl5/BPkfOkwGrt2eqGMjf1xlE6CfbynG6mSpcQIJBADsiCT7UJU0vm9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235

On 2025-11-27 04:55, Christian König wrote:
> On 11/27/25 10:48, Philipp Stanner wrote:
>> On Wed, 2025-11-26 at 16:24 -0500, Kuehling, Felix wrote:
>>> On 2025-11-26 08:19, Philipp Stanner wrote:
>>>> The return code of dma_fence_signal() is not really useful as there is
>>>> nothing reasonable to do if a fence was already signaled. That return
>>>> code shall be removed from the kernel.
>>>>
>>>> Ignore dma_fence_signal()'s return code.
>>> I think this is not correct. Looking at the comment in
>>> evict_process_worker, we use the return value to decide a race
>>> conditions where multiple threads are trying to signal the eviction
>>> fence. Only one of them should schedule the restore work. And the other
>>> ones need to increment the reference count to keep evictions balanced.
>> Thank you for pointing that out. Seems then amdkfd is the only user who
>> actually relies on the feature. See below
>>
>>> Regards,
>>>     Felix
>>>
>>>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdkfd/kfd_process.c | 5 ++---
>>>>    1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> index ddfe30c13e9d..950fafa4b3c3 100644
>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
>>>> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>>>>    static int signal_eviction_fence(struct kfd_process *p)
>>>>    {
>>>>    	struct dma_fence *ef;
>>>> -	int ret;
>>>>    
>>>>    	rcu_read_lock();
>>>>    	ef = dma_fence_get_rcu_safe(&p->ef);
>>>> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>>>>    	if (!ef)
>>>>    		return -EINVAL;
>>>>    
>>>> -	ret = dma_fence_signal(ef);
>>>> +	dma_fence_signal(ef);
>> The issue now is that dma_fence_signal()'s return code is actually non-
>> racy, because check + bit-set are protected by lock.
>>
>> Christian's new spinlock series would add a lock function for fences:
>> https://lore.kernel.org/dri-devel/20251113145332.16805-5-christian.koenig@amd.com/
>>
>>
>> So I suppose this should work:
>>
>> dma_fence_lock_irqsave(ef, flags);
>> if (dma_fence_test_signaled_flag(ef)) {
>> 	dma_fence_unlock_irqrestore(ef, flags);
>> 	return true;
>> }
>> dma_fence_signal_locked(ef);
>> dma_fence_unlock_irqrestore(ef, flags);
>>
>> return false;
>>
>>
>> + some cosmetic adjustments for the boolean of course.
>>
>>
>> Would that fly and be reasonable? @Felix, Christian.
> I was just about to reply with the same idea when your mail arrived.

I agree as well. The important feature is that we need to test and 
signal the fence atomically. It may even make sense to add a function 
for that "dma_fence_test_and_signal" that preserves the original 
behaviour of dma_fence_signal. ;)

Regards,
   Felix


>
> So yes looks totally reasonable to me.
>
> Regards,
> Christian.
>
>>
>> P.

